program BaseProlisky;

uses
  Forms,
  uMain in 'uMain.pas' {FMain},
  uTank in 'uTank.pas' {FTank};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TViewForm, ViewForm);
  Application.CreateForm(TFTank, FTank);
  Application.Run;
end.
