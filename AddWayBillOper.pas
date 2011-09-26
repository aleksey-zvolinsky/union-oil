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
    // ������� ����������
    InOperID: integer;
    InLitres: real;
    InKilometers: real;

    // �������� ����������
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
  // ��������� ������
  q.Open;

  // ���������� �������� ������ ������
  if InOperID = 0 then
  begin
    with q do
    begin
      // �������������� ������ � �������
      Locate('ID', 2, []);

      // �������� �������� ������ ������
      RxLookupEdit1.Text:= qNAME.AsString;
    end;

    // ������������� �������� ���������
    OutOperID:= 2;
  end
  else
  begin
    with q do
    begin
      // �������������� ������ � �������
      Locate('ID', InOperID, []);

      // �������� �������� ������ ������
      RxLookupEdit1.Text:= qNAME.AsString;
    end;

    // ������������� �������� ���������
    OutOperID:= InOperID;
  end;

  // ���������� ���������� ������
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

  // ���������� ���������� ����������
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

  // ���������� ������� ���������
  InOperID:= 0;
  InLitres:= 0;
  InKilometers:= 0;

  // ������ �������� ���� ��� ����� ���-�� ������
  ActiveControl:= CurrencyEdit1;
end;

procedure TAddWayBillOperForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q.Close;
end;

procedure TAddWayBillOperForm.bbOkClick(Sender: TObject);
begin
  // �������� - ��� �� ���� ���������
  if RxLookupEdit1.Text = '' then
  begin
    MessageDlg(TranslateText(' ��������, ����������, ������ ������!'), mtWarning, [mbOK], 0);
    ActiveControl:= RxLookupEdit1;
    Exit;
  end;

  if CurrencyEdit1.Text = '' then
  begin
    MessageDlg(TranslateText(' �������, ����������, ���������� ������!'), mtWarning, [mbOK], 0);
    ActiveControl:= CurrencyEdit1;
    Exit;
  end;

  if CurrencyEdit1.Value < 0 then
  begin
    MessageDlg(TranslateText(' ���������� ������ ������ ���� ������ ����!'), mtWarning, [mbOK], 0);
    ActiveControl:= CurrencyEdit1;
    Exit;
  end;

{
 if CurrencyEdit2.Text = '' then
  begin
   MessageDlg(' �������, ����������, ���������� ���������� ����������!', mtWarning, [mbOK], 0);
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
