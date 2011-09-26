unit AutoCardRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGridEh, Buttons, StdCtrls,
  ExtCtrls, ToolEdit, Mask, RxLookup, ImgList, ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc,
  DBAccess, MemDS{$IFDEF VER150},Variants{$ENDIF};

type
  TAutoCardRefForm = class(TBaseForm)
    qTemp: TOilQuery;
    ActionList1: TActionList;
    acInsert: TAction;
    acEdit: TAction;
    acDelete: TAction;
    ActionsImageList: TImageList;
    qGroup: TOilQuery;
    dsGroup: TOraDataSource;
    qType: TOilQuery;
    dsType: TOraDataSource;
    u: TOraUpdateSQL;
    qGroupID: TFloatField;
    qGroupNAME: TStringField;
    qTypeID: TFloatField;
    qTypeNAME: TStringField;
    qID: TFloatField;
    qINST: TFloatField;
    qSTATE: TStringField;
    qEMPLOY_ID: TFloatField;
    qEMPLOY_INST: TFloatField;
    qEMPLOYNAME: TStringField;
    qAUTO_ID: TFloatField;
    qAUTO_INST: TFloatField;
    qINCOME_DATE: TDateTimeField;
    qDOC_NUMBER: TStringField;
    qNUMB: TStringField;
    qMODEL: TStringField;
    qAUTOGROUPNAME: TStringField;
    qAUTOTYPENAME: TStringField;
    qNP_TYPE: TFloatField;
    qNPNAME: TStringField;
    qLITRES: TFloatField;
    qDOC_KIND: TFloatField;
    qDOC_KIND_TEXT: TStringField;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    leType: TRxLookupEdit;
    leGroup: TRxLookupEdit;
    ceEmploy: TComboEdit;
    ceAuto: TComboEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    SpeedButton4: TSpeedButton;
    DateEdit2: TDateEdit;
    DateEdit1: TDateEdit;
    edDoc: TEdit;
    ceNPGroup: TComboEdit;
    GroupBox3: TGroupBox;
    cbTalon: TCheckBox;
    cbCard: TCheckBox;

    procedure ceAutoButtonClick(Sender: TObject);
    procedure ceEmployButtonClick(Sender: TObject);
    procedure ceNPGroupButtonClick(Sender: TObject);
    procedure leGroupCloseUp(Sender: TObject);

    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure bbClearClick(Sender: TObject);

    procedure bbSearchClick(Sender: TObject);

    procedure qApplyUpdates(DataSet: TDataSet);

    procedure sbEditClick(Sender: TObject); Override;
    procedure acUpdate(Sender: TObject);
    procedure acInsertExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);

  private

  public
    procedure InitRef;
  end;

var
  AutoCardRefForm: TAutoCardRefForm;

implementation

{$R *.DFM}

uses EmpRef, uXMLForm, AutoRef, ExFunc, WayBill, OilStd, Main,
  Udbplan, UDbFunc, AutoCard;

Var SearchEmpId, SearchEmpInst: integer;
    SearchAutoId, SearchAutoInst: integer;
    SearchNPGroup: integer;

procedure TAutoCardRefForm.InitRef;
begin
 qGroup.Open;
 qType.Open;

 // ������������� ������ � ������ �������� ������ �� ������� �����
 SetCurrentMonth(DateEdit1, DateEdit2);

 Self.bbSearchClick(Self);
end;

procedure TAutoCardRefForm.ceAutoButtonClick(Sender: TObject);
var
  TempForm: TAutoRefForm;
begin
  TempForm:= TAutoRefForm.Create(Application);

  try
    if TempForm.ShowModal = mrOk then
      if not(TempForm.q.eof) then
      begin
        SearchAutoId:= TempForm.qID.AsInteger;
        SearchAutoInst:= TempForm.qINST.AsInteger;
        ceAuto.Text:= TempForm.qNUMB.AsString;

        SearchEmpId:= TempForm.qEMPLOY_ID.AsInteger;
        SearchEmpInst:= TempForm.qEMPLOY_INST.AsInteger;
        ceEmploy.Text:= TempForm.qFULLNAME.AsString;
      end;

  finally
    TempForm.Free;
  end;
end;

procedure TAutoCardRefForm.ceEmployButtonClick(Sender: TObject);
var
  TempForm: TEmpRefForm;
begin
  TempForm:= TEmpRefForm.Create(Application);

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
    TempForm.free;
  end;
end;

procedure TAutoCardRefForm.ceNPGroupButtonClick(Sender: TObject);
begin
  XMLChoose('npgroupref',SearchNpGroup,ceNPGroup);
end;

procedure TAutoCardRefForm.leGroupCloseUp(Sender: TObject);
begin
 if leGroup.Text <> '' then
  begin
   with qType do
    begin
     if Active then Close;

     ParamByName('AutoGroupID').AsInteger:= qGroupID.AsInteger;

     Open;
    end;

   leType.Text:= qTypeNAME.AsString;
   leType.Enabled:= true;
   SpeedButton2.Enabled:= true;
  end
 else
  begin
   leType.Text:= '';
   leType.Enabled:= false;
   SpeedButton2.Enabled:= false;
  end;
end;

procedure TAutoCardRefForm.SpeedButton5Click(Sender: TObject);
begin
 ceAuto.Text:= '';
 SearchAutoId:= -1;
 SearchAutoInst:= -1;
end;

procedure TAutoCardRefForm.SpeedButton3Click(Sender: TObject);
begin
  ceEmploy.Text:= '';
  SearchEmpId:= -1;
  SearchEmpInst:= -1;
end;

procedure TAutoCardRefForm.SpeedButton4Click(Sender: TObject);
begin
  ceNPGroup.Text:= '';
  SearchNPGroup:= -1;
end;

procedure TAutoCardRefForm.SpeedButton1Click(Sender: TObject);
begin
  leGroup.Text:= '';
  leType.Text:= '';
  leType.Enabled:= false;
  SpeedButton2.Enabled:= false;
end;

procedure TAutoCardRefForm.SpeedButton2Click(Sender: TObject);
begin
  leType.Text:= '';
end;

procedure TAutoCardRefForm.bbClearClick(Sender: TObject);
begin
  edDoc.Text:= '';

  ceNPGroup.Text:= '';
  SearchNPGroup:= -1;

  leGroup.Text:= '';

  leType.Text:= '';
  leType.Enabled:= false;
  SpeedButton2.Enabled:= false;

  ceEmploy.Text:= '';
  SearchEmpId:= -1;
  SearchEmpInst:= -1;

  ceAuto.Text:= '';
  SearchAutoId:= -1;
  SearchAutoInst:= -1;
end;

procedure TAutoCardRefForm.bbSearchClick(Sender: TObject);
const Filter1 = 'AND card.income_date >= TO_DATE(%s, ''DD.MM.YYYY'')';
      Filter2 = 'AND card.income_date <= TO_DATE(%s, ''DD.MM.YYYY'')';
      Filter3 = 'AND card.doc_number like ''%s''';
      Filter4 = 'AND np_group.id = %d';
      Filter5 = 'AND autogroup.id = %d';
      Filter6 = 'AND autotype.id = %d';
      Filter7 = 'AND card.auto_id = %d';
      Filter8 = 'AND card.auto_inst = %d';
      Filter9 = 'AND card.employ_id = %d';
      Filter10 = 'AND card.employ_inst = %d';
      Filter11_1 = 'AND card.doc_kind in (1, 2)';
      Filter11_2 = 'AND card.doc_kind = 1';
      Filter11_3 = 'AND card.doc_kind = 2';
      Filter11_4 = 'AND card.doc_kind not in (1, 2)';
var
  curr_id, curr_inst: integer;
begin
  // �������� ������� ������
  curr_id:= qID.AsInteger;
  curr_inst:= qINST.AsInteger;

  with q do
  begin
    if Active then Close;

    // ������ �� ���� ������ �������
    if DateEdit1.Date <> 0 then
      sql.Strings[40]:= Format(Filter1, [FormatDateTime('"''"dd"."mm"."yyyy"''"', DateEdit1.Date)])
    else
      sql.Strings[40]:= '';

    // ������ �� ���� ��������� �������
    if DateEdit2.Date <> 0 then
      sql.Strings[41]:= Format(Filter2, [FormatDateTime('"''"dd"."mm"."yyyy"''"', DateEdit2.Date)])
    else
      sql.Strings[41]:= '';

    // ������ �� ����� ���������
    if edDoc.Text <> '' then
      sql.Strings[42]:= Format(Filter3, ['%' + edDoc.Text + '%'])
    else
      sql.Strings[42]:= '';

    // ������ �� ������ ��
    if ceNPGroup.Text <> '' then
      sql.Strings[43]:= Format(Filter4, [SearchNPGroup])
    else
      sql.Strings[43]:= '';

    // ������ �� ������ ����� ������������ ��������
    if leGroup.Text <> '' then
      sql.Strings[44]:= Format(Filter5, [qGroupID.AsInteger])
    else
      sql.Strings[44]:= '';

    // ������ �� ��� ������������ ��������
    if leType.Text <> '' then
      sql.Strings[45]:= Format(Filter6, [qTypeID.AsInteger])
    else
      sql.Strings[45]:= '';

    // ������ �� ����������
    if ceAuto.Text <> '' then
    begin
      sql.Strings[46]:= Format(Filter7, [SearchAutoId]);
      sql.Strings[47]:= Format(Filter8, [SearchAutoInst]);
    end
    else
    begin
      sql.Strings[46]:= '';
      sql.Strings[47]:= '';
    end;

    // ������ �� ��������
    if ceEmploy.Text <> '' then
    begin
      sql.Strings[48]:= Format(Filter9, [SearchEmpId]);
      sql.Strings[49]:= Format(Filter10, [SearchEmpInst]);
    end
    else
    begin
      sql.Strings[48]:= '';
      sql.Strings[49]:= '';
    end;

    // ������� �� ��� ���������
    if cbCard.Checked and cbTalon.Checked then
      sql.Strings[50]:= Filter11_1
    else if cbCard.Checked then
      sql.Strings[50]:= Filter11_2
    else if cbTalon.Checked then
      sql.Strings[50]:= Filter11_3
    else
      sql.Strings[50]:= Filter11_4;
    Open;   
    // ������������� ������
    Locate('id;inst', VarArrayOf([curr_id, curr_inst]), []);
  end;
end;

procedure TAutoCardRefForm.qApplyUpdates(DataSet: TDataSet);
begin
  q.ApplyUpdates;
end;

procedure TAutoCardRefForm.acUpdate(Sender: TObject);
begin
  if (((Sender as TAction).Name = 'acDelete') or
     ((Sender as TAction).Name = 'acEdit'))
  then
    (Sender as tAction).Enabled:= not (q.Eof and q.Bof);
end;

procedure TAutoCardRefForm.sbEditClick(Sender: TObject);
begin
  acEdit.Execute;
end;

procedure TAutoCardRefForm.acInsertExecute(Sender: TObject);
var
  TempForm: TAutoCardForm;
begin
  TempForm:= TAutoCardForm.Create(Self);

  // �������� ����� �������� (������ ������ ����� ��������)
  if not TempForm.getEmitentNumber then
  begin
    MessageDlg(TranslateText('  �� ���� �������� ��� ��������! ')+#10#13 +
              TranslateText('  ��������� � �������������� ��� ��������� ������, ')+#10#13 +
              TranslateText(' ����������� ��� ��������.'), mtError, [mbOK], 0);

    Exit;
  end;

  try
    try
      TempForm.AddIncome;

      if TempForm.ShowModal = mrOk then
      begin
        StartSQL;
        TempForm.Save;
        CommitSQL;
        bbSearchClick(Nil);
      end;

    finally
      TempForm.Free;
    end;
  except on E:Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOk], 0);
      RollbackSQL;
      bbSearchClick(Nil);
    end;
  end;
end;

procedure TAutoCardRefForm.acEditExecute(Sender: TObject);
const CloseAutoCardForUse = 'SELECT * ' +
                              'FROM OIL_AUTO_CARD ' +
                              'WHERE ID = %d AND ' +
                              ' INST = %d ' +
                              'FOR UPDATE NOWAIT';
var
  NotWrite: boolean;
  TempForm: TAutoCardForm;
begin
  TempForm:= TAutoCardForm.Create(Self);

  // �������� ����� �������� (������ ������ ����� ��������)
  if not TempForm.getEmitentNumber then
  begin
    MessageDlg(TranslateText('  �� ���� �������� ��� ��������! ')+#10#13 +
               TranslateText('  ��������� � �������������� ��� ��������� ������, ')+#10#13 +
               TranslateText(' ����������� ��� ��������.'), mtError, [mbOK], 0);

    Exit;
  end;

  StartSQL;

  try
    try
      // �������� �� ��������
      if INST <> qINST.AsInteger then
        // ����� ������ ������������� ����������
      begin
        TempForm.ShowOnly:= true;
        NotWrite:= true;
      end
      else
      begin
        TempForm.ShowOnly:= false;
        NotWrite:= false;
      end;

      // ������������� ����������
      with qTemp do
      begin
        Close;
        SQL.Text:= Format(CloseAutoCardForUse, [qID.AsInteger, qINST.AsInteger]);
        Open;
      end;

      TempForm.DateEdit1.Enabled := qINCOME_DATE.AsDateTime > StrToDate(CLOSE_DATE);
      TempForm.EditIncome(Self);

      if TempForm.ShowModal = mrOk then
      begin
        if not NotWrite then
          TempForm.Save;

        CommitSQL;
        bbSearchClick(Nil);
      end
      else
      begin
        RollbackSQL;
        bbSearchClick(Nil);
      end;
    finally
      TempForm.Free;
    end;
  except
    on E: Exception do
    begin
      if Pos('ORA-00054:', E.Message) <> 0 then
        MessageDlg(TranslateText('��������� ������ ������������� ������ �������������!'),
                   mtWarning, [mbOk], 0)
      else
        MessageDlg(E.Message, mtError, [mbOk], 0);

      RollbackSQL;
      bbSearchClick(Nil);
    end;
  end;
end;

procedure TAutoCardRefForm.acDeleteExecute(Sender: TObject);
const
  CloseAutoCardForUse = 'SELECT * ' +
                              'FROM OIL_AUTO_CARD ' +
                              'WHERE ID = %d AND ' +
                              ' INST = %d ' +
                              'FOR UPDATE NOWAIT';
begin
  if MessageDlg(TranslateText(' �� ������������� ������ ������� ��� ������?'),
                 mtWarning, [mbYes, mbNo], 0) = mrNo then Exit;
  StartSQL;

  try
    // �������� �� ��������
    if INST <> qINST.AsInteger then
      raise Exception.Create(TranslateText('������ ������� ������, ��������� ������ ������������!'));

    if StrToDate(Close_Date) >= qINCOME_DATE.AsDateTime then
      raise Exception.Create(TranslateText('������ ������ ������!'));

    // ������������� ����������
    with qTemp do
    begin
      Close;
      SQL.Text:= Format(CloseAutoCardForUse, [qID.AsInteger, qINST.AsInteger]);
      Open;
    end;

    // ���������� ����
    q.Delete;
    CommitSQL;
    bbSearchClick(Nil);

  except
    on E: Exception do
    begin
      if Pos('ORA-00054:', E.Message) <> 0 then
        MessageDlg(TranslateText('��������� ������ ������������� ������ �������������!'),
                   mtWarning, [mbOk], 0)
      else
        MessageDlg(E.Message, mtError, [mbOk], 0);

      RollbackSQL;
      bbSearchClick(Nil);
    end;
  end;
end;

end.
