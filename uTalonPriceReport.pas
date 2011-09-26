unit uTalonPriceReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, Buttons, Excel8TLB, ComObj, Db, DBTables, ActiveX,
  Grids, DBGrids, DBCtrls, RXDBCtrl, RxLookup, ExtCtrls, uCommonForm, uOilQuery,
  Ora, uOilStoredProc, MemDS, DBAccess{$IFDEF VER150},Variants{$ENDIF};

type
  TTalonPriceReport = class(TCommonForm)
    deBeginDate: TDateEdit;
    lBeginDate: TLabel;
    deEndDate: TDateEdit;
    lEndDate: TLabel;
    rbOut: TRadioButton;
    rbPrih: TRadioButton;
    qPrihPrice: TOilQuery;
    qOutPrice: TOilQuery;
    lSubOrg: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qTalReg: TOilQuery;
    ceOrgName: TComboEdit;
    SpeedButton3: TSpeedButton;
    lSer: TLabel;
    eSer: TEdit;
    qTalonDelta: TOilQuery;
    qTalonCollect: TOilQuery;
    qTalonDK: TOilQuery;
    qCardDelta: TOilQuery;
    qCheckCardSR: TOilQuery;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ceOrgNameDblClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure MakeReportTalonDK;
    procedure MakeReportTalonDelta;
    procedure MakeReportCardDelta;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    MId, MInst, ReportNumber: Integer;
  end;

var
  TalonPriceReport: TTalonPriceReport;

implementation

uses Main, Progr, ChooseOrg, ExFunc, ExcelFunc, UDbFunc, uExeSql;

{$R *.DFM}

procedure TTalonPriceReport.BitBtn2Click(Sender: TObject);
var
  i, BeginNominal, BeginNP, BeginFilial: Integer;
  CurNominal: Real;
  CurNPName, NameForSave: string;
  Progr: TProgrForm;
begin
  DefineRepDates(deBeginDate.Date, deEndDate.Date);
  try
    CurNominal := -1;
    NameForSave := 'talrep';

    case ReportNumber of
      1:
        begin
          //Создание линии прокрутки
          Application.CreateForm(TProgrForm, progr);
          Progr.Progress := 0;
          Progr.Show;
          Progr.Repaint;
          //Создание екземпляра Excel
          if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
            MSExcel := GetActiveOleObject('Excel.Application')
          else MSExcel := CreateOleObject('Excel.Application');
          Progr.Progress := 10;
          if rbPrih.Checked then
          begin
            //Выполнение запроса по выборке данных для отчета
            qPrihPrice.Close;
            qPrihPrice.ParamByName('BeginDate').AsDate := deBeginDate.Date;
            qPrihPrice.ParamByName('EndDate').AsDate := deEndDate.Date;
            if ceOrgName.Text = '' then
              qPrihPrice.ParamByName('Inst').Clear
            else qPrihPrice.ParamByName('Inst').Value := MId;
            _OpenQuery(qPrihPrice);

            MSExcel.Workbooks.Add(GetMainDir + 'pattern\TalonPrice.xlt');
            List := MSExcel.ActiveWorkbook.ActiveSheet;
            //Вывод шапки отчета
            List.Cells[4, 'C'] := TranslateText('с ') + FormatDateTime('dd.mm.yyyy', deBeginDate.Date);
            List.Cells[4, 'E'] := TranslateText('по ') + FormatDateTime('dd.mm.yyyy', deEndDate.Date);
            List.Cells[1, 'B'] := MainForm.qOrg.FieldbyName('Name').AsString + ' ' + FormatDateTime('dd.mm.yyyy hh:nn', GetSystemDate);
            List.Cells[2, 'B'] := TranslateText('Сводная ведомость управления по отоваренным талонам');

            Progr.Progress := 60;
            //Загрузка данных в Excel
            CurNPName := '';
            BeginNP := 8;
            BeginNominal := 9;
            i := 8;
            while not qPrihPrice.Eof do
            begin
              if CurNPName <> qPrihPrice.Fields[0].AsString then
              begin
                List.Rows[i].Insert;
                i := i + 1;
                List.Rows[i].Insert;
                List.Rows[i].Font.Bold := True;
                List.Rows[i].Font.Size := 11;
                List.Cells[i, 'C'] := TranslateText('Свод по ') + qPrihPrice.Fields[0].AsString;
                i := i + 1;
                BeginNP := i;
                CurNPName := qPrihPrice.Fields[0].AsString;
                CurNominal := -1;
              end;
              if (CurNominal <> qPrihPrice.Fields[1].AsFloat) or (qPrihPrice.Eof) then
              begin
                List.Rows[i].Insert;
                List.Rows[i].Font.Bold := True;
                List.Rows[i].Font.Size := 10;
                List.Cells[i, 'B'].HorizontalAlignment := xlLeft;
                List.Cells[i, 'B'] := TranslateText('Номинал ') + qPrihPrice.Fields[1].AsString + TranslateText(' л');
                i := i + 1;
                BeginNominal := i;
                CurNominal := qPrihPrice.Fields[1].AsFloat;
              end;

              List.Rows[i].Insert;
              List.Rows[i].Font.Bold := False;
              List.Rows[i].Font.Size := 10;
              List.Cells[i, 'B'].HorizontalAlignment := xlRight;
              List.Cells[i, 'C'] := qPrihPrice.Fields[3].Value;
              List.Cells[i, 'D'] := qPrihPrice.Fields[4].Value;
              if qPrihPrice.Fields[2].IsNull then
              begin
                List.Cells[i, 'B'].WrapText := True;
                List.Cells[i, 'B'] := TranslateText('Талоны по которым не найдена продажа !');
              end
              else
              begin
                List.Cells[i, 'B'] := qPrihPrice.Fields[2].Value;
                List.Cells[i, 'E'].FormulaR1C1 := '=RC[-3]*RC[-1]';
                List.Cells[i, 'F'].FormulaR1C1 := '=RC[-1]*5/6';
              end;

              qPrihPrice.Next;
              i := i + 1;
              //Вставка итогов по номиналу
              if (CurNPName <> qPrihPrice.Fields[0].AsString) or (CurNominal <> qPrihPrice.Fields[1].AsFloat) or (qPrihPrice.Eof) then
              begin
                List.Rows[i].Insert;
                List.Rows[i].Font.Bold := True;
                List.Rows[i].Font.Size := 10;
                List.Cells[i, 'B'].HorizontalAlignment := xlLeft;
                List.Cells[i, 'B'] := TranslateText('Всего:');
                List.Cells[i, 'C'].Formula := '=SubTotal(9,C' + IntToStr(BeginNominal) + ':C' + IntToStr(i - 1) + ')';
                List.Cells[i, 'D'].Formula := '=SubTotal(9,D' + IntToStr(BeginNominal) + ':D' + IntToStr(i - 1) + ')';
                List.Cells[i, 'E'].Formula := '=SubTotal(9,E' + IntToStr(BeginNominal) + ':E' + IntToStr(i - 1) + ')';
                List.Cells[i, 'F'].Formula := '=SubTotal(9,F' + IntToStr(BeginNominal) + ':F' + IntToStr(i - 1) + ')';
                i := i + 1;
              end;
              //Вставка итогов по типу НП
              if (CurNPName <> qPrihPrice.Fields[0].AsString) or (qPrihPrice.Eof) then
              begin
                List.Rows[i].Insert;
                List.Rows[i].Font.Bold := True;
                List.Rows[i].Font.Size := 11;
                List.Cells[i, 'B'].HorizontalAlignment := xlLeft;
                List.Cells[i, 'B'] := TranslateText('Итого по ') + CurNPName;
                List.Cells[i, 'C'].Formula := '=SubTotal(9,C' + IntToStr(BeginNP) + ':C' + IntToStr(i - 1) + ')';
                List.Cells[i, 'D'].Formula := '=SubTotal(9,D' + IntToStr(BeginNP) + ':D' + IntToStr(i - 1) + ')';
                List.Cells[i, 'E'].Formula := '=SubTotal(9,E' + IntToStr(BeginNP) + ':E' + IntToStr(i - 1) + ')';
                List.Cells[i, 'F'].Formula := '=SubTotal(9,F' + IntToStr(BeginNP) + ':F' + IntToStr(i - 1) + ')';
                i := i + 1;
              end;
            end;
            //Вставка общих итогов
            if not qPrihPrice.IsEmpty then
            begin
              List.Rows[i].Font.Bold := True;
              List.Rows[i].Font.Size := 11;
              List.Cells[i, 'B'] := TranslateText('Всего по итого');
              List.Cells[i, 'C'].Formula := '=SubTotal(9,C8:C' + IntToStr(i - 1) + ')';
              List.Cells[i, 'D'].Formula := '=SubTotal(9,D8:D' + IntToStr(i - 1) + ')';
              List.Cells[i, 'E'].Formula := '=SubTotal(9,E8:E' + IntToStr(i - 1) + ')';
              List.Cells[i, 'F'].Formula := '=SubTotal(9,F8:F' + IntToStr(i - 1) + ')';
            end;
            qPrihPrice.Close;
          end
          else
          begin
            MSExcel.Workbooks.Add(GetMainDir + 'pattern\TalonPrice.xlt');
            List := MSExcel.ActiveWorkbook.ActiveSheet;
            //Вывод шапки отчета
            List.Cells[4, 'C'] := TranslateText('с ') + FormatDateTime('dd.mm.yyyy', deBeginDate.Date);
            List.Cells[4, 'E'] := TranslateText('по ') + FormatDateTime('dd.mm.yyyy', deEndDate.Date);
            List.Cells[1, 'B'] := MainForm.qOrg.FieldbyName('Name').AsString + ' ' + FormatDateTime('dd.mm.yyyy hh:nn', GetSystemDate);
            List.Cells[2, 'B'] := TranslateText('Сводная ведомость управления по отпущенным талонам');
            //Выполнение запроса по выборке данных для отчета
            qOutPrice.Close;
            qOutPrice.ParamByName('BeginDate').AsDate := deBeginDate.Date;
            qOutPrice.ParamByName('EndDate').AsDate := deEndDate.Date;
            if ceOrgName.Text = '' then
              qOutPrice.ParamByName('Inst').Clear
            else
              qOutPrice.ParamByName('Inst').Value := MId;
            _OpenQuery(qOutPrice);

            CurNPName := '';
            BeginNP := 8;
            BeginNominal := 9;
            //Загрузка данных в Excel
            i := 8;
            while not qOutPrice.Eof do
            begin
              if CurNPName <> qOutPrice.Fields[0].AsString then
              begin
                List.Rows[i].Insert;
                i := i + 1;
                List.Rows[i].Insert;
                List.Rows[i].Font.Bold := True;
                List.Rows[i].Font.Size := 11;
                List.Cells[i, 'C'] := TranslateText('Свод по ') + qOutPrice.Fields[0].AsString;
                i := i + 1;
                BeginNP := i;
                CurNPName := qOutPrice.Fields[0].AsString;
                CurNominal := -1;
              end;
              if (CurNominal <> qOutPrice.Fields[1].AsFloat) or (qOutPrice.Eof) then
              begin
                List.Rows[i].Insert;
                List.Rows[i].Font.Bold := True;
                List.Rows[i].Font.Size := 10;
                List.Cells[i, 'B'].HorizontalAlignment := xlLeft;
                List.Cells[i, 'B'] := TranslateText('Номинал ') + qOutPrice.Fields[1].AsString + TranslateText(' л');
                i := i + 1;
                BeginNominal := i;
                CurNominal := qOutPrice.Fields[1].AsFloat;
              end;

              List.Rows[i].Insert;
              List.Rows[i].Font.Bold := False;
              List.Rows[i].Font.Size := 10;
              List.Cells[i, 'B'].HorizontalAlignment := xlRight;
              List.Cells[i, 'C'] := qOutPrice.Fields[3].Value;
              List.Cells[i, 'D'] := qOutPrice.Fields[4].Value;
              if qOutPrice.Fields[2].IsNull then
              begin
                List.Cells[i, 'B'].WrapText := True;
                List.Cells[i, 'B'] := TranslateText('Талоны по которым не найдена продажа !');
              end
              else
              begin
                List.Cells[i, 'B'] := qOutPrice.Fields[2].Value;
                List.Cells[i, 'E'].FormulaR1C1 := '=RC[-3]*RC[-1]';
                List.Cells[i, 'F'].FormulaR1C1 := '=RC[-1]*5/6';
              end;
              qOutPrice.Next;
              i := i + 1;
              //Вставка итогов по номиналу
              if (CurNPName <> qOutPrice.Fields[0].AsString) or (CurNominal <> qOutPrice.Fields[1].AsFloat) or (qOutPrice.Eof) then
              begin
                List.Rows[i].Insert;
                List.Rows[i].Font.Bold := True;
                List.Rows[i].Font.Size := 10;
                List.Cells[i, 'B'].HorizontalAlignment := xlLeft;
                List.Cells[i, 'B'] := TranslateText('Всего:');
                List.Cells[i, 'C'].Formula := '=SubTotal(9,C' + IntToStr(BeginNominal) + ':C' + IntToStr(i - 1) + ')';
                List.Cells[i, 'D'].Formula := '=SubTotal(9,D' + IntToStr(BeginNominal) + ':D' + IntToStr(i - 1) + ')';
                List.Cells[i, 'E'].Formula := '=SubTotal(9,E' + IntToStr(BeginNominal) + ':E' + IntToStr(i - 1) + ')';
                List.Cells[i, 'F'].Formula := '=SubTotal(9,F' + IntToStr(BeginNominal) + ':F' + IntToStr(i - 1) + ')';
                i := i + 1;
              end;
              //Вставка итогов по типу НП
              if (CurNPName <> qOutPrice.Fields[0].AsString) or (qOutPrice.Eof) then
              begin
                List.Rows[i].Insert;
                List.Rows[i].Font.Bold := True;
                List.Rows[i].Font.Size := 11;
                List.Cells[i, 'B'].HorizontalAlignment := xlLeft;
                List.Cells[i, 'B'] := TranslateText('Итого по ') + CurNPName;
                List.Cells[i, 'C'].Formula := '=SubTotal(9,C' + IntToStr(BeginNP) + ':C' + IntToStr(i - 1) + ')';
                List.Cells[i, 'D'].Formula := '=SubTotal(9,D' + IntToStr(BeginNP) + ':D' + IntToStr(i - 1) + ')';
                List.Cells[i, 'E'].Formula := '=SubTotal(9,E' + IntToStr(BeginNP) + ':E' + IntToStr(i - 1) + ')';
                List.Cells[i, 'F'].Formula := '=SubTotal(9,F' + IntToStr(BeginNP) + ':F' + IntToStr(i - 1) + ')';
                i := i + 1;
              end;
            end;
            Progr.Progress := 90;
            //Вставка общих итогов
            if not qOutPrice.IsEmpty then
            begin
              List.Rows[i].Font.Bold := True;
              List.Rows[i].Font.Size := 11;
              List.Cells[i, 'B'] := TranslateText('Всего по итого');
              List.Cells[i, 'C'].Formula := '=SubTotal(9,C8:C' + IntToStr(i - 1) + ')';
              List.Cells[i, 'D'].Formula := '=SubTotal(9,D8:D' + IntToStr(i - 1) + ')';
              List.Cells[i, 'E'].Formula := '=SubTotal(9,E8:E' + IntToStr(i - 1) + ')';
              List.Cells[i, 'F'].Formula := '=SubTotal(9,F8:F' + IntToStr(i - 1) + ')';
            end;
            qOutPrice.Close;
          end;
          List.Rows[7].Delete;
          Progr.Progress := 100;
          Progr.Free;
        end;
      2:
        begin
          NameForSave := 'ДебеторкаТалоны'; // *NO_TRANSLATE*
          MakeReportTalonDK;
        end;
      3:
        begin
          //Создание линии прокрутки
          Application.CreateForm(TProgrForm, progr);
          Progr.Progress := 0;
          Progr.Show;
          Progr.Repaint;
          //Создание екземпляра Excel
          if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
            MSExcel := GetActiveOleObject('Excel.Application')
          else MSExcel := CreateOleObject('Excel.Application');

          i := 11;
          BeginFilial := 11;
          BeginNP := 11;
          Progr.Progress := 10;
          //Выполнение запроса по выборке данных для отчета
          qTalReg.Close;
          qTalReg.ParamByName('BeginDate').AsDate := deBeginDate.Date;
          qTalReg.ParamByName('EndDate').AsDate := deEndDate.Date;
          if ceOrgName.Text = '' then
            qTalReg.ParamByName('Inst').Clear
          else qTalReg.ParamByName('Inst').Value := MId;
          _OpenQuery(qTalReg);

          MSExcel.Workbooks.Add(GetMainDir + 'pattern\TalonRegister.xlt');
          List := MSExcel.ActiveWorkbook.ActiveSheet;
          //Вывод шапки отчета
          List.Cells[1, 'B'] := MainForm.qOrg.FieldbyName('Name').AsString + ' ' + FormatDateTime('dd.mm.yyyy hh:nn', GetSystemDate);
          if ceOrgName.Text = '' then
            List.Cells[7, 'C'] := TranslateText('за период ') + FormatDateTime('dd.mm.yyyy', deBeginDate.Date) +
              ' - ' + FormatDateTime('dd.mm.yyyy', deEndDate.Date) + TranslateText(' по ') +
              MainForm.qOrg.FieldbyName('Name').AsString
          else
            List.Cells[7, 'C'] := TranslateText('за период ') + FormatDateTime('dd.mm.yyyy', deBeginDate.Date) +
              ' - ' + FormatDateTime('dd.mm.yyyy', deEndDate.Date) + TranslateText(' по ') + ceOrgName.Text;
          //Загрузка данных в Excel
          while not qTalReg.Eof do
          begin
            if List.Cells[BeginFilial, 'A'].Text <> qTalReg.Fields[0].AsString then
              List.Cells[i, 'A'] := qTalReg.Fields[0].AsString
            else
            begin
              List.Range['A' + IntToStr(BeginFilial) + ':A' + IntToStr(i)].Merge;
              List.Range['A' + IntToStr(BeginFilial) + ':A' + IntToStr(i)].WrapText := True;
            end;
            if (List.Cells[BeginNP, 'B'].Text <> qTalReg.Fields[1].AsString) or (not qTalReg.Fields[7].IsNull) or (not qTalReg.Fields[8].IsNull) then
              List.Cells[i, 'B'] := qTalReg.Fields[1].AsString
            else
            begin
              List.Range['B' + IntToStr(BeginNP) + ':B' + IntToStr(i)].Merge;
              List.Range['B' + IntToStr(BeginNP) + ':B' + IntToStr(i)].WrapText := True;
            end;
            if qTalReg.Fields[2].IsNull then
            begin
              List.Cells[i, 'C'].WrapText := True;
              List.Cells[i, 'C'] := TranslateText('Талоны по которым не найдена продажа !')
            end
            else
            begin
              List.Cells[i, 'C'] := qTalReg.Fields[2].Value;
              List.Cells[i, 'E'].FormulaR1C1 := '=RC[-2]*RC[-1]';
              List.Cells[i, 'G'].FormulaR1C1 := '=RC[-4]*RC[-1]';
              List.Cells[i, 'I'].FormulaR1C1 := '=RC[-6]*RC[-1]';
              List.Cells[i, 'K'].FormulaR1C1 := '=RC[-8]*RC[-1]';
            end;

            List.Cells[i, 'D'] := qTalReg.Fields[3].Value;
            List.Cells[i, 'F'] := qTalReg.Fields[4].Value;
            List.Cells[i, 'H'] := qTalReg.Fields[5].Value;
            List.Cells[i, 'J'] := qTalReg.Fields[6].Value;
            if (not qTalReg.Fields[7].IsNull) or (not qTalReg.Fields[8].IsNull) then
            begin
              List.Cells[i, 'L'] := qTalReg.Fields[7].Value;
              List.Cells[i, 'M'] := qTalReg.Fields[8].Value;
            end;
            i := i + 1;
            qTalReg.Next;
            //Вставка итогов по типу НП
            if (List.Cells[BeginNP, 'B'].Text <> qTalReg.Fields[1].AsString) or (qTalReg.Eof) then
            begin
              if (List.Cells[i - 1, 'L'].Text <> '') or (List.Cells[i - 1, 'M'].Text <> '') then
                i := i - 1;
              List.Cells[i, 'A'] := List.Cells[BeginNP, 'A'].Text;
              List.Cells[i, 'B'] := TranslateText('Итого ') + VarToStr(List.Cells[BeginNP, 'B'].Text);
              List.Cells[i, 'C'] := '';
              List.Range['D' + IntToStr(i) + ':M' + IntToStr(i)].Font.Italic := True;
              if BeginNP < i then
              begin
                List.Cells[i, 'D'].Formula := '=SubTotal(9,D' + IntToStr(BeginNP) + ':D' + IntToStr(i - 1) + ')';
                List.Cells[i, 'E'].Formula := '=SubTotal(9,E' + IntToStr(BeginNP) + ':E' + IntToStr(i - 1) + ')';
                List.Cells[i, 'F'].Formula := '=SubTotal(9,F' + IntToStr(BeginNP) + ':F' + IntToStr(i - 1) + ')';
                List.Cells[i, 'G'].Formula := '=SubTotal(9,G' + IntToStr(BeginNP) + ':G' + IntToStr(i - 1) + ')';
                List.Cells[i, 'H'].Formula := '=SubTotal(9,H' + IntToStr(BeginNP) + ':H' + IntToStr(i - 1) + ')';
                List.Cells[i, 'I'].Formula := '=SubTotal(9,I' + IntToStr(BeginNP) + ':I' + IntToStr(i - 1) + ')';
                List.Cells[i, 'J'].Formula := '=SubTotal(9,J' + IntToStr(BeginNP) + ':J' + IntToStr(i - 1) + ')';
                List.Cells[i, 'K'].Formula := '=SubTotal(9,K' + IntToStr(BeginNP) + ':K' + IntToStr(i - 1) + ')';
              end;
              i := i + 1;
              BeginNP := i;
            end;
            //Вставка итогов по Филиалу
            if (List.Cells[BeginFilial, 'A'].Text <> qTalReg.Fields[0].AsString) or (qTalReg.Eof) then
            begin
              List.Cells[i, 'A'] := TranslateText('Итого по филиалу ');
              List.Range['D' + IntToStr(i) + ':M' + IntToStr(i)].Font.Italic := True;
              List.Cells[i, 'D'].Formula := '=SubTotal(9,D' + IntToStr(BeginFilial) + ':D' + IntToStr(i - 2) + ')';
              List.Cells[i, 'E'].Formula := '=SubTotal(9,E' + IntToStr(BeginFilial) + ':E' + IntToStr(i - 2) + ')';
              List.Cells[i, 'F'].Formula := '=SubTotal(9,F' + IntToStr(BeginFilial) + ':F' + IntToStr(i - 2) + ')';
              List.Cells[i, 'G'].Formula := '=SubTotal(9,G' + IntToStr(BeginFilial) + ':G' + IntToStr(i - 2) + ')';
              List.Cells[i, 'H'].Formula := '=SubTotal(9,H' + IntToStr(BeginFilial) + ':H' + IntToStr(i - 2) + ')';
              List.Cells[i, 'I'].Formula := '=SubTotal(9,I' + IntToStr(BeginFilial) + ':I' + IntToStr(i - 2) + ')';
              List.Cells[i, 'J'].Formula := '=SubTotal(9,J' + IntToStr(BeginFilial) + ':J' + IntToStr(i - 2) + ')';
              List.Cells[i, 'K'].Formula := '=SubTotal(9,K' + IntToStr(BeginFilial) + ':K' + IntToStr(i - 2) + ')';
              List.Cells[i, 'L'].Formula := '=SubTotal(9,L' + IntToStr(BeginFilial) + ':L' + IntToStr(i - 1) + ')';
              List.Cells[i, 'M'].Formula := '=SubTotal(9,M' + IntToStr(BeginFilial) + ':M' + IntToStr(i - 1) + ')';
              i := i + 1;
              BeginNP := i;
              BeginFilial := i;
            end;
            //Вставка общих итогов
            if qTalReg.Eof then
            begin
              List.Cells[i, 'A'] := TranslateText('Итого по отчету ');
              List.Range['D' + IntToStr(i) + ':M' + IntToStr(i)].Font.Bold := True;
              List.Cells[i, 'D'].Formula := '=SubTotal(9,D11:D' + IntToStr(i - 3) + ')';
              List.Cells[i, 'E'].Formula := '=SubTotal(9,E11:E' + IntToStr(i - 3) + ')';
              List.Cells[i, 'F'].Formula := '=SubTotal(9,F11:F' + IntToStr(i - 3) + ')';
              List.Cells[i, 'G'].Formula := '=SubTotal(9,G11:G' + IntToStr(i - 3) + ')';
              List.Cells[i, 'H'].Formula := '=SubTotal(9,H11:H' + IntToStr(i - 3) + ')';
              List.Cells[i, 'I'].Formula := '=SubTotal(9,I11:I' + IntToStr(i - 3) + ')';
              List.Cells[i, 'J'].Formula := '=SubTotal(9,J11:J' + IntToStr(i - 3) + ')';
              List.Cells[i, 'K'].Formula := '=SubTotal(9,K11:K' + IntToStr(i - 3) + ')';
              List.Cells[i, 'L'].Formula := '=SubTotal(9,L11:L' + IntToStr(i - 2) + ')';
              List.Cells[i, 'M'].Formula := '=SubTotal(9,M11:M' + IntToStr(i - 2) + ')';
            end;
          end;
          List.Range['A11:M' + IntToStr(i)].Borders.Weight := xlThin;

          Progr.Progress := 100;
          Progr.Free;
        end;

      6: MakeReportTalonDelta;

      7:
        begin
          //Создание линии прокрутки
          Application.CreateForm(TProgrForm, progr);
          Progr.Progress := 0;
          Progr.Show;
          Progr.Repaint;

          i := 11;
          BeginFilial := 11;
          BeginNP := 11;
          Progr.Progress := 10;
          //Выполнение запроса по выборке данных для отчета
          qTalonCollect.Close;
          qTalonCollect.ParamByName('BeginDate').AsDate := deBeginDate.Date;
          qTalonCollect.ParamByName('EndDate').AsDate := deEndDate.Date;
          if ceOrgName.Text = '' then
            qTalonCollect.ParamByName('Inst').Clear
          else
            qTalonCollect.ParamByName('Inst').Value := MId;
          _OpenQuery(qTalonCollect);

          Progr.Progress := 60;
          //Создание екземпляра Excel
          if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
            MSExcel := GetActiveOleObject('Excel.Application')
          else MSExcel := CreateOleObject('Excel.Application');
          MSExcel.Workbooks.Add(GetMainDir + 'pattern\TalonCollect.xlt');
          List := MSExcel.ActiveWorkbook.ActiveSheet;
          //Вывод шапки отчета
          List.Cells[2, 'A'] := MainForm.qOrg.FieldbyName('Name').AsString + ' ' + FormatDateTime('dd.mm.yyyy hh:nn', GetSystemDate);
          if ceOrgName.Text = '' then
            List.Cells[7, 'D'] := TranslateText('за период ') + FormatDateTime('dd.mm.yyyy', deBeginDate.Date) + ' - ' + FormatDateTime('dd.mm.yyyy', deEndDate.Date) + TranslateText(' по ') + MainForm.qOrg.FieldbyName('Name').AsString
          else
            List.Cells[7, 'D'] := TranslateText('за период ') + FormatDateTime('dd.mm.yyyy', deBeginDate.Date) + ' - ' + FormatDateTime('dd.mm.yyyy', deEndDate.Date) + TranslateText(' по ') + ceOrgName.Text;

          //Загрузка данных в Excel
          while not qTalonCollect.Eof do
          begin
            if List.Cells[BeginFilial, 'A'].Text <> qTalonCollect.Fields[0].AsString then
              List.Cells[i, 'A'] := qTalonCollect.Fields[0].AsString
            else
            begin
              List.Range['A' + IntToStr(BeginFilial) + ':A' + IntToStr(i)].Merge;
              List.Range['A' + IntToStr(BeginFilial) + ':A' + IntToStr(i)].WrapText := True;
            end;
            if List.Cells[BeginNP, 'B'].Text <> qTalonCollect.Fields[1].AsString then
              List.Cells[i, 'B'] := qTalonCollect.Fields[1].AsString
            else
            begin
              List.Range['B' + IntToStr(BeginNP) + ':B' + IntToStr(i)].Merge;
              List.Range['B' + IntToStr(BeginNP) + ':B' + IntToStr(i)].WrapText := True;
            end;
            List.Cells[i, 'C'] := qTalonCollect.Fields[2].AsDateTime;
            List.Cells[i, 'D'] := qTalonCollect.Fields[3].AsInteger;
            List.Cells[i, 'E'] := qTalonCollect.Fields[4].AsFloat;
            List.Cells[i, 'F'] := qTalonCollect.Fields[5].AsFloat;
            List.Cells[i, 'G'] := qTalonCollect.Fields[8].AsFloat;
            List.Cells[i, 'H'] := qTalonCollect.Fields[6].AsFloat;
            List.Cells[i, 'I'] := qTalonCollect.Fields[7].AsFloat;

            i := i + 1;
            qTalonCollect.Next;
            //Вставка итогов
            if (List.Cells[BeginNP, 'B'].Text <> qTalonCollect.Fields[1].AsString) or (qTalonCollect.Eof) then
            begin
              if BeginNP < i then
              begin
                List.Range['A' + IntToStr(BeginFilial) + ':A' + IntToStr(i)].Merge;
                List.Range['B' + IntToStr(i) + ':C' + IntToStr(i)].Merge;
                List.Range['B' + IntToStr(i) + ':J' + IntToStr(i)].Font.Italic := True;
                List.Cells[i, 'B'] := TranslateText('Итого по ') + VarToStr(List.Cells[BeginNP, 'B'].Text);
                List.Cells[i, 'F'].Formula := '=SubTotal(9,F' + IntToStr(BeginNP) + ':F' + IntToStr(i - 1) + ')';
                List.Cells[i, 'G'].Formula := '=SubTotal(9,G' + IntToStr(BeginNP) + ':G' + IntToStr(i - 1) + ')';
                List.Cells[i, 'H'].Formula := '=SubTotal(9,H' + IntToStr(BeginNP) + ':H' + IntToStr(i - 1) + ')';
              end;
              i := i + 1;
              BeginNP := i;
            end;
            //Вставка итогов
            if (List.Cells[BeginFilial, 'A'].Text <> qTalonCollect.Fields[0].AsString) or (qTalonCollect.Eof) then
            begin
              List.Range['A' + IntToStr(i) + ':E' + IntToStr(i)].Merge;
              List.Range['A' + IntToStr(i) + ':J' + IntToStr(i)].Font.Italic := True;
              List.Cells[i, 'A'] := TranslateText('Итого по филиалу ') + VarToStr(List.Cells[BeginFilial, 'A'].Text);
              List.Cells[i, 'F'].Formula := '=SubTotal(9,F' + IntToStr(BeginFilial) + ':F' + IntToStr(i - 2) + ')';
              List.Cells[i, 'G'].Formula := '=SubTotal(9,G' + IntToStr(BeginFilial) + ':G' + IntToStr(i - 2) + ')';
              List.Cells[i, 'H'].Formula := '=SubTotal(9,H' + IntToStr(BeginFilial) + ':H' + IntToStr(i - 2) + ')';
              i := i + 1;
              BeginNP := i;
              BeginFilial := i;
            end;
          end;
          //Вставка итогов
          if (qTalonCollect.Eof) and (not qTalonCollect.IsEmpty) then
          begin
            List.Range['A' + IntToStr(i) + ':J' + IntToStr(i)].Font.Bold := True;
            List.Cells[i, 'A'] := TranslateText('Итого по отчету ');
            List.Cells[i, 'F'].Formula := '=SubTotal(9,F11:F' + IntToStr(i - 3) + ')';
            List.Cells[i, 'G'].Formula := '=SubTotal(9,G11:G' + IntToStr(i - 3) + ')';
            List.Cells[i, 'H'].Formula := '=SubTotal(9,H11:H' + IntToStr(i - 3) + ')';
          end;
          List.Range['A11:I' + IntToStr(i)].Borders.Weight := xlThin;

          Progr.Progress := 100;
          Progr.Free;
        end;

      8: MakeReportCardDelta;

    end;
    SaveReport(MSExcel, NameForSave);
    MSExcel.Visible := True;
    MSExcel.ScreenUpdating := True;
  except on E: Exception do
    begin
      Progr.Free;
      MessageDlg(E.Message, mtError, [mbOk], 0);
    end;
  end;
end;

procedure TTalonPriceReport.MakeReportTalonDelta;
var
  CurPos: Integer;
  Progr: TProgrForm;
begin
  //Создание линии прокрутки
  Application.CreateForm(TProgrForm, progr);
  Progr.Progress := 0;
  Progr.Show;
  Progr.Repaint;
  //Создание екземпляра Excel
  if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
    MSExcel := GetActiveOleObject('Excel.Application')
  else MSExcel := CreateOleObject('Excel.Application');
  Progr.Progress := 10;

  if ceOrgName.Text = '' then
    raise Exception.Create(TranslateText('Отсутствует oрганизация'));

  //Выполнение запроса по выборке данных для отчета
  qTalonDelta.Close;
  qTalonDelta.ParamByName('BeginDate').AsDate := deBeginDate.Date;
  qTalonDelta.ParamByName('EndDate').AsDate := deEndDate.Date;
  qTalonDelta.ParamByName('DepId').Value := MId;
  qTalonDelta.ParamByName('DepInst').Value := MInst;
  _OpenQuery(qTalonDelta);

  Range := VarArrayCreate([1, qTalonDelta.RecordCount, 1, qTalonDelta.FieldCount + 2], varVariant);

  MSExcel.Workbooks.Add(GetMainDir + 'pattern\TalonDelta.xlt');
  List := MSExcel.ActiveWorkbook.ActiveSheet;

  //Вывод шапки отчета
  List.Cells[2, 'A'].Value := MainForm.qOrg.FieldbyName('Name').AsString + ' ' + FormatDateTime('dd.mm.yyyy hh:nn', GetSystemDate);
  List.Cells[7, 'C'].Value := TranslateText('за период ') + FormatDateTime('dd.mm.yyyy', deBeginDate.Date) + ' - ' + FormatDateTime('dd.mm.yyyy', deEndDate.Date);
  List.Cells[8, 'C'].Value := TranslateText('по ') + ceOrgName.Text;

  //Загрузка данных в Excel
  CurPos := 1;
  while not qTalonDelta.Eof do
  begin
    Range[CurPos, 1] := qTalonDelta.FieldByName('Dep_Name').Value;
    Range[CurPos, 2] := qTalonDelta.FieldByName('Dog').Value;
    Range[CurPos, 3] := qTalonDelta.FieldByName('Dog_Date').Value;
    Range[CurPos, 4] := qTalonDelta.FieldByName('NP_Name').Value;
    Range[CurPos, 5] := qTalonDelta.FieldByName('SS').Value;

    if qTalonDelta.FieldByName('Price').IsNull then
      Range[CurPos, 6] := TranslateText('Нет продажи')
    else Range[CurPos, 6] := qTalonDelta.FieldByName('Price').Value;

    Range[CurPos, 7] := qTalonDelta.FieldByName('Litr').Value;
    Range[CurPos, 8] := qTalonDelta.FieldByName('Weight').Value;
    Range[CurPos, 9] := qTalonDelta.FieldByName('SS_Amount').Value;
    qTalonDelta.Next;
    CurPos := CurPos + 1;
  end;

  List.Range[List.Cells[11, 'A'], List.Cells[qTalonDelta.RecordCount + 10, qTalonDelta.FieldCount]].Value := Range;
  List.Range['J11:J' + IntToStr(qTalonDelta.RecordCount + 10)].FormulaR1C1 := '=IF(ISNUMBER(RC[-4]),RC[-3]*RC[-4],)';
  List.Range['K11:K' + IntToStr(qTalonDelta.RecordCount + 10)].FormulaR1C1 := '=IF(ISNUMBER(RC[-5]),RC[-1]-RC[-2],)';

  //Вставка итогов
  if not qTalonDelta.IsEmpty then MSExcel.Run('CreateSubTotal');

  Progr.Progress := 100;
  Progr.Free;
end;

procedure TTalonPriceReport.MakeReportCardDelta;
var
  CurPos: Integer;
  Progr: TProgrForm;
begin
  //Создание линии прокрутки
  Application.CreateForm(TProgrForm, progr);
  Progr.Progress := 0;
  Progr.Show;
  Progr.Repaint;
  //Создание екземпляра Excel
  if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
    MSExcel := GetActiveOleObject('Excel.Application')
  else MSExcel := CreateOleObject('Excel.Application');

  Progr.Progress := 10;
  if ceOrgName.Text = '' then
    raise Exception.Create(TranslateText('Отсутствует oрганизация'));

  //Выполнение запроса по выборке данных для отчета
  qCardDelta.Close;
  qCardDelta.ParamByName('BeginDate').AsDate := deBeginDate.Date;
  qCardDelta.ParamByName('EndDate').AsDate := deEndDate.Date;
  qCardDelta.ParamByName('DepId').Value := MId;
  qCardDelta.ParamByName('DepInst').Value := MInst;
  qCardDelta.ParamByName('OrgId').Value := 0;
  qCardDelta.ParamByName('OrgInst').Value := 0;
  _OpenQuery(qCardDelta);

  Range := VarArrayCreate([1, qCardDelta.RecordCount, 1, 12], varVariant);

  MSExcel.Workbooks.Add(GetMainDir + 'pattern\CardDelta.xlt');
  List := MSExcel.ActiveWorkbook.ActiveSheet;

  //Вывод шапки отчета
  List.Cells[2, 'A'].Value := MainForm.qOrg.FieldbyName('Name').AsString + ' ' + FormatDateTime('dd.mm.yyyy hh:nn', GetSystemDate);
  List.Cells[7, 'C'].Value := TranslateText('за период ') + FormatDateTime('dd.mm.yyyy', deBeginDate.Date) + ' - ' + FormatDateTime('dd.mm.yyyy', deEndDate.Date);
  List.Cells[8, 'C'].Value := TranslateText('по ') + ceOrgName.Text;

  //Загрузка данных в Excel
  CurPos := 1;
  while not qCardDelta.Eof do
  begin
    Range[CurPos, 1] := qCardDelta.FieldByName('Filial_Name').Value;
    Range[CurPos, 2] := qCardDelta.FieldByName('Part').Value;
    Range[CurPos, 3] := qCardDelta.FieldByName('Part_Date').Value;
    Range[CurPos, 4] := qCardDelta.FieldByName('NP_Name').Value;
    Range[CurPos, 5] := qCardDelta.FieldByName('SS_Price').Value;
    Range[CurPos, 6] := qCardDelta.FieldByName('Term_Price').Value * 5 / 6;
    Range[CurPos, 7] := qCardDelta.FieldByName('Rec_Price').Value * 5 / 6;
    Range[CurPos, 8] := qCardDelta.FieldByName('Litr').Value;
    Range[CurPos, 9] := qCardDelta.FieldByName('Weight').Value;
    Range[CurPos, 12] := qCardDelta.FieldByName('Rec_Amount').Value * 5 / 6;
    qCardDelta.Next;
    CurPos := CurPos + 1;
  end;

  if not qCardDelta.IsEmpty then
  begin
    List.Range[List.Cells[11, 'A'], List.Cells[qCardDelta.RecordCount + 10, 'L']].Value := Range;
    List.Range['J11:J' + IntToStr(qCardDelta.RecordCount + 10)].FormulaR1C1 := '=RC[-1]*RC[-5]';
    List.Range['K11:K' + IntToStr(qCardDelta.RecordCount + 10)].FormulaR1C1 := '=RC[-3]*RC[-5]';
    List.Range['M11:M' + IntToStr(qCardDelta.RecordCount + 10)].FormulaR1C1 := '=RC[-1]-RC[-2]-RC[-3]';

    //Вставка итогов
    if not qCardDelta.IsEmpty then
      MSExcel.Run('CreateSubTotal');
  end;
  Progr.Progress := 100;
  Progr.Free;
end;

procedure TTalonPriceReport.MakeReportTalonDK;
var
  CurPos: Integer;
  Progr: TProgrForm;
begin
  //Создание линии прокрутки
  Application.CreateForm(TProgrForm, progr);
  Progr.Progress := 0;
  Progr.Show;
  Progr.Repaint;
  //Создание екземпляра Excel
  if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
    MSExcel := GetActiveOleObject('Excel.Application')
  else MSExcel := CreateOleObject('Excel.Application');
  //Выполнение запроса по выборке данных для отчета
  qTalonDK.Close;
  qTalonDK.ParamByName('DepId').AsInteger := MId;
  qTalonDK.ParamByName('DepInst').AsInteger := MInst;
  qTalonDK.ParamByName('BeginDate').AsDate := deBeginDate.Date;
  qTalonDK.ParamByName('EndDate').AsDate := deEndDate.Date;
  _OpenQuery(qTalonDK);

  Range := VarArrayCreate([1, qTalonDK.RecordCount, 1, 9], varVariant);

  //Загрузка данных в Excel
  CurPos := 1;
  while not qTalonDK.Eof do
  begin
    Range[CurPos, 1] := qTalonDK.FieldByName('Dep_Name').AsVariant;
    Range[CurPos, 2] := qTalonDK.FieldByName('Org_Name').AsVariant;
    Range[CurPos, 3] := qTalonDK.FieldByName('Org_OKPO').AsVariant;
    Range[CurPos, 4] := qTalonDK.FieldByName('BeginDebet').AsVariant;
    Range[CurPos, 5] := qTalonDK.FieldByName('BeginKredit').AsVariant;
    Range[CurPos, 6] := qTalonDK.FieldByName('Debet').AsVariant;
    Range[CurPos, 7] := qTalonDK.FieldByName('Kredit').AsVariant;
    Range[CurPos, 8] := qTalonDK.FieldByName('EndDebet').AsVariant;
    Range[CurPos, 9] := qTalonDK.FieldByName('EndKredit').AsVariant;
    qTalonDK.Next;
    CurPos := CurPos + 1;
  end;

  MSExcel.Workbooks.Add(GetMainDir + 'pattern\TalonDebetKredit.xlt');
  List := MSExcel.ActiveWorkbook.ActiveSheet;

  //Вывод шапки отчета
  List.Cells[2, 'B'] := MainForm.qOrg.FieldbyName('Name').AsString + ' ' + FormatDateTime('dd.mm.yyyy hh:nn', GetSystemDate);
  List.Cells[6, 'C'] := FormatDateTime('dd.mm.yyyy', deBeginDate.Date) + ' - ' + FormatDateTime('dd.mm.yyyy', deEndDate.Date);

  List.Range['A11:I' + IntToStr(qTalonDK.RecordCount + 10)].Value := Range;

  //Вставка итогов
  List.Range['A' + IntToStr(qTalonDK.RecordCount + 11) + ':I' + IntToStr(qTalonDK.RecordCount + 11)].Font.Bold := True;
  List.Range['A' + IntToStr(qTalonDK.RecordCount + 11)].Value := TranslateText('Общий итог');
  List.Range['D' + IntToStr(qTalonDK.RecordCount + 11) + ':I' + IntToStr(qTalonDK.RecordCount + 11)].FormulaR1C1 := '=SubTotal(9,R[-' + IntToStr(qTalonDK.RecordCount + 10) + ']C:R[-1]C)';

  List.Range['A11:I' + IntToStr(qTalonDK.RecordCount + 11)].Borders.Weight := xlThin;
  Progr.Progress := 100;
  Progr.Free;
end;

procedure TTalonPriceReport.FormShow(Sender: TObject);
begin
  Height := 158;
  deBeginDate.Date := Date;
  deEndDate.Date := Date;
  MId := MAIN_ID;
  MInst := Inst;
  ceOrgName.Text := MainForm.qOrg.FieldbyName('Name').AsString;
  case ReportNumber of
    1:
      begin
        Caption := TranslateText('Сводная ведомость по талонам для управления');
        rbPrih.Show;
        rbOut.Show;
      end;
    2: Caption := TranslateText('Ведомость дебиторов и кредиторов по талонам');
    3: Caption := TranslateText('Движение НП по карточкам для управления');
    5:
      begin
        Caption := TranslateText('Наличие талонов в кассе');
        deBeginDate.Hide;
        lBeginDate.Hide;
        lSer.Show;
        eSer.Show;
      end;
    6: Caption := TranslateText('Дельта реализации по талонам');
    7: Caption := TranslateText('Отчет о инкассации с АЗС');
  end;
end;

procedure TTalonPriceReport.ceOrgNameDblClick(Sender: TObject);
var
  vId, vInst, vType: Integer;
  vName: string;
begin
  if ChooseOrg.CaptureOrgT(1, MAIN_ID, INST, 'yyy', vId, vInst, vName, vType) then
  begin
    if not vType in [3, 4] then
      raise Exception.Create(TranslateText('Выбран недопустимый тип организации !'));
    MId := vId;
    MInst := vInst;
    ceOrgName.Text := vName;
  end;
end;

procedure TTalonPriceReport.SpeedButton3Click(Sender: TObject);
begin
  ceOrgName.Clear;
end;

procedure TTalonPriceReport.FormCreate(Sender: TObject);
begin
  inherited;
  LoadSQLByForm(TForm(Self));
end;

procedure TTalonPriceReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DefineRepDates(0,0);
end;

end.
