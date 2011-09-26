unit BaseTovarOperRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, StdCtrls, ToolEdit, Mask, Menus, Db, DBTables, Grids, DBGridEh,
  Buttons, ExtCtrls, RXCtrls, MemDS, DBAccess, Ora, ActnList, uOilQuery,
  uOilStoredProc, Variants, GridsEh, DBGridEhGrouping;

type
  TBaseTovarOperRefForm = class(TBaseForm)
    deBeginDate: TDateEdit;
    Label1: TLabel;
    deEndDate: TDateEdit;
    Label7: TLabel;
    qChecker: TOilQuery;
    N2: TMenuItem;
    eFrom: TEdit;
    lblFrom: TLabel;
    eTo: TEdit;
    lblTo: TLabel;
    lblProduct: TLabel;
    eProduct: TEdit;
    dsDetailTank: TOraDataSource;
    qDetailTank: TOilQuery;
    grDetailTank: TDBGridEh;
    pDetailTank: TPanel;
    sbBackToMonth: TSpeedButton;
    sbFirstD2: TSpeedButton;
    lDetailTank: TLabel;
    pGridRow: TPanel;
    pGridRowDoc: TPanel;
    grDetailAuto: TDBGridEh;
    procedure bbSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbTotalClick(Sender: TObject);
    procedure qFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure eProductChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumnEh);
    procedure DBGrid1CheckRowHaveDetailPanel(Sender: TCustomDBGridEh;
      var RowHaveDetailPanel: Boolean);
    procedure DBGrid1RowDetailPanelShow(Sender: TCustomDBGridEh;
      var CanShow: Boolean);
    procedure DBGrid1RowDetailPanelHide(Sender: TCustomDBGridEh;
      var CanHide: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure sbBackToMonthClick(Sender: TObject);
  private
    FOnGoToMonth: TNotifyEvent;
    FTankFarmName: string;
  protected
  public
    property OnGoToMonth: TNotifyEvent read FOnGoToMonth write FOnGoToMonth;
    property TankFarmName: string read FTankFarmName write FTankFarmName;
  end;

var
  BaseMeteringRefForm: TBaseTovarOperRefForm;

implementation

uses ExFunc, UDbFunc;

{$R *.DFM}

procedure TBaseTovarOperRefForm.bbSearchClick(Sender: TObject);
begin
  inherited;
  q.Close;
  q.ParamByName('BeginDate').asDate := deBeginDate.Date;
  q.ParamByName('EndDate').asDate := deEndDate.Date;
  q.RestoreSQL;
  _OpenQuery(q);
end;

procedure TBaseTovarOperRefForm.FormShow(Sender: TObject);
begin
  inherited;
  bbSearch.Click;
//  cbShowDetail.Checked := True;
//  cbShowDetailClick(cbShowDetail);
end;

procedure TBaseTovarOperRefForm.FormCreate(Sender: TObject);
begin
  inherited;
  SetCurrentMonth(deBeginDate, deEndDate);
end;

procedure TBaseTovarOperRefForm.sbTotalClick(Sender: TObject);
begin
  if sbTotal.Down then
    dbGrid1.FooterRowCount := 1
  else
    dbGrid1.FooterRowCount := 0;
  DBGridDetail.FooterRowCount := dbGrid1.FooterRowCount;
end;

procedure TBaseTovarOperRefForm.qFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  Accept := True;
  if eProduct.Text <> '' then
    Accept := Accept and (pos(AnsiUpperCase(eProduct.Text), AnsiUpperCase(DataSet.FieldBYName('PRODUCT_NAME').AsString)) > 0);
  if eFrom.Text <> '' then
    Accept := Accept and (pos(AnsiUpperCase(eFrom.Text), AnsiUpperCase(DataSet.FieldBYName('TANK_FROM').AsString)) > 0);
  if eTo.Text <> '' then
    Accept := Accept and (pos(AnsiUpperCase(eTo.Text), AnsiUpperCase(DataSet.FieldBYName('TANK_TO').AsString)) > 0);
end;

procedure TBaseTovarOperRefForm.eProductChange(Sender: TObject);
begin
  inherited;
  q.Filtered := False;
  q.Filtered := True;  
end;

procedure TBaseTovarOperRefForm.DBGrid1CellClick(Column: TColumnEh);
begin
  inherited;
  if (q.ParamByName('BeginDate').AsDate <> deBeginDate.Date) or(q.ParamByName('EndDate').AsDate <> deEndDate.Date) then
    bbSearch.Click;
end;

procedure TBaseTovarOperRefForm.DBGrid1CheckRowHaveDetailPanel(
  Sender: TCustomDBGridEh; var RowHaveDetailPanel: Boolean);
begin
  inherited;
  RowHaveDetailPanel := q.FieldByName('is_have_det').AsInteger = 1;
end;

procedure TBaseTovarOperRefForm.DBGrid1RowDetailPanelShow(
  Sender: TCustomDBGridEh; var CanShow: Boolean); 
begin
  inherited;
  if not (q.FieldByName('tank_from').AsString = 'жд приход') then
    begin
      if not qDetail.Active then
        _OpenQueryPar(qDetail,
        ['BeginDate', q.ParamByName('BeginDate').AsDateTime,
         'EndDate',   q.ParamByName('EndDate').AsDateTime])
      else
        // Уже открывается, ждем пока откроется
        while qDetail.Active and not qDetail.Fetched do
        Sleep(100);

      qDetail.Filter :=
      ' DATE_RASH = ' + QuotedStr(FormatDateTime('dd.mm.yyyy hh:nn:ss', q.FieldByName('TR_DATE').AsDateTime)) +
      ' and RRA_NUM = ' +  q.FieldByName('TANK_FROM').AsString;
      qDetail.Filtered := True;
      CanShow := (qDetail.RecordCount > 0);
      grDetailAuto.Visible:=True;
      grDetailTank.Visible:=False;
      grDetailAuto.Align:=alClient;
      lDetailTank.Caption :=
      'Расходы '+FTankFarmName+': Месяц: '+ q.FieldByName('MONYEAR').AsString +' \ Нефтепродукт: '+ q.FieldByName('PRODUCT_NAME').AsString;
      // Поместить грид детализацию расходы в панель pGridRow и развернуть
      pDetailTank.Parent := pGridRow;
      grDetailAuto.Parent := pGridRow;
      pBase.Align := alTop;
      pGridRow.Align := alClient;
      pGridRow.Visible := true;
      pBase.Visible := not pGridRow.Visible;
    end
  else
    begin
      qDetailTank.Close;
      qDetailTank.ParamByName('trans_id').AsInteger := q.FieldByName('transfer_id').AsInteger;
      qDetailTank.Open;
      CanShow := (qDetailTank.RecordCount > 0);
      grDetailAuto.Visible:=False;
      grDetailTank.Visible:=True;
      grDetailTank.Align:=alClient;
      lDetailTank.Caption :=
      'Приходы '+FTankFarmName+': Месяц: '+ q.FieldByName('MONYEAR').AsString +' \ Нефтепродукт: '+ q.FieldByName('PRODUCT_NAME').AsString;
      // Поместить грид детализацию жд приходы в панель pGridRow и развернуть
      pDetailTank.Parent := pGridRow;
      grDetailTank.Parent := pGridRow;
      pBase.Align := alTop;
      pGridRow.Align := alClient;
      pGridRow.Visible := true;
      pBase.Visible := not pGridRow.Visible;
    end;
end;

procedure TBaseTovarOperRefForm.DBGrid1RowDetailPanelHide(
  Sender: TCustomDBGridEh; var CanHide: Boolean);
begin
  inherited;
    qDetail.Close;
    qDetailTank.Close;
    pDetailTank.Parent := DBGrid1.RowDetailPanelControl;
    grDetailTank.Parent := DBGrid1.RowDetailPanelControl;
    grDetailAuto.Parent := DBGrid1.RowDetailPanelControl;
    pGridRow.Align := alTop;
    pBase.Align := alClient;
    pGridRow.Visible := false;
    pBase.Visible := not pGridRow.Visible;
    DBGrid1.RowDetailPanel.Active := true;
end;

procedure TBaseTovarOperRefForm.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if q.FieldByName('is_have_det').AsInteger = 1 then
    DBGrid1.RowDetailPanel.Visible := not DBGrid1.RowDetailPanel.Visible;
end;

procedure TBaseTovarOperRefForm.sbBackToMonthClick(Sender: TObject);
begin
  inherited;
  if Assigned(FOnGoToMonth) then
    FOnGoToMonth(Self)
  else
  begin
    DBGrid1.RowDetailPanel.Visible := False;
  end;
end;

initialization
  RegisterClass(TBaseTovarOperRefForm);

end.
