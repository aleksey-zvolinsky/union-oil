unit SelNNNum;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, uCommonForm,uOilQuery,Ora, uOilStoredProc;

type
  TfSelNNNum = class(TCommonForm)
    GroupBox1: TGroupBox;
    rbManual: TRadioButton;
    rbAuto: TRadioButton;
    pnlButtons: TPanel;
    Button1: TButton;
    edNum: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    fNNNum: string;
  end;

var
  fSelNNNum: TfSelNNNum;

implementation

{$R *.DFM}

procedure TfSelNNNum.Button1Click(Sender: TObject);
begin
 if rbManual.Checked then
  begin
   if edNum.Text = '' then
    begin
     ShowMessage(TranslateText('Пожалуйста, укажите номер налоговой накладно!'));

     Abort;
    end;

    fNNNum:= edNum.Text;
  end
 else
  begin
   fNNNum:= '!auto!';
  end;

 ModalResult:= mrOk; 
end;

end.
