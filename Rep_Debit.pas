unit Rep_Debit;

{### 1.01}
// 21 мая 2003
// в ведомости дебиторов и расширенной ведомости дебиторов сделано, чтобы
// "прочие" попадали в колонку "до 30 дней" по просьбе Винницы (Должиков)

interface

uses uCommonForm, Buttons, DbTables, Dialogs, Forms, StdCtrls, SysUtils, Progr,
  ReportManager, OilStd, Classes, Ora, MemTable, Db, uOilQuery, uOilStoredProc,
  Controls{$IFDEF VER150},Variants{$ENDIF};

const
  cDbt_PageList: set of Byte = [101, 109, 110];

procedure pDbt_bbOrganizationClick(RM: TForm);
procedure pDbt_bbPartClick(RM: TForm);
procedure pDbt_cbGoodsClick;
procedure pDbt_cbOrganizationClick;
procedure pDbt_cbPartClick;
procedure pDbt_CheckSelect;
procedure pDbt_SetElements(cbCom, cbOwn, cbOth, cbOrg, cbPrt: TCheckBox;
  bbOrg, bbPrt: TBitBtn;
  lOrg, lPrt: TLabel);

procedure Debitorka(var RM: TRepManagerForm; Progr: TProgrForm);
(*Процедура печатает дебиторку, дебиторка содержит сумму дебета по клиенту.
  Текущая и просроченая дебиторка считаеться по дате каждой операции и добавляет
  сумму в нужную колонку в соответствии с датой операции.*)
procedure Debitors(var RM: TRepManagerForm; Progr: TProgrForm);
procedure Creditors(var RM: TRepManagerForm; Progr: TProgrForm; List: Variant);
(*Процедура печатает расширеную дебиторку, расширеная дебиторка выдает дебиторку
  сгрупированую по операциям клиента.
  Текущая и просроченая дебиторка считаеться по дате дебита (колонка Дебит/Дата)
  и проставляет всю сумму дебита в одну колонку в соответсвии с этой датой.
  На данный момент исполняющая проседура: TDbplan.QExtDebitReportCalcFields(DataSet: TDataSet);*)
procedure ExtDebitors(BeginDate: TDateTime; DepId: integer; Progr: TProgrForm;
  ShowDep: Boolean = TRUE; UnionProchie: Boolean = TRUE; ShowDog: Boolean = TRUE;
  ShowLS: Boolean = TRUE);
function GetWaitedDate(deb_date, exp_date: TDateTime; pay_type, pay_corr: integer): TDateTime;

var
  vDbt_Part: string;

implementation

uses
  Main, Rep_s, uDbPlan, ExFunc, ExcelFunc, MoneyFunc, UDbFunc, LogSaleDeadbeat,
  uStart;

const
  // используются при работе с формой ReportManager
  cDbtLC_DefOrg =  'Покупатель';
  cDbtLC_DefPart = 'Все';
  cDbtLC_Select =  'Согласно списка';
  // для замены типов товаров
  cDbt_PartOwn = ' AND p.own_goods';
  cDbt_AllPart = ' IN (''K'',''O'')';
  cDbt_MS = ' IN (0,1,2)';
  // для замены типов организаций
  cDbt_OrgType = ' AND cl.org_type';
  // сокращеные обозначения таблиц в запросах
  cDbt_PartAllias = 'p';
  cDbt_MoneyAllias = 'm';
  cDbt_ServiceAllias = 's';
  // операция для одного или нескольких типов чего либо
  cfrmDbt_OperationBe = ' = %s';
  cfrmDbt_OperationIn = ' IN (%s)';
  // шаблоны
  cfrmDbt_Money = ' AND %s.money_t';
  cfrmDbt_Service = ' AND %s.service_t';
  cfrmDbt_PartType = ' AND %s.goal_part_type';
  cfrmDbt_SubTotal = '=SubTotal(9;%s%d:%0:s%2:d)';
  // Сумма от которой дебитор попадает в разряд прочие
  cDbt_RestMax = 100;
  // для вывода результатов
  cRow_place = 1;
  cRow_depTitle = 3;
  cRow_goods = 4;
  cRow_start = 7;  
  cCol_depTitle = 3;
  cCol_place = 10;
  cCol_dep = 1;
  cCol_name = 2;
  cCol_num = 3;
  cCol_sum = 4;

var
  // переменные для работы в ReportManager
  cb_Commission, cb_Own, cb_Other, cb_Organization, cb_Part: TCheckBox;
  bb_Organization, bb_Part: TBitBtn;
  l_Organization, l_Part: TLabel;
  // списки выбраных типов организаций и типов целевых партий
  vDbt_Organization: string;
  qDbt, qDbtDate, qDbt_DualList: TOilQuery;
  // переменные для работы в процедурах
  vFilter, GoodsType: string;
  counter, d_id, d_coun, d_pos: Integer;
  delta, step, f, Rest, Balance, blnc: Real;
  fRestSpecify: Boolean;

//==============================================================================
function GetWaitedDate(deb_date, exp_date: TDateTime; pay_type, pay_corr: integer): TDateTime;
begin
  if VarIsNull(pay_type) then pay_type := 0;
  case pay_type of
    0: result := exp_date;
    1: result := deb_date + pay_corr;
    2: result := GetFirstDayOfNextMonth(deb_date);
    else result := 0;
  end;
end;
//==============================================================================
procedure InitQuery(RM: TForm; param: string);
begin // процедура создания списка выбора
  qDbt_DualList := TOilQuery.Create(RM);
  qDbt_DualList.Session := frmStart.OraSession1;
  qDbt_DualList.SQL.Clear;
  qDbt_DualList.SQL.Add(Format('SELECT name, id from %s WHERE state = ''Y''', [param]));
end;
//==============================================================================
procedure pDbt_bbOrganizationClick(RM: TForm);
begin // Внешние процедуры
  InitQuery(RM, 'oil_org_type');
  vDbt_Organization := DualListSelect(qDbt_DualList, vDbt_Organization);
  if (Length(vDbt_Organization) > 0) then l_Organization.Caption := cDbtLC_Select
  else l_Organization.Caption := cDbtLC_DefOrg;
  qDbt_DualList.Free;
end;
//==============================================================================
procedure pDbt_bbPartClick(RM: TForm);
begin
  InitQuery(RM, 'oil_goal_part_type');
  vDbt_Part := DualListSelect(qDbt_DualList, vDbt_Part);
  if (Length(vDbt_Part) > 0) then l_Part.Caption := cDbtLC_Select
  else l_Part.Caption := cDbtLC_DefPart;
  qDbt_DualList.Free;
end;
//==============================================================================
procedure pDbt_cbGoodsClick;
begin
  cb_Part.Enabled := cb_Own.Checked and not (cb_Commission.Checked or cb_Other.Checked);
  if (not cb_Part.Enabled) then cb_Part.Checked := False;
end;
//==============================================================================
procedure pDbt_cbOrganizationClick;
begin
  bb_Organization.Enabled := cb_Organization.Checked;
  if (not cb_Organization.Checked) then
  begin
    l_Organization.Caption := cDbtLC_DefOrg;
    vDbt_Organization := '';
  end;
end;
//==============================================================================
procedure pDbt_cbPartClick;
begin
  bb_Part.Enabled := cb_Part.Checked;
  if (not cb_Part.Checked) then
  begin
    l_Part.Caption := cDbtLC_DefPart;
    vDbt_Part := '';
  end;
end;
//==============================================================================
procedure pDbt_CheckSelect;
begin
  if not (cb_Commission.Checked or cb_Own.Checked or cb_Other.Checked) then
  begin
    cb_Commission.Checked := True;
    cb_Own.Checked := True;
    cb_Other.Checked := True;
    ShowMessage('Ни один тип товара не выбран, '+ #13 +'отчет будет включать все виды.'+ #13);
  end;
end;
//==============================================================================
procedure pDbt_SetElements(cbCom, cbOwn, cbOth, cbOrg, cbPrt: TCheckBox;
  bbOrg, bbPrt: TBitBtn;
  lOrg, lPrt: TLabel);
begin
  cb_Commission := cbCom;
  cb_Own := cbOwn;
  cb_Other := cbOth;
  cb_Organization := cbOrg;
  cb_Part := cbPrt;
  bb_Organization := bbOrg;
  bb_Part := bbPrt;
  l_Organization := lOrg;
  l_Part := lPrt;
end;
//==============================================================================
//==================================ДЕБИТОРКА===================================
//==============================================================================
procedure Debitorka(var RM: TRepManagerForm; Progr: TProgrForm);
const
  cRow_start = 8;
var i: Integer;
  fPt, fOp, tcond: Boolean;
  VOption: string;
  XLApp, List: Variant;
begin
  VOption := '';
  qDbt := TOilQuery.Create(RM);
  qDbt.Session := frmStart.OraSession1;
  qDbt.FetchAll := true;
  qDbt.Sql.Text := 'select org_id,org_inst,okpo as id_num,org_name as name,org_type_name as otn,' +
    'sum(decode(sign(deb_date-to_date(:begin_date)),-1,total,0)) as balance,' +
    'sum(decode(sign(deb_date-to_date(:begin_date)),-1,0,debet)) as debit,' +
    'sum(decode(sign(deb_date-to_date(:begin_date)),-1,0,credit)) as credit ';

  if RM.cb101_Operation.Checked then qDbt.Sql.Add(',oper_type_name as operation ')
  else VOption := VOption + TranslateText('НЕ ');
  VOption := VOption + TranslateText('уточнять по операциям,');

  if RM.cb101_Payment.Checked then qDbt.Sql.Add(',own_goods_name as own_goods ')
  else VOption := VOption + TranslateText('НЕ ');
  VOption := VOption + TranslateText('уточнять по оплатам,');

  if RM.cb101_TF.Checked then qDbt.Sql.Add(',dep_id,dep_inst,dep_name ')
  else VOption := VOption + TranslateText('НЕ ');
  VOption := VOption + TranslateText('уточнять по подразделениям');

  qDbt.Sql.Add('from v_oil_debitorka ');
  qDbt.Sql.Add('where deb_date<=:end_date and :dep_id in (dep_id,dep_par_id) ');

  if vDbt_Organization = '' then qDbt.Sql.Add('and org_type=1 ')
  else qDbt.Sql.Add('and org_type in (' + vDbt_Organization + ') ');

  if vDbt_Part <> '' then qDbt.Sql.Add('and goal_part_type in (' + vDbt_Part + ') ');

  qDbt.Sql.Add(GetKOSCondition('own_goods', RM.cb101_Commission.Checked, RM.cb101_Own.Checked, RM.cb101_Other.Checked));
  GoodsType := TranslateText('Виды товара: ') + GetConstructedString([TranslateText('комиссия'), TranslateText('собственный'), TranslateText('прочий')],
    [RM.cb101_Commission.Checked, RM.cb101_Own.Checked, RM.cb101_Other.Checked]);

  qDbt.Sql.Add('group by org_id,org_inst,okpo,org_name,org_type_name ');
  if RM.cb101_Operation.Checked then qDbt.Sql.Add(',oper_type_name ');
  if RM.cb101_Payment.Checked then qDbt.Sql.Add(',own_goods_name ');
  if RM.cb101_TF.Checked then qDbt.Sql.Add(',dep_id,dep_inst,dep_name ');

  qDbt.Sql.Text := 'select * from (' + qDbt.Sql.Text + ') where (balance <> 0 or debit <> 0 or credit <> 0) ';

  qDbt.Sql.Add('order by ');
  if RM.cb101_TF.Checked then qDbt.Sql.Add('dep_id,dep_name,');
  qDbt.Sql.Add('name');

  try
    qDbt.Prepare;
    qDbt.ParamByName('begin_date').Value := RM.From_date2.Date;
    qDbt.ParamByName('end_date').Value := RM.To_date2.Date;
    qDbt.ParamByName('dep_id').Value := RM.OrgId;
    qDbt.Open;
    ActivateXLApp('Oplata', 'Oplata', 1, XLApp, List); // вывести результаты
    case RM.OrgType of
      3: d_pos := 2; // ППОН
      4: if (not RM.cb101_TF.Checked) then d_pos := 2
         else d_pos := 1; // Облуправление
    end;
    List.Cells[cRow_depTitle, d_pos] := TranslateText('Подразделение ') + RM.ceOrg.Text;
    List.Cells[cRow_depTitle, cCol_depTitle] := 'c ' + FormatDateTime('dd.mm.yyyy', RM.From_date2.Date) +
      TranslateText(' по ') + FormatDateTime('dd.mm.yyyy', RM.To_date2.Date);
    List.Cells[cRow_goods, d_pos] := GoodsType;
    List.Cells[cRow_goods + 1, d_pos] := ' (' + VOption + ')';
    // Место, дата, время.
    Dbplan.SetCurrentOrgDateTime(cCol_place, cRow_place, List);

    if (qDbt.RecordCount = 0) then Exit;

    counter := cRow_start;
    d_coun := counter;
    step := 100 / qDbt.RecordCount;
    d_id := 0;
    if RM.cb101_TF.Checked then d_id := qDbt.FieldByName('dep_id').AsInteger;
    delta := 0;
    fPt := RM.cb101_Payment.Checked;
    fOp := RM.cb101_Operation.Checked;

    while (not qDbt.EOF) do
    begin
      delta := delta + step;
      progr.Progress := Round(delta);

      if RM.cb101_TF.Checked then
        List.Cells[counter, cCol_dep] := qDbt.FieldByName('dep_name').AsString;
      List.Cells[counter, cCol_name] := qDbt.FieldByName('name').AsString;
      List.Cells[counter, cCol_num] := qDbt.FieldByName('id_num').AsString;
      f := qDbt.FieldByName('balance').AsFloat;
      if (f > 0) then List.Cells[counter, 4] := f
      else List.Cells[counter, 5] := abs(f);
      List.Cells[counter, 6] := qDbt.FieldByName('debit').AsFloat;
      List.Cells[counter, 7] := qDbt.FieldByName('credit').AsFloat;
      vFilter := Format('D%0:d-E%0:d+F%0:d-G%0:d', [counter]);
      List.Cells[counter, 8] := '=IF(' + vFilter + '>0;' + vFilter + ';0)';
      List.Cells[counter, 9] := '=IF(' + vFilter + '<0;ABS(' + vFilter + ');0)';
      if (fPt) then List.Cells[counter, 10] := qDbt.FieldByName('own_goods').AsString;
      if (fOp) then List.Cells[counter, 11] := qDbt.FieldByName('operation').AsString;
      List.Cells[counter, 12] := qDbt.FieldByName('otn').AsString;
      qDbt.Next;
      inc(counter);
      if RM.cb101_TF.Checked then tcond := (d_id <> qDbt.FieldByName('dep_id').AsInteger)
      else tcond := false; // не уточнять по подразделениям
      if tcond or qDbt.EOF then
      begin
        List.Cells[counter, d_pos] := TranslateText('ИТОГО');
        if (counter > 7) then
          List.Cells[counter, 4] := '=SubTotal(9;D' + IntToStr(d_coun) + ':D' + IntToStr(counter - 1) + ')';
        List.Cells[counter, 4].Copy;
        for i := 5 to 9 do
          List.Cells[counter, i].PasteSpecial;
        List.Rows[counter].Font.Bold := True;

        inc(counter);
        if (not qDbt.EOF) then
        begin
          if tcond then d_id := qDbt.FieldByName('dep_id').AsInteger;
          d_coun := counter;
        end;
      end;
    end;

    case RM.OrgType of
      3: List.Columns[1].Hidden := True; // ППОН
      4: // Облуправление
        if not RM.cb101_TF.Checked then List.Columns[1].Hidden := True
        else
        begin
          List.Cells[counter, d_pos] := TranslateText('ВСЕГО');
          if (counter > 8) then
            List.Cells[counter, 4] := '=SubTotal(9;D' + IntToStr(cRow_start) + ':D' + IntToStr(counter - 1) + ')';
          List.Cells[counter, 4].Copy;
          for i := 5 to 9 do
            List.Cells[counter, i].PasteSpecial;
          List.Rows[counter].Font.Bold := True;
        end;
    end;

    List.Columns[10].Hidden := not fPt;
    List.Columns[11].Hidden := not fOp;

    List.Cells[1, 1].Select;
    progr.Progress := 100;
    XLApp.Visible := TRUE;
    SaveReport(XLApp, TranslateText('Дебеторка'));
  finally
    qDbt.Free;
  end;
end;
//==============================================================================
//====================Расширенная ведомость дебиторов===========================
//==============================================================================
procedure ExtDebitors(BeginDate: TDateTime; DepId: integer; Progr: TProgrForm;
  ShowDep: Boolean = TRUE; UnionProchie: Boolean = TRUE; ShowDog: Boolean = TRUE;
  ShowLS: Boolean = TRUE);
var
  qD: TOilQuery;
  curTip, curOwn_Goods, curDep, curOrg, sOrd: string;
  N, curOrgId, curOrgInst, curDogId, curDogInst: integer;
  Sum, DiapSum, curProgr, ProchieSumm, Vsego, ProchieLimit: real;
  VedIsCounted: Boolean;
  XLApp, List: Variant;
  //****************************************************************************
  function TheSameValues: Boolean;
  begin
    if (((curDep = qD.FieldByName('dep').AsString) and ShowDep) or not ShowDep)
      and (curOrg = qD.FieldByName('org').AsString)
      and (curOrgId = qD.FieldByName('org_id').AsInteger)
      and (curOrgInst = qD.FieldByName('org_inst').AsInteger)
      and (curOwn_Goods = qD.FieldByName('own_goods').AsString)
      and (((((curDogId = qD.FieldByName('dog_id').AsInteger) and (curDogInst = qD.FieldByName('dog_inst').AsInteger)
        and (qD.FieldByName('pos_type').AsInteger <> 0)) or (qD.FieldByName('pos_type').AsInteger = 0)) and ShowDog)
          or not ShowDog) then
      result := TRUE
    else result := FALSE;
  end;
  //****************************************************************************
  procedure SetCurrentValues;
  begin
    curDep := qD.FieldByName('dep').AsString;
    curOrg := qD.FieldByName('org').AsString;
    curOrgId := qD.FieldByName('org_id').AsInteger;
    curOrgInst := qD.FieldByName('org_inst').AsInteger;
    curTip := qD.FieldByName('tip').AsString;
    curOwn_Goods := qD.FieldByName('own_goods').AsString;
    curDogId := qD.FieldByName('dog_id').AsInteger;
    curDogInst := qD.FieldByName('dog_inst').AsInteger;
    VedIsCounted := FALSE;
    DiapSum := qD.FieldByName('total').AsFloat; // обработали случай частичной оплаты первой записи
    qD.Next;
    // в конце работы этой функции нам надо будет откатить на место qD.
    // Для этого в N мы запомним каждый успешный случай qD.Next
    if qD.Eof then N := 0
    else N := 1;
    while not qD.Eof and TheSameValues do
    begin
      DiapSum := FRound(DiapSum + qD.FieldByName('total').AsFloat);
      qD.Next;
      if not qD.Eof then inc(N);
    end;
    qD.MoveBy(-N);
    Vsego := DiapSum;
    Sum := qD.FieldByName('total').AsFloat;
  end;
  //****************************************************************************
  procedure SaveProchieToTable;
  begin
    ProchieSumm := FRound(ProchieSumm, 2);
    if ProchieSumm = 0 then exit;
    with DBPlan.tblExtDebitorka do
    begin
      Insert;
      FieldByName('dep').AsString := CurDep;
      FieldByName('org').AsString := TranslateText('Прочие');
      FieldByName('okpo').AsString := '';
      FieldByName('org_id').AsInteger := 0;
      FieldByName('org_inst').AsInteger := 0;
      FieldByName('own_goods').AsString := CurOwn_Goods;
      FieldByName('tip').AsString := '';
      FieldByName('deb_date').Value := null;
      FieldByName('exp_date').Value := null;
      FieldByName('deb_inside').Value := 'N';
      FieldByName('total').AsFloat := ProchieSumm;
      FieldByName('dog_id').AsInteger := 0;
      FieldByName('dog_inst').AsInteger := 0;
      FieldByName('dog_name').AsString := '';
      Post;
    end;
  end;
  //****************************************************************************
  procedure SaveValuesToTable;
    //**************************************************************************
    procedure SetPeriod(Sum: real; deb_date: TDate); // робимо розбивку по періодам
    var
      sField: string;
      year, month, day: word;
      curyear, curmonth, curday: word;
    begin
      with DBPlan.tblExtDebitorka do
      begin
        if FieldByName('oper_type').AsInteger = 194 then sField := 'sum_before_alfa'
        else
        begin
          DecodeDate(deb_date, year, month, day);
          DecodeDate(TDate(BeginDate), curyear, curmonth, curday);
          if (curyear - year = 1) and (DEBET_LAST_YEAR = 'Y') then sField := 'sum2000'
          else
          begin
            case Round(TDate(BeginDate) - deb_date) of
              0..29: sField := 'sum0';
              30..59: sField := 'sum30';
              60..89: sField := 'sum60';
              else
                case (curyear - year) of
                  0: sField := 'sum90';
                  1: sField := 'sum2000';
                  else sField := 'sumprev';
                end;
            end;
          end;
        end;
        FieldByName(sField).AsFloat := FieldByName(sField).AsFloat + abs(Sum);
      end;
    end;
    //**************************************************************************
  begin
    with DBPlan.tblExtDebitorka do
    begin
      Insert;
      FieldByName('dep').AsString := qD.FieldByName('dep').AsString;
      FieldByName('org').AsString := qD.FieldByName('org').AsString;
      FieldByName('okpo').AsString := qD.FieldByName('okpo').AsString;
      FieldByName('org_id').AsInteger := qD.FieldByName('org_id').AsInteger;
      FieldByName('org_inst').AsInteger := qD.FieldByName('org_inst').AsInteger;
      FieldByName('own_goods').AsString := qD.FieldByName('own_goods').AsString;
      FieldByName('tip').AsString := qD.FieldByName('tip').AsString;
      FieldByName('deb_date').AsDateTime := qD.FieldByName('deb_date').AsDateTime;
      FieldByName('oper_type').AsInteger := qD.FieldByName('oper_type').AsInteger;
      FieldByName('deb_inside').AsString := qD.FieldByName('deb_inside').AsString;
      FieldByName('exp_date').AsDateTime :=
        GetWaitedDate(qD.FieldByName('deb_date').AsDateTime, qD.FieldByName('exp_date').AsDateTime,
          qD.FieldByName('pay_type').AsInteger, qD.FieldByName('pay_corr').AsInteger);
      // тема в том, что если мы наткнулись на значение tip=VEDOMOST_TIP, то мы должны вместить в одну строку
      // все отпуски с таким tip-ом по данному филиалу, клиенту и типу дебиторки и после этого их не выводить
      // до следующего филиала, клиента или типа дебиторки, то есть если мы наткнулись на tip=VEDOMOST_TIP, то
      // мы смотрим, выводили уже данные или нет, и если нет, то просим подсчитать нам сумму по этому tip
      // !!! не забывайте, что tip и тип дебиторки - разные вещи. Тип дебиторки хранится в own_goods
      if qD.FieldByName('tip').AsString = VEDOMOST_TIP then
      begin
        if VedIsCounted then exit
        else
        begin
          // если сумма только что вылезла в плюс, может быть ситуация частичной оплаты первой записи,
          // для этого мы и берем здесь минимум
          DiapSum := FloatMin(Sum, qD.FieldByName('total').AsFloat); // обработали случай частичной оплаты первой записи

          SetPeriod(DiapSum, qD.FieldByName('deb_date').AsDateTime);

          qD.Next;
          // в конце работы этой функции нам надо будет откатить на место qD.
          // Для этого в N мы запомним каждый успешный случай qD.Next
          if qD.Eof then N := 0
          else N := 1;
          while not qD.Eof and TheSameValues do
          begin
            if qD.FieldByName('tip').AsString = VEDOMOST_TIP then
            begin
              DiapSum := FRound(DiapSum + qD.FieldByName('total').AsFloat);
              SetPeriod(qD.FieldByName('total').AsFloat, qD.FieldByName('deb_date').AsDateTime);
            end;
            qD.Next;
            if not qD.Eof then inc(N);
          end;
          qD.MoveBy(-N);
          FieldByName('total').AsFloat := FRound(DiapSum, 2);
          VedIsCounted := TRUE;
        end;
      end
      else
      begin
        FieldByName('total').AsFloat := FRound(FloatMin(Sum, qD.FieldByName('total').AsFloat), 2);
        SetPeriod(FieldByName('total').AsFloat, qD.FieldByName('deb_date').AsDateTime);
      end;
      FieldByName('dog_id').AsInteger := qD.FieldByName('dog_id').AsInteger;
      FieldByName('dog_inst').AsInteger := qD.FieldByName('dog_inst').AsInteger;
      FieldByName('dog_name').AsString := qD.FieldByName('dog_name').AsString;
      Post;
    end;
  end;
  //****************************************************************************
  procedure MakeReportOne(p_DebInside: string; p_XLApp, p_List: Variant);
  var
    Fields, Col: string;
  begin
    with DBPlan.qExtDebitReport do
    begin
      if Active then Close;
      Sql.Text := 'select * from oil_extdebitorka where total > 0 and Deb_Inside = ''' + p_DebInside + ''' order by ';
      if ShowDep then Sql.Add('dep,');
      Sql.Add('own_goods,org,deb_date ');
      Open;
    end;
    if ShowDep then
    begin
      Fields := 'dep%3;';
      Col := 'A';
    end
    else
    begin
      Fields := '';
      Col := 'B';
      p_List.Columns['A:A'].EntireColumn.Hidden := TRUE;
    end;
    // вивід поля "До работы с Альфа-Нафтой"
    DBPlan.qExtDebitReport.First;
    p_List.Columns['J:J'].EntireColumn.Hidden := TRUE;
    if not ShowDog then p_List.Columns['F:F'].EntireColumn.Hidden := TRUE;
    try
      while not DBPlan.qExtDebitReport.Eof do
      begin
        if DBPlan.qExtDebitReport.FieldByName('sum_before_alfa').Value > 0 then
        begin
          p_List.Columns['J:J'].EntireColumn.Hidden := FALSE;
          break;
        end;
        DBPlan.qExtDebitReport.Next;
      end;
    finally
      DBPlan.qExtDebitReport.First;
    end;
    PutTitle(p_List, Col + '1');
    if DBPlan.qExtDebitReport.RecordCount > 0 then
    begin
      p_List.Cells[3, Col] := TranslateText('Подразделение: ')+ GetOrgName(DepId, DepId) +TranslateText(' на ')+ DateToStr(BeginDate);
      Fields := Fields + 'debit_own_type%2#B;org%1;tip;okpo;dog_name;total+;str_deb_date;str_exp_date;sum_before_alfa+;sumprev+;sum2000+;sum0+;sum30+;sum60+;sum90+;';
      PuTOilQueryToExcel(p_XLApp, p_List, TOilQuery(DBPlan.qExtDebitReport), 0, 7, Progr, 50, 100, Fields, TranslateText('debit_own_type#B{по типу дебиторки}'), FALSE, FALSE);
    end;
  end;
  //****************************************************************************
begin
  Progr.Progress := 2;
  qD := DbPlan.qExtDebitors;
  sOrd := 'own_goods, org, org_id, org_inst, ';
  if ShowDog then sOrd := sOrd +'pos_type, ';
  if ShowDep then sOrd := 'dep_id, dep, '+ sOrd;
  qD.SetOrderBy(sOrd +'ord, deb_date');
  try
    _OpenQueryPar(qD, ['p_dep', DepId, 'p_BeginDate', BeginDate]);
  except on E:Exception do
    begin
      MessageDlg(TranslateText('Ошибка при открытии главного запроса!!!') +#10#13+ E.Message, mtError, [mbOk], 0);
      exit;
    end;
  end;

  with DbPlan.tblExtDebitorka do
  begin
    if Active then Close;
    EmptyTable;
    if not Active then Open;
  end;
  Progr.Progress := 5;
  // в нем по каждому филиалу, клиенту и типу дебиторки вначале находится оплата суммарной цифрой со знаком минус
  // а потом все отпуски этому клиенту со знаком плюс. В переменной sum будем накапливать сумму, и если она
  // станет положительной (то есть клиент с этого места является дебитором), начинаем сохранять отпуски во временной таблице
  if UnionProchie then ProchieLimit := 100
  else ProchieLimit := 0;
  SetCurrentValues; // запоминаем текущие значения организации, клиента, типа дебиторки и типа отпуска
  Sum := 0;
  ProchieSumm := 0;
  curProgr := 3;
  while not qD.Eof do
  begin
    if TheSameValues then // если филиал, клиент или тип отпуска не поменялся, накапливаем сумму
      Sum := FRound(Sum + qD.FieldByName('total').AsFloat)
    else
    begin
      if ((curDep = qD.FieldByName('dep').AsString) and ShowDep or not ShowDep)
        and (curOwn_Goods = qD.FieldByName('own_goods').AsString) then
      begin
        SetCurrentValues;
        if (Vsego > 0) and (Vsego < ProchieLimit) then
          ProchieSumm := FRound(ProchieSumm + Vsego);
      end
      else
      begin
        SaveProchieToTable;
        ProchieSumm := 0;
        SetCurrentValues;
      end;
    end;
    if (Sum > 0) and (Vsego >= ProchieLimit) and (Vsego > 0) then
      SaveValuesToTable; // сохраняем во временной таблице
    qD.Next;
    curProgr := curProgr + 2/qD.RecordCount;
    Progr.Progress := Round(curProgr);
  end;
  SaveProchieToTable;
  qD.Close;
  // виводимо дані
  ActivateXLApp('ExtDebitors', 'ExtDebitors', 2, XLApp, List);
  XLApp.ActiveWorkBook.WorkSheets[2].Select;
  MakeReportOne('Y', XLApp, List);
  List := XLApp.ActiveWorkBook.Worksheets[1];
  XLApp.ActiveWorkBook.WorkSheets[1].Select;
  MakeReportOne('N', XLApp, List);
  // Лимитные клиенты
  if ShowLS then
  begin
    Progr.Progress := 50;
    List := XLApp.ActiveWorkBook.Worksheets[3];
    XLApp.ActiveWorkbook.WorkSheets[3].Select;  
    DBPlan.qExtDebitorsLS.Close;
    _OpenQueryPar(DBPlan.qExtDebitorsLS, ['p_dep', DepId, 'p_BeginDate', BeginDate]);

    PutTitle(List, 'A1');
    PutToCell(List, 'A3', TranslateText('Подразделение: ')+ GetOrgName(DepId, DepId) +TranslateText(' на ')+ DateToStr(BeginDate));

    if DBPlan.qExtDebitorsLS.RecordCount > 0 then
      PuTOilQueryToExcel(XLApp, List, TOilQuery(DBPlan.qExtDebitorsLS), 0, 8, Progr, 50, 100,
        'FOREPAY%1;ORG_NAME;DOG;DAYS_ALLOWED;SUMMA_ALLOWED+;otov30+;' +
        'TOTAL+;TOTAL_ALLOWED+;TOTAL_NOT_ALLOWED+;TOTAL_30+;TOTAL_60+;TOTAL_90+;TOTAL_GREATER_90+;' +
        'TOTAL_PREV_YEAR+;TOTAL_LAST_YEAR+;otov_no_bill+;min_date_no_bill;max_date_no_bill;',
        TranslateText('FOREPAY#B{по типу договора}'), FALSE, FALSE);
  end
  else XLApp.ActiveWorkbook.WorkSheets[3].Visible := false;
  Progr.Progress := 100;
  XLApp.Visible := TRUE;
end;
//==============================================================================
//=============================Ведомость дебиторов==============================
//==============================================================================
procedure Debitors(var RM: TRepManagerForm; Progr: TProgrForm);
var
  vSelectYear, vYear, vMonth, vDay: Word;
  Today_, exp_date: TDateTime;
  condition, s, d_name, fields: string;
  PodrFragm, StoreDeadbeats, BeforeAlfaFlag: boolean;
  SummOver: real;
  Deadbeat_period, Deadbeat_summa: integer;
  XLApp, List: Variant;
  mt: TMemoryTable;
  //****************************************************************************
  procedure FillMt(p_DebInside: string);
  var
    field: string;
  begin
    if not mt.Active then mt.Open;
    mt.EmptyTable;
    qDbt.Filter := 'deb_inside = ''' + p_DebInside + '''';
    qDbt.Filtered := TRUE;
    qDbt.First;

    fRestSpecify := not RM.cb109_RestSpecify.Checked;
    Rest := 0;
    BeforeAlfaFlag := FALSE;

    if PodrFragm then
    begin
      d_id := qDbt.FieldByName('dep_id').AsInteger;
      d_name := qDbt.FieldByName('dep_name').AsString;
    end;
    
    while (not qDbt.EOF) do
    begin
      Balance := qDbt.FieldByName('balance').AsFloat;
      if (fRestSpecify) and (Balance < cDbt_RestMax) then Rest := Rest + Balance
      else
      begin
        mt.Insert;
        if PodrFragm then mt.FieldByName('dep_name').AsString := qDbt.FieldByName('dep_name').AsString;
        mt.FieldByName('deb_inside').AsString := qDbt.FieldByName('deb_inside').AsString;
        mt.FieldByName('name').AsString := qDbt.FieldByName('name').AsString;
        mt.FieldByName('id_num').AsString := qDbt.FieldByName('id_num').AsString;
        mt.FieldByName('sum').AsFloat := Balance;

        vFilter := ' dep_id = ' + qDbt.FieldByName('dep_id').AsString +
          ' and dep_inst = ' + qDbt.FieldByName('dep_inst').AsString +
          ' and org_id = ' + qDbt.FieldByName('org_id').AsString +
          ' and org_inst = ' + qDbt.FieldByName('org_inst').AsString;
        qDbtDate.Filter := vFilter;
        qDbtDate.Filtered := TRUE;

        blnc := 0;
        SummOver := 0;
        while (not qDbtDate.EOF) do
        begin
          Balance := FRound(Balance - Abs(qDbtDate.FieldByName('Total').Value));
          if (Balance < 0) then blnc := Balance;
          if Today_ - qDbtDate.FieldByName('Deb_Date').AsDateTime > Deadbeat_period then
            SummOver := SummOver + abs(qDbtDate.FieldByName('Total').Value) + blnc;
          //--------------------------------------------------------------------
          DecodeDate(qDbtDate.FieldByName('Deb_Date').AsDateTime, vYear, vMonth, vDay);
          if qDbtDate.FieldByName('oper_type').AsInteger = 194 then
          begin
            BeforeAlfaFlag := TRUE;
            field := 'sum_before_alfa';
          end
          else
            if (vSelectYear - vYear = 1) and (DEBET_LAST_YEAR = 'Y') then field := 'sum_last'
            else
            begin
              case Round(RM.From_date1.Date - qDbtDate.FieldByName('Deb_Date').AsDateTime) of
                0..29: field := 'sum0';
                30..59: field := 'sum30';
                60..89: field := 'sum60';
              else
                case (vSelectYear - vYear) of
                  0: field := 'sum90';
                  1: field := 'sum_last';
                  else field := 'sum_pre';
                end;
              end;
            end;
          mt.FieldByName(field).AsFloat :=
            mt.FieldByName(field).AsFloat + abs(qDbtDate.FieldByName('Total').Value) + blnc;
          //--------------------------------------------------------------------
          if (Balance <= 0) then break;
          qDbtDate.Next;
        end;
        mt.FieldByName('deb_date').AsString := qDbtDate.FieldByName('Deb_Date').AsString;

        exp_date := GetWaitedDate(qDbtDate.FieldByName('deb_date').AsDateTime, qDbtDate.FieldByName('exp_date').AsDateTime,
          qDbtDate.FieldByName('pay_type').AsInteger, qDbtDate.FieldByName('pay_corr').AsInteger);
        if (exp_date = 0) then mt.FieldByName('exp_date').AsString := TranslateText('не введена')
        else mt.FieldByName('exp_date').AsString := DateToStr(exp_date);

        qDbtDate.Filter := '';
        inc(counter);
        if StoreDeadbeats and (p_DebInside = 'N') and (SummOver > Deadbeat_summa) then
          MarkDeadbeat(qDbt.FieldByName('org_id').AsInteger, qDbt.FieldByName('org_inst').AsInteger, SummOver);
      end;
      qDbt.Next;
      if mt.State = dsInsert then mt.Post;
      if (d_id <> qDbt.FieldByName('dep_id').AsInteger) and PodrFragm or (qDbt.EOF) and (fRestSpecify) and (Rest > 0) then
      begin
        if mt.State = dsInsert then mt.Post;
        mt.Insert;
        mt.FieldByName('dep_name').AsString := d_name;
        mt.FieldByName('name').AsString := 'прочие';
        mt.FieldByName('sum').AsFloat := Rest;
        Rest := 0;
        if not qDbt.Eof then
        begin
          d_id := qDbt.FieldByName('dep_id').AsInteger;
          d_name := qDbt.FieldByName('dep_name').AsString;
        end;
      end;
    end;
    if mt.State = dsInsert then mt.Post;
  end;
  //****************************************************************************
  procedure MakeReportOne(p_ListNum: integer; p_DebInside: string);
  begin
    List := XLApp.ActiveWorkBook.WorkSheets[p_ListNum];
    XLApp.ActiveWorkBook.WorkSheets[p_ListNum].Select;
    FillMt(p_DebInside);
    mt.First;

    List.Cells[3, d_pos] := TranslateText('Подразделение ') + RM.ceOrg.Text +
      TranslateText(' на ') + FormatDateTime('dd.mm.yyyy', RM.From_date1.Date);
    Dbplan.SetCurrentOrgDateTime(10, 1, List);
    List.Cells[4, d_pos] := GoodsType;
    List.Cells[4, d_pos].Font.Bold := True;

    PuTOilQueryToExcelEnh(XLApp, List, mt, 7, Progr, 100, fields);

    List.Columns[1].Hidden := not PodrFragm;
    List.Columns[7].Hidden := not (RM.cb109_PrecedingYears.Checked and BeforeAlfaFlag);
    List.Columns[8].Hidden := not RM.cb109_PrecedingYears.Checked;
    List.Columns[9].Hidden := not RM.cb109_LastYear.Checked;
    List.Columns[10].Hidden := not RM.cb109_CurrentYear.Checked;
    List.Columns[11].Hidden := not RM.cb109_CurrentYear.Checked;
    List.Columns[12].Hidden := not RM.cb109_CurrentYear.Checked;
    List.Columns[13].Hidden := not RM.cb109_CurrentYear.Checked;
  end;
  //****************************************************************************
begin
  try
    PodrFragm := RM.cb109_Podr.Checked and (RM.OrgType = 4);
    //--------------------------------------------------------------------------
    qDbt := TOilQuery.Create(RM);
    qDbt.Session := frmStart.OraSession1;
    qDbtDate := TOilQuery.Create(RM);
    qDbtDate.Session := frmStart.OraSession1;

    Condition := 'deb_date < ''' + DateToStr(RM.From_date1.Date) + ''' and ' +
      IntToStr(RM.OrgId) + ' in (dep_id,dep_par_id) and (deb_inside = ''Y'' or org_type';
    if vDbt_Organization = '' then Condition := Condition + ' = 1) '
    else Condition := Condition + ' in (' + vDbt_Organization + ')) ';

    if vDbt_Part <> '' then Condition := Condition + 'and goal_part_type in (' + vDbt_Part + ') ';
    Condition := Condition + GetKOSCondition('own_goods', RM.cb109_Commission.Checked, RM.cb109_Own.Checked, RM.cb109_Other.Checked);

    GoodsType := TranslateText('Виды товара: ') + GetConstructedString([TranslateText('комиссия'), TranslateText('собственный'), TranslateText('прочий')],
      [RM.cb109_Commission.Checked, RM.cb109_Own.Checked, RM.cb109_Other.Checked]);

    if PodrFragm then s := 'Dep'
    else s := 'Obl';

    qDbt.Sql.Text := 'select ' + s + '_id as dep_id,' + s + '_inst as dep_inst,' + s + '_name as dep_name,org_id,org_inst,' +
      ' okpo as id_num,org_name as name,deb_inside,sum(total) as Balance ' +
      'from v_oil_debitorka where ' + Condition +
      'group by ' + s + '_id,' + s + '_inst,' + s + '_name,org_id,org_inst,okpo,org_name,deb_inside ' +
      'having sum(total) > 0 order by dep_id,dep_name,name ';

    try
      qDbt.Prepare;
      qDbt.Open;
    except on E: Exception do
      begin
        MessageDlg(TranslateText('Ошибка при открытии главного запроса!!!') +#10#13+ E.Message, mtError, [mbOk], 0);
        ShowTextInMemo(qDbt.Sql.Text);
        exit;
      end;
    end;

    qDbtDate.Sql.Text := 'select '+ s +'_id as dep_id, '+ s +'_inst as dep_inst, org_id, org_inst, deb_date, exp_date, pay_type, pay_corr,' +
      ' oper_type, sum(debet) AS total from v_oil_debitorka where '+ Condition +
      'group by '+ s +'_id, '+ s +'_inst, org_id, org_inst, deb_date, exp_date, pay_type, pay_corr, oper_type ' +
      'having sum(debet) > 0 order by deb_date desc ';

    try
      qDbtDate.Prepare;
      qDbtDate.Open;
    except on E: Exception do
      begin
        MessageDlg(TranslateText('Ошибка при открытии детального запроса!!!') +#10#13+ E.Message, mtError, [mbOk], 0);
        ShowTextInMemo(qDbtDate.Sql.Text);
        exit;
      end;
    end;
    //--------------------------------------------------------------------------
    mt := DBPlan.mtDebitors;
    if PodrFragm then d_pos := cCol_dep
    else d_pos := cCol_name;
    Today_ := trunc(GetSystemDate);
    // Дата сьогоднішня чи вище, тип товару - ок, періоди - ок, організації - not, цільові партії - not
    StoreDeadbeats := (RM.From_date1.Date >= Today_) and (RM.OrgID = REAL_INST) and
      (RM.cb109_Commission.Checked) and (RM.cb109_Own.Checked) and (RM.cb109_Other.Checked) and
      (not RM.cb109_Organization.Checked) and (not RM.cb109_Part.Checked) and (RM.cb109_CurrentYear.Checked) and
      (RM.cb109_LastYear.Checked) and (RM.cb109_PrecedingYears.Checked);

    if StoreDeadbeats then
    begin
      StartSQL;
      SwitchDeadbeatToN;
    end;

    Deadbeat_period := StrToInt(ReadOILVar('DEADBEAT_PERIOD'));
    Deadbeat_summa := StrToInt(ReadOILVar('DEADBEAT_SUMMA'));

    if (qDbt.RecordCount = 0) then
    begin
      if StoreDeadbeats then
      begin
        SimpleWriteOilVar('MADE_DEBETORS', FormatDateTime('dd.mm.yyyy hh:nn:ss', GetSystemDate));
        CommitSQL;
      end;
      Exit;
    end;

    DecodeDate(RM.From_date1.Date, vSelectYear, vMonth, vDay);
    if PodrFragm then fields := 'dep_name\i;'
    else fields := 'dep_name;';
    fields := fields + 'name;id_num;sum\s;deb_date;exp_date;sum_before_alfa\s;sum_pre\s;sum_last\s;sum0\s;sum30\s;sum60\s;sum90\s';
    ActivateXLApp('Debitors', 'Debitors', 2, XLApp, List);
    MakeReportOne(2, 'Y');
    MakeReportOne(1, 'N');

    if StoreDeadbeats then
    begin
      SimpleWriteOilVar('MADE_DEBETORS', FormatDateTime('dd.mm.yyyy hh:nn:ss', GetSystemDate));
      CommitSQL;
    end;

    List.Cells[1, 1].Select;
    XLApp.Visible := TRUE;
  finally
    qDbt.Free;
    qDbtDate.Free;
  end;
end;
//==============================================================================
//=============================Ведомость Кредиторов=============================
//==============================================================================
procedure Creditors(var RM: TRepManagerForm; Progr: TProgrForm; List: Variant);
// для определения дебиторов и кредиторов используется один запрос только с разными условиями
var
  condition, s: string;
  PodrFragm: boolean;
begin
  try
    PodrFragm := RM.cb110_Podr.Checked and (RM.OrgType = 4);

    if PodrFragm then s := 'Dep'
    else s := 'Obl';

    qDbt := TOilQuery.Create(RM);
    qDbt.Session := frmStart.OraSession1;
    Condition := 'deb_date < ''' + DateToStr(RM.From_date1.Date) + ''' and ' + IntToStr(RM.OrgId) + ' in (dep_id,dep_par_id) ';
    if vDbt_Organization = '' then Condition := Condition + 'and org_type=1 '
    else Condition := Condition + 'and org_type in (' + vDbt_Organization + ') ';

    if vDbt_Part <> '' then Condition := Condition + 'and goal_part_type in (' + vDbt_Part + ') ';
    Condition := Condition + GetKOSCondition('own_goods', RM.cb110_Commission.Checked,
      RM.cb110_Own.Checked, RM.cb110_Other.Checked);

    GoodsType := TranslateText('Виды товара: ') + GetConstructedString([TranslateText('комиссия'),
      TranslateText('собственный'), TranslateText('прочий')],
      [RM.cb110_Commission.Checked, RM.cb110_Own.Checked, RM.cb110_Other.Checked]);

    qDbt.Sql.Text := 'select ' + s + '_id as dep_id,' + s + '_inst as dep_inst,' + s + '_name as dep_name,' +
      'org_id,org_inst,okpo as id_num,org_name as name,sum(total) as Balance ' +
      'from v_oil_debitorka where ' + Condition +
      'group by ' + s + '_id,' + s + '_inst,' + s + '_name,org_id,org_inst,okpo,org_name ' +
      'having sum(total) < 0 order by dep_id,dep_name,name ';

    try
      qDbt.Prepare;
      qDbt.Open;
    except on E: Exception do
      begin
        MessageDlg(TranslateText('Ошибка при открытии главного запроса!!!') +#10#13+ E.Message, mtError, [mbOk], 0);
        ShowTextInMemo(qDbt.Sql.Text);
        exit;
      end;
    end;

    // вывести результаты
    if PodrFragm then d_pos := cCol_dep
    else d_pos := cCol_name;

    List.Cells[cRow_depTitle, d_pos] := TranslateText('Подразделение ') + RM.ceOrg.Text;
    List.Cells[cRow_depTitle, cCol_depTitle] := TranslateText('на ') + FormatDateTime('dd.mm.yyyy', RM.From_date1.Date);
    //Место, дата, время.
    Dbplan.SetCurrentOrgDateTime(cCol_place, cRow_place, List);
    List.Cells[cRow_goods, d_pos] := GoodsType;
    List.Cells[cRow_goods, d_pos].Font.Bold := True;

    if (qDbt.RecordCount = 0) then  Exit;
    counter := cRow_start;
    d_coun := counter;
    step := 100 / qDbt.RecordCount;
    delta := 0;
    d_id := qDbt.FieldByName('dep_id').AsInteger;

    // fRestSpecify = True  - объединять дебиторов в прочие
    // fRestSpecify = False - не объединять дебиторов в прочие
    fRestSpecify := not RM.cb110_RestSpecify.Checked;
    Rest := 0;
    // заполнить ведомость
    while (not qDbt.EOF) do
    begin
      delta := delta + step;
      progr.Progress := Round(delta);
      // Сумма следующего дебитора
      Balance := abs(qDbt.FieldByName('balance').AsFloat);
      // анализ текущего дебитора
      if (fRestSpecify) and (Balance < cDbt_RestMax) then Rest := Rest + Balance
      else
      begin
        List.Cells[counter, cCol_dep] := qDbt.FieldByName('dep_name').AsString;
        List.Cells[counter, cCol_name] := qDbt.FieldByName('name').AsString;
        List.Cells[counter, cCol_num] := qDbt.FieldByName('id_num').AsString;
        List.Cells[counter, cCol_sum] := Balance;
        inc(counter);
      end;
      qDbt.Next;

      if (d_id <> qDbt.FieldByName('dep_id').AsInteger) or (qDbt.EOF) then // вывод итогов по филиалу
      begin
        if (fRestSpecify) and (Rest > 0) then // группа "Прочие" для филиала
        begin
          List.Cells[counter, d_pos] := 'Прочие';
          List.Cells[Counter, cCol_sum] := Rest;
          Rest := 0;
          inc(counter);
        end;
        // общая сумма по филиалу
        List.Cells[counter, d_pos] := 'ИТОГО';
        if (counter > cRow_start) then
          List.Cells[Counter, cCol_sum] := Format(cfrmDbt_SubTotal, [ByteToLetters(cCol_sum), d_coun, counter - 1]);
        List.Rows[Counter].Font.Bold := True;
        inc(counter);
        if (not qDbt.EOF) then
        begin
          d_id := qDbt.FieldByName('dep_id').AsInteger;
          d_coun := counter;
        end;
      end;
    end;

    case RM.OrgType of
      3: List.Columns[cCol_dep].Hidden := True; // ППОН
      4: // Облуправление
        begin
          List.Cells[counter, cCol_dep] := 'ВСЕГО';
          List.Cells[counter, cCol_sum] := Format(cfrmDbt_SubTotal, [ByteToLetters(cCol_sum), cRow_start, counter - 1]);
          List.Rows[counter].Font.Bold := True;
        end;
    end;
  finally
    qDbt.Free;
  end;
  List.Cells[1, 1].Select;
  progr.Progress := 100;
end;
//==============================================================================

end.
