  unit uCardBlank;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  EditBase, Db, MemDS, DBAccess, Ora, uOilQuery, StdCtrls, Buttons,
  ExtCtrls, Grids, DBGridEh, ToolEdit, Mask, DBTables, MemTable, Menus,
  ActnList, CurrEdit{$IFDEF VER150},Variants, RXCtrls, ComCtrls, ToolWin{$ENDIF};

type
  TEditCardBlankMode = (emNull,emIn,emOut);
  TTestHistory = (thNoErrors, thErrors, thBetter, thBadly);
  TSetTestHistory = set of TTestHistory;
  TSequence = class
    private
      FVal:integer;
    public
      procedure Reset;
      function NextVal: integer;
      property CurrVal: integer read FVal;
  end;

type
  TCardBlankForm = class(TEditBaseForm)
    DBGrid: TDBGridEh;
    dsDetail: TDataSource;
    mtDetail: TMemoryTable;
    mtDetailID: TIntegerField;
    mtDetailINST: TIntegerField;
    mtDetailCARD_NUMBER: TIntegerField;
    mtDetailPRICE: TFloatField;
    pTop: TPanel;
    eDocNumber: TEdit;
    LblNumber: TLabel;
    sbAuto: TSpeedButton;
    LblDate_: TLabel;
    deDate_: TDateEdit;
    ceFrom: TComboEdit;
    LblFrom: TLabel;
    LblTo: TLabel;
    ceTo: TComboEdit;
    ceOper: TComboEdit;
    ceDog: TComboEdit;
    deDogDate: TDateEdit;
    LblDogDate: TLabel;
    LblOper: TLabel;
    LblDog: TLabel;
    pmOper: TPopupMenu;
    miIn: TMenuItem;
    miOut: TMenuItem;
    mtCopy: TMemoryTable;
    mtDetailLOCAL_ID: TIntegerField;
    ActionList: TActionList;
    actDeleteRecord: TAction;
    mtDetailPURSE: TStringField;
    mtDetailPURSE_IDS: TStringField;
    mtCopyID: TIntegerField;
    mtCopyINST: TIntegerField;
    mtCopyCARD_NUMBER: TIntegerField;
    mtCopyPRICE: TFloatField;
    mtCopyLOCAL_ID: TIntegerField;
    mtCopyPURSE: TStringField;
    mtCopyPURSE_IDS: TStringField;
    qPurse: TOilQuery;
    actAddCard: TAction;
    qTestDog: TOilQuery;
    ceBlankPrice: TCurrencyEdit;
    Label2: TLabel;
    gbTaxBill: TGroupBox;
    IsNN: TCheckBox;
    eNNNumber: TEdit;
    Label3: TLabel;
    ceNNSum: TCurrencyEdit;
    Label1: TLabel;
    deNNDate: TDateEdit;
    LblNNNumber: TLabel;
    qHistory: TOilQuery;
    pmAdd: TPopupMenu;
    miPlus1: TMenuItem;
    miAddAll: TMenuItem;
    miAddList: TMenuItem;
    ToolBar: TToolBar;
    tbAdd: TToolButton;
    tbDelete: TToolButton;
    qClientCards: TOilQuery;
    actAddCardsAll: TAction;
    actAddCardsList: TAction;
    procedure ceDogButtonClick(Sender: TObject);
    procedure ceFromButtonClick(Sender: TObject);
    procedure ceToButtonClick(Sender: TObject);
    procedure ceOperButtonClick(Sender: TObject);
    procedure miInClick(Sender: TObject);
    procedure miOutClick(Sender: TObject);
    procedure DBGridColumns2EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure mtDetailBeforePost(DataSet: TDataSet);
    procedure sbAutoClick(Sender: TObject);
    procedure mtDetailAfterPost(DataSet: TDataSet);
    procedure actDeleteRecordExecute(Sender: TObject);
    procedure mtDetailBeforeDelete(DataSet: TDataSet);
    procedure mtDetailAfterDelete(DataSet: TDataSet);
    (** Присваивает вид действия *)
    procedure AfterAction(DataSet: TDataSet);
    procedure actAddCardExecute(Sender: TObject);
    procedure ceOperChange(Sender: TObject);
    procedure ceDogChange(Sender: TObject);
    procedure mtDetailBeforeInsert(DataSet: TDataSet);
    procedure deDate_Change(Sender: TObject);
    procedure DBGridExit(Sender: TObject);
    procedure actAddCardsAllExecute(Sender: TObject);
    procedure actAddCardsListExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FEditMode:TEditCardBlankMode;
    FFromOrgFlags,FToOrgFlags:string;//флаги для выбора организаций
    FFromId,FFromInst,//от кого
    FToId,FToInst,//кому
    FOperId:integer;//операция
    FDogId,FDogInst,//договор
    FTaxBillId,FTaxBillInst:Variant;//НН
    FDate:TDateTime;
    Sequence:TSequence;
    mtDetailState:TDataSetState;
    InInit:boolean;
    procedure GetPurse(AId,AInst:integer;var ANameList,AIdList:string);
    (** Проверки на ввод карт в форму *)
    function TestCard(ACardNumber:integer;APrice:Currency;AOperId:integer;
      ADate:TDateTime;ARaise:boolean=true):string;
    (** Выбор операции пользователем *)
    procedure SelectOper(AEditMode:TEditCardBlankMode);
    (** property EditMode *)
    function GetEditMode():TEditCardBlankMode;
    procedure SetEditMode(AValue:TEditCardBlankMode);
    procedure ClearDog;
    function IsInsideOper:boolean;
    function TestDeleteOne(ACardNumber:integer):TSetTestHistory;

  public
    procedure Save();override;
    procedure Test();override;
    procedure Init();override;
    procedure PrintReport(AReportNumber:integer); override;
    procedure Test4Delete; override;
    property EditMode:TEditCardBlankMode read GetEditMode write SetEditMode;
    class function TestInsertOne(
      ACardNumber,
      AInOut,
      AOperId:integer;
      ADate:TDateTime):boolean;    
  end;

var
  CardBlankForm: TCardBlankForm;
  MSG_DEL_HISTORY_BADLY, MSG_DEL_HISTORY_BETTER: string;
(** Логические проверки движение карты относительно текущей операции *)
function TestCardMotion(AId,AInst,ACardNumber:integer;APrice:Currency;AOperId:integer;
  AEditMode:TEditCardBlankMode;ADate:TDateTime;ARaise:boolean=true):string;
(** Механические/быстрые проверки номера карты *)
function TestCardNumber(ACardNumber:integer; ADate:TDateTime; ARaise:boolean=true):string;
(** Процедурки местного использования *)
function GetOperGroupId(AEditMode:TEditCardBlankMode):integer;
function GetEditMode(AOperGroupId:integer):TEditCardBlankMode;

implementation

uses
  ChooseOrg, uDbFunc, ExFunc, Main, uCommonForm, OperTypeRef, DogRef, UXMLForm,
  ListSelect, RashNakPrint, CardRNPrint, TaxBillPrint, MoneyFunc;
const
  OPER_EMISSION=254; // Эмиссия бланков
  OPER_SALE=255; // Продажа бланков

  COL_CARD=0;
  //COL_PRICE=1;
  COL_PURSE=1;

  MSG_ONLY_MY_ORG='При такой операции в поле "Кому" нужно выбирать либо свою, либо дочерную организацию!';
{$R *.DFM}

//==============================================================================
//---------------------------Функции написаные руками---------------------------
//==============================================================================
//---------------------------------TSequence------------------------------------
procedure TSequence.Reset;
begin
  FVal:=0;
end;
//------------------------------------------------------------------------------
function TSequence.NextVal:integer;
begin
  inc(FVal);
  result:=FVal;
end;
//---------------------------------TSequence------------------------------------
//==============================================================================
function TestCardMotion(AId,AInst,ACardNumber:integer;APrice:Currency;AOperId:integer;
  AEditMode:TEditCardBlankMode;ADate:TDateTime;ARaise:boolean=true):string;
var
  InEmission:boolean;
  In_Out:integer;
begin
  try
    InEmission:=0<>GetSqlValueParSimple('select count(*) from v_card_blank_full where oper_id=254 and card_number=:card_number'
      +' and not(head_id=:id and head_inst=:inst) ',
      ['card_number',ACardNumber,
       'id',AId,
       'inst',AInst]);
    if (AOperId=OPER_EMISSION) and InEmission then
      raise Exception.Create(Format(TranslateText('Бланк %d уже внесен в эмиссию!'),[ACardNumber]))
    else if (AOperId<>OPER_EMISSION) and not InEmission then
      raise Exception.Create(Format(TranslateText('Бланк %d не был внесен в эмиссию!'),[ACardNumber]));

    In_Out:=nvl(GetSqlValueParSimple('select decode(oper_id,254,0,avg(in_out)) '
      +'  from (select row_number() over(partition by card_number order by date_ desc) rn,'
      +'               f.* '
      +'          from v_card_blank_full f'
      +'         where card_number = :card_number '
      +'           and date_<=:date_ '
      +'           and not(head_id=:id and head_inst=:inst) )'
      +' where rn = 1'
      +' group by oper_id',
      ['card_number',ACardNumber,
       'date_',ADate,
       'id',AId,
       'inst',AInst]),0);
    if AOperId<>OPER_EMISSION then
    begin
      if (In_Out = -1) and (AEditMode=emOut) then
        raise Exception.Create(TranslateText('Перед отпуском бланка должен быть приход и нельзя бланки отпускать в день прихода!'));
      if (In_Out = 1) and (AEditMode=emIn) then
        raise Exception.Create(TranslateText('Перед приходом бланка должен быть отпуск!'));
    end;
  except on e:Exception do
  begin
    if ARaise then
      raise Exception.Create(e.Message)
    else
      result:=e.Message;
  end;
  end;
end;
//==============================================================================
function TestCardNumber(ACardNumber:integer; ADate:TDateTime; ARaise:boolean=true):string;
var
  strNumber:string;
begin
  try
    strNumber:=IntToStr(ACardNumber);
    if Length(strNumber)<>9 then
      raise Exception.Create(TranslateText('Не правильная длина номера!'));

    if 0=GetSqlValueParSimple('select decode(Card.GetObl(:card_number,:date_),:obl_id,1,0) from dual',
      ['card_number',strNumber,
       'date_', ADate,
       'obl_id',BoolTo_(Main.MAIN_TYPE=3,Main.MAIN_PAR,Main.MAIN_ID)])
    then
      raise Exception.Create(TranslateText('Карта не пренадлежит данному эмитенту!'));
  except on e:Exception do
  begin
    if ARaise then
      raise Exception.Create(e.Message)
    else
      result:=e.Message;
  end;
  end;
end;
//==============================================================================
function GetOperGroupId(AEditMode:TEditCardBlankMode):integer;
begin
  case AEditMode of
    emIn: result:=17;
    emOut: result:=18;
  else
    raise Exception.Create(TranslateText('Ошибка GetOperGroupId: Не указан тип режима!'));
  end;
end;
//------------------------------------------------------------------------------
function GetEditMode(AOperGroupId:integer):TEditCardBlankMode;
begin
  case AOperGroupId of
    17: result:=emIn;
    18: result:=emOut;
  else
    raise Exception.Create(TranslateText('Ошибка GetEditMode: Не указан тип группы операций!'));
  end;
end;
//==============================================================================
procedure TCardBlankForm.Save();
var
  DetId, InOut, i:integer;
  Seq:string;
  Sl:TStringList;
  TaxBill:TdmTaxBill;
  PossibleSum:Currency;
begin
  if (FTaxBillId<>Null)and (FTaxBillInst<>Null)and (not IsNN.Checked) then
    if MessageDlg(Format(TranslateText('Будет удалена налоговая накладная №%s на сумму %s'),[eNNNumber.Text,ceNNSum.Text]),mtConfirmation,[mbOk,mbCancel],0)=mrCancel then
      raise Exception.Create(TranslateText('Отменено пользователем!'));

  //создание НН
  if IsNN.Checked then
  begin
    TaxBill:=TdmTaxBill.Create;
    TaxBill.Options.FromId:=FFromId;
    TaxBill.Options.FromInst:=FFromInst;
    TaxBill.Options.ToId:=FToId;
    TaxBill.Options.ToInst:=FToInst;
    TaxBill.Options.Date:=deDate_.Text;
    TaxBill.Options.Num:=eNNNumber.Text;
    TaxBill.Options.ByDogName:=Format(TranslateText('Согластно отпуску бланков %s от %s по договору %s от %s'),
      [eDocNumber.Text, deDate_.Text,
       ceDog.Text, deDogDate.Text]);
    TaxBill.Options.TaxBillId:=nvl(FTaxBillId,0);
    TaxBill.Options.TaxBillInst:=nvl(FTaxBillInst,0);
    TaxBill.Options.OIL_NN_Cause:=24;
    TaxBill.Options.OIL_NN_Type:=2;
    TaxBill.Options.Locked:=Lock;
    TaxBill.Options.TovarType:=ttNpType;
    if eNNNumber.Text<>'' then
      TaxBill.DeleteSBRecordsDet(FTaxBillId,FTaxBillInst);
    TaxBill.AddPosition(
      455, // смарт-карта
      19, // штука
      deDate_.Text,
      mtDetail.RecordCount,
      ceBlankPrice.Value);
    TaxBill.Options.DogId:=FDogId;
    TaxBill.Options.DogInst:=FDogInst;
    try
      TaxBill.TestByDog(PossibleSum);
    except
      on E:ETBTestDogSum do
        begin
          if mrYes=MessageDlg(e.message+#10#13
            +TranslateText('Создать налоговую на остаток по договору?'),
            mtConfirmation,
            [mbYes,mbNo],0)
          then
          begin
            TaxBill.EmptyMtValues;
            TaxBill.AddPosition(
              455, // смарт-карта
              19, // штука
              deDate_.Text,
              FRound(PossibleSum/ceBlankPrice.Value,2),
              ceBlankPrice.Value,
              PossibleSum);
          end;
        end;
      on E:ETBTestDog do
        begin
          IsNN.Checked:=False;
          raise;
        end;
      on E:Exception do
        raise Exception.Create(TranslateText('Обратитесь к разработчикам!')+#10#13+e.message);
    end;
  end;

  case EditMode of
    emOut:
    begin
      InOut:=-1;
      Seq:='S_CARD_BLANK_NUM_IN';
    end;
     emIn:
    begin
      InOut:=1;
      Seq:='S_CARD_BLANK_NUM_OUT';
    end;
  else
    InOut:=0
  end;

  if eDocNumber.Text='' then
    eDocNumber.Text:=IntToStr(GetSeqNextVal(Seq,true));
  DbSaver.ExecSql('update CARD_BLANK set state=''N'' where id=:id and inst=:inst and state=''Y'' ',
    ['id',ID,
     'inst',INST]);
  ID:=DBSaver.SaveRecord('CARD_BLANK',
    ['id',ID,
     'inst',INST,
     'state','Y',
     'in_out',InOut,
     'numb',eDocNumber.Text,
     'from_id',FFromId,
     'from_inst',FFromInst,
     'to_id',FToId,
     'to_inst',FToInst,
     'date_',deDate_.date,
     'dog_id',FDogId,
     'dog_inst',FDogInst,
     'oper_id',FOperId
     ]);
  mtDetail.First;
  while not mtDetail.Eof do
  begin
    DetId:=DbSaver.SaveRecord('CARD_BLANK_DET',
      ['id',0,//GetFreeId('CARD_BLANK_DET'),
       'inst',INST,
       'state','Y',
       'head_id',ID,
       'head_inst',INST,
       'card_number',mtDetailCARD_NUMBER.AsInteger,
       'price',BoolTo_(ceBlankPrice.Value=0,null,ceBlankPrice.Value)]);
    if not mtDetailPURSE_IDS.IsNull then
    begin
      Str2StringList(mtDetailPURSE_IDS.AsString,Sl);
      try
        for i:=0 to SL.Count-1 do
        begin
          DbSaver.SaveRecord('CARD_BLANK_DET_PURSE',
            ['id',0,//GetFreeId('CARD_BLANK_DET_PURSE'),
             'inst',INST,
             'state','Y',
             'head_id',DetId,
             'head_inst',INST,
             'np_group_id',Sl[i]]);
        end;
      finally
        FreeAndNil(SL);
      end;
    end;
    mtDetail.Next;
  end;
  //создание НН
  if IsNN.Checked then
  begin
    TaxBill.Make();
    FTaxBillId:=TaxBill.Options.TaxBillId;
    FTaxBillInst:=TaxBill.Options.TaxBillInst;
    eNNNumber.Text:=TaxBill.Options.Num;
    deNNDate.Text:=TaxBill.Options.Date;
    TaxBill.Free;
    DbSaver.ExecSql('update CARD_BLANK set nn_id=:nn_id, nn_inst=:nn_inst where id=:id and inst=:inst ',
      ['id',ID,
       'inst',INST,
       'nn_id',FTaxBillId,
       'nn_inst',FTaxBillInst]);
  end
  else if (FTaxBillId<>Null)and (FTaxBillInst<>Null)then
  begin
    TaxBill:= TdmTaxBill.Create;
    try
      TaxBill.DeleteSBRecords10(FTaxBillId, FTaxBillInst);
      DbSaver.ExecSql('update CARD_BLANK set nn_id=:nn_id, nn_inst=:nn_inst where id=:id and inst=:inst ',
        ['id',ID,
         'inst',INST,
         'nn_id',null,
         'nn_inst',null]);
    finally
      TaxBill.Free;
    end;
    MessageDlg(TranslateText('Удалена налоговая накладная номер ')+eNNNumber.Text,mtInformation,[mbOk],0);
  end;
end;
//==============================================================================
procedure TCardBlankForm.Test();
begin
  if deDate_.Date <= StrToDate(CLOSE_DATE) then
    raise Exception.Create(TranslateText('Данный период закрыт !'));
  if(deDogDate.Date > deDate_.Date)then
    raise Exception.Create(TranslateText('Договор является первичным документом,' + #13
      +'дата отпуска не должна быть меньше даты из договора !'));
  if (eDocNumber.Text='') and (not sbAuto.Down) then
    raise Exception.Create(TranslateText('Не определен номер документа!')+#10#13
      +TranslateText('Введите номер, либо нажмите кнопку "АВТО" для автоматического подбора номера!'));
  if ceFrom.Text='' then
    raise Exception.Create(TranslateText('Не определена организация "От кого"!'));
  if ceTo.Text='' then
    raise Exception.Create(TranslateText('Не определена организация "Кому"!'));
  if ceOper.Text='' then
    raise Exception.Create(TranslateText('Не определена операция!'));
  if mtDetail.IsEmpty then
    raise Exception.Create(TranslateText('Не определена табличная часть!'));
  mtDetail.DisableControls;
  try
    mtDetail.First;
    while not mtDetail.Eof do
    begin
      if(mtDetailCARD_NUMBER.IsNull or (mtDetailCARD_NUMBER.Value=0))then
        raise Exception.Create(TranslateText('Не определен номер карты!'));
      TestCardNumber( mtDetailCARD_NUMBER.AsInteger, deDate_.Date);
      TestCard( mtDetailCARD_NUMBER.AsInteger, mtDetailPRICE.AsCurrency, FOperId, deDate_.Date);
      TestCardMotion( ID,INST, mtDetailCARD_NUMBER.AsInteger, mtDetailPRICE.AsCurrency, FOperId,FEditMode, deDate_.Date);
      {if(mtDetailPURSE.Text='')then
        raise Exception.Create(TranslateText('Не определены кошельки!'));}
      mtDetail.Next;
    end;
  finally
    mtDetail.EnableControls;
  end;
end;
//==============================================================================
procedure TCardBlankForm.Init();
var
  PurseList,PurseIdList:string;
begin
  inherited Init;
  Sequence:=TSequence.Create;
  Sequence.Reset;
  mtCopy.Active:=False;
  mtCopy.EmptyTable;
  mtCopy.Active:=True;
  if pos('IN',UpperCase(PARENT_NAME))>0 then
  begin
    ceOper.Tag:=1;
    gbTaxBill.Visible:=False;
    Self.Caption:=TranslateText('Приход бланков смарт-карт');
    EditMode:=emIn;
    FFromOrgFlags:='yyy';
    FToOrgFlags:='yyx';
    actAddCardsList.Visible := False;
    actAddCardsAll.Visible := False;    
  end
  else if pos('OUT',UpperCase(PARENT_NAME))>0 then
  begin
    ceOper.Tag:=-1;
    Self.Caption:=TranslateText('Отпуск бланков смарт-карт');
    EditMode:=emOut;
    FFromOrgFlags:='yyx';
    FToOrgFlags:='yyy';
  end
  else
    raise Exception.Create(TranslateText('Не правильно определена родительская форма!'));

  if ID=0 then
  begin
    ClearDog;
    deDate_.Date:=Date();
    FDate:=deDate_.Date;
    case EditMode of
      emOut:
      begin
        FOperId := OPER_SALE;
        ceOper.Text := GetSqlValue('select name from v_oil_oper_type where id='+ IntToStr(OPER_SALE));
        FFromId:=INST;
        FFromInst:=INST;
        FToId:=0;
        FToInst:=0;
        ceFrom.Text:=GetOrgName(INST,INST);
      end;
      emIn:
      begin
        FOperId:=0;
        FFromId:=0;
        FFromInst:=0;
        FToId:=INST;
        FToInst:=INST;
        ceTo.Text:=GetOrgName(INST,INST);
      end;
    end;

    mtDetail.Active:=False;
    mtDetail.EmptyTable;
    mtDetail.Active:=True;
    sbAuto.Down:=True;
    FTaxBillId:=null;
    FTaxBillInst:=null;
  end
  else
  begin
    q.Close;
    _OpenQueryPar(q,
      ['id',ID,
       'inst',INST]);
    FillIntegers(q,
      [@FFromId,@FFromInst,
       @FToId,@FToInst,
       @FOperId],
      ['from_id','from_inst',
       'to_id','to_inst',
       'oper_id']
      );
    FillVariants(q,
     [@FDogId,@FDogInst,
      @FTaxBillId,@FTaxBillInst],
     ['dog_id','dog_inst',
      'nn_id','nn_inst']);
    FillControls(q,
      [deDate_, eDocNumber,
       ceFrom, ceTo,
       ceOper,
       ceDog, deDogDate,
       eNNNumber, deNNDate, ceNNSum],
      ['date_','numb',
       'from_name', 'to_name',
       'oper_name',
       'dog', 'dog_date',
       'nn_number', 'nn_date', 'nn_sum']
      );
    FDate:=deDate_.Date;
    IsNN.Checked:=eNNNumber.Text<>'';
    case q.FieldByName('in_out').AsInteger of
      -1:
        EditMode:=emOut;
       1:
        EditMode:=emIn;
    end;
    miIn.Visible:=EditMode=emIn;
    miOut.Visible:=EditMode=emOut;
    sbAuto.Down:=q.FieldByName('numb').AsString='';
    InInit:=True;
    CopyToMemoryTable(q,mtDetail,'ID,INST,CARD_NUMBER,PRICE');
    InInit:=False;
    // Теперь нужно вытянуть кошельки
    mtDetail.First;
    while (not mtDetail.Eof)and (OPER_EMISSION<>FOperId) do
    begin
      Self.GetPurse(mtDetailID.AsInteger,mtDetailINST.AsInteger, PurseList,PurseIdList);
      if PurseList<>'' then
      begin
        mtDetail.Edit;
        mtDetailPURSE.AsString:=PurseList;
        mtDetailPURSE_IDS.AsString:=PurseIdList;
      end;
      mtDetail.Next;
    end;
    bbOk.Enabled:= bbOk.Enabled and (INST = MAIN_ORG.INST);
    bbOk.Enabled := bbOk.Enabled and  (deDate_.Date > StrToDate(CLOSE_DATE));

  end;
  sbAutoClick(sbAuto);
end;
//==============================================================================
procedure TCardBlankForm.PrintReport(AReportNumber:integer);
var
  RN: TdmRashNakPrint;
  CardRNPrint: TCardRNPrintForm;
  GoodName:string;
  IsCanSave:boolean;
begin
  q.Close;
  q.FetchAll:=True;
  _OpenQueryPar(q,
    ['id',ID,
     'inst',INST]);
  IsCanSave:=MAIN_ORG.INST=INST;
  case AReportNumber of
    0:
    begin
      if (not IsCanSave)and(q.FieldByName('rn_id').IsNull)then
        raise Exception.Create(TranslateText('Расходная не создана! Расходную нужно распечатать в подразделении, где создан отпуск!'));
      CardRNPrint := TCardRNPrintForm.Create(Application);
      try
        CardRNPrint.nbForms.ActivePage := 'CleanCardRn';
        CardRNPrint.Caption := TranslateText('Печать расходной на покупку карточек');
        CardRNPrint.Width := 337;
        CardRNPrint.sbCBlankAutoClick(nil);
        CardRNPrint.bbPrint.OnClick := nil;
        CardRNPrint.bbPrint.ModalResult:=mrOk;
        // заполнить элементы формы данными
        CardRNPrint.edCBlank.Text := q.FieldByName('rn_var_text').AsString;
        CardRNPrint.sbRnAuto.Down := CardRNPrint.edCBlank.Text='';
        CardRNPrint.edCBlank.Text := BoolTo_(CardRNPrint.edCBlank.Text='',q.FieldByName('numb').AsString,CardRNPrint.edCBlank.Text );
        CardRNPrint.deRnDate.Text := q.FieldByName('rn_var_date').AsString;
        CardRNPrint.edSer.Text := q.FieldByName('rn_dov_ser').AsString;
        CardRNPrint.edNum.Text := q.FieldByName('rn_dov_num').AsString;
        CardRNPrint.deDate.Text := q.FieldByName('rn_dov_date').AsString;
        CardRNPrint.edFromWho.Text := q.FieldByName('rn_dov_who').AsString;
        CardRNPrint.ceCardPrice.Value := q.FieldByName('price').AsFloat;
        CardRNPrint.ceCardPrice.Enabled := false;
        CardRNPrint.ShowModal;
        if CardRNPrint.ModalResult = mrOk then
        begin
          GoodName:=GetSqlValue('select name from v_oil_np_type where id = 455');
          RN := TdmRashNakPrint.Create(CardRNPrint.edCBlank.Text, CardRNPrint.deRnDate.Date, '', '',
            q.FieldByName('from_inst').AsInteger, q.FieldByName('from_inst').AsInteger,
            q.FieldByName('to_id').AsInteger, q.FieldByName('to_inst').AsInteger, rnCardBlank);
          try
            if IsCanSave then
              DBSaver.StartTransaction;
            try
              RN.AddPosition(
                CardRNPrint.edSer.Text,
                CardRNPrint.edNum.Text,
                CardRNPrint.deDate.Date,
                CardRNPrint.edFromWho.text,
                GoodName,
                q.RecordCount,
                q.FieldByName('price').AsCurrency,
                q.FieldByName('summ_nds').AsCurrency
                );
              // записать в базу
              if IsCanSave then
                RN.SaveBD(ID, INST, q.FieldByName('rn_id').AsInteger, 4);
              if IsCanSave then
                DBSaver.Commit;
              ModalResult := mrOk;
            except on E: Exception do
              begin
                DBSaver.Rollback;
                MessageDlg(E.Message, mtWarning, [mbOk], 0);
              end;
            end;
            // вывести на экран
            RN.PutToExcel(0);
          finally
            RN.Free();
          end;
        end; // if ModalResult = mrOk then
      finally
        CardRNPrint.Free;
      end;
    end;
    1:
      TdmTaxBill.Print(
        q.FieldByName('nn_id').AsInteger,
        q.FieldByName('nn_inst').AsInteger);
    2:
      if (not q.FieldByName('rn_id').IsNull) and (MAIN_ORG.INST=q.FieldByName('rn_inst').AsInteger) then
        TdmRashNakPrint.DeleteBD(ID,INST,q.FieldByName('rn_id').AsInteger,q.FieldByName('rn_inst').AsInteger,4);
    else
      raise Exception.CreateFmt(TranslateText('Печатный отчет №%d не определен программой!'),[AReportNumber]);
  end;
  q.Close;
end;
//==============================================================================
procedure TCardBlankForm.Test4Delete;
var
  res:TSetTestHistory;
begin
  if 0<GetSqlValueParSimple('select count(*) from v_card_request where blank_id=:blank_id and blank_inst=:blank_inst',
    ['blank_id',ID,
     'blank_inst',INST])
  then
    raise Exception.Create(TranslateText('Нельзя удалить отпуск бланков на который ссылается заявка на пополнение смарт-карт!'));

  q.Close;
  _OpenQueryPar(q,
    ['id',ID,
     'inst',INST]);
  q.First;
  while not q.Eof do
  begin
    res := TestDeleteOne(q.FieldByName('card_number').AsInteger);
    if thBadly in res then
      raise Exception.CreateFmt(MSG_DEL_HISTORY_BADLY,[q.FieldByName('card_number').AsString]);
    if (thBetter in res) and (thErrors in res) then
      MessageDlg(Format(MSG_DEL_HISTORY_BETTER,[q.FieldByName('card_number').AsString]),
        mtInformation,[mbOK],0);
    q.Next;
  end;
end;
//==============================================================================

//==============================================================================
procedure TCardBlankForm.GetPurse(AId,AInst:integer;var ANameList,AIdList:string);
begin
  qPurse.Close;
  _OpenQueryPar(qPurse,
    ['id',AId,
     'inst',AInst]);
  qPurse.First;
  ANameList:='';AIdList:='';
  while not qPurse.Eof do
  begin
    ANameList:=ANameList+'"'+qPurse.FieldByName('np_group_name').AsString+'",';
    AIdList:=AIdList+qPurse.FieldByName('np_group_id').AsString+',';
    qPurse.Next;
  end;
  if ANameList<>'' then
  begin
    ANameList:=copy(ANameList,1,length(ANameList)-1);
    AIdList:=copy(AIdList,1,length(AIdList)-1);
  end;
end;
//==============================================================================
function TCardBlankForm.TestCard(ACardNumber:integer;APrice:Currency;AOperId:integer;
  ADate:TDateTime;ARaise:boolean=true):string;
begin
  try
    if (AOperId=OPER_SALE)and(FDogId=null)and(FDogInst=null) then
      raise Exception.Create(TranslateText('Необходимо выбрать договор!'));
    mtCopy.First;
    while not mtCopy.Eof do
    begin
      (*if (APrice<>0)and(APrice<>mtCopy.FieldByName('Price').AsCurrency)then
        raise Exception.Create(TranslateText('Цена на все карты должна быть одинаковой!'));*)

      if (mtCopy.FieldByName('card_number').AsInteger=ACardNumber) and (mtDetail['LOCAL_ID']<>mtCopy['LOCAL_ID']) then
        raise Exception.Create(TranslateText('Карта с таким номером уже введена!'));

      mtCopy.Next;
    end;

    if(FDogId<>null)and(FDogInst<>null)then
    begin
      qTestDog.Close;
      _OpenQueryPar(qTestDog,
        ['dog_id',FDogId,
         'dog_inst',FDogInst,
         'id',ID,
         'inst',INST]);
      if qTestDog.FieldByName('blank_count').AsInteger+mtCopy.RecordCount>qTestDog.FieldByName('dog_count').AsInteger then
        raise Exception.Create(TranslateText('Количество бланков по отпускам превышает количество бланков по договору!'));
    end;

  except on e:exception do
  begin
    if ARaise then
      raise Exception.Create(e.Message)
    else
      result:=e.Message;
  end;
  end;
end;
//==============================================================================
procedure TCardBlankForm.SelectOper(AEditMode:TEditCardBlankMode);
// Выбор типа операции
var
  OperTypeRefForm : TOperTypeRefForm;
begin
  Application.CreateForm(TOperTypeRefForm, OperTypeRefForm);
  try
    OperTypeRefForm.SGrpId := GetOperGroupId(AEditMode);
    OperTypeRefForm.ShowModal;
    if OperTypeRefForm.ModalResult = mrOk Then
    begin
      FOperId := OperTypeRefForm.qId.AsInteger;    
      ceOper.Text := OperTypeRefForm.qName.AsString;
      EditMode := uCardBlank.GetEditMode( OperTypeRefForm.SGrpId );
    end;
  finally
    OperTypeRefForm.Free;
  end;
end;
//==============================================================================
function TCardBlankForm.GetEditMode():TEditCardBlankMode;
begin
  if FEditMode=emNull then
    raise Exception.Create(TranslateText('Режим редактирования не определен! Необходимо выбрать операцию!'))
  else
    result:=FEditMode;
end;
//------------------------------------------------------------------------------
procedure TCardBlankForm.SetEditMode(AValue:TEditCardBlankMode);
begin
  //eDog.Enabled:=AValue=emOut;
  FEditMode:=AValue;
end;
//==============================================================================
procedure TCardBlankForm.ClearDog;
begin
  FDogId:=null;
  FDogInst:=null;
  ceBlankPrice.Value:=0;
  ceDog.Text:='';
  deDogDate.Date:=0;
end;
//==============================================================================
function TCardBlankForm.IsInsideOper:boolean;
  function InArray(AValue:Variant;AArray:array of Variant):boolean;
  var
    i:integer;
  begin
    Result:=False;
    for i:=low(AArray) to high(AArray) do
    begin
      if AValue=AArray[i] then
      begin
        Result:=True;
        Break;
      end;
    end;
  end;
begin
  result:=InArray(FOperId,[258,257,256,253,267]);
end;
//==============================================================================
function TCardBlankForm.TestDeleteOne(ACardNumber:integer):TSetTestHistory;
var
  resPrev, resCurr: integer;
  function GetRecordCount(AId,AInst:integer):integer;
  begin
    qHistory.Close;
    _OpenQueryPar(qHistory,
      ['card_number',ACardNumber,
       'id',AId,
       'inst',AInst,
       'test',0]);
    qHistory.Filtered := False;
    qHistory.Filter := 'is_error=1';
    qHistory.Filtered := True;
    result := qHistory.RecordCount;
  end;
begin
  Result := [];
  resPrev := GetRecordCount(-1,-1);
  resCurr := GetRecordCount(ID,INST);
  if resPrev > resCurr then
    Result := Result+[thBetter]
  else if resPrev < resCurr then
    Result := Result+[thBadly];
  if resCurr = 0 then
    Result := Result+[thNoErrors]
  else
    Result := Result+[thErrors];
end;
//==============================================================================
class function TCardBlankForm.TestInsertOne(
  ACardNumber,
  AInOut,
  AOperId:integer;
  ADate:TDateTime):boolean;
var
  CardBlank:TCardBlankForm;
begin
  CardBlank:=TCardBlankForm.Create(nil);
  try
    with CardBlank do
    begin
      qHistory.Close;
      _OpenQueryPar(qHistory,
        ['card_number',ACardNumber,
         'id',-1,
         'inst',-1,
         'test',1,
         'test_in_out',AInOut,
         'test_date',ADate,
         'oper_id',AOperId]);
      qHistory.Filtered:=False;
      qHistory.Filter:='is_error=1';
      qHistory.Filtered:=True;
      result:= qHistory.RecordCount=0;
    end;
  finally
    CardBlank.Free;
  end;
end;
//==============================================================================
//-------------------------Дальше пошла обработка событий-----------------------
//==============================================================================
procedure TCardBlankForm.ceDogButtonClick(Sender: TObject);
var
  DogId,DogInst,ToId,ToInst,FromId,FromInst:integer;
  Dog:string;
  DogDate:TDateTime;
begin
  if EditMode=emOut then
    if ChooseDog(dtK,Dog,DogDate,DogId,DogInst,ToId,ToInst,FromId,FromInst,455)then
    begin
      if 0=GetSqlValueParSimple('select count(*) from v_oil_dog_full dd '
        +' where dd.np_type=455 and dog_id=:id and dog_inst=:inst ',
        ['id',DogId,
         'inst',DogInst])
      then
        raise Exception.CreateFmt(TranslateText('В договоре должен быть указаны бланки смарт-карт!(%s)'),[GetSqlValue('select name from v_oil_np_type where id = 455')]);
      FDogId:=DogId;
      FDogInst:=DogInst;
      FToId:=ToId;
      FToInst:=ToInst;
      FFromId:=FromId;
      FFromInst:=FromInst;        
      ceDog.Text:=Dog;
      deDogDate.Date:=DogDate;
      ceTo.Text:=GetOrgName(FToId,FToInst);
      ceFrom.Text:=GetOrgName(FFromId,FFromInst);
    end;
end;

procedure TCardBlankForm.ceFromButtonClick(Sender: TObject);
var
  strName:string;
begin
  if CaptureOrg(BoolTo_( EditMode=emOut,1,4 ), MAIN_ID, INST, FFromOrgFlags, FFromId, FFromInst, strName) then
    ceFrom.Text := strName;
end;

procedure TCardBlankForm.ceToButtonClick(Sender: TObject);
var
  strName:string;
  ToId, ToInst:integer;
begin
  if CaptureOrg(BoolTo_( FOperId<>OPER_SALE,1,4), MAIN_ID, INST, FToOrgFlags, ToId, ToInst, strName) then
  begin
    if IsInsideOper and ((ToInst<>ToId) or not IsMyOrg(INST,FToInst)) then
        raise Exception.Create(TranslateText(MSG_ONLY_MY_ORG));
    if (FDogId<>null) and (FDogInst<>null) then
      if not((ToId=FToId) and (ToInst=FToInst)) then
        if MessageDlg(TranslateText('Клиент в договоре не соответствует выбраному убрать договор?'),mtConfirmation,[mbYes,mbNo],0)<>mrYes then
          exit
        else
          ClearDog;
    ceTo.Text := strName;
    FToId:=ToId;
    FToInst:=ToInst;
  end;
end;

procedure TCardBlankForm.ceOperButtonClick(Sender: TObject);
begin
  //ceOper.PopupMenu.Popup(self.Left+ceOper.Left+ceOper.Width, self.Top+ceOper.Top+ceOper.Height);
  case ceOper.Tag of
     1: self.SelectOper(emIn);
    -1: self.SelectOper(emOut);
  end;
end;

procedure TCardBlankForm.miInClick(Sender: TObject);
begin
  inherited;
  self.SelectOper(emIn);
end;

procedure TCardBlankForm.miOutClick(Sender: TObject);
begin
  inherited;
  self.SelectOper(emOut);
end;

procedure TCardBlankForm.DBGridColumns2EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  IdList,NameList:string;
begin
  inherited;
  if ShowListSelect('(select g.* from v_oil_np_group g where petrol_id is not null)','','',
    mtDetailPURSE_IDS.AsString, False, False,
    IdList,NameList)
  then
  begin
    mtDetail.Edit;
    mtDetailPURSE.AsString := NameList;
    mtDetailPURSE_IDS.AsString := IdList;
  end;
end;

procedure TCardBlankForm.mtDetailBeforePost(DataSet: TDataSet);
begin
  inherited;
  if not InInit then
  begin
    TestCard(DataSet.FieldByName('card_number').AsInteger,DataSet.FieldByName('price').AsCurrency,FOperId,deDate_.Date);
    TestCardMotion(ID,INST,DataSet.FieldByName('card_number').AsInteger,DataSet.FieldByName('price').AsCurrency,FOperId,FEditMode,deDate_.Date);
    TestCardNumber(DataSet.FieldByName('card_number').AsInteger, deDate_.Date);
  end;
  if DataSet.FieldByName('local_id').AsInteger=0 then
    DataSet.FieldByName('local_id').AsInteger:=Sequence.NextVal
  else
  begin // Проверка при изменении номера бланка, тобишь удаление старого
    mtCopy.First;
    while not(mtCopy.Eof) do
    begin
      if DataSet.FieldByName('local_id').AsInteger=mtCopy.FieldByName('local_id').AsInteger then
        if DataSet.FieldByName('card_number').AsInteger<>mtCopy.FieldByName('card_number').AsInteger then
        begin
          if thBadly in TestDeleteOne(mtCopy.FieldByName('card_number').AsInteger) then
          begin
            DataSet.FieldByName('card_number').AsInteger:=mtCopy.FieldByName('card_number').AsInteger;
            raise Exception.Create(TranslateText('Нельзя менять номер бланка. Изменение номера нарушает историю меняемого бланка!'));
          end;
        end;
      mtCopy.Next;
    end;
  end;
end;

procedure TCardBlankForm.sbAutoClick(Sender: TObject);
begin
  inherited;
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

procedure TCardBlankForm.mtDetailAfterPost(DataSet: TDataSet);
var
  i:integer;
begin
  if mtCopy.State=dsInactive then
    mtCopy.Open;
  if mtDetailState=dsInsert then
  // Если строка добавлялась, присваиваем значение сиквенса,
  // а в копии таблицы добавляем строку
    mtCopy.Append
  else if mtDetailState=dsEdit then
  begin
    // ищем строку с нужным сиквенсом
    mtCopy.First;
    while mtCopy.FieldByName('LOCAL_ID').AsInteger<>mtDetail.FieldByName('LOCAL_ID').AsInteger do
      mtCopy.Next;
    mtCopy.Edit;
  end;

  if mtDetailState in [dsInsert,dsEdit] then
  begin
    for i:=1 to mtDetail.FieldCount do
      mtCopy[mtDetail.Fields.FieldByNumber(i).FullName]:=mtDetail[mtDetail.Fields.FieldByNumber(i).FullName];
    mtCopy.Post;
  end;
end;

procedure TCardBlankForm.AfterAction(DataSet: TDataSet);
begin
  mtDetailState:=mtDetail.State;
end;

procedure TCardBlankForm.actDeleteRecordExecute(Sender: TObject);
begin
  if not mtDetail.IsEmpty then
    mtDetail.Delete;
end;

procedure TCardBlankForm.mtDetailBeforeDelete(DataSet: TDataSet);
var
  res :TSetTestHistory;
begin
  mtCopy.First;
  while mtDetail['local_id']<>mtCopy['local_id'] do
    mtCopy.Next;
  res := TestDeleteOne(mtDetail.FieldByName('card_number').AsInteger);
  if thBadly in res then
    raise Exception.CreateFmt(TranslateText(MSG_DEL_HISTORY_BADLY),
      [mtDetail.FieldByName('card_number').AsString])
  else if (thBetter in res) and (thErrors in res) then
    ShowMessage(Format(MSG_DEL_HISTORY_BETTER,[mtDetail.FieldByName('card_number').AsString]));
end;

procedure TCardBlankForm.mtDetailAfterDelete(DataSet: TDataSet);
begin
  mtCopy.Delete;
end;

procedure TCardBlankForm.actAddCardExecute(Sender: TObject);
var
  i:integer;
begin
  tbAdd.Action := actAddCard;
  if mtDetail.State in[dsEdit,dsInsert] then
    mtDetail.Post;
  mtCopy.First;
  while mtDetail['local_id']<>mtCopy['local_id'] do
    mtCopy.Next;
  mtDetail.Append;
  for i:=1 to mtCopy.FieldCount do
    mtDetail[mtCopy.Fields.FieldByNumber(i).FullName]:=mtCopy[mtCopy.Fields.FieldByNumber(i).FullName];
  mtDetailLOCAL_ID.AsInteger:=Sequence.NextVal;
  mtDetailCARD_NUMBER.AsInteger:=mtDetailCARD_NUMBER.AsInteger+1;
  mtDetail.Post;
end;

procedure TCardBlankForm.ceOperChange(Sender: TObject);
var
  i:integer;
begin
  try
    for i:=0 to DBGrid.Columns.Count-1 do
      dbgrid.Columns[i].Visible:=True;
    case FOperId of
      OPER_EMISSION:
      begin
        //dbgrid.Columns[COL_PRICE].Visible:=False;
        dbgrid.Columns[COL_PURSE].Visible:=False;
      end;
    end;
    if (IsInsideOper) and (FToId<>0) and (FToInst<>0) then
      if (FToInst<>FToId) and not IsMyOrg(INST,FToInst) then
        ShowMessage(TranslateText(MSG_ONLY_MY_ORG));
    if FOperId<>OPER_SALE then
      ClearDog;
    ceDog.Enabled:=FOperId=OPER_SALE;
    IsNN.Enabled:=FOperId=OPER_SALE;
    IsNN.Checked:=(FOperId=OPER_SALE)and IsNN.Checked;
  except on e:Exception do
    raise Exception.Create(TranslateText('Ошибка при изменении операции!')+#13#10+e.message);
  end;
end;

procedure TCardBlankForm.ceDogChange(Sender: TObject);
begin
  if (FDogId<>null)and (FDogInst<>null) then
  begin
    ceBlankPrice.Value := nvl(GetSqlValueParSimple('select price_nds from v_oil_dog_full where np_type=455 and dog_id=:id and dog_inst=:inst',
      ['id',FDogId,
       'inst',FDogInst]),0);
  end
  else
    ceBlankPrice.Value:=0;
end;

procedure TCardBlankForm.mtDetailBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.RecordCount > 0) and (not InInit) then
  begin
    TestCard(DataSet.FieldByName('card_number').AsInteger,DataSet.FieldByName('price').AsCurrency,FOperId,deDate_.Date);
    TestCardMotion(ID,INST,DataSet.FieldByName('card_number').AsInteger,DataSet.FieldByName('price').AsCurrency,FOperId,FEditMode,deDate_.Date);
    TestCardNumber(DataSet.FieldByName('card_number').AsInteger, deDate_.Date);
  end;
end;

procedure TCardBlankForm.deDate_Change(Sender: TObject);
begin
  inherited;
  try
    if not mtDetail.IsEmpty then
    begin
      mtDetail.First;
      while not mtDetail.Eof do
      begin
        TestCard(mtDetail.FieldByName('card_number').AsInteger,mtDetail.FieldByName('price').AsCurrency,FOperId,deDate_.Date);
        TestCardMotion(ID,INST,mtDetail.FieldByName('card_number').AsInteger,mtDetail.FieldByName('price').AsCurrency,FOperId,FEditMode,deDate_.Date);
        TestCardNumber(mtDetail.FieldByName('card_number').AsInteger, deDate_.Date);
        _OpenQueryPar(qHistory,
          ['card_number',mtDetail.FieldByName('card_number').AsInteger,
           'id',ID,
           'inst',INST,
           'test',1,
           'test_in_out',BoolTo_(EditMode=emOut,-1,1),
           'test_date',deDate_.Date,
           'oper_id',FOperId]);
        qHistory.Filtered:=False;
        qHistory.Filter:='is_error=1';
        qHistory.Filtered:=True;
        if qHistory.RecordCount>0 then
          raise Exception.CreateFmt(TranslateText('Изменение даты данного документа нарушает историю бланка %d!'),[mtDetail.FieldByName('card_number').AsInteger]);
        mtDetail.Next;
      end;
    end;
  except on e:exception do
    begin
      deDate_.Date:=FDate;
      raise;
    end;
  end;
  FDate:=deDate_.Date;
end;

procedure TCardBlankForm.DBGridExit(Sender: TObject);
begin
  inherited;
  if mtDetail.State <> dsBrowse then mtDetail.Post;
end;

procedure TCardBlankForm.actAddCardsAllExecute(Sender: TObject);
begin
  inherited;
  tbAdd.Action := actAddCardsAll;
  qClientCards.Close;
  _OpenQueryPar(qClientCards,
    ['to_id', FToId,
     'to_inst', FToInst]);

  while not qClientCards.Eof do
  begin
    try
      mtDetail.Append;
      mtDetail.FieldByName('card_number').AsString := qClientCards.FieldByName('card_number').AsString;
      mtDetail.Post;
      qClientCards.Next;
    except on E:Exception do
      raise Exception.CreateFmt(TranslateText('Ошибка при вставке карты %s: ')+e.Message,
        [qClientCards.FieldByName('card_number').AsString]);
    end;
  end;
end;

procedure TCardBlankForm.actAddCardsListExecute(Sender: TObject);
var
  IdList, NameList: string;
  sl: TStringList;
  i: integer;
begin
  inherited;
  tbAdd.Action := actAddCardsList;
  DefineQParams(qClientCards,
    ['to_id', FToId,
     'to_inst', FToInst]);

  if ShowListSelect('('+FullSqlTextOra(qClientCards)+')', '', '', '', false, false, IdList, NameList) then
  begin
    Str2StringList(IdList, sl);
    for i:=0 to sl.Count-1 do
    begin
      try
        mtDetail.Append;
        mtDetail.FieldByName('card_number').AsString := sl[i];
        mtDetail.Post;
      except on E:Exception do
        raise Exception.CreateFmt(TranslateText('Ошибка при вставке карты %s: ')+e.Message,
          [sl[i]]);
      end;
    end;
  end;
end;

procedure TCardBlankForm.FormCreate(Sender: TObject);
begin
  inherited;
  MSG_DEL_HISTORY_BADLY := TranslateText('Удаление нарушает историю бланка %s!');
  MSG_DEL_HISTORY_BETTER := TranslateText('Удаление улучшает историю бланка %s. Но не исправляет его историю!');
end;

end.
