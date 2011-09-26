unit BaseRepDensity;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Base, DB, StdCtrls, ActnList, Menus, MemDS, DBAccess, Ora,
  uOilQuery, RXCtrls, GridsEh, DBGridEh, ExtCtrls, Buttons,
  DBGridEhGrouping, DbUtilsEh, BaseOil, Grids, DBGrids, Mask, ToolEdit;

type
  TBaseRepDensityForm = class(TBaseOilForm)
    lblBeginDate: TLabel;
    deBeginDate: TDateEdit;
    lblEndDate: TLabel;
    deEndDate: TDateEdit;
    gDetailDoc: TDBGridEh;
    pDetailDoc: TPanel;
    sbBackToMonth: TSpeedButton;
    sbFirstD1: TSpeedButton;
    Label1: TLabel;
    pGridRow: TPanel;
    qDetailNP_NAME: TStringField;
    qDetailMON: TStringField;
    qDetailACT_DATE: TDateTimeField;
    qDetailFUEL_ID: TFloatField;
    qDetailMASS_PRIH: TFloatField;
    qDetailDENSITY_PRIH: TFloatField;
    qDetailTEMP_PRIH: TFloatField;
    qDetailDENSITY_20_PRIH: TFloatField;
    qDetailLITR_20_PRIH: TFloatField;
    qDetailLITR_RASH: TFloatField;
    qDetailMASS_RASH: TFloatField;
    qDetailDENSITY_RASH: TFloatField;
    qDetailTEMP_RASH: TFloatField;
    qDetailDENSITY_20_RASH: TFloatField;
    qDetailLITR_20_RASH: TFloatField;
    qDetailIS_HAVE_DET: TFloatField;
    qDetailMM: TStringField;
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
    procedure gDetailDocSumListRecalcAll(Sender: TObject);
    procedure gDetailDocGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
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
  BaseRepDensityForm: TBaseRepDensityForm;

implementation

{$R *.dfm}

uses Main, //OilStd,
  UDbFunc, ExFunc;
//==============================================================================

{procedure TBaseRepDensityForm.Locate(AInst: integer; AMonth: string;
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

procedure TBaseRepDensityForm.DBGrid1GetCellParams(Sender: TObject;
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
{  if q.FieldByName('MM').AsString = '13' then
  begin
    Background := $00E8E8E8;
    //    Background := clSilver;
    AFont.Style := [fsBold];
  end;}
end;
//==============================================================================

procedure TBaseRepDensityForm.FormCreate(Sender: TObject);
begin
  inherited;
  //SetPrevMonth(deBeginDate, deEndDate);
  //SetCurrentMonth(deBeginDate, deEndDate);
  deBeginDate.date := StrToDate('01.01.2010');
  deEndDate.date := date();
end;
//==============================================================================

procedure TBaseRepDensityForm.FormShow(Sender: TObject);
var
  i: word;
begin
  inherited;
  IsNewPanel := True;
  // Проставляем параметр нужный для сортировки
  {for i := 0 to dbGrid1.Columns.Count - 1 do
    dbGrid1.Columns[i].Title.TitleButton := False;}
  //bbSearch.Click;
end;
//==============================================================================

procedure TBaseRepDensityForm.bbSearchClick(Sender: TObject);
begin
  q.Close;
  _OpenQueryPar(q,
    [ 'begindate', deBeginDate.Date,
      'enddate', deEndDate.Date]);
  qDetail.close;
  _OpenQueryPar(qDetail,
    [ 'begindate', deBeginDate.Date,
      'enddate', deEndDate.Date])
end;
//==============================================================================

procedure TBaseRepDensityForm.bbClearClick(Sender: TObject);
begin
  SetCurrentMonth(deBeginDate, deEndDate);
end;
//==============================================================================

procedure TBaseRepDensityForm.DBGrid1CheckRowHaveDetailPanel(
  Sender: TCustomDBGridEh; var RowHaveDetailPanel: Boolean);
begin
  inherited;
  RowHaveDetailPanel := q.FieldByName('is_have_det').AsInteger = 1;
end;

procedure TBaseRepDensityForm.DBGrid1RowDetailPanelShow(
  Sender: TCustomDBGridEh; var CanShow: Boolean);
var
  i: integer;
  rValueFooter: real;
begin
  inherited;
  if not qDetail.Active then
  _OpenQueryPar(qDetail,
    [ 'begindate', deBeginDate.Date,
      'enddate', deEndDate.Date])
  else
    // Уже открывается, ждем пока откроется
    {while qDetail.Active and not qDetail.Fetched do
      Sleep(100);}
  gDetailDoc.SumList.Active:=false;
  qDetail.Filtered := False;
  qDetail.Filter :=
    ' fuel_id = ''' + q.FieldByName('FUEL_ID').AsString+'''';
  qDetail.Filtered := True;

  // обновление футера
  for i := 0 to gDetailDoc.Columns.Count - 1 do
    if (gDetailDoc.Columns[i].Footer.ValueType = fvtStaticText) and (gDetailDoc.Columns[i].Footer.Value<>'Итого') then
    begin
      gDetailDoc.Columns[i].Footer.ValueType := fvtSum;
    end;

  gDetailDoc.SumList.Active:=true;
  // сумма / 2 из-за итогов за каждый месяц
  for i := 0 to gDetailDoc.Columns.Count - 1 do
    if gDetailDoc.Columns[i].Footer.ValueType = fvtSum then
    begin
      rValueFooter := nvl(gDetailDoc.Columns[i].Footer.SumValue, 0) / 2;
      gDetailDoc.Columns[i].Footer.ValueType := fvtStaticText;
      gDetailDoc.Columns[i].Footer.Value := FloatToStrF(rValueFooter, ffNumber, 15,
        decode([gDetailDoc.Columns[i].FieldName, 'MASS_PRIH', 3, 'MASS_RASH', 3, 0]));
    end;

  //gDetailDoc.SetFocus;
  {if (FInst <> 0) and (FTankFarmName = '') then
    FTankFarmName := q.Session.ExecSQLEx('begin select name into :Result from oil_org where id = inst and inst = :AInst; end;',
      ['AInst', FInst]);}
  Label1.Caption :=
    'Плотности ' + FTankFarmName + ' \ Нефтепродукт: ' + q.FieldByName('NP_NAME').AsString;

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

procedure TBaseRepDensityForm.sbBackToMonthClick(Sender: TObject);
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

procedure TBaseRepDensityForm.sbFirstD1Click(Sender: TObject);
begin
  if Assigned(FOnGoHome) then
    FOnGoHome(Self)
  else
  begin
    sbBackToMonth.Click;
  end;
end;

procedure TBaseRepDensityForm.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if q.FieldByName('is_have_det').AsInteger = 1 then
    DBGrid1.RowDetailPanel.Visible := not DBGrid1.RowDetailPanel.Visible;
end;

procedure TBaseRepDensityForm.DBGrid1RowDetailPanelHide(
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
procedure TBaseRepDensityForm.gDetailDocSumListRecalcAll(Sender: TObject);
begin
  inherited;
  //
  
end;

procedure TBaseRepDensityForm.gDetailDocGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;

  if (qDetail.FieldByName('is_have_det').AsInteger = 0) then
  begin
    AFont.Style := [fsBold];
  end;
  if (qDetail.FieldByName('is_have_det').AsInteger = 0) then
  begin
    Background := $00F4F4F4;
    //      Background := clSkyBlue;
  end;
end;

initialization
  RegisterClass(TBaseRepDensityForm);

end.

