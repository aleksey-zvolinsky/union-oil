unit uTaxBillCause;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBAccess, Ora, Grids, DBGridEh, MemDS, StdCtrls, Buttons, ExtCtrls,uOilQuery,uOilStoredProc;

type
  TTaxBillCause = class(TCommonForm)
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
    procedure FormShow(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgColEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  TaxBillCause: TTaxBillCause;

implementation

uses
  UDbFunc,OilStd,Main;

{$R *.DFM}

procedure TTaxBillCause.FormShow(Sender: TObject);
var
  CurCol,CurStr:integer;
begin
//  If not(Debugging) then
  // этот не хитрый кусок кода убирает с PickList коментарий вываливаемых списков
  For CurCol:=0 to dbg.Columns.Count-1 do
  begin
    for CurStr:=0 to dbg.Columns.Items[CurCol].PickList.Count-1 do
      if pos('//',dbg.Columns.Items[CurCol].PickList[CurStr])<>0 then
        dbg.Columns.Items[CurCol].PickList[CurStr]:=Copy(
          dbg.Columns.Items[CurCol].PickList[CurStr],
          1,
          pos('//',dbg.Columns.Items[CurCol].PickList[CurStr])-1);
  end;
  q.Close;
  StartSQLOra;
  _OpenQueryOra(q);
  q.Edit;
end;

procedure TTaxBillCause.bbOkClick(Sender: TObject);
begin
  q.Post;
  CommitSQLOra;
  Self.ModalResult:=mrOk;
end;

procedure TTaxBillCause.bbCancelClick(Sender: TObject);
begin
  RollbackSQLOra;
  Self.ModalResult:=mrCancel;
end;

procedure TTaxBillCause.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  q.Close;
end;

procedure TTaxBillCause.dbgColEnter(Sender: TObject);
begin
  q.Edit;
end;

end.
