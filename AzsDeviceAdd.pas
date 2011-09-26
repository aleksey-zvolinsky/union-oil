unit AzsDeviceAdd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, CurrEdit, Mask, ToolEdit, uCommonForm,uOilQuery,Ora, uOilStoredProc;

type
  TAzsDeviceAddForm = class(TCommonForm)
    pButtons: TPanel;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    pnlClient: TPanel;
    lblAzs: TLabel;
    ceAzs: TComboEdit;
    lblDevNum: TLabel;
    edDeviceNum: TEdit;
    deFrom: TDateEdit;
    deTo: TDateEdit;
    lblFrom: TLabel;
    lblTo: TLabel;
    edDeviceType: TComboEdit;
    lblDevType: TLabel;
    lblDevText: TLabel;
    edDeviceText: TEdit;
    procedure ceAzsButtonClick(Sender: TObject);
    procedure bbOKClick(Sender: TObject);
    procedure edDeviceTypeButtonClick(Sender: TObject);
  public
    FAzsId, FAzsInst, FDevType,  FCurrId, FCurrInst : Integer;
    IsEdit : Boolean;
  end;

var
  AzsDeviceAddForm: TAzsDeviceAddForm;

implementation

uses ChooseOrg, Main, OilStd, UDbFunc, uXMLForm;

{$R *.DFM}

procedure TAzsDeviceAddForm.ceAzsButtonClick(Sender: TObject);
 var
  vId, vInst: Integer;
  vName: String;
begin
if ChooseOrg.CaptureOrg(2, MAIN_ID, INST, 'yyy', vId, vInst, vName) then
  begin
    FAZSId := vId;
    FAZSInst := vInst;
    ceAzs.Text := vName;
  end;
end;

procedure TAzsDeviceAddForm.edDeviceTypeButtonClick(Sender: TObject);
var
  Form : TXmlForm;
begin
  inherited;
  Form :=GetXMLFormAsFilter('AzsDeviceTypes');
  Form.ShowModal;
  try
    if Form.ModalResult = mrOk then
    begin
      edDeviceType.Text := Form.FQuery['name'];
      FDevType :=  Form.FQuery['id'];
    end;
  finally
    FreeAndNil(Form);
  end;
end;

procedure TAzsDeviceAddForm.bbOKClick(Sender: TObject);
begin
  if (edDeviceType.Text = '') or (ceAzs.Text='') or
     (edDeviceNum.Text = '') or (deFrom.Date = 0) or
     (deTo.Date = 0) then raise Exception.Create(TranslateText('Не заполнены все необходимые поля'));

  if not IsEdit then
  begin
    FCurrId := GetSeqNextVal('S_OIL_AZS_DEVICE',true);
    FCurrInst := Main.INST;
  end;

  StartSQL;
  try
    _ExecProc('OIL.INSORUPDOIL_AZS_DEVICE',
       ['ID#', FCurrId,
        'INST#', FCurrInst,
        'STATE#', 'Y',
        'AZS_ID#', FAzsId,
        'AZS_INST#', FAzsInst,
        'DATE_FROM#', deFrom.Date,
        'DATE_TO#', deTo.Date,
        'DEVICE_NUM#', edDeviceNum.Text,
        'DEVICE_STR#', edDeviceText.Text,
        'DEVICE_TYPE_ID#', FDevType
       ],TRUE );

  CommitSQL;
  if FDevType = 1 then
    RefreshMatherializedView('V_BANK_DEVICE');
  ModalResult := mrOk;
  except on E:Exception do
    begin
      RollBackSQL;
      MessageDlg(TranslateText('Ошибка:')+E.Message,mtError,[mbOk],0);
    end;
  end;

end;



end.
