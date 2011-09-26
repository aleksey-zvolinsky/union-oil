(*
*****Модуль тестировщика для проверки функциональности учетной программы Ойл****
К данному модулю имеют отношение три файла - uTestMenu.pas, uOilTest.pas и uTestClass.pas
Основные процедуры тестеровщика описаны в данном файле, uOilTest.pas определяет интерфейс
к Ойлу. Одна из основных функций тестеровщика, которой надо добиться -
это ДИНАМИЧНОСТЬ - выполнение тестируемой программы с заданными входными данными.
При этом, величины, задаваемые на вход тестируемого ОЙЛа, не всегда достаточны для
полноценной проверки. Сложность и недетерменированость ОЙЛа приводит к тому,
что система может по разному реагировать (речь о результате тестирования)
на одинаковые задающие параметры (напрмер, количество расспечатанных отчетов).
Есть несколько ключевых вопросов о котрых надо упомянуть.
1. Критерии набора тестов
   Критерии в выборе тестов и их дальнейшей реализации должны быть адекватны
   поставленным задачам. На данном этапе разработки были выделены три теста -
   проверка отработки меню главной формы (Main.pas) и вложенных меню
   в открывшехся формах (кстати, реализована "докрутка" - проверка справочников);
   проверка построение отчетов ррр-ок - один режим;
   проверка вложенных запросов - другой. Эффективность выбранных тестов
   может быть определена только в контексте заданных условий.
2. "Квота доверия"
   Тестирование ОЙЛа может использоваться для демонстрации дефектов или ошибок,
   но никогда не покажет их отсутствие. Основная причина этого в том, что полное
   тестирование недостижимо. Даже хороший набор тестов не гарантирует уверенности
   в отсутствии "багов".
3. The problem of infeasible paths
   Это сложнейшая проблема для автоматизированного тестирования связана с тем,
   что потоки выполнения тестирования не могут быть заданными как входящие параметры,
   так же как работа тестируемого ОЙЛа. По хорешому - нужна внешняя программа,
   а не вложенный модуль.
                                                          @@@@@ "Опус" by PR
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
    procedure TestMenuItems(SL: TStringList); // тестирование менюшек
    function InitValues(fname: string): TStringList;
    procedure SearchDateEdit(fname: string);
    procedure TestRRR; //тестирование RRR
    procedure TestLog(filename, msg: string); // вести логи тестировщика
    procedure CloseAllWindows; // закрывать окошки
    procedure Error; // процедура для определения глюков тестировщика
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
    raise exception.create(TranslateText('InitLangValues: не найден файл ') + fname);
  SL.Clear;
  SL.LoadFromFile(fname);
  result := SL;
end;
//==============================================================================
procedure TTestMenu.TestLog(filename, msg: string); // процедурка пишет логи во время работы тестеровщика
begin
  Log(msg); // лог в форме
  ExFunc.Log(GetMainDir + 'AutoTest\Test_files\logs\' + filename + '.log', msg); // начинаем вести журнал
end;
//==============================================================================
procedure TTestMenu.CloseAllWindows;
var
  i: integer;
begin
  if frmOilTest.ClAlW.Checked {//обработка ошибок при закрытии окошек} then
    for i := 0 to Screen.CustomFormCount - 1 do
      if (Screen.Forms[i].Name <> 'MainForm') and (Screen.Forms[i].Name <> 'frmOilTest') then
        Screen.Forms[i].Close; // закрываем окошки
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
 //     TestDebug:=1; // переменная в Майне, определяющая выбор тестирования [0 - обычный режим; 1 - тестирование ррр-ок с построением отчетов; 2-тестирование правильности запроса ррр-ки; 3- testMenuItems]
          TestRRR;
 //     TestDebug:=0;
        end;
      1:
        begin
 //     TestDebug:=2; // переменная в Майне, определяющая выбор тестирования [0 - обычный режим; 1 - тестирование ррр-ок с построением отчетов; 2-тестирование правильности запроса ррр-ки; 3- testMenuItems]
          TestRRR;
 //     TestDebug:=0;
        end;
      2:
        begin
 //     TestDebug:=3;
          TestMenuItems(SL); // сущ переменная TestDebug см. Case[2]
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
  Base: TBaseForm; // для проверки на наследуемость от базовой формы
  Date: TDateEdit;
  DateList: TStringList; // нужен для заполнения дат в формах
begin
  try
    DateList := InitValues('AutoTest\Test_files\ini\DateBegin.ini'); // загружаем DateEdit.Name
    //**************************************
    Timer.Enabled := true; //активизируем таймер
    TestLog('t_mi', 'BEGIN----------' + DateTimeToStr(Now)); //пишем логи
    TestLog('t_mi_err', 'BEGIN----------' + DateTimeToStr(Now));
    //**************************************
    for i := 0 to MainForm.ComponentCount - 1 do
    begin
      if MainForm.Components[i] is TMenuItem then //условие на проверку менюшек
      begin
        MenuItem := MainForm.Components[i] as TMenuItem;
        if Assigned(MenuItem.OnClick) and MenuItem.Visible and (SL.indexOf(MenuItem.Name) = -1) and (MenuItem.Caption <> '-') then
        try
          TestLog('t_mi', 'Click on (' + MenuItem.Name + ')->' + MenuItem.Caption);
          MenuItem.Click;

          // проверяем на наследование от базовой формы, если гуд - проверяем три опреации [Очистить, Поиск, Редактирование]
          if Screen.ActiveForm.InheritsFrom(TBaseForm) then
          begin
            Base := TBaseForm(Screen.ActiveForm);
            TestLog('t_mi', 'Проверяем... ' + Base.Caption + '||' + Base.Name);
            with Base do
            begin
              bbClear.Click;
              TestLog('t_mi', '  - Очистить....');
              bbSearch.Click;
              TestLog('t_mi', '  - Поиск....');
              sbEdit.Click;
              TestLog('t_mi', '  - Редактировать....');
            end;
          end;

          // проверяем вложенные компоненты в Активной форме
          for j := 0 to Screen.ActiveForm.ComponentCount - 1 do
          begin
            // поиск компонент TDateEdit и присваивание значений согласно BeginDate.ini
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
                TestLog('t_mi', ' вложенное меню ' + '(' + MI.Name + ')->' + MI.Caption + ' в форме - ' + MenuItem.Name + '---' + MenuItem.Caption);
                MI.Click;
              end;
            except on E: Exception do
              begin
                TestLog('t_mi', DateTimeToStr(Now) + ': ' + E.Message + '------ название меню ' + '(' + MI.Name + ')-' + MI.Caption + ' в форме ' + MenuItem.Caption); //оброботка ошибок
                TestLog('t_mi_err', DateTimeToStr(Now) + ': ' + E.Message + '------ название меню ' + '(' + MI.Name + ')-' + MI.Caption + ' в форме ' + MenuItem.Caption); //оброботка ошибок
              end;
            end;
          end; // конец for [j]
        except on E: Exception do
          begin
            TestLog('t_mi', DateTimeToStr(Now) + ': ' + E.Message + '------ название меню ' + '(' + MenuItem.Name + ')->' + MenuItem.Caption); //оброботка ошибок
            TestLog('t_mi_err', DateTimeToStr(Now) + ': ' + E.Message + '------ название меню ' + '(' + MenuItem.Name + ')->' + MenuItem.Caption); //оброботка ошибок
          end;
        end;
      end;
    end; // конец for [i]
    Timer.Enabled := False; // деактивация таймера
    CloseAllWindows; // закрыитие открытых форм
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
  ExFunc.Log(GetMainDir + 'AutoTest\Test_files\logs\searchbb.log', 'В файле - ' + fname); // начинаем вести журнал
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
  (* процедура определяет название позиции RRR в меню отчетов *)
  function PosRRR(titleRRR: string): string;
  var SL: TStringList;
    menuRRR: string;
  begin
    try
      if not FileExists(GetMainDir + 'AutoTest\Test_files\ini\rrrList.ini') then
        result := 'Меню не определено';
      SL := InitValues('AutoTest\Test_files\ini\rrrList.ini');
      menuRRR := SL.Values[titleRRR]; //добавить условие проверки
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
    if MainForm.MainMenu1.Components[i] is TMenuItem then //условие на проверку менюшек RRR
    begin
      RRRMenuItem := MainForm.MainMenu1.Components[I] as TMenuItem;
      if @RRRMenuItem.OnClick = @NE then
      try
        begin
          TestLog('t_RRR', '------------------------------------------');
          TestLog('t_rrr', 'Название иеню - ' + RRRMenuItem.Caption + '  --->  ');
          RRRMenuItem.Click;
          TestLog('t_rrr', 'Располжение в меню: ' + PosRRR(Screen.ActiveForm.Caption));
        end;
      except on E: Exception do //оброботка ошибок
        begin
          TestLog('t_rrr', 'Exception: ' + E.Message);
          TestLog('t_rrr', 'Располжение в меню: ' + PosRRR(Screen.ActiveForm.Caption));
          TestLog('t_rrr_err', 'Exception: ' + E.Message);
          TestLog('t_rrr_err', 'Располжение в меню: ' + PosRRR(Screen.ActiveForm.Caption));
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
          // надо проверить обратиться к компонентам подобно CommonForm
          MI.Click;
          TestLog('mi2', IntToStr(i) + '. ' + mi.Name + ' - ' + mi.Caption);
          // проверяем вложенные компоненты в Активной форме
          counter := Screen.ActiveForm.ComponentCount - 1;
          if counter > 1 then
            for j := 0 to counter do
            try
              begin
                // если искать другие компоненты для немодальных форм
                if Screen.ActiveForm.Components[j] is TBitBtn then
                begin
                  bb := Screen.ActiveForm.Components[j] as TBitBtn;
                  if (bb.Name = 'bbOk') and (bb.Enabled = true) then
                  begin
                    TestLog('mi2', 'Нажимаем кнопку...  ' + bb.Name + ' - ' + bb.Caption);
                    bb.Click;
                  end;
                  if (bb.Name = 'BitBtn1') and (bb.Enabled = true) then
                  begin
                    TestLog('mi2', 'Нажимаем кнопку...  ' + bb.Name + ' - ' + bb.Caption);
                    bb.Click;
                  end;
                  if (bb.Name = 'BitBtn2') and (bb.Enabled = true) then
                  begin
                    TestLog('mi2', 'Нажимаем кнопку...  ' + bb.Name + ' - ' + bb.Caption);
                    bb.Click;
                  end;
                  if (bb.Name = 'bbCancel') and (bb.Enabled = true) then
                  begin
                    TestLog('mi2', 'Нажимаем кнопку...  ' + bb.Name + ' - ' + bb.Caption);
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
