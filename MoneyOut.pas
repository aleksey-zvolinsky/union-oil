unit MoneyOut;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus,  DBTables, Grids, DBGridEh, Buttons, StdCtrls,
  ExtCtrls, ToolEdit, Mask, Db, ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess;

type
  TfrmMoneyOut = class(TBaseForm)
    Label1: TLabel;
    deBeginDate: TDateEdit;
    Label7: TLabel;
    deEndDate: TDateEdit;
    ceOrgName: TComboEdit;
    Label2: TLabel;
    ceDepName: TComboEdit;
    Label3: TLabel;
    sbDepClear: TSpeedButton;
    sbOrgClear: TSpeedButton;
    ceOperName: TComboEdit;
    Label8: TLabel;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    edPayNum: TEdit;
    qPAYNUM: TStringField;
    qPAYDATE: TDateTimeField;
    qDOGNAME: TStringField;
    qORGNAME: TStringField;
    qDEPNAME: TStringField;
    qPAY: TFloatField;
    qOPERTYPE: TStringField;
    qID: TFloatField;
    qINST: TFloatField;
    qSTATE: TStringField;
    qOPER_ID: TFloatField;
    qDEP_ID: TFloatField;
    qDEP_INST: TFloatField;
    qORG_ID: TFloatField;
    qORG_INST: TFloatField;
    qREKV_ID: TFloatField;
    qREKV_INST: TFloatField;
    qDOG_ID: TFloatField;
    qDOG_INST: TFloatField;
    qPAY_COMMENT: TStringField;
    procedure ceDepNameButtonClick(Sender: TObject);
    procedure ceOrgNameButtonClick(Sender: TObject);
    procedure ceOperNameButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure sbDepClearClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbOrgClearClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    DepID, DepINST, OrgID, OrgInst : Integer;
  end;

var
  frmMoneyOut: TfrmMoneyOut;


implementation

uses OperTypeRef, ChooseOrg, Main, MoneyOutAdd, UDbFunc, OilStd,
  InvoicePrint, RashNakPrint;

var   MoneyOutAddForm : TfrmMoneyOutAdd;

{$R *.DFM}

procedure TfrmMoneyOut.ceDepNameButtonClick(Sender: TObject);
var vName : String;
begin
  inherited;
  if ChooseOrg.CaptureOrg(4,Main.MAIN_ID,Main.INST,'yyy',DepID,DepINST,vName)
    then ceDepName.Text:=vName;
end;

procedure TfrmMoneyOut.ceOrgNameButtonClick(Sender: TObject);
var vName : String;
begin
  inherited;
  if ChooseOrg.CaptureOrg(4,0,0,'yyy',OrgID,OrgINST,vName)
    then ceOrgName.Text:=vName;
end;

procedure TfrmMoneyOut.ceOperNameButtonClick(Sender: TObject);
  var
   OperTypeRefForm: TOperTypeRefForm;
begin
  inherited;
  OperTypeRefForm:=TOperTypeRefForm.Create(Self);
  OperTypeRefForm.sgrpId:=OpG_OPLATA;
  OperTypeRefForm.bbClear.Enabled:=False;
  OperTypeRefForm.ShowModal;
  if (OperTypeRefForm.ModalResult=MrOk) then
  begin
    ceOperName.Text:=OperTypeRefForm.q.FieldByName('name').AsString;
    ceOperName.Tag := OperTypeRefForm.q.FieldByName('id').Asinteger;
  end;
  OperTypeRefForm.free;
end;

procedure TfrmMoneyOut.FormCreate(Sender: TObject);
begin
  inherited;
  DepId:=MAIN_ORG.ID;
  DepInst:=MAIN_ORG.INST;
  ceDepName.Text:=MAIN_ORG.NAME;
  deBeginDate.Date := now - 1;
  deEndDate.Date := now;
  ceOperName.Tag := 0;
  bbSearchClick(nil);
end;

procedure TfrmMoneyOut.bbSearchClick(Sender: TObject);
begin
  inherited;
  if q.Active then q.Close;
  q.ParamByName('OperId').asInteger := ceOperName.tag;
  q.ParamByName('OrgName').asString := ceOrgName.Text;
  q.ParamByName('DepName').asString := ceDepName.Text;
  q.ParamByName('PayNum').asString := edPayNum.Text;
  q.ParamByName('BeginDate').asDate := deBeginDate.date;
  q.ParamByName('EndDate').asDate := deEndDate.date;
  q.Open;
end;

procedure TfrmMoneyOut.sbDepClearClick(Sender: TObject);
begin
  inherited;
  ceDepName.Clear;
  DepId := 0;
  DepInst := 0;
end;

procedure TfrmMoneyOut.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  ceOperName.Clear;
  ceOperName.Tag :=0;
  OrgId := 0;
  OrgInst := 0;
end;

procedure TfrmMoneyOut.sbOrgClearClick(Sender: TObject);
begin
  inherited;
  ceOrgName.Clear;
end;

procedure TfrmMoneyOut.bbClearClick(Sender: TObject);
begin
  inherited;
  ceOrgName.Clear;
  ceOperName.Clear;
  ceOperName.Tag :=0;
  edPayNum.Text := '';
  OrgId := 0;
  OrgInst := 0;
  DepId := 0;
  DepInst := 0;
end;

procedure TfrmMoneyOut.sbAddClick(Sender: TObject);
begin
  inherited;
  MoneyOutAddForm := TfrmMoneyOutAdd.Create(Application);
  with MoneyOutAddForm do
  begin
    flEdit:=False;
    DepId:=MAIN_ORG.ID;
    DepInst:=MAIN_ORG.INST;
    ceDepName.Text:=MAIN_ORG.NAME;
    ShowModal;
    if ModalResult = mrOk then bbSearchClick(nil);
    Free;
  end; //with
end;

procedure TfrmMoneyOut.sbEditClick(Sender: TObject);
var
  SavePlace: TBookmark;
begin
  inherited;
  if q.isEmpty then abort;
  SavePlace := q.GetBookmark;
  MoneyOutAddForm := TfrmMoneyOutAdd.Create(Application);
  with MoneyOutAddForm do
  begin
    flEdit:=True;
    //Текущий Айди
    CurrId := qId.AsInteger;
    //Дата платежа
    dePayDate.Date :=  qPayDate.AsDateTime;
    //Номер платежа
    edPayNum.Text := qPayNum.asString;
    //подразделение
    ceDepName.Text := qDepName.AsString;
    DepId := qDep_ID.AsInteger;
    DepInst := qDep_Inst.asInteger;
    //организация
    ceOrgName.Text := qOrgName.AsString;
    OrgId := qOrg_Id.asInteger;
    OrgInst := qOrg_inst.asInteger;
    RekvId :=qRekv_Id.AsInteger;
    RekvInst := qRekv_Inst.AsInteger;
    //договор
    ceDogName.Text := qDogName.AsString;
    DogId := qDog_Id.AsInteger;
    DogInst := qDog_Inst.AsInteger;
    //Тип операции
    ceOperName.Text := qOperType.asString;
    OperId := qOper_Id.AsInteger;
    //Комментарий
    mComment.Text := qPay_Comment.asString;
    //Сумма
    edPay.Value := qPay.AsFloat;
    ShowModal;
    Free;
  end; //with
  bbSearchClick(nil);
  if q.BookmarkValid(SavePlace) then  q.GotoBookmark(SavePlace);
  q.FreeBookMark(SavePlace);
end;

procedure TfrmMoneyOut.sbDelClick(Sender: TObject);
begin
  inherited;
  if q.isEmpty then abort;
  if MessageDlg(TranslateText('Вы действительно хотите удалить оплату?'), mtConfirmation,[mbYes,mbNo],0)=mrNo then exit;
  StartSQL;
  try
    _ExecSql(' update oil_money_out set state=''N'' where id='+qId.AsString);
    CommitSQL;
  except on E:Exception do
    begin
      RollBackSQL;
      MessageDlg(TranslateText('Ошибка: ')+E.Message,mtError,[mbOk],0);
    end;
  end;
  bbSearchClick(nil);
end;

end.
