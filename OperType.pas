unit OperType;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ToolEdit, ExtCtrls, uCommonForm, uXMLForm,uOilQuery,Ora, uOilStoredProc;

type
  TOperTypeForm = class(TCommonForm)
    Panel1: TPanel;
    Edit1: TEdit;
    ComboEdit1: TComboEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SpeedButton1: TSpeedButton;
    CheckBox1: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboEdit1ButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    GName:string;
    GId:integer;
  end;

var
  OperTypeForm: TOperTypeForm;

implementation
{$R *.DFM}

procedure TOperTypeForm.BitBtn1Click(Sender: TObject);
begin
 GName:=Edit1.text;
 if edit1.text='' then begin
                        MessageDlg(TranslateText('Название группы не определено !'),mtError,[mbOk],0);
                        ModalResult:=MrNone;
                       end;
end;

procedure TOperTypeForm.FormCreate(Sender: TObject);
begin
inherited;
 GId:=-1;
end;

procedure TOperTypeForm.ComboEdit1ButtonClick(Sender: TObject);
begin
  XMLChoose('opergrpref',GId,ComboEdit1);
end;

procedure TOperTypeForm.SpeedButton1Click(Sender: TObject);
begin
 GId:=-1;
 ComboEdit1.text:='';
end;

end.
