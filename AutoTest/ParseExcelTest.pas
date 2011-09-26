unit ParseExcelTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uImportFunc, VirtualTable, Grids,
  DBGrids, DB, DBGridEh, ComCtrls, Buttons;

type
  TParseExcelTestForm = class(TForm)
    PageControl: TPageControl;
    tsParseExcel: TTabSheet;
    tsImportFunc: TTabSheet;
    DataSource: TDataSource;
    GroupBox1: TGroupBox;
    ePathName: TEdit;
    bLoadFromFile: TButton;
    bSaveToFile: TButton;
    eText: TEdit;
    eResult: TEdit;
    bFind: TButton;
    TabSheet1: TTabSheet;
    pnl120: TPanel;
    reLog: TRichEdit;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    mBuffer: TMemo;
    Panel2: TPanel;
    rgOrientation: TRadioGroup;
    leCount: TLabeledEdit;
    pnlBtn: TPanel;
    bLoadBuffer: TButton;
    bCopyFromExcel: TButton;
    bFindExcelSheet: TButton;
    Panel4: TPanel;
    DBGridEh: TDBGridEh;
    leResult: TLabeledEdit;
    leValues: TLabeledEdit;
    bFindPositionAlias: TButton;
    bFindPositionValues: TButton;
    Panel5: TPanel;
    rgDataSet: TRadioGroup;
    sb120DefineAzs: TSpeedButton;
    sb120DefineNp: TSpeedButton;
    sb120DefineNb: TSpeedButton;
    sb120DefineOper: TSpeedButton;
    lbl120DefineOper: TLabel;
    lbl120DefineNb: TLabel;
    lbl120DefineNp: TLabel;
    lbl120DefineAzs: TLabel;
    Splitter1: TSplitter;
    bLoadRange: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure bLoadBufferClick(Sender: TObject);
    procedure rgOrientationClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgDataSetClick(Sender: TObject);
    procedure bFindPositionValuesClick(Sender: TObject);
    procedure bFindClick(Sender: TObject);
    procedure bLoadFromFileClick(Sender: TObject);
    procedure bSaveToFileClick(Sender: TObject);
    procedure bCopyFromExcelClick(Sender: TObject);
    procedure bFindExcelSheetClick(Sender: TObject);
    procedure sb120DefineAzsClick(Sender: TObject);
    procedure sb120DefineNpClick(Sender: TObject);
    procedure sb120DefineNbClick(Sender: TObject);
    procedure sb120DefineOperClick(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
  private
    FParseExcel: TParseExcel;
    FStoreDefineUnit: TStoreDefineUnit;
    FList, FXLApp: Variant;
    FTableNb, FTableOper: TVirtualTable;
    function GetOrientation: TParseExcelOrientation;
    procedure Log(AText: string);
    
  public
    { Public declarations }
  end;

var
  ParseExcelTestForm: TParseExcelTestForm;

procedure DeleteByFilter(AVirtualTable: TVirtualTable; AFilter: string);

function DefineAZS(AQuiet: boolean; AParseExcel: TParseExcel): boolean;
function DefineNp(AQuiet: boolean; AParseExcel: TParseExcel): boolean;
function DefineNb(AQuiet: boolean; AParseExcel: TParseExcel; ATable: TVirtualTable): boolean;
function DefineOper(AQuiet: boolean; AParseExcel: TParseExcel; ATable: TVirtualTable): boolean;


implementation

uses ActiveX, ComObj, Clipbrd, ListDefine, MemData, ExFunc, ExcelFunc, ReportManager;
{$R *.dfm}

procedure TParseExcelTestForm.FormDestroy(Sender: TObject);
begin
  FParseExcel.Free;
  FStoreDefineUnit.Free;
  FTableNb.Free;
  FTableOper.Free;
end;

procedure TParseExcelTestForm.bLoadBufferClick(Sender: TObject);
var
  ds: TDataSet;
begin
  if pos('Range', TButton(Sender).Name)<>0 then
  begin
    case GetOrientation of
      peoVertical: FParseExcel.Range[GetOrientation] := 'A1:C5000';
      peoHorizontal: FParseExcel.Range[GetOrientation] := 'A3:CL3';
    end;
  end
  else
    FParseExcel.Buffer[GetOrientation] := mBuffer.Text;

  case GetOrientation of
    peoVertical:
    begin
      ds := FParseExcel.DistinctLists[peoVertical, 0];
      ds.First;
      While not ds.Eof do
      begin
        ds.Edit;
        ds.FieldByName('ALIAS').AsString := ds.FieldByName('VALUE').AsString;
        ds.Post;
        ds.Next;
      end;
      sb120DefineAzs.Down := DefineAZS(True, FParseExcel);
      sb120DefineNp.Down := DefineNp(True, FParseExcel);
    end;
    peoHorizontal:
    begin
      sb120DefineNb.Down := DefineNb(True, FParseExcel, FTableNb);
      sb120DefineOper.Down := DefineOper(True, FParseExcel, FTableOper);
    end;
  end;
end;

function TParseExcelTestForm.GetOrientation: TParseExcelOrientation;
begin
  case rgOrientation.ItemIndex of
    0: Result := peoHorizontal;
    1: Result := peoVertical;
    else
      raise Exception.Create('GetOrientation');
  end;
end;

procedure TParseExcelTestForm.rgOrientationClick(Sender: TObject);
begin
  leCount.Text := IntToStr(FParseExcel.Count[GetOrientation]);
end;

procedure TParseExcelTestForm.FormCreate(Sender: TObject);
begin
  FParseExcel := TParseExcel.Create;
  FStoreDefineUnit := TStoreDefineUnit.Create(TDefineAZS);
  FTableNb := TVirtualTable.Create(nil);
  FTableNb.AddField('name', ftString, 255);
  FTableNb.AddField('alias', ftString, 255);
  FTableOper := TVirtualTable.Create(nil);
  FTableOper.AddField('name', ftString, 255);
  FTableOper.AddField('alias', ftString, 255);
end;

procedure TParseExcelTestForm.rgDataSetClick(Sender: TObject);
begin
  case rgDataSet.ItemIndex of
    0:
      DataSource.DataSet := FParseExcel.Table[GetOrientation];
    1,2,3,4:
      DataSource.DataSet := FParseExcel.DistinctLists[GetOrientation, rgDataSet.ItemIndex-1];
    5:
      DataSource.DataSet := FTableNb;
    6:
      DataSource.DataSet := FTableOper;
  end;
end;

procedure TParseExcelTestForm.bFindPositionValuesClick(Sender: TObject);
var
  ls: TStringList;
  arr: array of variant;
  i: integer;
begin
  ls := TStringList.Create;
  try
    ls.CommaText := leValues.Text;
    SetLength(arr,ls.Count);
    for i := 0 to ls.Count - 1 do
      arr[i] := ls[i];
    leResult.Text := IntToStr(FParseExcel.FindPosition(GetOrientation, arr, pos('ALIAS',UpperCase(TButton(Sender).Name))<>0));
  finally
    ls.Free;
  end;
end;

procedure TParseExcelTestForm.bFindClick(Sender: TObject);
begin
  eResult.Text := IntToStr(FStoreDefineUnit.GetLink(eText.Text).AsInteger);
end;

procedure TParseExcelTestForm.bLoadFromFileClick(Sender: TObject);
begin
  FStoreDefineUnit.LoadFromFile(ePathName.Text);
end;

procedure TParseExcelTestForm.bSaveToFileClick(Sender: TObject);
begin
  FStoreDefineUnit.SaveToFile(ePathName.Text);
end;

procedure TParseExcelTestForm.bCopyFromExcelClick(Sender: TObject);
begin
  case GetOrientation of
    peoHorizontal:
    begin
      FList.Range['A3:CK3'].Copy;
      GetTextFromClipboard(mBuffer.Lines);
      Clipboard.Clear;
    end;
    peoVertical:
    begin
      FList.Columns['A:C'].Copy;
      GetTextFromClipboard(mBuffer.Lines);
      Clipboard.Clear;
      // Убрать лишние значения
      while not (mBuffer.Lines[0][1] in ['0'..'9']) do
        mBuffer.Lines.Delete(0);
      while not (mBuffer.Lines[mBuffer.Lines.Count - 1][1] in ['0'..'9']) do
        mBuffer.Lines.Delete(mBuffer.Lines.Count - 1);
    end;
  end; //case
end;

procedure TParseExcelTestForm.bFindExcelSheetClick(Sender: TObject);
var
  BookName: string;
begin
  if FindExcelSheet('АЗС нпр', FXLApp, FList, BookName) then
  begin
    FParseExcel.List := FList;
    log(BookName);
  end;
end;

procedure TParseExcelTestForm.Log(AText: string);
begin
  reLog.Lines.Add(AText);
end;

procedure TParseExcelTestForm.sb120DefineAzsClick(Sender: TObject);
begin
  sb120DefineAzs.Down := DefineAZS(False, FParseExcel);
end;

procedure TParseExcelTestForm.sb120DefineNpClick(Sender: TObject);
begin
  sb120DefineNp.Down := DefineNp(False, FParseExcel);
end;

procedure TParseExcelTestForm.sb120DefineNbClick(Sender: TObject);
begin
  sb120DefineNb.Down := DefineNb(False, FParseExcel, FTableNb);
end;

procedure TParseExcelTestForm.sb120DefineOperClick(Sender: TObject);
begin
  sb120DefineOper.Down := DefineOper(False, FParseExcel, FTableOper);
end;

procedure DeleteByFilter(AVirtualTable: TVirtualTable;
  AFilter: string);
begin
  while AVirtualTable.LocateEx('value',VarArrayOf([AFilter]),[lxPartialCompare]) do
    AVirtualTable.Delete;
end;

function DefineAZS(AQuiet: boolean; AParseExcel: TParseExcel): boolean;
begin
  Result := TListDefineForm.Define(AQuiet, odtAZS, AParseExcel.DistinctLists[peoVertical, 1], 'ListDefineBefAZS.cfg')
end;

function DefineNp(AQuiet: boolean; AParseExcel: TParseExcel): boolean;
begin
  Result := TListDefineForm.Define(AQuiet, odtNpGroup, AParseExcel.DistinctLists[peoVertical, 2], 'ListDefineBefNpg.cfg')
end;                

function DefineNb(AQuiet: boolean; AParseExcel: TParseExcel; ATable: TVirtualTable): boolean;
const
  DeleteParam: array[1..2] of string = ('ОБЛАСТЬ', 'на нач');
var
  cnt: integer;
  Table: TVirtualTable;
begin
  Table := TVirtualTable.Create(nil);
  try
    // Нужно оставить только НБ
    Table.Assign(AParseExcel.DistinctLists[peoHorizontal, 0]);
    Table.Open;
    Table.First;
    while not Table.Eof do
      if pos('(л)',Table.FieldByName('value').AsString) = 0 then
        Table.Delete
      else
        Table.Next;
    // Отрезаем реализацию
    if Table.LocateEx('value',VarArrayOf(['нал']),[lxCaseInsensitive, lxPartialCompare]) then
    begin
      cnt := Table.RecNo - 2;
      Table.Last;
      while cnt <> Table.RecordCount do
        Table.Delete;
    end;
    // Вырезаем также колонки где есть строка вида "(кг)"
    // Отрезаем там где есть
    for cnt := low(DeleteParam) to high(DeleteParam) do
      DeleteByFilter(Table, DeleteParam[cnt]);
    Result := TListDefineForm.Define(AQuiet, odtOrg, Table, 'ListDefineBefNb.cfg');
    // Возвращаем данные на место
    Table.First;
    while not Table.Eof do
    begin
      if AParseExcel.DistinctLists[peoHorizontal, 0].LocateEx('VALUE', VarArrayOf([Table.FieldByName('VALUE').AsString]),[]) then
      begin
        AParseExcel.DistinctLists[peoHorizontal, 0].Edit;
        AParseExcel.DistinctLists[peoHorizontal, 0].FieldByName('ALIAS').AsString := Table.FieldByName('ALIAS').AsString;
        AParseExcel.DistinctLists[peoHorizontal, 0].Post;
      end;
      Table.Next;
    end;
    if ATable <> nil then
      ATable.Assign(Table);
  finally
    Table.Free;
  end;
end;

function DefineOper(AQuiet: boolean; AParseExcel: TParseExcel; ATable: TVirtualTable): boolean;
const
  DeleteParam: array[1..2] of string = ('на кон.', 'Всего');
var
  cnt: integer;
  Table: TVirtualTable;
begin
  Table := TVirtualTable.Create(nil);
  try
    // Нужно оставить только операции
    Table.Assign(AParseExcel.DistinctLists[peoHorizontal, 0]);
    Table.Open;

    while not Table.Eof do
      if pos('(л)',Table.FieldByName('value').AsString) = 0 then
        Table.Delete
      else
        Table.Next;
    // Отрезаем НЕ реализацию
    Table.First;
    while pos('нал',Table.FieldByName('value').AsString) = 0 do
      Table.Delete;
    Table.First;


    // Отрезаем там где есть что-то не нужное
    for cnt := low(DeleteParam) to high(DeleteParam) do
      DeleteByFilter(Table, DeleteParam[cnt]);
    // Вызываем форму выбора
    Result := TListDefineForm.Define(AQuiet, odtOper, Table, 'ListDefineBefOper.cfg');
    // Возвращаем данные на место
    Table.First;
    while not Table.Eof do
    begin
      if AParseExcel.DistinctLists[peoHorizontal, 0].LocateEx('VALUE', VarArrayOf([Table.FieldByName('VALUE').AsString]),[]) then
      begin
        AParseExcel.DistinctLists[peoHorizontal, 0].Edit;
        AParseExcel.DistinctLists[peoHorizontal, 0].FieldByName('ALIAS').AsString := Table.FieldByName('ALIAS').AsString;
        AParseExcel.DistinctLists[peoHorizontal, 0].Post;
      end;
      Table.Next;
    end;
    if ATable <> nil then
      ATable.Assign(Table);
  finally
    Table.Free;
  end;
end;

procedure TParseExcelTestForm.Panel5Click(Sender: TObject);
begin
  LoadReport('Оперативный отчет для Авиаса (универсальный)', //-- Название отчета; метка *NO_TRANSLATE*
             '', //-- Название шаблона
             300,              //-- Длинна отчета в пикселах (форма)
             120,              //-- Номер отчета пользователя
             2,                //-- Вид поля с датами 1-С одной датой. 2-С двумя датами
             false,            //-- Отображать строку с номером отчета Да/Нет
             true,             //-- Отображать строку с датой(диапазоном) отчета Да/Нет
             true //-- Отображать строку с организацией Да/Нет
             );
end;

end.
