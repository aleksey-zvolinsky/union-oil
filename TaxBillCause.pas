(**
   Предназначение : Форма для правки печати НН с определенными видом источника(OIL_NN_CAUSE).
     Даеться выбор способа расчета НДС, типа товара, и схемы печати...
     вызов этой формы производиться из таксбила процедурой EditCause(), собствено в тот же
     момент и беруться значения для редактируемых полей.
     По умолчанию форму редактировать нельзя возможность открываеться при запуска программы с
     ключем @EditKey
   Создана в ноябре 2005 года.
*)
unit TaxBillCause;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBAccess, Ora, Grids, DBGridEh, MemDS, StdCtrls, Buttons, ExtCtrls,
  uCommonForm,uOilQuery,uOilStoredProc;

type
  TTaxBillCauseForm = class(TCommonForm)
    q: TOilQuery;
    dbg: TDBGridEh;
    ds: TOraDataSource;
    qID: TFloatField;
    qNAME_: TStringField;
    qCOMMENT_: TStringField;
    qHIDE: TStringField;
    qSCHEME: TFloatField;
    qTOVAR_TYPE: TFloatField;
    qNDS_CALC_ORIENTATION: TFloatField;
    pBtn: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    qDECIMAL_COUNT: TFloatField;
    qDECIMAL_PRICE: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgColEnter(Sender: TObject);
    procedure dbgCellClick(Column: TColumnEh);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  TaxBillCauseForm: TTaxBillCauseForm;

implementation

uses
  UDbFunc,OilStd,Main;
const
  EditKey='CAUSEEDIT';

{$R *.DFM}

procedure TTaxBillCauseForm.FormShow(Sender: TObject);
var
  CurField:integer;
begin
  try
    q.Close;
    StartSQLOra;
    _OpenQueryOra(q);
  finally
    if not(SysParamExists(EditKey)) then
    begin
      for CurField:=0 to q.Fields.Count-1 do
        q.Fields[CurField].ReadOnly:=True;
      bbOk.Visible:=False;
    end;
  end;
  q.Edit;
end;

procedure TTaxBillCauseForm.bbOkClick(Sender: TObject);
begin
  q.Post;
  CommitSQLOra;
  Self.ModalResult:=mrOk;
end;

procedure TTaxBillCauseForm.bbCancelClick(Sender: TObject);
begin
  RollbackSQLOra;
  Self.ModalResult:=mrCancel;
end;

procedure TTaxBillCauseForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  q.Close;
end;

procedure TTaxBillCauseForm.dbgColEnter(Sender: TObject);
begin
  q.Edit;
end;

procedure TTaxBillCauseForm.dbgCellClick(Column: TColumnEh);
begin
  q.Edit;
end;

end.
