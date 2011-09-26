unit BaseRepPoteriRez;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Base, ActnList, Menus, DB, MemDS, DBAccess, Ora, uOilQuery,
  RXCtrls, GridsEh, DBGridEh, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit,
  DBTables, Grids, uOilStoredProc, UDbFunc, DBGridEhGrouping, ImgList;

type
  TBaseRepPoteriRezForm = class(TBaseForm)
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
    qGROUP_ID: TFloatField;
    qIS_PIPE: TFloatField;
    qTANK_NAME: TStringField;
    qNP: TStringField;
    qMASS_BEGIN: TFloatField;
    qMASS_END: TFloatField;
    qDIFF_ZA_PERIOD: TFloatField;
    qOBOROT: TFloatField;
    qMASS_0: TFloatField;
    qWASTE_0: TFloatField;
    qMASS_1: TFloatField;
    qWASTE_1: TFloatField;
    qMASS_2: TFloatField;
    qWASTE_2: TFloatField;
    qMASS_3: TFloatField;
    qWASTE_3: TFloatField;
    qMASS_4: TFloatField;
    qWASTE_4: TFloatField;
    qMASS_5: TFloatField;
    qWASTE_5: TFloatField;
    qZAMERI: TFloatField;
    qDET: TFloatField;
    qPOTERI: TFloatField;
    procedure bbSearchClick(Sender: TObject);
    procedure qFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure CreditorOrgChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
  public
  end;

var
  BaseRepPoteriRezForm: TBaseRepPoteriRezForm;

implementation

{$R *.dfm}

procedure TBaseRepPoteriRezForm.bbSearchClick(Sender: TObject);
begin
  if Self.Showing then
  begin
    if ((deBeginDate.Date)<=(deEndDate.Date)) and ((deBeginDate.Date) >= StrToDate('01.01.2010')) then
    begin
      q.ParamByName('Begin_Date').asDate := deBeginDate.Date;
      q.ParamByName('End_Date').asDate   := deEndDate.Date;
    end;
    _OpenQuery(q);
  end;
end;

procedure TBaseRepPoteriRezForm.qFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  Accept := true;
  // Нефтепродукт
  if Accept and (Product.Text <> '') then
    Accept := pos(AnsiUpperCase(Product.Text), AnsiUpperCase(DataSet.FieldBYName('NP').AsString)) > 0;
  // Резервуар
  if Accept and (Rez.Text <> '') then
    Accept := AnsiUpperCase(Rez.Text) = AnsiUpperCase(DataSet.FieldBYName('TANK_NAME').AsString);
end;

procedure TBaseRepPoteriRezForm.CreditorOrgChange(Sender: TObject);
begin
  inherited;
  q.Filtered:=false;
  q.Filtered:=true;
end;

procedure TBaseRepPoteriRezForm.FormCreate(Sender: TObject);
begin
  inherited;
  deEndDate.Date := Date();
  deBeginDate.Date := Date()-7;
  if deBeginDate.Date<StrToDateTime('01.09.2010') then deBeginDate.Date:=StrToDateTime('01.09.2010');
end;

procedure TBaseRepPoteriRezForm.FormShow(Sender: TObject);
begin
  inherited;
  bbSearchClick(nil);
end;

procedure TBaseRepPoteriRezForm.DBGrid1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if (q.FieldByName('det').AsInteger = 1) or (q.FieldByName('group_id').AsInteger = -1) then
  begin
    Background := $00E8E8E8;
  end;
end;

initialization
  RegisterClass(TBaseRepPoteriRezForm);

end.
