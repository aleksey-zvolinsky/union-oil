unit WayBillsRef;

interface

uses uCommonForm,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGridEh, Buttons, StdCtrls, ExtCtrls,
  ToolEdit, Mask, RXCtrls, ComObj, ActiveX,
{$IFDEF VER120}
  OleCtrls,
{$ENDIF}
  Excel8TLB, RxLookup, ActnList, ImgList, uOilQuery, Ora, uOilStoredProc, MemDS,
  DBAccess{$IFDEF VER150},Variants{$ENDIF};

type
  NPStruct = record
    NP: integer; // Код группы нефтепродукта
    Column1: integer; // Номер колонки для начального остатка
    Column2: integer; // Номер колонки для прихода
    Column3: integer; // Номер колонки для расхода
    Column4: integer; // Номер колонки для конечного прихода
    price: real; // Цена
  end;

  NPSumStruct = record
    NP: integer; // Код группы нефтепродуктов
    Row: integer; // Номер колонки для этой группы
    price: real; // Цена
  end;

  TWayBillsRefForm = class(TBaseForm)
    dsType: TOraDataSource;
    qType: TOilQuery;
    dsGroup: TOraDataSource;
    qGroup: TOilQuery;
    qTemp: TOilQuery;
    qGroupID: TFloatField;
    qGroupNAME: TStringField;
    qTypeID: TFloatField;
    qTypeNAME: TStringField;
    qID: TFloatField;
    qINST: TFloatField;
    qWAYBILL_DATE: TDateTimeField;
    qWAYBILL_NUMBER: TStringField;
    qNPTYPE: TStringField;
    qNAME: TStringField;
    qAUTO_TYPE: TStringField;
    qNUMB: TStringField;
    qAUTO_MODEL: TStringField;
    qEMPLOYNAME: TStringField;
    qLITRES: TFloatField;
    qKM: TFloatField;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    SpeedButton2: TSpeedButton;
    sb3: TSpeedButton;
    SpeedButton3: TSpeedButton;
    sb2: TSpeedButton;
    leType: TRxLookupEdit;
    leGroup: TRxLookupEdit;
    ceEmploy: TComboEdit;
    ceAuto: TComboEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    sb1: TSpeedButton;
    DateEdit2: TDateEdit;
    DateEdit1: TDateEdit;
    edDoc: TEdit;
    ceNPGroup: TComboEdit;
    RxSpeedButton1: TRxSpeedButton;
    pmAdd: TPopupMenu;
    miAdd: TMenuItem;
    miAddByAuto: TMenuItem;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;

    procedure ceNPGroupClick(Sender: TObject);
    procedure ceEmployButtonClick(Sender: TObject);

    procedure sb1Click(Sender: TObject);
    procedure sb3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);

    procedure bbSearchClick(Sender: TObject);
    procedure sb2Click(Sender: TObject);
    procedure ceAutoButtonClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure leGroupCloseUp(Sender: TObject);

    procedure acUpdate(Sender: TObject);
    procedure acInsertExecute(Sender: TObject);

    procedure sbEditClick(Sender: TObject); override;
    procedure miAddClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure miAddByAutoClick(Sender: TObject);

  private
  public
    procedure InitRef;
  end;

var
  WayBillsRefForm: TWayBillsRefForm;

implementation

uses EmpRef, uXMLForm, AutoRef, ExFunc, WayBill, OilStd, Main, Progr,
  Udbplan, UDbFunc;

{$R *.DFM}

var SearchEmpId, SearchEmpInst: integer;
  SearchAutoId, SearchAutoInst: integer;
  SearchNPGroup: integer;

//==============================================================================
procedure TWayBillsRefForm.InitRef;
begin
  qGroup.Open;
  qType.Open;
  // Устанавливает период с начала текущего месяца по текущее число
  SetCurrentMonth(DateEdit1, DateEdit2);
  Self.bbSearchClick(Self);
end;
//==============================================================================
procedure TWayBillsRefForm.ceNPGroupClick(Sender: TObject);
begin
  XMLChoose('npgroupref', SearchNpGroup, ceNPGroup);
end;
//==============================================================================
procedure TWayBillsRefForm.ceEmployButtonClick(Sender: TObject);
var
  TempForm: TEmpRefForm;
begin
  TempForm := TEmpRefForm.Create(Application);
  try
    if TempForm.ShowModal = mrOk then
      if not (TempForm.q.eof) then
      begin
        SearchEmpId := TempForm.qID.AsInteger;
        SearchEmpInst := TempForm.qINST.AsInteger;
        ceEmploy.Text := TempForm.qF_NAME.AsString + ' ' + TempForm.qI_NAME.AsString[1] + '. ' +
          TempForm.qO_NAME.AsString[1] + '.';
      end;
  finally
    TempForm.free;
  end;
end;
//==============================================================================
procedure TWayBillsRefForm.ceAutoButtonClick(Sender: TObject);
var
  TempForm: TAutoRefForm;
begin
  TempForm := TAutoRefForm.Create(Application);
  try
    if TempForm.ShowModal = mrOk then
      if not (TempForm.q.eof) then
      begin
        SearchAutoId := TempForm.qID.AsInteger;
        SearchAutoInst := TempForm.qINST.AsInteger;
        ceAuto.Text := TempForm.qNUMB.AsString;

        SearchEmpId := TempForm.qEMPLOY_ID.AsInteger;
        SearchEmpInst := TempForm.qEMPLOY_INST.AsInteger;
        ceEmploy.Text := TempForm.qFULLNAME.AsString;
      end;
  finally
    TempForm.free;
  end;
end;
//==============================================================================
procedure TWayBillsRefForm.sb1Click(Sender: TObject);
begin
  ceNPGroup.Text := '';
  SearchNPGroup := -1;
end;
//==============================================================================
procedure TWayBillsRefForm.sb3Click(Sender: TObject);
begin
  leGroup.Text := '';
  leType.Text := '';
  leType.Enabled := false;
  SpeedButton2.Enabled := false;
end;
//==============================================================================
procedure TWayBillsRefForm.SpeedButton2Click(Sender: TObject);
begin
  leType.Text := '';
end;
//==============================================================================
procedure TWayBillsRefForm.SpeedButton3Click(Sender: TObject);
begin
  ceEmploy.Text := '';
  SearchEmpId := -1;
  SearchEmpInst := -1;
end;
//==============================================================================
procedure TWayBillsRefForm.sb2Click(Sender: TObject);
begin
  ceAuto.Text := '';
  SearchAutoId := -1;
  SearchAutoInst := -1;
end;
//==============================================================================
procedure TWayBillsRefForm.bbSearchClick(Sender: TObject);
const
  Filter1 = 'AND waybill.waybill_date >= TO_DATE(%s, ''DD.MM.YYYY'')';
  Filter2 = 'AND waybill.waybill_date <= TO_DATE(%s, ''DD.MM.YYYY'')';
  Filter3 = 'AND waybill.waybill_number like ''%s''';
  Filter4 = 'AND np_group.id = %d';
  Filter5 = 'AND autogroup.id = %d';
  Filter6 = 'AND autotype.id = %d';
  Filter7 = 'AND waybill.auto_id = %d';
  Filter8 = 'AND waybill.auto_inst = %d';
  Filter9 = 'AND waybill.employ_id = %d';
  Filter10 = 'AND waybill.employ_inst = %d';
var
  curr_id, curr_inst: integer;
begin
  // Получаем текущую строку
  curr_id := qID.AsInteger;
  curr_inst := qINST.AsInteger;
  with q do
  begin
    if Active then Close;
    // Фильтр на дату начала периода
    if DateEdit1.Date <> 0 then
      sql.Strings[32] := Format(Filter1, [FormatDateTime('"''"dd"."mm"."yyyy"''"', DateEdit1.Date)])
    else sql.Strings[32] := '';
    // Фильтр на дату окончания периода
    if DateEdit2.Date <> 0 then
      sql.Strings[33] := Format(Filter2, [FormatDateTime('"''"dd"."mm"."yyyy"''"', DateEdit2.Date)])
    else sql.Strings[33] := '';
    // Фильтр на номер документа
    if edDoc.Text <> '' then
      sql.Strings[34] := Format(Filter3, ['%' + edDoc.Text + '%'])
    else sql.Strings[34] := '';
    // Фильтр на группу НП
    if ceNPGroup.Text <> '' then
      sql.Strings[35] := Format(Filter4, [SearchNPGroup])
    else sql.Strings[35] := '';
    // Фильтр на группу типов технического средства
    if leGroup.Text <> '' then
      sql.Strings[36] := Format(Filter5, [qGroupID.AsInteger])
    else sql.Strings[36] := '';
    // Фильтр на тип технического средства
    if leType.Text <> '' then
      sql.Strings[37] := Format(Filter6, [qTypeID.AsInteger])
    else sql.Strings[37] := '';
    // Фильтр на автомобиль
    if ceAuto.Text <> '' then
    begin
      sql.Strings[38] := Format(Filter7, [SearchAutoId]);
      sql.Strings[39] := Format(Filter8, [SearchAutoInst]);
    end
    else
    begin
      sql.Strings[38] := '';
      sql.Strings[39] := '';
    end;
    // Фильтр на водителя
    if ceEmploy.Text <> '' then
    begin
      sql.Strings[40] := Format(Filter9, [SearchEmpId]);
      sql.Strings[41] := Format(Filter10, [SearchEmpInst]);
    end
    else
    begin
      sql.Strings[40] := '';
      sql.Strings[41] := '';
    end;
    Open;
    // Позиционируем курсор
    Locate('id;inst', VarArrayOf([curr_id, curr_inst]), []);
  end;
end;
//==============================================================================
procedure TWayBillsRefForm.bbClearClick(Sender: TObject);
begin
  edDoc.Text := '';
  ceNPGroup.Text := '';
  SearchNPGroup := -1;
  leGroup.Text := '';
  leType.Text := '';
  leType.Enabled := false;
  SpeedButton2.Enabled := false;
  ceEmploy.Text := '';
  SearchEmpId := -1;
  SearchEmpInst := -1;
  ceAuto.Text := '';
  SearchAutoId := -1;
  SearchAutoInst := -1;
end;
//==============================================================================
procedure TWayBillsRefForm.leGroupCloseUp(Sender: TObject);
begin
  if leGroup.Text <> '' then
  begin
    with qType do
    begin
      if Active then Close;
      ParamByName('AutoGroupID').AsInteger := qGroupID.AsInteger;
      Open;
    end;
    leType.Text := qTypeNAME.AsString;
    leType.Enabled := true;
    SpeedButton2.Enabled := true;
  end
  else
  begin
    leType.Text := '';
    leType.Enabled := false;
    SpeedButton2.Enabled := false;
  end;
end;
//==============================================================================
procedure TWayBillsRefForm.acUpdate(Sender: TObject);
begin
end;
//==============================================================================
procedure TWayBillsRefForm.acInsertExecute(Sender: TObject);
begin

end;
//==============================================================================
procedure TWayBillsRefForm.sbEditClick(Sender: TObject);
const
  CloseWayBillForUse = 'SELECT * FROM OIL_WAYBILLS ' +
    'WHERE ID = %d AND INST = %d FOR UPDATE NOWAIT';
  CloseOperationsForUse = 'SELECT * FROM OIL_AUTO_OPER ' +
    'WHERE WAYBILL_ID = %d AND WAYBILL_INST = %d FOR UPDATE NOWAIT';
var
  TempForm: TWayBillForm;
begin
  inherited;
  if q.IsEmpty then
    Exit;
  StartSQL;
  TempForm := TWayBillForm.Create(Self);
  try
    try
      // Проверки на вшивость
      if (INST <> qINST.AsInteger) or (StrToDate(Close_Date) >= qWAYBILL_DATE.AsDateTime) then
      // Можно только просматривать информацию
        TempForm.ShowOnly := true
      else TempForm.ShowOnly := false;

      with qTemp do
      begin
        // Устанавливаем блокировки
        Close;
        SQL.Text := Format(CloseWayBillForUse, [qID.AsInteger, qINST.AsInteger]);
        Open;

        Close;
        SQL.Text := Format(CloseOperationsForUse, [qID.AsInteger, qINST.AsInteger]);
        Open;
      end;

      TempForm.EditWayBill(qID.AsInteger, qINST.AsInteger);
      if TempForm.ShowModal = mrOk then
      begin
        CommitSQL;
        bbSearchClick(nil);
      end
      else
      begin
        RollbackSQL;
        bbSearchClick(nil);
      end;
    finally
      TempForm.Free;
    end;
  except on E: Exception do
    begin
      if Pos('ORA-00054:', E.Message) <> 0 then
        MessageDlg(TranslateText('Выбранная запись редактируется другим пользователем!'), mtWarning, [mbOk], 0)
      else MessageDlg(E.Message, mtError, [mbOk], 0);
      RollbackSQL;
      bbSearchClick(nil);
    end;
  end;
end;
//==============================================================================
procedure TWayBillsRefForm.miAddClick(Sender: TObject);
var
  TempForm: TWayBillForm;
begin
  inherited;
  StartSQL;
  TempForm := TWayBillForm.Create(Self);
  try
    try
      TempForm.AddWayBill;
      if TempForm.ShowModal = mrOk then
        CommitSQL
      else
        RollbackSQL;
      bbSearchClick(nil);
    finally
      TempForm.Free;
    end;
  except on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOk], 0);
      RollbackSQL;
      bbSearchClick(nil);
    end;
  end;
end;

procedure TWayBillsRefForm.sbDelClick(Sender: TObject);
const
  CloseWayBillForUse = 'SELECT * FROM OIL_WAYBILLS ' +
    'WHERE ID = %d AND INST = %d FOR UPDATE NOWAIT';
  CloseOperationsForUse = 'SELECT * FROM OIL_AUTO_OPER ' +
    'WHERE WAYBILL_ID = %d AND WAYBILL_INST = %d FOR UPDATE NOWAIT';
begin
  inherited;
  if q.IsEmpty then
    Exit;
  if MessageDlg(TranslateText(' Вы действительно хотите удалить эту запись?'), mtWarning, [mbYes, mbNo], 0) = mrNo then
    Exit;
  StartSQL;
  try
    if INST <> qINST.AsInteger then
      raise Exception.Create(TranslateText('Нельзя удалить запись, созданную другой организацией!'));

    if StrToDate(Close_Date) >= qWAYBILL_DATE.AsDateTime then
      raise Exception.Create(TranslateText('Данный период закрыт!'));

    // Собственно патч
    with qTemp do
    begin
      // Устанавливаем блокировки
      Close;
      SQL.Text := Format(CloseWayBillForUse, [qID.AsInteger, qINST.AsInteger]);
      Open;

      Close;
      SQL.Text := Format(CloseOperationsForUse, [qID.AsInteger, qINST.AsInteger]);
      Open;

      // Патчим
      _ExecSql('UPDATE OIL_WAYBILLS SET STATE = ''N'' WHERE ID = :ID AND INST = :INST',
       ['ID',   qID.AsInteger,
        'INST', qINST.AsInteger]);

      _ExecSql('UPDATE OIL_AUTO_OPER SET STATE = ''N'' WHERE WAYBILL_ID = :ID AND WAYBILL_INST = :INST',
       ['ID',   qID.AsInteger,
        'INST', qINST.AsInteger]);
    end;

    CommitSQL;
    bbSearchClick(nil);
  except on E: Exception do
    begin
      if Pos('ORA-00054:', E.Message) <> 0 then
        MessageDlg(TranslateText('Выбранная запись редактируется другим пользователем!'), mtWarning, [mbOk], 0)
      else MessageDlg(E.Message, mtError, [mbOk], 0);
      RollbackSQL;
      bbSearchClick(nil);
    end;
  end;
end;

procedure TWayBillsRefForm.miAddByAutoClick(Sender: TObject);
var
  TempForm: TWayBillForm;
begin
  inherited;
  if q.IsEmpty then
    Exit;
  StartSQL;
  TempForm := TWayBillForm.Create(Self);
  try
    try
      TempForm.AddWayBillByWayBill(qID.AsInteger, qINST.AsInteger);
      if TempForm.ShowModal = mrOk then
        CommitSQL
      else
        RollbackSQL;
      bbSearchClick(nil);
    finally
      TempForm.Free;
    end;
  except on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOk], 0);
      RollbackSQL;
      bbSearchClick(nil);
    end;
  end;
end;

end.
