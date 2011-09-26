unit SynchroPart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, MemTable, Grids, DBGridEh, MemDS, DBAccess, Ora, ExtCtrls,uStart,
  StdCtrls, Buttons, uHelpButton, uCommonForm,uOilQuery,uOilStoredProc;

type
  TSynchroPartForm = class(TCommonForm)
    grid1: TDBGridEh;
    ds: TOraDataSource;
    mt: TMemoryTable;
    mtID_FROM: TFloatField;
    mtDOG_FROM: TStringField;
    mtNP_TYPE_ID_FROM: TFloatField;
    mtNP_TYPE_FROM: TStringField;
    mtID_TO: TFloatField;
    mtDOG_TO: TStringField;
    mtNP_TYPE_ID_TO: TFloatField;
    mtNP_TYPE_TO: TStringField;
    mtPOST_ID_FROM: TFloatField;
    mtPOST_ID_TO: TFloatField;
    mtPOST_INST_FROM: TFloatField;
    mtPOST_INST_TO: TFloatField;
    mtSEPARATOR: TStringField;
    qLoad: TOilQuery;
    gridDet: TDBGridEh;
    mtDet: TMemoryTable;
    dsDet: TOraDataSource;
    mtDetTEXT_TO: TStringField;
    mtDetTEXT_FROM: TStringField;
    mtPOST_NAME_FROM: TStringField;
    mtPOST_NAME_TO: TStringField;
    mtOWN_GOODS_FROM: TStringField;
    mtOWN_GOODS_TO: TStringField;
    mtDetIS_EQUAL: TBooleanField;
    mtINST_FROM: TFloatField;
    mtINST_TO: TFloatField;
    mtPLAN_ID_TO: TFloatField;
    Panel1: TPanel;
    sp: TOraStoredProc;
    qMatch: TOilQuery;
    Panel2: TPanel;
    btnClose: TBitBtn;
    btnAll: TBitBtn;
    btnOne: TBitBtn;
    OilHelpButton1: TOilHelpButton;
    mtMAY_SYNCHR: TBooleanField;
    mtDOG_DATE_FROM: TStringField;
    mtDOG_DATE_TO: TStringField;
    procedure FillMt;
    procedure SynchrOne;
    procedure UpdateTo(p_From: TDataSet);
    procedure FillMtDet;
    procedure FindMatch;
    procedure FindMatches;
    procedure FormShow(Sender: TObject);
    procedure grid1Columns6EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure gridDetGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure grid1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure btnOneClick(Sender: TObject);
    procedure btnAllClick(Sender: TObject);
    procedure mtBeforePost(DataSet: TDataSet);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grid1Columns1EditButtonClick(Sender: TObject;
      var Handled: Boolean);
  private
    { Private declarations }
    PasswordEntered: Boolean;
  public
    { Public declarations }
  end;

var
  SynchroPartForm: TSynchroPartForm;

implementation

{$R *.DFM}

uses UDbFunc,PartRef,Main,OilStd,Passw,uCrypt;
//==============================================================================
function GetOwnGoodsName(p_OwnGoods: string): string;
begin
  if p_OwnGoods='K' then result:=TranslateText('Комиссия')
  else if p_OwnGoods='O' then result:=TranslateText('Собственный')
  else if p_OwnGoods='S' then result:=TranslateText('Хранение')
  else result:='';
end;
//==============================================================================
procedure TSynchroPartForm.FillMt;
begin
  ds.DataSet:=nil;
  if qLoad.Active then qLoad.Close;
  _OpenQueryOra(qLoad);
  CopyToMemoryTable(qLoad,mt,
    'ID:ID_FROM,INST:INST_FROM,DOG:DOG_FROM,DOG_DATE:DOG_DATE_FROM,FROM_:POST_ID_FROM,'+
    'OWN_GOODS:OWN_GOODS_FROM,FROM_INST:POST_INST_FROM,FROM_NAME:POST_NAME_FROM,'+
    'NP_TYPE:NP_TYPE_ID_FROM,NP_TYPE_NAME:NP_TYPE_FROM,SEPARATOR');
  mt.First;
  FindMatches;
  ds.DataSet:=mt;
end;
//==============================================================================
procedure TSynchroPartForm.FormShow(Sender: TObject);
begin
  PasswordEntered:=FALSE;
  FillMt;
end;
//==============================================================================
procedure TSynchroPartForm.UpdateTo(p_From: TDataSet);
var b: Boolean;
begin
  b:=ds.DataSet=nil;
  if not b then ds.DataSet:=nil;
  UpdateMemoryTable(p_From,mt,
    'ID:ID_TO,INST:INST_TO,NP_TYPE:NP_TYPE_ID_TO,NP_TYPE_NAME:NP_TYPE_TO,'+
    'DOG:DOG_TO,DOG_DATE:DOG_DATE_TO,FROM_:POST_ID_TO,FROM_INST:POST_INST_TO,'+
    'FROM_NAME:POST_NAME_TO,OWN_GOODS:OWN_GOODS_TO,PLAN_ID:PLAN_ID_TO');
  if not b then ds.DataSet:=mt;
end;
//==============================================================================
procedure TSynchroPartForm.grid1Columns6EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var F: TPartRefForm;                               
begin
  if not mt.Active or mt.IsEmpty or (mtID_FROM.AsInteger=0) then exit;
  Application.CreateForm(TPartRefForm,F);
  F.chPlan_Id.Checked:=TRUE;
  F.rbPlan_Id_Y.Checked:=TRUE;
  F.Tag:=10;
  if F.ShowModal=mrOk then begin
    if (F.qID.AsInteger=mtId_From.AsInteger) and
       (F.qInst.AsInteger=mtInst_From.AsInteger)
    then begin
      F.Free;
      MessageDlg(TranslateText('Нельзя синхронизировать партию саму с собой'),mtWarning,[mbOk],0)
    end else begin
      if mt.State=dsBrowse then
        if mt.RecordCount=0 then mt.Insert
        else mt.Edit;

      UpdateTo(F.q);
      F.Free;
    end;
  end;

end;
//==============================================================================
procedure TSynchroPartForm.dsDataChange(Sender: TObject; Field: TField);
begin
  FillMtDet;
end;
//==============================================================================
procedure TSynchroPartForm.FindMatch;
begin
  if not mt.Active or mt.IsEmpty or (mtId_From.AsInteger=0) then exit;
  if sp.Active then sp.Close;
  DefineSpParamsOra(sp,
    ['p_Id',           mtId_From.Value,
     'p_Inst',         mtInst_From.Value]);
  __ExecProcOra(sp);
  if sp.ParamByName('pp_Id').IsNull then exit;
  _OpenQueryParOra(qMatch,
    ['ID',             sp.ParamByName('pp_Id').Value,
     'INST',           sp.ParamByName('pp_Inst').Value]);
  UpdateTo(qMatch);
end;
//==============================================================================
procedure TSynchroPartForm.FindMatches;
begin
  mt.First;
  while not mt.Eof do begin
    FindMatch;
    mt.Next;
  end;
  mt.First;
end;
//==============================================================================
procedure TSynchroPartForm.FillMtDet;
begin
  dsDet.DataSet:=nil;
  if not mtDet.Active then mtDet.Open;
  mtDet.EmptyTable;

  mtDet.Insert;
  if mtDog_Date_From.AsString <> '' then
    mtDetText_From.AsString := mtDog_Date_From.AsString;
  if mtDog_Date_To.AsString <> '' then
    mtDetText_To.AsString := mtDog_Date_To.AsString;
  mtDetIs_Equal.AsBoolean:=TRUE;//mtDog_Date_From.Value=mtDog_Date_To.Value;

  mtDet.Post;
  mtDet.Insert;
  mtDetText_From.AsString:=mtNp_Type_From.AsString;
  mtDetText_To.AsString:=mtNp_Type_To.AsString;
  mtDetIs_Equal.AsBoolean:=mtNp_Type_Id_From.AsInteger=mtNp_Type_Id_To.AsInteger;
  mtDet.Post;

  mtDet.Insert;
  mtDetText_From.AsString:=GetOwnGoodsName(mtOwn_Goods_From.AsString);
  mtDetText_To.AsString:=GetOwnGoodsName(mtOwn_Goods_To.AsString);
  mtDetIS_Equal.AsBoolean:=mtOwn_Goods_From.AsString=mtOwn_Goods_To.AsString;
  mtDet.Post;

  mtDet.Insert;
  mtDetText_From.AsString:=mtPost_Name_From.AsString;
  mtDetText_To.AsString:=mtPost_Name_To.AsString;
  mtDetIs_Equal.AsBoolean:=(mtPost_Id_From.AsInteger=mtPost_Id_To.AsInteger) and
    (mtPost_Inst_From.AsInteger=mtPost_Inst_To.AsInteger);
  mtDet.Post;

  dsDet.DataSet:=mtDet;
end;
//==============================================================================
procedure TSynchroPartForm.gridDetGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if not mtDetIs_Equal.AsBoolean and (mtId_To.AsInteger<>0) then
    AFont.Color:=clRed;
end;
//==============================================================================
procedure TSynchroPartForm.grid1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (Column.FieldName='ID_TO') and (mtId_To.AsInteger=0) or
     (Column.FieldName='ID_FROM') and (mtId_From.AsInteger=0)
  then
    AFont.Color:=Background;

  if not mtMay_Synchr.AsBoolean then
    AFont.Color:=clRed;

  if Column.FieldName='SEPARATOR' then
    AFont.Color:=clGray;
end;
//==============================================================================
procedure TSynchroPartForm.SynchrOne;
begin
  if not mt.Active or mt.IsEmpty then exit;
  StartSqlOra;
  if (ANSIUpperCase(mtDog_From.AsString)<>ANSIUpperCase(mtDog_To.AsString)) and
    not PasswordEntered
  then begin
    MessageDlg(TranslateText('Для замены партий с разными названиями нужно ввести пароль администратора'),mtWarning,[mbOk],0);
    if not TestPassword(pwtPart) then exit;
    PasswordEntered:=TRUE;
  end;

  _ExecProcOra('OILT.SYNCHRONIZE',
    ['p_Table',              'OIL_PART',
     'p_IdFrom',             mtId_From.Value,
     'p_InstFrom',           mtInst_From.Value,
     'p_IdTo',               mtId_To.Value,
     'p_InstTo',             mtInst_To.Value
    ]);
  CommitSqlOra;
end;
//==============================================================================
procedure TSynchroPartForm.btnOneClick(Sender: TObject);
begin
  if mtMay_Synchr.AsBoolean then begin
    SynchrOne;
    mt.Delete;
  end else
    MessageDlg(TranslateText('Невозможно провести замену пока не соответствуют параметры партий'),mtWarning,[mbOk],0);
end;
//==============================================================================
procedure TSynchroPartForm.btnAllClick(Sender: TObject);
begin
  mt.First;
  while not mt.Eof do begin
    if mtMay_Synchr.AsBoolean then begin
      SynchrOne;
      mt.Delete;
    end else
      mt.Next;
  end;
end;
//==============================================================================
procedure TSynchroPartForm.mtBeforePost(DataSet: TDataSet);
begin
  mtMay_Synchr.AsBoolean:=
    not (
     (mtNp_Type_Id_From.AsInteger<>mtNp_Type_Id_To.AsInteger) or
     (mtPost_Id_From.AsInteger<>mtPost_Id_To.AsInteger) or
     (mtPost_Inst_From.AsInteger<>mtPost_Inst_To.AsInteger) or
     (mtOwn_Goods_From.AsString<>mtOwn_Goods_To.AsString)
    );
end;
//==============================================================================
procedure TSynchroPartForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;
//==============================================================================
procedure TSynchroPartForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;
//==============================================================================
procedure TSynchroPartForm.grid1Columns1EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var F: TPartRefForm;
begin
  Application.CreateForm(TPartRefForm,F);
  F.chPlan_Id.Checked:=TRUE;
  F.rbPlan_Id_N.Checked:=TRUE;
  F.GroupBox3.Enabled:=TRUE;
  F.Tag:=10;
  if F.ShowModal=mrOk then begin
    if mt.State=dsBrowse then
      if mt.RecordCount=0 then mt.Insert
      else mt.Edit;

    UpdateMemoryTable(F.q,mt,
      'ID:ID_FROM,INST:INST_FROM,NP_TYPE:NP_TYPE_ID_FROM,NP_TYPE_NAME:NP_TYPE_FROM,'+
      'DOG:DOG_FROM,DOG_DATE:DOG_DATE_FROM,FROM_:POST_ID_FROM,FROM_INST:POST_INST_FROM,'+
      'FROM_NAME:POST_NAME_FROM,OWN_GOODS:OWN_GOODS_FROM');
    mt.Edit;
    mtSeparator.AsString:='=>';
    mt.Post;
  end;
  F.Free;
end;
//==============================================================================
end.
