{******************************************************************************}
{  Призначення : створення послуг клієнтів і податкових накладних по них       }
{                                                                              }
{  Модифікований : 31 березня 2005 року                                        }
{******************************************************************************}

unit Service;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, CurrEdit, ExtCtrls, StdCtrls, ToolEdit, Mask, Db, LogSaleDeadbeat,
  DBTables, Grids, DBGrids, MoneyFunc, MemDS, Ora, uMessageDlgExt, DBAccess,
  uCommonForm,uOilQuery,uOilStoredProc, DBGridEh;

type
  TServiceForm = class(TCommonForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    BitBtn2: TBitBtn;
    eServiceNum: TEdit;
    deDate: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    CEBase: TCurrencyEdit;
    ceNDS: TCurrencyEdit;
    ceSumsNDS: TCurrencyEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit3: TEdit;
    Label14: TLabel;
    q1: TOilQuery;
    sp1: TOilStoredProc;
    RadioGroup1: TRadioGroup;
    ComboEdit5: TComboEdit;
    Label12: TLabel;
    gbClient: TGroupBox;
    ComboEdit1: TComboEdit;
    Label11: TLabel;
    ComboEdit4: TComboEdit;
    SpeedButton4: TSpeedButton;
    Label10: TLabel;
    ComboEdit3: TComboEdit;
    SpeedButton3: TSpeedButton;
    lBank: TLabel;
    dbgRekvizit: TDBGridEh;
    lFacture: TLabel;
    dsRekvizit: TOraDataSource;
    qRekvizit: TOilQuery;
    gbTax: TGroupBox;
    eNumNN: TEdit;
    Label6: TLabel;
    cbTax: TCheckBox;
    gbDog: TGroupBox;
    ceDog: TComboEdit;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    DateEdit2: TDateEdit;
    qDog_Det: TOilQuery;
    ceNNSum: TCurrencyEdit;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    ceSumOper: TCurrencyEdit;
    ceSumDog: TCurrencyEdit;
    ceSumNN: TCurrencyEdit;
    Label17: TLabel;
    ceOperation: TComboEdit;
    Label13: TLabel;
    cbFormRash: TComboBox;
    lOperation: TLabel;
    qDog_Sum: TOilQuery;
    qSumNN: TOilQuery;
    qSumNNwS: TOilQuery;
    qSumNNwM: TOilQuery;
    qOutwS: TOilQuery;
    procedure eServiceNumKeyPress(Sender: TObject; var Key: Char);
    procedure ceBaseChange(Sender: TObject);
    procedure ComboEdit1ButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ceDogButtonClick(Sender: TObject);
    procedure ceOperationButtonClick(Sender: TObject);
    procedure ComboEdit5ButtonClick(Sender: TObject);
    procedure ComboEdit3ButtonClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ComboEdit4ButtonClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure deDateChange(Sender: TObject);
    procedure ComboEdit1Change(Sender: TObject);
    procedure dbgRekvizitDblClick(Sender: TObject);
    procedure dbgRekvizitExit(Sender: TObject);
    procedure ceSumsNDSChange(Sender: TObject);
    procedure ceNDSChange(Sender: TObject);
  private
    procedure SetTakeState;
  public
    OutOrgID, OutOrgINST: Integer;
    OutDepID, OutDepINST: Integer;
    OpenDog: boolean;
    OutOperId: Integer;
    OutNpGrp: Integer;
    OutPartId, OutPartInst: Integer;
    OutdogId, OutdogInst: Integer;
    S_ID, S_INST, MODE: Integer;
    NN_ID, NN_INST: Integer;
    NN_NUM: string;
    SaleToDeadbeat : TSaleToDeadbeat;
  end;

implementation

{$R *.DFM}

uses
  Main, AddTax, ChooseOrg, DogRef, uXMLForm, OilStd, OperTypeRef, PartRef, Udbplan,
  UdbFunc, TaxBillPrint;

var
  sOutId, sOutInst, OutOperId2: Integer;
  sDate: TDateTime;
  TaxBill: TdmTaxBill;
  OperType, OperType2: string;
  LastNN: TDate;
  NNSumOut: double; // реально существующие суммы без редактируемой записи
  SumRefresh: boolean; // используется для того, чтобы проходить ОnChange только той суммы, которую трогаем

//==============================================================================
procedure TServiceForm.SetTakeState;
begin
  bbOk.Enabled := (deDate.Date > StrToDate(CLOSE_DATE)) and (OutDepINST = INST);
end;
//==============================================================================
procedure TServiceForm.eServiceNumKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then key := #0;
end;
//==============================================================================
procedure TServiceForm.ComboEdit1ButtonClick(Sender: TObject);
var
  vName: string;
  OldOrgID, OldOrgINST, vId, vInst: integer;
begin
  OldOrgID := OutOrgID;
  OldOrgINST := OutOrgInst;
  if ChooseOrg.CaptureOrg(4, 0, 0, 'yyy', vId, vInst, vName) then
  begin
    if not InitNewOrg(vId,vInst,vName,S_ID,S_INST,'OIL_SERVICE',SaleToDeadbeat) then Exit;
    OutOrgId := vId;
    OutOrgInst := vInst;
    Comboedit1.Text := vName;
    // Если организация не соответсвует договору - сбрасываем договор
    if (OldOrgID <> OutOrgID) or (OldOrgINST <> OutOrgInst) then
    begin
      OutdogId := 0;
      OutdogInst := 0;
      ceDog.text := '';
      DateEdit2.Clear;
    end;
  end;
end;
//==============================================================================
procedure TServiceForm.FormCreate(Sender: TObject);
begin
  inherited;
  OutOrgID := 0;
  OutOrgInst := 0;
  OutOperId := 0;
  OutDepID := MAIN_ORG.ID;
  OutDepInst := MAIN_ORG.INST;
  OutNpGRP := 0;
  OutPartId := 0;
  OutPartInst := 0;
  OutdogId := 0;
  OutdogInst := 0;
  S_ID := 0;
  S_INST := INST;
  ComboEdit5.Text := MAIN_ORG.NAME;
  OpenDog := true;
  SumRefresh := true;
end;
//==============================================================================
procedure TServiceForm.ceDogButtonClick(Sender: TObject);
Var
  Dog: TDogRefForm;
  TempOutdogId: integer;
  TempOutdogInst: integer;
  TempOutDogName: string;
  TempOutDogDate: TDateTime;
  TempOrgID: integer;
  TempOrgInst: integer;
  TempOrgName: string;
  TextMesage, TextMessage2, TextMessage3: string;
  DogRC: integer;
begin
  TextMesage := '';
  Dog := TDogRefForm.Create(Application);
  Dog.rbService.Checked := True;
  Dog.gbDogType.Enabled:= False; 
  if Dog.ShowModal = mrOk then
  begin
    try
      TempOutdogId := dog.q.fieldbyname('id').AsInteger;
      TempOutdogInst := dog.q.fieldbyname('inst').AsInteger;
      TempOutDogName := dog.q.fieldbyname('dog').AsString;
      TempOutDogDate := dog.qEXP_DATE.AsDateTime;
      TempOrgName := dog.qTO_NAME.AsString;
      TempOrgID := dog.qTO_.AsInteger;
      TempOrgInst := dog.qTO_INST.AsInteger;
      OperType2 := Dog.qServiceDetail.FieldbyName('Service_Name').AsString;
      OutOperId2 := Dog.qServiceDetail.FieldbyName('oper_id').AsInteger;
      DogRC := Dog.qServiceDetail.RecordCount;
    finally
      Dog.Free;
    end;

    if (NN_Id <> 0) or (NN_Inst <> 0) then TextMesage := TranslateText(' и будет удалена налоговая накладная')
    else TextMesage := '';

    if (DogRC <> 1) then
    begin
      TextMessage2 := TranslateText('При выборе этой команды поменяются позиции услуги');
      TextMessage3 := TranslateText('Продолжить ?');
    end
    else
    begin
      TextMessage2 := TranslateText('При замене договора поменяются позиции услуги');
      TextMessage3 := TranslateText('Заменить договор ?');
    end;

    if ((TempOutDogName <> ceDog.Text) or (DogRC <> 1)) and (ceDog.Text <> '') then
    begin
      if MessageDlg(TextMessage2 + TextMesage +'.'#13+ TextMessage3, mtWarning, [mbYes, mbNo], 0) = mrYes then
      begin
        if (NN_Id <> 0) or (NN_Inst <> 0) then
        begin
          TaxBill := TdmTaxBill.Create;
          try
            TaxBill.DeleteSBRecords10(NN_Id,NN_Inst);
          Finally
            TaxBill.Free;
          End;
        end;
        eNumNN.Text := '';
        ceNNSum.Value := 0;
        NN_Id := 0;
        NN_Inst := 0;
        NN_Num := '';
        ceBase.Value := 0;
        ceNDS.Value := 0;
        ceSumsNDS.Value := 0;
        ceSumDog.Value := 0;
        ceSumOper.Value := 0;
        CESumNN.Value := 0;
        ceDog.Text := '';
        OutdogId := 0;
        OutdogInst := 0;
        ceDog.text := '';
        DateEdit2.Clear;
        ceOperation.Text := '';
        OutOperId := 0;
      end
      else exit;
    end;
    qSumNN.Close;
    qSumNN.ParamByName('dog_id').AsInteger := TempOutDogId;
    qSumNN.ParamByName('dog_inst').AsInteger := TempOutDogInst;
    qSumNN.ParamByName('np_id').AsInteger := -1;
    qSumNN.Open;

    qDog_Det.Close;
    qDog_Det.ParamByName('dog_id').AsInteger := TempOutDogId;
    qDog_Det.ParamByName('dog_inst').AsInteger := TempOutDogInst;
    qDog_Det.ParamByName('oper_id').AsInteger := -1;
    qDog_Det.Open;

    qDog_Sum.Close;
    qDog_Sum.ParamByName('nn_id').AsInteger := -1;
    qDog_Sum.ParamByName('nn_inst').AsInteger := -1;
    qDog_Sum.ParamByName('dog_id').AsInteger := TempOutDogId;
    qDog_Sum.ParamByName('dog_inst').AsInteger := TempOutDogInst;
    qDog_Sum.ParamByName('oper_id').AsInteger := -1;
    qDog_Sum.Open;
    ceSumDog.Value := qDog_Sum.FieldByName('summ_dog_all').AsFloat;
    // если договор состоит из одной позиции то сразу ж её заносим в услугу
    // и подбиваем все данные
    if qDog_Det.RecordCount = 1 then
    begin
      ceOperation.Text := OperType2;
      OperType := OperType2;
      OutOperId := OutOperId2;

      qOutwS.Close;
      qOutwS.ParamByName('id').AsInteger := s_id;
      qOutwS.ParamByName('inst').AsInteger := s_inst;
      qOutwS.ParamByName('dog_id').AsInteger := TempOutDogId;
      qOutwS.ParamByName('dog_inst').AsInteger := TempOutDogInst;
      qOutwS.ParamByName('np_id').AsInteger := OutOperId;
      qOutwS.Open;

      qDog_Det.Close;
      qDog_Det.ParamByName('dog_id').AsInteger := TempOutDogId;
      qDog_Det.ParamByName('dog_inst').AsInteger := TempOutDogInst;
      qDog_Det.ParamByName('oper_id').AsInteger := OutOperId;
      qDog_Det.Open;
      ceSumOper.Value := qDog_Sum.FieldByName('summ_dog_oper').AsFloat;

      qSumNN.Close;
      qSumNN.ParamByName('dog_id').AsInteger := TempOutDogId;
      qSumNN.ParamByName('dog_inst').AsInteger := TempOutDogInst;
      qSumNN.ParamByName('np_id').AsInteger := OutOperId;
      qSumNN.Open;
      ceSumOper.Value := qDog_Sum.FieldByName('summ_dog_oper').AsFloat;
      CESumNN.Value := Fround(qSumNN.FieldByName('Sum_nn').AsFloat, 2);
    end
    else
    begin
      CEBase.Text := '';
      ceOperation.Text := '';
      OperType := '';
      qDog_Det.Close;
      qDog_Det.ParamByName('dog_id').AsInteger := TempOutDogId;
      qDog_Det.ParamByName('dog_inst').AsInteger := TempOutDogInst;
      qDog_Det.ParamByName('oper_id').AsInteger := OutOperId;
      qDog_Det.Open;
    end;
    OutdogId := TempOutdogId;
    OutdogInst := TempOutdogInst;
    ceDog.Text := TempOutDogName;
    DateEdit2.Date := TempOutDogDate;
    // спрашиваем "Заменить сумму без НДС" если она не = 0
    if (ceSumsNDS.Value <> ceSumDog.Value) then
    begin
      if MessageDlgExt(TranslateText('Сумма по договору не соответствует сумме введенной услуги.'),
         mtInformation,['Ok',TranslateText('Заменить')],0) = 2 then
        ceSumsNDS.Value := Fround(GetWithNDS_NoNDS(Fround(qDog_Det.FieldByName('price').AsFloat*
          qDog_Det.FieldByName('count_').AsFloat, 2), deDate.Date, 2) - qOutwS.FieldByName('sum_total_s').AsFloat, 2);
    end
    else
    begin
      if qDog_Det.RecordCount = 1 then
        ceSumsNDS.Value := Fround(GetWithNDS_NoNDS(Fround(qDog_Det.FieldByName('price').AsFloat*
          qDog_Det.FieldByName('count_').AsFloat, 2), deDate.Date, 2) - qOutwS.FieldByName('sum_total_s').AsFloat, 2)
      else ceSumsNDS.Value := 0;
    end;

    if ceSumsNDS.Value < 0 then
      MessageDlg(TranslateText('Вы не сможете по данному договору создать отпуск, так как сумма по данному ') + #13 +
        TranslateText('договору уже и так меньше суммы по созданным услугам.') + #13 +
        TranslateText('Удалите отпуски по данному договору созданные раньше, а потом уже создавайте этот отпуск.'), mtInformation, [mbOk], 0);
    Self.ComboEdit1Change(nil);
    // Выбираем клиента
    if (ComboEdit1.Text = '') or ((OutOrgId = TempOrgID) and (OutOrgInst = TempOrgInst)) then
    begin
      if ComboEdit1.Text = '' then
        if not InitNewOrg(TempOrgID,TempOrgInst,TempOrgName,S_ID,S_INST,'OIL_SERVICE',SaleToDeadbeat) then Exit;
      ComboEdit1.Text := TempOrgName;
      OutOrgId := TempOrgID;
      OutOrgInst := TempOrgInst;
      qRekvizit.close;
      qRekvizit.ParamByName('p_OrgId').Value := OutOrgId;
      qRekvizit.ParamByName('p_OrgInst').Value := OutOrgInst;
      qRekvizit.open;
    end
    else
      // Проверяем - менять ли клиента
      if MessageDlg(TranslateText('Название выбранной организации-покупателя и название организации')+#13 +
        TranslateText('в договоре купли-продажи не соответствуют друг другу.')+#13#13 +
        TranslateText('Заменить организацию, согласно договора?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        if InitNewOrg(TempOrgID,TempOrgInst,TempOrgName,S_ID,S_INST,'OIL_SERVICE',SaleToDeadbeat) then
        begin
          ComboEdit1.Text := TempOrgName;
          OutOrgId:= TempOrgID;
          OutOrgInst:= TempOrgInst;
          qRekvizit.close;
          qRekvizit.ParamByName('p_OrgId').Value := OutOrgId;
          qRekvizit.ParamByName('p_OrgInst').Value := OutOrgInst;
          qRekvizit.open;
        end;
  end;
end;
//==============================================================================
procedure TServiceForm.ceOperationButtonClick(Sender: TObject);
var
  OperF: TOperTypeRefForm;
  oper_id: integer;
  OperFGrps: string; // используем для вильтрации услуг при выборе операции
begin
  SumRefresh := true;
  oper_id := OutOperId;
  if ceDog.Text = '' then
  begin
    ShowMessage(TranslateText('Операцию выбрать невозможно. Выберите договор.'));
    exit;
  end;
  // делаем видными все операции по даному договору 
  qDog_Det.Close;
  qDog_Det.ParamByName('dog_id').AsInteger := OutDogId;
  qDog_Det.ParamByName('dog_inst').AsInteger := OutDogInst;
  qDog_Det.ParamByName('oper_id').AsInteger := -1;
  qDog_Det.Open;   
  OperFGrps := '';
  qDog_Det.First;
  repeat
    OperFGrps := OperFGrps + qDog_Det.FieldByName('np_type').AsString;
    qDog_Det.Next;
    if qDog_Det.Eof = true then OperFGrps := OperFGrps + ''
    else OperFGrps := OperFGrps + ',';
  until qDog_Det.Eof;

  OperF := TOperTypeRefForm.Create(Application);
  OperF.sgrpId := 12;
  OperF.Opers_id := OperFGrps; // для фильтрации
  OperF.bbClear.Enabled := False;
  OperF.ShowModal;

  if OperF.ModalResult=MrOk then
  begin
    ceOperation.text := OperF.q.fieldbyname('name').asstring;
    OutOperId := OperF.q.fieldbyname('id').asinteger;
  end
  else exit;
  OperF.free;

  qDog_Det.Close;
  qDog_Det.ParamByName('dog_id').AsInteger := OutDogId;
  qDog_Det.ParamByName('dog_inst').AsInteger := OutDogInst;
  qDog_Det.ParamByName('oper_id').AsInteger := OutOperId;
  qDog_Det.Open;

  qDog_Sum.Close;
  if (nn_id = 0) and (nn_inst = 0) then
  begin
    qDog_Sum.ParamByName('nn_id').AsInteger := -1;
    qDog_Sum.ParamByName('nn_inst').AsInteger := -1;
  end
  else
  begin
    qDog_Sum.ParamByName('nn_id').AsInteger := nn_id;
    qDog_Sum.ParamByName('nn_inst').AsInteger := nn_inst;
  end;
  qDog_Sum.ParamByName('dog_id').AsInteger := OutDogId;
  qDog_Sum.ParamByName('dog_inst').AsInteger := OutDogInst;
  qDog_Sum.ParamByName('oper_id').AsInteger := OutOperId;
  qDog_Sum.Open;
  ceNNSum.Value := qDog_Sum.FieldByName('summ_NN_cur').AsFloat;
  ceSumOper.Value := qDog_Sum.FieldByName('summ_dog_oper').AsFloat;
  ceSumDog.Value := qDog_Sum.FieldByName('summ_dog_all').AsFloat;

  qOutwS.Close;
  qOutwS.ParamByName('id').AsInteger := s_id;
  qOutwS.ParamByName('inst').AsInteger := s_inst;
  qOutwS.ParamByName('dog_id').AsInteger := OutDogId;
  qOutwS.ParamByName('dog_inst').AsInteger := OutDogInst;
  qOutwS.ParamByName('np_id').AsInteger := OutOperId;
  qOutwS.Open;

  qSumNN.Close;
  qSumNN.ParamByName('dog_id').AsInteger := OutDogId;
  qSumNN.ParamByName('dog_inst').AsInteger := OutDogInst;
  qSumNN.ParamByName('np_id').AsInteger := OutOperId;
  qSumNN.Open;
  CESumNN.Value := Fround(qSumNN.FieldByName('Sum_nn').AsFloat, 2);
  eNumNN.Text := '';
  ceNNSum.Value := 0;
  // мы не можем выбрать услугу которой нету в договоре
  if qDog_Det.RecordCount = 0 then
  begin
    OperType := '';
    OutOperId := -1;
    CEBase.Value := 0;
    ceOperation.Text := OperType;
    ShowMessage(TranslateText('В договоре нет такого типа услуг.'));
  end
  else
    // спрашиваем "Заменить сумму без НДС" если она не = 0
    if (ceSumsNDS.Value <> 0) and (OutOperId <> oper_id) then
      if MessageDlgExt(TranslateText('Сумма по договору не соответствует сумме введенной услуги.'),
         mtInformation,['Ok',TranslateText('Заменить')],0) = 2 then
      begin
        ceSumsNDS.Value := Fround(GetWithNDS_NoNDS(Fround(qDog_Det.FieldByName('price').AsFloat*
          qDog_Det.FieldByName('count_').AsFloat, 2), deDate.Date, 2) - qOutwS.FieldByName('sum_total_s').AsFloat, 2);
        exit;
      end
      else exit;
  ceSumsNDS.Value := Fround(GetWithNDS_NoNDS(Fround(qDog_Det.FieldByName('price').AsFloat*
    qDog_Det.FieldByName('count_').AsFloat, 2), deDate.Date, 2) - qOutwS.FieldByName('sum_total_s').AsFloat, 2);
end;
//==============================================================================
procedure TServiceForm.ComboEdit5ButtonClick(Sender: TObject);
var
  vName:string;
begin
  if ChooseOrg.CaptureOrg(4,Main.Main_Id,Main.Inst,'yyy',OutDepId,OutDepInst,vName) then
    Comboedit5.Text := vName;
  SetTakeState;
end;
//==============================================================================
procedure TServiceForm.ComboEdit3ButtonClick(Sender: TObject);
begin
  XMLChoose('npgroupref',OutNPGrp,comboedit3);
end;
//==============================================================================
procedure TServiceForm.SpeedButton3Click(Sender: TObject);
begin
  comboedit3.text := '';
  OutNpGRP := 0;
end;
//==============================================================================
procedure TServiceForm.ComboEdit4ButtonClick(Sender: TObject);
Var
  Part: TPartRefForm;
begin
  Application.CreateForm(TPartRefForm,Part);
  Part.ShowModal;
  if part.ModalResult = mrOk then
  begin
    OutPartId := part.q.fieldbyname('id').value;
    OutPartInst := part.q.fieldbyname('inst').value;
    Comboedit4.Text := part.q.fieldbyname('dog').value;
  end;
  Part.Free;
end;
//==============================================================================
procedure TServiceForm.SpeedButton4Click(Sender: TObject);
begin
  OutPartId := 0;
  OutPartInst := 0;
  Comboedit4.Text := '';
end;
//==============================================================================
procedure TServiceForm.SpeedButton1Click(Sender: TObject);
// хрестик который очищает поле номера договора очищает всё
begin
  OutdogId := 0;
  OutdogInst := 0;
  ceDog.text := '';
  DateEdit2.Clear;
  ceOperation.Text := '';
  OutOperId := 0;
  CEBase.Value := 0;
  ceNDS.Value := 0;
  ceSumsNDS .Value := 0;
  eNumNN.Text := '';
  ceNNSum.Value := 0;
  ceSumDog.Value := 0;
  ceSumOper.Value := 0;
  CESumNN.Value := 0;
  ceDog.Text := '';
  ComboEdit1.Text := '';
  OutOrgId:= 0;
  OutOrgInst:= 0;
  NN_Id := 0;
  NN_Inst := 0;
  NN_Num := '';
end;
//==============================================================================
procedure TServiceForm.bbOkClick(Sender: TObject);
var
  // вспомогательные переменные для определения id & inst
  // в режиме добавить и редактировать
  v_ID, v_Inst: Integer;
  res, NNAddDelEdit: string;
  NN_SUM: Variant;
  CreatNN: boolean;
  SumCount: real;
  Sum, Ostatok: real;
begin
  CreatNN := true;
  // проверка достаточности введеных параметров
  if (OutPartId<>0) and (OutPartInst<>0) and (GetQValueByIdInst( 'state', 'oil_part', OutPartId,OutPartInst)='N') then
  Begin
    ShowMessage(TranslateText('Во время редактирования этой услуги была удалена(или синхронизирована) партия.')+#13#10+
      TranslateText('Нажмите ОТМЕНА и отредактируйте партию.'));
    Exit;
  End;
  if (eServiceNum.text='') or (deDate.date=0) or (ceOperation.Text='') or (OutOrgId=0) or (OutDepId=0) or (OutOperId=0) then
  begin
    MessageDlg(TranslateText('Не все параметры определены !'), mtError, [mbOk], 0);
    Exit;
  end;
  if (CEBase.Text = '') and (ceNDS.Text = '') and (ceSumsNDS.Text = '') then
  begin
    MessageDlg(TranslateText('Не определенны расчетные суммы !'), mtError, [mbOk], 0);
    Exit;
  end;
  if cbFormRash.Text = '' then
  begin
    MessageDlg(TranslateText('Не определена форма расчета !'), mtError, [mbOk], 0);
    Exit;
  end;

  if ceDog.Text = '' then MessageDlg(TranslateText('Пожалуйста, введите данные по договору!'), mtWarning, [mbOk], 0)
  else
    try
      StartSQL;
      with sp1 do
      begin
        case mode of
         1: // добавить новую
           begin
             q1.Close;
             q1.SQL.Text := 'select s_oil_service.nextval as sq from sys.dual';
             q1.Open;
             v_ID := q1.FieldByName('sq').AsInteger;
             v_Inst := INST;
             SaleToDeadbeat.Sale_id := q1.FieldByName('sq').AsInteger;
             StoredProcName := 'OIL.INSORUPDOIL_SERVICE';
           end;
         2: // редактировать
           begin
             StoredProcName := 'OIL.INSORUPDOIL_SERVICE';
             v_ID := S_ID;
             v_Inst := S_INST;
           end;
        end; // case mode of
        if not ConfirmSaleToDeadbeat(SaleToDeadbeat) then
          Raise Exception.Create(TranslateText('Операция прервана!'));

        // делаем запись суммы по всем НН даного договора и записываем последнею дату выписки НН
        NNSumOut := qSumNN.FieldByName('sum_nn').AsFloat;
        LastNN:= qSumNN.FieldByName('S_DATE').AsDATETime;

        qOutwS.Close;
        qOutwS.ParamByName('id').AsInteger := v_id;
        qOutwS.ParamByName('inst').AsInteger := v_inst;
        qOutwS.ParamByName('dog_id').AsInteger := OutDogId;
        qOutwS.ParamByName('dog_inst').AsInteger := OutDogInst;
        qOutwS.ParamByName('np_id').AsInteger := OutOperId;
        qOutwS.Open;

        qSumNNwS.Close;
        if (nn_id = 0) and (nn_inst = 0) then
        begin
          qSumNNwS.ParamByName('nn_id').AsInteger := -1;
          qSumNNwS.ParamByName('nn_inst').AsInteger := -1;
        end
        else
        begin
          qSumNNwS.ParamByName('nn_id').AsInteger := nn_id;
          qSumNNwS.ParamByName('nn_inst').AsInteger := nn_inst;
        end;
        qSumNNwS.ParamByName('dog_id').AsInteger := OutDogId;
        qSumNNwS.ParamByName('dog_inst').AsInteger := OutDogInst;
        qSumNNwS.ParamByName('np_id').AsInteger := OutOperId;
        qSumNNwS.Open;

        qSumNNwM.Close;
        qSumNNwM.ParamByName('dog_id').AsInteger := OutDogId;
        qSumNNwM.ParamByName('dog_inst').AsInteger := OutDogInst;
        qSumNNwM.ParamByName('np_id').AsInteger := OutOperId;
        qSumNNwM.Open;

        if Fround(GetWithNDS_NoNDS(Fround(qDog_Det.FieldByName('price').AsFloat*
           qDog_Det.FieldByName('count_').AsFloat, 2), deDate.Date, 2) - qOutwS.FieldByName('sum_total_s').AsFloat, 2)
           < 0 then
        begin
          MessageDlg(TranslateText('Вы не сможете по данному договору создать отпуск, так как сумма по данному ') + #13 +
            TranslateText('договору уже и так меньше суммы по созданным услугам.') + #13 +
            TranslateText('Удалите отпуски по данному договору созданные раньше, а потом уже создавайте этот отпуск.'), mtInformation, [mbOk], 0);
          CommitSQL;
          exit;
        end;

        if GetWithNDS_NoNDS(Fround(qDog_Det.FieldByName('price').AsFloat*qDog_Det.FieldByName('count_').AsFloat, 2), deDate.Date, 2) =
           Fround(qOutwS.FieldByName('sum_total_s').AsFloat, 2) then
        begin
          MessageDlg(TranslateText('Отпуск не будет создан, так как сумма с НДС по договору ')+ #13 +
            TranslateText('данной услуги уже равна сумме с НДС по выписанным услугам.'), mtError, [mbOk], 0);
          ceSumsNDS.Value := 0;
          CommitSQL;
          exit;
        end;

        if not (cbTax.Checked) and (qOutwS.FieldByName('sum_total_s').AsFloat = 0) then
        begin
          Sum := Fround(ceSumsNDS.Value - qSumNNwM.FieldByName('sum_nn').AsFloat, 2);
          SumCount := Fround(Sum/qDog_Det.FieldByName('price2').AsFloat,6);
          if (Sum < 0) or (Sum = 0) then
          begin
            ShowMessage(TranslateText('Налоговая накладная не будет создана, так как оплата покрыла отпуск.'));
            cbTax.Checked := true;
            CreatNN := false;
          end;
        end
        else
          if not (cbTax.Checked) then
          begin
            Ostatok := Fround(qSumNNwM.FieldByName('sum_nn').AsFloat -
              (qOutwS.FieldByName('sum_total_s').AsFloat - qSumNNwS.FieldByName('sum_nn').AsFloat), 2);
            if Ostatok < 0 then
            begin
              Sum := Fround(ceSumsNDS.Value, 2);
              SumCount := Fround(Sum/qDog_Det.FieldByName('price2').AsFloat,6);
            end
            else
            begin
              Sum := Fround(ceSumsNDS.Value - Ostatok, 2);
              SumCount := Fround(Sum/qDog_Det.FieldByName('price2').AsFloat,6);
              if (Sum < 0) or (Sum = 0) then
              begin
                ShowMessage(TranslateText('Налоговая накладная не будет создана, так как оплата покрыла отпуск.'));
                cbTax.Checked := true;
                CreatNN := false;
              end;
            end;
          end;

        if GetWithNDS_NoNDS(Fround(qDog_Det.FieldByName('price').AsFloat*qDog_Det.FieldByName('count_').AsFloat, 2), deDate.Date, 2) <
           Fround(qOutwS.FieldByName('sum_total_s').AsFloat + ceSumsNDS.Value, 2) then
        begin
          if MessageDlg(TranslateText('Отпуск не будет создан, так как сумма с НДС по договору ')+ #13 +
             TranslateText('данной услуги будет меньше суммы с НДС по выписанным услугам. ')+ #13 +
             TranslateText('Заменить суммы ?'), mtError, [mbYes, mbNo], 0) = mrYes then
            ceSumsNDS.Value := Fround(GetWithNDS_NoNDS(Fround(qDog_Det.FieldByName('price').AsFloat*
              qDog_Det.FieldByName('count_').AsFloat, 2), deDate.Date, 2) - qOutwS.FieldByName('sum_total_s').AsFloat, 2);
          CommitSQL;
          exit;
        end;

        if (CreatNN = true) and (LastNN > deDate.Date) then
        begin
          ShowMessage(TranslateText('Нельзя создавать/редактировать услугу, по которой создана НН и ')+ #13 +
            TranslateText('позже которой созданы другие НН.')+#13+TranslateText('Вначале удалите НН по этому ')+ #13 +
            TranslateText('договору, созданные позже.'));
          CommitSQL;
          exit;
        end;

        NN_SUM := 0;
        if (cbTax.Checked) and (CreatNN = true) then // Удаление НН
          if not (NN_Num = '') then
            if MessageDlg(TranslateText('Будет удалена налоговая накладная №')+ NN_Num +TranslateText(' на сумму ')+ FloatToStr(qDog_Sum.FieldByName('summ_NN_cur').AsFloat) +'.',
               mtConfirmation, [mbYes, mbNo], 0) <> mrNo then
            begin
              // Удаляем HH
              TaxBill := TdmTaxBill.Create;
              try
                TaxBill.DeleteSBRecords10(NN_Id, NN_Inst);
                NN_Id := 0;
                NN_Inst := 0;
              finally
                TaxBill.Free;
              end;
            end
            else cbTax.Checked := not (cbTax.Checked); // Не удалять НН

        // Создание НН
        if not (cbTax.Checked) and (CreatNN = true) then
        begin
          try
            try
              TaxBill := TdmTaxBill.Create(OutOrgId,OutOrgInst,OutDepId,OutDepInst);
              // задаем параметры НН
              TaxBill.Options.Date := DateToStr(deDate.Date);
              TaxBill.Options.DogId := OutDogId;
              TaxBill.Options.DogInst := OutDogInst;
              TaxBill.Options.Scheme := TScheme(3);
              TaxBill.Options.TaxBillType := 1;
              TaxBill.Options.TaxBillInst := OutDogInst;
              TaxBill.Options.OIL_NN_Type := 2;
              TaxBill.Options.OIL_NN_Cause := 2;
              TaxBill.Options.ByDogName := TranslateText('Услуга № ') + eServiceNum.Text;
              TaxBill.Options.OperName := cbFormRash.Text;
              if (NN_Id <> 0) or (NN_Num <> '') or (NN_Inst <> 0) then
              begin
                TaxBill.Options.Num := NN_Num;
                TaxBill.Options.TaxBillId := NN_Id;
                TaxBill.Options.TaxBillInst := NN_Inst;
              end;
              repeat
                TaxBill.AddPosition(
                  OutOperId,
                  qDog_Det.FieldByName('dim_id').AsInteger,
                  DateToStr(deDate.Date),
                  Fround(SumCount, 6),
                  Fround(qDog_Det.FieldByName('price2').AsFloat, 2),
                  Sum);
                NN_SUM := NN_SUM + (qDog_Det.FieldByName('Count_').AsFloat * qDog_Det.FieldByName('price2').AsFloat);
                qDog_Det.Next;
              until qDog_Det.Eof;
              NN_SUM := FRound(NN_SUM, 2);
            finally
              // грохаем детализацию НН
              if NN_Id <> 0 then
                TaxBill.DeleteSBRecordsDet(TaxBill.Options.TaxBillId, TaxBill.Options.TaxBillInst,
                  TaxBill.Options.TaxBillType);
              TaxBill.Make(False);
              // сообщаем про результат полученый от НН
              NN_Id := TaxBill.Options.TaxBillId;
              NN_Inst := Inst;
              if NN_Num <> '' then
                NNAddDelEdit := TranslateText('Отредактирована налоговая накладная №')+ nn_num +TranslateText(' на сумму ')+ FloatToStr(Sum) +TranslateText(' грн.')
              else
              begin
                NN_Num := TaxBill.Options.Num;
                NNAddDelEdit := TranslateText('Добавлена налоговая накладная №')+ nn_num +TranslateText(' на сумму ')+ FloatToStr(Sum) +TranslateText(' грн.');
              end;
              TaxBill.free;
            end;
          except on E: Exception do
            ShowMessage(E.Message);
          end;
        end;
        Prepare;
        ParamByName('ID#').AsInteger := v_Id;
        ParamByName('INST#').AsInteger := v_Inst;
        ParamByName('STATE#').AsString := 'Y';
        ParamByName('S_NUM#').AsInteger := StrtoInt(eServiceNum.text);
        ParamByName('S_DATE#').AsDate := deDate.date;
        ParamByName('ORG_ID#').AsInteger := OutOrgId;
        ParamByName('ORG_INST#').AsInteger := OutOrgInst;
        ParamByName('RASC_CHET#').AsString := qRekvizit.FieldByName('rach_chet').AsString;
        if (OutDogId=0) then
        begin
          ParamByName('DOG_ID#').Clear;
          ParamByName('DOG_INST#').Clear;
        end
        else
        begin
          ParamByName('DOG_ID#').AsInteger := OutDogId;
          ParamByName('DOG_INST#').AsInteger := OutDogInst;
        end;
        if (OutNpGrp = 0) then ParamByName('NP_ID#').Clear
        else ParamByName('NP_ID#').AsInteger := OutNpGRP;
        if (OutPartId = 0) then
        begin
          ParamByName('PART_ID#').Clear;
          ParamByName('PART_INST#').Clear;
        end
        else
        begin
          ParamByName('PART_ID#').AsInteger := OutPartId;
          ParamByName('PART_INST#').AsInteger := OutPartInst;
        end;
        ParamByName('DEP_ID#').AsInteger := OutDepId;
        ParamByName('DEP_INST#').AsInteger := OutDepInst;
        ParamByName('OPER_ID#').AsInteger := OutOperId;
        ParamByName('BASE#').AsFloat := CEBase.Value;
        ParamByName('NDS#').AsFloat := ceNDS.Value;
        ParamByName('TOTAL#').AsFloat := ceSumsNDS.Value;
        ParamByName('TEXT#').AsString := Edit3.text;
        ParamByName('SERVICE_T#').AsInteger := RadioGroup1.ItemIndex;
        if not cbTax.Checked then
        begin
          ParamByName('NN_ID#').AsInteger := NN_Id;
          ParamByName('NN_INST#').AsInteger := NN_Inst;
        end
        else
        begin
          ParamByName('NN_ID#').Clear;
          ParamByName('NN_INST#').Clear;
        end;
        ExecProc;

        Res := ParamByName('Result').AsString;
        if (Length(Res)>0) and (Res[1]<>'0') then Raise Exception.Create(SubStr(Res, 2));
      end;
      CommitSQL;
      ModalResult := MrOK;
      // Сообщение: добавлена/отредактированна/удалена НН №...
      if (Length(NNAddDelEdit)>0) and (not cbTax.Checked) then
        MessageDlg(NNAddDelEdit, mtCustom,[mbOk],0);
    except on E:Exception do
      begin
        MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
        RollbackSQL;
      end;
    end;
end;
//==============================================================================
procedure TServiceForm.FormShow(Sender: TObject);
begin
  case mode of
   1: // добавить
     begin
       q1.Close;
       q1.SQL.Text := 'select max(s_num)+1 from oil_service where state=''Y''';
       q1.Open;
       eServiceNum.Text := q1.Fields[0].AsString;
       deDate.Date := Date;
     end;
   2: // изменить
     begin
       eNumNN.Text := NN_Num;
       deDate.Enabled := deDate.Date>StrToDate(CLOSE_DATE);
       sDate := deDate.Date;
       sOutId := OutOrgId;
       sOutInst := OutOrgInst;
       cbTax.Checked := (eNumNN.Text = '');
     end;
  end;
  SetTakeState;
  OpenDog := true;
  qDog_Det.Close;
  qDog_Det.ParamByName('dog_id').AsInteger := OutDogId;
  qDog_Det.ParamByName('dog_inst').AsInteger := OutDogInst;
  qDog_Det.ParamByName('oper_id').AsInteger := OutOperId;
  qDog_Det.Open;

  qSumNN.Close;
  qSumNN.ParamByName('dog_id').AsInteger := OutDogId;
  qSumNN.ParamByName('dog_inst').AsInteger := OutDogInst;
  qSumNN.ParamByName('np_id').AsInteger := OutOperId;
  qSumNN.Open;
  CESumNN.Value := qSumNN.FieldByName('Sum_nn').AsFloat;

  qOutwS.Close;
  qOutwS.ParamByName('id').AsInteger := s_id;
  qOutwS.ParamByName('inst').AsInteger := s_inst;
  qOutwS.ParamByName('dog_id').AsInteger := OutDogId;
  qOutwS.ParamByName('dog_inst').AsInteger := OutDogInst;
  qOutwS.ParamByName('np_id').AsInteger := OutOperId;
  qOutwS.Open;

  qDog_Sum.Close;
  qDog_Sum.ParamByName('nn_id').AsInteger := nn_id;
  qDog_Sum.ParamByName('nn_inst').AsInteger := nn_inst;
  qDog_Sum.ParamByName('dog_id').AsInteger := OutDogId;
  qDog_Sum.ParamByName('dog_inst').AsInteger := OutDogInst;
  qDog_Sum.ParamByName('oper_id').AsInteger := OutOperId;
  qDog_Sum.Open;
  ceNNSum.Value := qDog_Sum.FieldByName('summ_NN_cur').AsFloat;
  ceSumDog.Value := qDog_Sum.FieldByName('summ_dog_all').AsFloat;
  ceSumOper.Value := qDog_Sum.FieldByName('summ_dog_oper').AsFloat;
end;
//==============================================================================
procedure TServiceForm.deDateChange(Sender: TObject);
begin
  SetTakeState;
end;
//==============================================================================
procedure TServiceForm.ComboEdit1Change(Sender: TObject);
begin
  if (OutOrgId = -1) then Exit;
  qRekvizit.close;
  qRekvizit.ParamByName('p_OrgId').Value := OutOrgId;
  qRekvizit.ParamByName('p_OrgInst').Value := OutOrgInst;
  qRekvizit.open;
end;
//==============================================================================
procedure TServiceForm.dbgRekvizitDblClick(Sender: TObject);
begin
  if dbgRekvizit.Height = 21 then dbgRekvizit.Height := 21 * 5
  else dbgRekvizit.Height := 21;
end;
//==============================================================================
procedure TServiceForm.dbgRekvizitExit(Sender: TObject);
begin
  dbgRekvizit.Height := 21;
end;
//==============================================================================
procedure TServiceForm.ceSumsNDSChange(Sender: TObject);
begin
  if SumRefresh = true then
  begin
    SumRefresh := false;
    ceNDS.Value := GetNDS_WithNDS(ceSumsNDS.Value, deDate.Date, 2);
    ceBase.Value := GetNoNDS_WithNDS(ceSumsNDS.Value, deDate.Date, 2);
    if OpenDog = true then
      if GetWithNDS_NoNDS(qDog_Det.FieldByName('Price').AsFloat * qDog_Det.FieldByName('Count_').AsFloat, deDate.Date, 2) <
        FRound(ceSumsNDS.Value, 2) then
      begin
        ShowMessage(TranslateText('Вы не можете ввести сумму с НДС больше за сумму с НДС по договору.'));
        if (ceDog.Text = '') or (ceOperation.Text = '') then ceSumsNDS.Value := 0
        else
          ceSumsNDS.Value := Fround(GetWithNDS_NoNDS(Fround(qDog_Det.FieldByName('price').AsFloat*
            qDog_Det.FieldByName('count_').AsFloat, 2), deDate.Date, 2) - qOutwS.FieldByName('sum_total_s').AsFloat, 2);
        ceNDS.Value := GetNDS_WithNDS(ceSumsNDS.Value, deDate.Date, 2);
        ceBase.Value  := GetNoNDS_WithNDS(ceSumsNDS.Value, deDate.Date, 2);
      end;
    SumRefresh := true;
  end;
end;
//==============================================================================
procedure TServiceForm.ceNDSChange(Sender: TObject);
begin
  if SumRefresh = true then
  begin
    SumRefresh := false;
    ceBase.Value := FROUND(ceNDS.Value/(TAX_RATE(deDate.Date)), 2);
    ceSumsNDS.Value := GetWithNDS_NoNDS(ceNDS.Value/(TAX_RATE(deDate.Date)), deDate.Date, 2);
    if OpenDog = true then
      if GetNDS_NoNDS(qDog_Det.FieldByName('Price').AsFloat * qDog_Det.FieldByName('Count_').AsFloat, deDate.Date, 2) <
        FRound(ceNDS.Value, 2) then
      begin
        ShowMessage(TranslateText('Вы не можете ввести НДС больше за НДС по договору.'));
        if (ceDog.Text = '') or (ceOperation.Text = '') then ceSumsNDS.Value := 0
        else
          ceSumsNDS.Value := Fround(GetWithNDS_NoNDS(Fround(qDog_Det.FieldByName('price').AsFloat*
            qDog_Det.FieldByName('count_').AsFloat, 2), deDate.Date, 2) - qOutwS.FieldByName('sum_total_s').AsFloat, 2);
        ceNDS.Value := GetNDS_WithNDS(ceSumsNDS.Value, deDate.Date, 2);
        ceBase.Value  := GetNoNDS_WithNDS(ceSumsNDS.Value, deDate.Date, 2);
      end;
    SumRefresh := true;
  end;
end;
//==============================================================================
procedure TServiceForm.ceBaseChange(Sender: TObject);
begin
  if SumRefresh = true then
  begin
    SumRefresh := false;
    ceNDS.Value := GetNDS_NoNDS(CEBase.Value, deDate.Date, 2);
    ceSumsNDS.Value := GetWithNDS_NoNDS(CEBase.Value, deDate.Date, 2);
    if OpenDog = true then
      if FRound(qDog_Det.FieldByName('Price').AsFloat * qDog_Det.FieldByName('Count_').AsFloat, 2) <
        FRound(CEBase.Value, 2) then
      begin
        ShowMessage(TranslateText('Вы не можете ввести сумму без НДС больше за сумму без НДС по договору.'));
        if (ceDog.Text = '') or (ceOperation.Text = '') then ceSumsNDS.Value := 0
        else
          ceSumsNDS.Value := Fround(GetWithNDS_NoNDS(Fround(qDog_Det.FieldByName('price').AsFloat*
            qDog_Det.FieldByName('count_').AsFloat, 2), deDate.Date, 2) - qOutwS.FieldByName('sum_total_s').AsFloat, 2);
        ceNDS.Value := GetNDS_WithNDS(ceSumsNDS.Value, deDate.Date, 2);
        ceBase.Value  := GetNoNDS_WithNDS(ceSumsNDS.Value, deDate.Date, 2);
      end;
    SumRefresh := true;
  end;
end;
//==============================================================================

end.
