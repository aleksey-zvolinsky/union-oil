{******************************************************************************}
{  Предназначение : создание оплат клиентов и нал. накладных по ним            }
{                                                                              }
{******************************************************************************}
unit Money;

interface

uses
  Windows,
  Buttons, Classes, Controls, CurrEdit, Db, DBGrids, DBTables, Dialogs,
  ExtCtrls, Forms, Graphics, Grids, Mask, Messages, ToolEdit, StdCtrls,
  SysUtils, uMessageDlgExt, MemDS, DBAccess, Ora, uCommonForm,uOilQuery,uOilStoredProc,
  DBGridEh{$IFDEF VER150},Variants{$ENDIF};

type
  TMoneyForm = class(TCommonForm)
    lNum: TLabel;
    eNum: TEdit;
    lDate: TLabel;
    deDate: TDateEdit;
    lDepartment: TLabel;
    ceDepartment: TComboEdit;
    gbClient: TGroupBox;
      ceClient: TComboEdit;
      lBank: TLabel;
      lAccount: TLabel;
    dbgProperties: TDBGridEh;
    lOperation: TLabel;
    ceOperation: TComboEdit;
    sbOperation: TSpeedButton;
    lSum: TLabel;
    ceSum: TCurrencyEdit;
    gbContract: TGroupBox;  //договор купли-продажи
      ceContract: TComboEdit;
      sbContract: TSpeedButton;
      lContractType: TLabel;
      lvContractType: TLabel;
      gbSum: TGroupBox;//суммы
        LabelDog: TLabel;
        LabelMoney: TLabel;
        LabelNN: TLabel;
        LabelDogSum: TLabel;
        LabelMoneySum: TLabel;
        LabelNNSum: TLabel;
    gbTax: TGroupBox;  //налоговая накладная
      lTax: TLabel;
      eTax: TEdit;
      cbNoTax: TCheckBox;
    rgGoods: TRadioGroup;
    lGoalPart: TLabel;
    ceGoalPart: TComboEdit;
    sbGoalPart: TSpeedButton;
    lExchange: TLabel;
    ceExchange: TComboEdit;
    sbExchange: TSpeedButton;
    lComent: TLabel;
    mComent: TMemo;
    pButtons: TPanel;
      bbOK: TBitBtn;
      bbCancel: TBitBtn;
    dsProperties: TOraDataSource;
    qProperties: TOilQuery;
    sp1: TOilStoredProc;
    Query1: TOilQuery;
    Query2: TOilQuery;
    Query3: TOilQuery;
    clcSumma: TRxCalcEdit;
    clcKolVo: TRxCalcEdit;
    Label5: TLabel;
    gbPayType: TGroupBox;
    bbEditTax: TBitBtn;
    qGetSumNN: TOilQuery;
    qWork: TOilQuery;
    lPayType: TLabel;
    procedure bbOKClick(Sender: TObject);
    procedure ceClientButtonClick(Sender: TObject);
    procedure ceClientChange(Sender: TObject);
    procedure ceContractButtonClick(Sender: TObject);
    procedure ceContractChange(Sender: TObject);
    procedure ceDepartmentButtonClick(Sender: TObject);
    procedure ceExchangeButtonClick(Sender: TObject);
    procedure ceGoalPartButtonClick(Sender: TObject);
    procedure ceGoalPartChange(Sender: TObject);
    procedure ceOperationButtonClick(Sender: TObject);
    procedure ceSumExit(Sender: TObject);
    procedure deDateChange(Sender: TObject);
    procedure dbgPropertiesDblClick(Sender: TObject);
    procedure dbgPropertiesExit(Sender: TObject);
    procedure eNumKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgGoodsClick(Sender: TObject);
    procedure sbContractClick(Sender: TObject);
    procedure sbExchangeClick(Sender: TObject);
    procedure sbGoalPartClick(Sender: TObject);
    procedure sbOperationClick(Sender: TObject);
    procedure deDateExit(Sender: TObject);
    procedure bbEditTaxClick(Sender: TObject);
    procedure ceSumChange(Sender: TObject);
    procedure cbNoTaxClick(Sender: TObject);
  private
    function  GetNum: Integer;
    function  GetSQ: Integer;
    function  GetCause: integer;
    function  IsContractCorrect(dog_id, dog_inst: Integer): Boolean;
    function  GetIsDateCorrect: Boolean;
    function  IsOperationCorrect(q: TOilQuery): Boolean;
    function  GetIsSumCorrect: Boolean;
    function  GetIsNotOverallCostDog: Boolean;
    function  GetIsTax:Boolean;
    procedure SetRemains(pMoney: Real);
    procedure SetTakeState;

    property IsDateCorrect: Boolean read GetIsDateCorrect;
    property IsSumCorrect: Boolean read GetIsSumCorrect;
    property IsNotOverallCostDog: Boolean read GetIsNotOverallCostDog;
    property IsTax:Boolean read GetIsTax;
  public
    mode: Integer;
    JustNowRun: boolean;
    MnID, MnINST: Integer;
    procedure DelRemains(pDep_id, pDep_inst, pOrg_id, pOrg_inst,
                         pItem: Integer; pMoney: Real);
  end;

var MoneyForm: TMoneyForm;

implementation
{$R *.DFM}
uses
 Main, AddTax, ChooseOrg, DogRef, PartRef, OilStd, OperTypeRef, uXMLForm,
 SelDep, Udbplan, ExFunc, udbfunc, TaxBillPrint, MoneyFunc, MoneyRef, TaxBillEditDet;

const

 cCVsel_VacationPay = 0;
 cCVsel_Forepay     = 1;
 cCVsel_UnKnown     = -1;

 cCV_VacationPay = 'Оплата отпуска';
 cCV_Forepay     = 'Предоплата';
 cCV_UnKnown     = 'Неопределен';

 // типы целевых партий
 cGPT_Reckoning = 1; // Взаимозачет
 cGPT_Stripping = 2; // Зачистка резервуара
 cGPT_Lack      = 3; // Недостача
 cGPT_Heating   = 4; // Отопление
 cGPT_Exchange  = 5; // Бартер
 cGPT_Welfare   = 6; // Спонсорская помощь
 cGPT_Needs     = 7; // Собственные нужды
 cGPT_Coupons   = 8; // Талоны
 cGPT_Sale      = 9; // Реализация
 cGPT_Card      = 12; // Чиповые карты

 cGPT_SaleList: set of Byte =
   [cGPT_Coupons, cGPT_Sale, cGPT_Card];


 // операции
 cOpr_Closing   = 29; // Закрытие целевых
 cOpr_Reckoning = 32; // Взаимозачет
 cOpr_Exchange  = 33; // Бартер
 cOpr_Debit     = 35; // Деб. задолженность
 cOpr_DebitZero = 36; // Деб. задолженность (после обнуления)
 cOpr_Needs     = 37; // Собственные нужды
 cOpr_Remains   = 38; // Остатки целевых
 cOpr_Writting  = 39; // Списание
 cOpr_Repayment = 60; // Возврат клиенту
 cOpr_DebitBeforeAlfa = 194; // Деб. задолженность возникшая до Альфы

 cOpr_AutoList: set of Byte =
   [cOpr_Writting];
 cOpr_ClosingList: set of Byte =
   [cOpr_Reckoning, cOpr_Exchange, cOpr_Needs];
 cOpr_DebitList: set of Byte =
   [cOpr_Debit, cOpr_DebitZero, cOpr_Repayment,cOpr_DebitBeforeAlfa];
 cOpr_OnlyGoalPartList: set of Byte =
   [cOpr_Closing, cOpr_Remains];

 cWrn_Title = 'ВНИМАНИЕ!'+#13;
 cfrm_Wrn_DeleteTax =
   '  Ранее созданая налоговая накладная №%s будет удалена.'+#13+
   '  Возможные причины:'+#13+
   '  - не выбран договор купли-продажи,'+#13+
   '  - изменен тип договора купли-продажи,'+#13+
   '  - выбрана опция: Выписать позже.'+#13+#13+
   'Продолжить?';
 cfrm_Wrn_InAutoList =
   '  Ручной ввод операции невозможен'+#13+
   '  (%s).';
 cWrn_Client =
   '  Названия выбранной организации-покупателя'+#13+
   '  и по договору купли-продажи не соответствуют.'+#13+
   'Заменить значение, согласно договора?';
 cWrn_Date =
   '  Договор является первичным документом,'+#13+
   '  дата оплаты не должна превышать дату из договора !';
 cWrn_Department =
   '  Текущее подразделение не заключало'+#13+
   '  выбранный договор купли-продажи.';
 cWrn_InClosingList =
   '  Необходимо использовать операцию'+#13+
   '  "Закрытие целевой партии"'+#13+
   '  и определить тип целевой партии.';
 cWrn_InDebitList =
   '  Нельзя выбрать тип целевой партии'#13 +
   '  для операций дебиторской задолжености.';
 cWrn_Money =
   '  Значение суммы оплаты не соответствует'#13 +
   '  значению суммы по договору купли-продажи.'#13 +
   'Заменить значение, согласно договора?';
 cWrn_ZeroDog =
   '  Сумма по договору равна нулю!'#13 +
   '  Выберете, пожалуйста, другой договор.';

var
 SearchDepID, SearchDepInst: Integer;
 OrgOutId, OrgOutInst, OrgOutType, Sub_type, ForePay: Integer;
 oper_id, ShareID: Integer;
 dog_id, dog_inst: Integer;
 dog_date: TDateTime;
 Dog_Type: string;
 nn_id, nn_inst: Integer;
 gpart_id, part_id, part_inst: Integer;
 sum, nds, NNSum, MoneySum: double; //реально существующие суммы
 LastNN,CurNNDate: TDate;
 NNSumOut, MoneySumOut : double; //реально существующие суммы без редактируемой записи
 mes: string;
 SumNN, SumNNEdited: real;
 IsEditClick : boolean;
 TaxBill : TdmTaxBill;

function TMoneyForm.GetCause: integer;
//берем OIL_CAUSE_ID в зависимости от условия
begin
  if(dog_type='K')and(sub_type=101)then//ЛС
    Result := 6
  else if(dog_type='K')then  // долгострочные по ЭК
    Result := 5
  else if dog_type='S' then     //услуги
    Result := 2
  else if dog_type='N' then  //отпуск с НБ
    Result := 3
  else if dog_type='Y' then  //талоны
    Result := 1
  else
    Result := 111
end;

function TMoneyForm.GetIsNotOverallCostDog: boolean;
//проверяем возможность создавать НН на не полную стоимость договора
const
  cNotOverallCostDog: set of char =
    ['Y','N','S'];
begin
  if trim(dog_type) = '' then
    Result := false
  else
  begin
    Result := dog_type[1] in cNotOverallCostDog;
    if (dog_type='K')and(OrgOutType<>4)and(sub_type<>101) then
      Result := True;
  end;
end;

function TMoneyForm.GetIsTax: boolean;
//будет ли НН
begin
  result :=(gbTax.Enabled)and(not cbNoTax.Checked)and(cbNoTax.Enabled);
end;

procedure TMoneyForm.DelRemains(pDep_id, pDep_inst, pOrg_id, pOrg_inst,
                                pItem: Integer; pMoney: Real);
begin
  SearchDepID  :=pDep_id;
  SearchDepInst:=pDep_inst;
  OrgOutId  :=pOrg_id;
  OrgOutInst:=pOrg_inst;
  rgGoods.ItemIndex:=pItem;
  SetRemains(pMoney);
end;

function TMoneyForm.GetNum: Integer;
begin
  Result := 1 + StrToInt(VarToStr(GetSqlValueParSimple('select nvl(max(num),0) as val from oil_money where state=''Y'' and mdate=:mdate ',
    ['mdate',deDate.Date])));
end;

function TMoneyForm.GetSQ: Integer;
begin
  Result:=GetSeqNextVal('s_oil_money');
end;

// функция IsContractCorrect, проверяет:
//  1) соответствие выбранного подразделения и подразделения согласно договора
//  2) если выбран клиент, проверяется и его соответствие
function TMoneyForm.IsContractCorrect(dog_id, dog_inst: Integer): Boolean;
const
  cfrm_SQL_ContractType =
   'SELECT d.from_, d.from_inst, d.to_, d.to_inst, o.name, ' +
//   ' ROUND(d.price*d.count_,2)+ROUND(ROUND(d.price*d.count_,2)/5,2) AS money, ' +
   ' ROUND(d.price*d.count_,2)+ROUND(NDS.GetNDS_NoNDS( ROUND(d.price*d.count_,2),d.dog_date ),2) AS money, ' +
   ' d.forepay ' +
   'FROM oil_dog d, v_org o ' +
   'WHERE d.id = %d and d.inst = %d ' +
   ' AND d.to_ = o.id and d.to_inst = o.inst';
  get_sum =
    'SELECT decode(detail.share_id,' + #13#10 +
    '              null,' + #13#10 +
    '              SUM(ROUND(detail.price_nds * NVL(detail.litr, 1), 2)),' + #13#10 +
    '              NVL(SUM(ROUND(detail.summ_nds, 2)), 1))' + #13#10 +
    '  FROM v_oil_dog_full detail' + #13#10 +
    ' WHERE detail.dog_id = :id' + #13#10 +
    '   AND detail.dog_inst = :inst' + #13#10 +
    ' GROUP BY detail.share_id';
begin
 try

  if Query3.Active then Query3.Close;
  Query3.SQL.Text:= get_sum;
  _OpenQueryPar(Query3,
    ['id',dog_id,
     'inst',dog_inst]);


   if (nvl(GetSqlValue(format('select dog_type from oil_dog where id=%d and inst=%d',[dog_id, dog_inst])),'!') <> 'V') and (mround(Query3.Fields[0].AsFloat, 2) = 0)
   then
   begin
    ShowMessage(cWrn_Title + cWrn_ZeroDog);
    Abort;
   end;


  with Query2 do
   begin
    if Active then Close;
    SQL.Text:= Format(cfrm_SQL_ContractType, [dog_id,dog_inst]);
    Open;
   end;

  // проверка подразделения
  Result:= (SearchDepID = Query2.FieldByName('from_').AsInteger) and
           (SearchDepINST = Query2.FieldByName('from_inst').AsInteger);

  if (not Result) then
   ShowMessage(cWrn_Title + cWrn_Department)
  else
   begin
    // проверка клиента
    Result:=(OrgOutId = Query2.FieldByName('to_').AsInteger) and
            (OrgOutInst = Query2.FieldByName('to_inst').AsInteger);

    with Application do
     if (not Result) and ((OrgOutid<>-1) and
                          (MessageBox(cWrn_Title + cWrn_Client, @Title[1], mb_YesNo) = IDYes) or
        (OrgOutid=-1)) then
     begin
      OrgOutId:= Query2.FieldByName('to_').AsInteger;
      OrgOutInst:= Query2.FieldByName('to_inst').AsInteger;
      ceClient.Text:= Query2.FieldByName('name').AsString;
      Result:= True;
     end;
   end;
 except
  on EAbort do Result:= false;
 end;
end;

function TMoneyForm.GetIsDateCorrect: Boolean;
begin
Result:=(dog_id=-1) or (dog_date<=deDate.Date);
if (Result) then mes:=''
 else mes:=cWrn_Title+cWrn_Date;
end;

// функция IsOperationCorrect проверяет
// правильность заполнения поля Операция
function TMoneyForm.IsOperationCorrect(q: TOilQuery): Boolean;
var
 vOper_id: Integer;
begin
Result:=True;
vOper_id:=q.FieldByName('id').AsInteger;
mes:='';
// операция Остатки деб. задолженности
// сбрасывает поле договор
if (vOper_id in cOpr_DebitList) then
 begin
 if (dog_id<>-1) then sbContract.Click;
 if (not(gPart_id in cGPT_SaleList)) then sbGoalPart.Click;
 end;
// операции Взаимозачет, Закрытие по бартер и т.д.
// нужно оформлять через операцию Закрытие целевых партий
if (vOper_id in cOpr_ClosingList) then
 begin
 Result:=q.Locate('id',cOpr_Closing,[]);
 mes:=cWrn_Title+cWrn_InClosingList;
 end; // if (vOper_id in cClosingList) then
// операция Списание на целевую партию и т.д.
// нельзя вводить руками
if (vOper_id in cOpr_AutoList) then
 begin
 Result:=False;
 mes:=cWrn_Title+Format(cfrm_Wrn_InAutoList,[q.FieldByName('name').AsString]);
 end; // if (vOper_id in cAutoList) then
end;

function TMoneyForm.GetIsSumCorrect: Boolean;
begin
  Result:=True;
  if (oper_id in cOpr_DebitList+cOpr_AutoList) then
  Begin
    ceSum.Value := -Abs(ceSum.Value);
    bbEditTax.Enabled := False;
  End
  else
    ceSum.Value:=Abs(ceSum.Value);
end;

procedure TMoneyForm.SetRemains(pMoney: Real);
const
  cfrm_selectSQL_Remains =
    'select id, inst'+#13+
    'from oil_money'+#13+
    'where dep_id   = %d'+#13+
    '  and dep_inst = %d'+#13+
    '  and org_id   = %d'+#13+
    '  and org_inst = %d'+#13+
    '  and oper_id = %d'+#13+
    '  and money_t = %d'+#13+
    '  and state = ''Y''';
  cfrm_insertSQL_Remains =
    'insert into oil_money'+#13+
    '(id, inst, state, num, mDate, dep_id, dep_inst, org_id, org_inst,'+#13+
    ' oper_id, money, money_t)'+#13+
    'values(%d, %d, ''Y'', %d, ''%s'', %d, %d, %d, %d, %d, %s, %d)';
  cfrm_updateSQL_Remains =
    'update oil_money'+#13+
    'set money=money+%s'+#13+
    'where id   = %d'+#13+
    '  and inst = %d';
var
 p, rCount, rNum, Remains_id, Remains_inst: Integer;
 sMoney: string;
begin
  sMoney:=FormatFloat('0.00',pMoney);
  p:=Pos(',',sMoney);
  if (p>0) then sMoney[p]:='.';
  if (Query2.Active) then Query2.Close;
  Query2.SQL.Text:=
    Format(cfrm_selectSQL_Remains,[SearchDepID,SearchDepINST,
                                   OrgOutId,OrgOutInst,
                                   cOpr_Writting,rgGoods.ItemIndex]);
  Query2.Open;
  rCount:=Query2.RecordCount;
  if (rCount=0) then
  begin
    Remains_id  :=GetSQ;
    Remains_inst:=INST;
  end
  else
  begin
    Remains_id  :=Query2.FieldByName('id').AsInteger;
    Remains_inst:=Query2.FieldByName('inst').AsInteger;
  end;
  rNum:=GetNum;
  Query2.Close;
  if (rCount=0) then
    Query2.SQL.Text:=
      Format(cfrm_insertSQL_Remains,[Remains_id,Remains_inst,rNum,
                                    deDate.Text,SearchDepID,SearchDepInst,
                                    OrgOutId,OrgOutInst,cOpr_Writting,
                                    sMoney,rgGoods.ItemIndex])
  else
    Query2.SQL.Text:=
      Format(cfrm_updateSQL_Remains,[sMoney,Remains_id,Remains_inst]);
  Query2.ExecSQL;
end;

procedure TMoneyForm.SetTakeState;
begin
 bbOK.Enabled:=(pos(','+IntToStr(SearchDepInst)+',',Inst_List)>0)
                and (deDate.date>StrToDate(CLOSE_DATE));
 bbOK.Visible:=not(oper_id in cOpr_AutoList);
end;

//----------------------------------------------------------------------
//
//
//
//----------------------------------------------------------------------

procedure TMoneyForm.bbOKClick(Sender: TObject);
const
  eNoParams = 'Не все параметры определены !';
  eDate     = 'Договор является первичным документом,'+#13+
             'дата оплаты не должна превышать дату из договора !';
  eExchange = 'Не определена бартерная партия !';
  eDebitor  = 'Значение поля Сумма должно быть <0 !';
  eGoalPart = 'Не определена целевая партия!';
  eSumOther = 'Сумма введенной оплаты не совпадает с суммой по договору купли-продажи.'+#13 +
             'Налоговая накладная не будет создана, а уже существующая - будет удалена.'+#13 +
             'Вы хотите принять данную оплату?';
  eExistNN  = 'Нельзя создать налоговую, для данного договора она уже создана!' + #13 +
             'Для просмотра существующей зайдите в "Книгу учета продаж".';
  eDateNN   = 'Нельзя создавать/редактировать оплату, по которой создана НН и '+
             'позже которой созданы другие НН.'+#13+'Вначале удалите НН по этому '+
             'договору, созданные позже.';
  eSumNN    = 'Невозможно создать налоговую по текущему договору, сумма по налоговым превышает сумму договора.';
var
  mId, mInst, iCntRecs: Integer;
  nds_in: Double;
  Res,sTax, TaxBillNumber, FRASCH: string;
  MissIt, flCardFound: boolean; // флаг, чтобы пропустить ненужный вопрос про НН :)
begin
  if dog_id = -1 then
    if MessageDlg('Не выбран договор. Отменить операцию?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      exit;

  if (Part_id<>-1) and (Part_inst<>-1) and
     (GetQValueByIdInst( 'state', 'oil_part', Part_id, Part_Inst)='N')
  then
  Begin
    ShowMessage(TranslateText('Во время редактирования этой оплаты была удалена(или синхронизирована) партия.')+#13#10+
                TranslateText('Нажмите ОТМЕНА и отредактируйте партию.'));
    Exit;
  End;

  if (eNum.Text='') or (deDate.Date=0) or (ceDepartment.Text='') or
     (ceClient.Text='') or (Oper_id=-1) or (ceSum.Value=0) then
    Raise Exception.Create(eNoParams);

  if (Length(ceContract.Text)>0) and (dog_date>deDate.Date) then
    Raise Exception.Create(eDate);

  if (dog_id <> -1) and not (((Dog_Type = 'K') and (sub_type = 101) and (ForePay = 0)) or (Dog_Type = 'V')) then
    if MRound(Sum, 2) < MRound(MoneySumOut + ceSum.Value, 2) then
    begin
      MessageDlg(TranslateText('Сумма по оплатам больше чем сумма по договору купли-продажи!') +#13#10+
                 TranslateText('  Вариант 1. Увеличить сумму по договору купли-продажи.') +#13#10+
                 TranslateText('  Вариант 2. Разделить данную оплату на несколько оплат.'), mtError, [mbOk], 0);
      Exit;
    end;

  if (NNSumOut = sum) and IsTax and IsNotOverallCostDog then
  begin
    MessageDlg(eSumNN,mtInformation , [mbOk], 0);
    cbNoTax.Checked := True;
    Exit;
  end;
  MissIt := false;
  if  (OrgOutType<>4) and (sub_type <> 101)  then
  begin
    if ( (gbTax.Enabled) and (Length(ceContract.Text) > 0) and (mround(ceSum.Value, 2) <> mround(sum + nds, 2)) )then  //sum это сума по договору
      if not(  (IsNotOverallCostDog) )
      then if MessageDlg(eSumOther{НН не будет},mtConfirmation, [mbYes,mbNo], 0) = mrYes then
      begin
        gbTax.Enabled := false;
        bbEditTax.Enabled := False;
        MissIt:= true;
      end
      else
        Exit;
  end;
  case oper_id of
    29: // закрытие целевых партий
      begin
        if (gPart_id=-1) then
          raise Exception.Create(eGoalPart);
        // закрытие по бартеру, нужно выбрать бартерную партию
        if (gPart_id=cGPT_Exchange) and (part_id=-1) then
          raise Exception.Create(eExchange);
      end; // 29:
    33: // закрытие по бартеру, нужно выбрать бартерную партию
      if (part_id=-1) then
        raise Exception.Create(eExchange);
    35, 36, 194: // остатки дебиторской задолжености, сумма <0
      if (ceSum.Value>0) then
        raise Exception.Create(eDebitor);
    38: // остатки целевой дебиторки
      if (gPart_id=-1) then
        raise Exception.Create(eGoalPart);
  end;
  //----------------------------------------------------------------------------
  // создаем НН-ую на не полную стоимость
  // при этом делим пункты договора по НН
  if (IsNotOverallCostDog) then
    MissIt := True;
  if(IsTax)then
    // сумма по налоговым не должна привышать сумму по дог. если NNSumOut = sum, то нужное кол. НН уже создано
    if(NNSumOut < sum) and (IsNotOverallCostDog) then
    begin
      if (LastNN > deDate.Date) then
        Raise Exception.Create(eDateNN);
      try
        if(TaxBill = nil) or (SumNNEdited = 0)then
          TaxBill := TdmTaxBill.Create(OrgOutId,OrgOutInst);
          // задаем параметры НН
        TaxBill.Options.Date := DateToStr(deDate.Date);
        TaxBill.Options.DogId := dog_id;
        TaxBill.Options.DogInst := dog_inst;
        TaxBill.Options.TaxBillType := 11;
        TaxBill.Options.OIL_NN_Type := 1;
        TaxBill.Options.OIL_NN_Cause := GetCause;
        case dog_type[1] of
          'Y': TaxBill.Options.Scheme := Talon;
          'S': TaxBill.Options.Scheme := Service;
          'N': TaxBill.Options.Scheme := NB;
          'K': TaxBill.Options.Scheme := EK;
        end;
        TaxBill.Options.TaxBillInst := dog_inst;
        if oper_id = 31{оплата по кассе - форма расхода наличные} then
          FRASCH := TranslateText('Наличные')
        else
          FRASCH := TranslateText('Оплата с р/с');
        TaxBill.Options.OperName := FRASCH;
        //Эта строка нужна, только если заглючит ТаксБилл... Но это бутафория :-), для карточных договоров это НЕ правильно!
        //TaxBill.Options.ByDogName := TranslateText('Согласно договора № ')+ceContract.Text+TranslateText(' от ')+FormatDateTime2('dd.mm.yyyy', Dog_Date);
        if ( (eTax.Text <> '') and (nn_id <> -1) and (nn_id <> -1) )then
        Begin
          TaxBill.Options.Num := eTax.Text;
          TaxBill.Options.TaxBillId := nn_id;
          TaxBill.Options.TaxBillInst := nn_inst;
        End;
        // Если договор акционный, то НН должна создасться согластно договора - на всю стоимость
        if (ShareID <> 0) then
        begin
          qWork.Close;
          qWork.SQL.Text :=
            'SELECT np_type, dim_id, price2, price, count_, summ_nds, summ_x_nds FROM oil_dog_detail d' +
            ' WHERE dog_id = :dog_id and dog_inst = :dog_inst and state = ''Y'' ORDER BY id';
          _OpenQueryPar(qWork, ['dog_id', dog_id, 'dog_inst', dog_inst]);
          repeat
            TaxBill.AddPosition(
              qWork.FieldByName('np_type').AsInteger,
              qWork.FieldByName('dim_id').AsInteger,
              DateToStr(deDate.Date),
              qWork.FieldByName('count_').AsFloat,
              qWork.FieldByName('price2').AsFloat,
              qWork.FieldByName('summ_nds').AsFloat,
              qWork.FieldByName('summ_x_nds').AsFloat);
            qWork.Next;
          until qWork.Eof;
          SumNNEdited := ceSum.Value;
        end
        else if ((SumNNEdited = 0) and not IsEditClick) or IsEditClick
        then
          SumNNEdited := TaxBill.Edit(Not(IsEditClick), ceSum.Value)
      finally
        if not(IsEditClick) then
        Begin
          //грохаем детализацию НН т.к. по мейку она не заменяеться, добавляеться
          if (not (eTax.Text = '')) then
            TaxBill.DeleteSBRecordsDet(nn_id, nn_inst, TaxBill.Options.TaxBillType);
          if TaxBill.Options.Scheme = EK then
          begin
            //текущий договор не должен браться
            TaxBill.Options.DogId := 0;
            TaxBill.Options.DogInst := 0;
          end;
          TaxBill.Make(False);

          if (not (eTax.Text = '')) then
            sTax:=Format(cfrm_Msg_EditTax,[TaxBill.Options.Num +
              TranslateText(' на сумму ') + FloatToStr(FRound(SumNNEdited,2))+TranslateText(' грн.')])
          Else
            sTax:=Format(cfrm_Msg_AddTax,[TaxBill.Options.Num +
              TranslateText(' на сумму ') + FloatToStr(FRound(SumNNEdited,2)) + TranslateText(' грн.')]);
          eTax.Text := TaxBill.Options.Num;
          nn_id := TaxBill.Options.TaxBillId;
          nn_inst := TaxBill.Options.TaxBillInst;
          TaxBill.free;
          MissIt:=true;
        End;
      End;//finally
      if IsEditClick then exit;
    End;
  //----------------------------------------------------------------------------
  if not MissIt then
    if (nn_id<>-1) and
      (Not IsTax)and
      (MessageDlg(cWrn_Title+Format(cfrm_Wrn_DeleteTax,[eTax.Text]),mtCustom,[mbYes,mbNo],0)=mrNo)
    then
      Exit;
  try
    StartSQL;
    with sp1 do
    begin
      case mode of
        1: // добавить новуюif mode=1 then
         begin
           mId := GetSQ;
           mInst := INST;
           StoredProcName := 'OIL.INSORUPDOIL_MONEY';
         end; // 1:
        2: // редактировать
         begin
           mId:=query1.FieldByName('id').AsInteger;
           mInst:=query1.FieldByName('inst').AsInteger;
           StoredProcName := 'OIL.INSORUPDOIL_MONEY';
         end; // 2:
      end; // case mode of
      Prepare;
      ParamByName('ID#').AsInteger  := mId;
      ParamByName('INST#').AsInteger := mInst;
      ParamByName('STATE#').AsString := 'Y';
      ParamByName('NUM#').AsInteger := StrtoInt(eNum.Text);
      ParamByName('MDATE#').AsDate := deDate.Date;
      ParamByName('DEP_ID#').AsInteger := SearchDepID;
      ParamByName('DEP_INST#').AsInteger := SearchDepINST;
      ParamByName('ORG_ID#').AsInteger := OrgOutId;
      ParamByName('ORG_INST#').AsInteger := OrgOutInst;

      if (qProperties.FieldByName('id').Value <> NULL) then
      begin
        ParamByName('REKV_ID#').AsInteger   := qProperties.FieldByName('id').AsInteger;
        ParamByName('REKV_INST#').AsInteger := qProperties.FieldByName('inst').AsInteger;
      end;
      ParamByName('OPER_ID#').AsInteger := Oper_ID;
      ParamByName('MONEY#').AsFloat     := ceSum.Value;
      if (dog_id<>-1) then
      begin
        ParamByName('DOG_ID#').AsInteger   := dog_id;
        ParamByName('DOG_INST#').AsInteger := dog_inst;
      end; // if (dog_id<>-1) then

       //если договор с одной позицией
      if  (Sub_type = 101) and (Dog_Type = 'K') then
      begin
        qWork.Close;
        qWork.SQL.Text :=
         'SELECT np_type FROM oil_dog_detail d' +
         ' WHERE dog_id = :dog_id and dog_inst = :dog_inst and state = ''Y'' ORDER BY id';
       _OpenQueryPar(qWork, ['dog_id', dog_id, 'dog_inst', dog_inst]);
        flCardFound := false;
        iCntRecs :=0;
        while not qWork.eof do
        begin
          if (qWork.Fields[0].asInteger=455) and (not flCardFound) then
            flCardFound := true;
          inc(iCntRecs);
          qWork.Next;
        end;
        if (iCntRecs > 1) and (flCardFound)
        then
          raise Exception.Create(TranslateText('Для лимитной схемы продажа смарт-карт и продажа топлива')+#13#10+
            TranslateText('должна быть в разных договорах '));
        if (iCntRecs=1) and (flCardFound) then
          ParamByName('CASH_METHOD#').AsInteger := 2;
      end;

      // если НН по не полной стоимости, то НН уже создана
      if not IsNotOverallCostDog
        and ((OrgOutType = 4) and (Dog_Type = 'K') and (deDate.Date >= VarToDateTime(OBL_CARD_START_DATE)))
        or ((Sub_type = 101) and (Dog_Type = 'K') and  not flCardFound and IsTax) then // Резервировать налоговую для ЛС
      begin
        nn_inst := mInst;
        TaxBillNumber := eTax.Text;
        //новая налоговая накладная
        if (Mode = 1) or ( (Mode = 2) and (eTax.Text='') )then
        begin
          nn_id := GetSeqNextVal('s_oil_sale_book');
          TaxBillNumber := MainForm.GetNextNNNumber(deDate.Date);
          ShowMessage(TranslateText('Зарезервирована налоговая накладная №')+TaxBillNumber);
        end;
        _ExecProc('OIL.INSORUPDOIL_SALE_BOOK',
               ['ID#',         nn_id,
                'STATE#',      'Y',
                'INST#',       mInst,
                'S_DATE#',     deDate.Date,
                'ORGAN#',      OrgOutId,
                'ORGAN_INST#', OrgOutInst,
                'NUM#',        TaxBillNumber,
                'F_DOC#',      TranslateText('Согласно договора № ')+ceContract.Text+TranslateText(' от ')+FormatDateTime2('dd.mm.yyyy', Dog_Date),
                'FRASCH#',     TranslateText('Оплата с р/с, п.п.№ ')+eNum.Text,
                'R_DATE#',     deDate.Date,
                'SALE_TXT#',   TranslateText('Оплата с р/с'),
                'FROM_#',      SearchDepId,
                'FROM_INST#',  SearchDepInst,
                'NAL_T#',      6,
                'NN_CAUSE_ID#', GetCause,
                'NN_TYPE_ID#',  1],TRUE);
        ParamByName('NN_ID#').Value := nn_id;
        ParamByName('NN_INST#').Value := nn_inst;
      end
      else
      begin
        dmAT:=TdmAddTax.Create(Application);
        if (nn_id<>-1) then
          if Not(IsTax) then
             // Удаляем налоговую
          begin
            TaxBill:= TdmTaxBill.Create;
            try
              TaxBill.DeleteSBRecords10(nn_id, nn_inst);
            finally
              TaxBill.Free;
            end;
            nn_id := -1;
            nn_inst := -1;
            sTax:=Format(cfrm_Msg_DeleteTax,[eTax.Text]);
          end
          else //  if Not(IsTax)
          begin   // изменить НН
            if not(IsNotOverallCostDog) then
              sTax:=Format(cfrm_Msg_EditTax,[eTax.Text]);
          end
        else if(IsTax)then
        begin          // новая НН
           nn_id := dmAT.GetNextTaxId;
           nn_inst := INST;
           eTax.Text:= MainForm.GetNextNNNumber(deDate.Date);
           sTax:=Format(cfrm_Msg_AddTax,[eTax.Text]);
        end; // if (gbTax.Enabled) and (not cbTax.Checked) then
        if (nn_id<>-1) and not(IsNotOverallCostDog)then
        begin
          nds_in := mRound(GetNDS_WithNDS(ceSum.Value,deDate.Date),2);
          dmAT.WriteNN(SearchDepID,SearchDepInst,OrgOutId,OrgOutInst,nn_id,nn_inst,
                         ceSum.Value - nds_in, nds_in, ceSum.Value,
                         eTax.Text,cDog+ceContract.Text,ceOperation.Text,'',
                         deDate.Date,4,GetCause,1);
          sTax:=Format(cfrm_Msg_EditTax,[eTax.Text]);
          ParamByName('NN_ID#').AsInteger  := nn_id;
          ParamByName('NN_INST#').AsInteger := nn_inst;
        end; // if (nn_id<>-1) then
        dmAT.Free;
      end;
      if(IsTax)then
        if(IsNotOverallCostDog)and( (nn_id<>-1)and(nn_inst<>-1) )then//если НН по не полной стоимости то НН уже создана
        begin
          ParamByName('NN_ID#').AsInteger   := nn_id;
          ParamByName('NN_INST#').AsInteger := nn_inst;
        end;
      ParamByName('MONEY_T#').AsInteger := rgGoods.ItemIndex;
      if (gpart_id<>-1) then
        ParamByName('GOAL_PART_TYPE#').AsInteger := gpart_id;

      if (part_id<>-1) then
      begin
        ParamByName('PART_ID#').AsInteger   := Part_id;
        ParamByName('PART_INST#').AsInteger := Part_inst;
      end; // if (part_id<>-1) then
      ParamByName('TEXT#').AsString := mComent.Text;
      ExecProc;

      if (oper_id=cOpr_Remains) then
        case mode of
           1: SetRemains(-ceSum.Value);
           2: SetRemains(-ceSum.Value+Query1.FieldByName('money').AsFloat);
        end; // case mode of

      Res := ParamByName('Result').AsString;
      if (Length(Res)>0) and (Res[1]<>'0') then
        raise Exception.Create(SubStr(Res,2));
      CommitSQL;
      ModalResult:=MrOk;
          // Сообщение: добавлена/отредактированна/удалена НН №...
      if (Length(sTax)>0) then
        MessageDlg(sTax,mtCustom,[mbOk],0);
    end; // with sp1 do
  except On E:Exception Do
  begin
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
    RollbackSQL;
  end; // except
  end; // try  except
end;

procedure TMoneyForm.ceClientButtonClick(Sender: TObject);
var vName: string;
   // vType: integer;
    qDog:TOilQuery;
begin
   if ChooseOrg.CaptureOrgT(4,0,0,'yyy',OrgOutId,OrgOutInst,vName,OrgOutType) then begin
      ceClient.Text:=vName;
      if OrgOutType=4 then begin
         InitQuery(qDog);
         qDog.Sql.Text:=
            ' select * from oil_dog '+
            ' where Dog_Date='+
                 '(select min(Dog_Date) from oil_dog '+
                 ' where state = ''Y'' and to_ = '+IntToStr(OrgOutId)+' and to_inst = '+IntToStr(OrgOutInst)+
                 '       and dog_type = ''K'') '+
            '       and to_='+IntToStr(OrgOutId)+' and to_inst='+IntToStr(OrgOutInst)+
            '       and state=''Y'' and dog_type=''K'' ';
         _OpenQuery(qDog);
         if qDog.RecordCount=0 then ShowMessage(TranslateText('Внимание! С этим облом не найден долгосрочный договор по карточкам!'))
         else begin
             Dog_Id:=qDog.FieldByName('id').AsInteger;
             Dog_Inst:=qDog.FieldByName('inst').AsInteger;
             ShareID := qDog.FieldByName('Share_ID').AsInteger;
             ceSum.Enabled := ShareID = 0;
             Dog_Date:=qDog.FieldByName('dog_date').AsDateTime;
             Dog_Type:='K';
             gbTax.Enabled:=TRUE;
             cbNoTax.Checked:=FALSE;
             cbNoTax.Enabled:=FALSE;
             ceContract.Text:=qDog.FieldByName('dog').AsString;
         end;
         qDog.Free;
      end else sbContract.Click;
   end;
end;

procedure TMoneyForm.ceClientChange(Sender: TObject);
begin
  if (OrgOutId=-1) then Exit;
  qProperties.Close;
  qProperties.ParamByName('p_OrgId').Value:=OrgOutId;
  qProperties.ParamByName('p_OrgInst').Value:=OrgOutInst;
  qProperties.Open;
end;

procedure TMoneyForm.ceContractButtonClick(Sender: TObject);
var
 v_id, v_inst: Integer;
 vContract,v_type: string;
 vDate: TDateTime;
 v_sub_type, v_ForePay, v_ShareID: Integer;
begin
 v_id:=-1;
 // справочник договоров купли-продажи
 DogRefForm:= TDogRefForm.Create(Application);
 try
  if (DogRefForm.ShowModal = mrOK) then
   begin
    v_id:= DogRefForm.q.FieldByName('id').AsInteger;
    v_inst:= DogRefForm.q.FieldByName('inst').AsInteger;
    v_type:= DogRefForm.q.FieldByName('dog_type').AsString;
    vDate:= DogRefForm.q.FieldByName('dog_date').AsDateTime;
    vContract:= DogRefForm.q.FieldByName('dog').AsString;
    v_sub_type := DogRefForm.q.FieldByName('Sub_type').AsInteger;
    v_ForePay := DogRefForm.q.FieldByName('ForePay').AsInteger;
    v_ShareID := DogRefForm.q.FieldByName('Share_ID').AsInteger;
   end;
 finally
  DogRefForm.Free;
 end;

 // проверка договора на корректность и занесение данных по нему в переменные
 if (v_id <> -1) and (IsContractCorrect(v_id,v_inst))  then
  begin
   dog_id:= v_id;
   dog_inst:= v_inst;
   ShareID := v_ShareID;
   ceSum.Enabled := ShareID = 0;
   dog_type:=v_type;
   dog_date:= vDate;
   sub_type := v_sub_type;
   ForePay := v_ForePay;
   ceContract.Text:= vContract;
  end;
end;

procedure TMoneyForm.ceContractChange(Sender: TObject);
const get_sum = 'SELECT NVL(SUM(ROUND(summ_nds, 2)), 1) ' +
                'FROM oil_dog_detail ' +
                'WHERE dog_id = %d AND dog_inst = %d AND state=''Y'' ';

      get_dt =  'SELECT np_type.grp_id       ' +
                'FROM oil_dog_detail detail, ' +
                ' oil_np_type np_type        ' +
                'WHERE                       ' +
                ' detail.dog_id = %d         ' +
                'AND detail.dog_inst = %d    ' +
                'AND detail.np_type = np_type.id';

      get_money = ' SELECT              ' +
                  '       SUM(M.MONEY)    ' +
                  ' FROM                ' +
                  '     OIL_MONEY M     ' +
                  ' WHERE               ' +
                  '      M.dog_id = %d   ' +
                  '  AND M.dog_inst = %d ' +
                  '  AND M.state = ''Y'' ' +
                  '  and not (M.id = %d  ' +
                  '      and M.inst = %d )   ';
      get_nn_date =
        'select s.s_date from OIL_SALE_BOOK s ' +
        'where s.id = %d and s.inst = %d';
var
  ind: Integer;
  dt: boolean; // если договор содержит только группу ДТ - то выставляем этот флажок
begin
  SumNNEdited := 0;
  LabelDog.Visible:=True;
  LabelMoney.Visible:=True;
  LabelDogSum.Visible:=True;
  LabelMoneySum.Visible:=True;
  if (OrgOutType=4) and (Dog_Type='K') then
  begin
    lvContractType.Visible:=TRUE;
    lvContractType.Caption:=TranslateText('Долгосрочный по эл.картам');
    LabelDog.Visible:=FALSE;
    LabelMoney.Visible:=FALSE;
    LabelDogSum.Visible:=FALSE;
    LabelMoneySum.Visible:=FALSE;
    gbTax.Enabled:=TRUE;
    exit;
  end
  else
  begin
    LabelDog.Visible:=TRUE;
    LabelMoney.Visible:=TRUE;
  end;
  // Договор по картам лимитной схемы
  if (Dog_Type = 'K') and (Sub_Type = 101) then // ЛС
  begin
    gbSum.Visible := FALSE;
    if ForePay = 0 then
    begin
      lvContractType.Visible := TRUE;
      lvContractType.Caption := TranslateText('Договор карт ЛС (послеоплата)');
      ceSum.Value := 0;
      gbTax.Enabled := true;
      exit;
    end;
  end;

 // значение тип договора актуален если договор выбран
 lvContractType.Visible:=Length(ceContract.Text)>0;

 // договор не выбран, не нужны проверки
 if (lvContractType.Visible) then
  begin
   // название подписавшей организации не корректно
   if (not IsContractCorrect(dog_id, dog_inst)) then
    begin
     sbContract.Click;
     ShowMessage(cWrn_Title+cWrn_Department);
     Exit;
    end;

   // проверка соответствия параметров договора и оплаты
   //if Sub_type <> 101 then
   case Query2.FieldByName('forepay').AsInteger of
    cCVsel_VacationPay:
     begin
       ind:= cCVsel_VacationPay;
       lvContractType.Caption := cCV_VacationPay
     end;
    cCVsel_Forepay:
     begin
      ind:= cCVsel_Forepay;
      if Sub_type <> 101
         then lvContractType.Caption := cCV_ForePay
         else lvContractType.Caption := TranslateText('Договор карт ЛС (предоплата)');
     end;
   else
    begin
     ind:= cCVsel_UnKnown;
     lvContractType.Caption:= cCV_UnKnown;
    end;
   end;

   with Query3 do
    begin
     // Получаем сумму по договору и заносим в сумму оплаты - суммы по налоговым
     if Active then Close;
     SQL.Text:= Format(get_sum, [dog_id, dog_inst]);
     _OpenQuery(Query3);

     sum:= mround(Fields[0].AsFloat, 2);
     nds:= 0;//mround(sum/5 , 2);
//     ShowMessage('сумма - ' + FloatToStr(sum + nds));
      bbEditTax.Enabled := (IsNotOverallCostDog) and (bbOk.Enabled) and (ShareID = 0);

     // Проверяем НН по этому договору, если по нем можно проводить оплаты на не полную стоимость
     if (IsNotOverallCostDog)then
     begin
       qGetSumNN.Close;
       qGetSumNN.ParamByName('dog_id').AsInteger := dog_id;
       qGetSumNN.ParamByName('dog_inst').AsInteger := dog_inst;
       qGetSumNN.ParamByName('nn_id').AsInteger := 0;
       qGetSumNN.ParamByName('nn_inst').AsInteger := 0;
       qGetSumNN.Open;
       NNSum := qGetSumNN.FieldByName('sum_nn').AsFloat;
       //получили суму НН по договору без открытой оплаты с НН
       qGetSumNN.Close;
       qGetSumNN.ParamByName('nn_id').AsInteger := nn_id;
       qGetSumNN.ParamByName('nn_inst').AsInteger := nn_inst;
       qGetSumNN.Open;
       NNSumOut := qGetSumNN.FieldByName('sum_nn').AsFloat;
       LastNN:= qGetSumNN.FieldByName('S_DATE').AsDATETime;
       LabelNNSum.Caption := FloatToStr(NNSum) + TranslateText(' грн.');
       Close;
       SQL.Text:= Format(get_nn_date, [nn_id, nn_inst]);
       Open;
       CurNNDate := FieldByName('s_date').AsDATETime;
     end
     else
     Begin
       LabelNNSum.Caption := TranslateText('Возм. не доступна');
       NNSum := 0;
     End;
     // получаем сумму оплат договору
     if Active then Close;
     SQL.Text:= Format(get_money, [dog_id, dog_inst,0,0]);
     Open;
     MoneySum := Fields[0].AsFloat;
     Close;
     SQL.Text:= Format(get_money, [dog_id, dog_inst, MnId, MnInst]);
     Open;
     MoneySumOut := Fields[0].AsFloat;
     // Заносим сумму с оплаты
     if not JustNowRun then
     Begin
       if sum + nds - NNSumOut <> ceSum.Value then
         if MessageDlgExt(
           TranslateText('Сумма по договору не соответствует сумме введенной оплаты.'),
           mtInformation,
           ['Ok',TranslateText('Заменить')],0) = 2 then
           ceSum.Value := sum + nds - NNSumOut;
     End
     else
       JustNowRun := false;
     if ceSum.Value = 0 then
       ceSum.Value := sum + nds - (NNSumOut + MoneySumOut);
     if ceSum.Value < 0 then
       ceSum.Value := 0;
     // Проверяем ДТ
     dt:= false;

     if Active then Close;
     SQL.Text:= Format(get_dt, [dog_id, dog_inst]);
     Open;

     if (RecordCount = 1) and (Fields[0].AsInteger = 3) then dt:= true;


     // Показываем значения
     LabelDogSum.Caption := FloatToStr(sum + nds) + TranslateText(' грн.');
     LabelMoneySum.Caption := FloatToStr(MoneySum) +  TranslateText(' грн.');
    end;
  end;

 // для предоплаты можно выписывать НН (сразу или позже)
 gbTax.Enabled := lvContractType.Visible and ((ind = cCVsel_Forepay) or dt or (IsNotOverallCostDog and(NNSum>0)));
 gbTax.Enabled := gbTax.Enabled and (ShareID <> -1);

 if (not gbTax.Enabled) then
 Begin
  cbNoTax.Checked:= gbTax.Enabled;
  bbEditTax.Enabled := (gbTax.Enabled) and (bbOk.Enabled) and (ShareID = 0);
 End;
 cbNoTaxClick(nil);
end;

procedure TMoneyForm.ceDepartmentButtonClick(Sender: TObject);
var vName: string;
begin
  if ChooseOrg.CaptureOrg(1,Main.Main_Id,Main.Inst,'yyx',SearchDepId,SearchDepInst,vName) then begin
    ceDepartment.Text:=vName;
    sbContract.Click;
  end;
end;

procedure TMoneyForm.ceExchangeButtonClick(Sender: TObject);
const
 eNoBarter = 'Партия не является бартерной.';
var PF:TPartRefForm;
begin
PF:=TPartRefForm.Create(Application);
try
PF.ShowModal;
if (PF.ModalResult=MrOk) then
 if (PF.q.FieldByName('is_barter').AsInteger=0) then
// нужно изменить wiev - чтобы использовать goal_part_type
// if (PF.q.FieldByName('goal_part_type').AsInteger=cGPT_Exchange) then
  begin
  part_id:=-1; part_inst:=-1;
  Raise Exception.Create(eNoBarter);
  end
  else // if (PF.q.fieldbyname('is_barter').AsInteger=0) then
   begin
   ceExchange.Text:=PF.q.FieldByName('dog').AsString;
   part_id:=PF.q.fieldbyname('id').asinteger;
   part_inst:=PF.q.fieldbyname('inst').asinteger;
   end; // else  if (PF.q.fieldbyname('is_barter').AsInteger=0) then
finally // try  PF.ShowModal; ...
PF.free;
end; // finally  try ...
end;

procedure TMoneyForm.ceGoalPartButtonClick(Sender: TObject);
begin
  mes := '';
  XMLChoose('GoalPartRef', ceGoalPart);
  gpart_id := ceGoalPart.Tag;
  if (Length(mes)>0) then
    ShowMessage(TranslateText('Внимание! Данное целевое назначение запрещено при вводе оплаты!'));
end;

procedure TMoneyForm.ceGoalPartChange(Sender: TObject);
begin
lExchange.Enabled:=gpart_id=cGPT_Exchange;
ceExchange.Enabled:=lExchange.Enabled;
if (not ceExchange.Enabled) then
 sbExchange.Click;
sbExchange.Enabled:=lExchange.Enabled;
end;

procedure TMoneyForm.ceOperationButtonClick(Sender: TObject);
var
 OperF: TOperTypeRefForm;
begin
 mes:= '';
 OperF:=TOperTypeRefForm.Create(Self);
 OperF.sgrpId:=OpG_OPLATA;
 OperF.bbClear.Enabled:=False;
 OperF.ShowModal;
 if (OperF.ModalResult=MrOk) and
    (IsOperationCorrect(OperF.q)) then
  begin
   ceOperation.Text:=OperF.q.FieldByName('name').AsString;
   oper_id:=OperF.q.FieldByName('id').AsInteger;
   ceSumExit(ceSum);
  end;

 OperF.free;

 // есть предупреждения
 if (Length(mes)>0) then ShowMessage(mes);
end;

procedure TMoneyForm.ceSumExit(Sender: TObject);
begin
  IsSumCorrect;
end;

procedure TMoneyForm.deDateChange(Sender: TObject);
begin
SetTakeState;
end;

procedure TMoneyForm.deDateExit(Sender: TObject);
begin
mes:= '';
if (not IsDateCorrect) then deDate.Date:=dog_date;
if (Length(mes)>0) then ShowMessage(mes);
end;

procedure TMoneyForm.dbgPropertiesDblClick(Sender: TObject);
begin
if dbgProperties.Height=21 then dbgProperties.Height:=21*5
 else dbgProperties.Height:=21;
end;

procedure TMoneyForm.dbgPropertiesExit(Sender: TObject);
begin
dbgProperties.Height:=21;
end;

procedure TMoneyForm.eNumKeyPress(Sender: TObject; var Key: Char);
begin
 if (not (Key in ['0'..'9',#8])) then Key:=#0;
end;

procedure TMoneyForm.FormCreate(Sender: TObject);
begin
inherited;
 SearchDepID:=MAIN_ORG.ID; SearchDepINST:=MAIN_ORG.INST;
 OrgOutId:=-1; OrgOutInst:=-1;
 Oper_id:=-1;
 dog_id:=-1; dog_inst:=-1;
 ShareID := 0;
 ceSum.Enabled := ShareID = 0;
 nn_id:=-1; nn_inst:=-1;
 gpart_id:=-1; part_id:=-1; part_inst:=-1;
 deDate.Date:=Now;
 eNum.Text:=IntToStr(GetNum);

 ceDepartment.Text:=MAIN_ORG.NAME;
 JustNowRun := True;
end;

procedure TMoneyForm.FormShow(Sender: TObject);
begin
 case mode of
  1: // режим новая
   begin
     deDate.Date:=Date;
     SumNN:=0;
   end;
  2: // режим редактировать
   begin
   query1.Close;
   query1.SQL.Text:='select * from v_oil_money where id='+IntToStr(MnId)+
                                             ' and inst='+IntToStr(MnINST);
   query1.Open;

   if not Query1.FieldByName('CASH_METHOD').IsNull then
   begin
     lPayType.Caption :=
       decode([Query1.FieldByName('CASH_METHOD').asInteger,
         0, TranslateText('Бензины'),
         1, TranslateText('Дизельное топливо'),
         '']);
     gbPayType.Visible := true;
     cbNoTax.Checked := false;
   end;  

   eNum.text:=query1.FieldByName('num').AsString;
   deDate.Date:=query1.FieldByName('mdate').AsDatetime;
   deDate.Enabled:=deDate.Date>StrToDate(CLOSE_DATE);

   ceDepartment.text:=query1.FieldByName('dep_name').AsString;
   SearchDepId  :=query1.FieldByName('dep_id').AsInteger;
   SearchDepInst:=query1.FieldByName('dep_inst').AsInteger;

   ceClient.Text:=query1.FieldByName('org_name').asstring;
   OrgOutId  :=query1.FieldByName('org_id').AsInteger;
   OrgOutInst:=query1.FieldByName('org_inst').AsInteger;
   OrgOutType:=GetOrgType(
     query1.FieldByName('org_id').AsInteger,
     query1.FieldByName('org_inst').AsInteger
     );

   qProperties.Close;
   qProperties.ParamByName('p_OrgId').Value  :=OrgOutId;
   qProperties.ParamByName('p_OrgInst').Value:=OrgOutInst;
   qProperties.Open;
   qProperties.DisableControls;
   qProperties.First;
   while (not qProperties.EOF) do
    begin
    if(qProperties.FieldByName('id').Value = query1.FieldByName('rekv_id').value)
      and(qProperties.FieldByName('inst').Value = query1.FieldByName('rekv_inst').value) then
      break;
    qProperties.Next;
    end; // while (not qProperties.EOF) do
   qProperties.EnableControls;

   Oper_Id:=query1.FieldByName('oper_id').AsInteger;
   ceOperation.Text:=query1.FieldByName('oper_name').AsString;
//   ceSum.Value:=query1.FieldByName('money').AsFloat;
   if (Query1.FieldByName('nn_id').Value<>NULL) then
   begin
     nn_id  := Query1.FieldByName('nn_id').AsInteger;
     nn_inst := Query1.FieldByName('nn_inst').AsInteger;
     eTax.Text := Query1.FieldByName('nn_num').AsString;
     cbNoTax.Tag := 1;
   end; // if (Query1.FieldByName('тт_id').Value<>NULL) then
   cbNoTax.Checked := (Query1.FieldByName('nn_id').Value=NULL);
   if (Query1.FieldByName('dog_id').Value<>NULL) then
    begin
    dog_id  :=Query1.FieldByName('dog_id').AsInteger;
    dog_inst:=Query1.FieldByName('dog_inst').AsInteger;
    ShareID := Query1.FieldByName('Share_ID').AsInteger;
    ceSum.Enabled := ShareID = 0;
    dog_date:=Query1.FieldByName('dog_date').AsDateTime;
    dog_type:=Query1.FieldByName('dog_type').AsString;
    Sub_Type := Query1.FieldByName('Sub_type').AsInteger;
    ForePay := Query1.FieldByName('ForePay').Asinteger;
    ceContract.Text:=Query1.FieldByName('dogovor').AsString;
    end; // if (Query1.FieldByName('dog_id').Value<>NULL) then

   ceSum.Value:=query1.FieldByName('money').AsFloat;


   if (Query1.FieldByName('goal_part_type').Value<>NULL) then
    begin
    gpart_id:=Query1.FieldByName('goal_part_type').AsInteger;
    ceGoalPart.Text:=Query1.FieldByName('goal_part_name').AsString;
    end;

   if (query1.FieldByName('part_id').Value<>NULL) then
    begin
    ceExchange.Text:=query1.FieldByName('part_name').AsString;
    part_id  :=query1.FieldByName('part_id').AsInteger;
    part_inst:=query1.FieldByName('part_inst').AsInteger;
    end; // if (query1.FieldByName('part_id').Value<>NULL) then

   rgGoods.ItemIndex:=query1.FieldByName('money_t').AsInteger;
   mComent.Text:=query1.FieldByName('text').AsString;

   end; // 2:
  end; // case mode of

  SetTakeState;
  SumNNEdited := 0;
  if bbOk.Tag =1 then
  Begin
    bbOk.Enabled := False;
    bbEditTax.Enabled := False;
  End;
end;

procedure TMoneyForm.rgGoodsClick(Sender: TObject);
begin
lGoalPart.Enabled:=rgGoods.ItemIndex=1;
ceGoalPart.Enabled:=lGoalPart.Enabled;
if (not ceGoalPart.Enabled) then
 begin
 sbGoalPart.Click;
 if (oper_id in cOpr_OnlyGoalPartList) then sbOperation.Click;
 end; // if (not cbGoalPart.Enabled) then
sbGoalPart.Enabled:=lGoalPart.Enabled;
end;

procedure TMoneyForm.sbContractClick(Sender: TObject);
begin
  dog_id:=-1; dog_inst:=-1;
  ShareID := 0;
  ceSum.Enabled := ShareID = 0;
  dog_type:='';
  ceContract.Clear;
  //ceSum.Clear;
  ceContractChange(Sender);
  LabelDogSum.Caption := '';
  LabelMoneySum.Caption := '';
  LabelNNSum.Caption := '';
end;

procedure TMoneyForm.sbExchangeClick(Sender: TObject);
begin
 part_id:=-1;
 part_inst:=-1;
 ceExchange.Clear;
end;

procedure TMoneyForm.sbGoalPartClick(Sender: TObject);
begin
  gpart_id:=-1;
  ceGoalPart.Text:='';
end;

procedure TMoneyForm.sbOperationClick(Sender: TObject);
begin
  oper_id:=-1;
  ceOperation.Clear;
end;

procedure TMoneyForm.bbEditTaxClick(Sender: TObject);
begin
  if bbOk.Enabled then
  Begin
    IsEditClick := True;
    bbOKClick(nil);
    IsEditClick := False;
  End;
end;

procedure TMoneyForm.ceSumChange(Sender: TObject);
begin
  SumNNEdited := 0;
end;

procedure TMoneyForm.cbNoTaxClick(Sender: TObject);
begin
  try
    bbEditTax.Enabled := (IsTax) and (IsNotOverallCostDog) and (ShareID = 0);
  except
    bbEditTax.Enabled := false;
  end;
  IsSumCorrect;
end;

end.
