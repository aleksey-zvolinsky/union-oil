unit TalonPotrReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db,
  DBTables, Grids, DBGrids, StdCtrls, Buttons, ComObj, Mask, ToolEdit, Excel_TLB,
  CurrEdit, ExtCtrls, Excel8TLB, ActiveX, uCommonForm, uOilQuery, Ora,
  uOilStoredProc, MemDS, DBAccess{$IFDEF VER150},Variants{$ENDIF};

type
  TTalonPotrReportForm = class(TCommonForm)
    qTalonRest: TOilQuery;
    rgTalonType: TRadioGroup;
    rgTalonReportType: TRadioGroup;
    CEOrg: TComboEdit;
    Label1: TLabel;
    Panel1: TPanel;
    qTalonMove: TOilQuery;
    qTalonOut: TOilQuery;
    qTalonPrih: TOilQuery;
    bExit: TBitBtn;
    BitBtn1: TBitBtn;
    rgRefuelReportType: TRadioGroup;
    gbColumns: TGroupBox;
    cbDate: TCheckBox;
    gbSubTotal: TGroupBox;
    cbPrice: TCheckBox;
    cbSTNominal: TCheckBox;
    pAZS: TPanel;
    cbAZS: TCheckBox;
    cbPart: TCheckBox;
    cbSubPart: TCheckBox;
    pSTAZS: TPanel;
    cbSTAZS: TCheckBox;
    cbSTPart: TCheckBox;
    cbSTSubPart: TCheckBox;
    pBeginEndDate: TPanel;
    lEndDate: TLabel;
    lBeginDate: TLabel;
    deBeginDate: TDateEdit;
    deEndDate: TDateEdit;
    pCurDate: TPanel;
    Label3: TLabel;
    deCurDate: TDateEdit;
    cbCardNumber: TCheckBox;
    pClient: TPanel;
    lClient: TLabel;
    sbClearClient: TSpeedButton;
    ceClient: TComboEdit;
    pAutoDriver: TPanel;
    Label2: TLabel;
    sbClearAuto: TSpeedButton;
    ceAuto: TComboEdit;
    Label4: TLabel;
    sbClearDriver: TSpeedButton;
    ceDriver: TComboEdit;
    rgCardReportType: TRadioGroup;
    gbTypeRefuelCard: TGroupBox;
    cbOurClientOurAZS: TCheckBox;
    cbOurClientAlienAZS: TCheckBox;
    cbAlienClientOurAZS: TCheckBox;
    qAutoPrih: TOilQuery;
    cbSTCardNumber: TCheckBox;
    pTalon: TPanel;
    cbSer: TCheckBox;
    cbNominal: TCheckBox;
    cbNum: TCheckBox;
    qCardOut: TOilQuery;
    qCardRest: TOilQuery;
    qCardMove: TOilQuery;
    qCheckCardSR: TOilQuery;
    qAutoOut: TOilQuery;
    gbTypeRefuelAuto: TGroupBox;
    cbRTAVedomost: TCheckBox;
    cbRTACard: TCheckBox;
    cbRTATalon: TCheckBox;
    cbRTANB: TCheckBox;
    cbRTANal: TCheckBox;
    qCardPrih: TOilQuery;
    qAutoRest: TOilQuery;
    qAutoMove: TOilQuery;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bExitClick(Sender: TObject);
    procedure ceClientButtonClick(Sender: TObject);
    procedure sbClearClientClick(Sender: TObject);
    procedure rgTalonReportTypeClick(Sender: TObject);
    procedure CEOrgButtonClick(Sender: TObject);
    procedure rgRefuelReportTypeClick(Sender: TObject);
    procedure MakeReportPotrOut;
    procedure MakeReportPotrPrih;
    procedure MakeReportPotrRest;
    procedure MakeReportPotrMove;
    procedure MakeReportCardOut;
    procedure MakeReportCardPrih;
    procedure MakeReportCardRest;
    procedure MakeReportCardMove;
    procedure MakeReportAutoOut;
    procedure MakeReportAutoPrih;
    procedure MakeReportAutoRest;
    procedure MakeReportAutoMove;
    procedure FormShow(Sender: TObject);
    procedure cbAZSClick(Sender: TObject);
    procedure cbPartClick(Sender: TObject);
    procedure cbSerClick(Sender: TObject);
    procedure rgCardReportTypeClick(Sender: TObject);
    procedure cbSubPartClick(Sender: TObject);
    procedure cbNumClick(Sender: TObject);
    procedure ceAutoButtonClick(Sender: TObject);
    procedure ceDriverButtonClick(Sender: TObject);
    procedure sbClearDriverClick(Sender: TObject);
    procedure sbClearAutoClick(Sender: TObject);
    procedure cbCardNumberClick(Sender: TObject);
    procedure cbNominalClick(Sender: TObject);
    procedure deEndDateChange(Sender: TObject);
    procedure deBeginDateAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure deEndDateAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    ReportNumber: Integer;
  end;

var
  TalonPotrReportForm: TTalonPotrReportForm;

implementation

uses Main, Progr, ChooseOrg, UDbFunc, AutoRef, EmpRef, ExcelFunc, uExeSql, ExFunc,
  PrihCardRef;

var ClientId, ClientInst, OrgId, OrgInst, EmpId, EmpInst, AutoId, AutoInst: Integer;
  ClientName, OrgName: string;
const
  REPORTLOGFILE = 'reports.log';  

{$R *.DFM}

procedure TTalonPotrReportForm.FormCreate(Sender: TObject);
begin
  inherited;
  OrgId := Main.MAIN_ID;
  OrgInst := Main.INST;
  ClientId := 0;
  ClientInst := 0;
  CEOrg.Text := GetOrgName(OrgId, OrgInst);
  SetCurrentMonth(deBeginDate, deEndDate);
  deCurDate.Date := Date;
  LoadSQLByForm(TForm(Self));
end;

procedure TTalonPotrReportForm.BitBtn1Click(Sender: TObject);
var
  start: TDateTime;
begin
  DefineRepDates(0, deEndDate.Date);
  ApplicationInfo.Action := Self.Caption;
  log(REPORTLOGFILE,'*************************************************');
  log(REPORTLOGFILE,'* '+Self.Caption);
  case ReportNumber of
    1: log(REPORTLOGFILE,'* ' + rgTalonReportType.Items[rgTalonReportType.ItemIndex]);
    2: log(REPORTLOGFILE,'* ' + rgCardReportType.Items[rgCardReportType.ItemIndex]);
    3: log(REPORTLOGFILE,'* ' + rgRefuelReportType.Items[rgRefuelReportType.ItemIndex]);
  end;
  log(REPORTLOGFILE,TranslateText('* Начат ')+DateToStr(Date)+' '+TimeToStr(Time));
  log(REPORTLOGFILE,'*-----------------------------------------------*');
  start:=Time;  
  try
    case ReportNumber of
      1: case rgTalonReportType.ItemIndex of
          0: MakeReportPotrOut;
          1: MakeReportPotrPrih;
          2: MakeReportPotrRest;
          3: MakeReportPotrMove;
        end;
      2:
        begin
          fRecalc; //Якщо картки - пропонуємо перерахунок.
          case rgCardReportType.ItemIndex of
            0: MakeReportCardOut;
            1: MakeReportCardPrih;
            2: MakeReportCardRest;
            3: MakeReportCardMove;
          end;
        end; //2:begin
      3: case rgRefuelReportType.ItemIndex of
          0: MakeReportAutoOut;
          1: MakeReportAutoPrih;
          2: MakeReportAutoRest;
          3: MakeReportAutoMove;
        end;
    end; //Case
    log(REPORTLOGFILE,TranslateText('* Отчет построился за ')+IntToStr(trunc((Time-start)*24*3600))+TranslateText(' сек.')
      +' В '+DateToStr(Date)+' '+TimeToStr(Time));
    log(REPORTLOGFILE,'*************************************************');
    log(REPORTLOGFILE,'');
  finally
    ApplicationInfo.Action := '';
  end;
end;

procedure TTalonPotrReportForm.MakeReportPotrOut;
var
  ExcelPos, CurPos, CurNum, OldNum: Integer;
  Progr: TProgrForm;
  Range: Variant;
begin
  try
    //Создание линии прокрутки
    Application.CreateForm(TProgrForm, Progr);
    Progr.Progress := 0;
    Progr.Show;
    Progr.Repaint;
    //Выполнение запроса по выборке данных для отчета
    qTalonOut.Close;
    qTalonOut.ParamByName('PrintNominal').Value := cbNominal.Checked;
    qTalonOut.ParamByName('PrintSer').Value := cbSer.Checked;
    qTalonOut.ParamByName('PrintNum').Value := cbNum.Checked;
    qTalonOut.ParamByName('PrintDate').Value := cbDate.Checked;
    qTalonOut.ParamByName('PrintPrice').Value := cbPrice.Checked;
    qTalonOut.ParamByName('OrgId').AsInteger := ClientId;
    qTalonOut.ParamByName('OrgInst').AsInteger := ClientInst;
    qTalonOut.ParamByName('DepId').AsInteger := OrgId;
    qTalonOut.ParamByName('DepInst').AsInteger := OrgInst;
    qTalonOut.ParamByName('BeginDate').AsDate := deBeginDate.Date;
    qTalonOut.ParamByName('EndDate').AsDate := deEndDate.Date;
    _OpenQuery(qTalonOut);
    //Инициализация области памяти Range
    Range := VarArrayCreate([1, 2000, 1, qTalonOut.FieldCount], varVariant);
    Progr.Progress := 40;
    //Создание екземпляра Excel
    if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
      MSExcel := GetActiveOleObject('Excel.Application')
    else MSExcel := CreateOleObject('Excel.Application');

    MSExcel.Workbooks.Add(GetMainDir + 'pattern\TalonPotrOut.xlt');
    List := MSExcel.ActiveWorkbook.ActiveSheet;
    //Вывод шапки отчета
    List.Cells[2, 'B'] := MainForm.qOrg.FieldbyName('Name').AsString + ' ' + DateTimeToStr(GetSystemDate);
    List.Cells[6, 'D'] := TranslateText('по ') + CEOrg.Text;
    List.Cells[7, 'E'] := deBeginDate.Text + ' - ' + deEndDate.Text;

    Progr.Progress := 50;
    //Загрузка данных в область памяти Range
    ExcelPos := 10;
    CurPos := 1;
    while not qTalonOut.Eof do
    begin
      Range[CurPos, 1] := qTalonOut.FieldByName('Dep_Name').AsVariant;
      Range[CurPos, 2] := qTalonOut.FieldByName('Org_Name').AsVariant;
      Range[CurPos, 3] := qTalonOut.FieldByName('Org_OKPO').AsVariant;
      Range[CurPos, 4] := qTalonOut.FieldByName('NPGrp_Name').AsVariant;
      Range[CurPos, 5] := qTalonOut.FieldByName('Nominal').AsVariant;
      Range[CurPos, 6] := qTalonOut.FieldByName('Ser').AsVariant;
      Range[CurPos, 7] := qTalonOut.FieldByName('Num').AsVariant;
      Range[CurPos, 8] := qTalonOut.FieldByName('Out_Date').AsVariant;
      Range[CurPos, 9] := qTalonOut.FieldByName('Oper_name').AsVariant;
      Range[CurPos, 10] := qTalonOut.FieldByName('Price').AsVariant;
      Range[CurPos, 11] := qTalonOut.FieldByName('Quantity').AsVariant;
      Range[CurPos, 12] := qTalonOut.FieldByName('Litr').AsVariant;
      Range[CurPos, 13] := qTalonOut.FieldByName('Amount').AsVariant;
      OldNum := qTalonOut.FieldByName('Num').AsInteger;
      CurNum := qTalonOut.FieldByName('Num').AsInteger;
      qTalonOut.Next;
      while (rgTalonType.ItemIndex = 1)
        and (rgTalonType.Visible)
        and (Range[CurPos, 1] = qTalonOut.FieldByName('Dep_Name').AsVariant)
        and (Range[CurPos, 2] = qTalonOut.FieldByName('Org_Name').AsVariant)
        and (Range[CurPos, 3] = qTalonOut.FieldByName('Org_OKPO').AsVariant)
        and (Range[CurPos, 6] = qTalonOut.FieldByName('Ser').AsVariant)
        and ((Range[CurPos, 8] = qTalonOut.FieldByName('Out_Date').AsVariant) or (not cbDate.Checked))
        and ((Range[CurPos, 10] = qTalonOut.FieldByName('Price').AsVariant) or (not cbPrice.Checked))
        and (CurNum + 1 = qTalonOut.FieldByName('Num').AsInteger)
        and (not qTalonOut.Eof) do
      begin
        Range[CurPos, 11] := Range[CurPos, 11] + qTalonOut.FieldByName('Quantity').AsVariant;
        Range[CurPos, 12] := Range[CurPos, 12] + qTalonOut.FieldByName('Litr').AsVariant;
        Range[CurPos, 13] := Range[CurPos, 13] + qTalonOut.FieldByName('Amount').AsVariant;
        CurNum := qTalonOut.FieldByName('Num').AsInteger;
        Range[CurPos, 7] := IntToStr(OldNum) + '-' + IntToStr(CurNum);
        qTalonOut.Next;
      end;
      //Выгрузка данных в Excel, если число записей в области данных превышает 2000 строк
      if (CurPos >= 2000) or (qTalonOut.Eof) then
      begin
        List.Range['A' + IntToStr(ExcelPos + 1) + ':M' + IntToStr(ExcelPos + CurPos)].Value := Range;
        ExcelPos := ExcelPos + CurPos;
        CurPos := 0;
      end;
      CurPos := CurPos + 1;
    end;

    List.Columns['E'].Hidden := not (cbNominal.Checked);
    List.Columns['F'].Hidden := not (cbSer.Checked);
    List.Columns['G'].Hidden := not (cbNum.Checked);
    List.Columns['H'].Hidden := not (cbDate.Checked);
    List.Columns['J'].Hidden := not (cbPrice.Checked);

    Progr.Progress := 70;
    //Вставка итогов
    if not qTalonOut.IsEmpty then
      MSExcel.Run('CreateSubTotal', cbSTNominal.Checked);

    Progr.Progress := 100;
    Progr.Free;
    MSExcel.Visible := True;
    MSExcel.ScreenUpdating := True;
  except on E: Exception do
    begin
      Progr.Free;
      if not VarIsEmpty(MsExcel) then
      begin
        MSExcel.Visible := True;
        MSExcel.ScreenUpdating := True;
      end;
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TTalonPotrReportForm.MakeReportPotrPrih;
var
  ExcelPos, CurPos: Integer;
  Progr: TProgrForm;
  Range: Variant;
begin
  try
    //Создание линии прокрутки
    Application.CreateForm(TProgrForm, Progr);
    Progr.Progress := 0;
    Progr.Show;
    Progr.Repaint;
    //Выполнение запроса по выборке данных для отчета
    qTalonPrih.Close;
    qTalonPrih.ParamByName('PrintPart').Value := cbPart.Checked;
    qTalonPrih.ParamByName('PrintSubPart').Value := cbSubPart.Checked;
    qTalonPrih.ParamByName('PrintAZS').Value := cbAZS.Checked;
    qTalonPrih.ParamByName('PrintNominal').Value := cbNominal.Checked;
    qTalonPrih.ParamByName('PrintDate').Value := cbDate.Checked;
    qTalonPrih.ParamByName('PrintSer').Value := cbSer.Checked;
    qTalonPrih.ParamByName('PrintNum').Value := cbNum.Checked;
    qTalonPrih.ParamByName('PrintPrice').Value := cbPrice.Checked;
    qTalonPrih.ParamByName('OrgId').AsInteger := ClientId;
    qTalonPrih.ParamByName('OrgInst').AsInteger := ClientInst;
    qTalonPrih.ParamByName('DepId').AsInteger := OrgId;
    qTalonPrih.ParamByName('DepInst').AsInteger := OrgInst;
    qTalonPrih.ParamByName('BeginDate').AsDate := deBeginDate.Date;
    qTalonPrih.ParamByName('EndDate').AsDate := deEndDate.Date;
    _OpenQuery(qTalonPrih);
    //Инициализация области памяти Range
    Range := VarArrayCreate([1, 2000, 1, qTalonPrih.FieldCount], varVariant);

    Progr.Progress := 40;
    //Создание екземпляра Excel
    if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
      MSExcel := GetActiveOleObject('Excel.Application')
    else
      MSExcel := CreateOleObject('Excel.Application');
    MSExcel.Workbooks.Add(GetMainDir + 'pattern\TalonPotrPrih.xlt');
    List := MSExcel.ActiveWorkbook.ActiveSheet;
    //Вывод шапки отчета
    List.Cells[2, 'B'] := MainForm.qOrg.FieldbyName('Name').AsString + ' ' + DateTimeToStr(GetSystemDate);
    List.Cells[6, 'D'] := TranslateText('по ') + CEOrg.Text;
    List.Cells[7, 'E'] := deBeginDate.Text + ' - ' + deEndDate.Text;

    Progr.Progress := 50;
    //Загрузка данных в область памяти Range
    ExcelPos := 10;
    CurPos := 1;
    while not qTalonPrih.Eof do
    begin
      Range[CurPos, 1] := qTalonPrih.FieldByName('Dep_Name').AsVariant;
      Range[CurPos, 2] := qTalonPrih.FieldByName('Org_Name').AsVariant;
      Range[CurPos, 3] := qTalonPrih.FieldByName('Org_OKPO').AsVariant;
      Range[CurPos, 4] := qTalonPrih.FieldByName('NPGrp_Name').AsVariant;
      Range[CurPos, 5] := qTalonPrih.FieldByName('Part').AsVariant;
      Range[CurPos, 6] := qTalonPrih.FieldByName('Sub_Part').AsVariant;
      Range[CurPos, 7] := qTalonPrih.FieldByName('AZS_Name').AsVariant;
      Range[CurPos, 8] := qTalonPrih.FieldByName('Smena_Num').AsVariant;
      Range[CurPos, 9] := qTalonPrih.FieldByName('Nominal').AsVariant;
      Range[CurPos, 10] := qTalonPrih.FieldByName('Ser').AsVariant;
      Range[CurPos, 11] := qTalonPrih.FieldByName('Num').AsVariant;
      Range[CurPos, 12] := qTalonPrih.FieldByName('Out_Date').AsVariant;
      Range[CurPos, 13] := qTalonPrih.FieldByName('Prih_Date').AsVariant;
      Range[CurPos, 14] := qTalonPrih.FieldByName('Price').AsVariant;
      Range[CurPos, 15] := qTalonPrih.FieldByName('Quantity').AsVariant;
      Range[CurPos, 16] := qTalonPrih.FieldByName('Litr').AsVariant;
      Range[CurPos, 17] := qTalonPrih.FieldByName('Count_T').AsVariant;
      if qTalonPrih.FieldByName('Price').IsNull then
        Range[CurPos, 18] := TranslateText('Цена не определена')
      else
        Range[CurPos, 18] := qTalonPrih.FieldByName('Amount').AsFloat;
      qTalonPrih.Next;
      //Выгрузка данных в Excel, если число записей в области данных превышает 2000 строк
      if (CurPos >= 2000) or (qTalonPrih.Eof) then
      begin
        List.Range['A' + IntToStr(ExcelPos + 1) + ':R' + IntToStr(ExcelPos + CurPos)].Value := Range;
        ExcelPos := ExcelPos + CurPos;
        CurPos := 0;
      end;
      CurPos := CurPos + 1;
    end;

    Progr.Progress := 60;

    List.Columns['E:F'].Hidden := not (cbPart.Checked);
    List.Columns['G:H'].Hidden := not (cbAZS.Checked);
    List.Columns['I'].Hidden := not (cbNominal.Checked);
    List.Columns['J'].Hidden := not (cbSer.Checked);
    List.Columns['K'].Hidden := not (cbNum.Checked);
    List.Columns['L:M'].Hidden := not (cbDate.Checked);
    List.Columns['N'].Hidden := not (cbPrice.Checked);

    Progr.Progress := 90;
    //Вставка итогов
    if not qTalonPrih.IsEmpty then
      MSExcel.Run('CreateSubTotal', cbSTPart.Checked, cbSTSubPart.Checked, cbSTAZS.Checked, cbSTNominal.Checked);

    Progr.Progress := 100;
    Progr.Free;
    MSExcel.Visible := True;
    MSExcel.ScreenUpdating := True;
  except on E: Exception do
    begin
      Progr.Free;
      if not VarIsEmpty(MsExcel) then
      begin
        MSExcel.Visible := True;
        MSExcel.ScreenUpdating := True;
      end;
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TTalonPotrReportForm.MakeReportPotrRest;
var
  ExcelPos, CurPos: Integer;
  Progr: TProgrForm;
  Range: Variant;
begin
  try
    //Создание линии прокрутки
    Application.CreateForm(TProgrForm, Progr);
    Progr.Progress := 0;
    Progr.Show;
    Progr.Repaint;
    //Выполнение запроса по выборке данных для отчета
    qTalonRest.Close;
    qTalonRest.ParamByName('PrintDate').Value := cbDate.Checked;
    qTalonRest.ParamByName('PrintNominal').Value := cbNominal.Checked;
    qTalonRest.ParamByName('PrintSer').Value := cbSer.Checked;
    qTalonRest.ParamByName('PrintNum').Value := cbNum.Checked;
    qTalonRest.ParamByName('PrintPrice').Value := cbPrice.Checked;
    qTalonRest.ParamByName('OrgId').AsInteger := ClientId;
    qTalonRest.ParamByName('OrgInst').AsInteger := ClientInst;
    qTalonRest.ParamByName('DepId').AsInteger := OrgId;
    qTalonRest.ParamByName('DepInst').AsInteger := OrgInst;
    qTalonRest.ParamByName('EndDate').AsDate := deCurDate.Date;
    _OpenQuery(qTalonRest);
    //Инициализация области памяти Range
    Range := VarArrayCreate([1, 2000, 1, qTalonRest.FieldCount], varVariant);

    Progr.Progress := 40;
    //Создание екземпляра Excel
    if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
      MSExcel := GetActiveOleObject('Excel.Application')
    else MSExcel := CreateOleObject('Excel.Application');
    MSExcel.Workbooks.Add(GetMainDir + 'pattern\TalonPotrRest.xlt');
    List := MSExcel.ActiveWorkbook.ActiveSheet;
    //Вывод шапки отчета
    List.Cells[2, 'B'] := MainForm.qOrg.FieldbyName('Name').AsString + ' ' + DateTimeToStr(GetSystemDate);
    List.Cells[6, 'D'] := TranslateText('по ') + CEOrg.Text;
    List.Cells[7, 'E'] := TranslateText(' на ') + deCurDate.Text;

    Progr.Progress := 50;
    //Загрузка данных в область памяти Range
    ExcelPos := 10;
    CurPos := 1;
    while not qTalonRest.Eof do
    begin
      Range[CurPos, 1] := qTalonRest.FieldByName('Dep_Name').AsVariant;
      Range[CurPos, 2] := qTalonRest.FieldByName('Org_Name').AsVariant;
      Range[CurPos, 3] := qTalonRest.FieldByName('Org_OKPO').AsVariant;
      Range[CurPos, 4] := qTalonRest.FieldByName('NPGrp_Name').AsVariant;
      Range[CurPos, 5] := qTalonRest.FieldByName('Nominal').AsVariant;
      Range[CurPos, 6] := qTalonRest.FieldByName('Ser').AsVariant;
      Range[CurPos, 7] := qTalonRest.FieldByName('Num').AsVariant;
      Range[CurPos, 8] := qTalonRest.FieldByName('Out_Date').AsVariant;
      Range[CurPos, 9] := qTalonRest.FieldByName('Price').AsVariant;
      Range[CurPos, 10] := qTalonRest.FieldByName('Quantity').AsVariant;
      Range[CurPos, 11] := qTalonRest.FieldByName('Litr').AsVariant;
      Range[CurPos, 12] := qTalonRest.FieldByName('Amount').AsVariant;
      qTalonRest.Next;
      //Выгрузка данных в Excel, если число записей в области данных превышает 2000 строк
      if (CurPos >= 2000) or (qTalonRest.Eof) then
      begin
        List.Range['A' + IntToStr(ExcelPos + 1) + ':L' + IntToStr(ExcelPos + CurPos)].Value := Range;
        ExcelPos := ExcelPos + CurPos;
        CurPos := 0;
      end;
      CurPos := CurPos + 1;
    end;

    Progr.Progress := 60;

    List.Columns['E'].Hidden := not (cbNominal.Checked);
    List.Columns['F'].Hidden := not (cbSer.Checked);
    List.Columns['G'].Hidden := not (cbNum.Checked);
    List.Columns['H'].Hidden := not (cbDate.Checked);
    List.Columns['I'].Hidden := not (cbPrice.Checked);

    Progr.Progress := 90;
    //Вставка итогов
    if not qTalonRest.IsEmpty then
      MSExcel.Run('CreateSubTotal', cbSTNominal.Checked);

    Progr.Progress := 100;
    Progr.Free;
    MSExcel.Visible := True;
    MSExcel.ScreenUpdating := True;
  except on E: Exception do
    begin
      Progr.Free;
      if not VarIsEmpty(MsExcel) then
      begin
        MSExcel.Visible := True;
        MSExcel.ScreenUpdating := True;
      end;
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TTalonPotrReportForm.MakeReportPotrMove;
var
  CurPos: Integer;
  Progr: TProgrForm;
  Range: Variant;
begin
  try
    //Создание линии прокрутки
    Application.CreateForm(TProgrForm, Progr);
    Progr.Progress := 0;
    Progr.Show;
    Progr.Repaint;
    //Выполнение запроса по выборке данных для отчета
    qTalonMove.Close;
    qTalonMove.ParamByName('PrintNominal').Value := cbNominal.Checked;
    qTalonMove.ParamByName('DepId').AsInteger := OrgId;
    qTalonMove.ParamByName('DepInst').AsInteger := OrgInst;
    qTalonMove.ParamByName('OrgId').AsInteger := ClientId;
    qTalonMove.ParamByName('OrgInst').AsInteger := ClientInst;
    qTalonMove.ParamByName('BeginDate').AsDate := deBeginDate.Date;
    qTalonMove.ParamByName('EndDate').AsDate := deEndDate.Date;
    _OpenQuery(qTalonMove);
    //Инициализация области памяти Range
    Range := VarArrayCreate([1, qTalonMove.RecordCount, 1, qTalonMove.FieldCount], varVariant);

    Progr.Progress := 40;
    //Загрузка данных в область памяти Range
    CurPos := 1;
    while not qTalonMove.Eof do
    begin
      Range[CurPos, 1] := qTalonMove.FieldByName('Dep_Name').AsVariant;
      Range[CurPos, 2] := qTalonMove.FieldByName('Org_Name').AsVariant;
      Range[CurPos, 3] := qTalonMove.FieldByName('Org_OKPO').AsVariant;
      Range[CurPos, 4] := qTalonMove.FieldByName('NP_Name').AsVariant;
      Range[CurPos, 5] := qTalonMove.FieldByName('Nominal').AsVariant;
      Range[CurPos, 6] := qTalonMove.FieldByName('Begin_Amount').AsVariant;
      Range[CurPos, 7] := qTalonMove.FieldByName('Begin_Litr').AsVariant;
      Range[CurPos, 8] := qTalonMove.FieldByName('Begin_Money').AsVariant;
      Range[CurPos, 9] := qTalonMove.FieldByName('Out_Amount').AsVariant;
      Range[CurPos, 10] := qTalonMove.FieldByName('Out_Litr').AsVariant;
      Range[CurPos, 11] := qTalonMove.FieldByName('Out_Money').AsVariant;
      Range[CurPos, 12] := qTalonMove.FieldByName('Prih_Amount').AsVariant;
      Range[CurPos, 13] := qTalonMove.FieldByName('Prih_Litr').AsVariant;
      Range[CurPos, 14] := qTalonMove.FieldByName('Prih_Money').AsVariant;
      Range[CurPos, 15] := qTalonMove.FieldByName('End_Amount').AsVariant;
      Range[CurPos, 16] := qTalonMove.FieldByName('End_Litr').AsVariant;
      Range[CurPos, 17] := qTalonMove.FieldByName('End_Money').AsVariant;
      qTalonMove.Next;
      CurPos := CurPos + 1;
    end;

    Progr.Progress := 50;
    //Создание екземпляра Excel
    if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
      MSExcel := GetActiveOleObject('Excel.Application')
    else MSExcel := CreateOleObject('Excel.Application');
    MSExcel.Workbooks.Add(GetMainDir + 'pattern\TalonPotrMove.xlt');
    List := MSExcel.ActiveWorkbook.ActiveSheet;
    //Вывод шапки отчета
    List.Cells[2, 'B'] := MainForm.qOrg.FieldbyName('Name').AsString + ' ' + DateTimeToStr(GetSystemDate);
    List.Cells[6, 'D'] := TranslateText('по ') + CEOrg.Text;
    List.Cells[7, 'F'] := deBeginDate.Text + ' - ' + deEndDate.Text;

    Progr.Progress := 60;

    List.Range['A11:Q' + IntToStr(qTalonMove.RecordCount + 10)].Value := Range;
    List.Columns['E'].Hidden := not (cbNominal.Checked);

    Progr.Progress := 90;
    //Вставка итогов
    if not qTalonMove.IsEmpty then
      MSExcel.Run('CreateSubTotal');

    Progr.Progress := 100;
    Progr.Free;
    SaveReport(MSExcel, 'ТалонПотрДв'); // *NO_TRANSLATE*
    MSExcel.Visible := True;
    MSExcel.ScreenUpdating := True;
  except on E: Exception do
    begin
      Progr.Free;
      if not VarIsEmpty(MsExcel) then
      begin
        MSExcel.Visible := True;
        MSExcel.ScreenUpdating := True;
      end;
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TTalonPotrReportForm.bExitClick(Sender: TObject);
begin
  Close;
end;

procedure TTalonPotrReportForm.ceClientButtonClick(Sender: TObject);
begin
  if CaptureOrg(3, Main.MAIN_ID, Main.INST, 'yyy', ClientId, ClientInst, ClientName) then
    ceClient.Text := ClientName;
end;

procedure TTalonPotrReportForm.sbClearClientClick(Sender: TObject);
begin
  CEClient.Text := '';
  ClientId := 0;
  ClientInst := 0;
  ClientName := '';
end;

procedure TTalonPotrReportForm.CEOrgButtonClick(Sender: TObject);
var
  vId, vInst, vType: Integer;
  vName: string;
begin
  if CaptureOrgT(1, Main.MAIN_ID, Main.INST, 'yyy', vId, vInst, vName, vType) then
  begin
    if vType in [3, 4, 8] then
    begin
      OrgId := vId;
      OrgInst := vInst;
      OrgName := vName;
      CEOrg.Text := OrgName;
    end
    else ShowMessage(TranslateText('Недопустимый тип организации !'));
  end;
end;

procedure TTalonPotrReportForm.MakeReportCardOut;
var
  ExcelPos, CurPos: Integer;
  Progr: TProgrForm;
  Range: Variant;
begin
  try
    //Создание линии прокрутки
    Application.CreateForm(TProgrForm, Progr);
    Progr.Progress := 0;
    Progr.Show;
    Progr.Repaint;
    //Выполнение запроса по выборке данных для отчета
    qCardOut.Close;
    qCardOut.ParamByName('PrintCardNumber').Value := cbCardNumber.Checked;
    qCardOut.ParamByName('PrintDate').Value := cbDate.Checked;
    qCardOut.ParamByName('PrintPrice').Value := cbPrice.Checked;
    qCardOut.ParamByName('OrgId').AsInteger := ClientId;
    qCardOut.ParamByName('OrgInst').AsInteger := ClientInst;
    qCardOut.ParamByName('DepId').AsInteger := OrgId;
    qCardOut.ParamByName('DepInst').AsInteger := OrgInst;
    qCardOut.ParamByName('BeginDate').AsDate := deBeginDate.Date;
    qCardOut.ParamByName('EndDate').AsDate := deEndDate.Date;
    _OpenQuery(qCardOut);
    //Инициализация области памяти Range
    Range := VarArrayCreate([1, 2000, 1, qCardOut.FieldCount], varVariant);

    Progr.Progress := 40;
    //Создание екземпляра Excel
    if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
      MSExcel := GetActiveOleObject('Excel.Application')
    else MSExcel := CreateOleObject('Excel.Application');

    MSExcel.Workbooks.Add(GetMainDir + 'pattern\CardClientRec.xlt');
    List := MSExcel.ActiveWorkbook.ActiveSheet;
    //Вывод шапки отчета
    List.Cells[2, 'B'] := MainForm.qOrg.FieldbyName('Name').AsString + ' ' + DateTimeToStr(GetSystemDate);
    List.Cells[6, 'C'] := TranslateText('по ') + CEOrg.Text;
    List.Cells[7, 'C'] := '   ' + deBeginDate.Text + ' - ' + deEndDate.Text;

    Progr.Progress := 50;
    //Загрузка данных в область памяти Range
    ExcelPos := 10;
    CurPos := 1;
    while not qCardOut.Eof do
    begin
      Range[CurPos, 1] := qCardOut.FieldByName('Emitent_Name').AsVariant;
      Range[CurPos, 2] := qCardOut.FieldByName('Client_Name').AsVariant;
      Range[CurPos, 3] := qCardOut.FieldByName('Client_OKPO').AsVariant;
      Range[CurPos, 4] := qCardOut.FieldByName('NP_Name').AsVariant;
      Range[CurPos, 5] := qCardOut.FieldByName('Card_Number').AsVariant;
      Range[CurPos, 6] := qCardOut.FieldByName('Rec_Date').AsVariant;
      Range[CurPos, 7] := qCardOut.FieldByName('Price').AsVariant;
      Range[CurPos, 8] := qCardOut.FieldByName('Litr').AsVariant;
      Range[CurPos, 9] := qCardOut.FieldByName('Weight').AsVariant;
      Range[CurPos, 10] := qCardOut.FieldByName('Amount').AsVariant;
      qCardOut.Next;
      //Выгрузка данных в Excel, если число записей в области данных превышает 2000 строк
      if (CurPos >= 2000) or (qCardOut.Eof) then
      begin
        List.Range['A' + IntToStr(ExcelPos + 1) + ':'+ ExcelNumberToColumn(qCardOut.FieldCount) + IntToStr(ExcelPos + CurPos)].Value := Range;
        ExcelPos := ExcelPos + CurPos;
        CurPos := 0;
      end;
      CurPos := CurPos + 1;
    end;

    Progr.Progress := 60;

    List.Columns['E'].Hidden := not (cbCardNumber.Checked);
    List.Columns['F'].Hidden := not (cbDate.Checked);
    List.Columns['G'].Hidden := not (cbPrice.Checked);

    Progr.Progress := 90;
    //Вставка итогов
    if not qCardOut.IsEmpty then
      MSExcel.Run('CreateSubTotal', cbSTCardNumber.Checked);
    Progr.Progress := 100;
    Progr.Free;
    MSExcel.Visible := True;
    MSExcel.ScreenUpdating := True;
  except on E: Exception do
    begin
      Progr.Free;
      if not VarIsEmpty(MsExcel) then
      begin
        MSExcel.Visible := True;
        MSExcel.ScreenUpdating := True;
      end;
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TTalonPotrReportForm.MakeReportCardPrih;
var
  ExcelPos, CurPos: Integer;
  Progr: TProgrForm;
  Range: Variant;
begin
  try
    DefineRepDates(deBeginDate.Date, deEndDate.Date);
    //Создание линии прокрутки
    Application.CreateForm(TProgrForm, Progr);
    Progr.Progress := 0;
    Progr.Show;
    Progr.Repaint;
    if (cbOurClientOurAZS.Checked) or (cbAlienClientOurAZS.Checked) then
    begin
      qCheckCardSR.Close;
      qCheckCardSR.ParamByName('BeginDate').AsDate := deBeginDate.Date;
      qCheckCardSR.ParamByName('EndDate').AsDate := deEndDate.Date;
      _OpenQuery(qCheckCardSR);
      if not qCheckCardSR.IsEmpty then
      begin
        Progr.Hide;
        if MessageDlg(qCheckCardSR.FieldByName('Title').AsString + TranslateText(', отчет будет сформирован неверно (для получения более полной информации откройте форму Проверки/Эл. карточки). Создать отчет ?'), mtWarning, [mbYes, mbNo], 0) = mrNo then
          Abort;
        Progr.Show;
      end;
    end;
    //Выполнение запроса по выборке данных для отчета
    qCardPrih.Close;
    qCardPrih.ParamByName('PrintOurClientOurAZS').Value := cbOurClientOurAZS.Checked;
    qCardPrih.ParamByName('PrintOurClientAlienAZS').Value := cbOurClientAlienAZS.Checked;
    qCardPrih.ParamByName('PrintAlienClientOurAZS').Value := cbAlienClientOurAZS.Checked;
    qCardPrih.ParamByName('PrintPart').Value := cbPart.Checked;
    qCardPrih.ParamByName('PrintSubPart').Value := cbSubPart.Checked;
    qCardPrih.ParamByName('PrintAZS').Value := cbAZS.Checked;
    qCardPrih.ParamByName('PrintCardNumber').Value := cbCardNumber.Checked;
    qCardPrih.ParamByName('PrintDate').Value := cbDate.Checked;
    qCardPrih.ParamByName('PrintPrice').Value := cbPrice.Checked;
    qCardPrih.ParamByName('OrgId').AsInteger := ClientId;
    qCardPrih.ParamByName('OrgInst').AsInteger := ClientInst;
    qCardPrih.ParamByName('DepId').AsInteger := OrgId;
    qCardPrih.ParamByName('DepInst').AsInteger := OrgInst;
    qCardPrih.ParamByName('BeginDate').AsDate := deBeginDate.Date;
    qCardPrih.ParamByName('EndDate').AsDate := deEndDate.Date;
    _OpenQuery(qCardPrih);
    //Инициализация области памяти Range
    Range := VarArrayCreate([1, 2000, 1, qCardPrih.FieldCount], varVariant);

    Progr.Progress := 40;
    //Создание екземпляра Excel
    if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
      MSExcel := GetActiveOleObject('Excel.Application')
    else
      MSExcel := CreateOleObject('Excel.Application');
    MSExcel.Workbooks.Add(GetMainDir + 'pattern\CardClientExp.xlt');
    List := MSExcel.ActiveWorkbook.ActiveSheet;
    //Вывод шапки отчета
    List.Cells[2, 'B'] := MainForm.qOrg.FieldbyName('Name').AsString + ' ' + DateTimeToStr(GetSystemDate);
    List.Cells[6, 'C'] := TranslateText('   по ') + CEOrg.Text;
    List.Cells[7, 'C'] := '         ' + deBeginDate.Text + ' - ' + deEndDate.Text;

    Progr.Progress := 50;
    //Загрузка данных в область памяти Range
    ExcelPos := 10;
    CurPos := 1;
    while not qCardPrih.Eof do
    begin
      Range[CurPos, 1] := qCardPrih.FieldByName('Emitent_Name').AsVariant;
      Range[CurPos, 2] := qCardPrih.FieldByName('Client_Name').AsVariant;
      Range[CurPos, 3] := qCardPrih.FieldByName('Client_OKPO').AsVariant;
      Range[CurPos, 4] := qCardPrih.FieldByName('NP_Name').AsVariant;
      Range[CurPos, 5] := qCardPrih.FieldByName('Part').AsVariant;
      Range[CurPos, 6] := qCardPrih.FieldByName('Sub_Part').AsVariant;
      Range[CurPos, 7] := qCardPrih.FieldByName('Filial_Name').AsVariant;
      Range[CurPos, 8] := qCardPrih.FieldByName('AZS_Name').AsVariant;
      Range[CurPos, 9] := qCardPrih.FieldByName('Rep_Date').AsVariant;
      Range[CurPos, 10] := qCardPrih.FieldByName('Smena_Num').AsVariant;
      Range[CurPos, 11] := qCardPrih.FieldByName('Exp_Date').AsVariant;
      Range[CurPos, 12] := qCardPrih.FieldByName('Card_Number').AsVariant;
      Range[CurPos, 13] := qCardPrih.FieldByName('Rec_Date').AsVariant;
      Range[CurPos, 14] := qCardPrih.FieldByName('Price').AsVariant;
      Range[CurPos, 15] := qCardPrih.FieldByName('Litr').AsVariant;
      Range[CurPos, 16] := qCardPrih.FieldByName('Weight').AsVariant;
      Range[CurPos, 17] := qCardPrih.FieldByName('Amount').AsVariant;
      qCardPrih.Next;
      //Выгрузка данных в Excel, если число записей в области данных превышает 2000 строк
      if (CurPos >= 2000) or (qCardPrih.Eof) then
      begin
        List.Range['A' + IntToStr(ExcelPos + 1) + ':Q' + IntToStr(ExcelPos + CurPos)].Value := Range;
        ExcelPos := ExcelPos + CurPos;
        CurPos := 0;
      end;
      CurPos := CurPos + 1;
    end;

    Progr.Progress := 60;

    List.Columns['E'].Hidden := not (cbPart.Checked);
    List.Columns['F'].Hidden := not (cbSubPart.Checked);
    List.Columns['G:H'].Hidden := not (cbAZS.Checked);
    List.Columns['I'].Hidden := not (cbDate.Checked);
    List.Columns['J'].Hidden := not (cbAZS.Checked);
    List.Columns['K'].Hidden := not (cbDate.Checked);
    List.Columns['L'].Hidden := not (cbCardNumber.Checked);
    List.Columns['M'].Hidden := not (cbDate.Checked);
    List.Columns['N'].Hidden := not (cbPrice.Checked);

    Progr.Progress := 90;
    //Вставка итогов
    if not qCardPrih.IsEmpty then
      MSExcel.Run('CreateSubTotal', cbSTPart.Checked, (cbSTSubPart.Checked) and (not cbOurClientAlienAZS.Checked), cbSTAZS.Checked, cbSTCardNumber.Checked);

    Progr.Progress := 100;
    Progr.Free;
    MSExcel.Visible := True;
    MSExcel.ScreenUpdating := True;
  except on E: Exception do
    begin
      Progr.Free;
      if not VarIsEmpty(MsExcel) then
      begin
        MSExcel.Visible := True;
        MSExcel.ScreenUpdating := True;
      end;
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TTalonPotrReportForm.MakeReportCardRest;
var
  ExcelPos, CurPos: Integer;
  Progr: TProgrForm;
  Range: Variant;
begin
  try
    //Создание линии прокрутки
    Application.CreateForm(TProgrForm, Progr);
    Progr.Progress := 0;
    Progr.Show;
    Progr.Repaint;
    //Выполнение запроса по выборке данных для отчета
    qCardRest.Close;
    qCardRest.ParamByName('PrintCardNumber').AsInteger := BoolTo_(cbCardNumber.Checked, 1, 0);
    qCardRest.ParamByName('PrintDate').AsInteger := BoolTo_(cbDate.Checked, 1, 0);
    qCardRest.ParamByName('PrintPrice').AsInteger := BoolTo_(cbPrice.Checked, 1, 0);
    qCardRest.ParamByName('OrgId').AsInteger := ClientId;
    qCardRest.ParamByName('OrgInst').AsInteger := ClientInst;
    qCardRest.ParamByName('DepId').AsInteger := OrgId;
    qCardRest.ParamByName('DepInst').AsInteger := OrgInst;
    qCardRest.ParamByName('CurDate').AsDate := deCurDate.Date;
    _OpenQuery(qCardRest);
    //Инициализация области памяти Range
    Range := VarArrayCreate([1, 2000, 1, qCardRest.FieldCount - 2], varVariant);

    Progr.Progress := 40;
    //Создание екземпляра Excel
    if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
      MSExcel := GetActiveOleObject('Excel.Application')
    else MSExcel := CreateOleObject('Excel.Application');
    MSExcel.Workbooks.Add(GetMainDir + 'pattern\CardClientRest.xlt');
    List := MSExcel.ActiveWorkbook.ActiveSheet;

    //Вывод шапки отчета
    List.Cells[2, 'A'] := MainForm.qOrg.FieldbyName('Name').AsString + ' ' + DateTimeToStr(GetSystemDate);
    List.Cells[6, 'C'] := TranslateText('по ') + CEOrg.Text;
    List.Cells[7, 'C'] := TranslateText('    на ') + deCurDate.Text;

    Progr.Progress := 50;
    //Загрузка данных в область памяти Range
    ExcelPos := 10;
    CurPos := 1;
    while not qCardRest.Eof do
    begin
      Range[CurPos, 1] := qCardRest.FieldByName('Emitent_Name').AsVariant;
      Range[CurPos, 2] := qCardRest.FieldByName('Client_Name').AsVariant;
      Range[CurPos, 3] := qCardRest.FieldByName('Client_OKPO').AsVariant;
      Range[CurPos, 4] := qCardRest.FieldByName('NP_Name').AsVariant;
      Range[CurPos, 5] := qCardRest.FieldByName('Card_Number').AsVariant;
      Range[CurPos, 6] := qCardRest.FieldByName('Rec_Date').AsVariant;
      Range[CurPos, 7] := qCardRest.FieldByName('Price').AsVariant;
      Range[CurPos, 8] := qCardRest.FieldByName('Litr').AsVariant;
      Range[CurPos, 9] := qCardRest.FieldByName('Amount').AsVariant;
      qCardRest.Next;

      //Выгрузка данных в Excel, если число записей в области данных превышает 2000 строк
      if (CurPos >= 2000) or (qCardRest.Eof) then
      begin
        List.Range['A' + IntToStr(ExcelPos + 1) + ':I' + IntToStr(ExcelPos + CurPos)].Value := Range;
        ExcelPos := ExcelPos + CurPos;
        CurPos := 0;
      end;
      CurPos := CurPos + 1;
    end;

    Progr.Progress := 60;

    List.Columns['E'].Hidden := not (cbCardNumber.Checked);
    List.Columns['F'].Hidden := not (cbDate.Checked);
    List.Columns['G'].Hidden := not (cbPrice.Checked);

    Progr.Progress := 90;
    //Вставка итогов
    if not qCardRest.IsEmpty then
      MSExcel.Run('CreateSubTotal', cbSTCardNumber.Checked);

    Progr.Progress := 100;
    Progr.Free;
    MSExcel.Visible := True;
    MSExcel.ScreenUpdating := True;
  except on E: Exception do
    begin
      Progr.Free;
      if not VarIsEmpty(MsExcel) then
      begin
        MSExcel.Visible := True;
        MSExcel.ScreenUpdating := True;
      end;
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TTalonPotrReportForm.MakeReportCardMove;
var
  CurPos: Integer;
  Progr: TProgrForm;
  Range: Variant;
begin
  try
    //Создание линии прокрутки
    Application.CreateForm(TProgrForm, Progr);
    Progr.Progress := 0;
    Progr.Show;
    Progr.Repaint;
    //Выполнение запроса по выборке данных для отчета
    qCardMove.Close;
    qCardMove.ParamByName('PrintCardNumber').Value := cbCardNumber.Checked;
    qCardMove.ParamByName('PrintPrice').Value := cbPrice.Checked;
    qCardMove.ParamByName('OrgId').AsInteger := ClientId;
    qCardMove.ParamByName('OrgInst').AsInteger := ClientInst;
    qCardMove.ParamByName('DepId').AsInteger := OrgId;
    qCardMove.ParamByName('DepInst').AsInteger := OrgInst;
    qCardMove.ParamByName('BeginDate').AsDate := deBeginDate.Date;
    qCardMove.ParamByName('EndDate').AsDate := deEndDate.Date;
    _OpenQuery(qCardMove);
    //Инициализация области памяти Range
    Range := VarArrayCreate([1, qCardMove.RecordCount, 1, qCardMove.FieldCount], varVariant);

    Progr.Progress := 40;
    //Создание екземпляра Excel
    if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
      MSExcel := GetActiveOleObject('Excel.Application')
    else MSExcel := CreateOleObject('Excel.Application');
    MSExcel.Workbooks.Add(GetMainDir + 'pattern\CardClientMove.xlt');
    List := MSExcel.ActiveWorkbook.ActiveSheet;

    //Вывод шапки отчета
    List.Cells[2, 'A'] := MainForm.qOrg.FieldbyName('Name').AsString + ' ' + DateTimeToStr(GetSystemDate);
    List.Cells[6, 'D'] := TranslateText('по ') + CEOrg.Text;
    List.Cells[7, 'D'] := '   ' + deBeginDate.Text + ' - ' + deEndDate.Text;

    Progr.Progress := 50;
    //Загрузка данных в область памяти Range
    CurPos := 1;
    while not qCardMove.Eof do
    begin
      Range[CurPos, 1] := qCardMove.FieldByName('Emitent_Name').AsVariant;
      Range[CurPos, 2] := qCardMove.FieldByName('Client_Name').AsVariant;
      Range[CurPos, 3] := qCardMove.FieldByName('Client_OKPO').AsVariant;
      Range[CurPos, 4] := qCardMove.FieldByName('NP_Name').AsVariant;
      Range[CurPos, 5] := qCardMove.FieldByName('Card_Number').AsVariant;
      Range[CurPos, 6] := qCardMove.FieldByName('Price').AsVariant;
      Range[CurPos, 7] := qCardMove.FieldByName('BeginRest').AsVariant;
      Range[CurPos, 8] := qCardMove.FieldByName('BeginRestAmount').AsVariant;
      Range[CurPos, 9] := qCardMove.FieldByName('Receipt').AsVariant;
      Range[CurPos, 10] := qCardMove.FieldByName('ReceiptAmount').AsVariant;
      Range[CurPos, 11] := qCardMove.FieldByName('Expense').AsVariant;
      Range[CurPos, 12] := qCardMove.FieldByName('ExpenseAmount').AsVariant;
      Range[CurPos, 13] := qCardMove.FieldByName('EndRest').AsVariant;
      Range[CurPos, 14] := qCardMove.FieldByName('EndRestAmount').AsVariant;
      qCardMove.Next;
      CurPos := CurPos + 1;
    end;

    List.Range[List.Cells[11, 'A'], List.Cells[qCardMove.RecordCount + 10, qCardMove.FieldCount]].Value := Range;

    Progr.Progress := 60;

    List.Columns['E'].Hidden := not (cbCardNumber.Checked);
    List.Columns['F'].Hidden := not (cbPrice.Checked);

    Progr.Progress := 90;
    //Вставка итогов
    if not qCardMove.IsEmpty then
      MSExcel.Run('CreateSubTotal', cbSTCardNumber.Checked);

    Progr.Progress := 100;
    Progr.Free;
    MSExcel.Visible := True;
    MSExcel.ScreenUpdating := True;
  except on E: Exception do
    begin
      Progr.Free;
      if not VarIsEmpty(MsExcel) then
      begin
        MSExcel.Visible := True;
        MSExcel.ScreenUpdating := True;
      end;
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TTalonPotrReportForm.MakeReportAutoOut;
var
  ExcelPos, CurPos: Integer;
  Progr: TProgrForm;
  Range: Variant;
begin
  try
    //Создание линии прокрутки
    Application.CreateForm(TProgrForm, Progr);
    Progr.Progress := 0;
    Progr.Show;
    Progr.Repaint;
    //Выполнение запроса по выборке данных для отчета
    qAutoOut.Close;
    qAutoOut.ParamByName('PrintCardNumber').Value := cbCardNumber.Checked;
    qAutoOut.ParamByName('PrintDate').Value := cbDate.Checked;
    qAutoOut.ParamByName('SelectCard').Value := cbRTACard.Checked;
    qAutoOut.ParamByName('SelectTalon').Value := cbRTATalon.Checked;
    qAutoOut.ParamByName('AutoId').AsInteger := AutoId;
    qAutoOut.ParamByName('AutoInst').AsInteger := AutoInst;
    qAutoOut.ParamByName('EmpId').AsInteger := EmpId;
    qAutoOut.ParamByName('EmpInst').AsInteger := EmpInst;
    qAutoOut.ParamByName('DepId').AsInteger := OrgId;
    qAutoOut.ParamByName('DepInst').AsInteger := OrgInst;
    qAutoOut.ParamByName('BeginDate').AsDate := deBeginDate.Date;
    qAutoOut.ParamByName('EndDate').AsDate := deEndDate.Date;
    _OpenQuery(qAutoOut);
    //Инициализация области памяти Range
    Range := VarArrayCreate([1, 2000, 1, qAutoOut.FieldCount], varVariant);

    Progr.Progress := 40;
    //Создание екземпляра Excel
    if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
      MSExcel := GetActiveOleObject('Excel.Application')
    else MSExcel := CreateOleObject('Excel.Application');

    MSExcel.Workbooks.Add(GetMainDir + 'pattern\AutoOut.xlt');
    List := MSExcel.ActiveWorkbook.ActiveSheet;

    //Вывод шапки отчета
    List.Cells[2, 'A'] := MainForm.qOrg.FieldbyName('Name').AsString + ' ' + DateTimeToStr(GetSystemDate);
    List.Cells[6, 'C'] := TranslateText('по ') + CEOrg.Text;
    List.Cells[7, 'C'] := '   ' + deBeginDate.Text + ' - ' + deEndDate.Text;

    Progr.Progress := 50;
    //Загрузка данных в область памяти Range
    ExcelPos := 10;
    CurPos := 1;
    while not qAutoOut.Eof do
    begin
      Range[CurPos, 1] := qAutoOut.FieldByName('Employ_Name').AsVariant;
      Range[CurPos, 2] := qAutoOut.FieldByName('Auto_Number').AsVariant;
      Range[CurPos, 3] := qAutoOut.FieldByName('Auto_Type_Name').AsVariant;
      Range[CurPos, 4] := qAutoOut.FieldByName('Auto_Group_Name').AsVariant;
      Range[CurPos, 5] := qAutoOut.FieldByName('NP_Name').AsVariant;
      Range[CurPos, 6] := qAutoOut.FieldByName('Refuel_Type_Name').AsVariant;
      Range[CurPos, 7] := qAutoOut.FieldByName('Card_Number').AsVariant;
      Range[CurPos, 8] := qAutoOut.FieldByName('Out_Date').AsVariant;
      Range[CurPos, 9] := qAutoOut.FieldByName('Litr').AsVariant;
      qAutoOut.Next;

      //Выгрузка данных в Excel, если число записей в области данных превышает 2000 строк
      if (CurPos >= 2000) or (qAutoOut.Eof) then
      begin
        List.Range['A' + IntToStr(ExcelPos + 1) + ':I' + IntToStr(ExcelPos + CurPos)].Value := Range;
        ExcelPos := ExcelPos + CurPos;
        CurPos := 0;
      end;
      CurPos := CurPos + 1;
    end;

    Progr.Progress := 60;

    List.Columns['F'].Hidden := not (cbCardNumber.Checked);
    List.Columns['G'].Hidden := not (cbDate.Checked);

    Progr.Progress := 90;

    //Вставка итогов
    if not qAutoOut.IsEmpty then
      MSExcel.Run('CreateSubTotal', cbSTCardNumber.Checked);

    Progr.Progress := 100;
    Progr.Free;
    SaveReport(MSExcel, 'КартПотрДв'); // *NO_TRANSLATE*
    MSExcel.Visible := True;
    MSExcel.ScreenUpdating := True;
  except on E: Exception do
    begin
      Progr.Free;
      if not VarIsEmpty(MsExcel) then
      begin
        MSExcel.Visible := True;
        MSExcel.ScreenUpdating := True;
      end;
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TTalonPotrReportForm.MakeReportAutoPrih;
var
  ExcelPos, CurPos: Integer;
  Progr: TProgrForm;
  Range: Variant;
begin
  try
    //Создание линии прокрутки
    Application.CreateForm(TProgrForm, Progr);
    Progr.Progress := 0;
    Progr.Show;
    Progr.Repaint;

    if cbRTACard.Checked then
    begin
      qCheckCardSR.Close;
      qCheckCardSR.ParamByName('BeginDate').AsDate := deBeginDate.Date;
      qCheckCardSR.ParamByName('EndDate').AsDate := deEndDate.Date;
      _OpenQuery(qCheckCardSR);
      if not qCheckCardSR.IsEmpty then
      begin
        Progr.Hide;
        if MessageDlg(qCheckCardSR.FieldByName('Title').AsString + TranslateText(', отчет будет сформирован неверно (для получения более полной информации откройте форму Проверки/Эл. карточки). Создать отчет ?'), mtWarning, [mbYes, mbNo], 0) = mrNo then
          Abort;
        Progr.Show;
      end;
    end;
    //Выполнение запроса по выборке данных для отчета
    qAutoPrih.Close;
    qAutoPrih.ParamByName('SelectVedomost').Value := cbRTAVedomost.Checked;
    qAutoPrih.ParamByName('SelectCard').Value := cbRTACard.Checked;
    qAutoPrih.ParamByName('SelectTalon').Value := cbRTATalon.Checked;
    qAutoPrih.ParamByName('SelectNB').Value := cbRTANB.Checked;
    qAutoPrih.ParamByName('SelectNal').Value := cbRTANal.Checked;
    qAutoPrih.ParamByName('PrintPart').Value := cbPart.Checked;
    qAutoPrih.ParamByName('PrintSubPart').Value := cbSubPart.Checked;
    qAutoPrih.ParamByName('PrintAZS').Value := cbAZS.Checked;
    qAutoPrih.ParamByName('PrintCardNumber').Value := cbCardNumber.Checked;
    qAutoPrih.ParamByName('PrintDate').Value := cbDate.Checked;
    qAutoPrih.ParamByName('PrintPrice').Value := cbPrice.Checked;
    qAutoPrih.ParamByName('AutoId').AsInteger := AutoId;
    qAutoPrih.ParamByName('AutoInst').AsInteger := AutoInst;
    qAutoPrih.ParamByName('EmpId').AsInteger := EmpId;
    qAutoPrih.ParamByName('EmpInst').AsInteger := EmpInst;
    qAutoPrih.ParamByName('DepId').AsInteger := OrgId;
    qAutoPrih.ParamByName('DepInst').AsInteger := OrgInst;
    qAutoPrih.ParamByName('BeginDate').AsDate := deBeginDate.Date;
    qAutoPrih.ParamByName('EndDate').AsDate := deEndDate.Date;
    _OpenQuery(qAutoPrih);
    //Инициализация области памяти Range
    Range := VarArrayCreate([1, 2000, 1, qAutoPrih.FieldCount], varVariant);

    Progr.Progress := 40;
    //Создание екземпляра Excel
    if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
      MSExcel := GetActiveOleObject('Excel.Application')
    else MSExcel := CreateOleObject('Excel.Application');
    MSExcel.Workbooks.Add(GetMainDir + 'pattern\AutoPrih.xlt');
    List := MSExcel.ActiveWorkbook.ActiveSheet;
    //Вывод шапки отчета
    List.Cells[2, 'A'] := MainForm.qOrg.FieldbyName('Name').AsString + ' ' + DateTimeToStr(GetSystemDate);
    List.Cells[6, 'C'] := TranslateText('   по ') + CEOrg.Text;
    List.Cells[7, 'C'] := '         ' + deBeginDate.Text + ' - ' + deEndDate.Text;

    Progr.Progress := 50;
    //Загрузка данных в область памяти Range
    ExcelPos := 10;
    CurPos := 1;
    while not qAutoPrih.Eof do
    begin
      Range[CurPos, 1] := qAutoPrih.FieldByName('Employ_Name').AsVariant;
      Range[CurPos, 2] := qAutoPrih.FieldByName('Auto_Number').AsVariant;
      Range[CurPos, 3] := qAutoPrih.FieldByName('Auto_Type_Name').AsVariant;
      Range[CurPos, 4] := qAutoPrih.FieldByName('Auto_Group_Name').AsVariant;
      Range[CurPos, 5] := qAutoPrih.FieldByName('NP_Name').AsVariant;
      Range[CurPos, 6] := qAutoPrih.FieldByName('Refuel_Type_Name').AsVariant;
      Range[CurPos, 7] := qAutoPrih.FieldByName('Part').AsVariant;
      Range[CurPos, 8] := qAutoPrih.FieldByName('Sub_Part').AsVariant;
      Range[CurPos, 9] := qAutoPrih.FieldByName('Filial_Name').AsVariant;
      Range[CurPos, 10] := qAutoPrih.FieldByName('AZS_Name').AsVariant;
      Range[CurPos, 11] := qAutoPrih.FieldByName('Rep_Date').AsVariant;
      Range[CurPos, 12] := qAutoPrih.FieldByName('Smena_Num').AsVariant;
      Range[CurPos, 13] := qAutoPrih.FieldByName('Exp_Date').AsVariant;
      Range[CurPos, 14] := qAutoPrih.FieldByName('Card_Number').AsVariant;
      Range[CurPos, 15] := qAutoPrih.FieldByName('Rec_Date').AsVariant;
      Range[CurPos, 16] := qAutoPrih.FieldByName('SS').AsVariant;
      Range[CurPos, 17] := qAutoPrih.FieldByName('Term_Price').AsVariant;
      Range[CurPos, 18] := qAutoPrih.FieldByName('Litr').AsVariant;
      Range[CurPos, 19] := qAutoPrih.FieldByName('Weight').AsVariant;
      Range[CurPos, 20] := qAutoPrih.FieldByName('SS_Amount').AsVariant;
      Range[CurPos, 21] := qAutoPrih.FieldByName('Term_Amount').AsVariant;
      qAutoPrih.Next;
      //Выгрузка данных в Excel, если число записей в области данных превышает 2000 строк
      if (CurPos >= 2000) or (qAutoPrih.Eof) then
      begin
        List.Range['A' + IntToStr(ExcelPos + 1) + ':U' + IntToStr(ExcelPos + CurPos)].Value := Range;
        ExcelPos := ExcelPos + CurPos;
        CurPos := 0;
      end;
      CurPos := CurPos + 1;
    end;

    Progr.Progress := 60;

    List.Columns['G'].Hidden := not (cbPart.Checked);
    List.Columns['H'].Hidden := not (cbSubPart.Checked);
    List.Columns['I:L'].Hidden := not (cbAZS.Checked);
    List.Columns['M'].Hidden := not (cbDate.Checked);
    List.Columns['N'].Hidden := not (cbCardNumber.Checked);
    List.Columns['O'].Hidden := not (cbDate.Checked);
    List.Columns['P:Q'].Hidden := not (cbPrice.Checked);

    Progr.Progress := 90;
    //Вставка итогов
    if not qAutoPrih.IsEmpty then
      MSExcel.Run('CreateSubTotal', cbSTPart.Checked, (cbSTSubPart.Checked) and (not cbOurClientAlienAZS.Checked), cbSTAZS.Checked);

    Progr.Progress := 100;
    Progr.Free;
    MSExcel.Visible := True;
    MSExcel.ScreenUpdating := True;
  except on E: Exception do
    begin
      Progr.Free;
      if not VarIsEmpty(MsExcel) then
      begin
        MSExcel.Visible := True;
        MSExcel.ScreenUpdating := True;
      end;
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TTalonPotrReportForm.MakeReportAutoRest;
var ExcelPos, CurPos: Integer;
  Progr: TProgrForm;
  Range: Variant;
begin
  try
    //Создание линии прокрутки
    Application.CreateForm(TProgrForm, Progr);
    Progr.Progress := 0;
    Progr.Show;
    Progr.Repaint;
    //Выполнение запроса по выборке данных для отчета
    qAutoRest.Close;
    qAutoRest.ParamByName('PrintCardNumber').Value := cbCardNumber.Checked;
    qAutoRest.ParamByName('PrintDate').Value := cbDate.Checked;
    qAutoRest.ParamByName('SelectCard').Value := cbRTACard.Checked;
    qAutoRest.ParamByName('SelectTalon').Value := cbRTATalon.Checked;
    qAutoRest.ParamByName('AutoId').AsInteger := AutoId;
    qAutoRest.ParamByName('AutoInst').AsInteger := AutoInst;
    qAutoRest.ParamByName('EmpId').AsInteger := EmpId;
    qAutoRest.ParamByName('EmpInst').AsInteger := EmpInst;
    qAutoRest.ParamByName('DepId').AsInteger := OrgId;
    qAutoRest.ParamByName('DepInst').AsInteger := OrgInst;
    qAutoRest.ParamByName('EndDate').AsDate := deCurDate.Date;
    _OpenQuery(qAutoRest);
    //Инициализация области памяти Range
    Range := VarArrayCreate([1, 2000, 1, qAutoRest.FieldCount], varVariant);
    Progr.Progress := 40;
    //Создание екземпляра Excel
    if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
      MSExcel := GetActiveOleObject('Excel.Application')
    else
      MSExcel := CreateOleObject('Excel.Application');
    MSExcel.Workbooks.Add(GetMainDir + 'pattern\AutoRest.xlt');
    List := MSExcel.ActiveWorkbook.ActiveSheet;
    //Вывод шапки отчета
    List.Cells[2, 'A'] := MainForm.qOrg.FieldbyName('Name').AsString + ' ' + DateTimeToStr(GetSystemDate);
    List.Cells[6, 'C'] := TranslateText('по ') + CEOrg.Text;
    List.Cells[7, 'C'] := TranslateText('на ') + deCurDate.Text;
    Progr.Progress := 50;
    //Загрузка данных в область памяти Range
    ExcelPos := 10;
    CurPos := 1;
    while not qAutoRest.Eof do
    begin
      Range[CurPos, 1] := qAutoRest.FieldByName('Employ_Name').AsVariant;
      Range[CurPos, 2] := qAutoRest.FieldByName('Auto_Number').AsVariant;
      Range[CurPos, 3] := qAutoRest.FieldByName('Auto_Type_Name').AsVariant;
      Range[CurPos, 4] := qAutoRest.FieldByName('Auto_Group_Name').AsVariant;
      Range[CurPos, 5] := qAutoRest.FieldByName('NP_Name').AsVariant;
      Range[CurPos, 6] := qAutoRest.FieldByName('Refuel_Type_Name').AsVariant;
      Range[CurPos, 7] := qAutoRest.FieldByName('Card_Number').AsVariant;
      Range[CurPos, 8] := qAutoRest.FieldByName('Out_Date').AsVariant;
      Range[CurPos, 9] := qAutoRest.FieldByName('Litr').AsVariant;
      qAutoRest.Next;
      //Выгрузка данных в Excel, если число записей в области данных превышает 2000 строк
      if (CurPos >= 2000) or (qAutoRest.Eof) then
      begin
        List.Range['A' + IntToStr(ExcelPos + 1) + ':I' + IntToStr(ExcelPos + CurPos)].Value := Range;
        ExcelPos := ExcelPos + CurPos;
        CurPos := 0;
      end;
      CurPos := CurPos + 1;
    end;
    Progr.Progress := 60;
    List.Columns['F'].Hidden := not (cbCardNumber.Checked);
    List.Columns['H'].Hidden := not (cbDate.Checked);
    Progr.Progress := 90;
    //Вставка итогов
    if not qAutoRest.IsEmpty then
      MSExcel.Run('CreateSubTotal', cbSTCardNumber.Checked);
    Progr.Progress := 100;
    Progr.Free;
    MSExcel.Visible := True;
    MSExcel.ScreenUpdating := True;
  except on E: Exception do
    begin
      Progr.Free;
      if not VarIsEmpty(MsExcel) then
      begin
        MSExcel.Visible := True;
        MSExcel.ScreenUpdating := True;
      end;
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TTalonPotrReportForm.MakeReportAutoMove;
var
  CurPos: Integer;
  Progr: TProgrForm;
  Range: Variant;
begin
  try
    //Создание линии прокрутки
    Application.CreateForm(TProgrForm, Progr);
    Progr.Progress := 0;
    Progr.Show;
    Progr.Repaint;
    //Выполнение запроса по выборке данных для отчета
    qAutoMove.Close;
    qAutoMove.ParamByName('SelectVedomost').Value := cbRTAVedomost.Checked;
    qAutoMove.ParamByName('SelectCard').Value := cbRTACard.Checked;
    qAutoMove.ParamByName('SelectTalon').Value := cbRTATalon.Checked;
    qAutoMove.ParamByName('SelectNB').Value := cbRTANB.Checked;
    qAutoMove.ParamByName('SelectNal').Value := cbRTANal.Checked;
    qAutoMove.ParamByName('AutoId').AsInteger := AutoId;
    qAutoMove.ParamByName('AutoInst').AsInteger := AutoInst;
    qAutoMove.ParamByName('EmpId').AsInteger := EmpId;
    qAutoMove.ParamByName('EmpInst').AsInteger := EmpInst;
    qAutoMove.ParamByName('DepId').AsInteger := OrgId;
    qAutoMove.ParamByName('DepInst').AsInteger := OrgInst;
    qAutoMove.ParamByName('BeginDate').AsDate := deBeginDate.Date;
    qAutoMove.ParamByName('EndDate').AsDate := deEndDate.Date;
    _OpenQuery(qAutoMove);
    //Инициализация области памяти Range
    Range := VarArrayCreate([1, qAutoMove.RecordCount, 1, qAutoMove.FieldCount], varVariant);

    Progr.Progress := 40;
    //Создание екземпляра Excel
    if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
      MSExcel := GetActiveOleObject('Excel.Application')
    else MSExcel := CreateOleObject('Excel.Application');

    MSExcel.Workbooks.Add(GetMainDir + 'pattern\AutoMove.xlt');
    List := MSExcel.ActiveWorkbook.ActiveSheet;
    //Вывод шапки отчета
    List.Cells[2, 'A'] := MainForm.qOrg.FieldbyName('Name').AsString + ' ' + DateTimeToStr(GetSystemDate);
    List.Cells[6, 'C'] := TranslateText('по ') + CEOrg.Text;
    List.Cells[7, 'C'] := '   ' + deBeginDate.Text + ' - ' + deEndDate.Text;

    Progr.Progress := 50;
    //Загрузка данных в область памяти Range
    CurPos := 1;
    while not qAutoMove.Eof do
    begin
      Range[CurPos, 1] := qAutoMove.FieldByName('dep_Name').AsVariant;
      Range[CurPos, 2] := qAutoMove.FieldByName('Employ_Name').AsVariant;
      Range[CurPos, 3] := qAutoMove.FieldByName('Auto_Number').AsVariant;
      Range[CurPos, 4] := qAutoMove.FieldByName('Auto_Type_Name').AsVariant;
      Range[CurPos, 5] := qAutoMove.FieldByName('Auto_Group_Name').AsVariant;
      Range[CurPos, 6] := qAutoMove.FieldByName('NP_Name').AsVariant;
      Range[CurPos, 7] := qAutoMove.FieldByName('Refuel_Type_Name').AsVariant;
      Range[CurPos, 8] := qAutoMove.FieldByName('BeginRest').AsVariant;
      Range[CurPos, 9] := qAutoMove.FieldByName('OutLitr').AsVariant;
      Range[CurPos, 10] := qAutoMove.FieldByName('RefuelLitr').AsVariant;
      Range[CurPos, 11] := qAutoMove.FieldByName('EndRest').AsVariant;
      qAutoMove.Next;
      CurPos := CurPos + 1;
    end;

    Progr.Progress := 60;
    List.Range[List.Cells[11, 'A'], List.Cells[qAutoMove.RecordCount + 10, qAutoMove.FieldCount]].Value := Range;
    Progr.Progress := 90;
    //Вставка итогов
    if not qAutoMove.IsEmpty then MSExcel.Run('CreateSubTotal');

    Progr.Progress := 100;
    Progr.Free;
    MSExcel.Visible := True;
    MSExcel.ScreenUpdating := True;
  except on E: Exception do
    begin
      Progr.Free;
      if not VarIsEmpty(MsExcel) then
      begin
        MSExcel.Visible := True;
        MSExcel.ScreenUpdating := True;
      end;
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TTalonPotrReportForm.rgTalonReportTypeClick(Sender: TObject);
begin
  pBeginEndDate.Visible := rgTalonReportType.ItemIndex in [0, 1, 3];
  pCurDate.Visible := rgTalonReportType.ItemIndex = 2;
  rgTalonType.Visible := (rgTalonReportType.ItemIndex = 0) and (cbNum.Visible) and (cbNum.Checked);
  pAZS.Visible := rgTalonReportType.ItemIndex = 1;
  pSTAZS.Visible := rgTalonReportType.ItemIndex = 1;
  cbSer.Visible := not (rgTalonReportType.ItemIndex = 3);
  cbNum.Visible := not (rgTalonReportType.ItemIndex = 3);
  cbPrice.Visible := not (rgTalonReportType.ItemIndex = 3);
  cbDate.Visible := not (rgTalonReportType.ItemIndex = 3);
  gbSubTotal.Visible := not (rgTalonReportType.ItemIndex = 3);
end;

procedure TTalonPotrReportForm.rgRefuelReportTypeClick(Sender: TObject);
begin
  pBeginEndDate.Visible := rgRefuelReportType.ItemIndex in [0, 1, 3];
  pCurDate.Visible := rgRefuelReportType.ItemIndex = 2;
  pAZS.Visible := rgRefuelReportType.ItemIndex = 1;
  pSTAZS.Visible := rgRefuelReportType.ItemIndex = 1;
  cbPrice.Visible := rgRefuelReportType.ItemIndex = 1;
  pTalon.Visible := False;
  cbNominal.Visible := False;
  cbCardNumber.Visible := rgRefuelReportType.ItemIndex in [0, 1, 2];
  cbDate.Visible := rgRefuelReportType.ItemIndex in [0, 1, 2];
  cbSTCardNumber.Visible := rgRefuelReportType.ItemIndex in [0, 1, 2];
  cbRTAVedomost.Visible := rgRefuelReportType.ItemIndex in [1, 3];
  cbRTANB.Visible := rgRefuelReportType.ItemIndex in [1, 3];
  cbRTANal.Visible := rgRefuelReportType.ItemIndex in [1, 3];
end;

procedure TTalonPotrReportForm.rgCardReportTypeClick(Sender: TObject);
begin
  pBeginEndDate.Visible := rgCardReportType.ItemIndex in [0, 1, 3];
  pCurDate.Visible := rgCardReportType.ItemIndex = 2;
  pAZS.Visible := rgCardReportType.ItemIndex = 1;
  pSTAZS.Visible := rgCardReportType.ItemIndex = 1;
  gbTypeRefuelCard.Visible := rgCardReportType.ItemIndex = 1;
  cbDate.Visible := not (rgCardReportType.ItemIndex = 3);
end;

procedure TTalonPotrReportForm.FormShow(Sender: TObject);
begin
  case ReportNumber of
    1:
      begin
        Caption := TranslateText('Отчеты по талонам в разрезе потребителей');
        pClient.Visible := True;
        pTalon.Visible := True;
        cbSTNominal.Visible := True;
        rgTalonReportType.Visible := True;
        rgTalonReportTypeClick(nil);
      end;
    2:
      begin
        Caption := TranslateText('Отчеты по эл.карточкам в разрезе потребителей');
        pClient.Visible := True;
        cbCardNumber.Visible := True;
        cbSTCardNumber.Visible := True;
        rgCardReportType.Visible := True;
        rgCardReportTypeClick(nil);
      end;
    3:
      begin
        Caption := TranslateText('Отчеты по заправке технических средств');
        pAutoDriver.Visible := True;
        rgRefuelReportType.Visible := True;
        gbTypeRefuelAuto.Visible := True;
        rgRefuelReportTypeClick(nil);
      end;
  end;
end;

procedure TTalonPotrReportForm.cbPartClick(Sender: TObject);
begin
  cbSubPart.Enabled := (cbPart.Enabled) and (cbPart.Checked);
  cbSubPart.Checked := False;
  cbSTPart.Enabled := (cbPart.Enabled) and (cbPart.Checked);
  cbSTPart.Checked := False;
  cbSTSubPart.Enabled := False;
  cbSTSubPart.Checked := False;
end;

procedure TTalonPotrReportForm.cbSubPartClick(Sender: TObject);
begin
  cbSTSubPart.Enabled := (cbSubPart.Enabled) and (cbSubPart.Checked);
  cbSTSubPart.Checked := False;
end;

procedure TTalonPotrReportForm.cbAZSClick(Sender: TObject);
begin
  cbSTAZS.Enabled := (cbAZS.Enabled) and (cbAZS.Checked);
  cbSTAZS.Checked := False;
end;

procedure TTalonPotrReportForm.cbSerClick(Sender: TObject);
begin
  cbNum.Enabled := cbSer.Checked;
  cbNum.Checked := False;
end;

procedure TTalonPotrReportForm.cbNumClick(Sender: TObject);
begin
  rgTalonType.Visible := (rgTalonReportType.ItemIndex = 0) and (cbNum.Visible) and (cbNum.Checked) and (ReportNumber = 1);
end;

procedure TTalonPotrReportForm.ceAutoButtonClick(Sender: TObject);
var
  AutoRefForm: TAutoRefForm;
begin
  Application.CreateForm(TAutoRefForm, AutoRefForm);
  AutoRefForm.ShowModal;
  if AutoRefForm.ModalResult = mrOk then
  begin
    AutoId := AutoRefForm.qID.AsInteger;
    AutoInst := AutoRefForm.qINST.AsInteger;
    ceAuto.Text := AutoRefForm.qNUMB.AsString;
    if not AutoRefForm.qEMPLOY_ID.IsNull then
    begin
      EmpId := AutoRefForm.qEMPLOY_ID.AsInteger;
      EmpInst := AutoRefForm.qEMPLOY_INST.AsInteger;
      ceDriver.Text := AutoRefForm.qFULLNAME.AsString;
    end;
  end;
  AutoRefForm.Destroy;
end;

procedure TTalonPotrReportForm.ceDriverButtonClick(Sender: TObject);
var
  EmpRefForm: TEmpRefForm;
begin
  Application.CreateForm(TEmpRefForm, EmpRefForm);
  EmpRefForm.ShowModal;
  if EmpRefForm.ModalResult = mrOk then
  begin
    EmpId := EmpRefForm.qID.AsInteger;
    EmpInst := EmpRefForm.qINST.AsInteger;
    ceDriver.Text := EmpRefForm.qF_NAME.AsString + ' ' + EmpRefForm.qI_NAME.AsString + '. ' + EmpRefForm.qO_NAME.AsString[1] + '. ';
  end;
  EmpRefForm.Destroy;
end;

procedure TTalonPotrReportForm.sbClearDriverClick(Sender: TObject);
begin
  ceDriver.Text := '';
  EmpId := 0;
  EmpInst := 0;
end;

procedure TTalonPotrReportForm.sbClearAutoClick(Sender: TObject);
begin
  ceAuto.Text := '';
  AutoId := 0;
  AutoInst := 0;
end;

procedure TTalonPotrReportForm.cbCardNumberClick(Sender: TObject);
begin
  cbSTCardNumber.Enabled := cbCardNumber.Checked;
  cbSTCardNumber.Checked := False;
end;

procedure TTalonPotrReportForm.cbNominalClick(Sender: TObject);
begin
  cbSTNominal.Enabled := cbNominal.Checked;
  cbSTNominal.Checked := False;
end;

procedure TTalonPotrReportForm.deEndDateChange(Sender: TObject);
begin
  deCurDate.Date := deEndDate.Date;
end;

procedure TTalonPotrReportForm.deBeginDateAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
  _ExecSQL('begin ov.SetRepBeginDate(to_date(''' + DateTimeToStr(ADate) + ''')); end;');
end;

procedure TTalonPotrReportForm.deEndDateAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
  _ExecSQL('begin ov.SetRepEndDate(to_date(''' + DateTimeToStr(ADate) + ''')); end;');
end;

procedure TTalonPotrReportForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DefineRepDates(0,0);
end;

end.
