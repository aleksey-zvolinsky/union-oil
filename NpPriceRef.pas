unit NpPriceRef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Base, ActnList, Menus, DB, MemDS, DBAccess, Ora, uOilQuery,
  RXCtrls, Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit,
  NPTypeRef;

type
  TNpPriceRefForm = class(TBaseForm)
    deDateBegin: TDateEdit;
    lblDateOn: TLabel;
    deDateEnd: TDateEdit;
    lblDateOnEnd: TLabel;
    procedure bbSearchClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function GetVisibleCod: TNpTypeCod;
    procedure SetVisibleCod(const Value: TNpTypeCod);
  public
    property VisibleCod: TNpTypeCod read GetVisibleCod write SetVisibleCod;
  end;

var
  NpPriceRefForm: TNpPriceRefForm;

implementation

uses UDbFunc, NpPriceEdit, Main, uCommonForm, ExFunc, PrihSop;

{$R *.dfm}

procedure TNpPriceRefForm.bbSearchClick(Sender: TObject);
begin
  inherited;
  q.Close;
  _OpenQueryPar(q,
   ['DateBegin', deDateBegin.Date,
    'DateEnd', deDateEnd.Date]);
end;

procedure TNpPriceRefForm.sbAddClick(Sender: TObject);
begin
  inherited;
  TNpPriceEditForm.Edit(0.0, 0);
  bbSearch.Click;
end;

procedure TNpPriceRefForm.sbEditClick(Sender: TObject);
begin
  inherited;
  if not q.IsEmpty then
  begin
    TNpPriceEditForm.Edit(
      q.FieldByName('date_on').AsDateTime,
      q.FieldByName('inst').AsInteger);
    bbSearch.Click;
  end;
end;

procedure TNpPriceRefForm.sbDelClick(Sender: TObject);
begin
  inherited;
  if (q.FieldByName('inst').AsInteger = INST) and not q.IsEmpty then 
    if MessageDlg(TranslateText('¬ы уверены что хотите удалить запись?'),
        mtConfirmation, [mbYes, mbNo], 0) = mrYes
    then
      _ExecSql('update OIL_NP_PRICE set state = ''N'' where date_on = :date_on and inst = :inst',
       ['date_on', q.FieldByName('date_on').AsDateTime,
        'inst', q.FieldByName('inst').AsInteger]);
end;

procedure TNpPriceRefForm.FormShow(Sender: TObject);
begin
  inherited;
  SetCurrentMonth(deDateBegin, deDateEnd);
  CommonVisibleCodInit(DBGridDetail);  
end;

function TNpPriceRefForm.GetVisibleCod: TNpTypeCod;
begin
  Result := CommonGetVisibleCod(DBGridDetail);
end;

procedure TNpPriceRefForm.SetVisibleCod(const Value: TNpTypeCod);
begin
  CommonSetVisibleCod(DBGridDetail, Value);
end;

end.
