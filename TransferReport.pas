unit TransferReport;

interface

uses uCommonForm,  ReportManager,Excel8TLB, Dialogs, Db, DBTables, SysUtils, Main,
     Forms,
{$IFDEF VER120}
  OleCtrls,
{$ENDIF}
  StdCtrls,Progr,uOilQuery,Ora, uOilStoredProc;

Procedure MakeTransferReport(var RM:TRepManagerForm);

implementation

uses ExcelFunc, ExFunc, UdbFunc;

Procedure MakeTransferReport(var RM:TRepManagerForm);
  var qMain : TOilQuery;
      XLApp,List:Variant;
      Progr:TProgrForm;
Begin
  Application.CreateForm(TProgrForm,progr);
  qMain := TOilQuery.Create(nil);
  try
    Progr.Show;
    Progr.Repaint;
    with RM do
    Try
      qMain.SQL.Clear;
      qMain.SQL.Add('select O.name as OrgName, R.date_ as Date_, '''+' '+''' as id, '+
                    'NP_T.name as NPT_Name, P_From.dog as from_dog, '+
                    'P_To.dog as to_dog, decode(dim.IsShtuki,''Y'',0,R.count_) as tonn,'+
                    'decode(dim.IsShtuki,''Y'',R.count_,0) as shtuki,R.comm as comm'+
                    '  from v_org O, oil_rashod R, oil_np_type NP_T, oil_part P_From, oil_part P_To, oil_prihod Prih, v_oil_dim dim'+
                    '  where R.state = ''Y''');
      qMain.SQL.Add(' and R.Date_ >='''+DateTimeToStr(From_date2.Date)+''' and R.Date_ <='''+DateTimeToStr(To_date2.Date)+'''');
      if SpeedButton5.Down then
        qMain.SQL.Add(' and R.oper_id in '+OperList)
      else
        qMain.SQL.Add(' and R.oper_id = '+IntToStr(edOper4.Tag));
      qMain.SQL.Add(' and R.from_id=O.id');
      qMain.SQL.Add(' and R.from_inst=O.inst');
      qMain.SQL.Add(' and ((O.id='+IntToStr(OrgID)+' and O.inst='+IntToStr(OrgInst)+')'+
                      ' or (O.par='+IntToStr(OrgID)+' and O.par_inst='+IntToStr(OrgInst)+'))');
      qMain.SQL.Add(' and P_From.np_type = NP_T.id');
      if not CBNpAll.Checked then
         qMain.SQL.Add(' and NP_T.grp_id='+qNPID.AsString);
      qMain.SQL.Add(' and R.prih = Prih.id');
      qMain.SQL.Add(' and R.prih_inst =Prih.inst');
      qMain.SQL.Add(' and Prih.state = ''Y''');
      qMain.SQL.Add(' and Prih.part_id = P_To.id');
      qMain.SQL.Add(' and Prih.part_inst = P_To.inst');
      qMain.SQL.Add(' and R.part_id = P_From.id');
      qMain.SQL.Add(' and R.part_inst =P_From.inst');
      qMain.SQL.Add(' and P_From.dim_id=dim.id');
      if not CBPartAll.Checked
         then Begin
            qMain.SQL.Add(' and P_From.id='+IntToStr(edPart.Tag));
            qMain.SQL.Add(' and P_From.inst='+IntToStr(lPart.Tag));
         End;
      qMain.SQL.Add(' order by O.name, NP_T.name, P_From.dog, R.date_, P_To.dog');
      qMain.Open;
      if qMain.RecordCount=0
         then Begin
           Progr.Hide;
           ShowMessage(TranslateText('Ничего нет.'));
           Exit;
         End;
      Progr.AddProgress(10);

      ActivateXLApp('Transfer','Transfer',1,XLApp,List);

//    Дата/время/место построения отчета
      List.Cells[1,1].Font.Size:=8;
      List.Cells[1,1].HorizontalAlignment:=xlLeft;
      List.Cells[1,1] := GetOrgName(Main.Main_Id,Main.Inst)+'; '+DateToStr(Date)+'; '+TimeToStr(Time);

//    Заголовок
      List.Cells[4,3] := GetOrgName(OrgId,OrgInst);
      List.Cells[6,2] := DateTimeToStr(From_date2.Date);
      List.Cells[6,4] := DateTimeToStr(To_date2.Date);

      PuTOilQueryToExcelEnh(XLApp,List,qMain as TDataSet,9,progr,100,'orgname;date_;id;npt_name;from_dog\i;to_dog;tonn\s;shtuki\s;comm');
      Progr.Progress := 100;
      XLApp.Visible:=TRUE;
    Except
       showmessage(TranslateText('В процессе построения отчета произошла ошибка'));
    End;
  finally
    Progr.Free;
    qMain.Free;
  end;
End;

end.
