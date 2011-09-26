unit PolisData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uXMLForm,
  StdCtrls, Buttons, uHelpButton, ExtCtrls, Mask, ToolEdit, Grids, DBGridEh,
  ComCtrls, Db, DBTables, MemTable, Menus, MemDS, DBAccess, Ora, ActnList,
  uCommonForm,uOilQuery,uOilStoredProc;

type
  TPolisDataForm = class(TCommonForm)
    pnlBottom: TPanel;
    OilHelpButton: TOilHelpButton;
    bbCancel: TBitBtn;
    btnCancel: TBitBtn;
    bbOk: TBitBtn;
    dbg: TDBGridEh;
    ceFrom: TComboEdit;
    spbOrgClear: TSpeedButton;
    ceOperName: TComboEdit;
    spbOperClear: TSpeedButton;
    lblOrg: TLabel;
    lblOper: TLabel;
    mt: TMemoryTable;
    ds: TOraDataSource;
    mtSer: TStringField;
    mtNum: TStringField;
    mtAmount: TFloatField;
    sbDelRec: TSpeedButton;
    pmRange: TPopupMenu;
    miRange: TMenuItem;
    deDate: TDateEdit;
    Label1: TLabel;
    qryNum: TOilQuery;
    qrySer: TOilQuery;
    mtId: TFloatField;
    mtInst: TFloatField;
    ActionList: TActionList;
    actEsc: TAction;
    sbToClear: TSpeedButton;
    lblTo: TLabel;
    ceTo: TComboEdit;
    Label2: TLabel;
    ceEmp: TComboEdit;
    sbEmpClear: TSpeedButton;
    procedure ceFromButtonClick(Sender: TObject);
    procedure ceOperNameDblClick(Sender: TObject);
    procedure spbOrgClearClick(Sender: TObject);
    procedure spbOperClearClick(Sender: TObject);
    procedure sbDelRecClick(Sender: TObject);
    procedure miRangeClick(Sender: TObject);
    procedure mtBeforeEdit(DataSet: TDataSet);
    procedure bbOkClick(Sender: TObject);
    procedure dbgExit(Sender: TObject);
    procedure mtBeforePost(DataSet: TDataSet);
    procedure actEscExecute(Sender: TObject);
    procedure ceToButtonClick(Sender: TObject);
    procedure ceOperNameChange(Sender: TObject);
    procedure sbToClearClick(Sender: TObject);
    procedure ceEmpButtonClick(Sender: TObject);
    procedure sbEmpClearClick(Sender: TObject);
    procedure deDateChange(Sender: TObject);
  private
    FFromId : Integer;
    FFromInst : Integer;
    FToId : Integer;
    FToInst : Integer;
    FEmpId : Integer;
    FEmpInst : Integer;
    FOperId : Integer;
    FIsNewPolis : boolean;
    procedure PrepareForm;
    procedure InsertRange(ASer: String; AFrom, ATo: Integer);
    procedure FillDataFromRef();
  public
    procedure AddPolis(Sender: TObject);
    procedure EditPolis(Sender: TObject);
    procedure DelPolis(Sender: TObject);
  end;

var
  PolisDataForm: TPolisDataForm;

procedure ProcessPolisForm(AXMLForm: TXMLForm);

implementation

uses ChooseOrg, Main, PolisRange, UDbFunc, OilStd, uStart, EmpRef;

procedure ProcessPolisForm(AXMLForm: TXMLForm);
begin
  PolisDataForm := TPolisDataForm.Create(AXMLForm);
  with AXMLForm, PolisDataForm do
  begin
    sbAdd.OnClick := AddPolis;
    sbEdit.OnClick := EditPolis;
    sbDel.OnClick := DelPolis;
  end;
end;

{$R *.DFM}

{ TPolisDataForm }

procedure TPolisDataForm.AddPolis(Sender: TObject);
begin
  PrepareForm;
  FIsNewPolis := True;
  deDate.Date := now;
  deDate.Enabled := (deDate.Date > StrToDate(CLOSE_DATE));
  ShowModal;
end;

procedure TPolisDataForm.EditPolis(Sender: TObject);
begin
  if TXmlForm(Owner).FQuery.IsEmpty
    then Exit;
  PrepareForm;
  FillDataFromRef;
  FIsNewPolis := False;
  deDate.Enabled := (deDate.Date > StrToDate(CLOSE_DATE));
  ShowModal;
end;

procedure TPolisDataForm.DelPolis(Sender: TObject);
begin
  if TXmlForm(Owner).FQuery.IsEmpty
    then Exit;

  if MessageDlg(TranslateText('Подтвердите удаление операции') , mtConfirmation,[mbYes,mbNo],0) = mrNo
    then Exit  ;

  with TXmlForm(Owner).FQuery do
  begin
    StartSQLOra;
    try
      _ExecProcOra('prc_polis_move',[
        'ADate', FieldByName('oper_date').AsDateTime ,
        'AFromId', FieldByName('from_id').AsInteger ,
        'AFromInst', FieldByName('from_inst').AsInteger ,
        'ASer', FieldByName('ser').AsString,
        'ANum', FieldByName('num').AsString,
        'AOperId', FieldByName('oper_id').AsInteger,
        'AAmount', FieldByName('oper_id').AsFloat ,
        'AState', 'N',
        'AId', FieldByName('id').AsInteger,
        'Ainst', FieldByName('inst').AsInteger,
        'AToId',FToId,
        'AToInst',FToInst,
        'AEmpId', FEmpId,
        'AEmpInst',FEmpInst        
      ]);
     CommitSQLOra;
     TXmlForm(Owner).bbSearch.Click;
    except on E: Exception do
      begin
        RollBackSQLOra;
        if pos(#10, E.Message) > 0
          then  MessageDlg(copy(E.Message,0,pos(#10, E.Message)),mtWarning,[mbOk],0)
          else  MessageDlg(E.Message,mtWarning,[mbOk],0)
      end;
    end;
  end; //with
end;

procedure TPolisDataForm.ceFromButtonClick(Sender: TObject);
var
  vId, vInst : Integer;
  vName: String;
begin
  if ChooseOrg.CaptureOrg(0, MAIN_ID, INST, 'yyy', vId, vInst, vName) then
  begin
    ceFrom.Text := vName;
    FFromId := vId;
    FFromInst := vInst;
  end;  
end;

procedure TPolisDataForm.ceOperNameDblClick(Sender: TObject);
var
  Form : TXMLForm;
begin
  Form := GetXMLFormAsFilter('PolisTypeRef');
  try with Form do
    ShowModal;
    if Form.ModalResult = mrOk then
    begin
      FOperId := Form.FQuery['id'];
      ceOperName.Text := Form.FQuery['name'];
      dbg.Columns[2].Visible := FOperId = 2 ;
    end;
  finally
    Form.Free;
  end;  
end;

procedure TPolisDataForm.spbOrgClearClick(Sender: TObject);
begin
  ceFrom.Clear;
  FFromId := 0;
  FFromInst := 0;
end;

procedure TPolisDataForm.spbOperClearClick(Sender: TObject);
begin
  ceOperName.Clear;
  FOperId := 0;
  dbg.Columns[2].Visible := FOperId = 2 ;
end;

procedure TPolisDataForm.PrepareForm;
begin

  ceOperName.Enabled := true;
  spbOperClear.Enabled := true;

  spbOrgClear.Click;
  spbOperClear.Click;
  sbToClear.Click;
  sbEmpClear.Click;

  if GetSQLValue('select count(*) from oil_polis where state=''Y'' and oper_id =1 ') > 0
  then  begin
    FOperId := 2;
    ceOperName.Text := GetSQLValue('select name from v_oil_polis_type where id = 2');
  end
  else
  begin
    FOperId := 1;
    ceOperName.Text := GetSQLValue('select name from v_oil_polis_type where id = 1');
  end;

  if mt.Active
    then mt.EmptyTable;
  mt.Close;
  mt.Open;


  deDate.Date := 0;
  dbg.Columns[2].Visible := FOperId = 2 ;

  {Установить головную организацию}
  FFromId := Main.Inst;
  FFromInst := Main.Inst;
  ceFrom.Text := GetOrgName(Main.Inst,Main.Inst);

  {Заполнить MRU лист данными}
  if GetSQLValue('select count(*) from oil_polis') >= Screen.Width * 2
    then exit;

  dbg.Columns[0].MRUList.Items.Clear;
  if qrySer.Active then qrySer.Close;
  qrySer.Open;
  while not qrySer.Eof do with qrySer do
  begin
    dbg.Columns[0].MRUList.Items.Add(qrySer['ser']);
    Next;
  end;

  dbg.Columns[1].MRUList.Items.Clear;
  if qryNum.Active then qryNum.Close;
  qryNum.Open;
  while not qryNum.Eof do with qryNum do
  begin
    dbg.Columns[1].MRUList.Items.Add(qryNum['num']);
    Next;
  end;


end;

procedure TPolisDataForm.sbDelRecClick(Sender: TObject);
begin
  if mt.Active and (mt.RecordCount > 0)
    then mt.Delete;
end;

procedure TPolisDataForm.miRangeClick(Sender: TObject);
begin
  PolisRangeForm := TPolisRangeForm.Create(Self);
  try
    with PolisRangeForm do
    begin
      ShowModal;
      if ModalResult = mrOk
        then InsertRange(edtSer.Text,StrToInt(edtFrom.Text),StrToInt(edtTo.Text));
    end;
  finally
    FreeAndNil(PolisRangeForm);
  end;  
end;

procedure TPolisDataForm.InsertRange(ASer: String; AFrom,ATo: Integer);
var
  I: Integer;
begin
  for I:=AFrom + (ATo-AFrom) downto AFrom do
  begin
    Application.ProcessMessages;
    mt.Insert;
    mtSer.AsString := ASer;
    mtNum.AsInteger := I;
    mt.Post;
  end;
end;

procedure TPolisDataForm.mtBeforeEdit(DataSet: TDataSet);
begin
  if FOperId <= 0 then
    raise Exception.Create(TranslateText('Прежде чем вводить данные нужно выбрать операцию'));
  mt.Cancel;  
end;

procedure TPolisDataForm.bbOkClick(Sender: TObject);
var
  Amount : Double;
begin
  if ceFrom.Text = ''
    then raise Exception.Create(TranslateText('Не указана поставщик'));

  if ceOperName.Text = ''
    then raise Exception.Create(TranslateText('Не указана операция'));

  if mt.RecordCount <=0
    then raise Exception.Create(TranslateText('Нужно ввести хотябы один полис'));

  if (ceTo.Text = '') and (FOperId <> 3)
    then raise Exception.Create(TranslateText('Не указан получатель'));

  if (ceEmp.Text = '') and (FOperId in [4])
    then raise Exception.Create(TranslateText('Не указано материально ответственное лицо'));

  StartSQLOra;
  try
    mt.First;
    while not mt.Eof do
    begin

      if FOperId <> 2
        then Amount := 0
        else Amount := mtAmount.AsFloat;

      if mtSer.asString = ''
        then raise Exception.Create(TranslateText('Не указана серия полиса'));

      if mtNum.AsString = ''
        then raise Exception.Create(TranslateText('Не указан номер полиса'));

      if (FOperId = 2) and (Amount <= 0)
        then raise Exception.Create(TranslateText('Не указанa сумма полиса'));


      Application.ProcessMessages;
      
      _ExecProcOra('prc_polis_move',[
        'ADate', deDate.Date,
        'AFromId', FFromId,
        'AFromInst', FFromInst,
        'ASer', mtSer.asString,
        'ANum', mtNum.AsString,
        'AOperId', FOperId,
        'AAmount', Amount,
        'AState','Y' ,
        'AId',mtId.AsInteger,
        'AInst',mtInst.AsInteger,
        'AToId',FToId,
        'AToInst',FToInst,
        'AEmpId', FEmpId,
        'AEmpInst',FEmpInst
      ]);

      mt.Next;
    end;

    CommitSQLOra;
    ModalResult := mrOk;
    TXmlForm(Owner).bbSearch.Click;
  except on E: Exception do
    begin
      RollBackSQLOra;
      if pos(#10, E.Message) > 0
        then  MessageDlg(copy(E.Message,0,pos(#10, E.Message)),mtWarning,[mbOk],0)
        else  MessageDlg(E.Message,mtWarning,[mbOk],0)
    end;
  end;
end;

procedure TPolisDataForm.dbgExit(Sender: TObject);
begin
  if mt.Active
    then if mt.State in [dsInsert, dsEdit]
      then mt.Post;
end;

procedure TPolisDataForm.mtBeforePost(DataSet: TDataSet);
begin
  mtSer.AsString := AnsiUpperCase(mtSer.AsString);
end;

procedure TPolisDataForm.FillDataFromRef;
begin
  with TXmlForm(Owner).FQuery do
    if not IsEmpty and (mt.Active) then
  begin
    FOperId :=  FieldByName('oper_id').AsInteger;
    ceOperName.Text := FieldByName('oper_name').AsString;
    ceFrom.Text := FieldByName('from_name').AsString;

    ceTo.Text := FieldByName('to_name').AsString;
    FToId := FieldByName('to_id').AsInteger;
    FToInst := FieldByName('to_inst').AsInteger;

    ceEmp.Text := FieldByName('emp_name').AsString;
    FEmpId := FieldByName('emp_id').AsInteger;
    FEmpInst := FieldByName('emp_inst').AsInteger;

    FFromId := FieldByName('from_id').AsInteger;
    FFromInst := FieldByName('from_inst').AsInteger;
    mt.Insert;
    mtSer.AsString := FieldByName('Ser').AsString;
    mtNum.AsString := FieldByName('Num').AsString;
    mtAmount.AsString := FieldByName('Amount').AsString;
    mtId.AsInteger := FieldByName('id').AsInteger;
    mtInst.AsInteger := FieldByName('inst').AsInteger;
    deDate.Date := FieldByName('oper_date').AsDateTime;
    dbg.Columns[2].Visible := FieldByName('oper_id').AsInteger = 2 ;

    ceOperName.Enabled := false;
    spbOperClear.Enabled := false;
    
    mt.Post;
  end;
end;

procedure TPolisDataForm.actEscExecute(Sender: TObject);
begin
  Close;
end;

procedure TPolisDataForm.ceToButtonClick(Sender: TObject);
var
  vId, vInst : Integer;
  vName: String;
begin
  case FOperId of
  4:
    if ChooseOrg.CaptureOrg(2, MAIN_ID, INST, 'nnn', vId, vInst, vName) then
    begin
      ceTo.Text := vName;
      FToId := vId;
      FToInst := vInst;
    end;
  1:
    if ChooseOrg.CaptureOrg(0, MAIN_ID, INST, 'yyy', vId, vInst, vName) then
    begin
      ceTo.Text := vName;
      FToId := vId;
      FToInst := vInst;
    end;
   else
    if ChooseOrg.CaptureOrg(3, MAIN_ID, INST, 'yyy', vId, vInst, vName) then
    begin
      ceTo.Text := vName;
      FToId := vId;
      FToInst := vInst;
    end;
  end;
end;

procedure TPolisDataForm.ceOperNameChange(Sender: TObject);
begin
  ceEmp.Enabled := FOperId in [4];
  sbEmpClear.Enabled := FOperId in [4];
  ceTo.Enabled :=  FOperId <> 3;
  sbToClear.Enabled :=  FOperId <> 3;

end;

procedure TPolisDataForm.sbToClearClick(Sender: TObject);
begin
  ceTo.Clear;
  FToId := 0;
  FToInst := 0; 
end;

procedure TPolisDataForm.ceEmpButtonClick(Sender: TObject);
var
  EmpForm: TEmpRefForm;
begin
  try
    EmpForm:= TEmpRefForm.Create(Application);
    if EmpForm.ShowModal = mrOk
      then if not EmpForm.q.Eof
        then with EmpForm do
    begin
      FEmpId := qID.AsInteger;
      FEmpInst := qINST.AsInteger;
      ceEmp.Text := qF_NAME.AsString + ' ' + qI_NAME.AsString[1] + '. ' +qO_NAME.AsString[1] + '.';
    end;
  finally
    EmpForm.free;
  end;
end;

procedure TPolisDataForm.sbEmpClearClick(Sender: TObject);
begin
  ceEmp.Clear;
  FEmpId := 0;
  FEmpInst := 0;
end;

procedure TPolisDataForm.deDateChange(Sender: TObject);
begin
  bbOk.Enabled := (deDate.Date > StrToDate(CLOSE_DATE));
end;

end.
