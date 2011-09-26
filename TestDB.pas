unit TestDB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, Grids, DBGrids, RXDBCtrl, ComCtrls,
  ExtCtrls, RXCtrls, ToolEdit, Excel8TLB, ComObj, ActiveX, Mask, MemDS,
  DBAccess, Ora, uCommonForm, uOilQuery, uOilStoredProc, DBGridEh{$IFDEF VER150},Variants{$ENDIF},
  StrUtils, DBCtrls, DBGridEhGrouping, GridsEh;

type
  TRecordCount = (rcAll, rcBad, rcGood);

  TTestDBForm = class(TCommonForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    RxDBGrid1: TDbGridEh;
    QNb_Azs: TOilQuery;
    DsNB_Azs: TOraDataSource;
    QNb_AzsDOG: TStringField;
    QNb_AzsDATE_: TDateTimeField;
    QNb_AzsSUB_PART: TStringField;
    QNb_AzsPPON_NAME: TStringField;
    QNb_AzsAZS_NAME: TStringField;
    BtnRefresh: TBitBtn;
    BtnPrint: TBitBtn;
    LRecordCount: TLabel;
    Label2: TLabel;
    TabSheet2: TTabSheet;
    QDensity: TOilQuery;
    DsDensity: TOraDataSource;
    dbgDensity: TDBGridEh;
    BtnExit: TBitBtn;
    Label1: TLabel;
    QNb_AzsPRIH_TONN: TFloatField;
    QNb_AzsDELIV_TONN: TFloatField;
    TabSheet4: TTabSheet;
    RxDBGrid4: TDbGridEh;
    Label4: TLabel;
    QPricesAZS: TOilQuery;
    DsPricesAZS: TOraDataSource;
    QPricesAZSAZS_NAME: TStringField;
    QPricesAZSREP_DATE: TDateTimeField;
    QPricesAZSSMENA_NUM: TFloatField;
    QPricesAZSSUB_PART: TStringField;
    QPricesAZSPRICE: TFloatField;
    QNalNumber: TOilQuery;
    DsNalNumber: TOraDataSource;
    QNalNumberS_DATE: TDateTimeField;
    QNalNumberORGAN_NAME: TStringField;
    QNalNumberNUM: TStringField;
    TabTalon: TTabSheet;
    qDateSN: TOilQuery;
    qOutEmission: TOilQuery;
    qOutEmissionSER: TStringField;
    qOutEmissionNUM: TFloatField;
    qBadNominal: TOilQuery;
    qBadNominalSER: TStringField;
    qBadNominalNUM: TFloatField;
    qBadSer: TOilQuery;
    qBadSerSER: TStringField;
    qSRTalon: TOilQuery;
    qTreeOut: TOilQuery;
    qTreeOutFILIAL: TStringField;
    qTreeOutSER: TStringField;
    qTreeOutNUM: TFloatField;
    qFilOAO: TOilQuery;
    dsTalon: TOraDataSource;
    rgTalon: TRadioGroup;
    dbgTalon: TDbGridEh;
    mGuideTalon: TMemo;
    bbGuideTalon: TBitBtn;
    qDateSNTTYPE: TStringField;
    qDateSNFILIAL: TStringField;
    qDateSNPRIH_DATE: TDateTimeField;
    qDateSNSER: TStringField;
    qDateSNNUM: TFloatField;
    QAzs_Nb: TOilQuery;
    DSAzs_NB: TOraDataSource;
    TabSheet7: TTabSheet;
    dbgAzs_NB: TDBGridEh;
    Label6: TLabel;
    TabSheet8: TTabSheet;
    Panel1: TPanel;
    Memo: TMemo;
    Panel2: TPanel;
    bbLostNumNN: TBitBtn;
    bbLostNumTTN: TBitBtn;
    QNalAbsent: TOilQuery;
    QNalAbsentCO: TFloatField;
    QNalAbsentNUMB: TStringField;
    QTTNAbsent: TOilQuery;
    Panel3: TPanel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    CEOrg: TComboEdit;
    RxLabel1: TRxLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    QNalDouble: TOilQuery;
    QTTNDouble: TOilQuery;
    QNalDoubleCO: TFloatField;
    QNalDoubleNUMB: TStringField;
    QTTNDoubleCO: TFloatField;
    QTTNDoubleNUMB: TStringField;
    bbDoubleNumNN: TBitBtn;
    bbDoubleNumTTN: TBitBtn;
    qBadMove: TOilQuery;
    bbPrintTalon: TBitBtn;
    qBadMovePRIH_ORG: TStringField;
    qBadMovePRIH_DATE: TDateTimeField;
    qBadMoveSER: TStringField;
    qBadMoveNUM: TFloatField;
    qBadMoveOUT_ORG: TStringField;
    qBadMoveOUT_DATE: TDateTimeField;
    TabSheet9: TTabSheet;
    RxDBGrid9: TDbGridEh;
    QAuto: TOilQuery;
    QAutoDATE_: TDateTimeField;
    QAutoSMENA_NUM: TFloatField;
    QAutoFROM_NAME: TStringField;
    QAutoDOG: TStringField;
    dsAuto: TOraDataSource;
    qSRTalonTITLE: TStringField;
    qSRTalonFILIAL: TStringField;
    qSRTalonAZS: TStringField;
    qSRTalonREP_DATE: TDateTimeField;
    qSRTalonSMENA_NUM: TFloatField;
    qSRTalonSER: TStringField;
    qSRTalonNUM: TFloatField;
    qSRTalonNOMINAL: TFloatField;
    TabCard: TTabSheet;
    qCardSR: TOilQuery;
    dbgCard: TDbGridEh;
    BitBtn7: TBitBtn;
    qTalonChDiag: TOilQuery;
    qTalonHistory: TOilQuery;
    eSer: TEdit;
    Label5: TLabel;
    qTreeOutBEGIN_DATE: TDateTimeField;
    qTreeOutEND_DATE: TDateTimeField;
    rgCard: TRadioGroup;
    dsCard: TOraDataSource;
    qCardSRTITLE: TStringField;
    qCardSRFILIAL_NAME: TStringField;
    qCardSRAZS_NAME: TStringField;
    qCardSRNP_NAME: TStringField;
    qCardSRLITR: TFloatField;
    qCardClient: TOilQuery;
    qCardTerm: TOilQuery;
    qCardOver: TOilQuery;
    qCardOverCARD_NUMBER: TFloatField;
    qCardOverOPER_DATE: TDateTimeField;
    qCardDouble: TOilQuery;
    qCardDoubleTITLE: TStringField;
    qCardDoubleQUANTITY: TFloatField;
    qCardDoubleCARD_NUMBER: TFloatField;
    qCardOverLITR: TFloatField;
    bbPrintCard: TBitBtn;
    mGuideCard: TMemo;
    bbGuideCard: TBitBtn;
    qPetrol: TOilQuery;
    qCardAuto: TOilQuery;
    qCardRest: TOilQuery;
    qCardId: TOilQuery;
    qCardAutoFILIAL: TStringField;
    qCardAutoCARD_NUMBER: TFloatField;
    qCardAutoOPER_DATE: TDateTimeField;
    qCardRestCARD_NUMBER: TFloatField;
    qCardRestNP_TYPE: TStringField;
    qCardRestPETROL_REST: TFloatField;
    qCardRestOIL_REST: TFloatField;
    QWayBill: TOilQuery;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    rbAuto1: TRadioButton;
    rbAuto2: TRadioButton;
    QWayBillNAME: TStringField;
    QWayBillNUMB: TStringField;
    QWayBillAUTO_MODEL: TStringField;
    QWayBillWAYBILLNUMB: TStringField;
    QWayBillWAYBILLDATE: TDateTimeField;
    Label10: TLabel;
    pnlAutoDate: TGroupBox;
    Label13: TLabel;
    dateWayBill: TDateEdit;
    Label14: TLabel;
    dateWayBill2: TDateEdit;
    deBegin: TDateEdit;
    Label15: TLabel;
    qTalonText: TOilQuery;
    qCardText: TOilQuery;
    qBadSerNUM: TFloatField;
    bbRefreshTalon: TBitBtn;
    bbRefreshCard: TBitBtn;
    lblBeginT: TLabel;
    lblBeginC: TLabel;
    qCardPC: TOilQuery;
    grbOrg: TGroupBox;
    cmeOrg: TComboEdit;
    sbClearOrg: TSpeedButton;
    qCheck: TOilQuery;
    qSetFallingDate: TOilQuery;
    qCardClientDEMO: TOilQuery;
    qCardTermDEMO: TOilQuery;
    qCardRestDEMO: TOilQuery;
    qCardIdDEMO: TOilQuery;
    qCardRestDEMOCARD_NUMBER: TFloatField;
    qCardRestDEMONP_TYPE: TStringField;
    qCardRestDEMOPETROL_REST: TFloatField;
    qCardRestDEMOOIL_REST: TFloatField;
    qCardLostPack: TOilQuery;
    qCardClientTO_ID: TFloatField;
    qCardClientTO_INST: TFloatField;
    qCardClientOPER_DATE: TDateTimeField;
    qCardClientCARD_NUMBER: TFloatField;
    qCardClientNP_TYPE: TStringField;
    qCardIdTITLE: TStringField;
    qCardIdID: TStringField;
    qCardIdCARD_NUMBER: TFloatField;
    qCardIdOPER_DATE: TDateTimeField;
    qCardIdNP_NAME: TStringField;
    qCardIdLITR: TFloatField;
    qCardPCTITLE: TStringField;
    qCardPCGDE: TFloatField;
    qCardPCOIL_DATE: TDateTimeField;
    qCardPCCARD_NUMBER: TFloatField;
    qCardPCNP: TFloatField;
    qCardPCPURSE: TFloatField;
    qCardPCCOUNT_LITR: TFloatField;
    qCardPCCOUNT_PURSE: TFloatField;
    qCardPCPRICE_NDS: TFloatField;
    qCardPCTERM_NUMBER: TFloatField;
    qCardDoubleOPER_DATE: TDateTimeField;
    qCardLostPackNUMPACK_FROM: TFloatField;
    qCardLostPackNUMPACK_TO: TFloatField;
    qCardLostPackCOUNTNOTEXIST: TFloatField;
    qCardDoubleOPER_DATE_: TDateTimeField;
    qTreePrih: TOilQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    qFilOAOTIP: TStringField;
    qFilOAOSER: TStringField;
    qFilOAONUM: TFloatField;
    qFilOAODEP_NAME: TStringField;
    qFilOAOPREV_DEP_NAME: TStringField;
    qFilOAODATE_: TDateTimeField;
    qFilOAOPREV_DATE: TDateTimeField;
    qCardTermAZS_ID: TFloatField;
    qCardTermOPER_NUM: TFloatField;
    qCardTermOPER_DATE: TDateTimeField;
    qCardTermCARD_NUMBER: TFloatField;
    qCardTermNP_TYPE: TFloatField;
    qCardTermLITR: TFloatField;
    qBadSerDEP_NAME: TStringField;
    qBadSerTIP: TStringField;
    qTreeOutPREV_FILIAL: TStringField;
    qTreePrihPREV_FILIAL: TStringField;
    qOutEmissionDATE_: TStringField;
    qCardSRREP_DATE_: TDateTimeField;
    qBadNominalDATE_: TDateTimeField;
    qBadSerDATE_: TDateTimeField;
    qCardPCDATE_MOD: TDateTimeField;
    qCardPCCOUNT_: TFloatField;
    qCardLostPackFil: TOilQuery;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    qCardIdFil: TOilQuery;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField5: TFloatField;
    DateTimeField3: TDateTimeField;
    StringField5: TStringField;
    FloatField6: TFloatField;
    qCardRestFil: TOilQuery;
    FloatField7: TFloatField;
    StringField6: TStringField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    qCardRestFilCARD_USER: TStringField;
    qCardIdFilCARD_USER: TStringField;
    qCardLostPackFilPC: TStringField;
    TabBlank: TTabSheet;
    dbgBlank: TDBGridEh;
    Label16: TLabel;
    bbRefreshBlank: TBitBtn;
    bbPrintBlank: TBitBtn;
    BitBtn8: TBitBtn;
    dsBlank: TOraDataSource;
    qBlank: TOilQuery;
    qLoadBlankCheck: TOilQuery;
    rgBlank: TRadioGroup;
    qCardOP: TOilQuery;
    qCardOPGR_NOMER: TFloatField;
    qCardOPDATA_SOZDANIA: TDateTimeField;
    qCardOPDATA_NACHALA: TDateTimeField;
    qCardOPDATA_OKONCHANIA: TDateTimeField;
    qCardOPDATA_OBSL: TDateTimeField;
    qCardOPSUMMA_ZA_CHTO: TFloatField;
    qCardOPDESC_: TStringField;
    qCardOPFil: TOilQuery;
    qCardOPFilDESC_: TStringField;
    qCardOPFilGR_NOMER: TFloatField;
    qCardOPFilDATA_SOZDANIA: TDateTimeField;
    qCardOPFilDATA_NACHALA: TDateTimeField;
    qCardOPFilDATA_OKONCHANIA: TDateTimeField;
    qCardOPFilDATA_OBSL: TDateTimeField;
    qCardOPFilSUMMA_ZA_CHTO: TFloatField;
    qCardOPFilCARD_USER: TStringField;
    procedure BtnRefreshClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure rgTalonClick(Sender: TObject);
    procedure bbGuideTalonClick(Sender: TObject);
    procedure bbLostNumNNClick(Sender: TObject);
    procedure bbLostNumTTNClick(Sender: TObject);
    procedure CEOrgButtonClick(Sender: TObject);
    procedure bbDoubleNumNNClick(Sender: TObject);
    procedure bbDoubleNumTTNClick(Sender: TObject);
    procedure bbPrintTalonClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure rgCardClick(Sender: TObject);
    procedure bbPrintCardClick(Sender: TObject);
    procedure bbGuideCardClick(Sender: TObject);
    procedure rbAuto2Click(Sender: TObject);
    procedure rbAuto1Click(Sender: TObject);
    procedure dateWayBillChange(Sender: TObject);
    procedure dateWayBill2Change(Sender: TObject);
    procedure QWayBillAfterClose(DataSet: TDataSet);
    procedure deBeginChange(Sender: TObject);
    procedure cmeOrgButtonClick(Sender: TObject);
    procedure sbClearOrgClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    // Устанавливает SILENCE_PERIOD,DATE_FLD, должно стоять на BeforeOpen в талоных и карточных кверях
    procedure PutBeginDateParam(DataSet: TDataSet);
    procedure rgBlankClick(Sender: TObject);
    procedure bbRefreshBlankClick(Sender: TObject);
  private
    DATE_FLD: string; //Поле типа дата в проверке
    SILENCE_PERIOD: integer; // кол-во допустимых дней для проверки
    (** В связи с непонятками фильтров добавляем свой подщет "плохих" записей *)
    function GetRecordCount(RCType: TRecordCount = rcAll): integer;
    procedure OpenTesTOilQuery(q: TOilQuery); // Просто открывает кверю
    (** Сохраняет результаты проверок *)
    procedure SaveCheckupResult(CheckUp_ID: integer; CreationDate, ErrDate: TDateTime; ErrCount: Integer);
    (** Открывает кверю и устанавливает параметры дат и  *)
    procedure ActivateSpecialQ(var q: TOilQuery);
    function RaznoeTest: Boolean; // чегото тестирует
    (** Начальные установки *)
    procedure DefineAll(p_DBGrid: TDbGridEh; Page: integer; head: string);
    (** Исчет пропуски в номерах *)
    procedure SearchNull(TheQuery: TOilQuery; IDField: string; TheMemo: TMemo);
    (** Определение текущего Checkup_Id *)
    function GetCheckupId():integer;
    function GetSqlId():integer;
  public
  end;

var
  TestDBForm: TTestDBForm;

implementation

uses ExcelFunc, ExFunc, Main, ChooseOrg, UDBFunc, uTalonPriceReport, OilStd, PrihCardRef, uCrypt,
  uXMLForm, uExeSql, uCheckups;

var
  CurrentDBGrid: TDbGridEh;
  CurrentHead: string;
  CurrentPage: integer;
  DigitalColumns: array[1..15] of string = ('prih_tonn;deliv_tonn', 'pr_ud_weig;ud_weig', 'tonn;rasch_tonn', 'price', 'num',
    '', '', '', '', '', '', '', '', 'count_;pr_count', '');

{$R *.DFM}

//==============================================================================
procedure ComputeBugsOfLastCheckUps(var Cnt: integer; var BDate: TDateTime);
var
  q: TOilQuery;
  CrtDate, ErrDate, ErrCnt: string;
begin
  q := TOilQuery.Create(nil);
  // Выбираем из таблицы последние результаты запуска набора актуальных проверок
  q.SQL.Text := 'select * from oil_checkup_result A,' +
    ' (select checkup_id, max(id) as ID from oil_checkup_result' +
    ' where inst = ' + IntToStr(REAL_INST) + ' and instr('',' + CH_AUDIT_LIST + ','','',''||checkup_id||'','')<>0' +
    ' group by checkup_id) B' +
    ' where A.checkup_id = B.checkup_id and A.id=B.id';
  q.Open;
  Cnt := 0;
  BDate := 0;
  // Пробегаем по всем проверкам, расшифровываем результаты, суммируем кол-во
  // и ищем минимальную дату
  while not q.Eof do
  begin
    CrtDate := Decrypt(crtTestLaunch,
      [q.FieldByName('Crt_date').AsString,
      q.FieldByName('Inst').Value,
        q.FieldByName('CheckUp_ID').Value,
        0]);
    ErrDate := Decrypt(crtTestLaunch,
      [q.FieldByName('Err_date').AsString,
      q.FieldByName('Inst').AsString,
        q.FieldByName('CheckUp_ID').AsString,
        StrToDateTime(CrtDate)]);
    ErrCnt := Decrypt(crtTestLaunch,
      [q.FieldByName('Err_count').AsString,
      q.FieldByName('Inst').AsString,
        q.FieldByName('CheckUp_ID').AsString,
        StrToDateTime(CrtDate)]);
    if (StrToDateTime(ErrDate) <> 0) and (BDate = 0) then
      BDate := StrToDateTime(ErrDate);
    if StrToDateTime(ErrDate) = 0 then
      Cnt := Cnt + StrToInt(ErrCnt)
    else
      if StrToDateTime(ErrDate) < BDate then
        BDate := StrToDateTime(ErrDate);
    q.Next;
  end;
end;
//==============================================================================
procedure StoreBugsCount(Cnt: integer);
begin
  CH_BUGS_COUNT := Cnt;
  StartSQL;
  SimpleWriteOilVar('CH_BUGS_COUNT', '#' + Encrypt(crtTestLaunch, [IntToStr(Cnt)]));
  if (Cnt = 0) and (CH_TALON_LEVEL = 1) then
  begin
    CH_TALON_LEVEL := 2;
    SimpleWriteOilVar('CH_TALON_LEVEL', '#' + Encrypt(crtTestLaunch, [IntToStr(CH_TALON_LEVEL)]));
  end;
  CommitSQL;
end;
//==============================================================================
procedure StoreBugsDate(D: TDateTime);
begin
  CH_FIRST_BUG_DATE := FormatDateTime('dd.mm.yyyy', D);
  StartSQL;
  SimpleWriteOilVar('CH_FIRST_BUG_DATE', '#' + Encrypt(crtTestLaunch, [CH_FIRST_BUG_DATE]));
  if (D > GetSystemDate - CH_SILENCE_PERIOD) and (CH_CARD_LEVEL = 1) then
  begin
    CH_CARD_LEVEL := 0;
    SimpleWriteOilVar('CH_CARD_LEVEL', '#' + Encrypt(crtTestLaunch, [IntToStr(CH_CARD_LEVEL)]));
  end;
  CommitSQL;
end;
//==============================================================================
procedure SetBlockTimer(Mode: string);
var
  PieceOfMess: string;
begin
  StartSQL;
  if (Mode = 'Y') and (CH_FLAG_COUNTER = 'N') then
  begin
    if CH_TALON_LEVEL = 2 then PieceOfMess := TranslateText('увеличилось')
    else PieceOfMess := TranslateText('не уменьшилось');
    SimpleWriteOilVar('CH_CRITICAL_DATE', '#' + Encrypt(crtTestLaunch, [FormatDateTime('dd.mm.yyyy', GetSystemDate)]));
    Application.MessageBox(PChar(TranslateText('С момента последнего построения проверок количество нарушений ') + PieceOfMess +
      #13#10 + TranslateText('У Вас есть ') + IntToStr(CH_CORRECTION_PERIOD) + TranslateText(' дней на исправление ситуации.') +
      #13#10 + TranslateText('Исправьте ошибки и постройте еще раз проверки.')), '', MB_OK + MB_ICONWARNING);
  end;
  CH_FLAG_COUNTER := Mode;
  SimpleWriteOilVar('CH_FLAG_COUNTER', '#' + Encrypt(crtTestLaunch, [CH_FLAG_COUNTER]));
  CommitSQL;
end;
//==============================================================================
procedure CheckUpBugsControl;
var
  Cnt: integer;
  BDate: TDateTime;
  TalonIsGood: boolean;
begin
  ComputeBugsOfLastCheckUps(Cnt, BDate);
  if CH_BUGS_COUNT = -1 then
    StoreBugsCount(Cnt);

  if (CH_FIRST_BUG_DATE = '01.01.1900') and (BDate <> 0) then
    StoreBugsDate(BDate);

  if (CH_TALON_LEVEL = 0) and (Cnt = 0) or
    (CH_TALON_LEVEL = 1) and (Cnt < CH_BUGS_COUNT) or
    (CH_TALON_LEVEL = 2) and (Cnt <= CH_BUGS_COUNT) then
  begin
    StoreBugsCount(Cnt);
    TalonIsGood := True;
  end
  else
  begin
    SetBlockTimer('Y');
    TalonIsGood := False;
  end;

  if (CH_CARD_LEVEL = 0) and (BDate > GetSystemDate - CH_SILENCE_PERIOD) or
    (CH_CARD_LEVEL = 1) and (BDate > StrToDateTime(CH_FIRST_BUG_DATE)) or
    (CH_CARD_LEVEL = 2) and (BDate >= StrToDateTime(CH_FIRST_BUG_DATE)) then
  begin
    StoreBugsDate(BDate);
    if TalonIsGood and (CH_FLAG_COUNTER = 'Y') then
      SetBlockTimer('N');
  end
  else SetBlockTimer('Y');
end;
//==============================================================================
procedure TTestDBForm.SaveCheckupResult(CheckUp_ID: integer; CreationDate, ErrDate: TDateTime; ErrCount: Integer);
var
  qIns: TOilQuery;
  pCHECKUP_ID, pCTR_DATE, pERR_DATE, pERR_COUNT: string;
begin
  if (CheckUp_ID in [14, 20, 22, 23, 25, 28]) and (deBegin.Tag = 1) then
    Exit;
  // В таблицу заносим:
  // id,inst,CheckUp_ID - в чистом виде
  // CreationDate - EnCoder(inst,CheckUp_ID)
  // ErrDate и ErrCount - EnCoder(inst,CheckUp_ID,CreationDate)
  try
    StartSQL;
    pCHECKUP_ID := IntToStr(CheckUp_ID);
    pCTR_DATE := Encrypt(crtTestLaunch, [FormatDateTime('dd.mm.yyyy hh:nn:ss', CreationDate), IntToStr(REAL_INST), pCheckUp_ID, 0]);
    pERR_DATE := Encrypt(crtTestLaunch, [FormatDateTime('dd.mm.yyyy hh:nn:ss', ErrDate), IntToStr(REAL_INST), pCheckUp_ID, CreationDate]);
    pERR_COUNT := Encrypt(crtTestLaunch, [IntToStr(ErrCount), IntToStr(REAL_INST), pCheckUp_ID, CreationDate]);

    qIns := TOilQuery.Create(nil);
    qIns.SQL.Text := 'insert into OIL_CHECKUP_RESULT(id,inst,checkup_id,crt_date,err_date,err_count)' +
      'values (s_oil_checkup_result.nextval,' + IntToStr(REAL_INST) + ',''' + IntToStr(CheckUp_ID) + ''',''' +
      pCTR_DATE + ''',''' + pERR_DATE + ''',''' + pERR_COUNT + ''')';
    qIns.ExecSQL;
    CheckupStatus.UpdateChecksum('OIL_CHECKUP_RESULT', stBDE);
    CommitSQL;
  except on E: Exception do
    begin
      RollbackSQL;
      ShowMessage(TranslateText('Ошибка: ') + E.Message);
    end
  end;
end;
//==============================================================================
procedure TTestDbForm.OpenTesTOilQuery(q: TOilQuery);
begin
  _OpenQuery(q);
end;
//==============================================================================
procedure TTestDBForm.BtnRefreshClick(Sender: TObject);
var
  CheckUp_ID, CardUserCnt: Integer;
begin
  StartLog('*****************************');
  StartLog(TranslateText('точка входа TestDB.BtnRefresh'));
  // Обределение номера проверки
  //----------------------------
  CheckUp_ID := 0;
  if PageControl1.ActivePage = TabTalon then
    CheckUp_ID := StrToInt('1' + IntToStr(rgTalon.ItemIndex))
  else if PageControl1.ActivePage = TabCard then
    CheckUp_ID := StrToInt('2' + IntToStr(rgCard.ItemIndex))
  else if PageControl1.ActivePage = TabBlank then
    CheckUp_ID := GetCheckupId();


  StartLog('CheckUp_ID = ' + IntToStr(CheckUp_ID));

  // Начало особеностей разных проверок
  //-----------------------------------
  if(CurrentDBGrid.DataSource.DataSet = qCardClient) or
    (CurrentDBGrid.DataSource.DataSet = qCardTerm) or
    (CurrentDBGrid.DataSource.DataSet = qCardRest) or
    (CurrentDBGrid.DataSource.DataSet = qCardLostPack) or
    (CurrentDBGrid.DataSource.DataSet = qCardId) or
    (CurrentDBGrid.DataSource.DataSet = qCardOP) then
  begin
    if not DBObjectExists('ECFIL139','TABLE',AdmSettings.Get('CARD_USER')) then
      if not DBObjectExists('ТРАНЗАКЦИИ', '') then
      begin
          // Если выполняются 5 проверок с участием ДЕМО, а самого ДЕМЫ нету
          // то записать пустые результаты
        StartLog(TranslateText('Петрол не обнаружен, запись пустых результатов и выход'));
        if CheckUp_ID = 25 then SaveCheckupResult(CheckUp_ID, GetSystemDate, GetSystemDate, 0)
        else SaveCheckupResult(CheckUp_ID, GetSystemDate, 0, 0);
        Exit;
      end;

    if not DBObjectExists('ECFIL139','TABLE',AdmSettings.Get('CARD_USER')) then
    begin
      StartLog(TranslateText('Нет таблиц Petrol5, взять старые запросы'));
      qCardRest.SQL.Text := qCardRestDEMO.SQL.Text;
      qCardId.SQL.Text := qCardIdDEMO.SQL.Text;
      qCardTerm.SQL.Text := qCardTermDEMO.SQL.Text;
      qCardClient.SQL.Text := qCardClientDEMO.SQL.Text;
    end
    else
    begin
      CardUserCnt:=GetSqlValue(' select count(*) from (select owner from all_objects where object_name like ''CARD_DUMP%'' and object_type=''TRIGGER'' and owner<>''DEMO''group by owner) ');
      case CardUserCnt of
        0,1:;
        2:
        begin
          qCardRest := qCardRestFil;
          qCardId := qCardIdFil;
          qCardLostPack := qCardLostPackFil;
          qCardOP := qCardOPFil;
        end;
        else
        begin
          qCardRest := qCardRestFil;
          qCardId := qCardIdFil;
          qCardLostPack := qCardLostPackFil;
          qCardRest.SQL.Text := AnsiReplaceText(qCardRest.SQL.Text,'magicash5fil',AdmSettings.Get('CARD_USER_FIL'));
          qCardRest.SQL.Text := AnsiReplaceText(qCardRest.SQL.Text,'magicash5',AdmSettings.Get('CARD_USER'));
          qCardId.SQL.Text := AnsiReplaceText(qCardId.SQL.Text,'magicash5fil',AdmSettings.Get('CARD_USER_FIL'));
          qCardId.SQL.Text := AnsiReplaceText(qCardId.SQL.Text,'magicash5',AdmSettings.Get('CARD_USER'));
          qCardLostPack.SQL.Text := AnsiReplaceText(qCardLostPack.SQL.Text,'magicash5fil',AdmSettings.Get('CARD_USER_FIL'));
          qCardLostPack.SQL.Text := AnsiReplaceText(qCardLostPack.SQL.Text,'magicash5',AdmSettings.Get('CARD_USER'));
          qCardOP.SQL.Text := AnsiReplaceText(qCardOP.SQL.Text,'magicash5fil',AdmSettings.Get('CARD_USER_FIL'));
          qCardOP.SQL.Text := AnsiReplaceText(qCardOP.SQL.Text,'magicash5',AdmSettings.Get('CARD_USER'));
        end;
      end;
    end;
  end;

  if (CurrentDBGrid.DataSource.DataSet = qCardPC) and not DBObjectExists('CARD_TRANSACTION_PC', '') then
  begin
    // Если запускается проверка на сравнение ПЦ и Оил и нет CARD_TRANSACTION_PC
    // то записать пустые результаты
    StartLog(TranslateText('Нет CARD_TRANSACTION_PC, запись пустых рез-тов и выход'));
    SaveCheckupResult(CheckUp_ID, GetSystemDate, 0, 0);
    Exit;
  end;

  if (CurrentDBGrid.DataSource.DataSet = qCardPC) and (GetSQLValue('select count(*) from card_transaction') = 0) then
  begin
    // Если запускается проверка на базе где нет транзакций,
    // то записать пустые результаты
    StartLog(TranslateText('нет записей в card_transaction, запись пустых результатов, очистка FALL_DATE  и выход'));
    SaveCheckupResult(CheckUp_ID, GetSystemDate, 0, 0);
    StartSQL;
    qSetFallingDate.Prepare;
    qSetFallingDate.ParamByName('p_id').AsInteger := CheckUp_ID;
    qSetFallingDate.ParamByName('p_inst').AsInteger := REAL_INST;
    qSetFallingDate.ParamByName('p_date').AsDateTime := StrToDate('01.01.1999');
    qSetFallingDate.ExecSQL;
    CheckupStatus.UpdateChecksum('OIL_CHECKUPS', stBDE);
    CommitSQL;
    Exit;
  end;
  // Конец особеностей разных проверок
  //----------------------------------

  // Обработка проверок
  //-------------------
  with CurrentDBGrid.DataSource.DataSet do
  begin
    if Active then Close;
    qCheck.Close;
    qCheck.Prepare;
    qCheck.ParamByName('p_id').AsInteger := CheckUp_ID;
    qCheck.ParamByName('p_inst').AsInteger := REAL_INST;
    qCheck.Open;
    StartLog('qCheck.Enabled = ' + qCheck.FieldByName('Enabled').AsString);
    OpenTesTOilQuery(CurrentDbGrid.DataSource.DataSet as TOilQuery);
    if qCheck.FieldByName('Enabled').AsString = 'Y' then
    begin
      if qCheck.FieldByName('falling_date').IsNull then
        SaveCheckupResult(CheckUp_ID, GetSystemDate, 0, GetRecordCount(rcBad))
      else
        SaveCheckupResult(CheckUp_ID,
          GetSystemDate,
          qCheck.FieldByName('falling_date').AsDateTime,
          GetRecordCount(rcBad));
      StartLog('RecordCount = ' + IntToStr(GetRecordCount(rcBad)));
      StartLog('Errors_Allow = ' + qCheck.FieldByName('Errors_allow').AsString);
      StartLog('CheckupStatus.Empty = ' + CheckupStatus.Empty);
      StartLog('qCheck.Falling_Date = ' + qCheck.FieldByName('falling_date').AsString);
      if (GetRecordCount(rcBad) > qCheck.FieldByName('Errors_allow').AsInteger) and
        (Pos(',' + IntToStr(CheckUp_id) + ',', ',' + CheckupStatus.Empty) = 0) then
      begin
        StartLog(TranslateText('Oшибок больше чем допустимо'));
        if qCheck.FieldByName('falling_date').IsNull then
        begin
          StartSQL;
          qSetFallingDate.Prepare;
          qSetFallingDate.ParamByName('p_id').AsInteger := CheckUp_ID;
          qSetFallingDate.ParamByName('p_inst').AsInteger := REAL_INST;
          qSetFallingDate.ParamByName('p_date').AsDateTime := GetSystemDate;
          qSetFallingDate.ExecSQL;
          CheckupStatus.UpdateChecksum('OIL_CHECKUPS', stBDE);
          CommitSQL;
          StartLog(TranslateText('FallingDate is null. Установлен в ') + DateTimeToStr(GetSystemDate));
        end
        else StartLog('FallingDate is not null, do nothing');
      end
      else
      begin
        StartLog(TranslateText('Oшибок меньше чем допустимо'));
        if not qCheck.FieldByName('falling_date').IsNull then
        begin
          StartSQL;
          qSetFallingDate.Prepare;
          qSetFallingDate.ParamByName('p_id').AsInteger := CheckUp_ID;
          qSetFallingDate.ParamByName('p_inst').AsInteger := REAL_INST;
          qSetFallingDate.ParamByName('p_date').AsDateTime := StrToDate('01.01.1999');
          qSetFallingDate.ExecSQL;
          CheckupStatus.UpdateChecksum('OIL_CHECKUPS', stBDE);
          CommitSQL;
          StartLog(TranslateText('FallingDate is not null. Установлен в ') + '01.01.1999');
        end;
        if (GetRecordCount(rcBad) < qCheck.FieldByName('Errors_allow').AsInteger) then
        begin
          StartSQL;
          _ExecSQL('update oil_checkups set errors_allow=EnCoder(''' +
            IntToStr(GetRecordCount(rcBad)) + ''',inst,id) where id=' +
            IntToStr(CheckUp_ID) + ' and inst=' + IntToStr(REAL_INST));
          CheckupStatus.UpdateChecksum('OIL_CHECKUPS', stBDE);
          CommitSQL;
          StartLog(TranslateText('Актуальное кол-во ошибок меньше чем errors_allow, исправлено'));
        end;
      end;
    end;
    BtnPrint.Enabled := TRUE;
    LRecordCount.Caption := IntToStr(GetRecordCount(rcAll)) + TranslateText(' записей');
  end;
end;
//==============================================================================
procedure TTestDBForm.BtnPrintClick(Sender: TObject);
begin
  PutGridToExcel(CurrentDBGrid, CurrentHead);
end;
//==============================================================================
procedure TTestDBForm.BtnExitClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;
//==============================================================================
procedure TTestDBForm.FormCreate(Sender: TObject);
begin
  inherited;
  LoadSQLByForm(TForm(Self));
  PageControl1.ActivePage := TabSheet1;
  CurrentDBGrid := RXDbGrid1;
  CurrentPage := 1;
  SetCurrentMonth(DateEdit1, DateEdit2);
  if CUT_DATE <> '' then
    if StrToDate(CH_STARTUP_DATE) < StrToDate(CUT_DATE) then
      CH_STARTUP_DATE := CUT_DATE;
  deBegin.Date := StrToDate(CH_STARTUP_DATE);
  if Main.Main_Type = 3 then
  begin
    CEOrg.Text := GetOrgName(Main.Main_Id, Main.Inst);
    CEOrg.Tag := Main.Inst;
  end;

  if Main.Main_Type = 3 then
  begin
    cmeOrg.Text := GetOrgName(Main.Main_Id, Main.Inst);
    cmeOrg.Tag := Main.Inst;
    qWayBill.ParamByName('p_org').Value := Main.Inst;
  end
  else qWayBill.ParamByName('p_org').Value := -1;
  if not MAIN_ORG_IS_FILIAL then
    rgTalon.Items.Delete(rgTalon.Items.Count - 1);
  DefineRepDates(0,0);
end;
//==============================================================================
procedure TTestDBForm.DefineAll(p_DBGrid: TDbGridEh; Page: integer; head: string);
begin
  CurrentDBGrid := p_DBGrid;
  with p_DBGrid.DataSource.DataSet do
  begin
    BtnPrint.Enabled := Active;
    if Active then LrecordCount.Caption := IntToStr(RecordCount) + TranslateText(' записей')
    else LRecordCount.Caption := TranslateText('Нажмите "Обновить"');
  end;
  CurrentHead := head;
  CurrentPage := Page;
end;
//==============================================================================
procedure TTestDBForm.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheet1 then
    DefineAll(RxDbGrid1, 1, Label2.Caption)
  else if PageControl1.ActivePage = TabSheet2 then
    DefineAll(dbgDensity, 2, Label1.Caption)
  else if PageControl1.ActivePage = TabSheet4 then
    DefineAll(RxDbGrid4, 4, Label4.Caption)
  else if PageControl1.ActivePage = TabCard then
    rgCardClick(rgCard)
  else if PageControl1.ActivePage = TabTalon then
    rgTalonClick(rgTalon)
  else if PageControl1.ActivePage = TabSheet7 then
    DefineAll(dbgAzs_NB, 14, Label6.Caption)
  else if PageControl1.ActivePage = TabSheet9 then
    DefineAll(RxDBGrid9, 15, decode([rbAuto1.Checked, TRUE, rbAuto1.Caption + ' ' + label11.Caption + label10.Caption,
      rbAuto2.Caption + ' ' + label12.Caption]))
  else if PageControl1.ActivePage = TabBlank then
  begin
    if qLoadBlankCheck.Active then
      qLoadBlankCheck.Close;
    qLoadBlankCheck.Open;
    qLoadBlankCheck.First;
    rgBlank.Items.Clear;
    while not (qLoadBlankCheck.Eof) do
    begin
      rgBlank.Items.Add(
        DevideRusUkr(qLoadBlankCheck.FieldByName('DESCRIPTION').AsString,true));
      qLoadBlankCheck.Next;
    end;
    rgBlank.Height := rgBlank.ControlCount*18+23;
    rgBlank.ItemIndex := 0;
    DefineAll(dbgBlank, 0, rgBlank.Items[rgBlank.ItemIndex]);
  end;
end;
//==============================================================================
procedure TTestDBForm.rgTalonClick(Sender: TObject);
begin
  case rgTalon.ItemIndex of
    0: dsTalon.DataSet := qTreePrih;
    1: dsTalon.DataSet := qTreeOut;
    2: dsTalon.DataSet := qBadMove;
    3: dsTalon.DataSet := qDateSN;
    4: dsTalon.DataSet := qSRTalon;
    5: dsTalon.DataSet := qOutEmission;
    6: dsTalon.DataSet := qBadSer;
    7: dsTalon.DataSet := qBadNominal;
    8: dsTalon.DataSet := qFilOAO;
  end;
  DefineAll(dbgTalon, 6 + RGTalon.ItemIndex, RGTalon.Items[RGTalon.ItemIndex]);
end;
//==============================================================================
procedure TTestDBForm.rgCardClick(Sender: TObject);
begin
  case rgCard.ItemIndex of
    0: dsCard.DataSet := qCardSR;
    1: dsCard.DataSet := qCardOver;
    2: dsCard.DataSet := qCardDouble;
    3: dsCard.DataSet := qCardAuto;
    4: dsCard.DataSet := qCardRest;
    5: dsCard.DataSet := qCardId;
    6: dsCard.DataSet := qCardClient;
    7: dsCard.DataSet := qCardTerm;
    8: dsCard.DataSet := qCardPC;
    9: dsCard.DataSet := qCardLostPack;
    10: dsCard.DataSet := qCardOP;
  end;
  DefineAll(dbgCard, 0, rgCard.Items[rgCard.ItemIndex]);
  PrihCardRef.fRecalc;
end;
//==============================================================================
procedure TTestDBForm.bbGuideTalonClick(Sender: TObject);
begin
  mGuideTalon.Visible := not mGuideTalon.Visible;
  mGuideTalon.Lines.SetText(PChar(qTalonText.SQL.Text));
  dbgTalon.Visible := not mGuideTalon.Visible;
  if mGuideTalon.Visible then bbGuideTalon.Caption := TranslateText('Убрать инструкцию')
  else bbGuideTalon.Caption := TranslateText('Показать инструкцию');
end;
//==============================================================================
procedure TTestDBForm.bbGuideCardClick(Sender: TObject);
begin
  mGuideCard.Visible := not mGuideCard.Visible;
  dbgCard.Visible := not mGuideCard.Visible;
  mGuideCard.Lines.SetText(PChar(qCardText.Sql.Text));
  if mGuideCard.Visible then bbGuideCard.Caption := TranslateText('Убрать инструкцию')
  else bbGuideCard.Caption := TranslateText('Показать инструкцию');
end;
//==============================================================================
procedure TTestDBForm.SearchNull(TheQuery: TOilQuery; IDField: string; TheMemo: TMemo);
var
  i, j: int64;
begin
  if TheQuery.RecordCount = 0 then
  begin
    TheMemo.Lines.Add(TranslateText('Все в полном порядке'));
    exit;
  end;
  TheQuery.First;
  i := TheQuery.FieldByName(IDField).asInteger;
  while not TheQuery.Eof do
  begin
    TheQuery.Next;
    j := TheQuery.FieldByName(IdField).AsInteger;
    if j - i = 2 then TheMemo.Lines.Add(IntToStr(i + 1))
    else
      if j - i > 2 then
        TheMemo.Lines.Add(IntToStr(i + 1) + '-' + IntToStr(j - 1));
    i := j;
  end;
end;
//==============================================================================
function Raz(n: integer): string;
begin
  case n mod 10 of
    0, 1, 5, 6, 7, 8, 9: result := TranslateText('раз');
    2, 3, 4:
      if n mod 100 div 10 = 1 then result := TranslateText('раз')
      else result := TranslateText('раза');
  end;
end;
//==============================================================================
procedure SearchDouble(q: TOilQuery; Memo: TMemo);
begin
  if q.RecordCount = 0 then
  begin
    Memo.Lines.Add(TranslateText('Все в полном порядке'));
    exit;
  end;
  q.First;
  while not q.eof do
  begin
    Memo.Lines.Add(q.FieldByName('numb').AsString + ' - ' + q.FieldByName('co').AsString + ' ' + Raz(q.FieldByName('co').AsInteger));
    q.next;
  end;
end;
//==============================================================================
procedure TTestDBForm.ActivateSpecialQ(var q: TOilQuery);
// открывает запрос q, передавая ему в качестве параметров две даты и инст организации
begin
  with q do
  begin
    if not Active then Close;
    ParamByName('DateBegin').Value := DateEdit1.Date;
    ParamByName('DateEnd').Value := DateEdit2.Date;
    ParamByName('Inst').Value := CEOrg.Tag;
    try
      Open;
    except
      showmessage(TranslateText('Ошибка!!! Не выходит открыть запрос'));
    end;
  end;
end;
//==============================================================================
function TTestDBForm.RaznoeTest: Boolean;
begin
  if (CEOrg.Tag = 0) then
  begin
    showmessage(TranslateText('Не указан ППОН'));
    result := FALSE;
  end
  else
    if DateEdit1.Date > DateEdit2.Date then
    begin
      showmessage(TranslateText('Какой-то странный диапазон дат'));
      result := FALSE;
    end
    else result := TRUE;
end;
//==============================================================================
procedure TTestDBForm.bbLostNumNNClick(Sender: TObject);
begin
  if not RaznoeTest then Exit;
  Memo.Lines.Clear;
  ActivateSpecialQ(QNalAbsent);
  Memo.Lines.Add(TranslateText('Отсутствующие номера налоговых'));
  SearchNull(QNalAbsent, 'numb', Memo);
  QNalAbsent.Close;
end;
//==============================================================================
procedure TTestDBForm.bbLostNumTTNClick(Sender: TObject);
begin
  if not RaznoeTest then Exit;
  Memo.Lines.Clear;
  ActivateSpecialQ(QTTNAbsent);
  Memo.Lines.Add(TranslateText('Отсутствующие номера ТТН'));
  SearchNull(QTTNAbsent, 'ttn_num', Memo);
  QTTNAbsent.Close;
end;
//==============================================================================
procedure TTestDBForm.CEOrgButtonClick(Sender: TObject);
var
  vId, vInst: integer;
  vName: string;
begin
  if CaptureOrg(1, Main.Inst, Main.Inst, 'yyy', vId, vInst, vName) then
  begin
    CEOrg.Tag := vInst;
    CEOrg.Text := vName;
  end;
end;
//==============================================================================
procedure TTestDBForm.bbDoubleNumNNClick(Sender: TObject);
begin
  if not RaznoeTest then Exit;
  Memo.Lines.Clear;
  ActivateSpecialQ(QNalDouble);
  Memo.Lines.Add(TranslateText('Дублирующиеся номера налоговых'));
  SearchDouble(QNalDouble, Memo);
  QNalDouble.Close;
end;
//==============================================================================
procedure TTestDBForm.bbDoubleNumTTNClick(Sender: TObject);
begin
  if not RaznoeTest then Exit;
  Memo.Lines.Clear;
  ActivateSpecialQ(QTTNDouble);
  Memo.Lines.Add(TranslateText('Дублирующиеся номера ТТН'));
  SearchDouble(QTTNDouble, Memo);
  QTTNDouble.Close;
end;
//==============================================================================
procedure TTestDBForm.bbPrintTalonClick(Sender: TObject);
var
  ChNumber: Integer;
  PrintExcel: Boolean;
begin
  PrintExcel := ((Sender as TBitBtn).Name <> 'bbRefreshTalon');
  if PrintExcel then
  begin
    if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
      MSExcel := GetActiveOleObject('Excel.Application')
    else MSExcel := CreateOleObject('Excel.Application');
    MSExcel.Workbooks.Add(GetMainDir + 'pattern\CheckTalon.xlt');
  end;

  for ChNumber := 0 to BoolTo_(MAIN_ORG_IS_FILIAL, 8, 7) do
  begin
    RGTalon.ItemIndex := ChNumber;
    BtnRefreshClick(Sender);
    if PrintExcel then
    begin
      List := MSExcel.ActiveWorkbook.Sheets[ChNumber + 1];
      List.Activate;
      List.Cells[2, 'A'] := MainForm.qOrg.FieldbyName('Name').AsString + ' ' + DateTimeToStr(GetSystemDate);
      PutFullQToExcel(dbgTalon.DataSource.DataSet, List, 6);
    end;
    RGTalonClick(Sender);
  end;
  if PrintExcel then
  begin
    SaveReport(MSExcel, TranslateText('ТалоныПроверки'));
    MSExcel.Visible := True;
    MSExcel.ScreenUpdating := True;
  end;
end;
//==============================================================================
procedure TTestDBForm.bbPrintCardClick(Sender: TObject);
var
  ChNumber: Integer;
  PrintExcel: Boolean;
begin
  PrintExcel := ((Sender as TBitBtn).Name <> 'bbRefreshCard');
  if PrintExcel then
  begin
    if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
      MSExcel := GetActiveOleObject('Excel.Application')
    else MSExcel := CreateOleObject('Excel.Application');
    MSExcel.Workbooks.Add(GetMainDir + 'pattern\CheckCard.xlt');
  end;

  for ChNumber := 0 to rgCard.Items.Count - 1 do
  begin
    rgCard.ItemIndex := ChNumber;
    BtnRefreshClick(Sender);
    if PrintExcel then
    begin
      List := MSExcel.ActiveWorkbook.Sheets[ChNumber + 1];
      List.Activate;
      List.Cells[2, 'A'] := MainForm.qOrg.FieldbyName('Name').AsString + ' ' + DateTimeToStr(GetSystemDate);
      PutFullQToExcel(dbgCard.DataSource.DataSet, List, 6);
    end;
    rgCardClick(Sender);
  end;
  if PrintExcel then
  begin
    SaveReport(MSExcel, TranslateText('КартыПроверки'));
    MSExcel.Visible := True;
    MSExcel.ScreenUpdating := True;
  end;
end;
//==============================================================================
procedure TTestDBForm.BitBtn7Click(Sender: TObject);
var
  HorPos, VerPos: Integer;
begin
  qTalonChDiag.Close;
  if eSer.Text = '' then qTalonChDiag.ParamByName('Ser').Clear
  else qTalonChDiag.ParamByName('Ser').AsString := eSer.Text;
  OpenTesTOilQuery(qTalonChDiag);

  if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
    MSExcel := GetActiveOleObject('Excel.Application')
  else MSExcel := CreateOleObject('Excel.Application');
  MSExcel.Workbooks.Add(GetMainDir + 'pattern\TalonChDiag.xlt');
  MSExcel.Visible := True;
  MSExcel.ScreenUpdating := True;
  List := MSExcel.ActiveWorkbook.ActiveSheet;

  HorPos := 2;
  while not qTalonChDiag.Eof do
  begin
    VerPos := 6;
    List.Cells[4, HorPos] := qTalonChDiag.FieldByName('Ser').AsString + '/' + qTalonChDiag.FieldByName('Num').AsString;
    qTalonHistory.Close;
    qTalonHistory.ParamByName('Ser').AsString := qTalonChDiag.FieldByName('Ser').AsString;
    qTalonHistory.ParamByName('Num').AsInteger := qTalonChDiag.FieldByName('Num').AsInteger;
    OpenTesTOilQuery(qTalonHistory);
    while not qTalonHistory.Eof do
    begin
      if VarType(List.Cells[VerPos, 1].Value) = varDate then
      begin
        if List.Cells[VerPos, 1].Value < qTalonHistory.FieldByName('Oper_Date').AsDateTime then
        begin
          List.Rows[VerPos].Insert;
          List.Cells[VerPos, 1] := qTalonHistory.FieldByName('Oper_Date').AsDateTime;
          List.Cells[VerPos, HorPos] := qTalonHistory.FieldByName('Title').AsString;
          if (qTalonChDiag.FieldByName('Max_Date').AsDateTime = qTalonHistory.FieldByName('Oper_Date').AsDateTime)
            or (qTalonChDiag.FieldByName('Min_Date').AsDateTime = qTalonHistory.FieldByName('Oper_Date').AsDateTime) then
            List.Cells[VerPos, HorPos].Font.ColorIndex := 3
          else List.Cells[VerPos, HorPos].Font.ColorIndex := 0;
          qTalonHistory.Next;
        end;
        if List.Cells[VerPos, 1].Value = qTalonHistory.FieldByName('Oper_Date').AsDateTime then
        begin
          if VarType(List.Cells[VerPos, HorPos].Value) = varOleStr then
          begin
            Inc(VerPos);
            List.Rows[VerPos].Insert;
            List.Cells[VerPos, 1] := qTalonHistory.FieldByName('Oper_Date').AsDateTime;
          end;
          List.Cells[VerPos, HorPos] := qTalonHistory.FieldByName('Title').AsString;
          if (qTalonChDiag.FieldByName('Max_Date').AsDateTime = qTalonHistory.FieldByName('Oper_Date').AsDateTime)
            or (qTalonChDiag.FieldByName('Min_Date').AsDateTime = qTalonHistory.FieldByName('Oper_Date').AsDateTime) then
            List.Cells[VerPos, HorPos].Font.ColorIndex := 3
          else List.Cells[VerPos, HorPos].Font.ColorIndex := 0;
          qTalonHistory.Next;
        end;
      end
      else
      begin
        List.Cells[VerPos, 1] := qTalonHistory.FieldByName('Oper_Date').AsDateTime;
        List.Cells[VerPos, HorPos] := qTalonHistory.FieldByName('Title').AsString;
        if (qTalonChDiag.FieldByName('Max_Date').AsDateTime = qTalonHistory.FieldByName('Oper_Date').AsDateTime)
          or (qTalonChDiag.FieldByName('Min_Date').AsDateTime = qTalonHistory.FieldByName('Oper_Date').AsDateTime) then
          List.Cells[VerPos, HorPos].Font.ColorIndex := 3
        else List.Cells[VerPos, HorPos].Font.ColorIndex := 0;
        qTalonHistory.Next;
      end;
      Inc(VerPos);
    end;
    qTalonChDiag.Next;
    Inc(HorPos);
  end;
end;
//==============================================================================
procedure TTestDBForm.rbAuto2Click(Sender: TObject);
begin
  dsAuto.DataSet := qWayBill;
  pnlAutoDate.Visible := TRUE;
  grbOrg.Visible := true;
  SetCurrentMonth(dateWayBill, dateWayBill2);
  DefineAll(RxDBGrid9, 15, rbAuto2.Caption + ' ' + label12.Caption);
end;
//==============================================================================
procedure TTestDBForm.rbAuto1Click(Sender: TObject);
begin
  dsAuto.DataSet := qAuto;
  pnlAutoDate.Visible := FALSE;
  grbOrg.Visible := false;
  DefineAll(RxDBGrid9, 15, rbAuto1.Caption + ' ' + label11.Caption + label10.Caption);
end;
//==============================================================================
procedure TTestDBForm.dateWayBillChange(Sender: TObject);
begin
  qWayBill.ParamByName('date1').Value := dateWayBill.Date;
  if qWayBill.Active then qWayBill.Close;
end;
//==============================================================================
procedure TTestDBForm.dateWayBill2Change(Sender: TObject);
begin
  qWayBill.ParamByName('date2').Value := dateWayBill2.Date;
  if qWayBill.Active then qWayBill.Close;
end;
//==============================================================================
procedure TTestDBForm.QWayBillAfterClose(DataSet: TDataSet);
begin
  btnPrint.Enabled := FALSE;
  LRecordCount.Caption := TranslateText('Нажмите "Обновить"');
end;
//==============================================================================
procedure TTestDBForm.deBeginChange(Sender: TObject);
begin
  if deBegin.Date > StrToDate(CH_STARTUP_DATE) then
  begin
    MessageDlg(TranslateText('Нельзя устанавливать начальное значение меньше чем ') + CH_STARTUP_DATE, mtError, [mbOk], 0);
    deBegin.Date := StrToDate(CH_STARTUP_DATE);
  end;
  deBegin.Tag := 0;
  lblBeginT.Caption := TranslateText('При изменении начальной даты') + #13#10 +
    TranslateText('результаты проверок сохранены не будут.') + #13#10 +
    TranslateText('Для сохранения результатов дата') + #13#10 +
    TranslateText('должна быть равна ') + CH_STARTUP_DATE;
  lblBeginC.Caption := lblBeginT.Caption;
  lblBeginT.Visible := deBegin.Date <> StrToDate(CH_STARTUP_DATE);
  lblBeginC.Visible := deBegin.Date <> StrToDate(CH_STARTUP_DATE);
  if deBegin.Date <> StrToDate(CH_STARTUP_DATE) then
    deBegin.Tag := 1;
    // deBegin.Tag := 1 Признак того, что результаты проверок не будут
    // сохраняться при измененной начальной дате
end;
//==============================================================================
procedure TTestDbForm.PutBeginDateParam(DataSet: TDataSet);
var
  CTD, CTD1: TDateTime;
  i: integer;
begin
   {Можно было бы прокомментировать, бляха муха}
  if CUT_DATE = '' then
  begin
    CTD := deBegin.Date;
    CTD1 := deBegin.Date;
  end
  else
  begin
    if StrToDate(CUT_DATE) > deBegin.Date then CTD := StrToDate(CUT_DATE)
    else CTD := deBegin.Date;
    CTD1 := StrToDate(CUT_DATE);
  end;
  for i := 0 to (DataSet as TOilQuery).Params.Count - 1 do
    if uppercase((DataSet as TOilQuery).Params[i].Name) = uppercase('BeginDate') then
      (DataSet as TOilQuery).ParamByName('BeginDate').Value := CTD;

  if (DataSet as TOilQuery) = qBadMove then
    (DataSet as TOilQuery).ParamByName('CutDate').Value := CTD1;

  DATE_FLD := qCheck.FieldByName('date_fld').AsString;
  SILENCE_PERIOD := qCheck.FieldByName('SILENCE_PERIOD').AsInteger;
    {В случае если фирма перешла на филиал установить в нужных запросах :BeginDate}
  if ReadOilVar('INST_MOVE_DATE') = '' then Exit;
  if (CTD < StrToDate(ReadOilVar('INST_MOVE_DATE'))) and
    (((DataSet as TOilQuery) = qCardSR) or ((DataSet as TOilQuery) = qCardId) or ((DataSet as TOilQuery) = qCardIdDEMO)) then
    (DataSet as TOilQuery).ParamByName('BeginDate').Value := ReadOilVar('INST_MOVE_DATE');
end;
//==============================================================================
procedure TTestDBForm.cmeOrgButtonClick(Sender: TObject);
var
  vId, vInst: integer;
  vName: string;
begin
  if CaptureOrg(1, Main.Inst, Main.Inst, 'nnn', vId, vInst, vName) then
  begin
    cmeOrg.Tag := vInst;
    cmeOrg.Text := vName;
    qWayBill.ParamByName('p_org').Value := vInst;
    if qWayBill.Active then qWayBill.Close;
  end;
end;
//==============================================================================
procedure TTestDBForm.sbClearOrgClick(Sender: TObject);
begin
  if Main.Main_Type = 3 then
  begin
    cmeOrg.Text := GetOrgName(Main.Main_Id, Main.Inst);
    cmeOrg.Tag := Main.Inst;
    qWayBill.ParamByName('p_org').Value := Main.Inst;
  end
  else
  begin
    qWayBill.ParamByName('p_org').Value := -1;
    cmeOrg.Text := '';
    cmeOrg.Tag := -1;
  end;
  if qWayBill.Active then qWayBill.Close;
end;
//==============================================================================
procedure TTestDBForm.FormActivate(Sender: TObject);
begin
  inherited;
  Application.ProcessMessages;
  if not CheckupStatus.TestTablesChecksum then Application.Terminate;
end;
//==============================================================================
function TTestDBForm.GetRecordCount(RCType: TRecordCount = rcAll): integer;
var
  q: TOilQuery;
  iCountBad, iCountGood: integer;
begin
  q := CurrentDBGrid.DataSource.DataSet as TOilQuery;
  q.Filtered := False;
  if DATE_FLD = '' then //Поля даты в проверке нет, потому ничто не отфильтровуеться
  begin
    iCountBad := q.RecordCount;
    iCountGood := 0;
  end
  else //Поле дата есть, потому щитаем все плохие записи
  begin
    q.DisableControls;
    q.First;
    iCountBad := 0;
    iCountGood := 0;
    while not q.Eof do
    begin
      if q.FieldByName(DATE_FLD).AsDateTime < GetSystemDate - SILENCE_PERIOD then inc(iCountBad)
      else inc(iCountGood);
      q.Next;
    end;
    q.EnableControls;
  end;
  case RCType of
    rcAll: result := iCountBad + iCountGood;
    rcBad: result := iCountBad;
    rcGood: result := iCountGood;
    else result := 0;
  end;
end;
//==============================================================================

procedure TTestDBForm.rgBlankClick(Sender: TObject);
begin
  inherited;
  qBlank.Close;
  qBlank.SQL.Text:=GetExeSqlTextById(GetSqlId());
  DefineAll(dbgBlank, 0, rgBlank.Items[rgBlank.ItemIndex]);
end;

function TTestDBForm.GetCheckupId():integer;
begin
  Result := -1;
  if PageControl1.ActivePage = TabTalon then
    Result := StrToInt('1' + IntToStr(rgTalon.ItemIndex))
  else if PageControl1.ActivePage = TabCard then
    Result := StrToInt('2' + IntToStr(rgCard.ItemIndex))
  else if PageControl1.ActivePage = TabBlank then
  begin
    qLoadBlankCheck.First;
    while not (qLoadBlankCheck.Eof) do
    begin
      if (rgBlank.Items[rgBlank.ItemIndex] = DevideRusUkr(qLoadBlankCheck.FieldByName('DESCRIPTION').AsString,true)) then
      begin
        Result := qLoadBlankCheck.FieldByName('CHECKUP_ID').AsInteger;
        break;
      end;
      qLoadBlankCheck.Next;
    end;
  end;
  if Result = -1 then
    raise Exception.Create(TranslateText('GetCheckupId : Невозможно определить код проверки'));
end;

function TTestDBForm.GetSqlId():integer;
begin
  Result := -1;
  if PageControl1.ActivePage = TabBlank then
  begin
    qLoadBlankCheck.First;
    while not (qLoadBlankCheck.Eof) do
    begin
      if (rgBlank.Items[rgBlank.ItemIndex] = DevideRusUkr(qLoadBlankCheck.FieldByName('DESCRIPTION').AsString,true)) then
      begin
        Result := qLoadBlankCheck.FieldByName('SQL_ID').AsInteger;
        break;
      end;
      qLoadBlankCheck.Next;
    end;
  end;
  if Result = -1 then
    raise Exception.Create(TranslateText('GetSqlId : Невозможно определить код проверки'));
end;

procedure TTestDBForm.bbRefreshBlankClick(Sender: TObject);
var
  ChNumber: integer;
begin
  for ChNumber := 0 to rgBlank.Items.Count - 1 do
  begin
    rgBlank.ItemIndex := ChNumber;
    BtnRefreshClick(Sender);
    // Печать на отсылку
    if pos('Refresh',(Sender as TBitBtn).Name) = 0 then
      BtnPrintClick(Sender);
  end;
end;

end.
