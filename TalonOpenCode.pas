{******************************************************************************}
{   Предназначение :   Программа предназначена для импорта данных              }
{                    из файла типа DBF в таблицу отпуска/прихода талонов.      }
{                                                                              }
{   Создана : 30 ноября 2004 года                                              }
{******************************************************************************}

unit TalonOpenCode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, Db, DBTables, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask,
  ToolEdit, ComCtrls, MemTable, CurrEdit, MemDS, DBAccess, Ora, SRTalon,
  uCommonForm, uOilQuery, uOilStoredProc, DBGridEh, TalonOutData{$IFDEF VER150},
  Variants{$ENDIF};

type
  // Куда импортировать
  TToPlaceTalon = (
    tptOut,  // отпуск
    tptPrih, // приход
    tptSRep  // приход по сменному отчету
    );
  TTalonOpenCodeForm = class(TCommonForm)
    DBGCode: TDBGridEh;
    DSCode: TOraDataSource;
    DSRozSh: TOraDataSource;
    Panel3: TPanel;
    ReadButton: TBitBtn;
    CloseButton: TBitBtn;
    DSError: TOraDataSource;
    DBGError: TDBGridEh;
    GroupBox1: TGroupBox;
    FilenameEdit1: TFilenameEdit;
    PB: TProgressBar;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MTError: TMemoryTable;
    TCode: TTable;
    q: TOilQuery;
    DBGTalon: TDBGridEh;
    MTRozSh: TMemoryTable;
    MTRozShNPGRP: TStringField;
    MTRozShSER: TStringField;
    MTRozShNUM: TStringField;
    MTRozShNOMINAL: TStringField;
    MTErrorSER: TStringField;
    MTErrorNUM: TStringField;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    ImportButton: TBitBtn;
    MTErrorERROR: TStringField;
    MTRozShPRICE: TStringField;
    e1: TEdit;
    ExportError: TBitBtn;
    SD: TSaveDialog;
    MTRozShnpgrp_id: TFloatField;
    gbPrice: TGroupBox;
    lPrice: TLabel;
    ce76: TCurrencyEdit;
    ce80: TCurrencyEdit;
    ce92: TCurrencyEdit;
    ce95: TCurrencyEdit;
    ce98: TCurrencyEdit;
    ceDT: TCurrencyEdit;
    ceGaz: TCurrencyEdit;
    procedure CloseButtonClick(Sender: TObject);
    procedure FilenameEdit1Change(Sender: TObject);
    procedure ReadButtonClick(Sender: TObject);
    procedure ImportButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ce76Click(Sender: TObject);
    procedure ExportErrorClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  public
    FSRTalon: TSRTalonForm;
    TalonPrice: TTalonPrice;
    constructor Create(AToPlace: TToPlaceTalon; ASRTalon: TSRTalonForm); reintroduce; overload;
    constructor Create(AToPlace: TToPlaceTalon); reintroduce; overload;
  end;

var
  TalonOpenCodeForm: TTalonOpenCodeForm;

implementation

uses Main, TalonPrihData, ExcelFunc, UDbFunc;

{$R *.DFM}

var
  InStr: string; // строка штрих-кода талона
  stopRozSh, stopqTalon: boolean; // используются для остановки кнопок Import и Export при повторном нажатии
  CodeCount, RozShCount, TalonCount: integer; // счётчики таблиц: MTCode, MTRozSh, qTalon
  ErrorTalonCount: integer; // используется для подсчёта ошибочных талонов
  FToPlace: TToPlaceTalon;

//==============================================================================
procedure TTalonOpenCodeForm.CloseButtonClick(Sender: TObject);
begin
  close;
end;
//==============================================================================
procedure TTalonOpenCodeForm.FilenameEdit1Change(Sender: TObject);
begin
  try
    ReadButton.Enabled := false;
    ImportButton.Enabled := false;
    ExportError.Enabled := false;
    stopRozSh := true;
    stopqTalon := true;
    TCode.Close;
    TCode.TableName := FilenameEdit1.Filename; // открываем файл DBF
    MTRozSh.Close;
    MTError.Close;
    ReadButton.Enabled := true;
    TCode.Open;
  except on E: Exception do
    begin
      ShowMessage(TranslateText('Невозможно открыть файл для импорта! Файл испорчен! Повторите попытку импортировать файл еще раз!'));
      TCode.Close;
      MTRozSh.Close;
      MTError.Close;
      ReadButton.Enabled := false;
      ImportButton.Enabled := false;
      ExportError.Enabled := false;
      Exit;
    end;
  end;
  if not TCode.FieldList.Equals(q.SQL) then // проверяем, есть ли в файле DBF столбец TALON
  begin
    TCode.Close;
    MTRozSh.Close;
    MTError.Close;
    showmessage(TranslateText('Неверный формат таблицы!'));
    ImportButton.Enabled := false;
    ReadButton.Enabled := false;
  end
  else
  begin
    TCode.Open;
    DBGCode.Columns[0].Title.Caption := TranslateText('Штрих-код талона');
    CodeCount := TCode.RecordCount;
  end;
end;
//==============================================================================
procedure TTalonOpenCodeForm.ReadButtonClick(Sender: TObject);
begin
  if TCode.IsEmpty then exit;
  try
    if not stopRozSh and (FilenameEdit1.Filename = e1.Text) then
    begin
      ShowMessage(TranslateText('Этот файл уже прочитан и импортирован.'));
      exit;
    end;
    stopRozSh := false;
    MTRozSh.close;
    MTRozSh.Open;
    MTRozSh.First;
    TCode.First;

    PB.Max := TCode.RecordCount;
    PB.Step := 1;
    // начинаем дешифровать штрих-коды талонов
    repeat
      begin
        if not ProcessBarCode(TCode.FieldByName('TALON').AsString, TOilQuery(MTRozSh), toOtpysk) then
        begin
          PB.Position := 0;
          ImportButton.Enabled := false;
          exit;
        end;
        MTRozSh.Edit;
        MTRozSh.FieldByName('NPGrp').AsString := VarToStr(
          GetSqlValueParSimple('select name from oil_np_group where id =:id ',
          ['id', MTRozSh.FieldByName('npgrp_id').AsInteger]));

        MTRozSh.FieldByName('PRICE').AsFloat := TalonPrice.GetPrice(MTRozSh.FieldByName('npgrp_id').AsInteger);
        TCode.next;
        MTRozSh.next;
        PB.StepIt;
      end;
    until TCode.Eof;
    RozShCount := MTRozSh.RecordCount;

    // результаты работы
    if CodeCount = RozShCount then
    begin
      ShowMessage(TranslateText('Данные по талонам успешно дешифрованны. Прочиталось ') + IntToStr(RozShCount) + TranslateText(' талонов.'));
      ImportButton.Enabled := true;
      PB.Position := 0;
      exit;
    end
    else
      if CodeCount <> RozShCount then
      begin
        ShowMessage(TranslateText('Данные по талонам не дешифрованны!'));
        PB.Position := 0;
      end;
  except on E: Exception do
    begin
      ShowMessage(TranslateText('Штрих-коды талонов не расшифровываются, возможно файл испорчен! ') + e.Message);
      MTRozSh.Close;
      MTError.Close;
      PB.Position := 0;
    end;
  end;
end;
//==============================================================================
procedure TTalonOpenCodeForm.ImportButtonClick(Sender: TObject);
var
  ImportTalon, Error, // присвоим true если выполнен вход процедуры в qTalon.Post
  VsUkr: boolean; // Всейкраиский талон
  Ser, strCodeOrg: string; // Серия талона. Код области из штрих-кода талона
  Num, n: integer; // Номер талона. Використовується для видалення талонів
  TalonOut: TTalonOutForm;
  TalonPrih: TTalonPrihForm;
  qWork: TOraQuery;
  //****************************************************************************
  procedure AddErrorTalon(AErrMsg: string);
  begin
    if (AErrMsg <> '') then
    begin
      MTError.Edit;
      MTError.FieldByName('ERROR').AsString := AErrMsg;
      MTError.FieldByName('SER').AsString := MTRozSh.FieldByName('SER').AsString;
      MTError.FieldByName('NUM').AsInteger := MTRozSh.FieldByName('NUM').AsInteger;
      Error := true;
      inc(ErrorTalonCount);
    end;
  end;
  //****************************************************************************
begin
  ErrorTalonCount := 0;
  ImportTalon := false;
  TalonCount := 0;
  try
    if (FilenameEdit1.Text = ' ') and not TCode.Active then
    begin
      showmessage(TranslateText('Укажите файл с расширением dbf.'));
      exit;
    end
    else
    begin
      if not MTRozSh.Active and TCode.Active then
      begin
        ShowMessage(TranslateText('Вы ещё не прочитали этот файл!'));
        exit;
      end;

      if TCode.Active and MTRozSh.Active then
      begin
        if not stopqTalon and (FilenameEdit1.Filename = e1.Text) then
        begin
          ShowMessage(TranslateText('Этот файл уже импортирован.'));
          exit;
        end;
        e1.Text := FilenameEdit1.Filename;
        stopqTalon := false;
        MTRozSh.First;
        MTError.close;
        MTError.Open;
        MTError.First;
        MTError.Edit;
        TCode.First;

        case FToPlace of
          tptOut:  // отпуск
            begin
              TalonOut := TTalonOutForm.Create(Application);
              qWork := TalonOut.qTalon;
            end;

          tptPrih: // приход
            begin
              TalonPrih := TTalonPrihForm.Create(Application);
              qWork := TalonPrih.qTalon;
            end;

          tptSRep: // приход в сменный отчет
            qWork := TOilQuery(FSRTalon.Table1);
        end;
        qWork.Close;
        qWork.Open;
        // удаление записей при повторном импорте
        qWork.Last;
        for n := qWork.RecordCount downto 1 do
        begin
          qWork.Edit;
          qWork.Delete;
        end;
        qWork.First;
        PB.Max := MTRozSh.RecordCount;
        PB.Step := 1;

        repeat
          Error := false;
          MTError.Append;
          MTRozSh.Edit;

          InStr := TCode.FieldByName('TALON').AsString;
          InStr := AnsiUpperCase(InStr);
          VsUkr := length(InStr) = 16;
          Ser := MTRozSh.FieldByName('Ser').AsString;
          Num := MTRozSh.FieldByName('Num').AsInteger;

          if qWork.State <> dsInsert then qWork.Append;
          // все возможные проверки талонов

          case FToPlace of
            tptOut:  // отпуск
              AddErrorTalon(TalonExceptionHandler(TalonOut.TestTalon(Ser, Num), Ser, Num, toOtpysk, teoReturn));
            tptPrih: // приход
              AddErrorTalon(TalonExceptionHandler(TalonPrih.TestTalon(Ser, Num), Ser, Num, toPrihod, teoReturn));
            tptSRep: // приход в сменный отчет
              AddErrorTalon(TalonExceptionHandler(FSRTalon.TestTalon(Ser, Num), Ser, Num, toSrPrihod, teoReturn));
          end;
          strCodeOrg := Copy(InStr, 1, 2);

          if not (VsUkr) then
          begin
            if (StrToInt(strCodeOrg) = 8) and not Error then
            begin
              if (MainForm.qOrg.FieldByName('Talon_Code').AsInteger <> 7) then
                AddErrorTalon(TranslateText('Талон не принадлежит данной организации!'));
            end;

            if (StrToInt(strCodeOrg) <> MainForm.qOrg.FieldByName('Talon_Code').AsInteger) and not Error then
              AddErrorTalon(TranslateText('Талон не принадлежит данной организации!'));
          end;

          if not Error then
          begin
            // запись серии, номера и цены в таблицу отпуска талонов
            qWork.FieldByName('SER').AsString := MTRozSh.FieldByName('SER').AsString;
            qWork.FieldByName('NUM').AsInteger := MTRozSh.FieldByName('NUM').AsInteger;
            if FToPlace = tptOut then
              qWork.FieldByName('PRICE').AsString := MTRozSh.FieldByName('PRICE').AsString;
            TalonCount := TalonCount + 1;
            qWork.Post;
            qWork.next;
            ImportTalon := true;
          end
          else
          begin
            MTError.post;
            MTError.next;
          end;
          PB.StepIt;
          TCode.Next;
          MTRozSh.next;
        until MTRozSh.Eof;
      end;
    end;

    if Error then
      if (qWork.State <> dsBrowse) then
        if FToPlace = tptSRep then
          qWork.Cancel
        else qWork.CancelUpdates;

    // результаты работы
    if ImportTalon then
    begin
      ShowMessage(TranslateText('Данные по талонам успешно внесены в таблицу отпуска талонов. Записалось ') + IntToStr(TalonCount) +
        TranslateText(' талонов. При импорте было найдено ') + IntToStr(ErrorTalonCount) + TranslateText(' ошибочных талонов.'));
      ExportError.Enabled := true;
      if ErrorTalonCount = 0 then
        MTError.Active := false;
      PB.Position := 0;
    end
    else
      if not ImportTalon then
      begin
        ShowMessage(TranslateText('Данные по талонам не внесены в таблицу отпуска талонов!'));
        ExportError.Enabled := true;
        PB.Position := 0;
      end;
  except on E: Exception do
    begin
      ShowMessage(TranslateText('При импорте талонов возникла ошибка! Ошибка: "') + E.Message + '".');
      qWork.Close;
      PB.Position := 0;
    end;
  end;
end;
//==============================================================================
procedure TTalonOpenCodeForm.FormCreate(Sender: TObject);
begin
  inherited;
  ImportButton.Enabled := false;
  ReadButton.Enabled := false;
  ExportError.Enabled := false;
  TalonPrice := TTalonPrice.Create;
  TalonPrice.AddEdit(@ceDT, 3);
  TalonPrice.AddEdit(@ce76, 4);
  TalonPrice.AddEdit(@ce80, 5);
  TalonPrice.AddEdit(@ce92, 6);
  TalonPrice.AddEdit(@ce95, 7);
  TalonPrice.AddEdit(@ce98, 10);
  TalonPrice.AddEdit(@ceGaz, 62);
end;
//==============================================================================
constructor TTalonOpenCodeForm.Create(AToPlace: TToPlaceTalon; ASRTalon: TSRTalonForm);
begin
  inherited Create(Application);
  FToPlace := AToPlace;
  FSRTalon := ASRTalon;
end;
//==============================================================================
constructor TTalonOpenCodeForm.Create(AToPlace: TToPlaceTalon);
begin
  inherited Create(Application);
  FToPlace := AToPlace;
end;
//==============================================================================
// после импорта талонов цены ввести невозможно, цены вводятся только до импорта талонов
//==============================================================================
procedure TTalonOpenCodeForm.ce76Click(Sender: TObject); //оставленна для истории
begin
  (Sender as TCurrencyEdit).ReadOnly := not stopRozSh and not stopqTalon;
end;
//==============================================================================
procedure TTalonOpenCodeForm.ExportErrorClick(Sender: TObject);
begin
  if (MTError.IsEmpty) and not MTError.Active then
    Showmessage(TranslateText('Вы не можете выгружать пустую таблицу!'))
  else PutGridToExcel(DBGError, TranslateText('Ошибочные талоны'));
end;
//==============================================================================
procedure TTalonOpenCodeForm.FormActivate(Sender: TObject);
begin
  if tptOut <> FToPlace then
  begin
    DBGTalon.Columns[4].Visible := false;
    DBGTalon.Width := 223;
    DBGError.Width := 303;
    gbPrice.Visible := false;
    Label2.Left := 156;
    Label3.Left := 450;
  end;
end;
//==============================================================================
procedure TTalonOpenCodeForm.FormDestroy(Sender: TObject);
begin
  inherited;
  TalonPrice.Free;
end;
//==============================================================================

end.
