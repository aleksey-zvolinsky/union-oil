unit PipeRests;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, CurrEdit, ToolEdit, Mask, DBTables, Db,
  uCommonForm,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess;

type
  TPipeRestsForm = class(TCommonForm)
    Panel2: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    edFrom: TComboEdit;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label3: TLabel;
    edNPType: TComboEdit;
    Label4: TLabel;
    Label5: TLabel;
    RxCalcEdit1: TRxCalcEdit;
    RxCalcEdit5: TRxCalcEdit;
    Label2: TLabel;
    edPipe: TComboEdit;
    Label6: TLabel;
    RxCalcEdit2: TRxCalcEdit;
    RxCalcEdit3: TRxCalcEdit;
    Label7: TLabel;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    sp: TOilStoredProc;
    GetSeqQuery: TOilQuery;
    GetSeqQueryNV: TFloatField;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    OldQ: TOilQuery;
    OldQID: TFloatField;
    OldQINST: TFloatField;
    OldQSTATE: TStringField;
    OldQPIPE_ID: TFloatField;
    OldQPIPE_INST: TFloatField;
    OldQNP_TYPE: TFloatField;
    OldQDATE_: TDateTimeField;
    OldQTEMPERATURE: TFloatField;
    OldQUD_VEIGHT: TFloatField;
    OldQNAME: TStringField;
    BitBtn3: TBitBtn;
    TestQ: TOilQuery;
    procedure bbOkClick(Sender: TObject);
    procedure edFromButtonClick(Sender: TObject);
    procedure edNPTypeButtonClick(Sender: TObject);
    procedure edPipeButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RxCalcEdit1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    org_id, org_inst, np_type, pipe_id, pipe_inst, the_id, the_inst :integer;
    diam, length_      :real;
  end;

var
  PipeRestsForm: TPipeRestsForm;

implementation

{$R *.DFM}

uses ChooseOrg, Main, OilStd, NPTypeRef, PipeRef, RezRestsRef;

procedure TPipeRestsForm.bbOkClick(Sender: TObject);
Var
  Res : String;
begin
  if edNPType.Text = '' then
  begin
    ShowMessage(TranslateText('Тип нефтепродукта обязателен.'));
    Exit;
  end;
  if edPipe.Text = '' then
  begin
    ShowMessage(TranslateText('Трубопровод обязателен.'));
    Exit;
  end;
  if DateEdit1.Date = 0 then
  begin
    ShowMessage(TranslateText('Дата учета обязательна.'));
    Exit;
  end;
  if rxCalcEdit1.Value = 0 then
  begin
    ShowMessage(TranslateText('нулевая плотность нефтепродукта не допускается'));
    Exit;
  end;
  TestQ.Close;
  TestQ.ParamByName('np_type').asInteger:=np_type;
  TestQ.ParamByName('date_').asString:=DateEdit1.Text;
  TestQ.ParamByName('temp').asFloat:=RxCalcEdit5.Value;
  TestQ.ParamByName('uv').asFloat:=RxCalcEdit1.Value;
  TestQ.Open;
  if (TestQ.FieldByName('co').asInteger < 1) and
    (MessageDlg(TranslateText('Ни в одном резервуаре нет нефтепродукта с таким названием, плотностьтю и температурой. Продолжать?'),
        mtWarning, [mbYes, mbNo], 0) = mrNo) then
    Exit;
  try
    StartSQL;
    GetSeqQuery.Open;
    if the_id = 0 then
      the_id:=GetSeqQueryNV.asInteger;
    GetSeqQuery.Close;
    with sp do
    begin
      StoredProcName := 'OIL.INSORUPDOIL_RESTS_PIPE';
      Prepare;
      ParamByName('ID#').asInteger := the_id;
      ParamByName('INST#').asInteger := the_INST;
      ParamByName('STATE#').asString := 'Y';
      ParamByName('PIPE_ID#').asInteger := pipe_id;
      ParamByName('PIPE_INST#').asInteger := pipe_inst;
      ParamByName('NP_TYPE#').asInteger := np_type;
      ParamByName('DATE_#').asDate := DateEdit1.Date;
      ParamByName('TEMPERATURE#').asFloat := rxCalcEdit5.Value;
      ParamByName('UD_VEIGHT#').asFloat := rxCalcEdit1.Value;
      ExecProc;
        Res:=ParamByName('Result').AsString;
        If Length(Res)>0 Then
          If Res[1]<>'0' Then
            Raise Exception.Create(SubStr(Res,2));
    end;
    CommitSQL;
    bbOk.ModalResult:=mrok;
    Self.ModalResult:=mrOk;
  except
    On E:Exception Do
    begin
      RollbackSQL;
      MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
    end;
  end;
end;

procedure TPipeRestsForm.edFromButtonClick(Sender: TObject);
var vId,vInst:integer;
    vName:string;
begin
  if ChooseOrg.CaptureOrg(1,Main_id,Inst,'yyy',vId,vInst,vName) then
  begin
    edFrom.Text:=vName;
    org_id:=vId;
    org_inst:=vInst;
    //GetRezList;
  end;
end;

procedure TPipeRestsForm.edNPTypeButtonClick(Sender: TObject);
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

procedure TPipeRestsForm.edPipeButtonClick(Sender: TObject);
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
    diam          := PipeRefForm.qDIAMETER.asFloat;
    length_        := PipeRefForm.qLENGTH_.asFloat;
    RxCalcEdit3.Value := pi * diam * diam * length_ /4000000;
    BitBtn2.Enabled:=true;
    BitBtn3.Enabled:=true;
  End;
  PipeRefForm.Free;
end;

procedure TPipeRestsForm.FormCreate(Sender: TObject);
begin
inherited;
  org_id:=main_id;
  org_inst:=inst;
  edfrom.Text:=current_name;
  np_type:=0;
  pipe_id:=0;
  pipe_inst:=0;
  the_id:=0;
  the_inst:=inst;
  DateEdit1.Date:=now;
end;

procedure TPipeRestsForm.RxCalcEdit1Exit(Sender: TObject);
begin
  if edPipe.Text <> '' then
    RxCalcEdit2.Value:= RxCalcEdit3.Value * RxCalcEdit1.Value;
end;

procedure TPipeRestsForm.BitBtn2Click(Sender: TObject);
begin
  if (pipe_id <> 0) and (pipe_inst <> 0) then
  begin
    OldQ.Close;
    OldQ.ParamByName('pipe_id').asInteger := pipe_id;
    OldQ.ParamByName('pipe_inst').asInteger := pipe_inst;
    OldQ.ParamByName('date_').asString := DateEdit1.Text;
    oldQ.Open;
    if OldQ.RecordCount > 0 then
    begin
      edNPType.Text:=OldqNAME.asString;
      np_type := OldQNP_TYPE.asInteger;
      RxCalcEdit1.Value := oldQUD_Veight.AsFloat;
      RxCalcEdit5.Value := OldQTEMPERATURE.AsFloat;
      if edPipe.Text <> '' then
        RxCalcEdit2.Value:= RxCalcEdit3.Value * RxCalcEdit1.Value;
    end;
    OldQ.Close;
  end;
end;

procedure TPipeRestsForm.BitBtn3Click(Sender: TObject);
var
  RezRestsRefForm :TRezRestsRefForm;
begin
  RezRestsRefForm:=TRezRestsRefForm.Create(Application);
  RezRestsRefForm.DateEdit1.Date:=DateEdit1.Date;
  RezRestsRefForm.DateEdit2.Date:=DateEdit1.Date;
  if RezRestsRefForm.ShowModal = mrOk then
  begin
    edNPType.Text:=RezRestsRefForm.qNAME_1.asString;
    np_type := RezRestsRefForm.QNP_TYPE.asInteger;
    RxCalcEdit1.Value := RezRestsRefForm.QUD_Veight.AsFloat;
    RxCalcEdit5.Value := RezRestsRefForm.QTEMPERATURE.AsFloat;
    if edPipe.Text <> '' then
        RxCalcEdit2.Value:= RxCalcEdit3.Value * RxCalcEdit1.Value;
  end;
  RezRestsRefForm.Free;
end;

end.
