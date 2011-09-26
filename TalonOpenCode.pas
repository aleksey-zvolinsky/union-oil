{******************************************************************************}
{   �������������� :   ��������� ������������� ��� ������� ������              }
{                    �� ����� ���� DBF � ������� �������/������� �������.      }
{                                                                              }
{   ������� : 30 ������ 2004 ����                                              }
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
  // ���� �������������
  TToPlaceTalon = (
    tptOut,  // ������
    tptPrih, // ������
    tptSRep  // ������ �� �������� ������
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
  InStr: string; // ������ �����-���� ������
  stopRozSh, stopqTalon: boolean; // ������������ ��� ��������� ������ Import � Export ��� ��������� �������
  CodeCount, RozShCount, TalonCount: integer; // �������� ������: MTCode, MTRozSh, qTalon
  ErrorTalonCount: integer; // ������������ ��� �������� ��������� �������
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
    TCode.TableName := FilenameEdit1.Filename; // ��������� ���� DBF
    MTRozSh.Close;
    MTError.Close;
    ReadButton.Enabled := true;
    TCode.Open;
  except on E: Exception do
    begin
      ShowMessage(TranslateText('���������� ������� ���� ��� �������! ���� ��������! ��������� ������� ������������� ���� ��� ���!'));
      TCode.Close;
      MTRozSh.Close;
      MTError.Close;
      ReadButton.Enabled := false;
      ImportButton.Enabled := false;
      ExportError.Enabled := false;
      Exit;
    end;
  end;
  if not TCode.FieldList.Equals(q.SQL) then // ���������, ���� �� � ����� DBF ������� TALON
  begin
    TCode.Close;
    MTRozSh.Close;
    MTError.Close;
    showmessage(TranslateText('�������� ������ �������!'));
    ImportButton.Enabled := false;
    ReadButton.Enabled := false;
  end
  else
  begin
    TCode.Open;
    DBGCode.Columns[0].Title.Caption := TranslateText('�����-��� ������');
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
      ShowMessage(TranslateText('���� ���� ��� �������� � ������������.'));
      exit;
    end;
    stopRozSh := false;
    MTRozSh.close;
    MTRozSh.Open;
    MTRozSh.First;
    TCode.First;

    PB.Max := TCode.RecordCount;
    PB.Step := 1;
    // �������� ����������� �����-���� �������
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

    // ���������� ������
    if CodeCount = RozShCount then
    begin
      ShowMessage(TranslateText('������ �� ������� ������� ������������. ����������� ') + IntToStr(RozShCount) + TranslateText(' �������.'));
      ImportButton.Enabled := true;
      PB.Position := 0;
      exit;
    end
    else
      if CodeCount <> RozShCount then
      begin
        ShowMessage(TranslateText('������ �� ������� �� ������������!'));
        PB.Position := 0;
      end;
  except on E: Exception do
    begin
      ShowMessage(TranslateText('�����-���� ������� �� ����������������, �������� ���� ��������! ') + e.Message);
      MTRozSh.Close;
      MTError.Close;
      PB.Position := 0;
    end;
  end;
end;
//==============================================================================
procedure TTalonOpenCodeForm.ImportButtonClick(Sender: TObject);
var
  ImportTalon, Error, // �������� true ���� �������� ���� ��������� � qTalon.Post
  VsUkr: boolean; // ������������ �����
  Ser, strCodeOrg: string; // ����� ������. ��� ������� �� �����-���� ������
  Num, n: integer; // ����� ������. ��������������� ��� ��������� ������
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
      showmessage(TranslateText('������� ���� � ����������� dbf.'));
      exit;
    end
    else
    begin
      if not MTRozSh.Active and TCode.Active then
      begin
        ShowMessage(TranslateText('�� ��� �� ��������� ���� ����!'));
        exit;
      end;

      if TCode.Active and MTRozSh.Active then
      begin
        if not stopqTalon and (FilenameEdit1.Filename = e1.Text) then
        begin
          ShowMessage(TranslateText('���� ���� ��� ������������.'));
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
          tptOut:  // ������
            begin
              TalonOut := TTalonOutForm.Create(Application);
              qWork := TalonOut.qTalon;
            end;

          tptPrih: // ������
            begin
              TalonPrih := TTalonPrihForm.Create(Application);
              qWork := TalonPrih.qTalon;
            end;

          tptSRep: // ������ � ������� �����
            qWork := TOilQuery(FSRTalon.Table1);
        end;
        qWork.Close;
        qWork.Open;
        // �������� ������� ��� ��������� �������
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
          // ��� ��������� �������� �������

          case FToPlace of
            tptOut:  // ������
              AddErrorTalon(TalonExceptionHandler(TalonOut.TestTalon(Ser, Num), Ser, Num, toOtpysk, teoReturn));
            tptPrih: // ������
              AddErrorTalon(TalonExceptionHandler(TalonPrih.TestTalon(Ser, Num), Ser, Num, toPrihod, teoReturn));
            tptSRep: // ������ � ������� �����
              AddErrorTalon(TalonExceptionHandler(FSRTalon.TestTalon(Ser, Num), Ser, Num, toSrPrihod, teoReturn));
          end;
          strCodeOrg := Copy(InStr, 1, 2);

          if not (VsUkr) then
          begin
            if (StrToInt(strCodeOrg) = 8) and not Error then
            begin
              if (MainForm.qOrg.FieldByName('Talon_Code').AsInteger <> 7) then
                AddErrorTalon(TranslateText('����� �� ����������� ������ �����������!'));
            end;

            if (StrToInt(strCodeOrg) <> MainForm.qOrg.FieldByName('Talon_Code').AsInteger) and not Error then
              AddErrorTalon(TranslateText('����� �� ����������� ������ �����������!'));
          end;

          if not Error then
          begin
            // ������ �����, ������ � ���� � ������� ������� �������
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

    // ���������� ������
    if ImportTalon then
    begin
      ShowMessage(TranslateText('������ �� ������� ������� ������� � ������� ������� �������. ���������� ') + IntToStr(TalonCount) +
        TranslateText(' �������. ��� ������� ���� ������� ') + IntToStr(ErrorTalonCount) + TranslateText(' ��������� �������.'));
      ExportError.Enabled := true;
      if ErrorTalonCount = 0 then
        MTError.Active := false;
      PB.Position := 0;
    end
    else
      if not ImportTalon then
      begin
        ShowMessage(TranslateText('������ �� ������� �� ������� � ������� ������� �������!'));
        ExportError.Enabled := true;
        PB.Position := 0;
      end;
  except on E: Exception do
    begin
      ShowMessage(TranslateText('��� ������� ������� �������� ������! ������: "') + E.Message + '".');
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
// ����� ������� ������� ���� ������ ����������, ���� �������� ������ �� ������� �������
//==============================================================================
procedure TTalonOpenCodeForm.ce76Click(Sender: TObject); //���������� ��� �������
begin
  (Sender as TCurrencyEdit).ReadOnly := not stopRozSh and not stopqTalon;
end;
//==============================================================================
procedure TTalonOpenCodeForm.ExportErrorClick(Sender: TObject);
begin
  if (MTError.IsEmpty) and not MTError.Active then
    Showmessage(TranslateText('�� �� ������ ��������� ������ �������!'))
  else PutGridToExcel(DBGError, TranslateText('��������� ������'));
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
