unit Import1CDeb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MemDS, DBAccess, Ora, DBTables, Grids, DBGridEh, ExtCtrls, StdCtrls,
  Buttons, ComCtrls, uCommonForm,uOilQuery,uOilStoredProc{$IFDEF VER150},Variants{$ENDIF};

type
  TImport1CDebForm = class(TCommonForm)
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    tbl: TTable;
    q: TOilQuery;
    ds: TOraDataSource;
    qDATE_: TDateTimeField;
    qDATE_CR: TDateTimeField;
    bbCancel: TBitBtn;
    btnImport: TBitBtn;
    od1: TOpenDialog;
    pb1: TProgressBar;
    BitBtn1: TBitBtn;
    qID: TFloatField;
    qINST: TFloatField;
    procedure ActivateQ;
    procedure Import(p_FileName:string);
    procedure DetectOrgs(p_Id,p_Inst: integer);
    procedure btnImportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Import1CDebForm: TImport1CDebForm;

implementation

{$R *.DFM}

uses UDbFunc,ExFunc,uMessageDlgExt,Main,OilStd, uStart;
//==============================================================================
procedure TImport1CDebForm.ActivateQ;
begin
    if q.Active then q.Close;
    _OpenQueryOra(q);
end;
//==============================================================================
procedure TImport1CDebForm.btnImportClick(Sender: TObject);
var s,DirName: string;
    i: integer;
begin
    if od1.Execute then
       Import(od1.FileName);
       s:=od1.FileName;
       for i:=length(s) downto 1 do
           if s[i]='\' then break;
       DirName:=copy(s,1,i);
end;
//==============================================================================
procedure TImport1CDebForm.Import(p_FileName:string);
var s: string;
    date_: TDateTime;
    n,id,DetId: integer;
    qID: TOilQuery;

    procedure ClearOld;
    begin
        _ExecSqlOra(' update oil_deb_1c_det '+
                    ' set state=''N'' '+
                    ' where deb_1c_id='+IntToStr(id)+
                    '       and inst='+IntToStr(INST));
    end;

    procedure OpenQId;
    begin
        qId:=TOilQuery.Create(Self);
        qId.Session:=frmStart.OraSession1;
        qId.Sql.Text:=' select id from oil_deb_1c_det '+
                      ' where state=''N'' '+
                      '       and inst='+IntToStr(INST)+
                      '       and deb_1c_id='+IntToStr(id);
        _OpenQueryOra(qId);
    end;

begin
    if tbl.Active then tbl.Close;
    s:=GetDirName(p_FileName);
    tbl.DatabaseName:=s;
    tbl.TableName:=copy(p_FileName,length(s)+1,length(p_FileName));
    tbl.Open;

    pb1.Max:=tbl.RecordCount; pb1.Position:=0;

    date_:=tbl.FieldByName('date_').AsDateTime;
    n:=GetSqlValue(' select count(*) from oil_deb_1c '+
                   ' where date_='''+DateToStr(date_)+''' '+
                   '       and state=''Y'' '+
                   '       and inst='+IntToStr(INST));

    if n>0 then
       if MessageDlgExt(TranslateText('Дебеторка за ')+tbl.FieldByName('date_').AsString+TranslateText(' уже была импортирована.')+
                        TranslateText('При повторном импорте старые данные будут утеряны. Вы уверены?'),mtWarning,[TranslateText('Да'),TranslateText('Нет')])=2
       then exit;

    StartSqlOra;
    try
        if n>0 then
           id:=GetSqlValue(' select id from oil_deb_1c'+
                           ' where date_='''+DateToStr(date_)+''' '+
                           '       and inst='+IntToStr(INST))
        else id:=GetSeqNextVal('s_oil_deb_1c');

        ClearOld;

        _ExecProcOra('OIL.INSORUPDOIL_DEB_1C',
                     ['ID#',                  id,
                      'STATE#',               'Y',
                      'INST#',                INST,
                      'DATE_#',               tbl.FieldByName('date_').Value,
                      'DATE_CR#',             tbl.FieldByName('date_cr').Value,
                      'DATE_LOAD#',           date],TRUE);

        OpenQId;
        while not tbl.Eof do begin
            if qId.Eof then DetId:=GetSeqNextVal('s_oil_deb_1c_det')
            else begin
               DetId:=qId.FieldByName('id').AsInteger;
               qId.Next;
            end;
            _ExecProcOra('OIL.INSORUPDOIL_DEB_1C_DET',
                         ['ID#',                      DetId,
                          'STATE#',                   'Y',
                          'INST#',                    INST,
                          'DEB_1C_ID#',               id,
                          'DEP_ID#',                  tbl.FieldByName('filial_id').Value,
                          'ORG_NAME#',                tbl.FieldByName('name').Value,
                          'ORG_OKPO#',                tbl.FieldByName('okpo').Value,
                          'ORG_ID#',                  null,
                          'ORG_INST#',                null,
                          'ORG_DETECT_RESULT#',       null,
                          'DEB_TYPE#',                tbl.FieldByName('deb_type').Value,
                          'TYPE_ART#',                tbl.FieldByName('type_art').Value,
                          'YEAR#',                    tbl.FieldByName('year').Value,
                          'DAYS#',                    tbl.FieldByName('days').Value,
                          'SUMMA#',                   tbl.FieldByName('summa').Value],TRUE);
            tbl.Next; pb1.StepIt;
        end;
        CommitSqlOra;
        pb1.Position:=0;
        showmessage(TranslateText('Импорт завершен успешно'));
        ActivateQ;
    except
        on E:Exception do begin
           MessageDlg(E.Message,mtError,[mbOk],0);
           ShowMessage(tbl.FieldByName('name').AsString);
           RollbackSqlOra;
           pb1.Position:=0;
        end;
    end;
end;
//==============================================================================
procedure TImport1CDebForm.FormCreate(Sender: TObject);
begin
  inherited;
    ActivateQ;
end;
//==============================================================================
procedure TImport1CDebForm.DetectOrgs(p_Id,p_Inst: integer);
var qD: TOilQuery;

    procedure DetectOrg;
    var InstList,OrgId,OrgInst,OrgResult,Okpo: string;
        qO: TOilQuery;
    begin
        InstList:=nvl(GetSqlValue(
           ' select poss_inst from adm_possible_inst '+
           ' where id=inst and id='+qD.FieldByName('dep_id').AsString),qD.FieldByName('dep_id').AsString);
        Okpo:=qD.FieldByName('org_okpo').AsString;
        qO:=TOilQuery.Create(Self);
        qO.Session:=frmStart.OraSession1;
        qO.Sql.Text:=
           ' select id,inst,name from v_org '+
           ' where state=''Y'' and id_num='''+Okpo+''' '+
           '       and inst in ('+InstList+')';
        _OpenQueryOra(qO);
        case qO.RecordCount of
          0: begin OrgId:='null'; OrgInst:='null'; OrgResult:='2'; end;
          1: begin
                OrgId:=qO.FieldByName('id').AsString;
                OrgInst:=qO.FieldByName('inst').AsString;
                if StrLike(qO.FieldByName('name').AsString,qD.FieldByName('org_name').AsString) then
                   OrgResult:='0'
                else OrgResult:='1';
             end;
          2: begin OrgId:='null'; OrgInst:='null'; OrgResult:='3'; end;
        end;
        _ExecSqlOra(
           ' update oil_deb_1c_det '+
           ' set Org_Id='+OrgId+','+
           '     Org_Inst='+OrgInst+','+
           '     Org_Detect_Result='+OrgResult+
           ' where state=''Y'' '+
           '       and deb_1c_id='+IntToStr(p_Id)+
           '       and inst='+IntToStr(p_Inst)+
           '       and dep_id='+qD.FieldByName('dep_id').AsString+
           '       and org_okpo='''+Okpo+''' ');
    end;

begin
    qD:=TOilQuery.Create(Self);
    qD.Session:=frmStart.OraSession1;
    qD.Sql.Text:=
       ' select distinct dep_id,org_name,org_okpo from oil_deb_1c_det '+
       ' where state=''Y'' '+
       '       and deb_1c_id='+IntToStr(p_Id)+
       '       and inst='+IntToStr(p_Inst)+
       '       and dep_id is not null '+
       ' order by org_okpo,dep_id ';
    _OpenQueryOra(qD);

    StartSqlOra;
    try
        while not qD.Eof do begin
          DetectOrg;
          qD.Next;
        end;
        CommitSqlOra;
    except
        on E:Exception do begin
           MessageDlg(E.Message,mtError,[mbOk],0);
           RollbackSqlOra;
        end;
    end;
end;
//==============================================================================
procedure TImport1CDebForm.BitBtn1Click(Sender: TObject);
begin
    if q.RecordCount=0 then exit;
    DetectOrgs(q.FieldByName('id').AsInteger,q.FieldByName('inst').AsInteger);
end;
//==============================================================================
end.
