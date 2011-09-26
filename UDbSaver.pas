unit UDbSaver;

interface

uses UDbStructure, Ora, SysUtils, Db {$IFDEF VER150},Variants{$ENDIF}, Classes;

type
  TSqlItem = class(TCollectionItem)
  public
    Table: string;
    Fields: string;
    Key1Null: boolean;
    Query: TOraQuery;
    constructor Create(Collection: TCollection); override;
  end;

  TSqlItems = class(TCollection)
  private
    function GetItem(Index: integer): TSqlItem;
    procedure SetItem(Index: integer; Value: TSqlItem);
    function Add(
      ATable, AFields: string; AKey1Null: boolean; AQuery: TOraQuery): TSqlItem;
    function FindItem(ATable, AFields: string; AKey1Null: boolean): TSqlItem;
  public
    constructor Create;
    property Items[Index: integer]: TSqlItem read GetItem write SetItem; default;    
  end;

  TDbSaver=class
    public
      DBS: TDbStructure;
      OS: TOraSession;
      Key2Default: integer;
      function SaveRecord(p_Table: string; p_Values: array of variant; p_Commit: Boolean = false): integer;
      procedure SetState(p_Table: string; p_Id,p_Inst: integer; p_State: string);
      procedure StartTransaction;
      procedure Commit;
      procedure Rollback;
      function GetSQLValue(p_Sql:string; p_Field:string=''):variant;
      procedure ExecSql(p_Sql: string); overload;
      procedure ExecSql(p_Sql: string; p_ParValues:array of variant); overload;
      constructor Create(p_ConnectString: string); overload;
      constructor Create(p_OS: TOraSession); overload;
      constructor Create(p_OS: TOraSession; p_DBS: TDbStructure); overload;
      constructor Create(p_DBS: TDbStructure); overload;
      destructor Destroy; override;
    private
      OSCreated, DBSCreated: Boolean;
      LastTable, LastFields: string;
      q: TOraQuery;
      SqlList: TSqlItems;
      procedure ExecSQL(p_Q:TOraQuery); overload;
      procedure DefineQParams(var p_Q:TOraQuery;p_ParValues:array of variant);
      function SetLocalSeparator(AVar: string): string;
  end;

implementation

//==============================================================================
constructor TDbSaver.Create(p_ConnectString: string);
begin
  OS := TOraSession.Create(nil);
  OS.ConnectPrompt:=false;
  OS.ConnectString:=p_ConnectString;
  try
    OS.Connect;
  except
    on E:Exception do
      raise exception.create('TDbSaver: не удалось активизировать сессию'+#13#10+E.Message);
  end;
  DBS := TDbStructure.Create(OS);
  OSCreated := true; DBSCreated := true;
  q := TOraQuery.Create(nil);
  q.Session := OS;
  Self.SqlList := TSqlItems.Create;
end;
//==============================================================================
constructor TDbSaver.Create(p_OS: TOraSession);
begin
  OS := p_OS;
  DBS := TDbStructure.Create(OS);
  OSCreated := false; DBSCreated := true;
  q := TOraQuery.Create(nil);
  q.Session := OS;
  Self.SqlList := TSqlItems.Create;
end;
//==============================================================================
constructor TDbSaver.Create(p_OS: TOraSession; p_DBS: TDbStructure);
begin
  OSCreated := false; DBSCreated := false;
  q := TOraQuery.Create(nil);
  OS := p_OS;
  DBS := p_DBS;
  q.Session:=OS;
  Self.SqlList := TSqlItems.Create;
end;
//==============================================================================
constructor TDbSaver.Create(p_DBS: TDbStructure);
begin
  OSCreated := true; DBSCreated := false;
  OS := TOraSession.Create(nil);
  OS.Username := p_DBS.OraUser;
  OS.Password := p_DBS.OraPassword;
  OS.Server := p_DBS.OraServer;
  OS.Connect;
  q := TOraQuery.Create(nil);
  q.Session := OS;
  DBS := p_DBS;
  Self.SqlList := TSqlItems.Create;
end;
//==============================================================================
destructor TDbSaver.Destroy;
begin
  q.Close;
  q.Free;
  if DBSCreated then DBS.Free;
  if OSCreated then OS.Free;
  SqlList.Free;
end;
//==============================================================================
function TDbSaver.SaveRecord(p_Table: string; p_Values: array of variant; p_Commit: Boolean = false): integer;
var
  vFields,Key1,Key2: string;
  Key1Exists, Key2Exists, Key1Null: Boolean;
  Key1Value,Key2Value: Variant;
  i: integer;
  vSqlItem: TSqlItem;
  //****************************************************************************
  procedure PreProcessValues;
  var i: integer;
  begin
    Key1 := DBS.Key1(p_Table);
    Key2 := DBS.Key2(p_Table);

    if Key1='' then
      raise exception.create('не найдено первичного/уникального ключа');

    vFields    := '';
    Key1Exists := false;
    Key1Null   := false;
    Key2Exists := false;
    
    for i:=0 to High(p_Values) div 2 do
    begin
      vFields:=vFields+VarToStr(p_Values[i*2])+',';
      if p_Values[i*2]=Key1 then
      begin
        Key1Exists:=true;
        Key1Value:=p_Values[i*2+1];
        Key1Null := (VarToStr(Key1Value) = '0') or VarIsNull(Key1Value);
      end;
      if p_Values[i*2]=Key2 then
      begin
        Key2Exists:=true;
        Key2Value:=p_Values[i*2+1];
      end;
    end;

    if not Key1Exists and (DBS.ColumnOraType(p_Table,Key1)<>'NUMBER') then
      raise exception.create('для таблицы с нечисловым уникальным ключем значение ключа должно быть указано явно');

    if not Key2Exists and (Key2<>'') and (Key2Default=0) then
      raise exception.create('значение второго ключевого поля не указано и не установлено по умолчанию');
  end;
  //****************************************************************************
  procedure CreateSql;
  var
    i: integer;
    s,vValues: string;
  begin
    q.Sql.Text:='begin'+#13#10;
    if Key1Exists and (not Key1Null) then
    begin
      q.Sql.Add('update '+DBS.OraUser+'.'+p_Table+' set');
      for i:=0 to High(p_Values) div 2 do
        if (p_Values[i*2]<>Key1) and (p_Values[i*2]<>Key2) then
          q.Sql.Add(Format('%s=:%s,',[p_Values[i*2],p_Values[i*2]]));
      q.Sql.Text:=copy(q.Sql.Text,1,length(q.Sql.Text)-3);
      q.Sql.Add('where '+Key1+'=:'+Key1);
      if Key2<>'' then
        q.Sql.Add('and '+Key2+'=:'+Key2);
      q.Sql.Add(';');
      q.Sql.Add('if sql%notfound then');
    end;

    vValues:='';
    q.Sql.Add('insert into '+DBS.OraUser+'.'+p_Table+'(');
    if (not Key1Exists) or Key1Null then
    begin
      q.Sql.Add(Key1 +',');
      vValues := vValues + DBS.OraUser +'.'+ DBS.SeqByTable(p_Table) +'.nextval,';
    end;
    if not Key2Exists and (Key2<>'') then begin
      q.Sql.Add(Key2+',');
      vValues:=vValues+':'+Key2+',';
    end;
    for i := 0 to High(p_Values) div 2 do
      if not ((p_Values[i*2] = Key1) and Key1Null) then
      begin
        s:=p_Values[i*2];
        if i<>High(p_Values) div 2 then s:=s+',';
        q.Sql.Add(s);
        vValues:=vValues+':'+s;
      end;

    q.Sql.Add(') values ('+vValues+');');
    if Key1Exists and (not Key1Null) then
      q.Sql.Add('end if;');
    q.SQL.Add('end;');
    q.Prepare;

    for i:=0 to q.Params.Count-1 do
    begin
      q.Params[i].ParamType := ptInput;
      q.Params[i].DataType := DBS.ColumnParamType(p_Table,q.Params[i].Name);
    end;
  end;
  //****************************************************************************
  function GetSeqValue: integer;
  var
    qSeq: TOraQuery;
    vSeqName: string;
  begin
    vSeqName := DBS.SeqByTable(p_Table);
    if vSeqName = '' then
      raise exception.create('значение первого поля ключа не указано, при этом сиквенс не найден');
    qSeq := TOraQuery.Create(nil);
    try
      qSeq.Session := OS;
      qSeq.Sql.Text := ' select '+DBS.OraUser+'.'+vSeqName+'.nextval from dual';
      qSeq.Open;
      result := qSeq.Fields[0].AsInteger;
      qSeq.Close;
    finally
      qSeq.Free;
    end;
  end;
  //****************************************************************************
  procedure Save;
  var
    i: integer;
  begin
    if q.Active then q.Close;
    if not Key2Exists and (Key2<>'') then
      q.ParamByName(Key2).AsInteger:=Key2Default;
    for i := 0 to High(p_Values) div 2 do
      if not ((p_Values[i*2] = Key1) and Key1Null) then
      begin
        if (DBS.ColumnOraType(p_Table,p_Values[i*2]) = 'NUMBER') and (p_Values[i*2+1] <> null) then
          q.ParamByName(p_Values[i*2]).Value := SetLocalSeparator(p_Values[i*2+1])
        else
          q.ParamByName(p_Values[i*2]).Value := p_Values[i*2+1];
      end;
    //q.SQL.SaveToFile('d:\1.sql');
    q.ExecSql;
  end;
  //****************************************************************************
begin
  try
    if High(p_Values) mod 2 = 0 then
      raise exception.Create('параметр p_Values должен содержать четное число значений');
    if not DBS.TableExists(p_Table) then
      raise exception.create('таблица не найдена');

    for i:=0 to High(p_Values) div 2 do
      p_Values[i*2]:=ANSIUpperCase(VarToStr(p_Values[i*2]));

    PreProcessValues;
    // Если последнияя таблица и поля совпадают, то не пересоздавать запрос
    if (p_Table<>LastTable) or (vFields<>LastFields) then
    begin
      vSqlItem := SqlList.FindItem(p_Table, vFields, Key1Null);
      if vSqlItem = nil then
      begin
        CreateSql;
        SqlList.Add(p_Table, vFields, Key1Null, q);
      end
      else
        q.Assign(vSqlItem.Query);
    end;
    //if p_Commit then OS.StartTransaction;
    Save;

    if DBS.ColumnOraType(p_Table, Key1)='NUMBER' then
    begin
      if (not Key1Exists) or Key1Null then
        result := GetSQLValue('select '+ DBS.OraUser +'.'+ DBS.SeqByTable(p_Table) +'.currval from dual')
      else
        result := q.ParamByName(Key1).AsInteger;
    end
    else
      result := -1;
    if p_Commit then
      OS.Commit;
  except
    on E:Exception do
      raise exception.create(
        'TDbSaver.SaveRecord('+p_Table+',...): '+#13#10+E.Message);
  end;
end;
//==============================================================================
procedure TDbSaver.SetState(p_Table: string; p_Id,p_Inst: integer; p_State: string);
var
  q: TOraQuery;
  vKey2: string;
begin
  if not DBS.ColumnExists(p_Table,'STATE') then
    raise exception.create('TDbSaver.SetState: таблица '+p_Table+' не имеет поля STATE');
  q:=TOraQuery.Create(nil);
  q.Session:=OS;
  try
    q.Sql.Text:=
      ' update '+DBS.OraUser+'.'+p_Table+' set state='''+p_State+''' where '+DBS.Key1(p_Table)+'='+IntToStr(p_Id);
    vKey2:=DBS.Key2(p_Table);
    if vKey2<>'' then
      q.Sql.Add(' and '+vKey2+'='+IntToStr(p_Inst));
    try
      q.ExecSql;
    except
      on E:Exception do
        raise exception.create('TDbSaver.SetState: '+E.Message);
    end;
    q.Close;
  finally
    q.Free;
  end;
end;
//==============================================================================
function TDbSaver.GetSQLValue(p_Sql:string; p_Field:string=''):variant;
var q: TOraQuery;
begin
  q:=TOraQuery.Create(nil);
  q.Session := OS;
  try
    q.Sql.Text:=p_Sql;
    //q.Prepare;
    if q.Macros.FindMacro('user')<>nil then
      q.Macros.MacroByName('user').Value:=DBS.OraUser;
    q.Open;
    if q.IsEmpty then result:=null
    else if q.RecordCount>1 then raise exception.Create('TDbSaver.GetSqlValue: получено более одной записи')
    else
      if p_Field='' then result:=q.Fields[0].Value
      else result:=q.FieldByName(p_Field).Value;
    q.Close;
  finally
    q.Free;
  end;
end;
//==============================================================================
procedure TDbSaver.ExecSql(p_Sql: string);
var q:TOraQuery;
begin
  q:=TOraQuery.Create(nil);
  q.Session:=OS;
  q.SQL.Text:=p_SQL;
  if q.Macros.FindMacro('user')<>nil then
    q.Macros.MacroByName('user').Value:=DBS.OraUser;
  try
    ExecSQL(q);
    q.Close;
  finally
    q.Free;
  end;
end;
//==============================================================================
procedure TDbSaver.ExecSql(p_Sql: string; p_ParValues:array of variant);
var q:TOraQuery;
begin
  q:=TOraQuery.Create(nil);
  q.Session:=OS;
  q.SQL.Text:=p_SQL;
  DefineQParams(q,p_ParValues);
  if q.Macros.FindMacro('user')<>nil then
    q.Macros.MacroByName('user').Value:=DBS.OraUser;
  try
    ExecSQL(q);
    q.Close;
  finally
    q.Free;
  end;
end;
//==============================================================================
procedure TDbSaver.ExecSql(p_Q: TOraQuery);
var InsideTransaction:Boolean;
begin
  InsideTransaction:=os.InTransaction;
  if not InsideTransaction then os.StartTransaction;
  p_Q.ExecSql;
  if not InsideTransaction then os.Commit;
end;
//==============================================================================
procedure TDbSaver.DefineQParams(var p_Q:TOraQuery;p_ParValues:array of variant);
var i:integer;
begin
  if high(p_ParValues) mod 2 = 0 then
    Raise Exception.Create('TDbSaver.DefineQParams: нечетное число элементов в p_ParValues');
  for i:=0 to (high(p_ParValues) div 2) do
    p_Q.ParamByName(p_ParValues[i*2]).Value:=p_ParValues[i*2+1];
end;
//==============================================================================
procedure TDbSaver.StartTransaction;
begin
  if not os.InTransaction then
    os.StartTransaction;
end;
//==============================================================================
procedure TDbSaver.Commit;
begin
  if os.InTransaction then
    os.Commit;
end;
//==============================================================================
procedure TDbSaver.Rollback;
begin
  if os.InTransaction then
    os.Rollback;
end;
//==============================================================================

constructor TSqlItem.Create(Collection: TCollection);
begin
  inherited;
  Query := TOraQuery.Create(nil);
end;

{TSqlItems}

constructor TSqlItems.Create;
begin
  inherited Create(TSqlItem);
end;

function TSqlItems.GetItem(Index: Integer): TSqlItem;
begin
  Result := TSqlItem(inherited Items[Index]);
end;

procedure TSqlItems.SetItem(Index: Integer; Value: TSqlItem);
begin
  inherited SetItem(Index, TSqlItem(Value));
end;

function TSqlItems.Add(
  ATable, AFields: string; AKey1Null: boolean; AQuery: TOraQuery): TSqlItem;
begin
  Result := FindItem(ATable, AFields, AKey1Null);
  if Result = nil then
  begin
    Result := TSqlItem(inherited Add);
    Result.Table := ATable;
    Result.Fields := AFields;
    Result.Key1Null := AKey1Null;
    Result.Query.Assign(AQuery);
  end;
end;

function TSqlItems.FindItem(ATable, AFields: string; AKey1Null: boolean): TSqlItem;
var
  i: integer;
begin
  Result := nil;

  for i := 0 to Count - 1 do
  begin
    if (Self.Items[i].Table = ATable) and (Self.Items[i].Fields = AFields)
      and (Self.Items[i].Key1Null = AKey1Null) then
    begin
      Result := Self.Items[i];
      Break;
    end;
  end;
end;

function TDbSaver.SetLocalSeparator(AVar: string): string;
var
  s: string;
begin
  s := AVar;
  case DecimalSeparator of
    '.': if pos(',', s) > 0 then s[pos(',', s)] := DecimalSeparator;
    ',': if pos('.', s) > 0 then s[pos('.', s)] := DecimalSeparator;
  end;
  Result := s;
end;

end.

