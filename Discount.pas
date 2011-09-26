unit Discount;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGridEh, Buttons, StdCtrls,
  ExtCtrls, ToolEdit, Mask, ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess;

type
  TfrmDiscount = class(TBaseForm)
    deBeginDate: TDateEdit;
    Label1: TLabel;
    Label7: TLabel;
    deEndDate: TDateEdit;
    ceOrgName: TComboEdit;
    Label2: TLabel;
    Label3: TLabel;
    sbDepClear: TSpeedButton;
    sbOrgClear: TSpeedButton;
    ceDiscountType: TComboEdit;
    Label8: TLabel;
    sbDiscTypeClear: TSpeedButton;
    ceDepName: TComboEdit;
    qID: TFloatField;
    qINST: TFloatField;
    qSTATE: TStringField;
    qDISCOUNT_DATE: TDateTimeField;
    qDISCOUNT_TYPE: TFloatField;
    qDISCOUNT: TFloatField;
    qORG_ID: TFloatField;
    qORG_INST: TFloatField;
    qDEPNAME: TStringField;
    qORGNAME: TStringField;
    qDISCOUNTTYPE: TStringField;
    qNPNAME: TStringField;
    Label4: TLabel;
    ceNpType: TComboEdit;
    sbNPClear: TSpeedButton;
    qDISCOUNT_NPG_ID: TFloatField;
    procedure ceDiscountTypeButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbDiscTypeClearClick(Sender: TObject);
    procedure ceDepNameButtonClick(Sender: TObject);
    procedure ceOrgNameButtonClick(Sender: TObject);
    procedure sbDepClearClick(Sender: TObject);
    procedure sbOrgClearClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure sbNPClearClick(Sender: TObject);
    procedure ceNpTypeButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
     DepID, DepINST, OrgID, OrgInst, NpType : Integer;
  end;

var
  frmDiscount: TfrmDiscount;

implementation

uses DiscountType, ChooseOrg, Main, DiscountAdd, OilStd, UDbFunc,uXMLForm;

{$R *.DFM}

procedure TfrmDiscount.ceDiscountTypeButtonClick(Sender: TObject);
var F : TfrmDiscountType;
begin
 Application.CreateForm(TfrmDiscountType,F);
 F.bbOk.Visible := true;
 F.ShowModal;
 if F.ModalResult = mrOk then
 begin
   ceDiscountType.Text := F.q.FieldByName('Name').asString;
   ceDiscountType.Tag := F.q.FieldByName('Id').asInteger;
 end;
end;

procedure TfrmDiscount.FormCreate(Sender: TObject);
begin
  inherited;
  ceDiscountType.Tag := 0;
  NpType := 0;
  DepId:=MAIN_ORG.ID;
  DepInst:=MAIN_ORG.INST;
  ceDepName.Text:=MAIN_ORG.NAME;
  deBeginDate.Date := GetSystemDate - 1;
  deEndDate.Date := GetSystemDate;
  bbSearchClick(nil);
end;


procedure TfrmDiscount.sbDiscTypeClearClick(Sender: TObject);
begin
  inherited;
  ceDiscountType.Text :='';
  ceDiscountType.Tag :=0;
end;

procedure TfrmDiscount.ceDepNameButtonClick(Sender: TObject);
var vName : String;
begin
  inherited;
  if ChooseOrg.CaptureOrg(4,Main.MAIN_ID,Main.INST,'yyy',DepID,DepINST,vName)
    then ceDepName.Text:=vName;
end;

procedure TfrmDiscount.ceOrgNameButtonClick(Sender: TObject);
var vName : String;
begin
  inherited;
  if ChooseOrg.CaptureOrg(4,0,0,'yyy',OrgID,OrgINST,vName)
    then ceOrgName.Text:=vName;
end;
procedure TfrmDiscount.sbDepClearClick(Sender: TObject);
begin
  inherited;
  ceDepName.Clear;
  DepId := 0;
  DepInst := 0;
end;

procedure TfrmDiscount.sbOrgClearClick(Sender: TObject);
begin
  inherited;
  ceOrgName.Clear;
  OrgId :=0;
  OrgInst := 0;

end;

procedure TfrmDiscount.bbClearClick(Sender: TObject);
begin
  inherited;
  sbOrgClearClick(nil);
  sbDiscTypeClearClick(nil);
  sbNPClearClick(nil);
end;

procedure TfrmDiscount.bbSearchClick(Sender: TObject);
begin
  inherited;
  if q.Active then q.Close;
  q.ParamByName('DiscType').asInteger := ceDiscountType.tag;
  q.ParamByName('OrgName').asString := ceOrgName.Text;
  q.ParamByName('DepName').asString := ceDepName.Text;
  q.ParamByName('BeginDate').asDate := deBeginDate.date;
  q.ParamByName('EndDate').asDate := deEndDate.date;
  q.Open;
end;

procedure TfrmDiscount.sbAddClick(Sender: TObject);
var F : TfrmDiscountAdd;
begin
  inherited;
  Application.CreateForm(TfrmDiscountAdd,F);
  F.flEdit := false;
  //подразделение
  F.DepID := MAIN_ORG.ID;
  F.DepInst := MAIN_ORG.INST;
  F.ceDepName.Text := MAIN_ORG.Name;
  F.ShowModal;
  if F.ModalResult = mrOk then bbSearchClick(nil);
  F.Free;

end;

procedure TfrmDiscount.sbEditClick(Sender: TObject);
  var F : TfrmDiscountAdd;
begin
  inherited;
  if q.isEmpty then Abort;
  Application.CreateForm(TfrmDiscountAdd,F);
  F.flEdit := true;
  //id
  F.CurrId := qId.AsInteger;
  //Организация
  F.OrgID := qOrg_Id.AsInteger;
  F.OrgINST := qOrg_Inst.AsInteger;
  F.ceOrgName.Text := qOrgName.AsString;
  //Подразделение
  F.DepID := qInst.AsInteger;
  F.DepInst := qInst.AsInteger;
  F.ceDepName.Text := qDepName.AsString;
  //Тип скидки
  F.ceDiscountType.Text := qDiscountType.AsString;
  F.ceDiscountType.Tag := qDiscount_Type.AsInteger;
  //скидка
  F.edDiscount.Value := qDiscount.asFloat;
  //тип нефтепродукта
  F.NpType := qDiscount_Npg_Id.AsInteger;
  F.ceNpType.Text := qNpName.AsString;
  //дата
  F.deDiscountDate.Date := qDiscount_Date.asDateTime;
  F.ShowModal;
  if F.ModalResult = mrOk then bbSearchClick(nil);
  F.Free;
end;

procedure TfrmDiscount.sbDelClick(Sender: TObject);
begin
  inherited;
  if q.isEmpty then abort;
  if MessageDlg(TranslateText('Вы действительно хотите удалить скидку?'), mtConfirmation,[mbYes,mbNo],0)=mrNo then exit;
  StartSQL;
  try
    _ExecSql(' update oil_discount set state=''N'' where id='+qId.AsString);
    CommitSQL;
  except on E:Exception do
    begin
      RollBackSQL;
      MessageDlg(TranslateText('Ошибка: ')+E.Message,mtError,[mbOk],0);
    end;
  end;
  bbSearchClick(nil);
end;


procedure TfrmDiscount.sbNPClearClick(Sender: TObject);
begin
  inherited;
  ceNPType.Text := '';
  NPType := 0;
end;

procedure TfrmDiscount.ceNpTypeButtonClick(Sender: TObject);
begin
  XMLChoose('npgroupref',NpType,ceNpType);
end;

end.
