unit OraBaseDialog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, uCommonForm,uOilQuery,Ora, uOilStoredProc;

type
  TOraBaseDialogForm = class(TCommonForm)
    Label1: TLabel;
    Edit1: TEdit;
    bbOk: TBitBtn;
    BitBtn2: TBitBtn;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OraBaseDialogForm: TOraBaseDialogForm;

implementation

{$R *.DFM}

function GetOraBase: string;
begin

end;

procedure TOraBaseDialogForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
    if Key=#13 then bbOk.Click;    
end;

end.
