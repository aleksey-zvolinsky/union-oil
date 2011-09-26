unit PrihTrans;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  EditBase, StdCtrls, Buttons, ExtCtrls, ToolEdit, Mask, Db, DBTables,
  MemTable, Grids, DBGridEh, MemDS, DBAccess, Ora, PrihTransDoc, uOilQuery,
  Menus, RXCtrls{$IFDEF VER150},Variants, uOilStoredProc{$ENDIF};

type
  TPrihTransForm = class(TEditBaseForm)
    Panel1: TPanel;
    dbg: TDBGridEh;
    mt: TMemoryTable;
    mtID: TIntegerField;
    mtINST: TIntegerField;
    mtTANK_NUM: TStringField;
    mtTANK_TYPE: TIntegerField;
    mtZD_NAKL: TStringField;
    mtDENSITY: TFloatField;
    mtTEMPERATURE: TFloatField;
    mtNP_COUNT: TFloatField;
    mtWATER_COUNT: TFloatField;
    mtTANK_TYPE_NAME: TStringField;
    mtNP_TYPE_NAME: TStringField;
    mtZRD_ID: TIntegerField;
    mtZRD_INST: TIntegerField;
    mtNP_TYPE: TIntegerField;
    mtSTATE: TStringField;
    ds: TDataSource;
    Panel4: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    edNum: TEdit;
    deDate: TDateEdit;
    Panel7: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    sbClearGTD: TSpeedButton;
    sbClearDog: TSpeedButton;
    ceGTD: TComboEdit;
    ceDog: TComboEdit;
    Panel8: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    ceZavod: TComboEdit;
    ceDep: TComboEdit;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Label1: TLabel;
    cePart: TComboEdit;
    Label2: TLabel;
    Label5: TLabel;
    lblPartDate: TLabel;
    lblNpType: TLabel;
    Label6: TLabel;
    deDateStat: TDateEdit;
    mtLEVEL_MM: TFloatField;
    mtPV: TFloatField;
    mtREZ_ID: TIntegerField;
    mtREZ_INST: TIntegerField;
    mtREZ_NUM: TStringField;
    sbAdd: TSpeedButton;
    sbDel: TSpeedButton;
    Label14: TLabel;
    ceRailStat: TComboEdit;
    Label11: TLabel;
    sbCert: TSpeedButton;
    Label12: TLabel;
    sbDocuments: TSpeedButton;
    mtDET2_ID: TIntegerField;
    mtDET2_INST: TIntegerField;
    mtCert: TMemoryTable;
    mtCertID: TIntegerField;
    mtCertINST: TIntegerField;
    mtCertSTATE: TStringField;
    mtCertNAME: TStringField;
    mtCertDATE_: TDateField;
    qCert: TOilQuery;
    mtZAVOD_COUNT: TFloatField;
    mtFULL_COUNT: TFloatField;
    pmPart: TPopupMenu;
    sbPartCreate: TRxSpeedButton;
    qNextPart: TOilQuery;
    pm: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    sbMove: TSpeedButton;
    mtCHECKED: TIntegerField;
    pnlMove: TPanel;
    sbCheckAll: TSpeedButton;
    sbUncheckAll: TSpeedButton;
    pmMove: TPopupMenu;
    RxSpeedButton1: TRxSpeedButton;
    miExisting: TMenuItem;
    miSplit: TMenuItem;
    Label13: TLabel;
    cePartFrom: TComboEdit;
    Label15: TLabel;
    cePartTo: TComboEdit;
    Edit1: TEdit;
    edSearch: TEdit;
    function CountLiveTanks: integer;
    procedure MoveTanks(p_Id,p_Inst: integer);
    function SaveHead(p_New: Boolean): integer;
    procedure Init; override;
    procedure Test; override;
    procedure Save; override;
    procedure FillPMPart;
    procedure AutoCreatePart(Sender: TObject);
    procedure ceZavodButtonClick(Sender: TObject);
    procedure ceDepButtonClick(Sender: TObject);
    procedure ceGTDButtonClick(Sender: TObject);
    procedure ceDogButtonClick(Sender: TObject);
    procedure cePartButtonClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgColumns3EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure ceRailStatButtonClick(Sender: TObject);
    procedure sbDocumentsClick(Sender: TObject);
    procedure sbCertClick(Sender: TObject);
    procedure mtCertAfterInsert(DataSet: TDataSet);
    procedure mtAfterInsert(DataSet: TDataSet);
    procedure sbDelClick(Sender: TObject);
    procedure dbgGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure mtAfterPost(DataSet: TDataSet);
    procedure mtBeforeDelete(DataSet: TDataSet);
    procedure mtBeforePost(DataSet: TDataSet);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbMoveClick(Sender: TObject);
    procedure sbCheckAllClick(Sender: TObject);
    procedure miSplitClick(Sender: TObject);
    procedure miExistingClick(Sender: TObject);
    procedure cePartFromButtonClick(Sender: TObject);
    procedure cePartToButtonClick(Sender: TObject);
    procedure edSearchChange(Sender: TObject);
  private
    { Private declarations }
    DOG_ID, DOG_INST: integer;
    GTD_ID, GTD_INST: Variant;
    ZAVOD_ID, ZAVOD_INST, DEP_ID, DEP_INST: integer;
    PART_ID,PART_INST,NP_TYPE: integer;
    RAIL_ID,RAIL_INST: integer;
    PRIHOD_TRANSFER_ID: integer;
    PART_FROM_ID,PART_FROM_INST: integer;
    PART_TO_ID,PART_TO_INST: integer;
    SL_TANKS: TStringList;
    //Preparing: Boolean;
    FTransDoc: TPrihTransDocForm;
    procedure SetEnabled;
  public
    { Public declarations }
  end;

var
  PrihTransForm: TPrihTransForm;

implementation

{$R *.DFM}

uses Main,UDBFunc,ChooseOrg,uXMLForm,DogRef,PartRef,ExFunc,CheckList,
  RezervRef,MTEdit,OilStd,uStart,NpTypeRef,PrihRef,uMessageDlgExt;

{ TPrihTransForm }
//=================================================================================
procedure TPrihTransForm.Init;
begin
  inherited;
  mtCert.Open;
  if ID=0 then begin
    deDate.Date:=Date;
    ClearControls([lblPartDate,lblNpType]);
    DEP_ID:=MAIN_ORG.ID;
    DEP_INST:=MAIN_ORG.INST;
    ceDep.Text:=MAIN_ORG.NAME;
    DOG_ID:=0;
    DOG_INST:=0;
    ZAVOD_ID:=0;
    ZAVOD_INST:=0;
    PART_ID:=0;
    PART_INST:=0;
    NP_TYPE:=0;
    RAIL_ID:=0;
    RAIL_INST:=0;
    PRIHOD_TRANSFER_ID:=0;
    PART_FROM_ID:=0;
    PART_FROM_INST:=0;
    PART_TO_ID:=0;
    PART_TO_INST:=0;
    mt.Open;
  end else begin
    FillControls(q,
      [edNum, deDate, ceGtd,    ceDog,     ceZavod,     ceDep,   ceRailStat, deDateStat,    cePart,     lblPartDate, lblNpType],
      ['id', 'date_','gtd_num','dog_name','from_name','to_name','rail_name','date_station','part_name','dog_date',  'np_type_name']);
    FillControls(q,
      [FTransDoc.edActNum, FTransDoc.edUndersigned, FTransDoc.edDocuments, FTransDoc.cePred, cePartFrom,       cePartTo],
      ['act_num',          'undersigned',           'documents',           'pred_name',      'part_from_name', 'part_to_name']);
    FillVariants(q,
      [@GTD_ID,@GTD_INST,@FTransDoc.PRED_ID,@FTransDoc.PRED_INST],
      ['gtd_id','gtd_inst','pred_id','pred_inst']);
    FillIntegers(q,
      [@DOG_ID, @DOG_INST, @ZAVOD_ID, @ZAVOD_INST, @DEP_ID, @DEP_INST, @PART_ID, @PART_INST, @NP_TYPE, @RAIL_ID, @RAIL_INST, @PRIHOD_TRANSFER_ID],
      ['dog_id','dog_inst','from_id','from_inst',  'to_id', 'to_inst','part_id','part_inst','np_type','rail_id','rail_inst','prihod_transfer_id']);

    FillIntegers(q,
      [@PART_FROM_ID,  @PART_FROM_INST,  @PART_TO_ID,  @PART_TO_INST],
      ['part_from_id', 'part_from_inst', 'part_to_id', 'part_to_inst']);

    CopyToMemoryTable(q,mt,
      'det_id:id,det_inst:inst,tank_num,tank_type_name,zd_nakl,density,temperature,z_full_count:zavod_count,full_count,'+
      'water_count,zrd_id,zrd_inst,rez_id,rez_inst,rez_num,det2_id,det2_inst,level_mm,pv');

    _OpenQueryParOra(qCert,
      ['id',    ID,
       'inst',  INST]);

    CopyToMemoryTable(qCert,mtCert);
    SetEnabled;  
  end;
end;
//=================================================================================
function TPrihTransForm.SaveHead(p_New: Boolean): integer;
var new_id,old_id,transfer_id: integer;
begin
  old_id:=BoolTo_(p_New,0,ID);
  transfer_id:=BoolTo_(p_New,0,PRIHOD_TRANSFER_ID);
  new_id:=DBSaver.SaveRecord('OIL_PRIHOD',
    ['id',             old_id,
     'state',          'Y',
     'inst',           INST,
     'emp_id',         EMP_ID,
     'emp_inst',       INST,
     'date_',          deDate.Date,
     'oper_id',        241, // приход по перевалке
     'part_id',        PART_ID,
     'part_inst',      PART_INST,
     'date_otpr',      deDate.Date, // не понял на фига это поле ваще нужно
     'dost',           1, // жд-транспорт
     'rail_st',        RAIL_ID,
     'rail_inst',      RAIL_INST,
     'rasch_type',     null,
     'np_type',        NP_TYPE,
     'rash',           null,
     'rash_inst',      null,
     'from_',          ZAVOD_ID,
     'from_inst',      ZAVOD_INST,
     'to_',            DEP_ID,
     'to_inst',        DEP_INST,
     'dog',            DOG_ID,
     'dog_inst',       DOG_INST,
     'group_num',      null,
     'post_rn_num',    null,
     'post_nn_num',    null]);

  DBSaver.SaveRecord('OIL_PRIHOD_TRANSFER',
    ['id',             transfer_id,
     'inst',           INST,
     'state',          'Y',
     'prih_id',        new_id,
     'prih_inst',      INST,
     'act_num',        FTransDoc.edActNum.Text,
     'gtd_id',         GTD_ID,
     'gtd_inst',       GTD_INST,
     'undersigned',    FTransDoc.edUnderSigned.Text,
     'date_station',   deDateStat.Date,
     'documents',      FTransDoc.edDocuments.Text,
     'pred_id',        FTransDoc.PRED_ID,
     'pred_inst',      FTransDoc.PRED_INST]);
  result:=new_id;

  DBSaver.SaveRecord('OIL_PART',
    ['id',             PART_ID,
     'inst',           PART_INST,
     'from_',          PART_FROM_ID,
     'from_inst',      PART_FROM_INST,
     'to_',            PART_TO_ID,
     'to_inst',        PART_TO_INST]);
end;
//=================================================================================
function TPrihTransForm.CountLiveTanks: integer;
var bm: string;
begin
  result:=0;
  mt.DisableControls;
  bm:=mt.Bookmark;
  try
    mt.First;
    while not mt.Eof do begin
      if mt.FieldByName('state').AsString='Y' then
        inc(result);
      mt.Next;
    end;
  finally
    mt.Bookmark:=bm;
    mt.EnableControls;
  end;
end;
//=================================================================================
procedure TPrihTransForm.Save;
var
  det_id: real;
begin
  if CountLiveTanks=0 then begin
    if MessageDlgExt(TranslateText('Приход не может существовать без цистерн'),
      mtConfirmation,
      [TranslateText('Удалить приход'),TranslateText('Продолжить редактирование')])=1
    then begin
      _ExecSqlOra(Format(
        'update oil_prihod set state=''N'' where id=%d and inst=%d',
        [ID,INST]));
      exit;
    end else begin
      raise exception.create(TranslateText('Сохранение отменено'));
    end;
  end;

  ID:=SaveHead(false);
  mt.DisableControls;
  try
    mt.First;
    while not mt.Eof do begin
      det_id:=DBSaver.SaveRecord('OIL_PRIH_DET',
        ['id',                   mt['id'],
         'state',                mt['state'],
         'inst',                 mt['inst'],
         'prihod_id',            ID,
         'nakl',                 mt['zd_nakl'],
         'tank',                 mt['tank_num'],
         'tank_type',            mt['tank_type_name'],
         'doc_count',            mt['zavod_count'],
         'fact_count',           mt['full_count'],
         'ned_norm_ub',          0,
         'ned_norm_er',          0,
         'ned_post',             0,
         'ned_rail',             0,
         'izl_norm',             0,
         'izl_post',             0,
         'rez',                  mt['rez_id'],
         'rez_inst',             mt['rez_inst'],
         'is_digital_weight',    0,
         'tech_loss',            0
        ]);

      DBSaver.SaveRecord('OIL_PRIH_DET_TRANSFER',
        ['id',                   mt['det2_id'],
         'inst',                 INST, //mt['det2_inst'],
         'state',                mt['state'],
         'prih_det_id',          det_id,
         'prih_det_inst',        mt['inst'],
         'zrd_id',               mt['zrd_id'],
         'zrd_inst',             mt['zrd_inst'],
         'level_mm',             mt['level_mm'],
         'pv',                   mt['pv'],
         'density',              mt['density'],
         'temperature',          mt['temperature'],
         'water_count',          mt['water_count']]);
      mt.Next;
    end;
  finally
    mt.EnableControls;
  end;

  mtCert.First;
  while not mtCert.Eof do begin
    if not VarIsNull(mt['id']) or (mt['state']='Y') then begin
    // если запись только что вставили и сразу же удалили, не заносить её в базу
      DBSaver.SaveRecord('OIL_PRIHOD_CERT',
        ['id',           mtCert['id'],
         'inst',         mtCert['inst'],
         'state',        mtCert['state'],
         'prih_id',      ID,
         'prih_inst',    INST,
         'name',         mtCert['name'],
         'date_',        mtCert['date_']]);
    end;
    mtCert.Next;
  end;
end;
//=================================================================================
procedure TPrihTransForm.Test;
begin
  if (GTD_ID=0) and (DOG_ID=0) then
    raise exception.create(TranslateText('Должен быть введен ГТД или договор'));
  if deDateStat.Date=0 then
    raise exception.create(TranslateText('Не введена дата прихода на станцию'));
  if PART_ID=0 then
    raise exception.create(TranslateText('Не введена партия'));
  if RAIL_ID=0 then
    raise exception.create(TranslateText('Не введена станция'));
  if (mt.RecordCount=0) and (ID=0) then
    raise exception.create(TranslateText('Не введено ни одной цистерны'));
  if PART_FROM_ID=0 then
    raise exception.create(TranslateText('Не определен владелец товара'));
  if PART_TO_ID=0 then
    raise exception.create(TranslateText('Не определен конечный получатель'));
  mt.DisableControls;
  try
    mt.First;
    while not mt.Eof do begin
      if mtREZ_ID.AsInteger=0 then
        raise exception.create(TranslateText('Не введен резервуар'));
      mt.Next;
    end;
  finally
    mt.EnableControls;
  end;
end;
//=================================================================================
procedure TPrihTransForm.ceZavodButtonClick(Sender: TObject);
var
  vId,vInst:integer;
  vName:string;
begin
  if ChooseOrg.CaptureOrg(1,0,0,'yyy',vId,vInst,vName) then begin
    ceZavod.Text:=vName;
    ceZavod.Hint:=vName;
    ZAVOD_ID:=vId;
    ZAVOD_INST:=vInst;
  end;
end;
//=================================================================================
procedure TPrihTransForm.ceDepButtonClick(Sender: TObject);
var
  vId,vInst:integer;
  vName:string;
begin
  if ChooseOrg.CaptureOrg(1,0,0,'yyy',vId,vInst,vName) then begin
    ceDep.Text:=vName;
    ceDep.Hint:=vName;
    DEP_ID:=vId;
    DEP_INST:=vInst;
  end;
end;
//=================================================================================
procedure TPrihTransForm.ceGTDButtonClick(Sender: TObject);
var Form: TXMLForm;
begin
  Form:=GetXMLFormAsFilter('gtdref');
  if Form.ShowModal=mrOk then begin
    GTD_ID:=Form.FQuery['id'];
    GTD_INST:=Form.FQuery['inst'];
    ceGTD.Text:=Form.FQuery['num'];
    ceGTD.hint:=ceGTD.Text;
    DOG_ID:=Form.FQuery['dog_id'];
    DOG_INST:=Form.FQuery['dog_inst'];
    ceDog.Text:=Form.FQuery['dog'];
    ZAVOD_ID:=Form.FQuery['from_id'];
    ZAVOD_INST:=Form.FQuery['from_inst'];
    ceZavod.Text:=Form.FQuery['from_name'];
    ceZavod.Hint:=ceZavod.Text;
    DEP_ID:=Form.FQuery['to_id'];
    DEP_INST:=Form.FQuery['to_inst'];
    ceDep.Text:=Form.FQuery['to_name'];
    ceDep.Hint:=ceDep.Text;
    SetEnabled;
  end;
  Form.Free;
end;
//=================================================================================
procedure TPrihTransForm.SetEnabled;
begin
  ceZavod.Enabled:=DOG_ID=0;
  ceDep.Enabled:=DOG_ID=0;
  ceDog.Enabled:=GTD_ID=0;
  sbClearDog.Enabled:=ceDog.Enabled;
end;
//===========================================================================
procedure TPrihTransForm.ceDogButtonClick(Sender: TObject);
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
procedure TPrihTransForm.cePartButtonClick(Sender: TObject);
var
  F: TPartRefForm;
begin
  F:=TPartRefForm.Create(Application);
  F.chCount.Checked:=false;
  F.cbNoPrih.Checked:=true;
  F.bbSearch.Click;
  if (F.ShowModal=mrOk) and (F.q.RecordCount<>0) then begin
    FillControls(F.q,
      [cePart,   lblPartDate,   lblNpType,      cePartFrom,       cePartTo],
      ['dog',    'dog_date',    'np_type_name', 'from_name',      'to_name']);
    lblNpType.Hint:=F.qNp_Type_Name.AsString;
    FillIntegers(F.q,
      [@PART_ID, @PART_INST, @NP_TYPE,  @PART_FROM_ID, @PART_FROM_INST, @PART_TO_ID, @PART_TO_INST],
      ['id',     'inst',     'np_type', 'from_',       'from_inst',     'to_',       'to_inst']);

    sbPartCreate.Enabled:=false;
  end;
end;
//===========================================================================
procedure TPrihTransForm.sbAddClick(Sender: TObject);
begin
  inherited;
  if PART_ID=0 then
    raise exception.create(TranslateText('Не определена партия'));
  ChooseTankList(deDate.Date, 0, 0, NP_TYPE, GTD_ID, GTD_INST, SL_TANKS.CommaText, mt);
end;
//===========================================================================
procedure TPrihTransForm.FormCreate(Sender: TObject);
begin
  inherited;
  SL_TANKS:=TStringList.Create;
  FTransDoc:=TPrihTransDocForm.Create(Application);
  FillPMPart;
end;
//===========================================================================
procedure TPrihTransForm.dbgColumns3EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  F: TRezervRefForm;
begin
  if mt.state=dsBrowse then mt.Edit;
  if PART_ID=0 then
    raise exception.create(TranslateText('Не определена партия!'));
  F:=TRezervRefForm.Create(Application);
  F.ceNpType.Tag:=NP_TYPE;
  F.ceNpType.Text:=lblNpType.Caption;
  F.bbOk.Visible:=true;
  if F.ShowModal=mrOk then begin
    mtREZ_ID.AsInteger:=F.q['id'];
    mtREZ_INST.AsInteger:=F.q['inst'];
    mtREZ_NUM.AsString:=F.q['num'];
  end;
  F.Free;
end;
//===========================================================================
procedure TPrihTransForm.ceRailStatButtonClick(Sender: TObject);
begin
  XMLChoose('railstatref',RAIL_ID,RAIL_INST,ceRailStat);
end;
//===========================================================================
procedure TPrihTransForm.sbDocumentsClick(Sender: TObject);
begin
  FTransDoc.ShowModal;
end;
//===========================================================================
procedure TPrihTransForm.sbCertClick(Sender: TObject);
begin
  EditMT(mtCert,TranslateText('Сертификаты'));
end;
//===========================================================================
procedure TPrihTransForm.mtCertAfterInsert(DataSet: TDataSet);
begin
  inherited;
  mtCert['state']:='Y';
  mtCert['inst']:=INST;
  mtCert['date_']:=deDate.Date;
end;
//===========================================================================
procedure TPrihTransForm.mtAfterInsert(DataSet: TDataSet);
begin
  inherited;
  mt['state']:='Y';
  mt['inst']:=INST;
end;
//===========================================================================
procedure TPrihTransForm.sbDelClick(Sender: TObject);
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
//===========================================================================
procedure TPrihTransForm.dbgGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if mt['state']='N' then AFont.Color:=clRed;
end;
//===========================================================================
procedure TPrihTransForm.mtAfterPost(DataSet: TDataSet);
var tank: string;
begin
  inherited;
  tank:=mtTANK_NUM.AsString;
  if SL_TANKS.IndexOf(tank)=-1 then
    SL_TANKS.Add(tank);
end;
//===========================================================================
procedure TPrihTransForm.mtBeforeDelete(DataSet: TDataSet);
var n: integer;
begin
  inherited;
  n:=SL_TANKS.IndexOf(mtTANK_NUM.AsString);
  if n<>-1 then
    SL_TANKS.Delete(n);
end;
//===========================================================================
procedure TPrihTransForm.mtBeforePost(DataSet: TDataSet);
begin
  inherited;
  mt.FieldByName('np_count').AsFloat:=mt.FieldByName('full_count').AsFloat-mt.FieldByName('water_count').AsFloat;
end;
//===========================================================================
procedure TPrihTransForm.FillPMPart;
var
  s,name: string;
  i: integer;
  sl: TStringList;
  mi: TMenuItem;
begin
  s:=ReadOilVar('PVL_NP_TYPE');
  if s='' then s:='117,2975,46';
  sl:=TStringList.Create;
  sl.CommaText:=s;
  for i:=0 to sl.Count-1 do begin
    name:=nvl(GetSqlValue('select name from oil_np_type where id='+sl[i]),'');
    if name<>'' then begin
      mi:=TMenuItem.Create(pmPart);
      mi.Caption:=name;
      mi.Tag:=StrToInt(sl[i]);
      mi.OnClick:=AutoCreatePart;
      pmPart.Items.Add(mi);
    end;
  end;
  mi:=TMenuItem.Create(pmPart);
  mi.Caption:=TranslateText('Другой тип НП');
  mi.Tag:=0;
  mi.OnClick:=AutoCreatePart;
  pmPart.Items.Add(mi);
  sl.Free;
end;
//===========================================================================
procedure TPrihTransForm.AutoCreatePart(Sender: TObject);
var
  NpTypeId: integer;
  dog_name, NpTypeName, prefix, prfxSQL: string;
  F: TNpTypeRefForm;
begin
  if PART_FROM_ID = 0 then raise exception.create(TranslateText('Сначала нужно определить собственника!'));
  if ZAVOD_ID     = 0 then raise exception.create(TranslateText('Сначала нужно определить завод!'));
  if DEP_ID       = 0 then raise exception.create(TranslateText('Сначала нужно определить подразделение!'));
  NpTypeId := (Sender as TMenuItem).Tag;
  if NpTypeId <> 0 then
    NpTypeName := ReplaceSubstr((Sender as TMenuItem).Caption,'&','')
  else begin
    F := TNpTypeRefForm.Create(Application);
    try
      if (F.ShowModal = mrOk) and (F.q.RecordCount > 0) then begin
        NpTypeId   := F.q['id'];
        NpTypeName := F.q['name'];
      end else
        exit;
    finally
      F.Free;
    end;
  end;

  //Фомуємо і'мя партії: префікс + номер
  prfxSQL := 'select nvl(det.shortname, ''---'')' +
             '  from oil_org_det det, oil_org o' +
             ' where o.state = ''Y'' and det.state(+)=''Y''' +
             '   and o.id = det.org_id(+)' +
             '   and o.id = :org_id';
  prefix := getSQLValueParSimple(prfxSQL, ['org_id', PART_FROM_ID]);       //1 - власник товару
  prefix := prefix + getSQLValueParSimple(prfxSQL, ['org_id', ZAVOD_ID]);  //2 - завод-виробник
  prefix := prefix + getSQLValueParSimple(prfxSQL, ['org_id', DEP_ID]);    //3 - вантажовідправник
  _OpenQueryParOra(qNextPart,['prefix',prefix]);                           //4 - номер партії
  dog_name := prefix + qNextPart.FieldByName('num').AsString;

  StartSqlOra;
  try
    PART_ID:=DBSaver.SaveRecord('OIL_PART',
      ['inst',                 INST,
       'state',                'Y',
       'dog',                  dog_name,
       'dog_date',             deDate.Date,
       'from_',                ZAVOD_ID,
       'from_inst',            ZAVOD_INST,
       'comm',                 TranslateText('Автоматически заведенная партия'),
       'np_type',              NpTypeId,
       'base_',                0,
       'dim_id',               2,
       'ss',                   0,
       'price',                0,
       'price_kp',             0,
       'dor_sbor',             0,
       'own_goods',            'S',
       'to_',                  INST,
       'to_inst',              INST,
       'is_barter',            0,
       'goal_part_type',       23,
       'base_litr',            0,
       'ud_weight',            0]);
  except
    on E: Exception do begin
      RollbackSqlOra;
      raise exception.create(E.Message);
    end;
  end;

  PART_INST            := INST;
  NP_TYPE              := NpTypeId;
  cePart.Text          := dog_name;
  lblPartDate.Caption  := DateToStr(deDate.Date);
  lblNpType.Caption    := NpTypeName;
  lblNpType.Hint       := NpTypeName;
  sbPartCreate.Enabled := false;
end;
//===========================================================================
procedure TPrihTransForm.N2Click(Sender: TObject);
begin
  UpdateFullMt(mt,'temperature');
end;
//===========================================================================
procedure TPrihTransForm.N3Click(Sender: TObject);
begin
  UpdateFullMt(mt,'density');
end;
//===========================================================================
procedure TPrihTransForm.N4Click(Sender: TObject);
begin
  UpdateFullMt(mt,'rez_id,rez_inst,rez_num');
end;
//===========================================================================
procedure TPrihTransForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult<>mrOk then
    if MessageDlg(TranslateText('Вы уверены, что хотите выйти без сохранения изменений?'),mtWarning,[mbYes,mbNo],0)=mrNo then
      Action:=caNone
    else ModalResult:=mrCancel;
end;
//===========================================================================
procedure TPrihTransForm.sbMoveClick(Sender: TObject);
var MoveMode: Boolean;
begin
  MoveMode:=sbMove.Down;
  Panel1.Enabled:=not MoveMode;
  dbg.Columns[0].Visible:=MoveMode;
  sbDel.Enabled:=not MoveMode;
  sbAdd.Enabled:=not MoveMode;
  pnlMove.Visible:=MoveMode;
  if MoveMode then sbUncheckAll.Click;
end;
//===========================================================================
procedure TPrihTransForm.sbCheckAllClick(Sender: TObject);
begin
  UpdateFullMt(mt,'checked',[(Sender as TSpeedButton).Tag]);
end;
//===========================================================================
procedure TPrihTransForm.MoveTanks(p_Id,p_Inst: integer);
var bm: string;
begin
  StartSqlOra;
  mt.DisableControls;
  try
    mt.First;
    while not mt.Eof do begin
      if (mt.FieldByName('id').AsInteger<>0) and (mt['checked']=1) then begin
        _ExecSqlOra(Format(
          'update oil_prih_det set prihod_id=%d,inst=%d where id=%d and inst=%d',
          [p_Id,p_Inst,mt.FieldByName('id').AsInteger,mt.FieldByName('inst').AsInteger]));
        bm:=mt.Bookmark;
        mt.Delete;
        if mt.RecordCount>0 then
          mt.Bookmark:=bm;
      end else
        mt.Next;
    end;
    mt.First;
  finally
    mt.EnableControls;
  end;
end;
//===========================================================================
procedure TPrihTransForm.miExistingClick(Sender: TObject);
var
  F: TPrihRefForm;
  PrihId,PrihInst: integer;
  sDate: string;
begin
  F:=TPrihRefForm.Create(Application);
  try
    if (F.ShowModal=mrOk) and (F.q.RecordCount>0) then begin
      if F.q.FieldByName('prihod_transfer_id').AsInteger=0 then
        raise exception.create(TranslateText('Должен быть выбран приход по перевалке!'));
      if F.q.FieldByName('np_type').AsInteger<>NP_TYPE then
        raise exception.create(TranslateText('Типы нефтепродуктов должны совпадать!'));
      PrihId:=F.q['id']; PrihInst:=F.q['inst'];
      sDate:=F.q.FieldByName('date_').AsString;
      if (PrihId=ID) and (PrihInst=INST) then
        raise exception.create(TranslateText('Ну и зачем же переносить цистерны в этот же самый приход? :-)'));
      if MessageDlgExt(
           Format(TranslateText('Вы уверены, что хотите перенести цистерны в приход №%d от %s?'),
             [PrihId,sDate]),
           mtWarning,
           [TranslateText('Да, конечно!'),TranslateText('Нет, ни за что!')],1)=1
      then
        MoveTanks(PrihId,PrihInst);
    end;
  finally
    F.Free;
  end;
end;
//===========================================================================
procedure TPrihTransForm.miSplitClick(Sender: TObject);
var newid: integer;
begin
  if MessageDlgExt(TranslateText('Вы уверены, что хотите разделить приход')+#13#10+TranslateText('и перенести отмеченные цистерны?'),
       mtWarning,
       [TranslateText('Да, конечно!'),TranslateText('Нет, ни за что!')],1)=2
  then
    exit;
  StartSqlOra;
  newid:=SaveHead(true);
  MoveTanks(newid,INST);
  MessageDlgExt(Format(TranslateText('Создан приход %d этой же датой и в него перенесены цистерны'),[newid]),
    mtInformation, [TranslateText('Спасибо')]);
end;
//===========================================================================
procedure TPrihTransForm.cePartFromButtonClick(Sender: TObject);
var
  vId,vInst:integer;
  vName:string;
begin
  if ChooseOrg.CaptureOrg(1,0,0,'yyy',vId,vInst,vName) then begin
    cePartFrom.Text:=vName;
    cePartFrom.Hint:=vName;
    PART_FROM_ID:=vId;
    PART_FROM_INST:=vInst;
  end;
end;
//===========================================================================
procedure TPrihTransForm.cePartToButtonClick(Sender: TObject);
var
  vId,vInst:integer;
  vName:string;
begin
  if ChooseOrg.CaptureOrg(1,0,0,'yyy',vId,vInst,vName) then begin
    cePartTo.Text:=vName;
    cePartTo.Hint:=vName;
    PART_TO_ID:=vId;
    PART_TO_INST:=vInst;
  end;
end;
//===========================================================================
procedure TPrihTransForm.edSearchChange(Sender: TObject);
begin
  if SearchMtRecord(mt,'tank_num',edSearch.Text,true) then
    edSearch.Font.Color:=clBlack
  else
    edSearch.Font.Color:=clRed
end;

//===========================================================================
end.
