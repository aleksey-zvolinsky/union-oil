unit uBill;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  EditBase, Db, MemDS, DBAccess, Ora, uOilQuery, StdCtrls, Buttons,
  ExtCtrls, ToolEdit, RXSpin, Mask, Grids, DBGridEh, DBTables, MemTable, Dog, DogRef
  {$IFDEF VER150},Variants, GridsEh{$ENDIF};

type
  EBillCreate = class(Exception);
  TBillCreate = class(TPersistent)
    private
      FId, FInst: integer;
      FBillNum: string;
      FBillType: TDogType;
      FBillTypeText: string;
      FFromId, FFromInst, FToId, FToInst: integer;
      FCashed, FShipped, FCanceled: Boolean;
      FValidDays: extended;
      FDate: TDateTime;
      mtDet: TMemoryTable;
      function GetId: integer;
      function GetInst: integer;
      function GetNum: string;
      procedure SetBillDate(AValue:TDateTime);
      procedure SetBillType(AValue:TDogType);
    public
      constructor Create; overload;
      destructor Destroy; override;
      property Id: integer read GetId write FId;
      property Inst: integer read GetInst write FInst;
      property BillNum: string read GetNum write FBillNum;
      property BillType: TDogType read FBillType write SetBillType;
      property BillTypeText: string read FBillTypeText;
      property FromId: integer read FFromId write FFromId;
      property FromInst: integer read FFromInst write FFromInst;
      property ToId: integer read FToId write FToId;
      property ToInst: integer read FToInst write FToInst;
      property Cashed: boolean read FCashed write FCashed;
      property Shipped: boolean read FShipped write FShipped;
      property Canceled: boolean read FCanceled write FCanceled;
      property ValidDays: extended read FValidDays write FValidDays;
      property Date: TDateTime read FDate write SetBillDate;
         //деталізація рахунку
      procedure Add(ACount, APriceNDS, APriceXNDS, ASummNDS,
        ASummXNDS: Currency; ANpId, ADimId, AOperId: integer);       
      procedure Save(IsEditTime:boolean);
  end;

  TBillForm = class(TEditBaseForm)
    grDetail: TDBGridEh;
    pMain: TPanel;
    deDate_: TDateEdit;
    seValidTime: TRxSpinEdit;
    LblDate_: TLabel;
    Label1: TLabel;
    ceFrom: TComboEdit;
    ceTo: TComboEdit;
    Label2: TLabel;
    Label3: TLabel;
    eFromRS: TEdit;
    eToRS: TEdit;
    eFromNameBank: TEdit;
    eFromMfoBank: TEdit;
    eToNameBank: TEdit;
    eToMfoBank: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    mtDetail: TMemoryTable;
    mtDetailID: TFloatField;
    mtDetailINST: TFloatField;
    mtDetailNP_ID: TFloatField;
    mtDetailDIM_ID: TFloatField;
    mtDetailPRICE: TFloatField;
    mtDetailCOUNT_: TFloatField;
    mtDetailNP_NAME: TStringField;
    mtDetailDIM_NAME: TStringField;
    mtDetailOPER_ID: TIntegerField;
    mtDetailOPER_NAME: TStringField;
    dsDetail: TDataSource;
    Label10: TLabel;
    eDocNumber: TEdit;
    pStates: TPanel;
    cbShipped: TCheckBox;
    cbCashed: TCheckBox;
    cbCanceled: TCheckBox;
    sbAuto: TSpeedButton;
    pMessage: TPanel;
    Label11: TLabel;
    cbBillType: TComboBox;
    qTalonCard: TOilQuery;
    mtDetailPRICE_X_NDS: TFloatField;
    mtDetailSUMM_NDS: TFloatField;
    mtDetailSUMM_X_NDS: TFloatField;
    qWork: TOilQuery;
    procedure ceFromButtonClick(Sender: TObject);
    procedure ceToButtonClick(Sender: TObject);
    procedure ceToChange(Sender: TObject);
    procedure ceFromChange(Sender: TObject);
    procedure mtDetailPRICEChange(Sender: TField);
    procedure grDetailKeyPress(Sender: TObject; var Key: Char);
    procedure grDetailEditButtonClick(Sender: TObject);
    procedure sbAutoClick(Sender: TObject);
    procedure cbCanceledClick(Sender: TObject);
    procedure cbShippedClick(Sender: TObject);
    procedure mtDetailAfterInsert(DataSet: TDataSet);
    procedure cbBillTypeChange(Sender: TObject);
    procedure grDetailGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GetDocNumber(); // отримуємо номер рахунку
    procedure mtDetailPRICE_X_NDSChange(Sender: TField);
    procedure mtDetailCOUNT_Change(Sender: TField);
    procedure mtDetailSUMM_NDSChange(Sender: TField);
    procedure mtDetailSUMM_X_NDSChange(Sender: TField);
  private
    FFromId,FFromInst,//от кого
    FToId,FToInst:integer;//кому
    FFromRekvId,FFromRekvInst,FToRekvId,FToRekvInst:Variant;//реквизиты
    FIsEditTime:boolean;// время редактирования еще не прошло
    bFormActive, bEditSUMM_NDS, bEditSUMM_X_NDS: boolean;
    ChangeFlag, ActDog, ActPrice: Boolean;
    Dog_Num: string;
    Dog_Date: TDate;
    function GetBillEditTime():TDateTime;
    function GetBillType: TDogType;
    procedure CheckTypeID;
    procedure SetIsEditTime(AValue:boolean);
    procedure CalcDetail();
    function TestSumm(): boolean;
  public
    function GetBillActive(d: integer): boolean; // перевірка рахунку на можливість редагування
    procedure PrintReport(AReportNumber:integer); override;
    procedure Save();override;
    procedure Test();override;
    procedure Init();override;
    property BillEditTime:TDateTime read GetBillEditTime;
    property CurrBillType: TDogType read GetBillType;
    property IsEditTime:boolean read FIsEditTime write SetIsEditTime;
  end;

var
  BillForm: TBillForm;

implementation

uses
  ChooseOrg, uDbFunc, ExFunc, Main, MoneyFunc, NPTypeRef, uXmlForm, uCrypt,
  InvoicePrint, uCommonForm, OperTypeRef, OilStd;

const
  ID_WARE = 1;     //тип - "Товар"
  ID_SERVICE = 2;  //тип - "Услуга"

var
  TypeID:  Word = ID_WARE;  //"Товар" - по умолчанию
  BillType: TDogType;  //тип договора
  sMessage: string='';

{$R *.DFM}

procedure TBillForm.CheckTypeID;
begin
  BillType := decode([cbBillType.ItemIndex, 0, dtN,
                                            1, dtY,
                                            2, dtK,
                                            3, dtV,
                                            4, dtS]);
  if BillType = dtS then TypeID := ID_SERVICE
  else TypeID := ID_WARE;

  if BillType = dtK then
  begin
    grDetail.FieldColumns['SUMM_NDS'].Color := clWindow;
    grDetail.FieldColumns['SUMM_X_NDS'].Color := clWindow;
  end
  else
  begin
    grDetail.FieldColumns['SUMM_NDS'].Color := $00D1D1D1;
    grDetail.FieldColumns['SUMM_X_NDS'].Color := $00D1D1D1;
  end;
  grDetail.FieldColumns['SUMM_NDS'].ReadOnly := not (BillType = dtK);
  grDetail.FieldColumns['SUMM_X_NDS'].ReadOnly := not (BillType = dtK);

  grDetail.FieldColumns['NP_NAME'].Visible := (TypeID = ID_WARE);
  grDetail.FieldColumns['OPER_NAME'].Visible := (TypeID = ID_SERVICE);
end;
//==============================================================================
procedure TBillForm.PrintReport(AReportNumber:integer);
var
  Invoice:TdmInvoicePrint;
  fsName: string;
begin
  q.Close;
  _OpenQueryPar(q,
    ['id',ID,
     'inst',INST]);
  qWork.Close;
  qWork.SQL.Text := 'select s.name, d.id, d.inst, dog_type from oil_dog d, oil_share s where s.id(+) = d.share_id and' +
      ' s.state(+) = ''Y'' and d.state = ''Y'' and bill_id = :id and bill_inst = :inst';
  _OpenQueryPar(qWork, ['id', ID, 'inst', INST]);

  Invoice:=TdmInvoicePrint.Create(
    q.FieldByName('doc_number').AsString,
    q.FieldByName('date_').AsString,
    '',
    qWork.FieldByName('name').AsString,
    q.FieldByName('from_id').AsInteger, q.FieldByName('from_inst').AsInteger,
    q.FieldByName('r_from_id').Value, q.FieldByName('r_from_inst').Value,
    q.FieldByName('to_id').AsInteger, q.FieldByName('to_inst').AsInteger,
    q.FieldByName('r_to_id').Value, q.FieldByName('r_to_inst').Value,
    q.FieldByName('valid_time').AsInteger,
    icBill);

  if qWork.FieldByName('dog_type').AsString = 'K' then // по карткам необхідно брати перший договір
    Invoice.DogLink := dlFirstDog
  else Invoice.DogLink := dlCurrentDog;
  Invoice.DogId := qWork.FieldByName('id').AsInteger;
  Invoice.DogInst := qWork.FieldByName('inst').AsInteger;

  try
    Case CurrBillType of
      dtY, dtK:
        begin
          qTalonCard.Close;
          qTalonCard.ParamByName('Bill_Id').Value := q.FieldByName('Bill_Id').Value;
          qTalonCard.ParamByName('Bill_Inst').Value := q.FieldByName('Bill_Inst').Value;
          qTalonCard.Open;
          while not qTalonCard.Eof do
            begin
              Invoice.AddPosition(
                qTalonCard.FieldByName('np_name').AsString,
                qTalonCard.FieldByName('dimname').AsString,
                qTalonCard.FieldByName('price').AsFloat,
                qTalonCard.FieldByName('Price_X_NDS').AsFloat,
                qTalonCard.FieldByName('Summ_NDS').AsFloat,
                qTalonCard.FieldByName('Summ_X_NDS').AsFloat,
                qTalonCard.FieldByName('amount').AsFloat
                ); // повна вставка
              qTalonCard.Next;
            end;
        end
      else
        begin
          q.First;
          while not q.Eof do
            begin
               if ((q.FieldByName('np_id').AsInteger <> 0)
                or (q.FieldByName('np_name').AsString <> '')) then
                   fsName := 'np_name'
               else
                   fsName := 'oper_name';
               Invoice.AddPosition(
                 q.FieldByName(fsName).AsString,
                 q.FieldByName('dim_name').AsString,
                 q.FieldByName('price').AsFloat,
                 q.FieldByName('Price_X_NDS').AsFloat,
                 q.FieldByName('Summ_NDS').AsFloat,
                 q.FieldByName('Summ_X_NDS').AsFloat,
                 q.FieldByName('count_').AsFloat
                 ); // повна вставка
               q.Next;
            end;
          end;
      end;  // Case
    Invoice.PutToExcel(0);
  finally
    Invoice.Free;
  end;
end;
//==============================================================================
procedure TBillForm.Save();
var
  Bill: TBillCreate;
begin
  Bill := TBillCreate.Create;
  try
    Bill.Id := Id;
    Bill.Inst := Inst;
    eDocNumber.Text:=BoolTo_(eDocNumber.Text='',GetSeqNextVal('S_INVOICE_NUM',true),eDocNumber.Text);
    Bill.BillNum := eDocNumber.Text;
    Bill.FromId := FFromId;
    Bill.FromInst := FFromInst;
    Bill.ToId := FToId;
    Bill.ToInst := FToInst;
    Bill.Cashed := cbCashed.Checked;
    Bill.Shipped := cbShipped.Checked;
    Bill.Canceled := cbCanceled.Checked;
    Bill.ValidDays := seValidTime.Value;
    Bill.Date := deDate_.date;
    Bill.BillType := BillType;

    mtDetail.First;
    repeat
      Bill.Add(
        mtDetailCOUNT_.AsFloat,
        mtDetailPRICE.AsCurrency,
        mtDetailPRICE_X_NDS.AsCurrency,
        mtDetailSUMM_NDS.AsCurrency,
        mtDetailSUMM_X_NDS.AsCurrency,
        mtDetailNP_ID.AsInteger,
        mtDetailDIM_ID.AsInteger,
        mtDetailOPER_ID.AsInteger
        );
      mtDetail.Next;
    until mtDetail.Eof;
    Bill.Save(IsEditTime);
  finally
    Bill.Free;
  end;
end;
//==============================================================================
procedure TBillForm.Test();
begin
  if (eDocNumber.Text='') and (not sbAuto.Down) then
    raise Exception.Create(TranslateText('Не определен номер документа!')+#10#13
      +TranslateText('Введите номер, либо нажмите кнопку "АВТО" для автоматического подбора номера!'));
  if seValidTime.Value<1 then
    raise Exception.Create(TranslateText('Не определено время действительности!'));
  if ceFrom.Text='' then
    raise Exception.Create(TranslateText('Не определена организация "От кого"!'));
  if ceTo.Text='' then
    raise Exception.Create(TranslateText('Не определена организация "Кому"!'));
  if mtDetail.IsEmpty then
    raise Exception.Create(TranslateText('Не определена табличная часть!'));
  mtDetail.DisableControls;
  // активність ціни
  ActPrice := false;
  if mtDetail.Active then
  begin
    mtDetail.DisableControls;
    mtDetail.First;
    while not mtDetail.Eof do
    begin
      if mtDetailPRICE.Value <> 0 then
      begin
        ActPrice := true;
        break;
      end;
      mtDetail.Next;
    end;
    mtDetail.First;
    mtDetail.EnableControls;
  end;

  try
    mtDetail.First;
    while not mtDetail.Eof do
    begin
      if (TypeID = ID_WARE) and
         (mtDetailNP_ID.IsNull or (mtDetailNP_ID.Value=0) or (mtDetailNP_NAME.Text='')) then
           raise Exception.Create(TranslateText('Не определен товар!'));
      if (TypeID = ID_SERVICE) and
         (mtDetailOPER_ID.IsNull or (mtDetailOPER_ID.Value=0) or (mtDetailOPER_NAME.Text='')) then
           raise Exception.Create(TranslateText('Не определен вид услуги!'));
      if(mtDetailDIM_ID.IsNull or (mtDetailDIM_ID.Value=0) or (mtDetailDIM_NAME.Text=''))then
      begin
        //raise Exception.Create('Не определена еденица измерения!');
        mtDetail.Edit;
        mtDetailDIM_ID.AsInteger:=28;
        mtDetailDIM_NAME.Text:=LangText('Litr');
      end;
      if (mtDetailPRICE.IsNull or (mtDetailPRICE.Value = 0)) and not ((BillType = dtK) and not ActPrice) then
        raise Exception.Create(TranslateText('Не определена цена!'));
      if(mtDetailCOUNT_.IsNull or (mtDetailCOUNT_.Value=0))then
        raise Exception.Create(TranslateText('Не определено количество!'));  
      if (mtDetailSUMM_NDS.IsNull or (mtDetailSUMM_NDS.Value = 0)) then
        raise Exception.Create(TranslateText('Не определена стоимость!'));
      if not (mtDetailPRICE.IsNull or (mtDetailPRICE.Value = 0)) and not TestSumm() then
        raise Exception.Create(TranslateText('Не верная стоимость!'));
      mtDetail.Next;
    end;
  finally
    mtDetail.EnableControls;
  end;
end;
//==============================================================================
procedure TBillForm.Init();
var
  Time:TDateTime;
begin
  inherited Init;
  if ID=0 then
  begin
    deDate_.Date:=Date();
    FFromId:=INST;
    FFromInst:=INST;
    ceFrom.Text:=GetOrgName(INST,INST);
    mtDetail.Active:=False;
    mtDetail.EmptyTable;
    mtDetail.Active:=True;
    IsEditTime:=True;
    sbAuto.Down:=True;
    cbBillType.Enabled := True;  //разрешаем изменение типа договора
    cbBillType.ItemIndex := 0;   //тип договора = dtN (обычный)
  end
  else
  begin
    FillIntegers(q,
      [@FFromId,@FFromInst,
       @FToId,@FToInst],
      ['from_id','from_inst',
       'to_id','to_inst']
      );
    FillVariants(q,
      [@FFromRekvId,@FFromRekvInst,
       @FToRekvId,@FToRekvInst],
      ['r_from_id','r_from_inst',
       'r_to_id','r_to_inst']);
    FillControls(q,
      [deDate_,eDocNumber,seValidTime,
       ceFrom, eFromRS, eFromNameBank, eFromMfoBank,
       ceTo, eToRS, eToNameBank, eToMfoBank],
      ['date_','doc_number','valid_time',
       'from_name','from_rach_chet','from_bank_name','from_mfo',
       'to_name','to_rach_chet','to_bank_name','to_mfo']
      );
    cbBillType.Enabled := False;  //запрещаем изменение типа договора
    cbCashed.Checked:=q['cashed']='Y';
    cbShipped.Checked:=q['shipped']='Y';
    cbCanceled.Checked:=q['canceled']='Y';
    sbAuto.Down:=q.FieldByName('doc_number').AsString='';
    CopyToMemoryTable(q,mtDetail,
      'ID,INST,NP_ID,NP_NAME,OPER_ID,OPER_NAME,DIM_ID,DIM_NAME,PRICE,PRICE_X_NDS,COUNT_,SUMM_NDS,SUMM_X_NDS');

    BillType := decode([q['bill_type'], 'Y', dtY,    //аналіз типу договору
                                        'K', dtK,    //по полю [bill_type]
                                        'V', dtV,
                                        'S', dtS,
                                             dtN]);  //якщо в [bill_type] 'N' або пусто

    cbBillType.ItemIndex := decode([BillType, dtN, 0,
                                              dtY, 1,
                                              dtK, 2,
                                              dtV, 3,
                                              dtS, 4]);
    //Редактировать можно только в течени <BillEditTime> минут
    if self.BillEditTime<>-1 then
    begin
      Time:= GetSystemDate-q.FieldByName('date_create').AsDateTime;
      IsEditTime:= (self.BillEditTime>Time);
    end
    else
      IsEditTime:=True;
    bbOk.Enabled:= bbOk.Enabled and (INST = MAIN_ORG.INST);
    bbOk.Enabled := bbOk.Enabled and  (deDate_.Date > StrToDate(CLOSE_DATE));
  end;

  CheckTypeID;  //проверка на тип продажи
  sbAuto.Click;
  cbCanceledClick(cbCanceled);
  cbShippedClick(cbShipped);
end;
//==============================================================================
function TBillForm.GetBillEditTime():TDateTime;
const
  DEFAULT_TIME=30; // по умолчанию 30 минут
var
  str:string;
  i,Hour, Min:integer;
begin
  try
    Min:=0; Hour:=0;
    str:=GetVal(ReadOilVar('BILL_EDIT_TIME'));
    // если значения нет, то ставим по умолчанию
    if trim(str)='' then
      Min:=DEFAULT_TIME
    else//иначе дешифровуем
      str:=Decrypt( crtVersionKey,[ str ] );
    // Проверяем, что полученый текст это "число"
    for i:=0 to length(str)-1 do
      if not(str[i] in ['0','1','2','3','4','5','6','7','8','9']) then
        Min:=DEFAULT_TIME;
    //Проверки пройдены - преобразовуем 
    if Min=0 then
      Min:=StrToInt(str);
    // Смотрим... есть ли знак отключения...
    if Min=-1 then
      Result:=-1 //возврат "-1" - параметр отключения
    else// Выдаем нужное значение
    begin
      if Min>59 then//если значение,больше 59, то нужно разложить на часы
      begin
        Hour:=Min div 60;
        Min:=Min mod 60;
      end;
      result:=EncodeTime(Hour, Min, 0, 0);
    end;
  except on e:exception do
    begin
      result:=EncodeTime(0, DEFAULT_TIME, 0, 0);;
      ShowMessage('GetBillEditTime: '+e.message);
    end;
  end;
end;
//==============================================================================
procedure TBillForm.SetIsEditTime(AValue:boolean);
var
  Hour,Min,Sec,Msec:Word;
begin
  FIsEditTime:=AValue;
  //eDocNumber.Enabled:=AValue;
  ceFrom.Enabled:=AValue;
  seValidTime.Enabled:=AValue;
  ceTo.Enabled:=AValue;
  deDate_.Enabled:=AValue;
  grDetail.ReadOnly := not AValue;  //запрет на редактирование в grDetail
  grDetail.FieldColumns['NP_NAME'].ButtonStyle := BoolTo_(AValue, cbsEllipsis, cbsNone);
  grDetail.FieldColumns['OPER_NAME'].ButtonStyle := BoolTo_(AValue, cbsEllipsis, cbsNone);
  grDetail.FieldColumns['DIM_NAME'].ButtonStyle := BoolTo_(AValue, cbsEllipsis, cbsNone);
  if sMessage = '' then
    sMessage := 'Счет заблокирован для редактирования, после %d минут';
  pMessage.Caption := sMessage;
  if pos('%d',pMessage.Caption)>0 then
  begin
    DecodeTime(BillEditTime,Hour,Min,Sec,Msec);
    if Hour>0 then
      Min:=Min+(Hour*60);
    pMessage.Caption:=Format(pMessage.Caption,[Min]);
  end;
  pMessage.Visible:=not AValue;
end;
//==============================================================================
procedure TBillForm.ceFromButtonClick(Sender: TObject);
var
  strName:string;
begin
  if CaptureOrg(1, MAIN_ID, INST, 'yyyr', FFromId, FFromInst, strName) then
    ceFrom.Text := strName;
end;
//==============================================================================
procedure TBillForm.ceToButtonClick(Sender: TObject);
var
  strName:string;
begin
  if CaptureOrg(3, MAIN_ID, INST, 'yyyr', FToId, FToInst, strName) then
    ceTo.Text := strName;
end;
//==============================================================================
procedure TBillForm.ceToChange(Sender: TObject);
var
  strRekvId, strRekvInst,
  strNameBank, strChetRach, strMfoBank:string;
begin
  GetOrgRekvizit( FToId, FToInst, strRekvId, strRekvInst, strNameBank, strChetRach, strMfoBank );
  FToRekvId:=BoolTo_(strRekvId='',Null,strRekvId);;
  FToRekvInst:=BoolTo_(strRekvInst='',Null,strRekvInst);;
  eToRS.Text:=strChetRach;
  eToNameBank.Text:=strNameBank;
  eToMfoBank.Text:=strMfoBank;
  GetDocNumber();
end;
//==============================================================================
procedure TBillForm.ceFromChange(Sender: TObject);
var
  strRekvId, strRekvInst,
  strNameBank, strChetRach, strMfoBank:string;
begin
  GetOrgRekvizit( FFromId, FFromInst, strRekvId, strRekvInst, strNameBank, strChetRach, strMfoBank );
  FFromRekvId:=BoolTo_(strRekvId='',Null,strRekvId);
  FFromRekvInst:=BoolTo_(strRekvInst='',Null,strRekvInst);
  eFromRS.Text:=strChetRach;
  eFromNameBank.Text:=strNameBank;
  eFromMfoBank.Text:=strMfoBank;
end;
//==============================================================================
procedure TBillForm.grDetailKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = '.')or(Key = ',') then
    Key := DecimalSeparator;
end;

procedure TBillForm.grDetailEditButtonClick(Sender: TObject);
var
  OperTypeRefForm : TOperTypeRefForm;
  iId:Integer;
  strName:string;
begin
  if grDetail.SelectedField.FieldName = 'DIM_NAME' then
    if XMLChoose('dimref',iId,strName) then
    begin
      mtDetail.Edit;
      mtDetailDIM_ID.AsInteger:=iId;
      mtDetailDIM_NAME.AsString:=strName;
    end;
  if grDetail.SelectedField.FieldName = 'NP_NAME' then
    Begin
      Application.CreateForm(TNPTypeRefForm, NPTypeRefForm);
      try
        NPTypeRefForm.ShowModal;
        if NPTypeRefForm.ModalResult = mrOk then
          begin
            mtDetail.Edit;
            mtDetailNP_ID.AsInteger := NPTypeRefForm.qID.AsInteger;
            mtDetailNP_NAME.AsString := NPTypeRefForm.qNAME.AsString;
          end;
      finally
        NPTypeRefForm.Free;
      end;
    End;
  if grDetail.SelectedField.FieldName = 'OPER_NAME' then
    Begin
      Application.CreateForm(TOperTypeRefForm, OperTypeRefForm);
      OperTypeRefForm.SGrpId := 12;
      OperTypeRefForm.bbClear.Enabled := False;
      try
        OperTypeRefForm.ShowModal;
        If OperTypeRefForm.ModalResult = mrOk Then
          begin
            mtDetail.Edit;
            mtDetailOPER_ID.AsInteger := OperTypeRefForm.qId.AsInteger;
            mtDetailOPER_NAME.AsString := OperTypeRefForm.qName.AsString;
          end;
      finally
        OperTypeRefForm.Free;
      end;
    End;
end;

procedure TBillForm.sbAutoClick(Sender: TObject);
begin
  if sbAuto.Down then
  begin
    eDocNumber.Clear;
    eDocNumber.ReadOnly:=true;
    eDocNumber.Color:=clBtnFace;
    eDocNumber.Hint:=TranslateText('Будет выбран следующий номер по порядку');
    eDocNumber.ShowHint:=true;
  end
  else
  begin
    eDocNumber.ReadOnly:=false;
    eDocNumber.Color:=clWindow;
    eDocNumber.Hint:='';
    eDocNumber.ShowHint:=false;
  end;
end;

procedure TBillForm.cbCanceledClick(Sender: TObject);
begin
  inherited;
  if ActDog and cbCanceled.Checked then
  begin
    MessageDlg(TranslateText('Удалите сначала договор '+ Dog_Num +' от '+ DateToStr(Dog_Date)), mtWarning, [mbOk], 0);
    cbCanceled.Checked := false;
    exit;
  end;
  cbCashed.Enabled:=not cbCanceled.Checked;
  cbShipped.Enabled:=not cbCanceled.Checked;
end;

procedure TBillForm.cbShippedClick(Sender: TObject);
begin
  inherited;
  cbCanceled.Enabled:=not(cbCashed.Checked or cbShipped.Checked)
end;

procedure TBillForm.mtDetailAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cbBillType.Enabled := False;
end;

procedure TBillForm.cbBillTypeChange(Sender: TObject);
begin
  CheckTypeID;
  GetDocNumber();
end;

function TBillForm.GetBillType: TDogType;
begin
  case q.FieldByName('Bill_Type').AsString[1] of
    'Y': Result := dtY;
    'K': Result := dtK;
    'V': Result := dtV;
    'S': Result := dtS
  else
    Result := dtN;
  end;
end;
//==============================================================================
procedure TBillForm.grDetailGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if Column.FieldName = 'SUMM_NDS' then
    if not TestSumm() then
    begin
      AFont.Color := clRed;
      AFont.Style := [fsBold];
    end;
end;
//==============================================================================
procedure TBillForm.FormCreate(Sender: TObject);
begin
  inherited;
  bFormActive := false;
end;
//==============================================================================
procedure TBillForm.FormShow(Sender: TObject);
begin
  inherited;
  bEditSUMM_NDS := false;
  bEditSUMM_X_NDS := false;
  bFormActive := true;
  ChangeFlag := False;
  qWork.Close;
  qWork.SQL.Text := 'select dog, dog_date from oil_dog where state = ''Y'' and bill_id = :id and bill_inst = :inst';
  _OpenQueryPar(qWork, ['id', ID, 'inst', INST]);
  ActDog := not qWork.IsEmpty;
  Dog_Num := qWork.FieldByName('dog').AsString;
  Dog_Date := qWork.FieldByName('dog_date').AsDateTime;
  if ActDog then
  try
    sMessage := 'Согласно этого счёта создан договор '+ Dog_Num +' от '+ DateToStr(Dog_Date);
    SetIsEditTime(false);
  finally
    sMessage := '';
  end;
end;
//==============================================================================
procedure TBillForm.CalcDetail();
begin
  if not bFormActive then exit;
  if cbBillType.ItemIndex in [0, 4] then
  begin
    mtDetail.FieldByName('SUMM_X_NDS').AsFloat :=
      Mround(mtDetail.FieldByName('PRICE_X_NDS').AsFloat * mtDetail.FieldByName('Count_').AsFloat, 2);
    mtDetail.FieldByName('SUMM_NDS').AsFloat :=
      MRound(mtDetail.FieldByName('PRICE_X_NDS').AsFloat * mtDetail.FieldByName('Count_').AsFloat, 2) +
      MRound(mtDetail.FieldByName('PRICE_X_NDS').AsFloat * TAX_RATE(deDate_.Date) *
      mtDetail.FieldByName('Count_').asFloat, 2);
  end
  else
  begin
    mtDetail.FieldByName('SUMM_X_NDS').AsFloat :=
      MRound(
        MRound(mtDetail.FieldByName('Price').AsFloat * mtDetail.FieldByName('Count_').AsFloat, 2) -
        MRound(mtDetail.FieldByName('Price').AsFloat * TAX_RATE(deDate_.Date)/(1+TAX_RATE(deDate_.Date))*
        mtDetail.FieldByName('Count_').AsFloat, 2), 2);
    mtDetail.FieldByName('SUMM_NDS').AsFloat :=
      MRound(mtDetail.FieldByName('Price').AsFloat * mtDetail.FieldByName('Count_').AsFloat, 2);
  end;
end;
//==============================================================================
function TBillForm.TestSumm(): boolean;
begin
  result := false;
  if cbBillType.ItemIndex in [0, 4] then
  begin
    if MRound(mtDetail.FieldByName('SUMM_NDS').AsFloat, 2) =
      MRound(
        MRound(mtDetail.FieldByName('PRICE_X_NDS').AsFloat * mtDetail.FieldByName('Count_').AsFloat, 2) +
        MRound(mtDetail.FieldByName('PRICE_X_NDS').AsFloat * TAX_RATE(deDate_.Date) *
        mtDetail.FieldByName('Count_').asFloat, 2), 2) then
      result := true;
  end
  else
  begin
    if MRound(mtDetail.FieldByName('SUMM_NDS').AsFloat, 2) =
      MRound(mtDetail.FieldByName('Price').AsFloat * mtDetail.FieldByName('Count_').AsFloat, 2) then
      result := true;
  end;
end;
//==============================================================================
procedure TBillForm.mtDetailPRICE_X_NDSChange(Sender: TField);
begin
  if not bFormActive then exit;
  if not ChangeFlag then
  begin
    ChangeFlag := True;
    mtDetail.FieldByName('PRICE').AsFloat :=
      MRound(GetWithNDS_NoNDS(mtDetail.FieldByName('PRICE_X_NDS').AsFloat, deDate_.Date), 2);
    CalcDetail();
    ChangeFlag := False;
  end;
end;
//==============================================================================
procedure TBillForm.mtDetailPRICEChange(Sender: TField);
begin
  if not bFormActive then exit;
  if not ChangeFlag then
  begin
    ChangeFlag := True;
    if cbBillType.ItemIndex in [1, 2] then // Y (талони), K (картки)
      mtDetail.FieldByName('PRICE_X_NDS').AsFloat :=
        MRound(GetNoNDS_WithNDS(mtDetail.FieldByName('PRICE').AsFloat, deDate_.Date), 6)
    else
      mtDetail.FieldByName('PRICE_X_NDS').AsFloat :=
        MRound(GetNoNDS_WithNDS(mtDetail.FieldByName('PRICE').AsFloat, deDate_.Date), 4);
    CalcDetail();
    ChangeFlag := False;
  end;
end;
//==============================================================================
procedure TBillForm.mtDetailCOUNT_Change(Sender: TField);
begin
  CalcDetail();
end;
//==============================================================================
procedure TBillForm.mtDetailSUMM_NDSChange(Sender: TField);
begin
  if not bFormActive then exit;
  if bEditSUMM_X_NDS then exit;
  bEditSUMM_NDS := true;
  mtDetail.FieldByName('SUMM_X_NDS').AsFloat :=
    GetNoNDS_WithNDS(mtDetail.FieldByName('SUMM_NDS').AsFloat, deDate_.Date, 2);
  bEditSUMM_NDS := false;
end;
//==============================================================================
procedure TBillForm.mtDetailSUMM_X_NDSChange(Sender: TField);
begin
  if not bFormActive then exit;
  if bEditSUMM_NDS then exit;
  bEditSUMM_X_NDS := true;
  mtDetail.FieldByName('SUMM_NDS').AsFloat :=
    GetWithNDS_NoNDS(mtDetail.FieldByName('SUMM_X_NDS').AsFloat, deDate_.Date, 2);
  bEditSUMM_X_NDS := false;
end;
//==============================================================================
procedure TBillForm.GetDocNumber();
begin
  if (BILL_NUM_FOR_CARD = 'Y') and (cbBillType.ItemIndex = 2) and (FToId <> 0) and (FToInst <> 0) then
  begin
    eDocNumber.Text :=
      nvl(GetSqlValueParSimple('select dog from oil_dog where dog_type = ''K'' ' +
        'and state = ''Y'' and to_ = :to_id and to_inst = :to_inst and (dog_date, id) in ' +
        '(select max(dog_date), max(id) from oil_dog where dog_type = ''K'' '+
        'and state = ''Y'' and to_ = :to_id and to_inst = :to_inst)',
        ['to_id', FToId, 'to_inst', FToInst]), '');
    sbAuto.Down := false;
    sbAutoClick(nil);
  end;
end;
//==============================================================================
function TBillForm.GetBillActive(d: integer): boolean; // перевірка рахунку на можливість редагування
var
  s: string;
  EditTime: integer;
begin
  result := false;
  // знаходимо час допустимий для редагування рахунку
  s := GetVal(ReadOilVar('BILL_EDIT_TIME'));
  if s = '' then EditTime := 30
  else EditTime := StrToInt(Decrypt(crtVersionKey, [s]));

  if d - EditTime < 0 then result := true;
end;
//==============================================================================
//====================--------------TBillCreate-----------------================
//==============================================================================
constructor TBillCreate.Create;
var
  q: TOilQuery;
begin
  inherited Create;
  mtDet := TMemoryTable.Create(nil);
  q := TOilQuery.Create(nil);
  try
    q.SQL.Text := 'select * from oil_bill_det where rowid=null';
    q.Open;
    mtDet.CopyStructure(q);
  finally
    q.Free;
  end;
  mtDet.EmptyTable;
  mtDet.Open;
  FId := 0;
  FInst := 0;
  FBillNum := '';
  FBillType := dtN;
  FBillTypeText := 'N';
  FFromId := 0;
  FFromInst := 0;
  FToId := 0;
  FToInst := 0;
  FCashed := False;
  FShipped := False;
  FCanceled := False;
  FValidDays := 1;
  FDate := 0;
end;
//------------------------------------------------------------------------------
destructor TBillCreate.Destroy;
begin
  inherited Destroy;
  FreeAndNil(mtDet);
end;
//------------------------------------------------------------------------------
function TBillCreate.GetId: integer;
begin
  If FId = 0 then
    FId := GetSeqNextVal('s_oil_bill');
  Result := FId;
end;
//------------------------------------------------------------------------------
function TBillCreate.GetInst: integer;
begin
  If FInst = 0 then
    FInst := MAIN_ID;
  Result := FInst;
end;
//------------------------------------------------------------------------------
function TBillCreate.GetNum: string;
begin
  If FBillNum = '' then
    FBillNum := IntToStr(FId);
  Result := FBillNum;
end;
//------------------------------------------------------------------------------
procedure TBillCreate.SetBillType(AValue:TDogType);
begin
  if AValue = dtNull then
    AValue := dtN;
  FBillType := AValue;
  FBillTypeText := GetDogTypeText(AValue);
end;
//------------------------------------------------------------------------------
procedure TBillCreate.SetBillDate(AValue:TDateTime);
begin
  If AValue = 0 then
    EBillCreate.Create(TranslateText('Не определена дата документа !'));
  FDate := Trunc(AValue);
end;
//------------------------------------------------------------------------------
procedure TBillCreate.Add(ACount, APriceNDS, APriceXNDS, ASummNDS,
        ASummXNDS: Currency; ANpId, ADimId, AOperId: integer);
begin
  try
    mtDet.Append;
    if APriceXNds = 0 then APriceXNds := GetNoNDS_WithNDS(APriceNds, FDate);
    if APriceNds = 0 then APriceNds := GetWithNDS_NoNDS(APriceXNds, FDate);
    if APriceNds = 0 then
      begin
        if ASummXNds = 0 then ASummXNds := GetNoNDS_WithNDS(ASummNds, FDate, 2);
        if ASummNds = 0 then ASummNds := GetWithNDS_NoNDS(ASummXNds, FDate, 2);
      end
    else
      begin
        if (FBillType = dtN) or (FBillType = dtS) then
          begin
            if ASummXNds = 0 then ASummXNds := Mround(APriceXNds * ACount, 2);
            if ASummNds = 0 then ASummNds := MRound(APriceXNds * ACount, 2) + MRound(APriceXNds * TAX_RATE(FDate) * ACount, 2);
          end
        else
          begin
            if ASummXNds = 0 then ASummXNds := Fround(APriceNds * ACount, 2) -
                 FRound(APriceNds * TAX_RATE(FDate)/(1+TAX_RATE(FDate)) * ACount, 2);
            if ASummNds = 0 then ASummNds := FRound(APriceNds * ACount, 2);
          end;
      end;
    mtDet['NP_ID']       := ANpId;
    mtDet['DIM_ID']      := ADimId;
    mtDet['PRICE']       := APriceNDS;
    mtDet['PRICE_X_NDS'] := APriceXNDS;
    mtDet['COUNT_']      := ACount;
    mtDet['OPER_ID']     := AOperId;
    mtDet['SUMM_NDS']    := ASummNDS;
    mtDet['SUMM_X_NDS']  := ASummXNDS;
    mtDet.Post;
  except on E:Exception do
    raise EBillCreate.Create('Bill.Add: ' + E.Message);
  end;
end;
//------------------------------------------------------------------------------
procedure TBillCreate.Save(IsEditTime:boolean);
var
  RToId, RToInst, RFromId, RFromInst, s: string;
  iDetId: integer;
begin
  if IsEditTime then
    begin
      GetOrgRekvizit(FToId, FToInst, RToId, RToInst, s,s,s);
      GetOrgRekvizit(FFromId, FFromInst, RFromId, RFromInst, s,s,s);
      DBSaver.SaveRecord('OIL_BILL',
         ['ID',          Id,
          'INST',        Inst,
          'STATE',       'Y',
          'DOC_NUMBER',  BillNum,
          'FROM_ID',     FromId,
          'FROM_INST',   FromInst,
          'R_FROM_ID',   BoolTo_(RFromId='',null,RFromId),
          'R_FROM_INST', BoolTo_(RFromInst='',null,RFromInst),
          'TO_ID',       ToId,
          'TO_INST',     ToInst,
          'R_TO_ID',     BoolTo_(RToId='',null,RToId),
          'R_TO_INST',   BoolTo_(RToInst='',null,RToInst),
          'CASHED',      BoolTo_(Cashed,'Y','N'),
          'SHIPPED',     BoolTo_(Shipped,'Y','N'),
          'CANCELED',    BoolTo_(Canceled,'Y','N'),
          'VALID_TIME',  ValidDays,
          'DATE_CREATE', GetSystemDate,
          'DATE_',       Date,
          'BILL_TYPE',   BillTypeText]);
      _ExecSql('update oil_bill_det set state=''N'' where bill_id=:bill_id and bill_inst=:bill_inst ',
         ['bill_id',Id,
          'bill_inst',Inst]);
      mtDet.First;
      repeat
        iDetId := nvl(GetSqlValueParSimple('select min(id) from oil_bill_det where state=''N'' and bill_id=:bill_id and bill_inst=:bill_inst ',
                                  ['bill_id',Id,
                                   'bill_inst',Inst]),0);
        DBSaver.SaveRecord('OIL_BILL_DET',
           ['ID',          iDetId,
            'INST',        Inst,
            'STATE',       'Y',
            'BILL_ID',     Id,
            'BILL_INST',   Inst,
            'NP_ID',       decode([mtDet['NP_ID'],0,null,mtDet['NP_ID']]),
            'DIM_ID',      mtDet['DIM_ID'],
            'PRICE',       mtDet['PRICE'],
            'COUNT_',      mtDet['COUNT_'],
            'OPER_ID',     decode([mtDet['OPER_ID'],0,null,mtDet['OPER_ID']]),
            'SUMM_NDS',    mtDet['SUMM_NDS'],
            'SUMM_X_NDS',  mtDet['SUMM_X_NDS'],
            'PRICE_X_NDS', mtDet['PRICE_X_NDS']]);
        mtDet.Next;
      until mtDet.Eof;
    end
  else  //if IsEditTime
    DBSaver.SaveRecord('OIL_BILL',
       ['ID',          Id,
        'INST',        Inst,
        'DOC_NUMBER',  BillNum,
        'CASHED',      BoolTo_(Cashed,'Y','N'),
        'SHIPPED',     BoolTo_(Shipped,'Y','N'),
        'CANCELED',    BoolTo_(Canceled,'Y','N')]);
end;
//==============================================================================
//==============================================================================
//==============================================================================

end.
