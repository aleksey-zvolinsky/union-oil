unit Rep_GKSU;

interface

uses uCommonForm, Buttons, DbTables, Dialogs, Forms, StdCtrls, SysUtils, Progr,
  ReportManager, OilStd, Classes, Ora, MemTable, Db, uOilQuery, uOilStoredProc,
  Controls{$IFDEF VER150},Variants{$ENDIF};

procedure GKSU_opt(var RM: TRepManagerForm; Progr: TProgrForm; List: Variant);

implementation

uses ExFunc, ExcelFunc, UDbFunc, UDbPlan, MoneyFunc, PrihCardRef;

const
      NP_NAME         = 'A';
      NB_REAL_TONN    = 'B';
      NB_REAL_SUMM    = 'C';
      NB_REAL_PRICE   = 'D';
      AZS_TALON_TONN  = 'E';
      AZS_TALON_SUMM  = 'F';
      AZS_TALON_PRICE = 'G';
      AZS_CARD_TONN   = 'H';
      AZS_CARD_SUMM   = 'I';
      AZS_CARD_PRICE  = 'J';
      AZS_VED_TONN    = 'K';
      AZS_VED_SUMM    = 'L';
      AZS_VED_PRICE   = 'M';
      TOTAL_TONN      = 'N';
      TOTAL_SUMM      = 'O';
      TOTAL_PRICE     = 'P';


procedure GKSU_opt(var RM: TRepManagerForm; Progr: TProgrForm; List: Variant);
var q:TOilQuery;
    delta, step: Real;
    counter : integer;
    sFrmt, sFrmt_total: string;
begin
  q := DBPlan.qGKSU_opt;
  try
    if q.Active then q.Close;
    progr.Progress := 1;
    fRecalc; // перерахунок карток
    DefineRepDates(RM.From_date2.Date,RM.To_date2.Date);
    progr.Progress := 5;

    if RM.cbxOhneKommision.Checked then  // checked = не включати партії ТД, включати залишки (ТД%/И) 
      q.ParamByName('OhneCommision').AsInteger := 1
    else
      q.ParamByName('OhneCommision').AsInteger := 0;

    _OpenQueryPar(q, ['BeginDate',RM.From_date2.Date,
                      'EndDate',  RM.To_date2.Date]);

    PutTitle(List);
    List.Cells[5,'I'] := DateToStr(RM.From_date2.Date) + ' - ' + DateToStr(RM.To_date2.Date);
    if RM.cbxOhneKommision.Checked then
      List.Cells[6,'I'] := '(' + RM.cbxOhneKommision.Caption + ')';  // '(без комісії)'

    counter := 11;
    If q.RecordCount > 0 then
      step := (100-5)/q.RecordCount
    else
      step := 0;
    delta := progr.Progress + step;
    DecimalSeparator := '.';
    sFrmt := '=IF(%s%d=0,0,%s%1:d/%0:s%d)';
    sFrmt_total := '=SUM(%s%d+%s%1:d+%3:s%1:d+%4:s%1:d)';
    q.First;
    repeat
      progr.Progress := Round(delta);
      List.Cells[counter,NP_NAME] := q.FieldByName('np_grp_name').AsString;
      List.Cells[counter,NB_REAL_TONN]  := q.FieldByName('nb_tonn').AsFloat;
      List.Cells[counter,NB_REAL_SUMM]  := q.FieldByName('nb_summa').AsFloat;
      List.Cells[counter,NB_REAL_PRICE] := Format(sFrmt,[NB_REAL_TONN,counter,NB_REAL_SUMM]);
      List.Cells[counter,AZS_TALON_TONN]  := q.FieldByName('talon_tonn').AsFloat;
      List.Cells[counter,AZS_TALON_SUMM]  := q.FieldByName('talon_summa').AsFloat;
      List.Cells[counter,AZS_TALON_PRICE] := Format(sFrmt,[AZS_TALON_TONN,counter,AZS_TALON_SUMM]);
      List.Cells[counter,AZS_CARD_TONN]  := q.FieldByName('card_tonn').AsFloat;
      List.Cells[counter,AZS_CARD_SUMM]  := q.FieldByName('card_summa').AsFloat;
      List.Cells[counter,AZS_CARD_PRICE] := Format(sFrmt,[AZS_CARD_TONN,counter,AZS_CARD_SUMM]);
      List.Cells[counter,AZS_VED_TONN]  := q.FieldByName('ved_tonn').AsFloat;
      List.Cells[counter,AZS_VED_SUMM]  := q.FieldByName('ved_summa').AsFloat;
      List.Cells[counter,AZS_VED_PRICE] := Format(sFrmt,[AZS_VED_TONN,counter,AZS_VED_SUMM]);
      List.Cells[counter,TOTAL_TONN]  := Format(sFrmt_total,
                                        [NB_REAL_TONN,counter,AZS_TALON_TONN,AZS_CARD_TONN,AZS_VED_TONN]);
      List.Cells[counter,TOTAL_SUMM]  := Format(sFrmt_total,
                                        [NB_REAL_SUMM,counter,AZS_TALON_SUMM,AZS_CARD_SUMM,AZS_VED_SUMM]);
      List.Cells[counter,TOTAL_PRICE] := Format(sFrmt,[TOTAL_TONN,counter,TOTAL_SUMM]);

      q.Next;
      inc(counter);
      List.Rows[counter].EntireRow.Insert;
      delta := delta + step;
    until q.Eof;
    List.Cells[counter+5,TOTAL_SUMM] := Format('= %s%d/1000/%3.1f',
                                               [TOTAL_SUMM,counter+3,TAX_RATE(RM.To_date2.Date)+1]);
  finally
    if q.Active then q.Close;
    GetFormatSettings;  //resets DecimalSeparator to initial value
  end;
end;

end.
 