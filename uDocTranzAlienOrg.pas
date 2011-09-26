{
Форма для распечатки документов по транзакциям с азс соронних фирм
Вызывается с XML формы
}



unit uDocTranzAlienOrg;

interface

uses uCommonForm,  uXMLForm,stdctrls, Forms, Classes,  ThirdPartyPrint, Menus, Dialogs, Ora, sysutils, Controls,uOilQuery,uOilStoredProc;

type TDocTranzAlienOrg = class
  private
    FFromId : Integer;
    FFromInst : Integer;
    FToId : Integer;
    FToInst : Integer;
    FRefForm : TXMLForm;
    qryRn : TOilQuery;
    procedure ShowPrintInterface(Sender: TObject);
    procedure DeleteDocument(Sender: TObject);
    procedure MakeRN(Sender: TObject);
  public
    constructor Create;
    destructor Destroy; override;
end;

var
  Docs : TDocTranzAlienOrg;
  frmDocInterface : TfrmThirdPartyPrint;

const QueryRnText = '-->qryRn,uDocTranzAlienOrg';

procedure ProcessDocTranzAlienOrg(AXMLForm: TXMLForm);

implementation

uses RashNakPrint, UDbFunc, OilStd, Main, uExeSql;

procedure ProcessDocTranzAlienOrg(AXMLForm: TXMLForm);
var
  Item : TMenuItem;
begin
  {Передать указатель на справочник в FRefForm}
  Docs.FRefForm := AXMLForm;

  {Создать и добавить пункт меню для удаления документа}
  Item := TMenuItem.Create(AXMLForm.PUM);
  Item.Caption := TranslateText('Удалить РН');
  Item.OnClick := Docs.DeleteDocument;
  AXMLForm.PUM.Items.Insert(0,Item);
  
  {Создать и добавить пункт меню для вызова печати РН}
  Item := TMenuItem.Create(AXMLForm.PUM);
  Item.Caption := TranslateText('Формировать РН');
  Item.OnClick := Docs.ShowPrintInterface;
  AXMLForm.PUM.Items.Insert(0,Item);

  {Добавить сепаратор}
  Item := TMenuItem.Create(AXMLForm.PUM);
  Item.Caption := '-';
  AXMLForm.PUM.Items.Insert(2,Item);



end;

{ TDocTranzAlienOrg }

constructor TDocTranzAlienOrg.Create;
begin
  qryRn := TOilQuery.Create(nil);
end;

destructor TDocTranzAlienOrg.Destroy;
begin
  inherited;
  qryRn.Free;
end;

procedure TDocTranzAlienOrg.ShowPrintInterface(Sender: TObject);
begin
  if FRefForm.q.IsEmpty then Exit;
  {Форма печати документов}
  frmDocInterface := TfrmThirdPartyPrint.Create(Application);
  with frmDocInterface do
  try
   { chByDay := TCheckBox.Create(frmDocInterface);
    chByDay.Caption := 'РН по дням';
    chByDay.Checked := True;
    chByDay.Parent := pButtons;
    chByday.Width := chByday.Width - 10;
    chByDay.Top := 8;
    chByDay.Left := 6;}

    pnlPrintAll.Visible := False;
    bbPrint.OnClick := MakeRN;
    sbAuto.Down:=true;
    sbAutoClick(nil);
    pnlPrintAll.Visible := false;
    edDep.Text := FRefForm.q['azs_parent_name'];
    edOrg.Text := GetOrgName(Main.INST,Main.INST);
    deBeginDate.Date := FRefForm.q['date_'];
    deEndDate.Date := FRefForm.q['date_'];

    if not FRefForm.q.FieldByName('rn_date').IsNull
      then  deDocDate.Date := FRefForm.q.FieldByName('rn_date').Value
      else  deDocDate.Date := FRefForm.q.FieldByName('date_').Value;

   { if FRefForm.q.FieldByName('rn_num').AsString <> ''
      then edDocNumber.Text := FRefForm.q.FieldByName('rn_num').asString
      else edDocNumber.Text := '';}

    bbPrint.ModalResult := mrOk;
    if ShowModal = mrOk then FrefForm.bbSearch.Click;
  finally
    Free;
  end;
end;

procedure TDocTranzAlienOrg.MakeRN(Sender: TObject);
var
  RashNak : TdmRashNakPrint;
  RnNum: string;
  CurrDate : TDateTime;
  iNew, iId : integer;
  RnType : TRashNakType;
begin

  RNType := rnCardEK;

  with qryRN do
  begin
    SQL.Text := QueryRnText;
    LoadExeSQL(qryRn.SQL);
    if Active then Close;
    ParamByName('FromDate').asDate := frmDocInterface.deBeginDate.Date;
    ParamByName('ToDate').asDate := frmDocInterface.deEndDate.Date;
    Open;

    if isEmpty
     then raise Exception.Create(TranslateText('За выбранный период не обнаружено ни одной транзакции'));
  end;

  CurrDate := 0;
  iNew := 0;
  while not qryRN.Eof do
  begin


    {Cоздать экземпляр расходной накладной}
    if (CurrDate <> qryRN.FieldByName('date_').asDateTime) or
       ((RnNum <> qryRN.FieldByName('rn_num').asString) and not qryRN.FieldByName('rn_num').IsNull) or
      (qryRN.FieldByName('new_rn').asInteger <> iNew)
    then
    begin
      {Занести в RNNum номер расходной накладной}

      if qryRN.FieldByName('rn_num').IsNull
        then if frmDocInterface.edDocNumber.Text <> ''
          then RnNum := frmDocInterface.edDocNumber.Text
          else RnNum := IntToStr(GetSeqNextVal('s_oil_rn_tranz_alien',true))
        else RnNum := qryRN.FieldByName('rn_num').asString;

      FFromId := FRefForm.q['azs_parent_id'];
      FFromInst := FRefForm.q['azs_parent_inst'];
      FToId := Main.INST;
      FToInst := Main.Inst;

      RashNak := TdmRashNakPrint.Create(
        RnNum,
        qryRN.FieldByName('date_').AsDateTime,
        '',
        '',
        FFromId,
        FFromInst,
        FToId,
        FToInst,
        RNType
      );
      RashNak.UseLinkToOldBase := False;
      CurrDate := qryRN.FieldByName('date_').asDateTime;
      iNew := qryRN.FieldByName('new_rn').asInteger;
    end; {создание экз.}

    //Добавить позицию расходной накладной
    RashNak.AddPosition(
      qryRN.FieldByName('azs_parent_name').asString,
      qryRN.FieldByName('azs_name').asString,
      qryRN.FieldByName('np_name').asString,
      qryRN.FieldByName('card_number').asString,
      ''''+qryRN.FieldByName('CheckNum').asString,
      qryRN.FieldByName('date_').asString,    //дата чека
      TranslateText('литр'),
      qryRN.FieldByName('term_price').asFloat,
      qryRN.FieldByName('term_price_dis').asFloat,
      qryRN.FieldByName('litr').asFloat
    );

    try
      StartSQL;

    if qryRN.FieldByName('rn_id').IsNull
      then iId := GetSeqNextVal('s_oil_rash_nak')
      else iId := qryRN.FieldByName('rn_id').AsInteger;

      if qryRN.FieldByName('rn_num').IsNull then
      _ExecProc('OIL.INSORUPDOIL_RASH_NAK',
       ['ID#',           iId,
        'INST#',         MAIN_ORG.INST,
        'STATE#',        'Y',
        'SOURCE_ID#',     qryRN.FieldByName('oil_id').asInteger,
        'SOURCE_INST#',   qryRN.FieldByName('oil_inst').asInteger,
        'VAR_NUMBER#',    qryRN.FieldByName('term_price').asFloat,
        'VAR_TEXT#',      RnNum,
        'VAR_DATE#',      qryRN.FieldByName('date_').asString,
        'RASH_NAK_TYPE#', 3
       ],TRUE);

      CommitSQL;
      qryRN.Next;

    except on ErrStr:Exception do
      begin
        RollBackSQL;
        if RashNak<>nil then RashNak.Free;
        raise Exception.Create(ErrStr.Message);
      end;
    end; //try

    if ((CurrDate <> qryRN.FieldByName('date_').asDateTime) ) or
       ((RnNum <> qryRN.FieldByName('rn_num').asString) and not qryRN.FieldByName('rn_num').IsNull) or
       (qryRN.FieldByName('new_rn').asInteger <> iNew) or
       (qryRN.Eof)
    then
    begin
      RashNak.PutToExcel(
        frmDocInterface.cbOutputType.ItemIndex,
        frmDocInterface.deSaveTo.Text,
        frmDocInterface.chSaveTo.Checked,
        frmDocInterface.edNumOfCopy.AsInteger
      );
      RashNak.Free;
    end;

  end; //while
end;

procedure TDocTranzAlienOrg.DeleteDocument;
begin
   if FRefForm.q.IsEmpty then Exit;
   if FRefForm.q.FieldByName('rn_num').IsNull then Exit;
   if MessageDlg(TranslateText('Подтвердите удалиние документа №')+FRefForm.q['rn_num'],mtConfirmation,[mbYes,mbNo],0) = mrNo
     then Exit;
   try

    StartSQL;

    {Удалить данные о расходных накладных из OIL_RASH_NAK}
      _ExecSQL('update oil_rash_nak set var_text = null, var_date = null where state=''Y'' and rash_nak_type=3 and var_text = '''+
           FRefForm.q.FieldByName('rn_num').asString +''' and var_date='''+FRefForm.q.FieldBYName('rn_date').asString+'''');

    CommitSQL;
    FRefForm.bbSearch.Click;
  except on E:Exception do
    begin
      RollBackSQL;
      MessageDlg(E.Message,mtError,[mbOk],0);
    end;
  end
end;

{Позаботится о корректном создании и уничтожении класса}
initialization
  Docs := TDocTranzAlienOrg.Create;
finalization
  Docs.Free;
end.
