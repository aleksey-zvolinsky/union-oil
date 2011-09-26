{******************************************************************************}
{  Предназначение : просмотр произведенных оплат клиентов и печать             }
{                   налоговых накладных по оплатам.                            }
{                                                                              }
{  Модифицирован : 3 ноября 2004 года                                          }
{******************************************************************************}
unit MoneyRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, StdCtrls, ToolEdit, Mask, Menus, Db, DBTables, Grids, DBGridEh,
  Buttons, ExtCtrls, RXCtrls, MemDS, DBAccess, Ora, ActnList, uOilQuery,
  uOilStoredProc {$IFDEF VER150}, Variants{$ENDIF};

type
  TMoneyRefForm = class(TBaseForm)
    deBeginDate: TDateEdit;
    Label1: TLabel;
    Label3: TLabel;
    ceDepName: TComboEdit;
    Label2: TLabel;
    ceOrgName: TComboEdit;
    sbOrgClear: TSpeedButton;
    sbDepClear: TSpeedButton;
    cbPayType: TComboBox;
    Label5: TLabel;
    sbPayTypeClear: TSpeedButton;
    edTaxBillNum: TEdit;
    pmPrint: TPopupMenu;
    sp1: TOilStoredProc;
    edPayNum: TEdit;
    Label4: TLabel;
    deEndDate: TDateEdit;
    Label7: TLabel;
    ceOperName: TComboEdit;
    sbOperClear: TSpeedButton;
    Label6: TLabel;
    Label8: TLabel;
    qryDog: TOilQuery;
    qChecker: TOilQuery;
    edDog: TEdit;
    LabelDog: TLabel;
    miPrintTax: TMenuItem;
    N2: TMenuItem;
    cbMoneyOut: TCheckBox;
    procedure sbPayTypeClearClick(Sender: TObject);
    procedure ceDepNameButtonClick(Sender: TObject);
    procedure ceOrgNameButtonClick(Sender: TObject);
    procedure miPrintTaxClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject); reintroduce;
    procedure sbDelClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure sbDepClearClick(Sender: TObject);
    procedure sbOrgClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ceOperNameButtonClick(Sender: TObject);
    procedure sbOperClearClick(Sender: TObject);
  private
  public
  end;

var
  MoneyRefForm: TMoneyRefForm;
  DepID, DepINST,
  OrgID, OrgINST,
  OperID: Integer;

implementation

uses ChooseOrg, Main, UDbFunc, Money, OilStd, OperTypeRef, TaxBillPrint, Math;

{$R *.DFM}

procedure TMoneyRefForm.sbPayTypeClearClick(Sender: TObject);
begin
  inherited;
  cbPayType.ItemIndex := -1;
end;

procedure TMoneyRefForm.ceDepNameButtonClick(Sender: TObject);
var vName : String;
begin
  inherited;
  if ChooseOrg.CaptureOrg(4,Main.MAIN_ID,Main.INST,'yyy',DepID,DepINST,vName) then
    ceDepName.Text:=vName;
end;

procedure TMoneyRefForm.ceOrgNameButtonClick(Sender: TObject);
var vName : String;
begin
  inherited;
  if ChooseOrg.CaptureOrg(4,0,0,'yyy',OrgID,OrgINST,vName) then
    ceOrgName.Text:=vName;
end;

procedure TMoneyRefForm.miPrintTaxClick(Sender: TObject);
var
  TaxBill : TdmTaxBill;
  strOperNum : string;
begin
  inherited;
  if q.isEmpty then
    Raise Exception.Create(TranslateText('Необходимо выбрать оплату.'));
   
  if (q.FieldByName('NN_Id').IsNull or q.FieldByName('NN_Inst').IsNull) then
    Raise Exception.Create( TranslateText('При вводе выбранной оплаты, ')+#13#10+TranslateText(' налоговая накладная не была создана.'));

  if (q.FieldByName('Sub_Type').asInteger = 101) and (q.FieldByName('cash_method').asInteger<>2 )
    then Raise Exception.Create(TranslateText('Эта налоговая накладная должна печататься из меню ')+#13#10+
                                            TranslateText('Учет - Формирование НН для клиентов по лимитной схеме'));
  if q.FieldByName('sub_type').AsInteger <> 101 then
  if GetSqlValue(
   ' select count(*) from oil_sale_book '+
   ' where id='+q.FieldByName('nn_id').AsString+
   '       and inst='+q.FieldByName('nn_inst').AsString+
   '       and state=''Y'' and nal_t in (6,7,8,9) ')  > 0
    then Raise Exception.Create(TranslateText('Эта налоговая накладная должна печататься из меню ')+#13#10+
                                            TranslateText('Учет - Формирование документов по чужим списаниям'));

  //печать нн
  if q.FieldByName('oper_id').asInteger = 31
   then strOperNum := TranslateText('Наличные')
   else strOperNum := TranslateText('Оплата с расчетного счета');
  if q.FieldByName('nal_t').AsInteger = 11 then
  Try
    TaxBill := TdmTaxBill.Create(1,1);
    TaxBill.Options.DogId := q.FieldByName('Dog_id').AsInteger;
    TaxBill.Options.DogInst := q.FieldByName('Dog_inst').AsInteger;
    TaxBill.GetTaxBillByNN(
      q.FieldByName('nn_id').AsInteger,
      q.FieldByName('nn_inst').AsInteger
      );
  Finally
    TaxBill.Free;
  End
  else
    TaxBillPrint.GetTaxBillByDog(
      q.FieldByName('nn_num').asString,
      q.FieldByName('mdate').asString,
      q.FieldByName('Dog_Id').asInteger,
      q.FieldByName('Dog_Inst').asInteger,
      strOperNum
      );
end;

procedure TMoneyRefForm.bbSearchClick(Sender: TObject);
begin
  inherited;
  q.Close;

  q.ParamByName('BeginDate').asDate := deBeginDate.Date;
  q.ParamByName('EndDate').asDate := deEndDate.Date;
  q.RestoreSQL;

  if edPayNum.Text <> '' then
  begin
    q.AddWhere(' Num like ''%'' || :Num || ''%'' ');
    q.ParamByName('num').AsString := edPayNum.Text;
  end;

  if edDog.Text <> '' then
  begin
    q.AddWhere(' dogovor like ''%'' || :dog || ''%'' ');
    q.ParamByName('Dog').AsString := edDog.Text;
  end;

  if edTaxBillNum.Text <> '' then
  begin
    q.AddWhere(' NN_Num like ''%'' || :NN_Num || ''%'' ');
    q.ParamByName('NN_Num').AsString := edTaxBillNum.Text;
  end;

  if OrgID<>-1 then
  begin
    q.AddWhere(' org_id = :org_id and org_inst = :org_inst ');
    q.ParamByName('org_id').asInteger := OrgID;
    q.ParamByName('org_inst').asInteger := OrgINST;
  end;

  if DepID<>-1 then
  begin
    q.AddWhere(' dep_id = :dep_id and dep_inst = :dep_inst ');
    q.ParamByName('dep_id').asInteger := DepID;
    q.ParamByName('dep_inst').asInteger := DepINST;
  end;

  if cbPayType.ItemIndex <> -1 then
  begin
    q.AddWhere(' cash_method = :cash_method ');
    q.ParamByName('cash_method').asInteger := cbPayType.ItemIndex;
  end;

  if OperID <> -1 then
  begin
    q.AddWhere(' oper_id = :oper_id ');
    q.ParamByName('oper_id').asInteger := OperID;
  end;
   q.ParamByName('inout').AsInteger := IfThen(cbMoneyOut.Checked,-1,1);
  _OpenQuery(q);
end;

procedure TMoneyRefForm.sbAddClick(Sender: TObject);
var
  MoneyForm:TMoneyForm;
begin
  inherited;
  MoneyForm:=TMoneyForm.Create(Application);
  MoneyForm.mode:=1;
  MoneyForm.ShowModal;
  MoneyForm.free;
  bbSearchClick(nil);
end;

procedure TMoneyRefForm.sbEditClick(Sender: TObject);
const
  eYoungerNN ='Нельзя редактировать оплату, после нее как была создана еще одна. '+#13+
              'Удалите созданную позднее оплату, чтобы редактировать эту.';
var
  MoneyForm:TMoneyForm;
  bm : TBookMark;
begin
  inherited;
  if q.isEmpty then Exit;
  bm := q.GetBookMark;
  MoneyForm:=TMoneyForm.Create(Application);
  MoneyForm.Mode:=2;
  MoneyForm.MnID:=q.fieldbyname('id').value;
  MoneyForm.MnINST:=q.fieldbyname('inst').value;
  if (q.FieldByName('INST').AsInteger<>INST ) or (q.FieldByName('MDate').asDateTime <= StrToDate(CLOSE_DATE))
  then
    MoneyForm.bbOK.Tag := 1;

  MoneyForm.ShowModal;
  if MoneyForm.modalresult=MrOk then
  begin
    bbSearchClick(nil);
    if q.BookMarkValid(bm) then q.GotoBookMark(bm);
  end;
  MoneyForm.Free;
end;

procedure TMoneyRefForm.sbDelClick(Sender: TObject);
var
 MoneyForm: TMoneyForm;
 wrnText : String;
 TaxBill : TdmTaxBill;
begin
  inherited;
  if q.isEmpty then Exit;
  if (q.FieldByName('MDate').asDateTime <= StrToDate(CLOSE_DATE))
    then Raise Exception.Create(TranslateText('Период закрыт !'));
  if (q.FieldByName('DEP_INST').AsInteger<>INST )
    then Raise Exception.Create(TranslateText('Нельзя удалить запись чужой организации !'));
  if (q.FieldByName('Oper_Id').Value=39) then
    Raise Exception.Create(TranslateText('Нельзя удалить списание !'));
  wrnText := TranslateText('Вы уверены что хотите удалить оплату?');
  if not q.FieldByName('NN_NUM').IsNull then
    wrnText := wrnText +#13#10+ TranslateText('(будет удалена налоговая накладная №') +
      q.FieldByName('nn_num').AsString +')';
  if MessageDlg(wrnText,mtCustom,[mbYes,mbNo],0)=mrNo then Exit;
  try
    StartSQL;
    with sp1 do
    begin
      MoneyForm:=TMoneyForm.Create(Self);
      if (q.FieldByName('oper_id').AsInteger=38) then
        MoneyForm.DelRemains(q.FieldByName('dep_id').AsInteger,
                      q.FieldByName('dep_inst').AsInteger,
                      q.FieldByName('org_id').AsInteger,
                      q.FieldByName('org_inst').AsInteger,
                      q.FieldByName('money_t').AsInteger,
                      q.FieldByName('money').AsFloat);
      MoneyForm.Free;

      // Удаляем налоговую
      TaxBill:= TdmTaxBill.Create;

      try
       TaxBill.DeleteSBRecords10(q.FieldByName('NN_Id').AsInteger,
                                 q.FieldByName('NN_Inst').AsInteger);
      finally
       TaxBill.Free;
      end;

      StoredProcName := 'OIL.INSORUPDOIL_MONEY';
      Prepare;
      ParamByName('ID#').AsInteger   :=q.FieldByName('id').asInteger;
      ParamByName('INST#').AsInteger :=q.FieldByName('inst').asInteger;
      ParamByName('STATE#').AsString :='N';
      ExecProc;
      wrnText := ParamByName('Result').AsString;
      if (Length(wrnText) >0 ) and ( wrnText[1] <> '0' )
        then Raise Exception.Create(SubStr(wrnText,2));
    end;
    CommitSQL;
  except On E:Exception Do
    begin
      MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
      RollbackSQL;
    end;
  end;
  bbSearchClick(nil);
end;


procedure TMoneyRefForm.bbClearClick(Sender: TObject);
begin
  inherited;
  edPayNum.Text := '';
  edTaxBillNum.Text := '';
  edDog.Text := '';
  sbDepClear.Click();
  sbPayTypeClear.Click();
  sbOrgClear.Click();
  sbOperClear.Click();  
end;

procedure TMoneyRefForm.sbDepClearClick(Sender: TObject);
begin
  inherited;
  DepId := -1;
  DepInst := -1;
  ceDepName.Text := '';
end;

procedure TMoneyRefForm.sbOrgClearClick(Sender: TObject);
begin
  inherited;
  OrgId := -1;
  OrgInst := -1;
  ceOrgName.Text := '';
end;

procedure TMoneyRefForm.FormShow(Sender: TObject);
begin
  inherited;
  bbClear.Click();  
  DepId := MAIN_ORG.ID;
  DepInst := MAIN_ORG.INST;
  ceDepName.Text := MAIN_ORG.NAME;
  deBeginDate.Date := now()-1;
  deEndDate.Date := now();
  bbSearchClick(nil);
end;

procedure TMoneyRefForm.ceOperNameButtonClick(Sender: TObject);
var
  OperTypeRefForm: TOperTypeRefForm;
begin
  inherited;
  OperTypeRefForm:=TOperTypeRefForm.Create(Self);
  try
    OperTypeRefForm.sgrpId:=OpG_OPLATA;
    OperTypeRefForm.bbClear.Enabled:=False;
    OperTypeRefForm.ShowModal;
    if (OperTypeRefForm.ModalResult=MrOk) then
    begin
      ceOperName.Text := OperTypeRefForm.q.FieldByName('name').AsString;
      OperID := OperTypeRefForm.q.FieldByName('id').AsInteger;
    end;
  finally
    OperTypeRefForm.free;
  end;
end;

procedure TMoneyRefForm.sbOperClearClick(Sender: TObject);
begin
  inherited;
  ceOperName.Text := '';
  OperID := -1;
end;

end.
