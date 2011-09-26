unit SOther;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, StdCtrls, Grids, RXDBCtrl, Buttons, ExtCtrls, Mask, ToolEdit,
  DBCtrls, DBGridEh, uCommonForm, uOilQuery, Ora, uOilStoredProc, MemDS, SRep,
  DBAccess, ActnList, GridsEh, DBGridEhGrouping;

type
  TSOtherForm = class(TCommonForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbClose: TBitBtn;
    Table1: TTable;
    ds: TDataSource;
    Query1: TQuery;
    Table1Oper_name: TStringField;
    Table1Litr: TFloatField;
    Table1Price: TFloatField;
    Table1CountT: TFloatField;
    Table1Org_name: TStringField;
    sbDel: TSpeedButton;
    qAuto: TOilQuery;
    dsAuto: TOraDataSource;
    qEmploy: TOilQuery;
    dsEmploy: TOraDataSource;
    Table1Numb: TStringField;
    Table1FullName: TStringField;
    Table1SC_Number: TStringField;
    Table1SC_Rest: TFloatField;
    Table1SC_Cheque: TStringField;
    dsDog: TOraDataSource;
    qDog: TOilQuery;
    Table1Dog_Name: TStringField;
    Table1Dog_Date: TDateField;
    qWork: TOilQuery;
    Table1Amount: TFloatField;
    Panel3: TPanel;
    Panel2: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    dbgOther: TDBGridEh;
    gbAuto: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    sbDelAuto: TSpeedButton;
    sbDelDriver: TSpeedButton;
    dbceDriver: TRxDBComboEdit;
    dbceAutoNumb: TRxDBComboEdit;
    cbByCard: TCheckBox;
    gbSmartCard: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dbeSCNumber: TDBEdit;
    dbeSCRest: TDBEdit;
    dbeSCCheque: TDBEdit;
    Table1Ttn_Id: TIntegerField;
    Table1Ttn_Inst: TIntegerField;
    Table1Oper_ID: TIntegerField;
    Table1SubPart: TIntegerField;
    Table1Org_id: TIntegerField;
    Table1Org_inst: TIntegerField;
    Table1Auto_id: TIntegerField;
    Table1Auto_Inst: TIntegerField;
    Table1Employ_Id: TIntegerField;
    Table1Employ_Inst: TIntegerField;
    Table1Dog_Id: TIntegerField;
    Table1Dog_Inst: TIntegerField;
    ActionList: TActionList;
    actSave: TAction;
    actA: TAction;
    actE: TAction;
    actDel: TAction;
    procedure FormShow(Sender: TObject);
    procedure Table1CalcFields(DataSet: TDataSet);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure actSaveExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure dbgOtherKeyPress(Sender: TObject; var Key: Char);
    procedure Table1LitrChange(Sender: TField);
    procedure dbceAutoNumbButtonClick(Sender: TObject);
    procedure dbceDriverButtonClick(Sender: TObject);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure dbgOtherColumns1EditButtonClick(Sender: TObject; var Handled: Boolean);
    procedure dbgOtherColumns0EditButtonClick(Sender: TObject; var Handled: Boolean);
    procedure dbgOtherColumns2EditButtonClick(Sender: TObject; var Handled: Boolean);
    procedure sbDelAutoClick(Sender: TObject);
    procedure sbDelDriverClick(Sender: TObject);
    procedure Table1BeforeDelete(DataSet: TDataSet);
    procedure Table1BeforeEdit(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure actAExecute(Sender: TObject);
    procedure actEExecute(Sender: TObject);
  private
    procedure CheckCardBlockDate(ADataSet: TDataSet);
    procedure SetAmount(); // вставка суми
  public
    F: TSRepForm;
    TTN_Id, TTN_Inst, SubPart: Integer;
    Own_Goods, NPName: string;
    OtherOut, PartBase, StartLitr, Ud_Weig: Real;
    DogEdit: Boolean;
  end;

var
  SOtherForm: TSOtherForm;

implementation

uses Main, OILSTD, OperTypeRef, ChooseOrg, AutoRef, EmpRef, DogRef, UDbFunc;

{$R *.DFM}

//==============================================================================
procedure TSOtherForm.FormShow(Sender: TObject);
begin
  Edit1.Text := FloattoStrF(StartLitr, ffFixed, 15, 3);
  Label4.Caption := NPName;

  Table1CountT.DisplayFormat := DR_FORMAT;

  Table1.Close;
  Table1.Open;
end;
//==============================================================================
procedure TSOtherForm.Table1CalcFields(DataSet: TDataSet);
begin
  // Подставляем договор
  if not (Table1Dog_id.IsNull and Table1Dog_inst.IsNull) then
  begin
    qDog.Close;
    _OpenQueryPar(qDog,
      ['dog_id',   Table1Dog_id.AsInteger,
       'dog_inst', Table1Dog_inst.AsInteger]);
    if not qDog.IsEmpty then
    begin
      Table1Dog_Name.Value := qDog.FieldByName('Dog').AsString;
      Table1Dog_Date.AsVariant := qDog.FieldByName('Dog_Date').AsDateTime;
    end;
  end;
  // Подставляем номер автомобиля
  if not (Table1Auto_id.IsNull and Table1Auto_inst.IsNull) then
  begin
    qAuto.Close;
    _OpenQueryPar(qAuto,
      ['auto_id',   Table1Auto_id.AsInteger,
       'auto_inst', Table1Auto_inst.AsInteger]);
    if not qAuto.IsEmpty then
      Table1Numb.Value := qAuto.FieldByName('Numb').AsString;
  end;
  // Подставляем водителя
  if not (Table1Employ_id.IsNull and Table1Employ_inst.IsNull) then
  begin
    qEmploy.Close;
    _OpenQueryPar(qEmploy,
      ['employ_id',   Table1Employ_id.AsInteger,
       'employ_inst', Table1Employ_inst.AsInteger]);
    if not qEmploy.IsEmpty then
      Table1FullName.Value := qEmploy.FieldByName('FULLNAME').AsString;
  end;
end;
//==============================================================================
procedure TSOtherForm.Table1BeforePost(DataSet: TDataSet);
begin
  CheckCardBlockDate(DataSet);
  if (Table1Litr.AsFloat = 0) and not (Table1Oper_ID.AsInteger = 278) then
    raise Exception.Create(TranslateText('Количество литров равно 0 !'));

  if Table1.FieldByName('Oper_Id').IsNull then
    raise Exception.Create(TranslateText('Операция не определена !'));

  if (Pos(',' + Table1.FieldByName('Oper_Id').AsString + ',', ',153,201,270,271,272,273,274,275,276,277,278,') = 0)
    and (Table1.FieldByName('Org_Id').IsNull) then
    raise Exception.Create(TranslateText('Организация не определена !'));

  if (Pos(',' + Table1.FieldByName('Oper_Id').AsString + ',', OPER_NOT_NN
    + ',14,15,16,19,24,40,42,47,55,100,101,201,102,153,270,271,272,273,274,275,276,277,278,') <= 0)
    and (Table1.FieldByName('Dog_Id').IsNull) then
  begin
    qWork.Close;
    qWork.SQL.Text := 'select Id, Inst from Oil_Dog ' +
      ' where State = ''Y'' ' +
      '   and Dog_Type = ''V'' ' +
      '   and To_ = ' + Table1.FieldByName('Org_Id').AsString +
      '   and To_Inst =' + Table1.FieldByName('Org_Inst').AsString +
      ' order by Dog_Date desc';
    qWork.Open;
    if qWork.IsEmpty then raise Exception.Create(TranslateText('Договор не определен !'))
    else
    begin
      Table1.FieldByName('Dog_Id').Value := qWork.FieldByName('Id').Value;
      Table1.FieldByName('Dog_Inst').Value := qWork.FieldByName('Inst').Value;
    end;
  end;

  if (Table1CountT.AsFloat = 0)
    or (not ((Table1Oper_ID.AsInteger in [16, 55, 102]) or (Table1Oper_ID.AsInteger = 278))) then
  begin
    if PartBase <> 0 then
      Table1CountT.AsFloat := Table1Litr.AsFloat
    else
      Table1CountT.AsFloat := MRound(Table1Litr.AsFloat * ud_weig / F.Get1000, DR_ROUND_COUNT);
  end;
  Table1Ttn_Id.AsInteger := TTN_ID;
  Table1Ttn_Inst.AsInteger := TTN_INST;
  Table1SubPart.AsInteger := SubPart;

  case Table1.FieldByName('Oper_Id').AsInteger of
    40:
      if (Table1.FieldByName('Auto_Id').IsNull) or (Table1.FieldByName('Employ_Id').IsNull) then
        raise Exception.Create(TranslateText('Для этой операции необходимо указать Авто и Водителя !'));
  end;

  SetAmount(); // вставка суми
end;
//==============================================================================
procedure TSOtherForm.SetAmount(); // вставка суми
begin
  if pos(','+ Table1Oper_ID.AsString +',', ','+ ReadOilVar('DR_OPER_AMOUNT_CORR') +',') > 0 then
  begin // якщо операція, при якій можна корегувати суму
    if (Table1Litr.AsFloat <> 0) and (Table1Price.AsFloat <> 0) then
      if Abs(Table1Amount.AsFloat - (Table1Litr.AsFloat * Table1Price.AsFloat)) > (Table1Litr.AsFloat * Table1Price.AsFloat * F.SrepKorrPercent * 0.01) then
      begin
        if Table1Amount.AsFloat <> 0 then
          ShowMessage(TranslateText('Корректировка суммы "') + FloatToStr(F.SrepKorrPercent) + TranslateText('%" превышена !'));
        Table1Amount.AsFloat := MRound(Table1Litr.AsFloat * Table1Price.AsFloat, 2);
      end
      else
        Table1Amount.AsFloat := MRound(Table1Amount.AsFloat, 2)
    else Table1Amount.Clear;
  end
  else // якщо операція, при якій НЕ можна корегувати суму
    Table1Amount.AsFloat := MRound(Table1Litr.AsFloat * Table1Price.AsFloat, 2);
end;
//==============================================================================
procedure TSOtherForm.actSaveExecute(Sender: TObject);
begin
  if not bbOk.Enabled then exit;

  if Table1.State <> dsBrowse then Table1.Post;
  query1.Close;
  query1.SQL.Text := 'select sum(Litr) as sm from oil_srotherT.db';
  query1.Open;
  OtherOut := MRound(Query1.fieldbyname('sm').AsFloat, 3);
  Modalresult := MrOk;
end;
//==============================================================================
procedure TSOtherForm.actDelExecute(Sender: TObject);
begin
  if not (Table1.IsEmpty) then Table1.Delete;
end;
//==============================================================================
procedure TSOtherForm.dbgOtherKeyPress(Sender: TObject; var Key: Char);
begin
  if PartBase <> 0 then
  begin
    if key = DecimalSeparator then key := #0;
  end
  else if key in ['.', ','] then key := DecimalSeparator;

  if (Table1Oper_ID.AsInteger <> 278) and (key = '-') then key := #0;
end;
//==============================================================================
procedure TSOtherForm.Table1LitrChange(Sender: TField);
begin
  if Table1Price.AsFloat <> F.Table2N_Price.AsFloat then
    Table1Price.AsFloat := F.Table2N_Price.AsFloat;

  if Table1Litr.AsFloat <> MRound(Table1Litr.AsFloat, 3) then
    Table1Litr.AsFloat := MRound(Table1Litr.AsFloat, 3);

  if PartBase <> 0 then
    Table1CountT.AsFloat := Table1Litr.AsFloat
  else
    Table1CountT.AsFloat := MRound(Table1Litr.AsFloat * ud_weig / F.Get1000, DR_ROUND_COUNT);

  SetAmount(); // вставка суми
end;
//==============================================================================
procedure TSOtherForm.dbceAutoNumbButtonClick(Sender: TObject);
var
  AutoRefForm: TAutoRefForm;
begin
  Application.CreateForm(TAutoRefForm, AutoRefForm);
  AutoRefForm.ShowModal;
  if AutoRefForm.ModalResult = mrOk then
  begin
    Table1.Edit;
    Table1.FieldByName('Auto_id').Value := AutoRefForm.qID.Value;
    Table1.FieldByName('Auto_inst').Value := AutoRefForm.qINST.Value;
    if not AutoRefForm.qEMPLOY_ID.IsNull then
    begin
      Table1.FieldByName('Employ_id').Value := AutoRefForm.qEMPLOY_ID.Value;
      Table1.FieldByName('Employ_inst').Value := AutoRefForm.qEMPLOY_INST.Value;
    end;
  end;
  AutoRefForm.Destroy;
end;
//==============================================================================
procedure TSOtherForm.dbceDriverButtonClick(Sender: TObject);
var
  EmpRefForm: TEmpRefForm;
begin
  Application.CreateForm(TEmpRefForm, EmpRefForm);
  EmpRefForm.ShowModal;
  if EmpRefForm.ModalResult = mrOk then
  begin
    Table1.Edit;
    Table1.FieldByName('Employ_id').Value := EmpRefForm.qID.Value;
    Table1.FieldByName('Employ_inst').Value := EmpRefForm.qINST.Value;
  end;
  EmpRefForm.Destroy;
end;
//==============================================================================
procedure TSOtherForm.Table1AfterPost(DataSet: TDataSet);
begin
  if Showing then
  begin
    Query1.Close;
    Query1.SQL.Text := 'select sum(Litr) as sm from oil_srotherT.db';
    Query1.Open;
    Edit3.Text := FloatToStrF(query1.fieldbyname('sm').AsFloat, ffFixed, 15, 3);
    Edit2.Text := FloatToStrF(StrToFloat(Edit1.Text) - query1.fieldbyname('sm').AsFloat, ffFixed, 15, 3);
    if StrToFloat(Edit2.Text) < 0 then
      Edit2.Font.Color := clRed
    else
      Edit2.Font.Color := clBlack;
    Query1.Close;
    Query1.SQL.Text := 'select sum(amount) as price from oil_srotherT.db';
    Query1.Open;
    Edit4.Text := FloatToStrF(query1.fieldbyname('price').AsFloat, ffFixed, 15, 2);
  end;
end;
//==============================================================================
procedure TSOtherForm.dsDataChange(Sender: TObject; Field: TField);
begin
  if (Showing) and (Table1.Active) then
  begin
    {gbAuto}
    Panel5.Visible := (Table1.FieldByName('Oper_Id').AsInteger = 40) or (not Table1.FieldByName('Auto_Id').IsNull);
    if Panel5.Visible then Width := 783 {Width}
    else Width := 783 - 164 {Width - Panel5.Width};

    if (Table1.FieldByName('Oper_Id').AsInteger = 40) and ((not Table1.FieldByName('Auto_Id').IsNull) or (not Table1.FieldByName('Employ_Id').IsNull)) then
      dbgOther.Columns[0].ButtonStyle := cbsNone
    else dbgOther.Columns[0].ButtonStyle := cbsEllipsis;

    if Table1.FieldByName('Oper_Id').AsInteger in [15, 16, 19, 24, 40, 42, 47, 101, 102, 153] then
      dbgOther.Columns[1].ButtonStyle := cbsNone
    else dbgOther.Columns[1].ButtonStyle := cbsEllipsis;

    if Pos(',' + Table1.FieldByName('Oper_Id').AsString + ',', OPER_NOT_NN + ',15,16,19,24,40,42,47,55,101,102,153,') > 0 then
      dbgOther.Columns[2].ButtonStyle := cbsNone
    else dbgOther.Columns[2].ButtonStyle := cbsEllipsis;
  end;
end;
//==============================================================================
procedure TSOtherForm.dbgOtherColumns0EditButtonClick(Sender: TObject; var Handled: Boolean);
var
  OTR: TOperTypeRefForm;
begin
  Application.CreateForm(TOperTypeRefForm, OTR);
  OTR.SGrpId := 8;
  OTR.ToDisable := false;
  OTR.ShowModal;
  if OTR.ModalResult = mrOk then
  begin
    if (OTR.q.fieldbyname('Id').AsInteger in [7, 10, 11, 12, 14, 44, 150])
      or (not (OTR.q.fieldbyname('Grp_Id').AsInteger in [8, 10, 16]))
      or ((Own_Goods <> 'S') and (OTR.q.fieldbyname('Id').AsInteger = 13))
      or (OTR.q.fieldbyname('Id').AsInteger >= 1000) then
      raise Exception.Create(TranslateText('Данная операция здесь недопустима!'));

    Table1.Edit;
    Table1Oper_id.Value := OTR.q.fieldbyname('Id').Value;
    Table1Oper_name.AsString := OTR.q.fieldbyname('Name').AsString;
    Table1Litr.AsFloat := Table1Litr.AsFloat;

    case Table1.FieldByName('Oper_Id').AsInteger of
      15, 16, 19, 40, 42, 47, 55, 101, 102:
        begin
          Table1.FieldByName('Org_Id').Value := MAIN_ID;
          Table1.FieldByName('Org_Inst').Value := INST;
          Table1.FieldByName('Org_Name').AsString := MainForm.qOrg.FieldbyName('Name').AsString;
          Table1.FieldByName('Dog_Id').Clear;
          Table1.FieldByName('Dog_Inst').Clear;
        end;
      153:
        begin
          Table1.FieldByName('Org_Id').Clear;
          Table1.FieldByName('Org_Inst').Clear;
          Table1.FieldByName('Org_Name').Clear;
          Table1.FieldByName('Dog_Id').Clear;
          Table1.FieldByName('Dog_Inst').Clear;
        end;
    end;

    if (Pos(',' + Table1.FieldByName('Oper_id').AsString + ',', OPER_NOT_NN) > 0)
      or (Table1.FieldByName('Org_Id').IsNull) then
    begin
      Table1.FieldByName('Dog_Id').Clear;
      Table1.FieldByName('Dog_Inst').Clear;
    end;
  end;
  OTR.Destroy;
end;
//==============================================================================
procedure TSOtherForm.dbgOtherColumns1EditButtonClick(Sender: TObject; var Handled: Boolean);
var
  vId, vInst, vStartType: Integer;
  vName, vParam: string;
begin
  if Table1Oper_id.AsInteger = 55 then
  begin
    vParam := 'nyyyynnn'; vStartType := 1;
  end
  else
  begin
    vParam := 'yyy'; vStartType := 3;
  end;

  if dbgOther.SelectedField.FieldName = 'Org_name' then
  begin
    if ChooseOrg.CaptureOrg(vStartType, MAIN_ID, INST, vParam, vId, vInst, vName) then
    begin
      Table1.Edit;
      Table1Org_id.Value := vId;
      Table1Org_inst.Value := vInst;
      Table1Org_name.Value := vName;

      if Pos(',' + Table1.FieldByName('Oper_Id').AsString + ',', OPER_NOT_NN) <= 0 then
      begin
        qWork.Close;
        qWork.SQL.Text := 'select Id, Inst from Oil_Dog ' +
          ' where State = ''Y'' ' +
          '   and Dog_Type = ''V'' ' +
          '   and To_ = ' + Table1.FieldByName('Org_Id').AsString +
          '   and To_Inst =' + Table1.FieldByName('Org_Inst').AsString +
          ' order by Dog_Date desc';
        qWork.Open;
        if qWork.IsEmpty then
        begin
          Table1.FieldByName('Dog_Id').Clear;
          Table1.FieldByName('Dog_Inst').Clear;
        end
        else
        begin
          Table1.FieldByName('Dog_Id').Value := qWork.FieldByName('Id').Value;
          Table1.FieldByName('Dog_Inst').Value := qWork.FieldByName('Inst').Value;
        end;
      end;
    end;
  end;
end;
//==============================================================================
procedure TSOtherForm.dbgOtherColumns2EditButtonClick(Sender: TObject; var Handled: Boolean);
var
  Dog: TDogRefForm;
begin
  Application.CreateForm(TDogRefForm, Dog);
  Dog.rbYes.Enabled := False;
  Dog.rbNo.Enabled := False;
  Dog.rbKart.Enabled := False;
  Dog.rbVed.Checked := True;
  Dog.rbVed.Enabled := False;
  Dog.rbService.Enabled := False;
  Dog.eFrom.Enabled := False;
  Dog.eTo.Enabled := False;

  Dog.ToCommit := False;
  if not (Table1.FieldByName('Org_Id').IsNull) then
  begin
    Dog.eTo.Tag := Table1.FieldByName('Org_Id').AsInteger;
    Dog.lTo.Tag := Table1.FieldByName('Org_Inst').AsInteger;
    Dog.eTo.Text := Table1.FieldByName('Org_Name').AsString;
  end;
  Dog.ShowModal;
  if Dog.ModalResult = mrOk then
  begin
    DogEdit := True;
    qDog.Close;
    qDog.Open;
    if Table1.State = dsBrowse then
      Table1.Edit;
    Table1.FieldByName('Dog_Id').AsInteger := dog.q.fieldbyname('Id').AsInteger;
    Table1.FieldByName('Dog_Inst').AsInteger := dog.q.fieldbyname('Inst').AsInteger;
    Table1.FieldByName('Org_Id').AsInteger := dog.q.fieldbyname('To_').AsInteger;
    Table1.FieldByName('Org_Inst').AsInteger := dog.q.fieldbyname('To_Inst').AsInteger;
    Table1.FieldByName('Org_Name').AsString := dog.q.fieldbyname('To_Name').AsString;
  end;
  Dog.Free;
end;
//==============================================================================
procedure TSOtherForm.sbDelAutoClick(Sender: TObject);
begin
  Table1.Edit;
  Table1.FieldByName('Auto_Id').Clear;
  Table1.FieldByName('Auto_Inst').Clear;
end;
//==============================================================================
procedure TSOtherForm.sbDelDriverClick(Sender: TObject);
begin
  Table1.Edit;
  Table1.FieldByName('Employ_Id').Clear;
  Table1.FieldByName('Employ_Inst').Clear;
end;
//==============================================================================
procedure TSOtherForm.Table1BeforeDelete(DataSet: TDataSet);
begin
  CheckCardBlockDate(DataSet);
end;
//==============================================================================
procedure TSOtherForm.Table1BeforeEdit(DataSet: TDataSet);
begin
  CheckCardBlockDate(DataSet);
end;
//==============================================================================
procedure TSOtherForm.CheckCardBlockDate(ADataSet: TDataSet);
begin
  {Не проводить действий с карточками если период закрыт}
  if (ADataSet.FieldByName('OPER_ID').AsInteger = 153) or
    ((ADataSet.FieldByName('OPER_ID').AsInteger = 40) and (not ADataSet.FieldByName('AUTO_ID').IsNull)) then
    if Main.ALFIL_BLOCK_DATE >= trunc(SMRep.dbdeRepDate.Value) then
    begin
      ADataSet.Cancel;
      raise Exception.Create(Main.ALFIL_BLOCK_DATE_MESSAGE);
    end;
end;
//==============================================================================
procedure TSOtherForm.FormCreate(Sender: TObject);
begin
  inherited;
  Table1.DatabaseName := DB_DIR;
  Query1.DatabaseName := DB_DIR;
end;
//==============================================================================
procedure TSOtherForm.actAExecute(Sender: TObject);
begin
  if gbAuto.Visible then
    dbceAutoNumb.SetFocus;
end;
//==============================================================================
procedure TSOtherForm.actEExecute(Sender: TObject);
var
  b: boolean;
begin
  if dbgOther.SelectedIndex = 0 then dbgOtherColumns0EditButtonClick(nil, b);
  if dbgOther.SelectedIndex = 1 then dbgOtherColumns1EditButtonClick(nil, b);
  if dbgOther.SelectedIndex = 2 then dbgOtherColumns2EditButtonClick(nil, b);
  if not (dbgOther.SelectedIndex in [0,1,2]) then
    dbgOther.SelectedField.FocusControl;

  if gbAuto.Visible then
  begin
    if dbceAutoNumb.Focused then dbceAutoNumbButtonClick(nil);
    if dbceDriver.Focused then dbceDriverButtonClick(nil);
  end;
end;
//==============================================================================

end.
