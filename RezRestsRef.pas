unit RezRestsRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls,
  ToolEdit, Mask,uOilQuery,Ora, uOilStoredProc, ActnList, MemDS, DBAccess,
  RXCtrls, DBGridEh;

type
  TRezRestsRefForm = class(TBaseForm)
    qID: TFloatField;
    qINST: TFloatField;
    qSTATE: TStringField;
    qREZ_ID: TFloatField;
    qREZ_INST: TFloatField;
    qNP_TYPE: TFloatField;
    qDATE_: TDateTimeField;
    qTEMPERATURE: TFloatField;
    qUD_VEIGHT: TFloatField;
    qALL_HEIGHT: TFloatField;
    qWATER_HEIGHT: TFloatField;
    qID_1: TFloatField;
    qID_ORG: TFloatField;
    qSTATE_1: TStringField;
    qINST_1: TFloatField;
    qNAME: TStringField;
    qCAPACITY: TStringField;
    qDEAD: TFloatField;
    qNUM: TStringField;
    qINST_ORG: TFloatField;
    qDATE_MOD: TDateTimeField;
    qUB_KAT: TFloatField;
    qDNO_CORR: TFloatField;
    qLAST_CAL_DATE: TDateTimeField;
    qNAME_1: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    EdRez: TComboBox;
    edFrom: TComboEdit;
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
    edNPType: TComboEdit;
    qALL_VOL: TFloatField;
    qWAT_VOL: TFloatField;
    qPROD_VOL: TFloatField;
    qMASS_: TFloatField;
    sbClearID: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DelQ: TOilQuery;
    procedure FormShow(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure edFromButtonClick(Sender: TObject);
    procedure edNPTypeChange(Sender: TObject);
    procedure rezQFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure EdRezChange(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure sbClearIDClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    org_id, org_inst, rez_id, rez_inst, np_type :integer;
    procedure GetRezList;
  end;

var
  RezRestsRefForm: TRezRestsRefForm;

implementation

{$R *.DFM}

uses
  RezRests, main, ChooseOrg, NPTypeRef, OilStd;

procedure TRezRestsRefForm.FormShow(Sender: TObject);
begin
  inherited;
  org_id:= main_id;
  org_inst:= inst;
  edFrom.Text:= current_name;
  GetRezList;
  bbSearchClick(nil);
end;

procedure TRezRestsRefForm.bbSearchClick(Sender: TObject);
begin
  inherited;
  q.close;
  q.SQL.Clear;
  q.SQL.Add('  select       ');
  q.SQL.Add('   orp.*,      ');
  q.SQL.Add('   orr.*,      ');
  q.SQL.Add('   ont.name,   ');
  q.SQL.Add('   rez_vzliv(rez_id,rez_inst, all_height) as all_vol,                                                        ');
  q.SQL.Add('   rez_vzliv(rez_id,rez_inst, water_height) as wat_vol,                                                      ');
  q.SQL.Add('   rez_vzliv(rez_id,rez_inst, all_height) - rez_vzliv(rez_id,rez_inst, water_height) as prod_vol,            ');
  q.SQL.Add('   (rez_vzliv(rez_id,rez_inst, all_height) - rez_vzliv(rez_id,rez_inst, water_height)) * ud_veight as mass_  ');
  q.SQL.Add('from                      ');
  q.SQL.Add('   oil_rests_phys orp,    ');
  q.SQL.Add('   oil_rezervuar orr,     ');
  q.SQL.Add('   oil_np_type ont        ');
  q.SQL.Add('where                     ');
  q.SQL.Add('   orp.state = ''Y'' and  ');
  q.SQL.Add('    orr.state = ''Y'' and ');
  q.SQL.Add('    ont.state = ''Y'' and ');
  q.SQL.Add('    orp.rez_id = orr.id and        ');
  q.SQL.Add('    orp.rez_inst = orr.inst and    ');
  q.SQL.Add('    ont.id = orp.np_type           ');
  if (edFrom.Text <> '') and (edRez.Text <> '') then
  begin
    q.SQL.Add('   and rez_id = '+IntToStr(rez_id));
    q.SQL.Add('   and rez_inst = '+IntToStr(rez_inst));
  end;
  if edNPType.Text <> '' then
  begin
    q.SQL.Add('   and np_type = '+IntToStr(np_type));
  end;
  if DateEdit1.Date <> 0 then
  begin
    q.SQL.Add('   and date_ >= '''+DateToStr(DateEdit1.Date)+'''');
  end;
  if DateEdit2.Date <> 0 then
  begin
    q.SQL.Add('   and date_ <= '''+DateToStr(DateEdit2.Date)+'''');
  end;
  q.SQL.Add('order by               ');
  q.SQL.Add('    date_,np_type,orr.name ');
  q.Open;
end;

procedure TRezRestsRefForm.sbAddClick(Sender: TObject);
var
  RezRestsForm       :TRezRestsForm;
begin
  inherited;
  Application.CreateForm(TRezRestsForm, RezRestsForm);
  RezRestsForm.Org_id   := MAIN_ID;
  RezRestsForm.Org_inst := INST;
  RezRestsForm.edFrom.Text := CURRENT_NAME;
  RezRestsForm.GetRezList;
  RezRestsForm.ShowModal;
  If RezRestsForm.ModalResult = mrOk Then
  Begin
    bbSearchClick(Nil);
  End;
  RezRestsForm.Free;
end;

procedure TRezRestsRefForm.edFromButtonClick(Sender: TObject);
  var vId,vInst:integer;
    vName:string;
begin
  inherited;
  if ChooseOrg.CaptureOrg(1,Main_id,Inst,'yyy',vId,vInst,vName) then
  begin
    edFrom.Text:=vName;
    org_id:=vId;
    org_inst:=vInst;
    GetRezList;
  end;
end;

procedure TRezRestsRefForm.edNPTypeChange(Sender: TObject);
Var
  NPTypeRefForm : TNPTypeRefForm;
begin
  inherited;
  Application.CreateForm(TNPTypeRefForm, NPTypeRefForm);
  NPTypeRefForm.ShowModal;
  If NPTypeRefForm.ModalResult = mrOk Then
  Begin
    edNPType.Text := NPTypeRefForm.qName.AsString;
    NP_Type       := NPTypeRefForm.qId.AsInteger;
  End;
  NPTypeRefForm.Free;
end;

procedure TRezRestsRefForm.GetRezList;
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

procedure TRezRestsRefForm.rezQFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := (rezQNUM.AsString = edRez.Text);
end;


procedure TRezRestsRefForm.EdRezChange(Sender: TObject);
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



procedure TRezRestsRefForm.bbClearClick(Sender: TObject);
begin
  inherited;
  org_id:= main_id;
  org_inst:=inst;
  rez_id:= 0;
  rez_inst:= 0;
  np_type:= 0;
  edFrom.Text:=current_name;
  GetRezList;
  EdRez.Text:='';
  edNPType.Text:='';
  DateEdit1.clear;
  DateEdit2.Clear;
end;

procedure TRezRestsRefForm.sbClearIDClick(Sender: TObject);
begin
  inherited;
  GetRezList;
end;

procedure TRezRestsRefForm.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  DateEdit1.Clear;
end;

procedure TRezRestsRefForm.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  DateEdit2.clear;
end;

procedure TRezRestsRefForm.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  np_type:=0;
  edNPType.Text:='';
end;

procedure TRezRestsRefForm.sbEditClick(Sender: TObject);
var
  RezRestsForm       :TRezRestsForm;
begin
  if not Q.Active then
    Exit;
  if Q.RecordCount = 0 then
    Exit;
  inherited;
  Application.CreateForm(TRezRestsForm, RezRestsForm);
  RezRestsform.The_id   := QId.asInteger;
  RezRestsForm.The_inst := qInst.asInteger;
  RezRestsForm.Org_id   := qId_ORG.asInteger;
  RezRestsForm.Org_inst := qInst_org.asInteger;
  RezRestsForm.edFrom.Text := CURRENT_NAME;
  RezRestsForm.GetRezList;
  //RezRestsForm.EdRez.Style:=csDropDown;
  rezRestsForm.EdRez.ItemIndex:=0;
  while not (RezRestsForm.edRez.Text = qNUM.AsString) do
    rezRestsForm.EdRez.ItemIndex:=rezRestsForm.EdRez.ItemIndex+1;
  //RezRestsForm.EdRez.Style:=csDropDownList;
  RezRestsForm.Rez_id:=qREZ_ID.asInteger;
  RezRestsForm.Rez_inst:=qREZ_INST.asInteger;
  RezREstsForm.DateEdit1.Date:=qDate_.AsDateTime;
  RezRestsForm.edNPType.Text:= qNAME_1.asString;
  RezRestsForm.NP_Type:= qNP_TYPE.AsInteger;
  RezRestsForm.RxCalcEdit1.Value := qUD_VEIGHT.AsFloat;
  RezRestsForm.RxCalcEdit2.Value := qALL_HEIGHT.AsFloat;
  RezRestsForm.RxCalcEdit5.Value := qTEMPERATURE.AsFloat;
  RezRestsForm.RxCalcEdit6.Value := qWATER_HEIGHT.asFloat;
  RezRestsForm.RxCalcEdit2Exit(nil);
  RezRestsForm.RxCalcEdit6Exit(nil);
  RezRestsForm.ShowModal;
  If RezRestsForm.ModalResult = mrOk Then
  Begin
    bbSearchClick(Nil);
  End;
  RezRestsForm.Free;
end;

procedure TRezRestsRefForm.sbDelClick(Sender: TObject);
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

end.
