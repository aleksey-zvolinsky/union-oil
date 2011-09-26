(*
*****������ ������������ ��� �������� ���������������� ������� ��������� ���****
� ������� ������ ����� ��������� ��� ����� - uTestMenu.pas, uOilTest.pas � uTestClass.pas
�������� ��������� ������������ ������� � ������ �����, uOilTest.pas ���������� ���������
� ����. ���� �� �������� ������� ������������, ������� ���� �������� -
��� ������������ - ���������� ����������� ��������� � ��������� �������� �������.
��� ����, ��������, ���������� �� ���� ������������ ����, �� ������ ���������� ���
����������� ��������. ��������� � �������������������� ���� �������� � ����,
��� ������� ����� �� ������� ����������� (���� � ���������� ������������)
�� ���������� �������� ��������� (�������, ���������� �������������� �������).
���� ��������� �������� �������� � ������ ���� ���������.
1. �������� ������ ������
   �������� � ������ ������ � �� ���������� ���������� ������ ���� ���������
   ������������ �������. �� ������ ����� ���������� ���� �������� ��� ����� -
   �������� ��������� ���� ������� ����� (Main.pas) � ��������� ����
   � ����������� ������ (������, ����������� "��������" - �������� ������������);
   �������� ���������� ������� ���-�� - ���� �����;
   �������� ��������� �������� - ������. ������������� ��������� ������
   ����� ���� ���������� ������ � ��������� �������� �������.
2. "����� �������"
   ������������ ���� ����� �������������� ��� ������������ �������� ��� ������,
   �� ������� �� ������� �� ����������. �������� ������� ����� � ���, ��� ������
   ������������ �����������. ���� ������� ����� ������ �� ����������� �����������
   � ���������� "�����".
3. The problem of infeasible paths
   ��� ���������� �������� ��� ������������������� ������������ ������� � ���,
   ��� ������ ���������� ������������ �� ����� ���� ��������� ��� �������� ���������,
   ��� �� ��� ������ ������������ ����. �� �������� - ����� ������� ���������,
   � �� ��������� ������.
                                                          @@@@@ "����" by PR
*)

unit uTestMenu;

interface

uses uTestClass, Main, Menus, sysutils, Windows, Messages, Forms, extctrls,
  Dialogs, classes, Base, EditBase, uCommonForm, ExFunc, OilStd, uStart, Buttons,
  uOilTest, uOilQuery, PrihRef, TextFunc, RulezReport, ReportManager, uDBFunc,
  DB, ToolEdit;

type TTestMenu = class(TTestClass)
  private
    Timer: TTimer;
    procedure CloseTopWindow(Sender: TObject);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Start(var caseNum: integer);
    procedure TestMenuItems(SL: TStringList); // ������������ �������
    function InitValues(fname: string): TStringList;
    procedure SearchDateEdit(fname: string);
    procedure TestRRR; //������������ RRR
    procedure TestLog(filename, msg: string); // ����� ���� ������������
    procedure CloseAllWindows; // ��������� ������
    procedure Error; // ��������� ��� ����������� ������ ������������
  end;

var
  TestMenu: TTestMenu;

implementation

{ TTestMenu }

//==============================================================================
procedure TTestMenu.CloseTopWindow(Sender: TObject);
begin
  SendMessage(GetActiveWindow, WM_CLOSE, 0, 0);
end;
//==============================================================================
constructor TTestMenu.Create;
begin
  inherited;
  Caption := 'Main menu and toolbar';
  Timer := TTimer.Create(nil);
  Timer.Interval := 100;
  Timer.OnTimer := CloseTopWindow;
  Timer.Enabled := False;
end;
//==============================================================================
destructor TTestMenu.Destroy;
begin
  inherited Destroy;
  FreeAndNil(Timer);
end;
//==============================================================================
function TTestMenu.InitValues(fname: string): TStringList;
var SL: TStringList;
begin
  SL := TStringList.Create;
  fname := GetMainDir + fname;
  if not FileExists(fname) then
    raise exception.create(TranslateText('InitLangValues: �� ������ ���� ') + fname);
  SL.Clear;
  SL.LoadFromFile(fname);
  result := SL;
end;
//==============================================================================
procedure TTestMenu.TestLog(filename, msg: string); // ���������� ����� ���� �� ����� ������ ������������
begin
  Log(msg); // ��� � �����
  ExFunc.Log(GetMainDir + 'AutoTest\Test_files\logs\' + filename + '.log', msg); // �������� ����� ������
end;
//==============================================================================
procedure TTestMenu.CloseAllWindows;
var
  i: integer;
begin
  if frmOilTest.ClAlW.Checked {//��������� ������ ��� �������� ������} then
    for i := 0 to Screen.CustomFormCount - 1 do
      if (Screen.Forms[i].Name <> 'MainForm') and (Screen.Forms[i].Name <> 'frmOilTest') then
        Screen.Forms[i].Close; // ��������� ������
end;
//==============================================================================
procedure TTestMenu.Start(var caseNum: integer);
var
  SL: TStringList;
begin
  try
    SL := InitValues('AutoTest\Test_files\ini\data.ini');
    case caseNum of
      0:
        begin
 //     TestDebug:=1; // ���������� � �����, ������������ ����� ������������ [0 - ������� �����; 1 - ������������ ���-�� � ����������� �������; 2-������������ ������������ ������� ���-��; 3- testMenuItems]
          TestRRR;
 //     TestDebug:=0;
        end;
      1:
        begin
 //     TestDebug:=2; // ���������� � �����, ������������ ����� ������������ [0 - ������� �����; 1 - ������������ ���-�� � ����������� �������; 2-������������ ������������ ������� ���-��; 3- testMenuItems]
          TestRRR;
 //     TestDebug:=0;
        end;
      2:
        begin
 //     TestDebug:=3;
          TestMenuItems(SL); // ��� ���������� TestDebug ��. Case[2]
 //     TestDebug:=0;
        end;
    end;
  finally
    SL.Free;
  end;
end;
//==============================================================================
procedure TTestMenu.TestMenuItems(SL: TStringList);
var
  MenuItem, MI: TMenuItem;
  i, j: integer;
  Base: TBaseForm; // ��� �������� �� ������������� �� ������� �����
  Date: TDateEdit;
  DateList: TStringList; // ����� ��� ���������� ��� � ������
begin
  try
    DateList := InitValues('AutoTest\Test_files\ini\DateBegin.ini'); // ��������� DateEdit.Name
    //**************************************
    Timer.Enabled := true; //������������ ������
    TestLog('t_mi', 'BEGIN----------' + DateTimeToStr(Now)); //����� ����
    TestLog('t_mi_err', 'BEGIN----------' + DateTimeToStr(Now));
    //**************************************
    for i := 0 to MainForm.ComponentCount - 1 do
    begin
      if MainForm.Components[i] is TMenuItem then //������� �� �������� �������
      begin
        MenuItem := MainForm.Components[i] as TMenuItem;
        if Assigned(MenuItem.OnClick) and MenuItem.Visible and (SL.indexOf(MenuItem.Name) = -1) and (MenuItem.Caption <> '-') then
        try
          TestLog('t_mi', 'Click on (' + MenuItem.Name + ')->' + MenuItem.Caption);
          MenuItem.Click;

          // ��������� �� ������������ �� ������� �����, ���� ��� - ��������� ��� �������� [��������, �����, ��������������]
          if Screen.ActiveForm.InheritsFrom(TBaseForm) then
          begin
            Base := TBaseForm(Screen.ActiveForm);
            TestLog('t_mi', '���������... ' + Base.Caption + '||' + Base.Name);
            with Base do
            begin
              bbClear.Click;
              TestLog('t_mi', '  - ��������....');
              bbSearch.Click;
              TestLog('t_mi', '  - �����....');
              sbEdit.Click;
              TestLog('t_mi', '  - �������������....');
            end;
          end;

          // ��������� ��������� ���������� � �������� �����
          for j := 0 to Screen.ActiveForm.ComponentCount - 1 do
          begin
            // ����� ��������� TDateEdit � ������������ �������� �������� BeginDate.ini
            if Screen.ActiveForm.Components[j] is TDateEdit then
            begin
              Date := Screen.ActiveForm.Components[j] as TDateEdit;
              if DateList.IndexOf(Date.Name) <> -1 then
                Date.Text := GetSqlValue('select max(date_) from oil_rashod');
            end;
            if Screen.ActiveForm.Components[j] is TMenuItem then
            try
              MI := Screen.ActiveForm.Components[j] as TMenuItem;
              if Assigned(MI.OnClick) and MI.Visible and (SL.indexOf(MI.Name) = -1) and (MI.Caption <> '-') then
              begin
                TestLog('t_mi', ' ��������� ���� ' + '(' + MI.Name + ')->' + MI.Caption + ' � ����� - ' + MenuItem.Name + '---' + MenuItem.Caption);
                MI.Click;
              end;
            except on E: Exception do
              begin
                TestLog('t_mi', DateTimeToStr(Now) + ': ' + E.Message + '------ �������� ���� ' + '(' + MI.Name + ')-' + MI.Caption + ' � ����� ' + MenuItem.Caption); //��������� ������
                TestLog('t_mi_err', DateTimeToStr(Now) + ': ' + E.Message + '------ �������� ���� ' + '(' + MI.Name + ')-' + MI.Caption + ' � ����� ' + MenuItem.Caption); //��������� ������
              end;
            end;
          end; // ����� for [j]
        except on E: Exception do
          begin
            TestLog('t_mi', DateTimeToStr(Now) + ': ' + E.Message + '------ �������� ���� ' + '(' + MenuItem.Name + ')->' + MenuItem.Caption); //��������� ������
            TestLog('t_mi_err', DateTimeToStr(Now) + ': ' + E.Message + '------ �������� ���� ' + '(' + MenuItem.Name + ')->' + MenuItem.Caption); //��������� ������
          end;
        end;
      end;
    end; // ����� for [i]
    Timer.Enabled := False; // ����������� �������
    CloseAllWindows; // ��������� �������� ����
  finally
    DateList.Free;
  end;
end;
//==============================================================================
procedure TTestMenu.SearchDateEdit(fname: string);
var
  SL: TStringList;
  i: integer;
  s: string;
begin
  SL := TStringList.Create;
  SL.Clear;
  SL.LoadFromFile(GetMainDir + fname);
  ExFunc.Log(GetMainDir + 'AutoTest\Test_files\logs\searchbb.log', '');
  ExFunc.Log(GetMainDir + 'AutoTest\Test_files\logs\searchbb.log', '� ����� - ' + fname); // �������� ����� ������
  for i := 0 to SL.Count - 1 do
  begin
    if Pos('TBitBtn', SL[i]) <> 0 then
    begin
      s := SL[i]; // s:=Copy(SL[i],0,length(SL[i])-9);
      ExFunc.Log(GetMainDir + 'AutoTest\Test_files\logs\searchbb.log', s);
    end;
  end;
  SL.Destroy;
end;
//==============================================================================
procedure TTestMenu.TestRRR;
var
  RRRMenuItem: TMenuItem;
  i: integer;
  NE: TNotifyEvent;
  //****************************************************************************
  (* ��������� ���������� �������� ������� RRR � ���� ������� *)
  function PosRRR(titleRRR: string): string;
  var SL: TStringList;
    menuRRR: string;
  begin
    try
      if not FileExists(GetMainDir + 'AutoTest\Test_files\ini\rrrList.ini') then
        result := '���� �� ����������';
      SL := InitValues('AutoTest\Test_files\ini\rrrList.ini');
      menuRRR := SL.Values[titleRRR]; //�������� ������� ��������
      result := menuRRR;
    finally
      SL.Free;
    end;
  end;
  //****************************************************************************
begin
  TestLog('t_rrr', 'Begin - ' + DateTimeToStr(Now));
  NE := MainForm.MenuReportClick;
  for i := 0 to MainForm.MainMenu1.ComponentCount - 1 do
  begin
    if MainForm.MainMenu1.Components[i] is TMenuItem then //������� �� �������� ������� RRR
    begin
      RRRMenuItem := MainForm.MainMenu1.Components[I] as TMenuItem;
      if @RRRMenuItem.OnClick = @NE then
      try
        begin
          TestLog('t_RRR', '------------------------------------------');
          TestLog('t_rrr', '�������� ���� - ' + RRRMenuItem.Caption + '  --->  ');
          RRRMenuItem.Click;
          TestLog('t_rrr', '����������� � ����: ' + PosRRR(Screen.ActiveForm.Caption));
        end;
      except on E: Exception do //��������� ������
        begin
          TestLog('t_rrr', 'Exception: ' + E.Message);
          TestLog('t_rrr', '����������� � ����: ' + PosRRR(Screen.ActiveForm.Caption));
          TestLog('t_rrr_err', 'Exception: ' + E.Message);
          TestLog('t_rrr_err', '����������� � ����: ' + PosRRR(Screen.ActiveForm.Caption));
        end;
      end;
    end;
  end;
  TestLog('t_rrr', '*************************' + DateTimeToStr(Now));
  CloseAllWindows;
end;
//==============================================================================
procedure TTestMenu.Error;
var
  SL, S: TStringList;
  i, j, counter: integer;
  MI, M: TMenuItem;
  bb: TBitBtn;
begin
  inherited;
  try
    Timer.Enabled := true;
    S := InitValues('AutoTest\Test_files\ini\DateBegin.ini');
    SL := InitValues('AutoTest\Test_files\ini\data.ini');
    TestLog('mi2', '************************');
    TestLog('mi2', 'BEGIN');
    for i := 0 to MainForm.ComponentCount - 1 do
    begin
      if MainForm.Components[i] is TMenuItem then
      begin
        MI := MainForm.Components[i] as TMenuItem;
        if MI.Visible and (SL.IndexOf(MI.Name) = -1) and (MI.Caption <> '-') then
        begin
          // ���� ��������� ���������� � ����������� ������� CommonForm
          MI.Click;
          TestLog('mi2', IntToStr(i) + '. ' + mi.Name + ' - ' + mi.Caption);
          // ��������� ��������� ���������� � �������� �����
          counter := Screen.ActiveForm.ComponentCount - 1;
          if counter > 1 then
            for j := 0 to counter do
            try
              begin
                // ���� ������ ������ ���������� ��� ����������� ����
                if Screen.ActiveForm.Components[j] is TBitBtn then
                begin
                  bb := Screen.ActiveForm.Components[j] as TBitBtn;
                  if (bb.Name = 'bbOk') and (bb.Enabled = true) then
                  begin
                    TestLog('mi2', '�������� ������...  ' + bb.Name + ' - ' + bb.Caption);
                    bb.Click;
                  end;
                  if (bb.Name = 'BitBtn1') and (bb.Enabled = true) then
                  begin
                    TestLog('mi2', '�������� ������...  ' + bb.Name + ' - ' + bb.Caption);
                    bb.Click;
                  end;
                  if (bb.Name = 'BitBtn2') and (bb.Enabled = true) then
                  begin
                    TestLog('mi2', '�������� ������...  ' + bb.Name + ' - ' + bb.Caption);
                    bb.Click;
                  end;
                  if (bb.Name = 'bbCancel') and (bb.Enabled = true) then
                  begin
                    TestLog('mi2', '�������� ������...  ' + bb.Name + ' - ' + bb.Caption);
                    bb.Click;
                  end;
                end;

                if Screen.ActiveForm.Components[j] is TMenuItem then
                begin
                  M := Screen.ActiveForm.Components[j] as TMenuItem;
                  if M.Visible and (SL.indexOf(M.Name) = -1) and (M.Caption <> '-') then
                    TestLog('mi2', IntToStr(j) + ' - ' + IntToStr(i) + '. ' + m.Name + ' - ' + m.Caption); //M.Click;
                end;
              end;
            except on E: Exception do
                TestLog('erEr', E.Message);
            end;
        end;
      end;
    end;
    Timer.Enabled := false;
  finally
    begin
      S.Free;
      SL.Free;
    end;
  end;
end;
//==============================================================================
initialization
  TestMenu := TTestMenu.Create;
finalization
  TestMenu.Free;

end.
