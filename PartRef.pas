unit PartRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,
  ToolEdit, Mask, CurrEdit, DBCtrls, Placemnt, Menus, RXCtrls, StrUtils,
  ActnList,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess, DBGridEh,
  DBGridEhGrouping, GridsEh;

type
  TPartRefForm = class(TBaseForm)
    edDog: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edDocDateB: TDateEdit;
    edOrgFrom: TComboEdit;
    sbClearOrgFrom: TSpeedButton;
    lOrgFrom: TLabel;
    sbClearDocDateB: TSpeedButton;
    sbClearNpType: TSpeedButton;
    Label5: TLabel;
    edNP_Type: TComboEdit;
    SP: TOilStoredProc;
    Label12: TLabel;
    edDim: TComboEdit;
    sbClearDim: TSpeedButton;
    edDocDateE: TDateEdit;
    sbClearDocDateE: TSpeedButton;
    Label15: TLabel;
    Label16: TLabel;
    Bevel1: TBevel;
    GroupBox2: TGroupBox;
    chOwn: TCheckBox;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    Label1: TLabel;
    sbClearID: TSpeedButton;
    sbClearDog: TSpeedButton;
    rbStore: TRadioButton;
    rbKom: TRadioButton;
    rbOwn: TRadioButton;
    pUnErase: TPanel;
    bbUnErase: TBitBtn;
    sbUnErase: TSpeedButton;
    GroupBox3: TGroupBox;
    rbPlan_Id_N: TRadioButton;
    rbPlan_Id_Y: TRadioButton;
    chPlan_Id: TCheckBox;
    GroupBox4: TGroupBox;
    chCount: TCheckBox;
    CanDeleteQuery: TOilQuery;
    qID: TFloatField;
    qDOG: TStringField;
    qDOG_DATE: TDateTimeField;
    qCOMM: TStringField;
    qSERT: TStringField;
    qNP_TYPE: TFloatField;
    qBASE_: TFloatField;
    qDIM_ID: TFloatField;
    qSS: TFloatField;
    qPRICE: TFloatField;
    qPRICE_KP: TFloatField;
    qDIM_NAME: TStringField;
    qNP_TYPE_NAME: TStringField;
    qDOR_SBOR: TFloatField;
    qFROM_: TFloatField;
    qFROM_INST: TFloatField;
    qFROM_NAME: TStringField;
    qOWN_GOODS: TStringField;
    qINST: TFloatField;
    qNP_GRP: TFloatField;
    qNP_GRP_NAME: TStringField;
    qTO_: TFloatField;
    qTO_INST: TFloatField;
    qTO_NAME: TStringField;
    qPLAN_ID: TStringField;
    qREST: TFloatField;
    qIS_BARTER: TFloatField;
    Label4: TLabel;
    Label6: TLabel;
    edCountEnd: TEdit;
    edCountBeg: TEdit;
    sbClearCountBeg: TSpeedButton;
    sbClearCountEnd: TSpeedButton;
    GroupBox5: TGroupBox;
    cbBarter: TCheckBox;
    rbBarter: TRadioButton;
    rbNBarter: TRadioButton;
    edId: TRxCalcEdit;
    qGOAL_PART_TYPE: TFloatField;
    qGOAL_PART_TYPE_NAME: TStringField;
    sbClearOrgTo: TSpeedButton;
    lOrgTo: TLabel;
    edOrgTo: TComboEdit;
    qFILSEND: TStringField;
    qBASE_LITR: TFloatField;
    qUD_WEIGHT: TFloatField;
    qISSHTUKI: TStringField;
    qISFASOV: TStringField;
    chFas: TCheckBox;
    Label7: TLabel;
    qSOPUTST: TStringField;
    cbNoPrih: TCheckBox;
    qPrihodExists: TStringField;
    cbOils: TCheckBox;
    procedure sbClearOrgFromClick(Sender: TObject);
    procedure sbClearDocDateBClick(Sender: TObject);
    procedure sbClearNpTypeClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edNP_TypeButtonClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbClearDimClick(Sender: TObject);
    procedure edDimButtonClick(Sender: TObject);
    procedure sbClearDocDateEClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure edOrgFromButtonClick(Sender: TObject);
    procedure chOwnClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject); Override;
    procedure sbClearIDClick(Sender: TObject);
    procedure sbClearDogClick(Sender: TObject);
    procedure sbUnEraseClick(Sender: TObject);
    procedure bbUnEraseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chPlan_IdClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure sbClearCountBegClick(Sender: TObject);
    procedure sbClearCountEndClick(Sender: TObject);
    procedure chCountClick(Sender: TObject);
    procedure edCountBegChange(Sender: TObject);
    procedure cbBarterClick(Sender: TObject);
    procedure edOrgToButtonClick(Sender: TObject);
    procedure sbClearOrgToClick(Sender: TObject);
    procedure cbNoPrihClick(Sender: TObject);
    procedure bbCancelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chFasClick(Sender: TObject);
    procedure cbOilsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PartRefForm: TPartRefForm;

implementation

Uses OilStd, Main, NPTypeRef, Part, Progr, ChooseOrg, uDBFunc, ExFunc, uXMLForm;

{$R *.DFM}

procedure TPartRefForm.sbClearOrgFromClick(Sender: TObject);
begin
  edOrgFrom.Clear;
  edOrgFrom.Tag:=0;
  lOrgFrom.tag:=0;
end;

procedure TPartRefForm.sbClearDocDateBClick(Sender: TObject);
begin
  edDocDateB.Clear;
end;

procedure TPartRefForm.sbClearNpTypeClick(Sender: TObject);
begin
  edNP_Type.Text := '';
end;

procedure TPartRefForm.bbClearClick(Sender: TObject);
begin
//  If edDog.Tag = 0 Then
//  Begin
  edDog.Clear;
  edId.Clear;
  sbClearDocDateBClick(Nil);
  sbClearDocDateEClick(Nil);
  sbClearOrgFromClick(Nil);
  sbClearOrgToClick(Nil);
  sbClearNPTypeClick(Nil);
  chOwn.Checked := False;
  sbClearDimClick(Nil);
  chFas.Checked := False;
  chPlan_Id.Checked := False;
  chCount.Checked := False;
  sbClearCountBegClick(Nil);
  sbClearCountEndClick(Nil);
//  End;
end;

procedure TPartRefForm.FormShow(Sender: TObject);
begin
  Inherited;
  //bbClearClick(Nil);
  edDog.Clear;
  edId.Clear;
  sbClearDocDateBClick(Nil);
  sbClearDocDateEClick(Nil);
  if edOrgFrom.Tag=0 then sbClearOrgFromClick(Nil);
{  if edOrgTo.Tag=0
     then Begin
         edOrgTo.Text:=MAIN_ORG.Name;
         edOrgTo.Tag:=MAIN_ORG.Id;
         lOrgTo.tag:=MAIN_ORG.Inst;
     End;
}  if edNP_type.Tag = 0 then
    sbClearNPTypeClick(Nil);
  if chOwn.Tag=0 then chOwn.Checked := False;
  sbClearDimClick(Nil);
  chFas.Checked := False;
  chCount.Checked := False;
  sbClearCountBegClick(Nil);
  sbClearCountEndClick(Nil);
  if Self.Tag<>10 then
  Begin
    chPlan_Id.Checked := False;
    chCount.Checked := True;
    edCountBeg.Text := '0.000001';
  End;
  bbSearchClick(Nil);
end;

procedure TPartRefForm.sbAddClick(Sender: TObject);
Var
  PartForm : TPartForm;
begin
  Application.CreateForm(TPartForm, PartForm);
  PartForm.edId.Text := '';
  PartForm.edId.Tag := 0;
  Part.PartIsShtuk := false;
  if GENERATION = 1 then
  begin
    PartForm.edOrg.Tag := 4587;
    PartForm.lOrg.Tag := 4587;
    PartForm.edOrg.Text := GetOrgName(4587,4587);
  end;
  PartForm.ShowModal;
  If PartForm.ModalResult = mrOk Then
  Begin
    bbClearClick(Nil);
    edID.Text := PartForm.edID.Text;
    bbSearchClick(Nil);
  End;
  PartForm.Free;
end;

procedure TPartRefForm.sbClearDimClick(Sender: TObject);
begin
  edDim.Clear;
end;

procedure TPartRefForm.edDimButtonClick(Sender: TObject);
begin
  XMLChoose('dimref',Sender as TComboEdit);
end;

procedure TPartRefForm.edNP_TypeButtonClick(Sender: TObject);
Var
  NPTypeRefForm : TNPTypeRefForm;
begin
  Application.CreateForm(TNPTypeRefForm, NPTypeRefForm);
  NPTypeRefForm.ShowModal;
  If NPTypeRefForm.ModalResult = mrOk Then
  Begin
    edNP_Type.Text := NPTypeRefForm.qName.AsString;
    edNP_Type.Tag  := NPTypeRefForm.qId.AsInteger;
  End;
  NPTypeRefForm.Free;
end;

procedure TPartRefForm.sbClearDocDateEClick(Sender: TObject);
begin
  edDocDateE.Clear;
end;

procedure TPartRefForm.bbSearchClick(Sender: TObject);
Var
  S :String;
  Code : Integer;
  R : Extended;
begin
  Try
    With q Do
    Begin
      Close;
      SQL.Clear;
      If SbUnErase.Down Then S := 'V_OIL_PART_DEL'
                        Else S := 'V_OIL_PART';
      SQL.Add('Select * from ' + S + ' WHERE 1=1');
      If edID.Value <> 0 Then SQL.Add('AND ID='+FloatToStr(edID.Value));
      If edDog.Text <> '' Then SQL.Add('AND Upper(dog) like ''%'+ANSIUpperCase(edDog.Text)+'%''');
      If edOrgFrom.Text <> '' Then SQL.Add('AND From_='+IntToStr(edOrgFrom.Tag)+' And From_inst='+IntToStr(lOrgFrom.Tag));
      If edOrgTo.Text <> '' Then SQL.Add('AND To_='+IntToStr(edOrgTo.Tag)+' And To_inst='+IntToStr(lOrgTo.Tag));
      If edDocDateB.Text[1]<>' ' Then SQL.Add('And Dog_Date >= To_Date('''+edDocDateB.Text+''',''DD.MM.YYYY'')');
      If edDocDateE.Text[1]<>' ' Then SQL.Add('And Dog_Date <= To_Date('''+edDocDateE.Text+''',''DD.MM.YYYY'')');
      If edNP_Type.Text <> '' Then SQL.Add('AND NP_Type='+IntToStr(edNP_Type.Tag));
      If edDim.Text <> '' Then SQL.Add('AND Dim_Id='+IntToStr(edDim.Tag));
      If chOwn.Checked Then
      Begin
        If rbOwn.Checked Then SQL.Add('AND OWN_GOODS=''O''')
        Else
        If rbKom.Checked Then SQL.Add('AND OWN_GOODS=''K''')
                         Else SQL.Add('AND OWN_GOODS=''S''');
      End;

      if cbNoPrih.Checked then
        Sql.Add('and PrihodExists=''N''');

      If chPlan_Id.Checked Then
      Begin
        If rbPlan_Id_N.Checked Then SQL.Add('AND PLAN_ID is Null')
                               Else SQL.Add('AND NOT PLAN_ID is NULL');
      End;
      if cbBarter.Checked then
        if rbBarter.Checked then
          SQL.Add('AND IS_BARTER = 1')
        else
          SQL.Add('AND IS_BARTER = 0');
      if chFas.Checked xor cbOils.Checked then
      begin
        If chFas.Checked Then SQL.Add('AND (IsShtuki=''Y'' OR IsFasov=''Y'')');
        If cbOils.Checked then SQL.Add('AND (IsShtuki=''N'' AND IsFasov=''N'')');
      end;
      If chCount.Checked Then
      Begin
        If edCountBeg.Text <> '' Then
        Begin
          Val(edCountBeg.Text, R, Code);
          If Code = 0 Then SQL.Add('AND Rest >= '+edCountBeg.Text)
          Else
          Begin
            ShowMessage(TranslateText('В поле "Цена- От" ошибка в позиции ')+IntToStr(Code));
            Exit;
          End;
        End;
        If edCountEnd.Text <> '' Then
        Begin
          Val(edCountEnd.Text, R, Code);
          If Code = 0 Then SQL.Add('AND Rest < = '+edCountEnd.Text)
          Else
          Begin
            ShowMessage(TranslateText('В поле "Цена- До" ошибка в позиции ')+IntToStr(Code));
            Exit;
            ShowMessage(FloatToStr(R));
          End;
        End;
      End;
      SQL.Add('Order By Dog_Date desc,Dog');
      Open;
    End;
  Except On E:Exception Do
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
  End;
end;

procedure TPartRefForm.edOrgFromButtonClick(Sender: TObject);
var vId,vInst:integer;
    vName:string;
begin
    if ChooseOrg.CaptureOrg(1,0,0,'yyy',vId,vInst,vName) then
    begin
         edOrgFrom.Text:=vName;
         edOrgFrom.Tag:=vId;
         lOrgFrom.tag:=vInst;
    end;
end;

procedure TPartRefForm.chOwnClick(Sender: TObject);
begin
  rbOwn.Enabled   := chOwn.Checked;
  rbKom.Enabled   := chOwn.Checked;
  rbStore.Enabled := chOwn.Checked;
end;

procedure TPartRefForm.sbDelClick(Sender: TObject);
begin
  If q.Active Then
  If q.RecordCount > 0 Then
  begin
    CanDeleteQuery.Close;
    CanDeleteQuery.Open;
    if CanDeleteQuery.FieldByName('co').Value > 0
    then
      MessageDlg(TranslateText('Эту партию невозможно удалить т. к. с ней производились операции. Удалите сначала их.'),
        mtError, [mbOK], 0)
    else
    begin
      if (qInst.AsInteger = ALFANAFTAP) or
         ((MAIN_ORG.Org_type=3) and (MAIN_ORG.Par_inst=qInst.AsInteger)) then
      begin
        MessageDlg(TranslateText('Партию, присланую из управления или "Альфа-Нафты" удалять запрещено.'),
        mtError, [mbOK], 0);
        Exit;
      end;
      If MessageDlg(TranslateText('Вы уверены что хотите удалить запись?'),
        mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Try

        SetState('OIL_PART',qId.AsInteger,qInst.AsInteger,'N');
        q.Close;
        q.Open;
    Except On E:Exception Do
    begin
      RollbackSQL;
      MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
    end;
    End;
    end;
  end;
end;

procedure TPartRefForm.sbEditClick(Sender: TObject);
Var
  PartForm : TPartForm;
begin
  If q.Active Then
  If q.RecordCount > 0 Then
  Begin
    Application.CreateForm(TPartForm, PartForm);
    PartForm.edId.Text        := IntToStr(qId.AsInteger);
    PartForm.edId.Tag         := qId.AsInteger;
    PartForm.SP.Tag           := qINST.AsInteger;
    PartForm.edDog.Text       := qDog.AsString;
    PartForm.edDocDate.Date   := qDog_Date.AsDateTime;
    PartForm.edComm.Text      := qComm.AsString;
    PartForm.edSert.Text      := qSert.AsString;
    PartForm.edNPType.Tag     := qNP_Type.AsInteger;
    PartForm.edNPType.Text    := qNP_Type_Name.AsString;
    PartForm.edBase.Value     := qBase_.AsFloat*1000;
    PartForm.edBase_Litr.Value:= qBase_Litr.AsFloat;
    PartForm.edUd_Weight.Value := qUd_Weight.AsFloat*1000;
    PartForm.edDim.Tag        := qDim_Id.AsInteger;
    PartForm.edDim.Text       := qDim_Name.AsString;
    PartForm.chFas.Enabled    := not((qIsFasov.AsString = 'Y') or (qIsShtuki.AsString = 'N') and (qIsFasov.AsString = 'N'));
    Part.PartIsShtuk          := qIsShtuki.AsString='Y';
    PartForm.chFas.Checked    := (qIsFasov.AsString = 'Y');
    PartForm.edSs.Value       := qSs.AsFloat;
    PartForm.edPrice.Value    := qPrice.AsFloat;
    PartForm.edPriceKP.Value  := qPrice_KP.AsFloat;
    PartForm.edDorSbor.Value  := qDor_Sbor.AsFloat;
    PartForm.edOrg.Tag        := qFrom_.AsInteger;
    PartForm.edOrg.Text       := qFrom_Name.AsString;
    PartForm.lOrg.Tag         := qFrom_Inst.AsInteger;
    PartForm.edTo.Tag         := qTo_.AsInteger;
    PartForm.edTo.Text        := qTo_Name.AsString;
    PartForm.lTo.Tag          := qTo_Inst.AsInteger;
    PartForm.edPlan_ID.Text   := qPlan_Id.AsString;
    PartForm.cbBarter.Checked := (qIs_Barter.asInteger > 0);
    If qOWN_GOODS.AsString = 'O' Then PartForm.rbOwn.Checked := True
    Else
    If qOWN_GOODS.AsString = 'K' Then PartForm.rbKom.Checked := True
                                 Else PartForm.rbStore.Checked := True;
    PartForm.cbGoalPart.Checked := not qGoal_Part_Type.IsNull;
    PartForm.cbFilSend.Checked := qFILSEND.AsString = 'Y';
    PartForm.chbSoputst.Checked := qSOPUTST.AsString = 'Y';
    PartForm.cbFilSend.Enabled := MAIN_ORG.org_type =4;
    if qGoal_Part_Type.IsNull then
       Begin
          PartForm.edGoalPartType.Tag := 0;
          PartForm.edGoalPartType.Text:= '';
       End
       else Begin
          PartForm.edGoalPartType.Tag := qGoal_Part_Type.asInteger;
          PartForm.edGoalPartType.Text:= qGoal_Part_Type_Name.AsString;
       End;

    if (qInst.AsInteger = ALFANAFTAP)
       then Begin
          PartForm.edId.Enabled     := False;
          PartForm.edDog.Enabled    := False;
          PartForm.edDocDate.Enabled:= False;
          PartForm.edComm.Enabled   := False;
          PartForm.edSert.Enabled   := False;
          PartForm.edNPType.Enabled := False;
          PartForm.edDim.Enabled    := False;
          PartForm.edSs.Enabled     := False;
          PartForm.edPrice.Enabled  := False;
//          PartForm.edPriceKP.Enabled:= False;
          PartForm.edDorSbor.Enabled:= False;
          PartForm.edOrg.Enabled    := False;
          PartForm.edTo.Enabled     := False;
          PartForm.edPlan_ID.Enabled:= False;
          PartForm.cbBarter.Enabled := False;
          PartForm.rbOwn.Enabled    := False;
          PartForm.rbKom.Enabled    := False;
          PartForm.rbStore.Enabled  := False;
          PartForm.cbGoalPart.Enabled  := False;
          PartForm.edGoalPartType.Enabled  := False;
          PartForm.cbFilSend.Enabled  := False;
          PartForm.chbSoputst.Enabled := False;
       End;

    if (qFILSEND.AsString = 'Y')
       then Begin
          PartForm.edDog.Enabled    := False;
          PartForm.edNPType.Enabled := False;
          PartForm.edDim.Enabled    := False;
       End;

    PartForm.ShowModal;
     If PartForm.ModalResult = mrOk Then
    Begin
      edID.Text := PartForm.edID.Text;
      bbSearchClick(Nil);
    End;
    PartForm.Free;
  End;
end;

procedure TPartRefForm.sbClearIDClick(Sender: TObject);
begin
  edId.Clear;
end;

procedure TPartRefForm.sbClearDogClick(Sender: TObject);
begin
  edDog.Clear;
end;

procedure TPartRefForm.sbUnEraseClick(Sender: TObject);
begin
  pUnErase.Visible := sbUnErase.Down;
  sbEdit.Enabled   := Not sbUnErase.Down;
  bbOk.Enabled     := sbEdit.Enabled;
  if sbUnErase.Down then begin
    cbNoPrih.Checked:=FALSE;
    chCount.Checked:=FALSE;
  end;
  cbNoPrih.Enabled:=not sbUnerase.Down;
  chCount.Enabled:=not sbUnerase.Down;
  bbSearchClick(Nil);
end;

procedure TPartRefForm.bbUnEraseClick(Sender: TObject);
begin
  If q.Active Then
  If q.RecordCount>0 Then
  If MessageDlg(TranslateText('Вы уверены что хотите ВОСТАНОВИТЬ ПАРТИЮ НЕФТЕПРОДУКТОВ ?'),
    mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  Begin
    Try
      SetState('OIL_PART',qId.AsInteger,qInst.AsInteger,'Y');
      bbSearchClick(Nil);
    Except On E:Exception Do
      Begin
        RollbackSQL;
        MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
      End;
    End;
  End;
end;

procedure TPartRefForm.FormCreate(Sender: TObject);
begin
  inherited;
  sbUnErase.Visible:=IsHaveRight(3);
end;

procedure TPartRefForm.chPlan_IdClick(Sender: TObject);
begin
  rbPlan_Id_Y.Enabled := chPlan_Id.Checked;
  rbPlan_Id_N.Enabled := chPlan_Id.Checked;
end;

procedure TPartRefForm.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then DBGrid1DblClick(Nil);
end;

procedure TPartRefForm.sbClearCountBegClick(Sender: TObject);
begin
  edCountBeg.Clear;
end;

procedure TPartRefForm.sbClearCountEndClick(Sender: TObject);
begin
  edCountEnd.Clear;
end;

procedure TPartRefForm.chCountClick(Sender: TObject);
begin
  edCountBeg.Enabled := chCount.Checked;
  If chCount.Checked Then edCountBeg.Color := clWhite
                     Else edCountBeg.Color := clSilver;
  edCountEnd.Enabled := edCountBeg.Enabled;
  edCountEnd.Color   := edCountBeg.Color;
  sbClearCountBeg.Visible := edCountBeg.Enabled;
  sbClearCountEnd.Visible := edCountBeg.Enabled;
  if cbNoPrih.Checked and chCount.Checked then
    cbNoPrih.Checked:=FALSE;
end;

procedure TPartRefForm.edCountBegChange(Sender: TObject);
//Var
//  I, Code: Integer;
//  S : String;
begin
  {S := (Sender As TEdit).Text;
  If S <> '' Then
  Begin
    Val(S, I, Code);
    If Code <> 0 Then Beep;
  End;}
end;

procedure TPartRefForm.cbBarterClick(Sender: TObject);
begin
  inherited;
  rbBarter.Enabled:=cbBarter.Checked;
  rbNBarter.Enabled:=cbBarter.Checked;
end;

procedure TPartRefForm.edOrgToButtonClick(Sender: TObject);
var vId,vInst:integer;
    vName:string;
begin
    if ChooseOrg.CaptureOrg(1,0,0,'yyy',vId,vInst,vName) then
    begin
         edOrgTo.Text:=vName;
         edOrgTo.Tag:=vId;
         lOrgTo.tag:=vInst;
    end;
end;

procedure TPartRefForm.sbClearOrgToClick(Sender: TObject);
begin
  edOrgTo.Clear;
  edOrgTo.Tag:=0;
  lOrgTo.tag:=0;
end;

procedure TPartRefForm.cbNoPrihClick(Sender: TObject);
begin
  inherited;
  if cbNoPrih.Checked and chCount.Checked then
    chCount.Checked:=FALSE;
end;

procedure TPartRefForm.bbCancelKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ssShift in Shift then
    ShowMessage(qPlan_Id.AsString);
end;

procedure TPartRefForm.chFasClick(Sender: TObject);
begin
  inherited;
  if chFas.Checked then
    cbOils.Checked := False;
end;

procedure TPartRefForm.cbOilsClick(Sender: TObject);
begin
  inherited;
  if cbOils.Checked then
    chFas.Checked := False;
end;

end.
