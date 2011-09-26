{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}

{$MINSTACKSIZE $00004000}

{$MAXSTACKSIZE $00100000}

{$IMAGEBASE $00400000}

{$APPTYPE GUI}

unit Main;

{$I define}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, DBTables, Buttons, ExtCtrls,ShellAPI, ToolWin, SpeedBar,
  RXCtrls, ImgList, AboutBox, RxGIF, Db, ComObj,  RxVerInf,ReportManager,
   ActiveX, IniFiles, registry, UObjectCacheClass, E_Object, E_Permit,
 {$IFDEF VER120}
  OleCtrls, uCommonForm, OraScript, TimerLst, Placemnt, MemDS, DBAccess,
  Ora, uOilQuery,
{$ENDIF}                  
  Excel8TLB, Placemnt, StdCtrls, RxRichEd, TimerLst, DBAccess, Ora,
  BDESession, uCheckups, uMessageDlgExt, uHelpButton, uDBStructure, uDBSaver, uCommonForm,
  ScktComp, EditBase, Gtd, ZavodRash, Raskred, PrihTrans, RailStat, MemDS,
  uOilQuery, RashPvl, AutoShip,Prih,uExeSql,uBill, uCardBlank, uCardRequest, uCarting,
  OraScript{$IFDEF VER150},Variants{$ENDIF}, SlBook, uAviasRests, ImportCashtan,
  RezMeasureEdit, basedocsref, meteringref, tubes, DAScript;

  type

  IOilDb = interface
  ['{9AE99C97-9C55-4842-B114-A7BFE5908390}']
    function ReadOilVar_(AName: PChar) : ShortString;
    function GetVal_(AValue: PChar): ShortString;
    function GetSQLValue_(ASql: PChar): ShortString;
    procedure ExecSql_(ASQL: PChar);
  end;

  TMainForm= class(TCommonForm, IOilDb)
    StatusBar: TStatusBar;
    pmTalon: TPopupMenu;
    N110: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    Panel1: TPanel;
    Panel3: TPanel;
    ToolBar2: TToolBar;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    bPrih: TToolButton;
    ToolBar1: TToolBar;
    ToolButton5: TToolButton;
    ToolButton1: TToolButton;
    bRash: TToolButton;
    ToolButton3: TToolButton;
    MainMenu1: TMainMenu;
    miFile: TMenuItem;
    N19: TMenuItem;
    miExit: TMenuItem;
    miUchet: TMenuItem;
    miSminRep: TMenuItem;
    miService: TMenuItem;
    miMoney: TMenuItem;
    N6: TMenuItem;
    miAddTalon: TMenuItem;
    miPrihTalon: TMenuItem;
    miRef: TMenuItem;
    miPrihRef: TMenuItem;
    miRashRef: TMenuItem;
    miPartRef: TMenuItem;
    miOrgRef: TMenuItem;
    miAutoRef: TMenuItem;
    miEmpRef: TMenuItem;
    miBankRef: TMenuItem;
    miCommon: TMenuItem;
    miNPTypeRef: TMenuItem;
    miOperType: TMenuItem;
    miSettings: TMenuItem;
    miWindows: TMenuItem;
    miCascade: TMenuItem;
    N17: TMenuItem;
    miArrangeIcons: TMenuItem;
    N16: TMenuItem;
    About: TAboutBoxBank;
    miAbout: TMenuItem;
    ToolButton4: TToolButton;
    tbSminRep: TToolButton;
    pmRef: TPopupMenu;
    N3: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    bPartRef: TToolButton;
    ToolButton9: TToolButton;
    dQuery: TOilQuery;
    miReports: TMenuItem;
    miRepKomNB: TMenuItem;
    qOrg: TOilQuery;
    miRezAZSRep: TMenuItem;
    miSystem: TMenuItem;
    miUsers: TMenuItem;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    N14: TMenuItem;
    N18: TMenuItem;
    admq: TOilQuery;
    miMoveRep: TMenuItem;
    bMoney: TToolButton;
    bRezPartLeft: TToolButton;
    miKP_Dog: TMenuItem;
    ToolButton14: TToolButton;
    bExchPart: TToolButton;
    miSep2: TMenuItem;
    miExchPart: TMenuItem;
    N22: TMenuItem;
    miPertReezRep: TMenuItem;
    miDebKred: TMenuItem;
      miDeb: TMenuItem;
      miDebitors: TMenuItem;
      miKreditors: TMenuItem;
    bSQL: TToolButton;
    miSQL: TMenuItem;
    bService: TToolButton;
    miSaleBook: TMenuItem;
    miUd_WeigRep: TMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    N24: TMenuItem;
    miPrintSetup: TMenuItem;
    pmRash: TPopupMenu;
    miRash: TMenuItem;
    miRashPP: TMenuItem;
    miRashOut: TMenuItem;
    pmPrih: TPopupMenu;
    miAddPrih: TMenuItem;
    miAzsRet: TMenuItem;
    miMoveNBRep: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N28: TMenuItem;
    il: TImageList;
    Image: TImageList;
    HotImage: TImageList;
    N33: TMenuItem;
    miTalonPotrReport: TMenuItem;
    miRestOAO: TMenuItem;
    N34: TMenuItem;
    qNN: TOilQuery;
    N35: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    bSaleBook: TToolButton;
    FormStorage1: TFormStorage;
    N41: TMenuItem;
    N42: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    RestsQuery: TOilQuery;
    Query1: TOilQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    NNNumQuery: TOilQuery;
    NNNumQueryNEWNUM: TFloatField;
    N49: TMenuItem;
    N50: TMenuItem;
    N51: TMenuItem;
    miOperNNList: TMenuItem;
    miClosePeriod: TMenuItem;
    DebitorsQuery: TOilQuery;
    qTemp: TOilQuery;
    N58: TMenuItem;
    N60: TMenuItem;
    mi1C: TMenuItem;
    N63: TMenuItem;
    N64: TMenuItem;
    miInventar: TMenuItem;
    N66: TMenuItem;
    N67: TMenuItem;
    N68: TMenuItem;
    N69: TMenuItem;
    N70: TMenuItem;
    N71: TMenuItem;
    N72: TMenuItem;
    N73: TMenuItem;
    N74: TMenuItem;
    N75: TMenuItem;
    N76: TMenuItem;
    N2: TMenuItem;
    miFinance: TMenuItem;
    N77: TMenuItem;
    N81: TMenuItem;
    N82: TMenuItem;
    N84: TMenuItem;
    N85: TMenuItem;
    N86: TMenuItem;
    N87: TMenuItem;
    N88: TMenuItem;
    miOs: TMenuItem;
    qOrgNAME: TStringField;
    qOrgPAR: TFloatField;
    qOrgPAR_INST: TFloatField;
    qOrgORG_TYPE: TFloatField;
    qOrgORG_ID: TFloatField;
    qOrgPAR_NAME: TStringField;
    qOrgTALON_CODE: TFloatField;
    N91: TMenuItem;
    qOrgCARD_ID: TFloatField;
    N92: TMenuItem;
    N93: TMenuItem;
    N94: TMenuItem;
    N210: TMenuItem;
    N112: TMenuItem;
    N211: TMenuItem;
    N310: TMenuItem;
    N311: TMenuItem;
    miSep3: TMenuItem;
    N96: TMenuItem;
    N97: TMenuItem;
    N98: TMenuItem;
    N99: TMenuItem;
    pmExch: TPopupMenu;
    N100: TMenuItem;
    N101: TMenuItem;
    N102: TMenuItem;
    N103: TMenuItem;
    N113: TMenuItem;
    N1: TMenuItem;
    N15: TMenuItem;
    N55: TMenuItem;
    N56: TMenuItem;
    miOneOilInstance: TMenuItem;
    miChangeOrg: TMenuItem;
    N109: TMenuItem;
    timDailyRep: TRxTimerList;
    MessEvent: TRxTimerEvent;
    ExpireEvent: TRxTimerEvent;
    N111: TMenuItem;
    miOSRef: TMenuItem;
    N114: TMenuItem;
    N115: TMenuItem;
    miKonkPrice: TMenuItem;
    N118: TMenuItem;
    miLSNN: TMenuItem;
    miComp: TMenuItem;
    N121: TMenuItem;
    N122: TMenuItem;
    N123: TMenuItem;
    N124: TMenuItem;
    N125: TMenuItem;
    N126: TMenuItem;
    N127: TMenuItem;
    N128: TMenuItem;
    N129: TMenuItem;
    N120: TMenuItem;
    timPackets: TRxTimerList;
    UnloadAfterDR: TRxTimerEvent;
    UnloadEvening: TRxTimerEvent;
    UnloadMessage: TRxTimerEvent;
    miMoneyOut: TMenuItem;
    miDiscount: TMenuItem;
    miThirdPartyTranz: TMenuItem;
    miDiscountType: TMenuItem;
    miAzsDevice: TMenuItem;
    G1: TMenuItem;
    N119: TMenuItem;
    timPetrol: TRxTimerList;
    teSuccIncass: TRxTimerEvent;
    teSuccIncassMsg: TRxTimerEvent;
    teLoadModemTrans: TRxTimerEvent;
    teLoadModemTransMsg: TRxTimerEvent;
    teLoadCardTrans: TRxTimerEvent;
    teLoadCardTransMsg: TRxTimerEvent;
    tePutBlackList: TRxTimerEvent;
    tePutBlackListMsg: TRxTimerEvent;
    teLoadPackPC: TRxTimerEvent;
    teLoadPackPCMsg: TRxTimerEvent;
    teSendPackPC: TRxTimerEvent;
    teSendPackPCMsg: TRxTimerEvent;
    teMakeBlackList: TRxTimerEvent;
    teMakeBlackListMsg: TRxTimerEvent;
    teRunComServerMsg: TRxTimerEvent;
    pmMDI: TPopupMenu;
    miMDIRestore: TMenuItem;
    miMDIMinimize: TMenuItem;
    N132: TMenuItem;
    miMDIClose: TMenuItem;
    N133: TMenuItem;
    miFullScreen: TMenuItem;
    miTransMoveInst: TMenuItem;
    N134: TMenuItem;
    N137: TMenuItem;
    miLSSeparator: TMenuItem;
    N136: TMenuItem;
    miBalImp: TMenuItem;
    qMainMenu: TOilQuery;
    N9: TMenuItem;
    miServ: TMenuItem;
    miTestDb: TMenuItem;
    N61: TMenuItem;
    N11: TMenuItem;
    miCountBetweenFilCard: TMenuItem;
    N30: TMenuItem;
    N32: TMenuItem;
    miImpCreditCard: TMenuItem;
    miSynchroOrg: TMenuItem;
    miAktSverki: TMenuItem;
    N29: TMenuItem;
    N36: TMenuItem;
    miSynchroAuto: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N43: TMenuItem;
    miChangeOrgNameDual: TMenuItem;
    miTaxBillReports: TMenuItem;
    miPerevalka: TMenuItem;
    N130: TMenuItem;
    qNNID: TFloatField;
    qNNINST: TFloatField;
    qNNS_DATE: TDateTimeField;
    qNNORGAN: TFloatField;
    qNNORGAN_INST: TFloatField;
    qNNNUM: TStringField;
    qNNF_DOC: TStringField;
    qNNFRASCH: TStringField;
    qNNR_DATE: TDateTimeField;
    qNNSALE_TXT: TStringField;
    qNNNDS_T: TFloatField;
    qNNNDS_P_BASE: TFloatField;
    qNNNDS_P_20: TFloatField;
    qNNNDS_NP_BASE: TFloatField;
    qNNNDS_NP_20: TFloatField;
    qNNVNDS_T: TFloatField;
    qNNVNDS_P_S: TFloatField;
    qNNVNDS_P_O: TFloatField;
    qNNVNDS_P_NB: TFloatField;
    qNNVNDS_NP_S: TFloatField;
    qNNVNDS_NP_O: TFloatField;
    qNNVNDS_NP_NB: TFloatField;
    qNNVNDS_NP_EXP: TFloatField;
    qNNK_VNDS_S: TFloatField;
    qNNK_VNDS_O: TFloatField;
    qNNK_NDS_B: TFloatField;
    qNNK_NDS_20: TFloatField;
    qNNTOV_ID: TFloatField;
    qNNDIV_ID: TFloatField;
    qNNKOL: TFloatField;
    qNNFROM_: TFloatField;
    qNNFROM_INST: TFloatField;
    qNNNAL_T: TFloatField;
    qNNFROM_NAME: TStringField;
    qNNFROM_ADDR: TStringField;
    qNNFROM_SVID_NUM: TStringField;
    qNNFROM_NAL_NUM: TStringField;
    qNNFROM_BOSS: TStringField;
    qNNFROM_OKPO: TStringField;
    qNNFROM_PHONE: TStringField;
    qNNTO_NAME: TStringField;
    qNNTO_ADDR: TStringField;
    qNNTO_SVID_NUM: TStringField;
    qNNTO_NAL_NUM: TStringField;
    qNNTO_BOSS: TStringField;
    qNNTO_OKPO: TStringField;
    qNNTO_PHONE: TStringField;
    qNNDIM_NAME: TStringField;
    qNNNP_TYPE_NAME: TStringField;
    qNNPRICE: TFloatField;
    BaseImage: TImageList;
    N10: TMenuItem;
    miSynchroEmploy: TMenuItem;
    nOilTest: TMenuItem;
    OraScriptTalon: TOraScript;
    nRefreshTalonAE: TMenuItem;
    UnloadCardAlientRn: TRxTimerEvent;
    Ngksu_opt: TMenuItem;
    timOilChecks: TRxTimerList;
    RegularFirstTest: TRxTimerEvent;
    DayEndOilOff: TRxTimerEvent;
    OilOffLast1Min: TRxTimerEvent;
    miChangeAzsParent: TMenuItem;
    miSvodFilAZSNew: TMenuItem;
    miAvias: TMenuItem;
    miSvodFilAZS6NPG: TMenuItem;
    miImportCashTan: TMenuItem;
    miParseExcelTest: TMenuItem;
    miNpPriceRef: TMenuItem;
    miBasicElectronFormReport: TMenuItem;
    ToolButton2: TToolButton;
    miSep1: TMenuItem;
    miMeteringRef: TMenuItem;
    miRezMeasureRef: TMenuItem;
    BaseDocsRef: TMenuItem;
    imRezPark: TImage;
    miTubes: TMenuItem;
    BaseTovarOperRef: TMenuItem;
    misep4: TMenuItem;
    miRepDeficit: TMenuItem;
    miRezRashBase: TMenuItem;
    miRezPrihBase: TMenuItem;
    miAzsNpPriceRef: TMenuItem;
    procedure MenuReportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miNPTypeClick(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miAboutClick(Sender: TObject);
    procedure N110Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure tbSminRepClick(Sender: TObject);
    procedure miPrihRefClick(Sender: TObject);
    procedure miRashRefClick(Sender: TObject);
    procedure miPartRefClick(Sender: TObject);
    procedure miAutoRefClick(Sender: TObject);
    procedure miEmpRefClick(Sender: TObject);
    procedure miBankRefClick(Sender: TObject);
    procedure miNPTypeRefClick(Sender: TObject);
    procedure miOperTypeClick(Sender: TObject);
    procedure miRepKomNBClick(Sender: TObject);
    procedure miSystemClick(Sender: TObject);
    procedure miUsersClick(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure miCascadeClick(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure miArrangeIconsClick(Sender: TObject);
    procedure bMoneyClick(Sender: TObject);
    procedure miKP_DogClick(Sender: TObject);
    procedure miExchPartClick(Sender: TObject);
    procedure miPertReezRepClick(Sender: TObject);
    procedure miPumpClick(Sender: TObject);
    procedure miSQLClick(Sender: TObject);
    procedure miSaleBookClick(Sender: TObject);
    procedure miUd_WeigRepClick(Sender: TObject);
    procedure miPrintSetupClick(Sender: TObject);
    procedure miRashClick(Sender: TObject);
    procedure miRashPPClick(Sender: TObject);
    procedure miRashOutClick(Sender: TObject);
    procedure miAddPrihClick(Sender: TObject);
    procedure miAzsRetClick(Sender: TObject);
    procedure miMoveNBRepClick(Sender: TObject);
    procedure miRashVadomRepClick(Sender: TObject);
    procedure miTalonPotrReportClick(Sender: TObject);
    Procedure PrintNN(NNId,NNInst : Integer);
    procedure N38Click(Sender: TObject);
    procedure miRezAZSRepClick(Sender: TObject);
    procedure bServiceClick(Sender: TObject);
    procedure bSaleBookClick(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure miRestOAOClick(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure miDebClick(Sender: TObject);
    procedure miDebitorsClick(Sender: TObject);
    procedure miKreditorsClick(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure N46Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure N50Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure miOperNNListClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure miClosePeriodClick(Sender: TObject);
    procedure miTestDbClick(Sender: TObject);
    procedure N58Click(Sender: TObject);
    procedure N60Click(Sender: TObject);
    procedure mi1CClick(Sender: TObject);
    procedure N63Click(Sender: TObject);
    procedure N64Click(Sender: TObject);
    procedure N66Click(Sender: TObject);
    procedure N67Click(Sender: TObject);
    procedure N68Click(Sender: TObject);
    procedure N69Click(Sender: TObject);
    procedure N70Click(Sender: TObject);
    procedure N72Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N81Click(Sender: TObject);
    procedure N84Click(Sender: TObject);
    procedure N85Click(Sender: TObject);
    procedure N87Click(Sender: TObject);
    procedure N88Click(Sender: TObject);
    procedure miOsClick(Sender: TObject);
    procedure N91Click(Sender: TObject);
    procedure N93Click(Sender: TObject);
    procedure N94Click(Sender: TObject);
    procedure N210Click(Sender: TObject);
    procedure N112Click(Sender: TObject);
    procedure N211Click(Sender: TObject);
    procedure N310Click(Sender: TObject);
    procedure N311Click(Sender: TObject);
    procedure N96Click(Sender: TObject);
    procedure N97Click(Sender: TObject);
    procedure bSQLClick(Sender: TObject);
    procedure N99Click(Sender: TObject);
    procedure N100Click(Sender: TObject);
    procedure N101Click(Sender: TObject);
    procedure N102Click(Sender: TObject);
    procedure N103Click(Sender: TObject);
    procedure N113Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N55Click(Sender: TObject);
    procedure miOneOilInstanceClick(Sender: TObject);
    procedure miChangeOrgClick(Sender: TObject);
    procedure N109Click(Sender: TObject);
    procedure ExpireEventTimer(Sender: TObject);
    procedure MessEventTimer(Sender: TObject);
    procedure N111Click(Sender: TObject);
    procedure miOSRefClick(Sender: TObject);
    procedure N114Click(Sender: TObject);
    procedure N115Click(Sender: TObject);
    procedure miKonkPriceClick(Sender: TObject);
    procedure N118Click(Sender: TObject);
    procedure miLSNNClick(Sender: TObject);
    procedure N127Click(Sender: TObject);
    procedure N128Click(Sender: TObject);
    procedure N129Click(Sender: TObject);
    procedure N123Click(Sender: TObject);
    procedure N124Click(Sender: TObject);
    procedure N126Click(Sender: TObject);
    procedure N120Click(Sender: TObject);
    procedure N125Click(Sender: TObject);
    procedure UnloadAfterDRTimer(Sender: TObject);
    procedure UnloadEveningTimer(Sender: TObject);
    procedure UnloadMessageTimer(Sender: TObject);
    procedure miMoneyOutClick(Sender: TObject);
    procedure miDiscountClick(Sender: TObject);
    procedure miThirdPartyTranzClick(Sender: TObject);
    procedure miDiscountTypeClick(Sender: TObject);
    procedure miAzsDeviceClick(Sender: TObject);
    procedure G1Click(Sender: TObject);
    procedure N119Click(Sender: TObject);
    procedure DayEndOilOffTimer(Sender: TObject);
    procedure RegularFirstTestTimer(Sender: TObject);
    procedure OilOffLast1MinTimer(Sender: TObject);
    procedure teSuccIncassMsgTimer(Sender: TObject);
    procedure teSuccIncassTimer(Sender: TObject);
    procedure teRunComServerMsgTimer(Sender: TObject);
    procedure teLoadModemTransTimer(Sender: TObject);
    procedure teLoadCardTransTimer(Sender: TObject);
    procedure tePutBlackListTimer(Sender: TObject);
    procedure teLoadPackPCTimer(Sender: TObject);
    procedure teSendPackPCTimer(Sender: TObject);
    procedure teMakeBlackListTimer(Sender: TObject);
    procedure teMakeBlackListMsgTimer(Sender: TObject);
    procedure teSendPackPCMsgTimer(Sender: TObject);
    procedure teLoadPackPCMsgTimer(Sender: TObject);
    procedure tePutBlackListMsgTimer(Sender: TObject);
    procedure teLoadCardTransMsgTimer(Sender: TObject);
    procedure teLoadModemTransMsgTimer(Sender: TObject);
    procedure miMDICloseClick(Sender: TObject);
    procedure miMDIRestoreClick(Sender: TObject);
    procedure miMDIMinimizeClick(Sender: TObject);
    procedure miFullScreenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure miTransMoveInstClick(Sender: TObject);
    procedure miBalImpClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N212Click(Sender: TObject);
    procedure N213Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure MainMenu1Change(Sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure miCountBetweenFilCardClick(Sender: TObject);
    procedure miImpCreditCardClick(Sender: TObject);
    procedure miAktSverkiClick(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ServerSocketClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure miChangeOrgNameDualClick(Sender: TObject);
    procedure N130Click(Sender: TObject);
    procedure miSynchroClick(Sender: TObject);
    procedure nOilTestClick(Sender: TObject);
    procedure nRefreshTalonAEClick(Sender: TObject);
    procedure OraScriptTalonError(Sender: TObject; E: Exception;
      SQL: String; var Action: TErrorAction);
    procedure UnloadCardAlientRnTimer(Sender: TObject);
    procedure Ngksu_optClick(Sender: TObject);
    procedure miChangeAzsParentClick(Sender: TObject);
    procedure miSvodFilAZSClick(Sender: TObject);
    procedure miSvodFilAZSNewClick(Sender: TObject);
    procedure miSvodFilAZS6NPGClick(Sender: TObject);
    procedure miImportCashTanClick(Sender: TObject);
    procedure miParseExcelTestClick(Sender: TObject);
    procedure miNpPriceRefClick(Sender: TObject);
    procedure miBasicElectronFormReportClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure miMeteringRefClick(Sender: TObject);
    procedure miRezMeasureRefClick(Sender: TObject);
    procedure BaseDocsRefClick(Sender: TObject);
    procedure miTubesClick(Sender: TObject);
    procedure BaseTovarOperRefClick(Sender: TObject);
    procedure miRepDeficitClick(Sender: TObject);
    procedure miRezRashBaseClick(Sender: TObject);
    procedure miRezPrihBaseClick(Sender: TObject);
    procedure miAzsNpPriceRefClick(Sender: TObject);
  private
    slMenuReports: TStringList;
    Procedure AddTalon;
    Procedure OutTalon;
    Procedure BankRef;
    Procedure EmpRef;
  public
    { Public declarations }
    FMainCaption : String;
    FIXLSApp: Excel8TLB._Application;
    ClientRectColor : TColor;
    IsAdminClose : Boolean;
    procedure _Halt(n:integer=1);
    procedure LoadAdmSettings;
    procedure ProcessMainMenu;
    procedure DefineCurrentOrg(ARecuirson:boolean=true);
    procedure CreateExcel (NewInstance: boolean);
    procedure ShowExcel;
    procedure HideExcel;
    procedure ReleaseExcel;
    procedure DisplayHint(Sender: TObject);
    function AddWorkbook(const WorkbookName: string): Excel8TLB._Workbook;
    property IXLSApp: Excel8TLB._Application read FIXLSApp;
          function PartRest(PartId, PartInst:integer):real;
          function RezRest (RezId, RezInst:integer):real;
          function PartRezRest(PartId,PartInst,RezId,RezInst:integer):real;
    function GetNextNNNumber(NNDate: TDateTime):string;
    procedure btnMDIClick(Sender:TOBject);
    procedure MDIFormActivate(Sender:TObject);
    procedure MDIFormClose(Sender:TObject);
    procedure DoMDIButton(frm:TForm);
    procedure GetRefByClass(AFormName: string);    
    procedure CreateMDIButton(frm:TForm);
    procedure RelocateButtons();
    procedure Admining(AForm:TForm; AEmp_Id:integer);
    procedure LoadXMLForms;
    procedure ItemXMLFormClick(Sender: TObject);
    (** Добавляет меню по определенному пути *)
    function AddMenuItemPath(
      p_MenuPath: string;
      p_Position: integer = -1;
      p_Name: string = '';
      p_MenuNamePath: string=''): TMenuItem;
    procedure AddReportsMenu;
    procedure ExceptionHandler(Sender: TObject; E: Exception);
    {методы интерфейса IOilDb}
    function ReadOilVar_(AName: PChar) : ShortString;
    function GetVal_(AValue: PChar): ShortString;
    function GetSQLValue_(ASql: PChar): ShortString;
    procedure ExecSql_(ASQL: PChar);
    procedure SetCaption(AOrgName: String);
    function IsAllFormsClosed: boolean;
  end;

  TGetSysInfo = procedure(AConnectString: String); stdcall;

  function ShowExistentForm(Caption_ : string):boolean;
  function RevealNonSynchroPart(Mode:integer) : boolean;
  function GetSystemDate: TDateTime;
  function GetTruncSystemDate: TDate;
  function DailyRepControl(var Msg : string;Startup:boolean=false):integer;
  procedure WritePieceOfRegistry(KeyName,KeyValue: string;
      RootKey: HKEY = HKEY_CURRENT_USER; KeyFolder: string = 'Software\Oil');
  Function ReadPieceOfRegistry(RootKey: HKEY; KeyFolder, KeyName : string):String;
  procedure LoadOilVar;
  function SetPacketTimer(var Msg:string;Startup: boolean=false):integer;
  function CheckUpIsTooOld(var Msg : string):integer;
  function DebetorIsTooOld(var Msg : string):integer;
  function GetVal(Z:variant):variant;
  Function PreviousWorkDay(CurrDay : TDateTime; DaysBack:integer=1; Truncated : boolean=True): TDateTime;
  function SysParamExists(p_Name: string): Boolean;
  function SysParamValue(p_Name: string): string;
  procedure BlockOpenForms;
  procedure PrepareTranslateText;  // процедурка для украинизации сбщений

type
  TEditClass = class of TEditBaseForm;
  TOrgFilMoveType = (fmtCommon,fmtBeforeFil,fmtFilial);

var
  MainForm: TMainForm;
  CHECKSUM_KEY: String;

  REAL_INST,INST,MAIN_ID,MAIN_TYPE,MAIN_PAR,MAIN_PAR_INST,INST_OLD,INST_FIL,INST_DUAL,TALON_CODE_OLD: Integer;
  INST_MOVE_DATE: string;
  INST_LIST: string;
  IsBeforeFil: Boolean;
  OILBASE,AZS,OBL,MAINORG: Integer;
  SUPER_REAL_EMP_ID,//Присваиваеться только при логине, используеться для извлечения данных о текущем пользователе
  REAL_EMP_ID,  EMP_ID:INTEGER;//Используеться для блокировок
  ORG_NAME_DUAL_POS:integer;
  MD: integer;  // тип запуска: 0=Обычный; 1=Архивный; 2=Отладочный; 3=Обыч.(OIL_LOAD); 4=Автозагрузка см. отчетов

  Unknown : iUnknown;
  List, MsWord, XLAPP, Range, MsExcel : Variant;
  NP_DT,NP_A76,NP_A80,NP_A92,NP_A93,NP_A95,NP_A98,NP_MASLO:integer;
  OPG_AZSRET,OPG_PRIHOD,OPG_MOVE,OPG_MOVERR,OPG_OUT,OPG_OPER,OPG_OPLATA,OPG_RASHOD,DOST_SKLAD:integer;

  OPER_IN_ST,OPER_IN_XR,OPER_IN_KM,OPER_OUT_AZS,
  OPER_OUT_NAL,OPER_OUT_BNAL, OPER_MOVENB,OPER_MOVERR,DIM_LITR,DIM_TONN,OPER_OUT_XR,
  OPER_OUT_TALON,OPER_OUT_SN,ALFANAFTA,ALFANAFTAP:integer;
  MAIN_ORG_IS_FILIAL: Boolean;
  OrgFilMoveType: TOrgFilMoveType;

  PRINT_TYPE_DAILY_TAX,
  NAL_NUM_RESERVE,NAL_NUM_RESERVE_NALICHKA, NAL_NUM_HAND, NN_WITH_UPPER_REKVIZIT ,NN_CLIENT_ADRESS,
  OPER_BART, OPER_OWPR, OPER_ZACH, REPKOMNP, OPER_NOT_NN, FILIAL_NUMBER, PRINT_UPPER_ADRESS,
  AVIZO_SYFFIX,
  DOG_POST_CONDITION,DOG_POST_CONDITION_DEFAULT, PRINT_TTN_FIL_NK, BUH_SHIP, MANAGER_SHIP, PRINT_RN_FILIAL,
  DOG_POST_CONDITION_FROM_WHOM, PRINT_RN_FILIAL_CT,
  PAR_ADDRESS, PRINT_DOG_FILIAL, Close_Date, Close_Date_Obl, Close_Date_Alfa, CURRENT_NAME, LAUNCH_MODE,
  DOG_WITH_REKVIZIT_CONTROL, REKVIZIT_FILIALA_NK, PRINT_RS, // Для печати договоров
  PRINT_TTN_REAL_ADDRESS,OPER_OWN_NEEDS, OPER_WITHOUT_NDS, WILD_AZS_INCASS, DEBET_LAST_YEAR,
  BILL_NUM_FOR_CARD: String;
  DOUBLE_SCAN: Boolean;
  OBL_CARD_START_DATE: Variant;
  OBL_CARD_NP_GROUP, EXCH_PART_TIME, SYN_PARTS_CHECK_DAYS : integer;
  OBL_CARD_PRICE: real;
  OIL_START_DATE: TDateTime;

  INTERACTIVE_LAUNCH_MODE: Boolean=TRUE; // если FALSE, то все диалоги при запуске не выводятся на экран
  LOGIN_STRING: string; // строка вида логин/пароль
  AUTO_SAVE_DIRECTORY: string; // папка в которую будут автоматически записываться отчеты при построении
  AUTO_SAVE_SUFFIX: string; // суффикс, который добавляется к имени отчета при автосохранении
  REPORT_SCRIPT_FILENAME: string; // имя файла из которого будет читаться скрипт с отчетами

// Переменне для контроля проверок
  CH_FLAG_COUNTER, CH_AUDIT_LIST, CH_FIRST_BUG_DATE, CH_STARTUP_DATE,
  CH_CRITICAL_DATE : string;
  CH_TALON_LEVEL, CH_SILENCE_PERIOD, CH_CARD_LEVEL,
  CH_CORRECTION_PERIOD, CH_DAYS_BETWEEN_CHECKUP, CH_BUGS_COUNT : integer;
  ORACLE_VERSION: string; // версия оракла

  AZS_WITH_GSM : string = ',210,313,330,331,341,347,379,243,246,';

  DB_DIR: string; // директорія DB

  GENERATION: integer; // рівень організації

  //****************************************************************************
  DR_DENSITY_CALC: string; // Значение PART для партийного учета, AVERAGE для усредненного
  DR_AVERAGE_DATE: TDateTime; // Для усредненного учёта. Дата начала расчёта.
  DR_FORMAT: string; // формат у табличках змінного звіту
  DR_ROUND_COUNT: integer; // знаків після коми
  DR_AUTOLOAD: boolean=false; // автозагрузка
  //****************************************************************************

  VERSION:TVersionINFO;
  ALL_OBL_INST: string;
  ObjectCache: TObjectCache;

  FOk, AlrShowWarning :boolean;
  F : text;
  Debugging:Boolean=true;
  // Дата обрезания базы
  CUT_DATE : string;
  MAIN_ORG : record
               Id, Inst, Face, Par, Par_inst, Org_type, Talon_code, Card_id, OblId : integer;
               Name, Nal_num, Svid_num, Addr, Num, Dogovor, Boss, Phone, GBuh : string;
             End;
  SYS_PARAMS : TStringList; // хранилище системных параметров
  appTop, appLeft, appWidth, appHeight : integer;
  CheckupStatus : TCheckupStatus;

  //Переменная с датой закрытия периода для чужих списаний
  ALFIL_BLOCK_DATE : TDateTime;
  LANGUAGE,LANG_INTERFACE: integer; // 0 - ru (default); 1 - ua
  TRANSLATE: boolean=false; // флаг-сигнал для отработки TranslateText - [false - default, true - ошибка]
  SLua, SLru: TStringList; // два StringList, куда подгружаются значения из файлов ru_msg.ini и ua_msg.ini
  PVL_EXISTS: Boolean;
  bBlock: boolean=false;

  DBS: TDbStructure;
  DBSaver: TDbSaver;

  EditClasses: array[0..17] of TEditClass =
    (TEditBaseForm,TGtdForm,TZavodRashForm,TRaskredForm,TRailStatForm,
     TPrihTransForm,TE_ObjectForm, TE_PermitForm,TRashPvlForm,TAutoShipForm,
     TPrihForm,TBillForm,TCardBlankForm,TCardRequestForm,TCartingForm,
     TSlBookForm,TAviasRestsForm,TRezMeasureEditForm);

  const
    AVIAS_ID = 4000;
    AVIAS_INST = 4000;
    ALFIL_BLOCK_DATE_MESSAGE = 'В данном периоде не допускается модификация любых данных, касающихся смарт-карт';

implementation

Uses OilStd, BankRef, TalonOut, EmpRef, SRepRef, TalonPrih,
     NPTypeRef, OperTypeRef, PartRef, AutoRef, Part, PrihRef, Rash, RashRef, Progr,
     OilVar, Admin, SelDep, SlBookRef,
     DogRef, RashPP, MoneyRef, RashOut,
     AZSRet, Pump, SRep,  SQL,   TalonPotrReport, BookSell, ViewDoc, ServiceRef,
     uTalonPriceReport, RashReport, CreateAZSBook,
     SvodAzsPodpartReport, PExchWarning, CloseDate,
     TestDB, Rep_s,MovementReport, ExportIn1C,ChooseOrg, UDbFunc,
     Topic , RezKalibr, PipeRef, addPipe, RezType,
     RezRestsRef, PipeRestsRef, InvRep, ubMonth, TransferReport,
     E_BillRef, E_Var, E_Options, RulezReport,UReportClass, PrihCardRef, OS1C,
     Passw,ExFunc,RezervRef,CardRNPrint, AutoIncomeRef, AutoReports,
     WayBillsRef, TransSubPart,E_Import,E_PlanRef,E_CurRateRef,
     AutoCardRef, AzsFaultRef, OvExpRef, OS, MoneyFunc, CardAlienRest, CardRNAlienPrint,
     OraBaseDialog, KonkPrice, uDBPlan, KpFaultRef, CardDocEnh, CompProg, CompOs,
     CompIFace, CompCfg, CompUser, CompInfo, CompOutDevice, frmTalonsTotalUnit,
     uTestLaunch, uStart, MoneyOut, Discount, ThirdPartyTranz, DiscountType,
     Import1CDeb, MoveInstTrans, TaxBillPrint,AutomaticReports,OneSImport,
     SetNum,WagonsCrash,uCrypt,Memo,SynchroPart,
     uXMLForm, PolisData, uSplashForm, RyMenus, uDocTranzAlienOrg,
     uLoadBankCard,Synchro, Base, AzsDevice, uLanguageForm, PrintCardPinCode,
     {$IFDEF TESTING}uOilTest, ParseExcelTest, {$ENDIF}
     ListSelect, uOrgChangeDetails, NpPriceRef, RezervRefNew, RezervImage,
     NpPriceDocRef, NpPriceDocEdit,
  Types;


{$R *.DFM}

//==============================================================================
//======================= START EXCEL OPERATIONS ===============================
//==============================================================================

procedure TMainForm.ExceptionHandler(Sender: TObject; E: Exception);
begin
  if Assigned(E) then begin
    StartLog(E.Message);
    MessageDlg('Unhandled exception'+#13#10+E.Message,mtError,[mbOk],0);
  end;
end;

procedure TMainForm.CreateExcel(NewInstance: boolean);
var IU: IUnknown;
    isCreate: boolean;
begin
  if not Assigned(IXLSApp) then begin // а зачем его создавать, если уже есть?
    isCreate := NewInstance or
      (not SUCCEEDED( GetActiveObject(Excel8TLB.CLASS_Application_, nil, IU) ) );
    if isCreate then
      FIXLSApp := CreateComObject(Excel8TLB.CLASS_Application_) as Excel8TLB._Application
    else
      FIXLSApp := IU as Excel8TLB._Application;
  end;
end;

procedure TMainForm.ShowExcel;
begin
  if Assigned(IXLSApp) then begin
    IXLSApp.Visible[0] := true;
    if IXLSApp.WindowState[0] = TOLEEnum(Excel8TLB.xlMinimized) then
      IXLSApp.WindowState[0] := TOLEEnum(Excel8TLB.xlNormal);
    IXLSApp.ScreenUpdating[0] := true;
  end;
end;

function TMainForm.AddWorkbook(const WorkbookName: string): Excel8TLB._Workbook;
begin
  Result := nil;
  if Assigned(FIXLSApp) and (trim(WorkbookName) <> '') then begin
    Result := FIXLSApp.Workbooks.Add(WorkbookName, 0);
  end;
end;

Procedure Init_MainOrg;
var
  q : TOilQuery;
Begin
   q:=TOilQuery.Create(nil);
   try
     q.Sql.Text:='select * from v_org where id=inst and inst=:inst';
     _OpenQueryPar(q,
       ['inst',INST]);
     MAIN_ORG.Id := q.FieldByName('ID').AsInteger;
     MAIN_ORG.Inst := q.FieldByName('Inst').AsInteger;
     MAIN_ORG.Face := q.FieldByName('Face').AsInteger;
     MAIN_ORG.Par := q.FieldByName('Par').AsInteger;
     MAIN_ORG.Par_inst := q.FieldByName('Par_inst').AsInteger;
     MAIN_ORG.Org_type := q.FieldByName('Org_type').AsInteger;
     MAIN_ORG.Talon_code := q.FieldByName('Talon_code').AsInteger;
     MAIN_ORG.Card_id := q.FieldByName('Card_id').AsInteger;
     MAIN_ORG.Name := q.FieldByName('Name').AsString;
     MAIN_ORG.Nal_num := q.FieldByName('Nal_num').AsString;
     MAIN_ORG.Svid_num := q.FieldByName('Svid_num').AsString;
     MAIN_ORG.Addr := q.FieldByName('Addr').AsString;
     MAIN_ORG.Num := q.FieldByName('Num').AsString;
     MAIN_ORG.Dogovor := q.FieldByName('Dogovor').AsString;
     MAIN_ORG.Boss := q.FieldByName('Boss').AsString;
     MAIN_ORG.Phone := q.FieldByName('Phone').AsString;
     MAIN_ORG.GBuh := q.FieldByName('GBuh').AsString;
     if MAIN_ORG.ORG_TYPE=3 then
       MAIN_ORG.OblId:=MAIN_ORG.Par
     else
       MAIN_ORG.OblId:=MAIN_ORG.Id;
   finally
     q.Free;
   end;
   //ALL_OBL_INST:=GetAllOblInst(INST);
   DBSaver.Key2Default:=INST;
End;

procedure TMainForm.HideExcel;
begin
  if Assigned(IXLSApp) then begin
    IXLSApp.Visible[0] := false;
  end;
end;

procedure TMainForm.ReleaseExcel;
begin
  if Assigned(IXLSApp) then begin
    // если есть книга и мы невидимы
    if (IXLSApp.Workbooks.Count > 0) and (not IXLSApp.Visible[0]) then begin
      IXLSApp.WindowState[0] := TOLEEnum(xlMinimized);
      IXLSApp.Visible[0] := true;
      if not(csDestroying in ComponentState) then Self.SetFocus; // а это объяснять необходимо?
      Application.BringToFront;
    end;
  end;
  FIXLSApp := nil;
end;

//==============================================================================
//======================== END EXCEL OPERATIONS ================================
//==============================================================================

function GetSystemDate: TDateTime;
Begin
  Result := GetSqlValue('select sysdate from dual');
End;

function GetTruncSystemDate: TDate;
Begin
  Result := Trunc(GetSystemDate);
End;

Procedure TMainForm.DisplayHint(Sender: TObject);
Begin
  //StatusBar1.SimpleText:=GetLongHint(Application.Hint);
End;

{ Отнимает DaysBack рабочих дней от CurrDay
 Если Truncated - то результат округляется }
Function PreviousWorkDay(CurrDay : TDateTime; DaysBack:integer=1; Truncated : boolean=True): TDateTime;
var
  Hld : string;
  T : TDateTime;
  i : integer;
Begin
  {вытаскиваем список праздников}
  Hld := ReadOILVar('HOLIDAYS');
  T := CurrDay;
  if Truncated then T := Trunc(CurrDay);
  I := DaysBack;
  {ищем текущий рабочий день}
  while (DayOfWeek(T) in [1,7]) or (Pos(FormatDateTime('dd.mm', T), Hld) > 0) do T := T - 1;
  while i > 0 do
  begin
    T:=T-1;
    dec(i);
    {пропустить выходные и праздники}
    while (DayOfWeek(T) in [1,7]) or (pos(FormatDateTime('dd.mm', T), Hld) > 0) do T := T - 1;
  end;
  Result := T;
End;

function PacketWasUnloadedYesterday:Boolean;
var {q:TOilQuery;}
    T,LastDateGrO:TDateTime;
    GrO_Msg, GrO : string;
begin
     // вытаскиваем дату последней выгрузки
     LastDateGrO:=nvl(GetSqlValue('select max(PACKET_DATE) from exch_send where to_id is null and from_id = ov.GetVal(''INST'') '),0);

     if IsObl(Main.INST)
     then Begin
        T := PreviousWorkDay(GetSystemDate,3,False);
        GrO := TranslateText('БОЛЬШОГО OIL-а');
     end
     else Begin
        T := PreviousWorkDay(GetSystemDate,1,False);
        GrO := TranslateText('УПРАВЛЕНИЯ');
     end;

     GrO_Msg := '';
     if Int(LastDateGrO)<Int(T) then GrO_Msg := TranslateText('Пакет для ')+GrO+TranslateText(' был выгружен ')+DateToStr(LastDateGrO)+#13#10;

     // проверяем был ли в этот предыдущий день или позже выгружен пакет
     if Int(LastDateGrO)<Int(T) then begin
        if MessageDlg(GrO_Msg+
                      TranslateText('Чтобы начать работу с OIL необходимо:')+#13#10+
                      TranslateText('выгрузить пакет, либо обратиться к разработчикам')+#13#10+
                      TranslateText('за паролем экстренного доступа.')+#13#10+
                      TranslateText('Имеется ли у вас пароль?'),mtWarning,[mbYes,mbNo],0)=mrYes then
           result:=TestPassword(pwtOrg)
        else result:=FALSE;
     end else result:=TRUE;
    { q.Free;}
end;

procedure TMainForm.ProcessMainMenu;
var
  i: integer;
  mi: TMenuItem;
begin
  if LAUNCH_MODE='OIL' then
  begin
    miReports.Enabled     := Debugging;
    nOilTest.Visible      := Debugging and (EMP_ID = 1);
    miParseExcelTest.Visible := Debugging and (EMP_ID = 1);
    miOSRef.Visible       := (EMP_ID = 1);  // Меню "Справочники\Основные средства"
    miUsers.Visible       := (EMP_ID = 1);  // меню "Настройки\Управление пользователями
    miSystem.Visible      := (EMP_ID = 1);  // меню "Системные установки"
    miReports.Enabled     := (EMP_ID <>1);  // меню "Отчеты"
    miClosePeriod.Visible := (SUPER_REAL_EMP_ID = 1);  // меню "Настройки\Закрытие периода"
    if EMP_ID = 5 then
      miFinance.Visible   := TRUE;  // меню "Финансы"
    miComp.Visible        := (EMP_ID = 1);  // Меню "Компьютеры"
    // видимость пунктов меню в зависимости от того включена ли лимитная и грн схема по картам
    miDiscount.Visible    := 'Y' = VarToStr(ReadOilVar('CARD_MONEY_ENABLE'));
    miThirdPartyTranz.Visible := miDiscount.Visible;
    miMoneyOut.Visible    := miDiscount.Visible;
    miDiscountType.Visible := miDiscount.Visible;
    miLSNN.Visible        := 'Y' = VarToStr(ReadOilVar('CARD_LS_ENABLE'));
    miLSSeparator.Visible := 'Y' = VarToStr(ReadOilVar('CARD_MONEY_ENABLE'));
    miTransMoveInst.Visible := (INST<>INST_OLD) or (INST<>INST_FIL);
    miKonkPrice.Enabled   := (GetSqlValue('select count(*) from oil_org_det where state=''Y'' and konkurent=''Y''')>0);
    miSettings.Visible    := miUsers.Visible or miSystem.Visible; // меню "Настройки"
    miChangeOrgNameDual.Visible := 'N'<>nvl(GetSqlValue('select ov.GetVal(''ORG_NAME_DUAL'') from dual'),'N');
    miChangeAzsParent.Visible := 1=GetSqlValue('-->Main,miChangeAzsParent'+ #13#10 +'select sign(count(*)) from oil_org_change c, v_card_azs a where c.dep_id = a.id and c.dep_id = a.inst and a.obl_id in (ov.GetVal(''INST''), ov.GetVal(''MAIN_PAR'')) ');

    if EMP_ID = 6 then
    begin
      for i := 0 to MainForm.ComponentCount-1 do
        if MainForm.Components[i] is TMenuItem then
        begin
          mi := (MainForm.Components[i] as TMenuItem);
          if mi.Parent = miSettings then
            mi.Visible := false;
        end;
      miSettings.Visible := true;
      N109.Visible := true;
      N118.Visible := true;
    end;
  end
  else
    if LAUNCH_MODE = 'PLANECO' then
    begin
      mi1C.Visible       := FALSE;
      miOs.Visible       := FALSE;
      miUchet.Visible    := FALSE;
      miInventar.Visible := FALSE;
      miReports.Visible  := FALSE;
      miSettings.Visible := FALSE;
      miTestDb.Visible   := FALSE;
      miFinance.Visible  := TRUE;
      Toolbar2.Visible   := FALSE;
    end;
  if (LAUNCH_MODE = 'GREAT_OIL') or Debugging then miChangeOrg.Visible := TRUE;
  miCountBetweenFilCard.Enabled := MAIN_ORG_IS_FILIAL;
  miSynchroOrg.Visible          := (EMP_ID = 1);
  miSynchroAuto.Visible         := (EMP_ID = 1);
  miSynchroEmploy.Visible       := (EMP_ID = 1);
end;

function GetVal(Z:variant):variant;
  var s: string;
Begin
  Result := Z;
  s:= Z;
  if Length(s)=0 then Exit;
  if s[1]='#' then Result := Decrypt(crtTestLaunch,[Copy(s,2,Length(s)-1)]);
End;

procedure TMainForm.LoadAdmSettings;
var q: TOilQuery;
begin
    q:=TOilQuery.Create(nil);
    q.Session:=frmStart.OraSession1;
    q.Sql.Text:=' select * from adm_settings where inst='+IntToStr(MAIN_ORG.INST);
    q.Open;

    PRINT_TYPE_DAILY_TAX:='DETAIL';
    MANAGER_SHIP:=TranslateText('Директор');
    BUH_SHIP := TranslateText('Главный бухгалтер');
    DOG_POST_CONDITION_DEFAULT := TranslateText('Нефтесклад ')+MAIN_ORG.Name;
    NN_CLIENT_ADRESS := 'Y';
    NN_WITH_UPPER_REKVIZIT := 'N';
    PRINT_UPPER_ADRESS := 'NO';
    FILIAL_NUMBER := '0';
    AVIZO_SYFFIX:= '0';
    PRINT_DOG_FILIAL := 'N';
    DOG_WITH_REKVIZIT_CONTROL := 'N';
    PRINT_TTN_FIL_NK := 'N';
    PRINT_RS := 'N';
    REKVIZIT_FILIALA_NK := 'N';
    PRINT_TTN_REAL_ADDRESS := 'N';
    DOG_POST_CONDITION := DOG_POST_CONDITION_DEFAULT;
    DOG_POST_CONDITION_FROM_WHOM := 'N';
    NAL_NUM_RESERVE_NALICHKA := 'N';
    PRINT_RN_FILIAL := 'N';
    PRINT_RN_FILIAL_CT := 'N';
    BILL_NUM_FOR_CARD := 'N';

    while not q.Eof do begin
       if q.fieldbyname('NAME').AsString='AVIZO_SYFFIX' then AVIZO_SYFFIX:=GetVal(q.fieldbyname('VALUE').AsString)
       else if q.fieldbyname('NAME').AsString='PRINT_TYPE_DAILY_TAX' then PRINT_TYPE_DAILY_TAX:=GetVal(q.fieldbyname('VALUE').AsString)
       else if q.fieldbyname('NAME').AsString='MANAGER_SHIP' then MANAGER_SHIP:=GetVal(q.fieldbyname('VALUE').AsString)
       else if q.FieldByName('NAME').AsString='BUH_SHIP' then BUH_SHIP:=GetVal(q.FieldByName('VALUE').AsString)  //що тут за жах робиться?..
       else if q.fieldbyname('NAME').AsString='NN_CLIENT_ADRESS' then NN_CLIENT_ADRESS:=GetVal(q.fieldbyname('VALUE').AsString)
       else if q.fieldbyname('NAME').AsString='NN_WITH_UPPER_REKVIZIT' then NN_WITH_UPPER_REKVIZIT:=GetVal(q.fieldbyname('VALUE').AsString)
       else if q.fieldbyname('NAME').AsString='PRINT_UPPER_ADRESS' then PRINT_UPPER_ADRESS:=GetVal(q.fieldbyname('VALUE').AsString)
       else if q.fieldbyname('NAME').AsString='FILIAL_NUMBER' then FILIAL_NUMBER:=GetVal(q.fieldbyname('VALUE').AsString)
       else if q.fieldbyname('NAME').AsString='PRINT_DOG_FILIAL' then PRINT_DOG_FILIAL:=GetVal(q.fieldbyname('VALUE').AsString)
       else if q.fieldbyname('NAME').AsString='DOG_WITH_REKVIZIT_CONTROL' then DOG_WITH_REKVIZIT_CONTROL:=GetVal(q.fieldbyname('VALUE').AsString)
       else if q.fieldbyname('NAME').AsString='PRINT_RS' then PRINT_RS:=GetVal(q.fieldbyname('VALUE').AsString)
       else if q.fieldbyname('NAME').AsString='DOG_POST_CONDITION_FROM_WHOM' then DOG_POST_CONDITION_FROM_WHOM:=GetVal(q.fieldbyname('VALUE').AsString)
       else if q.fieldbyname('NAME').AsString='REKVIZIT_FILIALA_NK' then REKVIZIT_FILIALA_NK:=GetVal(q.fieldbyname('VALUE').AsString)
       else if q.fieldbyname('NAME').AsString='NAL_NUM_RESERVE' then NAL_NUM_RESERVE:=GetVal(q.fieldbyname('VALUE').AsString)
       else if q.fieldbyname('NAME').AsString='NAL_NUM_RESERVE_NALICHKA' then NAL_NUM_RESERVE_NALICHKA:=GetVal(q.fieldbyname('VALUE').AsString)
       else if q.fieldbyname('NAME').AsString='NAL_NUM_HAND' then NAL_NUM_HAND:=GetVal(q.fieldbyname('VALUE').AsString)
       else if q.fieldbyname('NAME').AsString='PRINT_TTN_REAL_ADDRESS' then PRINT_TTN_REAL_ADDRESS:=GetVal(q.fieldbyname('VALUE').AsString)
       else if q.fieldbyname('NAME').AsString='PRINT_TTN_FIL_NK' then PRINT_TTN_FIL_NK:=GetVal(q.fieldbyname('VALUE').AsString)
       else if q.fieldbyname('NAME').AsString='DOG_POST_CONDITION' then DOG_POST_CONDITION:=GetVal(q.fieldbyname('VALUE').AsString)
       else if q.fieldbyname('NAME').AsString='PRINT_RN_FILIAL' then PRINT_RN_FILIAL:=GetVal(q.fieldbyname('VALUE').AsString)
       else if q.fieldbyname('NAME').AsString='PRINT_RN_FILIAL_CT' then PRINT_RN_FILIAL_CT:=GetVal(q.fieldbyname('VALUE').AsString)
       else if q.fieldbyname('NAME').AsString='BILL_NUM_FOR_CARD' then BILL_NUM_FOR_CARD := GetVal(q.fieldbyname('VALUE').AsString);
       q.Next;
    end;
    q.Free;
end;

procedure LoadOilVar;
var
  dQuery : TOilQuery;
  //****************************************************************************
  procedure SetCheckUpVariables;
    var S : string;
        q : TOilQuery;
        O_TYPE : integer;
  Begin
    StartLog(TranslateText('точка входа в SetCheckUpVariables'));
    REAL_INST := FindRealInst(StrToInt(ReadOilVar('INST')));
    StartLog('REAL_INST = '+IntToStr(REAL_INST));
    q := TOilQuery.Create(nil);
    q.SQL.Text := 'select org_type from v_org where id=inst and inst='+IntToStr(REAL_INST);
    q.Open;
    if q.IsEmpty then O_TYPE:=3 else O_TYPE:=q.FieldByName('org_type').AsInteger;
    q.Free;
    StartLog('O_TYPE = '+IntToStr(O_TYPE));
    try
      if (GetVal(ReadOilVar('CH_DEF_OAO_WITH_CARD')) = '' ) or
         (GetVal(ReadOilVar('CH_DEF_OAO_WITHOUT_CARD')) = '') or
         (GetVal(ReadOilVar('CH_DEF_PPON_WITH_CARD')) = '' ) then
      begin
        StartLog(TranslateText('Нет переменных по умолчанию'));
        raise Exception.Create(TranslateText('Нет переменных по умолчанию'));
      end;

      S := GetVal(ReadOilVar('CH_DEF_PPON_WITHOUT_CARD'));
      if O_TYPE=4 then
      begin
        if DBObjectExists('ТРАНЗАКЦИИ') or DBObjectExists('ECFIL139','TABLE',AdmSettings.Get('CARD_USER')) // *NO_TRANSLATE*
          then S := GetVal(ReadOilVar('CH_DEF_OAO_WITH_CARD'))
          else S := GetVal(ReadOilVar('CH_DEF_OAO_WITHOUT_CARD'))
      end
      else if DBObjectExists('ТРАНЗАКЦИИ') or DBObjectExists('ECFIL139','TABLE',AdmSettings.Get('CARD_USER'))  then S := GetVal(ReadOilVar('CH_DEF_PPON_WITH_CARD')); // *NO_TRANSLATE*
      StartLog( 'S = '+S );
    except on E:Exception do
      begin
        S := '';
        if REAL_INST = 201
           then S := '20,21,22,23,24,25,26,27,28,29'
           else if O_TYPE=4
                then S := '10,11,12,13,14,15,16,17,20,21,22,23,24,25,26,27,28,29'
                else if DBObjectExists('ТРАНЗАКЦИИ') or DBObjectExists('ECFIL139','TABLE',AdmSettings.Get('CARD_USER'))  then S := '24,25,26,27,28,29'; // *NO_TRANSLATE*
        StartLog('On exception S = '+S );
        ShowMessage(TranslateText('Ошибка SetCheckUpVariables: ')+ E.Message);
      end;
    end;

    if ReadOilVar('CH_CLR_RESULT')='' then SimpleWriteOilVar('CH_CLR_RESULT', 'Y');

    if not Debugging and (ReadOilVar('CH_CLR_RESULT')='Y')
       then Begin
             _ExecSql('delete from oil_var where name in (''CH_FLAG_COUNTER'','+
                      '''CH_CRITICAL_DATE'',''CH_FIRST_BUG_DATE'',''CH_BUGS_COUNT'')');
             SimpleWriteOilVar('CH_CLR_RESULT', 'N');
       end;

    if ReadOilVar('CH_FLAG_COUNTER')=''
       then _ExecSql('insert into oil_var (name,value) values (''CH_FLAG_COUNTER'',''#'+Encrypt(crtTestLaunch,['N'])+''')');
    if ReadOilVar('CH_CRITICAL_DATE')=''
       then _ExecSql('insert into oil_var (name,value) values (''CH_CRITICAL_DATE'',''#'+Encrypt(crtTestLaunch,['01.01.2002'])+''')');
    if ReadOilVar('CH_TALON_LEVEL')=''
       then _ExecSql('insert into oil_var (name,value) values (''CH_TALON_LEVEL'',''#'+Encrypt(crtTestLaunch,['2'])+''')');
    if ReadOilVar('CH_SILENCE_PERIOD')=''
       then _ExecSql('insert into oil_var (name,value) values (''CH_SILENCE_PERIOD'',''#'+Encrypt(crtTestLaunch,['15'])+''')');
    if ReadOilVar('CH_CARD_LEVEL')=''
       then _ExecSql('insert into oil_var (name,value) values (''CH_CARD_LEVEL'',''#'+Encrypt(crtTestLaunch,['1'])+''')');
    if ReadOilVar('CH_CORRECTION_PERIOD')=''
       then _ExecSql('insert into oil_var (name,value) values (''CH_CORRECTION_PERIOD'',''#'+Encrypt(crtTestLaunch,['7'])+''')');
    if ReadOilVar('CH_TRIGGER')=''
       then _ExecSql('insert into oil_var (name,value) values (''CH_TRIGGER'',''#'+Encrypt(crtTestLaunch,['DEFAULT'])+''')');
    if GetVal(ReadOilVar('CH_TRIGGER')) ='DEFAULT'
       then SimpleWriteOilVar('CH_AUDIT_LIST', '#'+Encrypt(crtTestLaunch,[S]))
       else if ReadOilVar('CH_AUDIT_LIST')=''
               then _ExecSql('insert into oil_var (name,value) values (''CH_AUDIT_LIST'',''#'+Encrypt(crtTestLaunch,[S])+''')');
    if ReadOilVar('CH_DAYS_BETWEEN_CHECKUP')=''
       then _ExecSql('insert into oil_var (name,value) values (''CH_DAYS_BETWEEN_CHECKUP'',''#'+Encrypt(crtTestLaunch,['15'])+''')');
    if ReadOilVar('CH_BUGS_COUNT')=''
       then _ExecSql('insert into oil_var (name,value) values (''CH_BUGS_COUNT'',''#'+Encrypt(crtTestLaunch,['-1'])+''')');
    if ReadOilVar('CH_FIRST_BUG_DATE')=''
       then _ExecSql('insert into oil_var (name,value) values (''CH_FIRST_BUG_DATE'',''#'+Encrypt(crtTestLaunch,['01.01.1900'])+''')');
    if ReadOilVar('CH_STARTUP_DATE')=''
       then _ExecSql('insert into oil_var (name,value) values (''CH_STARTUP_DATE'',''#'+Encrypt(crtTestLaunch,['01.01.2002'])+''')');
    StartLog( TranslateText('Выход SetCheckUpVariables'));   
  End;
  //****************************************************************************
begin
  try
    {Временная заглушка, с версией БД выше 106.2 можно убрать}
    if not AdmSettings.Exist('CARD_USER') then
      AdmSettings.Save('CARD_USER','MAGICASH5')
    else if AdmSettings.Get('CARD_USER')=Null then
      AdmSettings.Save('CARD_USER','NONE');

    SetCheckUpVariables;
    if ReadOILVar('EMP_ID')<>'О' then WriteOILVar('EMP_ID','О');
    dQuery := TOilQuery.Create(nil);
    dQuery.SQL.Text := 'select name, value from oil_var';
    dquery.open;
    dquery.first;
    LAUNCH_MODE:='OIL';
    OIL_START_DATE := Trunc(GetSystemDate);
    EXCH_PART_TIME := 0;
    SYN_PARTS_CHECK_DAYS := 20;
    DEBET_LAST_YEAR := 'Y';
    PVL_EXISTS := FALSE;
    while not dquery.eof do
    begin
          if dquery.fieldbyname('NAME').AsString='ID' then MAIN_ID:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='INST' then INST:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='OILBASE_TYPE' then OILBASE:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='AZS_TYPE' then AZS:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='MAINDEP_TYPE' then MAINORG:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='OBL_TYPE' then OBL:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='MAIN_TYPE' then MAIN_TYPE:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='MAIN_PAR' then MAIN_PAR:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='MAINPAR_INST' then MAIN_PAR_INST:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='EMP_ID' then EMP_ID:=1
     else if dquery.fieldbyname('NAME').AsString='NP_DT' then NP_DT:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='NP_A76' then NP_A76:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='NP_A80' then NP_A80:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='NP_A92' then NP_A92:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='NP_A93' then NP_A93:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='NP_A95' then NP_A95:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='NP_A98' then NP_A98:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='NP_MASLO' then NP_MASLO:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='OPER_IN_ST' then OPER_IN_ST:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='OPER_IN_XR' then OPER_IN_XR:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='OPER_IN_KM' then OPER_IN_KM:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='OPER_OUT_AZS' then OPER_OUT_AZS:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='OPER_OUT_NAL' then OPER_OUT_NAL:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='OPER_OUT_BNAL' then OPER_OUT_BNAL:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='OPER_OUT_XR' then OPER_OUT_XR:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='OPER_OUT_TALON' then OPER_OUT_TALON:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='OPER_OUT_SN' then OPER_OUT_SN:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='ALFANAFTA' then ALFANAFTA:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='ALFANAFTAP' then ALFANAFTAP:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='REPKOMNP' then REPKOMNP:=GetVal(dquery.fieldbyname('VALUE').AsString)
     else if dquery.fieldbyname('NAME').AsString='OPG_OPLATA' then OPG_OPLATA:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='OPG_RASHOD' then OPG_RASHOD:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='OPG_PRIHOD' then OPG_PRIHOD:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='OPG_MOVE' then OPG_MOVE:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='OPG_MOVERR' then OPG_MOVERR:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='OPG_OUT' then OPG_OUT:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='OPG_OPER' then OPG_OPER:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='DOST_SKLAD' then DOST_SKLAD:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='OPG_AZSRET' then OPG_AZSRET:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='DIM_LITR' then DIM_LITR:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='DIM_TONN' then DIM_TONN:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='OPER_MOVENB' then OPER_MOVENB:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='OPER_MOVERR' then OPER_MOVERR:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='OPER_BART' then OPER_BART:=GetVal(dquery.fieldbyname('VALUE').AsString)
     else if dquery.fieldbyname('NAME').AsString='OPER_ZACH' then OPER_ZACH:=GetVal(dquery.fieldbyname('VALUE').AsString)
     else if dquery.fieldbyname('NAME').AsString='OPER_OWPR' then OPER_OWPR:=GetVal(dquery.fieldbyname('VALUE').AsString)
     else if dquery.fieldbyname('NAME').AsString='OPER_NOT_NN' then OPER_NOT_NN:=GetVal(dquery.fieldbyname('VALUE').AsString)
     else if dquery.fieldbyname('NAME').AsString='CUT_DATE' then CUT_DATE:=GetVal(dquery.fieldbyname('VALUE').AsString)
     else if dquery.fieldbyname('NAME').AsString='EXCH_PART_TIME' then EXCH_PART_TIME:=GetVal(dquery.fieldbyname('VALUE').AsString)
     else if dquery.fieldbyname('NAME').AsString='SYN_PARTS_CHECK_DAYS' then SYN_PARTS_CHECK_DAYS:=GetVal(dquery.fieldbyname('VALUE').AsString)
     else if dquery.fieldbyname('NAME').AsString='CLOSE_DATE' then Close_Date:=GetVal(dquery.fieldbyname('VALUE').AsString)
     else if dquery.fieldbyname('NAME').AsString='CDO' then Close_Date_Obl:=GetVal(dquery.fieldbyname('VALUE').AsString)
     else if dquery.fieldbyname('NAME').AsString='CDA' then Close_Date_Alfa:=GetVal(dquery.fieldbyname('VALUE').AsString)
     else if dquery.fieldbyname('NAME').AsString='DOUBLE_SCAN' then DOUBLE_SCAN:=(GetVal(dquery.fieldbyname('VALUE').AsString)='Y')
     else if dquery.fieldbyname('NAME').AsString='LAUNCH_MODE' then LAUNCH_MODE:=GetVal(dquery.fieldbyname('VALUE').AsString)
     else if dquery.fieldbyname('NAME').AsString='OPER_OWN_NEEDS' then OPER_OWN_NEEDS:=GetVal(dquery.fieldbyname('VALUE').AsString)
     else if dquery.fieldbyname('NAME').AsString='OPER_WITHOUT_NDS' then OPER_WITHOUT_NDS:=GetVal(dquery.fieldbyname('VALUE').AsString)
     else if dquery.fieldbyname('NAME').AsString='CH_FLAG_COUNTER' then CH_FLAG_COUNTER:=GetVal(dquery.fieldbyname('VALUE').AsString)
     else if dquery.fieldbyname('NAME').AsString='CH_AUDIT_LIST' then CH_AUDIT_LIST:=GetVal(dquery.fieldbyname('VALUE').AsString)
     else if dquery.fieldbyname('NAME').AsString='CH_CRITICAL_DATE' then CH_CRITICAL_DATE:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='CH_TALON_LEVEL' then CH_TALON_LEVEL:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='CH_SILENCE_PERIOD' then CH_SILENCE_PERIOD:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='CH_CARD_LEVEL' then CH_CARD_LEVEL:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='CH_CORRECTION_PERIOD' then CH_CORRECTION_PERIOD:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='CH_DAYS_BETWEEN_CHECKUP' then CH_DAYS_BETWEEN_CHECKUP:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='CH_BUGS_COUNT' then CH_BUGS_COUNT:=GetVal(dquery.fieldbyname('VALUE').value)
     else if dquery.fieldbyname('NAME').AsString='CH_FIRST_BUG_DATE' then CH_FIRST_BUG_DATE:=GetVal(dquery.fieldbyname('VALUE').AsString)
     else if dquery.fieldbyname('NAME').AsString='CH_STARTUP_DATE' then CH_STARTUP_DATE:=GetVal(dquery.fieldbyname('VALUE').AsString)
     else if dquery.fieldbyname('NAME').AsString='OBL_CARD_START_DATE' then OBL_CARD_START_DATE:=GetVal(dquery.fieldbyname('VALUE').Value)
     else if dquery.fieldbyname('NAME').AsString='OBL_CARD_NP_GROUP' then OBL_CARD_NP_GROUP:=GetVal(dquery.fieldbyname('VALUE').Value)
     else if dquery.fieldbyname('NAME').AsString='OBL_CARD_PRICE' then OBL_CARD_PRICE:=S2F(GetVal(dquery.fieldbyname('VALUE').Value))
     else if dquery.fieldbyname('NAME').AsString='DEBET_LAST_YEAR' then DEBET_LAST_YEAR:=GetVal(dquery.fieldbyname('VALUE').Value)
     else if dquery.fieldbyname('NAME').AsString='WILD_AZS_INCASS' then WILD_AZS_INCASS:=GetVal(dquery.fieldbyname('VALUE').AsString)
     else if dquery.fieldbyname('NAME').AsString='INST_OLD' then INST_OLD:=GetVal(dquery.fieldbyname('VALUE').AsString)
     else if dquery.fieldbyname('NAME').AsString='INST_FIL' then INST_FIL:=GetVal(dquery.fieldbyname('VALUE').AsString)
     else if dquery.fieldbyname('NAME').AsString='INST_MOVE_DATE' then INST_MOVE_DATE:=GetVal(dquery.fieldbyname('VALUE').AsString)
     else if dquery.FieldByName('NAME').AsString='PVL_EXISTS' then PVL_EXISTS:=dquery.FieldByName('VALUE').AsString='Y'
     else if dquery.FieldByName('NAME').AsString='DR_DENSITY_CALC' then DR_DENSITY_CALC:=dquery.FieldByName('VALUE').AsString
     else if dquery.FieldByName('NAME').AsString='DR_AVERAGE_DATE' then DR_AVERAGE_DATE:=dquery.FieldByName('VALUE').AsDateTime
     else if dquery.FieldByName('NAME').AsString='GENERATION' then GENERATION:=dquery.FieldByName('VALUE').AsInteger;
     dquery.next;
    end;
   except on E:Exception do Begin
        startlog(TranslateText('  ошибка при считывании oil_var: ')+E.Message);
        MessageDlg(TranslateText('СИСТЕМНАЯ ОШИБКА : Не корректно определены параметры конфигурации!')+#13#10+E.Message,mtError,[mbOk],0);
        Application.Terminate;
        Exit;
      end
   end;

   try
     InitLanguage(nvl(GetSqlValue('select value from oil_var where name=''LANGUAGE'''),0));
     startlog('Процедура InitLanguage пройдена успешно');
   except on E: Exception do
     begin
       startlog('Ошибка прохождения процедури InitLanguage: ' + #13#10 + E.Message, true);
       MessageDlg(TranslateText('Ошибка прохождения процедури InitLanguage: ') + #13#10 + E.Message, mtError, [mbOk], 0);
       abort;
     end;
   end;

   if GENERATION >= 2 then
   begin
     DR_ROUND_COUNT  := 3;
     DR_FORMAT := ',0.000';
   end
   else
   begin
     DR_ROUND_COUNT := 6;
     DR_FORMAT := ',0.000000';
   end;

   if INST_FIL<>0 then INST_DUAL:=INST_FIL
   else if INST_OLD<>0 then INST_DUAL:=INST_OLD
   else INST_DUAL:=0;

   if INST_OLD=0 then INST_OLD:=INST;
   TALON_CODE_OLD:=nvl(GetSqlValue('select talon_code from v_org where id=inst and id='+IntToStr(INST_OLD)),0);

   if Close_Date_Obl<>'' then begin
     Close_Date_Obl:=Decrypt(crtVersionKey,[Close_Date_Obl]);
     if StrToDate(Close_Date_Obl)>StrToDate(Close_Date) then
       Close_Date:=Close_Date_Obl;
   end;
   if Close_Date_Alfa<>'' then begin
     Close_Date_Alfa:=Decrypt(crtVersionKey,[Close_Date_Alfa]);
     if StrToDate(Close_Date_Alfa)>StrToDate(Close_Date) then
       Close_Date:=Close_Date_Alfa;
   end;
end;

procedure TMainForm.DefineCurrentOrg(ARecuirson:boolean=true);
begin
   if SysParamExists('ORG') then
     if (GetSqlValue('select count(*) from oil_var where name=''DIFF_INST_FORBIDDEN'' and value=''Y''')=0) then
       if (LAUNCH_MODE='GREAT_OIL') or (Pos(','+SysParamValue('ORG')+',',Inst_List)>0) then begin
         INST := StrToInt(SysParamValue('ORG'));
         qOrg.Close;
         qOrg.ParambyName('a').AsInteger := INST ;
         _OpenQuery(qOrg);
         if not(qOrg.eof) then
         begin
            MAIN_ID:=INST;
            MAIN_TYPE := qOrg.fieldbyname('org_type').value;
            if qOrg.fieldbyname('par').value<>null then MAIN_PAR := qOrg.fieldbyname('par').value
                                                   else MAIN_PAR:=-1;
            if qOrg.fieldbyname('par_inst').value<>null then
               MAIN_PAR_INST := qOrg.fieldbyname('par_inst').value
            else MAIN_PAR_INST := -1;
         end;
       end
     else
       MessageDlg(TranslateText('Вход под другими организациями запрещен!'),mtWarning,[mbOk],0);
   qOrg.Close;
   qOrg.ParambyName('a').AsInteger := INST ;
   _OpenQuery(qOrg);
   if qOrg.RecordCount>0 then
   begin
     SetCaption(qOrg.FieldbyName('Name').AsString);
     CURRENT_NAME:= qOrg.FieldbyName('Name').AsString;
     startlog(TranslateText('  основная организация определена '+CURRENT_NAME));
   end
   else if ARecuirson then // перестраховка 
     DefineCurrentOrg(false)
   else
     startlog(TranslateText('  основная организация не определена '));

   ORG_NAME_DUAL_POS:=0;
end;

procedure TMainForm._Halt(n:integer=1);
begin
     try Halt(n);
     except
     end;
end;

Function ReadPieceOfRegistry(RootKey: HKEY; KeyFolder, KeyName : string):String;
 Var PieceOfReg : TRegistry;
     TS : TStrings;
     i : integer;
Begin
  Result := '';
  try
    PieceOfReg := TRegistry.Create;
    PieceOfReg.RootKey := RootKey;
    TS := TStringList.Create;
    PieceOfReg.OpenKey(KeyFolder,False);
    PieceOfReg.GetValueNames(TS);
    i := TS.IndexOf(KeyName);
    if i>=0 then Result := PieceOfReg.ReadString(TS[i]);
    PieceOfReg.Free;
  Except on E: Exception do
  End;
End;

procedure WritePieceOfRegistry(KeyName,KeyValue: string; RootKey: HKEY = HKEY_CURRENT_USER; KeyFolder: string = 'Software\Oil');
var reg : TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := RootKey;
    if Reg.OpenKey(KeyFolder, True) then
       Reg.WriteString(KeyName,KeyValue);
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

function DebetorIsTooOld(var Msg : string):integer;
  var q : TOilQuery;
      Yest : TDateTime;
Begin
  Result := 0;
  Msg := TranslateText('Тест пройден успешно');

  Yest := PreviousWorkDay(GetSystemDate);
  q := TOilQuery.Create(nil);
  q.Session := frmStart.OraSession1;
  q.SQL.Text := 'select to_date(value,''dd.mm.yyyy hh24:mi:ss'') as D from oil_var where name=''MADE_DEBETORS''';
  q.Open;

  if not IsObl(REAL_INST)
  then if q.IsEmpty
       then Result :=1
       else Begin
           if trunc(q.FieldByName('D').AsDateTime)<Trunc(Yest)
           then Result := 1
           else if trunc(q.FieldByName('D').AsDateTime)=Trunc(Yest)
                then Result := 2;
       End;
  if Result >0
  then Msg :=TranslateText('Устарели данные по дебеторам!')+#13#10+TranslateText('Постройте отчет "Ведомость дебеторов"');
  if Result =1
  then Msg := Msg + #13#10+TranslateText('Отключены все права пользователя, кроме построения отчетов.');
End;

function CheckUpIsTooOld(var Msg : string):integer;
Begin
  Result := 0;
  Msg := TranslateText('Тест пройден успешно');
  if CheckupStatus.BuildBlock<>''
     then Begin
          Result := 1;
          Msg := CheckupStatus.BuildBlockMessage+#13#10+
                 TranslateText('Заблокированы все права пользователя и отчеты.');
          Exit;
     End;
  if CheckupStatus.BuildWarning<>''
     then Begin
       Result := 2;
       Msg := CheckupStatus.BuildWarningMessage;
     End;
End;

//==============================================================================
function SetPacketTimer(var Msg: string; Startup: boolean=false): integer;
const
  PreviousErrorMsg1 = 'Необходимо выгрузить и отослать пакет OIL-а!';
  PreviousErrorMsg2 = 'Иначе будут отключены права пользователей.';
  ErrorMsg1 = 'Чтобы начать работу с OIL-ом необходимо выгрузить и отослать пакет.';
  ErrorMsg2 = 'Заблокированы все права пользователя.';
var
  T, Last_DR, Pack, Now_, dRN: TDateTime;
  Time16, TimeToUnload, MessageQuantity: Integer;
  PreviousErrorMsg, ErrorMsg: string;
  //****************************************************************************
  procedure BlockRights;
  begin
    Result := 1;
    if not Startup then
    begin
      ShowMessage(Msg);
      Main.EMP_ID := 0;
      Main.REAL_EMP_ID := 0;
      MainForm.ProcessMainMenu;
      BlockOpenForms;
    end;
  end;
  //****************************************************************************
  procedure DeactivateTimer;
  begin
    // дезактивуємо усі таймери
    MainForm.timPackets.Deactivate;
    MainForm.UnloadEvening.Enabled := False;
    MainForm.UnloadMessage.Enabled := False;
    MainForm.UnloadAfterDR.Enabled := False;
    MainForm.UnloadCardAlientRn.Enabled := False;
  end;
  //****************************************************************************
Begin
  Result := 0;
  if bBlock then exit;
  bBlock := true;
  try
    // повний текст попереджувального повідомлення
    PreviousErrorMsg := TranslateText(PreviousErrorMsg1) + #13#10 + TranslateText(PreviousErrorMsg2);
    // повний текст повідомлення про блокування
    ErrorMsg := #13#10 + TranslateText(ErrorMsg1) + #13#10 + TranslateText(ErrorMsg2);

    if Msg = 'ErrorMsg' then
    begin
      MessageDlg(ErrorMsg, mtWarning, [mbOk], 0);
      exit;
    end;

    Msg := TranslateText('Тест пройден успешно');
    Last_Dr := StrToDateTime(ReadOILVar('LAST_DR'));
    // дата і час останнюго вивантаженого пакету
    Pack := Nvl(GetSQLValue('select max(PACKET_DATE) from exch_send where to_id is null and from_id = ov.GetVal(''INST'')'),0);
    Time16 := StrToInt(GetVal(ReadOILVar('SECOND_UNLOAD')));
    TimeToUnload := StrToInt(GetVal(ReadOILVar('TIME_FOR_UNLOAD')));
    MessageQuantity := StrToInt(GetVal(ReadOILVar('MESS_UNLOAD_Q')))*60000;
    Now_ := GetSystemDate;

    DeactivateTimer; // дезактивуємо усі таймери

    if IsObl(Main.INST) then T := PreviousWorkDay(GetSystemDate, 2, False)
    else T := PreviousWorkDay(GetSystemDate);

    if Int(Pack) < Int(T) then
    begin
      Msg := TranslateText('Пакет для БОЛЬШОГО OIL-а не был выгружен.') + DateToStr(Pack) + ErrorMsg;
      BlockRights;
      Exit;
    End;

    if Pack > Last_DR then // Пакет был выгружен после ввода сменных отчетов
    begin
      if Now_ >= trunc(Now_) + Time16/24 then // Пришло время выгрузить пакет второй раз (16.00)
        if Pack < trunc(Now_) + Time16/24 then // и пакет еще не выгружался
          if trunc(Now_) + Time16/24 - Now_ + TimeToUnload/60/24 <= 0 then
          Begin // Блок всех прав
            Msg := TranslateText('Истекло время на выгрузку пакета OIL-а.') + ErrorMsg;
            BlockRights;
            exit;
          End
          else
          Begin // Включить таймеры
            MainForm.UnloadEvening.Interval := trunc(((trunc(Now_) - Now_)*24 + Time16 + TimeToUnload/60)*3600000);
            MainForm.UnloadEvening.Enabled := True;

            MainForm.UnloadMessage.Interval := MessageQuantity;
            MainForm.UnloadMessage.Enabled := True;

            MainForm.timPackets.Activate;
            Result := 2;
            Msg := PreviousErrorMsg;
            if not Startup then ShowMessage(Msg);
          End;
    end
    else // После ввода сменных отчетов пакет не выгружался
    begin
      if Last_DR - Now_ + TimeToUnload/60/24 <= 0 then
      Begin // Блок всех прав
        Msg := TranslateText('Истекло время на выгрузку пакета OIL-а после ввода сменных отчетов.') + ErrorMsg;
        BlockRights;
        exit;
      end
      else
      Begin // Включить таймеры
        MainForm.UnloadAfterDR.Interval := trunc((Last_DR - Now_ + TimeToUnload/60/24)*24*3600000);
        MainForm.UnloadAfterDR.Enabled := True;

        MainForm.UnloadMessage.Interval := MessageQuantity;
        MainForm.UnloadMessage.Enabled := True;

        MainForm.timPackets.Activate;
        Result := 2;
        Msg := PreviousErrorMsg;
        if not Startup then ShowMessage(Msg);
      end;
    end;

    // дата і час останньої внесеної записі по чужим списанням
    dRN := nvl(GetSqlValueParSimple('select max(d) d from ( ' +
      'select max(date_mod) d from card_alien_rn_det where state = ''Y'' and inst = :INST union all ' +
      'select max(date_mod) d from card_alien_rn where state = ''Y'' and inst = :INST union all ' +
      'select max(date_mod) d from card_alien_doc where state = ''Y'' and inst = :INST union all ' +
      'select max(date_mod) d from card_transit_part where state = ''Y'' and inst = :INST)', ['INST', INST]), 0);

    if Pack < dRN then // якщо побудували документи по чужим списанням і не вигрузили пакет
    begin
      if dRN + EncodeTime(1, 0, 0, 0) < Now_ then
      begin
        Msg := TranslateText('Истекло время на выгрузку пакета OIL-а после формирования документов по чужим списаниям.') + ErrorMsg;
        BlockRights;
        exit;
      end
      else
      begin
        MainForm.UnloadCardAlientRn.Interval := MessageQuantity;
        MainForm.UnloadCardAlientRn.Enabled := True;

        MainForm.timPackets.Activate;
        Result := 2;
        Msg := PreviousErrorMsg;
        if not Startup then ShowMessage(Msg);
      end;
    end;

  finally
    bBlock := false;
  end;
End;
//==============================================================================

function DailyRepControl(var Msg : string;Startup:boolean=false):integer;
  var Mess, KP_Mess, TmpStr : string;
      LeastDate, SystemDate : TDateTime;
      DR, KP : boolean;
  function AdditionHour:integer;
    var Hld : String;
  Begin
    // вытаскиваем список праздников
    Hld := ReadOILVar('HOLIDAYS');

    Result := 0;
    if ((DayOfWeek(GetSystemDate-2) in [1,7]) or (pos(FormatDateTime('dd.mm', GetSystemDate-2), Hld) > 0)) and
       ((DayOfWeek(GetSystemDate-1) in [1,7]) or (pos(FormatDateTime('dd.mm', GetSystemDate-1), Hld) > 0)) then
      if ((DayOfWeek(GetSystemDate-3) in [1,7]) or (pos(FormatDateTime('dd.mm', GetSystemDate-3), Hld) > 0)) then Result := 11
      else Result := 2;
  End;
  function KonkPriceIsPresent(Date_:TDateTime; var KP_Mess:string): boolean;
  Begin
    Result := true;
    KP_Mess := '';
    if GetVal(ReadOILVar('KP_CONTROL_ENABLED'))='FALSE' then Exit;
    with DBPlan do
    Begin
      qKP_Alien.Close;
      qKP_Alien.Prepare;
      qKP_Alien.ParamByName('dep_id').AsInteger := REAL_INST;
      qKP_Alien.ParamByName('date_').AsDateTime := Date_;
      qKP_Alien.Open;
      if qKP_Alien.FieldByName('d').AsFloat <0.4 then Result := False;
      qKP_Alien.Close;

      qKP_Own.Close;
      qKP_Own.Prepare;
      qKP_Own.ParamByName('dep_id').AsInteger := REAL_INST;
      qKP_Own.ParamByName('date_').AsDateTime := Date_;
      qKP_Own.Open;
      if not qKP_Own.IsEmpty then
      Begin
        Result := False;
        KP_Mess := qKP_Own.FieldByName('name').AsString;
        qKP_Own.Next;
        while not qKP_Own.eof do
        Begin
          KP_Mess := KP_Mess +#13#10 + qKP_Own.FieldByName('name').AsString;
          qKP_Own.Next;
        End;
      End;
      qKP_Own.Close;
      if not Result then
         if KP_Mess='' then KP_Mess := TranslateText('Не введены цены конкурентов!')+#13#10
                       else KP_Mess := TranslateText('Не введены цены конкурентов по подразделениям:') +#13#10+KP_Mess+#13#10;
    End;
  End;
Begin
  Result := 0;
  Msg := TranslateText('Тест пройден успешно');
  if Debugging then exit;
  DR := (GetVal(ReadOILVar('DR_CONTROL_ENABLED'))='FALSE') or AllDrIsPresent(PreviousWorkDay(GetSystemDate),Mess, LeastDate);
  KP := (GetVal(ReadOILVar('KP_CONTROL_ENABLED'))='FALSE') or KonkPriceIsPresent(Trunc(GetSystemDate),KP_Mess);
  // Если все введено или сегодня выходной/праздник - то всё ОК
  if (DR and KP) or
     ((DayOfWeek(GetSystemDate) in [1,7]) or
     (pos(FormatDateTime('dd.mm', GetSystemDate), ReadOILVar('HOLIDAYS')) > 0))
     then Begin
       MainForm.timDailyRep.Deactivate;
       EMP_ID := REAL_EMP_ID;
       MainForm.ProcessMainMenu;
       if ReadOILVar('DR_ALERT')='Y'
          then Begin
            SimpleWriteOilVar('DR_ALERT','N');
            _ExecSql('update oil_var set value= to_char(sysdate,''dd.mm.yyyy hh24:mi:ss'') where name=''LAST_DR''');
            SetPacketTimer(TmpStr);
          End;
       SimpleWriteOilVar('KP_ALERT','N');
     End
     else Begin // Что-то за вчера не введено
       if DR then SimpleWriteOilVar('DR_ALERT','N') else SimpleWriteOilVar('DR_ALERT','Y');
       if KP then SimpleWriteOilVar('KP_ALERT','N') else SimpleWriteOilVar('KP_ALERT','Y');

       if not MainForm.timDailyRep.Active
       then Begin
          // Включаем таймер надоедливых мессаг
          MainForm.MessEvent.Interval := 60000*StrToInt(ReadOILVar('DR_MSG_QUANTITY'));
          MainForm.MessEvent.Enabled := True;
          MainForm.ExpireEvent.Enabled := False;
          MainForm.timDailyRep.Activate;
       End;
       SystemDate := GetSystemDate;
       // Если не введено не только за вчера, а и за позавчера
       // или время на ввод истекло - то блок прав, иначе включаем счетчик
       if not KP and not KonkPriceIsPresent(PreviousWorkDay(GetSystemDate),TmpStr) or
           not DR and (trunc(LeastDate)<PreviousWorkDay(GetSystemDate,2)) or
          (Trunc(SystemDate)+(StrToInt(ReadOilVar('DR_EXPIRE')) mod 24+AdditionHour)/24 < SystemDate)
          then Begin  // Блокируем права
              Result := 1;
              Msg := Mess+#13#10+KP_Mess+#13#10+TranslateText('Отключены все права, кроме см. отчетов и цен конкурентов.');
              if not Startup
              then Begin
                Application.MessageBox(PChar(Msg),PChar(TranslateText('Ограничение прав')),MB_OK + MB_ICONWARNING);
                EMP_ID:=6;
                MainForm.ProcessMainMenu;
              End;
          End
          else Begin
              MainForm.ExpireEvent.Interval := trunc(24*3600*1000*(Trunc(SystemDate)+(StrToInt(ReadOilVar('DR_EXPIRE')) mod 24 +AdditionHour)/24-SystemDate));
              MainForm.ExpireEvent.Enabled := True;
              Result := 2;
              Msg := Mess+#13#10+KP_Mess;
              if not Startup
              then Application.MessageBox(PChar(Msg),PChar(TranslateText('Предупреждение')),MB_OK + MB_ICONINFORMATION);
          End;
     End;
End;

procedure TMainForm.FormCreate(Sender: TObject);
begin
    IsAdminClose := False;
    ObjectCache:=TObjectCache.Create;
    RyMenu.Add(MainMenu1,nil);
    if ReadOILVar('EXE_RELEASE')<>Version.fileversion then begin
      WriteOILVar('EXE_RELEASE',Version.fileversion);
      startlog(TranslateText('  EXE_RELEASE сохранён'));
    end;
    About.CopyRight.text:='Version : '+Version.fileversion+chr(13)+About.CopyRight.text;
    //===================================
    qTemp.Close;
    qTemp.SQL.Clear;
    qTemp.SQL.Add('select * from oil_var where name=''DOG_WITH_REKVIZIT_CONTROL''');
    _OpenQuery(qTemp);
    if qTemp.IsEmpty then
       _ExecSql('insert into oil_var (name,value) values (''DOG_WITH_REKVIZIT_CONTROL'',''N'')');
    qTemp.Close;
    startlog(TranslateText('  DOG_WITH_REKVIZIT_CONTROL проверен'));
    //===================================
    GetOrgAnketaKoeff;
    startlog(TranslateText('  коэффициенты анкет считаны'));
    AlrShowWarning := (LAUNCH_MODE<>'OIL');

    if LAUNCH_MODE<>'PLANECO' then begin
       Inst_List:=','+GetInst_List(MAIN_ID,INST)+',';
       if Inst_List=',,' then
         Inst_List:=','+IntToStr(INST)+',';
       startlog(TranslateText('  допустимый список инстов считан'));
       DefineCurrentOrg;
       //startlog(TranslateText('  основная организация определена')); //перенесена в DefineCurrentOrg
       Init_MainOrg;
       startlog(TranslateText('  текущая организация инициализирована'));
       LoadAdmSettings;
       startlog(TranslateText('  настройки документов считаны'));
    end;
    MAIN_ORG_IS_FILIAL:=(MAIN_ORG.PAR=4587) and (MAIN_ORG.ORG_TYPE=4);

    if (INST_MOVE_DATE<>'') and (StrToDate(INST_MOVE_DATE)>=StrToDate('01.01.2004')) then
      OrgFilMoveType:=fmtFilial
    else if INST_FIL<>0 then
      OrgFilMoveType:=fmtBeforeFil
    else
      OrgFilMoveType:=fmtCommon;

    Admining(MainForm, EMP_ID);
    ProcessMainMenu;
    startlog(TranslateText('  главное меню создано'));
    try
      E_InitVar;
      startlog(TranslateText('  дополнительные переменные считаны'));
    except
      startlog(TranslateText('  ошибка при считывании дополнительных переменных'));
    end;

    slMenuReports:=TStringList.Create;
    startlog(TranslateText('  идет загрузка отчетов в главное меню'));    
    AddReportsMenu;
    startlog(TranslateText('  отчеты в главное меню добавлены'));
    try
     LoadXMLForms();
     startlog(TranslateText('  формы считаны'));
   except on E: Exception do begin
       startlog(TranslateText('  формы считать не удалось'));
       startlog('  '+E.Message);
       ShowMessage(E.Message+#13#10+TranslateText('Обратитесь к разработчикам'));
     end;
   end;

   ORACLE_VERSION:=GetSqlValue('select value$ from sys.props$ where name=''NLS_RDBMS_VERSION''');
end;

function ShowExistentForm(Caption_ : string):boolean;
  var i , Flag: integer; // Если есть форма с заголовком Caption_ - то показываем ее и результат - True,
Begin                    // если такая форма еще не создана - результат - False
  Result := False;
  Flag := -1;
  for i:=0 to MainForm.MDIChildCount-1 do
    if MainForm.MDIChildren[i].Caption = Caption_ then Flag:=i;
  if Flag >= 0
     then Begin
        MainForm.MDIChildren[Flag].BringToFront;
        Result := True;
     End;
End;

function RevealNonSynchroPart(Mode : integer) : boolean;
// Mode = 1 вид сообщения при запуске, 2 - при построении отчетов
  const MessageList : array[1..5] of string = (
                               '                  Внимание !'+#13#10+
                               'Найдены несинхронизированные'+#13#10+
                               '                    партии !',
                               ' Отчет не может быть построен'+#13#10+
                               '                  при наличии'+#13#10+
                               'несинхронизированных партий !',
                               '     Синхронизируйте партии !   '+#13#10+
                               'При их наличии, после 05.03.2001'+#13#10+
                               '        будут отключены отчеты !','','');
  var RealMode : integer;
      EWF : TExchWarning;
Begin
  Result := False;
  if Debugging then Exit;
  Application.CreateForm(TExchWarning,EWF);
  RealMode := Mode;
  if EXCH_PART_TIME =0 then EXCH_PART_TIME:=9;
  if GetSystemDate <= StrToDate('05.03.2001') then
     if Mode = 1 then RealMode := 3
                 else Exit; // Если дата меньше 05.03.2001 - то просто пугаем при запуске
  with EWF do
    Begin
      qPart.Close;
      qPart.Prepare;
      qPart.ParamByName('p_Days').AsInteger := EXCH_PART_TIME;
      qPart.Open;
      if (qPart.RecordCount > 0) and
         ((Mode = 1) or (qPart.FieldByName('N').AsFloat <=0) and (Mode = 2))
         then Begin
           Result := true;
           lbWarning.Caption := MessageList[RealMode];
           ShowModal;
         End;
      qPart.Close;
      free;
    End;
End;

procedure TMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.miNPTypeClick(Sender: TObject);
Var
  NPTypeRefForm : TNPTypeRefForm;
begin
  NPTypeRefForm:=TNPTypeRefForm.Create(Application);
  NPTypeRefForm.bbOk.Visible := False;
  NPTypeRefForm.FormStyle := fsMDIChild;
  DoMDIButton(NPTypeRefForm);
end;

procedure TMainForm.N18Click(Sender: TObject);
Var
 BankRef:TBankRefForm;
begin
 BankRef:=TBankRefForm.Create(Application);
 BankRef.bbOk.Visible := False;
 BankRef.bbCancel.Caption:=TranslateText('Закрыть');
 BankRef.FormStyle := fsMDIChild;
 DoMDIButton(BankRef);
 //------------------------------
 SetFormPos(MainForm,BankRef);
end;    

procedure TMainForm.SpeedButton6Click(Sender: TObject);
Var
  EmpRefForm : TEmpRefForm;
begin
  EmpRefForm:=TEmpRefForm.Create(Application);
  EmpRefForm.bbOk.Visible := False;
  EmpRefForm.FormStyle := fsMDIChild;
end;

procedure TMainForm.SpeedButton7Click(Sender: TObject);
VAR SMR:TSRepRefForm;
begin
 Application.CreateForm(TSRepRefForm,SMR);
 SMR.bbOk.Visible := False;
 SMR.FormStyle := fsMDIChild;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if uTestLaunch.WriteLog then System.Close(uTestLaunch.F);
   if not IsAdminClose then
     if (Debugging and not INTERACTIVE_LAUNCH_MODE) or
             (MessageDlg(TranslateText('Вы уверены что хотите выйти из программы?'),
                 mtConfirmation, [MbNo, mbYes], 0) = mrYes)
   then try
           //======== Time control =============
           with qTemp do begin
               Close;
               SQL.Text:='select sysdate, value, sysdate-To_Date(value,'''+'dd.mm.yyyy hh24:mi:ss'+''') as XXX from oil_var where Name = '''+'Last_run_date'+'''';
               _OpenQuery(qTemp);
               if not IsEmpty then
                  if (FieldByName('XXX').AsFloat < 0) or
                     (FieldByName('XXX').AsFloat > 5) then
                  begin
                     MessageDlg(TranslateText('Неправильная установка даты/времени !')+#13#10+
                            TranslateText('Последняя дата работы с OIL : ')+FieldByName('value').AsString,mtWarning,[mbOK],0);
                     _Halt;
                  end else
                     _ExecSql('update oil_var set value= TO_CHAR(sysdate,'''+'dd.mm.yyyy hh24:mi:ss'+''') where Name = '''+'Last_run_date'+'''');
           end;

          if uTestLaunch.WriteLog then System.Close(uTestLaunch.F);
          frmStart.ORASESSION1.Close;
          CheckupStatus.Free;
          Action:=caFree
        Except
          Application.Terminate;
        End
   else Action:=CaNone;
end;

procedure TMainForm.miAboutClick(Sender: TObject);
begin
  About.Execute;
end;

Procedure TMainForm.AddTalon;
var PTalon:TTalonPrihRefForm;
begin
  if ShowExistentForm(TranslateText('Приход талонов')) then exit;
  
  PTalon:=TTalonPrihREfForm.Create(Application);
  PTAlon.bbOk.Visible:=false;
  PTAlon.bbCancel.Caption:=TranslateText('&Закрыть');
  PTalon.FormStyle:=fsMDIChild;
  DoMDIButton(PTalon);
End;

Procedure TMainForm.OutTalon;
Var OTalon:TTalonOutRefForm;
begin
 if ShowExistentForm(TranslateText('Отпуск талонов')) then exit;
 
 OTalon:=TTalonOutRefForm.Create(Application);
 OTalon.bbOk.Visible:=false;
 OTalon.bbCancel.Caption:=TranslateText('&Закрыть');
 OTalon.FormStyle := fsMDIChild;
 DoMDIButton(OTalon);
End;

procedure TMainForm.N110Click(Sender: TObject);
begin
 toolButton6.ImageIndex:=6;
 N110.Checked:=true;
 ToolButton6.Hint:=TranslateText('Операции с талонами - [Приход]');
 AddTalon;
end;

procedure TMainForm.N31Click(Sender: TObject);
begin
  toolButton6.ImageIndex:=5;
  N31.Checked:=true;
  ToolButton6.Hint:=TranslateText('Операции с талонами - [Реализация]');
  OutTalon;
end;

procedure TMainForm.ToolButton6Click(Sender: TObject);
begin
 case ToolButton6.ImageIndex of
  6:if miPrihTalon.Visible then AddTalon;
  7:;
  5:if miAddTalon.Visible then OutTalon;
 end;
end;


Procedure TMainForm.EmpRef;
Var
  Emp:TEmpRefForm;
begin
  If ShowExistentForm(TranslateText('Справочник- Сотрудники')) then Exit;

  Emp:=TEmpRefForm.Create(Application);
  Emp.bbOk.Visible := False;
  Emp.bbCancel.Caption:=TranslateText('Закрыть');
  Emp.FormStyle := fsMDIChild;
  DoMDIButton(Emp);
End;

Procedure TMainForm.BankRef;
Var
  Bank:TBankRefForm;
begin
  Bank:=TBankRefForm.Create(Application);
  Bank.bbOk.Visible := False;
  Bank.bbCancel.Caption:=TranslateText('Закрыть');
  Bank.FormStyle := fsMDIChild;
  DoMDIButton(Bank);
  //------------------------------
End;

procedure TMainForm.N3Click(Sender: TObject);
begin
 toolButton7.ImageIndex:=12;
 N3.Checked:=true;
 ToolButton7.Hint:=TranslateText('Справочники - [Организации]');
 ShowOrgGuide(4,Main_Id,Inst,'yyy');
end;

procedure TMainForm.ToolButton7Click(Sender: TObject);
begin
   Case toolbutton7.imageindex of
    8:
      if miEmpRef.Visible then
        EmpRef;
    9:
      if miAutoRef.Visible then
        miAutoRefClick(Nil);
    20:
      if miBankRef.Visible then
        BankRef;
    12:
      if miOrgRef.Visible then
        N3Click(Nil);
    End;
end;

procedure TMainForm.N5Click(Sender: TObject);
begin
 toolButton7.ImageIndex:=8;
 N5.Checked:=true;
 ToolButton7.Hint:=TranslateText('Справочники - [Сотрудники организаций]');
 EmpRef;
end;

procedure TMainForm.N7Click(Sender: TObject);
begin
 toolButton7.ImageIndex:=9;
 N7.Checked:=true;
 ToolButton7.Hint:=TranslateText('Справочники - [Автомобили и тех. средства]');
 miAutoRefClick(Nil);
end;

procedure TMainForm.N8Click(Sender: TObject);
begin
 toolButton7.ImageIndex:=20;
 N8.Checked:=true;
 ToolButton7.Hint:=TranslateText('Справочники - [Банки]');
 BankRef;
end;

procedure TMainForm.tbSminRepClick(Sender: TObject);
Var SRep:TSRepRefForm;
begin
  If ShowExistentForm(TranslateText('Архив сменных отчетов')) then Exit;
  SRep := TSRepRefForm.Create(Application);
  Srep.deDate.Date := Date-1;
  Srep.bbSearch.Click;
  SRep.bbOk.Visible := False;
  SRep.bbCancel.Caption:=TranslateText('Закрыть');
  SRep.FormStyle := fsMDIChild;
  DoMDIButton(SRep);
end;

procedure TMainForm.miPrihRefClick(Sender: TObject);
Var
  PrihRef : TPrihRefForm;
begin
  PrihRef:=TPrihRefForm.Create(Application);
  PrihRef.bbOk.Visible := False;
  PrihRef.bbCancel.Caption:=TranslateText('Закрыть');
  PrihRef.FormStyle := fsMDIChild;
  DoMDIButton(PrihRef);
End;

procedure TMainForm.miRashRefClick(Sender: TObject);
Var
  RashRef:TRashRefForm;
begin
  If ShowExistentForm(TranslateText('Справочник - Отпуск нефтепродуктов.')) then Exit;
  RashRef:=TRashRefForm.Create(Application);
  RashRef.sbSpeedUp.Down:=true;
  RashRef.sbSpeedUp.Hint:=TranslateText('Сокращенный формат таблицы (быстро)');
  RashRef.edKP_Dog.Enabled:=false;
  RashRef.edKP_Dog.Text:='';
  RashRef.bbOk.Visible := False;
  RashRef.bbCancel.Caption:=TranslateText('Закрыть');
  RashRef.FormStyle := fsMDIChild;
  DoMDIButton(RashRef);
End;


procedure TMainForm.miPartRefClick(Sender: TObject);
Var
  PartRef:TPartRefForm;
begin
  PartRef:=TPartRefForm.Create(Application);
  PartRef.bbOk.Visible := False;
  PartRef.bbCancel.Caption:=TranslateText('Закрыть');
  PartRef.FormStyle := fsMDIChild;
  DoMDIButton(PartRef);
End;

procedure TMainForm.miAutoRefClick(Sender: TObject);
Var
  AutoRef:TAutoRefForm;
begin
  If ShowExistentForm(TranslateText('Справочник- Автомобили')) then Exit;

  AutoRef:=TAutoRefForm.Create(Application);
  AutoRef.bbOk.Visible := False;
  AutoRef.bbCancel.Caption:=TranslateText('Закрыть');
  AutoRef.FormStyle := fsMDIChild;
  DoMDIButton(AutoRef);
End;

procedure TMainForm.miEmpRefClick(Sender: TObject);
begin
  ToolButton7.ImageIndex:=8;
  N5.Checked:=true;
  ToolButton7.Hint:=TranslateText('Справочники - [Сотрудники]');
  EmpRef;
End;

procedure TMainForm.miBankRefClick(Sender: TObject);
begin

  BankRef;
end;

procedure TMainForm.miNPTypeRefClick(Sender: TObject);
Var
  NPTypeRefForm : TNPTypeRefForm;
begin
  NPTypeRefForm:=TNPTypeRefForm.Create(Application);
  NPTypeRefForm.bbOk.Visible := False;
  NPTypeRefForm.bbCancel.Caption := TranslateText('&Закрыть');
  NPTypeRefForm.FormStyle := fsMDIChild;
  DoMDIButton(NPTypeRefForm);
end;

procedure TMainForm.miOperTypeClick(Sender: TObject);
Var
  OperTypeRefForm : TOperTypeRefForm;
begin
  OperTypeRefForm:=TOperTypeRefForm.Create(Application);
  OperTypeRefForm.bbOk.Visible := False;
  OperTypeRefForm.bbCancel.Caption := TranslateText('&Закрыть');
  OperTypeRefForm.FormStyle := fsMDIChild;
  DoMDIButton(OperTypeRefForm);
end;

procedure TMainForm.miRepKomNBClick(Sender: TObject);
Begin
 LoadReport('Коммисионера по нефтебазе', //-- Название отчета *NO_TRANSLATE*
            'RepKomNB.xls',   //-- Название шаблона
//            240-34,          //-- Длинна отчета в пикселах (форма)
            305,          //-- Длинна отчета в пикселах (форма)
            6,            //-- Номер отчета пользователя
            2,            //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
            true,         //-- Отображать строку с номером отчета Да/Нет
            true,         //-- Отображать строку с датой(диапазоном) отчета Да/Нет
            true          //-- Отображать строку с организацией Да/Нет
            );
End;



procedure TMainForm.miSystemClick(Sender: TObject);
var OilVarF:TOilVarForm;
begin
 OilVarF:=TOilVarForm.Create(Application);
 OilVarF.ShowModal;
 OilVarF.free;
end;

procedure TMainForm.miUsersClick(Sender: TObject);
var ADMF:TAdminForm;
begin
 ADMF:=TadminForm.Create(Application);
 ADMF.ShowModal;
 ADMF.free;
end;

procedure TMainForm.ToolButton8Click(Sender: TObject);
Var
  SDF:TSelDepForm;
begin
 Application.CreateForm(TSelDepForm,SDF);
 SDF.Caption:=TranslateText('Структура подразделений');
 SDF.bbOk.visible:=false;
 SDF.bbCancel.caption:=TranslateText('&Закрыть');
 SDF.FormStyle:=fsMDIChild;
 DoMDIButton(SDF);
 SetFormPos(MainForm,SDF);
 SDF.Show;
end;

procedure TMainForm.miCascadeClick(Sender: TObject);
begin
  MainForm.Cascade;
end;

procedure TMainForm.N17Click(Sender: TObject);
begin
  MainForm.Tile;
end;

procedure TMainForm.miArrangeIconsClick(Sender: TObject);
begin
  MainForm.ArrangeIcons;
end;

procedure TMainForm.bMoneyClick(Sender: TObject);
Var
  Mon : TMoneyRefForm;
begin
  Mon:=TMoneyRefForm.Create(Application);
  Mon.bbOk.Visible:=false;
  Mon.bbCancel.Caption:=TranslateText('Закрыть');
  Mon.FormStyle := fsMDIChild;
  DoMDIButton(Mon);
end;

procedure TMainForm.miKP_DogClick(Sender: TObject);
Var
  DogRef:TDogRefForm;
begin
  If ShowExistentForm(TranslateText('Справочник - Договора купли-продажи')) then Exit;

  DogRef:=TDogRefForm.Create(Application);
  DogRef.bbOk.Visible := False;
  DogRef.bbCancel.Caption:=TranslateText('Закрыть');
  DogRef.FormStyle := fsMDIChild;
  DoMDIButton(DogRef);
End;

procedure TMainForm.miExchPartClick(Sender: TObject);
begin
   Case bExchPart.ImageIndex of
    19 : N100Click(Nil);
    22 : N101Click(Nil);
  End;
End;

procedure TMainForm.miPertReezRepClick(Sender: TObject);
Begin
   LoadReport('Остатки партий в резервуаре', //-- Название отчета *NO_TRANSLATE*
            'PartRez.xls',   //-- Название шаблона
            195,          //-- Длинна отчета в пикселах (форма)
            9,            //-- Номер отчета пользователя
            1,            //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
            false,         //-- Отображать строку с номером отчета Да/Нет
            true,         //-- Отображать строку с датой(диапазоном) отчета Да/Нет
            true          //-- Отображать строку с организацией Да/Нет
            );
End;

procedure TMainForm.miPumpClick(Sender: TObject);
Var
  PumpForm : TPumpForm;
begin
  Application.CreateForm(TPumpForm, PumpForm);
  PumpForm.ShowModal;
  PumpForm.Free;
End;

procedure TMainForm.miSQLClick(Sender: TObject);
Var
  SQLForm : TSQLForm;
begin
  SQLForm := TSQLForm.Create(Application);
  SQLForm.FormStyle := fsMDIChild;
  DoMDIButton(SQLForm);
end;

procedure TMainForm.miSaleBookClick(Sender: TObject);
var SB:TSlBookRefForm;
begin
  SB:=TSlBookRefForm.Create(Application);
  SB.bbOk.Visible := False;
  SB.bbCancel.Caption:=TranslateText('Закрыть');
  SB.FormStyle := fsMDIChild;
end;

procedure TMainForm.miUd_WeigRepClick(Sender: TObject);
Begin
 LoadReport('Средний удельный вес', //-- Название отчета *NO_TRANSLATE*
            'Ud_Weig.xls',   //-- Название шаблона
            150,          //-- Длинна отчета в пикселах (форма)
            7,            //-- Номер отчета пользователя
            2,            //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
            false,         //-- Отображать строку с номером отчета Да/Нет
            true,         //-- Отображать строку с датой(диапазоном) отчета Да/Нет
            true          //-- Отображать строку с организацией Да/Нет
            );
End;

procedure TMainForm.miPrintSetupClick(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TMainForm.miRashClick(Sender: TObject);
Var
  RashForm : TRashForm;
begin
  Application.CreateForm(TRashForm, RashForm);
  RashForm.edID.Text := '';
  RashForm.ShowModal;
  RashForm.Free;
end;

procedure TMainForm.miRashPPClick(Sender: TObject);
Var
  RashPPForm : TRashPPForm;
begin
  Application.CreateForm(TRashPPForm, RashPPForm);
  RashPPForm.edID.Text := '';
  RashPPForm.ShowModal;
  RashPPForm.Free;
end;

procedure TMainForm.miRashOutClick(Sender: TObject);
Var
  RashOutForm : TRashOutForm;
begin
  Application.CreateForm(TRashOutForm, RashOutForm);
  RashOutForm.edID.Text := '';
  RashOutForm.ShowModal;
  RashOutForm.Free;
end;

procedure TMainForm.miAddPrihClick(Sender: TObject);
Var
  PrihForm : TPrihForm;
begin
  Application.CreateForm(TPrihForm, PrihForm);
  PrihForm.edAct.Text := '';
  PrihForm.ShowModal;
  PrihForm.Free;
end;

procedure TMainForm.miAzsRetClick(Sender: TObject);
Var
  AZSRetForm : TAZSRetForm;
begin
  Application.CreateForm(TAZSRetForm, AZSRetForm);
  AZSRetForm.edID.Text := '';
  AZSRetForm.ShowModal;
  AZSRetForm.Free;
end;

procedure TMainForm.miMoveNBRepClick(Sender: TObject);
Begin
 LoadReport('Внутреннее перемещение ком. товара', //-- Название отчета *NO_TRANSLATE*
            'MoveNB.xls',   //-- Название шаблона
            289-34,          //-- Длинна отчета в пикселах (форма)
            8,            //-- Номер отчета пользователя
            2,            //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
            false,         //-- Отображать строку с номером отчета Да/Нет
            true,         //-- Отображать строку с датой(диапазоном) отчета Да/Нет
            true          //-- Отображать строку с организацией Да/Нет
            );
End;

procedure TMainForm.miRashVadomRepClick(Sender: TObject);
begin
 LoadReport('Реализация по ведомостям', //-- Название отчета *NO_TRANSLATE*
            'RashVedom.xls',   //-- Название шаблона
            265,          //-- Длинна отчета в пикселах (форма)
            10,            //-- Номер отчета пользователя
            2,            //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
            false,         //-- Отображать строку с номером отчета Да/Нет
            true,         //-- Отображать строку с датой(диапазоном) отчета Да/Нет
            true          //-- Отображать строку с организацией Да/Нет
            );
end;

procedure TMainForm.miTalonPotrReportClick(Sender: TObject);
var
  TalonPotrReportForm: TTalonPotrReportForm;
begin
  Application.CreateForm(TTalonPotrReportForm, TalonPotrReportForm);
  TalonPotrReportForm.ReportNumber := 1;
  TalonPotrReportForm.ShowModal;
  TalonPotrReportForm.Free;
end;

Procedure TMainForm.PrintNN(NNId,NNInst:Integer);
Var
  fr, fr_inst,Pattern,
  FromName, FromPhone, FromNalNum, FromSvidNum, FromAddress,
  ToAddress, ToPhone,
  OperName :string;
  IWorkbook: Excel8TLB._Workbook;
  ISheet: Excel8TLB._Worksheet;
  List:Variant;
  qDogDet : TOilQuery;
  CardRNPrintForm: TCardRNPrintForm;
  q:TOilQuery;
begin
  Try
    //На основании ид и инст находим налоговую накладную
    qNN.Close;
     qNN.ParamByName('a').AsInteger := NNId;
     qNN.ParamByName('b').AsInteger := NNInst;
    qNN.Open;
    If qNN.RecordCount = 0 Then //Если не находим то
    Begin
      ShowMessage(TranslateText('К этому отпуску нет Налоговой накладной.'));
      Exit;
    End;
    //Получаем реквизиты организации - поставщика
    fr := IntToStr(qNN.FieldByName('From_').AsInteger);
    fr_inst := IntToStr(qNN.FieldByName('From_inst').AsInteger);
    admq.close;
    admq.sql.Clear;
    admq.sql.add(' select O2.addr,nvl(odet.full_name,O2.name) as name,O2.phone,O2.nal_num,O2.svid_num '+
                 ' from v_org O1, v_org O2, oil_org_det odet '+
                 ' where O2.id=O1.par and O2.inst=O1.par_inst');
    admq.sql.add('       and odet.org_id(+)=O2.id and odet.inst(+)=O2.inst and odet.state(+)=''Y'' ');
    admq.sql.add('       and O1.id='+fr+' and O1.inst='+fr_inst);
    admq.open;
    // Нас интересует юридический адрес облуправления.
    PAR_ADDRESS := admq.fieldbyname('addr').AsString;

    if NN_WITH_UPPER_REKVIZIT = 'Y' then
    begin
      FromAddress := admq.fieldbyname('addr').AsString;
      FromName := admq.fieldbyname('name').AsString;
      FromPhone := admq.fieldbyname('phone').AsString;
      FromNalNum := admq.fieldbyname('nal_num').AsString;
      FromSvidNum := admq.fieldbyname('svid_num').AsString;
    end
    else if NN_WITH_UPPER_REKVIZIT = 'ALFA' then
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
      FromName := qNNFrom_Name.AsString;
      FromPhone := qNNFrom_Phone.AsString;
      FromNalNum := qNNFrom_Nal_Num.AsString;
      FromSvidNum := qNNFrom_Svid_Num.AsString;
    end;

    // адреса і телефон
    FromPhone := qNNFrom_Phone.AsString;
    if PRINT_UPPER_ADRESS = 'NO' then
      FromAddress := qNNFrom_Addr.AsString
    else
      if (PRINT_UPPER_ADRESS = 'ALFA') and (qNNFROM_.AsInteger = MAIN_ORG.INST) then
      begin
        q := TOilQuery.Create(nil);
        if GetOrgData(q, ALFANAFTA, ALFANAFTA) then
          FromAddress := q['ADDR'] +#10+
            decode([MAIN_ORG.ORG_TYPE, 3, admq.fieldbyname('addr').AsString,
              qNNFrom_Addr.AsString]);
        if MAIN_ORG.ORG_TYPE = 3 then
          FromPhone := admq.fieldbyname('phone').AsString;
        q.Free;
      end
      else
        if (PRINT_UPPER_ADRESS = 'YES') and (qNNFROM_.AsInteger = MAIN_ORG.INST) then
          FromAddress := admq.fieldbyname('addr').AsString +#10+ qNNFrom_Addr.AsString;

    // Адресс клиента-филиала в зависимость от галочки.
    IF(0<GetSqlValue('select count(*) from v_org where id = inst and id = '+ qNNORGAN.AsString+
           ' and org_type=4 and par_inst ='+IntToStr(ALFANAFTA)))
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
      ToAddress := qNNTo_Addr.AsString;
      ToPhone := qNNTo_Phone.AsString;
    end;

    qDogDet := TOilQuery.Create(nil);
    IF qNNNAL_T.AsInteger = 1 then
      qDogDet.SQL.Text := format(
        ' select * from ('+
        ' select dog_id,dog_inst,nn_id,nn_inst,state from oil_service '+
        ' union all '+
        ' select dog as dog_id,dog_inst,nn_id,nn_inst,state from oil_rashod '+
        ' union all '+
        ' select dog_id,dog_inst,nn_id,nn_inst,state from oil_money '+
        ' )where state = ''Y'' and nn_id = %d and nn_inst = %d',[NNId,NNInst])
    ELSE
      qDogDet.SQL.Text :=
        'select DT.NP_Type, DT.Dim_id, DT.Price, DT.Price2, NVL(DT.Count_,1) as Count_, '+
        ' D.dog_type as DOG_TYPE, D.dog_date as DOG_DATE, M.oper_id as M_OPER,'+
        ' DECODE(DT.Count_,null,OP.NAME,NP.NAME) as NPNAME,GRP.FULLNAME as NP_GRP_NAME,GRP.ID as NP_GRP_ID, '+
        ' Oil_Dimension.Name as Dim_Name, OP.name as OPER_NAME, d.id as dog_id,d.inst as dog_inst '+
        ' from oil_dog_detail DT, oil_dog D, oil_money M, OIL_NP_TYPE NP,OIL_NP_GROUP GRP, '+
        ' Oil_Dimension, oil_oper_type OP, oil_oper_type OP1'+
        ' where DT.state=''Y'' and M.dog_id=D.id and M.dog_inst=D.inst'+
        ' and DT.dog_id = D.id and DT.dog_inst=D.inst'+
        ' and M.nn_id='+IntToStr(NNid)+
        ' and M.nn_inst='+IntToStr(NNinst)+
        ' and M.state=''Y'''+
        ' and DT.NP_TYPE = NP.ID (+) '+
        ' and NP.grp_id = GRP.id (+) '+
        ' and DT.Dim_Id = Oil_Dimension.Id  (+)'+
        ' and M.oper_id = OP.id (+)'+
        ' and DT.NP_TYPE = OP1.ID (+) ';
    _OpenQuery(qDogDet);
    IF qNNNAL_T.AsInteger = 4 then
    begin
      if (qDogDet.FieldByName('DOG_TYPE').AsString = 'Y') or
         (qDogDet.FieldByName('DOG_TYPE').AsString = 'K')
      then
        Pattern := 'NNakTal.xls';
    end
    ELSE if qNNNAL_T.AsInteger = 5 then
      Pattern := 'NNakTal.xls';
    IF qNNNAL_T.AsInteger = 5 then
    begin
      CreateExcel(false);
      //---------------- Load Pattern ----------------------
      if Assigned(IXLSApp) then
        IWorkbook := AddWorkbook(GetMainDir+'pattern\'+Pattern);
      // Очень просто находим лист со странным именем Лист1.
      ISheet := IWorkbook.Worksheets.Item['Лист1'] as Excel8TLB._Worksheet; // *NO_TRANSLATE*
      // Не менее просто у листа можно получить область по ее имени.
      List:=ISheet;
      CardRNPrintForm := TCardRNPrintForm.Create(Application);
      CardRNPrintForm.PrintAlienNN(List,qNNId.AsInteger,qNNInst.AsInteger);
      CardRNPrintForm.Free;
      ShowExcel;
      ISheet := nil;
      IWorkbook := nil;
      List:=unassigned;
      Exit;
    End;
    IF qNNNAL_T.AsInteger = 4 then
      case qDogDet.FieldByName('m_oper').AsInteger of    // Форма расчетов
         30 : OperName := TranslateText('Оплата с р/с');
         31 : OperName := TranslateText('Наличные');
      end//case
    ELSE
      OperName := qNNFRASCH.AsString;
    if(qDogDet.FieldByName('dog_id').AsInteger = 0)or
      (qDogDet.FieldByName('dog_inst').AsInteger = 0)
    then
      ShowMessage(TranslateText('Невозможно распечатать налоговую !'))
    else
    GetTaxBillByDog(
      qNNNUM.AsString,
      FormatDateTime2('dd.mm.yyyy',qNNS_Date.AsDateTime),
      qDogDet.FieldByName('dog_id').AsInteger,
      qDogDet.FieldByName('dog_inst').AsInteger,
      OperName
      );
    qDogDet.Close;
  Except On E: Exception Do
    Begin
      ShowMessage(TranslateText('Ошибка: ')+E.Message);
    End
  End;
end;

procedure TMainForm.N38Click(Sender: TObject);
begin
 LoadReport('Движение по комиссии',       //-- Название отчета   *NO_TRANSLATE*
            'MoveKomAN.xls',  //-- Название шаблона
            237,          //-- Длинна отчета в пикселах (форма)
            107,          //-- Номер отчета gпользователя
            2,            //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
            false,        //-- Отображать строку с номером отчета Да/Нет
            true,         //-- Отображать строку с датой(диапазоном) отчета Да/Нет
            true          //-- Отображать строку с организацией Да/Нет
            );

end;

//------------------------- REPORTS --------------------------------------------
procedure TMainForm.miRezAZSRepClick(Sender: TObject);
begin
 LoadReport('Реализация с  АЗС', //-- Название отчета   *NO_TRANSLATE*
            'OutPS.xls',   //-- Название шаблона
             304,          //-- Длинна отчета в пикселах (форма)
             104,            //-- Номер отчета gпользователя
             2,            //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
             false,         //-- Отображать строку с номером отчета Да/Нет
             true,         //-- Отображать строку с датой(диапазоном) отчета Да/Нет
             true          //-- Отображать строку с организацией Да/Нет
            );
end;

procedure TMainForm.bServiceClick(Sender: TObject);
Var
  Srv : TServiceRefForm;
begin
  Srv:=TServiceRefForm.Create(Application);
  Srv.bbOk.Visible:=false;
  Srv.bbCancel.Caption:=TranslateText('Закрыть');
  Srv.FormStyle := fsMDIChild;
  DoMDIButton(Srv);
End;

procedure TMainForm.bSaleBookClick(Sender: TObject);
var SB:TSlBookRefForm;
begin
  SB:=TSlBookRefForm.Create(Application);
  SB.bbOk.Visible := False;
  SB.bbCancel.Caption:=TranslateText('Закрыть');
  SB.FormStyle := fsMDIChild;
  DoMDIButton(SB);
end;

procedure TMainForm.N34Click(Sender: TObject);
var BSF:TBookSellForm;
begin
     Application.CreateForm(TBookSellForm,BSF);
     BSF.ShowModal;
     BSF.Free;
end;

procedure TMainForm.miRestOAOClick(Sender: TObject);
begin
 LoadReport('Сводный отчет.',       //-- Название отчета; метка *NO_TRANSLATE*
            'RegionRest.xls',  //-- Название шаблона
            300,          //-- Длинна отчета в пикселах (форма)
            100,          //-- Номер отчета пользователя
            2,            //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
            false,        //-- Отображать строку с номером отчета Да/Нет
            true,         //-- Отображать строку с датой(диапазоном) отчета Да/Нет
            true          //-- Отображать строку с организацией Да/Нет
            );
end;

procedure TMainForm.N33Click(Sender: TObject);
begin
 LoadReport('Карточка клиента',       // Название отчета; метка *NO_TRANSLATE*
            'KlientCard.xls',  //-- Название шаблона
            240,          //-- Длинна отчета в пикселах (форма)
            102,          //-- Номер отчета пользователя
            2,            //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
            false,        //-- Отображать строку с номером отчета Да/Нет
            true,         //-- Отображать строку с датой(диапазоном) отчета Да/Нет
            true          //-- Отображать строку с организацией Да/Нет
            );

end;

procedure TMainForm.miDebClick(Sender: TObject);
begin
 LoadReport('Ведомость дебиторов и кредиторов',       // Название отчета; метка *NO_TRANSLATE*
            'Oplata.xls',  //-- Название шаблона
            264,          //-- Длинна отчета в пикселах (форма)
            101,          //-- Номер отчета пользователя
            2,            //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
            false,        //-- Отображать строку с номером отчета Да/Нет
            true,         //-- Отображать строку с датой(диапазоном) отчета Да/Нет
            true          //-- Отображать строку с организацией Да/Нет
            );
end;

// изменения 07.08.2000
procedure TMainForm.miDebitorsClick(Sender: TObject);
begin
 LoadReport('Ведомость Дебиторов',       //Название отчета; метка *NO_TRANSLATE*
            'Debitors.xls',  //-- Название шаблона
            288,          //-- Длинна отчета в пикселах (форма)
            109,          //-- Номер отчета пользователя
            1,            //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
            false,        //-- Отображать строку с номером отчета Да/Нет
            true,         //-- Отображать строку с датой(диапазоном) отчета Да/Нет
            true          //-- Отображать строку с организацией Да/Нет
            );
end;

procedure TMainForm.miKreditorsClick(Sender: TObject);
begin
 LoadReport('Ведомость Кредиторов',       // Название отчета; метка *NO_TRANSLATE*
            'Creditors.xls',  //-- Название шаблона
            264,          //-- Длинна отчета в пикселах (форма)
            110,          //-- Номер отчета пользователя
            1,            //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
            false,        //-- Отображать строку с номером отчета Да/Нет
            true,         //-- Отображать строку с датой(диапазоном) отчета Да/Нет
            true          //-- Отображать строку с организацией Да/Нет
            );
end;

//
procedure TMainForm.N37Click(Sender: TObject);
begin
 LoadReport('Сводная ведомость движения по АЗС',       // Название отчета; метка *NO_TRANSLATE*
            'SvodAZS.xls',  //-- Название шаблона
            293,          //-- Длинна отчета в пикселах (форма)
            104,          //-- Номер отчета пользователя
            2,            //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
            false,        //-- Отображать строку с номером отчета Да/Нет
            true,         //-- Отображать строку с датой(диапазоном) отчета Да/Нет
            true          //-- Отображать строку с организацией Да/Нет
            );
end;

procedure TMainForm.N35Click(Sender: TObject);
begin
 LoadReport('Движение н/п по договорам комиссии',       // Название отчета; метка *NO_TRANSLATE*
            'MovePPONDogCom.xls',  //-- Название шаблона
            208,          //-- Длинна отчета в пикселах (форма)
            105,          //-- Номер отчета пользователя
            2,            //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
            false,        //-- Отображать строку с номером отчета Да/Нет
            true,         //-- Отображать строку с датой(диапазоном) отчета Да/Нет
            true          //-- Отображать строку с организацией Да/Нет
            );
end;

procedure TMainForm.N41Click(Sender: TObject);
  var TalonPriceReport : TTalonPriceReport;
begin
  TalonPriceReport:=TTalonPriceReport.Create(Application);
  TalonPriceReport.ReportNumber := 1;
  TalonPriceReport.Height := 140;
  TalonPriceReport.ShowModal;
  TalonPriceReport.Free;
end;

procedure TMainForm.N42Click(Sender: TObject);
begin
 LoadReport('Движение по комиссии, суммы',       //-- Название отчета; метка *NO_TRANSLATE*
            'MoveKomANsum.xls',  //-- Название шаблона
            237,          //-- Длинна отчета в пикселах (форма)
            108,          //-- Номер отчета пользователя
            2,            //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
            false,        //-- Отображать строку с номером отчета Да/Нет
            true,         //-- Отображать строку с датой(диапазоном) отчета Да/Нет
            true          //-- Отображать строку с организацией Да/Нет
            );
end;

procedure TMainForm.MenuItem3Click(Sender: TObject);
begin
  //ToolButton2.ImageIndex:=24;
  //MenuItem3.Checked:=true;
  Application.CreateForm(TCreateAZSBookForm, CreateAZSBookForm);
  CreateAZSBOOKForm.ShowModal;
  //if CreateAZSBookForm.ModalResult = mrYes then
  //  MenuItem2Click(Sender);
  CreateAZSBookForm.free;
end;

procedure TMainForm.MenuItem1Click(Sender: TObject);
  var SB:TSlBookRefForm;
begin
  SB:=TSlBookRefForm.Create(Application);
  SB.bbOk.Visible := False;
  SB.bbCancel.Caption:=TranslateText('Закрыть');
  SB.FormStyle := fsMDIChild;
  DoMDIButton(SB);
end;

procedure TMainForm.N46Click(Sender: TObject);
var F: TSetNumForm;
begin
  Application.CreateForm(TSetNumForm,F);
  F.ShowModal;
  F.Free;
end;

procedure TMainForm.N47Click(Sender: TObject);
begin
   LoadReport(TranslateText('Дневной отчет по реализации'), //-- Название отчета
            'RepDayNB.xls',   //-- Название шаблона
            290,          //-- Длинна отчета в пикселах (форма)
            111,            //-- Номер отчета пользователя
            1,            //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
            false,         //-- Отображать строку с номером отчета Да/Нет
            true,         //-- Отображать строку с датой(диапазоном) отчета Да/Нет
            true          //-- Отображать строку с организацией Да/Нет
            );
end;

procedure TMainForm.N48Click(Sender: TObject);
var PR:TRashReportForm;
begin
     Application.CreateForm(TRashReportForm,PR);
     PR.ShowModal;
     PR.Free;
end;

function TMainForm.PartRest(PartId, PartInst:integer):real;
begin
  with RestsQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sum(s) rest from v_oil_left');
    SQL.Add('where part_id = '+IntToStr(PartId)+
           ' and part_inst = '+IntToStr(PartInst));
    Open;
    Result:= FieldByName('Rest').asFloat;
    close;
  end;
end;

function TMainForm.RezRest (RezId, RezInst:integer):real;
begin
  with RestsQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sum(s) rest from v_oil_left');
    SQL.Add('where rez_id = '+IntToStr(RezId)+
           ' and rez_inst = '+IntToStr(RezInst));
    Open;
      Result:= FieldByName('Rest').asFloat;
    close;
  end;
end;

function TMainForm.PartRezRest(PartId,PartInst,RezId,RezInst:integer):real;
begin
  with RestsQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sum(s) rest from v_oil_left');
    SQL.Add('where part_id = '+IntToStr(PartId)+
           ' and part_inst = '+IntToStr(PartInst));
    SQL.Add('and rez_id = '+IntToStr(RezId)+
           ' and rez_inst = '+IntToStr(RezInst));
    Open;
      Result:= FieldByName('Rest').asFloat;
    close;
  end;
end;

function TMainForm.GetNextNNNumber(NNDate: TDateTime):string;
var TaxBill : TdmTaxBill;
begin
 // Получаем номер налоговой
 TaxBill:= TdmTaxBill.Create;

 try
  Result:= TaxBill.GetNextNumber(NNDate);

 finally
  TaxBill.Free;
 end;
end;

procedure TMainForm.N49Click(Sender: TObject);
var
  TalonPotrReportForm: TTalonPotrReportForm;
begin
  Application.CreateForm(TTalonPotrReportForm, TalonPotrReportForm);
  TalonPotrReportForm.ReportNumber := 3;
  TalonPotrReportForm.ShowModal;
  TalonPotrReportForm.Free;
end;

procedure TMainForm.N50Click(Sender: TObject);
var
  TalonPriceReport: TTalonPriceReport;
begin
  TalonPriceReport := TTalonPriceReport.Create(Application);
  TalonPriceReport.Caption := TranslateText('Движение НП по карточкам для управления');
  TalonPriceReport.rbPrih.Visible := False;
  TalonPriceReport.rbOut.Visible := False;
  TalonPriceReport.ReportNumber := 3;
  TalonPriceReport.Height := 140;
  TalonPriceReport.ShowModal;
  TalonPriceReport.Free;
end;

procedure TMainForm.N51Click(Sender: TObject);
var SF:TSvodAzsPodpartReportForm;
begin
 if RevealNonSynchroPart(2) then Exit;

     Application.CreateForm(TSvodAzsPodpartReportForm,SF);
     SF.ShowModal;
     SF.Free;
end;

procedure TMainForm.miOperNNListClick(Sender: TObject);
var
  IdList,NameList:string;
begin
  if ShowListSelect('OIL_OPER_TYPE','','',OPER_NOT_NN,False,True,IdList,NameList)then
  begin
    OPER_NOT_NN:=','+IdList+',';
    if OPER_NOT_NN=',,' then
      OPER_NOT_NN:=',';
    _ExecSql('update oil_var set value='''+OPER_NOT_NN+''' where name=''OPER_NOT_NN''');
  end;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  if not AlrShowWarning
     then Begin
        MainForm.WindowState := wsMaximized;
        MainForm.Repaint;
        AlrShowWarning := True;
        if GetExeSqlIdByName(VERSION.FileVersion,'TopicForm')<>0 then
          if 1=getSqlValueParSimple('select nvl(sign(sysdate-min(l.dtime)+5),0) from oil_ll l'
            +' where version = :version and state=''Y'' '
            +'   and inst=ov.GetVal(''INST'') '
            +'   and machine=SYS_CONTEXT(''USERENV'',''HOST'')',['version',VERSION.FileVersion])
          then
            Application.CreateForm(TTopicForm,TopicForm);
        Application.ProcessMessages;
        if not Debugging then SecondTest;
        startlog(TranslateText('OIL запущен успешно'));
     End;
end;

procedure TMainForm.miClosePeriodClick(Sender: TObject);
var
  CloseDateForm: TCloseDateForm;
begin
  Application.CreateForm(TCloseDateForm,CloseDateForm);
  CloseDateForm.ShowModal;
  CloseDateForm.Free;
end;

procedure TMainForm.miTestDbClick(Sender: TObject);
var T:TTestDbForm;
begin
     Application.CreateForm(TTestDBForm,T);
     T.ShowModal;
     T.Free;
end;

procedure TMainForm.N58Click(Sender: TObject);
var MF: TMovementReportForm;
begin
 if RevealNonSynchroPart(2) then Exit;

     Application.CreateForm(TMovementReportForm,MF);
     MF.Tip:='Barter';
     MF.CB1.Visible:=FALSE;
     MF.ShowModal;
     MF.Free;
end;

procedure TMainForm.N60Click(Sender: TObject);
var MF: TMovementReportForm;
begin
 if RevealNonSynchroPart(2) then Exit;

     Application.CreateForm(TMovementReportForm,MF);
     MF.Caption:=TranslateText('Движение собств. НБ+АЗС');
     MF.Tip:='Own';
     MF.ShowModal;
     MF.Free;
end;

procedure TMainForm.mi1CClick(Sender: TObject);
var
  ExportIn1CForm: TExportIn1CForm;
begin
  ExportIn1CForm := TExportIn1CForm.Create(Application);
  try
    ExportIn1CForm.ShowModal;
  finally
    ExportIn1CForm.Free;
  end;
end;

procedure TMainForm.N63Click(Sender: TObject);
var
  TalonPriceReport: TTalonPriceReport;
begin
  TalonPriceReport:=TTalonPriceReport.Create(Application);
  TalonPriceReport.Caption := TranslateText('Дельта реализации по талонам');
  TalonPriceReport.rbPrih.Visible := False;
  TalonPriceReport.rbOut.Visible := False;
  TalonPriceReport.ReportNumber := 6;
  TalonPriceReport.Height := 140;
  TalonPriceReport.ShowModal;
  TalonPriceReport.Free;
end;

procedure TMainForm.N64Click(Sender: TObject);
var
  TalonPriceReport: TTalonPriceReport;
begin
  TalonPriceReport := TTalonPriceReport.Create(Application);
  TalonPriceReport.Caption := TranslateText('Отчет о инкассации с АЗС');
  TalonPriceReport.rbPrih.Visible := False;
  TalonPriceReport.rbOut.Visible := False;
  TalonPriceReport.ReportNumber := 7;
  TalonPriceReport.Height := 140;
  TalonPriceReport.ShowModal;
  TalonPriceReport.Free;
end;

procedure TMainForm.N66Click(Sender: TObject);
var
  RezRestsRefForm :TRezRestsRefForm;
begin
  RezRestsRefForm:=TRezRestsRefForm.Create(Application);
  RezRestsRefForm.bbOk.Visible := False;
  RezRestsRefForm.bbCancel.Caption := TranslateText('&Закрыть');
  RezRestsRefForm.FormStyle := fsMDIChild;
  DoMDIButton(RezRestsRefForm);
end;

procedure TMainForm.N67Click(Sender: TObject);
var
  PipeRestsRefForm :TPipeRestsRefForm;
begin
  PipeRestsRefForm:=TPipeRestsRefForm.Create(Application);
  PipeRestsRefForm.bbOk.Visible := False;
  PipeRestsRefForm.bbCancel.Caption := TranslateText('&Закрыть');
  PipeRestsRefForm.FormStyle := fsMDIChild;
  DoMDIButton(PipeRestsRefForm);
end;

procedure TMainForm.N68Click(Sender: TObject);
var
  ubMonthForm                         :TubMonthForm;
begin
  ubMonthForm := TubMonthForm.Create(Application);
  ubMonthForm.ShowModal;
  ubMonthForm.Free;
end;

procedure TMainForm.N69Click(Sender: TObject);
var
  PipeRefForm :TPipeRefForm;
begin
  PipeRefForm:=TPipeRefForm.Create(Application);
  pipeRefForm.bbOk.Visible := False;
  PipeRefForm.bbCancel.Caption := TranslateText('&Закрыть');
  PipeRefForm.FormStyle := fsMDIChild;
  DoMDIButton(PipeRefForm);
end;

procedure TMainForm.N70Click(Sender: TObject);
var
  RezTypeForm :TRezTypeForm;
begin
  RezTypeForm:=TRezTypeForm.Create(Application);
  RezTypeForm.bbOk.Visible := False;
  RezTypeForm.bbCancel.Caption := TranslateText('&Закрыть');
  RezTypeForm.FormStyle := fsMDIChild;
  DoMDIButton(RezTypeForm);
end;

procedure TMainForm.N72Click(Sender: TObject);
var
  InvRepform                         :TInvRepForm;
begin
  InvRepform:=TInvRepform.Create(Application);
  if Sender = N72
  then
    InvRepform.RepKind := rep7np
  else
    if Sender = N73
    then
      InvRepform.RepKind := repPipe
    else
      if Sender = N74
      then
        InvRepform.RepKind := repInvent
      else
        if Sender = N75
        then
          InvRepform.RepKind := repUbil
        else
          if Sender = N76
          then
            InvRepform.RepKind := repSlich;
  InvRepForm.ShowModal;
end;

procedure TMainForm.N2Click(Sender: TObject);
begin
 LoadReport('Переброска с карточки на карточку', //-- Название отчета; метка *NO_TRANSLATE*
            'Transfer.xls',   //-- Название шаблона
            250,          //-- Длинна отчета в пикселах (форма)
            11,            //-- Номер отчета пользователя
            2,            //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
            false,         //-- Отображать строку с номером отчета Да/Нет
            true,         //-- Отображать строку с датой(диапазоном) отчета Да/Нет
            true          //-- Отображать строку с организацией Да/Нет
            );
end;
//==============================================================================
//==========================Початок бюджетної частини===========================
//==============================================================================

//==============================================================================
procedure TMainForm.N81Click(Sender: TObject);
var
  F: TE_BillRefForm;
begin
  Application.CreateForm(TE_BillRefForm, F);
  F.bbOk.Visible := FALSE;
  F.FormStyle := fsMDIChild;
  DoMDIButton(F);
end;
//==============================================================================
procedure TMainForm.N84Click(Sender: TObject);
begin
  ShowOptions(0);
end;
//==============================================================================
procedure TMainForm.N102Click(Sender: TObject);
var
  F: TE_PlanRefForm;
begin
  F := TE_PlanRefForm.Create(Application);
  F.FormStyle := fsMDIChild;
  DoMDIButton(F);
end;
//==============================================================================
procedure TMainForm.N103Click(Sender: TObject);
var
  F: TE_CurRateRefForm;
begin
  F := TE_CurRateRefForm.Create(Application);
  F.FormStyle := fsMDIChild;
  DoMDIButton(F);
end;
//==============================================================================
procedure TMainForm.N113Click(Sender: TObject);
var
  F: TE_ImportForm;
begin
  Application.CreateForm(TE_ImportForm, F);
  F.ShowModal;
  F.Free;
end;
//==============================================================================

//==============================================================================
//==========================Кінець бюджетної частини============================
//==============================================================================
procedure TMainForm.N85Click(Sender: TObject);
var
  TalonPriceReport: TTalonPriceReport;
begin
  TalonPriceReport:=TTalonPriceReport.Create(Application);
  TalonPriceReport.Height := 140;
  TalonPriceReport.ReportNumber := 2;
  TalonPriceReport.ShowModal;
  TalonPriceReport.Free;
end;

procedure TMainForm.N87Click(Sender: TObject);
var PrihCardRefForm: TPrihCardRefForm;
begin
     PrihCardRefForm:=TPrihCardRefForm.Create(Application);
     PrihCardRefForm.FormStyle:=fsMDIChild;
     DoMDIButton(PrihCardRefForm);
end;

procedure TMainForm.N88Click(Sender: TObject);
begin
  LoadReport(TranslateText('Расширенная Ведомость Дебиторов'), //-- Название отчета; метка *NO_TRANSLATE*
             'ExtDebitors.xls', //-- Название шаблона
             185,   //-- Длинна отчета в пикселах (форма)
             116,   //-- Номер отчета пользователя
             1,     //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
             false, //-- Отображать строку с номером отчета Да/Нет
             true,  //-- Отображать строку с датой(диапазоном) отчета Да/Нет
             true   //-- Отображать строку с организацией Да/Нет
  );
end;

procedure TMainForm.miOsClick(Sender: TObject);
var F : TOS1CForm;
begin
     if MAIN_TYPE<>4 then begin
        showmessage(TranslateText('Для проведения этой операции основная организация должна являться Облнефтепродуктом'));
        exit;
     end;
     Application.CreateForm(TOS1CForm, F);
     F.ShowModal;
     F.Free;
end;

procedure TMainForm.N91Click(Sender: TObject);
var F: TRezervRefForm;
begin
  Application.CreateForm(TRezervRefForm,F);
  F.bbOk.Visible := False;
  F.bbCancel.Caption:=TranslateText('Закрыть');
  F.FormStyle := fsMDIChild;
  DoMDIButton(F);
end;

procedure TMainForm.N93Click(Sender: TObject);
var TempForm: TAutoReportsForm;
begin
 TempForm:= TAutoReportsForm.Create(Self);

 with TempForm do
  try
   InitForm(1);
   ShowModal;
  finally
   Free;
  end;
end;

procedure TMainForm.N94Click(Sender: TObject);
var TempForm: TAutoReportsForm;
begin
 TempForm:= TAutoReportsForm.Create(Self);

 with TempForm do
  try
   InitForm(2);
   ShowModal;
  finally
   Free;
  end;
end;

procedure TMainForm.N210Click(Sender: TObject);
var TempForm: TAutoReportsForm;
begin
 TempForm:= TAutoReportsForm.Create(Self);

 with TempForm do
  try
   InitForm(3);
   ShowModal;
  finally
   Free;
  end;
end;

procedure TMainForm.N112Click(Sender: TObject);
var TempForm: TAutoReportsForm;
begin
 TempForm:= TAutoReportsForm.Create(Self);

 with TempForm do
  try
   InitForm(4);
   ShowModal;
  finally
   Free;
  end;
end;

procedure TMainForm.N211Click(Sender: TObject);
var TempForm: TAutoReportsForm;
begin
 TempForm:= TAutoReportsForm.Create(Self);

 with TempForm do
  try
   InitForm(5);
   ShowModal;
  finally
   Free;
  end;
end;

procedure TMainForm.N310Click(Sender: TObject);
var TempForm: TAutoReportsForm;
begin
 TempForm:= TAutoReportsForm.Create(Self);

 with TempForm do
  try
   InitForm(6);
   ShowModal;
  finally
   Free;
  end;
end;

procedure TMainForm.N311Click(Sender: TObject);
var TempForm: TAutoReportsForm;
begin
 TempForm:= TAutoReportsForm.Create(Self);

 with TempForm do
  try
   InitForm(7);
   ShowModal;
  finally
   Free;
  end;
end;

procedure TMainForm.N96Click(Sender: TObject);
var TempForm: TWayBillsRefForm;
begin
 TempForm:= TWayBillsRefForm.Create(Application);
 TempForm.bbOk.Visible:= False;
 TempForm.bbCancel.Caption:=TranslateText('Закрыть');
 TempForm.FormStyle:= fsMDIChild;
 DoMDIButton(TempForm);
 TempForm.InitRef;
end;

procedure TMainForm.N97Click(Sender: TObject);
var TempForm: TAutoIncomeRefForm;
begin
 TempForm:= TAutoIncomeRefForm.Create(Application);
 TempForm.bbOk.Visible:= False;
 TempForm.bbCancel.Caption:=TranslateText('Закрыть');
 TempForm.FormStyle:= fsMDIChild;
 DoMDIButton(TempForm);
 TempForm.InitRef;
end;

procedure TMainForm.bSQLClick(Sender: TObject);
Var
  TransSubPartForm : TTransSubPartForm;
begin
  Application.CreateForm(TTransSubPartForm, TransSubPartForm);
  TransSubPartForm.ShowModal;
  TransSubPartForm.Free;
end;

procedure TMainForm.N99Click(Sender: TObject);
var
  TalonPotrReportForm: TTalonPotrReportForm;
begin
  Application.CreateForm(TTalonPotrReportForm, TalonPotrReportForm);
  TalonPotrReportForm.ReportNumber := 2;
  TalonPotrReportForm.ShowModal;
  TalonPotrReportForm.Free;
end;

procedure TMainForm.N100Click(Sender: TObject);
Var
  SynchroPartForm : TSynchroPartForm;
begin
  bExchPart.ImageIndex:=19;
  N100.Checked:=true;
  bExchPart.Hint:=TranslateText('Замена партий');

  CheckForeignKeys;

  Application.CreateForm(TSynchroPartForm, SynchroPartForm);
  SynchroPartForm.ShowModal;
  SynchroPartForm.Free;
end;

procedure TMainForm.N101Click(Sender: TObject);
Var
  TransSubPartForm : TTransSubPartForm;
begin
  bExchPart.ImageIndex:=22;
  N101.Checked:=true;
  bExchPart.Hint:=TranslateText('Замена подпартий');

  Application.CreateForm(TTransSubPartForm, TransSubPartForm);
  TransSubPartForm.ShowModal;
  TransSubPartForm.Free;
end;

procedure TMainForm.N1Click(Sender: TObject);
var
  TalonPriceReport: TTalonPriceReport;
begin
  TalonPriceReport:=TTalonPriceReport.Create(Application);
  TalonPriceReport.Caption := TranslateText('Дельта реализации по эл. карточкам');
  TalonPriceReport.rbPrih.Visible := False;
  TalonPriceReport.rbOut.Visible := False;
  TalonPriceReport.Height := 140;
  TalonPriceReport.ReportNumber := 8;
  TalonPriceReport.ShowModal;
  TalonPriceReport.Free;
end;

procedure TMainForm.N15Click(Sender: TObject);
var TempForm: TAutoCardRefForm;
begin
 TempForm:= TAutoCardRefForm.Create(Application);
 TempForm.bbOk.Visible:= False;
 TempForm.bbCancel.Caption:=TranslateText('Закрыть');
 TempForm.FormStyle:= fsMDIChild;
 TempForm.InitRef;
 DoMDIButton(TempForm);
end;

procedure TMainForm.N55Click(Sender: TObject);
var TempForm: TAutoReportsForm;
begin
 TempForm:= TAutoReportsForm.Create(Self);

 with TempForm do
  try
   InitForm(8);
   ShowModal;
  finally
   Free;
  end;
end;

procedure TMainForm.miOneOilInstanceClick(Sender: TObject);
begin
  miOneOilInstance.Checked := not miOneOilInstance.Checked;
end;

procedure TMainForm.miChangeOrgClick(Sender: TObject);
var vName:string;
    q: TOilQuery;
begin
    if ChooseOrg.CaptureOrgExt(1,0,0,'yyyyynnn',INST,INST,vName,q) then begin
       MAIN_ID:=INST;
       MAIN_TYPE:=q.fieldbyname('org_id').value;
       if not q.fieldbyname('par').IsNull then MAIN_PAR:=q.fieldbyname('par').value
                                          else MAIN_PAR:=-1;
       if not q.fieldbyname('par_inst').IsNull then MAIN_PAR_INST:=q.fieldbyname('par_inst').value
                                               else MAIN_PAR_INST:=-1;
    end;
    Init_MainOrg;
    SetCaption(MAIN_ORG.NAME);
end;

procedure TMainForm.N109Click(Sender: TObject);
Var
  AzsFaultRef:TAzsFaultRefForm;
begin
  AzsFaultRef:=TAzsFaultRefForm.Create(Application);
  AzsFaultRef.bbOk.Visible := False;
  AzsFaultRef.bbCancel.Caption:=TranslateText('Закрыть');
  AzsFaultRef.FormStyle := fsMDIChild;
  AzsFaultRef.bbSearchClick(nil);
end;

procedure TMainForm.ExpireEventTimer(Sender: TObject);
  var Mess : String;
      F    : String;
begin
   F:= ReadOILVar('DR_ALERT')+ReadOILVar('KP_ALERT');
   if F='NN'
   then Begin
      timDailyRep.Deactivate;
      Exit;
   End;
   if F='YY' then Mess := TranslateText('Не введена вчерашняя реализация по всем АЗС и Цены конкурентов')+#13#10;
   if F='YN' then Mess := TranslateText('Не введена вчерашняя реализация по всем АЗС !')+#13#10;
   if F='NY' then Mess := 'Не введены Цены конкурентов!'+#13#10;

   Application.MessageBox(PChar(Mess+TranslateText('Отключены все права, кроме см. отчетов.')),
                          PChar(TranslateText('Ограничение прав')),MB_OK + MB_ICONWARNING);
   EMP_ID:=6;
   MainForm.ProcessMainMenu;
end;

procedure TMainForm.MessEventTimer(Sender: TObject);
  var Mess : String;
      F    : String;
begin
   F:= ReadOILVar('DR_ALERT')+ReadOILVar('KP_ALERT');
   if F='NN'
   then Begin
      timDailyRep.Deactivate;
      Exit;
   End;
   if F='YY' then Mess := TranslateText('Введите вчерашнюю реализацию по АЗС и Цены конкурентов!')+#13#10;
   if F='YN' then Mess := TranslateText('Введите вчерашнюю реализацию по АЗС !')+#13#10;
   if F='NY' then Mess := TranslateText('Введите Цены конкурентов!')+#13#10;

   if miReports.Enabled then Mess := Mess + TranslateText('Иначе будут отключены все права, кроме см. отчетов.');
   Application.MessageBox(PChar(Mess),PChar(TranslateText('Предупреждение')),MB_OK + MB_ICONWARNING);
end;

procedure TMainForm.N111Click(Sender: TObject);
var F: TOvExpRefForm;
begin
  F:=TOvExpRefForm.Create(Application);
  F.bbOk.Visible := False;
  F.bbCancel.Caption:=TranslateText('Закрыть');
  F.FormStyle := fsMDIChild;
  DoMDIButton(F);
end;

procedure TMainForm.miOSRefClick(Sender: TObject);
Var
  OSForm:TfrmOS;
begin
  OSForm:=TfrmOS.Create(Application);
  OSForm.FormStyle := fsMDIChild;
  DoMDIButton(OSForm);
end;

procedure TMainForm.N114Click(Sender: TObject);
Var
  F : TCardAlienRestForm;
begin
  F:=TCardAlienRestForm.Create(Application);
  F.ShowModal;
  F.Free;
  //F.FormStyle := fsMDIChild;
End;

procedure TMainForm.N115Click(Sender: TObject);
Var
  F : TCardRNAlienPrintForm;
  TmpStr: string;
begin
  F:=TCardRnAlienPrintForm.Create(Application);
  F.ShowModal;
  F.Free;
  SetPacketTimer(TmpStr);
End;

procedure TMainForm.miKonkPriceClick(Sender: TObject);
Var
  F : TKonkPriceForm;
begin
  F:=TKonkPriceForm.Create(Application);
  F.FormStyle := fsMDIChild;
  DoMDIButton(F);
end;

procedure TMainForm.N118Click(Sender: TObject);
Var
  KpFaultRef:TKpFaultRefForm;
begin
  KpFaultRef:=TKpFaultRefForm.Create(Application);
  KpFaultRef.bbOk.Visible := False;
  KpFaultRef.bbCancel.Caption:=TranslateText('Закрыть');
  KpFaultRef.FormStyle := fsMDIChild;
  KpFaultRef.bbSearchClick(nil);
end;

procedure TMainForm.miLSNNClick(Sender: TObject);
  var CardDocEnh : TfrmCardDocEnh;
begin
  If ShowExistentForm(TranslateText('Формирование документов для клиентов по карточкам ЛС')) then Exit;
  CardDocEnh := TfrmCardDocEnh.Create(Application);
  CardDocEnh.FormStyle := fsMDIChild;
  DoMDIButton(CardDocEnh);
end;

procedure TMainForm.N127Click(Sender: TObject);
Var
  F : TFCompOs;
begin
  F:=TFCompOs.Create(Application);
  F.FormStyle := fsMDIChild;
  F.bbOk.Visible:=False;
  DoMDIButton(F);
end;

procedure TMainForm.N128Click(Sender: TObject);
Var
  F : TFCompProg;
begin
  F:=TFCompProg.Create(Application);
  F.FormStyle := fsMDIChild;
  F.bbOk.Visible:=False;
  DoMDIButton(F);
end;

procedure TMainForm.N129Click(Sender: TObject);
Var
  F : TFCompIFace;
begin
  F:=TFCompIFace.Create(Application);
  F.FormStyle := fsMDIChild;
  F.bbOk.Visible:=False;
  DoMDIButton(F);
end;

procedure TMainForm.N123Click(Sender: TObject);
Var
  F : TFCompUser;
begin
  F:=TFCompUser.Create(Application);
  F.FormStyle := fsMDIChild;
  F.bbOk.Visible:=False;
  DoMDIButton(F);
end;

procedure TMainForm.N124Click(Sender: TObject);
Var
  F : TFCompCfg;
begin
  F:=TFCompCfg.Create(Application);
  F.FormStyle := fsMDIChild;
  F.bbOk.Visible:=False;
  DoMDIButton(F);
end;

procedure TMainForm.N126Click(Sender: TObject);
Var
  F : TFCompInfo;
begin
  F:=TFCompInfo.Create(Application);
  F.FormStyle := fsMDIChild;
  F.bbOk.Visible:=False;
  DoMDIButton(F);
end;

procedure TMainForm.N120Click(Sender: TObject);
var TempForm: TfrmTalonsTotal;
begin
 TempForm:= TfrmTalonsTotal.Create(Self);

 with TempForm do
  try
   ShowModal;
  finally
   Free;
  end;
end;

procedure TMainForm.N125Click(Sender: TObject);
Var
  F : TFCompOutDevice;
begin
  F:=TFCompOutDevice.Create(Application);
  F.FormStyle := fsMDIChild;
  F.bbOk.Visible:=False;
  DoMDIButton(F);
end;

procedure TMainForm.UnloadAfterDRTimer(Sender: TObject);
var
  TmpStr: string;
begin
  SetPacketTimer(TmpStr);
end;

procedure TMainForm.UnloadEveningTimer(Sender: TObject);
var
  TmpStr: string;
begin
  SetPacketTimer(TmpStr);
end;

procedure TMainForm.UnloadCardAlientRnTimer(Sender: TObject);
var
  TmpStr: string;
begin
  SetPacketTimer(TmpStr);
end;

procedure TMainForm.UnloadMessageTimer(Sender: TObject);
var
  TmpStr: string;
begin
  TmpStr := 'ErrorMsg';
  SetPacketTimer(TmpStr);
end;

procedure TMainForm.miMoneyOutClick(Sender: TObject);
var F : TfrmMoneyOut;
begin
 Application.CreateForm(TfrmMoneyOut,F);
 F.FormStyle := fsMDIChild;
 F.bbOk.Visible:=False;
 DoMDIButton(F);
end;

procedure TMainForm.miDiscountClick(Sender: TObject);
var F : TfrmDiscount;
begin
 Application.CreateForm(TfrmDiscount,F);
 F.FormStyle := fsMDIChild;
 F.bbOk.Visible:=False;
 DoMDIButton(F);
end;

procedure TMainForm.miThirdPartyTranzClick(Sender: TObject);
var F : TfrmThirdPartyTranz;
begin
 Application.CreateForm(TfrmThirdPartyTranz,F);
 F.FormStyle := fsMDIChild;
 F.bbOk.Visible:=False;
 DoMDIButton(F);
end;

procedure TMainForm.miDiscountTypeClick(Sender: TObject);
var F : TfrmDiscountType;
begin
 Application.CreateForm(TfrmDiscountType,F);
 F.FormStyle := fsMDIChild;
 F.bbOk.Visible:=False;
 DoMDIButton(F);   
end;

procedure TMainForm.miAzsDeviceClick(Sender: TObject);
var F : TAzsDeviceForm;
begin
 Application.CreateForm(TAzsDeviceForm,F);
 F.FormStyle := fsMDIChild;
 F.bbOk.Visible:=False;
 DoMDIButton(F);
end;

procedure TMainForm.G1Click(Sender: TObject);
begin
  PrihCardRef.fRecalc;
end;

procedure TMainForm.N119Click(Sender: TObject);
var F: TImport1CDebForm;
begin
    F:=TImport1CDebForm.Create(Application);
    F.ShowModal;
    F.Free;
end;

procedure TMainForm.DayEndOilOffTimer(Sender: TObject);
begin  // в 24:00 - вирубаємо Ойл
  if (LAUNCH_MODE = 'OIL') and (Trunc(GetSystemDate) > OIL_START_DATE)
    and not DR_AUTOLOAD then
  begin
    OilOffLast1Min.Enabled := true;
    DayEndOilOff.Enabled := false;
    startlog('Активовано автозакриття OIL через 60 с');
    MessageDlg('Увага!'+#31#10+
               'OIL закриється через 60 секунд!'+#13#10+
               'Всі незбережені зміни будуть безслідно втрачені!',
                mtWarning,
                [],0);
  end;
end;

procedure TMainForm.OilOffLast1MinTimer(Sender: TObject);
begin
  startlog('Автозакриття OIL',true);
  Application.Terminate;
end;

procedure TMainForm.RegularFirstTestTimer(Sender: TObject);
var IsPw: boolean;
begin
  RegularFirstTest.Enabled := False;
  if not Debugging and FirstTest(IsPw, True) then
    begin
      if IsPw then
        try
          DBSaver.SaveRecord('OIL_LL',
              ['STATE',    'Y',
               'MD',       MD,
               'IS_PW',    'Y',
               'LST',      '',
               'IS_SMART', GetVal(ReadOilVar('SMART_PASSW')),
               'VERSION',  VERSION.FileVersion], true);
        except on E:Exception do
          MessageDlg('MainForm.RegularFirstTestTimer:' +#13#10+
                      E.Message +#13#10+
                     'Без паніки! Зробіть PrintScreen цієї помилки та вишліть її мейлом в Київ.',
                      mtError,
                     [mbOK],0);
        end
      else
        RegularFirstTest.Enabled := True;
    end;
end;

procedure TMainForm.teSuccIncassMsgTimer(Sender: TObject);
  var Msg : string;
begin
  if SuccessIncass(Msg)<>0 then ShowMessage(Msg);
end;

procedure TMainForm.teSuccIncassTimer(Sender: TObject);
  var Msg : string;
begin
  if SuccessIncass(Msg)<>0 then ShowMessage(Msg);
end;

procedure TMainForm.teRunComServerMsgTimer(Sender: TObject);
  var Msg : string;
begin
  if LinkComServer(Msg)<>0 then ShowMessage(Msg);
end;

procedure TMainForm.teLoadModemTransTimer(Sender: TObject);
  var Msg : string;
begin
  if LoadModemTrans(Msg)<>0 then ShowMessage(Msg);
end;

procedure TMainForm.teLoadCardTransTimer(Sender: TObject);
  var Msg : string;
begin
  if CardTrans(3,Msg)<>0 then ShowMessage(Msg);
end;

procedure TMainForm.tePutBlackListTimer(Sender: TObject);
  var Msg : string;
begin
  if CardTrans(4,Msg)<>0 then ShowMessage(Msg);
end;

procedure TMainForm.teLoadPackPCTimer(Sender: TObject);
  var Msg : string;
begin
  if PCExchange(5,Msg)<>0 then ShowMessage(Msg);
end;

procedure TMainForm.teSendPackPCTimer(Sender: TObject);
  var Msg : string;
begin
  if PCExchange(6,Msg)<>0 then ShowMessage(Msg);
end;

procedure TMainForm.teMakeBlackListTimer(Sender: TObject);
  var Msg : string;
begin
  if MakeBlackList(Msg)<>0 then ShowMessage(Msg);
end;

procedure TMainForm.teMakeBlackListMsgTimer(Sender: TObject);
  var Msg : string;
begin
  if MakeBlackList(Msg)<>0 then ShowMessage(Msg);
end;

procedure TMainForm.teSendPackPCMsgTimer(Sender: TObject);
  var Msg : string;
begin
  if PCExchange(6,Msg)<>0 then ShowMessage(Msg);
end;

procedure TMainForm.teLoadPackPCMsgTimer(Sender: TObject);
  var Msg : string;
begin
  if PCExchange(5,Msg)<>0 then ShowMessage(Msg);
end;

procedure TMainForm.tePutBlackListMsgTimer(Sender: TObject);
  var Msg : string;
begin
  if CardTrans(4,Msg)<>0 then ShowMessage(Msg);
end;

procedure TMainForm.teLoadCardTransMsgTimer(Sender: TObject);
  var Msg : string;
begin
  if CardTrans(3,Msg)<>0 then ShowMessage(Msg);
end;

procedure TMainForm.teLoadModemTransMsgTimer(Sender: TObject);
  var Msg : string;
begin
  if LoadModemTrans(Msg)<>0 then ShowMessage(Msg);
end;
//*****************************************************************************
//**************  КНОПКИ УПРАВЛЕНИЯ MDI ОКНАМИ*********************************
//*****************************************************************************
procedure TMainForm.btnMDIClick(Sender:TOBject);
begin
  if (Sender as TSpeedButton).Down then
  begin
    ShowWindow((Sender as TSpeedButton).Tag,SW_RESTORE);
    PostMessage((Sender as TSpeedButton).Tag,WM_CHILDACTIVATE,0,0);
  end else ShowWindow((Sender as TSpeedButton).Tag,SW_MINIMIZE)
end;


procedure TMainForm.CreateMDIButton(frm:TForm);
var
  btn : TSpeedButton;
begin
  btn := TSpeedButton.Create(StatusBar);
  with btn do
  begin
    Flat:=true;
    GroupIndex:=1;
    AllowAllUp:=true;
    Il.GetBitmap(6,Glyph);
    Hint := frm.Caption;
    ShowHint:=true;
    Caption := copy(frm.Caption,1,10)+'...';
    Width:= 100;
    Height:=StatusBar.Height-6;
    Top := 4;
    PopUpMenu := pmMDI;
    Left := (MainForm.MDIChildCount-1)*btn.Width+10;
    Parent := StatusBar;
    Tag := frm.Handle;
    down:=true;
    OnClick := btnMDIClick;
  end;
end;


procedure TMainForm.miMDICloseClick(Sender: TObject);
begin
 SendMessage(pmMDI.PopupComponent.Tag,WM_CLOSE,0,0);
end;

procedure TMainForm.miMDIRestoreClick(Sender: TObject);
begin
  ShowWindow(pmMDI.PopupComponent.Tag,SW_RESTORE);
end;

procedure TMainForm.miMDIMinimizeClick(Sender: TObject);
begin
  ShowWindow(pmMDI.PopupComponent.Tag,SW_MINIMIZE);
end;

procedure TMainForm.MDIFormActivate(Sender:TObject);
var i:integer;
begin
  for i:=0 to MainForm.StatusBar.ComponentCount-1 do
    if (MainForm.StatusBar.Components[i] as TSpeedButton).Tag = (Sender as TForm).Handle then
      (MainForm.StatusBar.Components[i] as TSpeedButton).down:=true;
end;

procedure TMainForm.MDIFormClose(Sender:TObject);
var i: integer;
begin
  for i:=0 to MainForm.StatusBar.ComponentCount-1 do
   if (MainForm.StatusBar.Components[i] as TSpeedButton) <> nil then
     if (MainForm.StatusBar.Components[i] as TSpeedButton).Tag = (Sender as TForm).handle then  begin
      (MainForm.StatusBar.Components[i] as TSpeedButton).free;
       break;
     end;
  RelocateButtons();
end;

procedure TMainForm.RelocateButtons();
var i, iLastPos, iCurPos : integer;
begin
 iCurPos := 10;
 for i:=0 to MainForm.StatusBar.ComponentCount-1 do
 begin
   iLastPos := (MainForm.StatusBar.Components[i] as TSpeedButton).Left;
   if iLastPos > iCurPos then (MainForm.StatusBar.Components[i] as TSpeedButton).Left := iCurPos;
   iCurPos := iCurPos+(MainForm.StatusBar.Components[i] as TSpeedButton).Width;
 end;
end;

procedure TMainForm.DoMDIButton(frm: TForm);
begin
  CreateMDIButton(frm);
  frm.OnActivate := MDIFormActivate;
  frm.OnDestroy := MDIFormClose;
  RelocateButtons();
end;

procedure TMainForm.GetRefByClass(AFormName: string);
var
  b : TForm;
  f : TFormClass;
{
Чтобы процедура работала в форме с класом необходимо дописать следюшее
initialization
  RegisterClass(TКлассФормы);
}
begin
  f := TFormClass(FindClass(AFormName));
  b := f.Create(Self);
  b.FormStyle := fsMDIChild;
  DoMDIButton(b);
end;

//*****************************************************************************
//*****************  ПОЛНОЭКРАННЫЙ РЕЖИМ  *************************************
//*****************************************************************************

procedure TMainForm.miFullScreenClick(Sender: TObject);
begin

  if MainForm.MDIChildCount > 0
    then raise Exception.Create(TranslateText('При переходе из режима в режим все открытые окна следует закрыть'));

  miFullScreen.Checked := not miFullScreen.Checked;
  if not miFullScreen.Checked then
  begin
    Self.Top := appTop;
    Self.Left := appLeft;
    Self.Width := appWidth;
    Self.Height := appHeight;
    Self.BorderStyle := bsSizeable;
  end
  else
  begin
    Self.Top := 0;
    Self.Left := 0;
    Self.Width := Forms.Screen.Width;
    Self.Height := Forms.Screen.Height;
    Self.BorderStyle := bsNone;
    Application.Restore;
  end;

end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  appTop := Top;
  appLeft := Left;
  appWidth := Width;
  appHeight := Height;
  Application.Title := GetOrgName(INST,INST);
  if REPORT_SCRIPT_FILENAME<>'' then begin
        MakeAutomaticReports(REPORT_SCRIPT_FILENAME);
        startlog(TranslateText('  автоматическое построение отчетов запущено'));
        Close;
  end;
  if SplashForm <> nil then FreeAndNil(SplashForm);
  nOilTest.Visible := Debugging and (EMP_ID = 1);

  if SysParamExists('RUN_OIL_AUTOLOAD_SREP') then
    tbSminRepClick(nil);
  if SysParamExists('RUN_OIL_EXPORT') then
  begin
    mi1CClick(nil);
    Application.Terminate;
  end;

  if ReadOilVar('BASE_INST') = 'Y' then
  begin
    if FileExists(GetMainDir +'Pictures\Резервуарный парк.emf') then
    begin
      imRezPark.Picture.LoadFromFile(GetMainDir +'Pictures\Резервуарный парк.emf');
      imRezPark.Visible := true;
    end;
    ToolButton2.Click;
  end;
end;

//*****************************************************************************
//*****************************************************************************
//*****************************************************************************

procedure TMainForm.miTransMoveInstClick(Sender: TObject);
var F : TfrmMoveInstTrans;
begin
 Application.CreateForm(TfrmMoveInstTrans,F);
 F.FormStyle := fsMDIChild;
 F.bbOk.Visible:=False;
 DoMDIButton(F);
end;

procedure TMainForm.miBalImpClick(Sender: TObject);
var F: TOneSImportForm;
begin
     if MAIN_TYPE<>4 then begin
        showmessage(TranslateText('Для проведения этой операции основная организация должна являться Облнефтепродуктом'));
        exit;
     end;
     Application.CreateForm(TOneSImportForm,F);
     F.ShowModal;
     F.Free;
end;
//==============================================================================
function SysParamExists(p_Name: string): Boolean;
begin
  if SYS_PARAMS = nil then
    Result := False
  else
    Result:=(SYS_PARAMS.IndexOf(p_Name)<>-1) or ((SYS_PARAMS.IndexOfName(p_Name)<>-1));
end;
//==============================================================================
function SysParamValue(p_Name: string): string;
begin
  Result:=SYS_PARAMS.Values[p_Name];
end;
//==============================================================================
Procedure TMainForm.Admining(AForm:TForm; AEmp_Id:integer);
const
  sqL1:string='select * from adm_object where type =''M'' order by id ';

  sqL2:string='SELECT U.ID, O.NAME '+
    ' FROM ADM_OBJECT O, ADM_USER_RIGHT Ur, ADM_USERS U '+
    ' WHERE  (U.ID = Ur.USER_ID) '+
    ' AND  (O.ID = Ur.OBJECT_ID) '+
    ' AND  ( (O.TYPE = ''M'') '+
    ' AND  (U.ID =:ID) ) ';
var
  sl:TStringList;
  i:integer;
  mi:TMenuItem;
  iMaxId,iNextId:integer;
  //============================================================================
  procedure AddMenu(Ami:TMenuItem;ANode:integer=0;AParentName:string='');
  const
    arrBlackList:Array [1..5] of string=('miImport','miExport','miChangeOrg','miServ','miReports');
  var
    i,j,k:integer;
    s:string;
    iParentId:integer;
    bExists:boolean;
    sCaption:string;
  begin
    //Находим максимальный ADM_OBJECT.ID
    if(iMaxId=-1)then
    begin
      iMaxId:=GetSqlValue('select max(id) from adm_object');
      iNextId:=iMaxId+1;
    end;
    //Проверяем входит ли даное меню в список запрещенных
    for k:=low(arrBlackList) to high(arrBlackList) do
      if( Ami.Name=arrBlackList[k] )then
        exit;
    //Отсекаем "разделители" и меню без названия и подписи
    if( (Ami.Caption<>'-')and(Ami.Caption<>'')and(Ami.Name<>'') )then
    begin
      //Смотрим есть ли в БД такое меню
      qMainMenu.Filtered:=False;
      qMainMenu.Filter:=' name = '''+Ami.Name+''' ';
      qMainMenu.Filtered:=True;
      //Если в БД не нашли, то добавляем в список
      if( qMainMenu.IsEmpty )then
      begin
        if ANode=0 then
          iParentId:=0
        else
          iParentId:=nvl(GetSqlValueParSimple('select id from adm_object where name=:name',
            ['name',AParentName]),0);
        //Ликвидируем все подчерки букв - &
        sCaption:=StringReplace(Ami.Caption,'&','',[rfReplaceAll]);
        bExists:=true;
        //Далее смотрим нет ли обьекта с таким же текстом в БД
        //Если есть то добавляем в конце пробел, проверяем сново и т.д.
        while( bExists )do
        begin
          if 0=GetSqlValueParSimple('select count(*) from adm_object where text=:text',
            ['text',sCaption])
          then
            bExists:=false
          else
            sCaption:=sCaption+' ';
        end;
        s:=Ami.Name+'='+StringReplace(Ami.Caption,'&','',[rfReplaceAll])+';'+AParentName;
        for i:=0 to ANode do
          s:=' '+s;
        //Типа "условие" при котором в файл попадает либо, названия и подписи меню,
        //либо, инсерты для вставки в БД
        if true then
        begin
          sl.Add(format('insert into adm_object '
            +'(id,name,text,type,mainmenu,default_) values'
            +'(%d,''%s'',''%s'',''M'',%d,''Y'');',
            [iNextId,
             Ami.Name,
             sCaption,
             iParentId]));
          inc(iNextId);
        end
        else
          sl.Add( s );
      end;
    end;
    //Если в текущем меню есть подменю, то проганям через эту процедуру еще и их
    if( Ami.Count>0 ) then
      for j:=0 to Ami.Count-1 do
        AddMenu( Ami.Items[j],ANode+1,Ami.name );
  end;
  //============================================================================
  (** Проставляет Visible в нужное состояние *)
  procedure SetVisible(AState:boolean);
  var
    i:integer;
    mi:TMenuItem;
  begin
    For i:=0 to AForm.ComponentCount-1 do if AForm.Components[i] is TMenuItem then
    begin
      mi:=(AForm.Components[i] as TMenuItem);
      qMainMenu.Filtered:=False;
      qMainMenu.Filter:=' name = '''+mi.Name+''' ';
      qMainMenu.Filtered:=True;
      if( not qMainMenu.IsEmpty )then
        mi.Visible:=AState
    end;
  end;
begin

{           ! Администрирование меню в три етапа !             }
{ 0.[необязательный] запись в файл неиспользуемых меню         }
{ 1.скрываем все меню которые есть у нас в БД                  }
{ 2.показываем меню которые разрешены конкретному пользователю }
{ 3.проверка на соответствие с менюшками и кнопками в форме    }
  //0
  if SysParamExists('CHECK_NEW_MENU') then
  begin
    iMaxId:=-1;
    iNextId:=-1;
    qMainMenu.SQL.Text:=sqL1;
    _OpenQuery(qMainMenu);
    sl:=TStringList.Create;
    try
      //Пробег по главному меню МейнФормы
      for i:=0 to MainMenu1.Items.Count-1 do
      begin
        mi:=MainMenu1.Items[i];
        AddMenu(mi);
      end;
      sl.SaveToFile(GetMainDir+'CHECK_NEW_MENU.LOG');
    finally
      sl.free;
      qMainMenu.Close;
    end;
  end;
  //1
  qMainMenu.SQL.Text:=sqL1;
  _OpenQuery(qMainMenu);
  SetVisible(False);
  qMainMenu.Close;
  //2
  qMainMenu.SQL.Text:=sqL2;
  qMainMenu.ParamByName('ID').AsInteger:=AEmp_Id;
  _OpenQuery(qMainMenu);
  SetVisible(True);
  qMainMenu.Close;
  //3
  //если зашел админ то показуем ему меню настройки,а иначе...
  miSettings.Visible:= AEmp_Id=1;

  bPrih.Enabled := miPrihRef.Visible;
  bRash.Enabled := miRashRef.Visible;
  bPartRef.Enabled := miPartRef.Visible;
  bPartRef.Enabled := miPartRef.Visible;
  tbSminRep.Enabled := miSminRep.Visible;
  bMoney.Enabled := miMoney.Visible;
  bSaleBook.Enabled := miSaleBook.Visible;
  bService.Enabled := miService.Visible;
  ToolButton8.Enabled := N18.Visible;
  N110.Visible := miPrihTalon.Visible;
  N31.Visible := miAddTalon.Visible;
  ToolButton6.Enabled := ( (N110.Visible=true) and  (N31.Visible=true) );
  N3.Visible := miOrgRef.Visible;
  N5.Visible := miEmpRef.Visible;
  N7.Visible := miAutoRef.Visible;
  N8.Visible := miBankRef.Visible;
  ToolButton7.Enabled := ( (N3.Visible=true) and  (N5.Visible=true) and (N7.Visible=true) and (N8.Visible=true) );
  miChangeOrg.Visible := Debugging;
End;
//==============================================================================
procedure TMainForm.N9Click(Sender: TObject);
var F: TWagonsCrashForm;
begin
  Application.CreateForm(TWagonsCrashForm,F);
  F.ShowModal;
  F.Free;
end;
//==============================================================================
procedure TMainForm.N212Click(Sender: TObject);
begin
end;
//==============================================================================
procedure TMainForm.N213Click(Sender: TObject);
begin
end;
//==============================================================================
procedure TMainForm.N61Click(Sender: TObject);
var
 frmLogin : TSplashForm;
begin
  if not IsAllFormsClosed then Exit;

  if LAUNCH_MODE<>'PLANECO' then
  begin
    frmLogIn:=TSplashForm.Create(Application);
    frmLogIn.ShowPictures;
    frmlogin.lblProgress.Caption := TranslateText('Смена пользователя...');
    frmLogin.Notebook.PageIndex := 1;

    frmLogin.IsHalt := false;
    if Main.INTERACTIVE_LAUNCH_MODE
      then frmLogin.ShowModal;

    if frmLogin.Tag = 1 then
    begin
      EMP_ID:=frmLogin.EmpId;
      REAL_EMP_ID := frmLogin.EmpId;
      SUPER_REAL_EMP_ID:=frmLogin.EmpId;
      frmLogin.free;
    end
    else
    begin
      frmLogin.free;
      Exit;
    end;
  end
  else EMP_ID:=0;
  FreeAndNil(CheckupStatus);
  CheckupStatus := TCheckupStatus.Create;
  CheckupStatus.Refresh;
  if not Debugging then SecondTest;
  Admining(MainForm,EMP_ID);
  ProcessMainMenu;
end;
//==============================================================================
procedure TMainForm.FormDblClick(Sender: TObject);
begin
end;

{------------------------------------------------------------------------------}
procedure TMainForm.ItemXMLFormClick(Sender: TObject);
var
  XmlForm : TXmlForm;
begin
  XmlForm := ShowXMLForm((Sender as TMenuItem).Name);
  if Assigned(XmlForm)  then
  begin
    if (Sender as TMenuItem).Name = 'PolisRef'
      then ProcessPolisForm(XmlForm);

    if (Sender as TMenuItem).Name = 'TranzAlienOrgRef'
      then ProcessDocTranzAlienOrg(XmlForm);
  end;
end;

procedure TMainForm.LoadXMLForms;
var
  sr: TSearchRec;
  Path,MenuCaption,Menu,MenuNamePosition : String;
  MenuPosition:integer;
  XMLDoc, RootNode : Variant;
  MenuItem : TMenuItem;
begin
  try
    XMLDoc := CreateOleObject('Microsoft.XMLDOM.1.0');
    Path := GetMainDir+FORMS_FOLDER+'\';
    if FindFirst(Path+'*.xml',faAnyFile,sr) = 0 then
    repeat
      if FileExists(Path+sr.Name) then
      begin
        XMLDoc.Load(GetMainDir+FORMS_FOLDER+'\'+sr.Name);
        RootNode := XMLDoc.DocumentElement;
        Menu := GetAttrValue(RootNode,XMENU);
        MenuCaption := GetAttrValue(RootNode,XCAPTION);
        MenuNamePosition := GetAttrValue(RootNode,XMENUNAME);
        MenuPosition:=-1;
        if GetAttrValue(RootNode,XMENUPOSITION)<>'' then
          try
            MenuPosition:=StrToInt(GetAttrValue(RootNode,XMENUPOSITION));
          except
            MenuPosition:=-1;
          end;
        if Menu <> '' then
        begin
          MenuItem := AddMenuItemPath(Menu+'\'+Menucaption,MenuPosition,'',MenuNamePosition);
          if MenuItem <> nil then
          begin
            MenuItem.Name := Copy(sr.Name,1,pos('.',sr.Name)-1);
            MenuItem.OnClick :=   ItemXMLFormClick;
          end;
        end;
      end;
    until FindNext(sr)<>0;
    FindClose(sr);
  except on e:Exception do
    ShowMessage(E.Message+#13#10+TranslateText('Возможно необходимо установить Internet Explorer 5.5 и выше.'))
  end;
end;
{------------------------------------------------------------------------------}
//==============================================================================
function TMainForm.AddMenuItemPath(
  p_MenuPath: string;
  p_Position: integer = -1;
  p_Name: string = '';
  p_MenuNamePath: string=''): TMenuItem;
var
  sl,slMNP: TStringList;
  MenuItem,NewMenuItem,NewItem: TMenuItem;
  i: integer;
begin
  sl:=TStringList.Create;
  Str2StringList(p_MenuPath,sl,'\');
  if p_MenuNamePath<>'' then
  begin
    slMNP:=TStringList.Create;
    Str2StringList(p_MenuNamePath,slMNP,'\');
  end;
  NewItem := TMenuItem.Create(MainMenu1);
  NewItem.Caption := sl[sl.Count-1];
  NewItem.Name := p_Name;

  if sl.Count=1 then
    if p_Position=-1 then
      MainMenu1.Items.Add(NewItem)
    else
      MainMenu1.Items.Insert(p_Position,NewItem)
  else
  begin
    MenuItem := MainMenu1.Items.Find(sl[0]);
    if MenuItem = nil then
    begin
      MenuItem:=TMenuItem.Create(MainMenu1);
      MenuItem.Caption:=sl[0];
      if p_MenuNamePath<>'' then
        MenuItem.Name:=slMNP[0];
      MainMenu1.Items.Add(MenuItem);
    end;
    for i:=1 to sl.Count-2 do
    begin
      NewMenuItem:=MenuItem.Find(sl[i]);
      if NewMenuItem=nil then
      begin
        NewMenuItem:=TMenuItem.Create(MainMenu1);
        NewMenuItem.Caption:=sl[i];
        if p_MenuNamePath<>'' then
          MenuItem.Name:=slMNP[i];
        MenuItem.Add(NewMenuItem);
      end;
      NewMenuItem.OnClick:=nil;
      MenuItem:=NewMenuItem;
    end;
  end;
  NewMenuItem:=MenuItem.Find(NewItem.Caption);
  if NewMenuItem<>nil then
    result:=NewMenuItem
  else
  begin
    if p_Position<=0 then
      MenuItem.Add(NewItem)
    else
    begin
      if p_Position < MenuItem.Count then
        MenuItem.Insert(p_Position,NewItem)
      else
        MenuItem.Insert(MenuItem.Count,NewItem)
    end;
    result:=NewItem;
  end;
  sl.Free;
end;
//==============================================================================
procedure TMainForm.AddReportsMenu;
var strDirName,strFileName,strVersion,strMenu,strDbVersion,strDbMenu: string;
    n,iPosition,iDbPosition: integer;
    q: TOilQuery;
    mi: TMenuItem;
    sr: TSearchRec;
    slCompared:TStringList; // Список свереных меню
    IsFromFile:boolean;// Флаг откуда брать данные
  //----------------------------------------------------------------------------
  // заморочка с вытягиванием укр.названия
  function GetRRRNameMenu(APath: string): string;
  begin
    result:=ExtractFileDir(APath)+'\'+DevideRusUkr(ExtractFileName(APath),true);
  end;
  //----------------------------------------------------------------------------
  function FindMenuItem(AItem:TMenuItem;ATag:integer):TMenuItem;
  var
    i: integer;
    NE: TNotifyEvent;
  begin
    NE := MenuReportClick;
    Result:=nil;
    if @AItem.OnClick = @NE then
    begin
      if AItem.Tag=ATag then
        Result:=AItem;
    end
    else
    for i:=0 to AItem.Count-1 do
    begin
      Result:=FindMenuItem( AItem.Items[i],ATag );
      if Result <> nil then
        Break;
    end;
  end;
  //----------------------------------------------------------------------------
  procedure AddMenu( AFileName:string );
  var
    i: integer;
  begin
    (** Смотрим создано ли, уже меню, если создано, то переприсваиваем ему капшн *)
    for i:=0 to MainMenu1.Items.Count-1 do
    begin
      mi:=FindMenuItem( MainMenu1.Items[i],slMenuReports.IndexOf( AFileName ) );
      if mi<>nil then
      begin
        if IsFromFile then
          mi.Caption:=DevideRusUkr(ExtractFileName(strMenu),true)
        else
          mi.Caption:=DevideRusUkr(ExtractFileName(strDbMenu),true) ;
        Exit;
      end;
    end;
    
    if (IsFromFile and (strMenu <> 'DISABLED'))or(not IsFromFile and (strDbMenu <> 'DISABLED')) then
    begin
      if IsFromFile then
        mi:=AddMenuItemPath( strMenu,iPosition )
      else
        mi:=AddMenuItemPath( strDbMenu,iDbPosition );
      mi.OnClick:=MenuReportClick;
      slMenuReports.Add( AFileName );
      mi.Tag:=slMenuReports.Count-1;
    end;
  end;
  //----------------------------------------------------------------------------
  procedure SetDbVar();
  begin
    strDbMenu:=GetRRRNameMenu(q.FieldByName('menu').AsString);
    strDbVersion:=q.FieldByName('version').AsString;
    iDbPosition:=q.FieldByName('menu_position').AsInteger;
  end;
  //----------------------------------------------------------------------------
begin
  //DeleteReportsMenu();
  (** 1. Проверка в папке *)
  q:=TOilQuery.Create(nil);
  slCompared:=TStringList.Create;
  try
    q.Sql.Text:='select * from v_exe_rrr where menu is not null order by menu, name';
    q.Open;
    n:=FindFirst(GetMainDir+'Reports\*.rrr',faAnyFile,sr);
    while n=0 do
    begin
      IsFromFile:=True;
      GetRRRMenuPath(GetMainDir+'Reports\'+sr.Name,strMenu,strVersion,iPosition);
      q.Filtered:=False;
      q.Filter:=Format(' name=''%s'' ',[FileNameMinusExt(sr.Name)]);
      q.Filtered:=True;
      if q.RecordCount<>0 then
      begin
        // сравнивается версия данные берутся, где версия новее
        slCompared.Add( FileNameMinusExt(sr.Name) );
        if CompareVersion( strDbVersion,strVersion )<>-1 then
        begin
          IsFromFile:=False;
          SetDbVar();
        end;
      end;
      AddMenu( FileNameMinusExt(sr.Name) );
      n:=FindNext(sr);
    end;
    (** 2. Проверяем в БД *)

    q.Filtered:=False;
    q.First;               //     q.FieldByName('Name').AsString: 'ТАЛ - Перемещение'
    while not q.Eof do   // slCompared.text: 'КРТ - Реестр чужих налоговых'#$D#$A'КРТ - Реестр чужих расходных'#$D#$A'ТАЛ - Перемещение'#$D#$A'Финансы - Главный реестр'#$D#$A'Финансы - План-Факт'#$D#$A'Финансы - Реестр разрешений'#$D#$A
    begin
      strDirName:=GetMainDir+'Reports\'+q.FieldByName('Name').AsString+'.rrr';// вытягиваем имя из запроса
      // Предотвращаем повторный парсинг меню
       if( slCompared.IndexOf( q.FieldByName('Name').AsString )<>-1 )then
      begin
        q.Next;
        Continue;
      end;
      SetDbVar();
      try
        if FileExists(strDirName) then // проверка существует ли файл с таким именем
        begin
          GetRRRMenuPath( strDirName,strMenu,strVersion,iPosition );// процедурка из файла вытягивает данные
          // сравнивается версия данные берутся, где версия новее
          IsFromFile:=(not CompareVersion( q.FieldByName('version').AsString,strVersion )<>-1);
        end
        else // вытягиваем с БД
          IsFromFile:=False;
        AddMenu( FileNameMinusExt( q.FieldByName('name').AsString+'.rrr' ) );
      except on E:Exception do
        MessageDlg(format(TranslateText('Ошибка выгрузки отчета "%s" из БД'),[strFileName])+#13#10
          +E.Message,mtError,[mbOk],0);
      end;
      q.Next;
    end;//while not q.Eof do
  finally
    q.Free;
    slCompared.Free;
  end;
end;
//==============================================================================
procedure TMainForm.MenuReportClick(Sender: TObject);
begin
  MakePluginReport(slMenuReports[(Sender as TMenuItem).Tag]);
end;
//==============================================================================
procedure TMainForm.N11Click(Sender: TObject);
var
  GetSysInfo : TGetSysInfo;
  hDll : HWND;
begin
  hDll := LoadLibrary(PChar(GetMainDir+'sysinfo.dll'));
  try
    try
      @GetSysInfo:=GetProcAddress(hDll, 'GetSysInfo');
      if @GetSysInfo <> nil
        then GetSysInfo(frmStart.OraSession1.ConnectString)
        else raise Exception.Create(TranslateText('Не найден файл SysInfo.dll. Он должен находится в папке вместе с OIL.EXE'))
    except on E:Exception do
      ShowMessage(E.Message);
    end;
  finally
    FreeLibrary(hDll);
  end;
end;
//==============================================================================
procedure TMainForm.MainMenu1Change(Sender: TObject; Source: TMenuItem;
  Rebuild: Boolean);
begin
  RyMenu.Add(MainMenu1,Source);
end;
//==============================================================================
{реализация методов интерфейса IOilDb}
function TMainForm.ReadOilVar_(AName: PChar) : ShortString;
begin
 Result := ReadOilVar(AName);
end;
//==============================================================================
function TMainForm.GetVal_(AValue: PChar): ShortString;
var
 S: String;
begin
  S:= GetVal(String(AValue));
  Result := PChar(S);
end;
//==============================================================================
function TMainForm.GetSQLValue_(ASql: PChar): ShortString;
var
 S: String;
begin
  S:= GetSQLVAlue(ASql);
  Result := PChar(S);
end;
//==============================================================================
procedure TMainForm.ExecSql_(ASQL: PChar);
begin
  _ExecSQL(ASQL);
end;
//==============================================================================
procedure TMainForm.miCountBetweenFilCardClick(Sender: TObject);
begin
  RunFillCardTransitPart(Date);
end;
//==============================================================================
procedure TMainForm.miImpCreditCardClick(Sender: TObject);
begin
  LoadBankCardForm := TLoadBankCardForm.Create(Application);
  with LoadBankCardForm do
  begin
   Caption := miImpCreditCard.Caption;
   Show;
  end;
end;
//==============================================================================

procedure BlockOpenForms;
var
  I: Integer;
begin
  for I:= 0 to Application.MainForm.MDIChildCount - 1 do
  begin
    if Application.MainForm.MDIChildren[I] is TBaseForm then
    begin
      TBaseForm(Application.MainForm.MDIChildren[I]).pAdd.Visible := False;
      TBaseForm(Application.MainForm.MDIChildren[I]).pDel.Visible := False;
      TBaseForm(Application.MainForm.MDIChildren[I]).pEdit.Visible := False;
    end;
  end;
end;

procedure TMainForm.miAktSverkiClick(Sender: TObject);
begin
 LoadReport('Акт сверки',       //-- Название отчета; метка *NO_TRANSLATE*
            'AktSverki.xls',  //-- Название шаблона
            230,          //-- Длинна отчета в пикселах (форма)
            150,          //-- Номер отчета пользователя
            2,            //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
            false,        //-- Отображать строку с номером отчета Да/Нет
            true,         //-- Отображать строку с датой(диапазоном) отчета Да/Нет
            true          //-- Отображать строку с организацией Да/Нет
            );
end;

procedure TMainForm.N29Click(Sender: TObject);
begin
  inherited;
  if not IsAllFormsClosed then Exit;
  qOrg.Close;
  try
    TLanguageForm.Create(Self).ShowModal;
  finally
    qOrg.Open;
    Init_MainOrg;
    SetCaption(MAIN_ORG.NAME);
    RefreshMatherializedViews;
  end;

end;

procedure TMainForm.SetCaption(AOrgName: String);
begin
  Caption := FMainCaption +' '+ Version.FileVersion +'  '+
                '[' +frmStart.OraSession1.Server+']'+'  '+MAIN_ORG.NAME
end;

function TMainForm.IsAllFormsClosed: boolean;
var
  n: Integer;
begin
  if (Screen.FormCount > 1)
    then if MessageBox(Self.Handle,PChar(TranslateText('Необходимо закрыть все окна. Закрыть?')),'',
      MB_YESNO or MB_ICONQUESTION) = mrNo then
  begin
    Result := False;
    Exit;
  end;

  for n:= 0 to Screen.CustomFormCount-1 do
   if Screen.Forms[n].Name <>'MainForm'
     then Screen.Forms[n].Close;
  Result := True;       
end;

procedure TMainForm.miSynchroClick(Sender: TObject);
var F: TSynchroForm;
begin
  F:=TSynchroForm.Create(nil);
  try
    F.Caption := TMenuItem(Sender).Caption;
    if pos('AUTO',UpperCase(TMenuItem(Sender).Name))>0 then
      F.TableName := 'OIL_AUTO'
    else if pos('ORG',UpperCase(TMenuItem(Sender).Name))>0 then
      F.TableName := 'OIL_ORG'
    else if pos('EMPLOY',UpperCase(TMenuItem(Sender).Name))>0 then
      F.TableName := 'OIL_EMPLOY';
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  inherited;
  CheckupStatus.TestTablesChecksum;
end;

procedure TMainForm.ServerSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  Txt : String;  
begin
  inherited;
  Txt := Socket.ReceiveText;
  if Pos('**CLOSE**', Txt ) > 0 then
  begin
    IsAdminClose := True;
    Close;
  end
  else ShowMessage(Txt);
end;

procedure TMainForm.miChangeOrgNameDualClick(Sender: TObject);
var
  res:integer;
begin
  res:=ChangeOrg2Dual;
  if( res>0 )then
  begin
    Init_MainOrg();
    SetCaption(MAIN_ORG.Name);
    try
      RefreshMatherializedViews;
      startlog(TranslateText('материализированные представления обновлены'));
    except
      on E: Exception do begin
        startlog(TranslateText('ошибка обновления материализированных обновлений')+#13#10+E.Message,true);
      end;
    end;
    ShowMessage(TranslateText('Были подменены реквизиты организации с ID=')+IntToStr(res)+'.'+#13#10
      +TranslateText('Подробнее смотрите в Start.log.'));
  end;
end;

procedure PrepareTranslateText;
var FNua, FNru: string;
begin
    // пути файлов для TranslateText
    FNua:=GetMainDir+'Language\ua_msg.ini';
    FNru:=GetMainDir+'Language\ru_msg.ini';
    if FileExists(FNua) and  FileExists(FNru)
     then
      begin
        // StringLists для работы TranslateText
        SLua:=TStringList.Create;
        SLru:=TStringList.Create;
        // загружаем из файлов данные
        SLua.Clear; SLua.LoadFromFile(FNua);
        SLru.Clear; SLru.LoadFromFile(FNru);
        // проверка на одинаковый размер
        if SLru.Count <> SLua.Count
         then TRANSLATE:=true;
      end
     else TRANSLATE:=true;
end;
//==============================================================================
procedure TMainForm.N130Click(Sender: TObject);
var
  PrintCardPinCode: TPrintCardPinCodeForm;
begin

  if GetSQLValueParSimple('select count(*) from all_tables '
    +' where owner = :card_user'
    +'   and table_name in (''ECFIL012'', ''ECFIL108'')',
    ['card_user',AdmSettings.Get('CARD_USER')]) <> 2 then
  begin
    MessageDlg(TranslateText('Не обнаружены необходимые таблицы в Петроле!!!') + #10#13 +
      TranslateText('Возможно у Вас нет Петрола.'), mtInformation, [mbOk], 0);
    exit;
  end;
  PrintCardPinCode := TPrintCardPinCodeForm.Create(Application);
  PrintCardPinCode.FormStyle := fsMDIChild;
  DoMDIButton(PrintCardPinCode);
end;
//==============================================================================
procedure TMainForm.nOilTestClick(Sender: TObject);
{$IFDEF TESTING}
var
  F: TfrmOilTest;
begin
  If ShowExistentForm('OilTest') then
    Exit;
  F := TfrmOilTest.Create(Application);
  DoMDIButton(F);
end;
{$ELSE}
begin
end;
{$ENDIF}

//==============================================================================
procedure TMainForm.nRefreshTalonAEClick(Sender: TObject);
// Пересчёт талонов по межфилиальным перемещениям
const
  RunOper = '  Запуск пересчёта талонов по межфилиальным перемещениям';
  NextOper = '  Можно строить филиальный пакет по талонам начиная с ';
  ErrorOper = '  Ошибка при запуске пересчёта талонов по межфилиальным перемещениям: ';
begin
  if MessageDlg(TranslateText(RunOper) + TranslateText('. Продолжить?'), mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;
  try
    StartLog(TranslateText(RunOper));
    LoadExeSql(OraScriptTalon.Sql);

    OraScriptTalon.Execute;

    StartLog(TranslateText(NextOper) + DateToStr(now));
    MessageDlg(TranslateText(NextOper) + DateToStr(now), mtInformation, [mbOk], 0);
  except on E: Exception do
    begin
      StartLog(TranslateText(ErrorOper) + E.Message, true);
      MessageDlg(TranslateText(ErrorOper) + E.Message, mtError, [mbOk], 0);
    end;
  end;
end;
//==============================================================================
procedure TMainForm.OraScriptTalonError(Sender: TObject; E: Exception;
  SQL: String; var Action: TErrorAction);
begin
  StartLog('    '+ trim(E.Message));
  Action := eaContinue;
end;
//==============================================================================

procedure TMainForm.Ngksu_optClick(Sender: TObject);
begin
 LoadReport(decode([LANG_INTERFACE,0,'Отчёт для ГКСУ - опт',   //-- Название отчета; метка *NO_TRANSLATE*
                                     'Звіт для ДКСУ - опт']),  //-- Название отчета; метка *NO_TRANSLATE*
            'GKSUopt.xls',  //-- Название шаблона
            200,            //-- Длинна отчета в пикселах (форма)
            117,            //-- Номер отчета пользователя
            2,              //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
            false,          //-- Отображать строку с номером отчета Да/Нет
            true,           //-- Отображать строку с датой(диапазоном) отчета Да/Нет
            true            //-- Отображать строку с организацией Да/Нет
            );
end;

procedure TMainForm.miChangeAzsParentClick(Sender: TObject);
var
  OrgChangeDetails :TOrgChangeDetails;
begin
  OrgChangeDetails := TOrgChangeDetails.Create(Self);
  DoMDIButton(OrgChangeDetails);
end;
//==============================================================================
procedure TMainForm.miSvodFilAZSClick(Sender: TObject);
begin
  LoadReport('Оперативный отчет для Авиаса', //-- Название отчета; метка *NO_TRANSLATE*
             'SvodFilAZS.xls', //-- Название шаблона
             110,              //-- Длинна отчета в пикселах (форма)
             118,              //-- Номер отчета пользователя
             1,                //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
             false,            //-- Отображать строку с номером отчета Да/Нет
             true,             //-- Отображать строку с датой(диапазоном) отчета Да/Нет
             false             //-- Отображать строку с организацией Да/Нет
             );
end;
//==============================================================================
procedure TMainForm.miSvodFilAZSNewClick(Sender: TObject);
begin
  LoadReport('Оперативный отчет для Авиаса (4 группы)', //-- Название отчета; метка *NO_TRANSLATE*
             'SvodFilAZSNew.xls', //-- Название шаблона
             180,              //-- Длинна отчета в пикселах (форма)
             119,              //-- Номер отчета пользователя
             2,                //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
             false,            //-- Отображать строку с номером отчета Да/Нет
             true,             //-- Отображать строку с датой(диапазоном) отчета Да/Нет
             LAUNCH_MODE = 'GREAT_OIL' //-- Отображать строку с организацией Да/Нет
             );
end;
//==============================================================================

procedure TMainForm.miSvodFilAZS6NPGClick(Sender: TObject);
begin
  LoadReport('Оперативный отчет для Авиаса (6 групп)', //-- Название отчета; метка *NO_TRANSLATE*
             'SvodFilAZSFull.xls', //-- Название шаблона
             180,              //-- Длинна отчета в пикселах (форма)
             119,              //-- Номер отчета пользователя
             2,                //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
             false,            //-- Отображать строку с номером отчета Да/Нет
             true,             //-- Отображать строку с датой(диапазоном) отчета Да/Нет
             LAUNCH_MODE = 'GREAT_OIL' //-- Отображать строку с организацией Да/Нет
             );
end;

procedure TMainForm.miImportCashTanClick(Sender: TObject);
var
  ImportCashtanForm: TImportCashtanForm;
begin
  inherited;
  ImportCashtanForm := TImportCashtanForm.Create(Self);
  try
    ImportCashtanForm.ShowModal;
  finally
    ImportCashtanForm.Free;
  end;
end;

procedure TMainForm.miParseExcelTestClick(Sender: TObject);
{$IFDEF TESTING}
begin
  If ShowExistentForm('ParseExcelTestForm') then
    Exit;
  ParseExcelTestForm := TParseExcelTestForm.Create(Application);
  try
    DoMDIButton(ParseExcelTestForm);
    ParseExcelTestForm.ShowModal;
  finally
    ParseExcelTestForm.Free;
  end;
end;
{$ELSE}
begin
end;
{$ENDIF}

procedure TMainForm.miNpPriceRefClick(Sender: TObject);
Var
  Form : TNpPriceRefForm;
begin
  Form := TNpPriceRefForm.Create(Application);
  Form.FormStyle := fsMDIChild;
  DoMDIButton(Form);
end;

procedure TMainForm.miBasicElectronFormReportClick(Sender: TObject);
begin
  inherited;
  if mrYes = MessageDlg('Для построения данного отчета должен быть открыт шаблон для ввода.'+#13#10+' Он открыт?',
    mtConfirmation,mbYesNoCancel,0)
  then
    LoadReport('Оперативный отчет для Авиаса (универсальный)', //-- Название отчета; метка *NO_TRANSLATE*
             '', //-- Название шаблона
             300,              //-- Длинна отчета в пикселах (форма)
             120,              //-- Номер отчета пользователя
             2,                //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
             false,            //-- Отображать строку с номером отчета Да/Нет
             true,             //-- Отображать строку с датой(диапазоном) отчета Да/Нет
             true //-- Отображать строку с организацией Да/Нет
             );
end;

procedure TMainForm.ToolButton2Click(Sender: TObject);
var
  F: TRezervImageForm;
  h: THandle;
  rect: TRect;
begin
  h := FindWindow('Shell_TrayWnd', nil);
  GetWindowRect(h, rect);

  F := TRezervImageForm.Create(Application);
  F.UseAzsChoose := False;

  if ReadOilVar('BASE_INST') = 'Y' then
    F.ChartMode := cmBaseOut
  else
    F.ChartMode := cmBase;
  F.BaseId := INST;

  F.Constraints.MinHeight := F.Height - (rect.Bottom - rect.Top);
  F.Constraints.MaxHeight := F.Height - (rect.Bottom - rect.Top);
  F.Constraints.MinWidth  := F.Width;
  F.Constraints.MaxWidth  := F.Width;
  F.WindowState := wsMaximized;
  F.Top := 0;
  F.ShowModal;
  F.Free;

  // якщо це Ойл який працює з Бейсом, то закрити його
  if ReadOilVar('BASE_INST') = 'Y' then
    ToolButton5.Click;
end;

procedure TMainForm.miMeteringRefClick(Sender: TObject);
var
  MeteringRefForm:TMeteringRefForm;
begin
  MeteringRefForm := TMeteringRefForm.Create(Application);
  MeteringRefForm.deBeginDate.Date := Date()-3;
  MeteringRefForm.deEndDate.Date := Date();
  MeteringRefForm.FormStyle := fsMDIChild;
  DoMDIButton(MeteringRefForm);
end;

procedure TMainForm.miRezMeasureRefClick(Sender: TObject);
begin
  GetRefByClass('TRezMeasureRefForm');
end;

procedure TMainForm.BaseDocsRefClick(Sender: TObject);
begin
  GetRefByClass('TBaseDocsRefForm');
end;

procedure TMainForm.miTubesClick(Sender: TObject);
var
  F: TTubesForm;
begin
  F := TTubesForm.Create(Application);
  if F.rgNpType <> nil then
    F.Show;
end;

procedure TMainForm.BaseTovarOperRefClick(Sender: TObject);
begin
  GetRefByClass('TBaseTovarOperRefForm');
end;

procedure TMainForm.miRepDeficitClick(Sender: TObject);
begin
  GetRefByClass('TBaseRepDeficitForm');
end;

procedure TMainForm.miRezRashBaseClick(Sender: TObject);
begin
  GetRefByClass('TRezRashBaseForm');
end;

procedure TMainForm.miRezPrihBaseClick(Sender: TObject);
begin
  GetRefByClass('TRezPrihBaseForm');
end;

procedure TMainForm.miAzsNpPriceRefClick(Sender: TObject);
var
  Form : TNpPriceDocRefForm;
begin
  inherited;
  Form := TNpPriceDocRefForm.Create(Application);
  Form.FormStyle := fsMDIChild;
  DoMDIButton(Form);
end;

End.
