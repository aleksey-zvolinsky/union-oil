unit AutoIncome;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, RXDBCtrl, DBCtrls, CurrEdit,
  Db, DBTables, AutoIncomeRef, uCommonForm,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess;

type
  TAutoIncomeForm = class(TCommonForm)
    ButtonPanel: TPanel;
    bbOk: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    ceAuto: TComboEdit;
    SpeedButton5: TSpeedButton;
    Label3: TLabel;
    ceEmploy: TComboEdit;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    ceNPGroup: TComboEdit;
    Label5: TLabel;
    SpeedButton4: TSpeedButton;
    CurrencyEdit3: TCurrencyEdit;
    Label8: TLabel;
    Label6: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    Label7: TLabel;
    qTemp: TOilQuery;
    Edit1: TEdit;
    deDate: TDateEdit;
    GroupBox4: TGroupBox;
    Label9: TLabel;

    procedure ceNPGroupButtonClick(Sender: TObject);
    procedure ceAutoButtonClick(Sender: TObject);
    procedure ceEmployButtonClick(Sender: TObject);

    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);

    procedure bbOkClick(Sender: TObject);
    procedure deDateChange(Sender: TObject);
  private
    { Private declarations }
  public
    SearchEmpId, SearchEmpInst: integer;
    SearchAutoId, SearchAutoInst: integer;
    SearchNPType: integer;
    ShowOnly: boolean;

    procedure AddIncome;
    procedure EditIncome(MasterForm: TAutoIncomeRefForm);
  end;

var
  AutoIncomeForm: TAutoIncomeForm;

implementation

{$R *.DFM}

uses EmpRef, AutoRef, ExFunc, Main, OilStd, NPTypeRef;

procedure TAutoIncomeForm.AddIncome;
begin
 deDate.Date:= Date;
end;

procedure TAutoIncomeForm.EditIncome(MasterForm: TAutoIncomeRefForm);
const GetEmployName = 'SELECT employ.f_name||'' ''||SUBSTR(employ.i_name, 1, 1)||''.''||SUBSTR(employ.o_name, 1, 1)||''.'' ' +
                      'FROM oil_employ employ ' +
                      'WHERE id = %d ' +
                      'AND inst = %d';
      GetAutoInf = 'SELECT auto.numb, autotype.auto_group ' +
                   'FROM oil_auto auto, oil_auto_type autotype ' +
                   'WHERE auto.auto_type_id = autotype.id ' +
                   'AND auto.id = %d ' +
                   'AND auto.inst = %d';
      GetNPType = 'SELECT name ' +
                  'FROM oil_np_type ' +
                  'WHERE id = %d';
begin
 // Получаем данные для их визуализации
 // Данные по водителю
 SearchEmpId:= MasterForm.qEMPLOY_ID.AsInteger;
 SearchEmpInst:= MasterForm.qEMPLOY_INST.AsInteger;
 with qTemp do
  begin
   Close;
   SQL.Text:= Format(GetEmployName, [SearchEmpId, SearchEmpInst]);
   Open;
   ceEmploy.Text:= Fields[0].AsString;
  end;

 // Данные по техническому средству
 SearchAutoId:= MasterForm.qAUTO_ID.AsInteger;
 SearchAutoInst:= MasterForm.qAUTO_INST.AsInteger;
 with qTemp do
  begin
   Close;
   SQL.Text:= Format(GetAutoInf, [SearchAutoId, SearchAutoInst]);
   Open;
   ceAuto.Text:= Fields[0].AsString;
  end;

  // Данные по типу нефтепродукта
  SearchNPType:= MasterForm.qNP_TYPE.AsInteger;
  with qTemp do
   begin
    Close;
    SQL.Text:= Format(GetNPType, [SearchNPType]);
    Open;
    ceNPGroup.Text:= Fields[0].AsString;
   end;

  deDate.Date:= MasterForm.qINCOME_DATE.AsDateTime;
  Edit1.Text:= MasterForm.qBILL_NUMBER.AsString;
  CurrencyEdit3.Value:= MasterForm.qPRICE.AsFloat;
  CurrencyEdit1.Value:= MasterForm.qLITRES.AsFloat;
  CurrencyEdit2.Value:= MasterForm.qTONNS.AsFloat;

  // Проверяем текущий режим
  if ShowOnly then
   begin
    // Режим "только просмотр"
//    Self.Caption:= Self.Caption + ' - просмотр документа';
    GroupBox1.Enabled:= false;
    GroupBox2.Enabled:= false;
    GroupBox3.Enabled:= false;
   end
  else
   begin
    // Режим "редактирование"
//    Self.Caption:= Self.Caption + ' - редактирование документа';
   end;
end;

procedure TAutoIncomeForm.ceNPGroupButtonClick(Sender: TObject);
var TempForm: TNPTypeRefForm;
begin
 TempForm:= TNPTypeRefForm.Create(Application);

 try
  if TempForm.ShowModal = mrOk Then
   begin
    ceNPGroup.Text:= TempForm.qName.AsString;
    SearchNPType:= TempForm.qId.AsInteger;
   end;

 finally
  TempForm.Free;
 end;
end;

procedure TAutoIncomeForm.ceAutoButtonClick(Sender: TObject);
var TempForm: TAutoRefForm;
begin
 TempForm:= TAutoRefForm.Create(Application);

 try
  if TempForm.ShowModal = mrOk then
   if not(TempForm.q.eof) then
    begin
     SearchAutoId:= TempForm.qID.AsInteger;
     SearchAutoInst:= TempForm.qINST.AsInteger;
     ceAuto.Text:= TempForm.qNUMB.AsString;

     SearchEmpId:= TempForm.qEMPLOY_ID.AsInteger;
     SearchEmpInst:= TempForm.qEMPLOY_INST.AsInteger;
     ceEmploy.Text:= TempForm.qFULLNAME.AsString;
    end;

 finally
  TempForm.free;
 end;
end;

procedure TAutoIncomeForm.ceEmployButtonClick(Sender: TObject);
var TempForm: TEmpRefForm;
begin
 TempForm:= TEmpRefForm.Create(Application);

 try
  if TempForm.ShowModal = mrOk then
   if not(TempForm.q.eof) then
    begin
     SearchEmpId:= TempForm.qID.AsInteger;
     SearchEmpInst:= TempForm.qINST.AsInteger;
     ceEmploy.Text:= TempForm.qF_NAME.AsString + ' ' +
                     TempForm.qI_NAME.AsString[1] + '. ' +
                     TempForm.qO_NAME.AsString[1] + '.';
    end;

 finally
  TempForm.free;
 end;
end;

procedure TAutoIncomeForm.SpeedButton4Click(Sender: TObject);
begin
 ceNPGroup.Text:= '';
 SearchNPType:= -1;
end;

procedure TAutoIncomeForm.SpeedButton5Click(Sender: TObject);
begin
 ceAuto.Text:= '';
 SearchAutoId:= -1;
 SearchAutoInst:= -1;
end;

procedure TAutoIncomeForm.SpeedButton3Click(Sender: TObject);
begin
 ceEmploy.Text:= '';
 SearchEmpId:= -1;
 SearchEmpInst:= -1;
end;

procedure TAutoIncomeForm.bbOkClick(Sender: TObject);
begin
 // Проверки - все ли поля заполнены
 if Edit1.Text = '' then
  begin
   MessageDlg(TranslateText(' Введите, пожалуйста, номер документа!'), mtWarning, [mbOK], 0);
   ActiveControl:= Edit1;
   Exit;
  end;

 if deDate.Date = 0 then
  begin
   MessageDlg(TranslateText(' Введите, пожалуйста, дату документа!'), mtWarning, [mbOK], 0);
   ActiveControl:= deDate;
   Exit;
  end;

 if ceNPGroup.Text = '' then
  begin
   MessageDlg(TranslateText(' Выберите, пожалуйста, нефтепродукт!'), mtWarning, [mbOK], 0);
   ActiveControl:= ceNPGroup;
   Exit;
  end;

 if ceAuto.Text = '' then
  begin
   MessageDlg(TranslateText(' Выберите, пожалуйста, техническое средство!'), mtWarning, [mbOK], 0);
   ActiveControl:= ceAuto;
   Exit;
  end;

 if (ceEmploy.Text = '') or (SearchEmpId = 0) then
  begin
   MessageDlg(TranslateText(' Выберите, пожалуйста, ФИО водителя (ФИО МОЛ)!'), mtWarning, [mbOK], 0);
   ActiveControl:= ceEmploy;
   Exit;
  end;

 if CurrencyEdit3.Text = '' then
  begin
   MessageDlg(TranslateText(' Введите, пожалуйста, цену!'), mtWarning, [mbOK], 0);
   ActiveControl:= CurrencyEdit3;
   Exit;
  end;

 if CurrencyEdit1.Text = '' then
  begin
   MessageDlg(TranslateText(' Введите, пожалуйста, количество литров!'), mtWarning, [mbOK], 0);
   ActiveControl:= CurrencyEdit1;
   Exit;
  end;

 if CurrencyEdit2.Text = '' then
  begin
   MessageDlg(TranslateText(' Введите, пожалуйста, количество тонн!'), mtWarning, [mbOK], 0);
   ActiveControl:= CurrencyEdit2;
   Exit;
  end;

 ModalResult:= mrOK;
end;

procedure TAutoIncomeForm.deDateChange(Sender: TObject);
begin
  if not Self.Visible and ((Sender as TDateEdit).Date <= StrToDate(Close_Date)) then
    (Sender as TDateEdit).Enabled := false;
  bbOk.Enabled := (deDate.Date > StrToDate(CLOSE_DATE));
end;

end.
