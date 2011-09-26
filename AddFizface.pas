unit AddFizface;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Ora,
  Db, DBTables, StdCtrls, Buttons, Mask, ToolEdit, ExtCtrls, MemDS, DBAccess,
  uCommonForm, uOilQuery, uOilStoredProc{$IFDEF VER150},Variants{$ENDIF};

type
  TAddFizfaceForm = class(TCommonForm)
    p1: TPanel;
    p2: TPanel;
    edFIO: TEdit;
    l5: TLabel;
    l6: TLabel;
    DEBegin: TDateEdit;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    GroupBox1: TGroupBox;
    edSer: TEdit;
    l7: TLabel;
    l8: TLabel;
    l9: TLabel;
    l10: TLabel;
    edWhom: TEdit;
    DEWhen: TDateEdit;
    l11: TLabel;
    l4: TLabel;
    l1: TLabel;
    edAddress: TEdit;
    edPhone: TEdit;
    CEType: TComboEdit;
    l14: TLabel;
    edNum: TEdit;
    edIdNum: TEdit;
    CBFace: TComboBox;
    cbSvoy: TCheckBox;
    sbFakeIdNum: TSpeedButton;
    gbWebService: TGroupBox;
    LblMail: TLabel;
    LblPass: TLabel;
    eMail: TEdit;
    ePass: TEdit;
    qOrg: TOilQuery;
    eMailMan: TEdit;
    l3: TLabel;
    eICQ: TEdit;
    l2: TLabel;
    l12: TLabel;
    edAddressReal: TEdit;
    l13: TLabel;
    procedure bbOkClick(Sender: TObject);
    procedure CETypeButtonClick(Sender: TObject);
    procedure CBFaceChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbFakeIdNumClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure FillFields(id, inst: integer);
    procedure SaveChanges;
    procedure Test;
    procedure DefineIdNumColor;
    procedure ActivateQ(AId, AInst: integer);
  public
    InsideTransaction: Boolean;
  end;

var
  AddFizfaceForm: TAddFizfaceForm;

function EditFizface(id, inst: integer; var name: string): TModalResult;
procedure DefineFakeIdNumHint(p_Sb: TSpeedButton);

implementation

uses ExFunc, UDBFunc, Main, OilStd, uStart, uXMLForm;

var Org_id, Org_inst, Org_Type: integer;

{$R *.DFM}

//==============================================================================
procedure DefineFakeIdNumHint(p_Sb: TSpeedButton);
begin
  if p_Sb.Down then
    p_Sb.Hint := TranslateText('Сделать идентификационный код') + #13#10 +
      TranslateText('реальным и отображаемым в документах"')
  else
    p_Sb.Hint := TranslateText('Сделать идентификационный код "фиктивным",') + #13#10 +
      TranslateText('только для синхронизации с 1С и ') + #13#10 + TranslateText('не отображаемым в документах');
end;
//==============================================================================
procedure TAddFizFaceForm.DefineIdNumColor;
begin
  if sbFakeIdNum.Down then edIdNum.Font.Color := clBlue
  else edIdNum.Font.Color := clBlack;
end;
//==============================================================================
procedure TAddFizfaceForm.ActivateQ(AId, AInst: integer);
begin
  qOrg.Close;
  _OpenQueryPar(qOrg,
    ['id',   AId,
     'inst', AInst]);
end;
//==============================================================================
procedure TAddFizfaceForm.FillFields(id, inst: integer);
begin
  ActivateQ(id, inst);
  edFIO.Text := qOrg.FieldByName('name').AsString;
  if not VarIsNull(qOrg.FieldByName('date_begin').Value) then
    DEBegin.Date := qOrg.FieldByName('date_begin').Value;
  if not qOrg.FieldByName('id_num').IsNull or qOrg.FieldByName('fake_id_num').IsNull then
  begin
    edIdNum.Text := qOrg.FieldByName('id_num').AsString;
    sbFakeIdNum.Down := FALSE;
  end
  else
  begin
    edIdNum.Text := qOrg.FieldByName('fake_id_num').AsString;
    sbFakeIdNum.Down := TRUE;
  end;
  CEType.Text := GetOrgTypeName(qOrg.FieldByName('org_type').AsInteger);
  Org_Type := qOrg.FieldByName('org_type').AsInteger;
  edSer.Text := qOrg.FieldByName('passport_ser').AsString;
  edNum.Text := qOrg.FieldByName('passport_num').AsString;
  edWhom.Text := qOrg.FieldByName('passport_whom').AsString;
  if not VarIsNull(qOrg.FieldByName('passport_when').Value) then
    DEWhen.Date := qOrg.FieldByName('passport_when').Value;
  edAddress.Text := qOrg.FieldByName('addr').AsString;
  edPhone.Text := qOrg.FieldByName('phone').AsString;
  cbSvoy.Checked := (qOrg.FieldByName('svoy').AsString = 'Y');
  eMail.text := qOrg.FieldByName('mail').AsString;
  ePass.text := qOrg.FieldByName('pass').AsString;
  eICQ.Text := qOrg.FieldByName('ICQ').AsString;
  edAddressReal.Text := qOrg.FieldByName('REAL_ADDRESS').AsString;
  eMailMan.Text := qOrg.FieldByName('E_MAIL').AsString;
end;
//==============================================================================
procedure TAddFizfaceForm.Test;
  //****************************************************************************
  function CheckSer: Boolean;
  var
    i: integer;
  begin
    result := TRUE;
    for i := 1 to 2 do
      if not IsSymbol(edSer.Text[i], 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ') then // *NO_TRANSLATE*
        result := FALSE;
  end;
  //****************************************************************************
begin
  if trim(edFIO.Text) = '' then raise Exception.Create(TranslateText('Не указан ФИО'));
  if sbFakeIdNum.Down then
  begin
    if (trim(edIdNum.Text) <> '') and not StringIsNumber(edIdNum.Text) then
      raise Exception.Create(TranslateText('Идентификационный код должен состоять только из цифр'));
  end
  else
  begin
    if (trim(edIdNum.Text) <> '') and not StringIsNumber(edIdNum.Text, 10) then
      raise Exception.Create(TranslateText('Идентификационный код должен состоять из 10 цифр'));
  end;
  // если не разрешено вводить дупликаты ОКПО, то проверяем
  if (ReadOilVar('OKPO_DUPLICATES') <> 'Y') and (edIdNum.Text <> '') then
  begin
    if not TestDuplicateIdNum(edIdNum.Text, Org_Id, Org_Inst) then
      raise exception.create(TranslateText('организации с таким кодом ОКПО существуют!!!'));
  end;

  if (trim(edSer.Text) = '') and (trim(edNum.Text) <> '') then
    raise Exception.Create(TranslateText('Указан номер паспорта, но не указана серия'));
  if (trim(edSer.Text) <> '') then
  begin
    if not CheckSer then
      raise Exception.Create(TranslateText('Серия паспорта должна состоять из русских больших букв'));
    if not StringIsNumber(edNum.Text, 6) then
      raise Exception.Create(TranslateText('Номер паспорта должен состоять из шести цифр'));
  end;
end;
//==============================================================================
function EditFizface(id, inst: integer; var name: string): TModalResult;
var
  F: TAddFizfaceForm;
begin
  Application.CreateForm(TAddFizfaceForm, F);
  try
    if (id <> 0) or (inst <> 0) then
    begin
      F.FillFields(id, inst);
      Org_Id := id;
      Org_Inst := inst;
    end
    else
    begin
      F.DEBegin.Date := Date;
      Org_Id := 0;
      Org_Inst := MAIN_ORG.INST;
      Org_Type := 1;
      F.CEType.Text := TranslateText('Покупатель');
      F.CBFace.Enabled := FALSE;
    end;
    result := F.ShowModal;
    name := F.edFIO.Text;
  finally
    F.Free;
  end;
end;
//==============================================================================
procedure TAddFizfaceForm.SaveChanges;
var
  s, IdNum, FakeIdNum: string;
  id: integer;
begin
  StartSQLOra(InsideTransaction, 'addorg');
  try
    if sbFakeIdNum.Down then
    begin
      IdNum := '';
      FakeIdNum := edIdNum.Text;
    end
    else
    begin
      IdNum := edIdNum.Text;
      FakeIdNum := '';
    end;

    if Org_Id = 0 then
      Org_Id := GetSeqNextVal('S_OIL_ORG');

    // запись в OIL_ORG
    Org_Id := DBSaver.SaveRecord('OIL_ORG',
      ['ID',            Org_Id,
       'STATE',         'Y',
       'INST',          Org_Inst,
       'NAME',          edFIO.Text,
       'FACE',          1,
       'DATE_BEGIN',    deBegin.Date,
       'ORG_TYPE',      Org_Type,
       'ID_NUM',        IdNum,
       'PASSPORT_SER',  edSer.Text,
       'PASSPORT_NUM',  edNum.Text,
       'PASSPORT_WHOM', edWhom.Text,
       'PASSPORT_WHEN', deWhen.Date,
       'ADDR',          edAddress.Text,
       'PHONE',         edPhone.Text,
       'E_MAIL',        eMailMan.Text]);

    // запись в OIL_ORG_DET
    if (cbSvoy.Checked) or (not qOrg.FieldByName('det_id').IsNull)
      or (eMail.text <> '') or (ePass.text <> '') then
    begin
      if cbSvoy.Checked then s := 'Y'
      else s := 'N';
      if qOrg.FieldByName('det_id').IsNull then id := GetSeqNextVal('S_OIL_ORG_DET')
      else id := qOrg.FieldByName('det_id').AsInteger;

      DBSaver.SaveRecord('OIL_ORG_DET',
        ['ID',           id,
         'STATE',        'Y',
         'INST',         Org_Inst,
         'ORG_ID',       Org_Id,
         'SVOY',         s,
         'MAIL',         eMail.Text,
         'PASS',         ePass.Text,
         'REAL_ADDRESS',  edAddressReal.Text,
         'ICQ',          eICQ.Text]);
    end;

    // запись в OIL_ORG_DET2
    if sbFakeIdNum.Down or not qOrg.FieldByName('det2_id').IsNull then
    begin
      if qOrg.FieldByName('det2_id').IsNull then id := GetSeqNextVal('S_OIL_ORG_DET2')
      else id := qOrg.FieldByName('det2_id').AsInteger;

      DBSaver.SaveRecord('OIL_ORG_DET2',
        ['ID',          id,
         'STATE',       'Y',
         'INST',        MAIN_ORG.INST,
         'ORG_ID',      Org_Id,
         'ORG_INST',    Org_Inst,
         'FAKE_ID_NUM', FakeIdNum]);
    end;

    CommitSQLOra(InsideTransaction);
  except on E: Exception do
    begin
      RollbackSqlOra(InsideTransaction, 'addorg');
      raise Exception.Create(E.Message);
    end;
  end;
end;
//==============================================================================
procedure TAddFizfaceForm.bbOkClick(Sender: TObject);
begin
  Test;
  try
    SaveChanges;
    ModalResult := mrOk;
  except on E: Exception do
    raise Exception.Create(E.Message);
  end;
end;
//==============================================================================
procedure TAddFizfaceForm.CETypeButtonClick(Sender: TObject);
begin
  XMLChoose('OrgTypeRef', CEType);
  Org_Type := CEType.Tag;
  if not (Org_Type in [1, 2, 11]) then
  begin
    Org_Type := 0;
    CEType.Tag := 0;
    CEType.Text := '';
    ShowMessage(TranslateText('Нельзя заносить организации этого типа. Допускаются типы: "Покупатель", "Продавец" и "Прочие"'));
  end;
end;
//==============================================================================
procedure TAddFizfaceForm.CBFaceChange(Sender: TObject);
begin
  if CBFace.ItemIndex <> 1 then ModalResult := mrRetry;
end;
//==============================================================================
procedure TAddFizfaceForm.FormShow(Sender: TObject);
begin
  CBFace.ItemIndex := 1;
  DefineFakeIdNumHint(sbFakeIdNum);
  DefineIdNumColor;
  ActivateQ(Org_Id, Org_Inst);
end;
//==============================================================================
procedure TAddFizfaceForm.sbFakeIdNumClick(Sender: TObject);
begin
  DefineFakeIdNumHint(Sender as TSpeedButton);
  DefineIdNumColor;
end;
//==============================================================================
procedure TAddFizfaceForm.FormCreate(Sender: TObject);
begin
  inherited;
  InsideTransaction := frmStart.OraSession1.InTransaction;
end;
//==============================================================================

end.
