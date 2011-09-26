unit AzsFaultRef;

interface

uses uCommonForm,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, StdCtrls, Mask, ToolEdit, ExtCtrls, Menus, Db, DBTables, Grids,
  DBGridEh, Buttons, CurrEdit, ActnList, RXCtrls, uOilQuery, Ora, uOilStoredProc,
  MemDS, DBAccess;

type
  TAzsFaultRefForm = class(TBaseForm)
    Label3: TLabel;
    sbClearDate: TSpeedButton;
    xdeDate: TDateEdit;
    Label2: TLabel;
    sbClearAZS: TSpeedButton;
    cmeAZS: TComboEdit;
    Label1: TLabel;
    sbClearID: TSpeedButton;
    edID: TRxCalcEdit;
    qID: TFloatField;
    qINST: TFloatField;
    qSTATE: TStringField;
    qAZS_ID: TFloatField;
    qREP_ID: TFloatField;
    qREP_INST: TFloatField;
    qBEGIN_DATE: TDateTimeField;
    qEND_DATE: TDateTimeField;
    qDATE_MOD: TDateTimeField;
    qAZS_NAME: TStringField;
    Label4: TLabel;
    sbClearFilial: TSpeedButton;
    cmeFilial: TComboEdit;
    qFILIALNAME: TStringField;
    qCOMMENT_: TStringField;
    qFILIALID: TFloatField;
    procedure bbSearchClick(Sender: TObject);
    procedure sbClearIDClick(Sender: TObject);
    procedure sbClearDateClick(Sender: TObject);
    procedure sbClearAZSClick(Sender: TObject);
    procedure cmeAZSButtonClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure cmeFilialButtonClick(Sender: TObject);
    procedure sbClearFilialClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function AllDrIsPresent(Date_: TDateTime; var mess: string; var LeastDate: TDateTime): boolean;

var
  AzsFaultRefForm: TAzsFaultRefForm;

implementation

uses Main, ChooseOrg, AzsFault, uDBFunc;
{$R *.DFM}

function AllDrIsPresent(Date_: TDateTime; var mess: string; var LeastDate: TDateTime): boolean;
var
  qq: TOilQuery;
  Impudent_AZS: string;
Begin
  Result := True;
  Mess := '';
  qq := TOilQuery.Create(nil);
  try
    qq.SQL.Text := 'select value from oil_var where name=''IMPUDENT_AZS''';
    qq.Open;
    Impudent_AZS := '-1';
    if not qq.IsEmpty then
      if qq.FieldByName('value').AsString <> '#' then
        Impudent_AZS := GetVal(qq.FieldByName('value').AsString);

    qq.Close;
    qq.SQL.Text := 'select O.id, rpad(O.name,30) as name, Z.D from oil_org O,' +
      ' (select DR.azs_id, max(DR.end_date) as D from oil_dr_summary DR , oil_org O ' +
      ' where DR.state=''Y'' and not (DR.Rep_Id is null and DR.azs_id-1000000 in (' + Impudent_AZS + ')) and ' +
      ' O.id = DR.Azs_Id and O.inst = DR.Azs_Id and O.state = ''Y'' and ' +
      ' O.org_type=8 and O.par = (select value from oil_var where name=''ID'') ' +
      ' group by DR.azs_id) Z' +
      ' where O.id=O.inst and O.id=Z.azs_id and trunc(Z.D)<to_date(''' + FormatDateTime('dd.mm.yyyy', Date_) + ''',''DD.MM.YYYY'')';
    qq.Open;
    if not qq.IsEmpty then
    Begin
      Result := False;
      Mess := TranslateText('Не введена вчерашняя реализация по следующим АЗС:') + #13#10 +
        TranslateText('(Название, дата последнего см. отчета)') + #13#10;
      while not qq.Eof do
      Begin
        Mess := Mess + qq.FieldByName('name').AsString + '     ' + qq.FieldByName('D').AsString + #13#10;
        qq.Next;
      End;
    End;
    qq.Close;
    qq.SQL.Text := 'select DR.azs_id, max(DR.end_date) as D from oil_dr_summary DR , oil_org O ' +
      'where DR.state=''Y'' and not (DR.Rep_Id is null and DR.azs_id-1000000 in (' + Impudent_AZS + ')) and ' +
      ' O.id=DR.Azs_Id and O.inst=DR.Azs_Id and O.state=''Y'' and ' +
      'O.org_type=8 and O.par = (select value from oil_var where name=''ID'')' +
      'group by DR.azs_id order by 2';
    qq.Open;
    LeastDate := Trunc(qq.FieldByName('D').AsDateTime);
  finally
    qq.Free;
  end;
End;

procedure TAzsFaultRefForm.bbSearchClick(Sender: TObject);
begin
  Try
    With q Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('select * from v_oil_dr_summary where 1=1');
      if edID.Text <> '' then
        SQL.Add(' and id=' + edID.Text);
      If xdeDate.Text[1] <> ' ' Then
        SQL.Add('And To_Date(''' + xdeDate.Text + ''',''DD.MM.YYYY'') between to_date(Begin_Date) and to_date(End_Date)');
      if cmeAZS.Text <> '' then
        SQL.Add(' and azs_id=' + IntToStr(cmeAZS.Tag));
      if cmeFilial.Text <> '' then
        SQL.Add(' and FilialID=' + IntToStr(cmeFilial.Tag));
      Open;
    End;
  Except On E: Exception Do
      MessageDlg(TranslateText('Ошибка : ') + E.message, mtError, [mbOk], 0);
  End;
end;

procedure TAzsFaultRefForm.sbClearIDClick(Sender: TObject);
begin
  edID.Clear;
end;

procedure TAzsFaultRefForm.sbClearDateClick(Sender: TObject);
begin
  xdeDate.Clear;
end;

procedure TAzsFaultRefForm.sbClearAZSClick(Sender: TObject);
begin
  cmeAZS.Clear;
  cmeAZS.Tag := 0;
end;

procedure TAzsFaultRefForm.cmeAZSButtonClick(Sender: TObject);
var
  vId, vInst: Integer;
  vName: String;
begin
  if ChooseOrg.CaptureOrg(2, MAIN_ID, INST, 'nnn', vId, vInst, vName) then
  begin
    cmeAZS.Tag := vId;
    cmeAZS.Text := vName;
  end;
end;

procedure TAzsFaultRefForm.sbAddClick(Sender: TObject);
Var
  AzsFaultForm: TAzsFaultForm;
  BM: TBookMark;
begin
  BM := q.GetBookmark;
  Application.CreateForm(TAzsFaultForm, AzsFaultForm);
  AzsFaultForm.xdeBegin.Date := date;
  AzsFaultForm.xdeEnd.Date := date;
  AzsFaultForm.ShowModal;
  If AzsFaultForm.ModalResult = mrOk Then
  Begin
    bbClearClick(Nil);
    bbSearchClick(Nil);
  End;
  AzsFaultForm.Free;
  try
  q.GotoBookmark(BM)except
  end;
  q.FreeBookmark(BM);
end;

procedure TAzsFaultRefForm.bbClearClick(Sender: TObject);
begin
  sbClearIDClick(nil);
  sbClearDateClick(nil);
  sbClearAZSClick(nil);
end;

procedure TAzsFaultRefForm.sbEditClick(Sender: TObject);
var
  AzsFaultForm: TAzsFaultForm;
  BM: TBookMark;
begin
  If q.Active Then
    If q.RecordCount > 0 Then
    Begin
      BM := q.GetBookmark;
      Application.CreateForm(TAzsFaultForm, AzsFaultForm);
      AzsFaultForm.lblAzs.Tag := qID.AsInteger;
      AzsFaultForm.cmeAZS.Tag := qAzs_id.AsInteger;
      AzsFaultForm.cmeAZS.Enabled := False;
      AzsFaultForm.cmeAZS.Text := qAZS_NAME.AsString;
      AzsFaultForm.xdeBegin.Date := qBegin_Date.AsDateTime;
      AzsFaultForm.xdeEnd.Date := qEnd_Date.AsDateTime;
      AzsFaultForm.edtComment.Text := qComment_.AsString;
      AzsFaultForm.bbOK.Enabled := Pos(',' + IntToStr(qINST.AsInteger) + ',', INST_LIST) > 0;
      AzsFaultForm.ShowModal;
      If AzsFaultForm.ModalResult = mrOk Then
        bbSearchClick(Nil);
      AzsFaultForm.Free;
      try
      q.GotoBookmark(BM)except
      end;
      q.FreeBookmark(BM);
    End;
end;

procedure TAzsFaultRefForm.cmeFilialButtonClick(Sender: TObject);
var
  vId, vInst: Integer;
  vName: String;
begin
  if ChooseOrg.CaptureOrg(1, MAIN_ID, INST, 'yyyyynnn', vId, vInst, vName) then
  begin
    cmeFilial.Tag := vId;
    cmeFilial.Text := vName;
  end;
end;

procedure TAzsFaultRefForm.sbClearFilialClick(Sender: TObject);
begin
  cmeFilial.Clear;
  cmeFilial.Tag := 0;
end;

procedure TAzsFaultRefForm.FormShow(Sender: TObject);
begin
  bbClearClick(nil);
  bbSearchClick(nil);
end;

procedure TAzsFaultRefForm.FormCreate(Sender: TObject);
begin
  inherited;
  pAdd.Visible := true;
  pEdit.Visible := true;
end;

end.

