unit Part;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, CurrEdit, ToolEdit, Mask, Placemnt,
  Db, DBTables, uCommonForm,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess,
  Variants, StrUtils;

type
  TPartForm = class(TCommonForm)
    Panel1: TPanel;
    Panel3: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    SP: TOilStoredProc;
    q: TOilQuery;
    qID: TFloatField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lOrg: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    lTo: TLabel;
    Bevel1: TBevel;
    edID: TEdit;
    edDog: TEdit;
    edDocDate: TDateEdit;
    edOrg: TComboEdit;
    edSs: TRxCalcEdit;
    edComm: TEdit;
    edSert: TEdit;
    edNPType: TComboEdit;
    edPrice: TRxCalcEdit;
    edPriceKP: TRxCalcEdit;
    edDim: TComboEdit;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label13: TLabel;
    chFas: TCheckBox;
    edBase: TRxCalcEdit;
    edDorSbor: TRxCalcEdit;
    edTo: TComboEdit;
    GroupBox2: TGroupBox;
    rbStore: TRadioButton;
    rbKom: TRadioButton;
    rbOwn: TRadioButton;
    edPlan_Id: TEdit;
    Bevel2: TBevel;
    Label4: TLabel;
    qOrg: TOilQuery;
    qOrgNAME: TStringField;
    qOrgBOSS: TStringField;
    qOrgGBUH: TStringField;
    cbBarter: TCheckBox;
    GroupBox3: TGroupBox;
    cbGoalPart: TCheckBox;
    Label15: TLabel;
    edGoalPartType: TComboEdit;
    cbFilSend: TCheckBox;
    qTemp: TOilQuery;
    Label16: TLabel;
    edBase_litr: TRxCalcEdit;
    Label17: TLabel;
    edUD_Weight: TRxCalcEdit;
    Label18: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label19: TLabel;
    chbSoputst: TCheckBox;
    qAfterSave: TOraQuery;
    procedure FormShow(Sender: TObject);
    procedure edNPTypeButtonClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure edDimButtonClick(Sender: TObject);
    procedure chFasClick(Sender: TObject);
    procedure edOrgButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edToButtonClick(Sender: TObject);
    procedure cbGoalPartClick(Sender: TObject);
    procedure edGoalPartTypeButtonClick(Sender: TObject);
    procedure rbStoreClick(Sender: TObject);
    procedure CalcBase;
    procedure CalcBase_Litr;
    procedure CalcUd_Weight;
    procedure edBase_litrExit(Sender: TObject);
    procedure edUD_WeightExit(Sender: TObject);
    procedure edBaseExit(Sender: TObject);
    procedure CheckUdWeight;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PartForm: TPartForm;
  DefUdWeight : real;
  PartIsShtuk : boolean;

implementation

Uses NPTypeRef, Main, OilStd, ChooseOrg, uStart, UDbFunc, uXMLForm, ExFunc;

{$R *.DFM}

procedure TPartForm.FormShow(Sender: TObject);
begin
   If SP.Tag = 0 Then SP.Tag := INST;
  If edId.Text = '' Then
  Begin
    Try
      edId.Text:=IntToStr(GetSeqNextVal('S_OIL_PART'));
    Except On E:Exception Do
      MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
    End;
    edDog.Clear;
    edComm.Clear;
    edSert.Clear;
    edDocDate.Date := Date;
    {
    qOrg.Close;
    qOrg.ParamByName('a').AsInteger := ALFANAFTA;
    qOrg.Open;
    edOrg.Text := qOrgName.AsString;
    edOrg.Tag  := ALFANAFTA;
    lOrg.Tag   := ALFANAFTA;
    }
    qOrg.Close;
    qOrg.ParamByName('a').AsInteger := Inst;
    qOrg.Open;
    edTo.Text := qOrgName.AsString;
    edTo.Tag  := Inst;
    lTo.Tag   := Inst;

    edNPType.Text := '';
    edNPType.Tag  := 0;
    edSs.Clear;
    rbOwn.Checked := True;
    edDorSbor.Clear;
    edPrice.Clear;
    edPriceKP.Clear;
    edBase.Clear;
    edBase_Litr.Clear;
    edUd_Weight.Clear;
    edDim.Clear;
    chFas.Checked := False;
    chFas.Enabled := False;
    edDim.Text := TranslateText('тонна');
    edDim.Tag  := 2;
    edPlan_ID.Text := '';
    DefUdWeight := 0;
    cbGoalPart.Checked := False;
    edGoalPartType.Clear;
  End;
end;

procedure TPartForm.CheckUdWeight;
Begin
  if chFas.Checked and (edBase.Value =0) and (edBase_litr.value=0) and (DefUdWeight<>0)
     then edUd_Weight.value := DefUdWeight;
End;

procedure TPartForm.edNPTypeButtonClick(Sender: TObject);
Var
  NPTypeRefForm : TNPTypeRefForm;
begin
  Application.CreateForm(TNPTypeRefForm, NPTypeRefForm);
  if edNPType.Tag <> 0 then  //при редагуванні
    begin                    //дозволяємо змінювати тип НП в партії лише в межах групи НП
      qTemp.Close;
      qTemp.SQL.Text := 'select np_grp, np_grp_name'+
                        '  from v_oil_np_type'+
                        ' where id = :id';
      _OpenQueryPar(qTemp,['id',edNPType.Tag]);
      NPTypeRefForm.edNPGroup.Tag := qTemp.FieldByName('np_grp').AsInteger;
      NPTypeRefForm.edNPGroup.Text := qTemp.FieldByName('np_grp_name').AsString;
      NPTypeRefForm.bbSearchClick(Sender);
      NPTypeRefForm.edNPGroup.Enabled := false;
      NPTypeRefForm.sbClearGrp.Enabled := false;
      NPTypeRefForm.bbClear.Enabled := false;
    end;
  NPTypeRefForm.ShowModal;
  If NPTypeRefForm.ModalResult = mrOk Then
  Begin
    edNPType.Text := NPTypeRefForm.qName.AsString;
    edNPType.Tag  := NPTypeRefForm.qId.AsInteger;
    if not NPTypeRefForm.qUd_Weight.IsNull then DefUdWeight := NPTypeRefForm.qUd_Weight.AsFloat;
    if NPTypeRefForm.qUS_SUBGROUP_ID.IsNull
       then chbSoputst.Checked := False;
    chbSoputst.Enabled := not NPTypeRefForm.qUS_SUBGROUP_ID.IsNull;
  End;
  NPTypeRefForm.Free;
  CheckUdWeight;
end;

procedure TPartForm.bbCancelClick(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;

procedure TPartForm.bbOkClick(Sender: TObject);
Var
  Res, Msg : String;
begin

  if (edOrg.Text = '') then
  begin
    edOrg.SetFocus;
    raise Exception.Create(TranslateText('Необходимо выбрать поставщика'));
  end;

  if (edSS.Value  = 0) and (not rbStore.Checked) then
  begin
    ShowMessage(TranslateText('Нулевая уч. цена допускается только для хранимого товара'));
    Exit;
  end;

  edDog.Text := ANSIUpperCase(edDog.Text);

  if edDog.Text = '' then
  begin
    MessageDlg(TranslateText('Не введен договор!'), mtError, [mbOk], 0);
    exit;
  end;

  if edDocDate.Date = 0 then
  begin
    MessageDlg(TranslateText('Не введена дата договора!'), mtError, [mbOk], 0);
    exit;
  end;

 { if PosEnglishSymbol(edDog.Text) > 0 then
  begin
    ShowMessage(TranslateText('В названии договора не должно быть английских букв !')+#13#10+
                 TranslateText('(Позиция ')+IntToStr(PosEnglishSymbol(edDog.Text))+')');
    Exit;
  end;   }


  If SP.Tag = 0 Then
    SP.Tag := INST;
  If (edDog.Text<>'')And(edTo.Text<>'') Then
  Begin
    q.Close;
    q.ParamByName('D').AsString  := edDog.Text;
    q.ParamByName('T').AsInteger := edTo.Tag;
    q.ParamByName('I').AsInteger := lTo.Tag;
    q.ParamByName('PID').AsInteger := StrToInt(edId.Text);
    q.ParamByName('PIN').AsInteger := SP.Tag;
    q.Open;
    If q.RecordCount > 0 Then
    Begin
      ShowMessage(TranslateText('Партия с таким договором уже существует(')+qID.AsString+')!');
      Exit;
    End;
  End;

  if (edPlan_ID.Text='') and rbOwn.Checked and (not cbGoalPart.Checked or (edGoalPartType.Text=''))
     then Begin
      ShowMessage(TranslateText('Выберите тип целевой партии !'));
      Exit;
    End;

{  if not(edDim.Tag in [1,2,28,34]) and (not chFas.Checked or (edBase.Value=0))
     then Begin
      ShowMessage('Для ед. измерения "'+edDim.Text+'" обязательна фасовка !');
      Exit;
    End;
}
  if ABS(edBase_litr.Value*edUd_weight.Value-edBase.Value)>edBase.Value/10 then
     if Application.MessageBox(PChar(TranslateText('Между литрами, уд. весом и тоннами слишком большое несоответствие! ')+#13#10+TranslateText('Продолжить ?')),
       PChar(TranslateText('Предупреждение')),  MB_YESNO + MB_DEFBUTTON2 + MB_ICONWARNING) = IDNO then Exit;

  if cbFilSend.Checked and (edId.Tag = 0) then
    Msg := TranslateText('Эта партия будет разослана на филиалы.')+#13#10+
                 TranslateText('По этой причине ее название, тип нефтепродукта и единицу измерения')+#13#10+
                 TranslateText('отредактировать будет нельзя.')+#13#10;

  If edId.Tag = 0 Then Res := TranslateText('ДОБАВИТЬ')
                  Else Res := TranslateText('ИЗМЕНИТЬ');
  Msg := Msg +TranslateText('Вы уверены что хотите ')+Res+TranslateText(' ПАРТИЮ ?');
  If MessageDlg(Msg, mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  Begin
    Try
      StartSQL;
      With SP Do
      Begin
        StoredProcName := 'OIL.INSORUPDOIL_PART';
        Prepare;
        ParamByName('ID#').AsInteger        := StrToInt(edId.Text);
        ParamByName('STATE#').AsString      := 'Y';
        ParamByName('INST#').AsInteger      := Tag;
        ParamByName('DOG#').AsString        := edDog.Text;
        ParamByName('DOG_DATE#').Value := BoolTo_(edDocDate.Text[1] = ' ',null, edDocDate.Date);
        ParamByName('COMM#').AsString       := edComm.Text;
        ParamByName('SERT#').AsString       := edSert.Text;
        ParamByName('NP_TYPE#').AsInteger   := edNPType.Tag;
        ParamByName('BASE_#').AsFloat       := edBase.Value/1000;
        ParamByName('BASE_LITR#').AsFloat   := edBase_Litr.Value;
        ParamByName('UD_WEIGHT#').AsFloat   := edUd_Weight.Value/1000;
        ParamByName('DIM_ID#').AsInteger    := edDim.Tag;
        ParamByName('SS#').AsFloat          := edSs.Value;
        ParamByName('PRICE#').AsFloat       := edPrice.Value;
        ParamByName('PRICE_KP#').AsFloat    := edPriceKP.Value;
        ParamByName('DOR_SBOR#').AsFloat    := edDorSbor.Value;
        ParamByName('OWN_GOODS#').AsString := IfThen(rbOwn.Checked, 'O', IfThen(rbKom.Checked, 'K', 'S'));
        ParamByName('FROM_#').AsInteger     := edOrg.Tag;
        ParamByName('FROM_INST#').AsInteger := lOrg.Tag;
        ParamByName('TO_#').AsInteger       := edTo.Tag;
        ParamByName('TO_INST#').AsInteger   := lTo.Tag;
        ParamByName('PLAN_ID#').AsString    := edPlan_ID.Text;
        if CbBarter.Checked then
          ParamByName('IS_BARTER#').AsInteger   := 1
        else
          ParamByName('IS_BARTER#').AsInteger   := 0;
        If cbGoalPart.Checked Then ParamByName('Goal_Part_Type#').AsInteger := edGoalPartType.Tag
          Else ParamByName('Goal_Part_Type#').Clear;
        ParamByName('FILSEND#').AsString := IfThen(cbFilSend.Checked, 'Y', 'N');
        ParamByName('SOPUTST#').AsString := IfThen(chbSoputst.Checked, 'Y', '');
        ExecProc;
        Res:=ParamByName('Result').AsString;
        If Length(Res)>0 Then
          If Res[1]<>'0' Then
            Raise Exception.Create(SubStr(Res,2));

        // Обновить переброски с картточки на карточку
        DefineQParams(TOilQuery(qAfterSave),
         ['AFromId', edOrg.Tag,
          'AFromInst', lOrg.Tag,
          'AToId', edTo.Tag,
          'AToInst', lTo.Tag,
          'APartId', StrToInt(edId.Text),
          'APartInst', Tag]);
        qAfterSave.ExecSQL;
        CommitSQL;
        Close;
        ModalResult := mrOk;
      End;
    Except On E:Exception Do
      begin
        RollbackSQL;
        MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
      end;
    End;
  End;
end;

procedure TPartForm.edDimButtonClick(Sender: TObject);
Var
  Form : TXMLForm;
  Shtuk_Fas : string;
begin
  Form :=GetXMLFormAsFilter('dimref');
  try
    If Form.ShowModal <> mrOk Then exit;
    Shtuk_Fas := Form.FQuery.FieldByName('IsShtuki').AsString + Form.FQuery.FieldByName('IsFasov').AsString;
    if (edID.Text<>'') and (PartIsShtuk<>(Shtuk_Fas[1] = 'Y')) then
      if GetSqlValue(
           'select count(*) as C from oil_rashod where state=''Y'''+
           ' and part_id='+edId.Text+' and part_inst='+IntToStr(SP.Tag)
         )>0
      then
        raise exception.create(
          TranslateText('При данной ед. измерения меняется фасованость партии.')+#13#10+
          TranslateText('Это недопустимо, поскольку по данной партии проводились отпуски.'));
    edDim.Text := Form.FQuery['NAME'];
    edDim.Tag  := Form.FQuery['ID'];

    chFas.Enabled := not((Shtuk_Fas[2] = 'Y') or (Shtuk_Fas = 'NN'));
    chFas.Checked := (Shtuk_Fas[2] = 'Y');
    CheckUdWeight;
  finally
    FreeAndNil(Form);
  end;
end;


procedure TPartForm.chFasClick(Sender: TObject);
begin
  edBase.Enabled := chFas.Checked;
  edBase_Litr.Enabled := chFas.Checked;
  edUd_Weight.Enabled := chFas.Checked;
  If Not edBase.Enabled Then edBase.Clear;
  If Not edBase_Litr.Enabled Then edBase_Litr.Clear;
  If Not edUd_Weight.Enabled Then edUd_Weight.Clear;
  CheckUdWeight;
end;

procedure TPartForm.edOrgButtonClick(Sender: TObject);
var vId,vInst:integer;
    vName:string;
begin
  if ChooseOrg.CaptureOrg(1,0,0,'yyy',vId,vInst,vName) then
  begin
    edOrg.Text := vName;
    edOrg.Tag := vId;
    lOrg.tag := vInst;
  end;
end;


procedure TPartForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q.Close;
  //Action := caFree;
end;

procedure TPartForm.edToButtonClick(Sender: TObject);
var vId,vInst:integer;
    vName:string;
begin
    if ChooseOrg.CaptureOrg(1,Main_id,Inst,'yyy',vId,vInst,vName) then
    begin
         edTo.Text:=vName;
         edTo.Tag:=vId;
         lTo.tag:=vInst;
    end;
end;

procedure TPartForm.cbGoalPartClick(Sender: TObject);
begin
  edGoalPartType.Enabled := cbGoalPart.Checked;
  if not edGoalPartType.Enabled then begin
    edGoalPartType.Clear;
    edGoalPartType.Tag:=0;
  end;
end;

procedure TPartForm.edGoalPartTypeButtonClick(Sender: TObject);
begin
  XMLChoose('GoalPartRef', edGoalPartType);
end;

procedure TPartForm.rbStoreClick(Sender: TObject);
begin
  cbGoalPart.Enabled := rbOwn.Checked or PVL_EXISTS and rbStore.Checked;
  if rbStore.Checked and PVL_EXISTS then begin
    cbGoalPart.Checked:=true;
    edGoalPartType.Text:=GetSqlValue('select name from oil_goal_part_type where id=23');
    edGoalPartType.Tag:=23;
  end else
    if not rbOwn.Checked then cbGoalPart.Checked := False;
  cbGoalPartClick(nil);
end;

procedure TPartForm.CalcBase;
Begin
    if (edBase.value =0) and (edBase_Litr.value<>0) and (edUd_Weight.value<>0)
       then edBase.value := edBase_Litr.value*edUd_Weight.value;
End;

procedure TPartForm.CalcBase_Litr;
Begin
    if (edBase_Litr.value =0) and (edBase.value<>0) and (edUd_Weight.value<>0)
       then edBase_Litr.value := edBase.value/edUd_Weight.value;
End;

procedure TPartForm.CalcUd_Weight;
Begin
    if (edUd_Weight.value =0) and (edBase.value<>0) and (edBase_Litr.value<>0)
       then edUd_Weight.value := edBase.value/edBase_Litr.value;
End;

procedure TPartForm.edBase_litrExit(Sender: TObject);
begin
  CalcUd_Weight;
  CalcBase;
end;

procedure TPartForm.edUD_WeightExit(Sender: TObject);
begin
  CalcBase_Litr;
  CalcBase;
end;

procedure TPartForm.edBaseExit(Sender: TObject);
begin
  CalcUd_Weight;
  CalcBase_Litr;
end;

end.
