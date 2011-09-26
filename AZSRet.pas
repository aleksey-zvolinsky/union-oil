unit AZSRet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, ToolEdit, Mask, CurrEdit,
  uCommonForm,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess;

type
  TAZSRetForm = class(TCommonForm)
    Panel2: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Label7: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label21: TLabel;
    Label10: TLabel;
    lAuto: TLabel;
    Label11: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    lPart: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    Label23: TLabel;
    Label16: TLabel;
    Label9: TLabel;
    Label24: TLabel;
    lTo: TLabel;
    lRez: TLabel;
    lFrom: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Bevel3: TBevel;
    Bevel2: TBevel;
    Bevel6: TBevel;
    edDovNum: TEdit;
    edDovDate: TDateEdit;
    edTTNDate: TDateEdit;
    edAuto: TComboEdit;
    edDovSer: TEdit;
    edWayList: TEdit;
    edDovGive: TEdit;
    edPack: TComboBox;
    edTemper: TEdit;
    edPart: TComboEdit;
    edLitr: TRxCalcEdit;
    edDog: TEdit;
    edNP_Type: TEdit;
    edUD_Weig: TRxCalcEdit;
    edCount_: TRxCalcEdit;
    edDogDate: TDateEdit;
    edTO_Place: TEdit;
    edTo: TComboEdit;
    edFrom: TComboEdit;
    edActDate: TDateEdit;
    edID: TEdit;
    chOwn: TCheckBox;
    SP: TOilStoredProc;
    Label4: TLabel;
    edOper: TComboEdit;
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
    qFas: TOilQuery;
    edRez: TComboBox;
    edTTN: TEdit;
    procedure FormShow(Sender: TObject);
    procedure edOperButtonClick(Sender: TObject);
    Procedure GetState;
    procedure edPackChange(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure edPartButtonClick(Sender: TObject);
    procedure edRezChange(Sender: TObject);
    procedure qRezFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure edFromButtonClick(Sender: TObject);
    procedure edToButtonClick(Sender: TObject);
    procedure edAutoButtonClick(Sender: TObject);
    procedure edLitrChange(Sender: TObject);
    procedure edActDateChange(Sender: TObject);
    procedure edPartChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Fas : Boolean;
    OldDate    :TDate;
  end;

var
  AZSRetForm: TAZSRetForm;
  Part_Id_Old, Part_Inst_Old: integer;

implementation

Uses Main, OilStd, OperTypeRef, PartRef, ChooseOrg, AutoRef, UDbFunc, Prih;

{$R *.DFM}

Procedure TAZSRetForm.GetState;
Begin
  edTTN.Enabled := ANSIUpperCase(edPack.Text) <> TranslateText('ПО СКЛАДУ');
  edTTNDate.Enabled := edTTN.Enabled;
  edDovNum.Enabled  := edTTN.Enabled;
  edDovDate.Enabled := edTTN.Enabled;
  edDovSer.Enabled  := edTTN.Enabled;
  edAuto.Enabled    := edTTN.Enabled;
  edWayList.Enabled := edTTN.Enabled;
  edDovGive.Enabled := edTTN.Enabled;

  If edTTN.Enabled Then edTTN.Color := clWhite
                   Else edTTN.Color := clSilver;
  edTTNDate.Color := edTTN.Color;
  edDovNum.Color  := edTTN.Color;
  edDovDate.Color := edTTN.Color;
  edDovSer.Color  := edTTN.Color;
  edAuto.Color    := edTTN.Color;
  edWayList.Color := edTTN.Color;
  edDovGive.Color := edTTN.Color;

  edTemper.Enabled  := (Not Fas)And(edTTN.Enabled);
  edUd_Weig.Enabled := edTemper.Enabled;
  edLitr.Enabled    := edTemper.Enabled;
  If edTemper.Enabled Then edTemper.Color := clWhite
                      Else edTemper.Color := clSilver;
  edUd_Weig.Color := edTemper.Color;
  edLitr.Color    := edTemper.Color;

  If Fas Then edCount_.DecimalPlaces := 0
         Else edCount_.DecimalPlaces := 6;
End;

procedure TAZSRetForm.FormShow(Sender: TObject);
begin
  If SP.Tag = 0 Then SP.Tag := INST;
  edUd_Weig.Enabled := edTemper.Enabled;
  edLitr.Enabled    := edTemper.Enabled;
  If edTemper.Enabled Then edTemper.Color := clWhite
                      Else edTemper.Color := clSilver;
  edUd_Weig.Color := edTemper.Color;
  edLitr.Color    := edTemper.Color;
  edPackChange(Nil);

  If edID.Text = '' Then
  Begin
    Try
      qFrom.Close;
      qFrom.ParamByName('a').AsInteger := SP.Tag;
      qFrom.Open;
      If qFrom.RecordCount = 0 Then Raise Exception.Create(TranslateText('Нет такой организации!'));
      edTO.Text := qFromName.AsString;
      edTO.Tag  := SP.Tag;
      lTO.Tag   := SP.Tag;
    Except On E:Exception Do
      Begin
        MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
        Close;
        Exit;
      End;
    End;
    edActDate.Date := Date;
    edTTNDate.Date := Date;
    edFrom.Clear;
    edOper.Tag  := 54;
    edOper.Text := TranslateText('Возврат с АЗС');
    edPart.Clear;
    edDog.Clear;
    edDogDate.Clear;
    edTTN.Clear;
    edAuto.Clear;
    edWayList.Clear;
    edTo_Place.Clear;
    edDovNum.Clear;
    edDovDate.Clear;
    edDovSer.Clear;
    edDovGive.Clear;
    edNP_Type.Clear;
    edPack.Text := '';
    edTemper.Clear;
    edUD_Weig.Clear;
    edLitr.Clear;
    edCount_.Clear;
  End
  else
  begin
    Part_Id_Old := edPart.Tag;
    Part_Inst_Old := lPart.Tag;
  end;
  qRez.Close;
  qRez.ParamByName('a').AsInteger := edTo.Tag;
  qRez.Open;
  FillRezList(edRez.Items,edTo.Tag);
end;

procedure TAZSRetForm.edOperButtonClick(Sender: TObject);
Var
  OperTypeRefForm : TOperTypeRefForm;
begin
  Application.CreateForm(TOperTypeRefForm, OperTypeRefForm);
  OperTypeRefForm.SGrpId := OPG_AZSRET;
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

procedure TAZSRetForm.edPackChange(Sender: TObject);
begin
  GetState;
end;

procedure TAZSRetForm.bbCancelClick(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;

procedure TAZSRetForm.bbOkClick(Sender: TObject);
Var
  Res : String;
  vId: integer;
  PrihForm: TPrihForm;
begin
  if edCount_.Value  = 0 then
  begin
    ShowMessage(TranslateText('Нулевое количество не допускается.'));
    Exit;
  end;
  if (edLitr.Value  = 0) and edLitr.Enabled then
  begin
    ShowMessage(TranslateText('Нулевой литраж не допускается.'));
    Exit;
  end;
  if edOper.Text = '' then
  begin
    ShowMessage(TranslateText('Нужно указать операцию.'));
    Exit;
  end;
  if edFrom.Text = '' then
  begin
    ShowMessage(TranslateText('Источник возврата обязателен.'));
    Exit;
  end;
  if edPart.Text = '' then
  begin
    ShowMessage(TranslateText('Партия обязательна.'));
    Exit;
  end;
  if edRez.Text = '' then
  begin
    ShowMessage(TranslateText('Укажите резервуар.'));
    Exit;
  end;

  PrihForm := TPrihForm.Create(Application);
  if ReadOilVar('PARTTEST') = 'Y' then
    if edId.Text <> '' then
      if PrihForm.TestPartinEditingAndDeleting(
        Part_Id_Old, Part_Inst_Old, edPart.Tag, lPart.Tag, edActDate.Date, edCount_.Value, StrToInt(edId.Text)) = false then
        exit;
  PrihForm.Free;

  if edID.Text  = '' then
    edId.Text := IntToStr(GetSeqNextVal('S_OIL_PRIH'));

  If edPart.Text = '' Then Raise Exception.Create(TranslateText('Введите пожалуйста партию!'));
  If edId.Tag = 0 Then Res := TranslateText('ДОБАВИТЬ')
                  Else Res := TranslateText('ИЗМЕНИТЬ');

  If MessageDlg(TranslateText('Вы уверены что хотите ')+Res+TranslateText(' ВОЗВРАТ С АЗС ?'),
    mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  Try
    StartSQL;
    With SP Do
    Begin
      If Tag = 0 Then Tag := INST;
      _ExecSql(
        ' update oil_prih_det set state=''N'''+
        ' where prihod_id='+edId.Text+' and inst='+IntToStr(MAIN_ORG.INST));

      StoredProcName := 'OIL.INSORUPDOIL_PRIHOD';
      Prepare;
      ParamByName('ID#').AsInteger         := StrToInt(edId.Text);
      ParamByName('STATE#').AsString       := 'Y';
      ParamByName('INST#').AsInteger       := Tag;
      ParamByName('EMP_ID#').AsInteger     := EMP_ID;
      ParamByName('EMP_INST#').AsInteger   := EMP_ID;
      If edActDate.Text[1] = ' ' Then ParamByName('DATE_#').Clear
        Else ParamByName('DATE_#').AsDateTime := edActDate.Date;
      If edOper.Tag <> 0 Then ParamByName('OPER_ID#').AsInteger := edOper.Tag
                         Else ParamByName('OPER_ID#').Clear;
      If edPart.Tag <> 0 Then
      Begin
        ParamByName('PART_ID#').AsInteger   := edPart.Tag;
        ParamByName('PART_INST#').AsInteger := lPart.Tag;
      End
      Else
      Begin
        ParamByName('PART_ID#').Clear;
        ParamByName('PART_INST#').Clear;
      End;
      ParamByName('DATE_OTPR#').AsDateTime := edTTNDate.Date;
      ParamByName('DOST#').AsInteger := 3;
      ParamByName('RAIL_ST#').Clear;
      ParamByName('RAIL_INST#').Clear;
      ParamByName('RASCH_TYPE#').Clear;
      ParamByName('NP_TYPE#').AsInteger := edNp_Type.Tag;
      ParamByName('RASH#').Clear;
      ParamByName('RASH_INST#').Clear;
      ParamByName('FROM_#').AsInteger     := edFrom.Tag;
      ParamByName('FROM_INST#').AsInteger := lFrom.Tag;
      ParamByName('TO_#').AsInteger       := edTo.Tag;
      ParamByName('TO_INST#').AsInteger   := lTo.Tag;
      ParamByName('DOG#').Clear;
      ParamByName('DOG_INST#').Clear;
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
      ParamByName('PRIHOD_ID#').AsInteger  := StrToInt(edID.Text);
      ParamByName('NAKL#').AsString        := edTemper.Text;
      ParamByName('TANK#').AsString        := edLitr.Text;
      ParamByName('TANK_TYPE#').AsString   := edUd_Weig.Text;
      ParamByName('DOC_COUNT#').AsFloat    := edCount_.Value;
      ParamByName('FACT_COUNT#').AsFloat   := edCount_.Value;
      ParamByName('NED_NORM_UB#').AsFloat  := 0;
      ParamByName('NED_NORM_ER#').AsFloat  := 0;
      ParamByName('NED_POST#').AsFloat     := 0;
      ParamByName('NED_RAIL#').AsFloat     := 0;
      ParamByName('IZL_NORM#').AsFloat     := 0;
      ParamByName('IZL_POST#').AsFloat     := 0;
      ParamByName('REZ#').AsInteger        := edRez.Tag;
      ParamByName('REZ_INST#').AsInteger   := lRez.Tag;
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
      ParamByName('PRIHOD_ID#').AsInteger  := StrToInt(edID.Text);
      ParamByName('NAKL#').AsString        := edPack.Text;
      ParamByName('TANK#').AsString        := edTTN.Text;
      ParamByName('TANK_TYPE#').AsString   := edTo_Place.Text;
      ParamByName('DOC_COUNT#').AsFloat    := 0;
      ParamByName('FACT_COUNT#').AsFloat   := 0;
      ParamByName('NED_NORM_UB#').AsFloat  := 0;
      ParamByName('NED_NORM_ER#').AsFloat  := 0;
      ParamByName('NED_POST#').AsFloat     := 0;
      ParamByName('NED_RAIL#').AsFloat     := 0;
      ParamByName('IZL_NORM#').AsFloat     := 0;
      ParamByName('IZL_POST#').AsFloat     := 0;
      ParamByName('REZ#').AsInteger        := edRez.Tag;
      ParamByName('REZ_INST#').AsInteger   := lRez.Tag;
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
      ParamByName('PRIHOD_ID#').AsInteger  := StrToInt(edID.Text);
      ParamByName('NAKL#').AsString        := IntToStr(edAuto.Tag)+'#'+IntToStr(lAuto.Tag);
      ParamByName('TANK#').AsString        := edDovSer.Text;
      ParamByName('TANK_TYPE#').AsString   := edWayList.Text;
      ParamByName('DOC_COUNT#').AsFloat    := 0;
      ParamByName('FACT_COUNT#').AsFloat   := 0;
      ParamByName('NED_NORM_UB#').AsFloat  := 0;
      ParamByName('NED_NORM_ER#').AsFloat  := 0;
      ParamByName('NED_POST#').AsFloat     := 0;
      ParamByName('NED_RAIL#').AsFloat     := 0;
      ParamByName('IZL_NORM#').AsFloat     := 0;
      ParamByName('IZL_POST#').AsFloat     := 0;
      ParamByName('REZ#').AsInteger        := edRez.Tag;
      ParamByName('REZ_INST#').AsInteger   := lRez.Tag;
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
      ParamByName('PRIHOD_ID#').AsInteger  := StrToInt(edID.Text);
      ParamByName('NAKL#').AsString        := edDovNum.Text;
      ParamByName('TANK#').AsString        := edDovDate.Text;
      ParamByName('TANK_TYPE#').AsString   := edDovGive.Text;
      ParamByName('DOC_COUNT#').AsFloat    := 0;
      ParamByName('FACT_COUNT#').AsFloat   := 0;
      ParamByName('NED_NORM_UB#').AsFloat  := 0;
      ParamByName('NED_NORM_ER#').AsFloat  := 0;
      ParamByName('NED_POST#').AsFloat     := 0;
      ParamByName('NED_RAIL#').AsFloat     := 0;
      ParamByName('IZL_NORM#').AsFloat     := 0;
      ParamByName('IZL_POST#').AsFloat     := 0;
      ParamByName('REZ#').AsInteger        := edRez.Tag;
      ParamByName('REZ_INST#').AsInteger   := lRez.Tag;
      ExecProc;
      Res:=ParamByName('Result').AsString;
      If Length(Res)>0 Then
        If Res[1]<>'0' Then
          Raise Exception.Create(SubStr(Res,2));
    End;
    CommitSQL;
    Close;
    ModalResult := mrOk;
  Except On E : Exception Do
    Begin
      RollbackSQL;
      ShowMessage(TranslateText('Ошибка: ') + E.Message);
    End;
  End;
end;

procedure TAZSRetForm.edPartButtonClick(Sender: TObject);
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
    Fas               := PartRefForm.qIsShtuki.AsString='Y';
    GetState;
  End;
  PartRefForm.Free;
end;

procedure TAZSRetForm.edRezChange(Sender: TObject);
begin
  If edRez.Text = '' Then
  Begin
    edRez.Tag := 0;
    lRez.Tag  := 0;
  End
  Else
  Begin
    qRez.FindFirst;
    edRez.Tag := qRezID.AsInteger;
    lRez.Tag  := qRezINST.AsInteger;
  End;
end;

procedure TAZSRetForm.qRezFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := (qRezNum.AsString = edRez.Text);
end;

procedure TAZSRetForm.edFromButtonClick(Sender: TObject);
var vId,vInst:integer;
    vName:string;
begin
    if ChooseOrg.CaptureOrg(2,Main_Id,Inst,'yyy',vId,vInst,vName) then
    begin
         edFrom.Text:=vName;
         edFrom.Tag:=vId;
         lFrom.tag:=vInst;
    end;
end;

procedure TAZSRetForm.edToButtonClick(Sender: TObject);
var vId,vInst:integer;
    vName:string;
begin
  if ChooseOrg.CaptureOrg(1,Main_id,Inst,'yyx',vId,vInst,vName) then begin
    qRez.Close;
    qRez.ParamByName('a').AsInteger := vId;
    qRez.Open;
    FillRezList(edRez.Items,vId);
    edTo.Text:=vName;
    edTo.Tag:=vId;
    lTo.tag:=vInst;
  end;
end;

procedure TAZSRetForm.edAutoButtonClick(Sender: TObject);
Var
  AutoRefForm : TAutoRefForm;
begin
  Application.CreateForm(TAutoRefForm, AutoRefForm);
  AutoRefForm.ShowModal;
  If AutoRefForm.ModalResult = mrOk Then
  Begin
    edAuto.Text := AutoRefForm.qNumb.AsString + '    ' + AutoRefForm.qFullName.AsString;
    edAuto.Tag  := AutoRefForm.qId.AsInteger;
    lAuto.tag   := AutoRefForm.qInst.AsInteger;
  End;
  AutoRefForm.Free;
end;

procedure TAZSRetForm.edLitrChange(Sender: TObject);
begin
  edCount_.Value := Round(edUd_Weig.Value * edLitr.Value*1000) / 1000000;
end;

procedure TAZSRetForm.edActDateChange(Sender: TObject);
begin
  if not Self.Visible
      and((Sender as TDateEdit).Date <= StrToDate(Close_Date)) then
    (Sender as TDateEdit).Enabled:=false;
  if edActDate.Date <= StrToDate(Close_Date) then
    bbOk.Enabled:=false
  else
    bbOk.Enabled:=true;
end;

procedure TAZSRetForm.edPartChange(Sender: TObject);
begin
  if not self.visible then
  begin
    qFas.Prepare;
    qFas.ParamByName('id').asInteger:=  edPart.Tag;
    qFas.ParamByName('inst').asInteger:= lPart.Tag;
    qFas.Open;
    Fas := Round(qFas.FieldByName('base_').asFloat*1000)/1000 <> 0;
    GetState;
    qFas.Close;
  end;
end;

end.
