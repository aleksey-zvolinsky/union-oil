unit PolisRange;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ActnList, uCommonForm,uOilQuery,Ora, uOilStoredProc;

type
  TPolisRangeForm = class(TCommonForm)
    edtSer: TEdit;
    Label1: TLabel;
    edtFrom: TEdit;
    Label2: TLabel;
    edtTo: TEdit;
    Label3: TLabel;
    gbx: TGroupBox;
    Panel1: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    ActionList: TActionList;
    actEsc: TAction;
    actEnter: TAction;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure actEscExecute(Sender: TObject);
    procedure actEnterExecute(Sender: TObject);
  private
  public
    RangeCount : integer;
  end;

var
  PolisRangeForm: TPolisRangeForm;

implementation

{$R *.DFM}

procedure TPolisRangeForm.FormCreate(Sender: TObject);
begin
  inherited;
  SetWindowLong(edtFrom.Handle, GWL_STYLE, GetWindowLong(edtFrom.Handle, GWL_STYLE) or ES_NUMBER);
  SetWindowLong(edtTo.Handle, GWL_STYLE, GetWindowLong(edtTo.Handle, GWL_STYLE) or ES_NUMBER);
  SetWindowLong(edtSer.Handle, GWL_STYLE, GetWindowLong(edtSer.Handle, GWL_STYLE) or ES_UPPERCASE);
  RangeCount := 0;
end;

procedure TPolisRangeForm.btnOkClick(Sender: TObject);
begin
  if Trim(edtSer.Text) = ''
    then raise Exception.Create(TranslateText('Не указана серия'));

  if (Trim(edtFrom.Text) = '') or (Trim(edtTo.Text) = '')
    then raise Exception.Create(TranslateText('Не верный диапазон'));

  RangeCount := StrToInt(Trim(edtTo.Text)) - StrToInt(Trim(edtFrom.Text));
  if RangeCount < 0
    then raise Exception.Create(TranslateText('Не верный диапазон'));

  if MessageDlg(TranslateText('Будет добавлено ')+IntToStr(RangeCount+1)+
    TranslateText(' позиций. Продолжить? '),mtConfirmation,[mbYes,mbNo],0) = mrYes
    then  ModalResult := mrOk;
end;

procedure TPolisRangeForm.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TPolisRangeForm.actEscExecute(Sender: TObject);
begin
  Close;
end;

procedure TPolisRangeForm.actEnterExecute(Sender: TObject);
begin
  btnOk.Click;
end;

end.
