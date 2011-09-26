unit Bank;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables,MAIN, ExtCtrls, Ora, uCommonForm,uOilQuery,uOilStoredProc,
  MemDS, DBAccess;

type
  TBankForm = class(TCommonForm)
    sp: TOilStoredProc;
    q1: TOilQuery;
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edMFO: TEdit;
    edName: TEdit;
    Label3: TLabel;
    edNameUkr: TEdit;
    procedure Test;
    procedure Save;
    procedure bbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Id,Inst: integer;
  end;

var
  BankForm: TBankForm;

function EditBank(p_Id,p_Inst: integer): string;

implementation

{$R *.DFM}

uses uStart, uDbFunc;
//==============================================================================
function EditBank(p_Id,p_Inst: integer): string;
var
  F: TBankForm;
  q: TOilQuery;
begin
  F:=TBankForm.Create(Application);
  F.Id:=p_Id;
  F.Inst:=p_Inst;
  if F.Id<>0 then begin
    q:=TOilQuery.Create(nil);
    q.Session:=frmStart.OraSession1;
    q.Sql.Text:=Format(
      ' select * from v_oil_bank where id=%d and inst=%d',
      [F.Id,F.Inst]);
    _OpenQueryOra(q);
    F.edMFO.Text:=q.FieldByName('mfo').AsString;
    F.edName.Text:=q.FieldByName('name_rus').AsString;
    F.edNameUkr.Text:=q.FieldByName('name_ukr').AsString;
  end;
  if F.ShowModal=mrOk then
    result:=F.edName.Text;
  F.Free;
end;
//==============================================================================
procedure TBankForm.Test;
begin
  if edMFO.Text='' then
    raise exception.create(TranslateText('Введите МФО'));
  if edName.Text='' then
    raise exception.create(TranslateText('Введите наименование'));
end;
//==============================================================================
procedure TBankForm.Save;
begin
  DBSaver.SaveRecord('OIL_BANK',
    ['id',       Id,
     'inst',     Inst,
     'state',    'Y',
     'mfo',      edMFO.Text,
     'name',     edName.Text,
     'name_ukr', edNameUkr.Text],not frmStart.OraSession1.InTransaction);
end;
//==============================================================================
procedure TBankForm.bbOkClick(Sender: TObject);
begin
  Test;
  Save;
end;
//==============================================================================
end.
