unit uCheckups;


interface

uses uCommonForm,  Classes, dbTables, OilStd, SysUtils, Dialogs, Ora, Forms,
  uMessageDlgExt, uMd5Hash,uOilQuery,uOilStoredProc{$IFDEF VER150},StrUtils{$ENDIF};

type
  TSessionType = (stBDE, stOra);
  TCheckupStatus = class(TObject)
  private
    //vEnabled : string;
    vErrBlock, vErrWarning, vBuildBlock, vBuildWarning, vEmpty : string;
    vErrBlockMessage, vErrWarningMessage, vBuildBlockMessage, vBuildWarningMessage : string;
    qMain, qVar, qSelect, qUpdate : TOilQuery;
    procedure UpdateAllChecksums;
  public
    constructor Create;
    destructor Destroy; override;
    function Refresh: boolean;
    function TestTablesChecksum: Boolean;
    function UpdateChecksum(TableName: String; SessionType: TSessionType): Boolean;
    //property Enabled : string read vEnabled; // Список включенных проверок
    property Empty : string read vEmpty write vEmpty; //Проверки включены, но ни разу не строились
    property ErrBlock : string read vErrBlock; // Проверки, по которым истек срок исправления ошибок
    property ErrWarning : string read vErrWarning; // Пров по которым включен счетчик
    property BuildBlock : string read vBuildBlock; // Устаревшие результаты
    property BuildWarning : string read vBuildWarning; // Результаты устареют через пару дней
    property ErrBlockMessage : string read vErrBlockMessage; // Соотв мессаги
    property ErrWarningMessage : string read vErrWarningMessage;
    property BuildBlockMessage : string read vBuildBlockMessage;
    property BuildWarningMessage : string read vBuildWarningMessage;
  end;

  const
  {
    Для добавления таблицы в котроль нужно добавить:
      - запись в таблицу OIL_CC
      - поле ROW_CHECKSUM в котролируемую таблицу  
      - запись в массив TablesUnderControl
  }

    TABLE_ACTIVE = 1;
    TABLE_NAME = 2;
    MIN_COUNT = 3;
    CHECKSUM = 4;

var

  Tables: array [1..3,1..4] of string = (
    ('Y','OIL_CHECKUP_RESULT','10',' rawtohex(oilt.md5(id||inst||checkup_id||crt_date||err_date||err_count|| :Key || :Key1 ))'),
    ('Y','CARD_CHECKUPS','10',' rawtohex(oilt.md5(id||inst||checkup_id||name||enabled||start_time||warning_time||warning_pause||time_to_block||active_days||max_days_fault||warning_quantity|| :Key || :Key1 )) '),
    ('N','OIL_CHECKUPS','19',' rawtohex(oilt.md5(id||inst||Enabled||quantity||correction||errors_allow||silence_period||date_fld||falling_date|| :Key || :Key1 ))')
  );

implementation

uses main, uDBFunc, Exfunc, uTestLaunch;

constructor TCheckupStatus.Create;
Begin
  vEmpty :='';
  vErrBlock :='';
  vErrWarning :='';
  vBuildBlock :='';
  vBuildWarning:='';
  vErrBlockMessage :='Истек срок на исправление ошибок по следующим проверкам:';
  vErrWarningMessage := 'На исправление ошибок по проверкам осталось: ';
  vBuildBlockMessage := 'Устарели результаты по проверкам:';
  vBuildWarningMessage :='Выполните проверки по талонам, карточкам и бланкам !'+#13#10+
                         'В противном случае через день/два работа программы будет заблокирована !';

  qSelect := TOilQuery.Create(nil);
  qSelect.SQL.Text :='select C.* from oil_checkups C '+
  'where Enabled !=(select EnCoder(Decode(Instr('',''||DeCoder(SubStr(V.value,2))||'','',C.id),0,''N'',''Y''),V1.Value,C.Id) '+
  '		 from oil_var V, oil_var V1 '+
  '		 where V.name=''CH_AUDIT_LIST'' and V1.name=''ID'') ';

  qUpdate := TOilQuery.Create(nil);
  qUpdate.SQL.Text :='update oil_checkups C  set Enabled= '+
  '    (select EnCoder(Decode(Instr('',''||DeCoder(SubStr(V.value,2))||'','',C.id),0,''N'',''Y''),V1.Value,C.Id) '+
  '     from oil_var V, oil_var V1 '+
  '     where V.name=''CH_AUDIT_LIST'' and V1.name=''ID'') ';

  qMain := TOilQuery.Create(nil);
  qMain.SQL.Text :=
'-->qMain,uCheckups '+#13#10+
'select nvl(DC.id,c.id) as id, '+
'       nvl(DC.name, '+
'         decode(ov.Language, '+
'           1, ''Увага! Помилка! Зверніться до розробників!'', '+
'              ''Внимание! Ошибка! Обратитесь к разработчикам!'')) as name, '+
'       to_date(C.falling_date,''dd.mm.yyyy hh24:mi:ss'') as fall_date, '+
'       Decode(c.falling_date,''01.01.1999'',null,to_date(c.falling_date)+c.correction-trunc(sysdate)) as ErrDays, '+
'       to_date(cr.crt_date,''dd.mm.yyyy hh24:mi:ss'') as crt_date, '+
'       C.Quantity, '+
'       trunc(sysdate) as today, '+
'       trunc(nvl(cr.crt_date,''01.01.2000'')+c.quantity)-trunc(sysdate) as BuildDays '+
'from OIL_DECODE_CHECKUP DC,  '+
'     (select C.id, C.inst,  '+
'       DeCoder(Enabled,C.inst,id) as Enabled,  '+
'       DeCoder(Quantity,C.inst,id) as Quantity,  '+
'       DeCoder(Correction,C.inst,id) as Correction,  '+
'       DeCoder(ERRORS_ALLOW,C.inst,id) as ERRORS_ALLOW,  '+
'       DeCoder(SILENCE_PERIOD,C.inst,id) as SILENCE_PERIOD,  '+
'       DeCoder(FALLING_DATE,C.inst,id*C.inst) as FALLING_DATE '+
'       from OIL_CHECKUPS C, (select value as INST from oil_var where name = ''ID'') V '+
'       where C.inst = V.inst) C,  '+
'     (select value as INST from oil_var where name = ''ID'') V, '+
'     (select CR.inst, CR.checkup_id,  '+
'             max(to_date(DeCoder(CR.crt_date,CR.inst,CR.CheckUp_ID),''dd.mm.yyyy hh24:mi:ss'')) as crt_date '+
'        from oil_checkup_result CR,  '+
'             (select value as INST from oil_var where name = ''ID'') V '+
'        where V.inst = CR.inst  '+
'          and (select max(id) from oil_checkup_result  where inst = ov.GetVal(''INST'')) between id - 100 and id+100 '+
'        group by CR.inst, CR.checkup_id) CR '+
'where c.id = dc.id(+) and  '+
'      c.enabled = ''Y'' and  '+
'      c.id = cr.checkup_id (+) and  '+
'      c.inst = cr.inst (+) ';
  {включить проверку с 1 августа 2006 года}
  if  Trunc(GetSystemDate) >= StrToDate('01.01.1999')+364*7+31*7+4
    then Tables[3][TABLE_ACTIVE] := 'Y';
End;

destructor TCheckupStatus.Destroy;
Begin
  qMain.Free;
  qUpdate.Free;
  qVar.Free;
  inherited Destroy;
End;

function TCheckupStatus.Refresh: boolean;
  var
    AddErrDays, AddBuildDays : Integer;
//-----------------------------------------------
    function AdditionDays(StartDate : TDateTime):integer;
      var Hld : String;
          Now_, T : TDateTime;
    Begin
      Hld := ReadOILVar('HOLIDAYS');
      Now_ := trunc(GetSystemDate);

      Result := 0;
      T := StartDate;
      while T <= Now_ do Begin
        if (DayOfWeek(T) in [1,7]) or (pos(FormatDateTime('dd.mm', T), Hld) > 0) then
          Result := Result + 1;
        T := T + 1;
      End;
    End;
//-----------------------------------------------

Begin
  startlog(TranslateText('  обновляется статус проверок...'));
  Result := false;
  try
    if not CheckupStatus.TestTablesChecksum then
    begin
      Application.Terminate;
      Exit;
    end;

    // активація другорядних перевірок
    // 18. Проверки с OIL_CHECKUPS
    if not ActiveCH(18) then
    begin
      Result := true;
      exit;
    end;


    if not Debugging then begin
      startlog(TranslateText('    обновление списка активных проверок'));
      StartSQL;
      qUpdate.ExecSQL;
      UpdateChecksum('OIL_CHECKUPS',stBDE);
      CommitSQL;
    end;
    //qSelect.Close;

    _OpenQuery(qMain);
    startlog(TranslateText('    получение информации о состоянии проверок'));

    while not qMain.Eof do
    Begin
      startlog(TranslateText('    обработка id=')+qMain.FieldByName('id').AsString);
      if not qMain.FieldByName('ErrDays').IsNull
      then
      Begin
         {Если в момент возникновения ошибки были выходные - учесть это}
         AddErrDays := AdditionDays(qMain.FieldByName('fall_date').AsDateTime);

         {Если все равно число отрицательное, то записать проверку в список заблокированныъ}
         if qMain.FieldByName('ErrDays').AsInteger+AddErrDays<0
            then
            Begin
               vErrBlock := vErrBlock +qMain.FieldByName('id').AsString+',';
               vErrBlockMessage := vErrBlockMessage +#13#10+qMain.FieldByName('name').AsString;
            End
            else
            {если нет - в список предупреждения}
            Begin
               vErrWarning := vErrWarning +qMain.FieldByName('id').AsString+',';
               vErrWarningMessage := vErrWarningMessage +#13#10+qMain.FieldByName('name').AsString+
                                     '    '+IntToStr(qMain.FieldByName('errdays').AsInteger+AddErrDays)+' '+
                                     DaysOrf(qMain.FieldByName('errdays').AsInteger+AddErrDays);
            End;
      End;
      AddBuildDays := 0;
      if not qMain.FieldByName('crt_date').IsNull then
         AddBuildDays := AdditionDays(qMain.FieldByName('crt_date').AsDateTime);
      if qMain.FieldByName('BuildDays').AsInteger+AddBuildDays<0
        then Begin
           if qMain.FieldByName('BuildDays').AsInteger+AddBuildDays<-1000
              then vEmpty := vEmpty+qMain.FieldByName('id').AsString+',';
           vBuildBlock := vBuildBlock +qMain.FieldByName('id').AsString+',';
           vBuildBlockMessage := vBuildBlockMessage +#13#10+qMain.FieldByName('name').AsString;
        End
        else if (qMain.FieldByName('BuildDays').AsInteger in [0,1]) and
                not (trunc(qMain.FieldByName('crt_date').AsDateTime) = qMain.FieldByName('today').AsDateTime)
             then Begin
                vBuildWarning := vBuildWarning +qMain.FieldByName('id').AsString+',';
                vBuildWarningMessage := vBuildWarningMessage +#13#10+qMain.FieldByName('name').AsString;
             End;
      qMain.Next;
    End;
    qMain.Close;
    Result :=true;
    startlog(TranslateText('  статус успешно обновлён'));
  Except on E:Exception do
    begin
      result := false;
      ShowMessage(TranslateText('Ошибка при обновлении статуса проверок:')+#13#10+E.Message);
      startlog(TranslateText('  ошибка при обновлении статуса проверок:')+#13#10+E.Message);
    end;
  End;
End;

function TCheckupStatus.TestTablesChecksum: Boolean;
var
  N, I: Integer;
  Str, ResStr, TablesList, Pwd, CalcPwd : String;
  OraQuery: TOilQuery;
begin
  {если у подразделения нет каротчек не проверять}
  if not IsEmitent(StrToInt(ReadOilVar('INST')),True) or Debugging
  then begin
    Result := True;
    Exit;
  end;
  Result := False;
  TablesList := '';
  Str :=
    TranslateText('Системная ошибка.')+#13#10+
    TranslateText('Продолжение работы не возможно. Обратитесь к разработчикам.')+#13#10+
    TranslateText('Дополнительная информация:')+#13#10;

  {проверить есть ли таблица с контрольными суммами для таблиц}
  if GetSQLValue(
    ' select count(*) from all_tables '+
    ' where table_name=''OIL_CC'' and owner=user') = 0
  then begin
    ResStr := Str + ResStr +
      TranslateText('[OIL_CC_NOTFOUND] Возможно не установлены все скрипты ');
    MessageDlg(ResStr,mtError,[mbOk],0);
    Exit;
  end;

  {проверить количество записей в контролируемых таблицах}
  for I := 1 to length(Tables) do
  begin
    N := GetSQLValue('select count(*) from '+Tables[I][TABLE_NAME]+
       ' where inst='+ReadOilVar('INST') );
    if N < StrToInt(Tables[I][MIN_COUNT]) 
      then ResStr := ResStr + #13#10 + TranslateText('[CONTROL_TABLE_INCOMPLETE] Описание: ')+
        Tables[I][TABLE_NAME]+', RCount: '+IntToStr(N) ;
  end;

  {проверить количество записей в таблице контрольных сумм}
  for I := 1 to length(Tables) do
  begin
    N := GetSqlValue(
      ' select count(*) from oil_cc where '+
      ' upper(table_name)=Upper('''+Tables[I][TABLE_NAME]+''') '+
      ' and table_inst='+ReadOilVar('INST') );

    if N = 0 then
      ResStr := ResStr + #13#10 + TranslateText('[OIL_CC_INCOMPLETE] Описание: ')+
        Tables[I][TABLE_NAME];

    TablesList := TablesList +
       ''''+Tables[I][TABLE_NAME]+''''+IfThen(I <> length(Tables),',','');
  end;

  {проверить наличие полей в контролируемых таблицах}
  if GetSqlValue(
    ' select count(*) from all_tab_columns '+
    ' where owner = user '+
    ' and lower(column_name) = ''row_checksum'' '+
    ' and table_name in ('+TablesList+') '  ) = 0 then
   ResStr := ResStr + #13#10 +
     TranslateText('[CS_FIELDS_NOTFOUND] Возможно не установлены все скрипты');

  OraQuery := TOilQuery.Create(nil);
  try

    {проверить контрольные суммы для каждой записи в контролируемых таблицах}
    for I := 1 to length(Tables) do
    begin
      if Tables[I][TABLE_ACTIVE] = 'N' then Continue;
      OraQuery.SQL.Text :=
        ' select '+
        '   count(*) as  c'+
        ' from '+
        ' ( '+
        ' select '+
        '   row_checksum as rc, '+
        Tables[I][CHECKSUM] + ' as calc_rc '+
        ' from '+Tables[I][TABLE_NAME] + ' where inst='+ReadOilVar('INST') +
        ' ) where rc <> calc_rc ';
        _OpenQueryParOra(OraQuery, ['Key',CHECKSUM_KEY,'Key1', ReadOilVar('INST')]  );
        if OraQuery.FieldByName('c').AsInteger > 0 then
          ResStr := ResStr + #13#10 + TranslateText('[ROWS_CHECKSUM_NOT_MATCH] Описание: ')+
            Tables[I][TABLE_NAME]+','+OraQuery.FieldByName('c').AsString;
    end;

    {проверить контрольные суммы для каждой контролируемой таблицы}
    for I := 1 to length(Tables) do
    begin
      if Tables[I][TABLE_ACTIVE] = 'N' then Continue;
      OraQuery.SQL.Text :=
        ' select rawtohex(oilt.Md5(count(*)||sum(id)||:Key||:Key1)) as cs '+' from '+
         Tables[I][TABLE_NAME]+
        ' where inst ='+ReadOilVar('INST');

        _OpenQueryParOra(OraQuery, ['Key',CHECKSUM_KEY,'Key1', ReadOilVar('INST')]  );

        if GetSqlValue(
          'select checksum '+
          'from oil_cc where table_inst = '+ReadOilVar('INST')+
          ' and table_name='''+Tables[I][TABLE_NAME]+'''') <>  OraQuery.FieldbyName('CS').AsString
        then ResStr := ResStr + #13#10 +
          TranslateText('[TABLE_CHECKSUM_NOT_MATCH] Описание: ')+Tables[I][TABLE_NAME];
    end;

    {Добавить заголовок к тексту ошибок}
    if ResStr <> '' then
      ResStr := Str + ResStr;

    {Если есть ошибки спросить пароль}
    if ResStr <> '' then
      if MessageDlgExt(ResStr,mtError,[TranslateText('Выйти'),TranslateText(' Ввести пароль ') ]) = 2 then
      begin
        {рассчетный пароль}
        OraQuery.SQL.Text :=
          'select rawtohex(oilt.Md5( :key || :key1 ||to_char(sysdate,''(rrrr)(mm)(dd)'')) ) as pwd from dual';
        _OpenQueryParOra(OraQuery, ['Key',CHECKSUM_KEY,'Key1', ReadOilVar('INST')]  );
        CalcPwd := OraQuery.FieldByName('pwd').asString;

        {если пароль правильный, обнулить строку с ошибками}
        InputQuery(TranslateText('Пароль'), TranslateText('Введите пароль'), Pwd);
        if Pwd = CalcPwd then
        begin
          ResStr := '';
          StartSQL;
          try
            UpdateAllChecksums;
            CommitSQL;
          except on E: Exception do
            begin
              RollbackSQL;
              ShowMessage('[UPDATE_CS_PWD]'+#13#10+E.Message);
            end;
          end;
        end else ShowMessage(TranslateText('Неверный пароль'));
      end;
    Result := ResStr = '';
  finally
    FreeAndNil(OraQuery);
  end;
end;

function TCheckupStatus.UpdateChecksum(TableName: String; SessionType: TSessionType): Boolean;
var
  I, Id: Integer;
begin
  {если у подразделения нет каротчек не проверять}
  if not IsEmitent(StrToInt(ReadOilVar('INST')),True) or Debugging then
  begin
    Result := True;
    Exit;
  end;

  Result := False;
  Id := - 1;
  for I:=1 to length(Tables) do
    if AnsiUpperCase(Trim(TableName)) = AnsiUpperCase(Tables[I][TABLE_NAME]) then
      Id := I;

  if Id < 0 then Exit;

  try
    _ExecSQL('update '+ TableName +' set row_checksum = '+ Tables[Id][CHECKSUM] +
      ' where (row_checksum is null) or (row_checksum <> '+ Tables[Id][CHECKSUM] +')',
      ['Key',  CHECKSUM_KEY,
       'Key1', ReadOilVar('INST')]);

    _ExecSQL(
      ' update oil_cc set checksum = '+
      '(select rawtohex(oilt.Md5(count(*) || sum(id)|| :Key || :Key1)) from  '+
        Tables[Id][TABLE_NAME]+' where inst='+ ReadOilVar('INST') +')'+
      ' where table_inst = '+ReadOilVar('INST')+' and table_name = '''+TableName+'''',
      ['Key',CHECKSUM_KEY,'Key1', ReadOilVar('INST')]
    );

   except on e:Exception do
     begin
        ShowMessage('[UPDATE_CHECKSUM] '+E.Message);
       raise;
     end;
   end;
end;

procedure TCheckupStatus.UpdateAllChecksums;
var
  I: Integer;
begin
  for I := 1 to Length(Tables) do
    CheckupStatus.UpdateChecksum(Tables[I][TABLE_NAME],stBDE);
end;

initialization
  CHECKSUM_KEY :=
    chr(81)+chr(49)+chr(95)+chr(115)+chr(71)+chr(104)+chr(37)+chr(121)+
    chr(42)+chr(106)+chr(34)+chr(54)+chr(55)+chr(35)+chr(100)+chr(78);
finalization

end.
