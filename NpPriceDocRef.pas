unit NpPriceDocRef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Base, ActnList, Menus, DB, MemDS, DBAccess, Ora, uOilQuery,
  RXCtrls, Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit,
  NPTypeRef, DBGridEhGrouping, GridsEh;

type
  TNpPriceDocRefForm = class(TBaseForm)
    deDateBegin: TDateEdit;
    lblDateOnEnd: TLabel;
    deDateEnd: TDateEdit;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
  private
    function  GetVisibleCod: TNpTypeCod;
    procedure SetVisibleCod(const Value: TNpTypeCod);
  public
    property VisibleCod: TNpTypeCod read GetVisibleCod write SetVisibleCod;
  end;
  
var
  NpPriceDocRefForm: TNpPriceDocRefForm;

implementation

uses UDbFunc, NpPriceDocEdit, Main, uCommonForm, ExFunc, PrihSop;

{$R *.dfm}

procedure TNpPriceDocRefForm.FormShow(Sender: TObject);
begin
  inherited;
  SetCurrentMonth(deDateBegin, deDateEnd);
  CommonVisibleCodInit(DBGridDetail);
end;

procedure TNpPriceDocRefForm.bbSearchClick(Sender: TObject);
begin
  inherited;
  q.Close;
  _OpenQueryPar(q,
   ['DateBegin', deDateBegin.Date,
    'DateEnd', deDateEnd.Date]);
end;

function TNpPriceDocRefForm.GetVisibleCod: TNpTypeCod;
begin
  Result := CommonGetVisibleCod(DBGridDetail);
end;

procedure TNpPriceDocRefForm.SetVisibleCod(const Value: TNpTypeCod);
begin
  CommonSetVisibleCod(DBGridDetail, Value);
end;

procedure TNpPriceDocRefForm.sbAddClick(Sender: TObject);
begin
  inherited;
  TNpPriceDocEditForm.Edit(0.0, 0);
  bbSearch.Click;
end;

procedure TNpPriceDocRefForm.sbEditClick(Sender: TObject);
begin
  inherited;
  if not q.IsEmpty then
  begin
    TNpPriceDocEditForm.Edit(
      q.FieldByName('date_on').AsDateTime,
      q.FieldByName('inst').AsInteger);
    bbSearch.Click;
  end;  
end;

procedure TNpPriceDocRefForm.sbDelClick(Sender: TObject);
begin
  inherited;
  if (q.FieldByName('inst').AsInteger = INST) and not q.IsEmpty then 
    if MessageDlg(TranslateText('¬ы уверены что хотите удалить запись?'),
        mtConfirmation, [mbYes, mbNo], 0) = mrYes
    then
      begin
        _ExecSql('update OIL_NP_PRICE set state = ''N'' where date_on = :date_on and inst = :inst',
        ['date_on', q.FieldByName('date_on').AsDateTime,
        'inst', q.FieldByName('inst').AsInteger]);

        _ExecSql('update OIL_PRICE_ORDER set state = ''N''  ' +
        'where id in (select t.price_order_id from OIL_NP_PRICE t ' +
        'where t.date_on = :date_on and t.inst = :inst)',
        ['date_on', q.FieldByName('date_on').AsDateTime,
        'inst', q.FieldByName('inst').AsInteger]);
      end;
end;

end.

