unit Rezerv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, ExtCtrls, Buttons, Db, DBTables, RxLookup,
  CurrEdit, MemTable, Ora, MemDS, DBAccess, uCommonForm, uOilQuery, uOilStoredProc
  {$IFDEF VER150},Variants{$ENDIF};

type
  TRezervForm = class(TCommonForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    cbOrg: TComboEdit;
    Label1: TLabel;
    edName: TEdit;
    Label2: TLabel;
    edType: TEdit;
    Label4: TLabel;
    edNum: TEdit;
    Panel3: TPanel;
    calcCapacity: TRxCalcEdit;
    Label5: TLabel;
    leUb_Kat: TRxLookupEdit;
    qUb_Kat: TOilQuery;
    dsUb_Kat: TOraDataSource;
    qUb_KatID: TFloatField;
    qUb_KatSTATE: TStringField;
    qUb_KatNAME: TStringField;
    Label6: TLabel;
    Label7: TLabel;
    calcDead: TRxCalcEdit;
    Label8: TLabel;
    calcDno_Corr: TRxCalcEdit;
    Panel4: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    cbCondition: TComboBox;
    Label11: TLabel;
    cbNpType: TComboEdit;
    deInspection: TDateEdit;
    Label12: TLabel;
    deCal: TDateEdit;
    Label13: TLabel;
    bbCancel: TBitBtn;
    bbOk: TBitBtn;
    btnCalibr: TBitBtn;
    Panel5: TPanel;
    Label14: TLabel;
    edComments: TEdit;
    rbReal: TRadioButton;
    rbVirtual: TRadioButton;
    Panel6: TPanel;
    deRepair: TDateEdit;
    deColouring: TDateEdit;
    Label15: TLabel;
    Label16: TLabel;
    edRepair: TEdit;
    Label17: TLabel;
    Panel7: TPanel;
    Panel8: TPanel;
    cbDarkLight: TComboBox;
    cbOwnArenda: TComboBox;
    Label18: TLabel;
    Label19: TLabel;
    Panel9: TPanel;
    Label20: TLabel;
    SpeedButton1: TSpeedButton;
    ceElev: TRxLookupEdit;
    qElev: TOilQuery;
    dsElev: TOraDataSource;
    qElevID: TFloatField;
    qElevNAME: TStringField;
    mt: TMemoryTable;
    mtID: TFloatField;
    mtSTATE: TStringField;
    mtNP_TYPE_NAME: TStringField;
    mtNP_TYPE: TFloatField;
    mtDATE_: TStringField;
    mtFIRST_LINE: TStringField;
    qNp: TOilQuery;
    mtArenda: TMemoryTable;
    mtArendaID: TFloatField;
    mtArendaSTATE: TStringField;
    mtArendaORG_ID: TFloatField;
    mtArendaORG_INST: TFloatField;
    mtArendaORG_NAME: TStringField;
    mtArendaDATE_: TDateField;
    mtArendaOPER_TYPE: TFloatField;
    mtArendaOPER_TYPE_NAME: TStringField;
    Label21: TLabel;
    cbArenda: TComboEdit;
    qArenda: TOilQuery;
    deYear: TDateEdit;
    edBrokenState: TEdit;
    gbTubing: TGroupBox;
    Label22: TLabel;
    rbTubSeparate: TRadioButton;
    rbTubCommon: TRadioButton;
    calcTubCapacity: TRxCalcEdit;
    procedure FormCreate(Sender: TObject);
    procedure cbNpTypeButtonClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure cbOrgButtonClick(Sender: TObject);
    procedure TestData;
    procedure Save;
    procedure FillNpType;
    procedure FillArenda;
    procedure FillCbNpType;
    procedure FillCbArenda;
    procedure edYearKeyPress(Sender: TObject; var Key: Char);
    procedure rbVirtualClick(Sender: TObject);
    procedure leUb_KatCloseUp(Sender: TObject);
    procedure btnCalibrClick(Sender: TObject);
    procedure ceElevButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ceElevCloseUp(Sender: TObject);
    procedure mtBeforePost(DataSet: TDataSet);
    procedure mtDATE_Change(Sender: TField);
    procedure mtAfterInsert(DataSet: TDataSet);
    procedure cbArendaButtonClick(Sender: TObject);
    procedure mtArendaAfterInsert(DataSet: TDataSet);
    procedure mtArendaBeforePost(DataSet: TDataSet);
    procedure deYearChange(Sender: TObject);
    procedure qUb_KatAfterOpen(DataSet: TDataSet);
    procedure cbConditionChange(Sender: TObject);
    procedure edBrokenStateEnter(Sender: TObject);
    procedure rbTubingChange(Sender: TObject);
  private
    procedure SetBrokenComments;
  public
    Id, Inst, OrgId, OrgInst, ElevId, ElevInst: integer;
    InsideTransaction, NpTypeChanged, ArendaChanged: Boolean;
  end;

var
  RezervForm: TRezervForm;

function InsertRezervuar(InsideTransaction: Boolean): Boolean;
function EditRezervuar(InsideTransaction: Boolean; q: TOilQuery): Boolean;

implementation

{$R *.DFM}

uses ChooseOrg, NpTypeRef, UDbFunc, Main, OilStd, ExFunc, RezKalibr, RezervNpType,
  uStart, RezervArenda;
//==============================================================================
procedure RLog(s: string);
var
  F: TextFile;
  fname: string;
begin
  if not Debugging then exit;
  fname := 'c:\rezerv.log';
  AssignFile(F, fname);
  if FileExists(fname) then Append(F)
  else Rewrite(F);
  writeln(F, s);
  CloseFile(F);
end;
//==============================================================================
function InsertRezervuar(InsideTransaction: Boolean): Boolean;
var
  F: TRezervForm;
begin
  Application.CreateForm(TRezervForm, F);
  F.cbCondition.ItemIndex := 0;
  F.btnCalibr.Visible := FALSE;
  F.OrgId := MAIN.MAIN_ID;
  F.OrgInst := MAIN.INST;
  F.Id := 0; F.Inst := MAIN.INST;
  F.rbReal.Checked := TRUE;
  F.InsideTransaction := InsideTransaction;
  F.cbOrg.Text := GetOrgName(F.OrgId, F.OrgInst);
  F.FillNpType;
  F.FillArenda;
  F.SetBrokenComments;
  if F.ShowModal = mrOk then result := TRUE
  else result := FALSE;
  F.Free;
end;
//==============================================================================
function EditRezervuar(InsideTransaction: Boolean; q: TOilQuery): Boolean;
var
  F: TRezervForm;
  str: string;
begin
  Application.CreateForm(TRezervForm, F);
  F.Caption := TranslateText('Редактирование резервуара');
  F.id := q.FieldByName('id').Value;
  F.inst := q.FieldByName('inst').Value;
  F.OrgId := q.FieldByName('id_org').Value;
  F.OrgInst := q.FieldByName('inst_org').Value;
  F.cbOrg.Text := q.FieldByName('orgname').Value;
  F.edName.Text := q.FieldByName('name').Value;
  F.edType.Text := nvl(q.FieldByName('rez_type').Value, '');
  F.edNum.Text := nvl(q.FieldByName('num').Value, 0);
  if q.FieldByName('realvirt').Value = 0 then F.rbVirtual.Checked := TRUE
  else F.rbReal.Checked := TRUE;
  F.calcCapacity.Value := nvl(q.FieldByName('capacity').Value, 0);
  F.leUB_KAT.Tag := nvl(q.FieldByName('ub_kat').Value, 0);
  F.leUB_KAT.Text := nvl(q.FieldByName('ub_kat_name').Value, '');
  F.calcDead.Value := nvl(q.FieldByName('dead').Value, 0);
  F.calcDno_Corr.Value := nvl(q.FieldByName('dno_corr').Value, 0);
  F.deYear.Date := nvl(q.FieldByName('start_year').Value, 0);
  if (F.deYear.Date <> 0) then
    F.deYear.Date := EncodeDate(q.FieldByName('start_year').Value, 1, 1);
  F.cbCondition.ItemIndex := nvl(q.FieldByName('condition').Value, -1);
  F.deInspection.Date := nvl(q.FieldByName('inspection_date').Value, 0);
  F.deCal.Date := nvl(q.FieldByName('last_cal_date').Value, 0);
  F.deRepair.Date := nvl(q.FieldByName('repair_date').Value, 0);
  F.edRepair.Text := nvl(q.FieldByName('repair_details').Value, '');
  F.deColouring.Date := nvl(q.FieldByName('colouring_date').Value, 0);
  str := nvl(q.FieldByName('comments').Value, '');
  F.edComments.Text := trim(copy(str,pos(';',str)+1,length(str)-pos(';',str)));
  F.cbDarkLight.ItemIndex := nvl(q.FieldByName('darklight').Value, -1);
  F.cbOwnArenda.ItemIndex := nvl(q.FieldByName('ownarenda').Value, -1);
  F.ElevId := nvl(q.FieldByName('elev_id').Value, 0);
  F.ElevInst := nvl(q.FieldByName('elev_inst').Value, 0);
  F.gbTubing.Tag := q.FieldByName('TUBING').AsInteger;
  F.rbTubCommon.Checked := (q.FieldByName('TUBING').AsInteger = 0) or q.FieldByName('TUBING').IsNull;
  F.rbTubSeparate.Checked := q.FieldByName('TUBING').AsInteger = 1;
  F.calcTubCapacity.Value := q.FieldByName('TUBINGCAPACITY').AsFloat;
  if F.ElevId <> 0 then
  begin
    _OpenQuery(F.qElev);
    while not F.qElev.Eof do
    begin
      if F.qElev.FieldByName('id').AsInteger = F.ElevId then break;
      F.qElev.Next;
    end;
    F.ceElev.Text := F.qElev.FieldByName('name').AsString;
  end;
  _OpenQueryParOra(F.qNp,
    ['ID',   q.FieldByName('id').Value,
     'INST', q.FieldByName('inst').Value]);
  F.FillNpType;
  F.FillArenda;
  F.FillCbNpType;
  F.FillCbArenda;
  F.SetBrokenComments;
  if F.ShowModal = mrOk then result := TRUE
  else result := FALSE;
  F.Free;
end;
//==============================================================================
procedure TRezervForm.FillCbNpType;
begin
  mt.Last;
  while mtState.AsString = 'N' do
    mt.Prior;
  cbNPType.Text := mtNp_Type_Name.AsString;
  cbNpType.Tag := mtNp_Type.AsInteger;
end;
//==============================================================================
procedure TRezervForm.FillNpType;
var
  FirstLine: string;
  //****************************************************************************
  procedure FillEmptyNpType;
  begin
    mt.Insert;
    mt.FieldByName('first_line').AsString := 'Y';
    mt.FieldByName('date_').AsDateTime := StrToDate('01.01.1990');
    mt.Post;
  end;
  //****************************************************************************
begin
  mt.EmptyTable;
  mt.Open;
  if Id = 0 then FillEmptyNpType
  else
  begin
    _OpenQueryParOra(qNp,
      ['ID',   Id,
       'INST', Inst]);
    if qNp.RecordCount = 0 then FillEmptyNpType
    else
    begin
      FirstLine := 'Y';
      while not qNp.Eof do
      begin
        mt.Insert;
        mt.FieldByName('id').Value := qNp.FieldByName('id').Value;
        mt.FieldByName('state').Value := qNp.FieldByName('state').Value;
        mt.FieldByName('np_type_name').Value := qNp.FieldByName('np_type_name').Value;
        mt.FieldByName('np_type').Value := qNp.FieldByName('np_type').Value;
        mt.FieldByName('first_line').Value := FirstLine;
        mt.FieldByName('date_').Value := qNp.FieldByName('date_').Value;
        mt.Post;
        qNP.Next;
        FirstLine := 'N';
      end;
    end;
  end;
end;
//==============================================================================
procedure TRezervForm.FillArenda;
begin
  mtArenda.Open;
  mtArenda.EmptyTable;
  if Id = 0 then exit
  else
  begin
    _OpenQueryParOra(qArenda,
      ['ID', Id,
       'INST', Inst]);
    while not qArenda.Eof do
    begin
      mtArenda.Insert;
      mtArenda['id'] := qArenda['id'];
      mtArenda['state'] := qArenda['state'];
      mtArenda['org_id'] := qArenda['org_id'];
      mtArenda['org_inst'] := qArenda['org_inst'];
      mtArenda['org_name'] := qArenda['org_name'];
      mtArenda['oper_type'] := qArenda['oper_type'];
      if mtArenda['oper_type'] = 1 then mtArenda['oper_type_name'] := REZ_SDAN
      else mtArenda['oper_type_name'] := REZ_END;
      mtArenda['date_'] := qArenda['date_'];
      mtArenda.Post;
      qArenda.Next;
    end;
  end;
end;
//==============================================================================
procedure TRezervForm.FillCbArenda;
begin
  cbArenda.Text := '';
  if mtArenda.RecordCount = 0 then exit;
  mtArenda.Last;
  while (mtArendaState.AsString = 'N') and not mtArenda.Bof do
    mtArenda.Prior;
  if mtArendaState.AsString = 'Y' then cbArenda.Text := mtArenda['org_name'];
end;
//==============================================================================
procedure TRezervForm.FormCreate(Sender: TObject);
begin
  inherited;
  qUb_Kat.Open;
  NpTypeChanged := FALSE;
  ArendaChanged := FALSE;
  leUb_Kat.DropDownWidth := leUb_Kat.Left + leUb_Kat.Width - 10
end;
//==============================================================================
procedure TRezervForm.cbNpTypeButtonClick(Sender: TObject);
var
  F: TRezervNpTypeForm;
begin
  Application.CreateForm(TRezervNpTypeForm, F);
  F.ds.DataSet := mt;
  if F.ShowModal = mrCancel then FillNpType
  else
  begin
    NpTypeChanged := TRUE;
    FillCbNpType;
  end;
  F.Free;
end;
//==============================================================================
procedure TRezervForm.TestData;
var
  Day, Month, Year, y, m, d: word;
  procedure TestCondition(ABadCondition: boolean; AMessage: string; AControl: TWinControl);
  begin
    if ABadCondition then
    begin
      AControl.SetFocus;
      raise Exception.Create(TranslateText(AMessage));
    end;
  end;
begin
  DecodeDate(Date, Year, Month, Day);
  DecodeDate(deYear.date, y, m, d);
  TestCondition(edName.Text = '', 'Не введено название!!!', edName);
  if rbReal.Checked then
  begin
    TestCondition(edNum.Text = '', 'Не введен номер!!!', edNum);
    TestCondition(cbNPType.Tag = 0, 'Не определен нефтепродукт!!!', cbNPType);
    TestCondition(calcCapacity.Value = 0, 'Не определена ёмкость!!!', calcCapacity);
    TestCondition(((deYear.Date <> 0) and (Y > Year)), 'Неправильный год ввода в эксплуатацию!!!', deYear);
    TestCondition(deRepair.Date > Date, 'Неправильно введена дата последнего ремонта!!!', deRepair);
    TestCondition(deColouring.Date > Date, 'Неправильно введена дата последней окраски!!!', deColouring);
    TestCondition(deRepair.Date > Date, 'Неправильно введена дата последнего ремонта!!!', deRepair);
    TestCondition(deInspection.Date > Date, 'Неправильно введена дата последнего обследования!!!', deInspection);
    if (mt.FieldByName('date_').AsDateTime < StrToDate('01.01.1990')) and (mt.FieldByName('first_line').AsString <> 'Y') then
      raise exception.create(TranslateText('Значение даты должно превышать 01.01.1990!'));
    if (mt.FieldByName('date_').AsDateTime > Date) then
      raise exception.create(TranslateText('Значение даты должно лежать в настоящем или прошлом,')
       +#13#10+ TranslateText('но не в будущем!'));
  end;
end;
//==============================================================================
procedure TRezervForm.Save;
var
  y, m, d: word;
begin
  StartSqlOra;
  RLog(TranslateText('Транзацкия открыта'));
  if Id = 0 then Id := GetSeqNextVal('S_OIL_REZERVUAR');
  RLog('ID received');
  DecodeDate(deYear.Date, y, m, d);
  Id := DBSaver.SaveRecord('OIL_REZERVUAR',
    ['ID',              Id,
     'INST',            Inst,
     'STATE',           'Y',
     'ID_ORG',          OrgId,
     'INST_ORG',        OrgInst,
     'NAME',            edName.Text,
     'CAPACITY',        calcCapacity.Value,
     'DEAD',            calcDead.Value,
     'NUM',             edNum.Text,
     'DNO_CORR',        calcDno_Corr.Value,
     'LAST_CAL_DATE',   Val2Null(deCal.Date, 0),
     'REZ_TYPE',        edType.Text,
     'UB_KAT',          Val2Null(leUB_KAT.Tag, 0),
     'START_YEAR',      Val2Null(y, 0),
     'REALVIRT',        BoolToInt(rbReal.Checked),
     'NP_TYPE_ID',      Val2Null(cbNpType.Tag, 0),
     'CONDITION',       cbCondition.ItemIndex,
     'INSPECTION_DATE', Val2Null(deInspection.Date, 0),
     'REPAIR_DATE',     Val2Null(deRepair.Date, 0),
     'REPAIR_DETAILS',  edRepair.Text,
     'COLOURING_DATE',  Val2Null(deColouring.Date, 0),
     'DARKLIGHT',       Val2Null(cbDarkLight.ItemIndex, -1),
     'OWNARENDA',       Val2Null(cbOwnArenda.ItemIndex, -1),
     'ELEV_ID',         Val2Null(ElevId, 0),
     'ELEV_INST',       Val2Null(ElevInst, 0),
     'COMMENTS',        edBrokenState.Text + trim(edComments.Text),
     'TUBING',          gbTubing.Tag,
     'TUBINGCAPACITY',  calcTubCapacity.Value
    ]);
  RLog('OIL_REZERVUAR saved');
  if NpTypeChanged then
  begin
    mt.First;
    while not mt.Eof do
    begin
      if (mtId.AsInteger <> 0) or (mtState.AsString = 'Y') then
      begin
        DBSaver.SaveRecord('OIL_REZ_NP_TYPE',
          ['ID',       mtId.AsInteger,
           'INST',     Inst,
           'STATE',    mtState.Value,
           'REZ_ID',   Id,
           'REZ_INST', Inst,
           'NP_TYPE',  mtNp_Type.Value,
           'DATE_',    mtDate_.Value
          ]);
        RLog('OIL_REZ_NP_TYPE saved');
      end;
      mt.Next;
    end;
  end;

  if ArendaChanged then
  begin
    mtArenda.First;
    while not mtArenda.Eof do
    begin
      if (mtArendaId.AsInteger <> 0) or (mtArendaState.AsString = 'Y') then
      begin
        DBSaver.SaveRecord('OIL_REZ_ARENDA',
          ['ID',        mtArendaId.AsInteger,
           'INST',      Inst,
           'STATE',     mtArendaState.Value,
           'REZ_ID',    Id,
           'REZ_INST',  Inst,
           'ORG_ID',    decode([mtArendaOrg_Id.AsInteger, 0, null]),
           'ORG_INST',  decode([mtArendaOrg_Inst.AsInteger, 0, null]),
           'OPER_TYPE', mtArendaOper_Type.Value,
           'DATE_',     mtArendaDate_.Value
          ], TRUE);
        RLog('OIL_REZ_ARENDA saved');
      end;
      mtArenda.Next;
    end;
  end;
  CommitSqlOra;
  RLog('Transaction commited');
end;
//==============================================================================
procedure TRezervForm.bbOkClick(Sender: TObject);
begin
  RLog('*************************************');
  RLog(TranslateText('Начало записи'));
  TestData;
  RLog(TranslateText('Тест на запись пройден'));
  Save;
  RLog(TranslateText('Запись завершена'));
  RLog('*************************************');
  ModalResult := mrOk;
end;
//==============================================================================
procedure TRezervForm.cbOrgButtonClick(Sender: TObject);
var
  name: string;
begin
  if CaptureOrg(1, OrgId, OrgInst, 'yyy', OrgId, OrgInst, name) then cbOrg.Text := name;
end;
//==============================================================================
procedure TRezervForm.edYearKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key >= ' ') and (Key < '0') and (Key > '9') then Key := #0;
end;
//==============================================================================
procedure TRezervForm.rbVirtualClick(Sender: TObject);
begin
  edType.Text := '';
end;
//==============================================================================
procedure TRezervForm.leUb_KatCloseUp(Sender: TObject);
begin
  leUB_KAT.Tag := qUB_Kat.FieldByName('id').AsInteger;
end;
//==============================================================================
procedure TRezervForm.btnCalibrClick(Sender: TObject);
begin
  KalibrateRezervuar(Id, Inst);
end;
//==============================================================================
procedure TRezervForm.ceElevButtonClick(Sender: TObject);
begin
  if not qElev.Active then qElev.Open;
end;
//==============================================================================
procedure TRezervForm.SpeedButton1Click(Sender: TObject);
begin
  ElevId := 0;
  ElevInst := 0;
  ceElev.Text := '';
end;
//==============================================================================
procedure TRezervForm.ceElevCloseUp(Sender: TObject);
begin
  ElevId := qElevId.AsInteger;
  ElevInst := ElevId;
end;
//==============================================================================
procedure TRezervForm.mtBeforePost(DataSet: TDataSet);
begin
  if mt.FieldByName('first_line').AsString = 'Y' then
    mt.FieldByName('date_').AsDateTime := StrToDate('01.01.1990');
  if (mt.FieldByName('first_line').AsString <> 'Y') and (mt.FieldByName('np_type').AsInteger = 0) then
    raise exception.create(TranslateText('Нужно определить тип НП'));
end;
//==============================================================================
procedure TRezervForm.mtDATE_Change(Sender: TField);
begin

end;
//==============================================================================
procedure TRezervForm.mtAfterInsert(DataSet: TDataSet);
begin
  mt.FieldByName('date_').AsDateTime := Date;
  mt.FieldByName('state').AsString := 'Y';
end;
//==============================================================================
procedure TRezervForm.cbArendaButtonClick(Sender: TObject);
var
  F: TRezervArendaForm;
begin
  Application.CreateForm(TRezervArendaForm, F);
  F.ds.DataSet := mtArenda;
  if F.ShowModal = mrCancel then FillArenda
  else
  begin
    ArendaChanged := TRUE;
    FillCbArenda;
  end;
  F.Free;
end;
//==============================================================================
procedure TRezervForm.mtArendaAfterInsert(DataSet: TDataSet);
begin
  mtArenda['date_'] := Date;
  mtArenda['state'] := 'Y';
end;
//==============================================================================
procedure TRezervForm.mtArendaBeforePost(DataSet: TDataSet);
begin
  if mtArenda['oper_type_name'] = REZ_SDAN then mtArenda['oper_type'] := 1
  else
  begin
    mtArenda['oper_type'] := 0;
    mtArenda['org_id'] := null;
    mtArenda['org_inst'] := null;
    mtArenda['org_name'] := '';
  end;
end;
//==============================================================================
procedure TRezervForm.deYearChange(Sender: TObject);
var
  d, m, y: word;
begin
  inherited;
  DecodeDate(deYear.Date, y, m, d);
  if ((m <> 1) or (d <> 1)) then deYear.Date := EncodeDate(y, 1, 1);
end;
//==============================================================================
procedure TRezervForm.qUb_KatAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if DataSet.RecordCount > 15 then leUb_Kat.DropDownCount := 15
  else leUb_Kat.DropDownCount := DataSet.RecordCount;
end;
//==============================================================================

procedure TRezervForm.cbConditionChange(Sender: TObject);
begin
  inherited;
  SetBrokenComments;
end;

procedure TRezervForm.SetBrokenComments;
begin
  edBrokenState.Visible := cbCondition.ItemIndex>0;  // 0 = несправний рез.
  if cbCondition.ItemIndex > 0 then
    begin
      edComments.Left := edBrokenState.Left + edBrokenState.Width - 2;
      edComments.Width := Width - edBrokenState.Width - 16;
      edBrokenState.Text := cbCondition.Text + '; ';
    end
  else
    begin
      edComments.Left := edBrokenState.Left;
      edComments.Width := Width - 18;
      edBrokenState.Text := '';
    end;
end;

procedure TRezervForm.edBrokenStateEnter(Sender: TObject);
begin
  edComments.SetFocus;
end;

procedure TRezervForm.rbTubingChange(Sender: TObject);
begin
  If rbTubCommon.Checked then
    gbTubing.Tag := 0
  else if rbTubSeparate.Checked then
    gbTubing.Tag := 1;
end;

end.
