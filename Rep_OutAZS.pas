unit Rep_OutAZS;

interface

Uses
  DBTables, Excel8TLB, SysUtils,
  Main, ReportManager, Progr, uDBFunc, uDBPlan, Rep_s,uOilQuery,Ora, uOilStoredProc;

procedure OutAzs(RM:TRepManagerForm; Progr: TProgrForm);

implementation

uses uCommonForm,  ExFunc,classes,ExcelFunc,UIdListsClass;

procedure OutAzs(RM:TRepManagerForm; Progr: TProgrForm);
const HEADLINE=6;

var
  q,qNp: TOilQuery;
  XLApp,List:Variant;
  NpCol,EmptyCol: TStringList;
  range,OperList:string;
  lastcolumn,podrazdline: integer;
  progrstep,progrposition: real;
  //----------------------------------------------------------------------------
  procedure ActivateQ;
  var s:string;
  begin
    q:=TOilQuery.Create(RM);
    q.FetchAll:=true;
    q.Sql.Text:=' select nvl(pponname,oblname) as podrname,azsname,np_groupid,'+
                '        decode(operid,14,'+BoolTo_(RM.cb104_Unite.Checked,'1','2')+',1) as code,'+
                '        litr,tonn,summa ';
    q.Sql.Add(  ' from v_oil_npmove ');
    q.Sql.Add(  ' where nbazs=1 and rashprih=0 and IsShtuki=''N'' ');
    q.Sql.Add(  '       and date_ between '''+DateToStr(RM.From_Date2.Date)+''' and '''+DateToStr(RM.To_Date2.Date)+''' ');
    q.Sql.Add(  '       and '+IntToStr(RM.OrgId)+' in (AzsId,PponId,OblId) ');
    q.Sql.Add(  '       and np_groupid in ('+RM.NpList+') ');
    s:='';
    if RM.cb104_Cash.Checked then s:=s+'12,';
    if RM.cb104_Payroll.Checked then s:=s+'11,';
    if RM.cb104_Coupon.Checked then s:=s+'14,';
    if RM.cb104_Spis.Checked then s:=s+'153,';
    if RM.cb104_Other.Checked then
       s:=s+RM.OperList;
    if s='' then
      s:='null'
    else if s[length(s)]=',' then
      SetLength(s,length(s)-1);
    q.Sql.Add(  '       and operid in ('+s+') ');
    OperList:=s;

    s:='';
    if RM.cb104_Cash.Checked then s:=s+'5,';
    if RM.cb104_Payroll.Checked then s:=s+'2,';
    if RM.cb104_Coupon.Checked then s:=s+'9,';
    if RM.cb104_Other.Checked then s:=s+'3,';
    if RM.cb104_Other.Checked
     and ( (pos(',40,',','+RM.OperList+',')>0) or (pos(',153,',','+RM.OperList+',')>0) )
      or RM.cb104_Spis.Checked
    then
      s:=s+'11,';
    if s='' then
      s:='null'
    else if s[length(s)]=',' then
      SetLength(s,length(s)-1);
    q.Sql.Add(  '       and selltypeid in ('+s+') ');
    if RM.cb104_Spis.Checked and (pos(',153,',','+RM.OperList+',')=0) then
      q.Sql.Add('      and card_alien<>''N'' ');

    q.Sql.Text:=' select podrname,azsname,np_groupid,code,sum(litr) as litr,sum(tonn) as tonn,sum(summa) as summa '+
                ' from ('+#13#10+q.Sql.Text+') '+#13#10+
                ' group by podrname,azsname,np_groupid,np_groupid,code ';
    _OpenQuery(q);
    if q.RecordCount=0 then
      raise Exception.Create(TranslateText('Отчет с указанными параметрами не содержит данных!'));
  end;
  //----------------------------------------------------------------------------
  procedure MakeExcelHead;
  var
    i:integer;
    npName,npgrp_ids:string;
    GroupIdList:TGroupIdList;
    //**************************************************************************
    procedure PutPiece(p_Str:string);
    begin
      List.Range[GetExcelRange(HEADLINE,i,HEADLINE,i+2)].Merge;
      List.Cells[HEADLINE,i]:=p_Str;
      List.Cells[HEADLINE+1,i]:=TranslateText('Тонны');
      List.Cells[HEADLINE+1,i+1]:=TranslateText('Литры');
      List.Cells[HEADLINE+1,i+2]:=TranslateText('грн');
      i:=i+3;
    end;
    //**************************************************************************
    procedure MakeFormat;
    var i,n:integer;
    begin
      List.Cells[1,'A']:='25;@';
      List.Cells[1,'B']:='16;@';
      qNp.First; n:=0;
      while not qNp.Eof do begin
        inc(n);
        if qNp.FieldByName('IsTalonGroup').AsString='Y' then
          inc(n);
        qNp.Next;
      end;
      qNp.First;
      for i:=1 to n do begin
        List.Cells[1,i*3]:='13;0.000000';
        List.Cells[1,i*3+1]:='13;0.000';
        List.Cells[1,i*3+2]:='13;0.00';
      end;
      XLApp.Run('FormatColumns');
      for i:=1 to n do begin
        if not RM.cb104_Ton.Checked then
          List.Columns[i*3].EntireCOlumn.Hidden:=TRUE;
        if not RM.cb104_Litre.Checked then
          List.Columns[i*3+1].EntireCOlumn.Hidden:=TRUE;
        if not RM.cb104_Money.Checked then
          List.Columns[i*3+2].EntireCOlumn.Hidden:=TRUE;
      end;
    end;
    //**************************************************************************
  begin
    ActivateXLApp('empty','d',1,XLApp,List);

    qNp:=TOilQuery.Create(RM);
    // При добавлении нового типа
    GroupIdList:=TGroupIdList.Create('NPGG_AZSREAL');
    npgrp_ids:='';
    for i:=0 to GroupIdList.Count-1 do
    begin
      if npgrp_ids='' then
        npgrp_ids:=GroupIdList.Values[i].CommaList
      else
        npgrp_ids:=npgrp_ids+','+GroupIdList.Values[i].CommaList;
    end;
    qNp.Sql.Text:=' select npg.id,npg.name,decode(instr(val.value,npg.id),0,''N'',''Y'') as IsTalonGroup, '+
                  '        decode(npg.id,59,6.5,8,100,npg.id) as OrderNum '+
                  ' from oil_np_group npg, '+
                  '      (select value '+
                  '       from oil_var, (select ''TALON_NP_GROUPS'' as name from dual) Q '+
                  '       where oil_var.name(+)=Q.name) val '+
                  ' where npg.id in ('+npgrp_ids+') '+
                  ' UNION ALL '+
                  ' select 0 as id,''Итого'',''Y'',1000 as OrderNum from dual '+
                  ' UNION ALL '+
                  ' select -1 as id,''Всего'',''N'',1100 as OrderNum from dual '+
                  ' order by OrderNum ';
    _OpenQuery(qNp);
    List.Cells[HEADLINE,1]:=TranslateText('Подразделение');
    List.Cells[HEADLINE,2]:=TranslateText('АЗС');
    MakeFormat;

    i:=3;
    NpCol:=TStringList.Create;
    EmptyCol:=TStringList.Create;

    while not qNp.Eof do
    begin
      npName:=qNp.FieldByName('name').AsString;
      NpCol.Add(qNp.FieldByName('id').AsString+'='+IntToStr(i));
      if qNp.FieldByName('id').AsInteger>0 then EmptyCol.Add('Y')
                                           else EmptyCol.Add('N');
      PutPiece(npname);
      if qNp.FieldByName('IsTalonGroup').AsString='Y' then
      begin
        NpCol.Add(qNp.FieldByName('id').AsString+'T='+IntToStr(i));
        if qNp.FieldByName('id').AsInteger>0 then EmptyCol.Add('Y')
                                             else EmptyCol.Add('N');
        PutPiece(npname+TranslateText(',талоны'));
      end;
      qNP.Next;
    end;
    dec(i);
    List.Rows[HEADLINE].EntireRow.RowHeight:=30;
    range:=GetExcelRange(HEADLINE,1,HEADLINE+1,i);
    List.Range[range].Interior.ColorIndex:=34;
    List.Range[range].Font.Bold:=TRUE;
    List.Range[range].VerticalAlignment:=xlCenter;
    List.Range[range].HorizontalAlignment:=xlCenter;
    DrawNetInExcel(List,1,i,HEADLINE,HEADLINE+1);
    lastcolumn:=i;
    PutTitle(List,'B1');
    List.Cells[2,'B']:=TranslateText('Реализация с АЗС по ')+RM.ceOrg.Text;
    List.Cells[2,'B'].Font.Bold:=TRUE;
    List.Cells[2,'B'].Font.Size:=14;
    List.Cells[3,'B']:=TranslateText('С ')+DateToStr(RM.From_Date2.Date)
      +TranslateText(' по ')+DateToStr(RM.To_Date2.Date);
    List.Cells[4,'B']:=TranslateText('Товар: ')
      +GetConstructedString([TranslateText('комиссионный'),TranslateText('собственный'),TranslateText('хранение')],
      [RM.cb104_Commission.Checked,RM.cb104_Own.Checked,RM.cb104_Store.Checked]);
    List.Cells[5,'B']:=TranslateText('Реализация ')
      +GetConstructedString( [ TranslateText('в тоннах'),TranslateText('в литрах'),TranslateText('в гривнах')],
        [ RM.cb104_Ton.Checked,RM.cb104_Litre.Checked,RM.cb104_Money.Checked ] )+'( '
      +GetConstructedString( [ TranslateText('за наличный расчет'),TranslateText('по безналичному расчету'),TranslateText('по талонам') ],
        [ RM.cb104_Cash.Checked,RM.cb104_Payroll.Checked,RM.cb104_Coupon.Checked ] )
      +';'+GetNameList(RM.OperList,'oil_oper_type')+')';
    List.Range['B1:B5'].HorizontalAlignment:=xlLeft;
  end;
  //----------------------------------------------------------------------------
  procedure PutToExcel;
  var
    CurPodrName,CurAzsName:string;
    line:integer;
    //**************************************************************************
    procedure PutOneLine;
    var
      n:integer;
      s:string;
      //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      procedure PutLineItogo(p_Type:string);
      var
        i,j,n:integer;
        s:string;
        formulas:array[0..2] of string;
      begin
        for j:=0 to 2 do formulas[j]:='';
        for i:=0 to NpCol.Count-1 do
        begin
          s:=NpCol.Names[i];
          if ((s[length(s)]=p_Type) or (p_Type='') and (s[length(s)]<>'T')) and not (s[1] in ['0','-']) then
            for j:=0 to 2 do
              formulas[j]:=formulas[j]
                +ExcelNumberToColumn( StrToInt(NpCol.Values[s])+j )
                +IntToStr(line)+'+';
        end;
        n:=StrToInt(NpCol.Values['0'+p_Type]);
        for j:=0 to 2 do
          List.Cells[line,n+j].Formula:='='+copy(formulas[j],1,length(formulas[j])-1);
      end;
      //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      procedure PutLineVsego;
      var n,n1,n2,j:integer;
      begin
        n:=StrToInt(NpCol.Values['-1']);
        n1:=StrToInt(NpCol.Values['0']);
        n2:=StrToInt(NpCol.Values['0T']);
        for j:=0 to 2 do
          List.Cells[line,n+j].Formula:='='+ExcelNumberToColumn(n1+j)+IntToStr(line)+'+'
            +ExcelNumberToColumn(n2+j)+IntToStr(line);
      end;
      //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    begin
      CurPodrName:=q.FieldByName('podrname').AsString;
      CurAzsName:=q.FieldByName('azsname').AsString;
      List.Cells[line,1]:=CurPodrName;
      List.Cells[line,2]:=CurAzsName;
      while (not q.Eof)
        and (CurPodrName=q.FieldByName('podrname').AsString)
        and (CurAzsName=q.FieldByName('azsname').AsString) do
      begin
        s:=q.FieldByName('np_groupid').AsString;
        if q.FieldByName('code').AsInteger=2 then
          s:=s+'T';
        n:=StrToInt( NpCol.Values[s] );
        List.Cells[line,n]:=q.FieldByName('tonn').AsFloat;
        List.Cells[line,n+1]:=q.FieldByName('litr').AsFloat;
        List.Cells[line,n+2]:=q.FieldByName('summa').AsFloat;

        n:=NpCol.IndexOfName(s);
        if EmptyCol[n]='Y' then
          EmptyCol[n]:='N';
        q.Next;
        progrposition:=progrposition+progrstep;
        if Progr.Progress<>trunc(progrposition) then
        begin
          Progr.Progress:=trunc(progrposition);
          Progr.Refresh;
        end;
      end;
      PutLineItogo('');
      PutLineItogo('T');
      PutLineVsego;
      inc(line);
    end;
    //**************************************************************************
    procedure PutItogi(firstline,lastline: integer);
    var i:integer;
    begin
      for i:=3 to lastcolumn do
        List.Cells[line,i].Formula:='=SubTotal(9,'+GetExcelRange(firstline,i,lastline,i)+')';
      List.Rows[line].EntireRow.Font.Bold:=TRUE;
    end;
    //**************************************************************************
    procedure HideEmptyColumns;
    var i,j,n:integer;
    begin
      for i:=0 to EmptyCol.Count-1 do
        if EmptyCol[i]='Y' then
        begin
          n:=StrToInt( NpCol.Values[NpCol.Names[i]] );
          for j:=0 to 2 do
            List.Columns[n+j].EntireColumn.Hidden:=TRUE;
        end;
    end;
    //**************************************************************************
  begin
    line:=HEADLINE+2;
    podrazdline:=line;
    while not q.Eof do
    begin
      PutOneLine;
      if q.Eof or (CurPodrName<>q.FieldByName('podrname').AsString) then
      begin
        List.Cells[line,'A']:=TranslateText('ИТОГО по ')+CurPodrName;
        PutItogi(podrazdline,line-1);
        inc(line);
        podrazdline:=line;
        CurPodrName:=q.FieldByName('podrname').AsString;
      end;
    end;
    List.Cells[line,'A']:=TranslateText('ВСЕГО');
    PutItogi(HEADLINE+2,line-1);
    HideEmptyColumns;
  end;
  //----------------------------------------------------------------------------
begin
  try
    ActivateQ;
    progrposition:=Progr.Progress;
    progrstep:=(Progr.MaxValue-Progr.Progress)/q.RecordCount;
    MakeExcelHead;
    PutToExcel;
    XLApp.Run('FreezePanes',HeadLine+2,3);
    List.Cells[1,'A'].Select;
    XLApp.Visible:=TRUE;
    //XLApp.ActiveWorkbook.SaveAs('d:\oil\doc\1111.xls');
  finally
    if Assigned(q) then q.Destroy;
    if Assigned(qNp) then qNp.Destroy;
    if Assigned(npCol) then npCol.Destroy;
    if Assigned(EmptyCol) then EmptyCol.Destroy;
  end;
end;

end.
