unit ExFunc;
{### 2.00 }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX,StdCtrls, Buttons, ExtCtrls, CurrEdit, RxLookup, Mask, ToolEdit, Db,
  DBTables,Excel8TLB, Grids, DBGrids, Progr, ComObj, Clipbrd, OilStd, Comctrls,
  DbGridEh, uSplashForm, uCommonForm, Main,uOilQuery,Ora, uOilStoredProc
  {$IFDEF VER150},Variants{$ENDIF};

const MAXBUFSIZE=50000000;
      MAXDOPBUFSIZE=49000000;

type TCharSet=set of char;
     PInteger = ^Integer;

     TVariantArray = array of variant;

function PuTOilQueryToExcel(XLApp,List:Variant;Q:TOilQuery;NumOfFields,FirstLine:integer;PrgrBar:TProgrForm;startprogr,endprogr:double;Fields:string;DopTables:string='';FIinEveryLine:Boolean=FALSE;PromItogi:Boolean=FALSE):integer;
procedure PutToCell(List:Variant;Coord,s:string);
procedure GoToCell(p_List:Variant;p_Coord:string);
procedure GetExcelCoord(p_Coord:string;var pp_Col,pp_Row:integer);
procedure ActivateXLApp(PName, FName: string; ListNumber: integer; var XLApp, List: Variant;
  ListName: string=''; Extention: string='xls');
procedure ChangeColumns(List:Variant;Line:integer;Let,Order:string);
function RusLowerCase(s:string;invert:Boolean=FALSE):string;
function RusUpperCase(s:string):string;
function RemoveSymbols(s,Symbols:string;safe:Boolean=TRUE):string;
function RemoveSpaces(s:string):string;
function IsSymbol(c:char;Symbols:string):Boolean;
procedure ShowTextInMemo(s:string);
procedure ShowNiceSql(q:TOilQuery);
procedure ActivateProgressBar(var pr:TProgrForm;Show:Boolean=TRUE);
procedure SetProgressBar(n:integer;var pr:TProgrForm);
procedure PutTitle(List:Variant;Coord:string='A1');
//procedure PutGridToExcel(Columns:TDbGridColumns;Q:TOilQuery;Head:string;DigitalColumns:string='');
//procedure PutGridEhToExcel(Columns:TDbGridColumnsEh;Q:TOilQuery;Head:string;DigitalColumns:string='');
function GetTitle:string;
procedure SetCurrentMonth(D1,D2:TDateEdit);
procedure SetPrevMonth(D1,D2:TDateEdit);
function StringIsNumber(s:string;n:integer=0):Boolean;
procedure AddToArray(var ToArray:array of variant;var NextIndex:integer;FromArray:array of variant;FromSize:integer);
procedure ChangePattern(OldName,NewName:string;PageNumber:integer;Params:array of variant;ArraySize:integer;HiddenColumns:string);
function GetUniqueFileName(directory,filename:string):string;
function BoolToYN(b:boolean):string;
function IntToBool(n:integer):Boolean;
function IsInList(substr,s:string):Boolean;
function BoolToInt(b:boolean):integer;
function BoolToDaNet(b:boolean):string;
function BoolToDa_(b:boolean):string;
function BoolTo_(b:boolean;p_TRUE,p_FALSE:Variant):Variant;
function TrueFalseToBool(s:string):Boolean;
function FlipListViewItems(LV: TListView; n1,n2: integer):Boolean;
function ExcelNumberToColumn(n:integer):string;
procedure Str2StringList(s:string;var sl:TStringList;Sep:string=',');
procedure GetNameValue(s:string;var name,value:string;Separator:char='=');
procedure SelectRichEditLine(var RE: TRichEdit; NLine: integer);
function GetFirstDayOfNextMonth(date1:TDateTime):TDateTime;
function FloatMin(x,y:real):real;
function GetTextFromFile(filename:string; var buf:string):Boolean;
procedure GetStringListFromFile(filename:string;SL:TStringList);
function GetWord(text:string; symbols: TCharSet; var i:integer; startsymbols: TCharSet=[]):string;
function GetWordUntil(text:string;end_symbol:char;var i:integer;res:string):string;
function GetShortPPONName(name:string):string;
//function Coding(s:string):string;
//function Decoding(s:string):string;
function Nvl(x,y:Variant):Variant;
function Decode(a:array of Variant):Variant;
function Instr(substr,str:string;first:integer=1;num:integer=1;cover:Boolean=FALSE):integer;
function NotInObl:string;
function ReplaceSubstr(str,substr1,substr2:string):string;
function ReplaceAllSubstr(str, // строка, в которой производится замена
                          substr1, // какую подстроку заменять
                          substr2:string; // на какую построку заменять
                          p_InQuotas:Boolean=FALSE {проводить ли замену внутри кавычек}):string;
function GetMainDir:string; // !!! Должна использоваться вместо GetCurrentDir() !!! 
function GetOrgRating(anketa:string):real;
function GetOrgKategory(anketa:string):string;
function GetKOSCondition(variable:string;Kom,Own,Store:Boolean):string;
function GetConstructedString(str:array of string;cond:array of boolean;sep:string=',';EmptyValue:string=''):string;
function BoolArrayToBinary(p_Array: array of boolean): integer;
function RemoveDuplSymbols(s:string;c:char=' '):string;
function GetTruncName(s:string):string;
procedure GetMonthLimits(p_Month,p_Year:integer;var pp_DateBegin,pp_DateEnd:TDateTime);
function ReadWordUntil(s,sep:string;start:integer;var res:string):integer;
function ExcelColumnToNumber(col:string):integer;
function MultSymbols(p_Str:string;p_Set:TCharSet;p_Num:integer):string;
function DoubleQuotas(p_Str:string):string;
function CountSubstr(p_Str,p_Substr:string):integer;
function pad(p_Str:string;p_Size:integer;p_Symbol:char=' ';p_Right:Boolean=TRUE):string;
function GetUserFromWindows: string;
procedure log(p_Filename,p_Text:string);
procedure StartLog(p_Text: string; p_Terminate: Boolean = FALSE);
procedure QLog(p_Text: string);
function GetTextWidth(p_Str:string):integer;
function FToStr(x:real):string;
function ItemInList(p_Item:Variant; p_List:string):Boolean;
procedure ShowDebugWarning(p_Str:string);
function GetDateDescription(p_Date1,p_Date2: TDateTime):string;
procedure SwitchToRus;
procedure GetOrgAnketaKoeff;
function GetShortOblName(p_Id: integer):string;
function GetDirName(p_FileName: string):string;
function StrLike(s1,s2: string):Boolean;
function StrIsNumber(s: string): Boolean;
function CompareVersion(p_Ver1,p_Ver2: string): integer;
function FileNameMinusDir(p_FileName: string): string;
function FileNameMinusExt(p_FileName: string): string;
function GetTalonNominal(p_Ser: string): double;
function LangText(p_Name: string): string;
procedure InitLangValues;
procedure InitLanguage(p_Language: integer);
procedure InitInterfaceLanguage(ALangId: Integer);
procedure MsWordDocAdd(FileName:string);
procedure MsWordDotAdd(FileName: string; MSWord: Variant);
function DevideRusUkr(p_Str: string; p_Interface: Boolean = false; p_Char: char='@'): string;
function GetEditClassByName(p_Name: string): TEditClass;
procedure FillControls(p_Q: TDataSet; p_CTRL: array of TControl; p_Fields: array of string);
procedure FillTags(p_Q: TDataSet; p_CTRL: array of TControl; p_Fields: array of string);
procedure FillVariants(p_Q: TDataSet; p_Var: array of PVariant; p_Fields: array of string);
procedure FillIntegers(p_Q: TDataSet; p_Var: array of PInteger; p_Fields: array of string);
procedure ClearControls(p_CTRL: array of TControl);
function GetMonthBegin(p_Date: TDateTime): TDateTime;
function Val2Null( AValue,AWhatNull:Variant ):Variant;
// Сохранение настроек грида
procedure ClearGridColumns(AFormName: string);
procedure SaveGridColumns(AGrid:TDBGridEh; AFormName:string);
procedure LoadGrigColumns(AGrid:TDBGridEh; AFormName:string);

function TransDate(s: string; l: integer): string;
procedure GetRRRMenuPath(p_FileName: string; var pp_MenuPath,pp_Version: string; var pp_Position: integer);
function FileCreateDate(AFile: String): TDateTime;
function GetDate_From_MonthDay(AMonthDay: string): TDateTime; // Получает из строки тип дата/время
procedure DogFillContractors(DepId, DepInst, ClientId, ClientInst: integer;            {in}
                              var DepName, DepVLice, ClientName, ClientVLice: string); {out}
procedure DogFillRekvizits(DepId, DepInst, ClientId, ClientInst: integer);    //заповнює реквізити в договір в MsWord

// Переклад тексту Src у текст Dest з формату ANSІ у формат OEM і навпаки
procedure TranslateOEM(Src: String; var Dest: String; ToOEM: Boolean);
function OemToAnsiStr(const OemStr: string): string;
function AnsiToOemStr(const OemStr: string): string;
function GetNumbers(AText: string): Int64;
function TryVarToFloat(p_var: Variant): Real;
Function GetTextFromClipboard(Text: TStrings):Boolean;


var OrgAnketaKoeff:array[1..14,1..6] of real;

implementation

uses Memo,UDbFunc,TextFunc,URepElClass,AddOrgRef,uXMLForm,RXSpin;

var buf: array[0..MAXBUFSIZE] of char;
    slLangValues: TStringList;

function ExcelColumnToNumber(col:string):integer;
begin
     col:=UpperCase(col);
     if (length(col)<>1) and (length(col)<>2) then
        Raise Exception.Create('ExcelColumnToNumber('+col+TranslateText('): Длина аргумента должна быть 1 или 2'));
     if (length(col)=1) and not (col[1] in ['A'..'Z']) then
        Raise Exception.Create('ExcelColumnToNumber('+col+TranslateText('): Первая буква аргумента должна быть между А и Z'));
     if (length(col)=2) and not (col[1] in ['A'..'I']) then
        Raise Exception.Create('ExcelColumnToNumber('+col+TranslateText('): Первая буква аргумента должна быть между А и I'));

     if length(col)=2 then
        if (col[1]<>'I') and not (col[2] in ['A'..'Z']) or
           (col[1]='I') and not (col[2] in ['A'..'V']) then
              Raise Exception.Create('ExcelColumnToNumber('+col+TranslateText('): Неверная вторая буква аргумента'));
     if length(col)=1 then result:=ord(col[1])-ord('A')+1
     else result:=26*(ord(col[1])-ord('A')+1)+ord(col[2])-ord('A')+1;
end;

function ExcelNumberToColumn(n:integer):string;
begin
     if (n<1) or (n>8*26+22) then
        Raise Exception.Create('ExcelNumberToColumn('+IntToStr(n)+TranslateText('): аргумент из неверного диапазона'));
     if n<=26 then result:=chr(ord('A')+n-1)
     else result:=chr((n-1) div 26+ord('A')-1)+chr(ord('A')+(n-1) mod 26);
end;


{
     Функция PuTOilQueryToExcel предназначена для помещения
     данных из запроса Q в лист Excel с суммированием по
     указанным полям. Пользоваться ею надо так.
     Пусть мы хотим поместить в лист List, начиная со строки
     FIRSTLINE данные из запроса Q, причем не больше, чем NumOfFields записей.
     Если мы хотим поместить все записи, укажем NumOfFields равным 0.
     Возьмем например запрос, в котором содержатся поля
     ORG_NAME,NP_NAME, NP_GRP_NAME, CYST, STATION, KOL.
     В самом простом случае нам ничего не надо суммировать, и к примеру поле
     np_grp_name помещать не надо. Тогда
     Fields='ORG_NAME;NP_NAME;CYST;STATION;KOL'
     Все поля будут помещены со столбца A до столбца E подряд.
     Если нам нужно, например, пропустить столбец C, то мы запишем так:
     Fields='ORG_NAME;NP_NAME;CYST #D;STATION;KOL'
     Поле CYST будет помещено в столбец D и следующие пойдут за ним подряд, в
     столбцы соответственно E и F.

      Теперь пусть запрос Q упорядочен по полю ORG_NAME, и нам нужно по каждой
     организации подвести сумму по полю KOL.
     Тогда
     Fields='ORG_NAME %1;NP_NAME;CYST #D;STATION;KOL+'
     %1 означает, что как только при передвижении по записям запроса мы натыкаемся
     на смену значения ORG_NAME, подводится итог, а именно в столбце ORG_NAME пишется,
     к примеру, "Итого по Уманьагроснаб", а в столбце KOL появится сумма.
     Вся эта строка выделяется жирным шрифтом. Также значения ORG_NAME теперь будут
     писаться не в каждой строке, а только один раз и жирным шрифтом.
     После всех полей, которые надо суммировать следует поставить +.
     Теперь допустим нам не нравится надпись 'Итого по Уманьагроснаб' и мы хотим
     заменить ее какой-нибудь другой. Тогда следует указать ее в фигурных скобках:
}//  Fields='ORG_NAME %1{Всего по $};NP_NAME;CYST #D;STATION;KOL+'
{    Вместо доллара подставится название организации. Можно обойтись и без него,
     например просто надписью Всего.
     Для всех столбцов, по которым ставится % можно определить фонт, причем
     можно определить отдельно фонт для заголовка и для надписи Итого.Делается это
     записью типа &WB. Первая буква - фонт заголовка, вторая - фонт надписи Итого.
             B - жирный
             I - наклонный
             W - и жирный и наклонный
             V - ни то ни другое

     Если в запросе несколько упорядоченных полей, и по всем надо подводить итоги,
     делается так:
     допустим в запросе присутствует строка
              order by ORG_NAME, NP_NAME,
     то
       Fields='ORG_NAME %2;NP_NAME %1;CYST #D;STATION;KOL+'
     То есть поле, по которому Итого будет подводиться чаще имеет меньший приоритет,
     определяемый цифрой после %.

     Может возникнуть необходимость в добавлении счетчика.
     К примеру, нам надо, чтобы для каждой организации в первом столбце
     был номер. В этом случае
         Fields='№ ORG_NAME; ORG_NAME; ...'
     Для колонки номера можно определить номер столбца с помощью # и фонт
     с помощью &. В этом случае фонт определяется только одной буквой.
}

function PuTOilQueryToExcel(XLApp,List:Variant;Q:TOilQuery;NumOfFields,FirstLine:integer;PrgrBar:TProgrForm;startprogr,endprogr:double;
                         Fields:string;DopTables:string='';FIinEveryLine:Boolean=FALSE;PromItogi:Boolean=FALSE):integer;
{ List - страница Excel, Q - SQL с данными, NumOfFields - сколько полей извлекать, если 0 то до конца
  FirstLine - с какой строки писать в List; Fields - описание полей в следующем формате:
  Формат строки Fields:
         имя поля по которому выводится заголовок[ : имя поля по которому подводится итого]
         [#k] k - буква столбца, в который вписывается поле. Если не указано, то по умолчанию
              берется предыдущий столбец + 1.
         [%n] (по полю подводится сумма, приоритет n
         { Итого по $  - надпись в Итого, вместо $ подставляется значение поля
         [&IB] - фонт. Первая буква - заголовок, вторая - итого
               I - только наклонный
               B - только жирный
               W - и то и то
               V - ни того ни того

  ! - сжатая колонка
  /цифра - НДС ниже итога, цифра - номер суммируемого столбца (FS)
  *цифра - поле выводится только вместе с FI[цифра]
}
const STRING_SIZE=100;
      SUM_SIZE=60;
      SUM_DOPSIZE=20;
      DOPTABLE_SIZE=5;
      SEPARATORS='#%&{+:!/*=?';
type FieldsRecord=record
         Size:integer;
         ToSum,Show0,ToHideIfEmpty:array[1..STRING_SIZE] of Boolean;
         Name,NameItogo:array[1..STRING_SIZE] of string;
         Columns:array[1..STRING_SIZE] of string;
         FIOnly:array[1..STRING_SIZE] of integer; // ноль - поле выводится каждый раз, n - только с FI порядка n
     end;
     ItogoFieldsRecord=record
         Size:integer;
         Name,NameItogo,Columns,Font,Itogo:array[1..SUM_SIZE] of string;
         NDS:array[1..SUM_SIZE] of integer;
     end;
     DopTablesRecord=record
         Size:integer;
         Field,Head:string;
         Column:string;
         Name:array[1..SUM_DOPSIZE] of string;
         Sums:array[1..SUM_DOPSIZE,1..SUM_SIZE] of double;
     end;
     NumeratorRecord=record
         Field,Column:string;
         Font:char;
         Number:integer;
         Value:string;
     end;
     CompressedRecord=record
         Name,Column:string;
         IsFirst:boolean;
         StartValue,CurrentValue:double;
         OtherValues:array[1..STRING_SIZE] of string;
     end;

var F,FS:FieldsRecord;
    FI:ItogoFieldsRecord;
    Numerator:NumeratorRecord;
    Compressed:CompressedRecord;
    DT: array [1..DOPTABLE_SIZE] of DopTablesRecord;
    CurrentColumn,LastColumn,InfoColumn:string;
    InfoColumnNum: integer;
    Sums:array[0..SUM_SIZE,1..STRING_SIZE] of double;
    SumCount:array[1..SUM_SIZE] of integer;
    CompressedSums:array[1..STRING_SIZE] of double;
    CurrentValues:array[1..SUM_SIZE] of string;
    CurrentLine,DTSize:integer;
    IsNumerator,IsCompressed:Boolean;
    CurLineBuf,PrevLineBuf:TStringList;
    //buf:WideString;
    //buf: array[0..MAXBUFSIZE+10000] of char;
    //buf: ^Char;
    BufSize:integer;

//****************************************************************************
//                       ОБРАБОТКА СТРОКИ FIELDS
//****************************************************************************

//-------------------------------------------------------------
    function IncColumn(col:string):string;
    // получает номер следующей колонки
    var res:string;
    begin
         if length(col)=1 then
            if col='Z' then res:='AA'
            else res:=chr(ord(col[1])+1)
         else
            if col[2]='Z' then res:=chr(ord(col[1])+1)+'A'
            else res:=col[1]+chr(ord(col[2])+1);
         result:=res;
    end;
//-------------------------------------------------------------
    function IsBiggerColumn(col1,col2:string):boolean;
    begin
         if (length(col1)>length(col2)) or ((length(col1)=1) and (length(col2)=1) and (col1[1]>col2[1]))
            or ((length(col1)=2) and (length(col2)=2) and ((col1[1]>col2[1]) or ((col1[1]=col2[1]) and (col1[2]>col2[2])))) then
               result:=TRUE
         else
               result:=FALSE;
    end;
//-------------------------------------------------------------
    procedure ProcessOneNumerator(Num:string);
    var Field,Column:string;
        Font:char;
        i:integer;
    begin
        Field:='';Font:='B';Column:='';
        i:=ReadWordUntil(Num,'#&',2,Field);
        while i<=Length(Num) do begin
             case Num[i] of
             '#':begin
                     i:=ReadWordUntil(Num,'#&',i+1,Column);
                 end;
             '&':begin
                      Font:=Num[i+1];
                      i:=i+2;
                 end;
             end;
        end;
        if Column='' then // если столбец не определен явно,
           CurrentColumn:=IncColumn(CurrentColumn) // то он равен предыдущему + 1
        else
           CurrentColumn:=Column;
        if IsBiggerColumn(CurrentColumn,LastColumn) then
           LastColumn:=CurrentColumn; // постепенно определяется последний столбец
        Numerator.Field:=Field;
        Numerator.Font:=Font;
        Numerator.Column:=CurrentColumn;
        Numerator.Value:='';
        Numerator.Number:=0;
        IsNumerator:=TRUE;
    end;
//-------------------------------------------------------------
    procedure ProcessOneField(Field:string);
    // Обработка одного поля
    var Name,Itogo,Font,NameItogo:string;
        Column:string;
        Priority,i,NDS,FIOnly:integer;
        ToSum,ToCompress,Show0,ToHideIfEmpty:Boolean;
    begin
    // определяем значения по умолчанию
        ToSum:=FALSE;Name:='';Itogo:=TranslateText('$ всего');Font:='BB';
        Column:='';Priority:=0;NameItogo:='';NDS:=0;Show0:=TRUE;FIOnly:=0;
        ToCompress:=FALSE; ToHideIfEmpty:=FALSE;
    // заменяем их, если они определены явно
        i:=ReadWordUntil(Field,SEPARATORS,1,Name);
        while i<=Length(Field) do
        begin
            case Field[i] of
               '%':begin
                        Priority:=ord(Field[i+1])-ord('0');
                        i:=i+2;
                   end;
               '{':begin
                        i:=ReadWordUntil(Field,'}',i+1,Itogo);
                        inc(i);
                   end;
               '+':begin
                        ToSum:=TRUE;
                        inc(i);
                   end;
               '#':i:=ReadWordUntil(Field,SEPARATORS,i+1,Column);
               '&':i:=ReadWordUntil(Field,SEPARATORS,i+1,Font);
               ':':i:=ReadWordUntil(Field,SEPARATORS,i+1,NameItogo);
               '!':begin
                      inc(i);
                      ToCompress:=TRUE;
                   end;
               '/':begin
                        NDS:=ord(Field[i+1])-ord('0');
                        i:=i+2;
                   end;
               '=':begin
                        Show0:=FALSE;
                        inc(i);
                   end;
               '*':begin
                        FIOnly:=ord(Field[i+1])-ord('0');
                        i:=i+2;
                   end;
               '?':begin
                        ToHideIfEmpty:=TRUE;
                        inc(i);
                   end;
            end;
        end;
        if Column='' then // если столбец не определен явно,
           CurrentColumn:=IncColumn(CurrentColumn) // то он равен предыдущему + 1
        else
           CurrentColumn:=Column;
        if IsBiggerColumn(CurrentColumn,LastColumn) then
           LastColumn:=CurrentColumn; // постепенно определяется последний столбец

        if ToCompress then
        begin
             Compressed.Name:=Name;
             Compressed.Column:=CurrentColumn;
             IsCompressed:=TRUE;
             Exit;
        end;

        if Priority=0 then // если по полю не подводятся итоги
        begin
             inc(F.Size); // то оно заносится в список обычных столбцов
             F.Name[F.Size]:=Name;F.Columns[F.Size]:=CurrentColumn;F.Show0[F.Size]:=Show0;F.FIOnly[F.Size]:=FIOnly;
             F.ToHideIfEmpty[F.Size]:=ToHideIfEmpty;
             if ToSum then
             begin
                  F.ToSum[F.Size]:=TRUE; // а так же если по нему надо подводить
                  // сумму, то оно заносится в специальный список
                  inc(FS.Size);
                  FS.Name[FS.Size]:=Name;FS.Columns[FS.Size]:=CurrentColumn;FS.Show0[FS.Size]:=Show0;
                  FS.ToHideIfEmpty[FS.Size]:=ToHideIfEmpty;
             end
             else
                  F.ToSum[F.Size]:=FALSE;
        end
        else
        begin // иначе поле заносится в список полей, по которым подводятся итоги
             if FI.Size<Priority then
                FI.Size:=Priority;
             FI.Name[Priority]:=Name;
             if NameItogo='' then
                 FI.NameItogo[Priority]:=Name
             else
                 FI.NameItogo[Priority]:=NameItogo;
             FI.Columns[Priority]:=CurrentColumn;
             FI.Font[Priority]:=Font;
             FI.Itogo[Priority]:=Itogo;
             FI.NDS[Priority]:=NDS;
        end;
    end;
//-------------------------------------------------------------
    procedure ProcessFields;
    // Обработка по очереди всех полей, разделенных точкой с запятой
    var i:integer;
        s:string;
    begin
        IsNumerator:=FALSE;
        IsCompressed:=FALSE;
        FI.Size:=0;F.Size:=0;FS.Size:=0;
        Fields:=RemoveSymbols(Fields,' ');
        CurrentColumn:=chr(ord('A')-1);LastColumn:='A';
        i:=1;
        while i<Length(Fields) do begin
            i:=ReadWordUntil(Fields,';',i,s)+1;
            if s[1]='№' then ProcessOneNumerator(s)
                        else ProcessOneField(s);
        end;
        InfoColumnNum:=ExcelColumnToNumber(LastColumn)+1;
        InfoColumn:=ExcelNumberToColumn(InfoColumnNum);
    end;
//-------------------------------------------------------------
    procedure ProcessDopTables;
    // определение заготовок под будущие дополнительные таблицы
    var i,j:integer;
        s,field,head:string;
        column:char;
    begin
        DTSize:=0;DopTables:=RemoveSymbols(DopTables,' ');
        column:='A';
        if DopTables='' then exit;
        i:=1;
        while i<Length(DopTables) do
        begin
             head:='';field:='';
             i:=ReadWordUntil(DopTables,';',i,s)+1;
             j:=ReadWordUntil(s,';#{',1,field);
             while j<=Length(s) do
                 case s[j] of
                      '#': begin
                               column:=s[j+1];
                               j:=j+2;
                           end;
                      '{': begin
                               j:=ReadWordUntil(s,'}',j+1,head);
                               inc(j);
                           end;
                 end;
             inc(DTSize);
             DT[DTSize].Field:=field;
             DT[DTSize].Head:=head;
             DT[DTSize].Column:=column;
        end;
    end;

//****************************************************************************
//                       СОЗДАНИЕ ОТЧЕТА
//****************************************************************************
    procedure IncSum;
    // Увеличивает суммы
    var i,j,n:integer;
    begin
         for i:=0 to FI.Size do
             for j:=1 to FS.Size do
                 if not VarIsNull(Q.FieldByName(FS.Name[j]).Value) then
                    Sums[i,j]:=Sums[i,j]+Q.FieldByName(FS.Name[j]).AsFloat;
         for i:=1 to DTSize do
         begin
             for n:=1 to DT[i].Size do
                 if DT[i].Name[n]=Q.FieldByName(DT[i].Field).AsString then
                    break;
             // if DT[i].Name[n]<>Q.FieldByName(DT[i].Field).AsString then
             if (n=0) or (n>DT[i].Size) then
             begin
                  inc(DT[i].Size);
                  n:=DT[i].Size;
                  DT[i].Name[DT[i].Size]:=Q.FieldByName(DT[i].Field).AsString;
             end;
             for j:=1 to FS.Size do
                 if not VarIsNull(Q.FieldByName(FS.Name[j]).Value) then
                    DT[i].Sums[n,j]:=DT[i].Sums[n,j]+Q.FieldByName(FS.Name[j]).AsFloat;
         end;
         if IsCompressed then
            for i:=1 to FS.Size do
                if not VarIsNull(Q.FieldByName(FS.Name[i]).Value) then
                   CompressedSums[i]:=CompressedSums[i]+Q.FieldByName(FS.Name[i]).AsFloat;
   end;
//-------------------------------------------------------------
    procedure PutToTemp(var LineBuf: TStringList;Column:string;Value:Variant);
    var n,i:integer;
    begin
         n:=ExcelColumnToNumber(Column);
         if n<LineBuf.Count then
             LineBuf[n]:=Value
         else begin
              for i:=LineBuf.Count to n-1 do
                  LineBuf.Add('');
              LineBuf.Add(Value);
         end;
    end;
//-------------------------------------------------------------
    procedure PutFontToTemp(var LineBuf: TStringList;Value:Variant; Add:Boolean=TRUE);
    var i:integer;
    begin
         if InfoColumnNum<LineBuf.Count then
             if Add then LineBuf[InfoColumnNum]:=LineBuf[InfoColumnNum]+Value
             else LineBuf[InfoColumnNum]:=Value
         else begin
              for i:=LineBuf.Count to InfoColumnNum-1 do
                  LineBuf.Add('');
              LineBuf.Add(Value);
         end;
    end;
//-------------------------------------------------------------
    procedure MakeFont(Line:integer;Column:string;Font:char);
    var s:string;
    begin
         s:=Column+':';
         if (Font='B') or (Font='W') then
             s:=s+'b';
            //List.Cells[Line,Column].Font.Bold:=TRUE;
         if (Font='I') or (Font='W') then
            s:=s+'i';
            //List.Cells[Line,Column].Font.Italic:=TRUE;
         if Line=CurrentLine then
            PutFontToTemp(CurLineBuf,s+';')
         else PutFontToTemp(PrevLineBuf,s+';');
    end;
//-------------------------------------------------------------
    procedure CopyLineBufToBuf(LineBuf:TStringList);
    var i:integer;
        s:string;
    begin
         s:='';
         for i:=1 to PrevLineBuf.Count-1 do    
             s:=s+PrevLineBuf[i]+#9;
         s[length(s)]:=#13; s:=s+#10;
         for i:=1 to length(s) do
             buf[BufSize+i-1]:=s[i];
         BufSize:=BufSize+length(s);
    end;
//-------------------------------------------------------------
    procedure ProcessToNextLine;
    begin
         if PrevLineBuf.Count>1 then
         begin
             CopyLineBufToBuf(PrevLineBuf);
             inc(CurrentLine);
         end;
         PrevLineBuf.Clear;
         PrevLineBuf.AddStrings(CurLineBuf);
         CurLineBuf.Clear;
         CurLineBuf.Add('');

    end;
//-------------------------------------------------------------
    procedure PrintCompressedLine;
    var i:integer;
    begin
        if Compressed.CurrentValue<>Compressed.StartValue then
           PutToTemp(CurLineBuf,Compressed.Column,FloatToStr(Compressed.StartValue)+'-'+FloatToStr(Compressed.CurrentValue))
           //List.Cells[CurrentLine,Compressed.Column]:=FloatToStr(Compressed.StartValue)+'-'+FloatToStr(Compressed.CurrentValue)
        else
           PutToTemp(CurLineBuf,Compressed.Column,FloatToStr(Compressed.StartValue));
           //List.Cells[CurrentLine,Compressed.Column]:=FloatToStr(Compressed.StartValue);
        for i:=1 to F.Size do
            if not F.ToSum[i] and ((F.FIOnly[i]=0) or FIinEveryLine) then
               PutToTemp(CurLineBuf,F.Columns[i],Compressed.OtherValues[i]);
               //List.Cells[CurrentLine,F.Columns[i]]:=Compressed.OtherValues[i];
        for i:=1 to FS.Size do
            PutToTemp(CurLineBuf,FS.Columns[i],CompressedSums[i]);
            //List.Cells[CurrentLine,FS.Columns[i]]:=CompressedSums[i];
        for i:=1 to FI.Size do
            SumCount[i]:=SumCount[i]+1;
        if FIinEveryLine then
           for i:=1 to FI.Size do
               PutToTemp(CurLineBuf,FI.Columns[i],CurrentValues[i]);
               //List.Cells[CurrentLine,FI.Columns[i]]:=CurrentValues[i];
        ProcessToNextLine;
    end;

//-------------------------------------------------------------
    procedure WriteLine;
    // Выводит поля, по которым не подводится ИТОГО в строку CurrentLine
    // Если указана колонка, по которой надо провести сжатие - проводятся соответственные расчеты
    // Если Force, то диапазон насильственно закрывается.
    var i:integer;
        t:double;

        function IsNext:Boolean;
        // Является ли текущая запись следующей записью диапазона?
        var i:integer;
        begin
             if (t-1=Compressed.CurrentValue) and not Compressed.IsFirst then
             begin
                for i:=1 to FI.Size do
                    if Compressed.OtherValues[i]<>Q.FieldByName(F.Name[i]).AsString then
                    begin
                       result:=FALSE;
                       exit;
                    end;
                result:=TRUE;
             end
             else result:=FALSE;
        end;

    begin
         if IsNumerator then
             if Q.FieldByName(Numerator.Field).AsString<>Numerator.Value then
             begin
                  inc(Numerator.Number);
                  PutToTemp(CurLineBuf,Numerator.Column,Numerator.Number);
                  //List.Cells[CurrentLine,Numerator.Column]:=Numerator.Number;
                  MakeFont(CurrentLine,Numerator.Column,Numerator.Font);
                  Numerator.Value:=Q.FieldByName(Numerator.Field).AsString;
             end;

         if IsCompressed then
         begin
              t:=Q.FieldByName(Compressed.Name).AsFloat;
              if IsNext and not Compressed.IsFirst then
                 Compressed.CurrentValue:=t
              else
              begin
                 if not Compressed.IsFirst then
                    PrintCompressedLine;
                 for i:=1 to F.Size do
                     Compressed.OtherValues[i]:=Q.FieldByName(F.Name[i]).AsString;
                 for i:=1 to FS.Size do
                     CompressedSums[i]:=0;

                 Compressed.StartValue:=t;
                 Compressed.CurrentValue:=t;
              end;
              if Compressed.IsFirst then Compressed.IsFirst:=FALSE;
         end
         else // if not IsCompressed
         begin
           for i:=1 to FI.Size do
                PutToTemp(CurLineBuf,FI.Columns[i],Q.FieldByName(FI.Name[i]).AsString);
                //List.Cells[CurrentLine,FI.Columns[i]]:=Q.FieldByName(FI.Name[i]).AsString;
           for i:=1 to F.Size do
            if (F.FIOnly[i]=0) or FIinEveryLine then
             if F.ToSum[i] then
             begin
                if not VarIsNull(Q.FieldByName(F.Name[i]).Value) then
                   if (Q.FieldByName(F.Name[i]).AsFloat<>0) or F.Show0[i] then
                      PutToTemp(CurLineBuf,F.Columns[i],Q.FieldByName(F.Name[i]).AsFloat);
                      //List.Cells[CurrentLine,F.Columns[i]]:=Q.FieldByName(F.Name[i]).AsFloat;
             end
             else
                if ((Q.FieldByName(F.Name[i]).AsString<>'0') or F.Show0[i]) and ((F.FIOnly[i]=0) or FIinEveryLine) then
                   PutToTemp(CurLineBuf,F.Columns[i],Q.FieldByName(F.Name[i]).AsString);
                   //List.Cells[CurrentLine,F.Columns[i]]:=Q.FieldByName(F.Name[i]).AsString;
             for i:=1 to FI.Size do
                 SumCount[i]:=SumCount[i]+1;
             ProcessToNextLine;
         end;

    end;
//-------------------------------------------------------------
    procedure WriteItogoFields(n:integer);
    // выводит поля, по которым подводится ИТОГО до уровня n
    var i:integer;
    begin
        if FIinEveryLine then Exit;
        for i:=1 to n do
        begin
            PutToTemp(CurLineBuf,FI.Columns[i],Q.FieldByName(FI.Name[i]).AsString);
            //List.Cells[CurrentLine,FI.Columns[i]]:=Q.FieldByName(FI.Name[i]).AsString;
            MakeFont(CurrentLine,FI.Columns[i],FI.Font[i][1]);
        end;
        for i:=1 to F.Size do
            if (F.FIOnly[i]>0) and (F.FIOnly[i]<=n) then
               PutToTemp(CurLineBuf,F.Columns[i],Q.FieldByName(F.Name[i]).AsString);
               //List.Cells[CurrentLine,F.Columns[i]]:=Q.FieldByName(F.Name[i]).AsString;
    end;
//-------------------------------------------------------------
    procedure ObnulSums(n:integer);
    // Обнуление сумм для n-го ИТОГО
    var i:integer;
    begin
         for i:=1 to FS.Size do
             Sums[n,i]:=0;
         SumCount[n]:=0;
    end;
//-------------------------------------------------------------
    procedure Init;
    // Начальное обнуление переменных
    var i,j,k:integer;
    begin
       for i:=1 to FI.Size do
           CurrentValues[i]:=Q.FieldByName(FI.NameItogo[i]).AsString;
       for i:=1 to FI.Size do
           SumCount[i]:=0;
       for i:=0 to FI.Size do
           ObnulSums(i);
       for k:=1 to DTSize do
       begin
           for i:=1 to SUM_DOPSIZE do
               for j:=1 to SUM_SIZE do
                   DT[k].Sums[i,j]:=0;
           DT[k].Size:=0;
           for i:=1 to SUM_DOPSIZE do
               DT[k].Name[i]:='';
       end;
       CurrentLine:=FirstLine;
       if IsCompressed then
       begin
{          Compressed.StartValue:=Q.FieldByName(Compressed.Name).AsFloat;
          Compressed.CurrentValue:=Q.FieldByName(Compressed.Name).AsFloat;
          for i:=1 to F.Size do
              Compressed.OtherValues[i]:=Q.FieldByName(F.Name[i]).AsString;}
          for i:=1 to FS.Size do
              CompressedSums[i]:=0;
          Compressed.IsFirst:=TRUE;
//          IncSum;
       end;
       BufSize:=0;
       //ClipBoard.AsText:='';
       CurLineBuf:=TStringList.Create;
       CurLineBuf.Clear; CurLineBuf.Add('');
       PrevLineBuf:=TStringList.Create;
       PrevLineBuf.Clear; PrevLineBuf.Add('');
    end;
//-------------------------------------------------------------
    procedure WriteVsego;
    var i:integer;
    begin
         PutToTemp(CurLineBuf,'A',TranslateText('Всего:'));
         //List.Cells[CurrentLine,'A']:=TranslateText('Всего:');
         for i:=1 to FS.Size do
             PutToTemp(CurLineBuf,FS.Columns[i],Sums[0,i]);
             //List.Cells[CurrentLine,FS.Columns[i]]:=Sums[0,i];
         PutFontToTemp(CurLineBuf,'b',FALSE);
         //List.Range['A'+IntToStr(CurrentLine)+':'+LastColumn+IntToStr(CurrentLine)].Font.Bold:=TRUE;
    end;
//-------------------------------------------------------------
    procedure WriteOneItogo(n:integer);
    // Выводит итого n-го уровня

        procedure WriteTextItogo(CurLine:integer);
        var TextItogo,s:string;
            i:integer;
        begin
            TextItogo:='';s:=FI.Itogo[n];
            for i:=1 to Length(s) do
                if s[i]='$' then
                   TextItogo:=TextItogo+CurrentValues[n]
                else
                   TextItogo:=TextItogo+s[i];
            PutToTemp(CurLineBuf,FI.Columns[n],TextItogo);
            //List.Cells[CurLine,FI.Columns[n]]:=TextItogo;
        end;

        procedure WriteNds;
        var c:string;
        begin
            // определяем колонку, в которой появится надпись "в т.ч.НДС" на две колонки слева от цифры НДС
            c:=FS.Columns[FI.NDS[n]];
            if length(c)=1 then
               if c[1]>'A' then c[1]:=chr(ord(c[1])-1)
               else c:='A'
            else
               if c='AA' then c:='Z'
               else c[2]:=chr(ord(c[2])-1);

            PutToTemp(CurLineBuf,c,TranslateText('в т.ч.НДС'));
            //List.Cells[CurrentLine,c]:=TranslateText('в т.ч.НДС');
            PutToTemp(CurLineBuf,FS.Columns[FI.NDS[n]],Sums[n,FI.NDS[n]]/6);
            //List.Cells[CurrentLine,FS.Columns[FI.NDS[n]]]:=Sums[n,FI.NDS[n]]/6;
            MakeFont(CurrentLine,c,FI.Font[n][2]);
            MakeFont(CurrentLine,FS.Columns[FI.NDS[n]],FI.Font[n][2]);
            ProcessToNextLine;
        end;

        procedure WriteSeparateItogo;
        var i:integer;
            s:string;
        begin
             WriteTextItogo(CurrentLine);
             for i:=1 to FS.Size do
                 if (Sums[n,i]<>0) or FS.Show0[i] then
                    PutToTemp(CurLineBuf,FS.Columns[i],Sums[n,i]);
                    //List.Cells[CurrentLine,FS.Columns[i]]:=Sums[n,i];
             s:='';
             if (FI.Font[n][2]='B') or (FI.Font[n][2]='W') then
                s:=s+'b';
                //List.Range['A'+IntToStr(CurrentLine)+':'+LastColumn+IntToStr(CurrentLine)].Font.Bold:=TRUE;
             if (FI.Font[n][2]='I') or (FI.Font[n][2]='W') then
                s:=s+'i';
                //List.Range['A'+IntToStr(CurrentLine)+':'+LastColumn+IntToStr(CurrentLine)].Font.Italic:=TRUE;
             PutFontToTemp(CurLineBuf,s,FALSE);
             //List.Range['A'+IntToStr(CurrentLine)+':'+LastColumn+IntToStr(CurrentLine)].Borders[xlEdgeTop].LineStyle:=1;
             //List.Range['A'+IntToStr(CurrentLine)+':'+LastColumn+IntToStr(CurrentLine)].Borders[xlEdgeBottom].LineStyle:=1;
             ProcessToNextLine;
             if FI.NDS[n]<>0 then WriteNDS;
        end;

        procedure WriteSovmItogo;
        var i:integer;
        begin
             for i:=1 to FS.Size do
                 MakeFont(CurrentLine-1,FS.Columns[i],FI.Font[n][2]);
             for i:=1 to n do
                 MakeFont(CurrentLine-1,FI.Columns[i],FI.Font[i][2]);
             if FIinEveryLine then
             begin
                WriteTextItogo(CurrentLine-1);
                MakeFont(CurrentLine-1,FI.Columns[n],FI.Font[n][1]);
             end;
             if FI.NDS[n]<>0 then WriteNDS;
        end;

    begin
        if CurrentValues[n]='' then exit;
        if SumCount[n]>1 then WriteSeparateItogo
        else WriteSovmItogo;
        ObnulSums(n);
        CurrentValues[n]:=Q.FieldByName(FI.NameItogo[n]).AsString;
    end;
//-------------------------------------------------------------
    procedure WriteItogoIfNeed(Force:Boolean);
    var i,n:integer;
    begin
         if Force then
         begin
              if IsCompressed then
              begin
                 PrintCompressedLine;
                 Compressed.IsFirst:=TRUE;
              end;

              for i:=1 to FI.Size do
                   WriteOneItogo(i);
              WriteVsego;
              exit;
         end;

         n:=0;
         for i:=FI.Size downto 1 do
             if (CurrentValues[i]<>'') and (Q.FieldByName(Fi.NameItogo[i]).AsString<>CurrentValues[i]) then
             begin
                  n:=i;break;
             end;
         if n=0 then exit;
         if IsCompressed then
         begin
            PrintCompressedLine;
            Compressed.IsFirst:=TRUE;
         end;
         for i:=1 to n do
             WriteOneItogo(i);
         WriteItogoFields(n-1);
    end;
//-------------------------------------------------------------
    procedure WriteDopTables;
    // вывод дополнительных таблиц
    var i,j,k:integer;
    begin
        for i:=1 to DTSize do
        begin
             CurrentLine:=CurrentLine+5;
             List.Cells[CurrentLine,DT[i].Column]:=DT[i].Head;
             List.Cells[CurrentLine,DT[i].Column].Font.Bold:=TRUE;
             List.Range[DT[i].Column+IntToStr(CurrentLine)+':'+LastColumn+IntToStr(CurrentLine)].Borders[xlEdgeTop].LineStyle:=1;
             List.Range[DT[i].Column+IntToStr(CurrentLine)+':'+LastColumn+IntToStr(CurrentLine)].Borders[xlEdgeBottom].LineStyle:=1;
             inc(CurrentLine);
             for j:=1 to DT[i].Size do
             begin
                  List.Cells[CurrentLine,DT[i].Column]:=DT[i].Name[j];
                  List.Range[DT[i].Column+IntToStr(CurrentLine)+':'+LastColumn+IntToStr(CurrentLine)].Font.Bold:=TRUE;
                  for k:=1 to FS.Size do
                      if (DT[i].Sums[j,k]<>0) or FS.Show0[k] then
                         List.Cells[CurrentLine,FS.Columns[k]]:=DT[i].Sums[j,k];
                  inc(CurrentLine);
             end;
        end;
    end;

//-------------------------------------------------------------
    procedure HideColumnsIfEmpty;
    // процедура прячет колонки, которые помечены флагом ToHideIfEmpty и в которых таки ничего нет
    var QPosition,i,n,NCols:integer;
        Cols: array[1..STRING_SIZE] of integer;
    begin
         n:=0;
         for i:=1 to F.Size do
             if F.ToHideIfEmpty[i] then begin
                inc(n);
                Cols[n]:=i;
             end;
         if n=0 then exit;
         // выяснили, есть ли вообще такие колонки, и если нет, то выходим
         // заодно занесли в массив Cols координаты полей со свойством ToHideIfEmpty

         NCols:=n;
         QPosition:=Q.RecNo; // запоминаем позицию запроса, чтобы ее потом восстановить
         Q.First;
         while (n>0) and not Q.Eof do begin
               for i:=1 to NCols do
                   if (Cols[i]<>-1) and (not VarIsNull(Q.FieldByName(F.Name[Cols[i]]).Value))
                          and (Q.FieldByName(F.Name[Cols[i]]).Value<>0) then begin
                   // если значение соответствующего поля не null и не 0
                       Cols[i]:=-1;
                       dec(n);
                   end;
               Q.Next;
         end;
         if n>0 then
            for i:=1 to NCols do
                if Cols[i]<>-1 then
                   List.Columns[F.Columns[Cols[i] ] ].EntireColumn.Hidden:=TRUE;

         Q.First;
         Q.MoveBy(QPosition);
    end;

//-------------------------------------------------------------
    procedure WriteToExcel;
    // Основная процедура вывода в Excel отчета
    var i,ToPaste:integer;
        step,valueprogr,max:double;
    begin
        Init;
        ToPaste:=FIRSTLINE;
        //WriteItogoFields(FI.Size);
        i:=0;
        if NumOfFields=0 then max:=Q.RecordCount
        else max:=NumOfFields;
        if max=0 then step:=0
        else step:=(endprogr-startprogr-5)/max;valueprogr:=startprogr;
        Clipboard.Open;
        while (not Q.Eof) and ((NumOfFields=0) or (i<NumOfFields)) do
        begin
            inc(i);
            WriteItogoIfNeed(FALSE);
            WriteLine;
            IncSum;
            Q.Next;
            valueprogr:=valueprogr+step;
            if PrgrBar.Progress<>round(valueprogr) then
            begin
                PrgrBar.Progress:=round(valueprogr);
                PrgrBar.Refresh;
            end;
            if BufSize>=MAXDOPBUFSIZE then
            begin
                 buf[BufSize]:=#0;
                 Clipboard.SetTextBuf(@buf);
                 List.Cells[ToPaste,1].Select;
                 List.PasteSpecial(TranslateText('Текст'),False,False);
                 BufSize:=0;
                 ToPaste:=CurrentLine;
            end;
        end;
        WriteItogoIfNeed(TRUE);
        ProcessToNextLine;
        ProcessToNextLine;
        buf[BufSize]:=#0;
        ClipBoard.SetTextBuf(@buf);
        List.Cells[ToPaste,1].Select;
        Clipboard.Close;
        List.PasteSpecial(TranslateText('Текст'),False,False);
        WriteDopTables;
        HideColumnsIfEmpty;

        List.Cells[1,'X']:=FIRSTLINE;
        List.Cells[1,'Y']:=CurrentLine;
        List.Cells[1,'Z']:=ExcelColumnToNumber(LastColumn)+1;
        XLApp.Run('SetFont');
        PrgrBar.Progress:=round(valueprogr);
        PrgrBar.Refresh;
        XLApp.Visible:=TRUE;
    end;

//-------------------------------------------------------------
    procedure WriteToExcel2;
    // Основная процедура вывода в Excel отчета
    var i,ToPaste:integer;
        step,valueprogr,max:double;
    begin
        Init;
        ToPaste:=FIRSTLINE;
        if NumOfFields=0 then max:=Q.RecordCount
        else max:=NumOfFields;
        step:=(endprogr-startprogr-5)/max;valueprogr:=startprogr;
        Clipboard.Open;

        for i:=1 to FI.Size do
            PutToTemp(CurLineBuf,FI.Columns[i],'group');
        for i:=1 to FS.Size do
            PutToTemp(CurLineBuf,FS.Columns[i],'sum');
        ProcessToNextLine;

        for i:=1 to FI.Size do
            PutToTemp(CurLineBuf,FI.Columns[i],FI.Name[i]);
        for i:=1 to F.Size do
            PutToTemp(CurLineBuf,F.Columns[i],F.Name[i]);
        ProcessToNextLine;

        while (not Q.Eof) and ((NumOfFields=0) or (i<NumOfFields)) do
        begin
            for i:=1 to FI.Size do
                PutToTemp(CurLineBuf,FI.Columns[i],Q.FieldByName(FI.Name[i]).AsString);
            WriteLine;
            Q.Next;
            valueprogr:=valueprogr+step;
            if PrgrBar.Progress<>round(valueprogr) then
            begin
                PrgrBar.Progress:=round(valueprogr);
                PrgrBar.Refresh;
            end;
            if BufSize>=MAXDOPBUFSIZE then
            begin
                 buf[BufSize]:=#0;
                 Clipboard.SetTextBuf(@buf);
                 List.Cells[ToPaste,1].Select;
                 List.PasteSpecial(TranslateText('Текст'),False,False);
                 BufSize:=0;
                 ToPaste:=CurrentLine;
            end;
        end;
        ProcessToNextLine;
        ProcessToNextLine;
        buf[BufSize]:=#0;
        ClipBoard.SetTextBuf(@buf);
        List.Cells[ToPaste,1].Select;
        Clipboard.Close;
        List.PasteSpecial(TranslateText('Текст'),False,False);

        List.Cells[1,'X']:=FIRSTLINE;
        List.Cells[1,'Y']:=CurrentLine;
        List.Cells[1,'Z']:=ExcelColumnToNumber(LastColumn)+1;

        HideColumnsIfEmpty;
        XLApp.Run('Itogi');
        PrgrBar.Progress:=round(valueprogr);
        PrgrBar.Refresh;
        XLApp.Visible:=TRUE;
    end;

begin
     q.Last; q.First;
     ProcessFields;
     ProcessDopTables;
     if PromItogi and not IsCompressed then WriteToExcel2
     else WriteToExcel;
     result:=CurrentLine;
end;
//==============================================================================
procedure ActivateXLApp(PName, FName: string; ListNumber: integer; var XLApp, List: Variant;
  ListName: string=''; Extention: string='xls');
var
  PatternName, FileName: String;
  Unknown: iUnknown;
begin
  if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
    XLApp := GetActiveOleObject('Excel.Application')
  else
    XLApp := CreateOleObject('Excel.Application');

  if LANGUAGE = 1 then
    PatternName := GetMainDir+'Pattern\'+PName+'_ukr.'+Extention;
  if (LANGUAGE = 0) or not FileExists(PatternName) then
    PatternName := GetMainDir+'Pattern\'+PName+'.'+Extention;

  if INTERACTIVE_LAUNCH_MODE then
  begin
    FileName := GetUniqueFilename(GetMainDir+'Doc',FName);
    CopyFile(PChar(PatternName),PChar(Filename),FALSE);
  end
  else
    FileName := PatternName;

  XLApp.Workbooks.Add(Filename);
  if ListName = '' then
    List:=XLApp.ActiveWorkBook.Worksheets[ListNumber]
  else
    List := XLApp.ActiveWorkBook.Worksheets[ListName];
end;
//==============================================================================
procedure GetExcelCoord(p_Coord:string;var pp_Col,pp_Row:integer);
var n:integer;
begin
    if p_Coord[2] in ['A'..'Z'] then n:=3
                                else n:=2;
    pp_col:=ExcelColumnToNumber(copy(p_Coord,1,n-1));
    pp_Row:=StrToInt(copy(p_Coord,n,length(p_Coord)));
end;
//==============================================================================
procedure GoToCell(p_List:Variant;p_Coord:string);
var col,row: integer;
begin
    GetExcelCoord(p_Coord,col,row);
    p_List.Cells[row,col].Select;
end;
//==============================================================================
procedure PutToCell(List:Variant;Coord,s:string);
var x,y:integer;
begin
     y:=ord(Coord[1])-ord('A')+1;
     x:=StrToInt(copy(Coord,2,255));
     List.Cells[x,y]:=s;
end;
//==============================================================================
function IsSymbol(c:char;Symbols:string):Boolean;
// Проверяет, является ли символ c одним из перечисленных в строке Symbols
var i:integer;
begin
     for i:=1 to Length(Symbols) do
         if Symbols[i]=c then
         begin
             result:=TRUE;exit;
         end;
     result:=FALSE;
end;
//==============================================================================
function RemoveSymbols(s,Symbols:string;safe:Boolean=TRUE):string;
// Удалает из строки s символы, перечисленные в строке Symbols не трогая то,
// что внутри фигурных скобок если safe
var res:string;
    i:integer;
    flag:Boolean;
begin
     res:='';flag:=FALSE;
     for i:=1 to Length(s) do
     begin
         if s[i]='{' then flag:=TRUE;
         if s[i]='}' then flag:=FALSE;
         if (not IsSymbol(s[i],Symbols)) or flag and safe then
            res:=res+s[i];
     end;
     result:=res;
end;
//==============================================================================
function RemoveSpaces(s:string):string;
begin
     result:=RemoveSymbols(s,' '+chr(8),FALSE);
end;
//==============================================================================
function ReadWordUntil(s,sep:string;start:integer;var res:string):integer;
// Читает слово от позиции start до конца строки или до символа, перечисленного в
// строке sep. Помещает результат в res, возвращает позицию курсора на конце прочитанного
// слова +1
var i:integer;
begin
    res:='';
    for i:=start to Length(s) do
    begin
         if not IsSymbol(s[i],sep) then
            res:=res+s[i]
         else
            break;
    end;
    result:=i;
end;
//==============================================================================
procedure ChangeColumns(List:Variant;Line:integer;Let,Order:string);
// Меняет местами колонки в List
// Line - номер строки, в которой находятся заголовки
// Let - строка вида "BEF", буквы колонок, которые надо поменять местами
// Order - строка вида "312", новый порядок
const MAXSIZE=10;
var Names:array[1..MAXSIZE] of string;
    Width:array[1..MAXSIZE] of integer;
    Size,i,n:integer;

    function Test:boolean;
    begin
         if Length(Let)<>Length(Order) then
            result:=FALSE
         else
            result:=TRUE;
    end;

begin
    if not Test then
    begin
         showmessage('ChangeColumn: invalid arguments!!!');
         exit;
    end;

    Size:=Length(Let);
    for i:=1 to Size do
    begin
         Names[i]:=List.Cells[Line,Let[i]].Value;
         Width[i]:=List.Columns[Let[i]].ColumnWidth;
    end;
    for i:=1 to Size do
    begin
         n:=ord(Order[i])-ord('0');
         List.Cells[Line,Let[i]]:=Names[n];
         List.Columns[Let[i]].ColumnWidth:=Width[n];
    end;
end;
//==============================================================================
function RusLowerCase(s:string;invert:Boolean=FALSE):string;
begin
  if Invert then
    result:=ANSIUpperCase(s)
  else
    result:=ANSILowerCase(s);
end;
//==============================================================================
function RusUpperCase(s:string):string;
begin
  result:=RusLowerCase(s,TRUE);
end;
//==============================================================================
procedure ShowTextInMemo(s:string);
// вызывает форму с Memo и показывает в нем s
var M: TMemoForm;
begin
  Application.CreateForm(TMemoForm,M);
  M.RE1.Lines.Add(s);
  TrimRight(M.RE1.Lines.Text);
  M.Show;
  M.RE1.Repaint;
end;
//==============================================================================
procedure ShowNiceSql(q:TOilQuery);
// вызывает форму с Memo и показывает в нем s
var M:TMemoForm;
begin
    Application.CreateForm(TMemoForm,M);
    M.RE1.Lines.Add(GetNiceSql(FullSqlText(q)));
    M.Show;
    M.RE1.Repaint;
end;
//==============================================================================
procedure ActivateProgressBar(var pr:TProgrForm;Show:Boolean=TRUE);
begin
     Application.CreateForm(TProgrForm,pr);
     pr.Progress:=0;
     if Show then pr.Show
             else pr.Visible:=FALSE;
     pr.Repaint;
end;
//==============================================================================
procedure SetProgressBar(n:integer;var pr:TProgrForm);
begin
     pr.Progress:=n;
     pr.Repaint;
end;
//==============================================================================
function IsInList(substr,s:string):Boolean;
// проверяем, есть ли поле s в списке полей, разделенных точкой с запятой (;)
// оно должно ограничено с обоих сторон началом, концом слова, или точкой с запятой (;)
var k:integer;
begin
     k:=pos(lowercase(substr),lowercase(s)); // k - позиция подстроки s
     if (k<>0) // если такая подстрока есть
               and (      ((k=1) or (s[k-1]=';')) // и слева находится начало слова или (;)
                      and ((k+length(substr)-1=length(s)) or (s[k+length(substr)]=';'))
                      // а справа конец слова или (;)
                   ) then
         result:=TRUE
     else
         result:=FALSE;
end;
//==============================================================================
function GetTitle:string;
begin
     result:=GetOrgName(Main.Main_Id,Main.Inst)+'; '+DateToStr(Date)+'; '+TimeToStr(Time)+
       DevideRusUkr('; Версия @; Версiя ')+Version.fileversion; // *NO_TRANSLATE*
end;
//==============================================================================
procedure PutTitle(List:Variant;Coord:string='A1');
begin
     PutToCell(List,Coord,GetTitle);
end;
//==============================================================================
procedure SetCurrentMonth(D1,D2:TDateEdit);
var Year,Month,Day:Word;
    date1,date2:TDateTime;
begin
    DecodeDate(Date,Year,Month,Day);
    GetMonthLimits(month,year,date1,date2);
    D1.Date:=date1;
    D2.Date:=date2;
end;
//==============================================================================
procedure SetPrevMonth(D1,D2:TDateEdit);
var Year,Month,Day:Word;
    date1,date2:TDateTime;
begin
    DecodeDate(Date,Year,Month,Day);
    if Month=1 then begin
      dec(Year);
      Month:=12;
    end else
      dec(Month);
    GetMonthLimits(month,year,date1,date2);
    D1.Date:=date1;
    D2.Date:=date2;
end;
//==============================================================================
function StringIsNumber(s:string;n:integer=0):Boolean;
// является ли строка целым числом без знака длиной n (если n=0, то без проверки длины)
var i:integer;
begin
     if (length(s)<>n) and (n>0) then result:=FALSE
     else
     begin
         for i:=1 to length(s) do
             if (s[i]<'0') or (s[i]>'9') then
             begin
                  result:=FALSE;
                  exit;
             end;
         result:=TRUE;
     end;
end;
//==============================================================================
procedure AddToArray(var ToArray:array of variant;var NextIndex:integer;FromArray:array of variant;FromSize:integer);
var i:integer;
begin
     for i:=0 to FromSize-1 do
         ToArray[NextIndex+i]:=FromArray[i];
     NextIndex:=NextIndex+FromSize;
end;
//==============================================================================
procedure ChangePattern
  (OldName,// имя шаблона, который будем преобразовывать
   NewName:string;// имя, под которым будет записан преобразованный шаблон
   // если в именах встречается символ / то имя используется без изменений
   // иначе имя дополняется директорией GetMainDir+'/pattern/'
   PageNumber:integer; // номер листа в отчете
   Params:array of variant;// в массиве находятся тройки (столбец, строка, значение)
   ArraySize:integer;// размер массива деленный на три
   HiddenColumns:string); // строка, в которой через точку с запятой перечислены колонки, которые надо скрыть

var XLApp,List:Variant;
    i,j,line:integer;
    column,value,s:string;
begin
     if Pos('\',OldName)=0 then OldName:=GetMainDir+'pattern\'+OldName;
     if Pos('\',NewName)=0 then NewName:=GetMainDir+'pattern\'+NewName;
     XLApp := CreateOleObject('Excel.Application');
     try
         XLApp.Workbooks.Add(OldName);
         List := XLApp.ActiveWorkbook.WorkSheets[1];
         for i:=0 to ArraySize-1 do
         begin
              line:=Params[i*3+1];
              column:=Params[i*3];
              value:=Params[i*3+2];
              List.Cells[line,column]:=value;
         end;

         i:=1;
         while i<=length(HiddenColumns) do
         begin
              for j:=i+1 to length(HiddenColumns) do
                  if HiddenColumns[j]=';' then
                     break;
              s:=copy(HiddenColumns,i,j-i);
              List.Columns[s].EntireColumn.Hidden:=TRUE;
              i:=j+1;
         end;

         XLApp.DisplayAlerts:=FALSE;
         XLApp.ActiveWorkbook.SaveAs(NewName);
         XLApp.Quit;
     except
         XLApp.DisplayAlerts:=FALSE;
         XLApp.Quit;
     end;
end;
//==============================================================================
function GetUniqueFileName(directory,filename:string):string;
var i:integer;
begin
     i:=1;
     repeat
         result:=directory+'\'+filename+'-'+IntToStr(i)+'.xls';
         inc(i);
     until not FileExists(result);
end;

function BoolToYN(b:boolean):string;
begin
  if b then
    Result := 'Y'
  else
    Result := 'N';
end;
//==============================================================================
function IntToBool(n:integer):Boolean;
begin
     if n=0 then result:=FALSE
            else result:=TRUE;
end;
//==============================================================================
function BoolToInt(b:boolean):integer;
begin
     if b then result:=1
          else result:=0;
end;
//==============================================================================
function BoolToDaNet(b:boolean):string;
begin
     if b then result:=TranslateText('Да')
          else result:=TranslateText('Нет');
end;
//==============================================================================
function BoolToDa_(b:boolean):string;
begin
     if b then result:=TranslateText('Да')
          else result:='';
end;
//==============================================================================
function BoolTo_(b:boolean;p_TRUE,p_FALSE:Variant):Variant;
begin
     if b then result:=p_TRUE
          else result:=p_FALSE;
end;
//==============================================================================
function FlipListViewItems(LV: TListView; n1,n2: integer):Boolean;
var Item:TListItem;
begin
     if (n1>=LV.Items.Count) or (n1<0) or (n2>=LV.Items.Count) or (n2<0) then
        result:=FALSE
     else begin
         Item:=TListItem.Create(LV.Items);
         Item.Assign(LV.Items[n1]);
         LV.Items[n1].Assign(LV.Items[n2]);
         LV.Items[n2].Assign(Item);
         LV.Items[n2].Selected:=TRUE;
         Item.Destroy;
         result:=TRUE;
     end;
end;
//==============================================================================
function TrueFalseToBool(s:string):Boolean;
begin
     if uppercase(trim(s))='TRUE' then result:=TRUE
     else if uppercase(trim(s))='FALSE' then result:=FALSE
     else Raise Exception.Create(TranslateText('Функция TrueFalseToBool: вызов с некорректным аргументом ')+s);
end;
//==============================================================================
procedure GetNameValue(s:string;var name,value:string;Separator:char='=');
var n:integer;
begin
     n:=pos(Separator,s);
     if n=0 then
        Raise Exception.Create(TranslateText('GetNameValue: отсутствует разделитель ')+Separator+TranslateText(' в аргументе')+#13#10+s)
     else begin
        name:=trim(system.copy(s,1,pos(Separator,s)-1));
        value:=trim(system.copy(s,pos(Separator,s)+1,length(s)));
     end;
end;
//==============================================================================
procedure SelectRichEditLine(var RE: TRichEdit; NLine: integer);
var n,i:integer;
begin
     if RE.Lines.Count+1<NLine then exit;
     n:=0;
     for i:=0 to NLine-2 do
         n:=n+length(RE.Lines[i])+2;
     RE.SelStart:=n;
     RE.SelLength:=length(RE.Lines[NLine-1]);
end;
//==============================================================================
function GetFirstDayOfNextMonth(date1:TDateTime):TDateTime;
var year,month,day: word;
begin
     DecodeDate(date1,year,month,day);
     if month<>12 then result:=EncodeDate(year,month+1,1)
                  else result:=EncodeDate(year+1,1,1);
end;
//==============================================================================
function FloatMin(x,y:real):real;
begin
     if x<y then result:=x
            else result:=y;
end;
//==============================================================================
function GetTextFromFile(filename:string; var buf:string):Boolean;
var F: Text;
    s: string;
begin
     if not FileExists(filename) then begin
        result:=FALSE;
        exit;
     end;
     Assign(F,filename);
     Reset(F);
     buf:='';
     while not Eof(F) do begin
         readln(F,s);
         buf:=buf+s+#13#10;
     end;
     Close(F);
     result:=TRUE;
end;
//==============================================================================
procedure GetStringListFromFile(filename:string;SL:TStringList);
var F: Text;
    s: string;
begin
     if not FileExists(filename) then
        Raise Exception.Create(TranslateText('Файл не существует: ')+filename);
     SL.Clear;
     Assign(F,filename);
     Reset(F);
     while not Eof(F) do begin
         readln(F,s);
         SL.Add(s);
     end;
     Close(F);
end;
//==============================================================================
function GetWordUntil(text:string;end_symbol:char;var i:integer;res:string):string;
var InsideApostrophes: Boolean;
begin
     result:='';
     if (i>length(text)) or (i<1) then begin
        res:=TranslateText('GetWordUntil: Аргумент i=')+IntToStr(i)+TranslateText(' выходит за пределы допустимого');
        exit;
     end;
     InsideApostrophes:=FALSE;
     text:=text+' ';
     while i<length(text) do begin
           if (text[i]=end_symbol) and not InsideApostrophes then begin
              result:=result+text[i];
              res:='Ok';
              exit;
           end else if text[i]='''' then begin
               InsideApostrophes:=not InsideApostrophes;
               result:=result+text[i];
           end
     end;
     result:='';
     res:=TranslateText('GetWordUntil: Не найден символ ')+end_symbol;
end;
//==============================================================================
function GetWord(text:string; symbols: TCharSet; var i:integer; startsymbols: TCharSet=[]):string;
// читает слово из text начиная с позиции i. За слово катит всякая фигня в кавычках
// (два кавычки подряд считаются за один символ) или последовательность символов из symbols.
// позиция i сдвигается на начало следующего слова или за конец строки
begin
     if (i>length(text)) or (i<1) then begin
        result:='';
        exit;
     end;
     text:=text+' ';
     result:=text[i]; inc(i);
     if result='''' then
        while i<length(text) do begin
              if text[i]='''' then
                 if text[i+1]='''' then begin
                    result:=result+'''''';
                    inc(i);
                 end else begin
                    result:=result+'''';
                    inc(i);
                    exit;
                 end
              else result:=result+text[i];
              inc(i);
        end
     else if result[1] in (symbols) then
        while (i<=length(text)) and (text[i] in symbols) do begin
              result:=result+text[i];
              inc(i);
        end
     else if result[1] in (startsymbols) then
        if (i<=length(text)) and (text[i]=result[1]) then begin
           result:=result[1]+text[i]; inc(i);
        end else
           while (i<=length(text)) and (text[i] in symbols) do begin
              result:=result+text[i];
              inc(i);
           end;
end;
//==============================================================================
function GetShortPPONName(name:string):string;
var n:integer;
begin
     if copy(name,1,8)=TranslateText('Филиал №') then begin
        name:=copy(name,9,length(name));
        name:=trim(copy(name,pos(' ',name),length(name)));
     end;
     n:=pos(TranslateText('ОАО'),name);
     if n>0 then name:=trim(copy(name,1,n-1));
     result:=name;
end;
//==============================================================================
function Nvl(x,y:Variant):Variant;
begin
     if VarIsNull(x) then result:=y
                     else result:=x;
end;
//==============================================================================
function Decode(a:array of Variant):Variant;
var i:integer;
begin
  if Length(a)<2 then Raise Exception.Create(TranslateText('Функция decode: вызов с недостаточным количеством аргументов'));
  i:=1;
  while i<High(a) do begin
    if a[0]=a[i] then begin
      result:=a[i+1];
      exit;
    end;
    i:=i+2;
  end;
  if length(a) mod 2 = 0 then result:=a[High(a)]
  else result:=a[0];
end;
//==============================================================================
function NotInObl:string;
begin
    if MAIN_ORG.ORG_TYPE in [4,10] then result:='N'
    else result:='Y';
end;
//==============================================================================
function GetMainDir:string;
var s:string;
    i:integer;
begin
     s:=Application.ExeName;
     for i:=length(s) downto 1 do
         if s[i]='\' then break;
     result:=copy(s,1,i);
end;
//==============================================================================
function Instr(substr,str:string;first:integer=1;num:integer=1;cover:Boolean=FALSE):integer;
var n,k:integer;
begin
    result:=0;
    str:=copy(str,first,length(str));
    n:=pos(substr,str);
    if n=0 then exit
    else
       if num=1 then result:=first+n-1
       else begin
          k:=BoolTo_(cover,1,length(substr));
          result:=first+n+k-1+Instr(substr,copy(str,n+k,length(str)),1,num-1,cover);
       end;
end;
//==============================================================================
function ReplaceSubstr(str,substr1,substr2:string):string;
var n:integer;
begin
     n:=pos(substr1,str);
     if n=0 then result:=str
     else result:=copy(str,1,n-1)+substr2+copy(str,n+length(substr1),length(str));
end;
//==============================================================================
function ReplaceAllSubstr(str, // строка, в которой производится замена
                          substr1, // какую подстроку заменять
                          substr2:string; // на какую построку заменять
                          p_InQuotas:Boolean=FALSE {проводить ли замену внутри кавычек}):string;
var i,j:integer;
    InQuotas: Boolean; // отображает состояние "внутри кавычек" или нет
begin
    if (pos('''',substr1)>0) and not p_InQuotas then
       Raise Exception.Create(TranslateText('ReplaceAllSubstr: параметр substr1 может содержать кавычку,')+#13#10+
                              TranslateText('только если параметр p_InQuotas=TRUE'));
    str:=str+' '; // добавляем в конце необрабатываемый пробел чтобы str[i+1] никогда не вылетал с ошибкой
    InQuotas:=FALSE;
    result:='';
    i:=1; // будет двигаться по строке str
    j:=1; // будет двигаться по подстроке, с которой заменять
    while i<length(str) do begin
        if (str[i]='''') and not p_InQuotas then begin // если кавычка
           if j>1 then begin // сравнение удачно началось, но неудачно кончилось
                    result:=result+copy(substr1,1,j-1);
                    j:=1;
           end;
           if str[i+1]='''' then begin // смотрим, есть ли вторая
              result:=result+''''''; // и если есть, то добаавляем без изменений
              i:=i+2
           end else begin
              InQuotas:=not InQuotas; // иначе меняем состояние "в кавычках" на противоположное
              result:=result+'''';
              inc(i);
           end
        end else begin
           if not InQuotas or p_InQuotas then begin
           // если мы находимся не в кавычках либо то, что в кавычках тоже надо менять
              if str[i]=substr1[j] then begin
                 inc(j);
                 if j>length(substr1) then begin // прошло полное сравнение с подстрокой
                    result:=result+substr2;
                    j:=1;
                 end;
              end else begin
                 if j>1 then begin // сравнение удачно началось, но неудачно кончилось
                    result:=result+copy(substr1,1,j-1);
                    j:=1;
                 end;
                 result:=result+str[i];
              end;
           end else result:=result+str[i];
           inc(i);
        end;
    end;

    {result:='';
    repeat
        n:=pos(substr1,str);
        if n>0 then begin
           result:=result+copy(str,1,n-1)+substr2;
           str:=copy(str,n+length(substr1),length(str));
        end;
    until n=0;
    result:=result+str;}
end;
//==============================================================================
procedure Str2StringList(s:string;var sl:TStringList;Sep:string=',');
var n,i:integer;
begin
     if not Assigned(sl) then sl:=TStringList.Create;
     sl.Clear;
     if s='' then exit;
     n:=1;
     if not IsSymbol(s[length(s)],Sep) then s:=s+Sep[1];
     for i:=1 to length(s) do
         if IsSymbol(s[i],Sep) then begin
            sl.Add(trim(copy(s,n,i-n)));
            n:=i+1;
         end;
end;
//==============================================================================
function GetOrgRating(anketa:string):real;
var i:integer;
begin
     result:=0;
     for i:=1 to length(anketa) do
         result:=result+OrgAnketaKoeff[i,ord(anketa[i])-ord('0')];
end;
//==============================================================================
procedure GetOrgAnketaKoeff;
var q:TOilQuery;
begin
    q := nil;    
    InitQuery(q);
    q.Sql.Text:=' select q.numb as q_numb,a.numb as a_numb,a.koeff*q.koeff as koeff'+
                ' from oil_anketa_a a,oil_anketa_q q '+
                ' where q.id=a.anketa_q_id '+
                ' order by q_numb,a_numb ';
    _OpenQuery(q);
    while not q.Eof do begin
        OrgAnketaKoeff[q.FieldByName('q_numb').AsInteger,q.FieldByName('a_numb').AsInteger]:=q.FieldByName('koeff').AsFloat;
        q.Next;
    end;
    q.Destroy;
end;
//==============================================================================
function GetOrgKategory(anketa:string):string;
var r:real;
    c:string;
begin
    if anketa=DEFAULT_ANKETA then result:=''
    else begin
       r:=GetOrgRating(anketa);
       if abs(r-Round(r))<=0.1 then c:=''
       else if r>Round(r) then c:='+'
       else c:='-';
       result:=chr(ord('E')-Round(r)+1)+c;
    end;
end;
//==============================================================================
function GetKOSCondition(variable:string;Kom,Own,Store:Boolean):string;
begin
     if Kom and Own and Store then result:=''
     else if not (Kom or Own or Store) then result:=' and 0=1 '
     else begin
          result:=' and '+variable+' in (';
          if Kom then result:=result+'''K'',';
          if Own then result:=result+'''O'',';
          if Store then result:=result+'''S'',';
          result[length(result)]:=')';
          result:=result+' ';
     end;
end;
//==============================================================================
function GetConstructedString(str:array of string;cond:array of boolean;sep:string=',';EmptyValue:string=''):string;
var i:integer;
begin
     if high(str)<>high(cond) then
        Raise Exception.Create(TranslateText('GetConstructedString: неравные длины массивов'));
     result:='';
     for i:=0 to high(str) do
         if cond[i] then
            result:=result+str[i]+sep;
     if result<>'' then
        result:=copy(result,1,length(result)-1);
     if result='' then result:=EmptyValue;
end;
//==============================================================================
function RemoveDuplSymbols(s:string;c:char=' '):string;
// если символ с встречается два и более раза подряд, лишние удаляются
var i:integer;
begin
     result:='';
     for i:=1 to length(s) do
         if (s[i]<>c) or (s[i]=c) and ((i=1) or (s[i-1]<>c)) then
         // если не тот символ или тот, но перед ним не тот
               result:=result+s[i];
end;
//==============================================================================
function GetTruncName(s:string):string;
// удаляет из строки лидирующие и замыкающие пробелы, а так же
// всякие "неправильные символы", а так же два и больше пробела подряд
begin
     s:=trim(s);
     s:=RemoveSymbols(s,'''".,:-;№'+#9,FALSE);
     s:=RemoveDuplSymbols(s);
     result:=s;
end;
//==============================================================================
procedure GetMonthLimits(p_Month,p_Year:integer;var pp_DateBegin,pp_DateEnd:TDateTime);
var day,month,year: word;
begin
     pp_DateBegin:=StrToDate('01.'+IntToStr(p_Month)+'.'+IntToStr(p_Year));
     DecodeDate(date,year,month,day);
     if (month=p_Month) and (year=p_Year) then pp_DateEnd:=Date
     else begin
        if p_Month=12 then begin
           p_Month:=1; inc(p_Year);
        end else inc(p_Month);
        pp_DateEnd:=StrToDate('01.'+IntToStr(p_Month)+'.'+IntToStr(p_Year))-1;
     end;
end;
//==============================================================================
function MultSymbols(p_Str:string;p_Set:TCharSet;p_Num:integer):string;
var i,j:integer;
begin
    result:='';
    for i:=1 to length(p_Str) do begin
        if p_Str[i] in p_Set then
           for j:=1 to p_Num do
               result:=result+p_Str[i]
        else result:=p_Str[i];
    end;
end;
//==============================================================================
function DoubleQuotas(p_Str:string):string;
begin
    result:=MultSymbols(p_Str,[''''],2);
end;
//==============================================================================
function CountSubstr(p_Str,p_Substr:string):integer;
begin
    result:=0;
    while pos(p_Substr,p_Str)>0 do begin
       inc(result);
       p_Str:=copy(p_Str,pos(p_Substr,p_Str)+length(p_Substr),length(p_Str));
    end;
end;
//==============================================================================
function pad(p_Str:string;p_Size:integer;p_Symbol:char=' ';p_Right:Boolean=TRUE):string;
var i:integer;
    s:string;
begin
    s:='';
    for i:=length(p_Str) to p_Size do s:=s+p_Symbol;
    if p_Right then result:=p_Str+s
               else result:=s+p_Str;
end;
//==============================================================================
function GetUserFromWindows: string;
var
  UserName : string;
  UserNameLen : Dword;
begin
  UserNameLen := 255;
  SetLength(userName, UserNameLen);
  if GetUserName(PChar(UserName), UserNameLen) then
    Result := Copy(UserName,1,UserNameLen - 1)
  else
    Result := 'Unknown';
end;
//==============================================================================
procedure log(p_Filename,p_Text:string);
var
  F: TextFile;
  ext: string;
begin
  if pos('\',p_Filename)=0 then
     p_Filename:=GetMainDir+p_Filename;
  if SysParamExists('TERMINAL') then
  begin
    ext := ExtractFileExt(p_Filename);
    p_Filename := ExtractFileDir(p_Filename) + '\' + ChangeFileExt(ExtractFileName(p_Filename),'')
      + '_' + ReplaceAllSubstr(GetUserFromWindows,'\','_') + ext;
  end;
  AssignFile(F,p_Filename);
  try Append(F) except Rewrite(F) end;
  Writeln(F,p_Text);
  CloseFile(F);
end;
//==============================================================================
procedure StartLog(p_Text: string; p_Terminate: Boolean = FALSE);
var s: string;
begin
  if (SplashForm <> nil) and (trim(p_Text) <> '') then
  begin
    SplashForm.lblProgress.Caption := ' '+trim(p_Text)+' ...';
    SplashForm.Repaint;
  end;
  if p_Text='' then s:=''
  else s:=DateToStr(Date)+' '+TimeToStr(Time)+': '+p_Text;
  log(GetMainDir+'start.log',s);
  if p_Terminate then
    log(GetMainDir+'start.log',TranslateText('Программа остановлена'));
end;
//==============================================================================
procedure QLog(p_Text: string);
var
  s: string;
  n: integer;
begin
  if SysParamExists('QLOG') then begin
    s:=SysParamValue('QLOG');
    if s='' then n:=0
    else n:=StrToInt(s);
    if (n=0) or (length(p_Text)>n) then
      log(GetMainDir+'q.log',p_Text);
  end;
end;
//==============================================================================
function GetTextWidth(p_Str:string):integer;
begin
    result:=trunc(TEXT_LETTER_WIDTH*length(p_Str));
end;
//==============================================================================
function FToStr(x:real):string;
begin
    result:=ReplaceSubstr(FloatToStr(x),',','.');
end;
//==============================================================================
function ItemInList(p_Item:Variant; p_List:string):Boolean;
var s:string;
begin
    s:=p_Item;
    result:=(p_List<>'') and (p_List[1]<>'!') and (pos(','+s+',',','+p_List+',')>0);
end;
//==============================================================================
procedure ShowDebugWarning(p_Str:string);
begin
    if Debugging then showmessage(p_Str);
end;
//==============================================================================
function GetDateDescription(p_Date1,p_Date2: TDateTime):string;
begin
    if p_Date1=p_Date2 then result:=TranslateText('За ')+DateToStr(p_Date1)
    else result:=DevideRusUkr('С @Вiд ',false)+DateToStr(p_Date1)+' по '+DateToStr(p_Date2); // *NO_TRANSLATE*
end;
//==============================================================================
procedure SwitchToRus;
begin
    LoadKeyBoardLayout('00000419',KLF_ACTIVATE);
end;
//==============================================================================
function GetShortOblName(p_Id: integer):string;
begin
    case p_ID of
           7 : result:=TranslateText('Сумы');
          12 : result:=TranslateText('Житомир');
          19 : result:=TranslateText('Кировоград');
          27 : result:=TranslateText('Черкассы');
          37 : result:=TranslateText('Хмельницкий');
          53 : result:=TranslateText('Ровно');
          55 : result:=TranslateText('Тернополь');
          99 : result:=TranslateText('Днепр');
         109 : result:=TranslateText('Умань');
         138 : result:=TranslateText('Чернигов');
         147 : result:=TranslateText('Кривбасс');
         149 : result:=TranslateText('Черновцы');
         181 : result:=TranslateText('Харьков');
         200 : result:=TranslateText('Львов');
         201 : result:=TranslateText('Николаев');
         313 : result:=TranslateText('Бровары');
         357 : result:=TranslateText('Луцк');
         382 : result:=TranslateText('Интер-трейдинг');
         394 : result:=TranslateText('Крым');
         400 : result:=TranslateText('Винница');
        4331 : result:=TranslateText('Тирос');
    else result:=TranslateText('Незивестна');
    end;
end;
//==============================================================================
function GetDirName(p_FileName: string):string;
var i: integer;
begin
    for i:=length(p_FileName) downto 1 do
        if p_FileName[i]='\' then break;
    if p_FileName[i]<>'\' then
       Raise Exception.Create(TranslateText('GetDirName: в имени файла "')+p_FileName+TranslateText('" не содержится названия директории'));
    result:=copy(p_FileName,1,i);
end;
//==============================================================================
function StrLike(s1,s2: string):Boolean;
begin
    result:=(RusLowerCase(RemoveDuplSymbols(trim(s1)))=RusLowerCase(RemoveDuplSymbols(trim(s2))));
end;
//==============================================================================
function StrIsNumber(s: string): Boolean;
var i: integer;
begin
    result:=TRUE;
    for i:=1 to length(s) do begin
        result:=(s[i]>='0') and (s[i]<='9');
        if not result then exit;
    end;
end;
//==============================================================================

function CompareVersion(p_Ver1,p_Ver2: string): integer;
(**
  Функция для сравнения номеров версий,
  если p_Ver1 больше то Result = 1
  если p_Ver2 больше то Result = -1
  иначе 0  
*)
var
  v1,v2: integer;
  function GetFirstNumber(var AVer:string):integer;
  var
    n:integer;
  begin
    n:=pos('.',AVer);
    if AVer='' then
      result:=0
    else if n=0 then
    begin
      result:=StrToInt(AVer);
      AVer:='';
    end
    else
    begin
      result:=StrToInt(nvl(copy(AVer,1,n-1),0));
      AVer:=copy(AVer,n+1,length(AVer));
    end;
  end;
begin
  try
    result:=0;
    if p_Ver1=p_Ver2 then
      result:=0
    else
    begin
      while ((p_Ver1<>'')or(p_Ver2<>'')) and (result=0) do
      begin
        v1:=GetFirstNumber(p_Ver1);
        v2:=GetFirstNumber(p_Ver2);        
        if v1>v2 then
          result:=1
        else if v1<v2 then
          result:=-1
        else
          result:=0;
      end;
    //if result<>0 then exit;
    end;
  except
    on E:Exception do
    begin
      MessageDlg('Ошибка в сравнении версий '+E.Message,mtError,[mbOk],0);
      result:=0;
    end;
  end;
end;
//==============================================================================
function FileNameMinusDir(p_FileName: string): string;
var i: integer;
begin
  if pos('\',p_FileName)=0 then result:=p_FileName
  else
    for i:=length(p_FileName) downto 1 do
      if p_FileName[i]='\' then begin
        result:=copy(p_FileName,i+1,length(p_FileName));
        exit;
      end;
end;
//==============================================================================
function FileNameMinusExt(p_FileName: string): string;
var i: integer;
begin
  for i:=length(p_FileName) downto 1 do
    if p_FileName[i]='\' then begin
      result:=p_FileName; exit;
    end else if p_FileName[i]='.' then begin
      result:=copy(p_FileName,1,i-1); exit;
    end;
  result:=p_FileName;
end;
//==============================================================================
function GetTalonNominal(p_Ser: string): double;
begin
  if length(p_Ser)<>3 then
    raise exception.create(TranslateText('GetTalonNominal: неверный аргумент ')+p_Ser);
  case p_Ser[3] of
    '0': result:=5;
    '1': result:=10;
    '2': result:=20;
    '3': result:=50;
    else
      raise exception.Create(TranslateText('GetTalonNominal: недопустимое значение ')+p_Ser);
  end;
end;
//==============================================================================
procedure InitLangValues;
var
  fname: string;
begin
  if LANGUAGE=0 then fname:='language\rus.ini'
  else fname:='language\ukr.ini';

  fname:=GetMainDir+fname;
  if not FileExists(fname) then
    raise exception.create(TranslateText('InitLangValues: не найден файл ')+fname);

  if not Assigned(slLangValues) then slLangValues:=TStringList.Create;
  slLangValues.Clear;
  slLangValues.LoadFromFile(fname);
end;
//==============================================================================
function LangText(p_Name: string): string;
begin
  result:=slLangValues.Values[ANSIUpperCase(p_Name)];
  if result='' then
    MessageDlg(TranslateText('LangText: в файле языка не найдена переменная ')+p_Name,mtWarning,[mbOk],0);
end;
//==============================================================================
procedure InitLanguage(p_Language: integer);
begin
  LANGUAGE:=p_Language;
  InitLangValues;
  ChangeOVLanguage(p_Language);
end;
//==============================================================================
procedure InitInterfaceLanguage(ALangId: Integer);
var
  I: Integer;
begin
  LANG_INTERFACE:=ALangId;
  WritePieceOfRegistry('Language',IntToStr(ALangId));
  for I:=0 to Screen.FormCount - 1
    do TCommonForm(Screen.Forms[I]).TranslateControls(ALangId);
  MainForm.AddReportsMenu;
end;
//==============================================================================
procedure MsWordDocAdd(FileName: string);
var
  PatternName:string;
begin
  if LANGUAGE = 1 then
    PatternName := GetMainDir+'Pattern\'+FileName+'_ukr.doc';
  if(LANGUAGE = 0) or not FileExists(PatternName) then
    PatternName := GetMainDir+'Pattern\'+FileName+'.doc';
  MsWord.Documents.Add(PatternName);
end;
//==============================================================================
procedure MsWordDotAdd(FileName: string; MSWord: Variant);
var
  PatternName: string;
begin
  if LANGUAGE = 1 then
    PatternName := GetMainDir+'Pattern\'+FileName+'_ukr.dot';
  if (LANGUAGE = 0) or not FileExists(PatternName) then
    PatternName := GetMainDir+'Pattern\'+FileName+'.dot';
  MsWord.FileNew(PatternName);
end;
//==============================================================================
function DevideRusUkr(p_Str: string; p_Interface: Boolean = false; p_Char: char='@'): string;
var
  i,lang: integer;
begin
  if p_Interface then lang:=LANG_INTERFACE
  else lang:=LANGUAGE;

  i:=2;
  while i<length(p_Str) do begin
    if (p_Str[i]=p_Char) and (p_Str[i-1]<>p_Char) and (p_Str[i+1]<>p_Char) then
      break;
    inc(i);
  end;
  if i>=length(p_Str) then result:=p_Str
  else if lang=0 then result:=copy(p_Str,1,i-1)
  else result:=copy(p_Str,i+1,length(p_Str));
  result:=RemoveDuplSymbols(result,p_Char);
end;
//==============================================================================
function BoolArrayToBinary(p_Array: array of boolean): integer;
var
  i,n: integer;
begin
  n:=1; result:=0;
  for i:=low(p_Array) to high(p_Array) do begin
    if p_Array[i] then result:=result+n;
    n:=n*2;
  end;
end;
//==============================================================================
function GetEditClassByName(p_Name: string): TEditClass;
var i: integer;
begin
  for i:=0 to High(EditClasses) do begin
    if uppercase(EditClasses[i].ClassName)=uppercase(p_Name) then begin
      result:=EditClasses[i];
      exit;
    end;
  end;
  result:=nil;
end;
//==============================================================================
procedure SetControlValue(p_Control: TControl; p_Value: Variant); overload;
begin
  if (p_Control.ClassName='TEdit') then
    (p_Control as TEdit).Text:=nvl(p_Value,'')
  else if p_Control.ClassName='TLabel' then
    (p_Control as TLabel).Caption:=nvl(p_Value,'')
  else if (p_Control.ClassName='TComboEdit')  then
    (p_Control as TComboEdit).Text:=nvl(p_Value,'')
  else if p_Control.ClassName='TDateEdit' then
    (p_Control as TDateEdit).Date:=nvl(p_Value,0)
  else if p_Control.ClassName='TCurrencyEdit' then
    (p_Control as TCurrencyEdit).Value:=nvl(p_Value,0)
  else if p_Control.ClassName='TRxSpinEdit' then
    (p_Control as TRXSpinEdit).Value:=nvl(p_Value,0)
end;
//==============================================================================
procedure FillTags(p_Q: TDataSet; p_CTRL: array of TControl; p_Fields: array of string);
var
  i: integer;
begin
  for i:=0 to High(p_CTRL) do
    p_CTRL[i].Tag:=p_Q.FieldByName(p_Fields[i]).AsInteger;
end;
//==============================================================================
procedure FillControls(p_Q: TDataSet; p_CTRL: array of TControl; p_Fields: array of string);
var
  i: integer;
begin
  for i:=0 to High(p_CTRL) do
    SetControlValue(p_CTRL[i],p_Q[p_Fields[i]]);
end;
//==============================================================================
function GetMonthBegin(p_Date: TDateTime): TDateTime;
var s: string;
begin
  s:=DateToStr(p_Date);
  s:='01'+copy(s,3,length(s));
  result:=StrToDate(s);
end;
//==============================================================================
procedure ClearControls(p_CTRL: array of TControl);
var i: integer;
begin
  for i:=0 to High(p_CTRL) do
    SetControlValue(p_CTRL[i],null);
end;
//==============================================================================
procedure FillVariants(p_Q: TDataSet; p_Var: array of PVariant; p_Fields: array of string);
var i: integer;
begin
  for i:=0 to High(p_Var) do
    p_Var[i]^:=p_Q[p_Fields[i]];
end;
//==============================================================================
procedure FillIntegers(p_Q: TDataSet; p_Var: array of PInteger; p_Fields: array of string);
var i: integer;
begin
  for i:=0 to High(p_Var) do
    p_Var[i]^:=p_Q[p_Fields[i]];
end;
//==============================================================================
function Val2Null( AValue,AWhatNull:Variant ):Variant;
begin
  if( AValue=AWhatNull )then
    Result:=Null
  else
    Result:=AValue
end;
//==============================================================================
procedure ClearGridColumns(AFormName: string);
var
  sFileName: string;
begin
  sFileName := GetMainDir + 'cache\columns_' + AFormName + '.cfg';
  if FileExists(sFileName) then
    DeleteFile(sFileName);
end;
//==============================================================================
procedure SaveGridColumns( AGrid:TDBGridEh;AFormName:string );
var
  i:integer;
begin
  for i:=0 to AGrid.Columns.Count-1 do
    if AGrid.Columns[i].Title.SortMarker<>smNoneEh then
      AGrid.Columns[i].Title.SortMarker:=smNoneEh;
  AGrid.Columns.SaveToFile(GetMainDir+'cache\columns_'+AFormName+'.cfg');
end;
//==============================================================================
procedure LoadGrigColumns( AGrid:TDBGridEh;AFormName:string );
var
  strColumnCfgPath:String;
  grTest:TDBGridEh;
  slTestFields,slRealFields:TStringList;
  i:integer;
  IsDefaultColumns:boolean;
  //------------------------------------------------------
  function FieldNames2StringList( AGrid:TDBGridEh ):TStringList;
  var
    i:integer;
    slFields:TStringList;
  begin
    slFields:=TStringList.Create();
    for i:=0 to AGrid.Columns.Count-1 do
      slFields.Add( AGrid.Columns.Items[i].FieldName );
    Result:=slFields;
  end;
  //------------------------------------------------------
begin
  try
    IsDefaultColumns:=False;
    strColumnCfgPath:=GetMainDir+'cache\columns_'+AFormName+'.cfg';
    if not DirectoryExists(GetMainDir+'cache') then
      CreateDir(GetMainDir+'cache');
    //Устанавливаем необходимый для сортировки параметр
    IF FileExists( strColumnCfgPath ) then
    begin
      grTest := TDBGridEh.Create( nil );
      grTest.Columns.LoadFromFile( strColumnCfgPath );
      // проверка соответстия по FIELDNAME
      slTestFields:=FieldNames2StringList( grTest );
      slRealFields:=FieldNames2StringList( AGrid );
      try
        for i:=0 to slRealFields.Count-1 do
          if( slTestFields.IndexOf( slRealFields.Strings[i] )=-1 )then
            IsDefaultColumns:=True;
        // проверка по количеству колонок
        IF (AGrid.Columns.Count = grTest.Columns.Count)and
          not IsDefaultColumns then // проверка на наличие новых колонок
          AGrid.Columns.LoadFromFile(strColumnCfgPath); // все нормально, загружаем из файла
      finally
        grTest.Free;
        slTestFields.Free;
        slRealFields.Free;
      end;
    end
    else
    for i:=0 to AGrid.Columns.Count-1 do
      AGrid.Columns[i].Title.TitleButton:=True;
  except on e:exception do
    Startlog('Не удалось загрузить колонки в '+AFormName+'->'+AGrid.Name);
  end;
end;
//==============================================================================
function TransDate(s: string; l: integer): string;
var n,m,m1,m2,y,d: string;
    m_n: integer;
begin
 n:=Copy(s,1,2); Delete(s,1,3);
 m:=Copy(s,1,2);
 m1:=Copy(s,1,1); Delete(s,1,1);
 m2:=Copy(s,1,1); Delete(s,1,2);
 y:=Copy(s,1,4);
 if (m <> '10') or (m <> '11') or (m <> '12') then m_n:=strtoint(m2)
  else if m='10' then m_n:=10
   else if m='11' then m_n:=11
    else m_n:=12;
 if l = 0 then
  begin
   case m_n of
    1: d:='января'; 5: d:='мая'; 9: d:='сентября';
    2: d:='февраля'; 6: d:='июня'; 10: d:='октября';
    3: d:='марта'; 7: d:='июля'; 11: d:='ноября';
    4: d:='апреля'; 8: d:='августa'; 12: d:='декабря';
   end; //case
   result:='"'+n+'"'+' '+d+' '+y+'г.';
  end; //if
 if l = 1 then
  begin
   case m_n of
    1: d:='січня'; 5: d:='травня'; 9: d:='вересня';
    2: d:='лютого'; 6: d:='червня'; 10: d:='жовтня';
    3: d:='березня'; 7: d:='липня'; 11: d:='листопад';
    4: d:='квітня'; 8: d:='серпня'; 12: d:='грудня';
   end; //case
   result:='"'+n+'"'+' '+d+' '+y+'р.';
  end; //if
end;
//==============================================================================
procedure GetRRRMenuPath(p_FileName: string; var pp_MenuPath,pp_Version: string; var pp_Position: integer);
var
  F: TextFile;
  s,path,inv: string;
  i,n,k: integer;
  sl: TStringList;
begin
  AssignFile(F,p_FileName);
  Reset(F);
  path:=''; pp_Position:=-1;pp_Version:='1.0';
  while not eof(F) do begin
    readln(F,s);
    s:=trim(s);
    if (s<>'') and (s[1]='[') and (s[length(s)]=']') and (s<>'[GLOBAL]') then break;
    n:=pos('=',s);
    if (n>0) and (trim(copy(s,1,n-1))='MENU') then begin
      path:=trim(copy(s,n+1,length(s)));
      k:=length(path);
      while (k>0) and (path[k]<>'\') do
        dec(k);
      if k>0 then
        path:=copy(path,1,k)+DevideRusUkr(copy(path,k+1,length(path)),true);
    end else if (n>0) and (trim(copy(s,1,n-1))='MENU_POSITION') then
      pp_Position:=StrToInt(trim(copy(s,n+1,length(s))));
    if (n>0) and (trim(copy(s,1,n-1))='INVISIBLE') then
      inv:=trim(copy(s,n+1,length(s)));
    if (n>0) and (trim(copy(s,1,n-1))='VERSION')
     then pp_Version:=trim(copy(s,n+1,length(s)));
   end;
  CloseFile(F);
  if path='' then begin
    path:='Отчеты\Дополнительные отчеты\'+FileNameMinusExt(FileNameMinusDir(p_FileName));
  end;
  sl:=TStringList.Create;
  Str2StringList(inv,sl);
  pp_MenuPath:=path;
  for i:=0 to sl.Count-1 do begin
    if   (sl[i]='COMMON') and (OrgFilMoveType=fmtCommon)
      or (sl[i]='BEFOREFIL') and (OrgFilMoveType=fmtBeforeFil)
      or (sl[i]='FILIAL') and (OrgFilMoveType=fmtFilial)
      or (sl[i]='OBL') and (MAIN_ORG.ORG_TYPE=4)
      or (sl[i]='PPON') and (MAIN_ORG.ORG_TYPE=3)
    then begin
      pp_MenuPath:='DISABLED';
      break;
    end;
  end;
end;
//==============================================================================
function FileCreateDate(AFile: String): TDateTime;
{Дата создания файла}
var
  intFileDate: Integer;
begin
  intFileDate := FileAge(AFile);
  Result := FileDateToDateTime(intFileDate);
end;
//==============================================================================
// Получает из строки тип дата/время
function GetDate_From_MonthDay(AMonthDay: string): TDateTime;
var
  Day, Month, Year: word;
begin
  try
    DecodeDate(GetSystemDate, Year, Month, Day);
    Result := EncodeDate(Year,
      StrToInt(copy(AMonthDay, pos('.',AMonthDay)+1,2)), // месяц
      StrToInt(copy(AMonthDay, 1,pos('.',AMonthDay)-1)) // день
      );
  except on E:Exception do
    raise Exception.CreateFmt('GetDate_From_MonthDay(%s): '+e.Message,
      [AMonthDay]);
  end;
end;
//==============================================================================

procedure DogFillContractors(DepId, DepInst, ClientId, ClientInst: integer;            {in}
                              var DepName, DepVLice, ClientName, ClientVLice: string); {out}
var qOrg, qANorg: TOilQuery;
begin
  //*** вписуємо сторону АН ***
  qOrg := TOilQuery.Create(nil);
  qANorg := TOilQuery.Create(nil);
  try try
    GetOrgData(qOrg, DepId, DepInst);
    if PRINT_DOG_FILIAL = 'Y' then
      if REKVIZIT_FILIALA_NK = 'Y' then     //реквізити АН
        begin
          GetOrgData(qANorg, qOrg.FieldByName('OblId').AsInteger,
                             qOrg.FieldByName('OblInst').AsInteger);
          GetOrgData(qANorg, qANorg.FieldByName('Par').AsInteger,
                             qANorg.FieldByName('Par_inst').AsInteger); //дістали реквізти ТОВ "А-Н"
          DepName := qANorg.FieldByName('Name').AsString + ', ';
          if qOrg.FieldByName('Dogovor').IsNull then
            DepVlice := LangText('V_Lice') + qOrg.FieldByName('Name').AsString + LangText('Gospodina') + qANorg.FieldByName('Boss').AsString +
                              LangText('Rob_po_dover') + qANorg.FieldByName('Dov').AsString + LangText('Ot') + qANorg.FieldByName('Dov_Date').AsString
          else
            DepVlice := qOrg.FieldByName('Dogovor').AsString;
        end
      else {if REKVIZIT_FILIALA_NK = 'Y'}
        begin
          if DOG_WITH_REKVIZIT_CONTROL = 'Y' then    //реквізити управи
            DepName := qOrg.FieldByName('OblName').AsString + ', '
          else  //реквізити свої
            DepName := qOrg.FieldByName('Name').AsString + ', ';
          if qOrg.FieldByName('Dogovor').IsNull then
            begin
              GetOrgData(qOrg, qOrg.FieldByName('Par').AsInteger,
                               qOrg.FieldByName('Par_inst').AsInteger);
              DepVLice := LangText('V_Lice_predsedately_pravl') + LangText('Gospodina') +
                               qOrg.FieldByName('Boss').AsString + LangText('Rob_po_ustavu');
            end
          else
            DepVLice := qOrg.FieldByName('Dogovor').AsString;
        end
    else  {if PRINT_DOG_FILIAL = 'Y'}  //реквізити свої
      begin
        DepName := qOrg.FieldByName('Name').AsString + ', ';
        if qOrg.FieldByName('Dogovor').IsNull then
          begin
            GetOrgData(qOrg, qOrg.FieldByName('Par').AsInteger,
                               qOrg.FieldByName('Par_inst').AsInteger);
            DepVLice := LangText('V_Lice_predsedately_pravl') + LangText('Gospodina') +
                              qOrg.FieldByName('Boss').AsString + LangText('Rob_po_ustavu');
          end
        else
          DepVLice := qOrg.FieldByName('Dogovor').AsString;
      end;

    //*** вписуємо сторону клієнта ***
    GetOrgData(qOrg, ClientId, ClientInst);
    ClientName := qOrg.FieldByName('Name').AsString + ', ';
    if not (qOrg.FieldByName('Dogovor').IsNull) then
      ClientVLice := qOrg.FieldByName('Dogovor').AsString
    else
      ClientVLice := '';
  except on E:Exception do
    MessageDlg('Error in ExFunc:DogFillContractors(' +IntToStr(DepId)    +','+ IntToStr(DepInst)    +','
                                                     +IntToStr(ClientId) +','+ IntToStr(ClientInst) +')'
                                                     +#13#10+ E.Message,
               mtError, [mbOk], 0
               );
  end; //try .. except
  finally
    qANorg.Free;
    qOrg.Free;
  end; //try .. finally
end;

procedure DogFillRekvizits(DepId, DepInst, ClientId, ClientInst: integer);
var qOrg, qFilialOrg, qANorg: TOilQuery;

  procedure RekvizitAN;
  begin{номер рядка}
    {1}SetCurField(false, LangText('Mestonah'));
    {2}SetCurField(true, qANorg.FieldByName('Name').AsString);
    {3}SetCurField(true, LangText('Adr') + qANorg.FieldByName('Addr').AsString + TranslateText(' тел. ') + qANorg.FieldByName('phone').AsString);
    {4}SetCurField(false, '');
    {5}SetCurField(false, LangText('Mestonah_fil'));
       SetCurField(false, '');
    {6}SetCurField(True, LangText('SvidPlatNDC') + qOrg.FieldByName('Svid_Num').AsString);
    {7}SetCurField(True, LangText('NalNum_UrLic') + qOrg.FieldByName('Nal_Num').AsString);
       SetCurField(false, '');
    {8}SetCurField(True, qOrg.FieldByName('Name').AsString);
    {9}SetCurField(True, LangText('Adr') + qOrg.FieldByName('Addr').AsString + TranslateText(' тел. ') + qOrg.FieldByName('Phone').AsString);
       // Р/С и Р/С НДС печатаем в одной строке
   {10}SetCurField(True, LangText('R/S') + qOrg.FieldByName('Rach_Chet').AsString);
       // Проверяем PRINT_RS, если 'Y' то печатаем Р/С НДС, а если 'N' то нет
       if PRINT_RS = 'Y' then
         SetCurField(True, LangText('RS_NDS') + qOrg.FieldByName('Rach_Chet_Nds').AsString)
       else
         SetCurField(false, '');
   {11}SetCurField(True, TranslateText('в ') + qOrg.FieldByName('Bank_Name').AsString);
   {12}SetCurField(True, TranslateText('МФО ') + qOrg.FieldByName('MFO').AsString);
       SetCurField(True, TranslateText('код ') + LangText('EDRPOU') + qOrg.FieldByName('Id_Num').AsString);
   {13}if qOrg.FieldByName('BOSS_POST').IsNull then
         SetCurField(True, TranslateText('Директор: ') + qOrg.FieldByName('Boss').AsString)
       else
         SetCurField(True, qOrg.FieldByName('BOSS_POST').AsString + ': ' + qOrg.FieldByName('Boss').AsString);
  end;

  procedure RekvizitFilial;
  begin{номер рядка}
    {1}SetCurField(True, LangText('SvidPlatNDC') + qFilialOrg.FieldByName('Svid_Num').AsString);
    {2}SetCurField(True, LangText('NalNum_UrLic') + qFilialOrg.FieldByName('Nal_Num').AsString);
    {3}SetCurField(True, qFilialOrg.FieldByName('Name').AsString);
    {4}SetCurField(True, LangText('Adr') + qFilialOrg.FieldByName('Addr').AsString + TranslateText(' тел. ') + qFilialOrg.FieldByName('phone').AsString);
       // Р/С и Р/С НДС печатаем в одной строке
    {5}SetCurField(True, LangText('R/S') + qFilialOrg.FieldByName('Rach_Chet').AsString);
       // Проверяем PRINT_RS, если 'Y' то печатаем Р/С НДС, а если 'N' то нет
       if PRINT_RS = 'Y' then
         SetCurField(True, LangText('RS_NDS') + qFilialOrg.FieldByName('Rach_Chet_Nds').AsString)
       else
         SetCurField(false, '');
    {6}SetCurField(True, TranslateText('в ') + qFilialOrg.FieldByName('Bank_Name').AsString);
    {7}SetCurField(True, TranslateText('МФО ') + qFilialOrg.FieldByName('MFO').AsString);
       SetCurField(True, TranslateText('код ') + LangText('EDRPOU') + qFilialOrg.FieldByName('Id_Num').AsString);
    {8}SetCurField(false, '');
    {9}SetCurField(True, qOrg.FieldByName('Name').AsString);
   {10}SetCurField(True, LangText('Adr') + qOrg.FieldByName('Addr').AsString + TranslateText(' тел. ') + qOrg.FieldByName('Phone').AsString);
       SetCurField(false, '');
   {11}if qOrg.FieldByName('BOSS_POST').IsNull then
         SetCurField(True, TranslateText('Директор: ') + qOrg.FieldByName('Boss').AsString)
       else
         SetCurField(True, qOrg.FieldByName('BOSS_POST').AsString + ': ' + qOrg.FieldByName('Boss').AsString);
   {12}SetCurField(true, ''); SetCurField(true, '');
   {13}SetCurField(true, '');
  end;

  procedure RekvizitOwn;
  begin
    {1}SetCurField(True, LangText('SvidPlatNDC') + qOrg.FieldByName('Svid_Num').AsString);
    {2}SetCurField(True, LangText('NalNum_UrLic') + qOrg.FieldByName('Nal_Num').AsString);
    {3}SetCurField(True, qOrg.FieldByName('Name').AsString);
    {4}SetCurField(True, LangText('Adr') + qOrg.FieldByName('Addr').AsString + TranslateText(' тел. ') + qOrg.FieldByName('Phone').AsString);
      // Р/С и Р/С НДС печатаем в одной строке
    {5}SetCurField(True, LangText('R/S') + qOrg.FieldByName('Rach_Chet').AsString);
      // Проверяем PRINT_RS, если 'Y' то печатаем Р/С НДС, а если 'N' то нет
      if PRINT_RS = 'Y' then
        SetCurField(True, LangText('RS_NDS') + qOrg.FieldByName('Rach_Chet_Nds').AsString)
      else
        SetCurField(false, '');
    {6}SetCurField(True, TranslateText('в ') + qOrg.FieldByName('Bank_Name').AsString);
    {7}SetCurField(True, TranslateText('МФО ') + qOrg.FieldByName('MFO').AsString);
      SetCurField(True, TranslateText('код ') + LangText('EDRPOU') + qOrg.FieldByName('Id_Num').AsString);
    {8}if qOrg.FieldByName('BOSS_POST').IsNull then
         SetCurField(True, TranslateText('Директор: ') + qOrg.FieldByName('Boss').AsString)
       else
         SetCurField(True, qOrg.FieldByName('BOSS_POST').AsString + ': ' + qOrg.FieldByName('Boss').AsString);
    {9}SetCurField(true, '');
   {10}SetCurField(true, ''); SetCurField(true, '');
   {11}SetCurField(true, '');
   {12}SetCurField(true, ''); SetCurField(true, '');
   {13}SetCurField(true, '');
  end;

begin
  //вписуємо реквізити АН
  qOrg := TOilQuery.Create(nil);
  qFilialOrg := TOilQuery.Create(nil);
  qANorg := TOilQuery.Create(nil);
  try try
    GetOrgData(qOrg, DepId, DepInst);
    GetOrgData(qFilialOrg, qOrg.FieldByName('OblId').AsInteger,
                           qOrg.FieldByName('OblInst').AsInteger);
    if PRINT_DOG_FILIAL = 'Y' then
      if REKVIZIT_FILIALA_NK = 'Y' then     //реквізити АН
        begin
          GetOrgData(qANorg, qFilialOrg.FieldByName('Par').AsInteger,
                                 qFilialOrg.FieldByName('Par_inst').AsInteger); //дістали реквізти ТОВ "А-Н"
          RekvizitAN;
        end
      else {if REKVIZIT_FILIALA_NK = 'Y'}
        if DOG_WITH_REKVIZIT_CONTROL = 'Y' then   //реквізити управи
          RekvizitFilial
        else //реквізити свої
          RekvizitOwn
    else
      RekvizitOwn;

    //вписуємо реквізити клієнта
    GetOrgData(qOrg, ClientId, ClientInst);
    if qOrg.FieldByName('Face').asInteger = 1 then
      begin  //фізична особа
        {1}SetCurField(True, LangText('FIO') + qOrg.FieldByName('Name').AsString);
        {2}SetCurField(True, LangText('NalNum') + qOrg.FieldByName('Id_Num').AsString);
        {3}SetCurField(True, LangText('Adr') + qOrg.FieldByName('Addr').AsString + TranslateText(' тел. ') + qOrg.FieldByName('Phone').AsString);
        {4}SetCurField(True, LangText('Pasport') + qOrg.FieldByName('Passport_Ser').AsString + ' № ' + qOrg.FieldByName('Passport_Num').AsString);
        {5}SetCurField(True, LangText('Vudan') + qOrg.FieldByName('Passport_When').AsString);
           SetCurField(True, qOrg.FieldByName('Passport_Whom').AsString);
        {6}SetCurField(True, '');
        {7}SetCurField(True, ''); SetCurField(True, '');
        {8}SetCurField(True, '');
      end
    else
      begin  //юридична особа
        {1}SetCurField(True, LangText('SvidPlatNDC') + qOrg.FieldByName('Svid_Num').AsString);
        {2}SetCurField(True, LangText('NalNum_UrLic') + qOrg.FieldByName('Nal_Num').AsString);
        {3}SetCurField(True, qOrg.FieldByName('Name').AsString);
        {4}SetCurField(True, LangText('Adr') + qOrg.FieldByName('Addr').AsString + TranslateText(' тел. ') + qOrg.FieldByName('Phone').AsString);
          // Р/С и Р/С НДС печатаем в одной строке
        {5}SetCurField(True, LangText('R/S') + qOrg.FieldByName('Rach_Chet').AsString);
          // Проверяем PRINT_RS, если 'Y' то печатаем Р/С НДС, а если 'N' то нет
          if PRINT_RS = 'Y' then
            SetCurField(True, LangText('RS_NDS') + qOrg.FieldByName('Rach_Chet_Nds').AsString)
          else
            SetCurField(false, '');
        {6}SetCurField(True, TranslateText('в ') + qOrg.FieldByName('Bank_Name').AsString);
        {7}SetCurField(True, TranslateText('МФО ') + qOrg.FieldByName('MFO').AsString);
           SetCurField(True, TranslateText('код ') + LangText('EDRPOU') + qOrg.FieldByName('Id_Num').AsString);
        {8}if qOrg.FieldByName('BOSS_POST').IsNull then
             SetCurField(True, TranslateText('Директор: ') + qOrg.FieldByName('Boss').AsString)
           else
             SetCurField(True, qOrg.FieldByName('BOSS_POST').AsString + ': ' + qOrg.FieldByName('Boss').AsString);
    end;

  except on E:Exception do
    MessageDlg('Error in ExFunc:DogFillRekvizits(' +IntToStr(DepId)    +','+ IntToStr(DepInst)    +','
                                                   +IntToStr(ClientId) +','+ IntToStr(ClientInst) +')'
                                                   +#13#10+ E.Message,
               mtError, [mbOk], 0
               );
  end;  //try .. except
  finally
    qANorg.Free;
    qFilialOrg.Free;
    qOrg.Free;
  end;  //try .. finally
end;
//==============================================================================
// Переклад тексту Src у текст Dest з формату ANSІ у формат OEM і навпаки
procedure TranslateOEM(Src: String; var Dest: String; ToOEM: Boolean);
var
  S: String;
begin
  S := Src;
  if ToOEM then
  begin // Перекодування з формату ANSІ у формат OEM
    while Pos('І', S) > 0 do
      S[Pos('І', S)] := 'I'; // Для коректної роботи з українською
    while Pos('і', S) > 0 do
      S[Pos('і', S)] := 'i'; // буквою 'і' (заміна на латинську)
    if Length(S) > 0 then
      CharToOem(PChar(S), PChar(Dest))
    else Dest := '';
  end
  else // Перекодування з формату OEM у формат ANSІ
    if Length(S) > 0 then
    begin
      OemToChar(PChar(S), PChar(Dest));
      while Pos('Ў', Dest) > 0 do
        Dest[Pos('Ў', Dest)] := 'І'; // Для коректної роботи з
      while Pos('ў', Dest) > 0 do
        Dest[Pos('ў', Dest)] := 'і'; // буквою 'ў' (заміна на українську)
    end
    else Dest := '';
end;
//==============================================================================
function OemToAnsiStr(const OemStr: string): string;
begin
  SetLength(Result, Length(OemStr));
  if Length(Result) > 0 then
    OemToCharBuff(PChar(OemStr), PChar(Result), Length(Result));
end;
//==============================================================================
function AnsiToOemStr(const OemStr: string): string;
begin
  SetLength(Result, Length(OemStr));
  if Length(Result) > 0 then
    CharToOemBuff(PChar(OemStr), PChar(Result), Length(Result));
end;
//==============================================================================
function GetNumbers(AText: string): Int64;
var
  vNum: string;
  i: integer;
begin
  vNum := '';
  for i := 1 to Length(AText) do
    if AText[i] in ['0'..'9'] then
      vNum := vNum + AText[i];
  if vNum = '' then
    vNum := '0';
  Result := StrToInt64(vNum);
end;
//==============================================================================
function TryVarToFloat(p_var: Variant): Real;
var
  s:string;
begin
  s := p_var;
  case DecimalSeparator of
    '.': s[pos(',',s)]:= DecimalSeparator ;
    ',': s[pos('.',s)]:= DecimalSeparator ;
  end;
  Result := StrToFloat(s);
end;

function GetTextFromClipboard(Text: TStrings):Boolean;
Var
  MaxCount:Word;
Begin
  Result:=False;
  MaxCount:=20;
  Repeat
    Try
      If Clipboard.HasFormat(CF_TEXT)Then
        Text.Text:=Clipboard.AsText;
      Result:=True;
      Sleep(500);
    Except
      Dec(MaxCount);
    End;
  Until Result Or (MaxCount<=0);
End;

end.
