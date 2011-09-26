unit PipeRestsRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls,
  ToolEdit, Mask, ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc, MemDS,
  DBAccess, DBGridEh;

type
  TPipeRestsRefForm = class(TBaseForm)
    qID: TFloatField;
    qINST: TFloatField;
    qSTATE: TStringField;
    qPIPE_ID: TFloatField;
    qPIPE_INST: TFloatField;
    qNP_TYPE: TFloatField;
    qDATE_: TDateTimeField;
    qTEMPERATURE: TFloatField;
    qUD_VEIGHT: TFloatField;
    qID_1: TFloatField;
    qINST_1: TFloatField;
    qSTATE_1: TStringField;
    qORG_ID: TFloatField;
    qORG_INST: TFloatField;
    qBOUNDS: TStringField;
    qDIAMETER: TFloatField;
    qLENGTH_: TFloatField;
    qNTYPE: TStringField;
    qVOL: TFloatField;
    qMASS: TFloatField;
    qONAME: TStringField;
    DelQ: TOilQuery;
    edFrom: TComboEdit;
    Label1: TLabel;
    Label4: TLabel;
    edNPType: TComboEdit;
    Label6: TLabel;
    edPipe: TComboEdit;
    Label3: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    procedure bbSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure edFromButtonClick(Sender: TObject);
    procedure edNPTypeButtonClick(Sender: TObject);
    procedure edPipeButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    org_id, org_inst, pipe_id, pipe_inst, np_type     :integer;
  end;

var
  PipeRestsRefForm: TPipeRestsRefForm;

implementation

uses PipeRests, ChooseOrg, Main, OilStd, PipeRef, NPTypeRef;

{$R *.DFM}

procedure TPipeRestsRefForm.bbSearchClick(Sender: TObject);
begin
  inherited;
  q.Close;
  q.SQL.Clear;

  q.SQL.add('select                                                                      ');
  q.SQL.add('   orp.*,                                                                   ');
  q.SQL.add('   op.*,                                                                    ');
  q.SQL.add('   ont.name as ntype,                                                       ');
  q.SQL.add('   op.diameter*op.diameter*length_*3.14159265/4000000 as vol,               ');
  q.SQL.add('   (op.diameter*op.diameter*length_*3.14159265/4000000)*ud_veight as mass,  ');
  q.SQL.add('   oo.name as oname                                                         ');
  q.SQL.add('from                                                                        ');
  q.SQL.add('  oil_rests_pipe orp,                                                       ');
  q.SQL.add('  oil_pipe  op,                                                             ');
  q.SQL.add('  oil_np_type ont,                                                          ');
  q.SQL.add('  v_org oo                                                                ');
  q.SQL.add('where                                                                       ');
  q.SQL.add('  orp.state = ''Y'' and                                                     ');
  q.SQL.add('  op.state = ''Y'' and                                                      ');
  q.SQL.add('  ont.state = ''Y'' and                                                     ');
  q.SQL.add('  oo.state = ''Y'' and                                                      ');
  q.SQL.add('  orp.pipe_id = op.id and                                                   ');
  q.SQL.add('  orp.pipe_inst  = op.inst and                                              ');
  q.SQL.add('  orp.np_type = ont.id and                                                  ');
  q.SQL.add('  oo.id = op.org_id and                                                     ');
  q.SQL.add('  oo.inst = op.org_inst                                                     ');
  if edFrom.Text <> '' then
  begin
    q.sql.Add ('  and oo.id = '+intToStr(org_id));
    q.sql.Add ('  and oo.inst = '+intToStr(org_inst));
  end;
  if edPipe.Text <> '' then
  begin
    q.sql.Add ('  and op.id = '+intToStr(pipe_id));
    q.sql.Add ('  and op.inst = '+intToStr(pipe_inst));
  end;
  if edNPType.Text <> '' then
  begin
    q.sql.Add ('  and ont.id = '+intToStr(np_type));
  end;
  if DateEdit1.Date <> 0 then
  begin
    q.sql.Add ('  and date_ >= '''+DateToStr(DateEdit1.Date)+'''');
  end;
  if DateEdit2.Date <> 0 then
  begin
    q.sql.Add ('  and date_ <= '''+DateToStr(DateEdit2.Date)+'''');
  end;
  q.Open;
end;

procedure TPipeRestsRefForm.FormShow(Sender: TObject);
begin
  inherited;
  bbSearchClick(nil);
end;

procedure TPipeRestsRefForm.sbAddClick(Sender: TObject);
var
  PipeRestsForm       :TPipeRestsForm;
begin
  inherited;
  Application.CreateForm(TPipeRestsForm, PipeRestsForm);
  PipeRestsForm.Org_id   := MAIN_ID;
  PipeRestsForm.Org_inst := INST;
  PipeRestsForm.edFrom.Text := CURRENT_NAME;
  PipeRestsForm.ShowModal;
  If PipeRestsForm.ModalResult = mrOk Then
  Begin
    bbSearchClick(Nil);
  End;
  PipeRestsForm.Free;
end;

procedure TPipeRestsRefForm.sbEditClick(Sender: TObject);
var
  PipeRestsForm       :TPipeRestsForm;
  diam, length_       :real;
begin
  if Q.Active and (Q.RecordCount > 0) then
  begin
    inherited;
    Application.CreateForm(TPipeRestsForm, PipeRestsForm);
    PipeRestsForm.Org_id            := qORG_ID.asInteger;
    PipeRestsForm.Org_inst          := qORG_INST.asInteger;
    PipeRestsForm.edFrom.Text       := qONAME.AsString;
    PipeRestsForm.The_id            := qID.asInteger;
    PipeRestsForm.the_inst          := qInst.asInteger;
    PipeRestsForm.edNPType.Text     := qNTYPE.asString;
    PipeRestsForm.np_type           := qNP_TYPE.AsInteger;
    PipeRestsForm.edPipe.Text       := qBounds.asString;
    PipeRestsForm.pipe_id           := qPipe_id.asInteger;
    PipeRestsForm.pipe_inst         := qPipe_inst.asInteger;
    PipeRestsForm.DateEdit1.Date    := qDate_.AsDateTime;
    PipeRestsForm.RxCalcEdit1.Value := qUD_VEIGHT.asFloat;
    PipeRestsForm.RxCalcEdit5.Value := qTEMPERATURE.asFloat;

    PipeRestsForm.BitBtn2.Enabled:=true;
    PipeRestsForm.BitBtn3.Enabled:=true;

    diam          := qDIAMETER.asFloat;
    length_       := qLENGTH_.asFloat;

    PipeRestsForm.RxCalcEdit3.Value := pi * diam * diam * length_ /4000000;
    PipeRestsForm.RxCalcEdit2.Value:= PipeRestsForm.RxCalcEdit3.Value
        * PipeRestsForm.RxCalcEdit1.Value;
    PipeRestsForm.ShowModal;
    If PipeRestsForm.ModalResult = mrOk Then
    Begin
      bbSearchClick(Nil);
    End;
    PipeRestsForm.Free;
  end;
end;

procedure TPipeRestsRefForm.sbDelClick(Sender: TObject);
begin
  inherited;
  if Q.Active and (Q.RecordCount > 0) then
    If MessageDlg(TranslateText('¬ы уверены что хотите удалить запись?'),
      mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    begin
      DelQ.ExecSQL;
      bbSearchClick(nil);
    end;
end;

procedure TPipeRestsRefForm.FormCreate(Sender: TObject);
begin
  inherited;
  bbClearClick(nil);
end;

procedure TPipeRestsRefForm.bbClearClick(Sender: TObject);
begin
  inherited;
  org_id    := 0;
  org_inst  := 0;
  pipe_id   := 0;
  pipe_inst := 0;
  np_type   := 0;
  edFrom.Text:='';
  edNPType.Text:= '';
  edPipe.Text:= '';
  DateEdit1.Clear;
  DateEdit2.Clear;
end;

procedure TPipeRestsRefForm.edFromButtonClick(Sender: TObject);
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

procedure TPipeRestsRefForm.edNPTypeButtonClick(Sender: TObject);
Var
  NPTypeRefForm : TNPTypeRefForm;
begin
  Application.CreateForm(TNPTypeRefForm, NPTypeRefForm);
  NPTypeRefForm.ShowModal;
  If NPTypeRefForm.ModalResult = mrOk Then
  Begin
    edNPType.Text := NPTypeRefForm.qName.AsString;
    NP_Type       := NPTypeRefForm.qId.AsInteger;
  End;
  NPTypeRefForm.Free;
end;


procedure TPipeRestsRefForm.edPipeButtonClick(Sender: TObject);
Var
  PipeRefForm : TPipeRefForm;
begin
  Application.CreateForm(TPipeRefForm, PipeRefForm);
  PipeRefForm.org_id := org_id;
  PipeRefForm.org_inst := org_inst;
  PipeRefForm.edFrom.Text := edFrom.Text;
  PipeRefForm.ShowModal;
  If PipeRefForm.ModalResult = mrOk Then
  Begin
    edPipe.Text   := PipeRefForm.qBounds.AsString;
    Pipe_id       := PipeRefForm.qId.AsInteger;
    Pipe_inst     := PipeRefForm.qInst.AsInteger;
  End;
  PipeRefForm.Free;
end;

procedure TPipeRestsRefForm.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  EdFrom.Text:='';
  org_id:=0;
  org_inst:=0;
end;

procedure TPipeRestsRefForm.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  edNPType.text := '';
  np_type:=0;
end;

procedure TPipeRestsRefForm.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  edPipe.Text:= '';
  pipe_id:= 0;
  pipe_inst:= 0;
end;

procedure TPipeRestsRefForm.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  DateEdit1.Clear;
end;

procedure TPipeRestsRefForm.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  DateEdit2.Clear;
end;

end.
