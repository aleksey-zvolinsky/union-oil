unit RashVedom;

interface

Uses Main,OilStd,ComObj, ActiveX,Messages,Dialogs,
{$IFDEF VER120}
  OleCtrls,
{$ENDIF}
  Excel8TLB, StdCtrls,Progr,ReportManager,DB,DBTables,SysUtils,Classes,MoneyFunc,
  ExFunc,ExcelFunc,uOilQuery,Ora, uOilStoredProc, uCommonForm,udbplan,udbfunc;

Procedure DoRashVedomRep(var RM:TRepManagerForm;Progr:TProgrForm;List:Variant);

implementation

Procedure DoRashVedomRep(var RM:TRepManagerForm;Progr:TProgrForm;List:Variant);
Var
  ProgressIncrement, I : Integer;
  qOrg2 : TOilQuery;
  GBuh, Boss:  String;
  sum: real;
Begin
  qOrg2 := nil;
  Try
    With RM Do
    Try
      If ceOrg.Text = '' Then
      begin
        ShowMessage(TranslateText('Введите пожалуйста АЗС!'));
        Exit;
      end;
      qOrg2  := TOilQuery.Create(nil);
      qOrg2.SQL.Text := 'Select * from V_oil_org where id = :a And inst = id order by def desc';
      qOrg2.Prepare;
      uDbPlan.Dbplan.qRashVedom.Close;
      if opr_id=0
       then _OpenQueryPar(uDbPlan.Dbplan.qRashVedom,
                    ['date1',FormatDateTime('dd.mm.yyyy',From_Date2.Date),
                    'date2',FormatDateTime('dd.mm.yyyy',To_Date2.Date),
                    'azs_id',OrgId,'azs_inst',OrgInst,'oper_id',''])
       else _OpenQueryPar(uDbPlan.Dbplan.qRashVedom,
                    ['date1',FormatDateTime('dd.mm.yyyy',From_Date2.Date),
                    'date2',FormatDateTime('dd.mm.yyyy',To_Date2.Date),
                    'azs_id',OrgId,'azs_inst',OrgInst,'oper_id',opr_id]);
      uDbPlan.Dbplan.qRashVedom.First;
      sum:=0;
      Progr.AddProgress(20);
      ProgressIncrement := Round((100-30)/(4+uDbPlan.Dbplan.qRashVedom.RecordCount*15));
      if cbNoPart.Checked then
        List.Columns['D:D'].Hidden := True;
      ExFormat(List,8,'C',
        [edOrg.Text]);
      ExFormat(List,10,'C',
        [FormatDateTime('dd.mm.yyyy',From_Date2.Date),
         FormatDateTime('dd.mm.yyyy',To_Date2.Date)]);
      Progr.AddProgress(5);
      qOrg2.Close;
      qOrg2.ParamByName('a').AsInteger := OrgId;
      qOrg2.Open;
      Progr.AddProgress(5);

      qOrg2.ParamByName('a').AsInteger := qOrg2.FieldByName('Par').AsInteger;
      qOrg2.Close;
      qOrg2.Open;
      ExFormat(List,2,'C',
        [qOrg2.FieldByName('Name').AsString]);
      ExFormat(List,3,'C',
        [qOrg2.FieldByName('RACH_CHET').AsString]);
      ExFormat(List,4,'C',
        [qOrg2.FieldByName('Id_Num').AsString]);
      List.Cells[3,'J'] := qOrg2.FieldByName('MFO').AsString;
      GBuh := qOrg2.FieldByName('GBuh').AsString;
      Boss := qOrg2.FieldByName('Boss').AsString;

      List.Cells[3,'G'] := qOrg2.FieldByName('Bank_Name').AsString;
      Progr.AddProgress(ProgressIncrement);
      List.Columns['K'].Hidden := True;
      uDbPlan.Dbplan.qRashVedom.First;
      For I := 1 to uDbPlan.Dbplan.qRashVedom.RecordCount do
      begin
        sum:=sum+uDbPlan.Dbplan.qRashVedom.FieldByName('amount').AsFloat;
        List.Cells[12 + I, 'B'] := I;
        List.Cells[12 + I, 'C'] := uDbPlan.Dbplan.qRashVedom.FieldByName('rep_date').AsString;
        if not cbNoPart.Checked then
          List.Cells[12 + I, 'D'] := uDbPlan.Dbplan.qRashVedom.FieldByName('Dog').AsString;
        List.Cells[12 + I, 'E'] := uDbPlan.Dbplan.qRashVedom.FieldByName('Np_Name').AsString;
        List.Cells[12 + I, 'F'] := GetNoNDS_WithNDS(uDbPlan.Dbplan.qRashVedom.FieldByName('Price').AsFloat,uDbPlan.Dbplan.qRashVedom.FieldByName('rep_date').AsDateTime) ;
        List.Cells[12 + I, 'G'] := uDbPlan.Dbplan.qRashVedom.FieldByName('Price').AsFloat;
        List.Cells[12 + I, 'H'] := uDbPlan.Dbplan.qRashVedom.FieldByName('Litr').AsFloat;
        List.Cells[12 + I, 'I'] := uDbPlan.Dbplan.qRashVedom.FieldByName('Dim_Name').AsString;
        List.Cells[12 + I, 'J'] := uDbPlan.Dbplan.qRashVedom.FieldByName('Amount').AsFloat*(1 - TAX_RATE(uDbPlan.Dbplan.qRashVedom.FieldByName('rep_date').AsDateTime)/(1+TAX_RATE(uDbPlan.Dbplan.qRashVedom.FieldByName('rep_date').AsDateTime)));
        List.Cells[12 + I, 'K'] := uDbPlan.Dbplan.qRashVedom.FieldByName('Amount').AsFloat;
        List.Range['B'+IntToStr(12+I)+':J'+IntToStr(12+I)].Borders[xlEdgeTop].Weight := xlSingle;
        uDbPlan.Dbplan.qRashVedom.Next;
      end;

      if not(uDbPlan.Dbplan.qRashVedom.IsEmpty) then
      begin
        For I := 2 To 10 Do
          List.Range[ExcelStr(I)+'13:'+ExcelStr(I)+IntToStr(12+uDbPlan.Dbplan.qRashVedom.RecordCount)].Borders[xlEdgeLeft].Weight := xlSingle;
        List.Range['B13:J'+IntToStr(12+uDbPlan.Dbplan.qRashVedom.RecordCount)].Borders[xlEdgeLeft].Weight   := xlMedium;
        List.Range['B13:J'+IntToStr(12+uDbPlan.Dbplan.qRashVedom.RecordCount)].Borders[xlEdgeRight].Weight  := xlMedium;
        List.Range['B13:J'+IntToStr(12+uDbPlan.Dbplan.qRashVedom.RecordCount)].Borders[xlEdgeTop].Weight    := xlMedium;
        List.Range['B13:J'+IntToStr(12+uDbPlan.Dbplan.qRashVedom.RecordCount)].Borders[xlEdgeBottom].Weight := xlMedium;
        List.Cells[13 + uDbPlan.Dbplan.qRashVedom.RecordCount, 'J'].Formula := '= J'+IntToStr(15+uDbPlan.Dbplan.qRashVedom.RecordCount)+'-J'+IntToStr(14+uDbPlan.Dbplan.qRashVedom.RecordCount);
        List.Range['B'+IntToStr(13 + uDbPlan.Dbplan.qRashVedom.RecordCount)+':J'+IntToStr(13+uDbPlan.Dbplan.qRashVedom.RecordCount)].Borders[xlEdgeLeft].Weight   := xlMedium;
        List.Range['B'+IntToStr(13 + uDbPlan.Dbplan.qRashVedom.RecordCount)+':J'+IntToStr(13+uDbPlan.Dbplan.qRashVedom.RecordCount)].Borders[xlEdgeRight].Weight  := xlMedium;
        List.Range['B'+IntToStr(13 + uDbPlan.Dbplan.qRashVedom.RecordCount)+':J'+IntToStr(13+uDbPlan.Dbplan.qRashVedom.RecordCount)].Borders[xlEdgeTop].Weight    := xlMedium;
        List.Range['B'+IntToStr(13 + uDbPlan.Dbplan.qRashVedom.RecordCount)+':J'+IntToStr(13+uDbPlan.Dbplan.qRashVedom.RecordCount)].Borders[xlEdgeBottom].Weight := xlMedium;
        List.Cells[14 + uDbPlan.Dbplan.qRashVedom.RecordCount, 'B'] := LangText('NDS') + FloatToStr(TAX_RATE(uDbPlan.Dbplan.qRashVedom.FieldByName('rep_date').AsDateTime)*100)+'%';
        List.Cells[14 + uDbPlan.Dbplan.qRashVedom.RecordCount, 'J']:= sum*TAX_RATE(uDbPlan.Dbplan.qRashVedom.FieldByName('rep_date').AsDateTime)/(1+TAX_RATE(uDbPlan.Dbplan.qRashVedom.FieldByName('rep_date').AsDateTime)) ;
        List.Cells[15 + uDbPlan.Dbplan.qRashVedom.RecordCount, 'B'] := LangText('Itogo');
        List.Cells[15 + uDbPlan.Dbplan.qRashVedom.RecordCount, 'J'] := sum;
        List.Cells[16 + uDbPlan.Dbplan.qRashVedom.RecordCount, 'B'] := LangText('sum')+LangText('S_NDS')+LangText('Propisu')+':       ' + NumStrGrn(List.Cells[15 + uDbPlan.Dbplan.qRashVedom.RecordCount, 'J'].Value, TranslateText('грн.'), TranslateText('коп.'));
        List.Cells[18 + uDbPlan.Dbplan.qRashVedom.RecordCount, 'B'] := MANAGER_SHIP;
        List.Cells[18 + uDbPlan.Dbplan.qRashVedom.RecordCount, 'G'] := BUH_SHIP;
        List.Cells[19 + uDbPlan.Dbplan.qRashVedom.RecordCount, 'B'] := LangText('Otpustil');
        List.Cells[19 + uDbPlan.Dbplan.qRashVedom.RecordCount, 'G'] := LangText('Prinial');
      end;
  Except On E:Exception Do
      MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
    End;
  Finally
      qOrg2.Free;
  end;
End;
end.
