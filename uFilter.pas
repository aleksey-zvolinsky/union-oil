unit uFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, ExtCtrls;

type
  TFilterTypes = (ftDate);
  TFilterForm = class(TForm)
    pnlBtn: TPanel;
    pnlDate: TPanel;
    LblBeginDate: TLabel;
    deBeginDate: TDateEdit;
    LblEndDate: TLabel;
    deEndDate: TDateEdit;
    pBtn: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    procedure bbOkClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    FilterType: set of ftDate..ftDate;
    class function GetDates(var ABeginDate, AEndDate: TDateTime): boolean;
  end;

var
  FilterForm: TFilterForm;


implementation

{$R *.dfm}

class function TFilterForm.GetDates(var ABeginDate, AEndDate: TDateTime): boolean;
begin
  Result := false;
  FilterForm := TFilterForm.Create(Application);
  try
    FilterForm.FilterType := [ftDate];
    FilterForm.deBeginDate.Date := ABeginDate;
    FilterForm.deEndDate.Date := AEndDate;
    if FilterForm.ShowModal = mrOk then
    begin
      ABeginDate := FilterForm.deBeginDate.Date;
      AEndDate := FilterForm.deEndDate.Date;
      Result := true;
    end;
  finally
    FilterForm.Free;
  end;
end;

procedure TFilterForm.bbOkClick(Sender: TObject);
begin
  self.ModalResult := mrOk;
end;

procedure TFilterForm.bbCancelClick(Sender: TObject);
begin
  self.ModalResult := mrCancel;
end;

end.
