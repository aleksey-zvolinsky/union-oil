program StV;

uses
  Forms,
  v1 in 'v1.pas' {VForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TVForm, VForm);
  Application.Run;
end.
