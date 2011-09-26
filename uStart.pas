unit uStart;

interface

uses uCommonForm,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBAccess, Ora, Db, DBTables,uOilQuery,uOilStoredProc, ExtCtrls;

type
  TfrmStart = class(TDataModule)
    OraSession1: TOraSession;
    TimerReconnect: TTimer;
    procedure OraSession1Error(Sender: TObject; E: EDAError;
      var Fail: Boolean);
    procedure TimerReconnectTimer(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    FReconnectCount: integer;
    FReconnectMax: integer;
  public
    { Public declarations }
  end;

  procedure ConnectOraSession;
  function DBTimeIsCorrect(var Msg:string):boolean;
  //procedure TestLaunch;

var
  frmStart: TfrmStart;

implementation

{$R *.DFM}

uses Main, OraBaseDialog, ExFunc, uDBFunc, uTestLaunch;

function IsConnectSync:Boolean;
const OIL_VAR_NAME='TEST_CONNECT_SYNC';
var q: TOilQuery;
    OraQ: TOilQuery;
    RandomString: string;
    i: integer;
    tail: string;
begin
    q:=TOilQuery.Create(nil);
    OraQ:=TOilQuery.Create(nil);
    OraQ.Session:=frmStart.OraSession1;
    RandomString:=''; tail:='';
    result:=FALSE;
    for i:=1 to 20 do RandomString:=RandomString+IntToStr(Random(10));
    for i:=1 to 10 do tail:=tail+IntToStr(Random(10));
    try
       frmStart.ORASESSION1.StartTransaction;
       q.Sql.Text:='insert into oil_var (name,value) values ('''+OIL_VAR_NAME+tail+''','''+RandomString+''')';
       try
         q.ExecSql;
       except
         on E: Exception do begin
           startlog(TranslateText('  IsConnectSync: не удалось внести в oil_var значение'));
           startlog(E.Message);
           raise;
         end;
       end;
       frmStart.ORASESSION1.Commit;
       OraQ.SQL.Text := 'select count(*) as C from SYS.all_objects where object_name=''OIL_VAR''';
       OraQ.Open;
       if OraQ.FieldByName('C').AsInteger=0 then exit;
       OraQ.Sql.Text:='select value from oil_var where name='''+OIL_VAR_NAME+tail+'''';
       OraQ.Open;
       if (OraQ.RecordCount>0) and (OraQ.FieldByName('value').AsString=RandomString) then result:=TRUE;
    finally
       if not frmStart.ORASESSION1.InTransaction then frmStart.ORASESSION1.StartTransaction;
       q.Sql.Text:='delete oil_var where name='''+OIL_VAR_NAME+tail+'''';
       q.ExecSql;
       frmStart.ORASESSION1.Commit;
       q.Free; OraQ.Free;
    end;
end;

function IsPersistentQuietConnect: boolean;
begin
  Result := SysParamExists('RUN_OIL_AUTOLOAD_SREP');
end;

procedure ConnectOraSession;
var
  LastAlias,AliasHistory,s: string;
  SL: TStringList;
  i: integer;
  F: TOraBaseDialogForm;
begin
  with frmStart do
    try
      DefSession := OraSession1;
      SL:=TStringList.Create;
      if SysParamExists('USER') then
        OraSession1.UserName := SysParamValue('USER');
      if SysParamExists('HOME') then
        OraSession1.HomeName := SysParamValue('HOME');
      if SysParamExists('NET') then
        // USER=andriy NET SERVER=10.155.155.106:1521:ORCL
        OraSession1.Options.Net := True;
      if SysParamExists('SERVER') then
      begin
         SL.Add(SysParamValue('SERVER'));
         LastAlias:=SL[0];
      end
      else
      begin
         LastAlias:=ReadPieceOfRegistry(HKEY_CURRENT_USER,'\Software\Oil','OraServer');
         if LastAlias='' then LastAlias:='OILWORK';
         AliasHistory:=ReadPieceOfRegistry(HKEY_CURRENT_USER,'\Software\Oil','OraServerHistory');
         s:=ReplaceSubstr(AliasHistory+';',LastAlias+';','');
         Str2StringList(LastAlias+';'+s,SL,';');
      end;
      for i:=0 to SL.Count-1 do
      begin
          if SL[i]='' then continue;
          if OraSession1.Connected then OraSession1.Close;
          OraSession1.Server:=SL[i];
          startlog(TranslateText('  открывается сессия ODAC, алиас ')+OraSession1.Server);
          try
            OraSession1.Connect
          except
            on E:Exception do
            begin
              startlog(TranslateText('  открыть не удалось, ошибка ')+E.Message);
              continue;
            end;
          end;
          if IsConnectSync then
          begin
             if OraSession1.Server<>LastAlias then
             begin
                MessageDlg(TranslateText('Внимание! Изменены настройки BDE!!!')+#13#10+
                    TranslateText('Новый алиас оракла ')+OraSession1.Server+'.',mtWarning,[mbOk],0);
                WritePieceOfRegistry('OraServer',OraSession1.Server);
             end;
             startlog(TranslateText('  проверка синхронности пройдена'));
             exit;
          end
          else
            startlog(TranslateText('  проверка синхронности не пройдена'));
      end;
      startlog(TranslateText('  ни один из алиасов не подошёл, запрашиваю у пользователя...'));
      F:=TOraBaseDialogForm.Create(Application);
      if IsPersistentQuietConnect then
      begin
        while not OraSession1.Connected do
        begin
          Sleep(3000);
          Application.ProcessMessages;
        end;
      end
      else
      while TRUE do
      begin
        MessageDlg(TranslateText('Внимание! Изменены настройки подключения!!!')+#13#10+
                  TranslateText('Новый алиас оракла установить не удалось, введите его вручную.'),mtWarning,[mbOk],0);
        F.ShowModal;
        if F.ModalResult=mrCancel then
        begin
           ShowMessage(TranslateText('Не указан алиас'));
           startlog(TranslateText('  пользователь не указал алиас'),true);
           Application.Terminate;
           Exit;
        end;
        if OraSession1.Connected then OraSession1.Close;
        OraSession1.Server:=F.Edit1.Text;
        startlog(TranslateText('  открывается сессия, алиас ')+OraSession1.Server);
        OraSession1.Connect;
        if IsConnectSync then
        begin
           WritePieceOfRegistry('OraServer',OraSession1.Server);
           if AliasHistory<>'' then
             AliasHistory:=AliasHistory+';';
           WritePieceOfRegistry('OraServerHistory',AliasHistory+OraSession1.Server);
           startlog(TranslateText('  проверка синхронности пройдена'));
           exit;
        end
        else
        begin
          startlog(TranslateText('  проверка синхронности не пройдена'));
          ShowMessage(TranslateText('Настройки таки смотрят на другой сервер оракла'));
        end;
      end;
    except
      MessageDlg(TranslateText('Не удалось аквтивизировать сессию !!!'),mtError,[mbOk],0);
      startlog(TranslateText('  не удалось открыть сессию'),true);
      Application.Terminate;
    end;
end;

function DBTimeIsCorrect(var Msg:string):boolean;
  var q : TOilQuery;
begin
  Result := True;
  q := TOilQuery.Create(nil);
  with q do
  begin
      SQL.Text := 'select sysdate, value, sysdate-To_Date(value,''dd.mm.yyyy hh24:mi:ss'') as XXX from oil_var where Name = ''Last_run_date'' ';
      _OpenQuery(q);
      if not IsEmpty then
         if not Main.Debugging and ((FieldByName('XXX').AsFloat < 0) or
                                   (FieldByName('XXX').AsFloat > 5)) then
         begin
            Msg := TranslateText('Неправильная установка даты/времени !')+#13#10+
                       TranslateText('Последняя дата работы с OIL : ')+FieldByName('value').AsString;
            Result := False;
         end
         else _ExecSql('update oil_var set value= TO_CHAR(sysdate,''dd.mm.yyyy hh24:mi:ss'') '
           + 'where Name = ''Last_run_date'' ');
   end;
end;

{procedure TestLaunch;
  var frmTest : TfrmTestLaunch;
Begin
//  if not Debugging and (LAUNCH_MODE='OIL') then begin
    frmTest := TfrmTestLaunch.Create(nil);
    frmTest.ShowModal;
    frmTest.free;
//  End;
//             if MessageDlg('Работа OIL заблокирована. Обратитесь к программисту'+#13#10+'или к разработчикам за паролем экстренного доступа'+
//                      #13#10+'Есть ли у вас пароль?',mtError,[mbYes,mbNo],0)=mrYes then begin
//                if not TestPassword(pwtOrg) then Application.Terminate

End;}

procedure TfrmStart.OraSession1Error(Sender: TObject; E: EDAError;
  var Fail: Boolean);
begin
  StartLog(TranslateText('Ошибка в сессии Oracle: ')+ trim(E.Message));
  if (e.ErrorCode = 12560) or (e.ErrorCode = 03114) then
  begin
    Self.OraSession1.Disconnect;
    TimerReconnect.Enabled := True;
  end;
end;

procedure TfrmStart.TimerReconnectTimer(Sender: TObject);
begin
  if (IsPersistentQuietConnect and Self.OraSession1.Connected = false) then
  begin
    inc(FReconnectCount);
    StartLog(Format(TranslateText('Повторное открытие сессии Oracle №%d'),[FReconnectCount]));
    try
      Self.OraSession1.Connect;
      Self.TimerReconnect.Enabled := False;
    except
      // -> OraSession1Error
    end;
  end
  else
    Self.TimerReconnect.Enabled := False;
end;

procedure TfrmStart.DataModuleCreate(Sender: TObject);
begin
  OraSession1.Connected := false;
  FReconnectCount := 0;
  if IsPersistentQuietConnect then
    FReconnectMax := 999999999
  else
    FReconnectMax := 3;
end;

end.
