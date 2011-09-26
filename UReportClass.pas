unit UReportClass;

interface

uses uCommonForm,  Classes,Controls,UCustomFunc,Forms,DBTables,Excel8TLB,Db,
  URepElClass,SysUtils,Main,RxMemDs,Dialogs,uOilQuery,Ora, uOilStoredProc
  {$IFDEF VER150},Variants{$ENDIF};

const MAXRULEZFIELDS    = 255;
      MAXREPORTTYPESIZE = 255;

      DIRFORPLUGINS='Reports';

      REPORTLOGFILE='reports.log';

      FIELD_PART_LIST='NAME;ITOGIFIELD;FORMULA;CAPTION;WIDTH;FORMAT;HEAD_COLOR;CONSTANT_DATA;QNAME;TOSUM;OPTIONAL;HIDEIFEMPTY;SF_VALUES;ITOGI_TYPE';

type
  //==============================================================================
  TOptions = record
      ToSum:    Boolean; // будет ли поле суммироваться в отчете
      Optional: Boolean; // можно ли будет это поле отключить в форме RulezReport
      HideIfEmpty: Boolean; // выводится ли колонка, если в колонке одни нули или пустые строки или null-ы
      ItogiType: string; // тип подведения итогов, ONE - название появляется один раз, по умолчанию MULT - в каждой строке
  end;
  //==============================================================================
  TPutParamType = (pptSql,pptDesc);
  //==============================================================================
  TConf = record // определенная пользователем конфигурация
      IsEmpty: Boolean; // показывает, что в колонке одни нули или пустые строки или null-ы
      ToShow: Boolean; // показывать ли поле в отчете
      Itogi:  Boolean; // подводить ли по полю итоги
  end;
  //==============================================================================
  TReportField = class
    private
      function GetValue(p_Name:string):Variant;
      procedure SetValue(p_Name:string; p_Value: Variant);
    public
      Name: string; // поле из запроса
      QName: string; // имя, которое используется если поле - искусственное
      Formula: string; // если поле выражается формулой в самом верхнем уровне SQL, после подсчета сумм
      ItogiField: string; // поле, по которому будут подводиться итоги вместо текущего
      Caption: string; // название этого поля, которое будет фигурировать в отчете и форме RulezReport
      SizeExcel: integer; // размер колонки в Excel
      FormatExcel: string; // формат колонки в Excel
      Options: TOptions; // опции
      FinalConf: TConf; // финальная конфигурация
      SF_Values: string; // список значений специального поля
      ConstantData: string; // константа, отображаемая во Всего
      ConstantValue: string;
      HeadColor: string; // цвет заголовка этой колонки в екселе, в виде английского слова большими буквами

      property Values[p_Name:string]:Variant read GetValue write SetValue; default;
      procedure CopyFrom(p_Field:TReportField);
      procedure Restore;
      constructor Create(p_Field:TReportField); overload;
      constructor Create; overload;
  end;
  //==============================================================================
  TReportFields = array[1..MAXRULEZFIELDS] of TReportField;
  //==============================================================================
  TCondition = record
      Condition,Text:string;
  end;
  //==============================================================================
  PCondition = ^TCondition;
  //==============================================================================
  TReportTypes=record
      Count:integer;
      Default_: integer;
      Itogi,Unchecked,Order,Options: array[1..MAXREPORTTYPESIZE] of TStringList;
      Captions: array[1..MAXREPORTTYPESIZE] of string;
  end;
  //==============================================================================
  TStyle=(stlUsual,stlRN);
  //==============================================================================
  TReport = class
      Title: string; // заголовок
      FormTitle: string; // заголовок в форме программы
      NameForSave: string; // имя, под которым отчет записывается после построения, по умолчанию "report"
      TitleCoord: string; // координаты заголовка в Excel
      TitleFont: integer; // размер фонта заголовка
      Having: string; // условие having
      ZeroLines: Boolean; // если TRUE, то в отчет будут попадать строки со всеми нулями в суммируемых колонках
      ChoosenType: string; // тип отчета
      ShowInfo: Boolean; // показывать ли информацию в левом верхнем углу
      Count: integer; // кол-во полей
      HeadLine: integer; // нижнаяя линия заголовка, после которой начинается сам отчет
      HeadDepth: integer; // глубина заголовка
      Pages_Width: integer; // разместить не больше, чем на ... страниц в ширину
      Pages_Height: integer; // разместить не больше, чем на ... страниц в высоту
      Page_Orient: string; // VER - портретный, HOR - альбомный
      Version: string; // версия отчета
      LastColumn: integer; // правая колонка отчета
      SpecialField: string; // специальное поле - признак по которому порождаются искусственные поля
      Panels:TRepPanels;
      Elements:TRepElements;
      Conditions:TList; // список типа TCondition
      ColumnOrder: array [1..MAXRULEZFIELDS] of integer; // выбранный порядок колонок
      DefaultField: TReportField;
      Fields: TReportFields; // поля
      Types: TReportTypes; // типы отчетов
      FuncPacket: TCustomFuncPacket; // пакет с пользовательскими функциями, подключенными к отчету
      Razm_Symbols:Boolean; // печать отчета в варианте с екселевскими промежуточными итогами
      CardRecalc: Boolean; // пересчитывать ли карточки перед запуском отчета
      ColNumeration: Boolean; // если TRUE, то каждая колонка нумеруется
      q: TDataSet;
      Style: TStyle;
      procedure AddField(v_name,v_caption: string; v_sizeexcel:integer;
          v_formatexcel:string; v_tosum,v_optional: Boolean); // добавляет новое поле
      function NumByName(v_name: string): integer; // ищет индекс поля с заданным именем
      procedure GetFromFile(filename:string); // определяет конфигурацию отчета из файла
      procedure GetFromDataBase(filename: string);// определяет конфигурацию отчета из базы
      procedure GetFromStringList(SL: TStringList); // определяет конфигурацию отчета из текста
      procedure GetLastVersion(filename: string); // определяет, где версия файла больше
      function GetConfiguration:string; // вызывает форму RulezReport для определения конфигурации отчета
      procedure MakeDefault; // задает начальные установки пустого отчета
      procedure SetConfByType(n:integer); // по данному типу отчета устанавливает ColumnOrder
      procedure MakeReport;
      procedure RunStoredProcs(p_Default: Boolean);
      function PutParamsAndFuncs(p_Str:string; p_Type: TPutParamType):string;
      function GetSqlText:string;
      procedure ActivateQ;
      procedure MakeExcelHead(XLApp,List:Variant);
      function GetPuTOilQueryParams:string;
      function GetRnParams:string;
      procedure DefineHeadDepth;
      procedure DetectEmptyColumns;
      function GetShowFieldInReport(n:integer):Boolean;
      procedure CountVariables;
      procedure TestConditions;
      function PrintText(p_XLApp,p_List:Variant;p_Row,p_Col:integer;p_Text:string):integer;
      function Str2Style(p_Str: string): TStyle;
      function CountQuestionExpr(p_Str: string):string;
      property ShowFieldInReport[n:integer]:boolean read GetShowFieldInReport;
    public
      SQLText: string; // базовый SQL с параметрами и функциями внутри
      ExecSqlBefore,ExecSqlAfter: string;
      Description:TStringList; // строки типа "за период от ... до ..." и т.д.
      constructor Create;
      destructor Destroy; override;
  end;
  //==============================================================================
  TFieldsGroup = class
    private
      HeadStart: integer;
      List: TList;
    public
      function InitFromSL(p_SL: TStringList; p_Start: integer):integer;
      procedure ConvertToFields(R:TReport);
      constructor Create; overload;
      constructor Create(p_SL: TStringList; p_Start: integer); overload;
      destructor Destroy; override;
  end;
  //==============================================================================

implementation

uses RulezReport,ExFunc,ExcelFunc,TextFunc,Progr,UDbFunc,Math,uRichEditFormat,
     PrihCardRef,UMessageDlgExt;

//==============================================================================
//******************************************************************************
//***************************** TReportField ***********************************
//******************************************************************************
//==============================================================================
function TReportField.GetValue(p_Name:string):Variant;
begin
    p_Name:=UpperCase(p_Name);
    if p_Name='NAME' then result:=Name
    else if p_Name='QNAME' then result:=QName
    else if p_Name='FORMULA' then result:=Formula
    else if p_Name='CAPTION' then result:=Caption
    else if (p_Name='SIZEEXCEL') or (p_Name='WIDTH') then result:=SizeExcel
    else if (p_Name='FORMATEXCEL') or (p_Name='FORMAT') then result:=FormatExcel
    else if p_Name='ITOGIFIELD' then result:=FormatExcel
    else if p_Name='TOSUM' then result:=Options.ToSum
    else if p_Name='OPTIONAL' then result:=Options.Optional
    else if p_Name='HIDEIFEMPTY' then result:=Options.HideIfEmpty
    else if p_Name='SF_VALUES' then result:=SF_Values
    else if p_Name='CONSTANT_DATA' then result:=ConstantData
    else if p_Name='ITOGI_TYPE' then result:=Options.ItogiType
    else if p_Name='HEAD_COLOR' then result:=HeadColor
    else Raise Exception.Create('TReportField.GetValue: '+#13#10+TranslateText('Элемент ')+p_Name+TranslateText(' не найден'));
end;
//==============================================================================
procedure TReportField.SetValue(p_Name:string; p_Value: Variant);
begin
    p_Name:=UpperCase(p_Name);
    if ((p_Name='TOSUM') or (p_Name='OPTIONAL') or (p_Name='HIDEIFEMPTY')) and (VarType(p_Value)=varString)
       then p_Value:=TrueFalseToBool(p_Value);
    if p_Name='NAME' then Name:=p_Value
    else if p_Name='QNAME' then QName:=p_Value
    else if p_Name='FORMULA' then Formula:=p_Value
    else if p_Name='CAPTION' then Caption:=DevideRusUkr(p_Value)
    else if (p_Name='SIZEEXCEL') or (p_Name='WIDTH') then SizeExcel:=p_Value
    else if (p_Name='FORMATEXCEL') or (p_Name='FORMAT') then FormatExcel:=p_Value
    else if p_Name='ITOGIFIELD' then ItogiField:=p_Value
    else if p_Name='TOSUM' then Options.ToSum:=p_Value
    else if p_Name='OPTIONAL' then Options.Optional:=p_Value
    else if p_Name='HIDEIFEMPTY' then Options.HideIfEmpty:=p_Value
    else if p_Name='SF_VALUES' then SF_Values:=p_Value
    else if p_Name='CONSTANT_DATA' then ConstantData:=p_Value
    else if p_Name='ITOGI_TYPE' then Options.ItogiType:=p_Value
    else if p_Name='HEAD_COLOR' then HeadColor:=p_Value
    else Raise Exception.Create('TReportField.SetValue: '+#13#10+TranslateText('Элемент ')+p_Name+TranslateText(' не найден'));
end;
//==============================================================================
procedure TReportField.CopyFrom(p_Field:TReportField);
var i:integer;
    SL: TStringList;
begin
    Str2StringList('NAME,CAPTION,SIZEEXCEL,FORMATEXCEL,TOSUM,OPTIONAL,HIDEIFEMPTY,QNAME,SF_VALUES,ITOGI_TYPE,HEAD_COLOR',SL);
    for i:=0 to SL.Count-1 do
        Self.Values[SL[i]]:=p_Field[SL[i]];
    SL.Destroy;
end;
//==============================================================================
procedure TReportField.Restore;
begin
  FinalConf.IsEmpty:=TRUE;
  FinalConf.ToShow:=TRUE;
  FinalConf.Itogi:=FALSE;
end;
//==============================================================================
constructor TReportField.Create(p_Field:TReportField);
begin
  Self:=TReportField.Create;
  CopyFrom(p_Field);
end;
//==============================================================================
constructor TReportField.Create;
begin
  inherited;
  Restore;
end;
//==============================================================================
//******************************************************************************
//***************************** TFieldsGroup ***********************************
//******************************************************************************
//==============================================================================
function TFieldsGroup.InitFromSL(p_SL: TStringList; p_Start: integer):integer;
var
  finish:integer;

  procedure GetOnePart(p_Str:string);
  var i,n:integer;
      sl: TStringList;
      s,name,value: string;
  begin
    sl := nil;
    for n := p_Start+1 to finish-1 do
      if trim(p_SL[n]) = p_Str then
        break;

    if trim(p_SL[n]) <> p_Str then
      Raise Exception.Create(TranslateText('TFieldsGroup.InitFromSL: не найдена директива ')+p_Str);
    for i := n+1 to finish-1 do
    begin
      s := trim(p_SL[i]);
      if s = '' then
        continue
      else if (s = 'HEADS') or (s = 'TAILS') then
        exit
      else
      begin
        GetNameValue(s,name,value);
        if name = 'NAME' then
        begin
          sl := TStringList.Create;
          List.Add(sl);
        end
        else if not Assigned(sl) then
          Raise Exception.Create(TranslateText('TFieldsGroup.InitFromSL: определение поля начато не с NAME'));
        sl.Add(name+'='+value);
      end;
    end;
  end;

begin
    for finish:=p_Start to p_SL.Count-1 do
        if trim(p_SL[finish])='END_GROUP' then break;
    if trim(p_SL[finish])<>'END_GROUP' then
       Raise Exception.Create(TranslateText('TFieldsGroup.InitFromSL: не найдена директива END_GROUP'));
    result:=finish+1;
    GetOnePart('TAILS');
    HeadStart:=List.Count;
    GetOnePart('HEADS');
    if HeadStart=0 then
       Raise Exception.Create(TranslateText('TFieldsGroup.InitFromSL: не найдены поля в TAILS'));
    if HeadStart=List.Count-1 then
       Raise Exception.Create(TranslateText('TFieldsGroup.InitFromSL: не найдены поля в HEADS'));
end;
//==============================================================================
procedure TFieldsGroup.ConvertToFields(R:TReport);
var i,j:integer;
    FieldParts: TStringList;


  procedure MakeField(HeadNum,TailNum:integer);
  var slHead,slTail:TStringList;
    i: integer;
    s:string;
  begin
    R.Count:=R.Count+1;
    slHead:=List[HeadNum];
    slTail:=List[TailNum];
    R.Fields[R.Count]:=TReportField.Create(R.DefaultField);
    for i:=0 to FieldParts.Count-1 do
    begin
      if FieldParts[i]='CAPTION' then
        s:=DevideRusUkr(slHead.Values[FieldParts[i]])+DevideRusUkr(slTail.Values[FieldParts[i]])      
      else
        s:=slHead.Values[FieldParts[i]]+slTail.Values[FieldParts[i]];
      if s<>'' then
        R.Fields[R.Count][FieldParts[i]]:=s;
    end;
  end;

begin
    FieldParts:=TStringList.Create;
    Str2StringList(FIELD_PART_LIST,FieldParts,';');
    for i:=HeadStart to List.Count-1 do
        for j:=0 to HeadStart-1 do
            MakeField(i,j);
    FieldParts.Destroy;
end;
//==============================================================================
constructor TFieldsGroup.Create;
begin
    List:=TList.Create;
end;
//==============================================================================
constructor TFieldsGroup.Create(p_SL: TStringList; p_Start: integer);
begin
    Create;
    InitFromSL(p_SL,p_Start);
end;
//==============================================================================
destructor TFieldsGroup.Destroy;
var i:integer;
    sl: TStringList;
begin
    inherited;
    for i:=0 to List.Count-1 do begin
        sl:=List[i];
        sl.Destroy;
    end;
    List.Destroy;
end;
//==============================================================================
//******************************************************************************
//***************************** TReport ****************************************
//******************************************************************************
//==============================================================================
procedure TReport.MakeDefault;
begin
     Title:='';
     NameForSave:='report';
     TitleFont:=16;
     SQLText:='';
     Having:='';
     Count:=0;
     Razm_Symbols:=TRUE;
     ZeroLines:=FALSE;
     ShowInfo:=TRUE;
     Pages_Width:=0; Pages_Height:=0;
     Version:='???';
     Page_Orient:='HOR';
     DefaultField.Name:='';
     DefaultField.Formula:='';
     DefaultField.ItogiField:='';
     DefaultField.Caption:='';
     DefaultField.SizeExcel:=10;
     DefaultField.FormatExcel:='@';
     DefaultField.HeadColor:='BLUE';
     DefaultField.Options.Optional:=TRUE;
     DefaultField.Options.ToSum:=FALSE;
     DefaultField.Options.HideIfEmpty:=FALSE;
     DefaultField.Options.ItogiType:='MULT';
     DefaultField.FinalConf.IsEmpty:=TRUE;
     Types.Count:=0;
     Types.Default_:=1;
     CardRecalc:=false;
     ColNumeration:=false;
end;
//==============================================================================
constructor TReport.Create;
begin
     inherited;
     DefaultField:=TReportField.Create;
     FuncPacket:=TCustomFuncPacket.Create;
     q:=TOilQuery.Create(nil);
     Description:=TStringList.Create;
     Panels:=TRepPanels.Create;
     Elements:=TRepElements.Create;
     Conditions:=TList.Create;
     MakeDefault;
end;
//==============================================================================
destructor TReport.Destroy;
var i:integer;
begin
     inherited;
     for i:=1 to Types.Count do begin
         Types.Itogi[i].Destroy;
         Types.Unchecked[i].Destroy;
     end;
     FuncPacket.Destroy;
     Description.Destroy;
     q.Destroy;
     Panels.Destroy;
     Elements.Destroy;
     Conditions.Destroy;
     DefaultField.Destroy;
end;
//==============================================================================
function TReport.GetSqlText:string;
var BaseSQL,FinalSQL,fld,s,InFormulaFields:string;
    i:integer;
    cache: TStringList; // кэш
    ToMakeHaving: Boolean;
    //--------------------------------------------------------------------------
    procedure AddToHaving(p_Field: string);
    begin
        if not ToMakeHaving then exit;
        if having<>'' then having:=having+' or ';
        having:=having+'sum('+p_Field+')<>0';
    end;
    //--------------------------------------------------------------------------
    function FieldIsNeeded(n: integer): Boolean;
    begin
        result:=Fields[ColumnOrder[n]].FinalConf.ToShow and (Fields[ColumnOrder[n]].Formula='')
                or (pos(Fields[ColumnOrder[n]].Name,InFormulaFields)>0);
    end;
    //--------------------------------------------------------------------------
begin
     BaseSQL:=PutParamsAndFuncs(SqlText,pptSql);
     cache:=TStringList.Create;
     ToMakeHaving := (having='') and not ZeroLines;
     InFormulaFields:='';
     for i:=1 to Count do
         if Fields[i].Formula<>'' then
            InFormulaFields:=InFormulaFields+GetFieldList(Fields[i].Formula);
     FinalSQl:='select ';
     if SpecialField<>'' then FinalSql:=FinalSql+SpecialField+',';
     for i:=1 to Count do
         if FieldIsNeeded(i) then
            if Fields[ColumnOrder[i]].Options.ToSum then begin
               if Fields[ColumnOrder[i]].SF_Values='' then begin
                  FinalSQL:=FinalSQL+'sum('+Fields[ColumnOrder[i]].Name+') as '+Fields[ColumnOrder[i]].Name+',';
                  AddToHaving(Fields[ColumnOrder[i]].Name);
               end else begin
                 if cache.IndexOf(Fields[ColumnOrder[i]].QName)=-1 then begin
                    cache.Add(Fields[ColumnOrder[i]].QName);
                    FinalSql:=FinalSql+'sum('+Fields[ColumnOrder[i]].QName+') as '+Fields[ColumnOrder[i]].QName+',';
                    AddToHaving(Fields[ColumnOrder[i]].QName);
                 end;
                 FinalSql:=FinalSql+'to_number(null) as '+Fields[ColumnOrder[i]].Name+',';
               end
            end else begin
                 FinalSQL:=FinalSQL+Fields[ColumnOrder[i]].Name+',';
                 if Fields[ColumnOrder[i]].FinalConf.Itogi and (Fields[ColumnOrder[i]].ItogiField<>'') then
                    FinalSQL:=FinalSQL+Fields[ColumnOrder[i]].ItogiField+',';
            end;
     FinalSQL:=copy(FinalSQL,1,length(FinalSQL)-1)+' from ('+BaseSQL+') ';

     fld:='';
     for i:=1 to Count do
         if FieldIsNeeded(i) and Fields[ColumnOrder[i]].FinalConf.Itogi then begin
            if Fields[ColumnOrder[i]].ItogiField<>'' then
               fld:=fld+Fields[ColumnOrder[i]].ItogiField+',';
            fld:=fld+Fields[ColumnOrder[i]].Name+',';
         end;
     for i:=1 to Count do
         if FieldIsNeeded(i) and not Fields[ColumnOrder[i]].Options.ToSum
            and not Fields[ColumnOrder[i]].FinalConf.Itogi
         then begin
            if Fields[ColumnOrder[i]].ItogiField<>'' then
               fld:=fld+Fields[ColumnOrder[i]].ItogiField+',';
            fld:=fld+Fields[ColumnOrder[i]].Name+',';
         end;
     if fld<>'' then begin
        fld:=copy(fld,1,length(fld)-1);
        FinalSQL:=FinalSQL+'group by '+fld;
        if SpecialField<>'' then FinalSql:=FinalSql+','+SpecialField;
        if trim(having)<>'' then FinalSql:=FinalSql+' having '+having;
     end;
     if InFormulaFields<>'' then begin
        s:='select Q.*';
        for i:=1 to Count do
            if Fields[ColumnOrder[i]].Formula<>'' then
               s:=s+','+Fields[ColumnOrder[i]].Formula+' as '+Fields[ColumnOrder[i]].Name;
        FinalSql:=s+' from ('+FinalSql+') Q';
     end;

     FinalSql:=FinalSql+' order by '+fld;
     result:=FinalSql;
     cache.Destroy;
end;
//==============================================================================
procedure TReport.ActivateQ;
var qq:TOilQuery;
    md: TRxMemoryData;
    i:integer;
    sl: TStringList;

    function IsTheSameRecord: Boolean;
    var i:integer;
    begin
        result:=FALSE;
        if md.RecordCount=0 then exit;
        for i:=1 to Count do begin
            if (Fields[i].SF_Values='') and (SL.IndexOf(Fields[i].Name)=-1) and
               (qq.FieldByName(Fields[i].Name).Value<>md.FieldByName(Fields[i].Name).Value) then exit;
        end;
        result:=TRUE;
    end;

begin
  qq := TOilQuery.Create(nil);
  qq.SQL.Text := GetSqlText;
  qq.Prepare;
  _OpenQuery(qq);
  if SpecialField <> '' then  // необходимо преобразование
  begin
    md := TRxMemoryData.Create(nil);
    sl := TStringList.Create;
    md.CopyStructure(qq);
    qq.First; md.Open;
    while not qq.Eof do
    begin
      if md.State<>dsInsert then
        md.Insert;
      for i:=1 to Count do
      begin
        if Fields[i].SF_Values='' then
          md.FieldByName(Fields[i].Name).Value:=qq.FieldByName(Fields[i].Name).Value
        else if pos(','+qq.FieldByName(SpecialField).AsString+',',','+Fields[i].SF_Values+',')>0 then
          md.FieldByName(Fields[i].Name).AsFloat:=qq.FieldByName(Fields[i].QName).AsFloat+
            md.FieldByName(Fields[i].Name).AsFloat;
      end;
      qq.Next;
      if not IsTheSameRecord then
        md.Post;
    end;
    if md.State=dsInsert then
      md.Post;
    q := md as TDataSet;
    qq.Destroy;
  end
  else
  begin
    q := qq as TDataSet;
  end;
end;
//==============================================================================
procedure TReport.DetectEmptyColumns;
var nRest,i:integer;
  //-------------------------------------------
  function FieldIsEmpty(p_Name:string):Boolean;
  var fld:TField;
  begin
    fld:=q.FieldByName(p_Name);
    result:=fld.IsNull or
            ((fld.DataType in [ftString,ftMemo]) and (fld.Value='')) or
            ((fld.DataType in [ftSmallInt,ftInteger,ftWord,ftFloat]) and (fld.Value=0));
    // log(REPORTLOGFILE,p_Name+' '+fld.AsString);
    result:=result;
  end;
  //-------------------------------------------
begin
  log(REPORTLOGFILE,' Поиск пустых колонок начат');
  q.First; nRest:=0;
  for i:=1 to Count do
  begin
    if Fields[ColumnOrder[i]].FinalConf.ToShow and Fields[ColumnOrder[i]].Options.HideIfEmpty then
      inc(nRest);
    Fields[ColumnOrder[i]].FinalConf.IsEmpty:=TRUE;
  end;
  while not q.Eof and (nRest>0) do
  begin
    for i:=1 to Count do
      if Fields[ColumnOrder[i]].FinalConf.ToShow and
         Fields[ColumnOrder[i]].Options.HideIfEmpty and
         Fields[ColumnOrder[i]].FinalConf.IsEmpty
      then
        if not FieldIsEmpty(Fields[ColumnOrder[i]].Name) then
        begin
          Fields[ColumnOrder[i]].FinalConf.IsEmpty:=FALSE;
          dec(nRest);
        end;
    q.Next;
  end;
  q.First;
  log(REPORTLOGFILE,' Поиск пустых колонок окончен');  
end;
//==============================================================================
function TReport.GetShowFieldInReport(n:integer):Boolean;
begin
  result:=Fields[ColumnOrder[n]].FinalConf.ToShow and
         (Fields[ColumnOrder[n]].Options.HideIfEmpty and
          not Fields[ColumnOrder[n]].FinalConf.IsEmpty or
          not Fields[ColumnOrder[n]].Options.HideIfEmpty);
end;
//==============================================================================
procedure TReport.CountVariables;
var i:integer;
    q:TOilQuery;
begin
  q:=TOilQuery.Create(nil);
  try
    for i:=0 to Elements.Count-1 do
      if Elements[i].ElementType='VARSQL' then
      begin
         q.Sql.Text:=PutParamsAndFuncs(Elements[i].Params.Values['SQL'],pptSql);
         _OpenQuery(q);
         Elements[i].Res.Values['RESULT']:=q.Fields[0].AsString;
      end;
  finally
    q.Destroy;
  end;
end;
//==============================================================================
function TReport.GetPuTOilQueryParams:string;
var s:string;
    i:integer;
begin
  try
    s:='';
    for i:=1 to Count do
    begin
      if not ShowFieldInReport[i] then  continue;
      s:=s+Fields[ColumnOrder[i]].Name;
      if Fields[ColumnOrder[i]].FinalConf.Itogi then
      begin
        s:=s+'\i';
        if Fields[ColumnOrder[i]].Options.ItogiType='ONE' then
          s:=s+'\1';
        if Fields[ColumnOrder[i]].ItogiField<>'' then
          s:=s+':'+Fields[ColumnOrder[i]].ItogiField+'&';
      end;
      if Fields[ColumnOrder[i]].Options.ToSum then
        s:=s+'\s';
      if Fields[ColumnOrder[i]].ConstantData<>'' then
        s:=s+'\v:'+Fields[ColumnOrder[i]].ConstantValue;
      s:=s+';';
    end;
  finally
    result:=s;
  end;
end;
//==============================================================================
procedure TReport.RunStoredProcs(p_Default: Boolean);
var
  i: integer;
  s: string;
begin
  // запуск процедур, привязанных к элементам панелей
  for i:=0 to Elements.Count-1 do begin
    s:=Elements[i].Params.Values['STOREDPROC'];
    if s<>'' then begin
      s:=s+'('+Decode([p_Default,TRUE,'',Elements[i].CountFunc('VALUE',false)])+');';
      _ExecSql('begin '+s+' end;');
    end;
  end;
  // запуск процедур из секций EXEC_BEFORE и EXEC_AFTER
  s:=BoolTo_(p_Default,ExecSqlAfter,ExecSqlBefore);
  if s<>'' then begin
    s:=PutParamsAndFuncs(s,pptSql);
    _ExecSql(s);
  end;
end;
//==============================================================================
function TReport.PutParamsAndFuncs(p_Str:string; p_Type: TPutParamType):string;
var i:integer;
    PromRes,s,s1,sVal:string;
    symbols: TCharSet;
    date1,date2:TDateTime;
begin
     PromRes:=p_Str;
     // заменяем все функции на их значения
     {i:=1; PromRes:='';
     while i<=length(p_Str) do begin
           if p_Str[i]='@' then begin
              s:=GetWordUntil(p_Str,')',i,res);
              if res<>'Ok' then Exception.Create('В результате обработки SQL возникла ошибка'+#13#10+res);
              PromRes:=PromRes+FuncPacket.CalculateValue(s,res);
              if res<>'Ok' then Exception.Create('В результате обработки SQL возникла ошибка'+#13#10+res);
           end else begin
               PromRes:=PromRes+p_Str[i];
               inc(i);
           end;
     end;}

     symbols:=['a'..'z','A'..'Z','0'..'9','_','.','{','}'];
     i:=1; result:='';
     while i<=length(PromRes) do begin
       s:=GetWord(PromRes,symbols,i,[':']);
       if (length(s)>2) and (s[1]=':') and (s[2]<>':') then
         if UpperCase(s)=':NOT_IN_OBL' then result:=result+BoolTo_(MAIN_ORG.Org_type in [4,10],'''N''','''Y''')
         else if UpperCase(s)=':DATE_DESCRIPTION' then begin
           s1:=Elements.CountFunc(':BEGINDATE',false);
           date1:=StrToDate(copy(s1,2,length(s1)-2));
           s1:=Elements.CountFunc(':ENDDATE',false);
           date2:=StrToDate(copy(s1,2,length(s1)-2));
           result:=result+GetDateDescription(date1,date2);
         end else begin
           sVal:=Elements.CountFunc(s,false);
           if (p_Type=pptSql) and ((UpperCase(s)=':BEGINDATE') or (UpperCase(s)=':ENDDATE')) then
             sVal:='to_date('+sVal+',''dd.mm.yyyy'')';

           if p_Type=pptDesc then begin
             if (sVal='null') or (sVal='') then sVal:=''
             else begin
               if (sVal[1]='''') and (sVal[length(sVal)]='''') then
                 sVal:=copy(sVal,2,length(sVal)-2);
               sVal:=ReplaceAllSubstr(sVal,'\','\\');
               sVal:=ReplaceAllSubstr(sVal,'{','{{');
             end;
           end;
           result:=result+sVal;
         end
       else if s='::' then result:=result+':'
       else result:=result+s;
     end;
end;
//==============================================================================
function TReport.PrintText(p_XLApp,p_List:Variant;p_Row,p_Col:integer;p_Text:string):integer;
var i,j,n,k,fontsize,LastWidth:integer;
    s,font,format,coord:string;
    c:char;
    InsideBrackets:Boolean;
    //**************************************************************************
    procedure GetWord;
    begin
      s := '';
      while TRUE do
        if p_Text[i] = '\' then
        begin
          if p_Text[i+1] = '\' then
          // Если два в подряд "\\", то выводим один "\"
          begin
            s := s + '\';
            i := i + 2;
          end
          else if p_Text[i+1] = 'E' then
          // Если "\Е" то дальше ничего не обрабатывать 
          begin
            i := length(p_Text);
            exit;
          end
          else if s <> '' then
          // Если уже не первый символ обрабатываеться
          begin
            if p_Text[i+1] in ['0'..'9','{','}'] then
              exit
            else
            begin
              s := s + p_Text[i] + p_Text[i+1];
              i := i + 2;
            end
          end
          else // s = ''
          // Обработка значений в фигурных скобках \{9}
          begin
            s := '\';
            InsideBrackets := FALSE; // Внутри дуг
            repeat
              inc(i);
              s := s + p_Text[i];
              if p_Text[i] in ['{','}'] then
                InsideBrackets := (p_Text[i]='{');
            // Работать по НЕ будет найдена закрывающая дуга, либо пока встретиться символ НЕ из множества ['0'..'9','{','}']
            until not InsideBrackets and not (p_Text[i] in ['0'..'9','{','}']);
            inc(i);
            exit;
          end;
        end
        else // Служебного символа не найдено
        begin
          s := s+p_Text[i];
          inc(i);
        end;
    end;
    //**************************************************************************
    procedure PutFormattedText(p_Row,p_Col: integer; p_Text: string);
    var
      s,stemp,vTag: string;
      slTags: TStringList;
      i,n: integer;
    begin
      slTags:=TStringList.Create;
      try
        ReadTextTags(p_Text,slTags,s);
        p_List.Cells[p_Row,p_Col]:=s;
        for i:=0 to slTags.Count-1 do
        begin
          n:=pos(':',slTags[i]);
          stemp:=copy(slTags[i],1,n-1);
          vTag:=copy(slTags[i],n+1,length(slTags[i]));
          n:=StrToInt(stemp);
          // Форматирование текста
          p_XLApp.Run('DoTag',p_Row,p_Col,n,vTag);
        end;
      finally
        slTags.Free;
      end;
    end;
    //**************************************************************************
    procedure SetLastWidth;
    begin
      LastWidth := p_List.Columns[p_Col].ColumnWidth;
    end;
    //**************************************************************************
begin
  result := 8;
  i:=1; p_Text := p_Text+'\E';
  fontsize:=10;
  while i < length(p_Text) do
  begin
    GetWord;
    if s='' then
      continue;
    // Форматирование RRR в стиле \0L или \{D2}M, где после слеша есть параметр в виде цыфри или множества, после этого код команды
    if (s[1]='\') and (s[2] in ['0'..'9','{']) then
    begin
      c:=UpperCase(s)[length(s)];
      if not (c in ['L','N','F','M','S','W','A']) then
        Raise Exception.Create(TranslateText('Неверная команда форматирования ')+s);
      {if c='B' then
        font:='b'
      else }
      if c = 'M' then
      begin
        coord:=copy(s,3,length(s)-4);
        if coord[2] in ['A'..'Z'] then
          k:=3
        else
          k:=2;
        p_Col := ExcelColumnToNumber(copy(coord,1,k-1));
        p_Row := StrToInt(copy(coord,k,length(coord)));
        SetLastWidth;
      end
      else
      // Команды имеющие числовые параметры
      begin
        //Собственно параметр
        n := StrToInt(copy(s,2,length(s)-2));
        if c='F' then // Формат ячейки - количество знаков после запятой
        begin
          format := '0.';
          for j := 1 to n do
            format := format+'0';
        end
        else if c = 'S' then // Формат ячейки - Размер шрифта
          fontsize := n
        else if c = 'W' then // Формат ячейки - Объеденить ячейки в пределах строки
        begin
          if n = 0 then
            k := LastColumn
          else
            k := p_Col+n;
          p_List.Range[GetExcelRange(p_Row,p_Col,p_Row,k)].Merge;
          LastWidth := 0;
          for j := p_Col to k do
            LastWidth := LastWidth+p_List.Columns[j].ColumnWidth;
        end
        else if c = 'A' then // Формат ячейки - согластно макроса Format - Автоформат
        begin
          p_XLApp.Run('Format',p_Row,p_Col);
          SetRowHeight(p_List,p_Row,p_Col,LastWidth);
          {
            Sub Format(Row, Col)
              With Cells(Row, Col)
                .NumberFormat = "General"
                .HorizontalAlignment = xlJustify
                .VerticalAlignment = xlTop
                .WrapText = True
                .AddIndent = True
                .ShrinkToFit = False
              End With
              Cells(Row).EntireRow.AutoFit
            End Sub
          }
        end
        else
        // Сбрасуються параметры формата и шрифта
        begin
          format := ''; font := '';
          if c = 'L' then // Следующая колонка
          begin
            p_Col := p_Col + n;
            SetLastWidth;
          end
          else if c = 'N' then // Следующая строка
          begin
            p_Row := p_Row+n;
            p_Col := 1;
            SetLastWidth;
          end;
        end;
      end;
    end
    else
    // В случае если слово не распознано как внутренюю команду RRR-движка, выводим в эксель
    begin
      p_List.Cells[p_Row,p_Col].Select;

      if format <> '' then
        // Выставляеться числовой формат
        p_XLApp.Run('FormatCell',p_Row,p_Col,format);
      //if font='b' then p_List.Cells[p_Row,p_Col].Font.Bold:=TRUE;
      // Выставляеться размер шрифта
      p_List.Cells[p_Row,p_Col].Font.Size := fontsize;
      // Вставка текста или команды форматирование в список возможных команд можно найти uRichEditFormat.TagList или в шаблоне в макросе DoTag
      PutFormattedText(p_Row,p_Col,s);
      //p_List.Cells[p_Row,p_Col]:=s;
      if result < p_Row then
        result:=p_Row;
    end;
  end;
end;
//==============================================================================
procedure TReport.DefineHeadDepth;
var i,NewHeadDepth:integer;
begin
     NewHeadDepth:=1;
     for i:=1 to Count do
         if Fields[ColumnOrder[i]].FinalConf.ToShow then begin
            NewHeadDepth:=max(NewHeadDepth,CountSubstr(Fields[ColumnOrder[i]].Caption,'!')+1);
         end;
     if ColNumeration then inc(NewHeadDepth);
     HeadDepth:=max(NewHeadDepth,HeadDepth);
end;
//==============================================================================
procedure TReport.MakeExcelHead(XLApp,List:Variant);
var i,j,k,TitleCol,TitleLine,Line,color:integer;
    SLPrev,SLCur:TStringList;
    Flag:Boolean;
    s,range,str_decode:string;
begin
     k:=0;
     // форматируем колонки Excel, устанавливаем ширину и формат
     for i:=1 to Count do begin
          if not ShowFieldInReport[i] then continue;
          inc(k);
          str_decode:=Fields[ColumnOrder[i]].FormatExcel;
          if Pos('?',str_decode)=0 then List.Cells[1,k]:=IntToStr(Fields[ColumnOrder[i]].SizeExcel)+';'+str_decode
          else begin
           str_decode:=PutParamsAndFuncs(str_decode,pptsql);
           str_decode:=CountQuestionExpr(str_decode);
           List.Cells[1,k]:=IntToStr(Fields[ColumnOrder[i]].SizeExcel)+';'+str_decode;
          end;

     end;
     XLApp.Run('FormatColumns');
     LastColumn:=k;
     k:=0; DefineHeadDepth;
     // выводим строки с описанием параметров отчета
     if Description.Count>0 then
     begin
       HeadLine:=PrintText(XLApp,List,5,1,PutParamsAndFuncs(Description[0],pptDesc))+2;
       s := 'A'+ IntToStr(5) +':A'+ IntToStr(HeadLine - 1);
       List.Range[s].HorizontalAlignment := xlLeft;
     end
     else HeadLine:=5;

     s:='A'+IntToStr(HeadLine)+':'+ExcelNumberToColumn(LastColumn)+IntToStr(HeadLine+HeadDepth-1);
     //List.Range[s].Interior.ColorIndex:=34;
     List.Range[s].HorizontalAlignment:=xlLeft;
     List.Range[s].VerticalAlignment:=xlBottom;

     SLPrev:=TStringList.Create;
     SLCur:=TStringList.Create;
     for i:=1 to Count do begin
          if not ShowFieldInReport[i] then continue;
          inc(k);
          SLPrev.Clear; SLPrev.AddStrings(SLCur);
          str_decode:=Fields[ColumnOrder[i]].Caption;
          if Pos('?',str_decode)=0 then Str2StringList(str_decode,SLCur,'!')//оброботка (?_<_>_<_>default)
           else begin
            str_decode:=PutParamsAndFuncs(str_decode,pptsql);
            str_decode:=CountQuestionExpr(str_decode);
            Str2StringList(str_decode,SLCur,'!')
           end;
          {if ColNumeration then begin
            SLCur.Add(IntToStr(nColumn));
            inc(nColumn);
          end;}
          //Flag:=(SLCur.Count=SLPrev.Count);
          Flag:=true;
          for j:=0 to SLCur.Count-1 do begin
              Line:=HeadLine+j;
              if Flag and (j<SLPrev.Count) and (SLCur[j]=SLPrev[j]) then begin
                 List.Range[ExcelNumberToColumn(k-1)+IntToSTr(Line)+':'+ExcelNumberToColumn(k)+IntToSTr(Line)].Merge;
                 List.Range[ExcelNumberToColumn(k-1)+IntToSTr(Line)+':'+ExcelNumberToColumn(k)+IntToSTr(Line)].WrapText:=TRUE;
                 List.Cells[Line,k].VerticalAlignment:=xlCenter;
                 List.Cells[Line,k].HorizontalAlignment:=xlCenter;

              end else begin
                 List.Cells[Line,k]:=SLCur[j];
                 if Flag and ((j>=SLPrev.Count) or (SLCur[j]<>SLPrev[j])) then Flag:=FALSE;
              end;
          end;
          if SLCur.Count<HeadDepth then begin
             range:=GetExcelRange(HeadLine+SLCur.Count-1,k,HeadLine+HeadDepth-1,k);
             List.Range[range].Merge;
             List.Range[range].WrapText:=TRUE;
             List.Cells[HeadLine,k].VerticalAlignment:=xlCenter;
             List.Cells[HeadLine,k].HorizontalAlignment:=xlCenter;
          end;
          color:=GetExcelColor(Fields[i].HeadColor);
          List.Range[ExcelNumberToColumn(k)+IntToStr(HeadLine)+':'+ExcelNumberToColumn(k)+IntToStr(HeadLine+HeadDepth-1)].Interior.ColorIndex:=color;
     end;
     if ColNumeration then begin
       inc(HeadDepth);
       for i:=1 to k do begin
           List.Cells[HeadLine+HeadDepth-1,i]:=i;
       end;
       range:=GetExcelRange(HeadLine+HeadDepth-1,1,HeadLine+HeadDepth-1,k);
       List.Range[range].NumberFormat:='0';
       List.Range[range].HorizontalAlignment:=xlCenter;
       List.Range[range].Interior.ColorIndex:=GetExcelColor(DefaultField.HeadColor);
     end;
     DrawNetInExcel(List,1,LastColumn,HeadLine,HeadLine+HeadDepth-1);

     {if ColNumeration then begin
       List.Range[GetExcelRange(HeadLine+HeadDepth-1,1,HeadLine+HeadDepth-1,k)].NumberFormat:='0';
       List.Range[GetExcelRange(HeadLine+HeadDepth-1,1,HeadLine+HeadDepth-1,k)].HorizontalAlignment:=xlCenter;
     end;}

     // размещаем название отчета
     if TitleCoord<>'' then GetExcelCoord(TitleCoord,TitleCol,TitleLine)
     else begin
         if k>=10 then TitleCol:=4
         else if k>=7 then TitleCol:=3
         else TitleCol:=2;
         TitleLine:=3;
     end;

     List.Cells[TitleLine,TitleCol]:=RusUpperCase(Title);
     List.Cells[TitleLine,TitleCol].Font.Bold:=TRUE;
     List.Cells[TitleLine,TitleCol].Font.Size:=TitleFont;
     // ставим в угол сведения о месте и времени построения отчета

     if ShowInfo then PutToCell(List,'A1',GetTitle+' / '+Version);
     List.Cells[1,1].Font.Size:=8;
     SLPrev.Destroy;
     SLCur.Destroy;
end;
//==============================================================================
procedure TReport.TestConditions;
var i:integer;
    cond:PCondition;
    q:TOilQuery;
begin
  q:=TOilQuery.Create(nil);
  try
    for i:=0 to Conditions.Count-1 do begin
        cond:=Conditions[i];
        q.Sql.Text:=PutParamsAndFuncs(cond.Condition,pptSql);
        _OpenQuery(q);
        if q.Fields[0].AsInteger<>0 then
           Raise Exception.Create(cond.Text);
    end;
  finally
    q.Free;
  end;
end;
//==============================================================================
procedure TReport.MakeReport;
var XLApp,List:Variant;
    Progr: TProgrForm;
    PromItogi,LastRow:integer;
    start:TDateTime;
    i:integer;
begin
     log(REPORTLOGFILE,'*************************************************');
     log(REPORTLOGFILE,'* '+Title);
     log(REPORTLOGFILE,TranslateText('* Начат ')+DateToStr(Date)+' '+TimeToStr(Time));
     log(REPORTLOGFILE,'*-----------------------------------------------*');
     start:=Time;
     if CardRecalc then begin
       showmessage(TranslateText('Будет произведен пересчет карточек. Это может занять несколько минут'));
       fRecalc;
     end;
     ActivateProgressBar(Progr,TRUE);
   try
     if Conditions.Count>0 then begin
        TestConditions;
        SetProgressBar(10,Progr);
     end;
     CountVariables;
     RunStoredProcs(FALSE);
     ActivateQ;
     RunStoredProcs(TRUE);
     q.Last; q.First;
     if (q.RecordCount>=40000)
       and (MessageDlgExt(
         TranslateText('Отчет содержит слишком много строк и может не поместиться в Excel.')+#13#10+
         TranslateText('Продолжить?'),mtWarning,[TranslateText('Да'),TranslateText('Нет')])=2)
     then exit;
     for i:=1 to Count do
         if Fields[i].ConstantData<>'' then
            if Fields[i].ConstantData[1]=':' then
               Fields[i].ConstantValue:=Elements.CountFunc(Fields[i].ConstantData,false)
            else Fields[i].ConstantValue:=Fields[i].ConstantData;

     log(REPORTLOGFILE,TranslateText('* Запрос отработал за ')+IntToStr(trunc((Time-start)*24*3600))+TranslateText(' сек.'));
     log(REPORTLOGFILE,TranslateText('* Открыто ')+IntToStr(q.RecordCount)+TranslateText(' записей'));
     start:=time;
     if (q.RecordCount=0) and INTERACTIVE_LAUNCH_MODE then
        Raise Exception.Create(TranslateText('Отчет с указанными параметрами не содержит данных'));
     SetProgressBar(30,Progr);
     DetectEmptyColumns;
     SetProgressBar(40,Progr);
     ActivateXLApp('empty','d',1,XLApp,List);
     MakeExcelHead(XLApp,List);
     SetProgressBar(50,Progr);
     if Razm_Symbols then PromItogi:=PROMITOGI_EXCEL
                     else PromItogi:=PROMITOGI_DELPHI;
     if q.RecordCount>0 then
     begin
       if style=stlRN then
         LastRow:=PutRNDataToExcel(List,q,19,LastColumn,Date,GetRnParams,'NDS')
       else
         LastRow:=PuTOilQueryToExcelEnh(XLApp,List,q as TDataSet,HeadLine+HeadDepth,Progr,100,GetPuTOilQueryParams,'',PromItogi);
       List.Range['A'+IntToStr(HeadLine+HeadDepth-1)+':'+ExcelNumberToColumn(LastColumn)+IntToStr(HeadLine+HeadDepth-1)].AutoFilter;
       if Description.Count>1 then
         PrintText(XLApp,List,LastRow+2,1,PutParamsAndFuncs(Description[1],pptDesc));
       List.Cells[1,1].Select;
       XLApp.Run('FreezePanes',HeadLine+HeadDepth,1);
       if (Pages_Width<>0) or (Pages_Height<>0) then
       begin
         if Pages_Width=0 then Pages_Width:=2000;
         if Pages_Height=0 then Pages_Height:=2000;
         XLApp.Run('FormatPage',Pages_Width,Pages_Height,Page_Orient);
       end;
     end;
     List.Cells[1,1].Select;
     SaveReport(XLApp,NameForSave);
     XLApp.Visible:=TRUE;
     log(REPORTLOGFILE,TranslateText('* Вывод в Excel отработал за ')+IntToStr(trunc((time-start)*24*3600))+TranslateText(' сек.'));
     log(REPORTLOGFILE,TranslateText('* Средняя скорость вывода ')+IntToStr(trunc(q.RecordCount/(time-start)/24/3600))+TranslateText(' зап/сек'));
     log(REPORTLOGFILE,'*************************************************');
     log(REPORTLOGFILE,'');
   finally
     Progr.Free;
   end;
end;
//==============================================================================
procedure TReport.SetConfByType(n:integer);
var i,k,index:integer;

     function IsInColumnOrder(n,Size:integer):Boolean;
     var i:integer;
     begin
          for i:=1 to Size do
              if ColumnOrder[i]=n then begin
                 result:=TRUE;
                 exit;
              end;
          result:=FALSE;
     end;

begin
     if n>Types.Count then Raise Exception.Create(TranslateText('TReport.SetConfByType: значение n превышаеет рамки разумного'));
     for i:=1 to Types.Order[n].Count do
         ColumnOrder[i]:=NumByName(Types.Order[n][i-1]);
     i:=Types.Order[n].Count;
     for k:=1 to Count do
         if not IsInColumnOrder(k,i) then begin
            inc(i);
            ColumnOrder[i]:=k;
         end;

     for k:=1 to Count do begin
         index:=Types.Itogi[n].IndexOf(Fields[ColumnOrder[k]].Name);
         if index=-1 then Fields[ColumnOrder[k]].FinalConf.Itogi:=FALSE
                     else Fields[ColumnOrder[k]].FinalConf.Itogi:=TRUE;

         index:=Types.Unchecked[n].IndexOf(Fields[ColumnOrder[k]].Name);
         Fields[ColumnOrder[k]].FinalConf.ToShow := (index=-1);
     end;
end;
//==============================================================================
procedure TReport.AddField(v_name,v_caption: string; v_sizeexcel:integer;
          v_formatexcel:string; v_tosum,v_optional: Boolean);
begin
     if Count=MAXRULEZFIELDS then
          showmessage(TranslateText('TReport.AddField: превышено максимально допустимое число полей'))
     else begin
          inc(Count);
          Fields[Count].Name:=v_name;
          Fields[Count].Caption:=v_caption;
          Fields[Count].SizeExcel:=v_sizeexcel;
          Fields[Count].FormatExcel:=v_formatexcel;
          Fields[Count].Options.ToSum:=v_tosum;
          Fields[Count].Options.Optional:=v_optional;
     end;
end;
//==============================================================================
function TReport.NumByName(v_name: string): integer;
var i:integer;
begin
     for i:=1 to Count do
         if Fields[i].Name=v_name then
         begin
              result:=i;
              exit;
         end;
     result:=0;
end;
//==============================================================================
procedure TReport.GetFromFile(filename:string);
var SL: TStringList;
    FullFileName,ext: string;
begin
     FullFileName:=GetMainDir+'\'+DIRFORPLUGINS+'\'+filename;
     ext:=copy(FullFileName,length(FullFileName)-3,4);
     if (ext<>'.rrr') and (ext<>'.rdb') then
        FullFileName:=FullFileName+'.rrr';
     SL:=TStringList.Create;
     try
       if FileExists(FullFileName) then
        GetStringListFromFile(FullFileName,SL);
        GetFromStringList(SL);
     finally
        SL.Destroy;
     end;
end;
//==============================================================================
procedure TReport.GetFromDataBase(filename: string);
var
  SL: TStringList;
  q: TOilQuery;
begin
  SL:=TStringList.Create;
  q:=TOilQuery.Create(nil);
  try
    q.SQL.Text:='select esd.text '
      +' from exe_sql_data esd '
      +'where esd.state=''Y'' '
      +'  and esd.sql_id=(select distinct ver.id '
      +'                    from v_exe_rrr ver '
      +'                   where ver.name=:filename) '
      +'order by line ';
    q.ParamByName('filename').AsString:=filename;
    q.Open;
    if q.RecordCount=0 then
      raise Exception.Create(TranslateText('Файл в БД не существует: ')+filename);
    q.First;
    while not q.Eof do
    begin
      SL.Add(q.FieldByName('Text').AsString);
      q.Next;
    end;
    q.Open;
    GetFromStringList(SL);
  finally
    q.Free;
    SL.Free;
  end;
end;
//==============================================================================
procedure TReport.GetLastVersion(filename: string);
var q: TOilQuery;
    strVersion,strDbVersion,m1,FlName: string;
    m2: integer;
begin
  FlName:=GetMainDir+'Reports\'+filename+'.rrr';
  if FileExists(FlName)then
    GetRRRMenuPath(FlName,m1,strVersion,m2)
  else
    strVersion:='0.0';
  q:=TOilQuery.Create(nil);
  try
    q.SQL.Text:='select distinct * from v_exe_rrr where name=:filename';
    q.ParamByName('filename').AsString:=filename;
    q.Prepare;
    q.Open;
    if q.RecordCount<>0 then
      strDbVersion:=q.FieldByName('version').AsString
    else
      strDbVersion:='0.0';
  finally
    q.Free;
  end;
  if CompareVersion(strVersion, strDbVersion) = -1 then
    GetFromDataBase(filename)
  else
    GetFromFile(filename);
end;
//==============================================================================
function TReport.GetConfiguration:string;
var R: TRulezReportForm;
begin
     Application.CreateForm(TRulezReportForm,R);
     R.Init(Self);
     R.ShowModal;
     R.Free;
end;
//==============================================================================
procedure TReport.GetFromStringList(SL: TStringList);
var CurHead,line:string;
    name,value,filename,pnl,s:string;
    i:integer;
    cond:PCondition;
    FieldsGroup: TFieldsGroup;
    //--------------------------------------------
    procedure ReadPanels;
    var Panel:TRepPanel;
        Element:TRepElement;
        PanelId,n:integer;
        name,value:string;
        //--------------------------------------------
        procedure AddVirtualElement(p_Name:string;p_PanelId:integer);
        var snum:string;
        begin
            Element:=TRepElement.Create(p_Name,'VIRTUAL');
            Element.PanelId:=p_PanelId;
            if copy(p_Name,1,3)='ORG' then begin
               snum:=p_Name[4];
               Element.Params.Values['TYPE']:='OIL_ORG';
               Element.Params.Values['STARTCONDITION']:=Panel.Params.Values['STARTCONDITION'+snum];
               Element.Params.Values['OPTIONS']:=Panel.Params.Values['OPTIONS'+snum];
               Element.Params.Add('NAMEFIELD=NAME');
               Element.ElementType:='COMBOEDIT';
            end else Element.ElementType:='DATEEDIT';
            Elements.Add(Element);
        end;
        //--------------------------------------------
        procedure CreatePanel(p_PanelType:string);
        begin
            Panel:=TRepPanel.Create(p_PanelType);
            Panel.PanelType:=pnl;
            PanelId:=Panels.Count;
            inc(i);
            while (UpperCase(trim(SL[i]))<>'END') and (copy(UpperCase(trim(SL[i])),1,7)<>'ELEMENT') do begin
                if trim(SL[i])='' then continue;
                GetNameValue(SL[i],name,value);
                name:=UpperCase(name);
                n:=Panel.Params.IndexOfName(name);
                if n=-1 then Raise Exception.Create(TranslateText('Неопознанный параметр'));
                Panel.Params.Values[name]:=DevideRusUkr(value,true);
                inc(i);
            end;
        end;
        //--------------------------------------------
        procedure ReadElements;
        begin
            while TRUE do begin
               line:=trim(copy(trim(SL[i]),8,length(SL[i])));
               GetNameValue(line,name,value,':');
               Element:=TRepElement.Create(name,value);
               Element.PanelId:=PanelId;
               inc(i);
               while UpperCase(trim(SL[i]))<>'END' do begin
                   if trim(SL[i])='' then continue;
                   GetNameValue(trim(SL[i]),name,value);
                   name:=UpperCase(name);
                   n:=Element.Params.IndexOfName(name);
                   if n=-1 then Raise Exception.Create(TranslateText('Неизвестный параметр'));
                   Element.Params.Values[name]:=value;
                   inc(i);
               end;
               Element.PostConf;
               Elements.Add(Element);
               repeat
                  inc(i);
                  if UpperCase(trim(SL[i]))='END' then exit;
               until copy(UpperCase(trim(SL[i])),1,7)='ELEMENT';
            end;
        end;
    //--------------------------------------------
    begin
      pnl:=UpperCase(trim(SL[i]));
      if (pnl<>'DATEPANEL') and (pnl<>'ORGPANEL') and (pnl<>'PANEL') then
        Raise Exception.Create(TranslateText('Неопознанный тип панели'));
      CreatePanel(pnl);
      if pnl='DATEPANEL' then begin
        AddVirtualElement('BEGINDATE',PanelId);
        if Panel.Params.Values['NUM']='2' then
          AddVirtualElement('ENDDATE',PanelID);
      end else if pnl='ORGPANEL' then begin
        AddVirtualElement('ORG1',PanelId);
        if Panel.Params.Values['NUM']='2' then
          AddVirtualElement('ORG2',PanelID);
      end else begin
        if UpperCase(trim(SL[i]))='END' then inc(i)
        else ReadElements;
      end;
      Panels.Add(Panel);
      inc(i);
    end;
    //--------------------------------------------------------------
    procedure ReadVariables;
    var name,value,s:string;
        Element:TRepElement;
    begin
         while TRUE do begin
             line:=trim(copy(trim(SL[i]),4,length(SL[i])));
             GetNameValue(line,name,value,':');
             if UpperCase(value)<>'VARSQL' then
                Raise Exception.Create(TranslateText('Неизвестный тип переменной'));
             inc(i); s:='';
             while UpperCase(trim(SL[i]))<>'END' do begin
                 s:=s+trim(SL[i])+' ';
                 inc(i);
             end;
             Element:=TRepElement.Create(name,value);
             Element.PanelId:=-1;
             Element.ElementType:='VARSQL';
             Element.Params.Add('SQL='+s);
             Element.PostConf;
             Elements.Add(Element);
             repeat
                inc(i);
                s:=UpperCase(trim(SL[i]));
                if (length(s)>1) and (s[1]='[') and (s[length(s)]=']') then begin
                   dec(i); exit;
                end
             until copy(UpperCase(trim(SL[i])),1,3)='VAR';
         end;
    end;
    //--------------------------------------------------------------------
begin
     CurHead:=''; i:=0;
   try
     while i<SL.Count do begin
          line:=trim(SL[i]);
          if line<>'' then
          if (line[1]='[') and (line[length(line)]=']') then begin
             CurHead:=system.copy(line,2,length(line)-2);
             s:=copy(CurHead,length(CurHead)-3,4);
             if (s='_RUS') and (LANGUAGE=0) or (s='_UKR') and (LANGUAGE=1) then
               CurHead:=copy(CurHead,1,length(CurHead)-4);
             if CurHead='DESCRIPTION' then Description.Clear;
          end else if CurHead='GLOBAL' then begin
             GetNameValue(line,name,value);
             if name='TITLE' then begin
               Title:=DevideRusUkr(value);
               if FormTitle='' then FormTitle:=DevideRusUkr(value,true);
             end else if name='FORMTITLE' then FormTitle:=DevideRusUkr(value,true)
             else if name='NAME_FOR_SAVE' then NameForSave:=value
             else if name='TITLE_COORD' then TitleCoord:=value
             else if name='TITLE_FONT' then TitleFont:=StrToInt(value)
             else if name='SHOW_INFO' then ShowInfo:=decode([value,'NO',FALSE,TRUE])
             else if name='RAZM_SYMBOLS' then Razm_Symbols:=(UpperCase(value)='YES')
             else if name='PAGES_WIDTH' then Pages_Width:=StrToInt(value)
             else if name='PAGES_HEIGHT' then Pages_Height:=StrToInt(value)
             else if name='PAGE_ORIENT' then Page_Orient:=value
             else if name='VERSION' then Version:=value
             else if name='ZERO_LINES' then ZeroLines:=(UpperCase(value)='YES')
             else if name='CARD_RECALC' then CardRecalc:=(UpperCase(value)='YES')
             else if name='INVISIBLE' then // ничего делать не надо
             else if (name='MENU') or (name='MENU_POSITION') then begin end
             else if name='STYLE' then style:=Str2Style(value)
             else Raise Exception.Create(TranslateText('Неизвестный параметр ')+name);
          end else if CurHead='FUNCTIONS' then begin
               if LowerCase(copy(line,1,7))='include' then begin
                  filename:=trim(copy(line,8,length(line)));
                  FuncPacket.IncludeFromFile(filename);
               end
          end
          else if CurHead='PARAMS' then
               Raise Exception.Create(TranslateText('Устаревший параметр'))
          else if CurHead='PANELS' then ReadPanels
          else if CurHead='DESCRIPTION' then begin
               if Description.Count=0 then Description.Add('');
               if (line='AFTER') then Description.Add('')
               else begin
                 s:=Description[Description.Count-1];
                 if (s='') or (s[length(s)]<>'&') then s:=s+'\1N'
                 else begin
                   SetLength(s,length(s)-1);
                   if s[length(s)]<>' ' then s:=s+' ';
                 end;
                 Description[Description.Count-1]:=s+DevideRusUkr(line,false);
               end;
          end
          else if CurHead='SQL' then
               SQLText:=SQLText+line+' '
          else if CurHead='EXEC_BEFORE' then
               ExecSqlBefore:=ExecSqlBefore+line+' '
          else if CurHead='EXEC_SQL_AFTER' then
               ExecSqlAfter:=ExecSqlAfter+line+' '
          else if CurHead='HAVING' then
               Having:=Having+line+' '
          else if CurHead='FIELDS' then begin
                 if line='FIELDS_GROUP' then begin
                    FieldsGroup:=TFieldsGroup.Create;
                    i:=FieldsGroup.InitFromSL(SL,i);
                    FieldsGroup.ConvertToFields(Self);
                    FieldsGroup.Destroy;
                    continue;
                 end;
                 GetNameValue(line,name,value);
                 if name='NAME' then begin
                     inc(Count);
                     Fields[Count]:=TReportField.Create(DefaultField);
                     Fields[Count].Name:=value;
                 end else if name='SPECIAL_FIELD' then begin
                     if (SpecialField<>'') and (SpecialField<>value) then
                        Raise Exception.Create(TranslateText('Переопределение поля SPECIAL_FIELD'))
                     else SpecialField:=value
                 end else if name='HEAD_DEPTH' then
                     HeadDepth:=StrToInt(value)
                 else if name='COL_NUMERATION' then
                     ColNumeration:=TrueFalseToBool(value)
                 else if copy(name,1,7)='DEFAULT' then begin
                     DefaultField[trim(copy(name,8,length(name)))]:=value
                 end else if IsInList(name,FIELD_PART_LIST) then
                     Fields[Count][name]:=value
                 else Raise Exception.Create(TranslateText('Неверный параметр ')+name);
          end
          else if CurHead='VARIABLES' then ReadVariables
          else if CurHead='CONDITIONS' then
                 if line='CONDITION' then begin
                    new(cond);inc(i);cond.Condition:='';
                    while UpperCase(trim(SL[i]))<>'END' do begin
                        cond.Condition:=cond.Condition+trim(SL[i])+' ';
                        inc(i);
                    end;
                    Conditions.Add(cond);
                 end else begin
                     GetNameValue(line,name,value);
                     if name='TEXT' then begin
                        if Conditions.Count=0 then
                           Raise Exception.Create(TranslateText('Определение текста до определения условия'));
                        cond:=Conditions[Conditions.Count-1];
                        cond.Text:=value;
                     end else Raise Exception.Create(TranslateText('Незвестный параметр'));
                 end
          else if CurHead='TYPES' then begin
                 GetNameValue(line,name,value);
                 if name='CAPTION' then begin
                       inc(Types.Count);
                       Types.Captions[Types.Count]:=DevideRusUkr(value,true);
                       Types.Itogi[Types.Count]:=TStringList.Create;
                       Types.Unchecked[Types.Count]:=TStringList.Create;
                       Types.Order[Types.Count]:=TStringList.Create;
                 end
                 else if name='ITOGI' then
                       Str2StringList(value,Types.Itogi[Types.Count])
                 else if name='UNCHECKED' then
                       Str2StringList(value,Types.Unchecked[Types.Count])
                 else if name='ORDER' then
                       Str2StringList(value,Types.Order[Types.Count])
                 else if name='OPTIONS' then
                       Str2StringList(value,Types.Options[Types.Count])
                 else if name='DEFAULT' then
                       Types.Default_:=Types.Count;
            end;
            inc(i);
     end;

     if FormTitle='' then FormTitle:=Title;
     SetConfByType(Types.Default_);
   except
      on E:Exception do begin
         Raise Exception.Create(E.Message+TranslateText(' в строке ')+IntToStr(i));
      end;
   end;
end;
//==============================================================================
function TReport.Str2Style(p_Str: string): TStyle;
begin
 if p_Str='RN' then result:=stlRN
  else if p_Str='USUAL' then result:=stlUsual
       else Raise Exception.Create(TranslateText('Нет такого атрибута для STYLE'));
end;

function TReport.CountQuestionExpr(p_Str: string):string;
var s,s_result,param: String;
      val_s: TStringList;
         i: integer;
begin
//работа со строкой: параметр, условия, выражения
 s:=p_Str;
 param:=Copy(s,2,pos('<',s)-2);
 delete(s,1,length(param)+2);
 while Pos('<',s)>0 do s[Pos('<',s)]:=',';
 while Pos('>',s)>0 do s[Pos('>',s)]:=',';
 val_s:=TStringList.Create;//заполнение TStringList
 Str2StringList(s,val_s);
 i:=round((val_s.Count-2)/2);
 case i of
  1: if param=val_s.Strings[0] then s_result:=val_s.Strings[1]
      else s_result:=val_s.Strings[val_s.Count-1];
  2: if param=val_s.Strings[0] then s_result:=val_s.Strings[1]
      else if param=val_s.Strings[2] then s_result:=val_s.Strings[3]
       else s_result:=val_s.Strings[val_s.Count-1];
  3: if param=val_s.Strings[0] then s_result:=val_s.Strings[1]
      else if param=val_s.Strings[2] then s_result:=val_s.Strings[3]
       else if param=val_s.Strings[4] then s_result:=val_s.Strings[5]
        else s_result:=val_s.Strings[val_s.Count-1];
 end;
 result:=s_result;
end;

function TReport.GetRnParams:string;
var i:integer;
begin
  result:='';
  for i:=1 to Count do
  begin
    if not ShowFieldInReport[i]then
      continue;
    if length(Result)>0 then
      Result := Result+',';
    Result := Result+Fields[ColumnOrder[i]].Name;
  end;
end;

end.
