unit NpPriceDocEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EditBase, VirtualTable, DB, MemDS, DBAccess, Ora, uOilQuery,
  StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, Grids, DBGridEh, Menus,
  PrihSop, NPTypeRef, GridsEh, DBGridEhGrouping, ComCtrls, ListSelect,uCommonForm,
  RXDBCtrl, DBCtrls;

type
  TNpPriceDocEditForm = class(TEditBaseForm)
    vt: TVirtualTable;
    lblDateOn: TLabel;
    deDateOn: TDateEdit;
    sbDel: TSpeedButton;
    ds: TOraDataSource;
    Label1: TLabel;
    PageControl1: TPageControl;
    tsPrice: TTabSheet;
    tsState: TTabSheet;
    Grid: TDBGridEh;
    DBGridEh1: TDBGridEh;
    qOrderState: TOilQuery;
    dsOrderState: TOraDataSource;
    Label3: TLabel;
    edNum: TEdit;
    qOrderAzs: TOilQuery;
    tsAzs: TTabSheet;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    cbMethod: TComboBox;
    cbEmp: TComboEdit;
    procedure sbDelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridEditButtonClick(Sender: TObject);
    procedure GridKeyPress(Sender: TObject; var Key: Char); 
    procedure PageControl1Change(Sender: TObject);
    procedure cbEmpButtonClick(Sender: TObject);
  protected
    DATE_ON: TDateTime;
  private
    FEmpId, FEmpInst: integer;
    LSF: TListSelectForm;
    function GetVisibleCod: TNpTypeCod;
    procedure SetVisibleCod(const Value: TNpTypeCod);
  public
    ListAzs, OperList: string;
    function GetOperList(): string;
    procedure Init; override;
    procedure Test; override;
    procedure Save; override;
    class function Edit(ADateOn:TDateTime; AInst: integer): Boolean; overload;
    property VisibleCod: TNpTypeCod read GetVisibleCod write SetVisibleCod;

  end;

var
  NpPriceDocEditForm: TNpPriceDocEditForm;

implementation

uses Main, UDbFunc, EmpRef, ExFunc;

{$R *.dfm}

procedure TNpPriceDocEditForm.sbDelClick(Sender: TObject);
begin
  inherited;
  if not vt.IsEmpty then
    vt.Delete;
end;

function TNpPriceDocEditForm.GetVisibleCod: TNpTypeCod;
begin
  Result := CommonGetVisibleCod(Grid);
end;

procedure TNpPriceDocEditForm.Init;
var
  qList:TOilQuery;
begin
  inherited;
  if DATE_ON <> 0 then
  begin
    deDateOn.Date := DATE_ON;
    q.Close;
    _OpenQueryPar(q,
     ['inst', INST,
      'date_on', DATE_ON]);
    vt.Assign(q);
    vt.Open;
    bbOk.Enabled := MAIN_ORG.Inst = INST;
  end
  else
  begin
    deDateOn.Date := Date();
    q.Close;
    _OpenQueryPar(q,
     ['inst', 0,
      'date_on', DATE_ON]);
    vt.Assign(q);
    vt.Open;
  end;
  CommonVisibleCodInit(Grid);
  cbEmp.Text:= vt.FieldByName('name_f').AsString;    
  edNum.Text:= vt.FieldByName('numb').AsString;
  FEmpId:= vt.FieldByName('emp_id').AsInteger;
  FEmpInst:= vt.FieldByName('emp_inst').AsInteger;

  qOrderState.Filtered:=false;
  qOrderState.Filter:=' price_order_id = '+IntToStr(q.FieldByName('price_order_id').AsInteger);
  qOrderState.Filtered:=true;

  // Получить список АЗС (для хинта), по которым менялись цены
  qList:=TOilQuery.Create(self);
  qList.close;
  qList.sql.text:=
    'select t.azs_id, tt.name from oil_price_order_azs t , v_oil_azs tt where t.State = ''Y'' and '+
    ' t.azs_id = tt.id ';
  if not (vt.FieldByName('opo_id').AsString = '') then
    qList.Sql.Add(' and t.price_order_id = '+ vt.FieldByName('opo_id').AsString +
    ' and  t.price_order_inst = '+  vt.FieldByName('opo_inst').AsString)
  else
    qList.Sql.Add(' and t.price_order_id = null ');
  qList.open;
  try
    qList.First;
    while not qList.Eof do
    begin
      ListAzs:= ListAzs + #13#10 + qList.FieldByName('name').AsString;

      if OperList <> '' then
        OperList := OperList +','+ qList.FieldByName('azs_id').AsString
      else
        OperList := qList.FieldByName('azs_id').AsString;

      qList.Next;
    end;
  finally
    qList.Free;
  end;   
  PageControl1.Hint := ListAzs;


end;

procedure TNpPriceDocEditForm.Save;
var
IDdoc  : integer;
qAZS : TOilQuery;

begin
  inherited;
  _ExecSql('update OIL_PRICE_ORDER set state = ''N''  ' +
    'where id in (select t.price_order_id from OIL_NP_PRICE t ' +
    'where t.date_on = :date_on and t.inst = :inst)',
    ['date_on', deDateOn.Date,
    'inst', INST]);

  IDdoc:=DBSaver.SaveRecord('OIL_PRICE_ORDER',
    ['ID', GetNextId('OIL_PRICE_ORDER',['INST',INST]),
    'INST', INST,
    'STATE','Y',
    'NUMB', edNum.Text, // vt.FieldByName('max_numb').AsString,
    'EMP_ID', BoolTo_(FEmpId=0,null,FEmpId),
    'EMP_INST',BoolTo_(FEmpInst=0,null,FEmpInst),
    'VERIFIED', 1,
    'APPLY_METHOD', 777,
    'NOTICE_METHOD', 888
    ]);

  _ExecSql('update OIL_NP_PRICE set state = ''N'' where date_on = :date_on and inst = :inst',
    ['date_on', deDateOn.Date,
    'inst', INST]);

  vt.First;
  while not vt.Eof do
  begin
    DBSaver.SaveRecord('OIL_NP_PRICE',
      ['ID', GetNextId('OIL_NP_PRICE', ['DATE_ON', deDateOn.Date, 'INST',INST, 'ORG_ID', INST, 'ORG_INST', INST]),
      'INST', INST,
      'STATE','Y',
      'ORG_ID', INST,
      'ORG_INST', INST,
      'NP_ID', vt.FieldByName('NP_TYPE_ID').AsInteger,
      'DATE_ON', deDateOn.Date,
      'PRICE', vt.FieldByName('PRICE').AsCurrency,
      'PRICE_ORDER_ID',  IdDoc,
      'PRICE_ORDER_INST', INST
      ]);
    vt.Next;
  end;

  {
// Создать запись состояния документа
  _ExecSql('update OIL_PRICE_ORDER_STATE set state = ''N'' where  inst = :inst and PRICE_ORDER_ID = ' +
  IntToStr(IdDoc),['inst', INST]);

  DBSaver.SaveRecord('OIL_PRICE_ORDER_STATE',
    ['ID', GetNextId('OIL_PRICE_ORDER_STATE', ['PRICE_ORDER_ID',
    IdDoc ,'INST',INST]),      //  q.FieldByName('price_order_id').AsInteger
    'INST', INST,
    'STATE','Y',
    'PRICE_ORDER_ID',  IdDoc,
    'PRICE_ORDER_INST', INST,
    'STATE_ID', 290,
    'DATE_OF', deDateOn.Date
    ]); 
 }   

// Занести список АЗС
  OperList := GetOperList();
  if not ((OperList = '') or (OperList = '()')) then
  begin
     _ExecSql('update OIL_PRICE_ORDER_AZS set state = ''N'' where PRICE_ORDER_ID = '
    + IntToStr(IdDoc) + ' and inst = :inst',
    ['inst', INST]);

    qAZS:=TOilQuery.Create(self);
    try
      qAZS.close;
      qAZS.sql.text:=' select * from v_oil_azs where id in ' + OperList;
      qAZS.open;
      qAZS.first;
    while not qAZS.Eof do
    begin
      DBSaver.SaveRecord('OIL_PRICE_ORDER_AZS',
        ['ID', GetNextId('OIL_PRICE_ORDER_AZS', ['INST',INST]),
        'INST', INST,
        'STATE','Y',
        'PRICE_ORDER_ID',  IdDoc,
        'PRICE_ORDER_INST', INST,
        'AZS_ID', qAZS.FieldByName('ID').AsInteger,
        'AZS_INST', qAZS.FieldByName('INST').AsInteger
        ]);
      qAZS.Next;
    end;
    finally
    qAZS.Free;
    end;
  end;
end;

procedure TNpPriceDocEditForm.SetVisibleCod(const Value: TNpTypeCod);
begin
  CommonSetVisibleCod(Grid, Value);
end;

procedure TNpPriceDocEditForm.Test;
var
  sl: TStringList;
begin
  inherited;
  vt.DisableControls;
  sl := TStringList.Create;
  try
    vt.First;
    while not vt.Eof do
    begin
      if sl.Values[vt.FieldByName('np_type_id').AsString] = '1' then
        raise Exception.Create('Нельзя ввести в одном приказе один товар дважды!')
      else
        sl.Values[vt.FieldByName('np_type_id').AsString] := '1';
      vt.Next;
    end;
  finally
    sl.Free;
    vt.EnableControls;
  end;
  
  if cbMethod.Text = '' then
  begin
    MessageDlg(TranslateText('Не определен метод проведения документа !'), mtError, [mbOk], 0);
    Exit;
  end;
end;

class function TNpPriceDocEditForm.Edit(ADateOn: TDateTime;
  AInst: integer): Boolean;
var
  F: TNpPriceDocEditForm;
begin
  F := Self.Create(Application);
  try
    F.DATE_ON := ADateOn;
    F.INST := AInst;
    F.Init;
    Result := F.ShowModal=mrOk;
  finally
    F.Free;
  end;
end;

procedure TNpPriceDocEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  qOrderState.Close;
  qOrderState.Open;  
  PageControl1.ActivePage := tsPrice;
  FreeAndNil(LSF);
end;

procedure TNpPriceDocEditForm.GridEditButtonClick(Sender: TObject);
var
  Table: TOraQuery;
begin
  inherited;
  if Grid.SelectedField.FieldName = 'NP_NAME' then
  begin
    Table := TOraQuery.Create(nil);
    try
      if TNPTypeRefForm.Choose(Table) then
      begin
        if not (vt.State in [dsEdit,dsInsert]) then
          vt.Edit;
        vt.FieldByName('np_type_id').AsInteger := Table.FieldByName('id').AsInteger;
        vt.FieldByName('np_name').AsString := Table.FieldByName('name').AsString;
        vt.FieldByName('codavias').AsInteger := Table.FieldByName('codavias').AsInteger;
        vt.FieldByName('codoptima').AsInteger := Table.FieldByName('codoptima').AsInteger;
        vt.FieldByName('codint').AsInteger := Table.FieldByName('codint').AsInteger;
      end;
    finally
     Table.Free;
    end;
  end;
end;

procedure TNpPriceDocEditForm.GridKeyPress(Sender: TObject; var Key: Char);
var
  Table: TOraQuery;
begin
  inherited;
  if (Grid.SelectedField.FieldName = 'PRICE') then
  begin
    case key of
      '.', ',': key := DecimalSeparator;
      #13:
      begin
        vt.Append;
        Grid.SelectedField := vt.FieldByName(VISIBLE_COD_FIELDS[VisibleCod]);
      end;
    end;
  end
  else if (Key = #13) and (Grid.SelectedField.FieldName = VISIBLE_COD_FIELDS[VisibleCod]) then
  begin
    Table := TOraQuery.Create(nil);
    try
      if TNPTypeRefForm.Choose(vt.FieldByName(VISIBLE_COD_FIELDS[VisibleCod]).AsInteger, VisibleCod, Table) then
      begin
        if not (vt.State in [dsEdit,dsInsert]) then
          vt.Edit;
        vt.FieldByName('np_type_id').AsInteger := Table.FieldByName('id').AsInteger;
        vt.FieldByName('np_name').AsString := Table.FieldByName('name').AsString;
        vt.FieldByName('codavias').AsInteger := Table.FieldByName('codavias').AsInteger;
        vt.FieldByName('codoptima').AsInteger := Table.FieldByName('codoptima').AsInteger;
        vt.FieldByName('codint').AsInteger := Table.FieldByName('codint').AsInteger;
        Grid.SelectedField := vt.FieldByName('price');
      end;
    finally
      Table.Free;
    end;
  end;
end;

procedure TNpPriceDocEditForm.PageControl1Change(Sender: TObject);
begin
  inherited;
  if PageControl1.ActivePage = tsPrice then
    sbDel.Enabled:=True
  else sbDel.Enabled:=False;   

  if (PageControl1.ActivePage = tsAzs) and (LSF = nil) then
   begin
     LSF := TListSelectForm.Create(tsAzs);
     LSF.Parent := tsAzs;
     Lsf.TableName:='v_oil_azs';
     Lsf.AddCondition := 'obl_id =  ov.getval(''INST'')';
     LSF.WindowState := wsMaximized;
     LSF.BorderStyle := bsNone;
     LSF.Anchors := [akLeft, akTop, akRight, akBottom];
     LSF.Position := poDefault;
     LSF.List := OperList;
     Lsf.OKBtn.Visible := false;
     Lsf.CancelBtn.Visible := false;
     LSF.Show;
   end;
end;

function TNpPriceDocEditForm.GetOperList(): string;
begin
  result := '';
  if LSF <> nil then
  begin
    LSF.OKBtnClick(nil);
    result := LSF.List;
  end;
end;



procedure TNpPriceDocEditForm.cbEmpButtonClick(Sender: TObject);
var
  Emp: TEmpRefForm;
begin
  Emp := TEmpRefForm.Create(Application);
  try
    Emp.ShowModal;
    if Emp.ModalResult = mrOk then
      if not Emp.q.eof then
      begin
        FEmpId := Emp.q.fieldbyname('id').AsInteger;
        FEmpInst := Emp.q.fieldbyname('inst').AsInteger;
        cbEmp.Text := Emp.q.FieldByName('F_name').AsString + ' ' + Emp.q.FieldByName('I_name').AsString + ' ' + Emp.q.FieldByName('O_name').AsString;
      end;
  finally
    Emp.Free;
  end;
end;

end.
