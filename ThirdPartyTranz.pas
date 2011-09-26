unit ThirdPartyTranz;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGridEh, Buttons, StdCtrls,
  ExtCtrls, ToolEdit, Mask, RXCtrls, MemDS, DBAccess, Ora, ActnList,
  uOilQuery,uOilStoredProc{$IFDEF VER150},Variants{$ENDIF};

type TDocType = (dtSchet,dtRashNak,dtNN, dtAll);

type
  TfrmThirdPartyTranz = class(TBaseForm)
    Label1: TLabel;
    deBeginDate: TDateEdit;
    Label7: TLabel;
    deEndDate: TDateEdit;
    ceOrgName: TComboEdit;
    Label2: TLabel;
    Label3: TLabel;
    ceDepName: TComboEdit;
    sbDepClear: TSpeedButton;
    sbOrgClear: TSpeedButton;
    sbAzsClear: TSpeedButton;
    ceAZSName: TComboEdit;
    Label4: TLabel;
    Label5: TLabel;
    ceNpType: TComboEdit;
    sbNpClear: TSpeedButton;
    sbSum: TSpeedButton;
    sbPrint: TRxSpeedButton;
    N1: TMenuItem;
    miSchetPrint: TMenuItem;
    qOPER_DATE: TDateTimeField;
    qCARD_NUMBER: TFloatField;
    qNPNAME: TStringField;
    qPURSENAME: TStringField;
    qORGWHERE: TStringField;
    qORGWHO: TStringField;
    qAZS: TStringField;
    qCOUNT_LITR: TFloatField;
    qCOUNT_PURSE: TFloatField;
    qTERM_PRICE: TFloatField;
    qRECIVE_DATE: TDateTimeField;
    qSEND_DATE: TDateTimeField;
    qOIL_RN_NUM: TStringField;
    qOIL_RN_DATE: TDateTimeField;
    qOIL_SCHET_NUM: TStringField;
    qOIL_SCHET_DATE: TDateTimeField;
    qOIL_NN_NUM: TStringField;
    qOIL_NN_DATE: TDateTimeField;
    miTranzReport: TMenuItem;
    qWork: TOilQuery;
    qEM_WHERE: TFloatField;
    qEM_WHO: TFloatField;
    qORGID: TFloatField;
    qORGINST: TFloatField;
    qAZSID: TFloatField;
    qAZSINST: TFloatField;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    miDelSchet: TMenuItem;
    N8: TMenuItem;
    miDelRN: TMenuItem;
    miDelNN: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    edSchet: TEdit;
    edRN: TEdit;
    Label6: TLabel;
    Label8: TLabel;
    procedure bbSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ceDepNameButtonClick(Sender: TObject);
    procedure ceOrgNameButtonClick(Sender: TObject);
    procedure sbDepClearClick(Sender: TObject);
    procedure sbOrgClearClick(Sender: TObject);
    procedure ceAZSNameButtonClick(Sender: TObject);
    procedure ceNpTypeButtonClick(Sender: TObject);
    procedure sbAzsClearClick(Sender: TObject);
    procedure sbNpClearClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure sbSumClick(Sender: TObject);
    procedure miTranzReportClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure miDelSchetClick(Sender: TObject);
    procedure miDelRNClick(Sender: TObject);
    procedure miDelNNClick(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure PUMPopup(Sender: TObject);
  private
    procedure DoPrint(p_DocType:TDocType);
    procedure DoDelete(p_DocType:TDocType);
  public
    OrgId,OrgInst,DepId,DepInst, AZSId, AZSInst, NpType : Integer;
  end;

var                  
  frmThirdPartyTranz: TfrmThirdPartyTranz;

implementation

uses DiscountType, ChooseOrg, Main, DiscountAdd, OilStd, UDbFunc,
     uXMLForm, ThirdPartyPrint, UReportClass, URepElClass, RulezReport,
     uStart;

{$R *.DFM}

procedure TfrmThirdPartyTranz.bbSearchClick(Sender: TObject);
begin
  inherited;
  if q.Active then q.Close;
  q.ParamByName('OrgName').asString := ceOrgName.Text;
  q.ParamByName('DepName').asString := ceDepName.Text;
  q.ParamByName('BeginDate').asDate := deBeginDate.date;
  q.ParamByName('EndDate').asDate := deEndDate.date;
  q.ParamByName('NpType').asInteger := NpType;
  q.ParamByName('AzsId').asInteger := AzsId;
  q.ParamByName('AzsInst').asInteger := AzsInst;
  q.ParamByName('RnNum').asString := edRn.Text;
  q.ParamByName('SchetNum').asString := edSchet.Text;
  q.Open;
end;

procedure TfrmThirdPartyTranz.FormCreate(Sender: TObject);
begin
  inherited;
  deBeginDate.Date := now - 1;
  deEndDate.Date := now;
  bbSearchClick(nil);
end;

procedure TfrmThirdPartyTranz.ceDepNameButtonClick(Sender: TObject);
var vName : String;
begin
  inherited;
  if ChooseOrg.CaptureOrg(4,Main.MAIN_ID,Main.INST,'yyy',DepID,DepINST,vName)
    then ceDepName.Text:=vName;
end;

procedure TfrmThirdPartyTranz.ceOrgNameButtonClick(Sender: TObject);
var vName : String;
begin
  inherited;
  if ChooseOrg.CaptureOrg(1,0,0,'yyy',OrgID,OrgINST,vName)
    then ceOrgName.Text:=vName;
end;

procedure TfrmThirdPartyTranz.sbDepClearClick(Sender: TObject);
begin
  inherited;
  ceDepName.Clear;
  DepId := 0;
  DepInst := 0;
end;

procedure TfrmThirdPartyTranz.sbOrgClearClick(Sender: TObject);
begin
  inherited;
  ceOrgName.Clear;
  OrgId :=0;
  OrgInst := 0;
end;

procedure TfrmThirdPartyTranz.ceAZSNameButtonClick(Sender: TObject);
 var
  vName: String;
begin
  inherited;
  if ChooseOrg.CaptureOrg(2, MAIN_ID, INST, 'yyy', AZSId, AZSInst, vName) then
    ceAZSName.Text := vName;
end;

procedure TfrmThirdPartyTranz.ceNpTypeButtonClick(Sender: TObject);
begin
  XMLChoose('npgroupref',NpType,ceNpType);
end;

procedure TfrmThirdPartyTranz.sbAzsClearClick(Sender: TObject);
begin
  inherited;
  ceAZSName.Text := '';
  AZSId := 0;
  AZSInst := 0;
end;

procedure TfrmThirdPartyTranz.sbNpClearClick(Sender: TObject);
begin
  inherited;
  ceNPType.Text := '';
  NPType := 0;
end;

procedure TfrmThirdPartyTranz.bbClearClick(Sender: TObject);
begin
  inherited;
  sbDepClearClick(nil);
  sbOrgClearClick(nil);
  sbAzsClearClick(nil);
  sbNpClearClick(nil);
  edSchet.Text :='';
  edRN.Text := '';
end;

procedure TfrmThirdPartyTranz.sbSumClick(Sender: TObject);
begin
  inherited;
  if sbSum.Down
    then DBGrid1.FooterRowCount := 1
    else DBGrid1.FooterRowCount := 0;
end;


procedure TfrmThirdPartyTranz.N8Click(Sender: TObject);
begin
  inherited;
  DoPrint(dtRashNak)
end;

procedure TfrmThirdPartyTranz.N6Click(Sender: TObject);
begin
  inherited;
  DoPrint(dtSchet);
end;

procedure TfrmThirdPartyTranz.miDelSchetClick(Sender: TObject);
begin
  inherited;
  DoDelete(dtSchet);
end;

procedure TfrmThirdPartyTranz.miDelRNClick(Sender: TObject);
begin
  inherited;
  DoDelete(dtRashNak);
end;

procedure TfrmThirdPartyTranz.miDelNNClick(Sender: TObject);
begin
  inherited;
  DoDelete(dtNN);
end;

procedure TfrmThirdPartyTranz.miTranzReportClick(Sender: TObject);
var RR: TReport;
begin
  inherited;
  RR:=TReport.Create;
  try
    RR.GetFromFile(TranslateText('Отчет о транзакциях - гривни'));
    MakeRulezReport(RR);
  finally
    RR.Destroy;
  end;
end;

procedure TfrmThirdPartyTranz.DoPrint(p_DocType:TDocType);
var
  F : TfrmThirdPartyPrint;
  strDocNameField, strDocDateField, strFieldData, strAgentIdInst : String;
  bMark : TBookMark;
begin
  if q.IsEmpty then abort;
  bMark := q.GetBookMark;
  F := TfrmThirdPartyPrint.Create(Application);
  with F do
  begin
    PrintRekv.intWhere := qEm_Where.AsInteger;
    PrintRekv.intWho := qEm_Who.AsInteger;
    PrintRekv.strWhereName := qOrgWhere.AsString;
    PrintRekv.strWhoName := qOrgWho.AsString;
    case p_DocType of
    dtRashNak :
      begin
        pnlPrintAll.Visible := false;
        strDocNameField := 'oil_rn_num';
        strDocDateField := 'oil_rn_date';
        strFieldData := qOil_RN_Num.asString;
        //номер документа
        edDocNumber.Text := qOIL_RN_NUM.asString;
        //дата документа
        if  qOIL_RN_DATE.asDateTime  > 0
          then deDocDate.Date := qOIL_RN_DATE.asDateTime
          else deDocDate.Date := qOper_Date.asDateTime;
        //флаг редактирования
        mbEdit := qOIL_RN_DATE.asDateTime  > 0;
        Caption := TranslateText('Расходная накладная');
      end;
    dtSchet :
      begin
        pnlPrintAll.Visible := false;
        strDocNameField := 'oil_schet_num';
        strDocDateField := 'oil_schet_date';
        strFieldData := qOil_Schet_Num.asString;
        //номер документа
        edDocNumber.Text := qOIL_SCHET_NUM.asString;
        //дата документа
        if  qOIL_SCHET_DATE.asDateTime  > 0
          then deDocDate.Date:= qOIL_SCHET_DATE.asDateTime
          else deDocDate.Date := qOper_Date.asDateTime;
        //флаг редактирования
        mbEdit :=  qOIL_SCHET_DATE.asDateTime  > 0;
        Caption := TranslateText('Счет - фактура');
      end;
    end;
    if qWork.Active then qWork.Close;
    qWork.SQL.Text :=
      ' select min(trunc(oper_date)), max(trunc(oper_date))'+
      ' from card_transaction_money '+
      ' where '+ strDocNameField +'='''+strFieldData+'''';
    qWork.Open;
    //дата начала документа
    if qWork.Fields[0].asDateTime > 0
      then deBeginDate.Date := qWork.Fields[0].asDateTime
      else deBeginDate.Date :=  qOper_Date.AsDateTime;
    //дата окончания документа
    if  qWork.Fields[1].asDateTime > 0
      then deEndDate.Date := qWork.Fields[1].asDateTime
      else deEndDate.Date :=  qOper_Date.AsDateTime;
    //где произошло списание
    strAgentIdInst := VarToStr(ReadOilVar('CARD_AGENT_ID_INST'));
    PrintRekv.intAgentId := StrToInt(copy(strAgentIdInst,1,pos(',',strAgentIdInst)-1));
    PrintRekv.intAgentInst := StrToInt(copy(strAgentIdInst,pos(',',strAgentIdInst)+1,length(strAgentIdInst)));
    edDep.Text := GetOrgName(PrintRekv.intAgentId, PrintRekv.intAgentInst);
    //чья карта списалась
    edOrg.Text := qOrgWho.AsString;
    PrintRekv.intWhoId := qOrgId.AsInteger;
    PrintRekv.intWhoInst := qOrgINst.AsInteger;
    //Номер нового документа
    if edDocNumber.Text = '' then
    begin
      sbAuto.Down:=true;
      sbAutoClick(nil);
    end;
    globDocType := p_DocType;

    //не редактировать поля если документ уже сформирован
    edDocNumber.Enabled := not mbEdit;
    deBeginDate.Enabled := not mbEdit;
    deEndDate.Enabled :=  not mbEdit;
    sbAuto.Enabled := not mbEdit;
    deDocDate.Enabled := not mbEdit;
    edDep.Enabled := not mbEdit;
    edOrg.Enabled := not mbEdit;

    ShowModal;
    if ModalResult = mrOk then
    begin
      bbSearchClick(nil);
      if q.BookMarkValid(bMark) then q.GotoBookmark(bMark);
    end;
    Free;
    q.FreeBookmark(bMark);
  end; //with
end;



procedure TfrmThirdPartyTranz.DoDelete(p_DocType:TDocType);
var
  strDocNameField, strDocDateField, strFieldData : String;
  bMark : TBookMark;
begin
  if MessageDlg(TranslateText('Подтвердите удаление документа'), mtConfirmation,[mbYes,mbNo],0)=mrNo then exit;
  case p_DocType of
    dtRashNak :
    begin
      strDocNameField := 'oil_rn_num';
      strDocDateField := 'oil_rn_date';
      strFieldData := qOil_RN_Num.asString;
    end;
    dtSchet :
    begin
      strDocNameField := 'oil_schet_num';
      strDocDateField := 'oil_schet_date';
      strFieldData := qOil_Schet_Num.asString;
    end;
    else exit;
  end;
  bMark := q.GetBookmark;
  try
  frmStart.OraSession1.StartTransaction;
  _ExecSQL(' update card_transaction_money '+
           ' set '+strDocNameField+'=null, '+strDocDateField+'=null '+
           ' where '+strDocNameField+'='''+strFieldData+'''');
  frmStart.OraSession1.Commit;
  bbSearchClick(nil);
  if q.BookmarkValid(bMark) then q.GotoBookmark(bMark);
  q.FreeBookmark(bMark);
  except on E:Exception do
     begin
       frmStart.OraSession1.Rollback;
       q.FreeBookmark(bMark);
       MessageDlg(TranslateText('Ошибка удаления документа')+#13#10+E.Message,mtError,[mbOk],0);
     end;
  end;
end;


procedure TfrmThirdPartyTranz.N11Click(Sender: TObject);
var
  F : TfrmThirdPartyPrint;
  strAgentIdInst : String;
begin
  inherited;
  F := TfrmThirdPartyPrint.Create(Application);
  with F do
  begin
    pnlPrintAll.Visible :=true;
    sbAuto.Down:=true;
    sbAutoClick(nil);
    sbAuto.Enabled := false;
    pnlOrgs.Visible := false;
    globDocType := dtAll;
    deBeginDate.Date := self.deBeginDate.Date;
    deEndDate.Date := self.deEndDate.Date;
    deDocDate.Date := self.deEndDate.Date;
    //Реквизиты агента
    strAgentIdInst := VarToStr(ReadOilVar('CARD_AGENT_ID_INST'));
    PrintRekv.intAgentId := StrToInt(copy(strAgentIdInst,1,pos(',',strAgentIdInst)-1));
    PrintRekv.intAgentInst := StrToInt(copy(strAgentIdInst,pos(',',strAgentIdInst)+1,length(strAgentIdInst)));
    ShowModal;
    if ModalResult = mrOk then bbSearchClick(nil);
    Free;
  end; //with
end;

procedure TfrmThirdPartyTranz.N12Click(Sender: TObject);
begin
  inherited;
  if MessageDlg(TranslateText('Подтвердите удаление ВСЕХ документов за период')+#13#10+
                'c '+deBeginDate.Text+TranslateText(' по ')+deEndDate.Text,
                 mtWarning,[mbYes,mbNo],0) = mrNo then exit;
  try
  frmStart.OraSession1.StartTransaction;
  _ExecSQL(' update card_transaction_money '+
           ' set oil_rn_num = null, oil_rn_date = null, '+
           ' oil_schet_num = null, oil_schet_date = null '+
           ' where trunc(oper_date) between '''+deBeginDate.Text+''' and '''+deEndDate.Text+''' ' );
  frmStart.OraSession1.Commit;
  bbSearchClick(nil);
  except on E:Exception do
     begin
       frmStart.OraSession1.Rollback;
       MessageDlg(TranslateText('Ошибка удаления документов')+#13#10+E.Message,mtError,[mbOk],0);
     end;
  end;
end;

procedure TfrmThirdPartyTranz.PUMPopup(Sender: TObject);
begin
  inherited;
  miDelNN.Enabled := not qOIL_NN_NUM.IsNull;
  miDelRN.Enabled := not qOIL_RN_NUM.IsNull;
  miDelSchet.Enabled := not qOIL_SCHET_NUM.IsNull;
end;

end.
