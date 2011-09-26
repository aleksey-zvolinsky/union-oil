unit CardDocEnh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Mask, ToolEdit, ChooseOrg, Main,
  Db, Ora, Grids, DBGridEh, DBTables, DBCtrls, RXDBCtrl, ComCtrls, TaxBillPrint,
  Menus, RXCtrls, MemDS, DBAccess, uCommonForm,uOilQuery,uOilStoredProc
  {$IFDEF VER150},Variants, GridsEh, DBGridEhGrouping{$ENDIF};

type
  TfrmCardDocEnh = class(TCommonForm) 
    pcMain: TPageControl;
    tsPrintTaxBills: TTabSheet;
    gbPrintTB: TGroupBox;
    bbPrint: TBitBtn;
    tsReservTaxBills: TTabSheet;
    dbgReserv: TDBGridEh;
    GroupBox2: TGroupBox;
    bbReservStart: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ceOrgName: TComboEdit;
    deFrom: TDateEdit;
    deTo: TDateEdit;
    sbClearOptions: TSpeedButton;
    dbgViewTaxBills: TDBGridEh;
    bbRefresh: TBitBtn;
    rbOriginal: TRadioButton;
    rbCopy: TRadioButton;
    cbOutputType: TComboBox;
    Label6: TLabel;
    sbViewReserv: TRxSpeedButton;
    pmViewReserv: TPopupMenu;
    miMustReserved: TMenuItem;
    miReserved: TMenuItem;
    tsRest: TTabSheet;
    GroupBox4: TGroupBox;
    tsMakePrePay: TTabSheet;
    GroupBox1: TGroupBox;
    qRest: TOilQuery;
    qWork: TOilQuery;
    qCheckDog: TOilQuery;
    dsRest: TOraDataSource;
    dsReserv: TOraDataSource;
    qReservNum: TOilQuery;
    qViewTaxBills: TOilQuery;
    dsViewTaxBills: TOraDataSource;
    pm: TPopupMenu;
    miPrintGrid: TMenuItem;
    dbgRest: TDBGridEh;
    sbSum: TSpeedButton;
    bbMakeCorr: TBitBtn;
    bbCheckRest: TBitBtn;
    dbgMake: TDBGridEh;
    qMake: TOilQuery;
    btnShowTB: TBitBtn;
    bbMake: TSpeedButton;
    sbMakeSum: TSpeedButton;
    bbClose: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    bbDelTaxBills: TSpeedButton;
    sbEdit: TRxSpeedButton;
    pmEditTB: TPopupMenu;
    miAddDelta: TMenuItem;
    dsMake: TOraDataSource;
    bbDelReserved: TBitBtn;
    Label4: TLabel;
    cbNpGroup: TComboBox;
    sbGroupClear: TSpeedButton;
    qMake_Old: TOilQuery;
    ceNpType: TComboEdit;
    sbNpTypeClear: TSpeedButton;
    Label7: TLabel;
    procedure ceOrgNameButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbRefreshClick(Sender: TObject);
    procedure bbPrintClick(Sender: TObject);
    procedure sbClearOptionsClick(Sender: TObject);
    procedure bbReservStartClick(Sender: TObject);
    procedure miMustReservedClick(Sender: TObject);
    procedure miReservedClick(Sender: TObject);
    procedure bbDelTaxBillsClick(Sender: TObject);
    procedure bbCheckRestClick(Sender: TObject);
    procedure sbSumClick(Sender: TObject);
    procedure dbgRestGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure bbMakeCorrClick(Sender: TObject);
    procedure miPrintGridClick(Sender: TObject);
    procedure ceNpTypeButtonClick(Sender: TObject);
    procedure sbNpTypeClearClick(Sender: TObject);
    procedure btnShowTBClick(Sender: TObject);
    procedure sbMakeSumClick(Sender: TObject);
    procedure bbMakeClick(Sender: TObject);
    procedure miAddDeltaClick(Sender: TObject);
    procedure dsMakeDataChange(Sender: TObject; Field: TField);
    procedure sbGroupClearClick(Sender: TObject);
    procedure bbDelReservedClick(Sender: TObject);
    procedure ceNpTypeChange(Sender: TObject);
    procedure dsRestDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
  private
   procedure SetOptionsByQuery();
   procedure OpenReservQ;
  public
    OrgId, OrgInst, NpType : Integer;
    OrgName : String;
  end;
var
  frmCardDocEnh: TfrmCardDocEnh;


implementation

uses UDBFunc, OilStd, DogRef, Dog, CardCorrDog, MoneyFunc,
  ExcelFunc, uXMLForm, uStart, uExeSql, ExFunc;
{$R *.DFM}

var
  TaxBill : TdmTaxBill;

procedure TfrmCardDocEnh.ceOrgNameButtonClick(Sender: TObject);
begin
  if not ChooseOrg.CaptureOrg(3, MAIN_ID, INST, 'yyy', OrgId, OrgInst, OrgName)
    then Exit;
  qCheckDog.Close;
  qCheckDog.ParamByName('OrgId').asInteger := OrgId;
  qCheckDog.ParamByName('OrgInst').asInteger := OrgInst;
  qCheckDog.Open;
  if qCheckDog.IsEmpty then
  begin
    ceOrgName.Text := '';
    OrgId:=0; OrgInst :=0;
    OrgName:='';
    raise Exception.Create(TranslateText('Для данного клиента не существует договор по картам ЛС'));
  end;
  ceOrgName.Text := OrgName;
end;

procedure TfrmCardDocEnh.FormShow(Sender: TObject);
begin
  deFrom.Date := Now();
  deTo.Date := Now();
  cbOutputType.ItemIndex := 0;
  sbClearOptionsClick(nil);
  NpType :=0;
  OrgId := 0;
  orgInst := 0;
  pcMain.ActivePageIndex := 0;
  cbNpGroup.Visible := (VarToStr(ReadOilVar('NN_OPLAT_ONLY'))<>'0');
  sbGroupClear.Visible := (VarToStr(ReadOilVar('NN_OPLAT_ONLY'))<>'0');
  label4.Visible := (VarToStr(ReadOilVar('NN_OPLAT_ONLY'))<>'0');
end;

procedure TfrmCardDocEnh.bbCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCardDocEnh.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCardDocEnh.bbRefreshClick(Sender: TObject);
begin                        
  with qViewTaxBills do
  begin
    Close;
    SQL.Text := BaseSQL;
    ParamByName('OrgId').asInteger := OrgId;
    ParamByName('OrgInst').asInteger := OrgInst;
    ParamByName('FromDate').asDateTime := deFrom.Date;
    ParamByName('ToDate').asDateTime := deTo.Date;
    ParamByName('Reserved').asInteger := 0;
    if  cbNpGroup.ItemIndex = 0  then AddWhere(' np.petrol_id = 3 ');
    if  cbNpGroup.ItemIndex = 1  then AddWhere(' np.petrol_id in (4,5,6,7) ');
    Open;
    //dbgViewTaxBills.OptimizeColsWidth(dbgViewTaxBills.VisibleColumns);
    bbPrint.Enabled := not isEmpty;
    bbDelTaxBills.Enabled := not isEmpty;
  end;
end;

procedure TfrmCardDocEnh.bbPrintClick(Sender: TObject);
var
  CurrNumber, CurrType : String;
  ProgressBar : TProgressBar;
  CurrPlace : TBookMark;
  flNew : Boolean;
begin
  if not qViewTaxBills.Active then exit;
  if MessageDlg(TranslateText('Подтвердите операцию '),mtConfirmation,[mbYes,mbNo],0) = mrNo then Exit;
  ProgressBar := TProgressBar.Create(Application);
  CurrPlace :=  qViewTaxBills.GetBookmark;
  try
    ProgressBar.SetMaxValue(qViewTaxBills.RecordCount);
    qViewTaxBills.DisableControls;
    qViewTaxBills.First;
    flNew := true;
    while not qViewTaxBills.Eof do
    begin
      if (dbgViewTaxBills.SelectedRows.CurrentRowSelected)  then
      begin
        CurrNumber := qViewTaxBills.FieldByName('TaxBillNum').asString;
        CurrType := qViewTaxBills.FieldByName('TaxBillType').asString;
      end else CurrNumber :='';

      //новый документ
      if (flNew) then
      begin
        TaxBill := TDmTaxBill.Create(
          qViewTaxBills.FieldByName('OrgId').asInteger,
          qViewTaxBills.FieldByName('OrgInst').asInteger
        );
        TaxBill.Options.OIL_NN_Cause:=6;
        TaxBIll.Options.IsCustomPrintSettings := true;
        TaxBill.Options.ToId := qViewTaxBills.FieldByName('OrgId').asInteger;
        TaxBill.Options.ToInst := qViewTaxBills.FieldByName('OrgInst').asInteger;
        TaxBill.Options.PrintSettings.CopyOnly := rbCopy.Checked;
        TaxBill.Options.PrintSettings.OrigOnly := not rbCopy.Checked;
        case cbOutputType.ItemIndex of
          0 : TaxBill.Options.Output := toScreen;
          1 : TaxBill.Options.Output := toDisk;
          2 : TaxBill.Options.Output := toPrinter;
        end;
        flNew:=false;
      end;
      ProgressBar.Step();
      if (dbgViewTaxBills.SelectedRows.CurrentRowSelected) then
      begin
        TaxBill.Options.Date := qViewTaxBills.FieldByName('TaxBillDate').asString;
        TaxBill.Options.Num := qViewTaxBills.FieldByName('TaxBillNum').asString;
        TaxBill.AddPosition( //BySB
          qViewTaxBills.FieldByName('Np_id').asInteger,
          qViewTaxBills.FieldByName('Dim_id').asInteger,
          qViewTaxBills.FieldByName('TaxBillDate').asString,  // ShipDate
          qViewTaxBills.FieldByName('CountLitr').asFloat,     // Litr
          qViewTaxBills.FieldByName('PriceNds').asFloat,       // PriceNDS
          qViewTaxBills.FieldByName('SumNds').asFloat      
        );
      end;
      qViewTaxBills.Next;
      //если изменился номер напечатать и освободить память
      if(
         (CurrNumber <> qViewTaxBills.FieldByName('TaxBillNum').asString) and
         (CurrNumber <> '') and
         (dbgViewTaxBills.SelectedRows.CurrentRowSelected)
        )
        or
         (
          (CurrNumber <> '') and
          (not TaxBill.mtTaxBillData.IsEmpty)  and
          (not dbgViewTaxBills.SelectedRows.CurrentRowSelected)
         )
         or (not TaxBill.mtTaxBillData.IsEmpty) and   (qViewTaxBills.eof)
        then
      begin
        TaxBill.Options.TaxBillType := StrToInt(CurrType);
        TaxBill.PutToExcel();
        CurrNumber := qViewTaxBills.FieldByName('TaxBillNum').asString;
        CurrType := qViewTaxBills.FieldByName('TaxBillType').asString;
        flNew := true;
      end;
    end;
    qViewTaxBills.EnableControls;
    if qViewTaxBills.BookmarkValid(CurrPlace) then
    begin
      qViewTaxBills.GotoBookmark(CurrPlace);
      qViewTaxBills.FreeBookmark(CurrPlace);
    end;
    ProgressBar.Free();
    TaxBill.Free();
  except on E:Exception do
    begin
      TaxBill.Free();
      ProgressBar.Free();
      if qViewTaxBills.BookmarkValid(CurrPlace) then qViewTaxBills.FreeBookmark(CurrPlace);
      qViewTaxBills.EnableControls;
      Raise Exception.Create(TranslateText('Ошибка печати НН:')+#13#10+E.Message);
    end;
  end;
  //--
end;

procedure TfrmCardDocEnh.sbClearOptionsClick(Sender: TObject);
begin
  OrgName := '';
  OrgId := 0;
  OrgInst := 0;
  ceOrgName.Text := '';
end;

procedure TfrmCardDocEnh.bbReservStartClick(Sender: TObject);
var
  ProgressBar : TProgressBar;
begin
  if MessageDlg(TranslateText('Подтвердите операцию') ,mtConfirmation,[mbYes,mbNo],0) = mrNo then Exit;
  try
    ProgressBar := TProgressBar.Create(self);
    TaxBill := TdmTaxBill.Create(qReservNum.FieldByName('OrgId').asInteger,qReservNum.FieldByName('OrgInst').asInteger);
    TaxBill.Options.OIL_NN_Cause:=6;
    OpenReservQ();
    if qReservNum.isEmpty then raise Exception.Create(TranslateText('Нет данных для резервирования НН'));
    ProgressBar.SetMaxValue(qReservNum.RecordCount);
    while not qReservNum.eof do
    begin
      TaxBill.Options.ToId := qReservNum.FieldByName('OrgId').asInteger;
      TaxBill.Options.ToInst := qReservNum.FieldByName('OrgInst').asInteger;
      TaxBill.Options.Date := qReservNum.FieldByName('TaxBillDate').asString;
      TaxBill.MakeReserved();
      qReservNum.Next;
      ProgressBar.Step();
    end;
    TaxBill.Free();
    ProgressBar.Free();
    MessageDlg(TranslateText('Зарезервировано ')+IntToStr(qReservNum.RecordCount)+TranslateText(' накладных') ,mtInformation,[mbOk],0);
    miReservedClick(nil);
  except on E:Exception do
    begin
      TaxBill.Free();
      ProgressBar.Free();
      MessageDlg(E.Message,mtError,[mbOk],0);
    end;
  end; //try
end;

procedure TfrmCardDocEnh.OpenReservQ;
begin
  with qReservNum do
  begin
    Close;
    SQL.Text := BaseSQL;
    if (OrgId > 0) and (OrgInst > 0) then
    begin
      AddWhere(' res.OrgId = ' + IntToStr(OrgId));
      AddWhere(' res.OrgInst = ' + IntToStr(OrgInst));
    end;
    SetOrderBy('res.ExpDate ');
    ParamByName('FromDate').asDateTime := deFrom.Date;
    ParamByName('ToDate').asDateTime := deTo.Date;
    Open;
  end;
end;
procedure TfrmCardDocEnh.miMustReservedClick(Sender: TObject);
begin
  dsReserv.DataSet := qReservNum;
  OpenReservQ;
  if not qReservNum.isEmpty then bbReservStart.Enabled := True;
end;

procedure TfrmCardDocEnh.miReservedClick(Sender: TObject);
begin
  qWork.SQL.Text := qViewTaxBills.BaseSQL;
  dsReserv.DataSet := qWork;
  bbReservStart.Enabled := False;
  with qWork do
  begin
    Close;
    ParamByName('OrgId').asInteger := OrgId;
    ParamByName('OrgInst').asInteger := OrgInst;
    ParamByName('FromDate').asDateTime := deFrom.Date;
    ParamByName('ToDate').asDateTime := deTo.Date;
    ParamByName('Reserved').asInteger := 1;
    Open;
  end;
end;


procedure TfrmCardDocEnh.bbDelTaxBillsClick(Sender: TObject);
var strNum : String;
  ProgressBar : TProgressBar;
begin

  if MessageDlg(TranslateText('Подтвердите УДАЛЕНИЕ налоговой(ых) накладной(ых)'), mtConfirmation,[mbYes, mbNo],0)= mrNo then exit;

  TaxBill := TdmTaxBill.Create(
    qViewTaxBills.FieldByName('OrgId').asInteger,
    qViewTaxBills.FieldByName('OrgInst').asInteger
  );
  try
    TaxBill.Options.OIL_NN_Cause:=6;
    ProgressBar := TProgressBar.Create(Application);
    ProgressBar.SetMaxValue(dbgViewTaxBills.SelectedRows.Count);
    StartSQL();
    try
      qViewTaxBills.DisableControls;
      qViewTaxBills.First;
      while not qViewTaxBills.Eof do
      begin
        strNum := qViewTaxBills.FieldByName('TaxBillNum').asString;
        TaxBill.Options.ToId := qViewTaxBills.FieldByName('OrgId').asInteger;
        TaxBill.Options.ToInst := qViewTaxBills.FieldByName('OrgInst').asInteger;
        if (dbgViewTaxBills.SelectedRows.CurrentRowSelected) then
        TaxBill.DeleteSBRecords(
          qViewTaxBills.FieldByName('tbid').asInteger,
          qViewTaxBills.FieldByName('tbinst').asInteger,
          qViewTaxBills.FieldByName('TaxBillType').asInteger
        );
        ProgressBar.Step();
        qViewTaxBills.Next;
        //не удалять второй раз одну и ту же налоговую
        while (strNum = qViewTaxBills.FieldByName('TaxBillNum').asString) and (not qViewTaxBills.eof) do
        begin
          strNum := qViewTaxBills.FieldByName('TaxBillNum').asString;
          qViewTaxBills.Next;
        end;
      end;
      CommitSQL();
      bbRefreshClick(nil);
    except on E:Exception do
      begin
        RollBackSQL();
        MessageDlg(TranslateText('Ошибка удаления налоговой накладной'),mtWarning,[mbOk],0);
      end;
    end;
  finally
    TaxBill.Free;
    ProgressBar.Free();
    qViewTaxBills.EnableControls();
  end;
end;

procedure TfrmCardDocEnh.bbCheckRestClick(Sender: TObject);
begin
  bbMakeCorr.Enabled := false;
  with qRest do
  begin
    Close;
    SQL.Text := baseSQL;
    ParamByName('np_type').AsInteger := cbNpGroup.ItemIndex;

    if (OrgId > 0) and (OrgInst > 0) then
    begin
      ParamByName('org_id').AsInteger := OrgId;
      ParamByName('org_inst').AsInteger := OrgInst;
    end;

    if NpType > 0 then
      ParamByName('np_type').AsString := IntToStr(NpType);

    ParamByName('todate').AsString := deTo.Text;
    ParamByName('dogdate').AsDate := deFrom.Date - 30;
    Open;
    //dbgRest.OptimizeColsWidth(dbgRest.VisibleColumns);
  end;
end;

procedure TfrmCardDocEnh.sbSumClick(Sender: TObject);
begin
  if sbSum.Down
    then dbgRest.FooterRowCount := 1
    else dbgRest.FooterRowCount := 0;
   //dbgRest.OptimizeColsWidth(dbgRest.VisibleColumns);
end;

procedure TfrmCardDocEnh.dbgRestGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if not dbgRest.DataSource.DataSet.IsEmpty then
  begin
    if qRest.FieldByName('PrePay').AsInteger = 0 then
      AFont.Color := clRed;

    if qRest.FieldByName('DOG_AMOUNT').AsCurrency <> 0 then
      if qRest.FieldByName('MONEY').AsCurrency <> qRest.FieldByName('DOG_AMOUNT').AsCurrency then
        Background := $00D7E6FD;
  end;

  if (State = [gdSelected]) or (State = [gdSelected, gdFocused]) then
  begin
    AFont.Color := clWhite;
    BackGround := clNavy;
  end;
end;

procedure TfrmCardDocEnh.bbMakeCorrClick(Sender: TObject);
var
  CorrDog : TCardCorrDogForm;
begin

  if qRest.FieldByName('Rest_Litr').asFloat <= 0
    then raise Exception.Create(TranslateText('Недостаточно литров для переброски'));

  if qRest.FieldByName('Np_Type').asString = ReadOILVar('NN_OPLAT_ONLY')
    then raise Exception.Create(TranslateText('Переброска с данного вида НП не возможна'));

  if Copy(qRest.FieldByName('DogName').asString,length(qRest.FieldByName('DogName').asString)-3,1) = '*'
    then raise Exception.Create(TranslateText('Повторная корректировка не допустима'));

  CorrDog := TCardCorrDogForm.Create(self);
  with CorrDog do
  begin
    OrgId  := qRest.FieldByName('To_Id').asInteger;
    OrgInst := qRest.FieldByName('To_Inst').asInteger;
    edDogName.Text := qRest.FieldByName('DogName').asString;
    edNpType.Text := qRest.FieldByName('NpName').asString;
    edCountLitr.Text := qRest.FieldByName('Rest_Amount').asString;
    vt.Insert;
    vtNpType.AsInteger := qRest.FieldByName('Np_Type').asInteger;
    vtNpName.asString := edNpType.Text;
    vtPrice.asFloat := qRest.FieldByName('Price').asFloat;
    vtSum.asFloat := qRest.FieldByName('Rest_Amount').asFloat;
    vtOper.AsInteger := 1;
    vt.Post;                          
    ShowModal;
    Free;
  end;
end;                          

procedure TfrmCardDocEnh.miPrintGridClick(Sender: TObject);
begin
  if (pcMain.ActivePageIndex = 0) and (not qRest.isEmpty) then
  begin
    dbgRest.DataSource.DataSet.DisableControls;
    PutGridEhToExcel(dbgRest, TranslateText('Остатки предоплаты'));
    dbgRest.DataSource.DataSet.EnableControls;
  end;

  if (pcMain.ActivePageIndex = 2) and (not qMake.isEmpty) then
  begin
    dbgMake.DataSource.DataSet.DisableControls;
    PutGridEhToExcel(dbgMake, TranslateText('Налоговые накладые лдя формирования'));
    dbgMake.DataSource.DataSet.EnableControls;
  end;

  if (pcMain.ActivePageIndex = 3) and (not qViewTaxBills.isEmpty) then
  begin
    dbgViewTaxBills.DataSource.DataSet.DisableControls;
    PutGridEhToExcel(dbgViewTaxBills, TranslateText('Сформированные НН'));
    dbgViewTaxBills.DataSource.DataSet.EnableControls;
  end;
end;

procedure TfrmCardDocEnh.ceNpTypeButtonClick(Sender: TObject);
begin
  XMLChoose('npgroupref','PETROL_ID',NpType,ceNpType);
end;

procedure TfrmCardDocEnh.sbNpTypeClearClick(Sender: TObject);
begin
  ceNpType.Text := '';
  NpType := 0;
  ceNpTypeChange(nil);
  if qMake.Active then qMake.Close;
end;

procedure TfrmCardDocEnh.btnShowTBClick(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
  Application.ProcessMessages;
  if qMake.Active then qMake.Close;
  qMake.SQL.Text := qMake.BaseSQL;
  case cbNpGroup.ItemIndex of
    0 : qMake.AddWhere(' calc_nn.np_type = 3 ');
    1 : qMake.AddWhere(' calc_nn.np_type in (4,5,6,7) ');
  end;
  qMake.ParamByName('ToID').asInteger := OrgId;
  qMake.ParamByName('ToInst').asInteger := OrgInst;
  qMake.ParamByName('NpType').asInteger := NpType;
  qMake.ParamByName('FromDate').asDateTime := deFrom.Date;
  qMake.ParamByName('ToDate').asDateTime := deTo.Date;
  qMake.Open;
  //dbgMake.OptimizeColsWidth(dbgMake.VisibleColumns);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCardDocEnh.sbMakeSumClick(Sender: TObject);
begin
  if sbMakeSum.Down
    then dbgMake.FooterRowCount := 1
    else dbgMake.FooterRowCount := 0;
  //dbgMake.OptimizeColsWidth(dbgMake.VisibleColumns);
end;

procedure TfrmCardDocEnh.SetOptionsByQuery();
begin
  TaxBill.Options.PayNum := qMake.FieldByName('Pay_num').asString;
  TaxBill.Options.Date := qMake.FieldByName('NN_date').asString;
  TaxBill.Options.TaxBillType := qMake.FieldByName('Nal_T').asInteger;
  case qMake.FieldByName('Nal_T').asInteger of
   7 : TaxBill.Options.OIL_NN_Type := 2;
   9 : TaxBill.Options.OIL_NN_Type := 1;
   8 : TaxBill.Options.OIL_NN_Type := 3;
   6 : TaxBill.Options.OIL_NN_Type := 4;
  end;
  TaxBill.Options.OIL_NN_Cause := 6;
  TaxBill.Options.ToId := qMake.FieldByName('To_Id').asInteger;
  TaxBill.Options.ToInst := qMake.FieldByName('To_Inst').asInteger;
  if qMake.FieldByName('nn_id').asInteger <> 0 then
  begin
    TaxBill.Options.TaxBillId :=  qMake.FieldByName('nn_id').asInteger;
    TaxBill.Options.TaxBillInst :=  qMake.FieldByName('nn_Inst').asInteger;
  end;
  TaxBill.Options.Num :=   qMake.FieldByName('nn_num').asString;
end;

procedure TfrmCardDocEnh.bbMakeClick(Sender: TObject);
var
  strDate : String;
  iNNid,iNNInst,iCountNN,iTaxType, OrgId, OrgInst : Integer;
  bAllowMake : Boolean;
  ProgressBar : TProgressBar;
begin
  iCountNN := 0;
  if qMake.isEmpty then exit;
  if (MessageDlg(TranslateText('Подтвердите формирование налоговых накладных'),mtConfirmation,[mbYes,mbNo],0) = mrNo) then exit;
  try
    if GENERATION >= 2 then
      TaxBill := TdmTaxBill.Create(
        qMake.FieldByName('To_Id').asInteger,
        qMake.FieldByName('To_Inst').asInteger,
        AVIAS_ID, AVIAS_INST
       )
    else
      TaxBill := TdmTaxBill.Create(
        qMake.FieldByName('To_Id').asInteger,
        qMake.FieldByName('To_Inst').asInteger
       );
    TaxBill.Options.OIL_NN_Cause:=6;
    ProgressBar := TProgressBar.Create(Application);
    ProgressBar.SetMaxValue(qMake.RecordCount);
    qMake.DisableControls;
    qMake.Last;
    strDate := qMake.FieldByName('NN_date').asString;
    StartSQL;
    try
      while not qMake.Bof do
      begin
        SetOptionsByQuery();
        if qMake.FieldByName('real_nn_litr').isNull
        then
          TaxBill.AddPosition(
            qMake.FieldByName('Np_Type').asInteger,
            28,
            qMake.FieldByName('NN_Date').asString,
            qMake.FieldByName('calc_nn_litr').asFloat,
            qMake.FieldByName('calc_nn_Price').asFloat,
            qMake.FieldByName('calc_nn_sum').asFloat
          );
        strDate := qMake.FieldByName('NN_date').asString;
        iTaxType := qMake.FieldByName('Nal_T').asInteger;
        OrgId := qMake.FieldByName('to_id').asInteger;
        OrgInst := qMake.FieldByName('to_inst').asInteger;
        iNNid := qMake.FieldByName('nn_id').asInteger;
        iNNinst := qMake.FieldByName('nn_inst').asInteger;
        bAllowMake := qMake.FieldByName('real_nn_litr').isNull;
        qMake.Prior;
        ProgressBar.Step();
        if ((strDate <> qMake.FieldByName('NN_date').asString)
         or(iTaxType <> qMake.FieldByName('Nal_T').asInteger)
         or(OrgId <> qMake.FieldByName('to_id').asInteger)
         or(OrgInst <> qMake.FieldByName('to_inst').asInteger)
         or(iNNid <> qMake.FieldByName('nn_id').asInteger)
         or(iNNinst <> qMake.FieldByName('nn_inst').asInteger)
         or(not qMake.FieldByName('real_nn_litr').isNull)
         or(qMake.Bof))
         and(bAllowMake)
        then
        begin
          TaxBill.Make();
          inc(iCountNN);
        end;
      end;
      CommitSQL;
      btnShowTBClick(nil);
      MessageDlg(TranslateText('Операция завершена')+#13#10+TranslateText('Сформировано ')+IntToStr(iCountNN)+TranslateText(' накладных'), mtInformation, [mbOk],0);
    except on E:Exception do
      begin
        RollBackSQL;
        MessageDlg(TranslateText('Ошибка:')+e.message,mtWarning,[mbok],0)
      end;
    end;
  finally
    ProgressBar.Free();
    TaxBill.Free();
    qMake.EnableControls;
  end;
end;

procedure TfrmCardDocEnh.miAddDeltaClick(Sender: TObject);
begin
  if (MessageDlg(TranslateText('Подтвердите формирование налоговых накладных'),mtConfirmation,[mbYes,mbNo],0) = mrNo) then exit;
  try
    TaxBill := TdmTaxBill.Create(
      qMake.FieldByName('To_Id').asInteger,
      qMake.FieldByName('To_Inst').asInteger
     );
    SetOptionsByQuery();
    try
      StartSQL;
      TaxBill.AddPosition(
         qMake.FieldByName('Np_Type').asInteger,
         28,
         qMake.FieldByName('NN_Date').asString,
         qMake.FieldByName('delta_litr').asFloat,
         qMake.FieldByName('calc_nn_Price').asFloat,
         qMake.FieldByName('delta_sum').asFloat
      );
      TaxBill.Make();
      CommitSQL;
      btnShowTBClick(nil);
    except on E:Exception do
      begin
        RollBackSQL;
        MessageDlg(TranslateText('Ошибка:')+e.message,mtWarning,[mbok],0);
      end;
    end;

  finally
    TaxBill.Free();
  end;
end;

procedure TfrmCardDocEnh.dsMakeDataChange(Sender: TObject; Field: TField);
begin
 sbEdit.Enabled := (qMake.FieldByName('delta_litr').asInteger > 0);// and (cbNpGroup.ItemIndex<>-1);
end;

procedure TfrmCardDocEnh.sbGroupClearClick(Sender: TObject);
begin
  cbNpGroup.ItemIndex := -1;
end;

procedure TfrmCardDocEnh.bbDelReservedClick(Sender: TObject);
begin
  if qWork.IsEmpty then exit;
  if MessageDlg(TranslateText('Подтвердите УДАЛЕНИЕ зарезервированной налоговой накладной'), mtConfirmation,[mbYes, mbNo],0)= mrNo then exit;

  TaxBill := TdmTaxBill.Create(
    qWork.FieldByName('OrgId').asInteger,
    qWork.FieldByName('OrgInst').asInteger
  );
  try
    StartSQL();
    try
      TaxBill.DeleteSBRecords(
         qWork.FieldByName('tbid').asInteger,
         qWork.FieldByName('tbinst').asInteger,
         qWork.FieldByName('TaxBillType').asInteger
      );
    CommitSQL();
    miReservedClick(nil);
    except on E:Exception do
      begin
        RollBackSQL();
        MessageDlg(TranslateText('Ошибка удаления зарезервированной налоговой накладной')+#13#10+E.Message,mtWarning,[mbOk],0);
      end;
    end;
  finally
    TaxBill.Free;
  end;
end;

procedure TfrmCardDocEnh.ceNpTypeChange(Sender: TObject);
begin
  bbMake.Enabled:= (''=ceNpType.Text);
end;

procedure TfrmCardDocEnh.dsRestDataChange(Sender: TObject; Field: TField);
begin
  bbMakeCorr.Enabled := qRest.FieldByName('Rest_litr').asFloat > 0;
end;

procedure TfrmCardDocEnh.FormCreate(Sender: TObject);
begin
  inherited;
  LoadSQLByForm(TForm(Self));
end;

end.
