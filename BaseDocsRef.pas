unit BaseDocsRef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Base, ActnList, Menus, DB, MemDS, DBAccess, Ora, uOilQuery,
  RXCtrls, GridsEh, DBGridEh, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit,
  DBTables, Grids, uOilStoredProc, UDbFunc, DBGridEhGrouping, ImgList;

type
  TBaseDocsRefForm = class(TBaseForm)
    lblBeginDate: TLabel;
    deBeginDate: TDateEdit;
    lblEndDate: TLabel;
    deEndDate: TDateEdit;
    rgGoodType: TRadioGroup;
    CreditorOrg: TEdit;
    lblCreditorOrg: TLabel;
    Product: TEdit;
    lblProduct: TLabel;
    lblRez: TLabel;
    Rez: TEdit;
    AutoNum: TEdit;
    lblAutoNum: TLabel;
    cbTTN: TCheckBox;
    cbPrihAuto: TCheckBox;
    cbPrihRail: TCheckBox;
    cbMixing: TCheckBox;
    gbDocTypes: TGroupBox;
    qFast: TOilQuery;
    qSlow: TOilQuery;
    sbButtonLabel: TLabel;
    rgDocState: TRadioGroup;
    lblProductGroup: TLabel;
    ProductGroup: TEdit;
    ImageList: TImageList;
    procedure bbSearchClick(Sender: TObject);
    procedure qFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure CreditorOrgChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbSpeedUpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseDocsRefForm: TBaseDocsRefForm;

implementation

{$R *.dfm}
procedure TBaseDocsRefForm.bbSearchClick(Sender: TObject);
begin
  if Self.Showing then
  begin
    //inherited;
    if sbSpeedUp.Down then
      sbButtonLabel.Caption:='Быстрый режим'
    else
      sbButtonLabel.Caption:='Медленный режим';
    if sbSpeedUp.Down then
      q.SQL.Text := qFast.SQL.Text
    else
      q.SQL.Text := qSlow.SQL.Text;
    q.Close;
    if ((deBeginDate.Date)<=(deEndDate.Date)) and ((deBeginDate.Date) >= StrToDate('01.01.2010')) then
    begin
      q.ParamByName('BeginDate').asDate := deBeginDate.Date;
      q.ParamByName('EndDate').asDate := deEndDate.Date;
    end;
    if rgGoodType.Buttons[0].Checked then
      q.ParamByName('IsPaked').AsInteger := 0
    else
      q.ParamByName('IsPaked').AsInteger := 1;
    if rgDocState.Buttons[1].Checked then
    begin
      q.ParamByName('IsRez').AsInteger := -1;
      cbMixing.Checked:=false;
    end
    else
    begin
      q.ParamByName('IsRez').AsInteger := 99999;
      cbTTN.Checked := True;
      cbPrihAuto.Checked := True;
      cbPrihRail.Checked := True;
      cbMixing.Checked := True;
    end;

    _OpenQuery(q);
    CreditorOrgChange(nil);
  end;
end;

procedure TBaseDocsRefForm.qFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var Accept1,Accept2,Accept3,Accept4:Boolean;
begin
  inherited;
  Accept := true;
  Accept1:= false;
  Accept2:= false;
  Accept3:= false;
  Accept4:= false;
  if Accept and (cbTTN.Checked) then
    Accept1 := pos(AnsiUpperCase('ТТН'), AnsiUpperCase(DataSet.FieldBYName('TR_KIND').AsString)) > 0;
  if Accept and (cbPrihAuto.Checked) then
    Accept2 := pos(AnsiUpperCase('Приход ав'), AnsiUpperCase(DataSet.FieldBYName('TR_KIND').AsString)) > 0;
  if Accept and (cbPrihRail.Checked) then
    Accept3 := pos(AnsiUpperCase('Приход жд'), AnsiUpperCase(DataSet.FieldBYName('TR_KIND').AsString)) > 0;
  if Accept and (cbMixing.Checked) then
    Accept4 := pos(AnsiUpperCase('Смешение'), AnsiUpperCase(DataSet.FieldBYName('TR_KIND').AsString)) > 0;
  if Accept and (Accept1 or Accept2 or Accept3 or Accept4) then Accept := true
    else Accept := false;
  // Кому
  if Accept and (CreditorOrg.Text <> '') then
    Accept := pos(AnsiUpperCase(CreditorOrg.Text), AnsiUpperCase(DataSet.FieldBYName('Creditor').AsString)) > 0;
  // Нефтепродукт
  if Accept and (Product.Text <> '') then
    Accept := pos(AnsiUpperCase(Product.Text), AnsiUpperCase(DataSet.FieldBYName('Product').AsString)) > 0;
  // Группа нефтепродукта
  if Accept and (ProductGroup.Text <> '') then
    Accept := pos(AnsiUpperCase(ProductGroup.Text), AnsiUpperCase(DataSet.FieldBYName('Product_group_name').AsString)) > 0;

  // Резервуар
  if Accept and (Rez.Text <> '') then
    Accept := pos(AnsiUpperCase(Rez.Text), AnsiUpperCase(DataSet.FieldBYName('TANK_ID').AsString)) > 0;
  // Авто
  if Accept and (AutoNum.Text <> '') then
    Accept := pos(AnsiUpperCase(AutoNum.Text), AnsiUpperCase(DataSet.FieldBYName('TRUCK_NO').AsString)) > 0;


end;

procedure TBaseDocsRefForm.CreditorOrgChange(Sender: TObject);
begin
  inherited;
  q.Filtered:=false;
  q.Filtered:=true;
end;

procedure TBaseDocsRefForm.FormCreate(Sender: TObject);
begin
  inherited;
  deEndDate.Date := Date();
  deBeginDate.Date := Date()-30;
end;

procedure TBaseDocsRefForm.sbSpeedUpClick(Sender: TObject);
begin
  inherited;
  bbSearchClick(nil);
end;

procedure TBaseDocsRefForm.FormShow(Sender: TObject);
begin
  inherited;
  bbSearchClick(nil);
end;

initialization
  RegisterClass(TBaseDocsRefForm);

end.
