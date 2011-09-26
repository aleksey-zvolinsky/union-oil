unit RashPP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Placemnt, Db, DBTables, StdCtrls, ToolEdit, Mask, CurrEdit, Buttons,
  ExtCtrls,Ora, uCommonForm,uOilQuery,uOilStoredProc, MemDS, DBAccess, StrUtils,
  Variants;

type
  TRashPPForm = class(TCommonForm)
    Bevel1: TBevel;
    Bevel4: TBevel;
    Label26: TLabel;
    Label18: TLabel;
    lPart1: TLabel;
    Label8: TLabel;
    Label23: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label9: TLabel;
    lRez: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label20: TLabel;
    Label19: TLabel;
    Bevel2: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    lPart2: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Panel2: TPanel;
    chSborNDS: TCheckBox;
    chSborNac: TCheckBox;
    chSborPost: TCheckBox;
    chUchPrice: TCheckBox;
    chDebet: TCheckBox;
    edComm: TEdit;
    edPart1: TComboEdit;
    edDog: TEdit;
    edNP_Type: TEdit;
    edCount_: TRxCalcEdit;
    edPrice: TRxCalcEdit;
    edDogDate: TDateEdit;
    edActDate: TDateEdit;
    edID: TEdit;
    edOper: TComboEdit;
    edTotal: TRxCalcEdit;
    edPrice2: TRxCalcEdit;
    edSum: TRxCalcEdit;
    chOwn: TCheckBox;
    edPart2: TComboEdit;
    edDog2: TEdit;
    edNp_Type2: TEdit;
    edDogDate2: TDateEdit;
    chOwn2: TCheckBox;
    SP: TOilStoredProc;
    qFrom: TOilQuery;
    qFromNAME: TStringField;
    qRez: TOilQuery;
    qRezID: TFloatField;
    qRezNAME: TStringField;
    qRezID_ORG: TFloatField;
    qRezCAPACITY: TStringField;
    qRezDEAD: TFloatField;
    qRezNUM: TStringField;
    qRezINST: TFloatField;
    qLeft: TOilQuery;
    qLeftS: TFloatField;
    Panel3: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Bevel3: TBevel;
    edTo2: TEdit;
    edFrom1: TEdit;
    lFrom1: TLabel;
    lTo2: TLabel;
    lPart11: TLabel;
    lPart22: TLabel;
    Panel1: TPanel;
    lPartLeft: TLabel;
    Label27: TLabel;
    Panel4: TPanel;
    Label31: TLabel;
    lRezLeft: TLabel;
    Panel5: TPanel;
    Label6: TLabel;
    lPartRezLeft: TLabel;
    edFrom2: TEdit;
    lFrom2: TLabel;
    lTo1: TLabel;
    edTo1: TEdit;
    lFrom: TLabel;
    edFrom: TComboEdit;
    qRezLeft: TOilQuery;
    qRezLeftS: TFloatField;
    qRezLeftREZ_ID: TFloatField;
    qRezLeftREZ_INST: TFloatField;
    edRez: TComboBox;
    qPart: TOilQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edOperButtonClick(Sender: TObject);
    procedure edPart1ButtonClick(Sender: TObject);
    procedure edPart2ButtonClick(Sender: TObject);
    procedure edRezChange(Sender: TObject);
    procedure edPriceChange(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure qRezFilterRecord(DataSet: TDataSet; var Accept: Boolean);

    procedure edFromButtonClick(Sender: TObject);
    procedure edActDateChange(Sender: TObject);
  private
    procedure Init;
    procedure GetLeft;
    function TestNPGroup(NPTypeS, NPTypeV, OperID: integer): boolean;
    // property
    function GetFromPartId: integer;
    procedure SetFromPartId(AValue: integer);
    function GetFromPartInst: integer;
    procedure SetFromPartInst(AValue: integer);
    function GetToPartId: integer;
    procedure SetToPartId(AValue: integer);
    function GetToPartInst: integer;
    procedure SetToPartInst(AValue: integer);
    function GetOperId: integer;
    procedure SetOperId(AValue: integer);
  public
    Rez_Id, Rez_Inst, Part_Id, Part_Inst : Integer;
    PrevCount: Extended;
    Oper_id, Oper_id2: string;
    property OperId: integer read GetOperId write SetOperId;
    property FromPartId: integer read GetFromPartId write SetFromPartId;
    property FromPartInst: integer read GetFromPartInst write SetFromPartInst;
    property ToPartId: integer read GetToPartId write SetToPartId;
    property ToPartInst: integer read GetToPartInst write SetToPartInst;
  end;

var
  RashPPForm: TRashPPForm;

procedure DelRashPrih(p_Id,p_Inst: integer; p_State: string);
Function GetNull(s:integer):string;

implementation

Uses OperTypeRef, AutoRef, PartRef, Main, OilStd, ChooseOrg, UDbFunc, uStart,
  Rash, Prih, ExFunc;

{$R *.DFM}

//==============================================================================
// удаляет приходы и налоговые, на которые смотрит данный отпуск
//------------------------------------------------------------------------------
procedure DelRashPrih(p_Id,p_Inst: integer; p_State: string);
var q: TOilQuery;
begin
  q:=TOilQuery.Create(nil);
  q.Session:=frmStart.OraSession1;
  q.Sql.Text:=
    ' select prih,prih_inst,nn_id,nn_inst from oil_rashod'+
    ' where id='+IntToStr(p_Id)+' and inst='+IntToStr(p_Inst);
  _OpenQueryOra(q);
  if q.RecordCount>0 then begin
    if not q.FieldByName('prih').IsNull then
      _ExecSql(
        ' update oil_prihod set state='''+p_State+''''+
        ' where id='+q.FieldByName('prih').AsString+
        '   and inst='+q.FieldByName('prih_inst').AsString);
    if not q.FieldByName('nn_id').IsNull then
      _ExecSql(
        ' update oil_sale_book set state='''+p_State+''''+
        ' where id='+q.FieldByName('nn_id').AsString+
        '   and inst='+q.FieldByName('nn_inst').AsString);
  end;
  q.Free;
end;
//==============================================================================
Function GetNull(s:integer):string;
Var Out,ss:string;
    i:integer;
Begin
  Out := IntTostr(S);
  Ss := out;
  For I := 1 To 8-Length(out) Do ss:='0'+ss;
  GetNull := Ss;
End;


{ TRashPPForm }

//==============================================================================
procedure TRashPPForm.Init;
begin
  lPartLeft.Caption := '';
  lRezLeft.Caption := '';
  If SP.Tag = 0 Then SP.Tag := INST;

  // Добавление
  If edID.Text = '' Then 
  Begin
    Try
      qFrom.Close;
      qFrom.ParamByName('a').AsInteger := SP.Tag;
      qFrom.Open;
      If qFrom.RecordCount = 0 Then
        Raise Exception.Create(TranslateText('Нет такой организации!'));
      edFrom.Text := qFromName.AsString;
      edFrom.Tag  := SP.Tag;
      lFrom.Tag   := SP.Tag;
    Except On E:Exception Do
      Begin
        MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
        Close;
        Exit;
      End;
    End;
    edActDate.Date := Date;
    chOwn.Checked := False;
    edOper.Clear;
    edPart1.Clear;
    edPart2.Tag := 0;
    edDog.Clear;
    edDogDate.Clear;
    edNP_Type.Clear;
    edPrice.Clear;
    edSum.Clear;
    edPrice2.Clear;
    edTotal.Clear;
    chSborPost.Checked := False;
    chSborNac.Checked  := False;
    chUchPrice.Checked := True;
    chSborNDS.Checked  := False;
    chDebet.Checked    := False;
    edCount_.Clear;
    edComm.Clear;
    edPart2.Clear;
    edPart2.Tag := 0;
    edDog2.Clear;
    edNP_Type2.Clear;
    edDogDate2.Clear;
    chOwn2.Checked := False;
    edFrom1.Clear;
    edTo1.Clear;
    edFrom2.Clear;
    edTo2.Clear;
  End
  Else
  begin
    if OperId = 18 then
    begin
      // Обновляем параметры из партий
      if qPart.Active then qPart.Close;
      _OpenQueryPar(qPart,
        ['AId',   FromPartId,
         'AInst', FromPartInst]);
      if not qPart.IsEmpty then
      begin
        edFrom1.Tag := qPart.FieldByName('to_').AsInteger;
        lFrom1.Tag := qPart.FieldByName('to_inst').AsInteger;
        edTo1.Tag := qPart.FieldByName('from_').AsInteger;
        lTo1.Tag := qPart.FieldByName('from_inst').AsInteger;
      end;

      if qPart.Active then qPart.Close;
      _OpenQueryPar(qPart,
        ['AId',   ToPartId,
         'AInst', ToPartInst]);
      if not qPart.IsEmpty then
      begin
        edFrom2.Tag := qPart.FieldByName('from_').AsInteger;
        lFrom2.Tag := qPart.FieldByName('from_inst').AsInteger;
        edTo2.Tag := qPart.FieldByName('to_').AsInteger;
        lTo2.Tag := qPart.FieldByName('to_inst').AsInteger;
      end;
    end;
  end;
  DefineRashRez(edRez,qRez,edFrom.Tag,edPart1.Tag,lPart1.Tag);
  GetLeft;
end;
//==============================================================================
procedure TRashPPForm.GetLeft;
//Var  R : Extended;
Begin
  // Подсчет трех остатков
  lPartLeft.Caption    := '';
  lRezLeft.Caption     := '';
  lPartRezLeft.Caption := '';
  With qLeft Do
  Begin
    If (edRez.Text <> '')And(edPart1.Text <> '') Then
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT SUM(S) S  FROM V_OIL_LEFT WHERE');
      SQL.Add('REZ_ID ='+qRezID.AsString+'AND REZ_INST  = ' + qRezINST.AsString);
      SQL.Add('AND PART_ID='+IntToStr(edPart1.Tag)+' AND PART_INST='+IntToStr(lPart1.Tag));
      Open;
      lPartRezLeft.Caption := FloatToStr(Round(qLeftS.AsFloat*1000000)/1000000);
    End;

    If edPart1.Text <> '' Then
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT SUM(S) S FROM V_OIL_LEFT ');
      SQL.Add(' Where PART_ID = ' + IntToStr(edPart1.Tag) + ' AND PART_INST  = ' + IntToStr(lPart1.Tag));
      Open;
      lPartLeft.Caption := FloatToStr(Round(qLeftS.AsFloat*1000000)/1000000);
    End;

    If edRez.Text <> '' Then
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT SUM(S) S FROM V_OIL_LEFT ');
      SQL.Add('  Where REZ_ID = ' + qRezID.AsString + ' AND REZ_INST  = ' + qRezINST.AsString);
      Open;
      lRezLeft.Caption := FloatToStr(Round(qLeftS.AsFloat*1000000)/1000000);
    End;
  End;
End;

//==============================================================================
function TRashPPForm.TestNPGroup(NPTypeS, NPTypeV, OperID: integer): boolean;
var
  np_grp_s, np_grp_v: variant;
begin
  result := false;
  if OperID <> 250 then exit;
  np_grp_s := GetSQLValue('select grp_id from oil_np_type where id = '+ IntToStr(NPTypeS));
  np_grp_v := GetSQLValue('select grp_id from oil_np_type where id = '+ IntToStr(NPTypeV));
  if (np_grp_s = 76) and (np_grp_v = 7) then result := true;
end;

function TRashPPForm.GetFromPartId: integer;
begin
  Result := edPart1.Tag;
end;
procedure TRashPPForm.SetFromPartId(AValue: integer);
begin
  edPart1.Tag := AValue;
end;

function TRashPPForm.GetFromPartInst: integer;
begin
  Result := lPart1.Tag;
end;
procedure TRashPPForm.SetFromPartInst(AValue: integer);
begin
  lPart1.Tag := AValue;
end;

function TRashPPForm.GetToPartId: integer;
begin
  Result := edPart2.Tag;
end;
procedure TRashPPForm.SetToPartId(AValue: integer);
begin
  edPart2.Tag := AValue;
end;

function TRashPPForm.GetToPartInst: integer;
begin
  Result := lPart2.Tag;
end;
procedure TRashPPForm.SetToPartInst(AValue: integer);
begin
  lPart2.Tag := AValue;
end;

function TRashPPForm.GetOperId: integer;
begin
  Result := edOper.Tag;
end;
procedure TRashPPForm.SetOperId(AValue: integer);
begin
  edOper.Tag := AValue;
end;


//==============================================================================
procedure TRashPPForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qLeft.Close;
  qRez.Close;
  qFrom.Close;
  Action := caFree;
end;
//==============================================================================
procedure TRashPPForm.FormShow(Sender: TObject);
begin
  Init;
end;
//==============================================================================
procedure TRashPPForm.edOperButtonClick(Sender: TObject);
Var
  OperTypeRefForm : TOperTypeRefForm;
begin
  Application.CreateForm(TOperTypeRefForm, OperTypeRefForm);
  try
    OperTypeRefForm.SGrpId := OPG_MOVE;
    OperTypeRefForm.bbClear.Enabled:=false;
    OperTypeRefForm.ShowModal;
    // 'Комиссия'    - Part.Tag = 1;
    // 'Собственный' - Part.Tag = 2;
    // 'Хранение'    - Part.Tag = 3;
    If OperTypeRefForm.ModalResult = mrOk Then
    Begin
      case OperTypeRefForm.qId.AsInteger of
          3:if (edPart1.Tag<>0) and (lPart11.Tag<>3) or
               (edPart2.Tag<>0) and (lPart22.Tag<>1)
            then Begin
                 OperTypeRefForm.Free;
                 ShowMessage(TranslateText('Операция "Отпуск с хранения на комиссию" для выбранных партий недопустима !'));
                 Exit;
            End;
        171:if (edPart1.Tag<>0) and (lPart11.Tag<>1) or
               (edPart2.Tag<>0) and (lPart22.Tag<>3)
            then Begin
                 OperTypeRefForm.Free;
                 ShowMessage(TranslateText('Операция "Возврат по доп. соглашению" для выбранных партий недопустима !'));
                 Exit;
            End;
         45:if (edPart2.Tag<>0) and (lPart22.Tag<>2)
            then
            Begin
                 OperTypeRefForm.Free;
                 ShowMessage(TranslateText('Операция "Переброска на собств. нужды" для выбранных партий недопустима !'));
                 Exit;
            End;
         18:if (edPart1.Tag<>0) and (edPart2.Tag<>0) and
               ((lPart11.Tag=1) and (lPart22.Tag=3) or (lPart11.Tag=3) and (lPart22.Tag=1))
            then
            Begin
                 OperTypeRefForm.Free;
                 ShowMessage(TranslateText('Операция "Переброска (с карточки на карточку)" для выбранных партий недопустима !'));
                 Exit;
            End;
      End;
      edOper.Text := OperTypeRefForm.qName.AsString;
      OperId := OperTypeRefForm.qId.AsInteger;
    End;
  finally
    OperTypeRefForm.Free;
  end;
end;
//==============================================================================
procedure TRashPPForm.edPart1ButtonClick(Sender: TObject);
Var
  PartRefForm: TPartRefForm;
begin
  Application.CreateForm(TPartRefForm, PartRefForm);
  if OperId in [3,171] then
     with PartRefForm do Begin
        chOwn.Tag := 1;
        chOwn.Checked := True;
        bbClear.Enabled := False;
        case OperId of
          3: rbStore.Checked := True;
        171: rbKom.Checked := True;
        End;
        chOwn.Enabled := False;
        rbOwn.Enabled := False;
        rbStore.Enabled := False;
        rbKom.Enabled := False;
     End;
  PartRefForm.ShowModal;
  If PartRefForm.ModalResult = mrOk Then
  Begin
    if (OperId=18) and (edPart2.Tag<>0) then
       Begin
         if (lPart22.Tag=1) and (PartRefForm.qOWN_GOODS.AsString='S')
         then Begin
            PartRefForm.Free;
            ShowMessage(TranslateText('Выбран недопустимый тип партии при данной операции !')+#13#10+
            TranslateText('Для переброски с хранения на комиссию воспользуйтесь ')+
            TranslateText('операцией "Отпуск с хранения на комиссию".'));
            Exit;
         End;
         if (lPart22.Tag=3) and (PartRefForm.qOWN_GOODS.AsString='K')
         then Begin
            PartRefForm.Free;
            ShowMessage(TranslateText('Выбран недопустимый тип партии при данной операции !')+#13#10+
            TranslateText('Для переброски с комиссии на хранение воспользуйтесь ')+
            TranslateText('операцией "Возврат по доп. соглашению".'));
            Exit;
         End;
       End;
    edPart1.Text   := PartRefForm.qId.AsString;
    edPart1.Tag    := PartRefForm.qId.AsInteger;
    lPart1.Tag     := PartRefForm.qInst.AsInteger;
    edDog.Text     := PartRefForm.qDog.AsString;
    edDogDate.Date := PartRefForm.qDog_Date.AsDateTime;
    edNP_Type.Text := PartRefForm.qNP_Type_Name.AsString;
    edNP_Type.Tag  := PartRefForm.qNP_Type.AsInteger;
    chOwn.Checked  := PartRefForm.qOwn_Goods.AsString = 'O';
    edTo1.Text     := PartRefForm.qFrom_Name.AsString;
    edTo1.Tag      := PartRefForm.qFrom_.AsInteger;
    lTo1.Tag       := PartRefForm.qFrom_Inst.AsInteger;
    edFrom1.Text   := PartRefForm.qTo_Name.AsString;
    edFrom1.Tag    := PartRefForm.qTo_.AsInteger;
    lFrom1.Tag     := PartRefForm.qTo_Inst.AsInteger;
    if PartRefForm.qOWN_GOODS.AsString='K' then lPart11.Tag:=1;
    if PartRefForm.qOWN_GOODS.AsString='O' then lPart11.Tag:=2;
    if PartRefForm.qOWN_GOODS.AsString='S' then lPart11.Tag:=3;

    Oper_Id2       := PartRefForm.qOwn_Goods.asString;

    If Round(PartRefForm.qBase_.AsFloat*1000)/1000 = 0
      Then edCount_.DecimalPlaces := 6
      Else edCount_.DecimalPlaces := 0;
    edPrice.Value     := PartRefForm.qSS.AsFloat;

    PartRefForm.Free;
    If edPart1.Text <> '' Then
      DefineRashRez(edRez,qRez,edFrom.Tag,edPart1.Tag,lPart1.Tag);
    GetLeft;
  End else
    PartRefForm.Free;
end;
//==============================================================================
procedure TRashPPForm.edPart2ButtonClick(Sender: TObject);
Var
  PartRefForm : TPartRefForm;
begin
  Application.CreateForm(TPartRefForm, PartRefForm);
  if OperId in [3,45,171] then
     with PartRefForm do Begin
        chOwn.Tag := 1;
        chOwn.Checked := True;
        bbClear.Enabled := False;
        case OperId of
          3: rbKom.Checked := True;
         45: rbOwn.Checked := True;
        171: rbStore.Checked := True;
        End;
        chOwn.Enabled := False;
        rbOwn.Enabled := False;
        rbStore.Enabled := False;
        rbKom.Enabled := False;
     End;
  PartRefForm.ShowModal;
  If PartRefForm.ModalResult = mrOk Then
  Begin
    if (OperId=18) and (edPart1.Tag<>0) then
       Begin
         if (lPart11.Tag=1) and (PartRefForm.qOWN_GOODS.AsString='S')
         then Begin
            PartRefForm.Free;
            ShowMessage(TranslateText('Выбран недопустимый тип партии при данной операции !')+#13#10+
            TranslateText('Для переброски с комиссии на хранение воспользуйтесь ')+
            TranslateText('операцией "Возврат по доп. соглашению".'));
            Exit;
         End;
         if (lPart11.Tag=3) and (PartRefForm.qOWN_GOODS.AsString='K')
         then Begin
            PartRefForm.Free;
            ShowMessage(TranslateText('Выбран недопустимый тип партии при данной операции !')+#13#10+
            TranslateText('Для переброски с хранения на комиссию воспользуйтесь ')+
            TranslateText('операцией "Отпуск с хранения на комиссию".'));
            Exit;
         End;
       End;
    edPart2.Text    := PartRefForm.qId.AsString;
    edPart2.Tag     := PartRefForm.qId.AsInteger;
    lPart2.Tag      := PartRefForm.qInst.AsInteger;
    edDog2.Text     := PartRefForm.qDog.AsString;
    edDogDate2.Date := PartRefForm.qDog_Date.AsDateTime;
    edNP_Type2.Text := PartRefForm.qNP_Type_Name.AsString;
    edNP_Type2.Tag  := PartRefForm.qNP_Type.AsInteger;
    chOwn2.Checked  := PartRefForm.qOwn_Goods.AsString = 'O';
    {edTo.Text       := PartRefForm.qFrom_Name.AsString;
    edTo.Tag        := PartRefForm.qFrom_.AsInteger;
    lTo.Tag         := PartRefForm.qFrom_Inst.AsInteger;}
    edFrom2.Text    := PartRefForm.qFrom_Name.AsString;
    edFrom2.Tag     := PartRefForm.qFrom_.AsInteger;
    lFrom2.Tag      := PartRefForm.qFrom_Inst.AsInteger;
    edTo2.Text      := PartRefForm.qTo_Name.AsString;
    edTo2.Tag       := PartRefForm.qTo_.AsInteger;
    lTo2.Tag        := PartRefForm.qTo_Inst.AsInteger;
    Oper_Id         := PartRefForm.qOwn_Goods.asString;
    if PartRefForm.qOWN_GOODS.AsString='K' then lPart22.Tag:=1;
    if PartRefForm.qOWN_GOODS.AsString='O' then lPart22.Tag:=2;
    if PartRefForm.qOWN_GOODS.AsString='S' then lPart22.Tag:=3;
  End;
  PartRefForm.Free;
end;
//==============================================================================
procedure TRashPPForm.edRezChange(Sender: TObject);
begin
  If edRez.Text = '' Then
  Begin
    edRez.Tag := 0;
    lRez.Tag  := 0;
    lRezLeft.Caption := '';
  End
  Else
  Begin
    qRez.FindFirst;
    edRez.Tag := qRezID.AsInteger;
    lRez.Tag  := qRezINST.AsInteger;
    GetLeft;
  End;
end;
//==============================================================================
procedure TRashPPForm.edPriceChange(Sender: TObject);
begin
  edSum.Value := Round05(edCount_.Value * edPrice.Value*100)/100;
  If chUchPrice.Checked Then edPrice2.Value := edPrice.Value
                        Else edPrice2.Value := Round05(edPrice.Value * 120)/100;
  edTotal.Value := Round05(edCount_.Value * edPrice2.Value *100)/100;
end;
//==============================================================================
procedure TRashPPForm.bbCancelClick(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;

//==============================================================================
procedure TRashPPForm.bbOkClick(Sender: TObject);
Var
  Res: String;
  PRIH_ID, i: Integer;
  RashForm: TRashForm;
  PartId,PartInst,PartId2,PartInst2,Rezid,RezInst,vId :integer;
begin
  If edOper.Text = '' Then
  Begin
    ShowMessage(TranslateText('Не введена операция!'));
    Exit;
  End;
  If (edPart1.Text = '') or (edPart2.Text = '') Then
  Begin
    ShowMessage(TranslateText('Требуется указать обе партии!'));
    Exit;
  End;
  If edRez.Text = '' Then
  Begin
    ShowMessage(TranslateText('Нужно указать резервуар.'));
    Exit;
  End;
  If (edPrice.Value = 0) and (Oper_id <> 'S') and (Oper_id2 <> 'S') Then
  Begin
    ShowMessage(TranslateText('Следует ввести цену товара.'));
    Exit;
  End;
  If edCount_.Value = 0 Then
  Begin
    ShowMessage(TranslateText('Нулевое количество не допускается.'));
    Exit;
  End;
  If edActDate.Text[1] = ' ' Then
  Begin
    ShowMessage(TranslateText('Необходимо ввести дату расхода!'));
    Exit;
  End;
  If edTo1.Text = ''  Then
  Begin
    ShowMessage(TranslateText('Пожалуйста укажите КОМУ Вы хотите отпустить НП!'));
    Exit;
  End;

  If (edNP_type.tag <> edNP_Type2.Tag) and not TestNPGroup(edNP_Type.Tag, edNP_Type2.Tag, OperId) then
  Begin
    ShowMessage(TranslateText('Тип НП должен совпадать в обеих партиях!'));
    Exit;
  End;

  RashForm := TRashForm.Create(Application);
  try
    if ReadOilVar('PARTTEST') = 'Y' then
      if RashForm.TestPartinEditingAndAdding(
        edPart1.Tag, lPart1.Tag, edActDate.Date, edCount_.Value, edId.Tag, SP.Tag, OperId, edId.Tag = 0) = false then
        exit;
  finally
    RashForm.Free;
  end;

  if edId.Text  = '' then
    edId.Text:=IntToStr(GetSeqNextVal('S_OIL_RASH'));

  If edId.Tag = 0 Then Res := TranslateText('ДОБАВИТЬ')
                  Else Res := TranslateText('ИЗМЕНИТЬ');

  If MessageDlg(TranslateText('Вы уверены что хотите ')+Res+TranslateText(' ОТПУСК НЕФТЕПРОДУКТОВ (Переброска с партии на партию)?'),
    mtConfirmation, [mbYes, mbNo], 0) = mrYes
  Then
  Begin

    If MessageDlg(TranslateText('Будет сформирован также ПРИХОД. Вы уверены что хотите продолжить?'),
      mtConfirmation, [mbYes, mbNo], 0) = mrYes
    Then
    Try
      With SP Do
      Begin
        StartSQL;
        If edPart2.Text = '' Then
          PRIH_ID := 0
        Else
        Begin
          PRIH_ID := GetSeqNextVal('S_OIL_PRIH');
          DelRashPrih(StrToInt(edID.Text),Tag,'N');

          StoredProcName := 'OIL.INSORUPDOIL_PRIHOD';
          Prepare;
          for i:=0 to Params.Count - 1 do
            Params[i].Clear;
          ParamByName('ID#').AsInteger         := PRIH_ID;
          ParamByName('STATE#').AsString       := 'Y';
          ParamByName('INST#').AsInteger       := Tag;
          ParamByName('EMP_ID#').AsInteger     := EMP_ID;
          If edActDate.Text[1] <> ' ' Then
            ParamByName('DATE_#').AsDateTime := edActDate.Date;
          If OperId <> 0 Then
            ParamByName('OPER_ID#').AsInteger := OperId;
          ParamByName('PART_ID#').AsInteger    := edPart2.Tag;
          ParamByName('PART_INST#').AsInteger  := lPart2.Tag;
          ParamByName('DATE_OTPR#').AsDateTime := edActDate.Date;
          ParamByName('DOST#').AsInteger := DOST_SKLAD;
          ParamByName('NP_TYPE#').AsInteger   := edNp_Type2.Tag;
          ParamByName('RASH#').AsInteger      := StrToInt(edID.Text);
          ParamByName('RASH_INST#').AsInteger := Tag;
          ParamByName('FROM_#').AsInteger     := edFrom2.Tag;
          ParamByName('FROM_INST#').AsInteger := lFrom2.Tag;
          ParamByName('TO_#').AsInteger       := edFrom.Tag;
          ParamByName('TO_INST#').AsInteger   := lFrom.Tag;
          ExecProc;
          Res:=ParamByName('Result').AsString;
          If Length(Res)>0 Then
            If Res[1]<>'0' Then
              Raise Exception.Create(SubStr(Res,2));

          vId:=GetSeqNextVal('S_OIL_PRIH_DET');

          StoredProcName := 'OIL.INSORUPDOIL_PRIH_DET';
          Prepare;
          for i:=0 to Params.Count - 1 do
            Params[i].Clear;
          ParamByName('ID#').AsInteger         := vId;
          ParamByName('STATE#').AsString       := 'Y';
          ParamByName('INST#').AsInteger       := Tag;
          ParamByName('PRIHOD_ID#').AsInteger  := PRIH_ID;
          ParamByName('DOC_COUNT#').AsFloat    := edCount_.Value;
          ParamByName('FACT_COUNT#').AsFloat   := edCount_.Value;
          If edRez.Text <> '' Then
          Begin
            ParamByName('REZ#').AsInteger        := edRez.Tag;
            ParamByName('REZ_INST#').AsInteger   := lRez.Tag;
          End;
          ExecProc;
          Res:=ParamByName('Result').AsString;
          If Length(Res)>0 Then
            If Res[1]<>'0' Then
              Raise Exception.Create(SubStr(Res,2));
        End;

        DBSaver.SaveRecord('OIL_RASHOD',
         ['ID', edId.Text,
          'STATE', 'Y',
          'INST', Tag,
          'EMP_ID', EMP_ID,
          'DATE_', edActDate.Date,
          'FROM_ID', edFrom.Tag,
          'FROM_INST', lFrom.Tag,
          'TO_ID', edTo1.Tag,
          'TO_INST', lTo1.Tag,
          'OPER_ID', OperId,
          'PART_ID', edPart1.Tag,
          'PART_INST',lPart1.Tag,
          'TEMPER', 0,
          'UD_WEIG', 1,
          'LITR', edCount_.Value * 1000,
          'COUNT_', edCount_.Value,
          'PRICE', edPrice.Value,
          'PACK', TranslateText('По складу'),
          'INCL_DEBET', IfThen(chDebet.Checked, 'Y', 'N'),
          'SBOR_POST', IfThen(chSborPost.Checked, 'Y', 'N'),
          'SBOR_NAC', IfThen(chSborNac.Checked, 'Y', 'N'),
          'SBOR_NDS', IfThen(chSborNDS.Checked, 'Y', 'N'),
          'UCH_PRICE', IfThen(chUchPrice.Checked, 'Y', 'N'),
          'OWN_GOOD', IfThen(chOwn.Checked, 'Y', 'N'),
          'REZ', BoolTo_(edRez.Text = '', null, edRez.Tag),
          'REZ_INST', BoolTo_(edRez.Text = '', null, lRez.Tag),
          'COMM', edComm.Text,
          'PRIH', BoolTo_(edPart2.Text = '', null, PRIH_ID),
          'PRIH_INST', BoolTo_(edPart2.Text = '', null, Tag),
          'USER_ID', SUPER_REAL_EMP_ID
          ]);
        PartId := EdPart1.Tag;
        PartInst := lPart1.Tag;
        PartId2 := EdPart2.Tag;
        PartInst2 := Lpart2.Tag;
        RezId := edRez.Tag;
        RezInst := lRez.Tag;
        
        with MainForm do

          if (PartRest(PartId,PartInst)<0) or
             (RezRest(RezId,RezInst)<0) or
             (PartRezRest(PartId,PartInst,RezId,RezInst)<0) or
             (PartRest(PartId2,PartInst2)<0) or
             (PartRezRest(PartId2,PartInst2,RezId,RezInst)<0)
          then
            Raise Exception.Create(TranslateText('Эта операция приводит к отрицательным остаткам и не может быть выполнена!'));
        end; // with MainForm do
        CommitSQL;
        Close;
        ModalResult := mrOk;
    except on E:Exception do
      begin
        RollbackSQL;
        MessageDlg(TranslateText('Ошибка : ')+E.message, mtError, [mbOk], 0);
      end;
    end;
  end;
end;
//==============================================================================
procedure TRashPPForm.qRezFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := (qRezNum.AsString = edRez.Text);
end;
//==============================================================================
procedure TRashPPForm.edFromButtonClick(Sender: TObject);
var
  vId,vInst:integer;
  vName:string;
begin
  if ChooseOrg.CaptureOrg(1,Main_id,Inst,'yyx',vId,vInst,vName) then begin
    edFrom.Text := vName;
    edFrom.Tag := vId;
    lFrom.tag := vInst;
    DefineRashRez(edRez,qRez,vId,edPart1.Tag,lPart1.Tag);
    GetLeft;
  end;
end;
//==============================================================================
procedure TRashPPForm.edActDateChange(Sender: TObject);
begin
  if not Self.Visible and ((Sender as TDateEdit).Date <= StrToDate(Close_Date)) then
    (Sender as TDateEdit).Enabled := false;
  bbOk.Enabled := (edActDate.Date > StrToDate(CLOSE_DATE));
end;
//==============================================================================
end.
