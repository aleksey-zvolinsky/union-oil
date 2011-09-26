unit SvodAzsPodpartReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, Db, DBTables, RxLookup, Buttons, ExtCtrls, DBAccess,
  uCommonForm, MemDS, Ora, uOilQuery;

type
  TSvodAzsPodpartReportForm = class(TCommonForm)
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CEPpon: TComboEdit;
    SpeedButton1: TSpeedButton;
    RGStoimost: TRadioGroup;
    GroupBox1: TGroupBox;
    RGSort: TRadioGroup;
    CBPartItogo: TCheckBox;
    q: TOilQuery;
    Panel1: TPanel;
    qGRP_ID: TFloatField;
    qGROUPNAME: TStringField;
    qNAME: TStringField;
    qDIM_NAME: TStringField;
    qTTN_ID: TFloatField;
    qTTN_INST: TFloatField;
    qID: TFloatField;
    qINST: TFloatField;
    qDOG: TStringField;
    qDOG_DATE: TDateTimeField;
    qSS: TFloatField;
    qBASE_: TFloatField;
    qNPTYPENAME: TStringField;
    qDIM_ID: TFloatField;
    qSUB_PART: TStringField;
    qRESTONBEGINTONN: TFloatField;
    qRESTONBEGINLITR: TFloatField;
    qRESTONBEGINSHT: TFloatField;
    qRESTONBEGINSS: TFloatField;
    qPRIHODTONN: TFloatField;
    qPRIHODLITR: TFloatField;
    qPRIHODSHT: TFloatField;
    qPRIHODST: TFloatField;
    qPRIHODSS: TFloatField;
    qNALTONN: TFloatField;
    qNALLITR: TFloatField;
    qNALSHT: TFloatField;
    qNALST: TFloatField;
    qNALSS: TFloatField;
    qTALONTONN: TFloatField;
    qTALONLITR: TFloatField;
    qTALONSHT: TFloatField;
    qTALONST: TFloatField;
    qTALONSS: TFloatField;
    qCARDTONN: TFloatField;
    qCARDLITR: TFloatField;
    qCARDSHT: TFloatField;
    qCARDST: TFloatField;
    qCARDSS: TFloatField;
    qBNALTONN: TFloatField;
    qBNALLITR: TFloatField;
    qBNALSHT: TFloatField;
    qBNALST: TFloatField;
    qBNALSS: TFloatField;
    qOWN_NEEDSTONN: TFloatField;
    qOWN_NEEDSLITR: TFloatField;
    qOWN_NEEDSSHT: TFloatField;
    qOWN_NEEDSST: TFloatField;
    qOWN_NEEDSSS: TFloatField;
    qNATURAL_LEAKTONN: TFloatField;
    qNATURAL_LEAKLITR: TFloatField;
    qNATURAL_LEAKSHT: TFloatField;
    qNATURAL_LEAKST: TFloatField;
    qNATURAL_LEAKSS: TFloatField;
    qOTHERTONN: TFloatField;
    qOTHERLITR: TFloatField;
    qOTHERSHT: TFloatField;
    qOTHERST: TFloatField;
    qOTHERSS: TFloatField;
    qSHORTAGETONN: TFloatField;
    qSHORTAGELITR: TFloatField;
    qSHORTAGESHT: TFloatField;
    qSHORTAGEST: TFloatField;
    qSHORTAGESS: TFloatField;
    qAVTOTONN: TFloatField;
    qAVTOLITR: TFloatField;
    qAVTOSHT: TFloatField;
    qAVTOST: TFloatField;
    qAVTOSS: TFloatField;
    qSETOFFCOMMUNTONN: TFloatField;
    qSETOFFCOMMUNLITR: TFloatField;
    qSETOFFCOMMUNSHT: TFloatField;
    qSETOFFCOMMUNST: TFloatField;
    qSETOFFCOMMUNSS: TFloatField;
    qSETOFFSECURTONN: TFloatField;
    qSETOFFSECURLITR: TFloatField;
    qSETOFFSECURSHT: TFloatField;
    qSETOFFSECURST: TFloatField;
    qSETOFFSECURSS: TFloatField;
    qB_PRICE: TFloatField;
    qE_PRICE: TFloatField;
    qRESTONBEGINST: TFloatField;
    qRASHTONN: TFloatField;
    qRASHLITR: TFloatField;
    qRASHSHT: TFloatField;
    qRASHST: TFloatField;
    qRESTONENDSHT: TFloatField;
    qRESTONENDTONN: TFloatField;
    qRESTONENDLITR: TFloatField;
    qRESTONENDST: TFloatField;
    qRESTONENDSS: TFloatField;
    qPEREOC: TFloatField;
    CBKom: TCheckBox;
    CBHr: TCheckBox;
    CBSob: TCheckBox;
    qRASHSS: TFloatField;
    BitBtn1: TBitBtn;
    btnOk: TBitBtn;
    procedure CEPponButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RGSortClick(Sender: TObject);
    procedure PrintReport(Date1, Date2: TDateTime;
      OrgId: integer;
      OrgName: string;
      kom, hr, sob: boolean;
      stoimost, gruppirovka: integer;
      PartItogo: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
  private
  public
  end;

var
  SvodAzsPodpartReportForm: TSvodAzsPodpartReportForm;

implementation

uses Main, ExFunc, Udbplan, Progr, ChooseOrg, UDbFunc;

{$R *.DFM}

//==============================================================================
procedure TSvodAzsPodpartReportForm.PrintReport(Date1, Date2: TDateTime;
  OrgId: integer;
  OrgName: string;
  kom, hr, sob: boolean;
  stoimost, gruppirovka: integer;
  PartItogo: Boolean);
const
  UCH_PRICE = 0;
  SELL_PRICE = 1;
  BYAZS = 0;
  BYPART = 1;
  FIRSTLINE = 14;
var
  QText, Fields, tail: string;
  Progr: TProgrForm;
  XLApp, List: Variant;
  //****************************************************************************
  procedure ActivateQ;
  begin
    with Q do
    begin
      if Active then Close;
      case gruppirovka of
        BYAZS: Sql.Add('order by groupname,name,nptypename,dog');
        BYPART: Sql.Add('order by groupname,dog,nptypename,name');
      end;
      ParamByName('orgid').Value := OrgId;
      ParamByName('BeginDate').AsDateTime := date1;
      ParamByName('EndDate').AsDateTime := date2;
      ParamByName('own1').Value := BoolTo_(kom, 'K', 'J');
      ParamByName('own2').Value := BoolTo_(sob, 'O', 'J');
      ParamByName('own3').Value := BoolTo_(hr, 'S', 'J');
      _OpenQuery(Q);
    end;
  end;
  //****************************************************************************
  procedure MakeHead;
  var
    s: string;
  begin
    PutTitle(List);
    List.Cells[5, 2] := OrgName;

    if Date1 = Date2 then List.Cells[6, 2] := DateToStr(Date1)
    else List.Cells[6, 2] := DateToStr(Date1) + ' - ' + DateToStr(Date2);

    s := '';
    if kom then s := TranslateText('комисси€');
    if hr then
    begin
      if kom then s := s + ',';
      s := s + TranslateText('хранение');
    end;
    if sob then
    begin
      if kom or hr then s := s + ',';
      s := s + TranslateText('собственный');
    end;
    List.Cells[7, 2] := s;
    case stoimost of
      UCH_PRICE: List.Cells[8, 2] := TranslateText('по учетной цене');
      SELL_PRICE: List.Cells[8, 2] := TranslateText('по продажной цене');
    end;
  end;
  //****************************************************************************
  procedure InitProgr;
  begin
    Application.CreateForm(TProgrForm, progr);
    Progr.Progress := 0;
    Progr.Show;
    Progr.Repaint;
  end;
  //****************************************************************************
begin
  QText := Q.Sql.Text;
  try
    InitProgr;
    ActivateQ;
    if Q.RecordCount = 0 then
      raise Exception.Create(TranslateText('ќтчет с данными параметрами не содержит данных'));

    Progr.Progress := 20;
    ActivateXLApp('SvodAzsPodpart', 'SvodAzsPodpart', 1, XLApp, List);
    MakeHead;

    case stoimost of
      UCH_PRICE: tail := 'Ss';
      SELL_PRICE: tail := 'St';
    end;

    Fields := 'NpTypeName:GroupName %2;';
    case gruppirovka of
      BYAZS:
        if PartItogo then Fields := 'GroupName %3;NpTypeName;Name %2&WW;Dog%1;'
        else Fields := 'GroupName %2;NpTypeName:GroupName;Name %1&WW;Dog;';
      BYPART: Fields := 'GroupName %2;NpTypeName;Name;Dog%1&WW;'
    end;

    Fields := Fields + 'Sub_Part;Dog_Date;Dim_Name;' +
      'RestOnBeginSht#H=+?;RestOnBeginLitr=+;RestOnBeginTonn=+;RestOnBegin' + tail + '=+;';
    case stoimost of
      UCH_PRICE:
        begin
          Fields := Fields + 'Ss;';
          List.Cells[FIRSTLINE - 1, 'L'] := TranslateText('по цене за т.');
        end;
      SELL_PRICE:
        begin
          Fields := Fields + 'B_price;';
          List.Cells[FIRSTLINE - 1, 'L'] := TranslateText('по цене за л.');
        end;
    end;
    Fields := Fields +
      'PrihodSht #P?=+;PrihodLitr=+;PrihodTonn=+;Prihod' + tail + '=+;' +
      'BNalSht=+?;BNalLitr=+;BNalTonn=+;BNal' + tail + '=+;' +
      'TalonSht=+?;TalonLitr=+;TalonTonn=+;Talon' + tail + '=+;' +
      'CardSht=+?;CardLitr=+;CardTonn=+;Card' + tail + '=+;' +
      'NalSht=+?;NalLitr=+;NalTonn=+;Nal' + tail + '=+;' +
      'Own_NeedsSht=+?;Own_NeedsLitr=+;Own_NeedsTonn=+;Own_Needs' + tail + '=+;' +
      'Natural_LeakSht=+?;Natural_LeakLitr=+;Natural_LeakTonn=+;Natural_Leak' + tail + '=+;' +
      'OtherSht=+?;OtherLitr=+;OtherTonn=+;Other' + tail + '=+;' +
      'ShortageSht=+?;ShortageLitr=+;ShortageTonn=+;Shortage' + tail + '=+;' +
      'AvtoSht=+?;AvtoLitr=+;AvtoTonn=+;Avto' + tail + '=+;' +
      'SetOffCommunSht=+?;SetOffCommunLitr=+;SetOffCommunTonn=+;SetOffCommun' + tail + '=+;' +
      'SetOffSecurSht=+?;SetOffSecurLitr=+;SetOffSecurTonn=+;SetOffSecur' + tail + '=+;' +
      'RashSht=+?;RashLitr=+;RashTonn=+;Rash' + tail + '=+;';
    case stoimost of
      UCH_PRICE: List.Columns['BP'].EntireColumn.Hidden := TRUE;
      SELL_PRICE: Fields := Fields + 'Pereoc=+;';
    end;
    Fields := Fields + 'RestOnEndSht #BQ=+?;RestOnEndLitr=+;RestOnEndTonn=+;RestOnEnd' + tail + '=+;';

    ExFunc.PuTOilQueryToExcel(XLApp, List, Q, 0, FIRSTLINE, progr, 20, 100, Fields, '', FALSE, TRUE);
    XLApp.Visible := TRUE;
  finally
    Progr.Free;
    Q.Sql.Text := QText;
  end;
end;
//==============================================================================
procedure TSvodAzsPodpartReportForm.CEPponButtonClick(Sender: TObject);
var
  vId, vInst: integer;
  vName: string;
begin
  if ChooseOrg.CaptureOrg(1, MAIN.INST, MAIN.INST, 'yyyyyynn', vId, vInst, vName) then
  begin
    CEPpon.Text := vName;
    CEPpon.Tag := vId;
  end;
end;
//==============================================================================
procedure TSvodAzsPodpartReportForm.FormCreate(Sender: TObject);
begin
  inherited;
  if (Main_Type = 3) or (Main_Type = 4) then
  begin
    CEPpon.Tag := MAIN.INST;
    CEPpon.Text := GetOrgName(CEPpon.Tag, CEPpon.Tag);
  end;
  SetCurrentMonth(DateEdit1, DateEdit2);
end;
//==============================================================================
procedure TSvodAzsPodpartReportForm.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;
//==============================================================================
procedure TSvodAzsPodpartReportForm.BitBtn1Click(Sender: TObject);
begin
  DefineRepDates(DateEdit1.Date, DateEdit2.Date);
  if DateEdit1.Date > DateEdit2.Date then
    raise Exception.Create(TranslateText('Ќеправильный диапазон дат'));
  if (CEPPON.Text = '') then
    raise Exception.Create(TranslateText('Ќе определена организаци€'));
  PrintReport(DateEdit1.Date, DateEdit2.Date, CEPpon.Tag, CEPpon.Text,
    CBKom.Checked, CBHr.Checked, CBSob.Checked, RGStoimost.ItemIndex,
    RGSort.ItemIndex, CBPartItogo.Checked);
  DefineRepDates(0,0);    
end;
//==============================================================================
procedure TSvodAzsPodpartReportForm.RGSortClick(Sender: TObject);
begin
  case RGSort.ItemIndex of
    0: CBPartItogo.Visible := TRUE;
    1: CBPartItogo.Visible := FALSE;
  end;
end;
//==============================================================================
procedure TSvodAzsPodpartReportForm.SpeedButton1Click(Sender: TObject);
begin
  CEPpon.Text := '';
  CEPpon.Tag := 0;
end;
//==============================================================================

end.
