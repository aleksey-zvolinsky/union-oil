unit BaseMeteringRef;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, StdCtrls, ToolEdit, Mask, Menus, Db, DBTables, Grids, DBGridEh,
  Buttons, ExtCtrls, RXCtrls, MemDS, DBAccess, Ora, ActnList, uOilQuery,
  uOilStoredProc, Variants, GridsEh, DBGridEhGrouping;

type
  TBaseMeteringRefForm = class(TBaseForm)
    deBeginDate: TDateEdit;
    Label1: TLabel;
    deEndDate: TDateEdit;
    Label7: TLabel;
    qChecker: TOilQuery;
    miPrintTax: TMenuItem;
    N2: TMenuItem;
    qDetailDATAZAMERA: TDateTimeField;
    qDetailACT: TFloatField;
    qDetailNAME: TStringField;
    qDetailUROVEN_MM: TFloatField;
    qDetailUROVEN_VODI_MM: TFloatField;
    qDetailLITR: TFloatField;
    qDetailDENSITY: TFloatField;
    qDetailWEIGHT: TFloatField;
    qDetailTEMPER: TFloatField;
    qMETERING_ACT_ID: TFloatField;
    qACT_TYPE_NAME: TStringField;
    qACT_DATE: TDateTimeField;
    qLOCKED_TEXT: TStringField;
    qDetailTANK_ID: TStringField;
    procedure bbSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure deBeginDateChange(Sender: TObject);
  private
  public
  end;

var
  BaseMeteringRefForm: TBaseMeteringRefForm;

implementation

uses ExFunc, UDbFunc;

{$R *.DFM}


procedure TBaseMeteringRefForm.bbSearchClick(Sender: TObject);
begin
  inherited;
  q.Close;
  q.ParamByName('BeginDate').asDate := deBeginDate.Date;
  q.ParamByName('EndDate').asDate := deEndDate.Date;
  q.RestoreSQL;
  _OpenQuery(q);
end;

procedure TBaseMeteringRefForm.FormShow(Sender: TObject);
begin
  inherited;
  bbSearch.Click;
  cbShowDetail.Checked := True;
  cbShowDetailClick(cbShowDetail);
end;

procedure TBaseMeteringRefForm.FormCreate(Sender: TObject);
begin
  inherited;
  SetCurrentMonth(deBeginDate, deEndDate);
end;

procedure TBaseMeteringRefForm.deBeginDateChange(Sender: TObject);
var
  day, month, year: word;
  date1, date2: TDateTime;
begin
  DecodeDate(deBeginDate.Date, Year, Month, Day);
  GetMonthLimits(month, year, date1, date2);
  deBeginDate.Date := date1;
  deEndDate.Date := date2;
end;

initialization
  RegisterClass(TBaseMeteringRefForm);

end.
