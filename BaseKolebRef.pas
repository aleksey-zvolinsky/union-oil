unit BaseKolebRef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Base, ActnList, Menus, DB, MemDS, DBAccess, Ora, uOilQuery,
  RXCtrls, GridsEh, DBGridEh, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit,
  DBTables, Grids, uOilStoredProc, UDbFunc, DBGridEhGrouping, ImgList;

type
  TBaseKolebRefForm = class(TBaseForm)
    lblBeginDate: TLabel;
    deBeginDate: TDateEdit;
    lblEndDate: TLabel;
    deEndDate: TDateEdit;
    Product: TEdit;
    lblProduct: TLabel;
    lblRez: TLabel;
    Rez: TEdit;
    sbButtonLabel: TLabel;
    ImageList: TImageList;
    qMDATE: TStringField;
    qNUMB: TStringField;
    qDIFF: TFloatField;
    qLAGDIFF: TFloatField;
    qDIFF2: TFloatField;
    qFUEL_ID: TFloatField;
    qFUEL_NAME: TStringField;
    qPOGR: TFloatField;
    cbKolebTubes: TCheckBox;
    procedure bbSearchClick(Sender: TObject);
    procedure qFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure CreditorOrgChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbKolebTubesClick(Sender: TObject);
  private
  public
  end;

var
  BaseKolebRefForm: TBaseKolebRefForm;

implementation

{$R *.dfm}

procedure TBaseKolebRefForm.bbSearchClick(Sender: TObject);
begin
  if Self.Showing then
  begin
    if ((deBeginDate.Date)<=(deEndDate.Date)) and ((deBeginDate.Date) >= StrToDate('01.09.2010')) then
    begin
      q.ParamByName('Begin_Date').asDate := deBeginDate.Date;
      q.ParamByName('End_Date').asDate   := deEndDate.Date;
      q.ParamByName('fuel_id').asfloat   := 0;
      q.ParamByName('numb').asstring     := '0';
      q.ParamByName('org_inst').asfloat  := 624;
    end;
    _OpenQuery(q);
    q.Filtered := false;
    q.Filter   := 'numb <> fuel_name';
    q.Filtered := true;
  end;
end;

procedure TBaseKolebRefForm.qFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  Accept := true;
  // Нефтепродукт
  if Accept and (Product.Text <> '') then
    Accept := pos(AnsiUpperCase(Product.Text), AnsiUpperCase(DataSet.FieldBYName('FUEL_NAME').AsString)) > 0;
  // Резервуар
  if Accept and (Rez.Text <> '') then
    Accept := AnsiUpperCase(Rez.Text) = AnsiUpperCase(DataSet.FieldBYName('NUMB').AsString);
end;

procedure TBaseKolebRefForm.CreditorOrgChange(Sender: TObject);
begin
  inherited;
  q.Filtered:=false;
  q.Filtered:=true;
end;

procedure TBaseKolebRefForm.FormCreate(Sender: TObject);
begin
  inherited;
  deEndDate.Date := Date();
  deBeginDate.Date := Date()-7;
  if deBeginDate.Date<StrToDateTime('01.09.2010') then deBeginDate.Date:=StrToDateTime('01.09.2010');
end;

procedure TBaseKolebRefForm.FormShow(Sender: TObject);
begin
  inherited;
  bbSearchClick(nil);
end;

procedure TBaseKolebRefForm.cbKolebTubesClick(Sender: TObject);
begin
  q.Filtered := not cbKolebTubes.Checked;
end;

initialization
  RegisterClass(TBaseKolebRefForm);

end.
