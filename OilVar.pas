unit OilVar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MemDS,
  StdCtrls, Mask, ToolEdit, ComCtrls, Buttons, ExtCtrls, Db, DBTables, uCommonForm,
  uOilQuery, Ora, uOilStoredProc, DBAccess{$IFDEF VER150},Variants{$ENDIF};

type
  TOilVarForm = class(TCommonForm)
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    bbOk: TBitBtn;
    PageControl1: TPageControl;
    tsCommon: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    ComboEdit1: TComboEdit;
    Label1: TLabel;
    ComboEdit2: TComboEdit;
    Label2: TLabel;
    ComboEdit3: TComboEdit;
    Label3: TLabel;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    tsCard: TTabSheet;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    chLSEnable: TCheckBox;
    chAgentEnable: TCheckBox;
    ceAgentName: TComboEdit;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    GroupBox7: TGroupBox;
    edDogPostCond: TEdit;
    Panel4: TPanel;
    GroupBox6: TGroupBox;
    cbDebetLastYear: TCheckBox;
    cbDogPostCond: TCheckBox;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    EFilialNumber: TEdit;
    cbReserv: TCheckBox;
    cbManual: TCheckBox;
    Panel1: TPanel;
    sbPrintSettings: TSpeedButton;
    CBPrintDogFilial: TCheckBox;
    CBPrintRS: TCheckBox;
    RBInshe: TRadioButton;
    RBRekvizitControl: TRadioButton;
    RBRekvizitFilialaNK: TRadioButton;
    GroupBox3: TGroupBox;
    cbDoubleScan: TCheckBox;
    gbProvider: TGroupBox;
    pNNRekvizit: TPanel;
    rgNNWithUpperRekvizit: TRadioGroup;
    cbNNWithUpperRekvizit: TCheckBox;
    LblNNRekvizit: TLabel;
    CBAdress: TCheckBox;
    pNNAdress: TPanel;
    rgNNAdress: TRadioGroup;
    gbClient: TGroupBox;
    cbNNClientAdress: TCheckBox;
    GroupBox5: TGroupBox;
    cbTTNRealAddress: TCheckBox;
    cbPrintTTNFilNK: TCheckBox;
    Panel5: TPanel;
    sbEditCause: TSpeedButton;
    gbPost: TGroupBox;
    eManagerShip: TEdit;
    GroupBox8: TGroupBox;
    rbLangRus: TRadioButton;
    rbLangUkr: TRadioButton;
    GroupBox9: TGroupBox;
    cbRN_FilNK: TCheckBox;
    rgPrintTypeDailyTax: TRadioGroup;
    cbDogPostCondFromWhom: TCheckBox;
    cbRN_FilNK_CT: TCheckBox;
    LblAvizoSyffix: TLabel;
    EAvizoSyffix: TEdit;
    lblManagerShip: TLabel;
    eBuhShip: TEdit;
    lblBuhShip: TLabel;
    Label6: TLabel;
    cbCardUser: TComboBox;
    lblCardUser: TLabel;
    gbBill: TGroupBox;
    cbBillNumForCard: TCheckBox;
    tsTalon: TTabSheet;
    GroupBox10: TGroupBox;
    cbTalonDevideAlfaAvias: TCheckBox;
    cbTalonCheckReturn: TCheckBox;
    tsDR: TTabSheet;
    gbDR_RashAdd: TGroupBox;
    ceDR_Oper: TComboEdit;
    rbDR_RashAddNot: TRadioButton;
    rbDR_RashAddNal: TRadioButton;
    rbDR_RashAddOther: TRadioButton;
    cbDR_RashAddNalFromTalon: TCheckBox;
    lDR_RashAddNalFromTalon: TLabel;
    gbDR_RashVisibleParts: TGroupBox;
    cbDR_RashVisibleTal: TCheckBox;
    cbDR_RashVisibleSN: TCheckBox;
    cbDR_NotLoadTwoPrih: TCheckBox;
    cbDR_NotLoadLittlePrih: TCheckBox;
    eDR_NotLoadLittlePrih: TEdit;
    lDR_NotLoadLittlePrih: TLabel;
    cbDR_GetPriceFromPriceRef: TCheckBox;
    eDR_DayPeriodPriceRef: TEdit;
    lDR_GetPriceFromPriceRef: TLabel;
    lday: TLabel;
    tsRash: TTabSheet;
    gbRashTTN: TGroupBox;
    lRash1: TLabel;
    eRashTTN_DT_FIRST: TEdit;
    lRash2: TLabel;
    eRashTTN_DT_LAST: TEdit;
    lRash3: TLabel;
    eRashTTN_NP_FIRST: TEdit;
    lRash4: TLabel;
    eRashTTN_NP_LAST: TEdit;
    procedure ComboEdit1ButtonClick(Sender: TObject);
    procedure ComboEdit2ButtonClick(Sender: TObject);
    procedure ComboEdit3ButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure CBPrintDogFilialClick(Sender: TObject);
    procedure ceAgentNameButtonClick(Sender: TObject);
    procedure cbDogPostCondClick(Sender: TObject);
    procedure sbPrintSettingsClick(Sender: TObject);
    procedure CBAdressClick(Sender: TObject);
    procedure cbNNWithUpperRekvizitClick(Sender: TObject);
    procedure sbEditCauseClick(Sender: TObject);
    procedure cbDogPostCondFromWhomClick(Sender: TObject);
    procedure cbTalonCheckReturnClick(Sender: TObject);
    procedure ceDR_OperButtonClick(Sender: TObject);
    procedure ceDR_OperKeyPress(Sender: TObject; var Key: Char);
    procedure rbDR_RashAddOtherClick(Sender: TObject);
    procedure eDR_NotLoadLittlePrihKeyPress(Sender: TObject; var Key: Char);
    procedure cbDR_NotLoadLittlePrihClick(Sender: TObject);
    procedure cbDR_GetPriceFromPriceRefClick(Sender: TObject);
  private
    FLangInitial: integer;
  public
  end;

procedure ChangeCurrentOrg(MainOrgId, MainOrgINST, MainT, MParID, MParINST: integer; Name: string);

var
  MainOrgId, MainOrgInst, AlfaNID, AlfaNPId, MainT, MParID, MParINST: Integer;
  OilVarForm: TOilVarForm;
  CurrentOrgChanged: boolean = False;
  AgentId, AgentInst: integer;
  ProvInform: boolean;

implementation

{$R *.DFM}

uses Main, OperTypeRef, OilSTD, ChooseOrg, UDbFunc, TaxBillPrintForm,
  Passw, uCrypt, TaxBillPrint, ExFunc;

//==============================================================================
procedure TOilVarForm.ComboEdit1ButtonClick(Sender: TObject);
var
  Q: TOilQuery;
  vId, vInst: integer;
  vName: string;
begin
  if (INST <> ALFANAFTA) and (INST <> ALFANAFTAP) then
    if not TestPassword(pwtOrg) then exit;
  if ChooseOrg.CaptureOrgExt(1, 0, 0, 'yyyyynnn', vId, vInst, vName, q) then
  begin
    MainOrgId := vId;
    MainOrgInst := vInst;
    MainT := q.fieldbyname('org_id').value;
    if not q.fieldbyname('par').IsNull then MParId := q.fieldbyname('par').value
    else MParId := -1;
    if not q.fieldbyname('par_inst').IsNull then MParInst := q.fieldbyname('par_inst').value
    else MParInst := -1;
    Comboedit1.Text := vName;
    CurrentOrgChanged := True;
  end;
end;
//==============================================================================
procedure TOilVarForm.ComboEdit2ButtonClick(Sender: TObject);
var
  vId, vInst: integer;
  vName: string;
begin
  if ChooseOrg.CaptureOrg(1, 0, 0, 'yyyyynnn', vId, vInst, vName) then
  begin
    AlfaNID := vId;
    Comboedit2.Text := vName;
  end;
end;
//==============================================================================
procedure TOilVarForm.ComboEdit3ButtonClick(Sender: TObject);
var
  vId, vInst: integer;
  vName: string;
begin
  if ChooseOrg.CaptureOrg(1, 0, 0, 'yyyyynnn', vId, vInst, vName) then
  begin
    AlfaNPId := vId;
    Comboedit3.Text := vName;
  end;
end;
//==============================================================================
procedure TOilVarForm.FormCreate(Sender: TObject);
var
  s, strAgentIdInst: string;
  q:TOilQuery;
begin
  inherited;
  ProvInform := true;
  comboedit1.text :=
    nvl(GetSQLValue('select name from v_org where id = '+ IntToStr(MAIN_ID) +' and inst = '+ IntToStr(INST)), '');

  comboedit2.text :=
    nvl(GetSQLValue('select name from v_org where id = '+ IntToStr(alfanafta) +' and inst = '+ IntToStr(alfanafta)), '');

  comboedit3.text :=
    nvl(GetSQLValue('select name from v_org where id = '+ IntToStr(alfanaftap) +' and inst = '+ IntToStr(alfanaftap)), '');

  MainOrgId := MAIN_ID;
  MainOrgInst := INST;
  AlfaNID := Alfanafta;
  AlfaNPId := alfanaftap;

  MParID := MAIN_PAR;
  MParINST := MAIN_PAR_INST;
  MainT := MAIN_TYPE;

  rgPrintTypeDailyTax.ItemIndex := decode([PRINT_TYPE_DAILY_TAX, 'DETAIL', 0, 'SUMMARY', 1, 0]);
  eManagerShip.Text := MANAGER_SHIP;
  eBuhShip.Text := BUH_SHIP; 
  cbNNClientAdress.Checked := (NN_CLIENT_ADRESS = 'ALFA');
  if FILIAL_NUMBER <> '0' then EFilialNumber.Text := FILIAL_NUMBER;
  cbNNWithUpperRekvizit.Checked := not (NN_WITH_UPPER_REKVIZIT = 'N');
  begin
    cbNNWithUpperRekvizit.OnClick(nil);
    if NN_WITH_UPPER_REKVIZIT = 'Y' then rgNNWithUpperRekvizit.ItemIndex := 0
    else
      if NN_WITH_UPPER_REKVIZIT = 'ALFA' then rgNNWithUpperRekvizit.ItemIndex := 1;
  end;
  CBAdress.Checked := not (PRINT_UPPER_ADRESS = 'NO');
  begin
    CBAdress.OnClick(nil);
    if PRINT_UPPER_ADRESS = 'YES' then rgNNAdress.ItemIndex := 0
    else
      if PRINT_UPPER_ADRESS = 'ALFA' then rgNNAdress.ItemIndex := 1;
  end;
  CBPrintDogFilial.Checked := (PRINT_DOG_FILIAL = 'Y');

  cbRN_FilNK.Checked := (PRINT_RN_FILIAL = 'Y');
  cbRN_FilNK_CT.Checked := (PRINT_RN_FILIAL_CT = 'Y');

  //*************************Для счетов (карточные)*****************************
  // Брать предыдущий номер по клиенту
  cbBillNumForCard.Checked := (BILL_NUM_FOR_CARD = 'Y');
  //****************************************************************************

  cbPrintTTNFilNK.Checked := (PRINT_TTN_FIL_NK = 'Y');
  CBTtnRealAddress.Checked := (PRINT_TTN_REAL_ADDRESS = 'Y');
  RBRekvizitControl.Checked := (DOG_WITH_REKVIZIT_CONTROL = 'Y') and (PRINT_DOG_FILIAL = 'Y');
  RBRekvizitFilialaNK.Checked := (REKVIZIT_FILIALA_NK = 'Y') and (PRINT_DOG_FILIAL = 'Y');
  CBPrintRS.Checked := (PRINT_RS = 'Y');

  RBRekvizitControl.Enabled := (CBPrintDogFilial.Checked);
  RBRekvizitFilialaNK.Enabled := (CBPrintDogFilial.Checked);
  RBInshe.Enabled := (CBPrintDogFilial.Checked);

  cbDoubleScan.Checked := DOUBLE_SCAN;
  cbDebetLastYear.Checked := (DEBET_LAST_YEAR = 'Y');
  cbReserv.Checked := (NAL_NUM_RESERVE = 'Y');
  cbManual.Checked := (NAL_NUM_HAND = 'Y');
  edDogPostCond.Text := DOG_POST_CONDITION;
  cbDogPostCond.Checked := (DOG_POST_CONDITION = DOG_POST_CONDITION_DEFAULT);
  cbDogPostCondFromWhom.Checked := (DOG_POST_CONDITION_FROM_WHOM = 'Y');

  chAgentEnable.Checked := nvl(GetSQLValue('select value from oil_var where name = ''CARD_MONEY_ENABLE'''), '') = 'Y';
  chLSEnable.Checked := nvl(GetSQLValue('select value from oil_var where name = ''CARD_LS_ENABLE'''), '') = 'Y';

  // где произошло списание
  strAgentIdInst := VarToStr(ReadOilVar('CARD_AGENT_ID_INST'));
  AgentId := StrToInt(copy(strAgentIdInst, 1, pos(',', strAgentIdInst) - 1));
  AgentInst := StrToInt(copy(strAgentIdInst, pos(',', strAgentIdInst) + 1, length(strAgentIdInst)));
  ceAgentName.Text := GetOrgName(AgentId, AgentInst);

  PageControl1.ActivePage := tsCommon;
  ProvInform := False;

  s := ReadOilVar('LANGUAGE');
  if (s = '') or (s = '0') then
    FLangInitial := 0
  else
    FLangInitial := 1;
  rbLangRus.Checked := FLangInitial = 0;
  rbLangUkr.Checked := FLangInitial = 1;

  EAvizoSyffix.Text:= AVIZO_SYFFIX;
  q:=TOilQuery.Create(nil);
  try
    q.SQL.Text:='select distinct owner from all_objects where object_name like ''CARD_DUMP%'' and object_type=''TRIGGER'' and owner<>''DEMO'' ';
    _OpenQuery(q);
    q.First;
    while not q.Eof do
    begin
      cbCardUser.Items.Add(q['owner']);
      q.Next;
    end;
    if q.IsEmpty then
    begin
      cbCardUser.Items.Add('NONE');
      cbCardUser.ItemIndex:=cbCardUser.Items.IndexOf('NONE');
    end
    else
      cbCardUser.ItemIndex:=cbCardUser.Items.IndexOf(AdmSettings.Get('CARD_USER'));
  finally
    q.Free;
  end;

  if AdmSettings.Exist('TALON_CHECK_RETURN') then
    cbTalonCheckReturn.Checked := AdmSettings.Get('TALON_CHECK_RETURN') = 'Y';
  if AdmSettings.Exist('TALON_DEVIDE_ALFA_AVIAS') then
    cbTalonDevideAlfaAvias.Checked := AdmSettings.Get('TALON_DEVIDE_ALFA_AVIAS') = 'Y';

  // DR
  //----------------------------------------------------------------------------
  // Разница между загруженной реализацией и реализацией по счетчикам на АЗС
  if AdmSettings.Exist('DR_CORR') then
  begin
    s := AdmSettings.Get('DR_CORR');
    rbDR_RashAddNot.Checked   := s = 'NOT';
    rbDR_RashAddNal.Checked   := s = 'NAL';
    rbDR_RashAddOther.Checked := s = 'OTHER';

    if AdmSettings.Exist('DR_CORR_OPER') then
    begin
      s := AdmSettings.Get('DR_CORR_OPER');
      ceDR_Oper.Tag  := StrToInt(s);
      ceDR_Oper.Text := GetOperationName(StrToInt(s));
    end;
  end;
  rbDR_RashAddOtherClick(nil);

  // Корректировать наличную реализацию, если заказ не соответствует налитому по талонам Авиаса
  if AdmSettings.Exist('DR_CORR_NAL_RestTalon') then
    cbDR_RashAddNalFromTalon.Checked := AdmSettings.Get('DR_CORR_NAL_RestTalon') = 'Y';

  // Не скрывать Талоны
  if AdmSettings.Exist('DR_VISIBLE_TALON') then
    cbDR_RashVisibleTal.Checked := AdmSettings.Get('DR_VISIBLE_TALON') = 'Y';

  // Не скрывать Собственные нужды
  if AdmSettings.Exist('DR_VISIBLE_SN') then
    cbDR_RashVisibleSN.Checked := AdmSettings.Get('DR_VISIBLE_SN') = 'Y';

  // Не загружать повторяющие приходы
  if AdmSettings.Exist('DR_NOT_LOAD_TWO_PRIH') then
    cbDR_NotLoadTwoPrih.Checked := AdmSettings.Get('DR_NOT_LOAD_TWO_PRIH') = 'Y';

  // Не загружать приходы меньше <> литров
  cbDR_NotLoadLittlePrih.Checked := false;
  if AdmSettings.Exist('DR_NOT_LOAD_LITTLE_PRIH') then
  begin
    eDR_NotLoadLittlePrih.Text := nvl(AdmSettings.Get('DR_NOT_LOAD_LITTLE_PRIH'), '');
    if eDR_NotLoadLittlePrih.Text <> '' then
      cbDR_NotLoadLittlePrih.Checked := true;
  end;
  cbDR_NotLoadLittlePrihClick(nil); 

  // Цены брать со справочника "Цены на сопутствующий товар"
  cbDR_GetPriceFromPriceRef.Checked := false;
  if AdmSettings.Exist('DR_NP_PRICE') then
  begin
    cbDR_GetPriceFromPriceRef.Checked := AdmSettings.Get('DR_NP_PRICE') = 'Y';
    eDR_DayPeriodPriceRef.Text := nvl(AdmSettings.Get('DR_NP_PRICE_DAY'), '');
  end;
  cbDR_GetPriceFromPriceRefClick(nil);
  //----------------------------------------------------------------------------

  // Отпуск с НБ
  //----------------------------------------------------------------------------
  // Печать ТТН
   if AdmSettings.Exist('RASH_TTN_PREF_DT_FIRST') then eRashTTN_DT_FIRST.Text := AdmSettings.Get('RASH_TTN_PREF_DT_FIRST');
   if AdmSettings.Exist('RASH_TTN_PREF_DT_LAST')  then eRashTTN_DT_LAST.Text  := AdmSettings.Get('RASH_TTN_PREF_DT_LAST');

   if AdmSettings.Exist('RASH_TTN_PREF_NP_FIRST') then eRashTTN_NP_FIRST.Text := AdmSettings.Get('RASH_TTN_PREF_NP_FIRST');
   if AdmSettings.Exist('RASH_TTN_PREF_NP_LAST')  then eRashTTN_NP_LAST.Text  := AdmSettings.Get('RASH_TTN_PREF_NP_LAST');
  //----------------------------------------------------------------------------
end;
//==============================================================================
procedure ChangeCurrentOrg(MainOrgId, MainOrgINST, MainT, MParID, MParINST: integer; Name: string);
begin
  _ExecSQL('update oil_var set value = '''+ Inttostr(MainOrgId) +''' where name = ''ID''');
  MAIN_ID := MainOrgId;
  _ExecSQL('update oil_var set value = '''+ Inttostr(MainOrgINST) +''' where name = ''INST''');
  INST := MainOrgINST;
  _ExecSQL('update oil_var set value = '''+ Inttostr(MainT) +''' where name = ''MAIN_TYPE''');
  MAIN_TYPE := MainT;
  _ExecSQL('update oil_var set value = '''+ Inttostr(MParID) +''' where name = ''MAIN_PAR''');
  MAIN_PAR := MParID;
  _ExecSQL('update oil_var set value = '''+ Inttostr(MParINST) +''' where name = ''MAINPAR_INST''');
  MAIN_PAR_INST := MParINST;
  MainForm.SetCaption(Name);
  CURRENT_NAME := Name;
end;
//==============================================================================
procedure TOilVarForm.bbOkClick(Sender: TObject);
begin
  try
    startsql;
    if CurrentOrgChanged then
      ChangeCurrentOrg(MainOrgId, MainOrgINST, MainT, MParID, MParINST,
        nvl(GetSQLValue('select distinct Name from v_org where id = inst and id = '+ IntToStr(MainOrgId)), ''));

    case rgPrintTypeDailyTax.ItemIndex of
      0: PRINT_TYPE_DAILY_TAX := 'DETAIL';
      1: PRINT_TYPE_DAILY_TAX := 'SUMMARY';
      else
        PRINT_TYPE_DAILY_TAX := 'DETAIL';
    end;
    AdmSettings.Save('PRINT_TYPE_DAILY_TAX', PRINT_TYPE_DAILY_TAX);
    if eManagerShip.Text = '' then MANAGER_SHIP := TranslateText('Директор')
    else MANAGER_SHIP := eManagerShip.Text;
    AdmSettings.Save('MANAGER_SHIP', MANAGER_SHIP);

    if eBuhShip.Text = '' then
      BUH_SHIP := TranslateText('Главный бухгалтер')
    else
      BUH_SHIP := eBuhShip.Text;
    AdmSettings.Save('BUH_SHIP', BUH_SHIP);

    if cbNNClientAdress.Checked then NN_CLIENT_ADRESS := 'ALFA'
    else NN_CLIENT_ADRESS := 'Y';
    AdmSettings.Save('NN_CLIENT_ADRESS', NN_CLIENT_ADRESS);

    if cbNNWithUpperRekvizit.Checked then
      if rgNNWithUpperRekvizit.ItemIndex = 1 then NN_WITH_UPPER_REKVIZIT := 'ALFA'
      else NN_WITH_UPPER_REKVIZIT := 'Y'
    else NN_WITH_UPPER_REKVIZIT := 'N';

    AdmSettings.Save('NN_WITH_UPPER_REKVIZIT', NN_WITH_UPPER_REKVIZIT);
    if CBAdress.Checked then
    begin
      if rgNNAdress.ItemIndex = 1 then PRINT_UPPER_ADRESS := 'ALFA'
      else PRINT_UPPER_ADRESS := 'YES';
    end
    else PRINT_UPPER_ADRESS := 'NO';

    AdmSettings.Save('PRINT_UPPER_ADRESS', PRINT_UPPER_ADRESS);
    if EFilialNumber.Text = '' then FILIAL_NUMBER := '0'
    else FILIAL_NUMBER := EFilialNumber.Text;
    AdmSettings.Save('FILIAL_NUMBER', FILIAL_NUMBER);
    if CBPrintDogFilial.Checked then PRINT_DOG_FILIAL := 'Y'
    else PRINT_DOG_FILIAL := 'N';
    AdmSettings.Save('PRINT_DOG_FILIAL', PRINT_DOG_FILIAL);
    if CBPrintRS.Checked then PRINT_RS := 'Y'
    else PRINT_RS := 'N';
    AdmSettings.Save('PRINT_RS', PRINT_RS);
    if RBRekvizitControl.Checked = true then DOG_WITH_REKVIZIT_CONTROL := 'Y'
    else DOG_WITH_REKVIZIT_CONTROL := 'N';
    AdmSettings.Save('DOG_WITH_REKVIZIT_CONTROL', DOG_WITH_REKVIZIT_CONTROL);
    if RBRekvizitFilialaNK.Checked = true then REKVIZIT_FILIALA_NK := 'Y'
    else REKVIZIT_FILIALA_NK := 'N';
    AdmSettings.Save('REKVIZIT_FILIALA_NK', REKVIZIT_FILIALA_NK);
    if cbTTNRealAddress.Checked then PRINT_TTN_REAL_ADDRESS := 'Y'
    else PRINT_TTN_REAL_ADDRESS := 'N';
    AdmSettings.Save('PRINT_TTN_REAL_ADDRESS', PRINT_TTN_REAL_ADDRESS);
    if cbPrintTTNFilNK.Checked then PRINT_TTN_FIL_NK := 'Y'
    else PRINT_TTN_FIL_NK := 'N';
    AdmSettings.Save('PRINT_TTN_FIL_NK', PRINT_TTN_FIL_NK);
    if cbReserv.Checked then NAL_NUM_RESERVE := 'Y'
    else NAL_NUM_RESERVE := 'N';
    AdmSettings.Save('NAL_NUM_RESERVE', NAL_NUM_RESERVE);
    if cbManual.Checked then NAL_NUM_HAND := 'Y'
    else NAL_NUM_HAND := 'N';
    AdmSettings.Save('NAL_NUM_HAND', NAL_NUM_HAND);

    if cbRN_FilNK.Checked then PRINT_RN_FILIAL := 'Y'
    else PRINT_RN_FILIAL := 'N';
    AdmSettings.Save('PRINT_RN_FILIAL', PRINT_RN_FILIAL);
    
    if cbRN_FilNK_CT.Checked then PRINT_RN_FILIAL_CT := 'Y'
    else PRINT_RN_FILIAL_CT := 'N';
    AdmSettings.Save('PRINT_RN_FILIAL_CT', PRINT_RN_FILIAL_CT);

    //***********************Для счетов (карточные)*****************************
    // Брать предыдущий номер по клиенту
    if cbBillNumForCard.Checked then BILL_NUM_FOR_CARD := 'Y'
    else BILL_NUM_FOR_CARD := 'N';
    AdmSettings.Save('BILL_NUM_FOR_CARD', BILL_NUM_FOR_CARD);
    //**************************************************************************
    
    DOG_POST_CONDITION := edDogPostCond.Text;
    if cbDogPostCond.Checked or (DOG_POST_CONDITION = DOG_POST_CONDITION_DEFAULT) then
      AdmSettings.Delete('DOG_POST_CONDITION')
    else AdmSettings.Save('DOG_POST_CONDITION', DOG_POST_CONDITION);


    DOG_POST_CONDITION_FROM_WHOM := BoolToYN(cbDogPostCondFromWhom.Checked);
    AdmSettings.Save('DOG_POST_CONDITION_FROM_WHOM', DOG_POST_CONDITION_FROM_WHOM);

    DEBET_LAST_YEAR := BoolToYN(cbDebetLastYear.Checked);
    WriteOilVar('DEBET_LAST_YEAR', DEBET_LAST_YEAR);

    WriteOilVar('DOUBLE_SCAN', BoolToYN(cbDoubleScan.Checked));
    DOUBLE_SCAN := cbDoubleScan.Checked;

    _ExecSQl('update oil_var set value = '''+ IntToStr(AgentId) +','+ IntToStr(AgentInst) +
      ''' where name = ''CARD_AGENT_ID_INST''');

    WriteOilVar('CARD_LS_ENABLE', BoolToYN(chLSEnable.Checked));
    WriteOilVar('CARD_MONEY_ENABLE', BoolToYN(chAgentEnable.Checked));

    if EAvizoSyffix.Text = '' then AVIZO_SYFFIX := '0'
    else AVIZO_SYFFIX := EAvizoSyffix.Text;
    AdmSettings.Save('AVIZO_SYFFIX', AVIZO_SYFFIX);

    AdmSettings.Save('CARD_USER', cbCardUser.Text);

    AdmSettings.Save('TALON_CHECK_RETURN', BoolToYN(cbTalonCheckReturn.Checked));
    AdmSettings.Save('TALON_DEVIDE_ALFA_AVIAS', BoolToYN(cbTalonDevideAlfaAvias.Checked));

    if FLangInitial <> BoolTo_(rbLangRus.Checked, 0, 1) then
    begin
      FLangInitial := 1 - FLangInitial;
      WriteOilVar('LANGUAGE', FLangInitial);
      showmessage(TranslateText('Изменен язык по умолчанию! Изменение вступит в силу после перезапуска OIL'));
    end;

    // DR
    //--------------------------------------------------------------------------
    // Разница между загруженной реализацией и реализацией по счетчикам на АЗС
    if rbDR_RashAddNot.Checked   then AdmSettings.Save('DR_CORR', 'NOT');
    if rbDR_RashAddNal.Checked   then AdmSettings.Save('DR_CORR', 'NAL');
    if rbDR_RashAddOther.Checked then
    begin
      AdmSettings.Save('DR_CORR', 'OTHER');
      AdmSettings.Save('DR_CORR_OPER', IntToStr(ceDR_Oper.Tag));
    end;

    // Корректировать наличную реализацию, если заказ не соответствует налитому по талонам Авиаса
    if cbDR_RashAddNalFromTalon.Checked then
      AdmSettings.Save('DR_CORR_NAL_RestTalon', 'Y')
    else
      AdmSettings.Save('DR_CORR_NAL_RestTalon', 'N');

    // Не скрывать Талоны
    if cbDR_RashVisibleTal.Checked then
      AdmSettings.Save('DR_VISIBLE_TALON', 'Y')
    else
      AdmSettings.Save('DR_VISIBLE_TALON', 'N');

    // Не скрывать Собственные нужды
    if cbDR_RashVisibleSN.Checked then
      AdmSettings.Save('DR_VISIBLE_SN', 'Y')
    else
      AdmSettings.Save('DR_VISIBLE_SN', 'N');

    // Не загружать повторяющие приходы
    if cbDR_NotLoadTwoPrih.Checked then
      AdmSettings.Save('DR_NOT_LOAD_TWO_PRIH', 'Y')
    else
      AdmSettings.Save('DR_NOT_LOAD_TWO_PRIH', 'N');

    // Не загружать приходы меньше <> литров
    AdmSettings.Save('DR_NOT_LOAD_LITTLE_PRIH', eDR_NotLoadLittlePrih.Text);

    // Цены брать со справочника "Цены на сопутствующий товар"
    if cbDR_GetPriceFromPriceRef.Checked then
      AdmSettings.Save('DR_NP_PRICE', 'Y')
    else
      AdmSettings.Save('DR_NP_PRICE', 'N');

    // Dведенные Цены со справочника "Цены на сопутствующий товар" за "" дней
    AdmSettings.Save('DR_NP_PRICE_DAY', eDR_DayPeriodPriceRef.Text);
    //--------------------------------------------------------------------------


    // Отпуск с НБ
    //----------------------------------------------------------------------------
    // Печать ТТН
    AdmSettings.Save('RASH_TTN_PREF_DT_FIRST', eRashTTN_DT_FIRST.Text);
    AdmSettings.Save('RASH_TTN_PREF_DT_LAST',  eRashTTN_DT_LAST.Text);
    AdmSettings.Save('RASH_TTN_PREF_NP_FIRST', eRashTTN_NP_FIRST.Text);
    AdmSettings.Save('RASH_TTN_PREF_NP_LAST',  eRashTTN_NP_LAST.Text);
    //----------------------------------------------------------------------------
    commitsql;
  except on E: Exception do
    begin
      rollbacksql;
      showmessage(TranslateText('Ошибка установки настроек !') + #13#10 + E.Message);
    end;
  end;
end;
//==============================================================================
procedure TOilVarForm.CBPrintDogFilialClick(Sender: TObject);
begin
  if CBPrintDogFilial.Checked = false then
  begin
    RBRekvizitControl.Checked := false;
    RBRekvizitFilialaNK.Checked := false;
    RBInshe.Checked := false;
  end
  else RBInshe.Checked := true;
  RBInshe.Enabled := (CBPrintDogFilial.Checked);
  RBRekvizitControl.Enabled := (CBPrintDogFilial.Checked);
  RBRekvizitFilialaNK.Enabled := (CBPrintDogFilial.Checked);
end;
//==============================================================================
procedure TOilVarForm.ceAgentNameButtonClick(Sender: TObject);
var
  vName: string;
begin
  if ChooseOrg.CaptureOrg(4, Main.MAIN_ID, Main.INST, 'yyy', AgentID, AgentINST, vName) then
    ceAgentName.Text := vName;
end;
//==============================================================================
procedure TOilVarForm.cbDogPostCondClick(Sender: TObject);
begin
  edDogPostCond.Enabled := not cbDogPostCond.Checked;
  if cbDogPostCond.Checked then edDogPostCond.Text := DOG_POST_CONDITION_DEFAULT;
end;
//==============================================================================
procedure TOilVarForm.sbPrintSettingsClick(Sender: TObject);
var
  frmSettings: TfrmTaxBillPrintForm;
begin
  frmSettings := TfrmTaxBillPrintForm.Create();
  with frmSettings do
  begin
    ShowModal;
    Free;
  end;
end;
//==============================================================================
procedure TOilVarForm.CBAdressClick(Sender: TObject);
begin
  rgNNAdress.Enabled := cbAdress.Checked;
  if (rgNNAdress.Enabled) and (rgNNAdress.ItemIndex = -1) then rgNNAdress.ItemIndex := 0;
end;
//==============================================================================
procedure TOilVarForm.cbNNWithUpperRekvizitClick(Sender: TObject);
begin
  rgNNWithUpperRekvizit.Enabled := cbNNWithUpperRekvizit.Checked;
  if (rgNNWithUpperRekvizit.Enabled) and (rgNNWithUpperRekvizit.ItemIndex = -1) then
    rgNNWithUpperRekvizit.ItemIndex := 0;
end;
//==============================================================================
procedure TOilVarForm.sbEditCauseClick(Sender: TObject);
var
  TaxBill: TdmTaxBill;
begin
  TaxBill := TdmTaxBill.Create();
  try
    TaxBill.EditCause();
  finally
    TaxBill.Free;
  end;
end;
//==============================================================================
procedure TOilVarForm.cbDogPostCondFromWhomClick(Sender: TObject);
begin
  cbDogPostCond.Enabled := not cbDogPostCondFromWhom.Checked;
  cbDogPostCondClick(nil);
end;
//==============================================================================
procedure TOilVarForm.cbTalonCheckReturnClick(Sender: TObject);
begin
  inherited;
  cbTalonDevideAlfaAvias.Enabled := cbTalonCheckReturn.Checked;
  cbTalonDevideAlfaAvias.Checked := cbTalonDevideAlfaAvias.Enabled and cbTalonDevideAlfaAvias.Checked;
end;
//==============================================================================
procedure TOilVarForm.ceDR_OperButtonClick(Sender: TObject);
var
  F: TOperTypeRefForm;
begin
  Application.CreateForm(TOperTypeRefForm, F);
  try
    F.SGrpId := 8;
    F.bbClear.Enabled := false;
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      ceDR_Oper.Tag := F.qId.AsInteger;
      ceDR_Oper.Text := F.qName.AsString;
    end;
  finally
    F.Free;
  end;
end;
//==============================================================================
procedure TOilVarForm.ceDR_OperKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;
//==============================================================================
procedure TOilVarForm.rbDR_RashAddOtherClick(Sender: TObject);
begin
  ceDR_Oper.Enabled := rbDR_RashAddOther.Checked;
  ceDR_Oper.Color := decode([ceDR_Oper.Enabled, true, clWindow, clScrollBar]);

  if rbDR_RashAddOther.Checked and (ceDR_Oper.Tag = 0) then
  begin
    ceDR_Oper.Tag  := 287;
    ceDR_Oper.Text := GetOperationName(287);
  end;
end;
//==============================================================================
procedure TOilVarForm.eDR_NotLoadLittlePrihKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then key := #0;
end;
//==============================================================================
procedure TOilVarForm.cbDR_NotLoadLittlePrihClick(Sender: TObject);
begin // Не загружать приходы меньше <> литров
  eDR_NotLoadLittlePrih.Enabled := cbDR_NotLoadLittlePrih.Checked;
  eDR_NotLoadLittlePrih.Color := decode([eDR_NotLoadLittlePrih.Enabled, true, clWindow, clScrollBar]);

  if not eDR_NotLoadLittlePrih.Enabled then
    eDR_NotLoadLittlePrih.Text := ''
  else
    if eDR_NotLoadLittlePrih.Text = '' then
      eDR_NotLoadLittlePrih.Text := '0'
end;
//==============================================================================
procedure TOilVarForm.cbDR_GetPriceFromPriceRefClick(Sender: TObject);
begin  //  Цены брать со справочника "Цены на сопутствующий товар"
  eDR_DayPeriodPriceRef.Enabled := cbDR_GetPriceFromPriceRef.Checked;
  eDR_DayPeriodPriceRef.Color := decode([eDR_DayPeriodPriceRef.Enabled, true, clWindow, clScrollBar]);

  if not eDR_DayPeriodPriceRef.Enabled then
    eDR_DayPeriodPriceRef.Text := ''
  else
    if eDR_DayPeriodPriceRef.Text = '' then
      eDR_DayPeriodPriceRef.Text := '0';

  if AdmSettings.Exist('DR_NP_PRICE_DAY') then
    eDR_DayPeriodPriceRef.Text := nvl(AdmSettings.Get('DR_NP_PRICE_DAY'), '');
end;

end.
