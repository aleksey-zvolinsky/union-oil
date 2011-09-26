unit AddOrgRef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, ToolEdit, Db, DBTables,
  Grids, DBGrids, RXDBCtrl, CurrEdit, Menus, RxMemDS, MemDS, DBAccess, Ora,
  AddOrgDop, AddOrgUkr, uCommonForm, uOilQuery, uOilStoredProc, DBGridEh
  {$IFDEF VER150},Variants{$ENDIF};

const
  DEFAULT_ANKETA = '66666666666666';

type
  TAddOrgForm = class(TCommonForm)
    DataSource1: TOraDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    tblRek: TRxMemoryData;
    tblRekRach_chet: TStringField;
    tblRekFace_chet: TStringField;
    tblRekCheck_book: TStringField;
    tblRekMFO: TStringField;
    tblRekID: TFloatField;
    tblRekINST: TFloatField;
    tblRekBank_Inst: TFloatField;
    tblRekId_Bank: TFloatField;
    tblRekDef: TStringField;
    Panel6: TPanel;
    bbCancel: TBitBtn;
    bbOk: TBitBtn;
    Panel7: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label7: TLabel;
    CEParOrg: TComboEdit;
    Label2: TLabel;
    ceOrgType: TComboEdit;
    Label8: TLabel;
    ComboBox2: TComboBox;
    sbClearD_E: TSpeedButton;
    Panel9: TPanel;
    Panel10: TPanel;
    Label3: TLabel;
    edIdNum: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Edit4: TEdit;
    Panel11: TPanel;
    Label6: TLabel;
    RxDBGrid1: TDBGridEh;
    panel12: TPanel;
    pnlAnketa: TPanel;
    lblBlagoText: TLabel;
    lblBlago: TLabel;
    lblRatingText: TLabel;
    lblRating: TLabel;
    Panel14: TPanel;
    cbBlackList: TCheckBox;
    cbBlackListOther: TCheckBox;
    cbSvoy: TCheckBox;
    Panel15: TPanel;
    SpeedButton1: TSpeedButton;
    sbInfo: TSpeedButton;
    lblBlackListOther: TLabel;
    miDelRek: TMenuItem;
    sbFakeIdNum: TSpeedButton;
    qExt: TOilQuery;
    tblRekSTATE: TStringField;
    tblRekRACH_CHET_NDS: TStringField;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Label11: TLabel;
    Label9: TLabel;
    Label18: TLabel;
    Memo1: TMemo;
    Edit6: TEdit;
    DateEdit1: TDateEdit;
    btnUkr: TBitBtn;
    edNameUkr: TEdit;
    Label10: TLabel;
    edAddrUkr: TEdit;
    Label13: TLabel;
    procedure DefineIdNumColor;
    procedure RxDBGrid1EditButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ceOrgTypeButtonClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure CEParOrgButtonClick(Sender: TObject);
    procedure sbClearD_EClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure TestIdNum;
    procedure TestData;
    procedure SaveOrg;
    procedure edBlagKeyPress(Sender: TObject; var Key: Char);
    procedure RefreshOrgRating;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SetBlModes(Sender: TObject);
    procedure sbInfoClick(Sender: TObject);
    procedure cbBlackListClick(Sender: TObject);
    procedure miDelRekClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure tblRekAfterInsert(DataSet: TDataSet);
    procedure sbFakeIdNumClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnUkrClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    FDop: TAddOrgDopForm;
    FUkr: TAddOrgUkrForm;
  public
    OrganId, OrganInst, OrgTypeId: integer;
    OrganName, Anketa, DogovorStartString, OKPO: string;
    ParOrgId, ParOrgInst: Variant;
    InsideTransaction, Preparing: Boolean;
  end;

function EditUrFace(OrgId, OrgInst: integer): TModalResult;
function AddUrFace(var name: string): TModalResult;

implementation

{$R *.DFM}

uses bankref, Main, oilstd, ChooseOrg, AddFizface, Anketa, ExFunc, uXMLForm,
  UDbFunc, uStart;

//==============================================================================
function AddUrFace(var name: string): TModalResult; // добавление новой организации
var
  F: TAddOrgForm;
begin
  Application.CreateForm(TAddOrgForm, F);
  F.ComboBox2.Items.Clear;
  F.ComboBox2.Items.Add(TranslateText('Юридическое лицо'));
  F.ComboBox2.Items.Add(TranslateText('Не определен'));
  F.ComboBox2.ItemIndex := 0;
  F.OrgTypeId := 1;
  F.DateEdit1.Date := Date;
  F.ceOrgType.Text := TranslateText('Покупатель');
  F.Anketa := DEFAULT_ANKETA;
  F.RefreshOrgRating;
  F.OrganId := 0;
  F.OrganInst := Main.INST;
  F.lblBlackListOther.Enabled := FALSE;
  F.sbInfo.Enabled := FALSE;
  F.Preparing := FALSE;
  F.OKPO := '';
  result := F.ShowModal;
  name := F.Edit1.Text;
  F.free;
end;
//==============================================================================
function EditUrFace(OrgId, OrgInst: integer): TModalResult; // редактирование организации
var
  F: TAddOrgForm;
  qRek: TOilQuery;
begin
  Application.CreateForm(TAddOrgForm, F);
  if F.qExt.Active then F.qExt.Close;
  F.qExt.ParamByName('id').AsInteger := OrgId;
  F.qExt.ParamByName('inst').AsInteger := OrgInst;
  _OpenQueryOra(F.qExt);

  F.OrganId := OrgId;
  F.OrganInst := OrgInst;
  F.miDelRek.Enabled := (OrgId <> OrgInst);

  with F do
  begin
    edit1.text := qExt.fieldbyname('name').asstring;
    FUkr.edFullName.Text := qExt.fieldbyname('full_name').AsString;
    edit6.text := qExt.fieldbyname('phone').asstring;
    orgtypeid := trunc(qExt.fieldbyname('org_id').asinteger);
    ceOrgType.text := qExt.fieldbyname('org_type').asstring;
    if qExt.fieldbyname('face').asinteger = 1 then combobox2.ItemIndex := 0
    else combobox2.ItemIndex := qExt.fieldbyname('face').asinteger;
    dateedit1.Date := qExt.fieldbyname('start_date').asdatetime;
    ParOrgId := qExt.fieldbyname('par').Value;
    ParOrgInst := qExt.fieldbyname('par_inst').Value;
    if not VarIsNull(ParOrgId) then
      CEParOrg.Text := GetOrgName(ParOrgId, ParOrgInst);
    Anketa := qExt.fieldbyname('anketa').AsString;

    if OrgId = OrgInst then CEParOrg.enabled := false
    else CEParOrg.enabled := true;
    if qExt.FieldByName('fake_id_num').IsNull then
      edIdNum.text := qExt.fieldbyname('id_num').asString
    else edIdNum.text := qExt.fieldbyname('fake_id_num').asString;
    OKPO := edIdNum.Text;
    sbFakeIdNum.Down := not qExt.FieldByName('fake_id_num').IsNull;
    edit3.text := qExt.fieldbyname('nal_num').asstring;
    edit4.text := qExt.fieldbyname('svid_num').asstring;
    memo1.text := qExt.fieldbyname('addr').asstring;
    FUkr.edRealAddr.text := qExt.FieldByName('real_address').AsString;
    FDop.eBOSS.text := qExt.fieldbyname('boss').asstring;
    FDop.eBOSS_TEL_H.text := qExt.fieldbyname('boss_tel_h').asstring;
    FDop.eBOSS_TEL_W.text := qExt.fieldbyname('boss_tel_w').asstring;
    FDop.eMailMan.text := qExt.fieldbyname('e_mail').asstring;

    FDop.eGBUH.text := qExt.fieldbyname('gbuh').asstring;
    FDop.eGBUH_TEL_H.text := qExt.fieldbyname('gbuh_tel_h').asstring;
    FDop.eGBUH_TEL_W.text := qExt.fieldbyname('gbuh_tel_w').asstring;

    FDop.ePERSON.Text := qExt.FieldByName('PERSON').AsString;
    FDop.ePERSON_TEL_H.Text := qExt.FieldByName('PERSON_TEL_H').AsString;
    FDop.eICQ.Text := qExt.FieldByName('ICQ').AsString;
    FDop.eWEBSITE.Text := qExt.FieldByName('WEBSITE').AsString;

    FDop.eMail.Text := qExt.FieldByName('mail').AsString;
    FDop.ePass.Text := qExt.FieldByName('pass').AsString;

    FDop.eShortName.Text := qext.FieldByname('ShortName').AsString;
    FDop.gbShrotName.Visible := PVL_EXISTS = true;  //Для Перевалки: скор.назва орг-ції для автоматичного найменування партій.

    if not qExt.FieldByName('dogovor').IsNull then
      FUkr.edDogovor.Text := qExt.FieldByName('dogovor').AsString;
    FUkr.edThrough.Text := F.qExt.FieldByName('rn_through').AsString;

    if OrganId = OrganInst then
    begin
      pnlAnketa.Visible := FALSE;
      if orgtypeid <> 8 then
      begin
        edIdNum.Enabled := false;
        Edit3.Enabled := false;
        Edit4.Enabled := false;
        Edit6.Enabled := false;
        Memo1.Enabled := false;
        RxDBGrid1.Enabled := true;
        RxDBGrid1.Options := RxDBGrid1.Options + [dgRowSelect];
        RxDBGrid1.Options := RxDBGrid1.Options - [dgEditing];
        ComboBox2.Enabled := false;
        DateEdit1.Enabled := false;
      end;
      Edit1.Enabled := false;
      ceOrgType.Enabled := false;
      CEParOrg.Enabled := false;
    end
    else
    begin
      if length(Anketa) <> 14 then Anketa := DEFAULT_ANKETA;
      RefreshOrgRating;
    end;
    qRek := TOilQuery.Create(nil);
    qRek.Session := frmStart.OraSession1;
    qRek.close;
    qRek.sql.Text := ('select * from v_oil_rekvizit where id_org=' + inttostr(OrganId) + ' and inst=' + inttostr(OrganInst));
    _OpenQueryOra(qRek);
    tblRek.EmptyTable;
    while not qRek.eof do
    begin
      tblRek.Insert;
      tblRekid.asinteger := qRek.fieldbyname('id').value;
      tblRekinst.asinteger := qRek.fieldbyname('inst').value;
      tblRekmfo.asstring := qRek.fieldbyname('mfo').asstring;
      tblRekrach_chet.asstring := qRek.fieldbyname('rach_chet').asstring;
      tblRekrach_chet_Nds.asstring := qRek.fieldbyname('rach_chet_nds').asstring;
      tblRekface_chet.asstring := qRek.fieldbyname('face_chet').asstring;
      tblRekcheck_book.asstring := qRek.fieldbyname('check_bok').asstring;
      tblRekid_bank.value := qRek.fieldbyname('id_bank').value;
      tblRekbank_inst.value := qRek.fieldbyname('bank_inst').value;
      if qRek.FieldByName('def').AsInteger = 1 then tblRekdef.AsString := '*'
      else tblRekdef.AsString := '';
      tblRekState.AsString := 'Y';
      tblRek.Post;
      qRek.next;
    end;
    qRek.Free;

    cbBlackListOther.Checked := (qExt.FieldByName('black_there').AsString = 'Y');
    cbBlackList.Checked := (qExt.FieldByName('black_here').AsString = 'Y');
    cbSvoy.Checked := (qExt.FieldByName('Svoy').AsString = 'Y') and not cbBlackList.Checked;
    Preparing := FALSE;

    FDop.clcDebDays.AsInteger := qExt.FieldByName('deb_days_allowed').AsInteger;
    FDop.clcDebSumm.AsInteger := qExt.FieldByName('deb_summa_allowed').AsInteger;
    FUkr.edAktSverki.Text := qExt.FieldByName('akt_sverki').AsString;
    FUkr.ePost.Text := qExt.FieldByName('boss_post_rus').AsString;

    edNameUkr.Text := qExt.FieldByName('name_ukr').AsString;
    FUkr.edFullNameUkr.Text := qExt.FieldByName('full_name_ukr').AsString;
    edAddrUkr.Text := qExt.FieldByName('addr_ukr').AsString;
    FUkr.edRealAddrUkr.Text := qExt.FieldByName('real_address_ukr').AsString;
    FUkr.edDogovorUkr.Text := qExt.FieldByName('dogovor_ukr').AsString;
    FUkr.edThroughUkr.Text := qExt.FieldByName('rn_through_ukr').AsString;
    FUkr.edAktSverkiUkr.Text := qExt.FieldByName('akt_sverki_ukr').AsString;
    FUkr.ePostUkr.Text := qExt.FieldByName('boss_post_ukr').AsString;
    SetBlModes(nil);
  end;
  result := F.ShowModal;
  F.Free;
end;
//==============================================================================
procedure TAddOrgForm.SetBlModes(Sender: TObject);
begin
  cbSvoy.Enabled := not (cbBlackList.Checked or CBBlackListOther.Checked);
  cbBlackList.Enabled := not (cbSvoy.Checked or (OrgTypeId in [3, 4, 8]));
  sbInfo.Enabled := cbBlackListOther.Checked;
  lblBlackListOther.Enabled := sbInfo.Enabled;
  edIdNum.Enabled := not cbBlackList.Checked;
end;
//==============================================================================
procedure TAddOrgForm.RxDBGrid1EditButtonClick(Sender: TObject);
var
  Bankref: TBankRefForm;
begin
  Application.CreateForm(TBankrefForm, BankRef);
  if Bankref.ShowModal = mrOk then
  begin
    tblRek.edit;
    tblRekmfo.Value := BankRef.q['mfo'];
    tblRekbank_inst.asinteger := BankRef.q['inst'];
    tblRekid_bank.asinteger := bankref.q['id'];
    tblRek.Post;
  end;
end;
//==============================================================================
procedure TAddOrgForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then Action := caFree;
  FDop.Free;
  FUkr.Free;
end;
//==============================================================================
procedure TAddOrgForm.RefreshOrgRating;
begin
  lblBlago.Caption := GetOrgKategory(Anketa);
  if lblBlago.Caption <> '' then lblRating.Caption := FloatToStr(GetOrgRating(Anketa))
  else lblRating.Caption := '';
end;
//==============================================================================
procedure TAddOrgForm.FormCreate(Sender: TObject);
begin
  inherited;
  FDop := TAddOrgDopForm.Create(Application);
  FUkr := TAddOrgUkrForm.Create(Application);
  Preparing := TRUE;
  InsideTransaction := frmStart.OraSession1.InTransaction;
  tblRek.Active := false;
  tblRek.EmptyTable;
  tblRek.Active := True;
  DogovorStartString := FUkr.edDogovor.Text;
  ParOrgId := null;
  ParOrgInst := null;
end;
//==============================================================================
procedure TAddOrgForm.ceOrgTypeButtonClick(Sender: TObject);
begin
  XMLChoose('OrgTypeRef', ceOrgType);
  OrgTypeId := ceOrgType.Tag;
  if not (OrgTypeId in [1, 2, 11]) then
  begin
    OrgTypeId := 0;
    ceOrgType.Tag := 0;
    ceOrgType.Text := '';
    ShowMessage(TranslateText('Нельзя заносить организации этого типа. Допускаются типы: "Покупатель", "Продавец" и "Прочие"'));
  end;
end;
//==============================================================================
procedure TAddOrgForm.TestIdNum;
begin
  // если номер фиктивный, то никаких проверок не надо
  if sbFakeIdNum.Down then exit;

  if not (length(trim(edIdNum.Text)) in [0, 8, 10]) then
    raise exception.create(TranslateText('Длина идентификационного кода должна быть равна 8 (для организаций) или 10 (для ЧП)'));

  // если не разрешено вводить дупликаты ОКПО, то проверяем
  if (OrganId <> OrganInst) and (ReadOilVar('OKPO_DUPLICATES') <> 'Y') and (edIdNum.Text <> '') then
  begin
    if not TestDuplicateIdNum(edIdNum.Text, OrganId, OrganInst) then
      raise exception.create(TranslateText('организации с таким кодом ОКПО существуют!!!'));
  end;
end;
//==============================================================================
procedure TAddOrgForm.TestData;
begin
  if edIdNum.Text <> OKPO then TestIdNum;
  if edit1.text = '' then
    raise Exception.Create(TranslateText('Ошибка : Не установлено название организации'));

  if OrgTypeid = -1 then
    raise Exception.Create(TranslateText('Ошибка : Не определен тип организации'));

  tblRek.First;
  while not tblRek.Eof do
  begin
    if tblRekId_Bank.IsNull then
      raise Exception.Create(TranslateText('В одном из реквизитов не указан банк'));
    tblRek.Next;
  end;

  if cbBlackList.Checked and (length(trim(edIdNum.Text)) <> 8) then
    raise Exception.Create(TranslateText('Вносить в "черный список" можно только клиентов с корректно указанным ОКПО'));

  if((FDop.eMail.text<>'') and (FDop.ePass.text<>''))then
    if( 0 < getSqlValueParSimple('select count(*) from oil_org_det where state=''Y'' and mail=:mail and pass=:pass and org_id!=:org_id and inst!=:org_inst',
          ['mail',     FDop.eMail.text,
           'pass',     FDop.ePass.text,
           'org_id',   OrganId,
           'org_inst', OrganInst])) then
    raise Exception.Create(TranslateText('Такое сочитание логин(e-mail)/пароль уже существует!'));

  if FDop.gbShrotName.Visible then
  begin
    if (FDop.eShortName.Text <> '') and (FDop.eShortName.Text <> '---') then
      if (0 < GetSQLValueParSimple('select count(*) from oil_org_det where state = ''Y'' ' +
        'and shortname = upper(:shortname) and org_id != :org_id', ['shortname', FDop.eShortName.Text, 'org_id', OrganId])
        ) then
        raise Exception.Create(TranslateText('Такое сокращенное название уже существует!'));
  end;
end;
//==============================================================================
procedure TAddOrgForm.SaveOrg;
var
  Dogovor: string;
  OrgDetId, OrgDet2Id, RekInst, Face, Def: integer;
  IdNum, FakeIdNum: Variant;
begin
  StartSqlOra(InsideTransaction, 'addorg');
  try
    if trim(FUkr.edDogovor.Text) <> DogovorStartString then
      Dogovor := FUkr.edDogovor.Text
    else Dogovor := '';

    if ComboBox2.ItemIndex = 1 then Face := 2
    else Face := 0;

    if sbFakeIdNum.Down then
    begin
      IdNum := null;
      FakeIdNum := edIdNum.Text;
    end
    else
    begin
      IdNum := edIdNum.Text;
      FakeIdNum := null;
    end;

    OrganId := DBSaver.SaveRecord('OIL_ORG',
      ['ID',                        OrganId,
       'STATE',                     'Y',
       'INST',                      OrganInst,
       'NAME',                      Edit1.Text,
       'PAR',                       decode([ParOrgId,0,null]),
       'PAR_INST',                  decode([ParOrgInst,0,null]),
       'ID_NUM',                    IdNum,
       'NAL_NUM',                   Edit3.Text,
       'SVID_NUM',                  Edit4.Text,
       'ORG_TYPE',                  OrgTypeId,
       'ADDR',                      Memo1.Text,
       'DATE_BEGIN',                DateEdit1.Date,
       'PHONE',                     Edit6.Text,
       'E_MAIL',                    FDop.eMailMan.Text,
       'BOSS',                      FDop.eBOSS.Text,
       'BOSS_TEL_H',                FDop.eBOSS_TEL_H.Text,
       'BOSS_TEL_W',                FDop.eBOSS_TEL_W.Text,
       'GBUH',                      FDop.eGBUH.Text,
       'GBUH_TEL_H',                FDop.eGBUH_TEL_H.Text,
       'GBUH_TEL_W',                FDop.eGBUH_TEL_W.Text,
       'ANKETA',                    Anketa,
       'DOGOVOR',                   Dogovor,
       'FACE',                      Face,
       'NAME_UKR',                  edNameUkr.Text,
       'ADDR_UKR',                  edAddrUkr.Text,
       'DOGOVOR_UKR',               FUkr.edDogovorUkr.Text,
       'BOSS_POST',                 FUkr.ePost.Text,
       'BOSS_POST_UKR',             FUkr.ePostUkr.Text,
       'PERSON',                    FDop.ePERSON.Text,
       'PERSON_TEL_H',              FDop.ePERSON_TEL_H.Text
      ]);

    // Реквизиты
    tblRek.First;
    while not tblRek.Eof do
    begin
      if tblRekInst.IsNull then RekInst := MAIN_ORG.INST
      else RekInst := tblRekInst.AsInteger;

      if tblRekDef.AsString = '*' then Def := 1
      else Def := 0;

      DBSaver.SaveRecord('OIL_ORG_REKVIZIT',
        ['ID',                    tblRekId.AsInteger,
         'STATE',                 tblRekState.Value,
         'INST',                  RekInst,
         'ID_ORG',                OrganId,
         'RACH_CHET',             tblRekRach_Chet.Value,
         'RACH_CHET_NDS',         tblRekRach_Chet_NDS.Value,
         'FACE_CHET',             tblRekFace_Chet.Value,
         'CHECK_BOK',             tblRekCheck_Book.Value,
         'ID_BANK',               tblRekId_Bank.Value,
         'BANK_INST',             tblRekBank_Inst.Value,
         'DEF',                   Def
        ]);
      tblRek.next;
    end;

    // запись в OIL_ORG_DET
    if qExt.Active and not qExt.FieldByName('ORG_DET_ID').IsNull
      or cbSvoy.Checked or (FUkr.edFullName.Text <> '') or (FUkr.edRealAddr.Text <> '') or (FUkr.edThrough.Text <> '')
      or (FUkr.edFullNameUkr.Text <> '') or (FUkr.edRealAddrUkr.Text <> '') or (FUkr.edThroughUkr.Text <> '')
      or (FDop.eMail.Text <> '') or (FDop.ePass.Text <> '') or (FDop.ePERSON.Text <> '') or (FDop.eICQ.Text <> '')
      or (FDop.ePERSON_TEL_H.Text <> '') or (FDop.eWEBSITE.Text <> '') or (FDop.eShortName.Text <> '') then
    begin
      if qExt.Active and not qExt.FieldByName('ORG_DET_ID').IsNull then
        OrgDetId := qExt.FieldByName('ORG_DET_ID').AsInteger
      else OrgDetId := 0;

      DBSaver.SaveRecord('OIL_ORG_DET',
        ['ID',               OrgDetId,
         'STATE',            'Y',
         'INST',             OrganInst,
         'ORG_ID',           OrganId,
         'SVOY',             BoolTo_(cbSvoy.Checked,'Y','N'),
         'FULL_NAME',        FUkr.edFullName.Text,
         'REAL_ADDRESS',     FUkr.edRealAddr.Text,
         'RN_THROUGH',       FUkr.edThrough.Text,
         'FULL_NAME_UKR',    FUkr.edFullNameUkr.Text,
         'REAL_ADDRESS_UKR', FUkr.edRealAddrUkr.Text,
         'RN_THROUGH_UKR',   FUkr.edThroughUkr.Text,
         'MAIL',             FDop.eMail.Text,
         'PASS',             FDop.ePass.Text,
         'ICQ',              FDop.eICQ.Text,
         'WEBSITE',          FDop.eWEBSITE.Text,
         'SHORTNAME',        AnsiUpperCase(FDop.eShortName.Text)
        ]);
    end;

    // запись в OIL_ORG_DET2
    if sbFakeIdNum.Down or (FDop.clcDebDays.AsInteger <> 0) or (FDop.clcDebSumm.AsInteger <> 0)
      or (FUkr.edAktSverki.Text <> '') or (FUkr.edAktSverkiUkr.Text <> '')
      or qExt.Active and not qExt.FieldByName('det2_id').IsNull then
    begin
      if qExt.Active and not qExt.FieldByName('det2_id').IsNull then
        OrgDet2Id := qExt.FieldByName('Det2_Id').AsInteger
      else OrgDet2Id := 0;

      DBSaver.SaveRecord('OIL_ORG_DET2',
        ['ID',                          OrgDet2Id,
         'STATE',                       'Y',
         'INST',                        MAIN_ORG.INST,
         'ORG_ID',                      OrganId,
         'ORG_INST',                    OrganInst,
         'FAKE_ID_NUM',                 FakeIdNum,
         'DEB_DAYS_ALLOWED',            FDop.clcDebDays.AsInteger,
         'DEB_SUMMA_ALLOWED',           FDop.clcDebSumm.AsInteger,
         'AKT_SVERKI',                  FUkr.edAktSverki.Text,
         'AKT_SVERKI_UKR',              FUkr.edAktSverkiUkr.Text
        ]);
    end;

    // Черный список
    if cbBlackList.Checked or qExt.Active and (qExt.FieldByName('black_here').AsString = 'Y') then
    begin
      _ExecProcOra('SAVE_BLACK_LIST',
        ['p_Okpo',  IdNum,
         'p_State', BoolTo_(cbBlackList.Checked, 'Y', 'N')]);
    end;
    CommitSQLOra(InsideTransaction);
  except on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOk], 0);
      RollbackSqlOra(InsideTransaction, 'addorg');
    end;
  end;
end;
//==============================================================================
procedure TAddOrgForm.bbOkClick(Sender: TObject);
begin
  TestData;
  try
    SaveOrg;
    ModalResult := mrOk;
  except on E: Exception do
    MessageDlg(TranslateText('Ошибка : ') + E.message, mtError, [mbOk], 0);
  end;
end;
//==============================================================================
procedure TAddOrgForm.bbCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;
//==============================================================================
procedure TAddOrgForm.CEParOrgButtonClick(Sender: TObject);
var
  vName: string;
  pId, pInst: integer;
begin
  if CaptureOrg(1, Main.INST, Main.INST, 'yyy', pId, pInst, vName) then
  begin
    CEParOrg.Text := vName;
    ParOrgId := pId; ParOrgInst := pInst;
  end;
end;
//==============================================================================
procedure TAddOrgForm.sbClearD_EClick(Sender: TObject);
begin
  ParOrgId := 0;
  ParOrgInst := 0;
  CEParOrg.Text := TranslateText('Нет');
end;
//==============================================================================
procedure TAddOrgForm.N1Click(Sender: TObject);
var
  BM: TBookMark;
begin
  BM := tblRek.GetBookmark;
  tblRek.First;
  while not tblRek.Eof do
  begin
    tblRek.Edit;
    tblRek.FieldByName('def').AsString := '';
    tblRek.Post;
    tblRek.Next;
  end;
  tblRek.GotoBookmark(BM);
  tblRek.Edit;
  tblRek.FieldByName('def').AsString := '*';
  tblRek.FreeBookmark(BM);
  tblRek.Post;
end;
//==============================================================================
procedure TAddOrgForm.ComboBox2Change(Sender: TObject);
begin
  if (ComboBox2.Text = TranslateText('Физическое лицо')) then ModalResult := mrRetry;
end;
//==============================================================================
procedure TAddOrgForm.edBlagKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;
//==============================================================================
procedure TAddOrgForm.SpeedButton1Click(Sender: TObject);
begin
  if MakeAnketing(Edit1.Text, 1, Anketa, Anketa) then RefreshOrgRating;
end;
//==============================================================================
procedure TAddOrgForm.sbInfoClick(Sender: TObject);
begin
  if qExt.FieldByName('black_list_count').AsInteger > 0 then
  begin
    ShowMessage(TranslateText('Данная организация занесена в "черный список" в следующих подразделениях: ') + #13#10 +
      '------------------------------------------------------------------------' + #13#10 +
      GetBlackPodrList(qExt.FieldByName('id_num').AsString, TRUE));
  end;
end;
//==============================================================================
procedure TAddOrgForm.cbBlackListClick(Sender: TObject);
begin
  if Preparing then exit;
  if cbBlackList.Checked and (length(trim(edIdNum.Text)) <> 8) then
  begin
    MessageDlg(TranslateText('Вносить в "черный список" можно только клиентов с корректно указанным ОКПО'), mtError, [mbOk], 0);
    cbBlackList.Checked := FALSE;
  end
  else
    if cbBlackListOther.Checked and cbBlackList.Checked then
    begin
      if MessageDlg(TranslateText('Внимание!!! Данные клиент уже занесен в "черный список" другими подразделениями!') + #13#10 +
        TranslateText('Вы должны заносить его только в случае если сами можете подтвердить его неплатежеспособность.') + #13#10 +
        TranslateText('Вы подтверждаете занесение?'),
        mtWarning, [mbYes, mbNo], 0) = mrYes then
        SetBlModes(Sender)
      else cbBlackList.Checked := FALSE;
    end
    else SetBlModes(Sender);
end;
//==============================================================================
procedure TAddOrgForm.miDelRekClick(Sender: TObject);
begin
  if tblRek.IsEmpty then exit;
  if tblRekState.AsString = 'Y' then
  begin
    if MessageDlg(TranslateText('Вы уверены, что хотите удалить этот реквизит?'), mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
      if tblRekId.IsNull then tblRek.Delete
      else
      begin
        if tblRek.State = dsBrowse then tblRek.Edit;
        tblRekState.AsString := 'N';
        tblRek.Post;
      end;
    end
  end
  else
  begin
    if tblRek.State = dsBrowse then tblRek.Edit;
    tblRekState.AsString := 'Y';
    tblRek.Post;
  end;
end;
//==============================================================================
procedure TAddOrgForm.PopupMenu1Popup(Sender: TObject);
begin
  if not tblRek.IsEmpty then
    if tblRekState.AsString = 'N' then miDelRek.Caption := TranslateText('Отменить удаление')
    else miDelRek.Caption := TranslateText('Удалить реквизит');
end;
//==============================================================================
procedure TAddOrgForm.tblRekAfterInsert(DataSet: TDataSet);
begin
  tblRekState.AsString := 'Y';
end;
//==============================================================================
procedure TAddOrgForm.sbFakeIdNumClick(Sender: TObject);
begin
  DefineFakeIdNumHint(Sender as TSpeedButton);
  DefineIdNumColor;
end;
//==============================================================================
procedure TAddOrgForm.DefineIdNumColor;
begin
  if sbFakeIdNum.Down then edIdNum.Font.Color := clBlue
  else edIdNum.Font.Color := clBlack;
end;
//==============================================================================
procedure TAddOrgForm.FormShow(Sender: TObject);
begin
  DefineFakeIdNumHint(sbFakeIdNum);
  DefineIdNumColor;
end;
//==============================================================================
procedure TAddOrgForm.BitBtn1Click(Sender: TObject);
begin
  FDop.ShowModal;
end;
//==============================================================================
procedure TAddOrgForm.btnUkrClick(Sender: TObject);
begin
  inherited;
  FUkr.ShowModal;
end;
//==============================================================================
procedure TAddOrgForm.RxDBGrid1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if tblRekState.AsString = 'N' then AFont.Style := AFont.Style + [fsStrikeOut]
  else AFont.Style := AFont.Style - [fsStrikeOut];
end;
//==============================================================================

end.
