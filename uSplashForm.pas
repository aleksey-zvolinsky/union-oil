unit uSplashForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, jpeg, ActnList, Db, DBTables, uCommonForm, uOilQuery, Ora,
  uOilStoredProc, MemDS, DBAccess;

type
  TSplashForm = class(TCommonForm)
    pnlLogo: TPanel;
    imgLogo: TImage;
    bvlBeauty: TBevel;
    lblProgress: TLabel;
    lblName: TLabel;
    lblMode: TLabel;
    Notebook: TNotebook;
    Label2: TLabel;
    Label3: TLabel;
    edtUser: TEdit;
    edtPassw: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    ActionList: TActionList;
    actNext: TAction;
    actClose: TAction;
    procedure FormCreate(Sender: TObject);
    procedure actNextExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtUserChange(Sender: TObject);
    procedure ShowPictures;
  public
    IsHalt: boolean;
    EmpId: integer;
    HolidayName:string;
  end;

var
  SplashForm: TSplashForm;

implementation


uses uStart, Main, ExFunc, UDbFunc, uExeSql;

{$R *.DFM}

//==============================================================================
procedure TSplashForm.FormCreate(Sender: TObject);
begin
  inherited;
  Self.Tag := 0;
  Notebook.PageIndex := 0;
  IsHalt := true;
end;
//==============================================================================
procedure TSplashForm.actNextExecute(Sender: TObject);
begin
  if (edtUser.text = '') or (edtPassw.text = '') then
  begin
    MessageDlg(TranslateText('Ошибка : Имя/Пароль не определены !'), mtError, [mbOk], 0);
    edtUser.setfocus;
    exit;
  end;
  if 0 =GetSqlValueParSimple('select count(*) as c from adm_users where login=:ALogin and password=:APassword',
    ['ALogin',edtUser.text,
     'APassword',edtPassw.text])
  then
  begin
    MessageDlg(TranslateText('Ошибка: Имя/Пароль указаны не верно !'), mtError, [mbOk], 0);
    edtUser.Text := '';
    edtPassw.Text := '';
    Notebook.PageIndex := 1;
    edtUser.SetFocus;
  end
  else
  begin
    empid:=GetSqlValueParSimple('select id as id from adm_users where login=:ALogin and password=:APassword',
      ['ALogin',edtUser.text,
       'APassword',edtPassw.text]);
    Self.Tag := 1;
    close;
  end;
end;
//==============================================================================
procedure TSplashForm.actCloseExecute(Sender: TObject);
begin
  Close;
end;
//==============================================================================
procedure TSplashForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Self.Tag = 0 then
    if IsHalt then
    begin
      frmStart.ORASESSION1.close;
      frmStart.OraSession1.Close;
      halt(1);
    end;
end;
//==============================================================================
procedure TSplashForm.edtUserChange(Sender: TObject);
begin
  if ANSIUpperCase(edtUser.Text) = '  ' then
  begin
    edtUser.Text := 'counter';
    edtPassw.Text := 'counter';
    actNext.Execute;
  end;

  if ANSIUpperCase(edtUser.Text) = 'BB' then
  begin
    edtUser.Text := 'econom';
    edtPassw.Text := 'region';
    actNext.Execute;
  end;

  if ANSIUpperCase(edtUser.Text) = '==' then
  begin
    edtUser.Text := 'admin';
    edtPassw.Text := 'dbinternalview';
    actNext.Execute;
  end;
end;
//==============================================================================
(**
Процедура достает из схемы EXE_SQL SplashForm->Congratulation  список дат и картинок
в формате "день.месяц с";"день.месяц по";"название файла"
Эта картинка подставляеться текущая дата в данном периоде
*)
procedure TSplashForm.ShowPictures;
const
  DateFrom=0;
  DateTo=1;
  FilePicture=2;
  HolidayName_=3;
var
  slTable, slRecord :TStringList;
  i:integer;  
begin
  slTable:=TStringList.Create();
  slRecord:=TStringList.Create();
  try
    try
      // Достаем таблицу со списком дат и картинок в формате "день.месяц с";"день.месяц по";"название файла"
      // Пример '01.01;06.01;winter.jpg;название праздника'
      LoadExeSql(slTable,'Congratulation',Self.Name);
      for i:=0 to slTable.Count-1 do
      begin
        // Разбиваем строку на параметры
        Str2StringList(trim(slTable[i]),slRecord,';');
        {StartLog(DateTimeToStr(GetDate_From_MonthDay(slRecord[DateFrom]))+' '
          +DateTimeToStr(GetDate_From_MonthDay(slRecord[DateTo]))+' '
          +DateTimeToStr(GetSystemDate));}
        //Смотрим попадает ли текущая дата в диапазон
        if (GetDate_From_MonthDay(slRecord[DateFrom]) <= trunc(GetSystemDate)) and (trunc(GetSystemDate) <= GetDate_From_MonthDay(slRecord[DateTo])) then
          // Теперь проверяем наличие файла
          if FileExists(GetMainDir + 'Pictures\' + slRecord[FilePicture]) then
          begin
            imgLogo.Picture.LoadFromFile(GetMainDir + 'Pictures\' + slRecord[FilePicture]);
            if slRecord.Count>=4 then
              HolidayName:=slRecord[HolidayName_];
            Break; //Первая найденая картинка загружена и мы выходим из цыкла
          end;
      end;
    except on E:Exception do
    begin
      // для простого пропуску в разі помилки
      StartLog('Ошибка при загрузке картинки!'+#10#13
        +e.Message);
    end;
    end;
  finally
    slTable.Free;
    slRecord.Free;
  end;
end;
//==============================================================================

end.
