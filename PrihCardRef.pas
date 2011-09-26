unit PrihCardRef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Excel8TLB,
  RXCtrls, StdCtrls, Buttons, ExtCtrls, Db, DBTables, {Grids,} ComObj, ActiveX,
  ToolEdit, Mask, Menus, DBCtrls, DBGridEh, Grids, OilStd, ComCtrls,Ora,
  uCommonForm,uOilQuery,uOilStoredProc, DBAccess, MemDS
  {$IFDEF VER150},Variants,StrUtils{$ENDIF}, uMessageDlgExt, CardRNPrint,
  ActnList;

type

  TToRecalcCause = (trcDog, trcRequest);

  TCardRecalc = class
    private
      FInsToRecalc, FTableToRecalc: string;
      FIsByPeriod: boolean;
      procedure DoClient(AToId,AToInst: integer); virtual; abstract;
      procedure DoCard(ACardNumber: integer); virtual; abstract;
      function IsHaveChanges: boolean; virtual; abstract;
      procedure DoChanges; virtual; abstract;
      procedure DoFull; virtual; abstract;
      class function GetRecalcPackage: string;
    public
      procedure Client(AToId,AToInst: integer; AIsPeriod: boolean);
      procedure Card(ACardNumber: integer; AIsPeriod: boolean);
      procedure Changes;
      procedure Full;
      procedure AddToRecalc(AId, AInst: integer; ACause: TToRecalcCause);
      procedure Init(); virtual; abstract;
      constructor Create;
      class function GetClass: TCardRecalc;
      property IsPeriod: boolean read FIsByPeriod write FIsByPeriod;
      property RecalcPackage: string read GetRecalcPackage;
  end;

  TCardRecalcSingle = class(TCardRecalc)
      procedure DoClient(AToId,AToInst: integer); override;
      procedure DoCard(ACardNumber: integer); override;
      function IsHaveChanges: boolean; override;
      procedure DoChanges; override;
      procedure DoFull; override;
      procedure Init(); override;
  end;

  TCardRecalcPartition = class(TCardRecalc)
      procedure DoClient(AToId,AToInst: integer); override;
      procedure DoCard(ACardNumber: integer); override;
      function IsHaveChanges: boolean; override;
      procedure DoChanges; override;
      procedure DoFull; override;
      procedure Init(); override;
      procedure GetDatePartition(ADate: TDateTime;
        var ADatePartitionPrev: TDateTime; var ADatePartitionCurr: TDateTime);
  end;


  TPrihCardRefForm = class(TCommonForm)
    Panel1: TPanel;
    Panel3: TPanel;
    bbCancel: TBitBtn;
    Panel4: TPanel;
    bbClear: TBitBtn;
    bbSearch: TBitBtn;
    Panel2: TPanel;
    deDate1: TDateEdit;
    ceEmName: TComboEdit;
    ceToName: TComboEdit;
    Label2: TLabel;
    lClient: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    deDate2: TDateEdit;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    eDogNum: TEdit;
    Label7: TLabel;
    ceNpType: TComboEdit;
    SpeedButton2: TSpeedButton;
    pnlFilter: TPanel;
    rbMinus: TRadioButton;
    rbPlus: TRadioButton;
    rbAll: TRadioButton;
    ppPrintDoc: TPopupMenu;
    sbPrint: TRxSpeedButton;
    PrintZ: TMenuItem;
    PrintRn: TMenuItem;
    PrintReestr: TMenuItem;
    RxLabel1: TRxLabel;
    qWork: TOilQuery;
    Label9: TLabel;
    edCardNum: TEdit;
    miSeparator: TMenuItem;
    miRefPrint: TMenuItem;
    rbAlien: TRadioButton;
    PEdit: TPanel;
    sbEdit: TSpeedButton;
    q: TOilQuery;
    ds: TOraDataSource;
    uq: TOraUpdateSQL;
    Label4: TLabel;
    deDogDate: TDateEdit;
    SpeedButton4: TSpeedButton;
    qTransit: TOilQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField1: TStringField;
    DateTimeField3: TDateTimeField;
    StringField10: TStringField;
    StringField12: TStringField;
    dsTransit: TOraDataSource;
    qTransitALIEN_NAME: TStringField;
    qTransitOPER_DATE: TDateTimeField;
    qTransitGR_CARD_NUM: TFloatField;
    qTransitPRICE_NDS: TFloatField;
    qTransitCOUNT_LITR: TFloatField;
    qTransitEMITENT_NAME: TStringField;
    Label3: TLabel;
    sbCearAZS: TSpeedButton;
    ceAZSName: TComboEdit;
    miExchClient: TMenuItem;
    qTransitAZS_ID: TFloatField;
    qTransitEMITENT_ID: TFloatField;
    pmAdditionFilter: TPopupMenu;
    miAll: TMenuItem;
    miAlien: TMenuItem;
    miOwn: TMenuItem;
    miRnPrinted: TMenuItem;
    miRnNotPrinted: TMenuItem;
    lFilterStatus: TLabel;
    miDocLS: TMenuItem;
    miInvoiceLS: TMenuItem;
    miInvoiceLSDel: TMenuItem;
    sbSum: TSpeedButton;
    miDeleteRn: TMenuItem;
    qTransitDATE_MOD: TDateTimeField;
    rbLS: TRadioButton;
    sbAdditionFilter: TRxSpeedButton;
    sbAdditionFilterLS: TRxSpeedButton;
    pmAdditionFilterLS: TPopupMenu;
    miLSAll: TMenuItem;
    miLSInvoiceNotPrinted: TMenuItem;
    miLSBenz: TMenuItem;
    miLSDT: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    miLSInvoicePrinted: TMenuItem;
    qTransitCARDSCHEME: TFloatField;
    sbAdd: TSpeedButton;
    spbDelTrans: TSpeedButton;
    SpeedButton5: TSpeedButton;
    RxSpeedButton2: TRxSpeedButton;
    lbTransType: TLabel;
    miTransType: TPopupMenu;
    N1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    qTransitTRANS_TYPESTR: TStringField;
    qTransitTRANS_TYPE: TFloatField;
    N8: TMenuItem;
    chShowGrn: TCheckBox;
    N9: TMenuItem;
    miRecalcByCard: TMenuItem;
    qTransitEMITENT_DEP_ID: TFloatField;
    qTransitEMITENT_DEP_NAME: TStringField;
    miRecalc: TMenuItem;
    miRecalcByClient: TMenuItem;
    miRecalcAll: TMenuItem;
    N11: TMenuItem;
    sbViewRecalc: TSpeedButton;
    qTransitDocExist: TFloatField;
    qOIL_ID: TFloatField;
    qTIME_: TStringField;
    qOIL_INST: TFloatField;
    qCARDSCHEME: TFloatField;
    qDATE_: TDateTimeField;
    qOPER_DATE: TDateTimeField;
    qDOC_NUMBER: TStringField;
    qDOC_DATE: TDateTimeField;
    qPRICE_NDS: TFloatField;
    qCOUNT_LITR: TFloatField;
    qTO_ID: TFloatField;
    qTO_INST: TFloatField;
    qOPER_TYPE: TFloatField;
    qGR_CARD_NUM: TFloatField;
    q_: TStringField;
    qPRICE_DOG_NDS: TFloatField;
    qCARD_PRICE: TFloatField;
    qDOV_SER: TStringField;
    qDOV_NUM: TStringField;
    qDOV_DATE: TDateTimeField;
    qDOV_WHO: TStringField;
    qCLEAN_Z_NUM: TStringField;
    qAUTO_ID: TFloatField;
    qAUTO_INST: TFloatField;
    qEMPLOY_ID: TFloatField;
    qEMPLOY_INST: TFloatField;
    qCAUSE: TFloatField;
    qTONAME: TStringField;
    qALIEN_NAME: TStringField;
    qAZS_NAME: TStringField;
    qEMITENT_NAME: TStringField;
    qNPTYPE: TStringField;
    qAUTO_NUMB: TStringField;
    qEMPLOY_NAME: TStringField;
    qDATE_MOD: TDateTimeField;
    qNN_ID: TFloatField;
    qNN_INST: TFloatField;
    qNP_TYPE: TFloatField;
    qTRANS_TYPESTR: TStringField;
    qTRANS_TYPE: TFloatField;
    qPURSE: TStringField;
    qCOUNT_PURSE: TFloatField;
    qCAUSE_ID: TFloatField;
    qCAUSE_NAME: TStringField;
    qREAL_LITR: TFloatField;
    qREAL_DATE: TDateTimeField;
    qREAL_TIME: TStringField;
    N12: TMenuItem;
    miDopConsent: TMenuItem;
    miCardPrintEC: TMenuItem;
    qReport: TOilQuery;
    sbAdditionFilterPopoln: TRxSpeedButton;
    pmAdditionFilterPopoln: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    N13: TMenuItem;
    qREQUEST_ID: TFloatField;
    qREQUEST_INST: TFloatField;
    miDocEC: TMenuItem;
    miCardPrintLS: TMenuItem;
    qNB_NAME: TStringField;
    qDOG_ID: TFloatField;
    qDOG_INST: TFloatField;
    qSHARE_ID: TFloatField;
    qSHARE_NAME: TStringField;
    DelZ: TMenuItem;
    qDOG_NUM: TStringField;
    qDOG_DATE: TDateTimeField;
    N10: TMenuItem;
    N14: TMenuItem;
    qDOG_FOREPAY: TFloatField;
    qDOG_REAL_FOREPAY: TFloatField;
    qDOG_REAL_FOREPAY_NAME: TStringField;
    qIS_CORR: TFloatField;
    qID: TFloatField;
    qTRN_GUID: TStringField;
    dbg: TDBGridEh;
    ActionList1: TActionList;
    miRecalcByCardPeriod: TMenuItem;
    miRecalcByClientPeriod: TMenuItem;
    qORGDB_ID: TFloatField;
    qORGDB_INST: TFloatField;
    qORGDB_NAME: TStringField;
    procedure bbCancelClick(Sender: TObject);
    procedure ceEmNameButtonClick(Sender: TObject);
    procedure ceToNameButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure ceNpTypeButtonClick(Sender: TObject);
    procedure PrintZClick(Sender: TObject);
    procedure PrintRnClick(Sender: TObject);
    procedure PrintReestrClick(Sender: TObject);
    procedure miRefPrintClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure dbgDblClick(Sender: TObject);
    procedure dbgGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure qAfterPost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ceAZSNameButtonClick(Sender: TObject);
    procedure sbCearAZSClick(Sender: TObject);
    procedure miExchClientClick(Sender: TObject);
    procedure miAllClick(Sender: TObject);
    procedure miAlienClick(Sender: TObject);
    procedure miOwnClick(Sender: TObject);
    procedure miRnPrintedClick(Sender: TObject);
    procedure miRnNotPrintedClick(Sender: TObject);
    procedure miInvoiceLSClick(Sender: TObject);
    procedure miInvoiceLSDelClick(Sender: TObject);
    procedure ppPrintDocPopup(Sender: TObject);
    procedure sbSumClick(Sender: TObject);
    procedure miDeleteRnClick(Sender: TObject);
    procedure dbgSortMarkingChanged(Sender: TObject);
    procedure rbLSClick(Sender: TObject);
    procedure miLSInvoicePrintedClick(Sender: TObject);
    procedure miLSInvoiceNotPrintedClick(Sender: TObject);
    procedure miLSAllClick(Sender: TObject);
    procedure rbMinusClick(Sender: TObject);
    procedure miLSBenzClick(Sender: TObject);
    procedure miLSDTClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure spbDelTransClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure chShowGrnClick(Sender: TObject);
    procedure miRecalcByCardClick(Sender: TObject);
    procedure Panel1DblClick(Sender: TObject);
    procedure miRecalcByClientClick(Sender: TObject);
    procedure miRecalcAllClick(Sender: TObject);
    procedure sbViewRecalcClick(Sender: TObject);
    procedure miDopConsentClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure miCardPrintLSClick(Sender: TObject);
    procedure DelZClick(Sender: TObject);
    procedure PrintDog(DocType: TDocType);
    procedure DelDog(DocType: TDocType);
  private
   strTransType:string;
   bDirectUpdate:Boolean;
   beg,begt:Boolean;
   To_Id,To_Inst : integer;
   BaseSQL : String;
   BaseSQLTransit : String;
  public
    NPType: Integer;
    AdditionFilter : (
       afAll,
       afOnlyAlien,
       afLS,
       afEK,
       afOnlyOwn,
       afRnPrinted,
       afRnNotPrinted,
       afInvoicePrinted,
       afInvoiceNotPrinted,
       afBenzin,
       afDT,
       afReceiptInOC,
       afDeferredReceipt,
       afExpenseInOC
    );
  end;
    function CardRecalc: TCardRecalc;
    procedure fRecalc;
    procedure RecalcByCard(ACardNumber,ACardScheme, AToId, AToInst: Integer;
      AIsShowMessage: Boolean = True; AIsPeriod: Boolean = False);
    procedure RecalcByClient(AToId : Integer = 0; AToInst: Integer = 0;
      AIsShowMessage: Boolean = True; AIsPeriod: Boolean = False);
    procedure MessageToRecalc(sError: string);

var
  PrihCardRefForm: TPrihCardRefForm;
  FCardRecalc: TCardRecalc = nil;
  i, AZS_Id, AZS_Inst: Integer;
  flDeleteRN : Boolean = False;
  flDeleteTaxBill  : Boolean = False;
  OrderField : String = 'order by Oper_Date ';
  OrderDirection : String = ' desc ';
  FRecalcPkg: String = '';

implementation

uses
  chooseorg, main, uXMLForm, PrihCard, UDbFunc, ExFunc,
  ExchCardClient, TestDB, ExcelFunc, HandTransact, Passw, RulezReport,
  UReportClass, uStart, uCrypt, uExeSql, PrihCardView, DogRef,
  uFilter;

{$R *.DFM}

procedure TPrihCardRefForm.bbCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TPrihCardRefForm.ceEmNameButtonClick(Sender: TObject);
 var
  vId, vInst: Integer;
  vName: String;
begin
  if ChooseOrg.CaptureOrg(0, MAIN_ID, INST, 'yyy', vId, vInst, vName) then ceEmName.Text := vName;
end;

procedure TPrihCardRefForm.ceToNameButtonClick(Sender: TObject);
var
vId,vInst:integer;
vName: String;
begin
  if ChooseOrg.CaptureOrg(3, MAIN_ID, INST, 'yyy', vId, vInst, vName) then begin
    To_Id := vId;
    To_Inst :=vInst;
    ceToName.Text := vName;
  end;
end;

procedure TPrihCardRefForm.SpeedButton1Click(Sender: TObject);
begin
ceEmName.Text := '';
end;

procedure TPrihCardRefForm.SpeedButton3Click(Sender: TObject);
begin
ceToName.Text := '';
To_id :=0;
To_inst := 0;
end;
procedure TPrihCardRefForm.SpeedButton2Click(Sender: TObject);
begin
ceNPType.Text := '';
NPType := 0;
end;

procedure TPrihCardRefForm.bbSearchClick(Sender: TObject);
var
  SavePlace: TBookmark;
  i: integer;
begin
  Application.ProcessMessages;

  miRecalc.Enabled := not rbAll.Checked;
  miRecalcByClient.Visible := not rbLS.Checked;
  if rbLS.Checked
    then miRecalcByCard.Caption := TranslateText('все карты/типы нп по выбранному клиенту')
    else miRecalcByCard.Caption := TranslateText('все типы НП по выбранной карте');

  if(rbAlien.Checked)and(qTransit.Active)and not(qTransit.IsEmpty)then
    SavePlace := qTransit.GetBookmark
  else if not(rbAlien.Checked)and(q.Active)and not(q.IsEmpty)then
    SavePlace := q.GetBookmark
  else
    SavePlace := nil;
  q.SQL.Text := BaseSQL;
  qTransit.SQL.Text := BaseSQLTransit;

  sbEdit.Enabled := true;

  //Дополнительный фильтр
  sbAdditionFilter.Visible := rbMinus.Checked;
  sbAdditionFilterLS.Visible := rbLS.Checked;
  sbAdditionFilterPopoln.Visible := rbPlus.Checked;

  //Очистить доп. фильтр если не выбран соотв. пункт
  if (not rbMinus.Checked) then  rbMinus.Font.Color := clBlack;
  if (not rbLS.Checked) then  rbLS.Font.Color := clBlack;
  if (rbAll.Checked) or (rbAlien.Checked) then
  begin
    lFilterStatus.Caption := '';
    AdditionFilter := afAll;
  end;

  //видимость пункта печати документов по ЛС в меню печати документов
   miDocLs.Enabled := AdditionFilter in [afLS, afInvoicePrinted, afInvoiceNotPrinted, afDT, afBenzin];

  miDocEC.Enabled := not miDocLs.Enabled;

  if rbAlien.Checked then lClient.Caption := TranslateText('Филиал')
  else lClient.Caption := TranslateText('Клиент');

  // видимість полів
  // Всі
  dbg.FieldColumns['AZS_NAME'].Visible   := not rbAll.Checked; // АЗС где списались
  // not ("Чужие" списания ЭК на АЗС)
  dbg.FieldColumns['CAUSE_NAME'].Visible            := not rbAlien.Checked;
  dbg.FieldColumns['TONAME'].Visible                := not rbAlien.Checked; // клиент
  dbg.FieldColumns['DOG_REAL_FOREPAY_NAME'].Visible := not rbAlien.Checked;
  // Пополнения ЭК
  dbg.FieldColumns['SHARE_NAME'].Visible    := rbPlus.Checked; // акція
  dbg.FieldColumns['NB_NAME'].Visible       := rbPlus.Checked; // відпустивша НБ
  dbg.FieldColumns['EMPLOY_NAME'].Visible   := rbPlus.Checked; // водитель
  dbg.FieldColumns['AUTO_NUMB'].Visible     := rbPlus.Checked; // номер авто
  dbg.FieldColumns['PRICE_DOG_NDS'].Visible := rbPlus.Checked;
  // інші умови
  dbg.FieldColumns['ALIEN_NAME'].Visible := rbMinus.Checked or rbAlien.Checked or rbLS.Checked; // где произошло списание
  dbg.FieldColumns['PRICE_NDS'].Visible  := rbMinus.Checked or rbAlien.Checked or rbLS.Checked;
  
  dbg.FieldColumns['CARD_PRICE'].Visible := rbMinus.Checked or rbLS.Checked; // цена карточки
  dbg.FieldColumns['DOC_NUMBER'].Visible := rbMinus.Checked or rbLS.Checked;
  dbg.FieldColumns['DOC_DATE'].Visible   := rbMinus.Checked or rbLS.Checked;

  dbg.FieldColumns['DOG_NUM'].Visible    := rbPlus.Checked or rbLS.Checked;
  dbg.FieldColumns['DOG_DATE'].Visible   := rbPlus.Checked or rbLS.Checked;

  //выбран фильтр "чужие списания"
  if rbAlien.Checked then
  begin
    dbg.DataSource := dsTransit;
    qTransit.DisableControls;
    //Выборка таблицы Card_Transit
    qTransit.Close;
    qTransit.ParamByName('BeginDate').AsDate := deDate1.Date;           //Фильтр по начальной дате
    qTransit.ParamByName('EndDate').AsDate := deDate2.Date;             //Фильтр по конечной дате
    qTransit.ParamByName('Alien').AsString := ceToName.Text;            //Фильтр по клиенту
    qTransit.ParamByName('Emitent').AsString := ceEmName.Text;          //Фильтр по эмитенту
    qTransit.ParamByName('AZSId').AsInteger := AZS_Id;                  //Фильтр по АЗС

    // Фильтр по номеру договора
    if eDogNum.Text <> '' then
      qTransit.ParamByName('Dog_Num').AsString := eDogNum.Text
    else qTransit.ParamByName('Dog_Num').Clear;
    // Фильтр по дате договора
    if deDogDate.Date <> 0 then
      qTransit.ParamByName('Dog_Date').AsDate := deDogDate.Date
    else qTransit.ParamByName('Dog_Date').Clear;

    qTransit.ParamByName('NPType').AsInteger := NpType;                 //Фильтр по типу НП
    qTransit.ParamByName('CardNumber').AsString := edCardNum.Text;      //Фильтр по № карточки
    strTransType:='';
   if(N1.Checked=true) then
      strTransType:='70,71,72,73';
    if(N4.Checked=true) then
       strTransType:='70';
    if(N5.Checked=true) then
       strTransType:='71';
    if(N6.Checked=true) then
       strTransType:='72';
    if(N7.Checked=true) then
       strTransType:='73';
    if(lbTransType.Font.Color=clBlue)then
      qTransit.SQL.Text := qTransit.SQL.Text + ' and TRANS_TYPE IN ('+strTransType+')'
    else
    begin
     if(begt)then
     begin
       qTransit.SQL.Text := qTransit.SQL.Text + ' and TRANS_TYPE IN (70,71,72,73)';
       begt:=false;
     end
     else
     begin
       qTransit.SQL.Text := qTransit.SQL.Text + ' and TRANS_TYPE IN (70,71,72,73)';
     end;
    end;

    for i := 0 to dbg.SortMarkedColumns.Count-1 do
      if dbg.SortMarkedColumns[i].Title.SortMarker <> smNoneEh then
        if not dbg.SortMarkedColumns[i].Visible then
        begin
          dbg.FieldColumns['OPER_DATE'].Title.SortMarker := smDownEh;
          OrderField := 'Order by OPER_DATE';
        end;

    if (length(OrderField)>0) then
    qTransit.SQL.Strings[qTransit.SQL.Count -1]:= OrderField + ' ' + OrderDirection;
    _OpenQuery(qTransit);
    if SavePlace <> nil then
      if qTransit.BookmarkValid(SavePlace) then
        qTransit.GotoBookmark(SavePlace);
    qTransit.EnableControls;
    qTransit.FreeBookmark(SavePlace);
  end
  else
  begin
    dbg.DataSource := ds;
    q.DisableControls;
    //Выборка таблицы Card_Transaction
    q.Close;
    //Дополнительный фильтр для списаний
    q.ParamByName('OnlyOwn').value := false;
    q.ParamByName('LS').value := false;
    q.ParamByName('EK').value := false;
    q.ParamByName('OnlyAlien').value := false;
    q.ParamByName('RnNotPrinted').value := false;
    q.ParamByName('RnPrinted').value := false;
    q.ParamByName('InvoiceNotPrinted').value := false;
    q.ParamByName('InvoicePrinted').value := false;
    q.ParamByName('DT').value := false;
    q.ParamByName('Benz').value := false;
    case AdditionFilter of
       afOnlyAlien         :
         begin
           q.ParamByName('EK').value := true;
           q.ParamByName('OnlyAlien').value := true;
         end;
       afOnlyOwn           :
         begin
           q.ParamByName('EK').value := true;
           q.ParamByName('OnlyOwn').value := true;
         end;
       afRnPrinted         :
         begin
           q.ParamByName('EK').value := true;
           q.ParamByName('RnPrinted').value := true;
         end;  
       afRnNotPrinted      :
         begin
           q.ParamByName('EK').value := true;
           q.ParamByName('RnNotPrinted').value := true;
         end;  
       afLS                : q.ParamByName('LS').value := true;
       afEk                : q.ParamByName('EK').value := true;
       afInvoicePrinted    :
       begin
         q.ParamByName('LS').value := true;
         q.ParamByName('InvoicePrinted').value := true;
       end;
       afInvoiceNotPrinted :
       begin
         q.ParamByName('LS').value := true;
         q.ParamByName('InvoiceNotPrinted').value := true;
       end;
       afDT :
       begin
         q.ParamByName('LS').value := true;
         q.ParamByName('DT').value := true;
       end;
       afBenzin :
       begin
         q.ParamByName('LS').value := true;
         q.ParamByName('Benz').value := true;
       end;        
    end;

    // поповнення ЕК
    if rbPlus.Checked and
      not ((AdditionFilter = afReceiptInOC) or (AdditionFilter = afDeferredReceipt) or (AdditionFilter = afExpenseInOC)) then
      q.ParamByName('Receipt').Value := true
    else q.ParamByName('Receipt').Value := false;
    q.ParamByName('receipt_in_OC').Value := AdditionFilter = afReceiptInOC;
    q.ParamByName('deferred_receipt').Value := AdditionFilter = afDeferredReceipt;
    q.ParamByName('expense_in_OC').Value := AdditionFilter = afExpenseInOC;

    //Основной фильтр
    q.ParamByName('Expense').Value := rbMinus.Checked;             //Фильтр по списаниям
    q.ParamByName('BeginDate').AsDate := deDate1.Date;             //Фильтр по начальной дате
    q.ParamByName('EndDate').AsDate := deDate2.Date;               //Фильтр по конечной дате
    if ceToName.Text <> '' then begin
      q.ParamByName('ToId').AsInteger := To_Id;
      q.ParamByName('ToInst').AsInteger := To_Inst;
    end else begin
      q.ParamByName('ToId').AsInteger := 0;
      q.ParamByName('ToInst').AsInteger := 0;
     end;

    q.ParamByName('Emitent').AsString := ceEmName.Text;            //Фильтр по эмитенту
    q.ParamByName('AZSId').AsInteger := AZS_Id;                    //Фильтр по АЗС
    q.ParamByName('AZSInst').AsInteger := AZS_Inst;

    // Фильтр по номеру договора
    if eDogNum.Text <> '' then
      q.ParamByName('Dog_Num').AsString := eDogNum.Text
    else q.ParamByName('Dog_Num').Clear;
    // Фильтр по дате договора
    if deDogDate.Date <> 0 then
      q.ParamByName('Dog_Date').AsDate := deDogDate.Date
    else q.ParamByName('Dog_Date').Clear;
    
    q.ParamByName('NPType').AsInteger := NpType;                   //Фильтр по типу НП
    q.ParamByName('CardNumber').AsString := edCardNum.Text;        //Фильтр по № карточки
    strTransType:='';
   if(N1.Checked=true) then
      strTransType:='70,71,72,73';
    if(N4.Checked=true) then
       strTransType:='70';
    if(N5.Checked=true) then
       strTransType:='71';
    if(N6.Checked=true) then
       strTransType:='72';
    if(N7.Checked=true) then
       strTransType:='73';
    if(lbTransType.Font.Color=clBlue)then
    begin
      q.SQL.Text := q.SQL.Text + ' and TRANS_TYPE IN ('+strTransType+')';
    end
    else
    begin
     if(beg)then
     begin
       q.SQL.Text := q.SQL.Text + ' and TRANS_TYPE IN (70,71,72,73)';
     beg:=false;
     end
     else
     begin
       q.SQL.Text := q.SQL.Text + ' and TRANS_TYPE IN (70,71,72,73)';
     end;
    end;
    if (length(OrderField)>0) then
    q.SQL.Text := q.SQL.Text + ' '+OrderField + ' ' + OrderDirection;
    q.Open;
    if (SavePlace <> nil) and not q.IsEmpty then
      if q.BookmarkValid(SavePlace) then
        q.GotoBookmark(SavePlace);
    q.EnableControls;
    q.FreeBookmark(SavePlace);
  end;
end;

procedure TPrihCardRefForm.bbClearClick(Sender: TObject);
begin
//Очистка элементов фильтра
  ceToName.Text := '';
  ceEmName.Text := '';
  edCardNum.Text := '';
  ceNpType.Text := '';
  edCardNum.Text := '';
end;

procedure TPrihCardRefForm.ceNpTypeButtonClick(Sender: TObject);
begin
  try
    XMLChoose('npgroupref','PETROL_ID',NpType,ceNpType);
  except
    MessageDlg(TranslateText('Не возможно выбрать данный тип НП!'), mtError, [mbOk], 0);
  end;
end;

procedure TPrihCardRefForm.PrintRnClick(Sender: TObject);
var
 CardRNPrintForm: TCardRNPrintForm;
 REQUEST_INST: integer;
begin
  fRecalc;
  if q.isEmpty then abort;

  //Открытие формы печати документов по карточкам
  CardRNPrintForm := TCardRNPrintForm.Create(Application);

  if flDeleteRn  then
  begin
    CardRNPrintForm.Caption := TranslateText('Удаление расходной накладной ') ;
    CardRNPrintForm.bbPrint.Caption := TranslateText('Удалить');
  end
  else
  begin
    CardRNPrintForm.Caption := TranslateText('Печать расходной накладной ');
    CardRNPrintForm.bbPrint.Caption := TranslateText('Печать');
  end;

  CardRNPrintForm.nbForms.ActivePage := 'RNForm';
  CardRNPrintForm.Height := 190;

  if flDeleteRn
    then CardRNPrintForm.ReportNumber := 7
    else CardRNPrintForm.ReportNumber := 3;

  //Заполнение элементов формы значениями РН
  CardRNPrintForm.ceRnToName.Text := qToName.AsString;
  CardRNPrintForm.OrgId := qTO_ID.AsInteger;
  CardRNPrintForm.OrgInst := qTO_INST.AsInteger;

  // Явного признака у транзакции нету, посему в параметр "от кого"
  // берем INST заявки в случае если ОП на НБ
  // берем INST транзакции в остальных случаях

  REQUEST_INST := nvl(GetSqlValueParSimple(
    'select max(t.request_inst) ' + #13#10 +
    '  from v_card_transaction t, card_transaction_rest r ' + #13#10 +
    ' where r.oil_id = :expense_id ' + #13#10 +
    '   and r.id_receipts = t.oil_id ' + #13#10 +
    '   and r.oil_inst = :oil_inst ' + #13#10 +
    '   and t.oil_inst = :oil_inst ' + #13#10 +    
    '   and r.oil_inst = t.oil_inst ',
    ['expense_id', qOIL_ID.AsInteger,
     'oil_inst', qOIL_INST.AsInteger]), -1);

  if REQUEST_INST <> -1 then
  begin
    CardRNPrintForm.FromId :=  REQUEST_INST;
    CardRNPrintForm.FromInst := REQUEST_INST;
  end
  else
  begin
    if GENERATION >= 2 then
    begin
      CardRNPrintForm.FromId := AVIAS_ID;
      CardRNPrintForm.FromInst := AVIAS_INST;
    end
    else
    begin
      CardRNPrintForm.FromId :=  qOIL_INST.AsInteger;
      CardRNPrintForm.FromInst := qOIL_INST.AsInteger;
    end;
  end;

  CardRNPrintForm.RnNumber.Text := qDoc_Number.AsString;

  case qCardScheme.AsInteger of
    1 : CardRNPrintForm.CardScheme := EK; //схема "электронный кошелек"
    2 : CardRNPrintForm.CardScheme := LS; //схема "лимитная схема"
  end;

  if qDoc_Number.asString = ''
   then CardRNPrintForm.RashNakType := dtNew
   else CardRNPrintForm.RashNakType := dtExists;

  //Определение периода РН
  if qDoc_Number.IsNull then
  begin
    CardRNPrintForm.deBeginDate.Date := q.FieldByName('Date_').asDateTime;
    CardRNPrintForm.deEndDate.Date := q.FieldByName('Date_').asDateTime;
    CardRNPrintForm.deCurDate.Date := q.FieldByName('Date_').asDateTime;
  end
  else
  begin
    //для лимитной схемы
    if qCardScheme.asInteger = 2 then
    begin
      qWork.Close;
      qWork.SQL.Text := 'select min(Date_) as Begin_Date, max(Date_) as End_Date, Max(Doc_date) as Doc_Date from v_Card_Transaction ' +
          ' where oper_num = 12 ' +
          ' and To_Id = ' + IntToStr(qTO_ID.AsInteger) +
          ' and To_Inst = ' + IntToStr(qTO_INST.AsInteger) +
          ' and Doc_Number = ''' + qDoc_Number.AsString + ''' ';
      qWork.Open;
    end
    else
    //для схемы ЭК
    begin
      qWork.Close;
      qWork.SQL.Text := 'select min(Date_) as Begin_Date, max(Date_) as End_Date, Max(Doc_date) as Doc_Date from v_Card_Transaction ' +
          ' where oper_num in (9,10,11) ' +
          ' and To_Id = ' + IntToStr(qTO_ID.AsInteger) +
          ' and To_Inst = ' + IntToStr(qTO_INST.AsInteger) +
          ' and Doc_Number = ''' + qDoc_Number.AsString + ''' ';
      qWork.Open;    
    end;

    CardRNPrintForm.deBeginDate.Date := qWork.FieldByName('Begin_Date').asDateTime;
    CardRNPrintForm.deEndDate.Date := qWork.FieldByName('End_Date').asDateTime;
    CardRNPrintForm.deCurDate.Date := qWork.FieldByName('Doc_Date').asDateTime;
  end;

  //Заполнение элементов формы значениями РН
  CardRNPrintForm.IsAlien := rbAlien.Checked;
  CardRNPrintForm.SbRnAuto.Down := qDoc_Number.IsNull;
  CardRNPrintForm.RnNumber.ReadOnly := qDoc_Number.IsNull;

  //Установка режима ввода номера
  if qDoc_Number.AsString = '' then
  begin
     CardRNPrintForm.RnNumber.Clear;
    CardRNPrintForm.RnNumber.Color := clBtnFace;
  end
  else CardRNPrintForm.RnNumber.Color := clWindow;

  If qCardScheme.asInteger = 2 then
  begin
    //Если уже выписана рн, то не нужно давать редактировать его параметры
    CardRNPrintForm.deBeginDate.Enabled :=  qDoc_Number.IsNull and not flDeleteRn;
    CardRNPrintForm.deEndDate.Enabled :=  qDoc_Number.IsNull and not flDeleteRn;
    CardRNPrintForm.deCurDate.Enabled :=  qDoc_Number.IsNull and not flDeleteRn;
    CardRNPrintForm.RnNumber.Enabled :=  qDoc_Number.IsNull and not flDeleteRn;
    CardRNPrintForm.sbRnAuto.Enabled :=  qDoc_Number.IsNull and not flDeleteRn;
    CardRNPrintForm.ceRnToName.Enabled :=  qDoc_Number.IsNull and not flDeleteRn;
  end;
  CardRNPrintForm.ShowModal;
  if CardRNPrintForm.ModalResult = mrOk
    then bbSearchClick(nil);
  CardRNPrintForm.Free;
  flDeleteRn := False;
end;

procedure TPrihCardRefForm.PrintReestrClick(Sender: TObject);
    var CardRNPrintForm:TCardRNPrintForm;
begin
fRecalc;
if q.isEmpty then abort;

//Открытие формы печати документов по карточкам
CardRNPrintForm := TCardRNPrintForm.Create(Application);
CardRNPrintForm.nbForms.ActivePage := 'ReestrForm';
CardRNPrintForm.Height := 190;
CardRNPrintForm.ReportNumber := 4;
CardRNPrintForm.Caption := TranslateText('Печать реестра расходных накладных');

//Заполнение элементов формы значениями реестра
CardRNPrintForm.DateReestr1.Date := deDate1.Date;
CardRNPrintForm.DateReestr2.Date := deDate2.Date;
CardRNPrintForm.ceReestrToName.Text := qToName.asString;
CardRNPrintForm.OrgId := qTo_Id.AsInteger;
CardRNPrintForm.OrgInst := qTo_Inst.AsInteger;

case qCardScheme.AsInteger of
  1 : CardRNPrintForm.CardScheme := EK; //схема "электронный кошелек"
  2 : CardRNPrintForm.CardScheme := LS; //схема "лимитная схема"
end;

CardRNPrintForm.ShowModal;
if CardRNPrintForm.ModalResult = mrOk
 then bbSearchClick(nil);
CardRNPrintForm.Free;
end;

procedure TPrihCardRefForm.miRefPrintClick(Sender: TObject);
begin
  dbg.DataSource.DataSet.DisableControls;
  PutGridEhToExcel(dbg, TranslateText('Движение по эл. картам'));
  dbg.DataSource.DataSet.EnableControls;
end;

procedure TPrihCardRefForm.sbEditClick(Sender: TObject);
var
  Card: TPrihCardForm;
  OnlyShow: Boolean;
begin
  OnlyShow := False;
  if q.IsEmpty then Abort;
  frmStart.ORASESSION1.StartTransaction;
  try
    // Проверка на период закрытия
    if StrToDate(Close_Date) >= q.FieldByName('Oper_Date').AsDateTime then OnlyShow := True
    else
    begin // Проверка не редактируется ли запись в этот момент
      qWork.Close;
      qWork.SQL.Text := 'select * from Card_Transaction where Oil_Id = '+ q.FieldByName('Oil_Id').AsString +
        ' and Oil_Inst = '+ q.FieldByName('Oil_Inst').AsString +' for update nowait';
      qWork.Open;
    end;
    Card := TPrihCardForm.Create(Application);

    // Активность работы элементов в зависимости от того где редактируется запись
    Card.eDogPrice.ReadOnly := Inst <> q.FieldByName('Oil_Inst').AsInteger;
    Card.eDovSer.ReadOnly := Inst <> q.FieldByName('Oil_Inst').AsInteger;
    Card.eDovNum.ReadOnly := Inst <> q.FieldByName('Oil_Inst').AsInteger;
    Card.deDovDate.ReadOnly := Inst <> q.FieldByName('Oil_Inst').AsInteger;
    Card.eDovPerson.ReadOnly := Inst <> q.FieldByName('Oil_Inst').AsInteger;
    Card.eDogPrice.Enabled := rbPlus.Checked and (q.FieldByName('Dog_Id').AsInteger = 0);

    // редагувати можна, якщо це ЕК-поповнення
    Card.ceDocNum.Enabled := q.FieldByName('Cause_Id').AsInteger in [5, 7, 6];
    Card.deDocDate.Enabled := Card.ceDocNum.Enabled;
    Card.sbClearDoc.Enabled := Card.ceDocNum.Enabled;

    if not Card.ceDocNum.Enabled then
    begin
      Card.ceDocNum.Color := clBtnFace;
      Card.deDocDate.Color := clBtnFace;
    end;

    Card.deDate.Enabled := false;
    Card.deTime.Enabled := false;
    Card.deLitr.Enabled := false;
    Card.deDate.Color := clBtnFace;
    Card.deTime.Color := clBtnFace;
    Card.deLitr.Color := clBtnFace;

    Card.sbUndoField.Enabled := qIs_CORR.AsInteger = 1;

    if OnlyShow then Card.bbOk.Enabled := False;
    Card.ShowModal;

    if Card.ModalResult = mrOk then
    begin
      if q.State <> dsBrowse then q.Post;
      frmStart.ORASESSION1.Commit;
      bbSearchClick(Nil);
    end
    else
    begin
      frmStart.ORASESSION1.Rollback;
      bbSearchClick(Nil);
    end;
    Card.Free;
  except on E:Exception do
    begin
    if Pos('ORA-00054:', E.Message) <> 0 then
      MessageDlg(TranslateText('Этот отпуск карточек редактируется другим пользователем !'), mtError, [mbOk], 0)
    else MessageDlg(E.Message, mtError, [mbOk], 0);
    frmStart.ORASESSION1.Rollback;
    bbSearchClick(Nil);
    q.EnableControls;
    end;
  end;
end;

procedure TPrihCardRefForm.dbgDblClick(Sender: TObject);
begin
edCardNum.text := dbg.DataSource.DataSet.FieldByName('Gr_Card_Num').AsString;
if dbg.DataSource = ds then
  begin
  ceToName.Text := dbg.DataSource.DataSet.FieldByName('ToName').AsString;
  To_Id := qTo_Id.AsInteger;
  To_Inst := qTo_Inst.AsInteger;
  ceEmName.Text := dbg.DataSource.DataSet.FieldByName('Emitent_Name').AsString;
  end
 else
  begin
  ceToName.Text := dbg.DataSource.DataSet.FieldByName('Alien_Name').AsString;
  ceEmName.Text := dbg.DataSource.DataSet.FieldByName('Emitent_Name').AsString;
  end;
end;

procedure TPrihCardRefForm.dbgGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
if (not dbg.DataSource.DataSet.IsEmpty) then
  begin
    if (dbg.DataSource.DataSet.FieldByName('Doc_Number').AsString = '')
    then
      if (State = [gdSelected]) or (State = [gdSelected, gdFocused]) then
          AFont.Color := clYellow
      else
        if not rbAlien.Checked then AFont.Color := $0000007F;
    //Отображение транзакций по лимитной схеме
    if (not rbAlien.Checked) then
      if (dbg.DataSource.DataSet.FieldByName('CardScheme').AsInteger = 2) and
         (dbg.DataSource.DataSet.FieldByName('Dog_Num').asString = '')
       then
       if (State = [gdSelected])  or (State = [gdSelected, gdFocused])
        then
          //AFont.Color := clYellow
        else
          BackGround := $00E5E5E5;
  end;

  {if (Column.FieldName = 'IS_CORR') and
     (qis_corr.AsInteger = 1)
  then Background := clMaroon
  else Background := clWindow;

  if (Column.FieldName = 'IS_CORR')
    then AFont.Color := Background;}

  if (dbg.DataSource.DataSet = qTransit) and not qTransit.IsEmpty then
  begin
    case qTransit.FieldByName('DocExist').AsInteger of
      0: AFont.Color := $0000007F;//Нет документа
      1: AFont.Color := clWindowText;//Есть документ
      2: AFont.Color := $007F0000;//Документ есть но не полностью
    end;
  end;   
end;

procedure TPrihCardRefForm.FormShow(Sender: TObject);
begin
  NPType := 0;
  deDate1.Date := now - 1;
  deDate2.Date := now;
  AZS_Id := 0;
  AZS_Inst := 0;
  miExchClient.Enabled := DBObjectExists('ecfil108','TABLE',AdmSettings.Get('CARD_USER'))
    and DBObjectExists('ecfil139','TABLE',AdmSettings.Get('CARD_USER'));
  miRecalcByCardPeriod.Visible := CardRecalc.RecalcPackage = 'CARD_RECALC_PARTITION';
  miRecalcByClientPeriod.Visible := CardRecalc.RecalcPackage = 'CARD_RECALC_PARTITION';
  AdditionFilter := afAll;
  lFilterStatus.Caption :='';
  strTransType:='70,71,72,73';
  bbSearchClick(nil);
  To_id :=0;
  To_inst := 0;
end;

procedure TPrihCardRefForm.qAfterPost(DataSet: TDataSet);
begin
  q.ApplyUpdates;
  q.CommitUpdates;
end;

procedure TPrihCardRefForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then
    Action := caFree;
end;

procedure TPrihCardRefForm.SpeedButton4Click(Sender: TObject);
begin
  deDogDate.Clear;
  eDogNum.Clear;
end;

procedure TPrihCardRefForm.ceAZSNameButtonClick(Sender: TObject);
 var
  vId, vInst: Integer;
  vName: String;
begin
if ChooseOrg.CaptureOrg(2, MAIN_ID, INST, 'yyy', vId, vInst, vName) then
  begin
  AZS_Id := vId;
  AZS_Inst := vInst;
  ceAZSName.Text := vName;
  end;
end;

procedure TPrihCardRefForm.sbCearAZSClick(Sender: TObject);
begin
ceAZSName.Text := '';
AZS_Id := 0;
AZS_Inst := 0;
end;

procedure TPrihCardRefForm.miExchClientClick(Sender: TObject);
  var ECC : TExchCardClientForm;
begin
  ECC := TExchCardClientForm.Create(Application);
  ECC.ShowModal;
  if ECC.ModalResult = mrOk then bbSearchClick(nil);
  ECC.Free;
end;



procedure TPrihCardRefForm.miAllClick(Sender: TObject);
begin
  rbMinus.Font.Color := clBlack;
  AdditionFilter := afEK;
  lFilterStatus.Caption := '';
  Application.ProcessMessages;
  bbSearchClick(nil);
end;

procedure TPrihCardRefForm.miAlienClick(Sender: TObject);
begin
  rbMinus.Font.Color := clBlue;
  AdditionFilter := afOnlyAlien;
  lFilterStatus.Caption := TranslateText('ФИЛЬТР: Списания на чужих АЗС ');
  Application.ProcessMessages;
  bbSearchClick(nil);
end;

procedure TPrihCardRefForm.miOwnClick(Sender: TObject);
begin
  rbMinus.Font.Color := clBlue;
  AdditionFilter := afOnlyOwn;
  lFilterStatus.Caption := TranslateText('ФИЛЬТР: Списания на своих АЗС ');
  Application.ProcessMessages;
  bbSearchClick(nil);
end;

procedure TPrihCardRefForm.miRnPrintedClick(Sender: TObject);
begin
  rbMinus.Font.Color := clBlue;
  AdditionFilter := afRnPrinted;
  lFilterStatus.Caption := TranslateText('ФИЛЬТР: Списания, по которым выписана расходная ');
  Application.ProcessMessages;
  bbSearchClick(nil);
end;

procedure TPrihCardRefForm.miRnNotPrintedClick(Sender: TObject);
begin
  rbMinus.Font.Color := clBlue;
  AdditionFilter := afRnNotPrinted;
  lFilterStatus.Caption := TranslateText('ФИЛЬТР: Списания, по которым НЕ выписана расходная  ');
  Application.ProcessMessages;
  bbSearchClick(nil);
end;

procedure TPrihCardRefForm.ppPrintDocPopup(Sender: TObject);
begin
  //Установка активности меню печати документов в зависимости от выбранного фильтр
  miDocEC.Enabled := (qCAUSE_ID.AsInteger <> 12) and not q.IsEmpty;
  miDopConsent.Enabled := RbPlus.Checked and not q.IsEmpty;
  PrintReestr.Enabled := (RbMinus.Checked or (qCAUSE_ID.AsInteger in [9, 12])) and not q.IsEmpty;
  miSeparator.Visible := not RbAll.Checked and not q.IsEmpty;
  // РН
  PrintRN.Enabled    := (rbMinus.Checked or rbLS.Checked) and (qCAUSE_ID.AsInteger in [9, 12]) and not q.IsEmpty; // 9 - списання ЕК; 12 - списання ЛС
  miDeleteRn.Enabled := PrintRN.Enabled and not qDOC_NUMBER.IsNull;
  // ЛС
  miInvoiceLs.Enabled    := rbLS.Checked and (qDOG_REAL_FOREPAY.AsInteger = 0) and not q.IsEmpty;
  miInvoiceLsDel.Enabled := miDocLS.Enabled and not qDOG_NUM.IsNull;
  // ЕК
  PrintZ.Enabled := RbPlus.Checked and not q.IsEmpty;
  DelZ.Enabled   := PrintZ.Enabled and not qDOG_NUM.IsNull;
end;

procedure TPrihCardRefForm.sbSumClick(Sender: TObject);
begin
  if sbSum.Down
    then dbg.FooterRowCount := 1
    else dbg.FooterRowCount := 0;
end;
procedure TPrihCardRefForm.miDeleteRnClick(Sender: TObject);
begin
  flDeleteRN := True;
  PrintRnClick(nil);
end;

procedure TPrihCardRefForm.dbgSortMarkingChanged(Sender: TObject);
var i : Integer;
begin
  with dbg do
   for i := 0 to SortMarkedColumns.Count-1 do
     if SortMarkedColumns[i].Title.SortMarker = smDownEh then
     begin
       OrderField:= 'order by '+SortMarkedColumns[i].FieldName;
       OrderDirection:='';
       break;
      end
      else
      if SortMarkedColumns[i].Title.SortMarker = smUpEh then
      begin
        OrderField:= 'order by '+ SortMarkedColumns[i].FieldName;
        OrderDirection:='DESC';
        break;
      end;
  bbSearchClick(nil);
end;


procedure TPrihCardRefForm.rbLSClick(Sender: TObject);
begin
  AdditionFilter := afLS;
  lFilterStatus.Caption := '';
  bbSearchClick(nil);
end;

procedure TPrihCardRefForm.miLSInvoicePrintedClick(Sender: TObject);
begin
  rbLS.Font.Color := clBlue;
  AdditionFilter := afInvoicePrinted;
  lFilterStatus.Caption := TranslateText('ФИЛЬТР: Списания ЛС, по которым выписана счет-фактура');
  Application.ProcessMessages;
  bbSearchClick(nil);
end;

procedure TPrihCardRefForm.miLSInvoiceNotPrintedClick(Sender: TObject);
begin
  rbLS.Font.Color := clBlue;
  AdditionFilter := afInvoiceNotPrinted;
  lFilterStatus.Caption := TranslateText('ФИЛЬТР: Списания ЛС, по которым НЕ выписана счет-фактура');
  Application.ProcessMessages;
  bbSearchClick(nil);
end;

procedure TPrihCardRefForm.miLSAllClick(Sender: TObject);
begin
  rbLS.Font.Color := clBlack;
  AdditionFilter := afLS;
  lFilterStatus.Caption := '';
  Application.ProcessMessages;
  bbSearchClick(nil);
end;

procedure TPrihCardRefForm.rbMinusClick(Sender: TObject);
begin
  lFilterStatus.Caption := '';
  AdditionFilter := afEK;
  bbSearchClick(nil);
end;

procedure TPrihCardRefForm.miLSBenzClick(Sender: TObject);
begin
   lFilterStatus.Caption := TranslateText('ФИЛЬТР: Списания ЛС, бензины');
   rbLS.Font.Color := clBlue;
   AdditionFilter := afBenzin;
   Application.ProcessMessages;
   bbSearchClick(nil);
end;

procedure TPrihCardRefForm.miLSDTClick(Sender: TObject);
begin
   lFilterStatus.Caption := TranslateText('ФИЛЬТР: Списания ЛС, дизельное топливо');
   rbLS.Font.Color := clBlue;
   AdditionFilter := afDT;
   Application.ProcessMessages;
   bbSearchClick(nil);
end;


procedure TPrihCardRefForm.SpeedButton5Click(Sender: TObject);
var
 frmHandTrans:TfrmHandTrans;
begin

 if TestPassword(pwtOrg) then
 begin
 frmHandTrans:=TfrmHandTrans.Create(self);
 frmHandTrans.TypeOper:=0;
 if(rbPlus.Checked) then
 frmHandTrans.TypeOper:=1;
 if(rbMinus.Checked) then
 frmHandTrans.TypeOper:=2;
 if(rbAlien.Checked)then
 frmHandTrans.TypeOper:=3;
 if(rbLS.Checked)   then
 frmHandTrans.TypeOper:=4;
 if(frmHandTrans.TypeOper=0)then
 begin
 MessageDlg(TranslateText('Выбирите тип пополнения\списания'),mtInformation,[mbOK],0);
  frmHandTrans.ModalResult:=mrCancel;
 end
 else
 begin
 frmHandTrans.ShowModal;
  if frmHandTrans.ModalResult=mrOk then
  bbSearchClick(self);
 end;
 end;
end;   

procedure TPrihCardRefForm.spbDelTransClick(Sender: TObject);
var strUsupovPart : TDateTime;
begin                   
  strUsupovPart := VarToDateTime(ReadOilVar('CARD_NEW_DATE'));
  if(strUsupovPart <= date) and (q.Active=true)then
    if (q.FieldByName('TRANS_TYPE').asInteger in [70,72]) and TestPassword(pwtOrg) then
      if(MessageDlg(TranslateText('Вы уверены что желаете удалить транзакцию?'),mtConfirmation,[mbYes,mbNo],0)=mrYes ) then
        try
          q.UpdateObject:=uq;
          q.RequestLive:=true;
          q.Edit;
          if(q.FieldByName('TRANS_TYPE').AsInteger = 70) then
            q.FieldByName('TRANS_TYPE').AsInteger := 71;
          if(q.FieldByName('TRANS_TYPE').AsInteger = 72) then
            q.FieldByName('TRANS_TYPE').AsInteger := 73;
          {BDE}
          {uq.SetParams(ukModify);}
          uq.ExecSQL(ukModify);
          bDirectUpdate:=true;
          bbSearchClick(self);
        except on E:Exception do
          begin
            if Pos('ORA-00054:', E.Message) <> 0
            then MessageDlg(TranslateText('Этот отпуск карточек редактируется другим пользователем !'), mtError, [mbOk], 0)
            else MessageDlg(E.Message, mtError, [mbOk], 0);
          end;
        end;
end;

procedure TPrihCardRefForm.N1Click(Sender: TObject);
begin
 lbTransType.Font.Color:=clBlack;
 N4.Checked:=false;
 N5.Checked:=false;
 N6.Checked:=false;
 N7.Checked:=false;
 N1.Checked:=true;
 strTransType:=' ';
 strTransType:='70,71,72,73';
 bbSearchClick(self);
end;

procedure TPrihCardRefForm.N4Click(Sender: TObject);
begin
lbTransType.Font.Color:=clBlue;
N4.Checked:=true;
N5.Checked:=false;
N6.Checked:=false;
N7.Checked:=false;
N1.Checked:=false;
//q.SQL.Delete(q.SQL.Count-3);

strTransType:='';
bbSearchClick(self);
end;

procedure TPrihCardRefForm.N5Click(Sender: TObject);
begin
    lbTransType.Font.Color:=clBlue;
N4.Checked:=false;
N5.Checked:=true;
N6.Checked:=false;
N7.Checked:=false;
N1.Checked:=false;
// q.SQL.Delete(q.SQL.Count-3);
strTransType:='';
  bbSearchClick(self);
end;

procedure TPrihCardRefForm.N6Click(Sender: TObject);
begin
    lbTransType.Font.Color:=clBlue;
N4.Checked:=false;
N5.Checked:=false;
N6.Checked:=true;
N7.Checked:=false;
N1.Checked:=false;
// q.SQL.Delete(q.SQL.Count-3);
strTransType:='';
  bbSearchClick(self);
end;

procedure TPrihCardRefForm.N7Click(Sender: TObject);
begin
    lbTransType.Font.Color:=clBlue;
N4.Checked:=false;
N5.Checked:=false;
N6.Checked:=false;
N7.Checked:=true;
N1.Checked:=false;
// q.SQL.Delete(q.SQL.Count-3);
strTransType:='';
  bbSearchClick(self);
end;

procedure TPrihCardRefForm.FormCreate(Sender: TObject);
var strUsupovPart : TDateTime;
begin
  inherited;
  beg:=true;
  begt:=true;
  LoadSQLByForm(TForm(Self));
  BaseSQL := q.SQL.Text;
  BaseSQLTransit := qTransit.SQL.Text;
  //Если включена лимитная схема
  miDocLS.Visible :=  'Y' = VarToStr(ReadOilVar('CARD_LS_ENABLE'));
  //Eсли включена гривневая схема
  chShowGrn.Visible := 'Y' = VarToStr(ReadOilVar('CARD_MONEY_ENABLE'));
  //включить анулирование транзакций начиная с даты OIL_VAR
  strUsupovPart := VarToDateTime(ReadOilVar('CARD_NEW_DATE'));
  SpeedButton5.Enabled := strUsupovPart <= date;
  spbDelTrans.Enabled := strUsupovPart <=date;
  lbTransType.Visible := strUsupovPart <= date;
  rxSpeedButton2.Visible := strUsupovPart <= date;
  
end;

procedure TPrihCardRefForm.N8Click(Sender: TObject);
var RR: TReport;
begin
  inherited;
  fRecalc;
  RR:=TReport.Create;
  try
    RR.GetFromFile(TranslateText('Отчет о транзакциях - ЛС'));
    MakeRulezReport(RR);
  finally
    RR.Destroy;
  end;
end;

procedure TPrihCardRefForm.chShowGrnClick(Sender: TObject);
begin
  dbg.FieldColumns['PURSE'].Visible := chShowGrn.Checked;
  dbg.FieldColumns['COUNT_PURSE'].Visible := chShowGrn.Checked;
end;

procedure TPrihCardRefForm.miRecalcByCardClick(Sender: TObject);
var
  IsPeriod: boolean;
begin
  if Sender <> nil then
    IsPeriod := pos('PERIOD',UpperCase((Sender as TMenuItem).Name))>0
  else
    IsPeriod := False;
  if not q.IsEmpty then
    RecalcByCard(qGr_Card_Num.AsInteger, qCardScheme.asInteger-1,
      qTo_Id.asInteger, qTo_Inst.AsInteger, true, IsPeriod);
end;

procedure TPrihCardRefForm.Panel1DblClick(Sender: TObject);
begin
  if Main.Debugging then
    ShowTextInMemo(q.Sql.Text);
end;

procedure TPrihCardRefForm.miRecalcByClientClick(Sender: TObject);
var
  IsPeriod: boolean;
begin
  if Sender <> nil then
    IsPeriod := pos('PERIOD',UpperCase((Sender as TMenuItem).Name))>0
  else
    IsPeriod := False;
  RecalcByClient(qTo_Id.AsInteger, qTo_Inst.AsInteger, true, IsPeriod);
end;

procedure TPrihCardRefForm.miRecalcAllClick(Sender: TObject);
begin
  if MessageDlg(TranslateText('Внимание! Операция полного пересчета может занять от 5 до 20 минут.')+#13#10+
                TranslateText('Продолжить?'),mtConfirmation,[mbYes,mbNo],0) = mrNo then Exit;
  RecalcByClient;
end;

(**
  Пересчет смарт-карт. Начало
*)

function CardRecalc: TCardRecalc;
begin
  if FCardRecalc = nil then
    FCardRecalc := TCardRecalc.GetClass;
  Result := FCardRecalc;
end;
// для ЛС
procedure RecalcByClient(AToId : Integer = 0; AToInst: Integer = 0;
  AIsShowMessage: Boolean = True; AIsPeriod: Boolean = False);
begin
  if (AToId > 0) and (AToInst > 0) and AIsShowMessage then
    if MessageDlg(TranslateText('Пересчитать транзакции по всем картам клиента?'),mtInformation,[mbYes,mbNo],0) = mrNo then
      Exit;
  StartSQL;
  try
    if (AToId = 0) and (AToInst = 0) then
      CardRecalc.Full   // Полный пересчет !
    else
      CardRecalc.Client(AToId, AToInst,AIsPeriod); // Пересчет по клиенту
    CommitSQL;
    if AIsShowMessage
      then MessageDlg(TranslateText('Пересчет закончен.'),mtInformation,[mbOk],0);
  except on e:exception do
    begin
      RollbackSQL;
      MessageToRecalc(e.message);
      if not AIsShowMessage then raise;
    end;
  end;
end;

procedure MessageToRecalc(sError: string);
begin
  if Pos('ORA-00054:', sError) <> 0 then
    MessageDlg(TranslateText('Пересчет запущен другим пользователем!'), mtWarning, [mbOk], 0)
  else
    MessageDlg(TranslateText('Ошибка пересчета: ') + sError +#13#10+ TranslateText('Обратитесь к разработчикам'),
      mtWarning, [mbOk], 0);
end;

procedure RecalcByCard(ACardNumber,ACardScheme, AToId, AToInst: Integer;
  AIsShowMessage: Boolean = True; AIsPeriod: Boolean = False);
var
  InsideTransaction : Boolean;
begin
  if AIsShowMessage
    then if MessageDlg(TranslateText('Пересчитать все транзакции по выбранной карте?'),mtInformation,[mbYes,mbNo],0) = mrNo
      then Exit;

  InsideTransaction := frmStart.ORASESSION1.InTransaction;
  StartSQL(InsideTransaction,'recalc');
  try
    if ACardScheme = 0 then
      CardRecalc.Card(ACardNumber, AIsPeriod) // ЭК
    else
      CardRecalc.Client(AToId, AToInst, AIsPeriod); // ЛС все равно по клиенту
    CommitSQL(InsideTransaction);
    if AIsShowMessage
      then MessageDlg(TranslateText('Пересчет закончен.'),mtInformation,[mbOk],0);
  except on e:exception do
    begin
      RollbackSQL(InsideTransaction,'recalc');
      MessageToRecalc(e.message);
      if not AIsShowMessage then raise;
    end;
  end;
end;

procedure fRecalc;
begin
  try
    CardRecalc.Changes;
  except on e:Exception do
    ShowMessage('Ошибка при пересчете смарт-карт: '+e.Message);
  end;
end;

(**
  TCardRecalc
*)

procedure TCardRecalc.Client(AToId,AToInst: integer; AIsPeriod: boolean);
begin
  if AIsPeriod then
    ApplicationInfo.Action := 'Пересчет: По клиенту за период'
  else
    ApplicationInfo.Action := 'Пересчет: По клиенту';
  try
    IsPeriod := AIsPeriod;
    DoClient(AToId,AToInst);
  finally
    ApplicationInfo.Action := '';
  end;
end;

procedure TCardRecalc.Card(ACardNumber: integer; AIsPeriod: boolean);
begin
  if AIsPeriod then
    ApplicationInfo.Action := 'Пересчет: По карте за период'
  else
    ApplicationInfo.Action := 'Пересчет: По карте';
  try
    IsPeriod := AIsPeriod;
    DoCard(ACardNumber)
  finally
    ApplicationInfo.Action := '';  
  end;
end;

procedure TCardRecalc.Changes;
begin
  ApplicationInfo.Action := 'Пересчет: Изменения';
  try
    if IsHaveChanges then
    begin
      if MessageDlg(TranslateText('Внимание! Найдены новые транзакции для пересчета. Пересчитать?')+#13#10+
        TranslateText('В случае отказа эти транзакции не будут учтены.'),mtInformation,[mbYes,mbNo],0) = mrNo then Exit;
      try
        StartSQL;
        DoChanges;
        CommitSQL;
        Application.MessageBox(PChar(TranslateText('Пересчет закончен')),PChar(TranslateText('Пересчет эл. карточек')),MB_OK + MB_ICONINFORMATION);
      except on E:Exception do
        begin
          RollbackSQL;
          MessageToRecalc(e.message);
         end;
      end;
    end;
  finally
    ApplicationInfo.Action := '';
  end;
end;

procedure TCardRecalc.Full;
begin
  ApplicationInfo.Action := 'Пересчет: Полный';
  try
    DoFull;
  finally
    ApplicationInfo.Action := '';
  end;
end;

procedure TCardRecalc.AddToRecalc(AId, AInst: integer; ACause: TToRecalcCause);
begin
  try
    case ACause of
      trcDog:
        _ExecSql(FInsToRecalc
          +'   where dog_id = :dog_id '
          +'     and dog_inst = :dog_inst ',
          ['dog_id',   AId,
           'dog_inst', AInst]);
      trcRequest:
        _ExecSql(FInsToRecalc
          +'  where request_id = :request_id '
          +'    and request_inst = :request_inst ',
          ['request_id',   AId,
           'request_inst', AInst]);
    end;
  except on E:Exception do
    MessageDlg(Format(TranslateText('Ошибка записи в %s:'),[FTableToRecalc])+E.Message,mtWarning,[mbOk],0);
  end;
end;

constructor TCardRecalc.Create;
begin
  Init;
end;

class function TCardRecalc.GetClass: TCardRecalc;
begin
  if (TCardRecalc.GetRecalcPackage = 'CARD_RECALC') then
    Result := TCardRecalcSingle.Create
  else if (TCardRecalc.GetRecalcPackage = 'CARD_RECALC_PARTITION') then
    Result := TCardRecalcPartition.Create
  else
    Result := nil;
end;

class function TCardRecalc.GetRecalcPackage: string;
begin
  if FRecalcPkg = '' then
  begin
    FRecalcPkg := nvl(GetSqlValue('select value from adm_settings where name = ''CARD_RECALC_PKG'' '),'CARD_RECALC');
    if (FRecalcPkg <> 'CARD_RECALC') and (FRecalcPkg <> 'CARD_RECALC_PARTITION') then
      raise Exception.Create('TCardRecalc.GetOraPackage:' + TranslateText('Ошибка при определении пакета'));
  end;
  result := FRecalcPkg;
end;

// TCardRecalcSingle
// -----------------

procedure TCardRecalcSingle.Init();
begin
  FInsToRecalc := 'insert into card_to_recalc '
    +' (card_number, inst, np_type, date_, time_, shema_type) '
    +'  select card_number, to_inst, np_type, date_, time_, 0 '
    +'    from v_card_transaction ';
  FTableToRecalc := 'CARD_TO_RECALC';
end;

procedure TCardRecalcSingle.DoClient(AToId,AToInst: integer);
begin
  _ExecSQL('begin CARD_RECALC.sp_recalc_by_client(:AToId, :AToInst); end;',
    ['AToId', AToId,
     'AToInst', AToInst]);
    { Кусочек истории:
      По старой системе можно сделать пересчет по ЛС клиенту следующим образом:
        CARD_RECALC.sp_recalc_card(:AToId,1)
    }
end;

procedure TCardRecalcSingle.DoCard(ACardNumber: integer);
begin
  _ExecSQL('begin CARD_RECALC.sp_recalc_card(:ACardNumber,0); end;',
    ['ACardNumber', ACardNumber]);
end;

function TCardRecalcSingle.IsHaveChanges: boolean;
var
  sp:TOilStoredProc;
begin
  sp:=TOilStoredProc.Create(nil);
  try
    sp.StoredProcName := 'CARD_RECALC.sp_is_must_recalc';
    sp.Execute;
    result := sp.ParamByName('RESULT').AsInteger > 0;
  finally
    sp.Free;
  end;
end;

procedure TCardRecalcSingle.DoChanges;
begin
  _ExecSQL('begin CARD_RECALC.sp_recalc_changes; end;');
end;

procedure TCardRecalcSingle.DoFull;
begin
  _ExecSQL('begin CARD_RECALC.sp_recalc_card; end;');
end;

(**
  TCardRecalcPartition
*)

procedure TCardRecalcPartition.Init();
begin
  FInsToRecalc := 'insert into card_to_recalc_part '
      +'  (oil_id, oil_inst, oper_date, '
      +'   oper_num, card_number, np_type, to_id, to_inst, shema_type) '
      +' select oil_id, oil_inst, oper_date, oper_num, card_number, np_type, to_id, to_inst, DECODE(id_схемы_обсл, 2, 1, 0) '
      +'   from v_card_transaction ';
  FTableToRecalc := 'CARD_TO_RECALC_PART';
end;

procedure TCardRecalcPartition.GetDatePartition(ADate: TDateTime;
  var ADatePartitionPrev: TDateTime; var ADatePartitionCurr: TDateTime);
var
  sp:TOilStoredProc;
begin
  sp:=TOilStoredProc.Create(nil);
  sp.StoredProcName:='CARD_RECALC_PARTITION.GetDatePartition';
  try
    sp.PrepareSQL;
    sp.ParamByName('ADate').AsDate := ADate;
    sp.Prepare;
    __ExecProc(sp);
    ADatePartitionPrev := sp.ParamByName('ADatePartitionPrev').AsDate;
    ADatePartitionCurr := sp.ParamByName('ADatePartitionCurr').AsDate;
  finally
    sp.Destroy;
  end;
end;

procedure TCardRecalcPartition.DoClient(AToId,AToInst: integer);
var
  bBeginDate, bEndDate: TDateTime;
begin
  if IsPeriod then
  begin
    GetDatePartition(GetSystemDate,bBeginDate, bEndDate);
    if bEndDate > GetSystemDate then
      bEndDate := GetSystemDate;
    if TFilterForm.GetDates(bBeginDate, bEndDate) then
    _ExecSQL('begin CARD_RECALC_PARTITION.sp_recalc_by_client_period(:AToId, :AToInst, :ABeginDate, :AEndDate); end;',
      ['AToId', AToId,
       'AToInst', AToInst,
       'ABeginDate', bBeginDate,
       'AEndDate', bEndDate])
  end
  else
    _ExecSQL('begin CARD_RECALC_PARTITION.sp_recalc_by_client(:AToId, :AToInst); end;',
      ['AToId', AToId,
       'AToInst', AToInst]);
end;

procedure TCardRecalcPartition.DoCard(ACardNumber: integer);
var
  bBeginDate, bEndDate: TDateTime;
begin
  if IsPeriod then
  begin
    GetDatePartition(GetSystemDate,bBeginDate, bEndDate);
    if bEndDate > GetSystemDate then
      bEndDate := GetSystemDate;
    if TFilterForm.GetDates(bBeginDate, bEndDate) then
      _ExecSQL('begin CARD_RECALC_PARTITION.sp_recalc_one_card_period(:ACardNumber, :ABeginDate, :AEndDate); end;',
        ['ACardNumber', ACardNumber,
         'ABeginDate', bBeginDate,
         'AEndDate', bEndDate])
  end
  else
    _ExecSQL('begin CARD_RECALC_PARTITION.sp_recalc_card(:ACardNumber); end;',
      ['ACardNumber', ACardNumber]);
end;

function TCardRecalcPartition.IsHaveChanges: boolean;
var
  sp:TOilStoredProc;
begin
  sp:=TOilStoredProc.Create(nil);
  try
    sp.StoredProcName := 'CARD_RECALC_PARTITION.sp_is_must_recalc';
    sp.Execute;
    Result := sp.ParamByName('RESULT').AsInteger > 0;
  finally
    sp.Free;
  end;
end;

procedure TCardRecalcPartition.DoChanges;
begin
  _ExecSQL('begin CARD_RECALC_PARTITION.sp_recalc_changes; end;');
end;

procedure TCardRecalcPartition.DoFull;
begin
  _ExecSQL('begin CARD_RECALC_PARTITION.sp_recalc_card_period(sysdate); end;');
end;

(**
  Пересчет смарт-карт. Конец
*)

//==============================================================================
procedure TPrihCardRefForm.sbViewRecalcClick(Sender: TObject);
begin
  if rbAlien.Checked or q.IsEmpty then Exit;
  PrihCardViewForm :=  TPrihCardViewForm.Create(Self);
  with PrihCardViewForm do
  begin
    FNpType := qNp_Type.AsInteger;
    FCardNumber := qGr_Card_Num.AsInteger;
    FToId := qTo_Id.AsInteger;
    FToInst := qTo_Inst.AsInteger;    
    FCardScheme:= qCardScheme.AsInteger;
    Caption := IntToStr(qGr_Card_Num.AsInteger);
    edtNp.Text := qNpType.AsString;
    edtCard.Text := qGr_Card_Num.AsString;
    bbSearch.Click;
  end;
  MainForm.DoMDIButton(PrihCardViewForm);
  PrihCardViewForm.Show;
end;
//==============================================================================
procedure TPrihCardRefForm.miDopConsentClick(Sender: TObject);
var
  DogRef: TDogRefForm;
begin
  if (q.FieldByName('DOG_NUM').AsString = '') and ((Sender as TMenuItem).Tag = 2) then
  begin
    MessageDlg(TranslateText('Не возможно распечатать дополнительное соглашения без заявки.'), mtInformation, [mbOk], 0);
    exit;
  end;
  DogRef := TDogRefForm.Create(Application);
  DogRef.NumApplication := q.FieldByName('DOG_NUM').AsString;
  DogRef.DateApplication := q.FieldByName('DOG_DATE').AsString;
  qReport.Close;
  qReport.ParamByName('OrgId').AsInteger := qTo_Id.AsInteger;
  qReport.ParamByName('OrgInst').AsInteger := qTo_Inst.AsInteger;
  _OpenQuery(qReport);
  case (Sender as TMenuItem).Tag of
    1: DogRef.DogRep('DogCard', dtK, qReport.FieldByName('id').AsInteger, qReport.FieldByName('inst').AsInteger);
    2: DogRef.DogRep('DogCardAdd', dtK, qReport.FieldByName('id').AsInteger, qReport.FieldByName('inst').AsInteger, true);
  end;
  DogRef.Free;
end;
//==============================================================================
procedure TPrihCardRefForm.MenuItem1Click(Sender: TObject);
begin
  lFilterStatus.Caption := '';
  AdditionFilter := afAll;
  bbSearchClick(nil);
end;
//==============================================================================
procedure TPrihCardRefForm.MenuItem2Click(Sender: TObject);
begin
  lFilterStatus.Caption := '';
  AdditionFilter := afReceiptInOC;
  bbSearchClick(nil);
end;
//==============================================================================
procedure TPrihCardRefForm.MenuItem3Click(Sender: TObject);
begin
  lFilterStatus.Caption := '';
  AdditionFilter := afDeferredReceipt;
  bbSearchClick(nil);
end;
//==============================================================================
procedure TPrihCardRefForm.N13Click(Sender: TObject);
begin
  lFilterStatus.Caption := '';
  AdditionFilter := afExpenseInOC;
  bbSearchClick(nil);
end;
//==============================================================================

procedure TPrihCardRefForm.miCardPrintLSClick(Sender: TObject);
var
  DogRef: TDogRefForm;
begin
  qWork.Close;
  qWork.SQL.Text := 'select Id, Inst, Forepay' +
    ' from oil_dog' +
   ' where to_ = '+ IntToStr(qTo_Id.AsInteger) +
     ' and to_inst = ' + IntToStr(qTo_Inst.AsInteger) +
     ' and sub_type = 101' +      // шукаємо самий ПЕРШИЙ договір по ЛС-карткок з клієнтом.
     ' and state = ''Y''' +
     ' and dog_date = (select min(t.dog_date)' +
                       ' from oil_dog t' +
                      ' where t.to_ = ' + IntToStr(qTo_Id.AsInteger) +
                        ' and t.to_inst = ' + IntToStr(qTo_Inst.AsInteger) +
                        ' and sub_type = 101' +
                        ' and state = ''Y''' +
                        ')';
  qWork.Open;
  DogRef := TDogRefForm.Create(Application);
  try
    DogRef.DogRep(IfThen(qWork.FieldByName('Forepay').Value = 1, 'DogCardLSPred', 'DogCardLSPosle'),
                  dtK,
                  qWork.FieldByName('Id').Value,
                  qWork.FieldByName('Inst').Value);
  finally
    DogRef.Free;
  end;
end;
//==============================================================================
procedure TPrihCardRefForm.PrintZClick(Sender: TObject);
begin
  PrintDog(dtRequest);
end;
//==============================================================================
procedure TPrihCardRefForm.miInvoiceLSClick(Sender: TObject);
begin
  PrintDog(dtInvoiceLS);
end;
//==============================================================================
procedure TPrihCardRefForm.DelZClick(Sender: TObject);
begin
  DelDog(dtRequest);
end;
//==============================================================================
procedure TPrihCardRefForm.miInvoiceLSDelClick(Sender: TObject);
begin
  DelDog(dtInvoiceLS);
end;
//==============================================================================
procedure TPrihCardRefForm.DelDog(DocType: TDocType);
var
  msg: string;
begin
  try
    if MessageDlgExt(TranslateText('Вы действительно хотите отвязать договор?'), mtConfirmation,
      [TranslateText('Да'), TranslateText('Нет')], 2) = 2 then exit;

    StartSqlOra;
    if not qDOG_ID.IsNull then
    begin
      _ExecSql('update Card_Transaction set Dog_ID = null, Dog_INST = null, ' +
        decode([DocType,
                dtInvoiceLS, 'Chek_Number = null, Chek_Date = null',
                'Doc_Number = null, Doc_Date = null, Request_ID = null, Request_INST = null']) +
        ' where Dog_ID = :Dog_ID and Dog_INST = :Dog_INST',
        ['Dog_ID', qDOG_ID.AsInteger, 'Dog_INST', qDOG_INST.AsInteger]);

      if MessageDlgExt(TranslateText('Удалить договор со справочника договоров?'), mtConfirmation,
        [TranslateText('Да'), TranslateText('Нет')], 2) = 1 then
      begin
        msg := TestDogLink(qDOG_ID.AsInteger, qDOG_INST.AsInteger,
          TranslateText('Нельзя удалить договор, есть документ ссылающийся на этот договор: %s от %s.') +
            #13#10+ TranslateText('Удалите этот документ, а потом удаляйте договор.'));
        if msg <> '' then raise Exception.Create(msg);
        // видалення договору
        _ExecSql('update oil_dog set state = ''N'' where ID = :Dog_ID and INST = :Dog_INST',
          ['Dog_ID', qDOG_ID.AsInteger, 'Dog_INST', qDOG_INST.AsInteger]);

        DelBill(0, 0, qDOG_ID.AsInteger, qDOG_INST.AsInteger); // видалення рахунку
      end;
    end
    else
      _ExecSql('update Card_Transaction set Dog_ID = null, Dog_INST = null, ' +
        decode([DocType,
                dtInvoiceLS, 'Chek_Number = null, Chek_Date = null',
                'Doc_Number = null, Doc_Date = null, Request_ID = null, Request_INST = null']) +
        ' where To_ID = :To_ID and To_INST = :To_INST and ' +
        decode([DocType,
                dtInvoiceLS, 'Chek_Number = :Dog_Num and Chek_Date = :Dog_Date and Id_Схемы_Обсл = 2',
                'Doc_Number = :Dog_Num and Doc_Date = :Dog_Date and Id_Схемы_Обсл <> 2']),
        ['Dog_Num',  qDOG_NUM.AsString,
         'Dog_Date', qDOG_DATE.AsDateTime,
         'To_ID',    qTo_ID.AsInteger,
         'To_INST',  qTo_INST.AsInteger]);
    CommitSqlOra;
  except on E: Exception do
    begin
      RollBackSQL;
      MessageDlg(TranslateText('Ошибка: ')+ E.message, mtError, [mbOk], 0);
    end;
  end;
  bbSearchClick(nil);
end;
//==============================================================================
procedure TPrihCardRefForm.PrintDog(DocType: TDocType);
var
  F: TCardRNPrintForm;
begin
  fRecalc;
  if q.isEmpty then abort;

  if (DocType = dtInvoiceLS) and (qCardScheme.AsInteger <> 2) then
  begin
    MessageDlg(TranslateText('Операцию можно выполнить только по картам ЛС!'), mtInformation, [mbOk],0);
    abort;
  end;

  F := TCardRNPrintForm.Create(Application);
  F.nbForms.ActivePage := 'DocActive';
  F.Height := 160;
  F.ReportNumber := 2;
  F.DocType := DocType; // ЕК - заявка, ЛС - рахунок-фактур

  // якщо договір вже є, то дозволяємо тільки друк
  if qDOG_NUM.IsNull then
  begin // договір відсутній
    // підтягуємо період у фільтр
    F.deReqDBegin.Date := q.FieldByName('Date_').AsDateTime;
    F.deReqDEnd.Date := q.FieldByName('Date_').AsDateTime;
    F.deReqDogDate.Date := q.FieldByName('Date_').AsDateTime;

    F.ceReqDog.Width := 90;
    F.sbReqNAuto.Visible := true;

    F.Caption :=
      decode([DocType,
              dtInvoiceLS, TranslateText('Печатать/Привязать счет-фактуру'),
              TranslateText('Печатать/Привязать заявку')]);
  end
  else
  begin // договір є
    qWork.Close;
    qWork.SQL.Text :=
      'select MIN(Date_) as Begin_Date, MAX(Date_) as End_Date, MAX(Dog_Date) as Dog_Date' +
      '  from V_Card_Transaction' +
      ' where To_ID = :To_ID and To_INST = :To_INST and Dog_Num = :Dog_Num and Dog_Date = :Dog_Date and ' +
      decode([DocType, dtInvoiceLS, 'oper_num = 12', 'oper_num in (3,4,5,6,7)']);
    _OpenQueryPar(qWork,
      ['Dog_Num',  qDOG_NUM.AsString,
       'Dog_Date', qDOG_DATE.AsDateTime,
       'To_id',    qTO_ID.AsInteger,
       'To_inst',  qTO_INST.AsInteger]);

    // підтягуємо період у фільтр
    F.deReqDBegin.Date := qWork.FieldByName('Begin_Date').asDateTime;
    F.deReqDEnd.Date := qWork.FieldByName('End_Date').asDateTime;
    F.deReqDogDate.Date :=
      decode([DocType,
              dtInvoiceLS, qWork.FieldByName('Dog_Date').AsDateTime,
              q.FieldByName('Dog_Date').AsDateTime]);

    F.RequestReadOnly();

    F.Caption :=
      decode([DocType,
              dtInvoiceLS, TranslateText('Печатать счет-фактуру'),
              TranslateText('Печатать заявку')]);
  end;
  F.ReqDogID := qDOG_ID.AsInteger;
  F.ReqDogINST := qDOG_INST.AsInteger;
  F.RequestID := qREQUEST_ID.AsInteger;
  F.RequestINST := qREQUEST_INST.AsInteger;

  // підтягуємо клієнта
  F.ceReqOrg.Text := qToName.AsString;
  F.ReqOrgID := qTo_Id.AsInteger;
  F.ReqOrgINST := qTo_Inst.AsInteger;

  // взнаємо номер договору
  F.ceReqDog.Text := qDOG_NUM.AsString;
  F.GetDocNumber();

  F.ShowModal;
  bbSearchClick(nil);
  F.Free;
end;
//==============================================================================
end.
