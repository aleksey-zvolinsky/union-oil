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
    //property Enabled : string read vEnabled; // ������ ���������� ��������
    property Empty : string read vEmpty write vEmpty; //�������� ��������, �� �� ���� �� ���������
    property ErrBlock : string read vErrBlock; // ��������, �� ������� ����� ���� ����������� ������
    property ErrWarning : string read vErrWarning; // ���� �� ������� ������� �������
    property BuildBlock : string read vBuildBlock; // ���������� ����������
    property BuildWarning : string read vBuildWarning; // ���������� �������� ����� ���� ����
    property ErrBlockMessage : string read vErrBlockMessage; // ����� �������
    property ErrWarningMessage : string read vErrWarningMessage;
    property BuildBlockMessage : string read vBuildBlockMessage;
    property BuildWarningMessage : string read vBuildWarningMessage;
  end;

  const
  {
    ��� ���������� ������� � ������� ����� ��������:
      - ������ � ������� OIL_CC
      - ���� ROW_CHECKSUM � ������������� �������  
      - ������ � ������ TablesUnderControl
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
  vErrBlockMessage :='����� ���� �� ����������� ������ �� ��������� ���������:';
  vErrWarningMessage := '�� ����������� ������ �� ��������� ��������: ';
  vBuildBlockMessage := '�������� ���������� �� ���������:';
  vBuildWarningMessage :='��������� �������� �� �������, ��������� � ������� !'+#13#10+
                         '� ��������� ������ ����� ����/��� ������ ��������� ����� ������������� !';

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
'           1, ''�����! �������! ��������� �� ����������!'', '+
'              ''��������! ������! ���������� � �������������!'')) as name, '+
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
  {�������� �������� � 1 ������� 2006 ����}
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
  startlog(TranslateText('  ����������� ������ ��������...'));
  Result := false;
  try
    if not CheckupStatus.TestTablesChecksum then
    begin
      Application.Terminate;
      Exit;
    end;

    // ��������� ����������� ��������
    // 18. �������� � OIL_CHECKUPS
    if not ActiveCH(18) then
    begin
      Result := true;
      exit;
    end;


    if not Debugging then begin
      startlog(TranslateText('    ���������� ������ �������� ��������'));
      StartSQL;
      qUpdate.ExecSQL;
      UpdateChecksum('OIL_CHECKUPS',stBDE);
      CommitSQL;
    end;
    //qSelect.Close;

    _OpenQuery(qMain);
    startlog(TranslateText('    ��������� ���������� � ��������� ��������'));

    while not qMain.Eof do
    Begin
      startlog(TranslateText('    ��������� id=')+qMain.FieldByName('id').AsString);
      if not qMain.FieldByName('ErrDays').IsNull
      then
      Begin
         {���� � ������ ������������� ������ ���� �������� - ������ ���}
         AddErrDays := AdditionDays(qMain.FieldByName('fall_date').AsDateTime);

         {���� ��� ����� ����� �������������, �� �������� �������� � ������ ���������������}
         if qMain.FieldByName('ErrDays').AsInteger+AddErrDays<0
            then
            Begin
               vErrBlock := vErrBlock +qMain.FieldByName('id').AsString+',';
               vErrBlockMessage := vErrBlockMessage +#13#10+qMain.FieldByName('name').AsString;
            End
            else
            {���� ��� - � ������ ��������������}
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
    startlog(TranslateText('  ������ ������� �������'));
  Except on E:Exception do
    begin
      result := false;
      ShowMessage(TranslateText('������ ��� ���������� ������� ��������:')+#13#10+E.Message);
      startlog(TranslateText('  ������ ��� ���������� ������� ��������:')+#13#10+E.Message);
    end;
  End;
End;

function TCheckupStatus.TestTablesChecksum: Boolean;
var
  N, I: Integer;
  Str, ResStr, TablesList, Pwd, CalcPwd : String;
  OraQuery: TOilQuery;
begin
  {���� � ������������� ��� �������� �� ���������}
  if not IsEmitent(StrToInt(ReadOilVar('INST')),True) or Debugging
  then begin
    Result := True;
    Exit;
  end;
  Result := False;
  TablesList := '';
  Str :=
    TranslateText('��������� ������.')+#13#10+
    TranslateText('����������� ������ �� ��������. ���������� � �������������.')+#13#10+
    TranslateText('�������������� ����������:')+#13#10;

  {��������� ���� �� ������� � ������������ ������� ��� ������}
  if GetSQLValue(
    ' select count(*) from all_tables '+
    ' where table_name=''OIL_CC'' and owner=user') = 0
  then begin
    ResStr := Str + ResStr +
      TranslateText('[OIL_CC_NOTFOUND] �������� �� ����������� ��� ������� ');
    MessageDlg(ResStr,mtError,[mbOk],0);
    Exit;
  end;

  {��������� ���������� ������� � �������������� ��������}
  for I := 1 to length(Tables) do
  begin
    N := GetSQLValue('select count(*) from '+Tables[I][TABLE_NAME]+
       ' where inst='+ReadOilVar('INST') );
    if N < StrToInt(Tables[I][MIN_COUNT]) 
      then ResStr := ResStr + #13#10 + TranslateText('[CONTROL_TABLE_INCOMPLETE] ��������: ')+
        Tables[I][TABLE_NAME]+', RCount: '+IntToStr(N) ;
  end;

  {��������� ���������� ������� � ������� ����������� ����}
  for I := 1 to length(Tables) do
  begin
    N := GetSqlValue(
      ' select count(*) from oil_cc where '+
      ' upper(table_name)=Upper('''+Tables[I][TABLE_NAME]+''') '+
      ' and table_inst='+ReadOilVar('INST') );

    if N = 0 then
      ResStr := ResStr + #13#10 + TranslateText('[OIL_CC_INCOMPLETE] ��������: ')+
        Tables[I][TABLE_NAME];

    TablesList := TablesList +
       ''''+Tables[I][TABLE_NAME]+''''+IfThen(I <> length(Tables),',','');
  end;

  {��������� ������� ����� � �������������� ��������}
  if GetSqlValue(
    ' select count(*) from all_tab_columns '+
    ' where owner = user '+
    ' and lower(column_name) = ''row_checksum'' '+
    ' and table_name in ('+TablesList+') '  ) = 0 then
   ResStr := ResStr + #13#10 +
     TranslateText('[CS_FIELDS_NOTFOUND] �������� �� ����������� ��� �������');

  OraQuery := TOilQuery.Create(nil);
  try

    {��������� ����������� ����� ��� ������ ������ � �������������� ��������}
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
          ResStr := ResStr + #13#10 + TranslateText('[ROWS_CHECKSUM_NOT_MATCH] ��������: ')+
            Tables[I][TABLE_NAME]+','+OraQuery.FieldByName('c').AsString;
    end;

    {��������� ����������� ����� ��� ������ �������������� �������}
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
          TranslateText('[TABLE_CHECKSUM_NOT_MATCH] ��������: ')+Tables[I][TABLE_NAME];
    end;

    {�������� ��������� � ������ ������}
    if ResStr <> '' then
      ResStr := Str + ResStr;

    {���� ���� ������ �������� ������}
    if ResStr <> '' then
      if MessageDlgExt(ResStr,mtError,[TranslateText('�����'),TranslateText(' ������ ������ ') ]) = 2 then
      begin
        {���������� ������}
        OraQuery.SQL.Text :=
          'select rawtohex(oilt.Md5( :key || :key1 ||to_char(sysdate,''(rrrr)(mm)(dd)'')) ) as pwd from dual';
        _OpenQueryParOra(OraQuery, ['Key',CHECKSUM_KEY,'Key1', ReadOilVar('INST')]  );
        CalcPwd := OraQuery.FieldByName('pwd').asString;

        {���� ������ ����������, �������� ������ � ��������}
        InputQuery(TranslateText('������'), TranslateText('������� ������'), Pwd);
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
        end else ShowMessage(TranslateText('�������� ������'));
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
  {���� � ������������� ��� �������� �� ���������}
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
