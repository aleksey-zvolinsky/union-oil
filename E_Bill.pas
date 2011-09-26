unit E_Bill;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, RxRichEd, CurrEdit, Buttons, DBTables,
  Db, RXCtrls, ComCtrls, Grids, DBGrids, RXDBCtrl, Menus, RxLookup,
  RxMemDS, uCommonForm, Ora,uOilQuery,uOilStoredProc, MemDS, DBAccess,
  DBGridEh{$IFDEF VER150},Variants{$ENDIF};

type
  TE_BillForm = class(TCommonForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    q: TOilQuery;
    dsFil: TOraDataSource;
    qDelFilials: TOilQuery;
    qFilials: TOilQuery;
    qFilialsE_BILL_ID: TFloatField;
    qFilialsE_BILL_INST: TFloatField;
    qFilialsORG_ID: TFloatField;
    qFilialsORG_INST: TFloatField;
    qFilialsSTATE: TStringField;
    qFilialsSUMM: TFloatField;
    qFilialsNDS: TFloatField;
    qFilialsSUMMBEZ: TFloatField;
    qFilialsORG_NAME: TStringField;
    qBank: TOilQuery;
    dsBank: TOraDataSource;
    TblFil: TRxMemoryData;
    TblFilE_BILL_ID: TFloatField;
    TblFilE_BILL_INST: TFloatField;
    TblFilORG_ID: TFloatField;
    TblFilORG_INST: TFloatField;
    TblFilSUMM: TFloatField;
    TblFilNDS: TFloatField;
    TblFilSUMMBEZ: TFloatField;
    TblFilORG_NAME: TStringField;
    Panel8: TPanel;
    RBPost: TRadioButton;
    RBPlat: TRadioButton;
    Panel14: TPanel;
    RBKassa: TRadioButton;
    RBRs: TRadioButton;
    LEBank: TRxLookupEdit;
    CEOrg: TComboEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    CEPermit: TComboEdit;
    CESpring: TComboEdit;
    ceBudget: TComboEdit;
    CEActivity: TComboEdit;
    CEObject: TComboEdit;
    Label29: TLabel;
    Label11: TLabel;
    edNumber: TEdit;
    Label3: TLabel;
    deDate: TDateEdit;
    CalcSumm: TRxCalcEdit;
    CalcNDS: TRxCalcEdit;
    CalcSummBez: TRxCalcEdit;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    CBNoNDS: TCheckBox;
    EComments: TEdit;
    Label7: TLabel;
    DBGridE_Bill_Filials: TDBGridEh;
    Panel9: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    SpeedButton2: TSpeedButton;
    Panel5: TPanel;
    CB1: TCheckBox;
    CB2: TCheckBox;
    cbVozvrat: TCheckBox;
    Label8: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label9: TLabel;
    Label25: TLabel;
    Label30: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    qRekvizit: TOilQuery;
    LAllocatur: TLabel;
    Label35: TLabel;
    qBankID: TFloatField;
    qBankINST: TFloatField;
    qBankRACH_CHET: TStringField;
    qBankFACE_CHET: TStringField;
    qBankMFO: TStringField;
    qBankBANK_NAME: TStringField;
    qBankORG_NAME: TStringField;
    qBankORG_TYPE: TFloatField;
    qBankOBL_ID: TFloatField;
    qBankOBL_INST: TFloatField;
    qBankNAL_NUM: TStringField;
    qBankID_NUM: TStringField;
    qBankNAME: TStringField;
    sbClearPermit: TSpeedButton;
    SpeedButton1: TSpeedButton;
    TblFilPERMIT_ID: TIntegerField;
    TblFilPERMIT_NAME: TStringField;
    TblFilPERMIT_SUMM: TFloatField;
    pmFilials: TPopupMenu;
    nDelRecord: TMenuItem;
    nDelPermit: TMenuItem;
    SpeedButton3: TSpeedButton;
    rgTypePermit: TRadioGroup;
    nRefreshNDS: TMenuItem;
    SpeedButton4: TSpeedButton;
    procedure RBPlatClick(Sender: TObject);
    procedure RBPostClick(Sender: TObject);
    procedure CEOrgButtonClick(Sender: TObject);
    procedure ceBudgetButtonClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure SaveFilials;
    procedure CalcSummChange(Sender: TObject);
    procedure DBGridE_Bill_FilialsEditButtonClick(Sender: TObject);
    function TestFilials: Boolean;
    function TestPermit(PermitID, RecordNum: integer; PermitName: string; PermitSumm, Summ: real; var GetSumm: real): Boolean;
    procedure SumFilials(var Summ, NDS, SummBez: real);
    procedure ShowFilialsItogo;
    procedure TblFilAfterPost(DataSet: TDataSet);
    procedure ActivateQBank(OrgId, OrgInst: integer; LEBank: TRxLookupEdit);
    procedure CalcSummKeyPress(Sender: TObject; var Key: Char);
    procedure CBNoNDSClick(Sender: TObject);
    procedure RBKassaClick(Sender: TObject);
    procedure RBRsClick(Sender: TObject);
    function CannotAccept: Boolean;
    procedure CEOrgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridE_Bill_FilialsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CEActivityButtonClick(Sender: TObject);
    procedure CESpringButtonClick(Sender: TObject);
    procedure CEPermitButtonClick(Sender: TObject);
    procedure CEObjectButtonClick(Sender: TObject);
    procedure edNumberKeyPress(Sender: TObject; var Key: Char);
    procedure LEBankKeyPress(Sender: TObject; var Key: Char);
    procedure LEBankChange(Sender: TObject);
    procedure qBankCalcFields(DataSet: TDataSet);
    procedure sbClearPermitClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TblFilCalcFields(DataSet: TDataSet);
    procedure SpeedButton3Click(Sender: TObject);
    procedure nDelPermitClick(Sender: TObject);
    procedure rgTypePermitClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    BillId, BillInst, OrgId, OrgInst: integer;
    OblSumm, OblNDS, OblSummBez, SummAllocatur {сума дозволена на витрату}: real;
    Source: char;
    procedure ShowBankData(inst: integer);
    procedure ShowRekvizit;
  public
  end;

var
  E_BillForm: TE_BillForm;

procedure AddBill;
function EditBill(Id, Inst: integer): TModalResult;

implementation

{$R *.DFM}

uses Main, UDbFunc, ChooseOrg, ExFunc, MoneyFunc, OilStd, E_BillRef, E_Var, uStart, uXMLForm;

//==============================================================================
procedure AddBill;
var
  F: TE_BillForm;
begin
  Application.CreateForm(TE_BillForm, F);
  F.BillId := 0;
  F.BillInst := E_ORGINST;
  F.deDate.Date := GetSystemDate;
  F.Source := 'H';
  F.TblFil.Open;
  F.ShowFilialsItogo;
  F.ActivateQBank(E_ORGINST, E_ORGINST, F.LEBank);
  F.SummAllocatur := 0;
  F.LAllocatur.Caption := MoneyToStr(F.SummAllocatur);
  F.CESpring.Tag := 2;
  F.CESpring.Text := TranslateText('В пределах бюджета');
  F.rgTypePermitClick(nil);
  F.ShowModal;
  F.Free;
end;
//==============================================================================
function EditBill(Id, Inst: integer): TModalResult;
var
  F: TE_BillForm;
  summ, nds, summbez: real;
  PermitAction: boolean;

  //************************РАСПРЕДЕЛЕНИЕ ПО ФИЛИАЛАМ***************************
  procedure ShowFilials;
  begin
    PermitAction := false;
    summ := 0;
    summbez := 0;
    nds := 0;

    if not F.TblFil.Active then F.TblFil.Open;
    F.q.First;
    while not F.q.Eof do
    begin
      summ := summ + F.q.FieldByName('Summ').Value;
      nds := nds + F.q.FieldByName('NDS').Value;
      summbez := summbez + F.q.FieldByName('SummBez').Value;
      if F.q.FieldByName('inst').Value <> F.q.FieldByName('AZS_INST').AsInteger then
      begin
        F.TblFil.Insert;
        F.TblFilE_Bill_ID.Value := Id;
        F.TblFilE_Bill_Inst.Value := Inst;
        F.TblFilOrg_Id.AsInteger := F.q.FieldByName('AZS_ID').AsInteger;
        F.TblFilOrg_Inst.AsInteger := F.q.FieldByName('AZS_INST').AsInteger;
        F.TblFilOrg_Name.Value := F.q.FieldByName('AZS_Name').Value;
        F.TblFilSumm.Value := F.q.FieldByName('Summ').Value;
        F.TblFilNDS.Value := F.q.FieldByName('NDS').Value;;
        F.TblFilSummBez.Value := F.q.FieldByName('SummBez').Value;
        F.TblFilPERMIT_ID.AsInteger := F.q.FieldByName('PERMIT_ID').AsInteger;
        F.TblFilPERMIT_NAME.AsString := F.q.FieldByName('PERMIT_NAME').AsString;
        F.TblFilPERMIT_SUMM.AsFloat := F.q.FieldByName('PERMIT_SUMM').AsFloat;
        F.TblFil.Post;
        if not PermitAction then PermitAction := F.q.FieldByName('PERMIT_ID').AsInteger <> 0;
      end;
      F.q.Next;
    end;
  end;
  //****************************************************************************
begin
  Application.CreateForm(TE_BillForm, F);
  F.Caption := TranslateText('Редактирование платежа/поступления');
  F.q.UnPrepare;
  F.q.Prepare;
  F.q.ParamByName('id').AsInteger := Id;
  F.q.ParamByName('inst').AsInteger := Inst;
  F.q.Open;
  F.BillId := Id;
  F.BillInst := Inst;
  // определяем, платеж это или поступление
  if F.q.FieldByName('debkr').AsInteger = 1 then F.RBPost.Checked := TRUE
  else F.RBPlat.Checked := TRUE;
  F.CEOrg.Text := F.q.FieldByName('client_name').AsString;
  F.OrgId := F.q.FieldByName('client_id').AsInteger;
  F.OrgInst := F.q.FieldByName('client_inst').AsInteger;
  // Возврат
  if F.q.FieldByName('VOZVRAT').AsString = 'Y' then F.cbVozvrat.Checked := true
  else F.cbVozvrat.Checked := false;
  // звідки запись
  if F.q.FieldByName('Source').AsString = 'H' then F.Source := 'H'
  else F.Source := 'E';
  F.edNumber.Text := F.q.FieldByName('Numb').AsString;
  F.deDate.Date := F.q.FieldByName('Date_').Value;
  F.EComments.Text := F.q.FieldByName('Comments').AsString;
  // загружаємо дані по статті бюджету, джерела, дозволу і об"єкту
  F.ceBudget.Tag := F.q.FieldByName('Budget_ID').AsInteger;
  F.CEBudget.Text := F.q.FieldByName('Budget_name').AsString;
  F.CEActivity.Tag := F.q.FieldByName('activity_ID').AsInteger;
  F.CEActivity.Text := F.q.FieldByName('activity_name').AsString;
  F.CESpring.Tag := F.q.FieldByName('spring_id').AsInteger;
  F.CESpring.Text := F.q.FieldByName('spring_name').AsString;
  F.CEObject.Tag := F.q.FieldByName('object_id').AsInteger;
  F.CEObject.Text := F.q.FieldByName('object_name').AsString;
  F.CB1.Checked := IntToBool(F.q.FieldByName('VD').AsInteger) and F.RBPost.Checked or
    IntToBool(F.q.FieldByName('VR').AsInteger) and F.RBPlat.Checked;
  F.CB2.Checked := IntToBool(F.q.FieldByName('NOB').AsInteger) and F.RBPost.Checked or
    IntToBool(F.q.FieldByName('NK').AsInteger) and F.RBPlat.Checked;
  // загружаємо дані банку
  F.ShowBankData(F.q.FieldByName('inst').AsInteger);
  if F.RBRs.Checked and F.RBPlat.Checked then F.qBank.First;
  F.qRekvizit.Close;
  F.qRekvizit.ParamByName('id').AsInteger := F.OrgId;
  F.qRekvizit.ParamByName('Inst').AsInteger := F.OrgInst;
  F.qRekvizit.Open;
  F.ShowRekvizit;
  F.q.First;
  while not F.q.Eof do
  begin
    if F.q.FieldByName('inst').Value = F.q.FieldByName('AZS_INST').AsInteger then
    begin
      // загружаємо суму дозволу
      F.CEPermit.Tag := F.q.FieldByName('Permit_ID').AsInteger;
      F.CEPermit.Text := F.q.FieldByName('Permit_name').AsString;
    end;
    F.q.Next;
  end;
  // загружаємо дані по філіалам
  ShowFilials;
  if F.CEPermit.Tag <> 0 then
  begin
    F.rgTypePermit.ItemIndex := 0;
    F.SummAllocatur := GetSQLValue('select summ from e_permit where id = '+ IntToStr(F.CEPermit.Tag));
    F.LAllocatur.Caption := MoneyToStr(F.SummAllocatur);
  end
  else
    if PermitAction = true then F.rgTypePermit.ItemIndex := 1;
  F.rgTypePermitClick(nil);
  // записуємо дані по сумам
  F.CalcSumm.Value := summ;
  F.CalcSummBez.Value := summbez;
  F.CalcNDS.Value := nds;
  if nds = 0 then F.cbNoNDS.Checked := TRUE
  else F.cbNoNDS.Checked := FALSE;
  F.ShowFilialsItogo;
  result := F.ShowModal;
  F.Free;
end;
//==============================================================================
procedure TE_BillForm.ShowBankData(inst: integer); // РАСЧЕТНЫЙ СЧЕТ И БАНК
begin
  ActivateQBank(inst, inst, LEBank);
  if q.FieldByName('Rekvizit_Id').AsInteger = 0 then RBKassa.Checked := TRUE
  else
  begin
    while not qBank.Eof and ((qBank.FieldByName('Id').AsInteger <> q.FieldByName('Rekvizit_Id').AsInteger) or
      (qBank.FieldByName('Inst').AsInteger <> q.FieldByName('Rekvizit_Inst').AsInteger)) do
      qBank.Next;
      if (qBank.FieldByName('Id').AsInteger <> q.FieldByName('Rekvizit_Id').AsInteger) or
        (qBank.FieldByName('Inst').AsInteger <> q.FieldByName('Rekvizit_Inst').AsInteger) then
      begin
        MessageDlg(TranslateText('Указанный расчетный счет не найден в справочнике организаций.')+#13#10+
            TranslateText('Будет использован расчетный счет, указанный по умолчанию.'), mtError, [mbOk], 0);
        qBank.First;
      end
      else LEBank.Text := qBank.FieldByName('name').AsString;
  end;
end;
//==============================================================================
procedure TE_BillForm.ActivateQBank(OrgId, OrgInst: integer; LEBank: TRxLookupEdit);
begin
  with QBank do
  begin
    if Active then Close;
    ParamByName('obl_id').Value := OrgId;
    Prepare;
    Open;
    if RecordCount > 0 then
    begin
      LEBank.Text := FieldByName('name').AsString;
      ShowRekvizit;
    end;
  end;
end;
//==============================================================================
procedure TE_BillForm.CEBudgetButtonClick(Sender: TObject);
var
  ActivityId, BudgetId: integer;
  ActivityName, BudgetName: string;
begin
  if GetBudgetExt(BudgetId, BudgetName, ActivityId, ActivityName) then
  begin
    ceBudget.Tag := BudgetId;
    CEBudget.Text := BudgetName;
    CEActivity.Tag := ActivityId;
    CEActivity.Text := ActivityName;
  end;
end;
//==============================================================================
procedure TE_BillForm.CEActivityButtonClick(Sender: TObject);
begin
  if XMLChoose('E_BudgetTypeRef', CEActivity) then
  begin
    CEBudget.Text := '';
    ceBudget.Tag := 0;
  end;
end;
//==============================================================================
procedure TE_BillForm.CESpringButtonClick(Sender: TObject);
begin
  XMLChoose('E_SpringRef', CESpring);
end;
//==============================================================================
procedure TE_BillForm.CEPermitButtonClick(Sender: TObject);
begin
  XMLChoose('E_PermitRef', CEPermit);
  if (CEPermit.Tag <> 0) then
  begin
    SummAllocatur := GetSQLValue('select summ from e_permit where id = '+ IntToStr(CEPermit.Tag));
    LAllocatur.Caption := MoneyToStr(SummAllocatur);
    LAllocatur.Visible := true;
    Label35.Visible := true;
  end;
end;
//==============================================================================
procedure TE_BillForm.CEObjectButtonClick(Sender: TObject);
begin
  XMLChoose('E_ObjectRef', CEObject);
end;
//==============================================================================
procedure TE_BillForm.sbClearPermitClick(Sender: TObject);
begin
  CEPermit.Tag := 0;
  CEPermit.Text := '';
  LAllocatur.Visible := False;
  Label35.Visible := False;
end;
//==============================================================================
procedure TE_BillForm.SpeedButton1Click(Sender: TObject);
begin
  CEObject.Tag := 0;
  CEObject.Text := '';
end;
//==============================================================================
procedure TE_BillForm.CBNoNDSClick(Sender: TObject);
begin
  if CBNoNDS.Checked then
  begin
    CalcNDS.Value := 0;
    CalcNDS.Enabled := FALSE;
    CalcSummBez.Value := CalcSumm.Value;
    CalcSummBez.Enabled := FALSE;
  end
  else
  begin
    CalcNDS.Value := GetNDS_WithNDS(CalcSumm.Value, StrToDateTime(FormatDateTime2('dd.mm.yyyy', GetSystemDate)), 2);
    CalcNDS.Enabled := TRUE;
    CalcSummBez.Value := GetNoNDS_WithNDS(CalcSumm.Value, StrToDateTime(FormatDateTime2('dd.mm.yyyy', GetSystemDate)), 2);
    CalcSummBez.Enabled := TRUE;
  end;
  TblFilCalcFields(nil);  // робимо перерахунок
end;
//==============================================================================
procedure TE_BillForm.CalcSummChange(Sender: TObject);
begin
  if CBNoNDS.Checked then
  begin
    CalcNDS.Value := 0;
    CalcSummBez.Value := CalcSumm.Value;
  end
  else
  begin
    CalcNDS.Value := GetNDS_WithNDS(CalcSumm.Value, StrToDateTime(FormatDateTime2('dd.mm.yyyy', GetSystemDate)), 2);
    CalcSummBez.Value := GetNoNDS_WithNDS(CalcSumm.Value, StrToDateTime(FormatDateTime2('dd.mm.yyyy', GetSystemDate)), 2);
  end;
  TblFilCalcFields(nil);  // робимо перерахунок
end;
//==============================================================================
procedure TE_BillForm.CalcSummKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '-' then Key := #0;
end;
//==============================================================================
procedure TE_BillForm.CEOrgButtonClick(Sender: TObject);
var
  name: string;
begin
  if CaptureOrg(4, 0, 0, 'yyy', OrgId, OrgInst, name) then CEOrg.Text := name;
  qRekvizit.Close;
  qRekvizit.ParamByName('id').AsInteger := OrgId;
  qRekvizit.ParamByName('Inst').AsInteger := OrgInst;
  qRekvizit.Open;
  ShowRekvizit;
end;
//==============================================================================
procedure TE_BillForm.CEOrgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (Key = 13) then CEOrgButtonClick(Sender)
  else
    if (ssShift in Shift) then ceBudget.SetFocus;
end;
//==============================================================================
procedure TE_BillForm.RBKassaClick(Sender: TObject);
begin
  LEBank.Enabled := FALSE;
  LEBank.Text := '';
  ShowRekvizit;
end;
//==============================================================================
procedure TE_BillForm.RBRsClick(Sender: TObject);
begin
  LEBank.Enabled := TRUE;
  ActivateQBank(E_ORGINST, E_ORGINST, LEBank);
  ShowRekvizit;
end;
//==============================================================================
procedure TE_BillForm.RBPlatClick(Sender: TObject);
begin
  CB1.Caption := TranslateText('Валовые расходы');
  CB2.Caption := TranslateText('Нал. кредит');
  Label1.Caption := TranslateText('Получатель:');
  Label2.Caption := TranslateText('Плательщик:');
  RBRs.Caption := TranslateText('С р/с');
  ShowRekvizit;
end;
//==============================================================================
procedure TE_BillForm.RBPostClick(Sender: TObject);
begin
  CB1.Caption := TranslateText('Валовые доходы');
  CB2.Caption := TranslateText('Нал. обязательства');
  Label1.Caption := TranslateText('Плательщик:');
  Label2.Caption := TranslateText('Получатель:');
  RBRs.Caption := TranslateText('На р/с');
  ShowRekvizit;
end;
//==============================================================================
procedure TE_BillForm.ShowFilialsItogo;
var
  Summ, NDS, SummBez: real;
begin
  SumFilials(Summ, NDS, SummBez);
  Label17.Caption := MoneyToStr(Summ);
  Label18.Caption := MoneyToStr(NDS);
  Label19.Caption := MoneyToStr(SummBez);
  OblSumm := CalcSumm.Value - Summ;
  OblNDS := CalcNDS.Value - NDS;
  OblSummBez := CalcSummBez.Value - SummBez;
  Label22.Caption := MoneyToStr(CalcSumm.Value - Summ);
  Label23.Caption := MoneyToStr(CalcNDS.Value - NDS);
  Label24.Caption := MoneyToStr(CalcSummBez.Value - SummBez);    
end;
//==============================================================================
procedure TE_BillForm.edNumberKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then key := #0;
end;
//==============================================================================
procedure TE_BillForm.SumFilials(var Summ, NDS, SummBez: real);
begin
  TblFil.First;
  Summ := 0;
  NDS := 0;
  SummBez := 0;
  while not TblFil.Eof do
  begin
    Summ := Summ + TblFilSumm.Value;
    NDS := NDS + TblFilNDS.Value;
    SummBez := SummBez + TblFilSummBez.Value;
    TblFil.Next;
  end;
  TblFil.First;
end;
//==============================================================================
function TE_BillForm.CannotAccept: Boolean;
var
  s: string;
  i: integer;
begin
  try
    s := '';
    if OrgId = 0 then
      s := s + TranslateText('Не определена организация!') + #13#10;
    if ceBudget.Tag = 0 then
      s := s + TranslateText('Не определена статья бюджета!') + #13#10;
    if CESpring.Tag = 0 then
      s := s + TranslateText('Не определен источник!') + #13#10;
    if edNumber.Text = '' then
      s := s + TranslateText('Не определен номер!') + #13#10;
    TblFil.First;
    i := 1;
    while not TblFil.Eof do
    begin
      if TblFil.FieldByName('Org_Name').AsString = '' then
        s := s + TranslateText('В строке ') + IntToStr(i) + TranslateText(' разноски по филиалам не определена организация!') + #13#10;
      inc(i);
      TblFil.Next;
    end;
    if s = '' then result := FALSE
    else Raise Exception.Create(s);
  except on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOk], 0);
      result := TRUE;
    end;
  end;
end;
//==============================================================================
procedure TE_BillForm.SaveFilials;

  //****************************************************************************
  procedure SaveOneFilial(e_bill_id, e_bill_inst, org_id, org_inst, permit_id: integer; summ, nds, summbez: real);
  var
    PermitID: variant;
  begin
    if permit_id <> 0 then PermitID := permit_id
    else PermitID := null;

    InsOrUpdRecord('E_BILL_FILIALS',
      ['E_BILL_ID',     e_bill_id,
       'INST',          e_bill_inst,
       'ORG_ID',        org_id,
       'ORG_INST',      org_inst,
       'STATE',         'Y',
       'SUMM',          summ,
       'NDS',           nds,
       'SUMMBEZ',       summbez,
       'PERMITID',      PermitID
      ]);
  end;
  //****************************************************************************
begin
  // все старые линки переводим в state='N'
  with QDelFilials do
  begin
    ParamByName('bill_id').AsInteger := BillId;
    ParamByName('inst').AsInteger := BillInst;
    ExecSQL;
  end;
  TblFil.First;
  while not TblFil.Eof do
  begin
    SaveOneFilial(BillId, BillInst, TBLFilOrg_ID.AsInteger, TBLFilOrg_Inst.AsInteger,
      TblFilPERMIT_ID.AsInteger, TBLFilSumm.Value, TBLFilNDS.Value, TBLFilSummBez.Value);
    TblFil.Next;
  end;
  SaveOneFilial(BillId, BillInst, E_ORGINST, E_ORGINST, CEPermit.Tag, OblSumm, OblNDS, OblSummBez);
end;
//==============================================================================
procedure TE_BillForm.bbOkClick(Sender: TObject);
var
  s: string;
  ObjectID: variant;
  DebKr: integer;
  Summ, NDS, SummBez, GetSumm: real;
begin
  try
    DBGridE_Bill_Filials.DataSource.DataSet.DisableControls;
    if CannotAccept then Exit;
    TblFil.First;
    s := '';
    while not TblFil.Eof do
    begin
      if TblFil.FieldByName('Summ').Value <= 0 then s := s + IntToStr(TblFil.RecNo) + ',';
      TblFil.Next;
    end;

    if s <> '' then
    begin
      s[length(s)] := ' ';
      s :=
        TranslateText('В строках ') + s + TranslateText(' разноски по филиалам не определена сумма.') + #13#10 +
        TranslateText('Эти строки будут проигнорированы. Продолжить?');
      if Application.MessageBox(PCHAR(s), PChar(TranslateText('Внимание!!!')), MB_OKCANCEL) <> IDOK then exit;
    end;

    if CEPermit.Tag > 0 then
    begin
      if TestPermit(CEPermit.Tag, 0, CEPermit.Text, SummAllocatur, CalcSumm.Value, GetSumm) then
        CalcSumm.Value := GetSumm
      else exit;
    end
    else
    begin
      TblFilCalcFields(nil);
      TblFil.First;
      while not TblFil.Eof do
      begin
        if TblFilPERMIT_ID.AsInteger <> 0 then
          if TestPermit(TblFilPERMIT_ID.AsInteger, TblFil.RecNo, TblFilPERMIT_NAME.AsString,
            TblFilPERMIT_SUMM.Value, TblFilSUMM.Value, GetSumm) then
          begin
            TblFil.Edit;
            TblFilSUMM.Value := GetSumm;
            TblFil.Post;
          end
          else exit;
        TblFil.Next;
      end;
    end;

    if CalcSumm.Value <= 0 then
    begin
      MessageDlg(TranslateText('Общая сумма должна быть больше нуля!'), mtError, [mbOk], 0);
      exit;
    end;

    TblFilCalcFields(nil);
    ShowFilialsItogo;
    SumFilials(Summ, NDS, SummBez);
    if Summ - CalcSumm.Value > 0.001 then
    begin
      MessageDlg(TranslateText('Сумма по филиалам превышает общую сумму!') + #13#10 +
        TranslateText('Сделайте так, чтобы общая сумма была больше или равна сумме по филиалам.'), mtError, [mbOk], 0);
      exit;
    end;

    StartSQL;
    if BillId = 0 then BillId := GetSeqNextVal('s_e_bill');
    if RBPlat.Checked then DebKr := -1
    else DebKr := 1;

    InsOrUpdRecord('E_BILL',
      ['ID',             BillId,
       'STATE',          'Y',
       'INST',           BillInst,
       'BILLPAY',        'P',
       'ORG_ID',         OrgId,
       'ORG_INST',       OrgInst,
       'NUMB',           edNumber.Text,
       'DATE_',          deDate.Date,
       'E_BUDGET_ID',    ceBudget.Tag,
       'COMMENTS',       EComments.Text,
       'VR',             BoolToInt(RBPlat.Checked and CB1.Checked),
       'VD',             BoolToInt(RBPost.Checked and CB1.Checked),
       'NOB',            BoolToInt(RBPost.Checked and CB2.Checked),
       'NK',             BoolToInt(RBPlat.Checked and CB2.Checked),
       'REKVIZIT_ID',    BoolTo_(rbRS.Checked, qBank.FieldByName('Id').AsInteger, null),
       'REKVIZIT_INST',  BoolTo_(rbRS.Checked, qBank.FieldByName('Inst').AsInteger, null),
       'SOURCE',         Source,
       'DEBKR',          DebKr,
       'VOZVRAT',        BoolTo_(cbVozvrat.Checked,'Y','N'),
       'SPRINGID',       CESpring.Tag
      ]);

    if CEObject.Tag <> 0 then ObjectID := CEObject.Tag
    else ObjectID := null;   
    InsOrUpdRecord('E_BILL',
      ['ID',             BillId,
       'STATE',          'Y',
       'INST',           BillInst,
       'OBJECTID',       ObjectID
      ]);

    SaveFilials;
    CommitSqlOra;
    ModalResult := mrOk;
  except on E:Exception do
    begin
      MessageDlg(TranslateText('В процессе сохранения данных произошла ошибка:') + E.Message + '.', mtError, [mbOk], 0);
      DBGridE_Bill_Filials.DataSource.DataSet.EnableControls;
      RollbackSql;
    end;
  end;
end;
//==============================================================================
procedure TE_BillForm.DBGridE_Bill_FilialsEditButtonClick(Sender: TObject);
var
  id, inst, orgtype: integer;
  name: string;
  GetSumm: real;
begin
  if DBGridE_Bill_Filials.SelectedField.FieldName = 'ORG_NAME' then
    if CaptureOrgT(1, E_ORGINST, E_ORGINST, 'nyyyyynna', id ,inst, name, orgtype) then
    begin
      TblFil.Edit;
      TblFilOrg_Id.Value := id;
      TblFilOrg_Inst.Value := inst;
      if orgtype = 8 then name := GetFullAzsName(id);
      TblFilOrg_Name.Value := name;
      TblFil.Post;
    end;
  if (DBGridE_Bill_Filials.SelectedField.FieldName = 'PERMIT_NAME') and (rgTypePermit.ItemIndex = 1) then
    if XMLChoose('E_PermitRef', CEPermit) then
      if (CEPermit.Tag <> 0) then
      begin
        TblFil.Edit;
        TblFilPERMIT_ID.AsInteger := CEPermit.Tag;
        TblFilPERMIT_NAME.Value := CEPermit.Text;
        TblFilPERMIT_SUMM.Value := GetSQLValue('select summ from e_permit where id = '+ IntToStr(CEPermit.Tag));
        TblFil.Post;
        LAllocatur.Visible := false;
        Label35.Visible := false;
        CEPermit.Tag := 0;
        CEPermit.Text := '';
        if TblFilPERMIT_ID.AsInteger <> 0 then
          if TestPermit(TblFilPERMIT_ID.AsInteger, TblFil.RecNo, TblFilPERMIT_NAME.AsString,
            TblFilPERMIT_SUMM.Value, TblFilSUMM.Value, GetSumm) then
          begin
            TblFil.Edit;
            TblFilSUMM.Value := GetSumm;
            TblFil.Post;
            TblFilCalcFields(nil);
          end;
      end;
end;
//==============================================================================
function TE_BillForm.TestFilials: Boolean;
begin
  TblFil.First;
  while not TblFil.Eof do
  begin
    if TblFilOrg_Name.AsString = '' then
    begin
      showmessage(TranslateText('Не указана организация!!!'));
      result := FALSE;
      exit;
    end;
    TblFil.Next;
  end;
  TblFil.First;
  result := TRUE;
end;
//==============================================================================
procedure TE_BillForm.TblFilAfterPost(DataSet: TDataSet);
begin
  ShowFilialsItogo;
end;
//==============================================================================
procedure TE_BillForm.DBGridE_Bill_FilialsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (Key = 13) then DBGridE_Bill_FilialsEditButtonClick(Sender);
end;
//==============================================================================
procedure TE_BillForm.ShowRekvizit;

  //****************************************************************************
  procedure ShowOrgRekvizit(i: integer=2);
  begin
    if qRekvizit.Active then
    begin
      if i = 1 then
      begin
        Edit1.Text := qRekvizit.FieldByName('mfo').AsString;
        Edit2.Text := qRekvizit.FieldByName('id_num').AsString;
        Edit3.Text := qRekvizit.FieldByName('Rach_Chet').AsString;
      end
      else
      begin
        Edit4.Text := qRekvizit.FieldByName('mfo').AsString;
        Edit5.Text := qRekvizit.FieldByName('id_num').AsString;
        Edit6.Text := qRekvizit.FieldByName('Rach_Chet').AsString;
      end;
    end
    else
    begin
      if i = 1 then
      begin
        Edit1.Text := '';
        Edit2.Text := '';
        Edit3.Text := '';
      end
      else
      begin
        Edit4.Text := '';
        Edit5.Text := '';
        Edit6.Text := '';
      end;
    end
  end;
  //****************************************************************************

  //****************************************************************************
  procedure ShowBankRekvizit(i: integer=2);
  begin
    if LEBank.Text <> '' then
    begin
      if i = 1 then
      begin
        Edit1.Text := qBank.FieldByName('mfo').AsString;
        Edit2.Text := qBank.FieldByName('id_num').AsString;
        Edit3.Text := qBank.FieldByName('Rach_Chet').AsString;
      end
      else
      begin
        Edit4.Text := qBank.FieldByName('mfo').AsString;
        Edit5.Text := qBank.FieldByName('id_num').AsString;
        Edit6.Text := qBank.FieldByName('Rach_Chet').AsString;
      end;
    end
    else
    begin
      if i = 1 then
      begin
        Edit1.Text := '';
        Edit2.Text := '';
        Edit3.Text := '';
      end
      else
      begin
        Edit4.Text := '';
        Edit5.Text := '';
        Edit6.Text := '';
      end;
    end
  end;
  //****************************************************************************
  
begin
  if RBPost.Checked then
  begin
    ShowBankRekvizit(2);
    ShowOrgRekvizit(1);
  end
  else
  begin
    ShowBankRekvizit(1);
    ShowOrgRekvizit(2);
  end;
end;
//==============================================================================
procedure TE_BillForm.LEBankKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;
//==============================================================================
procedure TE_BillForm.LEBankChange(Sender: TObject);
begin
  ShowRekvizit;
end;
//==============================================================================
procedure TE_BillForm.qBankCalcFields(DataSet: TDataSet);
begin
  qBank.FieldByName('Name').AsString := qBank.FieldByName('Rach_Chet').AsString + ' ' + qBank.FieldByName('Bank_Name').AsString;
  if qBank.FieldByName('Org_Type').AsInteger = 3 then
    qBank.FieldByName('Name').AsString :=
      GetShortPponName(qBank.FieldByName('Org_Name').AsString) + qBank.FieldByName('Name').AsString;
  LEBank.DropDownWidth := Length(qBank.FieldByName('Name').AsString)*8;
end;
//==============================================================================
procedure TE_BillForm.TblFilCalcFields(DataSet: TDataSet);
begin
  try
    if CBNoNDS.Checked then
    begin
      // 1-й случай. Если НДС=0, считать его не надо
      TblFil.First;
      while not TblFil.Eof do
      begin
        TblFil.Edit;
        TblFilNDS.Value := 0;
        TblFilSummBez.Value := TblFilSumm.Value;
        TblFil.Post;
        TblFil.Next;
      end;
    end
    else
    begin
      // 3-й случай: всё путём, подгоняем НДС филиалов
      if TblFil.RecordCount > 0 then
      begin
        TblFil.First;
        while not TblFil.Eof do
        begin
          TblFil.Edit;
          TblFilNDS.Value := GetNDS_WithNDS(TblFilSumm.Value, StrToDateTime(FormatDateTime2('dd.mm.yyyy', GetSystemDate)), 2);
          TblFilSummBez.Value := GetNoNDS_WithNDS(TblFilSumm.Value, StrToDateTime(FormatDateTime2('dd.mm.yyyy', GetSystemDate)), 2);
          TblFil.Post;
          TblFil.Next;
        end;
      end;
    end;
    ShowFilialsItogo;
  except on E:Exception do
    MessageDlg(E.Message, mtError, [mbOk], 0);
  end;
end;
//==============================================================================
procedure TE_BillForm.SpeedButton3Click(Sender: TObject);
begin
  try
    if not TblFil.IsEmpty then
      if MessageDlg(TranslateText('Вы действительно хотите удалить запись?'),
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then TblFil.Delete;
  except
  end;
end;
//==============================================================================
procedure TE_BillForm.nDelPermitClick(Sender: TObject);
begin
  if not TblFil.IsEmpty then
    if MessageDlg(TranslateText('Вы действительно хотите удалить разрешение?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      TblFil.Edit;
      TblFilPERMIT_ID.AsInteger := 0;
      TblFilPERMIT_NAME.AsString := '';
      TblFilPERMIT_SUMM.AsFloat := 0;
      TblFil.Post;
    end;
end;
//==============================================================================
function TE_BillForm.TestPermit(PermitID, RecordNum: integer; PermitName: string; PermitSumm, Summ: real; var GetSumm: real): Boolean;
var
  SummAll: real;
  s: string;
  BM: TBookMark;
begin
  result := false;
  s := TranslateText('Сумма платежей по разрешению '+ PermitName +' превышает сумму данного разрешения!') + #13#10;
  if RecordNum = 0 then s := s + TranslateText('Выставить правильную сумму?')
  else s := s + TranslateText('Выставить правильную сумму на строке ')+ IntToStr(RecordNum) +' ?';

  SummAll := nvl(GetSQLValue('select sum(ebf.summ) from (select e_bill_id, sum(summ) as summ, permitid ' +
    'from e_bill_filials where state = ''Y'' and permitid is not null and e_bill_id in (select e_bill_id ' +
    'from e_bill_filials where org_id = '+ IntToStr(BillInst) +' and org_inst = '+ IntToStr(BillInst) +') ' +
    'group by e_bill_id, permitid union all select e_bill_id, sum(summ), permitid from e_bill_filials ' +
    'where state = ''Y'' and permitid is not null and e_bill_id not in (select e_bill_id from e_bill_filials ' +
    'where org_id = '+ IntToStr(BillInst) +' and org_inst = '+ IntToStr(BillInst) +') group by e_bill_id, permitid) ebf, ' +
    'e_permit p, e_bill eb, e_budget b where p.id = ebf.permitid and p.state = ''Y'' and eb.state = ''Y'' ' +
    'and eb.id = ebf.e_bill_id and b.state = ''Y'' and b.id = eb.e_budget_id  ' +
    'and ebf.e_bill_id <> '+ IntToStr(BillId) +'and ebf.permitid = '+ IntToStr(PermitID)), 0);

  if rgTypePermit.ItemIndex = 1 then
  begin
    BM := TblFil.GetBookmark;
    DBGridE_Bill_Filials.DataSource.DataSet.DisableControls;
    TblFil.First;
    while not TblFil.Eof do
    begin
      if TblFilPermit_ID.AsInteger = PermitID then SummAll := SummAll + TblFilSumm.Value;
      TblFil.Next;
    end;
    SummAll := SummAll - Summ;
    DBGridE_Bill_Filials.DataSource.DataSet.EnableControls;
    if TblFil.BookmarkValid(BM) then TblFil.GotoBookMark(BM);
    TblFil.FreeBookmark(BM);
  end;

  GetSumm := Summ;
  if (Summ + SummAll) - PermitSumm > 0 then
    if MessageDlg(s, mtError, [mbYes, mbNo], 0) = mrYes then GetSumm := PermitSumm - SummAll
  else exit;
  result := true;
end;
//==============================================================================
procedure TE_BillForm.rgTypePermitClick(Sender: TObject);
begin
  case rgTypePermit.ItemIndex of
    0:
      begin
        CEPermit.Enabled := true;
        Label28.Enabled := true;
        sbClearPermit.Enabled := true;
        TblFil.First;
        while not TblFil.Eof do
        begin
          TblFil.Edit;
          TblFilPERMIT_ID.AsInteger := 0;
          TblFilPERMIT_NAME.AsString := '';
          TblFilPERMIT_SUMM.AsFloat := 0;
          TblFil.Post;
          TblFil.Next;
        end;
        DBGridE_Bill_Filials.FieldColumns['PERMIT_NAME'].Visible := false;
        DBGridE_Bill_Filials.FieldColumns['PERMIT_SUMM'].Visible := false;
        if CEPermit.Tag <> 0 then
        begin
          LAllocatur.Visible := true;
          Label35.Visible := true;
        end;
      end;
    1:
      begin
        CEPermit.Enabled := false;
        Label28.Enabled := false;
        sbClearPermit.Enabled := false;
        CEPermit.Text := '';
        CEPermit.Tag := 0;
        DBGridE_Bill_Filials.FieldColumns['PERMIT_NAME'].Visible := true;
        DBGridE_Bill_Filials.FieldColumns['PERMIT_SUMM'].Visible := true;
        SummAllocatur := 0;
        LAllocatur.Caption := MoneyToStr(SummAllocatur);
        LAllocatur.Visible := false;
        Label35.Visible := false;
      end;
  end;  
end;
//==============================================================================
procedure TE_BillForm.SpeedButton4Click(Sender: TObject);
begin
  TblFilCalcFields(nil);
end;
//==============================================================================

end.
