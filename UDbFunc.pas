unit UDbFunc;
{### 2.10}
interface

uses uCommonForm,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, MemTable, ExtCtrls, Ora, MemDS, DBAccess, stdctrls,
  OraScript,uOilQuery,uOilStoredProc{$IFDEF VER150},Variants,StrUtils{$ENDIF},
  DAScript, uApplicationInfo;

const RET_NO_ROWS=0;
      RET_ONE_ROW=1;
      RET_MORE_THEN_ONE_ROW=2;

      ODAC_MODE=0;
      BDE_MODE=1;
type
  TAdmSettings = class
  public
    procedure Save(AName: string; AValue: string);
    procedure Delete(AName: string);
    function Get(AName:string):Variant;
    function GetOrDef(AName: string; ADefaultValue: Variant): Variant;
    function Exist(AName:string):boolean;
  end;

type
  TDbFunc = class(TDataModule)
    QOrg: TOilQuery;
    Q: TOilQuery;
    TempExTable: TTable;
    TempExTableA: TStringField;
    TempExTableB: TStringField;
    TempExTableC: TStringField;
    TempExTableD: TStringField;
    TempExTableE: TStringField;
    TempExTableF: TStringField;
    TempExTableG: TStringField;
    TempExTableH: TStringField;
    QRekvizit: TOilQuery;
    qOrgName: TOilQuery;
    qOrgNameID: TFloatField;
    qOrgNameINST: TFloatField;
    qOrgNameNAME: TStringField;
    qOrgNameTRUNC_NAME: TStringField;
    QOblInstList: TOilQuery;
    qCardId: TOilQuery;
    scrCompile: TOraScript;
    qIdNum: TOilQuery;
    qCrRegionRest: TOilQuery;
    procedure qOrgNameCalcFields(DataSet: TDataSet);
    procedure scrCompileError(Sender: TObject; E: Exception; SQL: String;
      var Action: TErrorAction);
    procedure CompilePackets;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DbFunc: TDbFunc;
  AdmSettings: TAdmSettings;
  ApplicationInfo: TApplicationInfo;

function GetNextId(p_TableName: string; p_ParValues: array of variant; p_SeqName: string=''): integer;
function _RecordCount(TableName,Conditions:string):integer;
function GetOrgName(id,inst:integer):string;
function GetOblId(orgid,orginst:integer):integer;
function GetOrgType(orgid,orginst:integer):integer;
function GetPponId(orgid,orginst:integer):integer;
function OrgHasAZS(orgid,orginst:integer):boolean;
function OrgHasPpon(orgid,orginst:integer):boolean;
function GetOperationName(id:integer):string;
function GetNpGName(id: integer): string;
function GetNpName(id: integer): string;
function GetOrgTypeName(id:integer):string;
procedure GetOrgRekvizit(id,inst:integer; var id_r, inst_r, name_bank, chet_rach, mfo_bank :string); //by Okey
function GetOrgByOKPO(okpo:string;var id,inst:integer;var name,state:string):integer;
function GetFullAzsName(id:integer):string;
procedure SetState(TableName:string;id,inst:integer;state:string;InsideTransaction:Boolean=FALSE);
// берет ID записи со STATE=N
function GetFreeId(ATableName:string;AIdFieldName:string='ID';AInstFieldName:string='INST'):integer;
procedure __ExecProc(p_SP:TOilStoredProc);
procedure _ExecProc(p_ProcName:string;
                   p_ParValues:array of variant;
                   p_AnalyzeResult:Boolean=FALSE);
procedure __ExecSQL(p_Q:TOilQuery);
procedure _ExecSql(p_SQL:string); overload;
procedure _ExecSql(p_SQL:string; p_ParValues: array of variant); overload;
procedure __ExecProcOra(p_SP:TOraStoredProc);
procedure _ExecProcOra(p_ProcName:string;
                       p_ParValues:array of variant;
                       p_AnalyzeResult:Boolean=FALSE);
procedure __ExecSQLOra(p_Q:TOilQuery);
procedure _ExecSqlOra(p_SQL:string); overload;
procedure _ExecSqlOra(p_SQL:string; p_ParValues: array of variant); overload;
function DetectOrgByOkpo(p_OKPO, p_NAME: string; var pp_ID, pp_INST: integer;
  var pp_RES: string; p_OPTIONS: string='yyyy'):string;
procedure _OpenQuery(var q:TOilQuery);
procedure _OpenQueryOra(var q:TOilQuery);
procedure DefineSpParams(p_SP:TOilStoredProc;p_ParValues:array of variant);
procedure DefineQParams(var p_Q:TOilQuery;p_ParValues:array of variant);
procedure DefineQParamsOra(var p_Q:TOilQuery;p_ParValues:array of variant);
procedure _OpenQueryPar(var p_Q:TOilQuery;p_ParValues:array of variant);overload;
procedure _OpenQueryPar(var p_Q:TOraQuery;p_ParValues:array of variant);overload;
procedure _OpenQueryParOra(var p_Q:TOilQuery;p_ParValues:array of variant);
procedure OpenQueryParOraAdv(p_Q: TOilQuery; p_ParValues: array of variant);
function GetInListCondition(p_Var,p_List:string):string;
function GetSeqNextVal(p_Sequence:string;p_CreateOnFailed:boolean=false):integer;
function FullSqlText(q:TOilQuery):string;
function FullSqlTextOra(q:TOilQuery):string;
function GetSQLValue(p_Sql:string; p_Field:string=''):Variant;
function GetSqlValuePar(
  p_Sql: string;
  p_Params: array of string;
  p_ParamTypes: array of TFieldType;
  p_Values: array of variant;
  p_Field: string = ''): Variant;
function GetSqlValueParSimple(
  p_Sql: string;
  p_ParValues:array of variant;
  p_Field: string = ''): Variant;
function GetQValue(p_Field,p_Table,p_Where:string):Variant;
function GetQValueByIdInst(
  p_Field,p_Table:string;
  p_ID: integer;
  p_Inst:integer=0):Variant;
function GetOblInstList(p_OrgId:integer):string;
procedure SimpleWriteOilVar(p_Name:string;p_Value:String);
procedure WriteOilVar(p_Name:string;p_Value:Variant);
function ReadOilVar(p_Name:string):string;
function GetNameList(p_IdList,p_TableName:string):string;
function GetSQLList(p_Sql:string; p_Field:string=''; p_Sep:string=','):string;
procedure LoadStringList_OilVar(p_Names:string;var pp_SL:TStringList);
procedure SaveStringList_OilVar(p_SL:TStringList);
function DBObjectExists(ObjectName:string;ObjectType:string='TABLE';Owner: string=''):boolean;
function DBObjectUsed(ObjectName:string;ObjectType:string='TABLE';Owner: string=''):boolean;
function DBUserExists(ObjectName:string):boolean;
procedure CopyToMemoryTable(
  p_From: TDataSet; p_To: TMemoryTable; p_Fields:string='';
  p_ConditionField: string=''; p_ConditionValue: string='';
  p_Clear: Boolean = true);
procedure CopyToMemoryTableOne(p_From: TDataSet; p_To: TMemoryTable; p_Fields:string='');
procedure CopyToMemoryTableOneSL(p_From: TDataSet; p_To: TMemoryTable; p_SL: TStringList);
procedure InitQuery(var pp_Query: TOilQuery; p_Owner: TComponent = nil);
function GetAllOblInst(p_INST: integer):string;
function GetBlackPodrList(p_OKPO: string; p_OtherOnly: Boolean=FALSE): string;
function GetCardId(p_Id: integer; p_Date: TDateTime):integer;
function GetFullName(p_Id,p_Inst: integer; p_Name: string=''): string;
function IsBeforeArchiveBase: Boolean;
function TestPartMovement(
  p_PartId,p_PartInst: integer;
  p_RezId,p_RezInst: integer;
  p_TableName: string;
  p_Id,p_Inst: integer;
  p_Count: Double;
  var err: string): Boolean;
function GetUniquePartName(APartName: string; ADeep: integer = 0 ): string;
function TestSopPrihDelete(p_GroupNum,p_Inst: integer; var pp_Err: string): Boolean;
procedure DataSetToDbf(
  p_Q: TDataSet; // датасет откуда будет происходить перенос
  p_Dir: string; // директория, в которой появится таблица
  p_TableName: string; // название таблицы
  p_Options: TStrings; // опции
  p_TableType: string='FOXPRO' // тип таблицы
  );
procedure UpdateMemoryTable(p_From: TDataSet; p_To: TMemoryTable; p_Fields:string='');
procedure DefineSpParamsOra(p_SP:TOraStoredProc;p_ParValues:array of variant);
function GetOrgData(
  pp_Q: TOilQuery;
  p_Id,p_Inst: integer;
  p_RekId: integer = 0;
  p_RekInst: integer = 0): Boolean;
procedure InsOrUpdRecord(p_Table: string; p_Values: array of variant);
function GetOblByTalonNum(p_Num: integer): integer;
procedure FillRezList(
  p_SL: TStrings;
  p_DepId: integer;
  p_PartId: integer=0;
  p_PartInst: integer=0;
  p_Mes: boolean=true);
procedure DefineRashRez(
  edRez: TComboBox;
  qRez: TOilQuery;
  p_DepId: integer;
  p_PartId: integer=0;
  p_PartInst: integer=0);
procedure CheckForeignKeys;
procedure GetNNAddrPhone(p_Id,p_Inst: integer; var pp_Addr,pp_Phone: string);
procedure RunFillCardTransitPart(p_DateTo: TDateTime);
procedure RecompileInvalidProc(p_ProcName: string);
function IsObl(AOblId: Integer): Boolean;
function IsFilialNK(Inst: Integer): Boolean;
function TestDuplicateIdNum(p_IdNum: string; p_OrgId,p_OrgInst: integer): boolean;
procedure SaveCardAlienDoc(p_OblId: integer; p_Date: TDateTime);
procedure DefineRepDates(
  p_BeginDate,p_EndDate: TDateTime;
  p_Base: integer = 0 // 0 - ODAC, 1 - BDE
);
procedure DefineRepParam(AName, AValue: variant);
function GetRepDatesDesc: string;
procedure RefreshMatherializedViews;
procedure RefreshMatherializedView(AMatherializedViewName: string);
procedure ChangeOVLanguage(p_Lang: integer);
function OracleCompatibleValid : Boolean;
(** Проверяеться правильность региональных настроек Оракла на клиентах *)
procedure OracleNLSValid;
function IsEmitent(ADepId: Integer; AIncludeObl: boolean): Boolean;
function ChangeOrg2Dual():integer;
procedure UpdateFullMt(mt: TMemoryTable; p_Fields: string; p_Values: Variant); overload;
procedure UpdateFullMt(mt: TMemoryTable; p_Fields: string; p_Values: array of Variant); overload;
procedure UpdateFullMt(mt: TMemoryTable; p_Fields: string); overload;
function SearchMtRecord(mt: TMemoryTable; p_Field,p_Value: string; p_Partial: Boolean): Boolean;
function IsMyOrg(
  MyInst,  // Інст моєї головної організації
  Inst     // Інст його організації
  : Integer): Boolean; // чи є організація із номером "Inst" дочірньою організацією із номером "MyInst"
function CheckDestrTalon(ser: string; num:integer):boolean;
procedure MoveDownMemoryTable(p_MT: TMemoryTable; p_BM: string; p_Count: integer);
function MtValuesChanged(p_MT: TMemoryTable; p_Prefix: string; p_Sync: Boolean): Boolean;
procedure RecalcRegionRest(
  RecalcDate:TDateTime = 0; // Максимальна дата, по яку відбудеться перерахунок; зрівнюється з Close_Date_Alfa
  AEcho:boolean = True);  // Чи показувати попередження про перерахунок
(** Функции на ADM_POSSIBLE_INST *)
function FindRealInst(AInst: integer): integer;
function GetUserPossibleOrg(AUserId: integer): integer;
function GetInst_List(OrgId,OrgInst:integer): string;
function InstIsPossible(p_Inst: integer): boolean;
function IsPossibleAzs(AId,AInst:integer):boolean;
(** Функции на ADM_POSSIBLE_INST. Конец *)

function GetNPGroup(p_NP: integer): integer; // взнаємо групу НП по типу НП

implementation

{$R *.DFM}

uses ExFunc,OilStd, Main, GetFromGrid, TextFunc, uStart, MoneyFunc, uExeSql, uCrypt, Math;

//==============================================================================
function GetNextId(p_TableName: string; p_ParValues: array of variant; p_SeqName: string=''): integer;
// p_SeqName - якщо табличка має не стандартний сиквенс
var
  v: variant;
  i: integer;
  sWhere: string;
begin
  if high(p_ParValues) mod 2 = 0 then
    Raise Exception.Create('GetNextId: нечетное число элементов в p_ParValues');

  sWhere := '';
  for i := 0 to high(p_ParValues)-1 do
    if (i = 0) or (i mod 2 = 0) then
      sWhere := sWhere +' and '+ p_ParValues[i] +' = :'+ p_ParValues[i];

  v := GetSqlValueParSimple(
    'select min(Id) from '+ p_TableName +' where state = ''N'''+ sWhere, p_ParValues);

  if v = Null then
    result := GetSeqNextVal(decode([p_SeqName, '', 'S_'+ p_TableName, p_SeqName]))
  else result := v;
end;
//==============================================================================
procedure UpdateMemoryTable(p_From: TDataSet; p_To: TMemoryTable; p_Fields:string='');
var
  sl: TStringList;
  i,n: integer;
  s1,s2: string;
begin
  try
    if p_Fields<>'' then Str2StringList(p_Fields,sl);
    if p_To.State=dsBrowse then
      if p_To.IsEmpty then p_To.Insert
      else p_To.Edit;
    if p_Fields='' then
      for i:=0 to p_To.Fields.Count-1 do
        p_To.Fields[i].Value:=p_From.Fields[i].Value
    else
      for i:=0 to sl.Count-1 do begin
        n:=pos(':',sl[i]);
        if n=0 then p_To.FieldValues[sl[i]]:=p_From.FieldValues[sl[i]]
        else begin
          s1:=copy(sl[i],1,n-1);
          s2:=copy(sl[i],n+1,length(sl[i]));
          p_To.FieldValues[s2]:=p_From.FieldValues[s1];
        end;
      end;
    p_To.Post;
  finally
    if Assigned(sl) then sl.Free;
  end;
end;

//==============================================================================
procedure DefineQParams(var p_Q:TOilQuery;p_ParValues:array of variant);
var i:integer;
begin
     if high(p_ParValues) mod 2 = 0 then
        Raise Exception.Create(TranslateText('DefineSpParams: нечетное число элементов в p_ParValues'));
     for i:=0 to (high(p_ParValues) div 2) do
         p_Q.ParamByName(p_ParValues[i*2]).Value:=p_ParValues[i*2+1];
     p_Q.Prepare;
end;
//==============================================================================
procedure DefineQParamsOra(var p_Q:TOilQuery;p_ParValues:array of variant);
begin
  DefineQParams(p_Q,p_ParValues);
end;
//==============================================================================
procedure DefineQParamsOraAdv(p_Q: TOilQuery; p_ParValues: array of variant);
var i: integer;
begin
  if (high(p_ParValues)+1) mod 3 <> 0 then
    raise exception.create(TranslateText('DefineQParamsOraAdv: число элементов p_ParValues не кратно трём!'));
  for i:=0 to high(p_ParValues) div 3 do begin
    p_Q.ParamByName(p_ParValues[i*3]).ParamType:=ptInput;
    p_Q.ParamByName(p_ParValues[i*3]).DataType:=p_ParValues[i*3+1];
    p_Q.ParamByName(p_ParValues[i*3]).Value:=p_ParValues[i*3+2];
  end;
end;
//==============================================================================
procedure _OpenQueryOra(var q:TOilQuery);
begin
  qLog('========================================================================');
  LoadExeSql(q.Sql);
  try
    qlog(DateToStr(Date)+' '+TimeToStr(Time)+TranslateText(': начало'));
    qlog('----------------------------------------------------------------------');
    qLog(FullSqlTextOra(q));
    qlog('----------------------------------------------------------------------');
    q.UnPrepare;
    q.Prepare;
    q.Open;
    qlog('Opened');
    qlog('----------------------------------------------------------------------');
    qlog(DateToStr(Date)+' '+TimeToStr(Time)+TranslateText(': конец'));
    qLog('RecordCount='+IntToStr(q.RecordCount));
    qLog('IsEmpty='+BoolToDaNet(q.IsEmpty));
    qLog('========================================================================');
  except
    on E:Exception do begin
      if Main.Debugging and INTERACTIVE_LAUNCH_MODE then
        ShowTextInMemo(FullSqlTextOra(q));
      qlog(E.Message);
      qLog('========================================================================');
      Raise Exception.Create(E.Message);
    end;
  end;
end;
//==============================================================================
procedure _OpenQuery(var q:TOilQuery);
begin
  _OpenQueryOra(q);
end;
//==============================================================================
procedure _OpenQueryPar(var p_Q:TOilQuery;p_ParValues:array of variant);
begin
    LoadExeSql(p_Q.Sql);
    if p_Q.Active then p_Q.Close;
    DefineQParams(p_Q,p_ParValues);
    _OpenQuery(p_Q);
end;
//==============================================================================
procedure _OpenQueryPar(var p_Q:TOraQuery;p_ParValues:array of variant);
begin
    LoadExeSql(p_Q.Sql);
    if p_Q.Active then p_Q.Close;
    DefineQParams(TOilQuery(p_Q),p_ParValues);
    _OpenQuery(TOilQuery(p_Q));
end;
//==============================================================================
procedure _OpenQueryParOra(var p_Q:TOilQuery;p_ParValues:array of variant);
begin
    LoadExeSql(p_Q.Sql);
    if p_Q.Active then p_Q.Close;
    DefineQParamsOra(p_Q,p_ParValues);
    _OpenQueryOra(p_Q);
end;
//==============================================================================
procedure OpenQueryParOraAdv(p_Q: TOilQuery; p_ParValues: array of variant);
begin
  LoadExeSql(p_Q.Sql);
  if p_Q.Active then p_Q.Close;
  DefineQParamsOraAdv(p_Q,p_ParValues);
  _OpenQueryOra(p_Q);
end;
//==============================================================================
function DBObjectExists(ObjectName:string;ObjectType:string='TABLE';Owner: string=''):boolean;
var q : TOilQuery;
Begin
  Result := False;
  q:=TOilQuery.Create(nil);
  try
    q.SQL.Text := 'select count(*) as C from sys.all_objects where object_name='''+
                  ANSIUpperCase(ObjectName)+'''';
    if ObjectType <>'' then q.SQL.Add(' and object_type='''+ANSIUpperCase(ObjectType)+'''');
    if Owner<>'' then
      q.Sql.Add(' and owner=upper('''+owner+''')');
    _OpenQuery(q);
    if q.FieldByName('C').AsInteger > 0 then Result := True;
    q.Close;
  finally
    q.Free;
  end;
End;
//==============================================================================
function DBObjectUsed(ObjectName:string;ObjectType:string='TABLE';Owner: string=''):boolean;
var q : TOilQuery;
Begin
  Result := False;
  q:=TOilQuery.Create(nil);
  try
    q.SQL.Text := 'select count(*) as C from sys.v_$access where object='''+
                  ANSIUpperCase(ObjectName)+'''';
    if ObjectType <>'' then q.SQL.Add(' and type='''+ANSIUpperCase(ObjectType)+'''');
    if Owner<>'' then
      q.Sql.Add(' and owner=upper('''+owner+''')');
    _OpenQuery(q);
    if q.FieldByName('C').AsInteger > 0 then Result := True;
    q.Close;
  finally
    q.Free;
  end;
End;
//==============================================================================
function DBUserExists(ObjectName:string):boolean;
var q : TOilQuery;
Begin
  Result := False;
  q:=TOilQuery.Create(nil);
  try
    q.SQL.Text := 'select count(*) as C from SYS.all_users where username='''+
                  ANSIUpperCase(ObjectName)+'''';
    _OpenQuery(q);
    if q.FieldByName('C').AsInteger > 0 then Result := True;
    q.Close;
  finally
    q.Free;
  end;
End;
//==============================================================================
function GetRandomSavePoint:string;
const A='abcdefghijklmnopqrstuvwxyz0123456789';
      SP_LENGTH=10;
var i:integer;
begin
     result:='a';
     for i:=1 to SP_LENGTH do
         result:=result+A[random(length(A))+1];
end;
//==============================================================================
procedure __ExecSQL(p_Q:TOilQuery);
var savepoint:string;
    InsideTransaction:Boolean;
begin
     InsideTransaction:=frmStart.ORASESSION1.InTransaction;
     savepoint:=GetRandomSavePoint;
     StartSQL(InsideTransaction,savepoint);
     try p_Q.ExecSql;
     except on E:Exception do begin
               RollbackSQL(InsideTransaction,savepoint);
               if Main.Debugging and INTERACTIVE_LAUNCH_MODE then ShowTextInMemo(p_Q.Sql.Text);
               Raise Exception.Create(E.Message);
            end
     end;
     CommitSql(InsideTransaction);
end;
//==============================================================================
procedure _ExecSql(p_SQL:string);
var q:TOilQuery;
begin
     q:=TOilQuery.Create(nil);
     q.SQL.Text:=p_SQL;
     try __ExecSQL(q);
     finally q.Destroy;
     end;
end;
//==============================================================================
procedure _ExecSql(p_SQL:string; p_ParValues: array of variant); overload;
var q:TOilQuery;
begin
     q:=TOilQuery.Create(nil);
     q.SQL.Text:=p_SQL;
     DefineQParams(q,p_ParValues);
     try __ExecSQL(q);
     finally q.Destroy;
     end;
end;
//==============================================================================
procedure __ExecProc(p_SP:TOilStoredProc);
var savepoint:string;
    InsideTransaction:Boolean;
begin
     InsideTransaction:=frmStart.ORASESSION1.InTransaction;
     savepoint:=GetRandomSavePoint;
     StartSQL(InsideTransaction,savepoint);
     try p_SP.ExecProc;
     except on E:Exception do begin
               RollbackSQL(InsideTransaction,savepoint);
               Raise Exception.Create(E.Message);
            end
     end;
     CommitSql(InsideTransaction);
end;
//==============================================================================
procedure DefineSpParams(p_SP:TOilStoredProc;p_ParValues:array of variant);
var i:integer;
begin
     if high(p_ParValues) mod 2 = 0 then
        Raise Exception.Create(TranslateText('DefineSpParams: нечетное число элементов в p_ParValues'));
     for i:=0 to (high(p_ParValues) div 2) do
         p_SP.ParamByName(p_ParValues[i*2]).Value:=p_ParValues[i*2+1];
end;
//==============================================================================
procedure _ExecProc(p_ProcName:string;
                   p_ParValues:array of variant;
                   p_AnalyzeResult:Boolean=FALSE);
var sp:TOilStoredProc;
    res:string;
begin
     sp:=TOilStoredProc.Create(nil);
     sp.StoredProcName:=p_ProcName;
     try
        sp.Prepare;
        DefineSpParams(sp,p_ParValues);
        __ExecProc(sp);
        if p_AnalyzeResult then begin
           res:=sp.ParamByName('Result').AsString;
           if (Length(Res)>0) and (Res[1]<>'0') then
              Raise Exception.Create(SubStr(Res,2));
        end;
     finally
        sp.Destroy;
     end;
end;
//==============================================================================
procedure __ExecSQLOra(p_Q:TOilQuery);
var savepoint:string;
    InsideTransaction:Boolean;
begin
     InsideTransaction:=frmStart.OraSession1.InTransaction;
     savepoint:=GetRandomSavePoint;
     StartSQLOra(InsideTransaction,savepoint);
     try p_Q.ExecSql;
     except on E:Exception do begin
               RollbackSQLOra(InsideTransaction,savepoint);
               if Main.Debugging then ShowTextInMemo(p_Q.Sql.Text);
               Raise Exception.Create(E.Message);
            end
     end;
     CommitSqlOra(InsideTransaction);
end;
//==============================================================================
procedure _ExecSqlOra(p_SQL:string);
var q:TOilQuery;
begin
     q:=TOilQuery.Create(nil);
     q.Session:=frmStart.OraSession1;
     q.SQL.Text:=p_SQL;
     try __ExecSQLOra(q);
     finally q.Destroy;
     end;
end;
//==============================================================================
procedure _ExecSqlOra(p_SQL:string; p_ParValues: array of variant);
var q:TOilQuery;
begin
     q:=TOilQuery.Create(nil);
     q.Session:=frmStart.OraSession1;
     q.SQL.Text:=p_SQL;
     DefineQParamsOra(q,p_ParValues);
     try __ExecSQLOra(q);
     finally q.Destroy;
     end;
end;
//==============================================================================
procedure __ExecProcOra(p_SP:TOraStoredProc);
var InsideTransaction:Boolean;
begin
   InsideTransaction:=frmStart.OraSession1.InTransaction;
   StartSQLOra(InsideTransaction);
   try p_SP.ExecProc;
   except
     on E:Exception do begin
       RollbackSQLOra(InsideTransaction);
       raise;
     end
   end;
   CommitSqlOra(InsideTransaction);
end;
//==============================================================================
procedure DefineSpParamsOra(p_SP:TOraStoredProc;p_ParValues:array of variant);
var i:integer;
begin
     if high(p_ParValues) mod 2 = 0 then
        Raise Exception.Create(TranslateText('DefineSpParams: нечетное число элементов в p_ParValues'));
     for i:=0 to (high(p_ParValues) div 2) do
         p_SP.ParamByName(p_ParValues[i*2]).Value:=p_ParValues[i*2+1];
end;
//==============================================================================
procedure _ExecProcOra(p_ProcName:string;
                       p_ParValues:array of variant;
                       p_AnalyzeResult:Boolean=FALSE);
var sp:TOraStoredProc;
    res:string;
begin
     RecompileInvalidProc(p_ProcName);
     sp:=TOraStoredProc.Create(nil);
     sp.Session:=frmStart.OraSession1;
     sp.StoredProcName:=p_ProcName;
     try
        sp.Prepare;
        DefineSpParamsOra(sp,p_ParValues);
        __ExecProcOra(sp);
        if p_AnalyzeResult then begin
           res:=sp.ParamByName('Result').AsString;
           if (Length(Res)>0) and (Res[1]<>'0') then
              Raise Exception.Create(SubStr(Res,2));
        end;
     finally
        sp.Destroy;
     end;
end;
//==============================================================================
function GetQValue(p_Field,p_Table,p_Where:string):Variant;
var q:TOilQuery;
begin
    q:=TOilQuery.Create(nil);
    q.Session:=frmStart.OraSession1;
    try
      q.Sql.Text:='select '+p_Field+' from '+p_Table;
      if p_Where<>'' then
         q.Sql.Add('where '+p_Where);
      _OpenQueryOra(q);
      if q.RecordCount=0 then result:=null
      else result:=q.FieldByName(p_Field).Value;
    finally
      q.Destroy;
    end;
end;
//==============================================================================
function GetQValueByIdInst(
  p_Field,p_Table:string;
  p_ID: integer;
  p_Inst:integer=0):Variant;
var where:string;
begin
    where:='id='+IntToStr(p_Id);
    if p_Inst<>0 then where:=where+' and inst='+IntToStr(p_Inst);
    result:=GetQValue(p_Field,p_Table,where);
end;
//==============================================================================
procedure GetOrgRekvizit(id,inst:integer; var id_r, inst_r, name_bank, chet_rach, mfo_bank :string);
begin
     with DbFunc.QRekvizit do begin
          Close;
          ParamByName('id_').asInteger:=id;
          ParamByName('inst_').asInteger:=inst;
          Open;
          name_bank:=FieldByName('BANK_NAME').asString;
          chet_rach:=FieldByName('RACH_CHET').asString;
          mfo_bank:=FieldByName('BANK_MFO').asString;
          id_r:=FieldByName('R_ID').asString;
          inst_r:=FieldByName('R_INST').asString;
     end;
end;
//==============================================================================
function GetOrgName(id,inst:integer):string;
begin
    result:=nvl(GetQValueByIdInst('name','v_org',id,inst),'');
end;
//==============================================================================
function _RecordCount(TableName,Conditions:string):integer;
begin
  result:=GetSqlValue(
    'select count(*) as N from '+TableName+
    ' where '+Conditions);
end;
//==============================================================================
function GetOblId(orgid,orginst:integer):integer;
begin
    result:=nvl(GetQValueByIdInst('oblid','v_oil_org',orgid,orginst),0);
end;
//==============================================================================
function GetPponId(orgid,orginst:integer):integer;
begin
    result:=nvl(GetQValueByIdInst('pponid','v_oil_org',orgid,orginst),0);
end;
//==============================================================================
function GetOrgType(orgid,orginst:integer):integer;
begin
    result:=nvl(GetQValueByIdInst('org_id','v_oil_org',orgid,orginst),0);
end;
//==============================================================================
function OrgHasAZS(orgid,orginst:integer):boolean;
begin
     if _RecordCount('oil_org','org_type=8 and par='+IntToStr(orgid)+' and par_inst='+IntToStr(orginst))=0 then result:=FALSE
     else result:=TRUE;
end;
//==============================================================================
function OrgHasPpon(orgid,orginst:integer):boolean;
begin
     if _RecordCount('oil_org','org_type=3 and par='+IntToStr(orgid)+' and par_inst='+IntToStr(orginst))=0 then result:=FALSE
     else result:=TRUE;
end;
//==============================================================================
function GetOperationName(id:integer):string;
begin
    result:=nvl(GetQValueByIdInst('name','v_oil_oper_type',id,0),'');
end;
//==============================================================================
function GetNpGName(id: integer): string;
begin
  result := nvl(GetQValueByIdInst('fullname', 'v_oil_np_group', id, 0), '');
end;
//==============================================================================
function GetNpName(id: integer): string;
begin
  result := nvl(GetQValueByIdInst('name', 'v_oil_np_type', id, 0), '');
end;
//==============================================================================
function GetOrgTypeName(id:integer):string;
begin
    result:=nvl(GetQValueByIdInst('name','oil_org_type',id,0),'');
end;
//==============================================================================
function GetOrgByOKPO(okpo:string;var id,inst:integer;var name,state:string):integer;
begin
    DBFunc.QOrg.SQL.Text := 'select id, inst, name, state from v_org where id_num = '''+ okpo +'''';
    _OpenQuery(DBFunc.QOrg);
    if DBFunc.QOrg.RecordCount=0 then result:=RET_NO_ROWS
    else if DBFunc.QOrg.RecordCount>1 then result:=RET_MORE_THEN_ONE_ROW
    else begin
         id:=DBFunc.QOrg.FieldByName('id').AsInteger;
         inst:=DBFunc.QOrg.FieldByName('inst').AsInteger;
         name:=DBFunc.QOrg.FieldByName('name').AsString;
         state:=DBFunc.QOrg.FieldByName('state').AsString;
         result:=RET_ONE_ROW;
    end;
end;
//==============================================================================
function GetFullAzsName(id:integer):string;
begin
     result:='';
     DBFunc.QOrg.SQL.Text:='select oo1.name as azs,oo2.name as ppon,oo2.org_type from v_org oo1,v_org oo2 '+
                           'where oo1.par=oo2.id and oo1.par_inst=oo2.inst '+
                           'and oo1.id='+IntToStr(id);
     DBFunc.QOrg.Prepare;
     _OpenQuery(DBFunc.QOrg);
     if DBFunc.QOrg.RecordCount=0 then exit;
     result:=DBFunc.QOrg.FieldByName('azs').AsString+' ';
     if DBFunc.QOrg.FieldByName('org_type').AsInteger<>3 then
        result:=result+DBFunc.QOrg.FieldByName('ppon').AsString
     else result:=result+GetShortPPONName(DBFunc.QOrg.FieldByName('ppon').AsString);
end;
//==============================================================================
procedure SetState(TableName:string;id,inst:integer;state:string;InsideTransaction:Boolean=FALSE);
begin
  _ExecSQL('update '+TableName+' set state='''+state+''' '
    +'where id='+IntToStr(id)+' and inst='+IntToStr(inst));
end;
//==============================================================================
function GetFreeId(ATableName:string;AIdFieldName:string='ID';AInstFieldName:string='INST'):integer;
begin
  Result:=nvl(GetSqlValue(format('select min(%s) from %s where %s=ov.GetVal(''INST'') and state=''N'' ',
    [AIdFieldName,ATableName,AInstFieldName])),0);
end;
//==============================================================================
procedure TDbFunc.qOrgNameCalcFields(DataSet: TDataSet);
begin
     qOrgNameTrunc_Name.AsString:=GetTruncName(qOrgNameName.AsString);
end;
//==============================================================================
function DetectOrgByOkpo(p_OKPO, p_NAME: string; var pp_ID, pp_INST: integer;
  var pp_RES: string; p_OPTIONS: string='yyyy'):string;
const _REPLACE_NAME=1;
      _LEGAL_INST_ONLY=2;
      _ANALYZE_NAME=3;
      _ADD_FIRMA_AUTO=4;

var id,inst:integer;
    name,state,inst_condition:string;
    InsideTransaction:Boolean;
    q,q1:TOilQuery;

    procedure log(s:string);
    begin
      pp_RES:=pp_RES+s+' ';
    end;

begin
  if p_OKPO='' then begin
     MessageDlg(TranslateText('ОКПО организации неизвестно'),mtError,[mbOk],0);
     result:='E0HA'; exit;
  end;
  q:=TOilQuery.Create(nil);
  q1:=TOilQuery.Create(nil);
  try
    InsideTransaction:=frmStart.ORASESSION1.InTransaction;
    pp_RES:=''; result:='S??A';
    if p_OPTIONS[_LEGAL_INST_ONLY]='y' then
       // определяем ограничение на inst организации, если соответствующая опция установлена,
       // то нас будут интересовать только инсты из списка Inst_List
       inst_condition:='and (instr('''+Main.Inst_List+''','',''||to_char(inst)||'','')>0 or id=inst) '
    else inst_condition:='';


    q.Sql.Text := 'select id, inst, name, state from v_org where state = ''Y'' and id_num = '''+ p_OKPO +''' '+
      inst_condition;

    _OpenQuery(q);
    if q.RecordCount=0 then
    begin
      q.Close;
      q.Sql.Text := 'select id, inst, name, state from v_org where id_num = '''+ p_OKPO +''' '+
        inst_condition;
      _OpenQuery(q);
    end;

    if q.RecordCount=1 then begin
    // лучший случай - существует одна такая организация
       log(TranslateText('Организация найдена.'));
       result[2]:='1';
       id:=q.FieldByName('id').Value;
       inst:=q.FieldByName('inst').Value;
       name:=q.FieldByName('name').Value;
       state:=q.FieldByName('state').Value;
       if p_OPTIONS[_REPLACE_NAME]='y' then begin
       // если разрешена замена несовпадающего имени организации
          if (p_NAME<>'') and (p_NAME<>name) and (id<>inst) then begin
          // если при вызове имя указано и оно таки не совпадает
             result[4]:='B';
             if MessageDlg(TranslateText('Несоответствие имен для организации с кодом ОКПО ')+p_OKPO+#13#10+
                           TranslateText('Старое имя: ')+name+#13#10+
                           TranslateText('Новое имя:  ')+p_NAME+#13#10+
                           TranslateText('Заменить старое имя на новое?'),mtWarning,[mbYes,mbNo],0)=mrYes then begin
                try _ExecSql('update oil_org set name='''+p_NAME+''' '+
                             'where id='+IntToStr(id)+' and inst='+IntToStr(inst));
                    log(TranslateText('Старое имя ')+name+TranslateText(' было заменено на новое ')+p_NAME+'.');
                except on E: Exception do begin
                          log(TranslateText('При замене старого имени на новое произошла ошибка: ')+E.Message+'.');
                          MessageDlg(TranslateText('При замене старого имени на новое произошла ошибка: ')+E.Message+'.',
                                     mtError,[mbOk],0);
                          result[1]:='E'; result[3]:='A'; exit;
                       end;
                end
             end else log(TranslateText('Старое имя: ')+p_NAME+TranslateText('. Новое имя: ')+name+TranslateText('. Замена была отменена пользователем.'));
          end;
       end;

       result[3]:='B';
       if state='N' then begin
          MessageDlg(TranslateText('Организация ')+p_NAME+TranslateText(' была удалена.')+#13#10+
                     TranslateText('Сейчас она будет восстановлена.'),mtInformation,[mbOk],0);
          try
             SetState('oil_org',id,inst,'Y',InsideTransaction);
             log(TranslateText('Организация была восстановлена из удаленных.'));
          except
             log(TranslateText('При восстановлении организации произошла ошибка.'));
             MessageDlg(TranslateText('При восстановлении организации произошла ошибка.'),
                        mtError,[mbOk],0);
             result[1]:='E';
          end;
       end;

       pp_ID:=id; pp_INST:=inst;
       exit;
    end else

    if q.RecordCount=0 then begin
    // второй случай - организации с таким кодом ОКПО в базе нет
       log(TranslateText('Организация с ОКПО ')+p_OKPO+TranslateText(' не найдена.'));
       result[2]:='0';
       if (p_OPTIONS[_ANALYZE_NAME]='y') and (p_NAME<>'') then begin
          // если нужно искать по имени, и имя это указано
          q1.SQL.Text:='select id,inst,name from v_org where state=''Y'' and lower(name)='''+
                               DoubleQuotas(RusLowerCase(p_NAME))+''' '+
                       'and (id_num is null or id_num='''') '+
                       inst_condition;
          _OpenQuery(q1);

          if q1.RecordCount=0 then begin
             log(TranslateText('Организация с именем ')+p_NAME+TranslateText(' не найдена.'));
             result[3]:='D';
             if (p_Options[_ADD_FIRMA_AUTO]='y') or
                (MessageDlg(TranslateText('Организация ')+p_NAME+#13#10+
                            TranslateText('с кодом ОКПО ')+p_OKPO+TranslateText(' не найдена.')+#13#10+
                            TranslateText('Завести такую организацию автоматически?'),
                            mtWarning,[mbYes,mbNo],0)=mrYes) then begin
                try
                    pp_ID := DBSaver.SaveRecord('OIL_ORG',
                      ['ID',       0,
                       'STATE',    'Y',
                       'INST',     MAIN.INST,
                       'NAME',     p_NAME,
                       'ID_NUM',   p_OKPO,
                       'FACE',     0,
                       'ORG_TYPE', 1]);
                    pp_Inst:=MAIN.INST;
                    log(TranslateText('Она была автоматически добавлена'));
                    exit;
                except on E:Exception do begin
                          log(TranslateText('При попытке добавления возникла ошибка: ')+E.Message+'.');
                          MessageDlg(TranslateText('При попытке добавления возникла ошибка: ')+E.Message+'.',
                                     mtError,[mbOk],0);
                          result[1]:='E';exit;
                       end;
                end
             end else begin
                 log(TranslateText('Автоматическое добавление было отменено пользователем.'));
                 result[1]:='E'; result[3]:='B'; exit;
             end;
          end else if q1.RecordCount=1 then begin
              log(TranslateText('Найдена организация с нужным именем.'));
              if MessageDlg(TranslateText('Организация ')+p_NAME+#13#10+
                            TranslateText('с кодом ОКПО ')+p_OKPO+TranslateText(' не найдена.')+#13#10+
                            TranslateText('Обнаружена организация со сходным именем: ')+#13#10+
                            q1.FieldByName('name').AsString+#13#10+
                            TranslateText('Приписать к ней код ОКПО?'),
                            mtWarning,[mbYes,mbNo],0)=mrYes then begin
                 result[3]:='E';
                 try
                    _ExecSql('update oil_org set id_num='''+p_OKPO+''' '+
                              'where id='+q1.FieldByName('id').AsString+' and '+
                              '      inst='+q1.FieldByName('inst').AsString);
                    log(TranslateText('Код ОКПО был успешно добавлен.'));
                    pp_ID:=q1.FieldByName('id').AsInteger;
                    pp_INST:=q1.FieldByName('inst').AsInteger;
                 except on E:Exception do begin
                           log(TranslateText('При попытке добавления кода ОКПО произошла ошибка: ')+E.Message+'.');
                           result[1]:='E'; exit;
                        end;
                 end
              end else begin
                  log(TranslateText('Добавление кода ОКПО было отменено пользователем.'));
                  result[1]:='E'; result[3]:='C';exit;
              end;
          end else begin // if q1.RecordCount>1
              log(TranslateText('Найдено несколько организаций с нужным именем.'));
              q1.FieldByName('inst').Visible:=FALSE;
              MessageDlg(TranslateText('Найдено несколько организаций с именем ')+p_NAME+'.'+#13#10+
                         TranslateText('Выберите нужную из списка (в нее будет прописан код ОКПО ')+p_OKPO+')'#13#10+
                         TranslateText('или нажмите кнопку "Отмена".'),
                         mtInformation,[mbOk],0);
              if ChooseFromGrid(q1,'ID,Название',// *NO_TRANSLATE*
                TranslateText('Выберите организацию')) then 
              begin
                 log(TranslateText('Пользователем была выбрана одна.'));
                 result[3]:='G';
                 try _ExecSql('update oil_org set id_num='''+p_OKPO+''' '+
                              'where id='+q1.FieldByName('id').AsString+' and '+
                              '      inst='+q1.FieldByName('inst').AsString);
                     log(TranslateText('Код ОКПО был успешно добавлен.'));
                     pp_ID:=q1.FieldByName('id').Value;
                     pp_INST:=q1.FieldByName('inst').Value;
                     exit;
                 except on E:Exception do begin
                           log(TranslateText('При попытке добавления кода ОКПО произошла ошибка: ')+E.Message+'.');
                           result[1]:='E'; exit;
                        end;
                 end
              end else begin
                 log(TranslateText('Пользователь не захотел выбирать.'));
                 result[1]:='E'; result[3]:='F'; exit;
              end;

          end; // конец серии if-ов, проверки на q1.RecordCount

       end else begin // если не нужен анализ по имени
          result[1]:='E';result[3]:='A';
          exit;
       end; // конец проверки на необходимость анализа по имени

    end else begin// проверки на q.RecordCount
       log(TranslateText('Найдено несколько организаций с одинаковым кодом ОКПО.'));
       MessageDlg(TranslateText('Найдено несколько организаций с кодом ОКПО ')+p_OKPO+'.'+#13#10+
                  TranslateText('Эта ситуация является ошибкой и ее необходимо исправить.'),
                  mtError,[mbOk],0);
       result:='E2AA';
    end;

  finally
    q.Destroy;
    q1.Destroy;
  end;
end;
//==============================================================================
function GetInListCondition(p_Var,p_List:string):string;
begin
  if trim(p_List)='' then
    result:=' 0=1 '
  else
    result:=' '+p_Var+' in ('+p_List+') ';
end;
//==============================================================================
function GetSeqNextVal(p_Sequence:string;p_CreateOnFailed:boolean=false):integer;
var q:TOilQuery;
begin
  result:=0;
  q:=TOilQuery.Create(nil);
  try
    q.Session:=frmStart.OraSession1;
    try
      q.Sql.Text:='select '+p_Sequence+'.nextval as numb from dual';
      q.ExecSQL;
    except on ErrStr:Exception do
      if (pos('ORA-02289',ErrStr.Message)<>0) and p_CreateOnFailed then
      begin
        q.Sql.Text:='create sequence '+p_Sequence+' start with 1000 increment by 1 nocache';
        q.ExecSQL;
        q.Sql.Text:='select '+p_Sequence+'.nextval as numb from dual';
        _OpenQueryOra(q);
      end
      else
        raise Exception.Create('GetSeqNextVal ('+p_Sequence+'): '+ErrStr.Message);
    end;
    result:=q.FieldByName('numb').AsInteger;
    q.Close;
  finally
    q.Free;
  end;
end;
//==============================================================================
function GetParamValueOra(q:TOilQuery;p_Name:string):string;
var i,n:integer;
    s:string;
begin
  try
    n:=-1;
    if p_Name[1]=':' then
      p_Name:=copy(p_Name,2,length(p_Name));
    for i:=0 to q.ParamCount-1 do
      if UpperCase(q.Params[i].Name)=UpperCase(p_Name) then
      begin
        n:=i; break;
      end;
    if n=-1 then
      Raise Exception.Create(TranslateText('GetParamValue: неизвестное имя параметра ')+p_Name);
    if q.Params[n].IsNull then
      result:='null'
    else
    begin
      if q.Params[n].DataType in [ftString,ftDate,ftTime,ftDateTime,ftMemo] then
        s:=''''
      else
        s:='';
      result:=s+q.Params[n].AsString+s;
    end;
  except on e:Exception do
    Raise Exception.Create('GetParamValueOra ('+p_Name+')'+ #10#13 +e.Message);
  end;
end;
//==============================================================================
function GetParamValue(q:TOilQuery;p_Name:string):string;
begin
  GetParamValueOra(q,p_Name);
end;
//==============================================================================
function FullSqlText(q:TOilQuery):string;
begin
  result := FullSqlTextOra(q);
end;
//==============================================================================
function FullSqlTextOra(q:TOilQuery):string;
var
  i:integer;
  symbols:set of char;
  s:string;
begin
  symbols:=['a'..'z','A'..'Z','0'..'9','_',':'];
  i:=1; result:='';
  while i<=length(q.Sql.Text) do
  begin
    s:=GetWord(q.Sql.Text,symbols,i);
    if s[1]=':' then
      result:=result+GetParamValueOra(q,s)
    else
      result:=result+s;
  end;
end;
//==============================================================================
function GetOblInstList(p_OrgId:integer):string;
// получает на вход id организации
// на выход идет список id организаций обла, к которому принадлежит
// входная организация (нефтебаз и управления)
begin
    with DBFunc.QOblInstList do begin
       if Active then Close;
       ParamByName('id').AsInteger:=p_OrgId;
       _OpenQuery(DBFunc.QOblInstList);
       result:='';
       while not eof do begin
           result:=result+FieldByName('id').AsString+',';
           next;
       end;
       if result<>'' then SetLength(result,length(result)-1);
    end;
end;
//==============================================================================
function GetSQLValue(p_Sql:string; p_Field:string=''):Variant;
var q:TOilQuery;
begin
    q:=TOilQuery.Create(nil);
    q.Session:=frmStart.OraSession1;
    try
      q.Sql.Text:=p_Sql;
      _OpenQueryOra(q);
      if q.RecordCount=0 then result:=null
      else if q.RecordCount>1 then Raise Exception.Create(TranslateText('GetSqlValue: получено более одной записи'))
      else
          if p_Field='' then result:=q.Fields[0].Value
          else result:=q.FieldByName(p_Field).Value;
      q.Close;
    finally
      q.Free;
    end;
end;
//==============================================================================
function GetSqlValuePar(
  p_Sql: string;
  p_Params: array of string;
  p_ParamTypes: array of TFieldType;
  p_Values: array of variant;
  p_Field: string = ''): Variant;
var
  q: TOilQuery;
  i: integer;
begin
  q:=TOilQuery.Create(nil);
  q.Session:=frmStart.OraSession1;
  try
  try
    q.Sql.Text:=p_Sql;
    q.Prepare;
    {if High(p_Params)-Low(p_Params)+1<>q.Params.Count then
      raise exception.create('GetSqlValuePar: параметр p_Params не соответствует по длине числу реальных параметров запроса');
    if High(p_ParamTypes)-Low(p_ParamTypes)+1<>q.Params.Count then
      raise exception.create('GetSqlValuePar: параметр p_ParamTypes не соответствует по длине числу реальных параметров запроса');
    if High(p_Values)-Low(p_Values)+1<>q.Params.Count then
      raise exception.create('GetSqlValuePar: параметр p_Values не соответствует по длине числу реальных параметров запроса');}

    for i:=0 to High(p_Params) do
      with q.ParamByName(p_Params[i]) do begin
        ParamType:=ptInput;
        DataType:=p_ParamTypes[i];
        Value:=p_Values[i];
      end;

    _OpenQueryOra(q);
    if q.RecordCount=0 then result:=null
    else if q.RecordCount>1 then Raise Exception.Create(TranslateText('GetSqlValue: получено более одной записи'))
    else
        if p_Field='' then result:=q.Fields[0].Value
        else result:=q.FieldByName(p_Field).Value;
  except
    on E: Exception do
      raise exception.create('GetSqlValuePar: '+E.Message);
  end;
  q.Close;
  finally
    q.Free;
  end;
end;
//==============================================================================
function GetSqlValueParSimple(
  p_Sql: string;
  p_ParValues:array of variant;
  p_Field: string = ''): Variant;
var
  q: TOilQuery;
begin
  q:=TOilQuery.Create(nil);
  q.Session:=frmStart.OraSession1;
  try
  try
    q.Sql.Text:=p_Sql;
    //q.Prepare; Нужно делать после установки параметров
    _OpenQueryParOra(q,p_ParValues);
    if q.RecordCount=0 then result:=null
    else if q.RecordCount>1 then Raise Exception.Create(TranslateText('GetSqlValue: получено более одной записи'))
    else
        if p_Field='' then result:=q.Fields[0].Value
        else result:=q.FieldByName(p_Field).Value;
  except
    on E: Exception do
      raise exception.create('GetSqlValuePar: '+E.Message);
  end;
  q.Close;
  finally
    q.Free;
  end;
end;
//==============================================================================
function GetSQLList(p_Sql:string; p_Field:string=''; p_Sep:string=','):string;
var q:TOilQuery;
    com:string;

    function _GetVal:string;
    begin
        if p_Field='' then result:=q.Fields[0].AsString
        else result:=q.FieldByName(p_Field).AsString;
    end;

begin
    q:=TOilQuery.Create(nil);
    q.Session:=frmStart.OraSession1;
    try
      q.Sql.Text:=p_Sql;
      _OpenQueryOra(q);
      result:=''; com:='';
      while not q.Eof do begin
          if pos(p_Sep,_GetVal)>0 then begin
             com:='"'; break;
          end;
          q.Next;
      end;
      q.First;
      while not q.Eof do begin
          result:=result+com+_GetVal+com+p_Sep;
          q.Next;
      end;
      SetLength(result,length(result)-length(p_Sep));
    finally
      q.Destroy;
    end;
end;
//==============================================================================
//==============================================================================
const OIL_VAR_NAME_SIZE=50;
      OIL_VAR_VALUE_SIZE=500;
      OIL_VAR_SEP='@@@';
//==============================================================================
function GetOilVarPartName(p_Name:string; p_Num:integer):string;
begin
  if p_Num=0 then result:=p_Name
  else result:=p_Name+OIL_VAR_SEP+IntToStr(p_Num);
end;
//==============================================================================
procedure SimpleWriteOilVar(p_Name:string;p_Value:String);
Begin
  if GetSQLValue('select count(*) from oil_var where name='''+p_Name+'''')=0
     then _ExecSql('insert into oil_var (name,value) values ('''+p_Name+''','''+p_Value+''')')
     else _ExecSql('update oil_var set value= '''+p_Value+''' where name='''+p_Name+'''');
End;
//==============================================================================
procedure WriteOilVar(p_Name: string; p_Value: Variant);
var
  i,n: integer;
begin
  _ExecSql('delete oil_var where name='''+p_Name+''' or name like '''+p_Name+OIL_VAR_SEP+'%'' ');
  n:=length(p_Value) div OIL_VAR_VALUE_SIZE;

  if length(GetOilVarPartName(p_Name,n))>OIL_VAR_NAME_SIZE then
     Raise Exception.Create(TranslateText('WriteOilVar: Слишком длинное имя ')+p_Name);

  for i:=0 to n do
      _ExecSql('insert into oil_var (name,value) values '+
               '('''+GetOilVarPartName(p_Name,i)+''','''+copy(p_Value,i*OIL_VAR_VALUE_SIZE+1,OIL_VAR_VALUE_SIZE)+''') ');
  _ExecSql('begin ov.ResetOilVar; end;');
end;
//==============================================================================
function ReadOilVar(p_Name: string):string;
var
  n: integer;
  q: TOilQuery;
begin
  q := TOilQuery.Create(nil);
  try
    n:=0; result:='';
    while TRUE do
    begin
      if q.Active then
        q.Close;
      q.Sql.Text:='select value from oil_var where name='''+GetOilVarPartName(p_Name,n)+''' ';
      _OpenQuery(q);
      if q.RecordCount=0 then
        exit
      else
        result := result+q.FieldByName('value').AsString;
      inc(n);
    end;
  finally
    q.Destroy;
  end;
end;
//==============================================================================
function GetNameList(p_IdList,p_TableName:string):string;
begin
    if p_IdList='' then result:=''
    else
      result:=GetSqlList(
        ' select name from '+p_TableName+
        ' where id in ('+p_IdList+')'+
        ' order by name');
end;
//==============================================================================
procedure LoadStringList_OilVar(p_Names:string;var pp_SL:TStringList);
var names:TStringList;
    i:integer;
begin
    if pp_SL=nil then pp_SL:=TStringList.Create;
    pp_SL.Clear;
    names:=TStringList.Create;
    Str2StringList(p_Names,names);
    for i:=0 to names.Count-1 do
        pp_SL.Add(names[i]+'='+ReadOilVar(names[i]));
    names.Destroy;
end;
//==============================================================================
procedure SaveStringList_OilVar(p_SL:TStringList);
var i:integer;
begin
    for i:=0 to p_SL.Count-1 do
        WriteOilVar(p_SL.Names[i],p_SL.Values[p_SL.Names[i]]);
end;
//==============================================================================
procedure CopyToMemoryTableOneSL(p_From: TDataSet; p_To: TMemoryTable; p_SL: TStringList);
var
  i,n: integer;
  s1,s2: string;
begin
  if not Assigned(p_SL) or (p_SL.Count=0) then
    for i:=0 to p_To.Fields.Count-1 do
      p_To.Fields[i].Value:=p_From.Fields[i].Value
  else
    for i:=0 to p_SL.Count-1 do begin
      n:=pos(':',p_SL[i]);
      if n=0 then p_To.FieldValues[p_SL[i]]:=p_From.FieldValues[p_SL[i]]
      else begin
        s1:=copy(p_SL[i],1,n-1);
        s2:=copy(p_SL[i],n+1,length(p_SL[i]));
        p_To.FieldValues[s2]:=p_From.FieldValues[s1];
      end;
    end;
end;
//==============================================================================
procedure CopyToMemoryTableOne(p_From: TDataSet; p_To: TMemoryTable; p_Fields:string='');
var sl: TStringList;
begin
  sl:=TStringList.Create;
  try
    if p_Fields<>'' then Str2StringList(p_Fields,sl);
    if p_To.State=dsBrowse then
      raise exception.create(
        TranslateText('CopyToMemoryTableOne: параметр p_To должен быть в режиме вставки или редактирования'));
    CopyToMemoryTableOneSL(p_From,p_To,sl);
  finally
    sl.Free;
  end;
end;
//==============================================================================
procedure CopyToMemoryTable(
  p_From: TDataSet; p_To: TMemoryTable; p_Fields:string='';
  p_ConditionField: string=''; p_ConditionValue: string='';
  p_Clear: Boolean = true);
var
  sl: TStringList;
begin
  try
    try
      sl:=TStringList.Create;
      if p_Fields<>'' then Str2StringList(p_Fields,sl);
      if not p_To.Active then p_To.Open;
      if not p_From.Active then p_From.Open;
      if p_Clear then p_To.EmptyTable;
      p_From.First;
      while not p_From.Eof do begin
        if (p_ConditionField='') or (p_From.FieldByName(p_ConditionField).AsString=p_ConditionValue) then begin
          p_To.Insert;
          CopyToMemoryTableOneSL(p_From,p_To,sl);
          p_To.Post;
        end;
        p_From.Next;
      end;
      p_From.First;
    except
      on E:Exception do
         MessageDlg('CopyToMemoryTable: '+E.Message,mtError,[mbOk],0);
    end;
  finally
    if Assigned(sl) then sl.Free;
  end;
end;
//==============================================================================
procedure InitQuery(var pp_Query: TOilQuery; p_Owner: TComponent = nil);
begin
    try pp_Query.Free except end;
    pp_Query:=TOilQuery.Create(p_Owner);
end;
//==============================================================================
function GetAllOblInst(p_INST: integer):string;
var tmp: Variant;
begin
    if LAUNCH_MODE='GREAT_OIL' then
       tmp:=GetSqlValue(' select obl_inst from adm_obl_inst '+
                        ' where id=inst and inst='+IntToStr(p_INST))
    else tmp:=null;

    if VarIsNull(tmp) then
       result:=GetSqlList(
          ' select oo2.inst from '+
          '        (select decode(org_type,3,par,4,inst,null) as oblid '+
          '         from v_org '+
          '         where id='+IntToStr(p_INST)+' and id=inst) oo1,v_org oo2 '+
          ' where oo1.oblid in (oo2.inst,oo2.par) '+
          '       and oo2.org_type in (3,4) and oo2.id=oo2.inst ')
    else result:=tmp;
end;
//==============================================================================
function GetBlackPodrList(p_OKPO: string; p_OtherOnly: Boolean=FALSE): string;
var s:string;
begin
    s:=' select oo.name'+
       ' from v_org oo,oil_black_list bl'+
       ' where oo.id=oo.inst and oo.inst=bl.inst '+
       '       and bl.okpo='''+p_OKPO+'''';
    if p_OtherOnly then s:=s+' and bl.inst<>'+IntToStr(REAL_INST);
    result:=GetSqlList(s,'',#13#10);
end;
//==============================================================================
function LockExists(p_Id:integer;p_DopInfo:string):Boolean;
var s:string;
begin
    s:=' select count(*) from oil_lock where lock_type_id='+IntToStr(p_Id);
    if p_DopInfo='' then s:=s+' and dop_info is null '
    else s:=s+' and dop_info='''+p_DopInfo+''' ';
    result:=(GetSqlValue(s)>0);
end;
//==============================================================================
procedure DeleteLock(p_Id:integer;p_DopInfo:string);
var s:string;
begin
    s:=' delete oil_lock where lock_type_id='+IntToStr(p_Id);
    if p_DopInfo='' then s:=s+' and dop_info is null '
    else s:=s+' and dop_info='''+p_DopInfo+''' ';
    _ExecSql(s);
end;
//==============================================================================
procedure TouchLock(p_Name,p_DopInfo: string);
var qType: TOilQuery;
    ri,di: real; // repeat_interval и death_interval
    i,type_id:integer;
begin
    qType:=TOilQuery.Create(nil);
    try
      qType.Sql.Text:=' select * from oil_lock_type where state=''Y'' and name='''+p_Name+''' ';
      _OpenQuery(qType);
      if qType.RecordCount=0 then Raise Exception.Create(TranslateText('TouchLock: тип ')+p_Name+TranslateText(' не найден'));
      ri:=qType.FieldByName('repeat_interval').AsFloat;
      di:=qType.FieldByName('death_interval').AsFloat;
      type_id:=qType.FieldByName('id').AsInteger;
      i:=0;
      while LockExists(type_id,p_DopInfo) and (i*ri<di) do begin
           Sleep(trunc(1000*ri));
           inc(i);
      end;
      if i*ri>di then DeleteLock(type_id,p_DopInfo);
      _ExecSql(' insert into oil_lock (lock_type_id,dop_info) '+
               ' values ('+IntToStr(type_id)+','''+p_DopInfo+''')');
      qType.Close;
    finally
      qType.Free;
    end;
end;
//==============================================================================
function GetCardId(p_Id: integer; p_Date: TDateTime):integer;
begin
  with dbfunc.qCardId do begin
    if Active then Close;
    _OpenQueryParOra(dbfunc.qCardId,
      ['DATE_',       p_Date,
       'ID',          p_Id]);

    if IsEmpty then result:=0
    else result:=Fields[0].AsInteger;
  end;
end;
//==============================================================================
function GetFullName(p_Id,p_Inst: integer; p_Name: string=''): string;
begin
    result:=NVL(GetSqlValue(
       ' select full_name from oil_org_det '+
       ' where org_id='+IntToStr(p_Id)+' and inst='+IntToStr(p_Inst)+
       '       and state=''Y'' '),p_Name);
end;
//==============================================================================
function IsBeforeArchiveBase: Boolean;
var s: string;
    v_inst: integer;
    v_date,v_maxdate: TDateTime;
begin
    result:=FALSE;
    s:=ReadOilVar('ARCHIVE_KEY');
    if trim(s)='' then exit;
    s:=Decrypt(crtVersionKey,[s]);
    v_inst:=StrToInt(copy(s,11,length(s)));
    v_date:=StrToDate(copy(s,1,10));
    if(0=GetSqlValue(' select count(*) from '+
       '  (select date_ from oil_rashod where state=''Y'' '+
       '   UNION ALL'+
       '   select rep_date from oil_daily_rep where state=''Y'')'))
    then
      raise exception.Create(TranslateText('Для активизации архивного режима необходимо завести отпуск с НБ, либо сменный отчет!'));
    v_maxdate:=GetSqlValue(
       ' select max(date_) from '+
       '  (select date_ from oil_rashod where state=''Y'' '+
       '   UNION ALL'+
       '   select rep_date from oil_daily_rep where state=''Y'')');

    startlog(
      '  INST = '+ IntToStr(INST) +
      '; MAX_DATE = '+ DateToStr(v_maxdate) +
      '; ARCHIVE_INST = '+ IntToStr(v_inst) +
      '; ARCHIVE_DATE = '+ DateToStr(v_date));

    result:=(v_inst=INST) and (v_date>=v_maxdate);
end;
//==============================================================================
function TestPartMovement(
  p_PartId,p_PartInst: integer;
  p_RezId,p_RezInst: integer;
  p_TableName: string;
  p_Id,p_Inst: integer;
  p_Count: Double;
  var err: string): Boolean;
var
  q: TOilQuery;
  rest: real;
begin
  q:=TOilQuery.Create(nil);
  try
    q.Session:=frmStart.OraSession1;
    q.Sql.Text:=
      ' select selltypeid,decode(selltypeid,1,''OIL_RASHOD'',8,''OIL_PRIHOD'') as table_name,'+
      '   id,inst,date_,-tonn as tonn'+
      ' from v_oil_npmove_base vnp'+
      ' where selltypeid in (1,8)'+
      '   and part_id = :APartId and part_inst = :APartInst'+
      '   and rez_id = :ARezId and rez_inst = :ARezInst'+
      '   and tonn<>0'+
      ' order by date_,selltypeid desc';
    _OpenQueryPar(q,
     ['APartId',   p_PartId,
      'APartInst', p_PartInst,
      'ARezId',    p_RezId,
      'ARezInst',  p_RezInst]);
    rest:=0;
    while not q.Eof do begin
      if (p_TableName=q.FieldByName('table_name').AsString) and
         (p_Id=q.FieldByName('id').AsInteger) and
         (p_Inst=q.FieldByName('inst').AsInteger)
      then
        rest:=rest+abs(p_Count)*decode([p_TableName,'OIL_RASHOD',-1,1])
      else
        rest:=rest+q.FieldByName('tonn').AsFloat;
      if FRound(rest,6)<0 then
      begin
        Result := FALSE;
        err := TranslateText('Это изменение приводит к отрицательному остатку после ')+
             decode([q.FieldByName('table_name').AsString,'OIL_RASHOD',TranslateText('отпуска'),TranslateText('прихода')])+
             TranslateText(' от ')+q.FieldByName('date_').AsString;
        exit;
      end;
      q.Next;
    end;
    result:=TRUE;
    err:='';
    q.Close;
  finally
    q.Free;
  end;
end;
//==============================================================================
function TestSopPrihDelete(p_GroupNum,p_Inst: integer; var pp_Err: string): Boolean;
var
  q: TOilQuery;
begin
  q:=TOilQuery.Create(nil);
  q.Session:=frmStart.OraSession1;
  result:=TRUE;
  try
    q.SQL.Text:=
      ' select /*+ORDERED USE_NL(pr,prd)*/'+
      '   pr.id,pr.inst,pr.part_id,pr.part_inst,prd.rez,prd.rez_inst'+
      ' from oil_prihod pr,oil_prih_det prd'+
      ' where pr.state=''Y'' and prd.state=''Y'''+
      '   and prd.prihod_id=pr.id and prd.inst=pr.inst'+
      '   and pr.group_num='+IntToStr(p_GroupNum)+
      '   and pr.inst='+IntToStr(p_Inst);
    _OpenQueryOra(q);
    if q.RecordCount=0 then exit;
    while not q.Eof do begin
      result:=TestPartMovement(q.FieldByName('part_id').AsInteger,q.FieldByName('part_inst').AsInteger,
        q.FieldByName('rez').AsInteger,q.FieldByName('rez_inst').AsInteger,'OIL_PRIHOD',
        q.FieldByName('id').AsInteger,p_Inst,0,pp_Err);
      if not result then exit;
      q.Next;
    end;
    q.Close;
  finally
    q.Free;
  end;
end;
//==============================================================================
function GetUniquePartName(APartName: string; ADeep: integer = 0 ): string;
var
  s: string;
  n: integer;
  IsFound: boolean;
begin
  IsFound := False;
  s:='АБВГДЕЖЗИКЛМНОПРСТУФХЦЧШЩЫЭЮЯ';// *NO_TRANSLATE*
  Result := APartName;
  for n:=1 to length(s) do
  begin
    if 0 = GetSqlValue(' select count(*) from oil_part where state=''Y'' and dog='''+Result+'''') then
    begin
      IsFound := True;
      Break;
    end;
    Result := APartName + s[n];
  end;

  // Если не нашло с добавлением одной буквы, включаем рекурсию
  if ADeep = 0 then
  begin
    Result := APartName;
    for n:=1 to length(s) do
    begin
      Result := APartName + s[n];
      try
        Result := GetUniquePartName(Result, ADeep+1);
        IsFound := True;
        break;
      except
      end;
    end;
  end;

  if not IsFound then
    raise Exception.Create(TranslateText('GetUniquePartName: не удалось найти уникальное имя для партии ')+APartName);

end;
//==============================================================================
// процедура переноса данных из датасета в таблицу dbf или db на диске
//------------------------------------------------------------------------------
procedure DataSetToDbf(
  p_Q: TDataSet; // датасет откуда будет происходить перенос
  p_Dir: string; // директория, в которой появится таблица
  p_TableName: string; // название таблицы
  p_Options: TStrings; // опции
  p_TableType: string='FOXPRO' // тип таблицы
  );
var
  db: TDataBase; // database нужен, чтобы определить тип таблицы
  vTableName: string; // если имя таблицы начинается с цифры, то оно преобразуется
                      // к легальному виду и хранится в этой переменной
  vExt: string; // расширение
  vFieldMoneyExists: Boolean; // присутствовало ли в экспорте поле MONEY
  vTempFileName,vFileName: string; // временное и окончательное имя файла

  //****************************************************************************
  procedure OpenDb;
  begin
    db.DatabaseName:='ExportIn1C';
    db.Name:='DBExportIn1C';
    db.DriverName:='STANDARD';
    db.LoginPrompt:=FALSE;
    db.Params.Clear;
    db.Params.Add('PATH='+p_Dir);
    db.Params.Add('DEFAULT DRIVER='+p_TableType);
    db.Open;
  end;
  //****************************************************************************
  function GetFieldType(p_Num: integer): string;
  var size,pr: string;
  begin
    case p_Q.FieldDefs[p_Num].DataType of
      ftString: result:='char('+IntToStr(p_Q.FieldDefs[p_Num].Size)+')';
      ftinteger: result:='integer';
      ftDateTime: result:='date';
      ftFloat:
        begin
          size:='20';
          if p_Options<>nil then
            pr:=p_Options.Values[UpperCase(p_Q.FieldDefs[p_Num].Name)];
          if pr='' then pr:='6';
          if pr<>'0' then size:=size+','+pr;
          result:='float('+size+')';
        end;
    else
      raise exception.create(TranslateText('DataSetToDbf: поле неизвестного типа в датасете!'));
    end;
  end;
  //****************************************************************************
  procedure CreateTable;
  var
    i: integer;
    s,vName: string;
    qCr: TQuery;
  begin
    qCr:=TQuery.Create(nil);
    try
      qCr.DatabaseName:=db.DatabaseName;

      if p_TableName[1] in ['0'..'9'] then
        vTableName:='tmp'+p_TableName
      else
        vTableName:=p_TableName;

      vFileName:=p_Dir+'\'+p_TableName+vExt;
      vTempFileName:=p_Dir+'\'+vTableName+vExt;

      if FileExists(vTempFileName) then
        DeleteFile(vTempFileName);

      qCr.Sql.Text:='create table '+vTableName+'(';
      for i:=0 to p_Q.FieldDefs.Count-1 do begin
        vName:=p_Q.FieldDefs[i].Name;
        if vName='MONEY' then begin
          vName:=vName+'_';
          vFieldMoneyExists:=TRUE;
        end;
        s:=vName+' '+GetFieldType(i);
        if i<>p_Q.FieldDefs.Count-1 then
          s:=s+',';
        qCr.Sql.Add(s);
      end;
      qCr.Sql.Add(')');
      qCr.ExecSQL;
      qCr.Close;
    finally
      qCr.Free;
    end;
  end;
  //****************************************************************************
  procedure FillTable;
  var
    i: integer;
    t: TTable;
  begin
    t:=TTable.Create(nil);
    try
      t.DatabaseName:=db.DatabaseName;
      t.TableName:=vTableName;
      t.TableType:=decode([p_TableType,'FOXPRO',ttFoxPro,'PARADOX',ttParadox,'DBASE',ttDbase,ttFoxPro]);
      t.Open;
      p_Q.First;
      while not p_Q.Eof do begin
        t.Insert;
        for i:=0 to p_Q.Fields.Count-1 do begin
          t.Fields[i].Value:=p_Q.Fields[i].Value;
        end;
        t.Post;
        p_Q.Next;
      end;
    finally
      t.Free;
    end;
  end;
  //****************************************************************************
  procedure FixFieldMoney;
  var
    s: string;
    buf: byte;
    i,n: integer;
    F: TFileStream;
  begin
    F:=TFileStream.Create(vTempFileName,fmOpenReadWrite);
    for i:=1 to F.Size do begin
      F.Read(buf,1);
      s:=s+chr(buf);
    end;
    n:=pos('MONEY_',s);
    if n>0 then begin
      buf:=0;
      F.Seek(n+4,soFromBeginning);
      F.Write(buf,1);
    end;
    F.Free;
  end;
  //****************************************************************************
begin
  db:=TDataBase.Create(nil);

  if p_TableType='FOXPRO' then vExt:='.dbf'
  else vExt:='.db';

  try
    OpenDb;
    vFieldMoneyExists:=FALSE;
    CreateTable;
    if vFieldMoneyExists then
      FixFieldMoney;
    FillTable;
    if FileExists(vFileName) then
      DeleteFile(vFileName);
    if not RenameFile(vTempFileName,vFileName) then begin
      DeleteFile(vTempFileName);
      raise exception.create(TranslateText('Не удалось переименовать временный файл в ')+vFileName);
    end;
  finally
    db.Free;
  end;
end;
//==============================================================================
function GetOrgData(
  pp_Q: TOilQuery;
  p_Id,p_Inst: integer;
  p_RekId: integer = 0;
  p_RekInst: integer = 0): Boolean;
var s: string;
begin
  if pp_Q.Active then pp_Q.Close;
  s:=' select * from v_oil_org where id=%d and inst=%d';
  pp_Q.Sql.Text:=Format(s,[p_Id,p_Inst]);

  if p_RekId<>0 then begin
    s:=' and rek_id=%d and rek_inst=%d';
    pp_Q.Sql.Add(Format(s,[p_RekId,p_RekInst]));
  end;

  pp_Q.SQL.Add(' order by def desc');
  _OpenQueryOra(pp_Q);
  result:=pp_Q.RecordCount>0;
end;
//==============================================================================
procedure InsOrUpdRecord(p_Table: string; p_Values: array of variant);
begin
  DBSaver.SaveRecord(p_Table,p_Values);
end;
//==============================================================================
function GetOblByTalonNum(p_Num: integer): integer;
var
  n, limit: integer;
begin
  limit := 10000000; // десять миллионов, семь нулей
  if p_Num < limit then
    result := MAIN_ORG.OBLID
  else // Всеукраинские талоны
  begin
    n := p_Num div limit;
    if (n = MAIN_ORG.talon_code) or (n = TALON_CODE_OLD) then
      result := MAIN_ORG.OblId
    else
      result :=
        nvl(GetSqlValueParSimple('select id from v_org where state = ''Y'' and org_type = 4 and talon_code = :num ',
          ['num', n]), 0);

    if result = 0 then
      result :=
        nvl(GetSqlValueParSimple('select id from oil_talon_codes where state = ''Y'' and talon_code = :num and id = (select obl_id from v_main_org) ',
          ['num', n]), 0);

    if (result = 0) and (n = 75) and (MAIN_ORG.OblId = 474) then
      Result := MAIN_ORG.OblId
  end;
end;
//==============================================================================
function InstIsPossible(p_Inst: integer): Boolean;
begin
  result:=(pos(','+IntToStr(p_Inst)+',',','+Inst_List+',')>0);
end;
//==============================================================================
procedure FillRezList(
  p_SL: TStrings;
  p_DepId: integer;
  p_PartId: integer=0;
  p_PartInst: integer=0;
  p_Mes: boolean=true);
var q: TOilQuery;
begin
  q:=TOilQuery.Create(nil);
  q.Session:=frmStart.OraSession1;
  try
    if p_PartId=0 then begin
      q.Sql.Text:=
        ' select nvl(rez.num,rez.name) as num from v_oil_rezervuar rez'+
        ' where id_org=inst_org and inst_org='+IntToStr(p_DepId)+
        ' order by lpad(nvl(rez.num,rez.name),10,''0'')';
    end else begin
      q.Sql.Text:=
        ' select rez.id,rez.inst,nvl(rez.num,rez.name) as num from v_oil_left l,v_oil_rezervuar rez'+
        ' where l.rez_id=rez.id and l.rez_inst=rez.inst'+
        '   and l.part_id='+IntToStr(p_PartId)+' and l.part_inst='+IntToStr(p_PartInst)+
        '   and l.org_id=l.org_inst and l.org_id='+IntToStr(p_DepId)+
        '   and rez.inst_org = '+IntToStr(p_DepId)+
        ' group by rez.id,rez.inst,rez.num,rez.name'+
        ' having sum(s)>=0'+
        ' order by lpad(nvl(rez.num,rez.name),10,''0'')';
    end;
    _OpenQueryOra(q);
    if p_Mes then
      if q.RecordCount=0 then
        if p_PartId=0 then showmessage(TranslateText('Данная организация не имеет резервуаров!!!'))
        else showmessage(TranslateText('Данная партия не содержится ни в одном резервуаре данной организации!!!'));
    p_SL.Clear;
    p_SL.Add('');
    while not q.Eof do begin
      if not VarIsNull(q['num']) then
        p_SL.Add(q['num']);
      q.Next;
    end;
    q.Close;
  finally
    q.Free;
  end;
end;
//==============================================================================
procedure DefineRashRez(
  edRez: TComboBox;
  qRez: TOilQuery;
  p_DepId: integer;
  p_PartId: integer=0;
  p_PartInst: integer=0);
var
  s: string;
  n: integer;
begin
  s:=edRez.Text;
  FillRezList(edRez.Items,p_DepID,p_PartId,p_PartInst);
  if qRez.Active and (qRez.ParamByName('a').AsInteger<>p_DepId) then
    qRez.Close;
  if not qRez.Active then begin
    qRez.ParamByName('a').AsInteger:=p_DepId;
    _OpenQuery(qRez);
  end;

  if s='' then begin
    if (edRez.Items.Count>1) and (p_PartId<>0) then
      edRez.ItemIndex:=1
  end else begin
    n:=edRez.Items.IndexOf(s);
    if n=-1 then n:=0;
    edRez.ItemIndex:=n;
  end;
  edRez.OnChange(nil);
end;
//==============================================================================
procedure CheckForeignKeys;
var n: integer;
begin
  n:=GetSqlValue(' select count(*) from v_exe_foreign_keys');
  if n=0 then
    raise exception.create(TranslateText('Отсутствуют внешние ключи! Срочно обратитесь к разработчикам!'));
end;
//==============================================================================
procedure TDbFunc.scrCompileError(Sender: TObject; E: Exception;
  SQL: String; var Action: TErrorAction);
begin
  Action:=eaContinue;
end;
//==============================================================================
procedure TDbFunc.CompilePackets;
var
  q: TOilQuery;
  s: string;
begin
  q:=TOilQuery.Create(nil);
  q.Session:=frmStart.OraSession1;
  q.Sql.Text:=
    ' select * from sys.all_objects'+
    ' where object_type in (''PACKAGE'',''PACKAGE BODY'')'+
    '   and status=''INVALID'''+
    '   and owner=user'+
    '   and object_name in (''OIL'',''OIL1'',''OILT'',''OV'')';
  _OpenQueryOra(q);
  if q.RecordCount=0 then exit;
  scrCompile.SQL.Clear;
  while not q.Eof do begin
    if q.FieldByName('object_type').AsString='PACKAGE' then s:=''
    else s:=' body';
    scrCompile.Sql.Add(Format('alter package %s compile%s;',[q['object_name'],s]));
    q.Next;
  end;
  scrCompile.Execute;
  q.Close;
    q.Sql.Text:=
    ' select distinct object_name from sys.all_objects'+
    ' where object_type in (''PACKAGE'',''PACKAGE BODY'')'+
    '   and status=''INVALID'''+
    '   and owner=user'+
    '   and object_name in (''OIL'',''OIL1'',''OILT'',''OV'')';

  _OpenQueryOra(q);
  if q.RecordCount=0 then exit;
  s:=TranslateText('Следующие пакеты инвалидны и компилируются с ошибками: ');
  while not q.Eof do begin
    s:=s+q.FieldByName('object_name').AsString+',';
    q.Next;
  end;
  SetLength(s,length(s)-1);
  raise exception.create(s);
end;
//==============================================================================
procedure GetNNAddrPhone(p_Id,p_Inst: integer; var pp_Addr,pp_Phone: string);
var
  q: TOilQuery;
begin
  if p_Id=p_Inst then begin
    if nvl(GetSqlValue(Format(
      ' select par from v_org where id=%d and id=inst and org_type=4',[p_Id])),0)=4587
    then begin
      p_Id:=4587; p_Inst:=4587;
    end;
  end;
  q:=TOilQuery.Create(nil);
  q.Session:=frmStart.OraSession1;
  q.Sql.Text:=Format(
    ' select addr,phone from v_org where id=%d and inst=%d',[p_Id,p_Inst]);
  _OpenQueryOra(q);
  if q.RecordCount=0 then
    raise exception.create(Format(
      TranslateText('GetNNAddrPhone: организации id=%d,inst=%d не найдено!'),[p_Id,p_Inst]));
  pp_Addr:=q.FieldByName('addr').AsString;
  pp_Phone:=q.FieldByName('phone').AsString;
end;
//==============================================================================
procedure RunFillCardTransitPart(p_DateTo: TDateTime);
var vDateFrom: TDateTime;
begin
  vDateFrom:=p_DateTo-120;
  try
    DefineRepDates(vDateFrom,p_DateTo);
    _ExecProcOra('FILL_CARD_TRANSIT_PART',
      ['p_DateFrom',      vDateFrom,
       'p_DateTo',        p_DateTo]);
  except
    RollbackSqlOra;
  end;
  CommitSqlOra;
end;
//==============================================================================
procedure RecompileInvalidProc(p_ProcName: string);
var s: string;
begin
  s:=nvl(GetSqlValue(
    ' select status from sys.all_objects where owner=user'+
    '   and object_name='''+UpperCase(p_ProcName)+''''),'VALID');
  if s='VALID' then exit;
  s:=GetSqlValue(
    ' select object_type from sys.all_objects where owner=user'+
    '   and object_name='''+UpperCase(p_ProcName)+'''');
  _ExecSqlOra(' alter '+s+' '+p_ProcName+' compile');
end;
//==============================================================================
function IsObl(AOblId: Integer): Boolean;
var
  OblList: String;
begin
  OblList := ReadOilVar('OBL_LIST');
  if OblList = ''
    then raise Exception.Create(TranslateText('Не заполнен список организаций, имеющих нефтебазы (ОБЛов).')+#13#10+
               TranslateText(' Обратитесь к разработчикам'));
  Result := ( Pos(IntToStr(AOblId)+',',OblList) <> 0 ) or ( Pos(','+IntToStr(AOblId),OblList) <> 0 );
end;
//==============================================================================
function IsFilialNK(Inst: Integer): Boolean;
var
  SInst: string;
  q: TOilQuery;
begin
  try
    Result := false;
    SInst := '';
    q := TOilQuery.Create(nil);
    q.Session := frmStart.OraSession1;

    if q.Active = true then
      q.Close;
    q.SQL.Text := 'select * from v_org t where t.par = 4587 and t.org_type = 4 order by t.inst';
    q.Open;
    q.First;
    repeat
      SInst := SInst + q.FieldByName('INST').AsString;
      q.Next;
      if q.Eof = false then
        SInst := SInst + ',';
    until q.Eof;

    if q.Active = true then
      q.Close;
    q.SQL.Text := 'select * from v_org t where t.inst = '+IntToStr(Inst)+' and ((t.par in ('+SInst+'))' +
      'or (t.inst in ('+SInst+') and t.par = 4587 and t.org_type = 4))';
    q.Open;

    if (q.IsEmpty = false) or (q.RecordCount > 0) then
      result := true
  except
    Result := false;
  end;
end;
//==============================================================================
function TestDuplicateIdNum(p_IdNum: string; p_OrgId,p_OrgInst: integer): boolean;
begin
  _OpenQueryParOra(DBFunc.qIdNum,
    ['org_id',        p_OrgId,
     'org_inst',      p_OrgInst,
     'id_num',        p_IdNum]);
  result:=DBFunc.qIdNum['co']=0;
  DBFunc.qIdNum.Close;
end;
//==============================================================================
procedure SaveCardAlienDoc(p_OblId: integer; p_Date: TDateTime);
begin
  _ExecProc('CARD.SAVE_ALIEN_DOC',
    ['p_OblId',     p_OblId,
     'p_Date',      p_Date]);
end;
//==============================================================================
procedure RefreshMatherializedViews;
var
  s: string;
  sl: TStringList;
  i: integer;
begin
  s:=ReadOilVar('MAT_VIEWS_LIST');
  if s='' then s:='V_CARD_AZS,VM_OIL_DOP_NP_GROUPS';
  sl:=TStringList.Create;
  try
    sl.Delimiter := ',';
    sl.DelimitedText := s;
    for i:=0 to sl.Count-1 do
      RefreshMatherializedView(sl[i]);
  finally
    sl.Free;
  end;
end;
//==============================================================================
procedure RefreshMatherializedView(AMatherializedViewName: string);
begin
  if DbObjectExists(AMatherializedViewName,'TABLE',frmStart.OraSession1.username)
    and not DbObjectUsed(AMatherializedViewName,'TABLE',frmStart.OraSession1.username)
  then
    _ExecSQLOra('begin dbms_mview.refresh('''+AMatherializedViewName+'''); end;' );
end;
//==============================================================================
procedure DefineRepDates(
  p_BeginDate,p_EndDate: TDateTime;
  p_Base: integer = 0 // 0 - ODAC, 1 - BDE
);
begin
  _ExecSql(' begin ov.SetRepBeginDate(:RepBeginDate); ov.SetRepEndDate(:RepEndDate); end;',
    ['RepBeginDate',BoolTo_( p_BeginDate=0, Null, p_BeginDate ),
     'RepEndDate',BoolTo_( p_EndDate=0, Null, p_EndDate )]);
end;
//==============================================================================
procedure DefineRepParam(AName, AValue: variant);
begin
  _ExecSql(' begin ov.setparam(aname => :AName, avalue => :AValue); end;',
    ['AName',  AName,
     'AValue', AValue]);
end;
//==============================================================================
function GetRepDatesDesc: string;
var sDateFrom,sDateTo: string;
begin
  sDateFrom:=nvl(GetSqlValue('select to_char(ov.RepBeginDate,''dd.mm.yyyy'') from dual'),'00.00.0000');
  sDateTo:=nvl(GetSqlValue('select to_char(ov.RepEndDate,''dd.mm.yyyy'') from dual'),'00.00.0000');
  result:=Format('%s - %s',[sDateFrom,sDateTo]);
end;
//==============================================================================
procedure ChangeOVLanguage(p_Lang: integer);
var s: string;
begin
  s:='begin ov.SetLanguage('+IntToStr(p_Lang)+'); end;';
  try
    _ExecSqlOra(s);
    _ExecSql(s);
  except
  end;
end;
//==============================================================================
function OracleCompatibleValid : Boolean;
var
  OraComp: String;
begin
  Result := True;
  if ReadPieceOfRegistry(HKEY_CURRENT_USER,'Software\Oil','CheckCompatible') = '0'
    then Exit;
  try
    OraComp := GetSqlValue('select value from v$parameter where lower(name) =''compatible''');
    if (Length(OraComp) >= 3) then
      if (OraComp[1] in ['0'..'9']) and (OraComp[3] in ['0'..'9'])
        then Result :=  (StrToInt(OraComp[1]) >= 8) and (StrToInt(OraComp[3]) >= 1)
  except on E:Exception do
    StartLog('OracleCompatibleValid:'+E.Message);
  end;
end;
//==============================================================================
procedure OracleNLSValid;
const
  sSql='select SYS_CONTEXT (''USERENV'',:ParamName) from dual';
  iChecksCount=3;
  aNLSValid:array[1..iChecksCount,1..3] of string =(
    ('NLS_DATE_FORMAT','NLS_DATE_FORMAT','dd.mm.rrrr'),
    ('NLS_DATE_LANGUAGE','NLS_DATE_LANGUAGE','AMERICAN'),
    ('LANGUAGE','NLS_LANG','AMERICAN_AMERICA.CL8MSWIN1251')
    );
  apNLSName=1;//Как называеться в SYS_CONTEXT
  apNLSReestr=2;//Как называеться в реестре
  apNLSValue=3;//Правильное значение
var
  n:integer;
  sParamValue:string;
  bIsBadParam:boolean;
begin
  if ReadPieceOfRegistry(HKEY_CURRENT_USER,'Software\Oil','CheckNLS') = '0'
    then Exit;
  for n:=1 to iChecksCount do
  begin
    bIsBadParam:=false;
    sParamValue:=trim(GetSqlValueParSimple( sSql,[ 'ParamName', aNLSValid[n][apNLSName] ] ));
    if( length( sParamValue )=length( aNLSValid[n][apNLSValue] ) )then
    begin
      {for j:=1 to length( sParamValue ) do
      begin
        if( sParamValue[j]<>aNLSValid[i][apNLSValue][j] )then
          bIsBadParam:=true;
        if( ord(sParamValue[j])<>ord(aNLSValid[i][apNLSValue][j]) )then
          bIsBadParam:=true;
      end;}
      if aNLSValid[n][apNLSValue]<>sParamValue then
        bIsBadParam:=true;
    end
    else
      bIsBadParam:=true;
    if bIsBadParam then
      raise Exception.CreateFmt('OracleNLSValid: Не верные настройки Оракла в реестре!'+#10#13
        +'Параметр %s должен быть равен %s, сейчас он равен %s ',[aNLSValid[n][apNLSReestr],aNLSValid[n][apNLSValue],sParamValue]
        );
  end;
end;
//==============================================================================
function IsEmitent(ADepId: Integer; AIncludeObl: boolean): Boolean;
var
  AddStr: String;
begin
  AddStr := '';

  Result := GetSqlValue(
    'select count(*) from v_card_id_history where dep_id ='+
     IntToStr(ADepId)+IfThen(AIncludeObl, ' or obl_id = '+IntToStr(ADepId),'') ) > 0;
end;
//==============================================================================
function ChangeOrg2Dual():integer;
var
  q,qNO:TOilQuery;
  field_value:variant;
  par_value,msg,upd:string;
begin
  result:=-1;
  q:=TOilQuery.Create(nil);
  try
    //Открываем основной запрос
    q.SQL.Text:='select dep_id,table_name,field_name,value1,value2 from oil_org_change '
      +' where dep_id=:inst or dep_id=(select max(value) from v_dual_inst) order by compare';
    _OpenQueryParOra(q,
      ['inst',INST]);
    if(q.IsEmpty)then
    begin
      q.Close;
      raise Exception.Create(TranslateText('ChangeOrg2Dual: Незначений для изменения!'));
    end;
    //выбираем, на что менять
    field_value:=GetSqlValueParSimple('select * from oil_org where id=inst and inst=:inst',
      ['inst',q['dep_id']],
      q['field_name']);
    if(field_value=q['value1'])then
      par_value:='value2'
    else
      par_value:='value1';
    // апдейтим таблицы
    q.First;
    while(not q.Eof)do
    begin
      //выбираем апдейт в зависимоти от таблицы
      if( q.FieldByName('table_name').AsString='OIL_ORG' )then
      // если oil_org, то делаем простой апдейт
      begin
        upd:=format('update oil_org set %s=:value where id=inst and inst=:inst',
          [q['field_name']]);
      end
      else
      begin
        //если не oil_org то смотрим чем она связываеться с ней, с тем и работаем
        qNO:=TOilQuery.Create(nil);
        try
          qNO.SQL.Text:='select from1,from2 from v_exe_foreign_keys '
            +'where table_from=:table_from and table_to=''OIL_ORG''';
          _OpenQueryParOra(qNO,
            ['table_from',q.FieldByName('table_name').AsString]);
          upd:=format('update %s set %s=:value where %s=%s and %2:s=:inst',
            [q['table_name'],
             q['field_name'],
             qNO['from1'],
             qNO['from2'] ]);
          qNO.Close;
        finally
          qNO.Free;
        end;
      end;
      //апдейт!
      _ExecSqlOra(upd,
        ['value',q[par_value],
         'inst',q['dep_id']]);
      //наполняем сообщение о том, что меняеться
      msg:=msg+#13#10+q.FieldByName('table_name').AsString+':'
        +q.FieldByName('field_name').AsString+'='+q[par_value];
      q.Next;
    end;
    StartLog(TranslateText('Произошло измененние данных текущей организации c ID=')
      +q.FieldByName('dep_id').AsString+':'+msg);
    result:=q.FieldByName('dep_id').AsInteger;
    q.Close;
  finally
    q.free;
  end;
end;
//==============================================================================
procedure UpdateFullMt(mt: TMemoryTable; p_Fields: string; p_Values: Variant); overload;
var
  bm: string;
  sl: TStringList;
  i: integer;
begin
  if mt.State<>dsBrowse then mt.Post;
  sl:=TStringList.Create;
  bm:=mt.Bookmark;
  mt.DisableControls;
  try
    sl.CommaText:=p_Fields;
    if sl.Count<>VarArrayHighBound(p_Values,1)+1 then
      raise exception.create(TranslateText('UpdateFullMT: несоответствие размеров аргументов'));
    mt.First;
    while not mt.Eof do begin
      mt.Edit;
      for i:=0 to sl.Count-1 do
        mt[sl[i]]:=p_Values[i];
      mt.Post;
      mt.Next;
    end;
  finally
    mt.Bookmark:=bm;
    mt.EnableControls;
    sl.Free;
  end;
end;
//==============================================================================
procedure UpdateFullMt(mt: TMemoryTable; p_Fields: string; p_Values: array of Variant); overload;
var
  values: Variant;
  i: integer;
begin
  values:=VarArrayCreate([0,High(p_Values)],varVariant);
  for i:=0 to High(p_Values) do
    values[i]:=p_Values[i];
  UpdateFullMt(mt,p_Fields,values);
end;
//==============================================================================
procedure UpdateFullMt(mt: TMemoryTable; p_Fields: string); overload;
var
  i: integer;
  sl: TStringList;
  values: Variant;
begin
  sl:=TStringList.Create;
  try
    sl.CommaText:=p_Fields;
    values:=VarArrayCreate([0,sl.Count-1],varVariant);
    for i:=0 to sl.Count-1 do
      values[i]:=mt[sl[i]];
  finally
    sl.Free;
  end;
  UpdateFullMt(mt,p_Fields,values);
end;
//==============================================================================
function SearchMtRecord(mt: TMemoryTable; p_Field,p_Value: string; p_Partial: Boolean): Boolean;
var
  bm: string;
  //****************************************************************************
  function IsEqual: Boolean;
  var s: string;
  begin
    s:=mt.FieldByName(p_Field).AsString;
    result:= p_Partial and (copy(s,1,length(p_Value))=p_Value) or not p_Partial and (s=p_Value)
  end;
  //****************************************************************************
begin
  result:=false;
  if (mt.RecordCount=0) or (p_Value='') then exit;
  bm:=mt.Bookmark;
  mt.DisableControls;
  result:=true;
  try
    mt.First;
    while not mt.Eof do begin
      if IsEqual then exit;
      mt.Next;
    end;
    mt.Bookmark:=bm;
    result:=false;
  finally
    mt.EnableControls;
  end;
end;
//==============================================================================
function IsMyOrg(
  MyInst,  // Інст моєї головної організації
  Inst     // Інст його організації
  : Integer): Boolean; // чи є організація із номером "Inst" дочірньою організацією із номером "MyInst"
var
  SInst: string;
  q: TOilQuery;
begin
  try
    //Отримуемо список організацій що належать MyInst (через кому)
    SInst := '';
    q := TOilQuery.Create(nil);
    try
      if q.Active = true then
        q.Close;
      q.SQL.Text := 'select inst from oil_org where par = :inst and id=inst order by inst';
      _OpenQueryPar(q,
        ['inst',MyInst]);
      q.First;
      repeat
        SInst := SInst + q.FieldByName('inst').AsString;
        q.Next;
        if q.Eof = false then
          SInst := SInst + ',';
      until q.Eof;
      q.Close;
    finally
      q.Free;
    end;

    result:=0<GetSQLValue('select count(*) from oil_org '
      +' where id=inst '
      +'   and(inst = '+IntToStr(Inst)+' and ((par in ('+SInst+')))'// Дочірна дочірньої MyInst
      +'    or(inst in ('+SInst+') and par = '+IntToStr(MyInst)+'))'); // Дочірна MyInst
  except
    Result := false;
  end;
end;
//==============================================================================
function CheckDestrTalon(ser: string; num:integer):boolean;
var p_sql: string;
begin
 p_sql:='select count(*) from oil_talon_destroyed '+
        'where state=''Y''and ser=:ser and num=:num and (obl_id=:oblid or obl_id is null)';
 result:=GetSqlValueParSimple(p_sql,['ser',ser,'num',num,'oblid',main_org.oblid])<>0;
end;
//==============================================================================
procedure CopyMTValues(p_MT: TMemoryTable; var pp_BmFrom,pp_BmTo: string; p_MoveBM: Boolean);
// копирует одну запись в другую
var
  i: integer;
  V: array of variant;
begin
  SetLength(V,p_MT.Fields.Count);
  p_MT.Bookmark:=pp_BmFrom;
  for i:=0 to p_MT.Fields.Count-1 do
    V[i]:=p_MT.Fields[i].Value;
  if p_MoveBM then begin
    p_MT.Prior; pp_BmFrom:=p_MT.Bookmark;
  end;
  p_MT.Bookmark:=pp_BmTo;
  for i:=0 to p_MT.Fields.Count-1 do begin
    p_MT.Edit; p_MT.Fields[i].Value:=V[i]; p_MT.Post;
  end;
  if p_MoveBm then begin
    p_MT.Prior; pp_BmTo:=p_MT.Bookmark;
  end;
end;
//==============================================================================
procedure MoveDownMemoryTable(p_MT: TMemoryTable; p_BM: string; p_Count: integer);
// создает внизу p_Count пустых записей и сдвигает в них все записи ниже той, на
// которую указывает букмарк p_BM
var
  i,n: integer;
  bmLast,bmFrom,bmTo: string;
begin
  if p_MT.RecordCount=0 then begin
    for i:=1 to p_Count do
      p_MT.Insert; p_MT.Post;
    p_MT.First;
    exit;
  end;
  p_MT.DisableControls;
  try
    // сначала считаем, сколько записей есть ниже букмарка
    p_MT.Bookmark:=p_BM;
    p_MT.Next;
    n:=0;
    while not p_MT.Eof do begin
      inc(n);
      p_MT.Next;
    end;
    p_MT.Last; bmLast:=p_MT.Bookmark;

    for i:=1 to p_Count do begin
      p_MT.Insert; p_MT.Post;
    end;

    p_MT.Last; bmTo:=p_MT.Bookmark;
    bmFrom:=bmLast;
    for i:=1 to n do
      CopyMTValues(p_MT,bmFrom,bmTo,true);
    p_MT.Bookmark:=p_BM;
    p_MT.Next;
  finally
    p_MT.EnableControls;
  end;
end;
//==============================================================================
function MtValuesChanged(p_MT: TMemoryTable; p_Prefix: string; p_Sync: Boolean): Boolean;
var
  i: integer;
  sName,sName1: string;
begin
  result:=false;
  for i:=0 to p_MT.Fields.Count-1 do begin
    sName:=p_MT.Fields[i].FieldName;
    if copy(sName,1,length(p_Prefix))=p_Prefix then begin
      sName1:=copy(sName,length(p_Prefix)+1,length(sName));
      if p_MT[sName]<>p_MT[sName1] then begin
        if p_Sync then p_MT[sName]:=p_MT[sName1];
        result:=true;
      end;
    end;
  end;
end;
//==============================================================================
procedure TDbFunc.DataModuleCreate(Sender: TObject);
begin
  TempExTable.DatabaseName := DB_DIR;
  LoadSQLByForm(TForm(Self));
end;
//==============================================================================
//=============================TAdmSettings=====================================
//==============================================================================
procedure TAdmSettings.Save(AName: string; AValue: string);
begin
  if not Self.Exist(AName) then
    _ExecSql('insert into adm_settings (id, inst, name, value) '
      +'values (S_ADM_SETTINGS.nextval, ov.GetVal(''INST''), :name, :value) ',
      ['name', AName,
       'value', AValue])
  else
    _ExecSql('update adm_settings set value = :value '
      +' where name = :name and inst = ov.GetVal(''INST'')',
      ['value', AValue,
       'name', AName]);
end;
//==============================================================================
procedure TAdmSettings.Delete(AName: string);
begin
  if Self.Exist(AName) then
    _ExecSql('delete adm_settings where name=:name and inst=ov.GetVal(''INST'') ',
      ['name',AName]);
end;
//==============================================================================
function TAdmSettings.Get(AName:string):Variant;
begin
  if Self.Exist(AName) then
    Result := GetSqlValueParSimple('select value from adm_settings where name =:name and inst=ov.GetVal(''INST'') ',
      ['name', AName])
  else
    raise Exception.CreateFmt(TranslateText('Параметр %s не существует!'),[AName])
end;
//==============================================================================
function TAdmSettings.GetOrDef(AName: string; ADefaultValue: Variant):Variant;
begin
  if Self.Exist(AName) then
    Result := GetSqlValueParSimple('select value from adm_settings where name =:name and inst=ov.GetVal(''INST'') ',
      ['name', AName])
  else
    Result := ADefaultValue;
end;
//==============================================================================
function TAdmSettings.Exist(AName:string):boolean;
begin
  result:=GetSqlValueParSimple('select count(*) from adm_settings '
    +' where name=:name and inst=ov.GetVal(''INST'') ',
     ['name',AName])>0
end;

procedure RecalcRegionRest(RecalcDate:TDateTime=0; AEcho:boolean=true);
const
  AdmName='RECALC_REGION_REST_DATE';
  LOGFILE = 'RecalcRegionRest.log';
var
  IsRecalc:boolean;
  q:TOilQuery;
  AdmRRdate: TDateTime;
begin
  log(LOGFILE, 'Параметры: Дата закрытия петриода АН = '+ Close_Date_Alfa + ';  Дата последних остатков = ' + AdmSettings.Get(AdmName)
    + '; Дата текущих остатков = '  + DateToStr(RecalcDate));
  if not AdmSettings.Exist(AdmName) then
    AdmSettings.Save(AdmName, '01.01.1990');
  AdmRRdate := StrToDate(AdmSettings.Get(AdmName));
  if RecalcDate = 0 then
    RecalcDate := StrToDate(Close_Date_Alfa);
  IsRecalc := not AdmSettings.Exist(AdmName)       // Если переменной нет, то пересчет делаем по-умолчанию
    // Дата закрытия периода должна быть больше даты сохраненного пересчета. Если не пересчет не в закрытом периоде, то данным доверять не стоит, нужно пересчитать.
               or (AdmRRdate > StrToDate(Close_Date_Alfa))
               or (AdmRRdate <> RecalcDate);
  if IsRecalc then
  begin

    if AEcho then
      MessageDlg(TranslateText('Сейчас будет проведен пересчет остатков.'),mtInformation,[mbOK],0);
    log(LOGFILE, 'Начало пересчета в '+DateToStr(Date)+' '+TimeToStr(Time));      
    // Обновляем пересчет
    StartSql;
    try
      q:=TOilQuery.Create(nil);
      try
        // Блокируем таблицу
        q.Sql.Text:='select * from OIL_REGION_REST for update nowait';
        q.Open;
        // Удаляем все из таблицы
        _ExecSql('delete from OIL_REGION_REST');
        // Наполняем таблицу остатками
        DbFunc.qCrRegionRest.ParamByName('date_').AsDateTime := RecalcDate;
        DbFunc.qCrRegionRest.ExecSQL;
        // Сохраняем параметры
        AdmSettings.Save(AdmName,DateToStr(RecalcDate));
        // Сохраняем изменения
        CommitSql;
        q.Close;
      finally
        q.Free;
      end;
      log(LOGFILE, 'Конец пересчета в '+DateToStr(Date)+' '+TimeToStr(Time));      
    except on E:Exception do
    begin
      log(LOGFILE, 'Ошибка пересчета: '+e.Message);
      MessageDlg(TranslateText('RecalcRegionRest: пересчет остатков не прошел с ошибкой, работа будет выполняться медленее: ')+#10#13
        +e.Message,mtInformation,[mbOK],0);
      RollbackSql;
    end;
    end;
  end;
end;
//==============================================================================
function FindRealInst(AInst: integer): integer;
  var q : TOilQuery;
Begin
  Result := AInst;
  q := TOilQuery.Create(nil);
  try
    q.SQL.Text := '-->qFindRealInst,UDbFunc' + #13#10 +
      'select *' + #13#10 +
      '  from adm_possible_inst' + #13#10 +
      ' where '','' || poss_inst || '','' like ''%,'' || :inst || '',%''' + #13#10 +
      '   and not exists (select 1' + #13#10 +
      '          from adm_possible_inst' + #13#10 +
      '         where inst = :inst)';
    q.ParamByName('inst').AsInteger := AInst;
    _OpenQuery(q);
    if not q.IsEmpty then Result := q.FieldByName('inst').AsInteger;
    q.Close;
  finally
    q.Free;
  end;
End;

function GetUserPossibleOrg(AUserId: integer):integer;
begin
  Result := nvl(GetSqlValueParSimple('select ' + #13#10 +
      '       e.org_inst' + #13#10 +
      '  from adm_users u, oil_employ e, adm_possible_inst p' + #13#10 +
      ' where u.emp_id = e.id(+)' + #13#10 +
      '   and u.emp_inst = e.inst(+)' + #13#10 +
      '   and e.state(+) = ''Y''' + #13#10 +
      '   and e.org_id = e.org_inst' + #13#10 +
      '   and p.inst = ov.GetVal (''INST'')' + #13#10 +
      '   and p.poss_inst like ''%,''||e.org_inst||'',%''' + #13#10 +
      '   and u.id = :user_id',
      ['user_id', AUserId]),-1);
end;

function GetInst_List(OrgId,OrgInst:integer):string;
var
  q:TOilQuery;
begin
  q:=TOilQuery.Create(nil);
  try
    q.Sql.Text:='select poss_inst from adm_possible_inst '+
                'where id='+IntToStr(OrgId)+' and inst='+IntToStr(OrgInst);
    q.Open;
    if q.RecordCount=0 then result:=IntToStr(INST)
    else result:=q.FieldByName('poss_inst').AsString;
    q.Close;
  finally
    q.Free;
  end;
end;

function IsPossibleAzs(AId,AInst:integer):boolean;
begin
  Result := 0 <> GetSqlValueParSimple('select count(*) '
    +'  from oil_org_link ool '
    +' where ool.link_type_id = 9 '
    +'   and ool.state = ''Y'' '
    +'   and from_id = ov.GetVal(''INST'') '
    +'   and from_inst = ov.GetVal(''INST'') '
    +'   and to_id = :AId '
    +'   and to_inst = :AInst ',
    ['AId',AId,
     'AInst',AInst]);
end;
//==============================================================================
function GetNPGroup(p_NP: integer): integer;
begin
  result := nvl(GetSQLValue('select grp_id from oil_np_type where id = '+ IntToStr(p_NP)), 0);
  if result = 0 then
    Raise Exception.Create(TranslateText('Группа НП не найдена к типу НП '+ IntToStr(p_NP)));
end;
//==============================================================================

end.
