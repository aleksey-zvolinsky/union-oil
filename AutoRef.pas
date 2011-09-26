unit AutoRef;

interface

uses uCommonForm, Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, Base, Db, DBTables, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, Menus, Mask, ToolEdit, RxLookup, ActnList, RXCtrls, uOilQuery, Ora,
  uOilStoredProc, DBAccess, MemDS, DBGridEh{$IFDEF VER150},Variants,
  GridsEh, DBGridEhGrouping{$ENDIF};

type
  TAutoRefForm = class(TBaseForm)
    Label1: TLabel;
    edNumb: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edATP: TEdit;
    edDriver: TEdit;
    qID: TFloatField;
    qINST: TFloatField;
    qNUMB: TStringField;
    qATP: TStringField;
    Label4: TLabel;
    qCAPACITY: TFloatField;
    qEMPLOY_ID: TFloatField;
    qEMPLOY_INST: TFloatField;
    qSTATE: TStringField;
    qFULLNAME: TStringField;
    uq: TOraUpdateSQL;
    qWork: TOilQuery;
    qCheckDelete: TOilQuery;
    SpeedButton2: TSpeedButton;
    qAUTO_MODEL: TStringField;
    qAUTO_TYPE_ID: TFloatField;
    qAUTO_TYPE_NAME: TStringField;
    qAUTO_GROUP_NAME: TStringField;
    dsType: TOraDataSource;
    qType: TOilQuery;
    leType: TRxLookupEdit;
    qAUTO_GROUP_ID: TFloatField;
    RxSpeedButton1: TRxSpeedButton;
    pmAdd: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    qDEP_NAME: TStringField;
    edInst: TComboEdit;
    lblInst: TLabel;
    sbClearInst: TSpeedButton;
    qAUTO_TYPE: TStringField;
    qDRIVER: TStringField;
    qIS_HAVE_DET: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject); override;
    procedure sbDelClick(Sender: TObject);
    procedure qAfterPost(DataSet: TDataSet);
    procedure SpeedButton2Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edInstButtonClick(Sender: TObject);
    procedure sbClearInstClick(Sender: TObject);
  private
    FInst: integer;
  public
    TypeID: integer;
    class function Choose(var AAutoId, AAutoInst: integer; var AFullAuto: string;
      var AEmpId, AEmpInst: integer; var AFullName: string): boolean;
  end;

var
  AutoRefForm: TAutoRefForm;

implementation

uses Main, Auto, AutoShip, OilStd, UDbFunc, ExFunc, ChooseOrg;

{$R *.DFM}

//==============================================================================
procedure TAutoRefForm.FormShow(Sender: TObject);
begin
  edNumb.SetFocus;
  bbSearch.Click;
  // шукаємо вказаний тип
  qType.Open;
  if TypeID <> 0 then
  begin
    while not qType.Eof do
    begin
      if TypeID = qType['ID'] then
      begin
        leType.Text := qType['Type_Name'];
        bbSearch.Click;
        exit;
      end;
      qType.Next;
    end;
    qType.First;
  end;
end;
//==============================================================================
procedure TAutoRefForm.bbClearClick(Sender: TObject);
begin
  edNumb.Clear;
  edATP.Clear;
  edDriver.Clear;
  leType.Text := '';
  sbClearInst.Click;
end;
//==============================================================================
procedure TAutoRefForm.bbSearchClick(Sender: TObject);
var
  CurId, CurInst: Integer;
  type_id: Variant;
begin
  try
    q.DisableControls;
    CurId := q.FieldByName('Id').AsInteger;
    CurInst := q.FieldByName('Inst').AsInteger;
    if leType.Text = '' then
      type_id := null
    else
      type_id := qType['id'];

    q.Close;
    _OpenQueryPar(q,
      ['numb',    edNumb.Text,
       'driver',  edDriver.Text,
       'atp',     edATP.Text,
       'type_id', type_id,
       'inst', BoolTo_(FInst=0,null,FInst)
       ]);
    //_OpenQuery(q);

    while not ((q.Eof) or ((CurId = q.FieldByName('Id').AsInteger)
      and (CurInst = q.FieldByName('Inst').AsInteger))
      or ((CurId = 0) and (CurInst = 0))) do
      q.Next;
    if (q.Eof) and ((CurId <> q.FieldByName('Id').AsInteger)
      or (CurInst <> q.FieldByName('Inst').AsInteger)) then
      q.First;
    q.EnableControls;
  finally
    q.EnableControls;
  end;
end;
//==============================================================================
procedure TAutoRefForm.sbAddClick(Sender: TObject);
begin
  StartSQL;
  try
    q.Insert;
    q.FieldByName('Id').AsInteger := GetSeqNextVal('S_OIL_AUTO');
    q.FieldByName('Inst').AsInteger := Inst;

    TAutoForm.Edit(q['id'], q['inst']);
    bbSearch.Click;
  except on E: Exception do
    begin
      ShowMessage(E.Message);
      RollbackSQL;
      bbSearchClick(nil);
    end;
  end;
end;
//==============================================================================
procedure TAutoRefForm.sbEditClick(Sender: TObject);
begin
  if q.IsEmpty then exit;
  if q['auto_group_id'] = 5 then
  begin
    if TAutoShipForm.Edit(q['id'], q['inst']) then bbSearch.Click;
  end
  else
  begin
    if (Inst <> q.FieldByName('Inst').AsInteger) then
      raise Exception.Create(TranslateText('Нельзя редактировать запись, созданную другой организацией'));
    if TAutoForm.Edit(q['id'], q['inst']) then
      bbSearch.Click;
  end;
end;
//==============================================================================
procedure TAutoRefForm.sbDelClick(Sender: TObject);
begin
  if q.IsEmpty then Abort;
  StartSQL;
  try
    if (Inst <> q.FieldByName('Inst').AsInteger) then
      raise Exception.Create(TranslateText('Нельзя редактировать запись, созданную другой организацией'))
    else
    begin
      qWork.Close;
      qWork.SQL.Text := 'select * from Oil_Auto where Id = '+ q.FieldByName('Id').AsString +
        ' and Inst = '+ q.FieldByName('Inst').AsString +' for update nowait';
      qWork.Open;
      qWork.SQL.Text := 'update Oil_Auto set State = ''Y'' where Id = '+ q.FieldByName('Id').AsString +
        ' and Inst = '+ q.FieldByName('Inst').AsString;
      qWork.ExecSQL;
    end;
    if MessageDlg(TranslateText('Вы уверены что хотите удалить текущую запись ?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      qCheckDelete.Close;
      qCheckDelete.ParamByName('Id').Value := q.FieldByName('Id').Value;
      qCheckDelete.ParamByName('Inst').Value := q.FieldByName('Inst').Value;
      qCheckDelete.Open;
      if qCheckDelete.IsEmpty then q.Delete
      else
        raise Exception.Create(TranslateText('Удалить данный автомобиль невозможно. ' +
          'К нему привязаны операции. Удалите сначала их.'));
    end;
    CommitSQL;
    bbSearchClick(nil);
  except on E: Exception do
    begin
      RollbackSQL;
      bbSearchClick(nil);
      ShowMessage(E.Message);
    end;
  end;
end;
//==============================================================================
procedure TAutoRefForm.qAfterPost(DataSet: TDataSet);
begin
  q.ApplyUpdates;
  q.CommitUpdates;
end;
//==============================================================================
procedure TAutoRefForm.SpeedButton2Click(Sender: TObject);
begin
  leType.Clear;
  bbSearch.Click;
end;
//==============================================================================
procedure TAutoRefForm.N2Click(Sender: TObject);
begin
  if TAutoShipForm.Edit(0, MAIN_ORG.INST) then
    bbSearch.Click;
end;
//==============================================================================
procedure TAutoRefForm.FormCreate(Sender: TObject);
begin
  inherited;
  TypeID := 0;
  bbClearClick(nil);  
end;
//==============================================================================
procedure TAutoRefForm.edInstButtonClick(Sender: TObject);
var
  vId,vInst: integer;
  vName: string;
begin
  inherited;
  if ChooseOrg.CaptureOrg(1,Main_id,Inst,'yyy',vId,vInst,vName) then
  begin
    FInst := vInst;
    edInst.Text := vName;
    bbSearch.Click;
  end;
end;
//==============================================================================
procedure TAutoRefForm.sbClearInstClick(Sender: TObject);
begin
  inherited;
  edInst.Text := '';
  FInst := 0;
end;
//==============================================================================
class function TAutoRefForm.Choose(var AAutoId, AAutoInst: integer;
  var AFullAuto: string; var AEmpId, AEmpInst: integer;
  var AFullName: string): boolean;
var
  AutoRefForm : TAutoRefForm;
begin
  Result := False;
  Application.CreateForm(TAutoRefForm, AutoRefForm);
  try
    if AutoRefForm.ShowModal = mrOk Then
    begin
      AFullAuto := AutoRefForm.qAUTO_MODEL.AsString +' '+ AutoRefForm.qNumb.AsString;
      AAutoId  := AutoRefForm.qId.AsInteger;
      AAutoInst   := AutoRefForm.qInst.AsInteger;
      if not AutoRefForm.qEmploy_id.IsNull and not AutoRefForm.qEmploy_inst.IsNull then
      begin
        AFullName := AutoRefForm.qFullname.AsString;
        AEmpId := AutoRefForm.qEmploy_id.AsInteger;
        AEmpInst := AutoRefForm.qEmploy_inst.AsInteger;
      end;
      Result := True;
    end;
  finally
    AutoRefForm.Free;
  end;  
end;
//==============================================================================

end.
