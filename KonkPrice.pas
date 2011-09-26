unit KonkPrice;
{### 2.003}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Db, DBTables, MemTable,
  MemDS, DBAccess, Ora, Mask, ToolEdit, Menus, ComCtrls, RXCtrls,
  uCommonForm,uOilQuery,uOilStoredProc{$IFDEF VER150},Variants, GridsEh{$ENDIF};

type
  TKonkPriceForm = class(TCommonForm)
    pnlBottom: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    grid: TDBGridEh;
    mt: TMemoryTable;
    ds: TOraDataSource;
    mtNAME: TStringField;
    mtField1: TFloatField;
    mtField2: TFloatField;
    mtField3: TFloatField;
    mtField4: TFloatField;
    mtField5: TFloatField;
    mtField6: TFloatField;
    mtField7: TFloatField;
    mtField8: TFloatField;
    mtField9: TFloatField;
    mtField10: TFloatField;
    mtField11: TFloatField;
    mtField12: TFloatField;
    mtField13: TFloatField;
    mtField14: TFloatField;
    mtField15: TFloatField;
    mtField16: TFloatField;
    mtField17: TFloatField;
    mtField18: TFloatField;
    mtField19: TFloatField;
    mtField20: TFloatField;
    qNpNew: TOilQuery;
    mtORG_ID: TFloatField;
    mtORG_INST: TFloatField;
    mtTYPE: TStringField;
    DateEdit1: TDateEdit;
    Label1: TLabel;
    qExists: TOilQuery;
    mtINST: TFloatField;
    qData: TOilQuery;
    PM1: TPopupMenu;
    NClearAll: TMenuItem;
    NCopy: TMenuItem;
    NCopyEmpty: TMenuItem;
    NCopyOverWrite: TMenuItem;
    NHideRow: TMenuItem;
    NHideColumn: TMenuItem;
    NAdd: TMenuItem;
    NGetPrevDay: TMenuItem;
    NAddKonkurent: TMenuItem;
    NAddAzs: TMenuItem;
    NAddAllAzs: TMenuItem;
    NAddNp: TMenuItem;
    qAddColumn: TOilQuery;
    qAddColumnID: TFloatField;
    qAddColumnNAME: TStringField;
    NAddPodrazd: TMenuItem;
    qAddKonkurent: TOilQuery;
    qAddKonkurentID: TFloatField;
    qAddKonkurentINST: TFloatField;
    qAddKonkurentNAME: TStringField;
    cbHereOnly: TCheckBox;
    StatusBar: TStatusBar;
    mtINST_NAME: TStringField;
    qAzs: TOilQuery;
    qAzsID: TFloatField;
    qAzsINST: TFloatField;
    qAzsNAME: TStringField;
    sbPrint: TRxSpeedButton;
    btnChangePriceDensity: TRxSpeedButton;
    mtd: TMemoryTable;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    mtdOrg_Id: TFloatField;
    mtdOrg_Inst: TFloatField;
    StringField2: TStringField;
    mtdInst: TFloatField;
    StringField3: TStringField;
    Label2: TLabel;
    Label3: TLabel;
    mtDEP_NAME: TStringField;
    mtDEP_ID: TFloatField;
    mtDEP_ID_OLD: TFloatField;
    qDataINST: TFloatField;
    qDataINST_NAME: TStringField;
    qDataREAL_INST: TFloatField;
    qDataORG_ID: TFloatField;
    qDataORG_INST: TFloatField;
    qDataORG_NAME: TStringField;
    qDataPAR_ID: TFloatField;
    qDataPAR_INST: TFloatField;
    qDataPAR_NAME: TStringField;
    qDataAZSPPON: TStringField;
    qDataKONK_DEP_ID: TFloatField;
    qDataKONK_DEP_NAME: TStringField;
    qDataNP_DOP_GROUP_ID: TFloatField;
    qDataPRICE: TFloatField;
    qDataDENSITY: TFloatField;
    qDataORD: TFloatField;
    qDataDENSITYNEEDED: TStringField;
    miColumns: TMenuItem;
    miColPodr: TMenuItem;
    qAddPodr: TOilQuery;
    qAddPodrID: TFloatField;
    qAddPodrNAME: TStringField;
    qDataID: TFloatField;
    NAddKonkCopy: TMenuItem;
    qPar: TOilQuery;
    qParPAR: TFloatField;
    qParPAR_INST: TFloatField;
    qDelLinks: TOilQuery;
    mtdDEP_NAME: TStringField;
    qDelDouble: TOilQuery;
    procedure RefreshGrid;
    procedure RefreshPriceDensity;
    procedure DelDouble;
    procedure MakeGrid(p_mt: TMemoryTable; p_Date: TDateTime; p_HereOnly: Boolean);
    procedure ShowData(p_mt: TMemoryTable; p_Date: TDateTime; p_Change,p_Clear,p_HereOnly: Boolean);
    procedure Save;
    procedure SetColumnValue(p_Num: integer; p_Value: real; p_Change: Boolean);
    procedure SaveIfNeed;
    procedure HideColumn(p_Num: integer);
    procedure AddColumn;
    procedure AddKonkurent;
    function AllDepDefined: Boolean;
    procedure AddAllAzs(p_Id,p_Inst: integer);
    procedure AddAllKonkAzs(p_Id,p_Inst,p_DepId: integer);
    procedure AddPodrazd;
    procedure HideCurrentRow;
    procedure ClearAll;
    procedure AddAzs(p_Id,p_Inst: integer);
    procedure FormActivate(Sender: TObject);
    procedure GetFromPrevDay;
    procedure gridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure gridKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
    procedure mtAfterEdit(DataSet: TDataSet);
    procedure gridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure NCopyEmptyClick(Sender: TObject);
    procedure NCopyOverWriteClick(Sender: TObject);
    procedure NHideColumnClick(Sender: TObject);
    procedure NAddNpClick(Sender: TObject);
    procedure NHideRowClick(Sender: TObject);
    procedure NAddKonkurentClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure cbHereOnlyClick(Sender: TObject);
    procedure NClearAllClick(Sender: TObject);
    procedure NAddPodrazdClick(Sender: TObject);
    procedure NAddAllAzsClick(Sender: TObject);
    procedure NAddAzsClick(Sender: TObject);
    procedure NGetPrevDayClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbPrintClick(Sender: TObject);
    procedure btnChangePriceDensityClick(Sender: TObject);
    procedure miColPodrClick(Sender: TObject);
    procedure gridColumns1EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure NAddKonkCopyClick(Sender: TObject);
    procedure pnlBottomDblClick(Sender: TObject);
  private
    { Private declarations }
    Changed,Preparing: Boolean;
    CurDate: TDateTime;
    FirstColumn,LastColumn: integer;
    IsObl: Boolean; // TRUE - одно из управлений с филиалами
    PriceDensity: integer;
    DiffPodr: Boolean;
  public
    { Public declarations }
  end;

var
  KonkPriceForm: TKonkPriceForm;

implementation

{$R *.DFM}

uses Main,UDbFunc,ExFunc,OilStd,GetFromGrid,ChooseOrg,ExcelFunc,KonkPriceReport,
     uStart;

const MAX_COLUMNS=20;

var OblIdList: set of byte = [7,13,19,37,138,149,201];
//==============================================================================
procedure TKonkPriceForm.MakeGrid(p_mt: TMemoryTable; p_Date: TDateTime; p_HereOnly: Boolean);
var i:integer;
    DensityTypeList,name:string;
begin
    if qNpNew.Active then qNpNew.Close;
    qNpNew.ParamByName('date_').Value:=p_Date;
    if p_HereOnly then qNpNew.ParamByName('inst').AsInteger:=REAL_INST
                  else qNpNew.ParamByName('inst').Clear;
    qNpNew.Open;
    if qNpNew.RecordCount=0 then
       Raise Exception.Create(TranslateText('Не найден список групп НП для цен конкурентов.')+#13#10+
                              TranslateText('Обратитесь к разработчикам программы!'));
    if qNpNew.RecordCount>MAX_COLUMNS then
       Raise Exception.Create(TranslateText('Внимание!!! Кол-во групп нефтепродуктов превышает допустимое!')+#13#10+
                              TranslateText('Обратитесь к разработчикам программы!'));

    for i:=0 to grid.Columns.Count-1 do
        if grid.Columns[i].FieldName='1' then
           break;
    if grid.Columns[i].FieldName<>'1' then
       Raise Exception.Create(TranslateText('Внимание!!! В гриде не найдена колонка со свойством FieldName=''1''!')+#13#10+
                              TranslateText('Обратитесь к разработчикам программы!'));
    FirstColumn:=i;
    LastColumn:=qNpNew.RecordCount+1;
    for i:=FirstColumn to grid.Columns.Count-1 do
        grid.Columns[i].Visible:=(i<=LastColumn);
    i:=FirstColumn;
    while not qNpNew.Eof do begin
        name:=qNpNew.FieldByName('name').AsString;
        if length(name)>4 then grid.Columns[i].Width:=6*length(name)+8;
        grid.Columns[i].Title.Caption:=name;
        grid.Columns[i].Tag:=qNpNew.FieldByName('id').AsInteger;
        qNpNew.Next; inc(i);
    end;

    DensityTypeList:=ReadOilVar('KONK_DENSITY_ORG_TYPES');
    if DensityTypeList='' then DensityTypeList:='3,4';
end;
//==============================================================================
procedure TKonkPriceForm.DelDouble;
begin
    __ExecSqlOra(qDelDouble);
end;
//==============================================================================
procedure TKonkPriceForm.ShowData(p_mt: TMemoryTable; p_Date: TDateTime; p_Change,p_Clear,p_HereOnly: Boolean);
// p_Change - менять ли ненулевые значения на другое ненулевое
// p_Clear - менять ли ненулевые значения на ноль
var Err: Boolean;
    n,count:integer;
    CurPodrId,CurPodrInst,CurPodrDepId: integer;
    //**************************************************************************
    procedure InitPodr;
    begin
        if qData.FieldByName('azsppon').Value='A' then begin
           CurPodrId:=qData.FieldByName('par_id').AsInteger;
           CurPodrInst:=qData.FieldByName('par_inst').AsInteger;
        end else begin
           CurPodrId:=qData.FieldByName('org_id').AsInteger;
           CurPodrInst:=qData.FieldByName('org_inst').AsInteger;
        end;
        CurPodrDepId:=qData.FieldByName('konk_dep_id').AsInteger;
    end;
    //**************************************************************************
    procedure AddFakePodr(p_mt: TMemoryTable);
    begin
        if p_mt.State=dsInsert then p_mt.Post;
        p_mt.Insert;
        p_mt.FieldByName('name').Value:=qData.FieldByName('par_name').Value;
        p_mt.FieldByName('org_id').AsInteger:=qData.FieldByName('par_id').AsInteger;
        p_mt.FieldByName('org_inst').AsInteger:=qData.FieldByName('par_inst').AsInteger;
        p_mt.FieldByName('type').Value:='P';
        p_mt.FieldByName('inst').AsInteger:=qData.FieldByName('inst').AsInteger;
        p_mt.FieldByName('inst_name').Value:=qData.FieldByName('inst_name').Value;
        if p_mt=mt then begin
           p_mt.FieldByName('dep_name').Value:=qData.FieldByName('konk_dep_name').Value;
           p_mt.FieldByName('dep_id').AsInteger:=qData.FieldByName('konk_dep_id').AsInteger;
           p_mt.FieldByName('dep_id_old').AsInteger:=qData.FieldByName('konk_dep_id').AsInteger;
        end;
        InitPodr;
    end;
    //**************************************************************************
    function NewLineNeeded(p_mt: TMemoryTable):Boolean;
    begin
        result:=
           p_mt.IsEmpty
           or (qDataOrg_Id.AsInteger<>p_mt.FieldByName('org_id').AsInteger)
           or (qDataOrg_Inst.AsInteger<>p_mt.FieldByName('org_inst').AsInteger)
           or (qDataInst.AsInteger<>p_mt.FieldByName('inst').AsInteger);
        if p_mt=mt then
           result:=result or (qDataKonk_Dep_Id.AsInteger<>p_mt.FieldByName('dep_id').AsInteger)
               and (qDataKonk_Dep_Id.AsInteger<>0);
    end;
    //**************************************************************************
    function FakePodrNeeded(p_mt: TMemoryTable):Boolean;
    begin
        result:=
           (qDataAzsPpon.AsString='A') and
            ((qDataPar_Id.AsInteger<>CurPodrId)
              or (qDataPar_Inst.AsInteger<>CurPodrInst)
              or (qDataKonk_Dep_ID.AsInteger<>CurPodrDepId)
           );
    end;
    //**************************************************************************
    procedure AddNewLine(p_mt: TMemoryTable);
    begin
        if (p_mt=mt) and FakePodrNeeded(p_mt) then AddFakePodr(p_mt);
        InitPodr;
        if p_mt.State=dsInsert then p_mt.Post;
        p_mt.Insert;
        p_mt.FieldByName('name').Value:=qData.FieldByName('org_name').Value;
        p_mt.FieldByName('org_id').AsInteger:=qData.FieldByName('org_id').AsInteger;
        p_mt.FieldByName('org_inst').AsInteger:=qData.FieldByName('org_inst').AsInteger;
        p_mt.FieldByName('type').Value:=qData.FieldByName('azsppon').Value;
        p_mt.FieldByName('inst').AsInteger:=qData.FieldByName('inst').AsInteger;
        p_mt.FieldByName('inst_name').Value:=qData.FieldByName('inst_name').Value;
        if p_mt=mt then begin
           p_mt.FieldByName('dep_name').Value:=qData.FieldByName('konk_dep_name').Value;
           p_mt.FieldByName('dep_id').AsInteger:=qData.FieldByName('konk_dep_id').AsInteger;
           p_mt.FieldByName('dep_id_old').AsInteger:=qData.FieldByName('konk_dep_id').AsInteger;
        end;
    end;
    //**************************************************************************
    procedure PutValue(p_mt: TMemoryTable; p_Field: string; p_Num: integer);
    begin
        if (p_mt.Fields[p_Num].AsFloat=0) or
           (qData.FieldByName(p_Field).AsFloat=0) and p_Clear or
           (qData.FieldByName(p_Field).AsFloat<>0) and p_Change
        then
           p_mt.Fields[p_Num].AsFloat:=qData.FieldByName(p_Field).AsFloat;
    end;
    //**************************************************************************
begin
    Err:=FALSE;
    if qData.Active then qData.Close;
    qData.ParamByName('date_').Value:=p_Date;
    if p_HereOnly then qData.ParamByName('inst').AsInteger:=REAL_INST
                  else qData.ParamByName('inst').Clear;
    qData.Open;
    mt.Open; mtd.Open; mt.EmptyTable; mtd.EmptyTable;
    n:=FirstColumn; count:=1; InitPodr;
    while not qData.Eof do begin
        if NewLineNeeded(mt) then begin
           AddNewLine(mt); n:=FirstColumn;
        end;
        if (qDataDensityNeeded.AsString='Y') and NewLineNeeded(mtd) then
           AddNewLine(mtd);

        if qDataNp_Dop_Group_Id.AsInteger>0 then begin
           while (n<grid.Columns.Count) and grid.Columns[n].Visible
                 and (qDataNp_Dop_Group_Id.Value<>grid.Columns[n].Tag)
           do inc(n);

           if (n<grid.Columns.Count) and grid.Columns[n].Visible
              and (qDataNp_Dop_Group_Id.Value=grid.Columns[n].Tag)
           then begin
              PutValue(mt,'price',n);
              if (qDataDensityNeeded.AsString='Y') then PutValue(mtd,'density',n);
           end else begin
              Err:=TRUE;
              showmessage(IntToStr(count));
           end;
        end;
        qData.Next; inc(count);
    end;
    if mt.State=dsInsert then mt.Post;
    if mtd.State=dsInsert then mtd.Post;
    mt.First; mtd.First;
    if Err then MessageDlg(TranslateText('Не все данные удалось отобразить!!!')+#13#10+
                           TranslateText('Обратитесь к разработчикам программы.'),mtWarning,[mbOk],0);
end;
//==============================================================================
procedure TKonkPriceForm.RefreshPriceDensity;
begin
    case PriceDensity of
        0: begin
           ds.DataSet:=mt; btnChangePriceDensity.Caption:=TranslateText('Показать плотности');
           Label3.Caption:=TranslateText('ЦЕНЫ ЗА ЛИТР (грн)');
        end;
        1: begin
           ds.DataSet:=mtd; btnChangePriceDensity.Caption:=TranslateText('Показать цены');
           Label3.Caption:=TranslateText('ПЛОТНОСТИ (кг/л)');
        end;
    end;
    grid.Columns[1].Visible:=(PriceDensity=0) and miColPodr.Checked;
end;
//==============================================================================
procedure TKonkPriceForm.RefreshGrid;
begin
    if Preparing then exit;
    ds.DataSet:=nil;
    MakeGrid(mt,DateEdit1.Date,cbHereOnly.Checked);
    ShowData(mt,DateEdit1.Date,True,True,cbHereOnly.Checked);
    Changed:=FALSE;
    RefreshPriceDensity;
end;
//==============================================================================
procedure TKonkPriceForm.FormActivate(Sender: TObject);
begin
    RefreshGrid;
end;
//==============================================================================
procedure TKonkPriceForm.gridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
    if (ds.DataSet.FieldByName('Org_Inst').AsInteger<>1) and (Column.FieldName='NAME') then
       AFont.Color:=clBlue;
    if ds.DataSet.FieldByName('Inst').AsInteger<>REAL_INST then begin
       AFont.Style:=AFont.Style+[fsItalic];
    end;
    if (Column.FieldName<>'NAME') and (Column.FieldName<>'DEP_NAME') and (ds.DataSet.FieldByName(Column.FieldName).AsFloat=0)
       and not (gdFocused in State) then
       AFont.Color:=grid.Color;
    if ds.DataSet=mt then begin
       if (ds.DataSet.FieldByName('type').AsString='P') then begin
          AFont.Style:=AFont.Style+[fsBold];
       end;
       if DiffPodr and (ds.DataSet.FieldByName('org_inst').AsInteger=1) and (ds.DataSet.FieldByName('dep_id').AsInteger=0)
          and (Column.FieldName='NAME')
       then
          AFont.Color:=clFuchsia;
    end;
end;
//==============================================================================
procedure TKonkPriceForm.gridKeyPress(Sender: TObject; var Key: Char);
begin
    if Key in [',','.'] then Key:=DECIMALSEPARATOR;
end;
//==============================================================================
function SaveOrgLink(p_OrgId,p_OrgInst,p_DepId,p_DepIdOld: integer):Boolean;
// возвращает TRUE, если нужная запись не существовала либо была изменена
var id: Variant;
begin
    id:=GetSqlValue(
       ' select id from oil_org_link'+
       ' where inst='+IntToStr(REAL_INST)+
       '       and state=''Y'' '+
       '       and from_id='+IntToStr(p_OrgId)+
       '       and from_inst='+IntToStr(p_OrgInst)+
       '       and to_id=to_inst'+
       '       and link_type_id=2'+
       '       and to_id='+IntToStr(p_DepIdOld)
    );
    result:=VarIsNull(id) or (p_DepId<>p_DepIdOld);
    if VarIsNull(id) then id:=GetSeqNextVal('s_oil_org_link');
    _ExecProcOra('OIL.INSORUPDOIL_ORG_LINK',
        ['ID#',               id,
         'STATE#',            'Y',
         'INST#',             REAL_INST,
         'LINK_TYPE_ID#',     2,
         'FROM_ID#',          p_OrgId,
         'FROM_INST#',        p_OrgInst,
         'TO_ID#',            p_DepId,
         'TO_INST#',          p_DepId
        ],TRUE);
end;
//==============================================================================
function TKonkPriceForm.AllDepDefined: Boolean;
var d: TDataSet;
begin
    if not DiffPodr then begin
       result:=TRUE; exit;
    end;
    d:=ds.DataSet; ds.DataSet:=nil;
  try
    mt.First; result:=FALSE;
    while not mt.Eof do begin
        if (mtInst.AsInteger=REAL_INST) and (mtOrg_id.AsInteger<>mtOrg_Inst.AsInteger)
           and (mtDep_Id.AsInteger=0)
        then exit;
        mt.Next;
    end;
    result:=TRUE;
  finally
       ds.DataSet:=d;
  end;
end;
//==============================================================================
procedure TKonkPriceForm.Save;
var i,id:integer;
    price,density: real;
    state, TmpStr: string;
    flag,flag1: Boolean;
    DepId: Variant;
    d: TDataSet;
    //**************************************************************************
    procedure NextQData;
    begin
        while not qData.Eof and ((qDataInst.AsInteger<>REAL_INST) or (qDataId.AsInteger=0)) do
           qData.Next;
    end;
    //**************************************************************************
begin
    d:=ds.DataSet; ds.DataSet:=nil;
    mt.First; mtd.First; qData.First; NextQData;
    StartSqlOra;
  try
    while not mt.Eof do begin
      if mtInst.AsInteger=REAL_INST then begin
        if (mtDep_Id.AsInteger<>mtDep_Id_Old.AsInteger) then
           SaveOrgLink(mtOrg_Id.AsInteger,mtOrg_Inst.AsInteger,mtDep_Id.AsInteger,mtDep_Id_Old.AsInteger);
        flag:=(mtOrg_Id.AsInteger=mtdOrg_Id.AsInteger) and
                     (mtOrg_Inst.AsInteger=mtdOrg_Inst.AsInteger) and
                     (mtInst.AsInteger=mtdInst.AsInteger);
        for i:=FirstColumn to grid.Columns.Count-1 do begin
            if not grid.Columns[i].Visible then break;
            flag1:=(mtOrg_Id.AsInteger=qDataOrg_Id.AsInteger) and
                   (mtOrg_Inst.AsInteger=qDataOrg_Inst.AsInteger) and
                   (mtDep_Id_Old.AsInteger=qDataKonk_Dep_Id.AsInteger) and
                   (grid.Columns[i].Tag=qDataNp_Dop_Group_Id.AsInteger);

            if flag then density:=mtd.FieldByName(grid.Columns[i].FieldName).Value
            else density:=0;

            price:=mt.FieldByName(grid.Columns[i].FieldName).AsFloat;

            if flag1 and
                  ((density<>qDataDensity.AsFloat)
                    or (price<>qDataPrice.AsFloat)
                    or (mtDep_Id.AsInteger<>qDataKonk_Dep_Id.AsInteger)
                  )
               or not flag1 and
                  ( (density>0) or (price>0) )
            then begin
               if flag1 then id:=qDataId.AsInteger
               else id:=GetSeqNextVal('s_oil_konk_price');

               if (price=0) and (density=0) then state:='N'
               else state:='Y';

               if mtDep_Id.AsInteger=0 then
                  if DiffPodr then DepId:=null
                  else DepId:=mtInst.Value
               else DepId:=mtDep_Id.AsInteger;

               _ExecProcOra('OIL.INSORUPDOIL_KONK_PRICE',
                     ['ID#',                    id,
                      'STATE#',                 state,
                      'INST#',                  mtInst.Value,
                      'DATE_#',                 CurDate,
                      'ORG_ID#',                mtOrg_Id.Value,
                      'ORG_INST#',              mtOrg_Inst.Value,
                      'NP_DOP_GROUP_ID#',       grid.Columns[i].Tag,
                      'PRICE#',                 price,
                      'DENSITY#',               density,
                      'DEP_ID#',                DepId
                     ],TRUE);
            end;
            if flag1 then begin
               qData.Next;
               NextQData;
            end;
        end;
      end;
      mt.Next;
      if flag then mtd.Next;
    end;
    DelDouble;
    CommitSqlOra;
    Changed:=FALSE;
    ds.DataSet:=d;
    DailyRepControl(TmpStr);
  except
    on E:Exception do begin
       MessageDlg(E.Message,mtError,[mbOk],0);
       RollbackSqlOra;
       ds.DataSet:=d;
    end;
  end;
end;
//==============================================================================
function GetOrgTreeSql(p_Id,p_Inst: integer): string;
begin
    result:=' (select id,inst from oil_org where '+
            ' ('+IntToStr(p_Id)+','+IntToStr(p_Inst)+') in ((id,inst),(par,par_inst))) ';
end;
//==============================================================================
procedure TKonkPriceForm.SaveIfNeed;
begin
    if Changed then
       if MessageDlg(TranslateText('Данные были изменены! Вы хотите сохранить изменения?'),mtWarning,[mbYes,mbNo],0)=mrYes then
          Save;
end;
//==============================================================================
procedure TKonkPriceForm.FormCreate(Sender: TObject);
var s: string;
    OblId: integer;
begin
  inherited;
    Preparing:=TRUE;
    CurDate:=Date;
    DateEdit1.Date:=Date;
    PriceDensity:=0;
    s:=ReadOilVar('KONK_DIFF_PODR');
    DiffPodr:=(s='Y');
    if s='Y' then begin
       s:=ReadOilVar('KONK_COL_PODR_SHOW');
       miColPodr.Checked:=(s<>'N');
    end else begin
       miColPodr.Checked:=FALSE;
       miColumns.Visible:=FALSE;
    end;
    grid.Columns[1].Visible:=miColPodr.Checked;
    OblId:=GetOblId(REAL_INST,REAL_INST);
    IsObl:=(OblId in OblIdList);
    qAddPodr.ParamByName('oblid').AsInteger:=OblId;
    _OpenQueryOra(qAddPodr);
    Preparing:=FALSE;
end;
//==============================================================================
procedure TKonkPriceForm.SetColumnValue(p_Num: integer; p_Value: real; p_Change: Boolean);
var BM: TBookMark;
    d: TDataSet;
begin
    d:=ds.DataSet;
    ds.DataSet:=nil;
    BM:=d.GetBookmark;
    d.First;
    while not d.Eof do begin
        if (d.FieldByName('inst').AsInteger=REAL_INST) and
           ((d.Fields[p_Num].Value=0) and (p_Value<>0)
            or (d.Fields[p_Num].Value<>p_Value) and p_Change)
        then begin
            d.Edit;
            d.Fields[p_Num].Value:=p_Value;
            d.Post;
        end;
        d.Next;
    end;
    d.GotoBookMark(BM);
    d.FreeBookMark(BM);
    ds.DataSet:=d;
end;
//==============================================================================
procedure TKonkPriceForm.DateEdit1Change(Sender: TObject);
begin
    if Preparing then exit; 
    if not AllDepDefined then begin
       MessageDlg(TranslateText('Не все конкуренты разнесены по филиалам!!!'),mtError,[mbOk],0);
       Preparing:=TRUE;
       DateEdit1.Date:=CurDate;
       Preparing:=FALSE;
       exit;
    end;
    SaveIfNeed;
    CurDate:=DateEdit1.Date;
    RefreshGrid;
end;
//==============================================================================
procedure TKonkPriceForm.mtAfterEdit(DataSet: TDataSet);
begin
    if not Changed then Changed:=TRUE;
end;
//==============================================================================
procedure TKonkPriceForm.gridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var b: Boolean;
begin
    if Button=mbRight then begin
       b:=(grid.Col<>1);
       NCopy.Visible:=b;
       NGetPrevDay.Visible:=b;
       NHideColumn.Visible:=b;
       NClearAll.Visible:=b;
       NAddNp.Visible:=b;
       //---------------------
       NHideRow.Visible:=not b;
       NAddPodrazd.Visible:=not b;
       NAddKonkurent.Visible:=not b;
       NAddKonkCopy.Visible:=not b;
       NAddAzs.Visible:=not b;
       NAddAllAzs.Visible:=not b;
    end;
end;
//==============================================================================
procedure TKonkPriceForm.HideColumn(p_Num: integer);
begin
    if MessageDlg(TranslateText('Вы уверены, что хотите скрыть колонку?')+#13#10+
                  TranslateText('Вся информация в ней за текущий день будет потеряна!'),mtConfirmation,[mbYes,mbNo],0)=mrNo then
       exit;
    SetColumnValue(p_Num,0,TRUE);
    SaveIfNeed;
    _ExecSqlOra('update oil_np_dop_group set state=''N'' where id='+IntToStr(grid.Columns[p_Num].Tag));
    RefreshGrid;
end;
//==============================================================================
procedure TKonkPriceForm.AddColumn;
begin
    if qAddColumn.Active then qAddColumn.Close;
    qAddColumn.Open;
    if qAddColumn.RecordCount=0 then
       Raise Exception.Create(TranslateText('Все имеющиеся группы уже отображены!'));
    SaveIfNeed;
    if ChooseFromGrid(qAddColumn,TranslateText('Группа НП для цен конкурентов'),TranslateText('Выберите группу')) then begin
       _ExecSqlOra('update oil_np_dop_group set state=''Y'' where id='+qAddColumnId.AsString);
       RefreshGrid;
    end;
end;
//==============================================================================
procedure TKonkPriceForm.AddKonkurent;
var s:string;
begin
    if qAddKonkurent.Active then qAddKonkurent.Close;
    qAddKonkurent.Open;
    if qAddKonkurent.RecordCount=0 then
       Raise Exception.Create(TranslateText('Все имеющиеся конкуренты уже отображены!'));
    SaveIfNeed;
    if ChooseFromGrid(qAddKonkurent,TranslateText('Название конкурента'),TranslateText('Выберите конкурента'),[],'NAME') then begin
        if (GetSqlValue(' select count(*) from v_oil_org_norek '+
                        ' where par_id='+qAddKonkurentId.AsString+' and par_inst='+qAddKonkurentInst.AsString+
                        '       and org_id=35')>0)
           and (MessageDlg(TranslateText('Добавить конкурента со всеми его АЗС?'),mtConfirmation,[mbYes,mbNo],0)=mrYes)
        then s:=GetOrgTreeSql(qAddKonkurentId.AsInteger,qAddKonkurentInst.AsInteger)
        else s:=' (('+qAddKonkurentId.AsString+','+qAddKonkurentInst.AsString+')) ';
        _ExecSqlOra('update oil_org_det set konk_show=''Y'' where (org_id,inst) in '+s);
        RefreshGrid;
    end;
end;
//==============================================================================
procedure AddKonkShow(p_Id,p_Inst: integer);
var id: Variant;
begin
    id:=GetSqlValue(
       ' select id from oil_org_det '+
       ' where org_id='+IntToStr(p_Id)+' and inst='+IntToStr(p_Inst)+' and state=''Y'' ');
    if VarIsNull(id) then
       if p_Inst=REAL_INST then id:=GetSeqNextVal('s_oil_org_det')
                           else id:=p_Inst;
    _ExecProcOra('OIL.INSORUPDOIL_ORG_DET',
        ['ID#',         id,
         'STATE#',      'Y',
         'INST#',       p_Inst,
         'ORG_ID#',     p_Id,
         'KONK_SHOW#',  'Y'
        ],TRUE);
end;
//==============================================================================
procedure TKonkPriceForm.AddAllKonkAzs(p_Id,p_Inst,p_DepId: integer);
var s:string;
begin
    _ExecSqlOra(
       ' update oil_org_det set konk_show=''Y'' '+
       ' where (org_id,inst) in '+
       '     (select id,inst from v_org where state=''Y'' and '+
       '      par='+IntToStr(p_Id)+' and par_inst='+IntToStr(p_Inst)+')');

     if p_DepId=0 then exit;
     s:=' insert into oil_org_link (id,state,inst,link_type_id,from_id,from_inst,to_id,to_inst)'+
        ' (select s_oil_org_link.nextval,''Y'','+IntToStr(REAL_INST)+',2,org_id,inst,'+IntToStr(p_DepId)+','+IntToStr(p_DepId)+
        '  from '+
        '     (select /*+ORDERED USE_HASH(odet,oo,ool)*/ '+
        '             odet.*,ool.id as link_id '+
        '      from oil_org_det odet,v_org oo,oil_org_link ool '+
        '      where odet.state=''Y'' and ool.state(+)=''Y'' '+
        '            and ool.link_type_id(+)=2 '+
        '            and odet.org_id=ool.from_id(+) '+
        '            and odet.inst=ool.from_inst(+) '+
        '            and odet.org_id=oo.id and odet.inst=oo.inst '+
        '            and oo.org_type=35 and oo.par='+IntToStr(p_Id)+' and oo.par_inst='+IntToStr(p_Inst)+
        '            and odet.konk_show=''Y'' '+
        '      )'+
        ' where link_id is null '+
        ' ) ';
    _ExecSqlOra(s);
end;
//==============================================================================
procedure TKonkPriceForm.AddAllAzs(p_Id,p_Inst: integer);
begin
    if qAzs.Active then qAzs.Close;
    qAzs.ParamByName('id').AsInteger:=p_Id;
    qAzs.ParamByName('inst').AsInteger:=p_Inst;
    qAzs.ParamByName('all_azs').AsString:='Y';
    qAzs.Open;
    while not qAzs.Eof do begin
        AddKonkShow(qAzsId.AsInteger,qAzsInst.AsInteger);
        qAzs.Next;
    end;
    qAzs.Close;
end;
//==============================================================================
procedure TKonkPriceForm.AddPodrazd;
var vId,vInst: integer;
    vName: string;
begin
    if CaptureOrg(1,0,0,'yyyyynnn',vId,vInst,vName) then begin
       SaveIfNeed;
       AddKonkShow(vId,vInst);
       if OrgHasAzs(vId,vInst) and
          (MessageDlg(TranslateText('Добавить подразделение со всеми его АЗС?'),mtConfirmation,[mbYes,mbNo],0)=mrYes)
       then
          AddAllAzs(vId,vInst);
       RefreshGrid;
    end;
end;
//==============================================================================
procedure TKonkPriceForm.HideCurrentRow;
var s,sql:string;
    nlink: integer;
begin
    if mtType.AsString='P' then s:=TranslateText('и все его АЗС ')
                           else s:='';
    if MessageDlg(TranslateText('Вы уверены, что хотите скрыть конкурента ')+s+#13#10+
                  TranslateText('и в дальнейшем не вводить информацию по нём?')+#13#10+
                  TranslateText('Все данные по скрываемым конкурентам за текущий день будут потеряны!'),mtConfirmation,[mbYes,mbNo],0)=mrNo
    then exit;
    SaveIfNeed;

    StartSqlOra;

    // в s попадает условие на оргинизации, в случае АЗС - только сама АЗС,
    // в случае конкурента - он вместе со всеми АЗС
    if mtType.AsString='A' then s:=' (('+mtOrg_Id.AsString+','+mtOrg_Inst.AsString+')) '
    else s:=GetOrgTreeSql(mtOrg_Id.AsInteger,mtOrg_Inst.AsInteger);
    // создаем SQL, который уничтожает все записи по удаляемым организациям
    sql:=' update oil_konk_price set state=''N'',price=0 '+
         ' where date_='''+DateToStr(CurDate)+''' '+
         '       and inst='+IntToStr(REAL_INST)+
         '       and (org_id,org_inst) in '+s;

    if mtDep_Id.AsInteger<>0 then begin // если определено подразделение
       DefineQParamsOra(qDelLinks,
          ['id',        mtOrg_Id.Value,
           'inst',      mtOrg_Inst.Value,
           'dep',       mtDep_Id.Value
          ]);
       __ExecSQLOra(qDelLinks); // удаляем все линки к подразделению
       sql:=sql+
         '       and dep_id='+mtDep_Id.AsString;
    end;
    _ExecSqlOra(sql); // удаляем все записи

    nlink:=GetSqlValue( // сколько осталось линков к удаляемому конкуренту
       ' select count(*) from oil_org_link '+
       ' where state=''Y'' and link_type_id=2 '+
       '       and from_id='+mtOrg_Id.AsString+
       '       and from_inst='+mtOrg_Inst.AsString);
    // определяем SQL, который удалит организации из списка выводимых в ценах конкурентов
    // при этом АЗС удаляются автоматом, а сам конкурент только если nlink=0
    sql:='update oil_org_det set konk_show=''N'' where (org_id,inst) in '+s;
    if nlink>0 then sql:=sql+' and (org_id,inst) not in (('+mtOrg_Id.AsString+','+mtOrg_Inst.AsString+'))';
    _ExecSqlOra(sql);
    CommitSqlOra;
    RefreshGrid;
end;
//==============================================================================
procedure TKonkPriceForm.GetFromPrevDay;
var PrevDate: Variant;
begin
    PrevDate:=GetSqlValue(
       ' select max(date_) from oil_konk_price '+
       ' where date_<'''+DateToStr(CurDate)+''' '+
       '       and inst='+IntToStr(REAL_INST));
    if VarIsNull(PrevDate) then
       Raise Exception.Create(TranslateText('Информация по датам, более ранним не вносилась'));
    if MessageDlg(TranslateText('Сейчас на текущий день будет перенесена информация с ')+DateToStr(PrevDate)+'.'+#13#10+
                  TranslateText('Вся введенная информация будет потеряна. Вы уверены?'),mtConfirmation,[mbYes,mbNo],0)=mrYes
    then begin
        StartSqlOra;
        _ExecSqlOra(' update oil_konk_price set price=0,state=''N'' '+
                    ' where date_='''+DateToStr(CurDate)+''' '+
                    '       and inst='+IntToStr(REAL_INST));
        DelDouble;
        if qData.Active then qData.Close;
        qData.ParamByName('date_').Value:=PrevDate;
        qData.ParamByName('inst').Value:=REAL_INST;
        qData.Open;
        while not qData.Eof do begin
            if qDataId.AsInteger<>0 then
               _ExecProcOra('OIL.INSORUPDOIL_KONK_PRICE',
                   ['ID#',              GetSeqNextVal('s_oil_konk_price'),
                    'STATE#',           'Y',
                    'INST#',            REAL_INST,
                    'DATE_#',           CurDate,
                    'ORG_ID#',          qDataOrg_Id.Value,
                    'ORG_INST#',        qDataOrg_Inst.Value,
                    'NP_DOP_GROUP_ID#', qDataNp_Dop_Group_Id.Value,
                    'PRICE#',           qDataPrice.Value,
                    'DENSITY#',         qDataDensity.Value,
                    'DEP_ID#',          qDataKonk_Dep_ID.Value
                   ],TRUE);
            qData.Next;
        end;
        CommitSqlOra;
    end;
    RefreshGrid;
end;
//==============================================================================
procedure TKonkPriceForm.ClearAll;
begin
    _ExecSqlOra(
       ' update oil_konk_price '+
       ' set state=''N'', '+
       '     price=0 '+
       ' where date_='''+DateToStr(CurDate)+''' '+
       '       and inst='+IntToStr(REAL_INST));
    RefreshGrid;
end;
//==============================================================================
procedure TKonkPriceForm.AddAzs(p_Id,p_Inst: integer);
var DepId:integer;
begin
    if qAzs.Active then qAzs.Close;
    qAzs.ParamByName('id').AsInteger:=p_Id;
    qAzs.ParamByName('inst').AsInteger:=p_Inst;
    qAzs.ParamByName('all_azs').Clear;
    qAzs.Open;
    DepId:=mtDep_Id.AsInteger;
    if qAzs.RecordCount=0 then
       Raise Exception.Create(TranslateText('Все АЗС этого подразделения уже отображены'));
    if ChooseFromGrid(qAzs,TranslateText('Название АЗС'),TranslateText('Выберите АЗС')) then begin
       if DepId<>0 then
          SaveOrgLink(qAzsId.AsInteger,qAzsInst.AsInteger,DepId,DepId);
       SaveIfNeed;
       AddKonkShow(qAzsId.AsInteger,qAzsInst.AsInteger);
       RefreshGrid;
    end;
end;
//==============================================================================
procedure TKonkPriceForm.NCopyEmptyClick(Sender: TObject);
begin
    SetColumnValue(grid.Col-1,ds.DataSet.Fields[grid.Col-1].Value,FALSE);
end;
//==============================================================================
procedure TKonkPriceForm.NCopyOverWriteClick(Sender: TObject);
begin
    SetColumnValue(grid.Col-1,ds.DataSet.Fields[grid.Col-1].Value,TRUE);
end;
//==============================================================================
procedure TKonkPriceForm.NHideColumnClick(Sender: TObject);
begin
    HideColumn(grid.Col-1);
end;
//==============================================================================
procedure TKonkPriceForm.NAddNpClick(Sender: TObject);
begin
    AddColumn;
end;
//==============================================================================
procedure TKonkPriceForm.NHideRowClick(Sender: TObject);
begin
    HideCurrentRow;
end;
//==============================================================================
procedure TKonkPriceForm.NAddKonkurentClick(Sender: TObject);
begin
    AddKonkurent;
end;
//==============================================================================
procedure TKonkPriceForm.bbCancelClick(Sender: TObject);
begin
    SaveIfNeed;
    if not AllDepDefined then begin
       MessageDlg(TranslateText('Не все конкуренты разнесены по филиалам!!!'),mtError,[mbOk],0);
       exit;
    end;
    Close;
end;
//==============================================================================
procedure TKonkPriceForm.bbOkClick(Sender: TObject);
begin
    Save;
    RefreshGrid;
end;
//==============================================================================
procedure TKonkPriceForm.dsDataChange(Sender: TObject; Field: TField);
begin
    if mtInst.AsInteger<>REAL_INST then begin
       StatusBar.Panels[0].Text:=mtInst_Name.AsString;
       grid.Options:=grid.Options-[dgEditing]
    end else begin
       StatusBar.Panels[0].Text:='';
       grid.Options:=grid.Options+[dgEditing]
    end;
end;
//==============================================================================
procedure TKonkPriceForm.cbHereOnlyClick(Sender: TObject);
begin
    RefreshGrid;
end;
//==============================================================================
procedure TKonkPriceForm.NClearAllClick(Sender: TObject);
begin
    if MessageDlg(TranslateText('Вы уверены, что хотите очистить введенные данные?'),
                  mtConfirmation,[mbYes,mbNo],0)=mrYes
    then ClearAll;
end;
//==============================================================================
procedure TKonkPriceForm.NAddPodrazdClick(Sender: TObject);
begin
    AddPodrazd;
end;
//==============================================================================
procedure TKonkPriceForm.NAddAllAzsClick(Sender: TObject);
var DepId: integer;
begin
    DepId:=mtDep_Id.AsInteger;
    SaveIfNeed;
    if mtOrg_Inst.AsInteger=1 then AddAllKonkAzs(mtOrg_Id.AsInteger,mtOrg_Inst.AsInteger,DepId)
    else AddAllAzs(mtOrg_Id.AsInteger,mtOrg_Inst.AsInteger);
    RefreshGrid;
end;
//==============================================================================
procedure TKonkPriceForm.NAddAzsClick(Sender: TObject);
begin
    AddAzs(mtOrg_Id.AsInteger,mtOrg_Inst.AsInteger);
end;
//==============================================================================
procedure TKonkPriceForm.NGetPrevDayClick(Sender: TObject);
begin
    GetFromPrevDay;
end;
//==============================================================================
procedure TKonkPriceForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;
//==============================================================================
procedure TKonkPriceForm.sbPrintClick(Sender: TObject);
begin
    MakeKonkPriceReport(frmStart.OraSession1,'',DateEdit1.Date);
end;
//==============================================================================
procedure TKonkPriceForm.btnChangePriceDensityClick(Sender: TObject);
begin
    PriceDensity:=1-PriceDensity;
    RefreshPriceDensity;
end;
//==============================================================================
procedure TKonkPriceForm.miColPodrClick(Sender: TObject);
var s:string;
begin
    miColPodr.Checked:=not miColPodr.Checked;
    grid.Columns[1].Visible:=miColPodr.Checked;
    if miColPodr.Checked then s:='Y'
                         else s:='N';
    WriteOilVar('KONK_COL_PODR_SHOW',s);
end;
//==============================================================================
procedure TKonkPriceForm.gridColumns1EditButtonClick(Sender: TObject;
  var Handled: Boolean);
  //****************************************************************************
  procedure SetDep;
  begin
      mt.Edit;
      mtDep_Name.AsString:=qAddPodrName.AsString;
      mtDep_Id.AsInteger:=qAddPodrId.AsInteger;
      mt.Post;
  end;
  //****************************************************************************
begin
    if not IsObl then exit;
    if mtOrg_Id.AsInteger=mtOrg_Inst.AsInteger then exit;
    if ChooseFromGrid(qAddPodr,TranslateText('Подразделение'),TranslateText('Выберите подразделение')) then begin
       SetDep;
       if mtType.AsString='P' then begin
          mt.Next;
          if not mt.Eof and (mtType.AsString='A') then
             while not mt.Eof and (mtType.AsString='A') do begin
                 SetDep;
                 mt.Next;
             end;
          Save;
          RefreshGrid;
       end else begin
          _OpenQueryParOra(qPar,
             ['id',      mtOrg_Id.Value,
              'inst',    mtOrg_Inst.Value
             ]);
          Save;
          SaveOrgLink(qParPar.AsInteger,qParPar_Inst.AsInteger,qAddPodrId.AsInteger,qAddPodrId.AsInteger);
          RefreshGrid;
       end;
    end;
end;
//==============================================================================
procedure TKonkPriceForm.NAddKonkCopyClick(Sender: TObject);
begin
    if mtDep_Id.AsInteger=0 then
       Raise Exception.Create(TranslateText('Сначала следует определить конкурирующее подразделение у выбранной организации'));
    ShowMessage(TranslateText('Сейчас Вам будет предложено выбрать подразделение,')+#13#10+
                TranslateText('с которым конкурирует копия выбранной организации.'));
    if ChooseFromGrid(qAddPodr,TranslateText('Подразделение'),TranslateText('Выберите подразделение')) then begin
       SaveOrgLink(mtOrg_Id.AsInteger,mtOrg_Inst.AsInteger,qAddPodrId.AsInteger,qAddPodrId.AsInteger);
       SaveIfNeed;
       RefreshGrid;
    end;
end;
//==============================================================================
procedure TKonkPriceForm.pnlBottomDblClick(Sender: TObject);
begin
    RefreshGrid;
end;
//==============================================================================
end.
