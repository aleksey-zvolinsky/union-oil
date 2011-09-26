unit uLoadBankCard;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, Db, DBTables, Buttons, Grids,
  DBGridEh, MemDS, DBAccess, Ora, CheckLst, uCommonForm,uOilQuery,uOilStoredProc,
  MemTable, Menus, ExcelFunc, ComCtrls, ActnList, GridsEh, DBGridEhGrouping,
  ImgList, Admin;

type
  TLoadBankCardForm = class(TCommonForm)
    gbChooseFile: TGroupBox;
    Panel1: TPanel;
    tblFile: TTable;
    dsFile: TOraDataSource;
    Panel2: TPanel;
    bbLoad: TBitBtn;
    qryIns: TOilQuery;
    bbCancel: TBitBtn;
    pChooseDir: TPanel;
    dedFiles: TDirectoryEdit;
    qryReload: TOilQuery;
    cbReload: TCheckBox;
    mtXmlFile: TMemoryTable;
    mtXmlFileid_term: TStringField;
    mtXmlFileissuer: TStringField;
    mtXmlFilen_card: TStringField;
    mtXmlFilekomiss: TCurrencyField;
    mtXmlFilesumm_op: TCurrencyField;
    mtXmlFilesumm_vozvr: TCurrencyField;
    mtXmlFiledate: TDateTimeField;
    mtXmlFileretailer: TStringField;
    PopupMenu: TPopupMenu;
    Excel1: TMenuItem;
    mtXmlFileretailer2: TStringField;
    mtXmlFilecurr2: TStringField;
    qryUpdateInfFields: TOraQuery;
    gbData: TGroupBox;
    dbgFileContent: TDBGridEh;
    pnlDeleteFile: TPanel;
    sbDelFile: TSpeedButton;
    Panel3: TPanel;
    spDelTrans: TSpeedButton;
    ActionList1: TActionList;
    Action1: TAction;
    ProgressBar: TProgressBar;
    pfiles: TPanel;
    lbfiles: TListBox;
    pFilters: TPanel;
    qDevice: TOilQuery;
    ImageTree: TImageList;
    tvFilters: TTreeView;
    pmFilters: TPopupMenu;
    miFiltersAll: TMenuItem;
    miFiltersNoAll: TMenuItem;
    cbFilters: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbLoadClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure dedFilesAfterDialog(Sender: TObject; var Name: String;
      var Action: Boolean);
    procedure lbfilesClick(Sender: TObject);
    procedure spDelTransClick(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure miFiltersAllClick(Sender: TObject);
    procedure miFiltersNoAllClick(Sender: TObject);
    procedure cbFiltersClick(Sender: TObject);
  private
    FPath: String;
    FLog: TStringList;
    F: TAdminForm;
    procedure _(AText:string);
    procedure SaveToDb;
    procedure LoadXmlFile;
    procedure LoadDbfFile;
    procedure LoadXlsFile;
    procedure AppearNewColumns;
    procedure GetFilters(iImage: integer); // проставляємо у всьому дереві малюнок
    procedure SetFilters(); // створюємо фільтр по терміналам
  public
  end;

var
  LoadBankCardForm: TLoadBankCardForm;

implementation

uses OilStd, TaxBillPrint, UDbFunc, Main, ExFunc, Variants, uXMLForm, ComObj,
  DateUtils, uImportFunc;
  
const
  LOG_NAME = 'LOAD_BANK_CARD';
  LOG_FILE_NAME = 'LOAD_BANK_CARD.LOG';  

{$R *.DFM}

function StrTo(AValue:String): String;
begin
  try
    if Pos(',',AValue) = 0 then
      if Pos('.',AValue)<> 0 then
        AValue[Pos('.',AValue)]:=DecimalSeparator;
    if AValue = '' then AValue :='0';  
    result :=  AValue;
  except

  end;
end;

procedure TLoadBankCardForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TLoadBankCardForm.bbLoadClick(Sender: TObject);
begin
  SaveToDb;
end;

procedure TLoadBankCardForm.bbCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TLoadBankCardForm.dedFilesAfterDialog(Sender: TObject;
  var Name: String; var Action: Boolean);
var
  sr : TSearchRec;
  procedure LoadFiles(AFileMask: string);
  begin
    if FindFirst(FPath+AFileMask,faAnyFile,sr) = 0 then
    repeat
      if FileExists(FPath+'\'+sr.Name) then
        lbFiles.Items.Add(sr.Name);
    until FindNext(sr)<>0;
  end;
begin
  lbFiles.Clear;
  tblFile.Close;
  tblFile.TableName := '';
  FPath := Name+'\';
  LoadFiles('*.dbf');
  LoadFiles('*.xml');
  LoadFiles('*.xls');
  if lbFiles.Items.Count = 1 then
  begin
    lbFiles.ItemIndex := 0;
    lbFilesClick(nil);
  end;
end;

procedure TLoadBankCardForm.GetFilters(iImage: integer); // проставляємо у всьому дереві малюнок
var
  i: integer;
begin
  for i := 0 to tvFilters.Items.Count - 1 do
    tvFilters.Items.Item[i].ImageIndex := iImage;
end;

procedure TLoadBankCardForm.lbfilesClick(Sender: TObject);
begin
  try
    if lbFiles.Items.Count = 0 then
      Exit;
    dsFile.DataSet.DisableControls;
    try
      if AnsiUpperCase(ExtractFileExt(lbFiles.Items.Strings[lbFiles.ItemIndex])) = '.DBF' then
      begin
        LoadDbfFile;
        dsFile.DataSet := tblFile;
      end
      else if AnsiUpperCase(ExtractFileExt(lbFiles.Items.Strings[lbFiles.ItemIndex])) = '.XML' then
      begin
        LoadXmlFile;
        dsFile.DataSet := mtXmlFile;
      end
      else if AnsiUpperCase(ExtractFileExt(lbFiles.Items.Strings[lbFiles.ItemIndex])) = '.XLS' then
      begin
        LoadXlsFile;
        dsFile.DataSet := mtXmlFile;
      end;
    finally
      SetFilters(); // створюємо фільтр по терміналам

      dsFile.DataSet.EnableControls;
    end;
    AppearNewColumns;
  except on E:Exception do
    raise Exception.Create('Ошибка при просмотре: '+e.Message);
  end;
end;

procedure TLoadBankCardForm.spDelTransClick(Sender: TObject);
begin
  tblFile.Delete;
end;

procedure TLoadBankCardForm._(AText:string);
begin
  if SysParamExists(LOG_NAME) then
    ExFunc.log(LOG_FILE_NAME,FormatDateTime('dd.mm.yyyy hh:nn:ss',now())+' '+AText)
  else
    FLog.Add(FormatDateTime('dd.mm.yyyy hh:nn:ss',now())+' '+AText);
end;

procedure TLoadBankCardForm.LoadXmlFile;
const
  XSTATEMENT='statement';
  XDATA='data';
  XRETAILER='retailer'; 
  XTERMINAL='terminal';
  XCODE='code';
  XTRANSACTIONS='transactions';
  XROW='row';
  XCOLUMN='column';
  XID='id';
var
  i,j:integer;
  FXMLDoc: Variant;
  FRootNode: Variant;
  StatementNode, DataNode, RetailerNode, TerminalNode, TransactionNode,
  RowNode: Variant;
  TerminalId, RetailerId: string;
  function GetChildNode(AParrentNode: Variant; AName: string): Variant;
  var i: integer;
  begin
    result := null;
    for i:=0 to AParrentNode.ChildNodes.length-1 do
      if AParrentNode.ChildNodes.Item[i].NodeName = AName then
        result := AParrentNode.ChildNodes.Item[i];
  end;
  function GetChildNodeAttr(AParrentNode: Variant; AName, AAttrName, AAttrValue: string): Variant;
  var i: integer;
  begin
    result := null;
    for i:=0 to AParrentNode.ChildNodes.length-1 do
      if AParrentNode.ChildNodes.Item[i].NodeName = AName then
        if GetAttrValue(AParrentNode.ChildNodes.Item[i],AAttrName) = AAttrValue then
          result := AParrentNode.ChildNodes.Item[i];
  end;
  function GetDate(ADate, ATime:string):TDateTime;
  var
    AYear, AMonth, ADay, AHour, AMinute, ASecond: Word;
    str: string;
  begin
    ADay := StrToInt(copy(ADate,1,pos('.',ADate)-1));
    str := copy(ADate,pos('.',ADate)+1,length(ADate));
    AMonth := StrToInt(copy(str,1,pos('.',str)-1));
    str := copy(str,pos('.',str)+1,length(str));
    AYear := StrToInt(str);

    AHour := StrToInt(copy(ATime,1,pos(':',ATime)-1));
    str := copy(ATime,pos(':',ATime)+1,length(ATime));
    AMinute := StrToInt(copy(str,1,pos(':',str)-1));
    str := copy(str,pos(':',str)+1,length(str));
    ASecond := StrToInt(str);

    Result := EncodeDateTime(AYear, AMonth, ADay, AHour, AMinute, ASecond, 0);
  end;
begin
{
<?xml version="1.0" encoding="Cp1251"?>
<equaringStatement>
<...>
<statement>
    <data>
        <...>
        <retailer>
            <...>
            <code>Код точки</code>
        <terminal>
            <...>
            <code>Код терминала</code>
        <transactions>
            <row>
                <column id="tranDate">Дата транзакции</column>
                <column id="tranTime">Время транзакции</column>
                <column id="tranPost">Дата обработки</column>
                <column id="slip">Номер слипа</column>
                <column id="pan">Номер карты</column>
                <column id="fio">ФИО владельца</column>
                <column id="approval">Код авторизации</column>
                <column id="curr">Валюта транзакции</column>
                <column id="amt">Сумма транзакции</column>
                <column id="fee">Комиссия банка</column>
                <column id="compensation">Сумма возмещения</column>
                <column id="state">Статус</column>
}
  if mtXmlFile.Active then
    mtXmlFile.Close;
  mtXmlFile.EmptyTable;
  mtXmlFile.Open;
  FXMLDoc := CreateOleObject('Microsoft.XMLDOM.1.0');
  FXMLDoc.Load(FPath + lbFiles.Items.Strings[lbFiles.ItemIndex]);
  FXMLDoc.PreserveWhiteSpace := true;
  FXMLDoc.Async := false;
  if FXMLDoc.parseError.ErrorCode <> 0 then
  begin
    ShowMessage( GetParseError(FXMLDoc.parseError) );
    Exit;
  end;
  FRootNode := FXMLDoc.DocumentElement;
  StatementNode := GetChildNode(FRootNode,XSTATEMENT);
  begin
    ProgressBar.Visible := True;
    Self.Repaint;
    ProgressBar.Position := 0;
    ProgressBar.Max := StatementNode.ChildNodes.length;
    ProgressBar.Step := 1;
    for i:=0 to StatementNode.ChildNodes.length-1 do
    begin
      ProgressBar.StepIt;
      if StatementNode.ChildNodes.Item[i].NodeName = XDATA then
      begin
        DataNode := StatementNode.ChildNodes.Item[i];
        begin
          RetailerNode := GetChildNode(DataNode,XRETAILER);
          begin
            RetailerId := GetChildNode(RetailerNode,XCODE).Text;
          end;
          TerminalNode := GetChildNode(DataNode,XTERMINAL);
          begin
            TerminalId := GetChildNode(TerminalNode,XCODE).Text;
          end;
          TransactionNode := GetChildNode(DataNode,XTRANSACTIONS);
          begin
            for j:=0 to TransactionNode.ChildNodes.length-1 do
            begin
              if TransactionNode.ChildNodes.Item[j].NodeName = XROW then
              begin
                RowNode := TransactionNode.ChildNodes.Item[j];
                begin
                  mtXmlFile.Insert;
                  mtXmlFile.FieldByName('id_term').asString := TerminalId;
                  mtXmlFile.FieldByName('retailer').asString := RetailerId;
                  mtXmlFile.FieldByName('date').asDateTime :=
                    GetDate(GetChildNodeAttr(RowNode, XCOLUMN, XID, 'tranDate').Text,GetChildNodeAttr(RowNode, XCOLUMN, XID, 'tranTime').Text);
                  mtXmlFile.FieldByName('n_card').asString := GetChildNodeAttr(RowNode, XCOLUMN, XID, 'pan').Text;
                  mtXmlFile.FieldByName('curr').AsString:= GetChildNodeAttr(RowNode, XCOLUMN, XID, 'curr').Text;
                  if StrToFloat(StrTo(GetChildNodeAttr(RowNode, XCOLUMN, XID, 'amt').Text)) > 0 then
                  begin
                    mtXmlFile.FieldByName('summ_op').AsFloat := StrToFloat(StrTo(GetChildNodeAttr(RowNode, XCOLUMN, XID, 'amt').Text));
                    mtXmlFile.FieldByName('summ_vozvr').AsFloat := 0;
                  end
                  else
                  begin
                    mtXmlFile.FieldByName('summ_op').AsFloat := 0;
                    mtXmlFile.FieldByName('summ_vozvr').AsFloat := StrToFloat(StrTo(GetChildNodeAttr(RowNode, XCOLUMN, XID, 'amt').Text))
                  end;
                  mtXmlFile.FieldByName('komiss').AsFloat := - StrToFloat(StrTo(GetChildNodeAttr(RowNode, XCOLUMN, XID, 'fee').Text));
                  mtXmlFile.FieldByName('issuer').AsString := 'PRIVAT';
                  mtXmlFile.Post;
                end;
              end;
            end;
          end;
        end;
      end; // if NodeName = XDATA
    end; //for i:=0 to StatementNode.
  end;
  dsFile.DataSet := mtXmlFile;
  ProgressBar.Position := 0;
  ProgressBar.Visible := False;
end;

procedure TLoadBankCardForm.LoadDbfFile;
begin
  dsFile.DataSet := tblFile;
  tblFile.Close;
  tblFile.TableName := FPath + lbFiles.Items.Strings[lbFiles.ItemIndex];
  tblFile.Open;
end;

procedure TLoadBankCardForm.AppearNewColumns;
var
  i,j: integer;
  IsExists: boolean;
  ceCol: TColumnEh;
  ds: TDataSet;
  gr: TDBGridEh;
begin
  ds := dbgFileContent.DataSource.DataSet;
  gr := dbgFileContent;
  if( Debugging )and( ds.Fields.Count <> gr.Columns.Count )then
  begin
    for i:=0 to ds.Fields.Count-1 do
    begin
      IsExists := false;
      for j:=0 to gr.Columns.Count-1 do
      begin
        if gr.Columns[j].FieldName = ds.Fields.Fields[i].FieldName then
          IsExists := true;
        //Проверели все, колонки нет, добавляем...
        if(j = gr.Columns.Count-1)and(not IsExists) then
        begin
          ceCol := gr.Columns.Add;
          ceCol.FieldName := ds.Fields.Fields[i].FieldName;
          ceCol.Title.Caption := ds.Fields.Fields[i].DisplayLabel;
          ceCol.Width := ds.Fields.Fields[i].DisplayWidth;
        end;
      end;
    end;
  end;
end;

procedure TLoadBankCardForm.LoadXlsFile;
var
  str: string;
begin
  if mtXmlFile.Active then
    mtXmlFile.Close;
  mtXmlFile.EmptyTable;
  mtXmlFile.Open;
  ProgressBar.Visible := True;
  Self.Repaint;
  ProgressBar.Position := 0;
  ImportFunc.MoveExcelToDataSet(FPath + lbFiles.Items.Strings[lbFiles.ItemIndex],2,mtXmlFile,
    ['Тип топлива','Литры','Серийный','Дата и время авторизации','АЗС','АЗС адрес'],
    ['curr', 'summ_op', 'n_card', 'date', 'retailer', 'retailer_addres'], ProgressBar);
  mtXmlFile.First;
  while not mtXmlFile.Eof do
  begin
    mtXmlFile.Edit;
    str := mtXmlFile.FieldByName('retailer_addres').AsString;
    str := copy(str, pos('(',str)+1, length(str));
    str := copy(str, 1, pos(')',str)-1);
    mtXmlFile.FieldByName('id_term').AsString := str;
    mtXmlFile.FieldByName('issuer').AsString := 'PRIVAT';
    mtXmlFile.Post;
    mtXmlFile.Next;
  end;
  ProgressBar.Position := 0;
  ProgressBar.Visible := False;
end;

procedure TLoadBankCardForm.SaveToDb;
var
  iLoaded, iRefused, iReLoaded, iInCloseDate, iNoLoaded: Integer;
  strMsg:string;
  tblFile: TDataSet;
  //----------------------------------------------------------------------------
  function ProcessTermId( ATermId: string): String;
  var
    IsProcessed: boolean;
    TermId: integer;
  begin
    if ATermId[1] in ['0'..'9'] then
      IsProcessed := TryStrToInt(ATermId, TermId)
    else
      // отрезаем первый буквенный символ
      IsProcessed := TryStrToInt(copy(ATermId, 2, length(ATermId)-1), TermId);
    if IsProcessed then
      Result := IntToStr(TermId)
    else
      Result := ATermId;
  end;
  //----------------------------------------------------------------------------
  procedure ExecQuery( AQuery:TOilQuery );
  begin
    AQuery.Prepare;
    AQuery.ParamByName('oper_date').asDateTime := tblFile.FieldByName('date').asDateTime;
    AQuery.ParamByName('terminal_id').asString := ProcessTermId(tblFile.FieldByName('id_term').asString);
    AQuery.ParamByName('issuer').asString := tblFile.FieldByName('issuer').asString;
    AQuery.ParamByName('card_number').asString := tblFile.FieldByName('n_card').asString;
    AQuery.ParamByName('amount').AsFloat := tblFile.FieldByName('summ_op').AsFloat;
    AQuery.ParamByName('amount_ret').AsFloat := tblFile.FieldByName('summ_vozvr').AsFloat;
    AQuery.ParamByName('commission').AsFloat := tblFile.FieldByName('komiss').AsFloat;
    if tblFile.FindField('curr') = nil then
      AQuery.ParamByName('currency').Value := Null
    else
      AQuery.ParamByName('currency').AsString:= tblFile.FieldByName('curr').AsString;

    AQuery.ExecSQL;
  end;
  //----------------------------------------------------------------------------
  function GetIdTerm(sIdTerm: string): boolean;
  var
    i: integer;
  begin
    if tvFilters.Items.Count = 0 then
      result := true
    else
    begin
      result := false;
      for i := 0 to tvFilters.Items.Count - 1 do
        if tvFilters.Items.Item[i].Text = sIdTerm then
        begin
          result := tvFilters.Items.Item[i].ImageIndex = 1;
          break;
        end;
    end;
  end;
  //----------------------------------------------------------------------------
begin
  _('Начало загрузки');
  iLoaded:=0; iRefused:=0; iReLoaded:=0; iInCloseDate:=0; iNoLoaded := 0;
  if MessageDlg(TranslateText('Подтвердите загрузку'),mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    Exit;
  _('Загрузка подтверждена');
  _('Устанавливаем дополнительные поля в уже загруженых данных');
  qryUpdateInfFields.ExecSQL;
  _('Устанавливка дополнительных полей прошла успешно');
  tblFile := dsFile.DataSet;
  StartSQLOra;
  _('Создан прогресс-бар');
  dbgFileContent.DataSource.DataSet.DisableControls;
  try
    try
      tblFile.First;
      _('Вышли на первую строку файла');
      ProgressBar.Visible := True;
      Self.Repaint;
      ProgressBar.Position := 0;
      ProgressBar.Max := tblFile.RecordCount;
      ProgressBar.Step := 1;
      _('Установили максимальное значение прогресс-бара');
      _('Начинаем бежать по файлу');
      while not tblFile.eof do with tblFile do
      begin
        if GetIdTerm(tblFile.FieldByName('id_term').asString) then
        begin
          _(' Проверка на попадание в закрытый период');
          if( FieldByName('date').AsDateTime<StrToDate(CLOSE_DATE) )then
          begin
            Inc(iInCloseDate);
            _(' Транзакция в закрытом периоде');
          end
          else
          begin
            (** Не загружать если уже есть транзакции с такой датой и номером терминала *)
            _(' Проверка на наличие транзакции');
            if 0 < GetSQLValueParSimple('select count(*) '
              +' from bank_card_transaction '
              +'where oper_date = :date_ '
              +'  and terminal_id = :term_id '
              +'  and sign(amount) = sign(:amount) '
              +'  and state=''Y'' ',
              ['date_',FieldByName('date').AsDateTime,
               'term_id',ProcessTermId(tblFile.FieldByName('id_term').asString),
               'amount', tblFile.FieldByName('summ_op').AsFloat])
            then
            begin
              _(' Запись уже есть в БД, проверка на возможность перезагрузки');
              if not cbReload.Checked then // флаг перезагрузки не стоит
              begin
                Inc(iRefused);
                _(' Запись в повторные');
              end
              else
              begin // перегружаем запись
                ExecQuery( qryReload );
                ExecQuery( qryIns );
                Inc(iReLoaded);
                _(' Запись перезагружена');
              end;
            end
            else
            begin // создаем новую запись
              ExecQuery( qryIns );
              Inc(iLoaded);
              _(' Создана новая запись');
            end;
          end;
        end
        else
        begin
          _(' Запись отфильтрованная');
          Inc(iNoLoaded);
        end;
        ProgressBar.StepIt;
        Next;
        _(' Прокрутили прогресс-бар и перешли к следующей строке');
      end;
      CommitSQLOra;
      _(' Сохранили измененния');
    except on E:Exception do
      begin
        RollbackSQLOra;
        _(' Откатили изменения из-за ошибки "'+E.Message+'"');
        if not SysParamExists(LOG_NAME) then
          FLog.SaveToFile(GetMainDir+LOG_FILE_NAME);
        MessageDlg('Ошибка при загрузке :' + #13#10
          + E.Message + #13#10
          + 'При повторении ошибки обратитесь к разработчикам, предоставив следующие файлы:' + #13#10
          + '1. Скриншот данного сообщения;' + #13#10
          + '2. Банковскую выписку;' + #13#10
          + '3. Лог загрузки '+GetMainDir+LOG_FILE_NAME + '.'
          ,mtError,[mbOk],0);
      end
    end;
  finally
    ProgressBar.Position := 0;
    ProgressBar.Visible := False;
    dbgFileContent.DataSource.DataSet.EnableControls;
    //FreeAndNil(ProgressBar);
    //_(' Уничтожили прогресс-бар');
    strMsg:=TranslateText('Загрузка завершена.')+#13#10
      +TranslateText('Всего транзакций: ')+IntToStr(tblFile.RecordCount)+#13#10
      +TranslateText('Загружено: ')+IntToStr(iLoaded)+#13#10
      +TranslateText('Отфильтровано: ')+IntToStr(iNoLoaded)+#13#10
      +TranslateText('Перегружено: ')+IntToStr(iReLoaded)+#13#10
      +TranslateText('Повторных: ')+IntToStr(iRefused);
    if( iInCloseDate<>0 )then
      strMsg:=strMsg+#13#10+TranslateText('В закрытом периоде (не загружено): ')+IntToStr(iInCloseDate);
    MessageDlg( strMsg,mtInformation,[mbOk],0 );
    _(' Выдали сообщение об успешной загрузке, со следующим текстом'+#13#10+strMsg);
  end;
end;

procedure TLoadBankCardForm.Excel1Click(Sender: TObject);
begin
  inherited;
  dbgFileContent.DataSource.DataSet.DisableControls;
  try
    PutGridEhToExcel(dbgFileContent, '', '');
  finally
    dbgFileContent.DataSource.DataSet.EnableControls;  
  end;
end;

procedure TLoadBankCardForm.FormCreate(Sender: TObject);
begin
  inherited;
  FLog := TStringList.Create;

  F := TAdminForm.Create(Application);
  tvFilters.OnChanging := F.MenuTreeChanging;
end;

procedure TLoadBankCardForm.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FLog);
  FreeAndNil(F);
end;

procedure TLoadBankCardForm.miFiltersAllClick(Sender: TObject);
begin
  GetFilters(1); // проставляємо у всьому дереві малюнок
end;

procedure TLoadBankCardForm.miFiltersNoAllClick(Sender: TObject);
begin
  GetFilters(2); // проставляємо у всьому дереві малюнок
end;

procedure TLoadBankCardForm.SetFilters(); // створюємо фільтр по терміналам
var
  i: integer;
  sIdTerm, sIdTerms: string;
  bTreeNodeP: boolean;
  TreeNodeP: TTreeNode;
begin
  if dsFile.DataSet.Active and pFilters.Visible then
  try
    tvFilters.Items.Clear;
    sIdTerms := ',';

    // перевідкриваємо табличку з терміналами і прив"язками до АЗС
    qDevice.Close;
    qDevice.Open;

    // добавляємо термінали у фільтр
    dsFile.DataSet.DisableControls;
    dsFile.DataSet.First;
    while not dsFile.DataSet.Eof do
    begin
      sIdTerm := dsFile.DataSet.FieldByName('id_term').AsString;

      // фільтруємо таблицю з терміналами і прив"язками до АЗС
      qDevice.Filtered := false;
      qDevice.Filter   := 'device_num = '''+ sIdTerm +'''';
      qDevice.Filtered := true;

      if pos(','+ sIdTerm +',', sIdTerms) = 0 then
      begin
        if qDevice.FieldByName('azs_num').AsString = '' then // якщо АЗС НЕ знайдена
          tvFilters.Items.Add(nil, sIdTerm)
        else
        begin // якщо АЗС знайдена
          bTreeNodeP := false;
          for i := 0 to tvFilters.Items.Count - 1 do // якщо АЗС вже занесена у дерево
            if tvFilters.Items.Item[i].Text = TranslateText('АЗС №')+ qDevice.FieldByName('azs_num').AsString then
            begin
              TreeNodeP := tvFilters.Items.Item[i];
              tvFilters.Items.AddChild(TreeNodeP, sIdTerm);
              bTreeNodeP := true;
              break;
            end;

          if not bTreeNodeP then // якщо АЗС ще НЕ занесена у дерево
          begin
            TreeNodeP := tvFilters.Items.Add(nil, TranslateText('АЗС №')+ qDevice.FieldByName('azs_num').AsString);
            tvFilters.Items.AddChild(TreeNodeP, sIdTerm);
          end;
        end;

        sIdTerms := sIdTerms + sIdTerm +','; // запам"ятовуємо, номер терміналу
      end; // if pos(','+ sIdTerm +',', sIdTerms) = 0 then
      dsFile.DataSet.Next;
    end;
  finally
    dsFile.DataSet.First;
    dsFile.DataSet.EnableControls;

    GetFilters(1); // проставляємо у всьому дереві малюнок
  end;
end;

procedure TLoadBankCardForm.cbFiltersClick(Sender: TObject);
begin
  pFilters.Visible := cbFilters.Checked;

  SetFilters(); // створюємо фільтр по терміналам
end;

end.
