unit RezPrihBase;

{$I define}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Base, DB, StdCtrls, ActnList, Menus, MemDS, DBAccess, Ora,
  uOilQuery, RXCtrls, GridsEh, DBGridEh, ExtCtrls, Buttons,
  DBGridEhGrouping, DbUtilsEh, BaseOil;

type
  TRezPrihBaseForm = class(TBaseOilForm)
    cbMonth: TComboBox;
    Label1: TLabel;
    gDetailDoc: TDBGridEh;
    qDetailTank: TOilQuery;
    dsDetailTank: TOraDataSource;
    gDetailTank: TDBGridEh;
    pDetailDoc: TPanel;
    sbBackToMonth: TSpeedButton;
    pDetailTank: TPanel;
    sbBackToAct: TSpeedButton;
    pGridRow: TPanel;
    pGridRowDoc: TPanel;
    sbFirstD1: TSpeedButton;
    sbFirstD2: TSpeedButton;
    lDetailDoc: TLabel;
    lDetailTank: TLabel;
    procedure bbSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure DBGrid1CheckRowHaveDetailPanel(Sender: TCustomDBGridEh;
      var RowHaveDetailPanel: Boolean);
    procedure DBGrid1RowDetailPanelShow(Sender: TCustomDBGridEh;
      var CanShow: Boolean);
    procedure gDetailDocRowDetailPanelShow(Sender: TCustomDBGridEh;
      var CanShow: Boolean);
    procedure DBGrid1ApplyFilter(Sender: TObject);
    procedure cbMonthChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure gDetailDocDblClick(Sender: TObject);
    procedure gDetailDocRowDetailPanelHide(Sender: TCustomDBGridEh;
      var CanHide: Boolean);
    procedure DBGrid1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure sbBackToMonthClick(Sender: TObject);
    procedure sbBackToActClick(Sender: TObject);
    procedure DBGrid1RowDetailPanelHide(Sender: TCustomDBGridEh;
      var CanHide: Boolean);
    procedure sbFirstD2Click(Sender: TObject);
    procedure sbFirstD1Click(Sender: TObject);
    procedure gDetailDocCheckRowHaveDetailPanel(Sender: TCustomDBGridEh;
      var RowHaveDetailPanel: Boolean);
  private
    FOnGoHome: TNotifyEvent;
    FOnGoToMonth: TNotifyEvent;
    FInst: integer;
    FTankFarmName: string;
    procedure _OpenQueryParT(p_Q: TOilQuery; p_DB, p_DE: TDateTime; p_Macros: string='');
  protected
    IsNewPanel: boolean; // вмикаємо нову панель для табличок деталізації
  public
    procedure Locate(AInst: integer; AMonth: string; AFuelId: integer);
    property OnGoHome: TNotifyEvent read FOnGoHome write FOnGoHome;
    property OnGoToMonth: TNotifyEvent read FOnGoToMonth write FOnGoToMonth;
    property TankFarmName: string read FTankFarmName write FTankFarmName;
  end;

var
  RezPrihBaseForm: TRezPrihBaseForm;

implementation

{$R *.dfm}

uses UDbFunc;

//==============================================================================
procedure TRezPrihBaseForm._OpenQueryParT(p_Q: TOilQuery; p_DB, p_DE: TDateTime; p_Macros: string='');
begin
  {$IFDEF OILAVIAS}
  p_Macros := '@little_oil';
  {$ELSE}
  p_Macros := '';
  {$ENDIF}

  p_Q.Close;
  p_Q.Macros.MacroByName('base_name').Value := p_Macros;
  p_Q.ParamByName('BeginDate').AsDateTime   := p_DB;
  p_Q.ParamByName('EndDate').AsDateTime     := p_DE;
  p_Q.Open;
end;
//==============================================================================
procedure TRezPrihBaseForm.bbSearchClick(Sender: TObject);
begin
  if not q.Active then
    _OpenQueryParT(q, StrToDate('01.01.2010'), Now());
  q.Last;

  Application.ProcessMessages;
  if not qDetail.Active then
  begin
    //qDetail.NonBlocking := True;
    _OpenQueryParT(qDetail, q.ParamByName('BeginDate').AsDateTime, q.ParamByName('EndDate').AsDateTime);
  end;
  if not qDetailTank.Active then
  begin
    //qDetailTank.NonBlocking := True;
    _OpenQueryParT(qDetailTank, q.ParamByName('BeginDate').AsDateTime, q.ParamByName('EndDate').AsDateTime);
  end;
end;
//==============================================================================
procedure TRezPrihBaseForm.FormShow(Sender: TObject);
begin
  inherited;
  IsNewPanel := True;
end;
//==============================================================================
procedure TRezPrihBaseForm.bbClearClick(Sender: TObject);
begin
  cbMonth.ItemIndex := 0;
end;
//==============================================================================
procedure TRezPrihBaseForm.DBGrid1CheckRowHaveDetailPanel(
  Sender: TCustomDBGridEh; var RowHaveDetailPanel: Boolean);
begin
  inherited;
  RowHaveDetailPanel := q.FieldByName('is_have_det').AsInteger = 1;
end;
//==============================================================================
procedure TRezPrihBaseForm.DBGrid1RowDetailPanelShow(
  Sender: TCustomDBGridEh; var CanShow: Boolean);
begin
  inherited;
  if (q.FieldByName('is_have_det').AsInteger = 1) then
  begin
    if not qDetail.Active then
      _OpenQueryParT(qDetail, q.ParamByName('BeginDate').AsDateTime, q.ParamByName('EndDate').AsDateTime)
    else
      // Уже открывается, ждем пока откроется
      while qDetail.Active and not qDetail.Fetched do
        Sleep(100);
    qDetail.Filtered := False;
    qDetail.Filter :=
      ' fuel_id = '+ q.FieldByName('FUEL_ID').AsString +' and MM = '+ QuotedStr(q.FieldByName('MM').AsString);
    qDetail.Filtered := True;
    //gDetailDoc.SetFocus;
  end
  else
    CanShow := False;
  if (FInst <> 0) and (FTankFarmName = '') then
    FTankFarmName := q.Session.ExecSQLEx('begin select name into :Result oil_org where id = inst and inst = :AInst; end;',
      ['AInst', FInst]);
  lDetailDoc.Caption :=
    'Приходы '+FTankFarmName+': Месяц: '+ q.FieldByName('MON').AsString +' \ Нефтепродукт: '+ q.FieldByName('FUEL_NAME').AsString;

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
    DBGrid1.RowDetailPanel.Height := 1000;
    DBGrid1.TitleFont.Color := clScrollBar;
  end;
end;
//==============================================================================
procedure TRezPrihBaseForm.DBGrid1RowDetailPanelHide(Sender: TCustomDBGridEh; var CanHide: Boolean);
begin
  inherited;
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
procedure TRezPrihBaseForm.gDetailDocRowDetailPanelShow(
  Sender: TCustomDBGridEh; var CanShow: Boolean);
begin
  inherited;
  CanShow := qDetail.FieldByName('tr_kind').AsInteger = 8;

  if not qDetailTank.Active then
    _OpenQueryParT(qDetailTank, q.ParamByName('BeginDate').AsDateTime, q.ParamByName('EndDate').AsDateTime)
  else
    // Уже открывается, ждем пока откроется
    while qDetailTank.Active and not qDetailTank.Fetched do
      Sleep(100);
  qDetailTank.Filtered := False;
  qDetailTank.Filter   := ' act_hdr_id = '+ qDetail.FieldByName('act_hdr_id').AsString;
  qDetailTank.Filtered := True;

  lDetailTank.Caption := lDetailDoc.Caption +' \ '+
    'Номер акта: '+ qDetail.FieldByName('ACT_NO').AsString +' \ Дата акта: '+ qDetail.FieldByName('ACT_DATE').AsString;

  if IsNewPanel then // вмикаємо нову панель для табличок деталізації
  begin
    pDetailTank.Parent := pGridRowDoc;
    gDetailTank.Parent := pGridRowDoc;
    pGridRow.Align := alTop;
    pGridRowDoc.Align := alClient;
    pGridRowDoc.Visible := true;
    pGridRow.Visible := not pGridRowDoc.Visible;
  end
  else
  begin
    gDetailDoc.VertScrollBar.Visible := False;
    gDetailDoc.RowDetailPanel.Height := 1000;
    gDetailDoc.TitleFont.Color := clScrollBar;
    pDetailDoc.Visible := false;
  end;
end;
//==============================================================================
procedure TRezPrihBaseForm.gDetailDocRowDetailPanelHide(Sender: TCustomDBGridEh; var CanHide: Boolean);
begin
  inherited;
  if IsNewPanel then // вмикаємо нову панель для табличок деталізації
  begin
    pDetailTank.Parent := gDetailDoc.RowDetailPanelControl;
    gDetailTank.Parent := gDetailDoc.RowDetailPanelControl;
    pGridRowDoc.Align := alTop;
    pGridRow.Align := alClient;
    pGridRowDoc.Visible := false;
    pGridRow.Visible := not pGridRowDoc.Visible;
    gDetailDoc.RowDetailPanel.Active := true;
  end
  else
  begin
    gDetailDoc.VertScrollBar.Visible := True;
    gDetailDoc.TitleFont.Color := clWindowText;
    pDetailDoc.Visible := true;
  end;
end;
//==============================================================================
procedure TRezPrihBaseForm.DBGrid1ApplyFilter(Sender: TObject);
begin
  inherited;
  q.Filtered := False;
  q.Filter := GetExpressionAsFilterString(TDBGridEh(Sender), GetOneExpressionAsLocalFilterString, nil);
  q.Filtered := q.Filter <> '';
end;
//==============================================================================
procedure TRezPrihBaseForm.cbMonthChange(Sender: TObject);
begin
  inherited;
  q.Filtered := False;
  if cbMonth.ItemIndex > 9 then
    q.Filter := 'MM = '+ QuotedStr(IntToStr(cbMonth.ItemIndex))
  else
    q.Filter := 'MM = '+ QuotedStr('0'+IntToStr(cbMonth.ItemIndex));
  q.Filtered := cbMonth.ItemIndex <> 0;
end;
//==============================================================================
procedure TRezPrihBaseForm.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if q.FieldByName('is_have_det').AsInteger = 1 then
    DBGrid1.RowDetailPanel.Visible := not DBGrid1.RowDetailPanel.Visible;
end;
//==============================================================================
procedure TRezPrihBaseForm.gDetailDocDblClick(Sender: TObject);
begin
  inherited;
  gDetailDoc.RowDetailPanel.Visible := not gDetailDoc.RowDetailPanel.Visible;
end;
//==============================================================================
procedure TRezPrihBaseForm.DBGrid1GetCellParams(Sender: TObject;
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
  end;
  if q.FieldByName('MM').AsString = '13' then
  begin
    Background := $00E8E8E8;
    AFont.Style := [fsBold];
  end;
end;
//==============================================================================
procedure TRezPrihBaseForm.sbBackToMonthClick(Sender: TObject);
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
//==============================================================================
procedure TRezPrihBaseForm.sbBackToActClick(Sender: TObject);
begin
  inherited;
  gDetailDoc.RowDetailPanel.Visible := False;
end;
//==============================================================================
procedure TRezPrihBaseForm.sbFirstD2Click(Sender: TObject);
begin
  if Assigned(FOnGoHome) then
    FOnGoHome(Self)
  else
  begin
    sbBackToAct.Click;
    sbBackToMonth.Click;
  end;
end;
//==============================================================================
procedure TRezPrihBaseForm.sbFirstD1Click(Sender: TObject);
begin
  if Assigned(FOnGoHome) then
    FOnGoHome(Self)
  else
  begin
    sbBackToMonth.Click;
  end;
end;
//==============================================================================
procedure TRezPrihBaseForm.Locate(AInst: integer; AMonth: string; AFuelId: integer);
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
end;

procedure TRezPrihBaseForm.gDetailDocCheckRowHaveDetailPanel(
  Sender: TCustomDBGridEh; var RowHaveDetailPanel: Boolean);
begin
  inherited;
  // Приходы ЖД
  RowHaveDetailPanel := qDetail.FieldByName('tr_kind').AsInteger = 8;
end;

initialization
  RegisterClass(TRezPrihBaseForm);

end.