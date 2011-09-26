unit DimRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Menus,
  ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc;

type
  TDimRefForm = class(TBaseForm)
    qID: TFloatField;
    edName: TEdit;
    Label1: TLabel;
    sbClearName: TSpeedButton;
    SP: TOilStoredProc;
    qNAME: TStringField;
    qISSHTUKI: TStringField;
    qISFASOV: TStringField;
    procedure bbSearchClick(Sender: TObject);
    procedure sbClearNameClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject); Override;
    procedure sbAddClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

Uses Main, OilStd, UDbFunc;

{$R *.DFM}

procedure TDimRefForm.bbSearchClick(Sender: TObject);
begin
  Try
    With q Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from V_OIL_DIM');
      If edName.Text <> '' Then
        SQL.Add('Where state=''Y'' and Upper(name) like ''%'+ANSIUpperCase(edName.Text)+'%''');
      SQL.Add('order by NAME');
      Open;
    End;
  Except On E:Exception Do
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
  End;
end;

procedure TDimRefForm.sbClearNameClick(Sender: TObject);
begin
  edName.Clear;
end;

procedure TDimRefForm.FormShow(Sender: TObject);
begin
  bbClearClick(Nil);
  edName.SetFocus;
  q.Open;
end;

procedure TDimRefForm.bbClearClick(Sender: TObject);
begin
  sbClearNameClick(Nil);
end;

procedure TDimRefForm.sbEditClick(Sender: TObject);
Var
  NewString, Res: string;
  ClickedOK: Boolean;
begin
  Try
    If q.Active Then
    If q.RecordCount > 0 Then
    Begin
      NewString := qName.AsString;
      ClickedOK := InputQuery(TranslateText('Редактирование'), TranslateText('Единица измерения'), NewString);
      If ClickedOK Then
      With SP Do
      Begin
        StoredProcName := 'OIL.INSORUPDOIL_DIMENSION';
        Prepare;
        ParamByName('ID#').AsInteger   := qId.AsInteger;
        ParamByName('STATE#').AsString := 'Y';
        ParamByName('NAME#').AsString  := NewString;
        ExecProc;
        Res:=ParamByName('Result').AsString;
        If Length(Res)>0 Then
          If Res[1]<>'0' Then
            Raise Exception.Create(SubStr(Res,2));
        q.Close;
        q.Open;
      End;
    End;
  Except On E:Exception Do
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
  End;
end;

procedure TDimRefForm.sbAddClick(Sender: TObject);
Var
  NewString, Res: string;
  ClickedOK: Boolean;
  vId: integer;
begin
  Try
    Begin
      NewString := '';
      ClickedOK := InputQuery(TranslateText('Создание'), TranslateText('Единица измерения'), NewString);
      If ClickedOK Then
      With SP Do
      Begin
        vId:=GetSeqNextVal('S_OIL_DIM');

        StoredProcName := 'OIL.INSORUPDOIL_DIMENSION';
        Prepare;
        ParamByName('ID#').AsInteger   := vId;
        ParamByName('STATE#').AsString := 'Y';
        ParamByName('NAME#').AsString  := NewString;
        ExecProc;
        Res:=ParamByName('Result').AsString;
        If Length(Res)>0 Then
          If Res[1]<>'0' Then
            Raise Exception.Create(SubStr(Res,2));
        q.Close;
        q.Open;
      End;
    End;
  Except On E:Exception Do
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
  End;
end;

procedure TDimRefForm.sbDelClick(Sender: TObject);
Var
  Res : String;
begin
  If MessageDlg(TranslateText('Вы уверены что хотите удалить запись?'),
    mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  Try
    With SP Do
    Begin
      StoredProcName := 'OIL.INSORUPDOIL_DIMENSION';
      Prepare;
      ParamByName('ID#').AsInteger   := qId.AsInteger;
      ParamByName('STATE#').AsString := 'N';
      ParamByName('NAME#').AsString  := qName.AsString;
      ExecProc;
      Res:=ParamByName('Result').AsString;
      If Length(Res)>0 Then
        If Res[1]<>'0' Then
          Raise Exception.Create(SubStr(Res,2));
      q.Close;
      q.Open;
    End;
  Except On E:Exception Do
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
  End;
end;

procedure TDimRefForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
