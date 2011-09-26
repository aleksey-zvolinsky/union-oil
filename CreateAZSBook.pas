{******************************************************************************}
{  Предназначение :     Программа предназначена для автозаполнения книги       }
{                     продаж налоговыми накладными за определенный период,     }
{                     по следующим видам отпуска:                              }
{                       1. Ведомость                                           }
{                       2. Наличный расчет                                     }
{                       3. Прочий отпуск                                       }
{                       3а. Спонсорская помощь                                 }
{                       3б. Банковские карты                                   }
{                                                                              }
{  Создана :          27.01.2005                                               }
{******************************************************************************}

unit CreateAZSBook;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, PageMngr, Mask, ToolEdit, Animate, Db,
  DBTables, SlBookRef, OilStd, Grids, DBGrids, DBGridEh,
  MemDS, DBAccess, Ora, RXSpin, uCommonForm,uOilQuery,uOilStoredProc
  {$IFDEF VER150},Variants{$ENDIF};

type
  TCreateAZSBookForm = class(TCommonForm)
    qNullNum: TOilQuery;
    qLockTable: TOilQuery;
    pButton: TPanel;
    bbCancel: TBitBtn;
    bbOk: TBitBtn;
    qDelete: TOilQuery;
    ds: TOraDataSource;
    bNext: TBitBtn;
    bPrevious: TBitBtn;
    bDelete: TBitBtn;
    Notebook: TNotebook;
    pDefault: TPanel;
    pRekviziti: TPanel;
    lAsz: TLabel;
    LKlient: TLabel;
    LFrom: TLabel;
    ChBAZS: TCheckBox;
    CAZS: TComboEdit;
    ChBKlient: TCheckBox;
    ceKlient: TComboEdit;
    ceFromOrg: TComboEdit;
    pDate: TPanel;
    dbgHelper: TDBGridEh;
    pInWork: TPanel;
    AnimatedImage1: TAnimatedImage;
    LblInWork: TLabel;
    pWarning: TPanel;
    Memo: TMemo;
    gbPeriod: TGroupBox;
    lFromDate: TLabel;
    lToDate: TLabel;
    deFromDate: TDateEdit;
    deToDate: TDateEdit;
    qDelNotUsed: TOilQuery;
    qReserve: TOilQuery;
    qNal: TOilQuery;
    qCheckNN: TOilQuery;
    gbS_DATE: TGroupBox;
    deVipiska: TDateEdit;
    seDateMotion: TRxSpinEdit;
    cbGetDateFromDR: TCheckBox;
    LblDateMotion1: TLabel;
    LblDateMotion2: TLabel;
    qHelper: TOilQuery;
    qInsert: TOilQuery;
    qSaleDet: TOilQuery;
    qBankSr: TOilQuery;
    qBankCheck: TOilQuery;
    qHelper_: TOilQuery;
    qInsert_: TOilQuery;
    qSaleDet_: TOilQuery;
    qAccountPayable: TOilQuery;
    qTestDog: TOilQuery;
    procedure bbCancelClick(Sender: TObject);
    procedure ChBAZSClick(Sender: TObject);
    procedure CAZSButtonClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure ceFromOrgButtonClick(Sender: TObject);
    procedure ceKlientButtonClick(Sender: TObject);
    procedure ChBKlientClick(Sender: TObject);
    procedure bNextClick(Sender: TObject);
    procedure bPreviousClick(Sender: TObject);
    procedure bDeleteClick(Sender: TObject);
    procedure deFromDateChange(Sender: TObject);
    procedure cbGetDateFromDRClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ErrorVisible();
    procedure InWorkVisible();
    procedure GridVisible();
    procedure SetQueryParams(q: TOilQuery);
    procedure log_(s:string);
    (** Процедуры проверок *)
    procedure _TestChek();
    procedure _TestVedomost();
    (** Процедуры сохранения*)
    procedure _SaveVedomost();
    procedure _SaveOther();
    procedure _SaveNal();
    procedure _SaveBankCard();
    procedure _SaveAccountPayable(); // Кредиторская задолженость
  public
    { Public declarations }
    FCause_id: integer;
    FAZSId, FAZSInst: integer;
    procedure Test();
    procedure Save();
    procedure Init();
  end;
const
  infNoDataFound = 'Нет данных для НН %s числа !';
  infIsNNExist = ' Налоговая на %s уже создана !';
  LOG_FILE_NAME = 'AUTOCR_NN.log';
  LOG_PAR_NAME = 'AUTOCR_NN';
  SPONSOR_OPER_ID = '52';//Код операции спонсорская помощь

var
  CreateAZSBookForm: TCreateAZSBookForm;

implementation

{$R *.DFM}

uses
  Main, chooseorg, UDbFunc, TaxBillPrint, ExFunc,MoneyFunc,uExeSql, Progr;
//==============================================================================
procedure TCreateAZSBookForm.Init();
var
  Day, Month, Year: word;
begin
  inherited;
  LoadSQLByForm(TForm(Self));
  ceFromOrg.Text := MAIN_ORG.NAME;
  ceFromOrg.Tag := MAIN_ORG.INST;
  LFrom.Tag := MAIN_ORG.ID;

  deToDate.Date := GetSystemDate;
  deVipiska.Date := GetSystemDate;
  DecodeDate(Date, Year, Month, Day);
  deFromDate.Date := EncodeDate(Year, Month, 1);
  CreateAZSBookForm.Width := 550;
  Notebook.PageIndex := 0;
  case self.FCause_id of
    25:
    begin
      chbAzs.Enabled := False;
      gbPeriod.Visible := False;
      deFromDate.Enabled := False;
      deToDate.Enabled := False;
      chbAzs.State := cbGrayed;
    end;
    else
    begin
      chbAzs.Enabled := True;
      chbKlient.Enabled := True;
    end;
  end;
  ChBAZSClick(nil);
  ChBKlientClick(nil);
end;
//==============================================================================
procedure TCreateAZSBookForm.SetQueryParams(q: TOilQuery);
begin
  if q.Params.FindParam('sdate') <> nil then
    q.ParamByName('sdate').AsDateTime := deVipiska.date;
  if q.Params.FindParam('from_id') <> nil then
    q.ParamByName('from_id').AsInteger := ceFromOrg.Tag;
  if q.Params.FindParam('from_inst') <> nil then
    q.ParamByName('from_inst').AsInteger := LFrom.Tag;
  if q.Params.FindParam('azs_id') <> nil then
    q.ParamByName('azs_id').AsInteger := FAZSId;
  if q.Params.FindParam('azs_inst') <> nil then
    q.ParamByName('azs_inst').AsInteger := FAZSInst;
  if q.Params.FindParam('org_id') <> nil then
    q.ParamByName('org_id').AsInteger := ceKlient.Tag;
  if q.Params.FindParam('org_inst') <> nil then
    q.ParamByName('org_inst').AsInteger := LKlient.Tag;
  if q.Params.FindParam('from_date') <> nil then
    q.ParamByName('from_date').AsDateTime := deFromDate.date;
  if q.Params.FindParam('todate') <> nil then
    q.ParamByName('todate').AsDateTime := deToDate.date;
  if q.Params.FindParam('type_id') <> nil then
    q.ParamByName('type_id').AsInteger := 2;
  if q.Params.FindParam('cause_id') <> nil then
    q.ParamByName('cause_id').AsInteger := FCause_id;
end;
//==============================================================================
procedure TCreateAZSBookForm.ErrorVisible();
begin
//  Notebook.PageIndex := 3;// 'Warning';
  bbCancel.Caption := TranslateText('Закрыть');
  bbCancel.Enabled := True;
  bPrevious.Visible := false;
  bDelete.Visible := false;
  bbOk.Visible := False;
end;
//==============================================================================
procedure TCreateAZSBookForm.InWorkVisible();
begin
//  Notebook.PageIndex := 2;// 'InWork';
  bbOk.Enabled := False;
  bbCancel.Enabled := False;
  bPrevious.Visible := False;
  bDelete.Visible := False;
end;
//==============================================================================
procedure TCreateAZSBookForm.GridVisible();
begin
  case Self.FCause_id of
    11:
      begin
        ds.DataSet := qHelper;
        qHelper.Close;
        SetQueryParams(qHelper);
        _OpenQueryOra(qHelper);
        bDelete.Visible := not qHelper.isEmpty;
      end;
    12:
      begin
        ds.DataSet := qHelper_;
        qHelper_.Close;
        qHelper_.SQL.Text := Format(qHelper_.SQL.Text,['and  ve.oper_id not in ( '+SPONSOR_OPER_ID+OPER_NOT_NN + '-100)']);
        SetQueryParams(qHelper_);
        _OpenQueryPar(qHelper_,
          ['cause',Self.FCause_id]);
        bDelete.Visible := not qHelper.isEmpty;
      end;
    23:
      begin
        ds.DataSet := qHelper_;
        qHelper_.Close;
        qHelper_.SQL.Text := Format(qHelper_.SQL.Text,['and  ve.oper_id = '+SPONSOR_OPER_ID]);
        SetQueryParams(qHelper_);
        _OpenQueryPar(qHelper_,
          ['cause',Self.FCause_id]);
        bDelete.Visible := not qHelper.isEmpty;
      end;
    10,22:
      begin
        (* переходим сразу к созданию НН *)
        Save();
        Exit;
      end;
    25:
      begin
        ds.DataSet := qAccountPayable;
        qAccountPayable.Close;
        SetQueryParams(qAccountPayable);
        _OpenQuery(qAccountPayable);
        //bDelete.Visible := not qAccountPayable.isEmpty;
      end;
  end;//FCause_id

  case Self.FCause_id of
    11,12,23:
    begin
      dbgHelper.FieldColumns['SUM_NDS'].Visible := False;
      bDelete.Enabled := not ds.DataSet.IsEmpty;
    end;
    25:
    begin
      dbgHelper.FieldColumns['CLIENT_NAME'].Width := 430;
      dbgHelper.FieldColumns['AZS_NAME'].Visible := False;
      dbgHelper.FieldColumns['WAS_FROM_DATE'].Visible := False;
      dbgHelper.FieldColumns['WAS_TO_DATE'].Visible := False;
      dbgHelper.FieldColumns['WILL_FROM_DATE'].Visible := False;
      dbgHelper.FieldColumns['WILL_TO_DATE'].Visible := False;
      bDelete.Enabled := true;
    end;
  end;
  Notebook.PageIndex := 1;//'Grid';
  bbOk.Visible := True;
  bNext.Visible := False;
  bPrevious.Visible := True;
  bPrevious.Enabled := True;
  bDelete.Visible := True;
  bbOk.Enabled := not ds.DataSet.IsEmpty;
end;
//==============================================================================
procedure TCreateAZSBookForm.bbCancelClick(Sender: TObject);
begin
  close;
end;
//==============================================================================
procedure TCreateAZSBookForm.ChBAZSClick(Sender: TObject);
begin
  case ChBAZS.State of
    cbChecked:
      begin
        CAZS.Text := TranslateText('Выбраны все АЗС');
        CAZS.Enabled := false;
        FAzsId := -1;
        FAzsInst := -1;
      end;
    cbUnchecked:
      begin
        CAZS.Text := '';
        CAZS.Enabled := true;
      end;
    cbGrayed:
      begin
        CAZS.Text := TranslateText('Выбор недоступен');
        CAZS.Enabled := false;
        ChBAZS.Enabled := false;
        FAzsId := -1;
        FAzsInst := -1;
      end;
  end;
end;
//==============================================================================
procedure TCreateAZSBookForm.CAZSButtonClick(Sender: TObject);
var
  vId, vInst: integer;
  vName: string;
begin
  if ChooseOrg.CaptureOrg(2, Main_id, Inst, 'nnn', vId, vInst, vName) then
  begin
    CAZS.Text := vName;
    FAzsId := vId;
    FAzsInst := vInst;
  end;
end;
//==============================================================================
procedure TCreateAZSBookForm.bbOkClick(Sender: TObject);
begin
  Save();
end;
//==============================================================================
procedure TCreateAZSBookForm.ceFromOrgButtonClick(Sender: TObject);
var
  vId, vInst: integer;
  vName: string;
begin
  if ChooseOrg.CaptureOrg(1, Main_id, Inst, 'yyy', vId, vInst, vName) then
  begin
    ceFromOrg.Text := vName;
    ceFromOrg.Tag := vId;
    LFrom.Tag := vInst;
  end;
end;
//==============================================================================
procedure TCreateAZSBookForm.ceKlientButtonClick(Sender: TObject);
var
  vId, vInst: integer;
  vName: string;
begin
  if ChooseOrg.CaptureOrg(3, Main_id, Inst, 'yyy', vId, vInst, vName) then
  begin
    ceKlient.Text := vName;
    ceKlient.Tag := vId;
    LKlient.Tag := vInst;
  end;
end;
//==============================================================================
procedure TCreateAZSBookForm.ChBKlientClick(Sender: TObject);
begin
  if ChBKlient.Checked = true then
  begin
    ceKlient.Text := TranslateText('Выбраны все клиенты');
    ceKlient.Enabled := false;
    ceKlient.Tag := -1;
    LKlient.Tag := -1;
  end
  else
  begin
    ceKlient.Text := '';
    ceKlient.Enabled := true;
  end;
end;
//==============================================================================
procedure TCreateAZSBookForm.bNextClick(Sender: TObject);
begin
  //Проверяем правильность заполнения полей
  try
    Test();
    GridVisible();
  except on e:exception do
    begin
      ShowMessage(e.message);
      exit;
    end;
  end;

end;
//==============================================================================
procedure TCreateAZSBookForm.bPreviousClick(Sender: TObject);
begin
  bbOk.Visible := False;
  bbOk.Enabled := False;
  bNext.Visible := True;
  bPrevious.Enabled := False;
  bDelete.Visible := False;
  bDelete.Enabled := False;
  Notebook.PageIndex := 0;//'Default';
end;
//==============================================================================
procedure TCreateAZSBookForm.bDeleteClick(Sender: TObject);
var
  Str,msg:string;
  TaxBill: TdmTaxBill;
  Progress: TProgrForm;
begin
  Case FCause_id of
    11: Str := TranslateText(' по ведомости ');
    12: Str := TranslateText(' по прочему отпуску ');
    23: Str := TranslateText(' по прочему отпуску (спонсорская помощь) ');
    25: Str := TranslateText(' по кредиторской задолжености ');
    else
      raise Exception.Create(TranslateText('Данный тип НН удалять за период нельзя!'))
  end;
  msg := TranslateText('Вы действительно хотите удалить ВСЕ выписаные НН')+Str+TranslateText('за период с ')+deFromDate.Text+
         TranslateText(' по ')+deToDate.Text+'?'+#13#10+TranslateText(' Это может привести к не правильной работе программы в этом периоде.')  ;
  if Application.MessageBox(pchar(msg),
                   '',  MB_YESNO + MB_DEFBUTTON2 + MB_ICONWARNING) = IDYES
  then
  begin
    StartSQL;
    qReserve.Close;
    SetQueryParams(qReserve);
    qReserve.Prepare;
    qReserve.Open;
    qReserve.First;

    CommitSQL;
    try
      StartSQL;
      // Удаляем налоговую
      Progress := TProgrForm.CreateBar(Self);
      Progress.MaxValue := qAccountPayable.RecordCount;
      TaxBill:= TdmTaxBill.Create;
      try
        repeat
          TaxBill.DeleteSBRecords10(
            qReserve.FieldByName('Id').AsInteger,
            qReserve.FieldByName('Inst').AsInteger);
          qReserve.Next;
          Progress.AddProgress(1);
        until qReserve.Eof;
      finally
        TaxBill.Free;
        Progress.Free;
      end;

    GridVisible();
    CommitSQL;
  except
   begin
    RollBackSQL;
    MessageDlg(TranslateText('Ошибка : Сбой удаления записей!'),mtError,[mbOk],0);
   end;
  end;
  end;
end;
//==============================================================================
procedure TCreateAZSBookForm.deFromDateChange(Sender: TObject);
var
  Year,Month,Day,eYear,eMonth,eDay:word;
  Date1,Date2:TDateTime;
begin
  if deFromDate.Date <= StrToDate(close_date) then
  begin
    deFromDate.Date := 0;
    raise Exception.Create(TranslateText('Данный период закрыт !'));
  end
  else//выставляем конечную дату последним числом месяца, если месяца не совпадают
  begin
    DecodeDate(deFromDate.Date,Year,Month,Day);
    DecodeDate(deToDate.Date,eYear,eMonth,eDay);
    if(Month<>eMonth)then
    begin
      GetMonthLimits(Month,Year,Date1,Date2);
      deToDate.Date:=Date2;
    end;
  end;
end;
//==============================================================================
procedure TCreateAZSBookForm.cbGetDateFromDRClick(Sender: TObject);
begin
  deVipiska.Enabled :=  not(cbGetDateFromDR.Checked);
  seDateMotion.Enabled := cbGetDateFromDR.Checked;
  deVipiska.Date := 0;
end;
//==============================================================================
procedure TCreateAZSBookForm.log_(s:string);
begin
  if not SysParamExists(LOG_PAR_NAME) then exit;
  exfunc.log(LOG_FILE_NAME,FormatDateTime('dd.mm.yyyy hh:nn:ss',GetSystemDate)+' '+s);
end;
//==============================================================================

//==============================================================================
//================================SAVE==========================================
//==============================================================================
procedure TCreateAZSBookForm.Save();
var
  MaxId: integer;
  TaxBill : TdmTaxBill;
begin
  try
    InWorkVisible();
    // Lock таблицы-резерва
    Application.ProcessMessages;
    qLockTable.Prepare;
    Application.ProcessMessages;
    qLockTable.ExecSQL;
    MaxId := nvl(GetSQLValuePar('select max(id) from oil_sale_book, oil_info '
      +' where state = ''Y'' and inst = main_inst and nn_cause_id=:cause_id ',
      ['cause_id'],
      [ftInteger],
      [Self.FCause_id]),0);
    case Self.FCause_id of
      11: // по ведомости
        Self._SaveVedomost();
      12:// прочий отпуск
      begin
        qInsert_.SQL.Text :=Format(qInsert_.SQL.Text,['and  ve.oper_id not in ( '+SPONSOR_OPER_ID + OPER_NOT_NN + '-100)']);
        qSaleDet_.SQL.Text := format(qSaleDet_.SQL.Text,['and  oil_srother.oper_id not in ( '+SPONSOR_OPER_ID + OPER_NOT_NN + '-100)']);
        Self._SaveOther();
      end;
      23:// прочий отпуск - спонсорская помощь
      begin
        qInsert_.SQL.Text :=Format(qInsert_.SQL.Text,['and  ve.oper_id = '+SPONSOR_OPER_ID]);
        qSaleDet_.SQL.Text := format(qSaleDet_.SQL.Text,['and  oil_srother.oper_id = '+SPONSOR_OPER_ID]);
        Self._SaveOther();
      end;
      10: // наличный расчет
        Self._SaveNal();
      22: //Банковские карты
        Self._SaveBankCard();
      25: //На кредиторскую задолженость
        Self._SaveAccountPayable();
    end;//case FCause_id of
    
    qDelNotUsed.Prepare;
    SetQueryParams(qDelNotUsed);
    TaxBill := TdmTaxBill.Create;
    try
      Application.ProcessMessages;
      SetQueryParams(qNullNum);
      qNullNum.Open;
      while not qNullNum.Eof do
        begin
          StartSQL;
          _ExecSql(' update oil_sale_book '
            +' set num = :num '
            +' where id = :id'
            +' and inst = :inst',
            ['num',TaxBill.GetNextNumber(deVipiska.Date),
             'id',qNullNum.FieldByName('Id').AsInteger,
             'inst',qNullNum.FieldByName('INST').AsInteger]);
          CommitSQL;
          qNullNum.Next;
        end;
    finally
      qNullNum.Close;
      TaxBill.Free;
    end;
    bbOk.Enabled := false;
    bbCancel.Enabled := false;
    pInWork.Visible := false;
    pDefault.Visible := false;
    if MaxId = nvl(GetSQLValuePar('select max(id) from oil_sale_book, oil_info '
      +' where state = ''Y'' and inst = main_inst and nn_cause_id = :cause_id ',
      ['cause_id'],
      [ftInteger],
      [FCause_id]),0)
    then
      MessageDlg(TranslateText('Во время автоформирования не было создано налоговых - проверьте наличие данных !'),
        mtWarning,[mbOk],0);
    ModalResult := mrOk;
  except on E: Exception do
    begin
      RollBackSQL;
      MessageDlg(E.Message + #13#10 +
        TranslateText('Ошибка при формировании книги. Изменения отменены. Проверьте правильность номера следующей налоговой накладной.'),
        mtError, [mbOK], 0);
      ErrorVisible();
    end;
  end;
end;
//==============================================================================
procedure TCreateAZSBookForm._SaveVedomost();
begin
  StartSQLOra;
  Application.ProcessMessages;
  qInsert.Prepare;
  Application.ProcessMessages;
  SetQueryParams(qInsert);
  qInsert.ExecSQL;
  CommitSQLOra;
  // Вставка детализации НН в OIL_SALE_BOOK_DET
  StartSQLOra;
  Application.ProcessMessages;
  qSaleDet.Prepare;
  Application.ProcessMessages;
  qSaleDet.ParamByName('From_date').AsDateTime := deFromDate.Date;
  qSaleDet.ParamByName('Todate').AsDateTime := deToDate.Date;
  qSaleDet.ExecSQL;
  CommitSQLOra;
end;
//==============================================================================
procedure TCreateAZSBookForm._SaveOther();
begin
  StartSQLOra;

  // Вставка записей в книгу учета продаж за прочий отпуск
  Application.ProcessMessages;
  qInsert_.Prepare;
  Application.ProcessMessages;
  SetQueryParams(qInsert_);
  qInsert_.ParamByName('cause').AsInteger := Self.FCause_id;
  qInsert_.ExecSQL;
  CommitSQLOra;
  // Вставка детализации НН в OIL_SALE_BOOK_DET
  StartSQLOra;
  Application.ProcessMessages;
  qSaleDet_.Prepare;
  qSaleDet_.ParamByName('cause').AsInteger := self.FCause_id;
  Application.ProcessMessages;
  qSaleDet_.ParamByName('From_date').AsDateTime := deFromDate.Date;
  qSaleDet_.ParamByName('Todate').AsDateTime := deToDate.Date;
  qSaleDet_.ExecSQL;
  CommitSQLOra;
end;
//==============================================================================
procedure TCreateAZSBookForm._SaveNal();
var
  i,cnt : integer;
  d:double;
  TaxBill : TdmTaxBill;
begin
  StartSQL;
  for i := trunc(deFromDate.Date) to trunc(deToDate.Date) do
  begin
    log_('Проверка на наличие уже созданых НН');
    log_(' Флаг "Все АЗС" = ' + BoolToDaNet(chbAZS.Checked));
    log_(' Дата = ' + FormatDateTime2('dd.mm.yyyy',i));
    if chbAZS.Checked then
    begin
      cnt:=GetSqlValuePar('select count(*) from oil_sale_book sb,oil_sale_book_det sdet '
        +' where sb.state=''Y'' and sdet.state = ''Y'' and sb.id=sdet.nn_id and sb.inst=sdet.nn_inst '
        +'   and nn_cause_id = 10 and det_date = to_date(:p_date,''DD.MM.YYYY'')'
        +'   and sb.inst = ov.GetVal(''INST'') ',
        ['p_date'],
        [ftString],
        [FormatDateTime2('dd.mm.yyyy',i)])
    end
    else
      cnt:=GetSqlValuePar('select count(*) from oil_sale_book sb,oil_sale_book_det sdet '
        +' where sb.state=''Y'' and sdet.state = ''Y'' and sb.id=sdet.nn_id and sb.inst=sdet.nn_inst '
        +'   and nn_cause_id = 10 and det_date = to_date(:p_date,''DD.MM.YYYY'')'
        +'   and azs_id = :azs_id and azs_inst = :azs_inst'
        +'   and sb.inst = ov.GetVal(''INST'') ',
        ['p_date','azs_id','azs_inst'],
        [ftString,ftInteger,ftInteger],
        [FormatDateTime2('dd.mm.yyyy',i),FAZSId,FAZSInst]);
    if 0=cnt then // делаем НН
    begin
      log_(' Делаем НН');
      TaxBill := TdmTaxBill.Create();
      Try
        Taxbill.Options.FromId := main_id;
        TaxBill.Options.FromInst := main_id;
        if cbGetDateFromDR.Checked then
          TaxBill.Options.Date := FormatDateTime2('dd.mm.yyyy',i+seDateMotion.AsInteger)
        else
          TaxBill.Options.Date := FormatDateTime2('dd.mm.yyyy',deVipiska.Date);
        TAxBill.Options.Num := TaxBill.GetNextNumber(i,10);
        TaxBill.Options.OIL_NN_Type := 2;
        TaxBill.Options.OIL_NN_Cause := 10;
        TaxBill.Options.ByDogName := ' ';
        TaxBill.Options.Scheme := Check;
        TaxBill.Options.OperName := TranslateText('Готівка');
        TaxBill.Options.ByDogName := TranslateText('Реализация с АЗС');
        if not(chbAZS.Checked) then
        begin
          Taxbill.Options.FromAzsId := FAZSId;
          Taxbill.Options.FromAzsInst := FAZSInst;
        end;
        log_(' Nal.Open');
        d:=i;
        _OpenQueryParOra(
          qNal,
          ['date_', TDateTime(d),
           'azs_id',BoolTo_(chbAZS.Checked,null,FAZSId),
           'np_id',null,
           'with_nn',null]
          );
        while not(qNal.Eof) do
        Begin
          if(fround(qNal.FieldByName('rasch_litr').AsFloat)<>0)then
          TaxBill.AddPosition(
            qNal.FieldByName('np_type').AsInteger,
            qNal.FieldByName('dim').AsInteger,
            FormatDateTime2('dd.mm.yyyy',i),
            qNal.FieldByName('rasch_litr').AsFloat,
            qNal.FieldByName('s_price').AsFloat,
            qNal.FieldByName('money').AsFloat
            );
          qNal.Next;
        end;
        log_(' Перед TaxBill.Make');
        if qNal.IsEmpty then
          MessageDlg(Format(infNoDataFound,[FormatDateTime2('dd.mm.yyyy',i)]),mtInformation,[mbOk],0)
        else
          TaxBill.Make;
        qNal.Close;
      finally
        TaxBill.Free;
      end;
    end
    else
      log_(' Проверка не пройдена - не делаем НН');
  end;
  CommitSQL;
end;
//==============================================================================
procedure TCreateAZSBookForm._SaveBankCard();
var
  i:integer;
  d:double;
  IsNormalData:boolean;
  TaxBill : TdmTaxBill;
begin
  _OpenQueryParOra(qBankCheck,
    ['DateBegin',deFromDate.Date,
     'DateEnd',deToDate.Date,
     'Azs_Id',FAzsId,
     'Azs_Inst',FAzsInst]);
  if(qBankCheck.IsEmpty)then
  begin
    ShowMessage(TranslateText('Нет данных для налоговых в этом периоде !'));
    exit;
  end;
  for i:=trunc(deFromDate.Date) to trunc(deToDate.Date) do
  begin
    d:=i;
    qBankCheck.Filtered:=False;
    qBankCheck.Filter:=format(' trunc_begin_date=''%s'' or trunc_end_date=''%0:s'' ',[DateToStr(TDateTime(d))]);
    qBankCheck.Filtered:=True;
    qBankCheck.First;
    IsNormalData:=True;
    while not(qBankCheck.Eof) do
    begin
      if(qBankCheck.FieldByName('min_delta').AsFloat<>0)
      or(qBankCheck.FieldByName('max_delta').AsFloat<>0)
      then
      begin
        ShowMessage(TranslateText('Не корректные данные за ')+DateToStr(TDateTime(d)));
        IsNormalData:=False;
        qBankCheck.Last;
      end;
      qBankCheck.Next;
    end;
    if IsNormalData then
    //если нормальные данные, то создаем налоговую
    begin
      if not(qBankSr.Active) then
        _OpenQueryParOra(qBankSr,
          ['DateBegin',deFromDate.Date,
           'DateEnd',deToDate.Date,
           'Azs_Id',FAzsId,
           'Azs_Inst',FAzsInst]);
      TaxBill := TdmTaxBill.Create();
      try
        Taxbill.Options.FromId := main_id;
        TaxBill.Options.FromInst := main_id;
        if not(ChBAZS.Checked)then
        begin
          TaxBill.Options.FromAzsId:=FAzsId;
          TaxBill.Options.FromAzsInst:=FAzsInst;
        end;
        if cbGetDateFromDR.Checked then
          TaxBill.Options.Date := FormatDateTime2('dd.mm.yyyy',TDateTime(d)+seDateMotion.AsInteger)
        else
          TaxBill.Options.Date := FormatDateTime2('dd.mm.yyyy',deVipiska.Date);
        TaxBill.Options.Num := TaxBill.GetNextNumber(i,22);
        TaxBill.Options.OIL_NN_Type := 2;
        TaxBill.Options.OIL_NN_Cause := 22;
        TaxBill.Options.ByDogName := ' ';
        TaxBill.Options.Scheme := Check;

        TaxBill.Options.OperName := TranslateText('Банковские карты');
        TaxBill.Options.ByDogName := TranslateText('Реализация с АЗС');
        qBankSr.Filtered:=False;
        qBankSr.Filter:= Format(' trunc_rep_date = ''%s''',[DateToStr(TDateTime(d))]);
        qBankSr.Filtered:=True;
        if qBankSr.IsEmpty then
          MessageDlg(Format(infNoDataFound,[FormatDateTime2('dd.mm.yyyy',TDateTime(d))]),mtInformation,[mbOk],0)
        else if
          // проверка есть ли НН по ЭТОЙ АЗС, за текущую дату
          (GetSqlValuePar('select count(*) from v_oil_sale_book_det '
            +' where det_date=:det_date and nn_cause_id=22 and '
            +'((azs_id=:azs_id and azs_inst=:azs_inst)or(:azs_id=-1 and :azs_inst=-1))',
            ['det_date','azs_id','azs_inst'],
            [ftDateTime,ftInteger,ftInteger],
            [TDateTime(d),FAzsId,FAzsInst]
            )<>0)
          or
          // проверка есть ли НН по ВСЕМ АЗС, за текущую дату
          (GetSqlValuePar('select count(*) from v_oil_sale_book_det '
            +' where det_date=:det_date and nn_cause_id=22 and '
            +' (azs_id is null and azs_inst is null)',
            ['det_date'],
            [ftDateTime],
            [TDateTime(d)]
            )<>0)
        then
          MessageDlg(Format(infIsNNExist,[FormatDateTime2('dd.mm.yyyy',TDateTime(d))]),mtInformation,[mbOk],0)
        else
        begin
          qBankSr.First;
          while not(qBankSr.Eof) do
          begin
            TaxBill.AddPosition(
              201, //oil_oper_type->отпуск по банковской карточке
              DIM_LITR,
              FormatDateTime2('dd.mm.yyyy',TDateTime(d)),
              qBankSr.FieldByName('litr').AsFloat,
              qBankSr.FieldByName('price').AsFloat,
              qBankSr.FieldByName('money').AsFloat
              );
            qBankSr.Next;
          end;
          TaxBill.Make;
        end;
      finally
        TaxBill.free;
      end;
    end;
  end;
  qBankCheck.Close;
end;
//==============================================================================
procedure TCreateAZSBookForm._SaveAccountPayable();
const
  NpId = 4093;
  DimId = 28;
  Price = 5;
var
  TaxBill: TdmTaxBill;
  nn_id,nn_inst: integer;
  Progress: TProgrForm;
begin
  try
    StartSql;
    qAccountPayable.First;
    Progress := TProgrForm.CreateBar(Self);
    Progress.MaxValue := qAccountPayable.RecordCount*2;
    try
      while not qAccountPayable.Eof do
      begin
        // Делаем НН
        TaxBill := TdmTaxBill.Create();
        Try
          Taxbill.Options.FromId := main_id;
          TaxBill.Options.FromInst := main_id;
          Taxbill.Options.ToId := qAccountPayable.FieldByName('client_id').AsInteger;
          TaxBill.Options.ToInst := qAccountPayable.FieldByName('client_inst').AsInteger;
          TaxBill.Options.Date := FormatDateTime2('dd.mm.yyyy',deVipiska.Date);
          TaxBill.Options.Num := TaxBill.GetNextNumber(deVipiska.Date,25,1);
          TaxBill.Options.OIL_NN_Type := 1;
          TaxBill.Options.OIL_NN_Cause := 25;
          TaxBill.Options.OperName := TranslateText('Оплата з р/р');
          TaxBill.Options.ByDogName := TranslateText('Cогласно договора');
          TaxBill.AddPosition(
            NpId,
            DimId,
            FormatDateTime2('dd.mm.yyyy',deVipiska.Date),
            FRound(qAccountPayable.FieldByName('sum_nds').AsCurrency/Price,2),
            Price,
            qAccountPayable.FieldByName('sum_nds').AsCurrency
            );
          TaxBill.Make;
          nn_id := TaxBill.Options.TaxBillId;
          nn_inst := TaxBill.Options.TaxBillInst;
        finally
          TaxBill.Free;
        end;
        Progress.AddProgress(1);
        // Делаем корректировку
        TaxBill := TdmTaxBill.Create();
        Try
          TaxBill.Options.TaxBillId_Link := nn_id;
          TaxBill.Options.TaxBillInst_Link := nn_inst;
          Taxbill.Options.FromId := main_id;
          TaxBill.Options.FromInst := main_id;
          Taxbill.Options.ToId := qAccountPayable.FieldByName('client_id').AsInteger;
          TaxBill.Options.ToInst := qAccountPayable.FieldByName('client_inst').AsInteger;
          TaxBill.Options.Date := FormatDateTime2('dd.mm.yyyy',deVipiska.Date+1);
          //TaxBill.Options.Num := '1'; //TaxBill.GetNextNumber(deVipiska.Date+1,25,3);
          TaxBill.Options.OIL_NN_Type := 3;
          TaxBill.Options.OIL_NN_Cause := 25;
          TaxBill.Options.TaxBillType := 8; // корректировка
          TaxBill.Options.OperName := TranslateText('Оплата з р/р');
          TaxBill.Options.ByDogName := TranslateText('Cогласно договора');
          TaxBill.AddPosition(
            NpId,
            DimId,
            FormatDateTime2('dd.mm.yyyy',deVipiska.Date+1),
            // Больше дискретность, для сумм типа 1 копейки
            -FRound(qAccountPayable.FieldByName('sum_nds').AsCurrency/Price,4),
            Price,
            'C'
            );
          TaxBill.Make;
        finally
          TaxBill.Free;
        end;
        Progress.AddProgress(1);
        qAccountPayable.Next;
      end;
    finally
      Progress.Free;
    end;
    CommitSql;
  except
    begin
      RollbackSql;
      raise;
    end;
  end;
end;

//==============================================================================
//============================END=SAVE==========================================
//==============================================================================

//==============================================================================
//================================TEST==========================================
//==============================================================================
procedure TCreateAZSBookForm.Test();
var
  y1, m1, d, y2, m2:word;
begin
   //Проверяем правильность заполнения полей
  if (deVipiska.Date = 0 )and (not(cbGetDateFromDR.Checked)and(FCause_id in [10,22]))then
    raise Exception.Create(TranslateText('Дата выписки обязательна.'));
  if ceFromOrg.Text = '' then
    raise Exception.Create(TranslateText('Поставщик обязателен.'));
  if (CAZS.Text = '') and (CAZS.Enabled) then
    raise Exception.Create(TranslateText('Номер АЗС обязателен.'));
  if ceKlient.Text = '' then
    raise Exception.Create(TranslateText('Клиент обязателен.'));
  if (deFromDate.Date = 0)and(deFromDate.Enabled) then
    raise Exception.Create(TranslateText('Дата начала периода обязательна.'));
  if (deToDate.Date = 0)and(deToDate.Enabled) then
    raise Exception.Create(TranslateText('Дата конца периода обязательна.'));
  if (deToDate.Date > GetSystemDate)and(deToDate.Enabled) then
    raise Exception.Create(TranslateText('Дата конца периода еще не наступила. Это недопустимо.'));
  if (deToDate.Date < deFromDate.Date) and (deToDate.Enabled) and (deFromDate.Enabled) then
    raise Exception.Create(TranslateText('Дата конца периода меньше, чем дата начала.'));
  if (deToDate.Enabled) and (deFromDate.Enabled) then
  begin
    DecodeDate(deFromDate.Date, y1, m1, d);
    DecodeDate(deToDate.Date, y2, m2, d);
    if (m1 <> m2) or (y1 <> y2) then
      raise Exception.Create(TranslateText('Диапазон дат должен умещаться в одном календарном месяце.'));
  end;
  //проверка по типам
  case FCause_id of
    10:
      _TestChek();
    25:
    begin
      DecodeDate(deVipiska.Date, y1, m1, d);
      DecodeDate(deVipiska.Date+1, y1, m2, d);
      if m1=m2 then
        raise Exception.Create(TranslateText('В данном типе НН в поле дата выписки должно стоять последнее число месяца!'));
      deFromDate.Date := deVipiska.Date;
      deToDate.Date := deVipiska.Date+1;
    end;
    11: //АЗС (Ведомость)
    begin
      (* Проверка на правильность договора *)
      _TestVedomost();
    end;
  end;//case
end;
//==============================================================================
procedure TCreateAZSBookForm._TestChek();
const
  str_msg='Для корректной работы программы необходимо в следующих НН по чекам просавить дату чека : ';
  str_msg_azs='Для корректной работы программы необходимо в следующих НН по чекам просавить дату чека и указать АЗС : ';
var
  i,j,cntBadNN:integer;
  arBadNN :array of string;
  num:string;
  IsNumExist:boolean;
  koma:char;
  str:string;

  //----------------------------------------------------------------------------
begin
  log_(TranslateText('Начата проверка НН по чекам'));
  cntBadNN := 0;
  for i:= trunc(deFromDate.Date) to trunc(deToDate.Date) do
  begin
    qCheckNN.Close;
    if ChBAZS.Checked then
      qCheckNN.AddWhere(' det.det_date is null ')
    else
      qCheckNN.AddWhere(' ((det.det_date is null) or(sb.azs_id is null and sb.azs_inst is null ))');
    _OpenQueryParOra(qCheckNN,
      ['det_date',FormatDateTime2('dd.mm.yyyy',i) ]);
    qCheckNN.First;
    if not(qCheckNN.IsEmpty)then //Если проверяем наличие даты чека и номера АЗС
    begin
      SetLength(arBadNN,cntBadNN + qCheckNN.RecordCount);
      while not(qCheckNN.Eof) do
      begin
        num := format(TranslateText('№ %s от %s'),
          [qCheckNN.FieldByName('num').AsString,
           FormatDateTime2('dd.mm.yyyy',qCheckNN.FieldByName('s_date').AsDateTime)]);
        IsNumExist:=false;
        for j:= 0 to high(arBadNN) do
        begin
          if(arBadNN[j] = num)then
          begin
            IsNumExist:= true;
            break;
          end;
          if arBadNN[j] = '' then
            break;
        end;
        if not(IsNumExist) then
        begin
          arBadNN[cntBadNN]:= num;
          inc(cntBadNN);
        end;
        qCheckNN.Next;
      end;
    end;
  end;
  // есть ошибки, формируем сообщение
  if cntBadNN > 0 then
  begin
    SetLength(arBadNN,cntBadNN);
    koma := ' ';
    for i:= 0 to cntBadNN - 1  do
    begin
      if arBadNN[cntBadNN] <> '' then
      begin
        if i mod 10 = 0 then
          str := str + #13#10;
        str:= str+koma+arBadNN[i];
        koma:= ',';
      end;
    end;
    if ChBAZS.Checked then
      raise Exception.Create(str_msg + str)
    else
      raise Exception.Create(str_msg_azs + str);
  end;
  log_(TranslateText('Окончена проверка НН по чекам'));
end;
//==============================================================================
procedure TCreateAZSBookForm._TestVedomost();
begin
  qHelper.Close;
  SetQueryParams(qHelper);
  _OpenQueryOra(qHelper);
  qHelper.First;
  while not qHelper.Eof do
  begin
    _OpenQueryPar(qTestDog,
      ['to_id', qHelper.FieldByName('organ').AsInteger,
       'to_inst', qHelper.FieldByName('organ_inst').AsInteger,
       'end_date', deToDate.Date]);
    if qTestDog.FieldByName('cnt').AsInteger = 0 then
      raise Exception.CreateFmt(TranslateText('Не найден договор по ведомости c %s до %s'),
        [GetOrgName(
           qHelper.FieldByName('organ').AsInteger,
           qHelper.FieldByName('organ_inst').AsInteger),
         deToDate.Text]);
    qTestDog.Close;
    qHelper.Next;
  end;
end;
//==============================================================================
//============================END=TEST==========================================
//==============================================================================

procedure TCreateAZSBookForm.FormShow(Sender: TObject);
begin
  inherited;
  Init();
end;

end.
