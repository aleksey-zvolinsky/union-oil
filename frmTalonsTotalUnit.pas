unit frmTalonsTotalUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ActiveX,ComObj, DBTables, StdCtrls, ExtCtrls, Mask, ToolEdit, Buttons,
  uCommonForm,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess{$IFDEF VER150},Variants{$ENDIF};

type
  TfrmTalonsTotal = class(TCommonForm)
    GroupBox1: TGroupBox;
    deCurDate: TDateEdit;
    pnlButtons: TPanel;
    pnlCenter: TPanel;
    cbBadSer: TCheckBox;
    qTalonRest: TOilQuery;
    bbtClose: TBitBtn;
    bbtPrint: TBitBtn;
    procedure bbtPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
  end;

var
  frmTalonsTotal: TfrmTalonsTotal;

implementation

uses UDbFunc, Main, ExFunc;

{$R *.DFM}

var
  MSExcel, List, Range: Variant;
  Unknown: iUnknown;

//==============================================================================
procedure TfrmTalonsTotal.bbtPrintClick(Sender: TObject);
var
  CurPos: Integer;
begin
  try
    if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
      MSExcel := GetActiveOleObject('Excel.Application')
    else MSExcel := CreateOleObject('Excel.Application');

    qTalonRest.Close;
    qTalonRest.ParamByName('CurDate').AsDate := deCurDate.Date;
    qTalonRest.Open;

    Range := VarArrayCreate([1, qTalonRest.RecordCount, 1, qTalonRest.FieldCount + 21], varVariant);
    MSExcel.Workbooks.Add(GetMainDir+'pattern\TalonsTotalRest.xlt');
    List := MSExcel.ActiveWorkbook.ActiveSheet;

    List.Cells[1, 1] := GetOrgName(Main.Main_Id, Main.Inst) + '; ' + DateToStr(Date) + '; ' + TimeToStr(Time);
    List.Cells[5, 'I'] := TranslateText('Сводная таблица по движению талонов состоянием на ') + FormatDateTime('dd.mm.yyyy', deCurDate.Date) + TranslateText('г. по предприятиям системы');

    CurPos := 1;
    while not qTalonRest.Eof do
    begin
      Range[CurPos, 1] := qTalonRest.FieldByName('Dep_Name').AsVariant;
      Range[CurPos, 2] := qTalonRest.FieldByName('Nominal').AsVariant;
      Range[CurPos, 3] := qTalonRest.FieldByName('Rest_A76').AsVariant;
      Range[CurPos, 4] := qTalonRest.FieldByName('Rest_A92').AsVariant;
      Range[CurPos, 5] := qTalonRest.FieldByName('Rest_A95').AsVariant;
      Range[CurPos, 6] := qTalonRest.FieldByName('Rest_A98').AsVariant;
      Range[CurPos, 7] := qTalonRest.FieldByName('Rest_DT').AsVariant;
      Range[CurPos, 8] := qTalonRest.FieldByName('Rest_Gaz').AsVariant;
      Range[CurPos, 9] := qTalonRest.FieldByName('Rest_All').AsVariant;

      Range[CurPos, 17] := qTalonRest.FieldByName('ClientRest_A76').AsVariant;
      Range[CurPos, 18] := qTalonRest.FieldByName('ClientRest_A92').AsVariant;
      Range[CurPos, 19] := qTalonRest.FieldByName('ClientRest_A95').AsVariant;
      Range[CurPos, 20] := qTalonRest.FieldByName('ClientRest_A98').AsVariant;
      Range[CurPos, 21] := qTalonRest.FieldByName('ClientRest_DT').AsVariant;
      Range[CurPos, 22] := qTalonRest.FieldByName('ClientRest_Gaz').AsVariant;
      Range[CurPos, 23] := qTalonRest.FieldByName('ClientRest_All').AsVariant;

      Range[CurPos, 31] := qTalonRest.FieldByName('Spis_A76').AsVariant;
      Range[CurPos, 32] := qTalonRest.FieldByName('Spis_A92').AsVariant;
      Range[CurPos, 33] := qTalonRest.FieldByName('Spis_A95').AsVariant;
      Range[CurPos, 34] := qTalonRest.FieldByName('Spis_A98').AsVariant;
      Range[CurPos, 35] := qTalonRest.FieldByName('Spis_DT').AsVariant;
      Range[CurPos, 36] := qTalonRest.FieldByName('Spis_Gaz').AsVariant;
      Range[CurPos, 37] := qTalonRest.FieldByName('Spis_All').AsVariant;

      Range[CurPos, 45] := qTalonRest.FieldByName('DepRest_A76').AsVariant;
      Range[CurPos, 46] := qTalonRest.FieldByName('DepRest_A92').AsVariant;
      Range[CurPos, 47] := qTalonRest.FieldByName('DepRest_A95').AsVariant;
      Range[CurPos, 48] := qTalonRest.FieldByName('DepRest_A98').AsVariant;
      Range[CurPos, 49] := qTalonRest.FieldByName('DepRest_DT').AsVariant;
      Range[CurPos, 50] := qTalonRest.FieldByName('DepRest_Gaz').AsVariant;
      Range[CurPos, 51] := qTalonRest.FieldByName('DepRest_All').AsVariant;
      qTalonRest.Next;
      CurPos := CurPos + 1;
    end;
    
    List.Range['A11:BF' + IntToStr(qTalonRest.RecordCount + 10)].Value := Range;
    List.Range['J11:J' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-8]';
    List.Range['K11:K' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-9]';
    List.Range['L11:L' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-10]';
    List.Range['M11:M' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-11]';
    List.Range['N11:N' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-12]';
    List.Range['O11:O' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-13]';
    List.Range['P11:P' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-14]';
    List.Range['X11:X' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-22]';
    List.Range['Y11:Y' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-23]';
    List.Range['Z11:Z' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-24]';
    List.Range['AA11:AA' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-25]';
    List.Range['AB11:AB' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-26]';
    List.Range['AC11:AC' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-27]';
    List.Range['AD11:AD' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-28]';
    List.Range['AL11:AL' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-36]';
    List.Range['AM11:AM' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-37]';
    List.Range['AN11:AN' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-38]';
    List.Range['AO11:AO' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-39]';
    List.Range['AP11:AP' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-40]';
    List.Range['AQ11:AQ' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-41]';
    List.Range['AR11:AR' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-42]';

    List.Range['AZ11:AZ' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-50]';
    List.Range['BA11:BA' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-51]';
    List.Range['BB11:BB' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-52]';
    List.Range['BC11:BC' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-53]';
    List.Range['BD11:BD' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-54]';
    List.Range['BE11:BE' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-55]';
    List.Range['BF11:BF' + IntToStr(qTalonRest.RecordCount + 10)].FormulaR1C1 := '=RC[-7]*RC[-56]';
    if not qTalonRest.IsEmpty then MSExcel.Run('CreateSubTotal');
    MSExcel.Visible := True;
    MSExcel.ScreenUpdating := True;
  except On E:Exception Do
    begin
      MSExcel.Visible := True;
      MSExcel.ScreenUpdating := True;
    end;
  end;
end;
//==============================================================================
procedure TfrmTalonsTotal.FormShow(Sender: TObject);
begin
  deCurDate.Date := Date;
end;
//==============================================================================

end.
