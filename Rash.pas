unit Rash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ToolEdit, Mask, Db, DBTables, CurrEdit,
  DBCtrls, RxLookup, Placemnt, RXSplit, RXCtrls, uMessageDlgExt, LogSaleDeadbeat,
  MemDS, DBAccess, Ora, uCommonForm, uOilQuery, uOilStoredProc{$IFDEF VER150},
  Variants, OraSmart, Menus, DBCtrlsEh, Grids, DBGridEh, VirtualTable,
  GridsEh, ActnList, DBGridEhGrouping{$ENDIF};
type
  TRashForm = class(TCommonForm)
    pnlBtn: TPanel;
    SP: TOilStoredProc;
    qFrom: TOilQuery;
    qLeft: TOilQuery;
    qLeftS: TFloatField;
    pPartLeft: TPanel;
    lPartLeft: TLabel;
    lblPartLeft: TLabel;
    pRezLeft: TPanel;
    lblRezLeft: TLabel;
    lRezLeft: TLabel;
    pPartRezLeft: TPanel;
    lblPartRezLeft: TLabel;
    lPartRezLeft: TLabel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    qNN: TOilQuery;
    qNNNN_ID: TFloatField;
    qNNNN_INST: TFloatField;
    qFromNAME: TStringField;
    qFromBANK_NAME: TStringField;
    qFromRACH_CHET: TStringField;
    qFromMFO: TStringField;
    qFromR_ID: TFloatField;
    qFromR_INST: TFloatField;
    qNNNUM: TStringField;
    BalanceQuery: TOilQuery;
    BalanceQueryID: TFloatField;
    BalanceQueryINST: TFloatField;
    BalanceQueryBACO: TFloatField;
    AuxQuery: TOilQuery;
    qHardware: TOilQuery;
    qCorrSumm: TOilQuery;
    qAllNNSum: TOilQuery;
    qTestDogNN: TOilQuery;
    qTestPartRest: TOilQuery;
    qCert: TOilQuery;
    bOkAdd: TRxSpeedButton;
    pmSave: TPopupMenu;
    N1: TMenuItem;
    pnlHead: TPanel;
    lblID: TLabel;
    edID: TEdit;
    Label3: TLabel;
    edActDate: TDateEdit;
    Label4: TLabel;
    edOper: TComboEdit;
    sbClearOper: TSpeedButton;
    qToOwner: TOilQuery;
    dsToOwner: TOraDataSource;
    gbSections: TGroupBox;
    vAutoDet: TVirtualTable;
    dsAutoDet: TOraDataSource;
    vAutoDetTemper_20: TFloatField;
    vAutoDetTemper: TFloatField;
    vAutoDetUD_Weig: TFloatField;
    vAutoDetUD_Weig_20: TFloatField;
    vAutoDetLitr: TFloatField;
    vAutoDetCount: TFloatField;
    vAutoDetReisNum: TStringField;
    vAutoDetTo_id: TIntegerField;
    vAutoDetTo_name: TStringField;
    qAutoDet: TOraQuery;
    vAutoDetCapaCity: TFloatField;
    vAutoDetNP_id: TIntegerField;
    vAutoDetNP_name: TStringField;
    vAutoDetRez_id: TIntegerField;
    vAutoDetRez_name: TStringField;
    vAutoDetPart_id: TIntegerField;
    vAutoDetPart_name: TStringField;
    vAutoDetTo_inst: TIntegerField;
    vAutoDetTo_rek_id: TIntegerField;
    vAutoDetTo_rek_inst: TIntegerField;
    vAutoDetTo_mfo: TStringField;
    vAutoDetTo_rach_chet: TStringField;
    gbTo: TGroupBox;
    edTo_Place: TEdit;
    lblTo_Place: TLabel;
    lTo_Rs: TLabel;
    edTo_Rs: TEdit;
    lblTo_MFO: TLabel;
    edTo_MFO: TEdit;
    lblToOwner: TLabel;
    gbFrom: TGroupBox;
    lFrom: TLabel;
    edFrom: TComboEdit;
    lFrom_RS: TLabel;
    edFrom_RS: TEdit;
    MFO: TLabel;
    edFrom_MFO: TEdit;
    vAutoDetPart_inst: TIntegerField;
    vAutoDetRez_inst: TIntegerField;
    vAutoDetPart_date: TDateField;
    vAutoDetPrice: TFloatField;
    vAutoDetPriceNoNDS: TFloatField;
    vAutoDetSumm: TFloatField;
    vAutoDetSummNoNDS: TFloatField;
    gbDog: TGroupBox;
    lKP_DogNumb: TLabel;
    edKP_Dog: TComboEdit;
    sbClearDog: TSpeedButton;
    lblKP_Date: TLabel;
    edKP_Date: TDateEdit;
    lblPayDate: TLabel;
    edPayDate: TDateEdit;
    lblKP_Count: TLabel;
    edKP_Count: TEdit;
    lblKP_Price: TLabel;
    edKPXPrice: TEdit;
    lblKP_Summ: TLabel;
    edKP_Summ: TEdit;
    vAutoDetNP_Grp_id: TIntegerField;
    vAutoDetCert_id: TIntegerField;
    vAutoDetCert_name: TStringField;
    vAutoDetPart_Own_Good: TStringField;
    vAutoDetRash_id: TIntegerField;
    vAutoDetRash_inst: TIntegerField;
    vAutoDetPart_Dim_id: TIntegerField;
    vAutoDetPart_IsShtuki: TBooleanField;
    vAutoDetPart_Price: TFloatField;
    vAutoDetPart_Price_KP: TFloatField;
    sbAutoTTN: TSpeedButton;
    cbRasch: TComboBox;
    lPerson: TLabel;
    lHardware: TLabel;
    lDriver: TLabel;
    LblTTN: TLabel;
    LblSumNNByDog: TLabel;
    LblNNSum: TLabel;
    LblNN_Num: TLabel;
    LblDov: TLabel;
    lAutoAdd: TLabel;
    lAuto: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label22: TLabel;
    Label21: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    edWayList: TEdit;
    edTTNDate: TDateEdit;
    edTTN: TEdit;
    edPerson: TComboEdit;
    edPack: TComboBox;
    edNNSumDog: TCurrencyEdit;
    edNNSum: TCurrencyEdit;
    edNN_Num: TEdit;
    edHardware: TComboEdit;
    edDriver: TComboEdit;
    edDovSer: TEdit;
    edDovNum: TEdit;
    edDovGive: TEdit;
    edDovDate: TDateEdit;
    edAutoAdd: TComboEdit;
    edAuto: TComboEdit;
    chUchPrice: TCheckBox;
    chSborPost: TCheckBox;
    chSborNDS: TCheckBox;
    chSborNac: TCheckBox;
    chDebet: TCheckBox;
    cbNotNN: TCheckBox;
    Bevel9: TBevel;
    Bevel8: TBevel;
    Bevel5: TBevel;
    Bevel4: TBevel;
    qRez: TOilQuery;
    qRezID: TFloatField;
    qRezNAME: TStringField;
    qRezID_ORG: TFloatField;
    qRezCAPACITY: TStringField;
    qRezDEAD: TFloatField;
    qRezNUM: TStringField;
    qRezINST: TFloatField;
    qRezNUM_NAME: TStringField;
    vAutoDetTo_addr: TStringField;
    vAutoDetAuto_Det_id: TIntegerField;
    vAutoDetAuto_Det_inst: TIntegerField;
    sbAuto: TSpeedButton;
    sbAutoAdd: TSpeedButton;
    ActionList: TActionList;
    actSave: TAction;
    actE: TAction;
    sbCol: TSpeedButton;
    PanelCol: TPanel;
    cbCol: TRxCheckListBox;
    pRefresh: TPanel;
    spbCloseTunePanel: TSpeedButton;
    spbSelectAll: TSpeedButton;
    spbClearColConfig: TSpeedButton;
    leToOwner: TRxLookupEdit;
    vAutoDetStamp: TStringField;
    qDog: TOilQuery;
    pnlSections: TPanel;
    pnlSubSections: TPanel;
    l1: TLabel;
    sbCorrectPrice: TSpeedButton;
    sbRezShow: TSpeedButton;
    edComm: TEdit;
    dbgSections: TDBGridEh;
    pDel: TPanel;
    sbDel: TSpeedButton;
    qAutoNum: TOilQuery;
    qAutoNumCAPACITY: TFloatField;
    qAutoNumID: TFloatField;
    qAutoNumINST: TFloatField;
    qAutoNumPOSITION: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edFromButtonClick(Sender: TObject);
    procedure edOperButtonClick(Sender: TObject); // Выбор операции
    procedure bbCancelClick(Sender: TObject);
    procedure edAutoButtonClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);      // Сохранение
    procedure edPackChange(Sender: TObject);
    procedure sbClearDogClick(Sender: TObject);
    procedure edKP_DogButtonClick(Sender: TObject);  // Выбор договора
    procedure FormCreate(Sender: TObject);
    procedure edTTNChange(Sender: TObject);
    procedure edActDateChange(Sender: TObject);
    procedure cbNotNNClick(Sender: TObject);
    procedure sbAutoTTNClick(Sender: TObject);
    procedure cbNotNNEnter(Sender: TObject);
    procedure cbNotNNExit(Sender: TObject);
    procedure sbCorrectPriceClick(Sender: TObject);
    procedure sbClearOperClick(Sender: TObject);
    procedure chUchPriceClick(Sender: TObject);
    procedure edDriverButtonClick(Sender: TObject);
    procedure edHardwareButtonClick(Sender: TObject);
    procedure edPersonButtonClick(Sender: TObject);
    procedure edAutoAddButtonClick(Sender: TObject);
    procedure cbCertKeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure dbgSectionsEditButtonClick(Sender: TObject);
    procedure vAutoDetBeforeInsert(DataSet: TDataSet);
    procedure vAutoDetBeforePost(DataSet: TDataSet);
    procedure dsAutoDetDataChange(Sender: TObject; Field: TField);
    procedure vAutoDetUD_WeigChange(Sender: TField);
    procedure vAutoDetPriceNoNDSChange(Sender: TField);
    procedure vAutoDetPriceChange(Sender: TField);
    procedure edOperKeyPress(Sender: TObject; var Key: Char);
    procedure dbgSectionsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure vAutoDetCert_nameChange(Sender: TField);
    procedure vAutoDetLitrChange(Sender: TField);
    procedure vAutoDetRez_nameChange(Sender: TField);
    procedure dbgSectionsExit(Sender: TObject);
    procedure vAutoDetNP_Grp_idChange(Sender: TField);
    procedure sbAutoClick(Sender: TObject);
    procedure sbAutoAddClick(Sender: TObject);
    procedure vAutoDetTemperChange(Sender: TField);
    procedure vAutoDetCountChange(Sender: TField);
    procedure actEExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure edIDChange(Sender: TObject);
    procedure sbColClick(Sender: TObject);
    procedure dbgSectionsColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure spbSelectAllClick(Sender: TObject);
    procedure spbCloseTunePanelClick(Sender: TObject);
    procedure spbClearColConfigClick(Sender: TObject);
    procedure cbColClickCheck(Sender: TObject);
    procedure edTo_PlaceExit(Sender: TObject);
    procedure edKP_DogChange(Sender: TObject);
    procedure sbRezShowClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure vAutoDetReisNumChange(Sender: TField);
  private
    IsShow: boolean; // дані в таблицю вже вставилися
    IsEditedAutoDet: boolean; // дані в таблиці вже редаговані, або збережені раніше
    iAutoDet: integer; // використовується при зміні рядка у табличці
    rAutoDetUD_WeigOLD: real; // стара густина, використовується при зміні густини
    IsColConfCleared: boolean;
    // Данные и договора
    function GetKpValue(AFieldName: string): Double;    
    function GetKpPriceNds: Double; // Цена с НДС
    function GetKpPriceXNds: Double; // Цена без НДС
    function GetKpCount: Double; // Кол-во
    function GetKpSumNds: Double; // Сумма с НДС

    procedure Write_Log(s: string);

    procedure GetAutoDet(
      p_rash_id, p_rash_inst, p_from_id, p_from_inst,
      p_auto_id, p_auto_inst, p_auto_add_id, p_auto_add_inst: integer;
      p_date: TDateTime;
      p_ttn_num: string
    ); // вставляємо зерезвуари із автомобіля
    procedure EnabledFieldAutoDet(p_FieldName: string; p_Enabled: boolean); // активність поля у табличці

    procedure ChooseTo(); // Кому
    procedure ChoosePart(); // Партия

    procedure GetLeft(); // Отображение остатков
    procedure GetCount();
    procedure GetState();
    procedure GetHardwareVisible(p_OperId: integer); // видимість апаратних засобів
    procedure GetTitlePriceNoNDS(); // вигляд поля PriceNoNDS
    function GetMesAuto(): boolean;  // повідомлення при зміні автомобіля чи причепа

    function GetKpDogId: integer;
    function GetKpDogInst: integer;
    procedure SetKpDogId(const Value: integer);
    procedure SetKpDogInst(const Value: integer);

    procedure OnSetKpDog();
    function GetRashIds: string;
    function CreateNpSumTable(Owner: TComponent): TVirtualTable;

    procedure Test();
    procedure TestAfterSave();
  public
    KP_sub_type, Must_be_oper, NP_type: Integer;
    SaleTxt: string;
    Nal_number: string[20];
    EdTTNFlag, CopyAfterSave, RealClick {для активності НН}: boolean;
    NN_A, NN_B, NN_c, NN_d: boolean;
    SaleToDeadbeat: TSaleToDeadbeat;
    
    procedure CheckNN;
    function TestPartinEditingAndAdding(
      Part_id, Part_inst: integer;
      Date_Rash: TDateTime;
      Fact_Count: real;
      Rash_id, Rash_inst: integer;
      Oper_id: integer;
      Add: boolean=false): boolean;
    function GetNextTTNNumber:string;
    
    property KpDogId: integer read GetKpDogId write SetKpDogId;
    property KpDogInst: integer read GetKpDogInst write SetKpDogInst;    
  end;

function IsOperOutAzs(AValue: integer): boolean;
  
const
  OPER_MOVEFIL = 229;

var
  RashForm: TRashForm;
  ChangeFlag: Boolean;

implementation

Uses OperTypeRef, AutoRef, PartRef, Main, OilStd, ExFunc, DogRef, chooseorg,
  EmpRef, udbfunc,MoneyFunc, TaxBillPrint, Prih, StrUtils, Base, Dog, Math;

{$R *.DFM}

function IsOperOutAzs(AValue: integer): boolean;
begin
  // Если Отпуск на АЗС,ПТО,АГЗС
  Result := (AValue = OPER_OUT_AZS) or (AValue = 44) or (AValue = 7);
end;

Procedure TRashForm.GetState();
Begin
  // Если цистерна, то ТТН меняем на ЖДН, а Дов. № на Цист.№
  if(ANSIUpperCase(edPack.Text) = ANSIUpperCase(TranslateText('Цистерна'))) and (edOper.Tag = OPER_MOVEFIL)then
  begin
    LblTTN.Caption := TranslateText('ЖДН');
    LblDov.Caption := TranslateText('Цист.№');
    sbAutoTTN.Visible:=False;
    sbAutoTTN.Down:=False;
    sbAutoTTN.OnClick(nil);
  end
  else
  begin
    LblTTN.Caption:= TranslateText('ТТН');
    LblDov.Caption:= TranslateText('Дов. №');
    sbAutoTTN.Visible:=True;
    sbAutoTTN.OnClick(nil);
  end;

  if (edTTN.Text = '') and sbAutoTTN.Visible then
  begin
    sbAutoTTN.Down := True;
    sbAutoTTN.OnClick(nil);
  end;

  // Покраска и дизейбление полей в зависимости от того
  // штучный товар или нет
  edTTN.Enabled := ANSIUpperCase(edPack.Text) <> TranslateText('ПО СКЛАДУ');
  edTTNDate.Enabled := edTTN.Enabled;
  edDovNum.Enabled  := edTTN.Enabled;
  edDovDate.Enabled := edTTN.Enabled;
  edDovSer.Enabled  := edTTN.Enabled;
  edAuto.Enabled    := edTTN.Enabled;
  edAutoAdd.Enabled := edTTN.Enabled and (edAuto.Tag <> 0);
  sbAutoAdd.Enabled := edAutoAdd.Enabled;
  edDriver.Enabled  := edTTN.Enabled;
  edWayList.Enabled := edTTN.Enabled;
  edDovGive.Enabled := edTTN.Enabled;

  if edTTN.Enabled then
    edTTNDate.Color := clWhite
  else
    edTTNDate.Color := $00EEEFEF;
  edDovNum.Color  := edTTNDate.Color;
  edDovDate.Color := edTTNDate.Color;
  edDovSer.Color  := edTTNDate.Color;
  edAuto.Color    := edTTNDate.Color;
  edAutoAdd.Color := edTTNDate.Color;
  edDriver.Color  := edTTNDate.Color;
  edWayList.Color := edTTNDate.Color;
  edDovGive.Color := edTTNDate.Color;

  EnabledFieldAutoDet('Temper',     not vAutoDetPart_IsShtuki.AsBoolean); // активність поля у табличці
  EnabledFieldAutoDet('UD_Weig',    not vAutoDetPart_IsShtuki.AsBoolean); // активність поля у табличці
  EnabledFieldAutoDet('UD_Weig_20', not vAutoDetPart_IsShtuki.AsBoolean); // активність поля у табличці
  EnabledFieldAutoDet('Litr',       not vAutoDetPart_IsShtuki.AsBoolean); // активність поля у табличці
End;
//==============================================================================
procedure TRashForm.GetLeft();
const
  f = ',0.###### "т."';
begin // Подсчет трех остатков: по партии, в резервуаре, партии в резервуаре
  lPartLeft.Caption    := FormatFloat(f,0);
  lRezLeft.Caption     := FormatFloat(f,0);
  lPartRezLeft.Caption := FormatFloat(f,0);

  if (vAutoDetRez_id.AsInteger <> 0) and (vAutoDetPart_id.AsInteger <> 0) then
    lPartRezLeft.Caption := FormatFloat(f,nvl(GetSqlValueParSimple(
      'select round(sum(s), 6) from v_oil_left' +
      ' where rez_id = :rez_id and rez_inst = :rez_inst' +
      '   and part_id = :part_id and part_inst = :part_inst',
      ['rez_id',    vAutoDetRez_id.AsInteger,
       'rez_inst',  vAutoDetRez_inst.AsInteger,
       'part_id',   vAutoDetPart_id.AsInteger,
       'part_inst', vAutoDetPart_inst.AsInteger]), '0'));

  if vAutoDetPart_id.AsInteger <> 0 then
    lPartLeft.Caption := FormatFloat(f,nvl(GetSqlValueParSimple(
      'select round(sum(s), 6) from v_oil_left' +
      ' where part_id = :part_id and part_inst = :part_inst',
      ['part_id',   vAutoDetPart_id.AsInteger,
       'part_inst', vAutoDetPart_inst.AsInteger]), '0'));

  if vAutoDetRez_id.AsInteger <> 0 then
    lRezLeft.Caption := FormatFloat(f, nvl(GetSqlValueParSimple(
      'select round(sum(s), 6) from v_oil_left' +
      ' where rez_id = :rez_id and rez_inst = :rez_inst',
      ['rez_id',   vAutoDetRez_id.AsInteger,
       'rez_inst', vAutoDetRez_inst.AsInteger]), '0'));
end;
//==============================================================================
procedure TRashForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if SP.Active then SP.Close;

  if qAutoDet.Active then qAutoDet.Close;
  if vAutoDet.Active then vAutoDet.Close;
  if qRez.Active     then qRez.Close;
  if qCert.Active    then qCert.Close;

  if qLeft.Active     then qLeft.Close;
  if AuxQuery.Active  then AuxQuery.Close;
  if qHardware.Active then qHardware.Close;
  if qTestPartRest.Active  then qTestPartRest.Close;
  if qCorrSumm.Active then qCorrSumm.Close;
  if qFrom.Active     then qFrom.Close;

  if qNN.Active       then qNN.Close;
  if qAllNNSum.Active then qAllNNSum.Close;
  if qTestDogNN.Active then qTestDogNN.Close;

  Action := caFree;

  // Сохранение колонок
  if not IsColConfCleared then
    SaveGridColumns(dbgSections, ClassName);
end;
//==============================================================================
procedure TRashForm.GetHardwareVisible(p_OperId: integer); // видимість апаратних засобів
begin
  lPerson.Visible    := Pos(','+ IntToStr(p_OperId) +',', OPER_OWN_NEEDS) <> 0;
  edPerson.Visible   := lPerson.Visible;
  lHardware.Visible  := lPerson.Visible;
  edHardware.Visible := lPerson.Visible;
end;
//==============================================================================
procedure TRashForm.FormShow(Sender: TObject);
begin
  lPartLeft.Caption    := '0';
  lRezLeft.Caption     := '0';
  lPartRezLeft.Caption := '0';

  If SP.Tag = 0 Then SP.Tag := INST;
  GetHardwareVisible(edOper.Tag); // видимість апаратних засобів

  GetState();

  edPackChange(Nil);

  If edID.Text = '' Then
  Begin
    Try
      qFrom.Close;
      qFrom.ParamByName('a').AsInteger := SP.Tag;
      qFrom.Open;
      if qFrom.RecordCount = 0 then
        raise Exception.Create(TranslateText('Нет такой организации!'));
      edFrom.Text := qFromName.AsString;
      edFrom.Tag  := SP.Tag;
      lFrom.Tag   := SP.Tag;
      If qFromR_Id.AsString = '' Then
      Begin
        edFrom_RS.Tag   := 0;
        lFrom_RS.Tag    := 0;
        edFrom_RS.Text  := '';
        edFrom_MFO.Text := '';
      End
      Else
      Begin
        edFrom_RS.Tag   := qFromR_Id.AsInteger;
        lFrom_RS.Tag    := qFromR_Inst.AsInteger;
        edFrom_RS.Text  := qFromRACH_CHET.AsString;
        edFrom_MFO.Text := qFromMFO.AsString;
      End;
    Except On E:Exception Do
      Begin
        MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
        Close;
        Exit;
      End;
    End;
    SaleTxt:=TranslateText('Расчеты по комиссионому товару');
    edActDate.Date := Date;
    edTTNDate.Date := Date;
    edOper.Clear;
    edTTN.Clear;
    edAuto.Clear;
    edAutoAdd.Clear;
    edWayList.Clear;
    edTo_Place.Clear;
    edDovNum.Clear;
    edDovDate.Clear;
    edDovSer.Clear;
    edDovGive.Clear;
    chSborPost.Checked := False;
    chSborNac.Checked  := False;
    chUchPrice.Checked := False;
    chSborNDS.Checked  := False;
    chDebet.Checked    := False;
    edPack.ItemIndex   := -1;
    edComm.Clear;
    sbClearDogClick(Nil);
  End;
  edTTNFlag := false;

  LoadGrigColumns(dbgSections, ClassName);
  sbColClick(nil);

  // Кому принадлежит
  if qToOwner.Active then qToOwner.Close;
  qToOwner.Open;
  leToOwner.LookupValue := qToOwner.FieldByName('id').AsString;

  iAutoDet := 0;
  GetAutoDet(edId.Tag, SP.Tag, edFrom.Tag, lFrom.Tag,
    edAuto.Tag, lAuto.Tag, edAutoAdd.Tag, lAutoAdd.Tag, edActDate.Date, edTTN.Text); // вставляємо зерезвуари із автомобіля

  GetTitlePriceNoNDS(); // вигляд поля PriceNoNDS

  if qCert.Active then qCert.Close;
  _OpenQueryPar(qCert,
    ['PartId',   vAutoDetPart_id.AsInteger,
     'PartInst', vAutoDetPart_inst.AsInteger,
     'RezId',    vAutoDetRez_id.AsInteger,
     'RezInst',  vAutoDetRez_inst.AsInteger]);
  edAuto.SetFocus;

  dbgSections.FieldColumns['To_name'].ButtonStyle := cbsEllipsis;
end;

procedure TRashForm.edFromButtonClick(Sender: TObject);
var
  vId,vInst: integer;
  vName: string;
  q: TOilQuery;
begin
  if ChooseOrg.CaptureOrgExt(1,Main_id,Inst,'yyx',vId,vInst,vName,q) then
  begin
    edFrom.Text:=vName;
    edFrom.Tag:=vId;
    lFrom.tag:=vInst;
    if q.FieldByName('Rek_Id').AsString = '' then
    begin
      edFrom_RS.Tag   := 0;
      lFrom_RS.Tag    := 0;
      edFrom_RS.Text  := '';
      edFrom_MFO.Text := '';
    end
    else
    begin
      edFrom_RS.Tag   := q.FieldByName('Rek_Id').AsInteger;
      lFrom_RS.Tag    := q.FieldByName('Rek_Inst').AsInteger;
      edFrom_RS.Text  := q.FieldByName('RACH_CHET').AsString;
      edFrom_MFO.Text := q.FieldByName('MFO').AsString;
    end;
    q.Free;
  end;
end;

procedure TRashForm.edOperButtonClick(Sender: TObject);
  //****************************************************************************
  function GetTO_Orgtype: integer;
  begin
    // -1 - орг еще не выбиралась
    // 0 - ППОН или ОБЛ
    // 1 - АЗС
    // 2 - Прочие
    Result := 2;
    if vAutoDetTo_id.AsInteger = vAutoDetTo_inst.AsInteger then
      if vAutoDetTo_id.AsInteger = 0 then
        Result := -1
      else if vAutoDetTo_inst.AsInteger < 1000000 then
        Result := 0
      else
        Result := 1;
  end;
  //****************************************************************************
var
  F: TOperTypeRefForm;
begin
  Application.CreateForm(TOperTypeRefForm, F);
  try
    F.SGrpId := OPG_RASHOD;
    if Must_be_oper <> 0 then
      F.Opers_id := IntToStr(Must_be_oper);
    F.bbClear.Enabled:=false;
    F.ShowModal;
    If F.ModalResult = mrOk Then
    begin
      edOper.Tag := F.qId.AsInteger;
      edOper.Text := F.qName.AsString;
      if (vAutoDetPart_Own_Good.AsString = 'S') and (edOper.Tag in [7,10,11,12,44]) then
      // забороняємо реалізацію та відпуск на АЗС/АГЗС/ПТО для партій зберігання
      begin
        Application.MessageBox(PChar(TranslateText('Внимание !') + #13#10 +
                       TranslateText('При расходной операции выбрана партия хранения !')),
                       PChar(TranslateText('Внимание !')), MB_OK + MB_ICONWARNING);
        edOper.Tag := 0;
        edOper.Text := '';
      end
      else
        begin
          if edOper.Tag in [55,100] then
          begin
             MessageDlg(TranslateText('Данная операция в отпуске НП недопустима !'),mtWarning,[mbOK],0);
             Exit;
          end;
          // Выбор тех. средства для операции "На собств. отопление"
          GetHardwareVisible(edOper.Tag); // видимість апаратних засобів

          vAutoDet.First;
          while not vAutoDet.Eof do
          begin
            case GetTO_OrgType of
              0: if IsOperOutAzs(edOper.Tag) then
                 begin // Выбран ОБЛ или ППОН и пытаются выбрать отпуск на АЗС, ПТО или АГЗС
                   MessageDlg(TranslateText('Такую операцию можно проводить только на АЗС !'),mtWarning,[mbOK],0);
                   Exit;
                 end;
              1: if (not IsOperOutAzs(edOper.Tag)) and (edOper.Tag <> 13) then
                 begin // Выбрана АЗС и пытаются выбрать не отпуск на АЗС или ПТО
                   MessageDlg(TranslateText('На АЗС такая операция недопустима !'),mtWarning,[mbOK],0);
                   Exit;
                 end;
              2: if IsOperOutAzs(edOper.Tag) or (edOper.Tag = OPER_MOVENB) or (edOper.Tag = OPER_MOVEFIL) then
                 begin // Выбрана орг из прочих и пытаются выбрать отпуск на АЗС,ПТО или перемещение
                   MessageDlg(TranslateText('При выбранной организации такая операция недопустима !'),mtWarning,[mbOK],0);
                   Exit;
                 end;
            end;
            vAutoDet.Next;
          end;

          NN_b := (Pos(','+IntToStr(edOper.Tag)+',', OPER_NOT_NN) <> 0);
          RealClick := true; // для активності НН
          CheckNN;
          if RealClick then // для активності НН
          begin
            if IsOperOutAzs(edOper.Tag) or (edOper.Tag = 13) then
            begin
                chUchPrice.Checked := true;
              chUchPriceClick(nil);
              qToOwner.Open;
            end
            else
              qToOwner.Close;
            chDebet.Checked := (Pos(','+IntToStr(edOper.Tag)+',', OPER_NOT_NN) <> 0);
            if edOper.Tag = 11 then
              cbRasch.ItemIndex := 0;
            if edOper.Tag = 12 then
              cbRasch.ItemIndex := 1;
          end;
        end;
    end; //ModalResult = mrOk
  finally
    F.Free;
  end;

  NN_b := (Pos(','+IntToStr(edOper.Tag)+',', OPER_NOT_NN) <> 0);
  CheckNN;
  GetState;
  RealClick := False; // для активності НН
end;
//==============================================================================
procedure TRashForm.bbCancelClick(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;
//==============================================================================
procedure TRashForm.GetAutoDet(
  p_rash_id, p_rash_inst, p_from_id, p_from_inst,
  p_auto_id, p_auto_inst, p_auto_add_id, p_auto_add_inst: integer;
  p_date: TDateTime;
  p_ttn_num: string
); // вставляємо зерезвуари із автомобіля
begin
  vAutoDet.DisableControls;
  IsShow := false;
  IsEditedAutoDet := false;
  try
    if not vAutoDet.IsEmpty then
    begin // видаляємо старі дані
      vAutoDet.First;
      while not vAutoDet.Eof do
      begin
        if vAutoDetRash_id.AsInteger <> 0 then
          SetState('OIL_RASHOD', vAutoDetRash_id.AsInteger, vAutoDetRash_inst.AsInteger, 'N');
        vAutoDet.Next;
      end;
    end;

    vAutoDet.Close;
    vAutoDet.Clear;
    vAutoDet.Open;

    qAutoDet.Close;
    _OpenQueryPar(qAutoDet,
      ['rash_id',       p_rash_id,
       'rash_inst',     p_rash_inst,
       'auto_id',       p_auto_id,
       'auto_inst',     p_auto_inst,
       'auto_add_id',   p_auto_add_id,
       'auto_add_inst', p_auto_add_inst,
       'date_',         p_date,
       'from_id',       p_from_id,
       'from_inst',     p_from_inst,
       'ttn_num',       p_ttn_num
      ]);

    if not qAutoDet.IsEmpty then
      edID.Text := '';

    qAutoDet.First;
    while not qAutoDet.Eof do
    begin
      vAutoDet.Append;

      if qAutoDet.FieldByName('Rash_id').AsInteger <> 0 then
      begin
        IsEditedAutoDet := true; // запись про те, що дані в табличці є, або тільки вставилися
        if edID.Text = '' then
          edID.Text :=                 qAutoDet.FieldByName('Rash_id').AsString
        else
          edID.Text := edID.Text +','+ qAutoDet.FieldByName('Rash_id').AsString;
      end;

      vAutoDetRash_id.AsInteger   := qAutoDet.FieldByName('Rash_id').AsInteger;
      vAutoDetRash_inst.AsInteger := qAutoDet.FieldByName('Rash_inst').AsInteger;

      vAutoDetAuto_Det_id.AsInteger   := qAutoDet.FieldByName('Auto_Det_id').AsInteger;
      vAutoDetAuto_Det_inst.AsInteger := qAutoDet.FieldByName('Auto_Det_inst').AsInteger;
      vAutoDetReisNum.AsString        := qAutoDet.FieldByName('ReisNum').AsString;
      vAutoDetCapaCity.AsFloat        := qAutoDet.FieldByName('CapaCity').AsFloat;

      vAutoDetTo_id.AsInteger       := qAutoDet.FieldByName('To_id').AsInteger;
      vAutoDetTo_inst.AsInteger     := qAutoDet.FieldByName('To_inst').AsInteger;
      vAutoDetTo_name.AsString      := qAutoDet.FieldByName('To_name').AsString;
      vAutoDetTo_addr.AsString      := qAutoDet.FieldByName('To_place').AsString;
      vAutoDetTo_mfo.AsString       := qAutoDet.FieldByName('To_mfo').AsString;
      vAutoDetTo_rach_chet.AsString := qAutoDet.FieldByName('To_rach_chet').AsString;
      vAutoDetTo_rek_id.AsInteger   := qAutoDet.FieldByName('To_rek_id').AsInteger;
      vAutoDetTo_rek_inst.AsInteger := qAutoDet.FieldByName('To_rek_inst').AsInteger;

      vAutoDetRez_id.AsInteger   := qAutoDet.FieldByName('Rez_id').AsInteger;
      vAutoDetRez_inst.AsInteger := qAutoDet.FieldByName('Rez_inst').AsInteger;
      vAutoDetRez_name.AsString  := qAutoDet.FieldByName('Rez_name').AsString;

      vAutoDetPart_id.AsInteger       := qAutoDet.FieldByName('Part_id').AsInteger;
      vAutoDetPart_inst.AsInteger     := qAutoDet.FieldByName('Part_inst').AsInteger;
      vAutoDetPart_name.AsString      := qAutoDet.FieldByName('Part_name').AsString;
      vAutoDetPart_date.AsDateTime    := qAutoDet.FieldByName('Part_date').AsDateTime;
      vAutoDetPart_Price.AsFloat      := qAutoDet.FieldByName('Part_Price').AsFloat;
      vAutoDetPart_Price_KP.AsFloat   := qAutoDet.FieldByName('Part_Price_KP').AsFloat;
      vAutoDetPart_Dim_id.AsInteger   := qAutoDet.FieldByName('Part_Dim_id').AsInteger;
      vAutoDetPart_Own_Good.AsString  := qAutoDet.FieldByName('Part_Own_Good').AsString;
      vAutoDetPart_IsShtuki.AsBoolean := qAutoDet.FieldByName('Part_IsShtuki').AsString = 'Y';

      vAutoDetNP_id.AsInteger     := qAutoDet.FieldByName('NP_id').AsInteger;
      vAutoDetNP_Grp_id.AsInteger := qAutoDet.FieldByName('NP_Grp_id').AsInteger;
      vAutoDetNP_name.AsString    := qAutoDet.FieldByName('NP_name').AsString;

      vAutoDetCert_id.AsInteger  := qAutoDet.FieldByName('Cert_id').AsInteger;
      vAutoDetCert_name.AsString := qAutoDet.FieldByName('Cert_name').AsString;

      vAutoDetLitr.AsFloat       := qAutoDet.FieldByName('Litr').AsFloat;
      vAutoDetCount.AsFloat      := qAutoDet.FieldByName('Count').AsFloat;
      // По учетной цене
      if chUchPrice.Checked then
        chUchPrice.Checked := (qAutoDet.FieldByName('Price').AsFloat = qAutoDet.FieldByName('Part_Price').AsFloat);

      if chUchPrice.Checked then
        vAutoDetPriceNoNDS.AsFloat := qAutoDet.FieldByName('Part_Price').AsFloat
      else
        vAutoDetPriceNoNDS.AsFloat := qAutoDet.FieldByName('Price').AsFloat;
                
      if edKP_Dog.Text <> '' then
        vAutoDetPrice.AsFloat := GetKPPriceNds()
      else
        vAutoDetPrice.AsFloat := MRound(GetWithNDS_NoNDS(qAutoDet.FieldByName('Price').AsFloat, edActDate.Date), 2);

      vAutoDetUD_Weig.AsFloat    := qAutoDet.FieldByName('UD_Weig').AsFloat;
      vAutoDetTemper.AsFloat     := qAutoDet.FieldByName('Temper').AsFloat;
      vAutoDetUD_Weig_20.AsFloat := qAutoDet.FieldByName('UD_Weig_20').AsFloat;
      vAutoDetTemper_20.AsFloat  := qAutoDet.FieldByName('Temper_20').AsFloat;
      vAutoDetSumm.AsFloat := qAutoDet.FieldByName('sum_nds').AsFloat;
      vAutoDetSummNoNDS.AsFloat :=qAutoDet.FieldByName('sum_x_nds').AsFloat;

      vAutoDetStamp.AsString := qAutoDet.FieldByName('Stamp').AsString;

      vAutoDet.Post;
      qAutoDet.Next;
    end;

    // вставляємо секції
    if edAuto.Tag <> 0 then
    begin
      _OpenQueryPar(qAutoNum, ['p_auto_id', edAuto.Tag, 'p_auto_inst', lAuto.Tag]);
      dbgSections.FieldColumns['ReisNum'].PickList.Clear;
      qAutoNum.First;
      while not qAutoNum.Eof do
      begin
        dbgSections.FieldColumns['ReisNum'].PickList.Add(qAutoNumPOSITION.AsString);
        qAutoNum.Next;
      end;
    end;
  finally
    qAutoDet.Filtered := false;
    vAutoDet.First;
    leToOwner.LookupValue :=
      nvl(GetQValueByIdInst('par_id', 'v_oil_org', vAutoDetTo_id.AsInteger, vAutoDetTo_inst.AsInteger), 0);
    IsShow := true;
    vAutoDet.EnableControls;
  end;
end;
//==============================================================================
procedure TRashForm.EnabledFieldAutoDet(p_FieldName: string; p_Enabled: boolean); // активність поля у табличці
begin
  if dbgSections.FieldColumns[p_FieldName].ButtonStyle in [cbsEllipsis, cbsNone] then
    if p_Enabled then
      dbgSections.FieldColumns[p_FieldName].ButtonStyle := cbsEllipsis
    else
      dbgSections.FieldColumns[p_FieldName].ButtonStyle := cbsNone;

  if dbgSections.FieldColumns[p_FieldName].ButtonStyle = cbsAuto then
    dbgSections.FieldColumns[p_FieldName].ReadOnly := not p_Enabled;

  if p_Enabled then
    dbgSections.FieldColumns[p_FieldName].Color := clWhite
  else
    dbgSections.FieldColumns[p_FieldName].Color := $00EEEFEF;
end;
//==============================================================================
function TRashForm.GetMesAuto(): boolean; // повідомлення при зміні автомобіля чи причепа
begin
  result := true;
  if IsEditedAutoDet then
    result := MessageDlg(
       TranslateText('  Смена автомобиля или прицепа приведет к обновлению таблицы "Секции (резервуары)"') +#10#13+
       TranslateText('и удалению старых записей по данной ТТН."') +#10#13+
       TranslateText('  Продолжить?'), mtConfirmation, [mbNo, mbYes], 0) = mrYes;
end;
//==============================================================================
procedure TRashForm.edAutoButtonClick(Sender: TObject);
Var
  F: TAutoRefForm;
begin
  Application.CreateForm(TAutoRefForm, F);
  try
    F.ShowModal;
    if F.ModalResult = mrOk Then
    begin
      if F.q.FieldByName('is_have_det').AsInteger = 1 then
        if not GetMesAuto() then
          exit; // повідомлення при зміні автомобіля чи причепа
      edAuto.Text := F.qAUTO_MODEL.AsString +' '+ F.qNumb.AsString;
      edAuto.Tag  := F.qId.AsInteger;
      lAuto.Tag   := F.qInst.AsInteger;

      if not F.qEmploy_id.IsNull and not F.qEmploy_inst.IsNull then
      begin
        edDriver.Text := F.qFullname.AsString;
        edDriver.Tag  := F.qEmploy_id.AsInteger;
        lDriver.Tag   := F.qEmploy_inst.AsInteger;
      end;
      if F.q.FieldByName('is_have_det').AsInteger = 1 then
        GetAutoDet(edId.Tag, SP.Tag, edFrom.Tag, lFrom.Tag,
          edAuto.Tag, lAuto.Tag, edAutoAdd.Tag, lAutoAdd.Tag, edActDate.Date, edTTN.Text); // вставляємо зерезвуари із автомобіля

      {dbgSections.FieldColumns['Capacity'].Visible := dbgSections.FieldColumns['Capacity'].Visible and (F.q.FieldByName('is_have_det').AsInteger = 1);
      if F.q.FieldByName('is_have_det').AsInteger = 1 then
      begin
        dbgSections.FieldColumns['ReisNum'].Color := $00EEEFEF;
        dbgSections.FieldColumns['ReisNum'].ReadOnly := True;
      end
      else
      begin
        dbgSections.FieldColumns['ReisNum'].Color := clWindow;
        dbgSections.FieldColumns['ReisNum'].ReadOnly := False;
      end;}
    end;
  finally
    F.Free;
    GetState();
  end;
end;
//==============================================================================
procedure TRashForm.sbAutoClick(Sender: TObject);
begin
  if edAuto.Tag = 0 then exit; // щоб не запускалася марно процедура GetAutoDet

  if not GetMesAuto() then exit; // повідомлення при зміні автомобіля чи причепа

  edAuto.Text := '';
  edAuto.Tag  := 0;
  lAuto.Tag   := 0;

  edDriver.Text := '';
  edDriver.Tag  := 0;
  lDriver.Tag   := 0;

  GetAutoDet(edId.Tag, SP.Tag, edFrom.Tag, lFrom.Tag,
    edAuto.Tag, lAuto.Tag, edAutoAdd.Tag, lAutoAdd.Tag, edActDate.Date, edTTN.Text); // вставляємо зерезвуари із автомобіля
end;
//==============================================================================
procedure TRashForm.edAutoAddButtonClick(Sender: TObject);
var
  AutoRefForm: TAutoRefForm;
begin
  if not GetMesAuto() then exit; // повідомлення при зміні автомобіля чи причепа
  try
    Application.CreateForm(TAutoRefForm, AutoRefForm);
    AutoRefForm.TypeID := 16;
    AutoRefForm.leType.Enabled := true;

    AutoRefForm.ShowModal;
    if AutoRefForm.ModalResult = mrOk then
    begin
      if AutoRefForm.qAUTO_TYPE_ID.AsInteger <> 16 then
      begin
        MessageDlg(TranslateText('Выбран не прицеп!'), mtError, [mbOk], 0);
        exit;
      end;

      edAutoAdd.Text := AutoRefForm.qAUTO_MODEL.AsString +' '+ AutoRefForm.qNumb.AsString;
      edAutoAdd.Tag  := AutoRefForm.qId.AsInteger;
      lAutoAdd.Tag   := AutoRefForm.qInst.AsInteger;

      GetAutoDet(edId.Tag, SP.Tag, edFrom.Tag, lFrom.Tag,
        edAuto.Tag, lAuto.Tag, edAutoAdd.Tag, lAutoAdd.Tag, edActDate.Date, edTTN.Text); // вставляємо зерезвуари із автомобіля
    end;
  finally
    AutoRefForm.Free;
  end;
end;
//==============================================================================
procedure TRashForm.sbAutoAddClick(Sender: TObject);
begin
  if edAutoAdd.Tag = 0 then exit; // щоб не запускалася марно процедура GetAutoDet

  if not GetMesAuto() then exit; // повідомлення при зміні автомобіля чи причепа

  edAutoAdd.Text := '';
  edAutoAdd.Tag  := 0;
  lAutoAdd.Tag   := 0;

  GetAutoDet(edId.Tag, SP.Tag, edFrom.Tag, lFrom.Tag,
    edAuto.Tag, lAuto.Tag, edAutoAdd.Tag, lAutoAdd.Tag, edActDate.Date, edTTN.Text); // вставляємо зерезвуари із автомобіля
end;
//==============================================================================
procedure TRashForm.ChooseTo();
var
  vId, vInst, vMainId, vMainInst, MyOrgType: integer;
  vName, Flags: string;
  q: TOilQuery;
begin
  MyOrgType := 3;
  Flags := 'yyy';
  // Если Отпуск на АЗС,ПТО,АГЗС
  if IsOperOutAzs(edOper.Tag) or (edOper.Tag = 13) then
  // давать выбрать только свою АЗС или АЗС контрагента
  begin
    MyOrgType := 2;
    if edOper.Tag <> 13 then
      Flags := 'yyn';
    vMainId := qToOwner.FieldByName('id').AsInteger;
    vMainInst := qToOwner.FieldByName('inst').AsInteger;
  end
  else
  begin
    vMainId := MAIN_ID;
    vMainInst := INST;
  end;

  if ChooseOrg.CaptureOrgExt(MyOrgType,vMainId,vMainInst,Flags,vId,vInst,vName,q) then
  begin
    try
      {если отпуск на АЗС то заполнить операцию}
      if (q.FieldByName('org_id').AsInteger = 8) and (edOper.Text = '') then
      begin
        edOper.Tag := OPER_OUT_AZS;
        edOper.Text := GetOperationName(edOper.Tag);
        chDebet.Checked := (Pos(','+IntToStr(edOper.Tag)+',', OPER_NOT_NN) <> 0);
        if edOper.Tag = 11 then
          cbRasch.ItemIndex := 0;
        if edOper.Tag = 12 then
          cbRasch.ItemIndex := 1;
        NN_b := (Pos(','+IntToStr(edOper.Tag)+',', OPER_NOT_NN) <> 0);
        CheckNN;
      end;
      
      if ((edOper.Tag = OPER_MOVENB) or (edOper.Tag = OPER_MOVEFIL)) and
         ((vId <> vInst) or (vId = vInst) and (vInst >= 1000000)) then
      begin //Если при перемещении выбрали не ОБЛ или ППОН - заматериться
        MessageDlg(TranslateText('Перемещение можно проводить только на ОБЛ или ППОН !'),mtWarning,[mbOK],0);
        Exit;
      end;

      if (edOper.Tag <> OPER_MOVENB) and (edOper.Tag <> OPER_MOVEFIL) and (not IsOperOutAzs(edOper.Tag))
        and (edOper.Tag <> 0) and (edOper.Tag <> 13) and ((vId = vInst) and (vInst > 1000000)) then
      begin //Если при обычном отпуске выбрали АЗС - заматериться
        MessageDlg(TranslateText('Такой отпуск нельзя проводить на АЗС !'),mtWarning,[mbOK],0);
        Exit;
      end;

      {
      if IsOperOutAzs(edOper.Tag) and
         (FindRealInst(q.FieldByName('Par').AsInteger) <> INST) and
         (q.FieldByName('Par').AsInteger<>MAIN_PAR) and
         not IsPossibleAzs(q.FieldByName('id').AsInteger, q.FieldByName('inst').AsInteger) then
      begin //Если при отпуске на АЗС выбрана не своя или обловская АЗС - да, тоже заматериться
        MessageDlg(TranslateText('Отпуск можно проводить только на свою АЗС или подчиненную ОБЛ-у !'),mtWarning,[mbOK],0);
        Exit;
      end;
      }

      // Если выбранная орг - злостный дебетор - предупредить
      if not InitNewOrg(vId, vInst, vName, vAutoDetRash_id.AsInteger, SP.Tag,
        'OIL_RASHOD', SaleToDeadbeat) then
        Exit;

      vAutoDet.DisableControls;
      try
        if not (vAutoDet.State in [dsEdit, dsInsert]) then
          vAutoDet.Edit;
        vAutoDetTo_id.AsInteger   := vId;
        vAutoDetTo_inst.AsInteger := vInst;
        vAutoDetTo_name.AsString  := vName;
        vAutoDetTo_addr.AsString  := q.FieldByName('Addr').AsString;
        If q.FieldByName('Rek_Id').AsString = '' Then
        begin
          vAutoDetTo_rek_id.AsInteger   := 0;
          vAutoDetTo_rek_inst.AsInteger := 0;
          vAutoDetTo_mfo.AsString       := '';
          vAutoDetTo_rach_chet.AsString := '';
        end
        else
        begin
          vAutoDetTo_rek_id.AsInteger   := q.FieldByName('Rek_Id').AsInteger;
          vAutoDetTo_rek_inst.AsInteger := q.FieldByName('Rek_Inst').AsInteger;
          vAutoDetTo_mfo.AsString       := q.FieldByName('MFO').AsString;
          vAutoDetTo_rach_chet.AsString := q.FieldByName('RACH_CHET').AsString;
        end;
      finally
        vAutoDet.EnableControls;
      end;

      if q.FieldByName('nal_num').isnull then
        Nal_number:= '-1'
      else
        Nal_number:= q.FieldByName('nal_num').asString;
    finally
      q.Free;
    end;
  end;
end;

procedure TRashForm.ChoosePart();
Var
  F: TPartRefForm;
  qD: TOilQuery;
begin
  Application.CreateForm(TPartRefForm, F);
  qD := TOilQuery.Create(nil);
  try
    if vAutoDetNP_id.AsInteger > 0 then
    begin
      F.edNP_Type.Text := vAutoDetNP_name.AsString;
      F.edNP_Type.Tag  := vAutoDetNP_id.AsInteger;
      if KpDogId > 0 then
      Begin
        F.edNP_Type.Enabled := False;
        F.sbClearNpType.Enabled := False;
      End;
    end;

    F.cbOils.Checked := True;
    F.ShowModal;
    If F.ModalResult = mrOk Then
    Begin
      if F.qISSHTUKI.AsString = 'Y' then
        edPack.ItemIndex := 4;
      if (KpDogId = 0) or (vAutoDetNP_id.AsInteger = 0) or (F.qNP_Type.AsInteger = vAutoDetNP_id.AsInteger) then
      Begin
        if not (vAutoDet.State in [dsEdit, dsInsert]) then
          vAutoDet.Edit;

        if (F.qOwn_Goods.AsString = 'S') and (IsOperOutAzs(edOper.Tag) or (edOper.Tag in [11,12])) then  //забороняємо реалізацію для партій зберігання
        begin
          Application.MessageBox(PChar(TranslateText('Внимание !') + #13#10 +
                                 TranslateText('При расходной операции выбрана партия хранения !')),
                                 PChar(TranslateText('Внимание !')), MB_OK + MB_ICONWARNING);
          vAutoDet.DisableControls;
          try
            vAutoDetPart_id.Clear;
            vAutoDetPart_inst.Clear;
            vAutoDetPart_name.Clear;
            vAutoDetPart_date.Clear;
            vAutoDetPart_Price.Clear;
            vAutoDetPart_Price_KP.Clear;
            vAutoDetPart_Dim_id.Clear;
            vAutoDetPart_Own_Good.Clear;
            vAutoDetPart_IsShtuki.Clear;
          finally
            vAutoDet.EnableControls;
          end;
        end
        else
        begin
          if (edKP_Dog.Text <> '') then
          begin // Если уже выбран договор, проверить, есть ли НП партии в договоре
            qDog.Locate('np_type', F.qNP_Type.AsString, []);
            if qDog.FieldByName('np_type').AsInteger <> F.qNP_Type.AsInteger then
            begin
              raise Exception.Create(TranslateText('Нефтепродукт партии ')+ vAutoDetPart_name.AsString +
                TranslateText(' не присутствует в договоре ') + edKP_Dog.Text + ' !');
            end;
          end;
          vAutoDet.DisableControls;
          try
            vAutoDetPart_id.AsInteger       := F.qId.AsInteger;
            vAutoDetPart_inst.AsInteger     := F.qInst.AsInteger;
            vAutoDetPart_name.AsString      := F.qDog.AsString;
            vAutoDetPart_date.AsDateTime    := F.qDog_Date.AsDateTime;
            vAutoDetPart_Price.AsFloat      := F.qSS.AsFloat;
            vAutoDetPart_Price_KP.AsFloat   := F.qPrice_KP.AsFloat;
            vAutoDetPart_Dim_id.AsInteger   := F.qDim_id.AsInteger;
            vAutoDetPart_Own_Good.AsString  := F.qOwn_Goods.AsString;
            vAutoDetPart_IsShtuki.AsBoolean := F.qIsShtuki.AsString = 'Y';

            vAutoDetNP_id.AsInteger         := F.qNP_Type.AsInteger;
            vAutoDetNP_Grp_id.AsInteger     := F.qNP_GRP.AsInteger;
            vAutoDetNP_name.AsString        := F.qNP_Type_Name.AsString;

            vAutoDetRez_id.Clear;
            vAutoDetRez_inst.Clear;
            vAutoDetRez_name.Clear;

            vAutoDetCert_id.Clear;
            vAutoDetCert_name.Clear;

            if (edKP_Dog.Text = '')or((KP_SUB_TYPE = 12)and(edKP_Dog.Text <> '')) then
            begin
              // Договор не выбран
              // Если операция "Перемещение" или стоИт птичка "По уч. цене"
              // берем цену учетную, иначе - цену для конечного потребителя
              if (chUchPrice.Checked) or (edOper.Tag = OPER_MOVENB) or (edOper.Tag = OPER_MOVEFIL) then
                vAutoDetPriceNoNDS.AsFloat := F.qSS.AsFloat
              else
                vAutoDetPriceNoNDS.AsFloat := F.qPrice_KP.AsFloat;
            end
            else
            begin // Договор выбран. Берем цену из договора
              edKPXPrice.Text := FloatToStr(GetKpPriceXNds());
              edKP_Count.Text := FloatToStr(GetKpCount());
              edKP_Summ.Text  := FormatFloat(',0.00####', GetKpSumNds());
              vAutoDetPriceNoNDS.AsFloat := GetKpPriceXNds();
            end;

            // Резервуар
            FillRezList(dbgSections.FieldColumns['Rez_name'].PickList, edFrom.Tag,
              decode([sbRezShow.Down, true, vAutoDetPart_id.AsInteger, 0]),
              decode([sbRezShow.Down, true, vAutoDetPart_inst.AsInteger, 0]));

            if dbgSections.FieldColumns['Rez_name'].PickList.Count = 2 then // підставляємо резервуар
              vAutoDetRez_name.AsString := dbgSections.FieldColumns['Rez_name'].PickList.Strings[1];
            vAutoDetCert_name.AsString := F.qSERT.AsString;
          finally
            vAutoDet.EnableControls;
          end;
        end;
      end;
    End; // ModalResult = mrOk
  finally
    F.Free;
    qD.Close;
    qD.Free;
    GetState();
  end;
end;

procedure TRashForm.bbOkClick(Sender: TObject);
Var
  Res, NewDogName: String;
  NUM: String;
  NN_ID, NN_Inst: Integer;
  Dim_NN: integer;
  CrtNewDog: boolean;
  qDogDet, qDog : TOilQuery;
  SumNN: Currency;
  vt: TVirtualTable;
  //****************************************************************************
  function SaveTaxBill: Currency;
  var
    TaxBill: TdmTaxBill;
    vt: TVirtualTable;
  begin
    Result := 0;
    qNN.Close;
    qNN.ParamByName('rash_id').AsInteger := vAutoDetRash_id.AsInteger;
    qNN.ParamByName('rash_inst').AsInteger := INST;
    qNN.Open;
    if (qNN.IsEmpty)Or(qNNNN_Id.AsInteger = 0 ) Then
    begin
      NUM     := '0';
      NN_Id   := GetSeqNextVal('S_OIL_SALE_BOOK');
      NN_Inst := INST;
    end
    else
    begin
      NUM := qNNNUM.AsString;
      NN_Id := qNNNN_Id.AsInteger;
      NN_Inst := qNNNN_Inst.AsInteger;
    end;

    TaxBill := TdmTaxBill.Create(vAutoDetTo_id.AsInteger, vAutoDetTo_inst.AsInteger);
    try
      // задаем параметры НН
      TaxBill.Options.Date := DateToStr(edActDate.Date);
      TaxBill.Options.FromId := MAIN_ID;
      TaxBill.Options.FromInst := MAIN_ID;
      // TaxBill.Options.TaxBillType := 0;
      TaxBill.Options.OIL_NN_Type := 2;
      TaxBill.Options.OIL_NN_Cause := 3;
      TaxBill.Options.Scheme := NB;
      TaxBill.Options.OperName := cbRasch.Text;
      if edNN_Num.Visible then
        TaxBill.Options.Num := edNN_Num.Text
      else
        TaxBill.Options.Num := '0';  //!!номер ставиться ниже
      TaxBill.Options.TaxBillId := nn_id;
      TaxBill.Options.TaxBillInst := nn_inst;
      if edKP_Dog.Text <> '' then
        TaxBill.Options.ByDogName := TranslateText('Согласно договора № ')+edKP_Dog.Text+TranslateText(' от ')+FormatDateTime2('dd.mm.yyyy',edKP_Date.Date)
      else
        TaxBill.Options.ByDogName := TranslateText('Согласно договора № ')+vAutoDetRash_id.AsString +TranslateText(' от ')+FormatDateTime2('dd.mm.yyyy',edActDate.Date);
      if edOper.Tag = OPER_OUT_AZS then
        TaxBill.Options.TaxBillType := 3
      else
        TaxBill.Options.TaxBillType := 1;

      vt := CreateNpSumTable(Self);
      try
        vt.Open;
        vt.First;
        while not vt.Eof do
        begin
          // Делаем проверку
          qTestDogNN.Close;
          qTestDogNN.ParamByName('DOG_ID').AsInteger   := KpDogId;
          qTestDogNN.ParamByName('DOG_INST').AsInteger := KpDogInst;
          qTestDogNN.ParamByName('NP_ID').AsInteger    := vt.FieldByName('NP_ID').AsInteger;
          qTestDogNN.ParamByName('RAS_INST').AsInteger := vAutoDetRash_inst.AsInteger;
          qTestDogNN.ParamByName('RASH_SUM').AsFloat   := vt.FieldByName('SUM').AsFloat;
          qTestDogNN.ParamByName('DATE_').AsDateTime   := edActDate.Date;
          qTestDogNN.MacroByName('RAS_IDS').Value      := GetRashIds();
          qTestDogNN.Open;

          // одиниця вимірювання
          Dim_NN := DIM_TONN;
          if vAutoDetPart_Dim_id.AsInteger <> 0 then
          begin
            if vAutoDetPart_IsShtuki.AsBoolean then
              Dim_NN := vAutoDetPart_Dim_id.AsInteger
            else
              Dim_NN := IfThen(edOper.Tag = OPER_OUT_AZS,  DIM_LITR, DIM_TONN);
          end;

          if qTestDogNN['will_nn_dog'] <> 'Y' then
          begin
            ShowMessage(Format(TranslateText('Невозможно создать налоговую по текущему договору на %s, сумма по налоговым превышает сумму договора по даному нефтепродукту.'),
              [GetNpName(vt.FieldByName('NP_ID').AsInteger)]));
          end
          Else if qTestDogNN['will_nn_rash'] <> 'Y' then
          begin
            ShowMessage(Format(TranslateText('Налоговая на %s не будет создана, т.к. на позицию отпуcка в оплате уже выписана налоговая накладная !'),
              [GetNpName(vt.FieldByName('NP_ID').AsInteger)]));
          end
          Else
          //Создаем НН
          begin
            TaxBill.AddPosition(
                vt.FieldByName('NP_ID').AsInteger,
                Dim_NN,
                DateToStr(edActDate.Date),
                qTestDogNN.FieldByName('Count_NN').AsFloat,
                vAutoDetPrice.AsFloat,
                qTestDogNN.FieldByName('NN').AsFloat
                );
            Result := Result + qTestDogNN.FieldByName('NN').AsFloat;
          end;
          vt.Next;
        end;
      finally
        vt.Free;
      end;

      // одиниця вимірювання
      Dim_NN := DIM_TONN;
      if vAutoDetPart_Dim_id.AsInteger <> 0 then
      begin
        if vAutoDetPart_IsShtuki.AsBoolean then
          Dim_NN := vAutoDetPart_Dim_id.AsInteger
        else
          Dim_NN := IfThen(edOper.Tag = OPER_OUT_AZS,  DIM_LITR, DIM_TONN);
      end;
        
      if(not (edNN_Num.Text = ''))then
        TaxBill.DeleteSBRecordsDet(nn_id, nn_inst, TaxBill.Options.TaxBillType);
      if TaxBill.PositionCount > 0 then
        TaxBill.Make(False)
      else
        cbNotNN.Checked := True;
    finally
      nn_id := TaxBill.Options.TaxBillId;
      nn_inst := TaxBill.Options.TaxBillInst;
      NUM := TaxBill.Options.Num;
      TaxBill.Free;
    end;
  end;
  //****************************************************************************
  procedure DeleteTaxBill;
  var
    TaxBill: TdmTaxBill;
  begin
    qNN.Close;
    qNN.ParamByName('rash_id').AsInteger := vAutoDetRash_id.AsInteger;
    qNN.ParamByName('rash_inst').AsInteger := INST;
    qNN.Open;
    TaxBill := TdmTaxBill.Create(vAutoDetTo_id.AsInteger, vAutoDetTo_inst.AsInteger);
    try
      TaxBill.DeleteSBRecords10(qNNNN_Id.AsInteger,qNNNN_Inst.AsInteger);
    finally
      TaxBill.Free;
    end;
  end;
  //****************************************************************************
  procedure SaveDog(p_Id: integer); // створюємо договір
  var
    DogCreate: TDogCreate;
  begin
    DogCreate := TDogCreate.Create;
    try
      DogCreate.Id := p_Id;
      DogCreate.Inst := SP.Tag;
      DogCreate.DogType := dtN;
      DogCreate.ForePay := false;

      DogCreate.SubType := 10; // Самовывоз
      if KpDogId = 0 then
        Res := TranslateText('добавлении')
      else
        Res := TranslateText('изменении');
      if MessageDlgExt(TranslateText('При ')+ Res +TranslateText(' отпуска будет автоматическм заведен договор.')+#13#10+
                    TranslateText('Выберите его тип: самовывоз или доставка ')+#13#10+
                    TranslateText('Или нажмите Отмена для дальнейшего редактирования'),
                    mtConfirmation, [TranslateText('Самовывоз'), TranslateText('Доставка'), TranslateText('Отмена')],1) = 2 then
        DogCreate.SubType := 11 // Доставка
      else exit;

      DogCreate.DogDate := edKP_Date.Date;
      DogCreate.ExpDate := edPayDate.Date;

      DogCreate.FromId := edFrom.Tag;
      DogCreate.FromInst := lFrom.Tag;

      DogCreate.ToId := vAutoDetTo_id.AsInteger;
      DogCreate.ToInst := vAutoDetTo_inst.AsInteger;

      vAutoDet.First;
      while not vAutoDet.Eof do
      begin
        DogCreate.Add(
          vAutoDetCount.AsFloat,
          vAutoDetPriceNoNDS.AsFloat,
          vAutoDetPrice.AsFloat,
          0,
          0,
          vAutoDetNP_id.AsInteger,
          vAutoDetPart_Dim_id.AsInteger);
        vAutoDet.Next;
      end;
      DogCreate.Save;

      edKP_Dog.Text   := NewDogName;
      KpDogId         := DogCreate.Id;
      KpDogInst       := DogCreate.Inst;
      edKP_Date.Date  := DogCreate.DogDate;
    finally
      FreeAndNil(DogCreate);
    end;
  end;
  //****************************************************************************
begin
  NN_ID := 0;
  NN_INST := 0;
  CrtNewDog := (KpDogId = 0) and (Pos(','+ IntToStr(edOper.Tag) +',', OPER_NOT_NN) = 0);
  vAutoDet.DisableControls;
  try
  try
    StartSQL;

    Test();

    NUM := '';

    if not CrtNewDog then
    begin
      if vAutoDetRash_id.AsInteger = 0 then
        Res := TranslateText('ДОБАВИТЬ')
      else
        Res := TranslateText('ИЗМЕНИТЬ');

      if MessageDlg(TranslateText('Вы уверены что хотите ')+Res+TranslateText(' ОТПУСК НЕФТЕПРОДУКТОВ ?'),
        mtConfirmation, [mbYes, mbNo], 0) = mrNo
      then
        raise Exception.Create(TranslateText('Операция отменена пользователем'));
    end;

    with SP do
    begin
      if CrtNewDog then
      begin
        SaveDog(0); // створюємо договір

        // створюємо/редагуємо рахунок
        if KpDogId <> 0 then
          CreateBillWithDog(KpDogId, SP.Tag);
      end
      else
      if KpDogId <> 0 then
      begin
        qDogDet := TOilQuery.Create(nil);
        qDog := TOilQuery.Create(nil);
        try
          qDogDet.SQL.Text := 'select * from oil_dog_detail where dog_id='+IntToStr(KpDogId)+' and dog_inst='+IntToStr(KpDogInst);
          qDogDet.Open;

          qDog.SQL.Text := 'select * from oil_dog where id='+IntToStr(KpDogId)+' and inst='+IntToStr(KpDogInst);
          qDog.Open;
          if ((qDogDet.FieldByName('PRICE').AsString <> vAutoDetPriceNoNDS.AsString) or
             (qDogDet.FieldByName('PRICE2').AsString <> vAutoDetPrice.AsString) or
             (qDogDet.FieldByName('COUNT_').AsString <> vAutoDetCount.AsString) or
             (qDog.FieldByName('R_FROM_').AsInteger <> edFrom_RS.Tag) or
             (qDog.FieldByName('R_FROM_INST').AsInteger <> lFrom_RS.Tag) or
             (qDog.FieldByName('R_TO_').AsInteger <> vAutoDetTo_rek_id.AsInteger) or
             (qDog.FieldByName('R_TO_INST').AsInteger <> vAutoDetTo_rek_inst.AsInteger)) and
             (qDogDet.RecordCount = 1)
          then
          begin
            // если нет НН по договору задаем вопрос о изменении договора
            if edNNSumDog.Text = '0' then
            begin
              if Application.MessageBox(PChar(TranslateText('Данные отпуска и договора не совпадают. Изменить договор ?')),
                '',  MB_YESNO + MB_DEFBUTTON2 + MB_ICONWARNING) = IDYES
              then
              begin
                SaveDog(KpDogId); // створюємо договір

                // створюємо/редагуємо рахунок
                if KpDogId <> 0 then
                  CreateBillWithDog(KpDogId, KpDogInst);
              end;
            end;
          end;
          qDogDet.Close;
          qDog.Close;
        finally
          qDogDet.Free;
          qDog.Free;
        end;
      end;

      // Удаление деталей расхода
      _ExecSql('update oil_rash_det set state = ''N'' where rash_id = :rash_id and rash_inst = :rash_inst',
        ['rash_id', vAutoDetRash_id.AsInteger, 'rash_inst', IntToStr(Tag)]);

      (*                     КОРРЕКТИРОВКА СУММЫ
       *  Если количество достигло предела по договору, то сумму надо подбить
       *  под остаток по договору если нет, то сумма равна
       *  <взять сумму с НДС>(<количество>*<цену без НДС>)
       *)
       
      // TODO сделать корректировку с учетом того что может быть несколько позиций

      vt := CreateNpSumTable(Self);
      try
        vt.Open;
        vt.First;
        while not vt.Eof do
        begin

          qCorrSumm.Close;
          qCorrSumm.ParamByName('DOG_ID').AsInteger   := KpDogId;
          qCorrSumm.ParamByName('DOG_INST').AsInteger := KpDogInst;
          qCorrSumm.ParamByName('NP_TYPE').AsInteger  := vt.FieldByName('NP_ID').AsInteger;
          qCorrSumm.ParamByName('RAS_INST').AsInteger := vAutoDetRash_inst.AsInteger;
          qCorrSumm.MacroByName('RAS_IDS').Value      := GetRashIds();
          qCorrSumm.Open;

          //
          // если после этого отпуска уже создан отпуск, проверяем был ли он подкоректирован
          if qCorrSumm.FieldByName('MAX_DATE').AsDateTime > edActDate.Date then
          begin
            // Расчетная и сохраненная суммы не равны - признак того что уже есть скорректированый отпуск
            if(FRound(qCorrSumm.FieldByName('CALC_SUMM').AsFloat) <> FRound(qCorrSumm.FieldByName('SAVE_SUMM').AsFloat)) then
            begin
              // корректировалось, то говорим что надо перепринять отпуск №.....
              ShowMessage(TranslateText('Необходимо перепринять отпуск №')
                +qCorrSumm.FieldByName('LAST_ID').AsString+TranslateText(' и перепечатать все документы !'));
            end;
          end
          else // Текущий документ последний, значит
          begin
            qCorrSumm.Close;
            qCorrSumm.ParamByName('IN_COUNT').AsFloat := vt.FieldByName('Count').AsFloat;
            qCorrSumm.ParamByName('IN_SUMM').AsFloat := vt.FieldByName('SummNoNDS').AsFloat;
            qCorrSumm.Open;
            // если количество достигло предела, то подбиваем сумму
            if(qCorrSumm.FieldByName('DIFF_COUNT').AsFloat = 0) and not qCorrSumm.IsEmpty
              and (KP_SUB_TYPE<>12)
            then
            begin
              vAutoDet.Locate('NP_ID', vt.FieldByName('NP_ID').AsInteger, []);
              if not (vAutoDet.State in [dsEdit, dsInsert]) then
                vAutoDet.Edit;              
              vAutoDetSummNoNDS.AsFloat := vAutoDetSummNoNDS.AsFloat + qCorrSumm.FieldByName('result_diff_summ').AsFloat;
              vAutoDet.Post;
            end;
          end;
          vt.Next;
        end;
      finally
        vt.Free;
      end;

      SumNN := 0;
      if not cbNotNN.Checked Then
        SumNN := SaveTaxBill
      else if edNN_Num.Visible then
      begin
        DeleteTaxBill;
        MessageDlg(TranslateText('Удалена налоговая накладная номер ')+qNNNum.AsString,mtInformation,[mbOk],0);
      end;

      vAutoDet.First;
      while not vAutoDet.Eof do
      begin
        if vAutoDetLitr.AsFloat <> 0 then
        begin
          dbSaver.SaveRecord('OIL_RASHOD',
            ['ID',            decode([vAutoDetRash_id.AsInteger, 0, GetSeqNextVal('S_OIL_RASH'), vAutoDetRash_id.AsInteger]),
             'INST',          decode([vAutoDetRash_inst.AsInteger, 0, INST, vAutoDetRash_inst.AsInteger]),
             'STATE',         'Y',
             'EMP_ID',        EMP_ID,
             'DATE_',         BoolTo_(edActDate.Text[1] = ' ', null, edActDate.Date),
             'OPER_ID',       edOper.Tag,
             'FROM_ID',       edFrom.Tag,
             'FROM_INST',     lFrom.Tag,
             'R_FROM_',       BoolTo_(edFrom_Rs.Tag = 0, null, edFrom_RS.Tag),
             'R_FROM_INST',   BoolTo_(edFrom_Rs.Tag = 0, null, lFrom_RS.Tag),

             'TO_ID',         vAutoDetTo_id.AsInteger,
             'TO_INST',       vAutoDetTo_inst.AsInteger,
             'TO_PLACE',      vAutoDetTo_addr.AsString,
             'R_TO_',         BoolTo_(vAutoDetTo_rek_id.AsInteger   = 0, null, vAutoDetTo_rek_id.AsInteger),
             'R_TO_INST',     BoolTo_(vAutoDetTo_rek_inst.AsInteger = 0, null, vAutoDetTo_rek_inst.AsInteger),

             'TTN_NUM',       null,
             'TTN_DATE',      BoolTo_(not edTTN.Enabled or (edTTNDate.Text[1] = ' '), null, edTTNDate.Date),
             'WAY_LIST',      BoolTo_(not edTTN.Enabled, null, edWayList.Text),
             'DOV_SERIAL',    BoolTo_(not edTTN.Enabled, null, edDovSer.Text),
             'DOV_NUM',       BoolTo_(not edTTN.Enabled, null, edDovNum.Text),
             'DOV_DATE',      BoolTo_(not edTTN.Enabled or (edDovDate.Text[1] = ' '), null, edDovDate.Date),
             'DOV_GIVE',      BoolTo_(not edTTN.Enabled, null, edDovGive.Text),

             'AUTO_ID',       BoolTo_(edTTN.Enabled and (edAuto.Tag <> 0), edAuto.Tag, null),
             'AUTO_INST',     BoolTo_(edTTN.Enabled and (edAuto.Tag <> 0), lAuto.Tag,  null),
             'AUTO_DET_ID',   BoolTo_(vAutoDetAuto_Det_id.AsInteger   = 0, null, vAutoDetAuto_Det_id.AsInteger),
             'AUTO_DET_INST', BoolTo_(vAutoDetAuto_Det_inst.AsInteger = 0, null, vAutoDetAuto_Det_inst.AsInteger),
             'TANK_POSITION', BoolTo_(vAutoDetReisNum.AsString = '', null, vAutoDetReisNum.AsString),

             'TRAILER_ID',    BoolTo_(edTTN.Enabled and (edAutoAdd.Tag <> 0), edAutoAdd.Tag, null),
             'TRAILER_INST',  BoolTo_(edTTN.Enabled and (edAutoAdd.Tag <> 0), lAutoAdd.Tag,  null),
             'EMPLOY_ID',     BoolTo_(edTTN.Enabled and (edDriver.Tag  <> 0), edDriver.Tag,  null),
             'EMPLOY_INST',   BoolTo_(edTTN.Enabled and (edDriver.Tag  <> 0), lDriver.Tag,   null),

             'REZ',           BoolTo_(vAutoDetRez_id.AsInteger <> 0, vAutoDetRez_id.AsInteger,  null),
             'REZ_INST',      BoolTo_(vAutoDetRez_id.AsInteger <> 0, vAutoDetRez_inst.AsInteger, null),
             'PART_ID',       vAutoDetPart_id.AsInteger,
             'PART_INST',     vAutoDetPart_inst.AsInteger,
             'OWN_GOOD',      IfThen(vAutoDetPart_Own_Good.AsString = 'O', 'Y', 'N'),
             'CERT_ID',       BoolTo_(vAutoDetCert_id.AsInteger = 0, null, vAutoDetCert_id.AsInteger),

             'TEMPER',        BoolTo_(not dbgSections.FieldColumns['Temper'].ReadOnly, vAutoDetTemper.AsFloat, '0'),
             'UD_WEIG',       BoolTo_(not dbgSections.FieldColumns['Temper'].ReadOnly, vAutoDetUd_Weig.AsFloat, 1),
             'UD_WEIG_20',    BoolTo_(not dbgSections.FieldColumns['Temper'].ReadOnly, vAutoDetUd_Weig_20.AsFloat, 1),
             'LITR',          BoolTo_(not dbgSections.FieldColumns['Temper'].ReadOnly, vAutoDetLitr.AsFloat, vAutoDetCount.AsFloat),
             'COUNT_',        vAutoDetCount.AsFloat,
             'PRICE',         vAutoDetPriceNoNDS.AsFloat,
             'SUMMA',         vAutoDetSummNoNDS.AsFloat,

             'INCL_DEBET',    IfThen(chDebet.Checked,    'Y','N'),
             'SBOR_POST',     IfThen(chSborPost.Checked, 'Y','N'),
             'SBOR_NAC',      IfThen(chSborNac.Checked,  'Y','N'),
             'SBOR_NDS',      IfThen(chSborNDS.Checked,  'Y','N'),
             'UCH_PRICE',     IfThen(chUchPrice.Checked, 'Y','N'),

             'STAMP',         vAutoDetStamp.AsString,
             'PACK',          edPack.Text,
             'NN_ID',         BoolTo_(not cbNotNN.Checked, NN_ID,   null),
             'NN_INST',       BoolTo_(not cbNotNN.Checked, NN_INST, null),
             'DOG',           BoolTo_((KpDogId <> 0) or (KpDogInst <> 0), KpDogId, null),
             'DOG_INST',      BoolTo_((KpDogId <> 0) or (KpDogInst <> 0), KpDogInst,  null),
             'COMM',          edComm.Text,

             'PRIH',          null,
             'PRIH_INST',     null,
             'RASCH_TYPE',    null,
             'USER_ID',       SUPER_REAL_EMP_ID]
          );
        end;
        vAutoDet.Next;
      end;

      if (Pos(','+ IntToStr(edOper.Tag) +',', OPER_OWN_NEEDS) <> 0) and edHardware.Visible and (edHardware.Tag <> 0) then
      begin
        dbSaver.SaveRecord('OIL_RASH_DET',
          ['ID',          GetSeqNextVal('S_OIL_RASH_DET'),
           'STATE',       'Y',
           'RASH_ID',     vAutoDetRash_id.AsInteger,
           'RASH_INST',   vAutoDetRash_inst.AsInteger,
           'AUTO_ID',     edHardware.Tag,
           'AUTO_INST',   lHardware.Tag,
           'EMPLOY_ID',   edPerson.Tag,
           'EMPLOY_INST', lPerson.Tag
           ]);
      end;

      TestAfterSave();

      // Если вставка записей была удачной надо проапдейтить
      // апдейт расхода: вставка номера ТТН
      if edTTN.ReadOnly then
        edTTN.Text := GetNextTTNNumber;

      vAutoDet.First;
      while not vAutoDet.Eof do
      begin
        _ExecSql('update oil_rashod set TTN_NUM = :TTN_NUM where id = :id and inst = :inst',
          ['TTN_NUM', edTTN.Text, 'id', vAutoDetRash_id.AsInteger, 'inst', vAutoDetRash_inst.AsInteger]);
        vAutoDet.Next;
      end;

      // апдейт sale book : вставка номера НН
      if not (cbNotNN.Checked) then
        if NUM <> '' then
        begin
           if NUM = '0' then
             NUM := MainForm.GetNextNNNumber(edActDate.Date);
           _ExecSql('update oil_sale_book set NUM = :NUM where id = :id and inst = :inst',
             ['NUM', NUM, 'id', IntToStr(NN_Id), 'inst', IntToStr(NN_Inst)]);
           if edNN_Num.Visible then
             MessageDlg(TranslateText('Отредактирована НН номер ')+ Num +
               TranslateText(' на сумму ')+FloatToStr(SumNN), mtInformation, [mbOk], 0)
           else
             MessageDlg(TranslateText('Создана НН номер ')+ Num +TranslateText(' на сумму ')
               + FloatToStr(SumNN), mtInformation, [mbOk], 0);
        end;
      CommitSQL;

      if not CopyAfterSave then
      begin
        // Если не выбрано копирование с сохранением, то закрываем форму
        Self.Close;
        Self.ModalResult := mrOk;
      end;
    end;
  except on E:Exception do
    begin
      RollbackSQL;
      if CrtNewDog then
        sbClearDogClick(nil);
      MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
    end;
  end;
  finally
    vAutoDet.EnableControls;
  end;

  if CopyAfterSave then
  begin
    // если пользователь выбрал "Сохранить и создать копию", то очищаем поля
    // кроме полей "от кого", номера ТТН, авто, водителя, доверенности
    GetAutoDet(edId.Tag, SP.Tag, edFrom.Tag, lFrom.Tag, 0, 0, 0, 0, edActDate.Date, edTTN.Text); // вставляємо зерезвуари із автомобіля
    CopyAfterSave := False;
    ChangeFlag := False;
    if sbAutoTTN.Down then
      sbAutoTTN.Down := False;
  end;
end;

procedure TRashForm.edPackChange(Sender: TObject);
begin
  GetState;
end;

procedure TRashForm.sbClearDogClick(Sender: TObject);
begin
  //dbgSections.FieldColumns['To_name'].ButtonStyle := cbsNone;
  edKP_Dog.Clear;
  KpDogId := 0;
  KpDogInst := 0;
  edKP_Date.Clear;
  edPayDate.Clear;
  edPayDate.Enabled := True;
  edKPXPrice.Clear;
  edKP_Count.Clear;
  edKP_Summ.Clear;
  if KP_sub_type=12 then
    Must_be_oper:=0;
  KP_sub_type:= 0;

  if vAutoDet.Active then
  begin
    vAutoDet.Edit;
    vAutoDetNP_id.Clear;
    vAutoDetNP_name.Clear;
    vAutoDetNP_Grp_id.Clear;
    vAutoDet.Post;
  end;

  NN_c := false;
  edNNSumDog.Value := 0;
  CheckNN;
end;
//==============================================================================
procedure TRashForm.edKP_DogButtonClick(Sender: TObject);
var
  F: TDogRefForm;
  edKP_DogText: string;
  edKP_DogTag: integer;
  lKP_DogTag: integer;
  edKP_DateDate: TDateTime;
  edKP_PriceText: string;
  edKP_CountText: string;
  edKP_SummText: string;
  edNP_typeTag: integer;
  edNP_typeText: string;
  qD: TOilQuery;
begin
  F := TDogRefForm.Create(MainForm);
  try
    if (vAutoDetNP_id.AsInteger > 0) and (vAutoDetPart_id.AsInteger > 0) then
    begin
      F.eNPType.Tag := vAutoDetNP_id.AsInteger;
      F.eNPType.Text := vAutoDetNP_name.AsString;
      F.eNPType.Enabled := False;
      F.sbNPTypeClear.Enabled := False;
    end;

    if (edOper.Tag = OPER_MOVEFIL) then // Отпуск на АН можно выбирать только "заявки"
    begin
      F.NotebookSubType.PageIndex := 1;
      F.cbNType.ItemIndex := F.cbNType.Items.IndexOf(TranslateText('Заявка'));
      F.cbNType.Enabled := False;
    end;

    F.gbDogType.Enabled := False;
    F.ShowModal;

    if F.ModalResult = mrOk then
    begin
      KP_sub_type := F.qSUB_TYPE.AsInteger;
      if KP_sub_type = 12 then // если выбрана заявка, то ставим тип операции 229
      begin
        chUchPrice.Checked := true;
        chUchPriceClick(nil);
        
        if (edOper.Tag <> OPER_MOVEFIL) and (edOper.Tag <> 0) then
        begin
          MessageDlg(TranslateText('Нельзя выбрать договор-заявку для отпуска с операцией отличного от ') +
            GetOperationName(OPER_MOVEFIL), mtWarning, [mbOk], 0);
          sbClearDogClick(sender);
        end
        else
          Must_be_oper := OPER_MOVEFIL;
      end
      else
        Must_be_oper := 0;

      edKP_DogText := F.qDog.AsString;
      edKP_DogTag := F.qId.AsInteger;
      lKP_DogTag := F.qInst.AsInteger;
      edKP_DateDate := F.qDog_Date.AsDateTime;
      edPayDate.Date := F.qExp_Date.AsDateTime;
      edPayDate.Enabled := False;
      edKP_PriceText := '';
      edKP_CountText := '';
      edKP_SummText := '';
      edNP_typeTag := 0;

      qD := TOilQuery.Create(nil);
      try
        qD.FetchAll := True;
        qD.SQL.Text :=
          'select D.*, N.name as NP_TYPE_NAME from oil_dog_detail D, oil_np_type N ' +
          ' where dog_id = ' + F.qID.AsString +
          '   and dog_inst = ' + F.qInst.AsString +
          '   and D.NP_TYPE = N.ID(+)';
        if (vAutoDetNP_id.AsInteger > 0) and (vAutoDetPart_id.AsInteger > 0) then
          qD.SQL.Add(' and np_type = ' + IntToStr(vAutoDetNP_id.AsInteger));
        qD.Open;

        if qD.RecordCount = 1 then
        begin
          edKP_PriceText := FloatToStr(GetKpPriceXNds());
          edKP_CountText := FloatToStr(GetKpCount());
          edKP_SummText  := FormatFloat(',0.00####', GetKpSumNds());
          edNP_typeTag   := qD.FieldByName('NP_TYPE').AsInteger;
          edNP_typeText  := qD.FieldByName('NP_TYPE_NAME').AsString;
        end;

        qD.Close;
      finally
        qD.Free;
      end;

      AuxQuery.Close;
      AuxQuery.SQL.Text := 'select * from v_oil_org where id = ' + F.qTO_.AsString
        + ' and inst = ' + F.qTO_INST.AsString;
      AuxQuery.Open;

      if (vAutoDetTo_id.AsInteger > 0) and
        ((vAutoDetTo_id.AsInteger <> auxQuery.FieldByName('Id').asInteger) or
        (vAutoDetTo_inst.AsInteger <> auxQuery.FieldByName('Inst').asInteger))
      then
        if mrNo = MessageDlg(TranslateText('Договор заключен с другой организацией. Заменить ее?'),
          mtWarning, [mbYes, mbNo], 0)
        then
          Exit;

        // Если выбрана новая организация - проверить, не дебетор ли это
      if (vAutoDetTo_id.AsInteger = 0) or
        ((vAutoDetTo_id.AsInteger > 0) and ((vAutoDetTo_id.AsInteger <> auxQuery.FieldByName('Id').asInteger) or
        (vAutoDetTo_inst.AsInteger <> auxQuery.FieldByName('Inst').asInteger)))
      then
        if not InitNewOrg(auxQuery.FieldByName('Id').asInteger,
          auxQuery.FieldByName('Inst').asInteger,
          auxQuery.FieldByName('Name').asString,
          vAutoDetRash_id.AsInteger, vAutoDetRash_inst.AsInteger,
          'OIL_RASHOD', SaleToDeadbeat)
        then
          Exit;
      edKP_Dog.Text := edKP_DogText;
      KpDogId := edKP_DogTag;
      KpDogInst := lKP_DogTag;
      edKP_Date.Date := edKP_DateDate;

      edKPXPrice.Clear;
      edKP_Count.Clear;
      edKP_Summ.Clear;

      //------------------------------------------------------------------------
      vAutoDet.DisableControls;
      try
        vAutoDet.Edit;
        //dbgSections.FieldColumns['To_name'].ButtonStyle := cbsEllipsis;
        vAutoDetPriceNoNDS.AsFloat := 0;
        vAutoDetNP_id.Clear;
        vAutoDetNP_name.Clear;

        if (edKP_PriceText <> '') and (edNP_typeTag > 0) then
        begin
          edKPXPrice.Text := FloatToStr(GetKpPriceXNds());
          edKP_Count.Text := FloatToStr(GetKpCount());
          edKP_Summ.Text  := FormatFloat(',0.00####', GetKpSumNds());

          vAutoDetPriceNoNDS.AsFloat := GetKpPriceXNds();
          vAutoDetPrice.AsFloat      := GetKpPriceNds();
          vAutoDetNP_id.AsInteger    := edNP_typeTag;
          vAutoDetNP_name.AsString   := edNP_typeText;
        end;

        vAutoDetTo_id.AsInteger := auxQuery.FieldByName('Id').asInteger;
        vAutoDetTo_inst.AsInteger := auxQuery.FieldByName('Inst').asInteger;
        vAutoDetTo_name.AsString := auxQuery.FieldByName('Name').asString;

        if auxQuery.FieldByName('Rek_Id').AsString = '' then
        begin
          vAutoDetTo_rek_id.AsInteger := 0;
          vAutoDetTo_rek_inst.AsInteger := 0;
          vAutoDetTo_mfo.AsString := '';
          vAutoDetTo_rach_chet.AsString := '';
        end
        else
        begin
          vAutoDetTo_rek_id.AsInteger   := auxQuery.FieldByName('Rek_Id').AsInteger;
          vAutoDetTo_rek_inst.AsInteger := auxQuery.FieldByName('Rek_Inst').AsInteger;
          vAutoDetTo_mfo.AsString       := auxQuery.FieldByName('MFO').AsString;
          vAutoDetTo_rach_chet.AsString := auxQuery.FieldByName('RACH_CHET').AsString;
        end;
        vAutoDet.Post;
      finally
        vAutoDet.EnableControls;
      end;
      //------------------------------------------------------------------------

      if auxQuery.FieldByName('nal_num').IsNull then
        Nal_number := '-1'
      else
        Nal_number := auxQuery.FieldByName('nal_num').AsString;

      NN_C := (nvl(qDog.FieldByName('forepay').AsInteger, 0) > 0);
      if NN_C then
      begin
        BalanceQuery.Close;
        BalanceQuery.ParamByName('id').asInteger := KpDogId;
        BalanceQuery.ParamByName('inst').asInteger := KpDogInst;
        BalanceQuery.Open;
        if BalanceQueryBACO.IsNull then
        begin
          ShowMessage(TranslateText('По этому предоплатному договору предоплата не проводилась. Отпуск запрещен.'));
          sbClearDogClick(sender);
        end
        else if BalanceQueryBACO.AsCurrency < 0 then
          ShowMessage(TranslateText('ПРЕДУПРЕЖДЕНИЕ: По этому предоплатному договору отпущено больше, чем оплачено.'));
        BalanceQuery.Close;
      end;

      // Обновляем сумму налоговых по договору
      qAllNNSum.Close;
      qAllNNSum.ParamByName('dog_id').AsInteger   := KpDogId;
      qAllNNSum.ParamByName('dog_inst').AsInteger := KpDogInst;
      qAllNNSum.ParamByName('nn_id').AsInteger    := -1;
      qAllNNSum.ParamByName('nn_inst').AsInteger  := -1;
      qAllNNSum.Open;
      edNNSumDog.Value := qAllNNSum.FieldByName('sum_nn').AsFloat;
      edNNSumDog.Tag := Trunc(qAllNNSum.FieldByName('s_date').AsDateTime);
      qAllNNSum.Close;
    end;
  finally
    F.Free;
    GetState;
    CheckNN;
  end;
end;
//==============================================================================
procedure TRashForm.GetCount();
var
  tmp_price2, tmp_sum: real;
begin
// Мрачная процедура...

//  АЛГОРИТМ РАСЧЕТА ЦЕНЫ ("C:\OIL\Text\Rashod Price.txt" )

//  1. Если есть договор с конечным потребителем то цена всегда берется из него.
//  2. Если операция "Перемещение между филиалами" или "Перемещение между филиалами
//     АН" то цена берется учетная.
//  3. Если ПОСТАВЛЕНА галочка "по учетной цене" то
//     а) Берется цена учетная.
//     б) Не насчитывается НДС.
//  4. Если НЕ ПОСТАВЛЕНА галочка "по учетной цене" то
//     а) Берется цена конечного потребителя.
//     б) Насчитывается НДС.
//  5. Если же в поле цена было введено пользовательское значение(т.е вы его
//     прописали сами - не учетную цену и не цену конечному потребителю, а
//     какую-то третью) то она НЕ ЗАМЕНЯЕТСЯ и:
//     а) Если ПОСТАВЛЕНА галочка "по учетной цене" то НЕ НАСЧИТЫВАЕТСЯ НДС.
//     б) Если НЕ ПОСТАВЛЕНА галочка "по учетной цене" то НАСЧИТЫВАЕТСЯ НДС.

  if not ChangeFlag then
  begin
    ChangeFlag := True;
    vAutoDet.DisableControls;
    try
      if not (vAutoDet.State in [dsEdit, dsInsert]) then
        vAutoDet.Edit;

      if chUchPrice.Checked then
        vAutoDetPriceNoNDS.AsFloat := vAutoDetPart_Price.AsFloat;

      If (edKP_Dog.Text = '')or ( (KP_SUB_TYPE = 12)and(edKP_Dog.Text <> '')) then
      begin
        if (VarToStr(vAutoDetPriceNoNDS.AsFloat) = FloatToStr(vAutoDetPart_Price_KP.AsFloat))
          Or(VarToStr(vAutoDetPriceNoNDS.AsFloat) = FloatToStr(vAutoDetPart_Price.AsFloat))then
        begin
          if (chUchPrice.Checked)or(edOper.Tag = OPER_MOVENB)or(edOper.Tag = OPER_MOVEFIL) Then
            vAutoDetPriceNoNDS.AsFloat := vAutoDetPart_Price.AsFloat
          else
          Begin
            vAutoDetPriceNoNDS.AsFloat := vAutoDetPart_Price_KP.AsFloat;
            if (sbCorrectPrice.Tag = 1) and (vAutoDetPart_id.AsInteger <> 0) then
            Begin
              tmp_sum := MRound(vAutoDetCount.AsFloat * vAutoDetPriceNoNDS.AsFloat, 2);
              tmp_price2 := MRound(GetWithNDS_NoNDS(vAutoDetPriceNoNDS.AsFloat, StrToDate(edActDate.Text)), 2);

              if (sbCorrectPrice.Down) then
              begin
                if MRound(GetWithNDS_NoNDS(tmp_sum, StrToDate(edActDate.Text)), 2) <> MRound(vAutoDetCount.AsFloat * tmp_price2, 2) then
                begin
                  vAutoDetPriceNoNDS.AsFloat := MRound(GetNoNDS_WithNDS(tmp_price2,StrToDate(edActDate.Text)), 4);
                  sbCorrectPrice.Tag := 1;
                end
                else sbCorrectPrice.Tag := 0;
              end;
            end
          end
        end
        else if not chUchPrice.Checked and not ((edOper.Tag = OPER_MOVENB) or(edOper.Tag=OPER_MOVEFIL)) and
          (sbCorrectPrice.Tag = 1) and (vAutoDetPart_id.AsInteger <> 0)
        then
        begin
          vAutoDetPriceNoNDS.AsFloat := GetKpPriceXNds();
          tmp_sum := MRound(vAutoDetCount.AsFloat * vAutoDetPriceNoNDS.AsFloat, 2);
          tmp_price2 := MRound(GetWithNDS_NoNDS(vAutoDetPriceNoNDS.AsFloat, StrToDate(edActDate.Text)),2);

          if (sbCorrectPrice.Down) then
          begin
            if MRound(GetWithNDS_NoNDS(tmp_sum,StrToDate(edActDate.Text)), 2) <> MRound(vAutoDetCount.AsFloat * tmp_price2, 2) then
            begin
              vAutoDetPriceNoNDS.AsFloat := MRound(GetNoNDS_WithNDS(vAutoDetPrice.AsFloat, StrToDate(edActDate.Text)), 4);
              sbCorrectPrice.Tag := 1;
            end
            else
              sbCorrectPrice.Tag := 0;
          end;
        end
        else
        begin
        end
      end
      else
      begin
         if edKPXPrice.Text = '' then
           vAutoDetPriceNoNDS.AsFloat := 0
         else
           vAutoDetPriceNoNDS.AsFloat := GetKpPriceXNds();
        tmp_sum    := MRound(vAutoDetCount.AsFloat * vAutoDetPriceNoNDS.AsFloat, 2);
        tmp_price2 := MRound(GetWithNDS_NoNDS(vAutoDetPriceNoNDS.AsFloat, StrToDate(edActDate.Text)),2);

        if (sbCorrectPrice.Down) then
          if (MRound(GetWithNDS_NoNDS(tmp_sum, StrToDate(edActDate.Text)), 2) <> MRound(vAutoDetCount.AsFloat * tmp_price2, 2)) then
          begin
            vAutoDetPriceNoNDS.AsFloat := MRound(GetNoNDS_WithNDS(tmp_price2,StrToDate(edActDate.Text)),4);
            sbCorrectPrice.Tag := 1;
          end
          else sbCorrectPrice.Tag := 0;
      end;

      vAutoDetSummNoNDS.AsFloat := MRound(vAutoDetCount.AsFloat * vAutoDetPriceNoNDS.AsFloat, 2);
      if chUchPrice.Checked then
      begin
        vAutoDetPrice.AsFloat := vAutoDetPriceNoNDS.AsFloat;
        vAutoDetSumm.AsFloat  := vAutoDetSummNoNDS.AsFloat;
      end
      else
      begin
        tmp_sum    := MRound(vAutoDetCount.AsFloat * vAutoDetPriceNoNDS.AsFloat, 2);
        tmp_price2 := MRound(GetWithNDS_NoNDS(vAutoDetPriceNoNDS.AsFloat,StrToDate(edActDate.Text)),2);

        if (sbCorrectPrice.Down) then
        begin
          if (MRound(GetWithNDS_NoNDS(tmp_sum,StrToDate(edActDate.Text)), 2) <> MRound(vAutoDetCount.AsFloat * tmp_price2, 2))then
          begin
            vAutoDetPriceNoNDS.AsFloat := MRound(GetNoNDS_WithNDS(tmp_price2,StrToDate(edActDate.Text)),4);
            sbCorrectPrice.Tag := 1;
          end
          else
            sbCorrectPrice.Tag := 0;
        end;
        vAutoDetSummNoNDS.AsFloat := MRound(vAutoDetCount.AsFloat * vAutoDetPriceNoNDS.AsFloat, 2);
        if edKP_Dog.Text <> '' then
          vAutoDetPrice.AsFloat := GetKpPriceNds()
        else
          vAutoDetPrice.AsFloat := MRound(GetWithNDS_NoNDS(vAutoDetPriceNoNDS.AsFloat, StrToDate(edActDate.Text)), 2);
        vAutoDetSumm.AsFloat    := MRound(GetWithNDS_NoNDS(vAutoDetSummNoNDS.AsFloat, StrToDate(edActDate.Text)), 2);
      end;
    finally
      vAutoDet.EnableControls;
      ChangeFlag := False;
    end;
  end;
end;
//==============================================================================
procedure TRashForm.FormCreate(Sender: TObject);
begin
  inherited;
  IsShow := false;
  IsEditedAutoDet := false; // запись про те, що дані в табличці є, або тільки вставилися
  ChangeFlag := False;
end;
//==============================================================================
procedure TRashForm.edTTNChange(Sender: TObject);
begin
  EdTTNFlag := true;
end;

procedure TRashForm.edActDateChange(Sender: TObject);
begin
  if not Self.Visible and ((Sender as TDateEdit).Date <= StrToDate(Close_Date)) then
    (Sender as TDateEdit).Enabled := false;
  bbOk.Enabled := (edActDate.Date > StrToDate(CLOSE_DATE));
end;

procedure TRashForm.cbNotNNClick(Sender: TObject);
begin
  if RealClick then // для активності НН
  begin
    NN_a := cbNotNN.Checked;
    NN_d:= NN_a and NN_d;
    CheckNN;
  end;
end;

procedure TRashForm.CheckNN;
begin
  // NN_a - результат ручной установки/снятия птички
  // NN_b = true, если по данной операции не создается НН
  // NN_c = true, если выбран предоплатный договор
  // NN_d = true, если с данным отпуском не связана НН или номер НН = 0
  cbNotNN.Enabled:= not NN_B {and not NN_C};
  cbNotNN.Checked:= NN_A or NN_b {or NN_C }or NN_d;
end;

function TRashForm.GetNextTTNNumber: string;
begin
  Result := IntToStr(GetSeqNextVal('TTN_NUM'));
end;

procedure TRashForm.sbAutoTTNClick(Sender: TObject);
begin
  if sbAutoTTN.Down then
  begin
    EdTTN.Text := '';
    EdTTNFlag:=false;
    EdTTN.ReadOnly:=true;
    EdTTN.Color:=clBtnFace;
    EdTTN.Hint:=TranslateText('Будет выбран следующий номер по порядку');
    EdTTN.ShowHint:=true;
  end
  else
  begin
    EdTTN.ReadOnly:=false;
    EdTTN.Color:=clWindow;
    EdTTN.Hint:='';
    EdTTN.ShowHint:=false;
  end;
end;

procedure TRashForm.cbNotNNEnter(Sender: TObject);
begin
  RealClick := true; // для активності НН
end;

procedure TRashForm.cbNotNNExit(Sender: TObject);
begin
  RealClick := false; // для активності НН
end;
//==============================================================================
procedure TRashForm.sbCorrectPriceClick(Sender: TObject);
begin // Пересчет цены с большей точностью
  if sbCorrectPrice.Down then
  begin
    dbgSections.FieldColumns['PriceNoNDS'].Title.Color := clGreen;
    dbgSections.FieldColumns['PriceNoNDS'].Title.Font.Style := [fsBold];
  end
  else
  begin
    dbgSections.FieldColumns['PriceNoNDS'].Title.Color := clBtnFace;
    dbgSections.FieldColumns['PriceNoNDS'].Title.Font.Style := [];
  end;
  sbCorrectPrice.Tag := 1;
  chUchPriceClick(nil); // Пересчет цены с большей точностью
end;
//==============================================================================
procedure TRashForm.sbClearOperClick(Sender: TObject);
begin
  if edOper.Tag = OPER_MOVEFIL then
    sbClearDog.OnClick(sbClearDog);
  edOper.Clear;
  edOper.Tag := 0;
  chDebet.Checked := false;
  NN_b := false;
  CheckNN;
end;
//==============================================================================
procedure TRashForm.GetTitlePriceNoNDS(); // вигляд поля PriceNoNDS
begin
  if chUchPrice.Checked then
  Begin
    if chUchPrice.Checked and (vAutoDetPriceNoNDS.AsFloat >= 0)
      and (vAutoDetPriceNoNDS.AsFloat <> vAutoDetPart_Price.AsFloat)then
    Begin
      dbgSections.FieldColumns['PriceNoNDS'].Title.Color := clRed;
      dbgSections.FieldColumns['PriceNoNDS'].Title.Font.Style := [fsBold];
    End;
    sbCorrectPrice.Down := False;
  End
  else
  Begin
    dbgSections.FieldColumns['PriceNoNDS'].Title.Color := clBtnFace;
    dbgSections.FieldColumns['PriceNoNDS'].Title.Font.Style := [];
  End;
end;
//==============================================================================
procedure TRashForm.chUchPriceClick(Sender: TObject);
begin
  if not IsShow then exit;

  // Цена горит красным цветом - значит после
  // введения данного отпуска изменилась
  // учетная цена партии. Отпуск надо перепринять.
  vAutoDet.DisableControls;
  try
    vAutoDet.First;
    while not vAutoDet.Eof do
    begin
      GetTitlePriceNoNDS(); // вигряд поля PriceNoNDS
      GetCount();
      CheckNN;
      if chUchPrice.Checked then
      begin
        cbNotNN.Enabled := False;
        cbNotNN.Checked := True;
      end;
      vAutoDet.Next;
    end;
  finally
    vAutoDet.EnableControls;
  end;
end;

function VarToFloat(V: variant): Extended;
Begin
  result:=StrToFloat(VarToStr(V));
End;

procedure TRashForm.edDriverButtonClick(Sender: TObject);
var
  EmpRefForm: TEmpRefForm;
begin
  Application.CreateForm(TEmpRefForm, EmpRefForm);
  try
    EmpRefForm.ShowModal;
    if EmpRefForm.ModalResult = mrOk then
    begin
      edDriver.Tag := EmpRefForm.qID.AsInteger;
      lDriver.Tag  := EmpRefForm.qInst.AsInteger;
      edDriver.Text := EmpRefForm.qF_NAME.AsString;
      if not(EmpRefForm.qI_NAME.AsString[1] in [' ', '_']) then
        edDriver.Text := edDriver.Text + ' ' + EmpRefForm.qI_NAME.AsString[1] + '.';
      if not(EmpRefForm.qO_NAME.AsString[1] in [' ', '_']) then
        edDriver.Text := edDriver.Text + ' ' + EmpRefForm.qO_NAME.AsString[1] + '.';
    end;
  finally
    EmpRefForm.Free;
  end;
end;

procedure TRashForm.edHardwareButtonClick(Sender: TObject);
Var
  AutoRefForm : TAutoRefForm;
begin
  Application.CreateForm(TAutoRefForm, AutoRefForm);
  try
    AutoRefForm.ShowModal;
    If AutoRefForm.ModalResult = mrOk Then
    Begin
      edHardware.Text := AutoRefForm.qNumb.AsString;
      edHardware.Tag  := AutoRefForm.qId.AsInteger;
      lHardware.tag   := AutoRefForm.qInst.AsInteger;
      if not AutoRefForm.qEmploy_id.IsNull and not AutoRefForm.qEmploy_inst.IsNull then
      Begin
        edPerson.Text := AutoRefForm.qFullname.AsString;
        edPerson.Tag := AutoRefForm.qEmploy_id.AsInteger;
        lPerson.Tag := AutoRefForm.qEmploy_inst.AsInteger;
      End;
    End;
  finally
    AutoRefForm.Free;
  end;
end;

procedure TRashForm.edPersonButtonClick(Sender: TObject);
var
  EmpRefForm: TEmpRefForm;
begin
  Application.CreateForm(TEmpRefForm, EmpRefForm);
  try
    EmpRefForm.ShowModal;
    if EmpRefForm.ModalResult = mrOk then
    begin
      edPerson.Tag := EmpRefForm.qID.AsInteger;
      lPerson.Tag  := EmpRefForm.qInst.AsInteger;
      edPerson.Text := EmpRefForm.qF_NAME.AsString;
      if not(EmpRefForm.qI_NAME.AsString[1] in [' ', '_']) then
        edPerson.Text := edPerson.Text + ' ' + EmpRefForm.qI_NAME.AsString[1] + '.';
      if not(EmpRefForm.qO_NAME.AsString[1] in [' ', '_']) then
        edPerson.Text := edPerson.Text + ' ' + EmpRefForm.qO_NAME.AsString[1] + '.';
    end;
  finally
    EmpRefForm.Free;
  end;
end;

procedure TRashForm.Write_Log(s: string);
begin
  if not SysParamExists('RASHODLOG') then exit;
  ExFunc.log('RASHODLOG.log',FormatDateTime('dd.mm.yyyy hh:nn:ss',now())+' '+s);
end;
//==============================================================================
function TRashForm.TestPartinEditingAndAdding
(
  Part_id, Part_inst: integer;
  Date_Rash: TDateTime;
  Fact_Count: real;
  Rash_id, Rash_inst: integer; // Rash_id = 0, якщо це ми добавляємо відпуск
  Oper_id: integer;
  Add: boolean = False): boolean;
var
  PrihForm: TPrihForm;
  s1, s2: string;
begin
  Result := True;
  s1 := '';
  s2 := '';
  PrihForm := TPrihForm.Create(Application);
  try
    if PrihForm.PartDate(Part_id, Part_inst) = True then
    begin
      qTestPartRest.Close;
      qTestPartRest.ParamByName('part_id').AsInteger := Part_id;
      qTestPartRest.ParamByName('part_inst').AsInteger := Part_inst;
      qTestPartRest.Open;
      qTestPartRest.First;
      if qTestPartRest.RecordCount > 0 then
      begin
        if Add = False then
        begin
          s1 := TranslateText('Первый отпуск, который приводит к отрицательным остаткам по партии ')+ vAutoDetPart_name.AsString +
            TranslateText(' имеет номер ') +
            qTestPartRest.FieldByName('id').AsString + TranslateText(' и дату ') + qTestPartRest.FieldByName('data_oper').AsString + '. ' + #13#10;
          s2 := TranslateText('редактировании');
        end
        else
          s2 := TranslateText('добавлении');
        MessageDlg(TranslateText('При ') + s2 + TranslateText(' данного отпуска, остаток по партии ')+ vAutoDetPart_name.AsString +
          TranslateText(' на дату ') +
          qTestPartRest.FieldByName('data_oper').AsString + TranslateText(', будет отрицательным.') + #13#10 +
          TranslateText('Отредактируйте данный отпуск так, чтобы остаток по партии ')+ vAutoDetPart_name.AsString +
          TranslateText(' на дату ') +
          qTestPartRest.FieldByName('data_oper').AsString + ', ' + TranslateText('был больше или равен нулю.') + #13#10 + s1 +
          TranslateText('Для просмотра всего движения по партии выберите отчет "Отчеты\Отчеты по Нефтебазе\Движение по партии". '), mtError, [mbOk], 0);
      
        Result := False;
      end;
    end;
  finally
    PrihForm.Free;
  end;
end;
//==============================================================================
procedure TRashForm.cbCertKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key := ' ';
end;
//==============================================================================
procedure TRashForm.N1Click(Sender: TObject);
begin
  inherited;
  CopyAfterSave:=TRUE;
  bbOk.OnClick(nil);
end;
//==============================================================================
procedure TRashForm.dbgSectionsEditButtonClick(Sender: TObject);
begin
  if dbgSections.SelectedField.FieldName = 'To_name' then
    ChooseTo();

  if dbgSections.SelectedField.FieldName = 'Part_name' then
    ChoosePart();
end;
//==============================================================================
procedure TRashForm.vAutoDetBeforeInsert(DataSet: TDataSet);
begin
  if IsShow and not vAutoDet.IsEmpty and (edAuto.Text = '') then
    raise Exception.Create(TranslateText('Для добавления позиции необходимо выбрать автомобиль !'));
end;
//==============================================================================
procedure TRashForm.vAutoDetBeforePost(DataSet: TDataSet);
begin
  if not IsShow then exit;

  IsEditedAutoDet := true; // запись про те, що дані в табличці є, або тільки вставилися
  vAutoDetTo_addr.AsString := edTO_Place.Text; // Место назн.
  if vAutoDetTemper_20.IsNull then
    vAutoDetTemper_20.AsInteger := 20;

  // проставляємо ID i INST в OIL_RASHOD
  if (vAutoDetRash_id.AsInteger = 0) or (vAutoDetRash_inst.AsInteger = 0) then
  begin
    vAutoDetRash_id.AsInteger   := GetSeqNextVal('S_OIL_RASH');
    vAutoDetRash_inst.AsInteger := INST;
  end;

  if abs(MRound((MRound(vAutoDetUd_Weig.AsFloat * vAutoDetLitr.AsFloat, 0) / 1000) - vAutoDetCount.AsFloat, 6)) > 1 then
    if MessageDlgExt(TranslateText('Количество не соответствует литражу при данном удельном весе!'),
      mtConfirmation, [TranslateText('Продолжить'), TranslateText('Отмена')], 2) = 2 then
      raise Exception.Create(TranslateText('Отменено пользователем!'));
end;
//==============================================================================
procedure TRashForm.dsAutoDetDataChange(Sender: TObject; Field: TField);
begin
  if not IsShow then exit;
  if (vAutoDetRash_id.AsInteger = iAutoDet) and (iAutoDet <> 0) then
    exit;

  iAutoDet := vAutoDetRash_id.AsInteger;
  GetLeft();
  // Резервуар
  FillRezList(dbgSections.FieldColumns['Rez_name'].PickList, edFrom.Tag,
    decode([sbRezShow.Down, true, vAutoDetPart_id.AsInteger, 0]),
    decode([sbRezShow.Down, true, vAutoDetPart_inst.AsInteger, 0]), false);

  edTo_Rs.Text    := vAutoDetTo_rach_chet.AsString;
  edTo_MFO.Text   := vAutoDetTo_mfo.AsString;
  edTO_Place.Text := vAutoDetTo_addr.AsString;

  rAutoDetUD_WeigOLD := vAutoDetUD_Weig.AsFloat; // густина

  if edKP_Dog.Text <> '' then
  begin
    edKP_Count.Text := FloatToStr(GetKpCount());
    edKPXPrice.Text := FloatToStr(GetKpPriceXNds());
    edKP_Summ.Text  := FormatFloat(',0.00####', GetKpSumNds());
  end
end;
//==============================================================================
procedure TRashForm.vAutoDetTemperChange(Sender: TField);
var
  fTemp: Double;
begin
  // перевірка температури
  if vAutoDetTemper.AsString = '' then
    vAutoDetTemper.AsFloat := 0;
  if not TryStrToFloat(vAutoDetTemper.AsString, fTemp) then
  begin
    MessageDlg(TranslateText('Неверно введённая температура!'), mtError, [mbOk], 0);
    vAutoDetTemper.AsFloat := 0;
    exit;
  end;
  // знаходимо густину при 20 С
  if vAutoDetTemper_20.AsFloat = 0 then
    vAutoDetTemper_20.AsFloat := 20;
  vAutoDetUD_Weig_20.AsFloat :=
    nvl(GetSqlValueParSimple('select GetDensityForTemperature(:UD_Weig, :Temper, 20) from dual',
      ['UD_Weig', vAutoDetUD_Weig.AsFloat,
       'Temper',  vAutoDetTemper.AsFloat]), 0);
end;
//==============================================================================
procedure TRashForm.vAutoDetUD_WeigChange(Sender: TField);
begin
  if not IsShow then exit;

  if IsOperOutAzs(edOper.Tag) and Self.Visible and (not CopyAfterSave) and (vAutoDetRash_id.AsInteger <> 0)
    and (vAutoDetUD_Weig.AsFloat <> rAutoDetUD_WeigOLD)
    and (rAutoDetUD_WeigOLD <> 0) and (vAutoDetUD_Weig.AsFloat <> 0) then
    MessageDlg(
      TranslateText('Изменение уд. веса вызовет изменение остатков в сменном отчете. ') +
      TranslateText('Нажмите кнопку "Отмена" если вы этого не хотите.'), mtError, [mbOk], 0)
  else
    rAutoDetUD_WeigOLD := vAutoDetUD_Weig.AsFloat;
  vAutoDetLitrChange(nil);
  vAutoDetTemperChange(nil);
end;
//==============================================================================
procedure TRashForm.vAutoDetCountChange(Sender: TField);
begin
  if not IsShow then exit;

  if not ChangeFlag then
  try
    ChangeFlag := True;
    if (vAutoDetUd_Weig.AsFloat <> 0) and (vAutoDetLitr.AsFloat = 0) then
      vAutoDetLitr.AsFloat := MRound(vAutoDetCount.AsFloat * 1000 / vAutoDetUd_Weig.AsFloat, 0);
  finally
    ChangeFlag := False;
  end;
  GetCount();
end;
//==============================================================================
procedure TRashForm.vAutoDetLitrChange(Sender: TField);
begin
  if not IsShow then exit;

  if not ChangeFlag then
  try
    ChangeFlag := True;
    vAutoDetCount.AsFloat := MRound(vAutoDetUd_Weig.AsFloat * vAutoDetLitr.AsFloat, 0) / 1000;
  finally
    ChangeFlag := False;
  end;
  GetCount();
end;
//==============================================================================
procedure TRashForm.vAutoDetPriceNoNDSChange(Sender: TField);
begin
  GetCount();
end;
//==============================================================================
procedure TRashForm.vAutoDetPriceChange(Sender: TField);
begin
  if not ChangeFlag then
  try
    ChangeFlag := True;
    if chUchPrice.Checked Then
      vAutoDetPriceNoNDS.AsFloat := MRound(vAutoDetPrice.AsFloat, 4)
    else
      vAutoDetPriceNoNDS.AsFloat := MRound(GetNoNDS_WithNDS(vAutoDetPrice.AsFloat, StrToDate(edActDate.Text)), 4);
  finally
    ChangeFlag := False;
  end;
  GetCount();
end;
//==============================================================================
procedure TRashForm.edOperKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;
//==============================================================================
procedure TRashForm.dbgSectionsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if dbgSections.SelectedField.FieldName = 'Cert_name' then
    dbgSections.Hint := TranslateText('Список сертификатов подтягивается из партии и приходов по этой партии.')
  else
    if dbgSections.SelectedField.FieldName = 'PriceNoNDS' then
      dbgSections.Hint :=
        TranslateText('Цена горит красным цветом - значит после введения данного отпуска')+#13#10 +
        TranslateText('изменилась учетная цена партии. Отпуск надо перепринять.')
    else
      if dbgSections.SelectedField.FieldName = 'NP_name' then
        dbgSections.Hint := vAutoDetNP_name.AsString
      else
        dbgSections.Hint := '';
end;
//==============================================================================
procedure TRashForm.vAutoDetCert_nameChange(Sender: TField);
begin // Сертификат
  if not IsShow then exit;

  qCert.Filtered := false;
  qCert.Filter   := 'CERT_NAME = '''+ vAutoDetCert_name.AsString +'''';
  qCert.Filtered := true;

  if qCert.IsEmpty then
    vAutoDetCert_id.Clear
  else
    vAutoDetCert_id.AsInteger := qCert.FieldByName('cert_id').AsInteger;
end;
//==============================================================================
procedure TRashForm.vAutoDetRez_nameChange(Sender: TField);
begin // Резервуар
  if sbRezShow.Down then
    sbRezShow.Hint := TranslateText('Показывать резервуары с этой партией')
  else
    sbRezShow.Hint := TranslateText('Показывать все возможные резервуары');

  if not IsShow then exit;

  if (not qRez.Active) or (qRez.ParamByName('a').AsInteger <> edFrom.Tag) then
  begin
    qRez.Close;
    qRez.ParamByName('a').AsInteger := edFrom.Tag;
    qRez.Open;
  end;

  qRez.Filtered := false;
  qRez.Filter   := 'NUM_NAME = '''+ vAutoDetRez_name.AsString +'''';
  qRez.Filtered := true;

  try
    if qRez.IsEmpty then
    begin
      vAutoDetRez_id.Clear;
      vAutoDetRez_inst.Clear;
    end
    else
    begin
      vAutoDetRez_id.AsInteger   := qRez.FieldByName('id').AsInteger;
      vAutoDetRez_inst.AsInteger := qRez.FieldByName('inst').AsInteger;
    end;
  finally
    qRez.Filtered := false;
  end;
end;
//==============================================================================
procedure TRashForm.dbgSectionsExit(Sender: TObject);
begin
  if vAutoDet.State in [dsEdit, dsInsert] then
    vAutoDet.Post;
end;
//==============================================================================
procedure TRashForm.vAutoDetNP_Grp_idChange(Sender: TField);
begin
  if vAutoDetUD_Weig.AsFloat = 0 then
  vAutoDetUD_Weig.AsFloat :=
    nvl(GetSqlValueParSimple(
      'select to_number(substr(max(to_char(date_, ''YYYYMMDD'') || density), 9)) as density' +
      '  from oil_grp_density' +
      ' where state = ''Y'' and npgroup_id = :npg_id', ['npg_id', vAutoDetNP_Grp_id.AsInteger]), 0);   

  if not IsShow then exit;
  if vAutoDetNP_Grp_id.AsInteger = 62 then
    edPack.ItemIndex := edPack.Items.IndexOf(TranslateText('Пропановоз'))
  else
    edPack.ItemIndex := edPack.Items.IndexOf(TranslateText('Бензовоз'));
end;
//==============================================================================
procedure TRashForm.actEExecute(Sender: TObject);
begin
  if dbgSections.FieldColumns[dbgSections.SelectedField.FieldName].ButtonStyle = cbsEllipsis then
    dbgSectionsEditButtonClick(nil)
  else
    dbgSections.SelectedField.FocusControl;
end;
//==============================================================================
procedure TRashForm.actSaveExecute(Sender: TObject);
begin
  bbOk.Click;
end;
//==============================================================================
procedure TRashForm.edIDChange(Sender: TObject);
begin
  edID.Hint := edID.Text;
end;
//==============================================================================
//===========================Begin ColumnMoved==================================
//==============================================================================
procedure TRashForm.sbColClick(Sender: TObject);
var
  i:integer;
begin
  if not sbCol.Down then
    PanelCol.Width := 0
  else
  Begin
    PanelCol.Width := 150;
    cbCol.Items.Clear;
    For i := 0 to dbgSections.Columns.Count-1 do
    Begin
      cbCol.Items.Add(dbgSections.Columns[i].Title.Caption);
      if dbgSections.Columns[i].Visible then
        cbCol.Checked[i] := TRUE
      else
        cbCol.Checked[i] := FALSE;
    end;
  End;
end;
//==============================================================================
procedure TRashForm.dbgSectionsColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
begin
  sbColClick(nil);
end;
//==============================================================================
procedure TRashForm.spbSelectAllClick(Sender: TObject);
var
  i:integer;
begin
  for i := 0 to cbCol.Items.count-1 do
  Begin
    dbgSections.Columns[i].Visible := TRUE;
    cbCol.Checked[i] := TRUE;
  end;
end;
//==============================================================================
procedure TRashForm.spbCloseTunePanelClick(Sender: TObject);
begin
  sbCol.Down := false;
  sbColClick(nil);
end;
//==============================================================================
procedure TRashForm.spbClearColConfigClick(Sender: TObject);
begin
  ClearGridColumns(ClassName);
  if not IsColConfCleared then
    ShowMessage(TranslateText('Перезапустите справочник, чтобы изменения вступили в силу.'));
  IsColConfCleared := True;
end;
//==============================================================================
procedure TRashForm.cbColClickCheck(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to cbCol.Items.count-1 do
    dbgSections.Columns[i].Visible := cbCol.Checked[i];
end;
//==============================================================================
//=============================End ColumnMoved==================================
//==============================================================================
procedure TRashForm.edTo_PlaceExit(Sender: TObject);
begin
  vAutoDet.Edit;
  vAutoDet.Post;
end;
//==============================================================================

function TRashForm.GetKpDogId: integer;
begin
  Result := edKP_Dog.Tag;
end;

function TRashForm.GetKpDogInst: integer;
begin
  Result := lKP_DogNumb.Tag
end;

procedure TRashForm.SetKpDogId(const Value: integer);
begin
  edKP_Dog.Tag := Value;
  OnSetKpDog;
end;

procedure TRashForm.SetKpDogInst(const Value: integer);
begin
  lKP_DogNumb.Tag := Value;
  OnSetKpDog;
end;

procedure TRashForm.OnSetKpDog;
begin
  if edKP_Dog.Text <> '' then
  begin
    qDog.Close;
    _OpenQueryPar(qDog,
     ['dog_id',   KpDogId,
      'dog_inst', KpDogInst]);
  end;
end;

procedure TRashForm.edKP_DogChange(Sender: TObject);
begin
  inherited;
  OnSetKpDog;
end;

procedure TRashForm.sbRezShowClick(Sender: TObject);
begin
  inherited;
  if sbRezShow.Down then
    sbRezShow.Hint := TranslateText('Показывать резервуары с этой партией')
  else
    sbRezShow.Hint := TranslateText('Показывать все возможные резервуары');
end;

procedure TRashForm.Test();
var
  IsHaveDet: boolean;
  vt: TVirtualTable;
begin
  if edActDate.Text[1] = ' ' then
    raise Exception.Create(TranslateText('Введите дату расхода!'));
    
  if(EdTTN.Enabled and edTTNFlag)and(LblTTN.Caption<>TranslateText('ЖДН'))then
  begin
    if (nvl(GetSqlValueParSimple('select count(*) from oil_rashod where TTN_NUM = :par',
      ['par', edTTN.Text]), 0) > 0) and
      (MessageDlg(TranslateText('ТТН с таким номером уже существует. Продолжать?'),
      mtConfirmation, [mbYes, mbNo], 0) = mrNo)
    then
      raise Exception.Create(TranslateText('Операция отменена пользователем.'));
  end;

  if (IsOperOutAzs(edOper.Tag) or (edOper.Tag in [150, 47, 40, 15])) and ((KpDogId <> 0) or (edPayDate.Date <> 0)) then
    raise Exception.Create(TranslateText('При выбранной операции не должно быть договора!'));

  if(OPER_MOVEFIL = edOper.Tag)and(LblTTN.Caption=TranslateText('ЖДН')) then
  begin
    if edTTN.Text = '' then
      raise Exception.Create(TranslateText('Укажите номер ЖДН!'));
    
    if edDovNum.Text = '' then
      raise Exception.Create(TranslateText('Укажите номер цыстерны!'));
  end;

  if (edOper.Text = '') then
    raise Exception.Create(TranslateText('Укажите операцию!'));

  if (edPack.Text = '') and EdPack.Enabled then
    raise Exception.Create(TranslateText('Паковка обязательна!'));

  if ((edTTN.Enabled) and ( not edTTN.ReadOnly)) and (edTTN.Text = '') then
    raise Exception.Create(TranslateText('Пожалуйста укажите № ТТН!'));

  if (cbRasch.Text = '') and (not cbNotNN.Checked) then
    raise Exception.Create(TranslateText('Пожалуйста укажите Форму расчетов!'));

  if (edOper.Tag = 40) and (edHardware.Text='') then
    raise Exception.Create(TranslateText('При операции "На собств. автотранспорт"')+#13#10+TranslateText('надо обязательно указать автомобиль! (в поле "Тех. средство")'));

  if (Pos(','+IntToStr(edOper.Tag)+',',OPER_OWN_NEEDS)<>0) and
     ((edHardware.Tag=0) and (edPerson.Tag<>0) or (edHardware.Tag<>0) and (edPerson.Tag=0))
  then
    raise Exception.Create(TranslateText('Для тех. средств ОБА поля должны быть введены !'));

  if (edAuto.Tag=0) and (edDriver.Tag<>0) or (edAuto.Tag<>0) and (edDriver.Tag=0) then
    raise Exception.Create(TranslateText('Для ТТН обязательно должны быть введены авто и водитель !'));

  if trunc(edActDate.Date) < edNNSumDog.Tag then
    raise Exception.Create(TranslateText('Нельзя редактировать/создавать отпуск, по которому создана/будет создана НН и ')+#13+
       TranslateText('позже которой созданы другие НН. Вначале удалите НН по этому ')+
       TranslateText('договору, созданные позже.'));

  If (KpDogId = 0) and (Pos(','+IntToStr(edOper.Tag)+',', OPER_NOT_NN)=0) then
  begin
    if edPayDate.Date = 0 then
      raise Exception.Create(TranslateText('К отпуску обязательно надо ввести договор !')+#13#10+
        TranslateText('Вариант 1. При принятии отпуска можно завести договор автоматически - для этого введите дату погашения.')+#13#10+
        TranslateText('Вариант 2. Выберите вручную заранее введенный договор'));
  end
  else if (KpDogId = 0) and (edOper.Tag = OPER_MOVEFIL)then
    raise Exception.Create(TranslateText('Для такого вида операции необходимо создавать договор-заявку в ручную.'));

  // Проверка табличной части

  vAutoDet.DisableControls;
  try
    IsHaveDet := False;
    vAutoDet.First;
    while not vAutoDet.Eof do
    begin
      if vAutoDetLitr.AsFloat <> 0 then
      begin
        IsHaveDet := True;
        if (vAutoDetPart_id.AsInteger <> 0) and (vAutoDetPart_inst.AsInteger <> 0)
          and (GetQValueByIdInst( 'state', 'oil_part', vAutoDetPart_id.AsInteger, vAutoDetPart_inst.AsInteger) = 'N')
        then
          raise Exception.Create(TranslateText('Во время редактирования этого отпуска была удалена (или синхронизирована) партия.')+#13#10+
                      TranslateText('Нажмите ОТМЕНА и отредактируйте партию.'));

        if vAutoDetTo_id.AsInteger = 0 then
          raise Exception.Create(TranslateText('Укажите КОМУ Вы хотите отпустить НП!'));

        if vAutoDetRez_id.AsInteger = 0 then
          raise Exception.Create(TranslateText('Укажите резервуар!'));

        if (vAutoDetUD_Weig.AsFloat = 0) and (not dbgSections.FieldColumns['UD_Weig'].ReadOnly) then
          raise Exception.Create(TranslateText('Укажите плотность!'));

        if (vAutoDetUD_Weig_20.AsFloat = 0) and (not dbgSections.FieldColumns['UD_Weig_20'].ReadOnly) then
          raise Exception.Create(TranslateText('Укажите плотность при 20 градусах!'));

        if (vAutoDetLitr.AsFloat = 0) and (not dbgSections.FieldColumns['Temper'].ReadOnly) and (edOper.Tag = 40) then
          raise Exception.Create(TranslateText('Укажите литры!'));

        if vAutoDetPart_id.AsInteger = 0 then
          raise Exception.Create(TranslateText('Партия НП обязательна!'));

        if (vAutoDetLitr.AsFloat >= 10000000) or (vAutoDetCount.AsFloat >= 10000000) then
          raise Exception.Create(TranslateText('Нельзя реализовать более 10 000 000 литров/тонн!'));

        if (vAutoDetSummNoNDS.AsFloat = 0) and (vAutoDetPart_Own_Good.AsString <> 'S') Then
          raise Exception.Create(TranslateText('Нулевая сумма не допускается!'));

        if vAutoDetCert_name.AsString = '' then
          raise Exception.Create(TranslateText('Укажите сертификат!'));
      end;
      vAutoDet.Next;
    end;
    
    // Проверка на соответствие с договором
    // необходиммо проверить равность (сумму договора по НП) и (Сумму всех отпусков по даному НП)
    if (edKP_Dog.Text <> '') then
    begin
      vt := CreateNpSumTable(Self);
      try
        vt.Open;
        vt.First;
        while not vt.Eof do
        begin
          // Делаем проверку
          qTestDogNN.Close;
          qTestDogNN.ParamByName('DOG_ID').AsInteger   := KpDogId;
          qTestDogNN.ParamByName('DOG_INST').AsInteger := KpDogInst;
          qTestDogNN.ParamByName('NP_ID').AsInteger    := vt.FieldByName('NP_ID').AsInteger;
          qTestDogNN.ParamByName('RAS_INST').AsInteger := KpDogInst;
          qTestDogNN.ParamByName('RASH_SUM').AsFloat   := vt.FieldByName('SUM').AsFloat;
          qTestDogNN.ParamByName('DATE_').AsDateTime   := edActDate.Date;
          qTestDogNN.MacroByName('RAS_IDS').Value      := GetRashIds();
          qTestDogNN.Open;

          if KP_Sub_Type = 12 then
          begin
            if(qTestDogNN.FieldByName('rest_dog_count').AsFloat < FRound(vt.FieldByName('COUNT').AsFloat, 3)) then
              raise Exception.Create(TranslateText('Невозможно принять отпуск.')+#13#10+
                TranslateText('Количество по отпускам по даному товару превышает количество товара по договору !'));
          end
          else if (FRound(qTestDogNN.FieldByName('rest_dog_count').AsFloat, 3) < FRound(vt.FieldByName('COUNT').AsFloat, 3))
            and (qTestDogNN.FieldByName('rest_dog').AsFloat < FRound(vt.FieldByName('SUM').AsFloat))
          then
          begin
            raise Exception.Create(TranslateText('Невозможно принять отпуск.')+#13#10+
              TranslateText('Сумма отпусков по даному товару превышает сумму товара по договору !'));
          end;
          vt.Next;
        end;
      finally
        vt.Free;
      end;
    end; // if (edKP_Dog.Text <> '') then    
  finally
    vAutoDet.EnableControls;
  end;
  if not IsHaveDet then
    raise Exception.Create(TranslateText('Отсутствует табличная часть отпуска !'));

  BalanceQuery.Close;
  BalanceQuery.ParamByName('id').asInteger := KpDogId;
  BalanceQuery.ParamByName('inst').asInteger := KpDogInst;
  BalanceQuery.Open;
  if NN_C then // Предоплатный договор
  begin
    //в зависимости от флага проверять просто оплаты или ихнее НН
    if cbNotNN.Checked then
    begin // проверки по оплатам
      If BalanceQueryBACO.IsNull then
        raise Exception.Create(TranslateText('По этому предоплатному договору предоплата не проводилась. Отпуск запрещен.'))
      else if BalanceQueryBACO.AsCurrency < 0 then
        raise Exception.Create(TranslateText('ПРЕДУПРЕЖДЕНИЕ: По этому предоплатному договору уже отпущено больше, чем оплачено.'))
      else if (BalanceQueryBACO.AsCurrency - StrToFloat(dbgSections.FieldColumns['Summ'].Footers[0].Value) < 0) then
        raise Exception.Create(TranslateText('ПРЕДУПРЕЖДЕНИЕ: Вы пытаетесь отпустить больше, чем предоплачено по этому договору.'));
    end;
  end;
  BalanceQuery.Close;

  // Проверка на соответствие цен
  if (edKP_Dog.Text <> '') and (vAutoDetPriceNoNDS.AsFloat <> 0) and (KP_SUB_TYPE <> 12) then
  begin
    if (MRound(GetKpPriceXNds(), 2) <> MRound(vAutoDetPriceNoNDS.AsCurrency, 2))
      and ((GetKpPriceXNds() <> 0) or (trim(edKPXPrice.Text) <> ''))
    then
    begin
      vAutoDet.Edit;
      vAutoDetPriceNoNDS.AsCurrency := MRound(GetKpPriceXNds(), 4);
      vAutoDet.Post;
      raise Exception.Create(TranslateText('Невозможно принять отпуск.')+#13#10+TranslateText('Цена по отпуску не равна цене в договоре !'));
    end;
  end;

  // Условие удаления НН
  if(cbNotNN.Checked)and(edNN_Num.Visible)then
    if mrCancel = MessageDlg(TranslateText('Будет удалена налоговая накладная №')
      +edNN_Num.Text+TranslateText(' на сумму ')+ edNNSum.Text+'.',mtConfirmation,[mbOk,mbCancel],0)
    then
      raise Exception.Create(TranslateText('Операция отменена пользователем'));

end;

procedure TRashForm.TestAfterSave;
var
  CrtNewDog: boolean;
begin
  CrtNewDog := (KpDogId = 0) and (Pos(','+ IntToStr(edOper.Tag) +',', OPER_NOT_NN) = 0);

  // Проверка табличной части
  vAutoDet.DisableControls;
  try
    vAutoDet.First;
    while not vAutoDet.Eof do
    begin
      if vAutoDetLitr.AsFloat <> 0 then
      begin
        // Проверка остатков партии с подробными собщениями
        if ReadOilVar('PARTTEST') = 'Y' then
        begin
          if not TestPartinEditingAndAdding(
            vAutoDetPart_id.AsInteger, vAutoDetPart_inst.AsInteger, edActDate.Date, vAutoDetCount.AsFloat,
            vAutoDetRash_id.AsInteger, vAutoDetRash_inst.AsInteger, edOper.Tag, vAutoDetRash_id.AsInteger = 0)
          then
            raise Exception.Create(TranslateText('Операция отменена'));
        end;

        // Проверка остатков
        if (MainForm.PartRest(vAutoDetPart_id.AsInteger, vAutoDetPart_inst.AsInteger) < 0)
          or (MainForm.RezRest(vAutoDetRez_id.AsInteger, vAutoDetRez_inst.AsInteger) < 0)
          or (MainForm.PartRezRest(vAutoDetPart_id.AsInteger, vAutoDetPart_inst.AsInteger,
            vAutoDetRez_id.AsInteger, vAutoDetRez_inst.AsInteger) < 0)
        then
        begin // Остаток где-либо < 0 - все откатываем
          If CrtNewDog then
            sbClearDogClick(nil);
          raise Exception.Create( TranslateText('Эта операция приводит к отрицательным остаткам и не может быть выполнена!'))
        end;
      end;
      vAutoDet.Next;
    end;
  finally
    vAutoDet.EnableControls;
  end;

  // Если это отпуск дебетору - вывалить пугающую форму с фамилиями
  if not ConfirmSaleToDeadbeat(SaleToDeadbeat) then
    raise Exception.Create(TranslateText('Операция отмененна'));
end;

function TRashForm.GetRashIds: string;
var
  vt: TVirtualTable;
begin
  vt := TVirtualTable.Create(nil);
  try
    vt.Assign(vAutoDet);
    vt.Open;
    Result := '0';
    vt.First;
    while not vt.Eof do
    begin
      if vt.FieldByName('Rash_id').AsString <> '' then
        Result := Result + ',' + vt.FieldByName('Rash_id').AsString;
      vt.Next;
    end;
  finally
    vt.Free
  end;
end;

function TRashForm.CreateNpSumTable(Owner: TComponent): TVirtualTable;
var
  vt: TVirtualTable;
begin
  Result := TVirtualTable.Create(Owner);
  Result.AddField('NP_ID', ftInteger);
  Result.AddField('SUM',   ftFloat);
  Result.AddField('SUMMNONDS', ftFloat);
  Result.AddField('COUNT', ftFloat);
  Result.Open;
  vt := TVirtualTable.Create(nil);
  try
    vt.Assign(vAutoDet);
    vt.IndexFieldNames := 'NP_ID';
    vt.Open;
    vt.First;
    Result.Append;
    Result.FieldByName('NP_ID').AsInteger := vt.FieldByName('NP_ID').AsInteger;
    Result.FieldByName('SUM').AsFloat := 0;
    Result.FieldByName('SUMMNONDS').AsFloat := 0;
    Result.FieldByName('COUNT').AsFloat := 0;    
    while not vt.Eof do
    begin
      if Result.FieldByName('NP_ID').AsInteger = vt.FieldByName('NP_ID').AsInteger then
      begin
        Result.FieldByName('SUM').AsFloat := Result.FieldByName('SUM').AsFloat + vt.FieldByName('Summ').AsFloat;
        Result.FieldByName('SUMMNONDS').AsFloat := Result.FieldByName('SUMMNONDS').AsFloat + vt.FieldByName('SUMMNONDS').AsFloat;
        Result.FieldByName('COUNT').AsFloat := Result.FieldByName('COUNT').AsFloat + vt.FieldByName('COUNT').AsFloat;
      end;

      if (Result.FieldByName('NP_ID').AsInteger <> vt.FieldByName('NP_ID').AsInteger)then
      // Делаем проверку
      begin
        Result.Append;
        Result.FieldByName('NP_ID').AsInteger := vt.FieldByName('NP_ID').AsInteger;
        Result.FieldByName('SUM').AsFloat := 0;
        Result.FieldByName('SUMMNONDS').AsFloat := 0;
        Result.FieldByName('COUNT').AsFloat := 0;
        Continue;
      end;
      vt.Next;
    end;
    Result.Post;
    Result.Close;
  finally
    vt.Free;
  end;     
end;

procedure TRashForm.sbDelClick(Sender: TObject);
begin
  inherited;
  if not vAutoDet.IsEmpty then
    vAutoDet.Delete;
end;

function TRashForm.GetKpValue(AFieldName: string): Double;
begin
  qDog.Locate('np_type', vAutoDetNP_id.AsInteger, []);
  if qDog.FieldByName('np_type').AsInteger = vAutoDetNP_id.AsInteger then
    Result := qDog.FieldByName(AFieldName).AsFloat
  else
    Result := 0;
end;

function TRashForm.GetKpPriceNds: Double;
begin
  Result := GetKpValue('price_nds');
end;

function TRashForm.GetKpPriceXNds: Double;
begin
  Result := GetKpValue('price_x_nds');
end;

function TRashForm.GetKpCount: Double;
begin
  Result := GetKpValue('litr');
end;

function TRashForm.GetKpSumNds: Double;
begin
  Result := GetKpValue('summ_nds');
end;

procedure TRashForm.vAutoDetReisNumChange(Sender: TField);
begin
  if not IsShow then exit;
  if vAutoDetReisNum.AsString = '' then exit;

  qAutoNum.Filtered := false;
  qAutoNum.Filter   := 'POSITION = '''+ vAutoDetReisNum.AsString +'''';
  qAutoNum.Filtered := true;

  try
    if qAutoNum.IsEmpty then
    begin
      vAutoDetAuto_Det_id.Clear;
      vAutoDetAuto_Det_inst.Clear;
      vAutoDetReisNum.Clear;
    end
    else
    begin
      vAutoDetAuto_Det_id.AsInteger   := qAutoNum.FieldByName('id').AsInteger;
      vAutoDetAuto_Det_inst.AsInteger := qAutoNum.FieldByName('inst').AsInteger;
      vAutoDetCapaCity.AsInteger      := qAutoNum.FieldByName('CAPACITY').AsInteger;
    end;
  finally
    qAutoNum.Filtered := false;
  end;
end;

end.
