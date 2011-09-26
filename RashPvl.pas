unit RashPvl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  EditBase, Db, MemDS, DBAccess, Ora, uOilQuery, StdCtrls, Buttons, ExtCtrls,
  ComCtrls, DBTables, MemTable, Grids, DBGridEh, ToolEdit, Mask, Menus, RXCtrls,
  Math, CurrEdit, GridsEh;

type
  TRashPvlForm = class(TEditBaseForm)
    Panel1: TPanel;
    mt: TMemoryTable;
    ds: TDataSource;
    PageControl: TPageControl;
    Summary: TTabSheet;
    Vagons: TTabSheet;
    dbg: TDBGridEh;
    dbg1: TDBGridEh;
    mt1: TMemoryTable;
    ds1: TDataSource;
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    edNum: TEdit;
    Label2: TLabel;
    dePor: TDateEdit;
    Panel6: TPanel;
    Panel7: TPanel;
    Label3: TLabel;
    ceType: TComboEdit;
    lblShip: TLabel;
    ceAuto: TComboEdit;
    Label9: TLabel;
    ceFrom: TComboEdit;
    Label10: TLabel;
    ceTo: TComboEdit;
    Panel8: TPanel;
    Panel9: TPanel;
    Label5: TLabel;
    ceNpType: TComboEdit;
    Label4: TLabel;
    ceRailStat: TComboEdit;
    Panel10: TPanel;
    Label6: TLabel;
    ceCateg: TComboEdit;
    Label7: TLabel;
    cbTovarType: TComboBox;
    Panel11: TPanel;
    cbShipped: TCheckBox;
    Label8: TLabel;
    deShipDate: TDateEdit;
    RxSpeedButton1: TRxSpeedButton;
    pmAdd: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    mtGTD_ID: TIntegerField;
    mtGTD_INST: TIntegerField;
    mtPART_ID: TIntegerField;
    mtPART_INST: TIntegerField;
    mtPOR_TONN: TFloatField;
    mtBRUTTO: TFloatField;
    mtWATER: TFloatField;
    mtNETTO: TFloatField;
    mtPR_TONN: TFloatField;
    mtPART_NAME: TStringField;
    mtGTD_NUM: TStringField;
    mtC_POR_TONN: TFloatField;
    mtC_BRUTTO: TFloatField;
    mtC_WATER: TFloatField;
    mtC_NETTO: TFloatField;
    mt1GTD_ID: TIntegerField;
    mt1GTD_INST: TIntegerField;
    mt1PART_ID: TIntegerField;
    mt1PART_INST: TIntegerField;
    mt1POR_TONN: TFloatField;
    mt1BRUTTO: TFloatField;
    mt1WATER: TFloatField;
    mt1NETTO: TFloatField;
    mt1PR_TONN: TFloatField;
    mt1PART_NAME: TStringField;
    mt1GTD_NUM: TStringField;
    mt1C_POR_TONN: TFloatField;
    mt1C_BRUTTO: TFloatField;
    mt1C_WATER: TFloatField;
    mt1C_NETTO: TFloatField;
    mt1TANK_NUM: TStringField;
    mt1ZD_NAKL: TStringField;
    mt1DET_ID: TIntegerField;
    mt1DET_INST: TIntegerField;
    mt1PRIH_DET_ID: TIntegerField;
    mt1PRIH_DET_INST: TIntegerField;
    mt1REZ_ID: TIntegerField;
    mt1REZ_INST: TIntegerField;
    qDet: TOilQuery;
    mt1REZ_NUM: TStringField;
    mt1IS_CLOSED: TStringField;
    sbDel: TSpeedButton;
    clcNetto: TRxCalcEdit;
    clcWater: TRxCalcEdit;
    clcBrutto: TRxCalcEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Panel12: TPanel;
    spdDistribute: TSpeedButton;
    mt1PR_NETTO: TFloatField;
    mt1PR_WATER: TFloatField;
    mt1PR_REAL_TONN: TFloatField;
    mtPR_REAL_TONN: TFloatField;
    pmMain: TPopupMenu;
    N3: TMenuItem;
    qPartSum: TOilQuery;
    SpeedButton1: TSpeedButton;
    procedure FillPartRest;
    procedure CreatePartListByDet;
    procedure DeleteDetPart(p_PartId: integer; p_PartInst: integer);
    procedure DistributeOtgr(p_Netto, p_Water: Double);
    procedure ceTypeButtonClick(Sender: TObject);
    procedure SetEnabled;
    procedure Init; override;
    procedure Test; override;
    procedure Save; override;
    procedure ceFromButtonClick(Sender: TObject);
    procedure ceToButtonClick(Sender: TObject);
    procedure ceAutoButtonClick(Sender: TObject);
    procedure ceNpTypeButtonClick(Sender: TObject);
    procedure ceRailStatButtonClick(Sender: TObject);
    procedure ceCategButtonClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure mtBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mt1AfterPost(DataSet: TDataSet);
    procedure AddDet(p_PartId, p_PartInst: integer; p_Diff: Double);
    procedure RemoveDet(p_PartId, p_PartInst: integer; p_Diff: Double);
    procedure ChangeDet(p_PartId, p_PartInst: integer; p_Diff: Double);
    procedure FindDetPart(p_PartId, p_PartInst: integer;
      var pp_Start, pp_End: string; var pp_Count: integer);
    procedure mt1BeforeDelete(DataSet: TDataSet);
    procedure qDetFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure dbg1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure mt1AfterInsert(DataSet: TDataSet);
    procedure sbDelClick(Sender: TObject);
    procedure mtBeforeDelete(DataSet: TDataSet);
    procedure clcNettoChange(Sender: TObject);
    procedure clcBruttoChange(Sender: TObject);
    procedure clcWaterChange(Sender: TObject);
    procedure spdDistributeClick(Sender: TObject);
    procedure cbShippedClick(Sender: TObject);
    procedure cbTovarTypeKeyPress(Sender: TObject; var Key: Char);
    procedure Panel2DblClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure mt1BeforePost(DataSet: TDataSet);
    procedure N3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    AUTO_ID, AUTO_INST, FROM_ID, FROM_INST, TO_ID, TO_INST: integer;
    RAIL_ID, RAIL_INST: integer;
    SL_PRD_ID: TStringList;
    SL_DELETED: TStringList;
    Preparing: Boolean;
    VagonsChanged: Boolean;
  public
  end;

var
  RashPvlForm: TRashPvlForm;

implementation

{$R *.DFM}

uses uXMLForm, AutoRef, ChooseOrg, NpTypeRef, uCommonForm, CheckList, Main,
  uDbFunc, uMessageDlgExt, OilStd, ExFunc, MoneyFunc, ExcelFunc;

//==============================================================================
procedure TRashPvlForm.ceTypeButtonClick(Sender: TObject);
begin
  inherited;
  if XMLChoose('otgrtyperef', ceType) then
  begin
    AUTO_ID := 0;
    AUTO_INST := 0;
    ceAuto.Clear;
    SetEnabled;
  end;
end;
//==============================================================================
procedure TRashPvlForm.Init;
begin
  inherited;
  Preparing := true;
  if ID = 0 then
  begin
    INST := MAIN_ORG.INST;
    cbTovarType.ItemIndex := 0;
  end
  else
  begin
    FillControls(q,
      [edNum, dePor, ceType, ceAuto, ceFrom, ceTo, ceNpType, ceRailStat, ceCateg, deShipDate],
      ['r_numb', 'r_date', 'r_otgr_type_name', 'r_auto_name', 'r_from_name', 'r_to_name', 'r_np_type_name', 'r_rail_name', 'r_pvl_categ_name', 'r_date_ship']);
    FillIntegers(q,
      [@AUTO_ID, @AUTO_INST, @FROM_ID, @FROM_INST, @TO_ID, @TO_INST, @RAIL_ID, @RAIL_INST],
      ['r_auto_id', 'r_auto_inst', 'r_from_id', 'r_from_inst', 'r_to_id', 'r_to_inst', 'r_rail_id', 'r_rail_inst']);
    FillTags(q,
      [ceType, ceNpType, ceCateg],
      ['r_otgr_type_id', 'r_np_type_id', 'r_pvl_categ_id']);

    cbTovarType.ItemIndex := decode([q['own_goods'], 'S', 0, 'O', 1, -1]);
    cbShipped.Checked := q.FieldByName('r_date_ship').IsNull;

    CopyToMemoryTable(q, mt1,
      'r_gtd_id:gtd_id,r_gtd_inst:gtd_inst,part_id,part_inst,' +
      'full_count:pr_real_tonn,rest_full_tonn2:pr_tonn,np_count:pr_netto,water_count:pr_water,' +
      'r_por_tonn:por_tonn,r_tonn:netto,' +
      'r_water:water,r_full_tonn:brutto,part_name,gtd_num,r_por_tonn:c_por_tonn,r_tonn:c_netto,' +
      'r_water:c_water,r_full_tonn:c_brutto,tank_num,zd_nakl,r_det_id:det_id,r_det_inst:det_inst,' +
      'det_id:prih_det_id,det_inst:prih_det_inst,rez_id,rez_inst,rez_num,r_is_closed:is_closed');

    CreatePartListByDet;
    FillPartRest;
  end;
  Preparing := false;
  SetEnabled;
end;
//==============================================================================
procedure TRashPvlForm.SetEnabled;
begin
  ceAuto.Enabled := ceType.Tag in [1, 2];
  deShipDate.Enabled := cbShipped.Checked;
  clcNetto.Enabled := cbShipped.Checked;
  clcWater.Enabled := cbShipped.Checked;
  clcBrutto.Enabled := cbShipped.Checked;
  spdDistribute.Enabled := cbShipped.Checked;
end;
//==============================================================================
procedure TRashPvlForm.ceFromButtonClick(Sender: TObject);
var
  vName: string;
begin
  if ChooseOrg.CaptureOrg(4, 0, 0, 'yyy', FROM_ID, FROM_INST, vName) then
  begin
    ceFrom.Text := vName;
    ceFrom.Hint := vName;
  end;
end;
//==============================================================================
procedure TRashPvlForm.ceToButtonClick(Sender: TObject);
var
  vName: string;
begin
  if ChooseOrg.CaptureOrg(4, 0, 0, 'yyy', TO_ID, TO_INST, vName) then
  begin
    ceTo.Text := vName;
    ceTo.Hint := vName;
  end;
end;
//==============================================================================
procedure TRashPvlForm.ceAutoButtonClick(Sender: TObject);
var F: TAutoRefForm;
begin
  F := TAutoRefForm.Create(Application);
  if (F.ShowModal = mrOk) and (F.q.RecordCount > 0) then
  begin
    if (ceType.Tag = 1) and (F.q['auto_group_id'] <> 5) then
      raise exception.create('Выбранное транспортное средство не умеет плавать');
    if (ceType.Tag = 2) and (F.q['auto_group_id'] = 5) then
      raise exception.create('Выбранное транспортное средство плавает, а не ездит');
    AUTO_ID := F.q['id'];
    AUTO_INST := F.q['inst'];
    ceAuto.Text := F.q['numb'];
  end;
end;
//==============================================================================
procedure TRashPvlForm.ceNpTypeButtonClick(Sender: TObject);
var
  F: TNpTypeRefForm;
begin
  inherited;
  F := TNpTypeRefForm.Create(Application);
  F.edName.Text := TranslateText('мазут');
  F.bbSearch.Click;
  if F.ShowModal = mrOk then
  begin
    ceNpType.Text := F.qName.AsString;
    ceNpType.Tag := F.qId.AsInteger;
  end;
end;
//==============================================================================
procedure TRashPvlForm.ceRailStatButtonClick(Sender: TObject);
begin
  XMLChoose('railstatref', RAIL_ID, RAIL_INST, ceRailStat);
end;
//==============================================================================
procedure TRashPvlForm.ceCategButtonClick(Sender: TObject);
begin
  XMLChoose('pvlcategref', ceCateg);
end;
//==============================================================================
procedure TRashPvlForm.N1Click(Sender: TObject);
begin
  inherited;
  if FROM_ID = 0 then
    raise exception.create(TranslateText('Не определен отправитель'));
  if TO_ID = 0 then
    raise exception.create(TranslateText('Не определен получатель'));
  if ceNpType.Tag = 0 then
    raise exception.create(TranslateText('Не определен тип НП'));
  if dePor.Date = 0 then
    raise exception.create(TranslateText('Не определена дата'));
  Preparing := true;
  ChoosePartRashPvlList(dePor.Date, FROM_ID, FROM_INST, TO_ID, TO_INST, ceNpType.Tag, mt);
  Preparing := false;
  PageControl.ActivePage := Summary;
end;
//==============================================================================
procedure TRashPvlForm.mtBeforePost(DataSet: TDataSet);
begin
  if Preparing then exit;
  ChangeDet(mt['part_id'], mt['part_inst'], mt.FieldByName('por_tonn').AsFloat - mt.FieldByName('c_por_tonn').AsFloat);
  mt['c_por_tonn'] := mt['por_tonn'];
end;
//==============================================================================
procedure TRashPvlForm.FormCreate(Sender: TObject);
begin
  inherited;
  SL_PRD_ID := TStringList.Create;
  SL_DELETED := TStringList.Create;
  mt.Open;
  mt1.Open;
end;
//==============================================================================
procedure TRashPvlForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  SL_PRD_ID.Free;
  SL_DELETED.Free;
end;
//==============================================================================
procedure TRashPvlForm.mt1AfterPost(DataSet: TDataSet);
begin
  inherited;
  if SL_PRD_ID.IndexOf(mt1['prih_det_id']) = -1 then
    SL_PRD_ID.Add(mt1['prih_det_id']);
end;
//==============================================================================
procedure TRashPvlForm.ChangeDet(p_PartId, p_PartInst: integer; p_Diff: Double);
begin
  if p_Diff > 0 then AddDet(p_PartId, p_PartInst, p_Diff)
  else RemoveDet(p_PartId, p_PartInst, p_Diff);
end;
//==============================================================================
procedure TRashPvlForm.AddDet(p_PartId, p_PartInst: integer; p_Diff: Double);
var
  bmStart, bmEnd, bm, bm1: string;
  cnt, n, DetCnt: integer;
  rest, tonn: real;
  //**************************************************************************
  function FindDetCount(p_Tonn: real): integer;
  begin
    result := 0;
    qDet.First;
    while not qDet.Eof and (p_Tonn > 0.000001) do
    begin
      p_Tonn := p_Tonn - qDet.FieldByName('rest_full_tonn').AsFloat;
      inc(result);
      qDet.Next;
    end;
    qDet.First;
  end;
  //**************************************************************************
begin
  bm := mt1.Bookmark;
  FindDetPart(p_PartId, p_PartInst, bmStart, bmEnd, cnt);
  if cnt = 0 then
    mt1.Last
  else
  begin
    mt1.Bookmark := bmEnd;
    tonn := mt1.FieldByName('pr_tonn').AsFloat - mt1.FieldByName('por_tonn').AsFloat;
    p_Diff := p_Diff - tonn;
    mt1.Edit;
    mt1['por_tonn'] := mt1['pr_tonn'];
    mt1['c_por_tonn'] := mt1['por_tonn'];
    mt1.Post;
  end;

  qDet.Filtered := false;
  _OpenQueryPar(qDet, ['part_id', p_PartId, 'part_inst', p_PartInst]);
  qDet.Filtered := true;
  qDet.FetchAll := true;

  bm1 := mt1.Bookmark;
  DetCnt := FindDetCount(p_Diff);
  MoveDownMemoryTable(mt1, bm1, DetCnt);

  n := 1;
  while p_Diff > 0.000001 do
  begin
    rest := qDet['rest_full_tonn'];
    tonn := min(p_Diff, rest);
    mt1.Edit;
    CopyToMemoryTableOne(qDet, mt1,
      'gtd_id,gtd_inst,part_id,part_inst,full_count:pr_real_tonn,rest_full_tonn:pr_tonn,' +
      'np_count:pr_netto,water_count:pr_water,' +
      'r_por_tonn:por_tonn,' +
      'part_name,gtd_num,r_por_tonn:c_por_tonn,' +
      'tank_num,zd_nakl,' +
      'det_id:prih_det_id,det_inst:prih_det_inst,rez_id,rez_inst,rez_num');
    mt1['por_tonn'] := tonn;
    mt1['c_por_tonn'] := tonn;
    if qDet.RecordCount = n then mt1['is_closed'] := 'Y';
    mt1.Post;
    mt1.Next;
    qDet.Next;
    inc(n);
    p_Diff := p_Diff - tonn;
  end;
  mt1.BookMark := bm;
  mt['c_por_tonn'] := mt['por_tonn'];
end;
//==============================================================================
procedure TRashPvlForm.RemoveDet(p_PartId, p_PartInst: integer; p_Diff: Double);
var
  bm, bmStart, bmEnd: string;
  cnt, n, i: integer;
  por_tonn: real;
begin
  FindDetPart(p_PartId, p_PartInst, bmStart, bmEnd, cnt);
  if cnt = 0 then exit;
  p_Diff := abs(p_Diff);
  mt1.DisableControls;
  try
    mt1.Bookmark := bmEnd;
    n := 0;
    while not mt1.Bof and (mt1.RecordCount > 0) and (p_Diff > 0)
      and (mt1['part_id'] = p_PartId) and (mt1['part_inst'] = p_PartInst) do
    begin
      por_tonn := mt1.FieldByName('por_tonn').AsFloat;
      if por_tonn <= p_Diff then
      begin
        p_Diff := p_Diff - por_tonn;
        mt1.Prior;
        inc(n);
      end
      else
      begin
        mt1.Edit;
        mt1['por_tonn'] := por_tonn - p_Diff;
        mt1['c_por_tonn'] := por_tonn - p_Diff;
        mt1.Post;
        p_Diff := 0;
      end;
    end;
    mt1.Next;
    for i := 1 to n do
    begin
      bm := mt1.BookMark;
      mt1.Delete;
      if i <> n then mt1.Bookmark := bm;
    end;
  finally
    mt1.EnableControls;
  end;
end;
//==============================================================================
procedure TRashPvlForm.FindDetPart(p_PartId, p_PartInst: integer;
  var pp_Start, pp_End: string; var pp_Count: integer);
var
  bm: string;
  IsEqual: Boolean;
begin
  pp_Start := '';
  pp_End := '';
  pp_Count := 0;
  mt1.DisableControls;
  bm := mt1.BookMark;
  try
    mt1.First;
    while not mt1.Eof do
    begin
      Isequal := (mt1['part_id'] = p_PartId) and (mt1['part_inst'] = p_PartInst);
      if IsEqual then
      begin
        inc(pp_Count);
        if pp_Start = '' then
          pp_Start := mt1.Bookmark;
        pp_End := mt1.Bookmark;
      end
      else
      begin
        if pp_Start <> '' then
          exit;
      end;
      mt1.Next;
    end;
  finally
    mt1.BookMark := bm;
    mt1.EnableControls;
  end;
end;
//==============================================================================
procedure TRashPvlForm.mt1BeforeDelete(DataSet: TDataSet);
var n: integer;
begin
  inherited;
  n := SL_PRD_ID.IndexOf(mt1['prih_det_id']);
  if n <> -1 then SL_PRD_ID.Delete(n);
  if not mt1.FieldByName('det_id').IsNull then
    SL_DELETED.Add(Format('%s,%s', [mt1['det_id'], mt1['det_inst']]));
end;
//==============================================================================
procedure TRashPvlForm.qDetFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept := SL_PRD_ID.IndexOf(DataSet['det_id']) = -1;
end;
//==============================================================================
procedure TRashPvlForm.dbg1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if (mt1['pr_tonn'] = mt1['por_tonn']) and (Column.FieldName = 'POR_TONN') then
    AFont.Color := clBlue;
  if (mt1['is_closed'] = 'Y') and (Column.FieldName = 'POR_TONN') then
    AFont.Color := clGreen;
end;
//==============================================================================
procedure TRashPvlForm.mt1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  mt1['is_closed'] := 'N';
  mt1['det_inst'] := INST;
end;
//==============================================================================
procedure TRashPvlForm.sbDelClick(Sender: TObject);
begin
  inherited;
  if PageControl.ActivePage = Summary then
    if MessageDlgExt(TranslateText('Вы правда хотите удалить приход со всеми цистернами?'),
      mtConfirmation, [TranslateText('Да'), TranslateText('Нет')]) = 1 then
      mt.Delete;
end;
//==============================================================================
procedure TRashPvlForm.mtBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if Preparing then exit;
  DeleteDetPart(mt['part_id'], mt['part_inst']);
end;
//==============================================================================
procedure TRashPvlForm.DeleteDetPart(p_PartId, p_PartInst: integer);
var
  bmStart, bmEnd: string;
  i, cnt: integer;
begin
  mt1.DisableControls;
  try
    FindDetPart(p_PartId, p_PartInst, bmStart, bmEnd, cnt);
    if cnt = 0 then exit;
    mt1.BookMark := bmStart;
    for i := 1 to cnt do
    begin
      mt1.Delete;
      if i <> cnt then mt1.BookMark := bmStart;
    end;
  finally
    mt1.EnableControls;
  end;
end;
//==============================================================================
procedure TRashPvlForm.Save;
var
  i, n: integer;
  s, sId, sInst: string;
begin
  ID := DBSaver.SaveRecord('OIL_RASHPVL',
    ['id',           ID,
     'inst',         INST,
     'state',        'Y',
     'date_',        dePor.Date,
     'date_ship',    deShipDate.date,
     'numb',         edNum.Text,
     'from_id',      FROM_ID,
     'from_inst',    FROM_INST,
     'to_id',        TO_ID,
     'to_inst',      TO_INST,
     'otgr_type_id', ceType.Tag,
     'auto_id',      AUTO_ID,
     'auto_inst',    AUTO_INST,
     'rail_id',      RAIL_ID,
     'rail_inst',    RAIL_INST,
     'np_type',      ceNpType.Tag,
     'own_goods',    decode([cbTovarType.ItemIndex, 0, 'S', 1, 'O']),
     'pvl_categ_id', ceCateg.Tag]);
  mt1.DisableControls;
  try
    mt1.First;
    while not mt1.Eof do
    begin
      if not ((mt1['PART_NAME'] = '') and (mt1['TANK_NUM'] = '')) then
        DBSaver.SaveRecord('OIL_RASHPVL_DET',
          ['id',            mt1['det_id'],
           'inst',          nvl(mt1['det_inst'], INST),
           'state',         'Y',
           'rashpvl_id',    ID,
           'rashpvl_inst',  INST,
           'prih_det_id',   mt1['prih_det_id'],
           'prih_det_inst', mt1['prih_det_inst'],
           'gtd_id',        mt1['gtd_id'],
           'gtd_inst',      mt1['gtd_inst'],
           'part_id',       mt1['part_id'],
           'part_inst',     mt1['part_inst'],
           'rez_id',        mt1['rez_id'],
           'rez_inst',      mt1['rez_inst'],
           'por_tonn',      FRound(mt1.FieldByName('por_tonn').AsFloat, 3),
           'tonn',          FRound(mt1.FieldByName('netto').AsFloat, 3),
           'water',         FRound(mt1.FieldByName('water').AsFloat, 3),
           'is_closed',     mt1['is_closed']]);
      mt1.Next;
    end;
    mt1.First;

    for i := 0 to SL_DELETED.Count - 1 do
    begin
      s := SL_DELETED[i];
      n := pos(',', s);
      sId := copy(s, 1, n - 1);
      sInst := copy(s, n + 1, length(s));
      DBSaver.SetState('OIL_RASHPVL_DET', StrToInt(sId), StrToInt(sInst), 'N');
    end;
  finally
    mt1.EnableControls;
  end;
end;
//==============================================================================
procedure TRashPvlForm.Test;
begin
  if FROM_ID = 0 then
    raise exception.create(TranslateText('Не определен отправитель'));
  if TO_ID = 0 then
    raise exception.create(TranslateText('Не определен получатель'));
  if ceNpType.Tag = 0 then
    raise exception.create(TranslateText('Не определен тип НП'));
  if edNum.Text = '' then
    raise exception.create(TranslateText('Не определен номер поручения'));
  if dePor.Date = 0 then
    raise exception.create(TranslateText('Не определена дата поручения'));
  if ceType.Tag = 0 then
    raise exception.create(TranslateText('Не определен тип отгрузки'));
  if AUTO_ID = 0 then
    raise exception.create(TranslateText('Не определено транспортное средство'));
  if RAIL_ID = 0 then
    raise exception.create(TranslateText('Не определено место отгрузки'));
  if ceCateg.Tag = 0 then
    raise exception.create(TranslateText('Не определена категория товара'));
  if cbTovarType.Text = '' then
    raise exception.create(TranslateText(''));
  if cbShipped.Checked and (deShipDate.Date = 0) then
    raise exception.create(TranslateText('Не определена дата отгрузки'));
  if mt.RecordCount = 0 then
    raise exception.create(TranslateText('Не внесена ниодна партия'));
end;
//==============================================================================
procedure TRashPvlForm.clcNettoChange(Sender: TObject);
begin
  if Preparing then exit;
  Preparing := true;
  clcBrutto.Value := clcNetto.Value + clcWater.Value;
  Preparing := false;
end;
//==============================================================================
procedure TRashPvlForm.clcBruttoChange(Sender: TObject);
begin
  if Preparing then exit;
  Preparing := true;
  clcNetto.Value := clcBrutto.Value - clcWater.Value;
  Preparing := false;
end;
//==============================================================================
procedure TRashPvlForm.clcWaterChange(Sender: TObject);
begin
  if Preparing then exit;
  Preparing := true;
  clcBrutto.Value := clcNetto.Value + clcWater.Value;
  Preparing := false;
end;
//==============================================================================
procedure TRashPvlForm.spdDistributeClick(Sender: TObject);
begin
  DistributeOtgr(clcNetto.Value, clcWater.Value);
  CreatePartListByDet;
end;
//==============================================================================
procedure TRashPvlForm.DistributeOtgr(p_Netto, p_Water: Double);
var
  bm: string;
  netto, water, brutto, pr_brutto, pr_netto, pr_water: real;
begin
  bm := mt1.Bookmark;
  mt1.DisableControls;
  try
    mt1.First;
    while (p_Netto > 0.000001) and not mt1.Eof do
    begin
      pr_brutto := min(mt1.FieldByName('pr_real_tonn').AsFloat, mt1.FieldByName('por_tonn').AsFloat);
      if mt1.FieldByName('pr_real_tonn').AsFloat <> 0 then
      begin
        pr_netto := FRound(mt1.FieldByName('pr_netto').AsFloat * pr_brutto / mt1.FieldByName('pr_real_tonn').AsFloat, 3);
        pr_water := FRound(mt1.FieldByName('pr_water').AsFloat * pr_brutto / mt1.FieldByName('pr_real_tonn').AsFloat, 3);
      end
      else
      begin
        pr_netto := FRound(mt1.FieldByName('pr_netto').AsFloat * pr_brutto / 1, 3);
        pr_water := FRound(mt1.FieldByName('pr_water').AsFloat * pr_brutto / 1, 3);
      end;

      netto := min(pr_netto, p_Netto);
      if p_Netto < pr_netto then
        water := FRound(pr_water * p_Netto / pr_netto, 3)
      else water := min(pr_water, p_Water);
      brutto := netto + water;

      mt1.Edit;
      mt1['netto'] := netto;
      mt1['water'] := water;
      mt1['brutto'] := brutto;
      mt1['c_netto'] := netto;
      mt1['c_water'] := water;
      mt1['c_brutto'] := brutto;
      mt1.Post;
      mt1.Next;
      p_Netto := p_Netto - netto;
      p_Water := p_Water - water;
    end;
    while not mt1.Eof do
    begin
      mt1.Edit;
      mt1['netto'] := 0;
      mt1['water'] := 0;
      mt1['brutto'] := 0;
      mt1['c_netto'] := 0;
      mt1['c_water'] := 0;
      mt1['c_brutto'] := 0;
      mt1.Post;
      mt1.Next;
    end;
  finally
    mt1.Bookmark := bm;
    mt1.EnableControls;
  end;
end;
//==============================================================================
procedure TRashPvlForm.cbShippedClick(Sender: TObject);
begin
  SetEnabled;
end;
//==============================================================================
procedure TRashPvlForm.cbTovarTypeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key := #0;
end;
//==============================================================================
procedure TRashPvlForm.CreatePartListByDet;
var
  bm, bmStart, bmEnd: string;
  i, cnt: integer;
  pr, pr_real, por, netto, brutto, water: real;
  sumnetto, sumbrutto, sumwater: real;
  //****************************************************************************
  procedure Zero;
  begin
    pr := 0;
    pr_real := 0;
    por := 0;
    brutto := 0;
    netto := 0;
    water := 0;
  end;
  //****************************************************************************
begin
  Preparing := true;
  mt.EmptyTable;
  mt1.DisableControls;
  bm := mt1.Bookmark;
  sumnetto := 0;
  sumbrutto := 0;
  sumwater := 0;
  if mt1.RecordCount = 0 then exit;
  try
    zero;
    mt1.First;
    while not mt1.Eof do
    begin
      mt.Insert;
      CopyToMemoryTableOne(mt1, mt, 'gtd_id,gtd_inst,gtd_num,part_id,part_inst,part_name');
      FindDetPart(mt1['part_id'], mt1['part_inst'], bmStart, bmEnd, cnt);
      for i := 1 to cnt do
      begin
        pr := pr + mt1['pr_tonn'];
        pr_real := pr_real + mt1['pr_real_tonn'];
        por := por + mt1['por_tonn'];
        netto := netto + mt1['netto'];
        water := water + mt1['water'];
        brutto := brutto + mt1['brutto'];
        sumnetto := sumnetto + mt1['netto'];
        sumbrutto := sumbrutto + mt1['brutto'];
        sumwater := sumwater + mt1['water'];
        mt1.Next;
      end;
      mt['por_tonn'] := por;
      mt['netto'] := netto;
      mt['water'] := water;
      mt['brutto'] := brutto;
      mt['c_por_tonn'] := por;
      mt['c_netto'] := netto;
      mt['c_water'] := water;
      mt['c_brutto'] := brutto;
      mt.Post;
      Zero;
    end;
    dbg.SumList.RecalcAll;
    clcNetto.Value := sumnetto;
    clcBrutto.Value := sumBrutto;
    clcWater.Value := sumWater;
    cbShipped.Checked := sumbrutto <> 0;
    VagonsChanged := false;
    FillPartRest;
  finally
    mt1.EnableControls;
    mt1.Bookmark := bm;
    Preparing := false;
  end;
end;
//==============================================================================
procedure TRashPvlForm.Panel2DblClick(Sender: TObject);
begin
  inherited;
  CreatePartListByDet;
end;
//==============================================================================
procedure TRashPvlForm.PageControlChange(Sender: TObject);
begin
  inherited;
  if PageControl.ActivePage = Vagons then
  begin
    if (mt.State in [dsInsert, dsEdit]) then mt.Post;
  end
  else
    if PageControl.ActivePage = Summary then
    begin
      if VagonsChanged then
        CreatePartListByDet;
    end;
end;
//==============================================================================
procedure TRashPvlForm.mt1BeforePost(DataSet: TDataSet);
begin
  inherited;
  if Preparing then exit;
  if MtValuesChanged(mt1, 'C_', true) then
    VagonsChanged := true;
end;
//==============================================================================
procedure TRashPvlForm.N3Click(Sender: TObject);
var
  bm: string;
begin
  bm := mt.Bookmark;
  mt.DisableControls;
  try
    mt.First;
    while not mt.Eof do
    begin
      mt.Edit;
      mtPOR_TONN.AsFloat := mtPR_TONN.AsFloat;
      mtC_POR_TONN.AsFloat := mtPR_TONN.AsFloat;
      mt.Post;
      mt.Next;
    end;
  finally
    mt.Bookmark := bm;
    mt.EnableControls;
  end;
end;
//==============================================================================
procedure TRashPvlForm.FillPartRest;
begin
  mt.First;
  while not mt.Eof do
  begin
    _OpenQueryParOra(qPartSum,
      ['part_id',   mt['part_id'],
       'part_inst', mt['part_inst'],
       'id',        ID,
       'inst',      INST]);
    mt.Edit;
    mt['pr_real_tonn'] := qPartSum['full_count'];
    mt['pr_tonn'] := qPartSum['rest_full_tonn2'];
    mt.Post;
    mt.Next;
  end;
  mt.First;
end;
//==============================================================================
procedure TRashPvlForm.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  PutGridEhToExcel(dbg1, '', 'PR_REAL_TONN,PR_TONN,POR_TONN');
end;
//==============================================================================

end.
