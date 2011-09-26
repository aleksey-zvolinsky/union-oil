unit AzsDevice;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGridEh, Buttons, StdCtrls,
  ExtCtrls, Mask, ToolEdit, CurrEdit, ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess;

type
  TAzsDeviceForm = class(TBaseForm)
    Label2: TLabel;
    ceParName: TComboEdit;
    sbOrgClear: TSpeedButton;
    Label3: TLabel;
    ceAZSName: TComboEdit;
    sbCearAZS: TSpeedButton;
    Label1: TLabel;
    edDeviceNumber: TEdit;
    qAZS_NAME: TStringField;
    qDEVICE_TYPE: TStringField;
    qDATE_FROM: TDateTimeField;
    qDATE_TO: TDateTimeField;
    qDEVICE_STR: TStringField;
    qID: TFloatField;
    qINST: TFloatField;
    qAZS_ID: TFloatField;
    qAZS_INST: TFloatField;
    Label4: TLabel;
    sbDevTypeClear: TSpeedButton;
    edDeviceType: TComboEdit;
    qPAR_ID: TFloatField;
    qPAR_INST: TFloatField;
    qPAR_NAME: TStringField;
    qDEVICE_TYPE_ID: TFloatField;
    qDEVICE_NUM: TStringField;
    N1: TMenuItem;
    miRefreshBankDevice: TMenuItem;
    procedure sbAddClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure sbOrgClearClick(Sender: TObject);
    procedure sbCearAZSClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure ceParNameButtonClick(Sender: TObject);
    procedure ceAZSNameButtonClick(Sender: TObject);
    procedure sbDevTypeClearClick(Sender: TObject);
    procedure edDeviceTypeButtonClick(Sender: TObject);
    procedure miRefreshBankDeviceClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AzsDeviceForm: TAzsDeviceForm;

implementation

uses UDbFunc, OilStd, ChooseOrg, Main, AzsDeviceAdd, uXMLForm;

{$R *.DFM}

procedure TAzsDeviceForm.sbAddClick(Sender: TObject);
var F : TAzsDeviceAddForm;
begin
  inherited;
  F := TAzsDeviceAddForm.Create(Application);
  try
    F.IsEdit := false;
    F.deFrom.Date := date;
    F.deTo.Date := date;
    F.ShowModal;
    if F.ModalResult = mrOk then bbSearchClick(nil);
  finally
    F.Free;
  end;  
end;

procedure TAzsDeviceForm.sbEditClick(Sender: TObject);
var F : TAzsDeviceAddForm;
begin
  inherited;
  if q.IsEmpty then Exit;

  if qInst.AsInteger <> Main.INST
    then raise Exception.Create(TranslateText('Нельзя редактировать запись, созданную в другой организации!'));

  F := TAzsDeviceAddForm.Create(Application);
  try
    F.IsEdit := true;
    F.FCurrId := qId.asInteger;
    F.FCurrInst := qInst.asInteger;
    F.ceAzs.Text := qAzs_Name.AsString;
    F.FAzsId := qAzs_Id.asInteger;
    F.FAzsInst := qAzs_Inst.asInteger;
    F.FDevType := qDevice_Type_Id.AsInteger;
    F.edDeviceType.Text := qDevice_Type.AsString;
    F.deTo.Date := qDate_To.AsDateTime;
    F.deFrom.Date := qDate_From.AsDateTime;
    F.edDeviceText.Text := qDevice_str.AsString;
    F.edDeviceNum.Text := qDevice_Num.asString;
    F.ShowModal;
    if F.ModalResult = mrOk then bbSearchClick(nil);
  finally
    F.Free;
  end;  
end;

procedure TAzsDeviceForm.bbSearchClick(Sender: TObject);
begin
  inherited;
  if q.Active then q.Close;
  q.ParamByName('AzsName').asString := ceAzsName.Text;
  q.ParamByName('ParName').asString := ceParName.Text;
  q.ParamByName('DevtName').asString := edDeviceType.Text;
  q.ParamByName('DevNum').asString := edDeviceNumber.Text;
  q.Open;
end;

procedure TAzsDeviceForm.FormCreate(Sender: TObject);
begin
  inherited;
  bbSearchClick(nil);
end;

procedure TAzsDeviceForm.sbDelClick(Sender: TObject);
begin
  inherited;
  if q.IsEmpty then abort;
  if MessageDlg(TranslateText('Подтвердите удаление'),mtConfirmation,[mbYes,mbNo],0) = mrNo then exit;
  StartSQL;
  try
    _ExecSql(' update oil_azs_device set state=''N'' where id='+qId.AsString+' and inst = '+qInst.asString);
    CommitSQL;
  except on E:Exception do
    begin
      RollBackSQL;
      MessageDlg(TranslateText('Ошибка: ')+E.Message,mtError,[mbOk],0);
    end;
  end;
  bbSearchClick(nil);
end;

procedure TAzsDeviceForm.sbOrgClearClick(Sender: TObject);
begin
  inherited;
  ceParName.Text := '';
end;

procedure TAzsDeviceForm.sbCearAZSClick(Sender: TObject);
begin
  inherited;
  ceAzsName.Text :='';
end;

procedure TAzsDeviceForm.bbClearClick(Sender: TObject);
begin
  inherited;
  sbCearAZSClick(nil);
  sbOrgClearClick(nil);
  sbDevTypeClearClick(nil);
  edDeviceNumber.Text :='';
end;

procedure TAzsDeviceForm.ceParNameButtonClick(Sender: TObject);
var
  vId, vInst: Integer;
  vName: String;
begin
  inherited;
  if ChooseOrg.CaptureOrg(0, MAIN_ID, INST, 'yyy', vId, vInst, vName) then
    ceParName.Text := vName;
end;

procedure TAzsDeviceForm.ceAZSNameButtonClick(Sender: TObject);
var
  vId, vInst: Integer;
  vName: String;
begin
  inherited;
  if ChooseOrg.CaptureOrg(2, MAIN_ID, INST, 'yyy', vId, vInst, vName) then
    ceAzsName.Text := vName;
end;

procedure TAzsDeviceForm.sbDevTypeClearClick(Sender: TObject);
begin
  inherited;
  edDeviceType.Text := '';
end;

procedure TAzsDeviceForm.edDeviceTypeButtonClick(Sender: TObject);
var
  Form : TXmlForm;
begin
  inherited;
  Form := GetXMLFormAsFilter('AzsDeviceTypes');
  Form.ShowModal;
  try
    if Form.ModalResult = mrOk then
      edDeviceType.Text := Form.FQuery['name'];
  finally
    FreeAndNil(Form);
  end;
end;

procedure TAzsDeviceForm.miRefreshBankDeviceClick(Sender: TObject);
begin
  inherited;
  RefreshMatherializedView('V_BANK_DEVICE');
end;

end.
