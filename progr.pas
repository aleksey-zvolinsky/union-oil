unit Progr;

{$I define}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Gauges, RXCtrls, ComCtrls, ExtCtrls, {uCommonForm,}uOilQuery,Ora, uOilStoredProc;

type
  {$IFNDEF OILPOST}
  TProgrForm = class(TForm)
    Gauge: TGauge;
    Panel: TPanel;
    Image: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function GetProgress:integer;
    procedure SetProgress(AValue:integer);
    function GetMaxValue:integer;
    procedure SetMaxValue(AValue:integer);
    function GetPercentDone:integer;
  public
    property Progress:integer read GetProgress write SetProgress;
    property MaxValue:integer read GetMaxValue write SetMaxValue;
    property PercentDone:integer read GetPercentDone;
    procedure Repaint();override;
    procedure AddProgress(AValue:integer);
    procedure Refresh();
    class function CreateBar(AOwner:TComponent):TProgrForm;
  end;
  {$ENDIF}

  {$IFDEF OILPOST}
  TProgrForm = class(TComponent)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function GetPercentDone:integer;
  public
    Progress:integer;
    MaxValue:integer;
    property PercentDone:integer read GetPercentDone;
    procedure Repaint();
    procedure AddProgress(AValue:integer);
    procedure Refresh();
    class function CreateBar(AOwner:TComponent):TProgrForm;
  end;
  {$ENDIF}

var
  ProgrForm: TProgrForm;

implementation

{$R *.DFM}

procedure TProgrForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {$IFNDEF OILPOST}
  Gauge.Progress := 0;
  {$ENDIF}
end;

{$IFNDEF OILPOST}
function TProgrForm.GetProgress:integer;
begin
  Result:=Gauge.Progress;
end;
procedure TProgrForm.SetProgress(AValue:integer);
begin
  Gauge.Progress:=AValue;
end;
{$ENDIF}

procedure TProgrForm.Repaint();
begin
  {$IFNDEF OILPOST}
  inherited;
  Gauge.Repaint;
  {$ENDIF}
end;

procedure TProgrForm.AddProgress(AValue:integer);
begin
  {$IFDEF OILPOST}
  inc(Progress, AValue);
  {$ELSE}
  Gauge.AddProgress(AValue);
  {$ENDIF}
end;

{$IFNDEF OILPOST}
function TProgrForm.GetMaxValue:integer;
begin
  Result := Gauge.MaxValue;
end;
procedure TProgrForm.SetMaxValue(AValue:integer);
begin
  Gauge.MaxValue := AValue;
end;
{$ENDIF}

function TProgrForm.GetPercentDone;
begin
  {$IFDEF OILPOST}
  Result := trunc((Self.MaxValue/100)*Self.Progress);
  {$ELSE}
  Result := Gauge.PercentDone;
  {$ENDIF}
end;

procedure TProgrForm.Refresh();
begin
  {$IFNDEF OILPOST}
  Gauge.Refresh;
  {$ENDIF}
end;

class function TProgrForm.CreateBar(AOwner: TComponent): TProgrForm;
begin
  Result := TProgrForm.Create(AOwner);
end;

end.
