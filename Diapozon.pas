unit Diapozon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, CurrEdit, uCommonForm,uOilQuery,Ora, uOilStoredProc;

type
  TDiapForm = class(TCommonForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Panel2: TPanel;
    Label4: TLabel;
    CE: TCurrencyEdit;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure CurrencyEdit1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DiapForm: TDiapForm;

implementation

{$R *.DFM}

procedure TDiapForm.BitBtn1Click(Sender: TObject);
begin
 if (edit3.text='') then Raise Exception.Create(TranslateText('Серия талонов не определена !'));
 if (edit1.text='') or (Edit2.text='') then Raise Exception.Create(TranslateText('Не полностью определены параметры диапозона !'));
 if strtoint(edit1.text)>strtoint(Edit2.text) then Raise Exception.Create(TranslateText('Не правильно определен диапозон !'));

 ModalResult:=MrOk;
end;

procedure TDiapForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8]) then key:=#0;

end;

procedure TDiapForm.FormCreate(Sender: TObject);
begin
 LoadKeyBoardLayout('00000419',KLF_ACTIVATE);
end;

procedure TDiapForm.CurrencyEdit1Change(Sender: TObject);
begin
if CurrencyEdit2.Value <> 0 then
  begin
  CurrencyEdit3.Value := CurrencyEdit1.Value/CurrencyEdit2.Value;
  end;
if (Edit1.Text <> '')and(CurrencyEdit3.Value <> 0) then Edit2.Text := IntToStr(Round(StrToFloat(Edit1.Text) + StrToFloat(CurrencyEdit3.Text)) -1 );
end;

procedure TDiapForm.Edit1Change(Sender: TObject);
begin
if (Edit1.Text <> '')and(CurrencyEdit3.Value <> 0) then Edit2.Text := IntToStr(Round(StrToFloat(Edit1.Text) + StrToFloat(CurrencyEdit3.Text)));
end;

end.
