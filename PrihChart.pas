unit PrihChart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, DB, MemDS, DBAccess, Ora, ExtCtrls, TeeProcs,
  Chart, DBChart, StdCtrls, Mask, ToolEdit, Math, UDbFunc;

type
  TPrihChartForm = class(TForm)
    Chart: TDBChart;
    qChart: TOraQuery;
    DocSeries: TBarSeries;
    FactSeries: TBarSeries;
    DiffAgrSeries: TLineSeries;
    DiffSeries: TBarSeries;
    pnlFilters: TPanel;
    pnlChartDate: TPanel;
    lblBeginDate: TLabel;
    lblEndDate: TLabel;
    deBeginDate: TDateEdit;
    deEndDate: TDateEdit;
    lblTitleChart: TLabel;
    procedure FormShow(Sender: TObject);
    procedure DiffSeriesBeforeDrawValues(Sender: TObject);
    procedure deBeginDateChange(Sender: TObject);
  private
    FFuelId: integer;
    procedure SetFuelId(const Value: integer);
  public
    property FuelId: integer read FFuelId write SetFuelId;
    procedure RefreshData;
  end;

var
  PrihChartForm: TPrihChartForm;

implementation

{$R *.dfm}

procedure TPrihChartForm.FormShow(Sender: TObject);
begin
  RefreshData;
end;

procedure TPrihChartForm.RefreshData;
begin
  qChart.Close;
  qChart.ParamByName('BeginDate').AsDateTime := deBeginDate.Date;
  qChart.ParamByName('EndDate').AsDateTime := deEndDate.Date;
  qChart.ParamByName('fuel_id').AsInteger := FuelId;
  qChart.Open;
end;

procedure TPrihChartForm.DiffSeriesBeforeDrawValues(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to DiffSeries.Count - 1 do
    case sign(DiffSeries.YValues[i]) of
       1: DiffSeries.ValueColor[i] := clGreen;
      -1: DiffSeries.ValueColor[i] := clRed;
    end;
end;

procedure TPrihChartForm.deBeginDateChange(Sender: TObject);
begin
  RefreshData;
end;

procedure TPrihChartForm.SetFuelId(const Value: integer);
begin
  lblTitleChart.Caption := Format('Разница при приходе по топливу %s',[GetNpGName(Value)]);
  FFuelId := Value;
end;

end.
