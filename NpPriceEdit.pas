unit NpPriceEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EditBase, VirtualTable, DB, MemDS, DBAccess, Ora, uOilQuery,
  StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, Grids, DBGridEh, Menus,
  PrihSop, NPTypeRef, GridsEh;

type
  TNpPriceEditForm = class(TEditBaseForm)
    vt: TVirtualTable;
    deDateOn: TDateEdit;
    Panel1: TPanel;
    Grid: TDBGridEh;
    lblDateOn: TLabel;
    ds: TOraDataSource;
    sbDel: TSpeedButton;
    procedure GridEditButtonClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure GridKeyPress(Sender: TObject; var Key: Char);
    procedure vtBeforePost(DataSet: TDataSet);
  protected
    DATE_ON: TDateTime;
  private
    function GetVisibleCod: TNpTypeCod;
    procedure SetVisibleCod(const Value: TNpTypeCod);
    { Private declarations }
  public
    procedure Init; override;
    procedure Test; override;
    procedure Save; override;
    class function Edit(ADateOn:TDateTime; AInst: integer): Boolean; overload;
    property VisibleCod: TNpTypeCod read GetVisibleCod write SetVisibleCod;
  end;

var
  NpPriceEditForm: TNpPriceEditForm;

implementation

uses Main, UDbFunc;

{$R *.dfm}

{ TNpPriceEditForm }

function TNpPriceEditForm.GetVisibleCod: TNpTypeCod;
begin
  Result := CommonGetVisibleCod(Grid);
end;

procedure TNpPriceEditForm.Init;
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
end;

procedure TNpPriceEditForm.Save;
begin
  inherited;
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
      'PRICE', vt.FieldByName('PRICE').AsCurrency]);
    vt.Next;
  end;
end;

procedure TNpPriceEditForm.SetVisibleCod(const Value: TNpTypeCod);
begin
  CommonSetVisibleCod(Grid, Value);
end;

procedure TNpPriceEditForm.Test;
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
end;

procedure TNpPriceEditForm.GridEditButtonClick(Sender: TObject);
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

class function TNpPriceEditForm.Edit(ADateOn: TDateTime;
  AInst: integer): Boolean;
var
  F: TNpPriceEditForm;
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
                                                                                              	
procedure TNpPriceEditForm.sbDelClick(Sender: TObject);
begin
  inherited;
  if not vt.IsEmpty then
    vt.Delete;
end;

procedure TNpPriceEditForm.GridKeyPress(Sender: TObject; var Key: Char);
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

procedure TNpPriceEditForm.vtBeforePost(DataSet: TDataSet);
begin
  inherited;
  vt.FieldByName('ID').AsInteger := 0;
  vt.FieldByName('INST').AsInteger := 0;    
  vt.FieldByName('ORG_ID').AsInteger := INST;
  vt.FieldByName('ORG_INST').AsInteger := INST;  
end;

end.
