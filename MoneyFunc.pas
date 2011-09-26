unit MoneyFunc;
{### 1.00}

interface

uses uCommonForm,  Classes,ExFunc,SysUtils, UDBFunc,OilStd,Db,uOilQuery,Ora,
  uOilStoredProc{$IFDEF VER150},Variants{$ENDIF};

type
   TMoneyNDS=
        record
           Summ,NDS,SummBez:real;
        end;
   PMoneyNDS=^TMoneyNDS;
   TMoneyNDSList=TList;

function MoneyToStr(x:real):string;
function CanChangeNDS(x:real;Direction:integer):Boolean;
function CalcComplexNDS(List: TMoneyNDSList):Boolean;
function CalcComplexNDS2(p_List: TMoneyNDSList):Boolean;
procedure GetPossibleNDS(x:real;var nds1,nds2:real);
function IsValidNDS(x,nds:real):Boolean;
function GetEvent(Date1:TDateTime;Month,Year:word):integer;
function FRound(x:double;n:integer=2):double;
function FSign(x:real):integer;
function GetNDS_NoNDS(x: Currency; d: TDateTime; Precision: integer=2): Currency;
function GetNDS_WithNDS(x: Currency; d: TDateTime; Precision: integer=2): Currency;
function GetNoNDS_WithNDS(x: Currency; d: TDateTime; Precision: integer=4): Currency;
function GetWithNDS_NoNDS(x: Currency; d: TDateTime; Precision: integer=2): Currency;
function S2F(p_Str:string):real;
function TAX_RATE(d:TDateTime): Currency;

implementation
//==============================================================================
function FSign(x:real):integer;
begin
     if x>0 then result:=1
     else if x=0 then result:=0
     else result:=-1;
end;
//==============================================================================
function FRound(x:double;n:integer=2):double;
{var
  d:double;
  i,k:integer;
  Otr: Boolean;}
begin
  FRound:=MRound(x,n);
{  Otr:=(x<0);
  if Otr then x:=-x;
  d:=1;
  for i:=1 to n+1 do d:=d*10;
  k:=trunc(x*d+1e-6);
  if k mod 10>=5 then k:=k+10;
  k:=k - k mod 10;
  result:=k/d;
  if Otr then result:=-result;}
end;
//==============================================================================
function GetEvent(Date1:TDateTime;Month,Year:word):integer;
// Date1 - дата оплаты, Month,Year - дата цели оплаты
// результат: первое событие - 1, второе - 2
var v_Day,v_Month,v_Year:word;
begin
     DecodeDate(Date1,v_Year,v_Month,v_Day);
     if (v_Year<Year) or (v_Year=Year) and (v_Month<=Month) then
        result:=1
     else result:=2;
end;
//==============================================================================
function MoneyToStr(x:real):string;
var s:string;
    n:integer;
begin
     x:=FRound(x,2);
     s:=FloatToStr(x);
     n:=pos(DecimalSeparator,s);
     if n=0 then s:=s+DecimalSeparator+'00'
     else if n=length(s)-1 then s:=s+'0';
     result:=s;
end;
//==============================================================================
function CanChangeNDS(x:real;Direction:integer):Boolean;
// можно ли подкорректировать НДС суммы x на Direction*0.01
var nds,y:real;
begin
    nds:=x/6;
    y:=1000*FRound((nds-Int(nds*100)/100),5);
    if y=0 then result:=FALSE
    else if (y>=5) and (Direction=-1) or (y<5) and (Direction=1) then result:=TRUE
    else result:=FALSE;
end;
//==============================================================================
function CalcComplexNDS(List: TMoneyNDSList):Boolean;
// предназначена для решения следующей задачи:
// дана сумма с НДС и дан ряд слагаемых, из которых эта сумма складывается
// у них тоже есть НДС и сумма их НДС должна равняться НДС суммы.
// List - список значений типа PMoneyNDS.
// первая запись - сумма с желаемым НДС
// все последующие - слагаемые. Последнее в список не вносится.
// процедура проставляет НДС слагаемых.
var P: PMoneyNDS;
    i:integer;
    main_Summ,main_NDS:real;
    s_Summ,s_NDS,s_SummBez:real;
    Diff:real;
    DiffSgn:integer;
begin
    P:=List.Items[0];
    main_Summ:=P.Summ; main_NDS:=P.NDS;

    s_Summ:=0; s_NDS:=0; s_SummBez:=0;
    for i:=1 to List.Count-1 do begin
         P:=List.Items[i];
         P.NDS:=FRound(P.Summ/6,2);
         P.SummBez:=FRound(P.Summ-P.NDS,2);
         s_Summ:=s_Summ+P.Summ;
         s_NDS:=s_NDS+P.NDS;
         s_SummBez:=s_SummBez+P.SummBez;
    end;

    new(P);
    List.Add(P);
    P.Summ:=FRound(main_Summ-s_Summ,2);
    P.NDS:=FRound(P.Summ/6,2);
    P.SummBez:=FRound(P.Summ-P.NDS,2);
    s_NDS:=s_NDS+P.NDS;

    Diff:=FRound(main_NDS-s_NDS,2);
    DiffSgn:=FSign(Diff);
    i:=1;
    while (Diff<>0) and (i<List.Count) do begin
        P:=List.Items[i];
        if CanChangeNDS(P.Summ,DiffSgn) then begin
            P.NDS:=FRound(P.NDS+0.01*DiffSgn,2);
            P.SummBez:=FRound(P.Summ-P.NDS,2);
            Diff:=Diff-0.01*DiffSgn;
        end;
        inc(i);
    end;
    if Diff<>0 then result:=FALSE
               else result:=TRUE;
end;
//==============================================================================
function CalcComplexNDS2(p_List: TMoneyNDSList):Boolean;
// делает то же самое, что и CalcComplexNDS, но для иного представления
// входных данных: p_List - список слагаемых, им расставляется НДС
// процедура является шлюзом к CalcComplexNDS и сама вычислений не производит
var NewList: TList;
    p1,p2: PMoneyNDS;
    i:integer;
    sum:real;
begin
    NewList:=TList.Create;
    sum:=0;
    // получаем параметр, приемлемый для процедуры CalcComplexNDS

    // подсчитываем сумму
    for i:=0 to p_List.Count-1 do begin
        p1:=p_List.Items[i];
        sum:=sum+p1.Summ;
    end;

    new(p2);
    p2.Summ:=sum; p2.NDS:=GetNDS_WithNDS(p2.Summ,0);
    p2.SummBez:=p2.Summ-p2.NDS;
    NewList.Add(p2);
    for i:=0 to p_List.Count-2 do begin
        new(p2);
        p1:=p_List.Items[i];
        p2.Summ:=p1.Summ; p2.NDS:=0; p2.SummBez:=p2.Summ;
        NewList.Add(p2);
    end;

    result:=CalcComplexNDS(NewList);
    if not result then exit;

    for i:=1 to NewList.Count-1 do begin
        p2:=NewList.Items[i];
        p1:=p_List.Items[i-1];
        p1.NDS:=p2.NDS; p1.SummBez:=p1.Summ-p1.NDS;
    end;
    NewList.Destroy;
end;
//==============================================================================
procedure GetPossibleNDS(x:real;var nds1,nds2:real);
var y,nds:real;
begin
     nds:=x/6;
     y:=1000*FRound((nds-Int(nds*100)/100),5);
     if y=0 then
     begin
          nds1:=FRound(x/6,2);
          nds2:=nds1;
     end
     else
     begin
          nds1:=Int(nds*100)/100;
          nds2:=nds1+0.01;
     end;
end;
//==============================================================================
function MoneyEqual(x1,x2:real):Boolean;
begin
     if Round(x1*100)=Round(x2*100) then result:=TRUE
                                    else result:=FALSE;
end;
//==============================================================================
function IsValidNDS(x,nds:real):Boolean;
var nds1,nds2:real;
begin
     GetPossibleNDS(x,nds1,nds2);
     if MoneyEqual(nds,nds1) or MoneyEqual(nds,nds2) then
     //if (nds=nds2) or (nds=nds1)
        result:=TRUE
     else result:=FALSE;
end;

//==============================================================================
function TAX_RATE(d:TDateTime): Currency;
begin
  result:=VarAsType(GetSqlValuePar(
     'select NDS.tax_rate(:oper_date) from dual',
     ['oper_date'],
     [ftDateTime],
     [d]
    ),varCurrency);
end;
//==============================================================================
function GetNdsFuncResult(p_Func: string; x: Currency; d: TDateTime; Precision: integer): Currency;
begin
  result:=VarAsType(GetSqlValuePar(
     'select NDS.'+p_Func+'(:value,:oper_date,:precision) from dual',
     ['value','oper_date','precision'],
     [ftFloat,ftDateTime,ftInteger],
     [x,d,precision]
    ),varCurrency);
end;
//==============================================================================
function GetNDS_NoNDS(x: Currency; d: TDateTime; Precision: integer=2): Currency;
begin
  result:=GetNdsFuncResult('GetNds_NoNds', x, d, Precision);
end;
//==============================================================================
function GetNDS_WithNDS(x: Currency; d: TDateTime; Precision: integer=2): Currency;
begin
  result:=GetNdsFuncResult('GetNds_WithNds', x, d, Precision);
end;
//==============================================================================
function GetNoNDS_WithNDS(x: Currency; d: TDateTime; Precision: integer=4): Currency;
begin
  result:=GetNdsFuncResult('GetNoNds_WithNds', x, d, Precision);
end;
//==============================================================================
function GetWithNDS_NoNDS(x: Currency; d: TDateTime; Precision: integer=2): Currency;
begin
  result:=GetNdsFuncResult('GetWithNds_NoNds', x, d, Precision);
end;
//==============================================================================
{procedure CountNNNacl(p_Q: TOilQuery; pp_NN: array of real);
var i:integer;
    Sdt,Spr,Sopl,summa: real;
begin
    Sdt:=0; Spr:=0; Sopl:=0;
    p_Q.First; i:=1;
    while not p_Q.Eof do begin
        summa:=p_Q.FieldByName('summa').AsFloat;
        pp_NN[i]:=0;
        if summa>0 then begin // оплата
            if
        end else if p_Q.FieldByName('oplat_only').AsString='Y' then begin // отпуск дизелька
            if Sopl>=summa then SOpl:=SOpl-summa
            else begin
               Sdt:=Sdt-Sopl+summa;
               Sopl:=0;
            end
        end else begin // прочий отпуск
            if Sopl>=summa then SOpl:=SOpl-summa
            else begin
               Spr:=Spr-Sopl+summa;
               pp_NN[i]:=FRound(summa-Sopl);
               Sopl:=0;
            end
        end;
        p_Q.Next; inc(i);
    end;
end;}

function S2F(p_Str:string):real;
begin
    p_Str:=ReplaceSubstr(p_Str,'.',DECIMALSEPARATOR);
    p_Str:=ReplaceSubstr(p_Str,',',DECIMALSEPARATOR);
    result:=StrToFloat(p_Str);
end;

end.
