{*
* 09.01.2004
*
* Формирование и печать налоговых накладных
*
}

unit TaxBillPrint;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComObj,ComCtrls,ActiveX,Excel8TLB, Db, DBTables, MemTable, MoneyFunc, UDBFunc,
  OilStd, Progr, MemDS, DBAccess, Ora,DBGridEh,uOilQuery,uOilStoredProc
  {$IFDEF VER150},Variants{$ENDIF}, TaxBillPrintForm;

const
  {Константы NAL_T в OIL_SALE_BOOK}
  TB_MOVE_INST = 701;

  DOC_DIR = 'НН для послеоплаты';
  eDogNotFound = 'Договор с выбранным клиентом не существует';
  eIdInst = 'Не заданы параметры для получения реквизитов покупателя/продавца';
  eGetReservedParams = 'Ошибка при получении параметров зарезервированной налоговой накладной';
  eNotFoundNNIdInst = 'Не заданы параметры для получения зарезервированной налоговой накладной';
  eTaxBillType = 'Задан не существующий тип налоговой накладной';
  eAddPosition = 'Ошибка формирования строки налоговой/корректировочной накладной.';
  eFillSheet = 'Ошибка формированя налоговой накладной.';
  eFillCorrSheet = 'Ошибка формированя корректировочной налоговой накладной.';
  eSaleBookIsEmpty = 'За выбранный период нет налоговых накладных для печати.'+#13#10+
                     'Проверьте были ли они сформированы';
  eTaxBillEmptyData = 'Не заполнены позиции налоговой накладной';
  eManyReservedTaxBills = 'Обнаружено более чем одна резервная НН в этот день';
  eMakeReservedTaxBill = 'Ошибка при резервировании налоговой накладной';
  eOrgId = 'Недопустимое значение TtbOptions.SetOrgId';
  eOrgInst = 'Недопустимое значение TtbOptions.SetOrgInst';
  eNotDataFound = 'Нет данных для налоговой накладной';
  // Порядок имен должнен соответствовать порядку в типах
  capTovarType: array[0..4] of string = ('Петрол','Група НП','Тип НП','Операции','Другой');
  capScheme: array[0..5] of string = ('Лимитная схема', 'Эл. карты', 'Талоны', 'Услуги', 'Мелкий опт', 'Чеки');
  capCalcOrientation: array[0..4] of string = ('От суммы с НДС', 'От суммы без НДС', 'По каждой строке', 'По каждой строке-2', 'По результируемому НДС');
  // типы налоговых, в которых нет клиента
  arDocNot2Client: set of byte=[10,22];
type
  TCheckType = (
    ctTaxBillByPay, //проверка параметров перед формированием НН по оплате
    ctCreateSBRecord,      //проверка  параметров Fперед записью в Sale Book
    ctPutToExcel      //проверка  параметров перед выводом на экран
  );

// При вводе нового типа ввести название в константы
type TTovarType = (
    ttPetrol,    // прописан ID петрола (карточки)
    ttNpGroup,   // прописан код группы НП (талоны)
    ttNpType,    // прописан код типа НП (все остальное)
    ttOper,      // прописан код операции (услуги)
    ttOther
  );
// При вводе нового типа ввести название в константы
type TScheme = (
    LS,  //лимитная схема
    EK,  // электроные карты
    Talon,  //талоны
    Service,  //услуги
    NB,//мелкий опт
    Check  //чеки
  );
// При вводе нового типа ввести название в константы
type TCalcOrientation = (
    coSumWithNds,//От суммы с НДС
    coSumWithoutNds,//От суммы без НДС
    coSumByRow, //По каждой строке
    coSumByRow2,//По каждой строке - 2
    coNDSResult//По результируемому НДС
  );

type TPrintSettings = record
  AlwaysAsk,
  UseDefault,
  OrigOnly,
  CopyOnly,
  EmptyCells,
  OrigAndCopy,
  IsNeedPrint : Boolean;
  NumOfCopy : integer;
  PathForSave : string;
end;

type TPattern=(tpNN,tpCorr);

///////////////////////// ///////////////////////////////////////////////////////
////////////////// MS Excel CLASS  /////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
type TMSExcel = class
  private
    IsSaved : Boolean;
    IsFreeOle : Boolean;
    procedure FreeExcel;
  public
    (**
    Конструктор берет указаный шаблон из pattern'а
    *)
    constructor Create(FileName : String); overload;
    (**
    Конструктор передает не стандартный шаблон для документа
    *)
    constructor Create(AXLApp,AList: Variant); overload;
    (**
    Конструктор передает не стандартный шаблон для документа
    и копирует шаблон из TaxBill.xls в передаваемый шаблон
    *)
    constructor Create(AXLApp, AList: Variant; ADate: TDateTime;
      APattern: TPattern);overload;
    procedure Show();
    procedure SaveAs(FileName : String);
    function GetDirName(p_Path, p_DirName, p_Period :String; p_OrgId, p_OrgInst : Integer) : String;
    destructor Destroy(); override;
end;

////////////////////////////////////////////////////////////////////////////////
////////////////// Progress bar CLASS  /////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

type TProgressBar = class(TProgrForm)
  public
    constructor Create(Owner:TComponent);  override;
    procedure SetMaxValue(Value : Integer);
    procedure Step();
end;
type TOutput = (toDisk, toScreen, toPrinter);

////////////////////////////////////////////////////////////////////////////////
////////////////// Tax Bill Options CLASS  /////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
type
  TtbOptions = class
  private
    _OrgId, _OrgInst : Integer;
    _FromId, _FromInst: integer;
    _FromAzsId,_FromAzsInst :Integer;    
    FByDogName, FOperName: string;
    FDebugPrint:boolean;
    function GetOrgId() : Integer;
    function GetOrgInst() : Integer;
    procedure SetOrgId(Value:Integer);
    procedure SetOrgInst(Value:Integer);
    function GetByDogName():string;
    function GetOperName():string;
    procedure ClearParams();
    procedure ValidateParams(CheckType : TCheckType);     //проверка параметров
    // Перевод на правильный язык строки
    function TranslateString(Value: string): string;
    procedure AssignSettings();
    procedure AssignSettingsCause(ACause:Integer=0);//Согласно настроек источника делаем настройки TaxBill
    function GetNumberFormat(ADecimalNumb:integer):string;
    function IsDoc2Client:boolean;
    function GetDebugPrint:boolean;
  public
    Date : String;          //дата налоговой накладной
    Num : String;           //номер налоговой накладной
    CorrNum : String;       //номер корректировки
    CorrDate : String;      //дата корректировочной НН
    TaxBillId : Integer;    //Id налоговой накладной
    TaxBillInst : Integer;  //Inst налоговой накладной
    TaxBillId_Link : Integer;    //nn_Id налоговой накладной
    TaxBillInst_Link : Integer;  //nn_Inst налоговой накладной
    TaxBillType : Integer;  //внутрений тип налоговой накладной
    OIL_NN_Type : Integer; //тип налоговой накладной [OIL_NN_TYPE]
    OIL_NN_Cause : Integer; //причина налоговой накладной [OIL_NN_CAUSE]

    PayNum : String;        //Номер оплаты
    Locked : (Lock,UnLock); //флаг для возможности редактирования
    Output : TOutput;
    Scheme : TScheme;
    TovarType: TTovarType;  //тип товара

    DogId, DogInst : Integer;
    NDSCalcOrientation : TCalcOrientation; // тип перещета сумы
    IsCustomPrintSettings : boolean;
    PrintSettings : TPrintSettings;
    NDSResult:real;
    DecimalCount,DecimalPrice:integer;
    constructor Create;
    property ToId : Integer read GetOrgId write SetOrgId;
    property ToInst : Integer read GetOrgInst  write SetOrgInst;
    property FromId: integer read _FromId write _FromId;
    property FromInst: integer read _FromInst write _FromInst;
    property FromAzsId: integer read _FromAzsId write _FromAzsId;
    property FromAzsInst: integer read _FromAzsInst write _FromAzsInst;
    //Согласно чего выписана налоговая накладная oil_sale_book.f_doc
    property ByDogName:string read GetByDogName write FByDogName;
    // тип оплаты oil_sale_book.frasch
    property OperName:string read GetOperName write FOperName;
    property DebugPrint:boolean read GetDebugPrint write FDebugPrint;
    procedure LoadPrintForm(ATaxBillPrintForm : TfrmTaxBillPrintForm);
end;
////////////////////////////////////////////////////////////////////////////////
/////////////////////// Tax bill CLASS /////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
type
  ETBTestDog=class(Exception);
  ETBTestDogSum=class(ETBTestDog);

type
  TdmTaxBill = class(TDataModule)
    // TaxBillData
    mtTaxBillData: TMemoryTable;
    mtTaxBillDimName: TStringField;
    mtTaxBillLitr: TFloatField;
    mtTaxBillPriceNoNds: TFloatField;
    mtTaxBillSumNoNds: TFloatField;
    mtTaxBillSumNds: TFloatField;
    mtTaxBillPriceNds: TFloatField;
    mtTaxBillNds: TFloatField;
    mtTaxBillShipDate: TStringField;
    mtTaxBillNpName: TStringField;
    mtTaxBillNpgId: TFloatField;
    mtTaxBillText: TStringField;
    qReport: TOilQuery;
    qSaleBook: TOilQuery;
    qTemp: TOilQuery;
    mtTaxBillDimId: TFloatField;
    qReportByDog: TOilQuery;
    qDog: TOilQuery;
    qNN: TOilQuery;
    qTestByDog: TOilQuery;
    procedure DataModuleDestroy(Sender: TObject);
  private
    NNCreated : Boolean;
    procedure OpenMemoryTable;
    procedure CloseMemoryTable;
    //создать запись в OIL_SALE_BOOK
    procedure CreateSaleBookRecord;
    //создать запись в OIL_SALE_BOOK_DET
    procedure CreateSaleBookDetRecord;
    //получить реквизиты организации
    procedure GetOrgProperties();
    //получить реквизиты зарезерв. НН
    function GetTaxBillNumById(tbID,tbInst:Integer) : String;
    //получить папку для записи документов
    function GetDirName : String;
    //заполнить лист НН экселя данными
    procedure FillSheet();
    //заполнить лист корр. НН данными
    procedure FillCorrSheet();
    //получить параметры зарезервированной НН
    procedure GetReservedTaxBillParams(tbDate:String);
    //получить параметры НН для печати корректировки
    {procedure GetParentCorr();}
    function GetCounterName():string;
    function GetPositionCount: integer;
  public
    Options : TtbOptions;
    Excel :TMSExcel;
    constructor Create; overload;
    constructor Create(OrgId,OrgInst:Integer; FromId: integer = 0; FromInst: integer = 0); overload;
    procedure EmptyMtValues;
    //вывести в эксель
    procedure PutToExcel(flClearData : Boolean = True);
    //записать в БД данные НН
    procedure Make(flClearData:Boolean = True);
    //вызов формы редактирования и запись с формы позиций
    Function Edit(Auto:Boolean = True;money:double =0) : double;
    //запуск формы настроев налоговых
    procedure EditCause();
   //добавить позицию в НН
    procedure AddPositionFull(
          NpId        : Integer;
          NpName      : string;
          DimID       : Integer;
          DimName     : string;
          ShipDate    : String;
          Litr        : Double;
          PriceNds    : Double;
          SumNds      : Double;
          SumNoNds    : Double;
          Det_Text    : String;
          Orient      : TCalcOrientation
       );
    procedure AddPosition(
          NpId        : Integer;
          DimID       : Integer;
          ShipDate    : String;
          Litr        : Double;
          PriceNds    : Double;
          Det_Text    : String = ''
       );overload;

    procedure AddPosition(
          NpName      : String;
          DimName     : String;
          ShipDate    : String;
          Litr        : Double;
          PriceNds    : Double;
          Det_Text    : String = ''
       );overload;

    procedure AddPosition(
          NpId        : Integer;
          DimID       : Integer;
          ShipDate    : String;
          Litr        : Double;
          PriceNds    : Double;
          SumNds      : Double;
          SumNoNds    : Double = 0
    ); overload;

    procedure AddPosition(
          NpName      : String;
          DimName     : String;
          ShipDate    : String;
          Litr        : Double;
          PriceNds    : Double;
          SumNds      : Double;
          SumNoNds    : Double = 0
    ); overload;

    procedure AddPositionWithoutNds(NpName, DimName, ShipDate: String;
      Litr, PriceNoNds: Double; SumNoNds : Double = 0);

    //зарезервировать налоговую накладную
    procedure MakeReserved();
    //Удаляет записи НН по клиенту;
    procedure DeleteSBRecords(FromDate,ToDate:TDateTime); overload; //ByDate
    procedure DeleteSBRecords(NN_ID,NN_INST:Integer;NAL_T:Integer); overload;//ByID
    procedure DeleteSBRecords(FromDate:TDateTime; TaxBillType:String); overload;//ByType

    procedure DeleteSBRecords10(NN_ID,NN_INST:Integer; p_cause_id :integer = -1); overload;//ByID
    procedure DeleteSBRecordsCorr(NN_ID, NN_INST: integer); //CorrById
    procedure DeleteSBRecordsDet(NN_ID,NN_INST:Integer;Nal_T:Integer=0); //ByIdNN and Nal_T удаляет детализацию
    // Функция получает следующий номер НН
    function GetNextNumber(NNDate: TDateTime;p_cause_id:integer = -1;p_type_id:integer = -1): string;
    function isAllowMake(FromDate,ToDate:TDateTime; Nal_t:Integer) : Boolean;
    //печать НН по ней же, но пока только на не полную стоимость и id,inst договора беруться из Oil_money
    procedure GetTaxBillByNN(ANNId,ANNInst:integer);
    class procedure Print(AId,AInst:integer);
    // Проверить на
    procedure TestByDog(var APossibleSum:Currency);

    property PositionCount: integer read GetPositionCount;
  end;
  //печать НН по договору
  procedure GetTaxBillByDog(ATaxBillNum,ATaxBillDate :string;ADogId,ADogInst:integer;AOperName:string);
  // Резервирует номер определенного типа
  procedure DoReservNum(p_NNDate:TDateTime;p_cause_id:integer=-1);
  // Выдает дату документа
  function GetDateTax(ANNid,ANNinst:integer):TDateTime;
  // Проверяет имеет ли документ детализацию
  function IsTBHaveDetal(ANNid,ANNinst:integer):boolean;

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

var
  KorrBounds: array [1..16] of string = ('A','C','G','N','Q','T','W','Z','AC','AF','AI','AL','AP','AT','AX','BB');
implementation

uses ExFunc, Main, uStart, Excel_TLB, SelNNNum, TaxBillEditDet,ExcelFunc,TaxBillCause;

{$R *.DFM}

////////////////////////////////////////////////////////////////////////////////
////////////////// Static members //////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

(**
  Функция выдает позицию @Adate в строке дат oil_var->nn_date_change
 *)
function GetDateChangePos(Adate:TDateTime):integer;
var
  str,strdate:string;
  day,month,year:word;
begin
  try
    result:=0;year:=1990;month:=1;day:=1;
    str:=GetSqlValue('select nvl(ov.GetVal(''NN_DATE_CHANGE''),''01.01.1990;29.07.2005;'') from dual');
    while (Length(str)>7)and(EncodeDate(year,month,day)<Adate) do
    begin
      strdate:=copy(str,1,pos(';',str));//берем первую дату
      str:=copy(str,pos(';',str)+1,length(str));//отрезаем первую дату
      day:=StrToInt(copy(strdate,1,2));//из даты берем день
      month:=StrToInt(copy(strdate,4,2));//месяц
      year:=StrToInt(copy(strdate,7,4));//год
      if EncodeDate(year,month,day)<=Adate then
        inc(result);//сдвигаем позицию
    end;
    if result = 0 then result := 1;
  except
    ShowMessage(TranslateText('GetDateChangePos дало сбой '));
    result:=1;
  end;
end;

function GetNpNameById(NpId:Integer; TovarType: TTovarType):string;
begin
  case TovarType of
    ttPetrol : result:=VarToStr(GetSQLValue('Select fullname from v_oil_np_group where petrol_id='+IntToStr(NpId)));
    ttNpGroup: result:=VarToStr(GetQValueByIdInst('fullname','v_oil_np_group',NpId));
    ttNpType : result:=VarToStr(GetSQLValue('Select name from v_oil_np_type where id='+IntToStr(NpId)));
    ttOper   : result:=VarToStr(GetSQLValue('Select name from v_oil_oper_type where state=''Y'' and id='+IntToStr(NpId)));
  end;
end;

function GetDimNameById(DimId:Integer):string;
begin
  result := VarToStr(GetSQLValue('Select name from v_oil_dimension where state=''Y'' and id='+IntToStr(DimId)) )
end;

function GetTBNumByID(tbId, tbInst:integer):string;
begin
  result := VarToStr(GetSQLValue('select num from oil_sale_book where state=''Y'' and id = '+IntToStr(tbId)+' and inst = '+IntToStr(tbInst)));
end;

function IsTBHaveDetal(ANNid,ANNinst:integer):boolean;
var i:integer;
begin
  i:=  GetSQLValue('Select count(*) from oil_sale_book_det where '+
         ' state= ''Y'' and nn_id='+IntToStr(ANNid)+' and nn_inst='+IntToStr(ANNinst));
  result := 0 < i;
end;

function GetDateTax(ANNid,ANNinst:integer):TDateTime;
begin
  try
    result:=GetSQLValue(format('select s_date from oil_sale_book where state=''Y'' and id=%d and inst=%d ',[ANNid,ANNinst]));
  except on e:exception do
    Raise Exception.Create(TranslateText('GetDateTax : ошибка взятия даты документа. ')+e.Message);
  end;
end;

//печать налоговой накладной согласно указанного договора
procedure GetTaxBillByDog(ATaxBillNum,ATaxBillDate :string;ADogId,ADogInst:integer;AOperName:string);
var
  TaxBill : TdmTaxBill;
  ProgressBar : TProgressBar;
  qDog : TOilQuery;
begin
  TaxBill := TdmTaxBill.Create(1,1);
  ProgressBar := TProgressBar.Create(nil);
  qDog := TOilQuery.Create(nil);
  qDog.SQL.Text := TaxBill.qDog.SQL.Text;
  try
    if qDog.Active then qDog.Close;
    qDog.ParamByName('dog_id').asInteger := ADogId;
    qDog.ParamByName('dog_inst').asInteger := ADogInst;
    qDog.Open;
    ProgressBar.SetMaxValue(qDog.RecordCount);
    //установить параметры печати НН
    TaxBill.Options.ToId :=  qDog.FieldByName('to_').asInteger;
    TaxBill.Options.ToInst := qDog.FieldByName('to_inst').asInteger;
    //если договор по карточкам, то печатать первый по киленту
    //если нет, то текущий договор

    case qDog.FieldByName('dog_type').asString[1] of
      'K' : TaxBill.Options.Scheme := EK;
      'S' : TaxBill.Options.Scheme := Service;
      'Y' : TaxBill.Options.Scheme := Talon;
      'N' : TaxBill.Options.Scheme := NB;
    end;

    TaxBill.Options.DogId := ADogId;
    TaxBill.Options.DogInst := ADogInst;

    with TaxBill do
    begin
      Options.Date := ATaxBillDate;
      Options.Num := ATaxBillNum;
      Options.OperName :=   AOperName;
      Options.TovarType := ttNpType;
    end;
    //достать данные из договора
    while not qDog.Eof do
    begin
      //заполнить позиции
      if (qDog.FieldByName('dog_type').asString = 'S') or
         (qDog.FieldByName('dog_type').asString = 'N')
      then
        TaxBill.AddPositionWithoutNds(
          qDog.FieldByName('np_name').asString,
          qDog.FieldByName('dim_name').asString,
          ATaxBillDate,
          qDog.FieldByName('Count_').asFloat,
          qDog.FieldByName('price').asFloat,
          qDog.FieldByName('SumXNds').asFloat
        )
      else
        TaxBill.AddPosition(
          qDog.FieldByName('np_type').asInteger,
          qDog.FieldByName('dim_id').asInteger,
          ATaxBillDate,
          qDog.FieldByName('Count_').asFloat,
          qDog.FieldByName('price2').asFloat
        );
      qDog.Next;
    end;
    //вывести ее на экран
     TaxBill.PutToExcel();
  finally
    TaxBill.Free;
    ProgressBar.Free;
    qDog.Free;
  end;
end;

{ TdmTaxBill }

procedure TdmTaxBill.GetTaxBillByNN(ANNId,ANNInst:integer);
var
  ProgressBar : TProgressBar;
begin
  ProgressBar := TProgressBar.Create(nil);
  try
    if qNN.Active then qNN.Close;
    _OpenQueryParOra(
      qNN,
      ['nn_id',  ANNId,
       'nn_inst',ANNInst]
      );
    if (qNN.RecordCount = 0 ) then
      raise Exception.Create(eNotDataFound);
    ProgressBar.SetMaxValue(qNN.RecordCount);
    //установить параметры печати НН
    Options.Oil_nn_cause := qNN.FieldByName('nn_cause_id').AsInteger;
    Options.Oil_nn_type := qNN.FieldByName('nn_type_id').AsInteger;
    if Options.IsDoc2Client then
    begin
      Options.ToId := qNN.FieldByName('organ').AsInteger;
      Options.ToInst := qNN.FieldByName('organ_inst').AsInteger;
    end;
    Options.FromId := qNN.FieldByName('from_').AsInteger;
    Options.FromInst := qNN.FieldByName('from_inst').AsInteger;
    //если договор по карточкам, то печатать первый по киленту
    //если нет, то текущий договор
    if(qNN.FieldByName('nal_t').AsInteger <> 14)and(Options.Oil_nn_cause <> 14)then
      Options.ByDogName := qNN.FieldByName('f_doc').AsString;
    Options.FromId := qNN.FieldByName('From_').AsInteger;
    Options.FromInst :=qNN.FieldByName('From_Inst').AsInteger;
    Options.OperName := qNN.FieldByName('frasch').AsString;
    Options.AssignSettingsCause();
    Options.TaxBillType := qNN.FieldByName('nal_t').AsInteger;
    if qNN.FieldByName('nal_t').AsInteger = 8 then
    begin
      Options.CorrDate := qNN.FieldByName('s_date').AsString;
      Options.CorrNum := qNN.FieldByName('num').AsString;
      Options.Date := GetSqlValue(format('select s_date from oil_sale_book where id =%d and inst = %d',
        [qNN.FieldByName('NN_ID').AsInteger,
         qNN.FieldByName('NN_INST').AsInteger]));
      Options.Num := GetSqlValue(format('select num from oil_sale_book where id =%d and inst = %d',
        [qNN.FieldByName('NN_ID').AsInteger,
         qNN.FieldByName('NN_INST').AsInteger]));      
    end
    else
    begin
      Options.Date := qNN.FieldByName('s_date').AsString;
      Options.Num := qNN.FieldByName('num').AsString;
    end;
    Options.AssignSettingsCause();
    while not qNN.Eof do
    begin
      if Options.TovarType = ttOther then
        AddPosition(
          qNN.FieldByName('tov_name').AsString,
          qNN.FieldByName('dim_name').AsString,
          qNN.FieldByName('det_date').AsString,
          qNN.FieldByName('count_').AsFloat,
          qNN.FieldByName('price_nds').AsFloat,
          qNN.FieldByName('nds_t').AsFloat,
          qNN.FieldByName('nds_p_base').AsFloat)
      else if qNN.FieldByName('nal_t').AsInteger = 8 then
        //заполнить позиции
        AddPosition(
          GetNpNameById(nvl(qNN['tov_id'],0),Options.TovarType),
          qNN.FieldByName('dim_name').AsString,
          qNN.FieldByName('det_date').AsString,
          qNN.FieldByName('count_').AsFloat,
          qNN.FieldByName('price_nds').AsFloat,
          qNN.FieldByName('det_text').AsString)
      //заполнить позиции
      else
        AddPosition(
          GetNpNameById(nvl(qNN['tov_id'],0),Options.TovarType),
          qNN.FieldByName('dim_name').AsString,
          qNN.FieldByName('det_date').AsString,
          qNN.FieldByName('count_').AsFloat,
          qNN.FieldByName('price_nds').AsFloat,
          qNN.FieldByName('nds_t').AsFloat,
          qNN.FieldByName('nds_p_base').AsFloat);
      qNN.Next;
    end;
    //вывести ее на экран
    PutToExcel();
  finally
    ProgressBar.Free;
  end;
end;

class procedure TdmTaxBill.Print(AId,AInst:integer);
var
  TaxBill:TdmTaxBill;
begin
  TaxBill:=TdmTaxBill.Create;
  try
    TaxBill.GetTaxBillByNN(AId,AInst);
  finally
    TaxBill.Free;
  end;
end;

procedure TdmTaxBill.TestByDog(var APossibleSum:Currency);
var
  slGoods:TStringList;
  i:integer;
  SumNDS:Currency;
  SumCount:Real;
begin
  if(Options.DogId=0)or(Options.DogId=0)then
    raise Exception.Create(TranslateText('TdmTaxBill.TestByDog: Не определен договор!'));
  slGoods:=TStringList.Create;
  try
    qTestByDog.Close;
    _OpenQueryPar(qTestByDog,
      ['dog_id',Options.DogId,
       'dog_inst',Options.DogInst,
       'nn_id',Options.TaxBillId,
       'nn_inst',Options.TaxBillInst]);
    // Берем список товаров в НН
    mtTaxBillData.First;
    while not mtTaxBillData.Eof do
    begin
      if mtTaxBillNpgId.IsNull then
        raise Exception.Create(TranslateText('TdmTaxBill.TestByDog: Не определены коды продуктов!'));
      if slGoods.IndexOf(mtTaxBillNpgId.AsString)=-1 then
        slGoods.Add(mtTaxBillNpgId.AsString);
      mtTaxBillData.Next;
    end;
    for i:=0 to slGoods.Count-1 do
    begin
      qTestByDog.Filtered:=False;
      qTestByDog.Filter:=' np_type='+slGoods[i];
      qTestByDog.Filtered:=True;
      if qTestByDog.IsEmpty then
        raise ETBTestDog.CreateFmt(TranslateText('%s нет в договоре!'),
          [GetNpNameById(nvl(slGoods[i],0),Options.TovarType)]);
      mtTaxBillData.First;
      SumNDS:=0; SumCount:=0;
      while not mtTaxBillData.Eof do
      begin
        if mtTaxBillNpgId.AsString=slGoods[i] then
        begin
          SumNDS:=SumNDS+mtTaxBillSumNds.AsCurrency;
          SumCount:=SumCount+mtTaxBillLitr.AsFloat;
        end;
        mtTaxBillData.Next;
      end;
      if qTestByDog.FieldByName('dog_sum').AsCurrency<SumNds+qTestByDog.FieldByName('nn_sum').AsCurrency then
      begin
        APossibleSum:=qTestByDog.FieldByName('dog_sum').AsCurrency-qTestByDog.FieldByName('nn_sum').AsCurrency;
        raise ETBTestDogSum.CreateFmt(TranslateText('Сумма по %s в договоре меньше чем по выписаным налоговым накладным'),
          [GetNpNameById(nvl(slGoods[i],0),Options.TovarType)]);
      end;
      {if fround(qTestByDog.FieldByName('dog_count').AsFloat,6)<fround(SumCount+qTestByDog.FieldByName('nn_count').AsFloat,6) then
        raise Exception.CreateFmt(TranslateText('Количество по %s в договоре меньше чем по выписаным налоговым накладным'),
          [GetNpNameById(nvl(slGoods[i],0),Options.TovarType)]);}
    end;
  finally
    slGoods.Free;
  end;
end;

function TdmTaxBill.GetPositionCount: integer;
begin
  Result := mtTaxBillData.RecordCount;
end;
////////////////////////////////////////////////////////////////////////////////
////////////////// MS Excel//// ////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

procedure TMSExcel.FreeExcel();
begin
  MSExcel.DisplayAlerts := true;
  MSExcel.ScreenUpdating := True;
  List := Unassigned;
  MsExcel := Unassigned;
end;

destructor TMSExcel.Destroy();
begin
  if IsFreeOle then FreeExcel;
  inherited Destroy();
end;

constructor TMSExcel.Create(FileName : String);
begin
  ActivateXLApp(FileName,FileName,1,MSExcel,List);
  MSExcel.DisplayAlerts := true;
  List.Activate;
  IsSaved := false;
  IsFreeOle := true;
end;

constructor TMSExcel.Create(AXLApp, AList: Variant);
begin
  MsExcel :=  AXlApp;
  List := AList;
  IsFreeOle := false;
end;

constructor TMSExcel.Create(AXLApp, AList: Variant;ADate:TDateTime;APattern:TPattern);
var
  Unknown:iUnknown;
  vMSExcel,vList :Variant;
  //----------------------------------------------------------------------------------
begin
  MsExcel :=  AXlApp;
  List := AList;
  IsFreeOle := false;
  if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown))
    then vMSExcel := GetActiveOleObject('Excel.Application')
    else vMSExcel := CreateOleObject('Excel.Application');
  vMSExcel.Workbooks.Add(GetMainDir + 'pattern\taxbill.xls');
  vMSExcel.DisplayAlerts := false;
  case APattern of
    tpNN:
    begin
      if (vMSExcel.ActiveWorkbook.WorkSheets.Count < GetDateChangePos(ADate)*2-1) then
      begin
        ShowMessage(TranslateText('Попытка открытия TAXBILL.XLS на листе №')+IntToStr(GetDateChangePos(ADate)*2-1));
        vList := vMSExcel.ActiveWorkbook.WorkSheets[vMSExcel.ActiveWorkbook.WorkSheets.Count];
      end
      else
        vList := vMSExcel.ActiveWorkbook.WorkSheets[GetDateChangePos(ADate)*2-1];
    end;
    tpCorr:
    begin
      if vMSExcel.ActiveWorkbook.WorkSheets.Count < GetDateChangePos(ADate)*2 then
      begin
        ShowMessage(TranslateText('Попытка открытия TAXBILL.XLS на листе №')+IntToStr(GetDateChangePos(ADate)*2));
        vList := vMSExcel.ActiveWorkbook.WorkSheets[vMSExcel.ActiveWorkbook.WorkSheets.Count];
      end
      else
        vList := vMSExcel.ActiveWorkbook.WorkSheets[GetDateChangePos(ADate)*2];
    end;
  end;
  vList.Activate;
  vList.Cells.Select;
  vList.Cells.Copy;
  List.Activate;
  List.Cells.Select;
  List.Paste;
  vList.Activate;
  vList := Unassigned;
  vMSExcel.CutCopyMode := False;
  vMSExcel.ActiveWorkbook.Close;
  vMSExcel := Unassigned;
  List.Activate;
end;

procedure TMSExcel.SaveAs(FileName : String);
begin
  if FileExists(FileName) then DeleteFile(filename);
  MsExcel.ActiveWorkbook.SaveAs(FileName);
  MsExcel.ActiveWorkbook.Close;
  IsSaved := true;
end;

function TMSExcel.GetDirName(p_Path, p_DirName, p_Period :String; p_OrgId, p_OrgInst : Integer) : String;
var  dirname : string;
begin
  dirname:=p_Path+p_DirName;
  if not DirectoryExists(dirname) then CreateDir(dirname);
 // dirname:=dirname+'\'+RemoveSymbols('','".?*''><:;\ ');
  //if not DirectoryExists(dirname) then CreateDir(dirname);
  dirname:=dirname+'\'+RemoveSymbols(copy(GetOrgName(p_OrgId,p_OrgInst),1,50),'".?*''><:;/\');
  if not DirectoryExists(dirname) then CreateDir(dirname);
  dirname:=dirname+'\';
  GetDirName := dirname;
end;

procedure TMSExcel.Show();
begin
  MsExcel.Visible := true;
end;

////////////////////////////////////////////////////////////////////////////////
////////////////// Progress bar ////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
constructor TProgressBar.Create(Owner:TComponent);
begin
  inherited Create(Owner);
  Repaint();
  Repaint();
  Application.ProcessMessages();
end;

procedure TProgressBar.Step();
begin
  AddProgress(1);
  Repaint();
end;

procedure TProgressBar.SetMaxValue(Value : Integer);
begin
  MaxValue := Value;
end;
////////////////////////////////////////////////////////////////////////////////
////////////////// Tax Bill Options  ///////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
constructor TtbOptions.Create;
begin
  Self.ClearParams();
end;

function TtbOptions.GetOrgId :Integer;
begin
  if IsDoc2Client then
    Result := _OrgId
  else
    Result := 0;
end;
function TtbOptions.GetOrgInst :Integer;
begin
  if IsDoc2Client then
    Result := _OrgInst
  else
    Result := 0;
end;
procedure TtbOptions.SetOrgId(Value:Integer);
begin
  if Value <=0 then raise Exception.Create(eOrgId);
  _OrgId := Value;
end;
procedure TtbOptions.SetOrgInst(Value:Integer);
begin
  if Value <=0 then raise Exception.Create(eOrgInst);
  _OrgInst := Value;
end;

procedure TtbOptions.ClearParams();
begin
  Date        := '';
  TaxBillId   := 0;
  TaxBillInst := 0;
  PayNum      :='';
  TaxBillType := 0;
  Num         := '';
  Output      := toScreen;
  ByDogName   := '';
  Scheme  := LS;
  TovarType := ttPetrol;
  OperName := '';
  CorrDate :='';
  DogId := 0;
  DogInst := 0;
  PrintSettings.PathForSave := ExtractFilePath(Application.ExeName)+'\';
  NDSCalcOrientation := coSumWithNds;
  IsCustomPrintSettings := false;
end;
//проверка введенных параметров
procedure TtbOptions.ValidateParams(CheckType:TCheckType);
begin
  case CheckType of
    ctPutToExcel :
    begin

      //Проверка перед выводом налоговой на экран
      if Date = '' then raise Exception.Create(TranslateText('Не указана дата налоговой накладной'));
      if Num = '' then raise Exception.Create(TranslateText('Не задан номер налоговой накладной'));

      //для недолгосрочных договоров для печати нужно указать его id, inst
   {   if Scheme = Talon then
        if((DogId<=0) or (DogInst<=0) or (ByDogName = ''))then
          raise Exception.Create('Не указан договор, согласно которого формируется налоговая накладная');}
    end;
    ctCreateSBRecord :
    begin
      //Проверка перед вставкой записи в Sale Book
      if Date = '' then raise Exception.Create(TranslateText('Не указана дата налоговой накладной'));

      if (TaxBillType = 8)or(OIL_NN_TYPE = 3)then
      begin
        if CorrNum = '' then
          raise Exception.Create(TranslateText('Не задан номер корректировки'))
      end
      else if Num = '' then
        raise Exception.Create(TranslateText('Не задан номер налоговой накладной'));

      if(TaxBillType = 0)and(OIL_NN_TYPE = 0)and(OIL_NN_CAUSE = 0) then raise Exception.Create(TranslateText('Не указан тип налоговой накладной'));
      if ByDogName = '' then raise Exception.Create(TranslateText('Не указано согласно какого договора налоговая накладная'));
    end;
    ctTaxBillByPay :
    begin
      //Проверка введенных параметров перед формированием НН по оплате
      if TaxBillId <= 0 then raise Exception.Create(TranslateText('Не указан ID зарезервированной НН'));
      if TaxBillInst <= 0 then raise Exception.Create(TranslateText('Не указан INST зарезервированной НН'));
      if PayNum = '' then raise Exception.Create(TranslateText('Не указан номер оплаты'));
    end;
  end; //case
end;

procedure TtbOptions.LoadPrintForm(ATaxBillPrintForm : TfrmTaxBillPrintForm);
begin
  with ATaxBillPrintForm do
  begin
    Self.PrintSettings.IsNeedPrint := FormStorage.StoredValues[0].Value = 1;
    case FormStorage.StoredValues[0].Value of
      0 : Self.Output := toScreen;
      1 : Self.Output := toPrinter;
      2 : Self.Output := toDisk;
    end;
    Self.PrintSettings.PathForSave := deSaveTo.Text;
    Self.PrintSettings.NumOfCopy := edNumOfCopy.AsInteger;
    Self.PrintSettings.AlwaysAsk  := rbAlwaysAsk.Checked;
    Self.PrintSettings.UseDefault := rbUseDefault.Checked;
    Self.PrintSettings.OrigOnly := rbOrigOnly.Checked;
    Self.PrintSettings.CopyOnly := rbCopyOnly.Checked;
    Self.PrintSettings.EmptyCells := rbEmpty.Checked;
    Self.PrintSettings.OrigAndCopy := rbAll.Checked;
  end;
end;

procedure TtbOptions.AssignSettings;
var
  TaxBillPrintForm : TfrmTaxBillPrintForm;
begin
  AssignSettingsCause();
  if IsCustomPrintSettings then
    exit;
  TaxBillPrintForm := TfrmTaxBillPrintForm.Create();
  try
    LoadPrintForm(TaxBillPrintForm);
  finally
    TaxBillPrintForm.Free;
  end;
end;

procedure TtbOptions.AssignSettingsCause(ACause:integer=0);
var
  qCause: TOilQuery;
begin
  if ACause<>0 then self.OIL_NN_Cause := ACause;
  if self.OIL_NN_Cause = 0 then self.OIL_NN_Cause := 111;
  qCause:=TOilQuery.Create(nil);
  try
    qCause.Sql.Add('select * from oil_nn_cause where id =:id');
    _OpenQueryParOra(qCause,
      ['id',Self.Oil_nn_cause]);
    if qCause.IsEmpty then
      ShowMessage(TranslateText('Не найден источник налоговой номер ')+IntToStr(Self.Oil_nn_cause))
    else
    begin
      self.Scheme  := TScheme(qCause.FieldByName('Scheme').AsInteger);
      self.TovarType := TTovarType(qCause.FieldByName('Tovar_Type').AsInteger);
      self.NDSCalcOrientation := TCalcOrientation(qCause.FieldByName('NDS_Calc_Orientation').AsInteger);
      self.DecimalCount:=qCause.FieldByName('Decimal_Count').AsInteger;
      self.DecimalPrice:=qCause.FieldByName('Decimal_Price').AsInteger;
    end;
    qCause.Close;
  finally
    qCause.Free;
  end;
end;

function TtbOptions.GetNumberFormat(ADecimalNumb:integer):string;
var
  i: integer;
  koma:string;
begin
  Result:='0';
  koma:=',';
  for i:=1 to ADecimalNumb do
  begin
    Result:=Result+koma+'0';koma:='';
  end;
end;

function TtbOptions.IsDoc2Client:boolean;
begin
  if Oil_nn_cause in arDocNot2Client then
    Result:=False
  else
    Result:=True;
end;

function TtbOptions.TranslateString(Value: string): string;
var
  slLangValues, SL: TStringList;
  fname: string;
  l_str: string;
  i, Position: integer;
  //****************************************************************************
  function TranslateWord(AStr, AWord, ALangVal: string): string;
  begin
    ALangVal := copy(ALangVal, 1+pos('-', ALangVal), length(ALangVal));
    if pos(' '+trim(AWord)+' ', ' '+trim(AStr)+' ') = 0 then
      Result := AStr
    else
    begin
      if Position <= pos(trim(AWord), AStr) then
      begin
        Result := Copy(AStr, 1, pos(AWord, AStr) - 1) + LangText(ALangVal)
          + Copy(AStr, pos(AWord, AStr) + Length(AWord), Length(AStr));
        Position := Position + length(AWord);
      end;
    end;
  end;
  //****************************************************************************
begin
  Position := 0;
  l_str := Value;
  if LANGUAGE = 0 then
    fname := 'language\ukr.ini'
  else
    fname := 'language\rus.ini';
  slLangValues := TStringList.Create;
  SL := TStringList.Create;
  try
    SL.Clear;
    slLangValues.Clear;
    SL.LoadFromFile(GetMainDir+fname);
    for i := 0 to SL.Count - 1 do
      slLangValues.Add(IntToStr(100000 + Length(Sl.Values[Sl.Names[i]])) + '-' + Sl.Strings[i]);
    slLangValues.Sort;
    for i := slLangValues.Count - 1 downto 0 do
      l_str := TranslateWord(l_str, slLangValues.Values[slLangValues.Names[i]], trim(slLangValues.Names[i]));
  finally
    slLangValues.Free;
  end;
  Result := l_str;
end;
//property ByDogName
function TtbOptions.GetByDogName():string;
begin
  Result:=TranslateString(FByDogName);
end;
//property OperName
function TtbOptions.GetOperName():string;
begin
  Result:=TranslateString(FOperName);
end;

function TtbOptions.GetDebugPrint:boolean;
begin
  result:= (FDebugPrint and debugging)or(SysParamExists('DEBUG_PRINT'))
end;

////////////////////////////////////////////////////////////////////////////////
/////////////////////// Tax bill CLASS /////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
constructor TdmTaxBill.Create;
begin
  inherited Create(Application);
  OpenMemoryTable();
  Options := TtbOptions.Create();
  Options.FromId:=MAIN_ORG.INST;
  Options.FromInst:=MAIN_ORG.INST;
end;

constructor TdmTaxBill.Create(OrgId,OrgInst:Integer; FromId: integer = 0; FromInst: integer = 0);
begin
  inherited Create(Application);
  OpenMemoryTable();
  Options := TtbOptions.Create();
  Options.ToId := OrgId;
  Options.ToInst := OrgInst;
  if FromId<>0 then begin
    Options.FromId:=FromId;
    Options.FromInst:=FromInst;
  end
  else
  begin
    if GENERATION >= 2 then
    begin
      Options.FromId := AVIAS_ID;
      Options.FromInst := AVIAS_INST;
    end
    else
    begin
      Options.FromId := MAIN_ORG.INST;
      Options.FromInst := MAIN_ORG.INST;
    end;
  end;
end;

procedure TdmTaxBill.DataModuleDestroy(Sender: TObject);
begin
  CloseMemoryTable();
  Options.Free;
end;

function TdmTaxBill.isAllowMake(FromDate,ToDate:TDateTime; Nal_t:Integer) : Boolean;
var i:integer;
begin
  i:= GetSQLValue('select count(*) from oil_sale_book where nal_t =  '+IntToStr(Nal_T)
              +' and s_date between '''+DateToStr(FromDate)
              +''' and '''+DateToStr(ToDate)+''' and state = ''Y'''
              +' and organ = '+IntToStr(Options.ToId)+' and organ_inst = '+IntToStr(Options.ToInst)
  );
  Result := i=0;
end;

function TdmTaxBill.GetDirName : String;
var DirName : String;
begin
  DirName:=GetMainDir+'Doc\'+DOC_DIR;
  if not DirectoryExists(DirName) then CreateDir(DirName);
  DirName:=DirName+'\'+RemoveSymbols(GetOrgName(Options.ToId,Options.ToInst),'".?*''><:;');
  if not DirectoryExists(DirName) then CreateDir(DirName);
  DirName:=DirName+'\';
  GetDirName := DirName;
end;

procedure TdmTaxBill.OpenMemoryTable;
begin
  if not mtTaxBillData.Active then  mtTaxBillData.Open;
  mtTaxBillData.First;
end;

procedure TdmTaxBill.CloseMemoryTable;
begin
  if  mtTaxBillData.Active then mtTaxBillData.Close;
end;

procedure TdmTaxBill.EmptyMtValues;
begin
  if mtTaxBillData.Active then mtTaxBillData.Close;
  mtTaxBillData.EmptyTable;
  mtTaxBillData.Open;
end;

procedure TdmTaxBill.GetOrgProperties();
var
  q: TOilQuery;
begin
  if ((Options.ToId <= 0) or (Options.ToInst <= 0))and(Options.IsDoc2Client) then
    Raise Exception.Create(eIdInst);

  if not( (Options.FromId = 0) and(Options.FromInst = 0) ) and ((Options.ByDogName<>'') or (Options.OIL_NN_Cause in [11, 12, 23])) then
  Begin
    q := TOilQuery.Create(nil);
    Try
      qReport.Open;
      qReport.Edit;
      if GetOrgData(q,Options.FromId,Options.FromInst)then
      Begin
        if q['FULL_NAME'] <> null then
          qReport.FieldByName('FROM_NAME').AsVariant := q['FULL_NAME']
        else
          qReport.FieldByName('FROM_NAME').AsVariant := q['NAME'];
        qReport.FieldByName('FROM_').AsVariant := q['ID']  ;
        qReport.FieldByName('FROM_INST').AsVariant := q['INST']  ;
        qReport.FieldByName('FROM_ADDR').AsVariant := q['ADDR']  ;
        qReport.FieldByName('FROM_SVID_NUM').AsVariant := q['SVID_NUM']  ;
        qReport.FieldByName('FROM_NAL_NUM').AsVariant := q['NAL_NUM']  ;
        qReport.FieldByName('FROM_BOSS').AsVariant := q['BOSS']  ;
        qReport.FieldByName('FROM_PHONE').AsVariant := q['PHONE']  ;
        qReport.FieldByName('FROM_RACH_CHET').AsVariant := q['RACH_CHET']  ;
        qReport.FieldByName('FROM_BANK_NAME').AsVariant := q['BANK_NAME']  ;
        qReport.FieldByName('FROM_MFO').AsVariant := q['MFO']  ;
        if GetOrgData(q,q.FieldByName('PAR').AsInteger,q.FieldByName('PAR_INST').AsInteger)then
        Begin
          //реквизиты если стоит галочка  печать реквизиты головоного предприятия
          qReport.FieldByName('UP_FROM_ADDR').AsVariant := q['ADDR'];
          qReport.FieldByName('UP_FROM_PHONE').AsVariant := q['PHONE'];
          qReport.FieldByName('UP_FROM_SVID_NUM').AsVariant := q['SVID_NUM'];
          qReport.FieldByName('UP_FROM_NAL_NUM').AsVariant := q['NAL_NUM'];
          if q['FULL_NAME'] <> null then
            qReport.FieldByName('UP_FROM_NAME').AsVariant := q['FULL_NAME']
          else
            qReport.FieldByName('UP_FROM_NAME').AsVariant := q['NAME'];
        End;
      End;
      if GetOrgData(q,Options.ToId,Options.ToInst)then
      Begin
        qReport.FieldByName('TO_').AsVariant := q['ID']  ;
        qReport.FieldByName('TO_INST').AsVariant := q['INST']  ;
        if q['FULL_NAME'] <> null then
          qReport.FieldByName('TO_NAME').AsVariant := q['FULL_NAME']
        else
          qReport.FieldByName('TO_NAME').AsVariant := q['NAME'];
        qReport.FieldByName('TO_ADDR').AsVariant := q['ADDR']  ;
        qReport.FieldByName('TO_SVID_NUM').AsVariant := q['SVID_NUM']  ;
        qReport.FieldByName('TO_NAL_NUM').AsVariant := q['NAL_NUM']  ;
        qReport.FieldByName('TO_BOSS').AsVariant := q['BOSS']  ;
        qReport.FieldByName('TO_PHONE').AsVariant := q['PHONE']  ;
        qReport.FieldByName('TO_RACH_CHET').AsVariant := q['RACH_CHET']  ;
        qReport.FieldByName('TO_BANK_NAME').AsVariant := q['BANK_NAME']  ;
        qReport.FieldByName('TO_MFO').AsVariant := q['MFO']  ;
      End;
    Finally
      q.Free;
    End;
  End
  Else if Options.IsDoc2Client then
  Begin
    if(Self.Options.Scheme in [Talon, Service, NB])or
      ( (Self.Options.DogId>0) and (Self.Options.DogInst>0) )
    then
      qReport.SQL := qReportByDog.SQL;
    with qReport do
    begin
      Close;
      if (Self.Options.Scheme in [Talon, Service, NB]) or((Self.Options.DogId>0) and (Self.Options.DogInst>0))then
      begin
        ParamByName('DogId').asInteger := Self.Options.DogId;
        ParamByName('DogInst').asInteger := Self.Options.DogInst;
      end
      else if Self.Options.Scheme in [EK,LS] then
      begin
        ParamByName('OrgId').asInteger := Self.Options.ToId;
        ParamByName('OrgInst').asInteger := Self.Options.ToInst;
        if Self.Options.FromId<>MAIN_ORG.INST then
        begin
          ParamByName('FromId').asInteger := Self.Options.FromId;
          ParamByName('FromInst').asInteger := Self.Options.FromInst;
        end;
        if Self.Options.Scheme = LS
          then ParamByName('LS').asInteger := 1
          else ParamByName('LS').asInteger := 0;
      end;
      _OpenQueryOra(qReport);
      if(RecordCount <= 0)then raise Exception.Create(eDogNotFound);
    end;
    if Options.ByDogName = '' then
    Options.ByDogName := LangText('Soglastno_dogovora')+' № '+qReport.FieldByName('Dog').asString+
                         ' '+LangText('Ot')+' '+FormatDateTime2('dd.mm.yyyy', qReport.FieldByName('Dog_Date').AsDateTime);
    Options.FromId := qReport.FieldByName('From_').AsInteger;
    Options.FromInst :=qReport.FieldByName('From_Inst').AsInteger;
  end;
end;

procedure TdmTaxBill.AddPositionFull(
      NpId        : Integer;
      NpName      : string;
      DimID       : Integer;
      DimName     : string;
      ShipDate    : String;
      Litr        : Double;
      PriceNds    : Double;
      SumNds      : Double;
      SumNoNds    : Double;
      Det_Text    : String;
      Orient      : TCalcOrientation
   );
begin
  try
    mtTaxBillData.Insert;
    // если указан DimId, то сохраняем его. Если не указан DimName, вычисляем по DimId
    if DimId<>0 then
      mtTaxBillDimId.asInteger := DimId;
    mtTaxBillDimName.asString := decode([DimName,'',GetDimNameById(DimId)]);
    // если указан NpId, то сохраняем его. Если не указан NpName, вычисляем по NpId
    if NpId<>0 then
      mtTaxBillNpgId.AsInteger := NpId;
    mtTaxBillNpName.AsString := decode([NpName,'',GetNpNameById(NpId, Options.TovarType)]);

    mtTaxBillShipDate.asString := ShipDate;
    mtTaxBillLitr.asFloat := Litr;
    mtTaxBillPriceNds.asFloat :=  PriceNds;
    mtTaxBillPriceNoNds.asFloat := GetNoNDS_WithNDS(mtTaxBillPriceNds.asFloat,StrToDate(Options.Date),4);
    // если SumNDS=0, то подставляем Litr*PriceNds
    mtTaxBillSumNds.asFloat := decode([SumNds,0,FRound(Litr*PriceNds,2)]);
    // если SumNoNds не указана (=0), то вычисляем НДС по Сумме с НДС, иначе вычитаем из полной суммы сумму б/НДС
    if SumNoNds=0 then
      mtTaxBillNds.asFloat := GetNds_WithNds(mtTaxBillSumNds.asFloat,StrToDate(Options.Date))
    else
      mtTaxBillNds.asFloat := mtTaxBillSumNds.asFloat - SumNoNds;
    // аналогично с суммой без НДС
    mtTaxBillSumNoNds.asFloat := decode([SumNoNds,0,GetNoNds_WithNds(mtTaxBillSumNds.asFloat,StrToDate(Options.Date),2)]);
    mtTaxBillText.AsString := Det_Text;
    mtTaxBillData.Post;
    //Options.NDSCalcOrientation := Orient;
  except on E:Exception do
    raise Exception.Create(eAddPosition+#13#10+E.Message);
  end;
end;

procedure TdmTaxBill.AddPosition(
          NpId        : Integer;
          DimID       : Integer;
          ShipDate    : String;
          Litr        : Double;
          PriceNds    : Double;
          Det_Text    : String
);
begin
  AddPositionFull(NpId,'',DimId,'',ShipDate,Litr,PriceNds,0,0,Det_Text,coSumWithNds);
end;

procedure TdmTaxBill.AddPosition(
          NpName      : String;
          DimName     : String;
          ShipDate    : String;
          Litr        : Double;
          PriceNds    : Double;
          Det_Text    : String
);
begin
  AddPositionFull(0,NpName,0,DimName,ShipDate,Litr,PriceNds,0,0,Det_Text,coSumWithNds);
end;
//Для расчета от суммы с НДС c указанием айдишников типа НП и ед. изм
procedure TdmTaxBill.AddPosition(
          NpId        : Integer;
          DimID       : Integer;
          ShipDate    : String;
          Litr        : Double;
          PriceNds    : Double;
          SumNds      : Double;
          SumNoNds    : Double
);
begin
  AddPositionFull(NpId,'',DimId,'',ShipDate,Litr,PriceNds,SumNds,SumNoNds,'',coSumWithNds);
end;

//Для расчета от суммы с НДС c указанием имен типа НП и ед. изм
procedure TdmTaxBill.AddPosition(
          NpName      : String;
          DimName     : String;
          ShipDate    : String;
          Litr        : Double;
          PriceNds    : Double;
          SumNds      : Double;
          SumNoNds    : Double
);
begin
  AddPositionFull(0,NpName,0,DimName,ShipDate,Litr,PriceNds,SumNds,SumNoNds,'',coSumWithNds);
end;

//Для расчета от суммы с НДС c указанием имен типа НП и ед. изм
procedure TdmTaxBill.AddPositionWithoutNds(
          NpName      : String;
          DimName     : String;
          ShipDate    : String;
          Litr        : Double;
          PriceNoNds  : Double;
          SumNoNds    : Double = 0
);
begin
  try
    mtTaxBillData.Insert;
    mtTaxBillDimName.asString := DimName;
    mtTaxBillNpName.AsString := NpName;
    mtTaxBillShipDate.asString := ShipDate;
    mtTaxBillLitr.asFloat := Litr;
    if SumNoNds = 0
      then mtTaxBillSumNoNds.asFloat := Fround(PriceNoNds * Litr,2)
      else mtTaxBillSumNoNds.asFloat := SumNoNds;
    mtTaxBillPriceNoNds.asFloat := FRound(PriceNoNds,2);
    mtTaxBillNds.asFloat := GetNds_NoNds(mtTaxBillSumNoNds.asFloat,StrToDate(Options.Date));
    mtTaxBillSumNds.asFloat := GetWithNds_NoNds(mtTaxBillSumNoNds.asFloat,StrToDate(Options.Date));
    mtTaxBillData.Post;
    Options.NDSCalcOrientation := coSumWithoutNds;
  except on E:Exception do
    raise Exception.Create(eAddPosition+#13#10+E.Message);
  end;
end;

{procedure TdmTaxBill.GetParentCorr();
begin
  try
    if qTemp.Active then qTemp.Close;
    qTemp.SQL.Text :=
        ' select s_date from  Oil_sale_book '+
        ' where num = '''+Copy(Options.Num,3,Length(Options.Num))+''''+
        ' and organ = '+IntToStr(Options.GetToId)+
        ' and organ_inst = '+IntToStr(Options.GetOrgInst)+
        ' and State = ''Y'' ';
    qTemp.Open;
    Options.CorrNum := Options.Num;
    Options.CorrDate := Options.Date;
    Options.Date := qTemp.FieldByName('s_date').asString;
    Options.Num := Copy(Options.Num,3,Length(Options.Num));
  except on E:Exception do
    raise Exception.Create(eGetReservedParams+#13#10+E.Message);
  end;
end;}

procedure TdmTaxBill.PutToExcel(flClearData:Boolean = True);
var
  frmPrint : TfrmTaxBillPrintForm;
begin
    Options.PrintSettings.IsNeedPrint := (Options.Output = toPrinter);
    if not Assigned(Excel) then
      Excel := TMsExcel.Create('TaxBill');
    try
      Options.AssignSettings;
      //Если выбран показ окошка настройки постоянно
      if Options.PrintSettings.AlwaysAsk then
      begin
        frmPrint := TfrmTaxBillPrintForm.Create();
        with frmPrint do
        begin
          pnlTop.Visible := false;
          EnableComponents(True);
          ShowModal;
          Free;
        end;
      end;
      Options.AssignSettings;
      GetOrgProperties();
      if (Options.TaxBillType = 8)or(Options.OIL_NN_Type = 3) then
      begin
        FillCorrSheet();
      end
      else FillSheet();
      case Options.Output of
        toScreen : Excel.Show();
        toDisk :
          begin
            Options.PrintSettings.PathForSave := Excel.GetDirName(Options.PrintSettings.PathForSave,'',TranslateText('Налоговые накладные '),Options.ToId, Options.ToInst);
            Excel.SaveAs(Options.PrintSettings.PathForSave+TranslateText('НН №')+Options.Num+'('+IntToStr(Options.TaxBillType)+').xls');
          end;
      end;
      Excel.Free();
      if flClearData then  EmptyMTValues();
    except on E:Exception do
      begin
        Excel.Free();
        raise Exception.Create(E.Message);
      end;
    end;
end;

procedure TdmTaxBill.FillSheet();
var
  Position,i : integer;
  SumNDS,SNds, Sum: real;
//  Det_date : TDateTime;
  FromAddress, FromName, FromPhone,FromNalNum, ToNalNum, FromSvidNum, //FromCounter,
  ToAddress, ToPhone: string;
  q:TOilQuery;
  vFilNumber: string;
  procedure AddString(NumStr:integer);
  begin
    Main.List.Range['A'+IntToStr(NumStr),'AD'+IntToStr(NumStr)].Insert(xlDown);
    Main.List.Range['C'+IntToStr(NumStr),'E'+IntToStr(NumStr)].Merge(True);
    Main.List.Range['F'+IntToStr(NumStr),'N'+IntToStr(NumStr)].Merge(True);
    Main.List.Range['Q'+IntToStr(NumStr),'R'+IntToStr(NumStr)].Merge(True);
    Main.List.Range['S'+IntToStr(NumStr),'T'+IntToStr(NumStr)].Merge(True);
    Main.List.Range['U'+IntToStr(NumStr),'V'+IntToStr(NumStr)].Merge(True);
    Main.List.Range['W'+IntToStr(NumStr),'X'+IntToStr(NumStr)].Merge(True);
    Main.List.Range['Y'+IntToStr(NumStr),'Z'+IntToStr(NumStr)].Merge(True);
    Main.List.Range['AA'+IntToStr(NumStr),'AC'+IntToStr(NumStr)].Merge(True);
    Main.List.Range['B'+IntToStr(NumStr),'AC'+IntToStr(NumStr)].Borders[xlEdgeBottom].LineStyle:=1;
  end;
begin
  if mtTaxBillData.IsEmpty then raise Exception.Create(eTaxBillEmptyData);
  Options.ValidateParams(ctPutToExcel);
  //реквизиты
  if (NN_WITH_UPPER_REKVIZIT = 'Y') and (Self.Options.FromId=MAIN_ORG.INST) then
  begin
    FromAddress :=  qReport.FieldByName('UP_From_Addr').AsString;
    FromName := qReport.FieldByName('UP_From_Name').AsString;
    FromPhone := qReport.FieldByName('UP_From_Phone').AsString;
    FromNalNum := qReport.FieldByName('UP_From_Nal_Num').AsString;
    FromSvidNum := qReport.FieldByName('UP_From_Svid_Num').AsString;
  end
  else if (NN_WITH_UPPER_REKVIZIT = 'ALFA') and (Self.Options.FromId=MAIN_ORG.INST) then
  begin
    q := TOilQuery.Create(nil);
    if GetOrgData(q,ALFANAFTA,ALFANAFTA) then
    begin
      FromName :=  q['NAME'];
      FromAddress := q['ADDR'];
      FromPhone := q['PHONE'];
      FromSvidNum := q['SVID_NUM'];
      FromNalNum := q['NAL_NUM'];
    end;
    q.Free;
  end
  else
  begin
    FromAddress := qReport.FieldByName('From_Addr').AsString;
    FromPhone := qReport.FieldByName('From_Phone').AsString;
    FromName := qReport.FieldByName('From_Name').AsString;
    FromNalNum := qReport.FieldByName('From_Nal_Num').AsString;
    FromSvidNum := qReport.FieldByName('From_Svid_Num').AsString;
  end;

  // адреса і телефон
  FromPhone := qReport.FieldByName('From_Phone').AsString;
  if PRINT_UPPER_ADRESS = 'NO' then
    FromAddress := qReport.FieldByName('From_Addr').AsString
  else
    if (PRINT_UPPER_ADRESS = 'ALFA') and (Self.Options.FromId = MAIN_ORG.INST) then
    begin
      q := TOilQuery.Create(nil);
      if GetOrgData(q, ALFANAFTA, ALFANAFTA) then
        FromAddress := q['ADDR'] +#10+
          decode([MAIN_ORG.ORG_TYPE, 3, qReport.FieldByName('UP_From_Addr').AsString,
            qReport.FieldByName('From_Addr').AsString]);
      if MAIN_ORG.ORG_TYPE = 3 then
        FromPhone := qReport.FieldByName('UP_From_Phone').AsString;
      q.Free;
    end
    else
      if (PRINT_UPPER_ADRESS = 'YES') and (Self.Options.FromId = MAIN_ORG.INST) then
        FromAddress := qReport.FieldByName('UP_From_Addr').AsString +#10+ qReport.FieldByName('From_Addr').AsString;

  // Адресс клиента-филиала в зависимость от галочки.
  IF Not(Options.IsDoc2Client)then
  begin
    ToAddress:=' ';
    ToPhone:=' ';
  end
  ELSE IF(0<GetSqlValuePar('select count(*) from v_org where id =:to_inst '+
         ' and org_type=4 and par_inst = :par_inst ',
         ['to_inst','par_inst'],
         [ftInteger,ftInteger],
         [qReport.FieldByName('TO_').AsInteger,ALFANAFTA]))
     and (NN_CLIENT_ADRESS = 'ALFA')
  THEN
  begin
    q := TOilQuery.Create(nil);
    if GetOrgData(q,ALFANAFTA,ALFANAFTA) then
    begin
      ToAddress := q['ADDR'];
      ToPhone := q['PHONE'];
    end;
    q.free;
  end
  ELSE
  begin
    ToAddress:=qReport.FieldByName('To_Addr').AsString;
    ToPhone:=qReport.FieldByName('To_Phone').AsString;
  end;
  try with Excel do
  begin
    if IsFreeOle then
    begin
      Main.MsExcel.ActiveWorkbook.WorkSheets[GetDateChangePos(StrToDate(Options.Date))*2-1].Select;
      Main.List:=MsExcel.ActiveWorkbook.WorkSheets[GetDateChangePos(StrToDate(Options.Date))*2-1];
      for i:=1 to MsExcel.ActiveWorkbook.WorkSheets.Count do
        if (i<>GetDateChangePos(StrToDate(Options.Date))*2-1)then
          MsExcel.ActiveWorkbook.WorkSheets[i].Visible:=False;
    end;
    mtTaxBillData.First;
    List.Cells[9,'K']:= Options.Date;
                                  
    //взять из настроек номер филиала чтобы поставить к номеру НН
    if(Options.OIL_NN_Cause=19)and(DBUserExists('OIL_OLD'))then
      vFilNumber:=nvl(GetSqlValue(' select max(value) from oil_old.oil_var where name=''FILIAL_NUMBER'''),'0')
    else
      vFilNumber:=FILIAL_NUMBER;

    if vFilNumber = '0' then
      List.Cells[9,'V']  := Options.Num
    else
      List.Cells[9,'V']  := Options.Num + vFilNumber;
      
    List.Cells[11,'G']:=FromName;
    if not(Options.IsDoc2Client)then
    begin
      if PRINT_TYPE_DAILY_TAX='DETAIL' then
        List.Cells[11,'V']:=VarToStr(GetSqlValue(' select nvl(ov.GetVal(''NN_ORG_NAL_CAPTION''),''Кінцевий покупець'') from dual '))
      else
        List.Cells[11,'V']:=VarToStr(GetSqlValue(' select nvl(ov.GetVal(''NN_ORG_TOTAL_CAPTION''),''Зведена'') from dual '));
      if not(qReport.Active) then
        qReport.Open;
    end
    else
      List.Cells[11,'V']:=qReport.FieldByName('To_Name').AsString;

    ToNalNum := qReport.FieldByName('To_Nal_Num').AsString;

    for i:=1 to 12-length(FromNalNum) do
      FromNalNum := FromNalNum+' ';

    for i:=1 to 12-length(ToNalNum) do
      ToNalNum := ToNalNum+' ';


    if length(FromNalNum) > 0
      then for Position :=1 to 12 do List.Cells[13,2+Position]:=FromNalNum[Position]
      else for Position :=1 to 12 do List.Cells[13,2+Position]:='X';

    if  (length(qReport.FieldByName('To_Nal_Num').AsString) > 0) and (Options.IsDoc2Client)
      then for Position :=1 to 12 do List.Cells[13,17+Position]:= ToNalNum[Position]
      else for Position :=1 to 12 do List.Cells[13,17+Position]:='Х';

    List.Cells[15,'G']:=FromAddress;
    List.Cells[15,'V']:=ToAddress;
    List.Cells[16,'G']:=''''+FromPhone;
    List.Cells[16,'V']:=''''+ToPhone;
    if length(FromSvidNum) > 0
     then List.Cells[17,'G']:=FromSvidNum
     else List.Cells[17,'G']:='XXXXXXXX';

    if (length(qReport.FieldByName('To_Svid_Num').AsString) >0) and (Options.IsDoc2Client)
     then List.Cells[17,'V']:=qReport.FieldByName('To_Svid_Num').AsString
     else List.Cells[17,'V']:='XXXXXXXX';
    List.Cells[19,'G'] := Options.ByDogName;//'Согласно договора купли продажи '+ qReportDog.AsString;
    List.Cells[31,'C'] := mtTaxBillShipDate.AsString;
    //Det_date := mtTaxBillShipDate.AsDateTime;
    if Options.OperName <> '' then
      List.Cells[21,'H']:= Options.OperName
    else
      List.Cells[21,'H']:=LangText('Oplata_s_rashchetnogo_scheta');
    if Options.DebugPrint then
    begin
      List.Cells[30,'U']:='НДС';
      List.Cells[30,'W']:='C НДС';
    end;
    //печать табличной части
    Position := 31;
    SNds:=0;  Sum := 0; SumNDS := 0;
    while not mtTaxbillData.Eof do
    begin
      if (Options.IsDoc2Client)or((PRINT_TYPE_DAILY_TAX='DETAIL')and not(Options.IsDoc2Client)) then
      begin
        {if Det_date <> mtTaxBillShipDate.AsDateTime then
        Begin
          List.Cells[Position,'C'] := mtTaxBillShipDate.AsString;
          Det_date := mtTaxBillShipDate.AsDateTime;
        End;}
        List.Cells[Position,'C'] := mtTaxBillShipDate.AsString;
        List.Cells[Position,'F']:=mtTaxBillNpName.AsString;
        List.Cells[Position,'O']:=mtTaxBillDimName.AsString;

        List.Cells[Position,'P'].NumberFormat:=Options.GetNumberFormat(Options.DecimalCount);
        List.Cells[Position,'P']:=mtTaxBillLitr.Value;
        List.Cells[Position,'Q'].NumberFormat:=Options.GetNumberFormat(Options.DecimalPrice);
        List.Cells[Position,'Q']:=mtTaxBillPriceNoNds.Value;

        List.Cells[Position,'S']:=mtTaxBillSumNoNds.Value;

        if Options.DebugPrint then
        begin
          List.Cells[Position,'U']:=mtTaxBillNds.Value;
          List.Cells[Position,'W']:=mtTaxBillSumNds.Value;
        end;
        inc(Position);
      end;

      SNds := FRound(SNds+mtTaxBillNds.Value);
      Sum := Sum+mtTaxBillSumNoNds.Value;
      SumNDS := SumNDS + mtTaxBillSumNds.Value;
      mtTaxBillData.Next;
      if (31 < position) then//если позиция превышает <начало 31 грида в НН
        AddString(Position);
    end;
    Main.List.Range['AA31', 'AC'+IntToStr(Position+1)].Borders[xlInsideHorizontal].LineStyle:=0;
    Main.List.Range['B32',  'B'+IntToStr(Position+1)].Borders[xlInsideHorizontal].LineStyle:=0;
    IF (Options.IsDoc2Client)or((PRINT_TYPE_DAILY_TAX='DETAIL')and not(Options.IsDoc2Client)) then
      (* Корректируем последнюю позицию для того чтобы сумма сходилась, а также НДС *)
      case Options.NDSCalcOrientation of
        coSumWithNds:
        begin
          List.Cells[Position-1,'S']:=mtTaxBillSumNoNds.Value +
            SumNDS-GetNds_WithNds(SumNds,StrToDate(Options.Date))-Sum;
          List.Cells[Position+7,'S']:=GetNds_WithNds(SumNds,StrToDate(Options.Date));
          List.Cells[Position+1,'S']:=GetNoNds_WithNds(SumNds,StrToDate(Options.Date),2);
        end;
      {  coSumByRow:
        begin;
          List.Cells[Position-1,'S']:=mtTaxBillSumNoNds.Value +
            SumNDS-GetNds_WithNds(SumNds,StrToDate(Options.Date))-Sum;
          List.Cells[Position+7,'S']:=SNds;
          List.Cells[Position+1,'S']:=SumNds- SNds;
        end;   }
        coSumByRow2,coSumByRow:
        begin
          List.Cells[Position-1,'S']:=mtTaxBillSumNoNds.Value + SumNDS-SNds-Sum;
          List.Cells[Position+7,'S']:=SNds;
          List.Cells[Position+1,'S']:=SumNds - SNds;
        end;
        coNDSResult:
          IF(Options.NDSResult>SNds-1)and(Options.NDSResult<SNds+1)then
          begin
            //последняя позиция
            List.Cells[Position-1,'S']:=mtTaxBillSumNoNds.Value + SumNDS-Options.NDSResult-Sum;
            //НДС
            List.Cells[Position+7,'S']:=Options.NDSResult;
            //Сумма без НДС
            List.Cells[Position+1,'S']:=SumNds - Options.NDSResult;
          end
          ELSE
          begin
            List.Cells[Position-1,'S']:=mtTaxBillSumNoNds.Value + SumNDS-SNds-Sum;
            List.Cells[Position+7,'S']:=SNds;
            List.Cells[Position+1,'S']:=SumNds - SNds;
          end;
        coSumWithoutNds:
          List.Cells[Position+1,'S'].Formula:= '=SubTotal(9,S31:S'+IntToStr(Position)+')';
      end//case
    ELSE
    (* Заполням сводную налоговую *)
    begin
      case Options.OIL_NN_Cause of
        10: List.Cells[Position,'F']:=VarToStr(GetSqlValue(' select nvl(ov.GetVal(''NN_TOV_NAL_CAPTION''),''Реалізація за готівку за день'') from dual '));
        22: List.Cells[Position,'F']:=VarToStr(GetSqlValue(' select nvl(ov.GetVal(''NN_TOV_BANK_CAPTION''),''Реалізація за банківськими платіжними картками за день'') from dual '));
      end;
      List.Cells[Position,'O']:=VarToStr(GetSqlValue(' select nvl(ov.GetVal(''NN_CURRENCY_CAPTION''),''Грн.'') from dual '));
      List.Cells[Position,'P']:=1;
      List.Cells[Position,'S']:=Sum;
      List.Cells[Position+7,'S']:=SNds;
      List.Cells[Position+1,'S']:=SumNds - SNds;
    end;

    List.Cells[26,'S']:=TAX_RATE(StrToDate(Options.Date));

    // НЕпотрiбне видiлити помiткою "Х"
    if Options.PrintSettings.OrigOnly  then
    begin
      List.Cells[2,'L']:='';
      List.Cells[3,'L']:='X';
    end;
    if Options.PrintSettings.CopyOnly then
    begin
      List.Cells[2,'L']:='X';
      List.Cells[3,'L']:='';
    end;
    if Options.PrintSettings.EmptyCells then
    begin
      List.Cells[2,'L']:='';
      List.Cells[3,'L']:='';
    end;

    // Подстановка текущего учетчика
    List.Cells[Position+14,'T']:=GetCounterName();

    if (Options.PrintSettings.IsNeedPrint) and (not Options.PrintSettings.OrigAndCopy) then
      for i:=1 to Options.PrintSettings.NumOfCopy do List.PrintOut;

    if Options.PrintSettings.OrigAndCopy then
    begin
      List.Cells[2,'L']:='Х';
      List.Cells[3,'L']:='';

      if not Options.PrintSettings.IsNeedPrint then MsExcel.Run('CopyList',GetDateChangePos(StrToDate(Options.Date))*2-1) else
        for i:=1 to Options.PrintSettings.NumOfCopy do List.PrintOut;

      List.Cells[2,'L']:='';
      List.Cells[3,'L']:='Х';

      if Options.PrintSettings.IsNeedPrint then
        for i:=1 to Options.PrintSettings.NumOfCopy do List.PrintOut;
    end;

    {Цей код був написаний Лавренюком В. і похерений людиною, яка ж і сказала це зробити.
    Прошу Вас не вірити бухам, а саме Рощиній і здирати з них в обов"язковому порядку
    розпорядження із підписом.

    if PRINT_UPPER_ADRESS = 'ALFA' then
    begin // дописуємо юридичну і фактичну адресу філії
      List.Rows[16].Insert(xlDown); List.Rows[16].RowHeight := 13.5;
      List.Cells[16, 'B'] := 'Адреса філії:';

      List.Rows[17].Insert(xlDown); List.Rows[17].RowHeight := 22.5;
      Main.List.Range['G'+IntToStr(17),'N'+IntToStr(17)].Merge(True);
      Main.List.Range['G'+IntToStr(17),'N'+IntToStr(17)].HorizontalAlignment := xlLeft;
      List.Cells[17, 'B'] := '         Юридична:';
      List.Cells[17, 'G'] := VarToStr(nvl(GetSQLValue('select addr from v_org where ' +
        'state = ''Y'' and id = inst and id = '+ IntToStr(Self.Options.FromId)), ''));

      List.Rows[18].Insert(xlDown); List.Rows[18].RowHeight := 22.5;
      Main.List.Range['G'+IntToStr(18),'N'+IntToStr(18)].Merge(True);
      Main.List.Range['G'+IntToStr(18),'N'+IntToStr(18)].HorizontalAlignment := xlLeft;
      List.Cells[18, 'B'] := '         Фактична:';
      List.Cells[18, 'G'] := VarToStr(nvl(GetSQLValue('select real_address from v_oil_org_det where ' +
        'state = ''Y'' and org_id = inst and org_id = '+ IntToStr(Self.Options.FromId)), ''));
    end;}
  end;
  except on E:Exception do
    raise Exception.Create(eFillSheet+#13#10+E.Message);
  end;
end;

procedure TdmTaxBill.FillCorrSheet();
var
  Position, j,i :Integer;
  Height:integer;
  vFilNumber:string;
  FromAddress, FromName, FromPhone,FromNalNum, ToNalNum, FromSvidNum,
  ToAddress, ToPhone: string;
  procedure SetRekvizit();
  var
    q:TOilQuery;
  begin
    if (NN_WITH_UPPER_REKVIZIT = 'Y') and (Self.Options.FromId=MAIN_ORG.INST) then
    begin
      FromAddress :=  qReport.FieldByName('UP_From_Addr').AsString;
      FromName := qReport.FieldByName('UP_From_Name').AsString;
      FromPhone := qReport.FieldByName('UP_From_Phone').AsString;
      FromNalNum := qReport.FieldByName('UP_From_Nal_Num').AsString;
      FromSvidNum := qReport.FieldByName('UP_From_Svid_Num').AsString;
    end
    else if (NN_WITH_UPPER_REKVIZIT = 'ALFA') and (Self.Options.FromId=MAIN_ORG.INST) then
    begin
      q := TOilQuery.Create(nil);
      if GetOrgData(q,ALFANAFTA,ALFANAFTA) then
      begin
        FromName :=  q['NAME'];
        FromAddress := q['ADDR'];
        FromPhone := q['PHONE'];
        FromSvidNum := q['SVID_NUM'];
        FromNalNum := q['NAL_NUM'];
      end;
      q.Free;
    end
    else
    begin
      FromAddress := qReport.FieldByName('From_Addr').AsString;
      FromPhone := qReport.FieldByName('From_Phone').AsString;
      FromName := qReport.FieldByName('From_Name').AsString;
      FromNalNum := qReport.FieldByName('From_Nal_Num').AsString;
      FromSvidNum := qReport.FieldByName('From_Svid_Num').AsString;
    end;

    // адреса і телефон
    FromPhone := qReport.FieldByName('From_Phone').AsString;
    if PRINT_UPPER_ADRESS = 'NO' then
      FromAddress := qReport.FieldByName('From_Addr').AsString
    else
      if (PRINT_UPPER_ADRESS = 'ALFA') and (Self.Options.FromId = MAIN_ORG.INST) then
      begin
        q := TOilQuery.Create(nil);
        if GetOrgData(q, ALFANAFTA, ALFANAFTA) then
          FromAddress := q['ADDR'] +#10+
            decode([MAIN_ORG.ORG_TYPE, 3, qReport.FieldByName('UP_From_Addr').AsString,
              qReport.FieldByName('From_Addr').AsString]);
        if MAIN_ORG.ORG_TYPE = 3 then
          FromPhone := qReport.FieldByName('UP_From_Phone').AsString;
        q.Free;
      end
      else
        if (PRINT_UPPER_ADRESS = 'YES') and (Self.Options.FromId = MAIN_ORG.INST) then
          FromAddress := qReport.FieldByName('UP_From_Addr').AsString +#10+ qReport.FieldByName('From_Addr').AsString;

    // Адресс клиента-филиала в зависимость от галочки.
    IF not(Options.IsDoc2Client)then
    begin
      ToAddress:=' ';
      ToPhone:=' ';
    end
    ELSE IF(0<GetSqlValuePar('select count(*) from v_org where id =:to_inst '+
         ' and org_type=4 and par_inst = :par_inst ',
         ['to_inst','par_inst'],
         [ftInteger,ftInteger],
         [qReport.FieldByName('TO_').AsInteger,ALFANAFTA]))
       and (NN_CLIENT_ADRESS = 'ALFA')
    THEN
    begin
      q := TOilQuery.Create(nil);
      if GetOrgData(q,ALFANAFTA,ALFANAFTA) then
      begin
        ToAddress := q['ADDR'];
        ToPhone := q['PHONE'];
      end;
      q.free;
    end
    ELSE
    begin
      ToAddress:=qReport.FieldByName('To_Addr').AsString;
      ToPhone:=qReport.FieldByName('To_Phone').AsString;
    end;
  end;
begin
  if mtTaxBillData.IsEmpty then raise Exception.Create(eTaxBillEmptyData);
  SetRekvizit;
  try with Excel do
  begin
    //Корректировка
    if IsFreeOle then begin
      Main.MsExcel.ActiveWorkbook.WorkSheets[GetDateChangePos(StrToDate(Options.Date))*2].Select;
      Main.List:=MsExcel.ActiveWorkbook.WorkSheets[GetDateChangePos(StrToDate(Options.Date))*2];
      for i:=1 to MsExcel.ActiveWorkbook.WorkSheets.Count do
        if (i<>GetDateChangePos(StrToDate(Options.Date))*2)then
          MsExcel.ActiveWorkbook.WorkSheets[i].Visible:=False;
    end;
    //взять из настроек номер филиала чтобы поставить к номеру НН
    if(Options.OIL_NN_Cause=19)and(DBUserExists('OIL_OLD'))then
      vFilNumber:=nvl(GetSqlValue(' select max(value) from oil_old.oil_var where name=''FILIAL_NUMBER'''),'0')
    else
      vFilNumber:=FILIAL_NUMBER;

    if vFilNumber = '0' then
      List.Cells[4,'AE']  := Options.CorrNum+'/'+Options.Num
    else
      List.Cells[4,'AE']  := Options.CorrNum+'/'+Options.Num + vFilNumber;

    if qReport.FieldByName('Dog').AsString <> '' then
      List.Cells[6,'N']:=' '+LangText('Ot')+' '+Options.Date+' №'+Options.Num+' '+LangText('Soglastno_dogovora')+' '+LangText('Ot')+' '+qReport.FieldByName('Dog_Date').AsString+' №'+qReport.FieldByName('Dog').AsString
    else
      List.Cells[6,'N']:=' '+LangText('Ot')+' '+Options.Date+' №'+Options.Num;
    List.Cells[9,'M']:=FromName;
    if not(Options.IsDoc2Client) then
    begin
      if PRINT_TYPE_DAILY_TAX='DETAIL' then
        List.Cells[9,'AP']:=VarToStr(GetSqlValue(' select nvl(ov.GetVal(''NN_ORG_NAL_CAPTION''),''Кінцевий покупець'') from dual '))
      else
        List.Cells[9,'AP']:=VarToStr(GetSqlValue(' select nvl(ov.GetVal(''NN_ORG_TOTAL_CAPTION''),''Зведена'') from dual '))
    end
    else
      List.Cells[9,'AP']:=qReport.FieldByName('To_Name').AsString;

    if(length(trim(FromNalNum))=0) then
      FromNalNum:= qReport.FieldByName('From_Nal_Num').AsString;
    if(length(FromNalNum)>0)
    then for Position:=1 to 12 do List.Cells[11,12+Position]:=FromNalNum[Position]
    else for Position:=1 to 12 do List.Cells[11,12+Position]:='X';

    if(length(trim(ToNalNum))=0) then
      ToNalNum:= qReport.FieldByName('To_Nal_Num').AsString;
    if(length(ToNalNum)>0) and (Options.IsDoc2Client)
    then for Position:=1 to 12 do List.Cells[11,41+Position]:=ToNalNum[Position]
    else for Position:=1 to 12 do List.Cells[11,41+Position]:='X';

    List.Cells[13,'G']:=FromAddress;
    List.Cells[15,'G']:=FromPhone;
    List.Cells[17,'P']:=FromSvidNum;
    List.Cells[18,'F']:=Options.ByDogName;
    List.Cells[21,'K']:=Options.OperName;

    if Options.IsDoc2Client then
    begin
      List.Cells[13,'AJ']:=ToAddress;
      List.Cells[15,'AJ']:=ToPhone;
      List.Cells[17,'AS']:=qReport.FieldByName('To_Svid_Num').AsString;
    end
    else
      List.Cells[17,'AS']:='Х';
    List.Cells[20,'F']:=Options.Date;
    Height:=List.Rows[32].EntireRow.RowHeight;

    for Position := 1 to mtTaxBillData.RecordCount-1 do List.Rows[32].EntireRow.Insert;  //Добавить строку

    for Position:=32 to 32+mtTaxBillData.RecordCount-2 do
    begin
      for j:=1 to High(KorrBounds)-1 do
        List.Range[KorrBounds[j]+IntToStr(Position)+':'+ExcelNumberToColumn(ExcelColumnToNumber(KorrBounds[j+1])-1)+IntToStr(Position)].Merge;
      for j:=9 to High(KorrBounds)-1 do
        List.Cells[Position,KorrBounds[j]].NumberFormat:='0,00';
      List.Cells[Position,KorrBounds[5]].NumberFormat:='0,000';
      List.Cells[Position,KorrBounds[6]].NumberFormat:='0,0000';

    end;
    mtTaxBillData.First;
    Position:=32;
    while not mtTaxBillData.Eof do begin
      List.Cells[Position,'A']:=Options.CorrDate;
      List.Rows[Position].EntireRow.RowHeight:=Height;
      List.Rows[Position].EntireRow.VerticalAlignment:=xlCenter;
      List.Cells[Position,'C']:=LangText('Izmenenit_tseni_i_kolva');
      List.Cells[Position,'C'].WrapText:=TRUE;
      List.Cells[Position,'C'].Font.Bold:=TRUE;

      List.Cells[Position,'G'] := mtTaxBillNpName.AsString;
      List.Cells[Position,'N'] := mtTaxBillDimName.AsString;


      // Смотрим что менялось и в завасимости от этого и пишем
      if mtTaxBillText.AsString = 'C' then
      begin
        List.Cells[Position,'T'] := mtTaxBillPriceNoNds.AsFloat;
        List.Cells[Position,'Q'] := mtTaxBillLitr.AsFloat;
      end
      else
      begin
        List.Cells[Position,'W'] := mtTaxBillPriceNoNds.AsFloat;
        List.Cells[Position,'Z'] := mtTaxBillLitr.AsFloat;
      end;

      List.Cells[Position,'AC']:= mtTaxBillSumNoNds.AsFloat;
      if mtTaxBillSumNoNds.AsFloat<0 then
      begin
        List.Cells[Position,'AL'] := mtTaxBillNds.AsFloat;
        List.Cells[Position,'AP'] := mtTaxBillNds.AsFloat;
      end
      else
      begin
        List.Cells[Position,'AT']:= mtTaxBillNds.AsFloat;
        List.Cells[Position,'AX']:= mtTaxBillNds.AsFloat;
      end;
      mtTaxBillData.Next;
      inc(Position);
    end;

    List.Cells[34+mtTaxBillData.RecordCount,'M']:=Options.CorrDate;
    List.Cells[34+mtTaxBillData.RecordCount,'AA']:=GetCounterName();

    ExFormat(List,'A'+IntToStr(38+mtTaxBillData.RecordCount),[
      Options.CorrDate,
      Options.CorrNum,
      Options.Date,
      Options.Num]);
    if  not Options.PrintSettings.OrigOnly then
    begin
      List.Cells[1,'J']:='';
      List.Cells[2,'J']:='X';
    end;
    if Options.PrintSettings.CopyOnly then
    begin
      List.Cells[1,'J']:='X';
      List.Cells[2,'J']:='';
    end;

    if Options.PrintSettings.EmptyCells then
    begin
      List.Cells[1,'J']:='';
      List.Cells[2,'J']:='';
    end;
    List.Select;
    if Options.PrintSettings.IsNeedPrint then List.PrintOut;
  end; //with
  except on E:Exception do
    raise Exception.Create(eFillCorrSheet+#13#10+E.Message);
  end;
end;
////////////////////////////////////////////////////////////////////////////////
//////////////////////// ПЕЧАТЬ НН ИЗ OIL_SALE_BOOK ////////////////////////////
////////////////////////////////////////////////////////////////////////////////
{
procedure TdmTaxBill.GetSaleBookRecords(FromDate, ToDate : TDateTime);
var
  CurrNumber, CurrType : String;
  ProgressBar : TProgressBar;
begin
  ProgressBar := TProgressBar.Create(Application);
  try
    qSaleBook.Close;
    qSaleBook.ParamByName('ToId').asInteger := Options.ToId;
    qSaleBook.ParamByName('OrgInst').asInteger := Options.OrgInst;
    qSaleBook.ParamByName('FromDate').asDateTime := FromDate;
    qSaleBook.ParamByName('ToDate').asDateTime := ToDate;
    qSaleBook.Open;
    qSaleBook.First;
    if qSaleBook.isEmpty then raise Exception.Create(eSaleBookIsEmpty);
    ProgressBar.SetMaxValue(qSaleBook.RecordCount);
    CurrNumber := qSaleBook.FieldByName('TaxBillNum').asString;
    CurrType := qSaleBook.FieldByName('TaxBillType').asString;
    while not qSaleBook.Eof do
    begin
      ProgressBar.Step();
      Options.Date := qSaleBook.FieldByName('TaxBillDate').asString;
      Options.Num := qSaleBook.FieldByName('TaxBillNum').asString;
      AddPosition( //BySB
        qSaleBook.FieldByName('Np_Id').asInteger,
        qSaleBook.FieldByName('Dim_Id').asInteger,
        qSaleBook.FieldByName('TaxBillDate').asString,  // ShipDate
        qSaleBook.FieldByName('CountLitr').asFloat,     // Litr
        qSaleBook.FieldByName('SumNds').asFloat,        // SumNds
        qSaleBook.FieldByName('SumNoNds').asFloat,      // SumNoNds
        qSaleBook.FieldByName('Nds').asFloat,           // Nds
        qSaleBook.FieldByName('PriceNds').asFloat       // PriceNDS
      );
      qSaleBook.Next;
      if (CurrNumber <> qSaleBook.FieldByName('TaxBillNum').asString) or (qSaleBook.Eof) then
      begin
        Options.TaxBillType := StrToInt(CurrType);
        PutToExcel();
        CurrNumber := qSaleBook.FieldByName('TaxBillNum').asString;
        CurrType := qSaleBook.FieldByName('TaxBillType').asString;
      end;
    end;
    ProgressBar.Free();
    if Options.OutPut = Disk
      then MessageDlg('Налоговые накладные сохранены в '+#13#10+GetDirName(),mtInformation,[mbYes],0);
  except on E:Exception do
    begin
      ProgressBar.Free();
      Raise Exception.Create('Ошибка печати НН:'+#13#10+E.Message);
    end;
  end;
end;
 }
////////////////////////////////////////////////////////////////////////////////
////////////////////// Запись данных о НН в базу ///////////////////////////////
////////////////////////////////////////////////////////////////////////////////

function TdmTaxBill.GetTaxBillNumById(tbID,tbInst:Integer):String;
begin
  if (tbID <= 0) or (tbInst <= 0)  then raise Exception.Create(eNotFoundNNIdInst);
  try
    if qTemp.Active then qTemp.Close;
    qTemp.SQL.Text :=
        ' select num from  Oil_Sale_Book '+
        ' where id = '+IntToStr(tbID)+
        ' and Inst = '+IntToStr(tbInst)+
        ' and State = ''Y'' ';
    qTemp.Open;
    Result := qTemp.FieldByName('Num').asString;
  except on E:Exception do
    raise Exception.Create(eGetReservedParams+#13#10+E.Message);
  end;
end;

procedure TdmTaxBill.GetReservedTaxBillParams(tbDate:String);
var strAdd : string;
begin

  //строка для поиска зарезервированной НН по оплате
  if Options.TaxBillType = 9 then
    strAdd := ' and (id, inst) in (select nn_id,nn_inst from oil_money '+
              ' where state = ''Y'' and org_id = '+IntToStr(Options.ToId)+
              ' and org_inst = '+IntToStr(Options.ToInst) +' and nn_id is not null )'+
              ' and organ <> organ_inst ';
  //строка для поиска зарезервированной НН по отгрузке
  if (Options.TaxBillType =7) or (Options.TaxBillType =TB_MOVE_INST) then
    strAdd := ' and (id, inst) not in (select nn_id,nn_inst from oil_money '+
              ' where state = ''Y'' and org_id = '+IntToStr(Options.ToId)+
              ' and org_inst = '+IntToStr(Options.ToInst) +' and nn_id is not null )';

  if qTemp.Active then qTemp.Close;
  qTemp.SQL.Text :=
      ' select * from  Oil_Sale_Book '+
      ' where Organ = '+IntToStr(Options.ToId)+
      ' and Organ_Inst = '+IntToStr(Options.ToInst)+
      ' and nal_t = 6 '+
      ' and s_date='''+tbDate+''''+
      ' and State = ''Y'' '+ strAdd +
      ' order by num ';
  qTemp.Open;

  if qTemp.isEmpty then
  begin
    Options.Num := '';
    Options.TaxBillId :=0;
    Options.TaxBillInst :=0;
  end
  else
  begin
    qTemp.First;
    Options.Num := qTemp.FieldByName('Num').asString;
    Options.Date := qTemp.FieldByName('s_date').asString;
    Options.TaxBillId := qTemp.FieldByName('id').asInteger;
    Options.TaxBillInst := qTemp.FieldByName('inst').asInteger;
  end;
end;

function TdmTaxBill.GetCounterName():string;
var
  res:string;
begin
  res:=GetSqlValueParSimple('select u_name from adm_users where id=:id',
    ['id',Main.SUPER_REAL_EMP_ID]);
  if( (res='Учетчик') or (trim(res)='') )then
    ShowMessage('Проверьте правильность печати фамилии сотрудника, выписавшего накладную.'+#13#10
      +'Если она не правильная, то сделайте правильную установку имени текущего пользователя'+#13#10
      +'(меню Настройки\Управление пользователями\Общая информация)');
  Result:=res;
end;

procedure TdmTaxBill.CreateSaleBookRecord();
var
  FRasch : String;
  Nal_t : Variant;
begin
  case Options.TaxBillType of
    //НН созданые в ручную по чекам и прочие
    14,13:
      Begin
        Options.Locked := UnLock;
        if Options.Num = '' then
          Options.Num := GetNextNumber(StrToDate(Options.Date));
        if ( (Options.TaxBillId = Null) or (Options.TaxBillId = 0) ) then
          Options.TaxBillId := GetSeqNextVal('s_oil_sale_book');
      End;
    //Налоговая по не полной стоимости Оплаты и Талоны
    11,12 :
      Begin
        if Options.Num = '' then
          Options.Num := GetNextNumber(StrToDate(Options.Date));
        if ( (Options.TaxBillId = Null) or (Options.TaxBillId = 0) ) then
          Options.TaxBillId := GetSeqNextVal('s_oil_sale_book');
      End;
    //Налоговая по оплате
    9 :
      begin
        if Options.TaxBillId > 0
          then Options.Num := GetTaxBillNumById(Options.TaxBillId,Options.TaxBillInst)
          else GetReservedTaxBillParams(Options.Date);
        FRasch := TranslateText('Оплата с ')+LangText('R/S')+TranslateText(', п.п.№ ')+Options.PayNum;
        Options.ValidateParams(ctTaxBillByPay);
        Options.OIL_NN_Type := 1;
      end;
    //налоговая по отгрузке
    7,TB_MOVE_INST :
      begin
        //Если налоговая не по отпуску с НБ (нет резервных)
        if Options.Scheme <> NB
              //Получить зарезервированную налоговую накладную (если она есть)
          then GetReservedTaxBillParams(Options.Date);
        //новый айди если нет зарезервированной нн
        if Options.TaxBillId = 0  then Options.TaxBillId  := GetSeqNextVal('s_oil_sale_book');
        //новый номер НН если нет зарезервированной нн
        if Options.Num = '' then
          if(MAIN_ID=INST_DUAL) or ( (Options.TaxBillType = TB_MOVE_INST) and (Options.ToId = MAIN_ID) and (Options.ToId = Options.ToInst)  )
            then Options.Num := IntToStr(GetSeqNextVal('Lnk_Nal_nakl_num'))
            else Options.Num := IntToStr(GetSeqNextVal('Nal_nakl_num'));
        FRasch := TranslateText('Оплата с ')+LangText('R/S');
        Options.OIL_NN_Type := 2;
      end;
      //зарезервированная НН
    6 :
      begin
        Options.TaxBillId := GetSeqNextVal('s_oil_sale_book');
        Options.Num  :=  IntToStr(GetSeqNextVal('Nal_nakl_num'));
        Options.ByDogName := LangText('Zarezervirovana_dlia_posledyuschego_ispolzovania');
        Options.OIL_NN_Type := 4;
      end;
    //корректировка
    8 :
      begin
        //получения № корректировки
//        Options.CorrNum := IntToStr(GetSeqNextVal('s_nn_corr_num'));
        Options.OIL_NN_Type := 3;
        if Options.CorrNum ='' then
          Options.CorrNum := GetNextNumber(StrToDate(Options.Date),BoolTo_(Options.OIL_NN_Cause>0,Options.OIL_NN_Cause,-1),Options.OIL_NN_Type);
      end;
    else
    begin
      if(Options.OIL_NN_TYPE = 0)and(Options.OIL_NN_CAUSE = 0)then
        raise Exception.Create(eTaxBillType);
    end
  end;
  if 0 = Options.TaxBillType then
    Nal_t := Null
  else
    Nal_t := Options.TaxBillType;
  // Берем номер НН если его нету и Id если его нет
  if (Options.Num = '')and ((Options.TaxBillType <> 8)or(Options.OIL_NN_Type <> 3)) then
    Options.Num := GetNextNumber(StrToDate(Options.Date));
  if ( (Options.TaxBillId = Null) or (Options.TaxBillId = 0) ) then
    Options.TaxBillId := GetSeqNextVal('s_oil_sale_book');
  Options.TaxBillInst := MAIN_ORG.INST;
  Options.ValidateParams(ctCreateSBRecord);
  DBSaver.SaveRecord('OIL_SALE_BOOK',
   ['ID',         Options.TaxBillId,
    'STATE',      'Y',
    'INST',       Options.TaxBillInst,
    'S_DATE',     StrToDate(Options.Date),
    'ORGAN',      BoolTo_(not Options.IsDoc2Client,null,Options.ToId),
    'ORGAN_INST', BoolTo_(not Options.IsDoc2Client,null,Options.ToInst),
    'NUM',        BoolTo_((Options.TaxBillType = 8)or(Options.OIL_NN_Type = 3),Options.CorrNum, Options.Num),
    'F_DOC',      Options.ByDogName,
    'FRASCH',     Options.OperName,
    'R_DATE',     StrToDate(Options.Date),
    'SALE_TXT',   TranslateText('Оплата с ')+LangText('R/S'),
    'FROM_',      Options.FromId,
    'FROM_INST',  Options.FromInst,
    'NAL_T',      Nal_t,
    'LOCK_',      Options.Locked,
    'AZS_ID',     BoolTo_(Options.FromAzsId=0,null,Options.FromAzsId),
    'AZS_INST',   BoolTo_(Options.FromAzsInst=0,null,Options.FromAzsInst),
    'NN_TYPE_ID', Options.OIL_NN_TYPE,
    'NN_CAUSE_ID',Options.OIL_NN_CAUSE,
    'NN_ID',      BoolTo_(Options.TaxBillType = 8,Options.TaxBillId_Link,null),
    'NN_INST',    BoolTo_(Options.TaxBillType = 8,Options.TaxBillInst_Link,null)
     ]);
  NNCreated := True;

end;

procedure TdmTaxBill.CreateSaleBookDetRecord();
var
  nds_t,
  nds_p_base,
  nds_p_20,
  k_nds_b,
  k_nds_20,
  DET_DATE,
  DET_TEXT : Variant;
  p_or_np_base,
  p_or_np_20 : string;
  //****************************************************************************
  function getNextId:integer;
  var
    v: variant;
  begin
    v := GetSqlValueParSimple('select min(id) from oil_sale_book_det where state=''N'' and nn_id=:nn_id and nn_inst=:nn_inst ',
        ['nn_id',Options.TaxBillId,
         'nn_inst',Options.TaxBillInst]);
    if v = Null then
      result := GetSeqNextVal('s_oil_sale_book_det')
    else
      result := v;
  end;
  //****************************************************************************  
begin
  p_or_np_base := 'NDS_P_BASE';
  p_or_np_20 := 'NDS_P_20';
  if mtTaxBillData.IsEmpty then raise Exception.Create(eTaxBillEmptyData);
  //Корректировка
  if (Options.TaxBillType = 8)or(Options.OIL_NN_Type = 3) then
  begin
    k_nds_b    := FRound(mtTaxBillSumNds.AsFloat-mtTaxBillNds.AsFloat); //Сумма без НДС
    k_nds_20   := mtTaxBillNds.AsFloat; //НДС
    nds_t      := mtTaxBillSumNds.AsFloat;
    nds_p_base := null;
    nds_p_20   := null;
  end
  else
  //Налоговая
  begin

    if qReport.FieldByName('TO_NAL_NUM').AsString = '' then
    Begin
      p_or_np_base := 'NDS_NP_BASE';
      p_or_np_20 := 'NDS_NP_20';
    End;
    nds_t := mtTaxBillSumNds.AsFloat;
    nds_p_base := mtTaxBillSumNoNds.AsFloat;
    nds_p_20 := mtTaxBillNds.AsFloat;
    k_nds_b := null;
    k_nds_20 := null;
  end;
  If(Options.TaxBillType = 14)or(Options.OIL_NN_Cause in [14])then
  begin
    DET_DATE := mtTaxBillShipDate.AsDateTime;
    DET_TEXT := mtTaxBillText.AsString;
  end
  Else
  begin
    DET_DATE := Null;
    DET_TEXT := Null;
    If Options.OIL_NN_Type = 3 then //Корректировка
      DET_TEXT := mtTaxBillText.AsString;
    If(not Options.IsDoc2Client)and not(Options.OIL_NN_Type = 3)then //Наличка
      DET_DATE := mtTaxBillShipDate.AsDateTime;
  end;
  Options.ValidateParams(ctCreateSBRecord);
  DBSaver.SaveRecord('OIL_SALE_BOOK_DET',
   ['ID',         getNextId,
    'STATE',      'Y',
    'INST',       MAIN_ORG.INST,
    'NN_ID',      Options.TaxBillId ,
    'NN_INST',    Options.TaxBillInst ,
    'NDS_T',      nds_t,
    p_or_np_base,  nds_p_base,
    p_or_np_20,    nds_p_20,
    'K_NDS_B',    k_nds_b,
    'K_NDS_20',   k_nds_20,
    'TOV_ID',     mtTaxBillNpgId.asFloat,
    'DIV_ID',     mtTaxBillDimId.asInteger,
    'KOL',        mtTaxBillLitr.asFloat,
    'PRICE_NDS',  mtTaxBillPriceNds.asFloat,
    'DET_DATE',   DET_DATE,
    'DET_TEXT',   DET_TEXT]);
end;
procedure TdmTaxBill.DeleteSBRecords(FromDate:TDateTime; TaxBillType:String); //ByType
begin
  _ExecSql(' update oil_sale_book_det '+
           ' set state=''N'' '+
           ' where (nn_id,nn_inst) in '+
           '       (select id,inst from oil_sale_book '+
           '        where organ_inst= '+IntToStr(Options.ToInst)+' and organ='+IntToStr(Options.ToId)+
           '              and s_date >= '''+DateToStr(FromDate)+''''+
           '              and Organ_Inst <> Organ '+
           '              and nal_t in ('+TaxBillType+') '+
           '        )  ');

  _ExecSql(' update oil_sale_book '+
           ' set nal_t=decode(nal_t,8,nal_t,6) '+
           ' , state = decode(nal_t,8,''N'',6,''N'',''Y'') ' +
           '        where organ_inst= '+IntToStr(Options.ToInst)+' and organ='+IntToStr(Options.ToId)+
           '              and s_date >= '''+DateToStr(FromDate)+''''+
           '              and Organ_Inst <> Organ '+
           '              and nal_t in ('+TaxBillType+')');
end;
procedure TdmTaxBill.DeleteSBRecords(FromDate,ToDate:TDateTime); //ByDate
begin

  _ExecSql(' update oil_sale_book_det '+
           ' set state=''N'' '+
           ' where (nn_id,nn_inst) in '+
           '       (select id,inst from oil_sale_book '+
           '        where organ_inst= '+IntToStr(Options.ToInst)+' and organ='+IntToStr(Options.ToId)+
           '              and s_date between '''+DateToStr(FromDate)+''''+
           '              and '''+DateToStr(ToDate)+''''+
           '              and nal_t= '+IntToStr(Options.TaxBillType)+')');


  _ExecSql(' update oil_sale_book '+
           ' set nal_t=decode(nal_t,8,nal_t,6) '+
           ' , state = decode(nal_t,8,''N'',6,''N'',701,''N'',''Y'') ' +
           '     where organ_inst= '+IntToStr(Options.ToInst)+' and organ='+IntToStr(Options.ToId)+
           '              and s_date between '''+DateToStr(FromDate)+''''+
           '              and '''+DateToStr(ToDate)+''''+
           '              and State = ''Y''   '+
           '              and nal_t= '+IntToStr(Options.TaxBillType));
end;

procedure TdmTaxBill.DeleteSBRecords(NN_ID,NN_INST:Integer;Nal_T:Integer); //ById
begin
  _ExecSql(' update oil_sale_book_det '+
           ' set state=''N'' '+
           ' where (nn_id,nn_inst) in '+
           '       (select id,inst from oil_sale_book '+
           '        where organ_inst= '+IntToStr(Options.ToInst)+' and organ='+IntToStr(Options.ToId)+
           '              and ID = '+IntToStr(NN_ID)+
           '              and INST = '+IntToStr(NN_INST)+
           '              and nal_t in (6,7,8,9))');

  _ExecSql(' update oil_sale_book '+
           ' set nal_t=decode(nal_t,8,nal_t,6) '+
           ' , state = decode(nal_t,8,''N'',6,''N'',7,''Y'',9,''Y'') ' +
           '     where organ_inst= '+IntToStr(Options.ToInst)+' and organ='+IntToStr(Options.ToId)+
           '              and ID = '+IntToStr(NN_ID)+
           '              and INST = '+IntToStr(NN_INST)+
           '              and Organ_Inst <> Organ '+
           '              and State = ''Y''   '+
           '              and nal_t in (6,7,8,9)');
end;

procedure TdmTaxBill.DeleteSBRecordsDet(NN_ID,NN_INST:Integer;Nal_T:Integer=0); //ByIdNN his det
begin
  _ExecSql(' update oil_sale_book_det ' +
           ' set state = ''N'' ' +
           ' where (nn_id,nn_inst) in ' +
           '       (select id,inst from oil_sale_book ' +
           '        where ID = :id ' +
           '          and INST = :inst ' +
           '          and (nal_t = :nal_t or :nal_t=0))',
           ['id',NN_ID,
            'inst',NN_INST,
            'nal_t',Nal_T]);

end;

procedure TdmTaxBill.DeleteSBRecords10(NN_ID, NN_INST: integer; p_cause_id:integer=-1); //ById
begin
  if p_cause_id = -1 then
    _ExecSql(' insert into oil_nnum_reserve (id, inst, state, date_, num) ' +
             '  select s_oil_nnum_reserve.nextval, inst, ''Y'', r_date, num ' +
             '  from oil_sale_book ' +
             '  where ID = '+IntToStr(NN_ID)+
             '    and INST = '+IntToStr(NN_INST)+
             '    and State = ''Y'' ')
  else
    _ExecSql(' insert into oil_nnum_reserve (id, inst, state, date_, num, nn_cause_id) ' +
             '  select s_oil_nnum_reserve.nextval, inst, ''Y'', r_date, num, ' + IntToStr(p_cause_id)+
             '  from oil_sale_book ' +
             '  where ID = '+IntToStr(NN_ID)+
             '    and INST = '+IntToStr(NN_INST)+
             '    and State = ''Y'' ');

  _ExecSql(' update oil_sale_book_det '+
           ' set state=''N'' '+
           ' where (nn_id,nn_inst) in '+
           '       (select id,inst from oil_sale_book '+
           '        where ID = '+IntToStr(NN_ID)+
           '              and INST = '+IntToStr(NN_INST)+
           '              and nal_t in (6,7,8,9,11,12))');


  _ExecSql(' update oil_sale_book '+
           ' set state = ''N'' '+
           '     where ID = '+IntToStr(NN_ID)+
           '           and INST = '+IntToStr(NN_INST)+
           '           and State = ''Y'' ' +
           '           and (nal_t <> 10 or nal_t is null) ');
end;

procedure TdmTaxBill.DeleteSBRecordsCorr(NN_ID, NN_INST: integer); //CorrById
begin
  _ExecSql(' insert into oil_nnum_reserve (id, inst, state, date_, num, nn_type_id) ' +
             '  select s_oil_nnum_reserve.nextval, inst, ''Y'', s_date, num, 3'+
             '  from oil_sale_book ' +
             '  where ID = '+IntToStr(NN_ID)+
             '    and INST = '+IntToStr(NN_INST)+
             '    and State = ''Y'' ');

  _ExecSql(' update oil_sale_book_det '+
           ' set state=''N'' '+
           ' where (nn_id,nn_inst) in '+
           '       (select id,inst from oil_sale_book '+
           '        where ID = '+IntToStr(NN_ID)+
           '              and INST = '+IntToStr(NN_INST)+
           '              and nn_type_id = 3)');


  _ExecSql(' update oil_sale_book '+
           ' set state = ''N'' '+
           '     where ID = '+IntToStr(NN_ID)+
           '           and INST = '+IntToStr(NN_INST)+
           '           and State = ''Y'' ' +
           '           and nn_type_id = 3 ');
end;

Function TdmTaxBill.Edit(Auto:Boolean = True;money:double = 0) : double;
var
  TaxBillEdit : TTaxBillEditDetForm;
  SumTax : double;
begin
  SumTax :=0;
  EmptyMtValues();
  if Options.Num = '' then
    Options.Num := GetNextNumber(StrToDate(Options.Date));
  if ( (Options.TaxBillId = Null) or (Options.TaxBillId = 0) ) then
    Options.TaxBillId := GetSeqNextVal('s_oil_sale_book');
  TaxBillEdit := TTaxBillEditDetForm.Create(Application);
  TaxBillEdit.nn_id := Options.TaxBillId;
  TaxBillEdit.nn_inst := Options.TaxBillInst;
  TaxBillEdit.Dog_id := Options.DogId;
  TaxBillEdit.Dog_inst := Options.DogInst;
  TaxBillEdit.money := Money;
  TaxBillEdit.num := Options.Num;
  TaxBillEdit.Auto := Auto;
  if Auto then
  Begin
    TaxBillEdit.Hide;
    TaxBillEdit.q.Open;
    TaxBillEdit.bbOkClick(nil);
  End
  else
    TaxBillEdit.ShowModal;
  //берем позиции из грида в TaxBillEdit

  TaxBillEdit.q.first;
  while not(TaxBillEdit.q.Eof) do
  Begin
    if TaxBillEdit.q.FieldByName('SUM_NN_EDIT').Value <> 0 then
    Begin
      AddPosition(
        TaxBillEdit.q.FieldByName('np_id').AsInteger,
        TaxBillEdit.q.FieldByName('dim_id').AsInteger,
        Options.Date,
        TaxBillEdit.q.FieldByName('count_nn_Edit').AsFloat,
        TaxBillEdit.q.FieldByName('price').AsFloat,
        TaxBillEdit.q.FieldByName('SUM_NN_EDIT').Value
        );
      SumTax :=
        SumTax + TaxBillEdit.q.FieldByName('SUM_NN_EDIT').Value;
    End;
    TaxBillEdit.q.next;
  End;
  TaxBillEdit.q.close;
  TaxBillEdit.Free;
  Result := SumTax;
end;

procedure TdmTaxBill.Make(flClearData:Boolean = True);
begin
  if mtTaxBillData.IsEmpty then raise Exception.Create(eTaxBillEmptyData);
  GetOrgProperties();
  CreateSaleBookRecord();
  mtTaxBillData.First;
  while not mtTaxbillData.Eof do
  begin
    CreateSaleBookDetRecord();
    mtTaxbillData.Next;
  end;
  if flClearData then EmptyMtValues();
end;

procedure TdmTaxBill.MakeReserved();
begin
  Options.TaxBillType := 6;
  try
    StartSql;
    CreateSaleBookRecord();
    CommitSql;
  except on E:Exception do
    begin
      RollBackSql;
      raise Exception.Create(eMakeReservedTaxBill+E.Message);
    end;
  end;
end;

function TdmTaxBill.GetNextNumber(NNDate: TDateTime;p_cause_id:integer = -1;p_type_id:integer = -1): string;
var
  ModeForm: TfSelNNNum;
  boolTran: boolean;
  //-------------------------------------------------------------------
  function GetFromReserve():string;
  begin
    // Проверяем значение "Птички 1"
    if NAL_NUM_RESERVE = 'N' then
    begin
      if p_type_id = 3 then
        Result:= IntToStr(GetSeqNextVal('s_nn_corr_num'))
      else
        Result:= IntToStr(GetSeqNextVal('nal_nakl_num'));
    end
    else
    begin
      boolTran:= frmStart.ORASESSION1.InTransaction;
      StartSQL(boolTran, 'NNNum');
      try
        // Блокируем таблицу
        _ExecSql(' lock table oil_nnum_reserve in share mode nowait');

        if qTemp.Active then
          qTemp.Close;

        qTemp.SQL.Text:=
          'select num as newnum, id, inst ' +
          '  from oil_nnum_reserve ' +
          ' where inst = :inst ' +
          '   and date_ = :date_ '+
          '   and state = ''Y'' ' +
          ' order by num ';

        if p_cause_id <> -1 then
          qTemp.AddWhere(' nn_cause_id = '+IntToStr(p_cause_id));
        if p_type_id <> -1 then
          qTemp.AddWhere(' nn_type_id = '+IntToStr(p_type_id));

        _OpenQueryPar(qTemp,
          ['inst',MAIN_ORG.Inst,
           'date_',NNDate]);

        // Смотрим есть ли что-нить
        if not qTemp.IsEmpty then
        begin
          Result:=qTemp.fieldByName('newnum').AsString;
          // Найденную запись - удаляем
          _ExecSql(' update oil_nnum_reserve ' +
            ' set state = ''N''' +
            ' where id = :id ' +
            '   and inst = :inst ', 
            ['id',qTemp['id'],
             'inst',qTemp['inst']]
            );
        end
        else if p_type_id = 3 then
          Result:= IntToStr(GetSeqNextVal('s_nn_corr_num'))
        else
          Result:= IntToStr(GetSeqNextVal('nal_nakl_num'));

        qTemp.Close;

        CommitSQL(boolTran);
      except
        RollbackSQL(boolTran, 'NNNum');
      end;
    end;
  end;
  //-------------------------------------------------------------------
begin
  try
    Result:= '';
    // Проверяем значение "Птички 2"
    if NAL_NUM_HAND = 'Y' then
    begin
      // Выводим окно
      ModeForm:= TfSelNNNum.Create(Self);
      try
        if ModeForm.ShowModal <> mrOK then
          raise Exception.Create(TranslateText('Ошибка при получении номера для налоговой накладной!'));
        if ModeForm.fNNNum = '!auto!' then
          Result:=GetFromReserve()
        else
          Result:= ModeForm.fNNNum;
      finally
        ModeForm.Free;
      end;
    end
    else
      Result:=GetFromReserve();
  except
    on e:exception do
    begin
      MessageDlg( 'GetNextNumber: '+e.message,mtError,[mbOk],0);
      Result:='';
    end;
  end;
end;

procedure TdmTaxBill.EditCause();
var
  Cause: TTaxBillCauseForm;
  i:integer;
  Function GetIndexByName(AGrid:TDBGridEh;AName:String):integer;
  var
    curCol:integer;
  begin
    Result := -1;
    for curCol:=0 to AGrid.Columns.Count-1 do
    begin
      if AnsiUpperCase(AGrid.Columns[curCol].FieldName)=AnsiUpperCase(AName) then
        Result := curCol;
    end;
    if result= -1 then
      raise Exception.Create(TranslateText('Ошибка GetIndexByName : Не найден поле с именем ')+AName);
  end;
begin
  Cause:=TTaxBillCauseForm.Create(nil);
  try
    // Набиваем выпадающие списки в гриде формы
    With Cause.dbg.Columns[GetIndexByName(Cause.dbg,'TOVAR_TYPE')] do
    begin
      PickList.Clear;
      KeyList.Clear;
      for i:= 0 to high(capTovarType) do
      begin
        PickList.Add(capTovarType[i]);
        KeyList.Add(IntToStr(i));
      end;
    end;
    With Cause.dbg.Columns[GetIndexByName(Cause.dbg,'SCHEME')] do
    begin
      PickList.Clear;
      KeyList.Clear;
      for i:= 0 to high(capScheme) do
      begin
        PickList.Add(capScheme[i]);
        KeyList.Add(IntToStr(i));
      end;
    end;
    With Cause.dbg.Columns[GetIndexByName(Cause.dbg,'NDS_CALC_ORIENTATION')] do
    begin
      PickList.Clear;
      KeyList.Clear;
      for i:= 0 to high(capCalcOrientation) do
      begin
        PickList.Add(capCalcOrientation[i]);
        KeyList.Add(IntToStr(i));
      end;
    end;
    Cause.ShowModal;
  finally
    Cause.Free;
  end;
end;

procedure DoReservNum(p_NNDate:TDateTime;p_cause_id:integer=-1);
(**
  Процедура ложет в резерв налоговых номеров номерок с определенным типом
*)
var
  q:TOilQuery;
begin
  q := TOilQuery.Create(nil);
  try
    try
      StartSQLOra;
      q.SQL.Text := Format(
        'Insert into oil_nnum_reserve '+
        '  (id, inst, state, date_, num, nn_cause_id)'+
        'select s_oil_nnum_reserve.nextval,%d,''Y'',to_date(''%s'',''DD.MM.YYYY''),''%d'',%s '+
        '  from oil_info ',
        [MAIN_ID,
         FormatDateTime2('dd.mm.yyyy',p_NNDate),
         GetSeqNextVal('nal_nakl_num'),
         BoolTo_(p_cause_id=-1,'null', IntToStr(p_cause_id))
         ]);
      CommitSQLOra;
    except
      on e:exception do
      begin
        RollBackSQLOra;
        raise exception.Create(TranslateText('ОШИБКА DoReservNum : ')+E.Message);
      end;
    end;
  finally
    q.free;
  end;
end;

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

end.



