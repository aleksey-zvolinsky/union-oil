unit EmpRef;

interface

uses uCommonForm, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Base, Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask, Dialogs,
  ToolEdit, Menus, DBCtrls, ActnList, RXCtrls, uOilQuery, Ora, uOilStoredProc,
  DBAccess, MemDS, DBGridEh, MemTable, GridsEh;

type
  TEmpRefForm = class(TBaseForm)
    SP: TOilStoredProc;
    Label1: TLabel;
    eSurName: TEdit;
    Label2: TLabel;
    eName: TEdit;
    Label4: TLabel;
    deBirthDate: TDateEdit;
    eIdNum: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    eAddress: TEdit;
    qID: TFloatField;
    qI_NAME: TStringField;
    qF_NAME: TStringField;
    qO_NAME: TStringField;
    qSEX: TStringField;
    qDATE_BIRTH: TDateTimeField;
    qID_NUM: TStringField;
    qADDR: TStringField;
    qPASS_NUM: TStringField;
    qPASS_GIVE: TStringField;
    qPASS_GIVE_D: TDateTimeField;
    qPHONE: TStringField;
    qHIRE_DATE: TDateTimeField;
    qPOST_: TStringField;
    qDIS_DATE: TDateTimeField;
    qINST: TFloatField;
    qORG_ID: TFloatField;
    qORG_INST: TFloatField;
    qORG_NAME: TStringField;
    Label7: TLabel;
    Label14: TLabel;
    SpeedButton1: TSpeedButton;
    ePost_: TEdit;
    ceOrg: TComboEdit;
    Label8: TLabel;
    ePassNum: TEdit;
    uq: TOraUpdateSQL;
    qWork: TOilQuery;
    qCheckDelete: TOilQuery;
    Label10: TLabel;
    qSTATE: TStringField;
    cbSex: TComboBox;
    cbIsWorking: TCheckBox;
    procedure bbClearClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject); override;
    procedure ceOrgButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qAfterPost(DataSet: TDataSet);
  private
  public
    SOrgId, SOrgInst: Integer;
    class function Choose(var AEmpId: integer; var AEmpInst: integer; var AFullName: string): boolean; overload;    
  end;

var
  EmpRefForm: TEmpRefForm;

implementation

uses Emp, OilStd, Main, ChooseOrg;

{$R *.DFM}

procedure TEmpRefForm.bbClearClick(Sender: TObject);
begin
  eSurName.Clear;
  eName.Clear;
  deBirthDate.Clear;
  eIdNum.Clear;
  eAddress.Clear;
  ePassNum.Clear;
  ePost_.Clear;
  cbSex.Text := '';
  ceOrg.Text := '';
end;

procedure TEmpRefForm.sbAddClick(Sender: TObject);
var
  EmpForm: TEmpForm;
begin
  StartSQL;
  try
    qWork.Close;
    qWork.SQL.Text := 'select s_oil_employ.nextval from sys.dual';
    qWork.Open;

    q.Append;
    q.FieldByName('Id').AsInteger := qWork.fields[0].AsInteger;
    q.FieldByName('Inst').AsInteger := Inst;

    Application.CreateForm(TEmpForm, EmpForm);
    EmpForm.ShowModal;
    if EmpForm.ModalResult = mrOk then
    begin
      CommitSQL;
      bbSearchClick(nil);
    end
    else
    begin
      RollbackSQL;
      bbSearchClick(nil);
    end;
    EmpForm.Free;

  except on E: Exception do
    begin
      RollbackSQL;
      bbSearchClick(nil);
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TEmpRefForm.bbSearchClick(Sender: TObject);
var
  CurId, CurInst: Integer;
begin
  try
    q.DisableControls;
    CurId := q.FieldByName('Id').AsInteger;
    CurInst := q.FieldByName('Inst').AsInteger;
    q.Close;
    if eSurName.Text <> '' then q.ParamByName('SurName').AsString := eSurName.Text
    else q.ParamByName('SurName').Clear;

    if eName.Text <> '' then q.ParamByName('Name').AsString := eName.Text
    else q.ParamByName('Name').Clear;

    if eIdNum.Text <> '' then q.ParamByName('IdNum').AsString := eIdNum.Text
    else q.ParamByName('IdNum').Clear;

    if eAddress.Text <> '' then q.ParamByName('Address').AsString := eAddress.Text
    else q.ParamByName('Address').Clear;

    if ePassNum.Text <> '' then q.ParamByName('PassNum').AsString := ePassNum.Text
    else q.ParamByName('PassNum').Clear;

    if cbIsWorking.Checked then q.ParamByName('IsWorking').AsString := 'Y'
    else q.ParamByName('IsWorking').Clear;

    if ePost_.Text <> '' then q.ParamByName('Post_').AsString := ePost_.Text
    else q.ParamByName('Post_').Clear;

    if deBirthDate.Date <> 0 then q.ParamByName('BirthDate').AsDate := deBirthDate.Date
    else q.ParamByName('BirthDate').Clear;

    if cbSex.Text <> '' then q.ParamByName('Sex').AsString := cbSex.Text
    else q.ParamByName('Sex').Clear;

    if ceOrg.Text <> '' then
    begin
      q.ParamByName('OrgId').AsInteger := SOrgId;
      q.ParamByName('OrgInst').AsInteger := SOrgInst;
    end
    else
    begin
      q.ParamByName('OrgId').Clear;
      q.ParamByName('OrgInst').Clear;
    end;

    q.Open;
    while not ((q.Eof) or ((CurId = q.FieldByName('Id').AsInteger) and (CurInst = q.FieldByName('Inst').AsInteger))
      or ((CurId = 0) and (CurInst = 0))) do
      q.Next;
    if (q.Eof) and ((CurId <> q.FieldByName('Id').AsInteger) or (CurInst <> q.FieldByName('Inst').AsInteger)) then
      q.First;
    q.EnableControls;

  finally
    q.EnableControls;
  end
end;

procedure TEmpRefForm.sbDelClick(Sender: TObject);
begin
  if q.IsEmpty then Abort;
  StartSQL;
  try
    if Inst <> q.FieldByName('Inst').AsInteger then
      raise Exception.Create(TranslateText('Ќельз€ редактировать запись, созданную другой организацией'))
    else
    begin
      qWork.Close;
      qWork.SQL.Text := 'select * from Oil_Employ where Id = '+ q.FieldByName('Id').AsString +
        ' and Inst = '+ q.FieldByName('Inst').AsString +' for update nowait';
      qWork.Open;
      qWork.SQL.Text := 'update Oil_Employ set State = ''Y'' where Id = '+ q.FieldByName('Id').AsString +
        ' and Inst = '+ q.FieldByName('Inst').AsString;
      qWork.ExecSQL;
    end;

    if MessageDlg(TranslateText('¬ы уверены что хотите удалить текущую запись ?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      qCheckDelete.Close;
      qCheckDelete.ParamByName('Id').Value := q.FieldByName('Id').Value;
      qCheckDelete.ParamByName('Inst').Value := q.FieldByName('Inst').Value;
      qCheckDelete.Open;
      if qCheckDelete.IsEmpty then q.Delete
      else
        raise Exception.Create(TranslateText('”далить данного сотрудника невозможно. — ним св€заны операции. ”далите сначала их.'));
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

procedure TEmpRefForm.sbEditClick(Sender: TObject);
var
  EmpForm: TEmpForm;
begin
  if q.IsEmpty then Abort;
  StartSQL;
  try
    if (Inst <> q.FieldByName('Inst').AsInteger) then
      raise Exception.Create(TranslateText('Ќельз€ редактировать запись, созданную другой организацией'))
    else
    begin
      qWork.Close;
      qWork.SQL.Text := 'select * from Oil_Employ where Id = '+ q.FieldByName('Id').AsString +
        ' and Inst = '+ q.FieldByName('Inst').AsString +' for update nowait';
      qWork.Open;
      qWork.Close;
      qWork.SQL.Text := 'update Oil_Employ set State = ''Y'' where Id = '+ q.FieldByName('Id').AsString +
        ' and Inst = '+ q.FieldByName('Inst').AsString;
      qWork.ExecSQL;
      q.Edit;
    end;

    Application.CreateForm(TEmpForm, EmpForm);
    EmpForm.ShowModal;
    if EmpForm.ModalResult = mrOk then
    begin
      CommitSQL;
      bbSearchClick(nil);
    end
    else
    begin
      RollbackSQL;
      bbSearchClick(nil);
    end;
    EmpForm.Free;

  except on E: Exception do
    begin
      RollbackSQL;
      bbSearchClick(nil);
      if Pos('ORA-00054', E.Message) <> 0 then
        ShowMessage(TranslateText('Ёта запись редактируетс€ другим пользователем !'))
      else ShowMessage(E.Message);
    end;
  end;
end;

procedure TEmpRefForm.ceOrgButtonClick(Sender: TObject);
var
  vId, vInst: Integer;
  vName: string;
begin
  if ChooseOrg.CaptureOrg(1, MAIN_ID, INST, 'yyy', vId, vInst, vName) then
  begin
    SOrgId := vId;
    SOrgInst := vInst;
    ceOrg.Text := vName;
  end;
end;

procedure TEmpRefForm.SpeedButton1Click(Sender: TObject);
begin
  ceOrg.Text := '';
end;

procedure TEmpRefForm.FormShow(Sender: TObject);
begin
  inherited;
  bbSearchClick(Sender);
end;

procedure TEmpRefForm.qAfterPost(DataSet: TDataSet);
begin
  q.ApplyUpdates;
  q.CommitUpdates;
end;

class function TEmpRefForm.Choose(var AEmpId, AEmpInst: integer;
  var AFullName: string): boolean;
var
  EmpRefForm: TEmpRefForm;
begin
  Result := False;
  Application.CreateForm(TEmpRefForm, EmpRefForm);
  try
    if EmpRefForm.ShowModal = mrOk then
    begin
      AEmpId := EmpRefForm.qID.AsInteger;
      AEmpInst := EmpRefForm.qInst.AsInteger;
      AFullName := EmpRefForm.qF_NAME.AsString;
      if not (EmpRefForm.qI_NAME.AsString[1] in [' ', '_']) then
        AFullName := AFullName + ' ' + EmpRefForm.qI_NAME.AsString[1] + '.';
      if not (EmpRefForm.qO_NAME.AsString[1] in [' ', '_']) then
        AFullName := AFullName + ' ' + EmpRefForm.qO_NAME.AsString[1] + '.';
      Result := True;
    end;
  finally
    EmpRefForm.Free;
  end;  
end;

end.
