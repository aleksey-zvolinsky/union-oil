unit Rep_UdWeig;
interface

Uses Main,OilStd,ComObj, ActiveX,
{$IFDEF VER120}
  OleCtrls,
{$ENDIF}
  Excel8TLB, StdCtrls,Progr,ReportManager,DB,DBTables,SysUtils,Classes,uOilQuery,Ora, uOilStoredProc;

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

Procedure SrUdWeig(var RM:TRepManagerForm;Progr:TProgrForm;List:Variant;Workbook: Excel8TLB._Workbook;ISheet: Excel8TLB._Worksheet);
implementation

uses uCommonForm,  UDbFunc;

//------------- Здесь пишеться текст отчета
Procedure SrUdWeig(var RM:TRepManagerForm;Progr:TProgrForm;List:Variant;Workbook: Excel8TLB._Workbook;ISheet: Excel8TLB._Worksheet);
Var
  q: TOilQuery;
  ProgressIncrement, I, ANum, DayN : Integer;
  A : Array[0..1000] Of Integer;
  Flag : Boolean;
  CurDate : TDateTime;
Begin
  with RM do
  begin
    q := TOilQuery.Create(nil);
    qNP := TOilQuery.Create(nil);
    try
      q.FetchAll:=true;
      q.sql.text:=
        ' select npt.id as np_type,npt.name as np_type_name,r.date_,round(avg(r.ud_weig),4) uw'+
        ' from oil_rashod r,oil_part p,oil_np_type npt,v_oil_dim dim'+
        ' where r.state=''Y'' and p.state=''Y'''+
        '   and r.part_id=p.id and r.part_inst=p.inst'+
        '   and p.dim_id=dim.id and p.np_type=npt.id'+
        '   and r.prih is null and r.to_id is not null'+
        '   and dim.IsShtuki<>''Y'''+
        '   and r.date_ between :a and :b'+
        ' group by npt.id,npt.name,r.date_'+
        ' order by date_,np_type';
      q.Prepare;
      q.ParamByName('a').AsDateTime := From_date2.Date;
      q.ParamByName('b').AsDateTime := To_date2.Date;
      q.Open;
      If q.RecordCount <> 0 Then
      begin

        qNP.FetchAll:=true;
        qNP.sql.text:=' select distinct b.id, b.name'+
                        ' from'+
                        ' oil_rashod  A,'+
                        ' oil_np_type B,'+
                        ' oil_part    C,'+
                        ' v_oil_dim   dim'+
                        ' where'+
                        ' a.state     = ''Y''    AND'+
                        ' b.state     = ''Y''    AND'+
                        ' c.state     = ''Y''    AND'+
                        ' c.np_type   = b.id   AND'+
                        ' a.part_id   = c.id   AND'+
                        ' a.part_inst = c.inst AND'+
                        ' C.dim_id=dim.id and dim.IsShtuki<>''Y'' AND'+
                        ' date_ >= :b And'+
                        ' date_ <= :e'+
                        ' Group By b.id,b.name';

        ProgressIncrement := Round((100-35)/(4+q.RecordCount));
        List.Cells[6,'D'] := FormatDateTime2('dd.mm.yyyy',from_date2.Date);
        List.Cells[6,'G'] := FormatDateTime2('dd.mm.yyyy',to_date2.Date);
        progr.AddProgress(5);

        List.Cells[1,2].Font.Size:=8;
        List.Cells[1,2].HorizontalAlignment:=xlLeft;
        List.Cells[1,2] := GetOrgName(Main.Main_Id,Main.Inst)+'; '+DateToStr(Date)+'; '+TimeToStr(Time);



        List.Cells[4,'D'] := GetOrgName(OrgID, OrgID);
        progr.AddProgress(5);
        progr.AddProgress(ProgressIncrement);

        qNP.Close;
        qNP.Prepare;
        qNP.ParamByName('b').AsDateTime := from_date2.Date;
        qNP.ParamByName('e').AsDateTime := to_date2.Date;
        qNP.Open;

        For I := 1 To qNP.RecordCount Do
        Begin
          List.Range[ExcelStr(I+2)+'8:'+ExcelStr(I+2)+'9'].Merge;
          List.Range[ExcelStr(I+2)+'8:'+ExcelStr(I+2)+'9'].WrapText := True;
          List.Cells[8, I+2] := qNP.fieldbyname('Name').AsString;
          A[I] := qNP.fieldbyname('ID').AsInteger;
          qNP.Next;
        End;
        progr.AddProgress(5);
        q.First;
        ANum := 0;
        DayN := 0;
        CurDate := Date;
        While Not q.EOF Do
        Begin
          If (DayN = 0)Or(q.fieldbyname('Date_').AsDateTime <> CurDate) Then
          Begin
            ANum := 1;
            Inc(DayN);
            CurDate := q.fieldbyname('Date_').AsDateTime;
            List.Cells[DayN + 9, 2] := FormatDateTime2('dd.mm.yyyy', q.fieldbyname('Date_').AsDateTime);
            List.Range['B'+IntToStr(DayN+9)+':'+ExcelStr(2+qNP.RecordCount)+'9'].Borders[xlEdgeBottom].Weight := xlSingle;
          End
          Else
          Begin
            Flag := False;
            While (Not Flag)And(qNP.RecordCount >= ANum) Do
            Begin
              If q.fieldbyname('Np_Type').AsInteger = A[ANum] Then
              Begin
                List.Cells[DayN + 9,ANum + 2] := q.fieldbyname('UW').AsFloat;
                q.Next;
                Flag := True;
                progr.AddProgress(ProgressIncrement);
              End
              Else
                Inc(ANum);
            End;
            //If Not Flag Then ShowMessage('ОШИБКА: Не найден тип НП!');
          End;
        End;
        For I := 1 To qNP.RecordCount Do
          List.Cells[DayN+10,2+I] := '=AVERAGE('+ExcelStr(I+2)+'10:'+ExcelStr(I+2)+IntToStr(DayN+9)+')';
   {Grid}
        For I:= 3 To qNP.RecordCount + 1 Do
          List.Range[ExcelStr(I)+'8:'+ExcelStr(I)+IntToStr(DayN+10)].Borders[xlEdgeRight].Weight  := xlSingle;
   {Right}
        List.Range[ExcelStr(qNP.RecordCount + 2)+'8:'+ExcelStr(qNP.RecordCount + 2)+IntToStr(DayN+10)].Borders[xlEdgeRight].Weight  := xlMedium;
   {Top}
        List.Range['C8:'+ExcelStr(2+qNP.RecordCount)+'9'].Borders[xlEdgeBottom].Weight := xlMedium;
        List.Range['C8:'+ExcelStr(2+qNP.RecordCount)+'9'].Borders[xlEdgeTop].Weight    := xlMedium;
        List.Range['C8:'+ExcelStr(2+qNP.RecordCount)+'9'].Borders[xlEdgeLeft].Weight   := xlMedium;
        List.Range['C8:'+ExcelStr(2+qNP.RecordCount)+'9'].Borders[xlEdgeRight].Weight  := xlMedium;
   {Left}
        List.Range['B10:B'+IntToStr(DayN+9)].Borders[xlEdgeBottom].Weight := xlMedium;
        List.Range['B10:B'+IntToStr(DayN+9)].Borders[xlEdgeTop].Weight    := xlMedium;
        List.Range['B10:B'+IntToStr(DayN+9)].Borders[xlEdgeLeft].Weight   := xlMedium;
        List.Range['B10:B'+IntToStr(DayN+9)].Borders[xlEdgeRight].Weight  := xlMedium;
   {Bottom}
        List.Range['B'+IntToStr(DayN+10)+':'+ExcelStr(2+qNP.RecordCount)+'10'].Borders[xlEdgeBottom].Weight := xlMedium;
        List.Range['B'+IntToStr(DayN+10)+':'+ExcelStr(2+qNP.RecordCount)+'10'].Borders[xlEdgeTop].Weight    := xlMedium;
        List.Range['B'+IntToStr(DayN+10)+':'+ExcelStr(2+qNP.RecordCount)+'10'].Borders[xlEdgeLeft].Weight   := xlMedium;
        List.Range['B'+IntToStr(DayN+10)+':'+ExcelStr(2+qNP.RecordCount)+'10'].Borders[xlEdgeRight].Weight  := xlMedium;

      end;
    finally
      qNP.Free;
      q.Free;
    end;
  end;
End;

end.
