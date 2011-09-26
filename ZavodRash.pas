unit ZavodRash;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  EditBase, Db, MemDS, DBAccess, Ora, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGridEh, DBTables, MemTable, ToolEdit, Mask, uOilQuery, Menus;

type
  TZavodRashForm = class(TEditBaseForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    edNum: TEdit;
    Label2: TLabel;
    deDate: TDateEdit;
    Label3: TLabel;
    ceGTD: TComboEdit;
    Label4: TLabel;
    ceDog: TComboEdit;
    sbClearGTD: TSpeedButton;
    sbClearDog: TSpeedButton;
    Label5: TLabel;
    ceZavod: TComboEdit;
    sbClearZavod: TSpeedButton;
    Label6: TLabel;
    ceDep: TComboEdit;
    sbClearDep: TSpeedButton;
    mt: TMemoryTable;
    ds: TDataSource;
    mtID: TIntegerField;
    mtINST: TIntegerField;
    mtSTATE: TStringField;
    mtTANK_NUM: TStringField;
    mtZD_NAKL: TStringField;
    mtTANK_TYPE: TIntegerField;
    mtTANK_TYPE_NAME: TStringField;
    mtNP_TYPE: TIntegerField;
    mtNP_TYPE_NAME: TStringField;
    mtDENSITY: TFloatField;
    mtTEMPERATURE: TFloatField;
    mtNP_COUNT: TFloatField;
    mtWATER_COUNT: TFloatField;
    mtLEVEL_MM: TFloatField;
    mtPV: TFloatField;
    pm: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    edSearch: TEdit;
    procedure Init; override;
    procedure Test; override;
    procedure Save; override;
    procedure TestTank;
    procedure TestTankType;
    procedure ceGTDButtonClick(Sender: TObject);
    procedure sbClearGTDClick(Sender: TObject);
    procedure sbClearDogClick(Sender: TObject);
    procedure ceDogButtonClick(Sender: TObject);
    procedure DBGridEh1Columns5EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure DBGridEh1Columns8EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure mtBeforePost(DataSet: TDataSet);
    procedure mtAfterInsert(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mtBeforeInsert(DataSet: TDataSet);
    procedure bbOkClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure edSearchChange(Sender: TObject);
  private
    { Private declarations }
    GTD_ID, GTD_INST, DOG_ID, DOG_INST: integer;
    ZAVOD_ID, ZAVOD_INST, DEP_ID, DEP_INST: integer;
    Preparing: Boolean;
    PrevTankType,PrevNpType: integer;
    PrevDensity,PrevTemperature: real;
    PrevTankTypeName,PrevNpTypeName,PrevZdNakl: string;
    procedure SetEnabled;
  public
    { Public declarations }
  end;

var
  ZavodRashForm: TZavodRashForm;

implementation

{$R *.DFM}

uses uXMLForm,DogRef,Main,NpTypeRef,ExFunc,uDbFunc;
//===========================================================================
procedure TZavodRashForm.ceGTDButtonClick(Sender: TObject);
var Form: TXMLForm;
begin
  Form:=GetXMLFormAsFilter('gtdref');
  if Form.ShowModal=mrOk then begin
    GTD_ID:=Form.FQuery['id'];
    GTD_INST:=Form.FQuery['inst'];
    ceGTD.Text:=Form.FQuery['num'];
    DOG_ID:=Form.FQuery['dog_id'];
    DOG_INST:=Form.FQuery['dog_inst'];
    ceDog.Text:=Form.FQuery['dog'];
    ZAVOD_ID:=Form.FQuery['from_id'];
    ZAVOD_INST:=Form.FQuery['from_inst'];
    ceZavod.Text:=Form.FQuery['from_name'];
    DEP_ID:=Form.FQuery['to_id'];
    DEP_INST:=Form.FQuery['to_inst'];
    ceDep.Text:=Form.FQuery['to_name'];
    SetEnabled;
  end;
  Form.Free;
end;
//===========================================================================
procedure TZavodRashForm.SetEnabled;
begin
  ceZavod.Enabled:=DOG_ID=0;
  ceDep.Enabled:=DOG_ID=0;
  sbClearZavod.Enabled:=ceZavod.Enabled;
  sbClearDep.Enabled:=ceDep.Enabled;
  ceDog.Enabled:=GTD_ID=0;
  sbClearDog.Enabled:=ceDog.Enabled;
end;
//===========================================================================
procedure TZavodRashForm.sbClearGTDClick(Sender: TObject);
begin
  inherited;
  GTD_ID:=0; GTD_INST:=0;
  ceGTD.Clear;
  SetEnabled;
end;
//===========================================================================
procedure TZavodRashForm.sbClearDogClick(Sender: TObject);
begin
  inherited;
  DOG_ID:=0; DOG_INST:=0;
  ceDog.Clear;
  SetEnabled;
end;
//===========================================================================
procedure TZavodRashForm.ceDogButtonClick(Sender: TObject);
var F: TDogRefForm;
begin
  F:=TDogRefForm.Create(Application);
  F.rbNo.Checked:=true;
  F.gbDogType.Enabled:=false;
  if F.ShowModal = mrOK then begin
    DOG_ID := F.q.FieldByName('id').AsInteger;
    DOG_INST := F.q.FieldByName('inst').AsInteger;
    ceDog.Text := F.q.FieldByName('dog').AsString;
    ZAVOD_ID:=F.q['from_'];
    ZAVOD_INST:=F.q['from_inst'];
    ceZavod.Text:=F.q['from_name'];
    DEP_ID:=F.q['to_'];
    DEP_INST:=F.q['to_inst'];
    ceDep.Text:=F.q['to_name'];
    SetEnabled;
  end;
end;
//===========================================================================
procedure TZavodRashForm.Init;
begin
  inherited;
  if ID=0 then begin
    INST:=MAIN_ORG.INST;
    deDate.Date:=Date;
    DEP_ID:=MAIN_ORG.ID;
    DEP_INST:=MAIN_ORG.INST;
    ceDep.Text:=MAIN_ORG.NAME;
    mt.Open;
  end else begin
    if q.RecordCount=0 then
      raise exception.create(TranslateText('Сбой при инициализации: V_OIL_ZAVOD_RASH_FULL выдала 0 записей'));
    Preparing:=true;
    FillControls(q,
      [edNum, deDate, ceGTD,     ceDog, ceZavod,      ceDep],
      ['id',  'date_','gtd_num', 'dog', 'zavod_name', 'dep_name']
      );
    GTD_ID:=nvl(q['gtd_id'],0);
    GTD_INST:=nvl(q['gtd_inst'],0);
    DOG_ID:=q['dog_id'];
    DOG_INST:=q['dog_inst'];
    ZAVOD_ID:=q['zavod_id'];
    ZAVOD_INST:=q['zavod_inst'];
    DEP_ID:=q['dep_id'];
    DEP_INST:=q['dep_inst'];
    CopyToMemoryTable(q,mt,
      'zrd_id:id,zrd_inst:inst,tank_num,zd_nakl,tank_type,tank_type_name,'+
      'np_type,np_type_name,density,temperature,full_count:np_count,water_count,level_mm,pv');
    Preparing:=false;
    SetEnabled;
  end;
end;
//===========================================================================
procedure TZavodRashForm.DBGridEh1Columns5EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  id: integer;
  name: string;
begin
  inherited;
  if XMLChoose('tanktyperef',id,name) then begin
    if mt.State=dsBrowse then
      if mt.RecordCount>0 then mt.Edit
      else mt.Insert;
    mt['tank_type']:=id;
    mt['tank_type_name']:=name;
  end;
end;
//===========================================================================
procedure TZavodRashForm.DBGridEh1Columns8EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
var
  F: TNpTypeRefForm;
begin
  inherited;
  F:=TNpTypeRefForm.Create(Application);
  F.edName.Text:=TranslateText('мазут');
  F.bbSearch.Click;
  if F.ShowModal=mrOk then begin
    if mt.State=dsBrowse then
      if mt.RecordCount=0 then mt.Insert
      else mt.Edit;
    mt['np_type']:=F.qId.AsInteger;
    mt['np_type_name']:=F.qName.AsString;
  end;
end;
//===========================================================================
procedure TZavodRashForm.mtBeforePost(DataSet: TDataSet);
begin
  inherited;
  if Preparing then exit;
  TestTank;
  TestTankType;
  if trim(mt.FieldByName('tank_num').AsString)='' then
    raise exception.create(TranslateText('Не введен номер цистерны'));
  if trim(mt.FieldByName('zd_nakl').AsString)='' then
    raise exception.create(TranslateText('Не введена жд-накладная'));
  if mt.FieldByName('tank_type').AsInteger=0 then
    raise exception.create(TranslateText('Не введен тип цистерны'));
  if mt.FieldByName('np_type').AsInteger=0 then
    raise exception.create(TranslateText('Не введен тип НП'));
  if mt.FieldByName('density').AsFloat=0 then
    raise exception.create(TranslateText('Не введена плотность'));
  if mt.FieldByName('temperature').AsFloat=0 then
    raise exception.create(TranslateText('Не введена температура'));
  if mt.FieldByName('np_count').AsFloat=0 then
    raise exception.create(TranslateText('Не введено кол-во НП'));
  {if mt.FieldByName('water_count').AsFloat=0 then
    raise exception.create('Не введено кол-во воды');}
end;
//===========================================================================
procedure TZavodRashForm.mtAfterInsert(DataSet: TDataSet);
begin
  inherited;
  mt['state']:='Y';
  if Preparing then exit;
  mt['inst']:=MAIN_ORG.INST;
  if PrevTankType<>0 then begin
    mt['tank_type']:=PrevTankType;
    mt['tank_type_name']:=PrevTankTypeName;
    mt['np_type']:=PrevNpType;
    mt['np_type_name']:=PrevNpTypeName;
    mt['density']:=PrevDensity;
    mt['temperature']:=PrevTemperature;
    mt['zd_nakl']:=PrevZdNakl
  end;
end;
//===========================================================================
procedure TZavodRashForm.Test;
begin
  if DOG_ID=0 then
    raise exception.create(TranslateText('Нужно ввести договор или ГТД'));
  if mt.RecordCount=0 then
    raise exception.create(TranslateText('Не введено ни одной цистерны'));
end;
//===========================================================================
procedure TZavodRashForm.Save;
begin
  mt.DisableControls;
  mt.First;
  try
    ID:=DBSaver.SaveRecord('OIL_ZAVOD_RASH',
      ['id',               ID,
       'inst',             INST,
       'state',            'Y',
       'date_',            deDate.Date,
       'zavod_id',         ZAVOD_ID,
       'zavod_inst',       ZAVOD_INST,
       'dep_id',           DEP_ID,
       'dep_inst',         DEP_INST,
       'gtd_id',           GTD_ID,
       'gtd_inst',         GTD_INST,
       'dog_id',           DOG_ID,
       'dog_inst',         DOG_INST
      ]);
    while not mt.Eof do begin
      DBSaver.SaveRecord('OIL_ZAVOD_RASH_DET',
        ['id',             mt['id'],
         'inst',           mt['inst'],
         'state',          mt['state'],
         'zr_id',          ID,
         'zr_inst',        INST,
         'tank_num',       mt['tank_num'],
         'tank_type',      mt['tank_type'],
         'zd_nakl',        mt['zd_nakl'],
         'np_type',        mt['np_type'],
         'density',        mt['density'],
         'level_mm',       mt['level_mm'],
         'pv',             mt['pv'],
         'temperature',    mt['temperature'],
         'np_count',       mt['np_count'],
         'water_count',    mt['water_count']
        ]);
      mt.Next;
    end;
  finally
    mt.EnableControls;
  end;
end;
//===========================================================================
procedure TZavodRashForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if mt.State<>dsBrowse then mt.Cancel;
  if ModalResult<>mrOk then
    if MessageDlg(TranslateText('Вы уверены, что хотите выйти без сохранения изменений?'),mtWarning,[mbYes,mbNo],0)=mrNo then
      Action:=caNone
    else ModalResult:=mrCancel;
end;
//===========================================================================
procedure TZavodRashForm.mtBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if Preparing then exit;
  if mt.RecordCount>0 then begin
    PrevTankType:=mt['tank_type'];
    PrevTankTypeName:=mt['tank_type_name'];
    PrevNpType:=mt['np_type'];
    PrevNpTypeName:=mt['np_type_name'];
    PrevDensity:=mt['density'];
    PrevTemperature:=mt['temperature'];
    PrevZdNakl:=mt['zd_nakl'];
  end;
end;
//===========================================================================
procedure TZavodRashForm.TestTank;
var n: integer;
begin
  n:=nvl(GetSqlValue(Format(
    ' select *' +
    ' from' +
    '   (select v.*,' +
    '      row_number() over (order by date_ desc, q_id desc) rnum' +
    '    from v_oil_tank_move v' +
    '    where tank_num=''%s''' +
    '      and date_<''%s''' +
    '   )' +
    ' where rnum=1',[mt['tank_num'],DateToStr(deDate.Date)])
    ),3);
  if n<>3 then
    raise exception.create(TranslateText('Цистерна ')+mt.FieldByName('tank_num').AsString+TranslateText(' уже была отпущена и не оприходована'));
end;
//===========================================================================
procedure TZavodRashForm.bbOkClick(Sender: TObject);
begin
  if mt.State in [dsInsert,dsEdit] then
    mt.Post;
  inherited;
end;
//===========================================================================
procedure TZavodRashForm.N2Click(Sender: TObject);
begin
  UpdateFullMt(mt,'temperature');
end;
//===========================================================================
procedure TZavodRashForm.N3Click(Sender: TObject);
begin
  UpdateFullMt(mt,'density');
end;
//===========================================================================
procedure TZavodRashForm.N4Click(Sender: TObject);
begin
  inherited;
  UpdateFullMt(mt,'np_type,np_type_name');
end;
//===========================================================================
procedure TZavodRashForm.TestTankType;
var
  type_id: integer;
  name: string;
begin
  name:=trim(ansilowercase(mt.FieldByName('tank_type_name').AsString));
  type_id:=nvl(GetSqlValue('select id from oil_tank_type where lower(name)='''+name+''''),0);
  if type_id=0 then
    raise exception.create(TranslateText('Введен несуществующий тип цистерны'))
  else
    mt['tank_type']:=type_id;
end;
//===========================================================================
procedure TZavodRashForm.edSearchChange(Sender: TObject);
begin
  if SearchMtRecord(mt,'tank_num',edSearch.Text,true) then
    edSearch.Font.Color:=clBlack
  else
    edSearch.Font.Color:=clRed
end;
//===========================================================================
end.
