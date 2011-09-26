unit Rep_SvodFilAZS;

{$I define}

interface

uses  ComObj, ActiveX, Dialogs, {$IFDEF VER120}OleCtrls, {$ENDIF}
  Excel8TLB, StdCtrls,  DB, DBTables, SysUtils, Classes,
  {$IFDEF OIL}ExFunc, uCommonForm, Main, OilStd,  ReportManager, uDbPlan,
  UDbFunc, uImportFunc,{$ENDIF} uOilQuery, Ora, uOilStoredProc, DateUtils, Variants, Progr, ExcelFunc
  {$IFDEF OILPOST}, uDbFunc, uExFunc, UDbSaver, UDbStructure{$ENDIF},
  uApplicationInfo;

type

{ TOilReport }

  TOilReport = class(TObject)
  public
    procedure GetReport(); virtual; abstract;
  end;

{$IFDEF OIL}
{ TRepSvodFilAZS }

  TRepSvodFilAZS = class(TOilReport)
  private
    qAZS: TOilQuery;
    FProgress: TProgrForm;
    FList: Variant;
    FDate: TDateTime;
    FColVisible: boolean;
    function GetPosNPG(NPG_ID: integer): integer;
    function TotalRowStart: integer;
  public
    property Progress: TProgrForm read FProgress write FProgress;
    property List: Variant read FList write FList;
    property Date: TDateTime read FDate write FDate;
    property ColVisible: boolean read FColVisible write FColVisible;
    procedure GetReport(); override;
  end;
{$ENDIF}

{ TRepSvodFilAZSNew }

  TRepSvodFilAZSNew = class(TOilReport)
  private
    FProgress: TProgrForm;
    FList: Variant;
    FIXLSApp: Excel8TLB._Application;
    FIWorkbook: Excel8TLB._Workbook;
    FDateBegin, FDateEnd: TDateTime;
    FNpList, FAZSList: string;
    FColVisible: boolean;
    FDepId: integer;
  public
    ApplicationInfo: TApplicationInfo;
    property Progress: TProgrForm read FProgress write FProgress;
    property List: Variant read FList write FList;
    property IWorkbook: Excel8TLB._Workbook read FIWorkbook write FIWorkbook;
    property IXLSApp: Excel8TLB._Application read FIXLSApp write FIXLSApp;

    property DateBegin: TDateTime read FDateBegin write FDateBegin;
    property DateEnd: TDateTime read FDateEnd write FDateEnd;
    property NpList: string read FNpList write FNpList;
    property AZSList: string read FAZSList write FAZSList;
    property DepId: integer read FDepId write FDepId;

    property ColVisible: boolean read FColVisible write FColVisible;

    procedure GetReport(); override;
  end;
{$IFDEF OIL}
{ TReportBasicElectonFormCustom }

  TReportBasicElectonFormCustom = class(TOilReport)
  private
    FProgress: TProgrForm;
    FList, FXLApplication: Variant;
    FDateBegin, FDateEnd: TDateTime;
    FFilePath: string;
    FDepId: integer;
    FApplicationInfo: TApplicationInfo;
  private
    FParseExcel: TParseExcel;
    FPrihodQuery, FRashodQuery: TOraQuery;
    FAZSList, FNpList: string;
    procedure ExecuteQuery;
    procedure FillSheet;
  public
    property ApplicationInfo: TApplicationInfo read FApplicationInfo write FApplicationInfo;
    property AZSList: string read FAZSList write FAZSList;
    property DateBegin: TDateTime read FDateBegin write FDateBegin;
    property DateEnd: TDateTime read FDateEnd write FDateEnd;
    property DepId: integer read FDepId write FDepId;
    property FilePath: string read FFilePath write FFilePath;
    property List: Variant read FList write FList;
    property NpList: string read FNpList write FNpList;
    property Progress: TProgrForm read FProgress write FProgress;
    property ParseExcel: TParseExcel read FParseExcel write FParseExcel;
    property XLApplication: Variant read FXLApplication write FXLApplication;
    procedure GetReport(); override;
  end;
{$ENDIF}


var
  {$IFDEF OIL}
  RepSvodFilAZS: TRepSvodFilAZS;
  ReportBasicElectonFormCustom: TReportBasicElectonFormCustom;
  {$ENDIF}
  RepSvodFilAZSNew: TRepSvodFilAZSNew;

  start: TDateTime;

const
  PosAZS = 5;     // перша позиція із АЗС,    по вертикалі
  PosNextAZS = 7; // наступна позиція із АЗС, по вертикалі
  PosNB = 5;      // перша позиція із НБ,     по горизонталі
  PosNextNB = 2;  // наступна позиція із НБ,  по горизонталі
  CountNp = 6;    // кількість НП,            по вертикалі
  REPORTLOGFILE = 'reports.log';

implementation

{$IFDEF OILPOST}uses uTimeReport;{$ENDIF}

{$IFDEF OIL}
uses PrihCardRef, Math;

{ TRepSvodFilAZS }

function TRepSvodFilAZS.TotalRowStart: integer;
begin
  result := PosAZS + qAZS.RecordCount * PosNextAZS;
end;

function TRepSvodFilAZS.GetPosNPG(NPG_ID: integer): integer;
begin
  case NPG_ID of
    5:  result := 5;  // А-80
    6:  result := 6;  // А-92
    7:  result := 7;  // А-95
    76: result := 8;  // А-95 Premium
    10: result := 9;  // А-98
    3:  result := 10; // ДТ
  else
    begin
      result := 0;
      MessageDlg(TranslateText('Не определён НП!'), mtError, [mbOk], 0);
    end;
  end;
end;

procedure TRepSvodFilAZS.GetReport();
var
  q: TOilQuery;
  iAZS, PosNPG, iRows, iColumns, ProgressPosition, i, j: Integer;
  DepList: TStringList;
  Total, Totals, Arr: variant;
begin
  qAZS :=  DBPlan.qAZS;
  q := DbPlan.qSvodFilAZS;
  DepList := TStringList.Create;
  try

    // перерахунок залишків по НП на АЗС
    RecalcRegionRest(StartOfTheMonth(StartOfTheMonth(Self.Date)-1)-1, false);

    Progress.AddProgress(5);

    // знаходимо усі АЗС-ки по даній філії
    try
      if qAZS.Active then qAZS.Close;
      qAZS.Filtered := false;
      qAZS.ParamByName('obl_id').Clear;
      _OpenQuery(qAZS);
    except on E: Exception do
      raise Exception.Create(TranslateText('Ошибка при открытии запроса по АЗС!!!') +#10#13+ E.Message);
    end;
    if qAZS.IsEmpty then
      raise Exception.Create(TranslateText('Не найдено АЗС у данной организации!'));
    Progress.AddProgress(5);
    ProgressPosition := Progress.Progress;
    ProgressPosition :=
      decode([round((100 - ProgressPosition) / qAZS.RecordCount),
              0, 1,
              round((100 - ProgressPosition) / qAZS.RecordCount)
             ]);

    // Дістаємо дані для звіту
    try
      if q.Active then q.Close;
      q.Filtered := false;
      _OpenQueryPar(TOraQuery(q), ['p_RepDate', Self.Date]);
    except on E: Exception do
      raise Exception.Create(TranslateText('Ошибка при открытии главного запроса!!!') +#10#13+ E.Message);
    end;

    // Вставляем название области
   //** List.Cells[1, 'A'] := GetOrgName(INST, INST);
    // Вставляем дату звіту та назву організації 
    List.Cells[1, 'C'] := DateToStr(Self.Date);
    List.Cells[1, 'A'] := MAIN_ORG.NAME;

    // створює сортований список нафтобаз
    q.Filtered := false;
    q.Filter := 'tip_id=1';
    q.Filtered := true;
    DepList.Sorted := false;
    q.First;
    while not q.Eof do
      begin
        if not DepList.IndexOf(q.FieldByName('nb_id').AsString)>-1 then
          DepList.Add(q.FieldByName('nb_id').AsString);
        q.Next;
      end;


    // Табличная часть запроса
    iAZS := 0;
    qAZS.First;
    while not qAZS.Eof do
    begin
      Progress.AddProgress(ProgressPosition);

      iRows := PosAZS + PosNextAZS * iAZS;
      if not (qAZS.RecordCount = iAZS + 1) then
      begin
        List.Range['A'+ IntToStr(iRows) +':BI'+ IntToStr(iRows + PosNextAZS - 1)].Copy;
        List.Rows[iRows + PosNextAZS].Insert(xlDown);
      end;

      List.Cells[iRows, 'A'] := qAZS.FieldByName('name').AsString +' '+ qAZS.FieldByName('addr').AsString;

      // приходи з НБ на АЗС
      //************************************************************************
      q.Filtered := false;
      q.Filter := 'azs_id = '+ qAZS.FieldByName('id').AsString +' and tip_id = 1';
      q.Filtered := true;

      q.First;
      while not q.Eof do
      begin
        PosNPG := GetPosNPG(q.FieldByName('npg_id').AsInteger);
        iRows := PosNPG + PosNextAZS * iAZS;
        iColumns := PosNB + PosNextNB * DepList.IndexOf(q.FieldByName('nb_id').AsString);
        List.Cells[2, iColumns] := q.FieldByName('nb_name').AsString;
        List.Cells[iRows, iColumns] := MRound(q.FieldByName('prih_nb_kg').AsFloat, 3);
        List.Cells[iRows, iColumns + 1] := MRound(q.FieldByName('prih_nb_litr').AsFloat, 3);
        q.Next;
      end;
      //************************************************************************

      // реалізація
      //************************************************************************
      q.Filtered := false;
      q.Filter := 'azs_id = '+ qAZS.FieldByName('id').AsString +'and tip_id = 2';
      q.Filtered := true;

      q.First;
      while not q.Eof do
      begin
        PosNPG := GetPosNPG(q.FieldByName('npg_id').AsInteger);
        iRows := PosNPG + PosNextAZS * iAZS;
        iColumns := 3;

        List.Cells[iRows, iColumns] := MRound(q.FieldByName('rest_kg').AsFloat, 3);
        List.Cells[iRows, iColumns + 1] := MRound(q.FieldByName('rest_litr').AsFloat, 3);

        iColumns := 27;
        Arr := VarArrayCreate([0, 19], varVariant);
        Arr[0] := MRound(q.FieldByName('avg_litrprice').AsFloat, 3);
        Arr[1] := MRound(q.FieldByName('density').AsFloat, 3);
        Arr[2] := MRound(q.FieldByName('out_nal_kg').AsFloat, 3);
        Arr[3] := MRound(q.FieldByName('out_nal_litr').AsFloat, 3);
        Arr[4] := MRound(q.FieldByName('out_nal_summa').AsFloat, 3);
        Arr[5] := MRound(q.FieldByName('out_bankcard_kg').AsFloat, 3);
        Arr[6] := MRound(q.FieldByName('out_bankcard_litr').AsFloat, 3);
        Arr[7] := MRound(q.FieldByName('out_bankcard_summa').AsFloat, 3);
        Arr[8] := MRound(q.FieldByName('out_talon_kg').AsFloat, 3);
        Arr[9] := MRound(q.FieldByName('out_talon_litr').AsFloat, 3);
        Arr[10] := MRound(q.FieldByName('out_talon_summa').AsFloat, 3);
        Arr[11] := MRound(q.FieldByName('out_card_kg').AsFloat, 3);
        Arr[12] := MRound(q.FieldByName('out_card_litr').AsFloat, 3);
        Arr[13] := MRound(q.FieldByName('out_card_summa').AsFloat, 3);
        Arr[14] := MRound(q.FieldByName('out_ved_kg').AsFloat, 3);
        Arr[15] := MRound(q.FieldByName('out_ved_litr').AsFloat, 3);
        Arr[16] := MRound(q.FieldByName('out_ved_summa').AsFloat, 3);
        Arr[17] := MRound(q.FieldByName('out_other_kg').AsFloat, 3);
        Arr[18] := MRound(q.FieldByName('out_other_litr').AsFloat, 3);
        Arr[19] := MRound(q.FieldByName('out_other_summa').AsFloat, 3);
        List.Range(ExcelNumberToColumn(iColumns) + IntToStr(iRows) +':'+
          ExcelNumberToColumn(iColumns + 19) + IntToStr(iRows)) := Arr;
        List.Cells[iRows, 'BE'] := MRound(q.FieldByName('density').AsFloat, 3);
        List.Cells[iRows, 'BG'] := MRound(q.FieldByName('tubing_litr').AsFloat, 3);
        q.Next;
      end;
      //************************************************************************
      iAZS := iAZS + 1;
      qAZS.Next;
    end;

    // Итоги запроса
    //**************************************************************************
    Total := VarArrayCreate([0, CountNp - 1], varVariant);
    Totals := VarArrayCreate([3 - 2, 24 - 2, 1, CountNp], varVariant);

    // Итог по одной колонке
    for j := 0 to CountNp - 1 do
      Total[j] := '=';
    for i := 0 to iAZS - 1 do
    begin
      for j := 0 to CountNp - 1 do
        Total[j] := Total[j] +'%0:s'+ IntToStr(PosAZS + i * PosNextAZS + j) +'+';
    end;
    for j := 0 to CountNp - 1 do
      Total[j] := Total[j] +'0';

    // Итоги по всем колонкам
    for i := 3 to 24 do
    begin
      for j := 0 to CountNp - 1 do
        List.Cells[TotalRowStart + j, i] := Format(Total[j], [ExcelNumberToColumn(i)]);
    end;
    for i := 29 to 52 do
    begin
      for j := 0 to CountNp - 1 do
        List.Cells[TotalRowStart + j, i] := Format(Total[j], [ExcelNumberToColumn(i)]);
    end;

    // вирівнюємо усі рядки
    List.Rows[IntToStr(PosAZS) +':'+ IntToStr(PosAZS + PosNextAZS + 1 + PosNextAZS * qAZS.RecordCount)].RowHeight := 15;
    List.Cells[1, 'A'].Select;
    //**************************************************************************
    Progress.Progress := 100;
  finally
    if qAZS.Active then qAZS.Close;
    if q.Active then q.Close;
    DepList.Free;
  end;
end;
{$ENDIF}

{ TRepSvodFilAZSNew }

procedure TRepSvodFilAZSNew.GetReport();
const
  COLUMNS_NB: array [1..12] of integer = (6,8,10,12,14,16,18,20,22,24,26,28);
  {$IFDEF OILPOST}INST=666;{$ENDIF}
var
  qAZS, qCard, qTalon, qPrice, qAZSnpr_rest, qAZSnpr_prih, qAZSnpr_real: TOilQuery;
  ProgressPosition, CurPos, PosAZS, i,j, AZS_ID, rows, iRow, iRowNext, iColumn, curNP: Integer;
  curDate, msg: string;
  Range_nal_litr, Range_nal_money, Range_nal_price, Range_tal,
  Range_other,
  Range_visa, Range_visa_kg, Range_visa_grn,
  Range_card, Range_card_kg, Range_card_grn,
  Range_tkun, Range_tkun_kg, Range_tkun_grn,
  Range_tkr, Range_tkr_kg, Range_tkr_grn,
  Range_tku, Range_tku_kg, Range_tku_grn,
  Range_skr, Range_skr_kg, Range_skr_grn,
  Range_sku, Range_sku_kg, Range_sku_grn,
  Range_btu, Range_btu_kg, Range_btu_grn,
  Range_ptr, Range_ptr_kg, Range_ptr_grn,
  Range_ptu, Range_ptu_kg, Range_ptu_grn,
  Range_ved,   Range_ved_kg,   Range_ved_grn,
  Range, Range_trkcounter,
  PivotFields: Variant;
  slAZS_id, slNPG_id, slDepList, slNpgList: TStringList;
  prgrs, curLitr, curKg: Double;
  t1, t2, dT_xl, dT_ora, dT_total, tmpDate: TDateTime;
  {$IFDEF OILPOST}
  DBPlan: TdmTimeReport;
  DBSaver: TDbSaver;
  DBS: TDbStructure;
  {$ENDIF}
  vSession: TOraSession;
  {$IFDEF OILPOST}
  function GetClientInfo(AClientInfo: string; AProgress: integer):string;
  begin
    try
      if pos(']: ', AClientInfo) <> 0 then
        Result := Trim(Copy(AClientInfo, pos(']: ', AClientInfo)+3,length(AClientInfo)))
      else
        Result := AClientInfo;
      Result := '['+IntToStr(AProgress)+'%]: ' + Result;
    except on E:Exception do
      Result := AClientInfo;
    end;
  end;
  {$ENDIF}
  function PivotTableExists(AList: Variant; APivotTableName: string): boolean;
  var
    i: integer;
  begin
    Result := False;
    for i := 1 to AList.PivotTables.Count do
    begin
      if AList.PivotTables[i].Name = APivotTableName then
      begin
        Result := True;
        Break;
      end;
    end;
  end;
  function PivotItemExists(APivotFields: Variant; APivotItemName: string): boolean;
  var
    i: integer;
  begin
    Result := False;
    for i := 1 to APivotFields.PivotItems.Count do
    begin
      if APivotFields.PivotItems[i].Name = APivotItemName then
      begin
        Result := True;
        Break;
      end;
    end;
  end;
begin
  {$IFDEF OILPOST}
  DBPlan := dmTimeReport;
  {$ENDIF}
  log(REPORTLOGFILE,TranslateText('* + Вход в процедуру формирования отчета (шаблон открыт) ')+TimeToStr(Time));
  slDepList := TStringList.Create;
  slNPG_id := TStringList.Create;
  slAZS_id := TStringList.Create;
  slNpgList := TStringList.Create;
  dT_xl := 0;
  dT_ora := 0;
  dT_total := 0;
  //prgrs := 0;
  vSession := DbPlan.qSvodFilAZSPrice.Session;
  try

    Progress.AddProgress(1);

    {$IFDEF OILPOST}
    ApplicationInfo.ClientInfo := GetClientInfo(ApplicationInfo.ClientInfo,Progress.Progress);
    {$ENDIF}
    //Перерахунок транзакцій
    {$IFDEF OIL}
    if LAUNCH_MODE <> 'GREAT_OIL' then
    begin
      start := Time;    
      fRecalc;
      log(REPORTLOGFILE,TranslateText('* - Пересчет смарт-карт прошел за ')+IntToStr(trunc((Time-start)*24*3600))+TranslateText(' сек.'));
    end;
    {$ENDIF}

    Progress.AddProgress(4);

    {$IFDEF OILPOST}
    ApplicationInfo.ClientInfo := GetClientInfo(ApplicationInfo.ClientInfo,Progress.Progress);
    {$ENDIF}
    {$IFDEF OIL}
    // перерахунок залишків по НП на АЗС
    if LAUNCH_MODE <> 'GREAT_OIL' then
    begin
      start := Time;
      RecalcRegionRest(StartOfTheMonth(StartOfTheMonth(Self.DateBegin)-1)-1, false);
      log(REPORTLOGFILE,TranslateText('* - Пересчет сменных отчетов прошел за ')+IntToStr(trunc((Time-start)*24*3600))+TranslateText(' сек.'));
    end;
    {$ENDIF}

    Progress.AddProgress(5); //progress=10

    {$IFDEF OILPOST}
    ApplicationInfo.ClientInfo := GetClientInfo(ApplicationInfo.ClientInfo,Progress.Progress);
    {$ENDIF}
    //IXLSApp.Visible[0] := true;
    t1 := Time;
    t2 := t1;
    // ціна
    //**************************************************************************
    List := IWorkbook.Worksheets.Item['цена'] as Excel8TLB._Worksheet;
    //Виставляємо назву організації та початкову дату
    List.Cells[8, 'A'] := DateToStr(Self.DateBegin);
    List.Cells[1, 'C'] := FormatDateTime('MMMM', Self.DateBegin);
    List.Cells[1, 'F'] := vSession.ExecSQLEx(' begin select max(name) into :Result from v_org where id = :id and inst = :inst; end;',
      ['ID',   depid,
       'INST', depid]);
    List.Cells[3, 'F'] := vSession.ExecSQLEx('begin select max(r.name) into :Result from oil_org o, oil_city c, oil_regions r' +
                                               ' where o.state = ''Y''' +
                                               '   and c.state = ''Y'' and o.city_id = c.id' +
                                               '   and c.codregion = r.id' +
                                               '   and o.id = :id and o.inst = :inst; end;',
      ['ID', DepId, 'INST', DepId]);

    dT_xl := dT_xl+(Time-t1);
    t1 := Time;


    slNpgList.Delimiter := ',';
    slNpgList.DelimitedText := NpList;
    rows := slNpgList.Count*DaysBetween(Self.DateBegin-1, Self.DateEnd);
    try
      qPrice := DbPlan.qSvodFilAZSPrice;
      if qPrice.Active then qPrice.Close;
      qPrice.MacroByName('npg_id').Value := NpList;
      qPrice.MacroByName('np1').Value := slNpgList[0];
      qPrice.MacroByName('np2').Value := slNpgList[1];
      qPrice.MacroByName('np3').Value := slNpgList[2];
      qPrice.MacroByName('np4').Value := slNpgList[3];
      if slNpgList.Count > 4 then
      begin
        qPrice.MacroByName('np5').Value := slNpgList[4];
        qPrice.MacroByName('np6').Value := slNpgList[5];
      end
      else
      begin
        qPrice.MacroByName('np5').Value := '0';
        qPrice.MacroByName('np6').Value := '0';
      end;
      qPrice.MacroByName('azs_list').Value := AZSList;
      start := Time;
      _OpenQueryPar(TOraQuery(qPrice),
        ['BeginDate', Self.DateBegin,
         'EndDate',   Self.DateEnd,
         'obl_id',    Self.DepId]);
      log(REPORTLOGFILE,TranslateText('* - Запрос по ценам открылся за ')+IntToStr(trunc((Time-start)*24*3600))+TranslateText(' сек.'));
    except on E: Exception do
      begin
        MessageDlg(TranslateText('Ошибка при открытии запроса по ценам!!!') +#10#13+ E.Message, mtError, [mbOk], 0);
        exit;
      end;
    end;

    // Виставляємо назви нафтогруп
    qPrice.First;
    Range := VarArrayCreate([1, slNpgList.Count, 1, 1], varVariant);
    for i:=1 to slNpgList.Count do
      begin
        Range[i,1] := qPrice.FieldByName('np_group_name').AsString;
        slNPG_id.Add(qPrice.FieldByName('np_groupid').AsString);
        qPrice.Next;
      end;
    dT_ora := dT_ora+(Time-t1);
    t1 := Time;

    List.Range('B8:B11') := Range;
    IXLSApp.Calculation[0] := xlManual;

    Progress.AddProgress(5); //15

    {$IFDEF OILPOST}
    ApplicationInfo.ClientInfo := GetClientInfo(ApplicationInfo.ClientInfo,Progress.Progress);
    {$ENDIF}
    dT_xl := dT_xl+(Time-t1);
    t1 := Time;

    // знаходимо усі АЗС-ки по даній філії
    qAZS := DBPlan.qAZS;
    try
      if qAZS.Active then qAZS.Close;
      qAZS.FetchAll := true;

      start := Time;
      _OpenQueryPar(TOraQuery(qAZS ),
        ['obl_id', Self.DepId]);
      log(REPORTLOGFILE,TranslateText('* - Запрос по АЗС открылся за ')+IntToStr(trunc((Time-start)*24*3600))+TranslateText(' сек.'));
    except on E: Exception do
      begin
        MessageDlg(TranslateText('Ошибка при открытии запроса по АЗС!!!') +#10#13+ E.Message, mtError, [mbOk], 0);
        exit;
      end;
    end;

    // РОЗНИЦА (1..29)
    //--------------------------------------------------------------------------
    PosAZS := 3;
    //i := 1;
    Range_nal_price := VarArrayCreate([1, rows, 1, {slAZS_id.Count}50], varVariant);

    qPrice.First;

    dT_ora := dT_ora+(Time-t1);
    t1 := Time;

    qAZS.First;
    while not qAZS.Eof do
    begin
      if Pos(qAZS.FieldByName('id').AsString, AZSList) > 0 then //вибираємо АЗСки лише зі списку
      begin
        List.Cells[5, PosAZS] := qAZS.FieldByName('azs_num').AsString;
        if trim(qAZS.FieldByName('addr').AsString) <> '' then
          List.Cells[6, PosAZS] := qAZS.FieldByName('addr').AsString
        else
          List.Cells[6, PosAZS] := qAZS.FieldByName('name').AsString;
        slAZS_id.Add(qAZS.FieldByName('id').AsString);
        qPrice.Filtered := false;
        qPrice.Filter := 'tip_id = 1 and azs_id = '+ qAZS.FieldByName('id').AsString;
        qPrice.Filtered := true;
        qPrice.First;
        i := 1;
        while not qPrice.Eof do
        begin
          if qPrice.FieldByName('ret_price').IsNull then
            Range_nal_price[i, PosAZS-2] := Null
          else
            Range_nal_price[i, PosAZS-2] := qPrice.FieldByName('ret_price').AsFloat;
          qPrice.Next;
          inc(i);
        end;
        inc(PosAZS);
      end;
      qAZS.Next;
    end;

    List.Range('C8:'+ ExcelNumberToColumn(PosAZS-1) + IntToStr(rows + 7)) := Range_nal_price;
    List.Columns[ExcelNumberToColumn(PosAZS) +':'+ ExcelNumberToColumn(2 + slAZS_id.Count)].EntireColumn.Hidden := true;

    Progress.AddProgress(5);  //progress=20

    {$IFDEF OILPOST}
    ApplicationInfo.ClientInfo := GetClientInfo(ApplicationInfo.ClientInfo,Progress.Progress);
    {$ENDIF}
    dT_xl := dT_xl+(Time-t1);
    t1 := Time;

    // Талони та Смарт-Карти
    //--------------------------------------------------------------------------
    qPrice.Filtered := false;
    qPrice.Filter := 'tip_id = 2';
    qPrice.Filtered := true;
    Range_tal := VarArrayCreate([1, rows, 1, 1], varVariant);
    Range_card := VarArrayCreate([1, rows, 1, 1], varVariant);
    i := 1;
    qPrice.First;
    while not qPrice.Eof do
      begin

        if qPrice.FieldByName('tal_price').IsNull then
          Range_tal[i,1] := Null
        else
          Range_tal[i,1] := qPrice.FieldByName('tal_price').AsFloat;

        if qPrice.FieldByName('card_price').IsNull then
          Range_card[i,1] := Null
        else
          Range_card[i,1] := qPrice.FieldByName('card_price').AsFloat;

        qPrice.Next;
        inc(i);
      end;

    dT_ora := dT_ora+(Time-t1);
    t1 := Time;

    List.Range('AF8:AF'+IntToStr(rows + 7)) := Range_tal;
    List.Range('AO8:AO'+IntToStr(rows + 7)) := Range_card;
    //**************************************************************************

    Progress.AddProgress(5);  //progress=25

    {$IFDEF OILPOST}
    ApplicationInfo.ClientInfo := GetClientInfo(ApplicationInfo.ClientInfo,Progress.Progress);
    {$ENDIF}
    // АЗС нпр
    //**************************************************************************
    List := IWorkbook.Worksheets.Item['АЗС нпр'] as Excel8TLB._Worksheet;

    dT_xl := dT_xl+(Time-t1);
    t1 := Time;

    // АЗС нпр -> залишки на 1 число місяця
    //--------------------------------------------------------------------------
    try
      qAZSnpr_rest := DbPlan.qSvodFilAZS_RestOnBegin;
      if qAZSnpr_rest.Active then qAZSnpr_rest.Close;
      qAZSnpr_rest.MacroByName('npg_id').Value := NpList;
      qAZSnpr_rest.MacroByName('azs_list').Value := AZSList;
      qAZSnpr_rest.MacroByName('np1').Value := slNpgList[0];
      qAZSnpr_rest.MacroByName('np2').Value := slNpgList[1];
      qAZSnpr_rest.MacroByName('np3').Value := slNpgList[2];
      qAZSnpr_rest.MacroByName('np4').Value := slNpgList[3];
      if slNpgList.Count > 4 then
      begin
        qAZSnpr_rest.MacroByName('np5').Value := slNpgList[4];
        qAZSnpr_rest.MacroByName('np6').Value := slNpgList[5];
      end
      else
      begin
        qAZSnpr_rest.MacroByName('np5').Value := '0';
        qAZSnpr_rest.MacroByName('np6').Value := '0';
      end;
      start := Time;
      qAZSnpr_rest.Prepare;
      _OpenQueryPar(TOraQuery(qAZSnpr_rest),
        ['BeginDate', Self.DateBegin,
         'obl_id', Self.DepId]);
      log(REPORTLOGFILE,TranslateText('* - Запрос по остаткам НП открылся за ')+IntToStr(trunc((Time-start)*24*3600))+TranslateText(' сек.'));
    except on E: Exception do
      begin
        MessageDlg(TranslateText('Ошибка при открытии запроса по остаткам для "АЗС нпр"!!!') +#10#13+ E.Message, mtError, [mbOk], 0);
        exit;
      end;
    end;

    qAZSnpr_rest.Filtered := False;
    rows := qAZSnpr_rest.RecordCount;
    i := 1;
    Range := VarArrayCreate([1, rows, 1, 2], varVariant);
    Range_trkcounter := VarArrayCreate([1,rows,1,1], varVariant);
    qAZSnpr_rest.First;
    while not qAZSnpr_rest.Eof and (qAZSnpr_rest.RecNo <= slAZS_id.Count*slNpgList.Count) do
      begin
        Range[i,1] := qAZSnpr_rest.FieldByName('rest_litr').AsFloat;
        Range[i,2] := qAZSnpr_rest.FieldByName('rest_kg').AsFloat;
        Range_trkcounter[i,1] := qAZSnpr_rest.FieldByName('begin_counter').AsFloat;
        inc(i);
        qAZSnpr_rest.next;
      end;

    dT_ora := dT_ora+(Time-t1);
    t1 := Time;

    List.Range('D4:E'+IntToStr(qAZSnpr_rest.RecordCount+3)) := Range;
    List.Range('CO4:CO'+IntToStr(qAZSnpr_rest.RecordCount+3)) := Range_trkcounter;

    Progress.AddProgress(15);  //progress=40

    {$IFDEF OILPOST}
    ApplicationInfo.ClientInfo := GetClientInfo(ApplicationInfo.ClientInfo,Progress.Progress);
    {$ENDIF}
    dT_xl := dT_xl+(Time-t1);
    t1 := Time;

    { АЗС нпр -> приходи }

    try
      qAZSnpr_prih := DbPlan.qSvodFilAZS_Prihod;
      if qAZSnpr_prih.Active then qAZSnpr_prih.Close;
      qAZSnpr_prih.MacroByName('npg_id').Value := NpList;
      qAZSnpr_prih.MacroByName('azs_list').Value := AZSList;
      qAZSnpr_prih.MacroByName('np1').Value := slNpgList[0];
      qAZSnpr_prih.MacroByName('np2').Value := slNpgList[1];
      qAZSnpr_prih.MacroByName('np3').Value := slNpgList[2];
      qAZSnpr_prih.MacroByName('np4').Value := slNpgList[3];
      if slNpgList.Count > 4 then
      begin
        qAZSnpr_prih.MacroByName('np5').Value := slNpgList[4];
        qAZSnpr_prih.MacroByName('np6').Value := slNpgList[5];
      end
      else
      begin
        qAZSnpr_prih.MacroByName('np5').Value := '0';
        qAZSnpr_prih.MacroByName('np6').Value := '0';
      end;
      start := Time;
      _OpenQueryPar(TOraQuery(qAZSnpr_prih),
          ['BeginDate', Self.DateBegin,
           'EndDate',   Self.DateEnd,
           'obl_id',    Self.DepId]);
      log(REPORTLOGFILE,TranslateText('* - Запрос по приходам НП открылся за ')+IntToStr(trunc((Time-start)*24*3600))+TranslateText(' сек.'));
    except on E: Exception do
      begin
        MessageDlg(TranslateText('Ошибка при открытии запроса по приходам для "АЗС нпр"!!!') +#10#13+ E.Message, mtError, [mbOk], 0);
        exit;
      end;
    end;

    // максимум 12-ть НБ
    // останні 2-і НБ це "Другие сбыты" і "Излишки"
    slDepList.Sorted := false;
    slDepList.CommaText :=
      nvl(GetSqlValueParSimple(
        'select value from adm_settings where name = ''SVOD_FIL_AZS_NB_POS_'' || :org_inst',
        ['org_inst', Self.DepId], '' {$IFDEF OILPOST},vSession{$ENDIF}), '');

    // створює сортований список нафтобаз
    // перші йдуть філіали
    qAZSnpr_prih.Filtered := false;
    qAZSnpr_prih.Filter := 'is_from_filial=1';
    qAZSnpr_prih.Filtered := true;
    qAZSnpr_prih.First;
    while not qAZSnpr_prih.Eof do
      begin
        if (slDepList.IndexOf(qAZSnpr_prih.FieldByName('from_id').AsString) < 0)
          and (slDepList.Count <= 10)
          and (qAZSnpr_prih.FieldByName('from_id').AsInteger <> 11407)
          and (qAZSnpr_prih.FieldByName('from_id').AsInteger <> 11408) then
          slDepList.Add(qAZSnpr_prih.FieldByName('from_id').AsString);
        qAZSnpr_prih.Next;
      end;

    // за ними йдуть НБ АНП
    qAZSnpr_prih.Filtered := false;
    qAZSnpr_prih.Filter := 'is_from_filial=0 AND from_nb_num>0';
    qAZSnpr_prih.Filtered := true;
    qAZSnpr_prih.First;
    while not qAZSnpr_prih.Eof do
      begin
        if (slDepList.IndexOf(qAZSnpr_prih.FieldByName('from_id').AsString) < 0)
          and (slDepList.Count <= 10)
          and (qAZSnpr_prih.FieldByName('from_id').AsInteger <> 11407)
          and (qAZSnpr_prih.FieldByName('from_id').AsInteger <> 11408) then
          slDepList.Add(qAZSnpr_prih.FieldByName('from_id').AsString);
        qAZSnpr_prih.Next;
      end;

    // після філіалів йдуть НБ Авіаса
    qAZSnpr_prih.Filtered := false;
    qAZSnpr_prih.Filter := 'is_from_filial=0 AND from_id>0';
    qAZSnpr_prih.Filtered := true;
    qAZSnpr_prih.First;
    while not qAZSnpr_prih.Eof do
      begin
        if (slDepList.IndexOf(qAZSnpr_prih.FieldByName('from_id').AsString) < 0)
          and (slDepList.Count <= 10)
          and (qAZSnpr_prih.FieldByName('from_id').AsInteger <> 11407)
          and (qAZSnpr_prih.FieldByName('from_id').AsInteger <> 11408) then
          slDepList.Add(qAZSnpr_prih.FieldByName('from_id').AsString);
        qAZSnpr_prih.Next;
      end;

    // останні 2-і НБ це "Другие сбыты" і "Излишки"
    // Если меньше десяти, то до десяти заполняем пустыми
    for i := slDepList.Count+1 to 10 do
      slDepList.Add('');
    // Если больше десяти, то удаляем лишние
    while slDepList.Count > 10 do
      slDepList.Delete(slDepList.Count - 1);
    slDepList.CommaText := slDepList.CommaText +',11407,11408';

    dT_ora := dT_ora+(Time-t1);
    t1 := Time;

    // вставляємо назви НБ
    for i:=1 to slDepList.Count do
    begin
      if (slDepList[i-1] <> '') and (i <= 10) then
      begin
        qAZSnpr_prih.Filtered := false;
        qAZSnpr_prih.Filter := 'from_id = '+slDepList[i-1];
        qAZSnpr_prih.Filtered := true;
        qAZSnpr_prih.First;
        List.Cells[3, COLUMNS_NB[i]]   := GetOrgName(StrToInt(slDepList[i-1]), StrToInt(slDepList[i-1]){$IFDEF OILPOST},vSession{$ENDIF}) + ' (л)';
        List.Cells[3, COLUMNS_NB[i]+1] := GetOrgName(StrToInt(slDepList[i-1]), StrToInt(slDepList[i-1]){$IFDEF OILPOST},vSession{$ENDIF}) + ' (кг)';
      end;
    end;

    qAZSnpr_prih.Filtered := False;
    {$IFDEF OIL}
    prgrs := Progress.Progress;
    {$ENDIF}
    for i := 0 to DaysBetween(Self.DateBegin, Self.DateEnd) do
    begin
      if slNpgList.Count > 4 then
        iRow := 4+210*i
      else
        iRow := 4+140*i;
      curDate := List.Range['A'+IntToStr(iRow)];
      qAZSnpr_prih.Filtered := False;
      qAZSnpr_prih.Filter := 'date_ = ''' + curDate+'''';
      qAZSnpr_prih.Filtered := True;
      qAZSnpr_prih.First;
      curNP := qAZSnpr_prih.FieldByName('np_groupid').AsInteger;
      while not qAZSnpr_prih.Eof and (qAZSnpr_prih.RecNo <= slAZS_id.Count*slNpgList.Count*slDepList.Count) do
      begin
        if curNP <> qAZSnpr_prih.FieldByName('np_groupid').AsInteger then
        begin
          curNP := qAZSnpr_prih.FieldByName('np_groupid').AsInteger;
          inc(iRow);
        end;
        if not qAZSnpr_prih.FieldByName('from_id').IsNull then
        begin
          iColumn := COLUMNS_NB[slDepList.IndexOf(qAZSnpr_prih.FieldByName('from_id').AsString) + 1];
          try
            if (iColumn < COLUMNS_NB[low(COLUMNS_NB)]) or (iColumn > COLUMNS_NB[high(COLUMNS_NB)]) then
              iColumn := COLUMNS_NB[high(COLUMNS_NB) - 1];
            List.Cells[iRow, iColumn] := List.Cells[iRow, iColumn].value + qAZSnpr_prih.FieldByName('prih_litr').AsFloat;
            List.Cells[iRow, iColumn + 1] := List.Cells[iRow, iColumn + 1].value + qAZSnpr_prih.FieldByName('prih_kg').AsFloat;
          except on E: Exception do
            begin
              if slDepList.Count > length(COLUMNS_NB) then
                msg := 'Количество выводимых нефтебаз превышает допустимое количество (максимум 12)!' + #10#13;
              raise Exception.CreateFmt(msg + 'Ошибка при вставке приходов строка=%d, столбец=%d.' + #10#13 + '%s', [iRow, iColumn, e.Message]);
            end;
          end;
        end;
        qAZSnpr_prih.Next;
      end;
      {$IFDEF OIL}
      prgrs := prgrs + 15/(DaysBetween(Self.DateBegin, Self.DateEnd)+1);
      Progress.Progress := trunc(prgrs);
      {$ENDIF}
    end;          //progress=55
    {$IFDEF OILPOST}
    ApplicationInfo.ClientInfo := GetClientInfo(ApplicationInfo.ClientInfo,Progress.Progress);
    {$ENDIF}

    dT_xl := dT_xl+(Time-t1);
    t1 := Time;

    { АЗС нпр -> реалізація }

    try
      qAZSnpr_real := DbPlan.qSvodFilAZS_Realiz;
      if qAZSnpr_real.Active then qAZSnpr_real.Close;
      qAZSnpr_real.MacroByName('npg_id').Value := NpList;
      qAZSnpr_real.MacroByName('azs_list').Value := AZSList;
      qAZSnpr_real.MacroByName('np1').Value := slNpgList[0];
      qAZSnpr_real.MacroByName('np2').Value := slNpgList[1];
      qAZSnpr_real.MacroByName('np3').Value := slNpgList[2];
      qAZSnpr_real.MacroByName('np4').Value := slNpgList[3];
      if slNpgList.Count > 4 then
      begin
        qAZSnpr_real.MacroByName('np5').Value := slNpgList[4];
        qAZSnpr_real.MacroByName('np6').Value := slNpgList[5];
      end
      else
      begin
        qAZSnpr_real.MacroByName('np5').Value := '0';
        qAZSnpr_real.MacroByName('np6').Value := '0';
      end;

      start := Time;
      _OpenQueryPar(TOraQuery(qAZSnpr_real),
          ['BeginDate', Self.DateBegin,
           'EndDate',   Self.DateEnd,
           'obl_id', Self.DepId]);
      log(REPORTLOGFILE,TranslateText('* - Запрос по реализации открылся за ')+IntToStr(trunc((Time-start)*24*3600))+TranslateText(' сек.'));
    except on E: Exception do
      begin
        MessageDlg(TranslateText('Ошибка при открытии запроса по реализации для "АЗС нпр"!!!') +#10#13+ E.Message, mtError, [mbOk], 0);
        exit;
      end;
    end;

    qAZSnpr_real.Filtered := false;
    rows := trunc(qAZSnpr_real.RecordCount/(DaysBetween(Self.DateBegin, Self.DateEnd)+1));  // отримаємо (кількість_АСЗ * кількість_НП) на дату
    Range_nal_litr := VarArrayCreate([1,rows,1,1], varVariant);
    Range_nal_money := VarArrayCreate([1,rows,1,1], varVariant);

    Range_visa := VarArrayCreate([1,rows,1,1], varVariant);
    Range_visa_kg:= VarArrayCreate([1,rows,1,1], varVariant);
    Range_visa_grn:= VarArrayCreate([1,rows,1,1], varVariant);

    Range_card := VarArrayCreate([1,rows,1,1], varVariant);
    Range_card_kg:= VarArrayCreate([1,rows,1,1], varVariant);
    Range_card_grn:= VarArrayCreate([1,rows,1,1], varVariant);

    Range_tkun := VarArrayCreate([1,rows,1,1], varVariant);
    Range_tkun_kg := VarArrayCreate([1,rows,1,1], varVariant);
    Range_tkun_grn := VarArrayCreate([1,rows,1,1], varVariant);

    Range_tkr := VarArrayCreate([1,rows,1,1], varVariant);
    Range_tkr_kg := VarArrayCreate([1,rows,1,1], varVariant);
    Range_tkr_grn := VarArrayCreate([1,rows,1,1], varVariant);

    Range_tku := VarArrayCreate([1,rows,1,1], varVariant);
    Range_tku_kg := VarArrayCreate([1,rows,1,1], varVariant);
    Range_tku_grn := VarArrayCreate([1,rows,1,1], varVariant);

    Range_skr := VarArrayCreate([1,rows,1,1], varVariant);
    Range_skr_kg := VarArrayCreate([1,rows,1,1], varVariant);
    Range_skr_grn := VarArrayCreate([1,rows,1,1], varVariant);

    Range_sku := VarArrayCreate([1,rows,1,1], varVariant);
    Range_sku_kg := VarArrayCreate([1,rows,1,1], varVariant);
    Range_sku_grn := VarArrayCreate([1,rows,1,1], varVariant);

    Range_btu := VarArrayCreate([1,rows,1,1], varVariant);
    Range_btu_kg := VarArrayCreate([1,rows,1,1], varVariant);
    Range_btu_grn := VarArrayCreate([1,rows,1,1], varVariant);

    Range_ptr := VarArrayCreate([1,rows,1,1], varVariant);
    Range_ptr_kg := VarArrayCreate([1,rows,1,1], varVariant);
    Range_ptr_grn := VarArrayCreate([1,rows,1,1], varVariant);

    Range_ptu := VarArrayCreate([1,rows,1,1], varVariant);
    Range_ptu_kg := VarArrayCreate([1,rows,1,1], varVariant);
    Range_ptu_grn := VarArrayCreate([1,rows,1,1], varVariant);

    Range_ved := VarArrayCreate([1,rows,1,1], varVariant);
    Range_ved_kg := VarArrayCreate([1,rows,1,1], varVariant);
    Range_ved_grn := VarArrayCreate([1,rows,1,1], varVariant);

    Range_tal := VarArrayCreate([1,rows,1,1], varVariant);
    Range_other := VarArrayCreate([1,rows,1,2], varVariant);
    Range := VarArrayCreate([1,rows,1,2], varVariant); // залишки в трубопроводах

    prgrs := Progress.Progress;

    IXLSApp.Calculation[0] := xlManual;
    for i:=0 to DaysBetween(Self.DateBegin, Self.DateEnd) do
    begin
      if slNpgList.Count > 4 then
      begin
        iRow := 4+210*i;
        iRowNext := 4+210*(i+1);
      end
      else
      begin
        iRow := 4+140*i;
        iRowNext := 4+140*(i+1);
      end;

      List.Rows[IntToStr(iRow+rows)+':'+IntToStr(iRowNext-1)].EntireRow.Hidden := True;

      curDate := List.Cells[iRow,'A'];
      qAZSnpr_real.Filtered := false;
      qAZSnpr_real.Filter := 'date_ = ''' + curDate+'''';
      qAZSnpr_real.Filtered := true;
      qAZSnpr_real.First;
      j:=1;
      while not qAZSnpr_real.Eof and (qAZSnpr_real.RecNo <= slAZS_id.Count*slNpgList.Count) do
        begin
          Range_nal_litr[j,1] := qAZSnpr_real.FieldByName('out_nal_litr').AsFloat;
          Range_nal_money[j,1] := qAZSnpr_real.FieldByName('out_nal_money').AsFloat;

          Range_visa[j,1] := qAZSnpr_real.FieldByName('out_visa_litr').AsFloat;
          Range_visa_kg[j,1] := qAZSnpr_real.FieldByName('out_visa_count').AsFloat;
          Range_visa_grn[j,1] := MROUND(qAZSnpr_real.FieldByName('out_visa_money').AsFloat,2);

          Range_card[j,1] := qAZSnpr_real.FieldByName('out_card_litr').AsFloat;
          Range_card_kg[j,1] := qAZSnpr_real.FieldByName('out_card_count').AsFloat;
          Range_card_grn[j,1] := MROUND(qAZSnpr_real.FieldByName('out_card_money').AsFloat,2);

          Range_tkun[j,1] := qAZSnpr_real.FieldByName('out_tkun_litr').AsFloat;
          Range_tkun_kg[j,1] := qAZSnpr_real.FieldByName('out_tkun_count').AsFloat;
          Range_tkun_grn[j,1] := MROUND(qAZSnpr_real.FieldByName('out_tkun_money').AsFloat,2);

          Range_tkr[j,1] := qAZSnpr_real.FieldByName('out_tkr_litr').AsFloat;
          Range_tkr_kg[j,1] := qAZSnpr_real.FieldByName('out_tkr_count').AsFloat;
          Range_tkr_grn[j,1] := MROUND(qAZSnpr_real.FieldByName('out_tkr_money').AsFloat,2);

          Range_tku[j,1] := qAZSnpr_real.FieldByName('out_tku_litr').AsFloat;
          Range_tku_kg[j,1] := qAZSnpr_real.FieldByName('out_tku_count').AsFloat;
          Range_tku_grn[j,1] := MROUND(qAZSnpr_real.FieldByName('out_tku_money').AsFloat,2);

          Range_skr[j,1] := qAZSnpr_real.FieldByName('out_skr_litr').AsFloat;
          Range_skr_kg[j,1] := qAZSnpr_real.FieldByName('out_skr_count').AsFloat;
          Range_skr_grn[j,1] := MROUND(qAZSnpr_real.FieldByName('out_skr_money').AsFloat,2);

          Range_sku[j,1] := qAZSnpr_real.FieldByName('out_sku_litr').AsFloat;
          Range_sku_kg[j,1] := qAZSnpr_real.FieldByName('out_sku_count').AsFloat;
          Range_sku_grn[j,1] := MROUND(qAZSnpr_real.FieldByName('out_sku_money').AsFloat,2);

          Range_btu[j,1] := qAZSnpr_real.FieldByName('out_btu_litr').AsFloat;
          Range_btu_kg[j,1] := qAZSnpr_real.FieldByName('out_btu_count').AsFloat;
          Range_btu_grn[j,1] := MROUND(qAZSnpr_real.FieldByName('out_btu_money').AsFloat,2);

          Range_ptr[j,1] := qAZSnpr_real.FieldByName('out_ptr_litr').AsFloat;
          Range_ptr_kg[j,1] := qAZSnpr_real.FieldByName('out_ptr_count').AsFloat;
          Range_ptr_grn[j,1] := MROUND(qAZSnpr_real.FieldByName('out_ptr_money').AsFloat,2);

          Range_ptu[j,1] := qAZSnpr_real.FieldByName('out_ptu_litr').AsFloat;
          Range_ptu_kg[j,1] := qAZSnpr_real.FieldByName('out_ptu_count').AsFloat;
          Range_ptu_grn[j,1] := MROUND(qAZSnpr_real.FieldByName('out_ptu_money').AsFloat,2);

          Range_ved[j,1] := qAZSnpr_real.FieldByName('out_ved_litr').AsFloat;
          Range_ved_kg[j,1] := qAZSnpr_real.FieldByName('out_ved_count').AsFloat;
          Range_ved_grn[j,1] := MROUND(qAZSnpr_real.FieldByName('out_ved_money').AsFloat,2);

          Range_tal[j,1] := qAZSnpr_real.FieldByName('out_talon_litr').AsFloat;
          Range_other[j,1] := qAZSnpr_real.FieldByName('out_other_litr').AsFloat;
          Range_other[j,2] := qAZSnpr_real.FieldByName('out_other_kg').AsFloat;
          qAZSnpr_real.Next;
          inc(j);
        end;

      dT_ora := dT_ora+(Time-t1);
      t1 := Time;

      List.Range('AG'+IntToStr(iRow)+':AG'+IntToStr(iRow+rows-1)) := Range_nal_litr;
      List.Range('AK'+IntToStr(iRow)+':AK'+IntToStr(iRow+rows-1)) := Range_nal_money;

      List.Range('AL'+IntToStr(iRow)+':AL'+IntToStr(iRow+rows-1)) := Range_visa;
      List.Range('AM'+IntToStr(iRow)+':AM'+IntToStr(iRow+rows-1)) := Range_visa_kg;
      List.Range('AN'+IntToStr(iRow)+':AN'+IntToStr(iRow+rows-1)) := Range_visa_grn;

      List.Range('AO'+IntToStr(iRow)+':AO'+IntToStr(iRow+rows-1)) := Range_tkun;
      List.Range('AP'+IntToStr(iRow)+':AP'+IntToStr(iRow+rows-1)) := Range_tkun_kg;
      List.Range('AQ'+IntToStr(iRow)+':AQ'+IntToStr(iRow+rows-1)) := Range_tkun_grn;

      List.Range('AR'+IntToStr(iRow)+':AR'+IntToStr(iRow+rows-1)) := Range_tkr;
      List.Range('AS'+IntToStr(iRow)+':AS'+IntToStr(iRow+rows-1)) := Range_tkr_kg;
      List.Range('AT'+IntToStr(iRow)+':AT'+IntToStr(iRow+rows-1)) := Range_tkr_grn;

      List.Range('AU'+IntToStr(iRow)+':AU'+IntToStr(iRow+rows-1)) := Range_tku;
      List.Range('AV'+IntToStr(iRow)+':AV'+IntToStr(iRow+rows-1)) := Range_tku_kg;
      List.Range('AW'+IntToStr(iRow)+':AW'+IntToStr(iRow+rows-1)) := Range_tku_grn;

      List.Range('AX'+IntToStr(iRow)+':AX'+IntToStr(iRow+rows-1)) := Range_skr;
      List.Range('AY'+IntToStr(iRow)+':AY'+IntToStr(iRow+rows-1)) := Range_skr_kg;
      List.Range('AZ'+IntToStr(iRow)+':AZ'+IntToStr(iRow+rows-1)) := Range_skr_grn;

      List.Range('BA'+IntToStr(iRow)+':BA'+IntToStr(iRow+rows-1)) := Range_sku;
      List.Range('BB'+IntToStr(iRow)+':BB'+IntToStr(iRow+rows-1)) := Range_sku_kg;
      List.Range('BC'+IntToStr(iRow)+':BC'+IntToStr(iRow+rows-1)) := Range_sku_grn;

      List.Range('BG'+IntToStr(iRow)+':BG'+IntToStr(iRow+rows-1)) := Range_card;
      List.Range('BH'+IntToStr(iRow)+':BH'+IntToStr(iRow+rows-1)) := Range_card_kg;
      List.Range('BI'+IntToStr(iRow)+':BI'+IntToStr(iRow+rows-1)) := Range_card_grn;

      List.Range('BJ'+IntToStr(iRow)+':BJ'+IntToStr(iRow+rows-1)) := Range_ved;
      List.Range('BK'+IntToStr(iRow)+':BK'+IntToStr(iRow+rows-1)) := Range_ved_kg;
      List.Range('BL'+IntToStr(iRow)+':BL'+IntToStr(iRow+rows-1)) := Range_ved_grn;

      List.Range('BP'+IntToStr(iRow)+':BP'+IntToStr(iRow+rows-1)) := Range_btu;
      List.Range('BQ'+IntToStr(iRow)+':BQ'+IntToStr(iRow+rows-1)) := Range_btu_kg;
      List.Range('BR'+IntToStr(iRow)+':BR'+IntToStr(iRow+rows-1)) := Range_btu_grn;

      List.Range('BS'+IntToStr(iRow)+':BS'+IntToStr(iRow+rows-1)) := Range_ptr;
      List.Range('BT'+IntToStr(iRow)+':BT'+IntToStr(iRow+rows-1)) := Range_ptr_kg;
      List.Range('BU'+IntToStr(iRow)+':BU'+IntToStr(iRow+rows-1)) := Range_ptr_grn;

      List.Range('BV'+IntToStr(iRow)+':BV'+IntToStr(iRow+rows-1)) := Range_ptu;
      List.Range('BW'+IntToStr(iRow)+':BW'+IntToStr(iRow+rows-1)) := Range_ptu_kg;
      List.Range('BX'+IntToStr(iRow)+':BX'+IntToStr(iRow+rows-1)) := Range_ptu_grn;

      List.Range('BD'+IntToStr(iRow)+':BD'+IntToStr(iRow+rows-1)) := Range_tal;
      List.Range('CE'+IntToStr(iRow)+':CF'+IntToStr(iRow+rows-1)) := Range_other;
      dT_xl := dT_xl+(Time-t1);
      t1 := Time;

      // окремо вставляємо трубопроводи
      qAZSnpr_real.First;
      j := 1;
      if i = 0 then
      begin
        while not qAZSnpr_real.Eof and (qAZSnpr_real.RecNo <= slAZS_id.Count*slNpgList.Count) do
        begin
          Range[j,1] := qAZSnpr_real.FieldByName('tubing_litr').AsFloat;
          Range[j,2] := MRound(VarAsType(List.Range['AF'+IntToStr(iRow+j-1)],varDouble) * qAZSnpr_real.FieldByName('tubing_litr').AsFloat,3);
          qAZSnpr_real.Next;
          inc(j);
        end;

        dT_ora := dT_ora+(Time-t1);
        t1 := Time;

        List.Range('CL'+IntToStr(iRow)+':CL'+IntToStr(iRow+rows-1)) := Range;

        dT_xl := dT_xl+(Time-t1);
        t1 := Time;
      end;
      prgrs := prgrs + 15/(DaysBetween(Self.DateBegin, Self.DateEnd)+1);
      Progress.Progress := trunc(prgrs);
    end;
    {$IFDEF OILPOST}
    ApplicationInfo.ClientInfo := GetClientInfo(ApplicationInfo.ClientInfo,Progress.Progress);
    {$ENDIF}
    //**************************************************************************


    { тал. РД ANP }
    //**************************************************************************
    try
      if Self.DateBegin < StrToDate('01.08.2009')then
      begin
        {$IFDEF OIL}
        if Main.INST = 666 then
          qTalon := DbPlan.qSvodFilAZSTalon666
        else
          qTalon := DbPlan.qSvodFilAZSTalon;
        {$ENDIF}
        {$IFDEF OILPOST}
        qTalon := DbPlan.qSvodFilAZSTalon666;
        {$ENDIF}

        if qTalon.Active then qTalon.Close;
        qTalon.MacroByName('npg_id').Value := NpList;
        qTalon.MacroByName('np1').Value := slNpgList[0];
        qTalon.MacroByName('np2').Value := slNpgList[1];
        qTalon.MacroByName('np3').Value := slNpgList[2];
        qTalon.MacroByName('np4').Value := slNpgList[3];
        if slNpgList.Count > 4 then
        begin
          qTalon.MacroByName('np5').Value := slNpgList[4];
          qTalon.MacroByName('np6').Value := slNpgList[5];
        end
        else
        begin
          qTalon.MacroByName('np5').Value := '0';
          qTalon.MacroByName('np6').Value := '0';
        end;

        start := Time;
        _OpenQueryPar(TOraQuery(qTalon),
          ['BeginDate', Self.DateBegin,
           'EndDate',   Self.DateEnd,
           'obl_id',    Self.DepId]);
        log(REPORTLOGFILE,TranslateText('* - Запрос по талонам открылся за ')+IntToStr(trunc((Time-start)*24*3600))+TranslateText(' сек.'));
        qTalon.Filtered := False;
      end;
    except on E: Exception do
      begin
        MessageDlg(TranslateText('Ошибка при открытии запроса по талонам!!!') +#10#13+ E.Message, mtError, [mbOk], 0);
        exit;
      end;
    end;

    if Assigned(qTalon) then
    try
      List := IWorkbook.Worksheets.Item['тал. РД ANP'] as Excel8TLB._Worksheet;
      CurPos := 1;
      Range_tal := VarArrayCreate([1,qTalon.RecordCount,1,1],varVariant);
      Range := VarArrayCreate([1,8,1,1],varVariant);  // залишок на початок дня
      qTalon.First;
      while not qTalon.Eof do
      begin
        if CurPos <= 8 then
          Range[CurPos, 1] := MRound(qTalon.FieldByName('rest_sum_litr').AsFloat, 3);
        Range_tal[CurPos,1] := MRound(qTalon.FieldByName('sum_litr').AsFloat, 3);
        inc(CurPos);
        qTalon.Next;
      end;

      dT_ora := dT_ora+(Time-t1);
      t1 := Time;

      List.Range('D5:D12') := Range;
      List.Range('H5:H'+IntToStr(CurPos+3)) := Range_tal;
    except
    end;

    //**************************************************************************
    Progress.AddProgress(15);
    {$IFDEF OILPOST}
    ApplicationInfo.ClientInfo := GetClientInfo(ApplicationInfo.ClientInfo,Progress.Progress);
    {$ENDIF}

    { Cмарт-карты ANP }
    //**************************************************************************
    dT_xl := dT_xl+(Time-t1);
    t1 := Time;
    try
      if Self.DateBegin < StrToDate('01.08.2009')then
      begin
        qCard := DbPlan.qSvodFilAZSCard;
        if qCard.Active then qCard.Close;
        qCard.MacroByName('npg_id').Value := NpList;
        qCard.MacroByName('np1').Value := slNpgList[0];
        qCard.MacroByName('np2').Value := slNpgList[1];
        qCard.MacroByName('np3').Value := slNpgList[2];
        qCard.MacroByName('np4').Value := slNpgList[3];
        if slNpgList.Count > 4 then
        begin
          qCard.MacroByName('np5').Value := slNpgList[4];
          qCard.MacroByName('np6').Value := slNpgList[5];
        end
        else
        begin
          qCard.MacroByName('np5').Value := '0';
          qCard.MacroByName('np6').Value := '0';
        end;
        start := Time;
        _OpenQueryPar(TOraQuery(qCard),
          ['BeginDate', Self.DateBegin,
           'EndDate',   Self.DateEnd,
           'obl_id',    Self.DepId]);
        log(REPORTLOGFILE,TranslateText('* - Запрос по смарт-картам открылся за ')+IntToStr(trunc((Time-start)*24*3600))+TranslateText(' сек.'));
        qCard.Filtered := False;
        qCard.First;
      end;
    except on E: Exception do
      begin
        MessageDlg(TranslateText('Ошибка при открытии запроса по карточкам!!!') +#10#13+ E.Message, mtError, [mbOk], 0);
        exit;
      end;
    end;


    CurPos := 1;
    if Assigned(qCard) then
    try
      List := IWorkbook.Worksheets.Item['Cмарт-карты ANP'] as Excel8TLB._Worksheet;
      Range_card := VarArrayCreate([1, qCard.RecordCount, 1, 1], varVariant);
      while not qCard.Eof do
      begin
        Range_card[CurPos,1] := MRound(qCard.FieldByName('sum_litr').AsFloat, 3);
        inc(CurPos);
        qCard.Next;
      end;
      dT_ora := dT_ora+(Time-t1);
      t1 := Time;
      List.Range['H4:H'+IntToStr(CurPos+2)] := Range_card;
    except
    end;
    //**************************************************************************
    Progress.Progress := 100;
    {$IFDEF OILPOST}
    ApplicationInfo.ClientInfo := GetClientInfo(ApplicationInfo.ClientInfo,Progress.Progress);
    {$ENDIF}
    dT_xl := dT_xl+(Time-t1);
    dT_total := Time-t2;
    //ShowMessage('dT_ora = '+TimeToStr(dT_ora)+#13#10+'dT_xl = '+TimeToStr(dT_xl)+#13#10+'dT_total = '+TimeToStr(dT_total));
    log(REPORTLOGFILE,TranslateText('* + Работа запросов ')+TimeToStr(dT_ora));
    log(REPORTLOGFILE,TranslateText('* + Вывод в Excel ')+TimeToStr(dT_xl));
    //**************************************************************************
    // муть для переносу залишків [л][кг] на наступний місяць
    //**************************************************************************


    t1 := Time;
    IXLSApp.Calculation[0] := xlAutomatic;
    slNPG_id.Delimiter := ',';
    slAZS_id.Delimiter := ',';

    { Еж.нпр -> СводнаяТаблица }

    List := IWorkbook.Worksheets.Item['Еж.нпр'] as Excel8TLB._Worksheet;
    for i:= 2 to 3 do
    begin
      try
        if not PivotTableExists(List,'СводнаяТаблица'+IntToStr(i)) then
          Continue;
        List.PivotTables('СводнаяТаблица'+IntToStr(i)).PivotCache.Refresh;
        PivotFields := List.PivotTables('СводнаяТаблица'+IntToStr(i)).PivotFields('АЗС');
        if PivotItemExists(PivotFields, 'АЗС№ ') then
          PivotFields.PivotItems('АЗС№ ').Visible := False;
        if PivotItemExists(PivotFields, '0') then
          PivotFields.PivotItems('0').Visible := False;
        if PivotItemExists(PivotFields, '(пусто)') then
          PivotFields.PivotItems('(пусто)').Visible := False;
      except
      end;
    end;
    log(REPORTLOGFILE,TranslateText('* + Обновление сводной таблицы ')+TimeToStr(Time-t1));

    { Cохранение OIL_RESTS_AVIAS }

    if (Self.DateBegin = StartOfTheMonth(Self.DateBegin)) and (Self.DateEnd = trunc(EndOfTheMonth(Self.DateEnd)))
      {$IFDEF OIL}and (LAUNCH_MODE <> 'GREAT_OIL') {$ENDIF}
    then
      begin
        t1 := Time;
        List := IWorkbook.Worksheets.Item['АЗС нпр'] as Excel8TLB._Worksheet;
        {$IFDEF OILPOST}
        GetSystemDate{$IFDEF OILPOST}(vSession){$ENDIF};
        vSession.ExecSQLEx('update oil_rests_avias set state=''N'' '+
                  'where state = ''Y'' '+
                    'and azs_id in (' + slAZS_id.DelimitedText +')'+
                    'and np_group_id in (' + slNPG_id.DelimitedText +')'+
                    'and date_=''' + DateToStr(Self.DateEnd + 1) +''''+
                    'and inst = '+IntToStr(INST)+
                    'and nvl(manual,''N'') = ''N'' ',[]);
        DBS := TDbStructure.Create(vSession);
        DBSaver := TDbSaver.Create(vSession, DBS);
        {$ENDIF}
        {$IFDEF OIL}
        try
          _ExecSQL('update oil_rests_avias set state=''N'' '+
                  'where state = ''Y'' '+
                    'and azs_id in (' + slAZS_id.DelimitedText +')'+
                    'and np_group_id in (' + slNPG_id.DelimitedText +')'+
                    'and date_=''' + DateToStr(Self.DateEnd + 1) +''''+
                    'and inst = '+IntToStr(INST)+
                    'and nvl(manual,''N'') = ''N'' ');
        except

        end;
        {$ENDIF}
        try
          for i:=0 to slAZS_id.Count-1 do
            for j:=0 to slNPG_id.Count-1 do
              begin

                if slNPG_id.Count > 4 then
                begin
                  curLitr := List.Cells[6514 + i*slNpgList.Count + j,'CI'];
                  curKg := List.Cells[6514 + i*slNpgList.Count + j,'CJ'];
                end
                else
                begin
                  curLitr := List.Cells[4344 + i*slNpgList.Count + j,'CI'];
                  curKg := List.Cells[4344 + i*slNpgList.Count + j,'CJ'];
                end;
                tmpDate := Self.DateEnd+1;
                vSession.ExecSQLEx('begin select count(*) into :Result from OIL_RESTS_AVIAS '+
                ' where state = ''Y'' and azs_id = :azs_id and azs_inst = :azs_inst and np_group_id = :np_group_id and inst = :inst and date_ = :date_; end;',
                  ['azs_id', slAZS_id[i],
                   'azs_inst', slAZS_id[i],
                   'np_group_id', slNPG_id[j],
                   'inst', INST,
                   'date_', tmpDate]);
                if vSession.ParamByName('Result').AsInteger = 0 then
                begin
                  DBSaver.SaveRecord('OIL_RESTS_AVIAS',
                           ['id',             GetSeqNextVal('S_OIL_RESTS_AVIAS', False{$IFDEF OILPOST}, vSession{$ENDIF}),
                            'inst',           INST,
                            'state',          'Y',
                            'date_',          Self.DateEnd+1,
                            'azs_id',         StrToInt(slAZS_id[i]),
                            'azs_inst',       StrToInt(slAZS_id[i]),
                            'np_group_id',    StrToInt(slNPG_id[j]),
                            'rest_litr',      MRound(curLitr,3),
                            'rest_kg',        MRound(curKg,3),
                            'rep_build_date', GetSystemDate{$IFDEF OILPOST}(vSession){$ENDIF}
                            ]);
                end;
              end;
        except
          on E:Exception do
          begin
            log(REPORTLOGFILE,TranslateText('* + Запись остатков на конец в таблицу прошна неудачно ')+#10#13+e.Message);
            raise Exception.Create('Запись остатков на конец в таблицу прошна неудачно '+#10#13+e.Message);
          end;
        end;
        log(REPORTLOGFILE,TranslateText('* + Запись остатков на конец в таблицу ')+TimeToStr(Time-t1));
      end;

    //**************************************************************************
    log(REPORTLOGFILE,TranslateText('* + Построение отчета закончено в '+DateToStr(Date)+' '+TimeToStr(Time)));
  finally
    try
      slNpgList.Free;
      slDepList.Free;
      slNPG_id.Free;
      slAZS_id.Free;
      if qPrice.Active then qPrice.Close;
      if qAZS.Active then qAZS.Close;
      if qAZSnpr_rest.Active then qAZSnpr_rest.Close;
      if qAZSnpr_prih.Active then qAZSnpr_prih.Close;
      if qAZSnpr_real.Active then qAZSnpr_real.Close;
      if Assigned(qTalon) then if qTalon.Active then qTalon.Close;
      if Assigned(qCard) then if qCard.Active then qCard.Close;
    except
    end;
  end;
end;
{$IFDEF OIL}
{ TReportBasicElectonFormCustom }

procedure TReportBasicElectonFormCustom.ExecuteQuery;
  procedure SetParams(AQuery: TOraQuery);
  var
    i: integer;
  begin
    for i := 0 to AQuery.MacroCount - 1 do
      AQuery.Macros[i].Value := '0';
    AQuery.MacroByName('npg_id').Value := NpList;
    AQuery.MacroByName('azs_list').Value := AZSList;
    AQuery.ParamByName('BeginDate').AsDateTime := DateBegin;
    AQuery.ParamByName('EndDate').AsDateTime := DateEnd;
    if AQuery.Params.FindParam('obl_id') <> nil then
      AQuery.ParamByName('obl_id').AsInteger := DepId;
    AQuery.FetchAll := True;
  end;
begin
  try
    FPrihodQuery := DbPlan.qSvodFilAZS_Prihod;
    if FPrihodQuery.Active then FPrihodQuery.Close;
    start := Time;
    SetParams(FPrihodQuery);
    _OpenQuery(TOilQuery(FPrihodQuery));
    log(REPORTLOGFILE,TranslateText('* - Запрос по приходам НП открылся за ')+IntToStr(trunc((Time-start)*24*3600))+TranslateText(' сек.'));
  except on E: Exception do
    raise Exception.Create(TranslateText('Ошибка при открытии запроса по приходам для "АЗС нпр"!!!') +#10#13+ E.Message);
  end;
  Progress.Progress := 10;

  try
    FRashodQuery := DbPlan.qSvodFilAZSCustom_Realiz;
    if FRashodQuery.Active then FRashodQuery.Close;
    start := Time;
    SetParams(FRashodQuery);
    _OpenQuery(TOilQuery(FRashodQuery));
    log(REPORTLOGFILE,TranslateText('* - Запрос по реализации открылся за ')+IntToStr(trunc((Time-start)*24*3600))+TranslateText(' сек.'));
  except on E: Exception do
    raise Exception.Create(TranslateText('Ошибка при открытии запроса по реализации для "АЗС нпр"!!!') +#10#13+ E.Message);
  end;
  Progress.Progress := 20;
  //
  Progress.MaxValue := FRashodQuery.RecordCount + FPrihodQuery.RecordCount + trunc((FRashodQuery.RecordCount + FPrihodQuery.RecordCount)/100*20);
  Progress.Progress := trunc((FRashodQuery.RecordCount + FPrihodQuery.RecordCount)/100*20);
end;

procedure TReportBasicElectonFormCustom.FillSheet;
var
  HorPos, VerPos: integer;
  LockedColumns: TStringList;
begin
  LockedColumns := TStringList.Create;
  LockedColumns.Sorted := True;
  if FileExists(GetMainDir+'LockedColumnsBef.cfg') then
    LockedColumns.LoadFromFile(GetMainDir+'LockedColumnsBef.cfg');
  try
    {Вывод приходов}
    FPrihodQuery.First;
    while not FPrihodQuery.Eof do
    begin
      Progress.AddProgress(1);    
      if FPrihodQuery.FieldByName('from_id').AsString = '' then
      begin
        FPrihodQuery.Next;
        Continue;
      end;
      try
        HorPos := FParseExcel.FindPosition(peoHorizontal,
         [FPrihodQuery.FieldByName('from_id').AsString]);
        VerPos := FParseExcel.FindPosition(peoVertical,
         [FPrihodQuery.FieldByName('date_').AsDateTime,
          FPrihodQuery.FieldByName('azs_id').AsString,
          FPrihodQuery.FieldByName('np_groupid').AsString]);
      except on E: ENoDataFound do
        begin
          log(REPORTLOGFILE,TranslateText('  - ошибка определения позиции ') + e.Message);
          FPrihodQuery.Next;
          Continue;
        end;
      end;
      List.Cells[VerPos, HorPos] := FPrihodQuery.FieldByName('prih_litr').AsCurrency;
      List.Cells[VerPos, HorPos+1] := FPrihodQuery.FieldByName('prih_kg').AsCurrency;
      FPrihodQuery.Next;
    end;
    {Вывод реализации}
    FRashodQuery.First;
    while not FRashodQuery.Eof do
    begin
      Progress.AddProgress(1);
      HorPos := -1;
      VerPos := -1;
      try
        try
          HorPos := FParseExcel.FindPosition(peoHorizontal,
           [FRashodQuery.FieldByName('oper_id').AsString]);
          VerPos := FParseExcel.FindPosition(peoVertical,
           [FRashodQuery.FieldByName('date_').AsDateTime,
            FRashodQuery.FieldByName('azs_id').AsString,
            FRashodQuery.FieldByName('np_groupid').AsString]);
        except on E: ENoDataFound do
          begin
            log(REPORTLOGFILE,TranslateText('  - ошибка определения позиции ') + e.Message);
            FRashodQuery.Next;
            Continue;
          end;
        end;
        List.Cells[VerPos, HorPos] := FRashodQuery.FieldByName('out_litr').AsCurrency;

        // Переходим на КГ
        inc(HorPos);
        if LockedColumns.IndexOf(IntToStr(HorPos)) = -1 then
        try
          List.Cells[VerPos, HorPos] := FRashodQuery.FieldByName('out_count').AsCurrency;
        except
          on E: EOleException do
            LockedColumns.Add(IntToStr(HorPos));
          else
            raise;
          // Просто глушим
        end;
        // Переходим на ГРН
        inc(HorPos, 1+IfThen(FRashodQuery.FieldByName('oper_id').AsInteger = 12, 2, 0));
        if LockedColumns.IndexOf(IntToStr(HorPos)) = -1 then
        try
          List.Cells[VerPos, HorPos] := FRashodQuery.FieldByName('out_money').AsCurrency;
        except
          on E: EOleException do
            LockedColumns.Add(IntToStr(HorPos));
          else
            raise;
        end;
        FRashodQuery.Next;
      except on E:Exception do
        raise Exception.CreateFmt('Ошибка при выводе реализации в ячейку %s%d'+#10#13
         +'по операции %s (%d), %s числа, по %s, нефтепродукта %s (%d).'+#10#13
         +'Текст ошибки: '+#10#13
         +e.Message,
         [ExcelNumberToColumn(HorPos), VerPos,
          GetOperationName(FRashodQuery.FieldByName('oper_id').AsInteger),FRashodQuery.FieldByName('oper_id').AsInteger,
          FRashodQuery.FieldByName('date_').AsString,
          GetOrgName(FRashodQuery.FieldByName('azs_id').AsInteger, FRashodQuery.FieldByName('azs_id').AsInteger) ,
          GetNpGName(FRashodQuery.FieldByName('np_groupid').AsInteger), FRashodQuery.FieldByName('np_groupid').AsInteger]);
      end;
    end;
  finally
    LockedColumns.SaveToFile(GetMainDir+'LockedColumnsBef.cfg');
    LockedColumns.Free;
  end;
end;

procedure TReportBasicElectonFormCustom.GetReport;
begin
  {Запуск всех запросов}
  ExecuteQuery;
  {Вывод в Excel}
  StateExcel(XLApplication, False);
  FillSheet;
  StateExcel(XLApplication, True);
end;
{$ENDIF}


end.
