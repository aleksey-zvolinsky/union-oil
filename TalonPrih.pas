unit TalonPrih;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, DBGrids, Buttons,  ComObj, Excel8TLB, ActiveX,
  DBCtrls, ToolEdit, RXCtrls, StdCtrls, ExtCtrls, Grids, Mask, CurrEdit,
  ActnList,Ora, MemDS, DBAccess,uOilQuery,uOilStoredProc, DBGridEh
  {$IFDEF VER150},Variants, MemTable{$ENDIF};

type
  TTalonPrihRefForm = class(TBaseForm)
    dsTalon: TOraDataSource;
    sp1: TOilStoredProc;
    qTalon: TOilQuery;
    Panel5: TPanel;
    DBGrid2: TDBGridEh;
    lAmountTalon: TLabel;
    dsTalonTotal: TOraDataSource;
    DBText1: TDBText;
    DBText2: TDBText;
    Splitter1: TSplitter;
    dsTalonDetail: TOraDataSource;
    Label2: TLabel;
    Label4: TLabel;
    SpeedButton2: TSpeedButton;
    Label5: TLabel;
    Label1: TLabel;
    SpeedButton3: TSpeedButton;
    deBeginDate: TDateEdit;
    ceOrg: TComboEdit;
    eTalonNum: TEdit;
    eTalonSer: TEdit;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    ceDep: TComboEdit;
    Label13: TLabel;
    Label14: TLabel;
    qWork: TOilQuery;
    qNextOut: TOilQuery;
    u: TOraUpdateSQL;
    GroupBox3: TGroupBox;
    DBText4: TDBText;
    DBText5: TDBText;
    qTalonDetail: TOilQuery;
    qPriorOut: TOilQuery;
    DBGrid3: TDBGridEh;
    qSumTalon: TOilQuery;
    qTalonTotal: TOilQuery;
    Label6: TLabel;
    sbClearID: TSpeedButton;
    sbClearOper: TSpeedButton;
    Label8: TLabel;
    edOper: TComboEdit;
    qTalonFilRN: TOilQuery;
    qTalonFilReestr: TOilQuery;
    qTalonFilReestrDop: TOilQuery;
    qDogFil: TOilQuery;
    qNNFil: TOilQuery;
    qTalonBlanks: TOilQuery;
    qDogAlien: TOilQuery;
    qTalonAlienRn: TOilQuery;
    qTalonAlienReestr: TOilQuery;
    qBlankReestrDop: TOilQuery;
    Label7: TLabel;
    deEndDate: TDateEdit;
    SpeedButton4: TSpeedButton;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    NFilial: TMenuItem;
    miDocAlienAZS: TMenuItem;
    N9: TMenuItem;
    dsTalonGetPrice: TOraDataSource;
    qTalonGetPrice: TOilQuery;
    qTalonGetPriceNP_GROUP_FULL: TStringField;
    qTalonGetPriceNP_GROUP_ID: TFloatField;
    qTalonGetPriceLITR: TFloatField;
    qTalonGetPricePRICE: TFloatField;
    qTalonGetPriceSumNds: TFloatField;
    qTalonRN: TOilQuery;
    qTalonReestr: TOilQuery;
    qTalonReestrDop: TOilQuery;
    edNum: TEdit;
    procedure CheckBox1Click(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ceDepButtonClick(Sender: TObject);
    procedure ceOrgButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure eTalonNumKeyPress(Sender: TObject; var Key: Char);
    procedure sbDelClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);   Override;
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure qAfterPost(DataSet: TDataSet);
    procedure qPRIH_DATEValidate(Sender: TField);
    procedure N2Click(Sender: TObject);
    procedure sbClearIDClick(Sender: TObject);
    procedure sbClearOperClick(Sender: TObject);
    procedure edOperButtonClick(Sender: TObject);
    procedure NFilial_Click(Sender: TObject);
    procedure miDocAlienAZS_Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure qTalonGetPriceCalcFields(DataSet: TDataSet);
  private
    (** Печать филиального пакета документов *)
    procedure PrintTalonFilDocs(p_BeginDate,p_EndDate: TDateTime; p_FromInst, p_ToInst: integer; IsBlanksToPrint: boolean; p_Printer: Boolean=FALSE);
    (** Печать документов от чужой организации согластно прихода с типом операции
        218 - отоваривание на чужих АЗС     *)
    procedure PrintTalonAlienDocs(
      p_Date: TDateTime;
      qFrom,qTo:TOilQuery;
      var p_number:integer;//Номер документа
      Saving:boolean=true//Сохранить на диск или вывести на экран
      );
    (** Через эту процедуру пишется лог если есть Ойл запущен с параметром TALONPRIHLOG *)
    procedure Write_Log(s: string);
    (** Выводит в ексель сумму по талонам *)
    procedure PrintSumTalons(
      p_List:variant;
      p_FirstLine: integer;
      p_Q: TOilQuery;
      p_FieldList: string;
      p_dep_inst: integer=-1;  // если -1 выводим все, если нет, то только записи с этим инстом
      p_SumPropis: Boolean = false;
      p_Date: TDateTime = 0
      );
    (** Печатает реквизиты для дополнительного соглашения *)
    procedure PrintDopSoglRekv(
      p_Q: TOilQuery;
      p_FirstLine: integer;//начиная с строки
      p_Column: string;//начиная с колонки
      p_List: variant);
    (** Роспись шапки РН *)
    procedure PrintRashNakHead(
      p_list:Variant;
      qFrom, qTo,qDog: TOilQuery;
      p_DocNum: string;//номер РН
      p_Date: TDateTime;//Дата РН
      p_nb_name:string='' //если необходимо, то рисуем название НБ
      );
  public
  CurBookMark: TBookmark;
  CurDate: TDate;
  SOrgId, SOrgInst, SDepId, SDepInst: Integer;
  end;

implementation

uses TalonPrihData, ChooseOrg, OilStd, Progr, Main, OperTypeRef,
     uStart, uDbFunc, ExFunc, ExcelFunc, TaxBillPrint, ThirdPartyPrint,MoneyFunc,
     RashNakPrint;

{$R *.DFM}

procedure TTalonPrihRefForm.CheckBox1Click(Sender: TObject);
begin
qTalon.Active := cbShowDetail.Checked;
qTalonTotal.Active := cbShowDetail.Checked;
qTalonDetail.Active := cbShowDetail.Checked;
Splitter1.Visible := cbShowDetail.Checked;
Panel5.Visible := cbShowDetail.Checked;
end;

procedure TTalonPrihRefForm.sbAddClick(Sender: TObject);
Var
  TalonPrih: TTalonPrihForm;
  qOrg: TOilQuery;
  PossibleOrg: integer;
begin
  StartSQL;
  try
    q.Insert;
    q.FieldByName('Id').AsInteger := GetSeqNextVal('s_oil_talon_prihod');
    q.FieldByName('Inst').AsInteger := Inst;
    q.FieldByName('Prih_Date').AsDateTime := Date;
    q.FieldByName('SRep_Id').Clear;
    q.FieldByName('SRep_Inst').Clear;

    PossibleOrg := GetUserPossibleOrg(SUPER_REAL_EMP_ID);
    if PossibleOrg = -1 then
    begin
      q.FieldByName('Dep_Id').AsInteger     := MAIN_ID;
      q.FieldByName('Dep_Inst').AsInteger   := INST;
      q.FieldByName('Dep_Inst_1').AsInteger := INST;
      q.FieldByName('Dep_Type').AsInteger   := MAIN_TYPE;
      q.FieldByName('Dep_Name').AsString    := MainForm.qOrg.FieldbyName('Name').AsString;
    end
    else
    begin
      qOrg := TOilQuery.Create(nil);
      try
        GetOrgData(qOrg, PossibleOrg, PossibleOrg);
        q.FieldByName('Dep_Id').AsInteger     := qOrg.FieldByName('Id').AsInteger;
        q.FieldByName('Dep_Inst').AsInteger   := qOrg.FieldByName('Inst').AsInteger;
        q.FieldByName('Dep_Inst_1').AsInteger := qOrg.FieldByName('Inst').AsInteger;
        q.FieldByName('Dep_Type').AsInteger   := qOrg.FieldByName('Org_Id').AsInteger;
        q.FieldByName('Dep_Name').AsString    := qOrg.FieldbyName('Name').AsString;
      finally
        qOrg.Free;
      end;
    end;
    q.Post;

    CurDate := q.FieldByName('Prih_Date').AsDateTime;

    TalonPrih := TTalonPrihForm.Create(Application);
    TalonPrih.InstRecord := INST;
    TalonPrih.ShowModal;

    if TalonPrih.ModalResult = mrOk then
    begin
      if q.State <> dsBrowse then q.Post;
      CommitSQL;
    end
    else
    Begin
      RollbackSQL;
      q.Close;
      q.Open;
    End;
    TalonPrih.Free;
  except on E:Exception do
    Begin
      MessageDlg(TranslateText('Ошибка: ')+ E.Message, mtError, [mbOk], 0);
      RollbackSQL;
      q.Close;
      q.Open;
    end;
  end;
end;

procedure TTalonPrihRefForm.FormCreate(Sender: TObject);
begin
  inherited;
  // Проверяем на какой базе работаем
  if LAUNCH_MODE <> 'GREAT_OIL' then
  begin
    qTalon.SQL.Strings[9] := '';
    qTalonDetail.SQL.Strings[12] := '';
  end;

  NFilial.Visible := (INST_OLD <> MAIN_ORG.INST) and (INST_OLD <> 0) or (INST_FIL <> MAIN_ORG.INST) and (INST_FIL <> 0);
  deBeginDate.Date := Date - 30;
  deEndDate.Date := Date;
  DBGrid1.FieldColumns['SMENA_NUM'].Visible := false;
end;

procedure TTalonPrihRefForm.ceDepButtonClick(Sender: TObject);
var
vId, vInst, vType: Integer;
vName: String;
begin
if ChooseOrg.CaptureOrgT(1, MAIN_ID, INST, 'yyy', vId, vInst, vName, vType) then
  begin
  SDepId := vId;
  SDepInst := vInst;
  ceDep.Text := vName;
  end;
end;

procedure TTalonPrihRefForm.ceOrgButtonClick(Sender: TObject);
var
vId, vInst, vType: Integer;
vName: String;
begin
if ChooseOrg.CaptureOrgT(3, MAIN_ID, INST, 'yyy', vId, vInst, vName, vType) then
  begin
  SOrgId := vId;
  SOrgInst := vInst;
  ceOrg.Text := vName;
  end;
end;

procedure TTalonPrihRefForm.SpeedButton3Click(Sender: TObject);
begin
  if not deBeginDate.Enabled then exit;
  deBeginDate.Clear;
end;

procedure TTalonPrihRefForm.SpeedButton1Click(Sender: TObject);
begin
  if not ceDep.Enabled then exit;
  ceDep.Text := '';
end;

procedure TTalonPrihRefForm.SpeedButton2Click(Sender: TObject);
begin
  if not ceOrg.Enabled then exit;
  ceOrg.Text := '';
end;

procedure TTalonPrihRefForm.bbClearClick(Sender: TObject);
begin
  SpeedButton3Click(nil);
  SpeedButton4Click(nil);
  sbClearIDClick(nil);
  sbClearOperClick(nil);
  SpeedButton1Click(nil);
  SpeedButton2Click(nil);
  eTalonSer.Text := '';
  eTalonNum.Text := '';
end;

procedure TTalonPrihRefForm.bbSearchClick(Sender: TObject);
begin
  if q.Active then q.Close;
  if deBeginDate.Date<>0 then
    q.ParamByName('BeginDate').AsDateTime:=deBeginDate.Date
  else
    q.ParamByName('BeginDate').Clear;

  if deEndDate.Date<>0 then
    q.ParamByName('EndDate').AsDateTime:=deEndDate.Date
  else
    q.ParamByName('EndDate').Clear;

  if ceOrg.Text<>'' then begin
    q.ParamByName('org_id').AsInteger:=SOrgId;
    q.ParamByName('org_inst').AsInteger:=SOrgInst;
  end else begin
    q.ParamByName('org_id').Clear;
    q.ParamByName('org_inst').Clear;
  end;

  if ceDep.Text<>'' then begin
    q.ParamByName('Dep_id').AsInteger:=SDepId;
    q.ParamByName('Dep_inst').AsInteger:=SDepInst;
  end else begin
    q.ParamByName('Dep_id').Clear;
    q.ParamByName('Dep_inst').Clear;
  end;

  if eTalonSer.Text<>'' then
    q.ParamByName('ser').AsString:=eTalonSer.Text
  else
    q.ParamByName('ser').Clear;

  try
    if eTalonNum.Text<>'' then
      q.ParamByName('num').AsInteger:=StrToInt(eTalonNum.Text)
    else
      q.ParamByName('num').Clear;
  except
    on E:Exception do
      raise exception.create(TranslateText('Ошибка номера талона: ')+E.Message);
  end;

  if edNum.Text <> '' then
    q.ParamByName('prih_num').AsString := edNum.Text
  else
    q.ParamByName('prih_num').Clear;

  if edOper.Text<>'' then
    q.ParamByName('oper_id').AsInteger:=edOper.Tag
  else
    q.ParamByName('oper_id').Clear;

  if DBGrid1.FieldColumns['SMENA_NUM'].Visible then
    q.ParamByName('isSmena').AsBoolean := true
  else q.ParamByName('isSmena').Clear;

  _OpenQuery(q);
end;

procedure TTalonPrihRefForm.eTalonNumKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#13,#8]) then key:=#0;
end;

procedure TTalonPrihRefForm.sbDelClick(Sender: TObject);
begin
if q.IsEmpty then Abort;
  StartSQL;
  try
  if Inst <> q.FieldByName('Inst').AsInteger
    then raise Exception.Create(TranslateText('Нельзя удалить запись созданную другой организацией !'));
  if StrToDate(Close_Date) >= q.FieldByName('Prih_Date').AsDateTime
    then raise Exception.Create(TranslateText('Данный период закрыт !'));
  if not q.FieldByName('SREP_ID').IsNull
    then raise Exception.Create(TranslateText('Нельзя удалить запись, талоны оприходованы через сменный отчет'));
  qNextOut.Close;
  qNextOut.ParamByName('MainId').AsInteger := q.FieldByName('Id').AsInteger;
  qNextOut.ParamByName('MainInst').AsInteger := q.FieldByName('Inst').AsInteger;
  qNextOut.ParamByName('CurDate').AsDate := q.FieldByName('Prih_Date').AsDateTime;
  qNextOut.Open;
  if not qNextOut.Fields[0].IsNull
    then raise Exception.Create(TranslateText('Нельзя удалить талоны отпущенные ') + qNextOut.Fields[0].AsString);
  if MessageDlg(TranslateText('Вы уверены что хотите удалить приход талонов ?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    begin
      qWork.Close;
      qWork.SQL.Text := ' update Oil_Talon_Data set State = ''N'' ' +
      ' where Head_Id = ' + q.FieldByName('Id').AsString +
      '   and Head_Inst = ' + q.FieldByName('Inst').AsString;
      qWork.ExecSQL;
      q.Delete;
      CommitSQL;
    end;
  except on E:Exception do
    Begin
    RollbackSQL;
    MessageDlg(TranslateText('Ошибка: ') + E.Message, mtError, [mbOk], 0);
    q.close;
    q.open;
    end;
  end;
end;

procedure TTalonPrihRefForm.sbEditClick(Sender: TObject);
var
  TalonPrih: TTalonPrihForm;
begin
  if q.IsEmpty then Abort;
  StartSQL;
  try
    CurDate := q.fieldbyname('Prih_Date').AsDateTime;

    TalonPrih := TTalonPrihForm.Create(Application);
    if (INST <> q.FieldByName('Inst').AsInteger)
      or (StrToDate(CLOSE_DATE) >= q.FieldByName('Prih_Date').AsDateTime)
      or (not q.FieldByName('SREP_ID').IsNull and q.FieldByName('SMENA_NUM').IsNull) then
      TalonPrih.bbOk.Enabled := false
    else
    begin
      TalonPrih.bbOk.Enabled := true;
      qWork.Close;
      qWork.SQL.Text := 'select * from Oil_Talon_Prih where Id = :id and Inst = :inst for update nowait';
      _OpenQueryPar(qWork, ['id', q.FieldByName('Id').AsInteger, 'inst', q.FieldByName('Inst').AsInteger]);
      q.Edit;
      q.Post;
    end;

    TalonPrih.FDocDate := q.FieldByName('Prih_Date').AsDateTime;//Сохраняем дату для проверок
    TalonPrih.IsEditClick := true;
    TalonPrih.InstRecord := q.FieldByName('Inst').AsInteger;
    TalonPrih.ShowModal;

    IF TalonPrih.ModalResult = mrOk then
    begin
      if q.State <> dsBrowse then
        q.Post;
      CommitSQL;
    end
    ELSE
    begin
      if q.State <> dsBrowse then
        q.Cancel;
      RollbackSQL;
    end;
    TalonPrih.Free;
  except on E:Exception do
  begin
    if Pos('ORA-00054:', E.Message) <> 0
      then MessageDlg(TranslateText('Этот приход талонов редактируется другим пользователем !'), mtError, [mbOk], 0)
      else MessageDlg(E.Message, mtError, [mbOk], 0);
    RollbackSQL;
    q.Close;
    q.Open;
  end;
  end;
end;

procedure TTalonPrihRefForm.N1Click(Sender: TObject);
var
  Progr: TProgrForm;
  pos: integer;
begin
  try
    if q.IsEmpty then exit;
    Application.CreateForm(TProgrForm,progr);
    Progr.Progress := 0;
    Progr.Show;
    Progr.Repaint;
    ActivateXLApp('OutTalon', 'OutTalon', 1, MSExcel, List, '', 'xls');
    List := MSExcel.ActiveWorkbook.ActiveSheet;
    List.Cells[1, 'B'].Value := FormatDateTime('dd.mm.yyyy', q.FieldByName('Prih_Date').AsDateTime);
    List.Cells[2, 'B'].Value := q.FieldByName('Prih_Num').AsString;
    List.Cells[3, 'B'].Value := q.FieldByName('Org_Name').AsString;
    List.Cells[4, 'B'].Value := q.FieldByName('Dep_Name').AsString;
    qTalon.Open;
    qTalon.First;
    pos:=9;
    while not qTalon.Eof do
    begin
      List.Cells[pos,'B'].Value := qTalon.FieldByName('Ser').AsString;
      List.Cells[pos,'C'].Value := qTalon.FieldByName('Num').AsString;
      List.Cells[pos,'D'].Value := qTalon.FieldByName('NPGrp_Name').AsString;
      List.Cells[pos,'E'].Value := qTalon.FieldByName('Nominal').AsFloat;
      List.Cells[pos,'F'].Value := qTalon.FieldByName('Price').AsFloat;
      qTalon.Next;
      Inc(pos)
    end;
    List.Range['B9:F' + IntToStr(pos - 1)].Borders.LineStyle := xlContinuous;
    progr.Progress := 100;
    progr.Free;
    qTalon.Active := cbShowDetail.Checked;
    MSExcel.Visible := True;
    MSExcel.ScreenUpdating := True;
  except on E: Exception do
    begin
      MessageDlg(TranslateText('Ошибка: ') + E.Message, mtError, [mbOk], 0);
      Progr.free;
      MSExcel.Visible := True;
      MSExcel.ScreenUpdating := True;
    end;
  end;
end;

procedure TTalonPrihRefForm.N3Click(Sender: TObject);
var
  PosCounter, i, BeginNP, BeginNominal: Integer;
  CurNPName: String;
  CurNominal: Currency;
  Progr: TProgrForm;
begin
  if q.IsEmpty then exit;
  Application.CreateForm(TProgrForm,progr);
  Progr.Progress := 0;
  Progr.Show;
  Progr.Repaint;
  try
    ActivateXLApp('TalonReestr','TalonReestr',1,XLApp,List);
    ExFormat(List,2,'D',[q.FieldByName('Prih_Num').AsString]);
    List.Cells[4, 'C'] := q.FieldByName('Dep_Name').AsString;
    List.Cells[5, 'C'] := q.FieldByName('Org_Name').AsString;
    ExFormat(List,7,'D',[
      q.FieldByName('Prih_Num').AsString,
      FormatDateTime('dd.mm.yyyy', q.FieldByName('Prih_Date').AsDateTime)
    ]);
    ExFormat(List,8,'D',[
      '__',
      '__.__.____'
    ]);
    i := 11;
    BeginNP := 11;
    BeginNominal := 11;
    qTalon.Open;
    qTalon.First;
    qTalon.DisableControls;
    CurNPName := qTalon.FieldByName('NPGRP_NAME').AsString;
    CurNominal := qTalon.FieldByName('NOMINAL').AsFloat;
    Progr.Progress := 10;
    PosCounter := 1;
    while not qTalon.Eof do
    begin
      List.Cells[i, 'A'] := PosCounter;
      List.Cells[i, 'B'] := qTalon.FieldByName('NPGRP_NAME').AsString;
      List.Cells[i, 'C'] := qTalon.FieldByName('NOMINAL').AsFloat;
      List.Cells[i, 'D'] := qTalon.FieldByName('SER').AsString;
      List.Cells[i, 'E'] := qTalon.FieldByName('NUM').AsInteger;
      List.Cells[i, 'F'] := 1;
      List.Cells[i, 'G'] := qTalon.FieldByName('NOMINAL').AsFloat;
      qTalon.Next;
      i := i + 1;
      Inc(PosCounter);

      if (CurNominal <> qTalon.FieldByName('NOMINAL').AsFloat)or(qTalon.Eof)
        or(CurNPName <> qTalon.FieldByName('NPGRP_NAME').AsString) then
      begin
        List.Range['A'+IntToStr(i)+':G'+IntToStr(i)].Borders[xlEdgeBottom].LineStyle := 1;
        List.Range['A'+IntToStr(i)+':G'+IntToStr(i)].Borders[xlEdgeBottom].Weight := xlThin;
        List.Cells[i, 'B'] := LangText('Itogo')+TranslateText(' по ')+LangText('Nominaly') +' '+ FloatToStr(CurNominal);
        List.Cells[i, 'F'].Formula := '=SubTotal(9, F' + IntToStr(BeginNominal) + ':F' + IntToStr(i - 1) + ')';
        List.Cells[i, 'G'].Formula := '=SubTotal(9, G' + IntToStr(BeginNominal) + ':G' + IntToStr(i - 1) + ')';
        i := i + 1;
        CurNominal := qTalon.FieldByName('NOMINAL').AsFloat;
        BeginNominal := i;
      end;

      if (CurNPName <> qTalon.FieldByName('NPGRP_NAME').AsString)or(qTalon.Eof) then
      begin
        List.Range['A'+IntToStr(i)+':G'+IntToStr(i)].Font.Bold := True;
        List.Range['A'+IntToStr(i)+':G'+IntToStr(i)].Borders[xlEdgeBottom].LineStyle := 1;
        List.Range['A'+IntToStr(i)+':G'+IntToStr(i)].Borders[xlEdgeBottom].Weight := xlMedium;
        List.Cells[i, 'B'] := LangText('Vsego')+TranslateText(' по ') + CurNPName;
        List.Cells[i, 'F'].Formula := '=SubTotal(9, F' + IntToStr(BeginNP) + ':F' + IntToStr(i - 1) + ')';
        List.Cells[i, 'G'].Formula := '=SubTotal(9, G' + IntToStr(BeginNP) + ':G' + IntToStr(i - 1) + ')';
        i := i + 1;
        CurNPName := qTalon.FieldByName('NPGRP_NAME').AsString;
        CurNominal := qTalon.FieldByName('NOMINAL').AsFloat;
        BeginNP := i;
        BeginNominal := i;
      end;
    end;
    Progr.Progress:=90;
    qTalon.EnableControls;
    if not qTalon.IsEmpty then
    begin
      List.Range['A'+IntToStr(i)+':G'+IntToStr(i)].Font.Bold := True;
      List.Range['A'+IntToStr(i)+':G'+IntToStr(i)].Borders[xlEdgeBottom].LineStyle := 1;
      List.Range['A'+IntToStr(i)+':G'+IntToStr(i)].Borders[xlEdgeBottom].Weight := xlMedium;
      List.Cells[i, 'B'] := LangText('Vsego')+TranslateText(' по ')+LangText('Reestry');
      List.Cells[i, 'F'].Formula := '=SubTotal(9, F11:F' + IntToStr(i - 1) + ')';
      List.Cells[i, 'G'].Formula := '=SubTotal(9, G11:G' + IntToStr(i - 1) + ')';
    end;
    Inc(i, 2);
    List.Cells[i, 'B'].Value :=  LangText('Kolichestvo_talonov_po_otchety');
    List.Range['B' + IntToStr(i) + ':G' + IntToStr(i + 1)].HorizontalAlignment := xlCenter;
    List.Range['B' + IntToStr(i) + ':G' + IntToStr(i)].Merge;
    Inc(i);
    List.Cells[i, 'B'].Value := LangText('Vid_GSM');
    List.Cells[i, 'C'].Value := TranslateText('Ном 5');
    List.Cells[i, 'D'].Value := TranslateText('Ном 10');
    List.Cells[i, 'E'].Value := TranslateText('Ном 20');
    List.Cells[i, 'F'].Value := TranslateText('Ном 50');
    List.Cells[i, 'G'].Value := LangText('Vsego');
    Inc(i);
    qWork.Close;
    qWork.SQL.Text := 'select Oil_NP_Group.Name, ' +
      '       sum(decode(Oil_Talon_Data.Nominal, 5, 1, null)), ' +
      '       sum(decode(Oil_Talon_Data.Nominal, 10, 1, null)), ' +
      '       sum(decode(Oil_Talon_Data.Nominal, 20, 1, null)), ' +
      '       sum(decode(Oil_Talon_Data.Nominal, 50, 1, null))  ' +
      '  from Oil_Talon_Data, v_Oil_NP_Group Oil_NP_Group ' +
      ' where Oil_Talon_Data.State = ''Y'' ' +
      '   and Oil_Talon_Data.Head_Id = ' + q.fieldbyname('Id').AsString +
      '   and Oil_Talon_Data.Head_Inst = ' + q.fieldbyname('Inst').AsString +
      '   and Oil_NP_Group.Id = Oil_Talon_Data.NPGrp_Id ' +
      ' group by Oil_NP_Group.Name';
    qWork.Open;
    while not qWork.Eof do
    begin
      List.Cells[i, 'B'].Value := qWork.Fields[0].AsString;
      List.Range['B' + IntToStr(i) + ':F' + IntToStr(i)].NumberFormat := '0';
      List.Cells[i, 'C'].Value := qWork.Fields[1].Value;
      List.Cells[i, 'D'].Value := qWork.Fields[2].Value;
      List.Cells[i, 'E'].Value := qWork.Fields[3].Value;
      List.Cells[i, 'F'].Value := qWork.Fields[4].Value;
      List.Cells[i, 'G'].FormulaR1C1 := '=RC[-1] + RC[-2] + RC[-3] + RC[-4]';
      Inc(i);
      qWork.Next;
    end;
    List.Cells[i, 'B'].Value := LangText('Itogo');
    List.Range['B' + IntToStr(i) + ':F' + IntToStr(i)].NumberFormat := '0';
    List.Cells[i, 'C'].FormulaR1C1 := '=SubTotal(9, R[-' + IntToStr(qWork.RecordCount) + ']C:R[-1]C)';
    List.Cells[i, 'D'].FormulaR1C1 := '=SubTotal(9, R[-' + IntToStr(qWork.RecordCount) + ']C:R[-1]C)';
    List.Cells[i, 'E'].FormulaR1C1 := '=SubTotal(9, R[-' + IntToStr(qWork.RecordCount) + ']C:R[-1]C)';
    List.Cells[i, 'F'].FormulaR1C1 := '=SubTotal(9, R[-' + IntToStr(qWork.RecordCount) + ']C:R[-1]C)';
    List.Cells[i, 'G'].FormulaR1C1 := '=RC[-1] + RC[-2] + RC[-3] + RC[-4]';
    List.Range['B' + IntToStr(i - qWork.RecordCount - 2) + ':G' + IntToStr(i)].Borders.LineStyle := xlContinuous;
    Progr.Progress := 100;
    Progr.Free;
    qTalon.Active := cbShowDetail.Checked;
    XLApp.Visible := True;
    XLApp.ScreenUpdating := True;
  except on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOk], 0);
      Progr.free;
      XLApp.Visible := True;
      XLApp.ScreenUpdating := True;
    end;
  end;
end;

procedure TTalonPrihRefForm.qAfterPost(DataSet: TDataSet);
begin
q.ApplyUpdates;
q.CommitUpdates;
end;

procedure TTalonPrihRefForm.qPRIH_DATEValidate(Sender: TField);
begin
if StrToDate(Close_Date) >= Sender.AsDateTime
  then Raise Exception.Create(TranslateText('Данный период закрыт !'));
qNextOut.Close;
qNextOut.ParamByName('MainId').AsInteger := q.FieldByName('Id').AsInteger;
qNextOut.ParamByName('MainInst').AsInteger := q.FieldByName('Inst').AsInteger;
qNextOut.ParamByName('CurDate').AsDate := CurDate;
qNextOut.Open;
if not qNextOut.Fields[0].IsNull
  then if qNextOut.Fields[0].AsDateTime > Sender.AsDateTime
    then raise Exception.Create(TranslateText('Ошибка: Выбранная дата ') + Sender.AsString + TranslateText(' не может быть меньше даты предидущего отпуска ') + qNextOut.Fields[0].AsString);
qPriorOut.Close;
qPriorOut.ParamByName('MainId').AsInteger := q.FieldByName('Id').AsInteger;
qPriorOut.ParamByName('MainInst').AsInteger := q.FieldByName('Inst').AsInteger;
qPriorOut.ParamByName('CurDate').AsDate := CurDate;
qPriorOut.Open;
if not qPriorOut.Fields[0].IsNull
  then if qPriorOut.Fields[0].AsDateTime <= Sender.AsDateTime
    then raise Exception.Create(TranslateText('Ошибка: Выбранная дата ') + Sender.AsString + TranslateText(' не может быть больше или равна дате последующего отпуска ') + qPriorOut.Fields[0].AsString);
end;

procedure TTalonPrihRefForm.N2Click(Sender: TObject);
var
  Rn:TdmRashNakPrint;
begin
  if q.IsEmpty then exit;
  Rn:=TdmRashNakPrint.Create(
    Q.FieldByName('Prih_Num').AsString,
    Q.FieldByName('Prih_Date').AsDateTime,
    '',
    LangText('Vozvrat_soglasno_dop_coglashenia')+' №__ '+LangText('Ot')+' __.__.____.',
    q.FieldByName('Dep_Id').AsInteger,
    q.FieldByName('Dep_Inst').AsInteger,
    q.FieldByName('Org_Id').AsInteger,
    q.FieldByName('Org_Inst').AsInteger,
    rnTalon
    );
  try
    qSumTalon.Close;
    qSumTalon.ParamByName('Id').Value := q.FieldByName('Id').Value;
    qSumTalon.ParamByName('Inst').Value := q.FieldByName('Inst').Value;
    qSumTalon.ParamByName('PrihDate').AsDate := q.FieldByName('Prih_Date').AsDateTime;
    qSumTalon.Open;
    while not qSumTalon.Eof do
    begin
      Rn.AddPosition(
        '',
        '',
        q.FieldByName('Prih_Date').AsDateTime,
        '',
        qSumTalon.FieldByName('NPGRP_NAME').AsString + TranslateText(' по ')+LangText('Kartochkam'),
        qSumTalon.FieldByName('SumNominal').AsInteger,
        qSumTalon.FieldByName('Price').AsFloat
        );
      qSumTalon.Next;
    end;

    qWork.Close;
    qWork.SQL.Text := 'select Oil_NP_Group.Name name, '
      +'       sum(decode(Oil_Talon_Data.Nominal, 5, 1, null)) sum5, '
      +'       sum(decode(Oil_Talon_Data.Nominal, 10, 1, null)) sum10, '
      +'       sum(decode(Oil_Talon_Data.Nominal, 20, 1, null)) sum20, '
      +'       sum(decode(Oil_Talon_Data.Nominal, 50, 1, null)) sum50  '
      +'  from Oil_Talon_Data, v_Oil_NP_Group Oil_NP_Group '
      +' where Oil_Talon_Data.State = ''Y'' '
      +'   and Oil_Talon_Data.Head_Id = ' + q.fieldbyname('Id').AsString
      +'   and Oil_Talon_Data.Head_Inst = ' + q.fieldbyname('Inst').AsString
      +'   and Oil_NP_Group.Id = Oil_Talon_Data.NPGrp_Id '
      +' group by Oil_NP_Group.Name';
    qWork.Open;
    while not qWork.Eof do
    begin
      Rn.AddPosition(
        qWork.FieldByName('name').AsString,
        qWork.FieldByName('sum5').AsInteger,
        qWork.FieldByName('sum10').AsInteger,
        qWork.FieldByName('sum20').AsInteger,
        qWork.FieldByName('sum50').AsInteger
        );
      qWork.Next;
    end;
    qWork.Close;
    Rn.PutToExcel(0);
  finally
    Rn.Free;
  end;
end;

procedure TTalonPrihRefForm.sbClearIDClick(Sender: TObject);
begin
  if not edNum.Enabled then exit;
  edNum.Clear;
end;

procedure TTalonPrihRefForm.sbClearOperClick(Sender: TObject);
begin
  if not edOper.Enabled then exit;
  edOper.Clear;
end;

procedure TTalonPrihRefForm.edOperButtonClick(Sender: TObject);
Var
  OperTypeRefForm : TOperTypeRefForm;
begin
  Application.CreateForm(TOperTypeRefForm, OperTypeRefForm);
  OperTypeRefForm.SGrpId := 14;
  OperTypeRefForm.ShowModal;
  If OperTypeRefForm.ModalResult = mrOk Then
  Begin
    edOper.Text := OperTypeRefForm.qName.AsString;
    edOper.Tag  := OperTypeRefForm.qId.AsInteger;
  End;
  OperTypeRefForm.Free;
end;

procedure TTalonPrihRefForm.NFilial_Click(Sender: TObject);
var
  F: TfrmThirdPartyPrint;
  vFrom,vTo,AddProgress: integer;
begin
  if q.IsEmpty then exit;
  vFrom:=MAIN_ORG.INST;
  if INST_FIL=0 then
    vTo:=INST_OLD
  else
    vTo:=INST_FIL;

  F:=TfrmThirdPartyPrint.Create(Application);
  F.pnlDoc.Visible:=False;
  F.pnlOrgs.Visible:=False;
  F.pnlPrintAll.Visible:=False;
  F.Label5.Visible:=False;
  F.edNumOfCopy.Visible:=False;
  F.sbUpDown.Visible:=False;
  F.chSaveTo.Visible:=False;
  F.deSaveTo.Visible:=False;
  F.Panel1.Height:=F.Panel1.Height div 2 +4;
  SetPrevMonth(F.deBeginDate,F.deEndDate);
  //SetCurrentMonth(F.deBeginDate,F.deEndDate);
  F.cbOutputType.Items.Delete(0);
  F.cbOutputType.ItemIndex:=0;
  F.ModalResultOnly:=True;

  if F.ShowModal<>mrOk then exit;  //вказуємо дати
    
  // перевіряємо договора між юр.особою та Авіасом
  _OpenQueryPar(qDogFil,
      ['from_id',  vFrom,
       'to_id',    AVIAS_INST,
       'FromDate', F.deBeginDate.Date,
       'ToDate',   F.deEndDate.Date]);
  if qDogFil.FieldByName('dog_date').IsNull then
    begin
      MessageDlg(Format('За вказаний період не знайдено талонного договору між %s і %s!'+#13#10+
                        'Необхідно завести один талонний договір на останній день місяця. Позиції договору вибрати будь-які.',
                        [GetOrgName(vFrom,vFrom),GetOrgName(AVIAS_INST,AVIAS_INST)]),
                 mtError, [mbCancel], 0);
      exit;
    end
  else if qDogFil.RecordCount>1 then
    raise exception.create(Format(TranslateText('Найдено больше одного талонного договора между %s и %s'),
                                  [GetOrgName(vFrom,vFrom),GetOrgName(AVIAS_INST,AVIAS_INST)]));
  F.deBeginDate.Enabled := False;  // дізейблимо поля дат
  F.deEndDate.Enabled := False;
  F.cbOutputType.Enabled := False;
  _OpenQueryPar(qTalonGetPrice,  //обчислюємо середні ціни за місяць по талоном та пропонуємо їх
      ['BeginDate',    F.deBeginDate.Date,
       'EndDate',      F.deEndDate.Date,
       'obl_id',       vFrom]);

  F.dbgNpgPrice.DataSource := dsTalonGetPrice;
  F.pNpgPriceGrid.Visible := true;   //даємо звірям можливість редагувати середні ціни по талонах для видаткових
  F.bbPrint.Caption := '&Продовжити';
  F.bbPrint.Font.Color := clNavy;

  if F.ShowModal<>mrOk then exit;  //редагують та тиснуть на "Продовжити" (ціни записуються в ov.SetTalonNpgPrice())

  Application.CreateForm(TProgrForm, ProgrForm);
  try
    ProgrForm.Show;
    ProgrForm.Refresh;
    // выбираем все НБ на котрорые уходят бланки талонов
    // На рисунке прогрессбара показываем сколько записей в квере после ее открытия
    WRITE_LOG(TranslateText('Начинаем открывать запросы '));
    ProgrForm.Image.ShowHint:=true;
    ProgrForm.AddProgress(5);
    _OpenQueryPar(qTalonBlanks,
      ['BeginDate',    F.deBeginDate.Date,
       'EndDate',      F.deEndDate.Date,
       'obl_id',       vFrom]);
    WRITE_LOG(TranslateText('qTalonBlanks выдал ')+IntToStr(qTalonBlanks.RecordCount));
    ProgrForm.Image.Hint:=IntToStr(qTalonBlanks.RecordCount);
    ProgrForm.AddProgress(12);
    _OpenQueryPar(qTalonFilRN,
      ['BeginDate',    F.deBeginDate.Date,
       'EndDate',      F.deEndDate.Date,
       'obl_id',       vFrom]);
    WRITE_LOG(TranslateText('qTalonFilRN выдал ')+IntToStr(qTalonFilRN.RecordCount));
    ProgrForm.Image.Hint:=IntToStr(qTalonFilRN.RecordCount);
    _OpenQueryPar(qTalonRN,
      ['BeginDate',    F.deBeginDate.Date,
       'EndDate',      F.deEndDate.Date,
       'obl_id',       vFrom]);
    WRITE_LOG(TranslateText('qTalonRN выдал ')+IntToStr(qTalonRN.RecordCount));
    ProgrForm.Image.Hint:=IntToStr(qTalonRN.RecordCount);
    ProgrForm.AddProgress(12);
    _OpenQueryPar(qTalonFilReestr,
      ['BeginDate',    F.deBeginDate.Date,
       'EndDate',      F.deEndDate.Date,
       'obl_id',       vFrom,
       'dep_id',       null]);
    WRITE_LOG(TranslateText('qTalonFilReestr выдал ')+IntToStr(qTalonFilReestr.RecordCount));
    ProgrForm.Image.Hint:=IntToStr(qTalonFilReestr.RecordCount);
    ProgrForm.AddProgress(12);
    _OpenQueryPar(qTalonReestr,
      ['BeginDate',    F.deBeginDate.Date,
       'EndDate',      F.deEndDate.Date,
       'obl_id',       vFrom,
       'dep_id',       null]);
    WRITE_LOG(TranslateText('qTalonReestr выдал ')+IntToStr(qTalonReestr.RecordCount));
    ProgrForm.Image.Hint:=IntToStr(qTalonReestr.RecordCount);
    ProgrForm.AddProgress(12);
    _OpenQueryPar(qTalonFilReestrDop,
      ['BeginDate',    F.deBeginDate.Date,
       'EndDate',      F.deEndDate.Date,
       'dep_id',       vFrom]);
    WRITE_LOG(TranslateText('qTalonFilReestrDop выдал ')+IntToStr(qTalonFilReestrDop.RecordCount));
    ProgrForm.Image.Hint:=IntToStr(qTalonFilReestrDop.RecordCount);
    ProgrForm.AddProgress(12);
    _OpenQueryPar(qTalonReestrDop,
      ['BeginDate',    F.deBeginDate.Date,
       'EndDate',      F.deEndDate.Date,
       'dep_id',       vFrom]);
    WRITE_LOG(TranslateText('qTalonReestrDop выдал ')+IntToStr(qTalonReestrDop.RecordCount));
    ProgrForm.Image.Hint:=IntToStr(qTalonReestrDop.RecordCount);
    ProgrForm.AddProgress(12);
    _OpenQueryPar(qBlankReestrDop,
      ['BeginDate',    F.deBeginDate.Date,
       'EndDate',      F.deEndDate.Date,
       'dep_id',       vFrom]);
    WRITE_LOG(TranslateText('qBlankReestrDop выдал ')+IntToStr(qBlankReestrDop.RecordCount));
    ProgrForm.Image.Hint:=IntToStr(qBlankReestrDop.RecordCount);
    ProgrForm.AddProgress(12);
    AddProgress:= (100-20) div (1-trunc(F.deBeginDate.Date) + trunc(F.deEndDate.Date));

    PrintTalonFilDocs(F.deBeginDate.Date, F.deEndDate.Date, vFrom, AVIAS_INST, false, F.cbOutputType.ItemIndex=0,);
    _OpenQueryPar(qDogFil,
      ['from_id',  AVIAS_INST,
       'to_id',    vTo,
       'FromDate', F.deBeginDate.Date,
       'ToDate',   F.deEndDate.Date]);
    if qDogFil.RecordCount > 1 then
      raise exception.create(Format(TranslateText('Найдено больше одного талонного договора между %s и %s'),
                                  [GetOrgName(AVIAS_INST,AVIAS_INST),GetOrgName(vTo,vTo)]));
    if not qDogFil.FieldByName('dog_date_t').IsNull then
      PrintTalonFilDocs(F.deBeginDate.Date, F.deEndDate.Date, AVIAS_INST, vTo, true, F.cbOutputType.ItemIndex=0);

    showmessage(TranslateText('Документы сохранены в папке ')+GetMainDir+TranslateText('Doc\Талоны - Филиальный пакет'));
  finally
    ProgrForm.Free;
  end;
end;

procedure TTalonPrihRefForm.PrintSumTalons(
  p_List:Variant;
  p_FirstLine: integer;
  p_Q: TOilQuery;
  p_FieldList: string;
  p_dep_inst: integer = -1;  // если -1 выводим все, если нет, то только записи с этим инстом
  p_SumPropis: Boolean = false;
  p_Date: TDateTime = 0
  );
var
  i: integer;
  SumWithNds,SumNoNds,SumNds,LastValue: real;
begin
  with p_Q do begin
    First; i:=p_FirstLine;
    SumWithNds:=0; SumNoNds:=0; SumNDS:=0;LastValue:=0;
    while not Eof do begin
      if (p_dep_inst = -1) or (p_Q['dep_inst'] = p_dep_inst) then begin
          p_List.Rows[i+1].EntireRow.Insert;
          PutArrayToExcel(p_List,i,2,FieldValues[p_FieldList]);
          LastValue:=nvl(FieldValues['sumxnds'],0);
          SumWithNds:=SumWithNds+nvl(FieldValues['sumnds'],0);
          SumNoNds:=SumNoNds+nvl(FieldValues['sumXnds'],0);
          SumNDS:=SumNds+nvl(FieldValues['nds'],0);
          inc(i)
      end;
      Next;
    end;
    
    if p_Date<>0 then
      SumNDS := GetNds_WithNds(SumWithNds, p_Date);
    p_List.Cells[i-1,'F']:=LastValue+SumWithNds-SumNds-SumNoNds; //корекція останньої позиції
    if p_Date<>0 then
      SumNoNds := GetNoNds_WithNds(SumWithNds, p_Date, 2);

    p_List.Cells[i+3,'F']:=SumWithNds;
    p_List.Cells[i+2,'F']:=SumNDS;
    p_List.Cells[i+1,'F']:=SumNoNds;
    if p_SumPropis then
      ExFormat(p_List,i+5,'B',[Money2Words(SumWithNds)]);
  end;
end;

procedure TTalonPrihRefForm.PrintDopSoglRekv(p_Q: TOilQuery; p_FirstLine: integer; p_Column: string;p_List:variant);
begin
  p_List.Cells[p_FirstLine,p_Column]:=p_Q.FieldByName('name').AsString;
  p_List.Cells[p_FirstLine+1,p_Column]:=p_Q.FieldByName('addr').AsString;
  p_List.Cells[p_FirstLine+2,p_Column]:=LangText('R/S')+' '+p_Q.FieldByName('rach_chet').AsString;
  p_List.Cells[p_FirstLine+3,p_Column]:=TranslateText('в ')+p_Q.FieldByName('bank_name').AsString;
  p_List.Cells[p_FirstLine+4,p_Column]:=TranslateText('МФО ')+p_Q.FieldByName('mfo').AsString;
  p_List.Cells[p_FirstLine+5,p_Column]:=TranslateText('Код ')+LangText('EDRPOU')+p_Q.FieldByName('id_num').AsString;
  p_List.Cells[p_FirstLine+6,p_Column]:=LangText('INN')+' '+p_Q.FieldByName('nal_num').AsString;
  p_List.Cells[p_FirstLine+7,p_Column]:=LangText('Sv_plat_NDS_NUM')+p_Q.FieldByName('svid_num').AsString;
  p_List.Cells[p_FirstLine+9,p_Column]:=p_Q.FieldByName('boss').AsString;
end;

procedure TTalonPrihRefForm.PrintRashNakHead(
  p_List:Variant;
  qFrom,qTo,qDog: TOilQuery;
  p_DocNum: string;
  p_Date: TDateTime;
  p_nb_name:string='');
begin
  ExFormat(p_List,'C1',[qFrom['name']]);
  ExFormat(p_List,'B2',[qFrom['addr']]);
  ExFormat(p_List,'C3',[qFrom['rach_chet'],qFrom['mfo']]);
  ExFormat(p_List,'B4',[qFrom['svid_num']]);
  ExFormat(p_List,'B5',[qFrom['nal_num']]);
  ExFormat(p_List,'B7',[p_DocNum,p_Date]);
  ExFormat(p_List,'C10',[qTo['name']]);
  ExFormat(p_List,'B13',[qTo['svid_num']]);
  ExFormat(p_List,'B14',[qTo['nal_num']]);
  //если РН талонная и у головной орг. несколько НБ то дописываем название НБ
  if(p_nb_name<>'')then
  begin
    ExFormat(p_List,'C15',[qDog['dog_t'],qDog['dog_date_t']]);
    ExFormat(p_List,'B17',[p_DocNum,p_Date])  ;
    ExFormat(p_List,'B18',[p_nb_name])
  end
  else
  begin
    ExFormat(p_List,'C15',[qDog['dog'],qDog['dog_date']]);
    ExFormat(p_List,'B17',[p_DocNum,p_Date]);
  end;
end;

procedure TTalonPrihRefForm.PrintTalonFilDocs(
             p_BeginDate,p_EndDate: TDateTime;
             p_FromInst, p_ToInst: integer;
             IsBlanksToPrint: boolean;
             p_Printer: Boolean=FALSE
             );
const
  prefix = 'франко-склад ';
var
  qFrom,qTo,qTalRN,qTalReestr,qTalReestrDop: TOilQuery;
  vFrom,vTo,DocNum,NNId,NNInst,NNId_T,NNInst_T: integer;
  XLApp,List: Variant;
  StartDate: TDateTime;
  s: string;
  i,j,cntList,cntNB: integer;
  IsSeveralNB : boolean;
  Filter: string;
  FileName: string;
  NBList:
    record
      id,name :TStringList;
    end;
  //****************************************************************************
  procedure PrintRashNak;
  begin
    PrintRashNakHead(List,qFrom,qTo,TOilQuery(qDogFil),IntToStr(DocNum),p_EndDate);
    PrintSumTalons(List,22,qTalRN,'np_group_full;dim_name;litr;pricexnds;sumxnds',-1,true,p_EndDate);
  end;
  //****************************************************************************
  procedure PrintRashNakTal;
  begin
    PrintRashNakHead(List,qTo,qFrom,TOilQuery(qDogFil),IntToStr(DocNum)+TranslateText('тл'),p_EndDate,prefix+NBList.name.Strings[cntNB]);
    PrintSumTalons(List,22,qTalonBlanks,'tal_one_name;dim_name;co;price;sumxnds',StrToInt(NBList.id.Strings[cntNB]),true,p_EndDate);
  end;
  //****************************************************************************
  procedure PrintDopSogl;
  begin
    ExFormat(List,'C2',[qDogFil['dog'],qDogFil['dog_date']]);
    ExFormat(List,'F3',[p_EndDate]);
    ExFormat(List,'A5',[qFrom['name'],qFrom['dogovor'],qTo['name'],qTo['dogovor']]);
    SetRowHeight(List,5,1,95);
    ExFormat(List,'A7',[p_EndDate]);
    PrintSumTalons(list,13,qTalRN,'np_group_full;dim_name;litr;pricexnds;sumxnds',-1,false,p_EndDate);
    PrintDopSoglRekv(qFrom,21+qTalRN.RecordCount,'A',List);
    PrintDopSoglRekv(qTo,21+qTalRN.RecordCount,'D',List);
  end;
  //****************************************************************************
  procedure PrintActTalon;
  begin
    List.Cells[1,'C']:=TranslateText('АКТ №')+IntToStr(DocNum)+TranslateText('тл');
    ExFormat(List,'A3',[p_EndDate]);
    ExFormat(List,'A4',[qTo['name'],qFrom['name']]);
    ExFormat(List,'A6',[p_EndDate,qTo['name'],qTo['dogovor'],qFrom['name'],qFrom['dogovor']]);
    SetRowHeight(List,6,1,95);
    ExFormat(List,'A22',[IntToStr(DocNum)+TranslateText('тл'),p_EndDate]);
    ExFormat(List,'A31',[qTo['name']]);
    ExFormat(List,'C31',[qFrom['name']]);
    ExFormat(List,'A34',[qTo['boss']]);
    ExFormat(List,'C34',[qFrom['boss']]);
    if(IsSeveralNB)then
      ExFormat(List,'A8',[TranslateText(' на ')+prefix+NBList.name.Strings[cntNB]])
    else
      ExFormat(List,'A8',['']);
    PrintSumTalons(List,14,qTalonBlanks,'tal_one_name;dim_name;co;price;sumxnds',StrToInt(NBList.id.Strings[cntNB]),false,p_EndDate);
  end;
  //****************************************************************************
  procedure PrintReestr;
  var
    n,i,j{,cntNB}: integer;
    CurNpg,col{,sLitr}: string;
    SumCo,SumNo:integer;   //суммы по количеству и по номиналу
  begin
    SumCo:= 0; SumNo := 0;
    //шапка
    ExFormat(List,'D2',[DocNum]);
    ExFormat(List,'D4',[DocNum,p_EndDate]);
    ExFormat(List,'D5',[qDogFil['dog'],qDogFil['dog_date']]);
    // реестр
    n := 8;
    {for cntNB := 0 to NBList.id.count - 1 do
    begin
      qTalReestr.Filtered:=false;
      qTalreestr.Filter:=Filter+' and dep_inst='+NBList.id.Strings[cntNB];
      qTalReestr.Filtered:=true;

      //пишем разделитель-НБ если орг с НБ
      if IsSeveralNB then
      begin
        List.Cells[n,'A']:=prefix + NBList.name.Strings[cntNB];
        List.Range[GetExcelRange(n,1,n,9)].Font.Bold:=True;
        List.Range[GetExcelRange(n,1,n,9)].HorizontalAlignment := xlCenter;
        List.Range[GetExcelRange(n,1,n,9)].VerticalAlignment := xlCenter;
        List.Range[GetExcelRange(n,1,n,9)].WrapText := True;
        List.Range[GetExcelRange(n,1,n,9)].Orientation := 0;
        List.Range[GetExcelRange(n,1,n,9)].AddIndent := False;
        List.Range[GetExcelRange(n,1,n,9)].IndentLevel := 0;
        List.Range[GetExcelRange(n,1,n,9)].ShrinkToFit := False;
        List.Range[GetExcelRange(n,1,n,9)].ReadingOrder := xlContext;
        List.Range[GetExcelRange(n,1,n,9)].MergeCells := True;
        List.Range[GetExcelRange(n,1,n,9)].RowHeight := 30;
        DrawNetInExcel(List,1,9,n,n);
        inc(n);
      end; 
    end;}
    
    n:=PuTOilQueryToExcelEnh(XLApp,List,qTalReestr,n,nil,0,
       'por_number;np_group\i;date_;azs_name;nominal\i;ser;num;co\s;litr\s');
    qTalReestr.First;
    dec(n);
    while not(qTalReestr.eof)do
      begin
        SumNo := SumNo + qTalReestr['litr'];
        SumCo := SumCo + qTalReestr['co'];
        qTalReestr.Next;
      end;

    // пишем ВСЕГО по разделу
    if NBList.id.count > 0 then
    begin
      DrawNetInExcel(List,1,9,n,n);
      List.Cells[n,'A'] := LangText('VSEGO_po_razdely');
      List.Cells[n,'H'] := SumCo;
      List.Cells[n,'I'] := SumNo;
      List.Range[GetExcelRange(n,1,n,9)].Font.Bold:=TRUE;
    end;

    //табличка "Количество карточек по отчету"
    n:=n+2;
    List.Range[GetExcelRange(n,2,n,7)].Merge;
    List.Cells[n,'B']:=LangText('Kolichestvo_talonov_po_otchety');
    List.Cells[n+1,'B']:=LangText('Vid_GSM');
    List.Cells[n+1,'C']:=TranslateText('Ном 5');
    List.Cells[n+1,'D']:=TranslateText('Ном 10');
    List.Cells[n+1,'E']:=TranslateText('Ном 20');
    List.Cells[n+1,'F']:=TranslateText('Ном 50');
    List.Cells[n+1,'G']:=LangText('Vsego');
    List.Range[GetExcelrange(n,2,n+1,7)].HorizontalAlignment:=xlCenter;
    List.Range[GetExcelrange(n,2,n+1,7)].Interior.ColorIndex:=34;

    with qTalReestrDop do begin
      First; i:=n+1; CurNpg:='';
      while not Eof do begin
        if CurNpg<>FieldValues['np_group'] then begin
          inc(i);
          CurNpg:=FieldValues['np_group'];
          List.Cells[i,'B']:=CurNpg;
        end;
        case FieldValues['nominal'] of
           5: col:='C';
          10: col:='D';
          20: col:='E';
          50: col:='F';
        end;
        List.Cells[i,col]:=FieldByName('co').AsInteger;
        Next;
      end;
    end;

    List.Cells[i+1,'B']:=LangText('Itogo');
    List.Cells[i+1,'B'].Font.Bold:=TRUE;

    for j:=3 to 7 do
      List.Cells[i+1,j].Formula:='=SUM('+GetExcelRange(n+2,j,i,j)+')';
    for j:=n+2 to i do
      List.Cells[j,'G'].Formula:='=SUM('+GetExcelRange(j,3,j,6)+')';

    List.Range[GetExcelRange(i+1,3,i+1,6)].Font.Bold:=TRUE;
    List.Range[GetExcelRange(n+2,6,i+1,7)].Font.Bold:=TRUE;
    DrawNetInExcel(List,2,7,n,i+1);
    List.Cells[8,'A'].AutoFilter;
  end;
  //****************************************************************************
  function NeedToSaveNN(p_talon:boolean = false): Boolean;
  begin
    result:=False;
    try
    WRITE_LOG(Format(TranslateText('запущен NeedToSaveNN(%s)'),[BoolTo_(p_talon,'true','false')]));
    case p_talon of
      FALSE :
        begin
          if qTalRN.RecordCount<>qNNFil.RecordCount then begin
            result:=TRUE;
            exit;
          end;
          qTalRN.First;
          qNNFil.First;
          while not qTalRN.Eof do begin
            if (qTalRN['np_group_id']<>qNNFil['tov_id']) or
               (qTalRN['price']<>qNNFil['price_nds']) or
               (qTalRN['litr']<>qNNFil['co'])
            then
            begin
              result:=TRUE;
              exit;
            end;
            qTalRN.Next;
            qNNFil.Next;
          end;
        end;
      TRUE :
        begin
          if qBlankReestrDop.RecordCount<>qNNFil.RecordCount then begin
            result:=True;
            exit;
          end;
          qBlankReestrDop.First;
          qNNFil.First;
          while not qBlankReestrDop.Eof do begin
            if (qBlankReestrDop['co']<>qNNFil['co']) or
               (qBlankReestrDop['price']<>qNNFil['price_nds']) or
               (StringReplace(AnsiStrUpper(PChar(qBlankReestrDop.FieldByName('tal_one_name').AsString)),' ','',[rfReplaceAll])
              <>StringReplace(AnsiStrUpper(PChar(qNNFil.FieldByName('tov_full').AsString)),' ','',[rfReplaceAll]))
            then
            begin
              result:=TRUE;
              exit;
            end;
            qTalRN.Next;
            qNNFil.Next;
          end;
        end;
      ELSE
        result:=True;
    end;//case
    finally
      WRITE_LOG(Format('  result=%s',[BoolTo_(result,'true','false')]));
    end;
  end;
  //****************************************************************************
  function GetTalonNpType(p_series:Variant):Variant;
  var
    v_res : Variant ;
  begin
    v_res := GetSqlValuePar('select id from v_oil_np_type where np_grp = 74'
      +' and name like ''%''||:ser||''%''',
      ['ser'],
      [ftString],
      [p_series]);
    IF null = v_res then
    begin
      result := -1;
      raise Exception.Create(TranslateText('ОШИБКА GetTalonNpType: не найден тип ')+
        TranslateText('нефтепродукта соответствующий талону "')+p_series+'"!');
    end
    ELSE
      result := v_res;
  end;
  //****************************************************************************
  procedure SaveNN(p_talon:boolean = false);
  var
    v_NNId,v_NNInst:integer;
    v_FDog:string;
    vNum: integer;
  begin
    WRITE_LOG(TranslateText('Сохраняем налоговую (талонная ')+BoolToDaNet(p_talon)+')');
    if qNNFil.RecordCount=0 then begin
      v_NNId:=GetSeqNextVal('S_OIL_SALE_BOOK');
      v_NNInst:=MAIN_ORG.INST;
      if p_talon then
        v_FDog := Format(LangText('Soglastno_dogovora')+' %s '+LangText('Ot')+' %s',[qDogFil['dog_t'],qDogFil['dog_date_t']])
      else
        v_FDog := Format(LangText('Soglastno_dogovora')+' %s '+LangText('Ot')+' %s',[qDogFil['dog'],qDogFil['dog_date']]);
      StartSqlOra;
      if p_Talon then vNum:=GetSeqNextVal('ANDRIY.NAL_NAKL_NUM')
      else vNum:=GetSeqNextVal('NAL_NAKL_NUM');
      InsOrUpdRecord('OIL_SALE_BOOK',
        ['ID',                 v_NNId,
         'STATE',              'Y',
         'INST',               v_NNInst,
         'S_DATE',             p_EndDate,
         'ORGAN',              BoolTo_(p_talon,vFrom,vTo),
         'ORGAN_INST',         BoolTo_(p_talon,vFrom,vTo),
         'NUM',                vNum,
         'F_DOC',              v_FDog,
         'FRASCH',             TranslateText('Оплата ')+LangText('s')+LangText('R/S'),
         'R_DATE',             p_EndDate,
         'FROM_',              BoolTo_(p_talon,vTo,vFrom),
         'FROM_INST',          BoolTo_(p_talon,vTo,vFrom),
         'NAL_T',              10,  // тип "Талонная накладная между филиалом и его предком"
         'NN_CAUSE_ID',        BoolTo_(p_talon,19,7), //7 ~ Талоны (Переход на филиал); 19 ~ Талоны (Переход на филиал,бланки)
         'NN_TYPE_ID',         2    //тип "Відгрузка"
        ]);
    end else begin
      if p_talon then
      begin
        v_NNId:=NNId_T;
        v_NNInst:=NNInst_T;
      end
      else
      begin
        v_NNId:=NNId;
        v_NNInst:=NNInst;
      end;
      _ExecSqlOra(
        Format('update oil_sale_book_det set state=''N'' where nn_id=%d and nn_inst=%d',[v_NNId,v_NNInst]));
    end;
    case p_talon of
      TRUE :
        begin
          with qBlankReestrDop do begin
            First;
            while not Eof do begin
              Write_Log(TranslateText('Передаваемая цена c НДС ')+FieldByName('pricends').AsString+TranslateText(' без НДС ')+FieldByName('price').AsString);
              Write_Log(TranslateText('Передаваемая сумма c НДС ')+FieldByName('sumnds').AsString+TranslateText(' без НДС ')+FieldByName('sumxnds').AsString+TranslateText(' ндс ')+ FieldByName('nds').AsString);
              //qBlankReestrDop.paramByName('date_').AsString;
              InsOrUpdRecord('OIL_SALE_BOOK_DET',
                ['ID',             GetSeqNextVal('S_OIL_SALE_BOOK_DET'),
                 'STATE',          'Y',
                 'INST',           v_NNInst,
                 'NN_ID',          v_NNId,
                 'NN_INST',        v_NNInst,
                 'NDS_T',          FieldValues['sumnds'],
                 'NDS_P_BASE',     FieldValues['sumxnds'],
                 'NDS_P_20',       FieldValues['nds'],
                 'TOV_ID',         GetTalonNpType(FieldValues['ser']),
                 'DIV_ID',         19, // ед.изм.штука
                 'KOL',            FieldValues['co'],
                 'PRICE_NDS',      FieldValues['pricends']
                ]);       
              Next;
            end;
          end;
          NNInst_T := v_NNInst;
          NNId_T := v_NNId;
        end;
      FALSE:
        begin
          with qTalRN do begin
            First;
            while not Eof do begin
              Write_Log(TranslateText('Передаваемая сумма c НДС ')+FieldByName('sumnds').AsString+TranslateText(' без НДС ')+FieldByName('sumxnds').AsString+TranslateText(' ндс ')+ FieldByName('nds').AsString);
              InsOrUpdRecord('OIL_SALE_BOOK_DET',
                ['ID',             GetSeqNextVal('S_OIL_SALE_BOOK_DET'),
                 'STATE',          'Y',
                 'INST',           v_NNInst,
                 'NN_ID',          v_NNId,
                 'NN_INST',        v_NNInst,
                 'NDS_T',          FieldValues['sumnds'],
                 'NDS_P_BASE',     FieldValues['sumxnds'],
                 'NDS_P_20',       FieldValues['nds'],
                 'TOV_ID',         FieldValues['np_group_id'],
                 'DIV_ID',         28, // ед.изм.литры
                 'KOL',            FieldValues['litr'],
                 'PRICE_NDS',      FieldValues['price']
                ]);
              Next;
            end;
          end;
          NNInst := v_NNInst;
          NNId := v_NNId;
        end;
      end;//case

    CommitSqlOra;
  end;
  //****************************************************************************
  procedure PrintNN(NNId,NNInst:integer);
  var TaxBill: TdmTaxBill;
  begin
    WRITE_LOG(Format(TranslateText('Печатаем налоговую (id=%d,inst=%d)'),[NNId,NNInst]));
    TaxBill := TdmTaxBill.Create;
    try
     with TaxBill do
     begin
        Options.IsCustomPrintSettings:=True;
        Options.Output:=ToScreen;
        Options.PrintSettings.NumOfCopy:=0;
        Excel := TMsExcel.Create(XLApp,List,p_EndDate,tpNN);
        GetTaxBillByNN(NNId,NNInst);
      end;
    finally
      TaxBill.Free;
    end;
  end;
  //****************************************************************************
  procedure NNToPrinter(p_Num: integer);
  var vList: Variant;
  begin
    vList:=XLApp.ActiveWorkbook.Worksheets[p_Num];
    vList.Cells[2,'L']:='';
    vList.Cells[3,'L']:='X';
    vList.PrintOut;
    vList.Cells[2,'L']:='X';
    vList.Cells[3,'L']:='';
    vList.PrintOut;
  end;
  //****************************************************************************
  procedure DocsToPrinter;
  var i,j: integer;
  begin
    if qTalRN.RecordCount>0 then begin
      for i:=1 to 3 do
        for j:=1 to 2 do
          XLApp.ActiveWorkBook.Worksheets[i].PrintOut;
      NNToPrinter(4);
    end;
    if qTalonBlanks.RecordCount>0 then begin
      for i:=5 to cntList-1 do
        for j:=1 to 2 do
          XLApp.ActiveWorkBook.Worksheets[i].PrintOut;
      NNToPrinter(cntList);
    end;
  end;
  //****************************************************************************
  procedure FilterSql(p_Q: TOilQuery);
  begin
    p_Q.Filtered:=false;
    p_Q.Filter:=Filter;
    p_Q.Filtered:=true;
  end;
  //****************************************************************************
  procedure DefineFileName;
  var s,CurDir: string;
  begin
    CurDir:=GetMainDir+'Doc\Талоны - Филиальный Пакет';
    if not DirectoryExists(CurDir) then
      CreateDir(CurDir);

    if INST_FIL=0 then CurDir:=CurDir+TranslateText('\Филиал')
                  else CurDir:=CurDir+TranslateText('\ОАО');
    if not DirectoryExists(CurDir) then
      CreateDir(CurDir);
    s:=DateToStr(p_EndDate);
    FileName:=copy(s,7,4)+'-'+copy(s,4,2)+'-'+copy(s,1,2)+'.xls';
    if IsBlanksToPrint then
      FileName := 'Blanks_'+ FileName;
    FileName := CurDir+'\'+ FileName;
  end;
  //****************************************************************************
begin
  if IsBlanksToPrint then
    begin
      qTalRN := qTalonFilRN;
      qTalReestr := qTalonFilReestr;
      qTalReestrDop := qTalonFilReestrDop;
    end
  else
    begin
      qTalRN := qTalonRN;
      qTalReestr := qTalonReestr;
      qTalReestrDop := qTalonReestrDop;
    end;
  DefineFileName;
  WRITE_LOG(TranslateText('Начало PrintTalonFilDocs на ')+DateToStr(p_BeginDate) +TranslateText(' на принтер ')+ BoolToDaNet(p_Printer));
  WRITE_LOG(TranslateText('Чтение параметров'));
  s:=ReadOilVar('INST_FIL_DATE');
  if s<>'' then begin
    StartDate:=StrToDate(s);
  end else if INST_MOVE_DATE<>'' then begin
    StartDate:=StrToDate(INST_MOVE_DATE);
  end else
    raise exception.create(TranslateText('Отсутствуют переменные INST_MOVE_DATE или FIL_START_DATE!!! Обратитесь к разработчикам'));
  vFrom := p_FromInst;
  vTo := p_ToInst;

  qFrom:=TOilQuery.Create(nil);
  qTo:=TOilQuery.Create(nil);
  qFrom.Session:=frmStart.OraSession1;
  qTo.Session:=frmStart.OraSession1;
  try
    WRITE_LOG(TranslateText('Чтение организаций'));
    GetOrgData(qFrom,vFrom,vFrom);
    GetOrgData(qTo,vTo,vTo);
    DocNum:=trunc(p_BeginDate)-trunc(StartDate)+1;

    Filter:='1=1';

    // выбираем все НБ на котрорые уходят бланки талонов
    if not qTalonBlanks.IsEmpty then
    begin
      qTalonBlanks.First;
      j := qTalonBlanks.FieldByName('dep_inst').AsInteger;
      IsSeveralNB := False;
      NBList.id := TStringList.Create;
      NBList.name := TStringList.Create;
      NBList.id.Add ( IntToStr(j));
      NBList.name.Add ( qTalonBlanks.FieldByName('dep_name').AsString);

      while not(qTalonBlanks.Eof) do
      begin
        qTalonBlanks.Next;
        if qTalonBlanks['dep_inst'] <> j then
        begin
          IsSeveralNB := True;
          NBList.id.Add(qTalonBlanks['dep_inst']);
          NBList.name.Add ( qTalonBlanks.FieldByName('dep_name').AsString);
          j := qTalonBlanks.FieldByName('dep_inst').AsInteger;
        end;
        if qTalonBlanks['dep_inst'] <> vFrom then
          IsSeveralNB := True;
      end;
    end
    else
    begin
      qTalReestr.First;
      j := qTalReestr.FieldByName('dep_inst').AsInteger;
      IsSeveralNB := False;
      NBList.id := TStringList.Create;
      NBList.name := TStringList.Create;
      NBList.id.Add ( IntToStr(j));
      NBList.name.Add ( qTalReestr.FieldByName('dep_name').AsString);      
      if (NBList.id.Count=1) and (NBList.name.count=1)then
      while not(qTalReestr.Eof) do
      begin
        qTalReestr.Next;
        if qTalReestr['dep_inst'] <> j then
        begin
          IsSeveralNB := True;
          NBList.id.Add(qTalReestr['dep_inst']);
          NBList.name.Add ( qTalReestr.FieldByName('dep_name').AsString);
          j := qTalReestr.FieldByName('dep_inst').AsInteger;
        end;
        if qTalReestr['dep_inst'] <> vFrom then
          IsSeveralNB := True;
      end;
    end;

    _OpenQueryPar(qNNFil,
      ['date_',        p_BeginDate,
       'from_id',      vFrom,
       'to_id',        vTo,
       'type_',        'G']);
    WRITE_LOG(Format(TranslateText('qNNFIL выдал %d'),[qNNFil.RecordCount]));

    if (qTalRN.RecordCount=0) and (qTalonBlanks.RecordCount=0) then exit;

    NNId:=decode([qNNFil.RecordCount,0,0,qNNFil['id']]);
    NNInst:=decode([qNNFil.RecordCount,0,0,qNNFil['inst']]);

    if NeedToSaveNN then SaveNN;

    _OpenQueryPar(qNNFil,
      ['date_',        p_BeginDate,
       'from_id',      vTo,
       'to_id',        vFrom,
       'type_',        'T']);

    NNId_T:=decode([qNNFil.RecordCount,0,0,qNNFil['id']]);
    NNInst_T:=decode([qNNFil.RecordCount,0,0,qNNFil['inst']]);

    if NeedToSaveNN(IsBlanksToPrint) then SaveNN(IsBlanksToPrint);

    ActivateXLApp('TalonFil','TalonFil',1,XLApp,List);

    if qTalRN.RecordCount>0 then begin

      //печать доп. соглашения
      WRITE_LOG(TranslateText('печать доп. соглашения'));
      PrintDopSogl;
      cntList := 2;

      //печать расходной
      WRITE_LOG(TranslateText('печать расходной'));
      List:=XLApp.ActiveWorkbook.WorkSheets[cntList];
      PrintRashNak;
      inc(cntList);

      //печать реестра отовареных талонов
      WRITE_LOG(TranslateText('печать реестра талонов с разделением на НБ'));
      XLApp.ActiveWorkbook.WorkSheets[cntList].Select;
      List:=XLApp.ActiveWorkbook.WorkSheets[cntList];
      PrintReestr;
      inc(cntList);

      //печать НН
      WRITE_LOG(TranslateText('печать НН'));
      XLApp.ActiveWorkbook.WorkSheets[cntList].Select;
      List:=XLApp.ActiveWorkbook.WorkSheets[cntList];
      PrintNN(NNId,NNInst);
      inc(cntList);
    end else begin  //Скрываем 1-ю часть пакета документов
      for i:=1 to 4 do
      begin
        XLApp.ActiveWorkbook.WorkSheets[i].Visible:=false;
        inc(cntList);
      end;
      inc(cntList);
    end;
    if (qTalonBlanks.RecordCount>0) and IsBlanksToPrint then
    begin
      for cntNB:=0 to NBList.id.Count-1 do
      begin
      // печать расходных по талонам для всех НБ в отдельности

        _OpenQueryPar(qDogFil,
        ['from_id',  vFrom,
         'to_id',    vTo,
         'FromDate', p_BeginDate,
         'ToDate',   p_EndDate]);

      if qDogFil.FieldByName('dog_date_t').IsNull then
        begin
          MessageDlg(Format('Не знайдено звичайного договору між %s і %s за вказаний період!'+#13#10+
                            'Необхідно завести один звичайний договір на останній день місяця. Позиції договору вибрати будь-що з групи "Талони ГСМ".',
                            [qFrom['name'],qTo['name']]),
                     mtError, [mbCancel], 0);
          exit;
        end
      else if qDogFil.RecordCount>1 then
        raise exception.create(Format(TranslateText('Найдено больше одного талонного договора между %s и %s'),
                                      [qFrom['name'],qTo['name']]));

        if(IsSeveralNB)and(cntNB<>NBList.id.Count-1)then
         begin
          XLApp.ActiveWorkbook.WorkSheets[cntList].Copy(XLApp.ActiveWorkbook.WorkSheets[cntList+2]);
          XLApp.ActiveWorkbook.WorkSheets[cntList+1].Copy(XLApp.ActiveWorkbook.WorkSheets[cntList+3]);
        end;
        WRITE_LOG(TranslateText('печать расходных по талонам'));
        XLApp.ActiveWorkbook.WorkSheets[cntList].Select;
        List:=XLApp.ActiveWorkbook.WorkSheets[cntList];
        PrintRashNakTal;
        inc(cntList);
        //печать актов по талонам для всех НБ в отдельности
        WRITE_LOG(TranslateText('печать актов по талонам'));
        XLApp.ActiveWorkbook.WorkSheets[cntList].Select;
        List:=XLApp.ActiveWorkbook.WorkSheets[cntList];
        PrintActTalon;
        inc(cntList);
      end;

      //печать НН по талонам
      WRITE_LOG(TranslateText('печать НН по талонам'));
      XLApp.ActiveWorkbook.WorkSheets[cntList].Select;
      List:=XLApp.ActiveWorkbook.WorkSheets[cntList];
      PrintNN(NNId_T,NNInst_T);

    end else begin  //Скрываем 2-ю часть пакета документов
      for i:=5 to 7 do
        XLApp.ActiveWorkbook.WorkSheets[i].Visible:=false;
    end;

    if FileExists(filename) then DeleteFile(filename);
    XLApp.ActiveWorkbook.SaveAs(filename);

    if p_Printer then DocsToPrinter;
    XLApp.DisplayAlerts := FALSE;
    //XLApp.ActiveWorkBook.Close;
  finally
    qFrom.Free;
    qTo.Free;
  end;
end;
//==============================================================================
procedure TTalonPrihRefForm.Write_Log(s: string);
begin
  if not SysParamExists('TALONPRIHLOG') then exit;
  ExFunc.log('TALONPRIHLOG.log',FormatDateTime('dd.mm.yyyy hh:nn:ss',now())+' '+s);
end;

procedure TTalonPrihRefForm.miDocAlienAZS_Click(Sender: TObject);
var
  F: TfrmThirdPartyPrint;
  i,Numb: integer;
  qFrom,qTo: TOilQuery;
begin
  if q.IsEmpty then exit;
  F:=TfrmThirdPartyPrint.Create(Application);
  qFrom := TOilQuery.Create(nil);
  qTo := TOilQuery.Create(nil);
  try
    F.pnlOrgs.Enabled:=False;
    F.edDep.Text:=GetOrgName(5542,1);
    F.edOrg.Text:=GetOrgName(99,99);
    F.edDocNumber.Text := TranslateText('<Введите номер>'); 
    F.Label2.Visible:=False;
    F.deDocDate.Visible:=False;
    F.sbAuto.Visible:=False;
    F.pnlPrintAll.Visible:=False;
    F.cbOutputType.Items.Delete(1);
    F.label5.Visible:=false;
    F.edNumOfCopy.Visible:=False;
    F.chSaveTo.Visible:=False;
    F.deSaveTo.Visible:=False;
    F.sbUpDown.Visible:=False;
    F.Panel1.Height:=35;

    SetPrevMonth(F.deBeginDate,F.deEndDate);
    F.ModalResultOnly:=True;
    if Debugging then begin
      F.deBeginDate.Date:=StrToDate('25.09.2005');
      F.deEndDate.Date:=StrToDate('25.09.2005');
    end;
    if F.ShowModal<>mrOk then exit;
    Numb:=StrToInt(F.edDocNumber.Text);
    qDogAlien.Close;
    _OpenQueryOra(qDogAlien);
    if(qDogAlien.IsEmpty)then
      raise Exception.Create(TranslateText('Необходимо создать талонный договор между Укртатнафтой и Альфа-Днепром !'));
    //Запрос для РН и доп соглашеня
    qTalonAlienRn.Close;
    _OpenQueryParOra(qTalonAlienRn,
      ['BeginDate',  F.deBeginDate.Date,
       'EndDate',    F.deEndDate.Date]);
    //Запрос для реестра
    qTalonAlienReestr.Close;
    _OpenQueryParOra(qTalonAlienReestr,
      ['BeginDate',  F.deBeginDate.Date,
       'EndDate',    F.deEndDate.Date]);
    GetOrgData(qFrom,5542,1);
    GetOrgData(qTo,99,99);
    for i := trunc(F.deBeginDate.Date) to trunc(F.deEndDate.Date) do
    begin
      PrintTalonAlienDocs(i,qFrom,qTo,numb,F.cbOutputType.ItemIndex=1);
      inc(numb);
    end;
  finally
    qDogAlien.Close;
    qTalonAlienRn.Close;
    f.free;
    qFrom.Close;
    qFrom.Free;
    qTo.Close;
    qTo.Free;
  end;
end;

procedure TTalonPrihRefForm.PrintTalonAlienDocs(p_Date: TDateTime;qFrom,qTo:TOilQuery;var p_number:integer;Saving:boolean=true);
var
  XLApp,List:Variant;
  dirname,filename,CurNpg,sLitr:string;
  SumCo,SumNo,i,j,n:integer;
  cnt:record
        five,ten,twenty,fifty:integer;
      end;
begin
  //Фильтруем запрос
  qTalonAlienRn.Filtered:=False;
  qTalonAlienRn.Filter:=format(' prih_date = ''%s'' ',[DateToStr(p_Date)]);
  qTalonAlienRn.Filtered:=True;

  qTalonAlienReestr.Filtered:=False;
  qTalonAlienReestr.Filter:=format(' prih_date = ''%s'' ',[DateToStr(p_Date)]);
  qTalonAlienReestr.Filtered:=True;

  if qTalonAlienRn.IsEmpty then
  begin
    ShowMessage(TranslateText('Нет данных на ')+DateToStr(p_Date));
    exit;
  end;
  //Открываем эксель
  ActivateXLApp('TalonFil','TalonFil',1,XLApp,List);
  List:=XLApp.ActiveWorkbook.WorkSheets[1];
  //Пошла печать
  //ДОПОЛНИТЕЛЬНОЕ СОГЛАШЕНИЕ
  ExFormat(List,'C2',[qDogAlien['dog'],qDogAlien['dog_date']]);
  ExFormat(List,'F3',[p_Date]);
  ExFormat(List,'A5',[qFrom['name'],qFrom['dogovor'],qTo['name'],qTo['dogovor']]);
  SetRowHeight(List,5,1,95);
  ExFormat(List,'A7',[p_Date]);
  PrintSumTalons(list,13,TOilQuery(qTalonAlienRn),'np_group_full;dim_name;litr;pricexnds;sumxnds');
  PrintDopSoglRekv(qFrom,21+qTalonAlienRn.RecordCount,'A',List);
  PrintDopSoglRekv(qTo,21+qTalonAlienRn.RecordCount,'D',List);
  //РАСХОДНАЯ НАКЛАДНАЯ
  List:=XLApp.ActiveWorkbook.WorkSheets[2];
  PrintRashNakHead(List,qFrom,qTo,qDogAlien,IntToStr(p_number),p_Date);
  PrintSumTalons(List,22,TOilQuery(qTalonAlienRn),'np_group_full;dim_name;litr;pricexnds;sumxnds');
  //АКТ РЕЕСТР ПО ТАЛОНАМ
  List:=XLApp.ActiveWorkbook.WorkSheets[3];
  SumCo:= 0; SumNo := 0;
  //шапка
  ExFormat(List,'D2',[qDogAlien['dog'],qDogAlien['dog_date']]);
  ExFormat(List,'D3',[qFrom['name']]);
  ExFormat(List,'D4',[qTo['name']]);
  ExFormat(List,'F5',[p_Date]);
  ExFormat(List,'A7',[qFrom['name'],qTo['name'],FormatDateDog(p_Date)]);

  ExFormat(List,'A10',[p_number,p_Date,qTo['name']]);
  ExFormat(List,'D12',[p_number]);
  ExFormat(List,'C14',[qTo['name']]);
  ExFormat(List,'C15',[qFrom['name']]);
  ExFormat(List,'D17',[p_number,p_Date]);
  ExFormat(List,'D18',[qDogAlien['dog'],qDogAlien['dog_date']]);
  // реестр
  n := 21-1;
    //пишем данные
  n:=PuTOilQueryToExcelEnh(XLApp,List,qTalonAlienReestr,n+1,nil,0,
    'rownum;np_group_full\i;nominal\i;ser;num;co\s;litr\s');
  qTalonAlienReestr.First;
  dec(n);
  while not(qTalonAlienReestr.eof)do
  begin
    SumNo := SumNo + qTalonAlienReestr['litr'];
    SumCo := SumCo + qTalonAlienReestr['co'];
    qTalonAlienReestr.Next;
  end;
  DrawNetInExcel(List,1,7,n,n);
  List.Cells[n,'A'] := LangText('VSEGO_po_razdely');
  List.Cells[n,'F'] := SumCo;
  List.Cells[n,'G'] := SumNo;
  List.Range[GetExcelRange(n,1,n,7)].Font.Bold:=TRUE;

  //табличка "Количество карточек по отчету"
  n:=n+2;
  List.Range[GetExcelRange(n,2,n,7)].Merge;
  List.Cells[n,'B']:=LangText('Kolichestvo_talonov_po_otchety');
  List.Cells[n+1,'B']:=LangText('Vid_GSM');
  List.Cells[n+1,'C']:=TranslateText('Ном 5');
  List.Cells[n+1,'D']:=TranslateText('Ном 10');
  List.Cells[n+1,'E']:=TranslateText('Ном 20');
  List.Cells[n+1,'F']:=TranslateText('Ном 50');
  List.Cells[n+1,'G']:=LangText('Vsego');
  List.Range[GetExcelrange(n,2,n+1,7)].HorizontalAlignment:=xlCenter;
  List.Range[GetExcelrange(n,2,n+1,7)].Interior.ColorIndex:=34;

  //Подсчитуем кол-во талонов в разрезе типов НП
  qTalonAlienReestr.First;
  i:=n+1; CurNpg:=''; sLitr:='';
  cnt.five:=0; cnt.ten:=0; cnt.twenty:=0; cnt.fifty:=0;
  while not(qTalonAlienReestr.eof)do
  begin
    if CurNpg <> qTalonAlienReestr.FieldByName('group_name').AsString then
    begin
      if not((cnt.five=0)and(cnt.ten=0)and(cnt.twenty=0)and(cnt.fifty=0))then
      begin
        inc(i);
        List.Cells[i,'B']:=CurNpg;                       
        List.Cells[i,'C']:=cnt.five;
        List.Cells[i,'D']:=cnt.ten;
        List.Cells[i,'E']:=cnt.twenty;
        List.Cells[i,'F']:=cnt.fifty;
        sLitr:=sLitr+Format('%s - %s,000 (%s), ',
          [qTalonAlienReestr.FieldByName('np_group_full').AsString,
          (cnt.five*5)+(cnt.ten*10)+(cnt.twenty*20)+(cnt.fifty*50),
           Number2Words((cnt.five*5)+(cnt.ten*10)+(cnt.twenty*20)+(cnt.fifty*50),'M',LangText('litr_litra_litrov'))]);
        cnt.five:=0; cnt.ten:=0; cnt.twenty:=0; cnt.fifty:=0;
      end;
      CurNpg := qTalonAlienReestr.FieldByName('group_name').AsString;
    end;
    case qTalonAlienReestr['litr'] of
      5: inc(cnt.five);
      10:inc(cnt.ten);
      20:inc(cnt.twenty);
      50:inc(cnt.fifty);
    end;
    qTalonAlienReestr.Next;
  end;
  if not((cnt.five=0)and(cnt.ten=0)and(cnt.twenty=0)and(cnt.fifty=0))then
  begin
    inc(i);
    List.Cells[i,'B']:=CurNpg;
    List.Cells[i,'C']:=cnt.five;
    List.Cells[i,'D']:=cnt.ten;
    List.Cells[i,'E']:=cnt.twenty;
    List.Cells[i,'F']:=cnt.fifty;
    sLitr:=sLitr+Format('%s - %d,000 (%s), ',
      [qTalonAlienReestr.FieldByName('np_group_full').AsString,
      trunc((cnt.five*5)+(cnt.ten*10)+(cnt.twenty*20)+(cnt.fifty*50)),
       Number2Words((cnt.five*5)+(cnt.ten*10)+(cnt.twenty*20)+(cnt.fifty*50),'M',LangText('litr_litra_litrov'))]);
    cnt.five:=0; cnt.ten:=0; cnt.twenty:=0; cnt.fifty:=0;
  end;
  List.Cells[i+1,'B']:=LangText('Itogo');
  List.Cells[i+1,'B'].Font.Bold:=TRUE;

  for j:=3 to 7 do
    List.Cells[i+1,j].Formula:='=SUM('+GetExcelRange(n+2,j,i,j)+')';
  for j:=n+2 to i do
    List.Cells[j,'G'].Formula:='=SUM('+GetExcelRange(j,3,j,6)+')';

  List.Range[GetExcelRange(i+1,3,i+1,6)].Font.Bold:=TRUE;
  List.Range[GetExcelRange(n+2,7,i+1,7)].Font.Bold:=TRUE;
  DrawNetInExcel(List,2,7,n,i+1);

  n:=i+3;
  List.Cells[n,'A']:='3. '+LangText('Add_To_akt_talon');
  List.Cells[n+1,'A']:=Format(LangText('Add_To_akt_talon2')+'.',[qDogAlien['dog']]);

  List.Cells[n+5,'A']:=Format('%s         %s',[qFrom['name'],qTo['name']]);
  ExFormat(List,'A9',[sLitr,qTo['name'],p_number,p_Date,qDogAlien['dog'],qDogAlien['dog_date']]);
  SetRowHeight(List,9,1,95);
  SetRowHeight(List,7,1,95);
  SetRowHeight(List,10,1,95);

  for i:=4 to XLApp.ActiveWorkbook.WorkSheets.Count do
    XLApp.ActiveWorkbook.WorkSheets[i].Visible:=False;
  if Saving then
  begin
    //СОХРАНЯЕМ
    dirname:=GetMainDir+TranslateText('Doc\Отоваривание талонов\');
    filename:=dirname+TranslateText('Отпуск ')+IntToStr(p_number)+TranslateText(' от ')+FormatDateTime('dd_mm_yyyy',p_Date)+'.xls';
    if not DirectoryExists(dirname) then CreateDir(dirname);
    if FileExists(filename) then DeleteFile(filename);
    XLApp.ActiveWorkbook.SaveAs(filename);
    XLApp.ActiveWorkbook.Close;
  end
  else
    XLApp.Visible:=True;
end;
procedure TTalonPrihRefForm.SpeedButton4Click(Sender: TObject);
begin
  if not deEndDate.Enabled then exit;
  deEndDate.Clear;
end;

procedure TTalonPrihRefForm.FormShow(Sender: TObject);
begin
  inherited;
  bbSearchClick(Sender);
end;

procedure TTalonPrihRefForm.DBGrid1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if not q.FieldByName('SMENA_NUM').IsNull and q.FieldByName('SREP_ID').IsNull
    and (q.FieldByName('INST').AsInteger <> INST) then
    AFont.Color := clRed;
end;

procedure TTalonPrihRefForm.qTalonGetPriceCalcFields(DataSet: TDataSet);
begin
  qTalonGetPriceSumNds.AsFloat := MRound(qTalonGetPricePrice.AsFloat * qTalonGetPriceLitr.AsFloat, 2);
  inherited;
end;

end.
