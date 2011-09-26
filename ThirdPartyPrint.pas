unit ThirdPartyPrint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, RXSpin, CurrEdit, Db, MemDS,
  DBAccess, Ora, ThirdPartyTranz, Placemnt, uCommonForm,uOilQuery,uOilStoredProc,
  Grids, DBGridEh;

type TPrintRekv = record
  intWhere : integer;
  intWho : integer;
  strWhereName : String;
  strWhoName : String;
  intAgentId : Integer;
  intAgentInst : Integer;
  intWhoId : Integer;
  intWhoInst : Integer;
end;

type
  TfrmThirdPartyPrint = class(TCommonForm)
    pButtons: TPanel;
    qWork: TOilQuery;
    qRN: TOilQuery;
    qSchet: TOilQuery;
    pnlDoc: TPanel;
    lblNumber: TLabel;
    sbAuto: TSpeedButton;
    Label2: TLabel;
    edDocNumber: TEdit;
    deDocDate: TDateEdit;
    pnlOrgs: TPanel;
    lblFrom: TLabel;
    lblTo: TLabel;
    edDep: TEdit;
    edOrg: TEdit;
    pnlPrintAll: TPanel;
    lblDoc: TLabel;
    chSchet: TCheckBox;
    chRN: TCheckBox;
    chNN: TCheckBox;
    edSchetPrefix: TEdit;
    edRNPrefix: TEdit;
    Panel1: TPanel;
    lblOutput: TLabel;
    cbOutputType: TComboBox;
    Label5: TLabel;
    edNumOfCopy: TRxCalcEdit;
    sbUpDown: TRxSpinButton;
    deSaveTo: TDirectoryEdit;
    chSaveTo: TCheckBox;
    Panel2: TPanel;
    lblDateFrom: TLabel;
    deBeginDate: TDateEdit;
    lblDateTo: TLabel;
    deEndDate: TDateEdit;
    qAll: TOilQuery;
    FormStorage: TFormStorage;
    pNpgPriceGrid: TPanel;
    dbgNpgPrice: TDBGridEh;
    pnlSvodniy: TPanel;
    pnlButton: TPanel;
    bbPrint: TBitBtn;
    bbCancel: TBitBtn;
    cbTotal: TCheckBox;
    procedure chSaveToClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbAutoClick(Sender: TObject);
    procedure cbOutputTypeChange(Sender: TObject);
    procedure sbUpDownBottomClick(Sender: TObject);
    procedure sbUpDownTopClick(Sender: TObject);
    procedure bbPrintClick(Sender: TObject);
    procedure chSchetClick(Sender: TObject);
    procedure chRNClick(Sender: TObject);
    procedure dbgNpgPriceColumns3UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);

  private
      strPeriod : String;
      procedure SetDocNumber(p_DocType:ThirdPartyTranz.TDocType);
      procedure DoRashNak();
      procedure DoSchet();
      procedure DoAll();
  public
    PrintRekv : TPrintRekv;
    globDocType : ThirdPartyTranz.TDocType;
    mbEdit : Boolean;
    ModalResultOnly: Boolean; // если TRUE, то на нажатие "Печать" просто возвращается mrOk
    IsDbgNpgPriceChanged: boolean; // TRUE, якщо значення в таблиці змінювалися
  end;

var
  frmThirdPartyPrint: TfrmThirdPartyPrint;

implementation

uses OilStd, UDbFunc, Main, RashNakPrint, InvoicePrint, MoneyFunc, uStart, ExFunc, TalonPrih;

{$R *.DFM}

procedure TfrmThirdPartyPrint.chSaveToClick(Sender: TObject);
begin
   deSaveTo.Enabled := chSaveTo.Checked;
end;

procedure TfrmThirdPartyPrint.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  for I:= 0 to cbOutputType.Items.Count - 1 do
   if cbOutputType.Items.Strings[I] = FormStorage.ReadString('cbOutputType_Text',TranslateText('Экран'))
     then cbOutputType.ItemIndex := I;

  deSaveTo.Text:=GetMainDir+'Doc';
  ModalResultOnly:=False;
  IsDbgNpgPriceChanged := false;
end;


procedure TfrmThirdPartyPrint.chSchetClick(Sender: TObject);
begin
  edSchetPrefix.Enabled := chSchet.Checked;
end;

procedure TfrmThirdPartyPrint.chRNClick(Sender: TObject);
begin
  edRNPrefix.Enabled := chRN.Checked;
end;


procedure TfrmThirdPartyPrint.sbAutoClick(Sender: TObject);
begin
  edDocNumber.Clear;
  edDocNumber.ReadOnly := sbAuto.Down;
  edDocNumber.ShowHint := sbAuto.Down;
  if sbAuto.Down then
  begin
    edDocNumber.Color:=clBtnFace;
    edDocNumber.Hint:=TranslateText('Будет выбран следующий номер по порядку');
  end
  else
  begin
    edDocNumber.Color:=clWindow;
    edDocNumber.Hint:='';
  end;
end;

procedure TfrmThirdPartyPrint.cbOutputTypeChange(Sender: TObject);
begin
  edNumOfCopy.Enabled := cbOutputType.ItemIndex = 1;
  sbUpDown.Enabled := cbOutputType.ItemIndex = 1;
  chSaveTo.Checked := cbOutputType.ItemIndex = 2;
  if cbOutputType.Itemindex = 0 then edNumOfCopy.value := 1;
end;

procedure TfrmThirdPartyPrint.sbUpDownBottomClick(Sender: TObject);
begin
   if edNumOfCopy.Value>1 then edNumOfCopy.Value := edNumOfCopy.Value -1;
end;
procedure TfrmThirdPartyPrint.sbUpDownTopClick(Sender: TObject);
begin
  edNumOfCopy.Value := edNumOfCopy.Value + 1;
end;

procedure TfrmThirdPartyPrint.SetDocNumber(p_DocType:ThirdPartyTranz.TDocType);
var
  strFieldName, strFieldDate, strSeqName, strPrefix  :  String;
begin
  case p_DocType of
    dtRashNak :
      begin
        strFieldName:='oil_rn_num';
        strFieldDate:='oil_rn_date';
        strSeqName := 's_card_money_rn_num';
        strPrefix := edRNPrefix.Text;
      end;
    dtSchet :
      begin
        strFieldName:='oil_schet_num';
        strFieldDate:='oil_schet_date';
        strSeqName := 's_card_money_schet_num';
        strPrefix := edSchetPrefix.Text;
      end;
  end;
  
  if globDocType <> dtAll then
  begin
    //проверка уникальности имени документа
    if qWork.Active then qWork.Close;
    qWork.SQL.Text :=
       ' select '+strFieldName+
       ' from card_transaction_money'+
       ' where '+strFieldName+' = '''+strPrefix+edDocNumber.Text+'''';
    qWork.Open;
    if (not qWork.IsEmpty) then raise Exception.Create(TranslateText('Документ с таким именем уже заведен'));
  end;  

  //проверка транзакций за предидущий период
  qWork.Close;
  qWork.SQL.Text := ' select min(trunc(oper_date)) as FromDate from Card_Transaction_money ' +
     ' where trunc(Oper_Date ) < ''' + FormatDateTime('dd.mm.yyyy', deBeginDate.Date) + ''' ' +
     ' and em_who = ' + IntToStr(PrintRekv.intWho) +
     ' and em_where = ' + IntToStr(PrintRekv.intWhere) +
     ' and '+strFieldName+' is null';
  qWork.Open;
  
  if  (not qWork.isEmpty) and (qWork.FieldByName('FromDate').asString <> '') then
    if (globDocType<>dtAll) then
      if (MessageDlg(TranslateText('Найдены транзакции за предидущий период, по которым не выписан документ.')+#13+#10+
                     TranslateText('Учесть их при распечатке?'),mtInformation,[mbYes,mbNo],0) = mrYes )
      then deBeginDate.Date := qWork.FieldByName('FromDate').asDateTime
      else Abort 
    else deBeginDate.Date := qWork.FieldByName('FromDate').asDateTime;

  Application.ProcessMessages;

  //Автонумерация
  if (sbAuto.Down) or (globDocType=dtAll) then edDocNumber.Text  := IntToStr(GetSeqNextVal(strSeqName));

  //переписать номер
  try
    frmStart.OraSession1.StartTransaction;
    qWork.Close;
    qWork.SQL.Text := ' update Card_Transaction_money ' +
         ' set '+strFieldName+'=''' + strPrefix+edDocNumber.Text + ''','+
         strFieldDate+' = ''' + FormatDateTime('dd.mm.yyyy',deDocDate.Date)  + ''' ' +
       ' where trunc(oper_date) >= ''' + FormatDateTime('dd.mm.yyyy', deBeginDate.Date) + ''' ' +
         ' and trunc(oper_date) <= ''' + FormatDateTime('dd.mm.yyyy', deEndDate.Date) + ''' ' +
         ' and '+strFieldName+' is null ' +
         ' and em_who = ' + IntToStr(PrintRekv.intWho);// +
//         ' and em_where = ' + IntToStr(PrintRekv.intWhere);
    qWork.ExecSQL;
    frmStart.OraSession1.Commit;
    ModalResult := mrOk;
  except on E:Exception do
    begin
      frmStart.OraSession1.Rollback;
      raise Exception.Create(TranslateText('Ошибка формирования номера документа')+#13#10+E.Message);
    end;
  end;
end;

procedure TfrmThirdPartyPrint.DoRashNak();
var RN : TdmRashNakPrint;
begin
  try
  if deBeginDate.Date<>deEndDate.Date
   then  strPeriod := ' c '+ deBeginDate.Text+TranslateText(' по ')+ deEndDate.Text
   else strPeriod :=  deBeginDate.Text;
  //экземпляр расходной накладной
  RN :=  TdmRashNakPrint.Create(
  edDocNumber.Text,
  deDocDate.Date,
  strPeriod,
  '',
  PrintRekv.intAgentId,
  PrintRekv.intAgentInst,
  PrintRekv.intWhoId,
  PrintRekv.intWhoInst
  );
  //запрос для РН
  if qRN.Active then qRN.Close;
  qRN.ParamByName('OrgId').asInteger := PrintRekv.intWhoId;
  qRN.ParamByName('OrgInst').asInteger := PrintRekv.intWhoInst;
  qRN.ParamByName('FromDate').asDateTime := deBeginDate.Date;
  qRN.ParamByName('ToDate').asDateTime := deEndDate.Date;
  qRN.Open;
  if qRN.isEmpty then raise Exception.Create(TranslateText('Нет данных для формирования расходной накладной'));
  //позиции РН
  while not qRN.eof do
  begin
    RN.AddPosition(
      qRN.FieldByName('Where_Name').asString,   //p_Department
      qRN.FieldByName('Azs_Name').asString,     //p_AZS
      qRN.FieldByName('Np_Name').asString,      //p_NPName
      qRN.FieldByName('Card_Number').asString,  //p_CardNumber
      qRN.FieldByName('Check_Num').asString,    //p_Draft
      qRN.FieldByName('Oper_date').asString,    //p_DraftDate
      TranslateText('литр'),                                   //p_DimName
      qRN.FieldByName('PriceNds').asFloat ,     //p_PriceNoNds
      qRN.FieldByName('PriceNdsDis').asFloat,   //p_PriceNoNdsDis
      qRN.FieldByName('Count_Litr').asFloat     //p_Count
    );
    qRN.Next;
  end;

  //Вывести РН в эксель
  RN.PutToExcel(cbOutputType.ItemIndex,deSaveTo.Text,chSaveTo.Checked,edNumOfCopy.AsInteger);
  finally
  RN.Free();
  end;
end;

procedure TfrmThirdPartyPrint.DoSchet();
var SCH : TdmInvoicePrint;

begin
  try
  if deBeginDate.Date<>deEndDate.Date
    then  strPeriod := ' c '+ deBeginDate.Text+TranslateText(' по ')+ deEndDate.Text
    else strPeriod :=  deBeginDate.Text;
  SCH :=  TdmInvoicePrint.Create(
  edDocNumber.Text,
  deDocDate.Text,
  strPeriod,
  '',
  PrintRekv.intAgentId,
  PrintRekv.intAgentInst,
  PrintRekv.intWhoId,
  PrintRekv.intWhoInst
  );
  //запрос для счета
  if qSchet.Active then qSchet.Close;
  qSchet.ParamByName('OrgId').asInteger := PrintRekv.intWhoId;
  qSchet.ParamByName('OrgInst').asInteger := PrintRekv.intWhoInst;
  qSchet.ParamByName('FromDate').asDateTime := deBeginDate.Date;
  qSchet.ParamByName('ToDate').asDateTime := deEndDate.Date;
  qSchet.Open;
  if qSchet.isEmpty then raise Exception.Create(TranslateText('Нет данных для формирования счета'));
  //позиции счета
  while not qSchet.eof do
  begin
    SCH.AddPosition(
      qSchet.FieldByName('NpName').asString,     //p_NPName
      TranslateText('литр'),                                    //p_DimName
      qSchet.FieldByName('PriceNds').asFloat ,   //p_PriceNds
      qSchet.FieldByName('CountLitr').asFloat
    );
    qSchet.Next;
  end;
  //Вывести счет в эксель
  SCH.PutToExcel(cbOutputType.ItemIndex,deSaveTo.Text,chSaveTo.Checked, edNumOfCopy.AsInteger);
  finally
   SCH.Free();
  end;
end;

procedure TfrmThirdPartyPrint.DoAll();
begin
  try
    if qAll.Active then qAll.Close;
    qAll.ParamByName('BeginDate').asDateTime := deBeginDate.Date;
    qAll.ParamByName('EndDate').asDateTime := deEndDate.Date;
    qAll.Open;
    while not qAll.eof do
    begin
      PrintRekv.intWhoId  := qAll.FieldByName('Id').asInteger;
      PrintRekv.intWhoInst := qAll.FieldByName('Inst').asInteger;
      PrintRekv.intWho :=  qAll.FieldByName('EmWho').asInteger;

      if chRN.Checked then
      begin
        SetDocNumber(dtRashNak);
        DoRashNak();
      end;
      if chSchet.Checked then
      begin
        SetDocNumber(dtSchet);
        DoSchet();
      end;
      qAll.Next;
    end;
  except on E:Exception do
    raise Exception.Create(TranslateText('Ошибка пакетного формирования')+#13#10+E.Message+#13#10+TranslateText('Операция остановлена'));
  end;
end;

procedure TfrmThirdPartyPrint.bbPrintClick(Sender: TObject);
var scr: string;
begin
  if ModalResultOnly then
    begin
      if pNpgPriceGrid.Visible then
        with dbgNpgPrice.DataSource do
          begin
            DecimalSeparator := '.';
            DataSet.First;
            scr := 'begin ov.ResetNpgPrice; ';
            while not DataSet.Eof and IsDbgNpgPriceChanged do
              begin
                if not DataSet.FieldByName('price').IsNull then
                  scr := scr + ' ov.SetNpgPrice('+
                         DataSet.FieldByName('np_group_id').AsString+','+
                         DataSet.FieldByName('price').AsString+'); ';
                DataSet.Next;
              end;
            scr := scr + 'end;';
            try
              _ExecSqlOra(scr);
            finally
              GetFormatSettings;  //resets DecimalSeparator to initial value
            end;
          end;
      ModalResult:=mrOk;
    end
  else begin
    try
      if (not mbEdit) and (globDocType<>dtAll) then SetDocNumber(globDocType);
      case globDocType of
        dtRashNak : DoRashNak();
        dtSchet :  DoSchet();
        dtAll : DoAll();
        else exit;
      end;
    except on E:Exception do
      begin
        ModalResult := mrNone;
        MessageDlg(E.Message,mtWarning,[mbOk],0);
      end;
    end;
  end;
end;

procedure TfrmThirdPartyPrint.dbgNpgPriceColumns3UpdateData(
  Sender: TObject; var Text: String; var Value: Variant; var UseText,
  Handled: Boolean);
begin
  inherited;
  IsDbgNpgPriceChanged := true;
end;

end.
