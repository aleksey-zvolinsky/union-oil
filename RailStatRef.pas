unit RailStatRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, StdCtrls, Db, DBTables, Grids, DBGrids, Buttons, ExtCtrls, Placemnt,
  Menus, ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc;

type
  TRailStatRefForm = class(TBaseForm)
    Label1: TLabel;
    edName: TEdit;
    sbClearName: TSpeedButton;
    SP: TOilStoredProc;
    qID: TFloatField;
    qNAME: TStringField;
    qINST: TFloatField;
    procedure sbClearNameClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbAddClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject); Override;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RailStatRefForm: TRailStatRefForm;

implementation

Uses OilStd, Main, UDbFunc;

{$R *.DFM}

procedure TRailStatRefForm.sbClearNameClick(Sender: TObject);
begin
  edName.Clear;
end;

procedure TRailStatRefForm.bbClearClick(Sender: TObject);
begin
  sbClearNameClick(Nil);
end;

procedure TRailStatRefForm.FormShow(Sender: TObject);
begin
  bbClearClick(Nil);
  edName.SetFocus;
  q.Open;
end;

procedure TRailStatRefForm.bbSearchClick(Sender: TObject);
begin
  Try
    With q Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from V_OIL_RAIL_STAT');
      If edName.Text <> '' Then
        SQL.Add('Where Upper(name) like ''%'+ANSIUpperCase(edName.Text)+'%''');
      SQL.Add('order by NAME');
      Open;
    End;
  Except On E:Exception Do
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
  End;
end;

procedure TRailStatRefForm.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TRailStatRefForm.sbAddClick(Sender: TObject);
var
  NewString: string;
begin
  if InputQuery(TranslateText('Создание'), TranslateText('Ж.д. станция'), NewString) then
    DBSaver.SaveRecord('OIL_RAIL_STAT',
      ['INST',    INST,
       'STATE',   'Y',
       'NAME',    NewString]);
  bbSearch.Click;
end;

procedure TRailStatRefForm.sbDelClick(Sender: TObject);
Var
  Res : String;
begin
  If (not q.Active) or (q.RecordCount=0) Then exit;
  // добавил Urise 04.10.2000
  if udbfunc._RecordCount('oil_prihod',Format('rail_st=%s and rail_inst=%s and state=''Y''',[q['id'],q['inst']]))>0 then
    raise exception.create(TranslateText('Удаление невозможно, поскольку существуют приходы, ссылающиеся на эту станцию'));
  // конец добавления

  if MessageDlg(TranslateText('Вы уверены что хотите удалить запись?'),mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    _ExecSqlOra(Format('update oil_rail_stat set state=''N'' where id=%s and inst=%s',[q['id'],q['inst']]));
    CommitSqlOra;
  end;
  bbSearch.Click;
end;

procedure TRailStatRefForm.sbEditClick(Sender: TObject);
Var
  NewString, Res: string;
  ClickedOK: Boolean;
begin
  NewString:=qName.AsString;
  if InputQuery(TranslateText('Создание'), TranslateText('Ж.д. станция'), NewString) then
    DBSaver.SaveRecord('OIL_RAIL_STAT',
      ['ID',      qId.AsInteger,
       'INST',    INST,
       'STATE',   'Y',
       'NAME',    NewString]);
  bbSearch.Click;
end;

procedure TRailStatRefForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TRailStatRefForm.edNameChange(Sender: TObject);
begin
  inherited;
  bbSearch.Click;
end;

end.
