unit RezRests;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, CurrEdit, ToolEdit, Mask,
  uCommonForm,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess;

type
  TRezRestsForm = class(TCommonForm)
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    P: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edFrom: TComboEdit;
    DateEdit1: TDateEdit;
    edNPType: TComboEdit;
    RxCalcEdit1: TRxCalcEdit;
    RxCalcEdit2: TRxCalcEdit;
    RxCalcEdit3: TRxCalcEdit;
    RxCalcEdit4: TRxCalcEdit;
    RxCalcEdit5: TRxCalcEdit;
    RxCalcEdit6: TRxCalcEdit;
    RxCalcEdit7: TRxCalcEdit;
    EdRez: TComboBox;
    rezQ: TOilQuery;
    rezQID: TFloatField;
    rezQID_ORG: TFloatField;
    rezQSTATE: TStringField;
    rezQINST: TFloatField;
    rezQNAME: TStringField;
    rezQCAPACITY: TStringField;
    rezQDEAD: TFloatField;
    rezQNUM: TStringField;
    rezQINST_ORG: TFloatField;
    rezQDATE_MOD: TDateTimeField;
    rezQUB_KAT: TFloatField;
    rezQDNO_CORR: TFloatField;
    rezQLAST_CAL_DATE: TDateTimeField;
    sp: TOilStoredProc;
    GetSeqQuery: TOilQuery;
    GetSeqQueryNV: TFloatField;
    vzlivQ: TOilQuery;
    vzlivQVZLIV: TFloatField;
    BitBtn1: TBitBtn;
    procedure bbOkClick(Sender: TObject);
    procedure edFromButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edNPTypeButtonClick(Sender: TObject);
    procedure rezQFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure EdRezChange(Sender: TObject);
    procedure RxCalcEdit2Exit(Sender: TObject);
    procedure RxCalcEdit6Exit(Sender: TObject);
    procedure RxCalcEdit3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Org_id, Org_inst, Rez_id, Rez_inst, NP_Type :integer;
    vol_all                                     :real;
    the_id, the_inst                            :integer;
    procedure GetRezList;
  end;

var
  RezRestsForm: TRezRestsForm;

implementation

uses ChooseOrg, Main, NpTypeRef, OilStd;

{$R *.DFM}


procedure TRezRestsForm.edFromButtonClick(Sender: TObject);
var vId,vInst:integer;
    vName:string;
begin
  if ChooseOrg.CaptureOrg(1,Main_id,Inst,'yyy',vId,vInst,vName) then
  begin
    edFrom.Text:=vName;
    org_id:=vId;
    org_inst:=vInst;
    GetRezList;
  end;
end;

procedure TRezRestsForm.GetRezList;
begin
  rezQ.Close;
  rezQ.ParamByName('org_id').asInteger:=org_id;
  rezQ.ParamByName('org_inst').asInteger:=org_inst;
  rezQ.Open;
  edRez.Items.Clear;
  while not REzQ.Eof do
  begin
    EdRez.Items.Add(RezQNUM.asString);
    RezQ.Next;
  end;
  //RezQ.Close;
end;

procedure TRezRestsForm.FormCreate(Sender: TObject);
begin
  inherited;
  Org_id   := 0;
  Org_inst := 0;
  Rez_id   := 0;
  Rez_inst := 0;
  NP_Type  := 0;
  DateEdit1.Date:=Now;
  vol_all  := 0;
  the_id   := 0;
  the_inst := inst;
end;

procedure TRezRestsForm.edNPTypeButtonClick(Sender: TObject);
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

procedure TRezRestsForm.bbOkClick(Sender: TObject);
Var
  Res : String;
  
begin
  if Org_id = 0 then
  begin
    ShowMessage(TranslateText('Организация обязательна'));
    Exit;
  end;
  if RxCalcEdit1.Value = 0 then
  begin
    ShowMessage(TranslateText('Удельный вес продукта обязателен'));
    Exit;
  end;
  if EdRez.Text = '' then
  begin
    ShowMessage(TranslateText('Резервуар обязателен'));
    Exit;
  end;
  if DateEdit1.Date = 0 then
  begin
    ShowMessage(TranslateText('Дата инвентаризации обязательна'));
    Exit;
  end;
  if NP_Type = 0 then
  begin
    ShowMessage(TranslateText('Тип нефтепродукта обязателен'));
    Exit;
  end;
  if RxCalcEdit2.Value = 0 then
  begin
    ShowMessage(TranslateText('Общая высота взлива обязательна'));
    Exit;
  end;
  
  try
    StartSQL;
    GetSeqQuery.Open;
    if the_id = 0 then
      the_id:=GetSeqQueryNV.asInteger;
    GetSeqQuery.Close;
    with sp do
    begin
      StoredProcName := 'OIL.INSORUPDOIL_RESTS_PHYS';
      Prepare;
      ParamByName('ID#').asInteger := the_id;
      ParamByName('INST#').asInteger := the_INST;
      ParamByName('STATE#').asString := 'Y';
      ParamByName('REZ_ID#').asInteger := rez_id;
      ParamByName('REZ_INST#').asInteger := rez_inst;
      ParamByName('NP_TYPE#').asInteger := np_type;
      ParamByName('DATE_#').asDate := DateEdit1.Date;
      ParamByName('TEMPERATURE#').asFloat := rxCalcEdit5.Value;
      ParamByName('UD_VEIGHT#').asFloat := rxCalcEdit1.Value;
      ParamByName('ALL_HEIGHT#').asFloat := rxCalcEdit2.Value;
      ParamByName('WATER_HEIGHT#').asFloat := rxCalcEdit6.Value;

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

procedure TRezRestsForm.rezQFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := (rezQNUM.AsString = edRez.Text);
end;


procedure TRezRestsForm.EdRezChange(Sender: TObject);
begin
  If edRez.Text = '' Then
  Begin
    rez_id    := 0;
    rez_inst  := 0;
  End
  Else
  Begin
    RezQ.FindFirst;
    rez_id    := RezQID.AsInteger;
    rez_inst  := RezQINST.AsInteger;
  End;
end;

procedure TRezRestsForm.RxCalcEdit2Exit(Sender: TObject);
begin
  if (Rez_id <> 0) and (rez_inst <> 0) then
  begin
    vzlivQ.Close;
    //vzlivQ.Prepare;
    vzlivQ.ParamByName('rez_id').asInteger:= rez_id;
    vzlivQ.ParamByName('rez_inst').asInteger:= rez_inst;
    vzlivQ.ParamByName('hgt').asFloat:= rxCalcEdit2.Value;
    vzlivQ.Open;
    vol_all:=vzlivQVZLIV.AsFloat;
    vzlivQ.Close;
    RxCalcEdit3.Value:=vol_all - RxCalcEdit7.Value;
  end;
end;

procedure TRezRestsForm.RxCalcEdit6Exit(Sender: TObject);
begin
  if (Rez_id <> 0) and (rez_inst <> 0) then
  begin
    vzlivQ.Close;
    //vzlivQ.Prepare;
    vzlivQ.ParamByName('rez_id').asInteger:= rez_id;
    vzlivQ.ParamByName('rez_inst').asInteger:= rez_inst;
    vzlivQ.ParamByName('hgt').asFloat:= rxCalcEdit6.Value;
    vzlivQ.Open;
    RxCalcEdit7.Value:=vzlivQVZLIV.AsFloat;
    vzlivQ.Close;
    RxCalcEdit3.Value:=vol_all - RxCalcEdit7.Value;
  end;
end;

procedure TRezRestsForm.RxCalcEdit3Change(Sender: TObject);
begin
  RxCalcEdit4.Value:= RxCalcEdit3.Value * RxCalcEdit1.Value;
end;

end.
