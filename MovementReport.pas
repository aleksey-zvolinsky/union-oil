unit MovementReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, Buttons, RxLookup, ExtCtrls, Db,
  DBTables, uCommonForm,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess
  {$IFDEF VER150},Variants{$ENDIF};

type
  TMovementReportForm = class(TCommonForm)
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    CBPartAll: TCheckBox;
    LENp: TRxLookupEdit;
    CBNpAll: TCheckBox;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    CEFrom: TComboEdit;
    CMBPart: TComboEdit;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DSNp: TOraDataSource;
    QNp: TOilQuery;
    QNpID: TFloatField;
    QNpNAME: TStringField;
    Q: TOilQuery;
    Q1: TOilQuery;
    QDOG: TStringField;
    QDOG_SER: TStringField;
    QDOG_DATE: TDateTimeField;
    QORG_NAME: TStringField;
    QNP_TYPE: TStringField;
    QSS: TFloatField;
    QNB_REST_TONN: TFloatField;
    QAZS_REST_TONN: TFloatField;
    QVSEGO_REST_TONN: TFloatField;
    QVSEGO_REST_SELL_MONEY: TFloatField;
    QVSEGO_REST_UCH_MONEY: TFloatField;
    QNB_PRIH_TONN: TFloatField;
    QAZS_PRIH_TONN: TFloatField;
    QVSEGO_PRIH_TONN: TFloatField;
    QVSEGO_PRIH_SELL_MONEY: TFloatField;
    QVSEGO_PRIH_UCH_MONEY: TFloatField;
    QNB_RASH_TONN: TFloatField;
    QAZS_RASH_TONN: TFloatField;
    QVSEGO_RASH_TONN: TFloatField;
    QVSEGO_RASH_SELL_MONEY: TFloatField;
    QVSEGO_RASH_UCH_MONEY: TFloatField;
    QNB_END_TONN: TFloatField;
    QAZS_END_TONN: TFloatField;
    QVSEGO_END_TONN: TFloatField;
    QVSEGO_END_SELL_MONEY: TFloatField;
    QVSEGO_END_UCH_MONEY: TFloatField;
    CB1: TCheckBox;
    cb2: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CEFromButtonClick(Sender: TObject);
    procedure MakeReport(Date1,Date2:TDateTime;OrgId,OrgInst,OrgType,PartId,PartInst,NPid:integer);
    procedure MakeReport1(Date1,Date2:TDateTime;OrgId,OrgInst,OrgType,PartId,PartInst,NPid:integer;AZSMovement:Boolean);
    procedure CMBPartButtonClick(Sender: TObject);
    procedure CBNpAllClick(Sender: TObject);
    procedure CBPartAllClick(Sender: TObject);
    procedure LENpButtonClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
     Tip:string;
    { Public declarations }

  end;

var
  MovementReportForm: TMovementReportForm;

implementation

uses Main,UDbFunc,ChooseOrg,PartRef,ExFunc,Progr,ExcelFunc;

var OrgId,OrgInst,OrgType,PartId,PartInst:integer;
    OldPart,SQLOld,SQLOld1:string;

{$R *.DFM}

procedure TMovementReportForm.FormCreate(Sender: TObject);
begin
inherited;
     SqlOld:=Q.Sql.Text;
     SQLOld1:=Q1.Sql.Text;
     Tip:='Barter';
     OrgId:=MAIN_ID;OrgInst:=INST;
     CEFrom.Text:=GetOrgName(OrgId,OrgInst);
     OrgType:=GetOrgType(OrgId,OrgInst);
     PartId:=0;
     PartInst:=0;
     SetCurrentMonth(DateEdit1,DateEdit2);
end;

procedure TMovementReportForm.MakeReport(Date1,Date2:TDateTime;OrgId,OrgInst,OrgType,PartId,PartInst,NPid:integer);
var Pr:TProgrForm;

    procedure ActivateQ;
    var s:string;
    begin
         s:=' where ';
         case OrgType of
              3: s:=s+'org_id='+IntToStr(OrgId)+' and org_inst='+IntToStr(OrgInst);
              4: s:=s+'(org_id='+IntToStr(OrgId)+' and org_inst='+IntToStr(OrgInst)+
                      ' or par_id='+IntToStr(OrgId)+' and par_inst='+IntToStr(OrgInst)+')';
         end;
         if PartId+PartInst>0 then
            s:=s+' and part_id='+IntToStr(PartId)+' and part_inst='+IntToStr(PartInst)
         else
            s:=s+' and (dog like ''ОБ%'' or dog like ''ОВ%'') ';

         if NPId<>0 then s:=s+' and np_group_id='+IntToStr(NPid);

         s:=s+' order by dog,org_name';

         if Q.Active then Q.Close;
         Q.Sql.Text:=SqlOld+s;
         Q.ParamByName('begin_date').AsDateTime:=Date1;
         Q.ParamByName('end_date').AsDateTime:=Date2;
         //ShowTextInMemo(FullSqlText(Q));
         _OpenQuery(Q);
    end;

    procedure MakeHead;
    var s,values:string;
    begin
         if Date1=Date2 then s:=TranslateText('за ')+DateToStr(Date1)
         else s:=TranslateText('от ')+DateToStr(Date1)+TranslateText(' до ')+DateToStr(Date2);
         values:=''''+s+'''';

         case OrgType of
              3:s:=GetOrgName(OrgId,OrgInst);
              4:s:=GetOrgName(OrgId,OrgInst)+TranslateText(' и все филиалы ');
         end;
         values:=values+','''+s+'''';
         values:=values+','''+GetTitle+'''';
       if not DBFunc.TempExTable.Active then DBFunc.TempExTable.Open;
    end;


begin
     ActivateProgressBar(Pr,TRUE);
     try
     ActivateQ;
     if Q.RecordCount=0 then
     begin
          Pr.Free;
          showmessage(TranslateText('Ничего нет'));
          exit;
     end;
     SetProgressBar(50,Pr);
     MakeHead;
     Pr.Free;
     except
           Pr.Free;
     end;
end;

procedure TMovementReportForm.MakeReport1(Date1,Date2:TDateTime;OrgId,OrgInst,OrgType,PartId,PartInst,NPid:integer;AZSMovement:Boolean);
var Pr:TProgrForm;
    XLApp,List: Variant;
    Fields: string;

    procedure ActivateQ;
    var s:string;
    begin
         case OrgType of
              3: s:=' and PponId='+IntToStr(OrgId)+' ';
              4: s:=' and  OblId='+IntToStr(OrgId)+' ';
         end;
         if PartId+PartInst>0 then
            s:=s+' and partid='+IntToStr(PartId)+' and partinst='+IntToStr(PartInst);

         if NPId<>0 then s:=s+' and np_group_id='+IntToStr(NPid);

         if Q1.Active then Q1.Close;
         Q1.Sql.Text:=SqlOld1+s;
         Q1.Sql.Add('group by Org_Name,PponId,OblId,Dog,Dog_Date,partid,partinst,np_group,np_group_id,ss ');
         Q1.Sql.Add('having (sum(rash_tonn)<>0 or sum(rash_shtuki)<>0 or sum(prihod_tonn)<>0 or sum(prihod_shtuki)<>0 '+
                            'or sum(rest_shtuki)<>0 or sum(rest_tonn)<>0) ');
         Q1.Sql.Add('order by np_group,org_name,dog ');
         Q1.ParamByName('begindate').Value:=Date1;
         Q1.ParamByName('enddate').Value:=Date2;
         if not AzsMovement then Q1.ParamByName('NotInsideNbAzs').AsString:='Y'
                            else Q1.ParamByName('NotInsideNbAzs').Value:=null;
         if cb2.Checked then Q1.ParamByName('InsideReal').AsString:='Q'
                        else Q1.ParamByName('InsideReal').AsString:='Y';
         //ShowTextInMemo(FullSqlText(Q1));
         _OpenQuery(Q1);
    end;

    procedure MakeHead;
    var s:string;
    begin
         if Date1=Date2 then s:=TranslateText('за ')+DateToStr(Date1)
         else s:=TranslateText('от ')+DateToStr(Date1)+TranslateText(' до ')+DateToStr(Date2);
         List.Cells[3,'C']:=s;

         case OrgType of
              3:s:=GetOrgName(OrgId,OrgInst);
              4:s:=GetOrgName(OrgId,OrgInst)+TranslateText(' и все филиалы ');
         end;
         List.Cells[4,'C']:=s;
         PutTitle(List);

         if AzsMovement then s:=TranslateText('(с учетом отпусков на АЗС и возвратов)')
                        else s:=TranslateText('(без учета отпусков на АЗС и возвратов)');
         List.Cells[5,'B']:=s;
    end;

begin
     ActivateProgressBar(Pr,TRUE);
  try
     ActivateQ;
     if (Q1.RecordCount=0) then
     begin
          Pr.Free;
          if INTERACTIVE_LAUNCH_MODE then showmessage(TranslateText('Ничего нет'));
          exit;
     end;
     SetProgressBar(40,Pr);
     ActivateXLApp('MoveOwnNBAzs','MoveOwnNBAzs',1,XLApp,List);
     SetProgressBar(45,Pr);
     MakeHead;
     SetProgressBar(50,Pr);
     Fields:='np_group%1;org_name%2;dog;dog_date;ss;'+
             'rest_shtuki+=?;rest_tonn+=;rest_money+=;'+
             'prc_shtuki+=?;prc_tonn+=;prc_money+=;'+
             'pri_shtuki+=?;pri_tonn+=;pri_money+=;'+
             'prih_shtuki+=?;prih_tonn+=;prih_money+=;'+
             'nal_shtuki+=?;nal_tonn+=;nal_money+=;'+
             'bnal_shtuki+=?;bnal_tonn+=;bnal_money+=;'+
             'rcard_shtuki+=?;rcard_tonn+=;rcard_money+=;'+
                            'rto_tonn+=;rto_money+=;'+
             'roc_shtuki+=?;roc_tonn+=;roc_money+=;'+
             'legk_shtuki+=?;legk_tonn+=;legk_money+=;'+
             'gruz_shtuki+=?;gruz_tonn+=;gruz_money+=;'+
             'roo_shtuki+=?;roo_tonn+=;roo_money+=;'+
             'obor_shtuki+=?;obor_tonn+=;obor_money+=;'+
             'rov_shtuki+=?;rov_tonn+=;rov_money+=;'+
             'rob_shtuki+=?;rob_tonn+=;rob_money+=;'+
             'rop_shtuki+=?;rop_tonn+=;rop_money+=;'+
             'roz_shtuki+=?;roz_tonn+=;roz_money+=;'+
             'ron_shtuki+=?;ron_tonn+=;ron_money+=;'+
             'roe_shtuki+=?;roe_tonn+=;roe_money+=;'+
             'roi_shtuki+=?;roi_tonn+=;roi_money+=;'+
             'rpr_shtuki+=?;rpr_tonn+=;rpr_money+=;'+
             'rash_shtuki+=?;rash_tonn+=;rash_money+=;'+
             'rest_end_shtuki+=?;rest_end_tonn+=;rest_end_money+=;';
     PuTOilQueryToExcel(XLApp,List,Q1,0,12,Pr,50,100,Fields,'',FALSE,TRUE);
     SaveReport(XLApp,TranslateText('СобстНБ_АЗС'));
   finally
     Pr.Free;
   end;
end;

procedure TMovementReportForm.CEFromButtonClick(Sender: TObject);
var vId,vInst,vType:integer;
    vName:string;
begin
     if ChooseOrg.CaptureOrg(1,MAIN.MAIN_ID,MAIN.INST,'yyy',vId,vInst,vName) then
     begin
          vType:=GetOrgType(vId,vInst);
          if (vType<>3) and (vType<>4) then
          begin
               showmessage(TranslateText('Выбранная организация должна являться Облнефтепродуктом или ППОН'));
               exit;
          end;
          OrgId:=vId;
          OrgInst:=vInst;
          CEFrom.Text:=vName;
          OrgType:=vType;
          Label3.Refresh;
     end;
end;

procedure TMovementReportForm.CMBPartButtonClick(Sender: TObject);
var Part:TPartRefForm;
begin
     Application.CreateForm(TPartRefForm,Part);
     Part.ShowModal;
     if Part.ModalResult=mrOk then begin
        if not (Part.q.IsEmpty) then
        begin
             PartId:=Part.q.fieldbyname('id').AsInteger;
             PartInst:=Part.q.FieldByName('inst').AsInteger;
             CMBPart.Text:=Part.q.fieldbyname('dog').asstring;
        end;
     end;
     part.free;
end;

procedure TMovementReportForm.CBNpAllClick(Sender: TObject);
begin
    if CBNpAll.Checked then
     begin
        LENp.Enabled:=False;
        LENp.Text:='';
     end
     else
     begin
        LENp.Enabled:=True;
        LENp.Text:=QNpName.AsString;
     end;
end;

procedure TMovementReportForm.CBPartAllClick(Sender: TObject);
begin
     if CBPartAll.Checked then
     begin
          OldPart:=CMBPart.Text;
          CMBPart.Text:='';
          PartId:=0; PartInst:=0;
          CBNpAll.Enabled:=True;
          if not CBNpAll.Checked then
          begin
               LeNP.Enabled:=True;
               LENp.Text:=QNpName.AsString;
          end;
     end
     else
     begin
          CMBPart.Enabled:=True;
          CMBPart.Text:=OldPart;
          CBNpAll.Enabled:=False;
          LeNP.Enabled:=False;
          LENp.Text:='';
     end;
end;

procedure TMovementReportForm.LENpButtonClick(Sender: TObject);
begin
     if not QNp.Active then QNp.Open;
end;

procedure TMovementReportForm.BitBtn1Click(Sender: TObject);
var NPid:integer;
begin
  DefineRepDates(DateEdit1.Date,DateEdit2.Date);
  if CBNpAll.Checked then NPid:=0
                     else NPid:=QNpId.AsInteger;

  if Tip='Barter' then
    MakeReport(DateEdit1.Date,DateEdit2.Date,OrgId,OrgInst,OrgType,PartId,PartInst,NPid)
  else
    MakeReport1(DateEdit1.Date,DateEdit2.Date,OrgId,OrgInst,OrgType,PartId,PartInst,NPid,CB1.Checked);
  DefineRepDates(0,0);
end;

end.
