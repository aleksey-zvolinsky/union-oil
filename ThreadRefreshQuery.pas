unit ThreadRefreshQuery;

interface

uses
  Classes, Windows, Messages, SysUtils, Variants, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, Ora, ExFunc;

type
  TThreadRefreshQuery = class(TThread)
    FqOld, FqNew: TOraQuery;
    FMethod: TThreadMethod;
    FActiveThread, FCreateQNew, FCreateLog: boolean;
  private
    procedure Log(s: string); // ���
  public
    constructor Create(
      AqOld: TOraQuery; AMethod: TThreadMethod; ACreateLog: boolean=false);
    {
    destructor Destroy; override;
    function GetQNew(): boolean; // �������� �����
    }
  protected
    procedure Execute; override;
  end;

implementation

{ TThreadRefreshQuery }

constructor TThreadRefreshQuery.Create(
  AqOld: TOraQuery; AMethod: TThreadMethod; ACreateLog: boolean=false);
begin
  inherited Create(True);
  FreeOnTerminate := true;
  Priority := tpHigher;

  FActiveThread := true;
  FCreateQNew := false;
  FCreateLog := ACreateLog; // ���
  Log('�������� ...'); // ���

  FqOld := AqOld;
  FMethod := AMethod;

  Resume;
end;

procedure TThreadRefreshQuery.Execute;
var
  iBreak, i: integer;

  //****************************************************************************
  procedure KillThread(); // ���� �� ������ ������� ������ �� ���� ����������
  begin
    if not FActiveThread then
      raise Exception.Create('FActiveThread = False');
  end;
  //****************************************************************************
begin
  Log('TOraQuery('+ FqOld.Name +', '+ IntToStr(FqOld.RecordCount) +'), TThreadMethod('+ VarToStr(Assigned(FMethod)) +')'); // ���
  Log('���������� ...'); // ���
  try
    try
      FqNew := TOraQuery.Create(FqOld.Owner);
      FqNew.Assign(FqOld);

      FqNew.FetchAll := true;
      FqNew.NonBlocking := true;

      for i := 0 to FqNew.Params.Count-1 do
        Log('Params: '+ FqNew.Params[i].Name +' - '+ FqNew.Params[i].AsString); // ���
      Log('SQL: '+ copy(FqNew.SQL.Text, 1, 100)); // ���
      FqNew.Close;
      FqNew.Open;

      iBreak := 0;
      while not (FqNew.Active and FqNew.Fetched) do
      begin
        KillThread(); // ���� �� ������ ������� ������ �� ���� ����������
        Sleep(60);
        inc(iBreak);
        if iBreak > 1000 then
          raise Exception.Create('Fetched 60 second');
      end;

      Log('TOraQuery('+ FqOld.Name +', '+ IntToStr(FqNew.RecordCount) +')'); // ���
      FqNew.Filter := FqOld.Filter;
      FqNew.Filtered := FqOld.Filtered;
      Log('TOraQuery('+ FqOld.Name +', '+ IntToStr(FqNew.RecordCount) +')'); // ���
      KillThread(); // ���� �� ������ ������� ������ �� ���� ����������
    except on E: Exception do
      begin
        FActiveThread := false; // ��������� ������ ������
        Log('������: '+ E.Message); // ���
        exit; // �����
      end;
    end;

    FqNew.NonBlocking := false;
    FCreateQNew := true;
    Log('FCreateQNew := True'); // ���

    if Assigned(FMethod) then
      Synchronize(FMethod);

    while FActiveThread do
      Sleep(10);
  finally
    Log('����������� ...'); // ���
    FActiveThread := false;
    FCreateQNew := false;
  end;
end;

{
destructor TThreadRefreshQuery.Destroy;
begin
  Log('����������� ...'); // ���
  FActiveThread := false;
  FCreateQNew := false;

  Terminate;
  WaitFor;
  FreeOnTerminate := true;
  inherited Destroy;
end;

function TThreadRefreshQuery.GetQNew(): boolean; // �������� �����
var
  sName: string;
begin
  result := false;
  if FCreateQNew then
  begin
    sName := FqOld.Name;
    FqOld.Close;
    FqOld.Free;
    FqNew.Name := sName;
    FqOld := FqNew;
    result := true;
  end;
end;
}

procedure TThreadRefreshQuery.Log(s: string); // ���
begin
  if FCreateLog then
  begin
    if not DirectoryExists(GetMainDir +'Thread') then
      CreateDir(GetMainDir +'Thread');
    ExFunc.log(GetMainDir +'Thread\Thread_'+ VarToStr(Self.ThreadID) +'.log',
      FormatDateTime('dd.mm.yyyy hh:nn:ss', now()) +' '+ s);
  end;
end;

end.
