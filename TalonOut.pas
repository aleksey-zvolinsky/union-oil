{******************************************************************************}
{  Предназначение : просмотр произведенных отпусков талонов, печать            }
{                   соответствующих документов по отпуску.                     }
{                                                                              }
{******************************************************************************}

unit TalonOut;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, ToolEdit,
  Mask, RXCtrls, ComObj, Excel8TLB, ActiveX, DBCtrls, DBTables, CurrEdit,
  LogSaleDeadbeat, ActnList,uOilQuery,Ora, uOilStoredProc, DBAccess, MemDS,
  DBGridEh{$IFDEF VER150},Variants{$ENDIF};

type
  TTalonOutRefForm = class(TBaseForm)
    lFromDate: TLabel;
    lTo: TLabel;
    lFrom: TLabel;
    sbClearTo: TSpeedButton;
    sbClearFrom: TSpeedButton;
    deOutDateFrom: TDateEdit;
    ceOrg: TComboEdit;
    ceDep: TComboEdit;
    sp1: TOilStoredProc;
    qTalon: TOilQuery;
    dsTalon: TOraDataSource;
    N2: TMenuItem;
    N3: TMenuItem;
    NNN: TMenuItem;
    qSumTalon: TOilQuery;
    NDog: TMenuItem;
    Panel5: TPanel;
    lAmountTalon: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBGrid2: TDBGridEh;
    dsTalonTotal: TOraDataSource;
    qTalonTotal: TOilQuery;
    Splitter1: TSplitter;
    dsTalonDetail: TOraDataSource;
    GroupBox3: TGroupBox;
    DBText4: TDBText;
    DBText5: TDBText;
    qSCRashNakl: TOilQuery;
    sbClearDate: TSpeedButton;
    u: TOraUpdateSQL;
    qWork: TOilQuery;
    Label7: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    qNextPrih: TOilQuery;
    qTalonDetail: TOilQuery;
    qPriorPrih: TOilQuery;
    DBGrid3: TDBGridEh;
    qID: TFloatField;
    qINST: TFloatField;
    qSTATE: TStringField;
    qOUT_NUM: TStringField;
    qOUT_DATE: TDateTimeField;
    qORG_ID: TFloatField;
    qORG_INST: TFloatField;
    qDEP_ID: TFloatField;
    qDEP_INST: TFloatField;
    qREKV_ID: TFloatField;
    qREKV_INST: TFloatField;
    qDOV_NAME: TStringField;
    qDOV_SER: TStringField;
    qDOV_NUM: TStringField;
    qDOV_DATE: TDateTimeField;
    qDOG_ID: TFloatField;
    qDOG_INST: TFloatField;
    qRASH_ID: TFloatField;
    qRASH_INST: TFloatField;
    qNN_ID: TFloatField;
    qNN_INST: TFloatField;
    qDATE_MOD: TDateTimeField;
    qDOG: TStringField;
    qDOG_DATE: TDateTimeField;
    qORG_TYPE: TFloatField;
    qORG_NAME: TStringField;
    qDEP_TYPE: TFloatField;
    qDEP_NAME: TStringField;
    qORG_ADDR: TStringField;
    qORG_SVID_NUM: TStringField;
    qORG_NAL_NUM: TStringField;
    qORG_BOSS: TStringField;
    qORG_OKPO: TStringField;
    qORG_PHONE: TStringField;
    qDEP_ADDR: TStringField;
    qDEP_SVID_NUM: TStringField;
    qDEP_NAL_NUM: TStringField;
    qDEP_BOSS: TStringField;
    qDEP_OKPO: TStringField;
    qDEP_PHONE: TStringField;
    qNN_NUM: TStringField;
    qFRASCH: TStringField;
    lNumOtp: TLabel;
    sbClearID: TSpeedButton;
    sbClearOper: TSpeedButton;
    lOper: TLabel;
    edOper: TComboEdit;
    qNPGRP_ID: TFloatField;
    qOPER_ID: TFloatField;
    qOPER_NAME: TStringField;
    qNNpoOut: TOilQuery;
    qNN_PRICE: TFloatField;
    qNN_SUM: TFloatField;
    gbTalon: TGroupBox;
    eTalonNum: TEdit;
    eTalonSer: TEdit;
    lSeriaTal: TLabel;
    lNumTal: TLabel;
    deOutDateTo: TDateEdit;
    lToDate: TLabel;
    N1: TMenuItem;
    miDopConsent: TMenuItem;
    N4: TMenuItem;
    miTalonExch: TMenuItem;
    miTalonExch_Dop: TMenuItem;
    miTalonExch_Sverka: TMenuItem;
    miTalonExch_PrPer: TMenuItem;
    qTExchSverka: TOilQuery;
    qTExch_MinPrihMaxOut: TOilQuery;
    qTExchPrih: TOilQuery;
    qTExchOut: TOilQuery;
    qTExchSverkaDOG: TStringField;
    qTExchSverkaDOG_DATE: TDateTimeField;
    qTExchSverkaNP_GROUP: TStringField;
    qTExchSverkaNOMINAL: TFloatField;
    qTExchSverkaSER: TStringField;
    qTExchSverkaNUM: TFloatField;
    qTExchSverkaSHTUKI: TFloatField;
    qTExchPrihNP_GROUP: TStringField;
    qTExchPrihNOMINAL: TFloatField;
    qTExchPrihSER: TStringField;
    qTExchPrihNUM: TFloatField;
    qTExchPrihSHTUKI: TFloatField;
    qTExchOutNP_GROUP: TStringField;
    qTExchOutNOMINAL: TFloatField;
    qTExchOutSER: TStringField;
    qTExchOutNUM: TFloatField;
    qTExchOutSHTUKI: TFloatField;
    edNum: TEdit;
    procedure CheckBox1Click(Sender: TObject);
    procedure eTalonNumKeyPress(Sender: TObject; var Key: Char);
    procedure ceOrgButtonClick(Sender: TObject);
    procedure ceDepButtonClick(Sender: TObject);
    procedure sbClearToClick(Sender: TObject);
    procedure sbClearFromClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);Override;
    procedure bbSearchClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure NNNClick(Sender: TObject);
    procedure NDogClick(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure sbClearDateClick(Sender: TObject);
    procedure qAfterPost(DataSet: TDataSet);
    procedure qOUT_DATEValidate(Sender: TField);
    procedure sbClearIDClick(Sender: TObject);
    procedure sbClearOperClick(Sender: TObject);
    procedure edOperButtonClick(Sender: TObject);
    procedure miDopConsentClick(Sender: TObject);
    procedure miTalonExch_DopClick(Sender: TObject);
    procedure miTalonExch_SverkaClick(Sender: TObject);
    procedure miTalonExch_PrPerClick(Sender: TObject);
  private
    { Private declarations }
  public
    CurBookMark: TBookmark;
    CurDate: TDate;
    SorgId, SorgInst, SdepId, SdepInst: Integer;
    FEnabledNN : Boolean;
  end;


implementation

uses TalonOutData, ChooseOrg, OilStd, Progr, Main, DogRef, OperTypeRef, UdbFunc,
  TaxBillPrint, ExcelFunc,ExFunc,RashNakPrint;

{$R *.DFM}

const
  PosOut =
    ' select                                           ' +
    '       NPGrp_Id,                                  ' +
    '       decode(NPGrp_Id, 4,6, 6,4, 7,5, 3,46 ,10,138) np_type, ' +
    '       max(Price) price,                          ' +
    '       sum(nominal) kol,                          ' +
    '       ( max(Price) * sum(nominal) ) symma,       ' +
    '       count(*) cnt                               ' +
    '   from                                           ' +
    '       Oil_Talon_Data td,                         ' +
    '       v_oil_np_group np                           ' +
    '  where                                           ' +
    '       td.State = ''Y''                           ' +
    '       and td.NPGrp_Id = np.id                    ' +
    '       and td.Head_Id   = :id                     ' +
    '       and td.Head_Inst = :inst                   ' +
    ' group by td.NPGrp_Id, np.fullname, td.Price      ';

procedure TTalonOutRefForm.CheckBox1Click(Sender: TObject);
begin
  qTalon.Active := cbShowDetail.Checked;
  qTalonTotal.Active := cbShowDetail.Checked;
  qTalonDetail.Active := cbShowDetail.Checked;
  Splitter1.Visible := cbShowDetail.Checked;
  Panel5.Visible := cbShowDetail.Checked;
end;

procedure TTalonOutRefForm.eTalonNumKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#13,#8]) then key:=#0;
end;

procedure TTalonOutRefForm.ceOrgButtonClick(Sender: TObject);
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

procedure TTalonOutRefForm.ceDepButtonClick(Sender: TObject);
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

procedure TTalonOutRefForm.sbClearDateClick(Sender: TObject);
begin
  deOutDateFrom.Text := '';
  deOutDateTo.Date := Now;
end;

procedure TTalonOutRefForm.sbClearToClick(Sender: TObject);
begin
ceOrg.Text := '';
end;

procedure TTalonOutRefForm.sbClearFromClick(Sender: TObject);
begin
ceDep.Text := '';
end;

procedure TTalonOutRefForm.bbClearClick(Sender: TObject);
begin
  sbClearDateClick(nil);
  sbClearIDClick(Nil);
  sbClearOperClick(nil);
  sbClearToClick(nil);
  sbClearFromClick(nil);
  eTalonSer.Text := '';
  eTalonNum.Text := '';
end;

procedure TTalonOutRefForm.FormCreate(Sender: TObject);
begin
  inherited;
  if LAUNCH_MODE <> 'GREAT_OIL' then // Проверяем на какой базе работаем
  begin
    qTalon.SQL.Strings[9] := '';
    qTalonDetail.SQL.Strings[12] := '';
  end;
  deOutDateFrom.Date := now - 30;
  deOutDateTo.Date := now;
  bbSearchClick(Nil);
end;

procedure TTalonOutRefForm.sbAddClick(Sender: TObject);
var
  TalonOut: TTalonOutForm;
  qOrg :TOilQuery;
  PossibleOrg :integer;
begin
  StartSQL;
  try
    q.Insert;
     q.FieldByName('Id').AsInteger := GetSeqNextVal('S_OIL_TALON_PRIHOD');
     q.FieldByName('Inst').AsInteger := Inst;
     q.FieldByName('Out_Date').AsDateTime := Date;
     q.FieldByName('NN_Id').Clear;
     q.FieldByName('NN_Inst').Clear;
     PossibleOrg := GetUserPossibleOrg(SUPER_REAL_EMP_ID);
     if PossibleOrg = -1 then
     begin
       q.FieldByName('Dep_Id').AsInteger := MAIN_ID;
       q.FieldByName('Dep_Inst').AsInteger := INST;
       q.FieldByName('Dep_Type').AsInteger := MAIN_TYPE;
       q.FieldByName('Dep_Name').AsString := MainForm.qOrg.FieldbyName('Name').AsString;
     end
     else
     begin
       qOrg := TOilQuery.Create(nil);
       try
         GetOrgData(qOrg,PossibleOrg,PossibleOrg);
         q.FieldByName('Dep_Id').AsInteger := qOrg.FieldByName('Id').AsInteger;
         q.FieldByName('Dep_Inst').AsInteger := qOrg.FieldByName('Inst').AsInteger;
         q.FieldByName('Dep_Type').AsInteger := qOrg.FieldByName('Org_Id').AsInteger;
         q.FieldByName('Dep_Name').AsString := qOrg.FieldbyName('Name').AsString;
       finally
         qOrg.Free;
       end;
     end;
     q.FieldByName('Oper_Id').AsInteger := 190;
     q.FieldByName('Oper_Name').AsString := TranslateText('Продажа талонов');
    q.Post;
    CurDate := q.FieldByName('Out_Date').AsDateTime;
    TalonOut := TTalonOutForm.Create(Application);
    TalonOut.Inserting:=true;
    TalonOut.dbceEdOper.Text:= TranslateText('Продажа талонов');
    TalonOut.Caption := TranslateText('Отпуск талонов с ') + q.FieldByName('Dep_Name').AsString;
    ClearSaleToDeadbeat(TalonOut.SaleToDeadbeat);
    TalonOut.sbAuto.Visible := TalonOut.bbOk.Enabled;
    TalonOut.NumOld:='';
    TalonOut.ShowModal;
    if TalonOut.ModalResult = mrOk then
    begin
      if q.State <> dsBrowse then
        q.Post;

    end
    else
      RollbackSQL;
    TalonOut.Free;
    bbSearchClick(Nil);
  except
    on E:Exception do
    Begin
      MessageDlg(E.Message, mtError, [mbOk], 0);
      RollbackSQL;
      bbSearchClick(Nil);
    end;
  end;
end;

procedure TTalonOutRefForm.sbDelClick(Sender: TObject);
var
  TaxBill : TdmTaxBill;
  MirrorExists: Boolean;
begin
  if q.IsEmpty then Abort;
  if MessageDlg(TranslateText('Вы уверены что хотите удалить расход талонов ?'), mtConfirmation, [mbYes, mbNo], 0) = mrNo then Abort;
  if (not(q.FieldByName('NN_Num').IsNull)) and
     (MessageDlg(TranslateText('Вы уверены что хотите удалить налоговую накладную №') + q.FieldByName('NN_Num').AsString + ' ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo)
  then Abort;

  StartSQL;
  try
    MirrorExists:=q['oper_id']=200;
    if Inst <> q.FieldByName('Inst').AsInteger then
      raise Exception.Create(TranslateText('Нельзя удалить запись созданную другой организацией !'));
    if StrToDate(Close_Date) >= q.FieldByName('Out_Date').AsDateTime then
      raise Exception.Create(TranslateText('Данный период закрыт !'));

    qWork.Close;
    qWork.SQL.Text := 'select * from Oil_Talon_Out ' +
      ' where Id = ' + q.FieldByName('Id').AsString +
      '   and Inst = ' + q.FieldByName('Inst').AsString + ' for update nowait';
    qWork.Open;
    qNextPrih.Close;
    qNextPrih.ParamByName('MainId').AsInteger := q.FieldByName('Id').AsInteger;
    qNextPrih.ParamByName('MainInst').AsInteger := q.FieldByName('Inst').AsInteger;
    qNextPrih.ParamByName('CurDate').AsDate := q.FieldByName('Out_Date').AsDateTime;
    qNextPrih.Open;
    if not qNextPrih.Fields[0].IsNull then
      raise Exception.Create(TranslateText('Нельзя удалить талоны оприходованные ') + qNextPrih.Fields[0].AsString);

    DeleteSaleFromLog(q.FieldByName('Id').AsInteger, q.FieldByName('Inst').AsInteger,
                      REAL_INST, 'OIL_TALON_OUT');

  // Удаляем налоговую
  TaxBill:= TdmTaxBill.Create;

  try
   TaxBill.DeleteSBRecords10(q.FieldByName('NN_Id').AsInteger,
                             q.FieldByName('NN_Inst').AsInteger);
  finally
   TaxBill.Free;
  end;
  qWork.Close;
  qWork.SQL.Text := ' update Oil_Talon_Data set State = ''N'' ' +
  ' where Head_Id = ' + q.FieldByName('Id').AsString +
  '   and Head_Inst = ' + q.FieldByName('Inst').AsString;
  qWork.ExecSQL;
  if MirrorExists then
   _ExecProc('CR_TP_MIRROR',
     ['P_ID',    q['id'],
      'P_INST',  q['inst']
     ],false);
  q.Delete;
  CommitSQL;
  except on E: Exception do
    begin
    if Pos('ORA-00054:', E.Message) <> 0
      then MessageDlg(TranslateText('Этот отпуск талонов редактируется другим пользователем !'), mtError, [mbOk], 0)
      else MessageDlg(E.Message, mtError, [mbOk], 0);
    RollbackSQL;
    bbSearchClick(Nil);
    end;
  end;
end;

procedure TTalonOutRefForm.sbEditClick(Sender: TObject);
var
  TalonOut: TTalonOutForm;
  OnlyShow: Boolean;
  i : integer;
begin
  OnlyShow := False;
  if q.IsEmpty then Abort;
  StartSQL;
  try
    CurDate := q.fieldbyname('Out_Date').AsDateTime;

    if(Inst <> q.FieldByName('Inst').AsInteger)
      or(StrToDate(Close_Date) >= q.FieldByName('Out_Date').AsDateTime)then
      OnlyShow := True
    else
    begin
      qWork.Close;
      qWork.SQL.Text := 'select * from Oil_Talon_Out '
        +' where Id = :id'
        +'   and Inst = :inst  for update nowait';
      _OpenQueryPar(qWork,
        ['id',q.FieldByName('Id').AsInteger,
         'inst',q.FieldByName('Inst').AsInteger]);
      _ExecSql('update Oil_Talon_Out set State = ''Y'' where Id = :id and Inst = :inst',
        ['id',q.FieldByName('Id').AsInteger,
         'inst',q.FieldByName('Inst').AsInteger]);
    end;

    TalonOut := TTalonOutForm.Create(Application);
    TalonOut.Inserting:=false;
    TalonOut.Caption := TranslateText('Отпуск талонов с ') + q.FieldByName('Dep_Name').AsString;

    TalonOut.dbdeOutDate.Enabled := q.FieldByName('Out_Date').AsDateTime > StrToDate(CLOSE_DATE);
    if not q.FieldByName('Dog_Id').IsNull then
    begin
      TalonOut.dbceDog.DirectInput := False;
      TalonOut.dbdeDogDate.Enabled := False;
    end;
    // Налоговые
    TalonOut.cbFormRash.ItemIndex := TalonOut.cbFormRash.Items.IndexOf(q.FieldByName('FRasch').AsString);
    TalonOut.cbNN_Num.Checked := q.FieldByName('NN_Id').IsNull;
    if (q.FieldByName('Dog_Id').IsNull)and(q.FieldByName('NN_Id').IsNull) then
      TalonOut.cbFormRash.ItemIndex := 1 ;

    if OnlyShow then TalonOut.bbOk.Enabled := False;
    // Дебеторы
    ClearSaleToDeadbeat(TalonOut.SaleToDeadbeat);
    InitOldOrg(q.fieldbyname('Org_Id').AsInteger, q.fieldbyname('Org_Inst').AsInteger,
             q.fieldbyname('Org_name').AsString,
             q.fieldbyname('Id').AsInteger, q.fieldbyname('Inst').AsInteger,
             'OIL_TALON_OUT', TalonOut.SaleToDeadbeat);
    TalonOut.NumOld:=TalonOut.dbOutNum.Text;
    if( (TalonOut.dbdeOutDate.Date>=StrToDate(INST_MOVE_DATE))and(not IsFilialNK(inst)) )then
    begin
      TalonOut.dbdeOutDate.Enabled:=false;
      with TalonOut.qTalon do begin
        for i:=0 to Fields.Count-1 do
          Fields[i].ReadOnly:=true;
      end;
    end;
    TalonOut.FDocDate:=q.fieldbyname('Out_Date').AsDateTime;//Сохраняем дату для проверок
    TalonOut.ShowModal;
    if TalonOut.ModalResult = mrOk then
    begin
      if q.State <> dsBrowse then q.Post;
    end
    else
      RollbackSQL;
    TalonOut.Free;
    bbSearchClick(Nil);
  except on E:Exception do
  begin
    if Pos('ORA-00054:', E.Message) <> 0
      then MessageDlg(TranslateText('Этот отпуск талонов редактируется другим пользователем !'), mtError, [mbOk], 0)
      else MessageDlg(E.Message, mtError, [mbOk], 0);
    RollbackSQL;
    bbSearchClick(Nil);
    q.EnableControls;
    end;
  end;
end;

procedure TTalonOutRefForm.bbSearchClick(Sender: TObject);
var
  CurId, CurInst: Integer;
  FromDate,ToDate:String;
begin
q.DisableControls;
CurId := q.FieldByName('Id').AsInteger;
CurInst := q.FieldByName('Inst').AsInteger;
q.Close;
if deOutDateFrom.Date = 0
  then FromDate := '''1.1.1900'''
  else FromDate :=''''+deOutDateFrom.Text+'''';
if deOutDateTo.Date = 0
  then ToDate := 'sysdate'
  else ToDate := ''''+deOutDateTo.Text+'''';
   q.SQL.Strings[45] := ' AND OIL_TALON_OUT.OUT_DATE between to_date('+FromDate+') and to_date('+ToDate+')';
if ceOrg.Text <> ''
  then q.SQL.Strings[46] := ' AND OIL_TALON_OUT.ORG_ID = ' + IntToStr(SorgId) +
                            ' AND OIL_TALON_OUT.ORG_INST = ' + IntToStr(SorgInst)
  else q.SQL.Strings[46] := '';
if ceDep.Text <> ''
  then q.SQL.Strings[47] := ' AND OIL_TALON_OUT.DEP_ID = ' + IntToStr(sDepid) +
                            ' AND OIL_TALON_OUT.DEP_INST = ' + IntToStr(SDepINST)
  else q.SQL.Strings[47] := '';
if (eTalonSer.Text <> '')or(eTalonNum.Text <> '') then
  begin
  q.SQL.Strings[48] := ' AND (OIL_TALON_OUT.ID, OIL_TALON_OUT.INST) IN (SELECT /*+NO_MERGE*/ HEAD_ID, HEAD_INST FROM OIL_TALON_DATA WHERE STATE = ''Y'' ';
  if eTalonSer.Text <> '' then q.SQL.Strings[48] := q.SQL.Strings[48] + ' AND SER LIKE UPPER(''%' + eTalonSer.Text + '%'') ';
  if eTalonNum.Text <> '' then q.SQL.Strings[48] := q.SQL.Strings[48] + ' AND NUM = ' + eTalonNum.Text;
  q.SQL.Strings[48] := q.SQL.Strings[48] + ' ) ';
  end
 else q.SQL.Strings[48] := '';
if edNum.Text <> ''
  then q.SQL.Strings[49] := ' AND OIL_TALON_OUT.OUT_NUM = '''+ edNum.Text +''''
  else q.SQL.Strings[49] := '';
if edOper.Text <> ''
  then q.SQL.Strings[50] := ' AND OIL_TALON_OUT.OPER_ID = ' + IntToStr(edOper.Tag)
  else q.SQL.Strings[50] := '';
_OpenQuery(q);
while not((q.Eof)or((CurId = q.FieldByName('Id').AsInteger)and(CurInst = q.FieldByName('Inst').AsInteger))
                 or((CurId = 0)and(CurInst = 0))) do q.Next;
if (q.Eof)and((CurId <> q.FieldByName('Id').AsInteger)or(CurInst <> q.FieldByName('Inst').AsInteger)) then q.First;
q.EnableControls;
end;

procedure TTalonOutRefForm.N2Click(Sender: TObject);
var
  Rn: TdmRashNakPrint;
begin
  if q.IsEmpty or not q.Active then
    exit;
  if not q.FieldByName('Dog_id').IsNull then
  begin
    qWork.Close;
    qWork.SQL.Text := 'select from_ as from_id, from_inst from oil_dog where id = :id and inst = :inst';
    _OpenQueryPar(qWork,
      ['id',  q.FieldByName('Dog_id').AsInteger,
       'inst',q.FieldByName('Dog_Inst').AsInteger]);
    Rn:=TdmRashNakPrint.Create(
      Q.FieldByName('Out_Num').AsString,
      Q.FieldByName('Out_Date').AsDateTime,
      '',
      LangText('Soglastno_dogovora')+' № '+q.FieldByName('Dog').AsString+' '+LangText('Ot')+FormatDateTime('dd.mm.yyyy',q.FieldByName('Dog_Date').AsDateTime),
      qWork.FieldByName('from_id').AsInteger,
      qWork.FieldByName('from_inst').AsInteger,
      q.FieldByName('Org_Id').AsInteger,
      q.FieldByName('Org_Inst').AsInteger,
      rnTalon
      );
  end
  else
  begin
    Rn:=TdmRashNakPrint.Create(
      Q.FieldByName('Out_Num').AsString,
      Q.FieldByName('Out_Date').AsDateTime,
      '',
      LangText('Soglastno_dogovora')+' № '+q.FieldByName('Dog').AsString+' '+LangText('Ot')+FormatDateTime('dd.mm.yyyy',q.FieldByName('Dog_Date').AsDateTime),
      q.FieldByName('dep_id').AsInteger,
      q.FieldByName('dep_inst').AsInteger,
      q.FieldByName('Org_Id').AsInteger,
      q.FieldByName('Org_Inst').AsInteger,
      rnTalon
      );
  end;
  try
    qSumTalon.Close;
    qSumTalon.Open;
    while not qSumTalon.Eof do
    begin
      Rn.AddPosition(
        '',
        '',
        Q.FieldByName('Out_Date').AsDateTime,
        '',
        qSumTalon.FieldByName('NPGRP_NAME').AsString + TranslateText(' по ')+LangText('Kartochkam'),
        qSumTalon.FieldByName('SumNominal').AsInteger,
        qSumTalon.FieldByName('Price').AsFloat
        );
      qSumTalon.Next;
    end;
    Rn.SetAddFields(
      Q.FieldByName('Dov_Name').AsString,
      Q.FieldByName('Dov_Num').AsString,
      Q.FieldByName('Dov_Date').AsDateTime,
      q.FieldByName('Dov_Ser').AsString
      );
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

procedure TTalonOutRefForm.N3Click(Sender: TObject);
var
  PosCounter, i, BeginNP, BeginNominal: Integer;
  CurNPName: String;
  CurNominal: Currency;
  Progr: TProgrForm;
begin
  Application.CreateForm(TProgrForm,progr);
  Progr.Progress:=0;
  Progr.Show;
  Progr.Repaint;
  try
    ActivateXLApp('TalonReestr','TalonReestr',1,XLApp,List);
    ExFormat(List,2,'D',[
      q.FieldByName('Out_Num').AsString]);

    List.Cells[4, 'C'] := q.FieldByName('Org_Name').AsString;

    qWork.Close;
    if not q.FieldByName('Dog_id').IsNull then
    begin
      qWork.Close;
      qWork.SQL.Text := 'select o.name from oil_dog d, v_org o '
        +' where d.id = :id and d.inst = :inst and d.from_ = o.id and d.from_inst = o.inst';
      _OpenQueryPar(qWork,
        ['id',  q.FieldByName('Dog_id').AsInteger,
         'inst',q.FieldByName('Dog_Inst').AsInteger]);
    end
    else
    begin
      if DOG_WITH_REKVIZIT_CONTROL = 'Y' then
      begin
        qWork.SQL.Text := 'select Obl.*, Rekv.Rach_Chet, Rekv.MFO ' +
          ' from v_Oil_Org Filial, v_Oil_Org Obl, v_Oil_Rekvizit Rekv ' +
          ' where Filial.Par = Obl.Id ' +
          ' and Filial.Par_Inst = Obl.Inst ' +
          ' and Rekv.Id_Org (+) = Obl.Id ' +
          ' and Rekv.Inst (+) = Obl.Inst ' +
          ' and Filial.Id = :id ' +
          ' and Filial.Inst = :inst ' +
          ' order by nvl(Rekv.Def, 0) desc';
      end
      else
      begin
        qWork.SQL.Text := 'select Oil_Org.*, Rekv.Rach_Chet, Rekv.MFO ' +
          ' from v_Oil_Org Oil_Org, v_Oil_Rekvizit Rekv ' +
          ' where Rekv.Id_Org (+) = Oil_Org.Id ' +
          ' and Rekv.Inst (+) = Oil_Org.Inst ' +
          ' and Oil_Org.Id = :id ' +
          ' and Oil_Org.Inst = :inst ' +
        ' order by nvl(Rekv.Def, 0) desc';
      end;

      _OpenQueryPar(qWork,
        ['id',q.FieldByName('Dep_Id').AsInteger,
         'inst',q.FieldByName('Dep_Inst').AsInteger]
         );
    end;

    List.Cells[5, 'C'] := qWork.FieldByName('Name').AsString;
    List.Cells[6, 'D'] := LangText('Po_doverenosti')+' ' + Q.FieldByName('Dov_Ser').AsString
      + '№' + Q.FieldByName('Dov_Num').AsString + ' '+LangText('Ot')+' ' + Q.FieldByName('Dov_Date').AsString
      + TranslateText(' через ')+Q.FieldByName('Dov_Name').AsString;
    ExFormat(List,7,'D',[
      q.FieldByName('Out_Num').AsString,
      q.FieldByName('Out_Date').AsString
      ]);

    ExFormat(List,8,'D',[
      q.FieldByName('Dog').AsString,
      q.FieldByName('Dog_Date').AsString
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
        List.Cells[i, 'B'] := LangText('Itogo')+TranslateText(' по ')+LangText('Nominaly')+' ' + FloatToStr(CurNominal);
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
    List.Cells[i, 'B'].Value := LangText('Kolichestvo_talonov_po_otchety');
    List.Range['B' + IntToStr(i) + ':G' + IntToStr(i + 1)].HorizontalAlignment := xlCenter;
    List.Range['B' + IntToStr(i) + ':F' + IntToStr(i)].Merge;
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
        '   and Oil_Talon_Data.Head_Id = :id ' +
        '   and Oil_Talon_Data.Head_Inst = :inst ' +
        '   and Oil_NP_Group.Id = Oil_Talon_Data.NPGrp_Id ' +
        ' group by Oil_NP_Group.Name';
    _OpenQueryPar(qWork,
      ['id',q.fieldbyname('Id').AsInteger,
       'inst',q.fieldbyname('Inst').AsInteger]);
    while not qWork.Eof do
      begin
      List.Cells[i, 'B'].Value := qWork.Fields[0].AsString;
      List.Range['B' + IntToStr(i) + ':G' + IntToStr(i)].NumberFormat := '0';
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
    List := Unassigned;
    XLApp := Unassigned;
  except on E: Exception do
    begin
      ShowMessage(E.Message);
      Progr.Free;
      XLApp.Visible := True;
      XLApp.ScreenUpdating := True;
      List := Unassigned;
      XLApp := Unassigned;
    end;
  end;
end;

procedure TTalonOutRefForm.NNNClick(Sender: TObject);
var
  TaxBill : TdmTaxBill;
 // ProgressBar : TProgressBar;
begin
  if not TaxBillPrint.IsTBHaveDetal( q.fieldByName('nn_id').AsInteger,q.fieldByName('nn_inst').AsInteger )then
    //печать НН по договору
    TaxBillPrint.GetTaxBillByDog(
      q.FieldByName('NN_Num').AsString,
      q.FieldByName('Out_Date').AsString,
      q.FieldByName('Dog_Id').AsInteger,
      q.FieldByName('Dog_Inst').AsInteger,
      q.FieldByName('Frasch').AsString
    )
  else if q.FieldByName('NN_PRICE').AsInteger = 12 then
  begin
    TdmTaxBill.Print(
      q.FieldByName('nn_id').AsInteger,
      q.FieldByName('nn_inst').AsInteger);
  end
  else
  Begin
    if q.IsEmpty then Abort;
    //проверяем есть ли НН по отпуску
    if 0 < GetSqlValuePar(' select count(*) cnt from Oil_sale_book b'
      +' where b.State = ''Y'' '
      +'   and b.id   = :id '
      +'   and b.inst = :inst ',
      ['id','inst'],
      [ftInteger,ftInteger],
      [q.fieldByName('nn_id').AsInteger,q.fieldByName('nn_inst').AsInteger])
    then
    //печать НН по отпуску
    begin
      TaxBill := TdmTaxBill.Create(q.FieldByName('org_id').AsInteger,q.FieldByName('org_inst').AsInteger);
      try
        qNNpoOut.Close;
        //qNNpoOut.sql.Text := Format(PosOut,[q.fieldByName('id').AsInteger,q.fieldByName('inst').AsInteger]);
        //qNNpoOut.Open;
        qNNpoOut.sql.Text := PosOut;
        _OpenQueryPar(qNNpoOut,
          ['id',q.fieldByName('nn_id').AsInteger,
           'inst',q.fieldByName('nn_inst').AsInteger]);
        with TaxBill do
        begin
          Options.Scheme := Talon;
          Options.Date := q.FieldByName('Out_Date').AsString;
          Options.TovarType := ttNpType;
          Options.DogId := q.FieldByName('dog_id').AsInteger;
          Options.DogInst := q.FieldByName('dog_inst').AsInteger;
          Options.TaxBillType := 2;
          Options.Num := q.FieldByName('nn_num').AsString;
          Options.OperName := q.FieldByName('FRASCH').AsString;
        end;
        while not qNNpoOut.Eof do
        begin
          TaxBill.AddPosition(
            qNNpoOut.FieldByName('np_type').AsInteger,
            28,
            q.FieldByName('Out_Date').AsString,
            qNNpoOut.FieldByName('kol').AsFloat,
            qNNpoOut.FieldByName('price').AsFloat);
          qNNpoOut.Next;
        end;
        TaxBill.PutToExcel();
      finally
        TaxBill.Free;
      end;
    end;
  End;

end;
//==============================================================================
procedure TTalonOutRefForm.NDogClick(Sender: TObject);
var
  DogRef: TDogRefForm;
begin
  if q.IsEmpty then Abort;
  if not (q.FieldByName('DOG_ID').isNull and q.FieldByName('DOG_INST').isNull) then
  begin
    DogRef := TDogRefForm.Create(Application);
    DogRef.DogRep('DogT', dtY,
      q.FieldByName('DOG_ID').Value, q.FieldByName('DOG_INST').Value);
    DogRef.Free;
  end
  else
  begin
    MessageDlg(TranslateText('На данный отпуск нету договора.'), mtInformation, [mbOk], 0);
    exit;
  end;
end;
//==============================================================================
procedure TTalonOutRefForm.dsDataChange(Sender: TObject; Field: TField);
begin
if q.State = dsBrowse then
  begin
    NDog.Enabled := (not q.FieldByName('DOG').IsNull)and(not q.FieldByName('DOG_DATE').IsNull);
    NNN.Enabled := not(q.FieldByName('NN_Num').IsNull);
    miTalonExch.Enabled := NDog.Enabled;
    miTalonExch_Dop.Enabled   := qOPER_ID.AsInteger in [243,244];
    miTalonExch_PrPer.Enabled := qOPER_ID.AsInteger in [243,244];
  end;
end;

procedure TTalonOutRefForm.qAfterPost(DataSet: TDataSet);
begin
q.ApplyUpdates;
q.CommitUpdates;
CurDate := q.fieldbyname('Out_Date').AsDateTime;
end;

procedure TTalonOutRefForm.qOUT_DATEValidate(Sender: TField);
begin
if StrToDate(Close_Date) >= Sender.AsDateTime
  then Raise Exception.Create(TranslateText('Данный период закрыт !'));
qNextPrih.Close;
qNextPrih.ParamByName('MainId').AsInteger := q.FieldByName('Id').AsInteger;
qNextPrih.ParamByName('MainInst').AsInteger := q.FieldByName('Inst').AsInteger;
qNextPrih.ParamByName('CurDate').AsDate := CurDate;
qNextPrih.Open;
if not qNextPrih.Fields[0].IsNull
  then if qNextPrih.Fields[0].AsDateTime < Sender.AsDateTime
    then raise Exception.Create(TranslateText('Ошибка: Выбранная дата ') + Sender.AsString + TranslateText(' не может быть больше даты последующего прихода ') + qNextPrih.Fields[0].AsString);
qPriorPrih.Close;
qPriorPrih.ParamByName('MainId').AsInteger := q.FieldByName('Id').AsInteger;
qPriorPrih.ParamByName('MainInst').AsInteger := q.FieldByName('Inst').AsInteger;
qPriorPrih.ParamByName('CurDate').AsDate := CurDate;
qPriorPrih.Open;
if not qPriorPrih.Fields[0].IsNull
  then if qPriorPrih.Fields[0].AsDateTime >= Sender.AsDateTime
    then raise Exception.Create(TranslateText('Ошибка: Выбранная дата ') + Sender.AsString + TranslateText(' не может быть меньше или равна дате предидущего прихода ') + qPriorPrih.Fields[0].AsString);
end;

procedure TTalonOutRefForm.sbClearIDClick(Sender: TObject);
begin
  edNum.Clear;
end;

procedure TTalonOutRefForm.sbClearOperClick(Sender: TObject);
begin
  edOper.Clear;
end;

procedure TTalonOutRefForm.edOperButtonClick(Sender: TObject);
Var
  OperTypeRefForm : TOperTypeRefForm;
begin
  Application.CreateForm(TOperTypeRefForm, OperTypeRefForm);
  OperTypeRefForm.SGrpId := 15;
  OperTypeRefForm.ShowModal;
  If OperTypeRefForm.ModalResult = mrOk Then
  Begin
    edOper.Text := OperTypeRefForm.qName.AsString;
    edOper.Tag  := OperTypeRefForm.qId.AsInteger;
  End;
  OperTypeRefForm.Free;
end;

procedure TTalonOutRefForm.miDopConsentClick(Sender: TObject);
var
  DogRef: TDogRefForm;
begin
  if q.IsEmpty then Abort;
  if not (q.FieldByName('DOG_ID').isNull and q.FieldByName('DOG_INST').isNull) then
  begin
    DogRef := TDogRefForm.Create(Application);
    DogRef.DogRep('DogTAdd', dtY,
      q.FieldByName('DOG_ID').Value, q.FieldByName('DOG_INST').Value, true);
    DogRef.Free;
  end
  else
  begin
    MessageDlg(TranslateText('На данный отпуск нету договора.'), mtInformation, [mbOk], 0);
    exit;
  end;
end;

procedure TTalonOutRefForm.miTalonExch_DopClick(Sender: TObject);
var DepName, DepVLice, ClientName, ClientVLice: string;
begin
  if q.IsEmpty then Abort;
  qTExch_MinPrihMaxOut.Close;      //додаткова угода виникає датою першого повернення талонів (опер_айді = 243)
  _OpenQueryPar(qTExch_MinPrihMaxOut, ['org_id',  qORG_ID.AsInteger,
                                       'org_inst',qORG_INST.AsInteger]);
  If qTExch_MinPrihMaxOut.FieldByName('min_prih_date').IsNull then
    MessageDlg(TranslateText('Данный отчет не содержит данных'),
                   mtInformation, [mbOK], 0)
  else
    if OleConnect('Word.Application', MsWord) then
      try
        MsWordDocAdd('TalonExchDop');
        //MsWord.Visible := true; {********************************}
        Range := MsWord.Documents.Item(1).Range;
        SetCurField(True, qDOG.AsString);
        SetCurField(True, qDOG.AsString);
        SetCurField(True, qDOG_DATE.AsString);
        SetCurField(True, qTExch_MinPrihMaxOut.FieldByName('min_prih_date').AsString);

        DogFillContractors(qDEP_ID.AsInteger, qDEP_INST.AsInteger, qORG_ID.AsInteger, qORG_INST.AsInteger,{in}
                           DepName, DepVLice, ClientName, ClientVLice);                                   {out}
        SetCurField(True, DepName);
        SetCurField(True, DepVLice);
        SetCurField(True, ClientName);
        SetCurField(True, ClientVLice);

        SetCurField(True, qDOG.AsString);
        SetCurField(True, qDOG_DATE.AsString);
        SetCurField(True, qDOG.AsString);
        SetCurField(True, qDOG_DATE.AsString);

        DogFillRekvizits(qDEP_ID.AsInteger, qDEP_INST.AsInteger,
                         qORG_ID.AsInteger, qORG_INST.AsInteger);
      finally
        MsWord.Visible := true;
        MsWord := UnAssigned;
      end;
  qTExch_MinPrihMaxOut.Close;
end;

procedure TTalonOutRefForm.miTalonExch_SverkaClick(Sender: TObject);
const FirstLine: integer = 10;
      D_NPP     = 'A';    C_NPP     = 'I';
      D_DOG     = 'B';    C_DOG     = 'J';
      D_DOGDATE = 'C';    C_DOGDATE = 'K';
      D_NPG     = 'D';    C_NPG     = 'L';
      D_LITR    = 'E';    C_LITR    = 'M';
      D_SER     = 'F';    C_SER     = 'N';
      D_NUM     = 'G';    C_NUM     = 'O';
      D_COUNT   = 'H';    C_COUNT   = 'P';
var DepName, DepVLice, ClientName, ClientVLice: string;
    line: integer;

begin
  qTExchSverka.Close;
  qTExch_MinPrihMaxOut.Close;   // звірка робиться на дату останнього відпуску талонів по обміну (опер_айді = 244)
  try
    _OpenQueryPar(qTExch_MinPrihMaxOut,
                  ['org_id',   qORG_ID.AsInteger,
                   'org_inst', qORG_INST.AsInteger
                   ]);
    _OpenQueryPar(qTExchSverka,
                  ['p_date',   qTExch_MinPrihMaxOut.FieldByName('max_out_date').AsDateTime,
                   'org_id',   qORG_ID.AsInteger,
                   'org_inst', qORG_INST.AsInteger
                   ]);
    if qTExch_MinPrihMaxOut.FieldByName('max_out_date').IsNull or qTExchSverka.IsEmpty then
       MessageDlg(TranslateText('Данный отчет не содержит данных'),
                     mtInformation, [mbOK], 0)
    else
      begin
        ActivateXLApp('TalonExchSverka','TalonExchSverka',1,XLApp,List);
        //XLApp.Visible:=true; //***********************************************

        List.Cells[5,'O'] := qTExch_MinPrihMaxOut.FieldByName('max_out_date').AsString;
        DogFillContractors(qDEP_ID.AsInteger, qDEP_INST.AsInteger, qORG_ID.AsInteger, qORG_INST.AsInteger,{in}
                             DepName, DepVLice, ClientName, ClientVLice);                                 {out}

        ExFormat(List,'A7',[DepName, DepVLice, ClientName, ClientVLice,
                            qTExch_MinPrihMaxOut.FieldByName('min_prih_date').AsString]);
                            
        line := FirstLine;
        qTExchSverka.First;
        repeat
          List.Cells[line,D_NPP]     := line - FirstLine + 1;
          List.Cells[line,D_DOG]     := qTExchSverkaDOG.AsString;
          List.Cells[line,D_DOGDATE] := qTExchSverkaDOG_DATE.AsDateTime;
          List.Cells[line,D_NPG]     := qTExchSverkaNP_GROUP.AsString;
          List.Cells[line,D_LITR]    := qTExchSverkaNOMINAL.AsInteger;
          List.Cells[line,D_SER]     := qTExchSverkaSER.AsString;
          List.Cells[line,D_NUM]     := qTExchSverkaNUM.AsInteger;
          List.Cells[line,D_COUNT]   := qTExchSverkaSHTUKI.AsInteger;

          List.Cells[line,C_NPP]     := line - FirstLine + 1;
          List.Cells[line,C_DOG]     := qTExchSverkaDOG.AsString;
          List.Cells[line,C_DOGDATE] := qTExchSverkaDOG_DATE.AsDateTime;
          List.Cells[line,C_NPG]     := qTExchSverkaNP_GROUP.AsString;
          List.Cells[line,C_LITR]    := qTExchSverkaNOMINAL.AsInteger;
          List.Cells[line,C_SER]     := qTExchSverkaSER.AsString;
          List.Cells[line,C_NUM]     := qTExchSverkaNUM.AsInteger;
          List.Cells[line,C_COUNT]   := qTExchSverkaSHTUKI.AsInteger;

          qTExchSverka.Next;
          inc(line);
          if not qTExchSverka.Eof then
            List.Rows[line].EntireRow.Insert;
        until qTExchSverka.Eof;

        DrawNetInExcel(List,1,16,FirstLine,line);
        List.Cells[line,D_COUNT] := Format('=SUM(%s%d:%0:s%2:d)',[D_COUNT, FirstLine, line-1]);
        List.Cells[line,C_COUNT] := Format('=SUM(%s%d:%0:s%2:d)',[C_COUNT, FirstLine, line-1]);

        XLApp.Visible:=true;
      end;
   finally
    qTExch_MinPrihMaxOut.Close;
    qTExchSverka.Close;
  end;
end;

procedure TTalonOutRefForm.miTalonExch_PrPerClick(Sender: TObject);
const FirstLine: integer = 10;
      D_NPP   = 'B';   C_NPP   = 'H';
      D_NPG   = 'C';   C_NPG   = 'I';
      D_LITR  = 'D';   C_LITR  = 'J';
      D_SER   = 'E';   C_SER   = 'K';
      D_NUM   = 'F';   C_NUM   = 'L';
      D_COUNT = 'G';   C_COUNT = 'M';  
var DepName, DepVLice, ClientName, ClientVLice: string;
    line: integer;

  function Max(const A, B: Integer): Integer;
  begin
    if A > B then
      Result := A
    else
      Result := B;
  end;

begin
  if q.IsEmpty then Abort;
  try
    _OpenQueryPar(qTExch_MinPrihMaxOut, ['org_id',  qORG_ID.AsInteger,   //додаткова угода виникає датою першого повернення талонів (опер_айді = 243)
                                         'org_inst',qORG_INST.AsInteger]);
    _OpenQueryPar(qTExchPrih, ['org_id',  qORG_ID.AsInteger,
                               'org_inst',qORG_INST.AsInteger,
                               'dog_id',  qDOG_ID.AsInteger,
                               'dog_inst',qDOG_INST.AsInteger,
                               'p_date',  qOUT_DATE.AsDateTime]);
    _OpenQueryPar(qTExchOut, ['head_id',  qID.AsInteger,
                              'head_inst',qINST.AsInteger]);
    If qTExch_MinPrihMaxOut.FieldByName('min_prih_date').IsNull
       or qTExch_MinPrihMaxOut.FieldByName('max_out_date').IsNull
       or qTExchPrih.IsEmpty
       or qTExchOut.IsEmpty
    then
      MessageDlg(TranslateText('Данный отчет не содержит данных'),
                   mtInformation, [mbOK], 0)
    else
      begin
        ActivateXLApp('TalonExchPrPered','TalonExchPrPered',1,XLApp,List);
        //XLApp.Visible:=true;{******************************************************}
        ExFormat(List,'H3',[qDOG.AsString, qTExch_MinPrihMaxOut.FieldByName('min_prih_date').AsString]);
        ExFormat(List,'H4',[qDOG.AsString, qDOG_DATE.AsString]);
        List.Cells[5,'M'] := qOUT_DATE.AsString;

        DogFillContractors(qDEP_ID.AsInteger, qDEP_INST.AsInteger, qORG_ID.AsInteger, qORG_INST.AsInteger,{in}
                             DepName, DepVLice, ClientName, ClientVLice);                                 {out}

        ExFormat(List,'A7',[DepName, DepVLice, ClientName, ClientVLice,
                             qTExch_MinPrihMaxOut.FieldByName('min_prih_date').AsString,
                             qTExch_MinPrihMaxOut.FieldByName('max_out_date').AsString]);

        line := FirstLine;
        qTExchPrih.First;
        qTExchOut.First;
        repeat
          if not qTExchPrih.EoF then
            begin
              List.Cells[line,D_NPP]   := line - FirstLine + 1;
              List.Cells[line,D_NPG]   := qTExchPrihNP_GROUP.AsString;
              List.Cells[line,D_LITR]  := qTExchPrihNOMINAL.AsInteger;
              List.Cells[line,D_SER]   := qTExchPrihSER.AsString;
              List.Cells[line,D_NUM]   := qTExchPrihNUM.AsInteger;
              List.Cells[line,D_COUNT] := qTExchPrihSHTUKI.AsInteger;
              qTExchPrih.Next;
            end;
          if not qTExchOut.EoF then
            begin
              List.Cells[line,C_NPP]   := line - FirstLine + 1;
              List.Cells[line,C_NPG]   := qTExchOutNP_GROUP.AsString;
              List.Cells[line,C_LITR]  := qTExchOutNOMINAL.AsInteger;
              List.Cells[line,C_SER]   := qTExchOutSER.AsString;
              List.Cells[line,C_NUM]   := qTExchOutNUM.AsInteger;
              List.Cells[line,C_COUNT] := qTExchOutSHTUKI.AsInteger;
              qTExchOut.Next;
            end;
          inc(line);
          if not (qTExchPrih.EoF and qTExchOut.EoF) then
            List.Rows[line].EntireRow.Insert;
        until qTExchPrih.EoF and qTExchOut.EoF;

        DrawNetInExcel(List,2,13,FirstLine,line);
        List.Cells[line,D_COUNT] := Format('=SUM(%s%d:%0:s%2:d)',[D_COUNT, FirstLine, line-1]);
        List.Cells[line,C_COUNT] := Format('=SUM(%s%d:%0:s%2:d)',[C_COUNT, FirstLine, line-1]);
        XLApp.Visible:=true;
      end;
  finally
    qTExchOut.Close;
    qTExchPrih.Close;
    qTExch_MinPrihMaxOut.Close;
  end;
end;

end.
