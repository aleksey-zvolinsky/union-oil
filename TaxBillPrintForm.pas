unit TaxBillPrintForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, RXSpin, ToolEdit, Mask, CurrEdit, Placemnt, Buttons,
  uCommonForm,uOilQuery,Ora, uOilStoredProc;

type
  TStorageAction = (saLoadSave, saLoad, saSave, saNoAction);
  
type
  TfrmTaxBillPrintForm = class(TCommonForm)
    pnlTop: TPanel;
    rbUseDefault: TRadioButton;
    rbAlwaysAsk: TRadioButton;
    pnlBottom: TPanel;
    rbEmpty: TRadioButton;
    rbOrigOnly: TRadioButton;
    rbAll: TRadioButton;
    FormStorage: TFormStorage;
    Panel1: TPanel;
    bbOk: TBitBtn;
    rbCopyOnly: TRadioButton;
    pnlClient: TPanel;
    Label6: TLabel;
    sbUpDown: TRxSpinButton;
    cbOutputType: TComboBox;
    edNumOfCopy: TRxCalcEdit;
    deSaveTo: TDirectoryEdit;
    chSaveTo: TCheckBox;
    Label1: TLabel;
    procedure cbOutputTypeChange(Sender: TObject);
    procedure rbUseDefaultClick(Sender: TObject);
    procedure rbAlwaysAskClick(Sender: TObject);
    procedure chSaveToClick(Sender: TObject);
    procedure FormStorageRestorePlacement(Sender: TObject);
    procedure sbUpDownTopClick(Sender: TObject);
    procedure sbUpDownBottomClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FStorage: TStorageAction;
  public
    procedure EnableComponents(AEnabled: Boolean);
    constructor Create(AStorage: TStorageAction = saLoadSave); reintroduce;
  end;

var
  frmTaxBillPrintForm: TfrmTaxBillPrintForm;

implementation

{$R *.DFM}


procedure TfrmTaxBillPrintForm.cbOutputTypeChange(Sender: TObject);
begin
  FormStorage.StoredValues.Items[0].Value := cbOutputType.ItemIndex;
  edNumOfCopy.Enabled := cbOutputType.ItemIndex = 1;
  sbUpDown.Enabled := cbOutputType.ItemIndex = 1;

  chSaveTo.Checked := cbOutputType.ItemIndex = 2;
  chSaveToClick(nil);

  if (cbOutputType.Itemindex = 0) or
     (cbOutputType.Itemindex = 2)
  then edNumOfCopy.value := 1;

end;

procedure TfrmTaxBillPrintForm.rbUseDefaultClick(Sender: TObject);
begin
  EnableComponents(True);
end;

procedure TfrmTaxBillPrintForm.rbAlwaysAskClick(Sender: TObject);
begin
  EnableComponents(False);
end;

procedure TfrmTaxBillPrintForm.EnableComponents(AEnabled:Boolean);
var
  i : integer;
begin
  for i:= ComponentCount - 1 downto 0 do
    if (Components[i] is TControl) then
      if ((Components[i] as TControl).Parent = pnlBottom) or
         ((Components[i] as TControl).Parent = pnlClient)
       then
        (Components[i] as TControl).Enabled := AEnabled;
end;


procedure TfrmTaxBillPrintForm.chSaveToClick(Sender: TObject);
begin
  deSaveTo.Enabled := chSaveTo.Checked;
end;

procedure TfrmTaxBillPrintForm.sbUpDownTopClick(Sender: TObject);
begin
  edNumOfCopy.AsInteger := 1 + edNumOfCopy.AsInteger;
end;

procedure TfrmTaxBillPrintForm.sbUpDownBottomClick(Sender: TObject);
begin
  if edNumOfCopy.Value>0 then edNumOfCopy.Value := edNumOfCopy.Value - 1;
end;

procedure TfrmTaxBillPrintForm.FormCreate(Sender: TObject);
begin
  inherited;
  FormStorage.RestoreFormPlacement;
end;


procedure TfrmTaxBillPrintForm.FormStorageRestorePlacement(
  Sender: TObject);
begin
  if FormStorage.StoredValues[0].Value <> '' then
    cbOutputType.ItemIndex := FormStorage.StoredValues[0].Value;
  cbOutputTypeChange(nil);
end;


constructor TfrmTaxBillPrintForm.Create(AStorage: TStorageAction = saLoadSave);
begin
  inherited Create(Application);
  FStorage := AStorage;
  FormStorage.Active := (FStorage in [saLoadSave, saLoad]);
end;

procedure TfrmTaxBillPrintForm.FormShow(Sender: TObject);
begin
  inherited;
  FormStorage.Active := (FStorage in [saLoadSave, saSave]);
end;

end.
