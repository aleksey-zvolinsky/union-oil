unit UDbStructure;

interface

uses Classes,Ora,OraLoader,Db,SysUtils{$IFDEF VER150},DALoader{$ENDIF};

{$DEFINE NOLOGGING}

type
  TLists = array of
  record
    List: TStringList;
    Name: string
  end;
  
  TDbStructure = class
  private
    FFileList: TLists;
    FTables,FTabLevels,FTabUnload,FPK,FFK,FCK,FUK,FColumns,FSequences,FTablesNoSeq: TStringList;
    FUser,FPassword,FServer,FDir: string;
    {$IFDEF LOGGING}
    BLog: TextFile;
    {$ENDIF}
    function TableOfColumns(p_Num: integer): string; // таблица записи с номером p_Num в FColumns
    function ColumnOfColumns(p_Num: integer): string; // поле записи с номером p_Num в FColumns
    function FirstTableInColumns(p_Table: string): integer; // находит первую запись таблицы p_Table в FColumns
    function ColumnPosition(p_Table,p_Column: string): integer; // нахождение поля в FColumns
    function ColumnValues(p_Table,p_Column: string): string;
  public
    procedure CountTableLevels;
    function KeysCount(p_Table: string): integer;
    function Key1(p_Table: string): string;
    function Key2(p_Table: string): string;
    function TableExists(p_Table: string): Boolean;
    function ColumnExists(p_Table,p_Column: string): Boolean;
    function ColumnOraType(p_Table,p_Column: string): string;
    function ColumnParamType(p_Table,p_Column: string): TFieldType;
    function ColumnLoaderType(p_Table,p_Column: string): {$IFDEF VER130} TDpColumnDataType{$ELSE} TDAColumnDataType {$ENDIF};
    function SeqByTable(p_Table: string): string;
    procedure Init(p_Session: TOraSession); overload;
    procedure Init(p_User,p_Password,p_Server: string); overload;
    function AnalizeColumnList(p_Table,p_Fields: string): string;
    function DecodeFK(p_Name: string;
      var pp_Table1, pp_Col11, pp_Col12, pp_Table2, pp_Col21, pp_Col22: string): Boolean;
    function DecodeCK(p_Name: string; var pp_Table, pp_Condition: string): Boolean;
    function TablesCount: integer;
    function TableLevel(p_Table: string): integer;
    function FieldList(p_Table: string; p_WithoutDateMod: Boolean): string;
    function LoadFromDir(APath: string): boolean;
    procedure SaveToDir(APath: string);
    procedure FillLists(p_Session: TOraSession);

    constructor Create; overload;
    constructor Create(p_Session: TOraSession; p_Dir: string = ''); overload;
    constructor Create(p_User, p_Password, p_Server: string; p_Dir: string = ''); overload;
    destructor Destroy; override;

    property OraUser: string read FUser;
    property OraPassword: string read FPassword;
    property OraServer: string read FServer;
    property Tables: TStringList read FTables;
    property TabLevels: TStringList read FTabLevels;
    property Columns: TStringList read FColumns;
    property TabUnload: TStringList read FTabUnload;
    property FileList: TLists read FFileList write FFileList;
    property Dir: string read FDir;
  end;

  TDbStructureThread = class(TThread)
  private
    FSession: TOraSession;
    FDbStructure: TDbStructure;
  public
    procedure Execute; override;
    constructor Create(ADBS: TDbStructure; ASession: TOraSession);
    destructor Destroy; override;
  end;
implementation

uses Math;

{ TDbStructure }
//==============================================================================
function TDbStructure.SeqByTable(p_Table: string): string;
begin
  p_Table:=ANSIUpperCase(p_Table);
  result:=FSequences.Values[p_Table];
  if result='' then
    result:='S_'+p_Table;
end;
//==============================================================================
procedure TDbStructure.Init(p_Session: TOraSession);
begin
  FUser := p_Session.UserName;
  FPassword := p_Session.Password;
  FServer := p_Session.Server;
  if LoadFromDir(FDir) then
    TDbStructureThread.Create(Self,p_Session)
  else
    FillLists(p_Session);
end;
//==============================================================================
procedure TDbStructure.Init(p_User,p_Password,p_Server: string);
var
  os: TOraSession;
begin
  os := TOraSession.Create(nil);
  try
    os.Username := p_User;
    os.Password := p_Password;
    os.Server := p_Server;
    os.ConnectPrompt := False;
    os.Connect;
    Init(os);
  finally
    os.Free;
  end;
end;
//==============================================================================
constructor TDbStructure.Create;
  procedure FileListAdd(AStringLists: array of TStringList; ANames: array of string);
  var
    i: integer;
  begin
    for i := low(AStringLists) to high(AStringLists) do
    begin
      SetLength(FFileList, Length(FFileList)+1);
      FFileList[Length(FFileList)-1].List := AStringLists[i];
      FFileList[Length(FFileList)-1].Name := ANames[i];
    end;
  end;
begin
  FTables := TStringList.Create;
  FTabLevels := TStringList.Create;
  FTabUnload := TStringList.Create;
  FPK := TStringList.Create;
  FFK := TStringList.Create;
  FCK := TStringList.Create;
  FUK := TStringList.Create;  
  FColumns := TStringList.Create;
  FSequences := TStringList.Create;
  FTablesNoSeq := TStringList.Create;

  FileListAdd(
    [FTables, FTabLevels, FTabUnload, FPK, FFK, FCK, FUK, FColumns, FSequences, FTablesNoSeq],
    ['Tables','TabLevels','TabUnload','PK','FK','CK','UK','Columns','Sequences','TablesNoSeq']);
end;
//==============================================================================
constructor TDbStructure.Create(p_Session: TOraSession; p_Dir: string = '');
begin
  Create;
  FDir := p_Dir;
  Init(p_Session);
end;
//==============================================================================
constructor TDbStructure.Create(p_User,p_Password,p_Server: string; p_Dir: string = '');
begin
  Create;
  FDir := p_Dir;
  Init(p_User,p_Password,p_Server);
end;
//==============================================================================
destructor TDbStructure.Destroy;
begin
  inherited;
  FTables.Free;
  FTabLevels.Free;
  FTabUnload.Free;
  FColumns.Free;
  FSequences.Free;
  FTablesNoSeq.Free;
  FPK.Free;
  FFK.Free;
  FCK.Free;
  FUK.Free;
end;
//==============================================================================
function TDbStructure.TableExists(p_Table: string): Boolean;
begin
  p_Table:=ANSIUpperCase(p_Table);
  result:=(FTables.IndexOfName(p_Table)<>-1);
end;
//==============================================================================
function TDbStructure.ColumnExists(p_Table,p_Column: string): Boolean;
begin
  result:=ColumnPosition(p_Table,p_Column)<>-1;
end;
//==============================================================================
function TDbStructure.ColumnOraType(p_Table,p_Column: string): string;
begin
  result := ColumnValues(p_Table,p_Column);
  if pos('(',result)>0 then
    result := copy(result,1,pos('(',result)-1);
end;
//==============================================================================
function TDbStructure.ColumnParamType(p_Table,p_Column: string): TFieldType;
var s: string;
begin
  s:=ColumnOraType(ANSIUpperCase(p_Table),ANSIUpperCase(p_Column));
  if s='DATE' then result:=ftDateTime
  else if s='NUMBER' then result:=ftFloat
  else if (s='CHAR') or (s='VARCHAR2') then result:=ftString
  else result:=ftUnknown;
end;
//==============================================================================
function TDbStructure.ColumnLoaderType(p_Table,p_Column: string): {$IFDEF VER130} TDpColumnDataType{$ELSE} TDAColumnDataType {$ENDIF};
var s: string;
begin
  s:=ColumnOraType(ANSIUpperCase(p_Table),ANSIUpperCase(p_Column));
  if s='DATE' then result:=ctDate
  else if s='NUMBER' then result:=ctFloat
  else if (s='CHAR') or (s='VARCHAR2') then result:=ctString
  else result:=ctString;
end;
//==============================================================================
function TDbStructure.KeysCount(p_Table: string): integer;
var s: string;
begin
  s:=FTables.Values[ANSIUpperCase(p_Table)];
  if s='' then result:=0
  else if pos(',',s)=0 then result:=1
  else result:=2;
end;
//==============================================================================
function TDbStructure.Key1(p_Table: string): string;
var s: string;
begin
  s:=FTables.Values[ANSIUpperCase(p_Table)];
  if s='' then result:=''
  else if pos(',',s)<>0 then result:=copy(s,1,pos(',',s)-1)
  else result:=s;
end;
//==============================================================================
function TDbStructure.Key2(p_Table: string): string;
var s: string;
begin
  s:=FTables.Values[ANSIUpperCase(p_Table)];
  if pos(',',s)=0 then result:=''
  else result:=copy(s,pos(',',s)+1,length(s));
end;
//==============================================================================
function TDbStructure.AnalizeColumnList(p_Table,p_Fields: string): string;
var
  sl: TStringList;
  i: integer;
  //Key1Exists,Key2Exists: Boolean;
  vKey1,vKey2: string;
begin
  p_Table:=ANSIUpperCase(p_Table);
  p_Fields:=ANSIUPperCase(p_Fields);
  if not TableExists(p_Table) then
    result:='таблица '+p_Table+' не найдена'
  else begin
    //Key1Exists:=false; Key2Exists:=false;
    vKey1:=Key1(p_Table);
    vKey2:=Key2(p_Table);
    sl:=TStringList.Create;
    sl.CommaText:=p_Fields;
    for i:=0 to sl.Count-1 do
      if not ColumnExists(p_Table,sl[i]) then begin
        result:='поле '+p_Table+'.'+sl[i]+' не найдено';
        exit;
      end;{ else begin
        if sl[i]=vKey1 then Key1Exists:=true;
        if sl[i]=vKey2 then Key2Exists:=true;
      end;}
    {if not Key1Exists or (vKey2<>'') and not Key2Exists then
      result:='в списке полей для таблицы '+p_Table+' не перечислены первичные ключи'
    else}
      result:='';
    sl.Free;
  end;
end;
//==============================================================================
function TDbStructure.DecodeFK(p_Name: string;
  var pp_Table1, pp_Col11, pp_Col12, pp_Table2, pp_Col21, pp_Col22: string): Boolean;
var
  s: string;
  n: integer;
begin
  s:=FFK.Values[p_Name];
  result:=s<>'';
  if not result then exit;

  n:=pos('-',s);
  pp_Table2:=copy(s,n+1,length(s));
  pp_Col21:=Key1(pp_Table2);
  pp_Col22:=Key2(pp_Table2);
 
  s:=copy(s,1,n-2);
  n:=pos('(',s);
  pp_Table1:=copy(s,1,n-1);
  s:=copy(s,n+1,length(s));
  n:=pos(',',s);
  if n=0 then begin
    pp_Col11:=s;
    pp_Col12:='';
  end else begin
    pp_Col11:=copy(s,1,n-1);
    pp_Col12:=copy(s,n+1,length(s));
  end;
end;
//==============================================================================
function TDbStructure.DecodeCK(p_Name: string; var pp_Table, pp_Condition: string): Boolean;
var
  s: string;
  n: integer;
begin
  s:=FCK.Values[p_Name];
  result:=s<>'';
  if not result then exit;
  n:=pos('(',s);
  pp_Table:=copy(s,1,n-1);
  pp_Condition:=copy(s,n+1,length(s)-n-1);
end;
//==============================================================================
procedure TDbStructure.CountTableLevels;
var
  i: integer;
  slFK: TStringList;
  F: TextFile;
  //****************************************************************************
  procedure Log(p_Str: string; p_Level: integer =0);
  var
    i: integer;
    s: string;
  begin
    s:='';
    for i:=1 to p_Level do
      s:=s+'  ';
    writeln(F,s+p_Str);
  end;
  //****************************************************************************
  procedure FillSlFK;
  var
    i: integer;
    s,sTable1,sTable2: string;
  begin
    slFK:=TStringList.Create;
    for i:=0 to FFK.Count-1 do begin
      log(FFK.Names[i],1);
      DecodeFK(FFK.Names[i],sTable1,s,s,sTable2,s,s);
      if sTable1<>sTable2 then
        slFK.Add(sTable1+'-'+sTable2);
      log(sTable1+'-'+sTable2,2);
    end;
    log('Сортировка',1);
    slFK.Sort;
  end;
  //****************************************************************************
  function GetFKFirstTable(p_Num: integer): string;
  begin
    result:=copy(slFK[p_Num],1,pos('-',slFK[p_Num])-1);
  end;
  //****************************************************************************
  function GetFKSecondTable(p_Num: integer): string;
  begin
    result:=copy(slFK[p_Num],pos('-',slFK[p_Num])+1,length(slFK[p_Num]));
  end;
  //****************************************************************************
  function FindTableSlFK(p_Table: string): integer;
  begin
    for result:=0 to slFK.Count-1 do
      if p_Table=GetFKFirstTable(result) then
        exit;
    result:=-1;
  end;
  //****************************************************************************
  function CountOneLevel(p_Num: integer; p_Level: integer): integer;
  var
    i,L,L2: integer;
    sTable,sTable2: string;
  begin
    L:=0;
    sTable:=FTabLevels.Names[p_Num];
    log(sTable,p_Level);
    i:=FindTableSlFK(sTable);
    if i<>-1 then
      repeat
        sTable2:=GetFKSecondTable(i);
        if FTabLevels.Values[sTable2]='' then
          L2:=CountOneLevel(FTabLevels.IndexOfName(sTable2),p_Level+1)
        else
          L2:=StrToInt(FTabLevels.Values[sTable2]);
        if L2+1>L then L:=L2+1;
        inc(i);
      until (i>=slFK.Count) or (sTable<>GetFKFirstTable(i));
    result:=L;
    FTabLevels.Values[sTable]:=IntToStr(L);
    log(Format('%s = %d',[sTable,L]),p_Level);
  end;
  //****************************************************************************
begin
  try
    AssignFile(F,GetCurrentDir+'\tablevels.log');
    Rewrite(F);
    try
      log('Очищаю таблицы');
      FTabLevels.Clear;
      log('Создаю начальный список таблиц');
      for i:=0 to FTables.Count-1 do
      begin
        log(FTables.Names[i],1);
        FTabLevels.Add(FTables.Names[i]+'=');
      end;
      log('Вывожу список колонок');
      for i:=0 to FColumns.Count-1 do
      begin
        log(Format('%d: %s',[i,FColumns[i]]));
      end;
      log('Создаю список внешних ключей');
      FillSlFK;
      log('Подсчитываю уровни');
      for i:=0 to FTabLevels.Count-1 do
        if FTabLevels.Values[FTabLevels.Names[i]]='' then
          CountOneLevel(i,0);
      slFK.Free;
      log('Закончено успешно');
    finally
      CloseFile(F);
    end;
  except on E: Exception do
    log('Ошибка при определении иерархии таблиц: '+ E.Message);
  end;
end;
//==============================================================================
function TDbStructure.TablesCount: integer;
begin
  result:=FTables.Count;
end;
//==============================================================================
function TDbStructure.TableLevel(p_Table: string): integer;
begin
  result:=StrToInt(FTabLevels.Values[p_Table]);
end;
//==============================================================================
function TDbStructure.FieldList(p_Table: string; p_WithoutDateMod: Boolean): string;
var
  i: integer;
  s: string;
begin
  i:=0;
  while (i<FColumns.Count) and (TableOfColumns(i)<>p_Table) do
    inc(i);
  result:='';
  if i=FColumns.Count then exit;
  while (i<FColumns.Count) and (TableOfColumns(i)=p_Table) do begin
    s:=ColumnOfColumns(i);
    if (s<>'DATE_MOD') or (not p_WithoutDateMod) then
      result:=result+s+',';
    inc(i);
  end;
  if result<>'' then
    SetLength(result,length(result)-1);
end;
//==============================================================================
function TDbStructure.TableOfColumns(p_Num: integer): string;
begin
  result:=copy(FColumns.Names[p_Num],1,pos('.',FColumns.Names[p_Num])-1);
end;
//==============================================================================
function TDbStructure.ColumnOfColumns(p_Num: integer): string;
begin
  result:=copy(FColumns.Names[p_Num],pos('.',FColumns.Names[p_Num])+1,255);
end;
//==============================================================================
function TDbStructure.FirstTableInColumns(p_Table: string): integer;
  //****************************************************************************
  function FindAny: integer;
  var
    l,u,m: integer;
    s: string;
  begin
    {$IFDEF LOGGING}
    writeln(Blog,'FindAny');
    {$ENDIF}
    l:=1; u:=FColumns.Count-1;
    result:=-1;
    while (l<=u) and (result=-1) do begin
      m:=(l+u) div 2;
      {$IFDEF LOGGING}
      writeln(BLog,Format('%d-%d: %d',[l,u,m]));
      {$ENDIF}
      s:=TableOfColumns(m);
      if s=p_Table then
        result:=m
      else if s<p_Table then
        l:=m+1
      else u:=m-1;
    end;
    {$IFDEF LOGGING}
    writeln(BLog,Format('FindAny result=%d',[result]));
    {$ENDIF}
  end;
  //****************************************************************************
begin
  result:=FindAny;
  while (result>=0) and (TableOfColumns(result)=p_Table) do
    dec(result);
  inc(result);
  {$IFDEF LOGGING}
  writeln(BLog,Format('FirstTableColumns result=%d',[result]));
  {$ENDIF}
end;
//==============================================================================
function TDbStructure.ColumnPosition(p_Table, p_Column: string): integer;
begin
  {$IFDEF LOGGING}
  AssignFile(BLog,GetCurrentDir+'\cposition.log');
  Rewrite(BLog);
  try
    writeln(BLog,p_Table+','+p_Column);
    writeln(BLog,'FirstTableColumns');
  {$ENDIF}
    result := FirstTableInColumns(p_Table);
    if result=-1 then
      exit;
    while (result<FColumns.Count) and (TableOfColumns(result)=p_Table)
      and (ColumnOfColumns(result)<>p_Column)
    do
      inc(result);
    {$IFDEF LOGGING}
    writeln(BLog,Format('Next result=%d',[result]));
    {$ENDIF}

    if (result=FColumns.Count) or (FColumns.Names[result]<>p_Table+'.'+p_Column) then
      //result:=-1;
      raise Exception.CreateFmt('TDbStructure.ColumnPosition(%s,%s): Не найдено!',[p_Table, p_Column]);
  {$IFDEF LOGGING}
    writeln(BLog,Format('Next result=%d',[result]));
  finally
    CloseFile(BLog);
  end;
  {$ENDIF}
end;
//==============================================================================
function TDbStructure.ColumnValues(p_Table, p_Column: string): string;
begin
  result := FColumns[ColumnPosition(p_Table,p_Column)];
  result := copy(result,pos('=',result)+1,length(result));
end;
//==============================================================================
function TDbStructure.LoadFromDir(APath: string): boolean;
var
  i: integer;
begin
  Result := True;
  for i := low(FFileList) to high(FFileList) do
  begin
    Result := Result and FileExists(APath + '\' + FServer + '-' + FUser + '-' + FFileList[i].Name + '.ini');
    if Result then
      FFileList[i].List.LoadFromFile(APath + '\' + FServer + '-' + FUser + '-' + FFileList[i].Name + '.ini');
  end;
end;
//==============================================================================
procedure TDbStructure.SaveToDir(APath: string);
var
  i: integer;
begin
  for i := low(FFileList) to high(FFileList) do
    FFileList[i].List.SaveToFile(APath + '\' + FServer + '-' + FUser + '-' + FFileList[i].Name + '.ini');
end;
//==============================================================================
procedure TDbStructure.FillLists(p_Session: TOraSession);
var
  q: TOraQuery;
  //****************************************************************************
  procedure FillTables;
  begin
    if q.Active then q.Close;
    q.SQL.Text:=
      ' select table_name from sys.all_tables'+
      ' where owner=user'+
      ' order by table_name';
    q.Open;
    FTables.Clear;
    while not q.Eof do begin
      FTables.Add(q['table_name']+'=');
      q.Next;
    end;
  end;
  //****************************************************************************
  procedure FillPK;
  begin
    FPK.Clear;
    FTables.Sorted:=false;
    if q.Active then q.Close;
    q.Sql.Text:=
      ' select c.table_name,c.constraint_name,'+
      '   c1.column_name||decode(c2.column_name,null,null,'','')||c2.column_name as keys'+
      ' from sys.all_constraints c,sys.all_cons_columns c1,sys.all_cons_columns c2'+
      ' where c.owner=user'+
      '   and c.constraint_type=''P'''+
      '   and c1.owner(+)=user'+
      '   and c2.owner(+)=user'+
      '   and c1.constraint_name(+)=c.constraint_name'+
      '   and c2.constraint_name(+)=c.constraint_name'+
      '   and c1.position(+)=1'+
      '   and c2.position(+)=2'+
      ' order by table_name';
    q.Open;
    while not q.Eof do begin
      FTables.Values[q['table_name']]:=q['keys'];
      FPK.Add(Format('%s=%s',[q['constraint_name'],q['table_name']]));
      q.Next;
    end;
  end;
  //****************************************************************************
  procedure FillColumns;
  var s: string;
  begin
    if q.Active then q.Close;
    q.Sql.Text:=
      ' select table_name||''.''||column_name as column_name,data_type,data_length,data_precision'+
      ' from sys.all_tab_columns'+
      ' where owner=user'+
      '   and table_name in'+
      '      (select table_name from sys.all_tables where owner=user)'+
      ' order by table_name,column_id';
    q.Open; FColumns.Clear;
    while not q.Eof do begin
      s:=Format('%s=%s',[q['column_name'],q['data_type']]);
      if q['data_type']='VARCHAR2' then
        s:=Format('%s(%d)',[s,q.FieldByName('data_length').AsInteger]);
      if q['data_type']='NUMBER' then
        s:=Format('%s(%d,%d)',[s,q.FieldByName('data_length').AsInteger,q.FieldByName('data_precision').AsInteger]);
      FColumns.Add(s);
      q.Next;
    end;
  end;
  //****************************************************************************
  procedure FillSequences;
  begin
    FSequences.Clear;
    if (FTables.IndexOfName('EXE_SEQUENCES')=-1) and (FTables.IndexOf('EXE_SEQUENCES')=-1) then exit;
    if q.Active then q.Close;
    q.Sql.Text:=
      ' select table_name||''=''||sequence_name from exe_sequences'+
      ' where sequence_name is not null'+
      '   and column_name is null'+
      '   and nvl(show_in_form,''N'')<>''Y'''+
      ' order by 1';
    q.Open;
    while not q.Eof do begin
      FSequences.Add(q.Fields[0].AsString);
      q.Next;
    end;
  end;
  //****************************************************************************
  procedure FillTablesNoSeq;
  {var
    i: integer;
    s: string; }
  begin
    {FTablesNoSeq.Clear;
    if q.Active then q.Close;
    q.Sql.Text:=
      ' select count(*) from sys.all_sequences'+
      ' where sequence_owner=user'+
      '   and sequence_name=:name';
    q.Params[0].DataType:=ftString;
    for i:=0 to FTables.Count-1 do begin
      s:=FTables[i];
      if pos('=',s)>0 then
        s:=copy(s,1,pos('=',s)-1);
      if FSequences.IndexOfName(s)=-1 then begin
        q.Params[0].AsString:='S_'+s;
        q.Open;
        if q.Fields[0].AsInteger=0 then
          FTablesNoSeq.Add(s);
        q.Close;
      end;
    end;     }
    FTablesNoSeq.Clear;
    if q.Active then q.Close;
    q.Sql.Text:=
      'select substr(sequence_name,3)'+
      '  from user_sequences s'+
      ' where exists (select ''x'''+
      '          from user_tables t'+
      '         where ''S_'' || table_name = s.sequence_name)';
    q.Open;
    while not q.Eof do begin
      FTablesNoSeq.Add(q.Fields[0].AsString);
      q.Next;
    end;
    q.Close;
  end;
  //****************************************************************************
  procedure FillFK;
  var s: string;
  begin
    FFK.Clear;
    if q.Active then q.Close;
    q.Sql.Text:=' select c.table_name,c.constraint_name,c.r_constraint_name,';
    q.Sql.Add(' min(decode(cc.position,1,cc.column_name,to_char(null))) as column1,');
    q.Sql.Add(' min(decode(cc.position,2,cc.column_name,to_char(null))) as column2');
    q.Sql.Add(' from sys.all_constraints c, sys.all_cons_columns cc');
    q.Sql.Add(' where c.owner=user and cc.owner=c.owner');
    q.Sql.Add('   and c.constraint_type=''R''');
    q.Sql.Add('   and cc.constraint_name=c.constraint_name');
    q.Sql.Add(' group by c.table_name,c.constraint_name,c.r_constraint_name');
    q.Sql.Add(' order by c.constraint_name');
    q.Open;
    while not q.Eof do begin
      if q.FieldByName('column2').AsString='' then s:=''
      else s:=',';
      FFK.Add(Format('%s=%s(%s%s%s)-%s',
        [q['constraint_name'],q['table_name'],
         q['column1'],s,q['column2'],FPK.Values[q['r_constraint_name']]]));
      q.Next;
    end;
  end;
  //****************************************************************************
  procedure FillCK;
  begin
    FCK.Clear;
    if q.Active then q.Close;
    q.Sql.Text:=
      ' select constraint_name,table_name,search_condition'+
      ' from sys.all_constraints'+
      ' where owner=user'+
      '   and constraint_type=''C'''+
      ' order by constraint_name';
    q.Open;
    while not q.Eof do begin
      FCK.Add(Format('%s=%s(%s)',[q['constraint_name'],q['table_name'],q['search_condition']]));
      q.Next;
    end;
  end;
  //****************************************************************************
  procedure FillTabUnload;
  begin
    FTabUnload.Clear;
    if q.Active then q.Close;
    q.Sql.Text:=
      ' select table_name||''=''||decode(forbidden,1,null,condition)'+
      ' from exch_unload_tables';
    q.Open;
    while not q.Eof do begin
      FTabUnload.Add(q.Fields[0].AsString);
      q.Next;
    end;
  end;
  //****************************************************************************
begin
  q := TOraQuery.Create(nil);
  try
    q.Session := p_Session;
    FillTables;
    FillPK;
    FillColumns;
    FillSequences;
    FillTablesNoSeq;
    FillFK;
    FillCK;
    if TableExists('EXCH_UNLOAD_TABLES') then
      FillTabUnload;

    FTables.Sorted := true;
    FSequences.Sorted := true;
    FTablesNoSeq.Sorted := true;
    FCK.Sort;
    FPK.Sort;
    FFK.Sort;
    q.Close;

    CountTableLevels;

    if FDir <> '' then
      SaveToDir(FDir);
  finally
    q.Free;
  end;
end;
//==============================================================================
{ TDbStructureThread }

constructor TDbStructureThread.Create(ADBS: TDbStructure;
  ASession: TOraSession);
begin
  inherited Create(True);
  Self.FreeOnTerminate := True;
  FSession := TOraSession.Create(nil);
  FSession.Options.Net := ASession.Options.Net;
  FSession.Username := ASession.Username;
  FSession.Password := ASession.Password;
  FSession.Server := ASession.Server;
  {$IFDEF VER150} FSession.Schema := ASession.Schema; {$ENDIF}
  FDbStructure := ADBS;
  Self.Resume;
end;

destructor TDbStructureThread.Destroy;
begin
  FSession.Disconnect;
  FSession.Free;
  inherited Destroy;
end;

procedure TDbStructureThread.Execute;
var
  DBS: TDbStructure;
  i: integer;
begin
  try
    DBS := TDbStructure.Create(FSession);
    try
      for i := low(FDbStructure.FileList) to high(FDbStructure.FileList) do
        FDbStructure.FileList[i].List.Text := DBS.FileList[i].List.Text;
      DBS.SaveToDir(FDbStructure.Dir);
    finally
      DBS.Free;
    end;
  except
  end;
end;

end.
