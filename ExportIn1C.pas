unit ExportIn1C;
{ ---------------------------
  Created by Urise 06.10.2004
  ---------------------------
  Все данные о том, что нужно экспортировать находятся в хранимых запросах в
  EXE_SQL.
  Каждый хранимый хапрос может иметь заголовок, то есть ряд строк начиная с первой,
  которые начинаются с --
  Запросы, которые будут выгружаться относятся к форме ExportIn1C и
  содержат в заголовке строчку-псевдокомментарий вида
  --$DESC=<тип выгрузки>
  Такие хранимые запросы попадают в грид "Тип выгрузки" с помощью запроса qLoad.
  Каждый запрос для выгрузки имеет заголовок, в котором определены переменные,
  то есть строки типа --$<переменная>=<значение>.
  Две переменные должны присутствовать обязательно:
  DESC - тип выгрузки и
  FILE - хвостик в имени файла dbf, которое имеет формат типа 030804si.dbf, где
         первые шесть цифр - это дата, а si - тот самый хвостик

  Одна необязательная переменная:
  UNLOAD_TYPE - может принимать два значения:
                BYDATE - для каждой даты создается отдельный файл с датой в имени
                WHOLE - все данные вносятся скопом в один файй, имя которого
                        имеет формат типа 010904nn.dbf, где первые шесть цифр -
                        дата выгрузки
                по умолчанию если параметр не проставлен явно, он считается
                равным BYDATE.

  UNLOAD_FORMAT - Определяет тип файла на выходе, может принимать два значения:
                 ".txt", ".dbf"
                 по умолчанию если параметр не проставлен явно, он считается
                   равным ".dbf".

  Также в заголовке могут присутствовать псевдокомментарии вида:
  --%SUMMA=2
  Такие строки служат для того, чтобы определить количество знаков после запятой
  поля типа Float в полученном dbf. По умолчанию ставится 6 знаков после запятой.
  Строки типа --% следует указать для всех числовых полей, если это целое поле, то
  поставить ноль, в остальных указать число знаков.

  Для того, чтобы добавить новую выгрузку в 1С достаточно добавить хранимый запрос,
  удовлетворяющий описанным требованиям (делается с помощью Supervisor и рассылается
  пакетами)

  Процесс выгрузки отображается в логе, имя которого указано в константе LOG_NAME.

  Есть возможность автовыгрузки, для этого нужно при запуске программы проставить
  параметр RUN_OIL_EXPORT и INI=path/to/file.ini, в ini-файле в секиции RUN_OIL_EXPORT
  указываються параметры работы выгрузки. Возможные параметры:
  AzsList - список Id АЗС, через запятую 
  ExportList - список Id выгрузок, через запятую
  Interval - интервал времи между которыми будет делаться провека на возможность
    выгрузки и сама выгрузка
  LastRun - исходящий параметр, в который проставляеться текущая дата, который
    проставляеться когда выгрузка успешно прошла. В текущем дне выгрузка дважды
    не произойдет. 

  Пример ini-файла:

  [RUN_OIL_EXPORT]
  AzsList=1000000,1000001
  ExportList=43443,34344
  Interval=60000
  LastRun=13.11.2009
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, Ora, Db, DBTables, MemTable, StdCtrls, Buttons, ExtCtrls,
  MemDS, DBAccess, Mask, ToolEdit, uCommonForm,uOilQuery,uOilStoredProc,IniFiles;

type
  TExportIn1CForm = class(TCommonForm)
    grid1: TDBGridEh;
    pnlBtnAutoUnload: TPanel;
    bbCancel: TBitBtn;
    mt: TMemoryTable;
    ds: TOraDataSource;
    qLoad: TOilQuery;
    qLoadID: TFloatField;
    qLoadDESCRIPTION: TStringField;
    mtID: TFloatField;
    mtDESCRIPTION: TStringField;
    mtCHECKED: TBooleanField;
    pTop: TPanel;
    Label1: TLabel;
    deBegin: TDateEdit;
    Label2: TLabel;
    deEnd: TDateEdit;
    dir1: TDirectoryEdit;
    Label3: TLabel;
    sbAutoLoad: TSpeedButton;
    pnlBtnNormal: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel5: TPanel;
    SpeedButton4: TSpeedButton;
    Panel6: TPanel;
    SpeedButton5: TSpeedButton;
    TimerAutoUpload: TTimer;
    qTestAutoUpload: TOraQuery;
    LblNextDate: TLabel;
    LblNextDateValue: TLabel;
    procedure bbOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mtAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure grid1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ExportOne;
    procedure ExportAll;
    procedure InitLog;
    procedure LogExp(p_Str: string);
    procedure CloseLog;
    procedure grid1ColWidthsChanged(Sender: TObject);
    procedure SetChecked(p_Value: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure deBeginChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure TimerAutoUploadTimer(Sender: TObject);
    procedure sbAutoLoadClick(Sender: TObject);
  private
    { Private declarations }
    FLog: TextFile;
    FTxt: TextFile;
    ErrorExists, FStopAutoLoad: Boolean;
    FStartMode: (smNormal, smAutoUnload);
    FAZSList, FExportList: TStringList;
    FIni: TIniFile;
  public
    { Public declarations }
  end;

var
  ExportIn1C2Form: TExportIn1CForm;

implementation

{$R *.DFM}

uses UDbFunc,UExeSql,uStart,ExFunc,Main;

const LOG_NAME = 'export1C.log';
//==============================================================================
procedure TExportIn1CForm.InitLog;
begin
  AssignFile(FLog,dir1.Text+'\'+LOG_NAME);
  if FileExists(dir1.Text+'\'+LOG_NAME) then Append(FLog)
  else Rewrite(FLog);
end;
//==============================================================================
procedure TExportIn1CForm.LogExp(p_Str: string);
begin
  writeln(Flog,p_Str);
end;
//==============================================================================
procedure TExportIn1CForm.CloseLog;
begin
  CloseFile(FLog);
end;
//==============================================================================
procedure TExportIn1CForm.bbOkClick(Sender: TObject);
begin
  ExportAll;
end;
//==============================================================================
procedure TExportIn1CForm.FormShow(Sender: TObject);
var
  i: integer;
begin
  _OpenQueryOra(qLoad);
  CopyToMemoryTable(qLoad,mt,'ID,DESCRIPTION');
  dir1.Text := GetMainDir+'Export';
  grid1.Columns[0].Title.Caption:='';
  if FStartMode = smAutoUnload then
  begin
    mt.First;
    while not mt.Eof do
    begin
      mt.Edit;
      mtChecked.AsBoolean := False;
      mt.Post;
      mt.Next;
    end;
    for i := 0 to FExportList.Count - 1 do
    begin
      mt.Locate('ID',FExportList[i],[]);
      if mt['ID'] = FExportList[i] then
      begin
        mt.Edit;
        mtChecked.AsBoolean := True;
        mt.Post;
      end;
    end;
    grid1.ReadOnly := True;
  end;
  mt.First;
end;
//==============================================================================
procedure TExportIn1CForm.mtAfterInsert(DataSet: TDataSet);
begin
  mtChecked.AsBoolean := TRUE;
end;
//==============================================================================
procedure TExportIn1CForm.FormCreate(Sender: TObject);
begin
  inherited;
  FAZSList := TStringList.Create;
  FExportList := TStringList.Create;
  if SysParamExists('RUN_OIL_EXPORT') then
  begin
    try
      pnlBtnAutoUnload.Visible := True;
      sbAutoLoad.Down := True;
      sbAutoLoad.Click;
      FStartMode := smAutoUnload;
      if not FileExists(SysParamValue('INI')) then
        raise Exception.CreateFmt('Не найден ini-файл ''%s''.',[SysParamValue('INI')]);
      FIni := TIniFile.Create( ExpandFileName(SysParamValue('INI')) );
      FAZSList.CommaText := FIni.ReadString('RUN_OIL_EXPORT', 'AzsList', '');
      FExportList.CommaText := FIni.ReadString('RUN_OIL_EXPORT', 'ExportList', '');
      TimerAutoUpload.Interval := FIni.ReadInteger('RUN_OIL_EXPORT', 'Interval', 60000);
      LblNextDateValue.Caption := DateToStr(FIni.ReadDate('RUN_OIL_EXPORT', 'LastRun', Date()-1)+1);
      Self.deBegin.Date := Date();
      Self.deEnd.Date := Date();
    except on E:Exception do
      raise Exception.Create('Не удалось прочитать параметры из ini-файла.'+#10#13+e.Message);
    end;
  end
  else
  begin
    FStartMode := smNormal;
    SetCurrentMonth(deBegin,deEnd);
  end;
  pnlBtnNormal.Visible := not pnlBtnAutoUnload.Visible;
end;
//==============================================================================
//==============================================================================
procedure TExportIn1CForm.ExportOne;
var
  q: TOilQuery;
  tail,vUnloadType,vUnloadFormat,vTestMsg: string;
  sl: TStringList;
  i: integer;
  //****************************************************************************
  procedure FileExp(p_Str: string);
  begin
  writeln(Ftxt,p_Str);
  end;
  procedure CloseF();
  begin
  CloseFile(Ftxt);
  end;
  //****************************************************************************
  procedure DataSetToTxt(
  p_Q: TDataSet // датасет откуда будет происходить перенос
  );
  var
  i:integer;
  vFileName,tmp: string; // временное и окончательное имя файла
  begin
   vFileName:=FormatDateTime('ddmmyy',Date)+tail+'.txt';
   AssignFile(FTxt,dir1.Text+'\'+ vFileName);
   if FileExists(dir1.Text+'\'+vFileName) then Rewrite(Ftxt)
   else Rewrite(Ftxt);
   p_Q.First;
  while not p_Q.Eof do
      begin
   for i:=0 to p_Q.Fields.Count-1 do
        begin
         if i<>p_Q.Fields.Count-1 then
          tmp:=tmp+p_Q.Fields[i].AsString+#9
         else
          tmp:=tmp+p_Q.Fields[i].AsString;
        end;
       FileExp(tmp);
       tmp:='';
       p_Q.Next;
      end;
   CloseF();
  end;
  //****************************************************************************
  procedure UnloadOne(p_FileName: string;p_FileFromat: string);
  begin
  if p_FileFromat='.dbf' then
    begin
     try
       DataSetToDbf(q,dir1.Text,p_FileName,sl);
     except
       on E:Exception do begin
         LogExp('        '+E.Message);
         ErrorExists:=TRUE;
       end;
     end;
   end
   else
    begin
     try
     DataSetToTxt(q);
     except
       on E:Exception do begin
         LogExp('        '+E.Message);
         ErrorExists:=TRUE;
       end;
    end;
  end;
  end;
  //****************************************************************************
  procedure UnloadByDate;
  var
    vCurDate: TDateTime;
    vFileName: string;
  begin
    vCurDate:=deBegin.Date;
    while vCurDate<=deEnd.Date do begin
      q.Filter:='rep_date='''+DateToStr(vCurDate)+'''';
      q.Filtered:=TRUE;
      if q.RecordCount>0 then begin
        vFileName:=FormatDateTime('ddmmyy',vCurDate)+tail;
        LogExp('    '+vFileName+'.dbf   ... '+IntToStr(q.RecordCount)+TranslateText(' записей'));
        UnloadOne(vFileName,'.dbf');
      end;
      vCurDate:=vCurDate+1;
    end;
  end;
  //****************************************************************************
  procedure UnloadWhole(vFileFormat:string);
  var
    vFileName: string;
  begin
    vFileName:=FormatDateTime('ddmmyy',Date)+tail;
    LogExp('    '+vFileName+vFileFormat+'   ... '+IntToStr(q.RecordCount)+TranslateText(' записей'));
    UnloadOne(vFileName,vFileFormat);
  end;
  //****************************************************************************
begin
  LogExp(mtDescription.AsString);
  sl:=TStringList.Create;
  q:=TOilQuery.Create(nil);
  try
    q.Session:=frmStart.OraSession1;
    q.SQL.Text:=GetExeSqlTextById(mtId.AsInteger);
    q.Prepare;
    q.ParamByName('BeginDate').Value:=deBegin.Date;
    q.ParamByName('EndDate').Value:=deEnd.Date;
    if not MakeExeSqlTests(q,vTestMsg) then begin
      LogExp(mtDescription.AsString);
      LogExp(TranslateText('Проверки выдали следующее предупреждение:'));
      LogExp(vTestMsg);
      LogExp(TranslateText('Выгрузка отменена.'));
      exit;
    end;
    _OpenQueryOra(q);
    q.Last; q.First;
    LogExp('... '+IntToStr(q.RecordCount)+TranslateText(' записей'));
    if vTestMsg<>'' then begin
      LogExp(TranslateText('Проверки выдали следующие предупреждения:'));
      LogExp(vTestMsg);
    end;
    tail:=GetQHeadValue(q,'FILE');
    vUnloadType:=decode([GetQHeadValue(q,'UNLOAD_TYPE'),'','ONEDATE']);
    vUnloadFormat:=decode([GetQHeadValue(q,'UNLOAD_FORMAT'),'.txt','.txt','.dbf']);
    for i:=0 to q.Sql.Count-1 do begin
      if copy(q.Sql[i],1,2)<>'--' then break;
      if copy(q.Sql[i],1,3)='--%' then
        sl.Add(UpperCase(copy(q.Sql[i],4,length(q.Sql[i]))));
    end;

    if vUnloadType='ONEDATE' then UnloadByDate
    else UnloadWhole(vUnloadFormat);
    
  finally
    q.Free;
    sl.Free;
  end;
end;
//==============================================================================
procedure TExportIn1CForm.ExportAll;
begin
  DefineRepDates(deBegin.Date,deEnd.Date);
  if not DirectoryExists(dir1.Text) and not CreateDir(dir1.Text) then
    raise exception.create(TranslateText('Не удалось создать папку для экспорта!'));
  InitLog;
  ErrorExists:=FALSE;
  try
    try
      LogExp('*****************************************************');
      LogExp(TranslateText('* Экспорт в 1С начат ')+DateToStr(Date)+' '+TimeToStr(Time));
      LogExp(TranslateText('* за период с ')+DateToStr(deBegin.Date)+TranslateText(' по ')+DateToStr(deEnd.Date));
      LogExp('* '+MAIN_ORG.NAME);
      LogExp('-----------------------------------------------------');
      mt.First;
      while not mt.Eof do begin
        if mtChecked.AsBoolean then
          ExportOne;
        mt.Next;
      end;
    except
      on E:Exception do begin
        LogExp(E.Message);
        ErrorExists:=TRUE;
      end;
    end;
  finally
    LogExp('-----------------------------------------------------');
    LogExp(TranslateText('* завершен ')+DateToStr(Date)+' '+TimeToStr(Time));
    LogExp('*****************************************************');
    LogExp('');
    CloseLog;
    if ErrorExists then
      MessageDlg(TranslateText('ОШИБКИ!!!!!!!!')+#13#10+
                 TranslateText('Подробности в файле ')+dir1.Text+'\'+LOG_NAME,
        mtWarning,[mbOk],0)
    else
      MessageDlg(TranslateText('Экспорт данных завершен успешно.'),
        mtInformation,[mbOk],0);
  end;
end;
//==============================================================================
procedure TExportIn1CForm.grid1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  Background:=clWhite;
  AFont.Color:=clBlack;
end;
//==============================================================================
procedure TExportIn1CForm.grid1ColWidthsChanged(Sender: TObject);
begin
  grid1.Columns[0].Width:=16;
end;
//==============================================================================
procedure TExportIn1CForm.SetChecked(p_Value: Boolean);
begin
  ds.DataSet:=nil;
  mt.First;
  while not mt.Eof do begin
    mt.Edit;
    mtChecked.AsBoolean:=p_Value;
    mt.Post;
    mt.Next;
  end;
  mt.First;
  ds.DataSet:=mt;
end;
//==============================================================================
procedure TExportIn1CForm.SpeedButton1Click(Sender: TObject);
begin
  SetChecked(TRUE);
end;
//==============================================================================
procedure TExportIn1CForm.SpeedButton2Click(Sender: TObject);
begin
  SetChecked(FALSE);
end;
//==============================================================================
procedure TExportIn1CForm.BitBtn1Click(Sender: TObject);
begin
end;
//==============================================================================
procedure TExportIn1CForm.deBeginChange(Sender: TObject);
var
  day,month,year:word;
  date1,date2:TDateTime;
begin
  DecodeDate(deBegin.Date,Year,Month,Day);
  GetMonthLimits(month,year,date1,date2);
  deEnd.Date:=date2;
end;
//==============================================================================
procedure TExportIn1CForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DefineRepDates(0,0);
end;

procedure TExportIn1CForm.FormDestroy(Sender: TObject);
begin
  inherited;
  FAZSList.Free;
  FExportList.Free;
end;

procedure TExportIn1CForm.TimerAutoUploadTimer(Sender: TObject);
var
  LastRun: TDateTime;
begin
  try
    if not FStopAutoLoad and (FIni <> nil) then
    begin
      deBegin.Date := Date();
      deEnd.Date := Date();
      LastRun := FIni.ReadDate('RUN_OIL_EXPORT', 'LastRun', Date()-1);
      if LastRun <> Date() then
      begin
        if qTestAutoUpload.Active then
          qTestAutoUpload.Close;
        qTestAutoUpload.MacroByName('AZSList').Value := FAZSList.CommaText;
        _OpenQueryPar(qTestAutoUpload,
         ['BeginDate', deBegin.Date,
          'EndDate',   deEnd.Date,
          'OrgId',     INST]);
        if qTestAutoUpload.IsEmpty then
        begin
          ExportAll;
          FIni.WriteDate('RUN_OIL_EXPORT', 'LastRun', Date());
          LblNextDateValue.Caption := DateToStr(LastRun+1);
        end
        else
          LogExp('Условие автовыгрузки удовлетворено!');
        qTestAutoUpload.Close;
      end;
    end;
  except on E:Exception do
    LogExp('TimerAutoUploadTimer: '+e.Message);
  end;
end;

procedure TExportIn1CForm.sbAutoLoadClick(Sender: TObject);
begin
  inherited;
  FStopAutoLoad := not sbAutoLoad.Down;
end;

end.
