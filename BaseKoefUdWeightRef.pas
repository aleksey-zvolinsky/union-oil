unit BaseKoefUdWeightRef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Base, DBGridEhGrouping, ActnList, Menus, DB, MemDS, DBAccess,
  Ora, uOilQuery, RXCtrls, GridsEh, DBGridEh, ExtCtrls, StdCtrls, Buttons,
  Mask, ToolEdit;

type
  TBaseKoefUdWeightRefForm = class(TBaseForm)
    deBeginDate: TDateEdit;
    deEndDate: TDateEdit;
    lblEndDate: TLabel;
    lblBeginDate: TLabel;
    lblProduct: TLabel;
    Product: TEdit;
    qID: TFloatField;
    qNAME: TStringField;
    qDATE_FROM: TDateTimeField;
    qDATE_TO: TDateTimeField;
    qKOEF: TFloatField;
    qINST: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure ProductChange(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
  private
  public
  end;

var
  BaseKoefUdWeightRefForm: TBaseKoefUdWeightRefForm;

implementation

uses BaseEditKoefUdWeightRef, main, udbfunc;

{$R *.dfm}

procedure TBaseKoefUdWeightRefForm.FormShow(Sender: TObject);
begin
  inherited;
  //  q.Close;
  //  q.open;
  bbSearchClick(Sender);
end;

procedure TBaseKoefUdWeightRefForm.bbSearchClick(Sender: TObject);
begin
  inherited;
  q.Close;
  if ((deBeginDate.Date) <= (deEndDate.Date)) and ((deBeginDate.Date) >= StrToDate('01.01.2010')) then
  begin
    q.ParamByName('BeginDate').asDate := deBeginDate.Date;
    q.ParamByName('EndDate').asDate := deEndDate.Date;
  end;
  q.Open;
end;

procedure TBaseKoefUdWeightRefForm.FormCreate(Sender: TObject);
begin
  inherited;
  deEndDate.Date := StrToDate('01.01.2011');
  deBeginDate.Date := StrToDate('01.01.2010');
end;

procedure TBaseKoefUdWeightRefForm.qFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  // Нефтепродукт
  if (Product.Text <> '') then
    Accept := pos(AnsiUpperCase(Product.Text), AnsiUpperCase(DataSet.FieldBYName('name').AsString)) > 0;
end;

procedure TBaseKoefUdWeightRefForm.ProductChange(Sender: TObject);
begin
  inherited;
  q.Filtered := false;
  q.Filtered := true;
end;

procedure TBaseKoefUdWeightRefForm.actAddExecute(Sender: TObject);
begin
  inherited;
  ///
end;

procedure TBaseKoefUdWeightRefForm.sbAddClick(Sender: TObject);
var
  AddForm: TBaseEditKoefUdWeightRefForm;
begin
  inherited;
  Application.CreateForm(TBaseEditKoefUdWeightRefForm, AddForm);
  {  if PrihForm.Edit(0,MAIN_ORG.INST) then
    begin
      bbClearClick(Nil);
      edAct.Text := PrihForm.edAct.Text;
      bbSearchClick(Nil);
    end;}

  AddForm.Edit(0, MAIN_ORG.INST);
  bbSearchClick(Sender);
  //  AddForm.Free;
end;

procedure TBaseKoefUdWeightRefForm.sbEditClick(Sender: TObject);
var
  EditForm: TBaseEditKoefUdWeightRefForm;
begin
  inherited;
  Application.CreateForm(TBaseEditKoefUdWeightRefForm, EditForm);
  EditForm.Edit(q['id'], q['inst']);
  bbSearchClick(Sender);
end;

procedure TBaseKoefUdWeightRefForm.sbDelClick(Sender: TObject);
begin
  inherited;
  SetState('OIL_KOEF_UD_WEIGHT', qId.AsInteger, qInst.AsInteger, 'N');
  bbSearchClick(Sender);
end;

end.

