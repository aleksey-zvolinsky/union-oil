unit TaxBillEditDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, DBTables, Db, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, Grids,
  DBGridEh, ExtCtrls, uHelpButton, uCommonForm,uOilQuery,Ora, uOilStoredProc,
  DBAccess, MemDS;

type
  TTaxBillEditDetForm = class(TCommonForm)
    pBase: TPanel;
    DBGrid1: TDBGridEh;
    Panel2: TPanel;
    lNomerNN: TLabel;
    lTypeDog: TLabel;
    lSumMoney: TLabel;
    lDog: TLabel;
    lSumOstatka: TLabel;
    lTypeDogName: TLabel;
    lNomerNNname: TLabel;
    lDogName: TLabel;
    eMoney: TCurrencyEdit;
    eMoneyEdit: TCurrencyEdit;
    Panel1: TPanel;
    Panel3: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    ds: TOraDataSource;
    q: TOilQuery;
    UpdQ: TOraUpdateSQL;
    PUM: TPopupMenu;
    miNulling: TMenuItem;
    miAddOstatok: TMenuItem;
    qID: TFloatField;
    qINST: TFloatField;
    qDOG: TStringField;
    qDOG_DATE: TDateTimeField;
    qDOG_TYPE: TStringField;
    qNP_ID: TFloatField;
    qNP_GRP_ID: TFloatField;
    qSHORT_NAME: TStringField;
    qDIM_ID: TFloatField;
    qPRICE: TFloatField;
    qCOUNT_: TFloatField;
    qSUM_DOG: TFloatField;
    qSUM_REMAIN: TFloatField;
    qCOUNT_REMAIN: TFloatField;
    qNN_ID: TFloatField;
    qNN_INST: TFloatField;
    qNUM: TStringField;
    qNN_D_ID: TFloatField;
    qSUM_NN_EDIT: TFloatField;
    qCOUNT_NN_EDIT: TFloatField;
    qSUM_NN_EXIST: TFloatField;
    qCOUNT_EXIST: TFloatField;
    OilHelpButton: TOilHelpButton;
    qprice_no_nds: TFloatField;
    procedure qSUM_NN_EDITChange(Sender: TField);
    procedure eMoneyChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eMoneyEditChange(Sender: TObject);
    procedure qSUM_NN_EDITSetText(Sender: TField; const Text: String);
    procedure miNullingClick(Sender: TObject);
    procedure miAddOstatokClick(Sender: TObject);
    procedure eMoneyKeyPress(Sender: TObject; var Key: Char);
    procedure bbCancelClick(Sender: TObject);
    procedure qBeforeOpen(DataSet: TDataSet);
    procedure qAfterOpen(DataSet: TDataSet);
    procedure bbOkClick(Sender: TObject);
  private
    { Private declarations }
    NewTax : boolean;
    OldTaxSum : double;
  public
    { Public declarations }
    nn_id,nn_inst,dog_id,dog_inst : integer;
    num : string;
    Money : double;
    Auto : boolean;
  end;

var
  TaxBillEditDetForm: TTaxBillEditDetForm;

implementation
uses
  MoneyFunc, DogRef, TaxBillPrint;
{$R *.DFM}
var
  MoneyEdit : double;
  
procedure TTaxBillEditDetForm.qSUM_NN_EDITChange(Sender: TField);
begin
  // калькуляция количества в соответствии с суммой в зависимости от договора
  // договора: обычный, услужный.
  If trim(q.FieldByName('Dog_type').AsString)[1] in ['N','S'] then
  begin
    If q.FieldByName('count_nn_edit').AsFloat <>
      FRound(
        GetNoNDS_WithNDS(
          q.FieldByName('Sum_nn_edit').AsFloat,
          q.FieldByName('Dog_date').AsDateTime
          )
          /q.FieldByName('Price_no_nds').AsFloat,
        6)
    Then
    begin
      if q.State = dsBrowse then q.Edit;
      q.FieldByName('count_nn_edit').AsFloat :=
        FRound(
          GetNoNDS_WithNDS(
            q.FieldByName('Sum_nn_edit').AsFloat,
            q.FieldByName('Dog_date').AsDateTime
            )
            /q.FieldByName('Price_no_nds').AsFloat,
          6);
      if Fround(q.FieldByName('count_nn_edit').AsFloat,2)+0.02 >= Fround(q.FieldByName('COUNT_REMAIN').AsFloat,2) then
        q.FieldByName('count_nn_edit').AsFloat := q.FieldByName('COUNT_REMAIN').AsFloat;
    end;
  end
  // все остальные даговора
  Else if q.FieldByName('count_nn_edit').AsFloat <>
    FRound(q.FieldByName('Sum_nn_edit').AsFloat / q.FieldByName('Price').AsFloat,6)
  Then
  begin
    if q.State = dsBrowse then q.Edit;
      q.FieldByName('count_nn_edit').AsFloat :=
      Fround(q.FieldByName('Sum_nn_edit').AsFloat / q.FieldByName('Price').AsFloat,6);
  end;
end;

procedure TTaxBillEditDetForm.eMoneyChange(Sender: TObject);
begin
  if eMoney.text = '' then eMoney.text := '0';
  eMoneyEdit.Text := FloatToStr(StrToFloat(eMoney.text) - OldTaxSum);
  OldTaxSum := 0;
  if not NewTax then exit;
  q.First;
  while not(q.eof) and not(MoneyEdit = 0) do
  Begin
    if q.FieldByName('sum_remain').AsFloat < MoneyEdit then
    Begin
      if q.state = dsBrowse then q.edit;
      q.FieldByName('sum_nn_edit').AsFloat := q.FieldByName('sum_remain').AsFloat;
      eMoneyEdit.Text := FloatToStr(MoneyEdit - q.FieldByName('sum_remain').AsFloat);
    End
    else
    Begin
      if q.state = dsBrowse then q.edit;
      q.FieldByName('sum_nn_edit').AsFloat := MoneyEdit;
      eMoneyEdit.Text := '0';
      q.next;
      while not(q.eof)do
      Begin
        if q.state = dsBrowse then q.edit;
        q.FieldByName('sum_nn_edit').AsFloat := 0;
        q.next;
      end;
      break;
    End;
    q.Next;
  End;
end;

procedure TTaxBillEditDetForm.FormShow(Sender: TObject);
begin
  q.Open;
end;

procedure TTaxBillEditDetForm.eMoneyEditChange(Sender: TObject);
begin
  if eMoneyEdit.Text <> '' then
    MoneyEdit := StrToFloat(eMoneyEdit.Text)
  else
    MoneyEdit := 0;
  if (MoneyEdit < 0)and(NewTax = False)then
  Begin
    NewTax := True;
    eMoneyEdit.Text := eMoney.Text;
  End;
end;

procedure TTaxBillEditDetForm.qSUM_NN_EDITSetText(Sender: TField;
  const Text: String);
var
  NewSum,OldSum,MaxSum : Double;
begin
  NewSum := FRound(StrToFloat(Text),2);
  OldSum := FRound(q.FieldByName('sum_nn_edit').AsFloat,2);
  MaxSum := FRound(q.FieldByName('sum_remain').AsFloat,2);
  q.Edit;
  If NewSum < OldSum then
  begin
    eMoneyEdit.Text := FloatToStr(MoneyEdit + (OldSum - NewSum));
    q.FieldByName('sum_nn_edit').AsFloat := NewSum;
  end
  Else if NewSum < FRound(MoneyEdit + OldSum,2) then
  begin
    if NewSum < MaxSum then
    Begin
      eMoneyEdit.Text := FloatToStr(MoneyEdit - (NewSum - OldSum));
      q.FieldByName('sum_nn_edit').AsFloat := NewSum;
    End
    else
    Begin
      eMoneyEdit.Text := FloatToStr(MoneyEdit - (MaxSum - OldSum));
      q.FieldByName('sum_nn_edit').AsFloat := MaxSum;
    End;
  end
  Else
  begin
    if MoneyEdit < MaxSum then
      q.FieldByName('sum_nn_edit').AsFloat := MoneyEdit + OldSum
    else
      q.FieldByName('sum_nn_edit').AsFloat := MaxSum;
    eMoneyEdit.Text := '0';
  end;
  q.Post;
end;

procedure TTaxBillEditDetForm.miNullingClick(Sender: TObject);
begin
  qSUM_NN_EDITSetText(nil,'0');
end;

procedure TTaxBillEditDetForm.miAddOstatokClick(Sender: TObject);
begin
  qSUM_NN_EDITSetText(nil,q.FieldByName('sum_remain').AsString);
end;

procedure TTaxBillEditDetForm.eMoneyKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(key in ['1','2','3','4','5','6','7','8','9','0',#8]) then Abort;
end;

procedure TTaxBillEditDetForm.bbCancelClick(Sender: TObject);
begin
  q.CancelUpdates;
  q.Close;
  q.Open;
  Auto := True;
  bbOkClick(nil);
end;

procedure TTaxBillEditDetForm.qBeforeOpen(DataSet: TDataSet);
begin
  q.ParamByName('nn_id').AsInteger := nn_id;
  q.ParamByName('nn_inst').AsInteger := nn_inst;
  q.ParamByName('dog_id').AsInteger := dog_id;
  q.ParamByName('dog_inst').AsInteger := dog_inst;
end;

procedure TTaxBillEditDetForm.qAfterOpen(DataSet: TDataSet);
begin
  OldTaxSum := 0;
  NewTax := True;
  lDogName.Caption := q.FieldByName('dog').AsString;
  lNomerNNName.Caption := num;
  lTypeDogName.Caption := GetDogTypeName(q.FieldByName('dog_type').AsString);
  while not(q.Eof) do
  Begin
    if q.FieldByName('sum_nn_edit').AsFloat <> 0 then
    Begin
      OldTaxSum := OldTaxSum + q.FieldByName('sum_nn_edit').AsFloat;
      NewTax := False;
    End;
    q.Next;
  End;
  eMoney.Text := FloatToStr(money);
end;

procedure TTaxBillEditDetForm.bbOkClick(Sender: TObject);
begin
//проверяем есть ли остаток если есть то наличие не заполненых позиций
  if MoneyEdit > 0 then
  Begin
    q.First;
    While not(q.Eof) do
    Begin
      if FRound(q.FieldByName('sum_nn_edit').AsFloat,2) < FRound(q.FieldByName('sum_remain').AsFloat,2) then
      Begin
        //если автоматическое создание, то проверяем сами заполняем позиции
        if Auto then
        Begin
          if MoneyEdit = 0 then break;
          if q.state = dsBrowse then q.Edit;
          if MoneyEdit < FRound(q.FieldByName('sum_remain').AsFloat -
               q.FieldByName('sum_nn_edit').AsFloat,2) then
          Begin
            q.FieldByName('sum_nn_edit').AsFloat :=
              FRound(q.FieldByName('sum_nn_edit').AsFloat + MoneyEdit,2);
            eMoneyEdit.Text := '0';
          End
          else
          Begin
            eMoneyEdit.Text := FloatToStr(q.FieldByName('sum_remain').AsFloat -
              q.FieldByName('sum_nn_edit').AsFloat);
            q.FieldByName('sum_nn_edit').AsFloat :=
              q.FieldByName('sum_remain').AsFloat;
          End;
        End// if Auto then
        else
        Begin
          MessageDlg(TranslateText('Не полностью использована оплата! Распределите остаток!'),mtWarning,[mbOk],0);
          Abort;
        End;
      End;
      q.Next;
    End;
  End;
  ModalResult := MrOk;
end;

end.
