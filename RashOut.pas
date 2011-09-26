unit RashOut;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Placemnt, Db, DBTables, StdCtrls, Buttons, ToolEdit, CurrEdit, Mask,
  ExtCtrls, uCommonForm,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess,
  StrUtils, Variants;

type
  TRashOutForm = class(TCommonForm)
    Bevel1: TBevel;
    Bevel4: TBevel;
    Label26: TLabel;
    Label18: TLabel;
    lPart: TLabel;
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
    Panel2: TPanel;
    Panel1: TPanel;
    lPartLeft: TLabel;
    Label27: TLabel;
    Panel4: TPanel;
    Label31: TLabel;
    lRezLeft: TLabel;
    chSborNDS: TCheckBox;
    chSborNac: TCheckBox;
    chSborPost: TCheckBox;
    chUchPrice: TCheckBox;
    chDebet: TCheckBox;
    edComm: TEdit;
    edPart: TComboEdit;
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
    Panel3: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    SP: TOilStoredProc;
    qFrom: TOilQuery;
    qFromNAME: TStringField;
    q1: TOilQuery;
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
    Bevel3: TBevel;
    Panel5: TPanel;
    Label28: TLabel;
    lPartRezLeft: TLabel;
    lFrom: TLabel;
    edFrom: TComboEdit;
    qRezLeft: TOilQuery;
    qRezLeftS: TFloatField;
    qRezLeftREZ_ID: TFloatField;
    qRezLeftREZ_INST: TFloatField;
    edRez: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edPriceChange(Sender: TObject);
    procedure edRezChange(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure qRezFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure edOperButtonClick(Sender: TObject);
    procedure edPartButtonClick(Sender: TObject);
    Procedure GetLeft;
    procedure edFromButtonClick(Sender: TObject);
    procedure edActDateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Rez_Id, Rez_Inst, Part_Id,Part_Inst : Integer;
    PrevCount : Extended;
    Oper_id   : string;
  end;

var
  RashOutForm: TRashOutForm;

implementation

Uses OperTypeRef, AutoRef, PartRef, Main, OilStd, ChooseOrg, UDbFunc, ExFunc;

{$R *.DFM}

Procedure TRashOutForm.GetLeft;
Begin
  lPartLeft.Caption    := '';
  lRezLeft.Caption     := '';
  lPartRezLeft.Caption := '';
  With qLeft Do
  Begin
    If (edRez.Text <> '')And(edPart.Text <> '') Then
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT SUM(S) S  FROM V_OIL_LEFT WHERE');
      SQL.Add('REZ_ID ='+qRezID.AsString+'AND REZ_INST  = ' + qRezINST.AsString);
      SQL.Add('AND PART_ID='+IntToStr(edPart.Tag)+' AND PART_INST='+IntToStr(lPart.Tag));
      Open;
      lPartRezLeft.Caption := FloatToStr(Round(qLeftS.AsFloat*1000000)/1000000);
    End;

    If edPart.Text <> '' Then
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT SUM(S) S FROM V_OIL_LEFT ');
      SQL.Add(' Where PART_ID = ' + IntToStr(edPart.Tag) + ' AND PART_INST  = ' + IntToStr(lPart.Tag));
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

Function GetNull(s:integer):string;
Var Out1,ss:string;
    i:integer;
Begin
  Out1 := IntTostr(S);
  Ss := out1;
  For I := 1 To 8-Length(out1) Do ss:='0'+ss;
  GetNull := Ss;
End;

procedure TRashOutForm.FormShow(Sender: TObject);
begin
  lPartLeft.Caption := '';
  lRezLeft.Caption := '';
  If SP.Tag = 0 Then SP.Tag := INST;
  qRez.Close;
  qRez.ParamByName('a').AsInteger := edFrom.Tag;
  qRez.Open;

  If edID.Text <> '' Then edRezChange(Nil)
  Else
  Begin
    Try
      qFrom.Close;
      qFrom.ParamByName('a').AsInteger := SP.Tag;
      qFrom.Open;
      If qFrom.RecordCount = 0 Then Raise Exception.Create(TranslateText('Нет такой организации!'));
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
    edPart.Clear;
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
  End;
  DefineRashRez(edRez,qRez,edFrom.Tag,edPart.Tag,lPart.Tag);
  GetLeft;
end;

procedure TRashOutForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  q1.Close;
  qLeft.Close;
  qRez.Close;
  qFrom.Close;
  Action := caFree;
end;

procedure TRashOutForm.edPriceChange(Sender: TObject);
begin
  edSum.Value := Round05(edCount_.Value * edPrice.Value*100)/100;
  If chUchPrice.Checked Then edPrice2.Value := edPrice.Value
                        Else edPrice2.Value := Round05(edPrice.Value * 120)/100;
  edTotal.Value := Round05(edCount_.Value * edPrice2.Value *100)/100;
end;

procedure TRashOutForm.edRezChange(Sender: TObject);
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

procedure TRashOutForm.bbOkClick(Sender: TObject);
Var
  Res : String;
//  R : Extended;
  PartId,PartInst,Rezid,RezInst :integer;
begin
  If (edOper.Text = '') Then
  Begin
    ShowMessage(TranslateText('Операция обязательна.'));
    Exit;
  End;
  If edActDate.Text[1] = ' ' Then
  Begin
    ShowMessage(TranslateText('Потрудитесь ввести дату расхода!'));
    Exit;
  End;
  If edRez.Text = '' Then
  Begin
    ShowMessage(TranslateText('Нужно указать резервуар.'));
    Exit;
  End;
  If (edPrice.Value = 0) and (Oper_Id <> 'S') Then
  Begin
    ShowMessage(TranslateText('Нулевая цена не допускается.'));
    Exit;
  End;
  If (edPart.Text = '') Then
  Begin
    ShowMessage(TranslateText('Партия обязательна.'));
    Exit;
  End;
  If (edCount_.Value = 0) Then
  Begin
    ShowMessage(TranslateText('Нулевое количество не допускается.'));
    Exit;
  End;
  if edId.Text  = '' then
    edId.Text:=IntToStr(GetSeqNextVal('S_OIL_RASH'));

  If edId.Tag = 0 Then Res := TranslateText('ДОБАВИТЬ')
                  Else Res := TranslateText('ИЗМЕНИТЬ');
  If MessageDlg(TranslateText('Вы уверены что хотите ')+Res+TranslateText(' ОТПУСК НЕФТЕПРОДУКТОВ (Списание НП) ?'),
    mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  Begin
    Try
      StartSQL;
      DBSaver.SaveRecord('OIL_RASHOD',
       ['ID', edId.Text,
        'STATE', 'Y',
        'INST', Tag,
        'EMP_ID', EMP_ID,
        'DATE_', edActDate.Date,
        'FROM_ID', edFrom.Tag,
        'FROM_INST', lFrom.Tag,
        'OPER_ID', edOper.Tag,
        'PART_ID', edPart.Tag,
        'PART_INST', lPart.Tag,
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
        'USER_ID', SUPER_REAL_EMP_ID
        ]);
      PartId := edPart.Tag;
      PartInst := lPart.Tag;
      RezId := edRez.Tag;
      RezInst := lRez.Tag;
      with MainForm do
      begin
        if (PartRest(PartId,PartInst)<0) or (RezRest(RezId,RezInst)<0) or
          (PartRezRest(PartId,PartInst,RezId,RezInst)<0) then
        begin
          RollbackSQL;
          MessageDlg(TranslateText('Эта операция приводит к отрицательным остаткам и не может быть выполнена!'),
                      mtError, [mbOk], 0);

        end
        else
        begin
          CommitSQL;
          self.Close;
          self.ModalResult := mrOk;
        end;
      end;
    Except On E:Exception Do
      Begin
        RollbackSQL;
        MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
      End;
    End;
  End;
end;

procedure TRashOutForm.qRezFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := (qRezNum.AsString = SubStr(edRez.Text, 1));
end;

procedure TRashOutForm.edOperButtonClick(Sender: TObject);
Var
  OperTypeRefForm : TOperTypeRefForm;
begin
  Application.CreateForm(TOperTypeRefForm, OperTypeRefForm);
  OperTypeRefForm.SGrpId := OPG_OUT;
  OperTypeRefForm.bbClear.Enabled:=false;
  //OperTypeRefForm.bbSearch.Enabled:=false;
  OperTypeRefForm.ShowModal;
  If OperTypeRefForm.ModalResult = mrOk Then
  Begin
    edOper.Text := OperTypeRefForm.qName.AsString;
    edOper.Tag  := OperTypeRefForm.qId.AsInteger;
  End;
  OperTypeRefForm.Free;
end;

procedure TRashOutForm.edPartButtonClick(Sender: TObject);
Var
  PartRefForm : TPartRefForm;
begin
  Application.CreateForm(TPartRefForm, PartRefForm);
  PartRefForm.ShowModal;
  If PartRefForm.ModalResult = mrOk Then
  Begin
    edPart.Text       := PartRefForm.qId.AsString;
    edPart.Tag        := PartRefForm.qId.AsInteger;
    lPart.Tag         := PartRefForm.qInst.AsInteger;
    edDog.Text        := PartRefForm.qDog.AsString;
    edDogDate.Date    := PartRefForm.qDog_Date.AsDateTime;
    edNP_Type.Text    := PartRefForm.qNP_Type_Name.AsString;
    edNP_Type.Tag     := PartRefForm.qNP_Type.AsInteger;
    chOwn.Checked     := PartRefForm.qOwn_Goods.AsString = 'O';
    Oper_Id           := PartRefForm.qOwn_Goods.asString;
    If Round(PartRefForm.qBase_.AsFloat*1000)/1000 = 0
      Then edCount_.DecimalPlaces := 6
      Else edCount_.DecimalPlaces := 0;
    edPrice.Value     := PartRefForm.qSS.AsFloat;
    PartRefForm.Free;
    If edPart.Text <> '' Then 
      DefineRashRez(edRez,qRez,edFrom.Tag,edPart.Tag,lPart.Tag);
    GetLeft;
  End else
    PartRefForm.Free;
end;

procedure TRashOutForm.edFromButtonClick(Sender: TObject);
var vId,vInst:integer;
    vName:string;
begin
  if ChooseOrg.CaptureOrg(1,Main_id,Inst,'yyx',vId,vInst,vName) then begin
    edFrom.Text:=vName;
    edFrom.Tag:=vId;
    lFrom.tag:=vInst;
    DefineRashRez(edRez,qRez,edFrom.Tag,edPart.Tag,lPart.Tag);
    GetLeft;
  end;
end;

procedure TRashOutForm.edActDateChange(Sender: TObject);
begin
  if not Self.Visible and ((Sender as TDateEdit).Date <= StrToDate(Close_Date)) then
    (Sender as TDateEdit).Enabled := false;
  bbOk.Enabled := (edActDate.Date > StrToDate(CLOSE_DATE));
end;

end.
