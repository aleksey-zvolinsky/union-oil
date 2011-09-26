unit WayBill;

interface
                       
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, ToolWin, Mask, DBCtrls, ToolEdit, RXDBCtrl,
  Grids, DBGridEh, DBTables, Db, ActnList, ImgList, RxLookup, Buttons,
  CurrEdit, DBGrids, uCommonForm,uOilQuery,Ora, uOilStoredProc, DBAccess,
  MemDS, VirtualTable, Variants;

type
  TWayBillForm = class(TCommonForm)
    gbWayBill: TGroupBox;
    Label1: TLabel;
    eNum: TDBEdit;
    lblDate: TLabel;
    deDate: TDBDateEdit;
    lblEmploy: TLabel;
    lblAuto: TLabel;
    lblNPGroup: TLabel;
    qOperations: TOilQuery;
    dsOperations: TOraDataSource;
    ActionList1: TActionList;
    acDelete: TAction;
    ButtonPanel: TPanel;
    qTemp: TOilQuery;
    qWayBill: TOilQuery;
    dsWayBill: TOraDataSource;
    UpWayBill: TOraUpdateSQL;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    sbClearEmploy: TSpeedButton;
    ceEmploy: TComboEdit;
    ceNPGroup: TComboEdit;
    sbClearNPGroup: TSpeedButton;
    ceAuto: TComboEdit;
    sbClearAuto: TSpeedButton;
    lblCountLitr: TLabel;
    lblAttention: TLabel;
    qWayBillID: TFloatField;
    qWayBillINST: TFloatField;
    qWayBillWAYBILL_NUMBER: TStringField;
    qWayBillWAYBILL_DATE: TDateTimeField;
    qWayBillEMPLOY_ID: TFloatField;
    qWayBillEMPLOY_INST: TFloatField;
    qWayBillAUTO_ID: TFloatField;
    qWayBillAUTO_INST: TFloatField;
    qWayBillNP_TYPE: TFloatField;
    qWayBillSTATE: TStringField;
    eCountLitr: TCurrencyEdit;
    qOperationsID: TFloatField;
    qOperationsINST: TFloatField;
    qOperationsSTATE: TStringField;
    qOperationsWAYBILL_ID: TFloatField;
    qOperationsWAYBILL_INST: TFloatField;
    qOperationsAUTO_OPER_ID: TFloatField;
    qOperationsKILOMETERS: TFloatField;
    qOperationsLITRES: TFloatField;
    qOperationsTONNS: TFloatField;
    qOperationsDATE_MOD: TDateTimeField;
    qOperationsAUTO_OPER_NAME: TStringField;
    eCountLength: TCurrencyEdit;
    lblCountLength: TLabel;
    dsGroupRashType: TOraDataSource;
    qGroupRashType: TOilQuery;
    qGroupRashTypeID: TFloatField;
    qGroupRashTypeNAME: TStringField;
    qRest: TOraQuery;
    Panel4: TPanel;
    Label31: TLabel;
    lAutoRest: TLabel;
    pnlGrids: TPanel;
    gbDetailNew: TGroupBox;
    Grid: TDBGridEh;
    pActionBtn: TPanel;
    sbDeleteRash: TSpeedButton;
    gbPrih: TGroupBox;
    GridPrih: TDBGridEh;
    Panel1: TPanel;
    sbDeletePrih: TSpeedButton;
    vtPrih: TVirtualTable;
    vtPrihDOC_NUMBER: TStringField;
    vtPrihLITR: TIntegerField;
    dsPrih: TOraDataSource;
    acDeletePrih: TAction;
    qPrih: TOraQuery;
    procedure qOperationsApplyUpdates(DataSet: TDataSet);


    procedure ceEmployButtonClick(Sender: TObject);
    procedure ceAutoButtonClick(Sender: TObject);
    procedure ceNPGroupButtonClick(Sender: TObject);
    procedure sbClearAutoClick(Sender: TObject);
    procedure sbClearEmployClick(Sender: TObject);
    procedure sbClearNPGroupClick(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);

    procedure bbOkClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure deDateChange(Sender: TObject);
    procedure vtOperationsAfterDelete(DataSet: TDataSet);
    procedure qOperationsBeforePost(DataSet: TDataSet);
    procedure qOperationsNewRecord(DataSet: TDataSet);
    procedure GridKeyPress(Sender: TObject; var Key: Char);
    procedure GridExit(Sender: TObject);
    procedure ceAutoChange(Sender: TObject);
    procedure ceEmployChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure eCountLitrChange(Sender: TObject);
    procedure acDeletePrihExecute(Sender: TObject);
    procedure vtPrihAfterPost(DataSet: TDataSet);
    procedure GridPrihKeyPress(Sender: TObject; var Key: Char);
    procedure GridPrihSumListAfterRecalcAll(Sender: TObject);
    procedure GridSumListAfterRecalcAll(Sender: TObject);
  private
    FLastAutoOperId: integer;
    FLastAutoOperName: string;
    procedure ClearOperations;
    procedure RecalcRest;
    procedure SetColors;

  public
    ShowOnly: boolean; // Режим просмотра документа
    fEditMode: boolean; // Режим редактирования документа
    procedure AddWayBill;
    procedure AddWayBillByWayBill(WayBillID, WayBillINST: integer);
    procedure EditWayBill(WayBillID, WayBillINST: integer);
  end;

var
  WayBillForm: TWayBillForm;

implementation

uses EmpRef, AutoRef, ExFunc, Main, OilStd, NPTypeRef, UDbFunc,
  AutoCard;

{$R *.DFM}
const GetEmployName = 'SELECT employ.f_name||'' ''||SUBSTR(employ.i_name, 1, 1)||''.''||SUBSTR(employ.o_name, 1, 1)||''.'' ' +
                      '  FROM oil_employ employ ' +
                      ' WHERE id = :id ' +
                      '   AND inst = :inst';

Var SearchEmpId, SearchEmpInst: integer;
    SearchAutoId, SearchAutoInst: integer;
    SearchNPType: integer;
    AutoGroup: integer;


// Процедура создает новый путевой лист и открывает его на редактирование
procedure TWayBillForm.AddWayBill;
var
  NewWayBillID: integer;
begin
  qGroupRashType.Open;
  // Меняем заголовок окна
  Self.Caption := Self.Caption + TranslateText(' - создание нового документа');

  // Создаем путевой лист
  NewWayBillID := DBSaver.SaveRecord('OIL_WAYBILLS',
   ['inst', INST,
    'state', 'Y']);

  // Открываем запрос по путевому листу
  with qWayBill do
  begin
    Close;
    ParamByName('id').AsInteger := NewWayBillID;
    ParamByName('inst').AsInteger := INST;
    Open;
    Edit;
  end;

  qWayBillWAYBILL_DATE.AsDateTime := Date;

  fEditMode := false;
end;

// Процедура подготавливает путевой лист для редактирования
procedure TWayBillForm.EditWayBill(WayBillID, WayBillINST: integer);
const
  GetAutoInf = 'SELECT auto.numb, autotype.auto_group ' +
               '  FROM oil_auto auto, oil_auto_type autotype ' +
               ' WHERE auto.auto_type_id = autotype.id ' +
               '   AND auto.id = %d ' +
               '   AND auto.inst = %d';

  GetLitres = 'SELECT SUM(oper.litres) as litres, ' +
              '       SUM(oper.kilometers) as km ' +
              '  FROM oil_auto_oper oper ' +
              ' WHERE oper.waybill_id = %d ' +
              '   AND oper.waybill_inst = %d ' +
              '   AND oper.state = ''Y''';
begin
  qGroupRashType.Open;  
  // Открываем запрос по путевому листу
  with qWayBill do
  begin
    Close;
    ParamByName('id').AsInteger := WayBillID;
    ParamByName('inst').AsInteger := WayBillINST;
    Open;
    Edit;
  end;

  // Получаем данные для их визуализации
  // Данные по водителю
  SearchEmpId := qWayBillEMPLOY_ID.AsInteger;
  SearchEmpInst := qWayBillEMPLOY_INST.AsInteger;
  ceEmploy.Text := GetSqlValueParSimple(GetEmployName,
   ['id',   SearchEmpId,
    'inst', SearchEmpInst]);

  // Данные по техническому средству
  SearchAutoId := qWayBillAUTO_ID.AsInteger;
  SearchAutoInst := qWayBillAUTO_INST.AsInteger;
  with qTemp do
  begin
    Close;
    SQL.Text:= Format(GetAutoInf, [SearchAutoId, SearchAutoInst]);
    Open;
    ceAuto.Text := Fields[0].AsString;
    AutoGroup := Fields[1].AsInteger;
    SetColors;
    // Проверяем группу
    if AutoGroup = 2 then
    begin // Это группа "Грузовой и специальный транспорт"
      // Открываем деталировку
      with qOperations do
      begin
        Close;
        ParamByName('id').AsInteger:= qWayBillID.AsInteger;
        ParamByName('inst').AsInteger:= qWayBillINST.AsInteger;
        Open;
      end;

      eCountLitr.Value := grid.SumList.SumCollection[0].SumValue;
      eCountLength.Value := grid.SumList.SumCollection[1].SumValue;
    end
    else
    begin // Это остальные группы
      // Подсчитываем кол-во литров и километров
      Close;
      SQL.Text:= Format(GetLitres,
        [qWayBillID.AsInteger, qWayBillINST.AsInteger]);
      Open;
      eCountLitr.Value := Fields[0].AsFloat;
      eCountLength.Value := Fields[1].AsFloat;
    end;
  end;

  // Данные по типу нефтепродукта
  SearchNPType := qWayBillNP_TYPE.AsInteger;
  ceNPGroup.Text := GetNpName(SearchNPType);

  // Проверяем текущий режим
  if ShowOnly then
  begin
    // Режим "только просмотр"
    // Меняем заголовок окна
    Self.Caption:= Self.Caption + TranslateText(' - просмотр документа');
    gbWayBill.Enabled := false;
    gbDetailNew.Enabled := false;
    gbPrih.Enabled := false;

    fEditMode:= false;
  end
  else
  begin
    // Режим "редактирование"
    // Меняем заголовок окна
    Self.Caption:= Self.Caption + TranslateText(' - редактирование документа');

    fEditMode:= true;
  end;
  _OpenQueryPar(qPrih,
   ['id', qWayBillID.AsInteger,
    'inst', qWayBillINST.AsInteger]);
  vtPrih.Close;
  vtPrih.Assign(qPrih);
  vtPrih.Open;
end;

procedure TWayBillForm.qOperationsApplyUpdates(DataSet: TDataSet);
begin
  qOperations.ApplyUpdates;
  qOperations.CommitUpdates;

  if (not eCountLitr.Enabled) then
  begin
    eCountLitr.Value:= grid.SumList.SumCollection[0].SumValue;
    eCountLength.Value:= grid.SumList.SumCollection[1].SumValue;
  end;
  FLastAutoOperId := qOperationsAUTO_OPER_ID.AsInteger;
  FLastAutoOperName := qOperationsAUTO_OPER_NAME.AsString;
end;

procedure TWayBillForm.ceEmployButtonClick(Sender: TObject);
var
  TempForm: TEmpRefForm;
begin
  TempForm:= TEmpRefForm.Create(Self);

  try
    if TempForm.ShowModal = mrOk then
      if not(TempForm.q.eof) then
      begin
        SearchEmpId:= TempForm.qID.AsInteger;
        SearchEmpInst:= TempForm.qINST.AsInteger;
        ceEmploy.Text:= TempForm.qF_NAME.AsString + ' ' +
                        TempForm.qI_NAME.AsString[1] + '. ' +
                        TempForm.qO_NAME.AsString[1] + '.';
      end;
  finally
    TempForm.Free;
  end;
end;

procedure TWayBillForm.ceAutoButtonClick(Sender: TObject);
var
  TempForm: TAutoRefForm;
begin
  TempForm:= TAutoRefForm.Create(Application);

  try
    try
      if TempForm.ShowModal = mrOk then
      if not(TempForm.q.eof) then
      begin
        // Идет проверка группы ТС к которой принадлежит автомашина
        AutoGroup := TempForm.qAUTO_GROUP_ID.AsInteger;
        if not (AutoGroup in [1, 2, 3, 4]) then
         // Это вообще непонятно что за группа, блин
          raise EAbort.Create(TranslateText(' Не определена группа к которой принадлежит') +
                              TranslateText(' техническое средство!'));
        SetColors;

        // Чистим за предыдущей машиной
        ClearOperations;

        if AutoGroup = 2 then
        begin // Это группа "Грузовой и специальный транспорт"

          // Открываем деталировку
          with qOperations do
          begin
            Close;
            ParamByName('id').AsInteger:= qWayBillID.AsInteger;
            ParamByName('inst').AsInteger:= qWayBillINST.AsInteger;
            Open;
          end;
        end;

        if not vtPrih.Active then
          vtPrih.Open;

        SearchAutoId := TempForm.qID.AsInteger;
        SearchAutoInst := TempForm.qINST.AsInteger;
        ceAuto.Text := TempForm.qNUMB.AsString;

        SearchEmpId := TempForm.qEMPLOY_ID.AsInteger;
        SearchEmpInst := TempForm.qEMPLOY_INST.AsInteger;
        ceEmploy.Text := TempForm.qFULLNAME.AsString;
      end;

    finally
      TempForm.Free;
    end;
  except
    on E: EAbort do
      MessageDlg(E.Message, mtWarning, [mbOk], 0);
  end;
end;

procedure TWayBillForm.ceNPGroupButtonClick(Sender: TObject);
var
  TempForm: TNPTypeRefForm;
begin
  TempForm := TNPTypeRefForm.Create(Application);

  try
    if TempForm.ShowModal = mrOk Then
    begin
      ceNPGroup.Text:= TempForm.qName.AsString;
      SearchNPType:= TempForm.qId.AsInteger;
    end;

  finally
    TempForm.Free;
  end;
end;

procedure TWayBillForm.sbClearAutoClick(Sender: TObject);
begin
  ceAuto.Text := '';
  SearchAutoId := -1;
  SearchAutoInst := -1;
  AutoGroup := 0;

  gbDetailNew.Enabled := false;
  eCountLitr.Enabled := false;
  eCountLength.Enabled := false;
  lblCountLitr.Enabled := false;
  lblCountLength.Enabled := false;

  gbDetailNew.Font.Color := clGray;
  grid.TitleFont.Color := clGray;
  grid.Font.Color := clGray;
  grid.FooterFont.Color := clGray;
  lblAttention.Font.Color := clWindowText;

  ClearOperations;  
end;

procedure TWayBillForm.sbClearEmployClick(Sender: TObject);
begin
  ceEmploy.Text:= '';
  SearchEmpId:= -1;
  SearchEmpInst:= -1;
end;

procedure TWayBillForm.sbClearNPGroupClick(Sender: TObject);
begin
  ceNPGroup.Text:= '';
  SearchNPType:= -1;
end;

procedure TWayBillForm.acDeleteExecute(Sender: TObject);
begin
  if MessageDlg(TranslateText(' Вы действительно хотите удалить эту запись?'),
               mtWarning, [mbYes, mbNo], 0) = mrYes then
    qOperations.Delete;

  ActiveControl := grid;
end;

procedure TWayBillForm.bbOkClick(Sender: TObject);
const
  constCheckWayBill = 'SELECT COUNT(*) AS C '
    + ' FROM oil_waybills '
    + 'WHERE auto_id = %d '
    + '  AND auto_inst = %d '
    + '  AND waybill_date = ''%s'' '
    + '  AND waybill_number = ''%s'' '
    + '  AND state = ''Y''';
var
  oper_id: integer;
begin
  if not ShowOnly then
  begin
    if (Grid.DataSource.DataSet.State in [dsEdit, dsInsert]) then
      qOperations.Post;

    
    // Проверки - все ли поля заполнены
    if ceAuto.Text = '' then
    begin
      MessageDlg(TranslateText(' Выберите, пожалуйста, техническое средство!'), mtWarning, [mbOK], 0);
      ActiveControl:= ceAuto;
      Exit;
    end;

    //ActiveControl := grid;
    if eCountLitr.Text = '' then
    begin
      MessageDlg(TranslateText(' Введите, пожалуйста, количество литров!'), mtWarning, [mbOK], 0);
      if eCountLitr.Enabled then
        ActiveControl:= eCountLitr;

      Exit;
    end;

    if eCountLitr.Value < 0 then
    begin
      MessageDlg(TranslateText(' Количество литров должно быть больше нуля!'), mtWarning, [mbOK], 0);

      if eCountLitr.Enabled then
        ActiveControl:= eCountLitr;

      Exit;
    end;

    if eCountLength.Value < 0 then
    begin
      MessageDlg(TranslateText(' Количество километров должно быть больше или равно нулю!'), mtWarning, [mbOK], 0);

      if eCountLength.Enabled then
        ActiveControl:= eCountLength;

      Exit;
    end;

    if eNum.Text = '' then
    begin
      MessageDlg(TranslateText(' Введите, пожалуйста, номер путевого листа (акта на списание)!'), mtWarning, [mbOK], 0);
      ActiveControl:= eNum;
      Exit;
    end;

    if qWayBillWAYBILL_DATE.AsString = '' then
    begin
      MessageDlg(TranslateText(' Введите, пожалуйста, дату путевого листа (акта на списание)!'), mtWarning, [mbOK], 0);
      ActiveControl:= deDate;
      Exit;
    end;

    if (ceEmploy.Text = '') or (SearchEmpId = 0) then
    begin
      MessageDlg(TranslateText(' Выберите, пожалуйста, ФИО водителя (ФИО МОЛ)!'), mtWarning, [mbOK], 0);
      ActiveControl:= ceEmploy;
      Exit;
    end;

    if ceNPGroup.Text = '' then
    begin
      MessageDlg(TranslateText(' Выберите, пожалуйста, нефтепродукт!'), mtWarning, [mbOK], 0);
      ActiveControl:= ceNPGroup;
      Exit;
    end;

    //  Проверяем, есть ли для данной автомашины, путевой лист с таким же номером за
    // этот день
    if not fEditMode then
    begin
      qTemp.Close;
      qTemp.SQL.Clear;
      qTemp.SQL.Text:= Format(constCheckWayBill, [SearchAutoId, SearchAutoInst, qWayBillWAYBILL_DATE.AsString, eNum.Text]);
      qTemp.Open;

      if qTemp.FieldByName('C').AsInteger <> 0 then
      begin
        MessageDlg(TranslateText(' Существует путевой лист для данного автомобиля ')+#13#10 +
                   TranslateText('с таким же номером и за ту же дату!'), mtWarning, [mbOK], 0);
        ActiveControl:= eNum;
        Exit;
      end;
    end;

    try
      qWayBillEMPLOY_ID.AsInteger := SearchEmpId;
      qWayBillEMPLOY_INST.AsInteger := SearchEmpInst;
      qWayBillAUTO_ID.AsInteger := SearchAutoId;
      qWayBillAUTO_INST.AsInteger := SearchAutoInst;
      qWayBillNP_TYPE.AsInteger := SearchNPType;

      // Если выбрана группа ТС, отличная от "Грузовой и спец. транспорт" - то
      // формируем запись в таблице OIL_AUTO_OPER
      if AutoGroup in [1, 3, 4] then
      begin

        // Открываем деталировку
        qOperations.Close;
        qOperations.ParamByName('id').AsInteger:= qWayBillID.AsInteger;
        qOperations.ParamByName('inst').AsInteger:= qWayBillINST.AsInteger;
        qOperations.Open;

        if qOperationsID.IsNull then
          oper_id:= GetSeqNextVal('s_oil_auto_oper')
        else
          oper_id:= qOperationsID.AsInteger;

        qOperations.Edit;
        qOperationsID.AsInteger:= oper_id;
        qOperationsINST.AsInteger:= INST;
        qOperationsSTATE.AsString:= 'Y';
        qOperationsWAYBILL_ID.AsInteger:= qWayBillID.AsInteger;
        qOperationsWAYBILL_INST.AsInteger:= qWayBillINST.AsInteger;
        qOperationsLITRES.AsFloat:= eCountLitr.Value;
        qOperationsKILOMETERS.AsFloat:= eCountLength.Value;

        case AutoGroup of
          1: qOperationsAUTO_OPER_ID.AsInteger:= 1;
          3: qOperationsAUTO_OPER_ID.AsInteger:= 6;
          4: qOperationsAUTO_OPER_ID.AsInteger:= 7;
        end;

        qOperations.Post;

        qTemp.Close;
      end;

      _ExecSql('update OIL_AUTO_CARD set STATE = ''N'' where WAYBILLS_ID = :WAYBILLS_ID and WAYBILLS_INST = :WAYBILLS_INST',
       ['WAYBILLS_ID', qWayBillID.AsInteger,
        'WAYBILLS_INST', qWayBillINST.AsInteger]);

      vtPrih.First;
      While not vtPrih.Eof do
      begin
        DBSaver.SaveRecord('OIL_AUTO_CARD',
        ['ID', GetNextId('OIL_AUTO_CARD', ['WAYBILLS_ID', qWayBillID.AsInteger, 'WAYBILLS_INST', qWayBillINST.AsInteger]),
         'INST', INST,
         'STATE', 'Y',
         'EMPLOY_ID', SearchEmpId,
         'EMPLOY_INST', SearchEmpInst,
         'AUTO_ID', SearchAutoId,
         'AUTO_INST',SearchAutoInst,
         'INCOME_DATE', deDate.Date,
         'DOC_NUMBER', vtPrih.FieldByName('DOC_NUMBER').AsString,
         'NP_TYPE', SearchNPType,
         'LITRES', vtPrih.FieldByName('LITR').AsCurrency,
         'DOC_KIND', 2,
         'WAYBILLS_ID', qWayBillID.AsInteger,
         'WAYBILLS_INST', qWayBillINST.AsInteger]);
        vtPrih.Next;
      end;

      qWayBill.ApplyUpdates;

    finally
      qOperations.Close;
      qWayBill.Close;
    end;
  end;
  ModalResult:= mrOK;
end;

procedure TWayBillForm.bbCancelClick(Sender: TObject);
begin
  qOperations.Close;
  qWayBill.Close;
end;

procedure TWayBillForm.deDateChange(Sender: TObject);
begin
  if not Self.Visible and ((Sender as TDBDateEdit).Date <= StrToDate(Close_Date)) then
    (Sender as TDBDateEdit).Enabled := False
  else
    (Sender as TDBDateEdit).Enabled := True;  
  bbOk.Enabled := (deDate.Date > StrToDate(CLOSE_DATE));
  RecalcRest;
end;

procedure TWayBillForm.vtOperationsAfterDelete(DataSet: TDataSet);
begin
  inherited;
  qOperations.Delete;
end;

procedure TWayBillForm.qOperationsBeforePost(DataSet: TDataSet);
begin
  inherited;

  if not eCountLitr.Enabled and (qOperationsAUTO_OPER_NAME.AsString = '') then
    raise Exception.Create('Необходимо выбрать группу затрат!');
end;

procedure TWayBillForm.qOperationsNewRecord(DataSet: TDataSet);
begin
  inherited;
  qOperationsINST.AsInteger := INST;
  qOperationsSTATE.AsString := 'Y';
  qOperationsWAYBILL_ID.AsInteger := qWayBillID.AsInteger;
  qOperationsWAYBILL_INST.AsInteger := qWayBillINST.AsInteger;
  if FLastAutoOperId <> 0 then
  begin
    qOperationsAUTO_OPER_ID.AsInteger := FLastAutoOperId;
    qOperationsAUTO_OPER_NAME.AsString := FLastAutoOperName;
  end;
end;

procedure TWayBillForm.GridKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ((Grid.SelectedField.FieldName = 'LITRES') or (Grid.SelectedField.FieldName = 'KILOMETERS')) and
     (Key in ['.',','])
  then
    Key := DECIMALSEPARATOR;

  if Key = #13 then
  begin
    if Grid.Columns.Count -1 = Grid.FieldColumns[Grid.SelectedField.FieldName].Index then
    begin
      if (Grid.DataSource.DataSet.State in [dsEdit, dsInsert]) then
        Grid.DataSource.DataSet.Post;
      Grid.DataSource.DataSet.Append;
      Grid.SelectedField := Grid.Columns[1].Field;
    end
    else
      Grid.SelectedField := Grid.Columns[Grid.FieldColumns[Grid.SelectedField.FieldName].Index+1].Field;
  end;
end;

procedure TWayBillForm.GridExit(Sender: TObject);
begin
  inherited;
  if (TDBGridEh(Sender).DataSource.DataSet.State in [dsEdit, dsInsert]) then
    TDBGridEh(Sender).DataSource.DataSet.Post;
end;

procedure TWayBillForm.RecalcRest;
begin
  if not((SearchEmpId+SearchEmpInst <= 0) or (SearchAutoId+SearchAutoInst <= 0)) then
  begin
    qRest.Close;
    _OpenQueryPar(qRest,
     ['EmployId',   SearchEmpId,
      'EmployInst', SearchEmpInst,
      'AutoId',     SearchAutoId,
      'AutoInst',   SearchAutoInst,
      'EndDate',    deDate.Date,
      'Id',         qWayBillID.AsInteger,
      'Inst',       qWayBillINST.AsInteger]);
    lAutoRest.Caption := FloatToStr(qRest.FieldByName('RestLitres').AsCurrency - eCountLitr.Value
      +GridPrih.SumList.SumCollection[0].SumValue);
  end
  else
    lAutoRest.Caption := '0';
end;

procedure TWayBillForm.ceAutoChange(Sender: TObject);
begin
  inherited;
  RecalcRest;
end;

procedure TWayBillForm.ceEmployChange(Sender: TObject);
begin
  inherited;
  RecalcRest;
end;

procedure TWayBillForm.AddWayBillByWayBill(WayBillID,
  WayBillINST: integer);
const GetAutoInf = 'SELECT auto.numb, autotype.auto_group ' +
                   'FROM oil_auto auto, oil_auto_type autotype ' +
                   'WHERE auto.auto_type_id = autotype.id ' +
                   'AND auto.id = %d ' +
                   'AND auto.inst = %d';
begin
  // Открываем запрос по путевому листу
  with qWayBill do
  begin
    Close;
    ParamByName('id').AsInteger := WayBillID;
    ParamByName('inst').AsInteger := WayBillINST;
    Open;
    Edit;
  end;
  // Получаем данные для их визуализации
  // Данные по водителю
  SearchEmpId := qWayBillEMPLOY_ID.AsInteger;
  SearchEmpInst := qWayBillEMPLOY_INST.AsInteger;
  ceEmploy.Text:= GetSqlValueParSimple(GetEmployName,
   ['id',   SearchEmpId,
    'inst', SearchEmpInst]);

  // Данные по техническому средству
  SearchAutoId:= qWayBillAUTO_ID.AsInteger;
  SearchAutoInst:= qWayBillAUTO_INST.AsInteger;
  with qTemp do
  begin
    Close;
    SQL.Text:= Format(GetAutoInf, [SearchAutoId, SearchAutoInst]);
    Open;
    ceAuto.Text:= Fields[0].AsString;
    AutoGroup:= Fields[1].AsInteger;
  end;

  // Данные по типу нефтепродукта
  SearchNPType := qWayBillNP_TYPE.AsInteger;
  ceNPGroup.Text := GetNpName(SearchNPType);

  AddWayBill;

  qOperations.Close;
  qOperations.ParamByName('id').AsInteger := qWayBillID.AsInteger;
  qOperations.ParamByName('inst').AsInteger := qWayBillINST.AsInteger;
  qOperations.Open;

  if not vtPrih.Active then
    vtPrih.Open;
  
  SetColors;
  
end;

procedure TWayBillForm.SetColors;
begin
  // Проверяем группу
  if AutoGroup = 2 then
  begin // Это группа "Грузовой и специальный транспорт"
    gbDetailNew.Enabled := true;
    //gbPrih.Enabled := true;
    eCountLitr.Enabled := false;
    eCountLength.Enabled := false;
    lblCountLitr.Enabled := false;
    lblCountLength.Enabled := false;

    gbDetailNew.Font.Color := clWindowText;
    grid.TitleFont.Color := clWindowText;
    grid.Font.Color := clWindowText;
    grid.FooterFont.Color := clWindowText;

    //gbPrih.Font.Color := clWindowText;
    //GridPrih.TitleFont.Color := clWindowText;
    //GridPrih.Font.Color := clWindowText;
    //GridPrih.FooterFont.Color := clWindowText;

    lblAttention.Font.Color:= clRed;
  end
  else
  begin // Это остальные группы
    gbDetailNew.Enabled := false;
    //gbPrih.Enabled := false;
    eCountLitr.Enabled := true;
    eCountLength.Enabled := true;
    lblCountLitr.Enabled := true;
    lblCountLength.Enabled := true;

    gbDetailNew.Font.Color := clGray;
    grid.TitleFont.Color := clGray;
    grid.Font.Color := clGray;
    grid.FooterFont.Color := clGray;

    //gbPrih.Font.Color := clGray;
    //GridPrih.TitleFont.Color := clGray;
    //GridPrih.Font.Color := clGray;
    //GridPrih.FooterFont.Color := clGray;
      
    lblAttention.Font.Color := clWindowText;
  end;
end;

procedure TWayBillForm.FormCreate(Sender: TObject);
begin
  inherited;
  sbClearAuto.Click;
  sbClearEmploy.Click;
  sbClearNPGroup.Click;
end;

procedure TWayBillForm.eCountLitrChange(Sender: TObject);
begin
  inherited;
  RecalcRest;
end;

procedure TWayBillForm.ClearOperations;
begin
  if qOperations.Active then
  begin
    while not qOperations.IsEmpty do
      qOperations.Delete;

    qOperations.Close;
  end
  else
  begin
   qOperations.ParamByName('id').AsInteger:= qWayBillID.AsInteger;
   qOperations.ParamByName('inst').AsInteger:= qWayBillINST.AsInteger;
   qOperations.Open;

   while not qOperations.IsEmpty do
     qOperations.Delete;

   qOperations.Close;
  end;
  
  while not vtPrih.IsEmpty do
    vtPrih.Delete;
end;

procedure TWayBillForm.acDeletePrihExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg(TranslateText(' Вы действительно хотите удалить эту запись?'),
               mtWarning, [mbYes, mbNo], 0) = mrYes then
    vtPrih.Delete;

  ActiveControl := GridPrih;
end;

procedure TWayBillForm.vtPrihAfterPost(DataSet: TDataSet);
begin
  inherited;
  RecalcRest;
end;

procedure TWayBillForm.GridPrihKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ((TDBGridEh(Sender).SelectedField.FieldName = 'LITR')) and
     (Key in ['.',','])
  then
    Key := DECIMALSEPARATOR;
end;

procedure TWayBillForm.GridPrihSumListAfterRecalcAll(Sender: TObject);
begin
  inherited;
  RecalcRest;
end;

procedure TWayBillForm.GridSumListAfterRecalcAll(Sender: TObject);
begin
  inherited;
//
end;

end.
