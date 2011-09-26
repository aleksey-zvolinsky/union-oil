unit AddWayBillOper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, CurrEdit, StdCtrls, Mask, ToolEdit, RxLookup, Buttons,
  uCommonForm,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess, ExtCtrls;

type
  TAddWayBillOperForm = class(TCommonForm)
    RxLookupEdit1: TRxLookupEdit;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label2: TLabel;
    ds: TOraDataSource;
    q: TOilQuery;
    qID: TFloatField;
    qNAME: TStringField;
    Label3: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    pBottom: TPanel;
    pBtn: TPanel;
    bbOk2: TBitBtn;
    bbCancel2: TBitBtn;

    procedure FormInit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbOkClick(Sender: TObject);

  private
    { Private declarations }
  public
    // Входные переменные
    InOperID: integer;
    InLitres: real;
    InKilometers: real;

    // Выходные переменные
    OutOperID: integer;
    OutLitres: real;
    OutKilometers: real;
    OutOperName: string;
  end;

var
  AddWayBillOperForm: TAddWayBillOperForm;

implementation

{$R *.DFM}

procedure TAddWayBillOperForm.FormInit;
begin
  // Открываем запрос
  q.Open;

  // Определяем название группы затрат
  if InOperID = 0 then
  begin
    with q do
    begin
      // Устанаваливаем курсор в таблице
      Locate('ID', 2, []);

      // Получаем название группы затрат
      RxLookupEdit1.Text:= qNAME.AsString;
    end;

    // Устанавливаем выходные параметры
    OutOperID:= 2;
  end
  else
  begin
    with q do
    begin
      // Устанаваливаем курсор в таблице
      Locate('ID', InOperID, []);

      // Получаем название группы затрат
      RxLookupEdit1.Text:= qNAME.AsString;
    end;

    // Устанавливаем выходные параметры
    OutOperID:= InOperID;
  end;

  // Определяем количество литров
  if InLitres = 0 then
  begin
    CurrencyEdit1.Value:= 0;
    OutLitres:= 0;
  end
  else
  begin
    CurrencyEdit1.Value:= InLitres;
    OutLitres:= InLitres;
  end;

  // Определяем количество километров
  if InKilometers = 0 then
  begin
    CurrencyEdit2.Value:= 0;
    OutKilometers:= 0;
  end
  else
  begin
    CurrencyEdit2.Value:= InKilometers;
    OutKilometers:= InKilometers;
  end;

  // Сбрасываем входные параметры
  InOperID:= 0;
  InLitres:= 0;
  InKilometers:= 0;

  // Делаем активным поле для ввода кол-ва литров
  ActiveControl:= CurrencyEdit1;
end;

procedure TAddWayBillOperForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q.Close;
end;

procedure TAddWayBillOperForm.bbOkClick(Sender: TObject);
begin
  // Проверки - все ли поля заполнены
  if RxLookupEdit1.Text = '' then
  begin
    MessageDlg(TranslateText(' Выберите, пожалуйста, группу затрат!'), mtWarning, [mbOK], 0);
    ActiveControl:= RxLookupEdit1;
    Exit;
  end;

  if CurrencyEdit1.Text = '' then
  begin
    MessageDlg(TranslateText(' Введите, пожалуйста, количество литров!'), mtWarning, [mbOK], 0);
    ActiveControl:= CurrencyEdit1;
    Exit;
  end;

  if CurrencyEdit1.Value < 0 then
  begin
    MessageDlg(TranslateText(' Количество литров должно быть больше нуля!'), mtWarning, [mbOK], 0);
    ActiveControl:= CurrencyEdit1;
    Exit;
  end;

{
 if CurrencyEdit2.Text = '' then
  begin
   MessageDlg(' Введите, пожалуйста, количество пройденных километров!', mtWarning, [mbOK], 0);
   ActiveControl:= CurrencyEdit2;
   Exit;
  end;
}  

  OutOperID:= StrToInt(RxLookupEdit1.LookupValue);
  OutOperName:= RxLookupEdit1.Text;
  OutLitres:= CurrencyEdit1.Value;
  OutKilometers:= CurrencyEdit2.Value;

  ModalResult:= mrOK;
end;

end.
