unit Passw;
{ Скомпонован и дописан 13.10.2004
  Предоставляет две функции типа Boolean:
  - IsPasswordValid проверяет является ли аргумент p_Password валидным паролем
    типа p_Type с параметрами p_Options.
  - TestPassword высвечивает окошко для ввода пароля и проверяет его на валидность
    в соответствии с типом p_Type и параметрами p_Options

  ВНИМАНИЕ РАЗРАБОТЧИКАМ!!!
  При появлении нового типа пароля поступить нужно следующим образом:
  1. Добавить в тип TOilPasswordType константу, которая соответствует новому типу
  2. Добавить в функцию IsPasswordValid часть, которая проверяет новый тип пароля.
     Если эта часть занимает много строк, вынести в отдельную функцию, которую не
     вписывать в интерфейсную часть.
  3. В функцию TestPassword изменений вносить не нужно.

  Заранее спасибо за следование этим правилам.
  (Ю.Должиков)
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
// Функция проверяет пароль на валидность
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
      if not result then showmessage(TranslateText('Неверный пароль!'));
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
