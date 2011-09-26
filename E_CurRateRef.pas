unit E_CurRateRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGridEh, Buttons, StdCtrls,
  ExtCtrls, ToolEdit, Mask, RxLookup, ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess;

type
  TE_CurRateRefForm = class(TBaseForm)
    qID: TFloatField;
    qINST: TFloatField;
    qDATE_: TDateTimeField;
    qCURRENCY_ID: TFloatField;
    qCURRENCY_NAME: TStringField;
    qRATE: TFloatField;
    Label1: TLabel;
    cbCurrency: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    DES: TDateEdit;
    DEPo: TDateEdit;
    procedure ActivateQ;
    procedure FormCreate(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
  private
  public
  end;

var
  E_CurRateRefForm: TE_CurRateRefForm;

implementation

{$R *.DFM}

uses E_Var, E_CurRate;

//==============================================================================
procedure TE_CurRateRefForm.ActivateQ;
begin
  if q.Active then q.Close;
  q.SQL.Text := q.BaseSQL;
  q.AddWhere(' trunc(date_) between '''+ DateTimeToStr(DES.Date) +''' and '''+ DateTimeToStr(DEPo.Date) +''' ');
  if cbCurrency.Tag <> 0 then q.AddWhere(' currency_id= '+ IntToStr(cbCurrency.Tag) +' ');
  q.Open;
end;
//==============================================================================
procedure TE_CurRateRefForm.FormCreate(Sender: TObject);
var
  Day, Month, Year: word;
  d: TDate;
begin
  inherited;
  DecodeDate(Date, Year, Month, Day);
  DES.Date := EncodeDate(Year, Month, 1);
  if Month = 12 then d := EncodeDate(Year+1, 1, 1)
  else d := EncodeDate(Year, Month+1, 1);
  d := d - 1;
  DEPo.Date := d;
  OpenCurrency(cbCurrency, 2, false);
  ActivateQ;
end;
//==============================================================================
procedure TE_CurRateRefForm.sbAddClick(Sender: TObject);
begin
  inherited;
  AddCurRate;
  ActivateQ;
end;
//==============================================================================
procedure TE_CurRateRefForm.bbSearchClick(Sender: TObject);
begin
  inherited;
  ActivateQ;
end;
//==============================================================================
procedure TE_CurRateRefForm.sbEditClick(Sender: TObject);
begin
  inherited;
  if not q.IsEmpty then EditCurRate(qId.AsInteger, qInst.AsInteger)
  else AddCurRate;
  ActivateQ;
end;
//==============================================================================

end.
