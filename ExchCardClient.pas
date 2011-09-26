unit ExchCardClient;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls, Db, DBTables, uCommonForm,
  MemDS, DBAccess, Ora, DBCtrls, uOilQuery, uOilStoredProc, CheckLst, ExFunc
  {$IFDEF VER150}, StrUtils{$ENDIF};

type
  TExchCardClientForm = class(TCommonForm)
    Panel1: TPanel;
    gbOld: TGroupBox;
    lblOldClient: TLabel;
    Label3: TLabel;
    l4: TLabel;
    l5: TLabel;
    l6: TLabel;
    l7: TLabel;
    l8: TLabel;
    edtOldClient: TComboEdit;
    edtFromOld: TEdit;
    edtIDOld: TEdit;
    edtINSTOld: TEdit;
    edtBindOld: TEdit;
    edtDependOld: TEdit;
    gbNew: TGroupBox;
    lblNewClient: TLabel;
    lNew: TLabel;
    l9: TLabel;
    l10: TLabel;
    l11: TLabel;
    l12: TLabel;
    l13: TLabel;
    edtNewClient: TComboEdit;
    edtFromNew: TEdit;
    edtIDNew: TEdit;
    edtINSTNew: TEdit;
    edtBindNew: TEdit;
    edtDependNew: TEdit;
    qFindClient: TOilQuery;
    Panel2: TPanel;
    l1: TLabel;
    deS: TDateEdit;
    l2: TLabel;
    dePo: TDateEdit;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    cbDate: TCheckBox;
    btnRefreshLink: TBitBtn;
    cbAllCards: TCheckBox;
    eCardNumber: TEdit;
    l3: TLabel;
    cbRefreshLink: TCheckBox;
    procedure edtOldClientButtonClick(Sender: TObject);
    procedure edtNewClientButtonClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure ClearAllFld;
    procedure btnRefreshLinkClick(Sender: TObject);
    procedure cbAllCardsClick(Sender: TObject);
    procedure cbDateClick(Sender: TObject);
    procedure cbRefreshLinkClick(Sender: TObject);
    procedure edtOldClientKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    vId, vInst, PetrolID, PetrolType, iRowsReplaced: Integer;
    vName, sCondition: string;
    function HasPetrolLink(AId, AInst: Integer; var PetrolID, PetrolType: integer): Boolean;
    procedure GetEdit(Ed: TEdit; B: boolean);
  public
  end;

var
  ExchCardClientForm: TExchCardClientForm;

implementation

uses Main, ChooseOrg, uDBFunc, OILStd, PrihCardRef, uExeSql;

{$R *.DFM}

//==============================================================================
procedure TExchCardClientForm.GetEdit(Ed: TEdit; B: boolean); // 0 - Есть, 1 - Нет
begin
  if B then
  begin
    Ed.Font.Color := clBlack;
    Ed.Text := TranslateText('Есть');
    Ed.Tag := 0;
  end
  else
  begin
    Ed.Font.Color := $0003079C;
    Ed.Text := TranslateText('Нет');
    Ed.Tag := 1;
  end;
end;
//==============================================================================
function TExchCardClientForm.HasPetrolLink(AId, AInst: Integer; var PetrolID, PetrolType: integer): Boolean;
begin
  qFindClient.Close;
  qFindClient.MacroByName('card_user').Value := AdmSettings.Get('CARD_USER');
  qFindClient.ParamByName('org_id').AsInteger := AId;
  qFindClient.ParamByName('org_inst').AsInteger := AInst;
  qFindClient.Open;

  PetrolID := qFindClient.FieldByName('petrol_id').AsInteger;
  PetrolType := qFindClient.FieldByName('petrol_type').AsInteger;
  Result := qFindClient.IsEmpty;
end;
//==============================================================================
procedure TExchCardClientForm.edtOldClientButtonClick(Sender: TObject);
begin
  if ChooseOrg.CaptureOrg(3, INST, INST, 'yyy', vId, vInst, vName) then
  begin
    edtOldClient.Text := vName;
    edtFromOld.Text := GetOrgName(vInst, vInst);
    edtIDOld.Text := IntToStr(vId);
    edtINSTOld.Text := IntToStr(vInst);

    if HasPetrolLink(vId, vInst, PetrolID, PetrolType) then
      GetEdit(edtBindOld, false)
    else GetEdit(edtBindOld, true);

    if _RecordCount('CARD_TRANSACTION', 'to_id = '+ IntToStr(vId) +' and to_inst = '+ IntToStr(vInst)) = 0 then
      GetEdit(edtDependOld, false)
    else GetEdit(edtDependOld, true);
  end;
end;
//==============================================================================
procedure TExchCardClientForm.edtNewClientButtonClick(Sender: TObject);
begin
  if ChooseOrg.CaptureOrg(3, INST, INST, 'yyy', vId, vInst, vName) then
  begin
    edtNewClient.Text := vName;
    edtFromNew.Text := GetOrgName(vInst, vInst);
    edtIDNew.Text := IntToStr(vId);
    edtINSTNew.Text := IntToStr(vInst);

    if HasPetrolLink(vId, vInst, PetrolID, PetrolType) then
      GetEdit(edtBindNew, false)
    else GetEdit(edtBindNew, true);

    if _RecordCount('CARD_TRANSACTION', 'to_id = '+ IntToStr(vId) +' and to_inst = '+ IntToStr(vInst)) = 0 then
      GetEdit(edtDependNew, false)
    else GetEdit(edtDependNew, true);
  end;
end;
//==============================================================================
procedure TExchCardClientForm.ClearAllFld;
begin
  edtOldClient.Clear;
  edtFromOld.Clear;
  edtIDOld.Clear;
  edtINSTOld.Clear;
  edtBindOld.Clear;
  edtDependOld.Clear;
  edtNewClient.Clear;
  edtFromNew.Clear;
  edtIDNew.Clear;
  edtINSTNew.Clear;
  edtBindNew.Clear;
  edtDependNew.Clear;
  eCardNumber.Clear;
  cbDate.Checked := false;
end;
//==============================================================================
procedure TExchCardClientForm.bbOkClick(Sender: TObject);
begin
  if (edtIDOld.Text = '') or (edtIDNew.Text = '') then
  begin
    MessageDlg(TranslateText('Не выбран старый и новый клиент!'), mtError, [mbOk], 0);
    Exit;
  end;

  if edtDependOld.Tag = 1 then
  begin
    MessageDlg(TranslateText('Записей со старым клиентом нет!'), mtError, [mbOk], 0);
    Exit;
  end;

  if edtBindNew.Tag = 1 then
  begin
    MessageDlg(TranslateText('Для нового клиента нет привязки!'), mtError, [mbOk], 0);
    Exit;
  end;

  if (eCardNumber.Text = '') and not cbAllCards.Checked then
  begin
    MessageDlg(TranslateText('Не указан номер карточки!'), mtError, [mbOk], 0);
    Exit;
  end;

  if cbDate.Checked and ((deS.Date = 0) or (dePo.Date = 0) or (deS.Date > dePo.Date)) then
  begin
    MessageDlg(TranslateText('Период указан не верно!'), mtError, [mbOk], 0);
    Exit;
  end;

  if MessageDlg(TranslateText('Вы уверены что хотите заменить ')+
    IfThen(cbAllCards.Checked, TranslateText('все карточки '), TranslateText('карточку № ')+ eCardNumber.Text) +' '+
    TranslateText('клиента')+#13#10+ edtOldClient.Text +#13#10+
    '             на'+#13#10+ edtNewClient.Text +' ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
  try
    // формуємо фільтр
    sCondition := 'to_id = '+ edtIDOld.Text +' and to_inst = '+ edtINSTOld.Text +
      IfThen(cbAllCards.Checked, '', ' and gr_card_num = '+ eCardNumber.Text) +
      IfThen(not cbDate.Checked, '', ' and date_ between '''+ DateToStr(deS.Date) +''' and '''+ DateToStr(dePo.Date) +'''');

    // взнаємо кількість записів для редагування
    iRowsReplaced := _RecordCount('CARD_TRANSACTION', sCondition);

    // виконуємо редагування
    StartSQL;
    _ExecSQL('update card_transaction set to_id = '+ edtIDNew.Text +', to_inst = '+ edtINSTNew.Text +' where '+ sCondition);
    CommitSQL;

    // перерахувати рух по всім картам цього клієнта
    RecalcByClient(StrToInt(edtIDNew.Text), StrToInt(edtINSTNew.Text), False);
    ClearAllFld;

    MessageDlg(TranslateText('Количество замен в таблице с транзакциями: ')+ IntToStr(iRowsReplaced), mtInformation, [mbOK], 0);
  except on E: Exception do
    begin
      RollbackSQL;
      MessageDlg(TranslateText('Ошибка: ')+ E.Message +#13#10+
        TranslateText('Возможно, делается полный пересчет.'), mtError, [mbOk], 0);
    end;
  end;
end;
//==============================================================================
procedure TExchCardClientForm.btnRefreshLinkClick(Sender: TObject);
begin
  if edtIDNew.Text = '' then
  begin
    MessageDlg(TranslateText('Укажите клиента Petrol-a'), mtError, [mbOk], 0);
    Exit;
  end;

  if edtBindNew.Tag = 1 then
  begin
    MessageDlg(TranslateText('Клиент не имеет привязки в Petrol-е!'), mtError, [mbOk], 0);
    Exit;
  end;

  if (eCardNumber.Text = '') and not cbAllCards.Checked then
  begin
    MessageDlg(TranslateText('Не указан номер карточки!'), mtError, [mbOk], 0);
    Exit;
  end;

  if cbDate.Checked and ((deS.Date = 0) or (dePo.Date = 0) or (deS.Date > dePo.Date)) then
  begin
    MessageDlg(TranslateText('Период указан не верно!'), mtError, [mbOk], 0);
    Exit;
  end;

  try
    // формуємо фільтр
    HasPetrolLink(vId, vInst, PetrolID, PetrolType);
    sCondition := 'id_klienta = '+ IntToStr(PetrolID) +' and id_prinadl = '+ IntToStr(PetrolType) +
      IfThen(cbAllCards.Checked, '', ' and gr_nomer = '+ eCardNumber.Text) +
      IfThen(not cbDate.Checked, '', ' and data between '''+ DateToStr(deS.Date) +''' and '''+ DateToStr(dePo.Date) +'''') +
      ' and data > to_date(nvl(ov.getval(''CUT_DATE''),''01.01.1990''),''DD.MM.YYYY'') ';

    // взнаємо кількість записів для редагування
    iRowsReplaced := _RecordCount(AdmSettings.Get('CARD_USER') +'.ECFIL139', sCondition);

    // виконуємо редагування
    StartSQL;
    _ExecSQL('update '+ AdmSettings.Get('CARD_USER') +'.ECFIL139 set data = data where '+ sCondition);
    CommitSQL;

    // перерахувати рух по всім картам цього клієнта
    RecalcByClient(StrToInt(edtIDNew.Text), StrToInt(edtINSTNew.Text), False);
    ClearAllFld;

    MessageDlg(TranslateText('Обновление по привязке, прошло успешно!') +#13#10+
      TranslateText('Количество обновленных записей: ')+ IntToStr(iRowsReplaced), mtInformation, [mbOK], 0);
  except on E: Exception do
    begin
      RollbackSQL;
      MessageDlg(TranslateText('Ошибка: ')+ E.Message +#13#10+
        TranslateText('Возможно, делается полный пересчет.'), mtError, [mbOk], 0);
    end;
  end;
end;
//==============================================================================
procedure TExchCardClientForm.cbAllCardsClick(Sender: TObject);
begin
  eCardNumber.Enabled := not cbAllCards.Checked;
  eCardNumber.Color := BoolTo_(cbAllCards.Checked, clSilver, clWindow);

  if cbAllCards.Checked then cbAllCards.Font.Style := [fsBold]
  else cbAllCards.Font.Style := [];
end;
//==============================================================================
procedure TExchCardClientForm.cbDateClick(Sender: TObject);
begin
  deS.Enabled := cbDate.Checked;
  dePo.Enabled := cbDate.Checked;

  deS.Color := BoolTo_(not cbDate.Checked, clSilver, clWindow);
  dePo.Color := deS.Color;

  if cbDate.Checked then cbDate.Font.Style := [fsBold]
  else
  begin
    cbDate.Font.Style := [];
    deS.Clear;
    dePo.Clear;
  end;
end;
//==============================================================================
procedure TExchCardClientForm.cbRefreshLinkClick(Sender: TObject);
begin
  lblNewClient.Caption := BoolTo_(cbRefreshLink.Checked, TranslateText('Клиент'), TranslateText('Новый клиент'));

  btnRefreshLink.Enabled := cbRefreshLink.Checked;
  bbOk.Enabled := not cbRefreshLink.Checked;
  gbOld.Visible := bbOk.Enabled;
  lNew.Visible := bbOk.Enabled;

  if cbRefreshLink.Checked then cbRefreshLink.Font.Style := [fsBold]
  else cbRefreshLink.Font.Style := [];

  ClearAllFld;
end;
//==============================================================================
procedure TExchCardClientForm.edtOldClientKeyPress(Sender: TObject; var Key: Char);
begin
  key := #0;
end;
//==============================================================================
procedure TExchCardClientForm.FormShow(Sender: TObject);
begin
  inherited;
  LoadSQLByForm(TForm(Self));
  cbDateClick(nil);
  cbRefreshLinkClick(nil);
  cbAllCardsClick(nil);
end;
//==============================================================================

end.
