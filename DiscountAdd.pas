unit DiscountAdd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ToolEdit, StdCtrls, Mask, CurrEdit, ExtCtrls, uCommonForm,uOilQuery,Ora, uOilStoredProc;

type
  TfrmDiscountAdd = class(TCommonForm)
    pButtons: TPanel;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    Panel1: TPanel;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edDiscount: TRxCalcEdit;
    ceOrgName: TComboEdit;
    ceDepName: TComboEdit;
    deDiscountDate: TDateEdit;
    Label1: TLabel;
    ceDiscountType: TComboEdit;
    ceNpType: TComboEdit;
    Label5: TLabel;
    procedure ceDiscountTypeButtonClick(Sender: TObject);
    procedure ceDepNameButtonClick(Sender: TObject);
    procedure ceOrgNameButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbOKClick(Sender: TObject);
    procedure ceNpTypeButtonClick(Sender: TObject);
  private

  public
    DepID, DepINST, OrgID, OrgInst, CurrId, NpType : Integer;
    flEdit : Boolean;
  end;

var
  frmDiscountAdd: TfrmDiscountAdd;

implementation

uses DiscountType, ChooseOrg, Main, OilStd, UDbFunc, uXMLForm;

{$R *.DFM}

procedure TfrmDiscountAdd.ceDiscountTypeButtonClick(Sender: TObject);
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

procedure TfrmDiscountAdd.ceDepNameButtonClick(Sender: TObject);
var vName : String;
begin
  inherited;
  if ChooseOrg.CaptureOrg(4,Main.MAIN_ID,Main.INST,'yyy',DepID,DepINST,vName)
    then ceDepName.Text:=vName;
end;

procedure TfrmDiscountAdd.ceOrgNameButtonClick(Sender: TObject);
var vName : String;
begin
  inherited;
  if ChooseOrg.CaptureOrg(4,0,0,'yyy',OrgID,OrgINST,vName)
    then ceOrgName.Text:=vName;
end;

procedure TfrmDiscountAdd.FormCreate(Sender: TObject);
begin
  inherited;
  if not flEdit then deDiscountDate.Date := now;
end;

procedure TfrmDiscountAdd.bbOKClick(Sender: TObject);
begin
  if ceDepName.Text = '' then raise Exception.Create(TranslateText('Не указано подразделение'));
  if ceOrgName.Text = '' then raise Exception.Create(TranslateText('Не указана организация'));
  if ceDiscountType.Text = '' then raise Exception.Create(TranslateText('Не указан тип скидки'));
  if edDiscount.Value <=0 then raise Exception.Create(TranslateText('Не указана скидка'));
  
  if not flEdit then CurrId := GetSeqNextVal('S_OIL_DISCOUNT');
  
  StartSQL;
  try
    _ExecProc('OIL.INSORUPDOIL_DISCOUNT',
        ['ID#', CurrId,
        'INST#', Main.INST,
        'STATE#','Y',
        'DISCOUNT_DATE#',deDiscountDate.Date,
        'DISCOUNT_TYPE#',ceDiscountType.Tag,
        'DISCOUNT_NPG_ID#',NpType,
        'DISCOUNT#',edDiscount.Value,
        'ORG_ID#',OrgId,
        'ORG_INST#',OrgInst
        ],TRUE );
  CommitSQL;
  ModalResult := mrOk;
  except on E:Exception do
    begin
      RollBackSQL;
      MessageDlg(TranslateText('Ошибка:')+E.Message,mtError,[mbOk],0);
    end;
  end;
end;

procedure TfrmDiscountAdd.ceNpTypeButtonClick(Sender: TObject);
begin
  XMLChoose('npgroupref',NpType,ceNpType);
end;

end.
