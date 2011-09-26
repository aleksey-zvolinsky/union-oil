unit SRTalon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, StdCtrls, Grids, DBGrids, RXDBCtrl, Buttons, ExtCtrls, Ora,
  DBCtrls, Mask, ToolEdit, RxDBComb, RxLookup, MemTable, uCommonForm, uOilQuery,
  uOilStoredProc, MemDS, DBAccess, DBGridEh{$IFDEF VER150},Variants,
  ActnList, GridsEh{$ENDIF};

type
  TSRTalonForm = class(TCommonForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbClose: TBitBtn;
    dbgTalon: TDBGridEh;
    Table1: TTable;
    Table1Litr: TFloatField;
    Table1Count: TFloatField;
    ds: TDataSource;
    qPriv: TQuery;
    Table1Ser: TStringField;
    Table1CountT: TFloatField;
    sbDel: TSpeedButton;
    Edit6: TEdit;
    Label7: TLabel;
    dsTalonDetail: TOraDataSource;
    Table1Price: TFloatField;
    qTalonDetail: TOilQuery;
    qCheckUp: TOilQuery;
    qCheckDown: TOilQuery;
    qSubPart: TQuery;
    dsSubPart: TDataSource;
    qSubPartLitr: TFloatField;
    qSubPartNal: TFloatField;
    qSubPartVed: TFloatField;
    qSubPartSN: TFloatField;
    qSubPartOther: TFloatField;
    qSubPartNPType_Name: TStringField;
    qSubPartUd_weig: TFloatField;
    qSubPartBeginRest: TFloatField;
    Table1Nominal: TFloatField;
    Import: TBitBtn;
      Export: TBitBtn;
    Table1Num: TIntegerField;
    Table1Employ_Id: TIntegerField;
    Table1Employ_Inst: TIntegerField;
    Table1SubPart: TIntegerField;
    Table1Auto_Id: TIntegerField;
    Table1Auto_Inst: TIntegerField;
    Table1NPGrp_Id: TIntegerField;
    Table1Ttn_Id: TIntegerField;
    Table1Ttn_Inst: TIntegerField;
    qSubPartTTN_Id: TIntegerField;
    qSubPartTTN_Inst: TIntegerField;
    qSubPartSubPartName: TStringField;
    p1: TPanel;
    GroupBox3: TGroupBox;
    DBText4: TDBText;
    DBGrid3: TDBGridEh;
    DBText5: TDBText;
    v: TGroupBox;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lOut: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    dbtNPType: TDBText;
    dbtUd_weig: TDBText;
    lEndRest: TLabel;
    dbtBeginRest: TDBText;
    leSubPart: TRxLookupEdit;
    sp: TSplitter;
    SD: TSaveDialog;
    qNPGroup: TOilQuery;
    Table1NPGrpName: TStringField;
    eCodeTalon: TEdit;
    Table1InTheWay: TIntegerField;
    Table1bInTheWay: TBooleanField;
    gbFilterTest: TGroupBox;
    cbFilterNP: TComboBox;
    lNP: TLabel;
    ActionList: TActionList;
    ActNP1: TAction;
    ActNP5: TAction;
    ActNP6: TAction;
    ActNP2: TAction;
    ActNP3: TAction;
    ActNP0: TAction;
    ActNP4: TAction;
    l1: TLabel;
    pDep: TPanel;
    Label16: TLabel;
    ceDep: TComboEdit;
    procedure FormShow(Sender: TObject);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure bbOkClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Table1CalcFields(DataSet: TDataSet);
    procedure dbgTalonExit(Sender: TObject);
    procedure Table1NumValidate(Sender: TField);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure leSubPartCloseUp(Sender: TObject);
    procedure qSubPartCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ExportClick(Sender: TObject);
    procedure ImportClick(Sender: TObject);
    procedure RunProcessBarCode(AInstr: string; InTheWay: integer=2);
    procedure TestTalonInTheWay(); // перевіряємо виведення усіх талонів по фільтру із шляху
    procedure dsTalonDetailDataChange(Sender: TObject; Field: TField);
    procedure dbtNPTypeMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure eCodeTalonKeyPress(Sender: TObject; var Key: Char);
    procedure ActNP1Execute(Sender: TObject);
    procedure cbFilterNPChange(Sender: TObject);
    procedure dbgTalonGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ceDepButtonClick(Sender: TObject);
  private
    InStr, ChStr: string;
    bActColor: boolean;
    procedure log(AText: string);
    function KeyPressCode(ASender: TObject; AQuery: TOilQuery; Key: Char;
      var TalonCode: string): boolean;
  public
    TalonDepID, TalonDepINST: integer; // кому приходують талони
    IsTest, UnTestPovt: boolean;
    // дані про змінний звіт
    MId, MInst, MAzs_Id, MAzs_Inst: Integer;
    MDateTime: TDateTime;
    MNum: string;
    // дані про підпартію
    NP_Grp, TTN_Id, TTN_Inst, Old_TTN_Id, Old_TTN_Inst: Integer;

    Ud_Weig, Price: real;
    PR_Date: TDate;
    function TestTalon(ASer: string; ANum: integer): integer;
  end;

implementation

uses
  OilStd, Main, AutoRef, EmpRef, SRep, TalonOutData, uExeSql, ExFunc, UDbFunc,
  TalonOpenCode, ChooseOrg;

{$R *.DFM}

//==============================================================================
procedure TSRTalonForm.FormShow(Sender: TObject);
begin
  try
    Table1CountT.DisplayFormat := DR_FORMAT;
         
    UnTestPovt := false;

    if IsTest then
    begin
      dbgTalon.ReadOnly := true;
      Table1.Open;
      v.Visible := false;
      pDep.Visible := false;
      ceDep.Enabled := false;
      sbDel.Enabled := false;
      Import.Enabled := false;
      gbFilterTest.Visible := true;
      exit;
    end;

    Table1.Open;
    if NP_Grp in [NP_A76, NP_A80] then
      qSubPart.SQL[11] := ' where NP_Grp in ('+ IntToStr(NP_A76) +', '+ IntToStr(NP_A80) +')';

    if NP_Grp in [NP_A92, NP_A93] then
      qSubPart.SQL[11] := ' where NP_Grp in ('+ IntToStr(NP_A92) +', '+ IntToStr(NP_A93) +')';

    if not (NP_Grp in [NP_A76, NP_A80, NP_A92, NP_A93]) then
      qSubPart.SQL[11] := ' where NP_Grp = '+ IntToStr(NP_Grp);

    qSubPart.Open;
    while (not (qSubPart.Eof)) and
      (not ((qSubPart.FieldByName('TTN_Id').AsInteger = TTN_Id) and (qSubPart.FieldByName('TTN_Inst').AsInteger = TTN_Inst))) do
      qSubPart.Next;

    // підтягуємо організацію, якій приходувалися талони
    ceDep.Text := GetOrgName(TalonDepID, TalonDepINST);
  finally
    qTalonDetail.Open;
    InStr := '';
    ChStr := '';
    Table1AfterPost(nil);
    TestTalonInTheWay();
  end;
end;
//==============================================================================
procedure TSRTalonForm.Table1BeforePost(DataSet: TDataSet);
begin
  try
    TalonExceptionHandler(TestTalon(Table1Ser.AsString, Table1Num.AsInteger),
      Table1Ser.AsString, Table1Num.AsInteger, toSrPrihod, teoExcept);
  except on E: Exception do
    begin
      Table1.Cancel;
      raise Exception.Create(E.Message);
    end;
  end;
end;
//==============================================================================
function TSRTalonForm.TestTalon(ASer: string; ANum: integer): integer;
var
  Talon: TTalon;
begin
  log('Вход в ProvSrTalon');
  Result := 0;
  try
    if ASer <> '' then
    begin
      log('Проверка - Серия талона содержит ошибочные символы !');
      try
        Talon := TTalon.Create(ASer, ANum);
      except
        Result := 1; // Серия талона содержит ошибочные символы !;
        exit;
      end;

      try
        log('Присваиваем Ser,Num');
        Table1Ser.AsString := AnsiUpperCase(Talon.Ser);
        Table1Num.AsInteger := Talon.Num;
        log('Проверка - не обнаружен в эмиссии !');
        qTalonDetail.Close;
        qTalonDetail.Open;
        if qTalonDetail.IsEmpty then
        begin
          Result := 2; // не обнаружен в эмиссии !;
          exit;
        end;
        qTalonDetail.Last;

        log('Проверка - Серия и Номер талона повторяется!');
        qPriv.Close;
        qPriv.SQL.Text :=
          'select count(*) from Oil_SRTalonT.db where Ser = "'+ Talon.Ser +'" and Num = '+ IntToStr(Talon.Num);
        qPriv.Open;

        if ((qPriv.Fields[0].AsInteger > 0) and (UnTestPovt = false))
          or ((qPriv.Fields[0].AsInteger > 1) and (UnTestPovt = true)) then
        begin
          Result := 3; // талон повторяется!;
          exit;
        end;

        log('Проверка - оприходован позже');
        qCheckUp.Close;
        qCheckUp.ParamByName('Ser').AsString := Talon.Ser;
        qCheckUp.ParamByName('Num').AsInteger := Talon.Num;
        qCheckUp.ParamByName('Inst').AsInteger := Inst;
        qCheckUp.ParamByName('Date_').AsDate := pr_Date;
        qCheckUp.Open;
        if qCheckUp.Fields[1].AsInteger = 1 then
        begin
          Result := 4; // оприходован позже;
          exit;
        end;

        log('Проверка - уже оприходован');
        qCheckDown.Close;
        qCheckDown.ParamByName('MainId').AsInteger := MId;
        qCheckDown.ParamByName('MainInst').AsInteger := MInst;
        qCheckDown.ParamByName('Ser').AsString := Talon.Ser;
        qCheckDown.ParamByName('Num').AsInteger := Talon.Num;
        qCheckDown.ParamByName('Inst').AsInteger := Inst;
        qCheckDown.ParamByName('Date_').AsDate := pr_Date;
        qCheckDown.Open;
        if qCheckDown.Fields[1].AsInteger = 1 then
        begin
          Result := 5; // уже оприходован;
          exit;
        end;

        log('Присваиваем NPGrp_Id,Litr');
        Table1NPGrp_Id.Value := Talon.NpGroup;
        Table1.FieldByName('Litr').AsFloat := Talon.Nominal;
        log('Проверка - Талон перерасходован,недорасходован');

        qPriv.Close;
        qPriv.SQL.Text := 'select sum(Litr) from Oil_SRTalon.DB ' +
          'where ser = '''+ Talon.Ser +''' and num = '+ IntToStr(Talon.Num) +
          ' and not(TTN_Id = '+ IntToStr(Old_TTN_ID) +' and TTN_Inst = '+ IntToStr(Old_TTN_Inst) +')';
        qPriv.Open;
        if (qPriv.Fields[0].AsFloat + Talon.Nominal) > qTalonDetail.FieldByName('Nominal').AsFloat then
        begin
          Result := 6; // Талон перерасходован;
          exit;
        end;

        if (qPriv.Fields[0].AsFloat + Talon.Nominal) < qTalonDetail.FieldByName('Nominal').AsFloat then
        begin
          Result := 7; // Талон недорасходован;
          exit;
        end;

        log('Проверка - Тип нефтепродукта партии и талона не совпадает!');
        if Talon.NpGroup <> NP_GRP then
          if not (((Talon.NpGroup = NP_A76) and (NP_GRP = NP_A80))
            or ((Talon.NpGroup = NP_A80) and (NP_GRP = NP_A76))
            or ((Talon.NpGroup = NP_A92) and (NP_GRP = NP_A93))
            or ((Talon.NpGroup = NP_A93) and (NP_GRP = NP_A92))) then
          begin
            Result := 8; // Тип нефтепродукта партии и талона не совпадает!;
            exit;
          end;
      finally
        Talon.Free;
      end;
    end
    else
    begin
      log('Присваиваем NPGrp_Id,Litr');
      Table1NPGrp_Id.Value := NP_Grp;
      Table1.FieldByName('Litr').AsFloat := MRound(Table1.FieldByName('Litr').AsFloat, 3);
      if Table1Litr.IsNull then
        Table1Litr.AsInteger := 0;
    end;

    log('Присваиваем Price,CountT,TTN_Id,TTN_Inst');
    Table1.FieldByName('Price').AsFloat := Price;
    Table1.FieldByName('CountT').AsFloat := MRound(Table1.FieldByName('Litr').AsFloat * Ud_Weig / 1000, DR_ROUND_COUNT);
    Table1.FieldByName('TTN_Id').AsFloat := TTN_ID;
    Table1.FieldByName('TTN_Inst').AsFloat := TTN_Inst;
  except on E: Exception do
    begin
      Table1.Cancel;
      Result := 9;
      log('Выход из ProvSrTalon');
      raise Exception.Create(E.Message);
    end;
  end;
  log('Выход из ProvSrTalon');
end;
//==============================================================================
procedure TSRTalonForm.bbOkClick(Sender: TObject);
begin
  if Table1.State <> dsBrowse then Table1.Post;
  if IsTest then
  begin
    try
      StartSqlOra;

      qPriv.Close;
      qPriv.SQL.Text := 'select * from Oil_SRTalonT.DB where Ser is not null';
      qPriv.Open;
      while not qPriv.Eof do
      begin
        if qPriv.FieldByName('InTheWay').AsInteger = 5 then
          _ExecSql(
            'update oil_srtalon t set InTheWay = 5' +
            ' where state = ''Y'' and ser is not null' +
            '   and ser = :SER and num = :NUM' +
            '   and (srep_id, srep_inst) in' +
            '       (select Id, Inst from Oil_DR_Data where rep_id = :REP_ID and rep_inst = :REP_INST)',
            ['REP_ID',   MId,
             'REP_INST', MInst,
             'SER',      qPriv.FieldByName('SER').AsString,
             'NUM',      qPriv.FieldByName('NUM').AsInteger]
          );
        qPriv.Next;
      end;
      CommitSqlOra;
      Modalresult := MrOk;
    except
      RollbackSqlOra;
      raise;
    end;
  end
  else
    if StrToFloat(lEndRest.Caption) >= 0 then Modalresult := MrOk;
end;
//==============================================================================
procedure TSRTalonForm.sbDelClick(Sender: TObject);
begin
  if not (Table1.IsEmpty) then Table1.Delete;
end;
//==============================================================================
procedure TSRTalonForm.Edit6KeyPress(Sender: TObject; var Key: Char);
var
  SER, TalonCode: string;
  NUM: integer;
  BM: TBookMark;
begin
  if not KeyPressCode(Sender, TOilQuery(Table1), Key, TalonCode) then
    exit;
  // запам"ятовуємо позицію у табличці
  BM := Table1.GetBookmark;
  dbgTalon.DataSource.DataSet.DisableControls;
  try
    // узнаємо серію і номер талону
    try
      SER := Copy(AnsiUpperCase(TalonCode), 5, 3);
      NUM := StrToInt(Copy(AnsiUpperCase(TalonCode), 8, 9));
      // заміняємо російський символ у серії на латинський
      if SER[1] = 'Ф' then SER[1] := 'A';
      if SER[1] = 'И' then SER[1] := 'B';
      if SER[1] = 'С' then SER[1] := 'C';
      if SER[1] = 'В' then SER[1] := 'D';
      if SER[1] = 'У' then SER[1] := 'E';
      if SER[1] = 'А' then SER[1] := 'F';
    except
      TalonExceptionHandler(1, SER, NUM, toSrPrihod, teoExcept); // Серия талона содержит ошибочные символы !;
    end;
    // знаходимо талон у файлі
    qPriv.Close;
    qPriv.SQL.Text := 'select count(*) from Oil_SRTalonT.DB where InTheWay = 4 and Ser = "'+ SER +'" and Num = '+ IntToStr(NUM);
    qPriv.Open;
    // перевірка талона на існування його в шляху, якщо це форма виведення талонів із шляху
    if (qPriv.Fields[0].AsInteger = 0) and (isTest = true) then
      TalonExceptionHandler(10, SER, NUM, toSrPrihod, teoExcept);

    if qPriv.Fields[0].AsInteger = 1 then
    begin
      // виводимо із шляху даний талон
      qPriv.Close;
      qPriv.SQL.Text := 'update Oil_SRTalonT.DB set InTheWay = 5 where Ser = "'+ SER +'" and Num = '+ IntToStr(NUM);
      qPriv.ExecSQL;
    end
    else RunProcessBarCode(TalonCode); // сканування
    // стаємо на позицію де стояли
    Table1.Close;
    Table1.Open;

    TestTalonInTheWay(); // перевіряємо виведення усіх талонів по фільтру із шляху

    if BM <> nil then
      if Table1.BookmarkValid(BM) then Table1.GotoBookmark(BM)
      else Table1.Last;
    Table1.FreeBookmark(BM);
  finally
    dbgTalon.DataSource.DataSet.EnableControls;
  end;
end;
//==============================================================================
procedure TSRTalonForm.Table1CalcFields(DataSet: TDataSet);
begin
  Table1.FieldByName('Count').AsFloat := Table1.FieldByName('Price').AsFloat * Table1.FieldByName('Litr').AsInteger;
  Table1.FieldByName('nominal').AsFloat := Table1.FieldByName('Litr').AsInteger;
  Table1.FieldByName('bInTheWay').AsBoolean := Table1.FieldByName('InTheWay').AsInteger = 4;
end;
//==============================================================================
procedure TSRTalonForm.dbgTalonExit(Sender: TObject);
begin
  if Table1.State <> dsBrowse then Table1.Post;
end;
//==============================================================================
procedure TSRTalonForm.Table1NumValidate(Sender: TField);
begin
  if Sender.AsInteger <> 0 then Table1.FieldByName('Litr').Clear;
end;
//==============================================================================
procedure TSRTalonForm.Table1AfterPost(DataSet: TDataSet);
begin
  // якщо це не форма виведення талонів із шляху
  if IsTest then exit;

  qPriv.Close;
  qPriv.SQL.Text := 'select sum(Litr), sum(Price * Litr) as sm from Oil_SRTalonT.DB';
  qPriv.Open;

  lOut.Caption := FloatToStrF(qPriv.Fields[0].AsFloat, ffFixed, 15, 3);
  lEndRest.Caption := FloatToStrF(qSubPart.FieldByName('BeginRest').AsFloat - qPriv.Fields[0].AsFloat, ffFixed, 15, 3);
  if StrToFloat(lEndRest.Caption) < 0 then lEndRest.Font.Color := clRed
  else lEndRest.Font.Color := clBlue;

  if not DR_AUTOLOAD then
    if StrToFloat(lEndRest.Caption) < 0 then
      ShowMessage(TranslateText('Перерасход по подпартии!'));
end;
//==============================================================================
procedure TSRTalonForm.leSubPartCloseUp(Sender: TObject);
begin
  Price := GetSQLValue('select Round((p.SS * r.Ud_Weig)/1000, 2) from Oil_Part p, Oil_Rashod r ' +
    'where p.Id = r.Part_Id and p.Inst = r.Part_Inst ' +
    ' and r.Id = '+ qSubPart.FieldByName('TTN_Id').AsString +
    ' and r.Inst = '+ qSubPart.FieldByName('TTN_Inst').AsString);
  Ud_Weig := qSubPart.FieldByName('Ud_Weig').AsFloat;

  Table1.DisableControls;
  qTalonDetail.DisableControls;
  UnTestPovt := true;
  try
    Table1.First;
    while not (Table1.Eof) do
    begin
      Table1.Edit;
      Table1.FieldByName('Ser').AsString := Table1.FieldByName('Ser').AsString;
      Table1.Post;
      Table1.Next;
    end;
    Table1.EnableControls;
    qTalonDetail.EnableControls;
  except on E: Exception do
    begin
      Table1.EnableControls;
      qTalonDetail.EnableControls;
      raise Exception.Create(E.Message);
    end;
  end;
  UnTestPovt := false;
  TTN_Id := qSubPart.FieldByName('TTN_Id').AsInteger;
  TTN_Inst := qSubPart.FieldByName('TTN_Inst').AsInteger;
end;
//==============================================================================
procedure TSRTalonForm.qSubPartCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('BeginRest').AsFloat := DataSet.FieldByName('Litr').AsFloat - DataSet.FieldByName('Nal').AsFloat - DataSet.FieldByName('Ved').AsFloat - DataSet.FieldByName('SN').AsFloat - DataSet.FieldByName('Other').AsFloat;
end;
//==============================================================================
procedure TSRTalonForm.FormCreate(Sender: TObject);
begin
  inherited;
  eCodeTalon.Visible := Debugging;
  IsTest := false;
  Table1.DatabaseName := DB_DIR;
  qPriv.DatabaseName := DB_DIR;
  qSubPart.DatabaseName := DB_DIR;
  LoadSQLByForm(TForm(Self));
end;
//==============================================================================
procedure TSRTalonForm.ExportClick(Sender: TObject);
var
  Save, FileName, track: string; // путь к файлу и его имя, имя файла, путь к нему
  TalonOut: TTalonOutForm;
begin
  if Table1.IsEmpty then exit;

  SD.FileName := IntToStr(MAzs_Id) +'_SRTalon_'+ ReplaceAllSubstr(DateToStr(Trunc(MDateTime)), '.', '_');

  if SD.Execute then
  begin
    try
      TalonOut := TTalonOutForm.Create(Application);
      Table1.DisableControls;
      if not TalonOut.MTCode.Active then TalonOut.MTCode.Open;
      if TalonOut.TalonToCode(TalonOut.MTCode, TOilQuery(Table1)) then
      begin
        // выделение имени и пути из SD.FileName
        Save := SD.FileName;
        Track := ExtractFileDir(SD.FileName);
        FileName := ExtractFileName(SD.FileName);
        // выгружаем таблицу у файл и сохраняем его
        try
          if not TalonOut.error then
          begin
            DataSetToDbf(TalonOut.MTCode, track, FileName, nil, 'FOXPRO');
            ShowMessage(TranslateText('Программа выгрузила штрих-коды талонов в ') + SD.FileName + '. ');
          end;
        except on E: Exception do
          ShowMessage(TranslateText('Программа не может выгрузить штрих-коды талонов! ') + e.message);
        end;
      end;
    finally
      Table1.EnableControls;
      TalonOut.Free;
    end;
  end;
end;
//==============================================================================
procedure TSRTalonForm.ImportClick(Sender: TObject); // не використовуємо
var
  TalonOpenCode: TTalonOpenCodeForm;
  n: integer;
begin
  if not Table1.IsEmpty then
    if MessageDlg(TranslateText('Вы хотите удалить уже записанные талоны и записать новые?'),
      mtConfirmation, [mbNo, mbYes], 0) = mrYes then
    begin
      Table1.Last;
      for n := Table1.RecordCount downto 1 do
        Table1.Delete;
    end
    else exit;
  // загружаємо формочку імпорта талонів
  TalonOpenCode := TTalonOpenCodeForm.Create(tptSRep, Self);
  try
    Table1.DisableControls;
    TalonOpenCode.ShowModal;
  finally
    TalonOpenCode.Free;
    Table1.EnableControls;
  end;
  Table1.Close;
  Table1.Open;
end;
//==============================================================================
procedure TSRTalonForm.log(AText: string);
var
  iHour, iMin, iSec, iMSec: Word;
begin
  if SysParamExists('SCANTALON') then
  begin
    DecodeTime(Now, iHour, iMin, iSec, iMSec);
    exfunc.log('ScanTalon.log', format('%d:%d:%d:%d - %s', [iHour, iMin, iSec, iMSec, AText]));
  end;
end;
//==============================================================================
procedure TSRTalonForm.RunProcessBarCode(AInstr: string; InTheWay: integer=2);
begin
  ProcessBarCode(AInstr, TOilQuery(Table1), toSrPrihod, InTheWay);
end;
//==============================================================================
procedure TSRTalonForm.dsTalonDetailDataChange(Sender: TObject; Field: TField);
begin
  dbgTalon.Columns[0].ReadOnly := (PR_Date < qTalonDetail.Fields[1].AsDateTime);
  dbgTalon.Columns[1].ReadOnly := (PR_Date < qTalonDetail.Fields[1].AsDateTime);
end;
//==============================================================================
procedure TSRTalonForm.dbtNPTypeMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  dbtNPType.Hint := dbtNPType.Field.Value;
end;
//==============================================================================
procedure TSRTalonForm.eCodeTalonKeyPress(Sender: TObject; var Key: Char);
var
  i: integer;
  sChar: char;
begin
  if eCodeTalon.Text = '' then exit;
  if pos(#13, eCodeTalon.Text) = 0 then
    eCodeTalon.Text := eCodeTalon.Text + #13;
  for i := 1 to length(eCodeTalon.Text) do
  begin
    sChar := Char(eCodeTalon.Text[i]);
    Edit6KeyPress(Sender, sChar);
  end;
end;
//==============================================================================
function TSRTalonForm.KeyPressCode(ASender: TObject; AQuery: TOilQuery; Key: Char;
  var TalonCode: string): boolean;
var
  e: TEdit;
begin
  result := false;

  e := TEdit(ASender);
  try
    e.Enabled := false;
    if (Key = #13) and (TOilQuery(Table1).Active) then
    begin
      InStr := AnsiUpperCase(InStr);
      if (ChStr = '') and (DOUBLE_SCAN) then
      begin
        ChStr := InStr;
        InStr := '';
      end
      else
      begin
        if (ChStr <> InStr) and (DOUBLE_SCAN) then
        begin
          MessageDlg(TranslateText('Ошибка штрихкода, сообщите техперсоналу!'), mtError, [], 0);
          ChStr := '';
          InStr := '';
          Abort;
        end;
        TalonCode := InStr;
        result := true;

        ChStr := '';
        InStr := '';
      end
    end
    else InStr := InStr + Key;
  finally
    e.Enabled := true;
    e.SetFocus;
  end;
end;
//==============================================================================
procedure TSRTalonForm.ActNP1Execute(Sender: TObject);
begin
  cbFilterNP.ItemIndex := (Sender as TAction).Tag;
  cbFilterNPChange(nil)
end;
//==============================================================================
procedure TSRTalonForm.cbFilterNPChange(Sender: TObject);
begin
  Table1.Filtered := false;
  Table1.Filter := '';
  case cbFilterNP.ItemIndex of
    1: Table1.Filter := 'SER = ''A00'' OR SER = ''A01'' OR SER = ''A02'' OR SER = ''A03''';
    2: Table1.Filter := 'SER = ''B00'' OR SER = ''B01'' OR SER = ''B02'' OR SER = ''B03''';
    3: Table1.Filter := 'SER = ''C00'' OR SER = ''C01'' OR SER = ''C02'' OR SER = ''C03''';
    4: Table1.Filter := 'SER = ''E00'' OR SER = ''E01'' OR SER = ''E02'' OR SER = ''E03''';
    5: Table1.Filter := 'SER = ''D00'' OR SER = ''D01'' OR SER = ''D02'' OR SER = ''D03''';
    6: Table1.Filter := 'SER = ''F00'' OR SER = ''F01'' OR SER = ''F02'' OR SER = ''F03''';
  end;
  Table1.Filtered := true;

  TestTalonInTheWay(); // перевіряємо виведення усіх талонів по фільтру із шляху
end;
//==============================================================================
procedure TSRTalonForm.TestTalonInTheWay();
begin // перевіряємо виведення усіх талонів по фільтру із шляху
  qPriv.Close;
  qPriv.SQL.Text := 'select count(*) from Oil_SRTalonT.DB where InTheWay = 4';
  if Table1.Filter <> '' then qPriv.SQL.Add(' and ('+ Table1.Filter +')');
  qPriv.Open;
  if qPriv.Fields[0].Value <> 0 then bActColor := false
  else bActColor := true;
end;
//==============================================================================
procedure TSRTalonForm.dbgTalonGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if bActColor and (Column.FieldName = 'bInTheWay') then
    Background := $00BFE0B1;
end;
//==============================================================================
procedure TSRTalonForm.ceDepButtonClick(Sender: TObject);
var
  vType: Integer;
  vName: String;
begin
  if ChooseOrg.CaptureOrgT(1, MAIN_ID, INST, 'yyy', TalonDepID, TalonDepINST, vName, vType) then
  begin
    if not (vType in [3, 4]) then
      raise Exception.Create(TranslateText('Выбран недопустимый тип организации!'));

    if not InstIsPossible(TalonDepINST) then
      raise Exception.Create(TranslateText('Организация "Кому" не имеет права приходовать себе талоны!'));

    ceDep.Text := vName;
  end;
end;
//==============================================================================

end.
