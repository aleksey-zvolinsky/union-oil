unit uOilTest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, ActnList, ExtCtrls, uTestClass, ActiveX, ComObj, Menus,
  RXCtrls, Buttons, uHelpButton, uCommonForm;

type
  TfrmOilTest = class(TCommonForm)
    gbxBottom: TPanel;
    gbxTest: TGroupBox;
    gbxLog: TGroupBox;
    memLog: TMemo;
    btnUnselectAll: TButton;
    btnStart: TButton;
    btnSelectAll: TButton;
    chlTest: TCheckListBox;
    ActionList: TActionList;
    actClose: TAction;
    Panel1: TPanel;
    btnClose: TButton;
    ClAlW: TCheckBox;
    Button1: TButton;
    sbPrint: TRxSpeedButton;
    TestReportMenu: TPopupMenu;
    tAll: TMenuItem;
    tRRR: TMenuItem;
    tRRRfull: TMenuItem;
    tRRRprepare: TMenuItem;
    N1: TMenuItem;
    Button2: TButton;
    HelpTest: TOilHelpButton;
    t_mi: TMenuItem;
    tmierr: TMenuItem;
    tRRRlt: TMenuItem;
    terrlt: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
    procedure btnUnselectAllClick(Sender: TObject);
    procedure killExcel(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure LogFileToMemo(FileName: string);
    procedure t_miClick(Sender: TObject);
    procedure tmierrClick(Sender: TObject);
    procedure tRRRfullClick(Sender: TObject);
    procedure tRRRprepareClick(Sender: TObject);
    procedure tRRRltClick(Sender: TObject);
    procedure terrltClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    procedure AddLog(Sender: TObject; AText: string);
    procedure AddTest(ATestClass: TTestClass);
  end;

var
  frmOilTest: TfrmOilTest;

implementation

uses uTestMenu, exfunc;

{$R *.DFM}

//==============================================================================
procedure TfrmOilTest.AddLog(Sender: TObject; AText: string);
begin
  MemLog.Lines.Add(AText);
  exfunc.log(GetMainDir + 'oil_test.log', AText);
end;
//==============================================================================
procedure TfrmOilTest.AddTest(ATestClass: TTestClass);
begin
  chlTest.Items.AddObject(ATestClass.Caption, ATestClass);
  ATestClass.OnLog := AddLog;
end;
//==============================================================================
procedure TfrmOilTest.FormCreate(Sender: TObject);
begin
  AddTest(TestMenu);
  (*временно неактивное меню - исп. дл€ поиска компоненты bbCancel*)
  chlTest.ItemEnabled[0] := true;
end;
//==============================================================================
procedure TfrmOilTest.btnStartClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to chlTest.Items.Count - 1 do
    if chlTest.Checked[I] and chlTest.ItemEnabled[i] then
      TestMenu.Start(i);
end;
//==============================================================================
procedure TfrmOilTest.actCloseExecute(Sender: TObject);
begin
  Close;
end;
//==============================================================================
procedure TfrmOilTest.btnSelectAllClick(Sender: TObject);
var i: integer;
begin
  for i := 0 to chlTest.Items.Count - 1 do
    chlTest.Checked[i] := true;
end;
//==============================================================================
procedure TfrmOilTest.btnUnselectAllClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to chlTest.Items.Count - 1 do
    chlTest.Checked[i] := false;
end;
//==============================================================================
procedure TfrmOilTest.killExcel(Sender: TObject);
var
  h: hWnd;
  XLApp: Variant;
  Unknown: iUnknown;
begin
   // спецом открываетс€ ≈ксель с названием. которе нам надо, чтоб потм это дело убить
  if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
    XLApp := GetActiveOleObject('Excel.Application')
  else XLApp := CreateOleObject('Excel.Application');
  XLApp.Workbooks.Add(GetMainDir + 'AutoTest\Test_files\testRRR.xls');
  XLApp.Visible := TRUE;
   // вот как раз убиваем ≈ксель
  h := FindWindow(nil, 'Microsoft Excel - testRRR1');
  if h = 0 then exit;
  SendMessage(h, WM_DESTROY, 0, 0);
end;
//==============================================================================
procedure TfrmOilTest.Button2Click(Sender: TObject);
begin
  TestMenu.Error;
end;
//==============================================================================
procedure TfrmOilTest.LogFileToMemo(FileName: string);
var
  SL: TStringList;
begin
  FileName := GetMainDir + 'AutoTest\Test_files\Logs\' + FileName + '.log';
  if not FileExists(FileName) then FileCreate(FileName);
  try
    SL := TStringList.Create;
    SL.LoadFromFile(FileName);
    MemLog.Clear;
    MemLog.Text := SL.Text;
  finally
    SL.Free;
  end;
end;
//==============================================================================
procedure TfrmOilTest.t_miClick(Sender: TObject);
begin
  LogFileToMemo('t_mi');
end;
//==============================================================================
procedure TfrmOilTest.tmierrClick(Sender: TObject);
begin
  LogFileToMemo('t_mi_err');
end;
//==============================================================================
procedure TfrmOilTest.tRRRfullClick(Sender: TObject);
begin
  LogFileToMemo('t_rrr');
end;
//==============================================================================
procedure TfrmOilTest.tRRRprepareClick(Sender: TObject);
begin
  LogFileToMemo('t_rrr_err')
end;
//==============================================================================
procedure TfrmOilTest.tRRRltClick(Sender: TObject);
begin
  LogFileToMemo('t_rrr_light');
end;
//==============================================================================
procedure TfrmOilTest.terrltClick(Sender: TObject);
begin
  LogFileToMemo('t_rrr_light_err');
end;
//==============================================================================
procedure TfrmOilTest.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if FormStyle = fsMDIChild then
    Action := caFree;
end;
//==============================================================================

end.
