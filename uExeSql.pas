unit uExeSql;
{   ������� � ��������� ��� ������ � ��������� SQL-���������
    ������ 30.09.2004
}

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, MemTable, ExtCtrls, Ora,uOilQuery,uOilStoredProc;

function GetExeSqlTextByName(p_SqlName,p_FormName: string): string;
function GetExeSqlTextById(p_Id: integer): string;
function GetExeSqlIdByName(p_SqlName,p_FormName: string): integer;
function GetQHeadValue(p_Q: TOilQuery; p_Name: string): string;
procedure LoadExeSql(
  p_Sql: TStrings;
  p_SqlName: string = '';
  p_FormName: string = '');
procedure LoadSQLByForm(var AForm: TForm);
function MakeExeSqlTests(p_Q: TOilQuery; var pp_Msg: string): Boolean;

implementation

uses ExFunc,OilStd, Main, GetFromGrid, TextFunc, uStart, MoneyFunc,UDbFunc,uTestLaunch;

//==============================================================================
// ��������� ������ SQL �� EXE_SQL.ID
//------------------------------------------------------------------------------
function GetExeSqlTextById(p_Id: integer): string;
var
  q: TOilQuery;
  eos: string;
begin
  result:='';
  q:=TOilQuery.Create(nil);
  q.Session:=frmStart.OraSession1;
  try
    q.SQL.Text:=
      ' select text from exe_sql_data'+
      ' where state=''Y'' and sql_id='+IntToStr(p_Id)+
      ' order by line';
    q.Open;

    result:='';

    if GetSqlValue('select lines_merge from exe_sql where id='+IntToStr(p_Id))='Y' then
      eos:=''
    else eos:=#13#10;

    while not q.Eof do begin
      result:=result+q.FieldByName('text').AsString+eos;
      q.Next;
    end;
  finally
    q.Free;
  end;
end;
//==============================================================================
// ��������� ������ SQL �� ����� SQL � ����� �����
//------------------------------------------------------------------------------
function GetExeSqlTextByName(p_SqlName,p_FormName: string): string;
var vId: integer;
begin
  vId:=GetExeSqlIdByName(p_SqlName,p_FormName);

  if vId=0 then
    raise exception.create(TranslateText('�� ������ �������� ������ � ������ ')+p_SqlName+TranslateText(' � ������ ����� ')+p_FormName);

  result:=GetExeSqlTextById(vId);
end;
//==============================================================================
function GetExeSqlFieldValue(p_SqlName,p_FormName,p_Field: string): variant;
var q: TOilQuery;
begin
  q:=TOilQuery.Create(nil);
  q.Session:=frmStart.OraSession1;
  try
    q.Sql.Text:=
      ' select sql.'+p_Field+
      ' from exe_sql sql,exe_forms frm'+
      ' where sql.state=''Y'' and frm.state=''Y'''+
      '   and sql.form_id=frm.id'+
      '   and lower(sql.name)=lower('''+p_SqlName+''')'+
      '   and lower(frm.name)=lower('''+p_FormName+''')';

    _OpenQueryOra(q);
    if q.RecordCount=0 then result:=0
    else result:=nvl(q.Fields[0].Value,0);
  finally
    q.Free;
  end;
end;
//==============================================================================
// ��������� - EXE_SQL.ID ��������� SQL � ��������� ������ SQL � ������ �����
// 0 ���� ������ SQL �� ���������� ���� �� � ��������� STATE=N
//------------------------------------------------------------------------------
function GetExeSqlIdByName(p_SqlName,p_FormName: string): integer;
begin
  result:=GetExeSqlFieldValue(p_SqlName,p_FormName,'id');
end;
//==============================================================================
// �������� ������������� ��������� SQL � ��������� ������ SQL � ������ �����
//------------------------------------------------------------------------------
function ExistsSqlByName(p_SqlName,p_FormName: string): Boolean;
begin
  result:=GetExeSqlIdByName(p_SqlName,p_FormName)>0;
end;
//==============================================================================
// � ������ ������ SQL ����� ����������� ����������������� ����
// --$����������=��������
// ������� ���������� ��������, ���� ��� ���� ��� ������ ������ ���� ��� ���
//------------------------------------------------------------------------------
function GetQHeadValue(p_Q: TOilQuery; p_Name: string): string;
var
  i: integer;
  s,name,value: string;
begin
  result:='';
  for i:=0 to p_Q.SQL.Count-1 do begin
    if copy(p_Q.Sql[i],1,3)<>'--$' then exit;
    s:=copy(p_Q.Sql[i],4,length(p_Q.sql[i]));
    GetNameValue(s,name,value);
    if lowercase(name)=lowercase(p_Name) then begin
      result:=value;
      exit;
    end;
  end;
end;
//==============================================================================
// ���� ���������� SQL-������ ��������.
// ���� ����� ���������� �� ������ ���� --> ����������,��������
// �� ���������� ������������ ���������������� ��������� �������
// ���� ������ --> ����� -->>, �� � ������ ���� ������ �� ����� ������
// ��������� ������. � ������ �� --> ��� �������� ������������
//------------------------------------------------------------------------------
procedure LoadExeSql(
  p_Sql: TStrings;
  p_SqlName: string = '';
  p_FormName: string = '');
var
  s,ver,vSqlName,vFormName: string;
  ErrorIfNoExists: Boolean;
begin
  if (p_Sql.Count=0) or (copy(p_Sql[0],1,3)<>'-->') then
    if (p_SqlName='') or (p_FormName='') then exit
    else p_Sql.Insert(0,'--> '+p_SqlName+','+p_FormName);

  ErrorIfNoExists:=FALSE;

  s:=copy(p_Sql[0],4,length(p_Sql[0]));
  if (s<>'') and (s[1]='>') then begin
    ErrorIfNoExists:=TRUE;
    s:=copy(s,2,length(s));
  end;

  GetNameValue(s,vSqlName,vFormName,',');
  if (vSqlName='') or (vFormName='') then
    raise exception.create(
      TranslateText('LoadExeSql: �������� ������ �� �������� ������')+#13#10+p_Sql[1]);
  qlog(TranslateText('����� ')+vSqlName+', '+vFormName);

  if ExistsSqlByName(vSqlName,vFormName) then begin
    ver:=GetExeSqlFieldValue(vSqlName,vFormName,'ver_id');
    if (ver='') or (ver='0') or not RightVersion(Version.fileversion,ver) then begin
      p_Sql.Text:=GetExeSqlTextByName(vSqlName,vFormName);
      qLog(TranslateText('������ �������'));
    end
  end else
    if ErrorIfNoExists then begin
      qlog(TranslateText('�� ������ �������� ������!!!'));
      raise exception.create(
        TranslateText('LoadExeSql: �� ������ �������� ������ (')+vSqlName+','+vFormName+')');
    end;
end;
//==============================================================================
procedure LoadSQLByForm(var AForm: TForm);
var
  I: Integer;
begin
  with AForm do
    for I := 0 to ComponentCount - 1 do
    begin
      if (Components[I] is TOilQuery) then
        LoadExeSQL((Components[I] as TOilQuery).SQL,(Components[I] as TOilQuery).Name,AForm.Name);
    end;
end;
//==============================================================================
function MakeExeSqlTests(p_Q: TOilQuery; var pp_Msg: string): Boolean;
var
  i,n: integer;
  s,vFunc: string;
  //****************************************************************************
  function MakeOneTest(p_Args: string): Boolean;
  var
    sl: TStringList;
    q: TOilQuery;
    i: integer;
  begin
    result:=TRUE;
    sl:=TStringList.Create;
    q:=TOilQuery.Create(nil);
    q.Session:=frmStart.OraSession1;
    try
      Str2StringList(p_Args,sl,';');
      if sl.Count<>4 then
        raise exception.create(
          TranslateText('MakeExeSqlTests: �������� ����� ����������')+#13#10+
          'TEST('+p_Args+')');
      if not ExistsSqlByName(sl[0],sl[1]) then exit;
      q.Sql.Text:=GetExeSqlTextByName(sl[0],sl[1]);
      q.Prepare;
      for i:=0 to q.Params.Count-1 do
        if p_Q.FindParam(q.Params[i].Name)<>nil then
          q.Params[i].Value:=p_Q.Params.ParamValues[q.Params[i].Name];
      _OpenQueryOra(q);
      if q.RecordCount=0 then exit;
      // ���� ������� ������
      if pp_Msg<>'' then pp_Msg:=pp_Msg+#13#10;
      pp_Msg:=pp_Msg+sl[2];
      if sl[3]='ABORT' then begin
        MessageDlg(sl[2],mtError,[mbOk],0);
        result:=FALSE;
      end else if sl[3]='CONTINUE' then begin
        MessageDlg(sl[2],mtWarning,[mbOk],0);
        result:=TRUE;
      end else if sl[3]='ANSWER' then begin
        result:=MessageDlg(sl[2]+#13#10+TranslateText('����������?'),mtConfirmation,[mbYes,mbNo],0)=mrYes;
      end;
    finally
      sl.Free;
      q.Free;
    end;
  end;
  //****************************************************************************
begin
  result:=TRUE; pp_Msg:='';
  for i:=0 to p_Q.Sql.Count-1 do begin
    if copy(p_Q.Sql[i],1,2)<>'--' then exit;
    if p_Q.Sql[i][3]<>'@' then continue;
    s:=trim(copy(p_Q.Sql[i],4,length(p_Q.Sql[i])));
    n:=pos('(',s);
    vFunc:=UpperCase(copy(s,1,n-1));
    if vFunc<>'TEST' then continue;
    result:=MakeOneTest(copy(s,n+1,length(s)-n-1));
    if not result then exit;
  end;
end;
//==============================================================================

end.
