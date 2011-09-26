unit AutoIncomeRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGridEh, Buttons, StdCtrls,
  ExtCtrls, ToolEdit, Mask, RxLookup, ImgList, ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc,
  DBAccess, MemDS{$IFDEF VER150},Variants{$ENDIF};

type
  TAutoIncomeRefForm = class(TBaseForm)
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
    qID: TFloatField;
    qINST: TFloatField;
    qSTATE: TStringField;
    qEMPLOY_ID: TFloatField;
    qEMPLOY_INST: TFloatField;
    qEMPLOYNAME: TStringField;
    qAUTO_ID: TFloatField;
    qAUTO_INST: TFloatField;
    qINCOME_DATE: TDateTimeField;
    qBILL_NUMBER: TStringField;
    qNUMB: TStringField;
    qMODEL: TStringField;
    qAUTOGROUPNAME: TStringField;
    qAUTOTYPENAME: TStringField;
    qNP_TYPE: TFloatField;
    qNPNAME: TStringField;
    qPRICE: TFloatField;
    qLITRES: TFloatField;
    qTONNS: TFloatField;
    qSUMCOST: TFloatField;
    qGroupID: TFloatField;
    qGroupNAME: TStringField;
    qTypeID: TFloatField;
    qTypeNAME: TStringField;
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
  AutoIncomeRefForm: TAutoIncomeRefForm;

implementation

{$R *.DFM}

uses EmpRef, uXMLForm, AutoRef, ExFunc, WayBill, OilStd, Main,
  Udbplan, UDbFunc, AutoIncome;

Var SearchEmpId, SearchEmpInst: integer;
    SearchAutoId, SearchAutoInst: integer;
    SearchNPGroup: integer;

procedure TAutoIncomeRefForm.InitRef;
begin
 qGroup.Open;
 qType.Open;

 // Устанавливает период с начала текущего месяца по текущее число
 SetCurrentMonth(DateEdit1, DateEdit2);

 Self.bbSearchClick(Self);
end;

procedure TAutoIncomeRefForm.ceAutoButtonClick(Sender: TObject);
var TempForm: TAutoRefForm;
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
  TempForm.free;
 end;
end;

procedure TAutoIncomeRefForm.ceEmployButtonClick(Sender: TObject);
var TempForm: TEmpRefForm;
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

procedure TAutoIncomeRefForm.ceNPGroupButtonClick(Sender: TObject);
begin
  XMLChoose('npgroupref',SearchNpGroup,ceNPGroup);
end;

procedure TAutoIncomeRefForm.leGroupCloseUp(Sender: TObject);
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

procedure TAutoIncomeRefForm.SpeedButton5Click(Sender: TObject);
begin
 ceAuto.Text:= '';
 SearchAutoId:= -1;
 SearchAutoInst:= -1;
end;

procedure TAutoIncomeRefForm.SpeedButton3Click(Sender: TObject);
begin
 ceEmploy.Text:= '';
 SearchEmpId:= -1;
 SearchEmpInst:= -1;
end;

procedure TAutoIncomeRefForm.SpeedButton4Click(Sender: TObject);
begin
 ceNPGroup.Text:= '';
 SearchNPGroup:= -1;
end;

procedure TAutoIncomeRefForm.SpeedButton1Click(Sender: TObject);
begin
 leGroup.Text:= '';
 leType.Text:= '';
 leType.Enabled:= false;
 SpeedButton2.Enabled:= false;
end;

procedure TAutoIncomeRefForm.SpeedButton2Click(Sender: TObject);
begin
 leType.Text:= '';
end;

procedure TAutoIncomeRefForm.bbClearClick(Sender: TObject);
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

procedure TAutoIncomeRefForm.bbSearchClick(Sender: TObject);
const Filter1 = 'AND income.income_date >= TO_DATE(%s, ''DD.MM.YYYY'')';
      Filter2 = 'AND income.income_date <= TO_DATE(%s, ''DD.MM.YYYY'')';
      Filter3 = 'AND income.bill_number like ''%s''';
      Filter4 = 'AND np_group.id = %d';
      Filter5 = 'AND autogroup.id = %d';
      Filter6 = 'AND autotype.id = %d';
      Filter7 = 'AND income.auto_id = %d';
      Filter8 = 'AND income.auto_inst = %d';
      Filter9 = 'AND income.employ_id = %d';
      Filter10 = 'AND income.employ_inst = %d';
var curr_id, curr_inst: integer;
begin
 // Получаем текущую строку
 curr_id:= qID.AsInteger;
 curr_inst:= qINST.AsInteger;

 with q do
  begin
   if Active then Close;

   // Фильтр на дату начала периода
   if DateEdit1.Date <> 0 then
    sql.Strings[38]:= Format(Filter1, [FormatDateTime('"''"dd"."mm"."yyyy"''"', DateEdit1.Date)])
   else
    sql.Strings[38]:= '';

   // Фильтр на дату окончания периода
   if DateEdit2.Date <> 0 then
    sql.Strings[39]:= Format(Filter2, [FormatDateTime('"''"dd"."mm"."yyyy"''"', DateEdit2.Date)])
   else
    sql.Strings[39]:= '';

   // Фильтр на номер документа
   if edDoc.Text <> '' then
    sql.Strings[40]:= Format(Filter3, ['%' + edDoc.Text + '%'])
   else
    sql.Strings[40]:= '';

   // Фильтр на группу НП
   if ceNPGroup.Text <> '' then
    sql.Strings[41]:= Format(Filter4, [SearchNPGroup])
   else
    sql.Strings[41]:= '';

   // Фильтр на группу типов технического средства
   if leGroup.Text <> '' then
    sql.Strings[42]:= Format(Filter5, [qGroupID.AsInteger])
   else
    sql.Strings[42]:= '';

   // Фильтр на тип технического средства
   if leType.Text <> '' then
    sql.Strings[43]:= Format(Filter6, [qTypeID.AsInteger])
   else
    sql.Strings[43]:= '';

   // Фильтр на автомобиль
   if ceAuto.Text <> '' then
    begin
     sql.Strings[44]:= Format(Filter7, [SearchAutoId]);
     sql.Strings[45]:= Format(Filter8, [SearchAutoInst]);
    end
   else
    begin
     sql.Strings[44]:= '';
     sql.Strings[45]:= '';
    end;

   // Фильтр на водителя
   if ceEmploy.Text <> '' then
    begin
     sql.Strings[46]:= Format(Filter9, [SearchEmpId]);
     sql.Strings[47]:= Format(Filter10, [SearchEmpInst]);
    end
   else
    begin
     sql.Strings[46]:= '';
     sql.Strings[47]:= '';
    end;
   Open;    
   // Позиционируем курсор
   Locate('id;inst', VarArrayOf([curr_id, curr_inst]), []);
  end;
end;

procedure TAutoIncomeRefForm.qApplyUpdates(DataSet: TDataSet);
begin
 q.ApplyUpdates;
end;

procedure TAutoIncomeRefForm.acUpdate(Sender: TObject);
begin
 if (((Sender as TAction).Name = 'acDelete') or
     ((Sender as TAction).Name = 'acEdit')) then
  if (q.Eof and q.Bof) then
   (Sender as tAction).Enabled:= false
  else
  (Sender as tAction).Enabled:= true;
end;

procedure TAutoIncomeRefForm.sbEditClick(Sender: TObject);
begin
 acEdit.Execute;
end;

procedure TAutoIncomeRefForm.acInsertExecute(Sender: TObject);
const constGetIncomeID =  'SELECT s_oil_auto_income.nextVal FROM sys.dual';
var TempForm: TAutoIncomeForm;
begin
 TempForm:= TAutoIncomeForm.Create(Self);

 try
  try
   TempForm.AddIncome;

   if TempForm.ShowModal = mrOk then
    begin
     StartSQL;

     q.Insert;

     with qTemp do
      begin
       Close;
       SQL.Text:= constGetIncomeID;
       Open;

       qID.AsInteger:= Fields[0].AsInteger;
       Close;
      end;

     qINST.AsInteger:= INST;
     qINCOME_DATE.AsDateTime:= TempForm.deDate.Date;
     qBILL_NUMBER.AsString:= TempForm.Edit1.Text;
     qEMPLOY_ID.AsInteger:= TempForm.SearchEmpId;
     qEMPLOY_INST.AsInteger:= TempForm.SearchEmpInst;
     qAUTO_ID.AsInteger:= TempForm.SearchAutoId;
     qAUTO_INST.AsInteger:= TempForm.SearchAutoInst;
     qNP_TYPE.AsInteger:= TempForm.SearchNPType;
     qPRICE.AsFloat:= StrToFloat(TempForm.CurrencyEdit3.Text);
     qLITRES.AsFloat:= StrToFloat(TempForm.CurrencyEdit1.Text);
     qTONNS.AsFloat:= StrToFloat(TempForm.CurrencyEdit2.Text);

     q.Post;
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

procedure TAutoIncomeRefForm.acEditExecute(Sender: TObject);
const CloseAutoIncomeForUse = 'SELECT * ' +
                              'FROM OIL_AUTO_INCOME ' +
                              'WHERE ID = %d AND ' +
                              ' INST = %d ' +
                              'FOR UPDATE NOWAIT';
var NotWrite: boolean;
    TempForm: TAutoIncomeForm;
begin
 StartSQL;

 TempForm:= TAutoIncomeForm.Create(Self);

 try
  try
   // Проверки на вшивость
   if INST <> qINST.AsInteger then
     // Можно только просматривать информацию
    begin
     TempForm.ShowOnly:= true;
     NotWrite:= true;
    end
   else
    begin
     TempForm.ShowOnly:= false;
     NotWrite:= false;
    end;

   // Устанавливаем блокировки
   with qTemp do
    begin
     Close;
     SQL.Text:= Format(CloseAutoIncomeForUse, [qID.AsInteger, qINST.AsInteger]);
     Open;
    end;

   TempForm.EditIncome(Self);

   if TempForm.ShowModal = mrOk then
    begin
     if not NotWrite then
      begin
       q.Edit;

       qINCOME_DATE.AsDateTime:= TempForm.deDate.Date;
       qBILL_NUMBER.AsString:= TempForm.Edit1.Text;
       qEMPLOY_ID.AsInteger:= TempForm.SearchEmpId;
       qEMPLOY_INST.AsInteger:= TempForm.SearchEmpInst;
       qAUTO_ID.AsInteger:= TempForm.SearchAutoId;
       qAUTO_INST.AsInteger:= TempForm.SearchAutoInst;
       qNP_TYPE.AsInteger:= TempForm.SearchNPType;
       qPRICE.AsFloat:= StrToFloat(TempForm.CurrencyEdit3.Text);
       qLITRES.AsFloat:= StrToFloat(TempForm.CurrencyEdit1.Text);
       qTONNS.AsFloat:= StrToFloat(TempForm.CurrencyEdit2.Text);

       q.Post;
      end;

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
     MessageDlg(TranslateText('Выбранная запись редактируется другим пользователем!'),
                 mtWarning, [mbOk], 0)
    else
     MessageDlg(E.Message, mtError, [mbOk], 0);

    RollbackSQL;
    bbSearchClick(Nil);
   end;
 end;
end;

procedure TAutoIncomeRefForm.acDeleteExecute(Sender: TObject);
const CloseAutoIncomeForUse = 'SELECT * ' +
                              'FROM OIL_AUTO_INCOME ' +
                              'WHERE ID = %d AND ' +
                              ' INST = %d ' +
                              'FOR UPDATE NOWAIT';
begin
 if MessageDlg(TranslateText(' Вы действительно хотите удалить эту запись?'),
                mtWarning, [mbYes, mbNo], 0) = mrNo then Exit;
 StartSQL;

 try
  // Проверки на вшивость
  if INST <> qINST.AsInteger
   then raise Exception.Create(TranslateText('Нельзя удалить запись, созданную другой организацией!'));

  if StrToDate(Close_Date) >= qINCOME_DATE.AsDateTime
   then raise Exception.Create(TranslateText('Данный период закрыт!'));

  // Устанавливаем блокировки
  with qTemp do
   begin
    Close;
    SQL.Text:= Format(CloseAutoIncomeForUse, [qID.AsInteger, qINST.AsInteger]);
    Open;
   end;

  // Собственно патч
  q.Delete;
  CommitSQL;
  bbSearchClick(Nil);

 except
  on E: Exception do
   begin
    if Pos('ORA-00054:', E.Message) <> 0 then
     MessageDlg(TranslateText('Выбранная запись редактируется другим пользователем!'),
                 mtWarning, [mbOk], 0)
    else
     MessageDlg(E.Message, mtError, [mbOk], 0);

    RollbackSQL;
    bbSearchClick(Nil);
   end;
 end;
end;

end.
