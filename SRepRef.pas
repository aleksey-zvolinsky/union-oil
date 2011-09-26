unit SRepRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, ExtCtrls, StdCtrls, Mask, ToolEdit, Db, DBTables, Grids, DBGrids,
  Buttons, Menus, RXCtrls, ComObj, ActiveX, Excel8TLB, RxLookup, RXDBCtrl, DBCtrls,
  ComCtrls, ActnList, Ora,uOilQuery,uOilStoredProc, DBAccess, MemDS, DBGridEh
  {$IFDEF VER150}, Variants, GridsEh, DBGridEhGrouping{$ENDIF};

type
  TSRepRefForm = class(TBaseForm)
    deDate: TDateEdit;
    Label1: TLabel;
    ceAZS: TComboEdit;
    Label2: TLabel;
    ceEmp: TComboEdit;
    Label3: TLabel;
    sbAzs: TSpeedButton;
    sbEmp: TSpeedButton;
    sp1: TOilStoredProc;
    RQ1: TOilQuery;
    RQ2: TOilQuery;
    RQ3: TOilQuery;
    RQ4: TOilQuery;
    RQ5: TOilQuery;
    lSubOrg: TLabel;
    sbOrg: TSpeedButton;
    qVed: TOilQuery;
    qDecTal: TOilQuery;
    qDecTalSum: TOilQuery;
    ceOrg: TComboEdit;
    sbDate: TSpeedButton;
    u: TOraUpdateSQL;
    qWork: TOilQuery;
    qID: TFloatField;
    qINST: TFloatField;
    qREP_DATE: TDateTimeField;
    qAZS_ID: TFloatField;
    qAZS_INST: TFloatField;
    qREP_NUM: TFloatField;
    qSMENA_NUM: TFloatField;
    qEMP_ID: TFloatField;
    qEMP_INST: TFloatField;
    qAZS_NAME: TStringField;
    qFILIAL_NAME: TStringField;
    qEMP_NAME: TStringField;
    qFILIAL_NAL_NUM: TStringField;
    qFILIAL_SVID_NUM: TStringField;
    qSCRashNakl: TOilQuery;
    qVedSum: TOilQuery;
    N6: TMenuItem;
    TTalon: TTable;
    qLOAD_PRIH_TALON: TStringField;
    N1: TMenuItem;
    miSrepAdd: TMenuItem;
    N3: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    N444: TMenuItem;
    miEditAllSR: TMenuItem;
    qRest: TOilQuery;
    pmAdd: TPopupMenu;
    miAutoLoad: TMenuItem;
    miAdd: TMenuItem;
    rsbAdd: TRxSpeedButton;
    qAUTO_LOAD: TStringField;
    miAutoloadLog: TMenuItem;
    qREP_DATE_END_REAL: TDateTimeField;
    qRES_COMMENT: TStringField;
    qINPUT_METHOD: TStringField;
    actAutoloadLog: TAction;
    N4: TMenuItem;
    actEscSR: TAction;
    miShifts: TMenuItem;
    qDel: TOilQuery;
    qRESAVE: TStringField;
    qREP_DATE_END: TDateTimeField;
    qOPS_VERSION: TStringField;
    qFast: TOilQuery;
    qDATE_MOD: TDateTimeField;
    qOS_USER: TStringField;
    qMACHINE: TStringField;
    qUSER_ID: TFloatField;
    qUSER_NAME: TStringField;
    qSlow: TOilQuery;
    N11: TMenuItem;
    procedure sbAddClick(Sender: TObject);
    procedure ceAZSButtonClick(Sender: TObject);
    procedure sbAzsClick(Sender: TObject);
    procedure ceEmpButtonClick(Sender: TObject);
    procedure sbEmpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure sbOrgClick(Sender: TObject);
    procedure ceOrgButtonClick(Sender: TObject);
    procedure sbDateClick(Sender: TObject);
    procedure qAfterPost(DataSet: TDataSet);
    procedure qREP_DATEValidate(Sender: TField);
    procedure N5Click(Sender: TObject);
    procedure miSrepAddClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure miEditAllSRClick(Sender: TObject);
    procedure miAutoLoadClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure actAutoloadLogExecute(Sender: TObject);
    procedure actEscSRExecute(Sender: TObject);
    procedure ceEmpKeyPress(Sender: TObject; var Key: Char);
    procedure sbEditClick(Sender: TObject); override;
    procedure miShiftsClick(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure N11Click(Sender: TObject);
  private
    BM: TBookmark;
    bEscSR: boolean;
    SearchAZSId, SearchOrgId: Integer;
    SearchEmpId, SearchEmpInst: Integer;
  public
    procedure SaveAzsReceive;
  end;

  TOutCol = ^POutCol;
  POutCol = record
             id: integer;
             Name: string;
             Kol: string;
             Money: string
           end;

function IsAVERAGE(d: TDateTime): boolean;           

implementation

{$R *.DFM}

uses SRep, ChooseOrg, EmpRef, OilSTD, Main, Progr, PartRef, MoneyFunc, ExFunc,
  RulezReport, UDbFunc, PacketClass, SRTalon, SRepAutoLoad, memo, RezervImage,
  Math;

//==============================================================================
procedure TSRepRefForm.sbAddClick(Sender: TObject);
var
  F: TSRepForm;
begin
  StartSQL;
  try
    // Вставка новой строки
    q.Insert;
    q.FieldByName('Id').AsInteger := GetSeqNextVal('S_DAILY_REP');
    q.FieldByName('Inst').AsInteger := Inst;
    q.Post;
    // открытие формы сменного отчета
    F := TSRepForm.Create(nil);
    try
      F.mode := 1;
      F.pLoadFromFile.Visible := True;
      F.ShowModal;
      if F.ModalResult = mrOk then
      begin
        if q.State <> dsBrowse then q.Post;
        SaveAzsReceive;
        CommitSQL;
      end
      else RollbackSQL;
    finally
      F.Free;
    end;
  except on E:Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOk], 0);
      RollbackSQL;
    end;
  end;
  bbSearchClick(Nil);  
end;
//==============================================================================
procedure TSrepRefForm.SaveAzsReceive;
var
  Indx: Integer;
  Descr, FileName, sMes: String;
  SL: TStringList;
begin
  if not Assigned(SmRep) then Exit;
  with SMrep do
    if IsPacketLoaded then
    begin
      SL := TStringList.Create;
      FileName := OpenFileSRep(odPacket.FileName, SL);

      Descr := '';
      if SL.Count > 5 then
        for Indx := 1 to 5 do
          Descr := Descr + SL[Indx]+';';

      try
        DBSaver.SaveRecord('OIL_AZS_RECEIVE',
          ['INST',      MAIN_ORG.INST,
           'STATE',     'Y',
           'DREP_ID',   qId.AsVariant,
           'DREP_INST', qInst.AsVariant,
           'FILE_NAME', Copy(ExtractFileName(FileName),1,25),
           'FILE_DESCRIPTION', Copy(Descr,1,255)]);
      except on E: Exception do
        begin
          sMes := 'OIL_AZS_RECEIVE: '+ E.Message;
          if DR_AUTOLOAD then SRepAutoLoad.SRepAutoLoadLog(sMes)
          else MessageDlg(sMes, mtError, [mbOk], 0);
        end;
      end;
      SL.Free;
    end; //IsPacketLoaded
end;
//==============================================================================
procedure TSRepRefForm.sbEditClick(Sender: TObject);
var
  OnlyShow: Boolean;
begin
  inherited;
  OnlyShow := False;
  if q.IsEmpty or (not sbEdit.Visible) then exit;
  StartSQL;
  try
    // Поверки на: где был создан сменный отчет, дату закрытия и не редактируется ли он в этот момент
    if (Inst <> q.FieldByName('Inst').AsInteger) or(StrToDate(Close_Date) >= q.FieldByName('rep_date').AsDateTime) then
      OnlyShow := True
    else
    begin
      qWork.Close;
      qWork.SQL.Text := 'select * from Oil_Daily_Rep ' +
        ' where Id = ' + q.FieldByName('Id').AsString +
        '   and Inst = ' + q.FieldByName('Inst').AsString + ' for update nowait';
      qWork.Open;
      q.Edit;
      q.Post;
    end;

    if q.FieldByName('SMENA_NUM').AsInteger = -1 then
    begin
      MessageDlg(TranslateText('Это сменный отчет с дополнительными данными с АЗС.'), mtWarning, [mbOk], 0);
      exit;
    end;

    // Открытие формы редактирования
    Application.CreateForm(TSRepForm, SMRep);
    try
      SMRep.Position := poScreenCenter;
      SMrep.mode := 2;
      if OnlyShow then
        SMrep.bbOk.Enabled := False;
      SMrep.dbceAZSName.Enabled := False;
      SMrep.dbeRepNum.Enabled := False;
      SMrep.dbdeRepDate.Enabled := False;
      SMRep.ShowModal;
      
      if SMRep.ModalResult = mrOk then
      begin
        if q.State <> dsBrowse then q.Post;
        CommitSQL;
      end
      else RollbackSQL;
    finally
      SMRep.Free;
    end;
  except on E: Exception do
    Begin
      if Pos('ORA-00054:', E.Message) <> 0 then
        MessageDlg(TranslateText('Этот сменный отчет редактируется другим пользователем !'), mtError, [mbOk], 0)
      else MessageDlg(E.Message, mtError, [mbOk], 0);
      RollbackSQL;
    end;
  end;
  bbSearchClick(Nil);
end;
//==============================================================================
procedure TSRepRefForm.ceAZSButtonClick(Sender: TObject);
var
  vId, vInst: Integer;
  vName: String;
begin
  if ChooseOrg.CaptureOrg(2, SearchOrgId, SearchOrgId, 'yyy', vId, vInst, vName) then
  begin
    SearchAZSId := vId;
    ceAZS.Text := vName;
  end;
end;
//==============================================================================
procedure TSRepRefForm.sbAzsClick(Sender: TObject);
begin
  ceAZS.Text := '';
  SearchAZSId := 0;
end;
//==============================================================================
procedure TSRepRefForm.ceEmpButtonClick(Sender: TObject);
Var
  Emp: TEmpRefForm;
begin
  Application.CreateForm(TEmpRefForm, Emp);
  Emp.ShowModal;
  if Emp.ModalResult = mrOk then
  begin
    if not(Emp.q.eof) then
    begin
      SearchEmpId := Emp.q.fieldbyname('id').value;
      SearchEmpInst := Emp.q.fieldbyname('inst').value;
      ceEmp.Text := Emp.q.fieldbyname('F_name').AsString + ' ' + Emp.q.fieldbyname('I_name').AsString + ' ' + emp.q.fieldbyname('O_name').AsString;
    end;
  end;
  Emp.free;
end;
//==============================================================================
procedure TSRepRefForm.sbEmpClick(Sender: TObject);
begin
  ceEmp.Text := '';
  SearchEmpId := 0;
  SearchEmpInst := 0;
end;
//==============================================================================
procedure TSRepRefForm.FormCreate(Sender: TObject);
begin
  inherited;
  miSrepAdd.Visible := FileExists(ExtractFilePath(Application.ExeName)+'\'+'Reports\АЗС - приложение к сменному отчету.rrr'); // *NO_TRANSLATE*

  if MAIN_ID <> 666 then
  begin
    SearchOrgId := MAIN_ID;
    ceOrg.Text := GetOrgName(MAIN_ID, MAIN_ID);
  end;  
end;
//==============================================================================
procedure TSRepRefForm.bbClearClick(Sender: TObject);
begin
  deDate.Date := 0;
  sbEmpClick(nil);
  sbOrgClick(nil);
  sbAzsClick(nil);
end;
//==============================================================================
procedure TSRepRefForm.bbSearchClick(Sender: TObject);
var
  CurId, CurInst: Integer;
begin
  q.DisableControls;

  CurId := q.FieldByName('Id').AsInteger;
  CurInst := q.FieldByName('Inst').AsInteger;
  q.Close;

  // підставляємо необхідний запит
  if sbSpeedUp.Down then
    q.SQL.Text := qFast.SQL.Text
  else
    q.SQL.Text := qSlow.SQL.Text;
  DBGrid1.FieldColumns['REP_DATE_END_REAL'].Visible := not sbSpeedUp.Down;
  DBGrid1.FieldColumns['EMP_NAME'].Visible          := not sbSpeedUp.Down;
  DBGrid1.FieldColumns['OPS_VERSION'].Visible       := not sbSpeedUp.Down;
  DBGrid1.FieldColumns['USER_NAME'].Visible         := not sbSpeedUp.Down;

  if deDate.Date = 0 then q.ParamByName('p_date').Clear
  else q.ParamByName('p_date').AsDateTime := deDate.Date;
  q.ParamByName('p_azs_id').AsInteger := SearchAZSId;
  q.ParamByName('p_par_id').AsInteger := SearchOrgId;
  q.ParamByName('p_emp_id').AsInteger := SearchEmpId;
  q.ParamByName('p_emp_inst').AsInteger := SearchEmpInst;

  _OpenQuery(q);
  while not (q.Eof or ((CurId = q.FieldByName('Id').AsInteger) and
    (CurInst = q.FieldByName('Inst').AsInteger)) or ((CurId = 0) and (CurInst = 0))) do
    q.Next;
  if q.Eof and ((CurId <> q.FieldByName('Id').AsInteger) or (CurInst <> q.FieldByName('Inst').AsInteger)) then
    q.First;

  q.EnableControls;
end;
//==============================================================================
procedure TSRepRefForm.sbDelClick(Sender: TObject);
  //****************************************************************************
  procedure Upd(sTable: string; sWhere: string='');
  begin
    if sWhere = '' then
      sWhere := ' WHERE REP_ID = :ID AND REP_INST = :INST AND STATE = ''Y'''
    else sWhere := ' WHERE '+ sWhere;

    _ExecSql('UPDATE '+ sTable +' SET STATE = ''N'''+ sWhere +' AND STATE = ''Y'' AND INST = :ORG_INST',
      ['ID',       q.FieldByName('id').Value,
       'INST',     q.FieldByName('inst').Value,
       'ORG_INST', INST]);
  end;
  //****************************************************************************
begin
  if q.IsEmpty then exit;
  // Поверки на: где был создан сменный отчет, дату закрытия и не редактируется ли он в этот момент
  if Inst <> q.FieldByName('Inst').AsInteger then
    raise Exception.Create(TranslateText('Нельзя удалить запись созданную другой организацией !'));
  if StrToDate(Close_Date) >= q.FieldByName('rep_date').AsDateTime then
    raise Exception.Create(TranslateText('Данный период закрыт !'));
  If MessageDlg(TranslateText('Вы уверены что хотите удалить сменный отчет ?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  begin
    StartSQL;
    try
      // перевірка на існування талонів
      qWork.Close;
      qWork.SQL.Text := 'select Id, Inst from V_Oil_Talon_Op where Tip = ''P''' +
        ' and SRep_Id = ' + q.FieldByName('Id').AsString +
        ' and SRep_Inst = ' + q.FieldByName('Inst').AsString;
      qWork.Open;
      if not qWork.IsEmpty then
        raise Exception.Create(TranslateText('В данном сменном отчете имеютя талоны, удалите сначала их. ' +#13#10+
          'На удаление каждого талона выполняется отдельная проверка'));
      // перевірка на існування приходів
      if GetSqlValue('select count(*) from Oil_DR_Data where rep_id = '+ q.FieldByName('Id').AsString +
        ' and rep_inst = '+ q.FieldByName('Inst').AsString +' and state = ''Y'' and oper_type = 0') > 0 then
        raise Exception.Create(TranslateText('В данном сменном отчете имеютя приходы, удалите сначала их. ' +#13#10+
          'На удаление каждого прихода выполняется отдельная проверка'));

      // видаляємо змінний звіт
      Upd('OIL_DAILY_REP', 'ID = :ID AND INST = :INST AND STATE = ''Y''');
      Upd('OIL_VEDOMOST',
          '(SREP_ID, SREP_INST) in (select distinct id, inst from OIL_DR_DATA WHERE REP_ID = :ID AND REP_INST = :INST) AND STATE = ''Y''');
      Upd('OIL_SRTALON',
          '(SREP_ID, SREP_INST) in (select distinct id, inst from OIL_DR_DATA WHERE REP_ID = :ID AND REP_INST = :INST) AND STATE = ''Y''');
      Upd('OIL_SROTHER',
          '(SREP_ID, SREP_INST) in (select distinct id, inst from OIL_DR_DATA WHERE REP_ID = :ID AND REP_INST = :INST) AND STATE = ''Y''');

      // якщо талони прив'язані, то видаляти їх не можна, лише відв'язати
      if q.FieldByName('LOAD_PRIH_TALON').AsString <> 'Y' then
      begin
        Upd('OIL_TALON_PRIH', 'SREP_ID = :ID AND SREP_INST = :INST AND STATE = ''Y''');
        Upd('OIL_TALON_DATA',
            '(Head_Id, Head_Inst) in (select distinct id, inst from OIL_TALON_PRIH WHERE SREP_ID = :ID AND SREP_INST = :INST) AND STATE = ''Y''');
      end
      else
        _ExecSql(
          'UPDATE OIL_TALON_PRIH SET SREP_ID = null, SREP_INST = null' +
          ' WHERE SREP_ID = :ID AND SREP_INST = :INST AND STATE = ''Y''',
          ['ID',   q.FieldByName('id').Value,
           'INST', q.FieldByName('inst').Value]);

      // видаляємо дані змінного звіту із табличок
      qDel.Close;
      qDel.ParamByName('Rep_Id').AsInteger   := q.FieldByName('Id').AsInteger;
      qDel.ParamByName('Rep_Inst').AsInteger := q.FieldByName('Inst').AsInteger;
      qDel.ExecSQL;
      CommitSQL;
    except On E:Exception Do
      begin
        RollBackSQL;
        MessageDlg(E.Message, mtError, [mbOk], 0);
      end;
    end;
  end;
  BM := q.GetBookmark;
  q.Close;
  q.Open;             
  if q.BookmarkValid(BM) then
    q.GotoBookmark(BM);
  q.FreeBookMark(BM);
end;
//==============================================================================
function IsAVERAGE(d: TDateTime): boolean;
begin
  result := (DR_DENSITY_CALC = 'AVERAGE') and (trunc(d) >= DR_AVERAGE_DATE);
end;
//==============================================================================
procedure TSRepRefForm.N1Click(Sender: TObject);
var
  sums, s, tov, path, path2, str, StartChar, EndChar, Ost, OstE: String;
  oldgp, oldgp1, k, oldk, gp, gp1, gp2, cw, i, pos, GroupC, PartC, SPCount, j, sc, ExcelColumn, ec2: Integer;
  Progr: TProgrForm;
  OutColL: TList;
  CurCol: TOutCol;
  rash, prih: boolean;
  SpSSum, GSSum, RSSum, SPSum, GSum, RSum: TStrings;
  TalonC, cpos: char;
  function GetSumStr(AColumn: string; AStrings: TStrings; AddRow: integer = 0): string;
  var
    s: string;
    i: integer;
  begin
    s := '=';
    Result := '';
    for i := 0 to AStrings.Count - 1 do
    begin
      Result := Result + s + AColumn + IntToStr(StrToInt(AStrings[i])+AddRow);
      s := '+';
    end;
  end;
begin
  gp1 := 0;
  gp2 := 0;

  if q.IsEmpty then exit;
  Application.CreateForm(TProgrForm, progr);
  Progr.Progress:=0;
  Progr.Show;
  Progr.Repaint;
  try
    // Запуск экземпляра Excel
    ActivateXLApp('SMRep', 'SMRep', 1, MSExcel, List);
    List := MSExcel.ActiveWorkbook.ActiveSheet;
    Progr.Progress:=5;
    // Ввод значений шапки отчета
    List.Cells[3, 'A'].Value := MainForm.qOrg.FieldbyName('Name').AsString +' '+ DateTimeToStr(GetSystemDate);
    List.Cells[3, 'Q'].Value := q.FieldByName('Rep_Num').AsInteger;
    List.Cells[4, 'K'].Value := q.FieldByName('AZS_Name').AsString;
    List.Cells[5, 'H'].Value := q.FieldByName('Emp_Name').AsString;
    List.Cells[5, 'M'].Value := q.FieldByName('Smena_Num').AsInteger;
    List.Cells[7, 'I'].Value := q.FieldByName('Rep_Date').AsDateTime;
    progr.Progress := 8;
    StartChar := ExcelStr(12);
    EndChar := ExcelStr(12);
    OutColL := TList.Create;
    ExcelColumn := 12;
    sc := 12;

    // Создание колонки для реализации по ведомости
    rq1.Close;
    rq1.SQL.Text := 'select count(id) as ved from Oil_DR_Data ' +
      '  where oper_type = 1 ' +
      '    and out_ved_litr <> 0 ' +
      '    and rep_id = ' + q.FieldByName('id').AsString +
      '    and rep_inst = ' + q.FieldByName('inst').AsString;
    rq1.Open;
    if rq1.FieldByName('ved').AsFloat <> 0 then
    begin
      new(CurCol);
      CurCol.Name := 'ved';
      CurCol.Kol := EndChar;
      inc(ExcelColumn);
      EndChar := ExcelStr(ExcelColumn);
      CurCol.Money := EndChar;
      inc(ExcelColumn);
      EndChar := ExcelStr(ExcelColumn);
      OutColL.Add(CurCol);
      List.Cells[11, CurCol.Kol].value := LangText('BezNal');
      List.Cells[12, CurCol.Kol].value := LangText('Count');
      List.Cells[12, CurCol.Money].value := LangText('Sum');
      List.Range[List.Cells[11, CurCol.Kol], List.Cells[12, CurCol.Money]].HorizontalAlignment := xlCenter;
      List.Range[List.Cells[11, CurCol.Kol], List.Cells[12, CurCol.Money]].VerticalAlignment := xlCenter;
      List.Range[CurCol.Kol + '11:' + CurCol.Money + '11'].Merge;
    end;
    progr.Progress := 9;


    // Создание колонки для реализации за наличные
    rq1.Close;
    rq1.SQL.Text := 'select count(id) as nal from Oil_DR_Data ' +
      ' where oper_type = 1 ' +
      ' and out_nal_litr <> 0 ' +
      ' and rep_id = ' + q.fieldbyname('id').AsString +
      ' and rep_inst = ' + q.fieldbyname('inst').AsString;
    rq1.Open;
    if rq1.FieldByName('nal').AsFloat<>0 then
    begin
      new(CurCol);
      CurCol.Name := 'nal';
      CurCol.Kol := EndChar;
      inc(ExcelColumn);
      EndChar := ExcelStr(ExcelColumn);
      CurCol.Money := EndChar;
      inc(ExcelColumn);
      EndChar:=ExcelStr(ExcelColumn);
      OutColL.Add(CurCol);
      List.Cells[11,CurCol.Kol].value := LangText('Nal');
      List.Cells[12,CurCol.Kol].value := LangText('Count');
      List.Cells[12,CurCol.Money].value := LangText('Sum');
      List.Range[List.Cells[11, CurCol.Kol], List.Cells[12, CurCol.Money]].HorizontalAlignment := xlCenter;
      List.Range[List.Cells[11, CurCol.Kol], List.Cells[12, CurCol.Money]].VerticalAlignment := xlCenter;
      List.Range[CurCol.Kol + '11:' + CurCol.Money + '11'].Merge;
    end;
    progr.Progress:=10;

    // Создание колонки для реализации по талонам
    rq1.Close;
    rq1.SQL.Text := 'select count(id) as talon from Oil_DR_Data ' +
      ' where oper_type = 1 ' +
      ' and out_talon_litr <> 0 ' +
      ' and rep_id = ' + q.fieldbyname('id').AsString +
      ' and rep_inst = ' + q.fieldbyname('inst').AsString;
    rq1.Open;
    if rq1.FieldByName('talon').AsFloat <> 0 then
    begin
      new(CurCol);
      CurCol.Name:='talon';
      CurCol.Kol:=EndChar;
      inc(ExcelColumn);
      EndChar:=ExcelStr(ExcelColumn);
      CurCol.Money:=EndChar;
      inc(ExcelColumn);
      EndChar:=ExcelStr(ExcelColumn);
      OutColL.Add(CurCol);
      List.Cells[11, CurCol.Kol].value := TranslateText('По талонам');
      List.Cells[12, CurCol.Kol].value:=LangText('Count');
      List.Cells[12, CurCol.Money].value:=LangText('Sum');
      List.Range[List.Cells[11, CurCol.Kol], List.Cells[12, CurCol.Money]].HorizontalAlignment := xlCenter;
      List.Range[List.Cells[11, CurCol.Kol], List.Cells[12, CurCol.Money]].VerticalAlignment := xlCenter;
      List.Range[CurCol.Kol + '11:' + CurCol.Money + '11'].Merge;
    end;
    Progr.Progress := 11;

    // Создание колонки для реализации на собственные нужды
    rq1.close;
    rq1.sql.text := 'select count(id) as sn from Oil_DR_Data ' +
      ' where oper_type = 1 ' +
      ' and out_sn_litr <> 0 ' +
      ' and rep_id = ' + q.fieldbyname('id').AsString +
      ' and rep_inst = ' + q.fieldbyname('inst').AsString;
    rq1.open;

    if rq1.FieldByName('sn').AsFloat <> 0 then
    begin
      new(CurCol);
      CurCol.Name:='sn';
      CurCol.Kol:=EndChar;
      inc(ExcelColumn);
      EndChar:=ExcelStr(ExcelColumn);
      CurCol.Money:=EndChar;
      inc(ExcelColumn);
      EndChar:=ExcelStr(ExcelColumn);
      OutColL.Add(CurCol);
      List.Cells[11,CurCol.Kol].value:=LangText('Sobstv_nujd');
      List.Cells[12,CurCol.Kol].value:=LangText('Count');
      List.Cells[12,CurCol.Money].value:=LangText('Sum');
      List.Range[List.Cells[11, CurCol.Kol], List.Cells[12, CurCol.Money]].HorizontalAlignment := xlCenter;
      List.Range[List.Cells[11, CurCol.Kol], List.Cells[12, CurCol.Money]].VerticalAlignment := xlCenter;
      List.Range[CurCol.Kol + '11:' + CurCol.Money + '11'].Merge;
    end;
    progr.Progress:=12;

    // Создание колонок для реализации по прочим операциям
    rq1.close;
    rq1.SQL.Text := ' select distinct oper_id as out_rash_id, C.name as out_rash_name ' +
      '   from oil_srother A, Oil_DR_Data B, v_oil_oper_type C '+
      '  where B.State = ''Y'' ' +
      '    and B.rep_id = ' + q.fieldbyname('id').AsString +
      '    and B.rep_inst = ' + q.fieldbyname('inst').AsString +
      '    and B.oper_type = 1 ' +
      '    and A.state = ''Y'' ' +
      '    and A.srep_id = B.id ' +
      '    and A.srep_inst=B.inst ' +
      '    and C.state = ''Y'' ' +
      '    and A.oper_id = C.id';
    rq1.open;
    rq1.first;

    while not rq1.eof do
    begin
      new(CurCol);
      CurCol.Name := rq1.fieldbyname('out_rash_name').value;
      CurCol.id := rq1.fieldbyname('out_rash_id').AsInteger;
      CurCol.Kol := EndChar;
      inc(ExcelColumn);
      EndChar:=ExcelStr(ExcelColumn);
      CurCol.Money:=EndChar;
      inc(ExcelColumn);
      EndChar:=ExcelStr(ExcelColumn);
      OutColL.Add(CurCol);
      List.Cells[12,CurCol.Kol].value:=LangText('Count');
      List.Cells[12,CurCol.Money].value:=LangText('Sum');
      List.Range[List.Cells[11, CurCol.Kol], List.Cells[12, CurCol.Money]].HorizontalAlignment := xlCenter;
      List.Range[List.Cells[11, CurCol.Kol], List.Cells[12, CurCol.Money]].VerticalAlignment := xlCenter;
      List.Range[CurCol.Kol + '11:' + CurCol.Money + '11'].Merge;
      List.Range[CurCol.Kol + '11:' + CurCol.Money + '11'].ShrinkToFit := True;
      List.Cells[11, CurCol.Kol].value := rq1.fieldbyname('out_rash_name').AsString;
      rq1.Next;
    end;
    progr.Progress := 13;

    if startChar <> EndChar then
    begin
      dec(ExcelColumn);
      EndChar := ExcelStr(ExcelColumn);
      List.Rows[11].RowHeight := 14.25;
      List.Cells[10, StartChar].value := LangText('V_T_CH_otp_po_vid_realiz');
      List.Range[StartChar + '10:' + EndChar + '10'].Merge;
      ec2 := ExcelColumn;
      inc(EC2);
      ost := ExcelStr(EC2);
    end
    else
    begin
      ost := EndChar;
      ec2 := ExcelColumn;
    end;

    // Создание колонки для остатка
    List.Cells[12, ost].value:=LangText('Count');
    List.Cells[12, ost].HorizontalAlignment:=xlCenter;
    oste := ExcelStr(ec2 + 1);
    List.Range[ost + '10:' + ostE + '11'].WrapText:=true;
    List.Range[ost + '10:' + ostE + '11'].MergeCells:=true;
    List.Range[ost + '10:' + ostE + '11'].HorizontalAlignment:= xlCenter;
    List.Range[ost + '10:' + ostE + '11'].VerticalAlignment:= xlCenter;
    List.Cells[10, ost].value := LangText('Ostatok')+LangText('Na_konec_smeni');
    List.Cells[12, ostE].value := LangText('Sum');
    List.Cells[12, ostE].HorizontalAlignment := xlCenter;
    List.Range[StartChar + '10:' + ostE + '12'].Borders.LineStyle := xlContinuous;
    progr.Progress := 15;
    pos := 13;

    for k := 1 to 2 do
    begin
      if k = 1 then tov := 'K';
      if k = 2 then tov := 'O'',''S';
      
      // Выборка группы НП для отчета
      rq1.Close;
      rq1.SQL.Text := ' select distinct ttn_np_grp_id, ttn_np_grp_name,order_id ' +
        ' from v_oil_rash_n ' +
        ' where (id,inst) in ' +
           ' (select distinct ttn_id, ttn_inst ' +
            '   from Oil_DR_Data ' +
            '  where rep_id = ' + q.fieldbyname('id').AsString +
            '    and rep_inst = ' + q.fieldbyname('inst').AsString +
            '    and state = ''Y'' ) '+
        '    and own_goods in('''+tov+''') ' +
        ' order by order_id ';
      rq1.Open;
      oldk := progr.Progress;

      if rq1.RecordCount <> 0 then
        gp := trunc(37/rq1.RecordCount);
      RSum:=TStringList.Create;
      RSSum:=TStringList.Create;

      if (K = 1)and(rq1.RecordCount > 0) then
      begin
        inc(pos);
        List.Cells[pos, 'A'].value := LangText('Kom_tovar');
        List.Cells[pos, 'A'].font.size := 12;
        List.Cells[pos, 'A'].font.bold := true;
        List.Cells[pos, 'A'].font.italic := true;
        inc(pos);
      end;

      if (K = 2)and(rq1.RecordCount > 0) then
      begin
        inc(pos);
        List.Cells[pos, 'A'].value := LangText('Sob_tovar');
        List.Cells[pos, 'A'].font.size := 12;
        List.Cells[pos, 'A'].font.bold := true;
        List.Cells[pos, 'A'].font.italic := true;
        inc(pos);
      end;

      while not rq1.eof do
      begin
        List.Cells[pos, 'B'].value := rq1.fieldbyname('ttn_np_grp_name').AsString;
        List.Cells[pos, 'B'].Font.Size := 10;
        List.Cells[pos, 'B'].Font.Bold := true;
        oldGp := progr.Progress;
        
        // Выборка партий для отчета
        rq2.close;
        rq2.SQL.text:=' select distinct b.ttn_dog,b.ttn_np_name ' +
          '   from Oil_DR_Data a, v_oil_rash_n b ' +
          '  where a.rep_id = ' + q.fieldbyname('id').AsString +
          '    and a.rep_inst = ' + q.fieldbyname('inst').AsString +
          '    and a.state = ''Y'' ' +
          '    and a.ttn_id = b.id ' +
          '    and a.ttn_inst = b.inst ' +
          '    and b.own_goods in (''' + tov + ''') '+
          '    and b.ttn_np_grp_id = ' + rq1.fieldbyname('ttn_np_grp_id').AsString +
          '  order by ttn_np_name ' ;
        rq2.Open;
        if rq2.RecordCount <> 0 then
          gp1 := Trunc(gp / rq2.RecordCount);
        GSum := TStringList.Create;
        GSSum := TStringList.Create;

        while not rq2.eof do
        begin
          oldGp1 := progr.Progress;
          inc(pos);
          List.Cells[pos, 'B'].Value := LangText('Part')+': ' + rq2.FieldByName('ttn_np_name').AsString + '. ' + LangText('Dog') + ': ' + rq2.FieldByName('ttn_dog').AsString;
          List.Cells[pos, 'B'].Font.Italic := true;
          List.Cells[pos, 'B'].Font.Size := 10;
          List.Range['B' + IntToStr(pos) + ':' + ostE + IntToStr(pos)].Borders[xlEdgeBottom].LineStyle := xlDouble;
          
          // Выборка названий подпартий для отчета
          rq3.Close;
          rq3.SQL.Text := ' select distinct Oil_DR_Data.TTN_Id, Oil_DR_Data.TTN_Inst, decode(:is_average, 1, null, Oil_DR_Data.Sub_Part) as Sub_Part, v_Oil_Dim.IsShtuki ' +
            '   from Oil_DR_Data, Oil_Rashod, Oil_Part, v_Oil_Dim ' +
            '  where Oil_DR_Data.Rep_Id = :rep_id ' +
            '    and Oil_DR_Data.Rep_Inst = :rep_inst ' +
            '    and Oil_DR_Data.State = ''Y'' ' +
            '    and Oil_DR_Data.TTN_Id = Oil_Rashod.Id ' +
            '    and Oil_DR_Data.TTN_Inst = Oil_Rashod.Inst ' +
            '    and Oil_Rashod.Part_Id = Oil_Part.Id ' +
            '    and Oil_Rashod.Part_Inst = Oil_Part.Inst ' +
            '    and Oil_Part.Dim_Id = v_Oil_Dim.Id ' +
            '    and Oil_Part.Own_Goods in ('''+tov+''') ' +
            '    and Oil_Part.Dog = :dog ';
          _OpenQueryPar(rq3,
            ['rep_id', q.FieldByName('Id').AsInteger,
             'rep_inst', q.FieldByName('Inst').AsInteger,
             'dog', RQ2.FieldByName('TTN_Dog').AsString,
             'is_average', IfThen(IsAVERAGE(q.FieldByName('Rep_Date').AsDateTime), 1, 0)]);
          if rq3.RecordCount <> 0 then
            gp2 := Trunc(gp1 / rq3.RecordCount);
          SPCount := rq3.RecordCount;
          SPSum := TStringList.Create;

          while not rq3.Eof do
          begin
            inc(pos);
            SPSum.Add(IntToStr(pos));

            // Выборка всей информации по подпартиям для отчета
            rq4.Close;
            rq4.SQL.Text := ' select /*+ORDERED*/ Oil_DR_Data.*, Oil_Part.SS ' +
              ' from Oil_DR_Data, Oil_Rashod, Oil_Part ' +
              ' where Oil_DR_Data.State = ''Y'' ' +
              ' and Oil_DR_Data.TTN_Id = Oil_Rashod.Id ' +
              ' and Oil_DR_Data.TTN_Inst = Oil_Rashod.Inst ' +
              ' and Oil_Rashod.Part_Id = Oil_Part.Id ' +
              ' and Oil_Rashod.Part_Inst = Oil_Part.Inst ' +
              ' and Oil_DR_Data.rep_id = ' + q.fieldbyname('id').AsString +
              ' and Oil_DR_Data.rep_inst = ' + q.fieldbyname('inst').AsString +
              ' and Oil_DR_Data.ttn_id = ' + rq3.fieldbyname('ttn_id').AsString +
              ' and Oil_DR_Data.ttn_inst = ' + rq3.fieldbyname('ttn_inst').AsString;
            rq4.Open;

            // Расчет остатков по подпартиям
            if IsAVERAGE(q.FieldByName('Rep_Date').AsDateTime) then
            begin
              qRest.Close;
              _OpenQueryPar(qRest,
                ['p_rep_date',  FormatDateTime('dd.mm.yyyy', q.fieldbyname('rep_date').AsDateTime),
                 'p_azs_id',    q.FieldByName('AZS_Id').AsInteger,
                 'p_smena_num', q.FieldByName('smena_num').AsInteger,
                 'p_ttn_id',    rq3.FieldByName('ttn_id').AsInteger,
                 'p_ttn_inst',  rq3.FieldByName('ttn_inst').AsInteger
                ]);
            end
            else
            begin
              qWork.close;
              qWork.SQL.Text := ' select ' +
                '  nvl(sum(pr_litr), 0) - nvl(sum(out_nal_litr + out_ved_litr + out_sn_litr + out_litr + out_talon_litr), 0) as ost_l, ' +
                '  nvl(sum(pr_count), 0) - nvl(sum(out_nal_count + out_ved_count + out_sn_count + out_count + out_talon_count), 0) as ost_t ' +
                ' from Oil_DR_Data, ' +
                 ' (select id, inst ' +
                  '   from oil_daily_rep ' +
                  '  where state = ''Y'' ' +
                    '  and azs_id = ' + q.FieldByName('AZS_Id').AsString +
                    '  and azs_inst = ' + q.FieldByName('AZS_Inst').AsString +
                    '  and ((trunc(rep_date) < to_date(''' + FormatDateTime('dd.mm.yyyy', q.fieldbyname('rep_date').AsDateTime) + ''',''dd.mm.yyyy'')) ' +
                     '   or (trunc(rep_date) = to_date(''' + FormatDateTime('dd.mm.yyyy', q.fieldbyname('rep_date').AsDateTime) + ''',''dd.mm.yyyy'') ' +
                       '  and smena_num < ' + q.fieldbyname('smena_num').AsString + '))) O ' +
                ' where state = ''Y'' ' +
                '  and rep_id = O.id ' +
                '  and rep_inst = o.inst ' +
                '  and ttn_id = ' + rq3.fieldbyname('ttn_id').AsString +
                '  and ttn_inst = ' + rq3.fieldbyname('ttn_inst').AsString;
              qWork.open;
            end;

            // Заполнение полей
            List.Cells[Pos, 'A'].value := TranslateText('П/п');
            List.Range['A' + IntToStr(Pos) + ':B' + IntToStr(Pos + 1)].Font.Size := 9;
            List.Cells[pos, 'B'].value := rq4.fieldbyname('sub_part').AsString;
            List.Cells[pos, 'C'].value := rq4.fieldbyname('pr_ud_weig').AsFloat;
            List.Cells[pos, 'C'].NumberFormat := '0,0000';

            if rq3.fieldbyname('IsShtuki').AsString = 'Y' then
            begin
              List.Cells[pos, 'D'].value := TranslateText('шт.');
              List.Cells[pos, 'D'].HorizontalAlignment := xlRight;
            end
            else
            begin
              List.Cells[pos, 'D'].value := 'л';
              List.Cells[pos, 'D'].HorizontalAlignment := xlRight;
              List.Cells[pos + 1, 'D'].value := LangText('Tonni');
              List.Cells[pos + 1, 'D'].HorizontalAlignment := xlRight;
            end;
            rash := false;
            prih := false;

            while not rq4.Eof do
            begin
              if rq4.FieldByName('pr_litr').AsFloat <> 0 then
              begin
                if not rash then
                begin
                  List.Cells[pos, 'E'].value := rq4.FieldByName('s_price').AsFloat;
                  List.Cells[pos, 'E'].NumberFormat := '0,00';
                end;
                List.Cells[pos, 'F'].Value := 0;
                List.Cells[pos, 'F'].NumberFormat := '0,000';
                if rq3.fieldbyname('IsShtuki').AsString <> 'Y' then
                begin
                  List.Cells[pos + 1, 'F'].Value := '=ROUND(F' + IntToStr(pos) + '*C' + IntToStr(pos) + '/1000,'+ IntToStr(DR_ROUND_COUNT) +')';
                  List.Cells[pos + 1, 'F'].NumberFormat := '0,000000';
                end;
                List.Cells[pos, 'G'].Value := '=ROUND(F' + IntToStr(pos) + '*E' + IntToStr(pos) + ',2)';
                List.Cells[pos, 'G'].NumberFormat := '0,00';
                List.Cells[pos, 'H'].value := rq4.FieldByName('pr_litr').Value;
                List.Cells[pos, 'H'].NumberFormat := '0,000';
                if rq3.FieldByName('IsShtuki').AsString <> 'Y' then
                begin
                  List.Cells[pos + 1, 'H'].value := rq4.FieldByName('pr_count').Value;
                  List.Cells[pos + 1, 'H'].NumberFormat := '0,000000';
                end;
                List.Cells[pos, 'I'].value := '=ROUND(H' + IntToStr(pos) + '*E' + IntToStr(pos) + ',2)';
                List.Cells[pos, 'I'].NumberFormat := '0,00';
                if not rash then
                begin
                  List.Cells[pos,ost].value:=rq4.FieldByName('pr_litr').asfloat;
                  if rq3.fieldbyname('IsShtuki').AsString <> 'Y' then
                  begin
                    List.Cells[pos + 1, ost].value := rq4.FieldByName('pr_count').asfloat;
                    List.Cells[pos + 1, ost].NumberFormat := '0,000000';
                  end;
                  List.Cells[pos, oste].value := '=ROUND(' + ost + IntToStr(pos) + '*E' + IntToStr(pos) + ',2)';
                  List.Cells[pos, oste].NumberFormat:='0,00';
                end;
                prih := true;
              end
              else
              begin
                List.Cells[pos, 'E'].value:=rq4.fieldbyname('s_price').AsFloat;
                List.Cells[pos, 'E'].NumberFormat:='0,00';
                if not prih then
                begin
                  if IsAVERAGE(q.FieldByName('Rep_Date').AsDateTime) then
                    List.Cells[pos, 'F'].value := qRest.fieldbyname('ost_l').AsFloat
                  else
                    List.Cells[pos, 'F'].value := qWork.fieldbyname('ost_l').AsFloat;

                  List.Cells[pos, 'F'].NumberFormat:='0,000';
                  if rq3.fieldbyname('IsShtuki').AsString <> 'Y' then
                  begin
                    if IsAVERAGE(q.FieldByName('Rep_Date').AsDateTime) then
                      List.Cells[pos + 1, 'F'].value := qRest.fieldbyname('ost_t').AsFloat
                    else
                      List.Cells[pos + 1, 'F'].value := qWork.fieldbyname('ost_t').AsFloat;

                    List.Cells[pos + 1, 'F'].NumberFormat := '0,000000';
                  end;
                  List.Cells[pos, 'G'].value := '=ROUND(F' + IntToStr(pos) + '*E' + IntToStr(pos)+',2)';
                  List.Cells[pos, 'G'].NumberFormat := '0,00';
                end;
                List.Cells[pos,'J'].value := rq4.fieldbyname('out_nal_litr').AsFloat + rq4.fieldbyname('out_ved_litr').AsFloat + rq4.fieldbyname('out_sn_litr').AsFloat + rq4.fieldbyname('out_talon_litr').AsFloat + rq4.fieldbyname('out_litr').AsFloat;
                List.Cells[pos,'J'].NumberFormat := '0,000';
                if rq3.fieldbyname('IsShtuki').AsString <> 'Y' then
                begin
                  List.Cells[pos + 1, 'J'].value := rq4.fieldbyname('out_nal_count').AsFloat + rq4.fieldbyname('out_ved_count').AsFloat + rq4.fieldbyname('out_sn_count').AsFloat + rq4.fieldbyname('out_talon_count').AsFloat + rq4.fieldbyname('out_count').AsFloat;
                  List.Cells[pos + 1, 'J'].NumberFormat := '0,000000';
                end;
                List.Cells[pos, 'K'].value := 0;
                List.Cells[pos, 'K'].NumberFormat := '0,00';

                // Заполнение полей реализации за наличные
                if rq4.FieldByName('out_nal_litr').AsFloat <> 0 then
                begin
                  for i := 0 to OutColL.Count - 1 do
                  begin
                    CurCol := OutColL.Items[i];
                    if curCol.Name = 'nal' then
                    begin
                      List.cells[pos,CurCol.Kol].value := rq4.FieldByName('out_nal_litr').AsFloat;
                      List.Cells[pos,CurCol.Kol].NumberFormat := '0,000';
                      if rq3.fieldbyname('IsShtuki').AsString <> 'Y' then
                      begin
                        List.Cells[pos + 1, CurCol.Kol].value := rq4.FieldByName('out_nal_count').AsFloat;
                        List.Cells[pos + 1, CurCol.Kol].NumberFormat := '0,000000';
                      end;
                      List.Cells[pos, CurCol.Money].Value := rq4.FieldByName('out_nal_money').AsFloat;
                      List.Cells[pos,CurCol.Money].NumberFormat := '0,00';
                      List.Cells[pos, 'K'].value := List.Cells[pos, 'K'].Value + rq4.FieldByName('out_nal_money').AsFloat;
                      break;
                    end;
                  end;
                end;

                // Заполнение полей реализации по ведомости
                if rq4.FieldByName('out_ved_litr').AsFloat <> 0 then
                begin
                  for i := 0 to OutColL.Count - 1 do
                  begin
                    CurCol := OutColL.Items[i];
                    if curCol.Name='ved' then
                    begin
                      List.cells[pos, CurCol.Kol].value := rq4.fieldbyname('out_ved_litr').AsFloat;
                      List.Cells[pos, CurCol.Kol].NumberFormat:='0,000';
                      if rq3.fieldbyname('IsShtuki').AsString <> 'Y' then
                      begin
                        List.Cells[pos + 1, CurCol.Kol].value := rq4.fieldbyname('out_ved_count').AsFloat;
                        List.Cells[pos + 1, CurCol.Kol].NumberFormat:='0,000000';
                      end;
                      List.Cells[pos, CurCol.Money].value := rq4.fieldbyname('out_ved_Money').AsFloat;
                      List.Cells[pos, CurCol.Money].NumberFormat := '0,00';
                      List.Cells[pos, 'K'].value := List.Cells[pos, 'K'].value + rq4.fieldbyname('out_ved_Money').AsFloat;
                      break;
                    end;
                  end;
                end;

                // Заполнение полей реализации по талонам
                if rq4.FieldByName('Out_Talon_Litr').AsFloat <> 0 then
                begin
                  rq5.Close;
                  rq5.SQL.Text := ' select Sum(Oil_SRTalon.Litr) as Litr, ' +
                                     ' Sum(Oil_SRTalon.Count_T) as Weight, ' +
                                     ' Sum(Round(Oil_SRTalon.Count_T * Oil_Part.SS, 2)) as Own_Amount, ' +
                                     ' Sum(Round(Oil_SRTalon.Litr * Oil_DR_Data.S_Price, 2)) as Sale_Amount ' +
                     ' from Oil_SRTalon, Oil_DR_Data, Oil_Rashod, Oil_Part ' +
                    ' where Oil_SRTalon.State = ''Y'' ' +
                      ' and Oil_DR_Data.Id = ' + rq4.FieldByName('Id').AsString +
                      ' and Oil_DR_Data.Inst = ' + rq4.FieldByName('Inst').AsString +
                      ' and Oil_DR_Data.Oper_Type = 1 ' +
                      ' and Oil_SRTalon.SRep_Id = Oil_DR_Data.Id ' +
                      ' and Oil_SRTalon.SRep_Inst = Oil_DR_Data.Inst ' +
                      ' and Oil_DR_Data.TTN_Id = Oil_Rashod.Id ' +
                      ' and Oil_DR_Data.TTN_Inst = Oil_Rashod.Inst ' +
                      ' and Oil_Rashod.Part_Id = Oil_Part.Id ' +
                      ' and Oil_Rashod.Part_Inst = Oil_Part.Inst ';
                  rq5.Open;
                  for i := 0 to OutColL.Count - 1 do
                  begin
                    CurCol := OutColL.Items[i];
                    if curCol.Name = 'talon' then
                    begin
                      List.cells[pos, CurCol.Kol].Value := rq5.FieldByName('Litr').asfloat;
                      List.Cells[pos, CurCol.Kol].NumberFormat := '0,000';
                      if rq3.fieldbyname('IsShtuki').AsString <> 'Y' then
                      begin
                        List.Cells[pos + 1, CurCol.Kol].Value := rq5.fieldbyname('Weight').asfloat;
                        List.Cells[pos + 1, CurCol.Kol].NumberFormat:='0,000000';
                      end;
                      if IsAVERAGE(q.FieldByName('Rep_Date').AsDateTime) then
                        List.Cells[pos, CurCol.Money].Value := rq5.FieldByName('Sale_Amount').AsFloat
                      else
                        List.Cells[pos, CurCol.Money].Value := rq5.FieldByName('Own_Amount').AsFloat;

                      List.Cells[pos, CurCol.Money].NumberFormat := '0,00';
                      if IsAVERAGE(q.FieldByName('Rep_Date').AsDateTime) then
                        List.Cells[pos, 'K'].Value := List.Cells[pos, 'K'].Value + rq5.FieldByName('Sale_Amount').AsFloat
                      else
                        List.Cells[pos, 'K'].Value := List.Cells[pos, 'K'].Value + rq5.FieldByName('Own_Amount').AsFloat;
                      break;
                    end;
                  end;
                end;

                // Заполнение полей реализации на собственные нужды
                if rq4.FieldByName('out_sn_litr').AsFloat <> 0 then
                begin
                  for i := 0 to OutColL.Count - 1 do
                  begin
                    CurCol := OutColL.Items[i];
                    if curCol.Name = 'sn' then
                    begin
                      List.cells[pos, CurCol.Kol].value := rq4.FieldByName('out_sn_litr').AsFloat;
                      List.Cells[pos, CurCol.Kol].NumberFormat := '0,000';
                      if rq3.FieldByName('IsShtuki').AsString <> 'Y' then
                      begin
                        List.Cells[pos + 1, CurCol.Kol].Value := rq4.fieldbyname('out_sn_count').AsFloat;
                        List.Cells[pos + 1, CurCol.Kol].NumberFormat := '0,000000';
                      end;
                      List.Cells[pos, CurCol.Money].Value := MRound(rq4.fieldbyname('out_sn_Count').asfloat * rq4.FieldByName('SS').AsFloat, 2);
                      List.Cells[pos, CurCol.Money].NumberFormat := '0,00';
                      List.Cells[pos, 'K'].Value := List.Cells[pos, 'K'].Value + MRound(rq4.FieldByName('Out_Talon_Count').AsFloat * rq4.FieldByName('SS').AsFloat, 2);
                      break;
                    end;
                  end;
                end;

                // Заполнение полей реализации по прочим операциям
                if rq4.FieldByName('out_litr').AsFloat <> 0 then
                begin
                  RQ5.Close;
                  RQ5.SQL.Text := ' select Oil_SROther.Oper_id, ' +
                                     ' Sum(Oil_SROther.Litr) as Litr, ' +
                                     ' Sum(Oil_SROther.Count_T) as Weight, ' +
                                     ' Sum(Round(Oil_SROther.Count_T * Oil_Part.SS, 2)) as Own_Amount, ' +
                                     ' Sum(Round(nvl(Oil_SROther.Amount,Oil_SROther.Litr * Oil_DR_Data.S_Price), 2)) as Sale_Amount ' +
                    ' from Oil_SROther, Oil_DR_Data, Oil_Rashod, Oil_Part ' +
                   ' where Oil_SROther.State = ''Y'' ' +
                     ' and Oil_DR_Data.state = ''Y'' ' +
                     ' and Oil_DR_Data.Id = ' + rq4.FieldByName('Id').AsString +
                     ' and Oil_DR_Data.Inst = ' + rq4.FieldByName('Inst').AsString +
                     ' and Oil_DR_Data.Oper_Type = 1 ' +
                     ' and Oil_SROther.SRep_Id = Oil_DR_Data.Id ' +
                     ' and Oil_SROther.SRep_Inst = Oil_DR_Data.Inst ' +
                     ' and Oil_DR_Data.TTN_Id = Oil_Rashod.Id ' +
                     ' and Oil_DR_Data.TTN_Inst = Oil_Rashod.Inst ' +
                     ' and Oil_Rashod.Part_Id = Oil_Part.Id ' +
                     ' and Oil_Rashod.Part_Inst = Oil_Part.Inst ' +
                   ' group by Oil_SROther.Oper_Id';
                  RQ5.Open;
                  while not RQ5.Eof do
                  begin
                    for i := 0 to OutColL.Count - 1 do
                    begin
                      CurCol := OutColL.Items[i];
                      if curCol.id = rq5.FieldByName('oper_id').AsInteger then
                      begin
                        List.Cells[pos, CurCol.Kol].value := rq5.FieldByName('Litr').AsFloat;
                        List.Cells[pos, CurCol.Kol].NumberFormat := '0,000';
                        if rq3.FieldByName('IsShtuki').AsString <> 'Y' then
                        begin
                          List.Cells[pos + 1, CurCol.Kol].value := rq5.FieldByName('Weight').AsFloat;
                          List.Cells[pos + 1, CurCol.Kol].NumberFormat := '0,000000';
                        end;
                        if (rq5.FieldByName('Oper_Id').AsInteger in [15, 16, 19, 40, 42, 47, 55, 100, 101, 102, 153])
                          and (not IsAVERAGE(q.FieldByName('Rep_Date').AsDateTime)) then
                          List.Cells[pos, CurCol.Money].Value := rq5.FieldByName('Own_Amount').AsFloat
                        else
                          List.Cells[pos, CurCol.Money].Value := rq5.FieldByName('Sale_Amount').AsFloat;
                        List.Cells[pos, CurCol.Money].NumberFormat := '0,00';
                        List.Cells[Pos, 'K'].Value := List.Cells[Pos, 'K'].Value + List.Cells[Pos, CurCol.Money].Value;
                        break;
                      end;
                    end;
                    rq5.Next;
                  end;
                end;
                List.Cells[pos, ost].value := '=F' + IntToStr(pos) + '+H' + IntToStr(pos) + '-J' + IntToStr(pos);
                List.Cells[pos, ost].NumberFormat := '0,000';
                if rq3.fieldbyname('IsShtuki').AsString <> 'Y' then
                begin
                  List.Cells[pos + 1, ost].value := '=F' + IntToStr(pos + 1) + '+H' + IntToStr(pos + 1) + '-J' + IntToStr(pos + 1);
                  List.Cells[pos + 1, ost].NumberFormat:='0,000000';
                end;
                List.Cells[pos, oste].value:='=IF(' + ost + IntToStr(pos) + '>0,G' + IntToStr(pos) + '+I' + IntToStr(pos) + '-K' + IntToStr(pos) + ', 0)';
                List.Cells[pos, oste].NumberFormat:='0,00';
                rash := true;
              end;
              rq4.next;
            end;
            if rq3.fieldbyname('IsShtuki').AsString <> 'Y' then
              Inc(Pos);
            rq3.Next;
            progr.Progress := progr.Progress + gp2;
          end; // while not rq3.Eof do

          // Подведение итогов по подпартиям
          if SPCount>1 then
          begin
            inc(pos);
            List.Rows[Pos].Font.Size := 9;
            List.Rows[Pos + 1].Font.Size := 9;
            if rq3.FieldByName('IsShtuki').AsString <> 'Y' then
              GSum.Add(IntToStr(pos))
            else
              GSSum.Add(IntToStr(pos));
            List.Range['B' + IntToStr(pos) + ':' + ostE + IntToStr(pos)].Borders[xlEdgeTop].LineStyle := xlContinuous;
            List.Range['B' + IntToStr(pos) + ':' + ostE + IntToStr(pos + 1)].Font.Italic := true;
            List.Cells[pos, 'B'].value := LangText('Itogo_po_part');
            if rq3.FieldByName('IsShtuki').AsString <> 'Y' then
            begin
              List.Cells[pos,'D'].value := TranslateText('л');
              List.Cells[pos,'D'].HorizontalAlignment := xlRight;
              List.Cells[pos+1,'D'].value := LangText('Tonni');
              List.Cells[pos+1,'D'].HorizontalAlignment := xlRight;
            end
            else
            begin
              List.Cells[pos,'D'].Value := TranslateText('шт');
              List.Cells[pos,'D'].HorizontalAlignment := xlRight;
            end;
            List.Cells[pos, 'F'].Value := GetSumStr('F', SPSum);
            List.Cells[pos, 'F'].NumberFormat := '0,000';
            if rq3.FieldByName('IsShtuki').AsString <> 'Y' then
            begin
              List.Cells[pos + 1, 'F'].Value := GetSumStr('F', SPSum, +1);
              List.Cells[pos + 1, 'F'].NumberFormat:='0,000000';
            end;
            List.Cells[pos, 'G'].Value := GetSumStr('G', SPSum);
            List.Cells[pos, 'G'].NumberFormat := '0,00';
            List.Cells[pos, 'H'].Value := GetSumStr('H', SPSum);
            List.Cells[pos, 'H'].NumberFormat := '0,000';
            if rq3.FieldByName('IsShtuki').AsString <> 'Y' then
            begin
              List.Cells[pos + 1, 'H'].Value := GetSumStr('H', SPSum, +1);
              List.Cells[pos + 1, 'H'].NumberFormat:='0,000000';
            end;
            
            List.Cells[pos, 'I'].Value := GetSumStr('I', SPSum);
            List.Cells[pos, 'I'].NumberFormat:='0,00';
            List.Cells[pos, 'J'].Value := GetSumStr('J', SPSum);
            List.Cells[pos, 'J'].NumberFormat := '0,000';
            if rq3.FieldByName('IsShtuki').AsString <> 'Y' then
            begin
              List.Cells[pos + 1, 'J'].Value := GetSumStr('J', SPSum, +1) ;
              List.Cells[pos + 1, 'J'].NumberFormat := '0,000000';
            end;
            List.Cells[pos,'K'].Value := GetSumStr('K', SPSum);
            List.Cells[pos,'K'].NumberFormat := '0,00';
            List.Cells[pos, ost].value := GetSumStr(ost, SPSum);
            List.Cells[pos, ost].NumberFormat := '0,000';
            if rq3.FieldByName('IsShtuki').AsString <> 'Y' then
            begin
              List.Cells[pos+1,ost].Value := GetSumStr(ost, SPSum, +1);
              List.Cells[pos+1,ost].NumberFormat := '0,000000';
            end;
            List.Cells[pos, oste].Value := GetSumStr(oste,SPSum);
            List.Cells[pos, oste].NumberFormat := '0,00';
            j := sc;

            while not (j > ExcelColumn) do
            begin
              List.Cells[pos, ExcelStr(j)].value := GetSumStr(ExcelStr(j), SPSum);
              List.Cells[pos, ExcelStr(j)].NumberFormat:='0,000';
              if rq3.FieldByName('IsShtuki').AsString <> 'Y' then
              begin
                List.Cells[pos+1,ExcelStr(j)].Value := GetSumStr(ExcelStr(j), SPSum, +1);
                List.Cells[pos+1,ExcelStr(j)].NumberFormat:='0,000000';
                inc(j);
              end;
              List.Cells[pos,ExcelStr(j)].value:=GetSumStr(ExcelStr(j), SPSum);
              List.Cells[pos,ExcelStr(j)].NumberFormat:='0,00';
              inc(j);
            end;
            if rq3.FieldByName('IsShtuki').AsString <> 'Y' then
              inc(pos);
            SpSum.Free;
          end
          else
          begin
            if rq3.FieldByName('IsShtuki').AsString <> 'Y' then
              GSum.Add(IntToStr(pos - 1))
            else
              GSSum.Add(IntToStr(pos));
          end;
          rq2.Next;
          progr.Progress:=oldGp1+gp1;
        end;
        // Подведение итогов по группам НП
        if rq2.RecordCount > 1 then
        begin
          Inc(Pos);
          List.Rows[Pos].Font.Size := 9;
          List.Rows[Pos + 1].Font.Size := 9;
          List.Cells[pos,'B'].value:=LangText('Itogo_po_grup');
          if GSum.Count > 0 then
          begin
            List.Range['A'+inttostr(pos)+':'+ostE+inttostr(pos+1)].Font.bold:=true;
            RSum.Add(IntToStr(pos));
            List.Cells[pos,'D'].Value := 'л';
            List.Cells[pos,'D'].HorizontalAlignment:=xlRight;
            List.Cells[pos+1,'D'].Value := LangText('Tonni');
            List.Cells[pos+1,'D'].HorizontalAlignment:=xlRight;
            List.Cells[pos,'F'].Value := GetSumStr('F',gsum);
            List.Cells[pos,'F'].NumberFormat:='0,000';
            List.Cells[pos+1,'F'].Value := GetSumStr('F',gsum, +1);
            List.Cells[pos+1,'F'].NumberFormat:='0,000000';
            List.Cells[pos,'G'].Value := GetSumStr('G',gsum, +1);
            List.Cells[pos,'G'].NumberFormat:='0,00';
            List.Cells[pos,'H'].Value := GetSumStr('H',gsum);
            List.Cells[pos,'H'].NumberFormat:='0,000';
            List.Cells[pos+1,'H'].Value := GetSumStr('H',gsum,+1);
            List.Cells[pos+1,'H'].NumberFormat:='0,000000';
            List.Cells[pos,'I'].Value := GetSumStr('I', gsum);
            List.Cells[pos,'I'].NumberFormat:='0,00';
            List.Cells[pos,'J'].Value := GetSumStr('J', gsum);
            List.Cells[pos,'J'].NumberFormat:='0,000';
            List.Cells[pos+1,'J'].Value := GetSumStr('J', gsum, +1);
            List.Cells[pos+1,'J'].NumberFormat:='0,000000';
            List.Cells[pos,'K'].Value := GetSumStr('K', gsum);
            List.Cells[pos,'K'].NumberFormat:='0,00';
            List.Cells[pos,ost].Value := GetSumStr(ost, gsum);
            List.Cells[pos,ost].NumberFormat:='0,000';
            List.Cells[pos+1,ost].Value := GetSumStr(ost, gsum, +1);
            List.Cells[pos+1,ost].NumberFormat:='0,000000';
            List.Cells[pos,oste].Value := GetSumStr(oste, gsum, +1);
            List.Cells[pos,oste].NumberFormat:='0,00';
            j := sC;

            while not (j > ExcelColumn) do
            begin
              List.Cells[pos,ExcelStr(j)].Value := GetSumStr(ExcelStr(j), gsum);
              List.Cells[pos,ExcelStr(j)].NumberFormat:='0,000';
              List.Cells[pos+1,ExcelStr(j)].Value := GetSumStr(ExcelStr(j), gsum, +1);
              List.Cells[pos+1,ExcelStr(j)].NumberFormat:='0,000000';
              inc(j);
              List.Cells[pos,ExcelStr(j)].Value := GetSumStr(ExcelStr(j), gsum);
              List.Cells[pos,ExcelStr(j)].NumberFormat:='0,00';
              inc(j);
            end;
          end;

          if GSSum.count > 0 then
          begin
            if GSum.count > 0 then
              inc(pos,2);
            List.Cells[pos,'B'].value:=LangText('Itogo_po_grup');
            List.Range['A'+inttostr(pos)+':'+ostE+inttostr(pos)].Font.bold:=true;
            RSSum.Add(IntToStr(pos));
            List.Cells[pos,'D'].Value := TranslateText('шт');
            List.Cells[pos,'D'].HorizontalAlignment:=xlRight;
            List.Cells[pos,'F'].Value := GetSumStr('F',GSSum);
            List.Cells[pos,'F'].NumberFormat:='0,000';
            List.Cells[pos,'G'].Value := GetSumStr('G',GSSum);
            List.Cells[pos,'G'].NumberFormat:='0,00';
            List.Cells[pos,'H'].value := GetSumStr('H',GSSum);
            List.Cells[pos,'H'].NumberFormat:='0,000';
            List.Cells[pos, 'I'].Value := GetSumStr('I',GSSum);
            List.Cells[pos, 'I'].NumberFormat := '0,00';
            List.Cells[pos, 'J'].Value := GetSumStr('J',GSSum);
            List.Cells[pos, 'J'].NumberFormat := '0,000';
            List.Cells[pos, 'K'].Value := GetSumStr('K',GSSum);
            List.Cells[pos, 'K'].NumberFormat := '0,00';
            List.Cells[pos, ost].Value := GetSumStr(ost,GSSum);
            List.Cells[pos, ost].NumberFormat := '0,000';
            List.Cells[pos, oste].Value := GetSumStr(oste,GSSum);
            List.Cells[pos, oste].NumberFormat := '0,00';
            j := sC;
            
            while not (j > ExcelColumn) do
            begin
              List.Cells[pos, ExcelStr(j)].Value := GetSumStr(ExcelStr(j),GSSum);
              List.Cells[pos, ExcelStr(j)].NumberFormat := '0,000';
              inc(j);
              List.Cells[pos, ExcelStr(j)].Value := GetSumStr(ExcelStr(j),GSSum);
              List.Cells[pos, ExcelStr(j)].NumberFormat := '0,00';
              inc(j);
            end;
            Dec(pos);
          end;
          Inc(pos);
          GSum.Free;
          GSSum.Free;
        end
        else
        begin
          if rq3.fieldbyname('IsShtuki').AsString <> 'Y' then
            RSum.add(inttostr(pos - 1))
          else
          begin
            if GSSum.count = 1 then
              RSSum.Add(IntToStr(pos))
            else
              RSSum.Add(IntToStr(pos - 1));
          end
        end;
        rq1.Next;
        inc(pos, 1);
        progr.Progress := oldGp + gp;
      end;

      if rq1.RecordCount > 1 then
      begin
        List.Rows[IntToStr(pos) + ':' + IntToStr(pos + 1)].Font.Bold := True;
        List.Rows[IntToStr(pos) + ':' + IntToStr(pos + 1)].Font.Size := 10;
        List.Cells[pos, 'B'].value := LangText('Vsego_po_otcht');
        List.Range['A' + IntToStr(pos) + ':' + ostE + IntToStr(pos)].Borders[xlEdgeTop].Weight := xlMedium;
        List.Range['A' + IntToStr(pos) + ':A' + IntToStr(pos + 1)].Borders[xlEdgeLeft].Weight := xlMedium;
        List.Range[ostE + IntToStr(pos) + ':' + ostE + IntToStr(pos + 1)].Borders[xlEdgeRight].Weight := xlMedium;
        if RSum.count > 0 then
        begin
          List.Cells[pos, 'D'].value := 'л';
          List.Cells[pos, 'D'].HorizontalAlignment := xlRight;
          List.Cells[pos + 1, 'D'].value := LangText('Tonni');
          List.Cells[pos + 1, 'D'].HorizontalAlignment := xlRight;
          List.Cells[pos, 'F'].Value := GetSumStr('F', RSum);
          List.Cells[pos, 'F'].NumberFormat := '0,000';
          List.Cells[pos + 1, 'F'].Value := GetSumStr('F', RSum, +1);
          List.Cells[pos + 1, 'F'].NumberFormat := '0,000000';
          List.Cells[pos, 'G'].Value := GetSumStr('G', RSum);
          List.Cells[pos, 'G'].NumberFormat := '0,00';
          List.Cells[pos, 'H'].Value := GetSumStr('H', RSum);
          List.Cells[pos, 'H'].NumberFormat:='0,000';
          List.Cells[pos + 1, 'H'].Value := GetSumStr('H', RSum, +1);
          List.Cells[pos + 1, 'H'].NumberFormat := '0,000000';
          List.Cells[pos, 'I'].Value := GetSumStr('I', RSum);
          List.Cells[pos, 'I'].NumberFormat:='0,00';
          List.Cells[pos, 'J'].Value := GetSumStr('J', RSum);
          List.Cells[pos, 'J'].NumberFormat := '0,000';
          List.Cells[pos + 1, 'J'].Value := GetSumStr('J', RSum, +1);
          List.Cells[pos + 1, 'J'].NumberFormat := '0,000000';
          List.Cells[pos, 'K'].Value := GetSumStr('K', RSum);
          List.Cells[pos, 'K'].NumberFormat := '0,00';
          List.Cells[pos, ost].Value := GetSumStr(ost, RSum);
          List.Cells[pos, ost].NumberFormat := '0,000';
          List.Cells[pos + 1, ost].Value := GetSumStr(ost, RSum, +1);
          List.Cells[pos + 1, ost].NumberFormat := '0,000000';
          List.Cells[pos, oste].Value := GetSumStr(oste, RSum);
          List.Cells[pos, oste].NumberFormat:='0,00';
          j := sC;

          while not (j>ExcelColumn) do
          begin
            List.Cells[pos, ExcelStr(j)].Value := GetSumStr(ExcelStr(j), RSum);
            List.Cells[pos, ExcelStr(j)].NumberFormat := '0,000';
            List.Cells[pos + 1, ExcelStr(j)].Value := GetSumStr(ExcelStr(j), RSum, +1);
            List.Cells[pos + 1, ExcelStr(j)].NumberFormat := '0,000000';
            List.Columns[ExcelStr(j) + ':' + ExcelStr(j)].EntireColumn.AutoFit;
            inc(j);
            List.Cells[pos, ExcelStr(j)].Value := GetSumStr(ExcelStr(j), RSum);
            List.Cells[pos, ExcelStr(j)].NumberFormat := '0,00';
            inc(j);
          end;
        end;

        if RSSum.Count > 0 then
        begin
          if RSum.Count > 0 then Inc(pos,2);
          List.Rows[IntToStr(pos) + ':' + IntToStr(pos)].Font.bold := True;
          List.Range['A' + IntToStr(pos) + ':A' + IntToStr(pos)].Borders[xlEdgeLeft].Weight := xlMedium;
          List.Range[ostE + IntToStr(pos) + ':' + ostE + IntToStr(pos)].Borders[xlEdgeRight].Weight := xlMedium;
          List.Range['A' + IntToStr(pos) + ':' + ostE + IntToStr(pos)].Borders[xlEdgeBottom].Weight := xlMedium;
          List.Cells[pos, 'D'].value := TranslateText('шт');
          List.Cells[pos, 'D'].HorizontalAlignment := xlRight;
          List.Cells[pos, 'F'].Value := GetSumStr('F', RSSum);
          List.Cells[pos, 'F'].NumberFormat := '0,000';
          List.Cells[pos,'G'].Value := GetSumStr('G', RSSum);
          List.Cells[pos,'G'].NumberFormat:='0,00';
          List.Cells[pos,'H'].Value := GetSumStr('H', RSSum);
          List.Cells[pos,'H'].NumberFormat := '0,000';
          List.Cells[pos,'I'].Value := GetSumStr('I', RSSum);
          List.Cells[pos,'I'].NumberFormat:='0,00';
          List.Cells[pos,'J'].Value := GetSumStr('J', RSSum);
          List.Cells[pos,'J'].NumberFormat:='0,000';
          List.Cells[pos,'K'].Value := GetSumStr('K', RSSum);
          List.Cells[pos,'K'].NumberFormat:='0,00';
          List.Cells[pos,ost].Value := GetSumStr(ost, RSSum);
          List.Cells[pos,ost].NumberFormat := '0,000';
          List.Cells[pos, oste].Value := GetSumStr(oste, RSSum);
          List.Cells[pos, oste].NumberFormat := '0,00';
          j := sC;

          while not (j > ExcelColumn) do
          begin
            List.Cells[pos, ExcelStr(j)].Value := GetSumStr(ExcelStr(j), RSSum);
            List.Cells[pos, ExcelStr(j)].NumberFormat:='0,000';
            inc(j);
            List.Cells[pos, ExcelStr(j)].Value := GetSumStr(ExcelStr(j), RSSum);
            List.Cells[pos, ExcelStr(j)].NumberFormat := '0,00';
            inc(j);
          end;
        end;
        
        if (rsum.Count > 0) and( RSSum.Count = 0) then
          List.Range['A' + IntToStr(pos + 1) + ':' + ostE + IntToStr(pos + 1)].Borders[xlEdgeBottom].Weight := xlMedium;
        List.Columns['F:' + OstE].EntireColumn.AutoFit;
        Inc(Pos);
        Rsum.Free;
        RSsum.Free;
      end;
      Progr.Progress := OldK + 37;
    end;
    progr.Progress := 90;
    // Вывод в отчет кассового оборота
    rq1.Close;
    rq1.SQL.Text := 'select * from oil_dr_money ' +
      ' where rep_id = ' + q.FieldByName('id').AsString +
      ' and rep_inst = ' + q.FieldByName('inst').AsString +
      ' and State = ''Y''';
    rq1.Open;

    Inc(Pos, 2);
    List.Rows[IntToStr(Pos) + ':' + IntToStr(Pos + 4)].Font.Size := 10;
    List.Cells[pos, 'A'].value := LangText('Ostatok')+':';
    List.Cells[pos, 'F'].value := rq1.FieldByName('sm_start').AsFloat;
    List.Cells[pos, 'F'].NumberFormat := '0,00';
    List.Range['F' + IntToStr(pos) + ':G' + IntToStr(pos)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
    List.Range['F' + IntToStr(pos) + ':G' + IntToStr(pos)].Merge;
    progr.Progress := 92;
    Inc(pos);
    List.Cells[pos, 'A'].value := LangText('Vur_ot_realiz_za_smenu')+':';
    List.Cells[pos, 'F'].value := rq1.FieldByName('sm_get').AsFloat;
    List.Cells[pos, 'F'].NumberFormat := '0,00';
    List.Range['F' + IntToStr(pos) + ':G' + IntToStr(pos)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
    List.Range['F' + IntToStr(pos) + ':G' + IntToStr(pos)].Merge;

    if rq1.FieldByName('sm_polis_get').AsFloat > 0 then
    begin
      Inc(pos);
      List.Cells[pos, 'A'].value := LangText('Vur_ot_realiz_STR_polisov')+':';
      List.Cells[pos, 'F'].value := rq1.FieldByName('sm_polis_get').AsFloat;
      List.Cells[pos, 'F'].NumberFormat := '0,00';
      List.Range['F' + IntToStr(pos) + ':G' + IntToStr(pos)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
      List.Range['F' + IntToStr(pos) + ':G' + IntToStr(pos)].Merge;
    end;
    progr.Progress := 94;
    Inc(Pos);
    List.Cells[pos, 'A'].value := LangText('Sdano')+'('+LangText('Inkasirovano')+')'+':';
    List.Cells[pos, 'F'].value := rq1.FieldByName('sm_out').AsFloat;
    List.Cells[pos, 'F'].NumberFormat := '0,00';
    List.Range['F' + IntToStr(pos) + ':G' + IntToStr(pos)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
    List.Range['F' + IntToStr(pos) + ':G' + IntToStr(pos)].Merge;
    progr.Progress := 96;
    Inc(Pos);
    List.Cells[pos,'A'].value := LangText('Ostatok_viruchki')+LangText('Na_konec_smeni')+':';
    List.Cells[pos,'F'].value := rq1.FieldByName('sm_end').AsFloat;
    List.Cells[pos,'F'].NumberFormat := '0,00';
    List.Range['F' + IntToStr(pos) + ':G' + IntToStr(pos)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
    List.Range['F' + IntToStr(pos) + ':G' + IntToStr(pos)].Merge;
    Progr.Progress := 98;
    List.Cells[pos, 'K'].Value := TranslateText('Бухгалтер :');
    List.Range['M' + IntToStr(pos) + ':P' + IntToStr(pos)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
    Progr.Progress:=100;
    Progr.Free;
    MSExcel.Visible := True;
    MSExcel.ScreenUpdating := True;
  except On E:Exception Do
    begin
      Progr.Free;
      ShowMessage(E.Message);
      MSExcel.Visible := True;
      MSExcel.ScreenUpdating := True;
    end;
  end;
end;
//==============================================================================
procedure TSRepRefForm.PopupMenu1Popup(Sender: TObject);
begin
  if not q.IsEmpty then
  begin
    rq1.Close;
    rq1.SQL.Text :=
      'select SUM(out_ved_litr) as ved, SUM(out_talon_litr) as talon from Oil_DR_Data' +
      ' where State = ''Y'' and oper_type = 1 and rep_id = :rep_id and rep_inst = :rep_inst';
    _OpenQueryPar(rq1,
      ['rep_id', q.FieldByName('id').AsInteger, 'rep_inst', q.FieldByName('inst').AsInteger]);

    if rq1.FieldByName('ved').AsFloat <> 0 then
      N3.Enabled := True
    else
      N3.Enabled := False;

    if (rq1.FieldByName('talon').AsFloat <> 0)
      and (0 = nvl(GetSqlValueParSimple(
      'select count(*) from Oil_DR_Data drd, Oil_SRTalon srt' +
      ' where drd.State = ''Y'' and srt.State = ''Y'' and srt.litr <> 0' +
      '   and drd.Rep_Id = :Rep_Id and drd.Rep_Inst = :Rep_Inst' +
      '   and drd.Id = srt.SRep_Id and drd.Inst = srt.SRep_Inst and srt.intheway = 4',
      ['Rep_Id', q.FieldByName('id').AsInteger, 'Rep_Inst', q.FieldByName('inst').AsInteger]), 0)) then N2.Enabled := True
    else N2.Enabled := False;

    miEditAllSR.Enabled := PEdit.Visible and not q.FieldByName('azs_id').isNull
      and not q.FieldByName('rep_date').isNull;
  end;
end;
//==============================================================================
procedure TSRepRefForm.N2Click(Sender: TObject);
var
  Progr: TProgrForm;
  CurPos, SumStart: Integer;
begin
  if q.IsEmpty then exit;
  Application.CreateForm(TProgrForm,progr);
  Progr.Progress := 0;
  Progr.Show;
  Progr.Repaint;
  try
    ActivateXLApp('SRepTalon', 'SRepTalon', 1, MSExcel, List, '', 'xlt');
    List := MSExcel.ActiveWorkbook.ActiveSheet;
    Progr.Progress := 5;
    // Вывод значений для шапки отчета
    List.Cells[2, 'A'] := MainForm.qOrg.FieldbyName('Name').AsString + '(' + DateToStr(GetSystemDate) + ' ' + TimeToStr(GetSystemDate) + ')';
    List.Cells[6, 'D'].Value := LangText('Po_smen_otchotu') + q.FieldByName('AZS_Name').AsString +' '+ LangText('Smena') + q.FieldByName('Smena_Num').AsString + TranslateText(' за ') + q.FieldByName('Rep_Date').AsString;
    List.Cells[7, 'D'].Value := LangText('Operator_smeni') + q.FieldByName('Emp_Name').AsString;
    Progr.Progress := 10;
    // Выполнение запроса
    qDecTal.Close;
    qDecTal.ParamByName('RepId').AsInteger := q.fieldbyname('Id').AsInteger;
    qDecTal.ParamByName('RepInst').AsInteger := q.fieldbyname('Inst').AsInteger;
    qDecTal.Open;
    Range := VarArrayCreate([1, qDecTal.RecordCount, 1, 12], varVariant);
    Progr.Progress := 50;
    // Загрузка данных во временную область
    CurPos := 1;
    while not qDecTal.eof do
    begin
      Range[CurPos, 1] := CurPos;
      Range[CurPos, 2] := qDecTal.FieldByName('NP_Name').Value;
      Range[CurPos, 3] := qDecTal.FieldByName('Part').Value;
      Range[CurPos, 4] := qDecTal.FieldByName('Sub_Part').Value;
      Range[CurPos, 5] := qDecTal.FieldByName('SS').Value;
      Range[CurPos, 6] := qDecTal.FieldByName('Ud_Weight').Value;
      Range[CurPos, 7] := qDecTal.FieldByName('Nominal').Value;
      Range[CurPos, 8] := qDecTal.FieldByName('Ser').Value;
      Range[CurPos, 9] := qDecTal.FieldByName('Num').Value;
      if qDecTal.FieldByName('Nominal').AsInteger in [5, 10, 20, 50] then
        Range[CurPos, 10] := qDecTal.FieldByName('Litr').AsFloat / qDecTal.FieldByName('Nominal').AsInteger;
      Range[CurPos, 11] := qDecTal.FieldByName('Litr').Value;
      Range[CurPos, 12] := qDecTal.FieldByName('Weight').Value;
      Inc(CurPos);
      qDecTal.Next;
    end;
    List.Range['E11:E' + IntToStr(qDecTal.RecordCount + 10)].NumberFormat := '0,00';
    List.Range['F11:F' + IntToStr(qDecTal.RecordCount + 10)].NumberFormat := '0,0000';
    List.Range['K11:K' + IntToStr(qDecTal.RecordCount + 10)].NumberFormat := '0,000';
    List.Range['L11:L' + IntToStr(qDecTal.RecordCount + 10)].NumberFormat := '0,000000';
    List.Range['M11:M' + IntToStr(qDecTal.RecordCount + 10)].NumberFormat := '0,00';
    // Выгрузка данных в Excel
    List.Range['A11:L' + IntToStr(qDecTal.RecordCount + 10)].Value := Range;
    List.Range['M11:M' + IntToStr(qDecTal.RecordCount + 10)].FormulaR1C1 := '=Round(RC[-1]*RC[-8],2)';
    // Создание итогов
    if not qDecTal.IsEmpty then
      MSExcel.Run('CreateSubTotal');
    Inc(CurPos, 18);
    Progr.Progress := 70;
    // Создание количественной сетки для талонов по группам НП и номиналам
    List.Cells[CurPos, 'B'].Value := LangText('Count_tal_po_otch');
    List.Range['B' + IntToStr(CurPos) + ':F' + IntToStr(CurPos)].Merge;
    Inc(CurPos);
    List.Cells[CurPos, 'B'].Value := LangText('Vid_GSM');
    List.Cells[CurPos, 'C'].Value := TranslateText('Ном 5');
    List.Cells[CurPos, 'D'].Value := TranslateText('Ном 10');
    List.Cells[CurPos, 'E'].Value := TranslateText('Ном 20');
    List.Cells[CurPos, 'F'].Value := TranslateText('Ном 50');
    List.Cells[CurPos, 'G'].Value := LangText('Vsego');
    Inc(CurPos);
    SumStart := CurPos;
    qDecTalSum.Close;
    qDecTalSum.ParamByName('RepId').AsInteger := q.fieldbyname('Id').AsInteger;
    qDecTalSum.ParamByName('RepInst').AsInteger := q.fieldbyname('Inst').AsInteger;
    qDecTalSum.Open;
    while not qDecTalSum.Eof do
    begin
      List.Cells[CurPos, 'B'].Value := qDecTalSum.Fields[0].AsString;
      List.Cells[CurPos, 'C'].Value := qDecTalSum.Fields[1].Value;
      List.Cells[CurPos, 'D'].Value := qDecTalSum.Fields[2].Value;
      List.Cells[CurPos, 'E'].Value := qDecTalSum.Fields[3].Value;
      List.Cells[CurPos, 'F'].Value := qDecTalSum.Fields[4].Value;
      List.Cells[CurPos, 'G'].FormulaR1C1 := '=RC[-1] + RC[-2] + RC[-3] + RC[-4]';
      Inc(CurPos);
      qDecTalSum.Next;
    end;
    List.Cells[CurPos, 'B'].Value := LangText('Itogo');
    List.Cells[CurPos, 'C'].Value := '=SubTotal(9, C' + IntToStr(SumStart) + ':C' + IntToStr(CurPos - 1) + ')';
    List.Cells[CurPos, 'D'].Value := '=SubTotal(9, D' + IntToStr(SumStart) + ':D' + IntToStr(CurPos - 1) + ')';
    List.Cells[CurPos, 'E'].Value := '=SubTotal(9, E' + IntToStr(SumStart) + ':E' + IntToStr(CurPos - 1) + ')';
    List.Cells[CurPos, 'F'].Value := '=SubTotal(9, F' + IntToStr(SumStart) + ':F' + IntToStr(CurPos - 1) + ')';
    List.Cells[CurPos, 'G'].FormulaR1C1 := '=RC[-1] + RC[-2] + RC[-3] + RC[-4]';
    List.Range['B' + IntToStr(SumStart - 2) + ':G' + IntToStr(CurPos)].Borders.LineStyle := xlContinuous;
    Inc(CurPos, 3);
    List.Cells[CurPos, 'B'].Value := LangText('Sdal')+LangText('Spec_po_uch')+LangText('Podpis')+' ________________';
    Inc(CurPos, 3);
    List.Cells[CurPos, 'B'].Value := LangText('Prinyal')+LangText('Kasir')+'('+copy(LangText('FIO'), 1, 3)+')'+' _____________________________ '+LangText('Podpis')+' ________________';
    Progr.Progress := 100;
    Progr.Free;
    MSExcel.Visible := True;
    MSExcel.ScreenUpdating := True;
  except On E: Exception Do
    begin
      progr.Free;
      ShowMessage(E.Message);
      MSExcel.Visible := True;
      MSExcel.ScreenUpdating := True;
    end;
  end;
end;
//==============================================================================
procedure TSRepRefForm.N3Click(Sender: TObject);
var
  Progr: TProgrForm;
  CurPos: Integer;
begin
  if q.IsEmpty then exit;
  try
    Application.CreateForm(TProgrForm,progr);
    Progr.Progress := 0;
    Progr.Show;
    Progr.Repaint;
    // Загрузка экземпляра Excel
    ActivateXLApp('SRepVed', 'SRepVed', 1, MSExcel, List, '', 'xlt');
    List := MSExcel.ActiveWorkbook.ActiveSheet;
    Progr.Progress := 5;
    // Вывод значений для шапки отчета
    List.Cells[2, 'A'] := MainForm.qOrg.FieldbyName('Name').AsString + '(' + DateToStr(GetSystemDate) + ' ' + TimeToStr(GetSystemDate) + ')';
    List.Cells[6, 'D'].Value := LangText('Po_smen_otchotu') + q.FieldByName('AZS_Name').AsString + LangText('Smena') + q.FieldByName('Smena_Num').AsString + TranslateText(' за ') + q.FieldByName('Rep_Date').AsString;
    List.Cells[7, 'D'].Value := LangText('Operator_smeni') + q.FieldByName('Emp_Name').AsString;
    Progr.Progress := 10;
    // Выполнение запроса
    qVed.Close;
    qVed.ParamByName('Id').AsInteger := q.fieldbyname('Id').AsInteger;
    qVed.ParamByName('Inst').AsInteger := q.fieldbyname('Inst').AsInteger;
    qVed.Open;
    Range := VarArrayCreate([1, qVed.RecordCount, 1, 12], varVariant);
    Progr.Progress := 50;
    // Загрузка данных во временную область
    CurPos := 1;
    while not qVed.eof do
    begin
      Range[CurPos, 1] := CurPos;
      Range[CurPos, 2] := qVed.FieldByName('Org_Name').Value;
      Range[CurPos, 3] := qVed.FieldByName('Id_Num').Value;
      Range[CurPos, 4] := qVed.FieldByName('NP_Name').Value;
      Range[CurPos, 5] := qVed.FieldByName('Part').Value;
      Range[CurPos, 6] := qVed.FieldByName('Sub_Part').Value;
      if qVed.FieldByName('IsShtuki').AsString = 'Y' then
        Range[CurPos, 7] := qVed.FieldByName('Dim_Name').Value
      else
        Range[CurPos, 7] := TranslateText('литр');
      Range[CurPos, 8] := qVed.FieldByName('Ud_Weight').Value;
      Range[CurPos, 9] := qVed.FieldByName('Price').Value;
      Range[CurPos, 10] := qVed.FieldByName('Litr').Value;
      Range[CurPos, 11] := qVed.FieldByName('Weight').Value;
      Range[CurPos, 12] := qVed.FieldByName('Amount').Value;
      Inc(CurPos);
      qVed.Next;
    end;
    // Выгрузка данных в Excel
    List.Range['A11:L' + IntToStr(qVed.RecordCount + 10)].Value := Range;
    // Создание итогов
    if not qVed.IsEmpty then
      MSExcel.Run('CreateSubTotal');
    Inc(CurPos, qVed.RecordCount + 12);
    qVedSum.Close;
    qVedSum.ParamByName('Id').AsInteger := q.fieldbyname('Id').AsInteger;
    qVedSum.ParamByName('Inst').AsInteger := q.fieldbyname('Inst').AsInteger;
    qVedSum.Open;
    while not qVedSum.eof do
    begin
      List.Cells[CurPos, 'B'].Value := LangText('Vsego') + qVedSum.FieldByName('NP_Name').AsString;
      List.Cells[CurPos, 'C'].Value := qVedSum.FieldByName('Litr').Value;
      if qVedSum.FieldByName('IsShtuki').AsString = 'Y' then
        List.Cells[CurPos, 'C'].NumberFormat := '0'
      else
        List.Cells[CurPos, 'C'].NumberFormat := '0,000';
      Inc(CurPos);
      qVedSum.Next;
    end;
    Progr.Progress := 100;
    Progr.Free;
    MSExcel.Visible := True;
    MSExcel.ScreenUpdating := True;
  except On E: Exception Do
    begin
      progr.Free;
      ShowMessage(E.Message);
      MSExcel.Visible := True;
      MSExcel.ScreenUpdating := True;
    end;
  end;
end;
//==============================================================================
procedure TSRepRefForm.sbOrgClick(Sender: TObject);
begin
  ceOrg.Text := '';
  SearchOrgId := 0;
end;
//==============================================================================
procedure TSRepRefForm.ceOrgButtonClick(Sender: TObject);
var
  vId, vInst: Integer;
  vName: String;
begin
  if ChooseOrg.CaptureOrg(0, MAIN_ID, INST, 'yyy', vId, vInst, vName) then
  begin
    SearchOrgId := vId;
    ceOrg.Text := vName;
  end;
end;
//==============================================================================
procedure TSRepRefForm.sbDateClick(Sender: TObject);
begin
  deDate.Text := '';
end;
//==============================================================================
procedure TSRepRefForm.qAfterPost(DataSet: TDataSet);
begin
  q.ApplyUpdates;
  q.CommitUpdates;
end;
//==============================================================================
procedure TSRepRefForm.qREP_DATEValidate(Sender: TField);
begin
  if StrToDate(Close_Date) >= Sender.AsDateTime then
    raise Exception.Create(TranslateText('Данный период закрыт !'));
end;
//==============================================================================
procedure TSRepRefForm.N5Click(Sender: TObject);
var
  Progr: TProgrForm;
  BeginNP, i, PosCounter: Integer;
  CurNPName: String;
begin
  Application.CreateForm(TProgrForm, Progr);
  Progr.Progress := 0;
  Progr.Show;
  Progr.Repaint;
  try
    // Загрузка экземпляра Excel
    ActivateXLApp('SCRashNakl', 'SCRashNakl', 1, MSExcel, List, '', 'xlt');
    // Вывод значений для шапки отчета
    List := MSExcel.ActiveWorkbook.ActiveSheet;
    List.Cells[1, 'A'] := MainForm.qOrg.FieldbyName('Name').AsString + ' ' + DateTimeToStr(GetSystemDate);
    List.Cells[3, 'C'] := q.FieldByName('Filial_Name').AsString + ', ' + q.FieldByName('AZS_Name').AsString;
    List.Cells[4, 'C'] := LangText('SvidPlatNDC')+': ' + q.FieldByName('Filial_Svid_Num').AsString;
    List.Cells[5, 'C'] := LangText('NalNum_UrLic')+': ' + q.FieldByName('Filial_Nal_Num').AsString;
    List.Cells[7, 'C'] := LangText('Rashodna_nakladna')+'№ ' + Q.FieldByName('Rep_Num').AsString+' '+LangText('Ot') + Q.FieldByName('Rep_Date').AsString;
    // Выполнение запроса
    qSCRashNakl.Close;
    qSCRashNakl.ParamByName('Id').AsInteger := q.FieldByName('Id').AsInteger;
    qSCRashNakl.ParamByName('Inst').AsInteger := q.FieldByName('Inst').AsInteger;
    qSCRashNakl.Open;
    CurNPName := qSCRashNakl.FieldByName('NPGrp_Name').AsString;
    BeginNP := 11;
    i := 11;
    PosCounter := 1;
    // Загрузка данных в Excel
    while not qSCRashNakl.Eof do
    begin
      List.Cells[i, 'A'] := PosCounter;
      List.Cells[i, 'B'] := qSCRashNakl.FieldByName('NPGrp_Name').AsString;
      List.Cells[i, 'C'] := qSCRashNakl.FieldByName('SC_Number').AsString;;
      List.Cells[i, 'D'] := qSCRashNakl.FieldByName('SC_Cheque').AsString;
      List.Cells[i, 'F'] := TranslateText('литр');
      List.Cells[i, 'G'] := qSCRashNakl.FieldByName('Litr').AsFloat;
      List.Cells[i, 'H'] := GetNoNDS_WithNDS(qSCRashNakl.FieldByName('Price').AsFloat,StrToDate(Q.FieldByName('Rep_Date').AsString));
      List.Cells[i, 'I'].FormulaR1C1 := '=RC[2]-RC[1]';;
      List.Cells[i, 'J'].FormulaR1C1 := '=RC[1]/6';
      List.Cells[i, 'K'] := qSCRashNakl.FieldByName('Litr').AsFloat * qSCRashNakl.FieldByName('Price').AsFloat;
      qSCRashNakl.Next;
      Inc(PosCounter);
      Inc(i);
      // Создание итогов
      if (CurNPName <> qSCRashNakl.FieldByName('NPGrp_Name').AsString)or(qSCRashNakl.Eof) then
      begin
        List.Range['A' + IntToStr(i) + ':K' + IntToStr(i)].Font.Bold := True;
        List.Cells[i, 'B'] := LangText('Itogo') + CurNPName;
        List.Cells[i, 'G'].Formula := '=SubTotal(9, G' + IntToStr(BeginNP) + ':G' + IntToStr(i - 1) + ')';
        List.Cells[i, 'I'].Formula := '=SubTotal(9, I' + IntToStr(BeginNP) + ':I' + IntToStr(i - 1) + ')';
        List.Cells[i, 'J'].Formula := '=SubTotal(9, J' + IntToStr(BeginNP) + ':J' + IntToStr(i - 1) + ')';
        List.Cells[i, 'K'].Formula := '=SubTotal(9, K' + IntToStr(BeginNP) + ':K' + IntToStr(i - 1) + ')';
        Inc(i);
        CurNPName := qSCRashNakl.FieldByName('NPGrp_Name').AsString;
        BeginNP := i;
      end;
    end;
    if not qSCRashNakl.IsEmpty then
    begin
      List.Range['A'+IntToStr(i)+':K'+IntToStr(i)].Font.Bold := True;
      List.Cells[i, 'B'] := LangText('Itogo')+TranslateText(' по АЗС');
      List.Cells[i, 'G'].Formula := '=SubTotal(9, G11:G' + IntToStr(i - 1) + ')';
      List.Cells[i, 'I'].Formula := '=SubTotal(9, I11:I' + IntToStr(i - 1) + ')';
      List.Cells[i, 'J'].Formula := '=SubTotal(9, J11:J' + IntToStr(i - 1) + ')';
      List.Cells[i, 'K'].Formula := '=SubTotal(9, K11:K' + IntToStr(i - 1) + ')';
    end;
    List.Range['A11:K' + IntToStr(i)].Borders.LineStyle := xlContinuous;
    List.Cells[i + 2, 'B'] := LangText('All_Sum_NDS')+': ' + OilStd.NumStrGrn(List.Cells[i, 'K'].Value , TranslateText('грн.'), TranslateText('коп.'));
    List.Cells[i + 6, 'C'] := TranslateText('Бухгалтер ________________');
    Progr.Free;
    MSExcel.Visible := True;
    MSExcel.ScreenUpdating := True;
  except on E: Exception do
    begin
      ShowMessage(E.Message);
      Progr.Free;
      MSExcel.Visible := True;
      MSExcel.ScreenUpdating := True;
    end;
  end;
end;
//==============================================================================
procedure TSRepRefForm.miSrepAddClick(Sender: TObject);
var
  RepForm : TRulezReportForm;
  qOrg: TOilQuery;
  SBeginDate: String;
begin
  inherited;
  if q.IsEmpty then Exit;
  RepForm := MakePluginReportParam('АЗС - приложение к сменному отчету'); // *NO_TRANSLATE*
  try
    if not Assigned(RepForm) then Exit;
    qOrg := TOilQuery.Create(Self);
    try
      GetOrgData(qOrg,qAzs_Id.asInteger, qAzs_Inst.asInteger);
      RepForm.R.Elements[RepForm.R.Elements.IndexOf('ORG1')].FillResFromDataSet(qOrg);
      RepForm.deBegin.Date := qRep_Date.AsDateTime;
      DateTimeToString(SBeginDate,'dd.mm.yyyy hh:nn',qRep_Date.AsDateTime);
      SBeginDate := ''''+SBeginDate + '''';
      RepForm.R.SQLText := StringReplace(RepForm.R.SQLText, ':BeginDate',SBeginDate, [rfReplaceAll, rfIgnoreCase]);
      RepForm.R.Description.Add(TranslateText('\{A6}MСмена № \B')+qSmena_Num.AsString+TranslateText('\b от \B')+SBeginDate+'\b');
    finally
      qOrg.Free;
    end;
    RepForm.BitBtn1.Click;
  finally
    FreeAndNil(RepForm);
  end;
end;
//==============================================================================
procedure TSRepRefForm.N6Click(Sender: TObject);
var
  F: TSRTalonForm;
  FF: TSRepForm;
  n: integer;
begin
  F := TSRTalonForm.Create(nil);
  FF := TSRepForm.Create(nil);
  try
    if q.IsEmpty then exit;
    // завантаження даних про змінний звіт
    F.MId := qID.AsInteger;
    F.MInst := qInst.AsInteger;
    F.MAzs_Id := qAzs_Id.AsInteger;
    F.MAzs_Inst := qAzs_Inst.AsInteger;
    F.MDateTime := qREP_DATE.AsDateTime;
    F.MNum := qREP_NUM.AsString;

    TTalon.DatabaseName := DB_DIR;
    TTalon.Close;
    TTalon.Open;
    // видаляємо усі дані
    TTalon.Last;
    for n := TTalon.RecordCount downto 1 do
      TTalon.Delete;

    FF.qRashTalon.Close;
    FF.qRashTalon.ParamByName('Rep_id').Value := qID.AsInteger;
    FF.qRashTalon.ParamByName('Rep_inst').Value := qInst.AsInteger;
    FF.qRashTalon.Open;

    while not FF.qRashTalon.Eof do
    begin
      if not ((FF.qRashTalon.FieldByName('SER').AsString = '')
        or (FF.qRashTalon.FieldByName('NUM').AsString = '')) then
      begin
        TTalon.Append;
        TTalon.FieldByName('TTN_ID').Value := FF.qRashTalon.FieldByName('TTN_ID').Value;
        TTalon.FieldByName('TTN_INST').Value := FF.qRashTalon.FieldByName('TTN_INST').Value;
        TTalon.FieldByName('SER').AsString := FF.qRashTalon.FieldByName('SER').AsString;
        TTalon.FieldByName('NUM').Value := FF.qRashTalon.FieldByName('NUM').Value;
        TTalon.FieldByName('litr').Value := FF.qRashTalon.FieldByName('litr').Value;
        TTalon.FieldByName('Price').AsFloat := FF.qRashTalon.FieldByName('Price').AsFloat;
        TTalon.FieldByName('countt').AsFloat := FF.qRashTalon.FieldByName('Count_T').AsFloat;
        TTalon.FieldByName('NPGrp_Id').Value := FF.qRashTalon.FieldByName('NPGrp_Id').Value;
        TTalon.FieldByName('AUTO_ID').Value := FF.qRashTalon.FieldByName('AUTO_ID').Value;
        TTalon.FieldByName('AUTO_INST').Value := FF.qRashTalon.FieldByName('AUTO_INST').Value;
        TTalon.FieldByName('EMPLOY_ID').Value := FF.qRashTalon.FieldByName('EMPLOY_ID').Value;
        TTalon.FieldByName('EMPLOY_INST').Value := FF.qRashTalon.FieldByName('EMPLOY_INST').Value;
        TTalon.FieldByName('subpart').Value := FF.qRashTalon.FieldByName('Sub_Part').Value;
        TTalon.FieldByName('InTheWay').Value := FF.qRashTalon.FieldByName('InTheWay').Value;
        TTalon.Post;
      end;
      FF.qRashTalon.Next;
    end;
    if TTalon.IsEmpty then
    begin
      MessageDlg(TranslateText('Этот сменный отчет не имеет талонов в пути!'), mtError, [mbOk], 0);
      exit;
    end;
    F.IsTest := true;
    F.ShowModal;
  finally
    F.Free;
    FF.Free;
  end;
end;
//==============================================================================
procedure TSRepRefForm.miEditAllSRClick(Sender: TObject);
var
  i: integer;
  Progr: TProgrForm;

  //****************************************************************************
  procedure EditSR();
  begin
    if (Inst <> q.FieldByName('Inst').AsInteger) or (StrToDate(Close_Date) >= q.FieldByName('rep_date').AsDateTime) then
      exit;

    try
      StartSQL;
      qWork.Close;
      qWork.SQL.Text :=
        'select * from Oil_Daily_Rep' +
        ' where Id = '+ q.FieldByName('Id').AsString +' and Inst = '+ q.FieldByName('Inst').AsString +' for update nowait';
      qWork.Open;
      q.Edit;
      q.Post;

      // Открытие формы редактирования
      Application.CreateForm(TSRepForm, SMRep);
      SMrep.mode := 2;

      SMrep.dbceAZSName.Enabled := False;
      SMrep.dbeSmenaNum.Enabled := False;
      SMrep.dbeRepNum.Enabled := False;
      SMrep.dbdeRepDate.Enabled := False;
      SMrep.dbdeRepDateEnd.Enabled := False;

      SMRep.FormShow(SMRep);
      SMRep.Visible := false;

      SMRep.bbRealization.Click;
      SMRep.bbIncas.Click;
      SMRep.bbOk.Click;

      if q.State <> dsBrowse then q.Post;
      CommitSQL;
      SMRep.Free;
      if q.State <> dsBrowse then q.Post;
    except on E: Exception do
      Begin
        if Pos('ORA-00054:', E.Message) <> 0 then
          MessageDlg(TranslateText('Этот сменный отчет редактируется другим пользователем !'), mtError, [mbOk], 0)
        else MessageDlg(E.Message, mtError, [mbOk], 0);
        RollbackSQL;
        abort;
      end;
    end;
  end;
  //****************************************************************************

begin
  if MessageDlg(TranslateText('Перепринять все выше введённые сменные отчеты по ')+
    decode([ceAZS.Text, '', TranslateText('ВСЕМ АЗС'), ceAZS.Text]) +
    TranslateText(' с даты ')+ DateToStr(Trunc(q.FieldByName('REP_DATE').AsDateTime)) +' ?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;

  i := 0;
  bEscSR := false;
  Application.CreateForm(TProgrForm, Progr);
  try
    DBGrid1.FieldColumns['REP_DATE'].Title.SortMarker    := smUpEh;
    DBGrid1.FieldColumns['REP_NUM'].Title.SortMarker     := smNoneEh;
    DBGrid1.FieldColumns['SMENA_NUM'].Title.SortMarker   := smNoneEh;
    DBGrid1.FieldColumns['EMP_NAME'].Title.SortMarker    := smNoneEh;
    DBGrid1.FieldColumns['AZS_NAME'].Title.SortMarker    := smNoneEh;
    DBGrid1.FieldColumns['FILIAL_NAME'].Title.SortMarker := smNoneEh;
    deDate.Date := 0;
    DBGrid1SortMarkingChanged(DBGrid1);
    Progr.Progress := 0;
    Progr.Show;
    Progr.Repaint;
    q.FetchAll := true;
    Progr.MaxValue := q.RecordCount;

    if not q.IsEmpty then
    begin     
      while not (q.Bof) do
      begin
        Progr.Visible := false;
        Sleep(1000);
        Application.ProcessMessages;
        if bEscSR then break; // Ctrl+R
        Progr.Visible := true;
        Progr.Repaint;

        EditSR();
        i := i + 1;
        Progr.AddProgress(1);
        Progr.Repaint;
        q.Prior;
      end;
    end;
    q.FetchAll := false;
    bbSearch.Click;
  finally
    Progr.Free;
  end;
  MessageDlg(TranslateText('Перепринято ')+ IntToStr(i) +TranslateText(' сменных отчетов.'), mtInformation, [mbOk], 0);
end;
//==============================================================================
procedure TSRepRefForm.miAutoLoadClick(Sender: TObject);
var
  F: TSRepAutoLoadF;
begin
  Application.CreateForm(TSRepAutoLoadF, F);
  try
    F.SRepRef := Self;
    F.ShowModal;
    DBGrid1SortMarkingChanged(DBGrid1);
  finally
    F.Free;
  end;
end;
//==============================================================================
procedure TSRepRefForm.FormShow(Sender: TObject);
begin
  inherited;
  if SysParamExists('RUN_OIL_AUTOLOAD_SREP') then
    miAutoLoadClick(nil);
end;
//==============================================================================
procedure TSRepRefForm.DBGrid1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
var
  sl: TStringList;
begin
  inherited;
  if q.FieldByName('resave').AsString = 'Y' then Background := $00D4D4D4;

  sl := TStringList.Create;
  try
    sl.Text := q.FieldByName('res_comment').AsString;
    if (sl.Count > 2) and (pos('E', q.FieldByName('auto_load').AsString) = 0) then
      AFont.Color := clRed;
    if (Column.FieldName = 'AZS_NAME') and (q.FieldByName('res_comment').AsString <> '') then
      AFont.Style := AFont.Style + [fsBold];
  finally
    sl.Free;
  end;
end;
//==============================================================================
procedure TSRepRefForm.actAutoloadLogExecute(Sender: TObject);
begin
  if q.IsEmpty then exit;
  if Main.INST  = 666 then
    ShowFormattedText(ReplaceAllSubstr(q.FieldByName('res_comment').AsString, '  ', #10), 'Логи')
  else
    ShowFormattedText(q.FieldByName('res_comment').AsString, 'Логи');
end;
//==============================================================================
procedure TSRepRefForm.actEscSRExecute(Sender: TObject);
begin
  bEscSR := true;
end;
//==============================================================================
procedure TSRepRefForm.ceEmpKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;
//==============================================================================
procedure TSRepRefForm.miShiftsClick(Sender: TObject);
var
  RezervImageForm: TRezervImageForm;
begin
  if q.IsEmpty then exit;
  RezervImageForm := TRezervImageForm.Create(Self);
  try
    RezervImageForm.AzsId := q.FieldByName('azs_id').AsInteger;
    RezervImageForm.DateBegin := q.FieldByName('rep_date').AsDateTime;
    RezervImageForm.ShowModal;
  finally
    RezervImageForm.Free;
  end;
end;
//==============================================================================
procedure TSRepRefForm.actAddExecute(Sender: TObject);
begin
  if (rsbAdd.Visible) and (rsbAdd.Enabled)
    and (pAdd.Visible) and (pAdd.Enabled)
    and (miAdd.Visible) and (miAdd.Enabled) then sbAdd.Click;
end;
//==============================================================================
procedure TSRepRefForm.N11Click(Sender: TObject);
var
  RepForm: TRulezReportForm;
  qOrg: TOilQuery;
begin
  inherited;
  if q.IsEmpty then Exit;
  RepForm := MakePluginReportParam('АЗС - Движение нефтепродуктов(товаров) и денег'); // *NO_TRANSLATE*
  try
    if not Assigned(RepForm) then Exit;
    qOrg := TOilQuery.Create(Self);
    try
      GetOrgData(qOrg, qAzs_Id.asInteger, qAzs_Inst.asInteger);
      RepForm.R.Elements[RepForm.R.Elements.IndexOf('ORG1')].FillResFromDataSet(qOrg);

      RepForm.deBegin.Date := qRep_Date.AsDateTime;
      RepForm.deEnd.Date := qRep_Date.AsDateTime;
    finally
      qOrg.Free;
    end;
    RepForm.BitBtn1.Click;
  finally
    FreeAndNil(RepForm);
  end;
end;
//==============================================================================

end.
