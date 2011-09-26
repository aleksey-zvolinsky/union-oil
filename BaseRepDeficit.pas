unit BaseRepDeficit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Base, DB, StdCtrls, ActnList, Menus, MemDS, DBAccess, Ora,
  uOilQuery, RXCtrls, GridsEh, DBGridEh, ExtCtrls, Buttons,
  DBGridEhGrouping, DbUtilsEh, BaseOil, Grids, DBGrids, Mask, ToolEdit;

type
  TBaseRepDeficitForm = class(TBaseOilForm)
    lblBeginDate: TLabel;
    deBeginDate: TDateEdit;
    lblEndDate: TLabel;
    deEndDate: TDateEdit;
    qFUEL_NAME: TStringField;
    qFIRST_DIFF: TFloatField;
    qLAST_DIFF: TFloatField;
    qDIFF_OF_DIFF: TFloatField;
    qMIXING: TFloatField;
    qINCOME: TFloatField;
    qLACK: TFloatField;
    qRAIL_LOSS_SUM: TFloatField;
    qDELTAWEIGHT: TFloatField;
    qVOLUME2: TFloatField;
    qLOADING_LOSS: TFloatField;
    qLOSTSUM: TFloatField;
    qCOUNT_REZ: TFloatField;
    qLOSTFROMONE: TFloatField;
    qLOSTFROMONEDAY: TFloatField;
    qMM: TStringField;
    qFUEL_ID: TFloatField;
    qIS_HAVE_DET: TFloatField;
    gDetailDoc: TDBGridEh;
    qDetailFUEL_NAME: TStringField;
    qDetailFUEL_ID: TFloatField;
    qDetailMDATE: TDateTimeField;
    qDetailMM: TStringField;
    qDetailFIRST_DIFF: TFloatField;
    qDetailLAST_DIFF: TFloatField;
    qDetailDIFF_OF_DIFF: TFloatField;
    qDetailMIXING: TFloatField;
    qDetailINCOME: TFloatField;
    qDetailRAIL_LOSS_SUM: TFloatField;
    qDetailLACK: TFloatField;
    qDetailVOLUME2: TFloatField;
    qDetailDELTAWEIGHT: TFloatField;
    qDetailLOADING_LOSS: TFloatField;
    qDetailLOSTSUM: TFloatField;
    qDetailCOUNT_REZ: TFloatField;
    qDetailLOSTFROMONE: TFloatField;
    qDetailLOSTFROMONEDAY: TFloatField;
    pDetailDoc: TPanel;
    sbBackToMonth: TSpeedButton;
    sbFirstD1: TSpeedButton;
    Label1: TLabel;
    pGridRow: TPanel;
    KoefUdWeightButton: TButton;
    procedure DBGrid1CheckRowHaveDetailPanel(Sender: TCustomDBGridEh;
      var RowHaveDetailPanel: Boolean);
    procedure FormShow(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure DBGrid1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGrid1RowDetailPanelShow(Sender: TCustomDBGridEh;
      var CanShow: Boolean);
    procedure sbBackToMonthClick(Sender: TObject);
    procedure sbFirstD1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1RowDetailPanelHide(Sender: TCustomDBGridEh;
      var CanHide: Boolean);
    procedure KoefUdWeightButtonClick(Sender: TObject);
  private
    FOnGoHome: TNotifyEvent;
    FOnGoToMonth: TNotifyEvent;
    FTankFarmName: string;
    FInst: integer;
  protected
    IsNewPanel: boolean; // вмикаємо нову панель для табличок деталізації
  public
{    procedure Locate(AInst: integer; AMonth: string; AFuelId: integer);}
    property OnGoHome: TNotifyEvent read FOnGoHome write FOnGoHome;
    property OnGoToMonth: TNotifyEvent read FOnGoToMonth write FOnGoToMonth;
    property TankFarmName: string read FTankFarmName write FTankFarmName;
  end;

var
  BaseRepDeficitForm: TBaseRepDeficitForm;

implementation

{$R *.dfm}

uses Main, //OilStd,
  UDbFunc, ExFunc, BaseKoefUdWeightRef;
//==============================================================================

{procedure TBaseRepDeficitForm.Locate(AInst: integer; AMonth: string;
  AFuelId: integer);
begin
  FInst := AInst;
  if not dbBaseGrid.DataSource.DataSet.Active then
  begin
    dbBaseGrid.Visible := False;
    Update;
    dbBaseGrid.DataSource.DataSet.DisableControls;
    bbSearch.Click;
    dbBaseGrid.DataSource.DataSet.EnableControls;
    dbBaseGrid.Visible := True;
  end;
  dbBaseGrid.DataSource.DataSet.Locate('MM;FUEL_ID', VarArrayOf([AMonth, AFuelId]), []);
  dbBaseGrid.RowDetailPanel.Visible := True;
  pnlHideFilter.Visible := False;
end;}

procedure TBaseRepDeficitForm.DBGrid1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;

  if (q.FieldByName('is_have_det').AsInteger = 0) then
  begin
    AFont.Style := [fsBold];
  end;
  if (q.FieldByName('is_have_det').AsInteger = 0) then
  begin
    Background := $00F4F4F4;
    //      Background := clSkyBlue;
  end;
  if q.FieldByName('MM').AsString = '13' then
  begin
    Background := $00E8E8E8;
    //    Background := clSilver;
    AFont.Style := [fsBold];
  end;
end;
//==============================================================================

procedure TBaseRepDeficitForm.FormCreate(Sender: TObject);
begin
  inherited;
  //SetPrevMonth(deBeginDate, deEndDate);
  deBeginDate.date := StrToDate('01.03.2010');
  deEndDate.date := date();
end;
//==============================================================================

procedure TBaseRepDeficitForm.FormShow(Sender: TObject);
var
  i: word;
begin
  inherited;
  IsNewPanel := True;
  // Проставляем параметр нужный для сортировки
  {for i := 0 to dbGrid1.Columns.Count - 1 do
    dbGrid1.Columns[i].Title.TitleButton := False;}
  //    bbSearch.Click;
end;
//==============================================================================

procedure TBaseRepDeficitForm.bbSearchClick(Sender: TObject);
begin
  q.Close;
  _OpenQueryPar(q,
    [ 'begin_date', deBeginDate.Date,
      'end_date', deEndDate.Date + 1,
      'fuel_id', 0]);
  qDetail.close;
  _OpenQueryPar(qDetail,
    [ 'begin_date', deBeginDate.Date - 1,
      'end_date', deEndDate.Date,
      'fuel_id', 0])
end;
//==============================================================================

procedure TBaseRepDeficitForm.bbClearClick(Sender: TObject);
begin
  SetCurrentMonth(deBeginDate, deEndDate);
end;
//==============================================================================

procedure TBaseRepDeficitForm.DBGrid1CheckRowHaveDetailPanel(
  Sender: TCustomDBGridEh; var RowHaveDetailPanel: Boolean);
begin
  inherited;
  RowHaveDetailPanel := q.FieldByName('is_have_det').AsInteger = 1;
end;

procedure TBaseRepDeficitForm.DBGrid1RowDetailPanelShow(
  Sender: TCustomDBGridEh; var CanShow: Boolean);
begin
  inherited;
  if not qDetail.Active then
    _OpenQueryPar(qDetail,
      [ 'begin_date', deBeginDate.Date - 1,
        'end_date', deEndDate.Date,
        'fuel_id', 0])
  else
    // Уже открывается, ждем пока откроется
    while qDetail.Active and not qDetail.Fetched do
      Sleep(100);
  qDetail.Filtered := False;
  qDetail.Filter :=
    ' fuel_id = ' + q.FieldByName('FUEL_ID').AsString + ' and MM = ' + QuotedStr(q.FieldByName('MM').AsString);
  qDetail.Filtered := True;
  //gDetailDoc.SetFocus;
  if (FInst <> 0) and (FTankFarmName = '') then
    FTankFarmName := q.Session.ExecSQLEx('begin select name into :Result from oil_org where id = inst and inst = :AInst; end;',
      ['AInst', FInst]);
  Label1.Caption :=
    'Прирост и потери ' + FTankFarmName + ': Месяц: ' + q.FieldByName('MON').AsString + ' \ Нефтепродукт: ' + q.FieldByName('FUEL_NAME').AsString;

  {Label1.Caption :=
      'Месяц: ' + q.FieldByName('MON').AsString + ' \ Нефтепродукт: ' + q.FieldByName('FUEL_NAME').AsString;}
  if IsNewPanel then // вмикаємо нову панель для табличок деталізації
  begin
    pDetailDoc.Parent := pGridRow;
    gDetailDoc.Parent := pGridRow;
    pBase.Align := alTop;
    pGridRow.Align := alClient;
    pGridRow.Visible := true;
    pBase.Visible := not pGridRow.Visible;
  end
  else
  begin
    DBGrid1.RowDetailPanel.Height := 2000;
    DBGrid1.TitleFont.Color := clScrollBar;
  end;
end;

procedure TBaseRepDeficitForm.sbBackToMonthClick(Sender: TObject);
begin
  inherited;
  if Assigned(FOnGoToMonth) then
    FOnGoToMonth(Self)
  else
  begin
    if IsNewPanel then
      DBGrid1.RowDetailPanel.Active := False
    else
      DBGrid1.RowDetailPanel.Visible := False;
  end;
end;

procedure TBaseRepDeficitForm.sbFirstD1Click(Sender: TObject);
begin
  if Assigned(FOnGoHome) then
    FOnGoHome(Self)
  else
  begin
    sbBackToMonth.Click;
  end;
end;

procedure TBaseRepDeficitForm.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if q.FieldByName('is_have_det').AsInteger = 1 then
    DBGrid1.RowDetailPanel.Visible := not DBGrid1.RowDetailPanel.Visible;
end;

procedure TBaseRepDeficitForm.DBGrid1RowDetailPanelHide(
  Sender: TCustomDBGridEh; var CanHide: Boolean);
begin
  inherited;
{  gDetailDoc.Parent := DBGrid1.RowDetailPanelControl;
  pGridRow.Align := alTop;
  pBase.Align := alClient;
  pGridRow.Visible := false;
  //    pBase.Visible := not pGridRow.Visible;
  DBGrid1.RowDetailPanel.Active := true;}
  if IsNewPanel then // вмикаємо нову панель для табличок деталізації
  begin
    pDetailDoc.Parent := DBGrid1.RowDetailPanelControl;
    gDetailDoc.Parent := DBGrid1.RowDetailPanelControl;
    pGridRow.Align := alTop;
    pBase.Align := alClient;
    pGridRow.Visible := false;
    pBase.Visible := not pGridRow.Visible;
    DBGrid1.RowDetailPanel.Active := true;
  end
  else
    DBGrid1.TitleFont.Color := clWindowText;
end;

//==============================================================================
procedure TBaseRepDeficitForm.KoefUdWeightButtonClick(Sender: TObject);
var fKoefUdWeightRefForm:  TBaseKoefUdWeightRefForm;
begin
  inherited;
  fKoefUdWeightRefForm :=   TBaseKoefUdWeightRefForm.Create(Self);
  fKoefUdWeightRefForm.show();
end;

initialization
  RegisterClass(TBaseRepDeficitForm);

end.

