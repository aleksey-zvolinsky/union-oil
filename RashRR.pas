unit RashRR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, ToolEdit, CurrEdit, Mask, ExtCtrls,
  uCommonForm,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess, Variants;

type
  TRashRRForm = class(TCommonForm)
    Label26: TLabel;
    lPart1: TLabel;
    Label8: TLabel;
    Label23: TLabel;
    Label16: TLabel;
    Label9: TLabel;
    lRez: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Bevel2: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    lFrom1: TLabel;
    lTo1: TLabel;
    lFrom: TLabel;
    Panel2: TPanel;
    Panel1: TPanel;
    lPartLeft: TLabel;
    Label27: TLabel;
    Panel4: TPanel;
    Label31: TLabel;
    lRezLeft: TLabel;
    Panel5: TPanel;
    Label6: TLabel;
    lPartRezLeft: TLabel;
    edComm: TEdit;
    edPart1: TComboEdit;
    edDog: TEdit;
    edNP_Type: TEdit;
    edCount_: TRxCalcEdit;
    edDogDate: TDateEdit;
    edRez: TComboBox;
    edActDate: TDateEdit;
    edID: TEdit;
    edOper: TComboEdit;
    chOwn: TCheckBox;
    Panel3: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    edFrom1: TEdit;
    edTo1: TEdit;
    edFrom: TComboEdit;
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
    lRez2: TLabel;
    edRez2: TComboBox;
    qRezLeft: TOilQuery;
    qRezLeftS: TFloatField;
    qRezLeftREZ_ID: TFloatField;
    qRezLeftREZ_INST: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edRezChange(Sender: TObject);
    procedure qRezFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    Procedure GetLeft;
    procedure edRez2Change(Sender: TObject);
    procedure edOperButtonClick(Sender: TObject);
    procedure edFromButtonClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure edPart1ButtonClick(Sender: TObject);
    procedure edActDateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Rez_Id, Rez_Inst, Part_Id,Part_Inst : Integer;
    PrevCount : Extended;
  end;

var
  RashRRForm: TRashRRForm;
  FindRez : Integer;

implementation

Uses ChooseOrg, Main, OilStd, RashRef, OperTypeRef, PartRef, UDbFunc, RashPP, ExFunc;

{$R *.DFM}

Procedure TRashRRForm.GetLeft;
//Var R : Extended;
Begin // Подсчет остатков
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

procedure TRashRRForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TRashRRForm.bbCancelClick(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel; 
end;

procedure TRashRRForm.FormShow(Sender: TObject);
begin
  lPartLeft.Caption := '';
  lRezLeft.Caption := '';
  If SP.Tag = 0 Then SP.Tag := INST;

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
    edOper.Clear;
    edPart1.Clear;
    edDog.Clear;
    edDogDate.Clear;
    edNP_Type.Clear;
    edCount_.Clear;
    edComm.Clear;
  End;
  DefineRashRez(edRez,qRez,edFrom.Tag,edPart1.Tag,lPart1.Tag);
  DefineRashRez(edRez2,qRez,edFrom.Tag);
  GetLeft;
end;

procedure TRashRRForm.edRezChange(Sender: TObject);
begin
  If edRez.Text = '' Then
  Begin
    edRez.Tag := 0;
    lRez.Tag  := 0;
    lRezLeft.Caption := '';
  End
  Else
  if qRez.Active then
  Begin
    FindRez := 1;
    qRez.FindFirst;
    edRez.Tag := qRezID.AsInteger;
    lRez.Tag  := qRezINST.AsInteger;
    GetLeft;
  End;
end;

procedure TRashRRForm.qRezFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  If FindRez = 1 Then Accept := (qRezNum.AsString = edRez.Text)
                 Else Accept := (qRezNum.AsString = edRez2.Text);
end;

procedure TRashRRForm.edRez2Change(Sender: TObject);
begin
  If edRez2.Text = '' Then
  Begin
    edRez2.Tag := 0;
    lRez2.Tag  := 0;
    lRezLeft.Caption := '';
  End
  Else
  if qRez.Active then
  Begin
    FindRez := 2;
    qRez.FindFirst;
    edRez2.Tag := qRezID.AsInteger;
    lRez2.Tag  := qRezINST.AsInteger;
  End;
end;

procedure TRashRRForm.edOperButtonClick(Sender: TObject);
Var
  OperTypeRefForm : TOperTypeRefForm;
begin
  Application.CreateForm(TOperTypeRefForm, OperTypeRefForm);
  OperTypeRefForm.SGrpId := OPG_MOVERR;
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

procedure TRashRRForm.edFromButtonClick(Sender: TObject);
var
  vId,vInst:integer;
  vName:string;
begin
  if ChooseOrg.CaptureOrg(1,0,0,'yyx',vId,vInst,vName) then begin
    edFrom.Text:=vName;
    edFrom.Tag:=vId;
    lFrom.tag:=vInst;
    DefineRashRez(edRez,qRez,edFrom.Tag,edPart1.Tag,lPart1.Tag);
    DefineRashRez(edRez2,qRez,edFrom.Tag,edPart1.Tag,lPart1.Tag);
    GetLeft;
  end;
end;


procedure TRashRRForm.bbOkClick(Sender: TObject);
Var
  Res : String;
  PRIH_ID : Integer;
//  R : Extended;
  PartId,PartInst,Rezid,RezInst,Rezid2,RezInst2,vId :integer;
begin
  If edActDate.Text[1] = ' ' Then
  Begin
    ShowMessage(TranslateText('Введите дату расхода!'));
    Exit;
  End;
  If edOper.Text = '' Then
  Begin
    ShowMessage(TranslateText('Не введена операция!'));
    Exit;
  End;
  If edCount_.Value = 0 Then
  Begin
    ShowMessage(TranslateText('Нулевое количество не допускается'));
    Exit;
  End;
  If edPart1.Text = '' Then
  Begin
    ShowMessage(TranslateText('Партия обязательна'));
    Exit;
  End;
  If (edRez.Text = '') or (edRez2.Text = '') Then
  Begin
    ShowMessage(TranslateText('Требуется указать оба резервуара!'));
    Exit;
  End;
  if edId.Text  = '' then
    edId.Text:=IntToStr(GetSeqNextVal('S_OIL_RASH'));

  If edId.Tag = 0 Then Res := TranslateText('ДОБАВИТЬ')
                  Else Res := TranslateText('ИЗМЕНИТЬ');
  If MessageDlg(TranslateText('Вы уверены что хотите ')+Res+TranslateText(' ОТПУСК НЕФТЕПРОДУКТОВ (Переброска с резервуара в резервуар)?'),
    mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  Begin
    If MessageDlg(TranslateText('Будет сформирован также ПРИХОД. Вы уверены что хотите продолжить?'),
      mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;
    Try
      With SP Do
      Begin
        StartSQL;
        PRIH_ID := GetSeqNextVal('S_OIL_PRIH');
        DelRashPrih(StrToInt(edId.Text),Tag,'N');

        StoredProcName := 'OIL.INSORUPDOIL_PRIHOD';
        Prepare;
        ParamByName('ID#').AsInteger         := PRIH_ID;
        ParamByName('STATE#').AsString       := 'Y';
        ParamByName('INST#').AsInteger       := Tag;
        ParamByName('EMP_ID#').AsInteger     := EMP_ID;
        If edActDate.Text[1] = ' ' Then ParamByName('DATE_#').Clear
          Else ParamByName('DATE_#').AsDateTime := edActDate.Date;
        If edOper.Tag <> 0 Then ParamByName('OPER_ID#').AsInteger := edOper.Tag
                           Else ParamByName('OPER_ID#').Clear;
        ParamByName('PART_ID#').AsInteger    := edPart1.Tag;
        ParamByName('PART_INST#').AsInteger  := lPart1.Tag;
        PartId:=edPart1.Tag;
        PartInst:=lPart1.Tag;
        ParamByName('DATE_OTPR#').AsDateTime := edActDate.Date;
        ParamByName('DOST#').AsInteger := DOST_SKLAD;
        ParamByName('RAIL_ST#').Clear;
        ParamByName('RAIL_INST#').Clear;
        ParamByName('RASCH_TYPE#').Clear;
        ParamByName('NP_TYPE#').AsInteger   := edNp_Type.Tag;
        ParamByName('RASH#').AsInteger      := StrToInt(edID.Text);
        ParamByName('RASH_INST#').AsInteger := Tag;
        ParamByName('FROM_#').AsInteger     := edFrom1.Tag;
        ParamByName('FROM_INST#').AsInteger := lFrom1.Tag;
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
        ParamByName('ID#').AsInteger         := vId;
        ParamByName('STATE#').AsString       := 'Y';
        ParamByName('INST#').AsInteger       := Tag;
        ParamByName('PRIHOD_ID#').AsInteger  := PRIH_ID;
        ParamByName('NAKL#').Clear;
        ParamByName('TANK#').Clear;
        ParamByName('TANK_TYPE#').Clear;
        ParamByName('DOC_COUNT#').AsFloat    := edCount_.Value;
        ParamByName('FACT_COUNT#').AsFloat   := edCount_.Value;
        ParamByName('NED_NORM_UB#').Clear;
        ParamByName('NED_NORM_ER#').Clear;
        ParamByName('NED_POST#').Clear;
        ParamByName('NED_RAIL#').Clear;
        ParamByName('IZL_NORM#').Clear;
        ParamByName('IZL_POST#').Clear;
        If edRez2.Text = '' Then
        Begin
          ParamByName('REZ#').Clear;
          ParamByName('REZ_INST#').Clear;
        End
        Else
        Begin
          ParamByName('REZ#').AsInteger        := edRez2.Tag;
          ParamByName('REZ_INST#').AsInteger   := lRez2.Tag;
        End;
        RezId:=edRez.Tag;
        RezInst:=lRez.Tag;
        RezId2:=edRez2.Tag;
        RezInst2:=lRez2.Tag;
        ExecProc;
        Res:=ParamByName('Result').AsString;
        If Length(Res)>0 Then
          If Res[1]<>'0' Then
            Raise Exception.Create(SubStr(Res,2));

        DBSaver.SaveRecord('OIL_RASHOD',
         ['ID', edId.Text,
          'STATE', 'Y',
          'INST', Tag,
          'EMP_ID', EMP_ID,
          'DATE_', edActDate.Date,
          'FROM_ID', edFrom.Tag,
          'FROM_INST', lFrom.Tag,
          'TO_ID', edFrom1.Tag,
          'TO_INST', lFrom1.Tag,
          'OPER_ID', edOper.Tag,
          'PART_ID', edPart1.Tag,
          'PART_INST',lPart1.Tag,
          'TEMPER', 0,
          'UD_WEIG', 1,
          'LITR', edCount_.Value * 1000,
          'COUNT_', edCount_.Value,
          'PRICE', 0,
          'PACK', TranslateText('По складу'),
          'INCL_DEBET', 'N',
          'SBOR_POST', 'N',
          'SBOR_NAC', 'N',
          'SBOR_NDS', 'N',
          'UCH_PRICE', 'N',
          'OWN_GOOD', 'N',
          'REZ', BoolTo_(edRez.Text = '', null, edRez.Tag),
          'REZ_INST', BoolTo_(edRez.Text = '', null, lRez.Tag),
          'COMM', edComm.Text,
          'PRIH', BoolTo_(edPart1.Text = '', null, PRIH_ID),
          'PRIH_INST', BoolTo_(edPart1.Text = '', null, Tag),
          'USER_ID', SUPER_REAL_EMP_ID
          ]);

      with MainForm do
      begin
        // Заводим приход, детали прихода, отпуск
        // если появляются минусы - полный откат
        if (PartRest(PartId,PartInst)<0) or
           (RezRest(RezId,RezInst)<0) or
           (PartRezRest(PartId,PartInst,RezId,RezInst)<0) or
           (RezRest(RezId2,RezInst2)<0) or
           (PartRezRest(PartId,PartInst,RezId2,RezInst2)<0)
           then
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
      End;
    Except On E:Exception Do
      Begin
        RollbackSQL;
        MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
      End;
    End;
  End;
end;

procedure TRashRRForm.edPart1ButtonClick(Sender: TObject);
Var
  PartRefForm: TPartRefForm;
begin
  Application.CreateForm(TPartRefForm, PartRefForm);
  PartRefForm.ShowModal;
  If PartRefForm.ModalResult = mrOk Then
  Begin
    edPart1.Text   := PartRefForm.qId.AsString;
    edPart1.Tag    := PartRefForm.qId.AsInteger;
    lPart1.Tag     := PartRefForm.qInst.AsInteger;
    edDog.Text     := PartRefForm.qDog.AsString;
    edDogDate.Date := PartRefForm.qDog_Date.AsDateTime;
    edNP_Type.Text := PartRefForm.qNP_Type_Name.AsString;
    edNP_Type.Tag  := PartRefForm.qNP_Type.AsInteger;
    chOwn.Checked  := PartRefForm.qOwn_Goods.AsString = 'O';
    edTo1.Text     := PartRefForm.qTo_Name.AsString;
    edTo1.Tag      := PartRefForm.qTo_.AsInteger;
    lTo1.Tag       := PartRefForm.qTo_Inst.AsInteger;
    edFrom1.Text   := PartRefForm.qFrom_Name.AsString;
    edFrom1.Tag    := PartRefForm.qFrom_.AsInteger;
    lFrom1.Tag     := PartRefForm.qFrom_Inst.AsInteger;
    If Round(PartRefForm.qBase_.AsFloat*1000)/1000 = 0
      Then edCount_.DecimalPlaces := 6
      Else edCount_.DecimalPlaces := 0;
    PartRefForm.Free;
    If edPart1.Text <> '' Then begin
      DefineRashRez(edRez,qRez,edFrom.Tag,edPart1.Tag,lPart1.Tag);
      DefineRashRez(edRez2,qRez,edFrom.Tag);
    End;
    GetLeft;
  End else
    PartRefForm.Free;
end;

procedure TRashRRForm.edActDateChange(Sender: TObject);
begin
  if not Self.Visible and ((Sender as TDateEdit).Date <= StrToDate(Close_Date)) then
    (Sender as TDateEdit).Enabled := false;
  bbOk.Enabled := (edActDate.Date > StrToDate(CLOSE_DATE));
end;

end.
