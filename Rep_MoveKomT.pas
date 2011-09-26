unit Rep_MoveKomT;
interface

Uses Main,OilStd,ComObj, ActiveX,
{$IFDEF VER120}
  OleCtrls,
{$ENDIF}
  Excel8TLB, StdCtrls,Progr,ReportManager,DB,DBTables,SysUtils,Classes,uOilQuery,Ora, uOilStoredProc, uCommonForm;

Type TOutCol=^POutCol;
     POutCol=record
              id:integer;
              Name:string;
              Kol:string;
             end;

    TPrice=^PPrice;
    PPrice=record
            Price:real;
            Pos:integer;
           end;

Procedure MoveKomT(var RM:TRepManagerForm;Progr:TProgrForm;List:Variant;Workbook: Excel8TLB._Workbook;ISheet: Excel8TLB._Worksheet);

implementation

//------------- Здесь пишеться текст отчета
Procedure MoveKomT(var RM:TRepManagerForm;Progr:TProgrForm;List:Variant;Workbook: Excel8TLB._Workbook;ISheet: Excel8TLB._Worksheet);
Var
 qMove, qOrg :TOilQuery;
 ProgressIncrement, I : Integer;
 S, S1, GBuh : String;
Begin
 with RM do
 begin
 qOrg := TOilQuery.Create(nil);
 qMove:=TOilQuery.Create(nil);
 try
  qOrg.sql.text:='Select name,Par_Name, boss, gbuh,par from V_oil_org where id = :a And inst = id and par = par_inst';
  qOrg.Prepare;
  qOrg.ParamByName('a').AsInteger := OrgID;
  qOrg.Open;

  GBuh := qOrg.fieldbyname('GBuh').AsString;
//  Boss := qOrg.fieldbyname('Boss').AsString;


  s:='';
  {If rbKom.Checked Then S := 'K'
  Else
  If rbOwn.Checked Then S := 'O'
                   Else S := 'S';}
  S1:='';
  if CheckList2.Checked[0] then
  begin
    S:=S+'''K''';
    s1:=',';
  end;
  if CheckList2.Checked[1] then
  begin
    S:=S+S1+'''S''';
    s1:=',';
  end;
  if CheckList2.Checked[2] then
    S:=S+S1+'''O''';
  qMove.sql.text:=' SELECT A.Price , B.NP_TYPE_NAME, B.DOG, A.COUNT_, A.DATE_, C.NAME, A.TTN_NUM, F.NAME as N'+
                  ' FROM'+
                  ' OIL_RASHOD   A,'+
                  ' V_OIL_PART   B,'+
                  ' v_org      C,'+
                  ' v_org      F '+
                  ' WHERE'+
                  ' A.OPER_ID   =  :OP    AND'+
                  ' A.DATE_     >= :A     AND'+
                  ' A.DATE_     <= :B     AND'+
                  ' A.STATE     =  ''Y''  AND'+
                  ' C.STATE     =  ''Y''  AND'+
                  ' A.PART_ID   =  B.ID   AND'+
                  ' A.PART_INST =  B.INST AND'+
                  ' A.TO_ID     =  C.ID   AND'+
                  ' A.TO_INST   =  C.INST AND'+
                  ' A.OPER_ID   =  150    AND'+
                  ' A.FROM_ID   =  F.ID   AND'+
                  ' A.FROM_INST =  F.INST AND'+
                  ' ((a.from_id = :fromid  and '+
                  ' a.from_inst = :frominst) OR '+
                  '(a.to_id = :toid and'+
                  ' a.to_inst = :toinst)OR'+
                  '(f.par = :parid  and '+
                  ' f.par_inst = :parinst )) and '+
                  ' B.OWN_GOODS in ( ' + S + ')'+
                  ' ORDER BY'+
                  ' B.NP_TYPE_NAME, B.DOG, A.DATE_';
  qMove.Close;
  qMove.ParamByName('a').AsDateTime := from_date2.date;
  qMove.ParamByName('b').AsDateTime := to_date2.Date;
  qMove.ParamByName('op').AsInteger := OPER_MOVENB;
  qMove.ParamByName('fromid').asInteger   := OrgId;
  qMove.ParamByName('frominst').asInteger := OrgInst;
  qMove.ParamByName('parid').asInteger    := OrgId;
  qMove.ParamByName('parinst').asInteger  := OrgInst;
  qMove.ParamByName('toid').asInteger     := OrgId;
  qMove.ParamByName('toinst').asInteger   := OrgInst;
  qMove.FetchAll:=true;
  qMove.Open;

  S:=TranslateText('Отчет о внутреннем перемещении ');
  s1:='';
  if CheckList2.Checked[0] Then
  begin
    s:=S+TranslateText('комиссионного ');
    s1:=', ';
  end;
  if CheckList2.Checked[1] Then
  begin
    s:=S+s1+TranslateText('хранимого ');
    s1:=', ';
  end;
  if CheckList2.Checked[2] then
  begin
    s:=S+s1+TranslateText('собственного ');
  end;
  if CheckList2.Checked[0] and
     CheckList2.Checked[1] and
     CheckList2.Checked[2] then
     s:=TranslateText('Отчет о внутреннем перемещении всего ');
  List.Cells[2,'C']:= S+TranslateText('товара');


  If qMove.RecordCount <>0 then
  begin
    ProgressIncrement := Round((100-20)/(3+qMove.RecordCount*7));
    List.Cells[4,'D'] := FormatDateTime2('dd.mm.yyyy',from_date2.Date);
    progr.AddProgress(ProgressIncrement);
    List.Cells[4,'G'] := FormatDateTime2('dd.mm.yyyy',to_date2.Date);
    progr.AddProgress(ProgressIncrement);
    List.Cells[6,'F'] := ceOrg.text;
    progr.AddProgress(ProgressIncrement);

    
    For I := 1 To qMove.RecordCount Do
    Begin
      List.Cells[I + 8, 'B'] := I;
      List.Cells[I + 8, 'C'] := qMove.fieldbyname('Dog').AsString;
      List.Cells[I + 8, 'D'] := qMove.fieldbyname('NP_Type_Name').AsString;
      List.Cells[I + 8, 'E'] := qMove.fieldbyname('Price').AsFloat;
      List.Cells[I + 8, 'F'] := qMove.fieldbyname('Count_').AsFloat;
      List.Cells[I + 8, 'G'] := FormatDateTime2('dd.mm.yyyy',qMove.fieldbyname('Date_').AsDateTime);
      List.Cells[I + 8, 'H'] := qMove.fieldbyname('Name').AsString;
      List.Cells[I + 8, 'I'] := qMove.fieldbyname('TTN_Num').AsString;
      List.Cells[I + 8, 'J'] := qMove.fieldbyname('N').AsString;
      qMove.Next;
      List.Range['B'+IntToStr(I+8)+':'+'J'+IntToStr(I+8)].Borders[xlEdgeBottom].Weight := xlSingle;
    End;
    List.Cells[qMove.RecordCount + 9, 'C'] := TranslateText('Всего');
//    List.Cells[qMove.RecordCount + 9, 'E'] := '=SUM(E9:E'+IntToStr(qMove.RecordCount + 8)+')';
    List.Cells[qMove.RecordCount + 9, 'F'] := '=SUM(F9:F'+IntToStr(qMove.RecordCount + 8)+')';
    For I := 3 To 8 Do
      List.Range[ExcelStr(I)+'8:'+ExcelStr(I)+IntToStr(qMove.RecordCount+8)].Borders[xlEdgeLeft].Weight := xlSingle;
    List.Range['B8:J'+IntToStr(qMove.RecordCount + 9)].Borders[xlEdgeBottom].Weight := xlMedium;
    List.Range['B8:J'+IntToStr(qMove.RecordCount + 9)].Borders[xlEdgeTop].Weight    := xlMedium;
    List.Range['B8:J'+IntToStr(qMove.RecordCount + 9)].Borders[xlEdgeLeft].Weight   := xlMedium;
    List.Range['B8:J'+IntToStr(qMove.RecordCount + 9)].Borders[xlEdgeRight].Weight  := xlMedium;
    List.Range['B'+IntToStr(qMove.RecordCount + 9)+':J'+IntToStr(qMove.RecordCount + 9)].Borders[xlEdgeTop].Weight    := xlMedium;

    List.Cells[1,'B'].Font.Size:=8;
    List.Cells[1,'B'] := FormatDateTime('dd.mm.yyyy hh:nn:ss', GetSystemDate) +' '+ CURRENT_NAME;

    if CheckList2.Checked[0] and not CheckList2.Checked[1] and not CheckList2.Checked[2] then
       Begin
         List.Cells[qMove.RecordCount + 13,'C'] := TranslateText('Председатель правления');
         List.Cells[qMove.RecordCount + 16,'C'] := TranslateText('Главный бухгалтер');
         List.Cells[qMove.RecordCount + 16,'E'] := GBuh;
       End
       else Begin
         List.Cells[5,'C'] := '';
         List.Cells[5,'E'] := '';
       End;

    List.Cells[qMove.RecordCount + 13,'H'] := MANAGER_SHIP;
    List.Cells[qMove.RecordCount + 16,'H'] := TranslateText('Старший учётчик');
  end;
 finally
  qMove.Free;
  qOrg.Free;
 end;
 end;
End;

end.
