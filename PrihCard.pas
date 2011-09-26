unit PrihCard;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Mask, DBCtrls,
  ToolEdit, RXDBCtrl, DBGridEh, uHelpButton, uCommonForm,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess{$IFDEF VER150},Variants{$ENDIF};

type
  TPrihCardForm = class(TCommonForm)
    Panel1: TPanel;
    qCardDetail: TOilQuery;
    dsCardDetail: TOraDataSource;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    gbMain: TGroupBox;
    pTransaction: TPanel;
    Label2: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    lDoc: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    eCardNumber: TDBEdit;
    eCause: TDBEdit;
    eNpType: TDBEdit;
    deLitr: TDBEdit;
    deDate: TDBDateEdit;
    eDogPrice: TDBEdit;
    deDocDate: TDBDateEdit;
    deTime: TDBEdit;
    Label3: TLabel;
    gbCorrection: TGroupBox;
    sbEditField: TSpeedButton;
    sbUndoField: TSpeedButton;
    OilHelpButton1: TOilHelpButton;
    gbDov: TGroupBox;
    deDovDate: TDBDateEdit;
    sbDelDov: TSpeedButton;
    eDovPerson: TDBEdit;
    eDovNum: TDBEdit;
    Label16: TLabel;
    Label15: TLabel;
    eDovSer: TDBEdit;
    Label14: TLabel;
    Label4: TLabel;
    gbAuto: TGroupBox;
    sbDelAuto: TSpeedButton;
    sbDelDriver: TSpeedButton;
    dbceDriver: TRxDBComboEdit;
    dbceAutoNumb: TRxDBComboEdit;
    Label7: TLabel;
    Label8: TLabel;
    ceDocNum: TRxDBComboEdit;
    sbClearDoc: TSpeedButton;
    qWork: TOilQuery;
    cbDocOP: TCheckBox;
    qMC5: TOraQuery;
    gbWay: TGroupBox;
    dbg: TDBGridEh;
    procedure dbceAutoNumbButtonClick(Sender: TObject);
    procedure dbceDriverButtonClick(Sender: TObject);
    procedure sbDelAutoClick(Sender: TObject);
    procedure sbDelDriverClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure bbOkClick(Sender: TObject);
    procedure sbDelDovClick(Sender: TObject);
    procedure sbEditFieldClick(Sender: TObject);
    procedure sbUndoFieldClick(Sender: TObject);
    procedure sbDocClick(Sender: TObject);
    procedure ceDocNumButtonClick(Sender: TObject);
    procedure cbDocOPClick(Sender: TObject);
  private
    deDate_prev, deTime_prev, deLitr_prev: string;  //попередні значення полів
    procedure UpdateMC5_ecfil139;
  public
  end;

var
  PrihCardForm: TPrihCardForm;

implementation

uses PrihCardRef, AutoRef, EmpRef, uCrypt, Passw, OilStd, UDbFunc, uXMLForm,
  DogRef, ExFunc;

{$R *.DFM}

procedure TPrihCardForm.dbceAutoNumbButtonClick(Sender: TObject);
var
  AutoRefForm: TAutoRefForm;
begin
Application.CreateForm(TAutoRefForm, AutoRefForm);
AutoRefForm.ShowModal;
if AutoRefForm.ModalResult = mrOk then
  begin
  dbceAutoNumb.DataSource.DataSet.Edit;
  dbceAutoNumb.DataSource.DataSet.FieldByName('Auto_Id').Value := AutoRefForm.q.FieldByName('Id').Value;
  dbceAutoNumb.DataSource.DataSet.FieldByName('Auto_Inst').Value := AutoRefForm.q.FieldByName('Inst').Value;
  dbceAutoNumb.Text := AutoRefForm.q.FieldByName('Numb').Value;
  if not AutoRefForm.qEMPLOY_ID.IsNull then
    begin
    dbceDriver.DataSource.DataSet.FieldByName('Employ_Id').Value := AutoRefForm.q.FieldByName('Employ_Id').Value;
    dbceDriver.DataSource.DataSet.FieldByName('Employ_Inst').Value := AutoRefForm.q.FieldByName('Employ_Inst').Value;
    dbceDriver.Text := AutoRefForm.q.FieldByName('FullName').Value;
    end;
  end;
AutoRefForm.Destroy;
end;

procedure TPrihCardForm.dbceDriverButtonClick(Sender: TObject);
var
EmpRefForm: TEmpRefForm;
begin
Application.CreateForm(TEmpRefForm, EmpRefForm);
EmpRefForm.ShowModal;
if EmpRefForm.ModalResult = mrOk then
  begin
  dbceDriver.DataSource.DataSet.Edit;
  dbceDriver.DataSource.DataSet.FieldByName('Employ_Id').Value := EmpRefForm.q.FieldByName('Id').Value;
  dbceDriver.DataSource.DataSet.FieldByName('Employ_Inst').Value := EmpRefForm.q.FieldByName('Inst').Value;
  dbceDriver.Text := EmpRefForm.q.FieldByName('F_Name').AsString;
  if not(EmpRefForm.q.FieldByName('I_Name').IsNull)
    then dbceDriver.Text := dbceDriver.Text + ' ' + EmpRefForm.q.FieldByName('I_Name').AsString[1] + '.';
  if not(EmpRefForm.q.FieldByName('O_Name').IsNull)
    then dbceDriver.Text := dbceDriver.Text + ' ' + EmpRefForm.q.FieldByName('O_Name').AsString[1] + '.';
  end;
EmpRefForm.Destroy;
end;

procedure TPrihCardForm.sbDelAutoClick(Sender: TObject);
begin
dbceAutoNumb.DataSource.DataSet.Edit;
dbceAutoNumb.DataSource.DataSet.FieldByName('Auto_Id').Clear;
dbceAutoNumb.DataSource.DataSet.FieldByName('Auto_Inst').Clear;
dbceAutoNumb.DataSource.DataSet.FieldByName('Auto_Numb').Clear;
end;

procedure TPrihCardForm.sbDelDriverClick(Sender: TObject);
begin
dbceDriver.DataSource.DataSet.Edit;
dbceDriver.DataSource.DataSet.FieldByName('Employ_Id').Clear;
dbceDriver.DataSource.DataSet.FieldByName('Employ_Inst').Clear;
dbceDriver.DataSource.DataSet.FieldByName('Employ_Name').Clear;
end;

procedure TPrihCardForm.FormShow(Sender: TObject);
begin
  qCardDetail.Open;
  cbDocOP.Checked := ceDocNum.DataSource.DataSet.FieldByName('REQUEST_ID').AsInteger <> 0;
  deDate_prev := deDate.Field.AsString;
  deTime_prev := deTime.Field.AsString;
  deLitr_prev := deLitr.Field.AsString;
end;

procedure TPrihCardForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qCardDetail.Close;
end;

procedure TPrihCardForm.dbgGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
if qCardDetail.FieldByName('Oper_Type').AsInteger = 0
 then AFont.Color := $00007F00;
if qCardDetail.FieldByName('Oper_Type').AsInteger = 1
 then AFont.Color := $007F0000;
end;

procedure TPrihCardForm.bbOkClick(Sender: TObject);
begin
  if (deDate.DataSource.DataSet.FieldByName('Auto_Id').AsInteger <> 0)
    or (deDate.DataSource.DataSet.FieldByName('Employ_Id').AsInteger <> 0) then
    if not ((deDate.DataSource.DataSet.FieldByName('Auto_Id').AsInteger <> 0)
      and (deDate.DataSource.DataSet.FieldByName('Employ_Id').AsInteger <> 0)) then
      raise Exception.Create(TranslateText('Необходимо выбрать и автомобиль и водителя!'));

  if dbceAutoNumb.DataSource.DataSet.State <> dsBrowse then
  begin
    dbceAutoNumb.DataSource.DataSet.Post;
    RecalcByCard(
      deDate.DataSource.DataSet.FieldByName('gr_card_num').asInteger,
      deDate.DataSource.DataSet.FieldByName('cardscheme').asInteger - 1,
      deDate.DataSource.DataSet.FieldByName('to_id').asInteger,
      deDate.DataSource.DataSet.FieldByName('to_inst').asInteger,
      false
    );
  end;

  if (deDate_prev <> deDate.Field.AsString) or
     (deTime_prev <> deTime.Field.AsString) or
     (deLitr_prev <> deLitr.Field.AsString) then
        UpdateMC5_ecfil139;

  ModalResult := mrOk;
end;

procedure TPrihCardForm.UpdateMC5_ecfil139;
var
  p_time: string;
begin
  if not DBObjectExists('ECFIL139','TABLE',AdmSettings.Get('CARD_USER')) then
    Exit;
  if StrToDate(ReadOilVar('INST_MOVE_DATE')) > deDate.Field.AsDateTime then
  begin
    if MessageDlg(TranslateText('Данная транзакция создана автоматически при переходе на филиал! Petrol отредактирован не будет! ')+#10#13
      +TranslateText('Продолжить?'),mtConfirmation,[mbYes,mbCancel],0) = mrYes
    then
      exit
    else
      raise Exception.Create(TranslateText('Операция отменена пользователем.'));
  end;

  qMC5.Close;
  p_time := deTime.Field.AsString;
  qMC5.MacroByName('card_user').Value:=AdmSettings.Get('CARD_USER');
  qMC5.ParamByName('p_date').Value := deDate.Field.AsDateTime;
  qMC5.ParamByName('p_count_litr').AsFloat := deLitr.Field.AsFloat;
  qMC5.ParamByName('p_time').AsInteger := StrToInt(copy(p_time,1,2))*3600 +
                                          StrToInt(copy(p_time,3,2))*60 +
                                          StrToInt(copy(p_time,5,2));
  qMC5.ParamByName('ID').AsInteger := dbceAutoNumb.DataSource.DataSet.FieldByName('ID').AsInteger;
  qMC5.ParamByName('TRN_GUID').AsString := dbceAutoNumb.DataSource.DataSet.FieldByName('TRN_GUID').AsString;
  qMC5.ExecSQL;
end;

procedure TPrihCardForm.sbDelDovClick(Sender: TObject);
begin
 eDovSer.DataSource.DataSet.Edit;
 eDovSer.DataSource.DataSet.FieldByName('dov_ser').Clear;
 eDovNum.DataSource.DataSet.FieldByName('dov_num').Clear;
 eDovPerson.DataSource.DataSet.FieldByName('dov_who').Clear;
 deDovDate.DataSource.DataSet.FieldByName('dov_date').Clear;
 //eCardPrice.DataSource.DataSet.FieldByName('card_price').Clear;
end;

procedure TPrihCardForm.sbEditFieldClick(Sender: TObject);
begin
  if not TestPassword(pwtOrg) then Exit;
  deDate.Enabled := true;
  deTime.Enabled := true;
  deLitr.Enabled := true;
  deDate.Color := clWhite;
  deTime.Color := clWhite;
  deLitr.Color := clWhite;
end;

procedure TPrihCardForm.sbUndoFieldClick(Sender: TObject);
begin
  if mrYes = MessageDlg(TranslateText('Подтвердите отмену корректировки'),mtConfirmation,[mbYes,mbNo],0) then
    begin  // апдейтимо card_transaction та мегікеш
      _ExecSQL(
        ' update card_transaction set '+
        ' date_=corr_date, count_litr=corr_litr, time_=corr_time,'+
        ' corr_date=null, corr_litr=null, corr_time=null '+
        ' where oil_id = '+ deDate.DataSource.DataSet.FieldByName('oil_id').AsString +
        ' and oil_inst = '+ deDate.DataSource.DataSet.FieldByName('oil_inst').AsString
      );
      RecalcByCard(
        deDate.DataSource.DataSet.FieldByName('gr_card_num').asInteger,
        deDate.DataSource.DataSet.FieldByName('cardscheme').asInteger - 1,
        deDate.DataSource.DataSet.FieldByName('to_id').asInteger,
        deDate.DataSource.DataSet.FieldByName('to_inst').asInteger,
        false
      );
      deDate.DataSource.DataSet.Refresh;
      ShowMessage(TranslateText('После нажатия кнопки "Принять" все корректировки этой транзакции будут востановлены'));
    end;
end;
//==============================================================================
procedure TPrihCardForm.sbDocClick(Sender: TObject);
begin
  ceDocNum.DataSource.DataSet.Edit;
  ceDocNum.DataSource.DataSet.FieldByName('REQUEST_ID').Clear;
  ceDocNum.DataSource.DataSet.FieldByName('REQUEST_INST').Clear;

  ceDocNum.DataSource.DataSet.FieldByName('DOG_ID').Clear;
  ceDocNum.DataSource.DataSet.FieldByName('DOG_INST').Clear;

  ceDocNum.DataSource.DataSet.FieldByName('DOG_NUM').Clear;
  ceDocNum.DataSource.DataSet.FieldByName('DOG_DATE').Clear;

  eDogPrice.Enabled := (ceDocNum.DataSource.DataSet.FieldByName('CAUSE_ID').AsInteger in [3, 4, 5, 6, 7])
    and (ceDocNum.DataSource.DataSet.FieldByName('DOG_ID').AsInteger = 0);
end;
//==============================================================================
procedure TPrihCardForm.ceDocNumButtonClick(Sender: TObject);
var
  ID, INST: integer;
  NAME: string;
  F: TDogRefForm;
  SumTr: real;
begin
  if cbDocOP.Checked then
  begin
    if XMLChoose('CardRequestRef', ID, INST, NAME) then
    begin
      qWork.Close;
      qWork.SQL.Text :=
        'select * from v_card_request_full where head_id = :id and head_inst = :inst ' +
        'and np_group_petrol_id = :np_id and card_number = :card_number';
      _OpenQueryPar(qWork,
        ['id',          id,
         'inst',        inst,
         'np_id',       ceDocNum.DataSource.DataSet.FieldByName('np_type').asInteger,
         'card_number', ceDocNum.DataSource.DataSet.FieldByName('gr_card_num').asInteger
         ]);
      if qWork.IsEmpty then
        raise Exception.Create(TranslateText('В выбраной заявке нет данной карты с данным типом нефтепродукта!'));

      if not ((qWork['to_id'] = ceDocNum.DataSource.DataSet['to_id'])
        and (qWork['to_inst'] = ceDocNum.DataSource.DataSet['to_inst'])) then
        raise Exception.Create(TranslateText('Не соответствует клиент!'));

      ceDocNum.DataSource.DataSet.Edit;
      ceDocNum.DataSource.DataSet.FieldByName('DOG_ID').Clear;
      ceDocNum.DataSource.DataSet.FieldByName('DOG_INST').Clear;

      ceDocNum.DataSource.DataSet.FieldByName('REQUEST_ID').AsInteger := ID;
      ceDocNum.DataSource.DataSet.FieldByName('REQUEST_INST').AsInteger := INST;

      ceDocNum.DataSource.DataSet.FieldByName('DOG_NUM').AsString := NAME;
      ceDocNum.DataSource.DataSet.FieldByName('DOG_DATE').AsDateTime := qWork['date_'];
    end;
  end
  else
  begin
    Application.CreateForm(TDogRefForm, F);
    F.gbDogType.Enabled := False;
    F.rbKart.Checked := true;

    if (ceDocNum.DataSource.DataSet.FieldByName('Cause_Id').AsInteger in [5, 7]) then // ЕК
    begin
      F.cbScheme.ItemIndex := 0;
      F.cbPay.ItemIndex := 1;
    end
    else
      if (ceDocNum.DataSource.DataSet.FieldByName('Cause_Id').AsInteger = 12)
        and (ceDocNum.DataSource.DataSet.FieldByName('DOG_REAL_FOREPAY').AsInteger = 0) then // ЛС
      begin
        F.cbScheme.ItemIndex := 1;
        F.cbPay.ItemIndex := 0;
      end;
    if F.cbScheme.ItemIndex <> -1 then F.cbScheme.Enabled := False;
    if F.cbPay.ItemIndex <> - 1 then F.cbPay.Enabled := False;

    F.PAdd.Visible := false;
    F.PEdit.Visible := false;
    F.pDel.Visible := false;

    F.eTo.Tag := ceDocNum.DataSource.DataSet['to_id'];
    F.lTo.Tag := ceDocNum.DataSource.DataSet['to_inst'];
    F.eTo.Text := ceDocNum.DataSource.DataSet['TONAME'];
    F.eTo.Enabled := False;
    F.sbToClear.Enabled := False;

    F.eDate.Date := ceDocNum.DataSource.DataSet['OPER_DATE'] - 10;
    F.eToDate.Date := ceDocNum.DataSource.DataSet['OPER_DATE'] + 10;

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      qWork.Close;
      qWork.SQL.Text :=
        'select price_nds, litr from v_oil_dog_full where dog_id = :dog_id and dog_inst = :dog_inst and petrol_id = :petrol_id';
      _OpenQueryPar(qWork,
        ['dog_id',    F.qId.AsInteger,
         'dog_inst',  F.qInst.AsInteger,
         'petrol_id', ceDocNum.DataSource.DataSet['NP_TYPE']]);

      if qWork.IsEmpty then
        raise Exception.Create(TranslateText('У выбранном договоре нет данного типа нефтепродукта!'));

      if not ((ceDocNum.DataSource.DataSet['to_id'] = F.qTO_.AsInteger)
        and (ceDocNum.DataSource.DataSet['to_inst'] = F.qTO_INST.AsInteger)) then
        raise Exception.Create(TranslateText('Не соответствует клиент!'));

      if F.qSHARE_ID.AsInteger = 0 then
      begin
        if not (qWork['price_nds'] = ceDocNum.DataSource.DataSet.FieldByName('PRICE_DOG_NDS').AsCurrency) then
          raise Exception.Create(TranslateText('Не соответствует цена!'));
      end
      else
      begin
        if 0 < nvl(GetSqlValueParSimple(
          'select count(*) from v_Card_Receipts where np_type = :np_id' +
          ' and dog_id = :dog_id and dog_inst = :dog_inst and not (oil_id = :oil_id and oil_inst = :oil_inst)',
          ['dog_id',   F.qId.AsInteger,
           'dog_inst', F.qInst.AsInteger,
           'np_id',    ceDocNum.DataSource.DataSet['NP_TYPE'],
           'oil_id',   ceDocNum.DataSource.DataSet['OIL_ID'],
           'oil_inst', ceDocNum.DataSource.DataSet['OIL_INST']]), 0) then
         raise Exception.Create(TranslateText('Акционный договор, может иметь по каждому НП только по одной транзакции!'));
      end;

      SumTr :=
        nvl(GetSqlValueParSimple(
          'select sum(litr)' +
          '  from (select litr' +
          '          from v_Card_Receipts' +
          '         where np_type = :np_id' +
          '           and dog_id = :dog_id and dog_inst = :dog_inst' +
          '           and not (oil_id = :oil_id and oil_inst = :oil_inst)' +
          '        union all' +
          '        select litr' +
          '          from v_Card_Receipts' +
          '         where np_type = :np_id' +
          '           and oil_id = :oil_id and oil_inst = :oil_inst)',
          ['dog_id',   F.qId.AsInteger,
           'dog_inst', F.qInst.AsInteger,
           'np_id',    ceDocNum.DataSource.DataSet['NP_TYPE'],
           'oil_id',   ceDocNum.DataSource.DataSet['OIL_ID'],
           'oil_inst', ceDocNum.DataSource.DataSet['OIL_INST']]), 0);
      if qWork['litr'] < SumTr then
        raise Exception.Create(TranslateText('По договору литров меньше чем по транзакциям!'));

      ceDocNum.DataSource.DataSet.Edit;
      ceDocNum.DataSource.DataSet.FieldByName('REQUEST_ID').Clear;
      ceDocNum.DataSource.DataSet.FieldByName('REQUEST_INST').Clear;

      ceDocNum.DataSource.DataSet.FieldByName('DOG_ID').AsInteger := F.qId.AsInteger;
      ceDocNum.DataSource.DataSet.FieldByName('DOG_INST').AsInteger := F.qInst.AsInteger;

      ceDocNum.DataSource.DataSet.FieldByName('DOG_NUM').AsString := F.qDog.AsString;
      ceDocNum.DataSource.DataSet.FieldByName('DOG_DATE').AsDateTime := F.qDog_Date.AsDateTime;
    end;
    F.Free;
    eDogPrice.Enabled := (ceDocNum.DataSource.DataSet.FieldByName('CAUSE_ID').AsInteger in [3, 4, 5, 6, 7])
      and (ceDocNum.DataSource.DataSet.FieldByName('DOG_ID').AsInteger = 0);
  end;
end;
//==============================================================================
procedure TPrihCardForm.cbDocOPClick(Sender: TObject);
begin
  if cbDocOP.Checked then lDoc.Caption := TranslateText('Заявка №')
  else lDoc.Caption := TranslateText('Договор-заявка');
end;
//==============================================================================

end.
