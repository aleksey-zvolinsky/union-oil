unit ExcelFunc;
{### 1.00 }

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX,StdCtrls, Buttons, ExtCtrls, CurrEdit, RxLookup, Mask, ToolEdit, Db,math,
  DBTables,Excel8TLB, Grids, DBGrids, Progr, ComObj, Clipbrd, OilStd, Comctrls,
  DbGridEh,uOilQuery,Ora, uOilStoredProc{$IFDEF VER150},Variants{$ENDIF};


const PROMITOGI_NO=1;
      PROMITOGI_EXCEL=0;
      PROMITOGI_DELPHI=2;

      FT_DATA=0;
      FT_NUMERATOR=1;
      FT_CALCULATED=2;
      FT_VSEGO=3;

      FLD_USUAL=0;
      FLD_ITOGI=1;
      FLD_TOSUM=2;
      FLD_COMPRESSED=3;

      ITOGI_ONE=1;
      ITOGI_MULT=2;

type TIntSet=set of 1..255;
     TPuTOilQueryOption = (PQO_SeparateItogi);
     TPuTOilQueryStyle = (PQS_CommonStyle,PQS_DocStyle);
     TPuTOilQueryOptions = set of TPuTOilQueryOption;

     TReportField=record
         Name:string;
         FieldType:integer;
         Kind:integer;
         IName:string;
         Column:integer;
         ItogoByIName:Boolean;
         ItogiType:integer;
         Tag:integer;
         ConstantData:string;
         Visible: Boolean;
     end;

     TReportFields=class
     private
         FCount:integer;
         function GetField(n:integer):TReportField;
         procedure SetField(n:integer;RF:TReportField);
         constructor Create;
         //destructor Destroy;
     public
         FFields: array of TReportField;
         property Count:integer read FCount;
         property Fields[n:integer]:TReportField read GetField write SetField; default;
         function NewField:integer;
     end;

function PuTOilQueryToExcelEnh(p_XLApp,p_List:Variant;p_Q:TDataSet;p_FirstLine:integer;
                            p_PrgrBar:TProgrForm;p_Endprogr:double;
                            p_Fields:string;p_DopTables:string='';
                            p_PromItogi:integer=PROMITOGI_DELPHI;
                            p_Options: TPuTOilQueryOptions = [];
                            p_Style: TPuTOilQueryStyle = PQS_CommonStyle;
                            p_ItogiColumn: string = ''):integer;

procedure PutGridToExcel(p_Grid:TDbGridEh;p_Head:string='';p_SumFields:string='');
procedure PutGridEhToExcel(p_Grid:TDbGridEh;p_Head:string='';p_SumFields:string='');
procedure PutFullQToExcel(p_Q:TDataSet;p_List:Variant;p_FIRSTLINE:integer=6);
procedure DrawLineInExcelByRange(p_List:Variant;p_Range:string;
          p_Position:integer;p_LineStyle:integer=1;p_Weight:integer=xlSingle);
procedure DrawLineInExcel(p_List:Variant;p_Left,p_Right,p_Top,p_Bottom:integer;
          p_Position:integer;p_LineStyle:integer=1;p_Weight:integer=xlSingle);
procedure DrawNetInExcel(p_List:Variant;p_Left,p_Right,p_Top,p_Bottom:integer; p_Weight:integer=xlSingle;p_Inside:Boolean=TRUE);
function GetExcelRange(top,left,bottom,right:integer):string;
procedure SaveReport(XLApp: Variant; p_FileName: string);
function GetExcelColor(p_Name: string): integer;
procedure PutArrayToExcel(p_List: Variant; p_Row,p_Column: integer; p_Values: variant);
procedure ExFormat(p_List: Variant; p_Row,p_Column: integer; p_Args: array of variant); overload;
procedure ExFormat(p_List: Variant; p_Row: integer; p_Column: string; p_Args: array of variant); overload;
procedure ExFormat(p_List: Variant; p_Cell: string; p_Args: array of variant); overload;
procedure SetRowHeight(
  p_List: Variant;
  p_Row,p_Column: integer;
  p_SymNum: integer;
  p_Height: real=12.75);
procedure ExSetColumnWidth(p_List: Variant; p_Start: integer; p_Width: array of integer);
procedure ExPutValues(p_List: Variant; p_Row,p_Col: integer; p_Strings: array of variant);
function PutRNDataToExcel(p_List: Variant;p_Q:TDataSet;FirstLine,LastColumn:integer;DateField:TDateTime;
                     p_Fields,p_Sum:string): integer;
function FindExcelSheet(ASheetName: string; var AXLApp:variant; var AList: Variant; var ABookName: string): boolean;
procedure StateExcel(AXLApplication: Variant; AEnable: boolean);

implementation

uses ExFunc,RxMemDS,Main,MoneyFunc,uDBFunc;
//==============================================================================
constructor TReportFields.Create;
begin
     SetLength(FFields,1);
     FCount:=0;
end;
//==============================================================================
function TReportFields.GetField(n:integer):TReportField;
begin
     if (n>=Count) or (n<0) then
         Raise Exception.Create(TranslateText('TReportFields: недопустимый индекс'))
     else result:=FFields[n];
end;
//==============================================================================
procedure TReportFields.SetField(n:integer;RF:TReportField);
begin
     if (n>=Count) or (n<0) then
         Raise Exception.Create(TranslateText('TReportFields: недопустимый индекс'))
     else FFields[n]:=RF;
end;
//==============================================================================
function TReportFields.NewField:integer;
begin
     if (FFields=nil) or (High(FFields)<FCount) then
        SetLength(FFields,FCount*2+1);
     with FFields[FCount] do begin
          Name:='';
          FieldType:=FT_DATA;
          IName:=''; Column:=0;
          ItogoByIName:=FALSE;
          Kind:=FLD_USUAL;
          Tag:=0;
          ItogiType:=ITOGI_MULT;
          Visible:=TRUE;
     end;
     result:=FCount;
     inc(FCount);
end;
//==============================================================================
function PuTOilQueryToExcelEnh(p_XLApp,p_List:Variant;p_Q:TDataSet;p_FirstLine:integer;
                            p_PrgrBar:TProgrForm;p_Endprogr:double;
                            p_Fields:string;p_DopTables:string='';
                            p_PromItogi:integer=PROMITOGI_DELPHI;
                            p_Options: TPuTOilQueryOptions = [];
                            p_Style: TPuTOilQueryStyle = PQS_CommonStyle;
                            p_ItogiColumn: string = ''):integer;

const MAXBUFFERROWS=2000;
      DOPTBLBUF_INITSIZE=10;
      CUR_POS=0;
      PREV_POS=1;

var Fields:TReportFields;
    Buf,SummBuf,ICountBuf,IItogiBuf,DopTblBuf:Variant;
    Prev:TRxMemoryData;
    CurBufLine:integer;
    CurExcelLine:integer;
    BufHorSize:integer;
    ItogoDepth:integer;
    ItogoQuantity:integer;
    //CFStart,CFEnd:integer;
    DopTableField:string;
    DopTableTitle:string;
    DopTableSize:integer;
    DopTableRealSize:integer;
    NumSeq:integer;
    JustItogi: integer; // если только что подводились итоги n-го уровня, то n, вначале - ItogoDepth, иначе - 0.
    CFNum:integer; // номер сжатого поля, -1 если такового нет

    procedure ProcessOneField(p_Field:string);
    var i,n:integer;
        s,ErrMessage:string;

        function ReadSpec(p_Option:string):string;
        // возвращаем уточнение опции, которое идет после двоеточия
        // опция сюда попадает без начального \, в виде i:adsfasdf
        // или просто i, где i - любая буква
        begin
            case length(p_Option) of
              1: result:='';
              2: Raise Exception.Create(ErrMessage);
            else begin
                     if p_Option[2]<>':' then
                        Raise Exception.Create(ErrMessage);
                     result:=copy(p_Option,3,length(p_Option));
                 end;
            end;
        end;

        procedure TestType;
        begin
            if Fields[n].Kind<>FLD_USUAL then
               Raise Exception.Create(TranslateText('Ошибка! Для поля ')+Fields[n].Name+TranslateText(' дважды назначен тип'));
        end;

    begin
         n:=Fields.NewField;// создали новое поле и получили его номер
         p_Field:=RemoveSymbols(p_Field,' ',FALSE); // удалили пробелы
         i:=ReadWordUntil(p_Field,'\',1,s); // прочитали слово до значка \
         Fields.FFields[n].Name:=s; // это было имя, засунули его куда надо
         while i<length(p_Field) do begin
             i:=ReadWordUntil(p_Field,'\',i+1,s); // читаем до значка \
             ErrMessage:=TranslateText('Неизвестная опция \')+s+TranslateText(' для поля ')+Fields[n].Name;
             // получили текст ошибки, которые мы в случае чего покажем
             if length(s)=0 then Raise Exception.Create(ErrMessage);
             // вот и первый случай - значок \ есть, а опции нет
             case s[1] of
                'i': begin // по полю надо подводить итоги
                        TestType;
                        Fields.FFields[n].Kind:=FLD_ITOGI;
                        s:=ReadSpec(s);
                        if (s<>'') and (s[length(s)]='&') then begin
                           s:=copy(s,1,length(s)-1);
                           Fields.FFields[n].ItogoByIName:=TRUE;
                        end;
                        Fields.FFields[n].IName:=s;
                     end;
                's': begin
                        TestType;
                        Fields.FFields[n].Kind:=FLD_TOSUM;
                     end;
                'c': Fields.FFields[n].Column:=ExcelColumnToNumber(ReadSpec(s));
                'l': begin
                         Fields.FFields[n].Column:=0;
                         Fields.FFields[n].Visible:=FALSE;
                     end;
                'm': begin
                        TestType;
                        Fields.FFields[n].Kind:=FLD_COMPRESSED;
                     end;
                'n': Fields.FFields[n].FieldType:=FT_NUMERATOR;
                'v': begin
                        TestType;
                        Fields.FFields[n].FieldType:=FT_VSEGO;
                        s:=ReadSpec(s);
                        Fields.FFields[n].ConstantData:=s;
                     end;
                '1': if Fields[n].Kind<>FLD_ITOGI then
                           Raise Exception.Create(TranslateText('Попытка назначить тип итогов для неитогового поля'))
                     else Fields.FFields[n].ItogiType:=ITOGI_ONE
             else Raise Exception.Create(ErrMessage);
             end;
         end;
    end;

    procedure MakeFont(p_Column:integer;Font:char);
    var s:string;
    begin
         if p_Column=0 then s:=''
         else s:=ExcelNumberToColumn(p_Column)+':';
         if (Font='B') or (Font='W') then s:=s+'b';
         if (Font='I') or (Font='W') then s:=s+'i';
         Buf[CurBufLine,BufHorSize]:=VarToStr(Buf[CurBufLine,BufHorSize])+s+';';
    end;

    procedure TestOneField(n:integer);
    begin
         if Fields[n].FieldType=FT_NUMERATOR then exit;
         if p_Q.Fields.FindField(Fields[n].Name)=nil then
            Raise Exception.Create(TranslateText('Поле ')+Fields[n].Name+TranslateText(' в датасете не найдено'));
         if Fields[n].IName<>'' then
            if p_Q.Fields.FindField(Fields[n].IName)=nil then
               Raise Exception.Create(TranslateText('Уточняющее поле ')+Fields[n].IName+TranslateText(' в датасете не найдено'));
         if Fields[n].Kind=FLD_COMPRESSED  then
            if CFNum=-1 then CFNum:=n
            else Raise Exception.Create(TranslateText('Ошибка! Только одно поле может быть сжатым!!!'));
    end;

    procedure ProcessFields;
    var i,n:integer;
        s:string;
    begin
        i:=1; CFNum:=-1;
        // обрабатываем p_Fields, в итоге создается массив полей Fields
        while i<Length(p_Fields) do begin
           i:=ReadWordUntil(p_Fields,';',i,s)+1;
           ProcessOneField(s);
        end;

        n:=1; ItogoDepth:=0;
        for i:=0 to Fields.Count-1 do begin
            TestOneField(i); // тестируем поле на валидность

            // там где не был явно указан номер колонки, сейчас стоят нули
            // расставляем для каждого поля его номер колонки
            if Fields[i].Column=0 then begin
               if Fields[i].Visible then begin
                  Fields.FFields[i].Column:=n;
                  inc(n);
               end
            end else begin
               if Fields[i].Column<=n then
                  Raise Exception.Create(TranslateText('Ошибка! Номера колонок должны идти в порядке возрастания!')+#13#10+
                                         TranslateText('Поле ')+Fields[n].Name+TranslateText(' имеет неверный номер колонки'));
               n:=Fields[i].Column+1;
            end;

            // измеряем глубину вложенности Итого
            if Fields[i].Kind=FLD_ITOGI then inc(ItogoDepth);
        end;
        JustItogi:=ItogoDepth;
    end;

    function GetValue(p_Num:integer;p_Pos:integer=CUR_POS):Variant;
    begin
         case Fields[p_Num].FieldType of
           FT_DATA: if p_Pos=CUR_POS then result:=p_Q.FieldByName(Fields[p_Num].Name).Value
                                     else result:=Prev.FieldByName(Fields[p_Num].Name).Value;
           FT_NUMERATOR: if p_Pos=CUR_POS then result:=NumSeq
                                          else result:=NumSeq-1;
           FT_VSEGO: result:='';
         end;
    end;

    procedure ObnulSumm(p_Depth:integer);
    // обнуляем суммы начиная с глубины p_Depth
    var i,j:integer;
    begin
        for i:=p_Depth to ItogoDepth do begin
            for j:=1 to BufHorSize do
                SummBuf[i,j]:=0;
            ICountBuf[i]:=0;
        end;
    end;

    function DopTableIndex(p_Value:string):integer;
    var i,j,Lo,High,Middle:integer;
    begin
        if DopTableSize=0 then begin
           for j:=1 to BufHorSize do
               DopTblBuf[1,j]:=null;
           DopTblBuf[1,1]:=p_Value;
           DopTableSize:=1;
           result:=1; exit;
        end;
        Lo:=1; High:=DopTableSize;
        while (High>Lo) do begin
            Middle:=(High+Lo) div 2;
            if p_Value=VarToStr(DopTblBuf[Middle,1]) then begin
               result:=Middle; exit;
            end else if p_Value>VarToStr(DopTblBuf[Middle,1]) then
                if High-Lo=1 then Lo:=High
                             else Lo:=Middle
            else High:=Middle;
        end;
        if p_Value=VarToStr(DopTblBuf[Lo,1]) then result:=Lo
        else begin
             if DopTableSize=DopTableRealSize then
                Raise Exception.Create(TranslateText('Кол-во элементов в дополнительной таблице превысило допустимый предел'));
             for i:=DopTableSize downto Lo do
                 for j:=1 to BufHorSize do
                     DopTblBuf[i+1,j]:=DopTblBuf[i,j];
             for j:=1 to BufHorSize do
                 DopTblBuf[Lo,j]:=null;
             DopTblBuf[Lo,1]:=p_Value;
             inc(DopTableSize);
             result:=Lo;
        end;
    end;

    procedure IncSumm;
    var i,j,n:integer;
    begin
        if DopTableField<>'' then n:=DopTableIndex(p_Q.FieldByName(DopTableField).AsString)
        else n:=0;
        for i:=0 to Fields.Count-1 do
          if Fields[i].Kind=FLD_TOSUM then begin
             for j:=0 to ItogoDepth do
                 SummBuf[j,Fields[i].Column]:=nvl(SummBuf[j,Fields[i].Column],0)+p_Q.FieldByName(Fields[i].Name).AsFloat;
             if DopTableField<>'' then
                DopTblBuf[n,Fields[i].Column]:=nvl(DopTblBuf[n,Fields[i].Column],0)+p_Q.FieldByName(Fields[i].Name).AsFloat;
          end;
        for i:=1 to ItogoDepth do ICountBuf[i]:=ICountBuf[i]+1;
    end;

    function IsEq(p_Set:TIntSet;p_ItogoByIName:Boolean=TRUE):Integer;
    // ВНИМАНИЕ!!! Функция считает поля, которые сравнивала
    // и в случае неудачного сравнения возвращает этот счетчик
    // если не p_ItogoByIName, то при сравнении итоговых полей будут сравниваться
    // всегда все поля - и главное, и уточняющее
    var i:integer;
    begin
        result:=0;
        for i:=0 to Fields.Count-1 do
            if Fields[i].Kind in p_Set then begin
               inc(result);
               if (Fields[i].Kind=FLD_ITOGI) and (Fields[i].IName<>'') then begin
               // если поле - итоговое и есть уточняющее поле
                  if Prev.FieldByName(Fields[i].IName).Value<>
                     p_Q.FieldByName(Fields[i].IName).Value then exit;
                  if p_ItogoByIName and Fields[i].ItogoByIName then
                     continue;
               end;
               if not Fields[i].ItogoByIName and
                     (GetValue(i,CUR_POS)<>GetValue(i,Prev_Pos)) then exit;
            end;
        result:=0;
    end;

    procedure GoToNextRecord;
    begin
        //Prev.EmptyTable;
        Prev.LoadFromDataSet(p_Q,1,lmCopy);
        IncSumm;
        p_Q.Next;
        inc(numseq);
    end;

    procedure PutBufferToExcel;
    var i,j:integer;
    begin
        p_List.Range('A'+IntToStr(CurExcelLine)+':'+
                     ExcelNumberToColumn(BufHorSize)+IntToStr(CurExcelLine+CurBufLine-1)):=Buf;
        CurExcelLine:=CurExcelLine+CurBufLine;
        CurBufLine:=1;
        for i:=1 to MAXBUFFERROWS do
            for j:=1 to BufHorSize do
                Buf[i,j]:=null;
    end;

    procedure BufferNext;
    begin
        if CurBufLine<MAXBUFFERROWS then inc(CurBufLine)
        else PutBufferToExcel;
    end;

    function NeedToShow(p_Q:TDataset):Boolean;
    var i:integer;
    begin
        result:=FALSE;
        for i:=0 to Fields.Count-1 do
            if Fields[i].Kind=FLD_TOSUM then
               if p_Q.FieldByName(Fields[i].Name).Value<>0 then begin
                  result:=TRUE; exit;
               end;
    end;

    procedure PutPrevToBuf;
    var i,depth:integer;
        flag: Boolean;
    begin
        //if not NeedToShow(prev) then exit;
        for i:=1 to BufHorSize do Buf[CurBufLine,i]:='';
        depth:=ItogoDepth;
        for i:=Fields.Count-1 downto 0 do begin
            if not Fields[i].Visible then continue;
            if Fields[i].Kind=FLD_ITOGI then begin
               flag:=(Fields[i].ItogiType=ITOGI_MULT) or (JustItogi>0) and (JustItogi<=depth) or (p_PromItogi=PROMITOGI_EXCEL);
               dec(depth);
            end else flag:=TRUE;
            if flag then begin
               Buf[CurBufLine,Fields[i].Column]:=GetValue(i,PREV_POS);
               //Prev.FieldByName(Fields[i].Name).Value;
               if Fields[i].ItogiType=ITOGI_ONE then MakeFont(Fields[i].Column,'B');
            end;
        end;
    end;

    procedure ShowOneItogo(p_Level,p_FieldNum,p_GlobalLevel:integer);
    var i:integer;
        s,vsego:string;
    begin
        vsego:=decode([LANGUAGE,0,TranslateText('всего'),1,TranslateText('всього')]);

        if p_PromItogi=PROMITOGI_EXCEL then begin
           inc(ItogoQuantity);
           exit;
        end;

        if (p_GlobalLevel=0) and (p_Level>0) and (IItogiBuf[p_Level]=0) and not (PQO_SeparateItogi in p_Options) then exit;

        if (p_Level=0) or (ICountBuf[p_Level]>1) or (PQO_SeparateItogi in p_Options) then begin
           BufferNext;
           if p_Level=0 then
             case Language of
               0: s:=decode([p_Style,PQS_DocStyle,TranslateText('Всего по документу'),'ВСЕГО']);
               1: s:=decode([p_Style,PQS_DocStyle,TranslateText('Всього по документу'),'ВСЬОГО']);
             end
           else begin
               if Fields[p_FieldNum].ItogoByIName then s:=nvl(prev.FieldByName(Fields[p_FieldNum].IName).AsString,'')
                                                  else s:=nvl(GetValue(p_FieldNum,PREV_POS),'');
               case p_Style of
                    PQS_CommonStyle: s:=s+' '+vsego;
                    PQS_DocStyle   : s:=DevideRusUkr('Итого по @Разом по ')+s; // *NO_TRANSLATE*
               end;
           end;
           if p_ItogiColumn='' then Buf[CurBufLine,Fields[p_FieldNum].Column]:=s
           else Buf[CurBufLine,ExcelColumnToNumber(p_ItogiColumn)]:=s;
           for i:=0 to Fields.Count-1 do
               if Fields[i].Kind=FLD_TOSUM then
                  Buf[CurBufLine,Fields[i].Column]:=SummBuf[p_Level,Fields[i].Column]
               else if (p_Level=0) and (Fields[i].FieldType=FT_VSEGO) then
                  Buf[CurBufLine,Fields[i].Column]:=Fields[i].ConstantData;
           MakeFont(0,'B');
        end else begin
           Buf[CurBufLine,Fields[p_FieldNum].Column]:=VarToStr(Buf[CurBufLine,Fields[p_FieldNum].Column])+' '+vsego;
           MakeFont(Fields[p_FieldNum].Column,'B');
           for i:=0 to Fields.Count-1 do
               if Fields[i].Kind=FLD_TOSUM then
                  MakeFont(Fields[i].Column,'B');
        end;

        ICountBuf[p_Level]:=0;
        for i:=1 to BufHorSize do SummBuf[p_Level,i]:=0;
    end;

    procedure ShowItogo(p_Level:integer);
    var col,i,n:integer;
    begin
        for col:=0 to Fields.Count-1 do
            if Fields[col].Kind=FLD_ITOGI then
               if p_Level<=1 then break
               else dec(p_Level);
        n:=ItogoDepth;
        for i:=Fields.Count-1 downto col do
            if Fields[i].Kind=FLD_ITOGI then begin
               ShowOneItogo(n,i,p_Level);
               dec(n);
            end;
        if p_Level=0 then ShowOneItogo(0,0,0);
        for i:=p_Level to ItogoDepth do
            IItogiBuf[i]:=IItogiBuf[i]+1;
    end;

    procedure ProcessDopTables;
    var n:integer;
    begin
        n:=pos(':',p_DopTables);
        if n=0 then begin
           DopTableField:=trim(p_DopTables);
           DopTableTitle:='';
        end else begin
           DopTableTitle:=trim(copy(p_DopTables,1,n-1));
           DopTableField:=trim(copy(p_DopTables,n+1,length(p_DopTables)));
        end;
        if (DopTableField<>'') and (p_Q.Fields.FindField(DopTableField)=nil) then
           Raise Exception.Create(TranslateText('Поле ')+DopTableField+TranslateText(' из дополнительной таблицы в датасете не найдено'));
    end;

    procedure ProcessOneRecord;
    var n:integer;
    begin
        PutPrevToBuf;
        n:=IsEq([FLD_ITOGI]);
        if n>0 then ShowItogo(n);
        JustItogi:=n;
        BufferNext;
    end;

    procedure ShowDopTable;
    begin
        p_List.Range('A'+IntToStr(CurExcelLine+3)+':'+
                     ExcelNumberToColumn(BufHorSize)+IntToStr(CurExcelLine+DopTableSize+2)):=DopTblBuf;
    end;

    procedure PrepareExcelItogi;
    var i:integer;
    begin
       for i:=0 to Fields.Count-1 do
             case Fields[i].Kind of
               FLD_ITOGI: Buf[CurBufLine,Fields[i].Column]:='group';
               FLD_TOSUM: Buf[CurBufLine,Fields[i].Column]:='sum';
             else Buf[CurBufLine,Fields[i].Column]:='';
             end;
       BufferNext;
       for i:=0 to Fields.Count-1 do
           Buf[CurBufLine,Fields[i].Column]:=Fields[i].Name;
       BufferNext;
    end;

    procedure WriteToExcel;
    var step,progrvalue:double;
    begin
        if p_PrgrBar<>nil then
        begin
          progrvalue:=p_PrgrBar.Progress;
          step:=(p_EndProgr-progrvalue)/p_Q.RecordCount;
          progrvalue:=progrvalue+step;
        end;
        if p_PromItogi=PROMITOGI_EXCEL then PrepareExcelItogi;
        GoToNextRecord;
        while not p_Q.Eof do
        begin
          if p_PrgrBar<>nil then
          begin
            progrvalue:=progrvalue+step;
            p_PrgrBar.Progress:=trunc(progrvalue);
          end;
          ProcessOneRecord;
          GoToNextRecord;
        end;
        PutPrevToBuf;
        if p_prgrBar<>nil then
          p_PrgrBar.Progress := trunc(p_EndProgr);
        if p_PromItogi = PROMITOGI_DELPHI then
        begin
          ShowItogo(0);
          //ShowOneItogo(0,0,0);
          BufferNext;
        end;
        PutBufferToExcel;
        DrawNetInExcel(p_List,1,Fields[Fields.Count-1].Column,p_FIRSTLINE,CurExcelLine-p_PromItogi);
        case p_PromItogi of
          PROMITOGI_DELPHI: p_XLApp.Run('SetFont',p_FirstLine,CurExcelLine,BufHorSize);
          PROMITOGI_EXCEL: p_XLApp.Run('Itogi',p_FirstLine,CurExcelLine,BufHorSize);
        end;
        if (p_PromItogi<>PROMITOGI_EXCEL) and (DopTableField<>'') then
          ShowDopTable;
    end;

    procedure Init;
    var i:integer;
    begin
        BufHorSize:=Fields[Fields.Count-1].Column+1;
        Buf:=VarArrayCreate([1,MAXBUFFERROWS,1,BufHorSize],varVariant);
        SummBuf:=VarArrayCreate([0,ItogoDepth,1,BufHorSize],varVariant);
        ICountBuf:=VarArrayCreate([0,ItogoDepth],varVariant);
        IItogiBuf:=VarArrayCreate([0,ItogoDepth],varVariant);
        for i:=0 to ItogoDepth do IItogiBuf[i]:=0;
        if DopTableField<>'' then begin
           DopTblBuf:=VarArrayCreate([1,DOPTBLBUF_INITSIZE,1,BufHorSize],varVariant);
           DopTableSize:=0;
           DopTableRealSize:=DOPTBLBUF_INITSIZE;
        end;
        ObnulSumm(0);
        Prev:=TRxMemoryData.Create(Application);
        Prev.CopyStructure(p_Q);
        Prev.Open;
        CurBufLine:=1; CurExcelLine:=p_FirstLine;
        NumSeq:=1;
        ItogoQuantity:=0;
    end;

begin
    if p_Q.RecordCount=0 then begin
       result:=p_FirstLine;
       exit;
    end;
    p_Q.Last; p_Q.First;
    p_List.Select;
    Fields:=TReportFields.Create;
    ProcessFields;
    ProcessDopTables;
    Init;
    WriteToExcel;
    result:=CurExcelLine;
    if p_PromItogi=PROMITOGI_EXCEL then
       result:=result+ItogoQuantity+ItogoDepth*2;
end;
//==============================================================================
procedure PutFullQToExcel(p_Q:TDataSet;p_List:Variant;p_FIRSTLINE:integer=6);
var i:integer;
    Fields:string;
begin
    if not p_Q.Active or p_Q.IsEmpty then exit;
    p_Q.First;
    Fields:='';
    for i:=0 to p_Q.FieldCount-1 do
        Fields:=Fields+p_Q.Fields[i].FieldName+';';
    PuTOilQueryToExcelEnh(null,p_List,p_Q,p_FIRSTLINE,nil,0,Fields,'',PROMITOGI_NO);
end;
//==============================================================================
procedure PutGridToExcel(p_Grid:TDbGridEh;p_Head:string='';p_SumFields:string='');
const FIRSTLINE=6;
var XLApp,List:Variant;
    i,j,right:integer;
    range,Fields:string;
    ProgBar:TProgrForm;
    Q:TDataSet;

begin
     Q:=p_Grid.DataSource.DataSet;

  try
     ActivateXLApp('Empty','Empty',1,XLApp,List);

     List.Cells[3,2]:=p_Head;
     List.Cells[3,2].Font.Bold:=TRUE;
     List.Cells[3,2].Font.Size:=14;
     List.Cells[1,1]:=GetTitle;

     right:=0; j:=1;
     for i:=0 to p_Grid.Columns.Count-1 do
         if p_Grid.Columns[i].Visible then begin
           if p_Grid.DataSource.DataSet.FieldByName(p_Grid.Columns[i].FieldName).FieldKind=fkCalculated then
             continue;
           if j>right then right:=j;
           List.Cells[FIRSTLINE,j]:=p_Grid.Columns[i].Title.Caption;
           inc(j);
         end;
     range:=GetExcelRange(FIRSTLINE,1,FIRSTLINE,right);
     List.Range[range].Font.Bold:=TRUE;
     List.Range[range].Interior.ColorIndex:=34;
     List.Range[range].Borders.LineStyle:=1;
     List.Range[range].AutoFilter;

     Fields:=''; // параметр для PuTOilQueryToExcel
     Q.First;
     j:=1;
     for i:=0 to p_Grid.Columns.Count-1 do begin
         if p_Grid.DataSource.DataSet.FieldByName(p_Grid.Columns[i].FieldName).FieldKind=fkCalculated then
           continue;
         if not p_Grid.Columns[i].Visible then continue;
         List.Columns[j+1].ColumnWidth:=min(p_Grid.Columns[i].Width div 5,51);
         Fields:=Fields+p_Grid.Columns[i].FieldName;
         if pos(','+p_Grid.Columns[i].FieldName+',',','+p_SumFields+',')<>0 then
            Fields:=Fields+'\s';
         Fields:=Fields+';';
         inc(j);
     end;

     ActivateProgressBar(ProgBar);
     PuTOilQueryToExcelEnh(XLApp,List,Q,FIRSTLINE+1,ProgBar,100,Fields);
     XLApp.Visible:=TRUE;
  finally
     ProgBar.Free;
  end;
end;
//==============================================================================
procedure PutGridEhToExcel(p_Grid: TDbGridEh; p_Head: string = ''; p_SumFields: string = '');
const
  FIRSTLINE=6;
var
  XLApp,List:Variant;
  i,j,right:integer;
  range,Fields:string;
  ProgBar: TProgrForm;
  Q:TDataSet;
begin
  Q:=p_Grid.DataSource.DataSet;

  try
    ActivateXLApp('Empty','Empty',1,XLApp,List);

    List.Cells[3,2] := p_Head;
    List.Cells[3,2].Font.Bold := TRUE;
    List.Cells[3,2].Font.Size := 14;
    List.Cells[1,1] := GetTitle;

    right := 0; j := 1;
    for i:=0 to p_Grid.Columns.Count - 1 do
      if p_Grid.Columns[i].Visible then
      begin
        if p_Grid.DataSource.DataSet.FieldByName(p_Grid.Columns[i].FieldName).FieldKind = fkCalculated then
          continue;
        if j > right then
          right := j;
        List.Cells[FIRSTLINE,j] := p_Grid.Columns[i].Title.Caption;
        inc(j);
      end;
    range := GetExcelRange(FIRSTLINE, 1, FIRSTLINE, right);
    List.Range[range].Font.Bold := TRUE;
    List.Range[range].Interior.ColorIndex := 34;
    List.Range[range].Borders.LineStyle := 1;
    List.Range[range].AutoFilter;

    Fields:=''; // параметр для PuTOilQueryToExcel
    Q.First;
    j:=0;
    for i:=0 to p_Grid.Columns.Count-1 do
    begin
      if not p_Grid.Columns[i].Visible then
        continue;
      if p_Grid.DataSource.DataSet.FieldByName(p_Grid.Columns[i].FieldName).FieldKind = fkCalculated then
        continue;
      List.Columns[j+1].ColumnWidth := min(p_Grid.Columns[i].Width div 5,51);
      Fields := Fields+p_Grid.Columns[i].FieldName;
      if pos(','+p_Grid.Columns[i].FieldName + ',',',' + p_SumFields+',') <> 0 then
        Fields := Fields + '\s';
      Fields := Fields + ';';
      inc(j);
    end;

    ActivateProgressBar(ProgBar);
    PuTOilQueryToExcelEnh(XLApp, List, Q,FIRSTLINE+1, ProgBar, 100, Fields);
    XLApp.Visible := True;
  finally
    ProgBar.Free;
  end;
end;
//==============================================================================
procedure DrawLineInExcelByRange(p_List:Variant;p_Range:string;
          p_Position:integer;p_LineStyle:integer=1;p_Weight:integer=xlSingle);
begin
  p_List.Range[p_Range].Borders[p_Position].LineStyle:=p_LineStyle;
  p_List.Range[p_Range].Borders[p_Position].Weight:=p_Weight;
end;
//==============================================================================
procedure DrawLineInExcel(p_List:Variant;p_Left,p_Right,p_Top,p_Bottom:integer;
          p_Position:integer;p_LineStyle:integer=1;p_Weight:integer=xlSingle);
var range:string;
begin
    range:=ExcelNumberToColumn(p_Left)+IntToStr(p_Top)+':'+
           ExcelNumberToColumn(p_Right)+IntToStr(p_Bottom);
    DrawLineInExcelByRange(p_List,range,p_Position,p_LineStyle,p_Weight);
end;
//==============================================================================
procedure DrawNetInExcel(p_List:Variant;p_Left,p_Right,p_Top,p_Bottom:integer; p_Weight:integer=xlSingle;p_Inside:Boolean=TRUE);
var range:string;
begin
    range:=ExcelNumberToColumn(p_Left)+IntToStr(p_Top)+':'+
           ExcelNumberToColumn(p_Right)+IntToStr(p_Bottom);
    DrawLineInExcelByRange(p_List,range,xlEdgeTop,1,p_Weight);
    DrawLineInExcelByRange(p_List,range,xlEdgeBottom,1,p_Weight);
    DrawLineInExcelByRange(p_List,range,xlEdgeLeft,1,p_Weight);
    DrawLineInExcelByRange(p_List,range,xlEdgeRight,1,p_Weight);
    if p_Inside and (p_Right-p_Left>0) then DrawLineInExcelByRange(p_List,range,xlInsideVertical,1,p_Weight);
    if p_Inside and (p_Bottom-p_Top>0) then DrawLineInExcelByRange(p_List,range,xlInsideHorizontal,1,p_Weight);
end;
//==============================================================================
function GetExcelRange(top,left,bottom,right:integer):string;
begin
    result:=ExcelNumberToColumn(left)+IntToStr(top)+':'+ExcelNumberToColumn(right)+IntToStr(bottom);
end;
//==============================================================================
procedure SaveReport(XLApp: Variant; p_FileName: string);
var n: integer;
begin
    if AUTO_SAVE_DIRECTORY='' then exit;
    if AUTO_SAVE_SUFFIX<>'' then begin
       if pos('.',p_FileName)=0 then n:=length(p_FileName)+1
       else
          for n:=length(p_FileName) downto 1 do
              if p_FileName[n]='.' then
                 break;
       p_FileName:=copy(p_FileName,1,n-1)+AUTO_SAVE_SUFFIX+copy(p_FileName,n,length(p_FileName));
    end;
    XLApp.ActiveWorkbook.SaveAs(GetUniqueFileName(AUTO_SAVE_DIRECTORY,p_FileName));
    XLApp.DisplayAlerts:=FALSE;
    XLApp.Quit;
end;
//==============================================================================
function GetExcelColor(p_Name: string): integer;
begin
    if p_Name='WHITE' then result:=2
    else if p_Name='RED' then result:=3
    else if p_Name='GREEN' then result:=4
    else if p_Name='BLUE' then result:=34
    else if p_Name='YELLOW' then result:=36
    else if p_Name='PINK' then result:=38
    else if p_Name='ORANGE' then result:=44;
end;
//==============================================================================
procedure PutArrayToExcel(p_List: Variant; p_Row,p_Column: integer; p_Values: variant);
var i: integer;
begin
  for i:=0 to VarArrayHighBound(p_Values,1) do
    p_List.Cells[p_Row,p_Column+i]:=p_Values[i];
end;
//==============================================================================
procedure DevideCellName(p_Cell: string; var pp_Row,pp_Col: integer);
var s: string;
begin
  try
    s:=p_Cell[1];
    if p_Cell[2] in ['A'..'I'] then s:=s+p_Cell[2];
    pp_Row:=StrToInt(copy(p_Cell,length(s)+1,255));
    pp_Col:=ExcelColumnToNumber(s);
  except
    on E:Exception do
      raise exception.create('DevideCellName: p_Cell="'+p_Cell+'"'+#13#10+E.Message);
  end;
end;
//==============================================================================
procedure ExFormat(p_List: Variant; p_Row,p_Column: integer; p_Args: array of variant); overload;
var
  s,s1: string;
  i,n: integer;
begin
  s:=p_List.Cells[p_Row,p_Column];
  for i:=0 to High(p_Args) do begin
    n:=pos('%s',s);
    if n=0 then raise exception.create(
      Format(TranslateText('ExFormat: попытка вставить %d аргументов в строку %d колонку %d'),[High(p_Args)+1,p_Row,p_Column]));
    if VarIsNull(p_Args[i]) then s1:=''
    else s1:=VarAstype(p_Args[i],varString);
    s:=copy(s,1,n-1)+s1+copy(s,n+2,length(s));
  end;
  p_List.Cells[p_Row,p_Column]:=s;
end;
//==============================================================================
procedure ExFormat(p_List: Variant; p_Row: integer; p_Column: string; p_Args: array of variant); overload;
begin
  ExFormat(p_List,p_Row,ExcelColumnToNumber(p_Column),p_Args);
end;
//==============================================================================
procedure ExFormat(p_List: Variant; p_Cell: string; p_Args: array of variant); overload;
var vRow,vCol: integer;
begin
  DevideCellName(p_Cell,vRow,vCol);
  ExFormat(p_List,vRow,vCol,p_Args);
end;
//==============================================================================
procedure SetRowHeight(
  p_List: Variant;
  p_Row,p_Column: integer;
  p_SymNum: integer;
  p_Height: real=12.75);
var
  s: string;
  n: integer;
begin
  s:=p_List.Cells[p_Row,p_Column];
  n:=length(s) div p_SymNum+3;
  p_List.Rows[p_Row].EntireRow.RowHeight:=p_Height*n;
end;
//==============================================================================
procedure ExSetColumnWidth(p_List: Variant; p_Start: integer; p_Width: array of integer);
var i: integer;
begin
  for i:=0 to High(p_Width) do
    p_List.Columns[i+p_Start].EntireColumn.ColumnWidth:=p_Width[i];
end;
//==============================================================================
procedure ExPutValues(p_List: Variant; p_Row,p_Col: integer; p_Strings: array of variant);
var i: integer;
begin
  for i:=0 to High(p_Strings) do
    p_List.Cells[p_Row,p_Col+i]:=p_Strings[i];
end;
//==============================================================================
function PutRNDataToExcel(p_List:variant;p_Q:TDataSet;FirstLine,LastColumn:integer;DateField:TDateTime;
                     p_Fields,p_Sum:string): integer;
var
  Flds: TStringList;
  i,j,L,LastLine: integer;
  V: Variant;
  nds,all,xNDS,xNDSDiff: double;
  range: string;
begin
  i:=0; nds:=0; all:=0;
  //стринг_лист для названий полей
  Flds:=TStringList.Create; Flds.Clear;
  Flds.CommaText:=p_Fields;
  V:=VarArrayCreate([0,p_Q.RecordCount,0,Flds.Count], varVariant);//создан массив для переброски данных в Ексель
  p_Q.First;
  while not p_Q.Eof do
  begin
    nds:=p_Q.FieldByName(p_Sum).AsFloat+nds;//накапливаем НДС, считается в запросе
    all:=p_Q.fieldByName('allNDS').AsFloat+all;//накапливаем ИТОГ (данные с ведомости)
    for j:=0 to Flds.Count - 1 do
      V[i,j]:=p_Q.FieldByName(Flds.Strings[j]).AsVariant;//заполняем массив данными
    Inc(i);
    p_Q.Next;
  end;
  //вывод в Ексель
  L:=p_Q.RecordCount; LastLine:=FirstLine+L-1;
  range:=GetExcelRange(FirstLine,1,L+FirstLine,1+Flds.Count);
  p_List.Range[range].Value:=V;
  range:=GetExcelRange(FirstLine,LastColumn,L+FirstLine,LastColumn);
  //прячем колоночки
  p_List.Cells[19,LastColumn-2].EntireColumn.Hidden:=true;
  p_List.Cells[19,LastColumn-1].EntireColumn.Hidden:=true;
  p_List.Cells[LastLine+2,LastColumn]:='=SUM('+range+')';
  p_List.Cells[LastLine+3,LastColumn]:=nds;
  xNDSDiff:=all-nds;//(сумма без НДС) как разница (общей суммы) и (НДС)
  xNDS:=p_List.Cells[LastLine+2,LastColumn].Value;//(сумма без НДС) в результате построчного сложения
  if xNDSDiff<>xNDS then
    p_List.Cells[LastLine+2,LastColumn]:=xNDSDiff;
  p_List.Cells[LastLine+4,LastColumn]:=all;
  p_List.Cells[LastLine+2,'A']:=LangText('sum')+' без '+LangText('NDS')+':';
  p_List.Cells[LastLine+3,'A']:=LangText('NDS')+':';
  p_List.Cells[LastLine+4,'A']:=LangText('Itogo');
  p_List.Cells[LastLine+6,'A']:=LangText('sum')+LangText('S_NDS')+LangText('Propisu')+': '+ NumStrGrn(p_List.Cells[LastLine+4,LastColumn].Value,TranslateText('грн.'),TranslateText('коп.'));
  p_List.Cells[LastLine+8,'A']:=MANAGER_SHIP+' _____________';
  p_List.Cells[LastLine+8,'E']:=BUH_SHIP + ' _____________';
  p_List.Cells[LastLine+10,'A']:=LangText('Otpustil')+' _____________';
  p_List.Cells[LastLine+10,'E']:=LangText('Prinial')+' _____________';
  result:=LastLine+10;
  DrawNetInExcel(p_List,1,Flds.Count,FirstLine,L+FirstLine-1);
end;

function FindExcelSheet(ASheetName: string; var AXLApp:variant; var AList: Variant; var ABookName: string): boolean;
var
  Unknown: iUnknown;
  i, j: integer;
  IsFound: boolean;
begin
  IsFound := False;
  if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
    AXLApp := GetActiveOleObject('Excel.Application')
  else
    AXLApp := CreateOleObject('Excel.Application');

  for i := 1 to AXLApp.Workbooks.Count do
  begin
    if (ABookName = AXLApp.Workbooks[i].Name) or (ABookName = '') then
      for j := 1 to AXLApp.Workbooks[i].Worksheets.Count do
      begin
        if AXLApp.Workbooks[i].Worksheets[j].Name = ASheetName then
        begin
          IsFound := True;
          ABookName := AXLApp.Workbooks[i].Name;
          AList := AXLApp.Workbooks[i].Worksheets[j];
        end;
        If IsFound then
          break;
      end;
    If IsFound then
      break;
  end;
  if not IsFound then
    raise Exception.CreateFmt('Лист "%s" не найден !', [ASheetName]);
end;

procedure StateExcel(AXLApplication: Variant; AEnable: boolean);
begin
  AXLApplication.ScreenUpdating := AEnable;
  // отменить автоматическую калькуляцию формул
  if AEnable then
    AXLApplication.Calculation := xlAutomatic
  else
    AXLApplication.Calculation := xlManual;
  // отменить проверку автоматическую ошибок в ячейках (для XP и выше)
  AXLApplication.ErrorCheckingOptions.BackgroundChecking := AEnable;
  AXLApplication.ErrorCheckingOptions.NumberAsText := AEnable;
  AXLApplication.ErrorCheckingOptions.InconsistentFormula := AEnable;
end;

end.

