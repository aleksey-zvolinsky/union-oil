unit GoalPartTypeRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, StdCtrls, Menus, Db, DBTables, Grids, DBGrids, Buttons, ExtCtrls,
  ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc;

type
  TGoalPartForm = class(TBaseForm)
    Label1: TLabel;
    edName: TEdit;
    qID: TFloatField;
    qNAME: TStringField;
    procedure bbClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GoalPartForm: TGoalPartForm;

implementation

{$R *.DFM}

procedure TGoalPartForm.bbClearClick(Sender: TObject);
begin
  edName.Clear;
end;

procedure TGoalPartForm.FormShow(Sender: TObject);
begin
  bbClearClick(Nil);
  edName.SetFocus;
  q.Open;
end;

procedure TGoalPartForm.bbSearchClick(Sender: TObject);
begin
  Try
    With q Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from V_OIL_GOAL_PART_TYPE');
      If edName.Text <> '' Then
        SQL.Add('Where Upper(name) like ''%'+ANSIUpperCase(edName.Text)+'%''');
      SQL.Add('order by NAME');
      Open;
    End;
  Except On E:Exception Do
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
  End;
end;

procedure TGoalPartForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
