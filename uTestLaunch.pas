{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{
Модуль проверок
Принцип:
Есть две основных функции - FirstTest и SecondTest
Вызов каждой вызывает создание окна проверок.
В первом случае тестируются проверки отрицательные результаты
по которым не допускают дальнейшего запуска программы
Во втором случае производятся проверки, которые могут блокировать
права пользователя или отчеты.

Каждая проверка в теле FirstTest и SecondTest оформлена в виде
функций которые могут вернуть следующие результаты (вид блокировки)

  0 - ОК, 1 - Блок, 2 - Желтое предупреждение, 3 - Красное предупреждение

В FirstTest и SecondTest есть локальные процедуры CheckBlockAndWarning
которые анализируют результат функций и заполняют ими глобальную переменную
ResultStr:

...
ResultStr := ResultStr + IntToStr(CheckIndex) + ',';
....

Для добавления проверки по талонам / картам небоходимо:
  - добавить запись в oil_decode_checkup
  - добавить запись в oil_checkups
  - добавить номер проверки в переменную OIL_VAR.CH_AUDIT_LIST

Для добавления блокировок ver.1:
  - Выбрать месторасположение блокировки. FirstTest - до запуска программы, при
  отрицательном результате программа закончит работу, SecondTest - после запуска
  программы, при отрицательном результате будут заблокированы права пользователя
  - Добавить в выбранную процедуру секцию похожую на эту:

      IncArrayLength;                 //расширяет дин. массив проверок
      ImageIndex := TestSRTalons;     //Выполняет функцию проверки и возвращает рез-т в ImageIndex
      SrTalonItem := ArrayLength-1;   //Запоминает индекс в массиве
      AddRecord(ImageIndex,'Сменный отчет - талоны без номеров и серий'); //добавляет запись в грид
      CheckBlockAndWarning(8); - 8 номер проверки в рамках выбранной процедуры (FirstTest, SecondTest)

   - Написать функцию проверки. В описанном случае TestSRTalons.
      function TestSRTalons: Integer;

   - в функцию CheckBlockAndWarning добавить  номер проверки в рамках выбранной процедуры (FirstTest, SecondTest)

   - понять как устроена OnClose формы и изменить ее согласно своего номера блокировки. Там можно сразу
     блокировать все, блокировать только см. отчеты и еще что-то.


     
Для добавления блокировок ver.2:
  Працює лише для таких перевірок, в яких проходження чи не проходження перевірки визначається
  властивістю RecordCount написаної перевірки:
        RecordCount = 0 - перевірка пройдена
        RecordCount > 0 - перевірка не пройдена

  1. Написати селект для перевірки, щоб виконувалась домовленість про RecordCount (див. на 5 рядків вище)
  2. Перед селектом вставити закоментовані параметри
       --$DESC=       <-- назва перевірки. Вона вискакує в переліку dbgMain
       --$TEST=       <-- належність перевірки до FirstTest (--$TEST=1) чи SecondTest (--$TEST=2)
       --$ISREGULAR=  <-- [1/0] - чи включати цю перевірку в регулярні. Аналізується лише для --$TEST=1
       --$RESULT=     <-- [integer] - вид блокування в разі непроходження перевірки (RecordCount>0)
       --$RESULT_EMP_ID=  <-- [integer] - id юзера, що присвоїться Main.EMP_ID в разі непроходження перевірки (RecordCount>0). Береться з [adm_users]
       --$CHECKINDEX= <-- номер перевірки (>100)
       --$F_NAME_Q=   <-- перелік полів, які треба взяти з квері, розділені ";"
       --$F_NAME_T=   <-- назви полів, які будуть в назвах колонок в таблиці dbgCheck, розділені ";", відповідно до порядку полів в F_NAME_Q. Якщо в назві присутній символ 0x20 (space) - обовязково виділити подвійними лапками
       --$F_WIDTH=    <-- [integer] - ширина полів в таблиці dbgCheck, розділені ";", відповідно до порядку полів в F_NAME_Q
     Всі текстові параметри можна використовувати з "@" для розділення рос./укр.
  3. Покласти свій витвір на Planeco на розсилку (OilSqlDeveloper.exe - форма: uTestLaunch)

Приклад: --$DESC=Дебеторы по ЛС@Дебетори по ЛС
         --$TEST=2
         --$ISREGULAR=0
         --$RESULT=3
         --$RESULT_EMP_ID=-1
         --$F_NAME_Q=name;date_;debet;debetmax
         --$F_NAME_T=Дебетор@Дебітор;Дата;Дебет;"Макс. дебет"
         --$F_WIDTH=355;85;87;93
         --$CHECKINDEX=100
         select oo.name,
                dbt.date_,
                dbt.summover as debet,
                det.deb_summa_allowed as debetmax
           from v_oil_org_det2 det, oil_deadbeat dbt, v_org oo
          where oo.id = det.org_id(+) and oo.inst = det.org_inst(+)
            and oo.state = 'Y' and dbt.state = 'Y' and det.state(+) = 'Y'
            and dbt.org_id = oo.id and dbt.org_inst = oo.inst
            and ((dbt.summover - nvl(det.deb_summa_allowed,0) > 0) or (dbt.date_ + nvl(det.deb_days_allowed,0) < sysdate))
            and exists (select 'X' from oil_dog dog
                         where dog.state='Y'
                           and dbt.org_id = dog.to_ and dbt.org_inst = dog.to_inst
                           and dog.dog_type = 'K'   and dog.sub_type = 101)

}
unit uTestLaunch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, RxMemDS, StdCtrls, Buttons, ComCtrls, Grids, DBGridEh, RXSplit,
  ExtCtrls, ImgList, DBTables, RXCtrls, RxRichEd, MemDS, DBAccess, Ora, Math,
  uStart, TimerLst, Main, Menus, uHelpButton, uCommonForm,uOilQuery,uOilStoredProc
  {$IFDEF VER150},Variants, DBGridEhGrouping, GridsEh{$ENDIF};

type
  TfrmTestLaunch = class(TCommonForm)
    Panel1: TPanel;
    Panel2: TPanel;
    RxSplitter1: TRxSplitter;
    StatusBar1: TStatusBar;
    dsRMD: TOraDataSource;
    rmd: TRxMemoryData;
    rmdFlag: TFloatField;
    rmdComment_: TStringField;
    ImageList1: TImageList;
    dbgMain: TDBGridEh;
    bbtContinue: TBitBtn;
    bbtClose: TBitBtn;
    Panel3: TPanel;
    Splitter1: TSplitter;
    Notebook1: TNotebook;
    dbgPart: TDBGridEh;
    redComment: TRxRichEdit;
    pnlPassword: TPanel;
    edtPassword: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    dsPart: TOraDataSource;
    qCard: TOilQuery;
    qPart: TOilQuery;
    qPartDOG_: TStringField;
    qPartTIMES: TStringField;
    qPartN: TFloatField;
    qPartNAME: TStringField;
    qVagons: TOilQuery;
    dbgVagons: TDBGridEh;
    dsVagon: TOraDataSource;
    pmToExcel: TPopupMenu;
    miPutToExcel: TMenuItem;
    OilHelpButton1: TOilHelpButton;
    bbTestDB: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    DBGridEh2: TDBGridEh;
    dsSRTalon: TOraDataSource;
    qSRTalon: TOilQuery;
    qVagonsN: TFloatField;
    qVagonsVAGON_NAME: TStringField;
    qVagonsPART_NAME: TStringField;
    qVagonsDATE_RAST: TDateTimeField;
    qVagonsCOMMENTS: TStringField;
    qVagonsORG_NAME: TStringField;
    qVagonsOBL_NAME: TStringField;
    dsRez: TOraDataSource;
    qRez: TOilQuery;
    qRezNUM: TStringField;
    qRezREZ_NAME: TStringField;
    qRezORG_NAME: TStringField;
    qRezID: TFloatField;
    qRezINST_ORG: TFloatField;
    dbgRez: TDBGridEh;
    Panel4: TPanel;
    pnlWithCloseButton: TPanel;
    Panel5: TPanel;
    cbHideGreen: TCheckBox;
    qVagonsNP_NAME: TStringField;
    qVagonsNP_GRP_NAME: TStringField;
    qVagonsWEIGHT: TFloatField;
    qCheckList: TOilQuery;
    dsCheckList: TOraDataSource;
    dbgCheck: TDBGridEh;
    qCheckListSQL_ID: TFloatField;
    qCheckListSQL_NAME: TStringField;
    qCheckListFORM_NAME: TStringField;
    qCheckListTEST_NUM: TStringField;
    qCheckListCHECKINDEX: TStringField;
    qVagonsRAIL_STAT_NAME: TStringField;
    procedure bbtCloseClick(Sender: TObject);
    procedure bbtContinueClick(Sender: TObject);
    procedure AddRecord(ImageIndex: integer; Comment_ : string);
    procedure dsRMDDataChange(Sender: TObject; Field: TField);
    Function SynchroPart:integer;
    function TestVagons:integer;
    function TestSRTalons: Integer;
    function TestTubingsInRez: integer;
    procedure FormShow(Sender: TObject);
    procedure miPutToExcelClick(Sender: TObject);
    procedure bbTestDBClick(Sender: TObject);
    procedure cbHideGreenClick(Sender: TObject);
    procedure rmdFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure dbgMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    function LoadChecks(Test_num: integer): boolean; //Test_num - діставати перевірки для FirstTest чи для SecondTest
                                                     //LoadChecks=true, якщо завантажена хоча б 1 перевірка
  private
    { Private declarations }
  public
    IsRegularOnly: boolean;
    function IsBlockedFirstTestRegular: boolean;  // перевірки FirstTest які будуть перевірятися по таймеру (перевірки по талонам/карткам/бланкам - виключені)
  end;

  function NowIsRestDay : boolean;
  function TestCheckUpFlag(var Msg : string):integer;
  function TestCheckUpFlagOnActivate(var Msg : string):integer;
  function FirstTest(var pp_Password: Boolean; p_IsRegularOnly: Boolean = false): Boolean;   //p_IsRegularOnly - для регулярних перевірок під час роботи в Ойлі. Задіяні для динамічних перевірок з exe_sql, в яких --$TEST=1
  function SecondTest: Boolean;
  Function SuccessIncass(var Msg: string):integer;
  Function LoadModemTrans(var Msg : string):integer;
  Function CardTrans(Event_Id: integer;var Msg : string):integer;
  Function PCExchange(EventId : integer; var Msg : string):integer;
  Function MakeBlackList(var Msg:string):integer;
  Function LinkComServer(var Msg:string):integer;
  function TestBackupFlag(var Msg:string) : integer;
  function RightVersion(RealVersion,KeyVersion:string):Boolean;
  function ActiveCH(p_num: integer): boolean; // активація другорядних перевірок

type
  // Салат параметрів для однієї перевірки - в кожне поле рекорда містить список полів, розділених ";"
  TSalat = record                   // NameQ - назва поля в квері;
    NameQ,NameT,Width: TStringList; // NameT - назва поля, що відобразиться в таблиці. Якщо в назві є спейси, всю назву поле обовязково виділити в подвійні лапки. Напр., для поля 'Макс. дебет': --$F_NAME_T=Дебетор;Дата;Дебет;"Макс. дебет"
  end;                              // Width - ширина поля в dbGridEh (dbgCheck)

  TCheck = record
    qCheck: TOilQuery;    // Динамічна перевірки - завантажуються з бази
    CheckIndex: integer;  // Номер перевірки
    Description: string;
    Test: integer;        // Test=1, якщо перевірка належить до FirstTest; Test=2, якщо до SecondTest
    IsRegular: boolean;   // Чи включати дану перевірку в регулярні (лише для --$TEST=1)
    Result: integer;      // По аналогії до ImageIndex: вид блокування. Зчитується з секції --$RESULT та перемножається на sign(qCheck.RecordCount)
    ResultEmpId: integer; // Номер юзера з таблиці [adm_users], який присвоється Main.EMP_ID, при не непройденій перевірці. if =-1 then нічого не змінювати
    Fields: TSalat;       // Параметри. Будуть зчитуватись з секцій "--$"
  end;

var
  frmTestLaunch: TfrmTestLaunch;
  PASSWORD: string='';
  ArrayOfComment : array of String;
  ArrayLength : integer;  // довжина змінної ArrayOfComment
  RecordFocus : integer;  // фокус курсора при перевірці
  Checks: array of TCheck;
  PartItem : integer=1000;
  VagonItem  : integer=1000;
  SRTalonItem : integer=1000;
  RezItem : integer=1000;
  F : Text;
  RecFocused  : boolean;     // стосується змінної RecordFocus
  WriteLog : boolean = False;
  Block, Warning: boolean;
  ResultStr : string;
  qIncassText : string =

' select * from ( '+
' select'+
'  azs_id,'+
'  max(call_date) as call_date,'+
'  max(ch_date) as DateCH'+
' from'+
' ('+
'  select'+
'    azs_id,'+
'    decode(call_type, 1 , date_) as call_date,'+
'    decode(call_type, 7 , date_) as ch_date'+
'  from'+
'    ('+
'      select'+
'       azs_id,'+
'       max(call_date) date_,'+
'       call_type'+
'      from card_modem_call cm, v_card_azs azs'+
'      where azs_id is not null'+
'        and cm.azs_id = azs.id'+
'        and cm.azs_id = azs.inst'+
'        and azs.azsalign = 0'+
'        and cm.call_type in (1,7)'+
'        and cm.azs_id = :p_azs_id'+
'      group by'+
'        azs_id,'+
'        call_type'+
'    )'+
' )'+
'group by azs_id'+
' ) '+
' where call_date >= :p_date_b'+
'   and call_date < :p_date_e';

  qAZSText : string =
'select M.id, M.inst, azs.name || '' '' || azs.par_name as AzsName'+
'  from OIL_AZS_TERMINAL M, v_card_azs azs '+
' where M.id = azs.id and M.inst = azs.inst and M.state = ''Y'' and'+
'       M.wild = ''N'' and azs.emitent_id = ov.getval(''INST'')';

  qFaultText : string =
'select id'+
' from oil_kp_crash'+
' where crash_type=100+:p_ctype and'+
'      :p_sysdate between start_date and end_date and'+
'      state=''Y'' and'+
'      decode(:p_ctype,1,dep_id,2,dep_id,-1)  = decode(:p_ctype,1,:p_azs_id,2,:p_azs_id,-1)';
  qCardModemCallText : string =
'select call_date as ResultTime'+
' from card_modem_call'+
' where call_type=:p_ctype and'+
'      call_date>=:p_date and'+
'      decode(:p_ctype,1,azs_id,2,azs_id,-1)  = decode(:p_ctype,1,:p_azs_id,2,:p_azs_id,-1)'+
' order by 1 desc';

// Если есть дикие АЗС или введен сбой по модемной инк - то требовать инк по карте
  qRequireCardIncassText : string =
'select Var.C as Wild, Var.C+Fault.C as C'+
' from'+
' (select count(*) as C from oil_var where Name=''WILD_AZS_INCASS'' and value <>'''') Var,'+
' (select count(*) as C from oil_kp_crash'+
'  where Crash_Type=101 and State=''Y'' and trunc(sysdate) between start_date and end_date) Fault';

  qPreviousEventText : string =
'select max(D) as D from'+
' (select to_date(:p_now)+to_number(substr(START_TIME,1,2))/24+to_number(substr(START_TIME,4,2))/24/60 as D'+
' from CARD_CHECKUPS'+
' where checkup_id=:p_EventId and Enabled=''Y'''+
' and inst in (select value from oil_var where name = ''INST'' )'+
' union all'+
' select to_date(:p_yest)+to_number(substr(START_TIME,1,2))/24+to_number(substr(START_TIME,4,2))/24/60 as D'+
' from CARD_CHECKUPS'+
' where checkup_id=:p_EventId and Enabled=''Y'''+
' and inst in (select value from oil_var where name = ''INST'' ) )'+
' where D<:p_now';
  qNextEventText : string =
'select to_date(:p_now)+to_number(substr(START_TIME,1,2))/24+to_number(substr(START_TIME,4,2))/24/60 as T1,'+
'   to_date(:p_now)+to_number(substr(WARNING_TIME,1,2))/24+to_number(substr(WARNING_TIME,4,2))/24/60 as T2,'+
'   to_date(:p_now)+to_number(substr(WARNING_TIME,1,2))/24+(to_number(substr(WARNING_TIME,4,2))+to_number(TIME_TO_BLOCK))/24/60 as TimeBlock'+
' from card_checkups where checkup_id=:p_EventId and Enabled=''Y'' and inst in (select value from oil_var where name = ''INST'' ) and ' +
' (:p_now <to_date(:p_now)+to_number(substr(START_TIME,1,2))/24+to_number(substr(START_TIME,4,2))/24/60)'+
' order by 1';
  qNowInIntervalText : string =
'select trunc(sysdate)+to_number(substr(START_TIME,1,2))/24+to_number(substr(START_TIME,4,2))/24/60 as T1,'+
'   trunc(sysdate)+to_number(substr(WARNING_TIME,1,2))/24+to_number(substr(WARNING_TIME,4,2))/24/60 as T2,'+
'   trunc(sysdate)+to_number(substr(WARNING_TIME,1,2))/24+(to_number(substr(WARNING_TIME,4,2))+to_number(TIME_TO_BLOCK))/24/60 as TimeBlock'+
' from card_checkups where checkup_id=:p_EventId and Enabled=''Y''  and inst in (select value from oil_var where name = ''INST'' ) and ' +
' (sysdate >=trunc(sysdate)+to_number(substr(START_TIME,1,2))/24+to_number(substr(START_TIME,4,2))/24/60) and '+
' (sysdate < trunc(sysdate)+to_number(substr(WARNING_TIME,1,2))/24+(to_number(substr(WARNING_TIME,4,2))+to_number(TIME_TO_BLOCK))/24/60)';

implementation

{$R *.DFM}

uses  ExFunc, uDBFunc, uMessageDlgExt, uCheckups, uCrypt, Passw, ExcelFunc,
  TestDB;
//==============================================================================
procedure TfrmTestLaunch.bbtCloseClick(Sender: TObject);
begin
  startlog('В перевірках натиснули "Закрити OIL"',true);
  rmd.Active := False;
  Self.Tag := -1;
  Application.Terminate;
end;
//==============================================================================
function NowIsRestDay : boolean;
var Now_ : TDateTime;
    Hld : string;
Begin
  Now_ := GetSystemDate;
  Hld := ReadOILVar('HOLIDAYS');
  Result := False;
  if (DayOfWeek(Now_) in [1,7]) or (pos(FormatDateTime('dd.mm', Now_), Hld)>0)
     then Result := True;
End;
//==============================================================================
function RightVersion(RealVersion,KeyVersion:string):Boolean;
begin
  result:=CompareVersion(RealVersion,KeyVersion)>=0;
end;
//==============================================================================
function TestVersionCompatible(var Msg : string):integer;
var
  Compatible,OilVer,DBVer,CurOil,CurDB:string;
  slCompatible:TStringList;
  i:integer;
begin
  // Результат 0 - ОК, 1 - Блок, 2 - Предупреждение
  Result := 0;
  Msg := TranslateText('Тест пройден успешно');
  try
    Compatible:=GetVal(ReadOilVar('VERSION_COMPATIBLE'));
    DBVer:=GetVal(ReadOilVar('V_SCR_CHECKUP'));
    OilVer:=Version.FileVersion;
    Str2StringList(Compatible,slCompatible,';');
    for i:=0 to slCompatible.Count-1 do
    begin
      CurDB:=Copy(slCompatible[i],1,pos('-',slCompatible[i])-1);
      CurOil:=Copy(slCompatible[i],pos('-',slCompatible[i])+1,length(slCompatible[i]));
      if DBVer=CurDB then
        if CompareVersion(CurOil,OilVer)=-1 then
          raise Exception.CreateFmt(TranslateText('Данную версию Oil нельзя запускать на текущей версии БД (%s)!'
            +#13#10+'Для запуска обновите версию БД!'),[DBVer]);
    end;
  Except on E:Exception do
    Begin
      Result := 1;
      Msg := E.Message;
    End;
  End;
end;
//==============================================================================
function TestVersionKey(var Msg : string):integer;
var q:TOilQuery;
    Key,KeyVersion:string;
    Today,KeyCommonDate,KeyVersionDate:TDateTime;
begin
  // Результат 0 - ОК, 1 - Блок, 2 - Предупреждение
  Result := 0;
  Msg := TranslateText('Тест пройден успешно');
  try
    q := TOilQuery.Create(nil);
    try
      q.SQL.Text:='select sysdate as today,value from oil_var where name=''VERSION_KEY''';
      q.Open;
      if q.RecordCount=0 then
        Raise Exception.Create(TranslateText('Отсутствует VERSION_KEY. Проверьте правильность установки скриптов'));
      Key:=q.FieldByName('value').AsString;
      Today:=q.FieldByName('today').AsDateTime;
    finally
      q.Free;
    end;
    try
      Key:=Decrypt(crtVersionKey,[Key]);
      KeyCommonDate:=StrToDate(copy(Key,1,10));
      KeyVersionDate:=StrToDate(copy(Key,11,10));
      KeyVersion:=copy(Key,21,length(Key));
    except
      Raise Exception.Create(TranslateText('Неверный формат VERSION_KEY.'));
    end;
    if RightVersion(Version.fileversion,KeyVersion) then
    begin
      if (KeyCommonDate<>StrToDate('01.09.1939')) and (Today>KeyCommonDate) then
        Raise Exception.Create(TranslateText('Время действия текущего ключа истекло.'));
    end
    else
    begin
      if Today>KeyVersionDate then
        Raise Exception.Create(TranslateText('Эта версия безнадежно устарела. Необходимо установить новую версию.'))
      else
      Begin
        Result := 2;
        Msg := TranslateText('Эта версия OIL устарела. Ею можно будет пользоваться до ')+DateToStr(KeyVersionDate);
      End;
    end;
  Except on E:Exception do
    Begin
      Result := 1;
      Msg := E.Message;
    End;
  End;
end;

Function TestNonSyncOrgs(var Msg : string):integer;
var q: TOilQuery;
    Fatal: Boolean;
    s: string;
begin
  Result := 0;
  Msg := TranslateText('Тест пройден успешно');
    q := TOilQuery.Create(nil);
    try
      q.Sql.Text:=' select oo.id,oo.name,osync.date_ '+
                  ' from oil_org_sync osync,v_org oo '+
                  ' where osync.id=oo.id and osync.inst=oo.inst '+
                  '       and osync.state=''Y'' and oo.state=''Y'' '+
                  ' order by date_ ';
      try
      _OpenQuery(q);
      if q.RecordCount>0 then begin
          Fatal:=(q.FieldByName('date_').Value<Date);
          if Fatal then s:=TranslateText('Истек срок синхронизации организаций! Работа Оил заблокирована!')+#13#10
                   else s:=TranslateText('Следующие организации необходимо синхронизировать с одноименными ')+#13#10+TranslateText('организациями, присланными из НК Альфа-Нафта')+#13#10;

          while not q.Eof do begin
              s:=s+#13#10+q.FieldByName('name').AsString+' ('+q.FieldByName('id').AsString+TranslateText(') до ')+q.FieldByName('date_').AsString;
              q.Next;
          end;

          if Fatal then Result := 1
                   else Result := 2;
          Msg := s;
      end;
    finally
      q.Free;
    end;
    except on E:Exception do
      begin
        ShowMessage('uTestLaunch.TestNonSyncOrgs: '+E.Message);
        Result := 1;
      end;
    end;
end;

function TestCheckUpFlag(var Msg : string):integer;
Begin
   Result := 0;
   Msg := TranslateText('Тест пройден успешно');
   if (CheckupStatus.ErrBlock<>'') and not NowIsRestDay then
     begin
       Result := 1;
       Msg := CheckupStatus.ErrBlockMessage;
     end;
End;

function TestCheckUpFlagOnActivate(var Msg : string):integer;
Begin
   Result := 0;
   Msg := TranslateText('Тест пройден успешно');
  if CheckupStatus.ErrWarning<>''
  then Begin
    Result := 2;
    Msg := CheckupStatus.ErrWarningMessage;
  End;
End;

procedure TfrmTestLaunch.AddRecord(ImageIndex: integer; Comment_ : string);
Begin
  rmd.Append;
  rmd.FieldByName('Flag').AsInteger := ImageIndex;
  rmd.FieldByName('Comment_').AsString := Comment_;
  rmd.Post;
  if ImageIndex=0 then startlog('    '+Comment_+' ... ok')
  else startlog('    '+Comment_+TranslateText(' ... ошибка!'));
End;
//==============================================================================
// проверка даты последнего резервного копирования
// Result := 0 - ОК, 1 - блокировка, 2 - предупреждение
function TestBackupFlag(var Msg: string): integer;
  //****************************************************************************
  function IsEnabled(AValue: String): boolean;
  begin
    try
      Result := Copy(AValue, 1, 1) = 'Y';
    except
      Result := true;
    end;  
  end;
  //****************************************************************************
  function GetSmokeDays(AValue: String): Integer;
  begin
    try
      Result := StrToInt(Copy(AValue, 3, 2));
    except
      Result := -1;
    end;  
  end;
  //****************************************************************************
  function GetLastBackupDate(AValue: String): TDate;
  begin
    try
      Result := StrToDate(AValue);
    except
      Result := StrToDate('22.06.1941');
    end;  
  end;
  //****************************************************************************
var
 SBackupTune, SLastBackup: string;
 LastBackupDate: TDate;
begin
  Result := 0;
  Msg := TranslateText('Тест пройден успешно');

  SBackupTune := GetVal(ReadOilVar('BACKUP_TUNE'));
  SLastBackup := GetVal(ReadOilVar('LAST_BACKUP'));
  if (Pos('#', SLastBackup+SBackupTune) <> 0 ) or (SLastBackup = '') or (SBackupTune = '') then
  begin
    Msg := TranslateText('Отсутствуют или не корректные ключи проверки резервного копирования.')+
      TranslateText(' Проверьте правильность установки скриптов');
    Result := 1;
  end
  else
  // если есть ключи в oil_var
  begin
    LastBackupDate := GetLastBackupDate(SLastBackup);
    // если последняя резервная копия раньше чем вчера - предупредить
    if LastBackupDate < GetSystemDate - GetSmokeDays(SBackupTune) then
    begin
      Result := 2;
      Msg := TranslateText('Дата последнего резервного копирования ')+ DateToStr(LastBackupDate) +#13#10;
      if IsEnabled(SBackupTune) then
        Msg := Msg + TranslateText('Произведите резервную копию, иначе завтра будут отключены права пользователей')
      else Result := 0;
    end;
    // если проверка включена и последняя резервная копия раньше чем позавчера - блокировать
    if (LastBackupDate < GetSystemDate - (GetSmokeDays(SBackupTune) + 1)) and (IsEnabled(SBackupTune)) then
    begin
      Result := 1;
      Msg := TranslateText('Дата последнего резервного копирования ')+ DateToStr(LastBackupDate) +#13#10+
        TranslateText('Необходимо произвести резервное копирование БД');
    end;
    if ((DayOfWeek(GetSystemDate) = 2) and (DayOfWeek(LastBackupDate) = 6)) // це понеділок і у п"ятнецю було копіювання бази
      or (DayOfWeek(GetSystemDate) in [1, 7]) // це вихідний день
      or (Pos(FormatDateTime('dd.mm', GetSystemDate), ReadOILVar('HOLIDAYS')) > 0) then // це свято
      Result := 0;
  end;
end;
//==============================================================================
function ActiveCH(p_num: integer): boolean; // активація другорядних перевірок
begin
  if ReadOilVar('CH_SECOND') = '' then result := true
  else
    result :=
      pos(','+ IntToStr(p_num) +',',
          ','+ GetVal(ReadOilVar('CH_SECOND')) +',') > 0;
end;
//==============================================================================
procedure IncArrayLength;
Begin
  inc(ArrayLength);
  SetLength(ArrayOfComment,ArrayLength);
End;
//==============================================================================
function TfrmTestLaunch.IsBlockedFirstTestRegular: boolean;
var ImageIndex, i: integer;
  //*************************************************************
  procedure CheckBlockAndWarning(ChIdx: integer);
  Begin
    if ImageIndex<>0 then
      ResultStr := ResultStr + IntToStr(ChIdx)+',';
    Case ImageIndex of
      1: Block := True;
      2: Warning := True;
      3: begin
           Warning := True;
           RecFocused := true;
           RecordFocus := rmd.RecNo;
         end;
    end;
    if not RecFocused and (ImageIndex > 0) then
      RecordFocus := rmd.RecNo;
  end;
  //*************************************************************
begin
  ResultStr := ',';
  Block := False;
  Warning := False;
  RecFocused := False;
  RecordFocus := 1;
  ArrayLength := 0;
  SetLength(ArrayOfComment,0);
  rmd.EmptyTable;
  rmd.Active := True;

  IncArrayLength;
  ImageIndex := TestVersionKey(ArrayOfComment[ArrayLength-1]);
  CheckBlockAndWarning(-1);
  AddRecord(ImageIndex,TranslateText('Ключ VERSION_KEY'));

  if ActiveCH(1) then
  begin
    IncArrayLength;
    ImageIndex := TestNonSyncOrgs(ArrayOfComment[ArrayLength-1]);
    AddRecord(ImageIndex,TranslateText('Синхронизация организаций'));
    CheckBlockAndWarning(-2);
  end;

  IncArrayLength;
  ImageIndex := TestBackUpFlag(ArrayOfComment[ArrayLength-1]);
  AddRecord(ImageIndex,TranslateText('Резервное копирование'));
  CheckBlockAndWarning(-3);

  IncArrayLength;
  ImageIndex := TestVersionCompatible(ArrayOfComment[ArrayLength-1]);
  CheckBlockAndWarning(-4);
  AddRecord(ImageIndex,TranslateText('Ключ VERSION_COMPATIBLE'));

  if ActiveCH(2) then
  begin
    if LoadChecks(1) then    // динамічні перевірки для FirstTest`a (--$TEST=1) з exe_sql
      for i:=0 to Length(Checks)-1 do
        if Checks[i].IsRegular or not IsRegularOnly then  // при старті Ойла - перевіряти всі
        begin                                           // при регулярних - перевіряються лише перевірки з --$ISREGULAR=1;
          SetLength(ArrayOfComment,Length(ArrayOfComment)+1);
          ArrayOfComment[High(ArrayOfComment)] := IntToStr(i);
          AddRecord(Checks[i].Result,Checks[i].Description);
          ImageIndex := Checks[i].Result;
          CheckBlockAndWarning(Checks[i].CheckIndex);
          if (Checks[i].Result<>0) and (Checks[i].ResultEmpId <> -1) and (Main.EMP_ID <> 0) then
            Main.EMP_ID := Checks[i].ResultEmpId;
        end;
  end;

  if not IsRegularOnly then  // перевіряти лише при старті Ойла
    begin
      {***** АХТУНГ!!! Эта часть проверок должна стоять последней!! *****}
      IncArrayLength;
      ImageIndex := TestCheckUpFlag(ArrayOfComment[ArrayLength-1]);
      AddRecord(ImageIndex,TranslateText('Ошибки в проверках по талонам/карточкам/бланкам'));
      CheckBlockAndWarning(-5);
    end;
  Result := Block or Warning;
end;

//==============================================================================
function FirstTest(var pp_Password: Boolean; p_IsRegularOnly: Boolean = false): Boolean;
var frmTest: TfrmTestLaunch;
Begin
  startlog(TranslateText('  запуск проверок, часть 1...'));
  Result := False;
  Block := False;
  Warning := False;
  _ExecSqlOra('begin ov.ResetOilVar; end;');
  frmTest := TfrmTestLaunch.Create(Application);
  with frmTest do // ImageIndex :=0 - ОК, 1-блокировка, 2-предупреждение
    try
      bbtContinue.Tag := 1;  // FirstTest
      IsRegularOnly := p_IsRegularOnly;

      if IsBlockedFirstTestRegular then
        frmTest.tag := -1;
      pnlPassword.Visible := Block;
      rmd.Filtered := True;  // ховаємо пройдені перевірки по-дефолту
      cbHideGreen.Checked := True;
      frmTest.rmd.RecNo := RecordFocus;

      if not p_IsRegularOnly and Warning or Block then
        ShowModal
      else
        Result := True;

      SetLength(ArrayOfComment,0);

      if ModalResult=mrOk then
        Result := True;
        pp_Password := Block;
        if pp_Password then
          begin
            startlog(TranslateText('  проверки пройдены по паролю'));
            Main.EMP_ID := Main.SUPER_REAL_EMP_ID;
          end
        else
          startlog(TranslateText('  проверки пройдены'));
    finally
      Free;
    end;
end;

Function TfrmTestLaunch.SynchroPart:integer;
Begin
  Result :=0;
try
  qPart.Close;
  qPart.Prepare;
  _OpenQueryParOra(qPart,['p_Days',EXCH_PART_TIME]);
  if qPart.RecordCount > 0
  then if IsObl(Main.INST)
       then if qPart.FieldByName('N').AsFloat <=0
            then Result := 1
            else Result := 2
       else Result := 1;
except on e:Exception do
  begin
    ShowMessage(TranslateText('Ошибка TfrmTestLaunch.SynchroPart: ')+E.Message);
    result := 1;
  end;
end;
End;

Function EventExists(EventId: integer;Azs_id : integer;T : TDateTime;
                     var ResultTime : TDateTime; DaysBack : integer=0):boolean;
// Функция проверяет, существует ли событие номер EventId по АЗС Azs_id
// начиная с даты T (возможно DaysBack дней назад)
// Если существует - в ResultTime заносится ее дата/время
  var p_Date : TDate;
      qCardModemCall : TOilQuery;
Begin
  ResultTime := 0;
  if DaysBack<>0
  then p_Date := PreviousWorkDay(T,DaysBack)
  else p_Date := T;

  qCardModemCall := TOilQuery.Create(nil);
  qCardModemCall.Session := frmStart.OraSession1;
  qCardModemCall.SQL.Text := qCardModemCallText;

  with qCardModemCall do
  Begin
    Close;
    ParamByName('p_ctype').AsInteger := EventId;
    ParamByName('p_date').AsDateTime := p_Date;
    ParamByName('p_azs_id').AsInteger := Azs_id;
    Prepare;
    Open;
    Result := not IsEmpty;
    if not IsEmpty then ResultTime := FieldByName('ResultTime').AsDateTime;
  End;

  FreeAndNil(qCardModemCall);
End;

Function CustomPreviousWorkDay(CurrDay : TDateTime; ActiveDays:string;
                               DaysBack:integer=1;Truncated : boolean=True): TDateTime;
var Hld : string;
    T : TDateTime;
    i : integer;
Begin
  // вытаскиваем список праздников
  Hld := ReadOILVar('HOLIDAYS');
  T := CurrDay;
  if Truncated then T := trunc(CurrDay);
  i:= DaysBack;
  // ищем текущий рабочий день
  while (DayOfWeek(T) in [1,7]) or (pos(FormatDateTime('dd.mm', T), Hld)>0) do T:=T-1;
  while i>0 do
  Begin
    T:=T-1;
    dec(i);
    while (DayOfWeek(T) in [1,7]) or (pos(FormatDateTime('dd.mm', T),Hld)>0) or
          ((ActiveDays<>'') and (Pos(','+IntToStr(DayOfWeek(T))+',',','+ActiveDays+',')=0)) do T:=T-1;
  End;
  Result := T;
End;
// Проверяет, есть ли сбой по событию EventId, DaysBack дней назад
// Для событий 1 и 2 можно задавать по какой АЗС
Function FaultEvent(EventId, Azs_Id : integer;DaysBack:integer=0;ActiveDays:string='';
                    FixedDate:TDateTime=0):boolean;
  var Now_ : TDate;
      qFault : TOilQuery;
Begin
  Now_ := trunc(GetSystemDate);
  case EventId of
    3,4 : Now_ := CustomPreviousWorkDay(GetSystemDate,ActiveDays,DaysBack);
    5,6 : Now_ := FixedDate;
  else if DaysBack<>0 then Now_ := PreviousWorkDay(GetSystemDate,DaysBack);
  End;

  qFault := TOilQuery.Create(nil);
  qFault.Session := frmStart.OraSession1;
  qFault.SQL.Text := qFaultText;
  with qFault do
  Begin
    Close;
    ParamByName('p_ctype').AsInteger := EventId;
    ParamByName('p_sysdate').AsDateTime := Now_;
    ParamByName('p_azs_id').AsInteger := Azs_id;
    Prepare;
    Open;
    Result := not IsEmpty;
  End;
  qFault.Free;
End;

Procedure SetTimer(Tmr, MsgTmr : TRXTimerEvent;T1,T2,TimeBlock:TDateTime;CheckResult:integer);
  var Now_ : TDateTime;
Begin
  with MainForm do Begin
    Now_ := GetSystemDate;
    Tmr.Enabled := False;
    MsgTmr.Enabled := False;
    case checkResult of
      0: if Now_ < T1 then Begin
             MsgTmr.Interval := trunc((T2-Now_)*24*3600*1000);
             MsgTmr.Cycled := False;
             Tmr.Interval := trunc((TimeBlock-Now_)*24*3600*1000);
             Tmr.Enabled := True;
             MsgTmr.Enabled := True;
         End;
      2: if Now_ < T2 then Begin
             MsgTmr.Interval := trunc((T2-Now_)*24*3600*1000);
             MsgTmr.Cycled := False;
             Tmr.Interval := trunc((TimeBlock-Now_)*24*3600*1000);
             Tmr.Enabled := True;
             MsgTmr.Enabled := True;
         End
         else if Now_ < TimeBlock
              then Begin
                 Tmr.Interval := trunc((TimeBlock-Now_)*24*3600*1000);
                 Tmr.Enabled := True;
                 MsgTmr.Interval := MsgTmr.Tag*60*1000;
                 MsgTmr.Cycled := False;
                 MsgTmr.Enabled := True;
              End;
    End;
    if not timPetrol.Active then timPetrol.Activate;
  End;
End;

Procedure GetTimes(EventID : Integer; var T1, T2, BlockTime : TDateTime);
  var qCard : TOilQuery;
      Now_ : TDateTime;
Begin
  qCard := TOilQuery.Create(nil);
  qCard.Session := frmStart.OraSession1;
  qCard.SQL.Text := 'select * from CARD_CHECKUPS where checkup_id='+IntToStr(EventID)+' and inst = '+IntToStr(INST);
  qCard.Open;
    Now_ := GetSystemDate;
    T1 := trunc(Now_) +
          StrToInt(Copy(qCard.FieldByName('START_TIME').AsString,1,
                   Pos(':',qCard.FieldByName('START_TIME').AsString)-1))/24+
          StrToInt(Copy(qCard.FieldByName('START_TIME').AsString,
                   Pos(':',qCard.FieldByName('START_TIME').AsString)+1,2))/24/60;
    T2 := trunc(Now_) +
          StrToInt(Copy(qCard.FieldByName('WARNING_TIME').AsString,1,
                   Pos(':',qCard.FieldByName('WARNING_TIME').AsString)-1))/24+
          StrToInt(Copy(qCard.FieldByName('WARNING_TIME').AsString,
                   Pos(':',qCard.FieldByName('WARNING_TIME').AsString)+1,2))/24/60;
    BlockTime := trunc(Now_) +
          StrToInt(Copy(qCard.FieldByName('WARNING_TIME').AsString,1,
                   Pos(':',qCard.FieldByName('WARNING_TIME').AsString)-1))/24+
          StrToInt(Copy(qCard.FieldByName('WARNING_TIME').AsString,
                   Pos(':',qCard.FieldByName('WARNING_TIME').AsString)+1,2))/24/60+
                   qCard.FieldByName('TIME_TO_BLOCK').AsInteger/24/60;
  qCard.Free;
End;

Function AZS_with_GSM_Modem(AZS_ID : integer):boolean;
Begin
  Result := Pos(','+IntToStr(AZS_ID-1000000)+',',Main.AZS_WITH_GSM)>0;
End;

Function SuccessIncass(var Msg: string):integer;
  var Now_, Yest, Yest2, T1, T2, TimeBlock : TDateTime;
      BlockMsg, WarnMsg, Comment_ : string;
      qAZS, qIncass : TOilQuery;
Procedure CheckYesterdayIncass;
Begin
   if not FaultEvent(1, qAZS.FieldByName('id').AsInteger,1)
   then Begin
     qIncass.Close; // Найти дату последней вчерашней инкассации D_i и дату соотв. ЧС D_ch
     qIncass.ParamByName('p_date_b').AsDateTime := Yest + T1-trunc(T1);
     qIncass.ParamByName('p_date_e').AsDateTime := trunc(Now_);
     qIncass.ParamByName('p_azs_id').AsInteger := qAZS.FieldByName('id').AsInteger;
     qIncass.Prepare;
     qIncass.Open;
     // Если вчера не было инкасации или была, но с устаревшим ЧС - блок
     if qIncass.IsEmpty or
        not qIncass.IsEmpty and not FaultEvent(7,0,2) and
        not (((Yest2 + T1-trunc(T1))<qIncass.FieldByName('DateCH').AsDateTime) and
               (qIncass.FieldByName('DateCH').AsDateTime<qIncass.FieldByName('call_date').AsDateTime)) and
        not AZS_WITH_GSM_Modem(qAZS.FieldByName('id').AsInteger)
     then Begin // Если вчера не было инкассации - заблокировать права
       Result := 1;
       BlockMsg := BlockMsg +#13#10+' - '+qAZS.FieldByName('AzsName').AsString;
     End;
   end;
End;
Begin
  // Результат 0 - ОК, 1 - Блок, 2 - Предупреждение
  Result := 0;
  Msg := ''; WarnMsg := ''; BlockMsg := '';
  Now_ := GetSystemDate;
  Yest := PreviousWorkDay(Now_);
  Yest2 := PreviousWorkDay(Now_,2);
  qIncass := TOilQuery.Create(nil);
  qIncass.Session := frmStart.OraSession1;
  qIncass.SQL.Text := qIncassText;

  qAZS := TOilQuery.Create(nil);
  qAZS.Session := frmStart.OraSession1;
  qAZS.SQL.Text := qAZSText;
  qAZS.Open;

  GetTimes(1,T1,T2,TimeBlock);

  while not qAZS.Eof do
  Begin
    if not FaultEvent(1, qAZS.FieldByName('id').AsInteger) then
       if Now_ < T1
       then CheckYesterdayIncass
       else Begin
         qIncass.Close; // Найти дату последней сегодняшней инкассации D_i и дату соотв. ЧС D_ch
         qIncass.ParamByName('p_date_b').AsDateTime := T1;
         qIncass.ParamByName('p_date_e').AsDateTime := trunc(Now_)+1;
         qIncass.ParamByName('p_azs_id').AsInteger := qAZS.FieldByName('id').AsInteger;
         qIncass.Prepare;
         qIncass.Open;
         if qIncass.IsEmpty or
            not qIncass.IsEmpty and not FaultEvent(7,0,1) and
            not ((qIncass.FieldByName('DateCH').AsDateTime>(Yest + T1-trunc(T1)))  ) and
//            (qIncass.FieldByName('DateCH').AsDateTime<=qIncass.FieldByName('call_date').AsDateTime)) and
            not AZS_WITH_GSM_Modem(qAZS.FieldByName('id').AsInteger)
         then Begin
              if qIncass.IsEmpty
              then Comment_ := TranslateText('Не было инкассации')
              else if not (qIncass.FieldByName('DateCH').AsDateTime>(Yest + T1-trunc(T1)))
                   then Comment_ := TranslateText('Устаревший черный список')
                   else if not (qIncass.FieldByName('DateCH').AsDateTime<=qIncass.FieldByName('call_date').AsDateTime)
                        then Comment_ := TranslateText('Дата ЧС больше даты инкассации(неправильно установлено системное время)')
                        else Comment_ := '';

              if Now_ < TimeBlock
              then Begin
                 if Result =0 then Result := 2;
                 WarnMsg := WarnMsg + #13#10 +qAZS.FieldByName('AzsName').AsString;
                 WarnMsg := WarnMsg + #13#10 + '     '+Comment_;
              End
              else Begin
                 Result := 1;
                 BlockMsg := BlockMsg +#13#10+' - '+qAZS.FieldByName('AzsName').AsString;
                 WarnMsg := WarnMsg + #13#10 + '     '+Comment_;
              End;
         End;
       End;
    qAZS.Next;
  End;

  case Result of
    0: Msg := TranslateText('Тест пройден успешно');
    1: Begin
       Main.EMP_ID := 0;
       Main.REAL_EMP_ID := 0;
       MainForm.ProcessMainMenu;
       Msg := TranslateText('Не произведена инкассация терминалов на перечисленных точках обслуживания :')+
              BlockMsg +#13#10+
              TranslateText('Необходимо инкассировать терминалы (с обновленным черным списком ЧС)')+
              TranslateText('ЧС должен быть сформирован не ранее 15:30 предыдущего рабочего дня')+
              #13#10+TranslateText('Заблокированы все права пользователя');
       End;
    2: Msg := TranslateText('Не произведена инкассация терминалов на перечисленных точках обслуживания :')+
              WarnMsg +#13#10+
              TranslateText('Необходимо инкассировать терминалы (с обновленным черным списком))')+
              TranslateText('ЧС должен быть сформирован не ранее 15:30 предыдущего рабочего дня');
  End;
  SetTimer(MainForm.teSuccIncass, MainForm.teSuccIncassMsg,T1,T2,TimeBlock,Result);
  qAZS.Free;
  qIncass.Free;
End;

Function LoadModemTrans(var Msg : string):integer;
  var Now_, Yest, T1, T2, TimeBlock, EventTime : TDateTime;
      qAZS : TOilQuery;
      BlockMsg, WarnMsg : string;
      E : boolean;
Begin
  Result := 0;
  Msg := ''; WarnMsg := ''; BlockMsg := '';
  Now_ := GetSystemDate;

  qAZS := TOilQuery.Create(nil);
  qAZS.Session := frmStart.OraSession1;
  qAZS.SQL.Text := qAZSText;
  qAZS.Open;

  GetTimes(2,T1,T2,TimeBlock);
  Yest := PreviousWorkDay(T1);

  while not qAZS.Eof do
  Begin
    if not FaultEvent(2, qAZS.FieldByName('id').AsInteger) then
       if Now_ < T1
       then if not FaultEvent(2, qAZS.FieldByName('id').AsInteger,1)
            then Begin
                 E := EventExists(2,qAZS.FieldByName('id').AsInteger,T1, EventTime,1);
                 if not E or (trunc(EventTime)< Yest)
                 then Begin
                   Result := 1;
                   BlockMsg := BlockMsg +#13#10+' - '+qAZS.FieldByName('AzsName').AsString;
                 End
            End
            else Begin End
       else if not EventExists(2,qAZS.FieldByName('id').AsInteger,T1, EventTime)
            then if Now_ >= TimeBlock
                 then Begin
                   Result := 1;
                   BlockMsg := BlockMsg +#13#10+' - '+qAZS.FieldByName('AzsName').AsString;
                 End
                 else Begin
                   if Result =0 then Result := 2;
                   WarnMsg := WarnMsg + #13#10 +qAZS.FieldByName('AzsName').AsString;
                   if not FaultEvent(2, qAZS.FieldByName('id').AsInteger,1)
                   then Begin
                        E := EventExists(2,qAZS.FieldByName('id').AsInteger,T1, EventTime,1);
                        if not E or (trunc(EventTime)< Yest)
                         then Begin
                             Result := 1;
                             BlockMsg := BlockMsg +#13#10+' - '+qAZS.FieldByName('AzsName').AsString;
                         End
                   End;
                 End;
    qAZS.Next;
  End;
  case Result of
    0: Msg := TranslateText('Тест пройден успешно');
    1: Begin
       Main.EMP_ID := 0;
       Main.REAL_EMP_ID := 0;
       MainForm.ProcessMainMenu;
       Msg := TranslateText('Из перечисленных точек обслуживания не загружены')+#13#10+
              TranslateText('транзакции в программу Петрол')+
              BlockMsg +#13#10+
              TranslateText('После модемной инкассации необходимо загрузить транзакции в Петрол.')+
              #13#10+TranslateText('Заблокированы все права пользователя');
       End;
    2: Msg := TranslateText('Из перечисленных точек обслуживания не загружены')+#13#10+
              TranslateText('транзакции в программу Петрол')+
              WarnMsg +#13#10+
              TranslateText('После модемной инкассации необходимо загрузить транзакции в Петрол.');
  End;
  SetTimer(MainForm.teLoadModemTrans, MainForm.teLoadModemTransMsg,T1,T2,TimeBlock,Result);
  qAZS.Free;

End;

Function CardTrans(Event_Id: integer;var Msg : string):integer;
  var Now_, Yest, T1, T2, TimeBlock: TDateTime;
      q : TOilQuery;
      Card_Kit : integer;
      BlockMsg, WarnMsg, ActiveDays : string;
      Tmp : variant;
      WildExists : boolean;
Function EventCount(T1:TDateTime):integer;
Begin
  q.Close;
  q.SQL.Text := 'select count(*) as C from card_modem_call where call_type='+
                IntToStr(Event_Id)+' and call_date>:T1';
  q.ParamByName('T1').AsDateTime := T1;
  q.Prepare;
  q.Open;
  Result := q.FieldByName('C').AsInteger;
End;
Begin
  Result := 0;
  Msg := ''; WarnMsg := ''; BlockMsg := '';

  Now_ := GetSystemDate;
  q := TOilQuery.Create(nil);
  q.Session := frmStart.OraSession1;
  q.SQL.Text := qRequireCardIncassText;
  q.Open;
  WildExists := q.FieldByName('Wild').AsInteger > 0;
  // Если нет диких АЗС-ок и на сегодня нет сбоев по модемной икассации
  // то ничего требовать не надо
  if (q.FieldByName('C').AsInteger = 0) or FaultEvent(Event_Id,0)
  then Begin
    q.Free;
    Msg := TranslateText('Тест пройден успешно');
    Exit;
  End;

  // Найти кол-во комплектов инкасс. карт
  Card_Kit := StrToInt('0'+GetVal(ReadOILVar('CARD_KIT')));

  // Вытянуть дни недели, когда надо требовать инкассацию
  ActiveDays := '';
  Tmp := GetSQLValue('select ACTIVE_DAYS from card_checkups where checkup_id='+IntToStr(Event_Id)+' and inst='+IntToStr(INST));
  if not VarIsNull(Tmp) then ActiveDays := Tmp;

  GetTimes(Event_Id,T1,T2,TimeBlock);

  Yest := CustomPreviousWorkDay(T1,ActiveDays,1,False);

   if Now_ < T1
   then if not FaultEvent(Event_Id,0,1,ActiveDays) and
           not (EventCount(Yest)>=Card_Kit) and WildExists
        then Result := 1
        else Begin End
   else if not (EventCount(T1)>=Card_Kit)
        then if Now_ >= TimeBlock
             then Result := 1
             else Begin
               if Result =0 then Result := 2;
               if not FaultEvent(Event_Id,0,1,ActiveDays) and
                  not (EventCount(Yest)>=Card_Kit) and WildExists
               then Result := 1
             End;

  case Result of
    0: Msg := TranslateText('Тест пройден успешно');
    1: Begin
       Main.EMP_ID := 0;
       Main.REAL_EMP_ID := 0;
       MainForm.ProcessMainMenu;
       if Event_Id = 3 then Msg := TranslateText('Не все комплекты карт инкассированы !')
                       else Msg := TranslateText('Не на все комплекты карт сброшен черный список !')
       End;
    2: if Event_Id = 3 then Msg := TranslateText('Не все комплекты карт инкассированы !')
                       else Msg := TranslateText('Не на все комплекты карт сброшен черный список !')

  End;
  if Result =1 then Msg := Msg + #13#10+TranslateText('Заблокированы все права пользователя');

  if Event_Id = 3
  then SetTimer(MainForm.teLoadCardTrans, MainForm.teLoadCardTransMsg,T1,T2,TimeBlock,Result)
  else SetTimer(MainForm.tePutBlackList, MainForm.tePutBlackListMsg,T1,T2,TimeBlock,Result);

  q.Free;

End;

Function FindPreviousEvent(EventId : integer;Now_ : TDateTime):TDateTime;
  var q : TOilQuery;
      Yest : TDateTime;
Begin
  Result := Now_-1;
  Yest := PreviousWorkDay(Now_);
  q := TOilQuery.Create(nil);
  q.Session := frmStart.OraSession1;
  q.SQL.Text := qPreviousEventText;
  q.ParamByName('p_now').AsDateTime := Now_;
  q.ParamByName('p_EventId').AsInteger := EventId;
  q.ParamByName('p_yest').AsDateTime := Yest;
  q.Prepare;
  q.Open;
  if not q.IsEmpty then Result := q.FieldByName('D').AsDateTime;
  q.Free;
End;

Function PCExchange(EventId : integer; var Msg : string):integer;
  var Now_, T, T1, T2, TimeBlock, EventTime : TDateTime;
      q : TOilQuery;
Begin
  Result := 0;
  Msg := '';

  Now_ := GetSystemDate;

  if not FaultEvent(EventId,0,0,'',trunc(Now_)) then
  begin
    q := TOilQuery.Create(nil);
    q.Session := frmStart.OraSession1;
    q.SQL.Text := qNowInIntervalText;
    q.ParamByName('p_EventId').AsInteger := EventId;
    q.Prepare;
    q.Open;
    if q.IsEmpty then
    begin
      T := FindPreviousEvent(EventId,Now_);
      if not FaultEvent(EventId,0,0,'',trunc(T)) and
         not EventExists(EventId,0,T,EventTime)
      then Result := 1;
    end
    else
    begin
      T1 := q.FieldByName('T1').AsDateTime;
      T2 := q.FieldByName('T2').AsDateTime;
      TimeBlock := q.FieldByName('TimeBlock').AsDateTime;
      if not EventExists(EventId,0,T1,EventTime) and (Result =0)then
      begin
        Result :=2;
        T := FindPreviousEvent(EventId,T1);
        if not FaultEvent(EventId,0,0,'',trunc(T)) and
           not EventExists(EventId,0,T,EventTime)
        then Result := 1;
      end;
    end;
    if Result=0 then
    begin
      q.Close;
      q.SQL.Text := qNextEventText;
      q.ParamByName('p_Now').AsDateTime := Now_;
      q.ParamByName('p_EventId').AsInteger := EventId;
      q.Prepare;
      q.Open;
      if not q.IsEmpty then
      begin
        T1 := q.FieldByName('T1').AsDateTime;
        T2 := q.FieldByName('T2').AsDateTime;
        TimeBlock := q.FieldByName('TimeBlock').AsDateTime;
      end;
    end;
    q.Free;
  end;

  case Result of
    0: Msg := TranslateText('Тест пройден успешно');
    1:
      begin
        Main.EMP_ID := 0;
        Main.REAL_EMP_ID := 0;
        MainForm.ProcessMainMenu;
        if EventId = 5 then
          Msg := TranslateText('Не приняты пакеты из ПЦ !')
        else
          Msg := TranslateText('Не отправлены пакеты в ПЦ !');
      end;
    2:
      if EventId = 5 then
        Msg := TranslateText('Не приняты пакеты из ПЦ !')
      else
        Msg := TranslateText('Не отправлены пакеты в ПЦ !');

  end;
  if Result = 1 then
    Msg := Msg + #13#10+TranslateText('Заблокированы все права пользователя');

  if EventId = 5 then
    SetTimer(MainForm.teLoadPackPC, MainForm.teLoadPackPCMsg, T1, T2, TimeBlock, Result)
  else SetTimer(MainForm.teSendPackPC, MainForm.teSendPackPCMsg, T1, T2, TimeBlock, Result);
End;

Function MakeBlackList(var Msg:string):integer;
  var Now_, Yest, T1, T2, TimeBlock, EventTime : TDateTime;
Begin
  Result := 0;
  Msg := '';
  Now_ := GetSystemDate;
  GetTimes(7,T1,T2,TimeBlock);
  Yest := PreviousWorkDay(T1);
  if not FaultEvent(7,0) then
  begin
    if Now_ < T1 then
    begin
      if not FaultEvent(7,0,1) then
        if not EventExists(7,0,T1,EventTime,1) or (trunc(EventTime)< Yest)then
          Result := 1;
    end
    else if not EventExists(7,0,T1,EventTime)then
    begin
      if Now_ > TimeBlock then
        Result := 1
      else
      begin
        if Result =0 then
          Result := 2;
        if not EventExists(7,0,T1,EventTime,1) or (trunc(EventTime)< Yest)then
          Result := 1;
      end;
    end;
  end;
  case Result of
    0:Msg := TranslateText('Тест пройден успешно');
    1:
      Begin
        Main.EMP_ID := 0;
        Main.REAL_EMP_ID := 0;
        MainForm.ProcessMainMenu;
        Msg := TranslateText('Необходимо создать черный список для модема!');
      end;
    2:Msg := TranslateText('Необходимо создать черный список для модема!');
  End;
  if Result =1 then
    Msg := Msg + #13#10+TranslateText('Заблокированы все права пользователя');
  SetTimer(MainForm.teMakeBlackList, MainForm.teMakeBlackListMsg,T1,T2,TimeBlock,Result);
End;

Function LinkComServer(var Msg:string):integer;
  var Pause_ : real;
      TimerInterval : integer;
      Now_, T1, T2, TimeBlock : TDateTime;
      q : TOilQuery;
Begin
  Result := 0;
  Msg := '';

  Now_ := GetSystemDate;

  q := TOilQuery.Create(nil);
  try
  q.Session := frmStart.OraSession1;
  q.SQL.Text := 'select * from card_checkups where checkup_id=8 and Enabled=''Y'' and inst = '+IntToStr(INST);
  q.Open;

  if not FaultEvent(8,0) and not q.IsEmpty
  then Begin
     GetTimes(8,T1,T2,TimeBlock);
     TimerInterval := q.FieldByName('WARNING_QUANTITY').AsInteger;
     if (Now_>=T1) and (Now_<T2)
     then Begin
       Pause_ := GetSQLValue('select (sysdate-to_date(value,''dd.mm.yyyy hh24:mi:ss''))*24*60 from oil_var where name=''LINKCOMSERVER''');
       if Pause_>=30
       then if Pause_>60 then Result :=1
                         else Result :=2;
        with MainForm do
          case Result of
          0,2: Begin
                  if Now_ < T2 then Begin
                     teRunComServerMsg.Interval := trunc(TimerInterval*60000);
                     teRunComServerMsg.Cycled := True;
                     teRunComServerMsg.Enabled := True;
                  End
                  else if Result=0 then teRunComServerMsg.Enabled := False;
               End;
            1: teRunComServerMsg.Enabled := False;
          End;
        if not MainForm.timPetrol.Active then MainForm.timPetrol.Activate;
     End;
  End;
  case Result of
    0: Msg := TranslateText('Тест пройден успешно');
    1: Begin
       Main.EMP_ID := 0;
       Main.REAL_EMP_ID := 0;
       MainForm.ProcessMainMenu;
       Msg := TranslateText('Необходимо запустить программу LinkComServer!')+#13#10+
              TranslateText('Отключены все права пользователя') ;
       End;
    2: Msg := TranslateText('Необходимо запустить программу LinkComServer!');
  End;
  finally
    FreeAndNil(q);
  end;  
End;

function SecondTest: boolean;
var ImageIndex, EMP, i : integer;
    frmTest : TfrmTestLaunch;

  procedure CheckBlockAndWarning(CheckIndex : integer);
  Begin
    if (ImageIndex in [1,3]) and (Main.EMP_ID<>0) then  //1-блок; 3-червоний трикутник
      begin
        case CheckIndex of
          2,3: Main.EMP_ID := 0;         //вигрузка пакетів та перевірки
          4,7: if IsObl(Main.Inst) then  //синхр. партій та вагонів
                 MainForm.miReports.Enabled := False
               else
                 Main.EMP_ID := 0;
          5:   Main.EMP_ID := 7;         //дані по дебіторам
          6,8: Main.EMP_ID := 6;         //зм.звіти та ціни конкурентів
          10:  Main.EMP_ID := 0;         //заведені трубопроводи в резервуарах
        end;
        ResultStr := ResultStr + IntToStr(CheckIndex)+',';
      end;
    Block := Block or (ImageIndex=1);
    Warning := Warning or (ImageIndex in [2,3]);
    if ImageIndex = 3 then
      begin
        RecFocused := true;
        RecordFocus := frmTest.rmd.RecNo;
      end
    else if not RecFocused and (ImageIndex > 0) then
      RecordFocus := frmTest.rmd.RecNo;
  end;

Begin
  startlog(TranslateText('  запуск проверок, часть 2...'));
  if NowIsRestDay then begin
    startlog(TranslateText('  работа в выходной день, проверки пройдены'));
    Exit;
  end;
  ResultStr := ',';
  Block := False;
  Warning := False;
  RecFocused := False;
  Result := True;
  RecordFocus := 1;
  EMP := REAL_EMP_ID;

  try
    frmTest := TfrmTestLaunch.Create(nil);
    with frmTest do Begin
      bbtContinue.Tag := 2;   //SecondTest
      IsRegularOnly := True;  // щоб не ковбасило при натисненні "Продовжити" на другому етапі тесту.
      pnlWithCloseButton.Visible := False;
      ArrayLength := 0;
      // тимчасово вирубаємо оневенти
      dsRMD.OnDataChange := nil;
      dsVagon.OnDataChange := nil;
      dsPart.OnDataChange := nil;
      dsRez.OnDataChange := nil;

      rmd.Active := True;       

      IncArrayLength;
      ImageIndex := TestCheckUpFlagOnActivate(ArrayOfComment[ArrayLength-1]);
      CheckBlockAndWarning(1);
      AddRecord(ImageIndex,TranslateText('Ошибки в проверках по талонам/карточкам/бланкам'));

      if ActiveCH(3) then
      begin
        IncArrayLength;
        ImageIndex := SetPacketTimer(ArrayOfComment[ArrayLength-1],True);
        AddRecord(ImageIndex,TranslateText('Выгрузка пакетов из OIL-а'));
        CheckBlockAndWarning(2);
      end;

      IncArrayLength;
      ImageIndex := CheckUpIsTooOld(ArrayOfComment[ArrayLength-1]);
      AddRecord(ImageIndex,TranslateText('Построение проверок по талонам/карточкам/бланкам'));
      CheckBlockAndWarning(3);

      if ActiveCH(4) then
      begin
        IncArrayLength;
        ArrayOfComment[ArrayLength-1] := '';
        ImageIndex := SynchroPart;
        PartItem := ArrayLength-1;
        AddRecord(ImageIndex,TranslateText('Синхронизация партий'));
        CheckBlockAndWarning(4);
      end;

      if ActiveCH(5) then
      begin
        IncArrayLength;
        ImageIndex := DebetorIsTooOld(ArrayOfComment[ArrayLength-1]);
        AddRecord(ImageIndex,TranslateText('Данные по дебеторам'));
        CheckBlockAndWarning(5);
      end;

      if ActiveCH(6) then
      begin
        IncArrayLength;
        ImageIndex := DailyRepControl(ArrayOfComment[ArrayLength-1],true);
        AddRecord(ImageIndex,TranslateText('Ввод см. отчетов и цен конкурентов'));
        CheckBlockAndWarning(6);
      end;

      if ActiveCH(7) then
      begin
        IncArrayLength;
        ImageIndex := TestVagons;
        VagonItem := ArrayLength-1;
        AddRecord(ImageIndex,TranslateText('Синхронизация вагонов'));
        CheckBlockAndWarning(7);
      end;

      if ActiveCH(8) then
      begin
        IncArrayLength;
        ImageIndex := TestSRTalons;
        SRTalonItem := ArrayLength-1;
        AddRecord(ImageIndex,TranslateText('Сменный отчет - талоны без номеров и серий'));
        CheckBlockAndWarning(8);
      end;

      if ActiveCH(9) then
      begin
        IncArrayLength;
        ArrayOfComment[ArrayLength-1] := '';
        ImageIndex := TestTubingsInRez;
        RezItem := ArrayLength-1;
        AddRecord(ImageIndex,TranslateText('Проверка заведённых трубопроводов в резервуарах'));
        CheckBlockAndWarning(10);
      end;

      if ActiveCH(10) then
      begin
        if LoadChecks(2) then
          for i:=0 to Length(Checks)-1 do
          begin
            SetLength(ArrayOfComment,Length(ArrayOfComment)+1);
            ArrayOfComment[High(ArrayOfComment)] := IntToStr(i);
            AddRecord(Checks[i].Result,Checks[i].Description);
            ImageIndex := Checks[i].Result;
            CheckBlockAndWarning(Checks[i].CheckIndex);
            if (Checks[i].Result<>0) and (Checks[i].ResultEmpId <> -1) and (Main.EMP_ID <> 0) then
              Main.EMP_ID := Checks[i].ResultEmpId;
          end;
      end;

      if DBObjectExists('ecfil139','TABLE',AdmSettings.Get('CARD_USER')) or DBObjectExists('ТРАНЗАКЦИИ','') then    // *NO_TRANSLATE*
      Begin
          startlog(TranslateText('    зафиксирован Петрол'));
          _OpenQueryParOra(qCard,['inst',INST]);
          while not qCard.Eof do
          Begin
              if qCard.FieldByName('id').AsInteger in [1..6,8] then IncArrayLength;
              case qCard.FieldByName('id').AsInteger of
                1: if ActiveCH(11) then begin
                   MainForm.teSuccIncassMsg.Tag := qCard.FieldByName('WARNING_QUANTITY').AsInteger;
                   ImageIndex := SuccessIncass(ArrayOfComment[ArrayLength-1]);
                   AddRecord(ImageIndex,TranslateText('Успешная модемная инкассация терминалов'));
                   End;
                2: if ActiveCH(12) then begin
                   MainForm.teLoadModemTransMsg.Tag := qCard.FieldByName('WARNING_QUANTITY').AsInteger;
                   ImageIndex := LoadModemTrans(ArrayOfComment[ArrayLength-1]);
                   AddRecord(ImageIndex,TranslateText('Прием модемных транзакций в Петрол'));
                   End;
                3: if ActiveCH(13) then begin
                   MainForm.teLoadCardTransMsg.Tag := qCard.FieldByName('WARNING_QUANTITY').AsInteger;
                   ImageIndex := CardTrans(3,ArrayOfComment[ArrayLength-1]);
                   AddRecord(ImageIndex,TranslateText('Прием транзакций с карты'));
                   End;
                4: if ActiveCH(14) then begin
                   MainForm.tePutBlackListMsg.Tag := qCard.FieldByName('WARNING_QUANTITY').AsInteger;
                   ImageIndex := CardTrans(4,ArrayOfComment[ArrayLength-1]);
                   AddRecord(ImageIndex,TranslateText('Сброс черного списка на карту'));
                   End;
                5: if ActiveCH(15) then begin
                   MainForm.teLoadPackPCMsg.Tag := qCard.FieldByName('WARNING_QUANTITY').AsInteger;
                   ImageIndex := PCExchange(5,ArrayOfComment[ArrayLength-1]);
                   AddRecord(ImageIndex,TranslateText('Прием пакетов из ПЦ'));
                   End;
                6: if ActiveCH(16) then begin
                   MainForm.teSendPackPCMsg.Tag := qCard.FieldByName('WARNING_QUANTITY').AsInteger;
                   ImageIndex := PCExchange(6,ArrayOfComment[ArrayLength-1]);
                   AddRecord(ImageIndex,TranslateText('Отправка пакетов в ПЦ'));
                  End;
  //              7:Begin
  //                 MainForm.teMakeBlackListMsg.Tag := qCard.FieldByName('WARNING_QUANTITY').AsInteger;
  //                 ImageIndex := MakeBlackList(ArrayOfComment[ArrayLength-1]);
  //                 AddRecord(ImageIndex,'Создание ЧС для модемной инкассации');
  //                End;
                8: if ActiveCH(17) then begin
                   ImageIndex := LinkComServer(ArrayOfComment[ArrayLength-1]);
                   AddRecord(ImageIndex,TranslateText('Проверка загрузки программы LinkComServer'));
                  End;
              End;
              CheckBlockAndWarning(7);
              qCard.Next;

          End;
        End; 
      // відновлюємо оневенти
      dsRMD.OnDataChange := dsRMDDataChange;
      dsVagon.OnDataChange := dsRMDDataChange;
      dsPart.OnDataChange := dsRMDDataChange;
      dsRez.OnDataChange := dsRMDDataChange;

      rmd.Filtered := True;  // ховаємо пройдені перевірки по-дефолту
      cbHideGreen.Checked := True;

      rmd.RecNo := RecordFocus;

      if Block or Warning then ShowModal;
      if frmTest.tag = -1 then Result := False;
      SetLength(ArrayOfComment,0);
      Close;
      Free;
      {если user=admin то вне того как все вышестоящие провероки прошли он все}
      {равно оставляет права Admin'а                                          }
      if (EMP=1) and (Main.EMP_ID=0) then
        Begin
          Main.EMP_ID := 1;
          Main.REAL_EMP_ID := 1;
        End;
      {если ошибки завершились блокированием при любом юзере, то логин }
      {пройдет на пользователя который имеет права на редактирование Договоров/Партий/Приходов/Резервуаров }
      if Main.EMP_ID=0 then
        begin
          Main.EMP_ID := 8;
          Main.REAL_EMP_ID := 8;
        end;
    End; //with do
    MainForm.Admining(MainForm,EMP_ID);
    MainForm.ProcessMainMenu;
    startlog(TranslateText('  проверки пройдены'));
  except on E:Exception do
    begin
      ShowMessage(TranslateText('Ошибка при формировании статуса проверок')+#13#10+E.Message+#13#10+
      TranslateText('Обратитесь к разработчикам. Все права заблокированы. '));
      startlog(TranslateText('  в процессе произошла ошибка ')+E.Message);
      Application.Terminate;
    end;
  end;
end;

procedure TfrmTestLaunch.bbtContinueClick(Sender: TObject);
var
  SAddStr : String;
  PasswType : TOilPasswordType;
begin
  _ExecSqlOra('begin ov.ResetOilVar; end;');
  {вычислить номера заблокированных проверок}
  cbHideGreen.Checked := False;  {імітація кліка на галочку}
  rmd.DisableControls;
  rmd.First;
  sAddStr := '';
  while rmd.RecNo < rmd.RecordCount do  // останній рядок - рядок перевірок по талонам/карткам/бланкам. Його не враховуємо
  begin
    if (rmd.FieldByName('flag').AsInteger = 1)
      then SAddStr := SAddStr + IntToStr(rmd.RecNo);
    rmd.Next;
  end;
  if IsRegularOnly then  // при регулярних перевірках перевіряємо всі без винятку рядки
    if (rmd.FieldByName('flag').AsInteger = 1)
      then SAddStr := SAddStr + IntToStr(rmd.RecNo);
  rmd.EnableControls;
  {}
  if GetVal(ReadOilVar('SMART_PASSW')) = 'Y'
    then  PasswType := pwtTestLaunch
    else  PasswType := pwtOrg;

  if bbtContinue.Tag=1 then
    begin
      IsBlockedFirstTestRegular;
      if Block and not IsPasswordValid(edtPassword.text,PasswType,SAddStr) then
        begin   // bbtContinue.Tag=1 - поточний етап: FirstTest
          cbHideGreen.Checked := True;
          ShowMessage(TranslateText('Неверный пароль!'));
          exit;
        end;
      PASSWORD := edtPassword.Text;
    end;
  Self.Tag := 0;
  ModalResult := mrOK;
end;

procedure TfrmTestLaunch.dsRMDDataChange(Sender: TObject;
  Field: TField);
begin
  if Length(ArrayOfComment)>0 then
    if rmd.RecNo-1 = PartItem then
      Notebook1.ActivePage := 'Part'
    else if rmd.RecNo-1 = VagonItem then
      Notebook1.ActivePage := 'VagonGrid'
    else if rmd.recNo-1 = SrTalonItem then
      Notebook1.ActivePage := 'SrTalon'
    else if rmd.RecNo-1 = RezItem then
      NoteBook1.ActivePage := 'TubRez'
    else if (length(ArrayOfComment[rmd.RecNo-1]) <> 0) and
            (ArrayOfComment[rmd.RecNo-1][1] in ['0'..'9']) then
      begin
        NoteBook1.ActivePage := 'CheckList';
        dsCheckList.DataSet := Checks[StrToInt(ArrayOfComment[rmd.RecNo-1])].qCheck;
        dbgCheck.Hint := Checks[StrToInt(ArrayOfComment[rmd.RecNo-1])].Description;
        dbgCheck.Columns.AddAllColumns(true);
      end
    else
      begin
        Notebook1.ActivePage := 'Memo';
        redComment.Text := ArrayOfComment[rmd.RecNo-1];
      end;
end;

procedure TfrmTestLaunch.FormShow(Sender: TObject);
begin
  if GetVal(ReadOilVar('SMART_PASSW')) = 'Y'
    then StatusBar1.Panels[0].Text := 'Smart'
    else StatusBar1.Panels[0].Text := 'Org'
end;
// Результат 0 - ОК, 1 - Блок, 2 - Предупреждение
function TfrmTestLaunch.TestVagons: integer;
var
 IVagonTime : integer;
begin
  Result :=0;
  try
    if ReadOilVar('EXCH_VAGON_TIME') <> ''
      then IVagonTime := GetVal(ReadOilVar('EXCH_VAGON_TIME'))
      else raise Exception.Create(TranslateText('Не найден ключ EXCH_VAGON_TIME'));
    _OpenQueryParOra(qVagons,['p_Days',IVagonTime]);

    if qVagons.RecordCount > 0 then begin
      result:=1;
      while not qVagons.Eof do begin
        if qVagons.FieldByName('N').AsFloat <=0 then exit;
        qVagons.Next;
      end;
      qVagons.First;
      result:=2;
    end;
  except on e:Exception do
    begin
      result := 1;
      ShowMessage(TranslateText('Ошибка TfrmTestLaunch.TestVagons: ')+E.Message);
    end;
  end;
end;

procedure TfrmTestLaunch.miPutToExcelClick(Sender: TObject);
var dbGrid: TDBGridEh;
begin
  Case Notebook1.PageIndex of
    0: if qPart.Active then dbGrid := dbgPart;
    2: if qVagons.Active then dbGrid := dbgVagons;
    4: if qRez.Active then dbGrid := dbgRez;
    5: begin if qCheckList.Active then dbGrid := dbgCheck; end
  else //case
    exit;
  end;
  PutGridEhToExcel(dbGrid,dbGrid.Hint);
end;

procedure TfrmTestLaunch.bbTestDBClick(Sender: TObject);
var
  T: TTestDbForm;
begin
  Application.CreateForm(TTestDBForm,T);
  try
    T.ShowModal;
  finally
    T.Free;
  end;
end;

//  0 - ОК, 1 - Блок, 2 - Предупреждение
function TfrmTestLaunch.TestSRTalons: Integer;
begin
  Result :=0;
  try
    _OpenQueryOra(qSRTalon);
    if qSRTalon.RecordCount <= 0 then Exit;

    if qSRTalon.FieldByName('N').AsFloat <= 0
      then Result := 1
      else Result := 2

  except on e:Exception do
    begin
      result := 1;
      ShowMessage(TranslateText('Ошибка TfrmTestLaunch.TestSRTalons: ')+E.Message);
    end;
  end;
end;

function TfrmTestLaunch.TestTubingsInRez: integer;
begin
  Result := 0;
  try
    qRez.Close;
    _OpenQueryOra(qRez);
    If (qRez.RecordCount > 0) then
      Result := 1;
  except on E:Exception do
    begin
      Result := 1;
      ShowMessage(TranslateText('Ошибка')+'в TfrmTextLaunch.TestTubingsInRez: '+E.Message);
    end;
  end;
end;

procedure TfrmTestLaunch.cbHideGreenClick(Sender: TObject);
var iRec: integer;
begin
  inherited;
  iRec := rmd.RecNo;
  rmd.Filtered := cbHideGreen.Checked;
  rmd.RecNo := iRec;
end;

procedure TfrmTestLaunch.rmdFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept := not (rmdFlag.AsInteger = 0);  //фільтруємо пройдені перевірки
end;

procedure TfrmTestLaunch.dbgMainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if DataCol = 0 then
    ImageList1.Draw(dbgMain.Canvas, Rect.Left + (Rect.Right  - Rect.Left - ImageList1.Width)  div 2,
                                    Rect.Top  + (Rect.Bottom - Rect.Top  - ImageList1.Height) div 2,
                                    rmdFlag.AsInteger);
end;


function TfrmTestLaunch.LoadChecks(Test_num:integer): boolean;
var i,j,n: integer;
    sLine, sPropName, slPropVal: string;

  procedure DelimText(var List: TStringList; str: string);
  var n: integer;
  begin
    List := TStringList.Create; // Для коректної роботи процедури, необхідно притримуватися наступної умови:
    List.Delimiter := ';';      // якщо серед назв є такі, що містять спейси - обовязково виділити їх подвійнимим лапками.
    List.DelimitedText := str;  // Напр., для поля 'Макс. дебет': --$F_NAME_T=Дебетор;Дата;Дебет;"Макс. дебет"
    if pos('@',str) > 0 then
      for n:=0 to List.Count-1 do  // Дабл ленгвіч саппорт
        List[n]:=DevideRusUkr(List[n],true);
  end;

begin
  i:=0;
  Result := false;
  SetLength(Checks, 0);

  _OpenQueryPar(qCheckList, ['test', Test_num]);
  SetLength(Checks, qCheckList.RecordCount);
  qCheckList.First;
  While not qCheckList.EoF do
    begin
      sLine := qCheckListSQL_NAME.AsString + ',' + qCheckListFORM_NAME.AsString;
      Checks[i].qCheck := TOilQuery.Create(nil);
      Checks[i].qCheck.SQL.Text := '-->' + sLine +#10#13+
                                   'select ''Error in '+sLine+''' as uTestError from dual';
      _OpenQueryOra(Checks[i].qCheck);
      if Checks[i].qCheck.FindField('uTestError') <> nil then
        MessageDlg('TfrmTestLaunch.LoadChecks:'+
                    #13#10 + 'Error in '+sLine+#13#10+
                    #13#10 + TranslateText('Обратитесь к разработчикам. Все права заблокированы. '),
                    mtError, [mbOK], 0)
      else
        begin
          // Зчитуємо параметри --$
          with Checks[i].Fields do begin
            for j:=0 to Checks[i].qCheck.SQL.Count-1 do
              if Pos('--$',Checks[i].qCheck.SQL[j]) = 1 then
                begin
                  sLine := Checks[i].qCheck.SQL[j];
                  n := Pos('=',sLine);
                  sPropName := UpperCase(trim(Copy(sLine,4,n-4)));
                  slPropVal := trim(Copy(sLine,n+1,length(sLine)-n));
                  if slPropVal = '' then slPropVal:='-1';
                  if sPropName = 'DESC' then
                    Checks[i].Description := DevideRusUkr(slPropVal,true)
                  else if sPropName = 'TEST' then
                    Checks[i].Test := StrToInt(slPropVal)
                  else if sPropName = 'ISREGULAR' then
                    Checks[i].IsRegular := (slPropVal='1')
                  else if sPropName = 'RESULT' then
                    Checks[i].Result := sign(Checks[i].qCheck.RecordCount) * StrToInt(slPropVal)
                  else if sPropName = 'RESULT_EMP_ID' then
                    Checks[i].ResultEmpId := StrToInt(slPropVal)
                  else if sPropName = 'CHECKINDEX' then
                    Checks[i].CheckIndex := StrToInt(slPropVal)
                  else if sPropName = 'F_NAME_Q' then
                    DelimText(NameQ, slPropVal)
                  else if sPropName = 'F_NAME_T' then
                    DelimText(NameT, slPropVal)
                  else if sPropName = 'F_WIDTH' then
                    DelimText(Width, slPropVal);
                end;
            for j:=0 to Checks[i].qCheck.FieldCount-1 do
              Checks[i].qCheck.Fields[j].Visible := False;
            for j:=0 to NameQ.Count-1 do
              begin
                Checks[i].qCheck.FieldByName(NameQ[j]).Visible := True;
                Checks[i].qCheck.FieldByName(NameQ[j]).DisplayLabel := NameT[j];
                Checks[i].qCheck.FieldByName(NameQ[j]).DisplayWidth := StrToInt(Width[j]) div 6;
              end;
          end; // with Checks[i].Fields
          Result := true;
          inc(i);
        end;
        qCheckList.Next;
      end;
    inc(ArrayLength,i);
end;

end.
