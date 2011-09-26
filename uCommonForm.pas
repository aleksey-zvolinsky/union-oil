{
Самая что нинаесть базовая форма
От нее наследуются все формы, которые включены в проект
Я бы не советовал добавлять сюда визуальные компоненты, т.к. они могут
вовлечь гору геморроя в нашу и так несладкую жизнь.

Также не следует использовать события OnCreate, OnClose, OnShow и т.д,
т.к. они могут не сработать у наследников, которые не имеют ключевого слова
inherited в реализации события. В случае острой необходимости нужно проставить
inherited после begin во всех обработчиках этих событий.

В данном модуле переопределен конструктор формы. Следует помнить, что выполняется
он ПОСЛЕ события OnCreate формы-наследника.
Так же можно переопределить деструктор и производить какие-либо действия при
закрытии формы

Олег Козачок 13.03.2006
}

unit uCommonForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, TypInfo, dbgrids,  DBGridEh, RXDBCtrl, stdctrls,
  Buttons, uHelpButton,uOilQuery,uOilStoredProc;

type

  TLangParser = class
  private
    function SkipDot(AStr: String): String;
    function GetWord(AStr: String): String;
    function IsGridTitle: Boolean;
    function ColumnName: string;
  public
    Line: String;
    function FormName: String;
    function ControlName: String;
    function PropName: String;
    function PropText: String;
    function IsFormCaption: Boolean;
    function IsBaseRef: Boolean;
  end;

  TCommonForm = class(TForm)
  private
    Parser : TLangParser;
  public
    procedure TranslateControls(ALangId: Integer);
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  CommonForm: TCommonForm;

  function TranslateText(AString: String): String;

implementation

uses Main, Base, uStart, ExFunc;

{$R *.DFM}

function TranslateText(AString: String): String;
var num: integer;
begin
  try
   Result:=AString;
   if (not TRANSLATE) and (LANG_INTERFACE = 1) then
   begin
        num:=SLru.IndexOf(AString);  // запоминаем позицию в ru_msg.ini
        if num<>-1 then
          if trim(SLua.Strings[num])<>''
           then Result:=SLua.Strings[num];
   end;
  except Result:=AString;
  end;
end;

{
функция проверяет наличие свойства у компонента
 читай комментарии SetProperty
}

function HasProperty(Comp: TComponent; const Prop: string): Boolean;
var
  PropList: PPropList;
  NumProps, i: Integer;
begin
  Result := False;
  GetMem(proplist, GetTypeData(comp.classinfo)^.propcount * Sizeof(Pointer));
  try
    NumProps := GetPropList(Comp.ClassInfo, tkProperties, PropList);
    for i := 0 to pred(NumProps) do
    begin
      if CompareText(PropList[i]^.Name, Prop) = 0 then
      begin
        Result := true;
        Break;
      end;
    end;
  finally
    FreeMem(PropList, GetTypeData(Comp.Classinfo)^.PropCount * Sizeof(Pointer));
  end;
end;

{функция устанавливает свойство компонента}
procedure SetProperty(Comp: TComponent; const Prop, S: string);
var
  PropList: PPropList;
  NumProps, i: Integer;
begin
  {выделить память под указатели на имеющиеся у компонента свойства}
  GetMem(Proplist, GetTypeData(Comp.ClassInfo)^.PropCount * Sizeof(Pointer));
  try
    {Кол-во свойств компонента}
    NumProps := GetPropList(Comp.ClassInfo, tkProperties, PropList);
    for i := 0 to pred(NumProps) do
    begin
      {если то что нам нужно}
      if (CompareText(PropList[i]^.Name, Prop) = 0) then
        begin
          {установить свойство}
          SetStrProp(comp, proplist[i], s);
          Break;
        end;
    end;
  finally
    FreeMem(PropList, GetTypeData(Comp.ClassInfo)^.PropCount * Sizeof(Pointer));
  end;
end;

function NvlInt(AInt, AIfZero: Integer): Integer;
begin
  Result := AInt;
  if AInt <= 0
    then Result := AIfZero
end;

{ TLangParser }

{выкинуть слово с точкой}
function TLangParser.SkipDot(AStr: String): String;
begin
  Result := Trim(Copy(AStr,Pos('.',AStr) + 1,Length(AStr)));
end;

{получить слово до точки или до знака =}
function TLangParser.GetWord(AStr: String): String;
begin
  AStr := Copy(AStr,1,NvlInt(Pos('=',AStr),Length(AStr)));
  Result := Trim(Copy(AStr,1 ,NvlInt(Pos('.',AStr) - 1,Pos('=',AStr)-1)));
end;

function TLangParser.FormName: String;
begin
  {первое слово - название формы}
  Result := UpperCase(GetWord(Line));
end;

function TLangParser.ControlName: String;
begin
  {skip form name}
  Result := SkipDot(Line);
  {get control name}
  Result := UpperCase(GetWord(Result));
end;

function TLangParser.PropName: String;
begin
  {skip form name}
  Result := SkipDot(Line);
  {skip control name}
  Result := SkipDot(Result);
  {get property name}
  Result := UpperCase(GetWord(Result));
end;

function TLangParser.PropText: String;
var
  s: string;
  pStr: PChar;
begin
  {получить текст от знака = до конца строки}
  s := Trim(Copy(Line,Pos('=',Line) + 1,Length(Line)));
  if pos('#13#10', s) > 0 then
    while (pos('#13#10', s) > 0) do
    begin
      if pos('''#13#10', s) > 0 then // убираємо кавичку перед #13#10
        s := copy(s, 1, pos('''#13#10', s)-1) + copy(s, pos('''#13#10', s)+1, length(s));
      if pos('#13#10''', s) > 0 then // убираємо кавичку після #13#10
        s := copy(s, 1, pos('#13#10''', s)+5) + copy(s, pos('#13#10''', s)+7, length(s));
      s := copy(s, 1, pos('#13#10', s)-1) +#13#10+ copy(s, pos('#13#10', s)+6, length(s)); // підставляємо #13#10 (ENTER)
    end;
  pStr := PChar(s);
  Result := AnsiExtractQuotedStr(pStr,'''');
end;

{True если Line - заголовок формы}
function TLangParser.IsFormCaption: Boolean;
begin
  Result := UpperCase(GetWord(SkipDot(Line))) = 'CAPTION';
end;

function TLangParser.IsBaseRef: Boolean;
begin
  Result := (FormName = UpperCase('BaseForm')) or
    (FormName = UpperCase('BaseFormEnh'));
end;

function TLangParser.IsGridTitle: Boolean;
begin
  Result := Copy(PropName,1,1) = '[';
end;

function TLangParser.ColumnName: string;
var
  PStr: PChar;
begin
  Result := '';
  PStr := PChar(Copy(PropName,2,length(PropName)));
  PStr := PChar(Copy(PStr,1,Pos(']',PStr)-1));
  if PStr <> '' then
    Result := AnsiExtractQuotedStr(PStr, '''');;
end;

{ TCommonForm }

constructor TCommonForm.Create(AOwner: TComponent);
var
  Lang: String;
begin
  inherited;
  Parser := TLangParser.Create;
  try
    Lang := ReadPieceOfRegistry(HKEY_CURRENT_USER,'Software\Oil','Language');
    if (Lang <> '') then
    begin
      TranslateControls( StrToInt(Lang) );
      LANG_INTERFACE := StrToInt(Lang);
    end
    else
    begin
      LANG_INTERFACE:=0;
      StartLog(TranslateText('Проставляем ключ реестра Language'));      
      WritePieceOfRegistry('Language',IntToStr(LANG_INTERFACE));
    end;
  except on E:Exception do
    StartLog(TranslateText('Ошибка в конструкторе CommonForm: ')+E.Message);
  end;
end;

destructor TCommonForm.Destroy;
begin
  FreeAndNil(Parser);
  inherited;
end;

{
Берет из файла перевода строку, находит контрол на открываемой
форме и устанавливает соответствующие свойства.
Если контрол не найден ничего не происходит
}
procedure TCommonForm.TranslateControls(ALangId: Integer);
var
  F: TextFile;
  S, Text: String;
  Comp : TComponent;
  Grid: TComponent;
  I, Index: Integer;
  IsUseBaseRef: Boolean;
  StItemsStr: TStringList;
begin
  StartLog(ClassName+' start translate ... '+Formatdatetime('hh:mm:ss zzz',now));
  try
    case ALangId of
      0: AssignFile(F,GetMainDir+'language\rus.txt');
      1: AssignFile(F,GetMainDir+'language\ukr.txt');
    end;
    Reset(F);
    {пройти по файлу}
    while not Eof(F) do
    begin
      Readln(F, Parser.Line);
      {использует ли форма базовый справочник}
      IsUseBaseRef := InheritsFrom(TBaseForm) and (Parser.FormName = 'BASEFORM');
      {наша или базовая форма}
      if ('T'+Trim(Parser.FormName) = UpperCase(ClassName)) or IsUseBaseRef then
      begin
        {combobox, radiogroup, oilhelpbutton ...}
        if (Parser.PropName = 'ITEMS') and not Parser.IsBaseRef then
        begin
          S := '';
          StItemsStr := TStringList.Create;
          Str2StringList(Parser.PropText, StItemsStr);
          Text := StItemsStr.Text;
          StItemsStr.Free;
          {Найти контрол на форме}
          Comp := FindComponent(Parser.ControlName);
          if (Assigned(Comp)) and (Text <> '') then
          begin
            {TCombobox}
            if Comp is TCombobox then
            begin
              {запомнить состояние}
              Index := (Comp as TCombobox).ItemIndex;
              (Comp as TCombobox).Items.Text := Text;
              if Index <= (Comp as TCombobox).Items.Count - 1
                then (Comp as TCombobox).ItemIndex := Index;
            end;
            {TRadioGroup}
            if Comp is TRadioGroup then
            begin
              {запомнить состояние}
              Index := (Comp as TRadioGroup).ItemIndex;
              (Comp as TRadioGroup).Items.Text := Text;
              if Index <= (Comp as TRadioGroup).Items.Count - 1
                then (Comp as TRadioGroup).ItemIndex := Index;
            end;
            {TOilHelpButton}
            if Comp is TOilHelpButton then
              (Comp as TOilHelpButton).Lines.Text := Text;
          end;
        end
        else
        {заполнить колонки грида}
        if Parser.IsGridTitle and not Parser.IsBaseRef then
        begin
          Grid := FindComponent(Parser.ControlName);
          if Grid is TDBGrid then // простой грид
            for i := 0 to (Grid as TDbGrid).Columns.Count-1 do
              if (Grid as TDbGrid).Columns[i].FieldName = Parser.ColumnName then
              begin
                (Grid as TDbGrid).Columns[i].Title.Caption := Parser.PropText;
                break;
              end;
          if Grid is TDbGridEh then // Eh грид
            for i := 0 to (Grid as TDbGridEh).Columns.Count-1 do
              if (Grid as TDbGridEh).Columns[i].FieldName = Parser.ColumnName then
              begin
                (Grid as TDbGridEh).Columns[i].Title.Caption := Parser.PropText;
                break;
              end;            
          if Grid is TRxDbGrid then // RX грид
            for i := 0 to (Grid as TRxDbGrid).Columns.Count-1 do
              if (Grid as TRxDbGrid).Columns[i].FieldName = Parser.ColumnName then
              begin
                (Grid as TRxDbGrid).Columns[i].Title.Caption := Parser.PropText;
                break;
              end;
        end
        else
        {Все остальные контролы}
        begin
          {найти компонент по имени}
          Comp := FindComponent(Parser.ControlName);
          {заголовок формы}
          if Parser.IsFormCaption and not Parser.IsBaseRef  then
          begin
            if Parser.FormName = 'MAINFORM' then
            begin
              TMainForm(Self).FMainCaption := Parser.PropText;
              TMainForm(Self).SetCaption(MAIN_ORG.Name);
            end else Caption := Parser.PropText;
          end;
          {если компонент найден, проверить наличие нужного свойства и изменить его }
          if Assigned(Comp) then
            if HasProperty(Comp,Parser.PropName)
              then SetProperty(Comp,Parser.PropName,Parser.PropText);
        end;
      end;
    end;
    CloseFile(F);
    StartLog(ClassName+' end translate ... '+Formatdatetime('hh:mm:ss zzz',now));
    StartLog('-------------------------------------------');
  except

  end;
end;

initialization
  RegisterClass(TDBGridEh);

end.
