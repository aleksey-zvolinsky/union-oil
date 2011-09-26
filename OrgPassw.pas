unit OrgPassw;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Main,uOilQuery,Ora, uOilStoredProc;

type
  TOrgPassword = class(TCommonForm)
    Image1: TImage;
    Label1: TLabel;
    Edit1: TEdit;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Query1: TOilQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetKeyString(title:string;var res:string):Boolean;
function TestOrgPassword:Boolean;
function GetKey(CurrDate:TDateTime;inst:integer):string;

var
  OrgPassword: TOrgPassword;

implementation

{$R *.DFM}

function GetKey(CurrDate:TDateTime;inst:integer):string;
  const days :array[1..7] of string =
        ('Monday', 'Tuesday', 'Wednesday', 'Thursday',
         'Friday', 'Saturday', 'Sunday');
  var dd, mon, year : word;
      temp, str_dd : integer;
      Res : string;
begin
  DecodeDate(CurrDate, Year, mon, dd);
  str_dd := DayOfWeek(CurrDate);
  Temp := ((inst*101) mod (dd+mon))*99999+str_dd*9999+((dd+mon)*(str_dd+inst))*999*inst+(dd-mon-inst)*99-dd-mon-inst;
  Res := IntToStr(Temp)+days[str_dd][inst*dd mod 6 + 1];
  insert(days[str_dd][ABS(dd+mon-inst)*str_dd mod 6 + 1],Res,(str_dd*str_dd+inst+dd) mod 8 + 1);
  insert(days[str_dd][(inst+mon) mod 6 + 1],Res,(dd*mon+inst+str_dd) mod 8 + 1);
  while Pos('-',Res)<>0 do delete(Res,Pos('-',Res),1);
  Result := Res;
end;

procedure TOrgPassword.BitBtn1Click(Sender: TObject);
begin
 case Edit1.Tag of
   1: Begin
       Query1.Close;
       Query1.SQL.Clear;
       Query1.SQL.Add('select sysdate from dual');
       Query1.Open;
       if Edit1.Text <> GetKey(Query1.FieldByName('sysdate').AsDateTime,INST)
          then MessageDlg(TranslateText('Неверный пароль !'),mtWarning,[mbOK],0)
          else ModalResult := mrOk;
      End;
   2: Begin
       Query1.Close;
       Query1.SQL.Clear;
       Query1.SQL.Add('select password from adm_users where login = '''+'admin'+'''');
       Query1.Open;
       Query1.FetchAll;
       if Edit1.Text <> Query1.FieldByName('password').AsString
          then MessageDlg(TranslateText('Неверный пароль !'),mtWarning,[mbOK],0)
          else ModalResult := mrOk;
      End;
   3: ModalResult:=mrOk;
   End;
end;

procedure TOrgPassword.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

function GetKeyString(title:string;var res:string):Boolean;
var F: TOrgPassword;
begin
     Application.CreateForm(TOrgPassword,F);
     F.Caption:=title;
     F.Label1.Caption:=title;
     if F.ShowModal=mrOk then begin
        res:=F.Edit1.Text;
        result:=TRUE;
     end else result:=FALSE;
     F.Free;
end;

function TestOrgPassword:Boolean;
var F: TOrgPassword;
begin
     Application.CreateForm(TOrgPassword,F);
     F.Edit1.Tag := 1; // Признак, что требуется пароль для организаций
     F.ShowModal;
     if F.ModalResult = mrOk then result:=TRUE
                             else result:=FALSE;
     F.Free;
end;

end.
