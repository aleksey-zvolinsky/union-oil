unit AutoCard;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, RXDBCtrl, DBCtrls, CurrEdit,
  Db, DBTables, AutoCardRef, uCommonForm,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess, Variants;

type
  TAutoCardForm = class(TCommonForm)
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
    Label6: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    qTemp: TOilQuery;
    Edit1: TEdit;
    DateEdit1: TDateEdit;
    rbCard: TRadioButton;
    rbTalon: TRadioButton;
    Edit2: TEdit;

    procedure ceNPGroupButtonClick(Sender: TObject);
    procedure ceAutoButtonClick(Sender: TObject);
    procedure ceEmployButtonClick(Sender: TObject);

    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);

    procedure bbOkClick(Sender: TObject);

    procedure rbCardSelect(Sender: TObject);
    procedure rbTalonSelect(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
  private
    FEmitentNumber: string;
  public
    ID: integer;
    SearchEmpId, SearchEmpInst: integer;
    SearchAutoId, SearchAutoInst: integer;
    SearchNPType: integer;
    DocKind: integer;
    ShowOnly: boolean;

    procedure AddIncome;
    procedure EditIncome(MasterForm: TAutoCardRefForm);
    function getEmitentNumber: boolean;
    procedure Save;
  end;

var
  AutoCardForm: TAutoCardForm;

implementation

{$R *.DFM}

uses EmpRef, AutoRef, ExFunc, Main, OilStd, NPTypeRef, AutoIncomeRef, UDbSaver, uDbFunc;

procedure TAutoCardForm.AddIncome;
begin
 DateEdit1.Date := Date;

 Edit1.Text := FEmitentNumber;

 DocKind := 2; // Талон
 
 ID := 0;

 if rbTalon.Checked then
   rbTalonSelect(rbTalon);
 if rbCard.Checked then
   rbCardSelect(rbCard);
end;

procedure TAutoCardForm.EditIncome(MasterForm: TAutoCardRefForm);
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
  ID := MasterForm.qID.AsInteger;
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
  SearchNPType := MasterForm.qNP_TYPE.AsInteger;

  with qTemp do
  begin
    Close;
    SQL.Text:= Format(GetNPType, [SearchNPType]);
    Open;
    ceNPGroup.Text:= Fields[0].AsString;
  end;

  DateEdit1.Date := MasterForm.qINCOME_DATE.AsDateTime;

  case MasterForm.qDOC_KIND.AsInteger of
    1: // Карточка
    begin
      Edit1.Enabled:= true;
      Edit2.Enabled:= true;
      Label1.Font.Color:= clWindowText;

      Edit1.Text:= Copy(MasterForm.qDOC_NUMBER.AsString, 1, 4);
      Edit2.Text:= Copy(MasterForm.qDOC_NUMBER.AsString, 5, 6);

      DocKind:= 1;
      rbCard.Checked:= true;
    end;
    2: // Талон
    begin
      Edit1.Enabled:= false;
      Edit2.Enabled:= false;
      Label1.Font.Color:= clInactiveCaption;

      Edit1.Text:= '';
      Edit2.Text:= '';

      DocKind:= 2; // Талон
      rbTalon.Checked:= true;
    end;
    else
      MessageDlg(TranslateText('  Ошибочный вид платежа!'), mtError, [mbOK], 0);
  end; // case MasterForm.qDOC_KIND.AsInteger of

  CurrencyEdit1.Value:= MasterForm.qLITRES.AsFloat;

  // Проверяем текущий режим
  if ShowOnly then
  begin
    // Режим "только просмотр"
    GroupBox1.Enabled:= false;
    GroupBox2.Enabled:= false;
    GroupBox3.Enabled:= false;
  end
  else
  begin
    // Режим "редактирование"
    GroupBox1.Enabled:= true;
    GroupBox2.Enabled:= true;
    GroupBox3.Enabled:= true;
  end;
end;

procedure TAutoCardForm.ceNPGroupButtonClick(Sender: TObject);
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

procedure TAutoCardForm.ceAutoButtonClick(Sender: TObject);
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

procedure TAutoCardForm.ceEmployButtonClick(Sender: TObject);
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

procedure TAutoCardForm.SpeedButton4Click(Sender: TObject);
begin
 ceNPGroup.Text:= '';
 SearchNPType:= -1;
end;

procedure TAutoCardForm.SpeedButton5Click(Sender: TObject);
begin
 ceAuto.Text:= '';
 SearchAutoId:= -1;
 SearchAutoInst:= -1;
end;

procedure TAutoCardForm.SpeedButton3Click(Sender: TObject);
begin
 ceEmploy.Text:= '';
 SearchEmpId:= -1;
 SearchEmpInst:= -1;
end;

procedure TAutoCardForm.rbCardSelect(Sender: TObject);
begin
 // Выбрали карточку
 Edit1.Enabled:= true;
 Edit2.Enabled:= true;
 Label1.Font.Color:= clWindowText;

 Edit1.Text:= FEmitentNumber;

 DocKind:= 1; // Карточка
end;

procedure TAutoCardForm.rbTalonSelect(Sender: TObject);
begin
 // Выбрали талон
 Edit1.Enabled:= false;
 Edit2.Enabled:= false;
 Label1.Font.Color:= clInactiveCaption;

 Edit1.Text:= '';
 Edit2.Text:= '';

 DocKind:= 2; // Талон
end;

procedure TAutoCardForm.bbOkClick(Sender: TObject);
var i: integer;
begin
 // Проверки - все ли поля заполнены
 if (Edit2.Text = '') and (rbCard.Checked) then
  begin
   MessageDlg(TranslateText(' Введите, пожалуйста, номер карточки!'), mtWarning, [mbOK], 0);
   ActiveControl:= Edit2;
   Exit;
  end;

 for i:= 1 to Length(Edit2.Text) do
  if not (Edit2.Text[i] in ['0'..'9']) then
   begin
    MessageDlg(TranslateText(' Номер карточки должен содержать только цифры!'), mtWarning, [mbOK], 0);
    ActiveControl:= Edit2;
    Exit;
   end;

 if DateEdit1.Date = 0 then
  begin
   MessageDlg(TranslateText(' Введите, пожалуйста, дату заправки!'), mtWarning, [mbOK], 0);
   ActiveControl:= DateEdit1;
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

 if CurrencyEdit1.Text = '' then
  begin
   MessageDlg(TranslateText(' Введите, пожалуйста, количество литров!'), mtWarning, [mbOK], 0);
   ActiveControl:= CurrencyEdit1;
   Exit;
  end;

 if rbCard.Checked then
  while Length(Edit2.Text) < 6 do Edit2.Text:= '0' + Edit2.Text;

 ModalResult:= mrOK;
end;

// Функция формирует строку из 4-х символов и
// присваивает ее переменной FEmitentNumber. Строка состоит из кода эмитента
// для данного филиала - т.е. это первые четыре символа smart-карты.
// Если нельзя получить этот код - функция возвращает false, в случае
// нормального получения - true.
function TAutoCardForm.getEmitentNumber: boolean;
const getCardID = ' select card_id from card_id_history'+
                  ' where state=''Y'' and %d in (dep_id,obl_id)';
var Temp: string;
    vOblId: integer;
begin
 with qTemp do
  begin
   Close;

   if MAIN_ORG.ORG_TYPE=3 then vOblId:=MAIN_ORG.PAR
   else vOblId:=MAIN_ORG.ID;

   SQL.Text:= Format(getCardID, [vOblId] );
   Open;

   Temp:= Fields[0].AsString;

   if Length(Temp) <> 0 then
    begin
     while Length(Temp) < 4 do Temp:= '0' + Temp;

     FEmitentNumber:= Temp;
     Result:= true;
    end
   else
    Result:= false;

   Close;
  end;
end;

procedure TAutoCardForm.DateEdit1Change(Sender: TObject);
begin
  bbOk.Enabled := (DateEdit1.Date > StrToDate(CLOSE_DATE));
end;

procedure TAutoCardForm.Save;
begin
  if ID = 0 then
    ID := GetSeqNextVal('S_OIL_AUTO_CARD');
  DBSaver.SaveRecord('OIL_AUTO_CARD',
   ['ID',  ID,
    'INST', INST,
    'STATE', 'Y',
    'EMPLOY_ID', SearchEmpId,
    'EMPLOY_INST', SearchEmpInst,
    'AUTO_ID', SearchAutoId,
    'AUTO_INST',SearchAutoInst,
    'INCOME_DATE', DateEdit1.Date,
    'DOC_NUMBER', Edit1.Text + Edit2.Text,
    'NP_TYPE', SearchNPType,
    'LITRES', StrToFloat(CurrencyEdit1.Text),
    'DOC_KIND', DocKind]);
end;

end.
