unit E_CurRate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, CurrEdit, RxLookup, Mask, ToolEdit, Db,
  DBTables, uCommonForm, OilStd,uOilQuery,Ora, uOilStoredProc, MemDS,
  DBAccess;

type
  TE_CurRateForm = class(TCommonForm)
    Panel2: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Panel1: TPanel;
    deDate: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    calcRate: TRxCalcEdit;
    Label3: TLabel;
    qCurrency: TOilQuery;
    qCurrencyID: TFloatField;
    qCurrencyNAME: TStringField;
    q: TOilQuery;
    qWork: TOilQuery;
    cbCurrency: TComboBox;
    procedure TestSave(Id_CurRate: integer; p_Date: TDateTime; p_CurrencyId: integer;
      p_Rate: real; var Id_CurRate_New: integer; var bNext: boolean);
    procedure Save(Id: integer; p_Date: TDateTime; p_CurrencyId: integer; p_Rate: real);
    procedure bbOkClick(Sender: TObject);
  private
  public
    Id: integer;
  end;

var
  E_CurRateForm: TE_CurRateForm;
  bNext: boolean;

procedure AddCurRate;
procedure EditCurRate(p_ID, p_INST: integer);
procedure OpenCurrency(cb: TComboBox; ID: integer=0; CbEnabled: boolean=false);

implementation

{$R *.DFM}

uses E_Var, UDbFunc, Main;

//==============================================================================
procedure AddCurRate;
var
  F: TE_CurRateForm;
begin
  F := TE_CurRateForm.Create(Application);
  F.deDate.Date := Date;
  OpenCurrency(F.cbCurrency, 2, false);
  F.Id := 0;
  F.ShowModal;
  F.Free;
end;
//==============================================================================
procedure EditCurRate(p_ID, p_INST:integer);
var
  F: TE_CurRateForm;
begin
  F := TE_CurRateForm.Create(Application);
  F.q.ParamByName('id').Value := p_ID;
  F.q.ParamByName('inst').Value := p_INST;
  F.q.Open;
  F.deDate.Date := F.q.FieldByName('date_').Value;
  OpenCurrency(F.cbCurrency, F.q.FieldByName('currency_id').AsInteger, false);
  F.calcRate.Value := F.q.FieldByName('rate').AsFloat;
  F.Id := F.q.FieldByName('id').AsInteger;
  F.q.Close;
  F.ShowModal;
  F.Free;
end;
//==============================================================================
// заносимо компонент TComboBox, на якого чіпляти всі курси валют і можемо занести позицію,
// яку нам треба вибрати по замовчуванню
procedure OpenCurrency(cb: TComboBox; ID: integer=0; CbEnabled: boolean=false);
var
  E_CurRateForm: TE_CurRateForm;
begin
  E_CurRateForm := TE_CurRateForm.Create(Application);
  E_CurRateForm.qCurrency.Open;
  cb.Clear;
  while not E_CurRateForm.qCurrency.Eof do
  begin
    cb.Items.Add(E_CurRateForm.qCurrencyName.AsString);
    E_CurRateForm.qCurrency.Next;
  end;
  if ID <> 0 then
  begin
    cb.ItemIndex := ID - 1;
    cb.Text := cb.Items.Strings[ID - 1];
    cb.Enabled := CbEnabled;
    cb.Tag := ID;
  end;
end;
//==============================================================================
procedure TE_CurRateForm.TestSave(Id_CurRate: integer; p_Date: TDateTime; p_CurrencyId: integer; p_Rate: real;
  var Id_CurRate_New: integer; var bNext: boolean);
begin
  bNext := true;
  if p_Rate = 0 then
  begin
    MessageDlg(TranslateText('Не введен курс!'), mtError, [mbOk], 0);
    bNext := false;
  end;
  if (Id_CurRate = 0) and (bNext = true) then
  begin
    if qWork.Active then qWork.Close;
    qWork.ParamByName('currency_id').AsInteger := p_CurrencyId;
    qWork.ParamByName('date_').Value := p_Date;
    qWork.ParamByName('inst').Value := INST;
    qWork.Open;
    if qWork.RecordCount > 0 then
      if qWork.FieldByName('rate').Value = p_Rate then
      begin
        MessageDlg(TranslateText('Курс за ')+ DateToStr(p_Date) +TranslateText(' уже есть и совпадает с вводимым!'), mtError, [mbOk], 0);
        bNext := false;
      end
      else
        if MessageDlg(TranslateText('Курс за ')+ DateToStr(p_Date) +TranslateText(' уже вводился и равен ') + qWork.FieldByName('rate').AsString + #13#10 +
          TranslateText('Отредактировать?'), mtWarning, [mbYes, mbNo], 0) = mrNo then
        begin
          MessageDlg(TranslateText('Редактирование отменено!'), mtError, [mbOk], 0);
          bNext := false;
        end
        else
        begin
          Id_CurRate_New := qWork.FieldByName('Id').AsInteger;
          bNext := true;
        end;
  end;
end;
//==============================================================================
procedure TE_CurRateForm.Save(Id: integer; p_Date: TDateTime; p_CurrencyId: integer; p_Rate: real);
begin
  InsOrUpdRecord('E_CURRENCY_RATE',
    ['ID',             Id,
     'INST',           INST,
     'STATE',          'Y',
     'DATE_',          p_Date,
     'CURRENCY_ID',    p_CurrencyId,
     'RATE',           p_Rate
    ]);
  CommitSqlOra;
end;
//==============================================================================
procedure TE_CurRateForm.bbOkClick(Sender: TObject);
begin
  TestSave(Id, deDate.Date, cbCurrency.Tag, calcRate.Value, Id, bNext);
  if bNext then Save(Id, deDate.Date, cbCurrency.Tag, calcRate.Value)
  else exit;
  if DayOfWeek(deDate.Date) = 6 then
    if MessageDlg(TranslateText('Следующие два дня - выходные. ')+#13#10+TranslateText('Перенести на них курс автоматически?'), mtInformation, [mbYes,mbNo], 0) = mrYes then
    begin
      Id := 0;
      TestSave(Id, deDate.Date+1, cbCurrency.Tag, calcRate.Value, Id, bNext);
      if bNext then Save(Id, deDate.Date+1, cbCurrency.Tag, calcRate.Value);
      Id := 0;
      TestSave(Id, deDate.Date+2, cbCurrency.Tag, calcRate.Value, Id, bNext);
      if bNext then Save(Id, deDate.Date+2, cbCurrency.Tag, calcRate.Value);
    end;
  ModalResult := mrOk;
end;
//==============================================================================

end.
