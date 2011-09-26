unit Raskred;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  EditBase, Db, MemDS, DBAccess, Ora, StdCtrls, Buttons, ExtCtrls,
  ToolEdit, Grids, DBGridEh, Mask, DBTables, MemTable,uOilQuery,uOilStoredProc
  {$IFDEF VER150},Variants{$ENDIF};

type
  TRaskredForm = class(TEditBaseForm)
    Panel1: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    edNum: TEdit;
    Label2: TLabel;
    deDate: TDateEdit;
    dbg: TDBGridEh;
    sbAdd: TSpeedButton;
    sbDel: TSpeedButton;
    Panel6: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblDate: TLabel;
    lblGtd: TLabel;
    Label8: TLabel;
    lblZavod: TLabel;
    Label9: TLabel;
    lblDep: TLabel;
    ceZavodRash: TComboEdit;
    Panel7: TPanel;
    Label6: TLabel;
    ceRailStat: TComboEdit;
    mt: TMemoryTable;
    ds: TOraDataSource;
    mtID: TFloatField;
    mtINST: TFloatField;
    mtTANK_NUM: TStringField;
    mtTANK_TYPE: TFloatField;
    mtZD_NAKL: TStringField;
    mtDENSITY: TFloatField;
    mtTEMPERATURE: TFloatField;
    mtNP_COUNT: TFloatField;
    mtWATER_COUNT: TFloatField;
    mtTANK_TYPE_NAME: TStringField;
    mtNP_TYPE_NAME: TStringField;
    mtZRD_ID: TFloatField;
    mtZRD_INST: TFloatField;
    mtNP_TYPE: TFloatField;
    mtSTATE: TStringField;
    mtLEVEL_MM: TFloatField;
    mtPV: TFloatField;
    mtZAVOD_COUNT: TFloatField;
    mtFULL_COUNT: TFloatField;
    edSearch: TEdit;
    procedure Init; override;
    procedure Test; override;
    procedure Save; override;
    procedure ceZavodRashButtonClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure mtAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure mtAfterPost(DataSet: TDataSet);
    procedure mtBeforeDelete(DataSet: TDataSet);
    procedure ceRailStatButtonClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure dbgGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure mtBeforePost(DataSet: TDataSet);
    procedure edSearchChange(Sender: TObject);
  private
    { Private declarations }
    ZR_ID, ZR_INST, RAIL_ID, RAIL_INST: integer;
    SL_TANKS: TStringList;
  public
    { Public declarations }
  end;

var
  RaskredForm: TRaskredForm;

implementation

{$R *.DFM}

uses ExFunc, uXMLForm, CheckList, RailStatRef, Main, uDBFunc;
//=================================================================================
procedure TRaskredForm.ceZavodRashButtonClick(Sender: TObject);
var Form: TXMLForm;
begin
  Form:=GetXMLFormAsFilter('zavodrashref');
  if Form.ShowModal=mrOk then begin
    ZR_ID:=Form.FQuery['id'];
    ZR_INST:=Form.FQuery['inst'];
    FillControls(Form.FQuery,
      [ceZavodRash, lblDate, lblGtd,    lblZavod,     lblDep],
      ['id',        'date_', 'gtd_num', 'zavod_name', 'dep_name']);
  end;
  Form.Free;
end;
//=================================================================================
procedure TRaskredForm.Init;
begin
  inherited;
  ClearControls([lblGTD, lblZavod, lblDep]);
  mt.Open;
  if ID<>0 then begin
    FillControls(q,
      [edNum, deDate, ceZavodRash, lblDate,            lblGtd,    lblZavod,     lblDep,     ceRailStat],
      ['id',  'date_', 'zr_id',    'zavod_rash_date',  'gtd_num', 'zavod_name', 'dep_name', 'rail_name']);
    ZR_ID:=q['zr_id'];
    ZR_INST:=q['zr_inst'];
    RAIL_ID:=nvl(q['rail_id'],0);
    RAIL_INST:=nvl(q['rail_inst'],0);

    CopyToMemoryTable(q,mt,
      'rkd_id:id,rkd_inst:inst,tank_num,tank_type,zd_nakl,density,temperature,full_count,'+
      'water_count,tank_type_name,np_type_name,zrd_id,zrd_inst,np_type,level_mm,pv');

  end else begin
    deDate.Date:=Date;
  end;
end;
//=================================================================================
procedure TRaskredForm.sbAddClick(Sender: TObject);
begin
  inherited;
  if ZR_ID=0 then
    raise exception.create(TranslateText('Сначала нужно определить отпуск с завода'));
  ChooseTankList(deDate.Date, ZR_ID, ZR_INST, 0, 0, 0, SL_TANKS.CommaText, mt);
end;
//=================================================================================
procedure TRaskredForm.mtAfterInsert(DataSet: TDataSet);
begin
  inherited;
  mtState.AsString:='Y';
  mtInst.AsInteger:=MAIN_ORG.INST;
end;
//=================================================================================
procedure TRaskredForm.FormCreate(Sender: TObject);
begin
  inherited;
  SL_TANKS:=TStringList.Create;
end;
//=================================================================================
procedure TRaskredForm.mtAfterPost(DataSet: TDataSet);
var tank: string;
begin
  inherited;
  tank:=mtTANK_NUM.AsString;
  if SL_TANKS.IndexOf(tank)=-1 then
    SL_TANKS.Add(tank);
end;
//=================================================================================
procedure TRaskredForm.mtBeforeDelete(DataSet: TDataSet);
var n: integer;
begin
  inherited;
  n:=SL_TANKS.IndexOf(mtTANK_NUM.AsString);
  if n<>-1 then
    SL_TANKS.Delete(n);
end;
//=================================================================================
procedure TRaskredForm.ceRailStatButtonClick(Sender: TObject);
begin
  XMLChoose('railstatref',RAIL_ID,RAIL_INST,ceRailStat);
end;
//=================================================================================
procedure TRaskredForm.Test;
begin
  if ZR_ID=0 then
    raise exception.create(TranslateText('Не введен отпуск с завода'));
  if RAIL_ID=0 then
    raise exception.create(TranslateText('Не введена станция'));
  if mt.RecordCount=0 then
    raise exception.create(TranslateText('Не введено ни одной цистерны'));
end;
//=================================================================================
procedure TRaskredForm.Save;
begin
  ID:=DBSaver.SaveRecord('OIL_RASKRED',
    ['ID',            ID,
     'INST',          INST,
     'STATE',         'Y',
     'DATE_',         deDate.Date,
     'ZR_ID',         ZR_ID,
     'ZR_INST',       ZR_INST,
     'RAIL_ID',       RAIL_ID,
     'RAIL_INST',     RAIL_INST
    ]);

  mt.DisableControls;
  try
    mt.First;
    while not mt.Eof do begin
      if not VarIsNull(mt['id']) or (mt['state']='Y') then
        DBSaver.SaveRecord('OIL_RASKRED_DET',
          ['ID',              mt['id'],
           'INST',            mt['inst'],
           'STATE',           mt['state'],
           'RASKRED_ID',      ID,
           'RASKRED_INST',    INST,
           'ZRD_ID',          mt['zrd_id'],
           'ZRD_INST',        mt['zrd_inst']
          ]);
      mt.Next;
    end;
  finally
    mt.EnableControls;
  end;
end;
//=================================================================================
procedure TRaskredForm.sbDelClick(Sender: TObject);
begin
  if mt.RecordCount=0 then exit;
  if (VarIsNull(mt['id'])) or (mt['id']=0) then mt.Delete
  else begin
    if mt.State=dsBrowse then mt.Edit;
    if mt['state']='Y' then mt['state']:='N'
    else mt['state']:='Y';
    mt.Post;
  end;
end;
//=================================================================================
procedure TRaskredForm.dbgGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if mt['state']='N' then AFont.Color:=clRed;
end;
//=================================================================================
procedure TRaskredForm.mtBeforePost(DataSet: TDataSet);
begin
  mt.FieldByName('np_count').AsFloat:=mt.FieldByName('full_count').AsFloat-mt.FieldByName('water_count').AsFloat;
end;
//=================================================================================
procedure TRaskredForm.edSearchChange(Sender: TObject);
begin
  if SearchMtRecord(mt,'tank_num',edSearch.Text,true) then
    edSearch.Font.Color:=clBlack
  else
    edSearch.Font.Color:=clRed
end;
//=================================================================================
end.
