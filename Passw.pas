unit Passw;
{ ����������� � ������� 13.10.2004
  ������������� ��� ������� ���� Boolean:
  - IsPasswordValid ��������� �������� �� �������� p_Password �������� �������
    ���� p_Type � ����������� p_Options.
  - TestPassword ����������� ������ ��� ����� ������ � ��������� ��� �� ����������
    � ������������ � ����� p_Type � ����������� p_Options

  �������� �������������!!!
  ��� ��������� ������ ���� ������ ��������� ����� ��������� �������:
  1. �������� � ��� TOilPasswordType ���������, ������� ������������� ������ ����
  2. �������� � ������� IsPasswordValid �����, ������� ��������� ����� ��� ������.
     ���� ��� ����� �������� ����� �����, ������� � ��������� �������, ������� ��
     ��������� � ������������ �����.
  3. � ������� TestPassword ��������� ������� �� �����.

  ������� ������� �� ���������� ���� ��������.
  (�.��������)
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, uCrypt, uCommonForm,uOilQuery,Ora, uOilStoredProc;

type

  TPasswForm = class(TCommonForm)
    Panel1: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Panel2: TPanel;
    Image1: TImage;
    edit1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PasswForm: TPasswForm;

function IsPasswordValid(
  p_Password: string;
  p_Type: TOilPasswordType;
  p_Options: string=''): Boolean;

function TestPassword(
  p_Type: TOilPasswordType;
  p_Options: string=''): Boolean;

implementation

{$R *.DFM}

uses Main,ExFunc,uDbFunc;

//==============================================================================
// ������� ��������� ������ �� ����������
//------------------------------------------------------------------------------
function IsPasswordValid(
  p_Password: string;
  p_Type: TOilPasswordType;
  p_Options: string=''): Boolean;
var
  s: string;
  Last_run_date: TDateTime;
begin
  Last_run_date := StrToDateTime(ReadOilVar('Last_run_date'));
  case p_Type of
    pwtOrg,pwtWagon: result:=p_Password=GetPassword(p_Type,[Trunc(Last_run_date), INST]);
    pwtPart:
      result:=p_Password=GetSqlValue(
        'select password from adm_users where login = ''admin''');
    pwtTestLaunch :
      begin
        s :=GetPassword(
              pwtTestLaunch,
              [Main.CheckupStatus.ErrBlock, Main.INST, Last_run_date, p_Options]
            );
        Result := s =p_password;
      end;
  end;
end;
//==============================================================================
function TestPassword(
  p_Type: TOilPasswordType;
  p_Options: string=''): Boolean;
var
  F: TPasswForm;
begin
  Application.CreateForm(TPasswForm,F);
  result := false;
  repeat
    F.ShowModal;
    if F.ModalResult=mrOk then begin
      result:=IsPasswordValid(F.edit1.Text,p_Type,p_Options);
      if not result then showmessage(TranslateText('�������� ������!'));
    end;
  until result or (F.ModalResult=mrCancel);
  F.Free;
end;
//==============================================================================
procedure TPasswForm.FormShow(Sender: TObject);
begin
  Edit1.SetFocus;
end;
//==============================================================================
procedure TPasswForm.edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then btnOk.Click;
end;

end.
