unit E_BillRef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBTables, Grids, DBGrids, RXDBCtrl, Buttons, Ora,
  Mask, ToolEdit, Menus, RXCtrls, E_Var, DBGridEh, RxLookup, uCommonForm,
  MemDS, DBAccess,uOilQuery,uOilStoredProc;

type
  TE_BillRefForm = class(TCommonForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    ds: TOraDataSource;
    Panel4: TPanel;
    Panel8: TPanel;
    deS: TDateEdit;
    dePo: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    bbClear: TBitBtn;
    bbSearch: TBitBtn;
    sbEdit: TSpeedButton;
    sbDel: TSpeedButton;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    sbAdd: TRxSpeedButton;
    QMD: TOilQuery;
    DBGridMain: TDBGridEh;
    Panel5: TPanel;
    ceDep: TComboEdit;
    sbClearDep: TSpeedButton;
    Label3: TLabel;
    lblSumm: TLabel;
    qB: TOilQuery;
    dsB: TOraDataSource;
    qBID: TFloatField;
    qBINST: TFloatField;
    qBRACH_CHET: TStringField;
    qBFACE_CHET: TStringField;
    qBMFO: TStringField;
    qBBANK_NAME: TStringField;
    qBORG_NAME: TStringField;
    qBORG_TYPE: TFloatField;
    qBOBL_ID: TFloatField;
    qBOBL_INST: TFloatField;
    Panel6: TPanel;
    Panel9: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    sbClearActivity: TSpeedButton;
    sbClearBudget: TSpeedButton;
    Label5: TLabel;
    sbClearNum: TSpeedButton;
    Label6: TLabel;
    sbClearComments: TSpeedButton;
    CEBudget: TComboEdit;
    CEActivity: TComboEdit;
    edNum: TEdit;
    edComments: TEdit;
    Panel10: TPanel;
    Label4: TLabel;
    sbClearOrg: TSpeedButton;
    ClearBank: TSpeedButton;
    ceOrg: TComboEdit;
    cbPlat: TCheckBox;
    cbPost: TCheckBox;
    RBKassa: TRadioButton;
    RBRs: TRadioButton;
    LEBank: TRxLookupEdit;
    Label9: TLabel;
    cbImpNoRaz: TCheckBox;
    cbImpRaz: TCheckBox;
    cbHand: TCheckBox;
    sbClearSpring: TSpeedButton;
    CESpring: TComboEdit;
    Label10: TLabel;
    sbClearPermit: TSpeedButton;
    CEPermit: TComboEdit;
    Label11: TLabel;
    sbClearObject: TSpeedButton;
    CEObject: TComboEdit;
    Label12: TLabel;
    qBNAME: TStringField;
    PUM: TPopupMenu;
    MI1: TMenuItem;
    rsbPrint: TRxSpeedButton;
    q: TOilQuery;
    qID: TFloatField;
    qINST: TFloatField;
    qOBL_NAME: TStringField;
    qNUMB: TStringField;
    qDATE_: TDateTimeField;
    qVR: TFloatField;
    qVD: TFloatField;
    qNOB: TFloatField;
    qNK: TFloatField;
    qSOURCE: TStringField;
    qDEBKR: TFloatField;
    qDEBKR_NAME: TStringField;
    qSUMM: TFloatField;
    qNDS: TFloatField;
    qSUMMBEZ: TFloatField;
    qCLIENT_ID: TFloatField;
    qCLIENT_INST: TFloatField;
    qCLIENT_NAME: TStringField;
    qCLIENT_OKPO: TStringField;
    qREKVIZIT_ID: TFloatField;
    qREKVIZIT_INST: TFloatField;
    qBANK_NAME: TStringField;
    qMFO: TStringField;
    qRACH_CHET: TStringField;
    qBUDGET_ID: TFloatField;
    qBUDGET_NAME: TStringField;
    qACTIVITY_ID: TFloatField;
    qACTIVITY_NAME: TStringField;
    qSPRING_ID: TFloatField;
    qSPRING_NAME: TStringField;
    qOBJECT_ID: TFloatField;
    qOBJECT_NAME: TStringField;
    qCOMMENTS: TStringField;
    procedure ActivateQ;
    procedure FormCreate(Sender: TObject);
    procedure ceDepButtonClick(Sender: TObject);
    procedure ceOrgButtonClick(Sender: TObject);
    procedure sbClearDepClick(Sender: TObject);
    procedure sbClearOrgClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure CEBudgetButtonClick(Sender: TObject);
    procedure CEActivityButtonClick(Sender: TObject);
    procedure sbClearBudgetClick(Sender: TObject);
    procedure sbClearActivityClick(Sender: TObject);
    procedure DeleteRecord;
    procedure bbClearClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure DBGridMainGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure cbPostClick(Sender: TObject);
    procedure cbPlatClick(Sender: TObject);
    procedure DBGridMainSortMarkingChanged(Sender: TObject);
    procedure sbClearCommentsClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure AutoCalcSelectedSumm;
    procedure LEBankKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RBKassaClick(Sender: TObject);
    procedure RBRsClick(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure ClearBankClick(Sender: TObject);
    procedure CESpringButtonClick(Sender: TObject);
    procedure sbClearSpringClick(Sender: TObject);
    procedure CEPermitButtonClick(Sender: TObject);
    procedure sbClearPermitClick(Sender: TObject);
    procedure CEObjectButtonClick(Sender: TObject);
    procedure sbClearObjectClick(Sender: TObject);
    procedure sbClearNumClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure DBGridMainMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure qBCalcFields(DataSet: TDataSet);
    procedure MI1Click(Sender: TObject);
  private
  public
    DepId, DepInst, OrgId, OrgInst: integer;
    OrderField, OrderDirection: string;
  end;

var
  E_BillRefForm: TE_BillRefForm;

function GetBudgetExt(var BudgetId: integer; var BudgetName: string; var ActivityId: integer;
  var ActivityName: string): Boolean;

implementation

uses ExFunc, E_Bill, ChooseOrg, Main, OilStd, UDbFunc, MoneyFunc, OraBaseDialog,
  uXMLForm, ExcelFunc;

{$R *.DFM}

//==============================================================================
procedure TE_BillRefForm.ActivateQ;
begin
  if q.Active then q.Close;
  q.SQL.Text := q.BaseSQL;
  if deS.Date > 0 then q.AddWhere(' date_ >= '''+ DateToStr(deS.Date) +'''');
  if dePo.Date > 0 then q.AddWhere(' date_ <= '''+ DateToStr(dePo.Date) +'''');
  q.AddWhere(' DebKr in ('+ GetConstructedString(['-1', '1'], [cbPlat.Checked,cbPost.Checked], ',', 'null') +') ');
  q.AddWhere(' Source in ('+ GetConstructedString(['''I''', '''E''', '''H'''], [cbImpNoRaz.Checked,
    cbImpRaz.Checked, cbHand.Checked], ',', 'null') +') ');
  if DepId <> 0 then q.AddWhere(' inst = ' + IntToStr(DepId));
  if OrgId <> 0 then q.AddWhere(' client_id = '+ IntToStr(OrgId) +' and client_inst = '+ IntToStr(OrgInst));
  if edNum.Text <> '' then q.AddWhere(' numb like ''%'+ edNum.Text +'%'' ');
  if CEActivity.Tag <> 0 then q.AddWhere(' activity_id = ' + IntToStr(CEActivity.Tag));
  if ceBudget.Tag <> 0 then q.AddWhere(' budget_id = '+ IntToStr(ceBudget.Tag));
  if CESpring.Tag <> 0 then q.AddWhere(' Spring_id = '+ IntToStr(CESpring.Tag));
  if CEPermit.Tag <> 0 then q.AddWhere(' Permit_id = '+ IntToStr(CEPermit.Tag));
  if CEObject.Tag <> 0 then q.AddWhere(' Object_id = '+ IntToStr(CEObject.Tag));
  if LEBank.Text <> '' then q.AddWhere(' rekvizit_id = '+ qB.FieldByName('id').AsString +
    ' and rekvizit_inst = '+ qB.FieldByName('inst').AsString)
  else
    if RBKassa.Checked then q.AddWhere(' rekvizit_id is null');
  if edComments.Text <> '' then q.AddWhere(' lower(comments) like ''%'+ RusLowerCase(edComments.Text) +'%'' ');
  q.SetOrderBy(OrderField +' '+ OrderDirection);
  _OpenQueryOra(q);
end;
//==============================================================================
procedure TE_BillRefForm.CEBudgetButtonClick(Sender: TObject);
var
  ActivityId, BudgetId: integer;
  ActivityName, BudgetName: string;
begin
  if GetBudgetExt(BudgetId, BudgetName, ActivityId, ActivityName) then
  begin
    ceBudget.Tag := BudgetId;
    CEBudget.Text := BudgetName;
    CEActivity.Tag := ActivityId;
    CEActivity.Text := ActivityName;
  end;
end;
//==============================================================================
procedure TE_BillRefForm.sbClearActivityClick(Sender: TObject);
begin
  CEActivity.Text := '';
  CEActivity.Tag := 0;
  CEBudget.Text := '';
  ceBudget.Tag := 0;
end;
//==============================================================================
procedure TE_BillRefForm.CEActivityButtonClick(Sender: TObject);
begin
  if XMLChoose('E_BudgetTypeRef', CEActivity) then
  begin
    CEBudget.Text := '';
    ceBudget.Tag := 0;
  end;
end;
//==============================================================================
procedure TE_BillRefForm.sbClearBudgetClick(Sender: TObject);
begin
  CEBudget.Text := '';
  ceBudget.Tag := 0;
end;
//==============================================================================
procedure TE_BillRefForm.CESpringButtonClick(Sender: TObject);
begin
  XMLChoose('E_SpringRef', CESpring);
end;
//==============================================================================
procedure TE_BillRefForm.sbClearSpringClick(Sender: TObject);
begin
  CESpring.Text := '';
  CESpring.Tag := 0;
end;
//==============================================================================
procedure TE_BillRefForm.CEPermitButtonClick(Sender: TObject);
begin
  XMLChoose('E_PermitRef', CEPermit);
end;
//==============================================================================
procedure TE_BillRefForm.sbClearPermitClick(Sender: TObject);
begin
  CEPermit.Text := '';
  CEPermit.Tag := 0;
end;
//==============================================================================
procedure TE_BillRefForm.CEObjectButtonClick(Sender: TObject);
begin
  XMLChoose('E_ObjectRef', CEObject);
end;
//==============================================================================
procedure TE_BillRefForm.sbClearObjectClick(Sender: TObject);
begin
  CEObject.Text := '';
  CEObject.Tag := 0;
end;
//==============================================================================
procedure TE_BillRefForm.FormCreate(Sender: TObject);
var
  i: integer;
begin
  inherited;
  SetCurrentMonth(deS, dePo);
  DepId := E_ORGINST;
  DepInst := E_ORGINST;
  ceDep.Text := E_ORGNAME;
  if DBGridMain.Columns.Count > 0 then
  begin
    OrderField := DBGridMain.Columns[0].FieldName;
    OrderDirection := '';
    DBGridMain.Columns[0].Title.SortMarker := smDownEh;
    for i := 0 to DBGridMain.Columns.Count-1 do
      DBGridMain.Columns[i].Title.TitleButton := TRUE;
  end;
  if qB.Active then
    qB.Close;
  qB.ParamByName('obl_id').AsInteger := E_ORGINST;
  _OpenQuery(qB);
  RBRsClick(nil);
  ActivateQ;
end;
//==============================================================================
procedure TE_BillRefForm.ceDepButtonClick(Sender: TObject);
var
  name: string;
begin
  if CaptureOrg(0, E_ORGINST, E_ORGINST, 'yyn', DepId, DepInst, name) then CEDep.Text := name;
end;
//==============================================================================
procedure TE_BillRefForm.ceOrgButtonClick(Sender: TObject);
var
  name: string;
begin
  if CaptureOrg(4, E_ORGINST, E_ORGINST, 'yyy', OrgId, OrgInst, name) then CEOrg.Text := name;
end;
//==============================================================================
procedure TE_BillRefForm.sbClearDepClick(Sender: TObject);
begin
  DepId := 0;
  DepInst := 0;
  ceDep.Text := '';
end;
//==============================================================================
procedure TE_BillRefForm.sbClearOrgClick(Sender: TObject);
begin
  OrgId := 0;
  OrgInst := 0;
  ceOrg.Text := '';
end;
//==============================================================================
procedure TE_BillRefForm.sbEditClick(Sender: TObject);
var
  BM: TBookMark;
begin
  if q.IsEmpty then exit;
  if EditBill(q.FieldByName('id').AsInteger, q.FieldByName('inst').AsInteger) = mrOk then
  begin
    BM := q.GetBookMark;
    q.DisableControls;
    ActivateQ;
    q.EnableControls;
    if q.BookmarkValid(BM) then q.GotoBookMark(BM);
    q.FreeBookMark(BM);
  end;
end;
//==============================================================================
procedure TE_BillRefForm.bbSearchClick(Sender: TObject);
begin
  ActivateQ;
end;
//==============================================================================
procedure TE_BillRefForm.DeleteRecord;
begin
  try
    StartSQL;
    if QMD.Active then QMD.CLose;
    QMD.SQL.Text :=
      ' update e_bill set state=''N'' where id = ' + qId.AsString + ' and inst = ' + qInst.AsString;
    QMD.ExecSQL;
    QMD.SQL.Text :=
      ' update e_bill_filials set state=''N'' where e_bill_id = ' + qId.AsString + ' and inst = ' + qInst.AsString;
    QMD.ExecSQL;
    CommitSQL;
  except
    RollBackSQL;
    showmessage(TranslateText('Не удалось удалить запись!!!'));
  end;
end;
//==============================================================================
procedure TE_BillRefForm.bbClearClick(Sender: TObject);
begin
  deS.Date := 0;
  dePo.Date := 0;
  sbClearActivity.Click;
  sbClearBudget.Click;
  sbClearComments.Click;
  sbClearObject.Click;
  sbClearPermit.Click;
  sbClearSpring.Click;
  sbClearOrg.Click;
  sbClearNum.Click;
end;
//==============================================================================
procedure TE_BillRefForm.sbAddClick(Sender: TObject);
begin
  AddBill;
  ActivateQ;
end;
//==============================================================================
procedure TE_BillRefForm.DBGridMainGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if (q.FieldByName('source').AsString = 'I') then AFont.Color := clPurple;
end;
//==============================================================================
procedure TE_BillRefForm.cbPostClick(Sender: TObject);
begin
  if not cbPost.Checked then cbPlat.Checked := TRUE;
end;
//==============================================================================
procedure TE_BillRefForm.cbPlatClick(Sender: TObject);
begin
  if not cbPlat.Checked then cbPost.Checked := TRUE;
end;
//==============================================================================
procedure TE_BillRefForm.DBGridMainSortMarkingChanged(Sender: TObject);
var
  i: Integer;
begin
  with DBGridMain do
    for i := 0 to SortMarkedColumns.Count-1 do
      if SortMarkedColumns[i].Title.SortMarker = smDownEh then
      begin
        OrderField := SortMarkedColumns[i].FieldName;
        OrderDirection := '';
        break;
      end
      else
        if SortMarkedColumns[i].Title.SortMarker = smUpEh then
        begin
          OrderField := SortMarkedColumns[i].FieldName;
          OrderDirection := 'DESC';
          break;
        end;
  ActivateQ;
end;
//==============================================================================
procedure TE_BillRefForm.sbClearNumClick(Sender: TObject);
begin
  edNum.Text := '';
end;
//==============================================================================
procedure TE_BillRefForm.sbClearCommentsClick(Sender: TObject);
begin
  edComments.Text := '';
end;
//==============================================================================
procedure TE_BillRefForm.sbDelClick(Sender: TObject);
var
  i: integer;
begin
  if q.IsEmpty then exit;
  if MessageDlg(TranslateText('Вы действительно хотите удалить выделенные записи?'),
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;
  if DBGridMain.SelectedRows.Count = 0 then DeleteRecord
  else
    for i := 0 to DBGridMain.SelectedRows.Count-1 do
    begin
      q.GotoBookmark(pointer(DBGridMain.SelectedRows[i]));
      DeleteRecord;
    end;
  ActivateQ;
end;
//==============================================================================
procedure TE_BillRefForm.AutoCalcSelectedSumm;
var
  sum: real;
  BM: TBookMark;
  i: integer;
begin
  if q.RecordCount = 0 then exit;
  sum := 0;
  BM := q.GetBookmark;
  for i := 0 to DBGridMain.SelectedRows.Count-1 do
  begin
    q.GotoBookmark(pointer(DBGridMain.SelectedRows[i]));
    sum := sum + q.FieldByName('summ').AsFloat;
  end;
  if q.BookmarkValid(BM) then q.GotoBookMark(BM);
  q.FreeBookmark(BM);
  lblSumm.Caption := TranslateText('Сумма: ') + FloatToStr(FRound(sum)) + TranslateText(' грн.');
end;
//==============================================================================
procedure TE_BillRefForm.LEBankKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;
//==============================================================================
procedure TE_BillRefForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;
//==============================================================================
procedure TE_BillRefForm.RBKassaClick(Sender: TObject);
begin
  LEBank.Text := '';
end;
//==============================================================================
procedure TE_BillRefForm.RBRsClick(Sender: TObject);
begin
  LEBank.Text := qB.FieldByName('name').AsString;
end;
//==============================================================================
procedure TE_BillRefForm.Panel2Click(Sender: TObject);
begin
  if debugging then ShowTextInMemo(FullSqlTextOra(q));
end;
//==============================================================================
procedure TE_BillRefForm.ClearBankClick(Sender: TObject);
begin
  LEBank.Text := '';
end;
//==============================================================================
function GetBudgetExt(var BudgetId: integer; var BudgetName: string; var ActivityId: integer;
  var ActivityName: string): Boolean; // стаття бюджету і тип статті бюджету
var
  id: integer;
  q: TOilQuery;
begin
  result := false;
  XMLChoose('E_BudgetRef', id);
  q := TOilQuery.Create(Application);
  q.SQL.Text :=
    ' select e_budget_id as id, budget_name, e_activity_id, activity_name from ve_budget ' +
    ' where e_budget_id = ' + IntToStr(id);
  q.Open;
  if not q.IsEmpty then
  begin
    BudgetId := q.FieldByName('id').AsInteger;
    BudgetName := q.FieldByName('budget_name').AsString;
    ActivityId := q.FieldByName('e_activity_id').AsInteger;
    ActivityName := q.FieldByName('activity_name').AsString;
    result := true;
  end;
  q.Close;
  q.Free;
end;
//==============================================================================
procedure TE_BillRefForm.bbCancelClick(Sender: TObject);
begin
  close;
end;
//==============================================================================
procedure TE_BillRefForm.DBGridMainMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  AutoCalcSelectedSumm;
end;
//==============================================================================
procedure TE_BillRefForm.qBCalcFields(DataSet: TDataSet);
begin
  qB.FieldByName('Name').AsString := qB.FieldByName('Rach_Chet').AsString + ' ' + qB.FieldByName('Bank_Name').AsString;
  if qB.FieldByName('Org_Type').AsInteger = 3 then
    qB.FieldByName('Name').AsString := GetShortPponName(qB.FieldByName('Org_Name').AsString) + qB.FieldByName('Name').AsString;
  LEBank.DropDownWidth := Length(qB.FieldByName('Name').AsString)*8;
end;
//==============================================================================
procedure TE_BillRefForm.MI1Click(Sender: TObject);
begin
  DBGridMain.DataSource.DataSet.DisableControls;
  PutGridEhToExcel(DBGridMain, TranslateText('Справочник оплат и поступлений'), 'SUMM,NDS,SUMMBEZ');
  DBGridMain.DataSource.DataSet.EnableControls;
end;
//==============================================================================

end.
