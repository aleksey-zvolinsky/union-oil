unit AddPipe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, ToolEdit, StdCtrls, Buttons, ExtCtrls, CurrEdit, DBTables, Db,
  uCommonForm,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess;

type
  TAddPipeForm = class(TCommonForm)
    Label1: TLabel;
    Panel2: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    edId: TEdit;
    Label2: TLabel;
    edFrom: TComboEdit;
    edBounds: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    rceDiam: TRxCalcEdit;
    rceLength: TRxCalcEdit;
    nvQ: TOilQuery;
    sp: TOilStoredProc;
    nvQNV: TFloatField;
    procedure edFromButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Org_id, org_inst, inst_: integer;
  end;

var
  AddPipeForm: TAddPipeForm;

implementation

{$R *.DFM}

uses main, chooseorg,OilStd;

procedure TAddPipeForm.edFromButtonClick(Sender: TObject);
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

procedure TAddPipeForm.FormCreate(Sender: TObject);
begin
inherited;
  EdId.Text:= '0';
  edFrom.Text:='';
  org_id:=main_id;
  org_inst:=inst;
  edFrom.Text:=current_name;
  EdBounds.Text:=TranslateText('От вентиля №  до вентиля №');
  rceDiam.Value:=0;
  rceLength.Value:=0;
  inst_:=inst;
end;

procedure TAddPipeForm.bbOkClick(Sender: TObject);
var
  res :string;
begin
  if edFrom.Text = '' then
  begin
    ShowMessage(TranslateText('Трубопровод должен иметь владельца'));
    Exit;
  end;
  if EdBounds.Text = TranslateText('От вентиля №  до вентиля №') then
  begin
    ShowMessage(TranslateText('Это поле предназначено для описания границ трубопровода'));
    Exit;
  end;
  if rceDiam.Value <= 0 then
  begin
    ShowMessage(TranslateText('Диаметр трубопровода всегда положителен!'));
    Exit;
  end;
  if rceLength.Value <= 0 then
  begin
    ShowMessage(TranslateText('Длина трубопровода всегда положительна!'));
    Exit;
  end;
  if edId.Text = '0' then
  begin
    nvQ.Open;
    edId.Text:=nvQnv.asString;
    nvQ.Close;
  end;
  try
    with sp do
    begin
      StartSQL;
      StoredProcName := 'OIL.INSORUPDOIL_PIPE';
      Prepare;
      ParamByName('ID#').AsString           := edId.Text;
      ParamByName('STATE#').AsString        := 'Y';
      ParamByName('INST#').AsInteger        := inst_;
      ParamByName('ORG_ID#').asInteger      := org_id;
      ParamByName('ORG_INST#').asInteger    := org_inst;
      ParamByName('BOUNDS#').asString       := edBounds.Text;
      ParamByName('DIAMETER#').asFloat      := rceDiam.Value;
      ParamByName('LENGTH_#').asFloat       := rceLength.Value;
      ExecProc;
      Res:=ParamByName('Result').AsString;
      If Length(Res)>0 Then
        If Res[1]<>'0' Then
          Raise Exception.Create(SubStr(Res,2));
      CommitSQL;
      bbOk.ModalResult:=mrok;
      Self.ModalResult:=mrOk;
      //Self.Close;
    end;
  Except On E:Exception Do
    Begin
      RollbackSQL;
      MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
    End;
  End;
end;

end.
