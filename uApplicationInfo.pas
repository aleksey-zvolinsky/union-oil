{ Модуль содержит класс-интерпритатор обращения к пакету DBMS_APPLICATION_INFO }
unit uApplicationInfo;

interface

uses Ora;

type
  { Класс интерпритатор обращения к пакету DBMS_APPLICATION_INFO }
  TApplicationInfo = class
  private
    FOraSession: TOraSession;
    procedure SetModule(AValue: string);
    procedure SetAction(AValue: string);
    procedure SetClientInfo(AValue: string);
    function GetModule:string;
    function GetAction: string;
    function GetClientInfo: string;
  public
    // Конструктор
    constructor Create(AOraSession: TOraSession);
    // Модуль либо программа
    property Module: string read GetModule write SetModule;
    // Совершаемое модулем действие 
    property Action: string read GetAction write SetAction;
    // Состояние текущего действия
    property ClientInfo: string read GetClientInfo write SetClientInfo;
  end;

implementation

{ TApplicationInfo }

constructor TApplicationInfo.Create(AOraSession: TOraSession);
begin
  FOraSession := AOraSession;
end;

procedure TApplicationInfo.SetModule(AValue: string);
begin
  FOraSession.ExecSQLEx('begin dbms_application_info.set_module(:s,''''); end;',
    ['s',AValue]);
end;

procedure TApplicationInfo.SetAction(AValue: string);
begin
  FOraSession.ExecSQLEx('begin dbms_application_info.set_action(:s); end;',
    ['s',AValue]);
end;

procedure TApplicationInfo.SetClientInfo(AValue: string);
begin
  FOraSession.ExecSQLEx('begin dbms_application_info.set_client_info(:s); end;',
    ['s',AValue]);
end;

function TApplicationInfo.GetModule:string;
var
  q: TOraQuery;
begin
  q := TOraQuery.Create(nil);
  q.Session := FOraSession;
  try
    q.SQL.Text := 'begin dbms_application_info.read_module(action_name => :ResultA, module_name => :ResultM); end;';
    q.Execute;
    Result := q.ParamByName('ResultM').AsString;
  finally
    q.Free;
  end;
end;

function TApplicationInfo.GetAction: string;
var
  q: TOraQuery;
begin
  q := TOraQuery.Create(nil);
  q.Session := FOraSession;
  try
    q.SQL.Text := 'begin dbms_application_info.read_module(action_name => :ResultA, module_name => :ResultM); end;';
    q.Execute;
    Result := q.ParamByName('ResultA').AsString;
  finally
    q.Free;
  end;
end;

function TApplicationInfo.GetClientInfo: string;
var
  q: TOraQuery;
begin
  q := TOraQuery.Create(nil);
  q.Session := FOraSession;
  try
    q.SQL.Text := 'begin dbms_application_info.read_client_info(client_info => :Result); end;';
    q.Execute;
    Result := q.ParamByName('Result').AsString;
  finally
    q.Free;
  end;
end;

end.
