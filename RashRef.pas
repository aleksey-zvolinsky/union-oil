unit RashRef;

interface

uses uCommonForm,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, ToolEdit, Mask, StdCtrls, Db, DBTables, Grids, DBGrids, Buttons,
  ExtCtrls, Menus, RXCtrls, ComObj, Placemnt, ComCtrls, RXDBCtrl, ImgList,
  ActiveX, ListSelect, {$IFDEF VER120} OleCtrls, {$ENDIF}
  Excel8TLB, CurrEdit, MemDS, DBAccess, Ora, DBGridEh, ActnList,RashSop,
  RXSplit,uOilQuery,uOilStoredProc{$IFDEF VER150},Variants, GridsEh,
  DBGridEhGrouping{$ENDIF};

type
  TRashRefForm = class(TBaseForm)
    Label1: TLabel;
    Label3: TLabel;
    edActDate_B: TDateEdit;
    edOper: TComboEdit;
    sbClearOper: TSpeedButton;
    sbClearPart: TSpeedButton;
    edPart: TComboEdit;
    lPart: TLabel;
    Label4: TLabel;
    lAuto_: TLabel;
    lTo: TLabel;
    lFrom: TLabel;
    edFrom: TComboEdit;
    edTo: TComboEdit;
    edAuto: TComboEdit;
    sbClearAuto: TSpeedButton;
    sbClearTo: TSpeedButton;
    sbClearFrom: TSpeedButton;
    qID: TFloatField;
    qDATE_: TDateTimeField;
    qTO_ID: TFloatField;
    qTO_INST: TFloatField;
    qTO_PLACE: TStringField;
    qOPER_ID: TFloatField;
    qTTN_NUM: TStringField;
    qTTN_DATE: TDateTimeField;
    qWAY_LIST: TStringField;
    qDOV_SERIAL: TStringField;
    qDOV_NUM: TStringField;
    qDOV_DATE: TDateTimeField;
    qDOV_GIVE: TStringField;
    qAUTO_ID: TFloatField;
    qAUTO_INST: TFloatField;
    qPART_ID: TFloatField;
    qPART_INST: TFloatField;
    qPACK: TStringField;
    qTEMPER: TStringField;
    qUD_WEIG: TFloatField;
    qLITR: TFloatField;
    qCOUNT_: TFloatField;
    qPRICE: TFloatField;
    qINCL_DEBET: TStringField;
    qSBOR_POST: TStringField;
    qSBOR_NAC: TStringField;
    qSBOR_NDS: TStringField;
    qUCH_PRICE: TStringField;
    qOWN_GOOD: TStringField;
    qFROM_NAME: TStringField;
    qTO_NAME: TStringField;
    qNP_TYPE: TFloatField;
    qNP_TYPE_NAME: TStringField;
    qDOG: TStringField;
    qDOG_DATE: TDateTimeField;
    qOPER_NAME: TStringField;
    qINST: TFloatField;
    qEMP_ID: TFloatField;
    qEMP_INST: TFloatField;
    qFROM_ID: TFloatField;
    qFROM_INST: TFloatField;
    qAUTO_NUMB: TStringField;
    qAUTO_DRIVER: TStringField;
    qAUTO_ATP: TStringField;
    qDIM_NAME: TStringField;
    edID: TRxCalcEdit;
    qSS: TFloatField;
    qFROM_BOSS: TStringField;
    qFROM_OKPO: TStringField;
    qFROM_RACH_CHET: TStringField;
    qFROM_MFO: TStringField;
    qTO_BOSS: TStringField;
    qTO_OKPO: TStringField;
    qTO_RACH_CHET: TStringField;
    qTO_MFO: TStringField;
    qFROM_ADDR: TStringField;
    qTO_ADDR: TStringField;
    qDOR_SBOR: TFloatField;
    qNN_ID: TFloatField;
    qFROM_PHONE: TStringField;
    qTO_PHONE: TStringField;
    qREZ_ID: TFloatField;
    qREZ_INST: TFloatField;
    qREZ_NAME: TStringField;
    qREZ_NUM: TStringField;
    qPART_ORG_ID: TFloatField;
    qPART_ORG_INST: TFloatField;
    qNP_GRP: TFloatField;
    qNP_GRP_NAME: TStringField;
    qBASE_: TFloatField;
    Label2: TLabel;
    edActDate_E: TDateEdit;
    Bevel1: TBevel;
    qCOMM: TStringField;
    qOWN_GOODS: TStringField;
    qPRIH: TFloatField;
    qPRIH_INST: TFloatField;
    qPRIH_PART: TFloatField;
    qPRIH_PART_INST: TFloatField;
    qPRIH_NP_TYPE: TFloatField;
    qPRIH_NP_TYPE_NAME: TStringField;
    qPRIH_DOG: TStringField;
    qPRIH_DOG_DATE: TDateTimeField;
    qPRIH_NP_GRP: TFloatField;
    qPRIH_NP_GRP_NAME: TStringField;
    qPRIH_OWN_GOODS: TStringField;
    pmAdd: TPopupMenu;
    RxSpeedButton1: TRxSpeedButton;
    miRash: TMenuItem;
    miRashPP: TMenuItem;
    miRashOut: TMenuItem;
    sbClearID: TSpeedButton;
    sbClearDate_B: TSpeedButton;
    sbClearDate_E: TSpeedButton;
    Label10: TLabel;
    edNP_Type: TComboEdit;
    sbClearNPType: TSpeedButton;
    qNDS: TFloatField;
    qPLAN_ID: TStringField;
    qKP_DOG: TStringField;
    qKP_COUNT: TFloatField;
    qKP_PRICE: TFloatField;
    qKP_SUMM_NDS: TFloatField;
    qKP_ID: TFloatField;
    qKP_INST: TFloatField;
    qKP_DATE: TDateTimeField;
    qR_FROM_: TFloatField;
    qR_FROM_INST: TFloatField;
    qR_TO_: TFloatField;
    qR_TO_INST: TFloatField;
    qFROM_ID2: TFloatField;
    qFROM_INST2: TFloatField;
    qTO_ID2: TFloatField;
    qTO_INST2: TFloatField;
    lKP_Dog: TLabel;
    edKP_Dog: TComboEdit;
    bClearKP_Dog: TSpeedButton;
    qFROM_SVID_NUM: TStringField;
    qFROM_NAL_NUM: TStringField;
    qTO_SVID_NUM: TStringField;
    qTO_NAL_NUM: TStringField;
    qSUMM: TFloatField;
    qFROM_BANK_NAME: TStringField;
    qTO_BANK_NAME: TStringField;
    qNN_INST: TFloatField;
    miRashRR: TMenuItem;
    qPRIH_REZ_ID: TFloatField;
    qPRIH_REZ_INST: TFloatField;
    qPRIH_REZ_NUM: TStringField;
    qParent: TOilQuery;
    Label5: TLabel;
    EdTTN: TEdit;
    sbClearTTN: TSpeedButton;
    qFROM_ID_NUM: TStringField;
    qTO_ID_NUM: TStringField;
    qEMPLOY_ID: TFloatField;
    qEMPLOY_INST: TFloatField;
    qDriver: TOilQuery;
    NNQuery: TOilQuery;
    sbOperTypeList: TSpeedButton;
    spNpTypeList: TSpeedButton;
    ShortQ: TOilQuery;
    FloatField1: TFloatField;
    DateTimeField1: TDateTimeField;
    StringField1: TStringField;
    FloatField5: TStringField;
    DateTimeField2: TDateTimeField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    DateTimeField3: TDateTimeField;
    StringField5: TStringField;
    FloatField8: TFloatField;
    StringField6: TStringField;
    StringField7: TStringField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    DateTimeField4: TDateTimeField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    FloatField23: TFloatField;
    ShortQSUMM: TFloatField;
    ShortQINST: TFloatField;
    ShortQTO_ID: TFloatField;
    ShortQOPER_ID: TFloatField;
    ShortQPRIH: TFloatField;
    DataSource1: TOraDataSource;
    ShortQTO_INST: TFloatField;
    ShortQFROM_ID: TFloatField;
    ShortQFROM_INST: TFloatField;
    ShortQNP_TYPE: TFloatField;
    Query1: TOilQuery;
    il: TImageList;
    ShortQPART_INST: TFloatField;
    qTemp: TOilQuery;
    edDovNum: TEdit;
    sbClearDovNum: TSpeedButton;
    Label6: TLabel;
    qKP_EXP_DATE: TDateTimeField;
    qISSHTUKI: TStringField;
    qISFASOV: TStringField;
    qDIM_ID: TFloatField;
    qFROM_RACH_CHET_NDS: TStringField;
    qTO_RACH_CHET_NDS: TStringField;
    qDocPrint: TOilQuery;
    DataSource2: TOraDataSource;
    qDoc: TOilQuery;
    dsDoc: TOraDataSource;
    qDocDATE_: TDateTimeField;
    qDocOPER_NAME: TStringField;
    qDocOPER_ID: TFloatField;
    qDocSUM_LITR: TFloatField;
    qDocSUM_COUNT: TFloatField;
    qDocFROM_NAME: TStringField;
    qDocTO_NAME: TStringField;
    qDocPOS_COUNT: TFloatField;
    qDocKP_ID: TFloatField;
    qDocKP_INST: TFloatField;
    qDocFROM_ID: TFloatField;
    qDocFROM_INST: TFloatField;
    qDocKP_DOG: TStringField;
    qDocKP_DATE: TDateTimeField;
    qDocISSHTUKI: TStringField;
    qDocTITLE: TStringField;
    ShortQAUTO_ID: TFloatField;
    ShortQAUTO_INST: TFloatField;
    ShortQISSHTUKI: TStringField;
    miRashSop: TMenuItem;
    qGROUP_NUM: TFloatField;
    ShortQGROUP_NUM: TFloatField;
    qNN: TOilQuery;
    qNNNN_ID: TFloatField;
    qNNNN_INST: TFloatField;
    qNNNUM: TStringField;
    sbColDanie: TSpeedButton;
    cbColDanie: TRxCheckListBox;
    qCERT_NAME: TStringField;
    ShortQNN_NUM: TStringField;
    ShortQKP_DOG: TStringField;
    ShortQSUMMA: TFloatField;
    ShortQKP_DATE: TDateTimeField;
    ShortQKP_ID: TFloatField;
    ShortQKP_INST: TFloatField;
    qNN_NUM: TStringField;
    qSUMMA: TFloatField;
    qCert: TOilQuery;
    qDocFilRn: TOilQuery;
    qDocFilAct: TOilQuery;
    qDocTO_ID: TFloatField;
    qDocTO_INST: TFloatField;
    sbUnErase: TSpeedButton;
    N1: TMenuItem;
    miDog: TMenuItem;
    miDopConsent: TMenuItem;
    miKPPosle: TMenuItem;
    miKPPred: TMenuItem;
    miPerinNN: TMenuItem;
    miPrnRashNak: TMenuItem;
    miRashNakSop: TMenuItem;
    miTtnGroup: TMenuItem;
    miTTNBlank: TMenuItem;
    miTTN: TMenuItem;
    miFilialMotion: TMenuItem;
    mActDiscard: TMenuItem;
    miTTNExcel: TMenuItem;
    qTRAILER_ID: TFloatField;
    qTRAILER_INST: TFloatField;
    qTRAILER_NUMB: TStringField;
    ShortQTRAILER_ID: TFloatField;
    ShortQTRAILER_INST: TFloatField;
    ShortQTRAILER_NUMB: TStringField;
    qSTAMP: TStringField;
    qUD_WEIG_20: TFloatField;
    ShortQCERT_NAME: TStringField;
    ShortQUD_WEIG_20: TFloatField;
    actPrintTTNExcel: TAction;
    ShortQSTAMP: TStringField;
    qDocTTN_NUM: TStringField;
    qDocTTN_DATE: TDateTimeField;
    qDocINST: TFloatField;
    qDetailNP_TYPE: TStringField;
    qDetailDOG: TStringField;
    qDetailSHTUKI: TFloatField;
    qDetailPRICE: TFloatField;
    qDetailSUMMA: TFloatField;
    qDetailR_FROM_: TFloatField;
    qDetailR_FROM_INST: TFloatField;
    qDetailSS: TFloatField;
    qDetailSERT: TStringField;
    pnlPageControl: TPanel;
    PageControl: TPageControl;
    DataSheet: TTabSheet;
    gr: TDBGridEh;
    DocSheet: TTabSheet;
    dbgDoc: TDBGridEh;
    qKP_COUNT_DOG: TFloatField;
    qKP_PRICE_DOG: TFloatField;
    qTANK_POSITION: TFloatField;
    ShortQTANK_POSITION: TFloatField;
    qOS_USER: TStringField;
    qMACHINE: TStringField;
    ShortQOS_USER: TStringField;
    ShortQMACHINE: TStringField;
    qUSER_NAME: TStringField;
    ShortQUSER_NAME: TStringField;
    lToPar: TLabel;
    ceToPar: TComboEdit;
    sbClearToPar: TSpeedButton;
    Label7: TLabel;
    cbGoods: TComboBox;
    sbClearGoods: TSpeedButton;
    miPricePart: TMenuItem;
    N13: TMenuItem;
    procedure bbSearchClick(Sender: TObject);
    procedure sbClearPartClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure sbClearOperClick(Sender: TObject);
    procedure sbClearFromClick(Sender: TObject);
    procedure sbClearToClick(Sender: TObject);
    procedure sbClearAutoClick(Sender: TObject);
    procedure edOperButtonClick(Sender: TObject);
    procedure edFromButtonClick(Sender: TObject);
    procedure edToButtonClick(Sender: TObject);
    procedure edPartButtonClick(Sender: TObject);
    procedure edAutoButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject); Override;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miPerinNNClick(Sender: TObject);
    procedure miPrnRashNakClick(Sender: TObject);
    procedure miTTNClick(Sender: TObject);
    procedure sbUnEraseClick(Sender: TObject);
    procedure bbUnEraseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miRashClick(Sender: TObject);
    procedure miRashPPClick(Sender: TObject);
    procedure miRashOutClick(Sender: TObject);
    procedure sbClearIDClick(Sender: TObject);
    procedure sbClearDate_BClick(Sender: TObject);
    procedure sbClearDate_EClick(Sender: TObject);
    procedure miKPPredClick(Sender: TObject);
    procedure sbClearNPTypeClick(Sender: TObject);
    procedure edNP_TypeButtonClick(Sender: TObject);
    procedure grDblClick(Sender: TObject);
    procedure grKeyPress(Sender: TObject; var Key: Char);
    procedure edKP_DogButtonClick(Sender: TObject);
    procedure bClearKP_DogClick(Sender: TObject);
    procedure miRashRRClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure sbClearTTNClick(Sender: TObject);
    procedure sbOperTypeListClick(Sender: TObject);
    procedure spNpTypeListClick(Sender: TObject);
    procedure sbClearDovNumClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure sbClearGoodsClick(Sender: TObject);
    procedure miRashSopClick(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure MakeSopRashNak(p_Inside: Boolean = true);//Печать сопутствующего товара
    procedure cbDetClick(Sender: TObject);
    procedure miRashNakSopClick(Sender: TObject);
    procedure cbColClickCheck(Sender: TObject);
    procedure sbColClick(Sender: TObject);
    procedure sbColDanieClick(Sender: TObject);
    procedure cbColDanieClickCheck(Sender: TObject);
    procedure sbSumClick(Sender: TObject);
    procedure grDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure ShortQCalcFields(DataSet: TDataSet);
    procedure spbSelectAllClick(Sender: TObject);
    procedure spbCloseTunePanelClick(Sender: TObject);
    procedure miFilialMotionClick(Sender: TObject);
    procedure mActDiscardClick(Sender: TObject);
    procedure spbClearColConfigClick(Sender: TObject);
    procedure edPartChange(Sender: TObject);
    procedure sbTotalClick(Sender: TObject);
    procedure actPrintTTNExcelExecute(Sender: TObject);
    procedure actPrintTTNExcelUpdate(Sender: TObject);
    procedure MI1Click(Sender: TObject);
    procedure sbClearToParClick(Sender: TObject);
    procedure ceToParButtonClick(Sender: TObject);
    procedure miPricePartClick(Sender: TObject);
  private
    FToParId, FToParInst: integer;
    procedure ReopenQDoc;
    //Печать акта на передачу топлива с указанием цыстерн и жд-накладных
    procedure PrintAct(
      AList: Variant;//эксельный лист
      AQuery: TOilQuery;//кверя из которой данные брать
      AFieldList: string;//список полей из квери  'Номер по порядку;Жд накладная;цистерна;Количество',
      AFromId, AFromInst, AToId, AToInst: integer;
      ADog: String; ADogDate,//договор
      ADate: TDateTime//дата документа
      );
    function IsInsideShift:boolean;
    procedure ChangeDet;
    procedure SetMenu;
    procedure OpenQDet;
  public
    OperList: string;
    TypeList: string;
    // Процедура которая переносит текущую выбраную строку из быстрого запроса в долгий
    procedure ShortToLong(AUseTTNNum: boolean = false);
  end;

var
  RashRefForm: TRashRefForm;

implementation

Uses OperTypeRef, AutoRef, PartRef, Main, OilStd, Rash, UDbFunc,
     Progr, RashPP, RashOut, NPTypeRef, DogRef, RashRR, ViewDoc,
     RefPrint, ChooseOrg, LogSaleDeadbeat, uStart, TaxBillPrint, MoneyFunc,
     ExcelFunc,ExFunc,RashNakPrint, ThirdPartyPrint;

{$R *.DFM}

//-------------------- Поиск ------------------------

procedure TRashRefForm.bbSearchClick(Sender: TObject);
// Обновление списка записей на основании граничных условий
var
  BM: TBookMark;
  qq: TOilQuery;
begin
  BM := gr.DataSource.DataSet.GetBookMark;

  edKP_Dog.Enabled := true;
  // Формирование запроса
  if not sbSpeedUp.Down then
    qq := q
  else
    qq := ShortQ;
  try
    with qq do
    begin
      if Sender <> sbTotal then
      begin
        Close;
        DS.DataSet := qq;
        qq.RestoreSQL;
        // Номер накладной
        If edId.Value <> 0 Then
        begin
          AddWhere('r.ID = :id ');
          ParamByName('id').AsInteger := trunc(edId.Value);
        end;
        //штучный товар
        case cbGoods.ItemIndex of
          0 : AddWhere(' (r.ISSHTUKI = ''Y'' or r.GROUP_NUM is not null)' );
          1 : AddWhere(' r.ISSHTUKI =  ''N''' );
        end;
        // Тип операции
        if edOper.Text <> '' then
        begin
          AddWhere(' r.Oper_Id = :OperId');
          ParamByName('OperId').AsInteger := edOper.Tag;
        end;
        // Операции можно выбирать списком
        if sbOperTypeList.Down then
          AddWhere(' r.oper_id in '+OperList);
        // Партия
        if edPart.Text <> '' then
          AddWhere(' r.Part_Id = '+IntToStr(edPart.Tag));
        if lPart.Tag <> 0 then
          AddWhere(' r.Part_Inst = '+IntToStr(lPart.Tag))
        else if edPart.Tag <> 0 then
          AddWhere(' r.Part_Inst = (Select min(Inst) From V_OIL_PART WHERE Id ='+ IntToStr(edPart.Tag) +')');
        // Поставик
        if edFrom.Text <> '' then
        begin
          AddWhere(' r.From_Id = :FromId And r.From_Inst = :FromInst');
          ParamByName('FromId').AsInteger := edFrom.Tag;
          ParamByName('FromInst').AsInteger := lFrom.Tag;
        end;
        // Номер ТТН
        if edTTN.Text <> '' Then
          AddWhere(' r.TTN_Num = '''+ edTTN.Text +'''');
        // Покупатель
        if edTo.Text <> '' Then
          AddWhere(' r.To_Id = '+IntToStr(edTo.Tag)+' And r.To_Inst='+IntToStr(lTo.Tag));
        // Кому пренадлежит покупатель
        if ceToPar.Text <> '' then
        begin
          AddWhere(' (r.To_Id, r.To_Inst) in (select id, inst from v_oil_azs where par = :AToParId and par_inst = :AToParInst) ' );
          ParamByName('AToParId').AsInteger := FToParId;
          ParamByName('AToParInst').AsInteger := FToParInst;
        end;
        // Тип нефтепродукта может быть выбран один
        if edNP_Type.Text <> '' Then
          AddWhere(' r.NP_Type = '+IntToStr(edNP_Type.Tag));
        // Или списком
        if spNpTypeList.down then
          AddWhere(' r.np_type in '+TypeList);
        // Автомобиль
        if edAuto.Text <> '' Then
          AddWhere(' r.auto_id = '+IntToStr(edAuto.Tag)+' and r.auto_inst='+IntToStr(lAuto_.Tag));
        // Номер доверенности
        If edDovNum.Text <> '' Then
          AddWhere(' r.dov_num = '''+edDovNum.Text+'''');
        // Диапазон дат: начало
        If edActDate_B.date <> 0 Then
        begin
          AddWhere(' r.Date_ >= :BeginDate ');
          ParamByName('BeginDate').AsDate := edActDate_B.Date;
        end;
        // Диапазон дат: конец
        If edActDate_E.date <> 0 Then
        begin
          AddWhere(' r.Date_ <= :EndDate ');
          ParamByName('EndDate').AsDate := edActDate_E.Date;
        end;
        // Номер договора купли-продажи
        If edKP_Dog.Text <> '' Then
          AddWhere(' r.KP_ID = '+IntToStr(edKP_Dog.Tag)+' And r.KP_Inst = '+IntToStr(lKP_Dog.Tag));
        SetOrderBy('r.date_ desc, r.id');
        DisableControls;
        _OpenQuery(qq);
       end;
      qq.EnableControls;
    End;
    ReopenQDoc;
  Except On E:Exception Do
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
  End;

  if gr.DataSource.DataSet.BookmarkValid(BM) then
    gr.DataSource.DataSet.GotoBookMark(BM);
  gr.DataSource.DataSet.FreeBookMark(BM);
end;

procedure TRashRefForm.ReopenQDoc;
begin
  {}
  if PageControl.ActivePageIndex <> 1
    then Exit;
  qDoc.ParamByName('To_id').value := null;
  qDoc.ParamByName('To_inst').value := null;
  qDoc.ParamByName('from_id').value := null;
  qDoc.ParamByName('from_inst').value := null;
  qDoc.ParamByName('isshtuki').value := null;

  if edActDate_E.Date = 0 then edActDate_E.date := GetSystemDate;
  if edActDate_B.Date = 0 then edActDate_B.date := GetSystemDate-5;
  qDoc.Close;
  qDoc.ParamByName('FromDate').asDate := edActDate_B.Date;
  qDoc.ParamByName('ToDate').asDate := edActDate_E.Date;
  if edTo.Text <> '' then
  begin
    qDoc.ParamByName('To_id').AsInteger := edTo.Tag;
    qDoc.ParamByName('To_inst').asInteger := lTo.Tag;
  end;
  if edFrom.Text <> '' then
  begin
    qDoc.ParamByName('from_id').asInteger := edFrom.Tag;
    qDoc.ParamByName('from_inst').asInteger :=lFrom.Tag;
  end;
  if cbGoods.ItemIndex = 0 then
    qDoc.ParamByName('isshtuki').asInteger :=1;
  if cbGoods.ItemIndex = 1 then
    qDoc.ParamByName('isshtuki').asInteger:= 0;
  qDoc.Open;
  if qDocPrint.Active then
    qDocPrint.Close;
  qDocPrint.Open;
  {}
end;
//------- Очистка полей поиска -------

procedure TRashRefForm.bbClearClick(Sender: TObject);
// Очистка всех полей поиска
begin
  edId.Clear;
  edActDate_B.Clear;
  edActDate_E.Clear;
  sbClearPartClick(Nil);
  sbClearOperClick(Nil);
  sbClearFromClick(Nil);
  sbClearToClick(Nil);
  sbClearAutoClick(Nil);
  sbClearDovNumClick(Nil);
  sbClearNPTypeClick(Nil);
  bClearKP_DogClick(Nil);
  sbClearGoodsClick(nil);
  OperList:='';
  sbOperTypeList.Down:=false;
  sbOperTypeList.Hint:=TranslateText('Выбрать операции списком');
  TypeList:='';
  spNpTypeList.Down:=false;
  spNpTypeList.Hint:=TranslateText('Выбрать типы нефтепродуктов списком');
end;

procedure TRashRefForm.sbClearPartClick(Sender: TObject);
// Очистка номера партии
begin
  edPart.Clear;
end;

procedure TRashRefForm.sbClearOperClick(Sender: TObject);
// Очистка типа операции
begin
  edOper.Clear;
end;

procedure TRashRefForm.sbClearFromClick(Sender: TObject);
// Очистка поставщика
begin
  If edFrom.Enabled Then edFrom.Clear;
end;

procedure TRashRefForm.sbClearToClick(Sender: TObject);
// Очистка покупателя
begin
  If edTo.Enabled Then edTo.Clear;
end;

procedure TRashRefForm.sbClearAutoClick(Sender: TObject);
// Очистка автомобиля
begin
  edAuto.Clear;
end;

procedure TRashRefForm.sbClearIDClick(Sender: TObject);
// Очистка номера накладной
begin
  edId.Clear;
end;

procedure TRashRefForm.sbClearDate_BClick(Sender: TObject);
// Очистка начальной даты периода
begin
  edActDate_B.Clear;
end;

procedure TRashRefForm.sbClearDate_EClick(Sender: TObject);
// Очистка конечной даты периода
begin
  edActDate_E.Clear;
end;

procedure TRashRefForm.sbClearNPTypeClick(Sender: TObject);
// Очистка типа нефтепродкта
begin
  edNp_Type.Clear;
end;

procedure TRashRefForm.bClearKP_DogClick(Sender: TObject);
// Очистка типа договора
begin
  edKP_Dog.Clear;
end;

procedure TRashRefForm.sbClearTTNClick(Sender: TObject);
// Очистка номера ТТН
begin
  EdTTN.Clear;
end;

//------- Заполнение полей поиска -------

procedure TRashRefForm.edOperButtonClick(Sender: TObject);
// Выбор типа операции
Var
  OperTypeRefForm : TOperTypeRefForm;
begin
  Application.CreateForm(TOperTypeRefForm, OperTypeRefForm);
  OperTypeRefForm.SGrpId := OPG_RASHOD;
  OperTypeRefForm.ShowModal;
  If OperTypeRefForm.ModalResult = mrOk Then
  Begin
    edOper.Text := OperTypeRefForm.qName.AsString;
    edOper.Tag  := OperTypeRefForm.qId.AsInteger;
  End;
  OperTypeRefForm.Free;
end;

procedure TRashRefForm.edFromButtonClick(Sender: TObject);
// Выбор поставщика
var vId,vInst:integer;
    vName:string;
begin
    if ChooseOrg.CaptureOrg(1,Main_id,Inst,'yyy',vId,vInst,vName) then
    begin
         edFrom.Text:=vName;
         edFrom.Tag:=vId;
         lFrom.tag:=vInst;
    end;
end;

procedure TRashRefForm.edToButtonClick(Sender: TObject);
// Выбор потребителя
var
  vId,vInst:integer;
  vName:string;
begin
  if ChooseOrg.CaptureOrg(3,Main_id,Inst,'yyy',vId,vInst,vName) then
  begin
    edTo.Text := vName;
    edTo.Tag := vId;
    lTo.tag := vInst;
  end;
end;

procedure TRashRefForm.edPartButtonClick(Sender: TObject);
// выбор партии
Var
  PartRefForm : TPartRefForm;
begin
  Application.CreateForm(TPartRefForm, PartRefForm);
  PartRefForm.ShowModal;
  If PartRefForm.ModalResult = mrOk Then
  Begin
    edPart.Text := PartRefForm.qId.AsString;
    edPart.Tag  := PartRefForm.qId.AsInteger;
    lPart.Tag   := PartRefForm.qInst.AsInteger;
  End;
  PartRefForm.Free;
end;

procedure TRashRefForm.edAutoButtonClick(Sender: TObject);
// выбор автомобиля
Var
  AutoRefForm : TAutoRefForm;
begin
  Application.CreateForm(TAutoRefForm, AutoRefForm);
  AutoRefForm.ShowModal;
  If AutoRefForm.ModalResult = mrOk Then
  Begin
    edAuto.Text := AutoRefForm.qNumb.AsString;
    edAuto.Tag  := AutoRefForm.qId.AsInteger;
    lAuto_.tag   := AutoRefForm.qInst.AsInteger;
  End;
  AutoRefForm.Free;
end;

procedure TRashRefForm.edNP_TypeButtonClick(Sender: TObject);
// Выбор типа нефтепродукта
Var
  NPTypeRefForm : TNPTypeRefForm;
begin
  Application.CreateForm(TNPTypeRefForm, NPTypeRefForm);
  NPTypeRefForm.ShowModal;
  If NPTypeRefForm.ModalResult = mrOk Then
  Begin
    edNP_Type.Text := NPTypeRefForm.qName.AsString;
    edNP_Type.Tag  := NPTypeRefForm.qId.AsInteger;
  End;
  NPTypeRefForm.Free;
end;

procedure TRashRefForm.edKP_DogButtonClick(Sender: TObject);
// Выбор номера договора
Var
  DogRefForm : TDogRefForm;
begin
  Application.CreateForm(TDogRefForm, DogRefForm);
  DogRefForm.ShowModal;
  If DogRefForm.ModalResult = mrOk Then
  Begin
    edKP_Dog.Text   := DogRefForm.qDog.AsString;
    edKP_Dog.Tag    := DogRefForm.qId.AsInteger;
    lKP_Dog.Tag     := DogRefForm.qInst.AsInteger;
  End;
  DogRefForm.Free;
end;

procedure TRashRefForm.miRashRRClick(Sender: TObject);
// Создание переброски с резервуара на резервуар
Var
  RashRRForm : TRashRRForm;
begin
  Application.CreateForm(TRashRRForm, RashRRForm);
  RashRRForm.edID.Text := '';
  RashRRForm.ShowModal;
  If RashRRForm.ModalResult = mrOk Then
  Begin
    bbClearClick(Nil);
    edID.Text := RashRRForm.edID.Text;
    bbSearchClick(Nil);
  End
  else
    RashRRForm.Free;
end;

procedure TRashRefForm.sbOperTypeListClick(Sender: TObject);
// Выбор операций списком
var
  LSF:TListSelectForm;
begin
  inherited;
  if sbOperTypeList.Down then
  begin
    sbOperTypeList.Hint:=TranslateText('Выбран список операций');
    Application.CreateForm(TListSelectForm,LSF);
    Lsf.TableName:='oil_oper_type';
    Lsf.HasInst:=false;
    if LSF.ShowModal = mrOk then
      OperList:=LSF.List
    else
    begin
      sbOperTypeList.Down:=false;
      sbOperTypeList.Hint:=TranslateText('Выбрать операции списком');
      OperList:='';
    end;
    LSF.Free;
  end
  else
  begin
    sbOperTypeList.Hint:=TranslateText('Выбрать операции списком');
    OperList:='';
  end;
end;

procedure TRashRefForm.spNpTypeListClick(Sender: TObject);
// Выбор типов нефтепродуктов списком
var
  LSF:TListSelectForm;
begin
  inherited;
  if spNpTypeList.Down then
  begin
    spNpTypeList.Hint:=TranslateText('Выбран список типов нефтепродуктов');
    Application.CreateForm(TListSelectForm,LSF);
    Lsf.TableName:='oil_np_type';
    Lsf.HasInst:=false;
    if LSF.ShowModal = mrOk then
      TypeList:=LSF.List
    else
    begin
      spNpTypeList.Down:=false;
      spNpTypeList.Hint:=TranslateText('Выбрать типы нефтепродуктов списком');
      TypeList:='';
    end;
    LSF.Free;
  end
  else
  begin
    spNpTypeList.Hint:=TranslateText('Выбрать типы нефтепродуктов списком');
    TypeList:='';
  end;
end;

//------- Операции с формой -------

procedure TRashRefForm.FormShow(Sender: TObject);
begin
  //  По умолчанию показывать записи за последнюю неделю
  if edActDate_B.Date=0 then edActDate_B.Date := Date - 7;
  //  Вызвать формирование запроса
  bbSearchClick(Nil);
end;

procedure TRashRefForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if not IsColConfCleared then
  begin
    SaveGridColumns( gr, ClassName);
    SaveGridColumns( dbgDoc, ClassName+'_Data');
  end;
end;

procedure TRashRefForm.FormCreate(Sender: TObject);
// Создание формы, проверка прав пользователя
begin
  IsBaseGrid := false;
  inherited;
  sbUnErase.Visible:=IsHaveRight(3);
  PageControl.ActivePageIndex := 0;
  //махинации с колонками
  LoadGrigColumns( dbgDoc, ClassName+'_Data');
  LoadGrigColumns( gr, ClassName);
end;

procedure TRashRefForm.grDblClick(Sender: TObject);
// Дабл клик по гриду вызывает открывание записи на редактирование --
begin
  If (bbOk.Visible)And(bbOk.Enabled) Then bbOk.Click
    Else If (PEdit.Visible)And(sbEdit.Enabled) Then sbEditClick(Nil)
end;

procedure TRashRefForm.grKeyPress(Sender: TObject; var Key: Char);
// Нажатие Ентера вызывает тот же эффект
begin
  If Key = #13 Then DBGrid1DblClick(Nil);
end;

//------- Добавление, удаление, редактирование, восстановление -------

procedure TRashRefForm.sbDelClick(Sender: TObject); // Удаление расхода
var
  Msg, Num, s: String;
  bSections: boolean;
begin
  ShortToLong;
  if (q.Active) and (q.RecordCount>0) then begin
    // Проверка на наличие приходов на АЗС по этому отпуску
    if qGroup_Num.AsInteger=0 then
      s:=' select count(*) from oil_dr_data'+
         ' where state=''Y'' and oper_type<>2 and ttn_id='+qId.AsString+' and ttn_inst='+qInst.AsString
    else
      s:=' select /*+ORDERED USE_NL(r,dr)*/ count(*)'+
         ' from oil_rashod r,oil_dr_data dr'+
         ' where dr.state=''Y'' and r.state=''Y'''+
         '   and dr.ttn_id=r.id and dr.ttn_inst=r.inst'+
         '   and dr.oper_type<>2'+
         '   and r.date_=to_date('''+FormatDateTime('DD.MM.YYYY',qDate_.Value)+''',''dd.mm.yyyy'')'+
         '   and r.group_num='+qGroup_Num.AsString+' and r.inst='+qInst.AsString;

    if GetSqlValue(s)>0 then
      raise exception.create(TranslateText('Этот отпуск оприходован на АЗС и не может быть удален.'));
    if qDate_.AsDateTime <= StrToDate(Close_Date) then
      raise exception.create(TranslateText('Этот расход из закрытого периода и не может быть удален !'));

    // формирование предупреждения об удалении налоговой накладной
    Msg := '';
    if not qNN_ID.IsNull and not qNN_Inst.IsNull then begin
      Num:=GetSqlValueParSimple(
        'select Num from oil_sale_book where id=:id and inst=:inst',
        ['id',qNN_ID.AsInteger,
         'inst',qNN_Inst.AsInteger]);
      if Num<>'' then
        Msg := TranslateText('Будет удалена налоговая №')+Num+#13#10;
    end;

    bSections := nvl(GetSqlValueParSimple(
      'select count(id) from oil_rashod' +
      ' where state = ''Y''' +
      '   and from_id = :from_id and from_inst = :from_inst' +
      '   and ttn_num = :ttn_num and date_ = :date_' +
      '   and auto_id = :auto_id and auto_inst = :auto_inst' +
      '   and ((trailer_id = :trailer_id and trailer_inst = :trailer_inst) or (:trailer_id = 0))',
      ['from_id',      qFROM_ID.AsInteger,
       'from_inst',    qFROM_INST.AsInteger,
       'ttn_num',      qTTN_NUM.AsString,
       'date_',        qDATE_.AsDateTime,
       'auto_id',      qAUTO_ID.AsInteger,
       'auto_inst',    qAUTO_INST.AsInteger,
       'trailer_id',   qTRAILER_ID.AsInteger,
       'trailer_inst', qTRAILER_INST.AsInteger
      ]), 0) > 1;

    if bSections then
      Msg := Msg + TranslateText('Вы уверены, что хотите удалить ВСЕ секции выбранной записи?')
    else
      Msg := Msg + TranslateText('Вы уверены, что хотите удалить запись?');

    // Запрос последнего шанса
    if MessageDlg(Msg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    try
      StartSQL;
      if qGroup_Num.AsInteger = 0 then
      begin
        // если удаляется налоговая накладная, то ее номер отпрваляется в резерв
        if not qNN_ID.IsNull and not qNN_Inst.IsNull then
          _ExecSql(
            ' insert into oil_nnum_reserve (id, inst, state, date_, num) '+
            '  select s_oil_nnum_reserve.nextval, inst, ''Y'', r_date, num '+
            '  from oil_sale_book '+
            '  where ID = :id and INST = :inst', ['id', qNN_ID.AsInteger, 'inst', qNN_Inst.AsInteger]);

        DelRashPrih(qId.AsInteger, qInst.AsInteger, 'N'); // удаления приходов и налоговых накладных
        if bSections then
          _ExecSql(
            'update oil_rashod set state = ''N'''+
            ' where state = ''Y''' +
            '   and from_id = :from_id and from_inst = :from_inst' +
            '   and ttn_num = :ttn_num and date_ = :date_' +
            '   and auto_id = :auto_id and auto_inst = :auto_inst' +
            '   and ((trailer_id = :trailer_id and trailer_inst = :trailer_inst) or (:trailer_id = 0))',
            ['from_id',      qFROM_ID.AsInteger,
             'from_inst',    qFROM_INST.AsInteger,
             'ttn_num',      qTTN_NUM.AsString,
             'date_',        qDATE_.AsDateTime,
             'auto_id',      qAUTO_ID.AsInteger,
             'auto_inst',    qAUTO_INST.AsInteger,
             'trailer_id',   qTRAILER_ID.AsInteger,
             'trailer_inst', qTRAILER_INST.AsInteger
            ])
        else
          SetState('OIL_RASHOD', qId.AsInteger, qInst.AsInteger, 'N'); // удаление расхода
        _ExecSql( // удаление деталей расхода
          'update oil_rash_det set state = ''N'' where rash_id = '+ qID.AsString +' and rash_inst = '+ qInst.AsString);
        // Если это был отпуск дебетору - удалить рег запись
        DeleteSaleFromLog(qID.AsInteger, qInst.AsInteger, REAL_INST, 'OIL_RASHOD');
      end
      else
      begin
        // если это - отпуск сопутствующего товара, то это - отпуск на АЗС и по нему нет ни
        // приходов, ни налоговых накладных, ни рег записей, так что достаточно просто
        // перевести в state='N' все записи с данным group_num
        _ExecSql(
          'update oil_rashod set state = ''N'''+
          ' where group_num = '+ qGroup_Num.AsString +' and inst = '+ qInst.AsString +
          '   and date_ = '''+ FormatDateTime('dd.mm.yyyy', qDate_.AsDateTime) +'''');
      end;
      CommitSQL;
      bbSearchClick(nil);
    except
      on E:Exception do begin
        RollbackSQL;
        MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
      end;
    end;
  end;
end;

procedure TRashRefForm.sbEditClick(Sender: TObject);
// Редактирование отпуска
Var
  RashForm : TRashForm;
begin
  // Редактирование соп.товара
  if ds.DataSet.FieldByName('group_num').AsInteger <> 0 then
  begin
    if mrOk = EditRashSop(ds.DataSet.FieldByName('group_num').AsInteger,ds.DataSet.FieldByName('inst').AsInteger,
         ds.DataSet.FieldByName('date_').Value)
    then
      bbSearch.Click;
    Exit;
  end;
  ShortToLong;
  If q.Active Then
  If q.RecordCount > 0 Then
  // Разбираемся в природе отпуска
  If qTo_ID.AsString = '' Then   // Списание с партии
  Begin
    // Создаем и инициализируем форму редактирования
    Application.CreateForm(TRashOutForm, RashOutForm);
    RashOutForm.edId.Text          := IntToStr(qId.AsInteger);
    RashOutForm.edId.Tag           := qId.AsInteger;
    RashOutForm.SP.Tag             := qInst.AsInteger;
    RashOutForm.PrevCount          := qCount_.AsFloat;
    RashOutForm.Rez_ID             := qRez_Id.AsInteger;
    RashOutForm.Rez_INST           := qRez_Inst.AsInteger;
    RashOutForm.Part_ID            := qPart_Id.AsInteger;
    RashOutForm.Part_INST          := qPart_Inst.AsInteger;
    RashOutForm.edActDate.Date     := qDATE_.AsDateTime;
    RashOutForm.edFrom.Tag         := qFrom_Id.AsInteger;
    RashOutForm.edFrom.Text        := qFrom_Name.AsString;
    RashOutForm.lFrom.Tag          := qFROM_INST.AsInteger;
    RashOutForm.edOper.Tag         := qOPER_ID.AsInteger;
    RashOutForm.edOper.Text        := qOPER_NAME.AsString;
    RashOutForm.edPart.Tag         := qPART_ID.AsInteger;
    RashOutForm.edpart.Text        := qPART_ID.AsString;
    RashOutForm.lPart.Tag          := qPART_INST.AsInteger;
    RashOutForm.edCount_.Value     := qCOUNT_.AsFloat;
    RashOutForm.edPrice.Value      := qPRICE.AsFloat;
    RashOutForm.edNP_Type.Text     := qNP_TYPE_NAME.AsString;
    RashOutForm.edNP_Type.Tag      := qNP_TYPE.AsInteger;
    RashOutForm.edDog.Text         := qDog.AsString;
    RashOutForm.edDogDate.Date     := qDog_date.AsDateTime;
    RashOutForm.chDebet.Checked    := qINCL_DEBET.AsString = 'Y';
    RashOutForm.chSborPost.Checked := qSBOR_POST.AsString  = 'Y';
    RashOutForm.chSborNac.Checked  := qSBOR_NAC.AsString   = 'Y';
    RashOutForm.chSborNDS.Checked  := qSBOR_NDS.AsString   = 'Y';
    RashOutForm.chUchPrice.Checked := qUCH_PRICE.AsString  = 'Y';
    RashOutForm.chOwn.Checked      := qOWN_GOOD.AsString   = 'O';
    RashOutForm.edRez.Text         := qRez_Num.AsString;
    RashOutForm.edRez.Tag          := qRez_ID.AsInteger;
    RashOutForm.lRez.Tag           := qRez_INST.AsInteger;
    RashOutForm.edComm.Text        := qComm.AsString;

    RashOutForm.Oper_id            := qOwn_Goods.asString;

    RashOutForm.bbOk.Enabled:= RashOutForm.bbOk.Enabled and (qInst.asInteger = INST);
    RashOutForm.edActDate.Enabled := RashOutForm.edActDate.Enabled and (qInst.asInteger = INST);
    RashOutForm.edActDate.Enabled := qDATE_.AsDateTime > StrToDate(CLOSE_DATE);

    RashOutForm.ShowModal;
    If RashOutForm.ModalResult = mrOk Then
    // Обновляем список накладных
    Begin
      edID.Text := RashOutForm.edId.Text;
      bbSearchClick(Nil);
    End
    else
      RashOutForm.Free;
  End
  Else
  If qOper_Id.AsInteger = Oper_MoveRR Then    // Переброска с рез на рез
  Begin
    // Создаем и инициализруем форму редактирования
    Application.CreateForm(TRashRRForm, RashRRForm);
    RashRRForm.edId.Text          := IntToStr(qId.AsInteger);
    RashRRForm.edId.Tag           := qId.AsInteger;
    RashRRForm.SP.Tag             := qInst.AsInteger;
    RashRRForm.PrevCount          := qCount_.AsFloat;
    RashRRForm.Rez_ID             := qRez_Id.AsInteger;
    RashRRForm.Rez_INST           := qRez_Inst.AsInteger;
    RashRRForm.Part_ID            := qPart_Id.AsInteger;
    RashRRForm.Part_INST          := qPart_Inst.AsInteger;
    RashRRForm.edActDate.Date     := qDATE_.AsDateTime;
    RashRRForm.edFrom1.Tag        := qFrom_Id.AsInteger;
    RashRRForm.edFrom1.Text       := qFrom_Name.AsString;
    RashRRForm.lFrom1.Tag         := qFROM_INST.AsInteger;
    RashRRForm.edFrom.Tag         := qFrom_Id.AsInteger;
    RashRRForm.edFrom.Text        := qFrom_Name.AsString;
    RashRRForm.lFrom.Tag          := qFROM_INST.AsInteger;
    RashRRForm.edTo1.Tag          := qTo_Id.AsInteger;
    RashRRForm.edTo1.Text         := qTo_Name.AsString;
    RashRRForm.lTo1.Tag           := qTo_INST.AsInteger;
    RashRRForm.edOper.Tag         := qOPER_ID.AsInteger;
    RashRRForm.edOper.Text        := qOPER_NAME.AsString;
    RashRRForm.edPart1.Tag        := qPART_ID.AsInteger;
    RashRRForm.edpart1.Text       := qPART_ID.AsString;
    RashRRForm.lPart1.Tag         := qPART_INST.AsInteger;
    RashRRForm.edCount_.Value     := qCOUNT_.AsFloat;
    RashRRForm.edNP_Type.Text     := qNP_TYPE_NAME.AsString;
    RashRRForm.edNP_Type.Tag      := qNP_TYPE.AsInteger;
    RashRRForm.edDog.Text         := qDog.AsString;
    RashRRForm.edDogDate.Date     := qDog_date.AsDateTime;
    //RashRRForm.edRez.Text         := qRez_Num.AsString;
    RashRRForm.edRez.ItemIndex := RashRRForm.edRez.Items.Add(qRez_Num.AsString);
    RashRRForm.edRez.Tag          := qRez_ID.AsInteger;
    RashRRForm.lRez.Tag           := qRez_INST.AsInteger;
    //RashRRForm.edRez2.Text        := qPrih_Rez_Num.AsString;
    RashRRForm.edRez2.ItemIndex := RashRRForm.edRez2.Items.Add(qPrih_Rez_Num.AsString);
    RashRRForm.edRez2.Tag         := qPRIH_Rez_ID.AsInteger;
    RashRRForm.lRez2.Tag          := qPRIH_Rez_INST.AsInteger;
    RashRRForm.edComm.Text        := qComm.AsString;

    RashRRForm.bbOk.Enabled:= RashRRForm.bbOk.Enabled and (qInst.asInteger = INST);
    RashRRForm.edActDate.Enabled:= RashRRForm.edActDate.Enabled and (qInst.asInteger = INST);
    RashRRForm.edActDate.Enabled := qDATE_.AsDateTime > StrToDate(CLOSE_DATE);

    RashRRForm.ShowModal;
    If RashRRForm.ModalResult = mrOk Then
    // Обновляем список накладных
    Begin
      edID.Text := RashRRForm.edId.Text;
      bbSearchClick(Nil);
    End
    else
      RashRRForm.Free;
  End
  Else
  If qPrih.AsString <> '' Then    // Переброска с партии на партию
  Begin
    // Создем и инициализируем форму редактирования
    Application.CreateForm(TRashPPForm, RashPPForm);
    RashPPForm.edId.Text          := IntToStr(qId.AsInteger);
    RashPPForm.edId.Tag           := qId.AsInteger;
    RashPPForm.SP.Tag             := qInst.AsInteger;
    RashPPForm.PrevCount          := qCount_.AsFloat;
    RashPPForm.Rez_ID             := qRez_Id.AsInteger;
    RashPPForm.Rez_INST           := qRez_Inst.AsInteger;
    RashPPForm.Part_ID            := qPart_Id.AsInteger;
    RashPPForm.Part_INST          := qPart_Inst.AsInteger;
    RashPPForm.edActDate.Date     := qDATE_.AsDateTime;
    // Обновляем согластно партии
    RashPPForm.edFrom1.Tag        := qFrom_Id.AsInteger;
    RashPPForm.edFrom1.Text       := qFrom_Name.AsString;
    RashPPForm.lFrom1.Tag         := qFROM_INST.AsInteger;
    RashPPForm.edFrom.Tag         := qFrom_Id.AsInteger;
    RashPPForm.edFrom.Text        := qFrom_Name.AsString;
    RashPPForm.lFrom.Tag          := qFROM_INST.AsInteger;
    RashPPForm.edTo1.Tag          := qTo_Id.AsInteger;
    RashPPForm.edTo1.Text         := qTo_Name.AsString;
    RashPPForm.lTo1.Tag           := qTo_INST.AsInteger;
    RashPPForm.edFrom2.Tag        := qFrom_Id2.AsInteger;
    RashPPForm.edFrom2.Text       := qFrom_Id2.AsString+'#'+qFrom_Inst2.AsString;
    RashPPForm.lFrom2.Tag         := qFROM_INST2.AsInteger;
    RashPPForm.edTo2.Tag          := qTo_Id2.AsInteger;
    RashPPForm.edTo2.Text         := qTo_Id2.AsString+'#'+qTo_Inst2.AsString;;
    RashPPForm.lTo2.Tag           := qTo_INST2.AsInteger;    
    RashPPForm.edOper.Tag         := qOPER_ID.AsInteger;
    RashPPForm.edOper.Text        := qOPER_NAME.AsString;
    RashPPForm.edPart1.Tag        := qPART_ID.AsInteger;
    RashPPForm.edpart1.Text       := qPART_ID.AsString;
    RashPPForm.lPart1.Tag         := qPART_INST.AsInteger;
    RashPPForm.edCount_.Value     := qCOUNT_.AsFloat;
    RashPPForm.edPrice.Value      := qPRICE.AsFloat;
    RashPPForm.edNP_Type.Text     := qNP_TYPE_NAME.AsString;
    RashPPForm.edNP_Type.Tag      := qNP_TYPE.AsInteger;
    RashPPForm.edDog.Text         := qDog.AsString;
    RashPPForm.edDogDate.Date     := qDog_date.AsDateTime;
    RashPPForm.chDebet.Checked    := qINCL_DEBET.AsString = 'Y';
    RashPPForm.chSborPost.Checked := qSBOR_POST.AsString  = 'Y';
    RashPPForm.chSborNac.Checked  := qSBOR_NAC.AsString   = 'Y';
    RashPPForm.chSborNDS.Checked  := qSBOR_NDS.AsString   = 'Y';
    RashPPForm.chUchPrice.Checked := qUCH_PRICE.AsString  = 'Y';
    RashPPForm.chOwn.Checked      := qOWN_GOOD.AsString   = 'O';
    if qOWN_GOODS.AsString='K' then RashPPForm.lPart11.Tag:=1;
    if qOWN_GOODS.AsString='O' then RashPPForm.lPart11.Tag:=2;
    if qOWN_GOODS.AsString='S' then RashPPForm.lPart11.Tag:=3;
    RashPPForm.edRez.Text         := qRez_Num.AsString;
    RashPPForm.edRez.Tag          := qRez_ID.AsInteger;
    RashPPForm.lRez.Tag           := qRez_INST.AsInteger;
    RashPPForm.edComm.Text        := qComm.AsString;

    RashPPForm.edPart2.Tag        := qPRIH_PART.AsInteger;
    RashPPForm.edpart2.Text       := qPRIH_PART.AsString;
    RashPPForm.lPart2.Tag         := qPRIH_PART_INST.AsInteger;
    RashPPForm.edNP_Type2.Text    :=
      nvl(GetSQLValueParSimple('select np_type_name,np_type from v_oil_part where id =:id and inst=:inst ',
        ['id',qPRIH_PART.AsInteger,
         'inst',qPRIH_PART_INST.AsInteger],
        'np_type_name'), '');  //qPRIH_NP_TYPE_NAME.AsString;
    RashPPForm.edNP_Type2.Tag     :=
      nvl(GetSQLValueParSimple('select np_type_name,np_type from v_oil_part where id =:id and inst=:inst ',
        ['id',qPRIH_PART.AsInteger,
         'inst',qPRIH_PART_INST.AsInteger],
        'np_type'), 0);        //qPRIH_NP_TYPE.AsInteger;
    RashPPForm.edDog2.Text        := qPRIH_Dog.AsString;
    RashPPForm.edDogDate2.Date    := qPRIH_Dog_date.AsDateTime;
    RashPPForm.chOwn2.Checked     := qPRIH_OWN_GOODS.AsString   = 'O';
    if qPRIH_OWN_GOODS.AsString='K' then RashPPForm.lPart22.Tag:=1;
    if qPRIH_OWN_GOODS.AsString='O' then RashPPForm.lPart22.Tag:=2;
    if qPRIH_OWN_GOODS.AsString='S' then RashPPForm.lPart22.Tag:=3;

    RashPPForm.Oper_id            := qPRIH_OWN_GOODS.AsString;
    RashPPForm.Oper_id2           := qOwn_Goods.AsString;

    RashPPForm.bbOk.Enabled:= RashPPForm.bbOk.Enabled and (qInst.asInteger = INST);
    RashPPForm.edActDate.Enabled:= RashPPForm.edActDate.Enabled and (qInst.asInteger = INST);
    RashPPForm.edActDate.Enabled := qDATE_.AsDateTime > StrToDate(CLOSE_DATE);

    RashPPForm.ShowModal;
    If RashPPForm.ModalResult = mrOk Then
    // Обновляем список накладных
    Begin
      edID.Text := RashPPForm.edId.Text;
      bbSearchClick(Nil);
    End
    else
      RashPPForm.Free;
  End
  Else // Нормальный отпуск
  Begin
    // Создаем и инициализируем форму редактирования
    Application.CreateForm(TRashForm, RashForm);
    if not qKP_Dog.IsNull then
    Begin
      qTemp.Close;
      qTemp.SQL.Clear;
      qTemp.SQL.Text :=
        'select * from oil_dog_detail where dog_id = '+ qKP_ID.AsString +' and dog_inst = '+ qKP_INST.AsString +
        '   and np_type = '+ qNP_TYPE.AsString;
      qTemp.Open;
    End;
    RashForm.edId.Text      := IntToStr(qId.AsInteger);
    RashForm.edId.Tag       := qId.AsInteger;
    RashForm.SP.Tag         := qInst.AsInteger;
    RashForm.edActDate.Date := qDATE_.AsDateTime;

    RashForm.edFrom.Tag      := qFrom_Id.AsInteger;
    RashForm.edFrom.Text     := qFrom_Name.AsString;
    RashForm.lFrom.Tag       := qFROM_INST.AsInteger;
    RashForm.edFrom_RS.Tag   := qR_From_.AsInteger;
    RashForm.edFrom_RS.Text  := qFrom_RACH_CHET.AsString;
    RashForm.lFrom_RS.Tag    := qR_From_Inst.AsInteger;
    RashForm.edFrom_MFO.Text := qFrom_MFO.AsString;

    ClearSaleToDeadbeat(RashForm.SaleToDeadbeat);
    InitOldOrg(qTo_Id.AsInteger, qTo_INST.AsInteger, qTo_Name.AsString,
               qId.AsInteger, qInst.AsInteger, 'OIL_RASHOD', RashForm.SaleToDeadbeat);
    RashForm.edOper.Tag         := qOPER_ID.AsInteger;
    RashForm.edOper.Text        := qOPER_NAME.AsString;
    RashForm.edTTN.Text         := qTTN_NUM.AsString;
    RashForm.edTTNDate.Date     := qTTN_DATE.AsDateTime;
    RashForm.edWayList.Text     := qWAY_LIST.AsString;
    RashForm.edDovSer.Text      := qDOV_SERIAL.AsString;
    RashForm.edDovNum.Text      := qDOV_NUM.AsString;
    RashForm.edDovDate.Date     := qDOV_DATE.AsDateTime;
    RashForm.edDovGive.Text     := qDOV_GIVE.AsString;

    RashForm.edAuto.Tag         := qAUTO_ID.AsInteger;
    RashForm.edAuto.Text        := qAUTO_NUMB.AsString;
    RashForm.lAuto.Tag          := qAUTO_INST.AsInteger;

    RashForm.edAutoAdd.Tag      := qTRAILER_ID.AsInteger;
    RashForm.edAutoAdd.Text     := qTRAILER_NUMB.AsString;
    RashForm.lAutoAdd.Tag       := qTRAILER_INST.AsInteger;

    RashForm.edDovGive.Text     := qDOV_GIVE.AsString;
    RashForm.edPack.ItemIndex   := RashForm.edPack.Items.IndexOf(qPACK.AsString); // Паковка
    // Форма расчетов
    NNQuery.Open;
    RashForm.cbRasch.ItemIndex  := RashForm.cbRasch.Items.IndexOf(NNQuery.FieldByName('FRasch').asString);
    if RashForm.cbRasch.ItemIndex = -1 then
      RashForm.cbRasch.ItemIndex := 0;
    NNQuery.Close;
    // Примечание
    RashForm.edComm.Text        := qComm.AsString;
	 RashForm.KP_sub_type        := nvl(GetSqlValue(Format('select nvl(sub_type,0) from oil_dog where id=%d and inst=%d ',[qKP_ID.AsInteger,qKP_INST.AsInteger])),0);
	 RashForm.KpDogId            := qKP_ID.AsInteger;
	 RashForm.KpDogInst          := qKP_INST.AsInteger;
	 RashForm.edKP_Dog.Text      := qKP_Dog.AsString;
    RashForm.edKP_Date.Date     := qKP_Date.AsDateTime;
    RashForm.edPayDate.Date     := qKP_Exp_Date.AsDateTime;

    RashForm.edDriver.Text      := qAuto_Driver.AsString;
    RashForm.edDriver.Tag       := qEmploy_ID.AsInteger;
    RashForm.lDriver.Tag        := qEmploy_Inst.AsInteger;

    RashForm.chDebet.Checked    := qINCL_DEBET.AsString = 'Y';
    RashForm.chSborPost.Checked := qSBOR_POST.AsString  = 'Y';
    RashForm.chSborNac.Checked  := qSBOR_NAC.AsString   = 'Y';
    RashForm.chSborNDS.Checked  := qSBOR_NDS.AsString   = 'Y';
    RashForm.chUchPrice.Checked := qUCH_PRICE.AsString  = 'Y';    

    RashForm.bbOk.Enabled:= RashForm.bbOk.Enabled and (qInst.asInteger = INST);
    RashForm.edActDate.Enabled := RashForm.edActDate.Enabled and (qInst.asInteger = INST);
    RashForm.edActDate.Enabled := qDATE_.AsDateTime > StrToDate(CLOSE_DATE);

    RashForm.sbRezShow.Down := True;
    RashForm.EdTTN.ReadOnly := False;
    RashForm.EdTTN.Color := clWindow;
    RashForm.EdTTN.Hint := '';
    RashForm.EdTTN.ShowHint := False;

	 if q.Active and (q.RecordCount > 0) then
	 begin // Проверка на наличие приходов на АЗС по этому отпуску
      qTemp.Close;
      if qGroup_Num.AsInteger = 0 then
        qTemp.SQL.Text:='select count(*) as rcount'+
                        '  from oil_dr_data'+
                        ' where state = ''Y'' and oper_type <> 2'+
                        '   and ttn_id = ' + qId.AsString +
                        '   and ttn_inst = ' + qInst.AsString
      else
        qTemp.SQL.Text :='select /*+ORDERED USE_NL(r,dr)*/ count(*) as rcount'+
                         '  from oil_rashod r,oil_dr_data dr'+
                         ' where dr.state = ''Y'' and r.state = ''Y'''+
                         '   and dr.ttn_id = r.id and dr.ttn_inst = r.inst'+
                         '   and dr.oper_type <> 2'+
                         '   and r.date_ = to_date('''+FormatDateTime('DD.MM.YYYY',qDate_.Value)+''',''dd.mm.yyyy'')'+
                         '   and r.group_num = '+qGroup_Num.AsString+' and r.inst = '+qInst.AsString;
      qTemp.Open;
    end;

    if not qNN_ID.IsNull and not qNN_Inst.IsNull then
    Begin
      qTemp.Close;
      qTemp.SQL.Clear;
      qTemp.SQL.Add('select Num, nds_t from v_oil_sale_book where id='+qNN_ID.AsString+' and inst='+qNN_Inst.AsString);
      qTemp.Open;
      if not qTemp.IsEmpty then
      Begin
        // показываем номер НН и сумму на которую она выписана
        RashForm.LblNN_Num.Visible := True;
        RashForm.edNN_Num.Visible := True;
        RashForm.edNNSum.Visible := True;
        RashForm.LblNNSum.Visible := True;
        RashForm.edNN_Num.Text := qTemp.FieldByName('Num').AsString;
        RashForm.edNNSum.Text := qTemp.FieldByName('nds_t').AsString;
      End;
    End;
    // достаем сумму НН на весь договор
    qTemp.Close;
    qTemp.SQL.Clear;
    qTemp.SQL.Add('select dog as dog_id, dog_inst from oil_rashod where state = ''Y'' and id = '+ qId.AsString +' and inst = '+ qInst.AsString);
    qTemp.Open;
    RashForm.qAllNNSum.Close;
    RashForm.qAllNNSum.ParamByName('dog_id').AsInteger := qTemp.FieldByName('dog_id').AsInteger;
    RashForm.qAllNNSum.ParamByName('dog_inst').AsInteger := qTemp.FieldByName('dog_inst').AsInteger;
    RashForm.qAllNNSum.ParamByName('nn_id').AsInteger := -1;
    RashForm.qAllNNSum.ParamByName('nn_inst').AsInteger := -1;
    RashForm.qAllNNSum.Open;

    RashForm.edNNSumDog.Value := RashForm.qAllNNSum.FieldByName('sum_nn').AsFloat;
    RashForm.edNNSumDog.Tag   := Trunc(RashForm.qAllNNSum.FieldByName('s_date').AsDateTime);
    RashForm.qAllNNSum.Close;

    if RashForm.edKP_Dog.Tag > 0 then
      RashForm.edPayDate.Enabled := False
    else
      RashForm.edPayDate.Enabled := True;

    with RashForm do
    begin
      NN_B := (Pos(','+IntToStr(edOper.Tag)+',', OPER_NOT_NN) <> 0);

      qNN.Close;
      qNN.ParamByName('rash_id').AsInteger := StrToInt(edID.Text);
      qNN.ParamByName('rash_inst').AsInteger := SP.Tag;
      qNN.Open;

      NN_D := (qNN.RecordCount = 0)Or(qNNNN_Id.AsInteger = 0);
      CheckNN;
    end;

    if Pos(','+IntToStr(qOPER_ID.AsInteger)+',',OPER_OWN_NEEDS)<>0 then
    Begin
      RashForm.qHardware.Close;
      RashForm.qHardware.Prepare;
      RashForm.qHardware.ParamByName('p_id').AsInteger:=qId.AsInteger;
      RashForm.qHardware.ParamByName('p_inst').AsInteger:=qInst.AsInteger;
      RashForm.qHardware.Open;
      if not RashForm.qHardware.IsEmpty then
      Begin
        RashForm.edHardware.Text := RashForm.qHardware.FieldByName('Numb').AsString;
        RashForm.edHardware.Tag  := RashForm.qHardware.FieldByName('auto_id').AsInteger;
        RashForm.lHardware.Tag   := RashForm.qHardware.FieldByName('auto_inst').AsInteger;
        RashForm.edPerson.Text   := RashForm.qHardware.FieldByName('DrvName').AsString;
        RashForm.edPerson.Tag    := RashForm.qHardware.FieldByName('employ_id').AsInteger;
        RashForm.lPerson.Tag     := RashForm.qHardware.FieldByName('employ_inst').AsInteger;
      End;
      RashForm.qHardware.Close;
    End;

    RashForm.ShowModal;
    if RashForm.ModalResult = mrOk then
    begin
      if pos(',', RashForm.edId.Text) = 0 then
        edID.Text := RashForm.edId.Text
      else
        EdTTN.Text := RashForm.edTTN.Text;
    end
    else
      RashForm.Free;
  end;
  bbSearch.Click;
end;

procedure TRashRefForm.sbUnEraseClick(Sender: TObject);
// Вход-выход в режим восстановления удаленных накладных
begin
  sbBasePrint.Enabled := sbEdit.Enabled;
  bbOk.Enabled        := sbEdit.Enabled;
  bbSearchClick(Nil);
end;

procedure TRashRefForm.bbUnEraseClick(Sender: TObject);
// Восстановление удаленной записи
begin
  ShortToLong;
  If q.Active Then
  If q.RecordCount>0 Then
  begin
    if qDate_.AsDateTime <= StrToDate(Close_Date) then
      Begin
        MessageDlg(TranslateText('Этот расход из закрытого периода и не может быть восстановлен!'),
          mtError, [mbOk], 0);
        Exit;
      end;
    If MessageDlg(TranslateText('Вы уверены что хотите ВОСТАНОВИТЬ ОТПУСК НЕФТЕПРОДУКТОВ ?'),
      mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    Begin
      Try
        StartSQL;
        DelRashPrih(qId.AsInteger,qInst.AsInteger,'Y'); // Восстановление связаного прихода при перебросках
        SetState('OIL_RASHOD',qId.AsInteger,qInst.AsInteger,'Y'); // Восстановление собственно расхода
        CommitSQL;
        bbSearchClick(Nil);
      Except On E:Exception Do
        Begin
          RollbackSQL;
          MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
        End;
      End;
    End;
  end;
end;

procedure TRashRefForm.miRashClick(Sender: TObject);
// Создание нового расхода
Var
  RashForm : TRashForm;
begin
  Application.CreateForm(TRashForm, RashForm);
  RashForm.edID.Text := '';
  RashForm.sbAutoTTN.down:=true;
  RashForm.EdTTN.ReadOnly:=true;
  RashForm.EdTTN.Color:=clBtnFace;
  RashForm.EdTTN.Hint:=TranslateText('Будет выбран следующий номер по порядку');
  RashForm.EdTTN.ShowHint:=true;
  ClearSaleToDeadbeat(RashForm.SaleToDeadbeat);
  RashForm.ShowModal;
  If RashForm.ModalResult = mrOk Then
  Begin
    bbClear.Click;
    EdTTN.Text := RashForm.edTTN.Text;
  End
  else
    RashForm.Free;
  bbSearch.Click;    
end;

procedure TRashRefForm.miRashPPClick(Sender: TObject);
// Создание переброски с партии на партию
Var
  RashPPForm : TRashPPForm;
begin
  Application.CreateForm(TRashPPForm, RashPPForm);
  RashPPForm.edID.Text := '';
  RashPPForm.ShowModal;
  If RashPPForm.ModalResult = mrOk Then
  Begin
    bbClearClick(Nil);
    edID.Text := RashPPForm.edID.Text;
    bbSearchClick(Nil);
  End
  else
    RashPPForm.Free;
end;

procedure TRashRefForm.miRashOutClick(Sender: TObject);
// Создание акта списания
Var
  RashOutForm : TRashOutForm;
begin
  Application.CreateForm(TRashOutForm, RashOutForm);
  RashOutForm.edID.Text := '';
  RashOutForm.ShowModal;
  If RashOutForm.ModalResult = mrOk Then
  Begin
    bbClearClick(Nil);
    edID.Text := RashOutForm.edID.Text;
    bbSearchClick(Nil);
  End
  else
    RashOutForm.Free;
end;

//------- Печать документов -------
//==============================================================================
procedure TRashRefForm.miKPPredClick(Sender: TObject);
var
  DogRef: TDogRefForm;
begin
  ShortToLong;
  if qUCH_PRICE.AsString  = 'Y' then
  begin
    ShowMessage(TranslateText('Это отпуск по учетной цене. К этому отпуску не нужен договор.'));
    exit;
  end;
  if not (q.FieldByName('kp_id').isNull) then
  begin
    DogRef := TDogRefForm.Create(Application);
    case (Sender as TMenuItem).Tag of
      1: DogRef.DogRep('DogPred', dtN, q.FieldByName('kp_id').Value, q.FieldByName('kp_inst').Value);
      2: DogRef.DogRep('DogPosle', dtN, q.FieldByName('kp_id').Value, q.FieldByName('kp_inst').Value);
      3: DogRef.DogRep('DogPredAdd', dtN, q.FieldByName('kp_id').Value, q.FieldByName('kp_inst').Value, true);
    end;
    DogRef.Free;
  end
  else
  begin
    MessageDlg(TranslateText('Не возможно распечатать договор на данный отпуск нефтепродуктов.'), mtInformation, [mbOk], 0);
    exit;
  end;
end;
//==============================================================================
procedure TRashRefForm.miPerinNNClick(Sender: TObject);
// Печать налоговой накладной
var
  TaxBill : TdmTaxBill;
  SId, NNum : String;
begin
  if PageControl.ActivePageIndex = 0 then
  begin
    ShortToLong;
    If q.Active Then
      if (q.RecordCount>0) THEN
        if ((qNN_Id.AsInteger<>0) and (qNN_Inst.AsInteger<>0)) Then
          IF 0 <  GetSQLValue('Select count(*) from oil_sale_book_det where '
             +' state= ''Y'' and nn_id='+qNN_Id.AsString+' and nn_inst='+qNN_Inst.AsString)then
          begin
            TdmTaxBill.Print(
              qNN_Id.AsInteger,
              qNN_Inst.AsInteger);
          end
          ELSE MainForm.PrintNN(qNN_Id.AsInteger, qNN_Inst.AsInteger)
        else MessageDlg(TranslateText('К этому отпуску нет налоговой накладной !'),mtInformation,[mbOk],0);
  end
  else
  begin
    if Pos(','+qDoc.FieldByName('oper_id').AsString+',', OPER_NOT_NN)<>0 then
    begin
      ShowMessage(TranslateText('По отпуску с данной операцией налоговая накладная не печатаеться !'));
      exit;
    end;
    if qDocPrint.RecordCount = 0 then exit;
    TaxBill := TdmTaxBill.Create(qDocTo_Id.asInteger,qDocTo_Inst.asInteger);
    try
      TaxBill.Options.Scheme := NB;
      qDocPrint.First;
      with TaxBill do
      begin
        Options.Date := qDocDate_.AsString;
        Options.OperName := qDocOper_Name.AsString;
        Options.TovarType := ttNpType;
        Options.DogId :=qDocPrint.FieldByName('kp_id').AsInteger;
        Options.DogInst := qDocPrint.FieldByName('kp_inst').AsInteger;
        Options.TaxBillType := 7;
        Options.OIL_NN_Cause :=3;
        Options.PayNum :=' ';
        Options.Num := qDocPrint.FieldByName('nn_num').AsString;
        Options.TaxBillId :=  qDocPrint.FieldByName('sb_id').AsInteger;
        Options.TaxBillInst := qDocPrint.FieldByName('sb_inst').AsInteger;
      end;
      SId := ' (';
      NNum := qDocPrint.FieldByName('nn_num').asString;
      while not qDocPrint.Eof do
      begin
        TaxBill.AddPositionWithoutNds(
          qDocPrint.FieldByName('np_type_name').asString,
          qDocPrint.FieldByName('dim_name').asString,
          qDocPrint.FieldByName('date_').asString,
          qDocPrint.FieldByName('Count_').asFloat,
          qDocPrint.FieldByName('price').asFloat
        );
        SId := SId +qDocPrint.FieldByName('id').asString+',';

        if qDocPrint.FieldByName('nn_num').asString<>NNum then
        begin
          ShowMessage(TranslateText('Печать налоговой накладной по нескольким отпускам невозможна,')+#13#10+
                   TranslateText('т.к. при добавлении отпуска по одной из позиций уже создана налоговая накладная № ')+NNum+'.'+#13#10+
                   TranslateText('Для правильной распечатки удалите эту налоговую накладную из книги продаж с нефтебазы') );
          exit;
        end;
        NNum := qDocPrint.FieldByName('nn_num').asString;
        qDocPrint.Next;

      end;
      SId[Length(SId)]:=#32;
      SId := SId + ') ';
      if TaxBill.Options.Num = '' then
      begin
        StartSQL;
        try
          TaxBill.Make(false);
          _ExecSQL('update oil_rashod set nn_id ='+IntToStr(TaxBill.Options.TaxBillId)+
                   ', nn_inst ='+IntToStr(TaxBill.Options.TaxBillInst)+
                   ' where id in ' +SId+
                   ' and inst = '+qDocPrint.FieldByName('inst').asString);
          CommitSQL;
          ReopenQDoc;
        except on E:Exception do
          begin
            RollbackSQL;
            ShowMessage(TranslateText('Ошибка создания НН: ')+E.Message);
          end;
        end;
      end;
      TaxBill.PutToExcel();
    finally
      TaxBill.Free;
    end;
  end;
end;
//==============================================================================
procedure TRashRefForm.miPrnRashNakClick(Sender: TObject);
// Печать расходной накладной
Const
  msgOperMoveFil= 'Для отпусков с операцией %s расходную надо печатать из меню '
    +#10#13+'"%s" на закладке "Документы +".'
    +#10#13+' Вы хотите продолжить?';
Var
  ProgressIncrement, iPos, PAR_ID, PAR_INST: Integer;
  FromName, SvidNum, NalNum, strCert, strCertList, sert:  String;
  ProgrForm: TProgrForm;
  List: Variant;
  Total, NDS, Part_Price: Currency;
Begin
  if PageControl.ActivePage = DataSheet  then
  begin
    // Блок начальных проверок
    Try
      IF (gr.DataSource.DataSet.FieldByName('oper_id').AsInteger=OPER_MOVEFIL) then
        IF mrNo=MessageDlg(Format(msgOperMoveFil,[GetOperationName(OPER_MOVEFIL),miFilialMotion.Caption]),mtConfirmation,[mbYes,mbNo],0)THEN
          EXIT;
        ShortToLong;
      If q.Active Then
        If q.RecordCount > 0 Then
        Begin
          Application.CreateForm(TProgrForm, ProgrForm);
          ProgrForm.Show;
          ProgrForm.Refresh;
          qTemp.Close;
          qTemp.SQL.Text := 'select * from oil_org where id = '+ qFROM_ID.AsString +' and inst = '+ qFROM_INST.AsString;
          qTemp.Open;
          if (qTemp.FieldByName('org_type').AsInteger = 3) and (PRINT_RN_FILIAL = 'Y')
            and not qTemp.FieldByName('par').IsNull then
          Begin
            PAR_ID := qTemp.FieldByName('par').AsInteger;
            PAR_INST := qTemp.FieldByName('par_inst').AsInteger;
            qTemp.Close;
            qTemp.SQL.Text := 'select * from v_org where id = '+ IntToStr(PAR_ID) +' and inst = '+ IntToStr(PAR_INST);
            qTemp.Open;
            FromName := qTemp.FieldByName('NAME').AsString;
            SvidNum := qTemp.FieldByName('SVID_NUM').AsString;
            NalNum := qTemp.FieldByName('NAL_NUM').AsString;
          End
          else
          Begin
            FromName := qFrom_name.asString;
            SvidNum := qFrom_SVID_NUM.AsString;
            NalNum := qFrom_NAL_NUM.AsString;
          End;
          qTemp.Close;
          qTemp.SQL.Clear;
          qTemp.SQL.Add('select * from v_org where id = '+ qTo_id.AsString +' and inst = '+ qTo_Inst.AsString);
          qTemp.Open;
          // Инициализация Экселя
          ProgrForm.AddProgress(5);
          ProgrForm.AddProgress(5);
          ActivateXLApp('RashNak', 'RashNak', 1, XLApp, List);
          ProgrForm.AddProgress(5);
          List := XLApp.Worksheets.Item['Лист1'];
          ProgrForm.AddProgress(5);
          // Заполнение полей накладной
          ProgressIncrement := round05((100-30)/(30));
          List.Cells[1,'B']:=FromName;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[2,'I']:=SvidNum;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[3,'G']:=NalNum;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[5,'E']:=qID.AsString;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[5,'G']:=FormatDateTime2('dd.mm.yyyy',qDate_.AsDateTime);
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[7,'B']:=qTo_name.asString;
          ProgrForm.AddProgress(ProgressIncrement);
          if qTemp.FieldByName('face').asInteger =1 then     // face control
          begin
            List.Cells[8,'A']:=LangText('NalNum')+': '+qTemp.FieldByName('id_num').AsString;
            ProgrForm.AddProgress(ProgressIncrement);
            List.Cells[9,'A']:=LangText('Pasport')+qTemp.FieldByName('Passport_Ser').AsString+' № '+
              qTemp.FieldByName('Passport_Num').AsString+' '+LangText('Vudan')+qTemp.FieldByName('Passport_When').AsString+
                ' '+qTemp.FieldByName('Passport_Whom').AsString;
            ProgrForm.AddProgress(ProgressIncrement);
            List.Cells[10,'A']:=LangText('Adr')+qTemp.FieldByName('Addr').AsString;
            ProgrForm.AddProgress(ProgressIncrement);
          End
          else
          Begin
            List.Cells[8,'I']:=qTo_SVID_NUM.AsString;
            ProgrForm.AddProgress(ProgressIncrement);
            List.Cells[9,'G']:=qTo_NAL_NUM.AsString;
            ProgrForm.AddProgress(ProgressIncrement);
          End;
          List.Cells[11,'B']:=qDov_Give.AsString;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[12,'C']:=qDov_Serial.AsString;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[12,'E']:=qDov_Num.AsString;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[12,'G']:=FormatDateTime2('dd.mm.yyyy',qDov_Date.AsDateTime);
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[13,'B']:=qTTN_NUM.AsString;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[13,'E']:=FormatDateTime2('dd.mm.yyyy',qTTN_Date.AsDateTime);
          ProgrForm.AddProgress(ProgressIncrement);
          If qKP_Dog.AsString <> '' Then
          Begin
            List.Cells[15,'C']:=qKP_Dog.AsString;
            ProgrForm.AddProgress(ProgressIncrement);
            List.Cells[15,'G']:=FormatDateTime2('dd.mm.yyyy',qKP_Date.AsDateTime);
          End
          Else
          Begin
            List.Cells[15,'C']:=qID.AsString;
            ProgrForm.AddProgress(ProgressIncrement);
            List.Cells[15,'G']:=FormatDateTime2('dd.mm.yyyy',qDate_.AsDateTime);
          end;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[16,'C']:=qDog.AsString;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[16,'G']:=FormatDateTime2('dd.mm.yyyy',qDog_Date.AsDateTime);
          ProgrForm.AddProgress(ProgressIncrement);

          qCert.Close;
          qCert.ParamByName('id').AsInteger := qId.AsInteger;
          qCert.ParamByName('inst').AsInteger := qInst.AsInteger;
          qCert.Open;
          if qCert.FieldByName('name').AsString <> '' then
            List.Cells[17,'F'] := qCert.FieldByName('name').AsString
          else if qCert_name.AsString <> '' then
            List.Cells[17,'F'] := qCert_name.AsString
          else
            List.Cells[17,'F'] := '  ... ';
          List.Cells[19,'A'] := qNP_Type_Name.AsString;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[19,'E'] := qDim_Name.AsString;
          ProgrForm.AddProgress(ProgressIncrement);
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[19,'F'] := qCount_.AsString;
          ProgrForm.AddProgress(ProgressIncrement);
          if qOper_id.AsInteger = 52 then
          begin
            try
              Part_Price := GetSqlValue(
                ' select ss from oil_part where state = ''Y'' and id = '+ qPart_id.AsString +
                ' and inst = '+ qPart_inst.AsString);
              List.Cells[19,'H'] := round05(Part_Price*100)/100;
              ProgrForm.AddProgress(ProgressIncrement);
              List.Cells[19,'I'] := MRound(Part_Price*qCount_.AsFloat, 2);
              ProgrForm.AddProgress(ProgressIncrement);
              List.Cells[20,'I'] := round05(0*100)/100;
              ProgrForm.AddProgress(ProgressIncrement);
              List.Cells[21,'H'] := round05(MRound(Part_Price*qCount_.AsFloat, 2)*100)/100;
              ProgrForm.AddProgress(ProgressIncrement);
              List.Cells[23,'C'] := NumStrGrn(round05(MRound(Part_Price*qCount_.AsFloat,2)*100)/100,TranslateText('грн.'),TranslateText('коп.'));
            except On E: Exception Do
              begin
                MessageDlg(TranslateText(' Ошибка при нахождении учётной цены партии: ')+ E.message +#13#10+
                  TranslateText(' Цена будет взята с отпуска.'), mtError, [mbOk], 0);
                List.Cells[19,'H'] := round05(qPrice.AsFloat*100)/100;
                ProgrForm.AddProgress(ProgressIncrement);
                List.Cells[19,'I'] := qSUMMA.AsFloat;
                ProgrForm.AddProgress(ProgressIncrement);
                List.Cells[20,'I'] := round05(qNDS.AsFloat*100)/100;
                ProgrForm.AddProgress(ProgressIncrement);
                List.Cells[21,'H'] := round05(qSumm.AsFloat*100)/100;
                ProgrForm.AddProgress(ProgressIncrement);
                List.Cells[23,'C'] := NumStrGrn(round05(qSumm.AsFloat*100)/100,TranslateText('грн.'),TranslateText('коп.'));
              end;
            end;
          end
          else
          begin
            List.Cells[19,'H'] := round05(qPrice.AsFloat*100)/100;
            ProgrForm.AddProgress(ProgressIncrement);
            List.Cells[19,'I'] := qSUMMA.AsFloat;
            ProgrForm.AddProgress(ProgressIncrement);
            List.Cells[20,'I'] := round05(qNDS.AsFloat*100)/100;
            ProgrForm.AddProgress(ProgressIncrement);
            List.Cells[21,'H'] := round05(qSumm.AsFloat*100)/100;
            ProgrForm.AddProgress(ProgressIncrement);
            List.Cells[23,'C'] := NumStrGrn(round05(qSumm.AsFloat*100)/100,TranslateText('грн.'),TranslateText('коп.'));
          end;
          List.Cells[22,'A'] := ' ';
          ProgrForm.AddProgress(ProgressIncrement);
          // Показать эксель
          XLApp.Visible := True;
          XLApp.ScreenUpdating := True;
        End;
      ProgrForm.Free;
    Except On E: Exception Do
      Begin
        MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
        ProgrForm.Free;
        MsWord := UnAssigned;
      End;
    End;
  end
  else
  // Печать расходной, записи сгруппированы  (tab  - Документы+)
  begin
    // Блок начальных проверок
    Try
      IF (qDoc.FieldByName('oper_id').AsInteger = OPER_MOVEFIL) then
        IF mrNo=MessageDlg(Format(msgOperMoveFil,[GetOperationName(OPER_MOVEFIL),miFilialMotion.Caption]),mtConfirmation,[mbYes,mbNo],0) THEN
          EXIT;
      ShortToLong;
      If qDocPrint.Active Then
        If qDocPrint.RecordCount > 0 Then
        Begin
          Application.CreateForm(TProgrForm, ProgrForm);
          ProgrForm.Show;
          ProgrForm.Refresh;
          qTemp.Close;
          qTemp.SQL.Text := 'select * from oil_org where id = '+ qFROM_ID.AsString +' and inst = '+ qFROM_INST.AsString;
          qTemp.Open;
          if (qTemp.FieldByName('org_type').AsInteger = 3) and (PRINT_RN_FILIAL = 'Y')
            and not qTemp.FieldByName('par').IsNull then
          Begin
            PAR_ID := qTemp.FieldByName('par').AsInteger;
            PAR_INST := qTemp.FieldByName('par_inst').AsInteger;
            qTemp.Close;
            qTemp.SQL.Text := 'select * from v_org where id = '+ IntToStr(PAR_ID) +' and inst = '+ IntToStr(PAR_INST);
            qTemp.Open;
            FromName := qTemp.FieldByName('NAME').AsString;
            SvidNum := qTemp.FieldByName('SVID_NUM').AsString;
            NalNum := qTemp.FieldByName('NAL_NUM').AsString;
          End
          else
          Begin
            FromName := qDocPrint.FieldByName('From_name').AsString;
            SvidNum := qDocPrint.FieldByName('From_SVID_NUM').AsString;
            NalNum := qDocPrint.FieldByName('From_NAL_NUM').AsString;
          End;
          qTemp.Close;
          qTemp.SQL.Clear;
          qTemp.SQL.Add('select * from v_org where id = '+ qDocPrint.FieldByName('To_id').AsString +
            ' and inst = '+ qDocPrint.FieldByName('To_Inst').AsString);
          qTemp.Open;
          // Инициализация Экселя
          if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
            XLApp := GetActiveOleObject('Excel.Application')
          else XLApp := CreateOleObject('Excel.Application');
          ProgrForm.AddProgress(5);
          ProgrForm.AddProgress(5);
          ActivateXLApp('RashNakMulti', 'RashNakMulti', 1, XLApp, List);
          ProgrForm.AddProgress(5);
          List := XLApp.Worksheets.Item['Лист1'];
          ProgrForm.AddProgress(5);
          // Заполнение полей накладной
          ProgressIncrement := round05((100-30)/(30));
          List.Cells[1,'B']:=FromName;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[2,'I']:=SvidNum;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[3,'G']:=NalNum;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[5,'E']:=qDocPrint.FieldByName('ID').AsString;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[5,'G']:=FormatDateTime2('dd.mm.yyyy',qDocPrint.FieldByName('Date_').AsDateTime);
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[7,'B']:=qDocPrint.FieldByName('To_name').asString;
          ProgrForm.AddProgress(ProgressIncrement);
          if qTemp.FieldByName('face').asInteger = 1 then
          begin
            List.Cells[8,'A']:=LangText('NalNum')+': '+qTemp.FieldByName('id_num').AsString;
            ProgrForm.AddProgress(ProgressIncrement);
            List.Cells[9,'A']:=LangText('Pasport')+qTemp.FieldByName('Passport_Ser').AsString+' № '+
              qTemp.FieldByName('Passport_Num').AsString+' '+LangText('Vudan')+qTemp.FieldByName('Passport_When').AsString+
                ' '+qTemp.FieldByName('Passport_Whom').AsString;
            ProgrForm.AddProgress(ProgressIncrement);
            List.Cells[10,'A']:=LangText('Adr')+qTemp.FieldByName('Addr').AsString;
            ProgrForm.AddProgress(ProgressIncrement);
          End
          else
          Begin
            List.Cells[8,'I']:=qDocPrint.FieldByName('To_SVID_NUM').AsString;
            ProgrForm.AddProgress(ProgressIncrement);
            List.Cells[9,'G']:=qDocPrint.FieldByName('To_NAL_NUM').AsString;
            ProgrForm.AddProgress(ProgressIncrement);
          End;
          List.Cells[11,'B']:=qDocPrint.FieldByName('Dov_Give').AsString;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[12,'C']:=qDocPrint.FieldByName('Dov_Serial').AsString;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[12,'E']:=qDocPrint.FieldByName('Dov_Num').AsString;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[12,'G']:=FormatDateTime2('dd.mm.yyyy',qDocPrint.FieldByName('Dov_Date').AsDateTime);
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[14,'E']:=qDocPrint.FieldByName('KP_Dog').AsString;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[14,'G']:=FormatDateTime2('dd.mm.yyyy',qDocPrint.FieldByName('KP_Date').AsDateTime);
          iPos:=18;
          Total:=0;
          NDS:=0;
          qDocPrint.First;
          // знаходимо сертифікат по відпуску
          try
            qCert.Close;
            qCert.ParamByName('id').AsInteger := qDocPrint.FieldByName('Id').AsInteger;
            qCert.ParamByName('inst').AsInteger := qDocPrint.FieldByName('inst').AsInteger;
            qCert.Open;
            if qCert.FieldByName('name').asString <> '' then
              sert := qCert.FieldByName('name').asString
            else if (qDocPrint['cert_name'] <> null) then
              sert := qDocPrint['cert_name'];
          except
            sert := ''
          end;
          // знайшли мабуть вже сертифікат
          if (sert <> '') then
          begin
            strCertList := strCertList + sert + '('+qDocPrint['np_grp_name']+')'+',';
            strCert := sert;
          end
          Else strCert := '';
          while not qDocPrint.eof do
          begin
            List.Rows[iPos].EntireRow.Insert;
            List.Range['A'+IntToStr(iPos)+':D'+IntToStr(iPos)].Merge;
            List.Range['F'+IntToStr(iPos)+':G'+IntToStr(iPos)].Merge;
            List.Range['I'+IntToStr(iPos)+':J'+IntToStr(iPos)].Merge;
            ProgrForm.AddProgress(ProgressIncrement);
            List.Cells[iPos,'E']:=qDocPrint.FieldByName('Dog').AsString;
            ProgrForm.AddProgress(ProgressIncrement);
            List.Cells[iPos,'F']:=qDocPrint.FieldByName('TTN_NUM').AsString;
            ProgrForm.AddProgress(ProgressIncrement);
            List.Cells[iPos,'H']:=FormatDateTime2('dd.mm.yyyy',qDocPrint.FieldByName('TTN_Date').AsDateTime);
            ProgrForm.AddProgress(ProgressIncrement);
            List.Cells[iPos,'A']:=qDocPrint.FieldByName('NP_Type_Name').AsString;
            ProgrForm.AddProgress(ProgressIncrement);
            List.Cells[iPos,'I']:=qDocPrint.FieldByName('Dim_Name').AsString;
            ProgrForm.AddProgress(ProgressIncrement);
            ProgrForm.AddProgress(ProgressIncrement);
            List.Cells[iPos,'K']:=qDocPrint.FieldByName('Count_').AsFloat;
            ProgrForm.AddProgress(ProgressIncrement);
            List.Cells[iPos,'L']:=round05(qDocPrint.FieldByName('Price').AsFloat*100)/100;
            ProgrForm.AddProgress(ProgressIncrement);
            List.Cells[iPos,'M']:=round05(qDocPrint.FieldByName('Price').AsFloat*qDocPrint.FieldByName('Count_').AsFloat*100)/100;
            ProgrForm.AddProgress(ProgressIncrement);
            Total:=Total+ round05(qDocPrint.FieldByName('Price').AsFloat*qDocPrint.FieldByName('Count_').AsFloat*100)/100;
            NDS:=NDS+FRound(qDocPrint.FieldByName('NDS').AsFloat,2);
            List.Rows[iPos].Autofit;
            qDocPrint.Next;
            // знаходимо сертифікат по відпуску
            try
              qCert.Close;
              qCert.ParamByName('id').AsInteger := qDocPrint.FieldByName('Id').AsInteger;
              qCert.ParamByName('inst').AsInteger := qDocPrint.FieldByName('inst').AsInteger;
              qCert.Open;
              if qCert.FieldByName('name').asString <> '' then
                sert := qCert.FieldByName('name').asString
              else if (qDocPrint['cert_name'] <> null) then
                sert := qDocPrint['cert_name'];
            except
              sert := ''
            end;
            // знайшли мабуть вже сертифікат
            IF (strCert <> VarToStr(sert))and(trim(VarToStr(sert))<>'') then
            begin
              strCertList := strCertList + sert+ '('+qDocPrint['np_grp_name']+')'+',';
              strCert := sert;
            end;
            List.Range['A'  + IntToStr(iPos)+ ':M' + IntToStr(iPos)].Borders.LineStyle := xlContinuous;
            inc(iPos);
          end;
          if strCertList <> '' then strCertList[length(strCertList)] := #0;
          List.Cells[16,'F']:=strCertList;
          // Общая сумма по всем записям
          List.Cells[iPos+1,'M']:=NDS;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[iPos+2,'M']:=FRound(Total+NDS,2);
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[iPos+3,'D']:=NumStrGrn(FRound(Total+NDS,2),TranslateText('грн.'),TranslateText('коп.'));
          ProgrForm.AddProgress(ProgressIncrement);
          // Показать эксель
          XLApp.Visible:=True;
          XLApp.ScreenUpdating := True;
        End;
      ProgrForm.Free;
    Except On E:Exception Do
      Begin
        MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
        ProgrForm.Free;
        MsWord := UnAssigned;
      End;
    End;
  end;
End;
//==============================================================================
procedure TRashRefForm.miTTNClick(Sender: TObject);
// Печать ТТН на бланке строгой отчетности
Var
  ProgressIncrement: Integer;
  Path, Path2, S, RealName:  String;
  ProgrForm: TProgrForm;
  Y, M, D: Word;
  IWorkBook: variant;
  Part_Price: Currency;
Begin
  // Блок проверок
  Try
    ShortToLong;
    // Нам понадобятся сведения о водителе
    qDriver.Open;
    If q.Active Then
      If not q.IsEmpty Then
      Begin
        Application.CreateForm(TProgrForm, ProgrForm);
        ProgrForm.Show;
        ProgrForm.Refresh;
        // Печать через Эксель
        // Инициализация Эксель
        if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
          XLApp := GetActiveOleObject('Excel.Application')
        else
          XLApp := CreateOleObject('Excel.Application');
        ProgrForm.AddProgress(5);
        Path  := GetMainDir+'pattern\TTN.xls';
        Path2 := GetMainDir+'doc\TTN_'+qId.AsString+'.xls';
        CopyFile(Pchar(path), Pchar(path2), False);
        ProgrForm.AddProgress(5);
        IWorkbook := XLApp.Workbooks.Add(Path2);
        ProgrForm.AddProgress(5);
        List:=IWorkbook.WorkSheets[1];
        ProgrForm.AddProgress(5);
        ProgressIncrement := round05((100-30)/(30));
        If qTTN_Date.AsDateTime <> 0 Then
        Begin
          DecodeDate(qTTN_Date.AsDateTime,Y,M,D);
          List.Cells[5,'J'] := IntToStr(D);
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[5,'N'] := MonthToStr(M);
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[5,'X'] := Copy(IntToStr(Y),3,2);
        End;
        ProgrForm.AddProgress(ProgressIncrement);
        if List.Cells[4,'BC'].Text ='NUM' then
          List.Cells[4,'BC']:= q.FieldByName('TTN_NUM').AsString
        else
          List.Cells[4,'BC']:= '';
        List.Cells[5,'AF'] := qAuto_Numb.AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        List.Cells[5,'BC'] := qWay_List.AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        List.Cells[6,'K'] := qAuto_ATP.AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        List.Cells[6,'AC'] := qDriver.FieldByName('FullName').AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        List.Cells[7,'L'] := qTo_Name.AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        List.Cells[7,'BC'] := qTo_OKPO.AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        if (MAIN_TYPE = 3) and (PRINT_TTN_FIL_NK = 'Y') then
        begin
          qTemp.Close;
          qTemp.SQL.Clear;
          qTemp.SQL.Add('select * from v_org where id = '+IntToStr(MAIN_PAR)+
                                ' and inst = '+IntToStr(MAIN_PAR_INST));
          qTemp.Open;
          List.Cells[8,'L'] := qTemp.FieldByName('NAME').AsString;
        end
        else
          List.Cells[8,'L'] := qFrom_Name.AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        List.Cells[8,'BC'] := qFrom_OKPO.AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        List.Cells[9,'L'] := qTo_Name.AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        List.Cells[9,'BC'] := qTo_OKPO.AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        qCert.Close;
        qCert.ParamByName('id').AsInteger := qId.AsInteger;
        qCert.ParamByName('inst').AsInteger := qInst.AsInteger;
        qCert.Open;
        if qCert.FieldByName('name').AsString <> '' then
          List.Cells[13,'D'] := LangText('RegNum_Sert')+qCert.FieldByName('name').AsString
        else
        begin
          if qCert_name.AsString <> '' then
            List.Cells[13,'D'] := LangText('RegNum_Sert')+qCert_name.AsString
          else
            List.Cells[13,'D'] := LangText('RegNum_Sert') + '   ... ';
        end;
        if IsInsideShift then
          List.Cells[4,'M'] := LangText('Vnutr') + LangText('perem');
        ProgrForm.AddProgress(ProgressIncrement);
        if PRINT_TTN_REAL_ADDRESS = 'Y' then
        begin
          RealName:=GetSqlValue(
              ' select nvl(odet.real_address,oo.name) from v_oil_org_det odet, v_org oo'+
              ' where odet.state(+)=''Y'' and odet.org_id(+)=oo.id and odet.inst(+)=oo.inst '+
              '       and oo.id='+qFrom_Id.AsString+' and oo.inst='+qFrom_Inst.AsString);
          List.Cells[10,'L']:=RealName;
        end
        else
          List.Cells[10,'L'] := qFrom_Name.AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        List.Cells[10,'AJ'] := qTo_Place.AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        List.Cells[19,'C'] := qDog.AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        List.Cells[19,'L'] := qNP_Type_Name.AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        if (qNP_GRP.AsInteger in [3,4,5,6,7,8,10,59,61,63,76]) and (qDim_Id.AsInteger=2) then
        Begin
          List.Cells[19,'T'] := 'л';
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[19,'W'] := qLitr.AsString;
        end
        else
        Begin
          List.Cells[19,'T'] := qDim_name.AsString;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[19,'W'] := qCount_.AsFloat;
        End;
        ProgrForm.AddProgress(ProgressIncrement); 
        if qOper_id.AsInteger = 52 then
        begin
          try
            Part_Price := GetSqlValue(
              ' select ss from oil_part where state = ''Y'' and id = '+ qPart_id.AsString +
              ' and inst = '+ qPart_inst.AsString);
            List.Cells[19,'Z'] := FloatToStr(Part_Price)+ '    ' +FloatToStr(round05(Part_Price*qCount_.AsFloat*100)/100);
            ProgrForm.AddProgress(ProgressIncrement);
            List.Cells[23,'AD'] := round05(Part_Price*qCount_.AsFloat*100)/100;
            ProgrForm.AddProgress(ProgressIncrement);
            List.Cells[25,'M'] := NumStrGrn(round05(Part_Price*qCount_.AsFloat*100)/100,TranslateText('грн.'),TranslateText('коп.'));
          except On E: Exception Do
            begin
              MessageDlg(TranslateText(' Ошибка при нахождении учётной цены партии: ')+ E.message +#13#10+
                TranslateText(' Цена будет взята с отпуска.'), mtError, [mbOk], 0);
              if (IsInsideShift) then
                List.Cells[19,'Z'] := LangText('Vnutr') + LangText('perem')
              else
                List.Cells[19,'Z'] := qPrice.AsString+ '    ' +FloatToStr(round05(qPrice.AsFloat*qCount_.AsFloat*100)/100);
              ProgrForm.AddProgress(ProgressIncrement);
              if (IsInsideShift) then
                List.Cells[23,'AD'] := '0,00'
              else
                List.Cells[23,'AD'] := round05(qSumm.AsFloat*100)/100;
              ProgrForm.AddProgress(ProgressIncrement);
              if (IsInsideShift) then
                List.Cells[25,'M'] := LangText('NullGrn')
              else
                List.Cells[25,'M'] := NumStrGrn(round05(qSumm.AsFloat*100)/100,TranslateText('грн.'),TranslateText('коп.'));
            end;
          end;
        end
        else
        begin
          if (IsInsideShift) then
            List.Cells[19,'Z'] := LangText('Vnutr') + LangText('perem')
          else
            List.Cells[19,'Z'] := qPrice.AsString+ '    ' +FloatToStr(round05(qPrice.AsFloat*qCount_.AsFloat*100)/100);
          ProgrForm.AddProgress(ProgressIncrement);
          if (IsInsideShift) then
            List.Cells[23,'AD'] := '0,00'
          else
            List.Cells[23,'AD'] := round05(qSumm.AsFloat*100)/100;
          ProgrForm.AddProgress(ProgressIncrement);
          if (IsInsideShift) then
            List.Cells[25,'M'] := LangText('NullGrn')
          else
            List.Cells[25,'M'] := NumStrGrn(round05(qSumm.AsFloat*100)/100,TranslateText('грн.'),TranslateText('коп.'));
        end;
        ProgrForm.AddProgress(ProgressIncrement);
        List.Cells[19,'AH'] := qID.AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        List.Cells[19,'AN'] := qPack.AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        if qIsShtuki.AsString = 'N' then
          List.Cells[19,'AU'] := qUd_Weig.AsString + '  t ' + qTemper.AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        if qIsShtuki.AsString = 'N' then
          List.Cells[19,'BF'] := qCount_.AsFloat;
        ProgrForm.AddProgress(ProgressIncrement);
        if qOper_id.AsInteger <> 52 then
        begin
          If qUch_Price.AsString = 'N' Then
          Begin
            List.Cells[21,'L'] := LangText('NDS')+ FloatToStr(TAX_RATE(qDog_Date.AsDateTime)*100) +'%';
            if (IsInsideShift) then
              List.Cells[21,'AD'] := '0,00'
            else
              List.Cells[21,'AD'] := round05(qNDS.AsFloat*100)/100;
          End
        end
        else
          List.Cells[21,'AD'] := '0,00';
        ProgrForm.AddProgress(ProgressIncrement);
        List.Cells[29,'I'] := qCount_.AsFloat;
        ProgrForm.AddProgress(ProgressIncrement);
        List.Cells[28,'BC'] := qDov_Serial.AsString + ' ' + qDov_Num.AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        If qDov_Date.AsDateTime <> 0 Then
        Begin
          DecodeDate(qDov_Date.AsDateTime,Y,M,D);
          List.Cells[29,'AX'] := IntToStr(D);
          ProgrForm.AddProgress(ProgressIncrement);
          S := IntToStr(M);
          If M < 10 Then S := '0'+S;
          List.Cells[29,'AZ'] := S;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[29,'BD'] := Copy(IntToStr(Y),3,2);
          ProgrForm.AddProgress(ProgressIncrement);
        End
        Else
        Begin
          ProgrForm.AddProgress(ProgressIncrement);
          ProgrForm.AddProgress(ProgressIncrement);
          ProgrForm.AddProgress(ProgressIncrement);
        End;
        List.Cells[30,'AZ'] := qDov_Give.AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        List.Cells[33,'I'] := qAuto_Driver.AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        If qOwn_Goods.AsString = 'O' Then
          S := LangText('Sobst')
        Else
          If qOwn_Goods.AsString = 'K' Then
            S := LangText('Komis')
          Else
            S := LangText('Xran');
        List.Cells[38,'J'] := TranslateText('Рез: ') + qRez_Num.AsString + TranslateText('Товар:') + S;
        ProgrForm.AddProgress(ProgressIncrement);
        XLApp.Visible := True;
        XLApp.ScreenUpdating := True;
      End;
    ProgrForm.Free;
  Except On E: Exception Do
    Begin
      MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
      ProgrForm.Free;
    End;
  End;
  qDriver.Close;
End;
//==============================================================================
procedure TRashRefForm.N1Click(Sender: TObject);
// Печать ТТН без бланка
Var
  ProgrForm: TProgrForm;
  MSWord: Variant;
  RealName, s: string;
  Transport, To_Place: String;
  i: integer;
  Part_Price: Currency;
begin
  Try
    ShortToLong;
    qDriver.Open;
    If q.Active Then
      If not q.IsEmpty Then
      Begin
        Application.CreateForm(TProgrForm, ProgrForm);
        try
          ProgrForm.Show;
          ProgrForm.Refresh;
          MsWord := CreateOleObject('Word.Basic');
          MsWord.AppShow;
          MsWordDotAdd('TTN', MsWord);
          MsWord.EditGoTo(Destination := 'InvoiceNum');
          MsWord.Insert(q.FieldByName('TTN_NUM').AsString+' ');
          MsWord.EditGoTo(Destination := 'AcquireDate');
          MsWord.Insert(q.FieldByName('TTN_DATE').AsString+' ');
          MsWord.EditGoTo(Destination := 'inwardly');
          if( IsInsideShift ) then
            MsWord.Insert(LangText('Vnutr') + LangText('perem'))
          else
            MsWord.Insert(' ');
          MsWord.EditGoTo(Destination := 'sert');
          qCert.Close;
          qCert.ParamByName('id').AsInteger := qId.AsInteger;
          qCert.ParamByName('inst').AsInteger := qInst.AsInteger;
          qCert.Open;
          if qCert.FieldByName('name').AsString <> '' then
            MsWord.Insert(qCert.FieldByName('name').AsString+' ')
          else
          begin
            if q.FieldByName('cert_name').AsString <> '' then
              MsWord.Insert(q.FieldByName('cert_name').AsString+' ')
            else
              MsWord.Insert('  ... ');
          end;
          MsWord.EditGoTo(Destination := 'auto_num');
          MsWord.Insert(q.FieldByName('AUTO_NUMB').AsString+' ');
          MsWord.EditGoTo(Destination := 'driver');
          MsWord.Insert(qDriver.FieldByName('FullName').AsString+' ');
          MsWord.EditGoTo(Destination := 'atp');
          MsWord.Insert(q.FieldByName('AUTO_ATP').AsString+' ');
          MsWord.EditGoTo(Destination := 'From_Org');
          if (MAIN_TYPE = 3) and (PRINT_TTN_FIL_NK = 'Y') then
          begin
            qTemp.Close;
            qTemp.SQL.Clear;
            qTemp.SQL.Add('select * from v_org where id = '+IntToStr(MAIN_PAR)+
                                  ' and inst = '+IntToStr(MAIN_PAR_INST));
            qTemp.Open;
            MsWord.Insert(qTemp.FieldByName('NAME').AsString+' ');
          end
          else
            MsWord.Insert(q.FieldByName('FROM_NAME').AsString+' ');
          MsWord.EditGoTo(Destination := 'To_Org');
          // если самовывоз - указывается клиент, если доставка - грузоотправитель
          Transport := GetSQLValue(
               ' select nvl(sub_type ,10) as sub_type '+
               ' from oil_rashod r, oil_dog d                  '+
               ' where r.dog=d.id (+)                          '+
               ' and r.dog_inst = d.inst (+)                   '+
               ' and r.state=''Y''                             '+
               ' and r.state = d.state (+)                     '+
               ' and r.id = '+qID.AsString+
               ' and r.inst = '+qINST.AsString
             );
          if Transport = '10' then
            MsWord.Insert(q.FieldByName('TO_NAME').AsString+' ')
          else
            MsWord.Insert(q.FieldByName('FROM_NAME').AsString+' ');
          MsWord.EditGoTo(Destination := 'Dov');
          MsWord.Insert(q.FieldByName('DOV_SERIAL').AsString + ' №' + q.FieldByName('DOV_NUM').AsString + ' ' + q.FieldByName('DOV_DATE').AsString + ' ' + q.FieldByName('DOV_GIVE').AsString);
          MsWord.EditGoTo(Destination := 'To_Org_gruz');
          MsWord.Insert(q.FieldByName('TO_NAME').AsString+' ');
          To_Place := nvl(GetSQLValue(
            ' select Addr from (select row_number() over(partition by id, inst order by def desc) rnum, ' +
            '   nvl(decode(ov.language, 0, real_address_rus, real_address_ukr), addr) as Addr ' +
            ' from v_oil_org where id = ' + qTO_ID.AsString + ' and inst = ' + qTO_INST.AsString + ') where rnum = 1 '),'');
          MsWord.EditGoTo(Destination := 'To_Place');
          if (To_Place <> '') then
            MsWord.Insert(To_Place+' ')
          else
            MsWord.Insert(q.FieldByName('TO_PLACE').AsString+' ');
          MsWord.EditGoTo(Destination := 'from_Place');
          if PRINT_TTN_REAL_ADDRESS='Y' then
          begin
            RealName := GetSqlValue(
              ' select nvl(odet.real_address,oo.name) from v_oil_org_det odet, v_org oo'+
              ' where odet.state(+)=''Y'' and odet.org_id(+)=oo.id and odet.inst(+)=oo.inst '+
              '       and oo.id='+qFrom_Id.AsString+' and oo.inst='+qFrom_Inst.AsString);
            MsWord.Insert(RealName+' ');
          end
          else
            MsWord.Insert(q.FieldByName('FROM_NAME').AsString+' ');
          MsWord.EditGoTo(Destination := 't');
          MsWord.NextCell;
          MsWord.NextCell;
          if q.FieldByName('IsShtuki').AsString = 'Y' then
            MsWord.Insert(LangText('Ed_Izm'))
          else
            MsWord.Insert('T');
          MsWord.NextCell;
          MsWord.NextCell;
          MsWord.NextCell;
          MsWord.NextCell;
          MsWord.NextCell;
          MsWord.NextCell;
          MsWord.Insert(q.FieldByName('PART_ID').AsString);
          MsWord.NextCell;
          MsWord.Insert(q.FieldByName('NP_TYPE_NAME').AsString + ' (' + q.FieldByName('DOG').AsString + ')');
          MsWord.NextCell;
          if q.FieldByName('IsShtuki').AsString = 'Y' then
          Begin
            MsWord.Insert(q.FieldByName('DIM_NAME').AsString);
            MsWord.NextCell;
            MsWord.NextCell;
            MsWord.NextCell;
            MsWord.Insert(FloatToStrF(q.FieldByName('COUNT_').AsFloat, ffFixed, 15, 0));
            MsWord.NextCell;
          End
          else
          Begin
            MsWord.Insert(q.FieldByName('TEMPER').AsString);
            MsWord.NextCell;
            MsWord.Insert(q.FieldByName('UD_WEIG').AsString);
            MsWord.NextCell;
            MsWord.Insert(FloatToStrF(q.FieldByName('LITR').AsFloat, ffFixed, 15, 3));
            MsWord.NextCell;
            MsWord.Insert(FloatToStrF(q.FieldByName('COUNT_').AsFloat, ffFixed, 15, 6));
            MsWord.NextCell;
          End;

          if qOper_id.AsInteger = 52 then
          begin
            try
              Part_Price := GetSqlValue(
                ' select ss from oil_part where state = ''Y'' and id = '+ qPart_id.AsString +
                ' and inst = '+ qPart_inst.AsString);
              MsWord.Insert(FloatToStrF(Part_Price, ffFixed, 15, 2));
              MsWord.NextCell;
              MsWord.Insert(FloatToStrF(round05(Part_Price * q.FieldByName('COUNT_').AsFloat * 100)/100, ffFixed, 15, 2));
              MsWord.EditGoTo(Destination := 'NDS_1');
              MsWord.Insert('0,00');
              MsWord.EditGoTo(Destination := 'NDS');
              MsWord.Insert(FloatToStrF(round05(Part_Price * q.FieldByName('COUNT_').AsFloat * 100)/100, ffFixed, 15, 2));
              MsWord.EditGoTo(Destination := 'NDS_str');
              MsWord.Insert(NumStrGrn(round05(Part_Price * q.FieldByName('COUNT_').AsFloat * 100)/100,TranslateText('грн.'),TranslateText('коп.')));
            except On E: Exception Do
              begin
                MessageDlg(TranslateText(' Ошибка при нахождении учётной цены партии: ')+ E.message +#13#10+
                  TranslateText(' Цена будет взята с отпуска.'), mtError, [mbOk], 0);
                if (IsInsideShift) then
                  MsWord.Insert(LangText('Vnutr'))
                else
                  MsWord.Insert(FloatToStrF(q.FieldByName('PRICE').AsFloat, ffFixed, 15, 2));
                
                MsWord.NextCell;
                if (IsInsideShift) then
                  MsWord.Insert(LangText('perem'))
                else
                  MsWord.Insert(FloatToStrF(round05(q.FieldByName('PRICE').AsCurrency * q.FieldByName('COUNT_').AsFloat * 100)/100, ffFixed, 15, 2));

                MsWord.EditGoTo(Destination := 'NDS_1');
                if (IsInsideShift) then
                  MsWord.Insert('0,00')
                else
                  MsWord.Insert(FloatToStrF(round05(q.FieldByName('NDS').AsCurrency* 100)/100, ffFixed, 15, 2));

                MsWord.EditGoTo(Destination := 'NDS');
                if (IsInsideShift) then
                  MsWord.Insert('0,00')
                else
                  MsWord.Insert(FloatToStrF(round05(q.FieldByName('summ').AsCurrency* 100)/100, ffFixed, 15, 2));

                MsWord.EditGoTo(Destination := 'NDS_str');
                if (IsInsideShift) then
                  MsWord.Insert(TranslateText('ноль грн. 00 коп.'))
                else
                  MsWord.Insert(NumStrGrn(round05(q.FieldByName('summ').AsCurrency* 100)/100,TranslateText('грн.'),TranslateText('коп.')));
              end;
            end;
          end
          else
          begin
            if (IsInsideShift) then
              MsWord.Insert(LangText('Vnutr'))
            else
              MsWord.Insert(FloatToStrF(q.FieldByName('PRICE').AsFloat, ffFixed, 15, 2));

            MsWord.NextCell;
            if (IsInsideShift) then
              MsWord.Insert(LangText('perem'))
            else
              MsWord.Insert(FloatToStrF(round05(q.FieldByName('PRICE').AsCurrency * q.FieldByName('COUNT_').AsFloat * 100)/100, ffFixed, 15, 2));

            MsWord.EditGoTo(Destination := 'NDS_1');
            if (IsInsideShift) then
              MsWord.Insert('0,00')
            else
              MsWord.Insert(FloatToStrF(round05(q.FieldByName('NDS').AsCurrency* 100)/100, ffFixed, 15, 2));

            MsWord.EditGoTo(Destination := 'NDS');
            if (IsInsideShift) then
              MsWord.Insert('0,00')
            else
              MsWord.Insert(FloatToStrF(round05(q.FieldByName('summ').AsCurrency* 100)/100, ffFixed, 15, 2));

            MsWord.EditGoTo(Destination := 'NDS_str');
            if (IsInsideShift) then
              MsWord.Insert(TranslateText('ноль грн. 00 коп.'))
            else
              MsWord.Insert(NumStrGrn(round05(q.FieldByName('summ').AsCurrency* 100)/100,TranslateText('грн.'),TranslateText('коп.')));
          end;
          MsWord.EditGoTo(Destination := 'weight_down');
          MsWord.Insert(FloatToStrF(q.FieldByName('COUNT_').AsFloat, ffFixed, 15, 6)+' ');
          MsWord.EditGoTo(Destination := 'driver_down');
          MsWord.Insert(qDriver.FieldByName('FullName').AsString+' ');
          MsWord.EditGoTo(Destination := 'REZ_NO');
          MsWord.Insert(q.FieldByName('rez_num').asString);
          MsWord.EditGoTo(Destination := 'DATE_TIME');
          MsWord.Insert(DateTimeToStr(GetSystemDate));
          MsWord.EditGoTo(Destination := 'NDS_V');
          MsWord.Insert(FloatToStr(TAX_RATE(qDog_Date.AsDateTime)*100));
          if q.FieldByName('To_boss').asString <> '' then
          begin
            MsWord.EditGoTo(Destination := 'To_boss');
            s := TranslateText('директор ') + q.FieldByName('To_boss').asString;
            for i := 0 to 31 - length(s) do
              s := s + '_';
            MsWord.Insert(s);
          end;
        finally
          ProgrForm.Free;
        end;
      End;
  Except On E:Exception Do
    Begin
      MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
      ProgrForm.Free;
    End;
  End;
  qDriver.Close;
end;
//==============================================================================
procedure TRashRefForm.ShortToLong(AUseTTNNum: boolean = false);
(**
  если выскакивает ошибка о необходимоти репарсинга, то нужно,
  чтобы эта процедура запускалась раньше всех кверей
*)
begin
  if ShortQ.Active and (Shortq.RecordCount > 0) and sbSpeedUp.Down then
  begin
    q.Close;
    if AUseTTNNum then
    begin
      q.RestoreSQL;
      q.AddWhere(' r.INST = :INST and r.DATE_ = :DATE_ and r.TTN_NUM = :TTN_NUM ');
      q.SetOrderBy('r.ID');
      q.Prepare;
      _OpenQueryPar(q,
        ['TTN_NUM', qDoc.FieldByName('TTN_NUM').AsString,
         'INST',    qDoc.FieldByName('INST').AsInteger,
         'DATE_',   qDoc.FieldByName('DATE_').AsDateTime]);
    end
    else
    begin
      q.RestoreSQL;
      q.AddWhere('r.ID = :ID and r.INST = :INST and trunc(r.DATE_) = :DATE_');
      q.Prepare;
      _OpenQueryPar(q,
        ['ID',    ShortQ.FieldByName('ID').AsInteger,
         'INST',  ShortQ.FieldByName('INST').AsInteger,
         'DATE_', ShortQ.FieldByName('DATE_').AsDateTime]);
    end;
  end;
end;

procedure TRashRefForm.sbClearDovNumClick(Sender: TObject);
begin
 edDovNum.Clear;
end;

procedure TRashRefForm.PageControlChange(Sender: TObject);
begin
  inherited;
  case PageControl.ActivePageIndex of
    1:
      begin
        ReopenQDoc;
        if not gr.DataSource.DataSet.IsEmpty then
          dbgDoc.DataSource.DataSet.Locate('ttn_num;ttn_date',
            VarArrayOf([gr.DataSource.DataSet.FieldByName('ttn_num').AsString, gr.DataSource.DataSet.FieldByName('ttn_date').AsString]), []);
      end;
    0:
      begin
        if not dbgDoc.DataSource.DataSet.IsEmpty then
          gr.DataSource.DataSet.Locate('ttn_num;ttn_date',
            VarArrayOf([dbgDoc.DataSource.DataSet.FieldByName('ttn_num').AsString, dbgDoc.DataSource.DataSet.FieldByName('ttn_date').AsString]), []);
      end;
  end;
  rxSpeedButton1.Enabled := PageControl.ActivePageIndex = 0;
  sbEdit.Enabled := PageControl.ActivePageIndex = 0;
  sbDel.Enabled := PageControl.ActivePageIndex = 0;
  miDog.Visible := PageControl.ActivePageIndex = 0;
  miFilialMotion.Visible := PageControl.ActivePageIndex = 1;
  SetMenu;
  ChangeDet;   
end;

procedure TRashRefForm.sbClearGoodsClick(Sender: TObject);
begin
  inherited;
  cbGoods.ItemIndex := -1;
end;

procedure TRashRefForm.miRashSopClick(Sender: TObject);
begin
  inherited;
  if AddRashSop = mrOk then
    bbSearch.Click;
end;
//==============================================================================
procedure TRashRefForm.OpenQDet;
begin
  if qDetail.Active then
    qDetail.Close;
  qDetail.ParamByName('group_num').AsInteger := ds.DataSet.FieldByName('group_num').AsInteger;
  qDetail.ParamByName('inst').AsInteger := ds.DataSet.FieldByName('inst').AsInteger;
  qDetail.ParamByName('startdate').Value := ds.DataSet.FieldByName('date_').Value;
  qDetail.Prepare;
  qDetail.Open;
end;
//==============================================================================
procedure TRashRefForm.ChangeDet;
begin
  if qDetail.Active then qDetail.Close;
  if cbShowDetail.Checked and (ds.DataSet.FieldByName('group_num').AsInteger<>0) and (PageControl.ActivePageIndex = 0) then
  begin
    OpenQDet;
    if pDetail.Height = 0 then
    begin
      SplitterDetail.Height := 6;
      pDetail.Height := gr.Height div 3;
    end;
  end
  else
  begin
    if pDetail.Height <> 0 then
    begin
      SplitterDetail.Height := 0;
      pDetail.Height := 0;
    end
  end;
end;
//==============================================================================
procedure TRashRefForm.SetMenu;
var IsSop: Boolean;
begin
  IsSop:=(ds.DataSet.FieldByName('group_num').AsInteger<>0)
           and (PageControl.ActivePageIndex = 0);

  miDog.Visible:=not IsSop and (PageControl.ActivePageIndex = 0);
  miPerinNN.Visible:=true;//not IsSop;
  miPrnRashNak.Visible := not IsSop;
  miRashNakSop.Visible:=IsSop;

  miPricePart.Visible := not IsSop and (PageControl.ActivePageIndex = 0);
end;
//==============================================================================
procedure TRashRefForm.dsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  ChangeDet;
  SetMenu;
end;
//==============================================================================
procedure TRashRefForm.cbDetClick(Sender: TObject);
begin
  inherited;
  ChangeDet;
end;
//==============================================================================
procedure TRashRefForm.MakeSopRashNak(p_Inside: Boolean = true);
var
  qOrg: TOilQuery;
  XLApp,List: Variant;
  s: string;
  FirstRow,n: integer;
  summa,nds: Currency;
begin
  if not qDetail.Active then
    OpenQDet;
  qOrg:=TOilQuery.Create(nil);
  qOrg.Session:=frmStart.OraSession1;
  qOrg.Sql.Text:=
    ' select * from v_oil_org'+
    ' where id='+ds.DataSet.FieldByName('from_id').AsString+
    '   and inst='+ds.DataSet.FieldByName('from_inst').AsString;
  if qDetail.FieldByName('r_from_').AsInteger<>0 then
    q.Sql.Add(
      ' and rek_id='+qDetail.FieldByName('r_from_').AsString+
      ' and rek_inst='+qDetail.FieldByName('r_from_inst').AsString);
  q.Sql.Add(
    ' order by def desc');
  _OpenQueryOra(qOrg);

  ActivateXLApp('rashnaksop','rashnaksop',1,XLApp,List);
  List.Cells[1,'A']:=LangText('Firma')+qOrg.FieldByName('name').AsString;
  s:=LangText('EDRPOU')+qOrg.FieldByName('id_num').AsString;
  if qOrg.FieldByName('phone').AsString<>'' then
    s:=s+TranslateText(', тел.')+qOrg.FieldByName('phone').AsString;
  List.Cells[2,'A']:=s;
  List.Cells[3,'A']:=
    LangText('R/S')+qOrg.FieldByName('rach_chet').AsString+TranslateText(' в ')+
    qOrg.FieldByName('bank_name').AsString+TranslateText(' МФО ')+
    qOrg.FieldByName('mfo').AsString;
  List.Cells[4,'A']:=LangText('Adr')+qOrg.FieldByName('addr').AsString;
  List.Cells[5,'A']:=LangText('Poluchatel')+ds.DataSet.FieldByName('to_name').AsString;
  if p_Inside then s:=LangText('Nakladna_na_Vn_perem')+' №'
              else s:=LangText('Rashodna_nakladna')+' №';
  List.Cells[7,'A']:=s+ds.DataSet.FieldByName('ttn_num').AsString;
  List.Cells[8,'A']:=LangText('Ot')+ds.DataSet.FieldByName('date_').AsString;

  if not p_Inside then
  begin
    List.Cells[10,'G']:=LangText('Price')+TranslateText(' без ')+LangText('NDS')+TranslateText(' за 1 шт.');
    List.Cells[10,'H']:=LangText('Sum')+TranslateText(' без ')+LangText('NDS');
  end;

  qDetail.First; FirstRow:=11; n:=FirstRow; summa:=0; nds:=0;
  while not qDetail.Eof do
  begin
    List.Cells[n,'A']:=n+1-FirstRow;
    if qDetailSERT.IsNull then
      List.Cells[n,'B']:=qDetail.FieldByName('np_type').AsString
    else
      List.Cells[n,'B']:=qDetail.FieldByName('np_type').AsString +#10+ LangText('sert_sm') + qDetailSERT.AsString;
    List.Cells[n,'C']:=qDetail.FieldByName('dog').ASString;
    List.Cells[n,'D']:=TranslateText('шт.');
    List.Cells[n,'E']:=qDetail.FieldByName('shtuki').AsInteger;
    List.Cells[n,'F']:=qDetail.FieldByName('ss').AsFloat;
    if p_Inside then
    begin
      List.Cells[n,'G']:=qDetail.FieldByName('price').AsFloat;
      List.Cells[n,'H']:=qDetail.FieldByName('summa').AsFloat;
    end
    else
    begin
      List.Cells[n,'G']:=GetNoNds_WithNds(qDetail.FieldByName('price').AsFloat,ds.DataSet.FieldByName('date_').AsDateTime,4);
      List.Cells[n,'H']:=GetNoNds_WithNds(qDetail.FieldByName('summa').AsFloat,ds.DataSet.FieldByName('date_').AsDateTime,2);
    end;
    summa:=summa+qDetail.FieldByName('summa').AsFloat;
    nds:=nds+GetNds_WithNds(qDetail.FieldByName('summa').AsFloat,ds.DataSet.FieldByName('date_').AsDateTime,2);
    qDetail.Next; inc(n);
  end;
  qDetail.First;
  DrawNetInExcel(List,1,8,FirstRow,n-1);
  List.Cells[n,'A']:=LangText('Itogo')+':';
  List.Cells[n,'E']:='=SUM(E'+IntToStr(FirstRow)+':E'+IntToStr(n-1)+')';
  List.Cells[n,'H']:='=SUM(H'+IntToStr(FirstRow)+':H'+IntToStr(n-1)+')';
  List.Range['A'+IntToStr(n)+':H'+IntToStr(n)].Font.Bold:=TRUE;

  if p_Inside then
  begin
    List.Cells[n+2,'A']:=LangText('Vsego_sum')+':';
    List.Cells[n+3,'A']:=NumStrGrn(summa,TranslateText('грн.'),TranslateText('коп.'));
  end
  else
  begin
    List.Cells[n+2,'A']:=LangText('NDS')+': '+FloatToStr(nds);
    List.Cells[n+3,'A']:=LangText('Vsego')+': '+NumStrGrn(summa,TranslateText('грн.'),TranslateText('коп.'));
  end;

  List.Cells[n+3,'A'].Font.Bold:=TRUE;
  List.Cells[n+6,'A']:=LangText('Vidal')+' ____________________________';
  List.Cells[n+6,'E']:=LangText('Poluchil')+' _____________________________';
  if not p_Inside then begin
    List.Columns['C:C'].EntireColumn.Hidden:=true;
    List.Columns['F:F'].EntireColumn.Hidden:=true;
  end;
  XLApp.Visible:=TRUE;
  qOrg.Free;
end;
//==============================================================================
procedure TRashRefForm.miRashNakSopClick(Sender: TObject);
begin
  inherited;
  if ds.DataSet.FieldByName('group_num').AsInteger = 0 then exit;
  MakeSopRashNak(not (ds.DataSet.FieldByName('oper_id').AsInteger in [11,12]));
end;
//==============================================================================
procedure TRashRefForm.cbColClickCheck(Sender: TObject);
var
  i:integer;
begin
 // inherited;
  for i:=0 to cbCol.Items.count-1 do
    dbgDoc.Columns[i].Visible:=cbCol.Checked[i];
end;

procedure TRashRefForm.sbColClick(Sender: TObject);
var
  i:integer;
begin
  sbColDanie.Down := False;
  if not sbCol.Down then
  Begin
    PanelCol.Width := 0;
    cbColDanie.Visible := True;
    cbCol.Visible := False;
  end
  else
  Begin
    sbColDanie.Down:= False;
    PanelCol.Width := 150;
    cbColDanie.Visible := False;
    cbCol.Visible := True;
    cbCol.Items.Clear;
    For i:=0 to dbgDoc.Columns.Count-1 do
    Begin
      cbCol.Items.Add(dbgDoc.Columns[i].Title.Caption);
      if dbgDoc.Columns[i].Visible then
        cbCol.Checked[i]:=TRUE
      else
        cbCol.Checked[i]:=FALSE;
    end;
  End;
end;

procedure TRashRefForm.sbColDanieClick(Sender: TObject);
var
  i:integer;
begin
  sbCol.Down := False;
  if not sbColDanie.Down then
  Begin
    PanelCol.Width := 0;
    cbColDanie.Visible := False;
    cbCol.Visible := True;
  end
  else
  Begin
    PanelCol.Width := 150;
    cbColDanie.Visible := True;
    cbCol.Visible := False;
    cbColDanie.Items.Clear;
    For i:=0 to gr.Columns.Count-1 do
    Begin
      cbColDanie.Items.Add(gr.Columns[i].Title.Caption);
      if gr.Columns[i].Visible then
        cbColDanie.Checked[i]:=TRUE
      else
        cbColDanie.Checked[i]:=FALSE;
    end;
  End;
end;

procedure TRashRefForm.cbColDanieClickCheck(Sender: TObject);
var
  i : integer;
begin
//  inherited;
  for i:=0 to cbColDanie.Items.count-1 do
    gr.Columns[i].Visible:=cbColDanie.Checked[i];
end;

procedure TRashRefForm.sbSumClick(Sender: TObject);
begin
  if sbTotal.Down then begin
    gr.FooterRowCount := 1;
    dbgDoc.FooterRowCount := 1;
  end
  else begin
    gr.FooterRowCount := 0;
    dbgDoc.FooterRowCount := 0;
  end;
end;

procedure TRashRefForm.grDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
var
  I : Integer;
  qq  : TOilQuery;
begin
  qq := ds.DataSet as TOilQuery;
  If DataCol = 0 then
  Begin
    If qq.Active then
    If qq.RecordCount > 0 then
    Begin
      if qq.FieldByName('group_num').AsInteger<>0 then i:=7
      else If qq.FieldByName('To_ID').AsString = '' Then I := 5
      Else If qq.FieldByName('Oper_Id').AsInteger = Oper_MoveRR Then I := 6
      Else If qq.FieldByName('Prih').AsString <> '' Then I := 4
      Else I := 3;
      il.Draw(gr.Canvas, Rect.Left, Rect.Top, I);
    End;
  End;
end;

procedure TRashRefForm.ShortQCalcFields(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('sum').asFloat :=
     Fround(DataSet.FieldByName('count_').asFloat * DataSet.FieldByName('price').asFloat,2);
end;

procedure TRashRefForm.spbSelectAllClick(Sender: TObject);
var
  i:integer;
begin
  if sbColDanie.Down then
    for i:=0 to cbColDanie.Items.count-1 do
    Begin
      gr.Columns[i].Visible:=TRUE;
      cbColDanie.Checked[i]:=TRUE;
    end
  Else if sbCol.Down then
    for i:=0 to cbCol.Items.count-1 do
    Begin
      dbgDoc.Columns[i].Visible:=TRUE;
      cbCol.Checked[i]:=TRUE;
    end;
end;

procedure TRashRefForm.spbCloseTunePanelClick(Sender: TObject);
begin
  sbColDanie.Down := false;
  sbColDanieClick(nil);
  sbCol.Down := false;
  sbColClick(nil);
end;
//==============================================================================
procedure TRashRefForm.miFilialMotionClick(Sender: TObject);
const
  c_filename = 'Перемещение от %s {%s}';
var
  RN: TdmRashNakPrint;
  F: TfrmThirdPartyPrint;
  np_type, CurNpIdx, i: integer;
  WantedCount: Currency;
  DifNpTypes, ZdnList, TankWagonList: TStringList;
  ZdnListTxt, TankWagonListTxt, koma, dirname, filename: string;
  XLApp,List: Variant;

  procedure SeTOilQueryFilter(AQuery: TOilQuery;AFilter: String);
  begin
    AQuery.Filtered:=False;
    AQuery.Filter:=AFilter;
    AQuery.Filtered:=True;
  end;

begin
  If (qDoc.FieldByName('oper_id').AsInteger<>OPER_MOVEFIL) then
  begin
    MessageDlg(TranslateText('Эта возможность доступна только для отпусков с операцией ')+GetOperationName(OPER_MOVEFIL),mtInformation,[mbOk],0);
    Exit;
  end;

  if 12<>GetSqlValue(format('select nvl(sub_type,0) from oil_dog where id=%d and inst=%d',
    [qDoc.FieldByName('kp_id').AsInteger,
     qDoc.FieldByName('kp_inst').AsInteger])) then
  begin
    MessageDlg(TranslateText('Чтобы напечатать документы необходимо чтобы отпуск был согласно договора-заявки !'),mtInformation,[mbOk],0);
    Exit;
  end;
  DifNpTypes := TStringList.Create();
  ZdnList:=TStringList.Create();
  TankWagonList:=TStringList.Create();
  // Создаем формочку с настройками
  F := TfrmThirdPartyPrint.Create(Application);
  try
    F.pnlOrgs.Enabled:=False;
    F.sbAuto.Visible:=False;
    f.Panel2.Visible:=False;
    F.pnlPrintAll.Visible:=False;
    F.cbOutputType.Items.Delete(1);
    F.label5.Visible:=false;
    F.edNumOfCopy.Visible:=False;
    F.chSaveTo.Visible:=False;
    F.deSaveTo.Visible:=False;
    F.sbUpDown.Visible:=False;
    F.Panel1.Height:=35;
    SetPrevMonth(F.deBeginDate,F.deEndDate);
    F.ModalResultOnly:=True;
    f.edDep.Text:=GetOrgName(qDoc.FieldByName('from_id').AsInteger,qDoc.FieldByName('from_inst').AsInteger);
    f.edOrg.Text:=GetOrgName(qDoc.FieldByName('to_id').AsInteger,qDoc.FieldByName('to_inst').AsInteger);
    f.deDocDate.Date := qDoc.FieldByName('date_').AsDateTime;
    if Debugging then
      F.edDocNumber.Text := '1';

    if F.ShowModal<>mrOk then
      EXIT
    else
    begin
      // вскрываем запросы
      qDocFilRn.Close; qDocFilRn.Filtered:=False;
      qDocFilAct.Close; qDocFilAct.Filtered:=False;
      _OpenQueryParOra(qDocFilRn,
        ['kp_id',   qDoc.FieldByName('kp_id').AsInteger,
         'kp_inst', qDoc.FieldByName('kp_inst').AsInteger,
         'date_',   qDoc.FieldByName('date_').AsDateTime]
        );
      _OpenQueryParOra(qDocFilAct,
        ['kp_id',   qDoc.FieldByName('kp_id').AsInteger,
         'kp_inst', qDoc.FieldByName('kp_inst').AsInteger,
         'date_',   qDoc.FieldByName('date_').AsDateTime]
        );
      // Проверяем на сколько разних типов нефтепродуктов уже есть отпуски по данному договору
      np_type:=qDocFilRn.FieldByName('np_type').AsInteger;
      DifNpTypes.Add(IntToStr(np_type));
      qDocFilRn.First;
      while not(qDocFilRn.Eof) do
      begin
        if(np_type<>qDocFilRn.FieldByName('np_type').AsInteger)then
        begin
          DifNpTypes.Add(IntToStr(qDocFilRn.FieldByName('np_type').AsInteger));
          np_type:=qDocFilRn.FieldByName('np_type').AsInteger;
        end;
        qDocFilRn.Next;
      end;
      for CurNpIdx:=0 to DifNpTypes.Count - 1 do
      begin
        // Отфильтровуем лишние нефтепродукты
        SeTOilQueryFilter(qDocFilRn,'np_type='+DifNpTypes.Strings[CurNpIdx]);
        SeTOilQueryFilter(qDocFilAct,'np_type='+DifNpTypes.Strings[CurNpIdx]);
        // Выгребаем все ЖДН и цистерны и отсееваем повторяющиеся
        begin
          qDocFilAct.First;
          ZdnList.Clear;
          TankWagonList.Clear;
          While not(qDocFilAct.Eof)do
          begin
            if(ZdnList.IndexOf(qDocFilAct.FieldByName('ZDN_NUM').AsString)=-1)then
              ZdnList.Add(qDocFilAct.FieldByName('ZDN_NUM').AsString);
            if(TankWagonList.IndexOf(qDocFilAct.FieldByName('TankWagon').AsString)=-1)then
              TankWagonList.Add(qDocFilAct.FieldByName('TankWagon').AsString);
            qDocFilAct.Next;
          end;
          koma:=''; ZdnListTxt:='';
          for i:=0 to ZdnList.count-1 do
          begin
            ZdnListTxt:=ZdnListTxt+koma+ZdnList[i];
            koma:=', ';
          end;
          koma:='';TankWagonListTxt:='';
          for i:=0 to TankWagonList.count-1 do
            if(trim(TankWagonList[i])<>'')then
            begin
              TankWagonListTxt:=TankWagonListTxt+koma+trim(TankWagonList[i]);
              koma:=', ';
            end;
          if trim(TankWagonListTxt) = '' then
            TankWagonListTxt := '...';
          if  trim(ZdnListTxt) = '' then
            ZdnListTxt := '...';
        end;
        // Задаем начальные параметри для РН
        rn := TdmRashNakPrint.Create(
          f.edDocNumber.Text,
          qDoc.FieldByName('kp_dog').AsString,
          qDoc.FieldByName('kp_date').AsDateTime,
          f.deDocDate.Date,
          ZdnListTxt,
          TankWagonListTxt,
          qDoc.fieldByName('From_id').AsInteger,qDoc.fieldByName('From_inst').AsInteger,
          qDoc.fieldByName('to_id').AsInteger,qDoc.fieldByName('to_inst').AsInteger,
          rnNB);
        try
          // Достаем "затребованое количество" конкретного нефтепродукта
          WantedCount:= GetSqlValue(format('select COUNT_ from oil_dog_detail where state=''Y'' and dog_id = %d and dog_inst=%d and NP_TYPE=%d ',
             [qDoc.FieldByName('kp_id').AsInteger,
              qDoc.FieldByName('kp_inst').AsInteger,
              StrToInt(DifNpTypes.Strings[CurNpIdx])
              ])
            );
          // Заполняем позиции РН
          qDocFilRn.First;
          While not(qDocFilRn.Eof) do
          begin
            rn.AddPosition(
              qDocFilRn.FieldByName('cert_name').AsString,
              qDocFilRn.FieldByName('np_type_name').AsString,
              qDocFilRn.FieldByName('dog').AsString,
              qDocFilRn.FieldByName('to_place').AsString,
              qDocFilRn.FieldByName('DIM_NAME').AsString,
              qDocFilRn.FieldByName('count_').AsFloat,
              WantedCount,
              qDocFilRn.FieldByName('price').AsFloat
              );
            qDocFilRn.Next;
          end;
          // создаем
          filename:= Format(c_filename,
            [FormatDateTime('dd_mm_yyyy',qDoc.FieldByName('date_').AsDateTime),
             RemoveSymbols(qDocFilRn.FieldByName('np_type_name').AsString,'".?*''><:;|\/')
             ]);
          ActivateXLApp('RNActInternalMotion',filename,1,XLApp,List);
          rn.MSExcel := TMSExcel.Create(XlApp,List);
          rn.PutToExcel(0);
        finally
          Rn.Free;        
        end;
        List:=Main.MsExcel.ActiveWorkBook.Worksheets[2];
        PrintAct(List,
          qDocFilAct,'rownum;zdn_num;tankwagon;count_',
          qDoc.FieldByName('from_id').AsInteger,qDoc.FieldByName('From_inst').AsInteger,
          qDoc.FieldByName('to_id').AsInteger,qDoc.FieldByName('to_inst').AsInteger,
          qDocFilRn.FieldByName('Kp_dog').AsString,
          qDocFilRn.FieldByName('Kp_date').AsDateTime,
          F.deDocDate.Date);
        if  F.cbOutputType.ItemIndex=1 then// На диск
        begin
          // СОХРАНЯЕМ
          dirname:=GetMainDir+'Doc\Межфилиальное перемещение\'; // *NO_TRANSLATE*
          if not DirectoryExists(dirname) then CreateDir(dirname);
          dirname:=dirname
            +RemoveSymbols(GetOrgName(qDoc.FieldByName('to_id').AsInteger,qDoc.FieldByName('to_inst').AsInteger),'".?*''><:;|\/')+'\';
          if not DirectoryExists(dirname) then CreateDir(dirname);
          filename:=dirname+filename+'.xls';
          if FileExists(filename) then DeleteFile(filename);
          XLApp.ActiveWorkbook.SaveAs(filename);
          XLApp.ActiveWorkbook.Close;
        end
        else
          XlApp.Visible:=True;
        try
          f.edDocNumber.Text:=IntToStr(StrToInt(f.edDocNumber.Text)+1);
        except
          f.edDocNumber.Text:=InputBox(TranslateText('Введите следующий номер документа'), TranslateText('Номер документа'), '');
        end;
      end;
    end;
    if  F.cbOutputType.ItemIndex=1 then// На диск
      ShowMessage(TranslateText('Документы были сохранены в ')+dirname);
    F.Free;
    DifNpTypes.Free;
    ZdnList.Free;
    TankWagonList.Free;
  except on E:Exception do
    begin
      F.Free;
      DifNpTypes.Free;
      ZdnList.Free;
      TankWagonList.Free;
      MessageDlg(E.Message,mtWarning,[mbOk],0);
    end;
  end;
end;
//==============================================================================
procedure TRashRefForm.PrintAct(
  AList: Variant;                              //лист екселя
  AQuery: TOilQuery;                           //кверя с табличными данными
  AFieldList: string;                          //поля для вывода в таблицу
  AFromId, AFromInst, AToId, AToInst: integer; //иды и инсты сторон
  ADog: String;
  ADogDate, ADate: TDateTime                   //дата Акта
  );
var
  vFrom, vTo: TOilQuery;
  CurPos, PAR_ID, PAR_INST: integer;
begin
  AList.Select;
  CurPos:=12;
  vFrom := TOilQuery.Create(nil);
  vTo := TOilQuery.Create(nil);
  try
    GetOrgData(vFrom, AFromId, AFromInst);
    if (vFrom.FieldByName('org_id').AsInteger = 3) and (PRINT_RN_FILIAL = 'Y')
      and not vFrom.FieldByName('par').IsNull then
    begin
      PAR_ID := vFrom.FieldByName('par').AsInteger;
      PAR_INST := vFrom.FieldByName('par_inst').AsInteger;
      GetOrgData(vFrom, PAR_ID, PAR_INST);
    end;
    GetOrgData(vTo, AToId, AToInst);
    ExFormat(AList,5,'A',
      [vFrom['name'],
       vFrom['dogovor'],
       vTo['name'],
       vTo['dogovor']]);
    AList.Cells[3,'E'].Value:= FormatDateTime2('dd.mm.yyyy',ADate);
    ExFormat(AList,6,'A',
      [FormatDateTime2('dd.mm.yyyy',ADate)]);
    AQuery.First;
    while not(AQuery.Eof)do
    begin
      PutArrayToExcel(AList,CurPos,2,AQuery.FieldValues[AFieldList]);
      inc(CurPos);
      AQuery.Next;
    end;
    DrawNetInExcel(AList,2,5,12,CurPos);
    AList.Rows[CurPos].Font.Bold:=True;
    AList.Cells[CurPos,'C'].Value:=LangText('Vsego');
    AList.Cells[CurPos,'E'].Value:='=SubTotal(9,E12:E' + IntToStr(CurPos - 1) + ')';
    AList.Cells[CurPos,'E'].NumberFormat := '0,000';
    AList.Cells[CurPos+2,'A'].Value:=Format(AList.Cells[15,'A'].Value,
      [ADog,
       FormatDateTime2('dd.mm.yyyy',ADogDate)]);
    AQuery.First;
    ExFormat(AList,8, 'A',
      [AQuery.FieldByName('Np_Type_Name').AsString,
       AList.Cells[CurPos,'E'].Value,
       _Money2Words(trunc(AList.Cells[CurPos,'E'].Value), TranslateText('тонна,тонны,тонн'), '','F',umUpperFirst)
       +' '+FloatToStr(MRound(frac(AList.Cells[CurPos,'E'].Value)*1000, 0))+' '+TranslateText('кг.'),
       AQuery.FieldByName('To_Place').AsString]);
    AList.Cells[CurPos+4,'C'].Value:=vFrom.FieldByName('name').AsString;
    AList.Cells[CurPos+4,'E'].Value:=vTo.FieldByName('name').AsString;
    AList.Cells[CurPos+6,'C'].Borders[xlEdgeBottom].LineStyle:=xlContinuous;
    AList.Cells[CurPos+6,'C'].Borders[xlEdgeBottom].Weight := xlMedium;
    AList.Cells[CurPos+6,'E'].Borders[xlEdgeBottom].LineStyle:=xlContinuous;
    AList.Cells[CurPos+6,'E'].Borders[xlEdgeBottom].Weight := xlMedium;
  finally
    vFrom.Free;
    vTo.Free;
  end;
end;
//==============================================================================
function TRashRefForm.IsInsideShift:boolean;
begin
  result:=( (PRINT_TTN_FIL_NK = 'Y') and (qOPER_ID.AsInteger = 10) )
    or( qOPER_ID.AsInteger=150 )
end;

procedure TRashRefForm.mActDiscardClick(Sender: TObject);
var s1,s2,data: string;
    FileName,PatternName: string;
    v1,v2: variant;
begin
 inherited;
 ShortToLong;
 _OpenQuery(q);
 if q.FieldByName('Oper_ID').AsString='16' then 
  begin
   if INTERACTIVE_LAUNCH_MODE then
    begin
     FileName:='ActAllowances';
     CopyFile(PChar(PatternName),PChar(Filename),FALSE);
    end
    else FileName := PatternName;
   MSWord:=CreateOleObject('Word.Basic');
   MSWord.AppShow;
   MsWordDotAdd(FileName,MSWord);
   MsWord.EditGoTo(Destination:='NpName');
   MsWord.Insert(q.FieldByName('Np_Type_Name').AsString+' ');
   MsWord.EditGoTo(Destination:='NpNameTitle');
   MSWord.Insert(q.FieldByName('Np_Type_Name').AsString+' ');
   MsWord.EditGoTo(Destination:='Quantity');
   MSWord.Insert(q.FieldByName('Count_').AsString+'т');
   MsWord.EditGoTo(Destination:='Quantity1');
   MSWord.Insert(q.FieldByName('Count_').AsString+'т');
   MsWord.EditGoTo(Destination:='Add');
   MSWord.Insert(q.FieldByName('Count_').AsString+'т'+
                 ' на суму '+q.FieldByName('Summa').AsString+'грн ');
   MsWord.EditGoTo(Destination:='AddP');
   MsWord.Insert('('+NumStrGrn(round05(q.FieldByName('summ').AsCurrency* 100)/100,
                 TranslateText('грн'),TranslateText('коп'))+') ');
   MsWord.EditGoTo(Destination:='Buch');
   MsWord.Insert(main_org.GBuh);
   MsWord.EditGoTo(Destination:='Date');
   data:=TransDate(q.FieldByName('Date_').AsString,language);
   MsWord.Insert(data);
   MsWord.EditGoTo(Destination:='Name_from');
   MsWord.Insert(q.FieldByName('From_name').AsString);
// Вытаскиваем имена директора и обл
    s1:=('select max(boss) from v_oil_org_norek where id=:id and inst=id');
    v1:=GetSQLValueParSimple(s1,['id',q.FieldByName('inst').AsInteger]);
    s2:='select max(oblname) from v_oil_org_norek where id=:id and inst=id';
    v2:=GetSQLValueParSimple(s2,['id',q.FieldByName('inst').AsInteger]);
    MsWord.EditGoTo(Destination:='Boss');
    MsWord.Insert(v1);
    MsWord.EditGoTo(Destination:='NameOrg');
    MsWord.Insert(v2);
    if CheckOleConnected(MsWord) then MsWord:=UnAssigned;
    end
 else ShowMessage('Эта возможность доступна только для отпусков с операцией "'
    +GetOperationName(16)+'"');
end;

procedure TRashRefForm.spbClearColConfigClick(Sender: TObject);
begin
  ClearGridColumns(ClassName);
  ClearGridColumns(ClassName + '_Data');
end;

procedure TRashRefForm.edPartChange(Sender: TObject);
var
  i: byte;
begin
  inherited;
  lPart.Tag := 0;
  if edPart.Text <> '' then
    try
      edPart.Tag := StrToInt(edPart.Text);
    except
      //ShowMessage(TranslateText('Недопустимое значение!'));
      for i:=0 to length(edPart.Text) do
        if not(edPart.Text[i] in ['0'..'9']) then
          edPart.Text := Concat(Copy(edPart.Text, 0, i-1), Copy(edPart.Text, i+1, length(edPart.Text)));
    end;
end;

procedure TRashRefForm.sbTotalClick(Sender: TObject);
begin
  inherited;
  if sbTotal.Down then
  begin
    gr.FooterRowCount := 1;
    dbgDoc.FooterRowCount := 1;
  end
  else
  begin
    gr.FooterRowCount := 0;
    dbgDoc.FooterRowCount := 0;
  end;
end;
//==============================================================================
procedure TRashRefForm.actPrintTTNExcelExecute(Sender: TObject);
Var
  RealName,sert,priv, counter, sAzs:  String;
  ProgrForm: TProgrForm;
  Y, M, D: Word;
  RowTable,i: integer;
  litr,count: Currency;
  slCert: TStringList;
  RASH_TTN_PREF_FIRST, RASH_TTN_PREF_LAST: string;
Begin
  slCert := TStringList.Create;
  try
  try
    ShortToLong(PageControl.ActivePageIndex = 1);

    if (q.Active and (not q.IsEmpty))  then
    begin
      qDriver.Open;
      Application.CreateForm(TProgrForm, ProgrForm);
      ProgrForm.Show;
      ProgrForm.Refresh;

      ProgrForm.AddProgress(10);
      ActivateXLApp('TTN_New', 'TTN_New', 1, XLApp, List);
      StateExcel(XLApp, False);
      ProgrForm.AddProgress(20);

      // дата
      if qTTN_Date.AsDateTime <> 0 then
      begin
        DecodeDate(qTTN_Date.AsDateTime, Y, M, D);
        List.Cells[10,'B'] := Format(List.Cells[10,'B'], [qTTN_NUM.AsString, IntToStr(D), MonthToStr(M), IntToStr(Y)]);
      end
      else List.Cells[10,'B'] := Format(List.Cells[10,'B'], ['______', '___', '____________', '20___']);
      ProgrForm.AddProgress(10);

      // вантажовідправник
      if (MAIN_TYPE = 3) and (PRINT_TTN_FIL_NK = 'Y') then
      begin
        qTemp.Close;
        qTemp.SQL.Text := 'select * from v_org where id = '+ IntToStr(MAIN_PAR) +' and inst = '+ IntToStr(MAIN_PAR_INST);
        qTemp.Open;
        List.Cells[4,'B'] := qTemp.FieldByName('NAME').AsString;
        List.Cells[6,'B'] := qTemp.FieldByName('Addr').AsString;
      end
      else
      begin
        List.Cells[4,'B'] := qFrom_Name.AsString;
        List.Cells[6,'B'] := qFROM_ADDR.AsString;
      end;
      ProgrForm.AddProgress(10);

      List.Cells[8,'B'] := Format(List.Cells[8,'B'], [qFrom_OKPO.AsString]); // ідентифікаційний код ЄДРПОУ

      List.Cells[13,'E'] := qAuto_Numb.AsString; // автомобіль
      List.Cells[13,'B'] := qAuto_ATP.AsString; // автопідприємство
      List.Cells[13,'J'] := qWay_List.AsString; // до подорожнього листа

      if qPack.AsString = 'Бензовоз' then
        List.Cells[16,'J'] := DevideRusUkr('автоперевозка@автоперевезення');
      List.Cells[16,'E'] := qDriver.FieldByName('FullName').AsString; // водій


      if (PageControl.ActivePageIndex = 0) then
      begin
        List.Cells[16,'B'] := qTo_Name.AsString; // замовник (платник)
        List.Cells[19,'B'] := qTo_Name.AsString; // вантажоодержувач
        if qTo_Place.AsString = '' then
          List.Cells[23,'E'] := qTo_Name.AsString // вантажоодержувач
        else
          List.Cells[23,'E'] := qTo_Place.AsString; // пункт розвантаження
      end
      else
      begin
        List.Cells[16,'B'] := nvl(GetSqlValueParSimple('select par_name from v_oil_azs where id = :AId and inst = :AInst',
         ['AId',   qTO_ID.AsInteger,
          'AInst', qTO_INST.AsInteger]),nvl(GetSqlValueParSimple('select name from v_oil_org where id = :AId and inst = :AInst',
         ['AId',   qTO_ID.AsInteger,
          'AInst', qTO_INST.AsInteger]),'')); // замовник (платник)
        List.Cells[19,'B'] := nvl(GetSqlValueParSimple('select par_name from v_oil_azs where id = :AId and inst = :AInst',
         ['AId',   qTO_ID.AsInteger,
          'AInst', qTO_INST.AsInteger]),nvl(GetSqlValueParSimple('select name from v_oil_org where id = :AId and inst = :AInst',
         ['AId',   qTO_ID.AsInteger,
          'AInst', qTO_INST.AsInteger]),'')); // вантажоодержувач
      end;

      List.Cells[19,'E'] := qTRAILER_NUMB.AsString; // Причіп: державний №
      ProgrForm.AddProgress(10);

      // пункт навантаження
      if PRINT_TTN_REAL_ADDRESS = 'Y' then
      begin
        RealName := GetSqlValue(
              ' select nvl(odet.real_address,oo.name) from v_oil_org_det odet, v_org oo'+
              ' where odet.state(+)=''Y'' and odet.org_id(+)=oo.id and odet.inst(+)=oo.inst '+
              '       and oo.id='+qFrom_Id.AsString+' and oo.inst='+qFrom_Inst.AsString);
        List.Cells[23,'B'] := RealName;
        List.Cells[21,'B'] := RealName; // вантажовідправник
      end
      else
        begin
          RealName := nvl(GetSqlValueParSimple('select oo.par_name from v_oil_org_norek oo where oo.id=:AId and oo.inst=:AInst',
            ['AId',   qFrom_Id.AsInteger,
             'AInst', qFrom_INST.AsInteger]), '');
          List.Cells[23,'B'] := qFrom_Name.AsString + ' ' + qFROM_ADDR.AsString;
          if RealName<>'' then List.Cells[21,'B'] := RealName // вантажовідправник
            else List.Cells[21,'B'] :=nvl(GetSqlValue('select name from oil_org where id = ov.getval(''INST'') and inst = ov.getval(''INST'')'),'');
        end;
      ProgrForm.AddProgress(10);

      RowTable := 30;
      i:=0;
      sAzs := '';
      q.first;
      litr := 0;
      count := 0;
      while not q.Eof do
      begin
        // Пункт розвантаження
        if pos(qTo_Name.AsString, sAzs) = 0 then
          if sAzs = '' then
            sAzs := qTo_Name.AsString
          else
            sAzs := sAzs +', '+ qTo_Name.AsString;

        sert:= List.Cells[23,'E'];
        if (priv<>qTo_Place.AsString) and (sert<>qTo_Place.AsString) then
          if i=0 then
            List.Cells[23,'E'] := sert + qTo_Place.AsString
          else
            List.Cells[23,'E'] := sert + ', '+ qTo_Place.AsString;
        priv:=qTo_Place.AsString;
        // пункт розвантаження
        List.Rows[RowTable].Copy;
        List.Rows[RowTable].Insert;
        List.Cells[RowTable,'B'] := qNP_GRP_NAME.AsString; // Група н/п

        // Найменування, марка, вид нафтопродукту (нафти)
        if qNP_GRP.AsInteger = 3 then
        begin
          if AdmSettings.Exist('RASH_TTN_PREF_DT_FIRST') then RASH_TTN_PREF_FIRST := AdmSettings.Get('RASH_TTN_PREF_DT_FIRST');
          if AdmSettings.Exist('RASH_TTN_PREF_DT_LAST')  then RASH_TTN_PREF_LAST  := AdmSettings.Get('RASH_TTN_PREF_DT_LAST');
        end
        else
        begin
          if AdmSettings.Exist('RASH_TTN_PREF_NP_FIRST') then RASH_TTN_PREF_FIRST := AdmSettings.Get('RASH_TTN_PREF_NP_FIRST');
          if AdmSettings.Exist('RASH_TTN_PREF_NP_LAST')  then RASH_TTN_PREF_LAST  := AdmSettings.Get('RASH_TTN_PREF_NP_LAST');
        end;
        List.Cells[RowTable,'C'] :=
          RASH_TTN_PREF_FIRST + qNP_Type_Name.AsString + RASH_TTN_PREF_LAST;

        List.Cells[RowTable,'E'] := qREZ_NUM.AsString; // Номер резервуара
        List.Cells[RowTable,'F'] := qLITR.AsFloat; // Об'єм нафтопродукту (нафти), дм3
        litr:=litr+qLITR.AsFloat;
        List.Cells[RowTable,'J'] := qUd_Weig.AsString; // Густина нафтопродукту (нафти), кг/м3
        List.Cells[RowTable,'L'] := qTemper.AsString; // Температура нафтопродукту (нафти), °C
        List.Cells[RowTable,'N'] := qCount_.AsFloat*1000; // Маса нафтопродукту (нафти), кг
        count:=count+qCount_.AsFloat*1000;
        List.Cells[RowTable,'O'] := qUD_WEIG_20.AsString; // Густина нафтопродукту (нафти) при 20°C, кг/м3
        List.Cells[RowTable,'P'] := qTo_Name.AsString; // вантажоодержувач
        List.Cells[RowTable,'Q'] := qTANK_POSITION.AsString; // резервуар
        List.Cells[RowTable,'R'] := qSTAMP.AsString; // пломби
        // Пункт разгрузки в случае нескольких АЗС
        // Реєстраційний номер сертифіката відповідності
        qCert.Close;
        qCert.ParamByName('id').AsInteger := qId.AsInteger;
        qCert.ParamByName('inst').AsInteger := qInst.AsInteger;
        qCert.Open;
        inc(i);   

        if (qCert.FieldByName('name').AsString <> '') and
           (slCert.IndexOf(qNP_Type_Name.AsString+qCert.FieldByName('name').AsString) = -1)then
        begin
          slCert.Add(qNP_Type_Name.AsString+qCert.FieldByName('name').AsString);
          List.Rows[RowTable-3-i].Insert;
          List.Cells[RowTable-3-i,'B'] :=  qNP_Type_Name.AsString;
          List.Cells[RowTable-3-i,'D'] :=  qCert.FieldByName('name').AsString;
          Inc(RowTable);
        end;

        q.Next();
        Inc(RowTable);
      end;

      // Пункт розвантаження
      sert := List.Cells[23,'E'];
      if sert = '' then
        List.Cells[23,'E'] := sAzs;

      List.Rows[RowTable].Delete;

      ProgrForm.AddProgress(10);

      RowTable := RowTable-1;

      List.Cells[RowTable+1,'F'] := floattostr(litr);
      List.Cells[RowTable+1,'N'] := floattostr(count);

      // Сотрудник выписавший ТТН
      counter := nvl(GetSqlValueParSimple('select u_name from adm_users where id = :id',
        ['id', Main.SUPER_REAL_EMP_ID]),'');
      if counter = 'Учетчик' then
        counter := '';

      List.Cells[RowTable + 4,'E'] := counter;
      // довіреність
      if qDov_Date.AsDateTime <> 0 Then
      begin
        DecodeDate(qDov_Date.AsDateTime, Y, M, D);
        List.Cells[RowTable + 2,'B'] := Format(List.Cells[RowTable + 2,'B'],
          [qDov_Num.AsString, qDov_Serial.AsString, IntToStr(D), MonthToStr(M), IntToStr(Y)]);
      end
      else
        List.Cells[RowTable + 2,'B'] := Format(List.Cells[RowTable + 2,'B'], ['______', '______', '___', '____________', '20___']);
      List.Cells[RowTable + 3,'B'] := Format(List.Cells[RowTable + 3,'B'], [qDov_Give.AsString]);
      List.Cells[RowTable + 6,'J'] := Now;
      List.Cells[RowTable + 10,'E'] := qDriver.FieldByName('FullName').AsString; // водій
      ProgrForm.AddProgress(20);

      StateExcel(XLApp, True);
      XLApp.Visible := True;
    End;
  Except
    On E: Exception Do
      MessageDlg(TranslateText('Ошибка : ')+ E.message, mtError, [mbOk], 0);
  End;

  finally
    slCert.Free;
    ProgrForm.Free;
  end;

  if qDriver.Active then
    qDriver.Close;
end;
//==============================================================================
procedure TRashRefForm.actPrintTTNExcelUpdate(Sender: TObject);
begin
  inherited;
  actPrintTTNExcel.Visible := q.IsEmpty;
end;

procedure TRashRefForm.MI1Click(Sender: TObject);
var
  tmpq: TOilQuery;
  tmpDBGrid: TDBGridEh;
begin
  // Производим подмену гридов и запросов для того чтобы работал метод из базовой формы
  tmpq := q;
  tmpDBGrid := DBGrid1;
  try
    if PageControl.ActivePageIndex = 0 then
      DBGrid1 := gr
    else if PageControl.ActivePageIndex = 1 then
      DBGrid1 := dbgDoc;
    q := TOilQuery(DBGrid1.DataSource.DataSet);
    inherited;
  finally
    DBGrid1 := tmpDBGrid;
    q := tmpq;
  end;
end;

procedure TRashRefForm.sbClearToParClick(Sender: TObject);
begin
  inherited;
  if ceToPar.Enabled then
  begin
    FToParId := 0;
    FToParInst := 0;
    ceToPar.Text := '';
  end;
end;

procedure TRashRefForm.ceToParButtonClick(Sender: TObject);
var
  vName:string;
begin
  if ChooseOrg.CaptureOrg(1,Main_id,Inst,'yyx',FToParId,FToParInst,vName) then
  begin
    ceToPar.Text := vName;
  end;
end;

procedure TRashRefForm.miPricePartClick(Sender: TObject);
begin // Установить цену партии
  ShortToLong;
  if not ((qGROUP_NUM.AsInteger = 0) and (qUCH_PRICE.AsString  = 'Y')) then
  begin
    MessageDlg(TranslateText('Только для отпусков НП по учетной цене!'), mtInformation, [mbOk], 0);
    exit;
  end;

  StartSQL;
  try
    // проставляємо ціну
    _ExecSqlOra(
      'update oil_rashod r' +
      '   set r.price = nvl((select p.ss from oil_part p' +
      '                       where p.id = r.part_id and p.inst = r.part_inst), r.price)' +
      ' where r.id = :p_id and r.inst = :p_inst',
      ['p_id', qID.AsInteger, 'p_inst', qINST.AsInteger]);

    // проставляємо суму
    _ExecSqlOra(
      'update oil_rashod r' +
      '   set r.summa = round(r.price * r.count_, 2)' +
      ' where r.id = :p_id and r.inst = :p_inst',
      ['p_id', qID.AsInteger, 'p_inst', qINST.AsInteger]);

    CommitSQL;
    bbSearch.Click;
  except on E: Exception do
    begin
      RollbackSQL;
      MessageDlg(TranslateText('Ошибка : ')+ E.message, mtError, [mbOk], 0);
    end;
  end;
end;

end.
