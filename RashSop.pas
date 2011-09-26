unit RashSop;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGridEh, Db, DBTables, MemTable, StdCtrls, Buttons, uOilQuery,
  ToolEdit, Mask, Ora, MemDS, DBAccess, uStart, uHelpButton, uCommonForm,
  uOilStoredProc{$IFDEF VER150},Variants, Menus{$ENDIF}, PrihSop, NPTypeRef,
  GridsEh, DBGridEhGrouping;

type
  TRashSopForm = class(TCommonForm)
    Panel1: TPanel;
    dbgrid: TDBGridEh;
    Panel2: TPanel;
    mt: TMemoryTable;
    mtID: TFloatField;
    mtNP_TYPE: TStringField;
    mtNP_TYPE_ID: TFloatField;
    mtSHTUKI: TFloatField;
    mtSS: TFloatField;
    ds: TOraDataSource;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    mtDOG: TStringField;
    mtPART_ID: TFloatField;
    mtPART_INST: TFloatField;
    sbDel: TSpeedButton;
    mtPLAN_ID: TFloatField;
    mtSHTUKI_OLD: TFloatField;
    mtSTATE: TStringField;
    mtREST: TFloatField;
    qGrid: TOilQuery;
    qGridID: TFloatField;
    qGridNP_TYPE: TStringField;
    qGridNP_TYPE_ID: TFloatField;
    qGridSS: TFloatField;
    qGridDOG: TStringField;
    qGridPART_ID: TFloatField;
    qGridPART_INST: TFloatField;
    qGridPLAN_ID: TStringField;
    qGridREST: TFloatField;
    qGridSHTUKI: TFloatField;
    qGridSTATE: TStringField;
    qGridPOST_ID: TFloatField;
    qGridPOST_INST: TFloatField;
    qGridPOSTAVSCHIK: TStringField;
    qHead: TOilQuery;
    mtPRICE: TFloatField;
    mtPRICE_OLD: TFloatField;
    qGridPRICE: TFloatField;
    mtREST_OLD: TFloatField;
    qHeadDATE_: TDateTimeField;
    qHeadFROM_ID: TFloatField;
    qHeadFROM_INST: TFloatField;
    qHeadFROM_NAME: TStringField;
    qHeadTO_ID: TFloatField;
    qHeadTO_INST: TFloatField;
    qHeadTO_NAME: TStringField;
    qHeadOPER_ID: TFloatField;
    qHeadOPER_NAME: TStringField;
    qHeadTTN_NUM: TStringField;
    qHeadREZ_ID: TFloatField;
    qHeadREZ_INST: TFloatField;
    qHeadREZ_NAME: TStringField;
    Panel3: TPanel;
    lFrom: TLabel;
    lTo: TLabel;
    ceFrom: TComboEdit;
    ceTo: TComboEdit;
    Panel4: TPanel;
    Label3: TLabel;
    ceOper: TComboEdit;
    Label4: TLabel;
    ceRezerv: TComboEdit;
    Panel5: TPanel;
    Label1: TLabel;
    edAct: TEdit;
    Label2: TLabel;
    edActDate: TDateEdit;
    mtOWN_GOODS: TStringField;
    qGridOWN_GOODS: TStringField;
    mtSUM_SS: TFloatField;
    mtSUM_PRICE: TFloatField;
    mtUS_SUBGROUP_NAME: TStringField;
    qGridUS_SUBGROUP_NAME: TStringField;
    OilHelpButton1: TOilHelpButton;
    cbNN: TCheckBox;
    Label5: TLabel;
    edNN: TEdit;
    qHeadNN_ID: TFloatField;
    qHeadNN_INST: TFloatField;
    qHeadNN_NUM: TStringField;
    mtSum: TMemoryTable;
    mtSumSHTUKI: TFloatField;
    mtSumID: TIntegerField;
    mtSumPART_ID: TIntegerField;
    mtSumPART_INST: TIntegerField;
    qGridCODAVIAS: TFloatField;
    qGridCODOPTIMA: TFloatField;
    mtCODAVIAS: TFloatField;
    mtCODOPTIMA: TFloatField;
    mtCODINT: TIntegerField;
    qGridCODINT: TFloatField;
    procedure Test;
    procedure Save;
    procedure Init;
    procedure ReloadRest;
    procedure bbOkClick(Sender: TObject);
    procedure ceOperButtonClick(Sender: TObject);
    procedure ceRezervButtonClick(Sender: TObject);
    procedure dbgridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure dbgridKeyPress(Sender: TObject; var Key: Char);
    procedure dbgridDblClick(Sender: TObject);
    procedure ceToButtonClick(Sender: TObject);
    procedure mtBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ceToKeyPress(Sender: TObject; var Key: Char);
    procedure mtCalcFields(DataSet: TDataSet);
    procedure dbgridSortMarkingChanged(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure edActDateChange(Sender: TObject);
    procedure ceFromButtonClick(Sender: TObject);
    procedure cbNNClick(Sender: TObject);
    procedure NNActiveWithOper;
  private
    function  GetVisibleCod: TNpTypeCod;
    procedure SetVisibleCod(AValue: TNpTypeCod);
  public
    GroupNum, RashodInst, FromId, FromInst, ToId, ToInst, RezId, RezInst: Integer;
    DateOld, StartDate: TDateTime;
    RezDefault, TtnNum: String;
    ReadOnly, Preparing: Boolean;
    NNId, NNInst: Variant;
    property VisibleCod: TNpTypeCod read GetVisibleCod write SetVisibleCod;
  end;

var
  PrihSopForm: TRashSopForm;

function AddRashSop: TModalResult;
function EditRashSop(p_GroupNum, p_Inst: integer; p_StartDate: TDateTime): TModalResult;

implementation

{$R *.DFM}

uses Main, UDbFunc, OilStd, ChooseOrg, OperTypeRef, TaxBillPrint,
  RezervRef, PartRef, ExFunc, MoneyFunc, uGridFunc;

var
  SOP_PART_NAME: string = 'СПБ';
  TaxBill: TdmTaxBill;

//==============================================================================
function AddRashSop: TModalResult;
var
  F: TRashSopForm;
  RezDefaultId, RezDefaultInst: string;
begin
  Application.CreateForm(TRashSopForm, F);
  F.edActDate.Date := Date;
  F.DateOld := F.edActDate.Date;
  F.RashodInst := MAIN_ORG.INST;
  F.RezDefault := ReadOilVar('REZ_SOP');
  F.GroupNum := 0;
  if F.RezDefault <> '' then
  begin
    GetNameValue(F.RezDefault, RezDefaultId, RezDefaultInst, ',');
    F.RezId := StrToInt(RezDefaultId);
    F.RezInst := StrToInt(RezDefaultInst);
    F.ceRezerv.Text := GetSqlValue('select name from oil_rezervuar where id = '+ RezDefaultId +' and inst = '+ RezDefaultInst);
  end;
  F.ceFrom.Text := MAIN_ORG.Name;
  F.FromId := MAIN_ORG.ID;
  F.FromInst := MAIN_ORG.INST;
  F.Init;
  F.Preparing := FALSE;
  result := F.ShowModal;
end;
//==============================================================================
function EditRashSop(p_GroupNum, p_Inst: integer; p_StartDate: TDateTime): TModalResult;
var
  F: TRashSopForm;
begin
  Application.CreateForm(TRashSopForm, F);
  F.GroupNum := p_GroupNum;
  F.RashodInst := p_Inst;
  F.StartDate := p_StartDate;
  F.Init;
  F.ceRezerv.Enabled := FALSE;
  F.Preparing := FALSE;
  result := F.ShowModal;
end;
//==============================================================================
procedure TRashSopForm.ReloadRest;
begin
  dbgrid.DataSource := nil;
  try
    if (DateOld <> edActDate.Date) and (not mtSum.Active) then
    begin
      mt.First;
      mtSum.Close;
      mtSum.Open;
      while not mt.Eof do
      begin
        mtSum.Append;
        mtSumID.AsInteger := mtID.AsInteger;
        mtSumPART_ID.AsInteger := mtPART_ID.AsInteger;
        mtSumPART_INST.AsInteger := mtPART_INST.AsInteger;
        mtSumSHTUKI.Value := mtSHTUKI.Value;
        mtSum.Post;
        mt.Next;
      end;
    end;

    if qGrid.Active then qGrid.Close;
    _OpenQueryParOra(qGrid,
      ['p_Inst',        RashodInst,
       'p_Date',        edActDate.Date,
       'p_GroupNum',    0,
       'p_GroupNumDel', GroupNum,
       'p_RezId',       RezId,
       'p_RezInst',     RezInst
      ]);

    mt.First;
    while not mt.Eof do
    begin
      mt.Edit;
      mt['state'] := 'N';
      mt.Post;
      mt.Next;
    end;

    while not qGrid.Eof do
    begin
      if mt.Locate('part_id;part_inst', qGrid['part_id;part_inst'], []) then
      begin
        mt.Edit;
        mt['rest'] := qGrid['rest'];
        if mt['rest'] < mt['shtuki'] then mt['shtuki'] := mt['rest'];
        mt['state'] := 'Y';
      end
      else
      begin
        mt.Insert;
        CopyToMemoryTableOne(qGrid, mt,
          'NP_TYPE,NP_TYPE_ID,REST,SS,PRICE,DOG,PART_ID,PART_INST,STATE,PLAN_ID,' +
          'OWN_GOODS,SHTUKI,SHTUKI:SHTUKI_OLD,PRICE:PRICE_OLD,REST:REST_OLD,US_SUBGROUP_NAME,' +
          'CODOPTIMA,CODAVIAS,CODINT');
        mt.Post;
      end;
      qGrid.Next;
    end;

    mt.First;
    while not mt.Eof do
    begin
      if mt['state'] = 'N' then mt.Delete
      else mt.Next;
    end;

    if DateOld <> edActDate.Date then
    begin
      mtSum.First;
      while not mtSum.Eof do
      begin
        mt.First;
        while not mt.Eof do
        begin
          if (mtSumPART_ID.AsInteger = mtPART_ID.AsInteger) and (mtSumPART_INST.AsInteger = mtPART_INST.AsInteger) then
          begin
            mt.Edit;
            mtSHTUKI.Value := mtSumSHTUKI.Value;
            mtID.AsInteger := mtSumID.AsInteger;
            mt.Post;
            break;
          end;
          mt.Next;
        end;
        mtSum.Next;
      end;
    end;    
    mt.First;
  finally
    dbgrid.DataSource := ds;
    SortGridMemoryTable(dbgrid);
  end;
end;
//==============================================================================
procedure TRashSopForm.Init;
begin
  if GroupNum <> 0 then
  begin
    _OpenQueryParOra(qHead,
      ['p_Inst',      RashodInst,
       'p_GroupNum',  GroupNum,
       'p_StartDate', StartDate
      ]);
    edActDate.Date := qHeadDate_.AsDateTime;
    DateOld := edActDate.Date;
    if FromId = 0 then
    begin
      FromId := qHeadFrom_Id.AsInteger;
      FromInst := qHeadFrom_Inst.AsInteger;
      ceFrom.Text := qHeadFrom_Name.AsString;
    end;
    ToId := qHeadTo_Id.AsInteger;
    ToInst := qHeadTo_Inst.AsInteger;
    ceTo.Text := qHeadTo_Name.AsString;
    ceOper.Text := qHeadOper_Name.AsString;
    ceOper.Tag := qHeadOper_Id.AsInteger;
    if RezId = 0 then
    begin
      RezId := qHeadRez_Id.AsInteger;
      RezInst := qHeadRez_Inst.AsInteger;
      ceRezerv.Text := qHeadRez_Name.AsString;
    end;
    TtnNum := qHeadTtn_Num.AsString;
    edAct.Text := TtnNum;
    if qHeadNN_Id.AsInteger <> 0 then
    begin
      NNId := qHeadNN_Id.AsInteger;
      NNInst := qHeadNN_Inst.AsInteger;
      edNN.Text := qHeadNN_Num.AsString;
      cbNN.Checked := true;
    end;
    NNActiveWithOper;
    qHead.Close;
  end;

  ReadOnly := (RashodInst <> MAIN_ORG.INST) or not InstIsPossible(RashodInst)
    or (edActDate.Date <= StrToDate(CLOSE_DATE));
  bbOk.Enabled := not ReadOnly;

  _OpenQueryParOra(qGrid,
    ['p_Inst',        RashodInst,
     'p_Date',        edActDate.Date,
     'p_GroupNum',    GroupNum,
     'p_GroupNumDel', 0,
     'p_RezId',       RezId,
     'p_RezInst',     RezInst,
     'p_StartDate',   StartDate
    ]);

  mt.DisableConstraints;
  try
    mt.Close;
    mt.EmptyTable;
    mt.Open;
    CopyToMemoryTable(qGrid, mt,
      'ID,NP_TYPE,NP_TYPE_ID,SHTUKI,SS,PRICE,DOG,PART_ID,PART_INST,REST,STATE,PLAN_ID,' +
      'OWN_GOODS,SHTUKI:SHTUKI_OLD,PRICE:PRICE_OLD,REST:REST_OLD,US_SUBGROUP_NAME,' +
      'CODOPTIMA,CODAVIAS');
    mt.First;
  finally
    mt.EnableControls;
  end;
  SortGridMemoryTable(dbgrid);
  qGrid.Close;
end;
//==============================================================================
procedure TRashSopForm.Test;
begin
  if ToId = 0 then raise exception.create(TranslateText('Не определа организация "Кому"!'));
  if mt.isEmpty then raise exception.create(TranslateText('Не введено ни одной записи!'));
  if ceOper.Tag = 0 then raise exception.create(TranslateText('Не определена операция!'));
  if RezId = 0 then raise exception.create(TranslateText('Не определен резервуар!'));
  mt.First;
  while not mt.Eof do
  begin
    if mtNp_Type.AsString = '' then raise exception.create(TranslateText('Не определен товар!'));
    if (mtShtuki.AsInteger > 0) and (mtPrice.AsFloat <= 0) then
      raise exception.create(TranslateText('Не определена цена реализации!'));
    mt.Next;
  end;
end;
//==============================================================================
procedure TRashSopForm.Save;
var
  RashodId: integer;
  vIncDebet: string;
begin
  try
    if GroupNum = 0 then GroupNum := GetSeqNextVal('SEQ_RASHOD_GROUP_NUM');
    if edAct.Text = '' then edAct.Text := IntToStr(GroupNum);
    if TtnNum = '' then
    begin
      if DbObjectExists('SEQ_TTN_NUM_SOP', 'SEQUENCE', frmStart.OraSession1.Username) then
        TtnNum := IntToStr(GetSeqNextVal('SEQ_TTN_NUM_SOP'))
      else
        TtnNum := IntToStr(GetSeqNextVal('TTN_NUM'))
    end
    else
      TtnNum := edAct.Text;
    StartSqlOra;
    if cbNN.Checked then
    begin
      if (NNId <> null) and (NNInst <> null) then TaxBill.DeleteSBRecords10(NNId, NNInst);
      if edNN.Text = '' then edNN.Text := TaxBill.GetNextNumber(edActDate.Date);
      TaxBill := TdmTaxBill.Create;
      TaxBill.Options.ToId := ToId;
      TaxBill.Options.ToInst := ToInst;
      TaxBill.Options.FromId := FromId;
      TaxBill.Options.FromInst := FromInst;
      TaxBill.Options.Date := DateToStr(edActDate.Date);
      TaxBill.Options.TaxBillType := 1;
      TaxBill.Options.OIL_NN_Type := 2;
      TaxBill.Options.OIL_NN_Cause := 3;
      TaxBill.Options.ByDogName := TranslateText('Отпуск сопутствующего товара № ')+ IntToStr(GroupNum);
      TaxBill.Options.OperName := TranslateText('Оплата с р/с');
      TaxBill.Options.Num := edNN.Text;
      if (NNId <> null) and (NNInst <> null) then
      begin
        TaxBill.Options.TaxBillId := NNId;
        TaxBill.Options.TaxBillInst := NNInst;
        TaxBill.DeleteSBRecordsDet(TaxBill.Options.TaxBillId, TaxBill.Options.TaxBillInst,
          TaxBill.Options.TaxBillType);
      end;
      mt.First;
      repeat
        TaxBill.AddPosition(
          mt.FieldByName('NP_TYPE_ID').AsInteger,
          19,
          DateToStr(edActDate.Date),
          mt.FieldByName('SHTUKI').AsFloat,
          mt.FieldByName('PRICE').AsFloat);
        mt.Next;
      until mt.Eof;
      TaxBill.Make(False);
      NNId := TaxBill.Options.TaxBillId;
      NNInst := TaxBill.Options.TaxBillInst;
      TaxBill.Free;
    end
    else
      if (NNId <> null) and (NNInst <> null) then
        if MessageDlg(TranslateText('Необходимо удалить налоговую накладную. Удалить?'),
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          TaxBill.DeleteSBRecords10(NNId, NNInst);
          NNId := null;
          NNInst := null;
        end;

    // включати в дебеторку, якщо на дану операцію можна створювати податкову накладну
    if GetSQLValue('select count(*) from oil_oper_type o where o.grp = 8 ' +
      ' and o.id not in (-100'+ ReadOilVar('OPER_NOT_NN') +'-100) and id = '+ IntToStr(ceOper.Tag)) = 1
    then
      vIncDebet := 'N'
    else
      vIncDebet := 'Y';
    mt.First;
    while not mt.Eof do
    begin
      if (mtShtuki.AsInteger > 0) or (mtShtuki.AsInteger <> mtShtuki_Old.AsInteger) then
      begin
        if mtId.AsInteger = 0 then
          RashodId := GetSeqNextVal('S_OIL_RASH')
        else
          RashodId := mtId.AsInteger;
        DBSaver.SaveRecord('OIL_RASHOD',
          ['ID',                      RashodId,
           'STATE',                   mtState.Value,
           'INST',                    RashodInst,
           'EMP_ID',                  EMP_ID,
           'EMP_INST',                null,
           'DATE_',                   edActDate.Date,
           'FROM_ID',                 FromId,
           'FROM_INST',               FromInst,
           'TO_ID',                   ToId,
           'TO_INST',                 ToInst,
           'TO_PLACE',                null,
           'OPER_ID',                 ceOper.Tag,
           'TTN_NUM',                 TtnNum,
           'TTN_DATE',                edActDate.Date,
           'WAY_LIST',                null,
           'DOV_SERIAL',              null,
           'DOV_NUM',                 null,
           'DOV_DATE',                null,
           'DOV_GIVE',                null,
           'AUTO_ID',                 null,
           'AUTO_INST',               null,
           'PART_ID',                 mtPart_Id.Value,
           'PART_INST',               mtPart_Inst.Value,
           'PACK',                    TranslateText('ШТ.'),
           'TEMPER',                  0,
           'UD_WEIG',                 1,
           'LITR',                    mtShtuki.AsInteger,
           'COUNT_',                  mtShtuki.AsInteger,
           'PRICE',                   mtPrice.AsFloat,
           'INCL_DEBET',              vIncDebet,
           'RASCH_TYPE',              0,
           'SBOR_POST',               'N',
           'SBOR_NAC',                'N',
           'SBOR_NDS',                'N',
           'UCH_PRICE',               'N',
           'OWN_GOOD',                'Y',
           'NN_ID',                   NNId,
           'NN_INST',                 NNInst,
           'REZ',                     RezId,
           'REZ_INST',                RezInst,
           'COMM',                    null,
           'PRIH',                    null,
           'PRIH_INST',               null,
           'DOG',                     null,
           'DOG_INST',                null,
           'R_FROM_',                 null,
           'R_FROM_INST',             null,
           'R_TO_',                   null,
           'R_TO_INST',               null,
           'EMPLOY_ID',               null,
           'EMPLOY_INST',             null,
           'GROUP_NUM',               GroupNum,
           'USER_ID',                 SUPER_REAL_EMP_ID
          ]);
      end;
      mt.Next;
    end;
    CommitSqlOra;
    ModalResult := mrOk;
  except on E: Exception do
    begin
      RollBackSQL;
      MessageDlg(TranslateText('Ошибка: ')+ E.message, mtError, [mbOk], 0);
    end;
  end;
end;
//==============================================================================
function  TRashSopForm.GetVisibleCod: TNpTypeCod;
begin
  Result := CommonGetVisibleCod(dbgrid);
end;

procedure TRashSopForm.SetVisibleCod(AValue: TNpTypeCod);
begin
  CommonSetVisibleCod(dbgrid, AValue);
end;
//==============================================================================
procedure TRashSopForm.bbOkClick(Sender: TObject);
begin
  try
    dbgrid.DataSource.DataSet.DisableControls;
    try
      Test;
      Save;
    finally
      dbgrid.DataSource.DataSet.EnableControls;
    end;
  except on E: Exception do
    begin
      dbgrid.DataSource.DataSet.EnableControls;
      MessageDlg(E.message, mtError, [mbOk], 0);
    end;
  end;
end;
//==============================================================================
procedure TRashSopForm.NNActiveWithOper;
begin
  if (GetSQLValue('select count(*) from oil_oper_type o where o.grp = 8 ' +
    ' and o.id not in (-100'+ ReadOilVar('OPER_NOT_NN') +'-100) and id = ' +
    IntToStr(ceOper.Tag)) = 0) then
  begin
    cbNN.Enabled := false;
    cbNN.Checked := false;
  end
  else cbNN.Enabled := true;
end;
//==============================================================================
procedure TRashSopForm.ceOperButtonClick(Sender: TObject);
var
  F: TOperTypeRefForm;
begin
  Application.CreateForm(TOperTypeRefForm, F);
  F.SGrpId := 8;
  F.ComboEdit1.Text := GetSqlValue('select name from oil_oper_grp where id = '+ IntToStr(F.SGrpId));
  F.bbSearchClick(nil);
  if F.ShowModal = mrOk then
  begin
    ceOper.Text := F.qNAME.AsString;
    ceOper.Tag := F.qId.AsInteger;
    NNActiveWithOper;
  end;
end;
//==============================================================================
procedure TRashSopForm.ceRezervButtonClick(Sender: TObject);
var
  F: TRezervRefForm;
begin
  Application.CreateForm(TRezervRefForm, F);
  F.cbReal.Checked := FALSE;
  F.cbElev.Checked := FALSE;
  F.cbVirt.Checked := TRUE;
  F.OrgId := FromId; F.OrgInst := FromInst;
  F.cbOrg.Text := GetOrgName(FromId, FromInst);
  F.gbClass.Enabled := FALSE;
  F.bbOk.Visible := TRUE;
  F.ActivateQ(nil);
  if F.ShowModal = mrOk then
  begin
    ceRezerv.Text := F.q.FieldByName('name').AsString;
    RezId := F.q.FieldByName('id').AsInteger;
    RezInst := F.q.FieldByName('inst').AsInteger;
  end;
  Init;
end;
//==============================================================================
procedure TRashSopForm.dbgridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if gdSelected in State then AFont.Color := clWhite
  else
    if mtState.AsString = 'N' then AFont.Color := clRed
    else AFont.Color := clBlack;

  if Column.FieldName = 'PRICE' then
    if (mtPrice.AsFloat = 0) and (mtShtuki.AsFloat = 0) then
      AFont.Color := BackGround
    else if (mtPrice.AsFloat < GetWithNds_NoNds(mtSs.AsFloat, edActDate.Date)) then
      AFont.Color := clRed;

  if gdSelected in State then
  begin
    Background := clHighlight;
    AFont.Color := clWhite;
  end;

  if Column.FieldName = 'DOG' then
    if mtOwn_Goods.AsString = 'O' then
    begin
      AFont.Color := clPurple;
      if mtPart_Inst.AsInteger = 1 then AFont.Style := AFont.Style + [fsBold];
    end
    else
      if mtOwn_Goods.AsString = 'K' then AFont.Color := clBlue
      else AFont.Color := clTeal;
end;
//==============================================================================
procedure TRashSopForm.dbgridKeyPress(Sender: TObject; var Key: Char);
begin
  if (mt.FieldByName('plan_id').AsInteger > 0) and (dbgrid.SelectedField.FieldName = 'SS') then
    Key := #0;
end;
//==============================================================================
procedure TRashSopForm.dbgridDblClick(Sender: TObject);
begin
  if (mt.RecordCount > 0) and (dbgrid.SelectedField.FieldName = 'REST') then
  begin
    mt.Edit;
    mtShtuki.AsInteger := mtRest.AsInteger;
    mt.Post;
  end;
end;
//==============================================================================
procedure TRashSopForm.ceToButtonClick(Sender: TObject);
var
  vName: string;
  vType: integer;
begin
  if ChooseOrg.CaptureOrgT(2, MAIN_ORG.INST, MAIN_ORG.INST, 'yyyyyyyy', ToId, ToInst, vName, vType) then
  begin
    ceTo.Text := vName;
    case vType of
      8: ceOper.Tag := 10;
      3, 4: ceOper.Tag := 150;
      else ceOper.Tag := 12;
    end;
    ceOper.Text := GetSqlValue('select name from oil_oper_type where id = '+ IntToStr(ceOper.Tag));
    dbgrid.SetFocus;
  end;
end;
//==============================================================================
procedure TRashSopForm.mtBeforePost(DataSet: TDataSet);
var
  pr: integer;
begin
  if mtShtuki.AsInteger < mtShtuki_Old.AsInteger then
  begin
    pr := nvl(GetSqlValue('select sum(pr_litr) from oil_dr_data ' +
      ' where state=''Y'' and ttn_id = '+ mtId.AsString +'   and ttn_inst = '+ IntToStr(RashodInst)), 0);
    if mtShtuki.AsInteger < pr then
      raise exception.create(TranslateText('По этой позиции оприходовано на АЗС ') +
        IntToStr(pr) + TranslateText(' единиц товара.') + #13#10 +
        TranslateText('Нельзя сделать отпуск меньше чем на это число.'));
  end;
  if not Preparing then
  begin
    if mtShtuki.AsInteger > mtRest_Old.AsInteger + mtShtuki_Old.AsInteger then
      mtShtuki.AsInteger := mtRest_Old.AsInteger + mtShtuki_Old.AsInteger;
    mtRest.AsInteger := mtRest_Old.AsInteger - mtShtuki.AsInteger + mtShtuki_Old.AsInteger;
  end;
end;
//==============================================================================
procedure TRashSopForm.FormCreate(Sender: TObject);
begin
  inherited;
  NNId := null;
  NNInst := null;
  Preparing := TRUE;
  InitGridToolButtons(dbgrid);
  dbgrid.Columns[0].Title.SortMarker := smNoneEh;
end;
//==============================================================================
procedure TRashSopForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (ModalResult <> mrOk) and (not ReadOnly) then
    if MessageDlg(TranslateText('Вы уверены, что хотите выйти без сохранения изменений?'),
      mtWarning, [mbYes, mbNo], 0) = mrNo then Action := caNone
    else ModalResult := mrCancel;
end;
//==============================================================================
procedure TRashSopForm.FormShow(Sender: TObject);
begin
  if ToId = 0 then ceTo.SetFocus
  else dbgrid.SetFocus;
  SortGridMemoryTable(dbgrid);
  CommonVisibleCodInit(dbgrid);
end;
//==============================================================================
procedure TRashSopForm.ceToKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then ceToButtonClick(Sender);
end;
//==============================================================================
procedure TRashSopForm.mtCalcFields(DataSet: TDataSet);
begin
  mtSum_Ss.AsFloat := FRound(mtShtuki.AsFloat * mtSs.AsFloat, 2);
  mtSum_Price.AsFloat := FRound(mtShtuki.AsFloat * mtPrice.AsFloat, 2);
end;
//==============================================================================
procedure TRashSopForm.dbgridSortMarkingChanged(Sender: TObject);
begin
  SortGridMemoryTable(dbgrid);
end;
//==============================================================================
procedure TRashSopForm.sbDelClick(Sender: TObject);
var
  b: Boolean;
begin
  if mt.IsEmpty then exit;
  b := mt.State = dsBrowse;
  if b then mt.Edit;
  mt['shtuki'] := 0;
  if b then mt.Post;
end;
//==============================================================================
procedure TRashSopForm.edActDateChange(Sender: TObject);
begin
  if Preparing then exit;
  if (edActDate.Date < DateOld) and (dbgrid.SumList.SumCollection.Items[0].SumValue > 0) then
    if MessageDlg(TranslateText('При смене даты могут быть потеряны данные в столбце кол-во') + #13#10 +
      TranslateText('по причине того, что остатки на разные даты могут отличаться.') + #13#10 +
      TranslateText('Продолжить?'), mtWarning, [mbYes, mbNo], 0) = mrNo then
    begin
      edActDate.Date := DateOld;
      exit;
    end;
  ReloadRest;
  DateOld := edActDate.Date;
  bbOk.Enabled := not ReadOnly and (edActDate.Date > StrToDate(CLOSE_DATE));
end;
//==============================================================================
procedure TRashSopForm.ceFromButtonClick(Sender: TObject);
var
  vId, vInst: integer;
  vName: string;
begin
  if ChooseOrg.CaptureOrg(1, Main_id, Inst, 'yyx', vId, vInst, vName) then
  begin
    ceFrom.Text := vName;
    FromId := vId;
    FromInst := vInst;
    RezId := 0; RezInst := 0;
    ceRezerv.Text := '';
    ceRezerv.Enabled := true;
  end;
end;
//==============================================================================
procedure TRashSopForm.cbNNClick(Sender: TObject);
begin
  edNN.Enabled := cbNN.Checked;
  if not cbNN.Checked then edNN.Clear
  else
    if NNId = null then edNN.Text := TaxBill.GetNextNumber(edActDate.Date);
end;
//==============================================================================

end.
