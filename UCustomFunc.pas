unit UCustomFunc;

interface

uses uCommonForm,  Classes, ExFunc,SysUtils,uOilQuery,Ora, uOilStoredProc;

type TCustomFunc = class
        Name: string;
        Args: TStringList;
        Body: string;
        constructor Create;
        destructor Destroy;
        procedure Define(definition:string);
     end;

     PCustomFunc = ^TCustomFunc;

     TCustomFuncPacket = class
        constructor Create;
        destructor Destroy;
        procedure IncludeFromFile(filename:string);
        function Include(buf:string):string;
        function Add(definition:string):string;
        procedure Commit;
        procedure RollBack;
        function IndexByName(s:string):integer;
        function CalculateValue(func:string;var err:string):string;
     private
        List: TList;
        Count: Integer;
     end;

var
     LegalSymbols: TCharSet = ['a'..'z','A'..'Z','0'..'9','_'];

function ReplaceParamWithValue(Text,Param,Value:string):string;


implementation

function IsLegalIdentifier(s:string;var c:char):Boolean;
var i:integer;
begin
     for i:=1 to length(s) do
         if not (s[i] in LegalSymbols) then begin
            result:=FALSE;
            c:=s[i];
            exit;
         end;
     result:=TRUE;
end;

function ReplaceParamWithValue(Text,Param,Value:string):string;
var i:integer;
    InsideApostrophes:Boolean;
    s:string;
begin
     InsideApostrophes:=FALSE;
     i:=1; result:=''; Text:=Text+' ';
     while i<=length(Text) do begin
           if Text[i]='''' then begin
              InsideApostrophes:=not InsideApostrophes;
              result:=result+'''';
           end else if (Text[i]=':') then
               if InsideApostrophes then result:=result+':'
               else s:=':'
           else if s='' then result:=result+Text[i]
                else if Text[i] in LegalSymbols then s:=s+Text[i]
                     else begin
                               if s=Param then result:=result+Value
                                          else result:=result+s;
                               s:='';
                               result:=result+Text[i];
                          end;
           inc(i);
     end;
     result:=copy(result,1,length(result)-1);
end;

procedure TCustomFunc.Define(definition:string);
// definition содержит строку типа
// 01DANET(x)=decode(x,0,'Нет','Да');
// возвращает Ok в случае успеха или текст ошибки
var n,k:integer;
    s,arg,head,body:string;
    c:char;
begin
     n:=pos('=',definition);
     if n=0 then Raise Exception.Create(TranslateText('Define: Не найден символ ''='' в определении ')+definition);
     head:=copy(definition,1,n-1); head:=trim(head);
     body:=copy(definition,n+1,length(definition)); body:=trim(body);
     if body='' then Raise Exception.Create(TranslateText('Define: Отсутствует тело функции в определении ')+definition);
     // head - то, что до знака '='
     n:=pos('(',head);
     if n=0 then Raise Exception.Create(TranslateText('Define: Не найден символ ''('' в определении ')+definition);
     if n=1 then Raise Exception.Create(TranslateText('Define: Не найдено имя функции в определении ')+definition);
     s:=copy(head,1,n-1); s:=trim(s);
     if not IsLegalIdentifier(s,c) then Raise Exception.Create(TranslateText('Define: недопустимый символ ''')+c+TranslateText('''в имени функции в определении ')+definition);
     Self.Name:=s;
     if head[length(head)]<>')' then Raise Exception.Create(TranslateText('Define: Не найден символ '')'' в определении ')+definition);
     arg:=copy(head,n+1,length(head)-n-1); arg:=trim(arg);
     // arg - список аргументов через запятую
     // надо разделить их и занести в StringList Args.
     Self.Args.Clear;
     while length(arg)>0 do begin
           if (arg[1]=',') or (arg[length(arg)]=',') then Raise Exception.Create(TranslateText('Define: Неправильная запятая в списке аргументов в определении ')+definition);
           n:=pos(',',arg);
           if n=0 then begin
              s:=arg;
              arg:='';
           end else begin
              s:=copy(arg,1,n-1);
              arg:=copy(arg,n+1,length(arg));
           end;
           if not IsLegalIdentifier(s,c) then Raise Exception.Create('Define: Недопустимый символ '''+c+TranslateText(''' в аргументе ''')+s+TranslateText(''' в списке аргументов в определении ')+definition);
           if Self.Args.Find(s,k) then Raise Exception.Create(TranslateText('Define: Дважды перечислен аргумент ''')+s+TranslateText(''' в определении ')+definition);
           Self.Args.Add(s);
     end;
     Self.Body:=body;
end;

constructor TCustomFunc.Create;
begin
     Args:=TStringList.Create;
end;

destructor TCustomFunc.Destroy;
begin
     inherited;
     Args.Destroy;
end;

constructor TCustomFuncPacket.Create;
begin
     List:=TList.Create;
     Count:=0;
end;

destructor TCustomFuncPacket.Destroy;
var i:integer;
    CF: TCustomFunc;
begin
     inherited;
     for i:=0 to List.Count-1 do begin
         CF:=List.Items[i];
         CF.Destroy;
     end;
     List.Destroy;
end;

procedure TCustomFuncPacket.IncludeFromFile(filename:string);
var buf:string;
begin
     if pos('\',filename)=0 then
        filename:=GetCurrentDir+'\reports\'+filename;
     if not GetTextFromFile(filename,buf) then Raise Exception.Create(TranslateText('Include: Не найден файл ')+filename);
end;

function TCustomFuncPacket.Include(buf:string):string;
var definition,err: string;
    i:integer;
    CF: TCustomFunc;

    function GetDefinition:string;
    var s:string;
        comment:Boolean;
    begin
         s:=''; comment:=FALSE;
         while (i<=length(buf)) do begin
               if buf[i]='#' then comment:=TRUE
               else if not comment and (buf[i]=';') then break
               else if buf[i]=#13 then begin
                    comment:=FALSE;
                    inc(i);
                    s:=s+' ';
               end else if not comment then s:=s+buf[i];
               inc(i);
         end;
         inc(i);
         result:=trim(s);
    end;

begin
     i:=1;
     while i<=length(buf) do begin
           definition:=GetDefinition;
           if definition<>'' then begin
              CF:=TCustomFunc.Create;
              try
                 CF.Define(definition);
              except
                 RollBack;
              end;
              Self.List.Add(CF);
           end;
     end;
     result:='Ok';
     Commit;
end;

procedure TCustomFuncPacket.Rollback;
var i:integer;
    CF: TCustomFunc;
begin
     for i:=List.Count-1 downto Count do begin
         CF:=List.Items[i];
         CF.Destroy;
         List.Delete(i);
     end;
end;

procedure TCustomFuncPacket.Commit;
begin
     Count:=List.Count;
end;


function TCustomFuncPacket.Add(definition:string):string;
var  CF: TCustomFunc;
     err: string;
begin
     CF:=TCustomFunc.Create;
     CF.Define(definition);
     if err<>'Ok' then begin
        result:=err;CF.Destroy;
        exit;
     end;
     Self.List.Add(CF);
     result:='Ок';// *NO_TRANSLATE*
end;

function TCustomFuncPacket.IndexByName(s:string):integer;
var i:integer;
    CF:TCustomFunc;
begin
     for i:=0 to List.Count-1 do begin
         CF:=List.Items[i];
         if CF.Name=s then begin
            result:=i;
            exit;
         end;
     end;
     result:=-1;
end;

function TCustomFuncPacket.CalculateValue(func:string;var err:string):string;
var ArgList: TStringList;
    CF: TCustomFunc;
    n,i: integer;
    s,res,name,arguments:string;
begin
     func:=trim(func);
     if func[1]='@' then func:=copy(func,2,length(func));
     n:=pos('(',func);
     name:=copy(func,1,n-1);
     arguments:=copy(func,n+1,length(func)-n-1);

     n:=IndexByName(name);
     if n=-1 then begin
        err:=TranslateText('CalculateValue: Функция ')+name+TranslateText(' в пакете отсутствует');
        result:='';
        exit;
     end;
     CF:=List.Items[n];
     if CF.Args.Count=0 then begin
        result:=CF.Body;
        exit;
     end;
     ArgList:=TStringList.Create;
     Str2StringList(arguments,ArgList);
     if ArgList.Count<>CF.Args.Count then begin
        err:=TranslateText('Неверное число аргументов в вызове функции ')+name+'('+arguments+')';
        exit;
     end;
     s:=''; res:='';
     for i:=1 to length(CF.Body) do begin
         if CF.Body[i] in LegalSymbols then s:=s+CF.Body[i]
         else begin
            if CF.Args.Find(s,n) then res:=res+ArgList[n]
            else res:=res+s;
            s:=''; res:=res+CF.Body[i];
         end;
     end;
     if CF.Args.Find(s,n) then res:=res+ArgList[n]
     else res:=res+s;
     ArgList.Destroy;
end;

end.
