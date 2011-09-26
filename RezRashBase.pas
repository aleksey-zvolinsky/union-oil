unit RezRashBase;

{$I define}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Base, DB, StdCtrls, ActnList, Menus, MemDS, DBAccess, Ora,
  uOilQuery, RXCtrls, GridsEh, DBGridEh, ExtCtrls, Buttons,
  DBGridEhGrouping, DbUtilsEh, BaseOil;

type
  TRezRashBaseForm = class(TBaseOilForm)
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
    lDetailDoc: TLabel;
    sbFirstD2: TSpeedButton;
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
  private
    FOnGoHome: TNotifyEvent;
    FOnGoToMonth: TNotifyEvent;
    FInst: integer;
    FTankFarmName: string;
  protected
    IsNewPanel: boolean; // вмикаємо нову панель для табличок деталізації
  public
    procedure Locate(AInst: integer; AMonth: string; AFuelId: integer);
    property OnGoHome: TNotifyEvent read FOnGoHome write FOnGoHome;
    property OnGoToMonth: TNotifyEvent read FOnGoToMonth write FOnGoToMonth;   
    property TankFarmName: string read FTankFarmName write FTankFarmName;
  end;

var
  RezRashBaseForm: TRezRashBaseForm;

implementation

{$R *.dfm}

uses {$IFDEF OIL}OilStd, {$ENDIF}UDbFunc;

//==============================================================================
procedure TRezRashBaseForm.bbSearchClick(Sender: TObject);
begin
  if not q.Active then
    _OpenQueryPar(q, ['BeginDate', StrToDate('01.01.2010'), 'EndDate', Now()]);
  q.Last;

  Application.ProcessMessages;
  if not qDetail.Active then
  begin
    _OpenQueryPar(qDetail,
      ['BeginDate', q.ParamByName('BeginDate').AsDateTime,
       'EndDate',   q.ParamByName('EndDate').AsDateTime]);
  end;
  if not qDetailTank.Active then
  begin
    _OpenQueryPar(qDetailTank,
      ['BeginDate', q.ParamByName('BeginDate').AsDateTime,
       'EndDate',   q.ParamByName('EndDate').AsDateTime]);
  end;
end;
//==============================================================================
procedure TRezRashBaseForm.FormShow(Sender: TObject);
begin
  inherited;
  IsNewPanel := True;
end;
//==============================================================================
procedure TRezRashBaseForm.bbClearClick(Sender: TObject);
begin
  cbMonth.ItemIndex := 0;
end;
//==============================================================================
procedure TRezRashBaseForm.DBGrid1CheckRowHaveDetailPanel(
  Sender: TCustomDBGridEh; var RowHaveDetailPanel: Boolean);
begin
  inherited;
  RowHaveDetailPanel := q.FieldByName('is_have_det').AsInteger = 1;
end;
//==============================================================================
procedure TRezRashBaseForm.DBGrid1RowDetailPanelShow(
  Sender: TCustomDBGridEh; var CanShow: Boolean);
begin
  inherited;
  if (q.FieldByName('is_have_det').AsInteger = 1) then
  begin
    if not qDetail.Active then
      _OpenQueryPar(qDetail,
        ['BeginDate', q.ParamByName('BeginDate').AsDateTime,
         'EndDate',   q.ParamByName('EndDate').AsDateTime])
    else
      // Уже открывается, ждем пока откроется
      while qDetail.Active and not qDetail.Fetched do
        Sleep(100);
    qDetail.Filtered := False;
    qDetail.Filter :=
      ' NP_ID = '+ q.FieldByName('NP_ID').AsString +' and MM = '+ QuotedStr(q.FieldByName('MM').AsString);
    qDetail.Filtered := True;
  end
  else
    CanShow := False;    

  if (FInst <> 0) and (FTankFarmName = '') then
    FTankFarmName := q.Session.ExecSQLEx('begin select name into :Result oil_org where id = inst and inst = :AInst; end;',
      ['AInst', FInst]);

  lDetailDoc.Caption :=
    'Расходы '+FTankFarmName+': Месяц: '+ q.FieldByName('MON').AsString +' \ Нефтепродукт: '+ q.FieldByName('NP_NAME').AsString;

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
procedure TRezRashBaseForm.DBGrid1RowDetailPanelHide(
  Sender: TCustomDBGridEh; var CanHide: Boolean);
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
procedure TRezRashBaseForm.gDetailDocRowDetailPanelShow(
  Sender: TCustomDBGridEh; var CanShow: Boolean);
begin
  inherited;
  if not qDetailTank.Active then
    _OpenQueryPar(qDetailTank,
      ['BeginDate', q.ParamByName('BeginDate').AsDateTime,
       'EndDate',   q.ParamByName('EndDate').AsDateTime])
  else
    // Уже открывается, ждем пока откроется
    while qDetailTank.Active and not qDetailTank.Fetched do
      Sleep(100);
  qDetailTank.Filtered := False;
  qDetailTank.Filter :=
    '     NP_ID = '+ qDetail.FieldByName('NP_ID').AsString +
    ' and DATE_RASH_T = '+ QuotedStr(qDetail.FieldByName('DATE_RASH_T').AsString);
  qDetailTank.Filtered := True;

  lDetailTank.Caption := lDetailDoc.Caption +' \ Дата: '+ qDetail.FieldByName('DATE_RASH_T').AsString;

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
procedure TRezRashBaseForm.gDetailDocRowDetailPanelHide(
  Sender: TCustomDBGridEh; var CanHide: Boolean);
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
procedure TRezRashBaseForm.DBGrid1ApplyFilter(Sender: TObject);
begin
  inherited;
  q.Filtered := False;
  q.Filter := GetExpressionAsFilterString(TDBGridEh(Sender), GetOneExpressionAsLocalFilterString, nil);
  q.Filtered := q.Filter <> '';  
end;
//==============================================================================
procedure TRezRashBaseForm.cbMonthChange(Sender: TObject);
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
procedure TRezRashBaseForm.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if q.FieldByName('is_have_det').AsInteger = 1 then
    DBGrid1.RowDetailPanel.Visible := not DBGrid1.RowDetailPanel.Visible;
end;
//==============================================================================
procedure TRezRashBaseForm.gDetailDocDblClick(Sender: TObject);
begin
  inherited;
  gDetailDoc.RowDetailPanel.Visible := not gDetailDoc.RowDetailPanel.Visible;
end;
//==============================================================================
procedure TRezRashBaseForm.DBGrid1GetCellParams(Sender: TObject;
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
procedure TRezRashBaseForm.sbBackToMonthClick(Sender: TObject);
begin
  inherited;
  if Assigned(FOnGoToMonth) then
    FOnGoToMonth(Self)
  else
  begin
    if IsNewPanel then
    begin
      DBGrid1.RowDetailPanel.Active := False;
    end
    else
      DBGrid1.RowDetailPanel.Visible := False;
  end;
end;
//==============================================================================
procedure TRezRashBaseForm.sbBackToActClick(Sender: TObject);
begin
  inherited;
  gDetailDoc.RowDetailPanel.Visible := False;
end;
//==============================================================================
procedure TRezRashBaseForm.sbFirstD2Click(Sender: TObject);
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
procedure TRezRashBaseForm.sbFirstD1Click(Sender: TObject);
begin
  inherited;
  if Assigned(FOnGoHome) then
    FOnGoHome(Self)
  else
  begin
    sbBackToMonth.Click;
  end;
end;
//==============================================================================
procedure TRezRashBaseForm.Locate(AInst: integer; AMonth: string;
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
  dbBaseGrid.DataSource.DataSet.Locate('MM;NP_ID', VarArrayOf([AMonth, AFuelId]), []);
  dbBaseGrid.RowDetailPanel.Visible := True;
  pnlHideFilter.Visible := False;
end;

initialization
  RegisterClass(TRezRashBaseForm);

end.