unit Dog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Ora,
  ExtCtrls, CurrEdit, Db, DBTables, Placemnt, StdCtrls, ToolEdit, Mask, MemDS,
  Buttons, Grids, DBGrids, RXDBCtrl, DBCtrls, RxQuery, Menus, RXCtrls, DBAccess,
  DBGridEh, uCommonForm, uOilQuery, uOilStoredProc, RXSpin, MemTable, DogRef,
  uHelpButton{$IFDEF VER150}, Variants, StrUtils, GridsEh, DBGridEhGrouping{$ENDIF};

type
  EDogCreate=class(Exception);
  TDogCreate = class
    private
      FId,FInst:integer;
      FDogType:TDogType;
      FDogTypeText:string;
      mt:TMemoryTable;
      FDog:string;
      FDogDate,
      FExpDate:TDateTime;
      FFromId,FFromInst,FToId,FToInst,
      FForePay: integer;
      FSubType: variant;
      FBillID, FBillINST: variant;
      procedure SetDogType(AValue:TDogType);
      procedure SetForePay(AValue:boolean);
      function GetForePay():boolean;
      function GetExpDate():TDateTime;
      function GetDog():string;
      function GetInst():integer;
      function GetId():integer;
      procedure SetDogDate(AValue:TDateTime);
    public
      constructor Create();
      destructor Destroy();override;
      //------
      property Id:integer read GetId write FId;
      property Inst:integer read GetInst write FInst;
      property DogType:TDogType read FDogType write SetDogType;
      property ForePay:boolean read GetForePay write SetForePay;
      property SubType: variant read FSubType write FSubType;
      property Dog:string read GetDog write FDog;
      property DogDate:TDateTime read FDogDate write SetDogDate;
      property ExpDate:TDateTime read GetExpDate write FExpDate;
      property FromId:integer read FFromId write FFromId;
      property FromInst:integer read FFromInst write FFromInst;
      property ToId:integer read FToId write FToId;
      property ToInst:integer read FToInst write FToInst;
      property BillID: variant read FBillID write FBillID;
      property BillINST: variant read FBillINST write FBillINST;
      //------
      procedure Add(
        ACount, APriceXNds, APriceNds, ASummXNds, ASummNds: Currency;
        ANpId, ADimId: integer);
      procedure Save(SaveBill: boolean=true);
  end;

  TDogForm = class(TCommonForm)
    Panel1: TPanel;
    Panel3: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    dsDogDetail: TOraDataSource;
    qDogDetail: TOilQuery;
    uDogDetail: TOraUpdateSQL;
    qDogDetailDOG_INST: TFloatField;
    qDogDetailNP_TYPE: TFloatField;
    qDogDetailDIM_ID: TFloatField;
    qDogDetailPRICE: TFloatField;
    qDogDetailCOUNT_: TFloatField;
    qDogDetailBARTERNP: TFloatField;
    QDOGDETAILNPNAME: TStringField;
    qDogDetailID: TFloatField;
    qDogDetailDOG_ID: TFloatField;
    qDogDetailNPBNAME: TStringField;
    qDogDetailPRICE2: TFloatField;
    qWork: TOilQuery;
    qDogDetailDIM_NAME: TStringField;
    nbDog: TNotebook;
    gbDogCard: TGroupBox;
    Label1: TLabel;
    rb0: TRadioButton;
    rb1: TRadioButton;
    rb2: TRadioButton;
    dbed1: TDBEdit;
    dbde0: TDBDateEdit;
    rb3: TRadioButton;
    dbgDogService: TDBGridEh;
    dsDogService: TOraDataSource;
    qDogService: TOilQuery;
    uDogService: TOraUpdateSQL;
    qDogServicePRICE: TFloatField;
    qDogServicePRICE2: TFloatField;
    qDogServiceNAME: TStringField;
    qDogServiceID: TFloatField;
    qDogServiceDOG_ID: TFloatField;
    qDogServiceDOG_INST: TFloatField;
    qDogServiceNP_TYPE: TFloatField;
    qDogServiceDIM_ID: TFloatField;
    qDogServiceCOUNT_: TFloatField;
    qryCardRecalc: TOilQuery;
    qDogDetailPETROL_ID: TFloatField;
    sbAdd: TSpeedButton;
    sbDel: TSpeedButton;
    qDogServiceDIMNAME: TStringField;
    qDogDetailSUM_NN: TFloatField;
    dbgDogDetail: TDBGridEh;
    qDogServiceSUM_NN: TFloatField;
    pnlHelpButton: TPanel;
    OilHelpButton1: TOilHelpButton;
    pnlEditButton: TPanel;
    qDogDetailSUMM_NDS: TFloatField;
    qDogDetailSUMM_X_NDS: TFloatField;
    qDogServiceSUMM_NDS: TFloatField;
    qDogServiceSUMM_X_NDS: TFloatField;
    pData: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    lFrom: TLabel;
    lTo: TLabel;
    lFrom_RS: TLabel;
    MFO: TLabel;
    lTo_Rs: TLabel;
    Label8: TLabel;
    dbtFromRS: TDBText;
    dbtToRS: TDBText;
    dbtFromMFO: TDBText;
    dbtToMFO: TDBText;
    sbAuto: TSpeedButton;
    LblPayDays: TLabel;
    gbDogType: TGroupBox;
    lMode: TLabel;
    gbForePay: TGroupBox;
    rbForePayYes: TRadioButton;
    rbForePayNo: TRadioButton;
    dbeDog: TDBEdit;
    dbdeDogDate: TDBDateEdit;
    dbdePayDate: TDBDateEdit;
    dbceToName: TRxDBComboEdit;
    dbceFromName: TRxDBComboEdit;
    nbAdditionType: TNotebook;
    gbCardScheme: TGroupBox;
    rbEK: TRadioButton;
    rbLS: TRadioButton;
    gbTransportType: TGroupBox;
    rbSelfTransport: TRadioButton;
    rbDelivery: TRadioButton;
    rbBetweenFil: TRadioButton;
    sePayDays: TRxSpinEdit;
    dbceBill: TRxDBComboEdit;
    IBill: TLabel;
    sbBillAuto: TSpeedButton;
    pShare: TPanel;
    lShare: TLabel;
    sbShare: TSpeedButton;
    dbceShare: TRxDBComboEdit;
    dbdeBillDate: TDBDateEdit;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure qDogDetailBeforePost(DataSet: TDataSet);
    procedure dbgDogDetailEditButtonClick(Sender: TObject);
    procedure qDogDetailPRICEChange(Sender: TField);
    procedure qDogDetailPRICE2Change(Sender: TField);
    procedure dbceFromNameButtonClick(Sender: TObject);
    procedure dbceToNameButtonClick(Sender: TObject);
    procedure qDogDetailAfterPost(DataSet: TDataSet);
    procedure dbgDogDetailExit(Sender: TObject);
    procedure sbAutoClick(Sender: TObject);
    procedure dbceToNameChange(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure dbeDogChange(Sender: TObject);
    procedure rb0Click(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure rb3Click(Sender: TObject);
    procedure qDogServiceAfterPost(DataSet: TDataSet);
    procedure qDogServiceBeforePost(DataSet: TDataSet);
    procedure dbgDogServiceEditButtonClick(Sender: TObject);
    procedure dbgDogServiceExit(Sender: TObject);
    procedure qDogServicePRICEChange(Sender: TField);
    procedure qDogServicePRICE2Change(Sender: TField);
    procedure rbLSClick(Sender: TObject);
    procedure rbEKClick(Sender: TObject);
    procedure dbdeDogDateChange(Sender: TObject);
    procedure rbSelfTransportClick(Sender: TObject);
    procedure rbDeliveryClick(Sender: TObject);
    procedure qDogDetailBeforeDelete(DataSet: TDataSet);
    procedure sbAddClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure qDogDetailCOUNT_Change(Sender: TField);
    procedure qDogServiceCOUNT_Change(Sender: TField);
    procedure rbBetweenFilClick(Sender: TObject);
    procedure sePayDaysChange(Sender: TObject);
    procedure dbdePayDateChange(Sender: TObject);
    procedure ActiveDog(); // активація договору
    procedure CalcDetail(); // калькуляція qDogDetail
    procedure CalcService(); // калькуляція qDogService
    procedure dbceShareButtonClick(Sender: TObject);
    procedure dbceShareKeyPress(Sender: TObject; var Key: Char);
    procedure sbShareClick(Sender: TObject);
    procedure qDogDetailSUMM_NDSChange(Sender: TField);
    procedure qDogDetailSUMM_X_NDSChange(Sender: TField);
    procedure FormCreate(Sender: TObject);
    procedure rbForePayYesClick(Sender: TObject);
    procedure rbForePayNoClick(Sender: TObject);
  private
    bFormActive, bEditSUMM_NDS, bEditSUMM_X_NDS: boolean;
  public
    FROM_ID, FROM_INST: integer;
    mbEdit: Boolean;
    isDateChange: Boolean;
    function IsDogDependFromNN: boolean;
  end;

var
  DogForm: TDogForm;
  ChangeFlag: Boolean;
  DogChange: Boolean = false;

implementation

Uses Main, OilStd, NPTypeRef, ChooseOrg, uDBfunc, Progr, OperTypeRef, MoneyFunc,
  uStart, ExFunc, uXMLForm, PrihCardRef;

{$R *.DFM}

//==============================================================================
function TDogForm.IsDogDependFromNN: boolean;
begin
  Result := (lMode.Caption = isTalon) or (lMode.Caption = IsOpt) or (lMode.Caption = isService)
    or ((lMode.Caption = isCard) and not (rbLS.Checked));
end;
//==============================================================================
procedure TDogForm.FormShow(Sender: TObject);
begin
  bEditSUMM_NDS := false;
  bEditSUMM_X_NDS := false;
  bFormActive := true;
  // Ecли выключена лимитная схема
  if lMode.Caption = IsCard then rbLS.Enabled := 'Y' = VarToStr(ReadOilVar('CARD_LS_ENABLE'));
  dbceToName.SetFocus;
  ChangeFlag := False;
  DogChange := false;
  isDateChange := false;
  if not mbEdit then
  begin
    qWork.Close;
    qWork.Sql.Text := 'select * from v_oil_org where id = :id and inst = :inst order by def desc';
    _OpenQueryPar(qWork, ['id', FROM_ID, 'inst', FROM_INST]);
    // Загрузка реквизитов продавца
    if dbceFromName.DataSource.DataSet.State = dsBrowse then dbceFromName.DataSource.DataSet.Edit;
    dbceFromName.DataSource.DataSet.FieldByName('From_').AsInteger         := qWork.FieldByName('id').AsInteger;
    dbceFromName.DataSource.DataSet.FieldByName('From_Inst').AsInteger     := qWork.FieldByName('inst').AsInteger;
    dbceFromName.DataSource.DataSet.FieldByName('From_Name').AsString      := qWork.FieldByName('name').AsString;
    dbceFromName.DataSource.DataSet.FieldByName('From_Addr').AsString      := qWork.FieldByName('Addr').AsString;
    dbceFromName.DataSource.DataSet.FieldByName('From_Svid_Num').AsString  := qWork.FieldByName('Svid_Num').AsString;
    dbceFromName.DataSource.DataSet.FieldByName('From_Nal_Num').AsString   := qWork.FieldByName('Nal_Num').AsString;
    dbceFromName.DataSource.DataSet.FieldByName('From_Boss').AsString      := qWork.FieldByName('Boss').AsString;
    dbceFromName.DataSource.DataSet.FieldByName('From_OKPO').AsString      := qWork.FieldByName('Id_Num').AsString;
    dbceFromName.DataSource.DataSet.FieldByName('From_Phone').AsString     := qWork.FieldByName('Phone').AsString;
    dbceFromName.DataSource.DataSet.FieldByName('R_From_').AsString        := qWork.FieldByName('Rek_Id').AsString;
    dbceFromName.DataSource.DataSet.FieldByName('R_From_Inst').AsString    := qWork.FieldByName('Rek_Inst').AsString;
    dbceFromName.DataSource.DataSet.FieldByName('From_Rach_Chet').AsString := qWork.FieldByName('Rach_Chet').AsString;
    dbceFromName.DataSource.DataSet.FieldByName('From_MFO').AsString       := qWork.FieldByName('MFO').AsString;
    dbceFromName.DataSource.DataSet.FieldByName('From_Bank_Name').AsString := qWork.FieldByName('Bank_Name').AsString;
  end;

  // Договор по мелкому опту
  if lMode.Caption=isOpt then
  begin
    nbDog.ActivePage := 'pDogTalon';
    qDogDetail.Close;
    qDogDetail.Open;
    nbAdditionType.ActivePage := 'atTransportTypes';
  end;

  // Договор по талонам
  if lMode.Caption=isTalon then
  begin
    nbAdditionType.ActivePage := 'atEmpty';
    nbDog.ActivePage := 'pDogTalon';
    gbForePay.Visible := True;
    gbForePay.Enabled := False;
    qDogDetail.Close;
    qDogDetail.Open;
  end;

  // Договор по карточкам
  if lMode.Caption = IsCard then
  begin
    nbAdditionType.ActivePage := 'atCardTypes';
    nbDog.ActivePage := 'pDogTalon';
    gbForePay.Visible := True;
    gbForePay.Enabled := rbLS.Checked;
    qDogDetail.Close;
    qDogDetail.Open;
  end;

  // Договор по услугам
  if lMode.Caption=isService then
  begin
    nbAdditionType.ActivePage := 'atEmpty';
    nbDog.ActivePage := 'pDogService';
    gbForePay.Enabled:= False;
    if not mbEdit then
    begin
      rbForePayYes.Checked := true;
      rbForePayYesClick(nil);
    end;
    qDogService.Close;
    qDogService.Open;
  end;

  // Договор по ведомости
  if lMode.Caption=isVed then
  begin
    nbAdditionType.ActivePage := 'atEmpty';
    nbDog.ActivePage := 'pDogVed';
    gbForePay.Visible := False;
    dbdePayDate.Visible := False;
    pnlEditButton.Visible := false;
    sePayDays.Visible := dbdePayDate.Visible;
    LblPayDays.Visible := dbdePayDate.Visible;
    if mbEdit = True then
      case dbde0.DataSource.DataSet.FieldByName('Pay_type').asInteger of
        0:
         begin
           rb0Click(nil);
           rb0.Checked := True;
         end;
        1:
         begin
           if dbde0.DataSource.DataSet.FieldByName('Pay_Corr').asInteger <> 0 then
           begin
             rb1Click(nil);
             rb1.Checked := True;
           end;
           if dbde0.DataSource.DataSet.FieldByName('Pay_Corr').asInteger = 0 then
           begin
             rb3Click(nil);
             rb3.Checked := True;
           end;
         end;
        2:
         begin
           rb2Click(nil);
           rb2.Checked := True;
         end;
      end // case
    else
    begin
      rb3Click(nil);
      rb3.Checked := true;
    end;
  end; // lMode.Caption = isVed
  ActiveDog();
end;
//==============================================================================
procedure TDogForm.bbOkClick(Sender: TObject);
var
  iCntRecs, vToInst, vToId: integer;
  flCardFound: boolean;
begin
  if pShare.Visible then
    if dbceShare.DataSource.DataSet.FieldByName('SHARE_ID').AsVariant <> null then
    begin
      if 0 <> nvl(GetSqlValueParSimple(
        'select count(*) from oil_money where dog_id = :dog_id and dog_inst = :dog_inst and state = ''Y''',
        ['dog_id',   dbeDog.DataSource.DataSet.FieldByName('id').AsInteger,
         'dog_inst', dbeDog.DataSource.DataSet.FieldByName('inst').AsInteger]), 0) then
        raise Exception.Create(TranslateText('Акционный договор, по которому уже есть оплаты нельзя редактировать!'));

      if qDogDetail.Active then
      begin
        qDogDetail.First;
        while not qDogDetail.Eof do
        begin
          if 1 < nvl(GetSqlValueParSimple(
            'select count(*) from v_Card_Receipts t, oil_np_group npg, oil_np_type np' +
            ' where t.np_type = npg.petrol_id and np.grp_id = npg.id and np.id = :np_id' +
            '   and t.dog_id = :dog_id and t.dog_inst = :dog_inst',
            ['dog_id',   dbeDog.DataSource.DataSet.FieldByName('id').AsInteger,
             'dog_inst', dbeDog.DataSource.DataSet.FieldByName('inst').AsInteger,
             'np_id',    qDogDetailNP_TYPE.AsInteger]), 0) then
            raise Exception.Create(TranslateText('Акционный договор, может иметь по каждому НП только по одной транзакции!'));
          qDogDetail.Next;
        end;
      end;
    end;

  if(dbdeDogDate.Date <= StrToDate2(Close_Date))then
  begin
    MessageDlg(TranslateText('Нельзя ставить дату до даты закрытия периода !'), mtError, [mbOk], 0);
    Exit;
  end;
  if (not rbForePayYes.Checked) and (not rbForePayNo.Checked) and (rbLS.Checked)
    then raise Exception.Create(TranslateText('Укажите тип оплаты (предоплата/послеоплата)'));

  if dbdeDogDate.Date = 0
   then raise Exception.Create(TranslateText('Не определена дата договора !'));

  if dbceFromName.Text = ''
   then raise Exception.Create(TranslateText('Не определен Поставщик !'));

  if dbceToName.Text = ''
   then raise Exception.Create(TranslateText('Не определен Получатель !'));
  vToId:=dbceToName.DataSource.DataSet.FieldByName('to_').AsInteger;
  vToInst:=dbceToName.DataSource.DataSet.FieldByName('to_inst').AsInteger;
  if ((lMode.Caption = isTalon) and (vToId<>vToInst) or(lMode.Caption = isOpt))and(qDogDetail.IsEmpty)
   then raise Exception.Create(TranslateText('Заполните позиции договора !'));

  if (lMode.Caption = isService)and(qDogService.IsEmpty)
   then raise Exception.Create(TranslateText('Заполните позиции договора !'));

  if (dbed1.Text = '0')and(lMode.Caption = isVed)and(rb1.Checked)
   then raise Exception.Create(TranslateText('Необходимо ввести количество дней отсроченной оплаты!'));

  if (lMode.Caption = isVed)and(StrToInt(dbed1.Text) < 0)and(rb1.Checked)
   then raise Exception.Create(TranslateText('Количество дней отсроченной оплаты не может быть отрицательным!'));

  if (dbde0.Date = 0)and(lMode.Caption = isVed)and(rb0.Checked)
   then raise Exception.Create(TranslateText('Необходимо ввести дату оплаты!'));

  if (Copy(dbeDog.Text,length(dbeDog.Text)-3,2) = '*к') and (lMode.Caption = isCard)  and (not mbEdit)// *NO_TRANSLATE*
   then raise Exception.Create(TranslateText('Ошибка в названии договора - символы "*к"   зарезервированы для корректировок.'));
  // перевірка типу нафтопродукту на існування для усіх договорів крім по відомості
  if (lMode.Caption <> isVed) then
  begin
    if (lMode.Caption = isService) and (qDogService.FieldByName('NP_Type').asString = '') then
      raise Exception.Create(TranslateText('Не определён вид услуги!'))
    else
      if (qDogDetail.FieldByName('NP_Type').asString = '') and (lMode.Caption <> isService) then
        raise Exception.Create(TranslateText('Не определён тип нефтепродукта!'));
  end;

  if not (pShare.Visible and (dbceShare.DataSource.DataSet.FieldByName('SHARE_ID').AsVariant <> null)) then
  begin
    if qDogDetail.Active then
    begin
      qDogDetail.First;
      while not qDogDetail.Eof do
      begin
        if qDogDetail.FieldByName('PRICE2').AsFloat = 0 then
        begin
          qDogDetailPRICE2.FocusControl;
          raise Exception.Create(TranslateText('Не определена цена!'));
        end;
        qDogDetail.Next;
      end;
    end;
  end;

  //договоров по ЛС в один день должно быть не больше одного
  if (lMode.Caption = isCard) and (rbLS.Checked) and (isDateChange) then
  begin
    qWork.Close;
    qWork.SQL.Text :=
     ' select * from oil_dog '+
     ' where to_ = '+dbeDog.DataSource.DataSet.FieldByName('to_').AsString+
     ' and to_inst = '+dbeDog.DataSource.DataSet.FieldByName('To_Inst').AsString+
     ' and dog_date ='''+dbdeDogDate.Text+''''+
     ' and state = ''Y'' '+
     ' and sub_type = 101 ';
    qWork.Open;
    if qWork.RecordCount > 0 then
      raise Exception.Create(TranslateText('В этот день уже заведен один договор ЛС! '));
  end;

  //Перевіряємо forepay самого першого договору по ЛС з клієнтом. Договора зі смарт-картами PayFlex - не враховуються
  //При намаганні завести/змінити договір по ЛС, в якого forepay не збігається з першим -
  // ображаємось і гордо виходимо з процедури.
  if (lMode.Caption = isCard) and rbLS.Checked and (qDogDetailNP_TYPE.AsInteger <> 455) then
  begin
    qWork.Close;
    qWork.SQL.Text :=
      'select distinct dog.forepay' +
      '  from oil_dog dog, oil_dog_detail det' +
      '  where dog.state = ''Y'' and det.state = ''Y''' +
      '    and det.dog_id = dog.id' +
      '    and det.dog_inst = dog.inst' +
      '    and det.np_type <> 455' +
      '    and dog.sub_type = 101' +
      '    and dog.to_ =' + dbeDog.DataSource.DataSet.FieldByName('To_').AsString +
      '    and dog.to_inst =' + dbeDog.DataSource.DataSet.FieldByName('To_Inst').AsString +
      '    and dog.dog_date = (select min(dg.dog_date)' +
                             '  from oil_dog dg, oil_dog_detail dt' +
                             ' where dg.state = ''Y'' and dt.state = ''Y''' +
                             '   and dg.to_ =' + dbeDog.DataSource.DataSet.FieldByName('To_').AsString +
                             '   and dg.to_inst =' +  dbeDog.DataSource.DataSet.FieldByName('To_Inst').AsString +
                             '   and dt.dog_id = dg.id' +
                             '   and dt.dog_inst = dg.inst' +
                             '   and dt.np_type <> 455' +
                             '   and dg.sub_type = 101)';
    qWork.Open;
    if not qWork.IsEmpty and ((qWork.FieldByName('forepay').AsInteger = 1) xor rbForePayYes.Checked) then
      begin
        MessageDlg(IfThen(qWork.FieldByName('forepay').AsInteger = 1,
                               TranslateText('Тип договора не соответствует первоначально заключенному с клиентом - ЛС предоплата!'),
                               TranslateText('Тип договора не соответствует первоначально заключенному с клиентом - ЛС послеоплата!')
                          ),
                   mtWarning, [mbOK], 0);
        Exit;
      end;
  end;     

  //заведение договоров ЛС (послеоплата) с позицией "смарт-карта" недопустимо
  if (lMode.Caption = isCard) and (rbLS.Checked) and (rbForePayNo.Checked) then
  begin
    qDogDetail.First;
    while not qDogDetail.eof do
    begin
      if qDogDetail.FieldByName('np_type').asInteger = 455
        then raise Exception.Create(TranslateText('Продажа смарт-карт с типом договора ЛС-послеоплата не допустима '));
      qDogDetail.Next;
    end;
  end;

  if (lMode.Caption = isCard) and (rbLS.Checked) and (rbForePayYes.Checked) then
  begin
    flCardFound:=false;
    iCntRecs :=0;
    qDogDetail.First;
    while not qDogDetail.eof do
     begin
       if (qDogDetail.FieldByName('np_type').asInteger=455) and (not flCardFound) then flCardFound := true;
       inc(iCntRecs);
       qDogDetail.Next;
     end;
     if (iCntRecs > 1) and (flCardFound)
       then raise Exception.Create(TranslateText('Для лимитной схемы продажа смарт-карт и продажа топлива')+#13#10+
                                   TranslateText('должна быть в разных договорах '));
  end;

  if sbAuto.down then
    dbeDog.Text := IntToStr(GetSeqNextVal('S_Oil_Dog_AutoNum'));

  if dbeDog.Text = ''
   then raise Exception.Create(TranslateText('Не определено название договора !'));

  if (not(mbEdit))and(lMode.Caption = isVed) then
    dbeDog.DataSource.DataSet.FieldByName('Id').AsInteger := GetSeqNextVal('S_Oil_Dog');

  if (qDogDetail.State <> dsBrowse)and((lMode.Caption = isTalon)or(lMode.Caption = IsCard)or(lMode.Caption = IsOpt))
   then qDogDetail.Post;

  if (qDogService.State <> dsBrowse)and(lMode.Caption = isService)
   then qDogService.Post;

  qWork.Close;
  qWork.SQL.Text := 'select Dog from Oil_Dog ' +
        ' where State = ''Y'' ' +
        ' and Dog = ''' + dbeDog.Text + ''' ' +
        ' and to_char(dog_date,''yyyy'') = to_char(sysdate,''yyyy'') '+
        ' and not(Id = ' + dbeDog.DataSource.DataSet.FieldByName('Id').AsString +
        ' and Inst = ' + dbeDog.DataSource.DataSet.FieldByName('Inst').AsString + ' )';
  if rbBetweenFil.Checked then
    qWork.SQL.Add(' and sub_type = 12 ');
  qWork.Open;

  if (not(qWork.IsEmpty))and(sbAuto.Down = False) and (DogChange = True)
   then raise Exception.Create(TranslateText('Договор ') + qWork.Fields[0].AsString + TranslateText(' в этом году уже существует !'));

  if (not(qWork.IsEmpty))and(sbAuto.Down = True)
   then raise Exception.Create(TranslateText('Номер назначенный автонумерацией совпадает с уже введенным!'));

 //------------ перерасчет карт по лимитной схеме
  if (lMode.Caption = isCard) and (rbLs.Checked) then
  begin
    qDogDetail.First;
    StartSQLOra;
    try
      qryCardRecalc.Open;
      while not qDogDetail.Eof do
      begin
        if qDogDetailPetrol_id.asInteger<=0 then begin qDogDetail.Next;continue; end;
        qryCardRecalc.Insert;
        qryCardRecalc.FieldByName('To_Id').asInteger := dbceFromName.DataSource.DataSet.FieldByName('to_').AsInteger;
        qryCardRecalc.FieldByName('To_Inst').asInteger := dbceFromName.DataSource.DataSet.FieldByName('to_inst').AsInteger;
        qryCardRecalc.FieldByName('Np_Type').asInteger := qDogDetailPetrol_id.asInteger;
        qryCardRecalc.Post;
        qDogDetail.Next;
      end;
      //qryCardRecalc.ApplyUpdates;
      if (qryCardRecalc.UpdateStatus in [usModified, usInserted, usDeleted ])
        then qryCardRecalc.CommitUpdates;
      CommitSQLOra;
    except on E:Exception do
      begin
        if (qryCardRecalc.UpdateStatus in [usModified, usInserted, usDeleted ])
         then qryCardRecalc.CancelUpdates;
        RollbackSQLOra;
        MessageDlg(TranslateText('Ошибка записи в CARD_TO_RECALC:')+E.Message,mtWarning,[mbOk],0);
      end;
    end;
  end;

  //------------ перерасчет карт по электронному кошельку
  if (lMode.Caption = isCard) and (rbEK.Checked) then
  begin
    CardRecalc.AddToRecalc(
      dbeDog.DataSource.DataSet.FieldByName('Id').AsInteger,
      dbeDog.DataSource.DataSet.FieldByName('Inst').AsInteger,
      trcDog);
  end;

  if dbeDog.DataSource.DataSet.State <> dsBrowse then
    dbeDog.DataSource.DataSet.Post;

  if not ((rbLS.Checked and rbForePayNo.Checked) or (lMode.Caption = isVed)) then
    CreateBillWithDog(dbeDog.DataSource.DataSet.FieldByName('Id').AsInteger,
      dbeDog.DataSource.DataSet.FieldByName('Inst').AsInteger)
  else
    if rbLS.Checked and rbForePayNo.Checked then
    begin
      _ExecSql(
        'update oil_dog_detail set count_ = null, summ_x_nds = null, summ_nds = null' +
        ' where Dog_ID = :Dog_ID and Dog_INST = :Dog_INST',
        ['Dog_ID',   dbeDog.DataSource.DataSet.FieldByName('Id').AsInteger,
         'Dog_INST', dbeDog.DataSource.DataSet.FieldByName('Inst').AsInteger]);
    end;

  ModalResult := mrOk;
end;
//==============================================================================
procedure TDogForm.qDogDetailBeforePost(DataSet: TDataSet);
var
  SumTr: real;
begin
  if qDogDetail.State = dsInsert then
  begin
    qWork.Close;
    qWork.SQL.Text := 'select np_type from oil_dog_detail where dog_id = :dog_id and dog_inst = :dog_inst ' +
      ' and state = ''Y'' and NP_Type = :np_type ';
    _OpenQueryPar(qWork,
      ['np_type',  qDogDetail.FieldByName('NP_Type').AsInteger,
       'dog_id',   dbeDog.DataSource.DataSet.FieldByName('id').AsInteger,
       'dog_inst', dbeDog.DataSource.DataSet.FieldByName('inst').AsInteger]);

    if not qWork.IsEmpty then
    begin
      qDogDetail.CancelUpdates;
      raise Exception.Create(TranslateText('Этот тип НП уже выбран! Операция отменена!'));
    end;
    if 74 = GetSQLValue('select np_grp from v_oil_np_type where id = '+ IntToStr(qDogDetail.FieldByName('NP_Type').AsInteger))
    then if 0<GetSQLValue('select count(*) cnt '
      +'  from oil_dog d, '
      +'       oil_dog_detail dd, '
      +'       v_oil_np_type np '
      +' where d.id = dd.dog_id (+) '
      +'   and d.inst = dd.dog_inst (+) '
      +'   and d.state = ''Y'' '
      +'   and dd.state(+) = ''Y'' '
      +'   and dd.np_type = np.id '
      +'   and np.np_grp = 74 ')
    then
    begin
      qDogDetail.CancelUpdates;
      raise Exception.Create(TranslateText('Невозможно ввести два договора с Талонами ГСМ ! Операция отменена!'));
    end;

    qDogDetail.FieldByName('Id').AsInteger := GetSeqNextVal('s_oil_Dog_Detail');
    qDogDetail.FieldByName('Dog_Id').Value := dbeDog.DataSource.DataSet.FieldByName('Id').Value;
    qDogDetail.FieldByName('Dog_Inst').Value := dbeDog.DataSource.DataSet.FieldByName('Inst').Value;
    if qDogDetail.FieldByName('DIM_ID').IsNull then qDogDetail.FieldByName('DIM_ID').AsInteger := 28;
  end;
  //проверка для талонных договоров
  // 1. если есть НН по конкретному пункту то нельзя редактировать тип НП, и цены с и без НДС
  // 2. можно менять количество в пределах от кол.в НН до безконечности
  if (IsDogDependFromNN) and
     (qDogDetail.State = dsEdit) and (qDogDetailSUM_NN.AsFloat > 0) then
  begin
    //1.--------
    if(dbgDogDetail.SelectedField.FieldName = 'NPNAME')
      or (dbgDogDetail.SelectedField.FieldName = 'PRICE')
      or (dbgDogDetail.SelectedField.FieldName = 'PRICE2') then
    Begin
      qDogDetail.CancelUpdates;
      raise Exception.Create(TranslateText('Нельзя менять тип и цену нефтепродукта, по которому была выписана налоговая накладная!'));
    End;
    //2.--------
    if(dbgDogDetail.SelectedField.FieldName = 'COUNT_')
      and(Fround(qDogDetailCOUNT_.AsFloat * qDogDetailPRICE2.AsFloat,2) < qDogDetailSUM_NN.AsFloat) then
    Begin
      qDogDetail.CancelUpdates;
      raise Exception.Create(TranslateText('Нельзя менять количество нефтепродукта на меньшее, чем в уже выписаной налоговой накладной!'));
    End;
  end;
  if(qDogDetail.State = dsEdit) and (qDogDetail.FieldByName('np_type').AsInteger=455) then
  begin
    if qDogDetailCOUNT_.AsInteger<nvl(GetSqlValueParSimple('select count(*) from v_card_blank_full where dog_id=:id and dog_inst=:inst',
      ['id',dbeDog.DataSource.DataSet.FieldByName('Id').Value,
       'inst',dbeDog.DataSource.DataSet.FieldByName('Inst').Value]),0)
    then
    begin
      qDogDetail.CancelUpdates;
      raise Exception.Create(TranslateText('Нельзя менять количество бланков смарт-карт на меньшее, чем уже отпущеных бланков!'));
    end;
  end;

  if lMode.Caption = IsCard then
  begin
    SumTr := MRound(nvl(GetSqlValueParSimple(
      'select sum(litr) from v_Card_Receipts t, oil_np_group npg, oil_np_type np' +
      ' where t.np_type = npg.petrol_id and np.grp_id = npg.id and np.id = :np_id' +
      '   and t.dog_id = :dog_id and t.dog_inst = :dog_inst',
      ['dog_id',   dbeDog.DataSource.DataSet.FieldByName('id').AsInteger,
       'dog_inst', dbeDog.DataSource.DataSet.FieldByName('inst').AsInteger,
       'np_id',    qDogDetailNP_TYPE.AsInteger]), 0), 2);
    if qDogDetailCOUNT_.AsFloat < SumTr then
    begin
      qDogDetail.CancelUpdates;
      raise Exception.Create(TranslateText('Нельзя менять количество нефтепродукта на меньшее, чем в отпусках!'));
    end;
  end;
end;
//==============================================================================
procedure TDogForm.dbgDogDetailEditButtonClick(Sender: TObject);
var
  NPTypeRefForm: TNPTypeRefForm;
  vId: integer;
  vName: string;
begin
  if dbgDogDetail.SelectedField.FieldName = 'NPNAME' then
  begin
    if (IsDogDependFromNN) and (qDogDetail.State in [dsEdit,dsBrowse]) and (qDogDetailSUM_NN.AsFloat > 0) then
    Begin
      qDogDetail.CancelUpdates;
      raise Exception.Create(TranslateText('Нельзя менять тип нефтепродукта, по которому была выписана налоговая накладная!'));
    End;
    if(qDogDetail.FieldByName('np_type').AsInteger=455) then
    begin
      if 0<nvl(GetSqlValueParSimple('select count(*) from v_card_blank_full where dog_id=:id and dog_inst=:inst',
        ['id',dbeDog.DataSource.DataSet.FieldByName('Id').Value,
         'inst',dbeDog.DataSource.DataSet.FieldByName('Inst').Value]),0)
      then
      begin
        qDogDetail.CancelUpdates;
        raise Exception.Create(TranslateText('Нельзя менять тип товара, уже были отпуски бланков!'));
      end;
    end;


    Application.CreateForm(TNPTypeRefForm, NPTypeRefForm);
    NPTypeRefForm.ShowModal;
    If NPTypeRefForm.ModalResult = mrOk Then
    Begin
      qDogDetail.Edit;
      qDogDetail.FieldByName('NPNAME').AsString := NPTypeRefForm.qNAME.AsString;
      qDogDetail.FieldByName('NP_TYPE').AsInteger  := NPTypeRefForm.qID.AsInteger;
    End;
    NPTypeRefForm.Free;
  end;
  if dbgDogDetail.SelectedField.FieldName = 'NPBNAME' then
  begin
    Application.CreateForm(TNPTypeRefForm, NPTypeRefForm);
    NPTypeRefForm.ShowModal;
    If NPTypeRefForm.ModalResult = mrOk Then
    Begin
      qDogDetail.Edit;
      qDogDetail.FieldByName('NPBNAME').AsString := NPTypeRefForm.qName.AsString;
      qDogDetail.FieldByName('BARTERNP').AsInteger  := NPTypeRefForm.qId.AsInteger;
    End;
    NPTypeRefForm.Free;
  end;

  if dbgDogDetail.SelectedField.FieldName = 'DIM_NAME' then
  begin
    if XMLChoose('dimref',vId,vName) then
    begin
      qDogDetail.Edit;
      qDogDetail.FieldByName('Dim_Id').AsInteger := vId;
      qDogDetail.FieldByName('Dim_Name').AsString := vName;
    end;
  end;
end;
//==============================================================================
procedure TDogForm.dbceFromNameButtonClick(Sender: TObject);
var
  vId, vInst: Integer;
  vName, strAgentIdInst: String;
begin
  if ChooseOrg.CaptureOrgExt(1, MAIN_ID, INST, 'yyyr', vId, vInst, vName, qWork) then
  begin
    //вычислить айди инст организации - агента по грн картам
    strAgentIdInst := VarToStr(ReadOilVar('CARD_AGENT_ID_INST'));
    if dbceFromName.DataSource.DataSet.State = dsBrowse then dbceFromName.DataSource.DataSet.Edit;
    //Загрузка реквизитов продавца
    dbceFromName.DataSource.DataSet.FieldByName('From_').AsInteger := vId;
    dbceFromName.DataSource.DataSet.FieldByName('From_Inst').AsInteger := vInst;
    dbceFromName.DataSource.DataSet.FieldByName('From_Name').AsString := vName;
    dbceFromName.DataSource.DataSet.FieldByName('From_Addr').AsString := qWork.FieldByName('Addr').AsString;
    dbceFromName.DataSource.DataSet.FieldByName('From_Svid_Num').AsString := qWork.FieldByName('Svid_Num').AsString;
    dbceFromName.DataSource.DataSet.FieldByName('From_Nal_Num').AsString := qWork.FieldByName('Nal_Num').AsString;
    dbceFromName.DataSource.DataSet.FieldByName('From_Boss').AsString := qWork.FieldByName('Boss').AsString;
    dbceFromName.DataSource.DataSet.FieldByName('From_OKPO').AsString := qWork.FieldByName('Id_Num').AsString;
    dbceFromName.DataSource.DataSet.FieldByName('From_Phone').AsString := qWork.FieldByName('Phone').AsString;
    dbceFromName.DataSource.DataSet.FieldByName('R_From_').AsString := qWork.FieldByName('Rek_Id').AsString;
    dbceFromName.DataSource.DataSet.FieldByName('R_From_Inst').AsString := qWork.FieldByName('Rek_Inst').AsString;
    dbceFromName.DataSource.DataSet.FieldByName('From_Rach_Chet').AsString := qWork.FieldByName('Rach_Chet').AsString;
    dbceFromName.DataSource.DataSet.FieldByName('From_MFO').AsString := qWork.FieldByName('MFO').AsString;
    dbceFromName.DataSource.DataSet.FieldByName('From_Bank_Name').AsString := qWork.FieldByName('Bank_Name').AsString;
    dbceFromName.DataSource.DataSet.Post;
  end;
end;
//==============================================================================
procedure TDogForm.dbceToNameButtonClick(Sender: TObject);
var
 vId, vInst: Integer;
 vName, msg: String;
begin
  if ChooseOrg.CaptureOrgExt(3, MAIN_ID, INST, 'yyyr', vId, vInst, vName, qWork) then
  begin
    if not((dbceToName.DataSource.DataSet.FieldByName('To_').AsInteger = vId) and
           (dbceToName.DataSource.DataSet.FieldByName('To_Inst').AsInteger = vInst)) then
    begin
      msg:=TestDogLink(
        dbeDog.DataSource.DataSet.FieldByName('Id').AsInteger,
        dbeDog.DataSource.DataSet.FieldByName('Inst').AsInteger,
        TranslateText('Нельзя менять получателя, есть документ ссылающийся на этот договор: %s от %s.')
          +#13#10+TranslateText('Удалите этот документ, а потом меняйте получателя.'));
      if msg <>'' then
        raise Exception.Create(msg);
    end;

    with dbceToName.DataSource.DataSet do
    begin
      if (qWork.FieldByName('Org_Id').AsInteger = 8 )
       then raise Exception.Create(TranslateText('Выбран недопустимый тип организации !'));
      if State = dsBrowse
       then dbceToName.DataSource.DataSet.Edit;
      //Загрузка реквизитов покупателя
      FieldByName('To_').AsInteger := vId;
      FieldByName('To_Inst').AsInteger := vInst;
      FieldByName('To_Name').AsString := vName;
      FieldByName('To_Addr').AsString := qWork.FieldByName('Addr').AsString;
      FieldByName('To_Svid_Num').AsString := qWork.FieldByName('Svid_Num').AsString;
      FieldByName('To_Nal_Num').AsString := qWork.FieldByName('Nal_Num').AsString;
      FieldByName('To_Boss').AsString := qWork.FieldByName('Boss').AsString;
      FieldByName('To_OKPO').AsString := qWork.FieldByName('Id_Num').AsString;
      FieldByName('To_Phone').AsString := qWork.FieldByName('Phone').AsString;
      FieldByName('R_To_').AsString := qWork.FieldByName('Rek_Id').AsString;
      FieldByName('R_To_Inst').AsString := qWork.FieldByName('Rek_Inst').AsString;
      FieldByName('To_Bank_Name').AsString := qWork.FieldByName('Bank_Name').AsString;
      FieldByName('To_Rach_Chet').AsString := qWork.FieldByName('Rach_Chet').AsString;
      FieldByName('To_MFO').AsString := qWork.FieldByName('MFO').AsString;
      if (qWork.FieldByName('Face').AsInteger = 1) then
      begin
        Label8.Visible:=false;
        dbtToMFO.Visible:=false;
        dbtToRs.Width:=0;
        lTo_Rs.Caption:=TranslateText('Физическое лицо');
      end
      else
      begin
        Label8.Visible:=true;
        dbtToMFO.Visible:=true;
        lTo_Rs.Caption:=TranslateText('Рас.счет');
        dbtToRs.Width:=95;
      end;
    end;
  end;
end;
//==============================================================================
procedure TDogForm.qDogDetailAfterPost(DataSet: TDataSet);
begin
  qDogDetail.ApplyUpdates;
  qDogDetail.CommitUpdates;
end;
//==============================================================================
procedure TDogForm.dbgDogDetailExit(Sender: TObject);
begin
  if (qDogDetail.State <> dsBrowse) and (qDogDetail.FieldByName('NP_Type').asString <> '') then
    qDogDetail.Post;
end;
//==============================================================================
procedure TDogForm.sbAutoClick(Sender: TObject);
begin
  if sbAuto.Down then
  begin
    dbeDog.Clear;
    dbeDog.ReadOnly:=true;
    dbeDog.Color:=clBtnFace;
    dbeDog.Hint:=TranslateText('Будет выбран следующий номер по порядку');
    dbeDog.ShowHint:=true;
  end
  else
  begin
    dbeDog.ReadOnly:=false;
    dbeDog.Color:=clWindow;
    dbeDog.Hint:='';
    dbeDog.ShowHint:=false;
  end;
end;
//==============================================================================
procedure TDogForm.dbceToNameChange(Sender: TObject);
begin
  if dbtToRs.DataSource.DataSet.FieldByName('to_face').asInteger = 1 then
  begin
    Label8.Visible := False;
    dbtToMFO.Visible := False;
    dbtToRs.Width := 0;
    lTo_Rs.Caption := TranslateText('Физическое лицо');
  end
 else
  begin
    Label8.Visible := true;
    dbtToMFO.Visible := true;
    lTo_Rs.Caption := TranslateText('Рас.счет');
    dbtToRs.Width := 95;
  end;
end;
//==============================================================================
procedure TDogForm.bbCancelClick(Sender: TObject);
begin
  if mbEdit = true then mbEdit := false;
  if qDogService.Active then qDogService.Close;
  if qDogDetail.Active then qDogDetail.Close;
end;
//==============================================================================
procedure TDogForm.dbeDogChange(Sender: TObject);
begin
  DogChange := true;
end;
//==============================================================================
procedure TDogForm.rb0Click(Sender: TObject);
begin
  dbed1.Enabled := false;
  dbde0.Enabled := true;
  dbed1.DataSource.Edit;
  dbed1.DataSource.DataSet.FieldByName('Pay_Corr').asInteger:=0;
  dbed1.DataSource.DataSet.FieldByName('Pay_Type').asInteger:=0;
end;
//==============================================================================
procedure TDogForm.rb1Click(Sender: TObject);
begin
  dbde0.Enabled := false;
  dbed1.Enabled := true;
  dbed1.SetFocus;
  dbde0.DataSource.DataSet.FieldByName('Exp_Date').value:=null;
  dbde0.Clear;
  dbed1.DataSource.DataSet.FieldByName('Pay_Type').asInteger:=1;
end;
//==============================================================================
procedure TDogForm.rb2Click(Sender: TObject);
begin
  dbde0.Enabled := false;
  dbed1.Enabled := false;
  dbed1.DataSource.DataSet.FieldByName('Pay_Corr').asInteger:=0;
  dbde0.DataSource.DataSet.FieldByName('Exp_Date').value:=null;
  dbde0.Clear;
  dbed1.DataSource.DataSet.FieldByName('Pay_Type').asInteger:=2;
end;
//==============================================================================
procedure TDogForm.rb3Click(Sender: TObject);
begin
  dbde0.Enabled := false;
  dbed1.Enabled := false;
  dbed1.DataSource.DataSet.FieldByName('Pay_Corr').asInteger:=0;
  dbde0.DataSource.DataSet.FieldByName('Exp_Date').value:=null;
  dbde0.Clear;
  dbed1.DataSource.DataSet.FieldByName('Pay_Type').asInteger:=1;
end;
//==============================================================================
procedure TDogForm.qDogServiceAfterPost(DataSet: TDataSet);
begin
  qDogService.ApplyUpdates;
  qDogService.CommitUpdates;
end;
//==============================================================================
procedure TDogForm.qDogServiceBeforePost(DataSet: TDataSet);
begin
  if qDogService.State = dsInsert then
  begin
    qWork.Close;
    qWork.SQL.Text := ' select np_type from oil_dog_detail ' +
       ' where dog_id = ' + dbeDog.DataSource.DataSet.FieldByName('id').asString +
       ' and dog_inst = ' + dbeDog.DataSource.DataSet.FieldByName('inst').asString +
       ' and state = ''Y'' ' +
       ' and NP_Type = ' + qDogService.FieldByName('NP_Type').asString;
    qWork.Open;

    if not qWork.IsEmpty then
    begin
      qDogService.CancelUpdates;
      raise Exception.Create(TranslateText('Этот тип услуги уже выбран! Операция отменена!'));
    end;
    qDogService.FieldByName('Id').AsInteger := GetSeqNextVal('s_oil_Dog_Detail');
    qDogService.FieldByName('Dog_Id').Value := dbeDog.DataSource.DataSet.FieldByName('Id').Value;
    qDogService.FieldByName('Dog_Inst').Value := dbeDog.DataSource.DataSet.FieldByName('Inst').Value;
    if qDogService.FieldByName('DIM_ID').IsNull then qDogService.FieldByName('DIM_ID').AsInteger := 28;
  end;
  //проверка для талонных договоров
  // 1. если есть НН по конкретному пункту то нельзя редактировать тип НП, и цены с и без НДС
  // 2. можно менять количество в пределах от кол.в НН до безконечности
  if (IsDogDependFromNN) and
     (qDogService.State = dsEdit) and (qDogServiceSUM_NN.AsFloat > 0) then
  begin
    //1.--------
    if(dbgDogService.SelectedField.FieldName = 'NPNAME')
      or (dbgDogService.SelectedField.FieldName = 'PRICE')
      or (dbgDogService.SelectedField.FieldName = 'PRICE2') then
    Begin
      qDogService.CancelUpdates;
      raise Exception.Create(TranslateText('Нельзя менять тип и цену нефтепродукта, по которому была выписана налоговая накладная!'));
    End;
    //2.--------
    if(dbgDogService.SelectedField.FieldName = 'COUNT_')
      and(Fround(qDogServiceCOUNT_.AsFloat * qDogServicePRICE2.AsFloat,2) < qDogServiceSUM_NN.AsFloat) then
    Begin
      qDogService.CancelUpdates;
      raise Exception.Create(TranslateText('Нельзя менять количество нефтепродукта на меньшее, чем в уже выписаной налоговой накладной!'));
    End;
  end;
end;
//==============================================================================
procedure TDogForm.dbgDogServiceEditButtonClick(Sender: TObject);
var
  OperTypeRefForm : TOperTypeRefForm;
  vId: integer;
  vName: string;
begin
  if dbgDogService.SelectedField.FieldName = 'NAME' then
  begin
    Application.CreateForm(TOperTypeRefForm, OperTypeRefForm);
    OperTypeRefForm.SGrpId := 12;
    OperTypeRefForm.bbClear.Enabled:=false;
    OperTypeRefForm.ShowModal;
    If OperTypeRefForm.ModalResult = mrOk Then
    Begin
      qDogService.Edit;
      qDogService.FieldByName('Name').AsString := OperTypeRefForm.qName.AsString;
      qDogService.FieldByName('NP_TYPE').AsInteger  := OperTypeRefForm.qId.AsInteger;
    End;
    OperTypeRefForm.Free;
  end;
  if dbgDogService.SelectedField.FieldName = 'DIMNAME' then begin
    if XMLChoose('dimref',vId,vName) then begin
      qDogService.Edit;
      qDogService.FieldByName('Dim_Id').AsInteger := vId;
      qDogService.FieldByName('DimName').AsString := vName;
    end;
  end;
end;
//==============================================================================
procedure TDogForm.dbgDogServiceExit(Sender: TObject);
begin
  if (qDogService.State <> dsBrowse) and (qDogService.FieldByName('NP_Type').asString <> '') then
    qDogService.Post;
end;
//==============================================================================
procedure TDogForm.dbdeDogDateChange(Sender: TObject);
begin
  isDateChange := true;
  if not Self.Visible and ((Sender as TDBDateEdit).Date <= StrToDate(Close_Date)) then
    (Sender as TDBDateEdit).Enabled := false;
  bbOk.Enabled := (dbdeDogDate.Date > StrToDate(CLOSE_DATE));
  sePayDaysChange(nil);
end;
//==============================================================================
procedure TDogForm.rbSelfTransportClick(Sender: TObject);
begin
  if dbeDog.DataSource.DataSet.State = dsBrowse then dbeDog.DataSource.DataSet.Edit;
  dbeDog.DataSource.DataSet.FieldByName('Sub_Type').AsInteger := 10; //Самовывоз
end;
//==============================================================================
procedure TDogForm.rbDeliveryClick(Sender: TObject);
begin
  if dbeDog.DataSource.DataSet.State = dsBrowse then dbeDog.DataSource.DataSet.Edit;
  dbeDog.DataSource.DataSet.FieldByName('Sub_Type').AsInteger := 11; //доставка
end;
//==============================================================================
procedure TDogForm.qDogDetailBeforeDelete(DataSet: TDataSet);
begin
 if (lMode.Caption = isCard) and (qDogDetail.FieldByName('Np_Type').asInteger = 455) then
 begin // Удаление подчиненных записей расходных накладных
   qWork.Close;
   qWork.SQL.Text :=
     'update oil_rash_nak set State = ''N'' ' +
     'where source_Id = '+ qDogDetailDOG_ID.AsString +' and source_Inst = '+ qDogDetailDOG_INST.AsString +
     ' and rash_nak_type = 1';
   qWork.ExecSQL;
 end;
end;
//==============================================================================
procedure TDogForm.sbAddClick(Sender: TObject);
begin
 if qDogDetail.Active then qDogDetail.Insert;
end;
//==============================================================================
procedure TDogForm.sbDelClick(Sender: TObject);
  //****************************************************************************
  function DeleteRecord(AQuery: TOilQuery): boolean;
  var
    CanDelete: boolean;
  begin
    Result := false;
    CanDelete := (AQuery.Active) and (not AQuery.isEmpty) and (AQuery.FieldByName('SUM_NN').IsNull);
    if AQuery.FieldByName('np_type').AsInteger = 455 then
    begin
      CanDelete := CanDelete and
        (0 = GetSqlValueParSimple('select count(*) from v_card_blank where dog_id = :dog_id and dog_inst = :dog_inst',
          ['dog_id', AQuery.ParamByName('id').AsInteger, 'dog_inst', AQuery.ParamByName('inst').AsInteger]));
    end;
    if CanDelete and (MessageDlg(TranslateText('Вы хотите удалить позицию договора?'),
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      AQuery.Delete;
      Result := true;
    end;
    if CanDelete then Result := true;
  end;
  //****************************************************************************
begin
  if qDogDetailSUM_NN.AsFloat > 0 then
  begin
    MessageDlg(TranslateText('Нельзя удалить позицию договора, по которой уже выписаны налоговые накладные!'),
      mtError, [mbOk], 0);
    exit;
  end;
  if not(DeleteRecord(qDogDetail)) then
    if not(DeleteRecord(qDogService)) then
      ShowMessage(TranslateText('Нельзя удалить позицию договора!'));
end;
//==============================================================================
procedure TDogForm.rbBetweenFilClick(Sender: TObject);
begin
  if dbeDog.DataSource.DataSet.State = dsBrowse then dbeDog.DataSource.DataSet.Edit;
  dbeDog.DataSource.DataSet.FieldByName('Sub_Type').AsInteger := 12; //Заявка
  sbAuto.Down:=False;
  sbAuto.OnClick(nil);
end;
//==============================================================================
procedure TDogForm.sePayDaysChange(Sender: TObject);
begin
  inherited;
  if dbdePayDate.Date = 0 then exit;
  dbdePayDate.Date := sePayDays.Value + dbdeDogDate.Date - 1;
  if dbeDog.DataSource.DataSet.State = dsBrowse then
  begin
    dbeDog.DataSource.DataSet.Edit;
    dbeDog.DataSource.DataSet.FieldByName('EXP_DATE').AsDateTime := dbdePayDate.Date;
  end;
end;
//==============================================================================
procedure TDogForm.dbdePayDateChange(Sender: TObject);
begin
  inherited;
  if dbdePayDate.Date = 0 then exit;
  sePayDays.Value := trunc(dbdePayDate.Date - dbdeDogDate.Date) + 1;
end;
//==============================================================================
//====================--------------TDogCreate-----------------=================
//==============================================================================
constructor TDogCreate.Create();
var
  q:TOilQuery;
begin
  inherited Create;
  mt:=TMemoryTable.Create(nil);
  q:=TOilQuery.Create(nil);
  try
    q.SQL.Text:='select * from oil_dog_detail where 1=0';
    q.Open;
    mt.CopyStructure(q);
    CopyToMemoryTable(q,mt);
  finally
    q.Free;
  end;
  mt.EmptyTable;
  mt.Open;
  FId:=0;
  FInst:=0;
  FDog:='';
  FDogType:=dtNull;
  FDogTypeText:='';
  FDogDate:=0;
  FExpDate:=0;
  FFromId:=0;
  FFromInst:=0;
  FToId:=0;
  FToInst:=0;
  FForePay:=0;
  FSubType := null;
  FBillID := null;
  FBillINST := null;
end;
//------------------------------------------------------------------------------
destructor TDogCreate.Destroy();
begin
  inherited Destroy;
  FreeAndNil(mt);
end;
//------------------------------------------------------------------------------
procedure TDogCreate.Save(SaveBill: boolean=true);
var
  RToId, RToInst, RFromId, RFromInst, v: string;
begin
  try
    GetOrgRekvizit(FFromId, FFromInst, RFromId, RFromInst, v,v,v);
    GetOrgRekvizit(FToId, FToInst, RToId, RToInst, v,v,v);

    DBSaver.SaveRecord('OIL_DOG',
      ['ID',          Id,
       'INST',        Inst,
       'STATE',       'Y',
       'DOG',         Dog,
       'DOG_DATE',    DogDate,
       'EXP_DATE',    ExpDate,
       'DOG_TYPE',    GetDogTypeText(DogType),
       'FROM_',       FromId,
       'FROM_INST',   FromInst,
       'TO_',         ToId,
       'TO_INST',     ToInst,
       'R_FROM_',     BoolTo_(RFromId='',null,RFromId),
       'R_FROM_INST', BoolTo_(RFromInst='',null,RFromInst),
       'R_TO_',       BoolTo_(RToId='',null,RToId),
       'R_TO_INST',   BoolTo_(RToInst='',null,RToInst),
       'FOREPAY',     FForePay,
       'SUB_TYPE',    SubType,
       'BILL_ID',     BillID,
       'BILL_INST',   BillINST]);

    // видалення старих записей
    _ExecSqlOra(
      'update OIL_DOG_DETAIL set state = ''N''' +
      ' where DOG_ID = :DOG_ID and DOG_INST = :DOG_INST and state = ''Y''',
      ['DOG_ID', Id, 'DOG_INST', Inst]);

    // вставка нових записей
    mt.First;
    while not mt.Eof do
    begin
      DBSaver.SaveRecord('OIL_DOG_DETAIL',
        ['ID',         0,
         'STATE',      'Y',
         'DOG_ID',     Id,
         'DOG_INST',   Inst,
         'COUNT_',     mt['count_'],
         'NP_TYPE',    mt['np_type'],
         'PRICE',      mt['price'],
         'PRICE2',     mt['price2'],
         'DIM_ID',     mt['dim_id'],
         'SUMM_X_NDS', mt['SUMM_X_NDS'],
         'SUMM_NDS',   mt['SUMM_NDS']]);
      mt.Next;
    end;

    // створюємо/редагуємо рахунок
    if SaveBill then
      CreateBillWithDog(Id, Inst);

  except on e: exception do
    raise EDogCreate.Create(e.message);
  end;
end;
//------------------------------------------------------------------------------
procedure TDogCreate.Add(
  ACount, APriceXNds, APriceNds, ASummXNds, ASummNds: Currency;
  ANpId, ADimId: integer);
begin
  try
    mt.Append;
    if APriceXNds = 0 then APriceXNds := GetNoNDS_WithNDS(APriceNds, FDogDate);
    if APriceNds = 0 then APriceNds := GetWithNDS_NoNDS(APriceXNds, FDogDate);
    if APriceNds = 0 then
    begin
      if ASummXNds = 0 then ASummXNds := GetNoNDS_WithNDS(ASummNds, FDogDate, 2);
      if ASummNds = 0 then ASummNds := GetWithNDS_NoNDS(ASummXNds, FDogDate, 2);
    end
    else
    begin
      if (DogRef.TDogType(FDogType) = dtN) or (DogRef.TDogType(FDogType) = dtS) then
      begin
        if ASummXNds = 0 then ASummXNds := Mround(APriceXNds * ACount, 2);
        if ASummNds = 0 then ASummNds := MRound(APriceXNds * ACount, 2) + MRound(APriceXNds * TAX_RATE(FDogDate) * ACount, 2);
      end
      else
      begin
        if ASummXNds = 0 then ASummXNds := Fround(APriceNds * ACount, 2) -
          FRound(APriceNds * TAX_RATE(FDogDate)/(1+TAX_RATE(FDogDate)) * ACount, 2);
        if ASummNds = 0 then ASummNds := FRound(APriceNds * ACount, 2);
      end;
    end;
    mt['np_type']    := ANpId;
    mt['dim_id']     := ADimId;
    mt['count_']     := ACount;
    mt['price']      := APriceXNds;
    mt['price2']     := APriceNds;
    mt['SUMM_X_NDS'] := ASummXNds;
    mt['SUMM_NDS']   := ASummNds;
    mt.Post;
  except on e: exception do
    raise EDogCreate.Create(e.message);
  end;
end;
//------------------------------------------------------------------------------
procedure TDogCreate.SetForePay(AValue:boolean);
begin
  if AValue then
    FForePay:=1
  else
    FForePay:=0;
end;
//------------------------------------------------------------------------------
function TDogCreate.GetForePay():boolean;
begin
  result:=FForePay=1;
end;
//------------------------------------------------------------------------------
procedure TDogCreate.SetDogType(AValue:TDogType);
begin
  FDogType:=AValue;
  FDogTypeText:=GetDogTypeText(AValue);
end;
//------------------------------------------------------------------------------
function TDogCreate.GetExpDate():TDateTime;
begin
  if FExpDate=0 then
    result:=FDogDate
  else
    result:=FExpDate;
end;
//------------------------------------------------------------------------------
function TDogCreate.GetDog():string;
begin
  if trim(FDog)='' then
    FDog:=IntToStr(GetSeqNextVal('S_OIL_DOG_AUTONUM'));
  Result:=FDog;
end;
//------------------------------------------------------------------------------
function TDogCreate.GetInst():integer;
begin
  if FInst=0 then
    FInst:=MAIN_ID;
  Result:=FInst;
end;
//------------------------------------------------------------------------------
function TDogCreate.GetId():integer;
begin
  if FId=0 then
    FId:=GetSeqNextVal('s_oil_dog');
  Result:=FId;
end;
//------------------------------------------------------------------------------
procedure TDogCreate.SetDogDate(AValue:TDateTime);
begin
  if AValue=0 then
    raise EDogCreate.Create(TranslateText('Не определена дата договора !'));
  FDogDate:=AValue;
end;
//------------------------------------------------------------------------------
//==============================================================================
//==============================================================================
//==============================================================================
procedure TDogForm.ActiveDog(); // активація договору
var
  ActPrice: boolean;
begin
  // видимість полів при договорі по карткам ЕК
  dbgDogDetail.FieldColumns['COUNT_'].Visible     := rbEK.Checked;
  dbgDogDetail.FieldColumns['PRICE'].Visible      := rbEK.Checked;
  dbgDogDetail.FieldColumns['SUMM_X_NDS'].Visible := rbEK.Checked;
  dbgDogDetail.FieldColumns['SUMM_NDS'].Visible   := rbEK.Checked;
  dbgDogDetail.FieldColumns['SUM_NN'].Visible     := rbEK.Checked;
  dbgDogDetail.FieldColumns['DIM_NAME'].Visible   := rbEK.Checked;

  // Акції відображати, якщо договір по карткам ЕК і немає цін
  if qDogDetail.Active then
  begin
    ActPrice := false;
    qDogDetail.DisableControls;
    qDogDetail.First;
    while not qDogDetail.Eof do
    begin
      if qDogDetail.FieldByName('PRICE2').AsFloat <> 0 then
      begin
        ActPrice := true;
        break;
      end;
      qDogDetail.Next;
    end;
    qDogDetail.First;

    pShare.Visible := not ActPrice and (lMode.Caption = IsCard) and rbEK.Checked and rbForePayYes.Checked;
    // Якщо договір не по карткам ЕК-передвиплата, то видалити акцію, якщо вона вибрана
    if not pShare.Visible and (dbceShare.DataSource.DataSet.FieldByName('SHARE_ID').AsVariant <> null) then
      sbShareClick(nil);

    dbgDogDetail.FooterRowCount := 0;
    dbgDogDetail.FooterRowCount := 1;
    qDogDetail.EnableControls;
  end;

  // Якщо вибрана акція, то ціна = 0, а суми можна редагувати
  if dbceShare.DataSource.DataSet.FieldByName('SHARE_ID').AsVariant = null then
  begin
    dbgDogDetail.FieldColumns['PRICE'].Color      := clWindow;
    dbgDogDetail.FieldColumns['PRICE2'].Color     := clWindow;
    dbgDogDetail.FieldColumns['SUMM_NDS'].Color   := $00EEEFEF;
    dbgDogDetail.FieldColumns['SUMM_X_NDS'].Color := $00EEEFEF;
  end
  else
  begin
    dbgDogDetail.FieldColumns['PRICE'].Color      := $00EEEFEF;
    dbgDogDetail.FieldColumns['PRICE2'].Color     := $00EEEFEF;
    dbgDogDetail.FieldColumns['SUMM_NDS'].Color   := clWindow;
    dbgDogDetail.FieldColumns['SUMM_X_NDS'].Color := clWindow;
  end;
  dbgDogDetail.FieldColumns['PRICE'].ReadOnly      := not (dbceShare.DataSource.DataSet.FieldByName('SHARE_ID').AsVariant = null);
  dbgDogDetail.FieldColumns['PRICE2'].ReadOnly     := not (dbceShare.DataSource.DataSet.FieldByName('SHARE_ID').AsVariant = null);
  dbgDogDetail.FieldColumns['SUMM_X_NDS'].ReadOnly := (dbceShare.DataSource.DataSet.FieldByName('SHARE_ID').AsVariant = null);
  dbgDogDetail.FieldColumns['SUMM_NDS'].ReadOnly   := (dbceShare.DataSource.DataSet.FieldByName('SHARE_ID').AsVariant = null);

  // Якщо це договір по карткам ЛС передвиплатний
  if rbLS.Checked then
  begin
    dbgDogDetail.FieldColumns['COUNT_'].Visible     := rbForePayYes.Checked;
    dbgDogDetail.FieldColumns['PRICE'].Visible      := rbForePayYes.Checked;
    dbgDogDetail.FieldColumns['SUMM_X_NDS'].Visible := rbForePayYes.Checked;
    dbgDogDetail.FieldColumns['SUMM_NDS'].Visible   := rbForePayYes.Checked;
    dbgDogDetail.FieldColumns['SUM_NN'].Visible     := rbForePayYes.Checked;
    dbgDogDetail.FieldColumns['DIM_NAME'].Visible   := rbForePayYes.Checked;
  end;
end;
//==============================================================================
procedure TDogForm.dbceShareButtonClick(Sender: TObject);
var
  ID: integer;
  NAME: string;
begin
  inherited;
  XMLChoose('ShareRef', ID, NAME);
  if (ID <> 0) and (NAME <> '') then
  begin
    dbceShare.DataSource.DataSet.Edit;
    dbceShare.DataSource.DataSet.FieldByName('SHARE_ID').AsInteger := ID;
    dbceShare.Text := NAME;
    ActiveDog();
  end;
end;
//==============================================================================
procedure TDogForm.dbceShareKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;
//==============================================================================
procedure TDogForm.sbShareClick(Sender: TObject);
begin
  dbceShare.DataSource.DataSet.Edit;
  dbceShare.DataSource.DataSet.FieldByName('SHARE_ID').Clear;
  dbceShare.DataSource.DataSet.FieldByName('SHARE_NAME').Clear;
  ActiveDog();
end;
//==============================================================================
procedure TDogForm.qDogDetailSUMM_NDSChange(Sender: TField);
begin
  if bEditSUMM_X_NDS then exit;
  bEditSUMM_NDS := true;
  qDogDetail.FieldByName('SUMM_X_NDS').AsFloat :=
    GetNoNDS_WithNDS(qDogDetail.FieldByName('SUMM_NDS').AsFloat, dbdeDogDate.Date, 2);
  bEditSUMM_NDS := false;
end;
//==============================================================================
procedure TDogForm.qDogDetailSUMM_X_NDSChange(Sender: TField);
begin
  if bEditSUMM_NDS then exit;
  bEditSUMM_X_NDS := true;
  qDogDetail.FieldByName('SUMM_NDS').AsFloat :=
    GetWithNDS_NoNDS(qDogDetail.FieldByName('SUMM_X_NDS').AsFloat, dbdeDogDate.Date, 2);
  bEditSUMM_X_NDS := false;
end;
//==============================================================================
procedure TDogForm.qDogDetailPRICEChange(Sender: TField);
begin
  if (IsDogDependFromNN) and (qDogDetail.State = dsEdit) and (qDogDetailSUM_NN.AsFloat > 0) then
  begin
    qDogDetail.CancelUpdates;
    raise Exception.Create(TranslateText('Нельзя менять цену нефтепродукта, по которому была выписана налоговая накладная!'));
  end;

  // перевірка прив'язки транзакцій і редагування ціни у договорі
  if (dbeDog.DataSource.DataSet.FieldByName('Sub_type').AsInteger in [100, 101]) and (qDogDetail.State = dsEdit) then
    if 0 < nvl(GetSqlValueParSimple(
      'select count(dog_id) from card_transaction where dog_id = :dog_id and dog_inst = :dog_inst',
      ['dog_id',   dbeDog.DataSource.DataSet.FieldByName('id').AsInteger,
       'dog_inst', dbeDog.DataSource.DataSet.FieldByName('inst').AsInteger]), 0) then
    begin
      qDogDetail.CancelUpdates;
      raise Exception.Create(TranslateText('Нельзя менять цену в договоре, к которому привязаны транзакции!'));
    end;

  if not ChangeFlag then
  begin
    ChangeFlag := True;
    qDogDetail.FieldByName('PRICE2').AsFloat :=
      MRound(GetWithNDS_NoNDS(qDogDetail.FieldByName('PRICE').AsFloat,dbdeDogDate.Date), 2);
    CalcDetail();
    ActiveDog();
    ChangeFlag := False;
  end;
end;
//==============================================================================
procedure TDogForm.qDogDetailPRICE2Change(Sender: TField);
begin
  if (IsDogDependFromNN) and (qDogDetail.State = dsEdit) and (qDogDetailSUM_NN.AsFloat > 0) then
  begin
    qDogDetail.CancelUpdates;
    raise Exception.Create(TranslateText('Нельзя менять цену нефтепродукта, по которому была выписана налоговая накладная!'));
  end;

  // перевірка прив'язки транзакцій і редагування ціни у договорі
  if (dbeDog.DataSource.DataSet.FieldByName('Sub_type').AsInteger in [100, 101]) and (qDogDetail.State = dsEdit) then
    if 0 < nvl(GetSqlValueParSimple(
      'select count(dog_id) from card_transaction where dog_id = :dog_id and dog_inst = :dog_inst',
      ['dog_id',   dbeDog.DataSource.DataSet.FieldByName('id').AsInteger,
       'dog_inst', dbeDog.DataSource.DataSet.FieldByName('inst').AsInteger]), 0) then
    begin
      qDogDetail.CancelUpdates;
      raise Exception.Create(TranslateText('Нельзя менять цену в договоре, к которому привязаны транзакции!'));
    end;

  if not ChangeFlag then
  begin
    ChangeFlag := True;
    if (lMode.Caption = IsTalon) or (lMode.Caption = IsCard) then
      qDogDetail.FieldByName('PRICE').AsFloat :=
        MRound(GetNoNDS_WithNDS(qDogDetail.FieldByName('PRICE2').AsFloat,dbdeDogDate.Date), 6)
    else
      qDogDetail.FieldByName('PRICE').AsFloat :=
        MRound(GetNoNDS_WithNDS(qDogDetail.FieldByName('PRICE2').AsFloat,dbdeDogDate.Date), 4);
    CalcDetail();
    ActiveDog();
    ChangeFlag := False;
  end;
end;
//==============================================================================
procedure TDogForm.qDogServicePRICEChange(Sender: TField);
begin
  if (IsDogDependFromNN) and (qDogService.State = dsEdit) and (qDogServiceSUM_NN.AsFloat > 0) then
  Begin
    qDogService.CancelUpdates;
    raise Exception.Create(TranslateText('Нельзя менять цену услуги, по которой была выписана налоговая накладная!'));
  End;

  if not ChangeFlag then
  begin
    ChangeFlag := True;
    qDogService.FieldByName('PRICE2').AsFloat :=
      MRound(GetWithNDS_NoNDS(qDogService.FieldByName('PRICE').AsFloat,dbdeDogDate.Date), 2);
    CalcService();
    ChangeFlag := False;
  end;
end;
//==============================================================================
procedure TDogForm.qDogServicePRICE2Change(Sender: TField);
begin
  if (IsDogDependFromNN) and (qDogService.State = dsEdit) and (qDogServiceSUM_NN.AsFloat > 0) then
  begin
    qDogService.CancelUpdates;
    raise Exception.Create(TranslateText('Нельзя менять цену услуги, по которой была выписана налоговая накладная!'));
  end;

  if not ChangeFlag then
  begin
    ChangeFlag := True;
    if (lMode.Caption = IsService) then
      qDogService.FieldByName('PRICE').AsFloat :=
        MRound(GetNoNDS_WithNDS(qDogService.FieldByName('PRICE2').AsFloat,dbdeDogDate.Date), 6)
    else
      qDogService.FieldByName('PRICE').AsFloat :=
        MRound(GetNoNDS_WithNDS(qDogService.FieldByName('PRICE2').AsFloat,dbdeDogDate.Date), 4);
    CalcService();
    ChangeFlag := False;
  end;
end;
//==============================================================================
procedure TDogForm.qDogDetailCOUNT_Change(Sender: TField);
begin
  if (IsDogDependFromNN) and (qDogDetail.State = dsEdit) and (qDogDetailSUM_NN.AsFloat > 0) then
    if(Fround(qDogDetailCOUNT_.AsFloat * qDogDetailPRICE2.AsFloat, 2) < qDogDetailSUM_NN.AsFloat) then
    begin
      qDogDetail.CancelUpdates;
      raise Exception.Create(TranslateText('Нельзя менять количество нефтепродукта на меньшее, чем в уже выписаной налоговой накладной!'));
    end;
  CalcDetail();
end;
//==============================================================================
procedure TDogForm.qDogServiceCOUNT_Change(Sender: TField);
begin
  if (IsDogDependFromNN) and (qDogService.State = dsEdit) and (qDogServiceSUM_NN.AsFloat > 0) then
    if(Fround(qDogServiceCOUNT_.AsFloat * qDogServicePRICE2.AsFloat, 2) < qDogServiceSUM_NN.AsFloat) then
    begin
      qDogService.CancelUpdates;
      raise Exception.Create(TranslateText('Нельзя менять количество по услуги на меньшее, чем в уже выписаной налоговой накладной!'));
    end;
  CalcService();
end;
//==============================================================================
procedure TDogForm.CalcService();
begin
  if not bFormActive then exit;
  qDogService.FieldByName('SUMM_X_NDS').AsFloat :=
    FRound(qDogService.FieldByName('Price').AsFloat * qDogService.FieldByName('Count_').AsFloat, 2);
  qDogService.FieldByName('SUMM_NDS').AsFloat :=
    Fround(qDogService.FieldByName('Price').AsFloat * qDogService.FieldByName('Count_').AsFloat, 2) +
    FRound(qDogService.FieldByName('Price').AsFloat * TAX_RATE(dbdeDogDate.Date) *
    qDogService.FieldByName('Count_').AsFloat, 2);
end;
//==============================================================================
procedure TDogForm.CalcDetail();
begin
  if not bFormActive then exit;
  if (dbceShare.DataSource.DataSet.FieldByName('SHARE_ID').AsVariant = null) then
  begin
    if lMode.Caption = isOpt then
    begin
      qDogDetail.FieldByName('SUMM_X_NDS').AsFloat :=
        Mround(qDogDetail.FieldByName('Price').AsFloat * qDogDetail.FieldByName('Count_').AsFloat, 2);
      qDogDetail.FieldByName('SUMM_NDS').AsFloat :=
        MRound(qDogDetail.FieldByName('Price').AsFloat * qDogDetail.FieldByName('Count_').AsFloat, 2) +
        MRound(qDogDetail.FieldByName('Price').AsFloat * TAX_RATE(dbdeDogDate.Date) *
        qDogDetail.FieldByName('Count_').asFloat, 2);
    end
    else
    begin
      qDogDetail.FieldByName('SUMM_X_NDS').AsFloat :=
        MRound(
          Fround(qDogDetail.FieldByName('Price2').AsFloat * qDogDetail.FieldByName('Count_').AsFloat, 2) -
          FRound(qDogDetail.FieldByName('Price2').AsFloat * TAX_RATE(dbdeDogDate.Date)/(1+TAX_RATE(dbdeDogDate.Date))*
          qDogDetail.FieldByName('Count_').AsFloat, 2), 2);
      qDogDetail.FieldByName('SUMM_NDS').AsFloat :=
        FRound(qDogDetail.FieldByName('Price2').AsFloat * qDogDetail.FieldByName('Count_').AsFloat, 2);
    end;
  end;
end;
//==============================================================================
procedure TDogForm.FormCreate(Sender: TObject);
begin
  inherited;
  bFormActive := false;
end;
//==============================================================================
procedure TDogForm.rbForePayYesClick(Sender: TObject); // Передвиплата
begin
  if dbeDog.DataSource.DataSet.State = dsBrowse then dbeDog.DataSource.DataSet.Edit;
  dbeDog.DataSource.DataSet.FieldByName('ForePay').AsInteger := 1; 
  ActiveDog();
end;
//==============================================================================
procedure TDogForm.rbForePayNoClick(Sender: TObject); // Післявиплата
begin
  if dbeDog.DataSource.DataSet.State = dsBrowse then dbeDog.DataSource.DataSet.Edit;
  dbeDog.DataSource.DataSet.FieldByName('ForePay').AsInteger := 0; 
  ActiveDog();
end;
//==============================================================================
procedure TDogForm.rbLSClick(Sender: TObject); // Лімітна схема
begin
  if rbEK.Checked then rbForePayYes.Checked := true;
  gbForePay.Enabled := not rbEK.Checked;
  if dbeDog.DataSource.DataSet.State = dsBrowse then dbeDog.DataSource.DataSet.Edit;
  dbeDog.DataSource.DataSet.FieldByName('Sub_type').AsInteger := 101;
  ActiveDog();
end;
//==============================================================================
procedure TDogForm.rbEKClick(Sender: TObject); // ЕК
begin
  if rbEK.Checked then rbForePayYes.Checked := true;
  gbForePay.Enabled := not rbEK.Checked;
  if dbeDog.DataSource.DataSet.State = dsBrowse then dbeDog.DataSource.DataSet.Edit;
  dbeDog.DataSource.DataSet.FieldByName('Sub_Type').AsInteger := 100;
  ActiveDog();
end;
//==============================================================================

end.
