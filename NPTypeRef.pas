unit NPTypeRef;

interface

uses uCommonForm, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Base, Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask,
  Ora, ToolEdit, Placemnt, RxLookup, Menus, ActnList, RXCtrls, DBGridEh, Math,
  uOilQuery, MemDS, DBAccess, uOilStoredProc, VirtualTable,
  DBGridEhGrouping, GridsEh;

type
  TNpTypeCod = (ncAvias, ncOptima, ncOil, ncCodInt);

  TNPTypeRefForm = class(TBaseForm)
    qID: TFloatField;
    qNAME: TStringField;
    lblName: TLabel;
    edName: TEdit;
    eNum: TEdit;
    sbClearGrp: TSpeedButton;
    SP: TOilStoredProc;
    lblShortName: TLabel;
    edShort_Name: TEdit;
    qSHORT_NAME: TStringField;
    lblNpGroup: TLabel;
    edNPGroup: TComboEdit;
    qNP_GRP: TFloatField;
    qNP_GRP_NAME: TStringField;
    qUD_WEIGHT: TFloatField;
    qUS_SUBGROUP_ID: TFloatField;
    qUS_SUBGROUP_NAME: TStringField;
    lblUsGroup: TLabel;
    sbClearUsSubgroup: TSpeedButton;
    edUsSubgroup: TComboEdit;
    qPRICE: TFloatField;
    qSORTNAME: TStringField;
    qNP_GRP_FULLNAME: TStringField;
    qPETROL_ID: TFloatField;
    qUS_GROUP_ID: TFloatField;
    qNPG_ORDER_ID: TFloatField;
    qNAME_RUS: TStringField;
    qNAME_UKR: TStringField;
    qCODAVIAS: TFloatField;
    qUS_GROUP_NAME: TStringField;
    qFISCAL_NAME: TStringField;
    qFISCAL_NAME_TRUNC: TStringField;
    eCodAvias: TEdit;
    lblCodAvias: TLabel;
    qPRICEAVS_DATE_ON: TDateTimeField;
    qPRICEAVS: TFloatField;
    eCodoptima: TEdit;
    lblCodoptima: TLabel;
    qCODOPTIMA: TFloatField;
    qCODINT: TFloatField;
    eCodInt: TEdit;
    lblCodInt: TLabel;
    lblId: TLabel;
    procedure InitSLPrices(p_Str: string);
    procedure sbClearGrpClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure edNPGroupButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edNameChange(Sender: TObject);
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure edUsSubgroupButtonClick(Sender: TObject);
    procedure sbClearUsSubgroupClick(Sender: TObject);
    procedure edNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qCalcFields(DataSet: TDataSet);
    procedure bbOkClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure eNumKeyPress(Sender: TObject; var Key: Char);
    procedure sbEditClick(Sender: TObject); override;
  private
    slPrices: TStringList;
    sCondition, FMainSql: string;
  public
    class function Choose(var ANpId: integer; var ANpName: string): boolean; overload;
    class function Choose(AFieldNpId, AFieldNpName: TField): boolean; overload;
    class function Choose(var ANpId: integer; AEditNpName: TCustomEdit): boolean; overload;
    class function Choose(var AComponentNpId: TComponent;
      AEditNpName: TCustomEdit): boolean; overload;
    class function Choose(ATable: TOraQuery): boolean; overload;
    class function Choose(ACod: integer; ACodType: TNpTypeCod;
      ATable: TOraQuery): boolean; overload;
  end;

var
  NPTypeRefForm: TNPTypeRefForm;

implementation

uses OilStd, Main, uXMLForm, ExFunc, UDbFunc, NpTypeEdit, uImportFunc;

{$R *.DFM}

//==============================================================================
procedure TNPTypeRefForm.sbClearGrpClick(Sender: TObject);
begin
  edNPGroup.Clear;
end;
//==============================================================================
procedure TNPTypeRefForm.bbClearClick(Sender: TObject);
begin
  eNum.Clear;
  edName.Clear;
  edShort_Name.Clear;
  sbClearGrpClick(nil);
  eCodAvias.Clear;
  eCodOptima.Clear;
  sbClearUsSubgroup.Click;
end;
//==============================================================================
procedure TNPTypeRefForm.FormShow(Sender: TObject);
begin
  edName.SetFocus;
  qPrice.Visible := Assigned(slPrices);
  if not q.Active then bbSearch.Click;
end;
//==============================================================================
procedure TNpTypeRefForm.InitSLPrices(p_Str: string);
var
  i: integer;
  s: string;
begin
  if p_Str = '' then exit;
  Str2StringList(p_Str, slPrices, ';');
  qPrice.Visible := TRUE;
  s := '(np.id in (';
  for i := 0 to slPrices.Count - 1 do
  begin
    s := s + slPrices.Names[i] + ',';
    if (i + 1 mod 10 = 0) or (i = slPrices.Count - 1) then
    begin
      s[length(s)] := ')';
      if i <> slPrices.Count - 1 then s := s + ' or np.id in (';
    end;
  end;
  sCondition := s + ')';
end;
//==============================================================================
procedure TNPTypeRefForm.sbDelClick(Sender: TObject);
var
  Res: string;
begin
  raise exception.create(TranslateText('Вы не имеете прав на удаление данного типа НП !'));
  if q.Active then
    if q.RecordCount > 0 then
      if MessageDlg(TranslateText('Вы уверены что хотите удалить запись?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      try
        with SP do
        begin
          StoredProcName := 'OIL.INSORUPDOIL_NP_TYPE';
          Prepare;
          ParamByName('ID#').AsInteger := qId.AsInteger;
          ParamByName('STATE#').AsString := 'N';
          ParamByName('NAME#').AsString := qName.AsString;
          ParamByName('SHORT_NAME#').AsString := qShort_Name.AsString;
          ParamByName('GRP_ID#').AsInteger := qNP_Grp.AsInteger;
          ExecProc;
          Res := ParamByName('Result').AsString;
          if Length(Res) > 0 then
            if Res[1] <> '0' then raise Exception.Create(SubStr(Res, 2));
          CommitSQL;
          q.Close;
          q.Open;
        end;
      except on E: Exception do
        MessageDlg(TranslateText('Ошибка : ') + E.message, mtError, [mbOk], 0);
      end;
end;
//==============================================================================
procedure TNPTypeRefForm.bbSearchClick(Sender: TObject);
var
  s: string;
  i, j, n: integer;
begin
  try
    if not Assigned(slPrices) then
      s := ',0 as price'
    else
    begin
      s := '';
      n := (slPrices.Count - 1) div 100;
      for i := 0 to n do
      begin
        s := s + ',decode(np.id';
        for j := i * 100 to min(i * 100 + 99, slPrices.Count - 1) do
          s := s + ',' + slPrices.Names[j] + ',' + ReplaceSubstr(slPrices.Values[slPrices.Names[j]], ',', '.');
        s := s + ') as price' + IntToStr(i);
      end;
    end;

    q.Close;
    q.SQL.Text := FMainSql;
    if edName.Text <> '' then q.AddWhere('upper(name) like ''%' + ANSIUpperCase(edName.Text) + '%''');
    if edShort_Name.Text <> '' then q.AddWhere('Upper(Short_name) like ''%' + ANSIUpperCase(edShort_Name.Text) + '%''');
    if edNPGroup.Text <> '' then q.AddWhere('np_grp = ' + IntToStr(edNPGroup.Tag));
    if edUsSubgroup.Tag <> 0 then q.AddWhere('us_subgroup_id = ' + IntToStr(edUsSubgroup.Tag));
    if sCondition <> '' then q.AddWhere(sCondition);
    if eNum.Text <> '' then q.AddWhere(' np.id = '+ eNum.Text);
    if eCodAvias.Text <> '' then q.AddWhere(' codavias = '+ eCodAvias.Text);

    try
      if eCodOptima.Text <> '' then
        q.AddWhere(' np.id = '+ IntToStr(TExeLink.GetOilLinkId('OIL_NP_TYPE', 2, eCodOptima.Text)));
    except on e:ENoDataFound do;
    end;
    try
      if eCodInt.Text <> '' then
        q.AddWhere(' np.id = '+ IntToStr(TExeLink.GetOilLinkId('OIL_NP_TYPE', StrToInt(ReadOilVar('NP_CODINT')), eCodInt.Text)));
    except on e:ENoDataFound do;
    end;




    q.MacroByName('price').Value := s;

    if Assigned(slPrices) then
    begin
      n := (slPrices.Count - 1) div 100;
      s := 'select id,name,short_name,ud_weight,sortname,np_grp,np_grp_name,np_grp_fullname,' +
        'petrol_id,us_subgroup_id,us_subgroup_name,us_group_id,us_group_name,npg_order_id,name_rus,name_ukr,' +
        'codavias,us_group_name,fiscal_name,fiscal_name_trunc,priceavs,codoptima,priceavs_date_on,';
      for i := 0 to n - 1 do
        s := s + 'nvl(price' + IntToStr(i) + ',';
      s := s + 'price' + IntToStr(n);
      for i := 0 to n - 1 do
        s := s + ')';
      q.Sql.Text := s + ' as price from (' + q.Sql.Text + ')';
    end;
    _OpenQuery(q);
  except on E: Exception do
    MessageDlg(TranslateText('Ошибка : ') + E.message, mtError, [mbOk], 0);
  end;
end;
//==============================================================================
procedure TNPTypeRefForm.edNPGroupButtonClick(Sender: TObject);
begin
  XMLChoose('npgroupref', edNPGroup);
  bbSearch.Click;
end;
//==============================================================================
procedure TNPTypeRefForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormStyle = fsMdiChild then inherited;
  if Assigned(slPrices) then Action := caHide
end;
//==============================================================================
procedure TNPTypeRefForm.FormCreate(Sender: TObject);
begin
  inherited;
  RedColorFieldName := 'NAME';
  RedColorFilter := edName;
  bbOk.Visible := TRUE;
  FMainSql := q.SQL.Text;
  // Пока не разошлось с пакетами
  if ReadOilVar('NP_CODINT') = '' then
    WriteOilVar('NP_CODINT', '4');
end;
//==============================================================================
procedure TNPTypeRefForm.edNameChange(Sender: TObject);
begin
  bbSearch.Click;
end;
//==============================================================================
procedure TNPTypeRefForm.edNameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) and bbOk.Visible and not q.IsEmpty then bbOk.Click;
end;
//==============================================================================
procedure TNPTypeRefForm.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) and bbOk.Visible and not q.IsEmpty then bbOk.Click;
end;
//==============================================================================
procedure TNPTypeRefForm.edUsSubgroupButtonClick(Sender: TObject);
begin
  XMLChoose('ussubgroupref', edUsSubGroup);
  bbSearch.Click;
end;
//==============================================================================
procedure TNPTypeRefForm.sbClearUsSubgroupClick(Sender: TObject);
begin
  inherited;
  edUsSubgroup.Text := '';
  edUsSubgroup.Tag := 0;
  bbSearch.Click;
end;
//==============================================================================
procedure TNPTypeRefForm.edNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = 13) and (ssCtrl in Shift) then edUsSubgroupButtonClick(Sender);
end;
//==============================================================================
procedure TNPTypeRefForm.qCalcFields(DataSet: TDataSet);
var s: string;
begin
  inherited;
  if Assigned(slPrices) then
  begin
    s := slPrices.Values[qId.AsString];
    if s = '' then qPrice.AsFloat := 0
    else qPrice.AsFloat := StrToFloat(s);
  end;
end;
//==============================================================================
procedure TNPTypeRefForm.bbOkClick(Sender: TObject);
begin
  if q.Active and (q.RecordCount > 0) then ModalResult := mrOk;
end;
//==============================================================================
procedure TNPTypeRefForm.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(slPrices) then slPrices.Free;
end;
//==============================================================================
procedure TNPTypeRefForm.eNumKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', #8]) then key := #0;
end;
//==============================================================================

procedure TNPTypeRefForm.sbEditClick(Sender: TObject);
var
  id: integer;
begin
  inherited;
  id := q.FieldByName('ID').AsInteger;
  TNpTypeEditForm.Edit(q.FieldByName('ID').AsInteger, INST);
  bbSearch.Click;
  q.Locate('id', id, []);
end;

{ Функции Choose }

class function TNPTypeRefForm.Choose(var ANpId: integer; var ANpName: string): boolean;
begin
  Result := False;
  Application.CreateForm(TNPTypeRefForm, NPTypeRefForm);
  try
    NPTypeRefForm.ShowModal;
    if NPTypeRefForm.ModalResult = mrOk then
    begin
      ANpId := NPTypeRefForm.qID.AsInteger;
      ANpName := NPTypeRefForm.qNAME.AsString;
      Result := True;
    end;
  finally
    NPTypeRefForm.Free;
  end;
end;

class function TNPTypeRefForm.Choose(AFieldNpId,
  AFieldNpName: TField): boolean;
var
  NpId: integer;
  NpName: string;
begin
  if TNPTypeRefForm.Choose(NpId, NpName) then
  begin
    if AFieldNpId <> nil then
      AFieldNpId.AsInteger := NpId;
    if AFieldNpName <> nil then
      AFieldNpName.AsString := NpName;
    Result := True;
  end
  else
    Result := False;
end;

class function TNPTypeRefForm.Choose(var ANpId: integer;
  AEditNpName: TCustomEdit): boolean;
var
  NpName: string;
begin
  if TNPTypeRefForm.Choose(ANpId, NpName) then
  begin
    if AEditNpName <> nil then
      AEditNpName.Text := NpName;
    Result := True;
  end
  else
    Result := False;
end;


class function TNPTypeRefForm.Choose(var AComponentNpId: TComponent;
  AEditNpName: TCustomEdit): boolean;
var
  NpId: integer;
  NpName: string;
begin
  if TNPTypeRefForm.Choose(NpId, NpName) then
  begin
    if AComponentNpId <> nil then
      AComponentNpId.Tag := NpId;
    if AEditNpName <> nil then
      AEditNpName.Text := NpName;
    Result := True;
  end
  else
    Result := False;
end;

class function TNPTypeRefForm.Choose(ATable: TOraQuery): boolean;
var
  NpId: integer;
  NpName: string;
begin
  Result := False;
  if TNPTypeRefForm.Choose(NpId, NpName) then
  begin
    if not Assigned(ATable) then
      ATable := TOraQuery.Create(nil);
    Application.CreateForm(TNPTypeRefForm, NPTypeRefForm);
    try
      ATable.SQL.Text := NPTypeRefForm.q.SQL.Text;
      ATable.MacroByName('price').Value := '';
      ATable.AddWhere(' np.id = :id ');
      _OpenQueryPar(ATable,
       ['id', NpId]);
    finally
      NPTypeRefForm.Free;
    end;
    Result := True;
  end;
end;

class function TNPTypeRefForm.Choose(ACod: integer; ACodType: TNpTypeCod; ATable: TOraQuery): boolean;
begin
  Result := False;
  Application.CreateForm(TNPTypeRefForm, NPTypeRefForm);
  try
    case ACodType of
      ncAvias:
        NPTypeRefForm.eCodAvias.Text := IntToStr(ACod);
      ncOptima:
        NPTypeRefForm.eCodoptima.Text := IntToStr(ACod);
      ncCodInt:
        NPTypeRefForm.eCodInt.Text := IntToStr(ACod);
      ncOil:
        NPTypeRefForm.eNum.Text := IntToStr(ACod);
      else
        raise Exception.Create('SetNpByCod: Введен необработанный AWhoisCod! Обратитесь разработчикам');
    end;
    NPTypeRefForm.bbSearch.Click;
    if NPTypeRefForm.q.IsEmpty then
      Exit
    else
    begin
      if not Assigned(ATable) then
        ATable := TOraQuery.Create(nil);
      ATable.SQL.Text := NPTypeRefForm.q.SQL.Text;
      ATable.MacroByName('price').Value := '';
      ATable.AddWhere(' np.id = :id ');
      ATable.Close;
      _OpenQueryPar(ATable,
       ['id', NPTypeRefForm.q.FieldByName('id').AsInteger]);
      Result := True;
    end;
  finally
    NPTypeRefForm.Free;
  end;
end;

end.
