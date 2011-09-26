unit CheckList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCommonForm, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, Db, DBTables,
  MemTable, MemDS, DBAccess, Ora, Math, uOilQuery;

type
  TCheckListForm = class(TCommonForm)
    Panel2: TPanel;
    Panel3: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Panel1: TPanel;
    db: TDBGridEh;
    Label1: TLabel;
    edSearch: TEdit;
    sbClearSearch: TSpeedButton;
    ds: TDataSource;
    sbCheckAll: TSpeedButton;
    SpeedButton4: TSpeedButton;
    q: TOilQuery;
    qPartRashPvl: TOilQuery;
    qTank: TOilQuery;
    procedure sbCheckAllClick(Sender: TObject);
    procedure qFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure edSearchChange(Sender: TObject);
    procedure sbClearSearchClick(Sender: TObject);
    procedure Init(
      p_Caption,p_Sql,p_MainField,p_Invisible,p_ColCaptions: string;
      p_FilterList: string = '');
  private
    { Private declarations }
    MAIN_FIELD: string;
    FILTER_LIST: string;
  public
    { Public declarations }
  end;

var
  CheckListForm: TCheckListForm;

procedure ChooseTankList(
  p_Date: TDateTime;
  p_ZrId,p_ZrInst,p_NpType: integer;
  p_GtdId,p_GtdInst: integer;
  p_FilterList: string;
  pp_MT: TMemoryTable);
procedure ChoosePartRashPvlList(
  p_Date: TDateTime;
  p_FromId,p_FromInst: integer;
  p_ToId,p_ToInst: integer;
  p_NpType: integer;  
  pp_MT: TMemoryTable);

implementation

{$R *.DFM}

uses uStart,UDbFunc, ExFunc;

{ TCheckListForm }
//==============================================================================
procedure TCheckListForm.Init(
  p_Caption,p_Sql,p_MainField,p_Invisible,p_ColCaptions: string;
  p_FilterList: string = '');
var
  i,n: integer;
  sl: TStringList;
begin
  Caption:=p_Caption;
  MAIN_FIELD:=p_MainField;
  FILTER_LIST:=p_FilterList;
  if q.Active then q.Close;
  q.Sql.Text:=p_Sql;
  q.Prepare;
  if q.FieldList.Find('CHECKED')=nil then begin
    q.Unprepare;
    q.Sql.Text:='select 1 as checked, q.* from ('+p_Sql+') q';
    q.Prepare;
  end;

  _OpenQueryOra(q);
  db.Columns[0].Checkboxes:=true;
  db.Columns[0].Width:=20;
  db.Columns[0].Title.Caption:=' ';
  db.Columns[0].KeyList.Add('1');
  db.Columns[0].KeyList.Add('0');

  for i:=1 to db.Columns.Count-1 do
    db.Columns[i].Visible:=pos(','+db.Columns[i].FieldName+',',','+UpperCase(p_Invisible)+',')=0;

  sl:=TStringList.Create;
  Str2StringList(p_Colcaptions,sl);
  n:=0;
  for i:=1 to db.Columns.Count-1 do begin
    if n>=sl.Count then break;
    if db.Columns[i].Visible then begin
      db.Columns[i].Title.Caption:=sl[n];
      inc(n);
    end;
  end;
  sl.Free;

  for i:=1 to q.Fields.Count-1 do
    q.Fields[i].ReadOnly:=true;

  if (MAIN_FIELD<>'') and (FILTER_LIST<>'') then q.Filtered:=true;
end;
//==============================================================================
procedure TCheckListForm.sbCheckAllClick(Sender: TObject);
var bm: string;
begin
  bm:=q.Bookmark;
  q.DisableControls;
  q.First;
  while not q.Eof do begin
    q.Edit;
    q.FieldByName('checked').Value:=(Sender as TSpeedButton).Tag;
    q.Post;
    q.Next;
  end;
  q.EnableControls;
  q.Bookmark:=bm;
end;
//==============================================================================
procedure TCheckListForm.qFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  if (MAIN_FIELD<>'') and (FILTER_LIST<>'') then
    Accept:=pos(','+q.FieldByName(MAIN_FIELD).AsString+',',','+FILTER_LIST+',')=0
  else
    Accept:=true;
end;
//==============================================================================
procedure TCheckListForm.edSearchChange(Sender: TObject);
begin
  if edSearch.Text='' then exit;
  q.DisableControls;
  q.First;
  while not q.Eof and (q.FieldByName(MAIN_FIELD).AsString<edSearch.Text) do
    q.Next;
  if copy(q.FieldByName(MAIN_FIELD).AsString,1,length(edSearch.Text))=edSearch.Text then
    edSearch.Font.Color:=clBlack
  else
    edSearch.Font.Color:=clRed;
  q.EnableControls;
end;
//==============================================================================
procedure TCheckListForm.sbClearSearchClick(Sender: TObject);
begin
  inherited;
  edSearch.Clear;
end;
//==============================================================================
procedure ChooseTankList(
  p_Date: TDateTime;
  p_ZrId,p_ZrInst,p_NpType: integer;
  p_GtdId,p_GtdInst: integer;
  p_FilterList: string;
  pp_MT: TMemoryTable);
var
  F: TCheckListForm;
  sql: string;
begin
  F:=TCheckListForm.Create(Application);
  DefineQParamsOra(F.qTank,
    ['date_',    p_Date,
     'zr_id',    p_ZrId,
     'zr_inst',  p_ZrInst,
     'np_type',  p_NpType,
     'gtd_id',   p_GtdId,
     'gtd_inst', p_GtdInst]);

  sql:=FullSqlTextOra(F.qTank);

  F.Init(TranslateText('Цистерны'),sql,'tank_num',
    'ID,INST,STATE,ZR_ID,ZR_INST,TANK_TYPE,DENSITY,TEMPERATURE,DATE_MOD,TANK_TYPE_NAME,NP_TYPE_NAME,NP_GRP,NP_GRP_NAME,RNUM',
    TranslateText('№ цистерны,ЖД накладная,Тип НП,НП брутто,Вода тонн'),
    p_FilterList);
  F.db.FooterRowCount:=1;
  F.db.sumlist.Active:=true;
  F.db.Columns[1].Footer.Value:=TranslateText('Итого');
  F.db.Columns[1].Footer.ValueType:=fvtStaticText;
  F.db.Columns[2].Footer.ValueType:=fvtCount;

  F.db.Columns[4].Footer.DisplayFormat:='0.000';
  F.db.Columns[4].Footer.FieldName:='FULL_COUNT';
  F.db.Columns[4].Footer.ValueType:=fvtSum;

  F.db.Columns[5].Footer.DisplayFormat:='0.000';
  F.db.Columns[5].Footer.FieldName:='WATER_COUNT';
  F.db.Columns[5].Footer.ValueType:=fvtSum;


  if F.ShowModal=mrOk then begin
    CopyToMemoryTable(F.q,pp_MT,
      'tank_num,tank_type,zd_nakl,density,temperature,'+
      'full_count:zavod_count,full_count,water_count,level_mm,pv,tank_type_name,np_type_name,np_type,'+
      'zrd_id,zrd_inst',
      'checked','1',false);
  end;
  F.Free;
end;
//==============================================================================
procedure ChoosePartRashPvlList(
  p_Date: TDateTime;
  p_FromId,p_FromInst: integer;
  p_ToId,p_ToInst: integer;
  p_NpType: integer;
  pp_MT: TMemoryTable);
var
  F: TCheckListForm;
  sql: string;
begin
  F:=TCheckListForm.Create(Application);
  DefineQParamsOra(F.qPartRashPvl,
    ['date_',           p_Date,
     'np_type',         p_NpType,
     'part_from_id',    p_FromId,
     'part_from_inst',  p_FromInst,
     'part_to_id',      p_ToId,
     'part_to_inst',    p_ToInst]);

  sql:=FullSqlTextOra(F.qPartRashPvl);

  F.Init(TranslateText('Партии'),sql,'part_name',
    'PART_ID,PART_INST,GTD_ID,GTD_INST',
    TranslateText('Партия,№ ГТД,Тонн (брутто),Остаток (брутто)'),
    '');
  F.db.FooterRowCount:=1;
  F.db.sumlist.Active:=true;
  F.db.Columns[1].Width:=60;
  F.db.Columns[2].Width:=120;
  F.db.Columns[1].Footer.Value:=TranslateText('Итого');
  F.db.Columns[1].Footer.ValueType:=fvtStaticText;

  F.db.Columns[3].Footer.DisplayFormat:='0.000';
  F.db.Columns[3].Footer.FieldName:='REST_FULL_TONN';
  F.db.Columns[3].Footer.ValueType:=fvtSum;

  if F.ShowModal=mrOk then begin
    CopyToMemoryTable(F.q,pp_MT,
      'part_id,part_inst,part_name,gtd_id,gtd_inst,gtd_num,full_count:pr_real_tonn,rest_full_tonn:pr_tonn',
      'checked','1',false);
  end;
  F.Free;
end;
//==============================================================================
end.
