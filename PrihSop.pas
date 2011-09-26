unit PrihSop;
{ ����� ������� � ������� 2004 ����������
  ��������� ������� ������ �� ���������� ��������.
  ������������� ��� ����� � �������������� ������� �������������� ������.
  �������� ���������:
    � ���� ������ ���� ������ �������������� ������ (����� � ����� ���) ��������
    ��� ��������� ������� � OIL_PRIHOD, ������������ ���������� ��������� ����
    GROUP_NUM. ������ ������ � OIL_PRIHOD ������������� ���� � ������ ���� ������
    � OIL_PRIH_DET.
    ���� �������� � ������� ��������� ��� ������: ���� � OIL_PART, ���� �
    OIL_PRIHOD � ���� � OIL_PRIH_DET

  ��� ���������� ����� ������ �����������, ������ � ���������� �����������.
  � ������ ���� ��� �������, ������������ �� ��, ����� ��� ���������� ���
  ����������� (� �������������� ����������) ������ �� ������, ������� �������������
  ���������� � ���������� �������� ������������.
  ��������, ��� �������������� ��� ����������� ������ �� ������ � OIL_PART, ���
  ������� ��������������� ������������ ������ ���� ����.
  �����, ���� ��� ��������� ������� ��� ������ � ������� (�������� ��� �����������,
  ���� ��������), �� ����������� ��� ������.
  � �����, � ��� �� ���� � ���������� ����� ���������.
  ����� �������, ���� ������������ ����� � ��� � 50-� ��������� � ������� ����������
  �� ����� �������, �� ��������� � �������� ������ ���� ������ � OIL_PRIH_DET, �
  �� 50*3=150 ������� � ���� ��������.
  ��� ������������� ����� ������������ "������" ��������, � ��� ���������� ���������,
  ���������� �� ���. ��� ���������� � ��������� (��������, ���������, �� ���� � �.�.)
  ��� "�����������" �������� ���������� (OperIdOld,RezIdOld,RezInstOld � �.�.), �
  ��� ���������� � ����� - ���� � ���������������� ���������� � ���������� _OLD.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGridEh, Db, DBTables, MemTable, StdCtrls, Buttons,
  ToolEdit, Mask, Ora, Menus, ImgList, uHelpButton, MemDS, DBAccess,
  RXCtrls, uCommonForm,uOilQuery,uOilStoredProc{$IFDEF VER150},Variants{$ENDIF},
  NPTypeRef, GridsEh, DBGridEhGrouping;

type
   
  TPrihSopForm = class(TCommonForm)
    Panel1: TPanel;
    dbgrid: TDBGridEh;
    pnlTop: TPanel;
    mt: TMemoryTable;
    mtID: TFloatField;
    mtNP_TYPE: TStringField;
    mtNP_TYPE_ID: TFloatField;
    mtSHTUKI: TFloatField;
    mtSS: TFloatField;
    ds: TOraDataSource;
    mtDOG: TStringField;
    mtPART_ID: TFloatField;
    mtPART_INST: TFloatField;
    mtPRIH_DET_ID: TFloatField;
    sbDel: TSpeedButton;
    mtPLAN_ID: TFloatField;
    mtNP_TYPE_ID_OLD: TFloatField;
    mtSHTUKI_OLD: TFloatField;
    mtSS_OLD: TFloatField;
    mtPART_ID_OLD: TFloatField;
    mtPART_INST_OLD: TFloatField;
    mtSTATE: TStringField;
    pnlRekv: TPanel;
    lFrom: TLabel;
    ceFrom: TComboEdit;
    lTo: TLabel;
    ceTo: TComboEdit;
    pmPart: TPopupMenu;
    miSavePartPrefix: TMenuItem;
    OilHelpButton1: TOilHelpButton;
    qLoad: TOilQuery;
    mtSUM_SS: TFloatField;
    mtPRICE: TFloatField;
    mtPRICE_OLD: TFloatField;
    mtSUM_PRICE: TFloatField;
    Label7: TLabel;
    ceDogovor: TComboEdit;
    qAnParts: TOilQuery;
    mtUS_SUBGROUP_NAME: TStringField;
    Panel6: TPanel;
    Label8: TLabel;
    lblCount: TLabel;
    lblNoNds: TLabel;
    lblNds: TLabel;
    lblWithNds: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    sbClearDogovor: TSpeedButton;
    pmSave: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Label13: TLabel;
    lblSumPrice: TLabel;
    pButtons: TPanel;
    bbOk: TBitBtn;
    bbOkDop: TRxSpeedButton;
    bbCancel: TBitBtn;
    mtCODAVIAS: TIntegerField;
    mtCODOPTIMA: TIntegerField;
    qPrices: TOraQuery;
    mtCODINT: TIntegerField;
    Panel2: TPanel;
    pnlDoc: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edAct: TEdit;
    edActDate: TDateEdit;
    cbKOS: TComboBox;
    edPartPrefix: TEdit;
    pnlOper: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    ceOper: TComboEdit;
    ceRezerv: TComboEdit;
    pnlOptions: TPanel;
    cbCreatePart: TCheckBox;
    cbAutoPrice: TCheckBox;
    cbAutoPriceCentr: TCheckBox;
    procedure bbOkClick(Sender: TObject);
    procedure ceFromButtonClick(Sender: TObject);
    procedure ceOperButtonClick(Sender: TObject);
    procedure ceRezervButtonClick(Sender: TObject);
    procedure dbgridColumns1EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure sbDelClick(Sender: TObject);
    procedure dbgridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure dbgridKeyPress(Sender: TObject; var Key: Char);
    procedure dbgridColumnNpTypeEditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure mtBeforePost(DataSet: TDataSet);
    procedure mtAfterInsert(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbKOSKeyPress(Sender: TObject; var Key: Char);
    procedure miSavePartPrefixClick(Sender: TObject);
    procedure pmPartPopup(Sender: TObject);
    procedure cbKOSChange(Sender: TObject);
    procedure cbKOSDblClick(Sender: TObject);
    procedure ceFromKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure dbgridSortMarkingChanged(Sender: TObject);
    procedure mtCalcFields(DataSet: TDataSet);
    procedure AutoPriceClick(Sender: TObject);
    procedure ceDogovorButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbClearDogovorClick(Sender: TObject);
    procedure mtAfterPost(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure pnlOperDblClick(Sender: TObject);
    procedure ceToButtonClick(Sender: TObject);
    procedure edActDateChange(Sender: TObject);
    procedure miVisibleCodClick(Sender: TObject);
    procedure edActChange(Sender: TObject);
    procedure cbCreatePartClick(Sender: TObject);
  private
    FANPartsCount: integer;
    FInit: boolean;
    FLastNpField: string;
    procedure Test;
    procedure Save;
    procedure AfterSave;
    procedure Init;
    procedure ProcessAutoPrice;
    procedure SetOperation(p_Id: integer);
    procedure InitPartPrefix;
    procedure SavePartPrefix;
    procedure LoadPartList;
    procedure TestPrihodDecrease(p_Shtuki: integer);
    procedure SetNpFull(AName, AUsSubgroupName: string; ANpId, AUsSubgroupId,
      ACodAvias, ACodOptima, ACodInt: integer);
    procedure SetNpByCod(ACod: integer; AWhoisCod: TNpTypeCod);    
    procedure SetANPartsCount(const Value: integer);
    function  GetVisibleCod: TNpTypeCod;
    procedure SetVisibleCod(AValue: TNpTypeCod);
  public
    { Public declarations }
    GroupNum,PrihodInst: integer;
    StartDate: TDateTime;
    FromId,FromInst,FromIdOld,FromInstOld: integer;
    ToId,ToInst,ToIdOld,ToInstOld: integer;
    RezId,RezInst,RezIdOld,RezInstOld: integer;
    DogId,DogInst,DogIdOld,DogInstOld: integer;
    DogovorOld: string;
    OperIdOld: integer;
    ActDateOld: TDateTime;
    TTNAvias,TTNAviasOld:string;
    RezDefault,PartPrefixOV: string;
    PartType,PartTypeOld: string; // ������� 'K','O','S', ������� � � ������ ��������������
    UsSubgroupLast: integer; // ��������� ���.������, ������� ��������� ������� ������������
    NpTypeLast: integer;
    CopyAfterSave,RashAfterSave: Boolean;
    ReadOnly: Boolean;
    property ANPartsCount: integer read FANPartsCount write SetANPartsCount;
    { � ���� �������� �������� ���-�� ������, ���������� �� �����-����� (� PLAN_ID not null)
      ���������� � �����. ���� ��� ��������� �������� ����� ����, �� ����� ������
      ��� ������, � ��������� ������ ������ ��� ������ ������
    }
    property VisibleCod: TNpTypeCod read GetVisibleCod write SetVisibleCod;
  end;

  TEventHandlers = class // create a dummy class
    class procedure EventVisibleCodClick(Sender: TObject);
  end;

const
  VISIBLE_COD_FIELDS: array[low(TNpTypeCod)..high(TNpTypeCod)] of string = ('CODAVIAS', 'CODOPTIMA', 'NP_TYPE_ID', 'CODINT');
  VISIBLE_COD_CAPTIONS: array[low(TNpTypeCod)..high(TNpTypeCod)] of string = ('��� ���', '��� Cashtan', '��� Oil', '��� ���������');
  ADM_VISIBLE_COD = 'SOP_VISIBLE_CODNAME';
  ADM_CREATE_PART = 'SOP_CREATE_PART';

var
  PrihSopForm: TPrihSopForm;

// ������ �� �������� ������������� ���� ������ 
function CommonGetVisibleCod(AGrid: TDBGridEh): TNpTypeCod;
procedure CommonSetVisibleCod(AGrid: TDBGridEh; AValue: TNpTypeCod);
procedure CommonVisibleCodInit(AGrid: TDbGridEh);
function CommonVisibleCodByName(AName: string): TNpTypeCod;

// ������ �� �������� � �������������� �������� ���.������
function AddPrihSop: TModalResult;
function EditPrihSop(p_GroupNum,p_Inst: integer; p_StartDate: TDateTime): TModalResult;

implementation

{$R *.DFM}

uses Main, UDbFunc,OilStd,uStart,ChooseOrg,OperTypeRef,
     RezervRef,PartRef,ExFunc,MoneyFunc,Memo, DogRef,uGridFunc,RashSop;

const
  OPERATION_DEFAULT = 1; // ������� �� ��������� - "������ ������������ ������"

function CommonGetVisibleCod(AGrid: TDBGridEh): TNpTypeCod;
var
  i: TNpTypeCod;
  IsFound: boolean;
begin
  Result := ncAvias;
  IsFound := False;
  for i:= low(TNpTypeCod) to high(TNpTypeCod) do
    if AGrid.FieldColumns[VISIBLE_COD_FIELDS[i]].Visible and not IsFound then
    begin
      IsFound := True;
      Result := i;
    end
    // � ������, ���� � ������ ������ �������� ��� �������, �� ��������� ������ "��� ���"
    else if AGrid.FieldColumns[VISIBLE_COD_FIELDS[i]].Visible and IsFound then
    begin
      CommonSetVisibleCod(AGrid, ncAvias);
      Result := ncAvias;
      Exit;
    end;
  // ���� �� ���� �� ��������
  if not IsFound then
  begin
    CommonSetVisibleCod(AGrid, ncAvias);
    Result := ncAvias;
  end;
end;

procedure CommonSetVisibleCod(AGrid: TDBGridEh; AValue: TNpTypeCod);
var
  i: TNpTypeCod;
begin
  for i:= low(TNpTypeCod) to high(TNpTypeCod) do
    AGrid.FieldColumns[VISIBLE_COD_FIELDS[i]].Visible := False;
  AGrid.FieldColumns[VISIBLE_COD_FIELDS[AValue]].Visible := True;
  AdmSettings.Save(ADM_VISIBLE_COD, VISIBLE_COD_FIELDS[AValue]);
end;

procedure CommonVisibleCodInit(AGrid: TDbGridEh);
var
  i: TNpTypeCod;
  pm: TPopupMenu;
  mi: TMenuItem;
begin
  pm := TPopupMenu.Create(nil);
  for i:= low(TNpTypeCod) to high(TNpTypeCod) do
  begin
    if Assigned(AGrid.FieldColumns[VISIBLE_COD_FIELDS[i]].PopupMenu) then
      Continue;
    mi := TMenuItem.Create(AGrid);
    mi.Caption := VISIBLE_COD_CAPTIONS[i];
    mi.Name := 'mi'+VISIBLE_COD_FIELDS[i];

    mi.OnClick := TEventHandlers.EventVisibleCodClick;
    pm.Items.Add(mi);
    AGrid.FieldColumns[VISIBLE_COD_FIELDS[i]].PopupMenu := pm;
  end;

  if AdmSettings.Exist(ADM_VISIBLE_COD) then
  begin
    for i:= low(TNpTypeCod) to high(TNpTypeCod) do
    begin
      if VISIBLE_COD_FIELDS[i] = AdmSettings.Get(ADM_VISIBLE_COD) then
        CommonSetVisibleCod(AGrid, i);
    end;
  end
  else
    CommonSetVisibleCod(AGrid, ncAvias);
end;

function CommonVisibleCodByName(AName: string): TNpTypeCod;
begin
  if pos('AVIAS', UpperCase(AName)) <> 0 then
    Result := ncAvias
  else if pos('OPTIMA', UpperCase(AName)) <> 0 then
    Result := ncOptima
  else if (pos('OIL', UpperCase(AName)) <> 0) or (pos('NP', UpperCase(AName)) <> 0) then
    Result := ncOil
  else if pos('CODINT', UpperCase(AName)) <> 0 then
    Result := ncCodInt
  else
    raise Exception.CreateFmt('VisibleCodByName: �� ������� ����� ������������ ��� %s.',[AName]);
end;


//==============================================================================
//            ���������, ������������ ���������� ������ ���
//------------------------------------------------------------------------------
function AddPrihSop: TModalResult;
var
  F: TPrihSopForm;
  RezDefaultId,RezDefaultInst: string;
begin
  Application.CreateForm(TPrihSopForm,F);
  try
    F.edActDate.Date:=Date;
    F.PrihodInst:=MAIN_ORG.INST;
    F.SetOperation(OPERATION_DEFAULT);
    F.PartType:='O';
    F.PartTypeOld:='';
    F.DogovorOld:='';

    F.RezDefault:=ReadOilVar('REZ_SOP');
    // ������� ��������� �� ��������� �� OIL_VAR
    // �� �������� ��� � ������� "ID,INST"
    if F.RezDefault<>'' then begin
      GetNameValue(F.RezDefault,RezDefaultId,RezDefaultInst,',');
      F.RezId:=StrToInt(RezDefaultId);
      F.RezInst:=StrToInt(RezDefaultInst);
      F.ceRezerv.Text:=nvl(GetQValueByIdInst('NAME','OIL_REZERVUAR',F.RezId,F.RezInst),'');
      if F.ceRezerv.Text='' then begin
        F.RezId:=0; F.RezInst:=0;
        _ExecSqlOra('delete oil_var where name=''REZ_SOP''');
      end;
      // ������������� �� ID � INST � ��������� ������ ����������
    end;

    F.ANPartsCount:=0;
    F.ceTo.Text:=MAIN_ORG.Name;
    F.ToId:=MAIN_ORG.ID;
    F.ToInst:=MAIN_ORG.INST;
    F.cbKos.ItemIndex:=0;
    F.cbKosChange(nil);
    F.mt.Open;
    F.mt.Insert;
    F.ReadOnly := F.edActDate.Date<StrToDate(CLOSE_DATE);
    result := F.ShowModal;
    if result = mrOk then
      F.AfterSave;
  finally
    F.Free;
  end;
end;
//==============================================================================
//            ���������, ������������ �������������� ���
//------------------------------------------------------------------------------
function EditPrihSop(p_GroupNum,p_Inst: integer; p_StartDate: TDateTime): TModalResult;
var F: TPrihSopForm;
begin
  // ��� ��������� ���� ����������� group_id � inst ��� � �������� ��������� Init
  Application.CreateForm(TPrihSopForm,F);
  try
    F.RezDefault:=ReadOilVar('REZ_SOP');
    F.GroupNum:=p_GroupNum;
    F.PrihodInst:=p_Inst;
    F.StartDate:=p_StartDate;
    F.Init;
    result:=F.ShowModal;
    if result=mrOk then F.AfterSave;
  finally
    F.Free;
  end;
end;

{ TEventHandlers }

class procedure TEventHandlers.EventVisibleCodClick(Sender: TObject);
begin
  CommonSetVisibleCod(
    ((Sender as TMenuItem).Owner as TDBGridEh),
    CommonVisibleCodByName((Sender as TMenuItem).Name));
end;

{ TPrihSopForm }
//==============================================================================
procedure TPrihSopForm.InitPartPrefix;
begin
  PartPrefixOV := ReadOilVar('PART_SOP_PREFIX');
  edPartPrefix.Text := PartPrefixOV;
end;
//==============================================================================
procedure TPrihSopForm.SavePartPrefix;
begin
  _ExecProcOra('OIL.INSORUPDOIL_VAR',
    ['NAME#',     'PART_SOP_PREFIX',
     'VALUE#',    edPartPrefix.Text
    ],TRUE);
end;
//==============================================================================
procedure TPrihSopForm.SetOperation(p_Id: integer);
begin
  ceOper.Tag:=p_Id;
  ceOper.Text:=GetQValueByIdInst('NAME','OIL_OPER_TYPE',ceOper.Tag);
end;
//==============================================================================
// ���������, ����������� �������� ���� "������� �����" ��� "������� ������"
//------------------------------------------------------------------------------
procedure TPrihSopForm.AfterSave;
var
 R: TRashSopForm;
begin
  while CopyAfterSave do
  begin
    // ���� ������������ ������ "��������� � ������� �����", �� �������
    // ��� ����, ���������� id ��������, group_num � ������
    // ����� ����� ���� ��� ����, ����� ����� ���� �� ������� ��������
    // ��� ����� �������� ���
    mt.DisableControls;
    FInit := True;
    try
      mt.First;
      while not mt.Eof do
      begin
        mt.Edit;
        mt['id'] := null;
        mt['part_id'] := null;
        mt['part_inst'] := null;
        mt['dog'] := null;
        mt['part_id_old'] := null;
        mt['part_inst_old'] := null;
        mt['prih_det_id'] := null;
        mt['plan_id'] := null;
        mt.Post;
        mt.Next;
      end;
    finally
      FInit := False;
      mt.EnableControls;
    end;
    mt.First;
    GroupNum:=0;
    edAct.Clear;
    CopyAfterSave:=FALSE;
    ShowModal;
  end;

  if RashAfterSave then begin
    // ���� ������������ ������ "��������� � ������� ������", �� �������
    // ������ � ���� �� ���������, ��� � �������
    Application.CreateForm(TRashSopForm,R);
    try
      R.edActDate.Date:=edActDate.Date;
      R.RashodInst:=PrihodInst;
      R.rezDefault:=RezDefault;
      R.RezId:=RezId;
      R.RezInst:=RezInst;
      R.ceRezerv.Text:=ceRezerv.Text;
      R.ceFrom.Text:=ceTo.Text;
      R.FromId:=ToId;
      R.FromInst:=ToInst;
      R.Init;
      R.Preparing:=FALSE;
      mt.First;
      while not mt.Eof do
      begin
        if R.mt.Locate('part_id;part_inst',mt['part_id;part_inst'],[]) then
        begin
          R.mt.Edit;
          if R.mt['rest'] > mt['shtuki'] then
            R.mt['shtuki'] := mt['shtuki']
          else
            R.mt['shtuki'] := R.mt['rest'];
          R.mt.Post;
        end;
        mt.Next;
      end;
      mt.First;
      R.ShowModal;
    finally
      R.Free;
    end;
  end;
end;
//==============================================================================
//           ���������, ������� ���������� ��� � ����� ��� ��������������
//------------------------------------------------------------------------------
procedure TPrihSopForm.Init;
var
  s: string;
begin
  // ��� ������� �� ����� ����-�������
  // �� ������� ���, ��� � ��� ���� ����, ��� ���� ������� ����������
  // �� �� ��������� � ���������
  // � �����, ��� ������� - �� ����, ������� ������ ��� ������ �������
  // �� ��������� � ���� (�� ���� � mt)
  FInit := True;
  try
    if qLoad.Active then qLoad.Close;
    _OpenQueryParOra(qLoad,
      ['GROUP_NUM',          GroupNum,
       'INST',               PrihodInst,
       'STARTDATE',          StartDate]);

    if qLoad.RecordCount=0 then
      raise exception.create(TranslateText('�� ������ ������ � group_num=')+IntToStr(GroupNum)+',inst='+IntToStr(PrihodInst));

    TTNAviasOld:=qLoad.FieldByName('TTNAvias').AsString;
    edAct.Text:=TTNAviasOld;
    TTNAvias:=TTNAviasOld;
    edActDate.Date:=qLoad['date_'];
    ActDateOld:=edActDate.Date;

    FromId:=qLoad.FieldByName('from_').AsInteger;
    FromInst:=qLoad.FieldByName('from_inst').AsInteger;
    FromIdOld:=FromId; FromInstOld:=FromInst;
    ceFrom.Text:=GetOrgName(FromId,FromInst);

    ToId:=qLoad.FieldByName('to_').AsInteger;
    ToInst:=qLoad.FieldByName('to_inst').AsInteger;
    ToIdOld:=ToId; ToInstOld:=ToInst;
    ceTo.Text:=GetOrgName(ToId,ToInst);

    s:=qLoad.FieldByName('own_goods').AsString;
    cbKos.ItemIndex:=decode([s,'O',0,'K',1,2]);
    cbKosChange(nil);
    PartTypeOld:=PartType;

    ceOper.Tag:=qLoad.FieldByName('oper_id').AsInteger;
    OperIdOld:=ceOper.Tag;
    ceOper.Text:=GetQValueByIdInst('NAME','OIL_OPER_TYPE',ceOper.Tag);

    RezId:=qLoad.FieldByName('rez').AsInteger;
    RezInst:=qLoad.FieldByName('rez_inst').AsInteger;
    RezIdOld:=RezId; RezInstOld:=RezInst;
    ceRezerv.Text:=GetQValueByIdInst('NAME','OIL_REZERVUAR',RezId,RezInst);

    DogId:=nvl(qLoad['dog_id'],0);//.FieldByName('dog_id').AsInteger;
    DogInst:=qLoad.FieldByName('dog_inst').AsInteger;
    DogIdOld:=DogId; DogInstOld:=DogInst;
    ceDogovor.Text:=nvl(GetQValueByIdInst('DOG','OIL_DOG',DogId,DogInst),'');
    DogovorOld:=ceDogovor.Text;

    ReadOnly:=(PrihodInst<>MAIN_ORG.INST) or not InstIsPossible(PrihodInst)
      or (edActDate.Date<StrToDate(CLOSE_DATE));

    //dbgrid.DataSource:=nil;
    CopyToMemoryTable(qLoad, mt,
      'ID,NP_TYPE,NP_TYPE_ID,SHTUKI,SS,DOG,PART_ID,PART_INST,PRIH_DET_ID,PLAN_ID,'+
      'NP_TYPE_ID:NP_TYPE_ID_OLD,SHTUKI:SHTUKI_OLD,SS:SS_OLD,PRICE,PRICE:PRICE_OLD,'+
      'PART_ID:PART_ID_OLD,PART_INST:PART_INST_OLD,US_SUBGROUP_NAME,'+
      'CODAVIAS,CODOPTIMA,CODINT');
    mtAfterPost(nil);
    mt.First;
    // � ������, ����� ��� ������ �������, ����� � ���������� - ������� ��
    // � ���� ������ ������, ���������� �� �����-�����? :-))
    while not mt.Eof do begin
      if mtPlan_Id.AsInteger<>0 then
        ANPartsCount:=ANPartsCount+1;
      mt.Next;
    end;
    mt.First;
    cbCreatePart.Checked := ('Y' = AdmSettings.GetOrDef(ADM_CREATE_PART, 'Y'));
  finally
    FInit := False;
  end;
  mtAfterPost(nil);  
end;
//==============================================================================
procedure TPrihSopForm.LoadPartList;
begin
  if not qANParts.Active then
    _OpenQueryParOra(qANParts,
      ['BEGINDATE',          edActDate.Date-7,
       'ENDDATE',            edActDate.Date]);

  mt.EmptyTable;
  CopyToMemoryTable(qANParts,mt,
    'ID,NP_TYPE,NP_TYPE_ID,SHTUKI,SS,DOG,PART_ID,PART_INST,PRIH_DET_ID,PLAN_ID,'+
    'NP_TYPE_ID:NP_TYPE_ID_OLD,SHTUKI:SHTUKI_OLD,SS:SS_OLD,PART_ID:PART_ID_OLD,PART_INST:PART_INST_OLD');
end;
//==============================================================================
//  ������������ ����� ������� (�� ��������: ��� ��������� - ���� ������)
//------------------------------------------------------------------------------
procedure TPrihSopForm.Test;
begin
  if FromId = 0 then
    raise exception.create(TranslateText('�� �������� ����������� "�� ����"'));

  if RezId = 0 then
    raise exception.create(TranslateText('�� ��������� ���������'));

  edPartPrefix.Text:=trim(RusUpperCase(edPartPrefix.Text));

  if ceDogovor.Text<>DogovorOld then // ���� ������������ ����� �������� �������� ���� ������ �����
    if GetSqlValue(
      ' select count(*) from oil_dog'+
      ' where state=''Y'' and upper(dog)=upper('''+ceDogovor.Text+''')'+
      '   and inst='+IntToStr(MAIN_ORG.INST))>0
    then
      raise exception.create(TranslateText('������� � ����� ��������� ��� ����������'));
  mt.DisableControls;
  try
    mt.First;
    while not mt.Eof do
    begin
      if mtNp_Type.AsString='' then
        raise exception.create(TranslateText('�� ��������� �����'));
      if (mtShtuki.AsInteger>0) and (mtSs.AsFloat<=0) then
        raise exception.create(TranslateText('�� ���������� ������� ����!'));
      if (edPartPrefix.Text='') and (mtDog.AsString='') then
        raise exception.create(
          TranslateText('������ ���� ��������� ������� ������ ���� ������� ������� ��� �������� ������'));
      mt.Next;
    end;
  finally
    mt.EnableControls;
  end;
end;
//==============================================================================
//                   ������ � ���� ������
//------------------------------------------------------------------------------
procedure TPrihSopForm.Save;
var
  n,PartId,PartInst,PrihodId: integer;
  vGlobalSavePart,vGlobalSavePrihod: boolean;
  //****************************************************************************
  procedure SavePart;
  var
    vDog: string;
  begin
    { ���� �������� ������ �� ������� �������, ��� ������������� �������� ��
      ������������� }
    if mtDog.AsString <> '' then
      vDog := mtDog.AsString
    else
      if not cbCreatePart.Checked then
        SetNpByCod(mtNP_TYPE_ID.AsInteger, ncOil);

    if mtDog.AsString = '' then
    begin
      vDog := GetUniquePartName(edPartPrefix.Text+edAct.Text+'-'+IntToStr(n));
      mt.Edit;
      mt['part_id'] := PartId;
      mt['part_inst'] := PartInst;
      mt['dog'] := vDog;
    end;

    _ExecProcOra('OIL.INSORUPDOIL_PART',
        ['ID#',                        PartId,
         'INST#',                      PartInst,
         'STATE#',                     'Y',
         'DOG#',                       vDog,
         'DOG_DATE#',                  edActDate.Date,
         'FROM_#',                     FromId,
         'FROM_INST#',                 FromInst,
         'COMM#',                      TranslateText('������������� ��������� ������ �������������� ������'),
         'SERT#',                      '',
         'NP_TYPE#',                   mtNp_Type_Id.Value,
         'BASE_#',                     1,
         'DIM_ID#',                    19,
         'SS#',                        mtSs.Value,
         'PRICE#',                     mtPrice.Value,
         'PRICE_KP#',                  0,
         'DOR_SBOR#',                  0,
         'OWN_GOODS#',                 PartType,
         'TO_#',                       ToId,
         'TO_INST#',                   ToInst,
         'PLAN_ID#',                   null,
         'IS_BARTER#',                 0,
         'GOAL_PART_TYPE#',            9,
         'AMOUNT#',                    mtShtuki.Value,
         'AMOUNT_FACT#',               mtShtuki.Value,
         'FILSEND#',                   'N',
         'BASE_LITR#',                 null,
         'UD_WEIGHT#',                 null,
         'SOPUTST#',                   'Y'
        ],TRUE);
  end;
  //****************************************************************************
  procedure SavePrihod;
  begin
    _ExecProcOra('OIL.INSORUPDOIL_PRIHOD',
        ['ID#',                      PrihodId,
         'STATE#',                   mtState.Value,
         'INST#',                    PrihodInst,
         'EMP_ID#',                  EMP_ID,
         'EMP_INST#',                MAIN_ORG.INST,
         'DATE_#',                   edActDate.Date,
         'OPER_ID#',                 ceOper.Tag,
         'PART_ID#',                 PartId,
         'PART_INST#',               PartInst,
         'DATE_OTPR#',               edActDate.Date,
         'DOST#',                    1,
         'RAIL_ST#',                 null,
         'RAIL_INST#',               null,
         'RASCH_TYPE#',              null,
         'NP_TYPE#',                 mtNp_Type_Id.Value,
         'RASH#',                    null,
         'RASH_INST#',               null,
         'FROM_#',                   FromId,
         'FROM_INST#',               FromInst,
         'TO_#',                     ToId,
         'TO_INST#',                 ToInst,
         'DOG#',                     decode([DogId,0,null]),
         'DOG_INST#',                decode([DogInst,0,null]),
         'GROUP_NUM#',               GroupNum,
         'NUMBER_DOC#',              edAct.Text
        ],TRUE);
  end;
  //****************************************************************************
  procedure SavePrihDet;
  begin
    _ExecProcOra('OIL.INSORUPDOIL_PRIH_DET',
        ['ID#',                      decode([mtPrih_Det_Id.AsInteger,0,GetSeqNextVal('S_OIL_PRIH_DET')]),
         'STATE#',                   mtState.Value,
         'INST#',                    PrihodInst,
         'PRIHOD_ID#',               PrihodId,
         'NAKL#',                    null,
         'TANK#',                    null,
         'TANK_TYPE#',               null,
         'DOC_COUNT#',               mtShtuki.Value,
         'FACT_COUNT#',              mtShtuki.Value,
         'NED_NORM_UB#',             0,
         'NED_NORM_ER#',             0,
         'NED_POST#',                0,
         'NED_RAIL#',                0,
         'IZL_NORM#',                0,
         'IZL_POST#',                0,
         'REZ#',                     RezId,
         'REZ_INST#',                RezInst,
         'IS_DIGITAL_WEIGHT#',       0,
         'TECH_LOSS#',               0
        ],TRUE);
  end;
  //****************************************************************************
  procedure SaveDogovor;
  begin
    if DogId=0 then begin
      DogId:=GetSeqNextVal('S_OIL_DOG');
      DogInst:=MAIN_ORG.INST;
      _ExecProcOra('OIL.INSORUPDOIL_DOG',
        ['ID#',              DogId,
         'STATE#',           'Y',
         'INST#',            DogInst,
         'DOG#',             ceDogovor.Text,
         'DOG_DATE#',        edActDate.Date,
         'EXP_DATE#',        null,
         'FROM_#',           FromId,
         'FROM_INST#',       FromInst,
         'TO_#',             ToId,
         'TO_INST#',         ToInst,
         'DOG_TYPE#',        'N'
        ],TRUE)
    end else
      if ceDogovor.Text<>DogovorOld then
        _ExecSqlOra(Format(
          ' update oil_dog set dog=''%s'''+
          ' where id=%d and inst=%d',[ceDogovor.Text,DogId,DogInst]));
  end;
  //****************************************************************************
begin
  if GroupNum=0 then
    GroupNum:=GetSeqNextVal('SEQ_PRIHOD_GROUP_NUM');

  StartSqlOra;
  mt.First; n:=1;

  if edAct.Text='' then
    edAct.Text:=TTNAviasOld;

  vGlobalSavePart:=PartType<>PartTypeOld;
  vGlobalSavePrihod:=
    (edActDate.Date<>ActDateOld) or
    (ceOper.Tag<>OperIdOld) or
    (RezId<>RezIdOld) or
    (RezInst<>RezInstOld) or
    (FromId<>FromIdOld) or
    (FromInst<>FromInstOld) or
    (ToId<>ToIdOld) or
    (ToInst<>ToInstOld) or
    (DogId<>DogIdOld) or
    (DogInst<>DogInstOld) or
    (DogovorOld<>ceDogovor.Text) or
    (TTNAvias<>TTNAviasOld);

  if (PartPrefixOV='') and (edPartPrefix.Text<>'') then
    if MessageDlg(TranslateText('�� ������ ������������ ������ ������� ������ ��� ���� ������ �������������� ������?'),
      mtConfirmation,[mbYes,mbNo],0)=mrYes
    then
      SavePartPrefix;
  mt.DisableControls;
  try
    while not mt.Eof do
    begin
      if (mtShtuki.AsInteger>0) or (mtShtuki.AsInteger<>mtShtuki_Old.AsInteger) then
      begin  
        // id ������ ����� �� ��������, ���� ��� ��� ���� � ������
        if (mtPart_Id.AsInteger = 0) or (mtDOG.AsString = '') then
          PartId := GetSeqNextVal('S_OIL_PART')
        else
          PartId := mtPart_Id.AsInteger;

        // inst ������ ����� �������, ���� ��� ��� ��� � ������
        if (mtPart_Id.AsInteger = 0) or (mtDOG.AsString = '') then
          PartInst := MAIN_ORG.INST
        else
          PartInst := mtPart_Inst.AsInteger;

        // (����������� � �������� ����� ������ ��� ����������� �����)
        // ��������� ������ � ������
        if (mtPlan_Id.AsInteger = 0) // ���� ������ �� �� �����-����� �
          and
            (vGlobalSavePart or                                       // �� ���������� ��� ������ ���
            (mtNp_Type_Id.AsInteger <> mtNp_Type_Id_Old.AsInteger) or // ��������� � ���� ������ ��� �� ���
            (mtSs.AsFloat <> mtSs_Old.AsFloat) or                     // ������� ���� ���
            (mtPrice.AsFloat <> mtPrice_Old.AsFloat) or               // ���� �������
            (mtDOG.AsString = '')
          ) then
          SavePart;

        // ���� ������������ ������� �������� ������������� �������� ����
        // ���� ����� �������, ��������� ���
        if ceDogovor.Text<>DogovorOld then
          SaveDogovor;

        // id ������� ����� �� �������� ���� ��� ��� ��� � ������
        PrihodId := decode([mtId.AsInteger,0,GetSeqNextVal('S_OIL_PRIH')]);

        // ��������� ������ � ������ ����
        if vGlobalSavePrihod or // �� ���������� ��� �������
           (mtId.AsInteger=0) or // ������ ��� �� ���������� ���
           (mtPart_Id.AsInteger<>mtPart_Id_Old.AsInteger) or // �������������� ������ ���
           (mtPart_Inst.AsInteger<>mtPart_Inst_Old.AsInteger) or
           (mtState.AsString='N') // ������ �������
        then
          SavePrihod;

        // ��������� ������ ������� � ������ ����
        if (mtPrih_Det_Id.AsInteger=0) or // ������ ��� �� ����������� ���
           (mtShtuki.AsInteger<>mtShtuki_Old.AsInteger) or // �������� ����������
           (mtState.AsString='N') // ������ �������
        then
          SavePrihDet;

        inc(n);
      end;
      mt.Next;
    end;
  finally
    mt.EnableControls;
  end;

  if (RezDefault='') and
     (MessageDlg(TranslateText('�� ������ ������� ������� ��������� ����������� ')+#13#10+
                 TranslateText('�� ��������� ��� ������������� �������?'),mtConfirmation,[mbYes,mbNo],0)=mrYes)
  then
    _ExecSql(' insert into oil_var (name,value)'+
             ' values (''REZ_SOP'','''+IntToStr(RezId)+','+IntToStr(RezInst)+''')');

  CommitSqlOra;
end;
//==============================================================================
procedure TPrihSopForm.SetNpFull(AName, AUsSubgroupName: string; ANpId, AUsSubgroupId, ACodAvias, ACodOptima, ACodInt: integer);
begin
  if mt.State = dsBrowse then
    if mt.RecordCount = 0 then
      mt.Insert
    else
      mt.Edit;
  mt.FieldByName('np_type').AsString := AName;
  mt.FieldByName('np_type_id').AsInteger := ANpId;
  mt.FieldByName('us_subgroup_name').AsString := AUsSubgroupName;
  mt.FieldByName('codavias').AsInteger := ACodAvias;
  mt.FieldByName('codoptima').AsInteger := ACodOptima;
  mt.FieldByName('codint').AsInteger := ACodInt;

  if not cbAutoPrice.Checked and not cbAutoPriceCentr.Checked then
    mtPrice.AsFloat := nvl(GetSqlValueParSimple(
      ' select get_last_price(:ANpId, :ADate, :AInst) from dual',
      ['ANpId', ANpId,
       'ADate', edActDate.Date,
       'AInst', decode([PrihodInst,0,MAIN_ORG.INST])]),0)
  else if cbAutoPriceCentr.Checked then
  begin
    if qPrices.Active then
      qPrices.Close;
    _OpenQueryPar(qPrices,
     ['ANpId', ANpId,
      'ADate', edActDate.Date]);
    if not qPrices.IsEmpty then
      mtPrice.AsFloat := qPrices.FieldByName('price').AsCurrency;
  end;
  dbgrid.SelectedField := mt.FieldByName('shtuki');
end;
//==============================================================================
procedure TPrihSopForm.SetNpByCod(ACod: integer; AWhoisCod: TNpTypeCod);
var
  q: TOraQuery;
  OilId: integer;
begin
  q := TOraQuery.Create(nil);
  try
    if TNPTypeRefForm.Choose(ACod, AWhoisCod, q) then
    begin
      SetNpFull(q.FieldByName('name').AsString, q.FieldByName('us_subgroup_name').AsString,
        q.FieldByName('id').AsInteger, q.FieldByName('us_subgroup_id').AsInteger,
        q.FieldByName('codavias').AsInteger, q.FieldByName('codoptima').AsInteger, q.FieldByName('codint').AsInteger);
      OilId := q.FieldByName('id').AsInteger;

      q.Close;
      q.SQL.Text := 'select * from oil_part where inst = ov.GetVal(''INST'') and np_type = :ACod';
      _OpenQueryPar(q,
       ['ACod', OilId]);
      if not q.IsEmpty then
      begin
        q.Locate('Dog', ACod, []);
        mtPart_Id.AsInteger := q.FieldByName('ID').AsInteger;
        mtPart_Inst.AsInteger := q.FieldByName('Inst').AsInteger;
        mtDog.AsString := q.FieldByName('Dog').AsString;
        mtSs.AsFloat := q.FieldByName('SS').AsFloat;
        mtPlan_Id.AsInteger := nvl(q.FieldByName('Plan_Id').Value,0);
      end;
    end;  
  finally
    q.Free;
  end;
end;
//==============================================================================
procedure TPrihSopForm.SetANPartsCount(const Value: integer);
begin
  // ���� ���������� ������ �� �����-����� ������ ����, �� ���������
  // �������� ��� ������. � ���� ����� ����, �� ���������.
  FANPartsCount := Value;
  cbKOS.Enabled:=FANPartsCount=0;
end;
//==============================================================================
function  TPrihSopForm.GetVisibleCod: TNpTypeCod;
begin
  Result := CommonGetVisibleCod(dbgrid);
end;

procedure TPrihSopForm.SetVisibleCod(AValue: TNpTypeCod);
begin
  CommonSetVisibleCod(dbgrid, AValue)
end;
//==============================================================================
procedure TPrihSopForm.bbOkClick(Sender: TObject);
begin
  Test;
  Save;
  ModalResult:=mrOk;
end;
//==============================================================================
procedure TPrihSopForm.ceFromButtonClick(Sender: TObject);
var vName: string;
begin
  if ChooseOrg.CaptureOrg(0,Main_par,Main_par,'yyy',FromId,FromInst,vName) then begin
    ceFrom.Text:=vName;
    if FromId=4587 then begin // ���� ��������� ����������� �� "�����-�����", ��
      // �� ���������� ���������� ���������������� ������, ������� ������
      // � ������� (����������� ���� ��� ������ ����)

      _OpenQueryParOra(qANParts,
        ['BEGINDATE',          edActDate.Date-7,
         'ENDDATE',            edActDate.Date]);
      if (qANParts.RecordCount>0) and
         (MessageDlg(TranslateText('���������� ���������������� ������ �� "�����-�����"?'),
            mtConfirmation,[mbYes,mbNo],0)=mrYes)
      then
        LoadPartList;
    end;
    dbgrid.SetFocus;
  end;
end;
//==============================================================================
procedure TPrihSopForm.ceOperButtonClick(Sender: TObject);
var F: TOperTypeRefForm;
begin
  Application.CreateForm(TOperTypeRefForm,F);
  F.SGrpId:=7;
  F.ComboEdit1.Text:=GetQValueByIdInst('NAME','OIL_OPER_GRP',F.SGrpId);
  F.bbSearchClick(nil);
  if F.ShowModal=mrOk then
  begin
    ceOper.Text := F.qNAME.AsString;
    ceOper.Tag := F.qId.AsInteger;
  end;
end;
//==============================================================================
procedure TPrihSopForm.ceRezervButtonClick(Sender: TObject);
var
  F: TRezervRefForm;
  err: string;
begin
  // ���������� ��������� �������� ������ ����������� � ��-���������
  if not TestSopPrihDelete(GroupNum,PrihodInst,err) then
    raise Exception.Create(err);
  Application.CreateForm(TRezervRefForm,F);
  F.OrgId:=ToId; F.OrgInst:=ToInst;
  F.cbOrg.Text := GetOrgName(ToId,ToInst);
  F.cbReal.Checked := FALSE;
  F.cbElev.Checked := FALSE;
  F.cbVirt.Checked := TRUE;
  F.gbClass.Enabled := FALSE;
  F.bbOk.Visible := TRUE;
  F.ActivateQ(nil);
  if F.ShowModal = mrOk then
  begin
    ceRezerv.Text := F.q.FieldByName('name').AsString;
    RezId := F.q.FieldByName('id').AsInteger;
    RezInst := F.q.FieldByName('inst').AsInteger;
  end;
end;
//==============================================================================
procedure TPrihSopForm.dbgridColumns1EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  F: TPartRefForm;
  err: string;
begin
  // ��� �������������� �������, ��� ������ ������ ��� ������ ������.
  if (mtPART_ID_OLD.AsInteger <> 0) and
    not TestPartMovement(
      mtPart_Id.AsInteger, mtPart_Inst.AsInteger,
      RezId, RezInst,
      'OIL_PRIHOD', mtId.AsInteger, PrihodInst,
      0, err)
  then
    raise Exception.Create('��������: ����� ������ � ������� �������� � ������������� �������� �� ������ ������, �.�. �� ��� ��� ���� ��������.'+#10#13
      + '�����������: ' + err + #10#13
      + '����������: ��� ������ ������ �� ���� ���������� ������ ��������������� ������� "������ ������".');

  Application.CreateForm(TPartRefForm,F);
  try
    F.cbNoPrih.Checked := True;
    F.Tag:=10; { ��� ���������� ���������� �����, ����� ��� �������� �� ���������
                 ������ "������� �� 0.000001"
                 ��� ������� � ����������� ������, �� ���� - �� ���� :-((   }
    if F.ShowModal = mrOk then
    begin
      if F.qOWN_GOODS.AsString<>PartType then
        raise Exception.Create(TranslateText('��� ������ ��������� ������ ���������� �� ���� ������ � �������'));

      if GetQValueByIdInst('ISSHTUKI','V_OIL_DIM',F.qDim_Id.AsInteger)<>'Y' then
        raise Exception.Create(TranslateText('��������� ������ �� �������� �������'));

      if VarIsNull(GetQValueByIdInst('US_SUBGROUP_ID','OIL_NP_TYPE',F.qNP_TYPE.AsInteger)) then
        raise Exception.Create(TranslateText('����� ��������� ������ �� �������� ������������� �������'));

      if mt.State = dsBrowse then
        if mt.RecordCount = 0 then
          mt.Insert
        else
          mt.Edit;

      // ���� � ���������� ���������� ������ ������������� ���� �����������
      // ���-�� ������, ���������� �� �����-�����, �� ��� ���������� �
      // �������� ANPartsCount
      if (mtPlan_Id.AsInteger = 0) and not F.q.FieldByName('Plan_Id').IsNull then
        ANPartsCount := ANPartsCount+1
      else if (mtPlan_Id.AsInteger <> 0) and (F.q.FieldByName('Plan_Id').AsInteger = 0) then
        ANPartsCount := ANPartsCount-1;

      mtNp_Type_Id.AsInteger := F.qNP_TYPE.AsInteger;
      mtNp_Type.AsString := F.qNp_Type_Name.AsString;
      mtNp_Type_Id_Old.AsInteger := F.qNP_TYPE.AsInteger;

      mtPart_Id.AsInteger := F.qID.AsInteger;
      mtPart_Inst.AsInteger := F.qInst.AsInteger;
      mtDog.AsString := F.qDog.AsString;
      mtSs.AsFloat := F.qSS.AsFloat;
      mtPlan_Id.AsInteger := nvl(F.q.FieldByName('Plan_Id').Value,0);
    end;
  finally
    F.Free;
  end;
end;
//==============================================================================
procedure TPrihSopForm.TestPrihodDecrease(p_Shtuki: integer);
var
  err: string;
begin
  // �������� �� ��, �� �������� �� ���������� ���� �������� ������� �
  // ������������� �������� ���-������ � �������
  if not TestPartMovement(
    mtPart_Id.AsInteger,mtPart_Inst.AsInteger,
    RezId,RezInst,
    'OIL_PRIHOD',mtId.AsInteger,PrihodInst,
    p_Shtuki,err)
  then
    raise Exception.Create(err);
end;
//==============================================================================
procedure TPrihSopForm.sbDelClick(Sender: TObject);
begin
  if mt.RecordCount>0 then
    if mtId.AsInteger=0 then
      mt.Delete
    else begin
      if mtState.AsString='Y' then
        TestPrihodDecrease(0);
      mt.Edit;
      mtState.AsString:=decode([mtState.AsString,'Y','N','Y']);
      mt.Post;
    end;
end;
//==============================================================================
//            ��������� � ������ ����� (����� ���������� :-))
//------------------------------------------------------------------------------
procedure TPrihSopForm.dbgridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if mtState.AsString='N' then
    AFont.Color:=clRed // ������, ���������� �� �������� ���������� ��������
  else if mtId.AsInteger=0 then
    AFont.Color:=clBlue // ����� ������ ���������� ������
  else
    AFont.Color:=clBlack; // � ��, ��� ��� ���� � ������ ������������� - �������

  if (mtPlan_Id.AsInteger<>0) and // ���� � ������ ������, ���������� �� �����-�����,
     ((Column.FieldName='DOG') or // �� ���� "������",
      (Column.FieldName='NP_TYPE') or // "�����",
      (Column.FieldName='SS') or     // "������� ����" �
      (Column.FieldName='PRICE')     // "���� ����������"
     )
  then
    Background := $00EEEFEF;    // �������� ������-������ ������

  // ���� ���� ����� ����, ��������� �� ��� ���� ����
  if ((Column.FieldName='SS') and (mtSs.AsFloat=0) or
      (Column.FieldName='PRICE')) and (mtPrice.AsFloat=0) and
     not (mt.State in [dsInsert,dsEdit])
  then
    AFont.Color:=Background;

  // ���� ���� ���������� ������, ��� ������� ���� + ���, �� ������ �� �������
  if (Column.FieldName = 'PRICE') and
     (mtPrice.AsFloat < GetWithNds_NoNds(mtSs.AsFloat,edActDate.Date))
  then
    AFont.Color := clRed;
end;
//==============================================================================
procedure TPrihSopForm.dbgridKeyPress(Sender: TObject; var Key: Char);
var
  vDummy: Boolean;
begin
  if    ((mt.FieldByName('plan_id').AsInteger > 0) and // ���� ������ �������� �� �����-�����
         ((dbgrid.SelectedField.FieldName = 'SS') or // � ���� ���� �� ���� "����", �������
          (dbgrid.SelectedField.FieldName = 'PRICE'))) // ���� ��������������,

     or ((dbgrid.SelectedField.FieldName = 'DOG') and // ��� ���� ���� - ������, � ������ ��� ���� � ����
         (mtPart_Id.AsInteger <> 0))
  then
  begin
    Key := #0; // �� ��� ������� ������ ����������
    Exit;
  end;

  if (dbgrid.SelectedField.FieldName = 'SHTUKI') and (Key=#13) then
  begin
    mt.Post;
    mt.Append;
    dbgrid.SelectedField := mt.FieldByName(FLastNpField);
  end;
  
  if (dbgrid.SelectedField.FieldName = 'NP_TYPE') or (dbgrid.SelectedField.FieldName = VISIBLE_COD_FIELDS[VisibleCod]) then
    FLastNpField := dbgrid.SelectedField.FieldName;

  // ���� ���� � ���� "�����" �� ������ "Enter", �� ��� ���� �������� �������:
  // ��������� ����� ������ ������
  if (dbgrid.SelectedField.FieldName = 'NP_TYPE') then
    if Key=#13 then
      dbgridColumnNpTypeEditButtonClick(Sender,vDummy)
    else
      Key:=#0 // �� ���� ����� �� ������ ���-������ ������, �� ������ �� ����������
  // ������� ��� ������, ����� "Enter" � ����� ��� �����������
  else if dbgrid.SelectedField.FieldName = VISIBLE_COD_FIELDS[VisibleCod] then
    if Key=#13 then
      SetNpByCod(mt.FieldByName(VISIBLE_COD_FIELDS[VisibleCod]).AsInteger, VisibleCod)
  else
    // � ��� ����� ��� �������������� ��� ����� ���� ������������ � ������, � �������
    if ((dbgrid.SelectedField.FieldName = 'SS') or (dbgrid.SelectedField.FieldName = 'PRICE')) and
       (Key in ['.',','])
    then
      Key := DECIMALSEPARATOR;
end;
//==============================================================================
procedure TPrihSopForm.dbgridColumnNpTypeEditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  F: TNPTypeRefForm;
begin
  if mtPlan_Id.AsInteger > 0 then
    exit;
  Application.CreateForm(TNPTypeRefForm,F);
  try

    if UsSubgroupLast <> 0 then
    begin
      // ������������� ������ "��������� ���.������" ������ ����������� ����������
      F.edUsSubgroup.Tag := UsSubgroupLast;
      F.edUsSubgroup.Text := GetQValueByIdInst('NAME','OIL_US_SUBGROUP',UsSubgroupLast);
    end;
    F.bbSearch.Click;
    F.OnShow := nil;

    if NpTypeLast<>0 then
    begin
      F.q.Locate('ID',NpTypeLast,[]);
      F.q.Next;
    end;

    if F.ShowModal = mrOk then
      SetNpByCod(F.q['id'], ncOil);
  finally
    F.Free;
  end;
end;
//==============================================================================
procedure TPrihSopForm.mtBeforePost(DataSet: TDataSet);
begin

  // ����� ���, ��� ��������� ������������� ������, ���-��� ��������� �
  // ���-��� ������. ��-������, ���� ������������ ��� ��� ������ �������,
  // � ����� ������ ��� ����������, �� ��������� �� ��� �� �����. ����� ������
  // ������ �������� :-))
  if not FInit then
  begin
    if (mtPart_Id.AsInteger = 0) and (mtDog.AsString<>'') then
      if GetSqlValue(
           ' select count(*) from oil_part'+
           ' where state=''Y'' and dog = '''+mtDog.AsString+'''')>0
      then
        raise Exception.Create(TranslateText('������ � ����� ������ ��� ����������!!!'));

    if mtNp_Type_Id.AsInteger = 0 then
      raise Exception.Create(TranslateText('������� ��� ������!'));

    // ���� ����������� ����������, ����������� ������������� �������
    if mtShtuki.AsInteger < mtShtuki_Old.AsInteger then
      TestPrihodDecrease(mtShtuki.AsInteger);

    // ���� ����� ������ "���������� ��������� ����", �� ���������������
    // ��������� ����, ������ ������� + ���
    if cbAutoPrice.Checked then
      mtPrice.AsFloat := GetWithNds_NoNds(mtSs.AsFloat,edActDate.Date);
  end;
end;
//==============================================================================
procedure TPrihSopForm.mtAfterInsert(DataSet: TDataSet);
begin
  mtState.AsString := 'Y';
end;
//==============================================================================
procedure TPrihSopForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if mt.State<>dsBrowse then
    mt.Cancel;
  if ModalResult<>mrOk then
    if MessageDlg(TranslateText('�� �������, ��� ������ ����� ��� ���������� ���������?'),mtWarning,[mbYes,mbNo],0)=mrNo then
      Action := caNone
    else
      ModalResult:=mrCancel;
end;
//==============================================================================
procedure TPrihSopForm.cbKOSKeyPress(Sender: TObject; var Key: Char);
begin
  Key:=#0; // ����� �������� ������ ������ �����-�����. ��������� ��� :-)
end;
//==============================================================================
procedure TPrihSopForm.miSavePartPrefixClick(Sender: TObject);
begin
  SavePartPrefix;
end;
//==============================================================================
procedure TPrihSopForm.pmPartPopup(Sender: TObject);
begin
  miSavePartPrefix.Enabled:=trim(edPartPrefix.Text)<>'';
end;
//==============================================================================
procedure TPrihSopForm.cbKOSChange(Sender: TObject);
begin
  PartType:=decode([cbKos.ItemIndex,0,'O',1,'K','S']);
  // ��� ������� �� ����� ������ ���� �������� �� ���������,
  // ��� ��������� ���� ������ ������������� ��
  SetOperation(decode([cbKos.ItemIndex,0,1,1,53,2]));

  // ��� �������� ��� ����� ���������� ���������� ���� �������
  cbAutoPrice.Checked:= PartType='K';
end;
//==============================================================================
procedure TPrihSopForm.cbKOSDblClick(Sender: TObject);
begin
  // ���� ����������� ������� ������ �� �����-����� "��� ������",
  // �� ��� ����� ��������� ��������� �� ������ ���
  cbKOS.ItemIndex:=(cbKos.ItemIndex+1) mod 3;
  cbKosChange(Sender);
end;
//==============================================================================
procedure TPrihSopForm.ceFromKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    ceFromButtonClick(Sender)
  else if Key=#9 then
    dbgrid.SetFocus;
end;
//==============================================================================
procedure TPrihSopForm.FormCreate(Sender: TObject);
begin
  inherited;
  FInit := False;
  InitGridToolButtons(dbgrid);
  InitPartPrefix;
end;
//==============================================================================
procedure TPrihSopForm.dbgridSortMarkingChanged(Sender: TObject);
begin
  if mt.State in [dsInsert,dsEdit] then
    mt.Post;
  SortGridMemoryTable(dbgrid);
end;
//==============================================================================
procedure TPrihSopForm.mtCalcFields(DataSet: TDataSet);
begin
  mtSum_Ss.AsFloat := FRound(mtShtuki.AsFloat*mtSs.AsFloat,2);
  mtSum_Price.AsFloat := FRound(mtShtuki.AsFloat*mtPrice.AsFloat,2);
end;
//==============================================================================
procedure TPrihSopForm.ProcessAutoPrice;
begin
  // ������������� �� �������� "������ ��� ������" � �����������
  // �� ��������� ������ "���������� ��������� ����"
  dbgrid.FieldColumns['PRICE'].ReadOnly := cbAutoPrice.Checked or cbAutoPriceCentr.Checked;
  // � ���� ��� ����� "������ ��� ������", ������ �������� �������
  dbgrid.FieldColumns['PRICE'].Color :=
    decode([dbgrid.FieldColumns['PRICE'].ReadOnly,TRUE,$00EEEFEF,clWhite]);
end;
//==============================================================================
procedure TPrihSopForm.AutoPriceClick(Sender: TObject);
begin
  if Sender is TCheckBox then
    if TCheckBox(Sender).Checked then
    begin
      if TCheckBox(Sender).Name = cbAutoPrice.Name then
        cbAutoPriceCentr.Checked := False;
      if TCheckBox(Sender).Name = cbAutoPriceCentr.Name then
        cbAutoPrice.Checked := False;
    end;
  ProcessAutoPrice;
end;
//==============================================================================
procedure TPrihSopForm.ceDogovorButtonClick(Sender: TObject);
var
  F: TDogRefForm;
begin
  // ����� ��������. ����� �������, ��� ���� �������� ������ :-))
  Application.CreateForm(TDogRefForm,F);
  try
    F.eTo.Tag := ToId;
    F.lTo.Tag := ToInst;
    F.eTo.Text := ceTo.Text;

    if FromId<>0 then
    begin
      F.eFrom.Tag := FromId;
      F.lFrom.Tag := FromInst;
      F.eFrom.Text := ceFrom.Text;
    end
    else
      F.sbFromClear.Click;

    if F.ShowModal = mrOk then
    begin
      DogId := F.qId.AsInteger;
      DogInst := F.qInst.AsInteger;
      ceDogovor.Text := F.qDog.AsString;
      DogovorOld := F.qDog.AsString;
      if (FromId <> F.qFrom_.AsInteger) or (FromInst <> F.qFrom_Inst.AsInteger) then
      begin
        FromId := F.qFrom_.AsInteger;
        FromInst := F.qFrom_Inst.AsInteger;
        ceFrom.Text := F.qFrom_Name.AsString;
      end;
    end;
  finally
    F.Free;
  end;
end;
//==============================================================================
procedure TPrihSopForm.FormShow(Sender: TObject);
begin
  //okey: �����, ������ ��� ��������� ����� �� ���� ����� ����� �����������
  //� ��� �������, ������� ��� �����
  //SortGridMemoryTable(dbgrid);
  ceFrom.SetFocus;
  mtAfterPost(nil);
  bbOk.Enabled := not ReadOnly;
  bbOkDop.Enabled := bbOk.Enabled;
  CommonVisibleCodInit(dbgrid);
  FLastNpField := dbgrid.FieldColumns[VISIBLE_COD_FIELDS[VisibleCod]].FieldName;
end;
//==============================================================================
procedure TPrihSopForm.sbClearDogovorClick(Sender: TObject);
begin
  DogId:=0; DogInst:=0;
  ceDogovor.Text:='';
  DogovorOld:='';
end;
//==============================================================================
procedure TPrihSopForm.mtAfterPost(DataSet: TDataSet);
var t: real;
  //****************************************************************************
  function Add0(s: string): string;
  var n: integer;
  begin
    n:=pos(DECIMALSEPARATOR,s);
    if n=0 then s:=s+DECIMALSEPARATOR+'00'
    else if n=length(s)-1 then
      s:=s+'0';
    result:=s;
  end;
  //****************************************************************************
begin
  if not FInit then
  begin
    lblCount.Caption:=IntToStr(trunc(dbgrid.SumList.SumCollection.Items[0].SumValue));
    t:=dbgrid.SumList.SumCollection.Items[2].SumValue;
    lblNoNds.Caption   := Add0(FloatToStr(t));
    lblNds.Caption     := Add0(FloatToStr(GetNds_NoNds(t,edActDate.Date)));
    lblWithNds.Caption := Add0(FloatToStr(GetWithNds_NoNds(t,edActDate.Date)));
    lblSumPrice.Caption := FloatToStr(Fround(dbgrid.SumList.SumCollection.Items[1].SumValue));
  end;
end;
//==============================================================================
procedure TPrihSopForm.N1Click(Sender: TObject);
begin
  CopyAfterSave:=TRUE;
  bbOk.Click;
end;
//==============================================================================
procedure TPrihSopForm.N2Click(Sender: TObject);
begin
  RashAfterSave:=TRUE;
  bbOk.Click;
end;
//==============================================================================
procedure TPrihSopForm.pnlOperDblClick(Sender: TObject);
var
  q: TOilQuery;
  i: integer;
  r: real;
begin
  if not Debugging then
    exit;
  q := TOilQuery.Create(nil);
  try
    q.Session := frmStart.OraSession1;
    q.Sql.Text := ' select * from v_oil_np_type where us_subgroup_id is not null order by sin(id)';
    _OpenQueryOra(q);
    Randomize;
    for i:=1 to 40 do begin
      if mt.State=dsBrowse then mt.Insert;
      mt['np_type_id'] := q['id'];
      mt['np_type'] := q['name'];
      mt['us_subgroup_name'] := q['us_subgroup_name'];
      mt['shtuki'] := Random(100)+1;
      r:=random(1000);
      mt['ss'] := r/100;
      mt['price'] := r*1.5/100;
      mt.Post;
      q.Next;
    end;
  finally
    q.Free;
  end;
end;
//==============================================================================
procedure TPrihSopForm.ceToButtonClick(Sender: TObject);
var
  vId,vInst:integer;
  vName:string;
begin
  if ChooseOrg.CaptureOrg(1,Main_id,Inst,'yyx',vId,vInst,vName) then begin
    ceTo.Text:=vName;
    ToId:=vId;
    ToInst:=vInst;
    RezId:=0; RezInst:=0;
    ceRezerv.Text:='';
  end;
end;
//==============================================================================
procedure TPrihSopForm.edActDateChange(Sender: TObject);
begin
  bbOk.Enabled:=not ReadOnly and (edActDate.Date>StrToDate(CLOSE_DATE));
  bbOkDop.Enabled:=bbOk.Enabled;
end;
//==============================================================================
procedure TPrihSopForm.miVisibleCodClick(Sender: TObject);
begin
  inherited;
  VisibleCod := CommonVisibleCodByName((Sender as TMenuItem).Name);
end;

procedure TPrihSopForm.edActChange(Sender: TObject);
begin
  inherited;
  TTNAvias:=edAct.text;
end;

procedure TPrihSopForm.cbCreatePartClick(Sender: TObject);
begin
  inherited;
  AdmSettings.Save(ADM_CREATE_PART, BoolToYN(cbCreatePart.Checked));
end;

end.
