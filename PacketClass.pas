unit PacketClass;

interface

uses uCommonForm, Classes, SysUtils, MoneyFunc, Dialogs, UDBFunc, uOilQuery, Ora,
  uOilStoredProc{$IFDEF VER150},Variants{$ENDIF}, Main, SRepAutoLoad, ExFunc;

type
  TPacketField = class
  private
    FValue: string;
    function SetLocalSeparator(AVar: string): string;    
  public
    constructor Create(AValue: string);
    function AsInteger: integer;
    function AsFloat: real;
    function AsString: string;
    function Value: Variant;
  end;

  TPacket = class(TObject)
  private
    FFileData: TStringList;
    FEndOfSection: boolean;
    FListenValues: integer;
    FSectionPosition: integer;
    FCurrSectionName: string;
    FCurrPacketLine: integer;
    FSL: TStringList;
    FRowCount: integer;
    function IsDataRow(ADataString: string): boolean;
    function GetSectionPos(ASectionName: string): integer;
    function GetFieldPos(AString, AField: string): integer;
    function _GetValue(AFieldName: string): string;
  public
    constructor Create(ASL: TStringList); reintroduce;
    destructor Destroy; reintroduce;
    property EndOfSection: boolean read FEndOfSection;
    property Eof: boolean read FEndOfSection;
    property CurrSectionName: string read FCurrSectionName;
    property CurrPacketLine: integer read FCurrPacketLine;
    function GetAllSections: TStringList;
    function FieldByName(AFieldName: string): TPacketField;
    function OpenSection(ASectionName: string; ACalcCount: boolean = true): integer;
    function FieldExist(AFieldName: string): boolean;
    procedure NextRow;
    procedure Next;
    property Count: integer read FRowCount;
  end;

  TGetValueFromString = class
  private
    FSourceString: string;
    FCurrentString: string;
    FCurrentField: TPacketField;
  public
    constructor Create(AString: string);
    function NextField(AMessage: string = ''; AValueNecessarily: boolean = true): TPacketField;
    property CurrentField: TPacketField read FCurrentField;
    property CurrentString: string read FCurrentString write FCurrentString;
    property SourceString: string read FSourceString;
  end;

const
  CRLF = #13#10;
  CRLF2 = CRLF + CRLF;

function ValidateTotal(ASL, ASL_NoAnalysis: TStringList): TStringList;
function GetValueFromString(p_String, p_Message: string; var Value: variant;
  ValueNecessarily: boolean = true): string;

implementation

{ TPacketField }

function TPacketField.SetLocalSeparator(AVar: string): string;
var
  s: string;
begin
  s := AVar;
  case DecimalSeparator of
    '.': if pos(',', s) > 0 then s[pos(',', s)] := DecimalSeparator;
    ',': if pos('.', s) > 0 then s[pos('.', s)] := DecimalSeparator;
  end;
  Result := s;
end;

constructor TPacketField.Create(AValue: string);
begin
  FValue := AValue;
end;

function TPacketField.AsInteger: integer;
begin
  Result := StrToInt(FValue);
end;

function TPacketField.AsFloat: real;
begin
  Result := StrToFloat(SetLocalSeparator(FValue));
end;

function TPacketField.AsString: string;
begin
  Result := FValue;
end;

function TPacketField.Value: Variant;
begin
  Result := FValue;
end;

{ TPacket }

//==============================================================================
constructor TPacket.Create(ASL: TStringList);
begin
  inherited Create;
  if ASL.Count = 0 then
    raise Exception.Create('TPacket: файл пуст ');
  FFileData := TStringList.Create;
  FSL := TStringList.Create;
  FSL.Text := ASL.Text;
  FFileData.Text := ASL.Text;
  FEndOfSection := false;
  FListenValues := 0;
  FSectionPosition := -1;
  FCurrSectionName := '';
  FCurrPacketLine := 0;
end;
//==============================================================================
destructor TPacket.Destroy;
begin
  if Assigned(FFileData) then FFileData.Free;
  inherited Destroy;
end;
//==============================================================================
function TPacket.GetAllSections: TStringList;
var
  i: integer;
  SName: string;
  SList: TStringList;
begin
  SList := TStringList.Create;
  try
    for i := 0 to FFileData.Count - 1 do
    begin
      SName := Copy(FFileData[i], 1, Pos(':', FFileData[i]) - 1);
      if (GetSectionPos(SName) > 0) and (SName <> 'VALUES') then
        SList.Add(SName);
    end;
  finally
    Result := Slist;
  end;
end;
//==============================================================================
function TPacket.GetFieldPos(AString, AField: string): integer;
var
  TakeField, Buffer: string;
  Count: integer;
begin
  Count := 0;
  Buffer := Copy(AString, Pos(':', AString) + 2, length(AString)) + ',';
  while Buffer <> '' do
  begin
    TakeField := trim(Copy(Buffer, 1, Pos(',', Buffer) - 1));
    inc(Count);
    if TakeField = AField then
    begin
      Result := Count;
      exit;
    end;
    Buffer := Copy(Buffer, Length(TakeField) + 2, Length(Buffer));
  end;
  Result := -1;
end;
//==============================================================================
function TPacket.GetSectionPos(ASectionName: string): integer;
var
  CurIndex: integer;
begin
  CurIndex := 0;
  FFileData.Add(' ');
  while CurIndex <= FFileData.Count - 2 do
  begin
    if (Pos(ASectionName + ':', UpperCase(FFileData[CurIndex])) = 1) and (IsDataRow(FFileData[CurIndex + 1])) then
    begin
      Result := CurIndex;
      Exit;
    end;
    Inc(CurIndex);
  end;
  Result := -1;
end;
//==============================================================================
function TPacket._GetValue(AFieldName: string): string;
var
  FieldPos, i: integer;
  Buffer: string;
  Res: Variant;
begin
  if FSectionPosition = -1 then
    raise Exception.Create(TranslateText('GetValue: нет открытых секций'));
  Buffer := Copy(FFileData[FSectionPosition + FListenValues],
    Pos(':', FFileData[FSectionPosition + FListenValues]) + 2,
    length(FFileData[FSectionPosition + FListenValues])) + '¦';
  FieldPos := GetFieldPos(FFileData[FSectionPosition], AFieldName);
  if FieldPos < 0 then
    raise Exception.Create(TranslateText('Packet.GetValue: не обнаружено запрошенное поле ') +
      AFieldName + CRLF + TranslateText('Секция: ') + FCurrSectionName);
  for i := 1 to FieldPos - 1 do
    Buffer := Copy(Buffer, Pos('¦', Buffer) + 1, length(Buffer));
  Res := Copy(Buffer, 1, Pos('¦', Buffer) - 1);
  if Res = '' then Result := '0'
  else Result := Res;
end;

function TPacket.FieldExist(AFieldName: string): boolean;
begin
  if FSectionPosition = -1 then
    raise Exception.Create(TranslateText('GetValue: нет открытых секций'));
  result := GetFieldPos(FFileData[FSectionPosition], AFieldName) > 0;
end;

function TPacket.FieldByName(AFieldName: string): TPacketField;
begin
  Result := TPacketField.Create(_GetValue(AFieldName));
end;
//==============================================================================
function TPacket.IsDataRow(ADataString: string): boolean;
begin
  Result := Pos('VALUES', ADataString) > 0;
end;
//==============================================================================
procedure TPacket.NextRow;
begin
  if not IsDataRow(FFileData[FSectionPosition + 1 + FListenValues]) then FEndOfSection := true
  else Inc(FListenValues);
  FCurrPacketLine := FSectionPosition + 1 + FListenValues;
end;

procedure TPacket.Next;
begin
  NextRow;
end;
//==============================================================================
function TPacket.OpenSection(ASectionName: string; ACalcCount: boolean = true): integer;
var
  p: TPacket;
begin
  FEndOfSection := false;
  ASectionName := UpperCase(ASectionName);
  FSectionPosition := GetSectionPos(ASectionName);
  FListenValues := 0;
  FCurrSectionName := ASectionName;
  Self.NextRow;
  Result := FSectionPosition;
  // Количество записей в секции
  if (Result > 0) and ACalcCount then
  begin
    p := TPacket.Create(FSL);
    try
      p.OpenSection(ASectionName, false);
      FRowCount := 1;
      while not p.EndOfSection do
      begin
        inc(FRowCount);
        p.NextRow;
      end;
    finally
      p.Free
    end;
  end
  else
    FRowCount := 0;
end;
//==============================================================================

//==============================================================================
function ValidateTotal(ASL, ASL_NoAnalysis: TStringList): TStringList;
var
  Packet: TPacket;
  Sections: TStringList;
  i, Position, NpType: integer;
  SumLitr, SumLitrORDERS: array[1..100] of Double;
  SMessage, SNpType, LitrField: string;
begin
  FillChar(SumLitr, SizeOf(SumLitr), 0);
  FillChar(SumLitrORDERS, SizeOf(SumLitrORDERS), 0);
  
  Packet := TPacket.Create(ASL);
  Sections := TStringList.Create;
  result := TStringList.Create;
  try
    with Packet do
    begin
      if OpenSection('TOTAL') < 0 then
      begin
        if DR_AUTOLOAD then
        begin
          SRepAutoLoad.SRepAutoLoadLog(TranslateText('Не обнаружена секция с контрольными суммами счетчиков'));
          exit;
        end
        else
          raise Exception.Create(TranslateText('Не обнаружена секция с контрольными суммами счетчиков'));
      end;

      Sections := GetAllSections;
      {Удалить с анализа ненужные секции}
      with Sections do
      begin
        Sort;
        for i := 0 to ASL_NoAnalysis.Count - 1 do
          if Find(ASL_NoAnalysis.Strings[i], Position) then
            Delete(Position);
      end;
      {По оставшимся секциям сложить литры}
      for i := 0 to Sections.Count - 1 do
      begin
        {Пропустить проход, в случае если такой секции не нашлось}
        if OpenSection(Sections[i]) < 0 then
          Continue;
        {Просуммировать литры в выбранных секциях}
        while not EndOfSection do
        begin
          if FieldByName('NP').AsInteger = 0 then
            raise Exception.Create(TranslateText('Строка: ') + IntToStr(CurrPacketLine) + CRLF + TranslateText('Не указан тип НП'))
          else NpType := FieldByName('NP').AsInteger;
          if CurrSectionName = 'VEDOM' then LitrField := 'LITRB'
          else LitrField := 'LITR';
          if FieldByName(LitrField).AsFloat = 0 then
            raise Exception.Create(TranslateText('Строка: ') + IntToStr(CurrPacketLine) + CRLF + TranslateText('Не указано кол-во литров'))
          else SumLitr[NpType] := SumLitr[NpType] + FieldByName(LitrField).AsFloat;
          NextRow;
        end;
      end;

      // може бути декілька резервуарів із одним НП
      OpenSection('TOTAL');
      while not EndOfSection do
      begin
        if FieldByName('NP').AsInteger = 0 then
          raise Exception.Create(TranslateText('Строка: ') + IntToStr(CurrPacketLine) + CRLF + TranslateText('Не указан тип НП'))
        else NpType := FieldByName('NP').AsInteger;
        SumLitrORDERS[NpType] := SumLitrORDERS[NpType] + FieldByName('SUMORDERS').AsFloat;

        // записуємо загальну суму реалізації по лічильникам
        result.Values[IntToStr(NpType)] :=
          CurrToStr(
            StrToCurr(
              decode([result.Values[IntToStr(NpType)], '', '0', result.Values[IntToStr(NpType)]])
            ) + FieldByName('SUMCOUNTERS').AsFloat
          );
        NextRow;
      end;

      // технічні проливи не є реалізацією
      OpenSection('MERNIC');
      while not EndOfSection do
      begin
        if FieldByName('NP').AsInteger = 0 then
          raise Exception.Create(TranslateText('Строка: ') + IntToStr(CurrPacketLine) + CRLF + TranslateText('Не указан тип НП'))
        else NpType := FieldByName('NP').AsInteger;

        // записуємо загальну суму реалізації по лічильникам
        result.Values[IntToStr(NpType)] :=
          CurrToStr(
            StrToCurr(
              decode([result.Values[IntToStr(NpType)], '', '0', result.Values[IntToStr(NpType)]])
            ) - FieldByName('LITR').AsFloat
          );
        NextRow;
      end;

      OpenSection('TOTAL');
      SMessage := '';
      {проверить суммы с значением в TOTAL}
      while not EndOfSection do
      begin
        if FieldByName('NP').AsInteger = 0 then
          SMessage := SMessage + TranslateText('Строка: ') + IntToStr(CurrPacketLine) + CRLF + TranslateText('Не указан тип НП') + CRLF2;
        try
          SNpType := GetSQLValue('select name from oil_np_group where id =' + FieldByName('NP').AsString);
        except
          SNpType := '';
        end;

        if FieldByName('SUMCOUNTERS').AsFloat <= 0 then
          if FieldByName('SUMORDERS').AsFloat <> 0 then
            SMessage := SMessage + TranslateText('Строка: ') + IntToStr(CurrPacketLine) + CRLF +
              TranslateText('Тип НП: ') + SNpType + CRLF +
              TranslateText('[TOTAL] Не указано кол-во литров, прошедшее по счетчикам') + CRLF2;

        if FieldByName('SUMORDERS').AsFloat <= 0 then
          if FieldByName('SUMCOUNTERS').AsFloat <> 0 then
            SMessage := SMessage + TranslateText('Строка: ') + IntToStr(CurrPacketLine) + CRLF +
              TranslateText('Тип НП: ') + SNpType + CRLF +
              TranslateText('[TOTAL] Не указано общее отпущенное кол-во литров') + CRLF2;

        if FieldByName('SUMCOUNTERS').AsFloat <> FieldByName('SUMORDERS').AsFloat then
          SMessage := SMessage + TranslateText('Строка: ') + IntToStr(CurrPacketLine) + CRLF +
            TranslateText('Тип НП: ') + SNpType + CRLF +
            TranslateText('[TOTAL] Не совпадение прошедших по счетчикам и отпущенных литров') + CRLF +
            TranslateText('По счетчикам: ') + FieldByName('SUMCOUNTERS').AsString + CRLF +
            TranslateText('Отпущено: ') + FieldByName('SUMORDERS').AsString + CRLF2;

        if Fround(SumLitr[FieldByName('NP').AsInteger], 2) <>
           Fround(SumLitrORDERS[FieldByName('NP').AsInteger], 2) then
          SMessage := SMessage + TranslateText('Строка: ') + IntToStr(CurrPacketLine) + CRLF +
            TranslateText('Тип НП: ') + SNpType + CRLF +
            TranslateText('[Пакет] Не совпадение отпущенных литров и суммы литров по видам отпуска в пакете ') + CRLF +
            TranslateText('Отпущено: ') + CurrToStr(SumLitrORDERS[FieldByName('NP').AsInteger]) + CRLF +
            TranslateText('В пакете: ') + CurrToStr(SumLitr[FieldByName('NP').AsInteger]) + CRLF2;
        NextRow;
      end;
    end; {with Packet}
    if SMessage <> '' then
      if DR_AUTOLOAD then
        SRepAutoLoad.SRepAutoLoadLog(
          TranslateText('В процессе проверки содержимого пакета было обнаружено: ') + CRLF2 + SMessage)
      else
        MessageDlg(TranslateText('В процессе проверки содержимого пакета было обнаружено: ') + CRLF2 + SMessage,
          mtInformation, [mbOk], 0);
  finally
    Sections.Free;
    Packet.Free;
  end;
end;
//==============================================================================
function GetValueFromString(p_String, p_Message: string; var Value: variant;
  ValueNecessarily: boolean = true): string;
begin
  if Pos('VALUES:', p_String) > 0 then p_String := Copy(p_String, 8, Length(p_String));
  if Pos('¦', p_String) > 0 then
  begin
    if (Copy(p_String, 1, Pos('¦', p_String) - 1) = '') and ValueNecessarily then
      Value := ''
    else Value := Trim(Copy(p_String, 1, Pos('¦', p_String) - 1));
    result := Copy(p_String, Pos('¦', p_String) + 1, Length(p_String));
  end
  else
  begin
    if (Copy(p_String, 1, Length(p_String)) = '') and ValueNecessarily then
      Value := ''
    else Value := Trim(Copy(p_String, 1, Length(p_String)));
    result := '';
  end;
end;
//==============================================================================

{ TGetValueFromString }

constructor TGetValueFromString.Create(AString: string);
begin
  FCurrentString := AString;
  FSourceString := AString;
end;

function TGetValueFromString.NextField(AMessage: string = ''; AValueNecessarily: boolean = true): TPacketField;
var
  p_String: string;
  Value: string;
begin
  p_String := FCurrentString;
  if Pos('VALUES:', p_String) > 0 then p_String := Copy(p_String, 8, Length(p_String));
  if Pos('¦', p_String) > 0 then
  begin
    if (Copy(p_String, 1, Pos('¦', p_String) - 1) = '') and AValueNecessarily then
      Value := ''
    else
      Value := Trim(Copy(p_String, 1, Pos('¦', p_String) - 1));
    FCurrentString := Copy(p_String, Pos('¦', p_String) + 1, Length(p_String));
  end
  else
  begin
    if (Copy(p_String, 1, Length(p_String)) = '') and AValueNecessarily then
      Value := ''
    else
      Value := Trim(Copy(p_String, 1, Length(p_String)));
    FCurrentString := '';
  end;
  FCurrentField := TPacketField.Create(Value);
  Result := FCurrentField;
end;

end.
