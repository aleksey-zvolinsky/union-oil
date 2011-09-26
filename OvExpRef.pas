unit OvExpRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGridEh, Buttons, StdCtrls,
  ExtCtrls, ToolEdit, Mask,uOilQuery,Ora, uOilStoredProc, ActnList, MemDS,
  DBAccess, RXCtrls;

type
  TOvExpRefForm = class(TBaseForm)
    sbClearPart: TSpeedButton;
    lPart: TLabel;
    edPart: TComboEdit;
    sbClearType: TSpeedButton;
    Label4: TLabel;
    edType: TComboEdit;
    Label1: TLabel;
    sbClearFilial: TSpeedButton;
    cmeFilial: TComboEdit;
    Bevel1: TBevel;
    Label3: TLabel;
    Label2: TLabel;
    sbClearBeginDate: TSpeedButton;
    sbClearEndDate: TSpeedButton;
    edBeginDate: TDateEdit;
    edEndDate: TDateEdit;
    Label5: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    cbShowOrg: TCheckBox;
    qPART_INST_ORG: TStringField;
    qPART_ID: TFloatField;
    qPART_INST: TFloatField;
    qPART_NAME: TStringField;
    qDATE_: TDateTimeField;
    qOV_EXP_TYPE: TFloatField;
    qOV_EXP_NAME: TStringField;
    qSUMM: TFloatField;
    qCOMMENT_: TStringField;
    qREAL_EXP: TStringField;
    qID: TFloatField;
    qINST: TFloatField;
    qPART_DATE: TDateTimeField;
    qNP_TYPE: TFloatField;
    qNP_TYPE_NAME: TStringField;
    procedure cbShowOrgClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure edPartButtonClick(Sender: TObject);
    procedure cmeFilialButtonClick(Sender: TObject);
    procedure sbClearBeginDateClick(Sender: TObject);
    procedure sbClearEndDateClick(Sender: TObject);
    procedure sbClearPartClick(Sender: TObject);
    procedure sbClearFilialClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure sbClearTypeClick(Sender: TObject);
    procedure edTypeButtonClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OvExpRefForm: TOvExpRefForm;

implementation

uses Main, PartRef, ChooseOrg, OvExpTypeRef, uDBFunc, OvExp, OILStd;

{$R *.DFM}

procedure TOvExpRefForm.cbShowOrgClick(Sender: TObject);
begin
  DBGrid1.Columns[0].Visible := cbShowOrg.Checked;
end;

procedure TOvExpRefForm.bbSearchClick(Sender: TObject);
begin
  Try
    With q Do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('select * from V_OIL_OVERHEAD_EXPENCES where 1=1');
      If edBeginDate.Text[1] <> ' ' Then SQL.Add('And Date_ >= To_Date('''+edBeginDate.Text+''',''DD.MM.YYYY'')');
      If edEndDate.Text[1] <> ' ' Then SQL.Add('And Date_ <= To_Date('''+edEndDate.Text+''',''DD.MM.YYYY'')');
      If edPart.Text <> '' Then SQL.ADD('And PART_ID='+IntToStr(edPart.Tag)+' And Part_Inst='+IntToStr(lPart.Tag));
      if cmeFilial.Text <> '' then SQL.Add(' and Part_inst='+IntToStr(cmeFilial.Tag));
      if edType.Text <> '' then SQL.Add(' and OV_EXP_TYPE='+IntToStr(edType.Tag));
      Open;
    End;
  Except On E:Exception Do
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
  End;
end;

procedure TOvExpRefForm.edPartButtonClick(Sender: TObject);
Var
  PartRefForm : TPartRefForm;
begin
  Application.CreateForm(TPartRefForm, PartRefForm);
  PartRefForm.ShowModal;
  If PartRefForm.ModalResult = mrOk Then
  Begin
    edPart.Text    := PartRefForm.qId.AsString;
    edPart.Tag     := PartRefForm.qId.AsInteger;
    lPart.Tag      := PartRefForm.qInst.AsInteger;
  End;
  PartRefForm.Free;
end;

procedure TOvExpRefForm.cmeFilialButtonClick(Sender: TObject);
  var vId, vInst: Integer;
      vName: String;
begin
if ChooseOrg.CaptureOrg(1, MAIN_ID, INST, 'yyyyynnn', vId, vInst, vName) then
  begin
    cmeFilial.Tag := vId;
    cmeFilial.Text := vName;
  end;
end;

procedure TOvExpRefForm.sbClearBeginDateClick(Sender: TObject);
begin
  edBeginDate.Clear;
end;

procedure TOvExpRefForm.sbClearEndDateClick(Sender: TObject);
begin
  edEndDate.Clear;
end;

procedure TOvExpRefForm.sbClearPartClick(Sender: TObject);
begin
  edPart.Clear;
end;

procedure TOvExpRefForm.sbClearFilialClick(Sender: TObject);
begin
  cmeFilial.Clear;
end;

procedure TOvExpRefForm.bbClearClick(Sender: TObject);
begin
  sbClearFilialClick(nil);
  sbClearPartClick(nil);
  sbClearBeginDateClick(nil);
  sbClearEndDateClick(nil);
  sbClearTypeClick(nil);
end;

procedure TOvExpRefForm.sbClearTypeClick(Sender: TObject);
begin
  edType.Clear;
end;

procedure TOvExpRefForm.edTypeButtonClick(Sender: TObject);
Var
  OvExpTypeRefForm : TOvExpTypeRefForm;
begin
  Application.CreateForm(TOvExpTypeRefForm, OvExpTypeRefForm);
  OvExpTypeRefForm.ShowModal;
  If OvExpTypeRefForm.ModalResult = mrOk Then
  Begin
    edType.Text := OvExpTypeRefForm.qName.AsString;
    edType.Tag  := OvExpTypeRefForm.qId.AsInteger;
  End;
  OvExpTypeRefForm.Free;
end;

procedure TOvExpRefForm.sbAddClick(Sender: TObject);
  Var OvExpForm : TOvExpForm;
      BM           :TBookMark;
begin
  BM:=q.GetBookmark;
  Application.CreateForm(TOvExpForm, OvExpForm);
  OvExpForm.ShowModal;
  OvExpForm.lDate.Tag   := 0;
  OvExpForm.edDate.Date := now;
  If OvExpForm.ModalResult = mrOk Then
  Begin
    bbClearClick(Nil);
    bbSearchClick(Nil);
  End;
  OvExpForm.Free;
  try q.GotoBookmark(BM) except end;
  q.FreeBookmark(BM);
end;

procedure TOvExpRefForm.sbEditClick(Sender: TObject);
  var OvExpForm : TOvExpForm;
      BM       :TBookMark;
begin
  If q.Active Then
  If q.RecordCount > 0
     Then Begin
        BM:=q.GetBookmark;
        Application.CreateForm(TOvExpForm, OvExpForm);
        OvExpForm.edDate.Date       := qDate_.AsDateTime;
        OvExpForm.lDate.Tag         := qId.AsInteger;
        OvExpForm.edType.Text       := qOV_EXP_NAME.AsString;
        OvExpForm.edType.Tag        := qOV_EXP_TYPE.AsInteger;
        OvExpForm.edPart.Text       := qPART_ID.AsString;
        OvExpForm.edPart.Tag        := qPART_ID.AsInteger;
        OvExpForm.lPart.Tag         := qPART_INST.AsInteger;
        OvExpForm.edDog.Text        := qPART_NAME.AsString;
        OvExpForm.edDogDate.Date    := qPART_DATE.AsDateTime;
        OvExpForm.edNP_Type.Text    := qNP_Type_Name.AsString;
        OvExpForm.edNP_Type.Tag     := qNP_Type.AsInteger;
        OvExpForm.edSumm.Value      := qSumm.AsFloat;
        OvExpForm.edComm.Text       := qComment_.AsString;
        OvExpForm.bbOK.Enabled := Pos(','+IntToStr(qINST.AsInteger)+',',INST_LIST)>0;
        OvExpForm.ShowModal;
        If OvExpForm.ModalResult = mrOk
           Then bbSearchClick(Nil);
        OvExpForm.Free;
        try q.GotoBookmark(BM) except end;
        q.FreeBookmark(BM);
     End;
end;

procedure TOvExpRefForm.sbDelClick(Sender: TObject);
begin
  if Pos(','+IntToStr(qINST.AsInteger)+',',INST_LIST)=0
     then Begin
        MessageDlg(TranslateText('Нельзя удалить запись, созданную другой организацией!'),
          mtError, [mbOk], 0);
        Exit;
     End;
  If MessageDlg(TranslateText('Вы уверены, что хотите удалить запись ?'),
    mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  Begin
    Try
      StartSQL;
      _ExecSQL('update oil_overhead_expences set state=''N'' where id='+IntToStr(qId.AsInteger)+
               ' and inst='+IntToStr(qInst.AsInteger));
      CommitSQL;
      q.Close;
      q.Open;
    Except On E:Exception Do
      MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
    End;
  End;
end;

procedure TOvExpRefForm.FormShow(Sender: TObject);
begin
  bbClearClick(nil);
  bbSearchClick(nil);
end;

end.
