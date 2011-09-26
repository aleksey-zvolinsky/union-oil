unit OvExpTypeRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, StdCtrls, Menus, Db, DBTables, Grids, DBGridEh, Buttons,
  ExtCtrls,uOilQuery,Ora, uOilStoredProc, ActnList, MemDS, DBAccess,
  RXCtrls;

type
  TOvExpTypeRefForm = class(TBaseForm)
    Label1: TLabel;
    edName: TEdit;
    qID: TFloatField;
    qNAME: TStringField;
    procedure bbSearchClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OvExpTypeRefForm: TOvExpTypeRefForm;

implementation

{$R *.DFM}

procedure TOvExpTypeRefForm.bbSearchClick(Sender: TObject);
begin
  Try
    With q Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from V_OIL_OV_EXP_TYPE');
      If edName.Text <> '' Then
        SQL.Add('Where Upper(name) like ''%'+ANSIUpperCase(edName.Text)+'%''');
      SQL.Add('order by NAME');
      Open;
    End;
  Except On E:Exception Do
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
  End;
end;

procedure TOvExpTypeRefForm.bbClearClick(Sender: TObject);
begin
  edName.Clear;
end;

procedure TOvExpTypeRefForm.FormShow(Sender: TObject);
begin
  bbClearClick(Nil);
  edName.SetFocus;
  bbSearchClick(nil);
end;

end.
