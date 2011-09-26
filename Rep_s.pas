unit Rep_s;

interface
uses uCommonForm, 
  ActiveX, Classes, ComObj, DB, DBTables, Dialogs, {$IFDEF VER130}DualList,{$ELSE}RxDualList,{$ENDIF} Excel8TLB,
  Graphics, RxCtrls, StdCtrls, SysUtils, Ora, OleCtrls, Main, Forms, OilStd,
  Progr, ReportManager,uOilQuery,uOilStoredProc;

var
 vOperList: string;

// изменения 08/09/00
function ByteToLetters(v_Byte: Byte): string;
function DualListSelect(Q: TDataSet; vList: string): string;
procedure SetOperListPeram(param: Integer);

procedure ClientCard(var RM:TRepManagerForm;Progr:TProgrForm;List:Variant);
procedure AktSverki(
  p_BeginDate, p_EndDate: TDateTime;
  p_OrgId, p_OrgInst: integer;
  p_Right: Boolean;
  p_Kom,p_Own,p_Store: Boolean);

implementation
uses UDbFunc, UDbPlan, UWaitDebForm,ExFunc,uStart,ExcelFunc;

// изменения 08/09/00
// функция предназначена для перевода номера столбца(байт) в буквенный эквивалент
// (для Exel)
// min = 1 (A), max = 256 (IV)
function ByteToLetters(v_Byte: Byte): string;
const
 cLettersBase = $40; {64}

 cbtle_ZeroValue = 'времени разработки:'+#13+
                   ' значение параметра 0 (процедура ByteToLetters)';
begin
 case v_Byte of
  0: Raise Exception.Create(cbtle_ZeroValue);
  1..26: Result:=Char(cLettersBase+v_Byte);
  else
   Result:=Char(cLettersBase+v_Byte div 26)+Char(cLettersBase+v_Byte mod 26);
  end; // case v_Byte of
end;

// Функция DualListSelect позволяет выбрать несколько знчений из списка возможных.
// Список возможных значений выбирается после выполнения запроса Q, передаваемого в функцию.
// Особенности запроса:
//   - первое поле содержит отображаемые в списках названия
//   - второе - id, используемые в дальнейшей работе.
// Переменная vList содержит список id значений, которые помещаются в список
// выбранных значений при инициализации диалога.
// Результат работы строка id, выбраных названий, разделенных ','.
function DualListSelect(Q: TDataSet; vList: string): string;
var
 i: Integer;
 name, operation: string;
 DL: {$IFDEF VER130}TDualListDialog{$ELSE}TRxDualListDialog{$ENDIF};
 AL: TStringList;
begin
DL:={$IFDEF VER130}TDualListDialog{$ELSE}TRxDualListDialog{$ENDIF}.Create(nil);
DL.Title:=TranslateText('Выбирите из списка');
DL.Label1Caption:=TranslateText('Доступные позиции');
DL.Label2Caption:=TranslateText('Выбранные позиции');
DL.List1.Clear;
DL.List2.Clear;
DL.Sorted:=True;
DL.OkBtnCaption:=TranslateText('Выбрать');
DL.CancelBtnCaption:=TranslateText('Отменить');
DL.ShowHelp:=False;

if (Q.Active) then Q.Close;
Q.Open;
AL:=TStringList.Create;

vList:=','+vList+',';
while (not Q.EOF) do
 begin
 name:=Q.Fields[0].AsString;
 operation:=Q.Fields[1].AsString;
 AL.Add(name);
 AL.Values[name]:=operation;
 if (Pos(','+operation+',',vList)=0) then
  DL.List1.Add(name)
  else DL.List2.Add(name);
 Q.Next;
 end;

Result:='';
if (DL.Execute) then
 for i:=0 to DL.List2.Count-1 do
  Result:=Result+AL.Values[DL.List2[i]]+','
 else Result:=Copy(vList,2,Length(vList));
i:=Length(Result);
if (i>0) then
 SetLength(Result,i-1);

AL.Free;
DL.Free;
end;

// Процедура SetOperListPeram
procedure SetOperListPeram(param: Integer);
const
 cfrm_SQL =
   'SELECT name, id FROM v_oil_oper_type WHERE state=''Y'' %s ORDER BY name';
 cfrm_InsertParam = 'AND grp=%d';
var vfrm_Param: string;
begin
vfrm_Param:='';
if (param<>0) then vfrm_Param:=Format(cfrm_InsertParam,[param]);
with DbPlan.qOperList do
 begin
 if (Active) then Close;
 SQL.Clear;
 SQL.Add(Format(cfrm_SQL,[vfrm_Param]));
 end; // with DbPlan.qOperList do
end;


//-------------------------------------------------------------------
//
//                         Карточка клиента
//
//-------------------------------------------------------------------
procedure ClientCard(var RM:TRepManagerForm;Progr:TProgrForm;List:Variant);
const cProcName = 'ClientCard';
var
 counter: Integer;
 delta, step: Real;
 Qb,Qp: TOilQuery;
 KosCondition: string;
begin
  Qb:=TOilQuery.Create(RM);
  Qp:=TOilQuery.Create(RM);
  try
    Qb.FetchAll:=true; Qp.FetchAll:=true;

    KosCondition:=GetKOSCondition('own_goods',
      RM.cb102_Commission.Checked,RM.cb102_Own.Checked,RM.cb102_Other.Checked);

    Qb.Sql.Text:=' select sum(total) as balance from v_oil_debitorka '+
                 ' where deb_date < :date_ '+
                 '       and org_id = :to_id and org_inst = :to_inst '+
                 '       and (ov.GetVal(''INST'') in (dep_id,obl_id) or 4000 in (dep_id,obl_id)) '+
                 KosCondition;
    try
      _OpenQueryPar(Qb,
        ['date_',  RM.From_date2.Date,
         'to_id',  RM.OrgId,
         'to_inst',RM.OrgInst]);
    except
      ShowTextInMemo(Qb.Sql.Text);
      exit;
    end;

    Qp.SQL.Text:=' select deb_date as cDate,debet as Deb,credit as Kred,'+
                 '        litr as AmountLitr,tonn as AmountTonn,shtuki as AmountSht,'+
                 '        NumbPlat,Price,azs_name as Azs_Opt,np_group_name as GroupName,'+
                 '        oper_type_name as debts_type,own_goods_name as dog_type,'+
                 '        goal_part_type_name as goal_part_type '+
                 ' from v_oil_debitorka '+
                 ' where deb_date between :date_from and :date_to '+
                 '       and org_id = :to_id and org_inst = :to_inst '+KosCondition+
                 '       and (ov.GetVal(''INST'') in (dep_id,obl_id) or 4000 in (dep_id,obl_id)) '+
                 ' order by cDate ';

    try
      _OpenQueryPar(Qp,
        ['date_from',RM.From_date2.Date,
         'date_to', RM.To_date2.Date,
         'to_id', RM.OrgId,
         'to_inst', RM.OrgInst]);
    except
      ShowTextInMemo(Qp.Sql.Text);
      exit;
    end;

    try

      //---------------Место , дата , время.
      Dbplan.SetCurrentOrgDateTime(18,1,List);
      //---------------

      List.Cells[2,1]:=TranslateText('Карточка клиента  ')+RM.ceOrg.Text+'; '+TranslateText('Ид. код ')+RM.OrgId_Num;
      // Qb.fieldbyname('clientname').AsString+
      // '                          Ид. код '+Qp.fieldbyname('id_num').AsString;
      List.Cells[3,1]:=TranslateText('За период с ')+FormatDateTime('dd.mm.yyyy',RM.From_date2.Date)+
                             TranslateText('  по ')+FormatDateTime('dd.mm.yyyy',RM.To_date2.Date);

      if Qb.fieldbyname('balance').Value>0 then
        List.Cells[5,4]:=Qb.fieldbyname('balance').Value
      else
        List.Cells[5,5]:=Abs(Qb.fieldbyname('balance').AsFloat);

      counter:=7;
      if (Qp.RecordCount>0) then
        step:=100/Qp.RecordCount
      else
        step:=0;
      delta:=step;

      while (not Qp.EOF) do
      begin
        progr.Progress:=Round(delta);

        List.Cells[Counter,3]:=FormatDateTime('dd.mm.yyyy',Qp.fieldbyname('cdate').AsDateTime);
        List.Cells[Counter,4]:=Qp.fieldbyname('deb').AsFloat;
        List.Cells[Counter,5]:=Qp.fieldbyname('kred').AsFloat;
        List.Cells[Counter,6]:=Qp.fieldbyname('amountlitr').AsFloat;
        List.Cells[Counter,7]:=Qp.fieldbyname('amounttonn').AsFloat;
        List.Cells[Counter,8]:=Qp.fieldbyname('amountsht').AsFloat;
        List.Cells[Counter,9]:=Qp.fieldbyname('numbplat').AsString;
        List.Cells[Counter,10]:=Qp.fieldbyname('price').AsString;
        List.Cells[Counter,11]:=Qp.fieldbyname('azs_opt').AsString;
        List.Cells[Counter,12]:=Qp.fieldbyname('groupname').AsString;
        List.Cells[Counter,13]:=Qp.fieldbyname('dog_type').AsString;
        List.Cells[Counter,14]:=Qp.fieldbyname('debts_type').AsString;
        List.Cells[Counter,15]:=Qp.fieldbyname('goal_part_type').AsString;

        Qp.Next;
        inc(Counter);
        delta:=delta+step;
      end; // while (not Qp.EOF) do

      List.Cells[Counter+1,4]:='=SUM(D6:D'+IntToStr(Counter)+')';
      List.Cells[Counter+1,5]:='=SUM(E6:E'+IntToStr(Counter)+')';

      if Qb.fieldbyname('balance').Value>0 then
      begin                      //=ЕСЛИ(D9-E9+D5>0;D9-E9+D5;0)
        List.Cells[Counter+3,4]:='=IF(D'+IntToStr(Counter+1)+'-E'+IntToStr(Counter+1)+'+D5'+'>0;D'+IntToStr(Counter+1)+'-E'+IntToStr(Counter+1)+'+D5'+';0)';
        List.Cells[Counter+3,5]:='=IF(E'+IntToStr(Counter+1)+'-D'+IntToStr(Counter+1)+'-D5'+'>0;E'+IntToStr(Counter+1)+'-D'+IntToStr(Counter+1)+'-D5'+';0)';
      end
      else
      begin
        List.Cells[Counter+3,4]:='=IF(D'+IntToStr(Counter+1)+'-E'+IntToStr(Counter+1)+'-E5'+'>0;D'+IntToStr(Counter+1)+'-E'+IntToStr(Counter+1)+'-E5'+';0)';
        List.Cells[Counter+3,5]:='=IF(E'+IntToStr(Counter+1)+'-D'+IntToStr(Counter+1)+'+E5'+'>0;E'+IntToStr(Counter+1)+'-D'+IntToStr(Counter+1)+'+E5'+';0)';
      end;

      List.Range['A7:O'+IntToStr(Counter-1)].Borders.LineStyle:=1;
      List.Range['D5:E5'].Borders.LineStyle:=1;
      List.Range['D'+IntToStr(Counter+1)+':E'+IntToStr(Counter+1)].Borders.LineStyle:=1;
      List.Range['D'+IntToStr(Counter+3)+':E'+IntToStr(Counter+3)].Borders.LineStyle:=1;

      List.Cells[Counter+1,1]:=TranslateText('Итого обороты');
      List.Rows[Counter+1].Font.Bold:=True;
      List.Cells[Counter+3,1]:=TranslateText('Сальдо на конец месяца');
      List.Rows[Counter+3].Font.Bold:=True;

      progr.Progress:=100;

    finally // try  whith RM do ...
     //ModifySQL(Qb.SQL,1,cmm_Restore,'','',cProcName);
     //ModifySQL(Qp.SQL,2,cmm_Restore,'','',cProcName);
    end; // try  whith RM do ...
  finally
    Qb.Free;
    Qp.Free;
  end;
end;
//==============================================================================
procedure AktSverki(
  p_BeginDate, p_EndDate: TDateTime;
  p_OrgId, p_OrgInst: integer;
  p_Right: Boolean;
  p_Kom,p_Own,p_Store: Boolean);
var
  XLApp,List: Variant;
  q: TOilQuery;
  dt: TDateTime;
  s,patt,empty,OrgName,OrgAkt,DepName,DepAkt: string;
  i,n,line,FirstLine: integer;
  sld: double;
begin
  q:=TOilQuery.Create(nil);
  q.Session:=frmStart.OraSession1;
  try
    ActivateXLApp('aktsverki','aktsverki',1,XLApp,List);
    patt:=
      ' select oo.name, odet2.akt_sverki from v_org oo, v_oil_org_det2 odet2'+
      ' where oo.state=''Y'' and odet2.state(+)=''Y'''+
      '   and oo.id=%d and oo.inst=%d'+
      '   and odet2.org_id(+)=oo.id and odet2.org_inst(+)=oo.inst';

    empty:='_____________________________________________';

    q.Sql.Text:=Format(patt,[p_OrgId, p_OrgInst]);
    _OpenQueryOra(q);

    OrgName:=q.FieldByName('name').AsString;
    OrgAkt:=q.FieldByName('akt_sverki').AsString;
    if OrgAkt='' then OrgAkt:=empty+' '+OrgName+' '+empty;

    q.Sql.Text:=Format(patt,[MAIN_ORG.ID, MAIN_ORG.INST]);
    _OpenQueryOra(q);

    DepName:=q.FieldByName('name').AsString;
    DepAkt:=q.FieldByName('akt_sverki').AsString;
    if DepAkt='' then DepAkt:=empty+' '+DepName+' '+empty;

    ExFormat(List,'B2',[DateToStr(p_EndDate)]);
    ExFormat(List,'B3',[DepName]);
    ExFormat(List,'B4',[OrgName]);
    ExFormat(List,'B6',[DateToStr(Date)]);
    ExFormat(List,'B8',[DepAkt,OrgAkt]);
    SetRowHeight(List,8,2,80);
    ExFormat(List,'B10',[DepName]);
    ExFormat(List,'F10',[OrgName]);
    SetRowHeight(List,10,2,60);
    SetRowHeight(List,10,6,60);

    s:=nvl(ReadOilVar('CITY'),'');
    if s<>'' then List.Cells[6,9]:=TranslateText('г. ')+s;

    q.Sql.Text:=Format(
      '--> qAktSverki,Reports'+#13#10+
      ' select date_,sgn,sum(debet) as debet,sum(credit) as credit,sum(total) as total'+
      ' from'+
      '   (select'+
      '     decode(sign(to_date(''%s'')-deb_date),1,to_date(''%s'')-1,deb_date) as date_,'+
      '     decode(sign(to_date(''%s'')-deb_date),1,0,sign(total)) as sgn,'+
      '     debet,credit,total'+
      '   from v_oil_debitorka'+
      '   where deb_date<''%s'''+
      '     and (ov.GetVal(''INST'') in (dep_id, obl_id)  or 4000 in (dep_id, obl_id) )'+
          GetKOSCondition('own_goods',p_Kom,p_Own,p_Store)+
      '     and org_id=%d and org_inst=%d)'+
      ' group by date_,sgn',
      [DateToStr(p_BeginDate),DateToStr(p_BeginDate),DateToStr(p_BeginDate),
       DateToStr(p_EndDate),p_OrgId,p_OrgInst]);
    {showtextinmemo(q.Sql.Text);
    exit;}
    q.FetchAll:=true;
    _OpenQueryOra(q);
    if q.RecordCount=0 then begin
      showmessage(TranslateText('Данный отчет не содержит данных'));
      exit;
    end;
    q.Last; q.First;
    FirstLine:=12;

    dt:=q.FieldByName('date_').AsDateTime;
    n:=q.RecordCount+1;
    if dt>=p_BeginDate then inc(n);

    for i:=1 to n do begin
      List.Rows[FirstLine+i].EntireRow.Insert;
      List.Cells[FirstLine+i,2]:=i+1;
      List.Cells[FirstLine+i,6]:=i+1;
    end;
    DrawNetInExcel(List,2,9,FirstLine,FirstLine+n);
    List.Cells[FirstLine,3]:=TranslateText('Сальдо на ')+DateToStr(p_BeginDate);

    line:=FirstLine;

    if dt<p_BeginDate then begin
      if q.FieldByName('total').AsFloat>=0 then n:=4
      else n:=5;
      List.Cells[line,n]:=abs(q.FieldByName('total').AsFloat);
      List.Cells[line,n].Font.Bold:=true;
      sld:=q.FieldByName('total').AsFloat;
      q.Next;
    end else begin
      List.Cells[line,4]:=0;
    end;
    inc(line);
    while not q.Eof do begin
      if q.FieldByName('total').AsFloat>=0 then s:=LangText('Prodaja')
      else s:=TranslateText('Оплата ');
      List.Cells[line,3]:=s+q.FieldByName('date_').AsString;
      List.Cells[line,4]:=q.FieldByName('debet').AsFloat;
      List.Cells[line,5]:=q.FieldByName('credit').AsFloat;
      sld:=sld+q.FieldByName('total').AsFloat;
      inc(line);
      q.Next;
    end;

    List.Cells[line,3]:=LangText('Oborotu_za_period');
    if line=firstline+1 then begin
      List.Cells[line,4]:=0;
      List.Cells[line,5]:=0;
    end else begin
     List.Cells[line,4]:=Format('=SUM(D%d:D%d)',[FirstLine+1,line-1]);
     List.Cells[line,5]:=Format('=SUM(E%d:E%d)',[FirstLine+1,line-1]);
    end;


    inc(line);
    List.Cells[line,3]:=TranslateText('Сальдо на ')+DateToStr(p_EndDate);


    if sld>=0 then n:=4
    else n:=5;

    List.Cells[line,n]:=abs(sld);
    List.Cells[line,n].Font.Bold:=true;

    ExFormat(List,line+2,2,[DepName]);
    if sld=0 then s:=LangText('Net_zadolj_s_obeeh_storon')
    else if sld>0 then s:=LangText('Zadolj_v_polzu')+DepName
    else s:=LangText('Zadolj_v_polzu')+OrgName;

    if sld<>0 then s:=s+' '+Money2Words(abs(sld),true,umLower);
    ExFormat(List,line+3,2,[DateToStr(p_EndDate),s]);
    SetRowHeight(List,line+3,2,80);

    ExFormat(List,line+2,7,[OrgName]);

    if p_Right then begin
      List.Range[GetExcelRange(FirstLine,3,line,3)].Copy;
      List.Cells[FirstLine,7].PasteSpecial;
      List.Range[GetExcelRange(FirstLine,4,line,4)].Copy;
      List.Cells[FirstLine,9].PasteSpecial;
      List.Range[GetExcelRange(FirstLine,5,line,5)].Copy;
      List.Cells[FirstLine,8].PasteSpecial;
      ExFormat(List,line+3,7,[DateToStr(p_EndDate),s]);
    end else
      List.Cells[line+3,7]:='';

    ExFormat(List,line+5,2,[DepName]);
    ExFormat(List,line+5,7,[OrgName]);
    List.Cells[1,1].Select;
    List.Cells[1,1].Copy;
  finally
    q.Free;
    XLApp.Visible:=true;
  end;
end;
//==============================================================================
end.

