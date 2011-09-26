unit RashChart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, DB, MemDS, DBAccess, Ora, ExtCtrls, TeeProcs,
  Chart, DBChart, StdCtrls, Mask, ToolEdit, Math, UDbFunc;

type
  TRashChartForm = class(TForm)
    Chart: TDBChart;
    qChart: TOraQuery;
    pnlFilters: TPanel;
    pnlChartDate: TPanel;
    lblBeginDate: TLabel;
    lblEndDate: TLabel;
    deBeginDate: TDateEdit;
    deEndDate: TDateEdit;
    OutSeries: TLineSeries;
    OutReducedSeries: TLineSeries;
    DiffSeries: TLineSeries;
    TempSeries: TLineSeries;
    lblTitleChart: TLabel;
    procedure FormShow(Sender: TObject);
    procedure deBeginDateChange(Sender: TObject);
  private
    FFuelId: integer;
    procedure SetFuelId(const Value: integer);
  public
    property FuelId: integer read FFuelId write SetFuelId;
    procedure RefreshData;
  end;

var
  RashChartForm: TRashChartForm;

implementation

{$R *.dfm}

procedure TRashChartForm.FormShow(Sender: TObject);
begin
  RefreshData;
end;

procedure TRashChartForm.RefreshData;
begin
  qChart.Close;
  qChart.ParamByName('BeginDate').AsDateTime := deBeginDate.Date;
  qChart.ParamByName('EndDate').AsDateTime := deEndDate.Date;
  qChart.ParamByName('fuel_id').AsInteger := FuelId;
  qChart.Open;
end;

procedure TRashChartForm.deBeginDateChange(Sender: TObject);
begin
  RefreshData;
end;

procedure TRashChartForm.SetFuelId(const Value: integer);
begin
  lblTitleChart.Caption := Format('Разница при отпуске топлива %s',[GetNpGName(Value)]);
  FFuelId := Value;
end;

end.
