unit E_Plan;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, RxLookup, Mask, ToolEdit, Db, DBTables, RxMemDS,
  Grids, DBGridEh, Buttons, ExtCtrls, MemTable, uCommonForm, E_CurRate,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess, CurrEdit;

type
  TE_PlanForm = class(TCommonForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    gridDet: TDBGridEh;
    dsPlanDet: TOraDataSource;
    qWork: TOilQuery;
    Panel4: TPanel;
    Panel3: TPanel;
    cbM: TComboBox;
    Label1: TLabel;
    Panel5: TPanel;
    Label5: TLabel;
    Panel6: TPanel;
    qTestDate: TOilQuery;
    BitBtn1: TBitBtn;
    mdPlanDet: TMemoryTable;
    mdPlanDetE_BUDGET_ID: TFloatField;
    mdPlanDetBUDGET_NAME: TStringField;
    mdPlanDetACTIVITY_NAME: TStringField;
    mdPlanDetSUMMA: TFloatField;
    mdPlanDetITEM_COMMENTS: TStringField;
    mdPlanDetID: TFloatField;
    reComments: TRichEdit;
    cbY: TComboBox;
    mdPlanDetBUD_NAME: TStringField;
    cbCurrency: TComboBox;
    Label2: TLabel;
    ceCurSumm: TRxCalcEdit;
    Label3: TLabel;
    mdPlanDetSUMMA_WITH_CUR: TFloatField;
    function TestSave: boolean;
    procedure Save;
    procedure bbOkClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ceCurSummChange(Sender: TObject);
    procedure cbCurrencyChange(Sender: TObject);
    procedure mdPlanDetBeforePost(DataSet: TDataSet);
  private
  public
    Id: integer;
    DateBegin, DateEnd: TDateTime;
  end;

var
  E_PlanForm: TE_PlanForm;

function AddPlan: TModalResult;
function EditPlan(p_ID, p_INST: integer): TModalResult;

implementation

{$R *.DFM}

uses UDbFunc, ExFunc, ExcelFunc, E_Var, Main, OilStd, MoneyFunc, uStart;

//==============================================================================
function AddPlan: TModalResult;
var
  F: TE_PlanForm;
  Day, Month, Year: word;
begin
  F := TE_PlanForm.Create(Application);
  F.id := 0;
  // получаем пустой список бюджетных статей
  F.qWork.SQL.Text :=
    ' select 0 as id, e_budget_id, budget_name, activity_name, 0 as summa, 0 as summa_with_cur, ' +
    '  lpad('' '', 1) as item_comments, bud_name from ve_budget order by e_budget_id ';
  _OpenQuery(F.qWork);
  CopyToMemoryTable(F.qWork, F.mdPlanDet);
  F.mdPlanDet.First;
  F.qWork.Close;
  F.qWork.UnPrepare;
  F.qWork.Fields.Clear;
  F.qWork.Sql.Text := 'select max(date_end) as date_end from ve_plan ';
  F.qWork.Open;
  OpenCurrency(F.cbCurrency, 2, true);
  F.ceCurSumm.Value := 0;
  if not F.qWork.FieldByName('date_end').IsNull then
  begin
    DecodeDate(F.qWork.FieldByName('date_end').AsDateTime, Year, Month, Day);
    if Month = 12 then
    begin
      Month := 1;
      inc(Year);
    end
    else inc(Month);
    F.cbM.ItemIndex := Month-1;
    F.cbY.ItemIndex := Year-2006;
  end;
  case F.cbCurrency.ItemIndex of
    0:
      begin
        F.gridDet.FieldColumns['SUMMA'].Title.Caption := 'Сумма (грн.)';
        F.gridDet.FieldColumns['SUMMA_WITH_CUR'].Title.Caption := 'Сумма ($)';
      end;
    1:
      begin
        F.gridDet.FieldColumns['SUMMA'].Title.Caption := 'Сумма ($)';
        F.gridDet.FieldColumns['SUMMA_WITH_CUR'].Title.Caption := 'Сумма (грн.)';
      end;
  end;
  result := F.ShowModal;
  F.Free;
end;
//==============================================================================
function EditPlan(p_ID, p_INST: integer): TModalResult;
var
  Year, Month, Day: word;
  F: TE_PlanForm;
begin
  F := TE_PlanForm.Create(Application);
  F.Id := p_ID;
  F.cbM.Enabled := FALSE;
  F.cbY.Enabled := FALSE;
  F.qWork.Sql.Text :=
    ' select v.*,plan_det_id as id, 0 as summa_with_cur from ve_plan v '+
    ' where plan_id = '+ IntToStr(p_ID) +' and plan_inst = '+ IntToStr(p_INST) +' '+
    ' order by e_budget_id ';
  _OpenQuery(F.qWork);
  OpenCurrency(F.cbCurrency, F.qWork.FieldByName('currency_id').AsInteger, true);
  DecodeDate(F.qWork.FieldByName('date_end').Value, Year, Month, Day);
  F.cbM.ItemIndex := Month-1;
  F.cbY.ItemIndex:= Year-2006;
  F.reComments.Text := F.qWork.FieldByName('comments').AsString;
  CopyToMemoryTable(F.qWork, F.mdPlanDet, 'id,e_budget_id,budget_name,activity_name,' +
    'summa,summa_with_cur,item_comments,bud_name');
  F.mdPlanDet.First;
  case F.cbCurrency.ItemIndex of
    0:
      begin
        F.gridDet.FieldColumns['SUMMA'].Title.Caption := 'Сумма (грн.)';
        F.gridDet.FieldColumns['SUMMA_WITH_CUR'].Title.Caption := 'Сумма ($)';
      end;
    1:
      begin
        F.gridDet.FieldColumns['SUMMA'].Title.Caption := 'Сумма ($)';
        F.gridDet.FieldColumns['SUMMA_WITH_CUR'].Title.Caption := 'Сумма (грн.)';
      end;
  end;
  F.ceCurSumm.Value := F.qWork.FieldByName('currency_summ').AsInteger;
  result := F.ShowModal;
  F.Free;
end;
//==============================================================================
function TE_PlanForm.TestSave: boolean;
begin
  result := false;
  if cbM.ItemIndex = -1 then
  begin
    MessageDlg(TranslateText('Не определен месяц!'), mtError, [mbOk], 0);
    result := true;
    exit;
  end;
  if cbY.ItemIndex = -1 then
  begin
    MessageDlg(TranslateText('Не определен год!'), mtError, [mbOk], 0);
    result := true;
    exit;
  end;
  if ceCurSumm.Value <= 0 then
  begin
    MessageDlg(TranslateText('Не определен курс!'), mtError, [mbOk], 0);
    result := true;
    exit;
  end;
  if Id <> 0 then exit;
  if qTestDate.Active then qTestDate.Close;
  qTestDate.ParamByName('date1').Value := DateBegin;
  qTestDate.ParamByName('date2').Value := DateEnd;
  qTestDate.Open;
  if qTestDate.FieldByName('numb').AsInteger > 0 then
  begin
    MessageDlg(TranslateText('Уже существует план за выбранный период!'), mtError, [mbOk], 0);
    result := true;
    exit;
  end;
end;
//==============================================================================
procedure TE_PlanForm.Save;
begin
  try
    GetMonthLimits(cbM.ItemIndex+1, StrToInt(cbY.Text), DateBegin, DateEnd);
    if TestSave then exit;
    StartSQLOra;
    Id := DBSaver.SaveRecord('E_PLAN',
      ['ID',            Id,
       'STATE',         'Y',
       'INST',          INST,
       'CURRENCY_ID',   cbCurrency.ItemIndex+1,
       'CURRENCY_SUMM', ceCurSumm.Value,
       'DATE_BEGIN',    DateBegin,
       'DATE_END',      DateEnd,
       'NAME',          cbM.Text+' '+cbY.Text,
       'COMMENTS',      reComments.Text]);

    gridDet.DataSource.DataSet.DisableControls;
    mdPlanDet.First;
    while not mdPlanDet.Eof do
    begin
      DBSaver.SaveRecord('E_PLAN_DET',
        ['ID',            mdPlanDetId.AsInteger,
         'STATE',         'Y',
         'INST',          INST,
         'E_BUDGET_ID',   mdPlanDet.FieldByName('e_budget_id').Value,
         'SUMMA',         FRound(mdPlanDet.FieldByName('summa').Value),
         'E_PLAN_ID',     Id,
         'COMMENTS',      mdPlanDet.FieldByName('item_comments').Value]);
      mdPlanDet.Next;
    end;
    gridDet.DataSource.DataSet.EnableControls;

    CommitSQLOra;
    ModalResult := mrOk;
  except on E: Exception do
    raise exception.create(E.Message);
  end;
end;
//==============================================================================
procedure TE_PlanForm.bbOkClick(Sender: TObject);
begin
  Save;
end;
//==============================================================================
procedure TE_PlanForm.BitBtn1Click(Sender: TObject);
begin
  gridDet.DataSource.DataSet.DisableControls;
  PutGridEhToExcel(gridDet, TranslateText('Бюджетный план за ') + cbM.Text + ' ' + cbY.Text, 'SUMMA');
  gridDet.DataSource.DataSet.EnableControls;
end;
//==============================================================================
procedure TE_PlanForm.FormCreate(Sender: TObject);
var
  i, day, month, year: word;
begin
  inherited;
  cbY.Items.Clear;
  DecodeDate(Date, year, month, day);
  for i := 2006 to year+1 do
    cbY.Items.Add(IntToStr(i));
end;
//==============================================================================
procedure TE_PlanForm.ceCurSummChange(Sender: TObject);
begin
  if ceCurSumm.Value < 0 then
  begin
    ceCurSumm.Value := 0;
    MessageDlg(TranslateText('Курс не может быть меньше нуля!'), mtError, [mbOk], 0);
  end
  else cbCurrencyChange(nil);
end;
//==============================================================================
procedure TE_PlanForm.cbCurrencyChange(Sender: TObject);
var
  BM: TBookMark;
begin
  BM := mdPlanDet.GetBookMark;
  case cbCurrency.ItemIndex of
    0:
      begin
        gridDet.FieldColumns['SUMMA'].Title.Caption := 'Сумма (грн.)';
        gridDet.FieldColumns['SUMMA_WITH_CUR'].Title.Caption := 'Сумма ($)';
        gridDet.DataSource.DataSet.DisableControls;
        mdPlanDet.First;
        while not mdPlanDet.Eof do
        begin
          mdPlanDet.Edit;        
          mdPlanDet.Post;
          mdPlanDet.Next;
        end;
        gridDet.DataSource.DataSet.EnableControls;
      end;
    1:
      begin
        gridDet.FieldColumns['SUMMA'].Title.Caption := 'Сумма ($)';
        gridDet.FieldColumns['SUMMA_WITH_CUR'].Title.Caption := 'Сумма (грн.)';
        gridDet.DataSource.DataSet.DisableControls;
        mdPlanDet.First;
        while not mdPlanDet.Eof do
        begin
          mdPlanDet.Edit;
          mdPlanDet.Post;
          mdPlanDet.Next;
        end;
        gridDet.DataSource.DataSet.EnableControls;
      end;
  end;
  if mdPlanDet.BookmarkValid(BM) then mdPlanDet.GotoBookMark(BM);
  mdPlanDet.FreeBookMark(BM);
end;
//==============================================================================
procedure TE_PlanForm.mdPlanDetBeforePost(DataSet: TDataSet);
begin
  if ceCurSumm.Value <> 0 then
    mdPlanDet.FieldByName('SUMMA_WITH_CUR').AsFloat := decode([cbCurrency.ItemIndex,
      0, mdPlanDet.FieldByName('SUMMA').AsFloat / ceCurSumm.Value,
         mdPlanDet.FieldByName('SUMMA').AsFloat * ceCurSumm.Value]);
end;
//==============================================================================

end.
