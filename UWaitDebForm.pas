unit UWaitDebForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, uCommonForm,uOilQuery,Ora, uOilStoredProc;

type
  TFWaitDebForm = class(TCommonForm)
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FWaitDebForm: TFWaitDebForm;

implementation

{$R *.DFM}

procedure TFWaitDebForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=CaFree;
end;

end.
