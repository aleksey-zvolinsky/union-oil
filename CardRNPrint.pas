unit CardRNPrint;

interface

uses
  ComObj, Excel8TLB, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, ComCtrls, ActiveX, Db, DBTables, Grids, DBGrids, StdCtrls,
  OleCtrls, Mask, ToolEdit, CurrEdit, RXCtrls, RXDBCtrl,Ora, uCommonForm,uOilQuery,uOilStoredProc,
  MemDS, DBAccess, uMessageDlgExt;

type
  TDocExistType = (dtNew, dtExists);

type
  TDocType = (dtRequest, dtInvoiceLS);

type
  TCardRNPrintForm = class(TCommonForm)
    bbCancel: TBitBtn;
    bbPrint: TBitBtn;
    pButtons: TPanel;
    qReport: TOilQuery;
    qRn: TOilQuery;
    qReestr: TOilQuery;
    lHide: TLabel;
    qWork: TOilQuery;
    qRequest: TOilQuery;
    nbForms: TNotebook;
    Label8: TLabel;
    Label9: TLabel;
    lRnOrg: TLabel;
    sbRnAuto: TSpeedButton;
    Label6: TLabel;
    lDocDate: TLabel;
    deBeginDate: TDateEdit;
    deEndDate: TDateEdit;
    ceRnToName: TComboEdit;
    RnNumber: TEdit;
    deCurDate: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    lReestrOrg: TLabel;
    DateReestr1: TDateEdit;
    DateReestr2: TDateEdit;
    ceReestrToName: TComboEdit;
    gb: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edSer: TEdit;
    edNum: TEdit;
    edFromWho: TEdit;
    ceCardPrice: TRxCalcEdit;
    deDate: TDateEdit;
    Label4: TLabel;
    qRnLS: TOilQuery;
    qReestrLS: TOilQuery;
    Label3: TLabel;
    lDocType: TLabel;
    qInvoiceLS: TOilQuery;
    qReportLS: TOilQuery;
    gbRnProps: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    deRnDate: TDateEdit;
    sbCBlankAuto: TSpeedButton;
    edCBlank: TEdit;
    Bevel1: TBevel;
    qAlienNN_: TOilQuery;
    qAlienRn: TOilQuery;
    qAlienNN: TOilQuery;
    qAlienOrg: TOilQuery;
    cbWithPart: TCheckBox;
    qRnPart: TOilQuery;
    qRnLSPart: TOilQuery;
    cbWithSign: TCheckBox;
    qGetDogDetail: TOilQuery;
    deReqDogDate: TDateEdit;
    l2: TLabel;
    l1: TLabel;
    ceReqDog: TComboEdit;
    l3: TLabel;
    deReqDBegin: TDateEdit;
    l4: TLabel;
    deReqDEnd: TDateEdit;
    ceReqOrg: TComboEdit;
    l5: TLabel;
    sbReqOrgClear: TSpeedButton;
    sbReqNAuto: TSpeedButton;
    sbReqDogClear: TSpeedButton;
    lLastDog: TLabel;
    procedure bbPrintClick(Sender: TObject);
    procedure ceReestrToNameButtonClick(Sender: TObject);
    procedure ceRnToNameButtonClick(Sender: TObject);
    procedure sbRnAutoClick(Sender: TObject);
    procedure deBeginDateAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure deEndDateAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure FormShow(Sender: TObject);
    procedure sbCBlankAutoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ceReqOrgButtonClick(Sender: TObject);
    procedure ceReqDogButtonClick(Sender: TObject);
    procedure sbReqOrgClearClick(Sender: TObject);
    procedure sbReqDogClearClick(Sender: TObject);
    procedure sbReqNAutoClick(Sender: TObject);
  private
    FFromId, FFromInst : integer; // От кого
    procedure MakeReportDoc();
    procedure MakeReportOurRashNakl;
    procedure MakeReportOurReestrNakl;
    procedure MakeDelDoc();    
    procedure SetReportNumber(AValue:integer);
    function  GetFromId: integer;
    function  GetFromInst: integer;
  public
    ReqOrgID, ReqOrgINST, ReqDogID, ReqDogINST: integer;
    DocType: TDocType;

    CardScheme: (EK, LS);
    InvoiceType, RashNakType: TDocExistType;
    IsAlien: Boolean;
    OrgId, OrgInst, // Кому

    FReportNumber, RequestID, RequestINST: Integer;
    CleanZNum, DocNumber: String;
    Date_: TDateTime;
    NN_Id, NN_Inst, NN_Num : Integer;
    procedure PrintAlienNN(List: Variant; NNId, NNInst: Integer);
    procedure GetDocNumber(); // знаходження номера останнього договору
    procedure RequestReadOnly();
    property ReportNumber:integer read FReportNumber write SetReportNumber;
    property FromId:integer read GetFromId write FFromId;
    property FromInst:integer read GetFromInst write FFromInst;
  end;  

implementation

uses  PrihCardRef, Progr, Main, oilstd, ChooseOrg, UDbFunc, PrihCard,
  TaxBillPrint, InvoicePrint, MoneyFunc, ExFunc, uExeSql, ExcelFunc, RashNakPrint,
  uCardRequest, Dog, DogRef, uBill, Memo;
  
{$R *.DFM}

procedure TCardRNPrintForm.bbPrintClick(Sender: TObject);
begin
  case ReportNumber of
    2 : MakeReportDoc(); // ЕК та ЛС, залежить від DocType
    3 : MakeReportOurRashNakl();
    4 : MakeReportOurReestrNakl();
    7 : MakeDelDoc();
  end;
end;

procedure TCardRNPrintForm.MakeDelDoc();
begin
  if MessageDlg(TranslateText('Подтвердите удаление'),mtWarning, [mbYes,mbNo],0) = mrNo then Exit;
  if (deBeginDate.Date = 0) or (deBeginDate.Date = 0)
     then raise Exception.Create(TranslateText('Не заданы даты для формирования!'));

  if ceRnToName.Text = ''
   then raise Exception.Create(TranslateText('Не определен клиент!'));

  if RnNumber.Text = ''
    then raise Exception.Create(TranslateText('Не введен номер документа!'));

  if deEndDate.Date < deBeginDate.Date
   then raise Exception.Create(TranslateText('Неправильно задан период !'));

  qWork.Close;
  qWork.SQL.Text :=
    'update Card_Transaction set Doc_Number = null, Doc_Date = null' +
    ' where DATE_ >= '''+ FormatDateTime('dd.mm.yyyy', deBeginDate.Date) +'''' +
    '   and DATE_ <= '''+ FormatDateTime('dd.mm.yyyy', deEndDate.Date) +'''' +
    '   and To_Id = '+ IntToStr(OrgId) +' and To_Inst = '+ IntToStr(OrgInst) +
    '   and Id_Схемы_Обсл = 2 and Doc_Number = '''+ RnNumber.Text +'''';
  qWork.ExecSQL;
  MessageDlg(TranslateText('Документ №')+RnNumber.Text+TranslateText(' успешно удален!'),mtInformation, [mbOk] ,0);
end;

procedure TCardRNPrintForm.ceReestrToNameButtonClick(Sender: TObject);
var
 vId, vInst: Integer;
 vName: String;
begin
  if ChooseOrg.CaptureOrg(3, MAIN_ID, INST, 'yyy', vId, vInst, vName) then
  begin
  ceReestrToName.Text := vName;
  OrgId := vId;
  OrgInst := vInst;
  end;
end;


procedure TCardRNPrintForm.ceRnToNameButtonClick(Sender: TObject);
var
 vId, vInst: Integer;
 vName: String;
begin
  if ChooseOrg.CaptureOrg(3, MAIN_ID, INST, 'yyy', vId, vInst, vName) then
  begin
    ceRnToName.Text := vName;
    OrgId := vId;
    OrgInst := vInst;
  end;
end;

procedure TCardRNPrintForm.sbRnAutoClick(Sender: TObject);
begin
RnNumber.Clear;
RnNumber.ReadOnly := sbRnAuto.Down;
RnNumber.ShowHint := sbRnAuto.Down;

if sbRnAuto.Down then
  begin
  RnNumber.Color:=clBtnFace;
  RnNumber.Hint:=TranslateText('Будет выбран следующий номер по порядку');
  end
 else
  begin
  RnNumber.Color:=clWindow;
  RnNumber.Hint:='';
  end;
end;

procedure TCardRNPrintForm.MakeReportOurReestrNakl;
var

CurPos, BeginNakl, Counter: Integer;
Progr: TProgrForm;
NuklNum: String;
begin
  try
  if DateReestr1.Date = 0
   then DateReestr1.Date := Date;

  if DateReestr2.Date = 0
   then DateReestr2.Date := Date;

  if ceReestrToName.Text = ''
   then raise Exception.Create(TranslateText('Не определен клиент!'));

  Application.CreateForm(TProgrForm,progr);
  Progr.Show;
  Progr.repaint;

  // Для лимитной схемы подставим новый запрос
  if CardScheme = LS
    then qReestr.SQL.Text := qReestrLS.SQL.Text;


  qReestr.Close;
  qReestr.ParamByName('OrgId').AsInteger:= OrgId;
  qReestr.ParamByName('OrgInst').AsInteger := OrgInst;
  qReestr.ParamByName('BeginDate').AsDate := DateReestr1.Date;
  qReestr.ParamByName('EndDate').AsDate := DateReestr2.Date;
  _OpenQuery(qReestr);

  if qReestr.IsEmpty
   then raise Exception.Create(TranslateText('Ни одной записи за данный период!'));

  if CardScheme = LS
    then qReport.SQL.Text := qReportLS.SQL.Text;
  qReport.Close;
  qReport.ParamByName('OrgId').AsInteger := OrgId;
  qReport.ParamByName('OrgInst').AsInteger := OrgInst;
  _OpenQuery(qReport);

  Progr.AddProgress(5);
  ActivateXLApp('ReestrRN','ReestrRN',1,MSExcel,List);

  CurPos := 16;
  BeginNakl := 16;
  Counter:= 1;

  List.Cells[2,'F'].Value := qReport.FieldbyName('from_name').AsString;

  ExFormat(List,4,'F',
    [qReport.FieldByName('From_Svid_Num').AsString]);
  ExFormat(List,5,'F',
    [qReport.FieldByName('From_Nal_Num').AsString]);
  ExFormat(List,7,'F',
    [DateReestr1.Text,
     DateReestr2.Text]);
  ExFormat(List,9,'F',
    [ceReestrToName.Text]);
  ExFormat(List,11,'F',
    [qReport.FieldByName('To_svid_num').AsString]);
  ExFormat(List,12,'F',
    [qReport.FieldByName('To_Nal_Num').AsString]);

  Progr.MaxValue := 30 + qReestr.RecordCount;

while not qReestr.Eof do
  begin
  List.Cells[CurPos, 1].Value := Counter;
  List.Cells[CurPos, 2].Value := qReestr.FieldByName('NpName').AsString;
  List.Cells[CurPos, 4].Value := qReport.FieldByName('Dog').AsString;
  List.Cells[CurPos, 5].Value := qReport.FieldByName('Dog_Date').Value;
  List.Cells[CurPos, 6].Value := qReestr.FieldByName('Plus_Num').AsString;
  List.Cells[CurPos, 7].Value := qReestr.FieldByName('Plus_Date').AsString;
  List.Cells[CurPos, 8].Value := qReestr.FieldByName('Minus_Num').AsString;
  List.Cells[CurPos, 9].Value := qReestr.FieldByName('Minus_Date').Value;
  List.Cells[CurPos, 10].Value := LangText('Litr');
  List.Cells[CurPos, 11].Value := qReestr.FieldByName('CountLitr').Value;
  List.Cells[CurPos, 12].Value := qReestr.FieldByName('PriceNoNds').Value;
  List.Cells[CurPos, 13].Value := qReestr.FieldByName('SumNoNds').Value;
  List.Cells[CurPos, 14].Value := qReestr.FieldByName('Nds').Value;
  List.Cells[CurPos, 15].Value := qReestr.FieldByName('SumNds').Value;
  inc(CurPos);
  inc(Counter);
  NuklNum := qReestr.FieldByName('Minus_Num').AsString;
  qReestr.Next;
  if (NuklNum <> qReestr.FieldByName('Minus_Num').AsString)or(qReestr.Eof) then
    begin
    List.Cells[CurPos, 'B'].Value := LangText('Itogo')+TranslateText(' по ')+LangText('rashodnoj_nakladnoi')+' № ' + NuklNum;
    List.Cells[CurPos, 'B'].HorizontalAlignment := xlleft;
    List.Range['A' + IntToStr(CurPos) + ':O' + IntToStr(CurPos)].Font.Bold := True;
    List.Cells[CurPos, 'A'].HorizontalAlignment := xlleft;
    List.Cells[CurPos, 'K'].Value := '=SubTotal(9,K' + IntToStr(BeginNakl)+ ':K' + IntToStr(CurPos - 1) + ')';
    List.Cells[CurPos, 'M'].Value := '=SubTotal(9,M' + IntToStr(BeginNakl)+ ':M' + IntToStr(CurPos - 1) + ')';
    List.Cells[CurPos, 'N'].Value := '=SubTotal(9,N' + IntToStr(BeginNakl)+ ':N' + IntToStr(CurPos - 1) + ')';
    List.Cells[CurPos, 'O'].Value := '=SubTotal(9,O' + IntToStr(BeginNakl)+ ':O' + IntToStr(CurPos - 1) + ')';
    Inc(CurPos);
    BeginNakl := CurPos;
    end;
  end;

  List.Cells[CurPos, 'B'].Value := LangText('Vsego')+TranslateText(' по документу') ;
  List.Cells[CurPos, 'B'].HorizontalAlignment := xlleft;
  List.Range['A' + IntToStr(CurPos) + ':O' + IntToStr(CurPos)].Font.Bold := True;
  List.Cells[CurPos, 'A'].HorizontalAlignment := xlleft;
  List.Cells[CurPos, 'K'].Value := '=SubTotal(9,K16:K' + IntToStr(CurPos - 1) + ')';
  List.Cells[CurPos, 'M'].Value := '=SubTotal(9,M16:M' + IntToStr(CurPos - 1) + ')';
  List.Cells[CurPos, 'N'].Value := '=SubTotal(9,N16:N' + IntToStr(CurPos - 1) + ')';
  List.Cells[CurPos, 'O'].Value := '=SubTotal(9,O16:O' + IntToStr(CurPos - 1) + ')';

  List.Range['A16:O' + IntToStr(CurPos)].Borders.LineStyle := xlContinuous;

  Progr.AddProgress(5);

  List.Range['A' + IntToStr(CurPos + 2) + ':O' + IntToStr(CurPos + 2)].Font.Bold := True;
  List.Cells[CurPos + 2, 'B'].Value := LangText('Obschaya')+' '+LangText('sum')+LangText('S_NDS')+': ' + NumStrGrn(List.Cells[CurPos, 'O'].Value, TranslateText('грн'), TranslateText('коп'));
  List.Cells[CurPos + 2, 'B'].HorizontalAlignment := xlleft;

  List.Rows[CurPos + 4].Font.Size := 11;
  List.Rows[CurPos + 4].HorizontalAlignment := xlleft;
  List.Cells[CurPos + 4, 2].Value := LangText('Peredal')+' ________________';
  List.Cells[CurPos + 4, 9].Value := LangText('Prinial')+' _________________';

  Progr.AddProgress(5);
  Progr.Free;

  MSExcel.Visible := True;
  MSExcel.ScreenUpdating := True;
  except on E: Exception do
    begin
    Progr.Free;
    ShowMessage(E.Message);
    end;
  end;
end;

procedure TCardRNPrintForm.MakeReportOurRashNakl;
const
  cCurPos=15;
var
  NumOfNakl: Integer;
  Progr: TProgrForm;
  DateZ, ExpenseDate,DocDate: TDate;
  NumZ, AdditionText,DocNumber,DocPeriod: String;
  PriceNdsDis : currency;
  strPart:string;
  RashNak:TdmRashNakPrint;
  //----------------------------------------------------------------------------
  function isNewRn:boolean;
  begin
    result:=((NumZ <> qRn.FieldByName('Plus_Num').AsString) or (DateZ <> qRn.FieldByName('Plus_Date').AsDateTime) and (CardScheme = EK))  or
      ((NumZ <> qRn.FieldByName('Plus_Num').AsString) or (DateZ <> qRn.FieldByName('Plus_Date').AsDateTime) or (qRn.FieldByName('Date_').AsDateTime <> ExpenseDate) and (CardScheme = LS))
  end;
  //----------------------------------------------------------------------------
begin
  if (not sbRnAuto.down) and (RnNumber.Text = '')
   then raise Exception.Create(TranslateText('Необходимо ввести номер расходной'));

  if deBeginDate.Date = 0
   then deBeginDate.Date := Date;

  if deEndDate.Date = 0
   then deEndDate.Date := Date;

  if deEndDate.Date < deBeginDate.Date
   then raise Exception.Create(TranslateText('Неправильно задан период !'));

  if CeRnToName.Text = ''
   then raise Exception.Create(TranslateText('Необходимо выбрать клинта'));

  qWork.Close;
  qWork.SQL.Text := 'select Id, Inst from Oil_Dog ' +
      ' where State = ''Y'' ' +
        ' and To_ = :to_id ' + 
        ' and To_Inst = :to_inst ' +
        ' and Dog_Type = ''K''';
  _OpenQueryPar(qWork,
    ['to_id', OrgId,
     'to_inst', OrgInst]);
  if qWork.IsEmpty then
    raise Exception.Create(TranslateText('Договор с выбранным клиентом не существует!'));

  if sbRnAuto.Down then
    RnNumber.Text := IntToStr(GetSeqNextVal('S_Oil_Dog_RN_Num'));

  //проверка транзакций за предидущий период
  if (CardScheme = LS) and (RashNakType=dtNew) then
  begin
    qWork.Close;
    qWork.SQL.Text := ' select min(date_) as FromDate from Card_Transaction ' +
       ' where Date_ < to_date(:date_,''DD.MM.YYYY'') ' +
       ' and date_ >= to_date(ov.GetVal(''inst_move_date'')) '+
       ' and Gr_Card_Num is not null ' +
       ' and To_Id = :to_id ' +
       ' and To_Inst = :to_inst ' + 
       ' and Id_Схемы_Обсл = 2'+
       ' and Doc_Number is null';
    _OpenQueryPar(qWork,
      ['date_',FormatDateTime('dd.mm.yyyy', deBeginDate.Date),
       'to_id',OrgId,
       'to_inst',OrgInst]);
    if  (not qWork.isEmpty) and (qWork.FieldByName('FromDate').asString <> '') then
       if MessageDlg(TranslateText('Найдены транзакции за предидущий период, по которым не выписана расходная накладная.')+#13+#10+
          TranslateText('Распечатать по ним документы?'),mtInformation,[mbYes,mbNo],0) = mrYes
        then deBeginDate.Date := qWork.FieldByName('FromDate').asDateTime
        else Abort;
    Application.ProcessMessages;
    //пепеписать номер расходной
    qWork.Close;
    qWork.SQL.Text := ' update Card_Transaction ' +
         ' set Doc_Number = decode(date_,to_date(:end_date,''DD.MM.YYYY''),:rn_number,:rn_number||''/''||substr(date_,1,2)), ' +
             ' Doc_Date = date_ ' +
       ' where DATE_ between to_date(:begin_date,''DD.MM.YYYY'') and to_date(:end_date,''DD.MM.YYYY'') ' +
         ' and Gr_Card_Num is not null ' +
         ' and To_Id = :to_id ' +
         ' and To_Inst = :to_inst ' +
         ' and Doc_Number is null '+
         ' and id_схемы_обсл = 2 ';
    qWork.ParamByName('begin_date').AsString := FormatDateTime('dd.mm.yyyy', deBeginDate.Date);
    qWork.ParamByName('end_date').AsString := FormatDateTime('dd.mm.yyyy', deEndDate.Date);
    qWork.ParamByName('to_id').AsInteger := OrgId;
    qWork.ParamByName('to_inst').AsInteger := OrgInst;
    qWork.ParamByName('rn_number').AsString := RnNumber.Text;
   // ShowMessage(qWork.SQL.Text);
    qWork.ExecSQL;
  end;
  
  if CardScheme = EK then
  begin
    //Обнулить номер расходной
    qWork.Close;
    qWork.SQL.Text := ' update Card_Transaction ' +
          ' set Doc_Number = to_char(null), ' +
              ' Doc_Date = to_date(null) ' +
        ' where get_card_oper_num(gr_card_num,номер_терминала,причина_изменения,oper_type,id_схемы_обсл,trn_guid) in (9,10) ' +
          ' and Doc_Number = :rn_number ' +
          ' and To_Id = :to_id ' +
          ' and To_Inst = :to_inst ';
    qWork.ParamByName('to_id').AsInteger := OrgId;
    qWork.ParamByName('to_inst').AsInteger := OrgInst;
    qWork.ParamByName('rn_number').AsString := RnNumber.Text;
    qWork.ExecSQL;

    //пепеписать номер расходной
    qWork.Close;
    qWork.SQL.Text := ' update Card_Transaction ' +
         ' set Doc_Number = :rn_number, ' +
             ' Doc_Date = to_date(:current_date,''DD.MM.YYYY'') ' +
       ' where DATE_ between to_date(:begin_date,''DD.MM.YYYY'') and to_date(:end_date,''DD.MM.YYYY'') ' +
         ' and get_card_oper_num(gr_card_num,номер_терминала,причина_изменения,oper_type,id_схемы_обсл,trn_guid) in (9,10) ' +
         ' and Gr_Card_Num is not null ' +
         ' and To_Id = :to_id ' +
         ' and To_Inst = :to_inst ';
    qWork.ParamByName('current_date').AsString := FormatDateTime('dd.mm.yyyy', deCurDate.Date);
    qWork.ParamByName('begin_date').AsString := FormatDateTime('dd.mm.yyyy', deBeginDate.Date);
    qWork.ParamByName('end_date').AsString := FormatDateTime('dd.mm.yyyy', deEndDate.Date);
    qWork.ParamByName('to_id').AsInteger := OrgId;
    qWork.ParamByName('to_inst').AsInteger := OrgInst;
    qWork.ParamByName('rn_number').AsString := RnNumber.Text;
    qWork.ExecSQL;
  end;  
  // Открываем запросы и начинаем формировать
  try
    Application.CreateForm(TProgrForm,progr);

    Progr.Show;
    Progr.Repaint;

    case CardScheme of
      LS: //для ЛС нужно подтягивать цены с договора
      begin
        if cbWithPart.Checked then
          qRn.SQL.Text := qRnLSPart.SQL.Text
        else
          qRn.SQL.Text := qRnLS.SQL.Text  //подставляем другой SQL для ЛС
      end;
      EK:
      begin
        if cbWithPart.Checked then
          qRn.SQL.Text := qRnPart.SQL.Text//подставляем другой SQL для простых РН с партиями
        else
          qRn.SQL.Text := qRn.SQL.Text;//типа оставляем тот же запрос
      end;
    end;
    if cbWithPart.Checked then
      DefineRepDates(deBeginDate.Date-1,deEndDate.Date+1);    

    qRn.Close;
    qRn.ParamByName('OrgId').AsInteger := OrgId;
    qRn.ParamByName('OrgInst').AsInteger := OrgInst;
    qRn.ParamByName('BeginDate').AsDate := deBeginDate.Date;
    qRn.ParamByName('EndDate').AsDate := deEndDate.Date;
    if CardScheme =  LS then
      qRn.ParamByName('Doc_Number').asString := RnNumber.Text;
    //ShowMessage(qRn.SQL.Text);
    _OpenQuery(qRn);

    if (qRn.FieldByName('Plus_Num').IsNull) or (qRn.FieldByName('Plus_Date').IsNull)
     then
     if CardScheme = LS then
       raise Exception.Create(TranslateText('Для данного клиента не заведен договор обслуживания по ЛС!'))
     else
       raise Exception.Create(TranslateText('Не распечатано ни одной заявки по пополнению данной карты!'));
    (**  *)

    DateZ := 0;
    NumZ := '';
    ExpenseDate := 0;
    // Считаем кол-во расходных
    NumOfNakl:=0;
    while (not qRn.Eof) do
    begin
      if isNewRn then
        Inc(NumOfNakl);//Кол-во расходных накладных
      NumZ := qRn.FieldByName('Plus_Num').AsString;
      DateZ := qRn.FieldByName('Plus_Date').AsDateTime;
      ExpenseDate :=qRn.FieldByName('Date_').AsDateTime;
      qRn.Next;
    end;
    if NumOfNakl > 1 then
      ShowMessage(TranslateText('Будет распечатано ') + IntToStr(NumOfNakl) + TranslateText(' накладных !'));
    // Печать расходных
    DateZ := 0;
    NumZ := '';
    ExpenseDate := 0;
    qRn.First;
    repeat
      // Если новая, то достаем номера
      if isNewRn then
      begin
        //Достаем номера расходных
        if (NumOfNakl<>1) then
          DocNumber:=qRn.FieldByName('Doc_Number').asString + '/' + qRn.FieldByName('Plus_Num').AsString
        else
          DocNumber:=qRn.FieldByName('Doc_Number').asString;
        DocDate:=qRn.FieldByName('Doc_Date').AsDateTime;
        //Достаем период если необходим
        if (deBeginDate.Date <> deEndDate.Date) and (CardScheme =  EK)then
          DocPeriod:=LangText('s')+' ' + deBeginDate.Text + TranslateText(' по ') + deEndDate.Text
        else
          DocPeriod:='';
        if CardScheme = LS
          then AdditionText := ', '+LangText('dopolnitelnoe_soglashenie')+'№' + qRn.FieldByName('Plus_Num').AsString + LangText('Ot') + qRn.FieldByName('Plus_Date').AsString
          else AdditionText := ', '+LangText('Prilozhenie')+TranslateText('(заявка) №') + qRn.FieldByName('Plus_Num').AsString + LangText('Ot') + qRn.FieldByName('Plus_Date').AsString;
        //Инициализируем класс РН
        RashNak:=TdmRashNakPrint.Create(
          DocNumber,
          DocDate,
          DocPeriod,
          AdditionText,
          FromId,
          FromInst,
          OrgId,
          OrgInst,
          decode([CardScheme,EK,rnCardEK,LS,rnCardLS,rnCardEK])
          );
      end;
      if qRn.Fields.FindField('part_dog')<>nil then
        strPart:=qRn.FieldByName('part_dog').AsString
      else
        strPart:='';
       if( qRn.FindField('PriceNdsDis')<>nil )and( CardScheme = LS )then
        PriceNdsDis:=qRn.FieldByName('PriceNdsDis').Value
      else
        PriceNdsDis:=qRn.FieldByName('PriceNds').Value;
      RashNak.AddPosition(
        qRn.FieldByName('Filial').AsString,
        qRn.FieldByName('Azs').AsString,
        qRn.FieldByName('NpName').AsString,
        qRn.FieldByName('CardNum').AsString,
        ''''+qRn.FieldByName('CheckNum').AsString,
        qRn.FieldByName('Date_').AsString,
        LangText('Litr'),
        qRn.FieldByName('PriceNds').Value,
        PriceNdsDis,
        qRn.FieldByName('CountLitr').AsFloat,
        strPart,
        qRn.FieldByName('share_id').AsInteger <> 0
      );
      NumZ := qRn.FieldByName('Plus_Num').AsString;
      DateZ := qRn.FieldByName('Plus_Date').AsDateTime;
      ExpenseDate :=  qRn.FieldByName('Date_').AsDateTime;
      qRn.Next;
      if isNewRN or qRn.Eof then
      begin
        RashNak.PutToExcel(0, '', false, 1, cbWithSign.Checked);
        RashNak.Free;
      end;
    until qRn.Eof;
    Progr.Free;
  except on E: Exception do
    begin
      Progr.Free;
      ShowMessage(TranslateText('ОШИБКА формирования документа: ') + #13#10 + E.Message);
    end;
  end;
end;

procedure TCardRNPrintForm.PrintAlienNN(List: Variant; NNId, NNInst: Integer);
var
  i: Integer;
  q:TOilQuery;
begin
qWork.Close;
qWork.SQL.Text := 'select * from Oil_Sale_Book where Id = ' + IntToStr(NNId) + ' and Inst = ' + IntToStr(NNInst);
_OpenQuery(qWork);

List.Cells[7,'K'] := FormatDateTime('dd.mm.yyyy', qWork.FieldByName('S_Date').AsDateTime);

if (FILIAL_NUMBER <> '')and(FILIAL_NUMBER <> '0')
 then List.Cells[7, 'V'] := qWork.FieldByName('Num').AsString + '/' + FILIAL_NUMBER
 else List.Cells[7, 'V'] := qWork.FieldByName('Num').AsString;

if CardScheme = LS
 then qReport.SQL.Text := qReportLS.SQL.Text;
qReport.Close;
qReport.ParamByName('OrgId').AsInteger := qWork.FieldByName('Organ').AsInteger;
qReport.ParamByName('OrgInst').AsInteger := qWork.FieldByName('Organ_Inst').AsInteger;
_OpenQuery(qReport);

qAlienOrg.Close;
qAlienOrg.ParamByName('OrgId').AsInteger := qWork.FieldByName('Organ').AsInteger;
qAlienOrg.ParamByName('OrgInst').AsInteger := qWork.FieldByName('Organ_Inst').AsInteger;
_OpenQuery(qAlienOrg);

//реквизиты
if NN_WITH_UPPER_REKVIZIT = 'Y' then
begin
  List.Cells[9, 'G'] := qReport.FieldByName('Up_From_Name').AsString;
  List.Cells[15, 'I'] := qReport.FieldByName('Up_From_Addr').AsString;
  List.Cells[16, 'I'] := qReport.FieldByName('Up_From_Phone').AsString;
  List.cells[17, 'G'] := qReport.FieldByName('Up_From_Svid_Num').AsString;
  for I := 1 to Length(qReport.FieldByName('Up_From_Nal_Num').AsString)
    do List.Cells[13, 2 + I] := qReport.FieldByName('Up_From_Nal_Num').AsString[i];
end
else if NN_WITH_UPPER_REKVIZIT = 'ALFA' then
begin
  q := TOilQuery.Create(nil);
  if GetOrgData(q,ALFANAFTA,ALFANAFTA) then
  begin
    List.Cells[9, 'G'] :=  q['NAME'];
    List.Cells[15, 'I'] := q['ADDR'];
    List.Cells[16, 'I'] := q['PHONE'];
    List.cells[17, 'G'] := q['SVID_NUM'];
    for I := 1 to Length(q['NAL_NUM'])
      do List.Cells[13, 2 + I] := q['NAL_NUM'][i];
  end;
  q.Free;
end
else
begin
  List.Cells[9,'G'] := qReport.FieldByName('From_Name').AsString;
  List.cells[17,'G'] := qReport.FieldByName('From_Svid_Num').AsString;
  for I := 1 to Length(qReport.FieldByName('From_Nal_Num').AsString)
    do List.Cells[13, 2 + I] := qReport.FieldByName('From_Nal_Num').AsString[i];
end;

// адреса і телефон
List.Cells[16,'I'] := qReport.FieldByName('From_Phone').AsString;
if PRINT_UPPER_ADRESS = 'NO' then
  List.Cells[15,'I'] := qReport.FieldByName('From_Addr').AsString
else
  if (PRINT_UPPER_ADRESS = 'ALFA') and (qReport.FieldByName('From_').AsInteger = MAIN_ORG.INST) then
  begin
    q := TOilQuery.Create(nil);
    if GetOrgData(q, ALFANAFTA, ALFANAFTA) then
      List.Cells[15,'I'] := q['ADDR'] +#10+
        decode([MAIN_ORG.ORG_TYPE, 3, qReport.FieldByName('UP_From_Addr').AsString,
          qReport.FieldByName('From_Addr').AsString]);
    if MAIN_ORG.ORG_TYPE = 3 then
      List.Cells[16,'I'] := qReport.FieldByName('UP_From_Phone').AsString;
    q.Free;
  end
  else
    if (PRINT_UPPER_ADRESS = 'YES') and (qReport.FieldByName('From_').AsInteger = MAIN_ORG.INST) then
      List.Cells[15,'I'] := qReport.FieldByName('UP_From_Addr').AsString +#10+ qReport.FieldByName('From_Addr').AsString;

// Адресс клиента-филиала в зависимость от галочки.
IF(0<GetSqlValue('select count(*) from v_org where id = '+qAlienOrg.ParamByName('OrgId').AsString+
       ' and org_type=4 and par_inst ='+IntToStr(ALFANAFTA)))
   and (NN_CLIENT_ADRESS = 'ALFA')
THEN
begin
  q := TOilQuery.Create(nil);
  if GetOrgData(q,ALFANAFTA,ALFANAFTA) then
  begin
    List.Cells[15, 'V'] := q.FieldByName('ADDR').AsString;
    List.Cells[16, 'V'] := q.FieldByName('PHONE').AsString;
  end;
  q.free;
end
ELSE
begin
  List.Cells[15, 'V'] := qAlienOrg.FieldByName('Addr').AsString;
  List.Cells[16, 'V'] := qAlienOrg.FieldByName('Phone').AsString;
end;

List.Cells[9, 'V'] := qAlienOrg.FieldByName('Name').AsString;
List.cells[17, 'V'] := qAlienOrg.FieldByName('Svid_Num').AsString;

for I := 1 to Length(qAlienOrg.FieldByName('Nal_Num').AsString)
 do List.Cells[13, 17 + I] := qAlienOrg.FieldByName('Nal_Num').AsString[i];

List.Cells[19, 'G'] := qWork.FieldByName('F_Doc').AsString;

qAlienNN_.Close;
qAlienNN_.ParamByName('PrintAll').AsString := 'Y';
qAlienNN_.ParamByName('NNId').asInteger := NNId;
qAlienNN_.ParamByName('NNInst').asInteger := NNInst;
_OpenQuery(qAlienNN_);

i := 31;
while not qAlienNN_.Eof do
  begin
  List.Cells[i, 'C'] := qAlienNN_.FieldByName('Oper_Date').AsDateTime;
  List.Cells[i, 'F'] := qAlienNN_.FieldByName('NP_Name').AsString;
  List.Cells[i, 'O'] := TranslateText('литр');
  List.Cells[i, 'P'] := qAlienNN_.FieldByName('Litr').AsFloat;
  List.Cells[i, 'Q'] := qAlienNN_.FieldByName('PriceXNDS').AsFloat;
  List.Cells[i, 'S'] := qAlienNN_.FieldByName('SumXNDS').AsFloat;
  qAlienNN_.Next;
  i := i + 1;
  end;

qAlienNN_.Close;
qAlienNN_.ParamByName('PrintAll').Clear;
qAlienNN_.ParamByName('NNId').asInteger := NNId;
qAlienNN_.ParamByName('NNInst').asInteger := NNInst;
_OpenQuery(qAlienNN_);


List.Cells[49, 'S'] := qAlienNN_.FieldByName('SumXNDS').AsFloat;
List.Cells[54, 'S'] := qAlienNN_.FieldByName('SumXNDS').AsFloat;
List.Cells[55, 'S'] := qAlienNN_.FieldByName('NDS').AsFloat;
List.Cells[56, 'S'] := qAlienNN_.FieldByName('SumNDS').AsFloat;
List.Cells[49, 'AA'] := qAlienNN_.FieldByName('SumXNDS').AsFloat;
List.Cells[54, 'AA'] := qAlienNN_.FieldByName('SumXNDS').AsFloat;
List.Cells[55, 'AA'] := qAlienNN_.FieldByName('NDS').AsFloat;
List.Cells[56, 'AA'] := qAlienNN_.FieldByName('SumNDS').AsFloat;
end;

procedure TCardRNPrintForm.deBeginDateAcceptDate(Sender: TObject; var ADate: TDateTime; var Action: Boolean);
begin
  if CeRnToName.Text = '' then raise Exception.Create(TranslateText('Необходимо выбрать клинта'));
  qWork.Close;
  case ReportNumber of
    2: qWork.SQL.Text := 'select Doc_Number, Doc_Date from v_Card_Receipts ' +
       ' where Doc_Number is not null ' +
       ' and Doc_Number <> ''' + RnNumber.Text + ''' ' +
       ' and to_date(Oper_Date) >= ''' + FormatDateTime('dd.mm.yyyy', ADate) + ''' ' +
       ' and to_date(Oper_Date) <= ''' + FormatDateTime('dd.mm.yyyy', deEndDate.Date) + ''' ' +
       ' and To_Id = ' + IntToStr(OrgId) +
       ' and CardAlign = 0 '+
       ' and To_Inst = ' + IntToStr(OrgInst);
    3: qWork.SQL.Text := 'select Doc_Number, Doc_Date from v_Card_Expense ' +
       ' where Doc_Number is not null ' +
       ' and Doc_Number <> ''' + RnNumber.Text + ''' ' +
       ' and to_date(Oper_Date) >= ''' + FormatDateTime('dd.mm.yyyy', ADate) + ''' ' +
       ' and to_date(Oper_Date) <= ''' + FormatDateTime('dd.mm.yyyy', deEndDate.Date) + ''' ' +
       ' and CardAlign = 0 '+
       ' and To_Id = ' + IntToStr(OrgId) +
       ' and To_Inst = ' + IntToStr(OrgInst);
    5: qWork.SQL.Text := 'select Doc_Number, Doc_Date from Card_Transit ' +
       ' where Doc_Number is not null ' +
       ' and Doc_Number <> ''' + RnNumber.Text + ''' ' +
       ' and to_date(Oper_Date) >= ''' + FormatDateTime('dd.mm.yyyy', ADate) + ''' ' +
       ' and to_date(Oper_Date) <= ''' + FormatDateTime('dd.mm.yyyy', deEndDate.Date) + ''' ' +
       ' and Card.GetDep(Card_Number, oper_date) = ' + IntToStr(OrgId);

  end;
  if (ReportNumber<>6) and
     (ReportNumber<>7) and
     (ReportNumber<>8)
  then
  begin
    _OpenQuery(qWork);
    if not(qWork.IsEmpty)
      then raise Exception.Create(TranslateText('Выбранный период захватывает накладную №') + qWork.FieldByName('Doc_Number').AsString + TranslateText(' от ') + qWork.FieldByName('Doc_Date').AsString);
  end;
end;

procedure TCardRNPrintForm.deEndDateAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
  if CeRnToName.Text = ''
  then raise Exception.Create(TranslateText('Необходимо выбрать клинта'));
  qWork.Close;
  case ReportNumber of
    2: qWork.SQL.Text := 'select Doc_Number, Doc_Date from v_Card_Receipts ' +
       ' where Doc_Number is not null ' +
       ' and Doc_Number <> ''' + RnNumber.Text + ''' ' +
       ' and to_date(Oper_Date) >= ''' + FormatDateTime('dd.mm.yyyy', deBeginDate.Date) + ''' ' +
       ' and to_date(Oper_Date) <= ''' + FormatDateTime('dd.mm.yyyy', ADate) + ''' ' +
       ' and CardAlign = 0 '+
       ' and To_Id = ' + IntToStr(OrgId) +
       ' and To_Inst = ' + IntToStr(OrgInst);
    3: qWork.SQL.Text := 'select Doc_Number, Doc_Date from v_Card_Expense ' +
       ' where Doc_Number is not null ' +
       ' and Doc_Number <> ''' + RnNumber.Text + ''' ' +
       ' and to_date(Oper_Date) >= ''' + FormatDateTime('dd.mm.yyyy', deBeginDate.Date) + ''' ' +
       ' and to_date(Oper_Date) <= ''' + FormatDateTime('dd.mm.yyyy', ADate) + ''' ' +
       ' and CardAlign = 0 '+
       ' and To_Id = ' + IntToStr(OrgId) +
       ' and To_Inst = ' + IntToStr(OrgInst);
    5: qWork.SQL.Text := 'select Doc_Number, Doc_Date from Card_Transit ' +
       ' where Doc_Number is not null ' +
       ' and Doc_Number <> ''' + RnNumber.Text + ''' ' +
       ' and to_date(Oper_Date) >= ''' + FormatDateTime('dd.mm.yyyy', deBeginDate.Date) + ''' ' +
       ' and to_date(Oper_Date) <= ''' + FormatDateTime('dd.mm.yyyy', ADate) + ''' ' +
       ' and Card.GetDep(Card_Number, oper_date) = ' + IntToStr(OrgId);
  end;
  if CardScheme <> LS then
  begin
    _OpenQuery(qWork);
    if not(qWork.IsEmpty)
     then raise Exception.Create(TranslateText('Выбранный период захватывает накладную №') + qWork.FieldByName('Doc_Number').AsString + TranslateText(' от ') + qWork.FieldByName('Doc_Date').AsString);
  end;
end;

procedure TCardRNPrintForm.FormShow(Sender: TObject);
begin
  if CardScheme = LS then
    lDocType.Caption := TranslateText('ЛИМИТНАЯ СХЕМА')
  else
    lDocType.Caption :='';
end;

procedure TCardRNPrintForm.sbCBlankAutoClick(Sender: TObject);
begin
edCBlank.Clear;
edCBlank.ReadOnly := sbCBlankAuto.Down;
edCBlank.ShowHint := sbCBlankAuto.Down;

if sbCBlankAuto.Down then
  begin
  edCBlank.Color:=clBtnFace;
  edCBlank.Hint:=TranslateText('Будет выбран следующий номер по порядку');
  end
 else
  begin
  edCBlank.Color:=clWindow;
  edCBlank.Hint:='';
  end;
end;

procedure TCardRNPrintForm.FormCreate(Sender: TObject);
begin
  inherited;
  LoadSQLByForm(TForm(Self));
  Height := 235;
  Width := 365;
  FFromId := -1;
  FFromInst := -1;
end;

procedure TCardRNPrintForm.SetReportNumber(AValue:integer);
begin
  cbWithPart.Visible := AValue=3;
  FReportNumber:=AValue;
end;

function TCardRNPrintForm.GetFromId: integer;
begin
  if FFromId <= 0 then
    result := MAIN_ID
  else
    result := FFromId;
end;

function TCardRNPrintForm.GetFromInst: integer;
begin
  if FFromInst <= 0 then
    result := MAIN_ID
  else
    result := FFromInst;
end;

procedure TCardRNPrintForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DefineRepDates(0,0);
end;

//==============================================================================
//============================DocActive BEGIN===================================
//==============================================================================
procedure TCardRNPrintForm.ceReqOrgButtonClick(Sender: TObject);
var
  vId, vInst: Integer;
  vName: String;
begin
  if ceReqOrg.ReadOnly then exit;
  if ChooseOrg.CaptureOrg(3, MAIN_ID, INST, 'yyy', vId, vInst, vName) then
  begin
    ceReqOrg.Text := vName;
    ReqOrgID := vId;
    ReqOrgINST := vInst;
    GetDocNumber();
  end;
end;
//==============================================================================
procedure TCardRNPrintForm.sbReqOrgClearClick(Sender: TObject);
begin
  ceReqOrg.Text := '';
  ReqOrgID := 0;
  ReqOrgINST := 0;
end;
//==============================================================================
procedure TCardRNPrintForm.ceReqDogButtonClick(Sender: TObject);
var
  F: TDogRefForm;
begin
  if ceReqDog.ReadOnly then exit;

  Application.CreateForm(TDogRefForm, F);
  F.gbDogType.Enabled := False;
  F.rbKart.Checked := true;

  // підтягуємо організацію у фільтр
  if ceReqOrg.Text <> '' then
  begin
    F.eTo.Tag := ReqOrgID;
    F.lTo.Tag := ReqOrgINST;
    F.eTo.Text := ceReqOrg.Text;
  end;

  // підтягуємо період у фільтр
  if deReqDBegin.Date <> 0 then
    F.eDate.Date := deReqDBegin.Date - 10;

  if deReqDEnd.Date <> 0 then
    F.eToDate.Date := deReqDEnd.Date + 10;

  // схема
  F.cbScheme.Enabled := false;
  F.sbSchemeClear.Enabled := false;
  F.cbScheme.ItemIndex := decode([DocType, dtInvoiceLS, 1, 0]);

  // виплата
  F.cbPay.Enabled := false;
  F.sbPayClear.Enabled := false;
  F.cbPay.ItemIndex := decode([DocType, dtInvoiceLS, 0, 1]);

  F.ShowModal;
  if F.ModalResult = mrOk then
  begin
    // підтягуємо договір
    ceReqDog.Text := F.qDog.AsString;
    ceReqDog.Width := 115;
    ceReqDog.Color := clBtnFace;
    ceReqDog.DirectInput := false;

    sbReqNAuto.Visible := false;

    deReqDogDate.Date := F.qDog_Date.AsDateTime;
    deReqDogDate.ReadOnly := true;
    deReqDogDate.Color := clBtnFace;

    ReqDogID := F.qId.AsInteger;
    ReqDogINST := F.qInst.AsInteger;

    // підтягуємо клієнта
    ceReqOrg.Text := F.qTO_NAME.AsString;
    ReqOrgID := F.qTO_.AsInteger;
    ReqOrgINST := F.qTO_INST.AsInteger;
    ceReqOrg.ReadOnly := true;
    sbReqOrgClear.Enabled := false;
    ceReqOrg.Color := clBtnFace;

    // підтягуємо період у фільтр
    deReqDBegin.Date := F.qDog_Date.AsDateTime;
    if deReqDBegin.Date > deReqDEnd.Date then
      deReqDEnd.Date := deReqDBegin.Date;
  end;
  F.Free;
end;
//==============================================================================
procedure TCardRNPrintForm.sbReqDogClearClick(Sender: TObject);
begin
  ceReqDog.Text := '';
  ceReqDog.DirectInput := true;
  ceReqDog.Color := clWindow;

  deReqDogDate.Date := deReqDBegin.Date;
  deReqDogDate.ReadOnly := false;
  deReqDogDate.Color := clWindow;

  deReqDBegin.ReadOnly := false;

  ceReqOrg.ReadOnly := false;
  sbReqOrgClear.Enabled := true;
  ceReqOrg.Color := clWindow;

  ReqDogID := 0;
  ReqDogINST := 0;

  ceReqDog.Width := 90;
  sbReqNAuto.Visible := true;
  sbReqNAuto.Down := true;
  sbReqNAutoClick(nil);
end;
//==============================================================================
procedure TCardRNPrintForm.sbReqNAutoClick(Sender: TObject);
begin
  ceReqDog.Clear;
  ceReqDog.ReadOnly := sbReqNAuto.Down;
  ceReqDog.ShowHint := sbReqNAuto.Down;

  if sbReqNAuto.Down then
  begin
    ceReqDog.Color := clBtnFace;
    ceReqDog.Hint := TranslateText('Будет выбран следующий номер по порядку');
  end
  else
  begin
    ceReqDog.Color := clWindow;
    ceReqDog.Hint := '';
  end;
end;
//==============================================================================
procedure TCardRNPrintForm.MakeReportDoc();
var
  DogCreate: TDogCreate;
  qDog, qDogTrans: TOilQuery;
  RestDogPos: real;
  sMsg, sTrans, sMsgTrans, sMsgTransNo: string;
  //****************************************************************************
  procedure CreateDog(qDog: TOilQuery);
  begin
    try
      DogCreate := TDogCreate.Create;

      DogCreate.Dog := ceReqDog.Text;
      DogCreate.DogType := dtK;
      DogCreate.ForePay := decode([DocType, dtInvoiceLS, false, true]);
      DogCreate.SubType := decode([DocType, dtInvoiceLS, 101, 100]);

      if GENERATION >= 2 then
      begin
        DogCreate.FromId := AVIAS_ID;
        DogCreate.FromInst := AVIAS_INST;
      end
      else
      begin
        DogCreate.FromId := INST;
        DogCreate.FromInst := INST;
      end;

      DogCreate.ToId := ReqOrgID;
      DogCreate.ToInst := ReqOrgINST;

      DogCreate.DogDate := deReqDogDate.Date;
      DogCreate.ExpDate := deReqDogDate.Date;

      qDog.First;
      while not qDog.Eof do
      begin
        DogCreate.Add(
          qDog['count_litr'],
          0,
          qDog['price_dog_nds'],
          0,
          0,
          qDog['np_id'],
          28);
        qDog.Next;
      end;
      DogCreate.Save;
      ReqDogID := DogCreate.Id;
      ReqDogINST := DogCreate.Inst;
    finally
      FreeAndNil(DogCreate);
    end;
  end;
  //****************************************************************************
  procedure PrintDoc(); // друкуємо заявку/рахунок-фактур
  begin
    // перевірка прив"язки договору
    if 0 = nvl(GetSqlValueParSimple(
      'select count(*) from card_transaction where dog_id = :dog_id and dog_inst = :dog_inst',
      ['dog_id', ReqDogID, 'dog_inst', ReqDogINST]), 0) then
    begin
      MessageDlg(TranslateText('Не привязано ни одного ') +
        decode([DocType, dtInvoiceLS, TranslateText('списания'), TranslateText('пополнения')]) +'!', mtError, [mbOk], 0);
      exit;
    end;

    // вже є договір
    RequestReadOnly();

    if DocType = dtInvoiceLS then // ЛС
    begin
      qWork.Close;
      qWork.SQL.Text :=
        'select bill_id, bill_inst from oil_dog where state = ''Y'' and id = :dog_id and inst = :dog_inst';
      _OpenQueryPar(qWork, ['dog_id', ReqDogID, 'dog_inst', ReqDogINST]);
      if qWork.FieldByName('bill_id').IsNull then
        MessageDlg(TranslateText('По данному договору не найден счет!'), mtError, [mbOk], 0)
      else TBillForm.Print(qWork.FieldByName('bill_id').AsInteger, qWork.FieldByName('bill_inst').AsInteger, 0);
    end
    else // ЕК
      TCardRequestPrint.Print(qReport, qRequest, ReqDogID, ReqDogINST, crDog,
        ceReqDog.Text, deReqDogDate.Date, ReqOrgID, ReqOrgINST);
  end;
  //****************************************************************************
  procedure CreateANDPrintDoc();
  begin
    try
      // знаходимо усі транзакції із яких будемо створювати договір
      qGetDogDetail.Close;
      qGetDogDetail.ParamByName('shema_type').AsInteger := decode([DocType, dtInvoiceLS, 0, 1]);
      _OpenQueryPar(qGetDogDetail,
        ['begin_date', deReqDBegin.Date,
         'end_date',   deReqDEnd.Date,
         'to_id',      ReqOrgID,
         'to_inst',    ReqOrgINST]);

      if qGetDogDetail.IsEmpty then
      begin
        MessageDlg(TranslateText('Не найдено ни одного ') +
          decode([DocType, dtInvoiceLS, TranslateText('списания'), TranslateText('пополнения')]) +'!', mtError, [mbOk], 0);
        exit;
      end;

      // питання про створення договору
      qWork.Close;
      qWork.SQL.Text :=
        'select dog, dog_date from oil_dog' +
        ' where state = ''Y'' and dog_type = ''K'' and to_ = :to_id and to_inst = :to_inst and dog_date = :dog_date' +
        '   and sub_type = '+ decode([DocType, dtInvoiceLS, '101 and forepay = 0', '100']);
      _OpenQueryPar(qWork,
        ['dog_date',  deReqDogDate.Date,
         'to_id',     ReqOrgID,
         'to_inst',   ReqOrgINST]);

      sMsg := '';
      if not qWork.IsEmpty then
      begin
        qWork.First;
        while not qWork.Eof do
        begin
          sMsg := sMsg + TranslateText('Найден договор номер ')+ qWork.FieldByName('dog').AsString +
            TranslateText(' от ')+ qWork.FieldByName('dog_date').AsString +TranslateText(' по выбранному клиенту.')+ #13#10;
          qWork.Next;
        end;
      end;
      if sMsg <> '' then sMsg := sMsg +#13#10;
      sMsg := sMsg + TranslateText('Будет создан договор номер ')+ ceReqDog.Text +
        TranslateText(' от ')+ deReqDogDate.Text +TranslateText(' со следующей детализацией: ');

      qGetDogDetail.First;
      while not qGetDogDetail.Eof do
      begin
        sMsg := sMsg +#13#10+
          TranslateText('   НП: ')+
            nvl(GetSqlValueParSimple('select name from v_oil_np_type where id = :id', ['id', qGetDogDetail['np_id']]), '') +
          TranslateText('   Цена с НДС: ')+ qGetDogDetail.FieldByName('price_dog_nds').AsString +
          TranslateText('   Количество: ')+ qGetDogDetail.FieldByName('count_litr').AsString;
        qGetDogDetail.Next;
      end;

      if MessageDlgExt(sMsg, mtConfirmation, [TranslateText('Продолжить'), TranslateText('Отмена')], 2) = 2 then exit;

      // перевірка ціни
      if nvl(GetSqlValueParSimple(
        'select count(*)' +
        '  from (select np_type, count(np_type)' +
        '          from (select np_type, price_dog_nds' +
        '                  from card_transaction_rest' +
        '                 where trunc(Oper_Date) between :begin_date and :end_date' +
        '                   and To_Id = :to_id and To_Inst = :to_inst' +
        '                   and '+ decode([DocType,
                                           dtInvoiceLS, 'tr_type = 12 and Chek_Number is null',
                                           'tr_type in (5, 7) and Doc_Number is null']) +
        '                   and dog_id is null' +
        '                 group by np_type, price_dog_nds)' +
        '         group by np_type' +
        '        having count(np_type) > 1)',
        ['begin_date', deReqDBegin.Date,
         'end_date',   deReqDEnd.Date,
         'to_id',      ReqOrgID,
         'to_inst',    ReqOrgINST]), 0) > 0 then
      begin
        MessageDlg(TranslateText('Не возможно создать договор, так как по одному НП найдено несколько разных цен!') +
          #10#13 + TranslateText('Рекомендация:') +
          #10#13 + TranslateText('  1. Выберите меньше период;') +
          #10#13 + TranslateText('  2. Создайте договор вручную.'), mtError, [mbOk], 0);
        exit;
      end;

      // створення договору
      StartSqlOra;
      CreateDog(qGetDogDetail);
      if DocType = dtInvoiceLS then // ЛС
      begin
        // треба видалити дані із договору для відповідності договору післявиплата
        _ExecSql(
          'update oil_dog_detail set count_ = null, summ_x_nds = null, summ_nds = null' +
          ' where Dog_ID = :Dog_ID and Dog_INST = :Dog_INST',
          ['Dog_ID', ReqDogID, 'Dog_INST', ReqDogINST]);
      end;

      _ExecSql(
        'update Card_Transaction set Dog_ID = :Dog_ID, Dog_INST = :Dog_INST, ' +
        decode([DocType,
                dtInvoiceLS, 'Chek_Number = null, Chek_Date = null',
                'Doc_Number = null, Doc_Date = null, Request_ID = null, Request_INST = null']) +
        ' where (oil_id, oil_inst) in (select oil_id, oil_inst' +
        '                                from card_transaction_rest' +
        '                               where trunc(Oper_Date) between :begin_date and :end_date' +
        '                                 and To_Id = :to_id and To_Inst = :to_inst' +
        '                                 and '+ decode([DocType,
                                                         dtInvoiceLS, 'tr_type = 12 and Chek_Number is null)',
                                                         'tr_type in (5, 7) and Doc_Number is null)']) +
        '   and dog_id is null and request_id is null',
        ['Dog_ID',     ReqDogID,
         'Dog_INST',   ReqDogINST,
         'begin_date', deReqDBegin.Date,
         'end_date',   deReqDEnd.Date,
         'to_id',      ReqOrgID,
         'to_inst',    ReqOrgINST]);
      CommitSqlOra;
    except on E: Exception do
      begin
        RollBackSQL;
        MessageDlg(TranslateText('Ошибка: ')+ E.message, mtError, [mbOk], 0);
        exit;
      end;
    end;
    ShowMessage(TranslateText('Создан договор номер '+ ceReqDog.Text +' от '+ deReqDogDate.Text +'.'));
    
    PrintDoc(); // друкуємо заявку/рахунок-фактур
  end;
  //****************************************************************************
  procedure ActiveANDPrintDoc();
  var
    bActDog: boolean;
    Summ_Nds, Summ_X_Nds, CardLitr, CardPrice: real;
  begin
    // перевірка прив"язки договору
    if 0 = nvl(GetSqlValueParSimple(
      'select count(*) from card_transaction where dog_id = :dog_id and dog_inst = :dog_inst',
      ['dog_id', ReqDogID, 'dog_inst', ReqDogINST]), 0) then
    begin // якщо не прив"язаний договір, то прив"язуємо його
      sTrans := '';
      sMsgTrans := '';
      sMsgTransNo := '';
      bActDog := false;

      qDog := TOilQuery.Create(nil);
      qDogTrans := TOilQuery.Create(nil);
      try
        // знаходимо договір
        qDog.Sql.Text :=
          'select dog_id, dog_inst, dog_date, to_id, to_inst, petrol_id, np_type, litr, nvl(price_nds, 0) as price_nds' +
          '  from v_oil_dog_full' +
          ' where dog_id = :dog_id and dog_inst = :dog_inst and petrol_id is not null';
        _OpenQueryPar(qDog, ['dog_id', ReqDogID, 'dog_inst', ReqDogINST]);

        if qDog.IsEmpty then
        begin
          MessageDlg(TranslateText('Выбранный договор не имеет карточной группы нефтепродукта!'), mtError, [mbOk], 0);
          exit;
        end;

        StartSqlOra;
        // пробігаємо позиції договору і знаходимо поповнення/списання, які нам підходять
        qDog.First;
        while not qDog.Eof do
        begin
          // знаходимо поповнення/списання
          qDogTrans.Sql.Text :=
            'select oil_id, oil_inst, to_id, to_inst, Card_Number, Oper_Date, NP_Type, fullname, Litr, price_dog_nds' +
            '  from card_transaction_rest, v_oil_np_group' +
            ' where dog_id is null and ' +
            decode([DocType,
                    dtInvoiceLS, 'tr_type = 12 and Chek_Number is null',
                    'tr_type in (5, 7) and Doc_Number is null']) +
            '   and petrol_id = NP_Type' +
            '   and to_id = :to_id and to_inst = :to_inst' +
            '   and trunc(Oper_Date) between :begin_date and :end_date' +
            '   and NP_Type = :petrol_id' +
            ' order by Oper_Date';
          _OpenQueryPar(qDogTrans,
            ['begin_date', deReqDBegin.Date,
             'end_date',   deReqDEnd.Date,
             'to_id',      ReqOrgID,
             'to_inst',    ReqOrgINST,
             'petrol_id',  qDog.FieldByName('petrol_id').AsInteger]);

          // якщо договір ЕК, то беремо літри по договору і будемо перевіряти,
          // щоб не було перевищення цього літражу
          if DocType = dtInvoiceLS then RestDogPos := 0
          else RestDogPos := qDog.FieldByName('litr').AsFloat;

          Summ_Nds := 0;
          Summ_X_Nds := 0;

          qDogTrans.First;
          while not qDogTrans.Eof do
          begin
            CardLitr := qDogTrans.FieldByName('Litr').AsFloat;
            CardPrice := qDogTrans.FieldByName('price_dog_nds').AsFloat;

            // запам"ятовуємо дані по транзакції
            sTrans :=
              TranslateText('   Номер: ')     + qDogTrans.FieldByName('Card_Number').AsString +
              TranslateText('   Дата/Время: ')+ qDogTrans.FieldByName('Oper_Date').AsString +
              TranslateText('   НП: ')        + qDogTrans.FieldByName('fullname').AsString +
              TranslateText('   Цена с НДС: ')+ FloatToStr(CardPrice) +
              TranslateText('   Количество: ')+ FloatToStr(CardLitr);

            // перевіряємо ціну
            if qDog.FieldByName('price_nds').AsFloat = CardPrice then
            begin
              // якщо договір ЕК, то перевіряємо залишок літрів
              if DocType = dtInvoiceLS then
              begin
                // по ЛС-післявиплата взнаємо літри, суму без ПДВ і суму із ПДВ
                RestDogPos := RestDogPos + CardLitr;
                Summ_Nds := Summ_Nds + MRound(CardPrice * CardLitr, 2);
                Summ_X_Nds := Summ_X_Nds + MRound(CardPrice * CardLitr, 2) -
                  MRound(CardPrice * TAX_RATE(qDog.FieldByName('dog_date').AsDateTime) /
                    (1 + TAX_RATE(qDog.FieldByName('dog_date').AsDateTime)) * CardLitr, 2);
              end
              else RestDogPos := RestDogPos - CardLitr;

              // ЛС або ЕК + залишок більше нуля
              if (DocType = dtInvoiceLS) or ((RestDogPos >= 0) and (DocType = dtRequest)) then
              begin
                // до транзакції приєднуємо договір
                _ExecSql(
                  'update Card_Transaction set Dog_ID = :Dog_ID, Dog_INST = :Dog_INST, ' +
                  decode([DocType,
                          dtInvoiceLS, 'Chek_Number = null, Chek_Date = null',
                          'Doc_Number = null, Doc_Date = null, Request_ID = null, Request_INST = null']) +
                  ' where oil_id = :oil_id and oil_inst = :oil_inst and dog_id is null and request_id is null',
                  ['Dog_ID',   ReqDogID,
                   'Dog_INST', ReqDogINST,
                   'oil_id',   qDogTrans.FieldByName('oil_id').AsInteger,
                   'oil_inst', qDogTrans.FieldByName('oil_inst').AsInteger]);

                sMsgTrans := sMsgTrans +#13#10+ sTrans;
              end
              else sMsgTransNo := sMsgTransNo +#13#10+ sTrans +#13#10+
                TranslateText('       Количество по договору уже закончилось!');
            end
            else
              sMsgTransNo := sMsgTransNo +#13#10+ sTrans +#13#10+
                TranslateText('       Цена по договору не совпадает с ценой в транзакции!');
            qDogTrans.Next;
          end;

          if (DocType = dtInvoiceLS) and (RestDogPos > 0) then // ЛС
          begin
            _ExecSql(
              'update oil_dog_detail set count_ = :Litr, summ_x_nds = :Summ_X_Nds, summ_nds = :Summ_Nds' +
              ' where Dog_ID = :Dog_ID and Dog_INST = :Dog_INST and Np_Type = :Np_Type',
              ['Dog_ID',     ReqDogID,
               'Dog_INST',   ReqDogINST,
               'Litr',       RestDogPos,
               'Summ_X_Nds', Summ_X_Nds,
               'Summ_Nds',   Summ_Nds,
               'Np_Type',    qDog.FieldByName('Np_Type').AsFloat]);
            bActDog := true;
          end;
          qDog.Next;
        end;

        if DocType = dtInvoiceLS then // ЛС
        begin
          if bActDog then
            CreateBillWithDog(ReqDogID, ReqDogINST); // створити рахунок із договору

          // треба видалити дані із договору для відповідності договору післявиплата
          _ExecSql(
            'update oil_dog_detail set count_ = null, summ_x_nds = null, summ_nds = null' +
            ' where Dog_ID = :Dog_ID and Dog_INST = :Dog_INST',
            ['Dog_ID', ReqDogID, 'Dog_INST', ReqDogINST]);
        end;
        CommitSqlOra;
      except on E: Exception do
        begin
          RollBackSQL;
          MessageDlg(TranslateText('Ошибка: ')+ E.message, mtError, [mbOk], 0);
          exit;
        end;
      end;
      qDog.Free;
      qDogTrans.Free;

      if (sMsgTrans <> '') or (sMsgTransNo <> '') then
        ShowText(
          decode([sMsgTrans, '', '', TranslateText('Привязанные транзакции: ') + sMsgTrans + #13#10#13#10]) +
          decode([sMsgTransNo, '', '', TranslateText('Не привязанные транзакции: ') + sMsgTransNo]));
    end;
    PrintDoc(); // друкуємо заявку/рахунок-фактур
  end;
  //****************************************************************************
  procedure PrintOldBill();
  var
    CurPos,  Counter, CountInvoices: Integer;
    XNds: Real;
    XNpType: String;
    Invoice: TdmInvoicePrint;
  begin
    try
      qInvoiceLS.Close;
      _OpenQueryPar(qInvoiceLS,
        ['OrgId',     ReqOrgID,
         'OrgInst',   ReqOrgINST,
         'BeginDate', deReqDBegin.Date,
         'EndDate',   deReqDEnd.Date,
         'Doc_num',   ceReqDog.Text]);
      if qInvoiceLS.IsEmpty then
        raise Exception.Create(TranslateText('Не обнаружено данных за выбранный период!'));

      qReportLS.Close;
      _OpenQueryPar(qReportLS, ['OrgId', ReqOrgID, 'OrgInst', ReqOrgINST]);

      CountInvoices := 0;
      XNpType := qInvoiceLS.FieldByName('Cash_Method').AsString;
      try
        While (not qInvoiceLs.Eof)  do
        begin
          ActivateXLApp('Schet', 'Schet', 1, MSExcel, List);
          MSExcel.DisplayAlerts := false;
          Invoice := TdmInvoicePrint.Create(
            qInvoiceLS.FieldByName('InvoiceNum').AsString,
            deReqDogDate.Text,
            '',
            '',
            qReportLS.FieldByName('inst').asInteger,
            qReportLS.FieldByName('inst').asInteger,
            ReqOrgID,
            ReqOrgINST);
          try
            Invoice.MSExcel := TMSExcel.Create(MSExcel,List);
            Invoice.DogLink := dlFirstDog;
            Invoice.FillHeader();
            CurPos := 24;
            Counter := 1;
            List.Columns['D:D'].ColumnWidth := 15.15;
            XNds := 0;
            // заполнение таблицы
            while (XNpType = qInvoiceLS.FieldByName('Cash_Method').AsString) and (not qInvoiceLS.Eof) do
            begin
              List.Cells[CurPos, 1].Value := Counter;
              List.Cells[CurPos, 2].Value := LangText('s') +' '+
                qInvoiceLS.FieldByName('WeekFrom').AsString +TranslateText(' по ')+
                qInvoiceLS.FieldByName('WeekTo').AsString;
              List.Columns['B:B'].ColumnWidth := 23.8;
              List.Cells[CurPos, 3].Value := qInvoiceLS.FieldByName('NpName').AsString;

              List.Cells[CurPos, 5].Value := LangText('litr');
              List.Cells[CurPos, 6].Value := qInvoiceLS.FieldByName('CountLitr').Value;
              List.Cells[CurPos, 7].Value := qInvoiceLS.FieldByName('PriceNoNds').AsFloat;
              List.Cells[CurPos, 8].Value := qInvoiceLS.FieldByName('SumNoNds').AsFloat;
              List.Range['C'+IntToStr(CurPos) + ':D' + IntToStr(CurPos)].Merge;
              inc(CurPos);
              List.Cells[CurPos, 3].Value := LangText('NDS');
              List.Cells[CurPos, 8].Value := qInvoiceLS.FieldByName('Nds').Value;
              List.Range['C'+IntToStr(CurPos) + ':G' + IntToStr(CurPos)].Merge;
              inc(CurPos);
              List.Cells[CurPos, 3].Value := LangText('Sum')+LangText('S_NDS');
              List.Cells[CurPos, 8].Value := qInvoiceLS.FieldByName('SumNds').Value;
              List.Range['C'+IntToStr(CurPos) + ':G' + IntToStr(CurPos)].Merge;
              inc(CurPos);
              inc(Counter);
              XNds := XNds + qInvoiceLS.FieldByName('SumNds').Value;
              qInvoiceLS.Next;
            end;
            XNpType := qInvoiceLS.FieldByName('Cash_Method').AsString;
            List.Cells[CurPos, 2].Value := LangText('Obschaya') +' '+ LangText('Sum') + LangText('S_NDS');
            List.Cells[CurPos, 8].Value := XNds;
            List.Range['D'+IntToStr(CurPos) + ':G' + IntToStr(CurPos)].Merge;
            List.Range['A11:H' + IntToStr(CurPos)].Borders.LineStyle := xlContinuous;
            List.Range['B' + IntToStr(CurPos + 2) + ':B' + IntToStr(CurPos + 2)].Font.Bold := True;
            List.Cells[CurPos + 2, 'B'].Value := LangText('Obschaya') +' '+ LangText('Sum') + LangText('S_NDS') +': '+
              NumStrGrn(List.Cells[CurPos, 'H'].Value, TranslateText('грн'), TranslateText('коп'));
            List.Cells[CurPos + 2, 'B'].HorizontalAlignment := xlleft;
            List.Rows[CurPos + 4].Font.Size := 11;
            List.Rows[CurPos + 4].HorizontalAlignment := xlleft;
            List.Cells[CurPos + 6, 2].Value := MANAGER_SHIP +' ________________';
            List.Cells[CurPos + 6, 6].Value := BUH_SHIP     +' ________________';
            inc(CountInvoices);
          finally
            Invoice.MSExcel.Free;
            Invoice.Free;
          end;
        end;
        if CountInvoices > 1 then
          MessageDlg(TranslateText('Распечатано ')+ IntToStr(CountInvoices) +
            TranslateText(' документа')+ #13#10 +TranslateText('Нажмите ОК для просмотра'), mtInformation, [mbOk], 0);
      finally
        MSExcel.Visible := True;
        MSExcel.ScreenUpdating := True;
      end;
    except on E: Exception do
      ShowMessage(E.Message);
    end;
  end;
  //****************************************************************************
begin
  if (not sbReqNAuto.Down) and (ceReqDog.Text = '') then
    raise Exception.Create(TranslateText('Необходимо ввести номер!'));

  if deReqDBegin.Date = 0 then deReqDBegin.Date := Date;

  if deReqDEnd.Date = 0 then deReqDEnd.Date := Date;

  if ceReqOrg.Text = '' then raise Exception.Create(TranslateText('Необходимо выбрать клиента!'));

  if deReqDBegin.Date > deReqDEnd.Date then
    raise Exception.Create(TranslateText('Неправильно задан период!'));

  if 0 = GetSqlValueParSimple(
    'select count(*) from oil_dog' +
    ' where state = ''Y'' and dog_type = ''K'' and sub_type = '+ decode([DocType, dtInvoiceLS, '101 and forepay = 0', '100']) +
    '   and to_ = :to_ and to_inst = :to_inst',
    ['to_', ReqOrgID, 'to_inst', ReqOrgINST]) then
    raise Exception.Create(TranslateText('Договор с выбранным клиентом не существует!'));

  if (DocType = dtInvoiceLS) and (ReqDogID = 0) and (ceReqDog.Text = '') then // ЛС
    if MessageDlg(TranslateText('Не выбран договор. Продолжить?'), mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      exit;

  if DocType = dtInvoiceLS then // ЛС
  begin
    // перевіряємо правильність заданого періоду
    qWork.Close;
    qWork.SQL.Text :=
      'select min(date_) as FromDate from Card_Transaction' +
      ' where Date_ < :BeginDate and Date_ >= to_date(ov.GetVal(''inst_move_date''))'+
      '   and To_Id = :To_Id and To_Inst = :To_Inst' +
      '   and Id_Схемы_Обсл = 2 and Chek_Number is null and Dog_id is null';
    _OpenQueryPar(qWork,
      ['BeginDate', FormatDateTime('dd.mm.yyyy', deReqDBegin.Date),
       'To_Id',     ReqOrgID,
       'To_Inst',   ReqOrgINST]);

    if (not qWork.isEmpty) and (qWork.FieldByName('FromDate').AsString <> '') then
      if MessageDlg(
        TranslateText('Найдены транзакции за предыдущий период, по которым не выписана счет-фактура.')+ #13#10 +
        TranslateText('Включить их в этот счет?'), mtInformation, [mbYes, mbNo], 0) = mrYes then
        deReqDBegin.Date := qWork.FieldByName('FromDate').AsDateTime
      else abort;
    Application.ProcessMessages;
    if copy(deReqDEnd.Text, 4, 2) <> copy(deReqDBegin.Text, 4, 2) then
      raise Exception.Create(
        TranslateText('Период формирования счет-фактуры не должен превышать один месяц!')+ #13#10 +
        TranslateText('Необходимо уменьшить период формирования.'));
  end;

  if sbReqNAuto.Down and sbReqNAuto.Visible and (ceReqDog.Text = '') then
    ceReqDog.Text :=
      decode([DocType, dtInvoiceLS, GetSeqNextVal('S_Card_InvoiceLS_Num'), GetSeqNextVal('S_Oil_Dog_Z_Num')]);

  try
    if (RequestID <> 0) and (DocType = dtRequest) then // ЕК - відкладені поповнення
      TCardRequestForm.Print(RequestID, RequestINST, 0)
    else
      if not sbReqNAuto.Visible and (ceReqDog.Text <> '') and (ReqDogID = 0) then // якщо старий документ
      begin
        if DocType = dtInvoiceLS then PrintOldBill() // ЛС, старий рахунок-фактур
        else // ЕК, стара заявка
          TCardRequestPrint.Print(qReport, qRequest, ceReqDog.Text, deReqDogDate.Date, ReqOrgID, ReqOrgINST, crRefuel);
      end
      else
        if ReqDogID = 0 then
          CreateANDPrintDoc() // якщо договір не вибраний, то треба його створити і прив"язати
        else ActiveANDPrintDoc(); // якщо договір вибраний, то треба його прив"язати
  except on E: Exception do
    MessageDlg(E.Message, mtError, [mbOk], 0);
  end;
end;
//==============================================================================
procedure TCardRNPrintForm.GetDocNumber(); // знаходження номера останнього договору
var
  BeginDate, EndDateMonth: TDateTime; // дата договору і початку періоду
  Year, Month, Day: word;
begin
  // якщо не вибраний договір
  if (DocType = dtInvoiceLS)
    and sbReqNAuto.Visible and (ceReqDog.Text = '') and (ReqDogID = 0) then // ЛС
  begin // в ЛС треба вибирати договір
    // знаходимо дату початку періоду
    qWork.Close;
    qWork.SQL.Text :=
      'select min(trunc(Oper_Date)) as Min_Oper_Date' +
      '  from card_transaction_rest' +
      ' where dog_id is null and tr_type = 12 and Chek_Number is null' +
      '   and to_id = :to_id and to_inst = :to_inst';
    _OpenQueryPar(qWork, ['To_Id', ReqOrgID, 'To_Inst', ReqOrgINST]);
    BeginDate := qWork.FieldByName('Min_Oper_Date').AsDateTime;

    // вибераємо договір
    qWork.Close;
    qWork.SQL.Text :=
      'select id, inst, dog, dog_date from oil_dog' +
      ' where state = ''Y'' and dog_type = ''K'' and to_ = :to_id and to_inst = :to_inst and dog_date = :dog_date' +
      '   and sub_type = 101 and forepay = 0';
    _OpenQueryPar(qWork,
      ['dog_date', BeginDate,
       'to_id',    ReqOrgID,
       'to_inst',  ReqOrgINST]);

    // якщо договір не знайдений, то попередній рахунок виписаний не на повний період
    if not qWork.IsEmpty and (qWork.RecordCount = 1) then
    begin
      // підтягуємо договір
      ceReqDog.Text := qWork.FieldByName('dog').AsString;
      ceReqDog.Width := 115;
      ceReqDog.Color := clBtnFace;
      ceReqDog.DirectInput := false;

      sbReqNAuto.Visible := false;

      deReqDogDate.Date := BeginDate;
      deReqDogDate.ReadOnly := true;
      deReqDogDate.Color := clBtnFace;

      ReqDogID := qWork.FieldByName('id').AsInteger;
      ReqDogINST := qWork.FieldByName('inst').AsInteger;

      ceReqOrg.ReadOnly := true;
      sbReqOrgClear.Enabled := false;
      ceReqOrg.Color := clBtnFace;

      // підтягуємо період у фільтр
      deReqDBegin.Date := BeginDate;
      DecodeDate(BeginDate, Year, Month, Day);
      EndDateMonth := IncMonth(EncodeDate(Year, Month, 1), 1) - 1;

      qWork.Close;
      qWork.SQL.Text :=
        'select min(dog_date)-1 as Min_Dog_Date from oil_dog' +
        ' where state = ''Y'' and dog_type = ''K'' and to_ = :to_id and to_inst = :to_inst and dog_date >= :dog_date' +
        '   and sub_type = 101 and forepay = 0 and not (id = :Dog_ID and inst = :Dog_INST)';
      _OpenQueryPar(qWork,
        ['dog_date', BeginDate,
         'to_id',    ReqOrgID,
         'to_inst',  ReqOrgINST,
         'Dog_ID',   ReqDogID,
         'Dog_INST', ReqDogINST]);
      // знаходимо дату кінця періоду
      if qWork.IsEmpty then
        if EndDateMonth >= GetSystemDate then
          deReqDEnd.Date := GetSystemDate
        else deReqDEnd.Date := EndDateMonth
      else
        if (EndDateMonth >= qWork.FieldByName('Min_Dog_Date').AsDateTime)
          and not qWork.FieldByName('Min_Dog_Date').IsNull then
          deReqDEnd.Date := qWork.FieldByName('Min_Dog_Date').AsDateTime
        else deReqDEnd.Date := EndDateMonth;
    end;
  end;

  if (ReqOrgID <> 0) and (ReqOrgINST <> 0) then
  begin
    lLastDog.Caption := TranslateText('Последний договор № ') +
      nvl(GetSqlValueParSimple(
        'select dog from' +
        '  (select row_number() over(order by dog_date desc, id desc) rnum, dog from oil_dog' +
        '    where state = ''Y'' and dog_type = ''K'' and sub_type = '+ decode([DocType, dtInvoiceLS, '101 and forepay = 0', '100']) +
        '      and to_ = :to_id and to_inst = :to_inst)' +
        ' where rnum = 1',
        ['to_id', ReqOrgID, 'to_inst', ReqOrgINST]), '');
    lLastDog.Visible := lLastDog.Caption <> '';
  end;
end;
//==============================================================================
procedure TCardRNPrintForm.RequestReadOnly();
begin
  ceReqDog.Width := 115;
  sbReqNAuto.Visible := false;

  ceReqDog.ReadOnly := true;
  ceReqDog.Color := clBtnFace;

  deReqDogDate.ReadOnly := true;
  deReqDogDate.Color := clBtnFace;
  sbReqDogClear.Enabled := false;

  deReqDBegin.ReadOnly := true;
  deReqDBegin.Color := clBtnFace;
  deReqDEnd.ReadOnly := true;
  deReqDEnd.Color := clBtnFace;

  ceReqOrg.ReadOnly := true;
  sbReqOrgClear.Enabled := false;
  ceReqOrg.Color := clBtnFace;  
end;
//==============================================================================
//==============================DocActive END===================================
//==============================================================================

end.