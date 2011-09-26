unit BaseAutoZamerRef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Base, DBGridEhGrouping, ActnList, Menus, DB, MemDS, DBAccess,
  Ora, uOilQuery, RXCtrls, GridsEh, DBGridEh, ExtCtrls, StdCtrls, Buttons,
  Mask, DBCtrlsEh;

type
  TBaseAutoZamerRefForm = class(TBaseForm)
    dteBeginDate: TDBDateTimeEditEh;
    lblDate: TLabel;
    lblEndDate: TLabel;
    dteEndDate: TDBDateTimeEditEh;
    qREZ_NAME: TStringField;
    qDATETIME: TDateTimeField;
    qLITR: TFloatField;
    qWEIGHT: TFloatField;
    qFUEL_LEVEL: TFloatField;
    qDENSITY: TFloatField;
    lblRez: TLabel;
    Rez: TEdit;
    procedure bbSearchClick(Sender: TObject);
    procedure dteBeginDateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure RezChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseAutoZamerRefForm: TBaseAutoZamerRefForm;

implementation

{$R *.dfm}

procedure TBaseAutoZamerRefForm.bbSearchClick(Sender: TObject);
begin
  inherited;
  q.Close;
  q.ParamByName('BeginDate').AsDateTime := dteBeginDate.Value;
  q.ParamByName('EndDate').AsDateTime := dteEndDate.Value;
  q.Open;
end;

procedure TBaseAutoZamerRefForm.dteBeginDateChange(
  Sender: TObject);
begin
  inherited;
  if (dteBeginDate.Value <> null) and (dteEndDate.Value <> null) then
    bbSearch.Click;
end;

procedure TBaseAutoZamerRefForm.FormCreate(Sender: TObject);
begin
  inherited;
  dteBeginDate.Value:= Date()-1;
  dteEndDate.Value:= Date()+1;
end;

procedure TBaseAutoZamerRefForm.qFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept := true;
  // Резервуар
  if Accept and (Rez.Text <> '') then
    Accept := AnsiUpperCase(Rez.Text) = AnsiUpperCase(DataSet.FieldBYName('REZ_NAME').AsString);
end;

procedure TBaseAutoZamerRefForm.RezChange(Sender: TObject);
begin
  inherited;
  q.Filtered:=false;
  q.Filtered:=true;
end;

end.
