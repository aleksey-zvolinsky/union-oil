unit TextFunc;

interface

uses uCommonForm,  Classes,uOilQuery,Ora, uOilStoredProc;

function SatisfySmallPat(p_Str,p_Pat:string;p_First:integer=1):integer;
procedure SatisfyMiddlePat(p_Str,p_Pat:string;var pp_Min,pp_Max,pp_Size:integer;const p_First:integer=1);
function SatisfyPattern(p_Str,p_Pat:string;p_First:integer=1):integer;
function SatisfyPatternExact(p_Str,p_Pat:string):Boolean;
function SatisfyPatternList(p_Str:string;p_PatList:array of string;p_First:integer=1):integer;
function GetNiceSql(p_Sql:string):string;
procedure FindPattern(p_Str,p_Pat:string;var pp_Next:integer;var pp_Res:string;p_Begin:integer=1);
function GetFieldList(p_Sql: string): string;

implementation

uses ExFunc,OilStd,Math,SysUtils,Dialogs;

var NumberSet: TCharSet = ['0'..'9'];
    SpaceSet: TCharSet = [' ',#9];

    ShiftWords:string=',select,from,where,group by,order by,having,';
    NoNextLineWords:string=',and,or,';
    SymNoNextSpace:string='(<>=+-*/'; // �������, ����� �� �������� �� ���� �������� �������
    SymNoPrevSpace:string=')<>=+-*/'; // �������, ����� �������� �� ���� �������� �������
    SymNextSpace:array[1..2] of string=(',','*/');
    SymPrevSpace:array[1..1] of string=('/*');
    MaxWidth:integer=100;
    TabSize:integer=4;

    SqlPrimitivs:array[1..5] of string =
        ('\K','/\*.*?\*/','[^( ]+\O','\O','\S+');

    SqlWords:array[1..7] of string =
        ('\Q as \Q,?',
         '\s+\Q\s*[<>=]+\s*\Q',
         '\s+\Q\s*in\s*\O',
         'group by',
         'order by',
         'union all',
         '\Q'
        );

    Depth:integer=0;
    LogLevel:integer=10;
    LogFileName:string='111.log';
//==============================================================================
procedure Log(p_Text:string;p_Level:integer=0);
var F:TextFile;
begin
    exit;
    if p_Level>LogLevel then exit;
    AssignFile(F,GetMainDir+LogFileName);
    try Append(F) except Rewrite(F) end;
    Writeln(F,p_Text);
    CloseFile(F);
end;
//==============================================================================
function ReplaceComments(p_Sql:string):string;
// �������� ����������� ���� --... �� /* ... */
var i,n:integer;
    InsideApostrophe:Boolean;
begin
    p_Sql:=p_Sql+#13#10;
    i:=1; InsideApostrophe:=FALSE;
    result:='';
    while i<=length(p_Sql)-2 do begin
       if (p_Sql[i]='-') and (p_Sql[i+1]='-') and (not InsideApostrophe) then begin
           n:=Instr(#13#10,p_Sql,i);
           result:=result+'/*'+copy(p_Sql,i+2,n-i-2)+'*/ ';
           i:=n-1;
       end else begin
           if p_Sql[i]='''' then InsideApostrophe:=not InsideApostrophe;
           result:=result+p_Sql[i];
       end;
       inc(i);
    end;
end;
//==============================================================================
function GetFormattedSql(p_Sql:string;p_TabLevel:integer=0):string;
var i,n,len:integer;
    tab,shift,s,head,res:string;

    procedure PutWord(p_Word:string);
    begin
        if (res<>'') and (res[length(res)]=#10) then begin
           res:=res+tab+shift;
           len:=p_TabLevel+TabSize;
        end;
        if len<MaxWidth then begin
           res:=res+' '+p_Word;
           len:=len+length(p_Word)+1;
        end else begin
           res:=res+#13#10+tab+shift+p_Word;
           len:=p_TabLevel+TabSize+length(p_Word);
        end;
    end;

begin
    tab:=pad('',p_TabLevel);
    shift:=pad('',TabSize);
    i:=1; res:=''; len:=0;
    while i<=length(p_Sql) do begin
        n:=SatisfyPatternList(p_Sql,SqlWords,i);
        log('n='+IntToStr(n)+'; i='+IntToStr(i));
        //if (n>6000) and (n<7000) then showmessage('!!!');
        if n in [0,i] then inc(i)
        else begin
           s:=copy(p_Sql,i,n-i);
           if lowercase(s)='select' then res:=res+s+#13#10
           else if lowercase(copy(s,1,7))='(select' then begin
              res:=res+#13#10+tab+shift+'('+GetFormattedSql(copy(s,2,length(s)-2),p_TabLevel+TabSize)+tab+')';
           end else if lowercase(copy(s,1,5))='union' then res:=res+#13#10+tab+uppercase(s)+#13#10#13#10+tab
           else if pos(','+lowercase(s)+',',ShiftWords)<>0 then begin
              res:=res+decode([res[length(res)],#10,'',#13#10])+tab+s+#13#10;
              head:=lowercase(s);
           end else begin
              //res:=res+tab+shift+s;
              PutWord(s);
              //if (pos(','+lowercase(s)+',',NoNextLineWords)=0) and ((head<>'from') or (s[length(s)]=',')) then res:=res+#13#10
              //else res:=res+' ';
           end;
           i:=n;
        end;
    end;
    result:=res;
end;
//==============================================================================
function GetNiceSql(p_Sql:string):string;
var i:integer;
begin
    p_Sql:=ReplaceComments(p_Sql); // �������� ����������� ���� --... �� /*...*/
    p_Sql:=ReplaceAllSubstr(p_Sql,#13#10,' '); // ��� �������� ����� �������� �� �������
    p_Sql:=RemoveDuplSymbols(p_Sql); // ������� ��� ��������� �������
    p_Sql:=ReplaceAllSubstr(p_Sql,#9,''); // ������� ��� ���������
    for i:=1 to length(SymNoNextSpace) do // ������� ������� ����� ��������, ����� ������� ������� �� �����
        p_Sql:=ReplaceAllSubstr(p_Sql,SymNoNextSpace[i]+' ',SymNoNextSpace[i]);
    for i:=1 to length(SymNoNextSpace) do // ������� ������� ����� ���������, ����� �������� ������� �� �����
        p_Sql:=ReplaceAllSubstr(p_Sql,' '+SymNoPrevSpace[i],SymNoPrevSpace[i]);
    for i:=1 to length(SymNextSpace) do // ��������� ������� ��� �����
        p_Sql:=ReplaceAllSubstr(p_Sql,SymNextSpace[i],SymNextSpace[i]+' ');
    for i:=1 to length(SymPrevSpace) do // ��������� ������� ��� �����
        p_Sql:=ReplaceAllSubstr(p_Sql,SymPrevSpace[i],' '+SymPrevSpace[i]);
    p_Sql:=RemoveDuplSymbols(p_Sql); // ������� ��� ��������� �������

    result:=GetFormattedSql(p_Sql);
    log(TranslateText('����� ')+DateToStr(Date)+' '+TimeToStr(Time));
end;
//==============================================================================
function GetPosOfCloseBracket(p_Str:string;p_First:integer;p_Brackets:string='()'):integer;
// ���� ��������� ����������� ������. p_First - ������� �����������.
// ������ ������ ������ ������������
// ���� ������ ���, �� ���������� ����
var i,n:integer;
begin
    n:=1;
    for i:=p_First+1 to length(p_Str) do
        if p_Str[i]=p_Brackets[1] then inc(n)
        else if p_Str[i]=p_Brackets[2] then begin
            dec(n);
            if n=0 then begin
               result:=i;
               exit;
            end;
        end;
    result:=0;
end;
//==============================================================================
function GetPosOfCloseQuota(p_Str:string;p_First:integer;p_Quota:char='''';p_Doubling:Boolean=TRUE):integer;
// ���� ��������� ����������� �������. p_First - ������� �����������.
// ���� Doubling, �� ��� ������� ������ ������������
// ���� ������� ���, �� ���������� ����
var i:integer;
begin
    p_Str:=p_Str+' '; i:=p_First+1;
    while i<length(p_Str) do begin
       if p_Str[i]=p_Quota then
          if p_Str[i+1]=p_Quota then inc(i)
          else begin
             result:=i; exit;
          end;
       inc(i);
    end;
    result:=0;
end;
//==============================================================================
function GetNextPatternWord(p_Pat:string;var pp_Word:string;p_First:integer=1):integer;
// ������ ��������� "�����" �� ������� ������� � ������� p_First.
// ��������� - ������ ���������� "�����", ����������� "�����" - � pp_Word
begin
    if p_First>length(p_Pat) then Raise Exception.Create(TranslateText('������� GetNextPatternWord: �������� p_First ������� �� ����� �������'));
    p_Pat:=p_Pat+' ';
    result:=p_First+1;
    case p_Pat[p_First] of
       '\': inc(result);
       '[': result:=GetPosOfCloseBracket(p_Pat,p_First,'[]')+1;
       '(': result:=GetPosOfCloseBracket(p_Pat,p_First,'()')+1;
    end;
    if p_Pat[result] in ['?','*','+'] then inc(result);
    if p_Pat[result] = '?' then inc(result);
    pp_Word:=copy(p_Pat,p_First,result-p_First);
end;
//==============================================================================
function SatisfySmallPat(p_Str,p_Pat:string;p_First:integer=1):integer;
// �������� �� ������������ ������ ������ "�����" �������� ��� ��������� � ������� ���������
var flag:Boolean;
begin
    result:=0;
    if p_First>length(p_Str) then exit;
    case p_Pat[1] of
       '\':
         case p_Pat[2] of
            'a': if p_Str[p_First] in LatCharSet+RusCharSet+UkrCharSet then result:=p_First+1;
            'A': if not (p_Str[p_First] in LatCharSet+RusCharSet+UkrCharSet) then result:=p_First+1;
            'n': if p_Str[p_First] in NumberSet then result:=p_First+1;
            'N': if not (p_Str[p_First] in NumberSet) then result:=p_First+1;
            's': if p_Str[p_First] in SpaceSet then result:=p_First+1;
            'S': if not (p_Str[p_First] in SpaceSet) then result:=p_First+1;
            'O': if p_Str[p_First]='(' then result:=GetPosOfCloseBracket(p_Str,p_First)+1;
            'K': if p_Str[p_First]='''' then result:=GetPosOfCloseQuota(p_Str,p_First)+1;
            'Q': result:=SatisfyPatternList(p_Str,SqlPrimitivs,p_First);
            '(','*','.','+','?',
            ')','[',']','\': if p_Str[p_First]=p_Pat[2] then result:=p_First+1;
         end;
       '.': result:=p_First+1;
       '[':
         begin
            p_Pat:=copy(p_Pat,2,length(p_Pat)-2);
            flag:=(p_Pat[1]='^');
            if flag then p_Pat:=copy(p_Pat,2,length(p_Pat));
            if flag=(pos(p_Str[p_First],p_Pat)=0) then result:=p_First+1;
         end;
    else if lowercase(p_Str[p_First])=lowercase(p_Pat[1]) then result:=p_First+1;
    end;
end;
//==============================================================================
procedure SatisfyMiddlePat(p_Str,p_Pat:string;var pp_Min,pp_Max,pp_Size:integer;const p_First:integer=1);
// �������� �� ������������ ������ ������ "�����" �������� �� ����������� � ������ ��������
var i,temp:integer;
    c,c1:char;
begin
    if (p_Pat[length(p_Pat)]='?') and (p_Pat[length(p_Pat)-1] in ['*','+']) then begin
       c1:='?'; SetLength(p_Pat,length(p_Pat)-1);
    end else c1:=' ';

    if p_Pat[length(p_Pat)] in ['*','?','+'] then begin
       c:=p_Pat[length(p_Pat)]; SetLength(p_Pat,length(p_Pat)-1);
    end else c:=' ';

    i:=SatisfySmallPat(p_Str,p_Pat,p_First);
    if i<>0 then begin
       pp_Size:=i-p_First; pp_Min:=i;
    end;
    pp_Max:=i;

    if c in ['+','*'] then
       while i<>0 do begin
           pp_Max:=i;
           i:=SatisfySmallPat(p_Str,p_Pat,i);
       end;

    if c in ['*','?'] then begin
       pp_Min:=p_First;
       if pp_Max=0 then pp_Max:=pp_Min;
    end;

    if c1='?' then begin
       temp:=pp_Min; pp_Min:=pp_Max; pp_Max:=temp;
       pp_Size:=-pp_Size;
    end;
end;
//==============================================================================
function SatisfyPattern(p_Str,p_Pat:string;p_First:integer=1):integer;
var n,min,max,size:integer;
    s:string;
begin
    inc(Depth);
    try
    log('SatisfyPattern: First='+IntToStr(p_First)+'; Pattern='+p_Pat+'; Depth='+IntToStr(Depth),20);
    n:=GetNextPatternWord(p_Pat,s);
    SatisfyMiddlePat(p_Str,s,min,max,size,p_First);
    if max=0 then result:=0
    else
       if n>length(p_Pat) then result:=max
       else
          repeat
              result:=SatisfyPattern(p_Str,copy(p_Pat,n,length(p_Pat)),max);
              if result<>0 then exit;
              max:=max-size;
          until (max<=min) and (size>=0) or (min<=max) and (size<0);
    finally
    dec(Depth);
    end;
end;
//==============================================================================
function SatisfyPatternList(p_Str:string;p_PatList:array of string;p_First:integer=1):integer;
var i:integer;
begin
    i:=Low(p_PatList);
    while i<=High(p_PatList) do begin
        result:=SatisfyPattern(p_Str,p_PatList[i],p_First);
        if result>0 then exit;
        inc(i);
    end;
    result:=0;
end;
//==============================================================================
function SatisfyPatternExact(p_Str,p_Pat:string):Boolean;
// �������� ������ �� ������ ������������ �������
begin
    result:=SatisfyPattern(p_Str,p_Pat)=length(p_Str)+1;
end;
//==============================================================================
procedure FindPattern(p_Str,p_Pat:string;var pp_Next:integer;var pp_Res:string;p_Begin:integer=1);
// ����� ������� � ������
var i:integer;
begin
    for i:=p_Begin to length(p_Str) do begin
        pp_Next:=SatisfyPattern(p_Str,p_Pat,i);
        if pp_Next>0 then break;
    end;
    pp_Res:=copy(p_Str,i,pp_Next-i);
end;
//==============================================================================
function GetFieldList(p_Sql: string): string;
var s: string;
    i,k: integer;
    //--------------------------------------------------------------------------
    function IsNextBracket(n: integer): Boolean;
    begin
        result:=FALSE;
        while n<=length(p_Sql) do begin
            if p_Sql[n]<>' ' then begin
               result:=(p_Sql[n]='(');
               exit;
            end;
            inc(n);
        end;
    end;
    //--------------------------------------------------------------------------
    function IsFirstFieldSymbol(n: integer): Boolean;
    begin
        result:=(p_Sql[n]>='a') and (p_Sql[n]<='z') or (p_Sql[n]>='A') and (p_Sql[n]<='Z');
    end;
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    function IsFieldSymbol(n: integer): Boolean;
    begin
        result:=IsFirstFieldSymbol(n) or (p_Sql[n]>='0') and (p_Sql[n]<='9') or (p_Sql[n]='_');
    end;
    //--------------------------------------------------------------------------
    procedure FindNextWord(p_Start: integer; var pp_Begin: integer; var pp_Res: string);
    var i: integer;
    begin
        i:=p_Start;
        while (i<=length(p_Sql)) and not IsFirstFieldSymbol(i) do
           inc(i);
        if i>length(p_Sql) then begin
           pp_Begin:=0;
           pp_Res:='';
        end else begin
           pp_Begin:=i;
           while (i<=length(p_Sql)) and IsFieldSymbol(i) do
              inc(i);
           pp_Res:=copy(p_Sql,pp_Begin,i-pp_Begin);
        end;
    end;
    //--------------------------------------------------------------------------
begin
    i:=1; result:=',';
    while i<=length(p_Sql) do begin
        FindNextWord(i,k,s);
        if k=0 then exit;
        if not IsNextBracket(k+length(s)) then
           result:=result+s+',';
        i:=k+length(s);
    end;
end;
//==============================================================================
end.
