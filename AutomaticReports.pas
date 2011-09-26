unit AutomaticReports;

interface

uses uCommonForm,  Forms,SysUtils,uOilQuery,Ora, uOilStoredProc;

procedure MakeAutomaticBasicElectronForm(ADateFrom, ADateTo: TDateTime);
procedure MakeAutomaticReports(p_FileName: string);


implementation

uses
  RashReport,UReportClass,uTalonPriceReport,Main,TestDb,MovementReport,
  ReportManager,Rep_Debit,TalonPotrReport;

//==============================================================================
procedure AlertLog(p_ReportName,p_Error: string);
var F: TextFile;
begin
  AssignFile(F,'reports_errors.log');
  Append(F);
  writeln(F,MAIN_ORG.NAME);
  writeln(F,p_ReportName+': '+p_Error);
  writeln(F);
  CloseFile(F);
end;  
//==============================================================================
procedure MakeAutomaticBasicElectronForm(ADateFrom, ADateTo: TDateTime);
var
  RM: TRepManagerForm;
begin
  // Базоваю электронная форма
  try
    Application.CreateForm(TRepManagerForm,RM);
    try
      RM.ActivePage := 120;
      RM.DateType := dtBetweenDates;
      RM.Show;
      RM.DateFrom := ADateFrom;
      RM.DateTo := ADateTo;
      RM.bbPrint.Click;
    finally
      RM.Free;
    end;
  except
    on E: Exception do
      AlertLog(TranslateText('Базоваю электронная форма'),E.Message);
  end;
end;

//==============================================================================
procedure MakeAutomaticReports(p_FileName: string);
var
  F:TRashReportForm;
  FTP: TTalonPriceReport;
  FTD: TTestDbForm;
  TP: TTalonPotrReportForm;
  MF: TMovementReportForm;
  RM: TRepManagerForm;
  BeginDate,EndDate: TDateTime;
  var RR: TReport;



begin
    BeginDate:=StrToDate('01.01.2004');
    EndDate:=StrToDate('31.01.2004');

    // Остатки партий в резервуарах
    try
      RR:=TReport.Create;
      try
        RR.GetFromFile('НБ - Остатки партий'); // *NO_TRANSLATE*
        RR.Elements[RR.Elements.IndexOf('BEGINDATE')].Res.Add('RESULT='''+DateToStr(BeginDate)+'''');
        RR.Elements[RR.Elements.IndexOf('ORG1')].FillResFromMainOrg;
        RR.MakeReport;
      finally
        RR.Free;
      end;
    except
      on E: Exception do
        AlertLog(TranslateText('Остатки партий в резервуарах'),E.Message);
    end;

    // Остатки на АЗС
    try
      RR:=TReport.Create;
      try
        RR.GetFromFile('АЗС - Остатки'); // *NO_TRANSLATE*
        RR.Elements[RR.Elements.IndexOf('BEGINDATE')].Res.Add('RESULT='''+DateToStr(BeginDate)+'''');
        RR.Elements[RR.Elements.IndexOf('ORG1')].FillResFromMainOrg;
        RR.MakeReport;
      finally
        RR.Free;
      end;
    except
      on E: Exception do
        AlertLog(TranslateText('Остатки на АЗС'),E.Message);
    end;

    // Отпуск НБ+АЗС
    try
      Application.CreateForm(TRashReportForm,F);
      try
        F.DateEdit1.Date:=BeginDate;
        F.DateEdit2.Date:=EndDate;
        F.CMBSort.ItemIndex:=4;
        F.CBDate.Checked:=FALSE;
        F.CBOperation.Checked:=FALSE;
        F.CBSubPart.Checked:=FALSE;
        F.BitBtn1.Click;
      finally
        F.Free;
      end;
    except
      on E: Exception do
        AlertLog(TranslateText('Отпуск НБ+АЗС'),E.Message);
    end;

    // Наличие талонов в кассе
    try
      RR:=TReport.Create;
      try
        RR.GetFromFile('ТАЛ - Остатки в кассе'); // *NO_TRANSLATE*
        RR.Elements[RR.Elements.IndexOf('BEGINDATE')].Res.Add('RESULT='''+DateToStr(BeginDate)+'''');
        RR.Elements[RR.Elements.IndexOf('ORG1')].FillResFromMainOrg;
        RR.SetConfByType(2);
        RR.MakeReport;
      finally
        RR.Free;
      end;
    except
      on E: Exception do
        AlertLog(TranslateText('Наличие талонов в кассе'),E.Message);
    end;

    // О перемещении карточек
    try
      FTP := TTalonPriceReport.Create(Application);
      try
        FTP.ReportNumber := 4;
        FTP.deBeginDate.Date := BeginDate;
        FTP.deEndDate.Date := EndDate;
        FTP.MId := MAIN_ORG.ID;
        FTP.MInst := MAIN_ORG.INST;
        FTP.ceOrgName.Text := MAIN_ORG.NAME;
        FTP.BitBtn2.Click;
      finally
        FTP.Free;
      end;
    except
      on E: Exception do
        AlertLog(TranslateText('О перемещении карточек'),E.Message);
    end;

    // Проверки по талонам и карточкам
    try
      FTD := TTestDbForm.Create(Application);
      try
        FTD.PageControl1.ActivePage:=FTD.TabTalon;
        FTD.PageControl1Change(nil);
        FTD.bbPrintTalon.Click;
        {FTD.PageControl1.ActivePage:=FTD.TabCard;
        FTD.PageControl1Change(nil);
        FTD.bbPrintCard.Click;}
      finally
        FTD.Free;
      end;
    except
      on E: Exception do
        AlertLog(TranslateText('Проверки по талонам и карточкам'),E.Message);
    end;

    // Хранение Собственный НБ
    try
      RR:=TReport.Create;
      try
        RR.GetFromFile('ДВ - СобстХран'); // *NO_TRANSLATE*
        RR.Elements[RR.Elements.IndexOf('BEGINDATE')].Res.Add('RESULT='''+DateToStr(BeginDate)+'''');
        RR.Elements[RR.Elements.IndexOf('ENDDATE')].Res.Add('RESULT='''+DateToStr(EndDate)+'''');
        RR.Elements[RR.Elements.IndexOf('ORG1')].FillResFromMainOrg;
        RR.MakeReport;
      finally
        RR.Free;
      end;
    except
      on E: Exception do
        AlertLog(TranslateText('Хранение собственный НБ'),E.Message);
    end;

    // Собственный НБ+АЗС
    try
      MF:=TMovementReportForm.Create(Application);
      try
        MF.Tip:='Own';
        MF.DateEdit1.Date:=BeginDate;
        MF.DateEdit2.Date:=EndDate;
        MF.BitBtn1.Click;
      finally
        MF.Free;
      end;
    except
      on E: Exception do
        AlertLog(TranslateText('Собственный НБ+АЗС'),E.Message);
    end;

    // Ведомость дебеторов и кредиторов
    try
      Application.CreateForm(TRepManagerForm,RM);
      try
        RM.Pattern:='Oplata.xls';
        RM.Param_NB.activepage:='101';
        RM.Date_NB.ActivePage:='Date_2';
        RM.FormShow(nil);
        RM.From_Date2.Date:=BeginDate;
        RM.To_Date2.Date:=EndDate;
        RM.bbPrint.Click;
      finally
        RM.Free;
      end;
    except
      on E: Exception do
        AlertLog(TranslateText('Ведомость дебеторов и кредиторов'),E.Message);
    end;

    // Ведомость дебеторов и кредиторов по целевому типу "Талоны"
    try
      RM := TRepManagerForm.Create(Application);
      try
        RM.Pattern:='Oplata.xls';
        RM.Param_NB.activepage:='101';
        RM.Date_NB.ActivePage:='Date_2';
        RM.FormShow(nil);
        RM.From_Date2.Date:=BeginDate;
        RM.To_Date2.Date:=EndDate;
        RM.cb101_Commission.Checked:=FALSE;
        RM.cb101_Other.Checked:=FALSE;
        vdbt_Part:='8';
        RM.bbPrint.Click;
      finally
        RM.Free;
      end;
    except
      on E: Exception do
        AlertLog(TranslateText('Целевая талонная дебеторка'),E.Message);
    end;

    // Талоны - По потребителям - Движение
    try
      TP:=TTalonPotrReportForm.Create(Application);
      try
        TP.deBeginDate.Date:=BeginDate;
        TP.deEndDate.Date:=EndDate;
        TP.ReportNumber := 1;
        TP.rgTalonReportType.ItemIndex:=3;
        TP.rgTalonReportType.OnClick(nil);
        TP.BitBtn1.Click;
      finally
        TP.Free;
      end;
    except
      on E: Exception do
        AlertLog(TranslateText('Талоны по потребителям Движение'),E.Message);
    end;

    // Карты - По потребителям - Движение
    try
      TP:=TTalonPotrReportForm.Create(Application);
      try
        TP.deBeginDate.Date:=BeginDate;
        TP.deEndDate.Date:=EndDate;
        TP.ReportNumber := 2;
        TP.rgCardReportType.ItemIndex:=3;
        TP.rgCardReportType.OnClick(nil);
        TP.BitBtn1.Click;
      finally
        TP.Free;
      end;
    except
      on E: Exception do
        AlertLog(TranslateText('Карты по потребителям движение'),E.Message);
    end;


    // Дебеторка по талонам
    try
      FTP := TTalonPriceReport.Create(Application);
      try
        FTP.ReportNumber := 2;
        FTP.deBeginDate.Date := BeginDate;
        FTP.deEndDate.Date := EndDate;
        FTP.MId := MAIN_ORG.ID;
        FTP.MInst := MAIN_ORG.INST;
        FTP.ceOrgName.Text := MAIN_ORG.NAME;
        FTP.BitBtn2.Click;
      finally
        FTP.Free;
      end;
    except
      on E: Exception do
        AlertLog(TranslateText('Дебеторка по талонам'),E.Message);
    end;                             
end;
//==============================================================================
end.
