unit DogRef;

interface

uses uCommonForm, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ActiveX, Base, Menus, Db, DBTables, Grids, DBGrids, Buttons, StdCtrls,
  ExtCtrls, ToolEdit, Mask, RXCtrls, ComObj, DBCtrls, Excel8tlb, CardRNPrint,
  MemDS, DBAccess, Ora, CurrEdit, ActnList, uOilQuery, uOilStoredProc, DBGridEh
  {$IFDEF VER150},Variants,StrUtils{$ENDIF}, uMessageDlgExt, GridsEh,
  DBGridEhGrouping;

type
  // ��� �������� (dtK - ��������, dtY - ������, dtS - ������, dtV - �������, dtN - ���������)
  TDogType = (dtNull, dtK, dtY, dtS, dtV, dtN);

  TDogRefForm = class(TBaseForm)
    Label2: TLabel;
    lFrom: TLabel;
    lTo: TLabel;
    edDog: TEdit;
    eFrom: TComboEdit;
    eTo: TComboEdit;
    sbFromClear: TSpeedButton;
    sbToClear: TSpeedButton;
    miKPPred: TMenuItem;
    miKPPosle: TMenuItem;
    miTalRep: TMenuItem;
    qDogDetail: TOilQuery;
    qDogDetailID: TFloatField;
    qDogDetailDOG_ID: TFloatField;
    qDogDetailDOG_INST: TFloatField;
    qDogDetailNP_TYPE: TFloatField;
    qDogDetailDIM_ID: TFloatField;
    qDogDetailPRICE: TFloatField;
    qDogDetailCOUNT_: TFloatField;
    qDogDetailBARTERNP: TFloatField;
    qDogDetailNPBNAME: TStringField;
    qDogDetailPRICE2: TFloatField;
    dsDogDetail: TOraDataSource;
    eDate: TDateEdit;
    qDogDetailNPGRP_ID: TFloatField;
    qWork: TOilQuery;
    u: TOraUpdateSQL;
    N2: TMenuItem;
    Order: TMenuItem;
    miCardEC: TMenuItem;
    miCardLS: TMenuItem;
    qServiceDetail: TOilQuery;
    dsServiceDetail: TOraDataSource;
    Panel5: TPanel;
    gbDogType: TGroupBox;
    rbYes: TRadioButton;
    rbNo: TRadioButton;
    rbKart: TRadioButton;
    rbVed: TRadioButton;
    rbService: TRadioButton;
    qSavePoint: TOilQuery;
    qReportTalon: TOilQuery;
    nPrintAZSList: TMenuItem;
    lblPay: TLabel;
    cbPay: TComboBox;
    sbPayClear: TSpeedButton;
    Label1: TLabel;
    eNPType: TComboEdit;
    sbNPTypeClear: TSpeedButton;
    miCardRnLs: TMenuItem;
    Label3: TLabel;
    eToDate: TDateEdit;
    Label5: TLabel;
    qReport: TOilQuery;
    qServiceDetailPRICE: TFloatField;
    qServiceDetailPRICE2: TFloatField;
    qServiceDetailDIMNAME: TStringField;
    qServiceDetailCOUNT_: TFloatField;
    miDogFacilityPred: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    NotebookSubType: TNotebook;
    lblScheme: TLabel;
    cbScheme: TComboBox;
    sbSchemeClear: TSpeedButton;
    LblNType: TLabel;
    cbNType: TComboBox;
    sbClearNType: TSpeedButton;
    qID: TFloatField;
    qSTATE: TStringField;
    qINST: TFloatField;
    qDOG: TStringField;
    qDOG_DATE: TDateTimeField;
    qEXP_DATE: TDateTimeField;
    qFROM_: TFloatField;
    qFROM_INST: TFloatField;
    qFROM_PAR_ID: TFloatField;
    qFROM_PAR_INST: TFloatField;
    qTO_: TFloatField;
    qTO_INST: TFloatField;
    qCOMM: TStringField;
    qDOG_TYPE: TStringField;
    qR_FROM_: TFloatField;
    qR_FROM_INST: TFloatField;
    qR_TO_: TFloatField;
    qR_TO_INST: TFloatField;
    qDATE_MOD: TDateTimeField;
    qFOREPAY: TFloatField;
    qPAY_TYPE: TFloatField;
    qPAY_CORR: TFloatField;
    qSUB_TYPE: TFloatField;
    qFROM_NAME: TStringField;
    qFROM_ADDR: TStringField;
    qFROM_SVID_NUM: TStringField;
    qFROM_NAL_NUM: TStringField;
    qFROM_BOSS: TStringField;
    qFROM_OKPO: TStringField;
    qFROM_PHONE: TStringField;
    qFROM_RACH_CHET: TStringField;
    qFROM_RACH_CHET_NDS: TStringField;
    qFROM_BANK_NAME: TStringField;
    qFROM_MFO: TStringField;
    qTO_NAME: TStringField;
    qTO_ADDR: TStringField;
    qTO_SVID_NUM: TStringField;
    qTO_NAL_NUM: TStringField;
    qTO_BOSS: TStringField;
    qTO_OKPO: TStringField;
    qTO_PHONE: TStringField;
    qTO_RACH_CHET: TStringField;
    qTO_RACH_CHET_NDS: TStringField;
    qTO_BANK_NAME: TStringField;
    qTO_MFO: TStringField;
    qTO_FACE: TFloatField;
    qSUB_TYPE_NAME: TStringField;
    qPASSP_NUM: TStringField;
    qPASSP_WHOM: TStringField;
    qPASSP_WHEN: TDateTimeField;
    qRN_NUM: TStringField;
    qRN_DATE: TDateTimeField;
    qDOV_SER: TStringField;
    qDOV_DATE: TDateTimeField;
    qDOV_NUM: TStringField;
    qDOV_WHO: TStringField;
    qCARD_PRICE: TFloatField;
    qRN_ID: TFloatField;
    qRN_INST: TFloatField;
    qFOREPAY_NAME: TStringField;
    qPASSP_SER: TStringField;
    qFROM_DOGOVOR: TStringField;
    qTO_DOGOVOR: TStringField;
    miDopConsent: TMenuItem;
    qFROM_BOSS_POST: TStringField;
    qFROM_TYPE: TFloatField;
    qTO_BOSS_POST: TStringField;
    miCardPrintEC: TMenuItem;
    miDopConsentEC: TMenuItem;
    miCardPrintLSPosle: TMenuItem;
    miCardPrintLSPred: TMenuItem;
    miDopSmartCard: TMenuItem;
    miDopConsentLS: TMenuItem;
    miAktService: TMenuItem;
    miTalAdd: TMenuItem;
    miTalAddOwn: TMenuItem;
    miCardRnLsDelete: TMenuItem;
    qSHARE_ID: TFloatField;
    qSHARE_NAME: TStringField;
    qDogDetailSUMM_NDS: TFloatField;
    qDogDetailSUMM_X_NDS: TFloatField;
    qDogDetailDIM_NAME: TStringField;
    qDogDetailNPNAME: TStringField;
    qServiceDetailSERVICE_NAME: TStringField;
    qServiceDetailSUMM_NDS: TFloatField;
    qServiceDetailSUMM_X_NDS: TFloatField;
    pmAddDog: TPopupMenu;
    AddDogWithBill: TMenuItem;
    sbAddDog: TRxSpeedButton;
    qBILL_DOG: TStringField;
    qBILL_DATE: TDateTimeField;
    qBILL_ID: TFloatField;
    qBILL_INST: TFloatField;
    qServiceDetailOPER_ID: TFloatField;
    nbDetail: TNotebook;
    dbgDogDetail: TDBGridEh;
    dbgServiceDetail: TDBGridEh;
    qBILL_MINUTE: TFloatField;
    miTalRepANP: TMenuItem;
    miTalRepBudget: TMenuItem;
    procedure sbFromClearClick(Sender: TObject);
    procedure sbToClearClick(Sender: TObject);
    procedure sbSchemeClearClick(Sender: TObject);
    procedure sbDateClearClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject); override;
    procedure miKPPredClick(Sender: TObject);
    procedure miKPPosleClick(Sender: TObject);
    procedure miTalRepClick(Sender: TObject);
    procedure eFromButtonClick(Sender: TObject);
    procedure eToButtonClick(Sender: TObject);
    procedure eNPTypeButtonClick(Sender: TObject);
    procedure rbYesClick(Sender: TObject);
    procedure rbNoClick(Sender: TObject);
    procedure qCalcFields(DataSet: TDataSet);
    procedure qAfterPost(DataSet: TDataSet);
    procedure OrderClick(Sender: TObject);
    procedure rbKartClick(Sender: TObject);
    procedure miCardECClick(Sender: TObject);
    procedure rbVedClick(Sender: TObject);
    procedure rbServiceClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure nPrintAZSListClick(Sender: TObject);
    procedure qDogDetailAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure sbPayClearClick(Sender: TObject);
    procedure sbNPTypeClearClick(Sender: TObject);
    procedure miCardRnLsClick(Sender: TObject);
    procedure miDogFacilityPredClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure sbClearNTypeClick(Sender: TObject);
    procedure miDopConsentClick(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure miCardLSPredClick(Sender: TObject);
    procedure miCardLSPosleClick(Sender: TObject);
    procedure miDopSmartCardClick(Sender: TObject);
    procedure miAktServiceClick(Sender: TObject);
    procedure miTalAddClick(Sender: TObject);
    procedure miTalAddOwnClick(Sender: TObject);
    procedure miCardRnLsDeleteClick(Sender: TObject);
    procedure AddDogWithBillClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure miTalRepANPClick(Sender: TObject);
    procedure miTalRepBudgetClick(Sender: TObject);
  private
    procedure Dog_START_SQL;
    procedure Dog_Rollback_SQL;
    procedure DoRashNak(Sender: TObject);
    procedure MakePetrolLinkFile;
    function GetDogType: TDogType;
  public
    NumApplication, DateApplication: string; // ��� ����������� ���������� �� �����-������
    ToCommit: Boolean;
    CardRNPrintForm: TCardRNPrintForm;

    procedure AV_DogRep(
      FileName: string;    // ����� �����, ��� ���������� � ������� ����������� "_Ukr" i "_Rus"
      DogType: TDogType;   // ��� �������� (dtK - ��������, dtY - ������, dtS - ������, dtV - �������, dtN - ���������)
      Id, Inst: integer;   // Id - ����� �����, Inst - ����� ���������� (������� OIL_DOG)
      IsWithTable: boolean = false);  //�� �������� � �������� �������
    procedure DogRep(
      FileName: string;  // ����� �����, ��� ���������� � ������� ����������� "_Ukr" i "_Rus"
      DogType: TDogType; // ��� �������� (dtK - ��������, dtY - ������, dtS - ������, dtV - �������, dtN - ���������)
      Id, Inst: integer; // Id - ����� �����, Inst - ����� ���������� (������� OIL_DOG)
      DopConsent: boolean = false; // ��������� ����������
      DopPayFlex: boolean = false); // ��������� ���������� ��� ������� PayFlex`a
    procedure DogRepAppendix(
      FileName: string;   // ����� �����, ��� ���������� � ������� ����������� "_Ukr" i "_Rus"
      is_ownList: boolean = false  // ���� ���, �� ��������� ������� ������ ��� � ����� "\Pattern\DogTAppendixOwn.doc"
      );
    property CurrDogType: TDogType read GetDogType;
  end;

function TestDogLink(AId,AInst:integer;AMsg:string):string;

function GetDogTypeName(dog_type: string): string;
function GetDogTypeText(ADogType:TDogType):string;
function GetDogType(s: string): TDogType;

function ChooseDog(ADogType:TDogType; var ADogText:string;var ADogDate:TDateTime;
  var ADogId,ADogInst,AToId,AToInst,AFromId,AFromInst:integer;AFilterNpId:integer=0):boolean;overload;
function ChooseDog(ADogType:TDogType; var ADogEdit:TComboEdit;var ADateEdit:TDateEdit;
  var ADogId,ADogInst,AToId,AToInst,AFromId,AFromInst:integer):boolean;overload;
function ChooseDog(ADogType:TDogType; var ADogText:string;var ADogDate:TDateTime;
  var ADogId,ADogInst:integer):boolean;overload;
function ChooseDog(ADogType:TDogType; var ADogEdit:TComboEdit;var ADateEdit:TDateEdit;
  var ADogId,ADogInst:integer):boolean;overload;

procedure CreateDogWithBill(AID, AINST: integer; DogType: TDogType); // �������� ������ �� �������
procedure CreateBillWithDog(AID, AINST: integer; pBillNum: string=''); // �������� ������� �� ��������
procedure DelBill(AID, AINST, ADOG_ID, ADOG_INST: integer); // ��������� �������

const
  IsOpt: string = '�������';       //'N'
  IsTalon: string = '�� �������';  //'Y'
  IsCard: string = '�� ���������'; //'K'
  isVed: string = '�� ���������';  //'V'
  IsService: string = '������';    //'S'

var
  DogRefForm: TDogRefForm;

implementation

uses Main, OilStd, ChooseOrg, NPTypeRef, Progr, ViewDoc, MoneyFunc, UDbFunc,
  RashNakPrint, InvoicePrint, ExFunc, Dog, uXMLForm, uBill, uCrypt;

const
  SUB_TYPE_COL=14;
  SUB_TYPE_COL_CARD=15;

var
  DogForm: TDogForm;
  IsBuySmartCard: Boolean;

{$R *.DFM}

//==============================================================================
function ChooseDog(ADogType:TDogType; var ADogText:string;var ADogDate:TDateTime;
  var ADogId,ADogInst,AToId,AToInst,AFromId,AFromInst:integer;
  AFilterNpId:integer=0):boolean;
// ����� ������ ��������
Var
  DogRefForm : TDogRefForm;
begin
  result:=false;
  Application.CreateForm(TDogRefForm, DogRefForm);
  try
    //���������� �������
    case ADogType of
      dtK: DogRefForm.rbKart.Checked:=True;
      dtY: DogRefForm.rbYes.Checked:=True;
      dtS: DogRefForm.rbService.Checked:=True;
      dtV: DogRefForm.rbVed.Checked:=True;
      dtN: DogRefForm.rbNo.Checked:=True;
    end;
    //��������� �������
    DogRefForm.rbKart.Enabled:=False;
    DogRefForm.rbYes.Enabled:=False;
    DogRefForm.rbService.Enabled:=False;
    DogRefForm.rbVed.Enabled:=False;
    DogRefForm.rbNo.Enabled:=False;

    if AFilterNpId>0 then
    begin
      DogRefForm.eNPType.Text:=GetSqlValueParSimple('select name from v_oil_np_type where id=:id',['id',AFilterNpId]);
      DogRefForm.eNPType.Tag:=AFilterNpId;
      DogRefForm.eNPType.Enabled:=False;
    end;

    DogRefForm.ShowModal;
    if DogRefForm.ModalResult = mrOk then
    begin
      ADogText := DogRefForm.qDog.AsString;
      ADogDate := DogRefForm.qDog_Date.AsDateTime;
      ADogId := DogRefForm.qId.AsInteger;
      ADogInst := DogRefForm.qInst.AsInteger;
      AToId := DogRefForm.qTO_.AsInteger;
      AToInst := DogRefForm.qTO_INST.AsInteger;
      AFromId := DogRefForm.qFROM_.AsInteger;
      AFromInst := DogRefForm.qFROM_INST.AsInteger;
      result:=true;
    end;
  finally
    DogRefForm.Free;
  end;
end;
//------------------------------------------------------------------------------
function ChooseDog(ADogType:TDogType; var ADogEdit:TComboEdit;var ADateEdit:TDateEdit;
  var ADogId,ADogInst,AToId,AToInst,AFromId,AFromInst:integer):boolean;
var
  str:string;
  date_:TDateTime;
begin
  result:=ChooseDog(ADogType,str,date_,ADogId,ADogInst,AToId,AToInst,AFromId,AFromInst);
  ADogEdit.Text:=str;
  ADateEdit.Date:=date_;
end;
//------------------------------------------------------------------------------
function ChooseDog(ADogType:TDogType; var ADogText:string;var ADogDate:TDateTime; var ADogId,ADogInst:integer):boolean;
var
  v1,v2,v3,v4:integer;
begin
  result:=ChooseDog(ADogType,ADogText,ADogDate,ADogId,ADogInst,v1,v2,v3,v4);
end;
//------------------------------------------------------------------------------
function ChooseDog(ADogType:TDogType; var ADogEdit:TComboEdit;var ADateEdit:TDateEdit; var ADogId,ADogInst:integer):boolean;
var
  str:string;
  date_:TDateTime;  
begin
  result:=ChooseDog(ADogType,str,date_,ADogId,ADogInst);
  ADogEdit.Text:=str;
  ADateEdit.Date:=date_;
end;
//==============================================================================
procedure TDogRefForm.Dog_START_SQL;
begin
  if ToCommit then StartSQL
  else
  begin
    if qSavePoint.Active then qSavePoint.Close;
    qSavePoint.SQL.Text := 'savepoint Dogovor';
    qSavePoint.ExecSQL;
  end;
end;
//==============================================================================
procedure TDogRefForm.Dog_Rollback_SQL;
begin
  if ToCommit then RollbackSQL
  else
  begin
    if qSavePoint.Active then
      qSavePoint.Close;
    qSavePoint.SQL.Text := 'rollback to Dogovor';
    qSavePoint.ExecSQL;
  end;
end;
//==============================================================================
function GetDogTypeName(dog_type: string): string;
begin
  try
    case dog_type[1] of
      'Y': Result := IsTalon;
      'N': Result := IsOpt;
      'V': Result := IsVed;
      'S': Result := IsService;
      'K': Result := IsCard;
    end;
  except
    Result := '';
  end;
end;
//==============================================================================

procedure TDogRefForm.AV_DogRep(
      FileName: string;    // ����� �����, ��� ���������� � ������� ����������� "_Ukr" i "_Rus"
      DogType: TDogType;   // ��� �������� (dtK - ��������, dtY - ������, dtS - ������, dtV - �������, dtN - ���������)
      Id, Inst: integer;
      IsWithTable: boolean = false);  // Id - ����� �����, Inst - ����� ���������� (������� OIL_DOG)
var
  PayDays, Count: integer;
  SumNds, SumXNds : real;
  DepName, DepVLice, ClientName, ClientVLice: string;

  //**************************************************************************
    function TimeToPay(nDays: Integer; IsBankDays: Boolean):string;
    begin
      if nDays = 1 then
        result := BoolTo_(IsBankDays,LangText('TimeToPay_Bank'),
                                     LangText('TimeToPay_Calendar'))
      else
        result := format(BoolTo_(IsBankDays,LangText('TimeToPay_Bank_More'),
                                            LangText('TimeToPay_Calendar_More')),
                        [PayDays, Number2Words(PayDays,'M','',umLower)]
                        );
    end;
  //**************************************************************************

begin
  if OleConnect('Word.Application', MsWord) then
    begin
      if q.Active = false then
        begin
          q.ParamByName('ID').AsInteger := Id;
          q.ParamByName('INST').AsInteger := Inst;
          q.Open;
        end;
      PayDays := trunc(q.FieldByName('EXP_DATE').AsDateTime - q.FieldByName('DOG_DATE').AsDateTime) + 1;
    try
      MsWordDocAdd(FileName);
      //************************ ����� ********************************
      //MsWord.Visible := true; {********************************}
      Range := MsWord.Documents.Item(1).Range;
      SetCurField(True, qDOG.AsString);
      SetCurField(True, qDOG_DATE.AsString);
      DogFillContractors(qFROM_.AsInteger, qFROM_INST.AsInteger, qTO_.AsInteger, qTO_INST.AsInteger,{in}
                         DepName, DepVLice, ClientName, ClientVLice);                                   {out}
      SetCurField(True, DepName);
      SetCurField(True, DepVLice);
      SetCurField(True, ClientName);
      SetCurField(True, ClientVLice);

      SumNds := 0;
      SumXNds := 0;
      if DogType = dtY then
        begin
          qReportTalon.Close;
          qReportTalon.ParamByName('Id').Value := Id;
          qReportTalon.ParamByName('Inst').Value := Inst;
          qReportTalon.Open;
          while not qReportTalon.Eof do
            begin
              SumNds := SumNds + qReportTalon.FieldByName('Summ_Nds').asFloat;
              SumXNds := SumXNds + qReportTalon.FieldByName('Summ_X_Nds').AsFloat;
              qReportTalon.Next;
            end;
          if IsWithTable then
            begin
              Count := qReportTalon.RecordCount;
              qReportTalon.First;
              SetCurField(False, '');
              while not qReportTalon.Eof do
                begin
                  MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(IntToStr(qReportTalon.RecordCount-Count+1));
                  MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(qReportTalon.FieldByName('NP_Name').AsString);
                  MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(qReportTalon.FieldByName('DimName').AsString);
                  MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(qReportTalon.FieldByName('Amount').AsString);
                  MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(qReportTalon.FieldByName('Price_X_NDS').AsString);
                  MsWord.WordBasic.NextCell;
                  if Count <> 1 then
                    MsWord.WordBasic.Insert(qReportTalon.FieldByName('Summ_X_Nds').AsString)
                  else // ��������� ����� ����� �� �������� �� ��������� ������
                    MsWord.WordBasic.Insert(FLoatToStrF(qReportTalon.FieldByName('Summ_X_Nds').AsFloat +
                      (SumNds - GetNds_WithNds(SumNds, qDog_Date.AsDateTime) - SumXNds), ffFixed, 15, 2));
                  qReportTalon.Next;
                  Dec(Count);
                end;
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(LangText('Itogo'));
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.Insert(FloatToStrF(GetNoNds_WithNds(SumNds, qDog_Date.AsDateTime, 2), ffFixed, 15, 2)); // �����
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(LangText('NDS') + FloatToStr(TAX_RATE(qDog_Date.AsDateTime) * 100) + '%: ');
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.Insert(FloatToStrF(GetNds_WithNds(SumNds, qDog_Date.AsDateTime), ffFixed, 15, 2)); // ���
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(LangText('Vsego'));
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.Insert(FloatToStrF(SumNds, ffFixed, 15, 2)); // �����
            end;
          SetCurField(True, NumStrGrn(SumNds, TranslateText('���.'), TranslateText('���.')));
        end;

      SetCurField(True, TimeToPay(PayDays, True));

      DogFillRekvizits(qFROM_.AsInteger, qFROM_INST.AsInteger,
                       qTO_.AsInteger,   qTO_INST.AsInteger);

    finally
      MsWord.Visible := true;
      MsWord := UnAssigned;
    end;

    end;
end;
//==============================================================================

procedure TDogRefForm.DogRep(
  FileName: string;  // ����� �����, ��� ���������� � ������� ����������� "_Ukr" i "_Rus"
  DogType: TDogType; // ��� �������� (dtK - ��������, dtY - ������, dtS - ������, dtV - �������, dtN - ���������)
  Id, Inst: integer; // Id - ����� �����, Inst - ����� ���������� (������� OIL_DOG)
  DopConsent: boolean = false; // ��������� ����������
  DopPayFlex: boolean = false // ��������� ���������� ��� ������� PayFlex`a
  );
var
  ProgressIncrement, NumberOfFields: Integer;
  ProgrForm: TProgrForm;
  St: TStringList;
  sNumDopCons: string;
  Total, SumNds, SumXNds: real;
  Count, PayDays, i: Integer;
  qParent, qParentP: TOilQuery;
    //**************************************************************************
    function TimeToPay(nDays: Integer; IsBankDays: Boolean):string;
    begin
      if nDays = 1 then
        result := BoolTo_(IsBankDays,LangText('TimeToPay_Bank'),
                                     LangText('TimeToPay_Calendar'))
      else
        result := format(BoolTo_(IsBankDays,LangText('TimeToPay_Bank_More'),
                                            LangText('TimeToPay_Calendar_More')),
                        [PayDays, Number2Words(PayDays,'M','',umLower)]
                        );
    end;
    //**************************************************************************
begin
  // ������ ���������, ���� ����� �� �������� �������
  try
    Application.CreateForm(TProgrForm, ProgrForm);
    ProgrForm.Show;
    ProgrForm.Refresh;
    // �������� ���������� Word
    if OleConnect('Word.Application', MsWord) then
    begin
      if q.Active = false then
      begin
        q.ParamByName('ID').AsInteger := Id;
        q.ParamByName('INST').AsInteger := Inst;
        q.Open;
      end;
      Total := 0;
      PayDays := trunc(q.FieldByName('EXP_DATE').AsDateTime - q.FieldByName('DOG_DATE').AsDateTime) + 1;
      ProgrForm.AddProgress(10);
      MsWordDocAdd(FileName);
      ProgrForm.AddProgress(10);
      //************************************************************************
      //************************���������� �����********************************
      NumberOfFields := MsWord.Documents.Item(1).Fields.Count;
      ProgrForm.AddProgress(10);
      ProgressIncrement := Round((100 - 30) / (NumberOfFields));
      Range := MsWord.Documents.Item(1).Range;
      
      if DopConsent and (qSUB_TYPE.Value = 101) then
      begin   // � ���. ��������� - ������� ����� �� ���� ������ ������� �������� ��-������� � �볺����.
        qWork.Close;
        qWork.SQL.Text := 'select dog_date, dog' +
           ' from oil_dog' +
          ' where to_ = '+ IntToStr(qTO_.AsInteger) +' and to_inst = '+ IntToStr(qTO_INST.AsInteger) +
            ' and sub_type = 101 and state = ''Y''' +
            ' and dog_date = (select min(t.dog_date)' +
                              ' from oil_dog t ' +
                              'where t.to_ = '+ IntToStr(qTO_.AsInteger) +' and t.to_inst = '+ IntToStr(qTO_INST.AsInteger) +
                              '  and sub_type = 101 and state = ''Y'')';
        qWork.Open;
        //������ ����� ���.�������� �� �� - ����� ������ �� ���������� "/" � ���� ��������
        sNumDopCons := AnsiStrRScan(PChar(qDOG.AsString), '/');
        SetCurField(True, IfThen(sNumDopCons <> '', Copy(sNumDopCons, 2, length(sNumDopCons)), '1')); // ���� ���� "/" - �� ������� "� 1"
        SetCurField(True, qWork.FieldByName('dog').AsString);
        ProgrForm.AddProgress(ProgressIncrement);
        SetCurField(True, FormatDateTime2('dd.mm.yyyy', qWork.FieldByName('dog_date').AsDateTime));
        ProgrForm.AddProgress(ProgressIncrement);
        SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime));
      end
      else
      begin  // � ����� �������� - ����� � ���� ��������� ��������.
        SetCurField(True, qDOG.AsString);
        ProgrForm.AddProgress(ProgressIncrement);
        SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime));
        if DopConsent then
        begin
          if DogType = dtK then
          begin
            SetCurField(True, NumApplication);
            SetCurField(True, DateApplication);
          end;
          SetCurField(True, DateToStr(GetSystemDate));
        end;
      end;
      ProgrForm.AddProgress(ProgressIncrement);
      //MsWord.Visible := True; {**********************************************}
      // ������ ���������� ����������
      qParent := TOilQuery.Create(nil);
      GetOrgData(qParent, qFROM_PAR_ID.AsInteger, qFROM_PAR_INST.AsInteger);
      // ������ ���������� ���������� ���������� ����������
      if qFROM_TYPE.AsInteger = 3 then
      begin
        qParentP := TOilQuery.Create(nil);
        GetOrgData(qParentP, qParent.FieldByName('Par').AsInteger, qParent.FieldByName('Par_inst').AsInteger);
      end;
      // ������ � ����������� �� ������� � ����� ��������
      if PRINT_DOG_FILIAL = 'Y' then
      begin
        if DOG_WITH_REKVIZIT_CONTROL = 'Y' then
        begin
          SetCurField(True, qParent.FieldByName('Name').AsString + ', ');
          if q.FieldByName('From_Dogovor').IsNull then
            SetCurField(True, LangText('V_Lice_predsedately_pravl') + qParent.FieldByName('Name').AsString + LangText('Gospodina') + qParent.FieldByName('Boss').AsString + '')
          else SetCurField(True, q.FieldByName('From_Dogovor').AsString);
        end
        else
        begin
          if qFROM_TYPE.AsInteger = 3 then
          begin
            SetCurField(True, qParentP.FieldByName('Name').AsString + ', ');
            if q.FieldByName('From_Dogovor').IsNull then
              SetCurField(True, LangText('V_Lice') + qFrom_Name.AsString + LangText('Gospodina') + qParentP.FieldByName('Boss').AsString + LangText('Rob_po_dover') + qParentP.FieldByName('Dov').AsString + LangText('Ot') + qParentP.FieldByName('Dov_Date').AsString)
            else SetCurField(True, q.FieldByName('From_Dogovor').AsString);
          end
          else
          begin
            SetCurField(True, qParent.FieldByName('Name').AsString + ', ');
            if q.FieldByName('From_Dogovor').IsNull then
              SetCurField(True, LangText('V_Lice') + qFrom_Name.AsString + LangText('Gospodina') + qParent.FieldByName('Boss').AsString + LangText('Rob_po_dover') + qParent.FieldByName('Dov').AsString + LangText('Ot') + qParent.FieldByName('Dov_Date').AsString)
            else SetCurField(True, q.FieldByName('From_Dogovor').AsString);
          end;
        end;
      end
      else
      begin
        SetCurField(True, qFrom_Name.AsString + ', ');
        if q.FieldByName('From_Dogovor').IsNull then
          SetCurField(True, LangText('V_Lice_predsedately_pravl') + LangText('Gospodina') + qParent.FieldByName('Boss').AsString + LangText('Rob_po_ustavu'))
        else SetCurField(True, q.FieldByName('From_Dogovor').AsString);
      end;
      ProgrForm.AddProgress(ProgressIncrement);
      SetCurField(True, qTo_name.AsString);
      if not (q.FieldByName('To_Dogovor').IsNull) then
        SetCurField(True, q.FieldByName('To_Dogovor').AsString)
      else SetCurField(False, '');
      ProgrForm.AddProgress(ProgressIncrement);
      //************************************************************************
      //*************************** ���������� ������ ������ *******************
      // ������� �� �������
      if not DopConsent and (DogType = dtY) then
      begin
        SumNds := 0;
        SumXNds := 0;
        qReportTalon.Close;
        qReportTalon.ParamByName('Id').Value := Id;
        qReportTalon.ParamByName('Inst').Value := Inst;
        qReportTalon.Open;
        SetCurField(False, '');
        while not qReportTalon.Eof do
        begin
          SumNds := SumNds + qReportTalon.FieldByName('Summ_Nds').asFloat;
          SumXNds := SumXNds + qReportTalon.FieldByName('Summ_X_Nds').AsFloat;
          qReportTalon.Next;
        end;
        Count := qReportTalon.RecordCount;
        qReportTalon.First;
        while not qReportTalon.Eof do
        begin
          MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(qReportTalon.FieldByName('NP_Name').AsString);
          MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(qReportTalon.FieldByName('DimName').AsString);
          MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(qReportTalon.FieldByName('Amount').AsString);
          MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(qReportTalon.FieldByName('Price_X_NDS').AsString);
          MsWord.WordBasic.NextCell;
          if Count <> 1 then
            MsWord.WordBasic.Insert(qReportTalon.FieldByName('Summ_X_Nds').AsString)
          else // ��������� ����� ����� �� �������� �� ��������� ������
            MsWord.WordBasic.Insert(FLoatToStrF(qReportTalon.FieldByName('Summ_X_Nds').AsFloat +
              (SumNds - GetNds_WithNds(SumNds, qDog_Date.AsDateTime) - SumXNds), ffFixed, 15, 2));
          qReportTalon.Next;
          Dec(Count);
        end;
        MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(LangText('Itogo'));
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.Insert(FloatToStrF(GetNoNds_WithNds(SumNds, qDog_Date.AsDateTime, 2), ffFixed, 15, 2)); // �����
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.Insert(FloatToStr(TAX_RATE(qDog_Date.AsDateTime) * 100) + '% ' + LangText('NDS'));
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.Insert(FloatToStrF(GetNds_WithNds(SumNds, qDog_Date.AsDateTime), ffFixed, 15, 2)); // ���
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.Insert(LangText('Vsego'));
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.Insert(FloatToStrF(SumNds, ffFixed, 15, 2)); // �����
        SetCurField(True, NumStrGrn(SumNds, TranslateText('���.'), TranslateText('���.')));
        SetCurField(True, TimeToPay(PayDays, True));
      end;

      // ������ �� ������� ��� �������
      // � ������� �� ������� � �� � ����������� - ��������� ������� "����������� ���",
      // � �� �� �� �������� - "���������� ���"
      if ((DogType = dtK) or (DogType = dtS)) and not (DopConsent or DopPayFlex or (FileName = 'AktService')) then
        SetCurField(True, TimeToPay(PayDays, (DogType = dtS) or (qFOREPAY.Value = 1) ));

      //*******************************************************************************
      //******** ���������� ���.������ ������� ��������� (PAY FLEX) ******************
      if DopPayFlex then
      begin
        //-------------- ������ � ���������� ������� PayFlex`a --------------
        //-------------- ���������� ���� ���� �� ���������� ������� -----------
        qDogDetail.First;
        IsBuySmartCard := False;
        while not (qDogDetail.Eof or IsBuySmartCard) do
          if (qDogDetailNP_TYPE.Value = 455) and (qDogDetailDIM_ID.Value = 19) then
          begin
            Count := qDogDetail.FieldByName('Count_').AsInteger;  // PayFlex-������ � ������
            SetCurField(False, IntToStr(Count));
            SetCurField(False, '');
            For i:=1 to Count do
              begin
                MsWord.WordBasic.NextCell;
                MsWord.WordBasic.Insert(IntToStr(i));  // ���������� � �/�
                MsWord.WordBasic.NextCell;
                //MsWord.WordBasic.Insert(�����_������);  // �� ����� �� ����� - ������� ������
              end;
            SetCurField(False, NumStrGrn2(qDogDetailPRICE2.Value, '���.', '���.') + ' (' +
                               Money2Words(qDogDetailPRICE2.Value, true, umLower) + ')');
            SetCurField(False, '');
            MsWord.WordBasic.NextCell;
            MsWord.WordBasic.Insert(qDogDetail.FieldByName('NPName').AsString);
            MsWord.WordBasic.NextCell;
            MsWord.WordBasic.Insert(IntToStr(Count)); // ʳ������, ��.
            MsWord.WordBasic.NextCell;
            MsWord.WordBasic.Insert(FLoatToStrF(qDogDetail.FieldByName('Price').AsFloat, ffFixed, 15, 2));  // ֳ�� ��� ���
            MsWord.WordBasic.NextCell;
            MsWord.WordBasic.Insert(FLoatToStrF(qDogDetail.FieldByName('SUMM_X_NDS').AsFloat, ffFixed, 15, 2));  // ���� ��� ���
            SumNDS := SumNDS + qDogDetail.FieldByName('SUMM_NDS').AsFloat;
            SumXNds := SumXNds + qDogDetail.FieldByName('SUMM_X_NDS').AsFloat;
            IsBuySmartCard := True;  // ������� PayFlex - ��������� �����
          end
          else qDogDetail.Next;
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.Insert(LangText('Itogo'));
        MsWord.WordBasic.NextCell; MsWord.WordBasic.NextCell; MsWord.WordBasic.NextCell;
        MsWord.WordBasic.Insert(FloatToStrF(qDogDetail.FieldByName('SUMM_X_NDS').AsFloat, ffFixed, 15, 2)); // �����
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.Insert(FloatToStr(TAX_RATE(qDog_Date.AsDateTime) * 100) + '% ' + LangText('NDS'));
        MsWord.WordBasic.NextCell; MsWord.WordBasic.NextCell; MsWord.WordBasic.NextCell;
        MsWord.WordBasic.Insert(FloatToStrF(GetNds_WithNds(qDogDetail.FieldByName('SUMM_NDS').AsFloat,
                                                           qDog_Date.AsDateTime), ffFixed, 15, 2)); // ���
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.Insert(LangText('Vsego'));
        MsWord.WordBasic.NextCell; MsWord.WordBasic.NextCell; MsWord.WordBasic.NextCell;
        MsWord.WordBasic.Insert(FloatToStrF(qDogDetail.FieldByName('SUMM_NDS').AsFloat, ffFixed, 15, 2)); // �����
      end
      else  //if IsBuySmartCard and DopPayFlex then
        // ���������� ���������� ������ ��� ������ �� ��, ��� �� �� PayFlex`�
        if DopConsent and (DogType = dtK) and (qSUB_TYPE.Value = 101) then
          if qFOREPAY.Value = 1 then  // ����������: ������ �� �� � ������������
          begin
            SetCurField(False, '');
            qDogDetail.First;  // ��� ������ � ����������
            while not qDogDetail.Eof do
            begin
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.Insert(qDogDetail.FieldByName('NPName').AsString);
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.Insert(FLoatToStrF(qDogDetail.FieldByName('Price2').AsFloat, ffFixed, 15, 2)); // ֳ�� � ���
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.Insert(FLoatToStrF(qDogDetail.FieldByName('Count_').AsFloat, ffFixed, 15, 3));
              SumNds := SumNds + qDogDetail.FieldByName('SUMM_NDS').asFloat;
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.Insert(FLoatToStrF(qDogDetail.FieldByName('SUMM_NDS').AsFloat, ffFixed, 15, 2));
              qDogDetail.Next;
            end;
            MsWord.WordBasic.NextCell;
            MsWord.WordBasic.Insert(LangText('Itogo'));
            MsWord.WordBasic.NextCell; MsWord.WordBasic.NextCell; MsWord.WordBasic.NextCell;
            MsWord.WordBasic.Insert(FLoatToStrF(SumNds, ffFixed, 15, 2));
            DopConsent := False;  // ��� �� ����������� ����� ����
          end
          else  // ����������: ������ �� �� � �����������
          begin
            SetCurField(False, FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime)); //���� ��������� ���.�����
            SetCurField(False, '');
            qDogDetail.First;  // ��� ������ � ����������
            while not qDogDetail.Eof do
            begin
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.Insert(qDogDetail.FieldByName('NPName').AsString);
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.Insert(FLoatToStrF(qDogDetail.FieldByName('Price').AsFloat, ffFixed, 15, 2));  // ֳ�� ��� ���
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.Insert(FLoatToStrF(qDogDetail.FieldByName('Price2').AsFloat, ffFixed, 15, 2));  // ֳ�� � ���
              qDogDetail.Next;
            end;
            SetCurField(False, '');
            qDogDetail.First;
            while not qDogDetail.Eof do
            begin
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.Insert(qDogDetail.FieldByName('NPName').AsString);
              MsWord.WordBasic.NextCell;
              MsWord.WordBasic.Insert(IfThen(LANGUAGE = 0,
                                            '10 000 000 (������ ��������� ������)',
                                            '10 000 000 (������ ������� ����)'));
              qDogDetail.Next;
            end;
            DopConsent := False;  // ��� �� ����������� ����� ����
          end;

      //*******************************************************************************
      // ������� �������
      if (DogType = dtN) then
      begin
        if DopConsent then
        begin
          SetCurField(True, qDOG.AsString);
          SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime));
          SetCurField(True, qDOG.AsString);
          SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime));
        end;
        qReport.Close;
        qReport.ParamByName('Id').Value := Id;
        qReport.ParamByName('Inst').Value := Inst;
        qReport.Open;
        SetCurField(False, '');
        while not qReport.Eof do
        begin
          MsWord.WordBasic.NextCell;
          MsWord.WordBasic.Insert(qReport.FieldByName('NP_Name').AsString);
          MsWord.WordBasic.NextCell;
          MsWord.WordBasic.Insert(qReport.FieldByName('DimName').AsString);
          MsWord.WordBasic.NextCell;
          MsWord.WordBasic.Insert(FLoatToStrF(qReport.FieldByName('Amount').AsFloat, ffFixed, 15, 3));
          MsWord.WordBasic.NextCell;
          if qReport.FieldByName('Price').AsFloat <> 0 then
            MsWord.WordBasic.Insert(FLoatToStrF(qReport.FieldByName('Price').AsFloat, ffFixed, 15, 2))
          else MsWord.WordBasic.Insert('');
          MsWord.WordBasic.NextCell;
          MsWord.WordBasic.Insert(FloatToStrF(qReport.FieldByName('SUMM_X_NDS').asfloat, ffFixed, 15, 2));
          Total := Total + qReport.FieldByName('SUMM_X_NDS').AsFloat; // ����� ����� ��� ���
          qReport.Next;
        end;
        MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(LangText('Itogo'));
        MsWord.WordBasic.NextCell; MsWord.WordBasic.NextCell; MsWord.WordBasic.NextCell;
        MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(FloatToStrF(Total, ffFixed, 15, 2)); // �����
        MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(FloatToStr(TAX_RATE(qDog_Date.AsDateTime) * 100) + '% ' + LangText('NDS'));
        MsWord.WordBasic.NextCell; MsWord.WordBasic.NextCell; MsWord.WordBasic.NextCell;
        MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(FloatToStrF(GetNDS_NoNDS(Total, qDog_Date.AsDateTime), ffFixed, 15, 2)); // ���
        MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(LangText('Vsego'));
        MsWord.WordBasic.NextCell; MsWord.WordBasic.NextCell; MsWord.WordBasic.NextCell;
        MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(FloatToStrF(GetWithNDS_NoNDS(Total, qDog_Date.AsDateTime), ffFixed, 15, 2)); // �����
        if not DopConsent then
        begin
          SetCurField(True, NumStrGrn(GetWithNDS_NoNDS(Total, qDog_Date.AsDateTime), TranslateText('���.'), TranslateText('���.')));
          // ��� ���������
          if DOG_POST_CONDITION_FROM_WHOM = 'N' then SetCurField(True, DOG_POST_CONDITION)
          else SetCurField(True, qFROM_NAME.AsString);
          if qSub_Type.AsInteger = 11 then
            SetCurField(TRUE, LangText('Dostavka'))
          else SetCurField(TRUE, LangText('Samovivoz'));
          if not (Pos('facility', LowerCase(FileName)) > 0) then  // ���� ������ - �� ��������
            SetCurField(True, TimeToPay(PayDays, True));
        end;
      end;
      // ��� �� ������
      if not DopConsent and (DogType = dtS) and (FileName = 'AktService') then
      begin
        SetCurField(True, qDOG.AsString);
        SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime));
        qServiceDetail.Open;
        qServiceDetail.first;
        SetCurField(False, '');
        while not qServiceDetail.Eof do
        begin
          MsWord.WordBasic.NextCell;
          MsWord.WordBasic.Insert(qServiceDetail.FieldByName('service_name').AsString);
          MsWord.WordBasic.NextCell;
          MsWord.WordBasic.Insert(qServiceDetail.FieldByName('DimName').AsString);
          MsWord.WordBasic.NextCell;
          MsWord.WordBasic.Insert(qServiceDetail.FieldByName('count_').AsString);
          MsWord.WordBasic.NextCell;
          MsWord.WordBasic.Insert(qServiceDetail.FieldByName('Price').AsString);
          MsWord.WordBasic.NextCell;
          MsWord.WordBasic.Insert(qServiceDetail.FieldByName('SUMM_X_NDS').AsString);
          Total := Total + qServiceDetail.FieldByName('SUMM_X_NDS').AsFloat;
          qServiceDetail.Next;
        end;
        MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(LangText('Itogo'));
        MsWord.WordBasic.NextCell; MsWord.WordBasic.NextCell; MsWord.WordBasic.NextCell;
        MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(FloatToStrF(Total, ffFixed, 15, 2)); //�����
        MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(FloatToStr(TAX_RATE(qDog_Date.AsDateTime) * 100) + '% ' + LangText('NDS'));
        MsWord.WordBasic.NextCell; MsWord.WordBasic.NextCell; MsWord.WordBasic.NextCell;
        MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(FloatToStrF(GetNDS_NoNDS(Total, qDog_Date.AsDateTime), ffFixed, 15, 2)); // ���
        MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(LangText('Vsego'));
        MsWord.WordBasic.NextCell; MsWord.WordBasic.NextCell; MsWord.WordBasic.NextCell;
        MsWord.WordBasic.NextCell; MsWord.WordBasic.Insert(FloatToStrF(GetWithNDS_NoNDS(Total, qDog_Date.AsDateTime), ffFixed, 15, 2)); // �����
        SetCurField(True, NumStrGrn(GetWithNDS_NoNDS(Total, qDog_Date.AsDateTime), TranslateText('���.'), TranslateText('���.'))); // ����� ��������
      end;
      //************************************************************************
      //****************  ��� ��������������� ����������  **********************
      if DopConsent and not DopPayFlex then
      begin
        if DogType = dtK then
        begin
          SetCurField(True, qDOG.AsString);
          SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime));
          SetCurField(True, NumApplication);
          SetCurField(True, DateApplication);
          SetCurField(True, qDOG.AsString);
          SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime));
          SetCurField(True, NumApplication);
          SetCurField(True, DateApplication);
          SetCurField(True, qDOG.AsString);
          SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime));
          SetCurField(True, qDOG.AsString);
          SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime));
          SetCurField(True, NumApplication);
          SetCurField(True, DateApplication);
          SetCurField(True, qDOG.AsString);
          SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime));
          SetCurField(True, NumApplication);
          SetCurField(True, DateApplication);
          SetCurField(True, qDOG.AsString);
          SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime));
          SetCurField(True, NumApplication);
          SetCurField(True, DateApplication);
        end
        else
        begin
          if DogType <> dtN then
          begin
            SetCurField(True, qDOG.AsString);
            SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime));
            SetCurField(True, qDOG.AsString);
            SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime));
          end;
          SetCurField(True, qDOG.AsString);
          SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime));
          SetCurField(True, qDOG.AsString);
          SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime));
          SetCurField(True, qDOG.AsString);
          SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime));
          SetCurField(True, qDOG.AsString);
          SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime));
        end;
      end;
      //************************************************************************
      //*************************  ���������  **********************************
      if (PRINT_DOG_FILIAL = 'Y') and ((DOG_WITH_REKVIZIT_CONTROL = 'Y') or (REKVIZIT_FILIALA_NK = 'Y')) then
      begin
        if (DOG_WITH_REKVIZIT_CONTROL = 'Y') and (REKVIZIT_FILIALA_NK = 'N') then
        begin
          // 1 ������
          SetCurField(True, LangText('SvidPlatNDC') + qParent.FieldByName('Svid_Num').AsString);
          ProgrForm.AddProgress(1);
          // 2 ������
          SetCurField(True, LangText('NalNum_UrLic') + qParent.FieldByName('Nal_Num').AsString);
          ProgrForm.AddProgress(1);
          // 3 ������
          SetCurField(True, qParent.FieldByName('Name').AsString);
          ProgrForm.AddProgress(1);
          // 4 ������
          SetCurField(True, LangText('Adr') + qParent.FieldByName('Addr').AsString + TranslateText(' ���. ') + qParent.FieldByName('phone').AsString);
          ProgrForm.AddProgress(1);
          // 5 ������
          // �/� � �/� ��� �������� � ����� ������
          SetCurField(True, LangText('R/S') + qParent.FieldByName('Rach_Chet').AsString);
          ProgrForm.AddProgress(1);
          // ��������� PRINT_RS, ���� 'Y' �� �������� �/� ���, � ���� 'N' �� ���
          if PRINT_RS = 'Y' then
            SetCurField(True, LangText('RS_NDS') + qParent.FieldByName('Rach_Chet_Nds').AsString)
          else SetCurField(false, '');
          ProgrForm.AddProgress(1);
          // 6 ������
          SetCurField(True, TranslateText('� ') + qParent.FieldByName('Bank_Name').AsString);
          ProgrForm.AddProgress(1);
          // 7 ������
          SetCurField(True, TranslateText('��� ') + qParent.FieldByName('MFO').AsString);
          ProgrForm.AddProgress(1);
          SetCurField(True, TranslateText('��� ') + LangText('EDRPOU') + qParent.FieldByName('Id_Num').AsString);
          ProgrForm.AddProgress(1);
          // 8 ������
          SetCurField(false, '');
          ProgrForm.AddProgress(1);
          // 9 ������
          SetCurField(True, qFrom_Name.AsString);
          ProgrForm.AddProgress(1);
          // 10 ������
          SetCurField(True, LangText('Adr') + qFrom_Addr.AsString + TranslateText(' ���. ') + qFrom_Phone.AsString);
          ProgrForm.AddProgress(1);
          SetCurField(false, '');
          ProgrForm.AddProgress(1);
          // 11 ������
          if qFROM_BOSS_POST.IsNull then SetCurField(True, TranslateText('��������: ') + qFrom_Boss.AsString)
          else SetCurField(True, qFROM_BOSS_POST.AsString + ': ' + qFrom_Boss.AsString);
          ProgrForm.AddProgress(1);
          // 12 ������
          SetCurField(false, '');
          ProgrForm.AddProgress(1);
          SetCurField(false, '');
          ProgrForm.AddProgress(1);
          // 13 ������
          SetCurField(false, '');
        end;

        if (DOG_WITH_REKVIZIT_CONTROL = 'N') and (REKVIZIT_FILIALA_NK = 'Y') then
        begin
          if qFROM_TYPE.AsInteger = 3 then
          begin
            // 1 ������
            SetCurField(false, LangText('Mestonah'));
            ProgrForm.AddProgress(1);
            // 2 ������
            SetCurField(true, qParentP.FieldByName('Name').AsString);
            ProgrForm.AddProgress(1);
            // 3 ������
            SetCurField(true, LangText('Adr') + qParentP.FieldByName('Addr').AsString + TranslateText(' ���. ') + qParentP.FieldByName('phone').AsString);
            ProgrForm.AddProgress(1);
            // 4 ������
            SetCurField(false, '');
            ProgrForm.AddProgress(1);
            // 5 ������
            SetCurField(True, LangText('SvidPlatNDC') + qFrom_Svid_Num.AsString);
            ProgrForm.AddProgress(1);
            SetCurField(false, '');
            ProgrForm.AddProgress(1);
            // 6 ������
            SetCurField(True, LangText('NalNum_UrLic') + qFrom_Nal_Num.AsString);
            ProgrForm.AddProgress(1);
            // 7 ������
            SetCurField(false, LangText('Mestonah_fil'));
            ProgrForm.AddProgress(1);
            SetCurField(false, '');
            ProgrForm.AddProgress(1);
            // 8 ������
            SetCurField(True, qParent.FieldByName('Name').AsString);
            ProgrForm.AddProgress(1);
            // 9 ������
            SetCurField(True, LangText('Adr') + qParent.FieldByName('Addr').AsString + TranslateText(' ���. ') + qParent.FieldByName('Phone').AsString);
            ProgrForm.AddProgress(1);
            // 10 ������
            // �/� � �/� ��� �������� � ����� ������
            SetCurField(True, LangText('R/S') + qParent.FieldByName('Rach_Chet').AsString);
            ProgrForm.AddProgress(1);
            // ��������� PRINT_RS, ���� 'Y' �� �������� �/� ���, � ���� 'N' �� ���
            if PRINT_RS = 'Y' then
              SetCurField(True, LangText('RS_NDS') + qParent.FieldByName('Rach_Chet_Nds').AsString)
            else SetCurField(false, '');
            ProgrForm.AddProgress(1);
            // 11 ������
            SetCurField(True, TranslateText('� ') + qParent.FieldByName('Bank_Name').AsString);
            ProgrForm.AddProgress(1);
            // 12 ������
            SetCurField(True, TranslateText('��� ') + qParent.FieldByName('MFO').AsString);
            ProgrForm.AddProgress(1);
            SetCurField(True, TranslateText('��� ') + LangText('EDRPOU') + qParent.FieldByName('Id_Num').AsString);
            ProgrForm.AddProgress(1);
            // 13 ������
            if qParent.FieldByName('Boss_Post').IsNull then
              SetCurField(True, TranslateText('��������: ') + qParent.FieldByName('Boss').AsString)
            else SetCurField(True, qParent.FieldByName('Boss_Post').AsString + ': ' + qParent.FieldByName('Boss').AsString);
          end
          else
          begin
            // 1 ������
            SetCurField(false, LangText('Mestonah'));
            ProgrForm.AddProgress(1);
            // 2 ������
            SetCurField(true, qParent.FieldByName('Name').AsString);
            ProgrForm.AddProgress(1);
            // 3 ������
            SetCurField(true, LangText('Adr') + qParent.FieldByName('Addr').AsString + TranslateText(' ���. ') + qParent.FieldByName('phone').AsString);
            ProgrForm.AddProgress(1);
            // 4 ������
            SetCurField(false, '');
            ProgrForm.AddProgress(1);
            // 5 ������
            SetCurField(false, LangText('Mestonah_fil'));
            ProgrForm.AddProgress(1);
            SetCurField(false, '');
            ProgrForm.AddProgress(1);
            // 6 ������
            SetCurField(True, LangText('SvidPlatNDC') + qFrom_Svid_Num.AsString);
            ProgrForm.AddProgress(1);
            // 7 ������
            SetCurField(True, LangText('NalNum_UrLic') + qFrom_Nal_Num.AsString);
            ProgrForm.AddProgress(1);
            SetCurField(false, '');
            ProgrForm.AddProgress(1);
            // 8 ������
            SetCurField(True, qFrom_Name.AsString);
            ProgrForm.AddProgress(1);
            // 9 ������
            SetCurField(True, LangText('Adr') + qFrom_Addr.AsString + TranslateText(' ���. ') + qFrom_Phone.AsString);
            ProgrForm.AddProgress(1);
            // 10 ������
            // �/� � �/� ��� �������� � ����� ������
            SetCurField(True, LangText('R/S') + qFrom_Rach_Chet.AsString);
            ProgrForm.AddProgress(1);
            // ��������� PRINT_RS, ���� 'Y' �� �������� �/� ���, � ���� 'N' �� ���
            if PRINT_RS = 'Y' then
              SetCurField(True, LangText('RS_NDS') + qFrom_Rach_Chet_Nds.AsString)
            else SetCurField(false, '');
            ProgrForm.AddProgress(1);
            // 11 ������
            SetCurField(True, TranslateText('� ') + qFrom_Bank_Name.AsString);
            ProgrForm.AddProgress(1);
            // 12 ������
            SetCurField(True, TranslateText('��� ') + qFrom_MFO.AsString);
            ProgrForm.AddProgress(1);
            SetCurField(True, TranslateText('��� ') + LangText('EDRPOU') + qFrom_OKPO.AsString);
            ProgrForm.AddProgress(1);
            // 13 ������
            if qFROM_BOSS_POST.IsNull then
              SetCurField(True, TranslateText('��������: ') + qFrom_Boss.AsString)
            else SetCurField(True, qFROM_BOSS_POST.AsString + ': ' + qFrom_Boss.AsString);
          end;
        end;
      end
      else
      begin
        // 1 ������
        SetCurField(True, LangText('SvidPlatNDC') + qFrom_Svid_Num.AsString);
        ProgrForm.AddProgress(1);
        // 2 ������
        SetCurField(True, LangText('NalNum_UrLic') + qFrom_Nal_Num.AsString);
        ProgrForm.AddProgress(1);
        // 3 ������
        SetCurField(True, qFrom_Name.AsString);
        ProgrForm.AddProgress(1);
        // 4 ������
        SetCurField(True, LangText('Adr') + qFrom_Addr.AsString + TranslateText(' ���. ') + qFrom_Phone.AsString);
        ProgrForm.AddProgress(1);
        // 5 ������
        // �/� � �/� ��� �������� � ����� ������
        SetCurField(True, LangText('R/S') + qFrom_Rach_Chet.AsString);
        ProgrForm.AddProgress(1);
        // ��������� PRINT_RS, ���� 'Y' �� �������� �/� ���, � ���� 'N' �� ���
        if PRINT_RS = 'Y' then
          SetCurField(True, LangText('RS_NDS') + qFrom_Rach_Chet_Nds.AsString)
        else SetCurField(false, '');
        ProgrForm.AddProgress(1);
        // 6 ������
        SetCurField(True, TranslateText('� ') + qFrom_Bank_Name.AsString);
        ProgrForm.AddProgress(1);
        // 7 ������
        SetCurField(True, TranslateText('��� ') + qFrom_MFO.AsString);
        ProgrForm.AddProgress(1);
        SetCurField(True, TranslateText('��� ') + LangText('EDRPOU') + qFrom_OKPO.AsString);
        ProgrForm.AddProgress(1);
        // 8 ������
        if qFROM_BOSS_POST.IsNull then
          SetCurField(True, TranslateText('��������: ') + qFrom_Boss.AsString)
        else SetCurField(True, qFROM_BOSS_POST.AsString + ': ' + qFrom_Boss.AsString);
        ProgrForm.AddProgress(1);
        // 9 ������
        SetCurField(false, '');
        ProgrForm.AddProgress(1);
        // 10 ������
        SetCurField(false, '');
        ProgrForm.AddProgress(1);
        SetCurField(false, '');
        ProgrForm.AddProgress(1);
        // 11 ������
        SetCurField(false, '');
        ProgrForm.AddProgress(1);
        // 12 ������
        SetCurField(false, '');
        ProgrForm.AddProgress(1);
        SetCurField(false, '');
        ProgrForm.AddProgress(1);
        // 13 ������
        SetCurField(false, '');
      end;
      // ������� ���������� ����������
      if qTo_face.asInteger = 1 then
      begin
        SetCurField(True, LangText('FIO') + qTo_Name.AsString);
        ProgrForm.AddProgress(1);
        SetCurField(True, LangText('NalNum') + qTo_OKPO.AsString);
        ProgrForm.AddProgress(1);
        SetCurField(True, LangText('Adr') + qTo_Addr.AsString + TranslateText(' ���. ') + qTo_Phone.AsString);
        ProgrForm.AddProgress(1);
        SetCurField(True, LangText('Pasport') + qPassp_Ser.AsString + ' � ' + qPassp_Num.AsString);
        ProgrForm.AddProgress(1);
        SetCurField(True, LangText('Vudan') + qPassp_When.AsString);
        ProgrForm.AddProgress(1);
        SetCurField(True, qPassp_Whom.AsString);
        ProgrForm.AddProgress(1);
        SetCurField(True, ''); SetCurField(True, ''); SetCurField(True, ''); SetCurField(True, '');
      end
      else
      begin
        SetCurField(True, LangText('SvidPlatNDC') + qTo_Svid_Num.AsString);
        ProgrForm.AddProgress(1);
        SetCurField(True, LangText('NalNum_UrLic') + qTo_Nal_Num.AsString);
        ProgrForm.AddProgress(1);
        SetCurField(True, qTo_Name.AsString);
        ProgrForm.AddProgress(1);
        SetCurField(True, LangText('Adr') + qTo_Addr.AsString + TranslateText(' ���. ') + qTo_Phone.AsString);
        ProgrForm.AddProgress(1);
        // �/� � �/� ��� �������� � ����� ������
        SetCurField(True, LangText('R/S') + qTo_Rach_Chet.AsString);
        ProgrForm.AddProgress(1);
        // ��������� PRINT_RS, ���� 'Y' �� �������� �/� ���, � ���� 'N' �� ���
        if PRINT_RS = 'Y' then
          SetCurField(True, LangText('RS_NDS') + qTo_Rach_Chet_Nds.AsString)
        else SetCurField(false, '');
        ProgrForm.AddProgress(1);
        SetCurField(True, TranslateText('� ') + qTo_Bank_Name.AsString);
        ProgrForm.AddProgress(1);
        SetCurField(True, TranslateText('��� ') + qTo_MFO.AsString);
        ProgrForm.AddProgress(1);
        SetCurField(True, TranslateText('��� ') + LangText('EDRPOU') + qTo_OKPO.AsString);
        ProgrForm.AddProgress(1);
        if qTO_BOSS_POST.IsNull then
          SetCurField(True, TranslateText('��������: ') + qTo_Boss.AsString)
        else SetCurField(True, qTO_BOSS_POST.AsString + ': ' + qTo_Boss.AsString);
      end;
      ProgrForm.AddProgress(100);
      MsWord.Visible := True;
      MsWord := UnAssigned;
    end; // if OleConnect
    qParent.Free;
    if qFROM_TYPE.AsInteger = 3 then qParentP.Free;
    ProgrForm.Free;
  except on E: Exception do
    begin
      qParent.Free;
      if qFROM_TYPE.AsInteger = 3 then qParentP.Free;
      St.Free;
      MessageDlg(TranslateText('������ : ') + E.message, mtError, [mbOk], 0);
      ProgrForm.Free;
      MsWord := UnAssigned;
    end;
  end;
end;
//==============================================================================
procedure TDogRefForm.DogRepAppendix(
  FileName: string;  // ����� �����, ��� ���������� � ������� ����������� "_Ukr" i "_Rus"
  is_ownList: boolean = false  // ���� ���, �� ��������� ������� ������ ��� � ����� "\Pattern\DogTAppendixOwn.doc"
  );
var
  ProgrForm: TProgrForm;
  iDelta, iStep: Real;
begin
  try
    if OleConnect('Word.Application', MsWord) then
      begin
        Application.CreateForm(TProgrForm, ProgrForm);
        ProgrForm.Show;
        ProgrForm.Refresh;
        MsWordDocAdd(FileName);
        //MsWord.Visible := True;
        Range := MsWord.Documents.Item(1).Range;
        SetCurField(True, qDOG.AsString);
        ProgrForm.AddProgress(5);
        SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime));
        ProgrForm.AddProgress(5);
        if not is_ownList then
          begin
            qWork.Close;
            qWork.SQL.Text := '-->qListAZS,DogRef' + #13#10 +
                              'select distinct oo.id,' +
                                             ' oo.name   as azs_name,' +
                                             ' oo.addr   as azs_addr,' +
                                             ' oobl.name as obl_name' +
                               ' from v_oil_org oo, oil_org oobl' +
                              ' where oobl.state = ''Y''' +
                                ' and oobl.id = oo.oblid' +
                                ' and oobl.id = oobl.inst' +
                                ' and oo.org_id = 8' +
                                ' and oo.name not like ''%�����-����%''' +
                                ' and oo.oblid = oo.oblinst' +
                                ' and oo.oblid =' +
                                      ' (select distinct v.oblid' +
                                        '  from v_oil_org v' +
                                        ' where v.id = v.inst and v.id = :p_from)' +
                                ' and not exists (select *' +
                                                  ' from oil_dr_summary t' +
                                                 ' where t.state = ''Y''' +
                                                   ' and t.rep_id is null' +
                                                   ' and t.azs_id = oo.id' +
                                                   ' and sysdate <= t.end_date)' +
                              ' order by oo.id';
            _OpenQueryPar(qWork,
                          ['p_from',qFROM_.AsInteger]);
            if not qWork.IsEmpty then
              begin
                iDelta := 10;
                iStep := 90/qWork.RecordCount;
                qWork.First;
                SetCurField(False, qWork.FieldByName('obl_name').AsString);
                SetCurField(False, '');
                repeat
                  MsWord.WordBasic.NextCell;
                  MsWord.WordBasic.Insert(qWork.FieldByName('azs_name').AsString);
                  MsWord.WordBasic.NextCell;
                  MsWord.WordBasic.Insert(qWork.FieldByName('azs_addr').AsString);
                      iDelta := iDelta + iStep;
                  ProgrForm.Progress := Round(iDelta);
                  qWork.Next;
                until qWork.eof;
              end;
          end;
        ProgrForm.Progress := 100;
        MsWord.Visible := True;
        MsWord := UnAssigned;     
      end;
    ProgrForm.Free;
  except on E: Exception do
    begin
      qWork.Free;
      MessageDlg(TranslateText('������ : ') + E.message, mtError, [mbOk], 0);
      ProgrForm.Free;
      MsWord := UnAssigned;
    end;
  end;
end;
//==============================================================================
procedure TDogRefForm.sbFromClearClick(Sender: TObject);
begin
  if not eFrom.Enabled then exit;
  eFrom.Clear;
  eFrom.Tag := 0;
  lFrom.Tag := 0;
end;
//==============================================================================
procedure TDogRefForm.sbToClearClick(Sender: TObject);
begin
  if not eTo.Enabled then exit;
  eTo.Clear;
end;
//==============================================================================
procedure TDogRefForm.sbSchemeClearClick(Sender: TObject);
begin
  cbScheme.Itemindex := -1;
end;
//==============================================================================
procedure TDogRefForm.sbDateClearClick(Sender: TObject);
begin
  eDate.Clear;
end;
//==============================================================================
procedure TDogRefForm.bbClearClick(Sender: TObject);
begin
  sbFromClearClick(nil);
  sbToClearClick(nil);
  if eDate.Enabled then eDate.Clear;
  if edDog.Enabled then edDog.Clear;
  sbPayClearClick(nil);
  sbSchemeClearClick(nil);
  sbClearNTypeClick(nil);
  eToDate.Text := '';
end;
//==============================================================================
procedure TDogRefForm.bbSearchClick(Sender: TObject);
var
  i: integer;
begin
  q.Close;
  //�������� ���������
  for i := 0 to q.Params.Count - 1 do
    q.Params.Items[i].Value := Null;
  // ������ �������
  lblPay.Visible := (CurrDogType in [dtK, dtN]);
  cbPay.Visible := (CurrDogType in [dtK, dtN]);
  NotebookSubType.Visible := (CurrDogType in [dtK, dtN]);
  sbPayClear.Visible := (CurrDogType in [dtK, dtN]);
  if (CurrDogType = dtK) then
  begin
    NotebookSubType.PageIndex := 0;
    // ������ �� ��������� �����
    case cbScheme.Itemindex of
      0: q.ParamByName('sub_type').AsInteger := 100;
      1: q.ParamByName('sub_type').AsInteger := 101;
    end;
  end
  else
    if (CurrDogType = dtN) then
    begin
      NotebookSubType.PageIndex := 1;
      // ������ �� ����
      case cbNType.ItemIndex of
        0: q.ParamByName('sub_type').AsInteger := 11;
        1: q.ParamByName('sub_type').AsInteger := 10;
        2: q.ParamByName('sub_type').AsInteger := 12;
      end;
    end;
  // ������ �� ���� ������
  if cbPay.Itemindex > -1 then
    q.ParamByName('forepay').AsInteger := cbPay.ItemIndex;
  // ������ �� �������� ��������
  q.ParamByName('dog').AsString := edDog.Text;
  // ������ �� ��������
  if eFrom.Text <> '' then
  begin
    q.ParamByName('from_').AsInteger := eFrom.Tag;
    q.ParamByName('from_inst').AsInteger := lFrom.Tag;
  end;
  // ������ �� ����������
  if eTo.Text <> '' then
  begin
    q.ParamByName('to_').AsInteger := eTo.Tag;
    q.ParamByName('to_inst').AsInteger := lTo.Tag;
  end;
  // ������ �� ���� ��������
  if eDate.Date <> 0 then
  begin
    q.ParamByName('BeginDate').AsDateTime := eDate.Date;
    q.ParamByName('EndDate').AsDateTime := eToDate.Date;
  end;
  // ������ �� ���� ��
  if eNPType.Text <> '' then
    q.ParamByName('np_type').AsInteger := eNPType.Tag;
  // ������ �� �������� ���������
  q.ParamByName('dog_type').AsString:=GetDogTypeText(CurrDogType);

  // sbBasePrint.Enabled := not (CurrDogType = dtV);
  Order.Enabled := not (CurrDogType = dtV);
  miKPPred.Visible := (CurrDogType in [dtN, dtS]);
  miKPPosle.Visible := (CurrDogType in [dtN, dtS]);
  miAktService.Visible := CurrDogType = dtS;
  miDogFacilityPred.Visible := CurrDogType = dtN;
  miTalRep.Visible := CurrDogType = dtY;
  miTalAdd.Visible := CurrDogType = dtY;
  miTalRepANP.Visible := CurrDogType = dtY;
  miTalRepBudget.Visible := CurrDogType = dtY;
  miTalAddOwn.Visible := CurrDogType = dtY;
  miCardEC.Visible := CurrDogType = dtK;
  miCardLS.Visible := CurrDogType = dtK;
  nPrintAZSList.Visible := CurrDogType = dtK;
  miCardRnLs.Visible := CurrDogType = dtK;
  miCardRnLsDelete.Visible := CurrDogType = dtK;
  nbDetail.Visible := not (CurrDogType = dtV);
  miCardRnLs.Enabled := not (CurrDogType in [dtS,dtV]);
  miDopConsent.Visible := not (CurrDogType in [dtK,dtV]);
  nbDetail.ActivePage := IfThen(CurrDogType = dtS, 'ServiceDetail', 'TalonDetail');

  _OpenQuery(q);
end;
//==============================================================================
procedure TDogRefForm.sbDelClick(Sender: TObject);
var
  msg:string;
begin
  if q.IsEmpty then Abort;
  if MessageDlg(TranslateText('�� ������� ��� ������ ������� ������?'), mtConfirmation, [mbYes, mbNo], 0) = mrNo then Abort;
  DOG_Start_SQL;
  try
    if Inst <> q.FieldByName('Inst').AsInteger then
      raise Exception.Create(TranslateText('������ ������� ������ ��������� ������ ������������ !'));
    if StrToDate(Close_Date) >= q.FieldByName('Dog_Date').AsDateTime then
      raise Exception.Create(TranslateText('������ ������ ������ !'));
    // �������� �� ������ � ���������
    if (q.FieldByName('Sub_Type').asInteger <> 101) and (q.FieldByName('ForePay').asInteger <> 1) then
    begin         
      qWork.SQL.Text :=
        'select date_ from card_transaction where To_Id = '+ q.FieldByName('To_').AsString +
        ' and To_inst = '+ q.FieldByName('To_Inst').AsString;
      qWork.Open;
      if (not qWork.IsEmpty) then
        raise Exception.Create(TranslateText('������ ������� �������, �� ������������ � ��������� � ���������� '));
    end;
    // �������� �� ������ � ���������
    qWork.SQL.Text :=
      'select ct.date_ from card_transaction ct, v_org org where org.card_id = ct.�������_���' +
      ' and org.id = '+ q.FieldByName('To_').AsString +' and org.inst = '+ q.FieldByName('To_Inst').AsString;
    qWork.Open;
    if not qWork.IsEmpty then
      raise Exception.Create(TranslateText('������ ������� �������, �� ������������ � ��������� � ���������� '));

    // �������� �� ������ � �������
    qWork.Close;
    qWork.SQL.Text := 'select * from oil_sale_book ' +
      'where organ = :organ and organ_inst = :organ_inst and state = ''Y'' and trunc(s_date) = to_date(:s_date,''dd.mm.yyyy'') and nal_t = 8';
    _OpenQueryPar(qWork,
      ['organ',      qTo_.AsInteger,
       'organ_inst', qTo_Inst.AsInteger,
       's_date',     FormatDateTime('dd.mm.yyyy',qDog_Date.AsDateTime)]);
    if not qWork.IsEmpty then
      raise Exception.Create(TranslateText('������ ������� �������, �� ���� �������� ��������� ��������� �') +
        qWork.FieldByName('Num').asString);

    msg := TestDogLink(qId.AsInteger, qInst.AsInteger,
      TranslateText('������ ������� �������, ���� �������� ����������� �� ���� �������: %s �� %s.')
        +#13#10+TranslateText('������� ���� ��������, � ����� �������� �������.'));
    if msg <>'' then
      raise Exception.Create(msg);

    // �������� ����������� �������
    _ExecSql('update oil_dog_detail set state = ''N'' where dog_id = :dog_id and dog_inst = :dog_inst ',
      ['dog_id',   qId.AsInteger,
       'dog_inst', qInst.AsInteger]);
    // �������� ����������� ������� ��������� ���������
    if (CurrDogType = dtK) then
    begin
      _ExecSql('update oil_rash_nak set State = ''N'' where source_id = :source_id and source_inst = :source_inst and rash_nak_type = 1 ',
        ['source_id',   qId.AsInteger,
         'source_inst', qInst.AsInteger]);
    end;
    // ��������� �������
    if not qBILL_ID.IsNull then
      DelBill(qBILL_ID.AsInteger, qBILL_INST.AsInteger, 0, 0);
    // �������� ����� ��������
    q.Delete;
    if ToCommit = True then
      CommitSQL;
    bbSearchClick(nil);
  except on E: Exception do
    begin
      ShowMessage(E.Message);
      DOG_Rollback_SQL;
      bbSearchClick(nil);
    end;
  end;
end;
//==============================================================================
procedure TDogRefForm.sbAddClick(Sender: TObject);
begin
  DOG_Start_SQL;
  try
    // ���������� ������
    q.Insert;
    q.FieldByName('Inst').AsInteger := Inst;
    q.FieldByName('Dog_Date').AsDateTime := Date;
    q.FieldByName('Exp_Date').AsDateTime := Date;
    DogForm := TDogForm.Create(self);
    DogForm.mbEdit := False;

    DogForm.FROM_ID := Main.MAIN_ID;
    DogForm.FROM_INST := Main.INST;
    if (GENERATION >= 2) and (CurrDogType in [dtY,dtK]) then
    begin
      DogForm.FROM_ID := Main.AVIAS_ID;
      DogForm.FROM_INST := Main.AVIAS_INST;
    end
    else
    begin
      DogForm.FROM_ID := Main.MAIN_ID;
      DogForm.FROM_INST := Main.INST;
    end;
    DogForm.sbDel.Visible := not (CurrDogType = dtV);
    DogForm.pnlHelpButton.Visible := CurrDogType = dtK;
    case CurrDogType of
      // ������� �� �������
      dtY:
        begin
          q.FieldByName('Dog_Type').AsString := 'Y';
          DogForm.lMode.Caption := isTalon;
          DogForm.rbForePayYes.Checked := True;
          DogForm.rbForePayYesClick(nil);
        end;
      // ������� �������
      dtN:
        begin
          q.FieldByName('Dog_Type').AsString := 'N';
          DogForm.lMode.Caption := isOpt;
          DogForm.rbForePayNoClick(nil);
          DogForm.rbForePayNo.Checked := True;
          DogForm.rbSelfTransport.Checked := True;
          DogForm.rbSelfTransportClick(nil);
        end;
      // ������� �� ���������
      dtK:
        begin
          q.FieldByName('Dog_Type').AsString := 'K';
          DogForm.lMode.Caption := IsCard;
          DogForm.rbEK.Checked := True;
          DogForm.rbEKClick(nil);
          DogForm.rbForePayYes.Checked := True;
          DogForm.rbForePayYesClick(nil);
        end;
      // ������� �� �������
      dtS:
        begin
          q.FieldByName('Dog_Type').AsString := 'S';
          DogForm.lMode.Caption := isService;
        end;
      // ������� �� ���������
      dtV:
        begin
          q.FieldByName('Dog_Type').AsString := 'V';
          DogForm.lMode.Caption := isVed;
          DogForm.Width := DogForm.Width - 100;
        end;
    end; //case
    if (CurrDogType in [dtY, dtN, dtK, dtS]) then
    begin
      q.FieldByName('Id').AsInteger := GetSeqNextVal('S_OIL_DOG');
      q.Post;
    end;
    DogForm.ShowModal;
    if DogForm.ModalResult = mrOk then
    begin
      if ToCommit = True then CommitSQL;
    end
    else
    begin
      DOG_Rollback_SQL;
      bbSearchClick(nil);
    end;
    DogForm.Free;
  except on E: Exception do
    begin
      ShowMessage(E.Message);
      DOG_Rollback_SQL;
      bbSearchClick(nil);
    end;
  end;
  q.Close;
  q.Open;
  qDogDetail.Close;
  qDogDetail.Open;
  MakePetrolLinkFile();
end;
//==============================================================================
procedure TDogRefForm.sbEditClick(Sender: TObject);
var
  DogForm: TDogForm;
  OnlyShow: Boolean;
  CurrPlace: TBookMark;
begin
  OnlyShow := False;
  if q.IsEmpty then Abort;
  CurrPlace := q.GetBookmark;
  DOG_Start_SQL;
  try
    // �������� �� Inst
    if (Inst <> q.FieldByName('Inst').AsInteger) or (StrToDate(Close_Date) >= q.FieldByName('Dog_Date').AsDateTime) then
      OnlyShow := True;
    if (Copy(qDog.asString, length(qDog.asString) - 3, 2) = '*�') and (CurrDogType = dtK) then // *NO_TRANSLATE*
    begin
      // �������� �� ������ � �������
      qWork.Close;
      qWork.SQL.Text := ' select * from oil_sale_book ' +
        '  where organ= ' + qTo_.AsString +
        '  and organ_inst=' + qTo_Inst.AsString +
        '  and state=''Y''       ' +
        '  and s_date = ''' + qDog_Date.AsString + '''' +
        '  and nal_t = 8 ';
      qWork.Open;
      if not qWork.IsEmpty then
        raise Exception.Create(TranslateText('������ ������������� �������, �� ���� �������� ��������� ��������� �') +
          qWork.FieldByName('Num').asString);
    end;
    DogForm := TDogForm.Create(self);
    DogForm.mbEdit := True;
    DogForm.FROM_ID := qFrom_.AsInteger;
    DogForm.FROM_INST := qFrom_inst.AsInteger;
    if OnlyShow then
    begin
      DogForm.bbOk.Enabled := False;
      DogForm.sbDel.Enabled := False;
    end;
    DogForm.dbeDog.Color := clWindow;
    DogForm.SbAuto.Down := false;
    DogForm.sbDel.Visible := not (CurrDogType = dtV);
    // ������� �� �������
    if qDog_Type.AsString = 'Y' then
      DogForm.lMode.Caption := isTalon;
    // ������� �� �. ����
    if qDog_Type.AsString = 'N' then
    begin
      case qSub_Type.AsInteger of
        10: DogForm.rbSelfTransport.Checked := true; // ���������
        11: DogForm.rbDelivery.Checked := true; // ��������
        12: DogForm.rbBetweenFil.Checked := true; // ������
      end;
      DogForm.lMode.Caption := isOpt;
    end;
    // ������� �� ���������
    if qDog_Type.AsString = 'K' then
    begin
      DogForm.lMode.Caption := IsCard;
      case qSub_Type.asInteger of
        101: DogForm.rbLS.Checked := True;
        100: DogForm.rbEK.Checked := True;
      end;
    end;
    // ������� �� ���������
    if qDog_Type.AsString = 'V' then
    begin
      DogForm.lMode.Caption := isVed;
      DogForm.Width := DogForm.Width - 100;
    end;
    // ������� �� �������
    if qDog_Type.AsString = 'S' then
      DogForm.lMode.Caption := isService;
    if q.FieldByName('ForePay').AsInteger = 1 then
      DogForm.rbForePayYes.Checked := True
    else DogForm.rbForePayNo.Checked := True;
    
    DogForm.ShowModal;
    if DogForm.ModalResult = mrOk then
    begin
      if ToCommit = True then CommitSQL;
      if DogForm.mbEdit = true then
      begin
        edDog.Text := q.FieldByName('dog').AsString;
        bbSearchClick(nil);
      end;
    end
    else
    begin
      DOG_Rollback_SQL;
      bbSearchClick(nil);
    end;
    DogForm.Free;
  except on E: Exception do
    begin
      ShowMessage(E.Message);
      DOG_Rollback_SQL;
      bbSearchClick(nil);
    end;
  end;
  q.Close;
  q.Open;
  qDogDetail.Close;
  qDogDetail.Open;
  q.Refresh;
  if q.BookmarkValid(CurrPlace) then q.GotoBookmark(CurrPlace);
  q.FreeBookmark(CurrPlace);
end;
//==============================================================================
procedure TDogRefForm.miKPPredClick(Sender: TObject);
begin
  if q.IsEmpty then Abort;
  if (CurrDogType = dtS) then
    DogRep('DogService', dtS, q.FieldByName('Id').Value, q.FieldByName('Inst').Value)
  else DogRep('DogPred', dtN, q.FieldByName('Id').Value, q.FieldByName('Inst').Value); // ����������� ����
end;
//==============================================================================
procedure TDogRefForm.miKPPosleClick(Sender: TObject);
begin
  if q.IsEmpty then Abort;
  DogRep('DogPosle', dtN, q.FieldByName('Id').Value, q.FieldByName('Inst').Value); // ����������� ����
end;
//==============================================================================
procedure TDogRefForm.miAktServiceClick(Sender: TObject);
begin
  if q.IsEmpty then Abort;
  DogRep('AktService', dtS, q.FieldByName('Id').Value, q.FieldByName('Inst').Value)
end;
//==============================================================================
procedure TDogRefForm.miTalRepClick(Sender: TObject);
begin
  if q.IsEmpty then Abort;
  If (qFROM_.AsInteger = Main.AVIAS_ID) and (qFROM_INST.AsInteger = Main.AVIAS_INST) then
    AV_DogRep('AV_DogT', dtY, q.FieldByName('Id').Value, q.FieldByName('Inst').Value)
  else
    DogRep('DogT', dtY, q.FieldByName('Id').Value, q.FieldByName('Inst').Value);
end;
//==============================================================================
procedure TDogRefForm.miTalRepANPClick(Sender: TObject);
begin
  if q.IsEmpty then Abort;
  If (qFROM_.AsInteger = Main.AVIAS_ID) and (qFROM_INST.AsInteger = Main.AVIAS_INST) then
    AV_DogRep('AV_DogT_ANP', dtY, q.FieldByName('Id').Value, q.FieldByName('Inst').Value)
  else
    DogRep('DogT', dtY, q.FieldByName('Id').Value, q.FieldByName('Inst').Value);
end;
//==============================================================================
procedure TDogRefForm.miTalRepBudgetClick(Sender: TObject);
begin
  if q.IsEmpty then Abort;
  If (qFROM_.AsInteger = Main.AVIAS_ID) and (qFROM_INST.AsInteger = Main.AVIAS_INST) then
    AV_DogRep('AV_DogTBudget', dtY, q.FieldByName('Id').Value, q.FieldByName('Inst').Value, True)
  else
    DogRep('DogT', dtY, q.FieldByName('Id').Value, q.FieldByName('Inst').Value);
end;
//==============================================================================
procedure TDogRefForm.miTalAddClick(Sender: TObject);
begin
  if q.IsEmpty then Abort;
  DogRepAppendix('DogTAppendix', false);
end;
//==============================================================================
procedure TDogRefForm.miTalAddOwnClick(Sender: TObject);
begin
  if q.IsEmpty then Abort;
  If FileExists(GetMainDir+'Pattern\DogTAppendixOwn.doc') then
    begin
      MessageDlg(TranslateText('����� ����������� ������ �� �����:')+#13#10+     //������ ����������� ��� � �����:
                                IfThen(LANGUAGE=0,'  /pattern/DogTAppendixOwn.doc',
                                                  '  /pattern/DogTAppendixOwn_ukr.doc'),
                                mtInformation, [mbOK], 0);
      DogRepAppendix('DogTAppendixOwn', true);
    end
  else
    if mrYes = MessageDlg(TranslateText('�� ������� ������ � ����������� ������� ���!')+#13#10+  //�� �������� ������� � ������� ������� ���!
                          TranslateText('���������� ������ ������ ���?'),              //���������� ���� ������ ���?
                                         mtConfirmation, [mbYes, mbNo], 0)
    then
        DogRepAppendix('DogTAppendix', false);
end;
//==============================================================================
procedure TDogRefForm.miCardECClick(Sender: TObject);
begin
  if q.IsEmpty then Abort;
  If (qFROM_.AsInteger = Main.AVIAS_ID) and (qFROM_INST.AsInteger = Main.AVIAS_INST) then
    AV_DogRep('AV_DogCard', dtK, q.FieldByName('Id').Value, q.FieldByName('Inst').Value)
  else
    DogRep('DogCard', dtK, q.FieldByName('Id').Value, q.FieldByName('Inst').Value);
end;
//------------------------------------------------------------------------------
procedure TDogRefForm.miCardLSPredClick(Sender: TObject);
begin
  if q.IsEmpty then Abort;
  DogRep('DogCardLSPred', dtK, q.FieldByName('Id').Value, q.FieldByName('Inst').Value);
end;
//------------------------------------------------------------------------------
procedure TDogRefForm.miCardLSPosleClick(Sender: TObject);
begin
  if q.IsEmpty then Abort;
  DogRep('DogCardLSPosle', dtK, q.FieldByName('Id').Value, q.FieldByName('Inst').Value);
end;
//==============================================================================
procedure TDogRefForm.eFromButtonClick(Sender: TObject);
var
  vId, vInst: Integer;
  vName: string;
begin
  if ChooseOrg.CaptureOrg(3, MAIN_ID, INST, 'yyy', vId, vInst, vName) then
  begin
    eFrom.Tag := vId;
    lFrom.Tag := vInst;
    eFrom.Text := vName;
  end;
end;
//==============================================================================
procedure TDogRefForm.eToButtonClick(Sender: TObject);
var
  vId, vInst: Integer;
  vName: string;
begin
  if ChooseOrg.CaptureOrg(3, MAIN_ID, INST, 'yyy', vId, vInst, vName) then
  begin
    eTo.Tag := vId;
    lTo.Tag := vInst;
    eTo.Text := vName;
  end;
end;
//==============================================================================
procedure TDogRefForm.eNPTypeButtonClick(Sender: TObject);
var
  NPTypeRefForm: TNPTypeRefForm;
begin
  Application.CreateForm(TNPTypeRefForm, NPTypeRefForm);
  NPTypeRefForm.ShowModal;
  if NPTypeRefForm.ModalResult = mrOk then
  begin
    eNPType.Text := NPTypeRefForm.qName.AsString;
    eNPType.Tag := NPTypeRefForm.qId.AsInteger;
  end;
  NPTypeRefForm.Free;
end;
//==============================================================================
procedure TDogRefForm.rbYesClick(Sender: TObject);
begin
  cbPay.ItemIndex := -1;
  cbScheme.ItemIndex := -1;
  bbSearchClick(nil);
  qDogDetail.Open;
  qServiceDetail.Close;
end;
//==============================================================================
procedure TDogRefForm.rbNoClick(Sender: TObject);
begin
  cbPay.ItemIndex := -1;
  cbScheme.ItemIndex := -1;
  bbSearchClick(nil);
  qDogDetail.Open;
  qServiceDetail.Open;
end;
//==============================================================================
procedure TDogRefForm.qCalcFields(DataSet: TDataSet);
begin
  case DataSet.FieldByName('Sub_type').AsInteger of
    12: DataSet.FieldByName('TransportType').AsString := TranslateText('������');
    11: DataSet.FieldByName('TransportType').AsString := TranslateText('��������');
    10: DataSet.FieldByName('TransportType').AsString := TranslateText('���������');
  end;
  if DataSet.FieldByName('ForePay').AsInteger = 1 then
    DataSet.FieldByName('ForePayName').AsString := TranslateText('��')
  else DataSet.FieldByName('ForePayName').AsString := TranslateText('���');
end;
//==============================================================================
procedure TDogRefForm.qAfterPost(DataSet: TDataSet);
begin
  q.ApplyUpdates;
  q.CommitUpdates;
  qDogDetail.Close;
  qDogDetail.Open;
end;
//==============================================================================
procedure TDogRefForm.OrderClick(Sender: TObject);
begin
  if qBILL_ID.IsNull then
    MessageDlg(TranslateText('�� ������� �������� �� ������ ����!') +#10#13+
      TranslateText('����� ����������� ������� ��� �������� �����.'), mtError, [mbOk], 0)
  else TBillForm.Print(qBILL_ID.AsInteger, qBILL_INST.AsInteger, 0);
end;
//==============================================================================
procedure TDogRefForm.rbKartClick(Sender: TObject);
begin
  bbSearchClick(nil);
  qDogDetail.Open;
  qServiceDetail.Close;
end;
//==============================================================================
procedure TDogRefForm.rbVedClick(Sender: TObject);
begin
  cbPay.ItemIndex := -1;
  cbScheme.ItemIndex := -1;
  bbSearchClick(nil);
  qDogDetail.Close;
  qServiceDetail.Close;
end;
//==============================================================================
procedure TDogRefForm.rbServiceClick(Sender: TObject);
begin
  cbPay.ItemIndex := -1;
  cbScheme.ItemIndex := -1;
  bbSearchClick(nil);
  qDogDetail.Open;
  qServiceDetail.Open;
end;
//==============================================================================
procedure TDogRefForm.FormCreate(Sender: TObject);
begin
  inherited;
  ToCommit := true;
  eDate.date := GetSystemDate - 7;
  eToDate.Date := GetSystemDate;
  //eFrom.Tag := Main.MAIN_ID;
  //lFrom.Tag := Main.INST;
  //eFrom.Text := GetOrgName(Main.MAIN_ID, Main.INST);
  NumApplication := '';
  DateApplication := '';
end;
//==============================================================================
procedure TDogRefForm.nPrintAZSListClick(Sender: TObject);
begin
  if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
    MSExcel := GetActiveOleObject('Excel.Application')
  else MSExcel := CreateOleObject('Excel.Application');
  MSExcel.Workbooks.Add(GetMainDir + 'pattern\ListAZS.xlt');
  MSExcel.ActiveWorkbook.ActiveSheet.Cells[1, 'B'].Value := LangText('Dodatak1') + FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime) + LangText('Do_dog') + qDOG.AsString + LangText('Ot') + FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime);
  MSExcel.Visible := True;
  MSExcel.ScreenUpdating := True;
end;
//==============================================================================
procedure TDogRefForm.qDogDetailAfterScroll(DataSet: TDataSet);
var
  flVisible: Boolean;
begin
  inherited;
  flVisible := not ((qSub_type.asInteger = 101) and (qDog_type.asString = 'K') and (qForePay.AsInteger = 0));
  dbgDogDetail.FieldColumns['COUNT_'].Visible     := flVisible;
  dbgDogDetail.FieldColumns['PRICE'].Visible      := flVisible;
  dbgDogDetail.FieldColumns['SUMM_X_NDS'].Visible := flVisible;
  dbgDogDetail.FieldColumns['SUMM_NDS'].Visible   := flVisible;
  dbgDogDetail.FieldColumns['DIM_NAME'].Visible   := flVisible;
end;
//==============================================================================
procedure TDogRefForm.FormShow(Sender: TObject);
begin
  inherited;
  qDogDetail.Open;
  qServiceDetail.Open;
  bbSearchClick(nil);
end;
//==============================================================================
procedure TDogRefForm.sbPayClearClick(Sender: TObject);
begin
  inherited;
  cbPay.ItemIndex := -1;
end;
//==============================================================================
procedure TDogRefForm.sbNPTypeClearClick(Sender: TObject);
begin
  inherited;
  if not eNpType.Enabled then exit;
  eNpType.Text := '';
  eNpType.Tag := 0;
end;
//==============================================================================
procedure TDogRefForm.miCardRnLsClick(Sender: TObject);
var
  bm: TBookMark;
  flCardFound: Boolean;
begin
  if q.isEmpty then abort;
  if qDogDetail.isEmpty then abort;
  flCardFound := false;
  qDogDetail.First();
  while not qDogDetail.eof do
  begin
    if qDogDetailNp_type.asInteger = 455 then flCardFound := true;
    qDogDetail.Next;
  end;
  if q.FieldByName('Dog_Date').AsDateTime <= StrToDate(Close_Date) then
    raise Exception.Create(TranslateText('�������� � �������� �������!'));
  if not flCardFound then
    raise Exception.Create(TranslateText('������ ������� �� �������� ��������� �� ������� �����-����'));
  if 0<GetSqlValueParSimple('select count(*) from v_card_blank where rn_var_text is not null and dog_id=:dog_id and dog_inst=:dog_inst',
    ['dog_id',qId.AsInteger,
     'dog_inst',qInst.AsInteger])
  then
    raise Exception.Create(TranslateText('���� �������� �� �� ������� �������, ���������� �� ����� ���������� ���� ���!'));
  CardRNPrintForm := TCardRNPrintForm.Create(Application);
  bm := q.GetBookmark();
  try
    with CardRNPrintForm do
    begin
      nbForms.ActivePage := 'CleanCardRn';
      Caption := TranslateText('������ ��������� �� ������� ��������');
      Width := 337;
      sbCBlankAutoClick(nil);
      bbPrint.OnClick := DoRashNak;
      // ��������� �������� ����� �������
      edCBlank.Text := qRn_num.AsString;
      deRnDate.Text := qRn_date.AsString;
      edSer.Text := qDov_ser.AsString;
      edNum.Text := qDov_Num.AsString;
      deDate.Text := qDov_date.AsString;
      edFromWho.Text := qdov_who.AsString;
      ceCardPrice.Value := qDogDetailPrice2.AsFloat;
      ceCardPrice.Enabled := false;
      ShowModal;
      if ModalResult = mrOk then
      begin
        bbSearchClick(nil);
        if q.BookMarkValid(bm) then
        begin
          q.GotoBookmark(bm);
          q.FreeBookmark(bm);
        end;
      end;
      Free;
    end;
  except on E: Exception do
    MessageDlg(E.Message, mtWarning, [mbOk], 0);
  end;
end;
//==============================================================================
procedure TDogRefForm.DoRashNak(Sender: TObject);
var
  RN: TdmRashNakPrint;
begin
  with CardRnPrintForm do
  begin
    if (sbCBlankAuto.Down) and (edCBlank.Text = '') then
      edCBlank.Text := IntToStr(GetSeqNextVal('S_CLEAN_Z_NUM'));
    if deRnDate.Date = 0 then
      raise Exception.Create(TranslateText('�� ��� ��������� ����������'));
    // ������� ��������� ��������� ���������
    RN := TdmRashNakPrint.Create(edCBlank.Text, deRnDate.Date, '', '',
      qFrom_.AsInteger, qFrom_inst.AsInteger, qTo_.AsInteger, qTo_inst.AsInteger, rnCardBlank);
    try
      StartSQL();
      try
        qDogDetail.First;
        while not qDogDetail.Eof do
        begin
          if qDogDetailNp_Type.asInteger = 455 then
            // �������� �������
            RN.AddPosition(
              edSer.Text,
              edNum.Text,
              deDate.Date,
              edFromWho.text,
              qDogDetailNpName.AsString,
              qDogDetailCount_.AsInteger,
              qDogDetailPrice2.AsFloat,
              qDogDetailSUMM_NDS.AsFloat
              );
          qDogDetail.next;
        end;
        // �������� � ����
        RN.SaveBD(qid.AsInteger, qinst.AsInteger, qrn_id.AsInteger, 1);
        CommitSQL();
        ModalResult := mrOk;
      except on E: Exception do
        begin
          RollbackSQL();
          MessageDlg(E.Message, mtWarning, [mbOk], 0);
        end;
      end;
      // ������� �� �����
      RN.PutToExcel(0);
    finally
      RN.Free();
    end;
  end;
end;
//==============================================================================
procedure TDogRefForm.miDogFacilityPredClick(Sender: TObject);
begin
  if q.IsEmpty then Abort;
  qDogDetail.Open;
  qDogDetail.First;
  repeat
    if qDogDetail.FieldByName('NPGRP_ID').AsInteger <> 3 then
    begin
      MessageDlg(TranslateText('�������� ������� ������������ ������ ��� ������ ��.'), mtInformation, [mbOk], 0);
      exit;
    end;
    qDogDetail.Next;
  until qDogDetail.Eof;
  DogRep('DogFacilityPred', dtN, q.FieldByName('Id').Value, q.FieldByName('Inst').Value);
end;
//==============================================================================
procedure TDogRefForm.MakePetrolLinkFile();
var
  f: TextFile;
  sId, sInst: string;
  //****************************************************************************
  function LPad(AStr: string; ALen: Integer; APadCh: Char): string;
  var
    I: Integer;
  begin
    Result := '';
    for I := 1 to ALen - Length(AStr) do
      Result := Result + APadCh;
    Result := Result + AStr;
  end;
  //****************************************************************************
begin
  sId := LPad(qTo_.AsString, 7, '0');
  sInst := LPad(qTo_Inst.AsString, 3, '0');
  try
    AssignFile(f, 'petrol_link.txt');
    Rewrite(f);
    {����� ������}
    if DBObjectExists('ECFIL139','TABLE',AdmSettings.Get('CARD_USER')) then
    begin
      if qTo_Face.AsInteger = 1 then
        Write(f, '3,' + sId + sInst + ',' + Copy(qTo_Name.AsString, 1, 38));
      if qTo_Face.AsInteger = 0 then
        Write(f, '2,' + sId + sInst + ',' + Copy(qTo_Name.AsString, 1, 38));
    end
    else
    {��������� ������}
    begin
      if qTo_Face.AsInteger = 1 then
        Write(f, sId + sInst + ' 3 ' + Copy(qTo_Name.AsString, 1, 38));
      if qTo_Face.AsInteger = 0 then
        Write(f, sId + sInst + ' 2 ' + Copy(qTo_Name.AsString, 1, 38));
    end;
    CloseFile(f);
  except on E: Exception do
    ShowMessage(TranslateText('������ ������ ������ � ������� � ����'));
  end;
end;
//==============================================================================
procedure TDogRefForm.N6Click(Sender: TObject);
begin
  inherited;
  MakePetrolLinkFile();
end;
//==============================================================================
procedure TDogRefForm.sbClearNTypeClick(Sender: TObject);
begin
  if cbNType.Enabled then
    cbNType.ItemIndex := -1;
end;
//==============================================================================
function TDogRefForm.GetDogType: TDogType;
begin
  if rbYes.Checked then
    Result := dtY // ������ �� �������� ���������
  else if rbNo.Checked then
    Result := dtN // ������ �� ������� ���������
  else if rbKart.Checked then
    Result := dtK // ������ �� ��������� ���������
  else if rbVed.Checked then
    Result := dtV // ������ �� ��������� �� ���������
  else if rbService.Checked then
    Result := dtS // ������ �� ��������� �� �������
  else
    raise Exception.Create(TranslateText('��� �������� �� ���������!'));
end;
//==============================================================================
function GetDogType(s: string): TDogType;
begin
  if s = 'Y' then Result := dtY // ������ �� �������� ���������
  else if s = 'N' then Result := dtN // ������ �� ������� ���������
  else if s = 'K' then Result := dtK // ������ �� ��������� ���������
  else if s = 'V' then Result := dtV // ������ �� ��������� �� ���������
  else if s = 'S' then Result := dtS // ������ �� ��������� �� �������
  else raise Exception.Create(TranslateText('��� �������� �� ���������!'));
end;
//==============================================================================
function TestDogLink(AId, AInst: integer; AMsg: string): string;
var
  q: TOilQuery;
begin
  q := TOilQuery.Create(nil);
  try
    q.SQL.Text := 'select * from v_oil_dog_link where dog_id = :dog_id and dog_inst = :dog_inst ';
    _OpenQueryPar(q, ['dog_id', AId, 'dog_inst', AInst]);
    if not q.IsEmpty then Result := Format(AMsg, [q['txt_tip'], q['date_']])
    else Result := '';
  finally
    q.Free;
  end;
end;
//==============================================================================
procedure TDogRefForm.miDopConsentClick(Sender: TObject);
var
  FileName: string;
begin
  if q.IsEmpty then Abort;
  if rbKart.Checked then
    if qSUB_TYPE.Value = 101 then  // ������ �� ��
      FileName := IfThen(qFOREPAY.Value = 1,'DogCardLSPredAdd','DogCardLSPosleAdd')
    else  //��
      raise Exception.Create(TranslateText('�������������� ���������� �� �����-������ �������� �� ����������� �������� �� ��. ������.'));
  if rbYes.Checked then
    FileName := 'DogTAdd';
  if rbService.Checked then
    FileName := 'DogServiceAdd';
  if rbNo.Checked then
    FileName := 'DogPredAdd';
  DogRep(FileName, GetDogType, q.FieldByName('Id').Value, q.FieldByName('Inst').Value, true);
end;

procedure TDogRefForm.miDopSmartCardClick(Sender: TObject);
begin
  DogRep('DogCardBuySmart', GetDogType, q.FieldByName('Id').Value, q.FieldByName('Inst').Value, true, true);
end;
//==============================================================================
function GetDogTypeText(ADogType:TDogType):string;
begin
  case ADogType of
    dtY: Result := 'Y';
    dtN: Result := 'N';
    dtK: Result := 'K';
    dtS: Result := 'S';
    dtV: Result := 'V';
  end;
end;

procedure TDogRefForm.dsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  miKPPosle.Enabled := (qFOREPAY.Value = 0);
  miKPPred.Enabled := (qFOREPAY.Value = 1);
  miDogFacilityPred.Enabled := (qFOREPAY.Value = 1);
  miCardLS.Enabled := (qSUB_TYPE.Value = 101);   // 101 - ˳���� �����
  miCardEC.Enabled := not (qSUB_TYPE.Value = 101);
  miCardPrintLSPred.Enabled := (qFOREPAY.Value = 1); //and (qSUB_TYPE.Value = 101)
  miCardPrintLSPosle.Enabled := (qFOREPAY.Value = 0);  //and (qSUB_TYPE.Value = 101)
  IsBuySmartCard := False;
  if qDogDetail.Active then
    begin
      qDogDetail.First;
      while not (qDogDetail.Eof or IsBuySmartCard) do  // ������ ������ ����� ����� PayFlex`a
        if (qDogDetailNP_TYPE.Value = 455) and (qDogDetailDIM_ID.Value = 19) then
          IsBuySmartCard := True
        else
          qDogDetail.Next;
    end;
  miDopSmartCard.Enabled := IsBuySmartCard;
  miDopConsentLS.Enabled := not IsBuySmartCard;  // ��� �� ������ ��������� - � ������� ���������!
end;

procedure TDogRefForm.miCardRnLsDeleteClick(Sender: TObject);
begin
  inherited;
  if MessageDlg(TranslateText('�� ������� ��� ������ ������� ��?'), mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;
  if q.FieldByName('Dog_Date').AsDateTime <= StrToDate(Close_Date) then
    raise Exception.Create(TranslateText('�������� � �������� �������!'));
  if q.FieldByName('rn_id').IsNull then
    raise Exception.Create(TranslateText('�� �� �������!'));
  try
    StartSQL();
    TdmRashNakPrint.DeleteBD(qId.AsInteger, qInst.AsInteger, 0, 0, 1);
    CommitSQL();
    bbSearchClick(nil);
  except on E: Exception do
    begin
      RollbackSQL();
      MessageDlg(E.Message, mtWarning, [mbOk], 0);
    end;
  end;
end;
//==============================================================================
procedure TDogRefForm.AddDogWithBillClick(Sender: TObject);
// ��������� �������� �� �������
var
  ID, INST: integer;
  Name, Date: string;
begin
  XMLChooseBill(
    eFrom.Tag, lFrom.Tag, // ���������
    eTo.Tag, lTo.Tag,     // ����������
    eFrom.Text, eTo.Text,
    GetDogTypeText(CurrDogType)[1],
    eDate.Date, eToDate.Date,
    ID, INST, Name, Date);
    
  if (ID <> 0) and (INST <> 0) then
  begin
    CreateDogWithBill(ID, INST, CurrDogType);
    bbSearchClick(nil);
  end;
end;
//==============================================================================
// �������� ������ �� �������
procedure CreateDogWithBill(AID, AINST: integer; DogType: TDogType);
var
  qWork: TOilQuery;
  DogCreate: TDogCreate;  
begin
  try
    if (GetSqlValueParSimple('select count(*) from oil_dog where state = ''Y'' and bill_id = :id and bill_inst = :inst',
      ['id', AID, 'inst', AINST]) <> 0) then
    begin
      MessageDlg(TranslateText('�� ���������� ����� ��� ��� ������ �������!'), mtError, [mbOk], 0);
      exit;
    end;

    qWork := TOilQuery.Create(nil);
    qWork.SQL.Text :=
      'select * from v_oil_bill_det where bill_id = :id and bill_inst = :inst and bill_type = :dog_type';
    _OpenQueryPar(qWork, ['id', AID, 'inst', AINST, 'dog_type', GetDogTypeText(DogType)]);

    if qWork.IsEmpty then
    begin
      MessageDlg(TranslateText('�� ������ ����!') +#13#10+
        TranslateText('��������, ���� ����� ������ ��� ��������.'), mtError, [mbOk], 0);
      exit;
    end;
    StartSqlOra;
    try
      DogCreate := TDogCreate.Create;

      if DogType = dtK then
        DogCreate.Dog := qWork['DOC_NUMBER']
      else
        DogCreate.Dog := IntToStr(GetSeqNextVal('S_Oil_Dog_AutoNum'));
        
      DogCreate.DogType := DogType;
      DogCreate.ForePay := true;
      // ��� �������� (dtK - ��������, dtY - ������, dtS - ������, dtV - �������, dtN - ���������)
      case DogType of
        dtY: DogCreate.SubType := null;
        dtN: DogCreate.SubType := 10;
        dtK: DogCreate.SubType := 100;
        dtS: DogCreate.SubType := null;
        dtV: DogCreate.SubType := null;
      end;

      DogCreate.FromId := qWork['FROM_ID'];
      DogCreate.FromInst := qWork['FROM_INST'];

      DogCreate.ToId := qWork['TO_ID'];
      DogCreate.ToInst := qWork['TO_INST'];

      DogCreate.DogDate := Date;
      DogCreate.ExpDate := Date + qWork['VALID_TIME'] - 1;

      DogCreate.BillID := AID;
      DogCreate.BillINST := AINST;

      qWork.First;
      while not qWork.Eof do
      begin
        DogCreate.Add(
          qWork['COUNT_'],
          qWork['PRICE_X_NDS'],
          qWork['PRICE'],
          qWork['SUMM_X_NDS'],
          qWork['SUMM_NDS'],
          decode([DogType, dtS, qWork['OPER_ID'], qWork['NP_ID']]),
          qWork['DIM_ID']);
        qWork.Next;
      end;
      DogCreate.Save(false);
    finally
      FreeAndNil(DogCreate);
    end;
    CommitSqlOra;
    qWork.Free;
  except on E: Exception do
    begin
      RollBackSQL;
      qWork.Free;
      MessageDlg(TranslateText('������ ��� �������� ��������: ')+ E.message, mtError, [mbOk], 0);
    end;
  end;
end;
//==============================================================================
// �������� ������� �� ��������
procedure CreateBillWithDog(AID, AINST: integer; pBillNum: string='');
var
  qWork: TOilQuery;
  BillCreate: TBillCreate;
  DogType: TDogType;
  s: string;
begin
  try
    // ��������� ��� �� ��������
    qWork := TOilQuery.Create(nil);
    qWork.SQL.Text :=
      'select d.*, b.doc_number as bill_dog, b.date_ as bill_date,' +
      '       b.cashed, b.shipped, b.canceled,' +
      '       trunc((sysdate - b.date_create) * 24 * 60) as bill_minute' +
      '  from v_oil_dog_full d, v_oil_bill b' +
      ' where d.dog_id = :id and d.dog_inst = :inst' +
      '   and d.bill_id = b.id(+) and d.bill_inst = b.inst(+)' +
      ' order by d.id';
    _OpenQueryPar(qWork, ['id', AID, 'inst', AINST]);

    if qWork.IsEmpty then
      raise Exception.Create(TranslateText('�� ������ �������!'));

    // ������ ���� ��� �� �������
    s := '';
    if qWork.FieldByName('cashed').AsString = 'Y' then s := '�������';
    if qWork.FieldByName('shipped').AsString = 'Y' then
    begin
      if s <> '' then s := s +', ';
      s := s +'��������';
    end;
    if qWork.FieldByName('canceled').AsString = 'Y' then
    begin
      if s <> '' then s := s +', ';
      s := s +'�����������';
    end;

    // �������, �� ������ �� ��������, ���� �� �
    if not qWork.FieldByName('bill_id').IsNull then
    begin // ������, ��� ��� ������������� �������� ��� ���� ��� ����������
      if not uBill.BillForm.GetBillActive(qWork.FieldByName('bill_minute').AsInteger) then
        if MessageDlgExt(TranslateText('����������� ����� �� �������������� ����� �� ������� ��������!') +#13#10+
          decode([s, '', '', TranslateText('���� ����� ��������� ���������: '+ s +'.') +#13#10]) +
          TranslateText('������������ ������������ ���� � ������� �����?'), mtConfirmation,
          [TranslateText('��'), TranslateText('���')], 1) = 2 then
          raise Exception.Create(TranslateText('�������� �������������!'))
        else
        begin
          _ExecSQL('update oil_dog set bill_id = null, bill_inst = null where id = :id and inst = :inst',
            ['id', AID, 'inst', AINST]);
          // ��������� �������
          DelBill(qWork.FieldByName('bill_id').AsInteger, qWork.FieldByName('bill_inst').AsInteger, 0, 0);
          CreateBillWithDog(AID, AINST, qWork.FieldByName('BILL_DOG').AsString);
          exit;
        end;
    end;

    // ���������� ��� �� �������
    try
      BillCreate := TBillCreate.Create;

      BillCreate.Id := qWork.FieldByName('BILL_ID').AsInteger;
      BillCreate.Inst := qWork.FieldByName('BILL_INST').AsInteger;

      // ����� ������� �� ������� ������������, ���� �� ��� ����
      if pBillNum <> '' then
        BillCreate.BillNum := pBillNum
      else
        if qWork.FieldByName('BILL_DOG').IsNull then
          BillCreate.BillNum := qWork['DOG']
        else BillCreate.BillNum := qWork['BILL_DOG'];

      // ���� �������
      if (qWork.FieldByName('DOG_TYPE').AsString = 'K') and (qWork.FieldByName('SUB_TYPE').AsInteger = 101)
        and (qWork.FieldByName('FOREPAY').AsInteger = 0) then
        BillCreate.Date := GetSystemDate
      else BillCreate.Date := qWork['DOG_DATE'];
      BillCreate.ValidDays := qWork['EXP_DATE'] - qWork['DOG_DATE'] + 1;

      DogType := GetDogType(qWork['DOG_TYPE']);
      BillCreate.BillType := DogType;

      BillCreate.FromId := qWork['FROM_ID'];
      BillCreate.FromInst := qWork['FROM_INST'];

      BillCreate.ToId := qWork['TO_ID'];
      BillCreate.ToInst := qWork['TO_INST'];

      qWork.First;
      while not qWork.Eof do
      begin
        if not qWork.FieldByName('LITR').IsNull then
          BillCreate.Add(
            qWork['LITR'],
            qWork['PRICE_NDS'],
            qWork['PRICE_X_NDS'],
            qWork['SUMM_NDS'],
            qWork['SUMM_X_NDS'],
            decode([DogType, dtS, 0, qWork['NP_TYPE']]),
            qWork['DIM_ID'],
            decode([DogType, dtS, qWork['NP_TYPE'], 0])
          );
        qWork.Next;
      end;

      // �������� �������
      BillCreate.Save(true);
      if qWork.FieldByName('BILL_ID').IsNull then
        _ExecSQL('update oil_dog set bill_id = :bill_id, bill_inst = :bill_inst where id = :id and inst = :inst',
          ['bill_id', BillCreate.Id, 'bill_inst', BillCreate.Inst, 'id', AID, 'inst', AINST]);

      MessageDlg(TranslateText(decode([qWork.FieldByName('BILL_ID').IsNull, true, '������', '��������������']) +
        ' ���� ����� '+ BillCreate.BillNum +' �� '+ DateToStr(BillCreate.Date) +'.'), mtWarning, [mbOk], 0);
    finally
      FreeAndNil(BillCreate);
    end;
    qWork.Free;
  except on E: Exception do
    begin
      qWork.Free;
      raise Exception.Create(TranslateText('������ ��� ��������/�������������� �����: ')+ E.message);
    end;
  end;
end;
//==============================================================================
procedure TDogRefForm.bbOkClick(Sender: TObject);
begin
  if (not q.IsEmpty) and qBILL_ID.IsNull
    and (not (((qSUB_TYPE.AsInteger = 101) and (qFOREPAY.AsInteger = 0)) or (qDOG_TYPE.AsString = 'V'))) then
  begin
    if MessageDlgExt(
      TranslateText('������ ������� �������, ������� �� ����� �����!') +#10#13+
      TranslateText('������� ����?'), mtConfirmation, [TranslateText('��'), TranslateText('������')], 1) = 1 then
    begin
      CreateBillWithDog(qID.AsInteger, qINST.AsInteger);
      inherited;
    end;
  end
  else inherited;
end;
//==============================================================================
procedure DelBill(AID, AINST, ADOG_ID, ADOG_INST: integer); // ��������� �������
var
  qWork: TOilQuery;
begin
  if AID <> 0 then
    _ExecSQL('update oil_bill set cashed = ''N'', shipped = ''N'', canceled = ''Y'' where id = :id and inst = :inst',
      ['id', AID, 'inst', AINST])
  else
  begin
    try
      qWork := TOilQuery.Create(nil);
      qWork.SQL.Text := 'select bill_id, bill_inst from oil_dog where id = :dog_id and inst = :dog_inst';
      _OpenQueryPar(qWork, ['dog_id', ADOG_ID, 'dog_inst', ADOG_INST]);
      // ��������� �������
      if qWork.FieldByName('bill_id').AsInteger <> 0 then
        DelBill(qWork.FieldByName('bill_id').AsInteger, qWork.FieldByName('bill_inst').AsInteger, 0, 0);
    finally
      qWork.Free;
    end;
  end;
end;
//==============================================================================
procedure TDogRefForm.DBGrid1DblClick(Sender: TObject);
begin
  if bbOk.Visible and bbOk.Enabled then bbOkClick(Nil)
  else
    if PEdit.Visible and sbEdit.Enabled then sbEdit.Click;
end;
//==============================================================================

end.
