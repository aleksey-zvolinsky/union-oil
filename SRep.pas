{*******************************************************************************

Oil_SRTalon.DB  - талони по даному змінному звіту
Oil_SRTalonT.DB - редаговані талони по даному змінному звіту

*******************************************************************************}

unit SRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ICoList, StdCtrls, Buttons, ComCtrls, ToolEdit, Mask, Grids,
  DBGrids, RXDBCtrl, CurrEdit, Db, DBTables, Menus, DBCtrls, DBCtrlsEh, MemDS,
  StrUtils, SRTalon, RXCtrls, RashRef, DBGridEh, RXSpin, math, DBSumLst, Ora,
  uHelpButton, Placemnt, uCommonForm, uOilQuery, uOilStoredProc, DBAccess,
  MemTable, SrFiltr{$IFDEF VER150}, Variants{$ENDIF}, ztvUnZIP, uCrypt, ztvGbls,
  ActnList, PacketClass, VirtualTable, RxLookup, RxDBComb, GridsEh, ztvConsts,
  DBGridEhGrouping;

type
  TSRepForm = class(TCommonForm)
    pData: TPanel;
    l1: TLabel;
    l3: TLabel;
    l4: TLabel;
    l5: TLabel;
    nb: TNotebook;
    gbPrih: TGroupBox;
    pPrih: TPanel;
    bbRealization: TBitBtn;
    bbCancel: TBitBtn;
    gbRash: TGroupBox;
    pRash: TPanel;
    bbIncas: TBitBtn;
    bbPrevious: TBitBtn;
    bbPrihPrev: TBitBtn;
    gbIncas: TGroupBox;
    pSave: TPanel;
    bbRashPrev: TBitBtn;
    bbCloseSR: TBitBtn;
    bbOk: TBitBtn;
    dbgPrihod: TDBGridEh;
    dbgRashod: TDBGridEh;
    dsRash: TDataSource;
    pmRash: TPopupMenu;
    N1: TMenuItem;
    Table3: TTable;
    Table4: TTable;
    N2: TMenuItem;
    Table5: TTable;
    gbBezNal: TGroupBox;
    CurrencyEdit5: TCurrencyEdit;
    Label12: TLabel;
    sbDelRash: TSpeedButton;
    lMoneyTal: TLabel;
    ceMoneyTal: TCurrencyEdit;
    Label14: TLabel;
    CurrencyEdit7: TCurrencyEdit;
    qPriv: TQuery;
    qRashAddPART: TOilQuery;
    qRashEditPART: TOilQuery;
    qRashTalon: TOilQuery;
    qRashOther: TOilQuery;
    l6: TLabel;
    l7: TLabel;
    N3: TMenuItem;
    dbeSmenaNum: TDBEdit;
    qWork: TOilQuery;
    qPrih: TOilQuery;
    dsPrih: TOraDataSource;
    qCheckDoublePrih: TOilQuery;
    lAutoCalc: TLabel;
    qPrevRest: TOilQuery;
    dbceAZSName: TRxDBComboEdit;
    dbceEmpName: TRxDBComboEdit;
    odPacket: TOpenDialog;
    l2: TLabel;
    dbeRepNum: TDBEdit;
    Label10: TLabel;
    curAmountLitr: TCurrencyEdit;
    pmLoadPrih: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N4: TMenuItem;
    gbAll: TGroupBox;
    Label5: TLabel;
    ceSTART: TCurrencyEdit;
    Label6: TLabel;
    ceGET: TCurrencyEdit;
    Label7: TLabel;
    ceOUT: TCurrencyEdit;
    Label8: TLabel;
    ceEND: TCurrencyEdit;
    gbSM: TGroupBox;
    cedShtukiKassa: TCurrencyEdit;
    Label17: TLabel;
    cedShtukiSum: TCurrencyEdit;
    Label18: TLabel;
    N7: TMenuItem;
    Excel1: TMenuItem;
    Label22: TLabel;
    cedOstEndSht: TCurrencyEdit;
    Label23: TLabel;
    cedOstBeginSht: TCurrencyEdit;
    gbNp: TGroupBox;
    Label20: TLabel;
    cedOstBeginNp: TCurrencyEdit;
    Label21: TLabel;
    cedNPKassa: TCurrencyEdit;
    Label19: TLabel;
    cedNpSum: TCurrencyEdit;
    Label15: TLabel;
    cedOstEndNp: TCurrencyEdit;
    lRealRest: TLabel;
    lRealKassa: TLabel;
    lOstCapt: TLabel;
    lKassaCapt: TLabel;
    qRashSop: TOilQuery;
    sbSumRash: TSpeedButton;
    sbHod: TRxSpinButton;
    sbCloseDetails: TSpeedButton;
    OilHelpButton: TOilHelpButton;
    FormStorage: TFormStorage;
    gbStrPol: TGroupBox;
    Label24: TLabel;
    cedAddMoney: TCurrencyEdit;
    uPrih: TOraUpdateSQL;
    mtSkidka: TMemoryTable;
    mtSkidkaSTYPE: TIntegerField;
    mtSkidkaLITR: TFloatField;
    mtSkidkaPRICE: TFloatField;
    mtSkidkaSUMM: TFloatField;
    mtSkidkaSKIDKA: TFloatField;
    mtSkidkaNP_ID: TIntegerField;
    mtSkidkaZAKAZ: TFloatField;
    mtSkidkaORG_ID: TIntegerField;
    qRashVed: TOilQuery;
    sbLoadPrihTalon: TRxSpeedButton;
    pmLoadRash: TPopupMenu;
    miLoadPrihTalon: TMenuItem;
    qRashEditAVERAGE: TOilQuery;
    qPrivAdd: TQuery;
    qOstAVERAGE: TOilQuery;
    ActionList: TActionList;
    actOther: TAction;
    actNal: TAction;
    actVed: TAction;
    actPrih: TAction;
    actRash: TAction;
    actIncas: TAction;
    actSave: TAction;
    actE: TAction;
    actDelRash: TAction;
    sbSumPrih: TSpeedButton;
    actFilter: TAction;
    Table2: TVirtualTable;
    Table2IsShtuki: TStringField;
    Table2Part_name: TStringField;
    Table2SubPart_Name: TIntegerField;
    Table2NPType_Name: TStringField;
    Table2NP_GRP: TIntegerField;
    Table2Goal_Part_Type: TIntegerField;
    Table2NP_TYPE_ID: TIntegerField;
    Table2Us_SubGroup_Id: TIntegerField;
    Table2bSkidka: TBooleanField;
    Table2Own_good: TStringField;
    Table2TTN_Date: TDateField;
    Table2TTN_ID: TIntegerField;
    Table2TTN_INST: TIntegerField;
    Table2Ud_weig: TFloatField;
    Table2N_Price: TFloatField;
    Table2NAL: TFloatField;
    Table2Nal_Money: TCurrencyField;
    Table2VED: TFloatField;
    Table2TALON: TFloatField;
    Table2SN: TFloatField;
    Table2Other: TFloatField;
    Table2Other_Weight: TFloatField;
    Table2Litr: TFloatField;
    Table2Base: TFloatField;
    Table2C_count: TFloatField;
    Table2C_Litr: TFloatField;
    Table2CCount: TFloatField;
    vTable3: TVirtualTable;
    vTable4: TVirtualTable;
    vTable5: TVirtualTable;
    pLog: TPanel;
    mLog: TMemo;
    qAddRash: TOilQuery;
    l8: TLabel;
    dbdeRepDateEnd: TDBDateTimeEditEh;
    dbdeRepDate: TDBDateTimeEditEh;
    pSections: TPanel;
    p1: TPanel;
    dbgSections: TDBGridEh;
    Splitter: TSplitter;
    qSections: TOilQuery;
    dsSections: TOraDataSource;
    qSectionsSQL: TOilQuery;
    dsSectionsSQL: TOraDataSource;
    p2: TPanel;
    sbDel: TSpeedButton;
    sbAdd: TRxSpeedButton;
    pLoadFromFile: TPanel;
    bbLoadFromFile: TBitBtn;
    pSectionsButton: TPanel;
    sbSections: TSpeedButton;
    pLogButton: TPanel;
    sbLog: TSpeedButton;
    bbSectionPrint: TBitBtn;
    dblcSections: TRxDBLookupCombo;
    Table2bEdited: TBooleanField;
    miOnlyRash: TMenuItem;
    N8: TMenuItem;
    procedure actPrihExecute(Sender: TObject);
    procedure actIncasExecute(Sender: TObject);
    procedure ceSTARTKeyPress(Sender: TObject; var Key: Char);
    procedure dbgRashodKeyPress(Sender: TObject; var Key: Char);
    procedure dbeSmenaNumKeyPress(Sender: TObject; var Key: Char);
    procedure dbgPrihodEditButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgRashodEditButtonClick(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure ceSTARTChange(Sender: TObject);
    procedure Table2CalcFields(DataSet: TDataSet);
    procedure Table2BeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure pmRashPopup(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure actDelRashExecute(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure dbgPrihodExit(Sender: TObject);
    procedure qPrihAfterPost(DataSet: TDataSet);
    procedure qPrihBeforeDelete(DataSet: TDataSet);
    procedure dbgRashodExit(Sender: TObject);
    procedure dbceAZSNameDblClick(Sender: TObject);
    procedure dbceEmpNameDblClick(Sender: TObject);
    procedure Table2NALValidate(Sender: TField);
    procedure bbLoadFromFileClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure dbgPrihodColEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure cedOstBeginShtChange(Sender: TObject);
    procedure cedOstBeginNpChange(Sender: TObject);
    procedure dbgRashodGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure sbSumRashClick(Sender: TObject);
    procedure sbHodTopClick(Sender: TObject);
    procedure sbHodBottomClick(Sender: TObject);
    procedure sbCloseDetailsClick(Sender: TObject);
    procedure cedAddMoneyChange(Sender: TObject);
    procedure miLoadPrihTalonClick(Sender: TObject);
    procedure LoadPrihTalon(PrihID, PrihINST: integer);
    procedure actOtherExecute(Sender: TObject);
    procedure actNalExecute(Sender: TObject);
    procedure actVedExecute(Sender: TObject);
    procedure dbgRashodMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure actRashExecute(Sender: TObject);
    procedure sbSumPrihClick(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure Table2FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure qPrihFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure dbgPrihodGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure dbdeRepDateExit(Sender: TObject);
    procedure dbdeRepDateEndExit(Sender: TObject);
    procedure dbdeRepDateEnter(Sender: TObject);
    procedure sbLogClick(Sender: TObject);
    procedure sbSectionsClick(Sender: TObject);
    procedure dblcSectionsCloseUp(Sender: TObject);
    procedure bbSectionPrintClick(Sender: TObject);
    procedure dbdeRepDateEndEnter(Sender: TObject);
    procedure Table2AfterEdit(DataSet: TDataSet);
    procedure Table2AfterPost(DataSet: TDataSet);
    procedure miOnlyRashClick(Sender: TObject);
  private
    TalonDepID, TalonDepINST: integer; // кому приходують талони
    strMessageLog: string;
    rash: TRashRefForm;
    Talon: TSRTalonForm;
    IsCreateRashForm, IsShowDRD {реалізація вже відображена}: boolean;
    NpList: string;
    Packet: TPacket;

    procedure AutoCalcNal(NPGrpId, Litr, Price, Summ, Skidka: Variant);
    procedure AutoCalcST(NPTypeId, Litr, Price, Summ, OperId: Variant);
    procedure AutoCalcVed(OrgId, OrgInst: integer; NPGrpId, Litr, Price, Summ: Variant);
    function AutoCalcTalon(NPGrpId, Litr, Ser, Num: Variant; ABarCode: string;
      InTheWay: integer): Currency;
    procedure AutoCalcOther(OperId, OrgId, OrgInst, NPGrpId, Litr, Price, Auto_Id, Employ_Id, Summ: Variant);
    procedure AutoCalcCard(NPGrpId, Litr, Price, Summ: Variant);
    procedure AutoCalcShtuki(NPId, Litr, Price, Summ: Variant);

    procedure GetEmp(p_AZS_ID, p_EMP_ID: integer);
    procedure GetRestLitr(var v_OstEnd: Currency; var v_Litr: Variant);
    function GetOperFromTypePay(p_TYPE_PAY: integer): integer; // отримуємо операцію із типу виплати
    procedure GetRashod(); // реалізація
    procedure GetRashodPrev(); // назад до реалізації
    procedure GetInfSumm(); // отримання загальної суми

    procedure GetLogMes(sMes: string); // лог/повідомлення
    procedure GetLogExc(sMes: string); // лог/помилка
    procedure GetExcMes(sMes: string); // помилка/повідомлення

    procedure TestSRepDateTime(); // перевірка дати та часу
    procedure TestSRepDateSmena(); // перевірка дати та номеру зміни

    procedure SrTalonFormOne(Talon: TSRTalonForm);
    procedure SrTalonFormTwo(Talon: TSRTalonForm);
    procedure SetGridScale(K: integer);
    function IsZeroOrLargeMinimal(Value1, Value2: Currency; bAll: boolean=true): Boolean;
    function IsLargeZero(d: integer): Boolean; // є більшим 0 (нуля)
    function AddRecord(p_NpGrp_Id, p_NpType_Id: integer): boolean; // добавляємо реалізацію

    procedure SaveSRTalons  (p_TTN_ID, p_TTN_INST, p_RASH_ID          : integer; p_Ud_Weig: Currency); // Занесение реализации по талонам
    procedure SaveVedomost  (p_TTN_ID, p_TTN_INST, p_RASH_ID          : integer; p_Ud_Weig: Currency); // Занесение реализации по ведомости
    procedure SaveDROther   (p_TTN_ID, p_TTN_INST, p_RASH_ID, p_NPG_ID: integer; p_Ud_Weig, p_PRICE: Currency); // Занесение реализации по прочим операциям
    procedure SaveOtherCount(p_TTN_ID, p_TTN_INST                     : integer; p_Ud_Weig: Currency); // Занесение реализации по прочим операциям у файл DB
    procedure SavePRTalons(); // Занесение реализации по талонам
    procedure SaveDRData(var RashId: integer);
    procedure SaveClearDRData();
    procedure SaveDRMoney(); // Занесение движения по кассе
    procedure SaveDeltaDRData(p_RashId: integer); // Занесение дельты реализации при закрытии подпартии
    procedure SaveDelete(); // Удаление старой реализации по сменному отчету
    procedure SaveAZS(); // збереження даних по АЗС
    procedure SaveRESAVE(); // збереження позначки про необхідність повторного переприйняття змінних звітів
    procedure SaveRest(); // збереження залишків на кінець місяця
    procedure log(s: string);
  protected
    procedure LoadPrih(Sender: TObject);
  public
    IsPacketLoaded: boolean; // завантаження пакету
    mode: Integer;
    StrBuff: string;
    CurBookMark: TBookmark;
    SList: TStringList; // пакет із АЗС
    DogEdit, bLoadMyPack {Загружать только свои пакеты}: Boolean;
    SrepKorrPercent: Currency;
    StartDateTime: TDateTime;
    FF: TSrFiltrForm;
    function StrToFloat(AValue: string): real;
    function OpenFileSRep(sFileName: string; var SL: TStringList): string; // завантаження файлу
    function DateTimeIsCorrect(DateTimeStr: string; var ErrMsg: string): boolean;
    function Get1000(): integer;

    procedure GetSupplierPrih(var p_id, p_inst: integer); // знаходимо постачальника
    procedure SaveSection(
      p_Rep_Id, p_Rep_Inst: integer;
      p_TableOil, p_Section, p_TableOilF, p_SectionF: string;
      Packet: TPacket); // Збереження даних із секцій
  end;

var
  SMRep: TSRepForm;

const
  MINIMAL_REST = 1;

implementation

{$R *.DFM}

uses ChooseOrg, Main, EmpRef, uDBFunc, OilSTD, AutoCalc, SVedom, SOther, SRepRef,
  ExcelFunc, ExFunc, uMessageDlgExt, uOrgChangeDetails, Progr, TalonPrih, Memo,
  ztvBase, wcrypt2, SRepAutoLoad;

var
  GPT_Auto: string;

{$IFDEF VER150}
function DelChars(const S: string; Chr: Char): string;
var
  I: Integer;
begin
  Result := S;
  for I := Length(Result) downto 1 do begin
    if Result[I] = Chr then Delete(Result, I, 1);
  end;
end;

function DelSpace(const S: String): string;
begin
  Result := DelChars(S, ' ');
end;
{$ENDIF}

//==============================================================================
function TSRepForm.Get1000(): integer;
begin
  result := decode([Table2IsShtuki.AsString, 'Y', 1, 1000]);
end;
//==============================================================================
function IsGPTCorrect(p_Type: integer; p_DopTypes: string = ''): Boolean;
var
  s: string;
begin
  s := GPT_Auto;
  if p_DopTypes <> '' then s := s + p_DopTypes +',';
  result := pos(','+ IntToStr(p_Type) +',', s) > 0;
end;
//==============================================================================
procedure TSRepForm.GetRestLitr(var v_OstEnd: Currency; var v_Litr: Variant);
// залишок літрів, тільки для автокалькуляції
begin
  if not ((Table2IsShtuki.AsString = 'N') and DR_AUTOLOAD
    and (dbeRepNum.DataSource.DataSet.FieldByName('AUTO_LOAD').AsString = 'P')
    and IsAVERAGE(dbdeRepDate.Value)) then
    if Table2C_Litr.AsFloat < v_Litr then
    begin
      v_OstEnd := v_Litr - Table2C_Litr.AsFloat;
      v_Litr := Table2C_Litr.AsFloat;
    end;
end;
//==============================================================================
// Процедура автоматического разнесения реализации за наличные
procedure TSRepForm.AutoCalcNal(NPGrpId, Litr, Price, Summ, Skidka: Variant);
var
  ostEnd, Delta: Currency;
begin
  Table2.DisableControls;
  try
    if not AddRecord(NPGrpId, 0) then exit; // добавляємо реалізацію

    if Summ = 0 then
      Summ := MRound(Litr * Price, 2);
    Delta := Summ - MRound(Litr * Price, 2);
    Table2.First;
    while not Table2.Eof do
    begin
      if ((Table2NP_GRP.AsInteger = NPGrpId) or
        ((Table2NP_GRP.AsInteger = 4) and (NPGrpId = 5)) or ((Table2NP_GRP.AsInteger = 5) and (NPGrpId = 4))
        ) and // списати можна із партії яка не "хранение" і яка не "Собственный" і "Излишки"
        not (((Table2Goal_Part_Type.AsInteger = 10) and (Table2Own_good.AsString = 'O')) or
        (Table2Own_good.AsString = 'S')) and IsLargeZero(Table2C_Litr.AsInteger) and
        IsZeroOrLargeMinimal(Table2C_Litr.AsFloat, Litr) and (Table2Base.AsInteger = 0) and
        IsGPTCorrect(Table2Goal_Part_Type.AsInteger) then
      begin
        Table2.Edit;
        ostEnd := 0;
        GetRestLitr(ostEnd, Litr); // залишок літрів, тільки для автокалькуляції
        if Price > 0 then Table2N_Price.AsFloat := Price;
        Table2NAL.AsFloat := Table2NAL.AsFloat + Litr;
        // скидка
        Table2bSkidka.AsBoolean := decode([Skidka, 0, false, true]);

        if ostEnd = 0 then Table2Nal_Money.AsFloat := Table2Nal_Money.AsFloat + Delta;
        Litr := ostEnd;
        Table2.Post;
      end;
      if Litr = 0 then Break;
      Table2.Next;
    end;
  finally
    Table2.EnableControls;
    GetInfSumm(); // отримання загальної суми

    if (Litr > 0) or (Table2C_Litr.AsFloat < 0) then
    begin
      if Table2C_Litr.AsFloat < 0 then
        Litr := - Table2C_Litr.AsFloat;
      GetLogMes(TranslateText('Невозможно реализовать ') + FloatToStrF(Litr, ffFixed, 15, 3) +
        TranslateText(' литров! (Группа НП: ')+ VarToStr(NPGrpId) +', '+ GetNpGName(NPGrpId) +')');
    end;

    if Skidka <> 0 then
      GetLogMes(TranslateText('Скидка на АЗС: ')+ FloatToStrF(Skidka, ffFixed, 15, 2) +
        TranslateText(' ! (Группа НП: ')+ VarToStr(NPGrpId) +', '+ GetNpGName(NPGrpId) +')');
  end;
end;
//==============================================================================
// Процедура автоматического разнесения реализации за наличные
procedure TSRepForm.AutoCalcShtuki(NPId, Litr, Price, Summ: Variant);
var
  ostEnd, Delta: Currency;
begin
  Delta := Summ - mround(Litr * Price, 2);
  Table2.DisableControls;
  try
    if not AddRecord(0, NPId) then exit; // добавляємо реалізацію

    Table2.First;
    while not Table2.Eof do
    begin
      if (Table2NP_TYPE_ID.AsInteger = NPId) and IsLargeZero(Table2C_Litr.AsInteger)
        and // списати можна із партії яка не "хранение" і яка не "Собственный" і "Излишки"
        not (((Table2Goal_Part_Type.AsInteger = 10) and (Table2Own_good.AsString = 'O')) or
        (Table2Own_good.AsString = 'S')) and (Table2Base.AsInteger = 1) then
      begin
        Table2.Edit;
        ostEnd := 0;
        GetRestLitr(ostEnd, Litr); // залишок літрів, тільки для автокалькуляції
        if VarAsType(Price, varCurrency) > 0 then Table2N_Price.AsFloat := Price;
        Table2NAL.AsFloat := Table2NAL.AsFloat + Litr;
        if ostEnd = 0 then Table2Nal_Money.AsFloat := Table2Nal_Money.AsFloat + Delta;
        Litr := ostEnd;
        Table2.Post;
      end;
      if Litr = 0 then Break;
      Table2.Next;
    end;
  finally
    Table2.EnableControls;
    GetInfSumm(); // отримання загальної суми

    if (Litr > 0) or (Table2C_Litr.AsFloat < 0) then
    begin
      if Table2C_Litr.AsFloat < 0 then
        Litr := - Table2C_Litr.AsFloat;
      GetLogMes(TranslateText('Невозможно реализовать ') + FloatToStrF(Litr, ffFixed, 15, 3) +
        TranslateText(' шт выбранного товара! (Тип НП: ')+ VarToStr(NPId) +', '+ GetNpName(NPId) +')');
    end;
  end;
end;
//==============================================================================
// Процедура автоматического разнесения реализации сопутствующих товаров
procedure TSRepForm.AutoCalcST(NPTypeId, Litr, Price, Summ, OperId: Variant);
var
  ostEnd, Delta: Currency;
begin
  if Price <= 0 then // беремо ціну із БД
    Price := GetSqlValueParSimple(
      'select to_number(substr(max(to_char(date_on, ''YYYYMMDD'') || price), 9)) from oil_np_price' +
      ' where org_id = :org_id and org_inst = :org_inst' +
      '   and np_id = :np_id',
      ['org_id',   INST,
       'org_inst', INST,
       'np_id',    NPTypeId]);

  Delta := Summ - MRound(Litr * Price, 2);
  Table2.DisableControls;
  try
    if not AddRecord(0, NPTypeId) then exit; // добавляємо реалізацію

    Table2.First;
    while not Table2.Eof do
    begin
      if (Table2NP_TYPE_ID.AsInteger = NPTypeId)
        and ((Table2IsShtuki.AsString = 'Y') or (pos(','+ NPTypeId +',', ReadOilVar('LOAD_NP_TYPE_ST')) > 0))
        and IsLargeZero(Table2C_Litr.AsInteger) and IsZeroOrLargeMinimal(Table2C_Litr.AsFloat, Litr)
        and // списати можна із партії яка не "хранение" і яка не "Собственный" і "Излишки"
        not (((Table2Goal_Part_Type.AsInteger = 10) and (Table2Own_good.AsString = 'O')) or
          (Table2Own_good.AsString = 'S')) and IsGPTCorrect(Table2Goal_Part_Type.AsInteger, '12') then
      begin
        Table2.Edit;

        ostEnd := 0;
        GetRestLitr(ostEnd, Litr); // залишок літрів, тільки для автокалькуляції

        if Price > 0 then
          Table2N_Price.AsFloat := Price;

        if OperId = -1 then // налічка
        begin
          Table2NAL.AsFloat := Table2NAL.AsFloat + Litr;
          if ostEnd = 0 then
            Table2Nal_Money.AsFloat := Table2Nal_Money.AsFloat + Delta;
        end
        else // операція
        begin
          qPriv.Close;
          qPriv.SQL.Text :=
            'insert into "Oil_SROther.db" (TTN_Id, TTN_Inst, Oper_Id, Oper_Name, Litr, Price, Count_T, Amount) ' +
            'values (:TTNId, :TTNInst, :OperId, :OperName, :Litr, :Price, :CountT, :Amount)';
          qPriv.ParamByName('TTNId').DataType := ftInteger;
          qPriv.ParamByName('TTNInst').DataType := ftInteger;
          qPriv.ParamByName('TTNId').Value := Table2TTN_ID.AsInteger;
          qPriv.ParamByName('TTNInst').Value := Table2TTN_INST.AsInteger;

          qPriv.ParamByName('OperId').DataType := ftInteger;
          qPriv.ParamByName('OperId').Value := OperId;
          qPriv.ParamByName('OperName').DataType := ftString;
          qPriv.ParamByName('OperName').Value := GetOperationName(OperId);

          qPriv.ParamByName('Litr').DataType := ftFloat;
          qPriv.ParamByName('Price').DataType := ftFloat;
          qPriv.ParamByName('CountT').DataType := ftFloat;
          qPriv.ParamByName('Amount').DataType := ftFloat;
          qPriv.ParamByName('Litr').AsFloat := Litr;
          qPriv.ParamByName('Price').AsFloat := Price;
          qPriv.ParamByName('CountT').AsFloat := MRound(Table2Ud_weig.AsFloat * Litr / Get1000, DR_ROUND_COUNT);
          qPriv.ParamByName('Amount').Value := Summ;
          qPriv.ExecSQL;

          qPriv.Close;
          qPriv.SQL.Text := 'select sum(Litr) from "Oil_SROther.db" ' +
            ' where TTN_Id = '+ Table2TTN_ID.AsString +' and TTN_Inst = '+ Table2TTN_INST.AsString;
          qPriv.Open;

          Table2Other.AsFloat := qPriv.Fields[0].AsFloat;
        end;

        Litr := ostEnd;
        Table2.Post;
      end;
      if Litr = 0 then Break;
      Table2.Next;
    end;
  finally
    Table2.EnableControls;
    GetInfSumm(); // отримання загальної суми

    if (Litr > 0) or (Table2C_Litr.AsFloat < 0) then
    begin
      if Table2C_Litr.AsFloat < 0 then
        Litr := - Table2C_Litr.AsFloat;
      GetLogMes(TranslateText('Невозможно реализовать ') + FloatToStrF(Litr, ffFixed, 15, 3) +
        TranslateText(' л/шт ! (Тип НП: ') + VarToStr(NPTypeId) +', '+ GetNpName(NPTypeId) +')');
    end;
  end;
end;
//==============================================================================
// Процедура автоматического разнесения реализации по ведомости
procedure TSRepForm.AutoCalcVed(OrgId, OrgInst: integer; NPGrpId, Litr, Price, Summ: Variant);
var
  ostEnd, Delta: Currency;
  DogId, DogInst: integer;
  DogName, OrgName: string;
begin
  DogId   := 0;
  DogInst := 0;
  DogName := '';

  Delta := Summ - mround(Litr * Price, 2);
  if OrgName = '' then OrgName := GetOrgName(OrgId, OrgInst);

  qWork.Close;
  if (OrgId <> 0) and (OrgInst <> 0) then
  begin
    qWork.SQL.Text :=
      'select Id, Inst, Dog from Oil_Dog' +
      ' where State = ''Y'' and Dog_Type = ''V''' +
      '   and To_ = :to_id and To_Inst = :to_inst' +
      ' order by Dog_Date desc';
    _OpenQueryPar(qWork, ['to_id', OrgId, 'to_inst', OrgInst]);
  end;

  // якщо не вказана організація або договір не знайдений
  if ((OrgId = 0) and (OrgInst = 0)) or (qWork.IsEmpty) then
  begin
    qWork.Close;
    qWork.SQL.Text :=
      'select Id, Inst, Dog from Oil_Dog' +
      ' where State = ''Y'' and Dog_Type = ''V''' +
      '   and To_ = '+ IntToStr(AVIAS_ID) +' and To_Inst = '+ IntToStr(AVIAS_INST) +
      ' order by Dog_Date desc';
    _OpenQuery(qWork);

    // якщо договір знайдений
    if not qWork.IsEmpty then
    begin
      OrgId   := AVIAS_ID;
      OrgInst := AVIAS_INST;
      OrgName := GetOrgName(OrgId, OrgInst);
    end;
  end;

  if qWork.IsEmpty then
    GetLogMes(TranslateText('Договор по ведомости не определен для ID клиента '+ IntToStr(OrgId) +' !'))
  else
  begin // якщо договір знайдений
    DogId := qWork.FieldByName('Id').Value;
    DogInst := qWork.FieldByName('Inst').Value;
    DogName := qWork.FieldByName('Dog').Value;
  end;
  qWork.Close;

  Table2.DisableControls;
  try
    if not AddRecord(NPGrpId, 0) then exit; // добавляємо реалізацію

    Table2.First;
    while not Table2.Eof do
    begin
      if ((Table2NP_GRP.AsInteger = NPGrpId) or
        ((Table2NP_GRP.AsInteger = 4) and (NPGrpId = 5)) or ((Table2NP_GRP.AsInteger = 5) and (NPGrpId = 4))
        ) and // списати можна із партії яка не "хранение" і яка не "Собственный" і "Излишки"
        not (((Table2Goal_Part_Type.AsInteger = 10) and (Table2Own_good.AsString = 'O')) or
        (Table2Own_good.AsString = 'S')) and IsLargeZero(Table2C_Litr.AsInteger) and
        (Table2Base.AsInteger = 0) and IsGPTCorrect(Table2Goal_Part_Type.AsInteger) then
      begin
        Table2.Edit;
        ostEnd := 0;
        GetRestLitr(ostEnd, Litr); // залишок літрів, тільки для автокалькуляції

        qPriv.Close;
        qPriv.SQL.Text := 'insert into "Oil_Vedomost.db" (TTN_Id, TTN_Inst, Org_Id, Org_Inst, Org_Name, Dog_Id, Dog_Inst, Dog_Name, Litr, Price, Count_T, Amount) ' +
          ' Values(:TTNId, :TTNInst, :OrgId, :OrgInst, :OrgName, :DogId, :DogInst, :DogName, :Litr, :Price, :CountT, :Amount)';
        qPriv.ParamByName('TTNId').AsInteger := Table2TTN_ID.AsInteger;
        qPriv.ParamByName('TTNInst').AsInteger := Table2TTN_INST.AsInteger;

        // організація
        qPriv.ParamByName('OrgId').DataType := ftInteger;
        qPriv.ParamByName('OrgInst').DataType := ftInteger;
        qPriv.ParamByName('OrgName').DataType := ftString;
        if (OrgId <> 0) and (OrgInst <> 0) then
        begin
          qPriv.ParamByName('OrgId').AsInteger   := OrgId;
          qPriv.ParamByName('OrgInst').AsInteger := OrgInst;
          qPriv.ParamByName('OrgName').AsString  := GetOrgName(OrgId, OrgInst);
        end
        else
        begin
          qPriv.ParamByName('OrgId').Clear;
          qPriv.ParamByName('OrgInst').Clear;
          qPriv.ParamByName('OrgName').Clear;
        end;

        // договір
        qPriv.ParamByName('DogId').DataType := ftInteger;
        qPriv.ParamByName('DogInst').DataType := ftInteger;
        qPriv.ParamByName('DogName').DataType := ftString;
        if (DogId <> 0) and (DogInst <> 0) then
        begin
          qPriv.ParamByName('DogId').AsInteger   := DogId;
          qPriv.ParamByName('DogInst').AsInteger := DogInst;
          qPriv.ParamByName('DogName').AsString  := DogName;
        end
        else
        begin
          qPriv.ParamByName('DogId').Clear;
          qPriv.ParamByName('DogInst').Clear;
          qPriv.ParamByName('DogName').Clear;
        end;

        qPriv.ParamByName('Litr').AsFloat := Litr;
        qPriv.ParamByName('Price').AsFloat := Price;
        qPriv.ParamByName('Amount').AsFloat := Litr * Price;
        if ostEnd = 0 then
          qPriv.ParamByName('Amount').AsFloat := qPriv.ParamByName('Amount').AsFloat + Delta;
        qPriv.ParamByName('CountT').AsFloat := MRound(Table2Ud_weig.AsFloat * Litr / Get1000, DR_ROUND_COUNT);
        qPriv.ExecSQL;

        qPriv.Close;
        qPriv.SQL.Text := 'select sum(Litr), sum(Litr * Price) from "Oil_Vedomost.db" ' +
          ' where TTN_Id = ' + Table2TTN_ID.AsString + ' and TTN_Inst = ' + Table2TTN_INST.AsString;
        qPriv.Open;
        Table2VED.AsFloat := qPriv.Fields[0].AsFloat;
        Litr := ostEnd;
        Table2.Post;
      end;
      if Litr = 0 then Break;
      Table2.Next;
    end;
  finally
    Table2.EnableControls;
    GetInfSumm(); // отримання загальної суми

    if (Litr > 0) or (Table2C_Litr.AsFloat < 0) then
    begin
      if Table2C_Litr.AsFloat < 0 then
        Litr := - Table2C_Litr.AsFloat;
      GetLogMes(TranslateText('Невозможно реализовать ') + FloatToStrF(Litr, ffFixed, 15, 3) +
        TranslateText(' литров! (Группа НП: ') + VarToStr(NPGrpId) +', '+ GetNpGName(NPGrpId) +')');
    end;
  end;
end;
//==============================================================================
// Процедура автоматического разнесения реализации по талонам
function TSRepForm.AutoCalcTalon(NPGrpId, Litr, Ser, Num: Variant; ABarCode: string;
  InTheWay: integer): Currency;
var
  SumLitr, OstEnd: Currency;
  CurrFilter, SWhere: string;
begin
  SumLitr := 0;
  if (Litr = 0) and (ABarCode <> '') then
    case ABarCode[7] of
      '0': Litr := 5;
      '1': Litr := 10;
      '2': Litr := 20;
      '3': Litr := 50;
    end;
  if (NPGrpId = 4) or (NPGrpId = 5) then SWhere := 'in (4,5)'
  else SWhere := '=' + IntToStr(NpGrpId);
  // если есть фильтр - запомнить и пока убрать
  Table2.DisableControls;
  CurrFilter := Table2.Filter;
  Table2.Filter := '';
  Table2.Filtered := false;
  // присвоить таблице главную TOilQuery
  //Table2.MasterSource := dsRashod;
  //Table2.MasterFields := 'IsShtuki;TTN_Date;TTN_ID;TTN_INST';
  try
    if not AddRecord(NPGrpId, 0) then exit; // добавляємо реалізацію

    if ABarCode = '' then
    begin
      // бежим по сортированной TOilQuery
      while not Table2.Eof do
      begin
        if ((Table2NP_GRP.AsInteger = NPGrpId) or ((Table2NP_GRP.AsInteger = 4) and (NPGrpId = 5)) or
          ((Table2NP_GRP.AsInteger = 5) and (NPGrpId = 4))) and IsLargeZero(Table2C_Litr.AsInteger) and
          (Table2Base.AsInteger = 0)
          and ((IsZeroOrLargeMinimal(Table2C_Litr.AsFloat, Litr) and (Ser = null))
            or (IsZeroOrLargeMinimal(Table2C_Litr.AsFloat, Litr, false) and (Ser <> null)))
          and // списати можна із партії яка не "хранение" і яка не "Собственный" і "Излишки"
          not (((Table2Goal_Part_Type.AsInteger = 10) and (Table2Own_good.AsString = 'O')) or
          (Table2Own_good.AsString = 'S')) and IsGptCorrect(Table2Goal_Part_Type.AsInteger, '8') then
        begin
          ostEnd := 0;
          if (Table2C_Litr.AsFloat - FloatModInt(Table2C_Litr.AsFloat, 10)) < Litr then
          begin
            ostEnd := Litr - (Table2C_Litr.AsFloat - FloatModInt(Table2C_Litr.AsFloat, 10));
            Litr := (Table2C_Litr.AsFloat - FloatModInt(Table2C_Litr.AsFloat, 10));
          end;

          qPriv.Close;
          qPriv.SQL.Text := 'insert into "Oil_SRTalon.DB" (TTN_Id, TTN_Inst, Ser, Num, Litr, Price, Count_T, NPGrp_Id, InTheWay) ' +
            ' Values(:TTNId, :TTNInst, :Ser, :Num, :Litr, :Price, :CountT, :NPGrpId, :InTheWay)';
          qPriv.ParamByName('TTNId').AsInteger := Table2TTN_ID.AsInteger;
          qPriv.ParamByName('TTNInst').AsInteger := Table2TTN_INST.AsInteger;
          qPriv.ParamByName('Ser').DataType := ftString;
          qPriv.ParamByName('Ser').Value := Ser;
          qPriv.ParamByName('Num').DataType := ftInteger;
          qPriv.ParamByName('Num').Value := Num;
          qPriv.ParamByName('Litr').AsFloat := Litr;

          if Table2TTN_ID.AsString = '' then
            raise Exception.Create(TranslateText('Не найдено подпартии с которой можно провести реализацию!'));

          qWork.Close;
          qWork.SQL.Text :=
            ' select Round((Oil_Part.SS * Oil_Rashod.Ud_Weig)/1000, 2) from Oil_Part, Oil_Rashod ' +
            ' where Oil_Rashod.Id = '+ Table2TTN_ID.AsString +' and Oil_Rashod.Inst = '+ Table2TTN_INST.AsString +
            '   and Oil_Part.Id = Oil_Rashod.Part_Id and Oil_Part.Inst = Oil_Rashod.Part_Inst';
          qWork.Open;
          qPriv.ParamByName('Price').AsFloat := qWork.Fields[0].AsFloat;
          qPriv.ParamByName('CountT').AsFloat := MRound(Table2Ud_weig.AsFloat * Litr / Get1000, DR_ROUND_COUNT);
          qPriv.ParamByName('NPGrpId').AsInteger := NPGrpId;
          qPriv.ParamByName('InTheWay').AsInteger := InTheWay;
          qPriv.ExecSQL;

          qPriv.Close;
          qPriv.SQL.Text := 'select sum(Litr) from "Oil_SRTalon.DB" ' +
            ' where TTN_Id = ' + Table2TTN_ID.AsString + ' and TTN_Inst = ' + Table2TTN_INST.AsString;
          qPriv.Open;
          Table2.Edit;
          Table2TALON.AsFloat := qPriv.Fields[0].AsFloat;
          Table2.Post;
          Litr := ostEnd;
        end;
        if Litr = 0 then Break;
        Table2.Next;
      end; // while
    end // if
    else
    // разнести талоны по сериям/номерам
    begin
      while not Table2.Eof do
      begin
        // списати можна із партії яка не "хранение" і яка не "Собственный" і "Излишки"
        if not (((Table2Goal_Part_Type.AsInteger = 10) and (Table2Own_good.AsString = 'O')) or
          (Table2Own_good.AsString = 'S')) then
        begin
          if (Table2C_Litr.AsFloat - FloatModInt(Table2C_Litr.AsFloat, 10) < Litr) then
          begin
            if Table2.Eof then
            begin
              strMessageLog := strMessageLog + TranslateText('Перерасход по НП ') +
                Table2NPType_Name.AsString + TranslateText(' для талона ') + Copy(ABarCode, 5, 3) + '/' + Copy(ABarCode, 8, 7) + CRLF;
              exit;
            end;
          end
          else break;
        end;
        Table2.Next;
      end;

      try
        // открыть, но не показывать форму сканирования талонов
        Application.CreateForm(TSRTalonForm, Talon);
        try
          // кому приходують талони
          Talon.TalonDepID := TalonDepID;
          Talon.TalonDepINST := TalonDepINST;

          SrTalonFormOne(Talon);
          // вызвать обработчик OnShow
          Talon.FormShow(self);
          // універсальна перевірка талонів на повтор
          Talon.UnTestPovt := true;
          // ввод штрих-кода
          Talon.RunProcessBarCode(ABarCode, InTheWay{проставляємо стан талону});
          // принять изменения в форме сканирования талонов
          if Talon.Table1.State <> dsBrowse then Talon.Table1.Post;
          Talon.ModalResult := mrOk;
          // действия после закрытии формы
          Talon.qTalonDetail.Close;
          SrTalonFormTwo(Talon);
        finally
          Talon.Free;
        end;
        case StrToInt(ABarCode[7]) of
          0: SumLitr := 5;
          1: SumLitr := 10;
          2: SumLitr := 20;
          3: SumLitr := 50;
        end;
      except on E: Exception do
        strMessageLog := strMessageLog + E.Message + '  ' + ABarCode + CRLF;
      end;
      // заполнить главную таблицу в реализации
      qPriv.Close;
      qPriv.SQL.Text := 'select sum(Litr) from "Oil_SRTalonT.DB" ' +
        ' where TTN_Id = ' + Table2TTN_ID.AsString + ' and TTN_Inst = ' + Table2TTN_INST.AsString;
      qPriv.Open;
      Table2.Edit;
      Table2TALON.AsFloat := qPriv.Fields[0].AsFloat;
      Table2.Post;
    end;
  finally
    GetInfSumm(); // отримання загальної суми

    if ABarCode = '' then
      if (Litr > 0) or (Table2C_Litr.AsFloat < 0) then
      begin
        if Table2C_Litr.AsFloat < 0 then
          Litr := - Table2C_Litr.AsFloat;
        GetLogMes(TranslateText('Невозможно реализовать ') + FloatToStrF(Litr, ffFixed, 15, 3) +
          TranslateText(' литров по талонам! (Группа НП: ') + VarToStr(NPGrpId) +', '+ GetNpGName(NPGrpId) +')');
      end;

    // убрать главную кверю (вернуть сортировку взад)
    //Table2.MasterFields := '';
    //Table2.MasterSource := nil;
    if CurrFilter <> '' then
    begin // вернуть былой фильтр если он был
      Table2.Filter := CurrFilter;
      Table2.Filtered := true;
    end;
    Table2.EnableControls;
    Result := SumLitr;
  end;
end;
//==============================================================================
// Процедура автоматического разнесения реализации по прочим операциям
procedure TSRepForm.AutoCalcOther(OperId, OrgId, OrgInst, NPGrpId, Litr, Price, Auto_Id, Employ_Id, Summ: Variant);
var
  OstLitrEnd, OstSummEnd: Currency;
begin
  Table2.First;
  Table2.DisableControls;
  try
    if not AddRecord(NPGrpId, 0) then exit; // добавляємо реалізацію

    while not Table2.Eof do
    begin
      if ((Table2NP_GRP.AsInteger = NPGrpId) or ((Table2NP_GRP.AsInteger = 4) and (NPGrpId = 5)) or ((Table2NP_GRP.AsInteger = 5) and (NPGrpId = 4)))
        and not (((Table2Goal_Part_Type.AsInteger = 10) and (Table2Own_good.AsString = 'O')) or (Table2Own_good.AsString = 'S'))
        and IsLargeZero(Table2C_Litr.AsInteger) and IsZeroOrLargeMinimal(Table2C_Litr.AsFloat, Litr)
        and (Table2IsShtuki.AsString = 'N') and IsGPTCorrect(Table2Goal_Part_Type.AsInteger) then
      begin
        Table2.Edit;

        OstLitrEnd := 0;
        GetRestLitr(OstLitrEnd, Litr); // залишок літрів, тільки для автокалькуляції

        if Price = null then
          Price := Table2N_Price.AsFloat;

        // знаходимо реальну суму
        if VarIsNull(Summ) then Summ := MRound(Litr * Price, 2)
        else Summ := MRound(Summ, 2);

        OstSummEnd := 0;
        if trunc(Litr * Price) < trunc(Summ) then
        begin
          OstSummEnd := Summ - MRound(Litr * Price, 2);
          Summ := MRound(Litr * Price, 2);
        end;

        qPriv.Close;
        qPriv.SQL.Text :=
          'insert into "Oil_SROther.db" (TTN_Id, TTN_Inst, Oper_Id, Oper_Name, Litr, Price, Count_T, Org_Id, Org_Inst, Org_Name, Auto_Id, Auto_Inst, Employ_Id, Employ_Inst, Amount) ' +
          ' Values(:TTNId, :TTNInst, :OperId, :OperName, :Litr, :Price, :CountT, :OrgId, :OrgInst, :OrgName, :Auto_Id, :Auto_Inst, :Employ_Id, :Employ_Inst, :Amount)';
        qPriv.ParamByName('TTNId').DataType := ftInteger;
        qPriv.ParamByName('TTNInst').DataType := ftInteger;
        qPriv.ParamByName('TTNId').Value := Table2TTN_ID.AsInteger;
        qPriv.ParamByName('TTNInst').Value := Table2TTN_INST.AsInteger;

        qPriv.ParamByName('OperId').DataType := ftInteger;
        qPriv.ParamByName('OperName').DataType := ftString;
        qPriv.ParamByName('OperId').Value := OperId;
        qPriv.ParamByName('OperName').Value := GetOperationName(OperId);

        qPriv.ParamByName('Litr').DataType := ftFloat;
        qPriv.ParamByName('Price').DataType := ftFloat;
        qPriv.ParamByName('CountT').DataType := ftFloat;
        qPriv.ParamByName('Litr').AsFloat := Litr;
        qPriv.ParamByName('Price').AsFloat := Price;
        qPriv.ParamByName('CountT').AsFloat := MRound(Table2Ud_weig.AsFloat * Litr / Get1000, DR_ROUND_COUNT);

        qPriv.ParamByName('OrgId').DataType := ftInteger;
        qPriv.ParamByName('OrgInst').DataType := ftInteger;
        qPriv.ParamByName('OrgName').DataType := ftString;
        if (OrgId <> null) and (OrgInst <> null) then
        begin
          qPriv.ParamByName('OrgId').Value   := OrgId;
          qPriv.ParamByName('OrgInst').Value := OrgInst;
          qPriv.ParamByName('OrgName').Value := GetOrgName(OrgId, OrgInst);
        end
        else
        begin
          qPriv.ParamByName('OrgId').Clear;
          qPriv.ParamByName('OrgInst').Clear;
          qPriv.ParamByName('OrgName').Clear;
        end;

        qPriv.ParamByName('Auto_Id').DataType := ftInteger;
        qPriv.ParamByName('Auto_Inst').DataType := ftInteger;
        qPriv.ParamByName('Auto_Id').Value := Auto_Id;
        if 0 <> GetSqlValueParSimple('select count(*) from oil_auto where state = ''Y'' and id = :id and inst = :inst',
          ['id',   Auto_Id,
           'inst', INST]) then
          qPriv.ParamByName('Auto_Inst').Value := Inst
        else qPriv.ParamByName('Auto_Inst').Value :=
          GetAzsParFirst(dbceAZSName.DataSource.DataSet.FieldByName('AZS_Id').AsInteger);

        // якщо автомобіль не існує, то очистити параметри
        if 0 = GetSqlValueParSimple('select count(*) from oil_auto where state = ''Y'' and id = :id and inst = :inst',
          ['id',   qPriv.ParamByName('Auto_Id').AsInteger,
           'inst', qPriv.ParamByName('Auto_Inst').AsInteger]) then
        begin
          qPriv.ParamByName('Auto_Id').Clear;
          qPriv.ParamByName('Auto_Inst').Clear;
        end;

        qPriv.ParamByName('Employ_Id').DataType := ftInteger;
        qPriv.ParamByName('Employ_Inst').DataType := ftInteger;
        qPriv.ParamByName('Employ_Id').Value := Employ_Id;
        if 0 <> GetSqlValueParSimple('select count(*) from oil_employ where state = ''Y'' and id = :id and inst = :inst',
          ['id',   Employ_Id,
           'inst', INST]) then
          qPriv.ParamByName('Employ_Inst').Value := Inst
        else qPriv.ParamByName('Employ_Inst').Value :=
          GetAzsParFirst(dbceAZSName.DataSource.DataSet.FieldByName('AZS_Id').AsInteger);

        // якщо водій не існує, то очистити параметри
        if 0 = GetSqlValueParSimple('select count(*) from oil_employ where state = ''Y'' and id = :id and inst = :inst',
          ['id',   qPriv.ParamByName('Employ_Id').AsInteger,
           'inst', qPriv.ParamByName('Employ_Inst').AsInteger]) then
        begin
          qPriv.ParamByName('Employ_Id').Clear;
          qPriv.ParamByName('Employ_Inst').Clear;
        end;

        if (qPriv.ParamByName('OperId').AsInteger = 40)
          and (qPriv.ParamByName('Auto_Id').IsNull or qPriv.ParamByName('Employ_Id').IsNull) then
          GetLogMes(TranslateText('Для операции "')+ GetOperationName(40) +
            TranslateText('" необходимо указать Авто и Водителя!') +
            TranslateText(' (Группа НП: ') + VarToStr(NPGrpId) +', '+ GetNpGName(NPGrpId) +')');

        qPriv.ParamByName('Amount').DataType := ftFloat;
        qPriv.ParamByName('Amount').Value := Summ;
        qPriv.ExecSQL;

        qPriv.Close;
        qPriv.SQL.Text :=
          'select sum(Litr) as L, sum(Count_T) as C from "Oil_SROther.db"' +
          ' where TTN_Id = '+ Table2TTN_ID.AsString +' and TTN_Inst = '+ Table2TTN_INST.AsString;
        qPriv.Open;
        Table2N_Price.AsFloat      := Price;
        Table2Other.AsFloat        := qPriv.FieldByName('L').AsFloat;
        Table2Other_Weight.AsFloat := qPriv.FieldByName('C').AsFloat;

        Litr := OstLitrEnd;
        Summ := OstSummEnd;

        Table2.Post;
      end;
      if Litr = 0 then Break;
      Table2.Next;
    end;
  finally
    Table2.EnableControls;
    GetInfSumm(); // отримання загальної суми

    if (Litr > 0) or (Table2C_Litr.AsFloat < 0) then
    begin
      if Table2C_Litr.AsFloat < 0 then
        Litr := - Table2C_Litr.AsFloat;
      GetLogMes(TranslateText('Невозможно реализовать ') + FloatToStrF(Litr, ffFixed, 15, 3) +
        TranslateText(' литров! (Группа НП: ') + VarToStr(NPGrpId) +', '+ GetNpGName(NPGrpId) +')');
    end;
  end;
end;
//==============================================================================
procedure TSRepForm.AutoCalcCard(NPGrpId, Litr, Price, Summ: Variant);
var
  OstEnd: Currency;
begin
  Table2.DisableControls;
  try
    if not AddRecord(NPGrpId, 0) then exit; // добавляємо реалізацію

    Table2.First;
    while not Table2.Eof do
    begin
      if ((Table2NP_GRP.AsInteger = NPGrpId) or((Table2NP_GRP.AsInteger = 4) and (NPGrpId = 5)) or ((Table2NP_GRP.AsInteger = 5) and (NPGrpId = 4))
        ) and // списати можна із партії яка не "хранение" і яка не "Собственный" і "Излишки"
        not (((Table2Goal_Part_Type.AsInteger = 10) and (Table2Own_good.AsString = 'O')) or (Table2Own_good.AsString = 'S')) and
        IsLargeZero(Table2C_Litr.AsInteger) and IsZeroOrLargeMinimal(Table2C_Litr.AsFloat, Litr) and
        (Table2Base.AsInteger = 0) and IsGPTCorrect(Table2Goal_Part_Type.AsInteger) then
      begin
        Table2.Edit;

        ostEnd := 0;
        GetRestLitr(ostEnd, Litr); // залишок літрів, тільки для автокалькуляції

        qPriv.Close;
        qPriv.SQL.Text := 'insert into "Oil_SROther.db" (TTN_Id, TTN_Inst, Oper_Id, Oper_Name, Litr, Price, Count_T, Org_Id, Org_Inst, Org_Name, Auto_Id, Auto_Inst, Employ_Id, Employ_Inst, Amount) ' +
          ' Values(:TTNId, :TTNInst, :OperId, :OperName, :Litr, :Price, :CountT, :OrgId, :OrgInst, :OrgName, :Auto_Id, :Auto_Inst, :Employ_Id, :Employ_Inst, :Amount)';
        qPriv.ParamByName('TTNId').Value := Table2TTN_ID.AsInteger;
        qPriv.ParamByName('TTNInst').Value := Table2TTN_INST.AsInteger;
        qPriv.ParamByName('OperId').DataType := ftInteger;
        qPriv.ParamByName('OperId').Value := 153;
        qPriv.ParamByName('OperName').DataType := ftString;
        qPriv.ParamByName('OperName').Value := TranslateText('Отпуск по карточкам');
        qPriv.ParamByName('Litr').AsFloat := Litr;
        qPriv.ParamByName('Price').AsFloat := Price;
        qPriv.ParamByName('Amount').AsFloat := MRound(Price * Litr, 2);
        qPriv.ParamByName('CountT').AsFloat := MRound(Table2Ud_weig.AsFloat * Litr / Get1000, DR_ROUND_COUNT);
        qPriv.ParamByName('OrgId').DataType := ftInteger;
        qPriv.ParamByName('OrgInst').DataType := ftInteger;
        qPriv.ParamByName('OrgName').DataType := ftString;
        qPriv.ParamByName('Auto_Id').DataType := ftInteger;
        qPriv.ParamByName('Auto_Inst').DataType := ftInteger;
        qPriv.ParamByName('Employ_Id').DataType := ftInteger;
        qPriv.ParamByName('Employ_Inst').DataType := ftInteger;
        qPriv.ExecSQL;

        qPriv.Close;
        qPriv.SQL.Text := 'select sum(Litr) from "Oil_SROther.db" ' +
          ' where TTN_Id = ' + Table2TTN_ID.AsString + ' and TTN_Inst = ' + Table2TTN_INST.AsString;
        qPriv.Open;
        Table2N_Price.AsFloat := Price;
        Table2Other.AsFloat := qPriv.Fields[0].AsFloat;
        Litr := ostEnd;
        Table2.Post;
      end;
      if Litr = 0 then Break;
      Table2.Next;
    end;
  finally
    Table2.EnableControls;
    GetInfSumm(); // отримання загальної суми

    if (Litr > 0) or (Table2C_Litr.AsFloat < 0) then
    begin
      if Table2C_Litr.AsFloat < 0 then
        Litr := - Table2C_Litr.AsFloat;
      GetLogMes(TranslateText('Невозможно реализовать ') + FloatToStrF(Litr, ffFixed, 15, 3) +
        TranslateText(' литров! (Группа НП: ') + VarToStr(NPGrpId) +', '+ GetNpGName(NPGrpId) +')');
    end;
  end;
end;
//==============================================================================
procedure TSRepForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ss: string;
begin
  if ModalResult <> mrOk then
  begin
    ss := TranslateText('Данные не будут сохранены!!! ') + #13#10 +
      TranslateText('Вы уверены что хотите закончить работу со сменным отчетом ?');
    if DogEdit then
      ss := TranslateText('Все договора введенные при редактировании этого сменного отчета не будут сохранены ! ') + ss;

    if MessageDlg(ss, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      raise Exception.Create(TranslateText('Не корректное закрытие формы редактирования сменного отчета!'));
  end;
  FreeAndNil(Packet);
  Table2.Close;
  SList.Free;
  FF.Free;
end;
//==============================================================================
procedure TSRepForm.dbgPrihodEditButtonClick(Sender: TObject);
var
  s: string;
  n: integer;
  // ****************************************************************************
  procedure AddQPrih(q: TDataSet);
  begin
    qPrih.Insert;
    if qPrih.FieldByName('Id').IsNull then
    begin
      qPrih.FieldByName('Id').Value := GetSeqNextVal('S_OIL_DR_DATA');
      qPrih.FieldByName('Inst').Value := Inst;
      qPrih.FieldByName('Oper_Type').AsInteger := 0;
      qPrih.FieldByName('Rep_Id').Value := dbeRepNum.DataSource.DataSet.FieldByName('Id').Value;
      qPrih.FieldByName('Rep_Inst').Value := dbeRepNum.DataSource.DataSet.FieldByName('Inst').Value;
    end;
    qPrih.FieldByName('TTN_Id').AsInteger := q.FieldByName('Id').AsInteger;
    qPrih.FieldByName('TTN_Inst').AsInteger := q.FieldByName('Inst').AsInteger;
    qPrih.FieldByName('TTN_Num').AsString := q.FieldByName('TTN_Num').AsString;
    qPrih.FieldByName('Dog').AsString := q.FieldByName('Dog').AsString;
    qPrih.FieldByName('TTN_Date').Value := q.FieldByName('TTN_DATE').Value;
    qPrih.FieldByName('Pr_Litr').AsFloat := q.FieldByName('Litr').AsFloat;
    qPrih.FieldByName('Pr_Ud_weig').AsCurrency := q.FieldByName('Ud_Weig').AsCurrency;
    qPrih.FieldByName('Pr_Count').AsFloat := q.FieldByName('count_').AsFloat;
    qPrih.FieldByName('NP_Name').AsString := q.FieldByName('np_type_name').AsString;
    qPrih.FieldByName('EdIzm').AsString := q.FieldByName('dim_name').AsString;
    qPrih.FieldByName('S_Price').AsFloat := q.FieldByName('price').AsFloat;
    if q.FieldByName('group_num').AsInteger = 0 then
      qPrih.FieldByName('Sub_Part').AsString := q.FieldByName('ttn_num').AsString
    else qPrih.FieldByName('Sub_Part').AsString := IntToStr(q.FieldByName('group_num').AsInteger * 1000 + n);
    qPrih.FieldByName('Own_goods').Value := q.FieldByName('own_goods').Value;
    if q.FieldByName('IsShtuki').AsString = 'Y' then qPrih.FieldByName('Base_').AsFloat := 1
    else qPrih.FieldByName('Base_').AsFloat := 0;
    qPrih.Post;
  end;
  // ****************************************************************************
begin
  if (dbgPrihod.SelectedField.FieldName = 'TTN_NUM') or (not IsCreateRashForm) then
  begin
    if dbceAZSName.Text = '' then raise Exception.Create(TranslateText('Не определена АЗС !'));
    if IsCreateRashForm then
    begin
      // Открытие формы отпуска НП на АЗС
      Application.CreateForm(TRashRefForm, rash);
      Rash.edTo.tag := dbceAZSName.DataSource.DataSet.FieldByName('AZS_Id').AsInteger;
      Rash.lTo.tag := dbceAZSName.DataSource.DataSet.FieldByName('AZS_Inst').AsInteger;
      Rash.edTo.text := dbceAZSName.Text;
      Rash.edTo.Enabled := false;
      Rash.edActDate_B.Date := trunc(dbdeRepDate.Value);
      Rash.edActDate_E.Date := trunc(dbdeRepDate.Value);
      Rash.ShowModal;
    end;
    if (Rash.ModalResult = mrOk) or (not IsCreateRashForm) then
    begin
      if Rash.q.FieldByName('group_num').AsInteger = 0 then
      begin
        if _RecordCount('Oil_DR_Data', ' State = ''Y'' and Oper_Type = 0 ' +
          ' and ttn_id = '+ Rash.q.FieldByName('Id').AsString +' and ttn_inst = '+ Rash.q.FieldByName('Inst').AsString) > 0 then
        begin
          if IsCreateRashForm then
          begin
            s := TranslateText('ТТН ') + rash.q.FieldByName('TTN_Num').AsString + TranslateText(' уже оприходована !');
            Rash.Free;
            GetLogMes(s);
          end;
          exit;
        end;

        if not rash.q.FieldByName('ttn_num').IsNull then
        begin // Добавление прихода в сменный отчет
          AddQPrih(Rash.q);
          if IsCreateRashForm and Assigned(Rash) then Rash.Free;
        end
        else
        begin
          if Assigned(Rash) then ShowWindow(Rash.Handle, SW_SHOW);
          GetLogMes(TranslateText('В выбранном вами отпуске отсутствует номер ТТН !'));
          if IsCreateRashForm and Assigned(Rash) then Rash.Free;
        end;
      end
      else
      begin
        _OpenQueryPar(qRashSop, ['group_num', Rash.qGroup_Num.Value, 'inst', Rash.qInst.Value]);
        if qRashSop.RecordCount = 0 then
          raise exception.create(TranslateText('Все позиции отпуска сопутствующего товара №') + Rash.qGroup_Num.AsString + TranslateText(' уже оприходованы!'));
        n := 1;
        while not qRashSop.Eof do
        begin
          AddQPrih(qRashSop);
          qRashSop.Next; inc(n);
        end;
      end;
    end;
  end;
end;
//==============================================================================
function TSRepForm.DateTimeIsCorrect(DateTimeStr: string; var ErrMsg: string): boolean;
var
  Hour, Min, TimeStr: string;
begin
  Result := True;
  ErrMsg := '';
  try
    try
      TimeStr := copy(DateTimeStr, 12, 5);
      DateTimeStr := DateTimeToStr(StrToDateTime(DateTimeStr));
    except
      raise Exception.Create(TranslateText('Не верно введено Дату/Время!'));
    end;
    Hour := DelSpace(Copy(TimeStr, 1, 2));
    Min := DelSpace(Copy(TimeStr, 4, 2));
    if (Hour = '') or (Min = '') then raise Exception.Create(TranslateText('Введите время !'));
    if (StrToInt(Hour) > 23) or (StrToInt(Min) > 59) then
      raise Exception.Create(TranslateText('Неправильно введено время !'));
  except on E: Exception do
    begin
      Result := False;
      ErrMsg := E.Message;
    end
  end;
end;
//==============================================================================
procedure TSRepForm.SaveSection(
  p_Rep_Id, p_Rep_Inst: integer;
  p_TableOil, p_Section, p_TableOilF, p_SectionF: string;
  Packet: TPacket); // Збереження даних із секцій
const
  iConstValues = 10; // для стандартних даних
var
  SLTableF, SLSectionF: TStringList;
  aValues: array of variant;
  i, iValues, iFieldDel: integer;
begin
  SLTableF   := TStringList.Create;
  SLSectionF := TStringList.Create;
  try
    try
      // відкриваємо секцію
      if Packet.OpenSection(p_Section) = 0 then exit;

      SLTableF.Clear;
      SLSectionF.Clear;
      SLTableF.CommaText   := p_TableOilF;
      SLSectionF.CommaText := p_SectionF;

      if SLTableF.Count <> SLSectionF.Count then
        raise Exception.Create(TranslateText('SLTableF.Count <> SLSectionF.Count'));

      while not (Packet.EndOfSection) do
      begin
        iValues := iConstValues+SLTableF.Count*2;
        SetLength(aValues, iValues);

        // записуємо стандартні дані
        aValues[0] := 'ID';       aValues[1] := GetNextId(p_TableOil, ['INST', INST]);
        aValues[2] := 'INST';     aValues[3] := INST;
        aValues[4] := 'STATE';    aValues[5] := 'Y';
        aValues[6] := 'REP_ID';   aValues[7] := p_Rep_Id;
        aValues[8] := 'REP_INST'; aValues[9] := p_Rep_Inst;

        iFieldDel := 0;
        // зчитуємо поля і їх значення
        for i := 0 to SLTableF.Count-1 do
        begin
          if Packet.FieldExist(SLSectionF.Strings[i]) then
          begin
            aValues[(iConstValues+i*2  )-iFieldDel*2] := SLTableF.Strings[i]; // поле
            aValues[(iConstValues+i*2+1)-iFieldDel*2] := Packet.FieldByName(SLSectionF.Strings[i]).Value; // значення
          end
          else
          begin
            iValues := iValues - 2;
            SetLength(aValues, iValues);
            inc(iFieldDel);
          end;
        end;

        // зберігаємо дані
        DBSaver.SaveRecord(p_TableOil, aValues);
        Packet.NextRow;
      end;
    except on E: Exception do
      GetLogMes(TranslateText('Не удалось загрузить секцию ')+ p_Section +TranslateText(' с пакета!') +#13#10+
        TranslateText('Ошибка: ')+ E.Message);
    end;
  finally
    SLTableF.Free;
    SLSectionF.Free;
  end;
end;
//==============================================================================
function TSRepForm.GetOperFromTypePay(p_TYPE_PAY: integer): integer; // отримуємо операцію із типу виплати
begin
  // 0 Проба качества - тільки паливо            279	Проба качества
  // 1 Технологический - тільки паливо           280	Технологический
  // 2 Наличный
  // 3 М/и карта                                 281	М/и карта
  // 4 Б/н карта                                 282	Б/н карта
  // 5 Б/н ведомость                             283	Б/н ведомость
  // 6 Собственные нужды                         284	Собственные нужды
  // 7 Платежная карта                           285	Платежная карта
  // 8 Наличный (Без НДС) - тільки товари
  // 9 Платежная карта (Без НДС) - тільки товари 285	Платежная карта
  case p_TYPE_PAY of
    0: result := 279;
    1: result := 280;
    2: result := -1;
    3: result := 281;
    4: result := 282;
    5: result := 283;
    6: result := 284;
    7: result := 285;
    8: result := -1;
    9: result := 285;
    else result := -1;
  end
end;
//==============================================================================
procedure TSRepForm.GetRashod(); // реалізація
var
  CurIndex, NP, InTheWay, OrgId, OrgInst, Oper_id: Integer;
  Price, Litr, LitrOld, Summ, Zakaz, Skidka: Currency;
  Auto, Driver, Ser, Num, Value: Variant;
  sMes: string;
  SL, SL_SUMCOUNTERS: TStringList;
  Run: boolean;
  FSumLitr: array[1..100] of Currency;
  Progress: TProgrForm;
  qRashAdd, qRashEdit: TOilQuery;
  qOrg: TOilQuery;
  GetVal: TGetValueFromString;
  //****************************************************************************
  procedure ClearMT(mt: TMemoryTable); // Видаляємо усе із mt
  begin
    mt.Close;
    mt.Open;
    mt.Edit;
    mt.ClearFields;
  end;
  //****************************************************************************
  function GetOperByTyp(AValue: string):integer;
  begin
    try
      if copy(AValue,1,2)='AV' then
      // Талоны
      begin
        case AValue[3] of
          '1': result := 270;
          '2': result := 271;
          '3': result := 272;
          '4': result := 273;
          '5': result := 274;
          else
            raise Exception.Create('Недопустимое значение для типа талона ' +AValue + '->'+ Copy(AValue,3,1));
        end;
      end
      else if copy(AValue,1,2)='SM' then
      // Смарт-карты
      begin
        if trim(AValue) = 'SMAVGLOB' then
          result := 275
        else if trim(AValue) = 'SMAVREG' then
          result := 276
        else if trim(AValue) = 'SMUKRNAFT' then
          result := 277
        else
          raise Exception.Create('Недопустимое значение для типа карты ' + AValue);
      end;
    except on e:Exception do
      raise Exception.Create('GetOperByTyp:'+e.Message);
    end;
  end;
  //****************************************************************************
begin
  if not ((nb.ActivePage = 'Prihod') and bbRealization.Enabled) then exit;

  log('--Точка входа. Реализация ->');
  try
    if IsAVERAGE(dbdeRepDate.Value) then
    begin
      DefineRepDates(0, dbeRepNum.DataSource.DataSet.FieldByName('Rep_Date').AsDateTime);
      qRashAdd  := qRashEditAVERAGE;
      qRashEdit := qRashEditAVERAGE;

      dbgRashod.FrozenCols := 2;

      dbgRashod.FieldColumns['Part_name'].Visible    := false;
      dbgRashod.FieldColumns['SubPart_Name'].Visible := false;
    end
    else
    begin
      qRashAdd  := qRashAddPART;
      qRashEdit := qRashEditPART;
    end;

    // не видаляти
    //--------------------------------------------------------------------------
    try
      DBSaver.SaveRecord('OIL_DAILY_REP',
        ['ID',           dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger,
         'STATE',        'Y',
         'INST',         dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsInteger,
         'AZS_ID',       dbceAZSName.DataSource.DataSet.FieldByName('AZS_Id').AsInteger,
         'AZS_INST',     dbceAZSName.DataSource.DataSet.FieldByName('AZS_Inst').AsInteger,
         'REP_DATE',     dbeRepNum.DataSource.DataSet.FieldByName('Rep_Date').AsDateTime
        ]);
    except on E: Exception do
      raise Exception.Create(TranslateText('Ошибка при созданни записи в OIL_DAILY_REP: ')+ E.Message)
    end;
    log('Данные про сменный отчет добавлены');
    //--------------------------------------------------------------------------

    Table2C_count.DisplayFormat := DR_FORMAT;
    Table2CCount.DisplayFormat  := DR_FORMAT;
    dbgRashod.FieldColumns['C_count'].DisplayFormat := DR_FORMAT;
    dbgRashod.FieldColumns['CCount'].DisplayFormat  := DR_FORMAT;

    if dbceEmpName.DataSource.DataSet.FieldByName('Emp_Id').Value = 0 then
      dbceEmpName.DataSource.DataSet.FieldByName('Emp_Id').Value := null;
    if dbceEmpName.DataSource.DataSet.FieldByName('Emp_Inst').Value = 0 then
      dbceEmpName.DataSource.DataSet.FieldByName('Emp_Inst').Value := null;
    // Проверка на заполнение всех параметров сменного отчета
    if (dbceAZSName.Text = '') and (dbeRepNum.DataSource.DataSet.FieldByName('Azs_Id').AsInteger <> 0) then
      raise Exception.Create(
        TranslateText('Не найдена соответствующая АЗС!') +#10#13+
        TranslateText('Проверьте на АЗС параметр "ID АЗС".') +#10#13+
        TranslateText('Параметр "ID АЗС" должен соответствовать "ID данной АЗС из справочника организаций" минус 1 000 000 (миллион).'));

    if (dbdeRepDate.Value = null) or (dbceAZSName.Text = '') or (dbeSmenaNum.Text = '') or (dbeRepNum.Text = '') then
      raise Exception.Create(TranslateText('Не полностью определены параметры отчета !'));

    if not DateTimeIsCorrect(dbdeRepDate.Text, sMes) then raise Exception.Create(sMes);
    // Проверка на правильное заполнение цены
    qWork.Close;
    qWork.SQL.Text := 'select S_Price from Oil_DR_Data drd, Oil_Rashod r, Oil_Part p, v_Oil_Dim dim ' +
      ' where (drd.S_Price <= 0 or drd.S_Price > 10) and drd.State = ''Y'' and drd.Oper_Type = 0 ' +
      ' and drd.TTN_Id = r.Id and drd.TTN_Inst = r.Inst ' +
      ' and r.Part_Id = p.Id and r.Part_Inst = p.Inst ' +
      ' and p.Dim_Id = dim.Id and dim.IsShtuki <> ''Y'' ' +
      ' and drd.Rep_Id = :Rep_Id and drd.Rep_Inst = :Rep_Inst';
    _OpenQueryPar(qWork,
      ['Rep_Id',   dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger,
       'Rep_Inst', dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsInteger]);
    if not qWork.IsEmpty then
      GetLogMes(TranslateText('Не правильно определена цена за литр!'));
    log('Проверка цены за литр пройдена');

    // очищаємо таблички
    Table2.Close;
    Table2.Clear;
    Table2.Open;

    Table3.Close;
    Table3.EmptyTable;

    Table4.Close;
    Table4.EmptyTable;

    Table5.Close;
    Table5.EmptyTable;

    // прописуємо користувача, який зайшов у програму OIL
    dbeRepNum.DataSource.DataSet.FieldByName('USER_ID').AsInteger := SUPER_REAL_EMP_ID;

    if dbdeRepDateEnd.Value <> null then
      if VarToDateTime(dbdeRepDateEnd.Value) <= VarToDateTime(dbdeRepDate.Value) then
        GetLogExc(TranslateText('Смена закончилась раньше, чем началась!') +#13+
          TranslateText('Началась: ')   + dbdeRepDate.Text +#13+
          TranslateText('Закончилась: ')+ dbdeRepDateEnd.Text);

    if mode = 1 then
    begin
      log('mode = 1 // Блок при добавлении сменного отчета');

      // Проверка на правильное заполнение № смены
      if not (StrToInt(dbeSmenaNum.Text) in [1..9]) then
        raise Exception.Create(TranslateText('Номер смены может быть от 1 до 9 !'));

      // Проверка на наличие такого сменного отчета
      TestSRepDateSmena(); // перевірка дати та номеру зміни
      log('  Проверка на наличие такого сменного отчета(с номером смены) пройдена');
      TestSRepDateTime(); // перевірка дати та часу
      log('  Проверка на наличие такого сменного отчета пройдена');

      // прописуємо тип загрузки змінного звіту
      if dbeRepNum.DataSource.DataSet.FieldByName('AUTO_LOAD').AsString = '' then
        dbeRepNum.DataSource.DataSet.FieldByName('AUTO_LOAD').AsString := 'H';

      log('  Закрытие и очистка локальных таблиц пройдена');
      // Запрос на выборку остатков подпартий
      qRashAdd.Close;
      qRashAdd.ParamByName('p_azs_id').Value := dbeRepNum.DataSource.DataSet.FieldByName('AZS_Id').Value;
      qRashAdd.ParamByName('p_rep_date').AsDateTime := dbeRepNum.DataSource.DataSet.FieldByName('Rep_Date').AsDateTime;
      qRashAdd.Open;
      log('  Запрос на выборку остатков подпартий открыт');
      Table2.DisableControls;
      try
        while not qRashAdd.Eof do
        begin
          log('    Итерация обработки');
          // Вставка подпартий по которым имеются остатки
          Table2.Append;
          Table2TTN_ID.Value := qRashAdd.FieldByName('TTN_ID').Value;
          Table2TTN_INST.Value := qRashAdd.FieldByName('TTN_INST').Value;
          Table2IsShtuki.AsString := qRashAdd.FieldByName('IsShtuki').AsString;
          Table2bEdited.AsBoolean := false;
          Table2TTN_Date.AsDateTime := qRashAdd.FieldByName('TTN_Date').AsDateTime;

          Table2Part_name.AsString := qRashAdd.FieldByName('TTN_DOG').AsString;
          Table2SubPart_Name.AsString := qRashAdd.FieldByName('Sub_Part').AsString;
          Table2NPType_Name.AsString := qRashAdd.FieldByName('TTN_NP_NAME').AsString;
          Table2NP_TYPE_ID.AsInteger := qRashAdd.FieldByName('np_type_id').AsInteger;
          Table2Us_SubGroup_Id.AsInteger := qRashAdd.FieldByName('us_subgroup_id').AsInteger;
          Table2NP_GRP.Value := qRashAdd.FieldByName('ttn_np_grp_id').Value;

          Table2N_Price.AsFloat := qRashAdd.FieldByName('S_Price').AsFloat;
          Table2Base.Value := qRashAdd.FieldByName('base_').Value;
          Table2Own_good.AsString := qRashAdd.FieldByName('own_goods').AsString;
          Table2Goal_Part_Type.AsInteger := qRashAdd.FieldByName('Goal_Part_Type').AsInteger;
          Table2Litr.AsFloat := qRashAdd.FieldByName('ostatok_L').AsFloat;
          Table2Ud_weig.AsFloat := qRashAdd.FieldByName('ud_weig').AsFloat;

          Table2CCount.AsFloat := qRashAdd.FieldByName('ostatok_T').AsFloat;
          Table2.Post;
          qRashAdd.Next;
        end;
      finally
        Table2.EnableControls;
      end;
      log('  Запрос на выборку остатков подпартий обработан');
      log('mode = 1 END // Блок при добавлении сменного отчета');
    end;

    if mode = 2 then
    begin
      log('mode = 2 // Блок при редактировании сменного отчета');
      
      Table3.Open;
      Table4.Open;
      Table5.Open;

      TestSRepDateTime(); // перевірка дати та часу
      log('  Проверка на наличие такого же сменного отчета пройдена');

      // прописуємо тип загрузки змінного звіту
      if dbeRepNum.DataSource.DataSet.FieldByName('AUTO_LOAD').AsString = 'Y' then
        dbeRepNum.DataSource.DataSet.FieldByName('AUTO_LOAD').AsString := 'YE';

      if dbeRepNum.DataSource.DataSet.FieldByName('AUTO_LOAD').AsString = 'P' then
        dbeRepNum.DataSource.DataSet.FieldByName('AUTO_LOAD').AsString := 'PE';

      if (dbeRepNum.DataSource.DataSet.FieldByName('AUTO_LOAD').AsString = 'H') or
         (dbeRepNum.DataSource.DataSet.FieldByName('AUTO_LOAD').AsString = '') then
        dbeRepNum.DataSource.DataSet.FieldByName('AUTO_LOAD').AsString := 'HE';      
      
      dbgRashod.Columns[5].ReadOnly := false;
      // Выборка и занесение реализации по ведомости
      qRashVed.Close;
      qRashVed.ParamByName('Rep_id').AsInteger := dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger;
      qRashVed.ParamByName('Rep_inst').AsInteger := dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsInteger;
      qRashVed.Open;
      log('  Запрос на выборку реализации по ведомости открыт');
      while not qRashVed.Eof do
      begin
        log('    Итерация обработки');
        table3.Append;
        Table3.FieldByName('TTN_ID').Value := qRashVed.FieldByName('TTN_ID').Value;
        Table3.FieldByName('TTN_INST').Value := qRashVed.FieldByName('TTN_INST').Value;
        Table3.FieldByName('ORG_ID').Value := qRashVed.FieldByName('Org_ID').Value;
        Table3.FieldByName('ORG_INST').Value := qRashVed.FieldByName('Org_INST').Value;
        Table3.FieldByName('ORG_NAME').AsString := qRashVed.FieldByName('ORG_NAME').AsString;
        Table3.FieldByName('Dog_Id').Value := qRashVed.FieldByName('Dog_Id').Value;
        Table3.FieldByName('Dog_Inst').Value := qRashVed.FieldByName('Dog_Inst').Value;
        Table3.FieldByName('litr').AsFloat := qRashVed.FieldByName('litr').AsFloat;
        Table3.FieldByName('count_t').AsFloat := qRashVed.FieldByName('Count_T').AsFloat;
        Table3.FieldByName('Price').AsFloat := qRashVed.FieldByName('Price').AsFloat;
        Table3.FieldByName('Amount').AsFloat := qRashVed.FieldByName('Amount').AsFloat;
        Table3.Post;
        qRashVed.Next;
      end;
      log('  Запрос на выборку реализации по ведомости обработан');
      // Выборка и занесение реализации по талонам
      qRashTalon.Close;
      qRashTalon.ParamByName('Rep_id').Value := dbeRepNum.DataSource.DataSet.FieldByName('Id').Value;
      qRashTalon.ParamByName('Rep_inst').Value := dbeRepNum.DataSource.DataSet.FieldByName('Inst').Value;
      qRashTalon.Open;
      log('  Запрос на выборку реализации по талонам открыт');
      while not qRashTalon.Eof do
      begin
        log('    Итерация обработки');
        Table4.Append;
        Table4.FieldByName('TTN_ID').Value := qRashTalon.FieldByName('TTN_ID').Value;
        Table4.FieldByName('TTN_INST').Value := qRashTalon.FieldByName('TTN_INST').Value;
        Table4.FieldByName('SER').AsString := qRashTalon.FieldByName('SER').AsString;
        Table4.FieldByName('NUM').Value := qRashTalon.FieldByName('NUM').Value;
        Table4.FieldByName('litr').Value := qRashTalon.FieldByName('litr').Value;
        Table4.FieldByName('Price').AsFloat := qRashTalon.FieldByName('Price').AsFloat;
        Table4.FieldByName('count_t').AsFloat := qRashTalon.FieldByName('Count_T').AsFloat;
        Table4.FieldByName('NPGrp_Id').Value := qRashTalon.FieldByName('NPGrp_Id').Value;
        Table4.FieldByName('AUTO_ID').Value := qRashTalon.FieldByName('AUTO_ID').Value;
        Table4.FieldByName('AUTO_INST').Value := qRashTalon.FieldByName('AUTO_INST').Value;
        Table4.FieldByName('EMPLOY_ID').Value := qRashTalon.FieldByName('EMPLOY_ID').Value;
        Table4.FieldByName('EMPLOY_INST').Value := qRashTalon.FieldByName('EMPLOY_INST').Value;
        Table4.FieldByName('INTHEWAY').Value := qRashTalon.FieldByName('INTHEWAY').Value;
        Table4.Post;
        qRashTalon.Next;
      end;
      log('  Запрос на выборку реализации по талонам обработан');
      // Выборка и занесение реализации по прочим операциям
      qRashOther.Close;
      qRashOther.ParamByName('Rep_id').Value := dbeRepNum.DataSource.DataSet.FieldByName('Id').Value;
      qRashOther.ParamByName('Rep_inst').Value := dbeRepNum.DataSource.DataSet.FieldByName('Inst').Value;
      qRashOther.Open;
      log('  Запрос на выборку реализации по прочим операциям открыт');
      while not qRashOther.Eof do
      begin
        log('    Итерация обработки');
        Table5.Append;
        Table5.FieldByName('TTN_ID').Value := qRashOther.FieldByName('TTN_ID').Value;
        Table5.FieldByName('TTN_INST').Value := qRashOther.FieldByName('TTN_INST').Value;
        Table5.FieldByName('OPER_ID').Value := qRashOther.FieldByName('OPER_ID').AsInteger;
        Table5.FieldByName('OPER_NAME').AsString := qRashOther.FieldByName('OPER_NAME').AsString;
        Table5.FieldByName('litr').AsFloat := qRashOther.FieldByName('litr').AsFloat;
        Table5.FieldByName('count_t').AsFloat := qRashOther.FieldByName('count_t').AsFloat;
        Table5.FieldByName('price').AsFloat := qRashOther.FieldByName('price').AsFloat;
        Table5.FieldByName('ORG_ID').Value := qRashOther.FieldByName('ORG_ID').Value;
        Table5.FieldByName('ORG_INST').Value := qRashOther.FieldByName('ORG_INST').Value;
        Table5.FieldByName('ORG_NAME').AsString := qRashOther.FieldByName('ORG_NAME').AsString;
        Table5.FieldByName('Auto_Id').Value := qRashOther.FieldByName('Auto_Id').Value;
        Table5.FieldByName('Auto_Inst').Value := qRashOther.FieldByName('Auto_Inst').Value;
        Table5.FieldByName('Employ_Id').Value := qRashOther.FieldByName('Employ_Id').Value;
        Table5.FieldByName('Employ_Inst').Value := qRashOther.FieldByName('Employ_Inst').Value;
        Table5.FieldByName('Dog_Id').Value := qRashOther.FieldByName('Dog_Id').Value;
        Table5.FieldByName('Dog_Inst').Value := qRashOther.FieldByName('Dog_Inst').Value;
        Table5.FieldByName('Amount').Value := qRashOther.FieldByName('Amount').Value;
        Table5.Post;
        qRashOther.Next;
      end;
      log('  Запрос на выборку реализации по прочим операциям обработан');
      // Запрос на выборку остатков подпартий
      qRashEdit.Close;
      qRashEdit.ParamByName('p_azs_id').Value := dbeRepNum.DataSource.DataSet.FieldByName('AZS_Id').Value;
      qRashEdit.ParamByName('p_rep_date').AsDateTime := StartDateTime;
      qRashEdit.Open;
      log('  Запрос на выборку остатков подпартий открыт');
      Table2.DisableControls;
      try
        while not qRashEdit.Eof do
        begin
          log('    Итерация обработки');
          // Вставка подпартий по которым имеются остатки
          Table2.Append;
          Table2TTN_ID.Value := qRashEdit.FieldByName('TTN_ID').Value;
          Table2TTN_INST.Value := qRashEdit.FieldByName('TTN_INST').Value;
          Table2IsShtuki.AsString := qRashEdit.FieldByName('IsShtuki').AsString;
          Table2bEdited.AsBoolean := qRashEdit.FieldByName('IsEdit').AsString = 'Y';
          Table2TTN_Date.AsDateTime := qRashEdit.FieldByName('TTN_Date').AsDateTime;

          Table2Part_name.AsString := qRashEdit.FieldByName('TTN_DOG').AsString;
          Table2SubPart_Name.AsString := qRashEdit.FieldByName('Sub_Part').AsString;
          Table2NPType_Name.AsString := qRashEdit.FieldByName('TTN_NP_NAME').AsString;
          Table2NP_TYPE_ID.AsInteger := qRashEdit.FieldByName('np_type_id').AsInteger;
          Table2Us_SubGroup_Id.AsInteger := qRashEdit.FieldByName('us_subgroup_id').AsInteger;
          Table2NP_GRP.Value := qRashEdit.FieldByName('ttn_np_grp_id').Value;

          Table2N_Price.AsFloat := qRashEdit.FieldByName('S_Price').AsFloat;
          Table2Base.Value := qRashEdit.FieldByName('base_').Value;
          Table2Own_good.AsString := qRashEdit.FieldByName('own_goods').AsString;
          Table2Goal_Part_Type.AsInteger := qRashEdit.FieldByName('Goal_Part_Type').AsInteger;
          Table2Litr.AsFloat := qRashEdit.FieldByName('ostatok_l').AsFloat;
          Table2Ud_weig.AsFloat := qRashEdit.FieldByName('ud_weig').AsFloat;

          if qRashEdit.FieldByName('base_').AsFloat = 0 then
            Table2CCount.AsFloat := qRashEdit.FieldByName('ostatok_t').AsFloat
          else Table2CCount.AsFloat := qRashEdit.FieldByName('ostatok_l').AsFloat;
          if qRashEdit.FieldByName('out_nal_litr').AsFloat <> 0 then
          begin
            Table2NAL.AsFloat := qRashEdit.FieldByName('out_nal_litr').AsFloat;
            Table2Nal_Money.AsFloat := qRashEdit.FieldByName('Out_Nal_Money').AsFloat;
          end;
          if qRashEdit.FieldByName('out_ved_litr').AsFloat <> 0 then
            Table2VED.AsFloat := qRashEdit.FieldByName('out_ved_litr').AsFloat;
          if qRashEdit.FieldByName('out_talon_litr').AsFloat <> 0 then
            Table2TALON.AsFloat := qRashEdit.FieldByName('out_talon_litr').AsFloat;
          if qRashEdit.FieldByName('out_sn_litr').AsFloat <> 0 then
            Table2SN.AsFloat := qRashEdit.FieldByName('out_sn_litr').AsFloat;
          if qRashEdit.FieldByName('out_litr').AsFloat <> 0 then
            Table2other.AsFloat := qRashEdit.FieldByName('Out_litr').AsFloat;
          Table2Other_Weight.AsFloat := qRashEdit.FieldByName('Out_Count').AsFloat;
          Table2.Post;
          qRashEdit.Next;
        end;
      finally
        Table2.EnableControls;
      end;
      log('  Запрос на выборку остатков подпартий обработан');
      Table3.Close;
      Table4.Close;
      Table5.Close;
      log('mode = 2 END // Блок при редактировании сменного отчета');
    end;
    //if Table2.Active then Table2.Refresh;
    pData.Enabled := False;
    nb.ActivePage := 'Rashod';
    log('Обработка пакета с АЗС');
    if SList.Count > 0 then
    begin // проверить значение счетчиков и суммарную реализацию в пакете
      try
        SL := TStringList.Create;
        try
          // знаходимо секції, які не треба аналізувати
          qWork.Close;
          qWork.SQL.Text :=
            'select * from oil_azs_sections' +
            ' where state = ''Y'' and section_name is not null and analysis = ''N'''+
            ' order by id';
          qWork.Open;
          qWork.First;
          SL.Clear;
          while not qWork.Eof do
          begin
            SL.Add(qWork.FieldByName('section_name').AsString);
            qWork.Next;
          end;
          SL_SUMCOUNTERS := PacketClass.ValidateTotal(SList, SL);
        finally
          SL.Free;
        end;
      except on E: Exception do
        GetLogMes(TranslateText('Ошибка проверки содержимого пакета') + #13#10 + E.Message);
      end;

      CurIndex := 0;
      ClearMT(mtSkidka);

      while CurIndex < SList.Count do
      begin // Загрузка цін груп товарів
        if Pos('NP_PRICES:', SList[CurIndex]) = 1 then
          while Pos('VALUES:', SList[CurIndex + 1]) = 1 do
          begin
            CurIndex := CurIndex + 1;
            GetVal := TGetValueFromString.Create(SList[CurIndex]);
            try
              NP := GetVal.NextField(TranslateText('Отсутствует группа НП!')).AsInteger;
              Price := GetVal.NextField(TranslateText('Отсутствует цена группы НП!')).AsFloat;
            finally
              GetVal.Free;
            end;
            dbgRashod.DataSource.DataSet.DisableControls;
            try
              Table2.First;
              while not Table2.Eof do
              begin
                if (Table2.FieldByName('NP_GRP').AsInteger = NP) and (Price <> 0) then
                begin
                  Table2.Edit;
                  Table2.FieldByName('N_Price').Value := Price;
                  Table2.Post;
                end;
                Table2.Next;
              end;
            finally
              dbgRashod.DataSource.DataSet.EnableControls;
            end;
          end;
        // Загрузка цін типів товарів
        if Pos('ST_PRICES:', SList[CurIndex]) = 1 then
          while Pos('VALUES:', SList[CurIndex + 1]) = 1 do
          begin
            CurIndex := CurIndex + 1;
            GetVal := TGetValueFromString.Create(SList[CurIndex]);
            try
              NP := GetVal.NextField(TranslateText('Отсутствует тип НП!')).AsInteger;
              Price := GetVal.NextField(TranslateText('Отсутствует цена типа НП!')).AsFloat;
            finally
              GetVal.Free;
            end;

            dbgRashod.DataSource.DataSet.DisableControls;
            try
              Table2.First;
              while not Table2.Eof do
              begin
                if (Table2.FieldByName('NP_TYPE_ID').AsInteger = NP) and
                  (Table2.FieldByName('Us_SubGroup_Id').AsInteger <> 0) then
                begin
                  Table2.Edit;
                  Table2.FieldByName('N_Price').Value := Price;
                  Table2.Post;
                end;
                Table2.Next;
              end;
            finally
              dbgRashod.DataSource.DataSet.EnableControls;
            end;
          end;
        CurIndex := CurIndex + 1;
      end;
      // Сначала найти в пакете раздел талонов, разнести их кратно 10 л
      // Потом разнести все остальное, чтобы правильно закрылись подпартии
      Run := True;
      CurIndex := 0;
      while (CurIndex < SList.Count) and Run do
        if Pos('TALON:', SList[CurIndex]) = 1 then Run := False
        else inc(CurIndex);
      // Загрузка параметров реализации по талонам
      if not Run and (Pos('TALON:', SList[CurIndex]) = 1) then
      begin
        strMessageLog := '';
        FillChar(FSumLitr, SizeOf(FSumLitr), 0);
        try
          if Packet.OpenSection('TALON') > 0 then
          begin
            // якщо це автозагрузка, то талони будуть грузитися, як такі, що ще в дорозі
            if DR_AUTOLOAD then
              InTheWay := 4
            else
              if MessageDlgExt(TranslateText('Талоны вносить как такие, что в пути?'), mtConfirmation,
                [TranslateText('Да'), TranslateText('Нет')], 1) = 1 then
                InTheWay := 4
              else InTheWay := 3;
          end;

          if Packet.OpenSection('TALONSN') > 0 then
          begin
            // занести в переменную общую реализацию по талонам
            if Packet.OpenSection('TALON') > 0 then
              while not Packet.EndOfSection do
              begin
                NP := Packet.FieldByName('NP').AsInteger;
                FSumLitr[NP] := FSumLitr[NP] + Packet.FieldByName('NP').AsFloat;
                Packet.NextRow;
              end;
            // занести имеющиеся штрихкоды и вычесть из их общ к-ва
            if (Packet.OpenSection('TALONSN') > 0) and (ReadOilVar('DR_LOAD_TALONSN') <> 'N') then
            begin
              Progress := TProgrForm.CreateBar(Self);
              Progress.MaxValue := Packet.Count;
              Progress.Progress := 0;
              Progress.Show;
              Progress.Repaint;
              try
                while not Packet.EndOfSection do
                begin

                  NP := Packet.FieldByName('NP').AsInteger;
                  if (Packet.FieldByName('CODE').AsString <> '00000000000000') and
                     (Packet.FieldByName('CODE').AsString <> '0000000000000000') then
                    FSumLitr[NP] := FSumLitr[NP] - AutoCalcTalon(
                      Packet.FieldByName('NP').AsInteger,
                      0, Ser, Num,
                      Packet.FieldByName('CODE').AsString,
                      InTheWay
                      );
                  Packet.NextRow;
                  Progress.AddProgress(1);
                end;
              finally
                Progress.Free;
              end;
            end;
            // проверить что осталось после занесения и довнести общей суммой
            for NP := 1 to 100 do
              if FSumLitr[NP] > 0 then
                AutoCalcTalon(NP, FSumLitr[NP], null, null, '', InTheWay);
          end
          else
            while Pos('VALUES:', SList[CurIndex + 1]) = 1 do
            begin
              CurIndex := CurIndex + 1;

              GetVal := TGetValueFromString.Create(SList[CurIndex]);
              try
                NP := GetVal.NextField(TranslateText('Отсутствует тип НП для талонов!')).AsInteger;
                GetVal.NextField('', False);
                Litr := GetVal.NextField(TranslateText('Отсутствует количество литров для талонов!')).AsFloat;
                GetVal.NextField('', False);
                GetVal.NextField('', False);
                Ser := Copy(GetVal.CurrentString, 1, Pos('¦', GetVal.CurrentString) - 1);
                GetVal.NextField('', False);
                if Copy(GetVal.CurrentString, 1, Length(GetVal.CurrentString)) = '' then
                  Num := null
                else Num := StrToInt(Copy(GetVal.CurrentString, 1, Length(GetVal.CurrentString)));
              finally
                GetVal.Free;
              end;
              AutoCalcTalon(NP, Litr, Ser, Num, '', InTheWay);
            end;
        finally
          if strMessageLog <> '' then
            GetExcMes(TranslateText('Возникли ошибки при загрузке талонов:') + CRLF + CRLF + strMessageLog);
        end;
      end; // TALON

      CurIndex := 0;
      while CurIndex < SList.Count do
      begin
        // Загрузка параметров реализации за наличные
        if Pos('NAL:', SList[CurIndex]) = 1 then
        begin
          while Pos('VALUES:', SList[CurIndex + 1]) = 1 do
          begin
            CurIndex := CurIndex + 1;
            GetVal := TGetValueFromString.Create(SList[CurIndex]);
            try
              NP := GetVal.NextField(TranslateText('Отсутствует тип НП для талонов!')).AsInteger;
              Litr := GetVal.NextField(TranslateText('Отсутствует количество литров релизации за нал.!')).AsFloat;
              Price := GetVal.NextField(TranslateText('Отсутствует цена релизации за нал.!')).AsFloat;
              Summ := GetVal.NextField(TranslateText('Отсутствует сумма релизации за нал.!')).AsFloat;
              if GetVal.NextField('', False).AsString <> '' then
                Skidka := GetVal.CurrentField.AsFloat
              else Skidka := 0;
            finally
              GetVal.Free;
            end;

            if Skidka > 0 then
            begin
              mtSkidka.Append;
              mtSkidkaSTYPE.AsInteger := 2;
              mtSkidkaNP_ID.AsInteger := NP;
              mtSkidkaLITR.Value := Litr;
              mtSkidkaPRICE.Value := Price;
              mtSkidkaSUMM.Value := Summ;
              mtSkidkaSKIDKA.Value := Skidka;
              mtSkidka.Post;
            end;

            AutoCalcNal(NP, Litr, Price, Summ, Skidka);
          end;
        end;
        // Загрузка параметров реализации по ведомости
        if Pos('VEDOM:', SList[CurIndex]) = 1 then
        begin
          while Pos('VALUES:', SList[CurIndex + 1]) = 1 do
          begin
            CurIndex := CurIndex + 1;

            GetVal := TGetValueFromString.Create(SList[CurIndex]);
            try
              OrgId := GetVal.NextField(TranslateText('Отсутствует организация для ведомости!')).Value;

              if 0 <> GetSqlValueParSimple('select count(*) from v_org o, oil_dog d '
                +' where o.state=''Y'' and d.state = ''Y'' '
                +'   and d.dog_type = ''V'' and d.to_ = o.id and d.to_inst = o.inst '
                +'   and o.id = :id and o.inst = :inst ',
                ['id',   OrgId,
                 'inst', MAIN_ID]) then
                OrgInst := MAIN_ID
              else
              begin
                qOrg := TOilQuery.Create(nil);
                try
                  qOrg.SQL.Text :=
                    'select o.id, o.inst, o.name from v_org o, oil_dog d' +
                    ' where o.state = ''Y'' and d.state = ''Y''' +
                    '   and o.id = :to_id' +
                    '   and d.dog_type = ''V''' +

                    '   and d.to_ = o.id' +
                    '   and d.to_inst = o.inst';
                  _OpenQueryPar(qOrg, ['to_id', OrgId]);
                  if qOrg.RecordCount = 1 then
                    OrgInst := qOrg.FieldByName('inst').AsInteger;
                finally
                  qOrg.Free;
                end;
                if OrgInst = 0 then
                  GetAzsParFirst(dbceAZSName.DataSource.DataSet.FieldByName('AZS_Id').AsInteger);
              end;

              NP := GetVal.NextField(TranslateText('Отсутствует тип НП для ведомости!')).AsInteger;
              Zakaz := GetVal.NextField('', False).AsFloat;
              Litr := GetVal.NextField(TranslateText('Отсутствует количество литров для ведомости!')).AsFloat;
              Price := GetVal.NextField(TranslateText('Отсутствует цена для ведомости!')).AsFloat;
              Summ := GetVal.NextField(TranslateText('Отсутствует сумма для ведомости!')).AsFloat;
              if GetVal.NextField('', False).AsString <> '' then
                Skidka := GetVal.CurrentField.AsFloat
              else Skidka := 0;
            finally
              GetVal.Free;
            end;

            if Skidka > 0 then
            begin
              mtSkidka.Append;
              mtSkidkaSTYPE.AsInteger := 3;
              mtSkidkaORG_ID.AsInteger := OrgId;
              mtSkidkaNP_ID.AsInteger := NP;
              mtSkidkaZAKAZ.Value := Zakaz;
              mtSkidkaLITR.Value := Litr;
              mtSkidkaPRICE.Value := Price;
              Price := MRound(Summ/Litr, 2);
              mtSkidkaSUMM.Value := Summ;
              mtSkidkaSKIDKA.Value := Skidka;
              mtSkidka.Post;
            end;

            AutoCalcVed(OrgId, OrgInst, NP, Litr, Price, Summ);
          end;
        end;
        // Загрузка параметров реализации на собственный автотранспорт
        if Pos('OWN:', SList[CurIndex]) = 1 then
        begin
          while Pos('VALUES:', SList[CurIndex + 1]) = 1 do
          begin
            CurIndex := CurIndex + 1;

            GetVal := TGetValueFromString.Create(SList[CurIndex]);
            try
              NP := GetVal.NextField(TranslateText('Отсутствует тип НП для заправки соб. авто!')).AsInteger;
              GetVal.NextField;
              Litr := GetVal.NextField(TranslateText('Отсутствует количество литров для заправки соб. авто!')).AsFloat;
              Price := GetVal.NextField(TranslateText('Отсутствует цена для заправки соб. авто!')).AsFloat;
              GetVal.NextField;
              Auto := GetVal.NextField(TranslateText('Отсутствует автомобиль для заправки соб. авто!')).Value;
              Driver := GetVal.NextField(TranslateText('Отсутствует водитель для заправки соб. авто!')).Value;
            finally
              GetVal.Free;
            end;
            AutoCalcOther(40, MAIN_ID, Inst, NP, Litr, Price, Auto, Driver, null);
          end;
        end;
        // Загрузка параметров реализации по эл. карточкам
        if Pos('CARD:', SList[CurIndex]) = 1 then
        begin
          while Pos('VALUES:', SList[CurIndex + 1]) = 1 do
          begin
            CurIndex := CurIndex + 1;
            GetVal := TGetValueFromString.Create(SList[CurIndex]);
            try
              NP := GetVal.NextField(TranslateText('Отсутствует тип НП для заправки по карточке!')).AsInteger;
              Litr := GetVal.NextField(TranslateText('Отсутствует количество литров для заправки по карточке!')).AsFloat;
              Price := GetVal.NextField(TranslateText('Отсутствует цена для заправки по карточке!')).AsFloat
            finally
              GetVal.Free;
            end;
            AutoCalcOther(153, null, null, NP, Litr, Price, null, null, null);
          end;
        end;
        // Загрузка параметров реализации по банковским картам
        if Pos('CREDITCARD:', SList[CurIndex]) = 1 then
        begin
          while Pos('VALUES:', SList[CurIndex + 1]) = 1 do
          begin
            CurIndex := CurIndex + 1;

            GetVal := TGetValueFromString.Create(SList[CurIndex]);
            try
              NP := GetVal.NextField(TranslateText('Отсутствует тип НП для заправки по карточке!')).AsInteger;
              Litr := GetVal.NextField(TranslateText('Отсутствует количество литров для заправки по карточке!')).AsFloat;
              Price := GetVal.NextField(TranslateText('Отсутствует цена для заправки по карточке!')).AsFloat;

              if GetVal.NextField('', False).AsString = '' then Summ := 0
              else Summ := GetVal.CurrentField.AsFloat;
              
              if GetVal.NextField('', False).AsString = '' then Skidka := 0
              else Skidka := GetVal.CurrentField.AsFloat;
            finally
              GetVal.Free;
            end;

            if Skidka > 0 then
            begin
              mtSkidka.Append;
              mtSkidkaSTYPE.AsInteger := 1;
              mtSkidkaNP_ID.AsInteger := NP;
              mtSkidkaLITR.Value := Litr;
              mtSkidkaPRICE.Value := Price;
              mtSkidkaSUMM.Value := Summ;
              mtSkidkaSKIDKA.Value := Skidka;
              mtSkidka.Post;
            end;

            AutoCalcOther(201, null, null, NP, Litr, Price, null, null, Summ);
          end;
        end;
        // Загрузка параметров реализации по талонам Авиаса
        if Pos('TALONAVIAS:', SList[CurIndex]) = 1 then
        begin
          while Pos('VALUES:', SList[CurIndex + 1]) = 1 do
          begin
            CurIndex := CurIndex + 1;
            GetVal := TGetValueFromString.Create(SList[CurIndex]);
            try
              NP := GetVal.NextField(TranslateText('Отсутствует тип НП для заправки по талонам!')).AsInteger;
              Oper_id := GetOperByTyp(GetVal.NextField(TranslateText('Отсутствует тип талона!')).AsString);
              Zakaz := GetVal.NextField(TranslateText('Отсутствует количество литров заказа для заправки по талонам!')).AsFloat;
              Litr := GetVal.NextField(TranslateText('Отсутствует количество литров для заправки по талонам!')).AsFloat;
              LitrOld := Litr;
              Price := GetVal.NextField(TranslateText('Отсутствует цена для заправки по талонам!')).AsFloat;
              
              if GetVal.NextField('', False).AsString = '' then Summ := 0
              else Summ := GetVal.CurrentField.AsFloat;
            finally
              GetVal.Free;
            end;

            if (Zakaz <> Litr) and ((Litr - MRound(Litr, 0) <> 0) or (trunc(MRound(Litr, 0)) mod 5 <> 0)) then
            begin
              sMes := TranslateText('Заказ не соответствует налитому по операции "')+ GetOperationName(Oper_id) +
                '" ('+ TranslateText('заказ ')+ CurrToStr(Zakaz) +', '+ TranslateText('налито ')+ CurrToStr(Litr) +') !' +#13+
                TranslateText('В сменный отчет будет внесено ');

              if Zakaz - Litr > 0 then
              begin
                GetLogMes(sMes +TranslateText('количество заказа!') +
                  TranslateText(' (Группа НП: ')+ VarToStr(NP) +', '+ GetNpGName(NP) +')');
                Litr := Zakaz;
              end
              else
              begin
                Litr := trunc(MRound(Litr, 0)) - (trunc(MRound(Litr, 0)) mod 5);
                GetLogMes(sMes + CurrToStr(Litr) +' !' +
                  TranslateText(' (Группа НП: ')+ VarToStr(NP) +', '+ GetNpGName(NP) +')');
              end;

              // Корректировать наличную реализацию, если заказ не соответствует налитому по талонам Авиаса
              if AdmSettings.Exist('DR_CORR_NAL_RestTalon') then
                if AdmSettings.Get('DR_CORR_NAL_RestTalon') = 'Y' then
                begin
                  GetLogMes(TranslateText('Дополнительная реализация за нал. ')+ FloatToStrF(LitrOld - Litr, ffFixed, 15, 3) +
                    TranslateText(' литров! (Группа НП: ') + VarToStr(NP) +', '+ GetNpGName(NP) +')');
                  AutoCalcNal(NP, LitrOld - Litr, Price, 0, 0);
                end;
            end;
            AutoCalcOther(Oper_id, null, null, NP, Litr, Price, null, null, Summ);
          end;
        end;
        // Загрузка параметров реализации по топливным картам Авиаса
        if Pos('CARDAVIAS:', SList[CurIndex]) = 1 then
        begin
          while Pos('VALUES:', SList[CurIndex + 1]) = 1 do
          begin
            CurIndex := CurIndex + 1;

            GetVal := TGetValueFromString.Create(SList[CurIndex]);
            try
              NP := GetVal.NextField(TranslateText('Отсутствует тип НП для заправки по карточке!')).AsInteger;
              Oper_id := GetOperByTyp(GetVal.NextField( TranslateText('Отсутствует тип карточки!')).AsString);
              Litr := GetVal.NextField(TranslateText('Отсутствует количество литров для заправки по карточке!')).AsFloat;
              Price := GetVal.NextField(TranslateText('Отсутствует цена для заправки по карточке!')).AsFloat;
              
              if GetVal.NextField('', False).AsString = '' then Summ := 0
              else Summ := GetVal.CurrentField.AsFloat;
            finally
              GetVal.Free;
            end;

            AutoCalcOther(Oper_id, null, null, NP, Litr, Price, null, null, Summ);
          end;
        end;
        // Загрузка параметров реализации сопутствующих товаров
        if Pos('ST:', SList[CurIndex]) = 1 then
        begin
          while Pos('VALUES:', SList[CurIndex + 1]) = 1 do
          begin
            CurIndex := CurIndex + 1;

            GetVal := TGetValueFromString.Create(SList[CurIndex]);
            try
              NP := GetVal.NextField(TranslateText('Отсутствует код сопутствующего товара!')).AsInteger;
              Litr := GetVal.NextField(TranslateText('Отсутствует количество сопутствующего товара!')).AsFloat;
              Price := GetVal.NextField(TranslateText('Отсутствует цена сопутствующего товара!')).AsFloat;
              Summ := GetVal.NextField(TranslateText('Отсутствует сумма релизации за сопутствующий товар!')).AsFloat;
              GetVal.NextField('', False);
              if (GetVal.CurrentField.AsString <> '') and (GetVal.CurrentField.AsString <> '2') then // НЕ "Наличный"
                Oper_id := GetOperFromTypePay(GetVal.CurrentField.AsInteger)
              else Oper_id := -1;
            finally
              GetVal.Free;
            end;         

            if (Litr < 0) and ((Oper_id = -1) or (Oper_id = 2)) then
              Oper_id := 286;

            AutoCalcST(NP, Litr, Price, Summ, Oper_id)
          end;
        end;
        // Загрузка параметров реализации по эл. карточкам
        if Pos('RETURN:', SList[CurIndex]) = 1 then
        begin
          while Pos('VALUES:', SList[CurIndex + 1]) = 1 do
          begin
            CurIndex := CurIndex + 1;

            GetVal := TGetValueFromString.Create(SList[CurIndex]);
            try
              NP := GetVal.NextField(TranslateText('Отсутствует тип НП для возврата на нефтебазу!')).AsInteger;
              Litr := GetVal.NextField(TranslateText('Отсутствует количество литров для возврата на нефтебазу!')).AsFloat;
            finally
              GetVal.Free;
            end;

            AutoCalcOther(55, MAIN_ID, Inst, NP, Litr, Price, null, null, null);
          end;
        end;
        CurIndex := CurIndex + 1;
      end;
    end;

    //--------------------------------------------------------------------------
    // загрузка секцій
    if SList.Count > 0 then
    try
      if Packet.OpenSection('PROBA') > 0 then
        while not (Packet.EndOfSection) do
        begin
          AutoCalcOther(279, null, null, Packet.FieldByName('NP').AsInteger,
            Packet.FieldByName('LITR').AsFloat, null, null, null, null);
          Packet.NextRow;
        end;
    except on E: Exception do
      GetLogMes(TranslateText('Не удалось загрузить секцию "PROBA" с пакета!')+#13#10+ E.Message);
    end;
    //--------------------------------------------------------------------------
    // добавляємо до налу не враховану реалізацію
    if SL_SUMCOUNTERS <> nil then
    try
      if IsAVERAGE(dbdeRepDate.Value) and (SList.Count > 0) and (SL_SUMCOUNTERS.Count > 0) then
      begin
        log('Проверка суммы по счетчикам и отпущенных литров в программе');

        Table2.First;
        while not Table2.Eof do
        begin
          if Table2IsShtuki.AsString = 'N' then
            if SL_SUMCOUNTERS.Values[Table2NP_GRP.AsString] <> '' then
            begin
              Litr :=
                StrToCurr(
                  decode([SL_SUMCOUNTERS.Values[Table2NP_GRP.AsString], '', '0', SL_SUMCOUNTERS.Values[Table2NP_GRP.AsString]])
                ) - (Table2Litr.AsCurrency - Table2C_Litr.AsCurrency);

              // Ігорь Оніщук сказав, що якщо різниця між лічильниками і програмою до 200 літрів, то можна її вносити
              if (Litr > 0) and (Litr < 200) then
              begin
                //--------------------------------------------------------------
                // Разница между загруженной реализацией и реализацией по счетчикам на АЗС
                // по замовчуванню DR_CORR = NAL
                if AdmSettings.Exist('DR_CORR') then
                begin
                  sMes := AdmSettings.Get('DR_CORR');

                  if sMes = 'NOT' then
                    GetLogMes(TranslateText('Разница между загруженной реализацией и реализацией по счетчикам на АЗС на ')+ FloatToStrF(Litr, ffFixed, 15, 3) +
                      TranslateText(' литров! (Группа НП: ') + VarToStr(Table2NP_GRP.AsInteger) +', '+ GetNpGName(Table2NP_GRP.AsInteger) +')');

                  if sMes = 'NAL' then
                  begin
                    GetLogMes(TranslateText('Дополнительная реализация за нал. ')+ FloatToStrF(Litr, ffFixed, 15, 3) +
                      TranslateText(' литров! (Группа НП: ') + VarToStr(Table2NP_GRP.AsInteger) +', '+ GetNpGName(Table2NP_GRP.AsInteger) +')');
                    AutoCalcNal(Table2NP_GRP.AsInteger, Litr, Table2N_Price.AsFloat, 0, 0);
                  end;

                  if sMes = 'OTHER' then
                  begin
                    if AdmSettings.Exist('DR_CORR_OPER') then
                      sMes := AdmSettings.Get('DR_CORR_OPER');
                    if sMes = '' then sMes := '287';

                    GetLogMes(
                      TranslateText('Дополнительная реализация по операции "')+ GetOperationName(StrToInt(sMes)) +'" '+
                      FloatToStrF(Litr, ffFixed, 15, 3) +TranslateText(' литров! (Группа НП: ') +
                      VarToStr(Table2NP_GRP.AsInteger) +', '+ GetNpGName(Table2NP_GRP.AsInteger) +')');
                    AutoCalcOther(StrToInt(sMes), null, null,
                      Table2NP_GRP.AsInteger, Litr, Table2N_Price.AsFloat, null, null, null);
                  end;
                end
                else
                begin
                  GetLogMes(TranslateText('Дополнительная реализация за нал. ')+ FloatToStrF(Litr, ffFixed, 15, 3) +
                    TranslateText(' литров! (Группа НП: ') + VarToStr(Table2NP_GRP.AsInteger) +', '+ GetNpGName(Table2NP_GRP.AsInteger) +')');
                  AutoCalcNal(Table2NP_GRP.AsInteger, Litr, Table2N_Price.AsFloat, 0, 0);
                end;
                //--------------------------------------------------------------
              end
              else
                if Litr > 200 then
                  GetLogMes(TranslateText('Дополнительная реализация ')+ FloatToStrF(Litr, ffFixed, 15, 3) +
                    TranslateText(' литров НЕ будет внесена! (Группа НП: ') + VarToStr(Table2NP_GRP.AsInteger) +', '+ GetNpGName(Table2NP_GRP.AsInteger) +')');
            end;
          Table2.Next;
        end;
      end;
    finally
      SL_SUMCOUNTERS.Free;
    end;
    //--------------------------------------------------------------------------
    log('Конец обработки пакета с АЗС');

    // це перший змінний звіт із позначкою про необхідність повторного переприйняття
    if GetSqlValueParSimple(
      'select count(*) from oil_daily_rep' +
      ' where state = ''Y'' and resave = ''Y''' +
      '   and azs_id = :p_azs_id and azs_inst = :p_azs_id' +
      '   and to_date(to_char(rep_date,    ''dd.mm.rrrr HH24:mi''), ''dd.mm.rrrr HH24:mi'') <' +
      '       to_date(to_char(:p_rep_date, ''dd.mm.rrrr HH24:mi''), ''dd.mm.rrrr HH24:mi'')',
      ['p_rep_date', dbeRepNum.DataSource.DataSet.FieldByName('Rep_Date').AsDateTime,
       'p_azs_id',   dbeRepNum.DataSource.DataSet.FieldByName('AZS_Id').AsInteger]) = 0 then
      dbeRepNum.DataSource.DataSet.FieldByName('RESAVE').Clear
    else
      dbeRepNum.DataSource.DataSet.FieldByName('RESAVE').AsString := 'Y';

    NpList := '';
    Table2.DisableControls;
    try
      Table2.First;
      while not Table2.Eof do
      begin
        if (Table2Base.AsInteger = 1) and (pos(';' + Table2.FieldByName('np_type_id').AsString + '=', ';' + NpList) = 0) then
          NpList := NpList + Format('%d=%f;', [Table2.FieldByName('np_type_id').AsInteger, Table2.FieldByName('n_price').AsFloat]);
        Table2.Next;
      end;
    finally
      Table2.EnableControls;
    end;
    GetInfSumm(); // отримання загальної суми
    Table2.First;
    if Visible then dbgRashod.SetFocus;
  except on E: Exception do
    GetExcMes(E.Message);
  end;
  log('--Точка выхода. Реализация ->');
end;
//==============================================================================
procedure TSRepForm.SrTalonFormOne(Talon: TSRTalonForm);
begin
  Talon.dbgTalon.ReadOnly :=
    dbceAZSName.DataSource.DataSet.FieldByName('LOAD_PRIH_TALON').AsString = 'Y';
  Talon.ceDep.Enabled := not Talon.dbgTalon.ReadOnly;
  Talon.sbDel.Enabled := not Talon.dbgTalon.ReadOnly;
  Talon.Import.Enabled := not Talon.dbgTalon.ReadOnly;
  Talon.Export.Enabled := not Talon.dbgTalon.ReadOnly;
  Talon.Edit6.Enabled := not Talon.dbgTalon.ReadOnly;

  if not (Table2.State = dsBrowse) then Table2.Post;
  // Загрузка параметров в форму
  Talon.MId := dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger;
  Talon.MInst := dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsInteger;
  Talon.MAzs_Id := dbeRepNum.DataSource.DataSet.FieldByName('Azs_Id').AsInteger;
  Talon.MAzs_Inst := dbeRepNum.DataSource.DataSet.FieldByName('Azs_Inst').AsInteger;
  Talon.MDateTime := dbeRepNum.DataSource.DataSet.FieldByName('REP_DATE').AsDateTime;
  Talon.MNum := dbeRepNum.DataSource.DataSet.FieldByName('REP_NUM').AsString;
    
  Talon.Ttn_Id := Table2Ttn_id.AsInteger;
  Talon.Ttn_Inst := Table2Ttn_Inst.AsInteger;
  Talon.Old_Ttn_Id := Table2Ttn_id.AsInteger;
  Talon.Old_Ttn_Inst := Table2Ttn_Inst.AsInteger;
  Talon.NP_GRP := Table2NP_GRP.AsInteger;
  Talon.leSubPart.Text := Table2.FieldByName('Part_Name').AsString + '/' + Table2.FieldByName('SubPart_Name').AsString;

  if Table2TTN_ID.AsString = '' then
    raise Exception.Create(TranslateText('Не найдено подпартии с которой можно провести реализацию!'));

  qWork.Close;
  qWork.SQL.Text := 'select Round((p.SS * r.Ud_Weig)/1000, 2) from Oil_Part p, Oil_Rashod r ' +
    'where r.Id = '+ Table2TTN_ID.AsString +' and r.Inst = '+ Table2TTN_INST.AsString +
    ' and p.Id = r.Part_Id and p.Inst = r.Part_Inst';
  qWork.Open;
  Talon.Price := qWork.Fields[0].AsFloat;
  Talon.PR_Date := trunc(dbdeRepDate.Value);
  Talon.ud_weig := Table2ud_weig.AsFloat;
  // Загрузка информации в временные таблицы
  qPriv.Close;
  qPriv.SQL.Text :=
    'select * from Oil_SRTalon.DB  where ttn_id = '+ Table2TTN_ID.AsString +' and ttn_inst = '+ Table2TTN_INST.AsString;
  qPriv.Open;

  Table4.Tablename := 'Oil_SRTalonT.DB';
  Table4.EmptyTable;
  Table4.Open;
  while not qPriv.Eof do
  begin
    table4.Insert;
    Table4.FieldByName('TTN_ID').Value := qPriv.FieldByName('ttn_id').Value;
    Table4.FieldByName('TTN_INST').Value := qPriv.FieldByName('ttn_inst').Value;
    Table4.FieldByName('SER').Value := qPriv.FieldByName('SER').AsString;
    Table4.FieldByName('NUM').Value := qPriv.FieldByName('NUM').AsInteger;
    Table4.FieldByName('litr').Value := qPriv.FieldByName('litr').AsFloat;
    Table4.FieldByName('countt').Value := qPriv.FieldByName('COUNT_T').AsFloat;
    Table4.FieldByName('price').AsFloat := Talon.Price;
    Table4.FieldByName('subpart').Value := qPriv.FieldByName('subpart').AsInteger;
    Table4.FieldByName('NPGrp_Id').Value := qPriv.FieldByName('NPGrp_Id').Value;
    Table4.FieldByName('AUTO_ID').Value := qPriv.FieldByName('AUTO_ID').Value;
    Table4.FieldByName('AUTO_INST').Value := qPriv.FieldByName('AUTO_INST').Value;
    Table4.FieldByName('EMPLOY_ID').Value := qPriv.FieldByName('EMPLOY_ID').Value;
    Table4.FieldByName('EMPLOY_INST').Value := qPriv.FieldByName('EMPLOY_INST').Value;
    Table4.FieldByName('InTheWay').Value := qPriv.FieldByName('InTheWay').Value;
    Table4.Post;
    qPriv.Next;
  end;
  Table4.Close;
  Table4.Tablename := 'Oil_SRTalon.DB';
end;
//==============================================================================
procedure TSRepForm.SrTalonFormTwo(Talon: TSRTalonForm);
begin
  if Talon.ModalResult = mrOk then
  begin
    Table2.Edit;
    Table2TALON.Clear;
    Table2.Post;
    // Выгрузка информации с временных таблиц
    qPriv.Close;
    qPriv.SQL.Text :=
      ' delete from Oil_SRTalon.DB where ttn_id = '+ Table2TTN_ID.AsString +' and ttn_inst = '+ Table2TTN_INST.AsString;
    qPriv.ExecSQL;
    qPriv.Close;
    Talon.Table1.First;
    Table4.Open;
    while not Talon.Table1.Eof do
    begin
      Table4.Insert;
      Table4.FieldByName('TTN_ID').Value := Talon.TTN_Id;
      Table4.FieldByName('TTN_INST').Value := Talon.TTN_Inst;
      Table4.FieldByName('SER').Value := Talon.Table1.FieldByName('SER').AsString;
      Table4.FieldByName('NUM').Value := Talon.Table1.FieldByName('NUM').AsInteger;
      Table4.FieldByName('litr').Value := Talon.Table1.FieldByName('litr').AsFloat;
      Table4.FieldByName('Count_T').Value := Talon.Table1.FieldByName('COUNTT').AsFloat;
      Table4.FieldByName('price').Value := Talon.Table1.FieldByName('price').AsFloat;
      if Talon.Table1.FieldByName('NPGrp_Id').IsNull then
        Table4.FieldByName('NPGrp_Id').Value := Talon.NP_GRP
      else Table4.FieldByName('NPGrp_Id').Value := Talon.Table1.FieldByName('NPGrp_Id').Value;
      Table4.FieldByName('subpart').Value := Talon.Table1.FieldByName('subpart').AsInteger;
      Table4.FieldByName('AUTO_ID').Value := Talon.Table1.FieldByName('AUTO_ID').Value;
      Table4.FieldByName('AUTO_INST').Value := Talon.Table1.FieldByName('AUTO_INST').Value;
      Table4.FieldByName('EMPLOY_ID').Value := Talon.Table1.FieldByName('EMPLOY_ID').Value;
      Table4.FieldByName('EMPLOY_INST').Value := Talon.Table1.FieldByName('EMPLOY_INST').Value;
      Table4.FieldByName('InTheWay').Value := Talon.Table1.FieldByName('InTheWay').Value;
      Table4.Post;
      Talon.Table1.Next;
    end;
    Table4.Close;
    Table2.DisableControls;
    try
      Table2.First;
      while not ((Table2.Eof) or ((Talon.TTN_Id = Table2TTN_ID.AsInteger)
        and (Talon.TTN_Inst = Table2TTN_INST.AsInteger)))
      do
        Table2.Next;
    finally
      Table2.EnableControls;
    end;
    Table2.Edit;
    Table2TALON.AsFloat := StrToFloat(Talon.lOut.Caption);
    Table2.Post;
  end;
  Talon.Table1.Close;
end;
//==============================================================================
procedure TSRepForm.dbgRashodEditButtonClick(Sender: TObject);
var
  Ved: TVedForm;
  OTF: TSOtherForm;
begin
  // Открытие формы редактирования талонов
  if dbgRashod.SelectedField.Name = 'Table2TALON' then
  begin
    Application.CreateForm(TSRTalonForm, Talon);
    try
      // кому приходують талони
      Talon.TalonDepID := TalonDepID;
      Talon.TalonDepINST := TalonDepINST;

      SrTalonFormOne(Talon);
      Talon.ShowModal;
      SrTalonFormTwo(Talon);
    finally
      Talon.Free;
    end;
    exit;
  end;
  // Открытие формы редактирования реализации по ведомости
  if dbgRashod.SelectedField.Name = 'Table2VED' then
  begin
    Application.CreateForm(TVedForm, Ved);
    if not (Table2.State = dsBrowse) then Table2.Post;
    Ved.StartLitr := MRound(Table2C_Litr.AsFloat + Table2Ved.AsFloat, 3);
    Ved.PartBase := Table2Base.Value;
    Ved.Ttn_Id := Table2Ttn_id.AsInteger;
    Ved.Ttn_Inst := Table2Ttn_Inst.AsInteger;
    Ved.SubPart := Table2SubPart_Name.AsInteger;
    Ved.NPName := Table2NPType_Name.Value;
    Ved.ud_weig := Table2ud_weig.AsFloat;
    Ved.lblOwnGoods.Caption := Table2Own_good.Value;
    // Загрузка информации в временные таблицы
    qPriv.Close;
    qPriv.SQL.Text :=
      'select * from Oil_Vedomost.db where ttn_id = '+ Table2TTN_ID.AsString +' and ttn_inst = '+ Table2TTN_INST.AsString;
    qPriv.Open;
    qPriv.First;
    Table3.Tablename := 'Oil_VedomostT.db';
    Table3.EmptyTable;
    Table3.Open;
    while not qPriv.Eof do
    begin
      table3.Insert;
      Table3.FieldByName('TTN_ID').Value := qPriv.FieldByName('TTN_Id').AsInteger;
      Table3.FieldByName('TTN_INST').Value := qPriv.FieldByName('TTN_Inst').AsInteger;
      Table3.FieldByName('ORG_ID').Value := qPriv.FieldByName('ORG_ID').Value;
      Table3.FieldByName('ORG_INST').Value := qPriv.FieldByName('Org_INST').Value;
      Table3.FieldByName('ORG_NAME').Value := qPriv.FieldByName('ORG_NAME').AsString;
      Table3.FieldByName('Dog_Id').Value := qPriv.FieldByName('Dog_Id').Value;
      Table3.FieldByName('Dog_Inst').Value := qPriv.FieldByName('Dog_Inst').Value;
      Table3.FieldByName('litr').AsFloat := qPriv.FieldByName('litr').AsFloat;
      Table3.FieldByName('countt').AsFloat := qPriv.FieldByName('COUNT_T').AsFloat;
      Table3.FieldByName('Price').AsFloat := qPriv.FieldByName('Price').AsFloat;
      Table3.FieldByName('Amount').AsFloat := qPriv.FieldByName('Amount').AsFloat;
      Table3.FieldByName('subpart').AsInteger := qPriv.FieldByName('subpart').AsInteger;
      Table3.Post;
      qPriv.Next;
    end;
    Table3.Close;
    Table3.TableName := 'Oil_Vedomost.db';
    Ved.ShowModal;
    if Ved.ModalResult = mrOk then
    begin
      DogEdit := Ved.DogEdit;
      // Выгрузка информации с временных таблиц
      qPriv.Close;
      qPriv.SQL.Text :=
        'delete from Oil_Vedomost.db where ttn_id = '+ Table2TTN_ID.AsString +' and ttn_inst = '+ Table2TTN_INST.AsString;
      qPriv.ExecSQL;
      Ved.Table1.First;
      Table3.Open;
      while not ved.table1.Eof do
      begin
        table3.Insert;
        Table3.FieldByName('TTN_ID').Value := ved.table1.FieldByName('ttn_id').AsInteger;
        Table3.FieldByName('TTN_INST').Value := ved.table1.FieldByName('ttn_inst').AsInteger;
        Table3.FieldByName('ORG_ID').Value := ved.table1.FieldByName('ORG_ID').Value;
        Table3.FieldByName('ORG_INST').Value := ved.table1.FieldByName('Org_INST').Value;
        Table3.FieldByName('ORG_NAME').Value := ved.table1.FieldByName('ORG_NAME').AsString;
        Table3.FieldByName('Dog_Id').Value := ved.table1.FieldByName('Dog_Id').Value;
        Table3.FieldByName('Dog_Inst').Value := ved.table1.FieldByName('Dog_Inst').Value;
        Table3.FieldByName('litr').AsFloat := ved.table1.FieldByName('litr').AsFloat;
        Table3.FieldByName('Count_T').AsFloat := ved.table1.FieldByName('COUNTT').AsFloat;
        Table3.FieldByName('Price').AsFloat := ved.table1.FieldByName('Price').AsFloat;
        Table3.FieldByName('Amount').AsFloat := ved.table1.FieldByName('Amount').AsFloat;
        Table3.FieldByName('subpart').Value := ved.table1.FieldByName('subpart').AsInteger;
        Table3.Post;
        ved.Table1.Next;
      end;
      Table3.Close;
      qPriv.Close;
      qPriv.SQL.Text := 'select sum(Litr), sum(Litr * Price) from Oil_VedomostT.db';
      qPriv.Open;
      Table2.Edit;
      Table2VED.AsFloat := qPriv.Fields[0].AsFloat;
      Table2.Post;
    end;
    ved.table1.Close;
    Ved.Free;
    exit;
  end;
  // Открытие формы редактирования реализации по прочим операциям
  if dbgRashod.SelectedField.Name = 'Table2Other' then
  begin
    Application.CreateForm(TSOtherForm, OTF);
    if not (Table2.State = dsBrowse) then Table2.Post;
    OTF.StartLitr := MRound(Table2C_Litr.AsFloat + Table2Other.AsFloat, DR_ROUND_COUNT);
    OTF.PartBase := Table2Base.Value;
    OTF.Ttn_Id := Table2Ttn_id.AsInteger;
    OTF.Ttn_Inst := Table2Ttn_Inst.AsInteger;
    OTF.SubPart := Table2SubPart_Name.AsInteger;
    OTF.NPName := Table2NPType_Name.Value;
    OTF.ud_weig := Table2ud_weig.AsFloat;
    OTF.Own_Goods := Table2Own_Good.asString;
    // Загрузка информации в временные таблицы
    qPriv.Close;
    qPriv.SQL.Text :=
      'select * from oil_srother.db where ttn_id = '+ Table2TTN_ID.AsString +' and ttn_inst = '+ Table2TTN_INST.AsString;
    qPriv.Open;
    qPriv.First;

    Table5.Tablename := 'oil_srotherT.db';
    Table5.EmptyTable;
    Table5.Open;
    while not qPriv.Eof do
    begin
      Table5.Insert;
      Table5.FieldByName('TTN_ID').Value := qPriv.FieldByName('ttn_id').Value;
      Table5.FieldByName('TTN_INST').Value := qPriv.FieldByName('ttn_inst').Value;
      Table5.FieldByName('OPER_ID').Value := qPriv.FieldByName('OPER_ID').Value;
      Table5.FieldByName('OPER_NAME').AsString := qPriv.FieldByName('OPER_NAME').AsString;
      Table5.FieldByName('litr').AsFloat := qPriv.FieldByName('litr').AsFloat;
      Table5.FieldByName('countt').AsFloat := qPriv.FieldByName('COUNT_T').AsFloat;
      Table5.FieldByName('Price').AsFloat := qPriv.FieldByName('Price').AsFloat;
      Table5.FieldByName('subpart').Value := qPriv.FieldByName('subpart').Value;
      Table5.FieldByName('org_id').Value := qPriv.FieldByName('org_id').Value;
      Table5.FieldByName('org_inst').Value := qPriv.FieldByName('org_inst').Value;
      Table5.FieldByName('org_name').AsString := qPriv.FieldByName('org_name').AsString;
      Table5.FieldByName('Auto_Id').Value := qPriv.FieldByName('Auto_Id').Value;
      Table5.FieldByName('Auto_Inst').Value := qPriv.FieldByName('Auto_Inst').Value;
      Table5.FieldByName('Employ_Id').Value := qPriv.FieldByName('Employ_Id').Value;
      Table5.FieldByName('Employ_Inst').Value := qPriv.FieldByName('Employ_Inst').Value;
      Table5.FieldByName('SC_Number').AsString := qPriv.FieldByName('SC_Number').AsString;
      Table5.FieldByName('SC_Rest').AsFloat := qPriv.FieldByName('SC_Rest').AsFloat;
      Table5.FieldByName('SC_Cheque').AsString := qPriv.FieldByName('SC_Cheque').AsString;
      Table5.FieldByName('Dog_Id').Value := qPriv.FieldByName('Dog_Id').Value;
      Table5.FieldByName('Dog_Inst').Value := qPriv.FieldByName('Dog_Inst').Value;
      if qPriv.FieldByName('Amount').IsNull then
        Table5.FieldByName('Amount').Value := MRound(qPriv.FieldByName('litr').AsFloat * qPriv.FieldByName('Price').AsFloat, 2)
      else Table5.FieldByName('Amount').Value := qPriv.FieldByName('Amount').Value;
      Table5.Post;
      qPriv.Next;
    end;
    Table5.Close;
    Table5.TableName := 'oil_srother.db';
    OTF.F := Self;
    OTF.ShowModal;
    if OTF.ModalResult = mrOk then
    begin
      DogEdit := OTF.DogEdit;
      // Выгрузка информации с временных таблиц
      qPriv.Close;
      qPriv.SQL.Text :=
        'delete from oil_srother.db where ttn_id = '+ Table2TTN_ID.AsString +' and ttn_inst = '+ Table2TTN_INST.AsString;
      qPriv.ExecSQL;
      OTF.Table1.First;
      Table5.Open;
      while not OTF.table1.Eof do
      begin
        table5.Insert;
        Table5.FieldByName('TTN_ID').Value := OTF.table1.FieldByName('ttn_id').Value;
        Table5.FieldByName('TTN_INST').Value := OTF.table1.FieldByName('ttn_inst').Value;
        Table5.FieldByName('OPER_ID').Value := OTF.table1.FieldByName('OPER_ID').Value;
        Table5.FieldByName('OPER_NAME').AsString := OTF.table1.FieldByName('OPER_NAME').AsString;
        Table5.FieldByName('litr').AsFloat := OTF.table1.FieldByName('litr').AsFloat;
        Table5.FieldByName('Count_T').AsFloat := OTF.table1.FieldByName('COUNTT').AsFloat;
        Table5.FieldByName('price').AsFloat := OTF.table1.FieldByName('price').AsFloat;
        Table5.FieldByName('subpart').Value := OTF.table1.FieldByName('subpart').Value;
        Table5.FieldByName('org_id').Value := OTF.table1.FieldByName('org_id').Value;
        Table5.FieldByName('org_inst').Value := OTF.table1.FieldByName('org_inst').Value;
        Table5.FieldByName('org_name').AsString := OTF.table1.FieldByName('org_name').AsString;
        Table5.FieldByName('Auto_Id').Value := OTF.table1.FieldByName('Auto_Id').Value;
        Table5.FieldByName('Auto_Inst').Value := OTF.table1.FieldByName('Auto_Inst').Value;
        Table5.FieldByName('Employ_Id').Value := OTF.table1.FieldByName('Employ_Id').Value;
        Table5.FieldByName('Employ_Inst').Value := OTF.table1.FieldByName('Employ_Inst').Value;
        Table5.FieldByName('SC_Number').AsString := OTF.table1.FieldByName('SC_Number').AsString;
        Table5.FieldByName('SC_Rest').AsFloat := OTF.table1.FieldByName('SC_Rest').AsFloat;
        Table5.FieldByName('SC_Cheque').AsString := OTF.table1.FieldByName('SC_Cheque').AsString;
        Table5.FieldByName('Dog_Id').Value := OTF.table1.FieldByName('Dog_Id').Value;
        Table5.FieldByName('Dog_Inst').Value := OTF.table1.FieldByName('Dog_Inst').Value;
        Table5.FieldByName('Amount').Value := OTF.table1.FieldByName('Amount').Value;
        Table5.Post;
        OTF.table1.next;
      end;
      Table5.Close;
      Table2.Edit;
      Table2Other.Value := OTF.OtherOut;
      qPriv.Close;
      qPriv.SQL.Text := 'select sum(CountT) from Oil_SROtherT.db ';
      qPriv.Open;
      Table2Other_Weight.AsFloat := qPriv.Fields[0].AsFloat;
      Table2.Post;
    end;
    OTF.Table1.Close;
    OTF.Free;
    exit;
  end;
  dbgRashod.SelectedField.FocusControl;
end;
//==============================================================================
procedure TSRepForm.Table2CalcFields(DataSet: TDataSet);
var
  pOUT_VED_COUNT, pOUT_TALON_COUNT: Variant;
begin
  if Table2TTN_ID.IsNull then
    raise Exception.Create(TranslateText('При пересчете остатков в закладке "Реализация" не найдено поле "TTN_ID"!'));

  Table2C_Litr.Value :=
    MRound(Table2Litr.Value, 3) -
    MRound((Table2Nal.AsFloat + Table2Ved.AsFloat + Table2SN.AsFloat + Table2Talon.AsFloat + Table2Other.AsFloat), 3);

  if Table2C_Litr.Value <> 0 then
  begin
    if Table2Base.Value = 1 then
      Table2C_count.Value :=
        MRound(Table2CCount.Value, DR_ROUND_COUNT) -
        MRound(Table2Other_Weight.AsFloat + Table2Nal.AsFloat + Table2Ved.AsFloat + Table2SN.AsFloat + Table2Talon.AsFloat, DR_ROUND_COUNT)
    else
    begin
      pOUT_VED_COUNT := 0;
      pOUT_TALON_COUNT := 0;
      if (Table2TTN_ID.AsInteger <> 0) and (Table2TTN_INST.AsInteger <> 0) then
      begin
        if Table2Ved.AsFloat <> 0 then
        begin
          if qPrivAdd.Active then qPrivAdd.Close;
          qPrivAdd.SQL.Text :=
            'select sum(COUNT_T) from Oil_Vedomost.DB where ttn_id = '+ Table2TTN_ID.AsString +' and ttn_inst = '+ Table2TTN_INST.AsString;
          qPrivAdd.Open;
          pOUT_VED_COUNT := MRound(qPrivAdd.Fields[0].AsFloat, DR_ROUND_COUNT);
        end;

        if Table2Talon.AsFloat <> 0 then
        begin
          if qPrivAdd.Active then qPrivAdd.Close;
          qPrivAdd.SQL.Text :=
            'select sum(count_t) from Oil_SRTalon.DB where ttn_id = '+ Table2TTN_ID.AsString +' and ttn_inst = '+ Table2TTN_INST.AsString;
          qPrivAdd.Open;
          pOUT_TALON_COUNT := MRound(qPrivAdd.Fields[0].AsFloat, DR_ROUND_COUNT);
        end;
        if qPrivAdd.Active then qPrivAdd.Close;
      end;

      Table2C_count.Value :=
        MRound(Table2CCount.Value, DR_ROUND_COUNT) -
        MRound(Table2Other_Weight.AsFloat + pOUT_VED_COUNT + pOUT_TALON_COUNT +
          MRound((Table2Nal.AsFloat + Table2SN.AsFloat) * Table2Ud_weig.Value / Get1000,
            DR_ROUND_COUNT), DR_ROUND_COUNT)
    end;
  end
  else Table2C_count.Value := 0;
end;
//==============================================================================
procedure TSRepForm.pmRashPopup(Sender: TObject);
begin
  if not Table2.Eof then
    if Table2TTN_ID.Value <> Null then N1.Enabled := True
    else N1.Enabled := False
  else N1.Enabled := False;
end;
//==============================================================================
procedure TSRepForm.Table2BeforePost(DataSet: TDataSet);
begin
  Table2N_Price.AsFloat := MRound(Table2N_Price.AsFloat, 2);
  if nb.ActivePage = 'Rashod' then
  begin
    if (not (Table2NAL.IsNull)) and (not (Table2N_Price.IsNull)) then
      if (Abs(Table2Nal_Money.AsFloat - (Table2Nal.AsFloat * Table2N_Price.AsFloat)) >
          Abs(Table2Nal.AsFloat * Table2N_Price.AsFloat * SrepKorrPercent * 0.01))
        and not Table2bSkidka.AsBoolean then
      begin
        GetLogMes(TranslateText('Корректировка суммы "') + CurrToStr(SrepKorrPercent) + TranslateText('%" превышена!') +#13+
          TranslateText('Тип НП: ')+ Table2NPType_Name.AsString +#13+
          TranslateText('Литры: ')+ Table2Nal.AsString +#13+
          TranslateText('Цена: ')+ Table2N_Price.AsString +#13+
          TranslateText('Сумма: ')+ Table2Nal_Money.AsString +#13+
          TranslateText('Превышено: ')+
            CurrToStr(MRound(Abs(Table2Nal_Money.AsFloat / (Table2Nal.AsFloat * Table2N_Price.AsFloat / 100)) - 100, 2)) +'%');
        Table2Nal_Money.AsFloat := MRound(Table2Nal.AsFloat * Table2N_Price.AsFloat, 2);
      end
      else Table2Nal_Money.AsFloat := MRound(Table2Nal_Money.AsFloat, 2)
    else Table2Nal_Money.Clear;
  end;
end;
//==============================================================================
procedure TSRepForm.Table2AfterEdit(DataSet: TDataSet);
begin
  Table2bEdited.AsBoolean := true;
end;
//==============================================================================
procedure TSRepForm.actIncasExecute(Sender: TObject);
var
  nominal: Currency;
  sMes: string;
begin        
  if not ((nb.ActivePage = 'Rashod') and bbIncas.Enabled) then exit;

  // Проверка на полное разнесение номинала талона
  qPriv.Close;
  qPriv.SQL.Text := 'select Ser, Num, sum(Litr) as Litr from Oil_SRTalon.DB where Ser is not null group by Ser, Num';
  qPriv.Open;
  while not qPriv.Eof do
  begin
    if qPriv.FieldByName('ser').AsString <> '' then
    begin
      nominal := GetTalonNominal(qPriv.FieldByName('ser').AsString);
      if qPriv.FieldByName('Litr').AsFloat > nominal then
        raise Exception.Create(TranslateText('Талон ') + qPriv.FieldByName('Ser').AsString + '/' + qPriv.FieldByName('Num').AsString + TranslateText(' перерасходован на ') + CurrToStr(qPriv.FieldByName('Litr').AsFloat - nominal) + ' !');
      if qPriv.FieldByName('Litr').AsFloat < nominal then
        raise Exception.Create(TranslateText('Талон ') + qPriv.FieldByName('Ser').AsString + '/' + qPriv.FieldByName('Num').AsString + TranslateText(' недорасходован на ') + CurrToStr(nominal - qPriv.FieldByName('Litr').AsFloat) + ' !');
    end;
    qPriv.Next;
  end;
  // Подсчет наличных денег и литров
  Table2.Filtered := False;
  Table2.First;

  ceGET.Value := 0;
  curAmountLitr.Value := 0;
  cedAddMoney.Value := 0;
  cedShtukiSum.Value := 0;
  cedNpSum.Value := 0;
  sbCloseDetailsClick(nil);

  Table2.DisableControls;
  try
    while not Table2.Eof do
    begin
      if Table2Base.Value = 1 then
        CedShtukiSum.Value := CedShtukiSum.Value + MRound(Table2NAL_Money.AsFloat, 2)
      else CedNpSum.Value := CedNpSum.Value + MRound(Table2NAL_Money.AsFloat, 2);
      ceGET.Value := ceGET.Value + MRound(Table2Nal_Money.AsFloat, 2);
      curAmountLitr.Value := curAmountLitr.Value + Table2Nal.AsFloat + Table2Ved.AsFloat +
        Table2Talon.AsFloat + Table2SN.AsFloat + Table2Other.AsFloat;

      if not DR_AUTOLOAD and Visible then
      begin
        // Проверка на правильное занесение расхода
        sMes := TranslateText('Расход введен не правильно по товару ')+ Table2NPType_Name.AsString +' !';
        if not DR_AUTOLOAD and ((Table2C_count.AsFloat < 0) or (Table2C_Litr.AsFloat < 0)) then
        begin
          if MessageDlgExt(sMes +#10#13+ TranslateText('Продолжить?'), mtWarning,
            [TranslateText('Да'), TranslateText('Нет')], 2) = 2 then exit;
        end;

        if not DR_AUTOLOAD and ((Table2C_Litr.AsFloat < MINIMAL_REST) and (Table2C_Litr.AsFloat > 0)) then
        begin
          if MessageDlgExt(sMes +#10#13+ TranslateText('Остаток по товару меньше 1 (одного/одной) литра/штуки.') +
            #10#13+ TranslateText('Продолжить?'), mtWarning,
            [TranslateText('Да'), TranslateText('Нет')], 2) = 2 then exit;
        end;

        if Table2SN.AsFloat > 0 then
          raise Exception.Create(TranslateText('Ввод в колонку собств. нужды запрещен!') + #13#10 +
            TranslateText('Перенесите отпуск на собств. нужды в форму "Прочие"'));
      end;
      Table2.Next;
    end;
  finally
    Table2.EnableControls;
  end;

  // Проверка правильности занесения цены
  Table2.DisableControls;
  try
    Table2.Filtered := false;
    Table2.Filter := '(N_Price <= 0 or N_Price > 20) and Base = 0';
    Table2.Filtered := true;
    if not Table2.IsEmpty then
      GetLogMes(TranslateText('Не правильно определена цена за литр!'));
  finally
    Table2.Filter := '';
    Table2.Filtered := false;
    Table2.EnableControls;
  end;

  // завантаження секції MONEY
  if IsPacketLoaded then
    if Packet.OpenSection('MONEY') > 0 then
    begin
      ceSTART.Value := Packet.FieldByName('BEGCASH').AsFloat;
      ceOUT.Value := Packet.FieldByName('INCAS').AsFloat;
      //ceEND.Value := Packet.FieldByName('ENDCASH').AsFloat;
    end;

  // Выборка остатков с предидущего сменного отчета
  qPrevRest.Close;
  _OpenQueryPar(qPrevRest,
    ['p_azs_id', dbceAZSName.DataSource.DataSet.FieldByName('AZS_Id').AsInteger,
     'p_date',   dbdeRepDate.Value,
     'p_smena',  dbeSmenaNum.Text]);
  // Выборка инкасированных денег
  qWork.Close;
  qWork.SQL.Text :=
    'select Sm_Out, Sm_Out_Sht, Sm_Out_Np, Sm_Start_Np, Sm_Start_Sht, Sm_End, Sm_Polis_Get, Sm_Start ' +
    'from Oil_DR_Money where State = ''Y'' and Rep_Id = :Rep_Id and Rep_Inst = :Rep_Inst';
  _OpenQueryPar(qWork,
    ['rep_id',   dbceAZSName.DataSource.DataSet.FieldByName('Id').AsInteger,
     'rep_inst', dbceAZSName.DataSource.DataSet.FieldByName('Inst').AsInteger]);
  {инкассация общая}
  if qWork.FieldByName('Sm_Out').AsFloat <> 0 then lrealKassa.Caption := qWork.FieldByName('Sm_Out').AsString
  else lrealKassa.Caption := '0';
  if not IsPacketLoaded then
    ceOUT.Value := qWork.FieldByName('Sm_Out').AsFloat;
  {инкассация по нп}
  if qWork.FieldByName('Sm_Out_Np').IsNull then cedNpKassa.Value := ceOUT.Value
  else cedNpKassa.Value := qWork.FieldByName('Sm_Out_Np').AsFloat;
  {остатки по штучному товару}
  if qPrevRest.FieldByName('sm_end_sht').IsNull then cedOstBeginSht.Value := qWork.FieldByName('Sm_Start_Sht').AsFloat
  else cedOstBeginSht.Value := qPrevRest.FieldByName('sm_end_sht').AsFloat;
  {остатки по нефтепродуктам}
  if qPrevRest.FieldByName('sm_end_np').IsNull then
    if qWork.FieldByName('sm_Start_Np').IsNull then cedOstBeginNp.Value := ceSTART.Value
    else cedOstBeginNp.Value := qWork.FieldByName('sm_Start_Np').AsFloat
  else cedOstBeginNp.Value := qPrevRest.FieldByName('sm_end_np').AsFloat;
  {инкассация по штучному товару}
  cedShtukiKassa.Value := qWork.FieldByName('Sm_Out_Sht').AsFloat;
  {общий остаток на начало}
  if qPrevRest.FieldByName('Sm_End').AsFloat <> 0 then lRealRest.Caption := qPrevRest.FieldByName('Sm_End').AsString
  else lRealRest.Caption := '0';
  if not IsPacketLoaded then
    if qWork.FieldByName('Sm_Start').AsFloat <> 0 then
      ceSTART.Value := qWork.FieldByName('Sm_Start').AsFloat
    else
      ceSTART.Value := qPrevRest.FieldByName('Sm_End').AsFloat;

  cedAddMoney.Value := qWork.FieldByName('sm_polis_get').AsFloat;
  {підводимо розбивку під ту, яка повинна бути}
  cedOstBeginNp.Value := ceSTART.Value - cedOstBeginSht.Value;
  cedNPKassa.Value := ceOUT.Value - cedShtukiKassa.Value;
  cedOstEndNp.Value := ceEND.Value - cedOstEndSht.Value;
  if sbCloseDetails.Down then
  begin
    cedOstBeginNpChange(nil);
    cedOstBeginShtChange(nil);
  end;
  ceSTARTChange(nil);
  // Выборка денег за реализацию по ведомости
  qPriv.Close;
  qPriv.SQL.Text := 'select sum(Amount) from Oil_Vedomost.db ';
  qPriv.Open;
  CurrencyEdit5.Value := qPriv.Fields[0].AsFloat;
  // Выборка денег за реализацию по талонам
  qPriv.Close;
  qPriv.sql.text := 'select sum(price * litr) from Oil_SRTalon.DB ';
  qPriv.Open;
  ceMoneyTal.Value := qPriv.Fields[0].AsFloat;
  // Выборка денег за реализацию по прочим операциям
  qPriv.Close;
  qPriv.sql.text := 'select sum(price * litr) from Oil_SrOther.DB ';
  qPriv.Open;
  CurrencyEdit7.Value := qPriv.Fields[0].AsFloat;
  if IsPacketLoaded then
  begin
    try
      if Packet.OpenSection('MONEY') = 0 then
      begin
        ceOUT.Value := 0;
        if Packet.OpenSection('INCAS') > 0 then
          while not (Packet.EndOfSection) do
          begin
            ceOUT.Value := ceOUT.Value + Packet.FieldByName('SUMM').AsFloat;
            Packet.NextRow;
          end;
      end;
    except on E: Exception do
      GetLogMes(TranslateText('Не удалось загрузить инкассацию с пакета')+#13#10+ E.Message);
    end;
    cedShtukiKassa.Value := cedNPKassa.Value - ceOUT.Value;
  end;
  nb.ActivePage := 'Money';
end;
//==============================================================================
procedure TSRepForm.actPrihExecute(Sender: TObject);
begin
  if not ((nb.ActivePage = 'Rashod') and bbPrihPrev.Enabled) then exit;

  IsShowDRD := false; // реалізація вже відображена

  if mode = 1 then pData.Enabled := True;
  nb.ActivePage := 'Prihod';
end;
//==============================================================================
procedure TSRepForm.ceSTARTChange(Sender: TObject);
begin
  ceEND.Value := ceSTART.Value + ceGET.Value + cedAddMoney.Value - ceOUT.Value;
  lRealRest.Visible := ceSTART.Text <> lRealRest.Caption;
  lOstCapt.Visible := lRealRest.Visible;
  lRealKassa.Visible := ceOUT.Text <> lRealKassa.Caption;
  lKassaCapt.Visible := lRealKassa.Visible;
end;
//==============================================================================
procedure TSRepForm.ceSTARTKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then ceOUT.SetFocus;
end;
//==============================================================================
procedure TSRepForm.GetRashodPrev(); // назад до реалізації
begin
  Table2.Filtered := true;
  nb.ActivePage := 'Rashod';
  if Visible then dbgRashod.SetFocus;
end;
//==============================================================================
procedure TSRepForm.FormShow(Sender: TObject);
var
  s: string;
begin
  if dbdeRepDate.DataSource.DataSet.State = dsBrowse then dbdeRepDate.DataSource.DataSet.Edit;
  SList := TStringList.Create;
  qPrih.ParamByName('Id').Value := dbeRepNum.DataSource.DataSet.FieldByName('Id').Value;
  qPrih.ParamByName('Inst').Value := dbeRepNum.DataSource.DataSet.FieldByName('Inst').Value;
  qPrih.Open;
  DogEdit := False;
  s := ReadOilVar('SREP_KORR_PERCENT');
  if s = '' then SrepKorrPercent := 0.3
  else SrepKorrPercent := StrToFloat(s);
  StartDateTime := dbdeRepDate.DataSource.DataSet.FieldByName('rep_date').AsDateTime;

  // логи
  if trim(dbeRepNum.DataSource.DataSet.FieldByName('RES_COMMENT').AsString) <> '' then
  begin
    pLogButton.Visible := true;
    mLog.Lines.Clear;
    if Main.INST  = 666 then
      mLog.Lines.Text :=
        trim(ReplaceAllSubstr(trim(dbeRepNum.DataSource.DataSet.FieldByName('RES_COMMENT').AsString), '  ', #13))
    else
      mLog.Lines.Text := trim(dbeRepNum.DataSource.DataSet.FieldByName('RES_COMMENT').AsString);
    if mLog.Lines.Count > 8 then
      pLog.Height := 15 * 8
    else
      pLog.Height := 15 * mLog.Lines.Count + 20;
    sbLog.Down := true;
    sbLog.Click;
  end;

  // секції
  if (dbeRepNum.DataSource.DataSet.FieldByName('AUTO_LOAD').AsString = 'P')
    or (dbeRepNum.DataSource.DataSet.FieldByName('AUTO_LOAD').AsString = 'PE') then
    pSectionsButton.Visible := true;

  // Не скрывать Талоны
  //----------------------------------------------------------------------------
  ceMoneyTal.Visible := false;
  if AdmSettings.Exist('DR_VISIBLE_TALON') then
    ceMoneyTal.Visible := AdmSettings.Get('DR_VISIBLE_TALON') = 'Y';

  lMoneyTal.Visible       := ceMoneyTal.Visible;
  sbLoadPrihTalon.Visible := ceMoneyTal.Visible;
  if not sbLoadPrihTalon.Visible then sbDelRash.Left := 5;
  miLoadPrihTalon.Visible := ceMoneyTal.Visible;
  dbgRashod.FieldColumns['TALON'].Visible := ceMoneyTal.Visible;
  //----------------------------------------------------------------------------

  // Не скрывать Собственные нужды
  dbgRashod.FieldColumns['SN'].Visible := false;
  if AdmSettings.Exist('DR_VISIBLE_SN') then
    dbgRashod.FieldColumns['SN'].Visible := AdmSettings.Get('DR_VISIBLE_SN') = 'Y';
end;
//==============================================================================
procedure TSRepForm.actFilterExecute(Sender: TObject);
var
  s: string;
begin
  if (nb.ActivePage <> 'Rashod') and (nb.ActivePage <> 'Prihod') then exit;

  // якщо це новий розрахунок густини і закладка "Реализация"
  if IsAVERAGE(dbdeRepDate.Value) and (nb.ActivePage = 'Rashod') then // змінюємо форму для фільтрації
    FF.Height := 195
  else FF.Height := 290;
  FF.rgTypePart.Visible := not IsAVERAGE(dbdeRepDate.Value) or (nb.ActivePage = 'Prihod');
  FF.ePart.Visible      := FF.rgTypePart.Visible;
  FF.sbPart.Visible     := FF.rgTypePart.Visible;
  FF.lPart.Visible      := FF.rgTypePart.Visible;

  FF.ShowModal;
  if FF.ModalResult = MrOk then
  begin
    s := '';

    if nb.ActivePage = 'Rashod' then
    begin
      Table2.DisableControls;
      try
        Table2.Filtered := False;
        //----------------------------------------------------------------------
        if FF.ceNPGrp.Tag <> -1 then
          s := 'np_grp = '+ IntToStr(FF.ceNPGrp.Tag);

        if FF.ceSop.Tag <> -1 then
        begin
          if s <> '' then s := s +' and ';
          s := 'us_subgroup_id = '+ IntToStr(FF.ceSop.Tag);
        end;

        if FF.rgTypePart.ItemIndex > 0 then
        begin
          if s <> '' then s := s +' and ';
          s := s +'own_good = '+ decode([FF.rgTypePart.ItemIndex, 1, '''K''', 2, '''O''']);
        end;
        //----------------------------------------------------------------------
        Table2.Filter := s;
        Table2.Filtered := True;
        GetInfSumm(); // отримання загальної суми
      finally
        Table2.EnableControls;
      end;
    end;

    if nb.ActivePage = 'Prihod' then
    begin
      qPrih.DisableControls;
      try
        qPrih.Filtered := False;
        //----------------------------------------------------------------------
        if FF.ceNPGrp.Tag <> -1 then
          s := 'np_grp_id = '+ IntToStr(FF.ceNPGrp.Tag);

        if FF.ceSop.Tag <> -1 then
        begin
          if s <> '' then s := s +' and ';
          s := 'us_subgroup_id = '+ IntToStr(FF.ceSop.Tag);
        end;

        if FF.rgTypePart.ItemIndex > 0 then
        begin
          if s <> '' then s := s +' and ';
          s := s +'own_goods = '+ decode([FF.rgTypePart.ItemIndex, 1, '''K''', 2, '''O''']);
        end;
        //----------------------------------------------------------------------
        qPrih.Filter := s;
        qPrih.Filtered := True;
      finally
        qPrih.EnableControls;
      end;
    end;
  end;
end;
//==============================================================================
procedure TSRepForm.Table2FilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := true;
  // Название
  if Accept and FF.eName.Visible and (FF.eName.Text <> '') then
    Accept := pos(AnsiUpperCase(FF.eName.Text), AnsiUpperCase(DataSet.FieldBYName('NPType_Name').AsString)) > 0;
  // Партия
  if Accept and FF.ePart.Visible and (FF.ePart.Text <> '') then
    Accept := pos(AnsiUpperCase(FF.ePart.Text), AnsiUpperCase(DataSet.FieldBYName('Part_Name').AsString)) > 0;
  // Только реализация
  if Accept and miOnlyRash.Checked then
    Accept := (Table2NAL.AsFloat <> 0) or (Table2VED.AsFloat <> 0) or (Table2SN.AsFloat <> 0)
      or (Table2TALON.AsFloat <> 0) or (Table2Other.AsFloat <> 0) or (Table2Other_Weight.AsFloat <> 0);
end;
//==============================================================================
procedure TSRepForm.qPrihFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := true;
  // Название
  if Accept and FF.eName.Visible and (FF.eName.Text <> '') then
    Accept := pos(AnsiUpperCase(FF.eName.Text), AnsiUpperCase(DataSet.FieldBYName('np_name').AsString)) > 0;
  // Партия
  if Accept and FF.ePart.Visible and (FF.ePart.Text <> '') then
    Accept := pos(AnsiUpperCase(FF.ePart.Text), AnsiUpperCase(DataSet.FieldBYName('dog').AsString)) > 0;
end;
//==============================================================================
procedure TSRepForm.GetInfSumm(); // отримання загальної суми
var
  sl: Currency;
  st: real;
begin
  sl := 0;
  st := 0;
  Table2.DisableControls;
  try
    CurBookMark := Table2.GetBookmark;
    Table2.First;
    while not Table2.Eof do
    begin
      sl := sl + MRound(Table2C_Litr.AsFloat, 3);
      st := st + MRound(Table2C_count.AsFloat, DR_ROUND_COUNT);
      Table2.Next;
    end;
    if Table2.BookmarkValid(CurBookMark) then
      Table2.GotoBookmark(CurBookMark);
    Table2.FreeBookMark(CurBookMark);

    l6.Caption := FloatToStrF(sl, ffFixed, 15, 3) +TranslateText('л.   ')+ FloatToStrF(st, ffFixed, 15, DR_ROUND_COUNT) +TranslateText('т.');
  finally
    Table2.EnableControls;
  end;
end;
//==============================================================================
procedure TSRepForm.sbDelClick(Sender: TObject);
begin
  if qPrih.Active and not qPrih.IsEmpty then qPrih.Delete;
end;
//==============================================================================
procedure TSRepForm.actDelRashExecute(Sender: TObject);
begin
  if nb.ActivePage <> 'Rashod' then exit;
  if Table2.IsEmpty then exit;

  if (dbceAZSName.DataSource.DataSet.FieldByName('LOAD_PRIH_TALON').AsString = 'Y')
    and not Table2TALON.IsNull then
    MessageDlg(TranslateText('Нельзя редактировать данные по талонам!'), mtError, [mbOk], 0)
  else Table2.Delete;
end;
//==============================================================================
procedure TSRepForm.N3Click(Sender: TObject);
var
  ACF: TACForm;
begin
  ACF := TACForm.Create(Application);
  try
    ACF.NpList := NpList;
    ACF.NPGrpId := FF.ceNPGrp.Tag;
    ACF.FGName := FF.ceNPGrp.Text;
    ACF.FNPName := FF.ceNPGrp.Text;
    ACF.FNPID := FF.ceNPGrp.Tag;

    ACF.ShowModal;
    while ACF.ModalResult = mrOk do
    begin
      dbgRashod.DataSource.DataSet.DisableControls;
      try
        if (ACF.rgTypeCharge.ItemIndex = 2)
          and (dbceAZSName.DataSource.DataSet.FieldByName('LOAD_PRIH_TALON').AsString = 'Y') then
          begin
            MessageDlg(TranslateText('Нельзя редактировать данные по талонам!'), mtError, [mbOk], 0);
            exit;
          end;

        case ACF.rgTypeCharge.ItemIndex of
          0: AutoCalcNal(ACF.NPGrpId, ACF.Litr, ACF.Price, ACF.Litr * ACF.Price, 0);
          1: AutoCalcVed(ACF.ClientId, ACF.ClientInst, ACF.NPGrpId, ACF.Litr, ACF.Price, ACF.Litr * ACF.Price);
          2: AutoCalcTalon(ACF.NPGrpId, ACF.Litr, null, null, '', 4);
          3: AutoCalcCard(ACF.NPGrpId, ACF.Litr, ACF.Price, ACF.Litr * ACF.Price);
          4:
            begin
              AutoCalcShtuki(ACF.NPGrpId, ACF.Litr, ACF.Price, ACF.Litr * ACF.Price);
              ACF.ePrice.Text := '';
            end;
        end;
      finally
        dbgRashod.DataSource.DataSet.EnableControls;
      end;
      ACF.eLitr.Text := '';
      ACF.ShowModal;
    end;
  finally
    ACF.Free;
  end;
end;
//==============================================================================
procedure TSRepForm.dbgPrihodExit(Sender: TObject);
begin
  if qPrih.State <> dsBrowse then qPrih.Post;
end;
//==============================================================================
procedure TSRepForm.dbgRashodExit(Sender: TObject);
begin
  if Table2.State <> dsBrowse then Table2.Post;
end;
//==============================================================================
procedure TSRepForm.qPrihAfterPost(DataSet: TDataSet);
var
  LitrTemp: real;
begin
  // Не загружать повторяющие приходы
  if AdmSettings.Exist('DR_NOT_LOAD_TWO_PRIH') and (qPrih.FieldByName('Base_').AsInteger = 0)
    and (qPrih.FieldByName('TTN_Num').AsString <> '') and (qPrih.FieldByName('Pr_Litr').AsString <> '') then
  begin
    if AdmSettings.Get('DR_NOT_LOAD_TWO_PRIH') = 'Y' then
    begin
      qPrih.DisableControls;
      try
        qPrih.Filtered := false;
        qPrih.Filter   :=
          '     Rep_Id     = '+ dbeRepNum.DataSource.DataSet.FieldByName('Id').AsString +
          ' AND Rep_Inst   = '+ dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsString +
          ' AND TTN_Num    = '+ QuotedStr(qPrih.FieldByName('TTN_Num').AsString) +
          ' AND np_grp_id  = '+ qPrih.FieldByName('np_grp_id').AsString +
          ' AND Pr_Litr    = '+ QuotedStr(qPrih.FieldByName('Pr_Litr').AsString) +
          ' AND Pr_Count   = '+ QuotedStr(qPrih.FieldByName('Pr_Count').AsString) +
          ' AND Pr_Ud_weig = '+ QuotedStr(qPrih.FieldByName('Pr_Ud_weig').AsString) +
          ' AND S_Price    = '+ QuotedStr(qPrih.FieldByName('S_Price').AsString);
        qPrih.Filtered := true;

        if qPrih.RecordCount > 1 then
          raise Exception.Create(
            TranslateText('Приход не создан!') +#13+
            TranslateText('Нельзя вводить одинаковые приходы!') +#13+
            '(' + TranslateText('ТТН ') + qPrih.FieldByName('TTN_Num').AsString +
            ', '+ TranslateText('группа НП ') + qPrih.FieldByName('np_grp_id').AsString +
            ', '+ TranslateText('литры ') + qPrih.FieldByName('Pr_Litr').AsString +
            ', '+ TranslateText('плотность ') + qPrih.FieldByName('Pr_Ud_weig').AsString +
            ', '+ TranslateText('тонны ') + qPrih.FieldByName('Pr_Count').AsString +')'
          );
      finally
        qPrih.Filter   := '';
        qPrih.Filtered := false;
        qPrih.Last;
        qPrih.EnableControls;
      end;
    end;
  end;

  // Не загружать приходы меньше <> литров
  if AdmSettings.Exist('DR_NOT_LOAD_LITTLE_PRIH') and (qPrih.FieldByName('Base_').AsInteger = 0)
    and (qPrih.FieldByName('Pr_Litr').AsString <> '') then
  begin
    try
      LitrTemp := MRound(StrToFloat(nvl(AdmSettings.Get('DR_NOT_LOAD_LITTLE_PRIH'), '')), 0)
    except
      LitrTemp := 0;
    end;

    if qPrih.FieldByName('Pr_Litr').AsFloat < LitrTemp then
      raise Exception.Create(
        TranslateText('Приход не создан!') +#13+
        TranslateText('Нельзя вводить приходы с литрами меньше за ') +
        AdmSettings.Get('DR_NOT_LOAD_LITTLE_PRIH') +TranslateText(' литров!') +#13+
        '(' + TranslateText('ТТН ') + qPrih.FieldByName('TTN_Num').AsString +
        ', '+ TranslateText('группа НП ') + qPrih.FieldByName('np_grp_id').AsString +
        ', '+ TranslateText('литры ') + qPrih.FieldByName('Pr_Litr').AsString +
        ', '+ TranslateText('плотность ') + qPrih.FieldByName('Pr_Ud_weig').AsString +
        ', '+ TranslateText('тонны ') + qPrih.FieldByName('Pr_Count').AsString +')'
      );
  end;

  qPrih.ApplyUpdates;
  qPrih.CommitUpdates;
end;
//==============================================================================
procedure TSRepForm.qPrihBeforeDelete(DataSet: TDataSet);
begin
  if not qPrih.IsEmpty then
  begin
    qWork.Close;
    qWork.SQL.Text := ' select dr.Rep_Date, dr.Smena_Num ' +
      ' from Oil_DR_Data drd, Oil_Daily_Rep dr ' +
      ' where drd.State = ''Y'' and dr.State = ''Y'' and drd.Oper_Type = 1 ' +
      '   and drd.Rep_Id = dr.Id and drd.Rep_Inst = dr.Inst ' +
      '   and drd.TTN_Id = ' + qPrih.FieldByName('TTN_Id').AsString +
      '   and drd.TTN_Inst = ' + qPrih.FieldByName('TTN_Inst').AsString +
      '   and dr.Azs_Id=' + dbceAZSName.DataSource.DataSet.FieldByName('AZS_Id').AsString +
      '   and dr.Azs_Inst=' + dbceAZSName.DataSource.DataSet.FieldByName('AZS_Inst').AsString;
    qWork.Open;
    qCheckDoublePrih.Close;
    qCheckDoublePrih.Open;
    if (not qWork.IsEmpty) and (qCheckDoublePrih.IsEmpty) then
      raise Exception.Create(TranslateText(' По партии ') + qPrih.FieldByName('Dog').AsString +
        TranslateText(' подпартии ') + qPrih.FieldByName('Sub_Part').AsString +
        TranslateText(' существует реализация за ') + qWork.FieldByName('Rep_Date').AsString +
        TranslateText(' смена ') + qWork.FieldByName('Smena_Num').AsString + ' !');
    _ExecSql(Format(
      ' update oil_dr_data set state = ''N''' +
      ' where state = ''Y'' and oper_type = 2 ' +
      '   and ttn_id = %s and ttn_inst = %s and (rep_id, rep_inst) in ' +
      '     (select id, inst from oil_daily_rep where state = ''Y'' and azs_id = %s and azs_inst = %s)',
      [qPrih.FieldByName('TTN_Id').AsString, qPrih.FieldByName('TTN_Inst').AsString,
      dbceAZSName.DataSource.DataSet.FieldByName('AZS_Id').AsString,
        dbceAZSName.DataSource.DataSet.FieldByName('AZS_Inst').AsString]));
  end;
end;
//==============================================================================
procedure TSRepForm.dbceAZSNameDblClick(Sender: TObject);
var
  vId, vInst, vType: Integer;
  vName: string;
begin
  if (not (qPrih.IsEmpty)) and (dbceAZSName.Text <> '') then
    raise Exception.Create(TranslateText('Удалите приходы по текущей АЗС'));
  if ChooseOrg.CaptureOrgT(2, MAIN_ID, INST, 'yyy', vId, vInst, vName, vType) then
  begin
    if vType <> 8 then
      raise Exception.Create(TranslateText('Тип организации должен быть "АЗС"'));
    dbceAZSName.DataSource.DataSet.FieldByName('AZS_Id').AsInteger := vId;
    dbceAZSName.DataSource.DataSet.FieldByName('AZS_Inst').AsInteger := vInst;
    dbceAZSName.Text := vName;
    dbceAZSName.DataSource.DataSet.FieldByName('Emp_Id').Clear;
    dbceAZSName.DataSource.DataSet.FieldByName('Emp_Inst').Clear;
    dbceAZSName.DataSource.DataSet.FieldByName('Emp_Name').Clear;
    GetEmp(vId, 0);
  end;
end;
//==============================================================================
procedure TSRepForm.dbceEmpNameDblClick(Sender: TObject);
var
  Emp: TEmpRefForm;
begin
  Application.CreateForm(TEmpRefForm, Emp);
  Emp.ceOrg.Enabled := False;
  Emp.SpeedButton1.Enabled := False;
  Emp.ceOrg.Text := dbceAZSName.Text;
  Emp.SOrgId := dbceAZSName.DataSource.DataSet.FieldByName('AZS_Id').AsInteger;
  Emp.SOrgInst := dbceAZSName.DataSource.DataSet.FieldByName('AZS_Inst').AsInteger;
  Emp.sbAdd.Visible := False;
  Emp.sbEdit.Visible := False;
  Emp.sbDel.Visible := False;
  Emp.ShowModal;
  if Emp.ModalResult = mrOk then
  begin
    dbceEmpName.DataSource.DataSet.FieldByName('Emp_Id').AsInteger := Emp.q.FieldByName('Id').AsInteger;
    dbceEmpName.DataSource.DataSet.FieldByName('Emp_Inst').AsInteger := Emp.q.FieldByName('Inst').AsInteger;
    dbceEmpName.Text := Emp.q.FieldByName('F_name').AsString + ' ' + Emp.q.FieldByName('I_name').AsString + ' ' + Emp.q.FieldByName('O_name').AsString;
  end;
  Emp.Destroy;
end;
//==============================================================================
procedure TSRepForm.Table2NALValidate(Sender: TField);
begin
  if Table2Nal.IsNull then Table2Nal_Money.Clear
  else Table2Nal_Money.AsFloat := MRound(Table2Nal.AsFloat * Table2N_Price.AsFloat, 2);
end;
//==============================================================================
procedure TSRepForm.GetSupplierPrih(var p_id, p_inst: integer); // знаходимо постачальника
var
  q: TOilQuery;
begin
  q := TOilQuery.Create(nil);
  try
    q.SQL.Text :=
      'select *' +
      '  from (select from_, from_inst,' +
      '               row_number() over(order by date_ desc) as rnum' +
      '          from oil_prihod' +
      '         where state = ''Y''' +
      '           and inst = :inst' +
      '           and from_ < 1e6' +
      '           and from_ not in (4587, 4000, :inst, :from_inst)' +
      '           and from_ = from_inst)' +
      ' where rnum = 1';
    _OpenQueryPar(q, ['inst', MAIN_ORG.Inst, 'from_inst', MAIN_ORG.Par]);

    if not q.FieldByName('from_').IsNull then
    begin
      p_id   := q.FieldByName('from_').AsInteger;
      p_inst := q.FieldByName('from_inst').AsInteger;
    end;
    q.Close;
  finally
    q.Free;
  end;
end;
//==============================================================================
procedure TSRepForm.bbLoadFromFileClick(Sender: TObject);
var
  CurIndex, prihod_id, i: Integer;
  ST: boolean;
  Value: Variant;
  Time, sValue: string;

  NP, PROV_ID, PROV_INST, FROM_ID, FROM_INST: Integer;
  LITR, PRICE, TT, DENSITY: Currency;
  WEIGHT: real;
  tLITR, tDENSITY: Currency;
  tWEIGHT: real;
  TTN, TTNDATE, sTTN_OLD, CAR: string;
  bTTNNum: boolean;
  qPart, qAuto, qRez: TOilQuery;

  GetVal: TGetValueFromString;

  FAL: TSRepAutoLoadF;
begin
  sValue := ReadPieceOfRegistry(HKEY_CURRENT_USER, '\Software\Oil', 'SRepAutoLoadDir');
  // Запуск диалога открытия файла
  if odPacket.InitialDir = '' then
    odPacket.InitialDir := sValue;

  if odPacket.InitialDir = '' then
    odPacket.InitialDir := ExtractFilePath(Application.ExeName);

  // видаляємо усі існуючі приходи у даному змінному звіті
  qPrih.First;
  while not qPrih.Eof do qPrih.Delete;

  if DR_AUTOLOAD or ((not DR_AUTOLOAD) and (odPacket.Execute)) then
  begin
    IsPacketLoaded := True;
    odPacket.InitialDir := ExtractFilePath(odPacket.FileName);

    OpenFileSRep(odPacket.FileName, SList); // завантаження файлу
    Packet := TPacket.Create(SList);

    CurIndex := 0;
    // Загрузка параметров из файла
    while CurIndex < SList.Count do
    begin
      // Дата змінного звіту і № звіту
      if (Pos('DATE:', SList[CurIndex]) = 1) and (Length(SList[CurIndex]) > 5) then
      begin
        dbdeRepDate.DataSource.DataSet.FieldByName('Rep_Date').AsString := Copy(SList[CurIndex], 7, Length(SList[CurIndex]));
        dbdeRepDate.DataSource.DataSet.FieldByName('Rep_Num').AsString := Copy(SList[CurIndex], 7, 2);
      end;

      // Дата/Час кінця змінного звіту
      if (Pos('ENDDATE:', SList[CurIndex]) = 1) and (Length(SList[CurIndex]) > 8) then
        dbdeRepDate.DataSource.DataSet.FieldByName('REP_DATE_END_REAL').AsDateTime := StrToDateTime(Copy(SList[CurIndex], 10, Length(SList[CurIndex])));

      // Зміна
      if (Pos('NOM:', SList[CurIndex]) = 1) and (Length(SList[CurIndex]) > 4) then
        dbdeRepDate.DataSource.DataSet.FieldByName('Smena_Num').AsString := Copy(SList[CurIndex], 5, Length(SList[CurIndex]));

      // Id АЗС
      if (Pos('AZS:', SList[CurIndex]) = 1) and (Length(SList[CurIndex]) > 4) then
      begin
        dbdeRepDate.DataSource.DataSet.FieldByName('AZS_Id').AsInteger := 1000000 + StrToInt(Copy(SList[CurIndex], 5, Length(SList[CurIndex])));
        dbdeRepDate.DataSource.DataSet.FieldByName('AZS_Inst').AsInteger := 1000000 + StrToInt(Copy(SList[CurIndex], 5, Length(SList[CurIndex])));
        qWork.Close;
        qWork.SQL.Text := 'select Name from v_org ' +
          ' where Id = '+ dbdeRepDate.DataSource.DataSet.FieldByName('AZS_Id').AsString +
          '   and Inst = '+ dbdeRepDate.DataSource.DataSet.FieldByName('AZS_Inst').AsString;
        qWork.Open;
        dbdeRepDate.DataSource.DataSet.FieldByName('AZS_Name').AsString := qWork.Fields[0].AsString;
      end;

      // Id водителя
      if (Pos('EMP:', SList[CurIndex]) = 1) and (Length(SList[CurIndex]) > 4) then
      begin
        GetEmp(dbdeRepDate.DataSource.DataSet.FieldByName('AZS_Id').AsInteger,
          StrToInt(Copy(SList[CurIndex], 5, Length(SList[CurIndex]))));
      end;

      sTTN_OLD := '';
      // Загрузка параметров прихода на АЗС
      while (Pos('PRIHOD:', SList[CurIndex]) = 1) or (Pos('PRIHODST:', SList[CurIndex]) = 1) do
      begin
        ST := Pos('PRIHODST:', SList[CurIndex]) = 1;
        CurIndex := CurIndex + 1;
        while Pos('VALUES:', SList[CurIndex]) = 1 do
        begin
          GetVal := TGetValueFromString.Create(SList[CurIndex]);
          try
            TTN := GetVal.NextField(TranslateText('Отсутствует номер ТТН прихода!')).AsString;

            // забираємо зайві нулі у номера ТТН
            if TTN <> '' then
            begin
              bTTNNum := true;
              for i := 1 to length(TTN) do
                if not (TTN[i] in ['0','1','2','3','4','5','6','7','8','9']) then
                begin
                  bTTNNum := false;
                  break;
                end;
              if bTTNNum then
              try
                TTN := IntToStr(StrToInt(TTN));
              except
              end;
            end;

            sTTN_OLD := sTTN_OLD +','+ TTN; // записуємо історію обробляємих ТТН
            NP := GetVal.NextField(TranslateText('Отсутствует группа НП в приходе!')).AsInteger;
            LITR := GetVal.NextField(TranslateText('Отсутствуют литры в приходе!')).AsFloat;
            PRICE := GetVal.NextField(TranslateText('Отсутствует цена прихода!')).AsFloat;

            WEIGHT := 0;
            TT := 0;
            DENSITY := 0;
            CAR := '';
            PROV_ID := 0;
            PROV_INST := 0;
            TTNDATE := FormatDateTime('dd.mm.yyyy', dbdeRepDate.DataSource.DataSet.FieldByName('Rep_Date').AsDateTime);

            if GetVal.NextField('Отсутствует WEIGHT', False).AsString <> '' then
            begin
              WEIGHT := GetVal.CurrentField.AsFloat;
              if GetVal.NextField('Отсутствует TT', False).AsString = '' then
                TT := 0
              else TT := GetVal.CurrentField.AsFloat;

              if GetVal.NextField('Отсутствует DENSITY', False).AsString = '' then
                DENSITY := 0
              else DENSITY := GetVal.CurrentField.AsFloat;

              CAR := GetVal.NextField('Отсутствует CAR', False).AsString;

              if GetVal.NextField('Отсутствует PROV_ID', False).AsString = '' then
                PROV_ID := 11408
              else PROV_ID := GetVal.CurrentField.AsInteger;

              if GetVal.NextField('Отсутствует PROV_INST').AsString = '' then
                PROV_INST := 11408
              else PROV_INST := GetVal.CurrentField.AsInteger;

              if GetVal.NextField('').AsString = '' then
                TTNDATE := FormatDateTime('dd.mm.yyyy', dbdeRepDate.DataSource.DataSet.FieldByName('Rep_Date').AsDateTime)
              else TTNDATE := FormatDateTime('dd.mm.yyyy', StrToDateTime(GetVal.CurrentField.AsString));
            end;
          finally
            GetVal.Free;
          end;
          if Litr > 0 then
          begin
            // Вставка Id прихода
            if qPrih.FieldByName('Id').IsNull then qPrih.Edit
            else qPrih.Append;
            try
              if qPrih.FieldByName('Id').IsNull then
              begin
                qPrih.FieldByName('Id').Value            := GetSeqNextVal('S_OIL_DR_DATA');
                qPrih.FieldByName('Inst').Value          := INST;
                qPrih.FieldByName('Oper_Type').AsInteger := 0;
                qPrih.FieldByName('Rep_Id').Value        := dbeRepNum.DataSource.DataSet.FieldByName('Id').Value;
                qPrih.FieldByName('Rep_Inst').Value      := dbeRepNum.DataSource.DataSet.FieldByName('Inst').Value;
                qPrih.FieldByName('S_Price').AsFloat     := Price;
              end;
              // Выборка параметров прихода
              qWork.Close;
              qWork.SQL.Text :=
                'select r.*, p.Dog as Part, decode(dim.IsShtuki, ''Y'', 1, 0) as Base_, ' +
                '       p.Own_Goods, np.grp_id, np.Name as NPType_Name, dim.Name as Dim_Name ' +
                '  from Oil_Rashod r, Oil_Part p, Oil_NP_Type np, v_Oil_Dim dim' +
                ' where r.State = ''Y'' ' +
                '   and r.Part_Id = p.Id and r.Part_Inst = p.Inst ' +
                '   and p.NP_Type = np.Id and p.Dim_Id = dim.Id ' +
                '   and not exists (select * from oil_dr_data where state = ''Y'' and ttn_id = r.id and ttn_inst = r.inst)' +
                '   and r.TTN_Num = :TTN_Num' +
                '   and r.to_id = :to_id and r.to_inst = :to_id' +
                '   and r.Date_ between trunc(:Date_)-10 and trunc(:Date_)' +
                '   and r.litr = :litr';
              if ST then
                qWork.Sql.Add(' and np.Id = '+ IntToStr(NP))
              else
                qWork.Sql.Add(' and np.grp_id = '+ IntToStr(NP));
              _OpenQueryPar(qWork,
                ['TTN_Num', TTN,
                 'to_id',   dbdeRepDate.DataSource.DataSet.FieldByName('AZS_Id').AsInteger,
                 'Date_',   dbdeRepDate.DataSource.DataSet.FieldByName('Rep_Date').AsDateTime,
                 'litr',    LITR]);

              // якщо всі дані у нас є, то пробуємо створити прихід і відпуск на АЗС
              if not ST and qWork.IsEmpty and (TTN <> '') and (NP > 0) and (LITR > 0)
                and ((DENSITY > 0) or (WEIGHT > 0)) then
              begin
                // якщо різниця між розрахунком кілограм і самими кілограмами у приході
                // не перевищить 50 кілограм, то це є добре
                // інакше -->
                // аналізуємо прихід у пакеті і думаємо, що з ним робити
                if (abs(MRound(LITR * DENSITY, DR_ROUND_COUNT) - MRound(WEIGHT, DR_ROUND_COUNT)) > 50)
                  or (DENSITY > 1) or (DENSITY < 0.1) then
                begin
                  tLITR    := abs(LITR);
                  tDENSITY := abs(DENSITY);
                  tWEIGHT  := abs(WEIGHT);

                  // якщо густина більше 1, то робимо її менше 1
                  if tDENSITY > 1 then
                    for i := 0 to 10 do
                      if tDENSITY < 1 then break
                      else tDENSITY := MRound(tDENSITY / 10, 4);

                  // якщо густина меньше 0.1, то робимо її більше 0.1
                  if tDENSITY < 0.1 then
                    for i := 0 to 10 do
                      if tDENSITY > 0.1 then break
                      else tDENSITY := MRound(tDENSITY * 10, 4);

                  if tWEIGHT = 0 then
                    tWEIGHT := abs(MRound(tLITR * tDENSITY, DR_ROUND_COUNT));

                  if tDENSITY = 0 then
                    tDENSITY := abs(MRound(tWEIGHT / tLITR, 4));

                  if abs(MRound(tLITR * tDENSITY, DR_ROUND_COUNT) - MRound(tWEIGHT, DR_ROUND_COUNT)) > 50 then
                    for i := 0 to 10 do
                      if abs(MRound(tLITR * tDENSITY, DR_ROUND_COUNT) - MRound(tWEIGHT, DR_ROUND_COUNT)) < 50 then break
                      else tWEIGHT := MRound(tWEIGHT * 10, 4);

                  if abs(MRound(tLITR * tDENSITY, DR_ROUND_COUNT) - MRound(tWEIGHT, DR_ROUND_COUNT)) < 50 then
                  begin
                    LITR    := tLITR;
                    DENSITY := tDENSITY;
                    WEIGHT  := tWEIGHT;
                  end;
                end;

                if (abs(MRound(LITR * DENSITY, DR_ROUND_COUNT) - MRound(WEIGHT, DR_ROUND_COUNT)) > 50)
                  and ((ReadOilVar('DR_LOAD_ALL_PRIH') = 'N') or (ReadOilVar('DR_LOAD_ALL_PRIH') = '')) then
                  raise Exception.Create(
                    TranslateText('Приход не создан!') +#13+
                    TranslateText('Данному количеству литров не соответствует количество тонн!') +#13+
                    '(' + TranslateText('ТТН ') + TTN +
                    ', '+ TranslateText('группа НП ') + IntToStr(NP) +
                    ', '+ TranslateText('литры ') + FloatToStr(LITR) +
                    ', '+ TranslateText('плотность ') + FloatToStr(DENSITY) +
                    ', '+ TranslateText('тонны ') + FloatToStr(WEIGHT) +')'
                  );

                qPart := TOilQuery.Create(nil);
                qAuto := TOilQuery.Create(nil);
                qRez  := TOilQuery.Create(nil);
                try
                  // повсюду будемо брати партію із найменшим ід
                  qPart.SQL.Text :=
                    'select min(p.np_type) as np_id, min(p.id) as id, p.inst from oil_part p, Oil_NP_Type np' +
                    ' where p.state = ''Y'' and p.np_type = np.id and np.grp_id = :npg_id' +
                    '   and p.inst = :inst' +
                    ' group by p.inst';
                  _OpenQueryPar(qPart, ['npg_id', NP, 'inst', INST]);

                  qRez.SQL.Text :=
                    'select min(r.id) as id, max(r.inst) as inst from oil_rezervuar r, oil_np_type np' +
                    ' where r.state = ''Y'' and r.np_type_id = np.id and np.grp_id = :npg_id' +
                    '   and r.inst = :inst' +
                    '   and r.id_org = :id_org' +
                    '   and r.inst_org = :inst_org';
                  _OpenQueryPar(qRez,
                    ['npg_id',   NP,
                     'inst',     INST,
                     'id_org',   PROV_ID,
                     'inst_org', PROV_INST]);

                  FROM_ID   := MAIN_ORG.Par;
                  FROM_INST := MAIN_ORG.Par_inst;
                  GetSupplierPrih(FROM_ID, FROM_INST); // знаходимо постачальника

                  qAuto.SQL.Text := 'select * from oil_auto where state = ''Y'' and numb = :numb';
                  _OpenQueryPar(qAuto, ['numb', CAR]);

                  FAL := TSRepAutoLoadF.Create(nil);
                  try
                    FAL.SetPrihRep(
                      dbdeRepDate.DataSource.DataSet.FieldByName('Rep_Date').AsDateTime,
                      FROM_ID, PROV_ID, dbdeRepDate.DataSource.DataSet.FieldByName('AZS_Id').AsInteger,
                      qPart.FieldByName('np_id').AsInteger,
                      0, 0, // змінний звіт
                      0, 0, // відпуск на АЗС
                      qPart.FieldByName('id').AsInteger, qPart.FieldByName('inst').AsInteger,               // партія
                      qRez.FieldByName('id').AsInteger, qRez.FieldByName('inst').AsInteger,                 // резервуар
                      qAuto.FieldByName('id').AsInteger, qAuto.FieldByName('inst').AsInteger,               // автомобіль
                      qAuto.FieldByName('employ_id').AsInteger, qAuto.FieldByName('employ_inst').AsInteger, // водій
                      StrToDate(TTNDATE), // дата ТТН
                      TTN, CAR,           // номер ТТН, номер машини/цистерни
                      LITR, PRICE, WEIGHT/1000, DENSITY, TT,
                      true, // створюємо прихід на НБ
                      true, // створюємо відпуск з НБ
                      false // створюємо прихід на АЗС
                    ); // створюємо прихід НП на АЗС
                  finally
                    FreeAndNil(FAL);
                  end;

                  // Выборка параметров прихода
                  qWork.Close;
                  qWork.SQL.Text :=
                    'select r.*, p.Dog as Part, decode(dim.IsShtuki, ''Y'', 1, 0) as Base_, ' +
                    '       p.Own_Goods, np.grp_id, np.Name as NPType_Name, dim.Name as Dim_Name ' +
                    '  from Oil_Rashod r, Oil_Part p, Oil_NP_Type np, v_Oil_Dim dim' +
                    ' where r.State = ''Y'' ' +
                    '   and r.Part_Id = p.Id and r.Part_Inst = p.Inst ' +
                    '   and p.NP_Type = np.Id and p.Dim_Id = dim.Id ' +
                    '   and not exists (select * from oil_dr_data where state = ''Y'' and ttn_id = r.id and ttn_inst = r.inst)' +
                    '   and r.TTN_Num = :TTN_Num' +
                    '   and r.to_id = :to_id and r.to_inst = :to_id' +
                    '   and r.Date_ between trunc(:Date_)-10 and trunc(:Date_)' +
                    '   and r.litr = :litr';
                  if ST then
                    qWork.Sql.Add(' and np.Id = '+ IntToStr(NP))
                  else
                    qWork.Sql.Add(' and np.grp_id = '+ IntToStr(NP));
                  _OpenQueryPar(qWork,
                    ['TTN_Num', TTN,
                     'to_id',   dbdeRepDate.DataSource.DataSet.FieldByName('AZS_Id').AsInteger,
                     'Date_',   dbdeRepDate.DataSource.DataSet.FieldByName('Rep_Date').AsDateTime,
                     'litr',    LITR]);
                finally
                  qPart.Free;
                  qAuto.Free;
                  qRez.Free;
                end;
              end; // if not ST

              if qWork.IsEmpty then
                raise Exception.Create(TranslateText('Приход ТТН №') + TTN + TranslateText(' с ') +
                  DateToStr(dbdeRepDate.DataSource.DataSet.FieldByName('Rep_Date').AsDateTime - 10) +
                  TranslateText(' по ') +
                  DateToStr(dbdeRepDate.DataSource.DataSet.FieldByName('Rep_Date').AsDateTime) +
                  TranslateText(' не найден'));
              if Litr <> qWork.FieldByName('Litr').AsFloat then
                Exception.Create(TranslateText('Количество литров прихода ТТН №') + TTN + TranslateText(' не совпадает с введенным приходом !'));
              // Добавление прихода в сменный отчет
              qPrih.FieldByName('TTN_Id').AsInteger   := qWork.FieldByName('Id').AsInteger;
              qPrih.FieldByName('TTN_Inst').AsInteger := qWork.FieldByName('Inst').AsInteger;
              qPrih.FieldByName('TTN_Num').AsString   := qWork.FieldByName('TTN_Num').AsString;
              qPrih.FieldByName('Dog').AsString       := qWork.FieldByName('Part').AsString;
              qPrih.FieldByName('TTN_Date').Value     := qWork.FieldByName('TTN_DATE').Value;
              qPrih.FieldByName('Pr_Litr').AsFloat    := qWork.FieldByName('Litr').AsFloat;
              qPrih.FieldByName('Pr_Ud_weig').AsCurrency := qWork.FieldByName('Ud_Weig').AsCurrency;
              qPrih.FieldByName('Pr_Count').AsFloat   := qWork.FieldByName('count_').AsFloat;
              qPrih.FieldByName('np_grp_id').AsInteger:= qWork.FieldByName('grp_id').AsInteger;
              qPrih.FieldByName('NP_Name').AsString   := qWork.FieldByName('NPType_Name').AsString;
              qPrih.FieldByName('EdIzm').AsString     := qWork.FieldByName('Dim_Name').AsString;
              qPrih.FieldByName('S_Price').AsFloat    := Price;
              qPrih.FieldByName('Sub_Part').AsString  := qWork.FieldByName('TTN_Num').AsString;
              qPrih.FieldByName('Base_').AsInteger    := qWork.FieldByName('Base_').AsInteger;
              qPrih.FieldByName('Own_goods').Value    := qWork.FieldByName('Own_Goods').Value;
              if qPrih.FieldByName('Base_').AsInteger <> 0 then
              begin
                qPrih.FieldByName('Pr_Count').AsFloat := qPrih.FieldByName('Pr_Litr').AsFloat;
                qPrih.FieldByName('Pr_Ud_weig').AsCurrency := 1;
              end;
              qPrih.Post;
            except on E: Exception do
              begin
                sTTN_OLD := sTTN_OLD +',';
                if ((pos(','+ TTN +',', sTTN_OLD) = 0) and ST) or (not ST) then
                  GetLogMes(E.Message);
                qPrih.Delete;
              end
            end
          end; {if Litr}
          CurIndex := CurIndex + 1;
        end; // while Pos('VALUES:', SList[CurIndex]) = 1 do
      end; // while (Pos('PRIHOD:', SList[CurIndex]) = 1) or (Pos('PRIHODST:', SList[CurIndex]) = 1) do
      CurIndex := CurIndex + 1;
    end;

    if DR_AUTOLOAD then
      if bLoadMyPack then // Загружать только свои пакеты
      begin
        qWork.Close;
        qWork.SQL.Text :=
          'select count(1) from v_oil_azs' +
          ' where Id = :p_azs_id and Inst = :p_azs_inst' +
          '   and obl_id = :p_obl_id';
        _OpenQueryPar(qWork,
          ['p_azs_id',   dbdeRepDate.DataSource.DataSet.FieldByName('AZS_Id').AsInteger,
           'p_azs_inst', dbdeRepDate.DataSource.DataSet.FieldByName('AZS_Inst').AsInteger,
           'p_obl_id',   MAIN_ORG.Inst]);
        if qWork.Fields[0].AsInteger = 0 then
          GetExcMes(
            TranslateText('АЗС с ID ')+ dbdeRepDate.DataSource.DataSet.FieldByName('AZS_Id').AsString +
            TranslateText(' не принадлежит данной организации!'));
      end;

    // не використовувати DBSaver.SaveRecord
    //--------------------------------------------------------------------------
    dbeRepNum.DataSource.DataSet.FieldByName('AUTO_LOAD').AsString := 'P';
    dbeRepNum.DataSource.DataSet.Post;
    dbeRepNum.DataSource.DataSet.Edit;
    //--------------------------------------------------------------------------
  end;
end;
//==============================================================================
procedure TSRepForm.GetEmp(p_AZS_ID, p_EMP_ID: integer);
var
  qEmp: TOilQuery;
begin
  qEmp := TOilQuery.Create(nil);
  try
    if p_EMP_ID <> 0 then
    begin
      qEmp.Close;
      qEmp.SQL.Text :=
        'select id, inst, F_name||'' ''||I_name||'' ''||O_name from oil_employ' +
        ' where state = ''Y'' and org_id = :azs_id and org_inst = :azs_id and id = :emp_id';
      _OpenQueryPar(qEmp, ['azs_id', p_AZS_ID, 'emp_id', p_EMP_ID]);
      // беремо знайденого оператора
      if not qEmp.IsEmpty then
      begin
        dbdeRepDate.DataSource.DataSet.FieldByName('Emp_Id').AsInteger   := qEmp.Fields[0].AsInteger;
        dbdeRepDate.DataSource.DataSet.FieldByName('Emp_Inst').AsInteger := qEmp.Fields[1].AsInteger;
        dbdeRepDate.DataSource.DataSet.FieldByName('Emp_Name').AsString  := qEmp.Fields[2].AsString;
        exit;
      end;
    end;

    qEmp.Close;
    qEmp.SQL.Text :=
      'select id, inst, F_name||'' ''||I_name||'' ''||O_name from oil_employ' +
      ' where state = ''Y'' and org_id = :azs_id and org_inst = :azs_id' +
      '   and (id, inst) in (select max(id), inst from oil_employ' +
      '                       where state = ''Y'' and org_id = :azs_id and org_inst = :azs_id' +
      '                       group by inst)';
    _OpenQueryPar(qEmp, ['azs_id', p_AZS_ID]);
    // беремо знайденого оператора
    if not qEmp.IsEmpty then
    begin
      dbdeRepDate.DataSource.DataSet.FieldByName('Emp_Id').AsInteger   := qEmp.Fields[0].AsInteger;
      dbdeRepDate.DataSource.DataSet.FieldByName('Emp_Inst').AsInteger := qEmp.Fields[1].AsInteger;
      dbdeRepDate.DataSource.DataSet.FieldByName('Emp_Name').AsString  := qEmp.Fields[2].AsString;
      exit;
    end;
  finally
    qEmp.Free;
  end;
end;
//==============================================================================
procedure TSRepForm.dbgRashodKeyPress(Sender: TObject; var Key: Char);
begin
  if Table2Base.Value = 1 then
  begin
    if (key = DecimalSeparator) and (dbgRashod.SelectedField.Name <> 'Table2N_Price') then key := #0;
    if (key in ['.', ',']) and (dbgRashod.SelectedField.name = 'Table2N_Price') then key := DecimalSeparator;
    if key = '-' then key := #0;
  end
  else
  begin
    if (key in ['.', ',']) then key := DecimalSeparator;
    if key = '-' then key := #0;
  end;
end;
//==============================================================================
procedure TSRepForm.N6Click(Sender: TObject);
begin
  if dbceAZSName.Text = '' then raise Exception.Create(TranslateText('Не определена АЗС !'));
  if dbdeRepDate.Value = null then raise Exception.Create(TranslateText('Укажите дату сменного отчета!'));
  // Открытие формы отпуска НП на АЗС
  Application.CreateForm(TRashRefForm, rash);
  Rash.edTo.Tag := dbceAZSName.DataSource.DataSet.FieldByName('AZS_Id').AsInteger;
  Rash.lTo.Tag := dbceAZSName.DataSource.DataSet.FieldByName('AZS_Inst').AsInteger;
  Rash.edTo.Text := dbceAZSName.Text;
  Rash.edTo.Enabled := false;
  Rash.edActDate_B.Date := trunc(dbdeRepDate.Value);
  Rash.edActDate_E.Date := trunc(dbdeRepDate.Value);
  Rash.edActDate_E.Enabled := false;
  Rash.bbOk.OnClick := LoadPrih;
  Rash.bbOk.Caption := TranslateText('Загрузить');
  case (Sender as TMenuItem).Tag of
    1: Rash.cbGoods.ItemIndex := 0;
    2: Rash.cbGoods.ItemIndex := 1;
  end;
  Rash.cbGoods.Enabled := false;
  Rash.bbSearchClick(nil);
  Rash.ShowModal;
end;
//==============================================================================
procedure TSRepForm.LoadPrih(Sender: TObject);
begin
  if Rash = nil then exit;
  IsCreateRashForm := false;
  try
    with Rash.q do
      while not Eof do
      begin
        try
          dbgPrihodEditButtonClick(nil);
        except on E: Exception do
          MessageDlg(E.Message, mtWarning, [mbOk], 0);
        end;
        ShowWindow(Rash.Handle, SW_SHOW);
        next;
      end;
    Rash.ModalResult := mrOk;
  finally
    IsCreateRashForm := true;
  end;
end;
//==============================================================================
procedure TSRepForm.dbgPrihodColEnter(Sender: TObject);
begin
  IsCreateRashForm := true;
end;
//==============================================================================
procedure TSRepForm.FormCreate(Sender: TObject);
var
  qOrg: TOilQuery;
  PossibleOrg: integer;
begin
  inherited;
  IsShowDRD := false; // реалізація вже відображена
  IsPacketLoaded := False;
  nb.PageIndex := 0;
  IsCreateRashForm := TRUE;
  GPT_Auto := ReadOilVar('GPT_SREP_AUTO');
  if GPT_Auto = '' then GPT_Auto := ',9,'
  else GPT_Auto := ',' + GPT_Auto + ',';
  //Table2.DatabaseName   := DB_DIR;
  Table3.DatabaseName   := DB_DIR;
  Table4.DatabaseName   := DB_DIR;
  Table5.DatabaseName   := DB_DIR;
  qPriv.DatabaseName    := DB_DIR;
  qPrivAdd.DatabaseName := DB_DIR;

  // створюємо форму для фільтрації
  FF := TSrFiltrForm.Create(Application);

  // підтягуємо організацію, якій приходувалися талони
  qWork.Close;
  qWork.SQL.Text :=
    'select * from oil_talon_prih where srep_id = :srep_id and srep_inst = :srep_inst and state = ''Y''';
  _OpenQueryPar(qWork,
    ['srep_id',   dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger,
     'srep_inst', dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsInteger]);
  TalonDepID   := qWork.FieldByName('dep_id').AsInteger;
  TalonDepINST := qWork.FieldByName('dep_inst').AsInteger;

  if TalonDepID = 0 then // якщо організація не підтягнута
  begin
    PossibleOrg := GetUserPossibleOrg(SUPER_REAL_EMP_ID);
    if PossibleOrg = -1 then
    begin
      TalonDepID   := MAIN_ID;
      TalonDepINST := INST;
    end
    else
    begin
      qOrg := TOilQuery.Create(nil);
      try
        GetOrgData(qOrg, PossibleOrg, PossibleOrg);
        TalonDepID   := qOrg.FieldByName('Id').AsInteger;
        TalonDepINST := qOrg.FieldByName('Inst').AsInteger;
      finally
        qOrg.Free;
      end;
    end;
  end;
end;
//==============================================================================
procedure TSRepForm.Excel1Click(Sender: TObject);
begin
  Table2.DisableControls;
  try
    PutGridEhToExcel(dbgRashod, '', 'Litr;CCount;NAL;Nal_Money;VED;TALON;SN;Other;C_Litr;C_count');
  finally
    Table2.EnableControls;
  end;
end;
//==============================================================================
function TSRepForm.StrToFloat(AValue: string): real;
begin
  try
    if Pos(',', AValue) = 0 then
      if Pos('.', AValue) <> 0 then AValue[Pos('.', AValue)] := ',';
    result := SysUtils.StrToFloat(AValue);
  except
  end;
end;
//==============================================================================
procedure TSRepForm.cedOstBeginShtChange(Sender: TObject);
begin
  if sbCloseDetails.Down then
  begin
    cedOstEndSht.Value := cedOstBeginSht.Value + cedShtukiSum.Value - cedShtukiKassa.Value;
    if not IsPacketLoaded then
    begin
      ceSTART.Value := cedOstBeginNp.Value + cedOstBeginSht.Value;
      if cedNpKassa.Value + cedShtukiKassa.Value > ceOUT.Value then
        ceOUT.Value := cedNpKassa.Value + cedShtukiKassa.Value;
      ceSTART.Enabled := cedOstBeginSht.Value = 0;
    end;
  end;
end;
//==============================================================================
procedure TSRepForm.cedOstBeginNpChange(Sender: TObject);
begin
  if sbCloseDetails.Down then
  begin
    cedOstEndNp.Value := cedOstBeginNp.Value + cedNpSum.Value - cedNpKassa.Value;
    if not IsPacketLoaded then
    begin
      ceSTART.Value := cedOstBeginNp.Value + cedOstBeginSht.Value;
      if cedNpKassa.Value + cedShtukiKassa.Value > ceOUT.Value then
        ceOUT.Value := cedNpKassa.Value + cedShtukiKassa.Value;
    end;
  end;
end;
//==============================================================================
procedure TSRepForm.dbgRashodGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (Table2C_Litr.AsFloat = 0) and (Table2C_count.AsFloat = 0) then AFont.Color := clBlue;
  if (Table2C_Litr.AsFloat < 0) or (Table2C_count.AsFloat < 0) then AFont.Color := clRed;
end;
//==============================================================================
procedure TSRepForm.sbSumRashClick(Sender: TObject);
begin
  if sbSumRash.Down then dbgRashod.FooterRowCount := 1
  else dbgRashod.FooterRowCount := 0;
end;
//==============================================================================
procedure TSRepForm.sbSumPrihClick(Sender: TObject);
begin
  if sbSumPrih.Down then dbgPrihod.FooterRowCount := 1
  else dbgPrihod.FooterRowCount := 0;
end;
//==============================================================================
procedure TSRepForm.SetGridScale(K: integer);
var
  i: integer;
begin
  dbgRashod.RowHeight := dbgRashod.RowHeight + K;
  dbgRashod.Font.Size := dbgRashod.Font.Size + K;
  dbgRashod.TitleFont.Size := dbgRashod.TitleFont.Size + K;
  for i := 0 to dbgRashod.Columns.Count - 1 do
  begin
    dbgRashod.Columns[i].Title.Font.Name := 'Arial';
    dbgRashod.Columns[i].Title.Font.Size := dbgRashod.Font.Size;
    if dbgRashod.Columns[i].Footers.Count > 0 then
    begin
      dbgRashod.Columns[i].Footers.Items[0].Font.Name := dbgRashod.Columns[i].Title.Font.Name;
      dbgRashod.Columns[i].Footers.Items[0].Font.Size := dbgRashod.Font.Size - 1;
    end;
  end;
  //dbgRashod.OptimizeColsWidth(dbgRashod.VisibleColumns);
end;
//==============================================================================
procedure TSRepForm.sbHodTopClick(Sender: TObject);
begin
  SetGridScale(1);
end;
//==============================================================================
procedure TSRepForm.sbHodBottomClick(Sender: TObject);
begin
  SetGridScale(-1);
end;
//==============================================================================
procedure TSRepForm.sbCloseDetailsClick(Sender: TObject);
begin
  gbSM.Visible := sbCloseDetails.Down;
  gbNp.Visible := sbCloseDetails.Down;
  cedOstBeginNpChange(nil);
  cedOstBeginShtChange(nil);
end;
//==============================================================================
procedure TSRepForm.cedAddMoneyChange(Sender: TObject);
begin
  ceEND.Value := ceSTART.Value + ceGET.Value + cedAddMoney.Value - ceOUT.Value;
end;
//==============================================================================
function TSRepForm.IsLargeZero(d: integer): Boolean; // є більшим 0 (нуля)
begin
  result := false;
  if DR_AUTOLOAD or (dbeRepNum.DataSource.DataSet.FieldByName('AUTO_LOAD').AsString = 'P') then
    result := true
  else
    if d > 0 then result := true;
end;
//==============================================================================
function TSRepForm.IsZeroOrLargeMinimal(Value1, Value2: Currency; bAll: boolean=true): Boolean;
begin
  if not ((Table2IsShtuki.AsString = 'N') and DR_AUTOLOAD
    and (dbeRepNum.DataSource.DataSet.FieldByName('AUTO_LOAD').AsString = 'P')
    and IsAVERAGE(dbdeRepDate.Value)) then
  begin
    Result := Mround(Value1, 3) - MRound(Value2, 3) = 0;
    if not Result then
      if bAll then
        Result := (MRound(Value1, 3) - MRound(Value2, 3) >= MINIMAL_REST) or
          (MRound(Value2, 3) - MRound(Value1, 3) >= MINIMAL_REST)
      else
        Result := (MRound(Value1, 3) - MRound(Value2, 3) >= MINIMAL_REST);
  end
  else Result := true;
end;
//==============================================================================
//=======================Початок збереження даних===============================
//==============================================================================
procedure TSRepForm.SaveSRTalons(p_TTN_ID, p_TTN_INST, p_RASH_ID: integer; p_Ud_Weig: Currency);
begin
  // Занесение реализации по талонам
  qPriv.Close;
  qPriv.SQL.Text :=
    'select * from Oil_SRTalon.DB where ttn_id = '+ IntToStr(p_TTN_ID) +' and ttn_inst = '+ IntToStr(p_TTN_INST);
  qPriv.Open;
  while not qPriv.Eof do
  begin
    if not ((qPriv.FieldByName('SER').AsString = '') and (qPriv.FieldByName('LITR').AsCurrency = 0)) then
      DBSaver.SaveRecord('OIL_SRTALON',
        ['ID',        GetNextId('OIL_SRTALON', ['SREP_ID', p_RASH_ID, 'SREP_INST', INST]),
         'STATE',     'Y',
         'INST',      INST,
         'SREP_ID',   p_RASH_ID,
         'SREP_INST', INST,
         'SER',       qPriv.FieldByName('SER').AsString,
         'NUM',       qPriv.FieldByName('NUM').AsInteger,
         'LITR',      qPriv.FieldByName('LITR').AsCurrency,
         'COUNT_T',   MRound(p_Ud_Weig * qPriv.FieldByName('LITR').AsCurrency / Get1000, DR_ROUND_COUNT),
         'PRICE',     qPriv.FieldByName('PRICE').AsFloat,
         'INTHEWAY',  decode([qPriv.FieldByName('INTHEWAY').AsInteger, 0, 1, qPriv.FieldByName('INTHEWAY').AsInteger]),
         'CODE_OBL',  null,
         'ORG_ID',    null,
         'ORG_INST',  null
        ]);
    qPriv.Next;
  end;
end;
//==============================================================================
procedure TSRepForm.SavePRTalons();
var
  PrihTid: integer;
begin
  // якщо прихід талонів підкріплявся, то цю процедуру минаємо
  if dbceAZSName.DataSource.DataSet.FieldByName('LOAD_PRIH_TALON').AsString = 'Y' then exit;
  // Занесение шапки талонов
  qPriv.Close;
  qPriv.SQL.Text := 'select Ser, Num from Oil_SRTalon.DB where Ser is not null';
  qPriv.Open;
  if not qPriv.IsEmpty then
  begin
    PrihTId := GetNextId('OIL_TALON_PRIH',
      ['SREP_ID',   dbeRepNum.DataSource.DataSet.FieldByName('Id').Value,
       'SREP_INST', dbeRepNum.DataSource.DataSet.FieldByName('Inst').Value], 'S_OIL_TALON_PRIHOD');

    DBSaver.SaveRecord('OIL_TALON_PRIH',
      ['ID',        PrihTId,
       'STATE',     'Y',
       'INST',      INST,
       'SREP_ID',   dbeRepNum.DataSource.DataSet.FieldByName('Id').Value,
       'SREP_INST', dbeRepNum.DataSource.DataSet.FieldByName('Inst').Value,
       'OPER_ID',   180,
       'PRIH_DATE', StrToDate(FormatDateTime('dd.mm.yyyy', dbdeRepDate.Value)),
       'PRIH_NUM',  dbeRepNum.Text,
       'ORG_ID',    dbceAZSName.DataSource.DataSet.FieldByName('AZS_Id').Value,
       'ORG_INST',  dbceAZSName.DataSource.DataSet.FieldByName('AZS_Inst').Value,
       'DEP_ID',    TalonDepID,
       'DEP_INST',  TalonDepINST,
       'MEMO',      null,
       'SMENA_NUM', null
      ]);
    // Занесение талонов
    qPriv.Close;
    qPriv.SQL.Text :=
      'select Ser, Num, NPGrp_Id, sum(Litr) as Litr, sum(Litr * Price)/sum(Litr) as Price,' +
      ' Auto_Id, Auto_Inst, Employ_Id, Employ_Inst from Oil_SRTalon.DB where Ser is not null ' +
      'group by Ser, Num, NPGrp_Id, Auto_Id, Auto_Inst, Employ_Id, Employ_Inst';
    qPriv.Open;
    while not qPriv.Eof do
    begin
      DBSaver.SaveRecord('OIL_TALON_DATA',
        ['ID',          GetNextId('OIL_TALON_DATA', ['HEAD_ID', PrihTid, 'HEAD_INST', INST]),
         'STATE',       'Y',
         'INST',        INST,
         'HEAD_ID',     PrihTid,
         'HEAD_INST',   INST,
         'NPGRP_ID',    qPriv.FieldByName('NPGRP_ID').Value,
         'SER',         qPriv.FieldByName('SER').AsString,
         'NUM',         qPriv.FieldByName('NUM').AsInteger,
         'NOMINAL',     qPriv.FieldByName('LITR').AsInteger,
         'PRICE',       MRound(qPriv.FieldByName('PRICE').AsFloat, 2),
         'AUTO_ID',     qPriv.FieldByName('AUTO_ID').Value,
         'AUTO_INST',   qPriv.FieldByName('AUTO_INST').Value,
         'EMPLOY_ID',   qPriv.FieldByName('EMPLOY_ID').Value,
         'EMPLOY_INST', qPriv.FieldByName('EMPLOY_INST').Value,
         'CODE_OBL',    null
        ]);
      qPriv.Next;
    end;
  end;
end;
//==============================================================================
procedure TSRepForm.SaveVedomost(p_TTN_ID, p_TTN_INST, p_RASH_ID: integer; p_Ud_Weig: Currency);
begin
  // Занесение реализации по ведомости
  qPriv.Close;
  qPriv.SQL.Text :=
    'select * from Oil_Vedomost.DB where ttn_id = '+ IntToStr(p_TTN_ID) +' and ttn_inst = '+ IntToStr(p_TTN_INST);
  qPriv.Open;
  while not qPriv.Eof do
  begin
    DBSaver.SaveRecord('OIL_VEDOMOST',
      ['ID',        GetNextId('OIL_VEDOMOST', ['SREP_ID', p_RASH_ID, 'SREP_INST', INST]),
       'STATE',     'Y',
       'INST',      INST,
       'SREP_ID',   p_RASH_ID,
       'SREP_INST', INST,
       'ORG_ID',    qPriv.FieldByName('Org_Id').Value,
       'ORG_INST',  qPriv.FieldByName('Org_Inst').Value,
       'DOG_ID',    qPriv.FieldByName('Dog_Id').Value,
       'DOG_INST',  qPriv.FieldByName('Dog_Inst').Value,
       'LITR',      qPriv.FieldByName('Litr').AsCurrency,
       'COUNT_T',   MRound(p_Ud_Weig * qPriv.FieldByName('LITR').AsCurrency / Get1000, DR_ROUND_COUNT),
       'PRICE',     qPriv.FieldByName('Price').AsFloat,
       'AMOUNT',    qPriv.FieldByName('Amount').AsFloat
      ]);
    qPriv.Next;
  end;
end;
//==============================================================================
procedure TSRepForm.SaveDROther(
  p_TTN_ID, p_TTN_INST, p_RASH_ID, p_NPG_ID: integer;
  p_Ud_Weig, p_PRICE: Currency); // Занесение реализации по прочим операциям
begin
  // Занесение реализации по прочим операциям
  qPriv.Close;
  qPriv.SQL.text :=
    'select OPER_ID,Org_Id,Org_Inst,AUTO_ID,AUTO_INST,EMPLOY_ID,EMPLOY_INST,Dog_Id,Dog_Inst,Litr,Count_T,Amount, count(OPER_ID) as rownum' +
    '  from OIL_SROther.DB' +
    ' where oper_id is not null' +
    '   and ttn_id = '+ IntToStr(p_TTN_ID) +' and ttn_inst = '+ IntToStr(p_TTN_INST) +
    ' group by OPER_ID,Org_Id,Org_Inst,AUTO_ID,AUTO_INST,EMPLOY_ID,EMPLOY_INST,Dog_Id,Dog_Inst,Litr,Count_T,Amount';
  qPriv.Open;
  while not qPriv.Eof do
  begin
    if not qPriv.FieldByName('OPER_ID').IsNull then
    begin
      DBSaver.SaveRecord('OIL_SROTHER',
        ['ID',          GetNextId('OIL_SROTHER', ['SREP_ID', p_RASH_ID, 'SREP_INST', INST]),
         'STATE',       'Y',
         'INST',        INST,
         'SREP_ID',     p_RASH_ID,
         'SREP_INST',   INST,
         'OPER_ID',     qPriv.FieldByName('OPER_ID').Value,
         'ORG_ID',      qPriv.FieldByName('Org_Id').Value,
         'ORG_INST',    qPriv.FieldByName('Org_Inst').Value,
         'AUTO_ID',     qPriv.FieldByName('AUTO_ID').Value,
         'AUTO_INST',   qPriv.FieldByName('AUTO_INST').Value,
         'EMPLOY_ID',   qPriv.FieldByName('EMPLOY_ID').Value,
         'EMPLOY_INST', qPriv.FieldByName('EMPLOY_INST').Value,
         'DOG_ID',      qPriv.FieldByName('Dog_Id').Value,
         'DOG_INST',    qPriv.FieldByName('Dog_Inst').Value,
         'LITR',        qPriv.FieldByName('Litr').AsCurrency,
         'COUNT_T',     MRound(qPriv.FieldByName('Count_T').AsFloat, DR_ROUND_COUNT),
         'PRICE',       p_PRICE,
         'AMOUNT',      qPriv.FieldByName('Amount').AsCurrency,
         'SC_REST',     null,
         'SC_NUMBER',   null,
         'SC_CHEQUE',   null
        ]);
      if (qPriv.FieldByName('rownum').AsInteger > 1)
        and (qPriv.FieldByName('OPER_ID').Value <> 55)
        and (qPriv.FieldByName('OPER_ID').Value <> 278) then
        GetLogMes(
          TranslateText('Попытка сохранить удвоенную запись по операции "'+
            GetOperationName(qPriv.FieldByName('OPER_ID').Value) +
          TranslateText('" на ') + FloatToStrF(qPriv.FieldByName('Litr').AsCurrency, ffFixed, 15, 3) +
          TranslateText(' литров! (Группа НП: ')+ VarToStr(p_NPG_ID) +', '+ GetNpGName(p_NPG_ID) +')'));
    end;
    qPriv.Next;
  end;
end;
//==============================================================================
procedure TSRepForm.SaveDRData(var RashId: integer);
var
  pOUT_NAL_COUNT, pOUT_SN_COUNT, pOUT_VED_COUNT, pOUT_TALON_COUNT, pOUT_COUNT: real;
  pOUT_VED_MONEY, pOUT_TALON_MONEY: Currency;
begin
  if Table2Base.Value = 0 then
  begin
    pOUT_NAL_COUNT   := MRound(Table2NAL.AsFloat * Table2Ud_weig.AsFloat / Get1000, DR_ROUND_COUNT);
    pOUT_SN_COUNT    := MRound(Table2SN.Value    * Table2Ud_weig.AsFloat / Get1000, DR_ROUND_COUNT);

    qPriv.Close;
    qPriv.SQL.Text :=
      'select sum(COUNT_T), sum(Amount) from Oil_Vedomost.DB' +
      ' where ttn_id = '+ Table2TTN_ID.AsString +' and ttn_inst = '+ Table2TTN_INST.AsString;
    qPriv.Open;
    pOUT_VED_COUNT := MRound(qPriv.Fields[0].AsFloat, DR_ROUND_COUNT);
    pOUT_VED_MONEY := qPriv.Fields[1].AsFloat;

    qPriv.Close;
    qPriv.SQL.Text :=
      'select sum(litr * price) as sm, sum(count_t) as ton from Oil_SRTalon.DB ' +
      ' where ttn_id = '+ Table2TTN_ID.AsString +' and ttn_inst = '+ Table2TTN_INST.AsString;
    qPriv.Open;
    pOUT_TALON_COUNT := MRound(qPriv.FieldByName('ton').AsFloat, DR_ROUND_COUNT);
    pOUT_TALON_MONEY := qPriv.FieldByName('sm').AsFloat;

    qPriv.Close;
    qPriv.SQL.Text :=
      'select sum(count_t) as ton from OIL_SROther.DB' +
      ' where ttn_id = '+ Table2TTN_ID.AsString +' and ttn_inst = '+ Table2TTN_INST.AsString;
    qPriv.Open;
    pOUT_COUNT := MRound(qPriv.FieldByName('ton').AsFloat, DR_ROUND_COUNT);
  end
  else
  begin
    pOUT_NAL_COUNT   := MRound(Table2NAL.AsFloat,   DR_ROUND_COUNT);
    pOUT_SN_COUNT    := MRound(Table2SN.Value,      DR_ROUND_COUNT);
    pOUT_VED_COUNT   := MRound(Table2VED.AsFloat,   DR_ROUND_COUNT);
    pOUT_TALON_COUNT := MRound(Table2TALON.AsFloat, DR_ROUND_COUNT);
    pOUT_COUNT       := MRound(Table2OTHER.AsFloat, DR_ROUND_COUNT);

    pOUT_VED_MONEY   := MRound(Table2VED.AsFloat * Table2N_Price.AsFloat,   2);
    pOUT_TALON_MONEY := MRound(Table2TALON.AsFloat * Table2N_Price.AsFloat, 2);
  end;

  RashId := GetNextId('OIL_DR_DATA',
    ['REP_ID',   dbeRepNum.DataSource.DataSet.FieldByName('Id').Value,
     'REP_INST', dbeRepNum.DataSource.DataSet.FieldByName('Inst').Value]);

  DBSaver.SaveRecord('OIL_DR_DATA',
    ['ID',              RashId,
     'STATE',           'Y',
     'INST',            INST,
     'REP_ID',          dbeRepNum.DataSource.DataSet.FieldByName('Id').Value,
     'REP_INST',        dbeRepNum.DataSource.DataSet.FieldByName('Inst').Value,
     'OPER_TYPE',       1,
     'TTN_ID',          Table2TTN_id.AsInteger,
     'TTN_INST',        Table2TTN_inst.AsInteger,
     'PR_LITR',         null,
     'PR_UD_WEIG',      Table2UD_WEIG.Value,
     'PR_COUNT',        null,
     'S_PRICE',         Table2N_Price.Value,
     'OUT_NAL_LITR',    Table2NAL.Value,
     'OUT_NAL_COUNT',   pOUT_NAL_COUNT,
     'OUT_NAL_MONEY',   Table2Nal_Money.AsFloat,
     'OUT_VED_LITR',    Table2VED.Value,
     'OUT_VED_COUNT',   pOUT_VED_COUNT,
     'OUT_VED_MONEY',   pOUT_VED_MONEY,
     'OUT_TALON_LITR',  Table2TALON.Value,
     'OUT_TALON_COUNT', pOUT_TALON_COUNT,
     'OUT_TALON_MONEY', pOUT_TALON_MONEY,
     'OUT_SN_LITR',     Table2SN.Value,
     'OUT_SN_COUNT',    pOUT_SN_COUNT,
     'OUT_SN_MONEY',    Table2SN.Value * Table2N_Price.Value,
     'OUT_RASH_ID',     null,
     'OUT_LITR',        Table2OTHER.Value,
     'OUT_COUNT',       pOUT_COUNT,
     'OUT_MONEY',       Table2OTHER.AsFloat * Table2N_Price.AsFloat,
     'SUB_PART',        Table2SubPart_name.AsString,
     'START_SM',        Mround(Table2litr.Value, 3),
     'END_SM',          MRound(Table2C_litr.Value, 3)
    ]);
end;
//==============================================================================
procedure TSRepForm.SaveClearDRData();
begin
  DBSaver.SaveRecord('OIL_DR_DATA',
    ['ID',              GetNextId('OIL_DR_DATA',
                          ['REP_ID',   dbeRepNum.DataSource.DataSet.FieldByName('Id').Value,
                           'REP_INST', dbeRepNum.DataSource.DataSet.FieldByName('Inst').Value]),
     'STATE',           'Y',
     'INST',            INST,
     'REP_ID',          dbeRepNum.DataSource.DataSet.FieldByName('Id').Value,
     'REP_INST',        dbeRepNum.DataSource.DataSet.FieldByName('Inst').Value,
     'OPER_TYPE',       2,
     'TTN_ID',          Table2TTN_id.AsInteger,
     'TTN_INST',        Table2TTN_inst.AsInteger,
     'PR_LITR',         null,
     'PR_UD_WEIG',      Table2UD_WEIG.Value,
     'PR_COUNT',        null,
     'S_PRICE',         Table2N_Price.Value,
     'OUT_NAL_LITR',    0,
     'OUT_NAL_COUNT',   0,
     'OUT_NAL_MONEY',   0,
     'OUT_VED_LITR',    0,
     'OUT_VED_COUNT',   0,
     'OUT_VED_MONEY',   0,
     'OUT_TALON_LITR',  0,
     'OUT_TALON_COUNT', 0,
     'OUT_TALON_MONEY', 0,
     'OUT_SN_LITR',     0,
     'OUT_SN_COUNT',    0,
     'OUT_SN_MONEY',    0,
     'OUT_RASH_ID',     null,
     'OUT_LITR',        0,
     'OUT_COUNT',       0,
     'OUT_MONEY',       0,
     'SUB_PART',        Table2SubPart_name.AsString,
     'START_SM',        Mround(Table2litr.Value, 3),
     'END_SM',          MRound(Table2C_litr.Value, 3)
    ]);
end;
//==============================================================================
procedure TSRepForm.SaveDRMoney();
begin
  // Занесение движения по кассе
  DBSaver.SaveRecord('OIL_DR_MONEY',
    ['ID',           GetNextId('OIL_DR_MONEY',
                       ['REP_ID',   dbeRepNum.DataSource.DataSet.FieldByName('Id').Value,
                        'REP_INST', dbeRepNum.DataSource.DataSet.FieldByName('Inst').Value], 'S_DR_MONEY'),
     'STATE',        'Y',
     'INST',         INST,
     'REP_ID',       dbeRepNum.DataSource.DataSet.FieldByName('Id').Value,
     'REP_INST',     dbeRepNum.DataSource.DataSet.FieldByName('Inst').Value,
     'SM_START',     ceSTART.Value,
     'SM_GET',       ceGET.Value,
     'SM_OUT',       ceOUT.Value,
     'SM_END',       ceEND.Value,
     'GET_LITR',     CurAmountLitr.Value,
     {данные по штучному товару}
     'SM_OUT_SHT',   cedShtukiKassa.Value,
     'SM_END_SHT',   cedOstEndSht.Value,
     'SM_OUT_NP',    cedNPKassa.Value,
     'SM_END_NP',    cedOstEndNp.Value,
     'SM_START_SHT', cedOstBeginSht.Value,
     'SM_START_NP',  cedOstBeginNp.Value,
     'SM_POLIS_GET', cedAddMoney.Value
    ]);
end;
//==============================================================================
procedure TSRepForm.SaveDeltaDRData(p_RashId: integer);
var
  ost: real;
  TID, TINST: Integer;
begin
  // Занесение дельты реализации при закрытии подпартии
  if Table2C_Litr.Value = 0 then
  begin
    if IsAVERAGE(dbdeRepDate.Value) then
    begin
      qOstAVERAGE.Close;
      _OpenQueryPar(qOstAVERAGE,
        ['p_rep_date', dbeRepNum.DataSource.DataSet.FieldByName('Rep_Date').AsDateTime,
         'p_azs_id',   dbceAZSName.DataSource.DataSet.FieldByName('azs_id').AsInteger,
         'p_np',       decode([Table2IsShtuki.AsString, 'N', Table2NP_GRP.AsInteger, Table2NP_TYPE_ID.AsInteger]),
         'p_IsShtuki', Table2IsShtuki.AsString]);
      ost := qOstAVERAGE.Fields[0].AsFloat;
    end
    else
    begin
      ost := MRound(GetSqlValueParSimple(
        'select sum(nvl(a.pr_count,0)) - sum(nvl(a.out_nal_count,0) + nvl(a.out_ved_count,0) + ' +
        '  nvl(a.out_talon_count,0) + nvl(a.out_sn_count,0) + nvl(a.out_count,0)) as ostatok_T ' +
        'from oil_dr_data a, (select id, inst from oil_daily_rep where state = ''Y'' ' +
        '  and azs_id = :azs_id and azs_inst = :azs_id and rep_date <= ' +
        '  to_date(to_char(:RepDate, ''dd.mm.yyyy hh24:mi:ss''), ''dd.mm.yyyy hh24:mi:ss'') +1/144) O ' +
        'where a.rep_id = o.id and a.rep_inst = o.inst and state = ''Y'' and ttn_id = :ttn_id and ttn_inst = :ttn_inst',
        ['RepDate',  dbeRepNum.DataSource.DataSet.FieldByName('Rep_Date').AsDateTime,
         'azs_id',   dbceAZSName.DataSource.DataSet.FieldByName('azs_id').AsInteger,
         'ttn_id',   Table2TTN_ID.AsInteger,
         'ttn_inst', Table2TTN_INST.AsInteger]), DR_ROUND_COUNT);
    end;

    if Table2NAL.AsFloat <> 0 then
      _ExecSQL('update oil_dr_data set out_nal_count = out_nal_count + :ost where id = :id and inst = :inst',
        ['ost', ost, 'id', p_RashId, 'inst', Inst])
    else
      if Table2VED.AsFloat <> 0 then
      begin
        _ExecSQL('update oil_dr_data set out_ved_count = out_ved_count + :ost where id = :id and inst = :inst',
          ['ost', ost, 'id', p_RashId, 'inst', Inst]);

        qWork.Close;
        qWork.SQL.Text :=
          'select id, inst from Oil_Vedomost where state = ''Y'' and srep_id = :srep_id and srep_inst = :srep_inst';
        _OpenQueryPar(qWork, ['srep_id', p_RashId, 'srep_inst', Inst]);

        TID := qWork.FieldByName('ID').AsInteger;
        TINST := qWork.FieldByName('INST').AsInteger;

        _ExecSQL('update Oil_Vedomost set count_t = count_t + :ost where id = :id and inst = :inst',
          ['ost', ost, 'id', TID, 'inst', TINST]);
      end
      else
        if Table2TALON.AsFloat <> 0 then
        begin
          _ExecSQL('update oil_dr_data set out_talon_count = out_talon_count + :ost where id = :id and inst = :inst',
            ['ost', ost, 'id', p_RashId, 'inst', Inst]);

          qWork.Close;
          qWork.SQL.Text :=
            'select id, inst from oil_srtalon where state = ''Y'' and srep_id = :srep_id and srep_inst = :srep_inst';
          _OpenQueryPar(qWork, ['srep_id', p_RashId, 'srep_inst', Inst]);

          TID := qWork.FieldByName('ID').AsInteger;
          TINST := qWork.FieldByName('INST').AsInteger;

          _ExecSQL('update oil_srtalon set count_t = count_t + :ost where id = :id and inst = :inst',
            ['ost', ost, 'id', TID, 'inst', TINST]);
        end
        else
          if Table2SN.AsFloat <> 0 then
            _ExecSQL('update oil_dr_data set out_sn_count = out_sn_count + :ost where id = :id and inst = :inst',
              ['ost', ost, 'id', p_RashId, 'inst', Inst])
          else
            if Table2Other.AsFloat <> 0 then
            begin
              _ExecSQL('update oil_dr_data set out_count = out_count + :ost where id = :id and inst = :inst',
                ['ost', ost, 'id', p_RashId, 'inst', Inst]);

              qWork.Close;
              qWork.SQL.Text :=
                'select id, inst from oil_srother where state = ''Y'' and srep_id = :srep_id and srep_inst = :srep_inst';
              _OpenQueryPar(qWork, ['srep_id', p_RashId, 'srep_inst', Inst]);

              TID := qWork.FieldByName('ID').AsInteger;
              TINST := qWork.FieldByName('INST').AsInteger;

              _ExecSQL('update oil_srother set count_t = count_t + :ost where id = :id and inst = :inst',
                ['ost', ost, 'id', TID, 'inst', TINST]);
            end;
  end;
end;
//==============================================================================
procedure TSRepForm.SaveDelete();
begin
  // Удаление старой реализации по сменному отчету
  _ExecSql('UPDATE OIL_DR_MONEY SET STATE = ''N'' where REP_ID = :REP_ID and REP_INST = :REP_INST',
    ['REP_ID',   dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger,
     'REP_INST', dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsInteger]);

  _ExecSql('UPDATE OIL_DR_DATA SET STATE = ''N'' where oper_type <> 0 and REP_ID = :REP_ID and REP_INST = :REP_INST',
    ['REP_ID',   dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger,
     'REP_INST', dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsInteger]);

  _ExecSql('UPDATE OIL_VEDOMOST SET STATE = ''N'' where (SREP_ID, SREP_INST) in ' +
    '(select Id, Inst from Oil_DR_Data where REP_ID = :REP_ID and REP_INST = :REP_INST)',
    ['REP_ID',   dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger,
     'REP_INST', dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsInteger]);

  _ExecSql('UPDATE OIL_SRTALON SET STATE = ''N'' where (SREP_ID, SREP_INST) in ' +
    '(select Id, Inst from Oil_DR_Data where REP_ID = :REP_ID and REP_INST = :REP_INST)',
    ['REP_ID',   dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger,
     'REP_INST', dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsInteger]);

  _ExecSql('UPDATE OIL_SROTHER SET STATE = ''N'' where (SREP_ID, SREP_INST) in ' +
    '(select Id, Inst from Oil_DR_Data where REP_ID = :REP_ID and REP_INST = :REP_INST)',
    ['REP_ID',   dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger,
     'REP_INST', dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsInteger]);

  // видалення даних по талонам
  if dbceAZSName.DataSource.DataSet.FieldByName('LOAD_PRIH_TALON').AsString <> 'Y' then
  begin
    // видалення шапки
    _ExecSql('UPDATE Oil_Talon_Prih SET STATE = ''N''' +
             ' where state = ''Y'' and SREP_ID = :SREP_ID and SREP_INST = :SREP_INST and INST = :INST',
      ['SREP_ID',   dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger,
       'SREP_INST', dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsInteger,
       'INST',      INST]);

    // видалення деталізації
    _ExecSql('UPDATE Oil_Talon_Data SET STATE = ''N''' +
             ' where state = ''Y'' and (Head_Id, Head_Inst) in ' +
             '   (select /*+NO_MERGE*/ Id, Inst from Oil_Talon_Prih' +
             '     where SREP_ID = :SREP_ID and SREP_INST = :SREP_INST and INST = :INST)',
      ['SREP_ID',   dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger,
       'SREP_INST', dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsInteger,
       'INST',      INST]);
  end;
end;
//==============================================================================
procedure TSRepForm.SaveAZS();
begin // збереження даних по АЗС
  if SList.Count = 0 then exit;
  // загрузка секцій із АЗС
  qWork.Close;
  qWork.SQL.Text :=
    'select * from oil_azs_sections' +
    ' where state = ''Y''' +
    '   and table_name   is not null and table_fields   is not null' +
    '   and section_name is not null and section_fields is not null' +
    ' order by id';
  qWork.Open;
  if not qWork.IsEmpty then
  begin
    qWork.First;
    while not qWork.Eof do
    begin
      SaveSection(
        dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger,
        dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsInteger,
        qWork.FieldByName('table_name').AsString,
        qWork.FieldByName('section_name').AsString,
        qWork.FieldByName('table_fields').AsString,
        qWork.FieldByName('section_fields').AsString,
        Packet);
      qWork.Next;
    end;
  end;
  // Вставка даних по скидці
  if mtSkidka.Active then
  begin
    mtSkidka.First;
    while not mtSkidka.Eof do
    begin
      DBSaver.SaveRecord('OIL_AZS_SKIDKA',
        ['INST',           INST,
         'STATE',          'Y',
         'REP_ID',         dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger,
         'REP_INST',       dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsInteger,
         'STYPE',          mtSkidkaSTYPE.Value,
         'ORG_ID',         decode([mtSkidkaORG_ID.Value, 0, null, mtSkidkaORG_ID.Value]),
         'NP_ID',          mtSkidkaNP_ID.Value,
         'ZAKAZ',          decode([mtSkidkaZAKAZ.Value, 0, null, mtSkidkaZAKAZ.Value]),
         'LITR',           mtSkidkaLITR.Value,
         'PRICE',          mtSkidkaPRICE.Value,
         'SUMM',           mtSkidkaSUMM.Value,
         'SKIDKA',         mtSkidkaSKIDKA.Value
        ]);
      mtSkidka.Next;
    end;
  end;
end;
//==============================================================================
procedure TSRepForm.SaveRESAVE();
// збереження позначки про необхідність повторного переприйняття змінних звітів
begin
  _ExecSqlOra(
    'update oil_daily_rep set resave = ''Y''' +
    ' where state = ''Y'' and resave is null' +
    '   and azs_id = :p_azs_id and azs_inst = :p_azs_id' +
    '   and to_date(to_char(rep_date,    ''dd.mm.rrrr HH24:mi''), ''dd.mm.rrrr HH24:mi'') >' +
    '       to_date(to_char(:p_rep_date, ''dd.mm.rrrr HH24:mi''), ''dd.mm.rrrr HH24:mi'')',
    ['p_rep_date', dbeRepNum.DataSource.DataSet.FieldByName('Rep_Date').AsDateTime,
     'p_azs_id',   dbeRepNum.DataSource.DataSet.FieldByName('AZS_Id').AsInteger]);
end;
//==============================================================================
procedure TSRepForm.SaveRest(); // збереження залишків на кінець місяця
var
  day, month, year: Word;
  RestDate: TDateTime;
begin
  if not IsAVERAGE(dbdeRepDate.Value) then exit;

  // якщо це є не перший змінний звіт у цьому місяці, то вихід із процедури
  if GetSqlValueParSimple(
    'select count(*) from oil_daily_rep' +
    ' where state = ''Y''' +
    '   and azs_id = :p_azs_id' +
    '   and trunc(rep_date) between trunc(:p_rep_date, ''mm'') and trunc(:p_rep_date)' +
    '   and to_date(to_char(rep_date,    ''dd.mm.rrrr HH24:mi''), ''dd.mm.rrrr HH24:mi'') <' +
    '       to_date(to_char(:p_rep_date, ''dd.mm.rrrr HH24:mi''), ''dd.mm.rrrr HH24:mi'')',
    ['p_rep_date', dbeRepNum.DataSource.DataSet.FieldByName('Rep_Date').AsDateTime,
     'p_azs_id',   dbeRepNum.DataSource.DataSet.FieldByName('AZS_Id').AsInteger]) > 0 then exit;

  // формуємо дату залишків
  DecodeDate(dbeRepNum.DataSource.DataSet.FieldByName('Rep_Date').AsDateTime, year, month, day);
  RestDate := EncodeDate(year, month, 1);

  // видалення попередніх залишків, якщо вони введені не вручну
  _ExecSqlOra(
    'update oil_np_rest set state = ''N''' +
    ' where state = ''Y'' and manual = ''N''' +
    '   and inst = :p_inst and trunc(date_) = trunc(:p_rep_date) and azs_id = :p_azs_id',
    ['p_inst',     INST,
     'p_rep_date', RestDate,
     'p_azs_id',   dbeRepNum.DataSource.DataSet.FieldByName('AZS_Id').AsInteger]);

  // заносимо залишки у базу даних
  qRashEditAVERAGE.First;
  while not qRashEditAVERAGE.Eof do
  begin
    DBSaver.SaveRecord('OIL_NP_REST',
      ['ID',         GetNextId('OIL_NP_REST', ['DATE_', RestDate]),
       'INST',       INST,
       'STATE',      'Y',
       'DATE_',      RestDate,
       'AZS_ID',     dbeRepNum.DataSource.DataSet.FieldByName('AZS_Id').AsInteger,
       'NP_TYPE_ID', qRashEditAVERAGE.FieldByName('NP_TYPE_ID').AsInteger,
       'TTN_ID',     qRashEditAVERAGE.FieldByName('TTN_ID').AsInteger,
       'TTN_INST',   qRashEditAVERAGE.FieldByName('TTN_INST').AsInteger,
       'PRICE',      qRashEditAVERAGE.FieldByName('S_PRICE').AsCurrency,
       'UD_WEIGHT',  qRashEditAVERAGE.FieldByName('UD_WEIG').AsCurrency,
       'REST_LITR',  MRound(qRashEditAVERAGE.FieldByName('Ostatok_Lp').AsCurrency, 3),
       'REST_KG',    MRound(qRashEditAVERAGE.FieldByName('Ostatok_Tp').AsFloat, DR_ROUND_COUNT),
       'MANUAL',     'N'
      ]);
    qRashEditAVERAGE.Next;
  end;
end;
//==============================================================================
procedure TSRepForm.log(s: string);
begin
  if SysParamExists('SREPLOG') then
    exfunc.log('srep.log',FormatDateTime('dd.mm.yyyy hh:nn:ss',now())+' '+s);
end;
//==============================================================================
procedure TSRepForm.SaveOtherCount(p_TTN_ID, p_TTN_INST: integer; p_Ud_Weig: Currency);
// Занесение реализации по прочим операциям у файл DB
var
  COUNT_T: real;
begin
  Table5.Close;
  Table5.TableName := 'OIL_SROther.db';
  Table5.Open;

  Table5.Filtered := false;
  Table5.Filter   := 'TTN_ID = '+ IntToStr(p_TTN_ID) +' and TTN_INST = '+ IntToStr(p_TTN_INST);
  Table5.Filtered := true;

  try
    if Table5.IsEmpty then exit;
    Table5.First;

    while not Table5.Eof do
    begin
      if (Table5.FieldByName('OPER_ID').AsInteger in [16, 55, 102]) or (Table5.FieldByName('OPER_ID').AsInteger = 278) then
        COUNT_T := MRound(Table5.FieldByName('Count_T').AsFloat, DR_ROUND_COUNT)
      else
        COUNT_T := MRound(p_Ud_Weig * Table5.FieldByName('LITR').AsCurrency / Get1000, DR_ROUND_COUNT);

      if COUNT_T <> MRound(Table5.FieldByName('Count_T').AsFloat, DR_ROUND_COUNT) then
      begin
        Table5.Edit;
        Table5.FieldByName('Count_T').AsFloat := COUNT_T;
        Table5.Post;
      end;
      Table5.Next;
    end;
  finally
    Table5.Filter   := '';
    Table5.Filtered := false;
    Table5.Close;
  end;
end;
//==============================================================================
procedure TSRepForm.actSaveExecute(Sender: TObject);
var
  TmpStr: string;
  RashId: Integer;
begin
   if not ((nb.ActivePage = 'Money') and bbOk.Enabled) then exit;

   bbRashPrev.Enabled := false;
   bbCloseSR.Enabled := false;
   bbOk.Enabled := false;
   // Установка точки отката перед сохранением реализации
   _ExecSql('savepoint ApplyUpdates');
   try
     // Удаление старой реализации по сменному отчету
     SaveDelete();
     // Занесение движения по кассе
     SaveDRMoney();
     // Занесение шапки талонов
     SavePRTalons();

     // Занесение реализации по подпартиям
     Table2.DisableControls;
     try
       Table2.First;
       while not Table2.Eof do
       begin
         if (Table2NAL.AsFloat <> 0) or (Table2VED.AsFloat <> 0) or (Table2SN.AsFloat <> 0)
           or (Table2TALON.AsFloat <> 0) or (Table2Other.AsFloat <> 0) or (Table2Other_Weight.AsFloat <> 0) then
         begin
           // Занесение реализации по прочим операциям у файл DB
           SaveOtherCount(Table2TTN_ID.AsInteger, Table2TTN_INST.AsInteger, Table2Ud_weig.AsFloat);

           SaveDRData(RashId);
           // Занесение реализации по ведомости
           SaveVedomost(Table2TTN_ID.AsInteger, Table2TTN_INST.AsInteger, RashId, Table2Ud_weig.AsFloat);
           // Занесение реализации по талонам
           SaveSRTalons(Table2TTN_ID.AsInteger, Table2TTN_INST.AsInteger, RashId, Table2Ud_weig.AsFloat);
           // Занесение реализации по прочим операциям
           SaveDROther (Table2TTN_ID.AsInteger, Table2TTN_INST.AsInteger, RashId, Table2NP_GRP.AsInteger,
             Table2Ud_weig.AsFloat, Table2N_Price.AsFloat);
           // Занесение дельты реализации при закрытии подпартии
           SaveDeltaDRData(RashId);
         end
         else
           if (Table2IsShtuki.AsString = 'N') or Table2bEdited.AsBoolean then
             SaveClearDRData();
         Table2.Next;
       end;
     finally
       Table2.EnableControls;
     end;
     SaveAZS(); // збереження даних по АЗС
     SaveRESAVE(); // збереження позначки про необхідність повторного переприйняття змінних звітів
     SaveRest(); // збереження залишків на кінець місяця

     if GetSqlValueParSimple(
       'select nvl(max(count_), 0) as count_' +
       '  from (select ttn_id, ttn_inst, count(*) as count_ from Oil_DR_Data' +
       '         where Rep_Id = :Rep_Id and Rep_Inst = :Rep_Inst' +
       '           and state = ''Y'' and oper_type = 1' +
       '         group by ttn_id, ttn_inst)',
       ['Rep_Id',   dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger,
        'Rep_Inst', dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsInteger]) > 1 then
       raise Exception.Create('В табличку Oil_DR_Data попало по данному сменному отчёту по одной подпартии более чем одна запись!' + #13#10 +
         'Вышлите следующий пакет из программы OilExch и обратитесь к разработчикам, так как данная ошибка есть очень некорректная.');
     if not DR_AUTOLOAD and Visible then
       DailyRepControl(TmpStr);
     ModalResult := mrOk;
   except on E: Exception do
     begin
       try
         qWork.Close;
         qWork.SQL.Text := 'rollback to ApplyUpdates';
         qWork.ExecSQL;
       except on E: Exception do
         GetLogMes(TranslateText('Ошибка на запросе "rollback to ApplyUpdates": ') + E.message);
       end;
       bbRashPrev.Enabled := true;
       bbCloseSR.Enabled := true;
       bbOk.Enabled := true;
       GetExcMes(TranslateText('Ошибка: ') + E.message);
       ModalResult := mrNone;
     end;
   end;
end;
//==============================================================================
//=======================Кінець збереження даних================================
//==============================================================================
procedure TSRepForm.TestSRepDateTime(); // перевірка дати та часу
begin
  qWork.Close;
  qWork.SQL.Text := 'select rep_date from oil_daily_rep' +
    ' where to_date(to_char(rep_date, ''dd.mm.rrrr HH24:mi''), ''dd.mm.rrrr HH24:mi'')' +
    '    = to_date(:p_rep_date, ''dd.mm.rrrr HH24:mi'')' +
    '   and trunc(rep_date) = trunc(to_date(:p_rep_date, ''dd.mm.rrrr HH24:mi'')) and state = ''Y''' +
    '   and azs_id = :p_azs_id and azs_inst = :p_azs_id' +
    '   and not (Id = :p_Id and Inst = :p_Inst)';
  _OpenQueryPar(qWork,
    ['p_rep_date', FormatDateTime('dd.mm.yyyy hh:nn', dbeRepNum.DataSource.DataSet.FieldByName('Rep_Date').AsDateTime),
     'p_azs_id',   dbeRepNum.DataSource.DataSet.FieldByName('AZS_Id').AsInteger,
     'p_Id',       dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger,
     'p_Inst',     dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsInteger]);
  if not qWork.IsEmpty then
    raise Exception.Create(TranslateText('Сменный отчет с такой датой/временем уже существует !'));
end;
//==============================================================================
procedure TSRepForm.TestSRepDateSmena(); // перевірка дати та номеру зміни
begin
  qWork.Close;
  qWork.SQL.Text := 'select rep_date from Oil_Daily_Rep' +
    ' where trunc(rep_date) = trunc(to_date(:p_rep_date, ''dd.mm.rrrr HH24:mi''))' +
    '   and smena_num = :p_smena_num and state = ''Y''' +
    '   and AZS_Id = :p_azs_id and AZS_Inst = :p_azs_id' +
    '   and not (Id = :p_Id and Inst = :p_Inst)';
  _OpenQueryPar(qWork,
    ['p_rep_date',  FormatDateTime('dd.mm.yyyy hh:nn', dbeRepNum.DataSource.DataSet.FieldByName('Rep_Date').AsDateTime),
     'p_smena_num', dbeSmenaNum.Text,
     'p_azs_id',    dbceAZSName.DataSource.DataSet.FieldByName('AZS_Id').AsInteger,
     'p_Id',        dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger,
     'p_Inst',      dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsInteger]);
  if not qWork.IsEmpty then
    GetLogExc(TranslateText('Сменный отчет с такой датой/номером смены уже существует !'));
end;
//==============================================================================
procedure TSRepForm.miLoadPrihTalonClick(Sender: TObject);
var
  F: TTalonPrihRefForm;
begin
  // шукаємо прихід талонів із параметрами змінного звіту
  qWork.Close;
  qWork.SQL.Text :=
    'select * from oil_talon_prih' +
    ' where state = ''Y''' +
    '   and trunc(prih_date) = :rep_date' +
    '   and org_id = :azs_id and org_inst = :azs_inst' +
    '   and oper_id = 180' +
    '   and smena_num = :smena_num';
  _OpenQueryPar(qWork,
    ['rep_date',  FormatDateTime('dd.mm.yyyy', dbeRepNum.DataSource.DataSet.FieldByName('Rep_Date').AsDateTime),
     'azs_id',    dbeRepNum.DataSource.DataSet.FieldByName('AZS_Id').AsInteger,
     'azs_inst',  dbeRepNum.DataSource.DataSet.FieldByName('AZS_Inst').AsInteger,
     'smena_num', dbeSmenaNum.Text]);

  // якщо прихід талонів знайдений i підв"язувався
  if (qWork.RecordCount = 1)
    and (qWork.FieldByName('srep_id').AsInteger = dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger)
    and (qWork.FieldByName('srep_inst').AsInteger = dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsInteger) then
    LoadPrihTalon(qWork.FieldByName('id').AsInteger, qWork.FieldByName('inst').AsInteger)
  else
  begin
    F := TTalonPrihRefForm.Create(Application);
    try // Подвязать
      F.bbOk.Visible := true;

      F.DBGrid1.FieldColumns['SMENA_NUM'].Visible := true;

      F.deBeginDate.Date    := trunc(dbdeRepDate.Value);
      F.deEndDate.Date      := trunc(dbdeRepDate.Value);
      F.deBeginDate.Enabled := false;
      F.deEndDate.Enabled   := false;

      F.SOrgId        := dbceAZSName.DataSource.DataSet.FieldByName('AZS_Id').AsInteger;
      F.SOrgInst      := dbceAZSName.DataSource.DataSet.FieldByName('AZS_Inst').AsInteger;
      F.ceOrg.Text    := dbceAZSName.Text;
      F.ceOrg.Enabled := false;

      F.edOper.Text    := TranslateText('Отоваривание талонов');
      F.edOper.Tag     := 180;
      F.edOper.Enabled := false;

      // при пошуку будуть шукатися лише приходи із номером зміни
      F.ShowModal;
      if F.ModalResult = mrOk then
        LoadPrihTalon(F.q['ID'], F.q['INST']);
    finally
      F.Free;
    end;
  end;
end;
//==============================================================================
procedure TSRepForm.LoadPrihTalon(PrihID, PrihINST: integer);
var
  qLoadPrihTalon: TOilQuery;
  sExistsTalon: string;
begin
  try
    qLoadPrihTalon := TOilQuery.Create(nil);
    qLoadPrihTalon.Close;
    qLoadPrihTalon.SQL.Text := 'select * from v_oil_talon_op where head_id = :id and head_inst = :inst';
    _OpenQueryPar(qLoadPrihTalon,['id', PrihID, 'inst', PrihINST]);

    {if not (qLoadPrihTalon.FieldByName('SREP_ID').IsNull
      or (qLoadPrihTalon.FieldByName('SREP_ID').AsInteger = dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger)) then
    begin
      MessageDlg(TranslateText('Данный приход талонов уже привязан к сменному отчёту!'), mtError, [mbOk], 0);
      exit;
    end;}

    if qLoadPrihTalon.FieldByName('PRIH_SMENA_NUM').AsString <> dbeSmenaNum.Text then
    begin
      MessageDlg(TranslateText('Номер смены прихода талонов не соответствует номеру смены в сменном отчете!' +
        #10#13+ Format(TranslateText('В приходе талонов ''%s'', а в сменном отчете ''%s''.'),
        [qLoadPrihTalon.FieldByName('PRIH_SMENA_NUM').AsString, dbeSmenaNum.Text])), mtError, [mbOk], 0);
      exit;
    end;

    try
      StartSqlOra;

      qPriv.Close;
      qPriv.SQL.Text := 'select * from Oil_SRTalon.DB';
      qPriv.Open;

      sExistsTalon := '';
      // якщо талони у змінному звіті відсутні, то приєднуємо прихід талонів і розносимо реалізацію
      if not qPriv.IsEmpty then
      begin
        qPriv.First;
        while not qPriv.Eof do
        begin
          qLoadPrihTalon.Filtered := false;
          qLoadPrihTalon.Filter :=
            'SER = '''+ qPriv.FieldByName('SER').AsString +''' and NUM = '''+ qPriv.FieldByName('NUM').AsString +'''';
          qLoadPrihTalon.Filtered := true;
          // якщо немає даного талона, або він вже був
          if qLoadPrihTalon.IsEmpty or
            (pos(qPriv.FieldByName('SER').AsString + qPriv.FieldByName('NUM').AsString, sExistsTalon) > 0) then
          begin
            if MessageDlg(
              TranslateText('Сменный отчет содержит талоны, которые отсутствуют в приходе талонов!') +#10#13+
              TranslateText('Удалить все талоны в сменном отчете?'), mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit
            else
            begin // видаляємо усі талони із змінного звіту
              Table2.DisableControls;
              try
                Table2.First;
                while not Table2.Eof do
                begin
                  Table2.Edit;
                  Table2TALON.Clear;
                  Table2.Post;
                  Table2.Next;
                end;
              finally
                Table2.EnableControls;
              end;
              qPriv.Close;
              qPriv.SQL.Text := 'delete from Oil_SRTalon.DB';
              qPriv.ExecSQL;

              qPriv.Close;
              qPriv.SQL.Text := 'delete from Oil_SRTalonT.DB';
              qPriv.ExecSQL;

              sExistsTalon := '';
              break;
            end;
          end
          else sExistsTalon := sExistsTalon +','+ qPriv.FieldByName('SER').AsString + qPriv.FieldByName('NUM').AsString;
          qPriv.Next
        end;
      end;

      if dbceAZSName.DataSource.DataSet.FieldByName('LOAD_PRIH_TALON').AsString <> 'Y' then
      begin // видалення талонів із змінного звіту
        // видалення шапки
        _ExecSql(
          'update oil_talon_prih set state = ''N''' +
          ' where state = ''Y'' and srep_id = :srep_id and srep_inst = :srep_inst and inst = :org_inst' +
          '   and not (id = :id and inst = :inst) and state = ''Y''',
          ['srep_id',   dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger,
           'srep_inst', dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsInteger,
           'id',        PrihID,
           'inst',      PrihINST,
           'org_inst',  INST]);
        // видалення деталізації
        _ExecSql(
          'update oil_talon_data set state = ''N''' +
          ' where state = ''Y'' and (head_id, head_inst) in' +
          '       (select /*+NO_MERGE*/ id, inst' +
          '          from oil_talon_prih' +
          '         where srep_id = :srep_id and srep_inst = :srep_inst' +
          '           and not (id = :id and inst = :inst) and inst = :org_inst)' +
          '   and state = ''Y''',
          ['srep_id',   dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger,
           'srep_inst', dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsInteger,
           'id',        PrihID,
           'inst',      PrihINST,
           'org_inst',  INST]);

        if sExistsTalon <> '' then
        begin // виведення талонів із шляху
          qPriv.Close;
          qPriv.SQL.Text := 'update Oil_SRTalon.DB set InTheWay = 5 where InTheWay = 4';
          qPriv.ExecSQL;
        end;
      end;

      // заносимо автокалькуляцією талони
      qLoadPrihTalon.Filtered := false;
      qLoadPrihTalon.First;
      while not qLoadPrihTalon.Eof do
      begin
        if pos(qLoadPrihTalon.FieldByName('Ser').AsString + qLoadPrihTalon.FieldByName('Num').AsString, sExistsTalon) = 0 then
          AutoCalcTalon(
            qLoadPrihTalon.FieldByName('Npgrp_id').AsInteger,
            qLoadPrihTalon.FieldByName('Nominal').AsFloat,
            qLoadPrihTalon.FieldByName('Ser').AsString,
            qLoadPrihTalon.FieldByName('Num').AsInteger, '', 3);
        qLoadPrihTalon.Next;
      end;

      // записуємо, що все добре
      dbceAZSName.DataSource.DataSet.FieldByName('LOAD_PRIH_TALON').AsString := 'Y';
      // приєднання шапки
      _ExecSql(
        'UPDATE Oil_Talon_Prih SET SREP_ID = :SREP_ID, SREP_INST = :SREP_INST' +
        ' where ID = :ID and INST = :INST',
        ['SREP_ID',   dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger,
         'SREP_INST', dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsInteger,
         'ID',        PrihID,
         'INST',      PrihINST]);
      CommitSqlOra;
      bbPrihPrev.Enabled := false;
      MessageDlg(TranslateText('Приход талонов подвязан.'), mtInformation, [mbOk], 0);
    except on E: Exception do
      begin
        RollbackSqlOra;
        // записуємо, що НЕ все добре
        dbceAZSName.DataSource.DataSet.FieldByName('LOAD_PRIH_TALON').AsString := 'N';

        MessageDlg(TranslateText('Ошибка: ')+ E.message +#10#13+
          TranslateText('Приход талонов не будет подвязан. Обратитесь к разработчикам!'), mtError, [mbOk], 0);
        // відновлюємо реалізацію
        bbPrihPrev.Click;
        GetRashod(); // реалізація
      end;
    end;
  finally
    qLoadPrihTalon.Free;
  end;
end;
//==============================================================================
procedure TSRepForm.dbeSmenaNumKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['1'..'9',#8]) then key := #0;
end;
//==============================================================================
var
  Cod: string;
//==============================================================================
function TSRepForm.OpenFileSRep(sFileName: string; var SL: TStringList): string;
// завантаження файлу
var
  UnZip: TUnZip;
  FilesExtracted: integer;
  AZS, DATE, NUM, FileName: string;

  //****************************************************************************
  procedure DeCodingFile(sFileOld, sFileNew: string);
  var
    hash: HCRYPTHASH;
    hProv: HCRYPTPROV;
    key: HCRYPTKEY;
    l: DWORD;
    data: PByte;
    inFile, outFile: file;
  begin
    if UpperCase(ExtractFileExt(sFileOld)) <> '.OIL' then
      raise Exception.Create('Файл должен иметь расширение OIL!');

    if not CryptAcquireContext(@hProv, nil, nil, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT) then
      raise Exception.Create('Error of CryptAcquireContext');
    if not CryptCreateHash(hProv, CALG_SHA, 0, 0, @hash) then
      raise Exception.Create('Error of CryptCreateHash');
    if not CryptHashData(hash, @Cod[1], length(Cod), 0) then
      raise Exception.Create('Error of CryptHashData');
    if not CryptDeriveKey(hProv, CALG_RC4, hash, 0, @key) then
      raise Exception.Create('Error of CryptHashData');
    if not CryptDestroyHash(hash) then
      raise Exception.Create('Error of CryptDestroyHash');

    try
      // вставляємо закодований файл
      AssignFile(inFile, sFileOld);
      // назва файлу відносно даних у файлі
      AssignFile(outFile, sFileNew);
      Reset(inFile, 1);
      Rewrite(outFile, 1);
      GetMem(data, 512);
      while not Eof(inFile) do
      begin
        BlockRead(inFile, data^, 512, l);
        if not CryptDecrypt(key, 0, eof(inFile), 0, data, @l) then
          raise Exception.Create('Error of CryptDecrypt');
        BlockWrite(outFile, data^, l);
      end;
      FreeMem(data, 512);
    finally
      CloseFile(inFile);
      CloseFile(outFile);
    end;
    DeleteFile(sFileOld);
  end;
  //****************************************************************************
begin
  SL.Clear;
  result := '';

  // якщо файл архівований, то розпаковуємо його
  if UpperCase(ExtractFileExt(sFileName)) = '.ZIP' then
  begin
    UnZip := TUnZip.Create(nil);
    try
      UnZIP.ArcType := atZip;
      UnZIP.ArchiveFile := sFileName;

      UnZIP.FileSpec.Clear;
      UnZIP.FileSpec.Add('*.OIL');

      UnZip.ExtractDir := GetMainDir +'AZSDir';
      FilesExtracted := UnZip.Extract();

      if FilesExtracted < 1 then
      begin
        FileName := UnZip.FileName;
        DATE     := Copy(FileName, 1, pos('_', FileName)-1);
        FileName := Copy(FileName, pos('_', FileName)+1, Length(FileName));

        AZS      := Copy(FileName, 1, pos('_', FileName)-1);
        FileName := Copy(FileName, pos('_', FileName)+1, Length(FileName));

        NUM      := Copy(FileName, 1, pos('.', FileName)-1);

        UnZip.Passwords.Clear;
        UnZip.Passwords.Add(uCrypt.Encrypt(crtSmart, [AZS +'23'+ NUM +'23'+ DATE +'23'+ DATE +'23'+ AZS]));

        FilesExtracted := UnZip.Extract;
        if FilesExtracted < 1 then
          raise Exception.Create('Архив пуст или поврежден!');

        SL.LoadFromFile(UnZip.FileName); // завантаження файлу
        if SL.IndexOf('BEGIN_ALFA_MESSAGE') = -1 then
        begin
          DeCodingFile(UnZip.FileName, UnZip.FileName +'n'); // декодування файлу
          SL.Clear;
          SL.LoadFromFile(             UnZip.FileName +'n'); // завантаження файлу
          DeleteFile(                  UnZip.FileName +'n'); // видалення файлу
          result :=                    UnZip.FileName +'n';
        end
        else
        begin
          DeleteFile(UnZip.FileName); // видалення файлу
          result :=  UnZip.FileName;
        end;
      end
      else
      begin
        SL.LoadFromFile(UnZip.FileName); // завантаження файлу
        DeleteFile(     UnZip.FileName); // видалення файлу
        result :=       UnZip.FileName;
      end;
    finally
      RemoveDir(GetMainDir +'AZSDir');
      UnZip.Free;
    end;
  end
  else
  begin
    SL.LoadFromFile(sFileName);
    result := sFileName;
  end;

  if SL.IndexOf('BEGIN_ALFA_MESSAGE') = -1 then
    raise Exception.Create('Не найдено начало пакета!');

  if SL.IndexOf('END_ALFA_MESSAGE:') = -1 then
    raise Exception.Create('Не найдено окончание пакета!');
end;
//==============================================================================
procedure TSRepForm.actNalExecute(Sender: TObject);
begin
  if nb.ActivePage <> 'Rashod' then exit;
  dbgRashod.SelectedIndex := 7; // Table2NAL
end;
//==============================================================================
procedure TSRepForm.actVedExecute(Sender: TObject);
begin
  if nb.ActivePage <> 'Rashod' then exit;
  dbgRashod.SelectedIndex := 9; // Table2VED
  dbgRashodEditButtonClick(nil);
end;
//==============================================================================
procedure TSRepForm.actOtherExecute(Sender: TObject);
begin
  if nb.ActivePage <> 'Rashod' then exit;
  dbgRashod.SelectedIndex := 12; // Table2Other
  dbgRashodEditButtonClick(nil);
end;
//==============================================================================
procedure TSRepForm.dbgRashodMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if nb.ActivePage <> 'Rashod' then exit;
  case dbgRashod.SelectedIndex of
    7:   dbgRashod.Hint := '(Ctrl+N)'; // Table2NAL
    9:   dbgRashod.Hint := '(Ctrl+V)'; // Table2VED
    12:  dbgRashod.Hint := '(Ctrl+P)'; // Table2Other
    else dbgRashod.Hint := '(Enter)';
  end;
end;
//==============================================================================
procedure TSRepForm.actRashExecute(Sender: TObject);
begin
  Table2.DisableControls;
  try
    if (nb.ActivePage = 'Prihod') and bbRealization.Enabled then
      GetRashod(); // реалізація
    if (nb.ActivePage = 'Money') and bbRashPrev.Enabled then
      GetRashodPrev(); // назад до реалізації
  finally
    Table2.EnableControls;
    IsShowDRD := true; // реалізація вже відображена
    Table2AfterPost(Table2);
  end;
end;
//==============================================================================
procedure TSRepForm.GetLogMes(sMes: string); // лог/повідомлення
begin
  if DR_AUTOLOAD then SRepAutoLoad.SRepAutoLoadLog(sMes)
  else MessageDlg(sMes, mtError, [mbOk], 0);
end;
//==============================================================================
procedure TSRepForm.GetLogExc(sMes: string); // лог/помилка
begin
  if DR_AUTOLOAD then SRepAutoLoad.SRepAutoLoadLog(sMes)
  else raise Exception.Create(sMes);
end;
//==============================================================================
procedure TSRepForm.GetExcMes(sMes: string); // помилка/повідомлення
begin
  if DR_AUTOLOAD then raise Exception.Create(sMes)
  else MessageDlg(sMes, mtError, [mbOk], 0);
end;
//==============================================================================
procedure TSRepForm.dbgPrihodGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (qPrih.FieldByName('Base_').AsInteger = 0)
    and (abs(MRound(qPrih.FieldByName('Pr_Litr').AsFloat * qPrih.FieldByName('Pr_Ud_weig').AsCurrency, DR_ROUND_COUNT) -
    MRound(qPrih.FieldByName('Pr_Count').AsFloat * 1000, DR_ROUND_COUNT)) > 50) then
    AFont.Color := clRed;

  if (qPrih.FieldByName('Base_').AsInteger = 1)
    and (qPrih.FieldByName('Pr_Litr').AsFloat - qPrih.FieldByName('Pr_Count').AsFloat > 50) then
    AFont.Color := clRed;
end;
//==============================================================================
function TSRepForm.AddRecord(p_NpGrp_Id, p_NpType_Id: integer): boolean; // добавляємо реалізацію
var
  CurrFilter: string;
begin
  result := false;

  if p_NpGrp_Id = 4 then
    p_NpGrp_Id := 5;

  if ((p_NpGrp_Id = 0) and (p_NpType_Id = 0)) or ((p_NpGrp_Id <> 0) and (p_NpType_Id <> 0)) then
  begin
    GetLogMes(TranslateText('Неверно определены параметры добавляемой реализации!'));
    exit;
  end;

  Table2.DisableControls;
  try // Вставка подпартий
    CurrFilter := Table2.Filter;

    // фільтруємо реалізацію
    Table2.Filtered := false;
    if p_NpGrp_Id  <> 0 then Table2.Filter := 'NP_GRP = '    + IntToStr(p_NpGrp_Id);
    if p_NpType_Id <> 0 then Table2.Filter := 'NP_TYPE_ID = '+ IntToStr(p_NpType_Id);
    Table2.Filtered := true;
      
    if not Table2.IsEmpty then // якщо Є запис у цьому змінному звіту
    begin
      result := true;
      exit;
    end;

    qAddRash.Close;
    _OpenQueryPar(qAddRash,
      ['p_azs_id',     dbceAZSName.DataSource.DataSet.FieldByName('AZS_Id').AsInteger,
       'p_Np_Grp_Id',  p_NpGrp_Id,
       'p_Np_Type_Id', p_NpType_Id]);

    if qAddRash.IsEmpty then // якщо НЕМАЄ запису про відпуски цього товару на дану АЗС
    begin
      if p_NpGrp_Id  <> 0 then
        GetLogMes(TranslateText('Товар не отпускался на АЗС! (Группа НП: ') +
          VarToStr(p_NpGrp_Id) +', '+ GetNpGName(p_NpGrp_Id) +')');
      if p_NpType_Id <> 0 then
        GetLogMes(TranslateText('Товар не отпускался на АЗС! (Тип НП: ') +
          VarToStr(p_NpType_Id) +', '+ GetNpName(p_NpType_Id) +')');
      exit;
    end;
    // заносимо реалізацію
    //------------------------------------------------------------------------
    Table2.Append;
    Table2TTN_ID.AsInteger    := qAddRash.FieldByName('TTN_ID').AsInteger;
    Table2TTN_INST.AsInteger  := qAddRash.FieldByName('TTN_INST').AsInteger;
    Table2IsShtuki.AsString   := qAddRash.FieldByName('IsShtuki').AsString;
    Table2TTN_Date.AsDateTime := qAddRash.FieldByName('TTN_Date').AsDateTime;

    Table2Part_name.AsString    := qAddRash.FieldByName('np_name').AsString;
    Table2NPType_Name.AsString  := qAddRash.FieldByName('np_name').AsString;
    Table2SubPart_Name.AsString := qAddRash.FieldByName('np_type_id').AsString;
    Table2NP_TYPE_ID.AsInteger  := qAddRash.FieldByName('np_type_id').AsInteger;

    Table2Us_SubGroup_Id.AsInteger := qAddRash.FieldByName('us_subgroup_id').AsInteger;
    Table2NP_GRP.AsInteger         := qAddRash.FieldByName('np_grp').AsInteger;
    Table2Base.AsInteger           := qAddRash.FieldByName('base_').AsInteger;

    Table2Own_good.AsString        := 'O';
    Table2Goal_Part_Type.AsInteger := 9;

    Table2N_Price.AsFloat := qAddRash.FieldByName('price').AsFloat;
    Table2Ud_weig.AsFloat := qAddRash.FieldByName('ud_weig').AsFloat;
    Table2Litr.AsFloat    := 0;
    Table2CCount.AsFloat  := 0;
    Table2.Post;
    //------------------------------------------------------------------------

    result := true;
  finally
    // відновлюємо фільтри
    Table2.Filter := '';
    Table2.Filtered := false;
    if CurrFilter <> '' then
    begin
      Table2.Filter := CurrFilter;
      Table2.Filtered := true;
    end;
    Table2.EnableControls;
  end;
end;
//==============================================================================
procedure TSRepForm.dbdeRepDateExit(Sender: TObject);
var
  Msg: string;
begin
  if not DateTimeIsCorrect(dbdeRepDate.Text, Msg) then
  begin
    MessageDlg(Msg, mtError, [mbOk], 0);
    dbdeRepDate.SetFocus;
  end;
end;
//==============================================================================
procedure TSRepForm.dbdeRepDateEndExit(Sender: TObject);
var
  Msg: string;
begin
  if not DateTimeIsCorrect(dbdeRepDateEnd.Text, Msg) then
  begin
    MessageDlg(Msg, mtError, [mbOk], 0);
    dbdeRepDateEnd.SetFocus;
  end;
end;
//==============================================================================
procedure TSRepForm.dbdeRepDateEnter(Sender: TObject);
begin
  if dbdeRepDate.Value = null then
    dbdeRepDate.Value := trunc(Now) - 1;
end;
//==============================================================================
procedure TSRepForm.dbdeRepDateEndEnter(Sender: TObject);
begin
  if dbdeRepDateEnd.Value = null then
    dbdeRepDateEnd.Value := trunc(dbdeRepDate.Value) + 1;
end;
//==============================================================================
//=======================BEGIN Логи і секції із пакету==========================
//==============================================================================
procedure TSRepForm.sbLogClick(Sender: TObject);
begin
  sbSections.Down := false;
  pSections.Visible := false;
  Splitter.Visible := false;

  pLog.Visible := sbLog.Down;
  Splitter.Visible := sbLog.Down;
end;
//==============================================================================
procedure TSRepForm.sbSectionsClick(Sender: TObject);
begin
  sbLog.Down := false;
  pLog.Visible := false;
  Splitter.Visible := false;
  
  pSections.Visible := sbSections.Down;
  Splitter.Visible := sbSections.Down;

  if sbSections.Down then
  begin
    qSections.Close;
    qSections.Open;
    qSections.First;
    if qSections.RecordCount < 20 then
      dblcSections.DropDownCount := qSections.RecordCount;
    dblcSections.KeyValue := qSections.FieldByName('section_name').AsString;
  end;
end;
//==============================================================================
procedure TSRepForm.dblcSectionsCloseUp(Sender: TObject);
var
  SL: TStringList;
  i: integer;
begin
  if qSections.IsEmpty then exit;

  qSectionsSQL.Close;
  qSectionsSQL.SQL.Text :=
    'select '+ qSections.FieldByName('table_fields').AsString +
    '  from '+ qSections.FieldByName('table_name').AsString +
    ' where state = ''Y''' +
    '   and rep_id = :rep_id and rep_inst = :rep_inst' +
    ' order by id';
  _OpenQueryPar(qSectionsSQL,
    ['rep_id',   dbeRepNum.DataSource.DataSet.FieldByName('Id').AsInteger,
     'rep_inst', dbeRepNum.DataSource.DataSet.FieldByName('Inst').AsInteger]);

  // ставимо внизу першого поля кількість записів
  if dbgSections.Columns.Count > 0 then
    dbgSections.Columns[0].Footer.ValueType := fvtCount;

  // проставляємо назви полів із секції у табличці
  SL := TStringList.Create;
  try
    SL.CommaText := qSections.FieldByName('section_fields').AsString;
    for i := 0 to dbgSections.Columns.Count-1 do
    begin
      dbgSections.Columns[i].Title.Caption := SL.Strings[i];
      dbgSections.Columns[i].Title.Alignment := taCenter;
      dbgSections.Columns[i].Width := length(SL.Strings[i]) * 10;
    end;
  finally
    SL.Free;
  end;
end;
//==============================================================================
procedure TSRepForm.bbSectionPrintClick(Sender: TObject);
begin
  if not qSections.Active then exit;
  if not qSectionsSQL.Active then exit;

  qSectionsSQL.DisableControls;
  PutGridEhToExcel(dbgSections,
    TranslateText('Сменный отчет за дату/смену ')+ DateToStr(trunc(dbdeRepDate.Value)) +'/'+ dbeSmenaNum.Text +
    TranslateText(' по ')+ dbceAZSName.Text +' ['+ qSections.FieldByName('section_name').AsString +']');
  qSectionsSQL.EnableControls;
end;
//==============================================================================
//=========================END Логи і секції із пакету==========================
//==============================================================================
procedure TSRepForm.Table2AfterPost(DataSet: TDataSet);
var
  iCol: integer;
  vFiltered: boolean;
  vFilter: string;

  //****************************************************************************
  function GetSum(iCol: integer): string;
  var
    i, Precision: integer;
    bKoma: boolean;
    sDisFormat: string;
    fFormat: TFloatFormat;
  begin
    // взнаємо Precision
    sDisFormat := dbgRashod.FieldColumns[dbgRashod.Columns[iCol].FieldName].DisplayFormat;

    if dbgRashod.Columns[iCol].Footers[0].ValueType <> fvtSum then
    begin
      Precision := 0;
      fFormat := ffFixed;
    end
    else
    try
      bKoma := false;
      Precision := 0;

      if sDisFormat[1] = ',' then
        fFormat := ffNumber
      else
        fFormat := ffFixed;

      for i := 1 to length(sDisFormat) do
      begin
        if sDisFormat[i] = '.' then
          bKoma := true;

        if bKoma and (sDisFormat[i] = '0') then
          inc(Precision);
      end;
    except
      Precision := DR_ROUND_COUNT;
    end;

    // взнаємо суму
    result := FloatToStrF(nvl(dbgRashod.Columns[iCol].Footers[0].SumValue, 0),
      fFormat, 15, Precision);
  end;
  //****************************************************************************
begin
  if not IsShowDRD then exit;

  Table2.DisableControls;
  CurBookMark := Table2.GetBookmark;

  vFiltered := Table2.Filtered;
  vFilter   := Table2.Filter;
  try
    // Итоги НП:
    Table2.Filtered := false;
    Table2.Filter   := 'IsShtuki = ''N''';
    Table2.Filtered := true;

    for iCol := 0 to dbgRashod.Columns.Count-1 do
      if dbgRashod.Columns[iCol].Footers.Count >= 2 then
        if dbgRashod.Columns[iCol].Footers[0].SumValue <> null then
        begin
          dbgRashod.Columns[iCol].Footers[1].ValueType := fvtStaticText;
          dbgRashod.Columns[iCol].Footers[1].Value     := GetSum(iCol);
        end;

    // Итоги соп.товаров:
    Table2.Filtered := false;
    Table2.Filter   := 'IsShtuki = ''Y''';
    Table2.Filtered := true;

    for iCol := 0 to dbgRashod.Columns.Count-1 do
      if dbgRashod.Columns[iCol].Footers.Count >= 3 then
        if dbgRashod.Columns[iCol].Footers[0].SumValue <> null then
        begin
          dbgRashod.Columns[iCol].Footers[2].ValueType := fvtStaticText;
          dbgRashod.Columns[iCol].Footers[2].Value     := GetSum(iCol);
        end;
  finally
    Table2.Filter   := vFilter;
    Table2.Filtered := vFiltered;

    if Table2.BookmarkValid(CurBookMark) then
      Table2.GotoBookmark(CurBookMark);
    Table2.FreeBookMark(CurBookMark);

    Table2.EnableControls;
  end;
end;
//==============================================================================
procedure TSRepForm.miOnlyRashClick(Sender: TObject);
begin
  miOnlyRash.Checked := not miOnlyRash.Checked;
  Table2.Filter   := '';
  Table2.Filtered := miOnlyRash.Checked;
end;
//==============================================================================
initialization
  Cod := Chr(86)+Chr(70)+Chr(82)+Chr(70)+Chr(82)+Chr(70);
//==============================================================================

end.
