unit uImportFunc;

interface

uses
  SysUtils, Classes, Variants, DB, ActiveX, ComObj, Excel8TLB, ComCtrls, ADODB,
  AppEvnts, VirtualTable, StrUtils, Dialogs, ChooseOrg;

type

  TPrimaryKey = record
    Id, Inst: integer;
  end;

{ TdmImportFunc }

  TdmImportFunc = class(TDataModule)
  private
    { Private declarations }
  public
    procedure MoveExcelToDataSet(APathToExcel: string; AStartDataRow: integer; ADataSet: TDataSet;
      AFieldsExcel, AFieldsDataSet: array of Variant; AProgress: TProgressBar);
    procedure MoveExcelToDataSetADO(APathToExcel: string; AStartDataRow: integer; ADataSet: TDataSet;
      AFieldsExcel, AFieldsDataSet: array of Variant; AProgress: TProgressBar);
  end;

  TExeLink = class
  public
    class function GetOilLinkId(ATableName: string; AOutProgram: integer; AOutCode: string): integer;
    class function GetOilLinkInst(ATableName: string; AOutProgram: integer; AOutCode: string): integer;
    class function GetOilLinkKey(ATableName: string; AOutProgram: integer; AOutCode: string): TPrimaryKey;
    class function GetOutLinkVal(ATableName: string; AOutProgram, AOilId, AOilInst: integer): string;
  end;

  TOilDataType = (odtNpGroup, odtNpType, odtAZS, odtOrg, odtOper);

{ TParseExcel }

{
Дано условие:
Необходимо динамически распознать согластно некторорых услови номер строки в Excel, и номер столбца
}
  TParseExcelOrientation = (peoNone, peoHorizontal, peoVertical);
  TParseExcelSource = (pesNone, pesExcel, pesBuffer);
  TParseExcelListRecord = ^PParseExcelListRecord;
  PParseExcelListRecord = record
    List: TVirtualTable;
    Orientation: TParseExcelOrientation;
    Index: integer;
  end;

  TParseExcel = class
  private
    FBufferHorizontal, FBufferVertical: string;
    FDistinctLists: TList;
    FList: variant;
    FOrientation: TParseExcelOrientation;
    FSourceType: TParseExcelSource;
    FDataSetHorizontal, FDataSetVertical: TVirtualTable;
    FCountHorizontal, FCountVertical: integer;
    FOffsetHorizontal, FOffsetVertical: integer;
    FRangeHorizontal, FRangeVertical: string;
    function GetOrientation: TParseExcelOrientation;
    procedure SetList(const Value: variant);
    function GetSourceType: TParseExcelSource;
    function GetDistinctLists(AOrientation: TParseExcelOrientation;
      AIndex: integer): TVirtualTable;
    procedure SetBuffer(AOrientation: TParseExcelOrientation;
      const Value: string);
    function GetBuffer(AOrientation: TParseExcelOrientation): string;
    function GetCount(AOrientation: TParseExcelOrientation): integer;
    procedure ProcessBuffer(ABuffer: string; ATable: TVirtualTable; AOrientation: TParseExcelOrientation);
    procedure SetDestBuffer(var ADestBuffer:string; const AValue: string);
    function FindTablePosition(ATable: TVirtualTable;
      AOrientation: TParseExcelOrientation; ALocateValues: array of variant;
      AUseAlias: boolean): integer;
    function GetTable(AOrientation: TParseExcelOrientation): TVirtualTable;
    function GetOffset(AOrientation: TParseExcelOrientation): integer;
    procedure SetOffset(AOrientation: TParseExcelOrientation;
      const Value: integer);
    function GetRange(AOrientation: TParseExcelOrientation): string;
    procedure SetRange(AOrientation: TParseExcelOrientation;
      const AValue: string);
  public
    constructor Create;
    destructor Destroy; override;
    // Плюс такого метода передачи данных - быстродействие
    // Минус - при копировании их Excel в Excel не должно быть скрытых строк и столбцов
    property Buffer[AOrientation: TParseExcelOrientation]: string read GetBuffer write SetBuffer;
    property Count[AOrientation: TParseExcelOrientation]: integer read GetCount;
    property DistinctLists[AOrientation: TParseExcelOrientation; AIndex: integer]: TVirtualTable{'VALUE', 'ALIAS'} read GetDistinctLists;
    function FindPosition(AOrientation: TParseExcelOrientation; ALocateValues: array of variant; AUseAlias: boolean = true): integer;
    property List: variant read FList write SetList;
    property Offset[AOrientation: TParseExcelOrientation]: integer read GetOffset write SetOffset;
    property Orientation: TParseExcelOrientation read GetOrientation write FOrientation;
    property Range[AOrientation: TParseExcelOrientation]: string read GetRange write SetRange;
    property SourceType: TParseExcelSource read GetSourceType;
    property Table[AOrientation: TParseExcelOrientation]: TVirtualTable read GetTable;
  end;  

{TDefineUnits}

  TDefineResult = class
    FId, FInst: integer;
  private
    function GetAsInteger: integer;
    function GetAsPrimaryKey: TPrimaryKey;
    procedure SetAsPrimaryKey(const Value: TPrimaryKey);
  public
    constructor Create(AId: integer; AInst: integer = 0); overload;
    constructor Create(APk: TPrimaryKey); overload;
    property AsPrimaryKey: TPrimaryKey read GetAsPrimaryKey write SetAsPrimaryKey;
    property AsInteger: integer read GetAsInteger write FId;
  end;

  TDefineUnit = class
  private
    FDefined: boolean;
    FInst: integer;
    FResult: TDefineResult;
    FText: string;
    FUserMode: boolean;
    function GetResult: TDefineResult;
  private
    function Define: boolean;
  protected
    function DoDefine: boolean; virtual; abstract;
  public
    constructor Create(AText: string; AInst: integer = 0; AUserMode: boolean = True);
    property Defined: boolean read FDefined;
    property Result: TDefineResult read GetResult;
    property UserMode: boolean read FUserMode default True;    
  end;

  TDefineResultSave = ^PDefineResultSave;
  PDefineResultSave = packed record
    Text: string[255];
    Id, Inst: integer;
  end;

  ENoDataFound = class(Exception);

  TDefineUnitClass = class of TDefineUnit;

  TStoreDefineUnit = class
  private
    FDefineUnitClass: TDefineUnitClass;
    FResultList: TList;
    FUserMode: boolean;
    FDataType: TOilDataType;
  public
    constructor Create(ADefineUnitClass: TDefineUnitClass); overload;
    constructor Create(ADataType: TOilDataType); overload;
    destructor Destroy; override;
    function GetLink(AText: string; AExeLinkProgram: integer = 0; AInst: integer = 0): TDefineResult;
    procedure LoadFromFile(AFilePath: string);
    procedure SaveToFile(AFilePath: string);
    procedure SetLink(AText: string; AInst: integer; ADefineResult: TDefineResult);
    property UserMode: boolean read FUserMode write FUserMode default True;
  end;

  TDefineAZS = class(TDefineUnit)
  protected
    function DoDefine: boolean; override;
  end;

  // Не реализованы
  TDefineNpGroup = class(TDefineUnit)
    function DoDefine: boolean; override;
  end;

  TDefineNpType = class(TDefineUnit)
    function DoDefine: boolean; override;
  end;

  TDefineOrg = class(TDefineUnit)
    function DoDefine: boolean; override;
  end;

  TDefineOper = class(TDefineUnit)
    function DoDefine: boolean; override;
  end;


const
  DefineClassArray: array[low(TOilDataType)..high(TOilDataType)] of TDefineUnitClass =
    (TDefineNpGroup, TDefineNpType, TDefineAZS, TDefineOrg, TDefineOper);
  DefineTableArray: array[low(TOilDataType)..high(TOilDataType)] of string =
    ('OIL_NP_GROUP', 'OIL_NP_TYPE', 'OIL_ORG', 'OIL_ORG', 'OIL_OPER_TYPE');
  DefineKeyCountArray: array[low(TOilDataType)..high(TOilDataType)] of word =
    (1, 1, 2, 2, 1);
  DefineParseExcelOrientation: array[low(TParseExcelOrientation)..high(TParseExcelOrientation)] of string =
    ('нет', 'горизонталь', 'вертикаль');

var
  ImportFunc: TdmImportFunc;

implementation

uses ExFunc, UDbFunc;

{$R *.dfm}

{ TdmImportFunc }

type
  TFieldLink = record
    DataSetName: string;
    ExcelName: string;
    ColumnNumbExcel: integer;
  end;
  
procedure TdmImportFunc.MoveExcelToDataSet(APathToExcel: string; AStartDataRow: integer; ADataSet: TDataSet;
  AFieldsExcel, AFieldsDataSet: array of Variant; AProgress: TProgressBar);
var
  Unknown: iUnknown;
  MsExcel, List: Variant;
  Eof: boolean;
  Row, MinRow, MaxRow, Column, i: integer;
  FieldLinksArray: array of TFieldLink;
  IsFound: boolean;
  //R: Variant;
begin
  // Основная проблема данного метода - это скорость.
  try
    if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
      MsExcel := GetActiveOleObject('Excel.Application')
    else
      MsExcel := CreateOleObject('Excel.Application');
    try

      MsExcel.Workbooks.Add(APathToExcel);
      List := MsExcel.ActiveWorkBook.ActiveSheet;

      // запретить перерисовку экрана
      MsExcel.ScreenUpdating := False;

{      // отменить автоматическую калькуляцию формул
      //MsExcel.Calculation[0] := xlManual;

      // отменить проверку автоматическую ошибок в ячейках (для XP и выше)
      MsExcel.ErrorCheckingOptions.BackgroundChecking := False;
      MsExcel.ErrorCheckingOptions.NumberAsText := False;
      MsExcel.ErrorCheckingOptions.InconsistentFormula := False;}

      SetLength(FieldLinksArray, high(AFieldsExcel)+1);
      // Определение расположения колонок
      for i := low(AFieldsExcel) to high(AFieldsExcel) do
      begin
        IsFound := False;
        for Column := 1 to 255 do
        begin
          if List.Cells[AStartDataRow - 1, ExcelNumberToColumn(Column)].Value = AFieldsExcel[i] then
          begin
            FieldLinksArray[i].ColumnNumbExcel := Column;
            FieldLinksArray[i].DataSetName := AFieldsDataSet[i];
            FieldLinksArray[i].ExcelName := AFieldsExcel[i];
            IsFound := True;
            break;
          end;
        end;
        if not IsFound then
          raise Exception.CreateFmt('Не удалось найти колонку "%s"',[AFieldsExcel[i]]);
      end;

//      AProgress.AddProgress();
      // Определение конца данных
      Row := AStartDataRow;
      MinRow := AStartDataRow;
      MaxRow := AStartDataRow + 1000;
      while VarAsType(List.Cells[MaxRow,1].Value, varString) <> '' do
      begin
        MinRow := MaxRow;
        MaxRow := MaxRow + 1000;
      end;
      IsFound := False;
      while not IsFound do
      begin
        Row := MinRow + (MaxRow - MinRow) div 2;
        if VarAsType(List.Cells[Row,1].Value, varString) = '' then
          MaxRow := Row
        else
          MinRow := Row;                        
        IsFound := (MaxRow - MinRow) = 1;
      end;
      if AProgress <> nil then
      begin
        AProgress.Max := MaxRow;
        AProgress.Step := 1;
      end;
      // Определение начала данных
      Eof := False;
      Row := AStartDataRow;
      ADataSet.Open;
      while not Eof do
      begin
        if VarAsType(List.Cells[Row,1].Value, varString) = '' then
        begin
          Eof := true;
          continue;
        end;
        if AProgress <> nil then
          AProgress.StepIt;
        ADataSet.Append;
        for i := low(FieldLinksArray) to high(FieldLinksArray) do
          ADataSet.FieldByName(FieldLinksArray[i].DataSetName).Value := List.Cells[Row,FieldLinksArray[i].ColumnNumbExcel];
        ADataSet.Post;
        inc(Row);
      end;

    finally
      MsExcel := UnAssigned;
    end;
  except on e:Exception do
    Raise Exception.Create('ImportFunc.MoveExcelToDataSet: '+e.Message);
  end;
end;

procedure TdmImportFunc.MoveExcelToDataSetADO(APathToExcel: string; AStartDataRow: integer; ADataSet: TDataSet;
  AFieldsExcel, AFieldsDataSet: array of Variant; AProgress: TProgressBar);
const
  ConStr =
    'Provider=Microsoft.Jet.OLEDB.4.0;' +
    'Data Source=%s;' +
    'Extended Properties="Excel 8.0;HDR=Yes;";';
{var
  i: integer;}
begin

 {

 
http://support.microsoft.com/kb/194124/EN-US/
http://www.sql.ru/forum/actualthread.aspx?bid=1&tid=153285&pg=3

  try
    XLConn.ConnectionString := Format(ConStr, [ExpandFileName(APathToExcel)]);
    XLConn.Open;

    XLDataSet.Connection := XLConn;
    XLDataSet.CommandText :=
      'select * from [Sheet1$]';
    XLDataSet.Open;
    XLDataSet.First;
    if AProgress <> nil then
    begin
      AProgress.Max := XLDataSet.RecordCount;
      AProgress.Step := 1;
    end;

    ADataSet.Open;
    while not XLDataSet.Eof do
    begin
      ADataSet.Append;
      for i := low(AFieldsExcel) to high(AFieldsExcel) do
        ADataSet.FieldByName(AFieldsDataSet[i]).AsString := XLDataSet.FieldByName(AFieldsExcel[i]).AsString;
      ADataSet.Post;
      if AProgress <> nil then
        AProgress.StepIt;
      XLDataSet.Next;
    end;
    XLDataSet.Close;
    XLConn.Close;
  except on e:Exception do
    Raise Exception.Create('ImportFunc.MoveExcelToDataSet: '+e.Message);
  end; }
end;

{ TParseExcel }

constructor TParseExcel.Create;
begin
  FOrientation := peoNone;
  FSourceType := pesNone;
  FDistinctLists := TList.Create;
  FDataSetHorizontal := TVirtualTable.Create(nil);
  FDataSetVertical := TVirtualTable.Create(nil);
end;

destructor TParseExcel.Destroy;
begin
  FDistinctLists.Free;
  FDataSetHorizontal.Free;
  FDataSetVertical.Free;
end;

function TParseExcel.FindTablePosition(ATable: TVirtualTable;
  AOrientation: TParseExcelOrientation; ALocateValues: array of variant;
  AUseAlias: boolean): integer;
var
  i: integer;
  msg: string;
  function GetValueFromAlias(AValue: string):string;
  begin
    if AUseAlias then
    begin
      DistinctLists[AOrientation, i].Filtered := False;
      DistinctLists[AOrientation, i].Filter := Format('ALIAS=''%s''', [AValue]);
      DistinctLists[AOrientation, i].Filtered := True;
      try
        If DistinctLists[AOrientation, i].IsEmpty then
          raise ENoDataFound.CreateFmt('Алиас "%s" не найден', [AValue])
        else
          Result := DistinctLists[AOrientation, i].FieldByName('VALUE').AsString
      finally
        DistinctLists[AOrientation, i].Filtered := False;
      end;
    end
    else
      Result := AValue;
  end;
begin
  try
    Result := -1;
    ATable.Filtered := False;
    ATable.Filter := '1=1';
    for i := 0 to high(ALocateValues) do
      ATable.Filter := ATable.Filter + Format(' AND %s=''%s''', ['F'+IntToStr(i), GetValueFromAlias(ALocateValues[i])]);
    ATable.Filtered := True;
    try
      if ATable.IsEmpty then
        raise ENoDataFound.CreateFmt('Позиция не найдена! Согластно фильтру "%s"', [ATable.Filter])
      else
        Result := ATable.FieldByName('POSITION').AsInteger;
    finally
      ATable.Filtered := False;
    end;
  except on E:ENoDataFound do
    begin
      msg := '';
      for i := 0 to high(ALocateValues) do
        msg := msg + ALocateValues[i] + ',';
      raise ENoDataFound.CreateFmt('Произошла ошибка. На наборе (%s), ориентация выбора "%s".'+#13#10+e.Message,
        [msg, DefineParseExcelOrientation[AOrientation]]);
    end;
  end;
end;

function TParseExcel.FindPosition(AOrientation: TParseExcelOrientation;
  ALocateValues: array of variant; AUseAlias: boolean): integer;
begin
  case AOrientation of
    peoHorizontal:
      Result := FindTablePosition(FDataSetHorizontal, AOrientation, ALocateValues, AUseAlias);
    peoVertical:
      Result := FindTablePosition(FDataSetVertical, AOrientation, ALocateValues, AUseAlias);
    else
      raise Exception.Create('FindPosition: AOrientation = peoNone');
  end;
  Result := Result + Offset[AOrientation] + 1;
end;

function TParseExcel.GetDistinctLists(AOrientation: TParseExcelOrientation;
  AIndex: integer): TVirtualTable;
var
  i: integer;
  ListRecord: TParseExcelListRecord;
begin
  Result := nil;
  for i := 0 to FDistinctLists.Count - 1 do
  begin
    ListRecord := FDistinctLists.Items[i];
    if (ListRecord.Orientation = AOrientation) and (ListRecord.Index = AIndex) then
    begin
      Result := ListRecord.List;
      break;
    end;
  end;
end;

function TParseExcel.GetOrientation: TParseExcelOrientation;
begin
  if FOrientation = peoNone then
    raise Exception.Create('Не установленна направленность!');
  Result := FOrientation;
end;

function TParseExcel.GetSourceType: TParseExcelSource;
begin
  if FSourceType = pesNone then
    raise Exception.Create('Не установлен испочник данных!');
  Result := FSourceType;
end;

procedure TParseExcel.ProcessBuffer(ABuffer: string; ATable: TVirtualTable;
  AOrientation: TParseExcelOrientation);
var
  Columns, Row: TStringList;
  i, j: integer;
  procedure InitTables;
  var
    j, i: integer;
    ListRecord: TParseExcelListRecord;
  begin
    // Инициализируем список полей
    ATable.DeleteFields;
    ATable.AddField('POSITION', ftInteger);
    // Удаляем все нашей ориентации

    i := 0;
    while i < FDistinctLists.Count do
    begin
      ListRecord := FDistinctLists.Items[i];
      if (ListRecord.Orientation = AOrientation) then
        FDistinctLists.Delete(i)
      else
        inc(i);
    end;

    for j := 0 to Count[AOrientation] - 1 do
    begin
      new(ListRecord);
      ListRecord.List := TVirtualTable.Create(nil);
      ListRecord.List.AddField('VALUE',ftString, 256);
      ListRecord.List.AddField('ALIAS',ftString, 256);
      ListRecord.List.Open;
      ListRecord.Orientation := AOrientation;
      ListRecord.Index := j;
      FDistinctLists.Add(ListRecord);
      ATable.AddField('F'+IntToStr(j), ftString, 100);
    end;
  end;
begin
  Columns := TStringList.Create;
  Row := TStringList.Create;
  try
    Columns.Text := ABuffer;
    case AOrientation of
      peoVertical:
      begin
        if Row.Count > 100 then
          raise Exception.Create('Превышено максимально допустимое значение таблицы!');
        // Определяем количество колонок
        Row.Text := AnsiReplaceStr(Columns[0],#9,#10);
        FCountVertical := Row.Count;

        InitTables;

        ATable.Open;
        for i := 0 to Columns.Count - 1 do
        begin
          Row.Text := AnsiReplaceStr(Columns[i],#9,#10);
          ATable.Append;
          ATable.FieldByName('POSITION').AsInteger := i;
          for j := 0 to Row.Count - 1 do
          begin
            // Формируем списки уникальных значений
            DistinctLists[AOrientation, j].Filtered := False;
            if Row[j] = '' then
              DistinctLists[AOrientation, j].Filter := 'VALUE = NULL'
            else
              DistinctLists[AOrientation, j].Filter := Format('VALUE = %s', [QuotedStr(Row[j])]);
            DistinctLists[AOrientation, j].Filtered := True;
            if DistinctLists[AOrientation, j].IsEmpty then
            begin
              DistinctLists[AOrientation, j].Append;
              DistinctLists[AOrientation, j].FieldByName('VALUE').AsString := Row[j];
              DistinctLists[AOrientation, j].Post;
            end;
            DistinctLists[AOrientation, j].Filtered := False;
            // Формируем структуру с позициями значений
            ATable.FieldByName('F'+IntToStr(j)).AsString := Row[j];
          end;
          ATable.Post;
        end;
      end;
      peoHorizontal:
      begin
        Row.Text := AnsiReplaceStr(Columns[0],#9,#10);
        if Columns.Count > 100 then
          raise Exception.Create('Превышено максимально допустимое значение таблицы!');
        // Определяем количество колонок
        FCountHorizontal := Columns.Count;
        InitTables;

        ATable.Open;
        Row.Text := AnsiReplaceStr(Columns[0],#9,#10);
        for i := 0 to Row.Count - 1 do
        begin
          ATable.Append;
          ATable.FieldByName('POSITION').AsInteger := i;
          for j := 0 to Columns.Count - 1 do
          begin
            Row.Text := AnsiReplaceStr(Columns[j],#9,#10);

            // Формируем списки уникальных значений

            DistinctLists[AOrientation, j].Filtered := False;
            if Row[j] = '' then
              DistinctLists[AOrientation, j].Filter := 'VALUE = NULL'
            else
              DistinctLists[AOrientation, j].Filter := Format('VALUE = %s', [QuotedStr(Row[i])]);
            DistinctLists[AOrientation, j].Filtered := True;
            if DistinctLists[AOrientation, j].IsEmpty then
            begin
              DistinctLists[AOrientation, j].Append;
              DistinctLists[AOrientation, j].FieldByName('VALUE').AsString := Row[i];
              DistinctLists[AOrientation, j].Post;
            end;
            DistinctLists[AOrientation, j].Filtered := False;
            
            ATable.FieldByName('F'+IntToStr(j)).AsString := Row[i];
          end;
          ATable.Post;
        end;
      end;
    end;//case
  finally
    Columns.Free;
    Row.Free;
  end;
end;

procedure TParseExcel.SetDestBuffer(var ADestBuffer:string; const AValue: string);
begin
  FSourceType := pesBuffer;
  ADestBuffer := AValue;    
end;

procedure TParseExcel.SetList(const Value: variant);
begin
  if FSourceType = pesNone then
  begin
    FSourceType := pesExcel;
    FList := Value;
  end
  else if SourceType = pesBuffer then
    raise Exception.Create('Нельзя повторно установить источник данных');
end;

procedure TParseExcel.SetBuffer(AOrientation: TParseExcelOrientation;
  const Value: string);
begin
  case AOrientation of
    peoHorizontal:
    begin
      SetDestBuffer(FBufferHorizontal, Value);
      ProcessBuffer(FBufferHorizontal, FDataSetHorizontal, AOrientation);
    end;
    peoVertical:
    begin
      SetDestBuffer(FBufferVertical, Value);
      ProcessBuffer(FBufferVertical, FDataSetVertical, AOrientation);
    end;
  end;
end;

function TParseExcel.GetBuffer(
  AOrientation: TParseExcelOrientation): string;
begin
  case AOrientation of
    peoHorizontal:
      Result := FBufferHorizontal;
    peoVertical:
      Result := FBufferVertical;
  end;
end;

function TParseExcel.GetCount(
  AOrientation: TParseExcelOrientation): integer;
begin
  case AOrientation of
    peoHorizontal:
      Result := FCountHorizontal;
    peoVertical:
      Result := FCountVertical;
    else
      Result := 0;
  end;
end;

function TParseExcel.GetTable(
  AOrientation: TParseExcelOrientation): TVirtualTable;
begin
  case AOrientation of
    peoHorizontal:
      Result := FDataSetHorizontal;
    peoVertical:
      Result := FDataSetVertical;
    else
      Result := nil;
  end;      
end;


function TParseExcel.GetOffset(
  AOrientation: TParseExcelOrientation): integer;
begin
  case AOrientation of
    peoHorizontal:
      Result := FOffsetHorizontal;
    peoVertical:
      Result := FOffsetVertical;
    else
      Result := 0;
  end;
end;

procedure TParseExcel.SetOffset(AOrientation: TParseExcelOrientation;
  const Value: integer);
begin
  case AOrientation of
    peoHorizontal:
      FOffsetHorizontal := Value;
    peoVertical:
      FOffsetVertical := Value;
  end;       
end;

function TParseExcel.GetRange(
  AOrientation: TParseExcelOrientation): string;
begin
  case AOrientation of
    peoHorizontal: Result := FRangeHorizontal;
    peoVertical:   Result := FRangeVertical;
  end;
end;

procedure TParseExcel.SetRange(AOrientation: TParseExcelOrientation;
  const AValue: string);
// Передаеться строка вида "A1:B2"
var
  minrow, mincol,
  maxrow, maxcol,
  row,    col: integer;
  buff, str: string;
  
  function GetVal(AStr: string; AIsNumbers: boolean): string;
  var
    i: integer;
  begin
    Result := '';
    for i := 1 to length(AStr) do
      if AStr[i] in ['0'..'9'] then
      begin
        if AIsNumbers then
          Result := Result+AStr[i];
      end
      else if not AIsNumbers then
        Result := Result+AStr[i];
  end;
begin
  // Разбираем строку
  minrow := StrToInt(GetVal(copy(AValue,1,pos(':',AValue)-1),true));
  mincol := ExcelColumnToNumber(GetVal(copy(AValue,1,pos(':',AValue)-1),false));
  maxrow := StrToInt(GetVal(copy(AValue,pos(':',AValue)+1,length(AValue)),true));
  maxcol := ExcelColumnToNumber(GetVal(copy(AValue,pos(':',AValue)+1,length(AValue)),false));
  buff := '';
  // Формируем буфер
  for row := minrow to maxrow do
  begin
    str := '';
    for col := mincol to maxcol do
    try
      str := str + FList.Cells[row, col].Text + #9;
    except on E:Exception do
      raise Exception.CreateFmt('SetRange: Ошибка при считывании %s(%d)%d'+#13#10+e.Message,[ExcelNumberToColumn(col), col, row]);
    end;
    //Delete(str, length(str), 1);
    buff := buff + str + #13#10;
  end;
  Buffer[AOrientation] := buff;
  case AOrientation of
    peoHorizontal: FRangeHorizontal := AValue;
    peoVertical:   FRangeVertical := AValue;
  end;
end;

{ TExeLink }

class function TExeLink.GetOilLinkId(ATableName: string; AOutProgram: integer;
  AOutCode: string): integer;
begin
  Result := nvl(GetSqlValueParSimple('select ov.GetOilLinkId(:ATableName, :AOutProgram, :AOutCode) from dual',
   ['ATableName', ATableName,
    'AOutProgram',AOutProgram,
    'AOutCode',AOutCode]),-1);
  if Result = -1 then
    raise ENoDataFound.Create('GetOilLinkId: Соответствие не найдено!');
end;

class function TExeLink.GetOilLinkInst(ATableName: string; AOutProgram: integer;
  AOutCode: string): integer;
begin
  Result := nvl(GetSqlValueParSimple('select ov.GetOilLinkInst(:ATableName, :AOutProgram, :AOutCode) from dual',
   ['ATableName', ATableName,
    'AOutProgram',AOutProgram,
    'AOutCode',AOutCode]),-1);
  if Result = -1 then
    raise ENoDataFound.Create('GetOilLinkId: Соответствие не найдено!');
end;

class function TExeLink.GetOilLinkKey(ATableName: string; AOutProgram: integer;
  AOutCode: string): TPrimaryKey;
begin
  Result.Id := GetOilLinkId(ATableName, AOutProgram, AOutCode);
  try
    Result.Inst := GetOilLinkInst(ATableName, AOutProgram, AOutCode);
  except on e:ENoDataFound do
    Result.Inst := 0;
  end;
end;

class function TExeLink.GetOutLinkVal(ATableName: string; AOutProgram, AOilId,
  AOilInst: integer): string;
begin
  Result := nvl(GetSqlValueParSimple('select ov.GetOutLinkVal(:ATableName, :AOutProgram, :AOilId, :AOilInst) from dual',
   ['ATableName', ATableName,
    'AOutProgram',AOutProgram,
    'AOilId',AOilId,
    'AOilInst',AOilInst]),-1);
end;


{ TDefineResult }

constructor TDefineResult.Create(AId, AInst: integer);
begin
  FId := AId;
  FInst := AInst;
end;

constructor TDefineResult.Create(APk: TPrimaryKey);
begin
  Create(APk.Id, APk.Inst);
end;

function TDefineResult.GetAsInteger: integer;
begin
  Result := FId;
end;

function TDefineResult.GetAsPrimaryKey: TPrimaryKey;
begin
  Result.id := FId;
  Result.inst := FInst;
end;

procedure TDefineResult.SetAsPrimaryKey(const Value: TPrimaryKey);
begin
  FId := Value.id;
  FInst := Value.inst;
end;

{ TDefineUnit }

constructor TDefineUnit.Create(AText: string; AInst: integer = 0; AUserMode: boolean = True);
begin
  if AInst = 0 then
    FInst := StrToInt(ReadOilVar('INST'))
  else
    FInst := AInst;
  FText := AText;
  FDefined := False;
  FUserMode := AUserMode;
  Define;
end;

function TDefineUnit.Define: boolean;
begin
  Result := DoDefine;
  FDefined := Result;
end;

function TDefineUnit.GetResult: TDefineResult;
begin
  if FDefined then
    Result := FResult
  else
    raise ENoDataFound.CreateFmt('Значение не определено для "%s"',[FText]);
end;

{ TStoreDefineUnit }

constructor TStoreDefineUnit.Create(ADefineUnitClass: TDefineUnitClass);
var
  i: TOilDataType;
begin
  FDefineUnitClass := ADefineUnitClass;
  for i := low(DefineClassArray) to high(DefineClassArray) do
  begin
    if DefineClassArray[i] = ADefineUnitClass then
    begin
      FDataType := i;
      break;
    end;
  end;
  FResultList := TList.Create;
  FUserMode := True;
end;

constructor TStoreDefineUnit.Create(ADataType: TOilDataType);
begin
  Create(DefineClassArray[ADataType]);
  FDataType := ADataType;
end;

destructor TStoreDefineUnit.Destroy;
begin
  FResultList.Free;
end;

function TStoreDefineUnit.GetLink(AText: string; AExeLinkProgram, AInst: integer): TDefineResult;
var
  i: integer;
  Rec: TDefineResultSave;
  IsFound: boolean;
  Res: TDefineResult;
  du: TDefineUnit;
begin
  Res := TDefineResult.Create(0, 0);
  // Проверяем кеш
  IsFound := False;
  for i := 0 to FResultList.Count - 1 do
  begin
    Rec := FResultList[i];
    if Rec.Text = AText then
    begin
      Result := TDefineResult.Create(Rec.Id, Rec.Inst);
      Exit;
    end;
  end;
  // Ищем в EXE_LINK

  if AExeLinkProgram <> 0 then
  begin
    try
      if DefineKeyCountArray[FDataType] = 2 then
      begin
        With TExeLink.GetOilLinkKey(DefineTableArray[FDataType], AExeLinkProgram, AText) do
        begin
          Res := TDefineResult.Create(Id, Inst);
          IsFound := True;
        end
      end
      else if DefineKeyCountArray[FDataType] = 1 then
      begin
        Res := TDefineResult.Create(TExeLink.GetOilLinkId(DefineTableArray[FDataType], AExeLinkProgram, AText), 0);
        IsFound := True;
      end;
    except on e:ENoDataFound do;
    end;
  end;
  // Ищем соответствие по-горячому "правильными" методами
  if not IsFound then
  begin
    du := FDefineUnitClass.Create(AText, AInst, UserMode);
    try
      if du.Defined then
      begin
        Res := TDefineResult.Create(du.Result.AsPrimaryKey);
        IsFound := True;
      end;
    finally
      du.Free;
    end;
  end;
  // Сохраняем
  if IsFound then
  begin
    Result := Res;
    new(Rec);
    Rec.Text := AText;
    Rec.Id := Result.AsPrimaryKey.Id;
    Rec.Inst := Result.AsPrimaryKey.Inst;
    FResultList.Add(Rec);
  end
  else
    raise ENoDataFound.CreateFmt('GetLink: Не найдено соответствие для "%s"', [AText]);
end;

procedure TStoreDefineUnit.LoadFromFile(AFilePath: string);
var
  F: file of PDefineResultSave;
  Rec: TDefineResultSave;
begin
  FResultList.Clear;
  AssignFile(F, AFilePath);
  Reset(F);
  while not Eof(F) do
  begin
    New(Rec);
    Read(F, Rec^);
    FResultList.Add(Rec);
  end;
  CloseFile(F);
end;

procedure TStoreDefineUnit.SaveToFile(AFilePath: string);
var
  F: file of PDefineResultSave;
  i: integer;
  Rec: TDefineResultSave;
begin
  AssignFile(F, AFilePath);
  Rewrite(F);
  for i := 0 to FResultList.Count - 1 do
  begin
    Rec := FResultList[i];
    Write(F, Rec^);
  end;
  CloseFile(F); 
end;

procedure TStoreDefineUnit.SetLink(AText: string; AInst: integer;
  ADefineResult: TDefineResult);
var
  Rec: TDefineResultSave;
  IsFound: boolean;
  i: integer;
begin
  IsFound := False;
  for i := 0 to FResultList.Count - 1 do
  begin
    Rec := FResultList[i];
    if Rec.Text = AText then
    begin
      IsFound := True;
      Rec.Id := ADefineResult.AsPrimaryKey.Id;
      Rec.Inst := ADefineResult.AsPrimaryKey.Inst;
      Break;
    end;
  end;

  if not IsFound then
  begin
    new(Rec);
    Rec.Text := AText;
    Rec.Id := ADefineResult.AsPrimaryKey.Id;
    Rec.Inst := ADefineResult.AsPrimaryKey.Inst;
    FResultList.Add(Rec);
  end;
end;

{ TDefineAZS }

function TDefineAZS.DoDefine: boolean;
var
  vNum, AZSName: string;
  i, Id: integer;
begin
  Result := False;
  // Поиск АЗС по номеру в тексте
  try
    AZSName := FText;
    vNum := '';
    // Ищем цифры в названии
    While (Length(AZSName) <> 0) and not (AZSName[1] in ['0'..'9']) do
      Delete(AZSName,1,1);
    // Если цыфры не найдены - выходим
    if AZSName <> '' then
      if AZSName[1] in ['0'..'9'] then
      begin
        // Вырезаем цыфры
        for i := 1 to Length(AZSName) do
        begin
          if AZSName[i] in ['0'..'9'] then
            vNum := vNum + AZSName[i]
          else if vNum <> '' then
            // если номер уже определен, и пошли другие символы, то выходим из цикла
            break;
        end;

        // Определяем код АЗС по номеру
        Id := nvl(GetSqlValueParSimple('select id from v_oil_azs where azs_num = :azs_num and par = :par and par_inst = :par_inst',
          ['azs_num', StrToInt(vNum),
           'par', FInst,
           'par_inst', FInst]),-1);

        if Id <> -1 then
        begin
          FResult := TDefineResult.Create(Id, Id);
          Result := True;
        end;
      end;
  except on e: Exception do
    // ShowMessage(format('Не удалось извлечь номер из строки %s',[FText]));
  end;

  // Даем пользователю возможность выбора
  if not Result and UserMode then
  begin
    ShowMessage('Сделайте выбор АЗС для значения '+FText);
    if ChooseOrg.CaptureOrg(2, FInst, FInst, 'yyy', Id, Id, AZSName) then
    begin
      Result := True;
      FResult := TDefineResult.Create(Id, Id);
    end;
  end;
end;


{ TDefineOrg }

function TDefineOrg.DoDefine: boolean;
begin
  Result := False;
end;

{ TDefineNpType }

function TDefineNpType.DoDefine: boolean;
begin
  Result := False;
end;

{ TDefineNpGroup }

function TDefineNpGroup.DoDefine: boolean;
begin
  Result := False;
end;

{ TDefineOper }

function TDefineOper.DoDefine: boolean;
begin
  Result := False;
end;

initialization
  ImportFunc := TdmImportFunc.Create(nil);
  
finalization
  ImportFunc.Free;

end.
