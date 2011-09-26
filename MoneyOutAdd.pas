unit MoneyOutAdd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, CurrEdit, ToolEdit, Mask, Db, DBTables,
  uCommonForm,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess;

type
  TfrmMoneyOutAdd = class(TCommonForm)
    pButtons: TPanel;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    qProperties: TOilQuery;
    Panel1: TPanel;
    Label8: TLabel;
    Label6: TLabel;
    sbDogClear: TSpeedButton;
    Label7: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    mComment: TMemo;
    edPay: TRxCalcEdit;
    ceDogName: TComboEdit;
    ceOperName: TComboEdit;
    ceOrgName: TComboEdit;
    ceDepName: TComboEdit;
    dePayDate: TDateEdit;
    edPayNum: TEdit;
    procedure ceDepNameButtonClick(Sender: TObject);
    procedure ceOrgNameButtonClick(Sender: TObject);
    procedure ceOperNameButtonClick(Sender: TObject);
    procedure ceDogNameButtonClick(Sender: TObject);
    procedure bbOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbDogClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    DepID, DepINST, OrgID, OrgInst, DogId, DogInst, OperId, CurrId, RekvId, RekvInst : Integer;
    flEdit : Boolean;
  end;

var
  frmMoneyOutAdd: TfrmMoneyOutAdd;

implementation

uses DogRef, OperTypeRef, ChooseOrg, Main, UDbFunc, OilStd;

{$R *.DFM}

procedure TfrmMoneyOutAdd.FormCreate(Sender: TObject);
begin
  inherited;
  dePayDate.Date := now;
end;

procedure TfrmMoneyOutAdd.ceDepNameButtonClick(Sender: TObject);
var vName : String;
begin
  inherited;
  if ChooseOrg.CaptureOrg(4,Main.MAIN_ID,Main.INST,'yyy',DepID,DepINST,vName)
    then ceDepName.Text:=vName;
end;

procedure TfrmMoneyOutAdd.ceOrgNameButtonClick(Sender: TObject);
var vName : String;
begin
  inherited;
  if ChooseOrg.CaptureOrg(4,0,0,'yyy',OrgID,OrgINST,vName)
    then ceOrgName.Text:=vName;
  qProperties.Close;
  qProperties.ParamByName('p_OrgId').Value:=OrgId;
  qProperties.ParamByName('p_OrgInst').Value:=OrgInst;
  qProperties.Open;
  RekvId := qProperties.FieldByName('id').AsInteger;
  RekvInst := qProperties.FieldByName('inst').AsInteger;
end;

procedure TfrmMoneyOutAdd.ceOperNameButtonClick(Sender: TObject);
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
    OperId := OperTypeRefForm.q.FieldByName('id').AsInteger;
  end;
  OperTypeRefForm.free;
end;

procedure TfrmMoneyOutAdd.ceDogNameButtonClick(Sender: TObject);
var DogRefForm : TDogRefForm;
begin
 DogRefForm:= TDogRefForm.Create(Self);
 try
  if (DogRefForm.ShowModal = mrOK) then
   begin
    DogId:= DogRefForm.q.FieldByName('id').AsInteger;
    DogInst:= DogRefForm.q.FieldByName('inst').AsInteger;
    ceDogName.Text := DogRefForm.q.FieldByName('Dog').AsString;
   end;
 finally
  DogRefForm.Free;
 end;
end;

procedure TfrmMoneyOutAdd.bbOKClick(Sender: TObject);
begin
  if edPayNum.Text = '' then raise Exception.Create(TranslateText('Не введен номер оплаты'));
  if ceDepName.Text = '' then raise Exception.Create(TranslateText('Не указано подразделение'));
  if ceOrgName.Text = '' then raise Exception.Create(TranslateText('Не указана организация'));
  if ceOperName.Text = '' then raise Exception.Create(TranslateText('Не указана операция'));
  if edPay.Value <=0 then raise Exception.Create(TranslateText('Не указана сумма'));
  
  if not flEdit then CurrId := GetSeqNextVal('S_OIL_MONEY_OUT'); 
  StartSQL;
  try
    _ExecProc('OIL.INSORUPDOIL_MONEY_OUT',
        ['ID#', CurrId,
        'INST#', Main.INST,
        'STATE#','Y',
        'PAY_NUM#',edPayNum.Text,
        'PAY_DATE#',dePayDate.Date,
        'PAY#',edPay.Value,
        'OPER_ID#',OperId,
        'DEP_ID#',DepId,
        'DEP_INST#',DepInst,
        'ORG_ID#',OrgId,
        'ORG_INST#',OrgInst,
        'REKV_ID#',RekvId,
        'REKV_INST#',RekvInst,
        'DOG_ID#',DogId,
        'DOG_INST#',DogInst,
        'PAY_COMMENT#',mComment.Text ], TRUE );
  CommitSQL;
  ModalResult := mrOk;
  except on E:Exception do
    begin
      RollBackSQL;
      MessageDlg(TranslateText('Ошибка:')+E.Message,mtError,[mbOk],0);
    end;
  end;
end;



procedure TfrmMoneyOutAdd.sbDogClearClick(Sender: TObject);
begin
  DogId:=0;
  DogInst:=0;
  ceDogName.Clear;
end;

end.
