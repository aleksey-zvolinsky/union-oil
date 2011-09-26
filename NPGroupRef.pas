unit NPGroupRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Menus,
  ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc;

type
  TNPGroupRefForm = class(TBaseForm)
    SP: TOilStoredProc;
    Label1: TLabel;
    edName: TEdit;
    qID: TFloatField;
    qNAME: TStringField;
    qPETROL_ID: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject); Override;
    procedure sbDelClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NPGroupRefForm: TNPGroupRefForm;

implementation

uses Main, OilStd, UDbFunc;

{$R *.DFM}

procedure TNPGroupRefForm.FormShow(Sender: TObject);
begin
  bbClearClick(Nil);
  edName.SetFocus;
  q.Open;
end;

procedure TNPGroupRefForm.bbClearClick(Sender: TObject);
begin
  edName.Clear;
end;

procedure TNPGroupRefForm.sbAddClick(Sender: TObject);
Var
  NewString, Res: string;
  ClickedOK: Boolean;
  vId: integer;
begin
  Try
    Begin
      NewString := '';
      ClickedOK := InputQuery(TranslateText('Создание'), TranslateText('Группа НП'), NewString);
      If ClickedOK Then
      With SP Do
      Begin
        vId:=GetSeqNextVal('S_OIL_NP_GROUP');

        StoredProcName := 'OIL.INSORUPDOIL_NP_GROUP';
        Prepare;
        ParamByName('ID#').AsInteger   := vId;
        ParamByName('STATE#').AsString := 'Y';
        ParamByName('NAME#').AsString  := NewString;
        ExecProc;
        Res:=ParamByName('Result').AsString;
        If Length(Res)>0 Then
          If Res[1]<>'0' Then
            Raise Exception.Create(SubStr(Res,2));
        CommitSQL;
        q.Close;
        q.Open;
      End;
    End;
  Except On E:Exception Do
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
  End;
end;

procedure TNPGroupRefForm.sbEditClick(Sender: TObject);
Var
  NewString, Res: string;
  ClickedOK: Boolean;
begin
  Try
    If q.Active Then
    If q.RecordCount > 0 Then
    Begin
      NewString := qName.AsString;
      ClickedOK := InputQuery(TranslateText('Редактирование'), TranslateText('Группа НП'), NewString);
      If ClickedOK Then
      With SP Do
      Begin
        StoredProcName := 'OIL.INSORUPDOIL_NP_GROUP';
        Prepare;
        ParamByName('ID#').AsInteger   := qId.AsInteger;
        ParamByName('STATE#').AsString := 'Y';
        ParamByName('NAME#').AsString  := NewString;
        ExecProc;
        Res:=ParamByName('Result').AsString;
        If Length(Res)>0 Then
          If Res[1]<>'0' Then
            Raise Exception.Create(SubStr(Res,2));
        CommitSQL;
        q.Close;
        q.Open;
      End;
    End;
  Except On E:Exception Do
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
  End;
end;

procedure TNPGroupRefForm.sbDelClick(Sender: TObject);
Var
  Res : String;
begin
  If q.Active Then
  If q.RecordCount > 0 Then
  If MessageDlg(TranslateText('Вы уверены что хотите удалить запись?'),
    mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  Try
    With SP Do
    Begin
      StoredProcName := 'OIL.INSORUPDOIL_NP_GROUP';
      Prepare;
      ParamByName('ID#').AsInteger   := qId.AsInteger;
      ParamByName('STATE#').AsString := 'N';
      ParamByName('NAME#').AsString  := qName.AsString;
      ExecProc;
      Res:=ParamByName('Result').AsString;
      If Length(Res)>0 Then
        If Res[1]<>'0' Then
          Raise Exception.Create(SubStr(Res,2));
      CommitSQL;
      q.Close;
      q.Open;
    End;
  Except On E:Exception Do
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
  End;
end;

procedure TNPGroupRefForm.bbSearchClick(Sender: TObject);
begin
  Try
    With q Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from V_OIL_NP_GROUP');
      If edName.Text <> '' Then
        SQL.Add('Where Upper(name) like ''%'+ANSIUpperCase(edName.Text)+'%''');
      SQL.Add('order by NAME');
      Open;
    End;
  Except On E:Exception Do
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
  End;
end;

procedure TNPGroupRefForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
