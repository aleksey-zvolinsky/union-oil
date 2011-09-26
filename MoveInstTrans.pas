unit MoveInstTrans;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGridEh, Buttons, StdCtrls,
  ExtCtrls, Mask, ToolEdit, RXCtrls, MemDS, DBAccess, Ora, ActnList,uOilQuery,uOilStoredProc
  {$IFNDEF VER130},Variants{$ENDIF};


type TPrintRekv = packed record
  FDepId : integer;
  FDepInst : integer;
  FOrgId   : integer;
  FOrgInst : integer;
  FDepName : string;
  FOrgName : string;
end;

type
  TfrmMoveInstTrans = class(TBaseForm)
    deFrom: TDateEdit;
    deTo: TDateEdit;
    lTo: TLabel;
    lFrom: TLabel;
    N1: TMenuItem;
    Panel5: TPanel;
    sbPrint: TRxSpeedButton;
    sbSum: TSpeedButton;
    qryRN: TOilQuery;
    qryNN: TOilQuery;
    edDocNum: TEdit;
    Label1: TLabel;
    qDog: TOilQuery;
    N2: TMenuItem;
    ceTo: TComboEdit;
    sbClear: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    deDocDate: TDateEdit;
    qDOC_TYPE: TFloatField;
    qDOC_NAME: TStringField;
    qDATE_: TDateTimeField;
    qDOC_NUMBER: TStringField;
    qDOC_DATE: TDateTimeField;
    qR_DOC_NUMBER: TStringField;
    qLITR: TFloatField;
    qTO_NAME: TStringField;
    qSUMNDS_POP: TFloatField;
    qSUMNDS_TERM: TFloatField;
    qTO_ID: TFloatField;
    qTO_INST: TFloatField;
    cedDocType: TComboEdit;
    sbDocTypeClear: TSpeedButton;
    Label4: TLabel;
    sbDocDateClear: TSpeedButton;
    miPrintByPeriod: TMenuItem;
    qCNT: TFloatField;
    qWork: TOilQuery;
    qR_DOC_DATE: TDateTimeField;
    qryRNPart: TOilQuery;
    miPrintByPeriodPart: TMenuItem;
    qRnAvias: TOilQuery;
    qReestrAvias: TOilQuery;
    dsCardGetPrice: TOraDataSource;
    qCardGetPrice: TOilQuery;
    qCardGetPriceNP_GROUP_FULL: TStringField;
    qCardGetPriceNP_GROUP_ID: TFloatField;
    qCardGetPriceLITR: TFloatField;
    qCardGetPricePRICE: TFloatField;
    qCardGetPriceSumNds: TFloatField;
    miCardsAvias: TMenuItem;
    qDogFil: TOilQuery;
    qNNFil: TOilQuery;
    procedure bbSearchClick(Sender: TObject);
    procedure sbSumClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure ceToButtonClick(Sender: TObject);
    procedure sbClearClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure sbDocTypeClearClick(Sender: TObject);
    procedure sbDocDateClearClick(Sender: TObject);
    procedure cedDocTypeButtonClick(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure miPrintByPeriodClick(Sender: TObject);
    procedure deFromAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure deToAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miCardsAviasClick(Sender: TObject);
    procedure qCardGetPriceCalcFields(DataSet: TDataSet);
  private
    PrintOptions : TPrintRekv;
    FOrgID,FOrgINST, FDocType : integer;
    FPrintType:(ptNormal,ptWithPart);
    procedure SetPrintOptions(ADocType, ClientId, ClientInst: Integer; DepartmentId:integer=-1; DepartmentInst:integer=-1);
    procedure MakeDocsByPeriod(Sender: TObject);
    (** Печать расходной накладной идет из MakeDocsByPeriod *)
    procedure MakeRN;
    (** Печать налоговой накладной идет из MakeRN *)
    procedure MakeNN(ABeginDate,AEndDate: TDateTime; AMoveType: Integer);
    procedure SetColumnsVisible;
    procedure PrintCardFilDocs(p_BeginDate,p_EndDate: TDateTime;
                               p_FromInst, p_ToInst: integer);
    procedure PrintSumCards(p_List:Variant;
                            p_FirstLine: integer;
                            p_Q: TOilQuery;
                            p_FieldList: string;
                            p_Date: TDateTime =0;
                            p_SumPropis: Boolean = false);
    procedure PrintDopSoglRekv(p_Q: TOilQuery;
                               p_FirstLine: integer;
                               p_Column: string;
                               p_List:variant);
    procedure PrintRashNakHead(p_List:Variant;
                               qFrom,qTo,qDog: TOilQuery;
                               p_DocNum: string;
                               p_Date: TDateTime);
  public
    { Public declarations }
  end;

var
  frmMoveInstTrans: TfrmMoveInstTrans;

implementation

uses UDbFunc, ThirdPartyPrint, RashNakPrint, TaxBillPrint, OilStd, Main,
  ChooseOrg, uMessageDlgExt, ExFunc, uXMLForm, uStart, ExcelFunc, MoneyFunc;

{$R *.DFM}

var
  frmDocInterface : TfrmThirdPartyPrint;
  IsSvodiy :boolean;

procedure TfrmMoveInstTrans.bbSearchClick(Sender: TObject);
var
  BM: TBookMark;
begin
  inherited;
  SetColumnsVisible;
  BM := q.GetBookmark;
  if q.Active then q.Close;
  q.ParamByName('BeginDate').asDate := deFrom.Date;
  q.ParamByName('EndDate').asDate := deTo.Date;
  q.ParamByName('DocNum').value := edDocNum.Text;
  if deDocDate.Date = 0
    then q.ParamByName('DocDate').value := null
    else q.ParamByName('DocDate').value := deDocDate.Date;
  q.ParamByName('OrgId').asInteger := FOrgId;
  q.ParamByName('OrgInst').asInteger := FOrgInst;
  q.ParamByName('DocType').value := FDocType;
  _OpenQuery(q);
  if q.BookmarkValid(BM) then q.GotoBookMark(BM);
  q.FreeBookmark(BM);
  miCardsAvias.Visible := FDocType=5;

end;

procedure TfrmMoveInstTrans.sbSumClick(Sender: TObject);
begin
  inherited;
  if sbSum.Down
    then DBGrid1.FooterRowCount := 1
    else DBGrid1.FooterRowCount := 0;
end;

procedure TfrmMoveInstTrans.SetPrintOptions(
  ADocType,
  ClientId, ClientInst: Integer;
  DepartmentId:integer=-1; DepartmentInst:integer=-1);
begin
  case ADocType of
    1 :
    begin
      if DepartmentId <> -1 then
      begin
        PrintOptions.FDepId  := DepartmentId;
        PrintOptions.FDepInst  := DepartmentInst;
      end
      else
      begin
        if GENERATION >= 2 then
        begin
          PrintOptions.FDepId  := AVIAS_ID;
          PrintOptions.FDepInst  := AVIAS_INST;
        end
        else
        begin
          PrintOptions.FDepId  := MAIN.INST;
          PrintOptions.FDepInst  := MAIN.INST;
        end;
      end;
      PrintOptions.FDepName  := GetOrgName(PrintOptions.FDepId, PrintOptions.FDepInst);
      PrintOptions.FOrgId := ClientId;
      PrintOptions.FOrgInst := ClientInst;
      PrintOptions.FOrgName := GetOrgName(ClientId, ClientInst);
    end;
    2,0 :
    begin
      if GENERATION >= 2 then
      begin
        PrintOptions.FDepId  := AVIAS_ID;
        PrintOptions.FDepInst  := AVIAS_INST;
      end
      else
      begin
        PrintOptions.FDepId  := MAIN.INST;
        PrintOptions.FDepInst  := MAIN.INST;
      end;
      PrintOptions.FDepName  := GetOrgName(PrintOptions.FDepId,PrintOptions.FDepInst);
      PrintOptions.FOrgId := ClientId;
      PrintOptions.FOrgInst := ClientInst;
      PrintOptions.FOrgName := GetOrgName(ClientId,ClientInst);
    end;
    3 :
    begin
      PrintOptions.FDepId  := INST_OLD;
      PrintOptions.FDepInst  := INST_OLD;
      PrintOptions.FDepName  := GetOrgName(INST_OLD,INST_OLD);
      PrintOptions.FOrgId := MAIN.INST;
      PrintOptions.FOrgInst := MAIN.INST;
      PrintOptions.FOrgName := GetOrgName(MAIN.INST,MAIN.INST);
    end;
    4 :
    begin
      PrintOptions.FDepId  := MAIN.INST;
      PrintOptions.FDepInst  := MAIN.INST;
      PrintOptions.FDepName  := GetOrgName(MAIN.INST,MAIN.INST);
      PrintOptions.FOrgId := INST_OLD;
      PrintOptions.FOrgInst := INST_OLD;
      PrintOptions.FOrgName := GetOrgName(INST_OLD,INST_OLD);
    end;
    5 :
    begin
      PrintOptions.FDepId  := MAIN.INST;
      PrintOptions.FDepInst  := MAIN.INST;
      PrintOptions.FDepName  := GetOrgName(MAIN.INST,MAIN.INST);
      PrintOptions.FOrgId := AVIAS_INST;
      PrintOptions.FOrgInst := AVIAS_INST;
      PrintOptions.FOrgName := GetOrgName(AVIAS_INST,AVIAS_INST);
    end;
  end;
end;

procedure TfrmMoveInstTrans.FormCreate(Sender: TObject);
begin
  inherited;
  FOrgId := 0;
  FOrgInst := 0;
  deFrom.Date := now;
  deTo.Date := now;
  DefineRepDates(deFrom.Date, deTo.Date);
  bbSearchClick(nil);
  SetPrintOptions(qDoc_type.AsInteger, qTo_Id.AsInteger, qTo_Inst.AsInteger);
  deDocDate.Clear;

  pAdd.Visible  := false;
  pEdit.Visible := false;
  pDel.Visible  := false;
end;


procedure TfrmMoveInstTrans.MakeRN();
var
  RashNak : TdmRashNakPrint;
  RnNum, RDocNum, ByDoc, StrNew, strPart: string;
  CurrDate, NNDate, RDocDate, DatePast : TDateTime;
  iId, DocType, ToId, ToInst, Res, REQUEST_INST : integer;
  Price : Double;
  rnType : TRashNakType;
  IsNewRecord : Boolean;
  qryRN:TOilQuery;
  //----------------------------------------------------------------------------
  function IsPossible: Boolean;
  begin
    Result := (CurrDate <> qryRN.FieldByName('date_').asDateTime) and (not IsSvodiy);
    Result := Result or ( qryRN.FieldByName('new_rn').asString <> strNew );
    Result := Result or ( DocType <> qryRN.FieldByName('doc_type').asInteger );
    Result := Result or ( ToId <> qryRn.FieldByName('to_id').AsInteger ) and (qryRn.FieldByName('doc_type').AsInteger <= 2);
    Result := Result or ( ToInst <> qryRn.FieldByName('to_inst').AsInteger ) and (qryRn.FieldByName('doc_type').AsInteger <= 2);
    Result := Result or ( RDocNum <> qryRn.FieldByName('r_doc_number').AsString ) and (qryRn.FieldByName('doc_type').AsInteger <= 2) and (not IsSvodiy);
    Result := Result or ( RDocDate <> qryRn.FieldByName('r_doc_date').AsDateTime ) and (qryRn.FieldByName('doc_type').AsInteger <= 2) and (not IsSvodiy);
  end;
  //----------------------------------------------------------------------------
begin
  if FPrintType=ptWithPart then
    qryRN:=self.qryRNPart
  else
    qryRN:=self.qryRN;
  // Открытие запроса
  //with qryRN do
  begin
    qryRN.SQL.Text := qryRN.BaseSQL;
    if qryRN.Active then qryRN.Close;
    qryRN.ParamByName('BeginDate').asDate := deFrom.Date;
    qryRN.ParamByName('EndDate').asDate := deTo.Date;
    qryRN.ParamByName('DocNum').value := edDocNum.Text;
    if deDocDate.Date = 0
      then qryRN.ParamByName('DocDate').value := null
      else qryRN.ParamByName('DocDate').value := deDocDate.Date;
    qryRN.ParamByName('OrgId').asInteger := FOrgId;
    qryRN.ParamByName('OrgInst').asInteger := FOrgInst;
    qryRN.ParamByName('DocType').value := FDocType;

    try
      if (FOrgId= 0) and (FOrgInst=0) and (FDocType <= 2) then
        raise Exception.Create(TranslateText('Не выбран клиент!')+#13#10
          +TranslateText('Документы будут распечатаны по всем клиентам!'));
    except on E:Exception do
      if MessageDlg(E.Message+#13#10+TranslateText('Продолжить формирование документов?'),mtConfirmation,[mbYes,mbNo],0) = mrNo
       then raise;
    end;

    _OpenQueryOra(qryRN);

    if( qryRN.isEmpty )and( qryRN.RecordCount=0 )then
    begin
      qryRN.close;
      qryRN.ParamByName('BeginDate').asDate := deFrom.Date;
      qryRN.ParamByName('EndDate').asDate := deTo.Date;
      qryRN.ParamByName('DocNum').value := edDocNum.Text;
      if deDocDate.Date = 0
        then qryRN.ParamByName('DocDate').value := null
        else qryRN.ParamByName('DocDate').value := deDocDate.Date;
      qryRN.ParamByName('OrgId').asInteger := FOrgId;
      qryRN.ParamByName('OrgInst').asInteger := FOrgInst;
      qryRN.ParamByName('DocType').value := FDocType;
      qryRN.Open;
      if( qryRN.isEmpty )and( qryRN.RecordCount=0 )then
        raise Exception.Create(TranslateText('За выбранный период не обнаружено ни одного списания(РН)'));
    end;
  end;

  CurrDate := qryRN.FieldByName('date_').asDateTime;
  StrNew := '';
  DocType := 0;
  NNDate := 0;
  IsNewRecord := False;

  while not qryRN.Eof do
  begin

    Application.ProcessMessages;

    {созадать НН}
    if ( (qryRN.FieldByName('doc_type').AsInteger = 3 ) or
      (qryRN.FieldByName('doc_type').AsInteger = 4 ) ) and
      (NNDate <> qryRN.FieldByName('date_').asDateTime) then
    begin
      MakeNN(
        qryRN.FieldByName('date_').AsDateTime,
        qryRN.FieldByName('date_').AsDateTime,
        4 - qryRN.FieldByName('doc_type').AsInteger
      );
      NNDate :=  qryRN.FieldByName('date_').asDateTime;
    end;  


    //создать экземпляр расходной накладной
    if IsPossible  then
    begin
      try
        if (qryRn.FieldByName('r_doc_number').AsString= '') and (qryRN.FieldByName('doc_type').AsInteger <= 2) then
          raise Exception.Create(TranslateText('Не указан первичный документ для расходной накладной от ')+qDate_.AsString+#13#10
            +TranslateText('по клиенту ')+qTo_Name.AsString);
      except on E:Exception do
        begin
          MessageDlg(E.Message+#13#10+TranslateText('Формирование документов прервано!'),mtConfirmation,[mbOk],0);
          raise;
        end;
      end;
      if qryRN.FieldByName('doc_type').AsInteger = 1 then
      begin
        REQUEST_INST := nvl(GetSqlValueParSimple(
          'select max(t.request_inst) ' + #13#10 +
          '  from v_card_transaction t, card_transaction_rest r ' + #13#10 +
          ' where r.oil_id = :expense_id ' + #13#10 +
          '   and r.id_receipts = t.oil_id ' + #13#10 +
          '   and r.oil_inst = :oil_inst ' + #13#10 +
          '   and t.oil_inst = :oil_inst ' + #13#10 +
          '   and r.oil_inst = t.oil_inst ',
          ['expense_id', qryRN.FieldByName('OIL_ID').AsInteger,
           'oil_inst', qryRN.FieldByName('OIL_INST').AsInteger]), -1);

          SetPrintOptions(
            qryRN.FieldByName('doc_type').AsInteger,
            qryRN.FieldByName('to_id').AsInteger,
            qryRN.FieldByName('to_inst').AsInteger,
            REQUEST_INST,
            REQUEST_INST
          )
      end
      else
        SetPrintOptions(
          qryRN.FieldByName('doc_type').AsInteger,
          qryRN.FieldByName('to_id').AsInteger,
          qryRN.FieldByName('to_inst').AsInteger
        );
      if qryRN.FieldByName('doc_type').AsInteger > 2 then
      begin
        if qryRN.FieldByName('doc_number').IsNull
          then RnNum := IntToStr(GetSeqNextVal('s_oil_rnobl_move_inst',true))
          else RnNum := qryRN.FieldByName('doc_number').asString
      end
      else if qryRN.FieldByName('doc_number').IsNull then
      begin
        if  (qryRN.FieldByName('to_id').AsInteger = ToId ) and
            (qryRN.FieldByName('to_inst').AsInteger = ToInst ) and
            (qryRN.FieldByName('date_').AsDateTime = CurrDate ) and
            (qryRN.FieldByName('doc_type').AsInteger = DocType )
        then
          RnNum := RnNum
        else
          RnNum := IntToStr(GetSeqNextVal('S_Oil_Dog_RN_Num'));
        IsNewRecord := True;
      end
      else
        RnNum := qryRN.FieldByName('doc_number').asString;


      if qryRN.FieldByName('doc_type').asInteger <= 2 then
      begin
      
        if qryRN.FieldByName('doc_type').asInteger = 1
          then rnType  := rnCardEK
          else rnType  := rnCardLS;
        if IsSvodiy then
          ByDoc := ''
        else
          ByDoc := TranslateText(', приложение (заявка) № ')+qryRN.FieldByName('r_doc_number').asString+TranslateText(' от ')+
             FormatDateTime('dd.mm.yyyy', qryRN.FieldByName('r_doc_date').AsDateTime);
      end
      else // иначе доп.соглашение
      begin
        rnType := rnCardAdd;
        ByDoc := '';
      end;

      RashNak := TdmRashNakPrint.Create(
        RnNum + qryRN.FieldByName('rn_num_add').asString,
        BoolTo_(IsSvodiy, deTo.Date, qryRN.FieldByName('date_').asDateTime),
        '',
        ByDoc,
        PrintOptions.FDepId,
        PrintOptions.FDepInst,
        PrintOptions.FOrgId,
        PrintOptions.FOrgInst,
        rnType
      );
      RashNak.Options.WithRequest := IsSvodiy;

      CurrDate := qryRN.FieldByName('date_').asDateTime;
      StrNew := qryRN.FieldByName('new_rn').AsString;
      DocType := qryRN.FieldByName('doc_type').asInteger;
      ToId := qryRn.FieldByName('to_id').AsInteger;
      ToInst := qryRn.FieldByName('to_inst').AsInteger;
      RDocNum := qryRn.FieldByName('r_doc_number').AsString;
      RDocDate := qryRn.FieldByName('r_doc_date').AsDateTime;
    end;    //создание экз.

    {для клиентов  - цена пополнения, для остальных - цена терминала}
    if qryRN.FieldByName('doc_type').asInteger <= 2
      then Price := qryRN.FieldByName('pricends_pop').asFloat
      else Price := qryRN.FieldByName('pricends_term').asFloat;
    if qryRN.Fields.FindField('part_dog')<>nil then
      strPart:=qryRN.FieldByName('part_dog').AsString
    else
      strPart:='';
    //Добавить позицию расходной накладной
    RashNak.AddPosition(
      qryRN.FieldByName('azs_par_name').asString,
      qryRN.FieldByName('azs_name').asString,
      qryRN.FieldByName('np_name').asString,
      qryRN.FieldByName('card_number').asString,
      ''''+qryRN.FieldByName('CheckNum').asString,
      qryRN.FieldByName('date_').asString,    //дата чека
      TranslateText('литр'),
      Price,
      Price,
      qryRN.FieldByName('litr').asFloat,
      strPart,
      false,
      qryRn.FieldByName('r_doc_number').AsString,
      qryRn.FieldByName('r_doc_date').AsDateTime
    );
    RashNak.SetAddFields(
      FormatDateTime('ddmmyyhhnnss',qryRN.FieldByName('r_oper_date').AsDateTime)+
        qryRN.FieldByName('r_doc_number').AsString,
      qryRN.FieldByName('doc_number').AsString,
      qryRN.FieldByName('doc_date').AsDateTime
    );
    // сохранение в БД
    try
      StartSQL;

      {для клиентов  - цена пополнения, для остальных - цена терминала}
      if qryRN.FieldByName('rn_id').IsNull then
        iId := GetSeqNextVal('s_oil_rash_nak')
      else
        iId := qryRN.FieldByName('rn_id').AsInteger;

       {Запись пакета документов между старой и новой фирмой}
      if qryRN.FieldByName('doc_type').AsInteger > 2 then
      begin
        _ExecProc('OIL.INSORUPDOIL_RASH_NAK',
         ['ID#',           iId,
          'INST#',         MAIN_ORG.INST,
          'STATE#',        'Y',
          'SOURCE_ID#',     qryRN.FieldByName('oil_id').asInteger,
          'SOURCE_INST#',   qryRN.FieldByName('oil_inst').asInteger,
          'DOV_SER#',       '',
          'DOV_NUM#',       RnNum,
          'DOV_DATE#',      CurrDate,
          'DOV_WHO#',       FormatDateTime('ddmmyyhhnnss',qryRN.FieldByName('r_oper_date').AsDateTime)+
                                     qryRN.FieldByName('r_doc_number').AsString,
          'VAR_NUMBER#',    Price,
          'RASH_NAK_TYPE#', 2
        ],TRUE);
      end
      else
      {Запись расходных накладных по ЭК}
      if qryRN.FieldByName('doc_type').AsInteger = 1 then
      begin
        if IsNewRecord then
         _ExecSQL(' update Card_Transaction ' +
                 ' set Doc_Number = ''' + RnNum + ''', ' +
                 ' Doc_Date = ''' + FormatDateTime('dd.mm.yyyy', CurrDate) + '''' +
                 ' where oil_id='+qryRN.FieldByName('oil_id').AsString+
                 ' and oil_inst='+qryRN.FieldByName('oil_inst').AsString
                );
      end
      else
      {Запись расходных накладных по ЛС}
      if qryRN.FieldByName('doc_type').AsInteger = 2 then
      begin
        //пепеписать номер расходной
        qWork.Close;
        qWork.SQL.Text := ' update Card_Transaction ' +
             ' set Doc_Number = decode(:is_svodnij,1,:rn_number, decode(date_,:end_date,:rn_number,:rn_number||''/''||substr(date_,1,2))), ' +
             ' Doc_Date = decode(:is_svodnij,1,:end_date,date_) ' +
             ' where DATE_ between :begin_date and :end_date ' +
             ' and Gr_Card_Num is not null ' +
             ' and To_Id = :to_id ' +
             ' and To_Inst = :to_inst ' +
             ' and Doc_Number is null '+
             ' and id_схемы_обсл = 2 ';
        qWork.ParamByName('begin_date').AsDateTime := deFrom.Date;;
        qWork.ParamByName('end_date').AsDateTime := deTo.Date;
        qWork.ParamByName('to_id').AsInteger := qryRn.FieldByName('to_id').AsInteger;
        qWork.ParamByName('to_inst').AsInteger := qryRn.FieldByName('to_inst').AsInteger;
        qWork.ParamByName('rn_number').AsString := RnNum;
        qWork.ParamByName('is_svodnij').AsInteger := BoolTo_(IsSvodiy, 1, 0);
       // ShowMessage(qWork.SQL.Text);
        qWork.ExecSQL;
      end;

      CommitSQL;
      qryRN.Next;

    except on ErrStr:Exception do
      begin
        RollBackSQL;
        Res := MessageDlgExt(TranslateText('Ошибка. ')+ErrStr.Message+#13#10+
           TranslateText('Продолжить формирование документов?'),mtConfirmation,[TranslateText('Да'),TranslateText('Нет')],1) ;
        if (Res = -1) or (Res = 2) then
        begin
          if RashNak<>nil then RashNak.Free;
          raise;// Exception.Create(ErrStr.Message);
        end;
      end;
    end; //try  // сохранение в БД

    // Вывод на печать
    try
      if IsPossible or qryRN.Eof then
      begin
        RashNak.PutToExcel(
          frmDocInterface.cbOutputType.ItemIndex,
          frmDocInterface.deSaveTo.Text,
          frmDocInterface.chSaveTo.Checked,
          frmDocInterface.edNumOfCopy.AsInteger
        );
        RashNak.Free;
      end; {IsPossible}
    except on ErrStr:Exception do
      begin
        Res := MessageDlgExt(TranslateText('Ошибка: ')+ErrStr.Message+#13#10+
           TranslateText('Продолжить формирование документов?'),mtConfirmation,[TranslateText('Да'),TranslateText('Нет')],1) ;
        if (Res = -1) or (Res = 2) then
        begin
          if RashNak<>nil then RashNak.Free;
          raise;// Exception.Create(ErrStr.Message);
        end;
      end;
    end; //try    ;

  end; //while
  
end;

procedure TfrmMoveInstTrans.MakeNN(ABeginDate,AEndDate: TDateTime; AMoveType: Integer);
var
  TaxBill : TdmTaxBill;
  NNDate : TDateTime;
  //TBNum : String;
  iNew : Integer;
  ProgressBar : TProgressBar;
begin
  //запрос для НН
  with qryNN do
  begin
    if Active then Close;
    ParamByName('FromDate').asDate := ABeginDate;
    ParamByName('ToDate').asDate := AEndDate;
    ParamByName('move_type').AsInteger := AMoveType;
    _OpenQueryOra(qryNN);

    if isEmpty then
      raise Exception.Create(TranslateText('За выбранный период не обнаружено ни одного списания(НН)'));
  end;
  iNew :=1;
  NNdate := 0;
  ProgressBar := TProgressBar.Create(Self);
  try
    ProgressBar.SetMaxValue(qryNN.RecordCount);
    //создать экземпляр налоговой накладной

   while not qryNN.eof do with qryNN do
    begin
      if (NNDate <> FieldByName('date_').asDateTime) or
      (FieldByName('new_nn').asInteger <> iNew) then
      begin
        //Параметры налоговой накладной
        TaxBill := TdmTaxBill.Create(
          PrintOptions.FOrgId,
          PrintOptions.FOrgInst,
          PrintOptions.FDepId,
          PrintOptions.FDepInst
        );

        TaxBill.Options.PrintSettings.PathForSave :=  frmDocInterface.deSaveTo.Text;
        TaxBill.Options.Scheme:=Talon;
        TaxBill.Options.Date := DateToStr(FieldByName('date_').asDateTime);
        TaxBill.Options.Num := FieldByName('nn_num').AsString;
        TaxBill.Options.TaxBillType := TB_MOVE_INST;
        TaxBill.Options.TaxBillInst := Main.Inst;
        TaxBill.Options.OIL_NN_Type := 2;
        TaxBill.Options.OIL_NN_Cause := 8;
        qDog.Close;
        qDog.ParamByName('ToId').asInteger := PrintOptions.FOrgId;
        qDog.ParamByName('ToInst').asInteger := PrintOptions.FOrgInst;
        qDog.ParamByName('FromId').asInteger := PrintOptions.FDepId;
        qDog.ParamByName('FromInst').asInteger := PrintOptions.FDepInst;
        _OpenQueryOra(qDog);
        TaxBill.Options.DogId := qDog.FieldByName('Id').asInteger;
        TaxBill.Options.DogInst := qDog.FieldByName('Inst').asInteger;
        NNDate := FieldByName('date_').asDateTime;
        iNew := FieldByName('new_nn').asInteger;
      end;
      ProgressBar.Step;
      //добавить позицию налоговой накладной
      TaxBill.AddPosition(
        FieldByName('np_type').asInteger,
        28,
        DateToStr(FieldByName('date_').asDateTime),
        FieldByName('tr_litr').asFloat,
        FieldByName('term_price').asFloat,
        FieldByName('tr_amount').asFloat
      );

      Next;

      if (NNDate <> FieldByName('date_').asDateTime)or
       (FieldByName('new_nn').asInteger <> iNew) or
       (Eof) then
      begin
        //Записать в базу налоговую накладную
        if TaxBill.Options.Num='' then
        try
          StartSQL;
          TaxBill.Make(false);
          CommitSQL;
        except on ErrStr:Exception do
          begin
            RollbackSQL;
            raise Exception.Create(ErrStr.Message);
          end;
        end;
        TaxBill.Options.IsCustomPrintSettings := true;
        TaxBill.Options.PrintSettings.OrigAndCopy := true;
        TaxBill.Options.PrintSettings.NumOfCopy := 1;

        //Вывести на экран налоговую накладную
        case frmDocInterface.cbOutputType.ItemIndex of
          0 : TaxBill.Options.Output := toScreen;
          1 : TaxBill.Options.Output := toPrinter;
          2 : TaxBill.Options.Output := toDisk;
        end;
        TaxBill.PutToExcel();
        TaxBill.Free;
      end;
    end; // while
  finally
    FreeAndNil(ProgressBar);
  end;
end;

procedure TfrmMoveInstTrans.bbClearClick(Sender: TObject);
begin
  inherited;
  sbDocTypeClear.Click;
  sbDocDateClear.Click;
  edDocNum.Text :='';
  FOrgId := 0;
  FOrgInst := 0;
  ceTo.Text := '';
  deFrom.Date :=now;
  deTo.Date := now;
end;

procedure TfrmMoveInstTrans.N2Click(Sender: TObject);
var
  TaxBill : TdmTaxBill;
  Res : byte;
begin
  Res := MessageDlgExt(TranslateText('Удалить отмеченный документ?'),mtConfirmation,[TranslateText('Да'),TranslateText('Нет'),TranslateText('Отмена')],1);
  if (Res = -1) or (Res = 3) then exit;
  try

    StartSQL;
    case qDoc_Type.AsInteger of
      1:
      begin
        _ExecSQL(
          ' update card_transaction set doc_number=null, doc_date=null '+
          ' where doc_number = :doc_number '+
          ' and doc_date = :doc_date '+
          ' and to_id = :to_id ' +
          ' and to_inst = :to_inst ' +
          ' and date_ between trunc(date_,''MM'') and  add_months(trunc(date_,''MM''),1)-1 '+
          ' and get_card_oper_num(gr_card_num,номер_терминала,причина_изменения,oper_type,id_схемы_обсл,trn_guid) in (9,10)  ',
          ['doc_number', qDoc_Number.AsString,
           'doc_date', qDoc_Date.AsString,
           'to_id', qTo_id.AsInteger,
           'to_inst', qTo_Inst.AsInteger]
        );
      end;
      2:
      begin
        _ExecSQL(
          ' update card_transaction set doc_number=null, doc_date=null '+
          ' where doc_number = :doc_number '+
          ' and doc_date = :doc_date '+
          ' and to_id = :to_id ' +
          ' and to_inst = :to_inst ' +
          ' and date_ between trunc(date_,''MM'') and  add_months(trunc(date_,''MM''),1)-1 '+
          ' and get_card_oper_num(gr_card_num,номер_терминала,причина_изменения,oper_type,id_схемы_обсл,trn_guid) in (12)  ',
          ['doc_number', qDoc_Number.AsString,
           'doc_date', qDoc_Date.AsString,
           'to_id', qTo_id.AsInteger,
           'to_inst', qTo_Inst.AsInteger]
        );
      end;
      else
      begin
        {Удалить данные о расходных накладных из OIL_RASH_NAK}
         _ExecSQL('update oil_rash_nak set state=''N'' where state=''Y'' and rash_nak_type=2 and dov_num = '''+
            qDoc_Number.asString +''' and dov_date='''+qDoc_Date.asString+'''');

        {Удалить налоговые накладные}
        if MessageDlgExt(TranslateText('Будут удалены все налоговые накладные по клиенту ')+GetOrgName(PrintOptions.FOrgId,PrintOptions.FOrgInst)+TranslateText(' за ')+q.FieldByName('date_').AsString+'.'+#13#10+
            TranslateText('Либо подтвердите удаление, либо вручную удалите накладные из книги продаж '),mtConfirmation,[TranslateText('Удалить'),TranslateText('Отмена')]) = 1 then
        begin
          {Удалить налоговую накладную}
          TaxBill:= TdmTaxBill.Create(
            PrintOptions.FOrgId,
            PrintOptions.FOrgInst
          );
          TaxBill.Options.TaxBillType := TB_MOVE_INST;
          try
            TaxBill.DeleteSBRecords(qDate_.asDateTime,qDate_.asDateTime);
          finally
            TaxBill.Free;
          end;
        end; {MessageDlgExt}
      end; {else}
    end; {case}

    CommitSQL;
    bbSearchClick(nil);
  except on E:Exception do
    begin
      RollBackSQL;
      ShowMessage(E.Message);
    end;
  end
end;

procedure TfrmMoveInstTrans.ceToButtonClick(Sender: TObject);
var
  vName: string;
begin
  inherited;
  if ChooseOrg.CaptureOrg(4,0,0,'yyy',FOrgID,FOrgINST,vName) then
  begin
    ceTo.Text:=vName;
  end;
end;

procedure TfrmMoveInstTrans.sbClearClick(Sender: TObject);
begin
  inherited;
  FOrgID:=0;
  FOrgINST := 0;
  ceTo.Text :='';
end;

procedure TfrmMoveInstTrans.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if (q.RecordCount <= 0) or (qDoc_Type.AsInteger > 2)   then exit;
  if ceTo.Text = '' then
  begin
    ceTo.Text := q['to_name'];
    FOrgId := q['to_id'];
    FOrgInst := q['to_inst'];
  end
  else
  begin
    ceTo.Text := '';
    FOrgId := 0;
    FOrgInst := 0;
  end;
  bbSearchClick(nil);
end;

procedure TfrmMoveInstTrans.sbDocTypeClearClick(Sender: TObject);
begin
  inherited;
  cedDocType.Clear;
  FDocType := 0;
end;

procedure TfrmMoveInstTrans.sbDocDateClearClick(Sender: TObject);
begin
  inherited;
  deDocDate.Clear;
end;

procedure TfrmMoveInstTrans.cedDocTypeButtonClick(Sender: TObject);
var
  Form : TXmlForm;
begin
  inherited;
  Form :=GetXMLFormAsFilter('CardDocTypes');
  Form.ShowModal;
  try
    if Form.ModalResult = mrOk then
    begin
      FDocType := Form.FQuery['id'];
      cedDocType.Text := Form.FQuery['name'];
    end;
  finally
    FreeAndNil(Form);
  end;

end;

procedure TfrmMoveInstTrans.SetColumnsVisible;
begin
  DbGrid1.Columns[3].Visible := FDocType < 2;
  DbGrid1.Columns[6].Visible := FDocType < 2;
  DbGrid1.Columns[7].Visible := FDocType < 2;
end;

procedure TfrmMoveInstTrans.dsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  SetPrintOptions(qDoc_type.AsInteger, qTo_Id.AsInteger, qTo_Inst.AsInteger);
end;

procedure TfrmMoveInstTrans.miPrintByPeriodClick(Sender: TObject);
begin
  inherited;
  DefineRepDates(deFrom.Date-1, deTo.Date+1);
  if pos('part',ANSILowerCase(TMenuItem(Sender).Name))<>0 then
  begin
    FPrintType:=ptWithPart;
  end
  else
    FPrintType:=ptNormal;
  frmDocInterface := TfrmThirdPartyPrint.Create(Application);
  try with frmDocInterface do
  begin
    sbAuto.Down:=true;
    sbAutoClick(nil);
    pnlPrintAll.Visible := False;
    pnlDoc.Visible := False;
    pnlOrgs.Visible := False;
    pnlSvodniy.Visible := True;

    sbAuto.Enabled := False;
    deBeginDate.Date := deFrom.Date;
    deEndDate.Date := deTo.Date;
    deBeginDate.Enabled := False;
    deEndDate.Enabled := False;
    bbPrint.OnClick := MakeDocsByPeriod;
    bbPrint.ModalResult := mrOk;
    frmDocInterface.Height := 300;
    ShowModal;
    if ModalResult = mrOk then bbSearchClick(nil);
  end
  finally
    frmDocInterface.Free;
  end;
end;

procedure TfrmMoveInstTrans.MakeDocsByPeriod(Sender: TObject);
begin

  IsSvodiy := TfrmThirdPartyPrint(TPanel(TPanel(TBitBtn(Sender).Parent).Parent).Parent).cbTotal.Checked;
  MakeRN();
end;

procedure TfrmMoveInstTrans.deFromAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
  inherited;
  DefineRepDates(ADate-1, deTo.Date+1);
end;

procedure TfrmMoveInstTrans.deToAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
  inherited;
  DefineRepDates(deFrom.Date-1, ADate+1);
end;

procedure TfrmMoveInstTrans.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DefineRepDates(0,0);
end;

procedure TfrmMoveInstTrans.PrintCardFilDocs(
             p_BeginDate,p_EndDate: TDateTime;
             p_FromInst, p_ToInst: integer
             );
var
  qFrom,qTo,qTalRN: TOilQuery;
  vFrom,vTo,DocNum,NNId,NNInst: integer;
  XLApp,List: Variant;
  StartDate: TDateTime;
  s: string;
  i,j,cntList: integer;
  FileName: string;

  //****************************************************************************
  function NeedToSaveNN: Boolean;
  begin
    result:=False;
    if qRnAvias.RecordCount<>qNNFil.RecordCount then
      begin
        result:=TRUE;
        exit;
      end;
    qRnAvias.First;
    qNNFil.First;
    while not qRnAvias.Eof do
      begin
        if (qRnAvias['petrol_id']<>qNNFil['tov_id']) or
           (qRnAvias['price']<>qNNFil['price_nds']) or
           (qRnAvias['litr']<>qNNFil['co'])
        then
          begin
            result:=TRUE;
            exit;
          end;
        qRnAvias.Next;
        qNNFil.Next;
      end;
  end;
  //****************************************************************************
  procedure SaveNN;
  var
    v_NNId,v_NNInst:integer;
    v_FDog:string;
    vNum: integer;
  begin
    if qNNFil.RecordCount=0 then
      begin
        v_NNId:=GetSeqNextVal('S_OIL_SALE_BOOK');
        v_NNInst:=MAIN_ORG.INST;
        v_FDog := Format(LangText('Soglastno_dogovora')+' %s '+LangText('Ot')+' %s',[qDogFil['dog'],qDogFil['dog_date']]);
        StartSqlOra;
        vNum:=GetSeqNextVal('NAL_NAKL_NUM');
        InsOrUpdRecord('OIL_SALE_BOOK',
            ['ID',                 v_NNId,
             'STATE',              'Y',
             'INST',               v_NNInst,
             'S_DATE',             p_EndDate,
             'ORGAN',              vTo,
             'ORGAN_INST',         vTo,
             'NUM',                vNum,
             'F_DOC',              v_FDog,
             'FRASCH',             TranslateText('Оплата ')+LangText('s')+LangText('R/S'),
             'R_DATE',             p_EndDate,
             'FROM_',              vFrom,
             'FROM_INST',          vFrom,
             'NAL_T',              10,  // ??? тип "Талонная накладная между филиалом и его предком"
             'NN_CAUSE_ID',        8,   // тип "Смарт-карти"
             'NN_TYPE_ID',         2    // тип "Відгрузка"
             ]);
      end
    else
      begin
        v_NNId:=NNId;
        v_NNInst:=NNInst;
      end;
    _ExecSqlOra(Format('update oil_sale_book_det set state=''N'' where nn_id=%d and nn_inst=%d',
                       [v_NNId,v_NNInst]));
    with qRnAvias do
      begin
        First;
        while not Eof do
          begin
            InsOrUpdRecord('OIL_SALE_BOOK_DET',
                ['ID',             GetSeqNextVal('S_OIL_SALE_BOOK_DET'),
                 'STATE',          'Y',
                 'INST',           v_NNInst,
                 'NN_ID',          v_NNId,
                 'NN_INST',        v_NNInst,
                 'NDS_T',          FieldValues['sumnds'],
                 'NDS_P_BASE',     FieldValues['sumxnds'],
                 'NDS_P_20',       FieldValues['nds'],
                 'TOV_ID',         FieldValues['petrol_id'],
                 'DIV_ID',         28, // dimension ~ літри
                 'KOL',            FieldValues['litr'],
                 'PRICE_NDS',      FieldValues['PriceNds']
                ]);
            Next;
          end;
      end;
    NNInst := v_NNInst;
    NNId := v_NNId;
    CommitSqlOra;
  end;
  //****************************************************************************
  procedure PrintDopSogl;
  begin
    ExFormat(List,'C2',[qDogFil['dog'],qDogFil['dog_date']]);
    ExFormat(List,'F3',[p_EndDate]);
    ExFormat(List,'A5',[qFrom['name'],qFrom['dogovor'],qTo['name'],qTo['dogovor']]);
    SetRowHeight(List,5,1,95);
    ExFormat(List,'A7',[p_EndDate]);
    PrintSumCards(list,13,qRnAvias,'np_group_full;dim_name;litr;pricexnds;sumxnds',p_EndDate);
    PrintDopSoglRekv(qFrom,21+qRnAvias.RecordCount,'A',List);
    PrintDopSoglRekv(qTo,21+qRnAvias.RecordCount,'D',List);
  end;
  //****************************************************************************
  procedure PrintRashNak;
  begin
    PrintRashNakHead(List,qFrom,qTo,TOilQuery(qDogFil),IntToStr(DocNum),p_EndDate);
    PrintSumCards(List,22,qRnAvias,'np_group_full;dim_name;litr;pricexnds;sumxnds',p_EndDate,true);
  end;
  //****************************************************************************
  procedure PrintReestr;
  var
    n,i,j,cntNB: integer;
    CurNpg,col,sLitr: string;
    litr,SummXnds,Nds,SummNds: real;   //суммы по количеству и по номиналу
  begin
    litr:=0; SummXnds:=0; Nds:=0; SummNds:=0;
    //шапка
    ExFormat(List,'D2',[DocNum]);
    ExFormat(List,'D4',[DocNum,p_EndDate]);
    ExFormat(List,'D5',[qDogFil['dog'],qDogFil['dog_date']]);
    // реестр
    n := 8;
    //пишем данные
    n:=PuTOilQueryToExcelEnh(XLApp,List,qReestrAvias,n,nil,0,
       'por_number;np_name\i;from_name;card_number;date_;dim_name;litr\s;PriceXnds;SummXnds\s;Nds\s;SummNds\s');
    qReestrAvias.First;
    dec(n);
    while not(qReestrAvias.eof)do
      begin
        litr     := litr     + qReestrAvias['litr'];
        SummXnds := SummXnds + qReestrAvias['SummXnds'];
        Nds      := Nds      + qReestrAvias['Nds'];
        SummNds  := SummNds  + qReestrAvias['SummNds'];
        qReestrAvias.Next;
      end;

    // пишем ВСЕГО по разделу
    DrawNetInExcel(List,1,11,n,n);
    List.Cells[n,'A'] := LangText('VSEGO_po_razdely');
    List.Cells[n,'G'] := mround(litr,2);
    List.Cells[n,'I'] := mround(SummXnds,2);
    List.Cells[n,'J'] := mround(Nds,2);
    List.Cells[n,'K'] := mround(SummNds,2);
    List.Range[GetExcelRange(n,1,n,11)].Font.Bold:=TRUE;
    List.Cells[8,'A'].AutoFilter;
  end;
  //****************************************************************************
  procedure PrintNN(NNId,NNInst:integer);
  var TaxBill: TdmTaxBill;
  begin
    TaxBill := TdmTaxBill.Create;
    try
     with TaxBill do
       begin
         Options.IsCustomPrintSettings:=True;
         Options.Output:=ToScreen;
         Options.PrintSettings.NumOfCopy:=0;
         Excel := TMsExcel.Create(XLApp,List,p_EndDate,tpNN);
         GetTaxBillByNN(NNId,NNInst);
       end;
    finally
      TaxBill.Free;
    end;
  end;
  //****************************************************************************

begin
  vFrom := p_FromInst;
  vTo := p_ToInst;
  qFrom:=TOilQuery.Create(nil);
  qTo:=TOilQuery.Create(nil);
  qFrom.Session:=frmStart.OraSession1;
  qTo.Session:=frmStart.OraSession1;
  try
    GetOrgData(qFrom,vFrom,vFrom);
    GetOrgData(qTo,vTo,vTo);
    DocNum:=trunc(p_EndDate)+1;

    _OpenQueryPar(qNNFil,
      ['date_',        p_BeginDate,
       'from_id',      vFrom,
       'to_id',        vTo]);

    if qRnAvias.RecordCount=0 then exit;

    NNId:=decode([qNNFil.RecordCount,0,0,qNNFil['id']]);
    NNInst:=decode([qNNFil.RecordCount,0,0,qNNFil['inst']]);

    if NeedToSaveNN then
      SaveNN;

    ActivateXLApp('CardFil','CardFil',1,XLApp,List);

    //печать доп. соглашения
    PrintDopSogl;
    cntList := 2;

    //печать расходной
    List:=XLApp.ActiveWorkbook.WorkSheets[cntList];
    PrintRashNak;
    inc(cntList);

    //печать реестра
    XLApp.ActiveWorkbook.WorkSheets[cntList].Select;
    List:=XLApp.ActiveWorkbook.WorkSheets[cntList];
    PrintReestr;
    inc(cntList);

    //печать НН
    XLApp.ActiveWorkbook.WorkSheets[cntList].Select;
    List:=XLApp.ActiveWorkbook.WorkSheets[cntList];
    PrintNN(NNId,NNInst);
    inc(cntList);

    XLApp.DisplayAlerts := FALSE;
  finally
    qFrom.Free;
    qTo.Free;
  end;
end;



procedure TfrmMoveInstTrans.miCardsAviasClick(Sender: TObject);
var
  F: TfrmThirdPartyPrint;
  d: TDateTime;
  vFrom,vTo,AddProgress: integer;
begin
  if q.IsEmpty then exit;
  vFrom := MAIN_ORG.INST;
  vTo   := AVIAS_INST;

  F:=TfrmThirdPartyPrint.Create(Application);
  try
    F.pnlDoc.Visible:=False;
    F.pnlOrgs.Visible:=False;
    F.pnlPrintAll.Visible:=False;
    F.Panel1.Visible := false;
    F.pnlSvodniy.Visible := false;
    //SetPrevMonth(F.deBeginDate,F.deEndDate);
    //SetCurrentMonth(F.deBeginDate,F.deEndDate);
    F.deBeginDate.Date := deFrom.Date;
    F.deEndDate.Date := deTo.Date;
    F.ModalResultOnly:=True;

    if F.ShowModal<>mrOk then exit;  //вказуємо дати

    // перевіряємо карткови договір між юр.особою та Авіасом
    _OpenQueryPar(qDogFil,
        ['from_id',  vFrom,
         'to_id',    AVIAS_INST,
         'FromDate', F.deBeginDate.Date,
         'ToDate',   F.deEndDate.Date]);
    if qDogFil.IsEmpty then
      begin
        MessageDlg(Format('За вказаний період не знайдено карткового договору між %s і %s!'+#13#10+
                          'Необхідно завести один картковий договір на останній день місяця. Позиції договору вибрати будь-які.',
                          [GetOrgName(vFrom,vFrom),GetOrgName(AVIAS_INST,AVIAS_INST)]),
                   mtError, [mbCancel], 0);
        exit;
      end;
    F.deBeginDate.Enabled := False;  // дізейблимо поля дат
    F.deEndDate.Enabled := False;
    _OpenQueryPar(qCardGetPrice,  //обчислюємо середні ціни за місяць по картах та пропонуємо їх
        ['BeginDate',    F.deBeginDate.Date,
         'EndDate',      F.deEndDate.Date,
         'obl_id',       vFrom]);

    F.dbgNpgPrice.DataSource := dsCardGetPrice;
    F.pNpgPriceGrid.Visible := true;   //даємо звірям можливість редагувати середні ціни по СК для видаткових
    F.bbPrint.Caption := '&Продовжити';
    F.bbPrint.Font.Color := clNavy;

    if F.ShowModal<>mrOk then exit;  //редагують та тиснуть на "Продовжити" (ціни записуються в ov.SetNpgPrice())

    _OpenQueryPar(qRnAvias,
        ['BeginDate',  F.deBeginDate.Date,
         'EndDate',    F.deEndDate.Date]);

    _OpenQueryPar(qReestrAvias,
        ['BeginDate',  F.deBeginDate.Date,
         'EndDate',    F.deEndDate.Date]);

    PrintCardFilDocs(F.deBeginDate.Date, F.deEndDate.Date, vFrom, vTo);
        
  finally
  end;
end;


procedure TfrmMoveInstTrans.PrintSumCards(
  p_List:Variant;
  p_FirstLine: integer;
  p_Q: TOilQuery;
  p_FieldList: string;
  p_Date: TDateTime = 0;
  p_SumPropis: Boolean = false);
var
  i: integer;
  SumWithNds,SumNoNds,SumNds,LastValue: real;
begin
  with p_Q do begin
    First;
    i:=p_FirstLine;
    SumWithNds:=0;
    SumNoNds:=0;
    SumNDS:=0;
    LastValue:=0;
    while not Eof do
      begin
        p_List.Rows[i+1].EntireRow.Insert;
        PutArrayToExcel(p_List,i,2,FieldValues[p_FieldList]);
        LastValue:=nvl(FieldValues['sumxnds'],0);
        SumWithNds:=SumWithNds+nvl(FieldValues['sumnds'],0);
        SumNoNds:=SumNoNds+nvl(FieldValues['sumXnds'],0);
        SumNDS:=SumNds+nvl(FieldValues['nds'],0);
        inc(i);
        p_Q.Next;
      end;
      
    if p_Date<>0 then
      SumNDS := GetNds_WithNds(SumWithNds, p_Date);
    p_List.Cells[i-1,'F']:=LastValue+SumWithNds-SumNds-SumNoNds;  //корекція останньої позиції
    if p_Date<>0 then
      SumNoNds := GetNoNds_WithNds(SumWithNds, p_Date, 2);

    p_List.Cells[i+3,'F']:=SumWithNds;
    p_List.Cells[i+2,'F']:=SumNDS;
    p_List.Cells[i+1,'F']:=SumNoNds;
    if p_SumPropis then
      ExFormat(p_List,i+5,'B',[Money2Words(SumWithNds)]);
  end;
end;

procedure TfrmMoveInstTrans.PrintDopSoglRekv(
  p_Q: TOilQuery;
  p_FirstLine: integer;
  p_Column: string;
  p_List:variant);
begin
  p_List.Cells[p_FirstLine,p_Column]:=p_Q.FieldByName('name').AsString;
  p_List.Cells[p_FirstLine+1,p_Column]:=p_Q.FieldByName('addr').AsString;
  p_List.Cells[p_FirstLine+2,p_Column]:=LangText('R/S')+' '+p_Q.FieldByName('rach_chet').AsString;
  p_List.Cells[p_FirstLine+3,p_Column]:=TranslateText('в ')+p_Q.FieldByName('bank_name').AsString;
  p_List.Cells[p_FirstLine+4,p_Column]:=TranslateText('МФО ')+p_Q.FieldByName('mfo').AsString;
  p_List.Cells[p_FirstLine+5,p_Column]:=TranslateText('Код ')+LangText('EDRPOU')+p_Q.FieldByName('id_num').AsString;
  p_List.Cells[p_FirstLine+6,p_Column]:=LangText('INN')+' '+p_Q.FieldByName('nal_num').AsString;
  p_List.Cells[p_FirstLine+7,p_Column]:=LangText('Sv_plat_NDS_NUM')+p_Q.FieldByName('svid_num').AsString;
  p_List.Cells[p_FirstLine+9,p_Column]:=p_Q.FieldByName('boss').AsString;
end;


procedure TfrmMoveInstTrans.PrintRashNakHead(
  p_List:Variant;
  qFrom,qTo,qDog: TOilQuery;
  p_DocNum: string;
  p_Date: TDateTime);
begin
  ExFormat(p_List,'C1',[qFrom['name']]);
  ExFormat(p_List,'B2',[qFrom['addr']]);
  ExFormat(p_List,'C3',[qFrom['rach_chet'],qFrom['mfo']]);
  ExFormat(p_List,'B4',[qFrom['svid_num']]);
  ExFormat(p_List,'B5',[qFrom['nal_num']]);
  ExFormat(p_List,'B7',[p_DocNum,p_Date]);
  ExFormat(p_List,'C10',[qTo['name']]);
  ExFormat(p_List,'B13',[qTo['svid_num']]);
  ExFormat(p_List,'B14',[qTo['nal_num']]);
  ExFormat(p_List,'C15',[qDog['dog'],qDog['dog_date']]);
  ExFormat(p_List,'B17',[p_DocNum,p_Date]);
end;


procedure TfrmMoveInstTrans.qCardGetPriceCalcFields(DataSet: TDataSet);
begin
  inherited;
  qCardGetPriceSumNds.AsFloat := MRound(qCardGetPricePrice.AsFloat * qCardGetPriceLitr.AsFloat, 2);
end;

end.
