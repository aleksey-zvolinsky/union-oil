//-------------------------------------------------------------------
//
//                   <Отчет остатки ОАО>
//
//-------------------------------------------------------------------
unit Rep_RegionRest;
{### 1.01}
// 20 мая 2003
//      исправлена вторая страница отчета, добавлены списания по лимитной схеме,
//      добавлена сортировка по номеру филиала (Должиков)

interface

uses uCommonForm,
  Progr,ReportManager,Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX,StdCtrls, Buttons, ExtCtrls, CurrEdit, RxLookup, Mask, ToolEdit, Db,
  DBTables,Excel8TLB, Grids, DBGrids, ComObj, Clipbrd, OilStd, Comctrls, DbGridEh,ExFunc,Ora,uOilQuery,uOilStoredProc;

type
  TMoney=record
    Summ,Tonn:Real;          // числове значення
    SummAdr,TonnAdr:string;  // адреса на головному листі
  end;
  TTotal=record
    Period, Last:TMoney;
  end;  
  TAllTotal=record
    Talon, Card, Bank:TTotal;
  end;


procedure RegionRest(var RM:TRepManagerForm;Progr:TProgrForm;XLApp,List:Variant;RepType:integer = 0);
procedure ShowSprInfo(List:Variant);
procedure RegionRestGaz(
  List: Variant;
  p_BeginDate,p_EndDate: TDateTime;
  p_NumDays: integer);
function GetBrokenRezervString(p_DepId,p_NpGrp: integer): string;

implementation

uses
   Rep_s, uDBPlan, MoneyFunc, UDbFunc, ExcelFunc, Main, uGridFunc, DateUtils, MemTable;

const
     C_FILIAL               = 'A';
     C_REST_TYPE            = 'B';
     C_REST_REAL            = 'C';
     C_REST_STORE           = 'D';
     C_REST_STORE_TNK       = 'E';
     C_REST_STORE_CVO       = 'F';
     C_REST_ITOGO           = 'G';  // заполнена в экселе
     C_REST_OWN             = 'H';
     C_REZERVUAR_DEAD_ZAPAS = 'I';
     C_REZERVUAR_TUB_ZAPAS  = 'J';
     C_ZAPAS_WITHOUT_TNK    = 'K';
     C_ZAPAS_WITH_TNK       = 'L';
     C_REZERV_VSEGO         = 'M';
     C_REZERV_FREE          = 'N';
     C_REZERVUAR_DEAD_ALL   = 'O';
     C_REST_WAY             = 'P';
     //C_TALON_DEBT           = 'Q';  --> не заповнювати
     C_REAL_TYPE            = 'R';
     C_REAL_DAY_TONN        = 'S';
     C_REAL_DAY_MONEY       = 'T';
     C_REAL_PRICE_TONN      = 'U';
     C_REAL_PRICE_LITR      = 'V';
     C_REAL_MONTH_TONN      = 'W';
     C_REAL_MONTH_MONEY     = 'X';
     C_REAL_AVG             = 'Y';
     C_VZAIM                = 'Z';
     C_SELF                 = 'AA';
     C_BARTER               = 'AB';
     C_SELF_MONTH           = 'AC';
     C_TALON_DAY            = 'AD';
     C_TALON_DAY_MONEY      = 'AE';
     C_TALON_MONTH          = 'AF';
     C_TALON_MONTH_MONEY    = 'AG';
     C_SMARTCARD_DAY        = 'AH';
     C_SMARTCARD_DAY_MONEY  = 'AI';
     C_SMARTCARD_MONTH      = 'AJ';
     C_SMARTCARD_MONTH_MONEY= 'AK';
     C_LAST_COLUMN          =  37 ;

     REL_NAME               = 'A';
     REL_MO_MONTH           = 'B';
     REL_AZS_MONTH          = 'C';
     REL_TALON_MONTH        = 'D';
     REL_SMARTCARD_MONTH    = 'E';
     REL_MO_DAY             = 'F';
     REL_AZS_DAY            = 'G';
     REL_TALON_DAY          = 'H';
     REL_SMARTCARD_DAY      = 'I';
     REL_LAST_COLUMN        =  9 ;

     AZS_DEPNAME            = 'A';
     AZS_NAME               = 'B';
     AZS_REST_TONN          = 'C';
     AZS_DEAD_TONN          = 'D';
     AZS_REAL_AVG           = 'E';
     AZS_REZERV             = 'F';
     AZS_PRIH_LAST_DATE     = 'G';
     AZS_LAST_COLUMN        =  7 ;

     GAZ_DEP_NAME           = 'A';
     GAZ_AZS_NAME           = 'B';
     GAZ_AGZS_REST          = 'C';
     GAZ_GNS_STORE          = 'D';
     GAZ_AN_STORE           = 'E';
     GAZ_IN_WAY             = 'F';
     GAZ_TOTAL              = 'G';
     GAZ_REAL_AZSNAME       = 'H';
     GAZ_REAL_AZSADDR       = 'I';
     GAZ_REAL_DAY_TONN      = 'J';
     GAZ_REAL_DAY_MONEY     = 'K';
     GAZ_REAL_DAY_PRICE     = 'L';
     GAZ_REAL_MONTH_TONN    = 'M';
     GAZ_REAL_MONTH_MONEY   = 'N';
     GAZ_REAL_MONTH_PRICE   = 'O';
     GAZ_TALON_DAY_TONN     = 'P';
     GAZ_TALON_MONTH_TONN   = 'Q';
     GAZ_CARD_DAY_TONN      = 'R';
     GAZ_CARD_MONTH_MONEY   = 'S';
     GAZ_LAST_COLUMN        = 19 ;


     DEP = 0;
     AZS = 3;

     cTotalList = [ 4..10,
                   13..16,
                   19..20,
                   23..37];
     cTonnList  = [ 4..10,
                   14..16,
                   19,23,
                   25..32,
                   34,36];
     cMoneyList = [20..22,
                   24,31,33,
                   35,37];
     cDaysList  = [11,12];

     azsTotalList = [3..5];
     azsTonnList  = [3..5];
     azsDaysList  = [6];
     //azsDateList  = [7];


var
     counter,  np_start, dep_start, np_total_counter: Integer;  //вказівники на рядки екселя
     np_type, dep_id: Integer;  //коди НП та філіала
     delta, step: Real;
     vTotal, vSumTotal, vSumTotal_tf,vSumPr,vSumMO,vSumAZS: string;
     vSumGaz,MOGaz,AZSGaz,TalonGaz,SmCardGaz,BankCardGaz: string; // блок газовых переменных
     qRR, qBRez: TOilQuery;
     DepList: TStringList;
     GazTotal, CurrTotal:TAllTotal;
     IsNpGaz,IsNpPr, IsToTotal, IsCardsSubTotal: integer;
     IsNp62: boolean;
     IsNPRecEmpty : boolean = False;   //"тру", якщо результати по НП =0, тоді НП не включається в таблицю.
     f1: integer=0;
     f2: integer=0;

procedure AllTotal2Zero(var AAllTotal:TAllTotal);
  procedure Total2Zero(var ATotal:TTotal);
    procedure Money2Zero(var AMoney:TMoney);
    begin
      AMoney.SummAdr := '';
      AMoney.TonnAdr := '';
      AMoney.Summ:=0;
      AMoney.Tonn:=0;
    end;
  begin
    Money2Zero(ATotal.Period);
    Money2Zero(ATotal.Last);
  end;
begin
  Total2Zero(AAllTotal.Talon);
  Total2Zero(AAllTotal.Card);
  Total2Zero(AAllTotal.Bank);
end;
//==============================================================================
procedure RegionRest(var RM:TRepManagerForm;Progr:TProgrForm;XLApp,List:Variant;RepType:integer = DEP);
   //***************************************************************************
   procedure OutTitle; // процедура формирует заголовок отчета
   var vTmp: string;
   begin
     List.Cells[1,1] := RM.ceOrg.Text + ' c ' + DateToStr(RM.From_date2.Date) +
                               TranslateText(' по ') + DateToStr(RM.To_date2.Date);
     List.Rows[1].Font.Bold:=TRUE;
     if RepType = DEP then begin
       DBPlan.SetCurrentOrgDateTime(C_LAST_COLUMN,1,List);   // організація, версія Ойла та таймштамп звіту - в ласт колумн
       case RM.rg100_OwnGoods.ItemIndex of
          0: begin
             List.Cells[3,C_REST_REAL]:=TranslateText('Альфа-Нафта');
             List.Cells[5,C_REST_TYPE]:=TranslateText('комиссия');
          end;
          1: List.Cells[5,C_REST_TYPE]:=TranslateText('реализация');
       end;
       List.Cells[2,C_REST_ITOGO]:=DateToStr(RM.To_date2.Date+1);

       if RM.ce100_days.AsInteger < 2 then
         vTmp:=DateToStr(RM.To_date2.Date)
       else
         vTmp:=DateToStr(RM.To_Date2.Date-RM.ce100_days.AsInteger+1)+' - '+DateToStr(RM.To_date2.Date);

       List.Cells[2,C_BARTER] := vTmp;
       List.Cells[3,C_REAL_TYPE] := vTmp;
       List.Cells[3,C_TALON_DAY] := vTmp;
       List.Cells[3,C_SMARTCARD_DAY] := vTmp;

       vTmp:=FormatDateTime('mmmm',RM.To_date2.Date);
       List.Cells[3,C_REAL_MONTH_TONN] := vTmp;
       List.Cells[2,C_SELF_MONTH]  := vTmp;
       List.Cells[3,C_TALON_MONTH] := vTmp;
       List.Cells[3,C_SMARTCARD_MONTH] := vTmp;

       case RM.rg100_Talon.ItemIndex of
           0: vTmp:=TranslateText('(отпущенные)');
           1: vTmp:=TranslateText('(отоваренные)');
       end;
       List.Cells[4,C_TALON_DAY]:=vTmp;
       List.Cells[4,C_TALON_MONTH]:=vTmp;

       case RM.rg100_OpNb.ItemIndex of
           0: vTmp := '('+TranslateText('в т.ч. ОП - пополнения')+')';
           1: vTmp := '('+TranslateText('в т.ч. ОП - заявки')+')';
       end;
       List.Cells[4,C_SMARTCARD_DAY] := vTmp;
       List.Cells[4,C_SMARTCARD_MONTH] := vTmp;
     end;
     if RepType = AZS then begin
       List.Cells[3,AZS_REST_TONN] := DateToStr(RM.To_date2.Date+1);
     end;
   end;
   //***************************************************************************
   procedure ExecQuery;
   var post:integer;
   begin
     // перерахунок до першої дати попереднього місяця - 1 від дати :p_DateBegin
     RecalcRegionRest(StartOfTheMonth(StartOfTheMonth(RM.From_date2.Date)-1)-1);
     qRR:=DBPlan.qRegionRest;
     if qRR.Active then qRR.Close;
     qRR.Filtered := False;
     qRR.ParamByName('p_dep').Value:=RM.OrgID;
     qRR.ParamByName('p_BeginDate').Value:=RM.from_date2.Date;
     qRR.ParamByName('p_EndDate').Value:=RM.to_date2.Date;
     if RM.cb100_IR.Checked then qRR.ParamByName('InternalReal').AsInteger:=1
                            else qRR.ParamByName('InternalReal').AsInteger:=0;

     if RM.cb100_Alfa.Checked then
        if RM.cb100_NkAlfa.Checked then post:=0
        else post:=38
     else post:=4587;
     qRR.ParamByName('post').AsInteger:=post;

     qRR.ParamByName('OtpOtov').AsInteger := RM.rg100_Talon.ItemIndex;
     qRR.ParamByName('OPRefReq').AsInteger := RM.rg100_OpNb.ItemIndex;  // 0 -> ОП з транзакцій;
                                                                        // 1 -> ОП із заявок (request_inst is null);

     if RM.cb100_Maslo.Checked then qRR.ParamByName('DopGroups').AsInteger:=0
                               else qRR.ParamByName('DopGroups').AsInteger:=1;

     qRR.ParamByName('NumDays').AsInteger:=RM.ce100_days.AsInteger;

     qRR.ParamByName('KomOwn').AsInteger:=RM.rg100_OwnGoods.ItemIndex;
     //ShowTextInMemo(FullSqlTextOra(qRR));
     qRR.Prepare;
     _OpenQueryOra(qRR);   
     List.Cells[1,C_LAST_COLUMN+1].Font.Color := clWhite;
     List.Cells[1,C_LAST_COLUMN+1] := qRR.SQL.Strings[qRR.SQL.Count-1];  // останній рядок sql-запиту - версія qRegionRest
     qRR.Filter := ' AZS_ID=0';
     qRR.Filtered := True;

     //Несправні резервуари
     qBRez := DBPlan.qRegionRestRezervs;
     _OpenQueryPar(qBRez, ['date_', RM.to_date2.Date]);
   end;
   //***************************************************************************
   procedure InitOut; // процедура задает начальные установки переменных
   begin
     vTotal:='=SUM( '; // итог по группе НП (для страниц "Главная" и "Остатки на АЗС")
     if RepType = DEP then begin
       counter:=6;
       delta:=0;
       step:=33/qRR.RecordCount;
       vSumTotal:='=SUM( ';
       vSumTotal_tf:='=SUM( ';
       vSumPr:='=SUM( ';

       //блок  газа
       vSumGaz:='=SUM( ';
       MOGaz:='SUM( ';// без равно Sum
       AZSGaz:='SUM( ';// без равно Sum
       TalonGaz:='SUM( ';// без равно Sum
       SmCardGaz:='SUM( ';// без равно Sum
       BankCardGaz:='SUM( ';// без равно Sum

       vSumMO:='=SUM(  ';
       vSumAZS:='=SUM(  ';

       AllTotal2Zero(GazTotal);
       AllTotal2Zero(CurrTotal);

       // создать список всех подразделений упоменаемых в отчете
       DepList:=TStringList.Create;
       DBPlan.mtDep.Close;
       DBPlan.mtDep.Open;
     end;
     if RepType = AZS then begin
       IsNPRecEmpty := False;
       counter := 5;
       np_total_counter := 14;  //14 рядок - початок розділу "Всього по видам НП:"
       delta := 66;
       step := 33/qRR.RecordCount;
     end;
   end;
   //***************************************************************************
   procedure OutTitlePetrol; // процедура выводит название нефтепродукта
   begin
     np_type:=qRR.FieldByName('id').AsInteger;
     dep_id := qRR.FieldByName('dep_id').AsInteger;
     List.Cells[counter,1]:=qRR.FieldByName('Name').AsString;
     inc(counter);
     np_start:=counter;
     if RepType = AZS then
       begin
         if IsToTotal = 1 then
           List.Cells[np_total_counter,AZS_NAME] := qRR.FieldByName('Name').AsString;
         List.Cells[counter,1] := qRR.FieldByName('Dep_Name').AsString;
         dep_start := counter;
         inc(counter);
       end;
   end;
   //***************************************************************************
   procedure OutRow; // процедура выводит строку по подразделению или АЗС
   var s: string;
   begin
     if RepType = DEP then
       begin
         vTotal:=vTotal+Format('%s%d;',[C_REST_REAL,counter]);
         if (DepList.IndexOf(qRR.FieldByName('Dep_name').AsString)=-1) then
         begin
           DepList.Add(qRR.FieldByName('Dep_name').AsString);
           DBPlan.mtDep.Append;
           DBPlan.mtDep.FieldByName('DEP_NAME').AsString := qRR.FieldByName('Dep_name').AsString;
           DBPlan.mtDep.FieldByName('DEP_ID').AsInteger := qRR.FieldByName('Dep_Id').AsInteger;
           DBPlan.mtDep.FieldByName('Num').AsInteger := qRR.FieldByName('Order_Id').AsInteger;
           DBPlan.mtDep.Post;
        end;

        if IsCardsSubTotal=1 then
        begin
          CurrTotal.Card.Last.Tonn := CurrTotal.Card.Last.Tonn + qRR.FieldByName('LastDayCard').AsFloat;
          CurrTotal.Card.Period.Tonn := CurrTotal.Card.Period.Tonn + qRR.FieldByName('PeriodCard').AsFloat;
          CurrTotal.Card.Last.Summ := CurrTotal.Card.Last.Summ + qRR.FieldByName('PriceLastDayCard').AsFloat;
          CurrTotal.Card.Period.Summ := CurrTotal.Card.Period.Summ + qRR.FieldByName('PricePeriodCard').AsFloat;

          CurrTotal.Bank.Last.Tonn := CurrTotal.Bank.Last.Tonn + qRR.FieldByName('LastDayBankCard').AsFloat;
          CurrTotal.Bank.Period.Tonn := CurrTotal.Bank.Period.Tonn + qRR.FieldByName('PeriodBankCard').AsFloat;
          CurrTotal.Bank.Last.Summ := CurrTotal.Bank.Last.Summ + qRR.FieldByName('PriceLastDayBankCard').AsFloat;
          CurrTotal.Bank.Period.Summ := CurrTotal.Bank.Period.Summ + qRR.FieldByName('PricePeriodBankCard').AsFloat;
        end;

        with DBPlan do begin
           List.Cells[counter,C_FILIAL]:=qRR.FieldByName('Dep_name').AsString;
           List.Cells[counter,C_REST_REAL]:=qRR.FieldByName('RestSale').AsFloat;
           List.Cells[counter+1,C_REST_REAL]:=
             qRR.FieldByName('RestSalePS').AsFloat;
           List.Cells[counter,C_REST_STORE]:=qRR.FieldByName('RestStore').AsFloat;
           List.Cells[counter,C_REST_STORE_TNK]:=qRR.FieldByName('RestTnkStore').AsFloat;
           List.Cells[counter,C_REST_STORE_CVO]:=qRR.FieldByName('RestCvoStore').AsFloat;
           List.Cells[counter,C_REST_OWN]:=qRR.FieldByName('RestOwn').AsFloat;
           List.Cells[counter,C_REZERVUAR_DEAD_ZAPAS]:=qRR.FieldByName('RezervDeadTonnZapas').AsFloat;
           List.Cells[counter,C_REZERVUAR_TUB_ZAPAS]:=qRR.FieldByName('RezervTubCapacityTonnZapas').AsFloat;

           //фомруємо формули розрахунку запасів по н/б.
           s := Format('%s%d+%s%1:d-%3:s%1:d-%4:s%1:d',
                       [C_REST_REAL,counter,C_REST_STORE,C_REZERVUAR_DEAD_ZAPAS,C_REZERVUAR_TUB_ZAPAS]);
           List.Cells[counter,C_ZAPAS_WITHOUT_TNK]:=
              Format('=IF(OR(%s%d=0;%s<0);0;(%2:s)/%0:s%d)',[C_REAL_AVG,counter+1,s]);
           s := Format('%s%d+%s',[C_REST_STORE_TNK,counter,s]);
           List.Cells[counter,C_ZAPAS_WITH_TNK]:=
              Format('=IF(OR(%s%d=0;%s<0);0;(%2:s)/%0:s%d)',[C_REAL_AVG,counter+1,s]);
           List.Cells[counter,C_REZERV_VSEGO]:=qRR.FieldByName('RezervCapacity').AsFloat;

           s:=GetBrokenRezervString(qRR.FieldByName('dep_id').AsInteger,
                                    qRR.FieldByName('id').AsInteger);
           //XLApp.Run('SetUserComment',counter,C_REZERV_VSEGO,s);  //--> реально глючить
           //........... переведено з макроса в дельфю .................
           List.Range[Format('%s%d',[C_REZERV_VSEGO,counter])].ClearComments;
           if s <> '' then
             begin
               List.Range[Format('%s%d',[C_REZERV_VSEGO,counter])].AddComment(s);
               List.Range[Format('%s%d',[C_REZERV_VSEGO,counter])].Comment.Shape.Width := 400;
               List.Range[Format('%s%d',[C_REZERV_VSEGO,counter])].Comment.Visible := False;
             end;
           //............................................................

           List.Cells[counter,C_REZERV_FREE]:=qRR.FieldByName('RezervFreeSpace').AsFloat;
           List.Cells[counter,C_REZERVUAR_DEAD_ALL]:=qRR.FieldByName('RezervDeadTonnAll').AsFloat;
           List.Cells[counter,C_REST_WAY]:=qRR.FieldByName('InWay').AsFloat;
           List.Cells[counter,C_REAL_DAY_TONN]:=qRR.FieldByName('LastDay').AsFloat;
           List.Cells[counter+1,C_REAL_DAY_TONN]:=qRR.FieldByName('LastDayPS').AsFloat;
           List.Cells[counter,C_REAL_DAY_MONEY]:=qRR.FieldByName('PriceLastDay').AsFloat;
           List.Cells[counter+1,C_REAL_DAY_MONEY]:=qRR.FieldByName('PriceLastDayPS').AsFloat;
           if (qRR.FieldByName('LastDay').AsFloat>0) then
              List.Cells[counter,C_REAL_PRICE_TONN]:=
                  mRound(qRR.FieldByName('PriceLastDay').AsFloat/qRR.FieldByName('LastDay').AsFloat,2)
           else List.Cells[counter,C_REAL_PRICE_TONN]:=0;

           if (qRR.FieldByName('LastDayPS').AsFloat>0) then
              List.Cells[counter+1,C_REAL_PRICE_TONN]:=
                  mRound(qRR.FieldByName('PriceLastDayPS').AsFloat/qRR.FieldByName('LastDayPS').AsFloat,2)
           else List.Cells[counter+1,C_REAL_PRICE_TONN]:=0;

           if (qRR.FieldByName('LastDayLitrPS').AsFloat>0) then
              List.Cells[counter+1,C_REAL_PRICE_LITR]:=
                  mRound(qRR.FieldByName('PriceLastDayPS').AsFloat/qRR.FieldByName('LastDayLitrPS').AsFloat,2)
           else List.Cells[counter+1,C_REAL_PRICE_LITR]:=0;

           List.Cells[counter,C_REAL_MONTH_TONN]:=qRR.FieldByName('Period').AsFloat;
           List.Cells[counter+1,C_REAL_MONTH_TONN]:=qRR.FieldByName('PeriodPS').AsFloat;
           List.Cells[counter,C_REAL_MONTH_MONEY]:=qRR.FieldByName('PricePeriod').AsFloat;
           List.Cells[counter+1,C_REAL_MONTH_MONEY]:=qRR.FieldByName('PricePeriodPS').AsFloat;

           List.Cells[counter+1,C_REAL_AVG]:=qRR.FieldByName('AvgPrevPeriodPs').AsFloat;

           List.Cells[counter,C_VZAIM]:=qRR.FieldByName('Reckoning').AsFloat;
           List.Cells[counter,C_SELF]:=qRR.FieldByName('Auxiliary').AsFloat;
           List.Cells[counter,C_BARTER]:=qRR.FieldByName('Exchange_').AsFloat;
           List.Cells[counter,C_SELF_MONTH]:=qRR.FieldByName('Expense').AsFloat;

           List.Cells[counter,C_TALON_DAY]:=qRR.FieldByName('LastDayTalon').AsFloat;
           List.Cells[counter,C_TALON_DAY_MONEY]:=qRR.FieldByName('PriceLastDayTalon').AsFloat;
           List.Cells[counter,C_TALON_MONTH]:=qRR.FieldByName('PeriodTalon').AsFloat;
           List.Cells[counter,C_TALON_MONTH_MONEY]:=qRR.FieldByName('PricePeriodTalon').AsFloat;

           CurrTotal.Talon.Last.Tonn := CurrTotal.Talon.Last.Tonn + qRR.FieldByName('LastDayTalon').AsFloat;
           CurrTotal.Talon.Period.Tonn := CurrTotal.Talon.Period.Tonn + qRR.FieldByName('PeriodTalon').AsFloat;
           CurrTotal.Talon.Last.Summ := CurrTotal.Talon.Last.Summ + qRR.FieldByName('PriceLastDayTalon').AsFloat;
           CurrTotal.Talon.Period.Summ := CurrTotal.Talon.Period.Summ + qRR.FieldByName('PricePeriodTalon').AsFloat;

           List.Cells[counter,C_SMARTCARD_DAY] := qRR.FieldByName('LastDayCard').AsFloat;
           List.Cells[counter,C_SMARTCARD_DAY_MONEY] := qRR.FieldByName('PriceLastDayCard').AsFloat;
           List.Cells[counter,C_SMARTCARD_MONTH] := qRR.FieldByName('PeriodCard').AsFloat;
           List.Cells[counter,C_SMARTCARD_MONTH_MONEY] := qRR.FieldByName('PricePeriodCard').AsFloat;

         end;
         counter:=counter+2;
       end;
     if (RepType = AZS) then
           begin
             List.Cells[counter,AZS_NAME]           := qRR.FieldByName('AZS_Name').AsString;
             List.Cells[counter,AZS_REST_TONN]      := qRR.FieldByName('AZS_RestSalePs').AsFloat;
             List.Cells[counter,AZS_DEAD_TONN]      := qRR.FieldByName('AZS_RezervDeadTonn').AsFloat;
             List.Cells[counter,AZS_REAL_AVG]       := qRR.FieldByName('AZS_AvgPrevPeriodPs').AsFloat;
             List.Cells[counter,AZS_PRIH_LAST_DATE] := DateToStr(qRR.FieldByName('AZS_PrihLastDate').AsDateTime);
             s := Format('%s%d-%s%d', [AZS_REST_TONN,counter,AZS_DEAD_TONN,counter]);
             List.Cells[counter,AZS_REZERV] := Format('=IF(%s%d=0,0,('+s+')/%s%d)',[AZS_REAL_AVG,counter,AZS_REAL_AVG,counter]);  //<-- тут чомусь видає помилку OLE error 0x800A03EC.  //<--вирішилось! Замінити ; на ,
             inc(counter);
           end;
   end; // procedure OutRow;
   //***************************************************************************
   procedure azsOutTotalDEP;  // виводимо суми по н/б для поточного НП.
   var
     i: integer;
   begin
     vTotal := vTotal + Format('%s%d,',[AZS_REST_TONN,counter]);
     List.Cells[counter,AZS_REST_TONN]:=Format('=SUM(%s%d:%s%d)',[AZS_REST_TONN,dep_start+1,AZS_REST_TONN,counter-1]);
     List.Cells[counter,AZS_REST_TONN].Copy;
     for i:=4 to AZS_LAST_COLUMN do
       if (i in azsTotalList) then
         List.Cells[counter,i].PasteSpecial;
     inc(counter);
   end;
   //***************************************************************************
   procedure OutTotalPetrol; // процедура вывода результата по нефтепродукту
   var i: Integer;
       s, t: string;
   begin
     if RepType = DEP then
       begin
         vTotal[Length(vTotal)]:=')';
         List.Cells[counter,C_REST_REAL]:=vTotal;
         vTotal:='=SUM(';
         List.Cells[counter,C_REST_REAL].Copy;
         List.Cells[counter,C_REZERVUAR_DEAD_ZAPAS].PasteSpecial;
         List.Cells[counter,C_REZERVUAR_TUB_ZAPAS].PasteSpecial;
         List.Cells[counter,C_REZERV_VSEGO].PasteSpecial;
         List.Cells[counter,C_REZERV_FREE].PasteSpecial;
         List.Cells[counter,C_REZERVUAR_DEAD_ALL].PasteSpecial;
         List.Cells[counter,C_REAL_DAY_TONN].PasteSpecial;
         List.Cells[counter,C_REAL_DAY_MONEY].PasteSpecial;
         List.Cells[counter,C_REAL_MONTH_TONN].PasteSpecial;
         List.Cells[counter,C_REAL_MONTH_MONEY].PasteSpecial;
         inc(counter);

         List.Cells[counter,C_REST_REAL].PasteSpecial;
         List.Cells[counter,C_REAL_DAY_TONN].PasteSpecial;
         List.Cells[counter,C_REAL_DAY_MONEY].PasteSpecial;
         List.Cells[counter,C_REAL_MONTH_TONN].PasteSpecial;
         List.Cells[counter,C_REAL_MONTH_MONEY].PasteSpecial;
         List.Cells[counter,C_REAL_AVG].PasteSpecial;
         s:=IntToStr(counter-1);
         List.Cells[counter-1,C_REAL_PRICE_TONN]:=
           '=IF('+C_REAL_DAY_TONN+s+'=0;"";'+C_REAL_DAY_MONEY+s+'/'+C_REAL_DAY_TONN+s+')';
         List.Cells[counter-1,C_REAL_PRICE_TONN].Copy;
         List.Cells[counter,C_REAL_PRICE_TONN].PasteSpecial;        //цена за тонну АЗС
         List.Cells[counter+1,C_REAL_PRICE_TONN].PasteSpecial;      //цена за тонну Талоны
         List.Cells[counter+2,C_REAL_PRICE_TONN].PasteSpecial;      //цена за тонну Карты    //
         inc(counter);

         // результат по нефтепродукту Талоны
         List.Cells[counter,C_REAL_DAY_TONN]:=Format('=SUM(%s%d)',[C_TALON_DAY,counter+3]);
         List.Cells[counter,C_REAL_DAY_MONEY]:=Format('=SUM(%s%d)',[C_TALON_DAY_MONEY,counter+3]);
         List.Cells[counter,C_REAL_MONTH_TONN]:= Format('=SUM(%s%d)',[C_TALON_MONTH,counter+3]);
         List.Cells[counter,C_REAL_MONTH_MONEY]:=Format('=SUM(%s%d)',[C_TALON_MONTH_MONEY,counter+3]);
         inc(counter);

         // результат по нефтепродукту Карты
         List.Cells[counter,C_REAL_DAY_TONN]:=Format('=SUM(%s%d)',[C_SMARTCARD_DAY,counter+2]);
         List.Cells[counter,C_REAL_DAY_MONEY]:=Format('=SUM(%s%d)',[C_SMARTCARD_DAY_MONEY,counter+2]);
         List.Cells[counter,C_REAL_MONTH_TONN]:=Format('=SUM(%s%d)',[C_SMARTCARD_MONTH,counter+2]);
         List.Cells[counter,C_REAL_MONTH_MONEY]:=Format('=SUM(%s%d)',[C_SMARTCARD_MONTH_MONEY,counter+2]);
         inc(counter);

         // результат по нефтепродукту Банковские карты
         List.Cells[counter,C_REAL_DAY_TONN]:=CurrTotal.Bank.Last.Tonn;
         List.Cells[counter,C_REAL_DAY_MONEY]:=CurrTotal.Bank.Last.Summ;
         List.Cells[counter,C_REAL_MONTH_TONN]:=CurrTotal.Bank.Period.Tonn;
         List.Cells[counter,C_REAL_MONTH_MONEY]:=CurrTotal.Bank.Period.Summ;

         if IsNp62 then  //np_grp_id = 62
           begin
             GazTotal := CurrTotal;
             t := '=Главная!';
             s := IntToStr(counter-2);
             GazTotal.Talon.Last.TonnAdr   := t + C_REAL_DAY_TONN + s;
             GazTotal.Talon.Last.SummAdr   := t + C_REAL_DAY_MONEY + s;
             GazTotal.Talon.Period.TonnAdr := t + C_REAL_MONTH_TONN + s;
             GazTotal.Talon.Period.SummAdr := t + C_REAL_MONTH_MONEY + s;
             s := IntToStr(counter-1);
             GazTotal.Card.Last.TonnAdr   := t + C_REAL_DAY_TONN + s;
             GazTotal.Card.Last.SummAdr   := t + C_REAL_DAY_MONEY + s;
             GazTotal.Card.Period.TonnAdr := t + C_REAL_MONTH_TONN + s;
             GazTotal.Card.Period.SummAdr := t + C_REAL_MONTH_MONEY + s;
             s := IntToStr(counter);
             GazTotal.Bank.Last.TonnAdr   := t + C_REAL_DAY_TONN + s;
             GazTotal.Bank.Last.SummAdr   := t + C_REAL_DAY_MONEY + s;
             GazTotal.Bank.Period.TonnAdr := t + C_REAL_MONTH_TONN + s;
             GazTotal.Bank.Period.SummAdr := t + C_REAL_MONTH_MONEY + s;
           end;
         inc(counter);
         AllTotal2Zero(CurrTotal);

         // результат по нефтепродукту ИТОГО
         s := Format('%s%d+%s%d-%s%1:d-%5:s%1:d',[C_REST_REAL,counter-5,C_REST_STORE,counter,C_REZERVUAR_DEAD_ZAPAS,C_REZERVUAR_TUB_ZAPAS]);
         List.Cells[counter,C_ZAPAS_WITHOUT_TNK]:=
            Format('=IF(OR(%s%d=0;%s<0);0;(%2:s)/%0:s%d)',[C_REAL_AVG,counter,s]);
         s := Format('%s%d+%s',[C_REST_STORE_TNK,counter,s]);
         List.Cells[counter,C_ZAPAS_WITH_TNK]:=
            Format('=IF(OR(%s%d=0;%s<0);0;(%2:s)/%0:s%d)',[C_REAL_AVG,counter,s]);

         List.Cells[counter,C_REST_REAL]:=Format('=SUM(%s%d:%0:s%2:d)',[C_REST_REAL,np_start,counter-6]);
         List.Cells[counter,C_REST_REAL].Copy;
         IsNPRecEmpty := True;  //Вважаємо НП порожнім, поки він не доведе Ойлу зворотнє
         for i:=4 to C_LAST_COLUMN do
           if (i in cTotalList) then
             begin
               List.Cells[counter,i].PasteSpecial;
               if IsNPRecEmpty and (List.Cells[counter,i].value <> 0) then  //Якщо всі суми = 0, тоді даний НП буде видалений з таблиці
                 IsNPRecEmpty := False;  //НП виборов право на існування. Залишаємо його у звіті.
             end;
         If IsNPRecEmpty then Exit;   //зупиняємо подальшу обробку по даному НП

         if IsToTotal=1 then
           begin
             vSumTotal:=vSumTotal+Format('%s%d;',[C_REST_REAL,counter]);
             vSumTotal_tf:=vSumTotal_tf+Format('%s%d;',[C_REST_REAL,counter-5]);
           end;

         // скрыть строку по Талонам, если но ним не было движения
         if not((List.Cells[counter-3,C_REAL_DAY_TONN].value*1000<>0) or
                (List.Cells[counter-3,C_REAL_DAY_MONEY].value*1000<>0) or
                (List.Cells[counter-3,C_REAL_MONTH_TONN].value*1000<>0))
         then List.Rows[counter-3].hidden:=true;
         // скрыть строку по Картам, если но ним не было движения
         if not((List.Cells[counter-2,C_REAL_DAY_TONN].value*1000<>0) or
                (List.Cells[counter-2,C_REAL_DAY_MONEY].value*1000<>0) or
                (List.Cells[counter-2,C_REAL_MONTH_TONN].value*1000<>0))
         then List.Rows[counter-2].hidden:=true;
         // скрыть строку по Банковским картам, если но ним не было движения
         if not((List.Cells[counter-1,C_REAL_DAY_TONN].value*1000<>0) or
                (List.Cells[counter-1,C_REAL_DAY_MONEY].value*1000<>0) or
                (List.Cells[counter-1,C_REAL_MONTH_TONN].value*1000<>0))
         then List.Rows[counter-1].hidden:=true;
         // результат  по нефтепродукту ИТОГО (с учетом Талонов и Карт)
         List.Cells[counter,C_REAL_DAY_TONN]:=
             Format('=SUM(%s%d:%0:s%2:d;%s%d:%s%d)',[C_REAL_DAY_TONN,np_start,counter-6,
                    C_REAL_DAY_TONN,counter-3,C_REAL_DAY_TONN,counter-1]);
         List.Cells[counter,C_REAL_DAY_MONEY]:=
             Format('=SUM(%s%d:%0:s%2:d;%s%d:%s%d)',[C_REAL_DAY_MONEY,np_start,counter-6,
                    C_REAL_DAY_MONEY,counter-3,C_REAL_DAY_MONEY,counter-1]);
         List.Cells[counter,C_REAL_MONTH_TONN]:=
             Format('=SUM(%s%d:%0:s%2:d;%s%d:%s%d)',[C_REAL_MONTH_TONN,np_start,counter-6,
                    C_REAL_MONTH_TONN,counter-3,C_REAL_MONTH_TONN,counter-1]);
         List.Cells[counter,C_REAL_MONTH_MONEY]:=
             Format('=SUM(%s%d:%0:s%2:d;%s%d:%s%d)',[C_REAL_MONTH_MONEY,np_start,counter-6,
                    C_REAL_MONTH_MONEY,counter-3,C_REAL_MONTH_MONEY,counter-1]);
         //накпливаем суммы по газу и прочим продуктам
         if (IsNpGaz=1) and (IsToTotal=1) then
         begin
           inc(f1);
           vSumGaz:=vSumGaz+Format('%s%d;',[C_REAL_DAY_TONN,counter]);
           MOGaz:=MOGaz+Format('%s%d;',[C_REAL_DAY_TONN,counter-5]);
           AZSGaz:=AZSGaz+Format('%s%d;',[C_REAL_DAY_TONN,counter-4]);
           TalonGaz:=TalonGaz+Format('%s%d;',[C_REAL_DAY_TONN,counter-3]);
           SmCardGaz:=SmCardGaz+Format('%s%d;',[C_REAL_DAY_TONN,counter-2]);
           BankCardGaz:=BankCardGaz+Format('%s%d;',[C_REAL_DAY_TONN,counter-1]);
         end;
         if (IsNpPr=1) and (IsToTotal=1)  then
         begin
           inc(f2);
           vSumPr:=vSumPr+Format('%s%d;',[C_REAL_DAY_TONN,counter]);
           vSumMO:=vSumMO+Format('%s%d;',[C_REAL_DAY_TONN,counter-5]);
           vSumAZS:=vSumAZS+Format('%s%d;',[C_REAL_DAY_TONN,counter-4]);
         end;
       end;
     if RepType = AZS then
       begin
         azsOutTotalDEP;
         vTotal[Length(vTotal)]:=')';
         List.Cells[counter,AZS_REST_TONN] := vTotal;
         vTotal:='=SUM( ';
         List.Cells[counter,AZS_REST_TONN].Copy;
         for i:=4 to AZS_LAST_COLUMN do
           if (i in azsTotalList) then
               List.Cells[counter,i].PasteSpecial;
         //виставляємо суми в розділ "Всього по видам НП:", якщо даний НП має IsToTotal=1
         if IsToTotal = 1 then
           begin
             List.Cells[np_total_counter,AZS_REST_TONN] := '=' + AZS_REST_TONN + IntToStr(counter);
             List.Cells[np_total_counter,AZS_REST_TONN].Copy;
             for i:=4 to AZS_LAST_COLUMN do
               if (i in azsTotalList) then
                   List.Cells[np_total_counter,i].PasteSpecial;
           end;
       end;
     inc(counter);
   end; // procedure OutTotalPetrol;
   //***************************************************************************
   procedure EnterInCells(formula: string;numFormat: string; count: integer; flag: integer=1); // повторяющийся код в процедуре ниже
   begin
        List.Cells[counter+count,C_REAL_DAY_TONN]:=formula;
        List.Cells[counter+count,C_REAL_DAY_TONN].Copy;
        List.Cells[counter+count,C_REAL_DAY_MONEY].PasteSpecial;
        List.Cells[counter+count,C_REAL_MONTH_TONN].PasteSpecial;
        List.Cells[counter+count,C_REAL_MONTH_MONEY].PasteSpecial;
        if flag=1 then
         begin
             List.Cells[counter+count,C_REAL_DAY_MONEY].NumberFormat:=numFormat;
             List.Cells[counter+count,C_REAL_MONTH_MONEY].NumberFormat:=numFormat;
         end;
    end;
   //***************************************************************************
   procedure OutTotalFinal;
   var s: string;
   begin
     s:='# ##0,00';

     // блок по газу
     vSumGaz[Length(vSumGaz)]:=')';
     MOGaz[Length(MOGaz)]:=')';
     AZSGaz[Length(AZSGaz)]:=')';
     TalonGaz[Length(TalonGaz)]:=')';
     SmCardGaz[Length(SmCardGaz)]:=')';
     BankCardGaz[Length(BankCardGaz)]:=')';
     // прочее
     vSumPr[Length(vSumPr)]:=')';
     vSumMO[Length(vSumMO)]:=')';
     vSumAZS[Length(vSumAZS)]:=')';

     //vSumGaz
     if f1<>0 then
      begin
        EnterInCells(vSumGaz,s,2);
        EnterInCells('='+Format('%s%d',[C_REAL_DAY_TONN,counter-4])+'-'+MOGaz,s,3);
        EnterInCells('='+Format('%s%d',[C_REAL_DAY_TONN,counter-3])+'-'+AZSGaz,s,4);
        EnterInCells('='+Format('%s%d',[C_REAL_DAY_TONN,counter-2])+'-'+TalonGaz,s,5);
        EnterInCells('='+Format('%s%d',[C_REAL_DAY_TONN,counter-1])+'-'+SmCardGaz,s,6);
        EnterInCells('='+Format('%s%d',[C_REAL_DAY_TONN,counter])+'-'+BankCardGaz,s,7);
        EnterInCells('='+Format('%s%d',[C_REAL_DAY_TONN,counter-5])+'-'+Format('%s%d',[C_REAL_DAY_TONN,counter+2]),s,8);
      end;
     if f2<>0 then
     begin
       EnterInCells(vSumPr,s,10,0);     //vSumPr
       EnterInCells(vSumMO,s,11,0);    //vSumMO
       EnterInCells(vSumAZS,s,12,0);    //vSumAZS
       //формат
       List.Cells[counter+10,C_REAL_DAY_MONEY].NumberFormat:=s;
       List.Cells[counter+10,C_REAL_MONTH_MONEY].NumberFormat:=s;
       List.Cells[counter+11,C_REAL_DAY_MONEY].NumberFormat:=s;
       List.Cells[counter+11,C_REAL_MONTH_MONEY].NumberFormat:=s;
       List.Cells[counter+12,C_REAL_DAY_MONEY].NumberFormat:=s;
       List.Cells[counter+12,C_REAL_MONTH_MONEY].NumberFormat:=s;
     end;
     List.Cells[counter+11,C_REAL_PRICE_TONN]:='=IF('+Format('%s%d',[C_REAL_DAY_TONN,counter+11])+'=0;0;'+Format('%s%d',[C_REAL_DAY_MONEY,counter+11])+'/'+Format('%s%d',[C_REAL_DAY_TONN,counter+11])+')';
     List.Cells[counter+12,C_REAL_PRICE_TONN]:='=IF('+Format('%s%d',[C_REAL_DAY_TONN,counter+12])+'=0;0;'+Format('%s%d',[C_REAL_DAY_MONEY,counter+12])+'/'+Format('%s%d',[C_REAL_DAY_TONN,counter+12])+')';
   end;
   //***************************************************************************
   // процедура добавляет строку для следующей АЗС
   // по текущему нефтепродукту и текущему подразделению.
   procedure AddAZSRow;
   begin
     List.Rows[counter].EntireRow.Insert;
     inc(np_total_counter);
   end;
   //***************************************************************************
   // процедура добавляет строки для следующего подразделения
   // по текущему нефтепродукту
   procedure AddDepRows;
   begin
     if (RepType = AZS) and (counter = np_start) then Exit;
     List.Rows[counter].EntireRow.Insert;
     List.Rows[counter].EntireRow.Insert;
     if RepType = DEP then
       begin
         List.Range[Format('%s%d:%s%d',[C_FILIAL,counter-2,ByteToLetters(C_LAST_COLUMN),counter-1])].Copy;
         List.Cells[counter,1].PasteSpecial;
       end;
     if RepType = AZS then
       begin
         // додаємо рядки для нового філіалу
         List.Rows[counter].EntireRow.Insert;
         List.Range[Format('%s%d:%s%d',[AZS_DEPNAME,np_start,ByteToLetters(AZS_LAST_COLUMN),np_start])].Copy;
         List.Cells[counter,1].PasteSpecial;
         List.Range[Format('%s%d:%s%d',[AZS_DEPNAME,counter-2,ByteToLetters(AZS_LAST_COLUMN),counter-1])].Copy;
         List.Cells[counter+1,1].PasteSpecial;
         // вставляємо ім'я нового філіалу
         dep_id := qRR.FieldByName('dep_id').AsInteger;
         List.Cells[counter,AZS_DEPNAME] := qRR.FieldByName('Dep_Name').AsString;
         dep_start := counter;
         inc(counter);
         inc(np_total_counter,3);
       end;
   end;
   //***************************************************************************
   procedure AddPetrolRows; // процедура добавляет строки для следующего нефтепродукта
   var i: Integer;
   begin
     if RepType = DEP then
       begin
         for i:=1 to 9 do
             List.Rows[counter].EntireRow.Insert;
         List.Range[Format('%s%d:%s%d',[ByteToLetters(1),np_start-1,
                                ByteToLetters(C_LAST_COLUMN),np_start+1])].Copy;
         List.Cells[counter,1].PasteSpecial;
         List.Range[Format('%s%d:%s%d',[ByteToLetters(1),counter-6,
                                ByteToLetters(C_LAST_COLUMN),counter-1])].Copy;
         List.Cells[counter+3,1].PasteSpecial;
       end;
     if RepType = AZS then
       begin
         for i:=1 to 5 do
           List.Rows[counter].EntireRow.Insert;
         inc(np_total_counter,5);
         List.Range[Format('%s%d:%s%d',[AZS_DEPNAME,np_start-1,
                              ByteToLetters(AZS_LAST_COLUMN),np_start])].Copy;
         List.Cells[counter,1].PasteSpecial;
         List.Range[Format('%s%d:%s%d',[AZS_DEPNAME,counter-3,
                              ByteToLetters(AZS_LAST_COLUMN),counter-1])].Copy;
         List.Cells[counter+2,1].PasteSpecial;
         //вставляємо дод.рядок до розділу "Всього по видам НП:", якщо даний НП має IsToTotal=1
         if IsToTotal = 1 then
           begin
             List.Range[Format('%s%d:%s%d',[AZS_DEPNAME,np_total_counter,
                                  ByteToLetters(AZS_LAST_COLUMN),np_total_counter])].Copy;
             List.Cells[np_total_counter+1,1].PasteSpecial;
             inc(np_total_counter);
           end;
       end;
   end;
   //***************************************************************************
   procedure OutTotal; // процедура вывода результата по управлению
   var i: Integer;
       s: string;
   begin
     if RepType = DEP then
       begin
         inc(counter);
         // результат по управлению ВСЕГО
         vSumTotal[Length(vSumTotal)]:=')';

         s := Format('%s%d+%s%d-%s%1:d-%5:s%1:d',[C_REST_REAL,counter+1,C_REST_STORE,counter,C_REZERVUAR_DEAD_ZAPAS,C_REZERVUAR_TUB_ZAPAS]);
         List.Cells[counter,C_ZAPAS_WITHOUT_TNK]:=
            Format('=IF(OR(%s%d=0;%s<0);0;(%2:s)/%0:s%d)',[C_REAL_AVG,counter,s]);
         s := Format('%s%d+%s',[C_REST_STORE_TNK,counter,s]);
         List.Cells[counter,C_ZAPAS_WITH_TNK]:=
            Format('=IF(OR(%s%d=0;%s<0);0;(%2:s)/%0:s%d)',[C_REAL_AVG,counter,s]);

         List.Cells[counter,C_REST_REAL]:=vSumTotal;
         List.Cells[counter,C_REST_REAL].Copy;
         for i:=4 to C_LAST_COLUMN do
             if (i in cTotalList) then List.Cells[counter,i].PasteSpecial;
         inc(counter);
         // результат по управлению НБ
         vSumTotal_tf[Length(vSumTotal_tf)]:=')';
         List.Cells[counter,C_REST_REAL]:=vSumTotal_tf;
         List.Cells[counter,C_REST_REAL].Copy;
         List.Cells[counter,C_REZERVUAR_DEAD_ZAPAS].PasteSpecial;
         List.Cells[counter,C_REZERVUAR_TUB_ZAPAS].PasteSpecial;
         List.Cells[counter,C_REZERV_VSEGO].PasteSpecial;
         List.Cells[counter,C_REZERV_FREE].PasteSpecial;
         List.Cells[counter,C_REZERVUAR_DEAD_ALL].PasteSpecial;
         List.Cells[counter,C_REAL_DAY_TONN].PasteSpecial;
         List.Cells[counter,C_REAL_DAY_MONEY].PasteSpecial;
         List.Cells[counter,C_REAL_MONTH_TONN].PasteSpecial;
         List.Cells[counter,C_REAL_MONTH_MONEY].PasteSpecial;
         inc(counter);
         // результат по управлению АЗС
         List.Cells[counter,C_REST_REAL].PasteSpecial;
         List.Cells[counter,C_REAL_DAY_TONN].PasteSpecial;
         List.Cells[counter,C_REAL_DAY_MONEY].PasteSpecial;
         List.Cells[counter,C_REAL_MONTH_TONN].PasteSpecial;
         List.Cells[counter,C_REAL_MONTH_MONEY].PasteSpecial;
         List.Cells[counter,C_REAL_AVG].PasteSpecial;
         inc(counter);
         // результат по управлению Талоны
         List.Cells[counter,C_REAL_DAY_TONN].PasteSpecial;
         List.Cells[counter,C_REAL_DAY_MONEY].PasteSpecial;
         List.Cells[counter,C_REAL_MONTH_TONN].PasteSpecial;
         List.Cells[counter,C_REAL_MONTH_MONEY].PasteSpecial;
         inc(counter);
         // результат по управлению Карты
         List.Cells[counter,C_REAL_DAY_TONN].PasteSpecial;
         List.Cells[counter,C_REAL_DAY_MONEY].PasteSpecial;
         List.Cells[counter,C_REAL_MONTH_TONN].PasteSpecial;
         List.Cells[counter,C_REAL_MONTH_MONEY].PasteSpecial;
         inc(counter);
         // результат по управлению Банк.Карты
         List.Cells[counter,C_REAL_DAY_TONN].PasteSpecial;
         List.Cells[counter,C_REAL_DAY_MONEY].PasteSpecial;
         List.Cells[counter,C_REAL_MONTH_TONN].PasteSpecial;
         List.Cells[counter,C_REAL_MONTH_MONEY].PasteSpecial;
       end;
     if RepType = AZS then
       begin
         inc(counter,2);  //вказівник - на рядок "Всього"
         List.Cells[counter,AZS_REST_TONN] := Format('=SUM(%s%d:%s%d)',[AZS_REST_TONN, counter+2,
                                                                        AZS_REST_TONN, np_total_counter]);
         List.Cells[counter,AZS_REST_TONN].Copy;
         for i:=4 to AZS_LAST_COLUMN do
           if (i in azsTotalList) then
             List.Cells[counter,i].PasteSpecial;
       end;
   end;
   //***************************************************************************
   procedure FinishFormat;
   var i: Integer;
       s: string;
   begin
     if RepType = DEP then
       for i:=4 to C_LAST_COLUMN do begin
         if i in cTonnList then s:='# ###0,000'
         else if i in cMoneyList then s:='# ##0,00'
         else if i in cDaysList  then s:='# ##0,0'
         else s:='# ##0';
         List.Range[Format('%s%d:%s%d',[ByteToLetters(i),6,
                                        ByteToLetters(i),counter])].NumberFormat:=s;
       end;
     if RepType = AZS then
       for i:=3 to AZS_LAST_COLUMN do begin
         if i in azsTonnList then s := '# ###0,000'
         else if i in azsDaysList then s := '# ###0,0'
         //else if i in azsDateList then s := 'dd.mm.yyyy'   --> в Екселі 2000(рус) невірно відображається формат
         else s := '# ##0';
         List.Range[Format('%s%d:%s%d',[ByteToLetters(i),5,
                                        ByteToLetters(i),np_total_counter])].NumberFormat:=s;
       end;
   end;
   //***************************************************************************
   procedure OutDepTotal; // дополнительная таблица реализация по подразделениям
   var
      i: Integer;
      mo, ps, tl, sc, mo_day, ps_day, tl_day, sc_day: Double;
      sDateFrom,sDateTo,vTmp: string;
   begin
      // следующий лист
      List:=List.Next;
      // заголовок
      with DBPlan do begin
        sDateFrom:=FormatDateTime('dd.mm.yyyy',RM.From_date2.Date);
        sDateTo:=FormatDateTime('dd.mm.yyyy',RM.To_date2.Date);

        List.Cells[1+1,1]:=
          Format(TranslateText('%s    с %s по %s'),
            [RM.ceOrg.Text,sDateFrom,sDateTo]);
        List.Rows[1+1].Font.Bold:=True;
        SetCurrentOrgDateTime(20,1,List);

        if RM.ce100_days.AsInteger < 2 then
         vTmp:=DateToStr(RM.To_date2.Date)
       else
         vTmp:=DateToStr(RM.To_Date2.Date-RM.ce100_days.AsInteger+1)+' - '+DateToStr(RM.To_date2.Date);

        List.Cells[3,REL_MO_MONTH]:=Format(TranslateText('с %s по %s'),[sDateFrom,sDateTo]);
        List.Cells[3,REL_MO_DAY]:=vTmp;
      end;
      step:=33/DBPlan.mtDep.RecordCount;
      delta:=33;
      counter:=6;
      SortMemoryTable(DBPlan.mtDep, 'Num', 1);
      DBPlan.mtDep.First;
      while not DBPlan.mtDep.Eof do
      begin
          delta:=delta+step;
          progr.Progress:=Round(delta);
          // отфильтровать реализации подразделения
          qRR.Filter:=' azs_id=0 and is_to_total=1 and IsNpGaz=0 and dep_id='+ DBPlan.mtDep.FieldByName('DEP_ID').AsString;
          qRR.Filtered:=TRUE; qRR.First;
          mo:=0; ps:=0; tl:=0; sc:=0;
          mo_day:=0; ps_day:=0; tl_day:=0; sc_day:=0;
          repeat
              mo:=mo+qRR.FieldByName('Period').AsFloat;
              ps:=ps+qRR.FieldByName('PeriodPS').AsFloat;
              sc:=sc+qRR.FieldByName('PeriodCard').AsFloat;
              mo_day:=mo_day+qRR.FieldByName('LastDay').AsFloat;
              ps_day:=ps_day+qRR.FieldByName('LastDayPS').AsFloat;
              sc_day:=sc_day+qRR.FieldByName('LastDayCard').AsFloat;
              case RM.rg100_Talon.ItemIndex of
                0: begin // отпущенные
                  tl:=tl+qRR.FieldByName('PeriodTalon').AsFloat;
                  tl_day:=tl_day+qRR.FieldByName('LastDayTalon').AsFloat;
                end;
                1: begin // отоваренные
                   tl:=tl+qRR.FieldByName('PeriodTalon').AsFloat;
                   tl_day:=tl_day+qRR.FieldByName('LastDayTalon').AsFloat;
                end;
              end; // case rg100_Talon.ItemIndex of
              qRR.Next;
          until qRR.EOF;
          if not((mo=0)and(ps=0)and(tl=0)and(sc=0)and(qRR.FieldByName('dep_id').AsInteger=MAIN_ORG.ID)and(MAIN_ORG.ORG_TYPE=4)) then
          begin
           List.Cells[counter,1]:=DBPlan.mtDep.FieldByName('Dep_name').AsString; // название подразделения
           List.Cells[counter,REL_MO_MONTH]:=mo;
           List.Cells[counter,REL_AZS_MONTH]:=ps;
           List.Cells[counter,REL_TALON_MONTH]:=tl;
           List.Cells[counter,REL_SMARTCARD_MONTH]:=sc;
           List.Cells[counter,REL_MO_DAY]:=mo_day;
           List.Cells[counter,REL_AZS_DAY]:=ps_day;
           List.Cells[counter,REL_TALON_DAY]:=tl_day;
           List.Cells[counter,REL_SMARTCARD_DAY]:=sc_day;
           inc(counter);
           List.Rows[counter].EntireRow.Insert;
          end;
          DBPlan.mtDep.Next;
       end;
      // ИТОГО
      List.Cells[counter+1,REL_MO_MONTH]:=
          Format('=SUM(%s%d:%0:s%2:d)',[REL_MO_MONTH,6,counter-1]);
      List.Cells[counter+1,REL_MO_MONTH].Copy;
      for i:=3 to REL_LAST_COLUMN do
        List.Cells[counter+1,i].PasteSpecial;
   end; // procedure OutDepTotal;
   //***************************************************************************
begin
  OutTitle;
  try
    If RepType = DEP then ExecQuery;
    If RepType = AZS then
      begin
        qRR.Filtered := False;
        qRR.Filter := ' AZS_ID<>0';
        qRR.Filtered := True;
      end;
    if qRR.RecordCount = 0 then Exit;
    IsNpGaz:=qRR['isnpgaz'];
    IsNpPr:=qRR['isnpother'];
    IsToTotal:=qRR['is_to_total'];
    IsCardsSubTotal:=qRR['is_cards_subtotal'];
    InitOut;
    qRR.First;
    repeat
      OutTitlePetrol;
      repeat
        OutRow;
        delta := delta + step;
        IsNp62 := qRR['id'] = 62;   //виділяємо його окремо для адресації на вкладці "Газ"
        qRR.Next;
        // вставка строк для подразделения
        if (np_type = qRR.FieldByName('id').AsInteger) and not qRR.EOF then
          if dep_id = qRR.FieldByName('dep_id').AsInteger then
            AddAZSRow
          else begin
            if RepType = AZS then
              azsOutTotalDEP;
            AddDepRows;
          end;
      until (np_type<>qRR.FieldByName('id').AsInteger) or (qRR.EOF);
      // результат по нефтепродукту (ИТОГО)
      OutTotalPetrol;
      // вставка строк для нефтепродукта
      if not (qRR.EOF or IsNPRecEmpty) then
        AddPetrolRows;
      if IsNPRecEmpty then
        counter := np_start - 1;  //коли НП пустий - на його місце тулиться наступний НП
      IsNpGaz:=qRR['isnpgaz'];
      IsNpPr:=qRR['isnpother'];
      IsToTotal:=qRR['is_to_total'];
      IsCardsSubTotal:=qRR['is_cards_subtotal'];
      progr.Progress:=Round(delta);
    until (qRR.EOF);
    // результат по управлению (ВСЕГО)
    OutTotal;
    if RepType = DEP then
      OutTotalFinal;
    FinishFormat;
    // вывод дополнительной таблицы
    if RepType = DEP then OutDepTotal;
  finally
    if RepType = DEP then DepList.Free;
  end;
end;
//==============================================================================
procedure ShowSprInfo(List:Variant);
var CurLine:integer;
begin
    CurLine:=7;
    if DBPlan.qDopGroups.Active then DBPlan.qDopGroups.Close;
    _OpenQueryOra(DBPlan.qDopGroups);
    with DBPlan.qDopGroups do begin
         while not Eof do begin
             List.Rows[CurLine+1].EntireRow.Insert;
             List.Cells[CurLine,1]:=FieldByName('groupname').AsString;
             List.Cells[CurLine,2]:=FieldByName('name').AsString;
             inc(CurLine);
             Next;
         end;
    end;
    DrawNetInExcel(List,1,2,7,CurLine-1);
    _OpenQueryOra(DBPlan.qGrpDensity);
    PutFullQToExcel(DBPlan.qGrpDensity,List,CurLine+4);
    List.Cells[CurLine+4,'A'].AutoFilter;
    if DBPlan.qDopGroups.Active then DBPlan.qDopGroups.Close;
end;
//==============================================================================
procedure RegionRestGaz(
  List: Variant;
  p_BeginDate,p_EndDate: TDateTime;
  p_NumDays: integer);
var
  n: integer;
  i: integer;
  qGaz:TOilQuery;
  vTmp: string;
begin
  List.Cells[2,'C']:='на '+DateToStr(p_EndDate+1);

  if p_NumDays < 2 then
    vTmp := 'за '+DateToStr(p_EndDate)
  else
    vTmp := 'за '+Copy(DateToStr(p_EndDate-p_NumDays+1),0,5)+'-'+DateToStr(p_EndDate);
  List.Cells[2,GAZ_REAL_DAY_TONN]  := vTmp;
  List.Cells[2,GAZ_TALON_DAY_TONN] := vTmp;
  List.Cells[2,GAZ_CARD_DAY_TONN]  := vTmp;

  List.Cells[4,GAZ_DEP_NAME]:=MAIN_ORG.NAME;

  _OpenQueryParOra(DBPlan.qRegionRestGazNB,
    ['begindate',         p_BeginDate,
     'enddate',           p_EndDate,
     'numdays',           p_NumDays,
     'obl_id',            MAIN_ORG.ID]);

  n:=5;
  List.Cells[n,GAZ_GNS_STORE]        := DBPlan.qRegionRestGazNB['rest_store'];
  List.Cells[n,GAZ_AN_STORE]         := DBPlan.qRegionRestGazNB['rest_alfa_store'];
  List.Cells[4,GAZ_IN_WAY]           := DBPlan.qRegionRestGazNB['in_way'];
  List.Cells[n,GAZ_REAL_MONTH_TONN]  := DBPlan.qRegionRestGazNB['rash_tonn'];
  List.Cells[n,GAZ_REAL_MONTH_MONEY] := DBPlan.qRegionRestGazNB['rash_summa'];
  List.Cells[n,GAZ_REAL_DAY_TONN]    := DBPlan.qRegionRestGazNB['rash_lastday_tonn'];
  List.Cells[n,GAZ_REAL_DAY_MONEY]   := DBPlan.qRegionRestGazNB['rash_lastday_summa'];

  DefineRepDates(p_BeginDate,p_EndDate);
  _OpenQueryParOra(DBPlan.qRegionRestGazNew,
      ['p_begindate', p_BeginDate,
       'p_enddate',   p_EndDate,
       'numdays',     p_NumDays,
       'obl_id',      MAIN_ORG.ID]);
  qGaz := DBPlan.qRegionRestGazNew;
  DefineRepDates(0,p_EndDate);

  n:=6;
  with qGaz do
  begin
    Last; First;
    for i:=1 to RecordCount-1 do
    begin
      List.Rows[n].EntireRow.Insert;
      List.Cells[n+i,GAZ_REAL_DAY_PRICE].Copy;
      List.Cells[n,  GAZ_REAL_DAY_PRICE].PasteSpecial;
      List.Cells[n+i,GAZ_REAL_MONTH_PRICE].Copy;
      List.Cells[n,  GAZ_REAL_MONTH_PRICE].PasteSpecial;
    end;
    if RecordCount<>0 then
    begin
      List.Cells[n+RecordCount,GAZ_REAL_DAY_TONN].Formula := Format('=SUM(%s%d:%0:s%2:d)',[GAZ_REAL_DAY_TONN,n,n+RecordCount-1]);
      List.Cells[n+RecordCount,GAZ_REAL_DAY_MONEY].Formula := Format('=SUM(%s%d:%0:s%2:d)',[GAZ_REAL_DAY_MONEY,n,n+RecordCount-1]);
      List.Cells[n+RecordCount,GAZ_REAL_MONTH_TONN].Formula := Format('=SUM(%s%d:%0:s%2:d)',[GAZ_REAL_MONTH_TONN,n,n+RecordCount-1]);
      List.Cells[n+RecordCount,GAZ_REAL_MONTH_MONEY].Formula := Format('=SUM(%s%d:%0:s%2:d)',[GAZ_REAL_MONTH_MONEY,n,n+RecordCount-1]);
    end;

    while not Eof do
    begin
      List.Cells[n,GAZ_AZS_NAME]         := FieldByName('azs_name').AsString;
      List.Cells[n,GAZ_AGZS_REST]        := FieldByName('rest_tonn').AsFloat;
      List.Cells[n,GAZ_REAL_AZSNAME]     := FieldByName('azs_name').AsString;
      List.Cells[n,GAZ_REAL_AZSADDR]     := FieldByName('azs_addr').AsString;
      List.Cells[n,GAZ_REAL_DAY_TONN]    := FieldByName('lastday_tonn').AsFloat;
      List.Cells[n,GAZ_REAL_DAY_MONEY]   := FieldByName('lastday_money').AsFloat;
      List.Cells[n,GAZ_REAL_MONTH_TONN]  := FieldByName('period_tonn').AsFloat;
      List.Cells[n,GAZ_REAL_MONTH_MONEY] := FieldByName('period_money').AsFloat;
      List.Cells[n,GAZ_TALON_DAY_TONN]   := FieldByName('lastday_tal_tonn').AsFloat;
      List.Cells[n,GAZ_TALON_MONTH_TONN] := FieldByName('period_tal_tonn').AsFloat;
      List.Cells[n,GAZ_CARD_DAY_TONN]    := FieldByName('lastday_card_tonn').AsFloat;
      List.Cells[n,GAZ_CARD_MONTH_MONEY] := FieldByName('period_card_tonn').AsFloat;
      inc(n);
      Next;
    end;
  end;
  //если АЗС нет
  if n=6 then inc(n);
  // Все вышеописаное можно взять из главного запроса
  with GazTotal do
  begin
    List.Cells[n+1,GAZ_REAL_DAY_TONN].Formula  := GazTotal.Talon.Last.TonnAdr;
    List.Cells[n+1,GAZ_REAL_DAY_MONEY].Formula := GazTotal.Talon.Last.SummAdr;

    List.Cells[n+2,GAZ_REAL_DAY_TONN].Formula  := GazTotal.Card.Last.TonnAdr;
    List.Cells[n+2,GAZ_REAL_DAY_MONEY].Formula := GazTotal.Card.Last.SummAdr;

    List.Cells[n+3,GAZ_REAL_DAY_TONN].Formula  := GazTotal.Bank.Last.TonnAdr;
    List.Cells[n+3,GAZ_REAL_DAY_MONEY].Formula := GazTotal.Bank.Last.SummAdr;

    List.Cells[n+1,GAZ_REAL_MONTH_TONN].Formula  := GazTotal.Talon.Period.TonnAdr;
    List.Cells[n+1,GAZ_REAL_MONTH_MONEY].Formula := GazTotal.Talon.Period.SummAdr;

    List.Cells[n+2,GAZ_REAL_MONTH_TONN].Formula  := GazTotal.Card.Period.TonnAdr;
    List.Cells[n+2,GAZ_REAL_MONTH_MONEY].Formula := GazTotal.Card.Period.SummAdr;

    List.Cells[n+3,GAZ_REAL_MONTH_TONN].Formula  := GazTotal.Bank.Period.TonnAdr;
    List.Cells[n+3,GAZ_REAL_MONTH_MONEY].Formula := GazTotal.Bank.Period.SummAdr;
  end;

  List.Cells[n,GAZ_REAL_DAY_PRICE].Copy;
  List.Cells[n+1,GAZ_REAL_DAY_PRICE].PasteSpecial;
  List.Cells[n+2,GAZ_REAL_DAY_PRICE].PasteSpecial;
  List.Cells[n+3,GAZ_REAL_DAY_PRICE].PasteSpecial;
  List.Cells[n+1,GAZ_REAL_MONTH_PRICE].PasteSpecial;
  List.Cells[n+2,GAZ_REAL_MONTH_PRICE].PasteSpecial;
  List.Cells[n+3,GAZ_REAL_MONTH_PRICE].PasteSpecial;

  if DBPlan.qRegionRest.Active then DBPlan.qRegionRest.Close;
  if DBPlan.qRegionRestGazNew.Active then DBPlan.qRegionRestGazNew.Close;
  if DBPlan.qRegionRestGazNB.Active then DBPlan.qRegionRestGazNB.Close;
end;
//==============================================================================
function GetBrokenRezervString(p_DepId,p_NpGrp: integer): string;
begin
  qBRez.Filtered := false;
  qBRez.Filter := Format('id_org=%d AND np_grp_id=%d',[p_DepId,p_NpGrp]);
  qBRez.Filtered := true;
  result:='';
  while not qBRez.Eof do begin
    result:=result+qBRez.FieldByName('str').AsString+#10;
    qBRez.Next;
  end;
end;
//==============================================================================
end.
