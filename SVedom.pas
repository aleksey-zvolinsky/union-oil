unit SVedom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, RXDBCtrl, Db, DBTables,
  uCommonForm, uOilQuery, Ora, uOilStoredProc, MemDS, DBAccess, DBGridEh,
  ActnList;

type
  TVedForm = class(TCommonForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    BitBtn2: TBitBtn;
    dbgVed: TDBGridEh;
    Table1: TTable;
    ds: TDataSource;
    Table1Org_Name: TStringField;
    Table1Litr: TFloatField;
    Table1Price: TFloatField;
    Query1: TQuery;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Table1CountT: TFloatField;
    sbDel: TSpeedButton;
    Table1Amount: TFloatField;
    dsDog: TOraDataSource;
    qDog: TOilQuery;
    Table1Dog_Name: TStringField;
    Table1Dog_Date: TDateField;
    qWork: TOilQuery;
    lblOwnGoods: TLabel;
    Table1Ttn_Id: TIntegerField;
    Table1Ttn_Inst: TIntegerField;
    Table1Org_id: TIntegerField;
    Table1Org_inst: TIntegerField;
    Table1SubPart: TIntegerField;
    Table1Dog_Id: TIntegerField;
    Table1Dog_Inst: TIntegerField;
    ActionList: TActionList;
    actSave: TAction;
    actE: TAction;
    actDel: TAction;
    procedure dbgVedEditButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgVedKeyPress(Sender: TObject; var Key: Char);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure actSaveExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure Table1LitrValidate(Sender: TField);
    procedure Table1PriceValidate(Sender: TField);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure Table1CalcFields(DataSet: TDataSet);
    procedure actEExecute(Sender: TObject);
  private
  public
    StartLitr: real;
    PartBase: real;
    TTN_ID, TTN_INST, SubPart: integer;
    VedOut: real;
    NPName: string;
    ud_weig: real;
    DogEdit: Boolean;
    SrepKorrPercent: real;
  end;

implementation

{$R *.DFM}

uses Main, ChooseOrg, OILSTD, DogRef, UDbFunc;

//==============================================================================
procedure TVedForm.dbgVedEditButtonClick(Sender: TObject);
var
  vId, vInst: Integer;
  vName: string;
  Dog: TDogRefForm;
begin
  if dbgVed.SelectedField.Name = 'Table1Org_Name' then
  begin
    if ChooseOrg.CaptureOrg(3, MAIN_ID, INST, 'yyy', vId, vInst, vName) then
    begin
      Table1.Edit;
      Table1Org_id.Value := vId;
      Table1Org_inst.Value := vInst;
      Table1Org_name.AsString := vName;

      qWork.Close;
      qWork.SQL.Text := 'select Id, Inst from Oil_Dog ' +
        ' where State = ''Y'' ' +
        '   and Dog_Type = ''V'' ' +
        '   and To_ = ' + IntToStr(vId) +
        '   and To_Inst =' + IntToStr(vInst) +
        ' order by Dog_Date desc';
      qWork.Open;
      if qWork.IsEmpty then
      begin
        Table1.FieldByName('Dog_Id').Clear;
        Table1.FieldByName('Dog_Inst').Clear;
      end
      else
      begin
        Table1.FieldByName('Dog_Id').Value := qWork.FieldByName('Id').Value;
        Table1.FieldByName('Dog_Inst').Value := qWork.FieldByName('Inst').Value;
      end;
    end;
  end;

  if dbgVed.SelectedField.Name = 'Table1Dog_Name' then
  begin
    Application.CreateForm(TDogRefForm, Dog);
    Dog.rbYes.Enabled := False;
    Dog.rbNo.Enabled := False;
    Dog.rbKart.Enabled := False;
    Dog.rbVed.Checked := True;
    Dog.rbService.Enabled := False;

    Dog.ToCommit := False;
    if not (Table1.FieldByName('Org_Id').IsNull) then
    begin
      Dog.eTo.Tag := Table1.FieldByName('Org_Id').AsInteger;
      Dog.lTo.Tag := Table1.FieldByName('Org_Inst').AsInteger;
      Dog.eTo.Text := Table1.FieldByName('Org_Name').AsString;
    end;
    Dog.ShowModal;
    if Dog.ModalResult = mrOk then
    begin
      DogEdit := True;
      if Table1.State = dsBrowse then Table1.Edit;
      Table1.FieldByName('Dog_Id').AsInteger := dog.q.fieldbyname('Id').AsInteger;
      Table1.FieldByName('Dog_Inst').AsInteger := dog.q.fieldbyname('Inst').AsInteger;
      Table1.FieldByName('Org_Id').AsInteger := dog.q.fieldbyname('To_').AsInteger;
      Table1.FieldByName('Org_Inst').AsInteger := dog.q.fieldbyname('To_Inst').AsInteger;
      Table1.FieldByName('Org_Name').AsString := dog.q.fieldbyname('To_Name').AsString;
    end;
    Dog.Free;
  end;
end;
//==============================================================================
procedure TVedForm.FormShow(Sender: TObject);
var
  s: string;
begin
  Table1CountT.DisplayFormat := DR_FORMAT;

  Edit1.Text := FloattoStrF(StartLitr, ffFixed, 15, 3);
  Label4.Caption := NPName;
  Table1.Active := False;
  Table1.Active := true;

  s := ReadOilVar('SREP_KORR_PERCENT');
  if s = '' then SrepKorrPercent := 0.3
  else SrepKorrPercent := StrToFloat(s);
end;
//==============================================================================
procedure TVedForm.dbgVedKeyPress(Sender: TObject; var Key: Char);
begin
  if PartBase <> 0 then
  begin
    if (key = DecimalSeparator) and (dbgVed.SelectedField.name <> 'Table1Price') then key := #0;
    if (key in ['.', ',']) and (dbgVed.SelectedField.name = 'Table1Price') then key := DecimalSeparator;
    if key = '-' then key := #0;
  end
  else
  begin
    if (key in ['.', ',']) then key := DecimalSeparator;
    if key = '-' then key := #0;
  end;
end;
//==============================================================================
procedure TVedForm.Table1BeforePost(DataSet: TDataSet);
begin
  if Table1Litr.AsFloat = 0 then
    raise Exception.Create(TranslateText('Количество литров равно 0 !'));

  if Table1org_id.AsInteger = 0 then
    raise Exception.Create(TranslateText('Организация не определена !'));

  if (Table1Price.AsFloat = 0) and (lblOwnGoods.Caption <> 'S') then
    raise Exception.Create(TranslateText('Не указана цена !'));

  Table1Ttn_Id.AsInteger := TTN_ID;
  Table1Ttn_Inst.AsInteger := TTN_INST;

  if (not (Table1Litr.IsNull)) and (not (Table1Price.IsNull)) then
    if Abs(Table1Amount.AsFloat - (Table1Litr.AsFloat * Table1Price.AsFloat)) > (Table1Litr.AsFloat * Table1Price.AsFloat * SrepKorrPercent * 0.01) then
    begin
      ShowMessage(TranslateText('Корректировка суммы "') + FloatToStr(SrepKorrPercent) + TranslateText('%" превышена !'));
      Table1Amount.AsFloat := MRound(Table1Litr.AsFloat * Table1Price.AsFloat, 2);
    end
    else Table1Amount.AsFloat := MRound(Table1Amount.AsFloat, 2)
  else Table1Amount.Clear;

  if (not Table1.FieldByName('Org_Id').IsNull) and (Table1.FieldByName('Dog_Id').IsNull) then
  begin
    qWork.Close;
    qWork.SQL.Text := 'select Id, Inst from Oil_Dog ' +
      ' where State = ''Y'' ' +
      '   and Dog_Type = ''V'' ' +
      '   and To_ = '+ Table1Org_id.AsString +
      '   and To_Inst = '+ Table1Org_inst.AsString +
      ' order by Dog_Date desc';
    qWork.Open;
    if qWork.IsEmpty then
      raise Exception.Create(TranslateText('Договор не определен !'))
    else
    begin
      Table1Dog_Id.Value := qWork.FieldByName('Id').Value;
      Table1Dog_Inst.Value := qWork.FieldByName('Inst').Value;
    end;
  end;
end;
//==============================================================================
procedure TVedForm.actSaveExecute(Sender: TObject);
begin
  if not bbOk.Enabled then exit;

  if Table1.State <> dsBrowse then Table1.Post;
  query1.Close;
  query1.SQL.Text := 'select sum(Litr) as sm from oil_vedomostT.db';
  query1.Open;
  VedOut := MRound(query1.fieldbyname('sm').AsFloat, 3);
  if StrToFloat(Edit2.Text) >= 0 then Modalresult := MrOk;
end;
//==============================================================================
procedure TVedForm.actDelExecute(Sender: TObject);
begin
  if not (Table1.IsEmpty) then Table1.Delete;
end;
//==============================================================================
procedure TVedForm.Table1LitrValidate(Sender: TField);
begin
  if Table1Litr.AsFloat <> MRound(Table1Litr.AsFloat, 3) then
    Table1Litr.AsFloat := MRound(Table1Litr.AsFloat, 3);
  if PartBase <> 0 then
    Table1CountT.AsFloat := Table1Litr.AsFloat
  else
    Table1CountT.AsFloat := MRound(Table1Litr.AsFloat * ud_weig / 1000, DR_ROUND_COUNT);
  Table1Amount.AsFloat := MRound(Table1Litr.AsFloat * Table1Price.AsFloat, 2);
end;
//==============================================================================
procedure TVedForm.Table1PriceValidate(Sender: TField);
begin
  if Table1Price.AsFloat <> MRound(Table1Price.AsFloat, 2) then
    Table1Price.AsFloat := MRound(Table1Price.AsFloat, 2);
  Table1Amount.AsFloat := MRound(Table1Litr.AsFloat * Table1Price.AsFloat, 2);
end;
//==============================================================================
procedure TVedForm.Table1AfterPost(DataSet: TDataSet);
begin
  if Showing then
  begin
    Query1.Close;
    Query1.SQL.Text := 'select sum(Litr) as sm from oil_vedomostT.db';
    Query1.Open;
    Edit3.Text := FloatToStrF(query1.fieldbyname('sm').AsFloat, ffFixed, 15, 3);
    Edit2.Text := FloatToStrF(StrToFloat(Edit1.Text) - query1.fieldbyname('sm').AsFloat, ffFixed, 15, 3);
    if StrToFloat(Edit2.Text) < 0 then Edit2.Font.Color := clRed
    else Edit2.Font.Color := clBlack;
    Query1.Close;
    Query1.SQL.Text := 'select sum(Amount) as price from oil_vedomostT.db';
    Query1.Open;
    Edit4.Text := FloatToStrF(Query1.fieldbyname('price').AsFloat, ffFixed, 15, 2);
  end;
end;
//==============================================================================
procedure TVedForm.FormCreate(Sender: TObject);
begin
  inherited;
  Table1.DatabaseName := DB_DIR;
  Query1.DatabaseName := DB_DIR;
end;
//==============================================================================
procedure TVedForm.Table1CalcFields(DataSet: TDataSet);
begin
  inherited;
  // Подставляем договор
  if not (Table1Dog_id.IsNull and Table1Dog_inst.IsNull) then
  begin
    qDog.Close;
    _OpenQueryPar(qDog,
      ['dog_id',   Table1Dog_id.AsInteger,
       'dog_inst', Table1Dog_inst.AsInteger]);
    if not qDog.IsEmpty then
    begin
      Table1Dog_Name.Value := qDog.FieldByName('Dog').AsString;
      Table1Dog_Date.AsVariant := qDog.FieldByName('Dog_Date').AsDateTime;
    end;
  end;
end;
//==============================================================================
procedure TVedForm.actEExecute(Sender: TObject);
begin
  dbgVed.SetFocus;
  dbgVedEditButtonClick(nil);
end;
//==============================================================================

end.
