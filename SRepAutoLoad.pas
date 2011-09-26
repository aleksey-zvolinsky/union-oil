unit SRepAutoLoad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls, DB, MemDS, DBAccess,
  Ora, uOilQuery, IdBaseComponent, IdComponent, IdTCPConnection, IdFTP, SRepRef,
  IdTCPClient, IdExplicitTLSClientServerBase, DBTables, MemTable, uHelpButton,
  IdFTPCommon, IdGlobal, ComCtrls, IdIOHandlerStack, IdConnectThroughHttpProxy,
  RxLookup, RXClock;

type
  TUploadResultType = (urtSuccessful, urtUnSuccessful);

  TSRepAutoLoadF = class(TForm)
    p1: TPanel;
    p2: TPanel;
    bbCancel: TBitBtn;
    deLoadDir: TDirectoryEdit;
    l1: TLabel;
    bbLoadDir: TBitBtn;
    IdFTP: TIdFTP;
    tPeriod: TTimer;
    tWork: TTimer;
    l5: TLabel;
    eFTPName: TEdit;
    metFrom: TMaskEdit;
    metTo: TMaskEdit;
    l3: TLabel;
    l4: TLabel;
    sbAutoLoad: TSpeedButton;
    l6: TLabel;
    ePeriods: TEdit;
    sbLog: TSpeedButton;
    cbFileExpOil: TCheckBox;
    cbFileExpDBF: TCheckBox;
    qDBF: TQuery;
    qColumns: TQuery;
    qWork: TOilQuery;
    bHelp: TOilHelpButton;
    cbFileErrorLoadOnFTP: TCheckBox;
    sbSaveSettings: TSpeedButton;
    bbLoadFTP: TBitBtn;
    qRestNP: TOilQuery;
    pbPerfect: TProgressBar;
    pbDetailed: TProgressBar;
    eProxyHost: TEdit;
    l7: TLabel;
    eProxyPort: TEdit;
    l8: TLabel;
    dsSections: TOraDataSource;
    qSections: TOilQuery;
    rcLoad: TRxClock;
    pClock: TPanel;
    lClock: TLabel;
    l9: TLabel;
    pnb: TPanel;
    nb: TNotebook;
    lSections: TLabel;
    sbSections: TSpeedButton;
    cbLoadAddSections: TCheckBox;
    dblcSections: TRxDBLookupCombo;
    cbLoadMyPack: TCheckBox;
    cbLoadAddDBF: TCheckBox;
    cbLoadRestDBF: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure bbLoadDirClick(Sender: TObject);
    procedure deLoadDirKeyPress(Sender: TObject; var Key: Char);
    procedure sbAutoLoadClick(Sender: TObject);
    procedure tPeriodTimer(Sender: TObject);
    procedure tWorkTimer(Sender: TObject);
    procedure ePeriodsKeyPress(Sender: TObject; var Key: Char);
    procedure sbLogClick(Sender: TObject);
    procedure metFromExit(Sender: TObject);
    procedure cbFileExpOilClick(Sender: TObject);
    procedure cbFileExpDBFClick(Sender: TObject);
    procedure eFTPNameChange(Sender: TObject);
    procedure sbSaveSettingsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbLoadFTPClick(Sender: TObject);
    procedure eProxyHostKeyPress(Sender: TObject; var Key: Char);
    procedure cbLoadAddSectionsClick(Sender: TObject);
    procedure sbSectionsClick(Sender: TObject);
  private
    iPackets, iRecords: integer;
    bAutoLoad: boolean;
    qPart, qRez, qRash, qRashMin: TOilQuery;

    function ConnectFTP: boolean; // підключаємося до FTP (ftp://login:pass@host)
    // шукає вільну назву файлу у директорії і копіює туди файл
    function CopyLoadedFile(p_FileName, p_Dir: string; p_Del: boolean;
      p_NoFileName: string = ''): string;
    procedure PutPacketsWithFTP; // забираємо файли з FTP
    procedure BackupFiles(); // робимо резервну копію файлів із АЗС
    procedure LoadPackets(bMes: boolean=true); // завантажуємо файли DBF, OIL і ZIP з папки
    procedure FileErrorLoadOnFTP(sFileName: string); // Файлы, загруженные с ошибками выкладывать на FTP
    procedure GetVisibleClock(b: boolean); // Время следующей загрузки
    procedure GetActivePage(); // сторінка OIL/DBF
    function IsFileOK(p_FileName: string): boolean; // перевірка по назві файлу

    procedure GetRashMin(p_NP: integer); // повсюду будемо брати відпуск на АЗС із найменшим ід
    procedure GetRashMinFilter(p_AZS_ID, p_NPG, p_NP: integer); // фільтруємо qRashMin

    // ****** BEGIN BDF
    procedure AddSRDBF(sFileName: string); // завантажуємо файли DBF
    procedure GetAZS(
      SL: TStringList; ADep_id: integer;
      AAZS, ADepOKPO: string; var AId: integer);
    procedure GetNPG(SL: TStringList; AValue: string; var AId: integer);
    procedure GetNB(SL: TStringList; ANB: string; var AId: integer);
    procedure SetPrihRepDBF(
      p_Date: TDateTime;
      p_REP_ID, p_DEP_ID, p_NB_ID, p_AZS_ID, p_NPG: integer;
      p_LITR, p_PRICE, p_WEIGHT, p_DENSITY: Real); // створюємо прихід НП на АЗС
    procedure SetRashRepDBF(
      p_AZS_ID, p_REP_ID, p_NPG, p_NP, p_OPER_ID: integer;
      p_LITR, p_PRICE, p_WEIGHT, p_DENSITY, p_SUMM: Real); // створюємо реалізацію НП на АЗС
    // ****** END BDF

    procedure SaveDbLog(AResultType: TUploadResultType; AResultComment, AFileName: string;
      ARepId, ARepInst: variant);
  public
    SRepRef: TSRepRefForm;

    class procedure DailyRepAddRash(
      p_AZS_ID, p_REP_ID, p_NPG, p_NP, p_OPER_ID: integer;
      p_LITR, p_PRICE, p_WEIGHT, p_DENSITY, p_SUMM: Real
    );

    function SetRestNPDailyRep(
      p_AzsID, p_NpgID, p_NpID: integer; // АЗС, Група НП або Тип НП
      p_RestLitr, p_RestCount: real;     // залишок, який має бути на дату p_Date
      p_Date: TDateTime;                 // дата, на яку треба мати залишок p_RestLitr і p_RestCount
      var p_RepID: integer;              // ID шапки змінного звіту із корегуючими даними
      p_AutoLoad: string='Y';            // тип загрузки
      p_Commit: boolean=false            // чи зберігати дані у цій процедурі
    ): boolean; // якщо false, то товар не відпускався на АЗС

    procedure SetPrihRep(
      p_Date: TDateTime;
      p_From {від кого}, p_NB {яка НБ}, p_AZS {якій АЗС}, p_Np,
      p_Rep_id, p_Rep_inst,          // змінний звіт
      p_Rash_id, p_Rash_inst,        // відпуск на АЗС
      p_Part_id, p_Part_inst,        // партія
      p_Rez_id, p_Rez_inst,          // резервуар
      p_Auto_id, p_Auto_inst,        // автомобіль
      p_Emp_id, p_Emp_inst: integer; // водій
      p_TTN_Date: TDateTime; // дата ТТН
      p_TTN, p_Car: string;  // номер ТТН, номер машини/цистерни
      p_Litr, p_Price, p_Weight, p_Density, p_Temper: Real;
      p_CH_Prih: boolean=true; // створюємо прихід на НБ
      p_CH_Rash: boolean=true; // створюємо відпуск з НБ
      p_CH_DR  : boolean=true  // створюємо прихід на АЗС
    ); // створюємо прихід НП на АЗС
  end;

var
  SRepAutoLoadF: TSRepAutoLoadF;
  slSRepMes: TStringList; // повідомлення
  sSRepDirLog: string;

procedure SRepAutoLoadLog(s: string); // лог

implementation

{$R *.dfm}

uses Main, ExFunc, OilStd, SRep, uCommonForm, UDbFunc, Memo, ChooseOrg,
  uXMLForm, PacketClass;

//==============================================================================
procedure SRepAutoLoadLog(s: string); // лог
begin
  if DR_AUTOLOAD then
  begin
    ExFunc.log(
      sSRepDirLog +'\SRepAutoLoad_'+ FormatDateTime('yyyy-mm-dd', now()) +'.log',
      FormatDateTime('dd.mm.yyyy hh:nn:ss', now()) +' '+ s);
    if slSRepMes <> nil then
      slSRepMes.Add(s);
  end;
end;
//==============================================================================
procedure TSRepAutoLoadF.sbLogClick(Sender: TObject);
var
  SL: TStringList;
begin
  if FileExists(deLoadDir.Text +'\SRepAutoLoad_'+ FormatDateTime('yyyy-mm-dd', now()) +'.log') then
  begin
    SL := TStringList.Create;
    try
      SL.Clear;
      SL.LoadFromFile(deLoadDir.Text +'\SRepAutoLoad_'+ FormatDateTime('yyyy-mm-dd', now()) +'.log');
      ShowText(SL.Text);
    finally
      FreeAndNil(SL);
    end;
  end;
end;
//==============================================================================
procedure TSRepAutoLoadF.FormShow(Sender: TObject);
begin // витягуємо з реєстру збережені дані
  // Папка
  deLoadDir.Text := ReadPieceOfRegistry(HKEY_CURRENT_USER, '\Software\Oil', 'SRepAutoLoadDir');
  if deLoadDir.Text = '' then
    deLoadDir.Text := GetMainDir;
  deLoadDir.InitialDir := deLoadDir.Text;
  sSRepDirLog          := deLoadDir.Text;

  eFTPName.Text   := ReadPieceOfRegistry(HKEY_CURRENT_USER, '\Software\Oil', 'SRepAutoLoadFTP');
  eProxyHost.Text := ReadPieceOfRegistry(HKEY_CURRENT_USER, '\Software\Oil', 'SRepAutoLoadProxyHost');
  eProxyPort.Text := ReadPieceOfRegistry(HKEY_CURRENT_USER, '\Software\Oil', 'SRepAutoLoadProxyPort');
  metFrom.Text    := ReadPieceOfRegistry(HKEY_CURRENT_USER, '\Software\Oil', 'SRepAutoLoadTimeFrom');
  metTo.Text      := ReadPieceOfRegistry(HKEY_CURRENT_USER, '\Software\Oil', 'SRepAutoLoadTimeTo');
  ePeriods.Text   := ReadPieceOfRegistry(HKEY_CURRENT_USER, '\Software\Oil', 'SRepAutoLoadPeriods');

  // автоматична загрузка даних
  if SysParamExists('RUN_OIL_AUTOLOAD_SREP') then
  begin
    cbFileExpDBF.Checked := AnsiUpperCase(SysParamValue('RUN_OIL_AUTOLOAD_SREP')) = 'DBF';
    cbFileExpOIL.Checked := AnsiUpperCase(SysParamValue('RUN_OIL_AUTOLOAD_SREP')) = 'OIL';
    sbAutoLoad.Down := true;
    sbAutoLoad.Click;
  end;
  cbFileExpDBFClick(nil);
  cbFileExpOilClick(nil);

  cbFileErrorLoadOnFTP.Checked := ReadPieceOfRegistry(HKEY_CURRENT_USER, '\Software\Oil', 'SRepAutoLoadFileErrorLoadOnFTP_Checked') = '1';
  cbLoadAddDBF.Checked         := ReadPieceOfRegistry(HKEY_CURRENT_USER, '\Software\Oil', 'SRepAutoLoadAddDBF_Checked')             = '1';
  cbLoadAddSections.Checked    := ReadPieceOfRegistry(HKEY_CURRENT_USER, '\Software\Oil', 'SRepAutoLoadAddSections_Checked')        = '1';
  cbLoadAddSectionsClick(nil);
  cbLoadMyPack.Checked         := ReadPieceOfRegistry(HKEY_CURRENT_USER, '\Software\Oil', 'SRepAutoLoadMyPack_Checked')             = '1';

  sbSaveSettings.Enabled := false;

  slSRepMes := TStringList.Create;
end;
//==============================================================================
procedure TSRepAutoLoadF.deLoadDirKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;
//==============================================================================
procedure TSRepAutoLoadF.ePeriodsKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', #8]) then key := #0;
end;
//==============================================================================
procedure TSRepAutoLoadF.bbLoadDirClick(Sender: TObject);
begin
  try
    DR_AUTOLOAD := true;
    slSRepMes.Clear;
    LoadPackets(true); // завантажуємо файли DBF, OIL і ZIP з папки
  finally
    DR_AUTOLOAD := false;
  end;
end;
//==============================================================================
procedure TSRepAutoLoadF.bbLoadFTPClick(Sender: TObject);
begin
  try
    DR_AUTOLOAD := true;
    slSRepMes.Clear;
    PutPacketsWithFTP; // забираємо файли з FTP
    LoadPackets(true); // завантажуємо файли DBF, OIL і ZIP з папки
  finally
    DR_AUTOLOAD := false;
  end;
end;
//==============================================================================
procedure TSRepAutoLoadF.GetVisibleClock(b: boolean); // Время следующей загрузки
begin
  pClock.Visible := b;
  lClock.Visible := b;
  if b then
  begin
    if not tWork.Enabled then
    begin
      pClock.Caption := FormatDateTime('hh: nn: ss', Now + (tWork.Interval / (60000 * 24 * 60)));
      tWork.Enabled  := true;
    end;
  end
  else
  begin
    pClock.Caption := '';
    tWork.Enabled  := false;
  end;
end;
//==============================================================================
procedure TSRepAutoLoadF.sbAutoLoadClick(Sender: TObject);
begin
  inherited;
  if (deLoadDir.Text = '') or (metFrom.Text = '  :  ') or (metTo.Text = '  :  ')
    or (ePeriods.Text = '') then
  begin
    MessageDlg(TranslateText('Необходимо указать все поля!'), mtError, [mbOk], 0);
    sbAutoLoad.Down := false;
    exit;
  end;
  CreateDir(deLoadDir.Text); // створюємо директорію, якщо її встигли видалити
  sSRepDirLog := deLoadDir.Text;

  bbLoadDir.Enabled := not sbAutoLoad.Down;
  bbLoadFTP.Enabled := not sbAutoLoad.Down;
  sbLog.Enabled     := not sbAutoLoad.Down;
  p2.Enabled        := not sbAutoLoad.Down;
  tPeriod.Enabled   := sbAutoLoad.Down;
  if not sbAutoLoad.Down then
  begin
    GetVisibleClock(false); // Время следующей загрузки
    tWork.Enabled := false;
  end;
  DR_AUTOLOAD := sbAutoLoad.Down;

  if sbAutoLoad.Down then
    sbAutoLoad.Hint := TranslateText('Выключить автозагрузку')
  else sbAutoLoad.Hint := TranslateText('Включить автозагрузку');
end;
//==============================================================================
procedure TSRepAutoLoadF.tPeriodTimer(Sender: TObject);
var
  HourFrom, HourTo, MinFrom, MinTo: integer;
  TimeFrom, TimeTo, TimeNow: integer;
  iHour, iMin, iSec, iMSec: Word;
begin
  HourFrom := StrToInt(Copy(metFrom.Text, 1, 2));
  MinFrom := StrToInt(Copy(metFrom.Text, 4, 2));

  HourTo := StrToInt(Copy(metTo.Text, 1, 2));
  MinTo := StrToInt(Copy(metTo.Text, 4, 2));

  DecodeTime(Now, iHour, iMin, iSec, iMSec);

  TimeFrom := HourFrom*3600 + MinFrom*60;
  TimeTo   := HourTo*3600 + MinTo*60;
  TimeNow  := iHour*3600 + iMin*60;

  if (TimeFrom <= TimeNow) and (TimeTo >= TimeNow) then
  begin
    tWork.Interval := StrToInt(ePeriods.Text) * 60000;
    GetVisibleClock(true); // Время следующей загрузки
  end
  else
    if tWork.Enabled then
    begin
      GetVisibleClock(false); // Время следующей загрузки
      sbLog.Click;
    end;
end;
//==============================================================================
procedure TSRepAutoLoadF.tWorkTimer(Sender: TObject);
begin
  if not bAutoLoad then
  try
    // вмикаємо автоматичну загрузку, вимикаємо видачу повідомлень
    bAutoLoad := true;
    slSRepMes.Clear;    
    if eFTPName.Text <> '' then
      PutPacketsWithFTP; // забираємо файли з FTP
    LoadPackets(false); // завантажуємо файли DBF, OIL і ZIP з папки
  finally
    tWork.Enabled := false;
    GetVisibleClock(true); // Время следующей загрузки
    bAutoLoad := false;
  end;
end;
//==============================================================================
procedure TSRepAutoLoadF.metFromExit(Sender: TObject);
var
  Msg: string;
begin
  if SRep.SMRep.DateTimeIsCorrect(DateToStr(trunc(Now)) +' '+ (Sender as TMaskEdit).Text, Msg) then
  else
  begin
    MessageDlg(Msg, mtError, [mbOk], 0);
    (Sender as TMaskEdit).Text := '  :  ';
  end;
end;
//==============================================================================
procedure TSRepAutoLoadF.GetActivePage(); // сторінка OIL/DBF
begin
  if cbFileExpOil.Checked then
    nb.ActivePage := 'OIL'
  else
    nb.ActivePage := 'DBF';
end;
//==============================================================================
procedure TSRepAutoLoadF.cbFileExpOilClick(Sender: TObject);
var
  bClick: boolean;
begin
  cbFileExpDBF.Checked := not cbFileExpOil.Checked;
  GetActivePage(); // сторінка OIL/DBF

  // Загружать только свои пакеты
  cbLoadMyPack.Enabled := cbFileExpOil.Checked;
  // Догружать дополнительные данные к сменным отчетам
  cbLoadAddSections.Enabled := cbFileExpOil.Checked;

  bClick := sbSaveSettings.Enabled;
  cbLoadAddSectionsClick(nil);
  sbSaveSettings.Enabled := bClick;
end;
//==============================================================================
procedure TSRepAutoLoadF.cbFileExpDBFClick(Sender: TObject);
begin
  cbFileExpOil.Checked := not cbFileExpDBF.Checked;
  GetActivePage(); // сторінка OIL/DBF

  cbLoadRestDBF.Enabled := cbFileExpDBF.Checked;
  if not cbLoadRestDBF.Enabled then
    cbLoadRestDBF.Checked := false;

  cbLoadAddDBF.Enabled := cbFileExpDBF.Checked;
  if not cbLoadAddDBF.Enabled then
    cbLoadAddDBF.Checked := false;
end;
//==============================================================================
function TSRepAutoLoadF.IsFileOK(p_FileName: string): boolean; // перевірка по назві файлу
begin
  result :=
    (p_FileName <> '.') and (p_FileName <> '..') and
    ((((AnsiUpperCase(ExtractFileExt(p_FileName)) = '.ZIP') or
    (AnsiUpperCase(ExtractFileExt(p_FileName)) = '.OIL')) and cbFileExpOil.Checked) or
    ((AnsiUpperCase(ExtractFileExt(p_FileName)) = '.DBF') and cbFileExpDBF.Checked)) and
    (pos('ERROR_',            AnsiUpperCase(ExtractFileName(p_FileName))) = 0) and
    (pos('ОСТАТКИ',           AnsiUpperCase(ExtractFileName(p_FileName))) = 0) and
    (pos('ЛОГИ',              AnsiUpperCase(ExtractFileName(p_FileName))) = 0) and
    (pos('РЕЗУЛЬТАТ ЗАПРОСА', AnsiUpperCase(ExtractFileName(p_FileName))) = 0);
end;
//==============================================================================
procedure TSRepAutoLoadF.BackupFiles();
var
  SearchRec: TSearchRec;
  Res: integer;
begin
  try
    CreateDir(deLoadDir.Text +'\BackupPacketsAZS');

    Res := FindFirst(deLoadDir.Text +'\*.*', faAnyFile, SearchRec);
    // знаходимо усі файли із АЗС
    while Res = 0 do
    begin
      if IsFileOK(SearchRec.Name) then // перевірка по назві файлу
        CopyLoadedFile(deLoadDir.Text +'\'+ SearchRec.Name,
          deLoadDir.Text +'\BackupPacketsAZS', false);
      Res := FindNext(SearchRec);
    end;
    FindClose(SearchRec);
  except on E: Exception do
    raise Exception.Create(E.Message);
  end;
end;
//==============================================================================
procedure TSRepAutoLoadF.LoadPackets(bMes: boolean=true); // завантажуємо файли DBF, OIL і ZIP з папки
var
  SLPackets: TStringList;
  SearchRec: TSearchRec;
  Res: integer;

  //****************************************************************************
  procedure FindSR_H(p_azs_id: integer; p_rep_date: TDateTime);
  // якщо за даний день знайдено змінний звіт внесений вручну,
  // то за цей день не можна грузити автоматично змінні звіти
  begin
    if GetSqlValueParSimple(
      'select count(*) from Oil_Daily_Rep' +
      ' where trunc(rep_date) = trunc(to_date(:p_rep_date, ''dd.mm.yyyy HH24:mi''))' +
      '   and state = ''Y''' +
      '   and azs_id = :p_azs_id and azs_inst = :p_azs_id' +
      '   and auto_load in (''H'', ''HE'', ''Y'', ''YE'')',
      ['p_rep_date', p_rep_date,
       'p_azs_id',   p_azs_id]) <> 0 then
      raise Exception.Create(
        TranslateText('Невозможно загрузить сменный отчет, так как он уже введен вручную!'));
  end;
  //****************************************************************************

  //****************************************************************************
  procedure DeleteSrTable(sTableName: string; ARep_Id, ARep_Inst: integer); // видаляємо дані із АЗС
  begin
    _ExecSql(
      'update '+ sTableName +' set state = ''N''' +
      ' where state = ''Y'' and rep_id = :p_rep_id and rep_inst = :p_rep_inst',
      ['p_rep_id',   ARep_Id,
       'p_rep_inst', ARep_Inst]);
  end;
  //****************************************************************************

  //****************************************************************************
  function LoadAddSections(sFileName: string): boolean; // завантаження додаткових секцій
  var
    SLPacketText, SLSections: TStringList;
    ARep_Date: TDateTime;
    i, ARep_Id, ARep_Inst, AAZS_Id, ASmena_Num: integer;
    Packet: TPacket;
    IsDocAZS: boolean; // додаткові дані із АЗС
  begin
    result := false;

    pbDetailed.Position := 0;
    pbDetailed.Max := 4;

    SLPacketText := TStringList.Create;
    Application.CreateForm(TSRepForm, SMRep);
    try
      SLPacketText.Clear;
      SMRep.OpenFileSRep(sFileName, SLPacketText); // завантаження файлу
      pbDetailed.StepIt;

      // якщо пакет не містить секції TOTAL, або ми бажаємо загрузити якусь окрему секцію, то
      if (pos('TOTAL:', SLPacketText.Text) = 0) or (dblcSections.KeyValue <> null) then
      begin
        // знаходимо змінний звіт
        ARep_Date  := 0;
        ASmena_Num := 0;
        AAZS_Id    := 0;

        for i := 0 to SLPacketText.Count - 1 do
        begin
          // Дата змінного звіту
          if (Pos('DATE:', SLPacketText[i]) = 1) and (Length(SLPacketText[i]) > 5) then
            ARep_Date := StrToDateTime(Copy(SLPacketText[i], 7, Length(SLPacketText[i])));

          // Зміна
          if (Pos('NOM:', SLPacketText[i]) = 1) and (Length(SLPacketText[i]) > 4) then
            ASmena_Num := StrToInt(Copy(SLPacketText[i], 5, Length(SLPacketText[i])));

          // Id АЗС
          if (Pos('AZS:', SLPacketText[i]) = 1) and (Length(SLPacketText[i]) > 4) then
            AAZS_Id := 1000000 + StrToInt(Copy(SLPacketText[i], 5, Length(SLPacketText[i])));
        end;
        pbDetailed.StepIt;

        IsDocAZS := ASmena_Num = -1; // додаткові дані із АЗС

        qWork.Close;
        qWork.SQL.Text :=
          'select id, inst from Oil_Daily_Rep' +
          ' where state = ''Y''' +
          '   and inst = :p_inst' +
          '   and azs_id = :p_azs_id and azs_inst = :p_azs_id' +
          '   and to_date(to_char(rep_date,    ''dd.mm.yyyy HH24:mi''), ''dd.mm.yyyy HH24:mi'') =' +
          '       to_date(to_char(:p_rep_date, ''dd.mm.yyyy HH24:mi''), ''dd.mm.yyyy HH24:mi'')' +
          '   and smena_num = :p_smena_num';
        _OpenQueryPar(qWork,
          ['p_inst',      MAIN_ORG.Inst,
           'p_azs_id',    AAZS_Id,
           'p_rep_date',  ARep_Date,
           'p_smena_num', ASmena_Num]);

        if qWork.IsEmpty then
        begin
          if IsDocAZS then // додаткові дані із АЗС
          begin
            // Это сменный отчет с дополнительными данными с АЗС.
            ARep_Id := DBSaver.SaveRecord('OIL_DAILY_REP',
              ['ID',        GetNextId('OIL_DAILY_REP', ['INST', MAIN_ORG.Inst], 'S_DAILY_REP'),
               'STATE',     'Y',
               'INST',      MAIN_ORG.Inst,
               'REP_DATE',  ARep_Date,
               'AZS_ID',    AAZS_Id,
               'AZS_INST',  AAZS_Id,
               'REP_NUM',   StrToInt(FormatDateTime('dd', ARep_Date)),
               'SMENA_NUM', -1,
               'EMP_ID',    null,
               'EMP_INST',  null,
               'AUTO_LOAD', 'P',
               'USER_ID',   SUPER_REAL_EMP_ID
              ]);
            ARep_Inst := MAIN_ORG.Inst;
          end
          else
            raise Exception.Create(
              TranslateText('Не найден сменный отчет, к которому можно догрузить дополнительные данные!'));
        end
        else
        begin
          ARep_Id   := qWork.FieldByName('id').AsInteger;
          ARep_Inst := qWork.FieldByName('inst').AsInteger;
        end;
        pbDetailed.StepIt;

        // загрузка секцій із АЗС
        Packet := TPacket.Create(SLPacketText);
        try
          if dblcSections.KeyValue <> null then
          begin
            SRepAutoLoadLog(TranslateText('Начало загрузки секции ')+ dblcSections.KeyValue);

            // видаляємо дані із АЗС
            DeleteSrTable(qSections.FieldByName('table_name').AsString, ARep_Id, ARep_Inst);

            // вставляємо дані
            SMRep.SaveSection(
              ARep_Id,
              ARep_Inst,
              qSections.FieldByName('table_name').AsString,
              qSections.FieldByName('section_name').AsString,
              qSections.FieldByName('table_fields').AsString,
              qSections.FieldByName('section_fields').AsString,
              Packet
            );
          end
          else
          begin
            SRepAutoLoadLog(TranslateText('Загрузка секций ...'));
            SLSections := Packet.GetAllSections; // знаходимо усі секції

            qWork.Close;
            qWork.SQL.Text :=
              'select * from oil_azs_sections' +
              ' where state = ''Y''' +
              '   and table_name   is not null and table_fields   is not null' +
              '   and section_name is not null and section_fields is not null' +
              ' order by id';
            _OpenQuery(qWork); // відкриваємо дані про всі секціії

            for i := 0 to SLSections.Count - 1 do
            begin
              if (Packet.OpenSection(SLSections[i]) < 0) or qWork.IsEmpty then
                Continue;
              SRepAutoLoadLog('    '+ SLSections[i]);

              qWork.Filtered := false;
              qWork.Filter   := 'section_name = '+ QuotedStr(SLSections[i]);
              qWork.Filtered := true;

              // видаляємо дані із АЗС
              DeleteSrTable(qWork.FieldByName('table_name').AsString, ARep_Id, ARep_Inst);

              // вставляємо дані
              SMRep.SaveSection(
                ARep_Id,
                ARep_Inst,
                qWork.FieldByName('table_name').AsString,
                SLSections[i],
                qWork.FieldByName('table_fields').AsString,
                qWork.FieldByName('section_fields').AsString,
                Packet
              );
            end;
          end;
        finally
          if Assigned(Packet) then FreeAndNil(Packet);
        end; // Packet := TPacket.Create(SLPacketText);
        pbDetailed.StepIt;

        CommitSQL;
        SRepAutoLoadLog(TranslateText('ЗАГРУЖЕН ') +
          TranslateText(' Дата: ')+ DateTimeToStr(ARep_Date) +
          TranslateText(' АЗС: ')+ GetOrgName(AAZS_Id, AAZS_Id) +
          TranslateText(' Номер смены: ')+ IntToStr(ASmena_Num));

        // копіювання завантаженного файлу і видалення його
        CopyLoadedFile(sFileName, deLoadDir.Text +'\LoadedPacketsAZS', true);
        result := true;
      end;
    finally
      FreeAndNil(SLPacketText);
      FreeAndNil(SMRep);
      qWork.Filter   := '';
      qWork.Filtered := false;
      qWork.Close;

      pbDetailed.Position := 0;
    end;
  end;
  //****************************************************************************

  //****************************************************************************
  procedure AddSROil(sFileName: string);
  begin
    // Догружать дополнительные данные к сменным отчетам
    if cbLoadAddSections.Checked then
      if LoadAddSections(sFileName) then // завантаження додаткових секцій
        exit;

    pbDetailed.Position := 0;
    pbDetailed.Max := 8;

    with SRepRef do
    begin
      try
        if not q.Active then q.Open;
        // вставка нового рядка
        q.Insert;
        q.FieldByName('Id').AsInteger := GetSeqNextVal('S_DAILY_REP');
        q.FieldByName('Inst').AsInteger := MAIN_ORG.Inst;
        q.Post; pbDetailed.StepIt;
        // відкриття форми змінного звіту і редагування її
        Application.CreateForm(TSRepForm, SMRep);
        try
          SMrep.bLoadMyPack := cbLoadMyPack.Checked; // Загружать только свои пакеты
          SMrep.mode := 1;
          SMrep.pLoadFromFile.Visible := True;
          SMRep.FormShow(SMRep); pbDetailed.StepIt;
          SMRep.odPacket.FileName := sFileName; // передаємо наш файл
          SMRep.Visible := false;

          SMRep.bbLoadFromFile.Click; pbDetailed.StepIt;
          SMRep.bbRealization.Click;  pbDetailed.StepIt;
          SMRep.bbIncas.Click;        pbDetailed.StepIt;

          // якщо за даний день знайдено змінний звіт внесений вручну,
          // то за цей день не можна грузити автоматично змінні звіти
          FindSR_H(q.FieldByName('AZS_Id').AsInteger, q.FieldByName('Rep_Date').AsDateTime);

          SMRep.bbOk.Click; pbDetailed.StepIt;
          // приймаємо повідомлення
          if q.State <> dsBrowse then q.Post;

          // корегування номеру зміни
          //--------------------------------------------------------------------
          qWork.Close;
          qWork.SQL.Text :=
            'select row_number() over(order by rep_date) as num, dr.* from Oil_Daily_Rep dr' +
            ' where trunc(rep_date) = trunc(to_date(:p_rep_date, ''dd.mm.yyyy HH24:mi''))' +
            '   and state = ''Y'' and smena_num > 0' +
            '   and AZS_Id = :p_azs_id and AZS_Inst = :p_azs_id' +
            ' order by rep_date';
          _OpenQueryPar(qWork,
            ['p_rep_date', FormatDateTime('dd.mm.yyyy hh:nn', q.FieldByName('Rep_Date').AsDateTime),
             'p_azs_id',   q.FieldByName('AZS_Id').AsInteger]);
          qWork.First;

          while not qWork.Eof do
          begin
            if qWork.FieldByName('smena_num').AsInteger <> qWork.FieldByName('num').AsInteger then
            begin
              DBSaver.SaveRecord('OIL_DAILY_REP',
                ['ID',        qWork.FieldByName('Id').AsInteger,
                 'INST',      qWork.FieldByName('Inst').AsInteger,
                 'SMENA_NUM', qWork.FieldByName('num').AsInteger
                ]);
              SRepAutoLoadLog(
                TranslateText('Дата: ')+ q.FieldByName('REP_DATE').AsString +
                TranslateText(' АЗС: ')+ q.FieldByName('AZS_NAME').AsString +
                TranslateText(' Номер смены: ')+
                  qWork.FieldByName('smena_num').AsString +' --> '+ qWork.FieldByName('num').AsString);
            end;
            qWork.Next
          end;
          pbDetailed.StepIt;
          //--------------------------------------------------------------------

          SaveAzsReceive;
        finally
          FreeAndNil(SMRep);
        end;
        iPackets := iPackets + 1;
        SRepAutoLoadLog(TranslateText('ЗАГРУЖЕН ') +
          TranslateText(' Дата: ')+ q.FieldByName('REP_DATE').AsString +
          TranslateText(' АЗС: ')+ q.FieldByName('AZS_NAME').AsString +
          TranslateText(' Номер смены: ')+ q.FieldByName('SMENA_NUM').AsString);
        SaveDbLog(urtSuccessful, '', sFileName,
          q.FieldByName('Id').AsInteger,
          q.FieldByName('Inst').AsInteger);
        pbDetailed.StepIt;
        CommitSQL;

        // копіювання завантаженного файлу і видалення його
        CopyLoadedFile(sFileName, deLoadDir.Text +'\LoadedPacketsAZS', true);

        pbDetailed.Position := 0;
      except on E: Exception do
        begin
          pbDetailed.Position := 0;

          if q.State <> dsBrowse then q.Post;
          q.Delete;
          raise Exception.Create(E.Message);
        end;
      end;
    end;
  end;
  //****************************************************************************

begin
  if not cbFileExpOil.Checked and not cbFileExpDBF.Checked then exit;

  if deLoadDir.Text = '' then
  begin
    MessageDlg(TranslateText('Необходимо выбрать папку, с которой будут грузиться файлы с АЗС!'), mtError, [mbOk], 0);
    exit;
  end;

  CreateDir(deLoadDir.Text); // створюємо директорію, якщо її встигли видалити
  BackupFiles(); // робимо резервну копію файлів із АЗС

  sSRepDirLog := deLoadDir.Text;
  try
    SLPackets := TStringList.Create;
    try
      //------------------------------------------------------------------------
      SLPackets.Clear;
      Res := FindFirst(deLoadDir.Text +'\*.*', faAnyFile, SearchRec);
      // знаходимо усі файли із АЗС
      while Res = 0 do
      begin
        if IsFileOK(SearchRec.Name) then // перевірка по назві файлу
          SLPackets.Add(deLoadDir.Text +'\'+ SearchRec.Name);
        Res := FindNext(SearchRec);
      end;
      FindClose(SearchRec);
      SLPackets.Sort;
      //------------------------------------------------------------------------

      CreateDir(deLoadDir.Text +'\LoadedPacketsAZS');
      iPackets := 0;
      Res := 0;
      pbPerfect.Position := 0;
      pbPerfect.Max := SLPackets.Count;

      // завантажуємо усі файли із АЗС
      SRepAutoLoadLog('/*************************************************************/');
      SRepAutoLoadLog(TranslateText('/**********************/Начало загрузки/**********************/'));
      SRepAutoLoadLog(TranslateText('Количество загружаемых файлов: ')+ IntToStr(SLPackets.Count) +'.');

      if bMes then
        if MessageDlg(TranslateText('Загрузить файлы с папки ')+ deLoadDir.Text +' ?'#10#13 +
          TranslateText('Количество загружаемых файлов: ')+ IntToStr(SLPackets.Count) +'.',
          mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;

      //------------------------------------------------------------------------
      if SLPackets.Count > 0 then
      begin
        SRepAutoLoadLog('    ');
        SLPackets.Sorted := true;
        SLPackets.Sort;
        while Res <> SLPackets.Count do
        begin
          SRepAutoLoadLog(TranslateText('Начало загрузки файла "')+ ExtractFileName(SLPackets.Strings[Res]) +'"');

          StartSQL;
          try
            if cbFileExpOil.Checked then AddSROil(SLPackets.Strings[Res]); // OIL, ZIP
            if cbFileExpDBF.Checked then AddSRDBF(SLPackets.Strings[Res]); // DBF
          except on E: Exception do
            begin
              // якщо це завантаження пакетів із АЗС і помилка "OPERATION ABORTED", то не перейменовуємо
              if not (cbFileExpOil.Checked and (pos('OPERATION ABORTED', AnsiUpperCase(E.Message)) > 0)) then
                FileErrorLoadOnFTP(SLPackets.Strings[Res]);
              if cbFileExpDBF.Checked then
                SRepAutoLoadLog(TranslateText('Ошибка на строке: ')+ IntToStr(iRecords + 1) +'.');
              SRepAutoLoadLog(TranslateText('НЕ ЗАГРУЖЕН!!! ОШИБКА: ')+ trim(E.Message)); // помилка
              RollbackSQL;
              SaveDbLog(urtUnSuccessful, '', SLPackets.Strings[Res], null, null);
              CommitSQL;
            end;
          end;

          SRepAutoLoadLog('    ');
          Res := Res + 1;
          pbPerfect.StepIt;
        end;
      end;
      //------------------------------------------------------------------------

    finally
      pbPerfect.Position := 0;

      SRepAutoLoadLog(TranslateText('Количество загруженных файлов: ')+ IntToStr(iPackets) +'.');
      SRepAutoLoadLog(TranslateText('Лог загрузки у файле "')+ deLoadDir.Text +'\' +
        'SRepAutoLoad_'+ FormatDateTime('yyyy-mm-dd', now()) +'.log"');
      SRepAutoLoadLog(TranslateText('/**********************/Конец загрузки /**********************/'));
      SRepAutoLoadLog('/*************************************************************/');
      SRepAutoLoadLog('    ');
      SRepAutoLoadLog('    ');

      FreeAndNil(SLPackets);
      if bMes and (slSRepMes.Count <> 0) then
        ShowText(slSRepMes.Text);
    end;
  except on E: Exception do
    begin
      if bMes then
        MessageDlg(TranslateText('Ошибка загрузки: ')+ E.Message, mtError, [mbOk], 0)
      else SRepAutoLoadLog(TranslateText('Ошибка загрузки: ')+ E.Message);
    end;
  end;
end;
//==============================================================================
function TSRepAutoLoadF.ConnectFTP: boolean; // підключаємося до FTP (ftp://login:pass@host)
var
  AConnStr: string;
  Handler: TIdIOHandlerStack;
  Through: TIdConnectThroughHttpProxy;
begin
  result := true;
  try
    if IdFTP.Connected then
      IdFTP.Disconnect;
    AConnStr := eFTPName.Text;
    if trim(AConnStr) <> '' then
    begin
      IdFTP.UserName := copy(AConnStr, 1, pos(':',AConnStr)-1);

      AConnStr := copy(AConnStr, pos(':',AConnStr)+1, Length(AConnStr));
      IdFTP.Password := copy(AConnStr, 1, pos('@',AConnStr)-1);

      AConnStr := copy(AConnStr, pos('@',AConnStr)+1, Length(AConnStr));
      if pos('/', AConnStr) > 0 then
        IdFTP.Host := copy(AConnStr, 1, pos('/', AConnStr)-1)
      else
        IdFTP.Host := AConnStr;

      // Proxy
      //------------------------------------------------------------------------
      if (eProxyHost.Text <> '') and (eProxyPort.Text <> '') then
      begin
        Handler := TIdIOHandlerStack.Create(self);

        Through := TIdConnectThroughHttpProxy.Create(self);
        Through.Host := eProxyHost.Text;
        Through.Port := StrToInt(eProxyPort.Text);
        Through.Enabled := true;

        IdFTP.IOHandler := Handler;
        Handler.TransparentProxy := Through;
      end;
      //------------------------------------------------------------------------
    end
    else
    begin
      SRepAutoLoadLog(TranslateText('Соединение с FTP не прошло успешно!') +#10+
        TranslateText('Не указан адрес FTP!'));
      result := false;
      exit;
    end;
    IdFTP.TransferType := ftBinary;
    IdFTP.Passive := true;
    IdFTP.IPVersion := Id_IPv4;
    IdFTP.Connect;

    // взнаємо директорію на FTP
    if pos('/', AConnStr) > 0 then
    begin
      AConnStr := copy(AConnStr, pos('/',AConnStr)+1, Length(AConnStr));
      if AConnStr <> '' then
        IdFTP.ChangeDir(AConnStr); // заходимо у необхідну директорію
    end;

    SRepAutoLoadLog(TranslateText('Соединение с FTP прошло успешно'));
  except on E: Exception do
    begin
      SRepAutoLoadLog(TranslateText('Соединение с FTP не прошло успешно! Ошибка: ')+ E.Message);
      result := false;
    end;
  end;
end;
//==============================================================================
procedure TSRepAutoLoadF.PutPacketsWithFTP; // забираємо файли з FTP
var
  SL: TStringList;
  i, iSentFiles: integer;
begin
  SRepAutoLoadLog('/*************************************************************/');
  SRepAutoLoadLog(TranslateText('/**********************/Работа с FTP   /**********************/'));

  SL := TStringList.Create;
  try
    if not ConnectFTP then exit;
    try
      try
        IdFTP.List(SL, '*.*', false);
      except on E: Exception do
        if not (pos('10054', e.Message) > 0) then // немає файлів
          raise Exception.Create(E.Message);
      end;

      SRepAutoLoadLog(TranslateText('Информация о файлах на FTP считана'));
      iSentFiles := 0;
      for i := 0 to SL.Count - 1 do
      begin
        if SL.Strings[i] <> '' then
          if IsFileOK(SL.Strings[i]) then // перевірка по назві файлу
          try
            DeleteFile(deLoadDir.Text +'\'+ SL.Strings[i]);
            IdFTP.Get(SL.Strings[i], deLoadDir.Text +'\'+ SL.Strings[i]{, true, false});
            IdFTP.Delete(SL.Strings[i]);
            SRepAutoLoadLog(TranslateText('Файл "')+ SL.Strings[i] +TranslateText('" c FTP загружен.'));
            iSentFiles := iSentFiles + 1;
          except
          end;
      end;
      SRepAutoLoadLog(TranslateText('Файлы c FTP загружены. Количество загруженных файлов: ')+ IntToStr(iSentFiles));
    except on E: Exception do
      SRepAutoLoadLog(TranslateText('Загрузка файлов c FTP не произошла! Ошибка: ')+ e.Message);
    end;
  finally
    SRepAutoLoadLog(TranslateText('Отсоединение от FTP'));
    IdFTP.Disconnect;
    FreeAndNil(SL);
  end;
end;
//==============================================================================
procedure TSRepAutoLoadF.AddSRDBF(sFileName: string); // завантажуємо файли DBF
const
  UpdRepDet =
    'update %s set state = ''N''' +
    ' where state = ''Y''' +
    '   and (srep_id, srep_inst) in' +
    '       (select /*+ORDERED*/ drd.id, drd.inst' +
    '          from oil_daily_rep dr, oil_dr_data drd, v_oil_azs azs' +
    '         where dr.state = ''Y'' and drd.state = ''Y''' +
    '           and dr.auto_load = ''Y''' +

    '           and drd.rep_id = dr.id' +
    '           and drd.rep_inst = dr.inst' +

    '           and trunc(dr.rep_date) between :DateFrom and :DateTo' +

    '           and :obl_id in (azs.obl_id, azs.par)' +
    '           and dr.azs_id = azs.id' +
    '           and dr.azs_inst = azs.inst)';
var
  SL_AZS, SL_NPG, SL_NB: TStringList;
  Year, Month, Day: Word;
  isFirstRep, isFirstRepMonth: boolean; // це перший змінний звіт, це перший змінний звіт у цьому місяці
  isHand, isDelNpRest: boolean; // це змінний звіт внесений вручну, залишки є вже видалені

  REP_ID, DEP_ID, AZS_ID, REP_AZS_ID, NPG_ID, NB_ID: integer;
  DEP_NAME, DateFrom, DateTo: string;
  REP_DATE: TDateTime;

  iRestRecords, iHandRecords: integer;

  REP_ID_REST_CORR: integer; // для корегування залишків
  REP_DATE_REST_CORR: TDateTime; // для корегування залишків

  FilesDBF: TMemoryStream; // DBF-файл приводимо до нормального кодування

  REST_DATE: TDateTime;
begin
  REP_ID := 0;
  REP_AZS_ID := 0;
  REP_DATE := 0;

  REP_ID_REST_CORR := 0; // для корегування залишків
  REP_DATE_REST_CORR := 0; // для корегування залишків

  iRecords := 0;
  iRestRecords := 0;
  iHandRecords := 0;
  isFirstRep := false;
  isFirstRepMonth := false;
  isDelNpRest := false;
  isHand := true;

  SL_AZS := TStringList.Create;
  SL_NPG := TStringList.Create;
  SL_NB := TStringList.Create;

  qPart := TOilQuery.Create(nil);
  qRez  := TOilQuery.Create(nil);
  qRash := TOilQuery.Create(nil);

  try
    if FileExists(deLoadDir.Text +'\ImportListAZSId.cfg') then
      SL_AZS.LoadFromFile(deLoadDir.Text +'\ImportListAZSId.cfg');

    if FileExists(deLoadDir.Text +'\ImportListNPGId.cfg') then
      SL_NPG.LoadFromFile(deLoadDir.Text +'\ImportListNPGId.cfg');

    if FileExists(deLoadDir.Text +'\ImportListNBId.cfg') then
      SL_NB.LoadFromFile(deLoadDir.Text +'\ImportListNBId.cfg');

    // DBF-файл приводимо до нормального кодування
    FilesDBF := TMemoryStream.Create;
    try
      FilesDBF.LoadFromFile(sFileName);
      FilesDBF.Position := 29;
      FilesDBF.Write('W1', 1);
      FilesDBF.SaveToFile(sFileName);
    finally
      FilesDBF.Free;
    end;

    qDBF.Close;
    qDBF.SQL.Text := 'select * from "'+ sFileName + '"';
    qDBF.Open;
    if not qDBF.FieldList.Equals(qColumns.SQL) then // перевірка полів у файлі DBF
      raise Exception.Create(TranslateText('Неверный формат таблицы!'));

    qDBF.Close;
    qDBF.SQL.Text := 'select count(*) from "'+ sFileName +'" group by obl_okpo';
    qDBF.Open;
    if qDBF.RecordCount <> 1 then
      raise Exception.Create(TranslateText('У DBF-файле не допускается несколько главных организаций!'));

    qDBF.Close;
    qDBF.SQL.Text :=
      'select rep_date, obl_okpo, azs_name, smena_num, np_name, oper_type, oper_id,' +
      '       koment_op, p_price, litr, weight, density, summ, nb' +
      '  from "'+ sFileName +'"' +
      ' order by rep_date, obl_okpo, azs_name, smena_num, np_name, oper_type, oper_id';
    qDBF.Open;

    // взнаємо період даних у файлі
    qDBF.First;
    DateFrom := FormatDateTime('dd.mm.yyyy', qDBF.FieldByName('rep_date').AsDateTime);
    qDBF.Last;
    DateTo := FormatDateTime('dd.mm.yyyy', qDBF.FieldByName('rep_date').AsDateTime);

    SRepAutoLoadLog(TranslateText('Количество загружаемых строк: ')+ IntToStr(qDBF.RecordCount) +'.');

    qDBF.First;

    // знаходимо організацію
    if nvl(GetSqlValueParSimple(
      'select count(1) from oil_org' +
      ' where state = ''Y''' +
      '   and id = inst' +
      '   and id_num = :id_num',
      ['id_num', qDBF.FieldByName('obl_okpo').AsString]), 0) = 0 then
      raise Exception.Create(TranslateText('Не найдена главная организация!'));

    // беремо із першої записі ОКПО і знаємо, що цей обл буде і у всіх інших записях
    DEP_ID := nvl(GetSqlValueParSimple(
      'select id from oil_org' +
      ' where state = ''Y''' +
      '   and id = inst' +
      '   and instr('','' || :id_list || '','', '','' || id || '','') > 0' +
      '   and id_num = :id_num',
      ['id_list', GetInst_List(MAIN_ORG.Inst, MAIN_ORG.Inst),
       'id_num',  qDBF.FieldByName('obl_okpo').AsString]), 0);
    if pos(IntToStr(DEP_ID), GetInst_List(MAIN_ORG.Inst, MAIN_ORG.Inst)) <= 0 then
      raise Exception.Create(TranslateText('Организация не имеет прав загружаться в данную базу данных!'));

    // взнаємо назву організації
    DEP_NAME := GetOrgName(DEP_ID, DEP_ID);

    SRepAutoLoadLog(TranslateText(' Организация: ')+ DEP_NAME +
      TranslateText(' Период с ')+ DateFrom +TranslateText(' по ')+ DateTo);

    // видаляємо змінні звіти за період
    //--------------------------------------------------------------------------
    if (nvl(GetSqlValueParSimple(
      'select count(*) from oil_daily_rep dr, v_oil_azs azs' +
      ' where dr.state = ''Y''' +
      '   and dr.auto_load = ''Y''' +
      '   and trunc(dr.rep_date) between :DateFrom and :DateTo' +
      '   and :obl_id in (azs.obl_id, azs.par)' +
      '   and dr.azs_id = azs.id' +
      '   and dr.azs_inst = azs.inst',
      ['DateFrom', DateFrom,
       'DateTo',   DateTo,
       'obl_id',   DEP_ID]), 0) <> 0) and (not cbLoadAddDBF.Checked) then
    begin
      // змінний звіт
      _ExecSql(Format(UpdRepDet, ['oil_vedomost']),
        ['DateFrom', DateFrom,
         'DateTo',   DateTo,
         'obl_id',   DEP_ID]);

      _ExecSql(Format(UpdRepDet, ['oil_srtalon']),
        ['DateFrom', DateFrom,
         'DateTo',   DateTo,
         'obl_id',   DEP_ID]);

      _ExecSql(Format(UpdRepDet, ['oil_srother']),
        ['DateFrom', DateFrom,
         'DateTo',   DateTo,
         'obl_id',   DEP_ID]);

      _ExecSql(
        'update oil_dr_data set state = ''N''' +
        ' where state = ''Y''' +
        '   and (rep_id, rep_inst) in' +
        '       (select /*+ORDERED*/ dr.id, dr.inst' +
        '          from oil_daily_rep dr, v_oil_azs azs' +
        '         where dr.state = ''Y''' +
        '           and dr.auto_load = ''Y''' +

        '           and trunc(dr.rep_date) between :DateFrom and :DateTo' +

        '           and :obl_id in (azs.obl_id, azs.par)' +
        '           and dr.azs_id = azs.id' +
        '           and dr.azs_inst = azs.inst)',
        ['DateFrom', DateFrom,
         'DateTo',   DateTo,
         'obl_id',   DEP_ID]);

      _ExecSql(
        'update exch_receive_azs set state = ''N''' +
        ' where state = ''Y''' +
        '   and (rep_id, rep_inst) in' +
        '       (select /*+ORDERED*/ dr.id, dr.inst' +
        '          from oil_daily_rep dr, v_oil_azs azs' +
        '         where dr.state = ''Y''' +
        '           and dr.auto_load = ''Y''' +

        '           and trunc(dr.rep_date) between :DateFrom and :DateTo' +

        '           and :obl_id in (azs.obl_id, azs.par)' +
        '           and dr.azs_id = azs.id' +
        '           and dr.azs_inst = azs.inst)',
        ['DateFrom', DateFrom,
         'DateTo',   DateTo,
         'obl_id',   DEP_ID]);

      _ExecSql(
        'update oil_daily_rep dr set dr.state = ''N''' +
        ' where dr.state = ''Y''' +
        '   and dr.auto_load = ''Y''' +
        '   and trunc(dr.rep_date) between :DateFrom and :DateTo' +
        '   and exists (select 1 from v_oil_azs azs' +
        '                where :obl_id in (azs.obl_id, azs.par)' +
        '                  and dr.azs_id = azs.id' +
        '                  and dr.azs_inst = azs.inst)',
        ['DateFrom', DateFrom,
         'DateTo',   DateTo,
         'obl_id',   DEP_ID]);

      // приходи на НБ
      {
      _ExecSql(
        'update oil_prihod set state = ''N''' +
        ' where state = ''Y''' +
        '   and (id, inst) in' +
        '       (select /*+ORDERED*/ r.ttn_num, r.inst' +
        '          from oil_daily_rep dr,' +
        '               oil_dr_data   drd,' +
        '               oil_rashod    r,' +
        '               v_oil_azs     azs' +
        '         where dr.state = ''Y'' and drd.state = ''Y'' and r.state = ''Y''' +
        '           and dr.auto_load = ''Y''' +
        '           and drd.oper_type = 0' +

        '           and dr.id = drd.rep_id' +
        '           and dr.inst = drd.rep_inst' +

        '           and drd.ttn_id = r.id' +
        '           and drd.ttn_inst = r.inst' +

        '           and dr.azs_id = azs.id' +
        '           and dr.azs_inst = azs.inst' +

        '           and trunc(dr.rep_date) between :DateFrom and :DateTo' +
        '           and :obl_id in (azs.obl_id, azs.par))',
        ['DateFrom', DateFrom,
         'DateTo',   DateTo,
         'obl_id',   DEP_ID]);

      _ExecSql(
        'update oil_prih_det set state = ''N''' +
        ' where state = ''Y''' +
        '   and (prihod_id, inst) in' +
        '       (select id, inst from oil_prihod where state = ''N'')');

      // відпуски на АЗС
      _ExecSql(
        'update oil_rashod set state = ''N''' +
        ' where state = ''Y''' +
        '   and (id, inst) in' +
        '       (select /*+ORDERED*/ drd.ttn_id, drd.ttn_inst' +
        '          from oil_daily_rep dr, oil_dr_data drd, v_oil_azs azs' +
        '         where dr.state = ''Y'' and drd.state = ''Y''' +
        '           and dr.auto_load = ''Y''' +
        '           and drd.oper_type = 0' +

        '           and dr.id = drd.rep_id' +
        '           and dr.inst = drd.rep_inst' +

        '           and dr.azs_id = azs.id' +
        '           and dr.azs_inst = azs.inst' +

        '           and trunc(dr.rep_date) between :DateFrom and :DateTo' +
        '           and :obl_id in (azs.obl_id, azs.par))',
        ['DateFrom', DateFrom,
         'DateTo',   DateTo,
         'obl_id',   DEP_ID]);
      }
    end;
    //--------------------------------------------------------------------------

    pbDetailed.Position := 0;
    pbDetailed.Max := qDBF.RecordCount;

    // повсюду будемо брати партію із найменшим ід
    qPart.SQL.Text :=
      'select /*+ORDERED*/ min(p.np_type) as np_id, min(p.id) as id, p.inst, np.grp_id' +
      '  from oil_part p, oil_np_type np' +
      ' where p.state = ''Y''' +
      '   and p.np_type = np.id' +
      ' group by p.inst, np.grp_id' +
      ' order by decode(ov.GetVal(''INST''), inst, 0, inst)';
    _OpenQuery(qPart);

    // повсюду будемо брати резервуар із найменшим ід
    qRez.SQL.Text :=
      'select /*+ORDERED*/ min(r.id) as id, r.inst, np.grp_id, r.id_org, r.inst_org' +
      '  from oil_rezervuar r, oil_np_type np' +
      ' where r.state = ''Y''' +
      '   and r.np_type_id = np.id' +
      ' group by r.inst, np.grp_id, r.id_org, r.inst_org' +
      ' order by decode(ov.GetVal(''INST''), inst, 0, inst)';
    _OpenQuery(qRez);

    // відпуски на АЗС
    qRash.SQL.Text :=
      'select /*+ORDERED*/ r.id, r.date_, r.inst, npt.np_grp, r.from_id, r.from_inst, r.to_id, r.to_inst, r.litr, r.count_, r.ud_weig, r.price' +
      '  from oil_rashod r, oil_part p, v_oil_np_type npt' +
      ' where r.state = ''Y'' and p.state = ''Y''' +
      '   and r.part_id = p.id and r.part_inst = p.inst' +
      '   and r.oper_id in (7, 10)' +
      '   and p.np_type = npt.id' +
      '   and not exists (select 1' +
      '                     from oil_dr_data drd' +
      '                    where drd.state = ''Y''' +
      '                      and r.id = drd.ttn_id and r.inst = drd.ttn_inst)';
    _OpenQuery(qRash);

    //--------------------------------------------------------------------------
    qDBF.First;
    while not qDBF.Eof do
    begin
      iRecords := iRecords + 1;
      
      // знаходимо АЗС
      GetAZS(SL_AZS, DEP_ID, qDBF.FieldByName('azs_name').AsString,
        qDBF.FieldByName('obl_okpo').AsString, AZS_ID);
      // знаходимо групу НП
      GetNPG(SL_NPG, qDBF.FieldByName('np_name').AsString, NPG_ID);

      if (AZS_ID <> 0) and (NPG_ID <> 0) then
      begin
        // знаходимо змінний звіт або добавляємо його
        if not ((REP_AZS_ID = AZS_ID) and (REP_DATE = qDBF.FieldByName('rep_date').AsDateTime)) then
        begin
          REP_ID_REST_CORR := 0; // для корегування залишків
          if REP_DATE_REST_CORR = 0 then
            REP_DATE_REST_CORR := qDBF.FieldByName('rep_date').AsDateTime; // для корегування залишків

          REP_AZS_ID := AZS_ID;
          REP_DATE := Trunc(qDBF.FieldByName('rep_date').AsDateTime);

          // це перший змінний звіт
          isFirstRep := nvl(GetSqlValueParSimple(
            'select count(*) from oil_daily_rep' +
            ' where state = ''Y'' and azs_id = :p_azs_id and azs_inst = :p_azs_id' +
            '   and trunc(rep_date) < :p_rep_date' +
            '   and trunc(rep_date) <> to_date(''31.05.2009'', ''dd.mm.yyyy'')',
            ['p_azs_id', AZS_ID, 'p_rep_date', REP_DATE]), 0) = 0;

          // це перший змінний звіт у цьому місяці
          isFirstRepMonth := nvl(GetSqlValueParSimple(
            'select count(*) from oil_daily_rep' +
            ' where state = ''Y'' and azs_id = :p_azs_id and azs_inst = :p_azs_id' +
            '   and trunc(rep_date) between trunc(:p_rep_date, ''mm'') and trunc(:p_rep_date)',
            ['p_azs_id', AZS_ID, 'p_rep_date', REP_DATE]), 0) = 0;

          // видалення попередніх залишків, якщо вони введені не вручну
          if (not isDelNpRest) and isFirstRepMonth then
          begin
            // формуємо дату залишків
            DecodeDate(REP_DATE, Year, Month, Day);
            REST_DATE := EncodeDate(year, month, 1);

            _ExecSqlOra(
              'update oil_np_rest set state = ''N''' +
              ' where state = ''Y'' and manual = ''N''' +
              '   and inst = :p_inst and trunc(date_) = trunc(:p_rep_date)',
              ['p_inst', MAIN_ORG.Inst, 'p_rep_date', REST_DATE]);

            isDelNpRest := true;
          end;

          // взнаємо чи це змінний звіт внесений вручну
          isHand := false;

          qWork.Close;
          qWork.SQL.Text := 'select * from oil_daily_rep' +
            ' where state = ''Y'' and smena_num = 1' +
            '   and trunc(rep_date) = :p_rep_date' +
            '   and azs_id = :p_azs_id and azs_inst = :p_azs_id';
          _OpenQueryPar(qWork, ['p_azs_id', AZS_ID, 'p_rep_date', REP_DATE]);

          if not qWork.IsEmpty then
            isHand := qWork.FieldByName('auto_load').AsString <> 'Y';

          // якщо стоїть галочка "Догружать все данные",
          // то ми, або догружаємо всі дані до існуючого змінного звіту,
          //        або догружаємо всі дані до створеного змінного звіту
          if cbLoadAddDBF.Checked and (not qWork.FieldByName('id').IsNull) then
            REP_ID := qWork.FieldByName('id').AsInteger
          else
            if (not isHand) or cbLoadAddDBF.Checked then
            begin
              DecodeDate(REP_DATE, Year, Month, Day);
              REP_ID := DBSaver.SaveRecord('OIL_DAILY_REP',
                ['ID',        GetNextId('OIL_DAILY_REP', ['INST', MAIN_ORG.Inst, 'AUTO_LOAD', 'Y'], 'S_DAILY_REP'),
                 'STATE',     'Y',
                 'INST',      MAIN_ORG.Inst,
                 'REP_DATE',  REP_DATE,
                 'AZS_ID',    AZS_ID,
                 'AZS_INST',  AZS_ID,
                 'REP_NUM',   Day,
                 'SMENA_NUM', 1,
                 'EMP_ID',    null,
                 'EMP_INST',  null,
                 'AUTO_LOAD', 'Y',
                 'USER_ID',   SUPER_REAL_EMP_ID
                ]);
              SaveDbLog(urtSuccessful, '', sFileName, REP_ID, MAIN_ORG.Inst);
            end;
        end;

        if (REP_ID <> 0) and ((not isHand) or cbLoadAddDBF.Checked) then
        begin
          // створюємо прихід НП на АЗС
          if ((qDBF.FieldByName('oper_type').AsInteger = 0) and isFirstRep)
            or (qDBF.FieldByName('oper_type').AsInteger = 1) then
          begin
            // знаходимо НБ
            NB_ID := 0;
            GetNB(SL_NB, qDBF.FieldByName('nb').AsString, NB_ID);

            SetPrihRepDBF(
              REP_DATE,
              REP_ID, DEP_ID, NB_ID, AZS_ID, NPG_ID,
              qDBF.FieldByName('LITR').AsFloat,
              qDBF.FieldByName('P_PRICE').AsFloat,
              qDBF.FieldByName('WEIGHT').AsFloat,
              qDBF.FieldByName('DENSITY').AsFloat);
          end;

          // якщо це не перший змінний звіт по АЗС, то всі залишки вважаємо вже завантаженими
          if (qDBF.FieldByName('oper_type').AsInteger = 0) and not isFirstRep then
          begin
            // якщо це є перший змінний звіт у цьому місяці, і НЕ перший змінний звіт
            if isFirstRepMonth then // заносимо залишки у базу даних
            begin
              qPart.Filtered := false;
              qPart.Filter   := 'grp_id = '+ IntToStr(NPG_ID);
              qPart.Filtered := true;

              if qRashMin = nil then
              begin
                qRashMin := TOilQuery.Create(nil);
                GetRashMin(0); // повсюду будемо брати відпуск на АЗС із найменшим ід
              end;
              GetRashMinFilter(AZS_ID, NPG_ID, 0); // фільтруємо qRashMin

              if qRashMin.FieldByName('id').IsNull then
              begin
                GetRashMin(0); // повсюду будемо брати відпуск на АЗС із найменшим ід
                GetRashMinFilter(AZS_ID, NPG_ID, 0); // фільтруємо qRashMin
              end;

              DBSaver.SaveRecord('OIL_NP_REST',
                ['ID',         GetNextId('OIL_NP_REST', ['DATE_', REST_DATE]),
                 'INST',       MAIN_ORG.Inst,
                 'STATE',      'Y',
                 'DATE_',      REST_DATE,
                 'AZS_ID',     AZS_ID,
                 'NP_TYPE_ID', qPart.FieldByName('np_id').AsInteger,
                 'TTN_ID',     qRashMin.FieldByName('id').AsInteger,
                 'TTN_INST',   qRashMin.FieldByName('inst').AsInteger,
                 'PRICE',      qDBF.FieldByName('P_PRICE').AsFloat,
                 'UD_WEIGHT',  qDBF.FieldByName('DENSITY').AsFloat,
                 'REST_LITR',  MRound(qDBF.FieldByName('LITR').AsFloat, 3),
                 'REST_KG',    MRound(qDBF.FieldByName('WEIGHT').AsFloat, DR_ROUND_COUNT),
                 'MANUAL',     'N'
                ]);
            end;

            // корегуємо залишки
            // якщо це перший змінний звіт у цьому місяці,
            //   або стоїть галочка "Откорректировать остатки на начало периода"
            if cbLoadRestDBF.Checked and (REP_DATE = REP_DATE_REST_CORR) then
            begin
              if not SetRestNPDailyRep(
                AZS_ID, NPG_ID, 0, qDBF.FieldByName('LITR').AsFloat, qDBF.FieldByName('WEIGHT').AsFloat,
                REP_DATE_REST_CORR, REP_ID_REST_CORR) then
                // якщо товар не відпускався на АЗС, то створюємо його прихід
                SetPrihRepDBF(
                  REP_DATE,
                  REP_ID, DEP_ID, 0, AZS_ID, NPG_ID,
                  qDBF.FieldByName('LITR').AsFloat,
                  qDBF.FieldByName('P_PRICE').AsFloat,
                  qDBF.FieldByName('WEIGHT').AsFloat,
                  qDBF.FieldByName('DENSITY').AsFloat);
            end
            else
              iRestRecords := iRestRecords + 1;
          end;

          // створюємо реалізацію НП на АЗС
          if qDBF.FieldByName('oper_type').AsInteger = 2 then
            SetRashRepDBF(
              AZS_ID, REP_ID, NPG_ID, 0,
              qDBF.FieldByName('oper_id').AsInteger,
              qDBF.FieldByName('LITR').AsFloat,
              qDBF.FieldByName('P_PRICE').AsFloat,
              qDBF.FieldByName('WEIGHT').AsFloat,
              qDBF.FieldByName('DENSITY').AsFloat,
              qDBF.FieldByName('SUMM').AsFloat);
        end;

        if isHand and (not cbLoadAddDBF.Checked) then
          iHandRecords := iHandRecords + 1;
      end;
      pbDetailed.StepIt;
      qDBF.Next;
    end;
    //--------------------------------------------------------------------------

    CommitSQL;
    iPackets := iPackets + 1;

    SRepAutoLoadLog(TranslateText('Количество обработанных строк: ')+ IntToStr(iRecords) +'.');
    SRepAutoLoadLog(TranslateText('Откорректировано остатки на ')+ DateToStr(REP_DATE_REST_CORR) +'.');
    SRepAutoLoadLog(TranslateText('Количество не загруженных строк с остатками: ')+ IntToStr(iRestRecords) +'.');
    SRepAutoLoadLog(TranslateText('Количество не загруженных строк (сменные отчеты введены вручную): ')+ IntToStr(iHandRecords) +'.');

    SRepAutoLoadLog(TranslateText('ЗАГРУЖЕН ')+TranslateText(' Организация: ')+ DEP_NAME +
      TranslateText(' Период с ')+ DateFrom +TranslateText(' по ')+ DateTo);

    // копіювання завантаженного файлу і видалення його
    CopyLoadedFile(sFileName, deLoadDir.Text +'\LoadedPacketsAZS', true);

    SL_AZS.SaveToFile(deLoadDir.Text +'\ImportListAZSId.cfg');
    SL_NPG.SaveToFile(deLoadDir.Text +'\ImportListNPGId.cfg');
    SL_NB.SaveToFile(deLoadDir.Text +'\ImportListNBId.cfg');
  finally
    pbDetailed.Position := 0;

    FreeAndNil(SL_AZS);
    FreeAndNil(SL_NPG);
    FreeAndNil(SL_NB);

    FreeAndNil(qPart);
    FreeAndNil(qRez);
    FreeAndNil(qRash);
    FreeAndNil(qRashMin);
  end;
end;
//==============================================================================
procedure TSRepAutoLoadF.GetAZS(
  SL: TStringList; ADep_id: integer;
  AAZS, ADepOKPO: string; var AId: integer);
var
  AZS_Num, pInst: integer;
  pName, pValue: string;
begin
  try
    pValue := AAZS +' '+ ADepOKPO;
    AId := -1;
    if (SL.Values[pValue] <> '') then // Выбор из сохраненных
      AId := StrToInt(SL.Values[pValue]);

    if AId = -1 then
      if TryStrToInt(AAZS, AZS_Num) then // Исчем по номеру
        AId := nvl(GetSqlValueParSimple(
          'select id from v_oil_azs where azs_num = :azs_num and par = :par and par_inst = :par_inst',
          ['azs_num', AZS_Num, 'par', ADep_id, 'par_inst', ADep_id]), -1);

    if AId = -1 then // Даем выбор
    begin
      ShowMessage('Сделайте выбор АЗС для значения '+ pValue);
      ChooseOrg.CaptureOrg(2, ADep_id, ADep_id, 'yyy', AId, pInst, pName);
      SL.Values[pValue] := IntToStr(AId); // Сохраняем выбор
    end;

    if AId = -1 then
      raise Exception.Create(TranslateText('Не выбрана АЗС для значения ')+ pValue);
  except on E: Exception do
    raise Exception.Create('GetAZS: '+ E.Message);
  end
end;
//==============================================================================
procedure TSRepAutoLoadF.GetNPG(SL: TStringList; AValue: string; var AId: integer);
begin
  try
    AId := -1;
    if SL.Values[AValue] <> '' then // Выбор из сохраненных
      AId := StrToInt(SL.Values[AValue]);

    if AId = -1 then // Даем выбор
    begin
      ShowMessage('Сделайте выбор группы НП для значения '+ AValue);
      XMLChoose('NpGroupRef', AId);
      SL.Values[AValue] := IntToStr(AId);
    end;

    if AId = -1 then
      raise Exception.Create(TranslateText('Не выбрана группа НП для значения ')+ AValue);
  except on E: Exception do
    raise Exception.Create('GetNPG: '+ E.Message);
  end
end;
//==============================================================================
procedure TSRepAutoLoadF.GetNB(SL: TStringList; ANB: string; var AId: integer);
var
  pInst: integer;
  pName: string;
begin
  if ANB <> '' then
  try
    AId := -1;
    if (SL.Values[ANB] <> '') then // Выбор из сохраненных
      AId := StrToInt(SL.Values[ANB]);

    if AId = -1 then // Даем выбор
    begin
      ShowMessage('Сделайте выбор НБ для значения '+ ANB);
      ChooseOrg.CaptureOrg(1, 0, 0, 'yyx', AId, pInst, pName);
      SL.Values[ANB] := IntToStr(AId); // Сохраняем выбор
    end;

    if AId = -1 then
      raise Exception.Create(TranslateText('Не выбрана НБ для значения ')+ ANB);
  except on E: Exception do
    raise Exception.Create('GetNB: '+ E.Message);
  end
end;
//==============================================================================
procedure TSRepAutoLoadF.SetPrihRepDBF(
  p_Date: TDateTime;
  p_REP_ID, p_DEP_ID, p_NB_ID, p_AZS_ID, p_NPG: integer;
  p_LITR, p_PRICE, p_WEIGHT, p_DENSITY: Real); // створюємо прихід НП на АЗС
var
  NB_ID, FROM_ID, FROM_INST: integer;
begin
  // повсюду будемо брати партію із найменшим ід
  qPart.Filtered := false;
  qPart.Filter   := 'grp_id = '+ IntToStr(p_NPG);
  qPart.Filtered := true;

  if p_NB_ID = 0 then
    NB_ID := p_DEP_ID
  else NB_ID := p_NB_ID;

  if NB_ID = 0 then
    NB_ID := MAIN_ORG.Inst;

  // повсюду будемо брати резервуар із найменшим ід
  qRez.Filtered := false;
  qRez.Filter   :=
    '  grp_id = '+ IntToStr(p_NPG) +' and '+
    '  id_org = '+ IntToStr(NB_ID) +' and '+
    'inst_org = '+ IntToStr(NB_ID);
  qRez.Filtered := true;

  // відпуски на АЗС
  qRash.Filtered := false;
  qRash.Filter   :=
    '     date_     = '+ QuotedStr(FormatDateTime('dd.mm.yyyy', p_Date)) +
    ' and inst      = '+ IntToStr(MAIN_ORG.Inst) +
    ' and np_grp    = '+ IntToStr(p_NPG) +
    ' and from_id   = '+ IntToStr(p_NB_ID) +
    ' and from_inst = '+ IntToStr(p_NB_ID) +
    ' and to_id     = '+ IntToStr(p_AZS_ID) +
    ' and to_inst   = '+ IntToStr(p_AZS_ID) +
    ' and litr      = '+ QuotedStr(FloatToStr(p_LITR)) +
    ' and count_    = '+ QuotedStr(FloatToStr(MRound(p_WEIGHT, DR_ROUND_COUNT))) +
    ' and ud_weig   = '+ QuotedStr(FloatToStr(p_DENSITY)) +
    ' and price     = '+ QuotedStr(FloatToStr(p_PRICE));
  qRash.Filtered := true;

  FROM_ID   := MAIN_ORG.Par;
  FROM_INST := MAIN_ORG.Par_inst;
  SRep.SMRep.GetSupplierPrih(FROM_ID, FROM_INST); // знаходимо постачальника

  SetPrihRep(
    trunc(p_Date),
    FROM_ID, NB_ID, p_AZS_ID, qPart.FieldByName('np_id').AsInteger,
    p_REP_ID, MAIN_ORG.Inst, // змінний звіт
    qRash.FieldByName('id').AsInteger, qRash.FieldByName('inst').AsInteger, // відпуск на АЗС
    qPart.FieldByName('id').AsInteger, qPart.FieldByName('inst').AsInteger, // партія
    qRez.FieldByName('id').AsInteger, qRez.FieldByName('inst').AsInteger,   // резервуар
    0, 0, // автомобіль
    0, 0, // водій
    trunc(p_Date),          // дата ТТН
    IntToStr(p_REP_ID), '', // номер ТТН, номер машини/цистерни
    p_LITR, p_PRICE, p_WEIGHT, p_DENSITY, 0,
    qRash.FieldByName('id').IsNull, // створюємо прихід на НБ
    qRash.FieldByName('id').IsNull, // створюємо відпуск з НБ
    true         // створюємо прихід на АЗС
  ); // створюємо прихід НП на АЗС
end;
//==============================================================================
procedure TSRepAutoLoadF.GetRashMin(p_NP: integer); // повсюду будемо брати відпуск на АЗС із найменшим ід
begin
  qRashMin.Close;
  qRashMin.SQL.Text :=
    'select min(p.np_type) as np_id, min(r.id) as id, r.inst,' +
    '       np.'+ decode([p_NP, 0, 'grp_id', 'id']) +' as np, r.to_id, r.to_inst' +
    '  from oil_rashod r, oil_part p, oil_np_type np' +
    ' where r.state = ''Y'' and p.state = ''Y'' and np.state = ''Y''' +
    '   and r.part_id = p.id and r.part_inst = p.inst' +
    '   and p.np_type = np.id' +
    ' group by r.inst, np.'+ decode([p_NP, 0, 'grp_id', 'id']) +', r.to_id, r.to_inst' +
    ' order by decode(ov.GetVal(''INST''), inst, 0, inst)';
  _OpenQuery(qRashMin);
end;
//==============================================================================
procedure TSRepAutoLoadF.GetRashMinFilter(p_AZS_ID, p_NPG, p_NP: integer); // фільтруємо qRashMin
begin
  qRashMin.Filtered := false;
  qRashMin.Filter   :=
    '     np      = '+ IntToStr(decode([p_NP, 0, p_NPG, p_NP])) +
    ' and to_id   = '+ IntToStr(p_AZS_ID) +
    ' and to_inst = '+ IntToStr(p_AZS_ID);
  qRashMin.Filtered := true;
end;
//==============================================================================
procedure TSRepAutoLoadF.SetRashRepDBF(
  p_AZS_ID, p_REP_ID, p_NPG, p_NP, p_OPER_ID: integer;
  p_LITR, p_PRICE, p_WEIGHT, p_DENSITY, p_SUMM: Real); // створюємо реалізацію НП на АЗС
var
  DR_ID: integer;
  qDRRash: TOilQuery;
  OUT_NAL_LITR, OUT_NAL_COUNT, OUT_NAL_MONEY,
  OUT_VED_LITR, OUT_VED_COUNT, OUT_VED_MONEY,
  OUT_TALON_LITR, OUT_TALON_COUNT, OUT_TALON_MONEY,
  OUT_SN_LITR, OUT_SN_COUNT, OUT_SN_MONEY,
  OUT_LITR, OUT_COUNT, OUT_MONEY: variant;
begin
  if qRashMin = nil then
  begin
    qRashMin := TOilQuery.Create(nil);
    GetRashMin(p_NP); // повсюду будемо брати відпуск на АЗС із найменшим ід
  end;
  GetRashMinFilter(p_AZS_ID, p_NPG, p_NP); // фільтруємо qRashMin

  if qRashMin.FieldByName('id').IsNull then
  begin
    GetRashMin(p_NP); // повсюду будемо брати відпуск на АЗС із найменшим ід
    GetRashMinFilter(p_AZS_ID, p_NPG, p_NP); // фільтруємо qRashMin
  end;

  qDRRash := TOilQuery.Create(nil);
  try
    // знаходимо реалізацію по необхідному торару
    qDRRash.SQL.Text :=
      'select /*+ORDERED*/' +
      ' drd.id,' +
      ' out_nal_litr, out_nal_count, out_nal_money,' +
      ' out_ved_litr, out_ved_count, out_ved_money,' +
      ' out_talon_litr, out_talon_count, out_talon_money,' +
      ' out_sn_litr, out_sn_count, out_sn_money,' +
      ' out_litr, out_count, out_money' +
      '  from oil_dr_data drd, oil_rashod r, oil_part p, oil_np_type np' +
      ' where r.state = ''Y'' and p.state = ''Y'' and np.state = ''Y'' and drd.state = ''Y''' +
      '   and r.part_id = p.id and r.part_inst = p.inst' +
      '   and p.np_type = np.id' +
      '   and drd.oper_type = 1' +
      '   and r.to_id = :azs_id and r.to_inst = :azs_id' +
      '   and drd.rep_id = :rep_id and drd.rep_inst = :rep_inst' +
      '   and np.'+ decode([p_NP, 0, 'grp_id', 'id']) +' = :np_id' +
      '   and drd.ttn_id = r.id and drd.ttn_inst = r.inst';
    _OpenQueryPar(qDRRash,
      ['np_id',    decode([p_NP, 0, p_NPG, p_NP]),
       'azs_id',   p_AZS_ID,
       'rep_id',   p_REP_ID,
       'rep_inst', MAIN_ORG.Inst]);

    if not qRashMin.FieldByName('id').IsNull then
    begin
      if qDRRash.FieldByName('id').IsNull then
        DR_ID := GetNextId('OIL_DR_DATA', ['REP_ID', p_REP_ID, 'REP_INST', MAIN_ORG.Inst])
      else
        DR_ID := qDRRash.FieldByName('id').AsInteger;

      {за нал/р (л)  		      	0
      по ведомостям (л)           	11
      по визе (л)  		         	201

      по ТК УКРНАФТА (л)		      277
      по ТК РД АВИАС (л)		      276
      по ТК МРД АВИАС (л)		      275

      по СКРЕТЧ РД АВИАС (л)		   274
      по СКРЕТЧ МРД АВИАС (л)  	   273

      по ТАЛОНАМ РД  ANP (л)		   14
      по СМАРТ КАРТАМ МРД  ANP(л)	153

      тал. РД (л) бумажные разовые	272
      тал МРД (л) бумажные разовые	272
      тал. РД (л) нового образца    271
      тал МРД (л) нового образца    270

      Корректировка остатков тонн   278}

      if p_OPER_ID >= 0 then
      begin
        OUT_NAL_LITR    := qDRRash.FieldByName('OUT_NAL_LITR').AsFloat;
        OUT_NAL_COUNT   := qDRRash.FieldByName('OUT_NAL_COUNT').AsFloat;
        OUT_NAL_MONEY   := qDRRash.FieldByName('OUT_NAL_MONEY').AsFloat;
        OUT_VED_LITR    := qDRRash.FieldByName('OUT_VED_LITR').AsFloat;
        OUT_VED_COUNT   := qDRRash.FieldByName('OUT_VED_COUNT').AsFloat;
        OUT_VED_MONEY   := qDRRash.FieldByName('OUT_VED_MONEY').AsFloat;
        OUT_TALON_LITR  := qDRRash.FieldByName('OUT_TALON_LITR').AsFloat;
        OUT_TALON_COUNT := qDRRash.FieldByName('OUT_TALON_COUNT').AsFloat;
        OUT_TALON_MONEY := qDRRash.FieldByName('OUT_TALON_MONEY').AsFloat;
        OUT_SN_LITR     := qDRRash.FieldByName('OUT_SN_LITR').AsFloat;
        OUT_SN_COUNT    := qDRRash.FieldByName('OUT_SN_COUNT').AsFloat;
        OUT_SN_MONEY    := qDRRash.FieldByName('OUT_SN_MONEY').AsFloat;
        OUT_LITR        := qDRRash.FieldByName('OUT_LITR').AsFloat;
        OUT_COUNT       := qDRRash.FieldByName('OUT_COUNT').AsFloat;
        OUT_MONEY       := qDRRash.FieldByName('OUT_MONEY').AsFloat;

        case p_OPER_ID of
          0:
          begin
            OUT_NAL_LITR  := OUT_NAL_LITR  + p_LITR;
            OUT_NAL_COUNT := OUT_NAL_COUNT + p_WEIGHT;
            OUT_NAL_MONEY := OUT_NAL_MONEY + p_SUMM;
          end;
          11:
          begin
            OUT_VED_LITR  := OUT_VED_LITR  + p_LITR;
            OUT_VED_COUNT := OUT_VED_COUNT + p_WEIGHT;
            OUT_VED_MONEY := OUT_VED_MONEY + p_SUMM;
          end;
          14:
          begin
            OUT_TALON_LITR  := OUT_TALON_LITR  + p_LITR;
            OUT_TALON_COUNT := OUT_TALON_COUNT + p_WEIGHT;
            OUT_TALON_MONEY := OUT_TALON_MONEY + p_SUMM;
          end;
          153, 201, 270, 271, 272, 273, 274, 275, 276, 277, 278, 55:
          begin
            OUT_LITR  := OUT_LITR  + p_LITR;
            OUT_COUNT := OUT_COUNT + p_WEIGHT;
            OUT_MONEY := OUT_MONEY + p_SUMM;
          end;
          else
            raise Exception.CreateFmt('Не обработаная операция %d',[p_OPER_ID])
        end;
      end;

      DBSaver.SaveRecord('OIL_DR_DATA',
        ['ID',              DR_ID,
         'STATE',           'Y',
         'INST',            MAIN_ORG.Inst,
         'REP_ID',          p_REP_ID,
         'REP_INST',        MAIN_ORG.Inst,
         'OPER_TYPE',       1,
         'TTN_ID',          qRashMin.FieldByName('id').AsInteger,
         'TTN_INST',        qRashMin.FieldByName('inst').AsInteger,
         'PR_LITR',         null,
         'PR_UD_WEIG',      p_DENSITY,
         'PR_COUNT',        null,
         'S_PRICE',         p_PRICE,
         'OUT_NAL_LITR',    OUT_NAL_LITR,
         'OUT_NAL_COUNT',   MRound(OUT_NAL_COUNT, DR_ROUND_COUNT),
         'OUT_NAL_MONEY',   OUT_NAL_MONEY,
         'OUT_VED_LITR',    OUT_VED_LITR,
         'OUT_VED_COUNT',   MRound(OUT_VED_COUNT, DR_ROUND_COUNT),
         'OUT_VED_MONEY',   OUT_VED_MONEY,
         'OUT_TALON_LITR',  OUT_TALON_LITR,
         'OUT_TALON_COUNT', MRound(OUT_TALON_COUNT, DR_ROUND_COUNT),
         'OUT_TALON_MONEY', OUT_TALON_MONEY,
         'OUT_SN_LITR',     OUT_SN_LITR,
         'OUT_SN_COUNT',    MRound(OUT_SN_COUNT, DR_ROUND_COUNT),
         'OUT_SN_MONEY',    OUT_SN_MONEY,
         'OUT_RASH_ID',     null,
         'OUT_LITR',        OUT_LITR,
         'OUT_COUNT',       MRound(OUT_COUNT, DR_ROUND_COUNT),
         'OUT_MONEY',       OUT_MONEY,
         'SUB_PART',        qRashMin.FieldByName('np_id').AsInteger,
         'START_SM',        0,
         'END_SM',          0
        ]);

      if p_OPER_ID > 0 then
      begin
        case p_OPER_ID of
          11:
            begin
              DBSaver.SaveRecord('OIL_VEDOMOST',
                ['ID',        GetNextId('OIL_VEDOMOST', ['SREP_ID', DR_ID, 'SREP_INST', MAIN_ORG.Inst]),
                 'STATE',     'Y',
                 'INST',      MAIN_ORG.Inst,
                 'SREP_ID',   DR_ID,
                 'SREP_INST', MAIN_ORG.Inst,
                 'LITR',      p_LITR,
                 'COUNT_T',   MRound(p_WEIGHT, DR_ROUND_COUNT),
                 'PRICE',     p_PRICE,
                 'AMOUNT',    p_SUMM
                ]);
            end;
          14:
            begin
              DBSaver.SaveRecord('OIL_SRTALON',
                ['ID',        GetNextId('OIL_SRTALON', ['SREP_ID', DR_ID, 'SREP_INST', MAIN_ORG.Inst]),
                 'STATE',     'Y',
                 'INST',      MAIN_ORG.Inst,
                 'SREP_ID',   DR_ID,
                 'SREP_INST', MAIN_ORG.Inst,
                 'SER',       null,
                 'NUM',       0,
                 'LITR',      p_LITR,
                 'COUNT_T',   MRound(p_WEIGHT, DR_ROUND_COUNT),
                 'PRICE',     p_PRICE,
                 'INTHEWAY',  4
                ]);
            end;
          153, 201, 270, 271, 272, 273, 274, 275, 276, 277, 278, 55:
            begin
              DBSaver.SaveRecord('OIL_SROTHER',
                ['ID',          GetNextId('OIL_SROTHER', ['SREP_ID', DR_ID, 'SREP_INST', MAIN_ORG.Inst]),
                 'STATE',       'Y',
                 'INST',        MAIN_ORG.Inst,
                 'SREP_ID',     DR_ID,
                 'SREP_INST',   MAIN_ORG.Inst,
                 'OPER_ID',     p_OPER_ID,
                 'LITR',        p_LITR,
                 'COUNT_T',     MRound(p_WEIGHT, DR_ROUND_COUNT),
                 'PRICE',       p_PRICE,
                 'AMOUNT',      p_SUMM
                ]);
            end;
        end;
      end;
    end
    else
      raise Exception.Create(TranslateText('Не найдено отпуска на АЗС для группы НП ')+ IntToStr(p_NPG));
  finally
    FreeAndNil(qDRRash);
  end;
end;
//==============================================================================
procedure TSRepAutoLoadF.SaveDbLog(AResultType: TUploadResultType; AResultComment, AFileName: string;
  ARepId, ARepInst: variant);
var
  ResultCode: integer;

  //****************************************************************************
  function GetCommentOil(): string;
  var
    i: integer;
    sl: TStringList;
    IsProcessed: boolean;
  begin
    sl := TStringList.Create;
    try
      IsProcessed := False;
      // Читаем лог с конца (ЗАГРУЖЕН) до начала загрузки
      for i := slSRepMes.Count-1 downto 0 do
      begin
        if pos('ЗАГРУЖЕН', slSRepMes[i]) <> 0 then
          IsProcessed := True;
        if IsProcessed then
          sl.Insert(0, slSRepMes[i]);
        if pos('Начало загрузки файла', slSRepMes[i]) <> 0 then
          break;
      end;
      Result := sl.Text;
    finally
      FreeAndNil(sl);
    end;
  end;
  //****************************************************************************

begin
  if DBObjectExists('EXCH_RECEIVE_AZS', 'TABLE', DBSaver.OS.Username) then
  begin
    case AResultType of
      urtSuccessful:   ResultCode := 0;
      urtUnSuccessful: ResultCode := 1;
      else
        raise Exception.Create(TranslateText('SaveDbLog: Не определен код результата загрузки!'));
    end;

    if (AResultComment = '') and cbFileExpOil.Checked then
      AResultComment := GetCommentOil();

    DBSaver.SaveRecord('EXCH_RECEIVE_AZS',
     ['ID',           GetNextId('EXCH_RECEIVE_AZS', ['REP_ID', ARepId, 'REP_INST', ARepInst]),
      'INST',         MAIN.INST,
      'STATE',        'Y',
      'EXCH_TYPE',    decode([cbFileExpOil.Checked, true, 1, 2]),
      'REP_ID',       ARepId,
      'REP_INST',     ARepInst,
      'DATE_RECEIVE', GetSystemDate(),
      'RESULT',       ResultCode,
      'RES_COMMENT',  copy(AResultComment, 1, 2048),
      'FILENAME',     ExtractFileName(AFileName)]);
  end;
end;
//==============================================================================
class procedure TSRepAutoLoadF.DailyRepAddRash(
  p_AZS_ID, p_REP_ID, p_NPG, p_NP, p_OPER_ID: integer;
  p_LITR, p_PRICE, p_WEIGHT, p_DENSITY, p_SUMM: Real);
var
  FAL: TSRepAutoLoadF;
begin
  FAL := TSRepAutoLoadF.Create(nil);
  try
    FAL.SetRashRepDBF(
      p_AZS_ID, p_REP_ID, p_NPG, p_NP, p_OPER_ID,
      p_LITR, p_PRICE, p_WEIGHT, p_DENSITY, p_SUMM);
  finally
    FreeAndNil(FAL);
  end;
end;
//==============================================================================
procedure TSRepAutoLoadF.eFTPNameChange(Sender: TObject);
begin
  sbSaveSettings.Enabled := true;
  cbFileErrorLoadOnFTP.Enabled := eFTPName.Text <> '';
  eProxyHost.Enabled := cbFileErrorLoadOnFTP.Enabled;
  eProxyPort.Enabled := cbFileErrorLoadOnFTP.Enabled;
end;
//==============================================================================
procedure TSRepAutoLoadF.sbSaveSettingsClick(Sender: TObject);
begin
  WritePieceOfRegistry('SRepAutoLoadDir',       deLoadDir.Text);
  WritePieceOfRegistry('SRepAutoLoadFTP',       eFTPName.Text);
  WritePieceOfRegistry('SRepAutoLoadProxyHost', eProxyHost.Text);
  WritePieceOfRegistry('SRepAutoLoadProxyPort', eProxyPort.Text);
  WritePieceOfRegistry('SRepAutoLoadTimeFrom',  metFrom.Text);
  WritePieceOfRegistry('SRepAutoLoadTimeTo',    metTo.Text);
  WritePieceOfRegistry('SRepAutoLoadPeriods',   ePeriods.Text);
  WritePieceOfRegistry('SRepAutoLoadFileErrorLoadOnFTP_Checked', decode([cbFileErrorLoadOnFTP.Checked, true, '1', '0']));
  WritePieceOfRegistry('SRepAutoLoadAddDBF_Checked',             decode([cbLoadAddDBF.Checked,         true, '1', '0']));
  WritePieceOfRegistry('SRepAutoLoadAddSections_Checked',        decode([cbLoadAddSections.Checked,    true, '1', '0']));
  WritePieceOfRegistry('SRepAutoLoadMyPack_Checked',             decode([cbLoadMyPack.Checked,         true, '1', '0']));
  sbSaveSettings.Enabled := false;
end;
//==============================================================================
procedure TSRepAutoLoadF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qRashMin <> nil then // повсюду будемо брати відпуск на АЗС із найменшим ід
    FreeAndNil(qRashMin);
  FreeAndNil(slSRepMes);
  DR_AUTOLOAD := false;
end;
//==============================================================================
procedure TSRepAutoLoadF.FileErrorLoadOnFTP(sFileName: string);
// Файлы, загруженные с ошибками выкладывать на FTP
var
  sFileNameNEW: string;
begin
  sFileName := CopyLoadedFile(sFileName, ExtractFilePath(sFileName),
    true, 'Error_');
  sFileNameNEW := ExtractFilePath(sFileName) +'Error_'+ ExtractFileName(sFileName);

  RenameFile(sFileName, sFileNameNEW);


  if cbFileErrorLoadOnFTP.Checked then
  try
    if ConnectFTP then
    try
      IdFTP.Put(sFileNameNEW, ExtractFileName(sFileNameNEW));
      SRepAutoLoadLog(TranslateText('Файл отправлен на FTP'));
    finally
      IdFTP.Disconnect;
    end;
  except
    SRepAutoLoadLog(TranslateText('Файл НЕ отправлен на FTP'));
  end;
end;
//==============================================================================
function TSRepAutoLoadF.CopyLoadedFile(p_FileName, p_Dir: string; p_Del: boolean;
  p_NoFileName: string = ''): string;
// шукає вільну назву файлу у директорії і копіює туди файл
var
  sFileNameTo, sExt, sName, sNameTemp: string;
  i, iTemp, iExt, iName: integer;
begin
  if p_Dir[length(p_Dir)] = '\' then
    p_Dir := copy(p_Dir, 1, length(p_Dir)-1);

  sFileNameTo := p_Dir +'\'+ ExtractFileName(p_FileName);

  // назва файлу
  sName := ExtractFileName(sFileNameTo);
  iName := length(sName);

  // розширення файлу
  sExt := ExtractFileExt(sFileNameTo);
  iExt := length(sExt);

  // шукаємо останній "_"
  iTemp := 0;
  for i := length(sName) downto 1 do
    if sName[i] = '_' then
    begin
      iTemp := length(sName) - i + 1;
      break;
    end;

  // якщо розмір змінився до 2, то дозволяємо зміну
  sNameTemp := copy(sName, 1, iName - iTemp) + sExt;
  if abs(length(sNameTemp) - length(sName)) <= 2 then
  begin
    sName := sNameTemp;
    iName := length(sName);
    sFileNameTo := p_Dir +'\'+ ExtractFileName(sName);
  end;

  // шукаємо вільну назву файлу
  for i := 1 to 99 do
    if FileExists(sFileNameTo)
      or FileExists(p_Dir +'\'+ p_NoFileName + ExtractFileName(sFileNameTo)) then
      sFileNameTo :=
        p_Dir +'\'+ copy(sName, 1, iName - iExt) +'_'+ IntToStr(i) + sExt
    else break;

  CopyFile(PChar(p_FileName), PChar(sFileNameTo), false);
  if p_Del then
    DeleteFile(p_FileName);
  result := sFileNameTo;
end;
//==============================================================================
function TSRepAutoLoadF.SetRestNPDailyRep(
  p_AzsID, p_NpgID, p_NpID: integer; // АЗС, Група НП або Тип НП
  p_RestLitr, p_RestCount: real;     // залишок, який має бути на дату p_Date
  p_Date: TDateTime;                 // дата, на яку треба мати залишок p_RestLitr і p_RestCount
  var p_RepID: integer;              // ID шапки змінного звіту із корегуючими даними
  p_AutoLoad: string='Y';            // тип загрузки
  p_Commit: boolean=false            // чи зберігати дані у цій процедурі
): boolean; // якщо false, то товар не відпускався на АЗС
var
  RashLitr, RashCount: real;
begin
  result := true;

  if p_Commit then StartSQL;

  try
    if (p_AzsID = 0) or (p_Date = 0)
      or ((p_NpgID = 0) and (p_NpID = 0))
      or ((p_NpgID <> 0) and (p_NpID <> 0)) then
      raise Exception.Create(
        TranslateText('Неверно введены параметры процедуры SetRestNPDailyRep!'));

    // знаходимо залишки
    if p_NpgID = 0 then qRestNP.SQL.Text := qRestNP.BaseSQL +' and c.np_type_id = :p_np'
    else                qRestNP.SQL.Text := qRestNP.BaseSQL +' and c.np_grp     = :p_np';
    _OpenQueryPar(qRestNP,
      ['p_rep_date', p_Date,
       'p_azs_id',   p_AzsID,
       'p_np',       decode([p_NpgID, 0, p_NpID, p_NpgID])]);

    if qRestNP.IsEmpty then
      raise Exception.Create(
        TranslateText('Не найдено отпусков на ')+ GetOrgName(p_AzsID, p_AzsID) +
        TranslateText(' для группы НП ')+ IntToStr(p_NpgID));

    if (p_RepID = 0) then
    begin
      // можливо за цей день вже були зміни із корегуючими залишками
      try
        p_RepID := nvl(GetSqlValueParSimple(
          'select id from oil_daily_rep' +
          ' where state = ''Y''' +
          '   and inst = :p_inst' +
          '   and azs_id = :p_azs_id and azs_inst = :p_azs_id' +
          '   and to_date(to_char(rep_date,    ''dd.mm.yyyy HH24:mi''), ''dd.mm.yyyy HH24:mi'') =' +
          '       to_date(to_char(:p_rep_date, ''dd.mm.yyyy HH24:mi''), ''dd.mm.yyyy HH24:mi'')',
          ['p_rep_date', StrToDateTime(FormatDateTime('dd.mm.yyyy hh:nn:ss', p_Date - 1 / (24 * 60))),
           'p_azs_id',   p_AzsID,
           'p_inst',     MAIN_ORG.Inst]), 0);
      except
        p_RepID := 0;
      end;

      if p_RepID = 0 then // шапка змінного звіту
        p_RepID := DBSaver.SaveRecord('OIL_DAILY_REP',
          ['ID',        GetNextId('OIL_DAILY_REP', ['INST', MAIN_ORG.Inst, 'AUTO_LOAD', 'Y'], 'S_DAILY_REP'),
           'STATE',     'Y',
           'INST',      MAIN_ORG.Inst,
           'REP_DATE',  StrToDateTime(FormatDateTime('dd.mm.yyyy hh:nn:ss', p_Date - 1 / (24 * 60))),
           'AZS_ID',    p_AzsID,
           'AZS_INST',  p_AzsID,
           'REP_NUM',   1,
           'SMENA_NUM', 1,
           'EMP_ID',    null,
           'EMP_INST',  null,
           'AUTO_LOAD', p_AutoLoad,
           'USER_ID',   SUPER_REAL_EMP_ID
          ]);
    end;
    RashLitr  := MRound(qRestNP.FieldByName('RestOpenL').AsFloat - p_RestLitr, 3);
    RashCount := MRound(qRestNP.FieldByName('RestOpenT').AsFloat - p_RestCount, DR_ROUND_COUNT);

    if (RashLitr <> 0) or (RashCount <> 0) and (p_RepID <> 0) then
      SetRashRepDBF(
        p_AzsID, p_RepID, p_NpgID, p_NpID, 278,
        RashLitr, qRestNP.FieldByName('s_price').AsFloat, RashCount,
        qRestNP.FieldByName('ud_weig').AsFloat, RashLitr * qRestNP.FieldByName('s_price').AsFloat);

    if p_Commit then CommitSQL;
  except on E: Exception do
    begin
      result := false;    
      if p_Commit then RollbackSQL;
      raise Exception.Create(TranslateText('Ошибка при корректировке остатков по : ')+ E.Message);
    end;
  end
end;
//==============================================================================
procedure TSRepAutoLoadF.eProxyHostKeyPress(Sender: TObject; var Key: Char);
begin
  if key = ',' then key := '.';
  if not (key in ['0'..'9', '.', #8]) then key := #0;
end;
//==============================================================================
procedure TSRepAutoLoadF.cbLoadAddSectionsClick(Sender: TObject);
begin
  lSections.Enabled    := cbLoadAddSections.Checked and cbLoadAddSections.Enabled;
  dblcSections.Enabled := lSections.Enabled;
  sbSections.Enabled   := lSections.Enabled;
  if lSections.Enabled and not qSections.Active then
    _OpenQuery(qSections);
  eFTPNameChange(nil);
end;
//==============================================================================
procedure TSRepAutoLoadF.sbSectionsClick(Sender: TObject);
begin
  dblcSections.KeyValue := '';
end;
//==============================================================================
procedure TSRepAutoLoadF.SetPrihRep(
  p_Date: TDateTime;
  p_From {від кого}, p_NB {яка НБ}, p_AZS {якій АЗС}, p_Np,
  p_Rep_id, p_Rep_inst,          // змінний звіт
  p_Rash_id, p_Rash_inst,        // відпуск на АЗС
  p_Part_id, p_Part_inst,        // партія
  p_Rez_id, p_Rez_inst,          // резервуар
  p_Auto_id, p_Auto_inst,        // автомобіль
  p_Emp_id, p_Emp_inst: integer; // водій
  p_TTN_Date: TDateTime; // дата ТТН
  p_TTN, p_Car: string;  // номер ТТН, номер машини/цистерни
  p_Litr, p_Price, p_Weight, p_Density, p_Temper: Real;
  p_CH_Prih: boolean=true; // створюємо прихід на НБ
  p_CH_Rash: boolean=true; // створюємо відпуск з НБ
  p_CH_DR  : boolean=true  // створюємо прихід на АЗС
); // створюємо прихід НП на АЗС
var
  Prih_id, Rash_id: integer;
begin
  if (p_Part_id = 0) or (p_Rez_id = 0) then
    raise Exception.Create(
      TranslateText('Приход не создан!') +#13+
      TranslateText('Не найдено партию и резервуар') +
      TranslateText(' (по организации "')+ GetOrgName(p_NB, p_NB) +
      TranslateText('") для типа НП ')+ IntToStr(p_Np)
    );

  Rash_id := 0;

  if p_CH_Prih then
  begin
    Prih_id := DBSaver.SaveRecord('OIL_PRIHOD',
      ['ID',            GetNextId('OIL_PRIHOD',
                          ['INST',  MAIN_ORG.Inst,
                           'DATE_', FormatDateTime('dd.mm.yyyy', p_Date)], 'S_OIL_PRIH'),
       'STATE',         'Y',
       'INST',          MAIN_ORG.Inst,
       'EMP_ID',        EMP_ID,
       'DATE_',         FormatDateTime('dd.mm.yyyy', p_Date),
       'DATE_DOC',      FormatDateTime('dd.mm.yyyy', p_Date),
       'DATE_DOC_RAIL', FormatDateTime('dd.mm.yyyy', p_Date),
       'DATE_OTPR',     FormatDateTime('dd.mm.yyyy', p_Date),
       'OPER_ID',       1, // Приход собственого товара
       'DOST',          3, // Автоцистерна
       'NP_TYPE',       p_Np,
       'FROM_',         p_From,
       'FROM_INST',     p_From,
       'TO_',           p_NB,
       'TO_INST',       p_NB,
       'PART_ID',       p_Part_id,
       'PART_INST',     p_Part_inst,
       'DAYS_ON_WAY',   1
      ]);

    DBSaver.SaveRecord('OIL_PRIH_DET',
      ['ID',                GetNextId('OIL_PRIH_DET', ['INST', MAIN_ORG.Inst, 'PRIHOD_ID', Prih_id]),
       'STATE',             'Y',
       'INST',              MAIN_ORG.Inst,
       'PRIHOD_ID',         Prih_id,
       'NAKL',              p_TTN,
       'TANK',              p_Car,
       'DOC_COUNT',         MRound(p_Weight, DR_ROUND_COUNT),
       'FACT_COUNT',        MRound(p_Weight, DR_ROUND_COUNT),
       'REZ',               p_Rez_id,
       'REZ_INST',          p_Rez_inst,
       'NED_NORM_UB',       0,
       'NED_NORM_ER',       0,
       'NED_POST',          0,
       'NED_RAIL',          0,
       'IZL_NORM',          0,
       'IZL_POST',          0,
       'IS_DIGITAL_WEIGHT', 1,
       'TECH_LOSS',         0
      ]);
  end;

  if p_CH_Rash then
  begin
    Rash_id := DBSaver.SaveRecord('OIL_RASHOD',
      ['ID',          GetNextId('OIL_RASHOD',
                        ['INST',  MAIN_ORG.Inst,
                         'DATE_', FormatDateTime('dd.mm.yyyy', p_Date)], 'S_OIL_RASH'),
       'STATE',       'Y',
       'INST',        MAIN_ORG.Inst,
       'EMP_ID',      EMP_ID,
       'DATE_',       FormatDateTime('dd.mm.yyyy', p_Date),
       'FROM_ID',     p_NB,
       'FROM_INST',   p_NB,
       'TO_ID',       p_AZS,
       'TO_INST',     p_AZS,
       'OPER_ID',     10,
       'TTN_NUM',     decode([p_TTN, '', null, p_TTN]),
       'TTN_DATE',    FormatDateTime('dd.mm.yyyy', p_TTN_Date),
       'PART_ID',     p_Part_id,
       'PART_INST',   p_Part_inst,
       'REZ',         p_Rez_id,
       'REZ_INST',    p_Rez_inst,
       'AUTO_ID',     decode([p_Auto_id,   0, null, p_Auto_id]),
       'AUTO_INST',   decode([p_Auto_inst, 0, null, p_Auto_inst]),
       'EMPLOY_ID',   decode([p_Emp_id,   0, null, p_Emp_id]),
       'EMPLOY_INST', decode([p_Emp_inst, 0, null, p_Emp_inst]),
       'TEMPER',      p_Temper,
       'UD_WEIG',     p_Density,
       'LITR',        p_Litr,
       'COUNT_',      MRound(p_Weight, DR_ROUND_COUNT),
       'PRICE',       p_Price,
       'SUMMA',       MRound(p_Litr * p_Price, 2),
       'PACK',        decode([p_Np, 62, TranslateText('Пропановоз'), TranslateText('Бензовоз')]),
       'INCL_DEBET',  'Y',
       'SBOR_POST',   'N',
       'SBOR_NAC',    'N',
       'SBOR_NDS',    'N',
       'UCH_PRICE',   'N',
       'OWN_GOOD',    'N',
       'USER_ID',     SUPER_REAL_EMP_ID]);
  end;

  if p_CH_DR then
  begin
    DBSaver.SaveRecord('OIL_DR_DATA',
      ['ID',              GetNextId('OIL_DR_DATA', ['REP_ID', p_Rep_id, 'REP_INST', MAIN_ORG.Inst]),
       'STATE',           'Y',
       'INST',            MAIN_ORG.Inst,
       'REP_ID',          p_Rep_id,
       'REP_INST',        p_Rep_inst,
       'OPER_TYPE',       0,
       'TTN_ID',          decode([Rash_id, 0, p_Rash_id,   Rash_id]),
       'TTN_INST',        decode([Rash_id, 0, p_Rash_inst, MAIN_ORG.Inst]),
       'PR_LITR',         p_Litr,
       'PR_UD_WEIG',      p_Density,
       'PR_COUNT',        MRound(p_Weight, DR_ROUND_COUNT),
       'S_PRICE',         p_Price,
       'OUT_NAL_LITR',    null,
       'OUT_NAL_COUNT',   null,
       'OUT_NAL_MONEY',   null,
       'OUT_VED_LITR',    null,
       'OUT_VED_COUNT',   null,
       'OUT_VED_MONEY',   null,
       'OUT_TALON_LITR',  null,
       'OUT_TALON_COUNT', null,
       'OUT_TALON_MONEY', null,
       'OUT_SN_LITR',     null,
       'OUT_SN_COUNT',    null,
       'OUT_SN_MONEY',    null,
       'OUT_RASH_ID',     null,
       'OUT_LITR',        null,
       'OUT_COUNT',       null,
       'OUT_MONEY',       null,
       'SUB_PART',        p_Part_id,
       'START_SM',        null,
       'END_SM',          null
      ]);
  end;
end;
//==============================================================================

end.
