unit HandTransact;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ToolEdit, RXDBCtrl, Mask, DBCtrls, DBCtrlsEh,
  DBTables, Db, MemDS, DBAccess, Ora, OraSmart, ComCtrls, Grids, DBGridEh,
  CurrEdit, uCommonForm,uOilQuery,uOilStoredProc;

type
  TfrmHandTrans = class(TCommonForm)
    stProcCardTransaction: TOraStoredProc;
    qrySeq: TOilQuery;
    qrySeqNEXTVAL: TFloatField;
    qryCardID: TOilQuery;
    qryCardIDCARD_ID: TFloatField;
    qryEmitent: TOilQuery;
    qryEmitentCARD_ID: TFloatField;
    qryEmitentNAME: TStringField;
    stProcCardTransit: TOraStoredProc;
    qryEmitentID: TFloatField;
    qryCardIDID: TFloatField;
    qryCardIDINST: TFloatField;
    qryEmitentINST: TFloatField;
    pnlWhere: TPanel;
    lComboEdit3: TLabel;
    ComboEdit3: TComboEdit;
    Panel6: TPanel;
    btnOK: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    Label6: TLabel;
    Label5: TLabel;
    edtDocNum: TEdit;
    Edit1: TEdit;
    Label3: TLabel;
    edtDocDate: TDateEdit;
    edtPrice: TCurrencyEdit;
    edtLitre: TCurrencyEdit;
    Label13: TLabel;
    Label17: TLabel;
    dbceNP: TComboEdit;
    Label12: TLabel;
    edtCardNum: TCurrencyEdit;
    Label2: TLabel;
    Label23: TLabel;
    DateTimePicker1: TDateEdit;
    Label22: TLabel;
    DateTimePicker2: TDateTimePicker;
    pnlAutoDirver: TPanel;
    qrySeqTrans: TOilQuery;
    qrySeqTransNEXTVAL: TFloatField;
    Label1: TLabel;
    Label7: TLabel;
    dbceAutoNumb: TComboEdit;
    sbDelAuto: TSpeedButton;
    sbDelDriver: TSpeedButton;
    dbceDriver: TComboEdit;
    Label8: TLabel;
    pnlCardPrice: TPanel;
    ledtCardPrice: TLabel;
    edtCardPrice: TCurrencyEdit;
    pnlDov: TPanel;
    Label9: TLabel;
    Label18: TLabel;
    edtDovSer: TEdit;
    Label4: TLabel;
    edtDovNum: TEdit;
    Label11: TLabel;
    edtDovDate: TDateEdit;
    Label19: TLabel;
    edtDovWho: TEdit;
    pnlShet: TPanel;
    Panel5: TPanel;
    pnlClient: TPanel;
    comboEdit1: TComboEdit;
    lComboEdit1: TLabel;
    lCouse: TLabel;
    cmbCouse: TComboBox;
    lShet: TLabel;
    edtShet: TEdit;
    lShetDate: TLabel;
    edtShetDate: TDateEdit;
    pnlTo: TPanel;
    lComboEdit4: TLabel;
    ComboEdit4: TComboEdit;
    procedure qAfterPost(DataSet: TDataSet);
    procedure comboEdit1ButtonClick(Sender: TObject);
    procedure dbceNPButtonClick(Sender: TObject);
    procedure dbceDriverButtonClick(Sender: TObject);
    procedure dbceAutoNumbButtonClick(Sender: TObject);
    procedure ComboEdit3ButtonClick(Sender: TObject);
    procedure ComboEdit4ButtonClick(Sender: TObject);
    procedure edtCardNumChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure edtCardNumKeyPress(Sender: TObject; var Key: Char);
    procedure dbceNPChange(Sender: TObject);
    procedure edtDocNumKeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TypeOper:integer;//1-œÓÔÓÎÌÂÌËÂ › ;2-—ÔËÒ‡ÌËÂ;3-◊ÛÊËÂ ÒÔËÒ‡ÌËˇ;4-—ÔËÒ‡ÌËÂ À—
  end;

var
  frmHandTrans: TfrmHandTrans;
  Korg_id,Korg_inst, AutoID,AutoInst,EmployId,EmployInst,WhereId,WhereINST:integer;
  ECARD_ID,ToID,ToInst,INP_TYPE:double;
implementation

uses PrihCardRef, AutoRef, EmpRef, NPTypeRef, ChooseOrg,
     uXMLForm, Main, OilStd, uStart;

{$R *.DFM}

procedure TfrmHandTrans.qAfterPost(DataSet: TDataSet);
begin
 ModalResult:=mrOk;
end;

procedure TfrmHandTrans.comboEdit1ButtonClick(Sender: TObject);
var
 vId,vInst:integer;
   vName:string;
begin
  // ¬˚·Ó ÍÎËÂÌÚ‡ ‰Îˇ ÔÓËÒÍ‡
    if ChooseOrg.CaptureOrg(3,Main_id,Inst,'yyy',vId,vInst,vName) then
    begin
         ComboEdit1.Text:=vName;
         KOrg_Id:=vId;
         Korg_Inst:=vInst;
    end;
end;

procedure TfrmHandTrans.dbceNPButtonClick(Sender: TObject);
var
  vId: integer;
  vName: string;
begin
  INP_TYPE:=0;
  if XMLChoose('npgroupref',vId,vName) then begin
    INP_TYPE:=vId;
    dbceNP.Text:=vName;
  end;
end;

procedure TfrmHandTrans.dbceDriverButtonClick(Sender: TObject);
var
EmpRefForm: TEmpRefForm;
begin
Application.CreateForm(TEmpRefForm, EmpRefForm);
EmpRefForm.ShowModal;
if EmpRefForm.ModalResult = mrOk then
  begin
  EmployId := EmpRefForm.q.FieldByName('Id').Value;
  EmployInst:= EmpRefForm.q.FieldByName('Inst').Value;
  dbceDriver.Text := EmpRefForm.q.FieldByName('F_Name').AsString;
  if not(EmpRefForm.q.FieldByName('I_Name').IsNull)
    then dbceDriver.Text := dbceDriver.Text + ' ' + EmpRefForm.q.FieldByName('I_Name').AsString[1] + '.';
  if not(EmpRefForm.q.FieldByName('O_Name').IsNull)
    then dbceDriver.Text := dbceDriver.Text + ' ' + EmpRefForm.q.FieldByName('O_Name').AsString[1] + '.';
  end;
EmpRefForm.Destroy;
end;

procedure TfrmHandTrans.dbceAutoNumbButtonClick(Sender: TObject);
var
AutoRefForm: TAutoRefForm;
begin
Application.CreateForm(TAutoRefForm, AutoRefForm);
AutoRefForm.ShowModal;
if AutoRefForm.ModalResult = mrOk then
  begin

   AutoId  := AutoRefForm.q.FieldByName('Id').Value;
   AutoInst := AutoRefForm.q.FieldByName('Inst').Value;
  dbceAutoNumb.Text := AutoRefForm.q.FieldByName('Numb').Value;
  if not AutoRefForm.qEMPLOY_ID.IsNull then
    begin
     EmployId := AutoRefForm.q.FieldByName('Employ_Id').Value;
     EmployInst  := AutoRefForm.q.FieldByName('Employ_Inst').Value;
    dbceDriver.Text := AutoRefForm.q.FieldByName('FullName').Value;
    end;
  end;
AutoRefForm.Destroy;
end;

procedure TfrmHandTrans.ComboEdit3ButtonClick(Sender: TObject);
 var
  vId, vInst: Integer;
  vName: String;
  OrgForm:TChooseOrgForm;
begin
  if ChooseOrg.CaptureOrg(1, MAIN_ID, INST, 'nnn', vId, vInst, vName) then  ComboEdit3.Text := vName;
  //  ECARD_ID:=vId;
    //qryCardID.Params[0].value:= vId ;
    //qryCardID.Open;
    WhereID:=vId;
    WhereINST:=vInst;
    //qryCardID.Close;
  end;

procedure TfrmHandTrans.ComboEdit4ButtonClick(Sender: TObject);
 var
  vId, vInst: Integer;
  vName: String;
begin
   if(TypeOper=1)then
   begin
   WhereID:=MAIN_ORG.ID;
   WhereINST:=MAIN_ORG.Inst;
   end;
  if ChooseOrg.CaptureOrg(2, WhereID, WhereINST, 'nnn', vId, vInst, vName) then  ComboEdit4.Text := vName;
    ToID:=vId;
    ToInst:=vInst;
  end;

procedure TfrmHandTrans.edtCardNumChange(Sender: TObject);
var
strTemp:string;
begin
 if Length(edtCardNum.Text)=3 then
 begin
 qryEmitent.Active:=false;
 strTemp := Copy(edtCardNum.Text,1,3);
 qryEmitent.ParamByName('card_id').Value:=StrToInt(strTemp);
 qryEmitent.Active:=true;
 ECARD_ID:=qryEmitent.FieldByName('card_id').AsInteger;
 Edit1.Text:=qryEmitent.FieldByName('name').AsString;
 end;
end;

procedure TfrmHandTrans.FormShow(Sender: TObject);
begin
DateTimePicker1.Date:=now;
DateTimePicker2.Date:=now;

 if(TypeOper=1)then
 begin
  cmbCouse.ItemIndex:=2;
  pnlShet.Visible:=false;
  pnlWhere.Visible:=false;
  pnlTo.Visible:=false;
 end
 else
 if(TypeOper=2)then
 begin
   cmbCouse.ItemIndex:=4;
   pnlCardPrice.Visible:=false;
   pnlAutoDirver.Visible:=false;
   pnlShet.Visible:=false;
   pnlDov.Visible:=false;
 end
 else
 if(TypeOper=3)then
 begin
   cmbCouse.ItemIndex:=4;
   pnlShet.Visible:=false;
   pnlClient.Visible:=false;
   pnlCardPrice.Visible:=false;
   pnlAutoDirver.Visible:=false;
   pnlShet.Visible:=false;
      pnlDov.Visible:=false;
 end
 else
 if(TypeOper=4)then
 begin
    cmbCouse.ItemIndex:=7;
    pnlCardPrice.Visible:=false;
    pnlAutoDirver.Visible:=false;
    pnlDov.Visible:=false;
 end;
  Application.ProcessMessages;
  DateTimePicker1.SetFocus();
end;

procedure TfrmHandTrans.DateTimePicker2Change(Sender: TObject);
begin
edtCardNum.SetFocus();
end;

procedure TfrmHandTrans.edtCardNumKeyPress(Sender: TObject; var Key: Char);
begin
if(key=#13)then
dbceNP.SetFocus();
end;

procedure TfrmHandTrans.dbceNPChange(Sender: TObject);
begin
edtLitre.SetFocus();
end;

procedure TfrmHandTrans.edtDocNumKeyPress(Sender: TObject; var Key: Char);
begin
if(key=#13) then
edtDocDate.SetFocus();
end;

procedure TfrmHandTrans.DateTimePicker1Change(Sender: TObject);
begin
DateTimePicker2.SetFocus();
end;

procedure TfrmHandTrans.btnOKClick(Sender: TObject);
var
strTime,strTemp:string;
DateTime1,DateTime2:TDateTime;
begin
try
 if(TypeOper=1)then
 begin
   if((length(edtCardNum.Text)=0) or (length(dbceNP.Text)=0)or (Length(edtLitre.Text)=0) or (length(edtPrice.Text)=0) or (edtCardPrice.Value=0) or (length(comboEdit1.Text)=0)) then
  begin
  MessageDlg(TranslateText('«‡ÔÓÎÌËÚÂ ‚ÒÂ ‰‡ÌÌ˚Â!'),mtinformation,[mbOK],0);
  Exit;
  end;
 end
 else
 if(TypeOper=2)then
 begin
  if((length(edtCardNum.Text)=0) or (length(dbceNP.Text)=0) or (length(edtLitre.Text)=0)or (length(edtPrice.Text)=0)or (length(ComboEdit1.Text)=0)  or (length(ComboEdit3.Text)=0) or (length(ComboEdit4.Text)=0)) then
  begin
  MessageDlg(TranslateText('«‡ÔÓÎÌËÚÂ ‚ÒÂ ‰‡ÌÌ˚Â!'),mtinformation,[mbOK],0);
  exit;
  end;
 end
 else
 if(TypeOper=3)then
 begin
  if((length(edtCardNum.Text)=0) or (length(dbceNP.Text)=0) or (length(edtLitre.Text)=0)or (length(edtPrice.Text)=0) or (length(ComboEdit3.Text)=0) or (length(ComboEdit4.Text)=0)) then
  begin
  MessageDlg(TranslateText('«‡ÔÓÎÌËÚÂ ‚ÒÂ ‰‡ÌÌ˚Â!'),mtinformation,[mbOK],0);
  exit;
  end;
 end
 else
 if(TypeOper=4)then
 begin
  if((length(edtCardNum.Text)=0) or (length(dbceNP.Text)=0) or (length(edtLitre.Text)=0)or (length(edtPrice.Text)=0)  or (length(ComboEdit1.Text)=0) or (length(ComboEdit3.Text)=0) or (length(ComboEdit4.Text)=0)) then
  begin
  MessageDlg(TranslateText('«‡ÔÓÎÌËÚÂ ‚ÒÂ ‰‡ÌÌ˚Â!'),mtinformation,[mbOK],0);
  exit;
  end;
 end;
 StartSQLOra;
 if(TypeOper=3)then
   begin
   qrySeqTrans.Open;
   stProcCardTransit.ParamByName('OIL_ID#').Value:=qrySeqTransNEXTVAL.value;
   stProcCardTransit.ParamByName('OIL_INST#').Value:=MAIN_ORG.Inst;
   DateTime1:=DateTimePicker1.Date;
   DateTime2:=DateTimePicker2.Time;
   ReplaceTime(DateTime1,DateTime2);
   stProcCardTransit.ParamByName('OPER_DATE#').Value:=DateTime1;
   stProcCardTransit.ParamByName('DOC_NUMBER#').Value:=edtDocNum.Text;
   stProcCardTransit.ParamByName('DOC_DATE#').Value:=edtDocDate.Date;
   stProcCardTransit.ParamByName('NP_TYPE#').Value:=INP_TYPE;

   stProcCardTransit.ParamByName('LITR#').Value:= edtLitre.Value;
   stProcCardTransit.ParamByName('TERM_PRICE#').Value:= edtPrice.Value;
   stProcCardTransit.ParamByName('TERM_EMITENT#').Value:=ECARD_ID;
   stProcCardTransit.ParamByName('CARD_NUMBER#').Value:=edtCardNum.Text;
   stProcCardTransit.ParamByName('AZS_ID#').Value:=ToID;
   stProcCardTransit.ParamByName('SERV_CARD_NUMBER#').Value:=0;
   stProcCardTransit.ParamByName('ID#').Value:=0;
   stProcCardTransit.ParamByName('NN_ID#').Value:=0;
   stProcCardTransit.ParamByName('NN_INST#').Value:=0;
   stProcCardTransit.ParamByName('TRANS_TYPE#').Value:=72;
   stProcCardTransit.ExecProc;
   qrySeqTrans.Close;
  end
 else
 begin
 qrySeq.Open;
 stProcCardTransaction.ParamByName('OIL_ID#').Value:=qrySeqNEXTVAL.value;
 stProcCardTransaction.ParamByName('OIL_INST#').Value:=MAIN_ORG.Inst;
 stProcCardTransaction.ParamByName('DATE_#').Value:=DateTimePicker1.Date;
 strTemp:='';
 strTime:=TimeToStr(DateTimePicker2.Time);
 strTemp := Copy(strTime,1,2)+Copy(strTime,4,2)+Copy(strTime,7,2);
 stProcCardTransaction.ParamByName('TIME_#').Value:=strTemp;
 stProcCardTransaction.ParamByName('DOC_NUMBER#').Value:=edtDocNum.Text;
 stProcCardTransaction.ParamByName('DOC_DATE#').Value:=edtDocDate.Date;
 if(TypeOper=4)then
 begin
 stProcCardTransaction.ParamByName('CHEK_NUMBER#').Value:=edtShet.Text;
 stProcCardTransaction.ParamByName('CHEK_DATE#').Value:=edtShetDate.Date;
 end;
 if((TypeOper=1) or (TypeOper=2) or (TypeOper=4))then
 begin
 stProcCardTransaction.ParamByName('TO_ID#').Value:=KOrg_Id;
 stProcCardTransaction.ParamByName('TO_INST#').Value:=KOrg_Inst;
 end;
 stProcCardTransaction.ParamByName('PRICE_NDS#').Value:=edtPrice.Value;
  if( (cmbCouse.ItemIndex+1)=8) then
 stProcCardTransaction.ParamByName('ID_—’≈Ã€_Œ¡—À#').Value:=2
 else
 stProcCardTransaction.ParamByName('ID_—’≈Ã€_Œ¡—À#').Value:=1;


 stProcCardTransaction.ParamByName('NP_TYPE#').Value:=INP_TYPE;
 stProcCardTransaction.ParamByName('ID_ Œÿ_◊≈Ã#').Value:=6;
  stProcCardTransaction.ParamByName('COUNT_LITR#').Value:=edtLitre.Value;
 stProcCardTransaction.ParamByName('—”ÃÃ¿_◊≈Ã#').Value:=edtLitre.Value;
 stProcCardTransaction.ParamByName('›Ã»“≈Õ“_√ƒ≈#').Value:=ECARD_ID;
 stProcCardTransaction.ParamByName('GR_CARD_NUM#').Value:=edtCardNum.Text;

 if(((cmbCouse.ItemIndex+1)=1) or ((cmbCouse.ItemIndex+1)=3) or ((cmbCouse.ItemIndex+1)=5))then
  stProcCardTransaction.ParamByName('OPER_TYPE#').Value:=0;
 if(((cmbCouse.ItemIndex+1)=2) or ((cmbCouse.ItemIndex+1)=4) or ((cmbCouse.ItemIndex+1)=6))then
  stProcCardTransaction.ParamByName('OPER_TYPE#').Value:=1;
 if(((cmbCouse.ItemIndex+1)=7) or ((cmbCouse.ItemIndex+1)=8)) then
  stProcCardTransaction.ParamByName('OPER_TYPE#').Value:=2;


 if((cmbCouse.ItemIndex+1)<=2)then
  stProcCardTransaction.ParamByName('œ–»◊»Õ¿_»«Ã≈Õ≈Õ»ﬂ#').Value:=0;

 if((cmbCouse.ItemIndex+1)=3)then
  stProcCardTransaction.ParamByName('œ–»◊»Õ¿_»«Ã≈Õ≈Õ»ﬂ#').Value:=1;

 if((cmbCouse.ItemIndex+1)=4)then
  stProcCardTransaction.ParamByName('œ–»◊»Õ¿_»«Ã≈Õ≈Õ»ﬂ#').Value:=2;

 if((cmbCouse.ItemIndex+1)>4)then
  stProcCardTransaction.ParamByName('œ–»◊»Õ¿_»«Ã≈Õ≈Õ»ﬂ#').Value:=100;

 if((cmbCouse.ItemIndex+1)<5)then
  stProcCardTransaction.ParamByName('ÕŒÃ≈–_“≈–Ã»Õ¿À¿#').Value:=0;
 if((cmbCouse.ItemIndex+1)>=5)then
  stProcCardTransaction.ParamByName('ÕŒÃ≈–_“≈–Ã»Õ¿À¿#').Value:=1;


 stProcCardTransaction.ParamByName('ID_“≈–Ã»Õ¿À¿#').Value:=0;

 stProcCardTransaction.ParamByName('ID_“Œ#').Value:=0;

 stProcCardTransaction.ParamByName('PRICE_DOG_NDS#').Value:= edtPrice.Value;
 stProcCardTransaction.ParamByName('ID_ ŒÃÃ≈Õ“¿–»ﬂ#').Value:=0;
 stProcCardTransaction.ParamByName('‘À¿√_ Œ––≈ “»–Œ¬ »#').Value:=0;
 stProcCardTransaction.ParamByName('‘À¿√_Œ“ÀŒ∆_»«Ã#').Value:=0;
 stProcCardTransaction.ParamByName('‘À¿√_› ¬¿–»Õ√¿#').Value:=0;
 stProcCardTransaction.ParamByName('¿¬“Œœ≈–≈—◊≈“#').Value:=0;
 stProcCardTransaction.ParamByName('Œ“ ”ƒ¿_»Õ ¿——¿÷»ﬂ#').Value:=0;
 stProcCardTransaction.ParamByName('ID_œ≈–—ŒÕ¿À¿#').Value:=0;
 stProcCardTransaction.ParamByName('√–_ÕŒÃ≈–_—À”∆_ ¿–“€#').Value:=0;
 stProcCardTransaction.ParamByName('‘À¿√_¬Œ«¬–¿“¿#').Value:=0;
 if(TypeOper=1)then
 begin
 stProcCardTransaction.ParamByName('CARD_PRICE#').Value:= edtCardPrice.Value;
 end;
 stProcCardTransaction.ParamByName('ID#').Value:=0;
 if(TypeOper=1)then
 begin
 stProcCardTransaction.ParamByName('DOV_SER#').Value:=edtDovSer.Text;
 stProcCardTransaction.ParamByName('DOV_NUM#').Value:=edtDovNum.Text;
 stProcCardTransaction.ParamByName('DOV_DATE#').Value:=edtDovDate.Date;
 stProcCardTransaction.ParamByName('DOV_WHO#').Value:=edtDovWho.Text;
 end;
 stProcCardTransaction.ParamByName('FIRST_USE#').Value:=0;
 stProcCardTransaction.ParamByName('CLEAN_Z_NUM#').Value:=54;
 if(TypeOper=1)then
 begin
  if((length(dbceAutoNumb.Text)<>0)  or (length(dbceDriver.Text)<>0)) then
  begin
  stProcCardTransaction.ParamByName('AUTO_ID#').Value:=AutoID;
  stProcCardTransaction.ParamByName('AUTO_INST#').Value:=AutoInst;
  stProcCardTransaction.ParamByName('EMPLOY_ID#').Value:=EmployId;
  stProcCardTransaction.ParamByName('EMPLOY_INST#').Value:=EmployInst;
  end;
 end;
 stProcCardTransaction.ParamByName('NN_ID#').Value:=0;
 stProcCardTransaction.ParamByName('NN_INST#').Value:=0;
 stProcCardTransaction.ParamByName('TRANS_TYPE#').Value:=72;
 stProcCardTransaction.ExecProc;
  qrySeq.Close;
  end;
  CommitSQLOra;
  except on E:Exception do
   begin
   MessageDlg(TranslateText('Œ¯Ë·Í‡ : ')+E.message,mtError,[mbOk],0);
   RollbackSQLOra;
   end; // except on E:Exception do
  end; // try  except on E:Exception do
 ModalResult:=mrOk;
end;

procedure TfrmHandTrans.SpeedButton2Click(Sender: TObject);
begin
close;
end;

end.
