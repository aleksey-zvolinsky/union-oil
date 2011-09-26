unit RaschTypeRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Placemnt,
  Menus,uOilQuery,Ora, uOilStoredProc;

type
  TRaschTypeRefForm = class(TBaseForm)
    edName: TEdit;
    Label1: TLabel;
    sbClearName: TSpeedButton;
    qID: TFloatField;
    qNAME: TStringField;
    SP: TOilStoredProc;
    procedure FormShow(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure sbClearNameClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject); Override;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RaschTypeRefForm: TRaschTypeRefForm;

implementation

Uses OilStd, Main ;

{$R *.DFM}

procedure TRaschTypeRefForm.FormShow(Sender: TObject);
begin
  bbClearClick(Nil);
  edName.SetFocus;
  q.Open;
end;

procedure TRaschTypeRefForm.bbClearClick(Sender: TObject);
begin
  sbClearNameClick(Nil);
end;

procedure TRaschTypeRefForm.sbClearNameClick(Sender: TObject);
begin
  edName.Clear;
end;

procedure TRaschTypeRefForm.bbSearchClick(Sender: TObject);
begin
  Try
    With q Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from V_OIL_RASCH_TYPE');
      If edName.Text <> '' Then
        SQL.Add('Where Upper(name) like ''%'+ANSIUpperCase(edName.Text)+'%''');
      SQL.Add('order by NAME');
      Open;
    End;
  Except On E:Exception Do
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
  End;
end;

procedure TRaschTypeRefForm.sbAddClick(Sender: TObject);
Var
  NewString, Res: string;
  ClickedOK: Boolean;
begin
  Try
    Begin
      NewString := '';
      ClickedOK := InputQuery(TranslateText('Создание'), TranslateText('Тип расчетов'), NewString);
      If ClickedOK Then
      With SP Do
      Begin
        StoredProcName := 'OIL2.GET_RASCH_TYPE_SEQ';
        Prepare;
        ExecProc;
        Res:=ParamByName('Result').AsString;

        StoredProcName := 'OIL.INSORUPDOIL_RASCH_TYPE';
        Prepare;
        ParamByName('ID#').AsInteger   := StrToInt(Res);
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

procedure TRaschTypeRefForm.sbDelClick(Sender: TObject);
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
      StoredProcName := 'OIL.INSORUPDOIL_RASCH_TYPE';
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

procedure TRaschTypeRefForm.sbEditClick(Sender: TObject);
Var
  NewString, Res: string;
  ClickedOK: Boolean;
begin
  Try
    If q.Active Then
    If q.RecordCount > 0 Then
    Begin
      NewString := qName.AsString;
      ClickedOK := InputQuery(TranslateText('Редактирование'), TranslateText('Тип расчетов'), NewString);
      If ClickedOK Then
      With SP Do
      Begin
        StoredProcName := 'OIL.INSORUPDOIL_RASCH_TYPE';
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

procedure TRaschTypeRefForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var
  I,J : Integer;
  S1,S2,S3 : String;
  R : TRect;
  Clr : TColor;
begin
  If edName.Text<>'' Then
  If Column.FieldName='NAME' Then
  Begin
    I := Pos(ANSIUpperCase(edName.Text),ANSIUpperCase(qName.AsString));
    If I>0 Then
    With DbGrid1.Canvas Do
    Begin
      J  := Length(edName.Text);
      S1 := Copy(qName.AsString,0,I-1);
      S2 := Copy(qName.AsString,I,J);
      S3 := Copy(qName.AsString,I+J,Length(qName.AsString)-I-J+1);
      R  := Rect;
      R.Left := R.Left+2;
      R.Top  := R.Top +2;
      Clr := Font.Color;
      TextOut(R.Left,R.Top,S1);
      I := TextWidth(S1);
      Font.Color := clRed;
      TextOut(R.Left+I,R.Top,S2);
      I := I+TextWidth(S2);
      Font.Color := Clr;
      TextOut(R.Left+I,R.Top,S3);
    End;
  End;
end;

procedure TRaschTypeRefForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
