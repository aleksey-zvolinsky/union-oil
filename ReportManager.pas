unit ReportManager;

interface

uses
  Base, Menus, Db, DBTables, Grids, DBGrids, StdCtrls,
  ToolEdit, Mask, RXCtrls,ComObj,Excel8TLB, RXSplit,TalonPotrReport,
  RXDBCtrl,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, ComCtrls, UIdListsClass, DateUtils,
  ActiveX, OleCtrls, RxLookup, CurrEdit, uCommonForm,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess, uHelpButton{$IFDEF VER150},Variants{$ENDIF}, uImportFunc;

type
  TCompare = (GREATER_THAN, EQUAL_TO, LESS_THAN);
  TOrgType = (otPPON, otAZS, otNb, otClient, otDep);
  TDateType = (dtNil, dtNone, dtDateOn, dtBetweenDates);


  TRepManagerForm = class(TCommonForm)
    Panel1: TPanel;
    bbPrint: TBitBtn;
    BitBtn1: TBitBtn;
    Date_NB: TNotebook;
    From_Date2: TDateEdit;
    Label1: TLabel;
    From_date1: TDateEdit;
    Label2: TLabel;
    Panel2: TPanel;
    Num_Edit: TEdit;
    Label4: TLabel;
    Param_NB: TNotebook;
    Org_Panel: TPanel;
    lblOrg: TLabel;
    ceOrg: TComboEdit;
    Label3: TLabel;
    To_date2: TDateEdit;
    RG: TRadioGroup;
    GroupBox1: TGroupBox;
    CB1: TCheckBox;
    CB2: TCheckBox;
    CB3: TCheckBox;
    CB4: TCheckBox;
    CB5: TCheckBox;
    CheckBox5: TCheckBox;
    SpeedButton1: TSpeedButton;
    Label6: TLabel;
    sbClearOper: TSpeedButton;
    edOper: TComboEdit;
    lOrg: TLabel;
    Label10: TLabel;
    sbClearOper2: TSpeedButton;
    lOrg_RS: TLabel;
    lMFO: TLabel;
    bClearOrg: TSpeedButton;
    edOrg: TComboEdit;
    edOper2: TComboEdit;
    edOrg_RS: TEdit;
    edOrg_MFO: TEdit;
    GBsum2: TGroupBox;
    RBsum1: TRadioButton;
    RBsum2: TRadioButton;
    SpeedButton2: TSpeedButton;
    EdOper3: TComboEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label9: TLabel;
    DERepCom2: TDateEdit;
    cbNoPart: TCheckBox;
    l114_AZS: TLabel;
    ce114_AZSName: TComboEdit;
    rg114_AllOrOne: TRadioGroup;
    cb114_Commission: TCheckBox;
    cb114_Stored: TCheckBox;
    cb114_Own: TCheckBox;
    rg114_Measurement: TRadioGroup;
    rg114_Cost: TRadioGroup;
    SpeedButton9: TSpeedButton;
    CheckList1: TRxCheckListBox;
    SpeedButton3: TSpeedButton;
    RadioButton3: TRadioButton;
    gb102_Payment: TGroupBox;
    cb102_Commission: TCheckBox;
    cb102_Own: TCheckBox;
    cb102_Other: TCheckBox;
    l102_Warning: TLabel;
    CheckList2: TRxCheckListBox;
    gb104_Units: TGroupBox;
    cb104_ton: TCheckBox;
    cb104_Litre: TCheckBox;
    cb104_Money: TCheckBox;
    gb104_Operation: TGroupBox;
    cb104_Cash: TCheckBox;
    cb104_Payroll: TCheckBox;
    cb104_Other: TCheckBox;
    gb104_Coupon: TGroupBox;
    l104_Unite: TLabel;
    cb104_Coupon: TCheckBox;
    cb104_Unite: TCheckBox;
    bb104_Other: TBitBtn;
    lPay_OperationType: TLabel;
    sb112_ClearOperation: TSpeedButton;
    cePay_OperationType: TComboEdit;
    rgPay_GroupBy: TRadioGroup;
    bb112_Operation: TBitBtn;
    gb112_Payment: TGroupBox;
    cb112_Commission: TCheckBox;
    cb112_Own: TCheckBox;
    cb112_Other: TCheckBox;
    rg105_Price: TRadioGroup;
    cb105_TF: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    GroupBox2: TGroupBox;
    RPart: TRadioButton;
    Rnp: TRadioButton;
    RWithout: TRadioButton;
    CheckItogo: TCheckBox;
    cb110_RestSpecify: TCheckBox;
    gb110_OwnGoods: TGroupBox;
    cb110_Commission: TCheckBox;
    cb110_Own: TCheckBox;
    cb110_Other: TCheckBox;
    gb110_List: TGroupBox;
    l110_Organization: TLabel;
    l110_Part: TLabel;
    Bevel3: TBevel;
    cb110_Organization: TCheckBox;
    bb110_Organization: TBitBtn;
    cb110_Part: TCheckBox;
    bb110_Part: TBitBtn;
    cb109_RestSpecify: TCheckBox;
    gb109_Years: TGroupBox;
    cb109_CurrentYear: TCheckBox;
    cb109_LastYear: TCheckBox;
    cb109_PrecedingYears: TCheckBox;
    gb109_OwnGoods: TGroupBox;
    cb109_Commission: TCheckBox;
    cb109_Own: TCheckBox;
    cb109_Other: TCheckBox;
    gb109_List: TGroupBox;
    l109_Organization: TLabel;
    l109_Part: TLabel;
    Bevel2: TBevel;
    cb109_Organization: TCheckBox;
    bb109_Organization: TBitBtn;
    cb109_Part: TCheckBox;
    bb109_Part: TBitBtn;
    rg103_From: TRadioGroup;
    rg103_Own: TRadioGroup;
    Label8: TLabel;
    DERepCom1: TDateEdit;
    RG107_From: TRadioGroup;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CB6: TCheckBox;
    CheckList: TRadioGroup;
    lPart: TLabel;
    Label11: TLabel;
    CBPartAll: TCheckBox;
    edNP: TRxLookupEdit;
    CBNpAll: TCheckBox;
    edPart: TComboEdit;
    Label12: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    edOper4: TComboEdit;
    QNp: TOilQuery;
    QNpID: TFloatField;
    QNpNAME: TStringField;
    DSNp: TOraDataSource;
    GroupBox3: TGroupBox;
    CBownSb1: TCheckBox;
    CBownSb2: TCheckBox;
    RGownprice: TRadioGroup;
    cb106_Exchange: TCheckBox;
    cb106_TF: TCheckBox;
    GroupBox4: TGroupBox;
    cb104_Commission: TCheckBox;
    cb104_Own: TCheckBox;
    cb104_Store: TCheckBox;
    gb113_Payment: TGroupBox;
    cb113_Commission: TCheckBox;
    cb113_Own: TCheckBox;
    cb113_TF: TCheckBox;
    CBDelta: TCheckBox;
    gb101_OwnGoods: TGroupBox;
    cb101_Commission: TCheckBox;
    cb101_Own: TCheckBox;
    cb101_Other: TCheckBox;
    gb101_Cpecify: TGroupBox;
    cb101_payment: TCheckBox;
    cb101_Operation: TCheckBox;
    cb101_TF: TCheckBox;
    gb101_List: TGroupBox;
    l101_Organization: TLabel;
    l101_Part: TLabel;
    Bevel1: TBevel;
    cb101_Organization: TCheckBox;
    bb101_Organization: TBitBtn;
    cb101_Part: TCheckBox;
    bb101_Part: TBitBtn;
    cb100_Money: TCheckBox;
    rg100_OwnGoods: TRadioGroup;
    rg100_Talon: TRadioGroup;
    CB100_Maslo: TCheckBox;
    cb116_ShowDep: TCheckBox;
    gb002_OwnGoods: TGroupBox;
    Bevel4: TBevel;
    cb002_Commission: TCheckBox;
    cb002_Own: TCheckBox;
    cb002_WithoutTalon: TCheckBox;
    gb002_NoItalic: TGroupBox;
    Bevel5: TBevel;
    cb002_NoPS: TCheckBox;
    cb002_NoTF: TCheckBox;
    cb002_NoTalon: TCheckBox;
    cb002_Cash: TCheckBox;
    gb002_SubTotal: TGroupBox;
    cb002_Part: TCheckBox;
    cb002_Oil: TCheckBox;
    cb002_PS: TCheckBox;
    cb002_TF: TCheckBox;
    Panel3: TPanel;
    Panel4: TPanel;
    cb009_OGItogi: TCheckBox;
    Panel5: TPanel;
    cb009_Shtuki: TCheckBox;
    cb009_Measure: TCheckBox;
    Label7: TLabel;
    sb6_NpGroup: TSpeedButton;
    Panel6: TPanel;
    Label14: TLabel;
    SpeedButton7: TSpeedButton;
    Label13: TLabel;
    sb103_NpGroup: TSpeedButton;
    GroupBox5: TGroupBox;
    Label15: TLabel;
    sb104_NpGroup: TSpeedButton;
    cb104_Spis: TCheckBox;
    gb100_Post: TGroupBox;
    cb100_Alfa: TCheckBox;
    cb100_NkAlfa: TCheckBox;
    cb109_Podr: TCheckBox;
    cb100_IR: TCheckBox;
    ce100_days: TRxCalcEdit;
    Label16: TLabel;
    Label17: TLabel;
    cb116_UnionProchie: TCheckBox;
    cb150_RightPart: TCheckBox;
    GroupBox6: TGroupBox;
    cb150_Comission: TCheckBox;
    cb150_Own: TCheckBox;
    cb150_Store: TCheckBox;
    rep6cbSS: TCheckBox;
    cb116_ShowDog: TCheckBox;
    lDateS: TLabel;
    rg100_OpNb: TRadioGroup;
    cb116_ShowLS: TCheckBox;
    Panel7: TPanel;
    Panel8: TPanel;
    lnpg119: TLabel;
    sb119NpGroup: TSpeedButton;
    lnpgCount119: TLabel;
    lazs119: TLabel;
    sb119AZS: TSpeedButton;
    lazsCount119: TLabel;
    cb119ColVisible: TCheckBox;
    pnlHelp119: TPanel;
    pnlRep_Deb116: TPanel;
    hbRep_Deb116: TOilHelpButton;
    hbOperative_Avias: TOilHelpButton;
    cbxOhneKommision: TCheckBox;
    cb110_Podr: TCheckBox;
    pnl120: TPanel;
    lbl120DefineAzs: TLabel;
    sb120DefineAzs: TSpeedButton;
    sb120DefineNp: TSpeedButton;
    lbl120DefineNp: TLabel;
    lbl120DefineNb: TLabel;
    sb120DefineNb: TSpeedButton;
    sb120DefineOper: TSpeedButton;
    lbl120DefineOper: TLabel;
    le120DefinedExcel: TLabeledEdit;
    procedure Num_EditKeyPress(Sender: TObject; var Key: Char);
    procedure ceOrgButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbPrintClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbClearOperClick(Sender: TObject);
    procedure edOperButtonClick(Sender: TObject);
    procedure bClearOrgClick(Sender: TObject);
    procedure sbClearOper2Click(Sender: TObject);
    procedure edOrgButtonClick(Sender: TObject);
    procedure cePay_OperationTypeButtonClick(Sender: TObject);
    procedure ce114_AZSNameButtonClick(Sender: TObject);
    procedure rg114_AllOrOneClick(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure bb104_OtherClick(Sender: TObject);
    procedure cb104_OtherClick(Sender: TObject);
    procedure cb104_CouponClick(Sender: TObject);
    procedure CBownSb2Click(Sender: TObject);
    procedure sb112_ClearOperationClick(Sender: TObject);
    procedure bb112_OperationClick(Sender: TObject);
    procedure RPartClick(Sender: TObject);
    procedure RWithoutClick(Sender: TObject);
    procedure RnpClick(Sender: TObject);
    procedure rg100_OwnGoodsClick(Sender: TObject);
    procedure cb101_GoodsClick(Sender: TObject);
    procedure cb101_OrganizationClick(Sender: TObject);
    procedure bb101_OrganizationClick(Sender: TObject);
    procedure cb101_PartClick(Sender: TObject);
    procedure bb101_PartClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure edPartButtonClick(Sender: TObject);
    procedure CBPartAllClick(Sender: TObject);
    procedure CBNpAllClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure cb002_OwnClick(Sender: TObject);
    procedure cb002_WithoutTalonClick(Sender: TObject);
    procedure sb6_NpGroupClick(Sender: TObject);
    procedure cb100_AlfaClick(Sender: TObject);
    procedure cb100_NkAlfaClick(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure cb116_ShowDogClick(Sender: TObject);
    procedure sb119NpGroupClick(Sender: TObject);
    procedure sb119AZSClick(Sender: TObject);
    procedure rb119_npgClick(Sender: TObject);
    procedure ceOrgChange(Sender: TObject);
    procedure sb120DefineAzsClick(Sender: TObject);
    procedure sb120DefineNpClick(Sender: TObject);
    procedure sb120DefineNbClick(Sender: TObject);
    procedure sb120DefineOperClick(Sender: TObject);
    procedure From_Date2Change(Sender: TObject);
  private
    FIXLSApp: Excel8TLB._Application;
    FList, FXLApp: Variant;
    FParseExcel: TParseExcel;
    FOrgType: integer;
    FOrgId: integer;
    FOrgInst: integer;
    FOrgID_Num: string;
    FDateType: TDateType;
    procedure CreateExcel (NewInstance: boolean);
    procedure ShowExcel;
    procedure HideExcel;
    procedure ReleaseExcel;
    procedure HighlightLabel(List: string; Llb: TLabel; cmp: TCompare; count: integer);
    function AddWorkbook(const WorkbookName: string): Excel8TLB._Workbook;
    function Get119MaxNpg: integer;
    function Get119MaxAzs: integer;
    function GetAZSList119: string;
    function GetActivePage: integer;
    procedure SetOrgCaption(ot: TOrgType);

    procedure InitShow;
    procedure InitCreate;
    procedure Test;
    procedure Print;
    function GetDateFrom: TDateTime;
    function GetDateOn: TDateTime;
    function GetDateTo: TDateTime;
    procedure SetOrg;
    procedure SetOrgId(const Value: integer);
    procedure SetOrgInst(const Value: integer);
    procedure SetDateType(const Value: TDateType);
    procedure SetActivePage(const Value: integer);
    procedure SetDateFrom(const Value: TDateTime);
    procedure SetDateOn(const Value: TDateTime);
    procedure SetDateTo(const Value: TDateTime);
  public
    OrgIDazs, OrgINSTazs, Opr_id: integer;

    OrgSQL, OrgSQL2: string;
    ReportCaption: string;
    Pattern: string;
    OperList: string;
    GroupIdList: TGroupIdList;
    NpList, NpList119, AZSList119: string;
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(RCaption, RPattern: string; RHeight, RepNum, DateCol: Integer;
      NumbT, DateT, OrgT: boolean); overload; 
    property IXLSApp: Excel8TLB._Application read FIXLSApp;
    property ActivePage: integer read GetActivePage write SetActivePage;
    property DateType: TDateType read FDateType write SetDateType;
    property DateFrom: TDateTime read GetDateFrom write SetDateFrom;
    property DateTo: TDateTime read GetDateTo write SetDateTo;
    property DateOn: TDateTime read GetDateOn write SetDateOn;
    property OrgId: integer read FOrgId write SetOrgId;
    property OrgInst: integer read FOrgInst write SetOrgInst;
    property OrgType: integer read FOrgType write FOrgType;
    property OrgID_Num: string read FOrgID_Num write FOrgID_Num;
  end;

var
  OrgType, OrgID, OrgINST : integer;
  OrgID_Num : string;



procedure InitNpGroupButton(p_SB:TSpeedButton; p_List:string);
procedure NpListMenuClick(p_IdList: TGroupIdList; p_Num: integer; p_Sb: TSpeedButton; p_DopObject: TObject = nil);
procedure LoadReport(RCaption, RPattern: string; RHeight, RepNum, DateCol: Integer;
  NumbT, DateT, OrgT: boolean);

implementation

{$R *.DFM}

USES
  Progr,Main,OperTypeRef, RashVedom,
  Rep_OutAZS, Rep_GKSU, Rep_SvodFilAZS,
  Rep_KomNB,Rep_UdWeig,Rep_MoveKomT,OperSelect,
  Rep_s, Udbplan, PartRezLeftRep,ListSelect,
  ChooseOrg, uDbFunc, Rep_regionrest, Rep_Debit, PrihCardRef, TransferReport,
  PartRef, ExFunc, ExcelFunc, ParseExcelTest;

type
  TDepSet = set of 100..115;

const
  cDepSet: TDepSet = [100, 101, 103..110, 112..114, 116, 117, 118, 119];
  cDepTFSet: TDepSet = [105, 106, 114];
  REPORTLOGFILE = 'reports.log';
  OrgTypeNameArray: array [low(TOrgType)..high(TOrgType)] of string =
    ('ППОН :', 'АЗС :', 'Нефтебаза :', 'Клиент :', 'Подразделение :');

Var
  SF: TOperSelectForm;
  operstr:string;
  nplistpointer: ^string;

procedure TRepManagerForm.Num_EditKeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in ['0'..'9',#8] ) then key:=#0;
end;

procedure TRepManagerForm.ceOrgButtonClick(Sender: TObject);
const
  eOrgType = 'Отчет создается только для "Облуправления" или "ППОН"';
Var
  NewType: Integer;
  vName: string;
  cbTemp: TCheckBox;
begin

  case ActivePage of
    5:
    begin
      if CheckBox5.Checked and ChooseOrg.CaptureOrg(1,Inst,Inst,'yyyyynnn',FOrgId,FOrgInst,vName) or
         not CheckBox5.Checked and ChooseOrg.CaptureOrg(2,Inst,Inst,'yyynnynn',FOrgId,FOrgInst,vName)
      then
        SetOrg;
    end;

    1:
    begin
      if CheckBox1.Checked and ChooseOrg.CaptureOrg(1,Inst,Inst,'yyyyynnn',FOrgId,FOrgInst,vName) or
         not CheckBox1.Checked and ChooseOrg.CaptureOrg(2,Inst,Inst,'yyynnynn',FOrgId,FOrgInst,vName)
      then
        SetOrg;
    end;

    10:
    begin
      if ChooseOrg.CaptureOrg(2,Inst,Inst,'yyyyyynn',FOrgId,FOrgInst,vName) then
      Begin
        SetOrg;
      End;
    end;
    
    111:
    begin
      if ChooseOrg.CaptureOrg(1,Inst,Inst,'yyyyyynn',FOrgId,FOrgInst,vName) then
        SetOrg;
    end;
    
    102:
    begin
      if (ChooseOrg.CaptureOrg(4,OrgId,OrgInst,'yyy',FOrgId,FOrgInst,vName)) then
        SetOrg;
    end;
    
    115:
    begin
      OrgId := MAIN_ID;
      OrgInst := INST;
      OrgSQL := '(id<>inst)';
      if CheckBox3.Checked then
        ChooseOrg.CaptureOrg(1,OrgId,OrgInst,'yyy',FOrgId,FOrgInst,vName)
      else
        ChooseOrg.CaptureOrg(2,OrgId,OrgInst,'yyy',FOrgId,FOrgInst,vName);
      SetOrg;
    end;
    
    else
    begin
      if (ActivePage in cDepSet) then
      begin
        if (ChooseOrg.CaptureOrgT(1,OrgId,OrgInst,'yyy',FOrgId,FOrgInst,vName,NewType)) and
           (NewType in [3,4,5])
        then
        begin
          SetOrg;
          cbTemp := TCheckBox.Create(Org_Panel);
          try
            case ActivePage of
              101: cbTemp:=cb101_TF;
              105: cbTemp:=cb105_TF;
              106: cbTemp:=cb106_TF;
              113: cbTemp:=cb113_TF;
            end; // case active of
            cbTemp.Visible := OrgType = 4;
            cbTemp.Checked := False;
          finally // try case ...
            cbTemp:=nil;
            cbTemp.Free;
          end; // finally  try
        end
        else
          Raise Exception.Create(eOrgType);
      end
      else if ChooseOrg.CaptureOrg(1,Inst,Inst,'yyy',FOrgId,FOrgInst,vName) then
        SetOrg;
    end;
  end;  // case Active of
end;

procedure InitNpGroupButton(p_SB:TSpeedButton; p_List:string);
begin
  if p_List<>'' then
  begin
    p_SB.Down := TRUE;
    p_SB.Hint := GetNameList(p_List, 'oil_np_group');
  end;
end;

procedure NpListMenuClick(p_IdList: TGroupIdList; p_Num: integer; p_Sb: TSpeedButton; p_DopObject: TObject = nil);
begin
  nplistpointer^ := p_IdList[p_Num].CommaList;
  p_Sb.Hint := p_IdList.NameList[p_Num];
  p_Sb.Down := TRUE;
end;

procedure LoadReport(RCaption, RPattern: string; RHeight, RepNum, DateCol: Integer;
  NumbT, DateT, OrgT: boolean);
var
  RM:TRepManagerForm;
begin
  if RepNum in [101,109,110,105,106,103,107,108] then
    if RevealNonSynchroPart(2) then
      Exit;

  RM := TRepManagerForm.Create(RCaption, RPattern, RHeight, RepNum, DateCol,
    NumbT, DateT, OrgT);
  try
    RM.ShowModal;
  finally
    RM.Free;
  end;
End;

procedure TRepManagerForm.FormCreate(Sender: TObject);
begin
  inherited;
  InitCreate;
end;

procedure TRepManagerForm.FormShow(Sender: TObject);
begin
  InitShow;  
end;

//==============================================================================
//======================= START EXCEL OPERATIONS ===============================
//==============================================================================
procedure TRepManagerForm.CreateExcel(NewInstance: boolean);
var
  IU: IUnknown;
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

procedure TRepManagerForm.ShowExcel;
begin
  if Assigned(IXLSApp) then begin
    IXLSApp.Visible[0] := true;
    if IXLSApp.WindowState[0] = TOLEEnum(Excel8TLB.xlMinimized) then
      IXLSApp.WindowState[0] := TOLEEnum(Excel8TLB.xlNormal);
    IXLSApp.ScreenUpdating[0] := true;
    IXLSApp.CutCopyMode[0] := 0;  // звільняємо ексель від копіпаста
    IXLSApp.Calculation[0] := xlAutomatic;
  end;
end;

function TRepManagerForm.AddWorkbook(const WorkbookName: string): Excel8TLB._Workbook;
begin
  Result := nil;
  if Assigned(FIXLSApp) and (trim(WorkbookName) <> '') then begin
    Result := FIXLSApp.Workbooks.Add(WorkbookName, 0);
  end;
end;

procedure TRepManagerForm.HideExcel;
begin
  if Assigned(IXLSApp) then begin
    IXLSApp.Visible[0] := false;
  end;
end;

procedure TRepManagerForm.ReleaseExcel;
begin
  if Assigned(IXLSApp) then begin
    // если есть книга и мы невидимы
    if (IXLSApp.Workbooks.Count > 0) and (not IXLSApp.Visible[0]) then begin
      IXLSApp.WindowState[0] := TOLEEnum(xlMinimized);
      IXLSApp.Calculation[0] := xlAutomatic;
      IXLSApp.Visible[0] := true;
      if not(csDestroying in ComponentState) then Self.SetFocus; // а это объяснять необходимо?
      Application.BringToFront;
    end;
  end;
  FIXLSApp := nil;
end;

procedure TRepManagerForm.HighlightLabel(List: string; Llb: TLabel; cmp: TCompare; count: integer);
var
  MustHighlighted: boolean;
  SL: TStringList;
begin
  SL := TStringList.Create;
  try
    SL.Delimiter := ',';
    SL.DelimitedText := List;
    Llb.Caption := IntToStr(SL.Count);
    MustHighlighted := false;

    case cmp of
      GREATER_THAN : MustHighlighted := not (count >= SL.Count);
      EQUAL_TO     : MustHighlighted := not (count  = SL.Count);
      LESS_THAN    : MustHighlighted := not (count <= SL.Count);
    end;

    if MustHighlighted then
      begin
        Llb.Font.Style := [fsBold];
        Llb.Font.Color := clRed;
      end
    else
      begin
        Llb.Font.Style := [];
        Llb.Font.Color := clWindowText;
      end;
  finally
    SL.Free;
  end;
end;

//==============================================================================
//======================== END EXCEL OPERATIONS ================================
//==============================================================================

procedure TRepManagerForm.bbPrintClick(Sender: TObject);
begin
  Print;
end;

procedure TRepManagerForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
  try
    HideExcel;
    ReleaseExcel;
  finally
    DefineRepDates(0,0);
    Action:=caFree;
    sf.free;
  end;
  except on e:exception do
    ShowMessage(e.Message);
  end;
end;
//===================================================
//============ NEW USER FUNCTION ====================
//===================================================
procedure TRepManagerForm.Test;
var
  de: TDateEdit;
  SL: TStringList;
begin

  if date_nb.visible then
  begin

    if date_nb.ActivePage='Date_1' then
      if from_date1.date = 0 then
        Raise Exception.Create(TranslateText('Не определен дата отчета !'));

    if date_nb.ActivePage = 'Date_2' then
    begin
      if (from_date2.date = 0) or (to_date2.date=0) then
        Raise Exception.Create(TranslateText('Не полностью задан диапозон !'));
      if (from_date2.date > to_date2.date) then
        Raise Exception.Create(TranslateText('Не корректно определен диапозон !'));
      DefineRepDates(0,to_date2.Date);
    end;
    
  end;
    
  if org_panel.Visible then
    if ceOrg.text='' then
      Raise Exception.Create(TranslateText('Не определена организация !'));


  case ActivePage of
    104:
    begin
      if ( not cb104_Commission.checked
          and not cb104_Own.checked and not cb104_Store.checked )
      then
        raise Exception.Create(TranslateText(' Необходимо указать тип товара '));
    end;

    112:
    begin
      if cePay_OperationType.text='' then
        Raise Exception.Create(TranslateText('Параметр "Операция" не определен !'));
    end;

    11:
    Begin
      if (not CBPartAll.Checked) and (edPart.Text='') then
        Raise Exception.Create(TranslateText('Не выбрана партия!!!'));

      if (not SpeedButton5.Down) and (edOper4.Text='') then
        Raise Exception.Create(TranslateText('Не выбрана операция!!!'));
    End;

    107,108:
    begin
      if ActivePage = 107 then
        de := Derepcom1
      else
        de := Derepcom2;
      if de.Date > From_date2.Date then
        raise Exception.Create(TranslateText('Дата сверки должна быть меньше даты начала периода !'));
    end;

    119, 120:
    begin
      if Self.To_date2.Date < Self.From_date2.Date then
        Raise Exception.Create(TranslateText('Не верно введен период!'));

      if Self.To_date2.Date - Self.From_date2.Date > 30 then
        Raise Exception.Create(TranslateText('Период должен быть не более 30-ти дней!'));

      if ActivePage = 119 then
      begin
        SL := TStringList.Create;
        try
          SL.Delimiter := ',';
          SL.DelimitedText := NpList119;
          if SL.Count <> Get119MaxNpg then
            Raise Exception.CreateFmt(TranslateText('Необходимо выбрать %d группы нефтепродуктов!'),[Get119MaxNpg]);
        finally
          SL.Free;
        end;

        SL := TStringList.Create;
        try
          SL.Delimiter := ',';
          SL.DelimitedText := AZSList119;
          if SL.Count > Get119MaxAzs then
            Raise Exception.CreateFmt(TranslateText('Можно выбрать максимум %d АЗС-ок!'),[Get119MaxAzs]);
        finally
          SL.Free;
        end;
      end;
    end;


    ELSE
    begin
      if (ActivePage in cDbt_PageList) then
        pDbt_CheckSelect;
    end;
  end;  // case ActivePage of
end;

//===================================================
//===================================================
//===================================================

procedure TRepManagerForm.CheckBox3Click(Sender: TObject);
begin
  if Checkbox3.checked then
  begin
    SetOrgCaption(otPPON);
    OrgID:=-1;OrgInst:=-1;
    ceOrg.text:='';
    OrgSQL:=' org_id in ('+inttostr(oilbase)+','+inttostr(obl)+')';
  end
  else
  begin
    SetOrgCaption(otAZS);
    OrgID:=-1;OrgInst:=-1;
    ceOrg.text:='';
    OrgSQL:=' org_id='+inttostr(azs);
  end;
end;

procedure TRepManagerForm.CheckBox5Click(Sender: TObject);
begin
  if checkbox5.checked then
  begin
    SetOrgCaption(otPPON);
    OrgID:=-1;OrgInst:=-1;
    ceOrg.text:='';
    OrgSQL:=' org_id in ('+inttostr(oilbase)+','+inttostr(obl)+')';
  end
  else
  begin
    SetOrgCaption(otAZS);
    OrgID:=-1;OrgInst:=-1;
    ceOrg.text:='';
    OrgSQL:=' org_id='+inttostr(azs);
  end;
end;

procedure TRepManagerForm.SpeedButton1Click(Sender: TObject);
var
  i:integer;
  s:string;
begin
  sf.showmodal;
  operstr:='';s:='(';
  sf.q.first;
  for i:=0 to SF.CL1.items.count-1 do
  begin
    if SF.CL1.Checked[i]=true then
    begin
      operstr:=operstr+s+sf.q.fieldbyname('id').asstring;
      s:=','
    end;
    sf.q.next;
  end;
  operstr:=operstr+')';
end;

procedure TRepManagerForm.sbClearOperClick(Sender: TObject);
begin
  edOper.Clear;
  edOper2.Clear;
  edOper3.Clear;
end;

procedure TRepManagerForm.edOperButtonClick(Sender: TObject);
Var
  OperTypeRefForm : TOperTypeRefForm;
begin
  Application.CreateForm(TOperTypeRefForm, OperTypeRefForm);
  try
    if ActivePage = 11 then
    Begin
      OperTypeRefForm.SGrpId := 9;
      OperTypeRefForm.bbClear.Enabled:=false;
    End;
    OperTypeRefForm.ShowModal;
    If OperTypeRefForm.ModalResult = mrOk Then
    Begin
      edOper.Text := OperTypeRefForm.qName.AsString;
      edOper.Tag  := OperTypeRefForm.qId.AsInteger;
      edOper2.Text := OperTypeRefForm.qName.AsString;
      opr_id:=OperTypeRefForm.qId.AsInteger;
      edOper2.Tag  := OperTypeRefForm.qId.AsInteger;
      edOper3.Text := OperTypeRefForm.qName.AsString;
      edOper3.Tag  := OperTypeRefForm.qId.AsInteger;
      edOper4.Text := OperTypeRefForm.qName.AsString;
      edOper4.Tag  := OperTypeRefForm.qId.AsInteger;
    End;
  finally
    OperTypeRefForm.Free;
  end;
end;

procedure TRepManagerForm.bClearOrgClick(Sender: TObject);
begin
  edOrg.Clear;
end;

procedure TRepManagerForm.sbClearOper2Click(Sender: TObject);
begin
  edOper2.Clear;
end;

procedure TRepManagerForm.edOrgButtonClick(Sender: TObject);
Var
  Q : TOilQuery;
  NewId, NewInst : Integer;
  vName: string;
begin
  if ChooseOrg.CaptureOrgExt(3,Inst,Inst,'yyy',NewId,NewInst,vName,Q) then
  Begin
    edOrg.Text := vName;
    edOrg.Tag  := NewId;
    lOrg.tag   := NewInst;
    If Q.FieldByName('Rek_Id').AsString = '' Then
    Begin
      edOrg_RS.Tag   := 0;
      lOrg_RS.Tag    := 0;
      edOrg_RS.Text  := '';
      edOrg_MFO.Text := '';
    End
    Else
    Begin
      edOrg_RS.Tag   := Q.FieldByName('Rek_Id').AsInteger;
      lOrg_RS.Tag    := Q.FieldByName('Rek_Inst').AsInteger;
      edOrg_RS.Text  := Q.FieldByName('RACH_CHET').AsString;
      edOrg_MFO.Text := Q.FieldByName('MFO').AsString;
    End;
  End
end;

procedure TRepManagerForm.cePay_OperationTypeButtonClick(Sender: TObject);
var
  OperF: TOperTypeRefForm;
begin
  if (Length(vOperList)>0) then
    bb112_Operation.Click
  else
  begin
    OperF := TOperTypeRefForm.Create(Application);
    try
      OperF.sgrpId:=OpG_OPLATA;
      OperF.ShowModal;
      if OperF.ModalResult=MrOk then
      begin
        cePay_OperationType.text:=OperF.q.fieldbyname('name').asstring;
        vOperList:=OperF.q.fieldbyname('id').AsString;
      end;
    finally
      OperF.free;
    end;
  end; 
end;

procedure TRepManagerForm.ce114_AZSNameButtonClick(Sender: TObject);
var
  vName: string;
  Qcc: TOilQuery;
begin
  try
    Qcc:=TOilQuery.Create(Param_NB);
    if not(ChooseOrg.CaptureOrgExt(2,OrgId,OrgInst,'nnn', OrgIdAZS,OrgInstAZS,vName,Qcc)) then
      rg114_AllOrOne.ItemIndex:=0
    else
    begin
      if (Qcc.FieldByName('par').AsInteger<>OrgId) then
       // чужая АЗС
      begin
        rg114_AllOrOne.ItemIndex:=0;
        Raise Exception.Create(TranslateText('Выбранная АЗС не принадлежит ')+ceOrg.Text);
      end;
      ce114_AZSName.Text:=vName;
      rg114_AllOrOne.ItemIndex:=1;
    end;
  finally
    Qcc.Free;
  end;
end;

procedure TRepManagerForm.rg114_AllOrOneClick(Sender: TObject);
begin
 case rg114_AllOrOne.ItemIndex of
   0: // по всем АЗС
   begin
     ce114_AZSName.Clear;
     OrgIdAZS:=0;
     OrgInstAZS:=0;
   end; // 0:
   1: // по выбраной, если не выбрана - выбрать
     if (ce114_AZSName.Text='') then
       ce114_AZSNameButtonClick(ce114_AZSName);
  end; // case rg114_AllOrOne.ItemIndex of
end;

procedure TRepManagerForm.SpeedButton9Click(Sender: TObject);
var
  LSF:TListSelectForm;
begin
  inherited;
  if SpeedButton9.Down then
  begin
    SpeedButton9.Hint:=TranslateText('Выбран список операций');
    Application.CreateForm(TListSelectForm,LSF);
    Lsf.TableName:='oil_oper_type';
    Lsf.HasInst:=false;
    if LSF.ShowModal = mrOk then
      OperList:=LSF.List
    else
    begin
      SpeedButton9.Down:=false;
      SpeedButton9.Hint:=TranslateText('Выбрать операции списком');
      OperList:='';
    end;
    LSF.Free;
  end
  else
  begin
    SpeedButton9.Hint:=TranslateText('Выбрать операции списком');
    OperList:='';
  end;
end;

procedure TRepManagerForm.SpeedButton3Click(Sender: TObject);
var
  LSF:TListSelectForm;
begin
  inherited;
  if SpeedButton3.Down then
  begin
    SpeedButton3.Hint:=TranslateText('Выбран список операций');
    Application.CreateForm(TListSelectForm,LSF);
    Lsf.TableName:='oil_oper_type';
    Lsf.HasInst:=false;
    if LSF.ShowModal = mrOk then
      OperList:=LSF.List
    else
    begin
      SpeedButton3.Down:=false;
      SpeedButton3.Hint:=TranslateText('Выбрать операции списком');
      OperList:='';
    end;
    LSF.Free;
  end
  else
  begin
    SpeedButton3.Hint:=TranslateText('Выбрать операции списком');
    OperList:='';
  end;
end;

procedure TRepManagerForm.bb104_OtherClick(Sender: TObject);
begin
  // выбрать все группы операций
  SetOperListPeram(0);
  OperList:=DualListSelect(DBPlan.qOperList,vOperList);
end;

procedure TRepManagerForm.cb104_OtherClick(Sender: TObject);
begin
  vOperList:='';
  bb104_Other.Enabled:=cb104_Other.Checked;
end;

procedure TRepManagerForm.cb104_CouponClick(Sender: TObject);
begin
  if (not cb104_Coupon.Checked) then
    cb104_Unite.Checked:=cb104_Coupon.Checked;
  cb104_Unite.Enabled:=cb104_Coupon.Checked;
  l104_Unite.Enabled:=cb104_Coupon.Checked;
end;

procedure TRepManagerForm.CBownSb2Click(Sender: TObject);
begin
  if (not CBownSb2.Checked) then
    cb106_Exchange.Checked:=CBownSb2.Checked;
  cb106_Exchange.Enabled:=CBownSb2.Checked;
end;

procedure TRepManagerForm.sb112_ClearOperationClick(Sender: TObject);
begin
  vOperList:='';
  cePay_OperationType.Clear;
end;

procedure TRepManagerForm.bb112_OperationClick(Sender: TObject);
const
  cMultiSelect = 'Выбрано несколько значений';
var
  NewList: string;
begin
  // выбрать операций группы Оплата
  SetOperListPeram(11);
  NewList:=DualListSelect(DBPlan.qOperList,vOperList);
  if (CompareStr(vOperList,NewList)<>0) then
   if (Length(NewList)>0) then
    cePay_OperationType.Text:=cMultiSelect
    else cePay_OperationType.Clear;
  vOperList:=NewList;
end;

procedure TRepManagerForm.RPartClick(Sender: TObject);
begin
  CheckItogo.Enabled:=true;
end;

procedure TRepManagerForm.RWithoutClick(Sender: TObject);
begin
  CheckItogo.Enabled:=false;
  CheckItogo.Checked:=false;
end;

procedure TRepManagerForm.RnpClick(Sender: TObject);
begin
  CheckItogo.Enabled:=true;
end;

procedure TRepManagerForm.rg100_OwnGoodsClick(Sender: TObject);
begin
  rg100_Talon.Enabled:=rg100_OwnGoods.ItemIndex=0;
  if (not rg100_Talon.Enabled) then
    rg100_Talon.ItemIndex:=0;
end;

procedure TRepManagerForm.cb101_GoodsClick(Sender: TObject);
begin
  pDbt_cbGoodsClick;
end;

procedure TRepManagerForm.cb101_OrganizationClick(Sender: TObject);
begin
  pDbt_cbOrganizationClick;
end;

procedure TRepManagerForm.bb101_OrganizationClick(Sender: TObject);
begin
  pDbt_bbOrganizationClick(Self);
end;

procedure TRepManagerForm.cb101_PartClick(Sender: TObject);
begin
  pDbt_cbPartClick;
end;

procedure TRepManagerForm.bb101_PartClick(Sender: TObject);
begin
  pDbt_bbPartClick(Self);
end;

procedure TRepManagerForm.CheckBox1Click(Sender: TObject);
begin
  if checkbox1.checked then
  begin
    SetOrgCaption(otPPON);
    OrgID:=-1;OrgInst:=-1;
    ceOrg.text:='';
    OrgSQL:=' org_id in ('+inttostr(oilbase)+','+inttostr(obl)+')';
  end
  else
  begin
    SetOrgCaption(otAZS);
    OrgID:=-1;OrgInst:=-1;
    ceOrg.text:='';
    OrgSQL:=' org_id='+inttostr(azs);
  end
end;

procedure TRepManagerForm.edPartButtonClick(Sender: TObject);
var
  Part:TPartRefForm;
begin
  Application.CreateForm(TPartRefForm,Part);
  try
    if Part.ShowModal = mrOk then
    begin
      if not (Part.q.eof) then
      begin
        edPart.Tag:=Part.q.fieldbyname('id').AsInteger;
        lPart.Tag :=Part.q.fieldbyname('inst').AsInteger;
        edPart.Text:=Part.q.fieldbyname('dog').asstring;
      end;
    end;
  finally
    part.free;
  end;
end;

procedure TRepManagerForm.CBPartAllClick(Sender: TObject);
begin
  if CBPartAll.Checked then
  begin
    edPart.Enabled:=False;
    edPart.Text:='';
    CBNpAll.Enabled:=True;
    if not CBNpAll.Checked then
    begin
      edNP.Enabled:=True;
      edNP.Text:=QNpName.AsString;
    end;
  end
  else
  begin
    edPart.Enabled:=True;
    edPart.Text:='';
    CBNpAll.Enabled:=False;
    edNP.Enabled:=False;
    edNP.Text:='';
  end;
end;

procedure TRepManagerForm.CBNpAllClick(Sender: TObject);
begin
  if CBNpAll.Checked
  then
  begin
    edNP.Enabled:=False;
    edNP.Text:='';
  end
  else
  begin
    edNP.Enabled:=True;
    edNP.Text:=QNpName.AsString;
  end;
end;

procedure TRepManagerForm.SpeedButton5Click(Sender: TObject);
var
  LSF:TListSelectForm;
begin
  inherited;
  if SpeedButton5.Down then
  begin
    SpeedButton5.Hint:=TranslateText('Выбран список операций');
    Application.CreateForm(TListSelectForm,LSF);
    Lsf.TableName:='oil_oper_type';
    Lsf.AddCondition := 'grp = 9';
    Lsf.HasInst:=false;
    if LSF.ShowModal = mrOk then
      OperList:=LSF.List
    else
    begin
      SpeedButton5.Down:=false;
      SpeedButton5.Hint:=TranslateText('Выбрать операции списком');
      OperList:='';
    end;
    LSF.Free;
  end
  else
  begin
    SpeedButton5.Hint:=TranslateText('Выбрать операции списком');
    OperList:='';
  end;
end;

procedure TRepManagerForm.cb002_OwnClick(Sender: TObject);
begin
  cb002_WithoutTalon.Enabled:=cb002_Own.Checked;
  cb002_WithoutTalon.Checked:=not cb002_Own.Checked;
end;

procedure TRepManagerForm.cb002_WithoutTalonClick(Sender: TObject);
begin
  cb002_NoTalon.Enabled:=cb002_WithoutTalon.Enabled and
                         not cb002_WithoutTalon.Checked;
  cb002_NoTalon.Checked:=True;
end;

procedure TRepManagerForm.sb6_NpGroupClick(Sender: TObject);
var
  F: TListSelectForm;
begin
  if (Sender as TSpeedButton).Down then
  begin
     Application.CreateForm(TListSelectForm,F);
     try
       F.TableName:='OIL_NP_GROUP';
       F.HasInst:=FALSE;
       F.List:=NpList;
       F.ShowModal;
       if F.ModalResult=mrOk then
       begin
          NpList:=F.GetIdList;
          (Sender as TSpeedButton).Hint:=F.GetNameList;
       end
       else
         (Sender as TSpeedButton).Down:=FALSE;
     finally
       F.Free;
     end;
  end
  else
  begin
     NpList:='';
     (Sender as TSpeedButton).Hint:=TranslateText('Все');
  end;
end;

procedure TRepManagerForm.cb100_AlfaClick(Sender: TObject);
begin
  if not cb100_Alfa.Checked and not cb100_NkAlfa.Checked then
      cb100_NkAlfa.Checked:=TRUE;
end;

procedure TRepManagerForm.cb100_NkAlfaClick(Sender: TObject);
begin
  if not cb100_Alfa.Checked and not cb100_NkAlfa.Checked then
      cb100_Alfa.Checked:=TRUE;
end;

procedure TRepManagerForm.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  ce100_days.SetFocus;
end;

procedure TRepManagerForm.cb116_ShowDogClick(Sender: TObject);
begin
  lDateS.Visible := cb116_ShowDog.Checked;
  pnlRep_Deb116.Visible := cb116_ShowDog.Checked;
end;

procedure TRepManagerForm.sb119NpGroupClick(Sender: TObject);
var
  F: TListSelectForm;
begin
  if (Sender as TSpeedButton).Down then
  begin
    Application.CreateForm(TListSelectForm, F);
    F.TableName := 'OIL_NP_GROUP';
    F.HasInst := FALSE;
    F.List := NpList119;
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      NpList119 := F.GetIdList;
      (Sender as TSpeedButton).Hint := F.GetNameList;
    end
    else (Sender as TSpeedButton).Down := FALSE;
    F.Free;
  end
  else
  begin
    NpList119 := '';
    (Sender as TSpeedButton).Hint := TranslateText('Все');
  end;
  // позначаємо наш вибір
  HighlightLabel(NpList119, lnpgCount119, EQUAL_TO, Get119MaxNpg);
end;

procedure TRepManagerForm.sb119AZSClick(Sender: TObject);
var
  F: TListSelectForm;
begin
  if (Sender as TSpeedButton).Down then
  begin
    Application.CreateForm(TListSelectForm, F);
    try
      F.TableName := 'V_OIL_AZS';
      F.AddCondition := 'OBL_ID= '+ IntToStr(OrgId);
      F.Order := 'decode(sign(instr(name,''АГЗС'')+instr(name,''АЗС'')),1,50,100),'+
                 'decode(sign(instr(name,''АГЗС'')),1,75,0),'+
                 'lpad(azs_num,4,''0''),id';
      F.HasInst := FALSE;
      F.List := AZSList119;
      F.ShowModal;
      if F.ModalResult = mrOk then
      begin
        AZSList119 := F.GetIdList;
        (Sender as TSpeedButton).Hint := F.GetNameList;
      end
      else (Sender as TSpeedButton).Down := FALSE;
    finally
      F.Free;
    end;
  end
  else
  begin
    AZSList119 := '';
    (Sender as TSpeedButton).Hint := TranslateText('Все');
  end;
  // позначаємо наш вибір
  HighlightLabel(AZSList119, lazsCount119, GREATER_THAN, Get119MaxAzs);
end;

function TRepManagerForm.Get119MaxNpg: integer;
begin
  if Pattern = 'SvodFilAZSNew.xls' then
    Result := 4
  else if Pattern = 'SvodFilAZSFull.xls' then
    Result := 6
  else
    Raise Exception.Create('Get119MaxNpg: Не верно определен шаблон!');
end;

function TRepManagerForm.Get119MaxAzs: integer;
begin
  if Pattern = 'SvodFilAZSNew.xls' then
    Result := 35
  else if Pattern = 'SvodFilAZSFull.xls' then
    Result := 35
  else
    Raise Exception.Create('Get119MaxAzs: Не верно определен шаблон!');
end;

function TRepManagerForm.GetAZSList119: string;
var
  AZSList119: string;
begin
  with DBPlan do
  begin
    if qAZS.Active then qAZS.Close;
    _OpenQueryPar(qAZS,
      ['obl_id', OrgId]);
    while not qAzs.Eof do
    begin
      AZSList119 := AZSList119 + qAZS.FieldByName('id').AsString;
      qAzs.Next;
      if not qAZS.Eof then
        AZSList119 := AZSList119 + ',';
    end;
    qAZS.Close;
  end;
  Result := AZSList119;
end;

procedure TRepManagerForm.rb119_npgClick(Sender: TObject);
begin
  inherited;
  HighlightLabel(NpList119, lnpgCount119, EQUAL_TO, Get119MaxNpg);
end;

procedure TRepManagerForm.ceOrgChange(Sender: TObject);
begin
  inherited;
  if ActivePage = 119 then
  begin
    AZSList119 := GetAZSList119;
    HighlightLabel(AZSList119, lazsCount119, GREATER_THAN, Get119MaxAzs);
  end;
end;

function TRepManagerForm.GetActivePage: integer;
begin
  Result := StrToInt(Param_Nb.Activepage);
end;

procedure TRepManagerForm.InitShow;
var
  SL: TStringList;
  BookName: string;
begin
  nplistpointer := @NpList;
  Caption := Caption + ReportCaption;
  //------------------- User Function -------------------------------
  if (Date_NB.ActivePage = 'Date_1') then
    From_Date1.Date:=Date
  else
    SetCurrentMonth(From_Date2,To_Date2);

  //-----------------------------------------------------------------
  case ActivePage of
    1:
    begin
      SetOrgCaption(otAZS);
      OrgSQL := ' org_id='+inttostr(azs);
    end;
    
    5:
    begin
      SetOrgCaption(otAZS);
      OrgSQL := ' org_id='+inttostr(azs);
      OrgId := INST;
      OrgInst := INST;
    end;

    6:
    begin
      SetOrgCaption(otNb);
      OrgSQL:=' (org_id='+inttostr(OilBase)+' or org_id='+inttostr(Obl)+')';
      OrgId   := Inst;
      OrgInst := Inst;
      From_Date2.Date:=Now-1;
      GroupIdList := TGroupIdList.Create('NPGG_COMMON');
      PopupMenu := TPopupMenu.Create(Self);
      GroupIdList.MakeMenu(sb6_NpGroup,PopupMenu,NpListMenuClick,0);
    end;

    7,8:
    begin
      SetOrgCaption(otNb);
      OrgSQL:=' (org_id='+inttostr(OilBase)+' or org_id='+inttostr(Obl)+')';
      OrgId   := Inst;
      OrgInst := Inst;
      From_Date2.Date := Date - 30;
      if ActivePage = 8 then
        To_Date2.Date := Date;
    end;

    9:
    begin
      SetOrgCaption(otNb);
      OrgSQL := ' (org_id='+inttostr(OilBase)+' or org_id='+inttostr(Obl)+')';
      From_Date1.Date := Date;
      OrgId   := Inst;
      OrgInst := Inst;
    end;

    10:
    begin
      SetOrgCaption(otAZS);
      OrgSQL:=' org_id='+inttostr(azs);
      From_Date2.Date := Date - 30;
      To_Date2.Date   := Date;
    end;

    11:
    begin
      OrgId   := Inst;
      OrgInst := Inst;
      qNP.Open;
      edOper4.Text := TranslateText('Переброска (с карточки на карточку)');
      edOper4.Tag := 18;
    end;

    102:
    begin
      SetOrgCaption(otClient);
      OrgId:=MAIN_ID;
      OrgInst:=INST;
      OrgSQL:='(id<>inst)';
    end;

    115:
    begin
      SetOrgCaption(otPPON);
      OrgId:=MAIN_ID;
      OrgInst:=INST;
      ceOrg.Text := GetOrgName(OrgId,OrgInst);
      OrgSQL:='(id<>inst)';
    end;

    116:
    begin
      if (VarToStr(ReadOilVar('CARD_LS_ENABLE')) = 'Y') then
        cb116_ShowLS.Checked := true;
    end;

    120:
    begin
      OrgId := MAIN_ID;
      OrgInst := INST;
      FindExcelSheet('АЗС нпр', FXLApp, FList, BookName);
      StateExcel(FXLApp, False);
      le120DefinedExcel.Text := BookName;
      SL := TStringList.Create;
      try
        FParseExcel := TParseExcel.Create;
        FParseExcel.List := FList;
        FParseExcel.Range[peoHorizontal] := 'A3:CL3';
        FParseExcel.Range[peoVertical] := 'A1:C5000';
        FXLApp.CutCopyMode := False;
      finally
        StateExcel(FXLApp, True);
        SL.Free;
      end;
      sb120DefineAzs.Down := DefineAZS(True, FParseExcel);
      sb120DefineNp.Down := DefineNp(True, FParseExcel);
      sb120DefineNb.Down := DefineNb(True, FParseExcel, nil);
      sb120DefineOper.Down := DefineOper(True, FParseExcel, nil);
    end;
    ELSE
    begin
      if (ActivePage in cDepSet) then
      begin
        vOperList:='';
        if ActivePage <> 117 then
          SetOrgCaption(otDep);
        OrgId := MAIN_ID;
        OrgInst := INST;
        if (3 = OrgType) and  //3 - нафтобаза
           (0 = GetSqlValueParSimple('select count(*) from adm_possible_inst where to_char(inst)<>poss_inst and inst=:inst',
                                     ['inst',INST]))
        then
          ceOrg.Enabled:=False;

        case ActivePage of
          100:
            To_date2.Date := Date - 1;  //Today - 1
          101:
          begin
            pDbt_SetElements(cb101_Commission,cb101_Own,cb101_Other,
                             cb101_Organization,cb101_Part,
                             bb101_Organization,bb101_Part,
                             l101_Organization,l101_Part);
            cb101_TF.Visible:=ceOrg.Enabled;
          end;
          103:
          begin
            GroupIdList:=TGroupIdList.Create('NPGG_COMMON');
            PopupMenu:=TPopupMenu.Create(Self);
            GroupIdList.MakeMenu(sb103_NpGroup,PopupMenu,NpListMenuClick,0);
          end;
          104:
          begin
            GroupIdList:=TGroupIdList.Create('NPGG_AZSREAL');
            PopupMenu:=TPopupMenu.Create(Self);
            GroupIdList.MakeMenu(sb104_NpGroup,PopupMenu,NpListMenuClick,0);
          end;
          105:
            cb105_TF.Visible := ceOrg.Enabled;
          106:
            cb106_TF.Visible := ceOrg.Enabled;
          109:
          begin
            pDbt_SetElements(cb109_Commission,cb109_Own,cb109_Other,
              cb109_Organization,cb109_Part,
              bb109_Organization,bb109_Part,
              l109_Organization,l109_Part);
           {cb109_Organization.enabled:=false;}
          end;
          110:
          begin
            pDbt_SetElements(cb110_Commission,cb110_Own,cb110_Other,
                            cb110_Organization,cb110_Part,
                            bb110_Organization,bb110_Part,
                            l110_Organization,l110_Part);
            {cb110_Organization.enabled:=false;}
          end;
          113:
            cb113_TF.Visible := ceOrg.Enabled;
          114:
            rg114_AllOrOne.ItemIndex := 0;
          118:
            From_date2.Date := StartOfTheMonth(Date);
          119:
          begin
            From_date2.Date := StartOfTheMonth(Date);
            To_date2.Date := Date;
            pnlHelp119.Visible := True;

            lnpgCount119.Caption := '';
            lazsCount119.Caption := '0';
            // позначаємо наш вибір
            HighlightLabel(NpList119, lnpgCount119, EQUAL_TO, Get119MaxNpg);
            HighlightLabel(AZSList119, lazsCount119, GREATER_THAN, Get119MaxAzs);
          end;
        end; // case ActivePage of

        OrgSQL:=' (org_id='+inttostr(OilBase)+' or org_id='+inttostr(Obl)+')';
      end;  
    end;
  end; // case ActivePage of
end;

procedure TRepManagerForm.InitCreate;
begin
  operstr := '()';
  SF := TOperSelectForm.Create(Application);
  SF.Q.Close;
  SF.Q.SQL.Text := 'select * from v_oil_oper_type order by name';
  SF.Q.Open;
  while not sf.q.Eof do
  begin
    SF.CL1.Items.add(SF.q.fieldbyname('name').asstring);
    SF.q.next;
  end;
  OrgSQL:='';
  NpList := ReadOilVar('NP_FUEL');
  if AdmSettings.Exist('NpList119')then
    NpList119 := AdmSettings.Get('NpList119')
  else
    NpList119 := ReadOilVar('NPGG_FUELONLY');
  AZSList119 := GetAZSList119;
end;

procedure TRepManagerForm.Print;
var
  IWorkbook: Excel8TLB._Workbook;
  ISheet: Excel8TLB._Worksheet;
  //IRange: Excel8TLB.Range;
  List: Variant;
  Progr: TProgrForm;
  start: TDateTime;
  IsPatternLoaded: Boolean;
  ds: TDataSet;
  function AddWorkbookLang(APattern:string): Excel8TLB._Workbook;
  var
    FileName, PathName:string;
  begin
    //Берем имя файла без расширения
    FileName := Copy(APattern,1,pos('.',APattern)-1);
    if LANGUAGE=1 then
      PathName := GetMainDir+'pattern\'+FileName+'_ukr.xls';
    if(LANGUAGE = 0)or not(FileExists(PathName))then
      PathName := GetMainDir+'pattern\'+FileName+'.xls';
    Result:=AddWorkbook(PathName);
  end;
begin
  ApplicationInfo.Action := Self.Caption;
{
*************************************************
* Стан бланків
* Начат 28.11.2008 11:29:02
*-----------------------------------------------*
* Запрос отработал за 13 сек.
* Открыто 2059 записей
* Вывод в Excel отработал за 2 сек.
* Средняя скорость вывода 740 зап/сек
*************************************************
}
  progr := TProgrForm.CreateBar(nil);
  try
    log(REPORTLOGFILE,'*************************************************');
    log(REPORTLOGFILE,'* '+Self.Caption);
    log(REPORTLOGFILE,TranslateText('* Начат ')+DateToStr(Date)+' '+TimeToStr(Time));
    log(REPORTLOGFILE,'*-----------------------------------------------*');
    start := Time;
    //--------------------- Блок проверок ------------------------
    if ActivePage = 100 then
      fRecalc;  //перерахунок для карток
    //------------- Проверки пользователя ------------------------
    Test;
    //------------------------------------------------------------
    try
      case ActivePage of
        11:
          MakeTransferReport(Self);

        116:
          ExtDebitors(From_Date1.Date, OrgId, Progr, cb116_ShowDep.Checked,
            cb116_UnionProchie.Checked, cb116_ShowDog.Checked, cb116_ShowLS.Checked);

        104:
          OutAZS(Self,Progr);//------ Отчет Реализация на АЗС

        101:
          Debitorka(Self,Progr);//------ Ведомость дебеторов

        109:
          Debitors(Self,Progr);//------ Ведомость дебеторов

        150:
          AktSverki(
            From_Date2.Date,To_Date2.Date,
            OrgId, OrgInst,
            cb150_RightPart.Checked, cb150_Comission.Checked,
            cb150_Own.Checked,cb150_Store.Checked
            );
        120:
        begin // Базовая электронная форма (универсальная)
          ReportBasicElectonFormCustom := TReportBasicElectonFormCustom.Create;
          try
            ReportBasicElectonFormCustom.DateBegin := Self.DateFrom;
            ReportBasicElectonFormCustom.DateEnd := Self.DateTo;
            ReportBasicElectonFormCustom.ParseExcel := FParseExcel;
            ReportBasicElectonFormCustom.List := FList;
            ReportBasicElectonFormCustom.XLApplication := FXLApp;

            ReportBasicElectonFormCustom.Progress := Progr;
            ReportBasicElectonFormCustom.DepId := OrgId;
            // Проставляем алиас согластно значения
            ds := FParseExcel.DistinctLists[peoVertical, 0];
            ds.First;
            While not ds.Eof do
            begin
              ds.Edit;
              ds.FieldByName('ALIAS').AsString := ds.FieldByName('VALUE').AsString;
              ds.Post;
              ds.Next;
            end;
            // Получаем список АЗС
            ReportBasicElectonFormCustom.AZSList := '0';
            ds := FParseExcel.DistinctLists[peoVertical, 1];
            ds.First;
            While not ds.Eof do
            begin
              if ds.FieldByName('ALIAS').AsString <> '' then
                ReportBasicElectonFormCustom.AZSList := ReportBasicElectonFormCustom.AZSList
                  + ',' + ds.FieldByName('ALIAS').AsString;
              ds.Next;
            end;
            // Берем список групп
            ReportBasicElectonFormCustom.NpList := '0';
            ds := FParseExcel.DistinctLists[peoVertical, 2];
            ds.First;
            While not ds.Eof do
            begin
              if ds.FieldByName('ALIAS').AsString <> '' then
                ReportBasicElectonFormCustom.NpList := ReportBasicElectonFormCustom.NpList
                  + ',' + ds.FieldByName('ALIAS').AsString;
              ds.Next;
            end;

            ReportBasicElectonFormCustom.GetReport(); // Сводный по филиалу в открытый Excel
          finally
            ReportBasicElectonFormCustom.Free;
          end;
        end;

        ELSE
        begin
          CreateExcel(false);
          //---------------- Load Pattern ----------------------
          if Assigned(IXLSApp) then
          begin
            IWorkbook := AddWorkbookLang(Pattern);
            try
              // чекаємо, поки шаблон завантажиться в Ексель
              repeat
                IsPatternLoaded := True;
                try

                  ISheet := IWorkbook.Worksheets.Item[1] as Excel8TLB._Worksheet;
                except on E:EOleException do
                  begin
                    IsPatternLoaded := False;
                    Sleep(3000);
                  end;
                end;
              until IsPatternLoaded;
              // Не менее просто у листа можно получить область по ее имени.
              //IRange := ISheet.Range['TestRange', EmptyParam];
              List := ISheet;
              HideExcel;

             //=================================================================
             //==================== CREATE REPORT ==============================
              case ActivePage of
                6:
                  KomisiaNB(Self,Progr,List,IWorkBook,ISheet);//----------- Отчет коммисионера по нефтебазе
                7:
                  SrUdWeig(Self,Progr,List,IWorkBook,ISheet);//------------ Отчет Средний удельный вес
                8:
                  MoveKomT(Self,Progr,List,IWorkBook,ISheet);//------------ Отчет Движение комисионного товара
                9:
                  DoPartRezLeftRep(From_Date1.Date,OrgId,OrgInst,ceOrg.Text,cb009_OGItogi.Checked,
                    cb009_Shtuki.Checked,cb009_Measure.Checked,List,Progr);//---- Остатки партий в резервуаре
                10:
                  DoRashVedomRep(Self,Progr,List);//--- Реализация по ведомостям
                100:
                begin
                  RegionRest(Self,Progr,IXLSApp,List); //--------------- Большой сводный отчет по остаткам и реализаци
                  ISheet := IWorkbook.Worksheets.Item[3] as Excel8TLB._Worksheet;
                  List:=ISheet;
                  RegionRest(Self,Progr,IXLSApp,List,3);  //------------ Сводный отчет по АЗС
                  ISheet := IWorkbook.Worksheets.Item[4] as Excel8TLB._Worksheet;
                  List:=ISheet;
                  ShowSprInfo(List);
                  ISheet := IWorkbook.Worksheets.Item[5] as Excel8TLB._Worksheet;
                  List:=ISheet;
                  RegionRestGaz(List,From_Date2.Date,To_Date2.Date,ce100_days.AsInteger);
                end;
                102:
                  ClientCard(Self,Progr,List); //------------ Карточка клиента
                110:
                  Creditors(Self,Progr,List);  // Ведомость кредиторов
                117:
                  GKSU_opt(Self,Progr,List);
                118:
                begin
                  RepSvodFilAZS := TRepSvodFilAZS.Create;
                  try
                    RepSvodFilAZS.Date := Self.From_date1.Date;
                    RepSvodFilAZS.List := List;
                    RepSvodFilAZS.Progress := Progr;
                    RepSvodFilAZS.ColVisible := true;
                    RepSvodFilAZS.GetReport(); // Сводный по филиалу
                  finally
                    RepSvodFilAZS.Free;
                  end;
                end;
                119:
                begin
                  RepSvodFilAZSNew := TRepSvodFilAZSNew.Create;
                  try
                    RepSvodFilAZSNew.DateBegin := Self.From_date2.Date;
                    RepSvodFilAZSNew.DateEnd := Self.To_date2.Date;
                    RepSvodFilAZSNew.List := List;
                    RepSvodFilAZSNew.NpList := NpList119;
                    AdmSettings.Save('NpList119',NpList119);
                    RepSvodFilAZSNew.AZSList := AZSList119;
                    RepSvodFilAZSNew.IXLSApp := IXLSApp;
                    RepSvodFilAZSNew.IWorkbook := IWorkbook;
                    RepSvodFilAZSNew.Progress := Progr;
                    RepSvodFilAZSNew.ColVisible := Self.cb119ColVisible.Checked;
                    RepSvodFilAZSNew.DepId := OrgId;
                    RepSvodFilAZSNew.GetReport(); // Сводный по филиалу
                  finally
                    RepSvodFilAZSNew.Free;
                  end;
                end;
              end;/// case ... of
           //=========================== END REPORT ==========================
           //=================================================================

              ShowExcel;
            finally
              //IRange := nil;
              ISheet := nil;
              IWorkbook := nil;
              List := unassigned;
            end;//try ... finally
          end; //if Assigned(IXLSApp)
        end;
      end; // case ActivePage of

      log(REPORTLOGFILE,TranslateText('* Отчет построился за ')+IntToStr(trunc((Time-start)*24*3600))+TranslateText(' сек.')
        +' В '+DateToStr(Date)+' '+TimeToStr(Time));      
      log(REPORTLOGFILE,'*************************************************');
      log(REPORTLOGFILE,'');
    Except On E:Exception Do
      begin
        if Assigned(progr) then
          Progr.free;
        HideExcel;
        MessageDlg(TranslateText('ОШИБКА : ')+E.message,mtError,[mbOk],0);
        ReleaseExcel;
      end;
    End;//try ... except
  finally
    Progr.Free;
    ApplicationInfo.Action := '';
  end; // try ... finally
end;

procedure TRepManagerForm.SetOrgCaption(ot: TOrgType);
begin
  lblOrg.Caption := OrgTypeNameArray[ot];
end;

procedure TRepManagerForm.sb120DefineAzsClick(Sender: TObject);
begin
  sb120DefineAzs.Down := DefineAZS(False, FParseExcel);
end;

procedure TRepManagerForm.sb120DefineNpClick(Sender: TObject);
begin
  sb120DefineNp.Down := DefineNp(False, FParseExcel);
end;

procedure TRepManagerForm.sb120DefineNbClick(Sender: TObject);
begin
  sb120DefineNb.Down := DefineNb(False, FParseExcel, nil);
end;

procedure TRepManagerForm.sb120DefineOperClick(Sender: TObject);
begin
  sb120DefineOper.Down := DefineOper(False, FParseExcel, nil);
end;

procedure TRepManagerForm.From_Date2Change(Sender: TObject);
var
  day, month, year: word;
  date1, date2: TDateTime;
begin
  DecodeDate(From_Date2.Date, Year, Month, Day);
  GetMonthLimits(month, year, date1, date2);
  if To_date2.Visible then
    To_date2.Date := date2;
end;

function TRepManagerForm.GetDateFrom: TDateTime;
begin
  Result := From_Date2.Date;
end;

function TRepManagerForm.GetDateOn: TDateTime;
begin
  Result := From_date1.Date;
end;

function TRepManagerForm.GetDateTo: TDateTime;
begin
  Result := To_date2.Date;
end;

procedure TRepManagerForm.SetOrgId(const Value: integer);
begin
  FOrgId := Value;
  SetOrg;
end;

procedure TRepManagerForm.SetOrgInst(const Value: integer);
begin
  FOrgInst := Value;
  SetOrg;
end;

procedure TRepManagerForm.SetOrg;
var
  q: TOilQuery;
begin
  q := TOilQuery.Create(nil);
  try
    GetOrgData(q, FOrgId, FOrgInst);
    ceOrg.Text := q.FieldByName('name').AsString;
    FOrgID_Num := q.fieldbyname('id_Num').AsString;
    FOrgType := q.FieldByName('org_id').AsInteger;
  finally
    q.Free;
  end;
end;

procedure TRepManagerForm.SetDateType(const Value: TDateType);
begin
  FDateType := Value;
  Date_NB.Visible := True;
  case FDateType of
    dtDateOn:
      Date_NB.ActivePage := 'Date_1';
    dtBetweenDates:
      Date_NB.ActivePage := 'Date_2';
    dtNone:
      Date_NB.Visible := False;
  end;
end;

procedure TRepManagerForm.SetActivePage(const Value: integer);
begin
  Param_Nb.Activepage := IntToStr(Value);
end;

procedure TRepManagerForm.SetDateFrom(const Value: TDateTime);
begin
  From_Date2.Date := Value;
end;

procedure TRepManagerForm.SetDateOn(const Value: TDateTime);
begin
  From_date1.Date := Value;
end;

procedure TRepManagerForm.SetDateTo(const Value: TDateTime);
begin
  To_date2.Date := Value;
end;

constructor TRepManagerForm.Create(RCaption, RPattern: string; RHeight,
  RepNum, DateCol: Integer; NumbT, DateT, OrgT: boolean);
begin
  Create(nil);
  Self.ReportCaption := RCaption;
  Self.Height := RHeight;
  Self.Pattern := RPattern;
  Self.Param_NB.ActivePage := inttostr(RepNum);
  Self.Panel2.Visible := NumbT;
  //---------------------------------
  Case DateCol of
    1:
      Self.DateType := dtDateOn;
    2:
      Self.DateType := dtBetweenDates;
  end;
  //---------------------------------
  if not DateT then
    Self.DateType := dtNone;
  Self.Org_Panel.Visible := OrgT;
end;

constructor TRepManagerForm.Create(AOwner: TComponent);
begin
  inherited;
end;

end.
