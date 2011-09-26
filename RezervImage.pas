unit RezervImage;

{$I Define}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TeEngine, Series, TeeProcs, Chart, DbChart,
  DB, MemDS, DBAccess, Ora, Mask, ToolEdit, Buttons, DBCtrls, DBCtrlsEh,
  DBLookupEh, ComCtrls, RxGIF, Grids, DBGridEh, DBTables, MemTable, ActnList,
  Menus, TeeTools, TeePageNumTool, GridsEh, VirtualTable, TeeFaderTool, ImgList,
  TeCanvas, uOilPanel, TimerLst,
{$IFDEF OIL}
  RezervImageSvod, BaseTovarOperRef, PrihChart, RashChart, BaseDocsRef,
  BaseMeteringRef, RezMeasureRef, uStart, uCommonForm, Tubes, BaseRepDensity,
  BaseKolebRef, BaseMeteringAutoRef, BaseAutoZamerRef, BaseRepPoteriRez,
{$ENDIF}
  RezRashBase, RezPrihBase, BaseRepDeficit,
  DBGridEhGrouping, StrUtils, TeeFunci, ThreadRefreshQuery, DAAlerter,
  OraAlerter, TeeMagnifyTool;

type

  // списки потоків перезапуску запитів
  TRecThread = ^PRecThread;
  PRecThread = record
    qName : string;
    sEvent: string;
    Thread: TThreadRefreshQuery;
  end;

  TTankClass = class of TTankItem;

  TTankState = (tsCorrect, tsRepair, tsDiagnostic, tsDefectoscopy, tsNeadRepair,
    tsNeedUtilization, tsCapitalRepair);
  {0, 'Исправен', 1, 'В ремонте', 2, 'Диагностика', 3, 'Проводиться дефектоскопия',
   4, 'Подлежит ремонту (посля диагностики)', 5, 'Подлежит утилизаии',
   6, 'Капитальний ремонт' }

  TTankItem = class(TCollectionItem)
  private
    pTank: TPanel;
    sFull, sHeadB, sHeadT, sP, sHead, sFill, sValid: TShape; // порядок створення цих об"єктів є дуже важливим
    lblNpName, lblTankNumber, lblCount, lblMaxCount, lblMax: TLabel;
    imError: TImage;
    imZamer: TImage;
    FCount, FMax: Currency;
    FNpName, FNumber, FConstantHint, FVariableHint: string;
    BottomLevel, TopLevel, FNpId, FValid: integer;
    FSelected: boolean;
    FOnTankMouseDown: TMouseEvent;
    FOnSelect: TNotifyEvent;
    FIsGray: boolean;
    FTankState: TTankState;
    FIsAutoZamer: boolean;
    FValidColor: TColor;
    FValidError: boolean;
    procedure SetMax(AValue: Currency);
    procedure SetCount(AValue: Currency);
    procedure SetNpName(AValue: string);
    procedure SetParent(AValue: TWinControl);
    function GetParent: TWinControl;
    procedure SetTop(AValue: integer);
    function GetTop: integer;
    procedure SetLeft(AValue: integer);
    function GetLeft: integer;
    procedure SetHeight(AValue: integer);
    function GetHeight: integer;
    procedure SetWidth(AValue: integer);
    function GetWidth: integer;
    procedure SetSelected(AValue: boolean);

    procedure OnMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure SetNumber(const Value: string);
    procedure SetValid(const Value: integer);
    procedure SetNpId(const Value: integer);
    procedure SetIsGray(const Value: boolean);
    function GetColor: TColor;
    procedure SetConstantHint(const Value: string);
    procedure SetVariableHint(const Value: string);
    function GetHint: string;
    procedure GetColorHeadB();
    procedure SetTankState(const Value: TTankState);
    procedure SetIsAutoZamer(const Value: boolean);
  public
    constructor Create(ACollection: TCollection; AMotherForm: TForm); overload;
    destructor Destroy(); override;
    property Max: Currency read FMax write SetMax;
    property Count: Currency read FCount write SetCount;
    property IsGray: boolean read FIsGray write SetIsGray;
    property NpId: integer read FNpId write SetNpId;
    property NpName: string read FNpName write SetNpName;
    property Parent: TWinControl read GetParent write SetParent;
    property Top: integer read GetTop write SetTop;
    property Left: integer read GetLeft write SetLeft;
    property Height: integer read GetHeight write SetHeight;
    property Width: integer read GetWidth write SetWidth;
    property Selected: boolean read FSelected write SetSelected;
    property Number: string read FNumber write SetNumber;
    property Valid: integer read FValid write SetValid;
    property ValidColor: TColor read FValidColor;
    property ValidError: boolean read FValidError;
    property ConstantHint: string read FConstantHint write SetConstantHint;
    property VariableHint: string read FVariableHint write SetVariableHint;
    property Hint: string read GetHint;
    property Color: TColor read GetColor;
    property State: TTankState read FTankState write SetTankState;
    property IsAutoZamer: boolean read FIsAutoZamer write SetIsAutoZamer;

    property OnTankMouseDown: TMouseEvent read FOnTankMouseDown write FOnTankMouseDown;
    property OnSelect: TNotifyEvent read FOnSelect write FOnSelect;
  end;

  TTankList = class(TCollection)
  private
    FOnSelect: TNotifyEvent;
    FMultiSelect: Boolean;
    FParent: TWinControl;
    function GetItem(Index: integer): TTankItem;
    procedure SetItem(Index: integer; Value: TTankItem);
    function GetSelectedItem: TTankItem;
    function GetSumCount(ANpId: integer): Currency;
    function GetSumMax(ANpId: integer): Currency;
    procedure SetMultiSelect(const Value: Boolean);
  public
    constructor Create(AParent: TWinControl); overload;
    procedure Add(ATank: TTankItem); overload;
    function ItemByNpId(ANpId: integer): TTankItem;
    function ItemByNumber(ANumber: string): TTankItem;
    procedure OnSelectItem(Sender: TObject);

    property OnSelect: TNotifyEvent read FOnSelect write FOnSelect;
    property MultiSelect: Boolean read FMultiSelect write SetMultiSelect;
    property Parent: TWinControl read FParent write FParent;
    property Items[Index: integer]: TTankItem read GetItem write SetItem; default;
    property SelectedItem: TTankItem read GetSelectedItem;
    property SumCount[ANpId: integer]: Currency read GetSumCount;
    property SumMax[ANpId: integer]: Currency read GetSumMax;
  end;

  TTubeItem = class(TTankItem)
    lblFullness: TLabel;
  private
    FCount: Currency;
    procedure SetCount(AValue: Currency);
  public
    constructor Create(ACollection: TCollection; AMotherForm: TForm);
    property Count: Currency read FCount write SetCount;
  end;

  TTubeList = class(TTankList)
  private
    function GetItem(Index: integer): TTubeItem;
    procedure SetItem(Index: integer; Value: TTubeItem);
    function GetSelectedItem: TTubeItem;
  public
    constructor Create(AParent: TWinControl); overload;
    procedure Add(ATank: TTubeItem); overload;
    function ItemByNpId(ANpId: integer): TTubeItem;
    function ItemByNumber(ANumber: string): TTubeItem;
    property Items[Index: integer]: TTubeItem read GetItem write SetItem; default;
    property SelectedItem: TTubeItem read GetSelectedItem;
  end;

  TChartMode = (cmAzs, cmBase, cmBaseOut);

  TRezervImageForm = class(TForm)
    pBottom: TPanel;
    pBtn: TPanel;
    bbCancel: TBitBtn;
    pnlHideFilter: TPanel;
    sbTanksPosition: TSpeedButton;
    pnlTuneGridBtn: TPanel;
    sbFiltersPosition: TSpeedButton;
    pnlTrack: TPanel;
    pnlTanks: TPanel;
    pTank1: TPanel;
    sFull1: TShape;
    sFill1: TShape;
    sHead1: TShape;
    lblNpName1: TLabel;
    lblCount1: TLabel;
    lblMax: TLabel;
    lblMaxCount: TLabel;
    lblTankNumber1: TLabel;
    pnlDetail: TPanel;
    PageControl: TPageControl;
    tsChart: TTabSheet;
    tsParams: TTabSheet;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    RichEdit3: TRichEdit;
    RichEdit4: TRichEdit;
    RichEdit5: TRichEdit;
    tsRezParams: TTabSheet;
    lblTank: TLabel;
    tsHandInMeasure: TTabSheet;
    tsHandInDocs: TTabSheet;
    edActHandly: TEdit;
    edDischargeDate: TDateEdit;
    cbClearDischargeDate: TSpeedButton;
    LblDischargeDate1: TLabel;
    lFrom: TLabel;
    edFrom: TComboEdit;
    lTo: TLabel;
    edTo: TComboEdit;
    gbDateMove: TGroupBox;
    LblDateDoc: TLabel;
    LblDateDocRail: TLabel;
    edDocDate: TDateEdit;
    edDocDateRail: TDateEdit;
    edNP_Type: TComboEdit;
    lNP_Type: TLabel;
    Label8: TLabel;
    edDog: TEdit;
    Label9: TLabel;
    edDogDate: TDateEdit;
    t: TMemoryTable;
    tNak: TStringField;
    tTank_type: TStringField;
    tCountDoc: TFloatField;
    tCount_: TFloatField;
    tND_Norm: TFloatField;
    tND_Error: TFloatField;
    tND_Post: TFloatField;
    tND_Rail: TFloatField;
    tIZ_Norm: TFloatField;
    tIZ_Post: TFloatField;
    tRez: TFloatField;
    tRez_Name: TStringField;
    tIS_DIGITAL_WEIGHT: TFloatField;
    tTECH_LOSS: TFloatField;
    tIsDigitalText: TStringField;
    tWagon_id: TFloatField;
    ds: TOraDataSource;
    DBGrid1: TDBGridEh;
    Label3: TLabel;
    edOper: TComboEdit;
    Label1: TLabel;
    lRail: TLabel;
    edRail: TComboEdit;
    pnlTube: TPanel;
    pTankTube: TPanel;
    sFullTube: TShape;
    sFillTube: TShape;
    lblTankNumberTube: TLabel;
    ActionList: TActionList;
    PopupMenu: TPopupMenu;
    N1: TMenuItem;
    actShowOnDrawing: TAction;
    actShowDrawing: TAction;
    N2: TMenuItem;
    reRezNameValue: TRichEdit;
    reRezValue: TRichEdit;
    lblNpNameTube: TLabel;
    lblFullnessTube: TLabel;
    Action1: TAction;
    DiffChart: TChart;
    OneDiffSeries: TBarSeries;
    qTanksAzs: TOraQuery;
    qChartAzs: TOraQuery;
    qTanksBase: TOraQuery;
    qChartBase: TOraQuery;
    tsMeasureBase: TTabSheet;
    Splitter: TSplitter;
    qChartBaseGroup: TOraQuery;
    tsDocBase: TTabSheet;
    sValid1: TShape;
    pTanksCap: TPanel;
    Panel3: TPanel;
    sbTankCap: TSpeedButton;
    Shape1: TShape;
    Label4: TLabel;
    Shape2: TShape;
    Label5: TLabel;
    Shape3: TShape;
    Label6: TLabel;
    Label7: TLabel;
    Shape4: TShape;
    pnlChart1: TPanel;
    DBChart: TDBChart;
    DiffSeries: TLineSeries;
    FactSeries: TLineSeries;
    BookSeries: TLineSeries;
    FactSeriesPoints: TLineSeries;
    BookSeriesPoints: TLineSeries;
    pnlFilters: TPanel;
    Label10: TLabel;
    pnlChartDate: TPanel;
    lblBeginDate: TLabel;
    lblEndDate: TLabel;
    deBeginDate: TDateEdit;
    deEndDate: TDateEdit;
    cbRests: TComboBox;
    FaderChartTool: TFaderTool;
    CursorChartTool: TCursorTool;
    GridBandChartTool: TGridBandTool;
    TemperSeries: TLineSeries;
    iml: TImageList;
    pnlSums: TPanel;
    pnlSumPark: TPanel;
    lblFillParkValue: TLabel;
    lblFillPark: TLabel;
    lblUnusedPark: TLabel;
    lblUnusedParkValue: TLabel;
    lblWeigthPark: TLabel;
    AnnotationChartTool: TAnnotationTool;
    pnlSumNpColor: TPanel;
    pnlSumTankColor: TPanel;
    Panel5: TPanel;
    lblUnusedTankValue: TLabel;
    lblFillTankValue: TLabel;
    lblWeigthTank: TLabel;
    lblFillTank: TLabel;
    lblUnusedTank: TLabel;
    pnlSumNp: TPanel;
    lblUnusedNpValue: TLabel;
    lblFillNpValue: TLabel;
    lblWeigthNp: TLabel;
    lblFillNp: TLabel;
    lblUnusedNp: TLabel;
    imError1: TImage;
    tTimer: TTimer;
    lblTitleChart: TLabel;
    lblFillParkBook: TLabel;
    lblFillParkDiff: TLabel;
    lblFillParkBookValue: TLabel;
    lblFillParkDiffValue: TLabel;
    ImLegend1: TImage;
    Label2: TLabel;
    Label11: TLabel;
    ImLegend2: TImage;
    lblFillNpBook: TLabel;
    lblFillNpDiff: TLabel;
    lblFillNpDiffValue: TLabel;
    lblFillNpBookValue: TLabel;
    lblFillTankBookValue: TLabel;
    lblFillTankDiffValue: TLabel;
    lblFillTankDiff: TLabel;
    lblFillTankBook: TLabel;
    N3: TMenuItem;
    sHeadB1: TShape;
    sP1: TShape;
    sHeadT1: TShape;
    tsRezervImageSvod: TTabSheet;
    tsBaseTovarOperRef: TTabSheet;
    tsPrihChart: TTabSheet;
    tsRashChart: TTabSheet;
    lblTube: TLabel;
    PopupMenuTank: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    objectPopupMenuTPopupMenu1: TMenuItem;
    N4: TMenuItem;
    SumTimer: TTimer;
    tsTubes: TTabSheet;
    pnlSumParkEx: TOilPanel;
    lblFillParkTubesEx: TLabel;
    lblFillParkEx: TLabel;
    lblWeigthParkEx: TLabel;
    lblFillParkExValue: TLabel;
    lblFillParkTubesExValue: TLabel;
    lblFillParkDiffEx: TLabel;
    lblFillParkBookEx: TLabel;
    lblFillParkBookExValue: TLabel;
    lblFillParkDiffExValue: TLabel;
    lblFillParkTanksExValue: TLabel;
    lblFillParkTanksEx: TLabel;
    lblUnusedParkTanksEx: TLabel;
    lblUnusedParkTanksExValue: TLabel;
    lblUnusedParkTubesExValue: TLabel;
    lblUnusedParkTubesEx: TLabel;
    lblUnusedParkEx: TLabel;
    lblUnusedParkExValue: TLabel;
    lblTanksOtherEx: TLabel;
    lblTanksOtherExValue: TLabel;
    lblTanksRepairExValue: TLabel;
    lblTanksRepairEx: TLabel;
    lblTanksDiagEx: TLabel;
    lblTanksDiagExValue: TLabel;
    lblTanksEx: TLabel;
    lblTanksAllEx: TLabel;
    lblTanksAllExValue: TLabel;
    TimerList: TRxTimerList;
    PnlSumCloseTimer: TRxTimerEvent;
    pcRash: TPageControl;
    tsRashTable: TTabSheet;
    tsRashGraphic: TTabSheet;
    pcPrih: TPageControl;
    tsPrihTable: TTabSheet;
    tsPrihGraphic: TTabSheet;
    bbReOpen: TBitBtn;
    TimerMessaging: TRxTimerEvent;
    imgOpenPanel: TImage;
    tsChartAllFuel: TTabSheet;
    dbcAllFuel: TDBChart;
    CursorTool1: TCursorTool;
    vtChartAllFuel: TVirtualTable;
    ilTabSheets: TImageList;
    dsChartAllFuel: TOraDataSource;
    AllFuelSeries: TBarSeries;
    tsPrihBack: TTabSheet;
    tsRashBack: TTabSheet;
    pnlMainDate: TPanel;
    lblMainDateBegin: TLabel;
    lblMainDateEnd: TLabel;
    deBeginDateMain: TDateEdit;
    deEndDateMain: TDateEdit;
    tsBaseRepDeficit: TTabSheet;
    tsRepDensity: TTabSheet;
    qChartZamer: TOraQuery;
    ZamerBtn: TBitBtn;
    ZamerSeries: TLineSeries;
    ImZamer: TImage;
    ImLegend3: TImage;
    Label12: TLabel;
    bbOnDay: TBitBtn;
    DocSeries: TLineSeries;
    qChartDoc: TOraQuery;
    DiffSeries2: TLineSeries;
    qChartDiff2: TOraQuery;
    cbValidColor: TCheckBox;
    TimerRezError: TRxTimerEvent;
    tsKolebRef: TTabSheet;
    tsMeteringAuto: TTabSheet;
    tsCountDiff: TTabSheet;
    dbcCountDiff: TDBChart;
    vtChartTank: TVirtualTable;
    NpGroupSeries: TLineSeries;
    TankSeries: TAreaSeries;
    ImLegend4: TImage;
    Label13: TLabel;
    imlzamer: TImageList;
    qTanksLastZamerTime: TOraQuery;
    OraAlerter: TOraAlerter;
    tsAutoZamer: TTabSheet;
    MagnifyTool: TMagnifyTool;
    FullScreenTool: TFullScreenTool;
    sbFullScreen: TSpeedButton;
    tsPoteriRez: TTabSheet;
    procedure deBeginDateChange(Sender: TObject);
    procedure deEndDateChange(Sender: TObject);
    procedure sbTanksPositionClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ceAZSButtonClick(Sender: TObject);
    procedure cbTanksCloseUp(Sender: TObject; Accept: Boolean);
    procedure sbFiltersPositionClick(Sender: TObject);
    procedure cbTanksChange(Sender: TObject);
    procedure DBChartZoom(Sender: TObject);
    procedure DBChartUndoZoom(Sender: TObject);
    procedure actShowOnDrawingExecute(Sender: TObject);
    procedure actShowDrawingExecute(Sender: TObject);
    procedure pnlTanksResize(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure sbTankCapClick(Sender: TObject);
    // Отображение информации о точке в хинте
    procedure CursorChartToolChange(Sender: TCursorTool; x, y: Integer;
      const XValue, YValue: Double; Series: TChartSeries; ValueIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbCancelClick(Sender: TObject);
    procedure FactSeriesClickPointer(Sender: TCustomSeries; ValueIndex, X,
      Y: Integer);
    procedure FactSeriesPointsClick(Sender: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure tTimerTimer(Sender: TObject);
    procedure DBChartBeforeDrawSeries(Sender: TObject);
    procedure BookSeriesPointsClick(Sender: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure BookSeriesPointsClickPointer(Sender: TCustomSeries;
      ValueIndex, X, Y: Integer);
    procedure PopupMenuPopup(Sender: TObject);
    procedure AnnotationChartToolClick(Sender: TAnnotationTool;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure actShowOnDrawingUpdate(Sender: TObject);
    procedure objectPopupMenuTPopupMenu1Click(Sender: TObject);
    procedure qChartBaseBeforeOpen(DataSet: TDataSet);
    procedure SumTimerTimer(Sender: TObject);
    procedure pnlSumParkClick(Sender: TObject);
    procedure pnlSumParkExMouseLeave(Sender: TObject);
    procedure pnlSumParkExMouseEnter(Sender: TObject);
    procedure PnlSumCloseTimerTimer(Sender: TObject);
    procedure bbReOpenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerMessagingTimer(Sender: TObject);
    procedure vtChartAllFuelFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure pcPrihChange(Sender: TObject);
    procedure pcRashChange(Sender: TObject);
    procedure cbRestsChange(Sender: TObject);
    procedure ZamerBtnClick(Sender: TObject);
    procedure bbOnDayClick(Sender: TObject);
    procedure TimerRezErrorTimer(Sender: TObject);
    procedure cbValidColorClick(Sender: TObject);
    // Формирование данных для закладки "График колебание разницы"
    procedure tsCountDiffShow(Sender: TObject);
    procedure vtChartTankFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure OraAlerterEvent(Sender: TObject; Event, Message: String);
    procedure FreeAllThread(); // знищуємо усі потоки
    procedure FreeThread(var T: TThreadRefreshQuery); // знищуємо поток
    procedure OraAlerterTimeOut(Sender: TObject; var Continue: Boolean);
    procedure sbFullScreenClick(Sender: TObject);
  private
    FAzsId, FBaseId, MaxFormWidth: integer;
    FUseAzsChoose, FInOnTankMouseDown, FInOnSelectList, FShowed, FIsGrouping,
      FInBeginDateChange, FInEndDateChange: boolean;
    FSelectedList: (slTanks, slTubes);
    sDateBegin, FChartAllFuelDate, FChartAllFuelStartDate: TDateTime; // дата початку аналізу даних
    FChartTankDate{, FChartTankStartDate}: TDateTime;
{$IFDEF OIL}
    fBaseDocsRefForm: TBaseDocsRefForm; // Движение по документам
    fBaseMeteringRefForm: TBaseMeteringRefForm; // Замеры
    fRezMeasureRefForm: TRezMeasureRefForm; // Замеры резервуаров
    fRezervImageSvod: TRezervImageSvodForm;
    fBaseTovarOperRef: TBaseTovarOperRefForm;
    fPrihChart: TPrihChartForm;
    fRashChart: TRashChartForm;
    fTubesForm: TTubesForm;
    fRepDensityForm: TBaseRepDensityForm;
    fKolebRefForm: TBaseKolebRefForm;
    fBaseMeteringAutoRef: TBaseMeteringAutoRefForm;
    fBaseAutoZamerRef: TBaseAutoZamerRefForm;
    fPoteriRefForm: TBaseRepPoteriRezForm;
{$ENDIF}
    fRezRashBaseForm: TRezRashBaseForm;
    fRezPrihBaseForm: TRezPrihBaseForm;
    fBaseRepDeficitForm: TBaseRepDeficitForm;
    FZoomRatio: integer;
    FChartMode: TChartMode;
    ARecThread: TRecThread; // списки потоків перезапуску запитів
    LRecThread: TList;
    RezLogName: string; // лог

    //--------------------------------------------------------------------------
    procedure CreateTubeItems(ADataSet: TDataSet;
      AList: TTubeList; ATip: integer);
    procedure EditTube(ADataSet: TDataSet; At: TTubeItem); // ЗАВАНТАЖУЄМО нові дані по трубам

    procedure CreateTankItems(ADataSet: TDataSet;
      AList: TTankList; ATip: integer);
    procedure EditTank(ADataSet: TDataSet; At: TTankItem); // ЗАВАНТАЖУЄМО нові дані по резервуарам
    //--------------------------------------------------------------------------

    function FormatWeigth(AValue: Currency; ACurrencyString: string = 'кг.'): string;
    function SignChar(AValue: Real): string;

    procedure RezLog(s: string); // лог
    // Обновление информации на графике
    procedure RefreshChart(ReOpen: boolean = true);
    // Формирование данных для закладки "Главная"
    procedure RefreshMainChart();
    procedure DisableCharts;
    procedure EnableCharts;
    // Обновление информации в резервуарах
    procedure RefreshTanks(ReOpen: boolean = true);
    // Обновление информации на панеле с итогами
    procedure RefreshSums();
    procedure SetAzsId(AValue: integer);
    procedure SetBaseId(const Value: integer);
    procedure ResizeForm;
    procedure SetUseAzsChoose(const Value: boolean);
    procedure SetTankNumber(const Value: string);
    function GetTankNumber: string;
    function qChart: TOraQuery;
    function qTanks: TOraQuery;
    function GetSelectedList: TTankList;
    procedure SetBookAnnotation(AValueIndex: integer);
    procedure SetFactAnnotation(AValueIndex: integer; AValueZamerIndex: integer; AValueDocIndex: integer);
    procedure SetParams(AQuery: TOraQuery);

    function GetBeginDate: TDateTime;
    function GetEndDate: TDateTime;
  protected
    procedure RefreshTanksFalse();
  public
    Tanks: TTankList;
    Tubes: TTubeList;
    DateBegin, DateEnd: TDateTime;

    ObjSender: TObject;
    ObjButton: TMouseButton;
    iClick: integer;
    bMouseDown, bRefreshTanksFalse: boolean;

    constructor Create(AOwner: TComponent); overload;
    destructor Destroy(); override;
    class procedure TestForm;

    procedure OnItemMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure OnItemMouseDownDet(Sender: TObject);

    procedure OnSelectList(Sender: TObject);
    property AzsId: integer read FAzsId write SetAzsId;
    property BaseId: integer read FBaseId write SetBaseId;
    property UseAzsChoose: boolean read FUseAzsChoose write SetUseAzsChoose default false;
    property TankNumber: string read GetTankNumber write SetTankNumber;
    property ChartMode: TChartMode read FChartMode write FChartMode;
    property BeginDate: TDateTime read GetBeginDate;
    property EndDate: TDateTime read GetEndDate;
  end;

var
  RezervImageForm: TRezervImageForm;

implementation

uses ExFunc, Main, UDbFunc, ShellApi, Math
{$IFDEF OIL}, uExeSql, ChooseOrg{$ENDIF}
{$IFDEF OILAVIAS}, uExFunc{$ENDIF};

{$R *.dfm}

procedure SetSizes(AFromControl: TControl; AToControl: TControl);
begin
  AToControl.Top := AFromControl.Top;
  AToControl.Left := AFromControl.Left;
  AToControl.Width := AFromControl.Width;
  AToControl.Height := AFromControl.Height;
end;

procedure SetImage(AParent: TWinControl; AFromImage: TImage; AToImage: TImage; AMouseEvent: TMouseEvent);
begin
  SetSizes(AFromImage, AToImage);
  AToImage.Parent := AParent;

  AToImage.Center := AFromImage.Center;
  AToImage.Transparent := AFromImage.Transparent;
  AToImage.OnDblClick := AFromImage.OnDblClick;
  AToImage.OnClick := AFromImage.OnClick;

  //AToImage.Align := alClient;
  AToImage.OnMouseUp := AMouseEvent;
end;

procedure SetShape(AParent: TWinControl; AFromShape: TShape; AToShape: TShape; AMouseEvent: TMouseEvent);
begin
  SetSizes(AFromShape, AToShape);
  AToShape.Parent := AParent;
  AToShape.Shape := AFromShape.Shape;
  AToShape.Pen := AFromShape.Pen;
  AToShape.Brush := AFromShape.Brush;
  AToShape.Visible := AFromShape.Visible;
  AToShape.OnMouseUp := AMouseEvent;
end;

procedure SetLabel(AParent: TWinControl; AFromLabel: TLabel; AToLabel: TLabel; AMouseEvent: TMouseEvent);
begin
  AToLabel.AutoSize := AFromLabel.AutoSize;
  AToLabel.Alignment := AFromLabel.Alignment;
  AToLabel.Caption := AFromLabel.Caption;
  SetSizes(AFromLabel, AToLabel);
  AToLabel.Parent := AParent;
  AToLabel.Font := AFromLabel.Font;
  AToLabel.Color := AFromLabel.Color;
  AToLabel.Transparent := AFromLabel.Transparent;
  AToLabel.OnMouseUp := AMouseEvent;
  AToLabel.Visible := AFromLabel.Visible;
end;

function GetFuelColor(AFuelId: integer): TColor;
begin
  case AFuelId of
    4, 5: // - 76 - желтый
      Result := $005BFFFF;
    6: // - 92 - зеленый
      Result := $0000AE00;
    7: // - 95 - красный
      Result := $002020FF;
    3: // - ДТ - синий
      Result := $00FF7777;
    76: // - А-95 Pr - бардовый
      Result := $000000B0; //clMaroon;
    else
      Result := $003E9EFF;
  end;
end;

{ TTankItem }

constructor TTankItem.Create(ACollection: TCollection; AMotherForm: TForm);
var
  RezervImageForm: TRezervImageForm;
begin
  inherited Create(ACollection);
  RezervImageForm := AMotherForm as TRezervImageForm;
  // Создание объекта-резервуара
  // порядок створення цих об"єктів є дуже важливим
  // pTank
  pTank := TPanel.Create(RezervImageForm);
  pTank.Parent := RezervImageForm.pTank1.Parent;
  SetSizes(RezervImageForm.pTank1, pTank);
  pTank.OnMouseUp := OnMouseUp;
  pTank.PopupMenu := RezervImageForm.pTank1.PopupMenu;
  // sHeadB
  sHeadB := TShape.Create(pTank);
  SetShape(pTank, RezervImageForm.sHeadB1, sHeadB, OnMouseUp);
  // sFull
  sFull := TShape.Create(pTank);
  SetShape(pTank, RezervImageForm.sFull1, sFull, OnMouseUp);
  // sFill
  sFill := TShape.Create(pTank);
  SetShape(pTank, RezervImageForm.sFill1, sFill, OnMouseUp);
  // sP
  sP := TShape.Create(pTank);
  SetShape(pTank, RezervImageForm.sP1, sP, OnMouseUp);
  // sHeadT
  sHeadT := TShape.Create(pTank);
  SetShape(pTank, RezervImageForm.sHeadT1, sHeadT, OnMouseUp);
  // sHead
  sHead := TShape.Create(pTank);
  SetShape(pTank, RezervImageForm.sHead1, sHead, OnMouseUp);
  // imError
  imError := TImage.Create(pTank);
  SetImage(pTank, RezervImageForm.imError1, imError, OnMouseUp);
  // imZamer
  imZamer := TImage.Create(pTank);
  SetImage(pTank, RezervImageForm.imZamer, imZamer, OnMouseUp);
  // lblNpName
  lblNpName := TLabel.Create(pTank);
  SetLabel(pTank, RezervImageForm.lblNpName1, lblNpName, OnMouseUp);
  // sValid
  sValid := TShape.Create(pTank);
  SetShape(pTank, RezervImageForm.sValid1, sValid, OnMouseUp);
  sValid.Visible := false;
  // lblTankNumber
  lblTankNumber := TLabel.Create(pTank);
  SetLabel(pTank, RezervImageForm.lblTankNumber1, lblTankNumber, OnMouseUp);
  // lblCount
  lblCount := TLabel.Create(pTank);
  SetLabel(pTank, RezervImageForm.lblCount1, lblCount, OnMouseUp);
  // lblMaxCount
  lblMaxCount := TLabel.Create(pTank);
  SetLabel(pTank, RezervImageForm.lblMaxCount, lblMaxCount, OnMouseUp);
  Self.Max := 10000;
  // lblMax
  lblMax := TLabel.Create(pTank);
  SetLabel(pTank, RezervImageForm.lblMax, lblMax, OnMouseUp);
  // Читаем параметры
  BottomLevel := sFill.Top + sFill.Height;
  TopLevel := sFull.Top;
end;

destructor TTankItem.Destroy();
begin
{  sHead.Free;
  sHeadB.Free;
  sHeadT.Free;
  sP.Free;
  sFull.Free;
  lblNpName.Free;
  lblTankNumber.Free;
  lblCount.Free;
  sFill.Free;
  sValid.Free;
  pTank.Free;
  ImZamer.free;}
  inherited;
end;

procedure TTankItem.SetMax(AValue: Currency);
begin
  FMax := AValue;
  lblMaxCount.Caption := FloatToStr(AValue) + ' л.';
end;

procedure TTankItem.GetColorHeadB();
begin
  if sFill.Height = 0 then
  begin
    sHeadB.Brush.Color := clWhite;
    sHeadT.Brush.Color := clWhite;
    sP.Brush.Color := clWhite;

    sHeadT.Visible := false
  end
  else
  begin
    sHeadB.Brush.Color := sFill.Brush.Color;
    sHeadT.Brush.Color := sFill.Brush.Color;
    sP.Brush.Color := sFill.Brush.Color;

    sHeadT.Top := sFill.Top - trunc(sHeadT.Height / 2);
    sHeadT.Visible := true;
  end;
end;

procedure TTankItem.SetCount(AValue: Currency);
var
  vCount: Currency;
begin
  FCount := AValue;
  // Проверка на корректность данных
  if FCount > Max then
  begin
    vCount := Max;
    lblCount.Font.Color := clRed;
  end
  else if FCount < 0 then
  begin
    vCount := 0;
    lblCount.Font.Color := clRed;
  end
  else
  begin
    vCount := FCount;
    lblCount.Font.Color := clWindow;
  end;

  if AValue = 0 then
    lblCount.Caption := '-'
  else
    lblCount.Caption := FloatToStr(AValue) {+' л.'};
  lblCount.Repaint;

  // Прорисовуем уровень в резервуаре
  if (FCount = 0) or (Max = 0) then
    sFill.Height := 0
  else
    sFill.Height := trunc((Self.BottomLevel - Self.TopLevel) / Max * vCount);
  if (sFill.Height = 0) and (FCount > 0) then
    sFill.Height := 1;
  sFill.Top := -sFill.Height + Self.BottomLevel;
  GetColorHeadB();
  SFill.Repaint;
end;

procedure TTankItem.SetNpName(AValue: string);
begin
  FNpName := AValue;
  lblNpName.Caption := FNpName;
  if length(FNpName) > 4 then
  begin
    lblNpName.Font.Name := 'MS Serif';
    lblNpName.Font.Style := [];
  end
  else
  begin
    lblNpName.Font.Name := 'MS Sans Serif';
    lblNpName.Font.Style := [fsBold];
  end;
end;

procedure TTankItem.SetParent(AValue: TWinControl);
begin
  pTank.Parent := AValue;
end;

function TTankItem.GetParent: TWinControl;
begin
  Result := pTank.Parent;
end;

procedure TTankItem.SetTop(AValue: integer);
begin
  pTank.Top := AValue;
end;

function TTankItem.GetTop: integer;
begin
  Result := pTank.Top;
end;

procedure TTankItem.SetLeft(AValue: integer);
begin
  pTank.Left := AValue;
end;

function TTankItem.GetLeft: integer;
begin
  Result := pTank.Left;
end;

procedure TTankItem.SetHeight(AValue: integer);
begin
  pTank.Height := AValue;
end;

function TTankItem.GetHeight: integer;
begin
  Result := pTank.Height;
end;

procedure TTankItem.SetWidth(AValue: integer);
begin
  pTank.Width := AValue;
end;

function TTankItem.GetWidth: integer;
begin
  Result := pTank.Width;
end;

procedure TTankItem.SetSelected(AValue: boolean);
var
  Color: TColor;
begin
  FSelected := AValue;
  if FSelected then
  begin
    if sFill.Brush.Color = $002020FF then
      Color := $00000064
    else
      Color := $00000064;
    lblNpName.Font.Color := Color;
    lblTankNumber.Font.Color := Color;
    pTank.Color := clBtnShadow;
    if Assigned(FOnSelect) then
      FOnSelect(Self);
  end
  else
  begin
    lblNpName.Font.Color := clBlack;
    lblTankNumber.Font.Color := clBlack;
    pTank.Color := clBtnFace;
  end;
end;

procedure TTankItem.OnMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  pTank.BevelOuter := bvNone;
  pTank.Repaint;
  Self.Selected := True;
  sleep(100);
  pTank.BevelOuter := bvRaised;
  if Assigned(FOnTankMouseDown) then
    FOnTankMouseDown(Self, Button, Shift, X, Y);
end;

procedure TTankItem.SetNumber(const Value: string);
begin
  FNumber := Value;
  lblTankNumber.Caption := Value;
end;

procedure TTankItem.SetValid(const Value: integer);
begin
  FValid := Value;
  sValid.Visible := true;

  if FValid < 4 then
    sValid.Brush.Color := $0000AE00
    else
    if FValid < 15 then
      sValid.Brush.Color := $0000DFDF
    else
      sValid.Brush.Color := $002020FF;

  FValidColor := sValid.Brush.Color;
end;

procedure TTankItem.SetNpId(const Value: integer);
begin
  FNpId := Value;
  //Self.NpName := copy(nvl(GetQValueByIdInst('name', 'v_oil_np_group', FNpId, 0), ''),1,7);
  if not IsGray then
    sFill.Brush.Color := GetFuelColor(FNpId);
  GetColorHeadB();
end;

procedure TTankItem.SetIsGray(const Value: boolean);
begin
  FIsGray := Value;
  if FIsGray then
  begin
    sFill.Brush.Color := clGray;
    GetColorHeadB();
  end
  else
    SetNpId(FNpId);
end;

function TTankItem.GetColor: TColor;
begin
  Result := sFill.Brush.Color;
end;

procedure TTankItem.SetConstantHint(const Value: string);
begin
  FConstantHint := Value;
  if Hint <> '' then
    pTank.ShowHint := True;
  pTank.Hint := Hint;
end;

procedure TTankItem.SetVariableHint(const Value: string);
begin
  FVariableHint := Value;
  if Hint <> '' then
    pTank.ShowHint := True;
  pTank.Hint := Hint;
end;

function TTankItem.GetHint: string;
begin
  Result := ConstantHint + #13#10 + VariableHint;
end;

procedure TTankItem.SetTankState(const Value: TTankState);
begin
  FTankState := Value;
  if Value = tsRepair then
    lblNpName.Visible := False;
end;

procedure TTankItem.SetIsAutoZamer(const Value: boolean);
begin
  imzamer.visible:=Value;
  FIsAutoZamer := Value;
end;

{ TTankList }

constructor TTankList.Create(AParent: TWinControl);
begin
  inherited Create(TTankItem);
  Parent := AParent;
  FMultiSelect := False;
end;

function TTankList.GetItem(Index: integer): TTankItem;
begin
  Result := TTankItem(inherited Items[Index]);
end;

procedure TTankList.SetItem(Index: integer; Value: TTankItem);
begin
  //  inherited Items[Index] := Value;
  inherited SetItem(Index, TCollectionItem(Value));
end;

function TTankList.GetSelectedItem: TTankItem;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    if Items[i].Selected then
      Result := Items[i];
  end;
end;

procedure TTankList.Add(ATank: TTankItem);
const
  TanksPerRow = 23;
  BetweenItemsHor = 3;
  BetweenItemsVer = 3;
var
  Row: integer;
begin
  ATank.Top := 5;
  ATank.Left := 3 + (BetweenItemsHor + ATank.Width) * (Self.Count - 1);
  // Перенос на новую строку
  Row := trunc((Self.Count - 1) / TanksPerRow);
  ATank.Top := ATank.Top + (ATank.Height + BetweenItemsVer) * Row;
  ATank.Left := ATank.Left - ((BetweenItemsHor + ATank.Width) * TanksPerRow) * Row;
  ATank.OnSelect := Self.OnSelectItem;
  if Self.Count = 1 then
    ATank.Selected := True;
end;

function TTankList.ItemByNpId(ANpId: integer): TTankItem;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    if Items[i].NpId = ANpId then
      Result := Items[i];
  end;
end;

function TTankList.ItemByNumber(ANumber: string): TTankItem;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  begin
    if Items[i].Number = ANumber then
      Result := Items[i];
  end;
end;

procedure TTankList.OnSelectItem(Sender: TObject);
var
  i: integer;
begin
  if (Sender is TTankItem) or (Sender is TTubeItem) then
  begin
    if (Sender as TTankItem).Selected and not Self.MultiSelect then
    begin
      for i := 0 to Count - 1 do
        if ((Sender as TTankItem) <> Items[i]) and Items[i].Selected then
          Items[i].Selected := False;
    end;
  end;
  if Assigned(FOnSelect) then
    FOnSelect(Self);
end;

function TTankList.GetSumCount(ANpId: integer): Currency;
var
  i: integer;
begin
  Result := 0;
  for i := 0 to Count - 1 do
  begin
    if (Items[i].NpId = ANpId) or (ANpId = -1) then
      Result := Result + Items[i].Count;
  end;

end;

function TTankList.GetSumMax(ANpId: integer): Currency;
var
  i: integer;
begin
  Result := 0;
  for i := 0 to Count - 1 do
  begin
    if (Items[i].NpId = ANpId) or (ANpId = -1) then
      Result := Result + Items[i].Max;
  end;
end;

procedure TTankList.SetMultiSelect(const Value: Boolean);
var
  i: integer;
begin
  FMultiSelect := Value;
  for i := 0 to Count - 1 do
  begin
    Items[i].Selected := False;
    Items[i].IsGray := False;
  end;
end;

{ TRezervImageForm }

constructor TRezervImageForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF OIL}
  LoadSQLByForm(TForm(Self));
{$ENDIF}
{$IFDEF OIL}
  if INST = 624 then
    sDateBegin := StrToDate('01.03.2010')
  else
{$ENDIF}
    sDateBegin := StrToDate('01.01.2000');
  Tanks := TTankList.Create(Self);
  Tubes := TTubeList.Create(Self);
  Tanks.OnSelect := OnSelectList;
  Tubes.OnSelect := OnSelectList;
  pTank1.Visible := False;
  MaxFormWidth := 0;
  FInOnTankMouseDown := False;
  FInOnSelectList := False;
  FShowed := False;
  FIsGrouping := False;
end;

destructor TRezervImageForm.Destroy();
begin
  Tanks.Free;
  Tubes.Free;
  inherited;
end;

class procedure TRezervImageForm.TestForm;
{var
  f: TRezervImageForm;
  t: TTank;  }
begin
  {  f := TRezervImageForm.Create(nil);
    try
      t := TTankItem.Create(f.Tanks,f);
      t.Count := 1000;
      t.NpName := 'A-80';
      f.Tanks.Add(t);
      t := TTankItem.Create(f.Tanks,f);
      t.Count := 2000;
      t.NpName := 'A-95';
      f.Tanks.Add(t);
      t := TTankItem.Create(f.Tanks,f);
      t.Count := 4000;
      t.NpName := 'ДТ';
      f.Tanks.Add(t);
      t := TTankItem.Create(f.Tanks,f);
      t.Count := 8000;
      t.NpName := 'A-92';
      f.Tanks.Add(t);
      t := TTankItem.Create(f.Tanks,f);
      t.Count := 10000;
      t.NpName := 'A-95Pr';
      f.Tanks.Add(t);
      f.ShowModal;
    finally
      f.Free;
    end;     }
end;

procedure TRezervImageForm.OnItemMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ObjButton := Button;
  OnItemMouseDownDet(Sender);
end;

procedure TRezervImageForm.OnItemMouseDownDet(Sender: TObject);
var
  i: integer;
begin
  ObjSender := Sender; // для кліка
  iClick := iClick + 1;

  if iClick > 1 then
  begin
    if bMouseDown then
      exit; // щоб не було повторного входу
    bMouseDown := true;

    tTimer.Enabled := false;
    FInOnTankMouseDown := True;
    try
      if (Sender is TTankItem) or (Sender is TTubeItem) then
      begin
        ((Sender as TTankItem).Collection as TTankList).MultiSelect := True;

        for i := 0 to ((Sender as TTankItem).Collection as TTankList).Count - 1 do
        begin
          if ((Sender as TTankItem).Collection as TTankList).Items[i].NpId = (Sender as TTankItem).NpId then
            ((Sender as TTankItem).Collection as TTankList).Items[i].Selected := True
          else
            ((Sender as TTankItem).Collection as TTankList).Items[i].IsGray := True;
        end;
        RefreshChart;
      end;
    finally
      tTimer.Enabled := false;
      iClick := 0;
      FInOnTankMouseDown := False;

      bMouseDown := false; // щоб не було повторного входу
    end;
  end
  else
    tTimer.Enabled := true;
end;

procedure TRezervImageForm.tTimerTimer(Sender: TObject);
begin // ObjSender - об"єкт із кліка
  if bMouseDown then
    exit; // щоб не було повторного входу
  bMouseDown := true;

  FInOnTankMouseDown := True;
  try
    if ((ObjSender as TTankItem).Collection as TTankList).MultiSelect then
      ((ObjSender as TTankItem).Collection as TTankList).MultiSelect := False;

    if (ObjSender is TTankItem) or (ObjSender is TTubeItem) then
    begin
      (ObjSender as TTankItem).Selected := True;
      RefreshChart;

      // клік по трубі викликає графік нафтобази
      if (ObjSender is TTubeList) or (ObjSender is TTubeItem) then
        if ObjButton = mbLeft then
          RezervImageForm.actShowDrawingExecute(nil);
    end;
  finally
    tTimer.Enabled := false;
    iClick := 0;
    FInOnTankMouseDown := False;

    bMouseDown := false; // щоб не було повторного входу
  end;
end;

procedure TRezervImageForm.SetAzsId(AValue: integer);
var
  i: integer;
begin
  FAzsId := AValue;
  FChartMode := cmAzs;

  if qTanks.Active then
    qTanks.Close;
  qTanks.ParamByName('azs_id').AsInteger := FAzsId;
  qTanks.Open;

  CreateTankItems(qTanks, Tanks, 1);
  CreateTubeItems(qTanks, Tubes, 2);
  Self.Caption := qTanks.FieldByName('azs_name').AsString;
  //ceAZS.Text := qTanks.FieldByName('azs_name').AsString;

  for i := 0 to PageControl.PageCount - 1 do
    PageControl.Pages[i].TabVisible := False;
  tsChart.TabVisible := true;

  cbRests.Enabled := false;
end;

procedure TRezervImageForm.SetBaseId(const Value: integer);
begin
  FBaseId := Value;

  if FChartMode = cmBase then
  begin
    tsPrihChart.TabVisible := false; // Анализ приходов
    tsRashChart.TabVisible := false; // Анализ отпусков
    tsMeasureBase.TabVisible := false; // Замеры "Base"
    tsHandInDocs.TabVisible := false; // Ввод документов
    tsDocBase.TabVisible := false; // Документы "Base"
    tsBaseTovarOperRef.TabVisible := false; // Товарные операции
    cbRests.ItemIndex := 1; // Книжные остатки
  end;

  tsHandInDocs.TabVisible := false; // Ввод документов
  tsParams.TabVisible := false; // Замеры уровнемеров
  tsRezParams.TabVisible := false; // Параметры резервуара

  if qTanks.Active then
    qTanks.Close;
  qTanks.ParamByName('org_inst').AsInteger := FBaseId;
  qTanks.Open;

  DefineRepDates(deEndDate.Date, deEndDate.Date);
  if qTanksLastZamerTime.Active then
    qTanksLastZamerTime.Close;
  qTanksLastZamerTime.Open;

  CreateTankItems(qTanks, Tanks, 1);
  CreateTubeItems(qTanks, Tubes, 2);
  qTanks.First;

  //DONE: Вывести организацию
  Self.Caption :=
    {$IFDEF OIL}//Для Oil
    'OilBase - Система поддержки и принятия решений на нефтебазе, версия '
    + VERSION.FileVersion + ', ' + MAIN_ORG.Name
    {$ELSE} // Для OilAvias
    'Мониторинг и анализ принятия решений на нефтебазе, '
    + DefaultSession.ExecSqlEx(
      'begin select name into :Result from andriy.oil_org where id=inst and id = :id; end;',
      ['id', FBaseId])
    {$ENDIF};
end;

procedure TRezervImageForm.deBeginDateChange(Sender: TObject);
var
  day, month, year: word;
  date1, date2: TDateTime;
  i: integer;
begin
  if not FInBeginDateChange then
  begin
    FInBeginDateChange := True;

    if FShowed then
    begin
      OraAlerter.Stop; // вимикаємо перебудову запитів
      FreeAllThread(); // знищуємо усі потоки
    end;

    deBeginDate.Date := (Sender as TDateEdit).Date;
    try
      if deBeginDate.Date < sDateBegin then
        deBeginDate.Date := sDateBegin
      else if deBeginDate.Date > deEndDate.Date then
      begin
        // Дату конца выставляем
        DecodeDate(deBeginDate.Date, Year, Month, Day);
        GetMonthLimits(month, year, date1, date2);
        deEndDate.Date := date2;
        // Выставляем количество в резервуарах
        // Self.RefreshTanks;
      end;

      qChartBase.Close;
      qChartBaseGroup.Close;
      qChartZamer.Close;
      qChartDoc.Close;
      qChartDiff2.Close;

      if GetSelectedList.MultiSelect then
      begin
        GetSelectedList.MultiSelect := False;
        GetSelectedList.Items[0].Selected := True;
      end;

      for i := 0 to DBChart.SeriesCount - 1 do
        if DbChart.Series[i].DataSource <> nil then
        begin
          Self.RefreshChart; // Обновляем граффик
          break;
        end;
    finally
      deBeginDateMain.Date := deBeginDate.Date;
      deEndDateMain.Date := deEndDate.Date;

      if FShowed then
        OraAlerter.Start; // вмикаємо перебудову запитів

      FInBeginDateChange := False;
    end;
  end;
end;

procedure TRezervImageForm.RefreshChart(ReOpen: boolean = true);

//****************************************************************************

procedure AnimationFill;
  var
    i, maxi: integer;
    minval, maxval: Double;
  begin
    qChart.DisableControls;
    qChart.First;
    minval := qChart.FieldByName('mdate').AsFloat;
    qChart.Last;
    maxval := qChart.FieldByName('mdate').AsFloat;
    DbChart.BottomAxis.SetMinMax(minval, maxval);
    minval := 0;
    maxval := 0;
    qChart.First;
    while not qChart.Eof do
    begin
      minval := min(qChart.FieldByName('curamount').AsFloat, minval);
      minval := min(qChart.FieldByName('litres_all').AsFloat, minval);
      minval := min(qChart.FieldByName('diff').AsFloat, minval);

      maxval := max(qChart.FieldByName('curamount').AsFloat, maxval);
      maxval := max(qChart.FieldByName('litres_all').AsFloat, maxval);
      maxval := max(qChart.FieldByName('diff').AsFloat, maxval);
      qChart.Next;
    end;
    // Высталяем минимум и максимум для графика с зазором в 10%
    DbChart.LeftAxis.SetMinMax(minval - abs(minval * 0.1), maxval + abs(maxval * 0.1));

    maxi := qChart.FieldByName('rn').AsInteger;

    for i := 1 to maxi do
    begin
      qChart.DisableControls;
      qChart.Filtered := False;
      qChart.Filter := 'rn < ' + IntToStr(i);
      qChart.Filtered := True;
      qChart.EnableControls;
      DbChart.RefreshData;
      DbChart.Repaint;
      sleep(50);
    end;
    qChart.Filtered := False;
  end;
  //****************************************************************************

var
  i: integer;
  vMin, vMax, vDiff: Double;
//  minval, maxval: Double;
begin
  if not FShowed then
    Exit;
    
  if not qChart.ControlsDisabled then
  begin
    DBChart.AutoRefresh := False;
    qChart.DisableControls;
    qChartZamer.DisableControls;
    qChartDoc.DisableControls;
    qChartDiff2.DisableControls;
    try
      if ReOpen then
      begin
        if not qChart.Active then
        begin
          SetParams(qChart);
          Screen.Cursor := crSQLWait;
          try
            qChart.Open;
          finally
            Screen.Cursor := crDefault;
          end;
        end;
      end;

      if not qChartZamer.Active then
      begin
        SetParams(qChartZamer);
        Screen.Cursor := crSQLWait;
        try
          qChartZamer.Open;
        finally
          Screen.Cursor := crDefault;
        end;
      end;

      if not qChartDoc.Active then
      begin
        SetParams(qChartDoc);
        Screen.Cursor := crSQLWait;
        try
          qChartDoc.Open;
        finally
          Screen.Cursor := crDefault;
        end;
      end;

      if not qChartDiff2.Active then
      begin
        SetParams(qChartDiff2);
        //DefineRepDates(deBeginDate.Date,deEndDate.Date);
        Screen.Cursor := crSQLWait;
        try
          qChartDiff2.Open;
        finally
          Screen.Cursor := crDefault;
        end;
      end;

      qChart.Filtered := False;
      qChart.Filter := ' is_chart = 1 ';
      qChartZamer.Filtered := False;
      qChartDoc.Filtered := False;
      qChartDiff2.Filtered := False;

      DocSeries.Visible   := not GetSelectedList.MultiSelect;
      ZamerSeries.Visible := not GetSelectedList.MultiSelect;
      //DiffSeries2.Visible := not GetSelectedList.MultiSelect;

      if not GetSelectedList.MultiSelect then
      begin
        qChart.Filter := qChart.Filter + ' and numb = ' + QuotedStr(GetSelectedList.SelectedItem.Number);
        qChartZamer.Filter := ' numb = ' + QuotedStr(GetSelectedList.SelectedItem.Number);
        qChartDoc.Filter := ' numb = ' + QuotedStr(GetSelectedList.SelectedItem.Number);
        qChartDiff2.Filter := ' numb = ' + QuotedStr(GetSelectedList.SelectedItem.Number);
      end
      else
      begin
        qChart.Filter := qChart.Filter + ' and fuel_id = ' + IntToStr(GetSelectedList.SelectedItem.NpId);
        qChartZamer.Filter := ' numb = ''-1'' ';
        qChartDoc.Filter := ' numb = ''-1'' ';
        qChartDiff2.Filter := ' numb = ''-1'' ';
      end;

      qChart.Filtered := True;
      qChartZamer.Filtered := True;
      qChartDoc.Filtered := True;
      qChartDiff2.Filtered := True;
    finally
      qChart.EnableControls;
      qChartZamer.EnableControls;
      qChartDoc.EnableControls;
      qChartDiff2.EnableControls;
     
      DBChart.AutoRefresh := false;
      for i := 0 to DBChart.SeriesCount - 1 do
        if not( (DbChart.Series[i] = ZamerSeries) or (DbChart.Series[i] = DocSeries)
           or  (DbChart.Series[i] = DiffSeries2)) then
        begin
          DbChart.Series[i].DataSource := nil; // для корретного фонового оновлення запиту графіка
          DbChart.Series[i].DataSource := qChart;
        end;
      DbChart.Refresh;
      DbChart.RefreshData;
      DBChart.AutoRefresh := True;
    end;
  end;

  if not ((PageControl.ActivePage = tsChartAllFuel) or (PageControl.ActivePage = tsCountDiff))
    and ReOpen then
    PageControl.ActivePage := tsChart;

  // Делаем так чтобы на шкале слева всегда был виден ноль
  // И увеличиваем предел шкалы на 10% от предельного значения на графике
  DbChart.LeftAxis.AutomaticMaximum := True;
  DbChart.LeftAxis.AutomaticMinimum := True;
  DbChart.LeftAxis.CalcMinMax(vMin, vMax);
  vDiff := max(abs(max(vMax, 0) - min(vMin, 0)), 100);

  ZamerSeries.DataSource := qChartZamer; // проставляємо ссилку на DataSet

  // малюємо автозаміри червоним, якщо період їх відсутності більше 1 години
  for i := 0 to ZamerSeries.XValues.Count - 1 do
    if ZamerSeries.XValues[i+1] - ZamerSeries.XValues[i] > 1/24 then
      ZamerSeries.ValueColor[i+1] := $0000DDDD;

  DbChart.LeftAxis.SetMinMax(Min(vMin - vDiff * 0.1, 0), max(vMax + vDiff * 0.1, 0));

  // FaderChartTool.Start;
  // Плавная прорисовка графика
  // AnimationFill;
  // Нужно создать тул который будет делать и фадер и эту обработку.

  OneDiffSeries.Clear;
  if DiffSeries.YValues.Count <> 0 then
    OneDiffSeries.AddBar(DiffSeries.YValue[DiffSeries.YValues.Count - 1], '', clTeeColor);
  FZoomRatio := 100;
  AnnotationChartTool.Active := False;
  RefreshSums();
end;

procedure TRezervImageForm.RefreshTanks(ReOpen: boolean = true);
var
  i: integer;
  sFieldPr, sFieldValue, sHint, sPogrValue: string;
{  sPorgPeriodValue1, sPorgPeriodValue2: Double;     }
begin
  if not FShowed then
    exit;

  qChartBase.DisableControls;
  try
    if ReOpen then
    begin
      if qChartBase.Active then
        qChartBase.Close;
      SetParams(qChartBase);
      qChartBase.Open;

      if qChartZamer.Active then
        qChartZamer.Close;
      if qChartDoc.Active then
        qChartDoc.Close;
      if qChartDiff2.Active then
        qChartdiff2.Close;
    end;

    // відображення заповненості резервуарів
    case cbRests.ItemIndex of
      0: // Отображать по замерам
        begin
          sFieldPr := 'is_gauged';
          sFieldValue := 'LITRES_ALL';
        end;
      1: // Книжные остатки Base
        begin
          sFieldPr := 'is_book_rests';
          sFieldValue := 'curamount';
        end;
      2: // Книжные усреднённые
        begin
          sFieldPr := 'is_initial_rests';
          sFieldValue := 'curamount';
        end;
    end;

    for i := 0 to Tanks.Count - 1 do
    begin
      qTanks.Filtered := False;
      qTanks.Filter   := 'tip = 1 and numb = '+ QuotedStr(Tanks[i].Number);
      qTanks.Filtered := True;
      EditTank(qTanks, Tanks[i]); // ЗАВАНТАЖУЄМО нові дані по резервуарам

      // вставляємо висоту палива
      qChartBase.Filtered := False;
      if cbRests.ItemIndex = 0 then
        qChartBase.Filter := ' ' + sFieldPr + ' = 1 and numb = ' + QuotedStr(Tanks[i].Number)
      else
        qChartBase.Filter := ' ' + sFieldPr + ' = 1 and fuel_id = ' + IntToStr(Tanks[i].NpId) + ' and numb = ' + QuotedStr(Tanks[i].Number);
      qChartBase.Filtered := True;

      if not qChartBase.IsEmpty then
      begin
        Tanks[i].Count := qChartBase.FieldByName(sFieldValue).AsInteger;

        // проставляємо валідність резервуара
        Tanks[i].Valid := qChartBase.FieldByName('valid').AsInteger;
        if qChartBase.FieldByName('FACT_FUEL_NAME_CONTINUOS').AsString <> '' then
        begin
          Tanks[i].NpId := qChartBase.FieldByName('FACT_FUEL_ID_CONTINUOS').AsInteger;
          Tanks[i].NpName := qChartBase.FieldByName('FACT_FUEL_NAME_CONTINUOS').AsString;
        end;
      end
      else
        Tanks[i].Count := 0;

      Tanks[i].VariableHint := 'Текущее кол-во: ' + FormatWeigth(Tanks[i].Count) + #13#10
        + 'Вид н/п: ' + qChartBase.FieldByName('product_name').AsString;

      // подсветить проблемные
      qChartBase.Filtered := False;
      qChartBase.Filter   :=
        '     numb = '+ QuotedStr(Tanks[i].Number) +
        ' and mdate >= '+ QuotedStr('01.09.2010') +
        ' and mdate >= '+ QuotedStr(DateToStr(Self.deEndDate.Date - 7)) +
        ' and mdate <= '+ QuotedStr(DateToStr(Self.deEndDate.Date + 1)) +
        ' and ValidError1 > 0 and ValidError2 > 0 and pogr > 100';
      qChartBase.Filtered := True;

      cbValidColor.Hint := 'С '+ DateToStr(Self.deEndDate.Date - 8) +' по '+ DateToStr(Self.deEndDate.Date);
      Tanks[i].FValidError := not qChartBase.IsEmpty;

      // хінт подсветить проблемные
      sHint := '';
      if Tanks[i].ValidError then
      begin
        qChartBase.First;
        sPogrValue := qChartBase.FieldByName('POGR1').AsString;
        sHint := #10#13+
          '--- Колебание разницы > погрешности от текущей массы ---' +#10#13+
          '--- между книжными остатками и ручными замерами          ---';
        while not qChartBase.Eof do
        begin
          // у тексті пробіли не убирати
          sHint := sHint +#10#13#10#13+
            'Дата/Время: '                  + qChartBase.FieldByName('MDATE').AsString +#10#13+
            'Текущая разница:         '     + FloatToStrF(qChartBase.FieldByName('DIFF').AsFloat,    ffNumber, 15, 0) +' кг.'#10#13+
            'Предыдущая разница: '          + FloatToStrF(qChartBase.FieldByName('lagDIFF').AsFloat, ffNumber, 15, 0) +' кг.'#10#13+
            'Колебание:                    '+ FloatToStrF(qChartBase.FieldByName('DIFF').AsFloat
                                               - qChartBase.FieldByName('lagDIFF').AsFloat, ffNumber, 15, 0) +' кг.'#10#13+
            'Погрешность ('+sPogrValue+'% от текущей массы): '
                                            + FloatToStrF(qChartBase.FieldByName('Pogr').AsFloat,    ffNumber, 15, 0) +' кг.';
          sPogrValue := qChartBase.FieldByName('POGR1').AsString;
          qChartBase.Next;
        end;
      end;
      Tanks[i].sValid.Hint := trim(sHint);
      Tanks[i].sValid.ShowHint := true;
    end;

    qChartBase.Filtered := False;
    qChartBase.Filter   :='';

    for i := 0 to Tubes.Count - 1 do
    begin
      qTanks.Filtered := False;
      qTanks.Filter   := 'tip = 2 and numb = '+ QuotedStr(Tubes[i].Number);
      qTanks.Filtered := True;
      EditTube(qTanks, Tubes[i]); // ЗАВАНТАЖУЄМО нові дані по трубам

      // вставляємо висоту палива
      qChartBase.Filtered := False;
      qChartBase.Filter := ' ' + sFieldPr + ' = 1 and fuel_id = ' + IntToStr(Tubes[i].NpId) + ' and numb = ' + QuotedStr(Tubes[i].Number);
      qChartBase.Filtered := True;

      if not qChartBase.IsEmpty then
      begin
        if FChartMode = cmBase then
          Tubes[i].Max := qChartBase.FieldByName(sFieldValue).AsInteger;
        Tubes[i].Count := qChartBase.FieldByName(sFieldValue).AsInteger
      end
      else
        Tubes[i].Count := 0;
      Tubes[i].VariableHint := 'Текущее кол-во: ' + FormatWeigth(Tubes[i].Count) + #10#13
        + 'Свободно: ' + FormatWeigth(Tubes[i].Max - Tubes[i].Count);
    end;
  finally
    qChartBase.Filtered := False;
    qChartBase.EnableControls;
  end;
  AnnotationChartTool.Active := False;
  RefreshSums();
end;

procedure TRezervImageForm.ResizeForm;
var
  i, maxWidthTank, maxWidthTube, maxHeigth: integer;
begin
  maxWidthTank := 0;
  maxWidthTube := 0;
  maxHeigth := 0;
  for i := 0 to Tanks.Count - 1 do
  begin
    if maxWidthTank < Tanks[i].Left + Tanks[i].Width then
      maxWidthTank := Tanks[i].Left + Tanks[i].Width;
    if maxHeigth < Tanks[i].Top + Tanks[i].Height then
      maxHeigth := Tanks[i].Top + Tanks[i].Height;
  end;
  for i := 0 to Tubes.Count - 1 do
  begin
    if maxWidthTube < Tubes[i].Left + Tubes[i].Width then
      maxWidthTube := Tubes[i].Left + Tubes[i].Width;
    if maxHeigth < Tubes[i].Top + Tubes[i].Height then
      maxHeigth := Tubes[i].Top + Tubes[i].Height;
  end;

  pnlTanks.Top := IfThen(pTanksCap.Visible, pTanksCap.Height + 1, 0);
  pnlTanks.Width := maxWidthTank;
  pnlTanks.Height := maxHeigth;
  pnlTube.Top := IfThen(pTanksCap.Visible, pTanksCap.Height + 1, 0);
  pnlTube.Width := maxWidthTube;
  pnlTube.Height := maxHeigth;
  pnlTrack.Height :=
    IfThen(pTanksCap.Visible, pTanksCap.Height, 0) +
    pnlTanks.Height + 15 + pnlSums.Height;
end;

procedure TRezervImageForm.deEndDateChange(Sender: TObject);
var
  i: integer;
begin
  if not FInEndDateChange then
  begin
    FInEndDateChange := True;

    if FShowed then
    begin
      OraAlerter.Stop; // вимикаємо перебудову запитів
      FreeAllThread(); // знищуємо усі потоки
    end;

    try
      deEndDate.Date := (Sender as TDateEdit).Date;
      if deEndDate.Date < sDateBegin then
      begin
        if deBeginDate.Date = sDateBegin then
          deBeginDateChange(deBeginDate)
        else
          deBeginDate.Date := sDateBegin;
        exit;
      end;
      qChartBase.Close;
      qChartBaseGroup.Close;
      qChartZamer.Close;
      qChartDoc.Close;
      qChartDiff2.Close;
      if GetSelectedList.MultiSelect then
      begin
        GetSelectedList.MultiSelect := False;
        GetSelectedList.Items[0].Selected := True;
      end;
      // Выставляем количество в резервуарах
      Self.RefreshTanks;

      for i := 0 to DBChart.SeriesCount - 1 do
        if DbChart.Series[i].DataSource <> nil then
        begin
          Self.RefreshChart; // Обновляем граффик
          break;
        end;
    finally
      deBeginDateMain.Date := deBeginDate.Date;
      deEndDateMain.Date := deEndDate.Date;

      if FShowed then
        OraAlerter.Start; // вмикаємо перебудову запитів

      FInEndDateChange := False;
    end;
  end;
end;

procedure TRezervImageForm.sbTanksPositionClick(Sender: TObject);
begin
  pnlTrack.Visible := not sbTanksPosition.Down;
end;

procedure TRezervImageForm.FormShow(Sender: TObject);
var
  i: integer;
begin
  sbTanksPosition.Click;
  PageControl.ActivePage := tsChartAllFuel;
  //  PageControl.ActivePage := tsChart;
  Self.ResizeForm;
  FShowed := True;
  Self.RefreshTanks;
  {FactSeriesPoints.Active := qChart.FindField('LITRES_ALL_POINTS') <> nil;
  FactSeries.Pointer.Visible := qChart.FindField('LITRES_ALL_POINTS') = nil;
  BookSeriesPoints.Active := qChart.FindField('CURAMOUNT_POINTS') <> nil;
  BookSeries.Pointer.Visible := qChart.FindField('CURAMOUNT_POINTS') = nil;}

  FactSeriesPoints.Active := True;
  FactSeries.Pointer.Visible := False;
  BookSeriesPoints.Active := True;
  BookSeries.Pointer.Visible := False;

  for i := 0 to DBChart.SeriesCount - 1 do
    if not( (DbChart.Series[i] = ZamerSeries) or (DbChart.Series[i] = DocSeries)
       or  (DbChart.Series[i] = DiffSeries2)) then
      DbChart.Series[i].DataSource := nil;
  //Self.RefreshChart;

  Application.HintHidePause := 20000;
  iClick := 0;

  iml.GetBitmap(0, ImLegend1.Picture.Bitmap); // легенда - в ремонті
  iml.GetBitmap(1, ImLegend2.Picture.Bitmap); // легенда - диагностика
  imlzamer.GetBitmap(0, ImLegend3.Picture.Bitmap); // легенда - автозамеры
  imlzamer.GetBitmap(1, ImLegend4.Picture.Bitmap); // легенда - нет автозамеров

{$IFDEF OILAVIAS}
  for i := 0 to PageControl.PageCount - 1 do
    if (PageControl.Pages[i] <> tsChart)
      and (PageControl.Pages[i] <> tsChartAllFuel)
      and (PageControl.Pages[i] <> tsPrihChart)
      and (PageControl.Pages[i] <> tsRashChart) then
      PageControl.Pages[i].TabVisible := False;
  tsRashGraphic.TabVisible := False;
  tsPrihGraphic.TabVisible := False;
{$ENDIF}
  TimerMessaging.Enabled := True;

  // списки потоків перезапуску запитів
  //----------------------------------------------------------------------------
  ARecThread := nil;
  FreeAndNil(LRecThread);
  LRecThread := Tlist.Create;

  New(ARecThread); // графік + резервуари + труби
  ARecThread.qName  := 'qChartBase';
  ARecThread.sEvent := 'book,fact';
  ARecThread.Thread := nil;
  LRecThread.Add(ARecThread);

  New(ARecThread); // останні заміри
  ARecThread.qName  := 'qTanksLastZamerTime';
  ARecThread.sEvent := 'zamer_load';
  ARecThread.Thread := nil;
  LRecThread.Add(ARecThread);

  New(ARecThread); // заміри
  ARecThread.qName  := 'qChartZamer';
  ARecThread.sEvent := 'zamer';
  ARecThread.Thread := nil;
  LRecThread.Add(ARecThread);

  New(ARecThread); // резервуари + труби
  ARecThread.qName  := 'qTanksBase';
  ARecThread.sEvent := 'tank';
  ARecThread.Thread := nil;
  LRecThread.Add(ARecThread);

  bRefreshTanksFalse := false;
  OraAlerter.Start;
  //----------------------------------------------------------------------------
end;

procedure TRezervImageForm.ceAZSButtonClick(Sender: TObject);
{$IFDEF OIL}
var
  vId, vInst: Integer;
  vName: string;
begin
  if ChooseOrg.CaptureOrg(2, MAIN_ID, INST, 'yyy', vId, vInst, vName) then
  begin
    Self.AzsId := vId;
    //ceAZS.Text := vName;
  end;
{$ELSE}
begin
{$ENDIF}
end;

procedure TRezervImageForm.cbTanksCloseUp(Sender: TObject;
  Accept: Boolean);
begin
  if not FInOnTankMouseDown and Accept then
    Self.TankNumber := qTanks.FieldByName('numb').AsString;
end;

procedure TRezervImageForm.sbFiltersPositionClick(Sender: TObject);
begin
  pnlFilters.Visible := not sbFiltersPosition.Down;
end;

procedure TRezervImageForm.sbTankCapClick(Sender: TObject);
begin
  pTanksCap.Visible := not sbTankCap.Down;
  Self.ResizeForm;
end;

procedure TRezervImageForm.cbTanksChange(Sender: TObject);
begin
  inherited;
  cbTanksCloseUp(Sender, True);
end;

procedure TRezervImageForm.SetUseAzsChoose(const Value: boolean);
begin
  FUseAzsChoose := Value;
  //lblAZS.Visible := Value;
  //ceAZS.Visible := Value;
  if FUseAzsChoose then
  begin
  end;
end;

procedure TRezervImageForm.SetTankNumber(const Value: string);
begin
  Tanks.ItemByNumber(Value).Selected := True;
  Self.RefreshChart;
end;

function TRezervImageForm.GetTankNumber: string;
begin
  Result := Tanks.GetSelectedItem.Number;
end;

procedure TRezervImageForm.DBChartZoom(Sender: TObject);
begin
  inherited;
  DiffSeries.Marks.Visible := True;
  AnnotationChartTool.Active := False;
end;

procedure TRezervImageForm.DBChartUndoZoom(Sender: TObject);
begin
  inherited;
  DiffSeries.Marks.Visible := False;
  AnnotationChartTool.Active := False;
end;

procedure TRezervImageForm.OnSelectList(Sender: TObject);

procedure SetSelectedGroup(ANpId: integer; AList: TTankList);
  var
    i: integer;
  begin
    AList.MultiSelect := True;
    for i := 0 to AList.Count - 1 do
    begin
      if AList[i].NpId = ANpId then
        AList[i].Selected := True
      else
        AList[i].IsGray := True;
    end;
  end;

begin
  if not FInOnSelectList then
  begin
{$IFDEF OIL}
    if (PageControl.ActivePage = tsPrihChart) and (pcPrih.ActivePage = tsPrihGraphic) then
    begin
      fPrihChart.FuelId := GetSelectedList.SelectedItem.NpId;
      fPrihChart.RefreshData;
    end
    else if (PageControl.ActivePage = tsRashChart) and (pcRash.ActivePage = tsRashGraphic) then
    begin
      fRashChart.FuelId := GetSelectedList.SelectedItem.NpId;
      fRashChart.RefreshData;
    end
    else
{$ENDIF}
    if PageControl.ActivePage <> tsCountDiff then
      PageControl.ActivePage := tsChart
    else
      tsCountDiffShow(tsCountDiff);

    FInOnSelectList := True;
    try
      //TODO: Свеести по одну процедуру
      if (Sender is TTubeList) or (Sender is TTubeItem) then
      begin
        FSelectedList := slTubes;
        if (Sender as TTubeList).MultiSelect then
        begin
          if (Sender as TTubeList).Count > 0 then
          begin
            SetSelectedGroup((Sender as TTubeList).SelectedItem.NpId, Tanks);
            FIsGrouping := True;
          end;
        end
        else
        begin
          Tanks.MultiSelect := False;
          FIsGrouping := False;
        end;
      end
      else
      begin
        FSelectedList := slTanks;
        if (Sender as TTankList).MultiSelect then
        begin
          if (Sender as TTankList).Count > 0 then
          begin
            SetSelectedGroup((Sender as TTankList).SelectedItem.NpId, Tubes);
            FIsGrouping := True;
          end;
        end
        else
        begin
          Tubes.MultiSelect := False;
          FIsGrouping := False;
        end;
      end;
    finally
      FInOnSelectList := False;
      RefreshSums();
    end;
  end;
  //  pnlChartDate.Enabled := not FIsGrouping;
  if FChartMode <> cmAzs then
    cbRests.Enabled := not FIsGrouping;
end;

procedure TRezervImageForm.RefreshSums();
var
  fs: TFormatSettings;
  Fact, FactTank, FactTube, FactNp, FactNumber,
    Book, BookNp, BookNumber,
    Temp: Currency;

  sFilter: string;
  NpId: integer;
  NpName, Number: string;

begin
  if not FShowed then
    Exit;
  Fact := 0;
  Book := 0;
  FactNp := 0;
  BookNp := 0;
  FactNumber := 0;
  BookNumber := 0;
  FactTank := 0;
  FactTube := 0;
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, fs);
  fs.ThousandSeparator := ' ';
  fs.CurrencyString := 'кг.';
  fs.CurrencyDecimals := 0;

  // Вид топлива
  NpId := GetSelectedList.SelectedItem.NpId;
  NpName := GetSelectedList.SelectedItem.NpName;
  Number := GetSelectedList.SelectedItem.Number;

  pnlSumNpColor.Color := GetSelectedList.SelectedItem.Color;
  lblWeigthNp.Caption := Format('Вес по %s :', [NpName]);
  lblTitleChart.Caption := Format('Движение по %s', [NpName]);

  // Выбраный резервуар/труба, если не выбран, то скрываем панель
  if GetSelectedList.MultiSelect then
    pnlSumTankColor.Visible := False
  else
  begin
    if FSelectedList = slTanks then
    begin
      lblWeigthTank.Caption := Format('Вес по резервуару №%s с %s :', [Number, NpName]);
      lblTitleChart.Caption := Format('Движение по резервуару №%s с %s', [Number, NpName]);
    end
    else
    begin
      lblWeigthTank.Caption := Format('Вес по трубе с %s :', [NpName]);
      lblTitleChart.Caption := Format('Движение по трубе с %s', [NpName]);
    end;

    pnlSumTankColor.Color := GetSelectedList.SelectedItem.Color;
    pnlSumTankColor.Visible := True;
  end;

  sFilter := qChart.Filter;
  qChart.Filtered := False;

  if not qChart.IsEmpty then
  begin
    try
      // Получение данных по замерам
      qChart.Filtered := False;
      qChart.Filter := ' is_gauged = 1 ';
      qChart.Filtered := True;
      Fact := 0;
      FactNp := 0;
      FactNumber := 0;
      FactTank := 0;
      FactTube := 0;

      qChart.First;
      while not qChart.Eof do
      begin
        Fact := Fact + qChart.FieldByName('LITRES_ALL').AsCurrency;
        if FChartMode <> cmAzs then
          FactTube := FactTube + qChart.FieldByName('LITRES_ALL_TUBES').AsCurrency;
        FactTank := Fact - FactTube;

        if NpId = qChart.FieldByName('fuel_id').AsInteger then
          FactNp := FactNp + qChart.FieldByName('LITRES_ALL').AsCurrency;

        if not GetSelectedList.MultiSelect then
          if Number = qChart.FieldByName('numb').AsString then
            FactNumber := FactNumber + qChart.FieldByName('LITRES_ALL').AsCurrency;

        qChart.Next
      end;

      // Получение данных по книжным
      // - По парку и по группе получаем из запроса по группе,
      // - По резервуару из запроса по резервуарам
      qChart.Filtered := False;
      if Self.ChartMode = cmBase then
        qChart.Filter := ' is_book_rests = 1 '
      else
        qChart.Filter := ' is_gauged = 1 ';
      qChart.Filtered := True;
      Book := 0;
      BookNp := 0;
      BookNumber := 0;

      qChart.First;
      while not qChart.Eof do
      begin
        // Общее кол-во
        //Book := Book + qChart.FieldByName('curamount').AsCurrency;

        // По группе кол-во
        //if NpId = qChart.FieldByName('fuel_id').AsInteger then
        //  BookNp := BookNp + qChart.FieldByName('curamount').AsCurrency;

        // По резервуару кол-во
        if not GetSelectedList.MultiSelect then
          if Number = qChart.FieldByName('numb').AsString then
            if not qChart.FieldByName(
              decode([Self.ChartMode, cmBase, 'CURAMOUNT', cmAZS, 'CURAMOUNT', 'CURAMOUNT_ON_FACT_CONTINUOS'])).IsNull then
              BookNumber := BookNumber +
                qChart.FieldByName(decode([Self.ChartMode, cmBase, 'CURAMOUNT', cmAZS, 'CURAMOUNT', 'CURAMOUNT_ON_FACT_CONTINUOS'])).AsCurrency;
        qChart.Next
      end;
    finally
      qChart.Filtered := False;
      qChart.Filter := sFilter;
      qChart.Filtered := True;
    end;
  end;

  if qChartBaseGroup.Active and qChartBaseGroup.Fetched then
  begin
    qChartBaseGroup.DisableControls;
    try
      // Получение данных по книжным
      // - По парку и по группе получаем из запроса по группе,
      // - По резервуару из запроса по резервуарам
      if qChartBaseGroup.Filtered then
        sFilter := qChartBaseGroup.Filter
      else
        sFilter := '';
      qChartBaseGroup.Filtered := False;
      if Self.ChartMode = cmBase then
        qChartBaseGroup.Filter := ' is_book_rests = 1 '
      else
        qChartBaseGroup.Filter := ' is_gauged = 1 ';
      qChartBaseGroup.Filtered := True;
      Book := 0;
      BookNp := 0;

      qChartBaseGroup.First;
      while not qChartBaseGroup.Eof do
      begin
        // Общее кол-во
        Book := Book + qChartBaseGroup.FieldByName(IfThen(Self.ChartMode = cmBase, 'CURAMOUNT', 'CURAMOUNT_ON_FACT_CONTINUOS')).AsCurrency;

        // По группе кол-во
        if NpId = qChartBaseGroup.FieldByName('fuel_id').AsInteger then
          BookNp := BookNp + qChartBaseGroup.FieldByName(IfThen(Self.ChartMode = cmBase, 'CURAMOUNT', 'CURAMOUNT_ON_FACT_CONTINUOS')).AsCurrency;

        qChartBaseGroup.Next
      end;
    finally
      if sFilter <> '' then
      begin
        qChartBaseGroup.Filtered := False;
        qChartBaseGroup.Filter := sFilter;
        qChartBaseGroup.Filtered := True;
      end
      else
        qChartBaseGroup.Filtered := False;
      qChartBaseGroup.NonBlocking := False;
      qChartBaseGroup.EnableControls;
    end;
  end;

  // Вывод на панель данных
  // Вес по парку
  lblFillParkBookValue.Caption := format('%m', [Book], fs);
  lblFillParkDiffValue.Caption := format('%m', [Fact - Book], fs);

  Temp := max(1, Tanks.SumMax[-1] + Tubes.SumMax[-1]);

  lblFillParkValue.Caption :=
    format('%m (%2.2d', [Fact, trunc((Fact) / Temp * 100)], fs) + '%)';
  lblUnusedParkValue.Caption :=
    format('%m (%2.2d', [(Tanks.SumMax[-1] + Tubes.SumMax[-1]) - (Fact),
    100 - trunc((Fact) / Temp * 100)], fs) + '%)';

  // Вес по НП
  lblFillNpBookValue.Caption := format('%m', [BookNp], fs);
  lblFillNpDiffValue.Caption := format('%m', [FactNp - BookNp], fs);

  Temp := max(1, Tanks.SumMax[NpId] + Tubes.SumMax[NpId]);

  lblFillNpValue.Caption :=
    format('%m (%2.2d', [FactNp, trunc((FactNp) / Temp * 100)], fs) + '%)';
  lblUnusedNpValue.Caption :=
    format('%m (%2.2d', [(Tanks.SumMax[NpId] + Tubes.SumMax[NpId]) - (FactNp),
    100 - trunc((FactNp) / Temp * 100)], fs) + '%)';

  // Вес по резервуару
  lblFillTankBookValue.Caption := format('%m', [BookNumber], fs);
  lblFillTankDiffValue.Caption := format('%m', [FactNumber - BookNumber], fs);

  Temp := max(1, GetSelectedList.SelectedItem.Max);

  lblFillTankValue.Caption :=
    format('%m (%2.2d', [FactNumber, trunc((FactNumber / Temp) * 100)], fs) + '%)';
  lblUnusedTankValue.Caption :=
    format('%m (%2.2d', [(GetSelectedList.SelectedItem.Max - FactNumber),
    100 - trunc((FactNumber / Temp) * 100)], fs) + '%)';

  // Заполнение расширеной панели
  lblFillParkExValue.Caption := lblFillParkValue.Caption;
  lblUnusedParkExValue.Caption := lblUnusedParkValue.Caption;
  lblFillParkBookExValue.Caption := lblFillParkBookValue.Caption;
  lblFillParkDiffExValue.Caption := lblFillParkDiffValue.Caption;

  Temp := max(1, Tanks.SumMax[-1] + Tubes.SumMax[-1]);
  lblUnusedParkTanksExValue.Caption :=
    format('%m (%2.2d', [(Tanks.SumMax[-1] + Tubes.SumMax[-1]) - (Fact),
    100 - trunc((Fact) / Temp * 100)], fs) + '%)';

  lblUnusedParkTubesExValue.Caption :=
    format('%m (%2.2d', [0.0, 0], fs) + '%)';

  Temp := max(1, Tanks.SumMax[-1] + Tubes.SumMax[-1]);

  lblFillParkTubesExValue.Caption := format('%m (%2.2d', [FactTube,
    trunc(FactTube / max(1, Fact * trunc(Fact / Temp * 100)))], fs) + '%)';
  lblFillParkTanksExValue.Caption := format('%m (%2.2d', [FactTank,
    trunc(Fact / Temp * 100) - trunc(FactTube / max(1, Fact * trunc(Fact / Temp * 100)))], fs) + '%)';

  // Резервуары
  // В ремонте
  qTanks.Filtered := False;
  qTanks.Filter := 'tip = 1 and condition = 1';
  qTanks.Filtered := True;
  lblTanksRepairExValue.Caption := Format('%d шт. (%2.2d', [qTanks.RecordCount, trunc(qTanks.RecordCount / Tanks.Count * 100)]) + '%)';
  // Диагностика
  qTanks.Filtered := False;
  qTanks.Filter := 'tip = 1 and condition = 2';
  qTanks.Filtered := True;
  lblTanksDiagExValue.Caption := Format('%d шт. (%2.2d', [qTanks.RecordCount, trunc(qTanks.RecordCount / Tanks.Count * 100)]) + '%)';
  // Прочие
  qTanks.Filtered := False;
  qTanks.Filter := 'tip = 1 and condition <> 1 and condition <> 2';
  qTanks.Filtered := True;
  lblTanksOtherExValue.Caption := Format('%d шт. (%2.2d', [qTanks.RecordCount, trunc(qTanks.RecordCount / Tanks.Count * 100)]) + '%)';
  qTanks.Filtered := False;
  qTanks.Filter := 'tip = 1';
  qTanks.Filtered := True;
  // Все
  lblTanksAllExValue.Caption := Format('%d шт.', [Tanks.Count]);
  qTanks.Filtered := False;
end;

procedure TRezervImageForm.CreateTankItems(ADataSet: TDataSet;
  AList: TTankList; ATip: integer);
var
  t: TTankItem;
begin
  AList.Clear;

  ADataSet.Filtered := False;
  ADataSet.Filter   := 'tip = '+ IntToStr(ATip);
  ADataSet.Filtered := True;

  ADataSet.First;
  while not ADataSet.Eof do
  begin
    if ADataSet.FieldByName('tip').AsInteger = ATip then
    begin
      t := TTankItem.Create(AList, Self);

      t.NpId := ADataSet.FieldByName('fuel_id').AsInteger;
      if ADataSet.FindField('fuel_name') <> nil then
        t.NpName := ADataSet.FieldByName('fuel_name').AsString;
      t.Number := ADataSet.FieldByName('numb').AsString;
      t.OnTankMouseDown := Self.OnItemMouseDown;

      EditTank(ADataSet, t); // ЗАВАНТАЖУЄМО нові дані по резервуарам
      AList.Add(t);
    end;
    ADataSet.Next;
  end;
end;

procedure TRezervImageForm.EditTank(ADataSet: TDataSet; At: TTankItem); // ЗАВАНТАЖУЄМО нові дані по резервуарам
begin
  At.IsAutoZamer := False;
  {$IFDEF OIL}
  if DBObjectExists('ZAMER_COPY_PETROL') then
  begin
    qTanksLastZamerTime.Filtered := false;
    qTanksLastZamerTime.Filter   := 'rez_name = '+ QuotedStr(ADataSet.FieldByName('numb').AsString);
    qTanksLastZamerTime.Filtered := true;

    At.imZamer.Picture.Bitmap := nil;
    if qTanksLastZamerTime.RecordCount > 0 then
      if qTanksLastZamerTime.FieldByName('active').AsString = 'True' then
      begin
        At.IsAutoZamer := True;
        if qTanksLastZamerTime.FieldByName('datetime').IsNull then
          imlzamer.GetBitmap(1, At.imZamer.Picture.Bitmap)        
        else if now-qTanksLastZamerTime.FieldByName('datetime').AsDateTime > 1/24 then
          imlzamer.GetBitmap(1, At.imZamer.Picture.Bitmap)
        else
          imlzamer.GetBitmap(0, At.imZamer.Picture.Bitmap);
        At.imZamer.Transparent := True;
      end;
  end;
  {$ENDIF}

  At.Max := ADataSet.FieldByName('maxamount').AsInteger;

  At.ConstantHint := 'Резервуар ' + #10#13
    + 'Номер: ' + ADataSet.FieldByName('numb').AsString + #10#13
    + 'Марка: ' + ADataSet.FieldByName('rez_type').AsString + #10#13
    + 'Общая хар-ка: ' + ADataSet.FieldByName('cond2').AsString + #10#13
    + 'Состояние: ' + ADataSet.FieldByName('condition_name').AsString + #10#13
    + 'Ввод в эксплуатацию: ' + ADataSet.FieldByName('start_year').AsString + ' г.' + #10#13
    + 'Фактический объем: ' + FormatWeigth(ADataSet.FieldByName('maxamount').AsFloat) + #10#13
    + 'Мертвый остаток: ' + FormatWeigth(ADataSet.FieldByName('dead').AsFloat) + #10#13
    + 'Дата последнего кап.ремонта: ' + FormatDateTime('yyyy', ADataSet.FieldByName('repair_date').AsDateTime) + 'г.' + #10#13
    + 'Максимальная высота взлива,(см): ' + ADataSet.FieldByName('max_level_measur').AsString + #10#13
    + 'Высота резервуара, (м): ' + ADataSet.FieldByName('rez_height').AsString + #10#13
    + 'Номинальный объем (м3): ' + ADataSet.FieldByName('nom_capacity').AsString + #10#13
    + 'Допустимый объем (м3): ' + ADataSet.FieldByName('permiss_capacity').AsString + #10#13
    + 'Рабочий объем (м3): ' + ADataSet.FieldByName('oper_capacity').AsString + #10#13;

  // вставляємо малюнок до резервуару
  At.imError.Picture.Bitmap := nil;
  if ADataSet.FieldByName('condition').AsInteger > 0 then
    iml.GetBitmap(ADataSet.FieldByName('condition').AsInteger - 1, At.imError.Picture.Bitmap);
  At.State := TTankState(ADataSet.FieldByName('condition').AsInteger);
end;

procedure TRezervImageForm.CreateTubeItems(ADataSet: TDataSet;
  AList: TTubeList; ATip: integer);
var
  t: TTubeItem;
begin
  AList.Clear;

  ADataSet.Filtered := False;
  ADataSet.Filter   := 'tip = '+ IntToStr(ATip);
  ADataSet.Filtered := True;

  ADataSet.First;
  while not ADataSet.Eof do
  begin
    if ADataSet.FieldByName('tip').AsInteger = ATip then
    begin
      t := TTubeItem.Create(AList, Self);

      t.NpId := ADataSet.FieldByName('fuel_id').AsInteger;
      if ADataSet.FindField('fuel_name') <> nil then
        t.NpName := ADataSet.FieldByName('fuel_name').AsString;
      t.Number := ADataSet.FieldByName('numb').AsString;
      t.OnTankMouseDown := Self.OnItemMouseDown;

      EditTube(ADataSet, t); // ЗАВАНТАЖУЄМО нові дані по трубам
      AList.Add(t);
    end;
    ADataSet.Next;
  end;
end;

procedure TRezervImageForm.EditTube(ADataSet: TDataSet; At: TTubeItem); // ЗАВАНТАЖУЄМО нові дані по трубам
begin
  At.Max := ADataSet.FieldByName('maxamount').AsInteger;
  At.ConstantHint := 'Труба' + #10#13
    + 'Топливо: ' + ADataSet.FieldByName('fuel_name').AsString + #10#13
    + 'Общий объем: ' + FormatWeigth(ADataSet.FieldByName('maxamount').AsCurrency) + #10#13
    + 'Труб в ремонте: 0 шт.';
end;

function TRezervImageForm.qChart: TOraQuery;
begin
  if Self.BaseId = 0 then
    Result := qChartAzs
  else if FIsGrouping then
    Result := qChartBaseGroup
  else
    Result := qChartBase;
end;

function TRezervImageForm.qTanks: TOraQuery;
begin
  if Self.BaseId = 0 then
    Result := qTanksAzs
  else
    Result := qTanksBase;
end;

function TRezervImageForm.GetSelectedList: TTankList;
begin
  if FSelectedList = slTubes then
    Result := Self.Tubes
  else
    Result := Self.Tanks;
end;

procedure TRezervImageForm.SetFactAnnotation(AValueIndex: integer; AValueZamerIndex: integer; AValueDocIndex: integer);
var
  diff: Double;
  sZamerWEIGHT, sZamerDATETIME: string;
begin
  qChart.RecNo := AValueIndex + 1;

  AnnotationChartTool.Text := 'Точка остатка по замеру' + #10#13
    + 'Дата/время: ' + qChart.FieldByName('MDATE').AsString + #10#13
    + 'Вес по ручному замеру: ' + FormatWeigth(qChart.FieldByName('LITRES_ALL').AsFloat) + #10#13;

  if not qChart.FieldByName('CURAMOUNT_ON_FACT_CONTINUOS').IsNull then
    AnnotationChartTool.Text := AnnotationChartTool.Text + 'Вес книжный: ' + FormatWeigth(qChart.FieldByName('CURAMOUNT_ON_FACT_CONTINUOS').AsFloat) + #10#13;

  case Sign(qChart.FieldByName('DIFF').AsFloat) of
    -1: AnnotationChartTool.Text := AnnotationChartTool.Text + 'Недостача: ';
    0: AnnotationChartTool.Text := AnnotationChartTool.Text + 'Разница: ';
    1: AnnotationChartTool.Text := AnnotationChartTool.Text + 'Излишки: ';
  end;

  AnnotationChartTool.Text := AnnotationChartTool.Text + SignChar(qChart.FieldByName('DIFF').AsFloat) + FormatWeigth(Abs(qChart.FieldByName('DIFF').AsFloat)) + #10#13
    + 'Температура: ' + SignChar(qChart.FieldByName('TEMPER').AsFloat) + FloatToStr(Abs(qChart.FieldByName('TEMPER').AsFloat)) + #10#13;

  if qChartZamer.Active then
  begin
    qChartZamer.RecNo := AValueZamerIndex + 1;
    sZamerWEIGHT := FormatWeigth(qChartZamer.FieldByName('WEIGHT').AsFloat);
    sZamerDATETIME := qChartZamer.FieldByName('DATETIME').AsString;
  end
  else
  begin
    sZamerWEIGHT := 'Нет данных';
    sZamerDATETIME := sZamerWEIGHT;
  end;
  AnnotationChartTool.Text := AnnotationChartTool.Text
    + '--- Данные по уровнемерам и документам ---' + #10#13
    + 'Вес по автозамеру: ' + sZamerWEIGHT + #10#13
    + 'Время автозамера:  ' + sZamerDATETIME + #10#13;

  qChartDoc.RecNo := AValueDocIndex + 1;
  if qChartDoc.Active and (qChartDoc.FieldByName('WEIGHT').AsFloat<>0) then
  begin
    diff := qChartZamer.FieldByName('WEIGHT').AsFloat - qChartDoc.FieldByName('WEIGHT').AsFloat;
    AnnotationChartTool.Text := AnnotationChartTool.Text
      + 'Вес по документам: ' + FormatWeigth(qChartDoc.FieldByName('WEIGHT').AsFloat) + #10#13
      + 'Время документа: ' + qChartDoc.FieldByName('DATETIME').AsString + #10#13
      + 'Разница автозамера и документов: ' + FormatWeigth(diff) + #10#13;
  end;
  // Подсветка выбраной точки
  with AnnotationChartTool.Callout do
  begin
    Visible := True;
    XPosition := FactSeries.CalcXPos(AValueIndex);
    YPosition := FactSeries.CalcYPos(AValueIndex);
    ZPosition := 0;
  end;
  AnnotationChartTool.Top := 50;
  AnnotationChartTool.Active := True;
end;

procedure TRezervImageForm.SetBookAnnotation(AValueIndex: integer);
begin
  qChart.RecNo := AValueIndex + 1;
  AnnotationChartTool.Text := 'Точка книжного остатка' + #10#13
    + 'Дата/время: ' + qChart.FieldByName('MDATE').AsString + #10#13;
  if qChart.FieldByName('product_name').AsString <> '' then
    AnnotationChartTool.Text := AnnotationChartTool.Text + 'Вид н/п: ' + qChart.FieldByName('product_name').AsString + #10#13;
  AnnotationChartTool.Text := AnnotationChartTool.Text
    + 'Вес по замеру: ' + FormatWeigth(qChart.FieldByName('LITRES_ALL').AsFloat) + #10#13
    + 'Вес книжный: ' + FormatWeigth(qChart.FieldByName('CURAMOUNT').AsFloat)
    + ' (изм-е ' + SignChar(qChart.FieldByName('book_amount').AsFloat) + FormatWeigth(Abs(qChart.FieldByName('book_amount').AsFloat)) + ') ' + #10#13;

  case Sign(qChart.FieldByName('DIFF').AsFloat) of
    -1: AnnotationChartTool.Text := AnnotationChartTool.Text + 'Недостача: ';
    0: AnnotationChartTool.Text := AnnotationChartTool.Text + 'Разница: ';
    1: AnnotationChartTool.Text := AnnotationChartTool.Text + 'Излишки: ';
  end;

  AnnotationChartTool.Text := AnnotationChartTool.Text + SignChar(qChart.FieldByName('DIFF').AsFloat) + FormatWeigth(Abs(qChart.FieldByName('DIFF').AsFloat)) + #10#13
    + 'Температура: ' + SignChar(qChart.FieldByName('TEMPER').AsFloat) + FloatToStr(Abs(qChart.FieldByName('TEMPER').AsFloat)) + #10#13;

  with AnnotationChartTool.Callout do
  begin
    Visible := True;
    XPosition := BookSeries.CalcXPos(AValueIndex);
    YPosition := BookSeries.CalcYPos(AValueIndex);
    ZPosition := 0;
  end;
  AnnotationChartTool.Top := 50;
  AnnotationChartTool.Active := True;
end;

function TRezervImageForm.FormatWeigth(AValue: Currency; ACurrencyString: string = 'кг.'): string;
var
  fs: TFormatSettings;
begin
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, fs);
  fs.ThousandSeparator := ' ';
  fs.CurrencyString := ACurrencyString;
  fs.CurrencyDecimals := 0;
  Result := Format('%m', [AValue], fs);
end;

function TRezervImageForm.SignChar(AValue: Real): string;
begin
  case Sign(AValue) of
    -1: Result := '-';
    0: Result := ' ';
    1: Result := '+';
  end;
end;

procedure TRezervImageForm.SetParams(AQuery: TOraQuery);
begin
  if AQuery.FindParam('azs_id') <> nil then
    AQuery.ParamByName('azs_id').AsInteger := Self.AzsId;
  if AQuery.FindParam('begin_date') <> nil then
    AQuery.ParamByName('begin_date').AsDateTime := Self.BeginDate;
  if AQuery.FindParam('end_date') <> nil then
    AQuery.ParamByName('end_date').AsDateTime := Self.EndDate;
  if AQuery.FindParam('fuel_id') <> nil then
    AQuery.ParamByName('fuel_id').AsInteger := 0;
  if AQuery.FindParam('numb') <> nil then
    AQuery.ParamByName('numb').AsString := '0';
  if AQuery.FindParam('org_inst') <> nil then
    AQuery.ParamByName('org_inst').AsInteger := IfThen(FChartMode = cmAzs, Self.AzsId, Self.BaseId);

  DefineRepDates(Self.BeginDate, Self.EndDate);
  DefineRepParam('ORG_INST', IntToStr(IfThen(FChartMode = cmAzs, Self.AzsId, Self.BaseId)))
end;

function TRezervImageForm.GetBeginDate: TDateTime;
begin
  Result := Self.deBeginDate.Date
end;

function TRezervImageForm.GetEndDate: TDateTime;
begin
  Result := Self.deEndDate.Date;
end;

{ TTubeItem }

constructor TTubeItem.Create(ACollection: TCollection; AMotherForm: TForm);
var
  RezervImageForm: TRezervImageForm;
begin
  inherited Create(ACollection);
  RezervImageForm := AMotherForm as TRezervImageForm;
  // Создание объекта-резервуара
  // порядок створення цих об"єктів є дуже важливим
  // pTank
  pTank := TPanel.Create(RezervImageForm);
  pTank.Parent := RezervImageForm.pTankTube.Parent;
  SetSizes(RezervImageForm.pTankTube, pTank);
  pTank.OnMouseUp := OnMouseUp;
  pTank.PopupMenu := RezervImageForm.pTankTube.PopupMenu;
  // sHeadB
  sHeadB := TShape.Create(pTank);
  // sFull
  sFull := TShape.Create(pTank);
  SetShape(pTank, RezervImageForm.sFullTube, sFull, OnMouseUp);
  // sFill
  sFill := TShape.Create(pTank);
  SetShape(pTank, RezervImageForm.sFillTube, sFill, OnMouseUp);
  // sP
  sP := TShape.Create(pTank);
  // sHeadT
  sHeadT := TShape.Create(pTank);
  // sHead
  sHead := TShape.Create(pTank);
  // imError
  imError := TImage.Create(pTank);
  SetImage(pTank, RezervImageForm.imError1, imError, OnMouseUp);
  // lblNpName
  lblNpName := TLabel.Create(pTank);
  SetLabel(pTank, RezervImageForm.lblNpNameTube, lblNpName, OnMouseUp);
  // lblTankNumber
  lblTankNumber := TLabel.Create(pTank);
  SetLabel(pTank, RezervImageForm.lblTankNumberTube, lblTankNumber, OnMouseUp);
  // lblCount
  lblCount := TLabel.Create(pTank);
  //SetLabel(pTank, RezervImageForm.lblCount, lblCount, OnMouseUp);
  // lblMaxCount
  lblMaxCount := TLabel.Create(pTank);
  //SetLabel(pTank, RezervImageForm.lblMaxCount, lblMaxCount, OnMouseUp);
  Self.Max := 10000;
  // lblMax
  lblMax := TLabel.Create(pTank);
  SetLabel(pTank, RezervImageForm.lblMax, lblMax, OnMouseUp);
  // lblFullness
  lblFullness := TLabel.Create(pTank);
  SetLabel(pTank, RezervImageForm.lblFullnessTube, lblFullness, OnMouseUp);
  // Читаем параметры
  BottomLevel := sFill.Top + sFill.Height;
  TopLevel := sFull.Top;
end;

procedure TTubeItem.SetCount(AValue: Currency);
begin
  FCount := AValue;
  if AValue = 0 then
    lblCount.Caption := '-'
  else
    lblCount.Caption := FloatToStr(AValue) {+' л.'};
  lblCount.Repaint;
  // Прорисовуем уровень в резервуаре
  //sFill.Height := trunc((Self.BottomLevel - Self.TopLevel)/Max*FCount);
  //sFill.Top := - sFill.Height + Self.BottomLevel;
  if Max = 0 then
  begin
    lblFullness.Caption := '';
    sFill.Width := 0;
  end
  else
  begin
    lblFullness.Caption := IntToStr(trunc(FCount / Max * 100)) + '%';
    sFill.Width := trunc(sFull.Width * FCount / Max);
  end;
  sFill.Repaint;
end;

{ TTubeList }

procedure TTubeList.Add(ATank: TTubeItem);
const
  TanksPerRow = 1;
  BetweenItemsHor = 3;
  BetweenItemsVer = 3;
var
  Row: integer;
begin
  ATank.Top := 13;
  ATank.Left := 1 + (BetweenItemsHor + ATank.Width) * (Self.Count - 1);
  // Перенос на новую строку
  Row := trunc((Self.Count - 1) / TanksPerRow);
  ATank.Top := ATank.Top + (ATank.Height + BetweenItemsVer) * Row;
  ATank.Left := ATank.Left - ((BetweenItemsHor + ATank.Width) * TanksPerRow) * Row;
  ATank.OnSelect := Self.OnSelectItem;
  if Self.Count = 1 then
    ATank.Selected := True;
end;

constructor TTubeList.Create(AParent: TWinControl);
begin
  inherited Create(TTubeItem);
  Parent := AParent;
end;

function TTubeList.GetItem(Index: integer): TTubeItem;
begin
  Result := TTubeItem(inherited Items[Index]);
end;

function TTubeList.GetSelectedItem: TTubeItem;
begin
  Result := TTubeItem(inherited GetSelectedItem);
end;

function TTubeList.ItemByNpId(ANpId: integer): TTubeItem;
begin
  Result := TTubeItem(inherited ItemByNpId(ANpId));
end;

function TTubeList.ItemByNumber(ANumber: string): TTubeItem;
begin
  Result := TTubeItem(inherited ItemByNumber(ANumber));
end;

procedure TTubeList.SetItem(Index: integer; Value: TTubeItem);
begin
  inherited SetItem(Index, TTankItem(Value));
end;

procedure TRezervImageForm.actShowOnDrawingExecute(Sender: TObject);
{$IFDEF OIL}
var
  F: TTubesForm;
begin
  inherited;
  F := TTubesForm.Create(Application);
  if F.rgNpType <> nil then
    try
      F.FuelId := GetSelectedList.SelectedItem.NpId;
      F.WindowState := wsMaximized;
      F.ShowModal;
    finally
      F.Free;
    end;
{$ELSE}
begin
{$ENDIF}
  {case GetSelectedList.SelectedItem.NpId of
    4,5:// - 76 - желтый
      FileName := '[76].dwg';
    6:// - 92 - зеленый
      FileName := '[92].dwg';
    7:// - 95 - красный
      FileName := '[95].dwg';
    3:// - ДТ - синий
      FileName := '[DT].dwg';
    76:// - А-95 Pr - бардовый
      FileName := '[98].dwg';
    else
      FileName := 'DNP_2003.DWG';
  end;
  ShellExecute(Self.Handle, 'open', PChar(GetMainDir+'Drawing\'+FileName), '' ,'', SW_SHOWMAXIMIZED);}
end;

procedure TRezervImageForm.actShowDrawingExecute(Sender: TObject);
{$IFDEF OIL}
var
  F: TTubesForm;
begin
  inherited;
  F := TTubesForm.Create(Application);
  if F.rgNpType <> nil then
    try
      //F.WindowState := wsMaximized;
      F.ShowModal;
    finally
      F.Free;
    end;
  //ShellExecute(Self.Handle, 'open', PChar(GetMainDir+'Drawing\DNP_2003.DWG'), '' ,'', SW_SHOWMAXIMIZED);
{$ELSE}
begin
{$ENDIF}
end;

procedure TRezervImageForm.pnlTanksResize(Sender: TObject);
begin
  inherited;
  pnlTube.Left := pnlTanks.Width + pnlTanks.Left;
end;

procedure TRezervImageForm.CursorChartToolChange(Sender: TCursorTool; x,
  y: Integer; const XValue, YValue: Double; Series: TChartSeries; ValueIndex: Integer);
var
  i, j, point, point1, point2: integer;
  val: Currency;
begin
  OneDiffSeries.Clear;
  val := 0;
  point := -1;
  if DiffSeries.XValues.Count <> 0 then
    // Если курсор за последней точкой
    if DiffSeries.CalcXPos(DiffSeries.XValues.Count - 1) < X then
    begin
      point := DiffSeries.XValues.Count - 1
    end
    else
    begin
      for i := 0 to FactSeriesPoints.XValues.Count - 1 do
        if FactSeriesPoints.CalcXPos(i) >= X then
        begin
          // Берем предыдущую точку нормальную
          for j := i downto 0 do
            if FactSeriesPoints.YValue[j] <> 0 then
            begin
              point := j;
              break;
            end;
          break;
        end;
    end;

  point1 := -1;
  if ZamerSeries.XValues.Count <> 0 then
    // Если курсор за последней точкой
    if ZamerSeries.CalcXPos(ZamerSeries.XValues.Count - 1) < X then
    begin
      point1 := ZamerSeries.XValues.Count - 1
    end
    else
    begin
      for i := 0 to ZamerSeries.XValues.Count - 1 do
        if ZamerSeries.CalcXPos(i) >= X then
        begin
          // Берем предыдущую точку нормальную
          for j := i downto 0 do
            if ZamerSeries.YValue[j] <> 0 then
            begin
              point1 := j;
              break;
            end;
          break;
        end;
    end;

  point2 := -1;
  if DocSeries.XValues.Count <> 0 then
    // Если курсор за последней точкой
    if DocSeries.CalcXPos(DocSeries.XValues.Count - 1) < X then
    begin
      point2 := DocSeries.XValues.Count - 1
    end
    else
    begin
      for i := 0 to DocSeries.XValues.Count - 1 do
        if DocSeries.CalcXPos(i) >= X then
        begin
          // Берем предыдущую точку нормальную
          for j := i downto 0 do
            if DocSeries.YValue[j] <> 0 then
            begin
              point2 := j;
              break;
            end;
          break;
        end;
    end;

  if point >= 0 then
  begin
    SetFactAnnotation(point, point1, point2);
    val := DiffSeries.YValue[point];
    OneDiffSeries.AddBar(val, '', clTeeColor);
  end;

  if sign(val) = -1 then
    OneDiffSeries.SeriesColor := $003C3CFF
  else
    OneDiffSeries.SeriesColor := $00499300;

  // якщо курсор зайшов за границю AnnotationChartTool (інформаційна табличка),
  // то змістити інформаційну табличку в інший кут
  if AnnotationChartTool.Width < X then
    AnnotationChartTool.Left := 0
  else
    AnnotationChartTool.Left := DBChart.Width - AnnotationChartTool.Width;

  CursorChartTool.Repaint;
end;

procedure TRezervImageForm.PageControlChange(Sender: TObject);
{$IFDEF OIL}
var
  b: TForm;
  bGreateForm: boolean;
  i: integer;
begin
  bGreateForm := false;

  sbTanksPosition.Down := not (
    (PageControl.ActivePage = tsChart) or (PageControl.ActivePage = tsChartAllFuel) or
    (PageControl.ActivePage = tsCountDiff));
  sbTanksPosition.Click;

  // Отчет плотности
  if (PageControl.ActivePage = tsRepDensity) and (fRepDensityForm = nil) then
  begin
    fRepDensityForm := TBaseRepDensityForm.Create(Self);
    b := fRepDensityForm;
    b.Parent := tsRepDensity;
    bGreateForm := true;
  end
  else
  // Колебания разницы
  if (PageControl.ActivePage = tsKolebRef) and (fKolebRefForm = nil) then
  begin
    fKolebRefForm := TBaseKolebRefForm.Create(Self);
    b := fKolebRefForm;
    b.Parent := PageControl.ActivePage;
    bGreateForm := true;
  end
  else
  // Отчет потери резервуаров
  if (PageControl.ActivePage = tsPoteriRez) and (fPoteriRefForm = nil) then
  begin
    fPoteriRefForm := TBaseRepPoteriRezForm.Create(Self);
    b := fPoteriRefForm;
    b.Parent := PageControl.ActivePage;
    bGreateForm := true;
  end
  else
  // Ввод уровней
  if (PageControl.ActivePage = tsMeteringAuto) and (fBaseMeteringAutoRef = nil) then
  begin
    fBaseMeteringAutoRef := TBaseMeteringAutoRefForm.Create(Self);
    b := fBaseMeteringAutoRef;
    b.Parent := PageControl.ActivePage;
    bGreateForm := true;
  end
  else
  // Показания уровнемеров
  if (PageControl.ActivePage = tsAutoZamer) and (fBaseAutoZamerRef = nil) then
  begin
    fBaseAutoZamerRef := TBaseAutoZamerRefForm.Create(Self);
    b := fBaseAutoZamerRef;
    b.Parent := PageControl.ActivePage;
    bGreateForm := true;
  end
  else
  
  // Анализ приходов
  if (PageControl.ActivePage = tsPrihChart) and (fPrihChart = nil) then
  begin
    if pcPrih.ActivePage = tsPrihBack then
      pcPrih.ActivePage := tsPrihTable;
    // Таблиця
    if (pcPrih.ActivePage = tsPrihTable) and (fRezPrihBaseForm = nil) then
    begin
      fRezPrihBaseForm := TRezPrihBaseForm.Create(Self);
      b := fRezPrihBaseForm;
      b.Parent := tsPrihTable;
      bGreateForm := true;
    end
    else

    {// Графік} if (pcPrih.ActivePage = tsPrihGraphic) and (fPrihChart = nil) then
    begin
      fPrihChart := TPrihChartForm.Create(Self);
      b := fPrihChart;
      b.Parent := tsPrihGraphic;
      bGreateForm := true;
    end;
  end
  else

  {// Анализ отпусков} if (PageControl.ActivePage = tsRashChart) and (fRashChart = nil) then
  begin
    if pcRash.ActivePage = tsRashBack then
      pcRash.ActivePage := tsRashTable;

    // Таблиця
    if (pcRash.ActivePage = tsRashTable) and (fRezRashBaseForm = nil) then
    begin
      fRezRashBaseForm := TRezRashBaseForm.Create(Self);
      b := fRezRashBaseForm;
      b.Parent := tsRashTable;
      bGreateForm := true;
    end
    else

    {// Графік} if (pcRash.ActivePage = tsRashGraphic) and (fRashChart = nil) then
    begin
      fRashChart := TRashChartForm.Create(Self);
      b := fRashChart;
      b.Parent := tsRashGraphic;
      bGreateForm := true;
    end;
  end
  else

  {// Замеры "Base"} if (PageControl.ActivePage = tsMeasureBase) and (fBaseMeteringRefForm = nil) then
  begin
    fBaseMeteringRefForm := TBaseMeteringRefForm.Create(Self);
    b := fBaseMeteringRefForm;
    b.Parent := tsMeasureBase;
    bGreateForm := true;
  end
  else

  {// Анализ движения н/п } if (PageControl.ActivePage = tsBaseRepDeficit) and (fBaseRepDeficitForm = nil) then
  begin
    fBaseRepDeficitForm := TBaseRepDeficitForm.Create(Self);
    b := fBaseRepDeficitForm;
    b.Parent := tsBaseRepDeficit;
    bGreateForm := true;
  end
  else

  {// Документы "Base"} if (PageControl.ActivePage = tsDocBase) and (fBaseDocsRefForm = nil) then
  begin
    fBaseDocsRefForm := TBaseDocsRefForm.Create(Self);
    b := fBaseDocsRefForm;
    b.Parent := tsDocBase;
    bGreateForm := true;
  end
  else

  {// Сводная таблица} if (PageControl.ActivePage = tsRezervImageSvod) and (fRezervImageSvod = nil) then
  begin
    fRezervImageSvod := TRezervImageSvodForm.Create(Self);
    b := fRezervImageSvod;
    b.Parent := tsRezervImageSvod;
    bGreateForm := true;
  end
  else

  {// Замеры резервуаров} if (PageControl.ActivePage = tsHandInMeasure) and (fRezMeasureRefForm = nil) then
  begin
    fRezMeasureRefForm := TRezMeasureRefForm.Create(Self);
    b := fRezMeasureRefForm;
    b.Parent := tsHandInMeasure;
    bGreateForm := true;
  end
  else

  {// Товарные операции} if (PageControl.ActivePage = tsBaseTovarOperRef) and (fBaseTovarOperRef = nil) then
  begin
    fBaseTovarOperRef := TBaseTovarOperRefForm.Create(Self);
    b := fBaseTovarOperRef;
    b.Parent := tsBaseTovarOperRef;
    bGreateForm := true;
  end
  else

  {// Трубопровод} if (PageControl.ActivePage = tsTubes) and (fTubesForm = nil) then
  begin
    fTubesForm := TTubesForm.Create(Self);
    // Скрываем все панели
    for i := 0 to fTubesForm.pcTubes.PageCount - 1 do
      fTubesForm.pcTubes.Pages[i].TabVisible := False;
    // Выводим только нужную панель
    fTubesForm.pcTubes.ActivePage := fTubesForm.tsTubes;
    //fTubesForm.FuelId := GetSelectedList.SelectedItem.NpId;
    b := fTubesForm;
    b.Parent := tsTubes;
    bGreateForm := True;
  end;

  if bGreateForm then
  begin
    b.WindowState := wsMaximized;
    b.BorderStyle := bsNone;
    b.Anchors := [akLeft, akTop, akRight, akBottom];

    if (b.FindComponent('Panel3') as TPanel) <> nil then
      (b.FindComponent('Panel3') as TPanel).Visible := false;

    // період
    if (b.Parent <> tsRepDensity) and (b.Parent <> tsBaseRepDeficit) and (b.Parent <> tsKolebRef) and (b.Parent <> tsPoteriRez) then
    begin
      if (b.FindComponent('deBeginDate') as TDateEdit) <> nil then
        (b.FindComponent('deBeginDate') as TDateEdit).Date := deBeginDate.Date;
      if (b.FindComponent('deEndDate') as TDateEdit) <> nil then
        (b.FindComponent('deEndDate') as TDateEdit).Date := deEndDate.Date;
    end;

    if (b.FindComponent('bbSearch') as TBitBtn) <> nil then
      (b.FindComponent('bbSearch') as TBitBtn).Click;

    // Анализ приходов
    if pcPrih.ActivePage = tsPrihGraphic then
    begin
      fPrihChart.FuelId := GetSelectedList.SelectedItem.NpId;
      fPrihChart.RefreshData;
    end;

    // Анализ отпусков
    if pcRash.ActivePage = tsRashGraphic then
    begin
      fRashChart.FuelId := GetSelectedList.SelectedItem.NpId;
      fRashChart.RefreshData;
    end;
    b.Visible := true;
  end;
{$ELSE}
var
  b: TForm;
  bGreateForm: boolean;
  i: integer;
begin
  bGreateForm := false;
  
  sbTanksPosition.Down := not (
    (PageControl.ActivePage = tsChart) or (PageControl.ActivePage = tsChartAllFuel) or
    (PageControl.ActivePage = tsCountDiff));
  sbTanksPosition.Click;

  // Анализ приходов
  if (PageControl.ActivePage = tsPrihChart) and (fRezPrihBaseForm = nil) then
  begin
    if pcPrih.ActivePage = tsPrihBack then
      pcPrih.ActivePage := tsPrihTable;
    // Таблиця
    if (pcPrih.ActivePage = tsPrihTable) and (fRezPrihBaseForm = nil) then
    begin
      fRezPrihBaseForm := TRezPrihBaseForm.Create(Self);
      b := fRezPrihBaseForm;
      b.Parent := tsPrihTable;
      bGreateForm := true;
    end;
  end
  else

    {// Анализ отпусков} if (PageControl.ActivePage = tsRashChart) and (fRezRashBaseForm = nil) then
    begin
      if pcRash.ActivePage = tsRashBack then
        pcRash.ActivePage := tsRashTable;

      // Таблиця
      if (pcRash.ActivePage = tsRashTable) and (fRezRashBaseForm = nil) then
      begin
        fRezRashBaseForm := TRezRashBaseForm.Create(Self);
        b := fRezRashBaseForm;
        b.Parent := tsRashTable;
        bGreateForm := true;
      end;
    end;

  if bGreateForm then
  begin
    b.WindowState := wsMaximized;
    b.BorderStyle := bsNone;
    b.Anchors := [akLeft, akTop, akRight, akBottom];

    if (b.FindComponent('Panel3') as TPanel) <> nil then
      (b.FindComponent('Panel3') as TPanel).Visible := false;

    // період
    if (b.FindComponent('deBeginDate') as TDateEdit) <> nil then
      (b.FindComponent('deBeginDate') as TDateEdit).Date := deBeginDate.Date;
    if (b.FindComponent('deEndDate') as TDateEdit) <> nil then
      (b.FindComponent('deEndDate') as TDateEdit).Date := deEndDate.Date;

    if (b.FindComponent('bbSearch') as TBitBtn) <> nil then
      (b.FindComponent('bbSearch') as TBitBtn).Click;
    b.Visible := true;
  end;
{$ENDIF}
end;

procedure TRezervImageForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OraAlerter.Stop;
  FreeAllThread(); // знищуємо усі потоки

  if FormStyle = fsMDIChild then
    Action := caFree;
  Application.HintHidePause := 2500;
end;

procedure TRezervImageForm.bbCancelClick(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;

procedure TRezervImageForm.FactSeriesClickPointer(Sender: TCustomSeries;
  ValueIndex, X, Y: Integer);
begin
  inherited;
  SetFactAnnotation(ValueIndex,ValueIndex,ValueIndex);
end;

procedure TRezervImageForm.FactSeriesPointsClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  SetFactAnnotation(ValueIndex,ValueIndex,ValueIndex);
end;

procedure TRezervImageForm.DBChartBeforeDrawSeries(Sender: TObject);
begin
  inherited;
  if not FactSeriesPoints.ShowInLegend then
    FactSeriesPoints.Active := FactSeries.Active;
  if not BookSeriesPoints.ShowInLegend then
    BookSeriesPoints.Active := BookSeries.Active;
end;

procedure TRezervImageForm.BookSeriesPointsClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  if ssCtrl in Shift then
    SetBookAnnotation(ValueIndex);
end;

procedure TRezervImageForm.BookSeriesPointsClickPointer(
  Sender: TCustomSeries; ValueIndex, X, Y: Integer);
begin
  inherited;
  //SetBookAnnotation(ValueIndex);
end;

procedure TRezervImageForm.PopupMenuPopup(Sender: TObject);
begin
  inherited;
  AnnotationChartTool.Active := False;
end;

procedure TRezervImageForm.AnnotationChartToolClick(
  Sender: TAnnotationTool; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  AnnotationChartTool.Active := False;
end;

procedure TRezervImageForm.actShowOnDrawingUpdate(Sender: TObject);
begin
  actShowOnDrawing.Caption := Format('Показать схему трубопроводов топлива %s', [GetSelectedList.SelectedItem.NpName]);
end;

procedure TRezervImageForm.objectPopupMenuTPopupMenu1Click(Sender: TObject);
begin
  try
    GetSelectedList.MultiSelect := true;
    iClick := 2;
    OnItemMouseDownDet(ObjSender);
  finally
    iClick := 0;
  end;
end;

procedure TRezervImageForm.qChartBaseBeforeOpen(DataSet: TDataSet);
begin
  // Запуск большого запроса в фоновом режиме
  qChartBaseGroup.NonBlocking := True;
  SetParams(qChartBaseGroup);
  qChartBaseGroup.Open;
  SumTimer.Enabled := True;
end;

procedure TRezervImageForm.SumTimerTimer(Sender: TObject);
begin
  // Необходимо произвести обновление данных, когда большой запрос отработает
  if qChartBaseGroup.Active and qChartBaseGroup.Fetched then
  begin
    RefreshSums;
    RefreshMainChart(); // Формирование данных для закладки "Главная"
    SumTimer.Enabled := False;
  end;
end;

procedure TRezervImageForm.pnlSumParkClick(Sender: TObject);
var
  i: integer;
begin
  if TimerMessaging.Enabled then
    TimerMessaging.Enabled := False;
  if not pnlSumParkEx.Visible then
  begin
    PnlSumCloseTimer.Enabled := False;
    pnlSumParkEx.Width := pnlSumPark.Width;
    pnlSumParkEx.Top := pnlTrack.Top + pnlSums.Top + pnlSumPark.Top;
    pnlSumParkEx.Left := pnlTrack.Left + pnlSums.Left + pnlSumPark.Left;
    // Прорисовка
    pnlSumParkEx.Height := 0;
    pnlSumParkEx.Visible := True;
    for i := pnlSumParkEx.Constraints.MaxHeight downto 0 do
    begin
      if pnlSumParkEx.Height <> trunc(EXP(-i / 10) * pnlSumParkEx.Constraints.MaxHeight) then
      begin
        pnlSumParkEx.Height := trunc(EXP(-i / 10) * pnlSumParkEx.Constraints.MaxHeight);
        Application.ProcessMessages;
      end;
      if pnlSumParkEx.Height <> 0 then
        Sleep(4);
      //Update;
    end;
  end;
end;

procedure TRezervImageForm.pnlSumParkExMouseLeave(Sender: TObject);
begin
  if pnlSumParkEx.Height = pnlSumParkEx.Constraints.MaxHeight then
  begin
    PnlSumCloseTimer.Enabled := False;
    PnlSumCloseTimer.Enabled := True;
  end;
end;

procedure TRezervImageForm.pnlSumParkExMouseEnter(Sender: TObject);
begin
  PnlSumCloseTimer.Enabled := False;
end;

procedure TRezervImageForm.PnlSumCloseTimerTimer(Sender: TObject);
var
  i: integer;
begin
  PnlSumCloseTimer.Enabled := False;
  if pnlSumParkEx.Height <> 0 then
  begin
    for i := 0 to pnlSumParkEx.Constraints.MaxHeight do
    begin
      pnlSumParkEx.Height := trunc(EXP(-i / 10) * pnlSumParkEx.Constraints.MaxHeight);
      if pnlSumParkEx.Height <> 0 then
        Sleep(4);
      Application.ProcessMessages;
      //Update;
    end;
    pnlSumParkEx.Visible := False;
    //Application.HintHidePause := 10000;
  end;
end;

procedure TRezervImageForm.bbReOpenClick(Sender: TObject);
begin
  FormCreate(Self);
  FormShow(Self);
end;

procedure TRezervImageForm.FormCreate(Sender: TObject);
begin
  RezLogName := 'RezervImage_'+ FormatDateTime('yyyy-mm-dd', now()) +'.log';
  deBeginDate.Date := Date - 30;
  deEndDate.Date := Date;
  UseAzsChoose := False;
end;

procedure TRezervImageForm.TimerMessagingTimer(Sender: TObject);
var
  i: integer;
begin
  TimerMessaging.Enabled := False;
  for i := 1 to 6 do
  begin
    imgOpenPanel.Visible := not imgOpenPanel.Visible;
    Application.ProcessMessages;
    Sleep(1000);
  end;
end;

procedure TRezervImageForm.vtChartAllFuelFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if FChartAllFuelDate <> 0 then
    Accept := DataSet.FieldByName('mdate').AsDateTime = FChartAllFuelDate;
  if FChartAllFuelStartDate <> 0 then
    Accept := DataSet.FieldByName('mdate').AsDateTime > FChartAllFuelStartDate;
end;

// Формирование данных для закладки "Главная"
procedure TRezervImageForm.RefreshMainChart();
var
  LS: TLineSeries;
  sField: string;
  FilteredGroup: boolean;
  FilterGroup: string;
begin
  if qChartBaseGroup.Active and qChartBaseGroup.Fetched and (FChartMode <> cmAZS) then
  begin
    FChartAllFuelStartDate := 0;

    DisableCharts;

    qChartBaseGroup.DisableControls;
    FilterGroup := qChartBaseGroup.Filter;
    FilteredGroup := qChartBaseGroup.Filtered;

    try
      // вставляємо дані у графік на закладці "Главный"
      //------------------------------------------------------------------------
      qChartBaseGroup.Filtered := False;
      qChartBaseGroup.Filter := 'LITRES_ALL_POINTS <> null and is_chart = 1';
      qChartBaseGroup.Filtered := True;

      qChartBaseGroup.First;
      if dbcAllFuel.SeriesList.Count = 1 then
      begin
        //dbcAllFuel.SeriesList.Delete(0);
        //dbcAllFuel.SeriesUp();
        AllFuelSeries.DataSource := vtChartAllFuel;
        AllFuelSeries.XValues.DateTime := True;
        AllFuelSeries.XValues.ValueSource := 'mdate';
        AllFuelSeries.YValues.ValueSource := 'diff_summ';
        while not qChartBaseGroup.Eof do
        begin
          sField := 'DIFF_' + IntToStr(ABS(qChartBaseGroup.FieldByName('fuel_id').AsInteger));
          { if qChartBaseGroup.FieldByName('fuel_id').AsInteger = -22 then
           begin
             qChartBaseGroup.Next;
             Continue;
           end;    }
          if vtChartAllFuel.FieldDefs.IndexOf(sField) = -1 then
          begin
            vtChartAllFuel.FieldDefs.Add(sField, ftFloat);

            LS := TLineSeries.Create(dbcAllFuel);
            LS.Assign(AllFuelSeries);
            //LS.LinePen.Width := 2;
            LS.Marks.Visible := False;
            LS.Transparency := 30;
            LS.ParentChart := dbcAllFuel;
            LS.Name := sField;
            LS.SeriesColor := GetFuelColor(qChartBaseGroup.FieldByName('fuel_id').AsInteger);
            LS.DataSource := vtChartAllFuel;
            LS.XValues.DateTime := True;
            LS.XValues.ValueSource := 'mdate';
            LS.YValues.ValueSource := sField;
            LS.Title := qChartBaseGroup.FieldByName('fuel_name').AsString;
          end;
          qChartBaseGroup.Next;
        end;
        //dbcAllFuel.SeriesList.Move(0,dbcAllFuel.SeriesList.Count -1);
      end;

      // вставляємо дані у графік на закладці "Главный"
      vtChartAllFuel.Close;
      vtChartAllFuel.Clear;
      vtChartAllFuel.Open;

      qChartBaseGroup.First;
      while not qChartBaseGroup.Eof do
      begin
        vtChartAllFuel.Filtered := False;
        FChartAllFuelDate := trunc(qChartBaseGroup.FieldByName('mdate').AsDateTime);
        vtChartAllFuel.Filtered := True;

        if vtChartAllFuel.IsEmpty then
        begin
          vtChartAllFuel.Append;
          vtChartAllFuel.FieldByName('mdate').AsDateTime := trunc(qChartBaseGroup.FieldByName('mdate').AsDateTime);
        end
        else
          vtChartAllFuel.Edit;
        vtChartAllFuel.FieldByName('DIFF_' + IntToStr(ABS(qChartBaseGroup.FieldByName('fuel_id').AsInteger))).AsFloat :=
          qChartBaseGroup.FieldByName('diff').AsFloat;
        vtChartAllFuel.FieldByName('DIFF_SUMM').AsFloat :=
          vtChartAllFuel.FieldByName('DIFF_SUMM').AsFloat + qChartBaseGroup.FieldByName('diff').AsFloat;
        vtChartAllFuel.Post;

        qChartBaseGroup.Next
      end;
    finally
      vtChartAllFuel.Filtered := False;
      vtChartAllFuel.Filter := '';
      FChartAllFuelDate := 0;
      vtChartAllFuel.IndexFieldNames := 'mdate';
      FChartAllFuelStartDate := StrToDate('05.06.2010');
      vtChartAllFuel.Filtered := True;
      dbcAllFuel.RefreshData;
      dbcAllFuel.Refresh;
      dbcAllFuel.Legend.Repaint;

      qChartBaseGroup.Filtered := False;
      qChartBaseGroup.Filter := FilterGroup;
      qChartBaseGroup.Filtered := FilteredGroup;
      qChartBaseGroup.EnableControls;

      EnableCharts;
    end;
  end;
end;

procedure TRezervImageForm.pcPrihChange(Sender: TObject);
begin
  // < Назад
  if pcPrih.ActivePage = tsPrihBack then
  begin
    PageControl.ActivePage := tsChartAllFuel;
    pcPrih.ActivePage := tsPrihTable;
    PageControlChange(nil);
  end
  else
    PageControlChange(nil);
end;

procedure TRezervImageForm.pcRashChange(Sender: TObject);
begin
  // < Назад
  if pcRash.ActivePage = tsRashBack then
  begin
    PageControl.ActivePage := tsChartAllFuel;
    pcRash.ActivePage := tsRashTable;
    PageControlChange(nil);
  end
  else
    PageControlChange(nil);
end;

procedure TRezervImageForm.cbRestsChange(Sender: TObject);
begin
  deEndDateChange(deEndDate);
end;

procedure TRezervImageForm.ZamerBtnClick(Sender: TObject);
begin
  deBeginDate.Date:= Date-2;
  deEndDate.date:= Date;
end;

procedure TRezervImageForm.bbOnDayClick(Sender: TObject);
begin
  deBeginDate.Date:= Date-2;
  deEndDate.date:= Date;
  SetTankNumber('24');
  PageControl.ActivePage:= tsChart;
end;

procedure TRezervImageForm.TimerRezErrorTimer(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Tanks.Count - 1 do
    if Tanks[i].ValidError then
      if Tanks[i].sValid.Brush.Color = clWhite then
        Tanks[i].sValid.Brush.Color := Tanks[i].ValidColor
      else
        Tanks[i].sValid.Brush.Color := clWhite;
end;

procedure TRezervImageForm.cbValidColorClick(Sender: TObject);
var
  i: integer;
begin
  TimerRezError.Enabled := cbValidColor.Checked;

  for i := 0 to Tanks.Count - 1 do
  begin
    Tanks[i].sValid.Brush.Color := Tanks[i].ValidColor;
    Tanks[i].sValid.ShowHint    := cbValidColor.Checked;
  end;
end;

type
  TColorScheme = record
    BrushStyle: TBrushStyle;
    Color: TColor;
  end;



procedure TRezervImageForm.tsCountDiffShow(Sender: TObject);
var
  LS: TAreaSeries;
  sField: string;
  i: integer;
  Colors: array of TColorScheme;
  CurColor: integer;
  ChartFiltered, ChartGroupFiltered: boolean;
  ChartFilter, ChartGroupFilter: string;

  function Translit(s: string): string;
  const
    rus: string = 'абвгдеёжзийклмнопрстуфхцчшщьыъэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯ.-';
    lat: array[1..68] of string = ('a', 'b', 'v', 'g', 'd', 'e', 'yo', 'zh', 'z', 'i', 'y', 'k', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f', 'kh', 'ts', 'ch', 'sh', 'shch', '''', 'y', '''', 'e', 'yu', 'ya', 'A', 'B', 'V', 'G', 'D', 'E', 'Yo', 'Zh', 'Z', 'I', 'Y', 'K', 'L', 'M', 'N', 'O', 'P', 'R', 'S', 'T', 'U', 'F', 'Kh', 'Ts', 'Ch', 'Sh', 'Shch', '''', 'Y', '''', 'E', 'Yu', 'Ya',
    '', '');
  var
    p, i, l: integer;
  begin
    Result := '';
    l := Length(s);
    for i := 1 to l do
    begin
      p := Pos(s[i], rus);
      if p<1 then Result := Result + s[i] else Result := Result + lat[p];
    end;
  end;

  procedure AssignColors;
  const
    ColorGallery: array[1..14] of TColor = (clMaroon, clGreen, clOlive, clNavy,
      clPurple, clTeal, clGray, clSilver, clRed, clLime, clYellow, clBlue,
      clFuchsia, clAqua);
    BrushGallery: array[1..5] of TBrushStyle = (bsSolid, bsFDiagonal,
      bsBDiagonal, bsCross, bsDiagCross);
  var
    i, j, k: integer;
  begin
    SetLength(Colors, Length(ColorGallery)*Length(BrushGallery));
    k := Low(Colors);
    for j:=Low(BrushGallery) to high(BrushGallery) do
    begin
      for i:=Low(ColorGallery) to high(ColorGallery) do
      begin
        Colors[k].BrushStyle := BrushGallery[j];
        Colors[k].Color := ColorGallery[i];
        inc(k)
      end;
    end;
  end;

  procedure GetSchemeColor(ALS: TAreaSeries);
  begin
    inc(CurColor);
    if Colors[CurColor].BrushStyle = bsSolid then
    begin
      ALS.AreaBrush := Colors[CurColor].BrushStyle;
      ALS.SeriesColor := Colors[CurColor].Color;
      //ALS.AreaChartBrush.Color := clWhite
      ALS.AreaChartBrush.Style := Colors[CurColor].BrushStyle;
    end
    else
    begin
      ALS.AreaBrush := Colors[CurColor].BrushStyle;
      ALS.SeriesColor := clWhite;
      ALS.AreaChartBrush.Color := Colors[CurColor].Color;
      ALS.AreaChartBrush.Style := Colors[CurColor].BrushStyle;
    end;
  end;
begin
  Randomize;
  CurColor := -1;
  AssignColors;
  
  if qChartBaseGroup.Active and qChartBase.Active and qChartBaseGroup.Fetched and (FChartMode <> cmAZS) then
  begin
    DisableCharts;
    
    qChartBase.DisableControls;
    ChartFiltered := qChartBase.Filtered;
    ChartFilter := qChartBase.Filter;

    qChartBaseGroup.DisableControls;
    ChartGroupFiltered := qChartBaseGroup.Filtered;
    ChartGroupFilter := qChartBaseGroup.Filter;

    try
      // вставляємо дані у графік на закладці "График колебания"
      //------------------------------------------------------------------------
      dbcCountDiff.Title.Caption := 'Колебания по '+GetSelectedList.SelectedItem.NpName;
      
      qChartBaseGroup.Filtered := False;
      qChartBaseGroup.Filter := 'LITRES_ALL_POINTS <> null and IS_CHART = 1 and FUEL_ID = '
        +IntToStr(GetSelectedList.SelectedItem.NpId);
      qChartBaseGroup.Filtered := True;
      
      qChartBase.Filtered := False;
      qChartBase.Filter := 'LITRES_ALL_POINTS <> null and IS_CHART = 1 and FUEL_ID = '
        +IntToStr(GetSelectedList.SelectedItem.NpId);
      qChartBase.Filtered := True;


      for i:= dbcCountDiff.SeriesList.Count-1 downto 0 do
        if (dbcCountDiff.SeriesList.Items[i] <> NpGroupSeries)
          and (dbcCountDiff.SeriesList.Items[i] <> TankSeries)
        then
        begin
          LS := dbcCountDiff.SeriesList.Items[i] as TAreaSeries;
          dbcCountDiff.SeriesList.Delete(i);
          LS.Free;
        end;

      for i:= vtChartTank.FieldDefs.Count -1 downto 0 do
        if pos('DIFF_COUNT_', vtChartTank.FieldDefs.Items[i].Name) > 0 then
          vtChartTank.FieldDefs.Delete(i);

      NpGroupSeries.DataSource := qChartBaseGroup;
      NpGroupSeries.XValues.DateTime := True;
      NpGroupSeries.XValues.ValueSource := 'MDATE';
      NpGroupSeries.YValues.ValueSource := 'DIFF';


      // Создание нужных полей и линий на графике
      qChartBase.First;
      while not qChartBase.Eof do
      begin
        if qChartBase.FieldByName('FUEL_NAME').AsString = qChartBase.FieldByName('NUMB').AsString then
        begin
          qChartBase.Next;
          Continue;
        end;
        vtChartTank.Close;
        sField := 'DIFF_COUNT_' + Translit(qChartBase.FieldByName('NUMB').AsString);
        if (vtChartTank.FieldDefs.IndexOf(sField) = -1) then
        begin
          vtChartTank.FieldDefs.Add(sField, ftFloat);

          LS := TAreaSeries.Create(dbcCountDiff);
          LS.Assign(TankSeries);
          LS.Visible := True;
          LS.ShowInLegend := True;
          //LS.LinePen.Width := 2;
          LS.Marks.Visible := False;
          LS.Transparency := 30;
          LS.ParentChart := dbcCountDiff;
          LS.Name := sField;
          GetSchemeColor(LS);
          //LS.SeriesColor := GetFuelColor(qChartBase.FieldByName('fuel_id').AsInteger);
          LS.DataSource := vtChartTank;
          LS.XValues.DateTime := True;
          LS.XValues.ValueSource := 'MDATE';
          LS.YValues.ValueSource := sField;
          LS.Title := qChartBase.FieldByName('NUMB').AsString;
        end;
        qChartBase.Next;
      end;

      dbcCountDiff.SeriesList.Move(
        dbcCountDiff.SeriesList.IndexOf(NpGroupSeries),dbcCountDiff.SeriesList.Count-1);

      // Наполняем данными структуру для графика
      vtChartTank.Close;
      vtChartTank.Clear;
      vtChartTank.Open;

      qChartBase.First;
      while not qChartBase.Eof do
      begin
        vtChartTank.Filtered := False;
        FChartTankDate := qChartBase.FieldByName('MDATE').AsDateTime;
        vtChartTank.Filtered := True;
        if qChartBase.FieldByName('FUEL_NAME').AsString = qChartBase.FieldByName('NUMB').AsString then
        begin
          qChartBase.Next;
          Continue;
        end;

        if vtChartTank.IsEmpty then
        begin
          vtChartTank.Append;
          vtChartTank.FieldByName('MDATE').AsDateTime := qChartBase.FieldByName('MDATE').AsDateTime;
        end
        else
          vtChartTank.Edit;
        vtChartTank.FieldByName('DIFF_COUNT_' + Translit(qChartBase.FieldByName('NUMB').AsString)).AsFloat :=
          qChartBase.FieldByName('DIFF').AsFloat;

        if vtChartAllFuel.Active then
          vtChartTank.FieldByName('DIFF_SUMM').AsFloat :=
            vtChartAllFuel.FieldByName('DIFF_SUMM').AsFloat + qChartBase.FieldByName('DIFF').AsFloat
        else
          vtChartTank.FieldByName('DIFF_SUMM').AsFloat := qChartBase.FieldByName('DIFF').AsFloat;

        vtChartTank.Post;

        qChartBase.Next
      end;
    finally
      TankSeries.Visible := False;
      TankSeries.ShowInLegend := False;
      vtChartTank.Filtered := False;
      vtChartTank.Filter := '';
      FChartTankDate := 0;
      vtChartTank.IndexFieldNames := 'MDATE';

      dbcCountDiff.RefreshData;
      dbcCountDiff.Refresh;
      dbcCountDiff.Legend.Repaint;

      qChartBase.Filtered := False;
      qChartBase.Filter := ChartFilter;
      qChartBase.Filtered := ChartFiltered;
      qChartBase.EnableControls;

      qChartBaseGroup.Filtered := False;
      qChartBaseGroup.Filter := ChartGroupFilter;
      qChartBaseGroup.Filtered := ChartGroupFiltered;
      qChartBaseGroup.EnableControls;

      EnableCharts;
    end;
  end;
end;

procedure TRezervImageForm.vtChartTankFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if FChartTankDate <> 0 then
    Accept := DataSet.FieldByName('MDATE').AsDateTime = FChartTankDate;
end;

procedure TRezervImageForm.DisableCharts;
begin
  DBChart.AutoRefresh := False;
end;

procedure TRezervImageForm.EnableCharts;
begin
  DBChart.AutoRefresh := True;
end;

//==============================================================================
// BEGIN TThreadRefreshQuery
//==============================================================================
procedure TRezervImageForm.RefreshTanksFalse(); // Synchronize
var
  sName: string;
  i: integer;
begin
  if not bRefreshTanksFalse then
  try
    bRefreshTanksFalse := true;
    if LRecThread = nil then exit;

    for i := 0 to LRecThread.Count - 1 do
    begin
      ARecThread := LRecThread.Items[i];

      if ARecThread.Thread <> nil then
        if ARecThread.Thread.FActiveThread and ARecThread.Thread.FCreateQNew
          and (ARecThread.Thread.FqOld <> ARecThread.Thread.FqNew) then
        begin
          RezLog('Загрузка TOraQuery('+ ARecThread.qName +') ...'); // лог
          try
            sName := ARecThread.Thread.FqOld.Name;
            ARecThread.Thread.FqOld.Close;
            ARecThread.Thread.FqOld.Free;
            ARecThread.Thread.FqNew.Name := sName;
            ARecThread.Thread.FqOld := ARecThread.Thread.FqNew;

            if AnsiUpperCase(sName) = 'QCHARTBASE' then
            begin
              qChartBase.BeforeOpen := qChartBaseBeforeOpen;
              qChartBaseBeforeOpen(qChartBase);
            end;

            RezLog('Создана TOraQuery('+ ARecThread.Thread.FqOld.Name +', '+ IntToStr(ARecThread.Thread.FqOld.RecordCount) +')'); // лог
          except on E: Exception do
            RezLog('Ошибка создания TOraQuery('+ ARecThread.qName +') : '+ E.Message); // лог
          end;
          FreeThread(ARecThread.Thread); // знищуємо поток
        end;
    end;

    Self.Repaint;
    RefreshTanks(false);
    // Обновление информации на графике
    RefreshChart(false);
  finally
    bRefreshTanksFalse := false;
  end;
end;

procedure TRezervImageForm.OraAlerterEvent(Sender: TObject; Event, Message: String);
var
  i: integer;
  bCreateLog: boolean;
begin
  if not bRefreshTanksFalse then
  try
    bRefreshTanksFalse := true;
    if LRecThread = nil then exit;
    if Message = '' then exit;
    bCreateLog := SysParamExists('TERMINAL');

    for i := 0 to LRecThread.Count - 1 do
    begin
      ARecThread := LRecThread.Items[i];

      if (pos(AnsiLowerCase(Message), AnsiLowerCase(ARecThread.sEvent)) > 0) then
      begin
        if ARecThread.Thread <> nil then
          if not ARecThread.Thread.FActiveThread then
            FreeThread(ARecThread.Thread); // знищуємо поток

        if ARecThread.Thread = nil then
        begin
          if (ARecThread.sEvent = 'book,fact') and qChartBase.Active then // графік + резервуари + труби
            ARecThread.Thread := TThreadRefreshQuery.Create(qChartBase, RefreshTanksFalse, bCreateLog)
          else

          if (ARecThread.sEvent = 'zamer_load') and qTanksLastZamerTime.Active then // останні заміри
            ARecThread.Thread := TThreadRefreshQuery.Create(qTanksLastZamerTime, RefreshTanksFalse, bCreateLog)
          else

          if (ARecThread.sEvent = 'zamer') and qChartZamer.Active then // заміри
            ARecThread.Thread := TThreadRefreshQuery.Create(qChartZamer, RefreshTanksFalse, bCreateLog)
          else

          if (ARecThread.sEvent = 'tank') and qTanksBase.Active then // резервуари + труби
            ARecThread.Thread := TThreadRefreshQuery.Create(qTanksBase, RefreshTanksFalse, bCreateLog);

          if ARecThread.Thread <> nil then
            RezLog('Создан поток '+ VarToStr(ARecThread.Thread.ThreadID)); // лог
          LRecThread.Items[i] := ARecThread;
        end;
      end;
    end;
  finally
    bRefreshTanksFalse := false;
  end;
end;

procedure TRezervImageForm.FreeAllThread(); // знищуємо усі потоки
var
  i: integer;
begin
  if LRecThread = nil then exit;

  for i := 0 to LRecThread.Count - 1 do
  begin
    ARecThread := LRecThread.Items[i];

    if ARecThread.Thread <> nil then
      FreeThread(ARecThread.Thread); // знищуємо поток

    LRecThread.Items[i] := ARecThread;
  end;
end;

procedure TRezervImageForm.FreeThread(var T: TThreadRefreshQuery); // знищуємо поток
begin
  RezLog('Уничтожение потока '+ VarToStr(T.ThreadID)); // лог
  T.FActiveThread := false;
  T := nil;
end;

procedure TRezervImageForm.OraAlerterTimeOut(Sender: TObject; var Continue: Boolean);
begin
  Continue := true;
end;
//==============================================================================
// END TThreadRefreshQuery
//==============================================================================
procedure TRezervImageForm.RezLog(s: string); // лог
begin
  if SysParamExists('TERMINAL') then
    ExFunc.log(RezLogName, FormatDateTime('dd.mm.yyyy hh:nn:ss', now()) +' '+ s);
end;
//==============================================================================

procedure TRezervImageForm.sbFullScreenClick(Sender: TObject);
begin
  FullScreenTool.Active := not FullScreenTool.Active;
end;

end.
