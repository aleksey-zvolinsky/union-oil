unit TransSubPart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ToolEdit, Mask, Db, DBTables, DBCtrls, DBAccess,
  Grids, DBGridEh, StrUtils, RxMemDS, uCommonForm, uOilQuery, Ora, MemDS,
  uOilStoredProc, DBGridEhGrouping, GridsEh;

type
  TTransSubPartForm = class(TCommonForm)
    Panel1: TPanel;
    Panel3: TPanel;
    bbApply: TBitBtn;
    bbClose: TBitBtn;
    Label1: TLabel;
    SrcLabel: TLabel;
    DstLabel: TLabel;
    IncludeBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    qUpd: TOilQuery;
    GroupBox1: TGroupBox;
    lPart: TLabel;
    Label8: TLabel;
    lnpg1: TLabel;
    Label9: TLabel;
    edPart: TComboEdit;
    edDog: TEdit;
    edNPG_Type1: TEdit;
    edDogDate: TDateEdit;
    GroupBox2: TGroupBox;
    lPart2: TLabel;
    Label28: TLabel;
    lnpg2: TLabel;
    Label30: TLabel;
    edPart2: TComboEdit;
    edDog2: TEdit;
    edNPG_Type2: TEdit;
    edDogDate2: TDateEdit;
    dsSubPartFrom: TOraDataSource;
    mdSubPartFrom: TRxMemoryData;
    DBGridEh1: TDBGridEh;
    qMain: TOilQuery;
    dsMain: TOraDataSource;
    qMainID: TFloatField;
    qMainINST: TFloatField;
    qMainDATE_: TDateTimeField;
    qMainCOUNT_: TFloatField;
    qMainTTN_ID: TFloatField;
    qMainTTN_INST: TFloatField;
    qMainSUB_PART: TStringField;
    qMainS: TFloatField;
    dsSubPartTo: TOraDataSource;
    mdSubPartTo: TRxMemoryData;
    DBGridEh2: TDBGridEh;
    LblLeftName: TLabel;
    LblLeft: TLabel;
    qMainKharkov: TOilQuery;
    deDateRash: TDateEdit;
    lDate: TLabel;
    procedure edPartButtonClick(Sender: TObject);
    procedure edPart2ButtonClick(Sender: TObject);
    procedure bbApplyClick(Sender: TObject);
    procedure bbCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IncludeBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure RefreshSQLFrom();
    procedure RefreshSQLTo();
    procedure RefreshBtn();
    procedure SetGridSumm();
    procedure edPartKeyPress(Sender: TObject; var Key: Char);
    procedure deDateRashChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  TransSubPartForm: TTransSubPartForm;

implementation

uses PartRef, Main, OilStd, uExeSql;

{$R *.DFM}

//==============================================================================
procedure TTransSubPartForm.SetGridSumm();
var
  Cnt, S: Real;
  CurrRecord: integer;
begin
  // Процедура подсчета сумм по гридам
  // Стандартные суммы почему-то считаются с точностью до 4-х знаков
  // пришлось писать свое
  mdSubPartFrom.DisableControls;
  CurrRecord := mdSubPartFrom.RecNo;
  mdSubPartFrom.First;
  Cnt := 0;
  S := 0;
  while not mdSubPartFrom.eof do
  begin
    Cnt := Cnt + mdSubPartFrom.FieldByName('Count_').AsFloat;
    S := S + mdSubPartFrom.FieldByName('S').AsFloat;
    mdSubPartFrom.Next;
  end;
  DBGridEh1.Columns[2].Footers[0].Value := FloatToStr(Cnt);
  DBGridEh1.Columns[3].Footers[0].Value := FloatToStr(S);
  mdSubPartFrom.RecNo := CurrRecord;
  mdSubPartFrom.EnableControls;

  mdSubPartTo.DisableControls;
  CurrRecord := mdSubPartTo.RecNo;
  mdSubPartTo.First;
  Cnt := 0;
  S := 0;
  while not mdSubPartTo.eof do
  begin
    Cnt := Cnt + mdSubPartTo.FieldByName('Count_').AsFloat;
    S := S + mdSubPartTo.FieldByName('S').AsFloat;
    mdSubPartTo.Next;
  end;
  DBGridEh2.Columns[2].Footers[0].Value := FloatToStr(Cnt);
  if Cnt > StrToFloat(LblLeft.Caption) then
    DBGridEh2.Columns[2].Footers[0].Font.Color := clRed
  else
    DBGridEh2.Columns[2].Footers[0].Font.Color := clBlue;
  DBGridEh2.Columns[3].Footers[0].Value := FloatToStr(S);
  if S > StrToFloat(LblLeft.Caption) then
    DBGridEh2.Columns[3].Footers[0].Font.Color := clRed
  else
    DBGridEh2.Columns[3].Footers[0].Font.Color := clBlue;
  mdSubPartTo.RecNo := CurrRecord;
  mdSubPartTo.EnableControls;
end;
//==============================================================================
procedure TTransSubPartForm.edPartButtonClick(Sender: TObject);
var
  F: TPartRefForm;
begin
  Application.CreateForm(TPartRefForm, F);
  F.ShowModal;
  if F.ModalResult = mrOk then
  begin
    edPart.Text      := F.qId.AsString;
    edPart.Tag       := F.qId.AsInteger;
    lPart.Tag        := F.qInst.AsInteger;

    edDog.Text       := F.qDog.AsString;
    edDogDate.Date   := F.qDog_Date.AsDateTime;

    edNPG_Type1.Text := F.qNP_GRP_NAME.AsString;
    edNPG_Type1.Tag  := F.qNP_GRP.AsInteger;

    RefreshSQLFrom();
  end;
  F.Free;

  LblLeftName.Visible := edPart.Text <> '';
  LblLeft.Visible := LblLeftName.Visible;
  edPart2.Enabled := LblLeftName.Visible;
end;
//==============================================================================
procedure TTransSubPartForm.edPart2ButtonClick(Sender: TObject);
var
  F: TPartRefForm;
begin
  Application.CreateForm(TPartRefForm, F);
  F.ShowModal;
  if F.ModalResult = mrOk then
  begin
    edPart2.Text      := F.qId.AsString;
    edPart2.Tag       := F.qId.AsInteger;
    lPart2.Tag        := F.qInst.AsInteger;

    edDog2.Text       := F.qDog.AsString;
    edDogDate2.Date   := F.qDog_Date.AsDateTime;

    edNPG_Type2.Text  := F.qNP_GRP_NAME.AsString;
    edNPG_Type2.Tag   := F.qNP_GRP.AsInteger;

    LblLeft.Caption := FloatToStr(MainForm.PartRest(F.qId.AsInteger, F.qInst.AsInteger));
    LblLeftName.Visible := True;
    LblLeft.Visible := True;

    RefreshSQLFrom();
  end;
  F.Free;
end;
//==============================================================================
procedure TTransSubPartForm.bbApplyClick(Sender: TObject);
  //****************************************************************************
  function EndingPart(i: integer): string;
  begin
    case i mod 10 of
      1: Result := TranslateText('подпартию');
      2..4: Result := TranslateText('подпартии');
    else
      Result := TranslateText('подпартий');
    end;
    if i in [11, 12, 13, 14] then
      Result := TranslateText('подпартий');
    Result := ' ' + IntToStr(i) + ' ' + Result + ' ';
  end;
  //****************************************************************************
begin
  if edNPG_Type1.Tag <> edNPG_Type2.Tag then
  begin
    MessageDlg(TranslateText('Не одинаковые группы НП!'), mtError, [mbOk], 0);
    Exit;
  end;

  if Application.MessageBox(PChar(TranslateText('Перебросить') + EndingPart(mdSubPartTo.RecordCount) + '?'),
    PChar(TranslateText('Замена подпартий')), MB_YESNO + MB_DEFBUTTON2 + MB_ICONWARNING) = IDNO then
    Exit;

  mdSubPartTo.DisableControls;
  mdSubPartTo.First;
  StartSQL;
  try
    while not mdSubPartTo.eof do
    begin
      qUpd.Close;
      qUpd.Prepare;
      qUpd.ParamByName('p_part_id').AsInteger := edPart2.Tag;
      qUpd.ParamByName('p_part_inst').AsInteger := lPart2.Tag;
      qUpd.ParamByName('p_id').AsInteger := mdSubPartTo.FieldByName('id').AsInteger;
      qUpd.ParamByName('p_inst').AsInteger := mdSubPartTo.FieldByName('inst').AsInteger;
      qUpd.ExecSQL;
      // Перебросить подпартии и проверить остатки
      // Замена подпартий - в отпуске заменяется одна партия на другую
      if MainForm.PartRest(edPart2.Tag, lPart2.Tag) < 0 then
        raise Exception.Create(TranslateText('Операция приводит к отрицательным остаткам !'));
      mdSubPartTo.Next;
    end;
    mdSubPartTo.EmptyTable;
    CommitSQL;
  except on E: Exception do
    begin
      RollbackSQL;
      MessageDlg(TranslateText('Ошибка: ')+ E.Message, mtError, [mbOk], 0);
    end;
  end;
  mdSubPartTo.EnableControls;
  RefreshBtn();
end;
//==============================================================================
procedure TTransSubPartForm.bbCloseClick(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;
//==============================================================================
procedure TTransSubPartForm.FormShow(Sender: TObject);
begin
  edPart.Clear;
  edPart2.Clear;

  edDog.Clear;
  edDog2.Clear;
  edDogDate.Clear;
  edDogDate2.Clear;

  edNPG_Type1.Clear;
  edNPG_Type2.Clear;

  LblLeftName.Visible := False;
  LblLeft.Visible := False;

  bbApply.Enabled := False;
  LblLeft.Caption := '0';
  deDateRash.Date := now;
end;
//==============================================================================
procedure TTransSubPartForm.RefreshSQLFrom();
begin
  qMain.Close;
  // Фича для Альфа-Харькова : подпартии должны быть без талонов и прочего
  if INST = 181 then
    qMain.SQL.Text := qMainKharkov.SQL.Text
  else qMain.SQL.Text := qMain.BaseSQL;
  qMain.Prepare;
  qMain.ParamByName('p_first_day').AsDateTime := deDateRash.Date;
  qMain.ParamByName('p_part_id').AsInteger := edPart.Tag;
  qMain.ParamByName('p_part_inst').AsInteger := lPart.Tag;
  qMain.Open;
  mdSubPartFrom.LoadFromDataSet(qMain, 0, lmCopy);
  RefreshSQLTo();

  SetGridSumm();
  RefreshBtn();
end;
//==============================================================================
procedure TTransSubPartForm.RefreshSQLTo();
begin
  mdSubPartTo.Close;
  mdSubPartTo.CopyStructure(qMain);
  mdSubPartTo.Open;
end;
//==============================================================================
procedure TTransSubPartForm.RefreshBtn();
begin
  SetGridSumm();
  LblLeft.Caption := FloatToStr(MainForm.PartRest(edPart2.Tag, lPart2.Tag));
  IncludeBtn.Enabled := not mdSubPartFrom.IsEmpty;
  ExcludeBtn.Enabled := not mdSubPartTo.IsEmpty;
  bbApply.Enabled := not mdSubPartTo.IsEmpty;
end;
//==============================================================================
procedure TTransSubPartForm.IncludeBtnClick(Sender: TObject);
begin
  if (edPart2.Text = '') or mdSubPartFrom.IsEmpty then
  begin
    MessageDlg(TranslateText('Не выбрана партия №2 или отсутствуют доступные подпартии в партии №1!'), mtError, [mbOk], 0);
    exit;
  end;

  if mdSubPartFrom.eof then
    mdSubPartFrom.RecNo := mdSubPartFrom.RecordCount;
  mdSubPartFrom.SaveToDataSet(mdSubPartTo, 1);
  mdSubPartFrom.Delete;
  RefreshBtn();
end;
//==============================================================================
procedure TTransSubPartForm.ExcludeBtnClick(Sender: TObject);
begin
  if mdSubPartTo.IsEmpty then Exit;
  if mdSubPartTo.eof then
    mdSubPartTo.RecNo := mdSubPartTo.RecordCount;
  mdSubPartFrom.LoadFromDataSet(mdSubPartTo, 1, lmAppend);
  mdSubPartTo.Delete;
  RefreshBtn();
end;
//==============================================================================
procedure TTransSubPartForm.edPartKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;
//==============================================================================
procedure TTransSubPartForm.deDateRashChange(Sender: TObject);
begin
  RefreshSQLFrom();
end;
//==============================================================================

procedure TTransSubPartForm.FormCreate(Sender: TObject);
begin
  inherited;
  LoadSQLByForm(TForm(Self));
end;

end.
