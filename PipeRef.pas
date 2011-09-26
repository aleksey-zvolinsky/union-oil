unit PipeRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls,
  addPipe, Mask, ToolEdit, ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess, DBGridEh;

type
  TPipeRefForm = class(TBaseForm)
    qID: TFloatField;
    qINST: TFloatField;
    qSTATE: TStringField;
    qORG_ID: TFloatField;
    qORG_INST: TFloatField;
    qBOUNDS: TStringField;
    qDIAMETER: TFloatField;
    qLENGTH_: TFloatField;
    qNAME: TStringField;
    delQ: TOilQuery;
    edFrom: TComboEdit;
    Label1: TLabel;
    procedure bbSearchClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure edFromButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    org_id, org_inst      :integer;
  end;

var
  PipeRefForm: TPipeRefForm;

implementation

uses
  ChooseOrg, Main, OilStd;

{$R *.DFM}

procedure TPipeRefForm.bbSearchClick(Sender: TObject);
begin
  inherited;
  q.Close;
  q.sql.clear;
  q.sql.add('select op.*, oo.name from');
  q.sql.add('oil_pipe op,');
  q.sql.add('v_org oo');
  q.sql.add('where');
  q.sql.add('op.state = ''Y'' and');
  q.sql.add('oo.State = ''Y'' and');
  q.sql.add('op.org_id = oo.id and');
  q.sql.add('op.org_inst = oo.inst');
  if Org_id <> 0 then
  begin
    q.sql.add(' and op.org_id = '+IntToStr(org_id));
    q.sql.add(' and op.org_inst = '+IntToStr(Org_inst));
  end;
  q.open;
end;

procedure TPipeRefForm.sbAddClick(Sender: TObject);
var
  AddPipeForm       :TAddPipeForm;
begin
  inherited;
  Application.CreateForm(TAddPipeForm, AddPipeForm);
  AddPipeForm.ShowModal;
  If AddPipeForm.ModalResult = mrOk Then
  Begin
    bbSearchClick(Nil);
  End;
  AddPipeForm.Free;
end;

procedure TPipeRefForm.FormShow(Sender: TObject);
begin
  inherited;
  bbSearchClick(nil);
end;

procedure TPipeRefForm.sbEditClick(Sender: TObject);
var
  AddPipeForm       :TAddPipeForm;
begin
  inherited;
  Application.CreateForm(TAddPipeForm, AddPipeForm);
  with addPipeForm do
  begin
    edId.Text:=qID.AsString;
    edFrom.Text:=qName.asString;
    Org_id:=qOrg_id.asInteger;
    Org_Inst:=qOrg_inst.AsInteger;
    edBounds.Text:=qBounds.AsString;
    rceDiam.Value:=qDiameter.AsFloat;
    rceLength.Value:=qLength_.asFloat;
    inst_:=qInst.asInteger;
  end;
  AddPipeForm.ShowModal;
  If AddPipeForm.ModalResult = mrOk Then
  Begin
    bbSearchClick(Nil);
  End;
  AddPipeForm.Free;
end;

procedure TPipeRefForm.sbDelClick(Sender: TObject);
begin
  inherited;
  if q.active and (q.RecordCount > 0) then
    If MessageDlg(TranslateText('¬ы уверены что хотите удалить запись?'),
      mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    begin
      delQ.ExecSQL;
      delQ.Close;
      bbSearchClick(nil);
    end;
end;

procedure TPipeRefForm.FormCreate(Sender: TObject);
begin
  inherited;
  org_id := 0;
  org_inst := 0;
  edFrom.Text:= '';
end;

procedure TPipeRefForm.bbClearClick(Sender: TObject);
begin
  inherited;
  org_id := 0;
  org_inst := 0;
  edFrom.Text:= '';
end;

procedure TPipeRefForm.edFromButtonClick(Sender: TObject);
var vId,vInst:integer;
    vName:string;
begin
  if ChooseOrg.CaptureOrg(1,Main_id,Inst,'yyy',vId,vInst,vName) then
  begin
    edFrom.Text:=vName;
    org_id:=vId;
    org_inst:=vInst;
  end;
end;

end.
