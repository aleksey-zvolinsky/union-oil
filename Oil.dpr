program oil;

{%ToDo 'Oil.todo'}

{$I define}

uses
  Forms,
  SysUtils,
  Dialogs,
  Windows,
  dbtables,
  RxVerInf,
  Classes,
  IniFiles,
  Base in 'Base.pas' {BaseForm},
  OilStd in 'OilStd.pas',
  NPTypeRef in 'NPTypeRef.pas' {NPTypeRefForm},
  OperTypeRef in 'OperTypeRef.pas' {OperTypeRefForm},
  Prih in 'Prih.pas' {PrihForm},
  PartRef in 'PartRef.pas' {PartRefForm},
  Part in 'Part.pas' {PartForm},
  AutoRef in 'AutoRef.pas' {AutoRefForm},
  EmpRef in 'EmpRef.pas' {EmpRefForm},
  Emp in 'Emp.pas' {EmpForm},
  Auto in 'Auto.pas' {AutoForm},
  BankRef in 'BankRef.pas' {BankRefForm},
  PrihRef in 'PrihRef.pas' {PrihRefForm},
  Rash in 'Rash.pas' {RashForm},
  SelDEp in 'SelDEp.pas' {SelDEPForm},
  RashRef in 'RashRef.pas' {RashRefForm},
  Progr in 'progr.pas' {ProgrForm},
  SRep in 'SRep.pas' {SRepForm},
  AddOrgRef in 'AddOrgRef.pas' {AddOrgForm},
  SRepRef in 'SRepRef.pas' {SRepRefForm},
  OilVar in 'OilVar.pas' {OilVarForm},
  Admin in 'Admin.pas' {AdminForm},
  Passw in 'Passw.pas' {PasswForm},
  AutoCalc in 'AutoCalc.pas' {ACForm},
  RashPP in 'RashPP.pas' {RashPPForm},
  RashOut in 'RashOut.pas' {RashOutForm},
  Udbplan in 'Udbplan.pas' {Dbplan: TDataModule},
  MoneyRef in 'MoneyRef.pas' {MoneyRefForm},
  Money in 'Money.pas' {MoneyForm},
  OperType in 'OperType.pas' {OperTypeForm},
  SVedom in 'SVedom.pas' {VedForm},
  Dog in 'Dog.pas' {DogForm},
  DogRef in 'DogRef.pas' {DogRefForm},
  TalonPrihData in 'TalonPrihData.pas' {TalonPrihForm},
  TalonOutData in 'TalonOutData.pas' {TalonOutForm},
  TalonPrih in 'TalonPrih.pas' {TalonPrihRefForm},
  TalonOut in 'TalonOut.pas' {TalonOutRefForm},
  Bank in 'Bank.pas' {BankForm},
  SQL in 'SQL.pas' {SQLForm},
  AZSRet in 'AZSRet.pas' {AZSRetForm},
  SlBookRef in 'SlBookRef.pas' {SlBookRefForm},
  TalonPotrReport in 'TalonPotrReport.pas' {TalonPotrReportForm},
  BookSell in 'BookSell.pas' {BookSellForm},
  RashRR in 'RashRR.pas' {RashRRForm},
  ViewDoc in 'ViewDoc.pas' {ViewDocForm},
  Main in 'Main.pas' {MainForm},
  Rep_KomNB in 'Rep_KomNB.pas',
  Rep_MoveKomT in 'Rep_MoveKomT.pas',
  ReportManager in 'ReportManager.pas' {RepManagerForm},
  ServiceRef in 'ServiceRef.pas' {ServiceRefForm},
  Service in 'Service.pas' {ServiceForm},
  Rep_UdWeig in 'Rep_UdWeig.pas',
  PartRezLeftRep in 'PartRezLeftRep.pas',
  RashVedom in 'RashVedom.pas',
  uTalonPriceReport in 'uTalonPriceReport.pas' {TalonPriceReport},
  Rep_s in 'Rep_s.pas',
  CreateAZSBook in 'CreateAZSBook.pas' {CreateAZSBookForm},
  ExFunc in 'ExFunc.pas',
  RashReport in 'RashReport.pas' {RashReportForm},
  SvodAzsPodpartReport in 'SvodAzsPodpartReport.pas' {SvodAzsPodpartReportForm},
  ListSelect in 'ListSelect.pas' {ListSelectForm},
  UDbFunc in 'UDbFunc.pas' {DbFunc: TDataModule},
  ChooseOrg in 'ChooseOrg.pas' {ChooseOrgForm},
  PExchWarning in 'PExchWarning.pas' {ExchWarning},
  CloseDate in 'CloseDate.pas' {CloseDateForm},
  TestDB in 'TestDB.pas' {TestDBForm},
  UWaitDebForm in 'UWaitDebForm.pas' {FWaitDebForm},
  MovementReport in 'MovementReport.pas' {MovementReportForm},
  AddTax in 'AddTax.pas' {dmAddTax: TDataModule},
  ExportIn1C in 'ExportIn1C.pas' {ExportIn1CForm},
  Topic in 'Topic.pas' {TopicForm},
  AddFizface in 'AddFizface.pas' {AddFizfaceForm},
  AddPipe in 'AddPipe.pas' {AddPipeForm},
  InvRep in 'InvRep.pas' {InvRepForm},
  PipeRef in 'PipeRef.pas' {PipeRefForm},
  PipeRests in 'PipeRests.pas' {PipeRestsForm},
  PipeRestsRef in 'PipeRestsRef.pas' {PipeRestsRefForm},
  RezType in 'RezType.pas' {RezTypeForm},
  RezRests in 'RezRests.pas' {RezRestsForm},
  RezRestsRef in 'RezRestsRef.pas' {RezRestsRefForm},
  RezKalibr in 'RezKalibr.pas' {RezKalForm},
  ubMonth in 'ubMonth.pas' {ubMonthForm},
  SRTalon in 'SRTalon.pas' {SRTalonForm},
  TransferReport in 'TransferReport.pas',
  RulezReport in 'RulezReport.pas' {RulezReportForm},
  E_Bill in 'E_Bill.pas' {E_BillForm},
  E_BillRef in 'E_BillRef.pas' {E_BillRefForm},
  E_Options in 'E_Options.pas' {E_OptionsForm},
  E_Var in 'E_Var.pas',
  MoneyFunc in 'MoneyFunc.pas',
  Rep_Debit in 'Rep_Debit.pas',
  CardRNPrint in 'CardRNPrint.pas' {CardRNPrintForm},
  PrihCardRef in 'PrihCardRef.pas' {PrihCardRefForm},
  OS1C in 'OS1C.pas' {OS1CForm},
  RezervRef in 'RezervRef.pas' {RezervRefForm},
  Rezerv in 'Rezerv.pas' {RezervForm},
  Anketa in 'Anketa.pas' {AnketaForm},
  WayBillsRef in 'WayBillsRef.pas' {WayBillsRefForm},
  AutoIncome in 'AutoIncome.pas' {AutoIncomeForm},
  AutoIncomeRef in 'AutoIncomeRef.pas' {AutoIncomeRefForm},
  AutoReports in 'AutoReports.pas' {AutoReportsForm},
  WayBill in 'WayBill.pas' {WayBillForm},
  TransSubPart in 'TransSubPart.pas' {TransSubPartForm},
  GetFromGrid in 'GetFromGrid.pas' {GetFromGridForm},
  ExcelFunc in 'ExcelFunc.pas',
  E_CurRate in 'E_CurRate.pas' {E_CurRateForm},
  E_CurRateRef in 'E_CurRateRef.pas' {E_CurRateRefForm},
  E_Import in 'E_Import.pas' {E_ImportForm},
  E_Plan in 'E_Plan.pas' {E_PlanForm},
  E_PlanRef in 'E_PlanRef.pas' {E_PlanRefForm},
  UReportClass in 'UReportClass.pas',
  RulezReportColumn in 'RulezReportColumn.pas' {RulezReportColumnForm},
  URepElClass in 'URepElClass.pas',
  TextFunc in 'TextFunc.pas',
  Rep_RegionRest in 'rep_regionrest.pas',
  PrihCard in 'PrihCard.pas' {PrihCardForm},
  AutoCardRef in 'AutoCardRef.pas' {AutoCardRefForm},
  AutoCard in 'AutoCard.pas' {AutoCardForm},
  Rep_OutAZS in 'Rep_OutAZS.pas',
  AzsFaultRef in 'AzsFaultRef.pas' {AzsFaultRefForm},
  AzsFault in 'AzsFault.pas' {AzsFaultForm},
  OvExpRef in 'OvExpRef.pas' {OvExpRefForm},
  OvExpTypeRef in 'OvExpTypeRef.pas' {OvExpTypeRefForm},
  OvExp in 'OvExp.pas' {OvExpForm},
  OS in 'OS.pas' {frmOS},
  SOther in 'SOther.pas' {SOtherForm},
  SrFiltr in 'SrFiltr.pas' {SrFiltrForm},
  ExchCardClient in 'ExchCardClient.pas' {ExchCardClientForm},
  Excel_TLB in 'Excel_TLB.pas',
  VBIDE_TLB in 'VBIDE_TLB.pas',
  CardAlienRest in 'CardAlienRest.pas' {CardAlienRestForm},
  CardRNAlienPrint in 'CardRNAlienPrint.pas' {CardRNAlienPrintForm},
  OraBaseDialog in 'OraBaseDialog.pas' {OraBaseDialogForm},
  KonkPrice in 'KonkPrice.pas' {KonkPriceForm},
  KonkPriceReport in 'KonkPriceReport.pas' {KonkPriceReportDM: TDataModule},
  uMessageDlgExt in 'uMessageDlgExt.pas',
  KpFaultRef in 'KpFaultRef.pas' {KpFaultRefForm},
  KpFault in 'KpFault.pas' {KpFaultForm},
  CardDocEnh in 'CardDocEnh.pas' {frmCardDocEnh},
  TaxBillPrint in 'TaxBillPrint.pas' {dmTaxBill: TDataModule},
  CompCfg in 'CompCfg.pas' {FCompCfg},
  CompCfgAdd in 'CompCfgAdd.pas' {FCompCfgAdd},
  CompIFace in 'CompIFace.pas' {FCompIFace},
  CompIFaceAdd in 'CompIFaceAdd.pas' {FCompIFaceAdd},
  CompInfoAdd in 'CompInfoAdd.pas' {FCompInfoAdd},
  CompInfo in 'CompInfo.pas' {FCompInfo},
  CompOs in 'CompOs.pas' {FCompOs},
  CompOsAdd in 'CompOsAdd.pas' {FCompOsAdd},
  CompOutDevice in 'CompOutDevice.pas' {FCompOutDevice},
  CompOutDeviceAdd in 'CompOutDeviceAdd.pas' {FCompOutDeviceAdd},
  CompProg in 'CompProg.pas' {FCompProg},
  CompProgAdd in 'CompProgAdd.pas' {FCompProgAdd},
  CompUser in 'CompUser.pas' {FCompUser},
  CompUserAdd in 'CompUserAdd.pas' {FCompUserAdd},
  frmTalonsTotalUnit in 'frmTalonsTotalUnit.pas' {frmTalonsTotal},
  uCheckups in 'uCheckups.pas',
  LogSaleDeadbeat in 'LogSaleDeadbeat.pas' {LogSaleDeadbeatForm},
  uStart in 'uStart.pas' {frmStart: TDataModule},
  uTestLaunch in 'uTestLaunch.pas' {frmTestLaunch},
  MoneyOut in 'MoneyOut.pas' {frmMoneyOut},
  Discount in 'Discount.pas' {frmDiscount},
  InvoicePrint in 'InvoicePrint.pas' {dmInvoicePrint: TDataModule},
  ThirdPartyTranz in 'ThirdPartyTranz.pas' {frmThirdPartyTranz},
  DiscountType in 'DiscountType.pas' {frmDiscountType},
  AzsDevice in 'AzsDevice.pas' {AzsDeviceForm},
  AzsDeviceAdd in 'AzsDeviceAdd.pas' {AzsDeviceAddForm},
  DiscountAdd in 'DiscountAdd.pas' {frmDiscountAdd},
  MoneyOutAdd in 'MoneyOutAdd.pas' {frmMoneyOutAdd},
  RashNakPrint in 'RashNakPrint.pas' {dmRashNakPrint: TDataModule},
  ThirdPartyPrint in 'ThirdPartyPrint.pas' {frmThirdPartyPrint},
  HandTransact in 'HandTransact.pas' {frmHandTrans},
  Import1CDeb in 'Import1CDeb.pas' {Import1CDebForm},
  MoveInstTrans in 'MoveInstTrans.pas' {frmMoveInstTrans},
  SelNNNum in 'SelNNNum.pas' {fSelNNNum},
  AutomaticReports in 'AutomaticReports.pas',
  TaxBillPrintForm in 'TaxBillPrintForm.pas' {frmTaxBillPrintForm},
  PacketClass in 'PacketClass.pas',
  OneSImport in 'OneSImport.pas' {OneSImportForm},
  uExeSql in 'uExeSql.pas',
  SetNum in 'SetNum.pas' {SetNumForm},
  PrihSop in 'PrihSop.pas' {PrihSopForm},
  RashSop in 'RashSop.pas' {RashSopForm},
  uCrypt in 'uCrypt.pas',
  WagonsCrash in 'WagonsCrash.pas' {WagonsCrashForm},
  SynchroPart in 'SynchroPart.pas' {SynchroPartForm},
  RezervNpType in 'RezervNpType.pas' {RezervNpTypeForm},
  uGridFunc in 'uGridFunc.pas',
  SlBook in 'SlBook.pas' {SlBookForm},
  TaxBillEditDet in 'TaxBillEditDet.pas' {TaxBillEditDetForm},
  uRichEditFormat in 'URichEditFormat.pas',
  RezervArenda in 'RezervArenda.pas' {RezervArendaForm},
  uXMLForm in 'uXMLForm.pas',
  PolisData in 'PolisData.pas' {PolisDataForm},
  PolisRange in 'PolisRange.pas' {PolisRangeForm},
  AddOrgDop in 'AddOrgDop.pas' {AddOrgDopForm},
  TalonOpenCode in 'TalonOpenCode.pas' {TalonOpenCodeForm},
  uSplashForm in 'uSplashForm.pas' {SplashForm},
  RyMenus in 'RyMenus.pas',
  uDocTranzAlienOrg in 'uDocTranzAlienOrg.pas',
  uLoadBankCard in 'uLoadBankCard.pas' {LoadBankCardForm},
  TaxBillCause in 'TaxBillCause.pas' {TaxBillCauseForm},
  PrihCardView in 'PrihCardView.pas' {PrihCardViewForm},
  UDbStructure in 'UDbStructure.pas',
  UDbSaver in 'UDbSaver.pas',
  uCommonForm in 'uCommonForm.pas' {CommonForm},
  uLanguageForm in 'uLanguageForm.pas' {LanguageForm},
  AddOrgUkr in 'AddOrgUkr.pas' {AddOrgUkrForm},
  E_Object in 'E_Object.pas' {E_ObjectForm},
  E_Permit in 'E_Permit.pas' {E_PermitForm},
  Synchro in 'Synchro.pas' {SynchroForm},
  EditBase in 'EditBase.pas' {EditBaseForm},
  PrihTrans in 'PrihTrans.pas' {PrihTransForm},
  uMD5Hash in 'uMD5Hash.pas',
  gtd in 'gtd.pas' {GtdForm},
  RailStat in 'RailStat.pas' {RailStatForm},
  MTEdit in 'MTEdit.pas' {MTEditForm},
  Raskred in 'Raskred.pas' {RaskredForm},
  ZavodRash in 'ZavodRash.pas' {ZavodRashForm},
  CheckList in 'CheckList.pas' {CheckListForm},
  AutoShip in 'AutoShip.pas' {AutoShipForm},
  RashPvl in 'RashPvl.pas' {RashPvlForm},
  CardCorrDog in 'CardCorrDog.pas' {CardCorrDogForm},
  uBill in 'uBill.pas' {BillForm},
  PrintCardPinCode in 'PrintCardPinCode.pas' {PrintCardPinCodeForm},
  uCardBlank in 'uCardBlank.pas' {CardBlankForm},
  uCardRequest in 'uCardRequest.pas' {CardRequestForm},
  Memo in 'Memo.pas' {MemoForm},
  uTestMenu in 'AutoTest\uTestMenu.pas',
  uOilTest in 'AutoTest\uOilTest.pas' {frmOilTest},
  uTestClass in 'AutoTest\uTestClass.pas',
  ParseExcelTest in 'AutoTest\ParseExcelTest.pas' {ParseExcelTestForm},
  uCarting in 'uCarting.pas' {CartingForm},
  Rep_GKSU in 'Rep_GKSU.pas',
  uOrgChangeDetails in 'uOrgChangeDetails.pas' {OrgChangeDetails},
  Rep_SvodFilAZS in 'Rep_SvodFilAZS.pas',
  uFilter in 'uFilter.pas' {FilterForm},
  uPrihImport in 'uPrihImport.pas' {PrihImportForm},
  uAviasRests in 'uAviasRests.pas' {AviasRestsForm},
  wcrypt2 in 'Wcrypt2.pas',
  SRepAutoLoad in 'SRepAutoLoad.pas' {SRepAutoLoadF},
  RezervImage in 'RezervImage.pas' {RezervImageForm},
  ImportCashtan in 'ImportCashtan.pas' {ImportCashtanForm},
  uImportFunc in 'uImportFunc.pas' {dmImportFunc: TDataModule},
  ListDefine in 'ListDefine.pas' {ListDefineForm},
  RefPrint in 'RefPrint.pas' {RefPrintForm},
  NpTypeEdit in 'NpTypeEdit.pas' {NpTypeEditForm},
  NpPriceEdit in 'NpPriceEdit.pas' {NpPriceEditForm},
  NpPriceRef in 'NpPriceRef.pas' {NpPriceRefForm},
  RezervRefNew in 'RezervRefNew.pas' {RezervRefNewForm},
  RezMeasureEdit in 'RezMeasureEdit.pas' {RezMeasureEditForm},
  RezMeasureRef in 'RezMeasureRef.pas' {RezMeasureRefForm},
  basedocsref in 'BaseDocsRef.pas' {BaseDocsRefForm},
  BaseMeteringRef in 'BaseMeteringRef.pas' {BaseMeteringRefForm},
  Tubes in 'tubes.pas' {TubesForm},
  BaseTovarOperRef in 'basetovaroperref.pas' {BaseTovarOperRefForm},
  RezervImageSvod in 'RezervImageSvod.pas' {RezervImageSvodForm},
  PrihChart in 'PrihChart.pas' {PrihChartForm},
  RashChart in 'RashChart.pas' {RashChartForm},
  TubeAct in 'TubeAct.pas' {TubeActForm},
  BaseRepDeficit in 'BaseRepDeficit.pas' {BaseRepDeficitForm},
  BaseRepDensity in 'BaseRepDensity.pas' {BaseRepDensityForm},
  RezRashBase in 'RezRashBase.pas' {RezRashBaseForm},
  RezPrihBase in 'RezPrihBase.pas' {RezPrihBaseForm},
  BaseOil in 'BaseOil.pas' {BaseOilForm},
  BaseKoefUdWeightRef in 'BaseKoefUdWeightRef.pas' {BaseKoefUdWeightRefForm},
  BaseEditKoefUdWeightRef in 'BaseEditKoefUdWeightRef.pas' {BaseEditKoefUdWeightRefForm},
  BaseKolebRef in 'BaseKolebRef.pas' {BaseKolebRefForm},
  BaseMeteringAutoRef in 'BaseMeteringAutoRef.pas' {BaseMeteringAutoRefForm},
  ThreadRefreshQuery in 'ThreadRefreshQuery.pas',
  BaseAutoZamerRef in 'BaseAutoZamerRef.pas' {BaseAutoZamerRefForm},
  uApplicationInfo in 'uApplicationInfo.pas',
  NpPriceDocRef in 'NpPriceDocRef.pas' {NpPriceDocRefForm},
  NpPriceDocEdit in 'NpPriceDocEdit.pas' {NpPriceDocEditForm},
  BaseRepPoteriRez in 'BaseRepPoteriRez.pas' {BaseRepPoteriRezForm};

{$R *.RES}

var
  Semaphore: THandle;
  s: string;
  i, n: integer;
  IsPw: Boolean;
  LCS_Ver, Etalon_LCS_Ver: string;
  UpdateSourceDir: string;
  LOGIN,Password: string;
  Ini: TIniFile;
begin
  Application.Initialize;
  Application.OnException := MainForm.ExceptionHandler;

  PrepareTranslateText; // готовимся к украинизации сбщений

  startlog('');

  SplashForm := nil;
  SplashForm := TSplashForm.Create(Application);
  SplashForm.Show;

  startlog('запуск OIL');

  s := ReadPieceOfRegistry(HKEY_CURRENT_USER, '\Software\OIL\Main\', 'miOneOilInstance_Checked');
  if (AnsiUpperCase(s) = 'TRUE') or (s = '') then
  begin
    Semaphore := CreateSemaphore(nil, 0, 1, 'OIL.exe');
    if ((Semaphore <> 0) and (GetLastError = ERROR_ALREADY_EXISTS)) then
    begin
      CloseHandle(Semaphore);
      ShowMessage('Программа OIL уже запущена.');
      startlog('  программа OIL уже запущена.', true);
      Application.Terminate;
      Exit;
    end;
  end;
  startlog('  проверка на двойной запуск пройдена');

  StartLog('Проверка формата даты. Текущий формат ' + ShortDateFormat + ', разделитель даты ' + DateSeparator);
  if LowerCase(ShortDateFormat) <> 'dd.mm.yyyy' then
  begin
    ShortDateFormat := 'dd.mm.yyyy';
    StartLog('Формат даты изменен на ' + ShortDateFormat);
  end;
  if DateSeparator <> '.' then
  begin
    DateSeparator := '.';
    StartLog('Разделитель даты изменен на ' + DateSeparator);
  end;

  //************ ЧТЕНИЕ СИСТЕМНЫХ ПАРАМЕТРОВ *****************
  SYS_PARAMS := TStringList.Create;
  for i := 1 to System.ParamCount do
  begin
    // каждый параметр преобразуется в большой регистр
    // если параметр имеет вид abc=def, то преобразуется только левая часть, то есть
    // будет сохранен результат ABC=def
    s := System.ParamStr(i);
    n := pos('=', s);
    if n = 0 then
      n := length(s) + 1;
    s := ANSIUpperCase(copy(s, 1, n - 1)) + copy(s, n, length(s));
    if StrIsNumber(s) then
      s := 'ORG=' + s;
    SYS_PARAMS.Add(s);
  end;
  startlog('  считано ' + IntToStr(SYS_PARAMS.Count) + ' параметров запуска');

  Main.AUTO_SAVE_DIRECTORY := SysParamValue('REPORT_DIR');
  Main.LOGIN_STRING := SysParamValue('LOGIN');
  Main.INTERACTIVE_LAUNCH_MODE := not SysParamExists('AUTO_MODE');
  if not Main.INTERACTIVE_LAUNCH_MODE then
    startlog('  работа в не-интерактивном режиме');
  Main.MD := 0;
  
  if SysParamExists('RUN_OIL_LOAD') then
    Main.MD := 3;

  if Debugging and MAIN.INTERACTIVE_LAUNCH_MODE then
    SplashForm.lblMode.Visible := True;
    
  if Debugging then
  begin
    Main.MD := 2;
    startlog('  запуск в режиме отладки');
  end;

  if SysParamExists('AUTO_LOGIN') then
  begin
    Main.MD := 3;
    Main.Debugging := true;
    Main.INTERACTIVE_LAUNCH_MODE := false;
    Ini := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\login.ini');
    LOGIN := Ini.ReadString('INFO', 'LOGIN', '');
    Password := Ini.ReadString('INFO', 'PASSWORD', '');
    // або читаємо login.ini і з нього беремо логін і пароль, або беремо counter
    if (LOGIN <> '') and (Password <> '') then
      Main.LOGIN_STRING := LOGIN + '/'+Password
    else
      Main.LOGIN_STRING := 'counter/counter';
  end;

  // запускаємо ойл в архівному режимі і вмикаємо автозагрузку змінних звітів
  if SysParamExists('RUN_OIL_AUTOLOAD_SREP') then
  begin
    Main.MD := 4;
    Main.Debugging := true;
    Main.INTERACTIVE_LAUNCH_MODE := false;
    Main.LOGIN_STRING := 'admin/dbinternalview';
    startlog('  запуск в архивном режиме для загрузки сменных отчетов');
    startlog('    RUN_OIL_AUTOLOAD_SREP='+ SysParamValue('RUN_OIL_AUTOLOAD_SREP'));
  end;

  // запускаємо ойл в архівному режимі і вмикаємо автозагрузку змінних звітів
  if SysParamExists('RUN_OIL_EXPORT') then
  begin
    Main.MD := 5;
    Main.Debugging := true;
    Main.INTERACTIVE_LAUNCH_MODE := false;
    Main.LOGIN_STRING := 'admin/dbinternalview';
    startlog('  запуск в архивном режиме для экспорта в 1С');
    startlog('    RUN_OIL_EXPORT, INI='+SysParamValue('INI'));
  end;

  // запускаємо ойл в архівному режимі і вмикаємо автозагрузку змінних звітів
  if SysParamExists('RUN_REPORT') then
  begin
    Main.MD := 6;
    Main.Debugging := true;
    Main.INTERACTIVE_LAUNCH_MODE := false;
    Main.LOGIN_STRING := 'admin/dbinternalview';
    startlog('  запуск в архивном режиме для построения отчета БЭФ');
  end;


  Application.CreateForm(TfrmStart, frmStart);
  try
    ConnectOraSession;
    startlog('  сессия ODAC запущена');
    SplashForm.ShowPictures;
  except on E: Exception do
    begin
      MessageDlg('Ошибка подключения к БД.' + #13#10 +
        'Продолжение работы не возможно' + #13#10 + E.Message, mtError, [mbOk], 0);
      startlog('  не удалось подключиться к базе данных');
      Application.Terminate;
      Exit;
    end;
  end;
  Application.CreateForm(TDbFunc, DbFunc);

  VERSION := TVersionInfo.Create(Application.ExeName);
  startlog('  версия OIL: ' + VERSION.FileVersion);

  ApplicationInfo := TApplicationInfo.Create(frmStart.OraSession1);
  ApplicationInfo.Module := 'Oil '+ VERSION.FileVersion;
  ApplicationInfo.Action := 'Запуск';

  if TRANSLATE then
    MessageDlg('Ошибка в файлах ru_msg.ini и ua_msg.ini !'
      + #13#10 + 'Проверьте наличие папки ' + GetMainDir + 'Langauge'
      + #13#10 + '  и файлов ru_msg.ini и ua_msg.ini в ней.'
      + #13#10 + 'Для корректной работы обратитесь к программистам.', mtError, [mbOk], 0);

  try
    startlog('Считывание информации о структуре базы');
    ForceDirectories(GetMainDir+'cache\');
    DBS := TDbStructure.Create(frmStart.OraSession1, GetMainDir+'cache\');
    startlog('Информация о структуре базы успешно считана');
  except on E: Exception do
    begin
      MessageDlg('Не удалось считать информацию о структуре базы:' + #13#10 + E.Message, mtError, [mbOk], 0);
      startlog('Не удалось считать информацию о структуре базы');
      startlog(E.Message);
      Application.Terminate;
      Exit;
    end;
  end;
  DBSaver := TDbSaver.Create(frmStart.OraSession1, DBS);

  try
    startlog('   тестируються пакеты на валидность');
    DBFunc.CompilePackets;
    startlog('   пакеты на валидность протестированы');
  except on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOk], 0);
      startlog(E.Message, true);
      Application.Terminate;
      exit;
    end;
  end;

  try
    startlog('   обновляются материализированные представления');
    RefreshMatherializedViews;
    startlog('   материализированные представления обновлены');
  except on E: Exception do
    begin
      startlog('ошибка обновления материализированных обновлений' + #13#10 + E.Message, true);
    end;
  end;

  try
    LoadOilVar;
    if INST = 0 then
    begin
      MessageDlg('Не прочитались важные параметры с таблички OIL_VAR!', mtError, [mbOk], 0);
      raise Exception.Create('Не прочитались важные параметры с таблички OIL_VAR!');
    end;
    startlog('Процедура LoadOilVar пройдена успешно');
  except on E: Exception do
    begin
      startlog('Ошибка прохождения процедури LoadOilVar: ' + #13#10 + E.Message, true);
      exit;
    end;
  end;

  {проверить ARCHIVE_KEY}
  try
    if not Debugging then
    begin
      Debugging := IsBeforeArchiveBase; // если Оил запущен на архивной базе, отключить все проверки
      if Debugging then
      begin
        SplashForm.lblMode.Caption := 'Архивный режим';
        SplashForm.lblMode.Visible := True;
        Main.MD := 1;
        startlog('  запуск на архивной базе');
      end;
    end;
  except on E: Exception do
    begin
      MessageDlg('Проблемы с получением ARCHIVE_KEY.' + #13#10 +
        'Программа будет работать в обычном режиме' + #13#10 + E.Message, mtWarning, [mbOk], 0);
      Debugging := False;
    end;
  end;

  if not Debugging and IsEmitent(StrToInt(ReadOilVar('INST')), False) then
  begin
    try
      LCS_Ver := GetSQLValue('SELECT nvl(decoder(value,ov.getval(''inst'')),''null value'') from oil_var where name =''LINKCS_VER''');
      Etalon_LCS_Ver := GetSQLValue('SELECT nvl(ov.getval(''ETALON_LCS_VER''),''127.0.0.1'') from dual');
      if not RightVersion(LCS_Ver, Etalon_LCS_Ver) then
      begin
        MessageDlg(
          'Программа не может быть запущена.' + #13#10 +
          'Для работы необходим LinkComServer версии не ниже '+Etalon_LCS_Ver+ #13#10 + 'Teкущая версия: ' + LCS_Ver, mtError, [mbOk], 0);
        Application.Terminate;
        Exit;
      end;
    except on E: Exception do
      begin
        MessageDlg('Ошибка проверки версии LinkComServer' + #13#10 + 'Teкущее значение: ' + LCS_Ver + #13#10 +
          'Установите последнюю версию программы.', mtError, [mbOk], 0);
        StartLog('Исключение при получении номера версии LinkComServer:' + E.Message);
        Application.Terminate;
        Exit;
      end
    end;
  end;

    {проверить Last_run_date}
  try
    if not DBTimeIsCorrect(s) then
    begin
      ShowMessage(s);
      startlog('  ' + s, true);
      Application.Terminate;
      Exit;
    end;
  except on E: Exception do
    begin
      MessageDlg('Проблемы с получением Last_run_date.' + #13#10 +
        'Продолжение работы не возможно' + #13#10 + E.Message + #13#10 +
        'Формат даты в системе: ' + DateToStr(date) + #13#10 +
        'Дата последнего запуска: ' + ReadOilVar('Last_run_date'), mtError, [mbOk], 0);
      startlog('  проблемы с получением Last_run_date', true);
      Application.Terminate;
      Exit;
    end;
  end;

  if not OracleCompatibleValid then
  begin
    StartLog('Неверный параметр COMPATIBLE.');
    MessageDlg('Невозможно запустить программу c текущими настройками сервера.' + #13#10 +
      'Откройте файл init.ora, установите параметр COMPATIBLE = 8.1.0, перезапустите сервер' + #13#10 +
      'и снова запустите программу.', mtError, [mbOk], 0);
    Application.Terminate;
    Exit;
  end;

  try
    OracleNLSValid;
  except on e: exception do
    if pos('OracleNLSValid', e.Message) > 0 then
    begin
      StartLog('Не верные настройки Оракла в реестре!');
      MessageDlg(e.Message, mtError, [mbOk], 0);
      Application.Terminate;
      Exit;
    end;
  end;

  IsBeforeFil := (GetSqlValue('select user from dual') = 'OIL_OLD');
  if IsBeforeFil then
    startlog('  работа на доархивной базе');

  Main.CheckupStatus := TCheckupStatus.Create;
  {если не удалось обновить статус проверок закрываем приложение и ждем звонка}
  if not Main.CheckupStatus.Refresh then
  begin
    Application.Terminate;
    Exit;
  end;

  if not Main.INTERACTIVE_LAUNCH_MODE then
  begin
    n := pos('/', Main.LOGIN_STRING);
    SplashForm.edtUser.Text := copy(Main.LOGIN_STRING, 1, n - 1);
    SplashForm.edtPassw.Text := copy(Main.LOGIN_STRING, n + 1, 256);
    SplashForm.actNext.Execute;
  end;

  if (SplashForm.Tag = 0) or Main.INTERACTIVE_LAUNCH_MODE then
  begin
    SplashForm.Hide;
    SplashForm.Notebook.PageIndex := 1;
    SplashForm.ShowModal;
    SplashForm.Hide;
    SplashForm.Show;
  end;

  if SplashForm.Tag = 1 then
    begin
      Main.EMP_ID := SplashForm.EmpId;
      Main.REAL_EMP_ID := SplashForm.EmpId;
      Main.SUPER_REAL_EMP_ID := SplashForm.EmpId;
      startlog('  логин прошёл успешно');
      ApplicationInfo.ClientInfo := GetSqlValueParSimple('select u_name from adm_users where id = :id',[
        'id', SplashForm.EmpId]);
    end
  else
    begin
      startlog('  логин не прошёл', true);
      Application.Terminate;
      Exit;
    end;

  if not Debugging then
    if not FirstTest(IsPw) then
      begin
        startlog('  FirstTest не прошёл', true);
        Application.Terminate;
        Exit;
      end;
  DB_DIR := GetMainDir + 'DB';
  CreateDir(GetMainDir + 'Doc');
  Application.CreateForm(TDbplan, Dbplan);
  Application.CreateForm(TMainForm, MainForm);

  (** Копируем OilLoad *)
  if SysParamExists('RUN_OIL_LOAD') then
  begin
    startlog('  обновляем OilLoad');
    try
      UpdateSourceDir := nvl(getSqlValueParSimple('select value from adm_settings where name =''OL_SOURCE'' and inst=:inst ', ['inst', INST]), '');
      if trim(UpdateSourceDir) <> '' then
      begin
        if (FileExists(UpdateSourceDir + 'oilload.exe')) and
          (
          (not FileExists(getMainDir + 'oilload.exe')) or
          (FileCreateDate(UpdateSourceDir + 'oilload.exe') > FileCreateDate(getMainDir + 'oilload.exe'))
          ) then
        begin
          CopyFile(PChar(UpdateSourceDir + 'oilload.exe'), PChar(getMainDir + 'oilload.exe'), false);
          startlog('   обновление OilLoad прошло успешно');
        end
        else startlog('   обновление не необходимо или недоступно');
      end
      else startlog('   не определен путь к обновлению');
    except
      startlog('   обновление OilLoad не удалось');
    end;
  end;

  try
    DBSaver.SaveRecord('OIL_LL',
      ['STATE',    'Y',
       'MD',       Main.MD,
       'INST',     INST,
       'IS_PW',    BoolTo_(IsPw, 'Y', 'N'),
       'LST',      CheckupStatus.ErrBlock,
       'IS_SMART', GetVal(ReadOilVar('SMART_PASSW')),
       'VERSION',  VERSION.FileVersion,
       'PASSWORD', PASSWORD], true);
    startlog('  запуск OIL зафиксирован');
    MainForm.RegularFirstTest.Enabled := not IsPw;
  except on E: Exception do
    begin
      startlog('  не удалось зафиксировать запуск OIL');
      startlog('  ' + E.Message, true);
      MessageDlg('Не удалось зафиксировать запуск OIL' + #13#10 +
        'Смотрите файл start.log в корневой папке программы.', mtError, [mbOk], 0);
      Application.Terminate;
      Exit;
    end;
  end;
  ApplicationInfo.Action := '';
  Application.Run;

end.
