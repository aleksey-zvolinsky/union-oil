unit PrintCardPinCode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, ToolEdit, Mask, StdCtrls, ActnList, Menus, Db, MemDS, DBAccess,
  Ora, uOilQuery, RXCtrls, Grids, DBGridEh, Buttons, ExtCtrls, uCommonForm,
  Printers;

type
  TPrintCardPinCodeForm = class(TBaseForm)
    Label1: TLabel;
    eCardS: TEdit;
    eCardPo: TEdit;
    Label2: TLabel;
    ceToName: TComboEdit;
    lClient: TLabel;
    SpeedButton3: TSpeedButton;
    deS: TDateEdit;
    dePo: TDateEdit;
    Label4: TLabel;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    qORG_ID: TFloatField;
    qORG_NAME: TStringField;
    qCARD_NUMBER: TFloatField;
    qPIN_COD: TStringField;
    qDATA_VYDACHI: TDateTimeField;
    N11: TMenuItem;
    N1: TMenuItem;
    qPIN_COD_REAL: TStringField;
    Label5: TLabel;
    LCount: TLabel;
    PrinterSD: TPrinterSetupDialog;
    BitBtn1: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ceToNameButtonClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure eCardSKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure GetText(St: TStringList; card_number, pin_cod_real, org_name: string;
      iBlank: integer; bLast: boolean = false);
    function TestRecord(card_number, pin_cod_real, org_name: string): boolean;
    procedure Print(bAll: boolean = true);
    procedure N1Click(Sender: TObject);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
  private
    To_ID, To_INST: integer;
  public
  end;

var
  PrintCardPinCodeForm: TPrintCardPinCodeForm;

implementation

Uses Main, OilStd, ExFunc,ChooseOrg, uDBFunc, uStart, Progr;

{$R *.DFM}

//==============================================================================
procedure TPrintCardPinCodeForm.SpeedButton1Click(Sender: TObject);
begin
  eCardS.Text := '';
  eCardPo.Text := '';
end;
//==============================================================================
procedure TPrintCardPinCodeForm.SpeedButton2Click(Sender: TObject);
begin
  deS.Date := 0;
  dePo.Date := 0;
end;
//==============================================================================
procedure TPrintCardPinCodeForm.ceToNameButtonClick(Sender: TObject);
var
  vId, vInst: integer;
  vName: string;
begin
  if ChooseOrg.CaptureOrg(3, MAIN_ID, INST, 'yyy', vId, vInst, vName) then
  begin
    To_ID := vId;
    To_INST := vInst;
    ceToName.Text := vName;
  end;
end;
//==============================================================================
procedure TPrintCardPinCodeForm.bbClearClick(Sender: TObject);
begin
  SpeedButton1Click(nil);
  SpeedButton2Click(nil);
  SpeedButton3Click(nil);
end;
//==============================================================================
procedure TPrintCardPinCodeForm.SpeedButton3Click(Sender: TObject);
begin
  ceToName.Text := '';
  To_ID := 0;
  To_INST := 0;
end;
//==============================================================================
procedure TPrintCardPinCodeForm.bbSearchClick(Sender: TObject);
begin
  q.DisableControls;
  q.Close;
  q.SQL.Text := q.BaseSQL;
  // фільтр по карті
  if (eCardS.Text <> '') and (eCardPo.Text <> '') then
    q.AddWhere('card_number >= '+ eCardS.Text +' and card_number <= '+ eCardPo.Text)
  else
    if eCardS.Text <> '' then q.AddWhere('card_number = '+ eCardS.Text)
    else
      if eCardPo.Text <> '' then q.AddWhere('card_number = '+ eCardPo.Text);
  // фільтр по організації
  if (To_ID <> 0) and (To_INST <> 0) then
    q.AddWhere('org_id = '+ IntToStr(To_ID) +' and org_inst = '+ IntToStr(To_INST));
  // фільтр по датам
  if (deS.Date <> 0) then q.AddWhere('data_vydachi >= to_date('''+ deS.Text +''')');
  if (dePo.Date <> 0) then q.AddWhere('data_vydachi <= to_date('''+ dePo.Text +''')');
  _OpenQuery(q);
  q.EnableControls;
end;
//==============================================================================
procedure TPrintCardPinCodeForm.eCardSKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', #8]) then key := #0;
end;
//==============================================================================
procedure TPrintCardPinCodeForm.FormShow(Sender: TObject);
begin
  inherited;
  deS.Date := now - 30;
  dePo.Date := now;
  pPrint.Visible := true;
  q.MacroByName('card_user').Value := AdmSettings.Get('CARD_USER');
  bbSearchClick(nil);
end;
//==============================================================================
procedure TPrintCardPinCodeForm.GetText(St: TStringList; card_number, pin_cod_real, org_name: string;
  iBlank: integer; bLast: boolean = false);
var
  sOrg: string;
  iRecord: integer;
  //****************************************************************************
  procedure GetLine(iLine: integer);
  var
    i: integer;
  begin
    for i := 0 to iLine - 1 do
      St.Add(' ');
  end;
  //****************************************************************************
begin
  if TestRecord(card_number, pin_cod_real, org_name) then
  begin
    if iBlank = 1 then GetLine(4)
    else GetLine(3);      
    sOrg := trim(org_name) +'                                                                                            ';
    if Length(trim(org_name)) >= 22 then
      St.Add('         '+ copy(sOrg, 1, 22) +'          смарт-карта '+ card_number)
    else
      St.Add('         '+ copy(sOrg, 1, Length(trim(org_name)) + 4 + (22 - Length(trim(org_name))) * 2) +
        '       смарт-карта '+ card_number);
    St.Add('         '+ copy(sOrg, 23, 22));
    St.Add('         '+ copy(sOrg, 45, 22));
    St.Add('                                                                 ' +
      '                                               '+ pin_cod_real);
    if not bLast then iRecord := 10
    else iRecord := 0;
    if (iBlank mod 3 = 0) then iRecord := iRecord - 3;
    if (iBlank mod 6 = 0) then iRecord := iRecord + 1;
    GetLine(iRecord);
  end
  else
    if MessageDlg(TranslateText('Продолжить печать?'), mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      raise Exception.Create(TranslateText('  Отменено пользователем.'));
end;
//==============================================================================
function TPrintCardPinCodeForm.TestRecord(card_number, pin_cod_real, org_name: string): boolean;
begin
  result := true;
  if (card_number = '') or (pin_cod_real = '') or (org_name = '') or
    not (length(pin_cod_real) in [4, 5]) then
  begin
    MessageDlg(TranslateText('Карта ') + card_number + TranslateText(' для организации ') + org_name +
      TranslateText(' не будет печататься!') + #13#10 +
      TranslateText('Проверьте, чтобы карта была привязана к клиенту Ойла и чтобы ПИН-код был четырёх или пяти значный.'), mtError, [mbOk], 0);
    result := false;
  end;
end;
//==============================================================================
procedure TPrintCardPinCodeForm.N11Click(Sender: TObject);
begin
  Print(false);
end;
//==============================================================================
procedure TPrintCardPinCodeForm.N1Click(Sender: TObject);
begin
  if MessageDlg(TranslateText('Вы уверенны в том, что нужно печатать все ПИН-конверты?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Print;
end;
//==============================================================================
procedure TPrintCardPinCodeForm.Print(bAll: boolean = true);
var
  St: TStringList;
  ProgressIncrement, i: integer;
  ProgrForm: TProgrForm;
  MyFile: TextFile;
begin
  try
    if q.IsEmpty then exit;
    q.DisableControls;

    Application.CreateForm(TProgrForm, ProgrForm);
    ProgrForm.Show;
    ProgrForm.Refresh;
    if not bAll then
      if DBGrid1.SelectedRows.Count > 0 then ProgressIncrement := Round((100 - 30)/DBGrid1.SelectedRows.Count)
      else ProgressIncrement := Round(100 - 30)
    else ProgressIncrement := Round((100 - 30)/q.RecordCount);
    if ProgressIncrement = 0 then ProgressIncrement := 1;
    ProgrForm.AddProgress(1);

    St := TStringList.Create;
    if not bAll then
    begin
      if DBGrid1.SelectedRows.Count > 0 then
      begin
        for i := 0 to DBGrid1.SelectedRows.Count-1 do
        begin
          q.GotoBookmark(pointer(DBGrid1.SelectedRows[i]));
          GetText(St, q.FieldByName('card_number').AsString, q.FieldByName('pin_cod_real').AsString,
            q.FieldByName('org_name').AsString, i+1, DBGrid1.SelectedRows.Count-1 = i);
          ProgrForm.AddProgress(ProgressIncrement);
        end;
      end
      else
        GetText(St, q.FieldByName('card_number').AsString, q.FieldByName('pin_cod_real').AsString,
          q.FieldByName('org_name').AsString, 1, true);
    end
    else
    begin
      q.First;
      i := 0;
      while not q.Eof do
      begin
        GetText(St, q.FieldByName('card_number').AsString, q.FieldByName('pin_cod_real').AsString,
          q.FieldByName('org_name').AsString, i+1, q.RecordCount-1 = i);
        ProgrForm.AddProgress(ProgressIncrement);
        i := i + 1;
        q.Next;
      end;
    end;
    ProgrForm.AddProgress(ProgressIncrement);

    // проводимо друк файлу
    AssignPrn(MyFile);
    Rewrite(MyFile);
    Printer.Canvas.Font.Size := 12;
    Writeln(MyFile, St.Text);
    System.CloseFile(MyFile);

    St.Free;
    q.EnableControls;

    ProgrForm.AddProgress(100);
    ProgrForm.Free;
  except on E:Exception do
    begin
      ProgrForm.Free;
      q.EnableControls;
      raise Exception.Create(TranslateText('Ошибка формирования документа:') + #13#10 + E.Message);
    end;
  end;
end;
//==============================================================================
procedure TPrintCardPinCodeForm.DBGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if q.IsEmpty then exit;
  LCount.Caption := IntToStr(DBGrid1.SelectedRows.Count);
end;
//==============================================================================
procedure TPrintCardPinCodeForm.BitBtn1Click(Sender: TObject);
begin
  PrinterSD.Execute;
end;
//==============================================================================

end.
