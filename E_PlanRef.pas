unit E_PlanRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGridEh, Buttons, StdCtrls,
  ExtCtrls, Mask, ToolEdit, ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess;

type
  TE_PlanRefForm = class(TBaseForm)
    Label2: TLabel;
    edPeriod: TEdit;
    sbClearPeriod: TSpeedButton;
    qPLAN_ID: TFloatField;
    qPLAN_INST: TFloatField;
    qPLAN_NAME: TStringField;
    qSUMMA: TFloatField;
    qCOMMENTS: TStringField;
    qDEP_NAME: TStringField;
    cbM: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    cbY: TComboBox;
    qCURRENCY_NAME: TStringField;
    qCURRENCY_SUMM: TFloatField;
  procedure ActivateQ;
    procedure bbSearchClick(Sender: TObject);
    procedure sbClearPeriodClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
  private
  public
  end;

var
  E_PlanRefForm: TE_PlanRefForm;

implementation

{$R *.DFM}

uses ChooseOrg, E_Var, ExFunc, E_Plan, Main, OilStd, UDbFunc, uStart;

//==============================================================================
procedure TE_PlanRefForm.ActivateQ;
begin
  if q.Active then q.Close;
  q.SQL.Text := q.BaseSQL;
  if edPeriod.Text <> '' then q.AddWhere(' lower(plan_name) like ''%'+ RusLowerCase(edPeriod.Text) +'%'' ');
  if cbM.ItemIndex <> -1 then q.AddWhere(' to_char(date_begin, ''MM'') = '+ IntToStr(cbM.ItemIndex + 1));
  if cbY.ItemIndex <> -1 then q.AddWhere(' to_char(date_begin, ''YYYY'') = '+ cbY.Text);
  q.Open;
end;
//==============================================================================
procedure TE_PlanRefForm.bbSearchClick(Sender: TObject);
begin
  ActivateQ;
end;
//==============================================================================
procedure TE_PlanRefForm.sbClearPeriodClick(Sender: TObject);
begin
  edPeriod.Clear;
  ActivateQ;
end;
//==============================================================================
procedure TE_PlanRefForm.sbAddClick(Sender: TObject);
begin
  inherited;
  AddPlan;
  ActivateQ;
end;
//==============================================================================
procedure TE_PlanRefForm.FormShow(Sender: TObject);
var
  i, day, month, year: word;
begin
  inherited;
  cbY.Items.Clear;
  DecodeDate(Date, year, month, day);
  for i := 2006 to year+1 do
    cbY.Items.Add(IntToStr(i));
  cbM.ItemIndex := month-1;
  cbY.ItemIndex := year-2006;
  ActivateQ;
end;
//==============================================================================
procedure TE_PlanRefForm.sbEditClick(Sender: TObject);
begin
  if q.RecordCount > 0 then
    if EditPlan(qPlan_ID.AsInteger, qPlan_INST.AsInteger) = mrOk then ActivateQ;
end;
//==============================================================================
procedure TE_PlanRefForm.sbDelClick(Sender: TObject);
var
  InsideTransaction: Boolean;
begin
  if MessageDlg(TranslateText('¬ы уверены в том, что хотите удалить план?'),
    mtWarning, [mbYes,mbNo], 0) = mrNo then exit;
  InsideTransaction := frmStart.ORASESSION1.InTransaction;
  StartSql(InsideTransaction, 'delete_plan');
  try
    _ExecSQL(' update e_plan_det set state=''N'' '+' where e_plan_id='+q.FieldByName('plan_id').AsString+
      '      and inst='+q.FieldByName('plan_inst').AsString);
    _ExecSQl(' update e_plan set state=''N'' '+' where id='+q.FieldByName('plan_id').AsString+
      '      and inst='+q.FieldByName('plan_inst').AsString);
    CommitSQL(InsideTransaction);
    ActivateQ;
  except on E:Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOk], 0);
      RollbackSQL(InsideTransaction,'delete_plan');
    end;
  end;
end;
//==============================================================================
procedure TE_PlanRefForm.DBGrid1DblClick(Sender: TObject);
begin
  sbEdit.Click;
end;
//==============================================================================
procedure TE_PlanRefForm.SpeedButton1Click(Sender: TObject);
begin
  cbM.ItemIndex := -1;
  cbM.Text := '';
  ActivateQ;
end;
//==============================================================================
procedure TE_PlanRefForm.SpeedButton2Click(Sender: TObject);
begin
  cbY.ItemIndex := -1;
  ActivateQ;
end;
//==============================================================================
procedure TE_PlanRefForm.bbClearClick(Sender: TObject);
begin
  SpeedButton2Click(nil);
  SpeedButton1Click(nil);
  sbClearPeriodClick(nil);
end;
//==============================================================================

end.
