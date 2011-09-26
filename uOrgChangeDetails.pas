unit uOrgChangeDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, Ora, uOilQuery, ActnList, Grids, DBGridEh,
  VirtualTable, DBTables, MemTable, uCommonForm, Menus, StdCtrls, Buttons,
  ExtCtrls, uHelpButton;

type
  TSelectionType = (stSelectAll,stUnselectAll,stInvertSelect);
  TOrgChangeDetails = class(TCommonForm)
    q: TOilQuery;
    grMain: TDBGridEh;
    ds: TOraDataSource;
    ac: TActionList;
    actChange: TAction;
    actSelectAll: TAction;
    actUnselectAll: TAction;
    actInvertSelect: TAction;
    vt: TVirtualTable;
    qOilOrgChange: TOilQuery;
    pBottom: TPanel;
    pm: TPopupMenu;
    miSelectAll: TMenuItem;
    miUnselectAll: TMenuItem;
    miInvertSelect: TMenuItem;
    OilHelpButton1: TOilHelpButton;
    pBtn: TPanel;
    bbChange: TBitBtn;
    bbCancel: TBitBtn;
    procedure actSelectAllExecute(Sender: TObject);
    procedure actUnselectAllExecute(Sender: TObject);
    procedure actInvertSelectExecute(Sender: TObject);
    procedure actChangeExecute(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Init();
    procedure ChangeDetails(ADepId, ACurrentValNum: integer);
    procedure ChangeSelection(AType: TSelectionType);
  public

  end;

function GetAzsParFirst(AId: integer):integer;  
var
  OrgChangeDetails: TOrgChangeDetails;

implementation
uses uDbFunc, OilStd, uExeSql, ExFunc;
{$R *.dfm}

procedure TOrgChangeDetails.Init();
begin
  if q.Active then q.Close;
  q.Open;
  if vt.Active then vt.Close;
  vt.Assign(q);
  q.Close;
  vt.AddField('TO_CHANGE',ftBoolean,0);
  vt.Open;
  Self.actUnselectAll.Execute;
end;

procedure TOrgChangeDetails.ChangeDetails(ADepId, ACurrentValNum: integer);
var
  NextValue, UpdSql: string;
begin
  if ACurrentValNum = 1 then
    NextValue := '2'
  else
    NextValue := '1';
  _OpenQueryPar(qOilOrgChange,
    ['ADepId', ADepId]);
  UpdSql := format('update %s set',[qOilOrgChange.FieldByName('table_name').AsString]);
  while not qOilOrgChange.Eof do
  begin
    UpdSql := UpdSql + format(' %s = ''%s'' ',
      [qOilOrgChange.FieldByName('field_name').AsString,
       qOilOrgChange.FieldByName('value' + NextValue).AsString]);
    qOilOrgChange.Next;
    if qOilOrgChange.Eof then
    begin
      UpdSql := UpdSql + ' where id = inst and id = :ADepId';
      _ExecSql(UpdSql,
        ['ADepId', ADepId]);
    end
    else
      UpdSql := UpdSql + ',';
  end;
end;

procedure TOrgChangeDetails.ChangeSelection(AType: TSelectionType);
begin
  vt.DisableControls;
  try
    vt.First;
    while not vt.Eof do
    begin
      vt.Edit;
      case AType of
        stSelectAll:
          vt.FieldByName('TO_CHANGE').AsBoolean := True;
        stUnselectAll:
          vt.FieldByName('TO_CHANGE').AsBoolean := False;
        stInvertSelect:
          vt.FieldByName('TO_CHANGE').AsBoolean := not vt.FieldByName('TO_CHANGE').AsBoolean;
      end;
      vt.Next;
    end;
  finally
    vt.EnableControls;
  end;
end;

procedure TOrgChangeDetails.actSelectAllExecute(Sender: TObject);
begin
  ChangeSelection(stSelectAll);
end;

procedure TOrgChangeDetails.actUnselectAllExecute(Sender: TObject);
begin
  ChangeSelection(stUnselectAll);
end;

procedure TOrgChangeDetails.actInvertSelectExecute(Sender: TObject);
begin
  ChangeSelection(stInvertSelect);
end;

procedure TOrgChangeDetails.actChangeExecute(Sender: TObject);
begin
  vt.DisableControls;
  try
    StartSql;
    vt.First;
    while not vt.Eof do
    begin
      if vt.FieldByName('TO_CHANGE').AsBoolean then
      begin
        ChangeDetails(
          vt.FieldByName('DEP_ID').AsInteger,
          vt.FieldByName('CURRENT_VALUE_NUM').AsInteger);
      end;
      vt.Next;
    end;
    CommitSql;
    _ExecSQLOra('begin dbms_mview.refresh(''V_CARD_AZS''); end;');
    Self.Init;
  finally
    vt.EnableControls;
  end;
end;

procedure TOrgChangeDetails.bbCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TOrgChangeDetails.FormShow(Sender: TObject);
begin
  Self.Init;
end;

procedure TOrgChangeDetails.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TOrgChangeDetails.FormCreate(Sender: TObject);
begin
  inherited;
  LoadSQLByForm(TForm(Self));
end;

function GetAzsParFirst(AId:integer):integer;
begin
  result := nvl(GetSqlValueParSimple('select value1 from oil_org_change where dep_id = :id and field_name=''PAR'' ',
    ['id', AId]),0);
end;

end.
