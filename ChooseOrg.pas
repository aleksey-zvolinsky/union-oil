unit ChooseOrg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, ToolEdit, RxLookup, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids,
  Db, DBTables, CurrEdit, RXCtrls, Menus, DBGridEh, RxQuery, uCommonForm,
  MemDS, DBAccess, Ora,uOilQuery,uOilStoredProc, GridsEh, DBGridEhGrouping;
  // MemDS,Ora

type
  TChooseOrgForm = class(TCommonForm)
    Label3: TLabel;
    BtnClearObl: TSpeedButton;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    qOld: TOilQuery;
    Ds: TOraDataSource;
    CEObl: TComboEdit;
    CEPpon: TComboEdit;
    btnClearPpon: TSpeedButton;
    Label4: TLabel;
    CBRekvizit: TCheckBox;
    btnEdit: TSpeedButton;
    qExt: TOilQuery;
    qExtID: TFloatField;
    qExtNAME: TStringField;
    qExtINST: TFloatField;
    qExtID_NUM: TStringField;
    qExtNAL_NUM: TStringField;
    qExtSVID_NUM: TStringField;
    qExtADDR: TStringField;
    qExtSTART_DATE: TDateTimeField;
    qExtPHONE: TStringField;
    qExtE_MAIL: TStringField;
    qExtBOSS: TStringField;
    qExtBOSS_TEL_H: TStringField;
    qExtBOSS_TEL_W: TStringField;
    qExtDOV: TStringField;
    qExtDOV_DATE: TDateTimeField;
    qExtGBUH: TStringField;
    qExtGBUH_TEL_H: TStringField;
    qExtGBUH_TEL_W: TStringField;
    qExtPAR: TFloatField;
    qExtPAR_INST: TFloatField;
    qExtFACE: TFloatField;
    qExtNUM: TStringField;
    qExtORG_TYPE: TStringField;
    qExtORG_ID: TFloatField;
    qExtPAR_NAME: TStringField;
    qExtREK_ID: TFloatField;
    qExtREK_INST: TFloatField;
    qExtRACH_CHET: TStringField;
    qExtMFO: TStringField;
    btnDel: TSpeedButton;
    CanDeleteQuery: TOilQuery;
    q2: TOilQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    btnAdd: TRxSpeedButton;
    RBObl: TRadioButton;
    RBPpon: TRadioButton;
    RBAzs: TRadioButton;
    RBOther: TRadioButton;
    RBAll: TRadioButton;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    p9: TPanel;
    p10: TPanel;
    p1: TPanel;
    p11: TPanel;
    p12: TPanel;
    p13: TPanel;
    p14: TPanel;
    p15: TPanel;
    p16: TPanel;
    p3: TPanel;
    p2: TPanel;
    DBGrid1: TDBGridEh;
    qOldKATEGORY: TStringField;
    Button2: TButton;
    qOldID: TFloatField;
    qOldNAME: TStringField;
    qOldINST: TFloatField;
    qOldID_NUM: TStringField;
    qOldNAL_NUM: TStringField;
    qOldSVID_NUM: TStringField;
    qOldADDR: TStringField;
    qOldPHONE: TStringField;
    qOldBOSS: TStringField;
    qOldFACE: TFloatField;
    qOldORG_ID: TFloatField;
    qOldPAR_NAME: TStringField;
    qOldRACH_CHET: TStringField;
    qOldMFO: TStringField;
    qOldANKETA: TStringField;
    qOldORG_TYPE_NAME: TStringField;
    qExtFACE_NAME: TStringField;
    qExtFACE_SHORTNAME: TStringField;
    qExtPLANECO_CODE: TFloatField;
    qExtCARD_ID: TFloatField;
    qExtDOGOVOR: TStringField;
    qExtANKETA: TStringField;
    qExtVED: TFloatField;
    qExtAZSID: TFloatField;
    qExtAZSINST: TFloatField;
    qExtAZSNAME: TStringField;
    qExtPPONID: TFloatField;
    qExtPPONINST: TFloatField;
    qExtPPONNAME: TStringField;
    qExtOBLID: TFloatField;
    qExtOBLINST: TFloatField;
    qExtOBLNAME: TStringField;
    qExtBANK_NAME: TStringField;
    qExtDEF: TFloatField;
    qOldBLACK_HERE: TStringField;
    qOldBLACK_LIST_COUNT: TFloatField;
    qOldSVOY: TStringField;
    p4: TPanel;
    p5: TPanel;
    Label1: TLabel;
    EditOrg: TEdit;
    btnClearOrg: TSpeedButton;
    p6: TPanel;
    CBFizFace: TCheckBox;
    CBUrFace: TCheckBox;
    CBNotDefFace: TCheckBox;
    p7: TPanel;
    cbSvoy: TCheckBox;
    cbBlackList: TCheckBox;
    cbPr: TCheckBox;
    p8: TPanel;
    Label5: TLabel;
    EditOrgId: TEdit;
    btnClearId: TSpeedButton;
    btnClearOKPO: TSpeedButton;
    EditOkpo: TEdit;
    Label2: TLabel;
    PopupMenu3: TPopupMenu;
    miAlfaNafta: TMenuItem;
    RxSpeedButton1: TRxSpeedButton;
    miNKAlfaNafta: TMenuItem;
    miMainOrg: TMenuItem;
    miOldOrg: TMenuItem;
    qOldNAME_UKR: TStringField;
    qOldADDR_UKR: TStringField;
    q: TOilQuery;
    qFace: TFloatField;
    qKATEGORY: TStringField;
    qID: TFloatField;
    qNAME: TStringField;
    qINST: TFloatField;
    qID_NUM: TStringField;
    qNAL_NUM: TStringField;
    qSVID_NUM: TStringField;
    qADDR: TStringField;
    qPHONE: TStringField;
    qBOSS: TStringField;
    qORG_ID: TFloatField;
    qPAR_NAME: TStringField;
    qRACH_CHET: TStringField;
    qMFO: TStringField;
    qANKETA: TStringField;
    qORG_TYPE_NAME: TStringField;
    qBLACK_HERE: TStringField;
    qBLACK_LIST_COUNT: TFloatField;
    qSVOY: TStringField;
    qNAME_UKR: TStringField;
    qADDR_UKR: TStringField;
    TimerActivateQ: TTimer;
    N6: TMenuItem;
    miDuplicateOrg: TMenuItem;
    miAviasOrg: TMenuItem;
    pnlHideFilter: TPanel;
    sbFilterPosition: TSpeedButton;
    pnlTuneGridBtn: TPanel;
    sbCol: TSpeedButton;
    PanelCol: TPanel;
    cbCol: TRxCheckListBox;
    pRefresh: TPanel;
    spbCloseTunePanel: TSpeedButton;
    spbSelectAll: TSpeedButton;
    spbClearColConfig: TSpeedButton;
    procedure ClearFilters;
    procedure ActivateQ(sorttype:char='n');
    procedure bbSearchClick(Sender: TObject);
    procedure BtnClearOblClick(Sender: TObject);
    procedure btnClearOrgClick(Sender: TObject);
    procedure EditOrgChange(Sender: TObject);
    procedure EditParentChange(Sender: TObject);
    procedure RGOrgTypeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure btnClearPponClick(Sender: TObject);
    procedure CEOblButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CEPponButtonClick(Sender: TObject);
    procedure btnClearIdClick(Sender: TObject);
    procedure CalcOrgIdChange(Sender: TObject);
    procedure CalcParentIdChange(Sender: TObject);
    procedure EditOrgKeyPress(Sender: TObject; var Key: Char);
    procedure CalcOrgIdKeyPress(Sender: TObject; var Key: Char);
    procedure EditParentKeyPress(Sender: TObject; var Key: Char);
    procedure CalcParentIdKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure CalcOkpoChange(Sender: TObject);
    procedure btnClearOKPOClick(Sender: TObject);
    procedure EditOrgIdChange(Sender: TObject);
    procedure EditOkpoChange(Sender: TObject);
    procedure CBRekvizitClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    function ApplyArgs(myorgtype,OrgId,OrgInst:integer;EnabledFlags:string):Boolean;
    procedure CBUrFaceClick(Sender: TObject);
    procedure CBFizFaceClick(Sender: TObject);
    procedure CBNotDefFaceClick(Sender: TObject);
    procedure RBAllClick(Sender: TObject);
    procedure RBOblClick(Sender: TObject);
    procedure RBPponClick(Sender: TObject);
    procedure RBAzsClick(Sender: TObject);
    procedure RBOtherClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure CBAlfaOnlyClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1SortMarkingChanged(Sender: TObject);
    procedure QOldCalcFields(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure qCalcFields(DataSet: TDataSet);
    procedure p2DblClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure DBGrid1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure bbOkClick(Sender: TObject);
    procedure miAlfaNaftaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerActivateQTimer(Sender: TObject);
    procedure miDuplicateOrgClick(Sender: TObject);
    procedure sbFilterPositionClick(Sender: TObject);
    procedure sbColClick(Sender: TObject);
    procedure spbSelectAllClick(Sender: TObject);
    procedure spbCloseTunePanelClick(Sender: TObject);
    procedure spbClearColConfigClick(Sender: TObject);
    procedure DBGrid1ColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure cbColClickCheck(Sender: TObject);
  private
    InActivateQ: boolean;
    IsPossibleAzs: boolean;
    IsColConfCleared: boolean;
    procedure TimerActivate;
  public
    Close_On_DblClick:Boolean;
    OblId,PponId:integer;
    OrderField,OrderDirection:string;
    FastOrgId,FastOrgInst: integer;
    PossibleInstOnly: Boolean;
  end;

function CaptureOrg(myorgtype,OrgId,OrgInst:integer;EnabledFlags:string;var ResId,ResInst:integer;var ResName:string):Boolean;
function CaptureOrgT(myorgtype,OrgId,OrgInst:integer;EnabledFlags:string;var ResId,ResInst:integer;var ResName:string;var ResType:integer):Boolean;
function CaptureOrgExt(myorgtype,OrgId,OrgInst:integer;EnabledFlags:string;var ResId,ResInst:integer;var ResName:string;var Q:TOilQuery):Boolean;
function CaptureOrgQ(myorgtype,OrgId,OrgInst:integer;EnabledFlags:string;var Q:TOilQuery):Boolean;
function CaptureOrgRekvizit(myorgtype,OrgId,OrgInst:integer;EnabledFlags:string;var ResId,ResInst:integer;var ResName,ResRach_Chet,ResMFO:string):Boolean;
procedure ShowOrgGuide(myorgtype,OrgId,OrgInst:integer;EnabledFlags:string);

var
  ChooseOrgForm: TChooseOrgForm;

implementation

uses UDbFunc, ExFunc, ExcelFunc, AddOrgRef, AddFizface, OilStd, Main, Anketa,
  MoneyFunc, Passw, uCrypt;

{$R *.DFM}

var Preparing:Boolean=TRUE;

procedure TChooseOrgForm.ActivateQ(sorttype:char='n');
var OrgType: integer;
    //*****************************************************************************************
    procedure MakeCommonSql;
    begin
        q.Sql.Text:='select distinct id,inst,id_num,org_id,face,nal_num,svid_num,addr,phone,boss,'+
                            'org_type||'' (''||face_shortname||'')'' as org_type_name,name,par_name,anketa,'+
                            'black_here,black_list_count,svoy,name_ukr,addr_ukr ';
        if cbRekvizit.Checked then q.Sql.Add(',rach_chet,mfo,def ')
                              else q.Sql.Add(',''                    '' as rach_chet'+
                                             ',''                    '' as mfo ');

        q.Sql.Add('from (select v.*, sign(black_list_count+decode(black_here,''Y'',1,0))+decode(svoy,''Y'',2,0) as svoy_index');
        if cbRekvizit.Checked then q.Sql.Add('     from v_oil_org v) ')
        else q.Sql.Add('     from v_oil_org_norek v) Q');

        if IsPossibleAzs then
        begin
          q.Sql.Add(' ,(select ool.to_id,ool.to_inst ');
          q.Sql.Add('    from oil_org_link ool ');
          q.Sql.Add('   where ool.link_type_id = 9 and ool.state = ''Y'' ');
          q.Sql.Add('     and from_id = ov.GetVal(''INST'') ');
          q.Sql.Add('     and from_inst = ov.GetVal(''INST'') ');
          q.Sql.Add('   union all ');
          q.Sql.Add('  select 0,0 from dual )ool ');
        end;
        if PossibleInstOnly then
        begin
          q.Sql.Add(' ,(select nvl(adm.poss_inst,v.main_inst) as poss_inst');
          q.Sql.Add('  from adm_possible_inst adm, v_oil_info v');
          q.Sql.Add('  where adm.id(+)=adm.inst(+) and adm.id(+)=v.main_inst) adm');
        end;
        q.Sql.Add(' where 0=0 ');
        q.Sql.Add(' and (:FastOrgId=0 or id=inst and id=:FastOrgId)');
        q.Sql.Add(' and floor(mod(:face,power(2,face+1))/power(2,face))=1');
        q.Sql.Add(' and not (id=inst and id in (20001,20002,20003))');
        q.Sql.Add(' and invisible<>''Y'' and srep_fake<>''Y''');
        q.Sql.Add(' and (id=inst or :alfaonly=0)');
        q.Sql.Add(' and (decode(org_id,4,4,5,4,3,3,8,8,1)=:orgtype or :orgtype=0)');
        q.Sql.Add(' and (:orgname is null or lower(name) like lower(''%''||:orgname||''%''))');
        q.Sql.Add(' and (:orgid is null or to_char(id) like lower(''%''||:orgid||''%''))');
        q.Sql.Add(' and (:okpo is null or id_num like lower(''%''||:okpo||''%''))');
        q.Sql.Add(' and (:pponid=0 or pponinst=:pponid and pponid=:pponid)');
        q.Sql.Add(' and (:oblid=0 or oblinst=:oblid and oblid=:oblid)');
        q.Sql.Add(' and floor(mod(:svoy_index,power(2,svoy_index+1))/power(2,svoy_index))=1 ');
        if PossibleInstOnly then
          q.Sql.Add(' and (:possonly=0 or id=inst and instr('',''||adm.poss_inst||'','','',''||id||'','')>0) ')
        else
          q.Sql.Add(' and :possonly=:possonly ');
        if IsPossibleAzs then
          q.Sql.Add(' and ((not(:orgtype = 8) or :IsPossibleAzs=0) or ((ool.to_id = id and ool.to_inst = inst)or (ov.GetVal(''MAIN_PAR'') in (oblid,pponid))))')
        else
          q.Sql.Add(' and :IsPossibleAzs=:IsPossibleAzs ');


        if OrderField<>'' then
          begin
            q.Sql.Add('order by '+OrderField+' '+OrderDirection);
            if cbRekvizit.Checked then
              q.SQL.Add(', def desc');
          end;

        {if PossibleInstOnly then q.Sql.Add(' and id=inst and id in ('+copy(Inst_List,2,length(Inst_List)-2)+') ');
        q.Sql.Add('and sign(black_list_count+decode(black_here,''Y'',1,0))+decode(svoy,''Y'',2,0) in ('+
            GetConstructedString(['0','1','2'],[cbPr.Checked,cbBlackList.Checked,cbSvoy.Checked],',','null')+') ');}
     end;
    //*****************************************************************************************
begin
  try
    InActivateQ:=True;
    q.DisableControls;
    if Preparing then exit;
    if q.Active then q.Close;
      MakeCommonSql;
    try
      q.Prepare;
    except
      on E:Exception do begin
        showmessage(E.Message);
        ShowTextInMemo(q.Sql.Text);
        exit;
      end;
    end;
    if rbObl.Checked then
      OrgType:=4
    else if rbPpon.Checked then
      OrgType:=3
    else if rbAzs.Checked then
      OrgType:=8
    else if rbOther.Checked then
      OrgType:=1
    else
      OrgType:=0;

    OpenQueryParOraAdv(q,
      ['FastOrgId',      ftInteger,       FastOrgId,
       'face',           ftInteger,       BoolArrayToBinary([cbUrFace.Checked,cbFizFace.Checked,cbNotDefFace.Checked]),
       'alfaonly',       ftInteger,       0,
       'orgtype',        ftInteger,       OrgType,
       'orgname',        ftString,        EditOrg.Text,
       'orgid',          ftString,        EditOrgId.Text,
       'okpo',           ftString,        EditOKPO.Text,
       'pponid',         ftInteger,       PponId,
       'oblid',          ftInteger,       OblId,
       'possonly',       ftInteger,       BoolTo_(PossibleInstOnly,1,0),
       'IsPossibleAzs',  ftInteger,       BoolTo_(IsPossibleAzs,1,0),
       'svoy_index',     ftInteger,       BoolArrayToBinary([cbPr.Checked,cbBlackList.Checked,cbSvoy.Checked])]);
  finally
    q.EnableControls;
    InActivateQ:=False;
  end;
end;

procedure TChooseOrgForm.bbSearchClick(Sender: TObject);
begin
     ActivateQ;
end;

procedure TChooseOrgForm.BtnClearOblClick(Sender: TObject);
begin
    CEObl.Text:='';
    OblId:=0;
    ActivateQ;
end;

procedure TChooseOrgForm.btnClearOrgClick(Sender: TObject);
begin
     EditOrg.Text:='';
end;

procedure TChooseOrgForm.EditOrgChange(Sender: TObject);
begin
  TimerActivate;
end;

procedure TChooseOrgForm.EditParentChange(Sender: TObject);
begin
  ActivateQ;
end;

procedure TChooseOrgForm.RGOrgTypeClick(Sender: TObject);
begin
  ActivateQ;
end;

procedure TChooseOrgForm.FormShow(Sender: TObject);

     procedure SetColumnWidths(w:array of integer);
     var i:integer;
     begin
          for i:=0 to DBGrid1.Columns.Count-1 do
              DBGrid1.Columns[i].Width:=w[i];
     end;

begin
  SetColumnWidths([150,60,95,150,60,60,60,60,60,60,100,60,60,100,100]);
  LoadKeyBoardLayout('00000419',KLF_ACTIVATE);
  EditOrg.SetFocus;
end;

procedure TChooseOrgForm.SpeedButton6Click(Sender: TObject);
begin
     ActivateQ('t');
end;

procedure TChooseOrgForm.SpeedButton4Click(Sender: TObject);
begin
     ActivateQ('o');
end;

procedure TChooseOrgForm.SpeedButton5Click(Sender: TObject);
begin
     ActivateQ('p');
end;

procedure TChooseOrgForm.DBGrid2DblClick(Sender: TObject);
begin
     if Close_On_DblClick then
        ModalResult:=mrOk
     else
        btnEdit.OnClick(Sender); 
end;

function TChooseOrgForm.ApplyArgs(myorgtype,OrgId,OrgInst:integer;EnabledFlags:string):Boolean;

    function yn(c:char):Boolean;
    begin
         if c='y' then result:=TRUE
                  else result:=FALSE;
    end;

    procedure ApplyOrgTypes(s:string);
    begin
         RBObl.Enabled:=yn(s[1]);
         RBPpon.Enabled:=yn(s[2]);
         RBAzs.Enabled:=yn(s[3]);
         RBOther.Enabled:=yn(s[4]);
         RBAll.Enabled:=yn(s[5]);
    end;

begin
     Preparing:=TRUE;
     if EnabledFlags[length(EnabledFlags)] in ['R','r'] then
     begin
        CBRekvizit.Checked:=TRUE;
        SetLength(EnabledFlags,length(EnabledFlags)-1);
     end;

     //Фильтр обл
     CEObl.Enabled:=EnabledFlags[1]in ['y','x'];
     btnClearObl.Enabled:=EnabledFlags[1] in ['y','x'];
     IsPossibleAzs := EnabledFlags[1]='x';
     //Фильтр ППОН
     CEPpon.Enabled:=EnabledFlags[2]='y';
     btnClearPPON.Enabled:=EnabledFlags[2]='y';

     PossibleInstOnly:=EnabledFlags[3]='x';
     if EnabledFlags[3]='x' then
       ApplyOrgTypes('yynnn')
     else if EnabledFlags[3]='n' then
       ApplyOrgTypes('nnnnn')
     else
       case length(EnabledFlags) of
         3:ApplyOrgTypes('yyyyy');
       else
         ApplyOrgTypes(copy(EnabledFlags,4,5));
       end;

     if (myorgtype>4) or (myorgtype<0) then
     begin
          showmessage(TranslateText('Функция ChooseOrg.ApplyArgs: неправильный аргумент myorgtype = ')+IntToStr(myorgtype));
          result:=FALSE;
          exit;
     end;
     case myorgtype of
          0:RBObl.Checked:=TRUE;
          1:RBPpon.Checked:=TRUE;
          2:RBAzs.Checked:=TRUE;
          3:RBOther.Checked:=TRUE;
          4:RBAll.Checked:=TRUE;
     end;
     if (OrgId<>0) and (OrgInst<>0) then
     begin
         OblId:=GetOblId(OrgId,OrgInst);
         CEObl.Text:=GetOrgName(OblId,OblId);
         if GetOrgType(OrgId,OrgInst)=3 then
         begin
              PponId:=OrgId;
              CEPpon.Text:=GetOrgName(OrgId,OrgInst);
         end;
     end;
     Preparing:=FALSE;
     ActivateQ;
     result:=TRUE;
end;
//-------------------------------------------------------------------------------------------------
procedure ShowOrgGuide(myorgtype,OrgId,OrgInst:integer;EnabledFlags:string);
// EnabledFlags - строка типа 'yyn'.
// Первая позиция - обл, вторая - ппон, третья - переключатель тип организации, червертая - внесенные здесь
// y - enabled, n - disabled
var CH:TChooseOrgForm;
begin
     Preparing:=TRUE;
     CH:=TChooseOrgForm.Create(Application);
     Application.CreateForm(TChooseOrgForm,CH);
     CH.Close_On_DblClick:=FALSE;
     CH.bbOk.Enabled:=FALSE;
     if not CH.ApplyArgs(myorgtype,OrgId,OrgInst,EnabledFlags) then begin
          CH.Free;
          exit;
     end;
     CH.FormStyle := fsMDIChild;
     //CH.ShowModal;
end;
//-------------------------------------------------------------------------------------------------
function CaptureOrg(myorgtype,OrgId,OrgInst:integer;EnabledFlags:string;var ResId,ResInst:integer;var ResName:string):Boolean;
// EnabledFlags - строка типа 'yyn'.
// Первая позиция - обл, вторая - ппон, третья - переключатель тип организации, червертая - внесенные здесь
// y - enabled, n - disabled
var CH:TChooseOrgForm;
begin
     Preparing:=TRUE;
     Application.CreateForm(TChooseOrgForm,CH);
     CH.Close_On_DblClick:=TRUE;

     if not CH.ApplyArgs(myorgtype,OrgId,OrgInst,EnabledFlags) then
     begin
          CH.Free;
          result:=FALSE;
          exit;
     end;
     if (CH.ShowModal=mrOk) and (CH.Q.RecordCount <> 0) then
     begin
          ResId:=CH.Q.FieldByName('id').AsInteger;
          ResInst:=CH.Q.FieldByName('inst').AsInteger;
          ResName:=CH.Q.FieldByName('name').AsString;
          result:=TRUE;
     end
     else result:=FALSE;
     //CH.Free;
end;
//-------------------------------------------------------------------------------------------------
function CaptureOrgT(myorgtype,OrgId,OrgInst:integer;EnabledFlags:string;var ResId,ResInst:integer;var ResName:string;var ResType:integer):Boolean;
// EnabledFlags - строка типа 'yyn'.
// Первая позиция - обл, вторая - ппон, третья - переключатель тип организации
// y - enabled, n - disabled
var CH:TChooseOrgForm;
begin
     Preparing:=TRUE;
     Application.CreateForm(TChooseOrgForm,CH);
     CH.Close_On_DblClick:=TRUE;

     if not CH.ApplyArgs(myorgtype,OrgId,OrgInst,EnabledFlags) then
     begin
          CH.Free;
          result:=FALSE;
          exit;
     end;
     if (CH.ShowModal=mrOk) and (CH.Q.RecordCount <> 0) then
     begin
          ResId:=CH.Q.FieldByName('id').AsInteger;
          ResInst:=CH.Q.FieldByName('inst').AsInteger;
          ResName:=CH.Q.FieldByName('name').AsString;
          ResType:=CH.Q.FieldByName('org_id').AsInteger;
          result:=TRUE;
     end
     else result:=FALSE;
     //CH.Free;
end;
//-------------------------------------------------------------------------------------------------
function CaptureOrgRekvizit(myorgtype,OrgId,OrgInst:integer;EnabledFlags:string;var ResId,ResInst:integer;var ResName,ResRach_Chet,ResMFO:string):Boolean;
// EnabledFlags - строка типа 'yyn'.
// Первая позиция - обл, вторая - ппон, третья - переключатель тип организации, червертая - внесенные здесь
// y - enabled, n - disabled
var CH:TChooseOrgForm;
    qRek: TOilQuery;
begin
     Preparing:=TRUE;
     Application.CreateForm(TChooseOrgForm,CH);
     CH.Close_On_DblClick:=TRUE;

     if not CH.ApplyArgs(myorgtype,OrgId,OrgInst,EnabledFlags) then
     begin
          CH.Free;
          result:=FALSE;
          exit;
     end;
     if (CH.ShowModal=mrOk) and (CH.Q.RecordCount <> 0) then
     begin
          ResId:=CH.Q.FieldByName('id').AsInteger;
          ResInst:=CH.Q.FieldByName('inst').AsInteger;
          ResName:=CH.Q.FieldByName('name').AsString;
          if CH.CBRekvizit.Checked then
          begin
               ResRach_Chet:=CH.Q.FieldByName('rach_chet').AsString;
               ResMFO:=CH.Q.FieldByName('mfo').AsString;
          end
          else
          begin
               qRek:=TOilQuery.Create(nil);
               qRek.Sql.Text:=
                  ' select rek.rach_chet,bank.mfo from oil_org_rekvizit rek,oil_bank bank '+
                  ' where rek.id_org='+IntToStr(ResId)+' and rek.inst='+IntToStr(ResInst)+
                  '       and rek.state=''Y'' '+
                  '       and rek.id_bank=bank.id and rek.bank_inst=bank.inst '+
                  ' order by def desc ';
               _OpenQuery(qRek);
               if qRek.RecordCount=0 then
               begin
                  ResRach_Chet:='';
                  ResMFO:='';
               end
               else
               begin
                  ResRach_Chet:=qRek.FieldByName('rach_chet').AsString;
                  ResMFO:=qRek.FieldByName('mfo').AsString;
               end;
          end;
          result:=TRUE;
     end else result:=FALSE;
     //CH.Free;
end;
//-------------------------------------------------------------------------------------------------
function CaptureOrgExt(myorgtype,OrgId,OrgInst:integer;EnabledFlags:string;var ResId,ResInst:integer;var ResName:string;var Q:TOilQuery):Boolean;
var Rach_Chet,MFO:string;
begin
     Preparing:=TRUE;
     if CaptureOrgRekvizit(myorgtype,OrgId,OrgInst,EnabledFlags,ResId,ResInst,ResName,Rach_Chet,MFO) then begin
          Q:=TOilQuery.Create(nil);
          Q.SQL.Text:='select * from v_oil_org where id='+IntToStr(ResId)+' and inst='+IntToStr(ResInst);
          if (Rach_Chet<>'') then
             Q.Sql.Add(' and rach_chet='''+Rach_Chet+''' ');
          if (MFO<>'') then
             Q.Sql.Add(' and mfo='''+MFO+''' ');
          Q.Sql.Add(' order by def desc');
          try
             Q.Open;
          except
             ShowMessage(TranslateText('Функция ExFunc.CaptureOrgExt: не могу открыть Q'));
          end;
          if q.RecordCount=0 then
            raise Exception.Create(TranslateText('Функция ExFunc.CaptureOrgExt: Из Q выбрано ноль записей!'));
          result:=TRUE;
     end else result:=FALSE;
end;
//-------------------------------------------------------------------------------------------------
function CaptureOrgQ(myorgtype,OrgId,OrgInst:integer;EnabledFlags:string;var Q:TOilQuery):Boolean;
var ResName:string;
    ResId,ResInst:integer;
begin
  Result:= CaptureOrgExt(myorgtype,OrgId,OrgInst,EnabledFlags,ResId,ResInst,ResName,Q);
end;
//-------------------------------------------------------------------------------------------------

procedure TChooseOrgForm.btnClearPponClick(Sender: TObject);
begin
     CEPpon.Text:='';
     PponId:=0;
     ActivateQ;
end;

procedure TChooseOrgForm.CEOblButtonClick(Sender: TObject);
var s:string;
begin
     if CaptureOrg(0,0,0,'nnn',OblId,OblId,s) then begin
        CEObl.Text:=s;
        ActivateQ;
     end;
end;

procedure TChooseOrgForm.FormCreate(Sender: TObject);
begin
  inherited;
  InActivateQ := False;
  OblId := 0;
  PponId := 0;
  FastOrgId := 0;
  OrderField := 'name';
  OrderDirection := ' ';
  if LAUNCH_MODE = 'PLANECO' then
    CBRekvizit.Visible := FALSE;
  miMainOrg.Caption := MAIN_ORG.NAME;
  miMainOrg.Tag := MAIN_ORG.INST;
  miOldOrg.Visible := MAIN_ORG.INST<>INST_OLD;
  miOldOrg.Caption := GetOrgName(INST_OLD,INST_OLD);
  miOldOrg.Tag := INST_OLD;

  miAlfaNafta.Visible := (GENERATION = 1) or (GENERATION = 0);
  miNKAlfaNafta.Visible := (GENERATION = 1) or (GENERATION = 0);

  LoadGrigColumns( DBGrid1,ClassName );
  sbColClick(nil);
end;

procedure TChooseOrgForm.CEPponButtonClick(Sender: TObject);
var s:string;
begin
     if CaptureOrg(1,OblId,OblId,'nnn',PponId,PponId,s) then
     begin
        CEPpon.Text:=s;
        OblId:=GetOblId(PponId,PponId);
        CEObl.Text:=GetOrgName(OblId,OblId);
        ActivateQ;
     end;
end;

procedure TChooseOrgForm.btnClearIdClick(Sender: TObject);
begin
     EditOrgId.Text:='';
     ActivateQ;
end;

procedure TChooseOrgForm.CalcOrgIdChange(Sender: TObject);
begin
     ActivateQ;
end;

procedure TChooseOrgForm.CalcParentIdChange(Sender: TObject);
begin
    ActivateQ;
end;

procedure TChooseOrgForm.EditOrgKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=chr(13) then ModalResult:=mrOk;
end;

procedure TChooseOrgForm.CalcOrgIdKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=chr(13) then ModalResult:=mrOk;
end;

procedure TChooseOrgForm.EditParentKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key=chr(13) then ModalResult:=mrOk;
end;

procedure TChooseOrgForm.CalcParentIdKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=chr(13) then ModalResult:=mrOk;
end;

procedure TChooseOrgForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key=chr(13) then ModalResult:=mrOk;
end;

procedure TChooseOrgForm.DBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
     if Key=chr(13) then ModalResult:=mrOk;
end;

procedure TChooseOrgForm.CalcOkpoChange(Sender: TObject);
begin
     ActivateQ;
end;

procedure TChooseOrgForm.btnClearOKPOClick(Sender: TObject);
begin
    EditOkpo.Text:='';
    ActivateQ;
end;

procedure TChooseOrgForm.EditOrgIdChange(Sender: TObject);
begin
  TimerActivate;
  //   ActivateQ;
end;

procedure TChooseOrgForm.EditOkpoChange(Sender: TObject);
begin
  TimerActivate;
  //  ActivateQ;
end;

procedure TChooseOrgForm.CBRekvizitClick(Sender: TObject);
begin
     ActivateQ;
end;

procedure TChooseOrgForm.btnEditClick(Sender: TObject);
Var  res:TModalResult;
     UrFiz,n:integer;
     s:string;
     BM:TBookMark;
begin
   //CurrentRow:=DBGrid1.Row;
   BM:=q.GetBookmark;
   if q.RecordCount=0 then exit;
   UrFiz:=q.FieldByName('face').AsInteger;
   if UrFiz<>1 then UrFiz:=0;
   if UrFiz=0 then
        res:=EditUrFace(q.FieldByName('id').AsInteger,q.FieldByName('inst').AsInteger)
   else res:=EditFizFace(q.FieldByName('id').AsInteger,q.FieldByName('inst').AsInteger,s);
   n:=0;

   while res=mrRetry do begin
      UrFiz:=1-UrFiz; inc(n);
      if (n>4) then showmessage(TranslateText('Жуткая ошибка!!! Срочно позвоните в Альфа-Нафту Юрию Должикову!!!'));
      if UrFiz=0 then begin
          showmessage(TranslateText('Внимание! Вся информация, введенная по этой организации как по физическому лицу будет потеряна. Отменить эту операцию вы можете, нажав кнопку "Отменить".'));
          res:=EditUrFace(q.FieldByName('id').AsInteger,q.FieldByName('inst').AsInteger);
      end else begin
          showmessage(TranslateText('Внимание! Вся информация, введенная по этой организации как по юридическому лицу будет потеряна. Отменить эту операцию вы можете, нажав кнопку "Отменить".'));
          res:=EditFizFace(q.FieldByName('id').AsInteger,q.FieldByName('inst').AsInteger,s);
      end;
   end;
   if res=mrOk then ActivateQ;
   //q.MoveBy(CurrentRow-1);
   try q.GotoBookmark(BM) except end;
   q.FreeBookmark(BM);
end;

procedure TChooseOrgForm.btnDelClick(Sender: TObject);
begin
 if q.FieldByName('id').asInteger = q.FieldByName('inst').asInteger then
 begin
   messagedlg(TranslateText('Эта организация необходима для работы OILExchange. Ее нельзя удалять'),
    mtError, [mbOk], 0);
   exit;
 end;
 with CanDeleteQuery do
 begin
      if Active then Close;
      ParamByName('id').Value:=q.FieldByName('id').AsInteger;
      ParamByName('inst').Value:=q.FieldByName('inst').AsInteger;
      Open;
 end;
 if CanDeleteQuery.FieldByName('co').Value > 0 then
 begin
   messagedlg(TranslateText('Эту организацию удалить невозможно. К ней привязаны операции. Удалите сначала их.'),
    mtError, [mbOk], 0);
   CanDeleteQuery.Close;
   Exit;
 end
 else
 if messagedlg(TranslateText('Вы действительно хотите удалить эту запись?'),
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
  try
   StartSQL;
   q2.sql.text:='update oil_org set state = ''N'' where id='+q.fieldbyname('id').asstring+' and inst='+q.fieldbyname('inst').asstring+' and state=''Y''';
   q2.execsql;
   CommitSQL;
   Except On E:Exception Do
    begin
     MessageDlg(TranslateText('Ошибка : С данной организацией проводились операции !'),mtError,[mbOk],0);
    end;
   End;
  end;
  CanDeleteQuery.Close;
  q.close;
  q.open;
end;

procedure TChooseOrgForm.N1Click(Sender: TObject);
Var s:string;
begin
    if AddUrFace(s)=mrOk then begin
       EditOrg.Text:=s;
       ActivateQ;
    end;
end;

procedure TChooseOrgForm.N2Click(Sender: TObject);
var s:string;
begin
     if EditFizFace(0,0,s)=mrOk then begin
        EditOrg.Text:=s;
        ActivateQ;
     end;
end;

procedure TChooseOrgForm.CBUrFaceClick(Sender: TObject);
begin
     ActivateQ;
end;

procedure TChooseOrgForm.CBFizFaceClick(Sender: TObject);
begin
     ActivateQ;
end;

procedure TChooseOrgForm.CBNotDefFaceClick(Sender: TObject);
begin
     ActivateQ;
end;

procedure TChooseOrgForm.RBAllClick(Sender: TObject);
begin
     ActivateQ;
end;

procedure TChooseOrgForm.RBOblClick(Sender: TObject);
begin
     ActivateQ;
end;

procedure TChooseOrgForm.RBPponClick(Sender: TObject);
begin
     ActivateQ;
end;

procedure TChooseOrgForm.RBAzsClick(Sender: TObject);
begin
     ActivateQ;
end;

procedure TChooseOrgForm.RBOtherClick(Sender: TObject);
begin
     ActivateQ;
end;

procedure TChooseOrgForm.N3Click(Sender: TObject);
begin
    DBGrid1.Columns[1].Visible:=FALSE;
    try PutGridEhToExcel(DBGrid1,TranslateText('Справочник организаций'));
    finally
       DBGrid1.Columns[1].Visible:=TRUE;
    end;
end;

procedure TChooseOrgForm.CBAlfaOnlyClick(Sender: TObject);
begin
     ActivateQ;
end;

procedure TChooseOrgForm.DBGrid1DblClick(Sender: TObject);
begin
     if Close_On_DblClick then bbOkClick(Sender)
                          else btnEditClick(nil);
end;

procedure TChooseOrgForm.DBGrid1SortMarkingChanged(Sender: TObject);
var i :Integer;
begin
    with DBGrid1 do
         for i := 0 to SortMarkedColumns.Count-1 do
             if SortMarkedColumns[i].Title.SortMarker = smDownEh then begin
                OrderField:= SortMarkedColumns[i].FieldName;
                OrderDirection:='';
                break;
             end else if SortMarkedColumns[i].Title.SortMarker = smUpEh then begin
                OrderField:= SortMarkedColumns[i].FieldName;
                OrderDirection:='DESC';
                break;
             end;
    ActivateQ;
end;

procedure TChooseOrgForm.QOldCalcFields(DataSet: TDataSet);
var anketa:string;
begin
     anketa:=q.FieldByName('anketa').AsString;
     if length(anketa)<>14 then anketa:=DEFAULT_ANKETA;
     q.FieldByName('kategory').AsString:=GetOrgKategory(anketa);
end;

procedure TChooseOrgForm.Button2Click(Sender: TObject);
var anketa:string;
    qq:TOilQuery;
begin
     if q.RecordCount=0 then exit;
     anketa:=q.FieldByName('anketa').AsString;
     if MakeAnketing(q.FieldByName('name').AsString,1,anketa,anketa) then
        if anketa<>q.FieldByName('anketa').AsString then begin
           qq:=TOilQuery.Create(nil);
           qq.Sql.Text:='update oil_org set anketa='''+anketa+''' '+
                       'where id='+q.FieldByName('id').AsString+' and inst='+q.FieldByName('inst').AsString;
           try qq.ExecSQL;
           finally qq.Destroy;
           end;
           ActivateQ;
        end;
end;

procedure TChooseOrgForm.qCalcFields(DataSet: TDataSet);
var anketa:string;
begin
     anketa:=q.FieldByName('anketa').AsString;
     if length(anketa)<>14 then anketa:=DEFAULT_ANKETA;
     q.FieldByName('kategory').AsString:=GetOrgKategory(anketa);
end;

procedure TChooseOrgForm.p2DblClick(Sender: TObject);
begin
     ShowTextInMemo(FullSqlTextOra(q));
end;

procedure TChooseOrgForm.bbCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TChooseOrgForm.DBGrid1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
    if (q.FieldByName('black_here').AsString='Y') or (q.FieldByName('black_list_count').AsInteger>0) then begin
       //AFont.Style:=AFont.Style+[fsItalic];
       BackGround:=clSilver;
       AFont.Color:=clRed;
    end;
    if q.FieldByName('svoy').AsString='Y' then
       AFont.Color:=clGreen;
end;

procedure TChooseOrgForm.bbOkClick(Sender: TObject);
begin
    if (q.FieldByName('black_here').AsString='Y') or (q.FieldByName('black_list_count').AsInteger>0) then
        if  MessageDlg(TranslateText('Внимание!!! Этот клиент занесен в черный список!')+#13#10+
                      TranslateText('С таким клиентом вы должны работать только по предоплате!')+#13#10+
                      TranslateText('Продолжить?'),mtWarning,[mbYes,mbNo],0)<>mrYes then exit;
    ModalResult:=mrOk;
end;

procedure TChooseOrgForm.miAlfaNaftaClick(Sender: TObject);
begin
    FastOrgId:=(Sender as TMenuItem).Tag;
    FastOrgInst:=FastOrgId;
    ClearFilters;
    ActivateQ;
    if q.RecordCount=0 then begin
       MessageDlg(TranslateText('Не найдено организации c id=')+IntToStr(FastOrgId)+'!',mtError,[mbOk],0);
       FastOrgId:=0; FastOrgInst:=0;
    end else
       ModalResult:=mrOk;
end;

procedure TChooseOrgForm.ClearFilters;
begin
  btnClearObl.Click;
  btnClearPpon.Click;
  btnClearOrg.Click;
  btnClearId.Click;
  btnClearOKPO.Click;
  rbAll.Checked:=true;
  cbFizFace.Checked:=true;
  cbUrFace.Checked:=true;
  cbNotDefFace.Checked:=true;
  cbBlackList.Checked:=true;
  cbSvoy.Checked:=true;
  cbPr.Checked:=true;
end;

procedure TChooseOrgForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Сохранение колонок
  if not IsColConfCleared then
    SaveGridColumns( DBGrid1, ClassName );
  Action := caFree;
end;

procedure TChooseOrgForm.TimerActivateQTimer(Sender: TObject);
begin
  inherited;
  ActivateQ;
  TimerActivateQ.Enabled:=False;
end;

procedure TChooseOrgForm.TimerActivate;
begin
  if not InActivateQ then
  begin
    TimerActivateQ.Enabled:=False;
    TimerActivateQ.Enabled:=True;
  end;
end;

procedure TChooseOrgForm.miDuplicateOrgClick(Sender: TObject);
begin
  if (q.FieldByName('id').AsInteger <> q.FieldByName('inst').AsInteger) and (q.FieldByName('inst').AsInteger = INST) then
  begin
    if not TestPassword(pwtOrg) then Exit;
    try
      StartSQLOra;
      _ExecProc('OILT.DUPLICATEORG',
        ['p_orgid',   q.FieldByName('id').AsInteger,
         'p_orginst', q.FieldByName('inst').AsInteger]);
      CommitSqlOra;
      MessageDlg(TranslateText('Организация '+ q.FieldByName('name').AsString +' продублирована.'),
        mtInformation, [mbOk], 0);
      EditOrg.Text := q.FieldByName('name').AsString;
    except on E: Exception do
      begin
        MessageDlg(TranslateText('Ошибка: ')+ E.Message +'.', mtError, [mbOk], 0);
        RollbackSql;
        exit;
      end;
    end;
  end
  else
    MessageDlg(TranslateText('Дублировать можно только своих клиентов!'), mtError, [mbOk], 0);
end;

procedure TChooseOrgForm.sbFilterPositionClick(Sender: TObject);
begin
  inherited;
  if sbFilterPosition.Down then
  begin
    p9.AutoSize:=False;
    p9.Height := 0;
  end
  else
    p9.AutoSize:=True;
end;

procedure TChooseOrgForm.sbColClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  if not sbCol.Down then
    PanelCol.Width := 0
  else
  Begin
    PanelCol.Width := 150;
    cbCol.Items.Clear;
    For i:=0 to DBGrid1.Columns.Count-1 do
    Begin
      cbCol.Items.Add(DBGrid1.Columns[i].Title.Caption);
      if DBGrid1.Columns[i].Visible then
        cbCol.Checked[i]:=TRUE
      else
        cbCol.Checked[i]:=FALSE;
    end;
  End;
end;

procedure TChooseOrgForm.spbSelectAllClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  for i:=0 to cbCol.Items.count-1 do
  Begin
    DBGrid1.Columns[i].Visible:=TRUE;
    cbCol.Checked[i]:=TRUE;
  end;
end;

procedure TChooseOrgForm.spbCloseTunePanelClick(Sender: TObject);
begin
  inherited;
  sbCol.Down := false;
  sbColClick(nil);
end;

procedure TChooseOrgForm.spbClearColConfigClick(Sender: TObject);
begin
  inherited;
  ClearGridColumns(ClassName);
  if not IsColConfCleared then
    ShowMessage(TranslateText('Перезапустите справочник, чтобы изменения вступили в силу.'));
  IsColConfCleared := True;
end;

procedure TChooseOrgForm.DBGrid1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  inherited;
  sbColClick(nil);
end;

procedure TChooseOrgForm.cbColClickCheck(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to cbCol.Items.count-1 do
    DBGrid1.Columns[i].Visible:=cbCol.Checked[i];
end;

end.
