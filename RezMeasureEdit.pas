unit RezMeasureEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EditBase, DB, Ora, VirtualTable, StdCtrls, DBCtrlsEh, Mask, GridsEh,
  DBGridEh, MemDS, DBAccess, uOilQuery, Buttons, ExtCtrls, ToolEdit,
  uCommonForm, DBGridEhGrouping;

type
  TRezMeasureEditForm = class(TEditBaseForm)
    gr: TDBGridEh;
    deDateOn: TDBDateTimeEditEh;
    lblDateOn: TLabel;
    lblOper: TLabel;
    eNumb: TEdit;
    lblNumb: TLabel;
    vt: TVirtualTable;
    ds: TOraDataSource;
    lblEmploy: TLabel;
    vtDENSITY: TFloatField;
    vtTEMPER: TFloatField;
    vtFUEL_LEVEL: TFloatField;
    vtFUEL_QUANTITY: TFloatField;
    vtFUEL_WEIGHT: TFloatField;
    vtWATER_LEVEL: TFloatField;
    vtWATER_QUANTITY: TFloatField;
    vtWATER_WEIGHT: TFloatField;
    vtREZ_ID: TIntegerField;
    vtREZ_INST: TIntegerField;
    vtREZ_NUMB: TStringField;
    vtNP_ID: TIntegerField;
    vtNP_NAME: TStringField;
    vtDATE_ON: TDateTimeField;
    sbAutoNumb: TSpeedButton;
    vtDENSITY_REDUCED: TFloatField;
    qRez: TOilQuery;
    dsRez: TOraDataSource;
    edOper: TComboEdit;
    ceEmploy: TComboEdit;
    sbDel: TSpeedButton;
    vtID: TIntegerField;
    vtINST: TIntegerField;
    vtFUEL_LEVEL_TEMP: TFloatField;
    procedure vtREZ_NUMBSetText(Sender: TField; const Text: String);
    procedure grColumns1UpdateData(Sender: TObject; var Text: String;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure grKeyPress(Sender: TObject; var Key: Char);
    procedure sbAutoNumbClick(Sender: TObject);
    procedure edOperKeyPress(Sender: TObject; var Key: Char);
    procedure ceEmployButtonClick(Sender: TObject);
    procedure grExit(Sender: TObject);
    procedure vtDENSITYChange(Sender: TField);
    procedure vtFUEL_QUANTITYChange(Sender: TField);
    procedure FormCreate(Sender: TObject);
    procedure vtBeforePost(DataSet: TDataSet);
    procedure sbDelClick(Sender: TObject);
    procedure vtREZ_IDChange(Sender: TField);
    procedure vtFUEL_LEVELChange(Sender: TField);
    procedure grGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    FOperId,
    FEmpId, FEmpInst: integer;
    IsShow: boolean;
    procedure GetVT(p_ID, p_INST: integer);
  public
    procedure Init();override;
    procedure Save();override;
    procedure Test();override;    
    property OperId: integer read FOperId write FOperId;
    property EmpId: integer read FEmpId write FEmpId;
    property EmpInst: integer read FEmpInst write FEmpInst;
  end;

implementation

{$R *.dfm}

uses Main, UDbFunc, EmpRef, ExFunc, OilStd;

{ TRezMeasureEditForm }

procedure TRezMeasureEditForm.GetVT(p_ID, p_INST: integer);
begin
  q.Close;
  _OpenQueryPar(q, ['id', p_ID, 'inst', p_INST]);
  vt.Close;
  vt.Clear;
  vt.Open;

  q.First;
  while not q.Eof do
  begin
    vt.Append;

    vtID.AsInteger   := q.FieldByName('ID').AsInteger;
    vtINST.AsInteger := p_INST;

    vtDATE_ON.AsDateTime := q.FieldByName('DATE_ON').AsDateTime;
    vtREZ_ID.AsInteger   := q.FieldByName('REZ_ID').AsInteger;
    vtREZ_INST.AsInteger := q.FieldByName('REZ_INST').AsInteger;
    vtREZ_NUMB.AsString  := q.FieldByName('REZ_NUMB').AsString;

    vtNP_ID.AsInteger  := q.FieldByName('NP_ID').AsInteger;
    vtNP_NAME.AsString := q.FieldByName('NP_NAME').AsString;

    vtFUEL_QUANTITY.AsFloat := q.FieldByName('FUEL_QUANTITY').AsFloat;
    vtFUEL_LEVEL.AsFloat    := q.FieldByName('FUEL_LEVEL').AsFloat;
    vtFUEL_WEIGHT.AsFloat   := q.FieldByName('FUEL_WEIGHT').AsFloat;

    vtWATER_QUANTITY.AsFloat := q.FieldByName('WATER_QUANTITY').AsFloat;
    vtWATER_LEVEL.AsFloat    := q.FieldByName('WATER_LEVEL').AsFloat;
    vtWATER_WEIGHT.AsFloat   := q.FieldByName('WATER_WEIGHT').AsFloat;

    vtTEMPER.AsFloat  := q.FieldByName('TEMPER').AsFloat;
    vtDENSITY.AsFloat := q.FieldByName('DENSITY').AsFloat;

    vt.Post;
    q.Next
  end;
  vt.First;
  IsShow := true;
end;

procedure TRezMeasureEditForm.Init;
begin
  inherited;
  if ID = 0 then
  begin
    GetVT(0, 0);
    OperId := 288;
    edOper.Text := GetOperationName(288);
    deDateOn.Value := now;
  end
  else
  begin
    GetVT(ID, INST);
    EmpId := q.FieldByName('emp_id').AsInteger;
    EmpInst := q.FieldByName('emp_inst').AsInteger;
    ceEmploy.Text := q.FieldByName('emp_name').AsString;
    OperId := q.FieldByName('oper_id').AsInteger;
    edOper.Text := q.FieldByName('oper_name').AsString;
    deDateOn.Value := q.FieldByName('date_on').AsDateTime;
    eNumb.Text := q.FieldByName('numb').AsString;
    if eNumb.Text <> '' then
      sbAutoNumb.Down := false;
  end;

  sbAutoNumbClick(nil);
  qRez.Close;
  _OpenQueryPar(qRez,
   ['inst', INST]);
  FillRezList(gr.FieldColumns['rez_numb'].PickList,INST);
end;

procedure TRezMeasureEditForm.Save;
begin
  if eNumb.ReadOnly then
    eNumb.Text :=
      nvl(GetSqlValueParSimple(
        'select max(numb) + 1 from oil_rez_measure' +
        ' where state = ''Y'' and TRANSLATE(numb, ''1234567890'', '''') is null' +
        '   and id <> :ID and inst = :INST',
        ['ID', ID, 'INST', INST]), '1');

  ID := DBSaver.SaveRecord('OIL_REZ_MEASURE',
   ['ID',       ID,
    'INST',     INST,
    'STATE' ,   'Y',
    'OPER_ID',  OperId,
    'USER_ID',  SUPER_REAL_EMP_ID,
    'DATE_ON',  deDateOn.Value,
    'NUMB',     eNumb.Text,
    'EMP_ID',   EmpId,
    'EMP_INST', EmpInst]);

  _ExecSql(
    'update oil_rez_measure_det set state = ''N''' +
    ' where head_id = :id and head_inst = :inst and state = ''Y''',
    ['id', ID, 'inst', INST]);

  vt.DisableControls;
  try
    vt.First;
    while not vt.Eof do
    begin
      DBSaver.SaveRecord('OIL_REZ_MEASURE_DET',
       ['ID',             vtID.AsInteger,
        'INST',           INST,
        'STATE' ,         'Y',
        'HEAD_ID',        ID,
        'HEAD_INST',      INST,
        'REZ_ID',         vtREZ_ID.AsInteger,
        'REZ_INST',       vtREZ_INST.AsInteger,
        'DATE_ON',        FormatDateTime2('dd.mm.yyyy', vtDATE_ON.AsDateTime),
        'TEMPER',         vtTEMPER.AsFloat,
        'DENSITY',        vtDENSITY.AsFloat,
        'FUEL_LEVEL',     vtFUEL_LEVEL.AsFloat,
        'FUEL_QUANTITY',  vtFUEL_QUANTITY.AsFloat,
        'FUEL_WEIGHT',    vtFUEL_WEIGHT.AsFloat,
        'WATER_LEVEL',    vtWATER_LEVEL.AsFloat,
        'WATER_QUANTITY', vtWATER_QUANTITY.AsFloat,
        'WATER_WEIGHT',   vtWATER_WEIGHT.AsFloat]);
      vt.Next;
    end;
  finally
    vt.EnableControls;
  end;
end;

procedure TRezMeasureEditForm.ceEmployButtonClick(Sender: TObject);
var
  vname: string;
begin
  if TEmpRefForm.Choose(FEmpId, FEmpInst, vname) then
    ceEmploy.Text := vname;
end;

procedure TRezMeasureEditForm.Test;
begin
  if (deDateOn.Value = 0) then
    raise Exception.Create('Необходимо выбрать дату документа !');

  if (not sbAutoNumb.Down) then
  begin
    if (trim(eNumb.Text) = '') then
      raise Exception.Create('Необходимо ввести номер документа !');
    // TODO: Повторение номеров
    // select numb from oil_rez_measuare where numb = :numb and state = ''Y''
  end;

  if EmpId = 0 then
    raise Exception.Create('Необходимо выбрать ответстуенного сотрудника !');

  vt.DisableControls;
  try
    while not vt.Eof do
    begin
      if (vtDENSITY.AsFloat > 1) or (vtDENSITY.AsFloat <= 0) then
        raise Exception.Create('Плотность указана не верно !');
      if (vtREZ_NUMB.AsString = '') then
        raise Exception.Create('Не выбран резервуар !');
      vt.Next;
    end;
  finally
    vt.EnableControls;
  end;
end;

procedure TRezMeasureEditForm.vtREZ_NUMBSetText(Sender: TField; const Text: String);
begin
  if Text = '' then
  begin
    vtREZ_ID.AsInteger   := 0;
    vtREZ_INST.AsInteger := 0;
    vtREZ_NUMB.AsString  := '';
  end
  else
  begin
    qRez.Filtered := False;
    qRez.Filter   := 'REZ_NUMB = '+ Text;
    qRez.Filtered := True;
    vt.Edit;
    vtREZ_ID.AsInteger   := qRez.FieldByName('ID').AsInteger;
    vtREZ_INST.AsInteger := qRez.FieldByName('INST').AsInteger;
    vtREZ_NUMB.AsString  := qRez.FieldByName('num').AsString;
    vtNP_NAME.AsString   := qRez.FieldByName('np_name').AsString;
  end;
end;

procedure TRezMeasureEditForm.grColumns1UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
  vtREZ_NUMBSetText(nil, Text);
end;

procedure TRezMeasureEditForm.grKeyPress(Sender: TObject; var Key: Char);
begin
  If (Key = '.')Or(Key = ',') Then Key := DecimalSeparator;
end;

procedure TRezMeasureEditForm.sbAutoNumbClick(Sender: TObject);
begin
  if sbAutoNumb.Down then
  begin
    eNumb.Text := '';
    eNumb.ReadOnly := true;
    eNumb.Color := clBtnFace;
    eNumb.Hint := TranslateText('Будет выбран следующий номер по порядку');
    eNumb.ShowHint := true;
  end
  else
  begin
    eNumb.ReadOnly := false;
    eNumb.Color := clWindow;
    eNumb.Hint := '';
    eNumb.ShowHint := false;
  end;
end;

procedure TRezMeasureEditForm.edOperKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TRezMeasureEditForm.grExit(Sender: TObject);
begin
  if vt.State = dsEdit then
    vt.Post;
end;

procedure TRezMeasureEditForm.vtDENSITYChange(Sender: TField);
begin
  // знаходимо густину при 20 С
  vtDENSITY_REDUCED.AsFloat :=
    nvl(GetSqlValueParSimple('select GetDensityForTemperature(:UD_Weig, :Temper, 20) from dual',
      ['UD_Weig', vtDENSITY.AsFloat,
       'Temper',  vtTEMPER.AsFloat]), 0);
  vtFUEL_QUANTITYChange(nil);
end;

procedure TRezMeasureEditForm.vtFUEL_QUANTITYChange(Sender: TField);
begin
  vtFUEL_WEIGHT.AsFloat := MRound(vtFUEL_QUANTITY.AsFloat * vtDENSITY.AsFloat, 0) / 1000;
end;

procedure TRezMeasureEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  IsShow := false;
end;

procedure TRezMeasureEditForm.vtBeforePost(DataSet: TDataSet);
begin
  if not IsShow then exit;
  if vtDATE_ON.AsDateTime = 0 then
    vtDATE_ON.AsDateTime := trunc(now);
end;

procedure TRezMeasureEditForm.sbDelClick(Sender: TObject);
begin
  if not vt.IsEmpty then
    vt.Delete
end;

procedure TRezMeasureEditForm.vtREZ_IDChange(Sender: TField);
begin
  vtFUEL_LEVELChange(nil);
end;

procedure TRezMeasureEditForm.vtFUEL_LEVELChange(Sender: TField);
var
  qTemp: TOilQuery;
begin
  qTemp := TOilQuery.Create(nil);
  try
    qTemp.SQL.Text :=
      'select *' +
      '  from (select * from oil_rezervuar_calibr' +
      '         where state = ''Y''' +
      '           and rez_id = :rez_id and rez_inst = :rez_inst' +
      '           and lvl >= :lvl and :lvl <> 0' +
      '         order by lvl)' +
      ' where rownum = 1';
    _OpenQueryPar(qTemp,
      ['rez_id',   vtREZ_ID.AsInteger,
       'rez_inst', vtREZ_INST.AsInteger,
       'lvl',      vtFUEL_LEVEL.AsFloat]);
    vtFUEL_QUANTITY.AsFloat   := nvl(qTemp.FieldByName('volume').AsFloat, 0);
    vtFUEL_LEVEL_TEMP.AsFloat := nvl(qTemp.FieldByName('lvl').AsFloat, 0);
  finally
    qTemp.Free;
  end;
end;

procedure TRezMeasureEditForm.grGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if not IsShow then exit;
  if vt.State <> dsBrowse then exit;

  if (Column.FieldName = 'FUEL_LEVEL') then
    if vtFUEL_LEVEL_TEMP.AsFloat <> vtFUEL_LEVEL.AsFloat then
      Background := $00FEE2E2
    else
      Background := clWindow;
end;

end.
