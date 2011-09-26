unit RefreshQuery;

interface

uses
  Classes;

type
  TThreadRefreshQuery = class(TThread)
  private
    Progress: integer;
    procedure SetProgress;
  protected
    procedure Execute; override;
  end;

implementation

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure RefreshQuery.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ RefreshQuery }

procedure TThreadRefreshQuery.Execute;
var
  i: integer;
begin
  for i:=0 to 100 do
  begin
    sleep(50);
    Progress:=i;
    Synchronize(SetProgress);
  end;
end;

procedure TThreadRefreshQuery.SetProgress;
begin
  Form1.ProgressBar1.Position:=Progress;
end;

end.
