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
    procedure GetFilters(iImage: integer); // ������������ � ������ ����� �������
    procedure SetFilters(); // ��������� ������ �� ���������
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

procedure TLoadBankCardForm.GetFilters(iImage: integer); // ������������ � ������ ����� �������
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
      SetFilters(); // ��������� ������ �� ���������

      dsFile.DataSet.EnableControls;
    end;
    AppearNewColumns;
  except on E:Exception do
    raise Exception.Create('������ ��� ���������: '+e.Message);
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
            <code>��� �����</code>
        <terminal>
            <...>
            <code>��� ���������</code>
        <transactions>
            <row>
                <column id="tranDate">���� ����������</column>
                <column id="tranTime">����� ����������</column>
                <column id="tranPost">���� ���������</column>
                <column id="slip">����� �����</column>
                <column id="pan">����� �����</column>
                <column id="fio">��� ���������</column>
                <column id="approval">��� �����������</column>
                <column id="curr">������ ����������</column>
                <column id="amt">����� ����������</column>
                <column id="fee">�������� �����</column>
                <column id="compensation">����� ����������</column>
                <column id="state">������</column>
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
        //��������� ���, ������� ���, ���������...
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
    ['��� �������','�����','��������','���� � ����� �����������','���','��� �����'],
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
      // �������� ������ ��������� ������
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
  _('������ ��������');
  iLoaded:=0; iRefused:=0; iReLoaded:=0; iInCloseDate:=0; iNoLoaded := 0;
  if MessageDlg(TranslateText('����������� ��������'),mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    Exit;
  _('�������� ������������');
  _('������������� �������������� ���� � ��� ���������� ������');
  qryUpdateInfFields.ExecSQL;
  _('������������ �������������� ����� ������ �������');
  tblFile := dsFile.DataSet;
  StartSQLOra;
  _('������ ��������-���');
  dbgFileContent.DataSource.DataSet.DisableControls;
  try
    try
      tblFile.First;
      _('����� �� ������ ������ �����');
      ProgressBar.Visible := True;
      Self.Repaint;
      ProgressBar.Position := 0;
      ProgressBar.Max := tblFile.RecordCount;
      ProgressBar.Step := 1;
      _('���������� ������������ �������� ��������-����');
      _('�������� ������ �� �����');
      while not tblFile.eof do with tblFile do
      begin
        if GetIdTerm(tblFile.FieldByName('id_term').asString) then
        begin
          _(' �������� �� ��������� � �������� ������');
          if( FieldByName('date').AsDateTime<StrToDate(CLOSE_DATE) )then
          begin
            Inc(iInCloseDate);
            _(' ���������� � �������� �������');
          end
          else
          begin
            (** �� ��������� ���� ��� ���� ���������� � ����� ����� � ������� ��������� *)
            _(' �������� �� ������� ����������');
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
              _(' ������ ��� ���� � ��, �������� �� ����������� ������������');
              if not cbReload.Checked then // ���� ������������ �� �����
              begin
                Inc(iRefused);
                _(' ������ � ���������');
              end
              else
              begin // ����������� ������
                ExecQuery( qryReload );
                ExecQuery( qryIns );
                Inc(iReLoaded);
                _(' ������ �������������');
              end;
            end
            else
            begin // ������� ����� ������
              ExecQuery( qryIns );
              Inc(iLoaded);
              _(' ������� ����� ������');
            end;
          end;
        end
        else
        begin
          _(' ������ ���������������');
          Inc(iNoLoaded);
        end;
        ProgressBar.StepIt;
        Next;
        _(' ���������� ��������-��� � ������� � ��������� ������');
      end;
      CommitSQLOra;
      _(' ��������� ����������');
    except on E:Exception do
      begin
        RollbackSQLOra;
        _(' �������� ��������� ��-�� ������ "'+E.Message+'"');
        if not SysParamExists(LOG_NAME) then
          FLog.SaveToFile(GetMainDir+LOG_FILE_NAME);
        MessageDlg('������ ��� �������� :' + #13#10
          + E.Message + #13#10
          + '��� ���������� ������ ���������� � �������������, ����������� ��������� �����:' + #13#10
          + '1. �������� ������� ���������;' + #13#10
          + '2. ���������� �������;' + #13#10
          + '3. ��� �������� '+GetMainDir+LOG_FILE_NAME + '.'
          ,mtError,[mbOk],0);
      end
    end;
  finally
    ProgressBar.Position := 0;
    ProgressBar.Visible := False;
    dbgFileContent.DataSource.DataSet.EnableControls;
    //FreeAndNil(ProgressBar);
    //_(' ���������� ��������-���');
    strMsg:=TranslateText('�������� ���������.')+#13#10
      +TranslateText('����� ����������: ')+IntToStr(tblFile.RecordCount)+#13#10
      +TranslateText('���������: ')+IntToStr(iLoaded)+#13#10
      +TranslateText('�������������: ')+IntToStr(iNoLoaded)+#13#10
      +TranslateText('�����������: ')+IntToStr(iReLoaded)+#13#10
      +TranslateText('���������: ')+IntToStr(iRefused);
    if( iInCloseDate<>0 )then
      strMsg:=strMsg+#13#10+TranslateText('� �������� ������� (�� ���������): ')+IntToStr(iInCloseDate);
    MessageDlg( strMsg,mtInformation,[mbOk],0 );
    _(' ������ ��������� �� �������� ��������, �� ��������� �������'+#13#10+strMsg);
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
  GetFilters(1); // ������������ � ������ ����� �������
end;

procedure TLoadBankCardForm.miFiltersNoAllClick(Sender: TObject);
begin
  GetFilters(2); // ������������ � ������ ����� �������
end;

procedure TLoadBankCardForm.SetFilters(); // ��������� ������ �� ���������
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

    // ������������� �������� � ���������� � ����"������ �� ���
    qDevice.Close;
    qDevice.Open;

    // ���������� �������� � ������
    dsFile.DataSet.DisableControls;
    dsFile.DataSet.First;
    while not dsFile.DataSet.Eof do
    begin
      sIdTerm := dsFile.DataSet.FieldByName('id_term').AsString;

      // ��������� ������� � ���������� � ����"������ �� ���
      qDevice.Filtered := false;
      qDevice.Filter   := 'device_num = '''+ sIdTerm +'''';
      qDevice.Filtered := true;

      if pos(','+ sIdTerm +',', sIdTerms) = 0 then
      begin
        if qDevice.FieldByName('azs_num').AsString = '' then // ���� ��� �� ��������
          tvFilters.Items.Add(nil, sIdTerm)
        else
        begin // ���� ��� ��������
          bTreeNodeP := false;
          for i := 0 to tvFilters.Items.Count - 1 do // ���� ��� ��� �������� � ������
            if tvFilters.Items.Item[i].Text = TranslateText('��� �')+ qDevice.FieldByName('azs_num').AsString then
            begin
              TreeNodeP := tvFilters.Items.Item[i];
              tvFilters.Items.AddChild(TreeNodeP, sIdTerm);
              bTreeNodeP := true;
              break;
            end;

          if not bTreeNodeP then // ���� ��� �� �� �������� � ������
          begin
            TreeNodeP := tvFilters.Items.Add(nil, TranslateText('��� �')+ qDevice.FieldByName('azs_num').AsString);
            tvFilters.Items.AddChild(TreeNodeP, sIdTerm);
          end;
        end;

        sIdTerms := sIdTerms + sIdTerm +','; // �����"�������, ����� ��������
      end; // if pos(','+ sIdTerm +',', sIdTerms) = 0 then
      dsFile.DataSet.Next;
    end;
  finally
    dsFile.DataSet.First;
    dsFile.DataSet.EnableControls;

    GetFilters(1); // ������������ � ������ ����� �������
  end;
end;

procedure TLoadBankCardForm.cbFiltersClick(Sender: TObject);
begin
  pFilters.Visible := cbFilters.Checked;

  SetFilters(); // ��������� ������ �� ���������
end;

end.
