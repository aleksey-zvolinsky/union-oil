unit PrihRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,
  ToolEdit, Mask, Menus, ComObj, Excel_TLB, Placemnt, ComCtrls,
  ImgList, ListSelect, ActiveX, CurrEdit, ActnList, 
  DBGridEh,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess, RXSplit, RXCtrls
  {$IFDEF VER150},Variants{$ENDIF}, GridsEh, DBGridEhGrouping;

type
  TPrihRefForm = class(TBaseForm)
    Label1: TLabel;
    edActDate_B: TDateEdit;
    Label2: TLabel;
    edPart: TComboEdit;
    lPart: TLabel;
    edDost: TComboEdit;
    Label7: TLabel;
    Label6: TLabel;
    edDateOtpr: TDateEdit;
    lRail: TLabel;
    edRail: TComboEdit;
    Label3: TLabel;
    edOper: TComboEdit;
    Label8: TLabel;
    sbClearD_B: TSpeedButton;
    Label9: TLabel;
    edActDate_E: TDateEdit;
    sbClearD_E: TSpeedButton;
    sbClearPart: TSpeedButton;
    sbClearOper: TSpeedButton;
    sbClearRail: TSpeedButton;
    sbClearDost: TSpeedButton;
    q2: TOilQuery;
    ds2: TOraDataSource;
    Label10: TLabel;
    edNP_Type: TComboEdit;
    sbClearNPType: TSpeedButton;
    Label11: TLabel;
    edDog: TEdit;
    qID: TFloatField;
    qINST: TFloatField;
    qEMP_ID: TFloatField;
    qDATE_DOC: TDateTimeField;
    qOPER_ID: TFloatField;
    qPART_ID: TFloatField;
    qDATE_OTPR: TDateTimeField;
    qDOST: TFloatField;
    qRAIL_ST: TFloatField;
    qOPER_NAME: TStringField;
    qDOST_NAME: TStringField;
    qRAIL_NAME: TStringField;
    qDOG: TStringField;
    qNP_TYPE: TFloatField;
    qNP_NAME: TStringField;
    SP: TOilStoredProc;
    qPART_INST: TFloatField;
    qRAIL_INST: TFloatField;
    qDOG_DATE: TDateTimeField;
    qOrg: TOilQuery;
    pUnErase: TPanel;
    bbUnErase: TBitBtn;
    qNP_GRP: TFloatField;
    qNP_GRP_NAME: TStringField;
    sbUnErase: TSpeedButton;
    qWEIG_DOC: TFloatField;
    qWEIG_FACT: TFloatField;
    qLinkedPrih: TOilQuery;
    sbClearID: TSpeedButton;
    sbClearDog: TSpeedButton;
    lFrom: TLabel;
    edFrom: TComboEdit;
    edTo: TComboEdit;
    lTo: TLabel;
    sbClearFrom: TSpeedButton;
    sbClearTo: TSpeedButton;
    qOWN_GOODS: TStringField;
    qFROM_: TFloatField;
    qFROM_INST: TFloatField;
    qFROM_NAME: TStringField;
    qTO_: TFloatField;
    qTO_INST: TFloatField;
    qTO_NAME: TStringField;
    SB: TStatusBar;
    Splitter1: TRxSplitter;
    pmAdd: TPopupMenu;
    RxSpeedButton1: TRxSpeedButton;
    miAddPrih: TMenuItem;
    miAzsRet: TMenuItem;
    gr: TDBGridEh;
    il: TImageList;
    sbClearDateOtpr: TSpeedButton;
    Bevel1: TBevel;
    qAuto: TOilQuery;
    qAutoID: TFloatField;
    qAutoINST: TFloatField;
    qAutoNUMB: TStringField;
    qAutoDRIVER: TStringField;
    qAutoATP: TStringField;
    qAutoCAPACITY: TFloatField;
    qAutoAUTO_TYPE: TStringField;
    qRASH: TFloatField;
    qRASH_INST: TFloatField;
    qKP_DOG: TStringField;
    qKP_COUNT: TFloatField;
    qKP_PRICE: TFloatField;
    qKP_INST: TFloatField;
    qKP_DATE: TDateTimeField;
    lKP_Dog: TLabel;
    edKP_Dog: TComboEdit;
    bClearKP_Dog: TSpeedButton;
    DelQuery: TOilQuery;
    DelQueryREZ: TFloatField;
    DelQueryREZ_INST: TFloatField;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    q2ID: TFloatField;
    q2INST: TFloatField;
    q2PRIHOD_ID: TFloatField;
    q2NAKL: TStringField;
    q2TANK: TStringField;
    q2TANK_TYPE: TStringField;
    q2DOC_COUNT: TFloatField;
    q2FACT_COUNT: TFloatField;
    q2NED_NORM_UB: TFloatField;
    q2NED_NORM_ER: TFloatField;
    q2NED_POST: TFloatField;
    q2NED_RAIL: TFloatField;
    q2IZL_NORM: TFloatField;
    q2IZL_POST: TFloatField;
    q2REZ: TFloatField;
    q2REZ_NAME: TStringField;
    q2REZ_NUM: TStringField;
    q2IS_DIGITAL_WEIGHT: TFloatField;
    q2TECH_LOSS: TFloatField;
    qPartPrice: TOilQuery;
    qOrgNAME: TStringField;
    qOrgBOSS: TStringField;
    miSop: TMenuItem;
    DBGrid2: TDBGridEh;
    q3: TOilQuery;
    ds3: TOraDataSource;
    DBGrid3: TDBGridEh;
    q3NP_TYPE: TStringField;
    q3DOG: TStringField;
    q3SS: TFloatField;
    qGROUP_NUM: TFloatField;
    q3SHTUKI: TFloatField;
    q3PRICE: TFloatField;
    q3SUM_SS: TFloatField;
    q3SUM_PRICE: TFloatField;
    qPOST_RN_NUM: TStringField;
    qPOST_NN_NUM: TStringField;
    miPerev: TMenuItem;
    qPRIHOD_TRANSFER_ID: TFloatField;
    q1: TOilQuery;
    ds1: TOraDataSource;
    q1TANK: TStringField;
    q1IS_DIGITAL_WEIGHT: TFloatField;
    q1NED_NORM_UB: TFloatField;
    q1NED_NORM_ER: TFloatField;
    q1NED_POST: TFloatField;
    q1NED_RAIL: TFloatField;
    q1IZL_NORM: TFloatField;
    q1IZL_POST: TFloatField;
    q1TECH_LOSS: TFloatField;
    qDATE_: TDateTimeField;
    qKP_ID: TFloatField;
    qTEMP_AVG: TFloatField;
    qNUMBER_DOC: TStringField;
    edAct: TEdit;
    qDATE_DOC_RAIL: TDateTimeField;
    miPrihImport: TMenuItem;
    miPrintAct: TMenuItem;
    miAktSpis: TMenuItem;
    N3: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure sbClearD_BClick(Sender: TObject);
    procedure sbClearD_EClick(Sender: TObject);
    procedure sbClearPartClick(Sender: TObject);
    procedure sbClearOperClick(Sender: TObject);
    procedure sbClearDostClick(Sender: TObject);
    procedure sbClearRailClick(Sender: TObject);
    procedure sbClearNPTypeClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure cbDetailClick(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure sbDelClick(Sender: TObject);
    procedure edOperButtonClick(Sender: TObject);
    procedure edPartButtonClick(Sender: TObject);
    procedure edNP_TypeButtonClick(Sender: TObject);
    procedure edDostButtonClick(Sender: TObject);
    procedure edRailButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miPrintAct1Click(Sender: TObject);
    procedure sbUnEraseClick(Sender: TObject);
    procedure bbUnEraseClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject); Override;
    procedure FormCreate(Sender: TObject);
    Function  LinkedPrih : Boolean;
    procedure sbClearIDClick(Sender: TObject);
    procedure sbClearDogClick(Sender: TObject);
    procedure sbClearFromClick(Sender: TObject);
    procedure sbClearToClick(Sender: TObject);
    procedure edToButtonClick(Sender: TObject);
    procedure edFromButtonClick(Sender: TObject);
    procedure miAddPrihClick(Sender: TObject);
    procedure miAzsRetClick(Sender: TObject);
    procedure sbClearDateOtprClick(Sender: TObject);
    procedure grDblClick(Sender: TObject);
    procedure grKeyPress(Sender: TObject; var Key: Char);
    procedure bClearKP_DogClick(Sender: TObject);
    procedure edKP_DogButtonClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject); 
    procedure miAktSpis1Click(Sender: TObject);
    procedure cbColClickCheck(Sender: TObject);
    procedure pRefreshClick(Sender: TObject);
    procedure sbColClick(Sender: TObject);
    procedure miSopClick(Sender: TObject);
    procedure miPerevClick(Sender: TObject);
    procedure grDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure edPartChange(Sender: TObject);
    procedure miPrihImportClick(Sender: TObject);
    procedure sbTotalClick(Sender: TObject);
    procedure cbShowDetailClick(Sender: TObject);
  private
    procedure AktSpisNP;
    procedure AktSpisGaz;
    function getCurImageIndex:integer;
    { Private declarations }
  public
    { Public declarations }
    OperList :string;
    typeList :string;
  end;
  TImageIndex = (iiUndefined,iiPrihod,iiAzsRetrive,iiOtpysk,iiZamena,iiKrest,iiSopTovar,iiPerevalka);
var
  PrihRefForm: TPrihRefForm;

implementation

Uses Main, OilStd, Prih, OperTypeRef, PartRef,NPTypeRef, ExFunc,
     uXMLForm, Progr, AZSRet, DogRef, ChooseOrg, PrihSop,UDbFunc,PrihTrans,EditBase,
     uPrihImport;

{$R *.DFM}
//==============================================================================
Function TPrihRefForm.LinkedPrih : Boolean;
Begin
  With qLinkedPrih Do
  Begin
    Close;
    Open;
    Result := qLinkedPrih.FieldByName('co').value > 0;
    If Result Then ShowMessage(TranslateText('Это соедененный с РАСХОДОМ ПРИХОД! Операция отменена!'))
  End;
End;
//==============================================================================
procedure TPrihRefForm.FormShow(Sender: TObject);
begin
  edActDate_B.Date := Date - 7;
  bbSearchClick(Nil);
end;
//==============================================================================
procedure TPrihRefForm.sbClearD_BClick(Sender: TObject);
begin
  edActDate_B.Clear;
end;
//==============================================================================
procedure TPrihRefForm.sbClearD_EClick(Sender: TObject);
begin
  edActDate_E.Clear;
end;
//==============================================================================
procedure TPrihRefForm.sbClearPartClick(Sender: TObject);
begin
  edPart.Clear;
end;
//==============================================================================
procedure TPrihRefForm.sbClearOperClick(Sender: TObject);
begin
  edOper.Clear;
end;
//==============================================================================
procedure TPrihRefForm.sbClearDostClick(Sender: TObject);
begin
  edDost.Clear;
end;
//==============================================================================
procedure TPrihRefForm.sbClearRailClick(Sender: TObject);
begin
  edRail.Clear;
end;
//==============================================================================
procedure TPrihRefForm.sbClearNPTypeClick(Sender: TObject);
begin
  edNP_Type.Clear;
end;
//==============================================================================
procedure TPrihRefForm.bbClearClick(Sender: TObject);
begin
  sbClearIDClick(Nil);
  sbClearD_BClick(Nil);
  sbClearD_EClick(Nil);
  sbClearPartClick(Nil);
  sbClearDogClick(Nil);
  sbClearNPTypeClick(Nil);
  sbClearOperClick(Nil);
  sbClearDostClick(Nil);
  sbClearDateOtprClick(Nil);
  sbClearRailClick(Nil);
  sbClearFromClick(Nil);
  sbClearToClick(Nil);
  bClearKP_DogClick(Nil);
  OperList:='';
  SpeedButton2.Down:=false;
  SpeedButton2.Hint:=TranslateText('Выбрать операции списком');
  TypeList:='';
  SpeedButton3.Down:=false;
  SpeedButton3.Hint:=TranslateText('Выбрать типы нефтепродуктов списком');
end;
//==============================================================================
procedure TPrihRefForm.bbSearchClick(Sender: TObject);
Var
  S : String;
  Sum_F, Sum_D : Extended;
begin
  Try
    With q Do
    Begin
      if Sender <> sbTotal then
      begin
        Close;
        SQL.Clear;
        If SbUnErase.Down Then S := 'V_OIL_PRIH_DEL'
                          Else S := 'V_OIL_PRIH';
        SQL.Add('Select * from ' + S +' WHERE 1=1');
        If edAct.text <> '' Then SQL.ADD('AND Upper(NUMBER_DOC) like ''%'+ANSIUpperCase(edAct.Text)+'%''');
        If edActDate_B.Text[1] <> ' ' Then SQL.Add('And Date_Doc >= To_Date('''+edActDate_B.Text+''',''DD.MM.YYYY'')');
        If edActDate_E.Text[1] <> ' ' Then SQL.Add('And Date_Doc <= To_Date('''+edActDate_E.Text+''',''DD.MM.YYYY'')');
        If edPart.Text <> '' Then SQL.ADD('AND Part_Id='+IntToStr(edPart.Tag));//+' And Part_Inst='+IntToStr(lPart.Tag));
        If lPart.Tag <> 0 Then SQL.ADD('AND Part_Inst='+IntToStr(lPart.Tag))
        Else if edPart.Tag<>0
                          Then SQL.ADD('AND Part_Inst=(Select min(Inst) From V_OIL_PART WHERE Id='+ IntToStr(edPart.Tag) +')');
        If edDog.Text <> '' Then SQL.Add('AND Upper(dog) like ''%'+ANSIUpperCase(edDog.Text)+'%''');
        If edNP_Type.Text <> '' Then SQL.Add('AND NP_Type='+IntToStr(edNP_Type.Tag));
        if SpeedButton3.down then SQL.Add('and np_type in '+TypeList);
        If edFrom.Text <> '' Then SQL.Add('AND From_='+IntToStr(edFrom.Tag)+' AND FROM_INST='+IntToStr(lFrom.Tag));
        If edTo.Text <> '' Then SQL.Add('AND To_='+IntToStr(edTo.Tag)+' AND To_INST='+IntToStr(lTo.Tag));
        If edOper.Text <> '' Then SQL.Add('AND Oper_Id='+IntToStr(edOper.Tag));
        if SpeedButton2.Down then
          SQL.Add('and oper_id in '+OperList);
        If edDost.Text <> '' Then SQL.Add('AND Dost='+IntToStr(edDost.Tag));
        If edRail.Text <> '' Then SQL.Add('AND Rail_St='+IntToStr(edRail.Tag));
        If edDateOtpr.Text[1] <> ' ' Then SQL.Add('And Date_Otpr = To_Date('''+edDateOtpr.Text+''',''DD.MM.YYYY'')');
        If edKP_Dog.Text <> '' Then SQL.ADD('And KP_ID='+IntToStr(edKP_Dog.Tag)+' And KP_Inst='+IntToStr(lKP_Dog.Tag));
        SQL.ADD('Order By Date_ desc,ID');
        DisableControls;
        Open;
      end;
      if sbTotal.Down then
      begin
        First;
        Sum_F := 0;
        Sum_D := 0;
        While Not EOF Do
        Begin
          Sum_F := Sum_F + qWeig_Fact.AsFloat;
          Sum_D := Sum_D + qWeig_Doc.AsFloat;
          Next;
        End;
        SB.Panels[0].Text := TranslateText('Документов: ') + IntToStr(RecordCount);
        SB.Panels[1].Text := TranslateText('Вес по док: ') + FloatToStrF(Sum_D,ffFixed,16,6);
        SB.Panels[2].Text := TranslateText('Вес факт : ')  + FloatToStrF(Sum_F,ffFixed,16,6);
      end
      else
      begin
        First;
        SB.Panels[0].Text := TranslateText('Документов: ') ;
        SB.Panels[1].Text := TranslateText('Вес по док: ') ;
        SB.Panels[2].Text := TranslateText('Вес факт : ')  ;
      end;
      EnableControls;
    End;
  Except On E:Exception Do
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
  End;
end;
//==============================================================================
procedure TPrihRefForm.cbDetailClick(Sender: TObject);
begin
  dsDataChange(Nil,Nil);
end;
//==============================================================================
procedure TPrihRefForm.dsDataChange(Sender: TObject; Field: TField);
begin
  Splitter1.Visible:=cbShowDetail.Checked;
  miPrintAct.Enabled:=getCurImageIndex=1;
  miAktSpis.Enabled:=getCurImageIndex=1;
  
  q2.Close;
  q3.Close;

  if cbShowDetail.Checked and q.Active and (q.RecordCount>0) then
  begin
    dbGrid2.Visible:=qGroup_Num.IsNull;
    dbGrid3.Visible:=not dbGrid2.Visible;

    if dbGrid2.Visible then
    begin
      //возврат с АЗС
      if qOper_Id.AsInteger <> OPG_AZSRET then
      begin
        q2.ParamByName('a').AsInteger := qId.AsInteger;
        q2.ParamByName('b').AsInteger := qInst.AsInteger;
        q2.Open;
      end;
    end
    else//сопутствующий товар
    begin
      q3.ParamByName('group_num').AsInteger:=qGroup_Num.AsInteger;
      q3.ParamByName('inst').AsInteger:=qInst.AsInteger;
      q3.ParamByName('startdate').Value:=qDate_.Value;
      q3.Open;
    end;
  end
  else
  begin
    dbGrid2.Visible:=FALSE;
    dbGrid3.Visible:=FALSE;
  end;
end;
//==============================================================================
procedure TPrihRefForm.sbDelClick(Sender: TObject);
  //****************************************************************************
  function NegativeRestAfterDelPrih(PartId, PartInst: integer): boolean;
  Begin
    Result := False;
    if MainForm.PartRest(PartId, PartInst)<0 then
    Begin
      Result := True;
      Exit;
    End;
    with DelQuery do
    Begin
      Open;
      Last;
      First;
      while not Eof do
      Begin
        if (MainForm.RezRest(DelQueryRez.asInteger, DelQueryRez_Inst.asInteger)<0) or
           (MainForm.PartRezRest(PartId, PartInst, DelQueryRez.asInteger, DelQueryRez_Inst.asInteger)<0) then
        Begin
          DelQuery.Close;
          Result := True;
          Exit;
        End;
        Next;
      End;
      DelQuery.Close;
    End;
  End;
  //****************************************************************************
  procedure DeletePrihSop;
  begin
    StartSql;
    _ExecSql(' update oil_prih_det set state = ''N'' where (prihod_id, inst) in '+
      ' (select id, inst from oil_prihod where group_num = '+ qGroup_Num.AsString +' and inst = '+ qInst.AsString +')');
    _ExecSql(' update oil_prihod set state = ''N'' where group_num = '+ qGroup_Num.AsString +' and inst = '+ qInst.AsString);
    CommitSql;
  end;
  //****************************************************************************
Var
  err: String;
  PartId, PartInst: integer;
  PrihForm: TPrihForm;
begin
  If q.Active Then
  Begin
    If q.IsEmpty Then Exit;
    if qInst.AsInteger <> Inst then
    Begin
      MessageDlg(TranslateText('Нельзя удалить запись, созданную другой организацией!'),
        mtError, [mbOk], 0);
      Exit;
    end;
    if qDate_.AsDateTime <= StrToDate(Close_Date) then
    Begin
      MessageDlg(TranslateText('Этот приход из закрытого периода и не может быть удален !'),
        mtError, [mbOk], 0);
      Exit;
    end
    else
      PrihForm := TPrihForm.Create(Application);
      try
        if ReadOilVar('PARTTEST') = 'Y' then
          if PrihForm.TestPartinEditingAndDeleting(
            qPart_id.asInteger, qPart_Inst.asInteger, qPart_id.asInteger, qPart_Inst.asInteger,
            qDate_.AsDateTime, 0, qId.AsInteger, true) = false then exit;
      finally
        PrihForm.Free;
      end;
      If Not LinkedPrih Then
      If MessageDlg(TranslateText('Вы уверены что хотите удалить запись?'),
        mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Try
        if qGroup_Num.AsInteger<>0 then begin
          if not TestSopPrihDelete(qGroup_Num.AsInteger,qInst.AsInteger,err) then
            raise exception.create(err);
          DeletePrihSop;
          bbSearch.Click;
          exit;
        end;
        With SP Do
        Begin
          StartSQL;
          PartId:=qPart_id.asInteger;
          PartInst:=qPart_Inst.asInteger;
          SetState('OIL_PRIHOD',qId.AsInteger,qInst.AsInteger,'N');
          with MainForm do
          begin
            if NegativeRestAfterDelPrih(PartId,PartInst) then
            begin
              RollbackSQL;
              MessageDlg(TranslateText('Эта операция приводит к отрицательным остаткам и не может быть выполнена!'),
                   mtError, [mbOk], 0);
            end
            else CommitSQL;
          end;
          q.Close;
          q.Open;
        End;
    Except On E:Exception Do
      begin
        RollbackSQL;
        MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
      end;
    End;
  End;
end;
//==============================================================================
procedure TPrihRefForm.edOperButtonClick(Sender: TObject);
Var
  OperTypeRefForm : TOperTypeRefForm;
begin
  Application.CreateForm(TOperTypeRefForm, OperTypeRefForm);
  OperTypeRefForm.SGrpId := OPG_PRIHOD;
  OperTypeRefForm.ShowModal;
  If OperTypeRefForm.ModalResult = mrOk Then
  Begin
    edOper.Text := OperTypeRefForm.qName.AsString;
    edOper.Tag  := OperTypeRefForm.qId.AsInteger;
  End;
  OperTypeRefForm.Free;
end;
//==============================================================================
procedure TPrihRefForm.edPartButtonClick(Sender: TObject);
Var
  PartRefForm: TPartRefForm;
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
//==============================================================================
procedure TPrihRefForm.edNP_TypeButtonClick(Sender: TObject);
Var
  NPTypeRefForm : TNPTypeRefForm;
begin
  Application.CreateForm(TNPTypeRefForm, NPTypeRefForm);
  NPTypeRefForm.ShowModal;
  If NPTypeRefForm.ModalResult = mrOk Then
  Begin
    edNP_Type.Text := NPTypeRefForm.qName.AsString;
    edNP_Type.Tag  := NPTypeRefForm.qId.AsInteger;
  End;
  NPTypeRefForm.Free;
end;
//==============================================================================
procedure TPrihRefForm.edDostButtonClick(Sender: TObject);
begin
  XMLChoose('DostavkaRef', edDost);
end;
//==============================================================================
procedure TPrihRefForm.edRailButtonClick(Sender: TObject);
var
  id,inst: integer;
begin
  if XMLChoose('railstatref',id,inst,edRail) then begin
    lRail.Tag:=id;
    edRail.Tag:=inst;
  end;
end;
//==============================================================================
procedure TPrihRefForm.sbEditClick(Sender: TObject);
Var
  PrihForm : TPrihForm;
  //qPart : TOilQuery;
  //strIsDigital : string;
begin
  If q.Active and (q.RecordCount>0) Then Begin
    if not qGroup_Num.IsNull then begin
      if EditPrihSop(qGroup_Num.AsInteger,qInst.AsInteger,qDate_.Value)=mrOk then
        bbSearch.Click;
    end else if not qPrihod_Transfer_Id.IsNull then begin
      if TPrihTransForm.Edit(qId.AsInteger,qInst.AsInteger) then
        bbSearch.Click;
    end else if qOper_Id.AsInteger = OPG_AZSRET Then Begin // Приход с АЗС
      Application.CreateForm(TAZSRetForm, AZSRetForm);
      AZSRetForm.edFrom.Clear;
      AZSRetForm.edOper.Clear;
      AZSRetForm.edPart.Clear;
      AZSRetForm.edDog.Clear;
      AZSRetForm.edDogDate.Clear;
      AZSRetForm.edTTN.Clear;
      AZSRetForm.edAuto.Clear;
      AZSRetForm.edWayList.Clear;
      AZSRetForm.edTo_Place.Clear;
      AZSRetForm.edDovNum.Clear;
      AZSRetForm.edDovDate.Clear;
      AZSRetForm.edDovSer.Clear;
      AZSRetForm.edDovGive.Clear;
      AZSRetForm.edNP_Type.Clear;
      AZSRetForm.edPack.Text := '';
      AZSRetForm.edTemper.Clear;
      AZSRetForm.edUD_Weig.Clear;
      AZSRetForm.edLitr.Clear;
      AZSRetForm.edCount_.Clear;
      AZSRetForm.edID.Tag         := qId.AsInteger;
      AZSRetForm.edID.Text        := IntToStr(qId.AsInteger);
      AZSRetForm.edActDate.Date   := qDate_.AsDateTime;
      AZSRetForm.OldDate          := qDate_.AsDateTime;
      AZSRetForm.SP.Tag           := qINST.AsInteger;
      If qPart_Id.AsInteger <> 0 Then
      Begin
        AZSRetForm.lPart.Tag      := qPart_Inst.AsInteger;
        AZSRetForm.edPart.Tag     := qPart_Id.AsInteger;
        AZSRetForm.edPart.Text    := qPart_Id.AsString;
      End
      Else
      Begin
        AZSRetForm.edPart.Tag      := 0;
        AZSRetForm.lPart.Tag       := 0;
        AZSRetForm.edPart.Text     := '';
      End;
      AZSRetForm.edFrom.Tag        := qFrom_.AsInteger;
      AZSRetForm.edFrom.Text       := qFrom_Name.AsString;
      AZSRetForm.lFrom.Tag         := qFROM_INST.AsInteger;
      AZSRetForm.edTo.Tag          := qTo_.AsInteger;
      AZSRetForm.edTo.Text         := qTo_Name.AsString;
      AZSRetForm.lTo.Tag           := qTo_INST.AsInteger;
      AZSRetForm.edDog.Text        := qDog.AsString;
      AZSRetForm.edDogDate.Text    := DateToStr(qDog_Date.AsDateTime);
      AZSRetForm.edNP_Type.Text    := qNP_Name.AsString;
      AZSRetForm.edNP_Type.Tag     := qNP_Type.AsInteger;
      AZSRetForm.edOper.Text       := qOper_Name.AsString;
      AZSRetForm.edOper.Tag        := qOper_Id.AsInteger;
      AZSRetForm.edTTNDate.Date    := qDate_Otpr.AsDateTime;
      q2.Close;
      q2.ParamByName('a').AsInteger := qId.AsInteger;
      q2.ParamByName('b').AsInteger := qInst.AsInteger;
      q2.Open;
      q2.First;
      If q2.RecordCount <> 4 Then
      Begin
        AZSRetForm.Free;
        ShowMessage(TranslateText('Ошибка в данных о возврате с АЗС!'));
      End
      Else
      Begin
        AZSRetForm.edTemper.Text   := q2Nakl.AsString;
        AZSRetForm.edLitr.Text     := q2Tank.AsString;
        AZSRetForm.edUd_Weig.Text  := q2Tank_Type.AsString;
        AZSRetForm.edCount_.Text   := q2Doc_Count.AsString;
        AZSRetForm.edRez.Text      := q2Rez_Num.AsString;
        AZSRetForm.edRez.Tag       := q2Rez.AsInteger;
        AZSRetForm.lRez.Tag        := qINST.AsInteger;
        q2.Next;
        AZSRetForm.edPack.Text     := q2Nakl.AsString;
        AZSRetForm.edTTN.Text      := q2Tank.AsString;
        AZSRetForm.edTo_Place.Text := q2Tank_Type.AsString;
        q2.Next;
        AZSRetForm.edAuto.Tag      := StrToInt(SubStr(q2Nakl.AsString, 1));
        AZSRetForm.lAuto.Tag       := StrToInt(SubStr(q2Nakl.AsString, 2));
        qAuto.Close;
        qAuto.ParamByName('a').AsInteger := AZSRetForm.edAuto.Tag;
        qAuto.ParamByName('b').AsInteger := AZSRetForm.lAuto.Tag;
        qAuto.Open;
        If qAuto.RecordCount > 0 Then
        Begin
          AZSRetForm.edAuto.Text := qAutoNumb.AsString + '    ' + qAutoDriver.AsString;
        End;
        AZSRetForm.edDovSer.Text   := q2Tank.AsString;
        AZSRetForm.edWayList.Text  := q2Tank_Type.AsString;
        q2.Next;
        AZSRetForm.edDovNum.Text   := q2Nakl.AsString;
        AZSRetForm.edDovDate.Text  := q2Tank.AsString;
        AZSRetForm.edDovGive.Text  := q2Tank_Type.AsString;
        AZSRetForm.bbOk.Enabled := AZSRetForm.bbOk.Enabled and (qInst.asInteger = INST);
        AZSRetForm.edActDate.Enabled := AZSRetForm.edActDate.Enabled and (qInst.asInteger = INST);
        AZSRetForm.edActDate.Enabled := qDate_.AsDateTime > StrToDate(CLOSE_DATE);
        AZSRetForm.ShowModal;
        If AZSRetForm.ModalResult = mrOk Then
        Begin
          edAct.Text := AZSRetForm.edID.Text;
          bbSearchClick(Nil);
        End;
        AZSRetForm.Free;
      End;
    End
    Else // Нормальный приход
    If not LinkedPrih then // И к тому же НЕ связаный с расходом
    begin
      Application.CreateForm(TPrihForm, PrihForm);
      try
        If PrihForm.Edit(q['id'],q['inst']) Then
        begin
          edAct.Text := PrihForm.edAct.Text;
          bbSearchClick(Nil);
        end;
      finally
        PrihForm.Free;
      end;
    end;
  End;
end;
//==============================================================================
procedure TPrihRefForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if not IsColConfCleared then
    SaveGridColumns( Gr, Name);
end;
//==============================================================================
procedure TPrihRefForm.miPrintAct1Click(Sender: TObject);
Var
  ProgressIncrement, I,j, p_IS_DIGITAL_WEIGHT: Integer;
  ProgrForm: TProgrForm;
  bDigitWeight, p_Tank, PrihError: Boolean;
  strNpName,s:string;
  //----------------------------------------------------------------------------
  function isGaz:boolean;
  begin
    //если не газ, то прячем колоночки в пределах тех потери
    strNpName:=GetSqlValueParSimple('select name from oil_np_type where id=:id',
      ['id',qNp_Type.AsInteger]);//берем только русское наименование
    result:=(Pos('ГАЗ', AnsiUpperCase(strNpName))>0);
  end;
  //----------------------------------------------------------------------------
Begin
  try
    if q.Active then
      if q.RecordCount > 0 then
      begin
        if qNp_Type.AsString ='' then
        begin
          ShowMessage(TranslateText('Печать выбранного документа для данного прихода не доступна'));
          exit;
        end;
        Application.CreateForm(TProgrForm, ProgrForm);
        ProgrForm.Show;
        ProgrForm.Refresh;
        q1.Close;
        q1.ParamByName('PRIHOD_ID').AsInteger := qId.AsInteger;
        q1.ParamByName('INST').AsInteger := qInst.AsInteger;
        q1.Open;
        if trunc(GetSqlValue('Select date_mod From OIL_PRIHOD Where ID = '+qId.AsString+' and INST = '+qInst.AsString)) < trunc(StrToDateTime('01.10.2006')) then
        begin
          MessageDlg(TranslateText('Данный приход необходимо перепринять!'), mtError, [mbOk], 0);
          ProgrForm.Free;
          exit;
        end;

        // шукаємо хоч одну цистерну
        PrihError := false;
        p_Tank := false;
        q1.First;
        while not q1.eof do
        Begin
          if p_Tank = false then
            p_Tank := q1Tank.AsString <> '';
          q1.Next;
        end;

        q1.First;
        p_IS_DIGITAL_WEIGHT := -1;
        while not q1.eof do
        begin
          if p_Tank then
            if q1Tank.AsString = '' then
              PrihError := true;

          if (q1IS_DIGITAL_WEIGHT.AsInteger <> p_IS_DIGITAL_WEIGHT) and (p_IS_DIGITAL_WEIGHT <> -1) then
            PrihError := true
          else p_IS_DIGITAL_WEIGHT := q1IS_DIGITAL_WEIGHT.AsInteger;
          q1.Next;
        end;

        if PrihError then
        begin
          MessageDlg(TranslateText('Данный приход необходимо перепринять!'), mtError, [mbOk], 0);
          ProgrForm.Free;
          exit;
        end;
        // Начинаем печать
        ProgrForm.AddProgress(5);
        ActivateXLApp('PrihDet', 'PrihDet', 1, XLApp, List);
        ProgrForm.AddProgress(5);
        ProgrForm.AddProgress(5);
        q1.Last; q1.First;
        ProgressIncrement:=Round((100-30)/(4+q1.RecordCount*15));
        List.Cells[1,'I']:=q.FieldByName('NUMBER_DOC').AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        List.Cells[1,'K']:=qDate_.AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        List.Cells[3,'B']:=LangText('po_rozshifrovke_nedostach')+' '+Format(qNP_NAME.AsString,['D',3])+' '+LangText('pri_priemke_zhd_tsistern');
        List.Cells[4,'C']:='на '+q.FieldByName('rail_name').AsString;
        ProgrForm.AddProgress(ProgressIncrement);
        qOrg.Close;
        qOrg.ParamByName('a').AsInteger := INST;
        qOrg.Open;
        List.Cells[5,'E'] := qOrgName.AsString;
        ProgrForm.AddProgress(5);
        ProgrForm.AddProgress(5);
        q1.First;
        bDigitWeight:= False;
        I:=1;
        // табличная часть
        while not q1.Eof do
        Begin
          List.Cells[10+I,2] := I;
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[10+I,3] := q1Tank.Value; //№ цистерны
          ProgrForm.AddProgress(ProgressIncrement);
          //Фактическая недостача
          List.Cells[10+I,4] := '=SUM('
            +ExcelNumberToColumn(5)+IntToStr(10+I)+':'
            +ExcelNumberToColumn(9)+IntToStr(I+10)+')'; //всего тонн
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[10+I,5] := q1NED_Norm_Ub.Value;//в пределах норм естественной убыли
          s:=BoolTo_(not isGaz,
            LangText('v_predelah_est_ybili'),
            LangText('poteri_pri_transportirovke'));
          List.Cells[9,5]:=s;                       
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[10+I,6]:=q1Tech_Loss.Value;   //при газе - Технологические потери
          List.Cells[10+I,7]:=q1Ned_Norm_Er.Value; // в пределах норм погрешности
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[10+I,8] := q1Ned_Post.Value;  // за счет поставщика
          List.Cells[10+I,9] := 0;// за счет ж/д
          ProgrForm.AddProgress(ProgressIncrement);
          //Излишки
          List.Cells[10+I,10]:='=SUM('
            +ExcelNumberToColumn(11)+IntToStr(10+I)+':'
            +ExcelNumberToColumn(12)+IntToStr(I+10)+')';//всего тонн
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[10+I,11]:=q1IZL_Norm.Value;//в пред. погр. измер.
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[10+I,12]:=q1IZL_Post.Value; //за счет поставщика
          ProgrForm.AddProgress(ProgressIncrement);
          //Фактическая недостача с учетом излишков
          List.Cells[10+I,13]:='='
            +ExcelNumberToColumn(10)+IntToStr(10+I)+'-'
            +ExcelNumberToColumn(4)+IntToStr(10+I);//Всего тонн
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[10+I,14]:='=-'+ExcelNumberToColumn(5)+IntToStr(10+I);//потери при транспортировке (ест. убыль)
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[10+I,15]:='=-'+ExcelNumberToColumn(6)+IntToStr(10+I); //при газе - Технологические потери
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[10+I,16]:='='
            +ExcelNumberToColumn(11)+IntToStr(10+I)+'-'
            +ExcelNumberToColumn(7)+IntToStr(10+I);// в пределах норм погрешности
          ProgrForm.AddProgress(ProgressIncrement);
          List.Cells[10+I,17] :='='
            +ExcelNumberToColumn(12)+IntToStr(10+I)+'-'
            +ExcelNumberToColumn(8)+IntToStr(10+I); // за счет поставщика
          List.Cells[10+i,18]:='=-'+ExcelNumberToColumn(9)+IntToStr(10+I); //за счет ж/д
          List.Range['B'+IntToStr(10+I)+':R'+IntToStr(10+I)].Borders.LineStyle:=1;
          List.Range['B'+IntToStr(10+I)+':R'+IntToStr(10+I)].Borders.Weight:=xlSingle;
          if (q1Is_Digital_Weight.AsString = '1') then
            bDigitWeight:= True;
          q1.Next;
          I:=I+1;
        End;
        //Цифровые весы
        if (bDigitWeight) then
          List.Cells[6,'B'] := LangText('Met_Opr_massu');
        I := q1.RecordCount + 1;
        List.Range['B'+IntToStr(11)+':R'+IntToStr(9+I)].Borders[xlEdgeTop].LineStyle:=1;
        List.Range['B'+IntToStr(11)+':R'+IntToStr(9+I)].Borders[xlEdgeTop].Weight:= xlMedium;
        List.Range['B'+IntToStr(11)+':R'+IntToStr(9+I)].Borders[xlEdgeLeft].LineStyle:=1;
        List.Range['B'+IntToStr(11)+':R'+IntToStr(9+I)].Borders[xlEdgeLeft].Weight:=xlMedium;
        List.Range['B'+IntToStr(11)+':R'+IntToStr(9+I)].Borders[xlEdgeRight].LineStyle:=1;
        List.Range['B'+IntToStr(11)+':R'+IntToStr(9+I)].Borders[xlEdgeRight].Weight:=xlMedium;
        List.Range['B'+IntToStr(11)+':R'+IntToStr(9+I)].Borders[xlEdgeBottom].LineStyle:=1;
        List.Range['B'+IntToStr(11)+':R'+IntToStr(9+I)].Borders[xlEdgeBottom].Weight:=xlMedium;
        //Выводим итоговые суммы
        List.Cells[10+i,3] := LangText('Itogo');
        List.Cells[10+i,4]:='=SUM(D11'+':D'+IntToStr(I+10-1);
        List.Cells[10+i,4].Copy;
        for j:=0 to 13 do
          List.Cells[10+i,5+j].PasteSpecial;
        List.Cells[1,6].EntireColumn.Hidden:=not isGaz;
        List.Cells[1,15].EntireColumn.Hidden:=not isGaz;        
        XLApp.Visible:=True;
        XLApp.ScreenUpdating := True;
        ProgrForm.Free;
      End;
  Except On E:Exception Do
    Begin
      MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
      ProgrForm.Free;
      MsExcel:=UnAssigned;
    End;
  End;
End;
//==============================================================================
procedure TPrihRefForm.sbUnEraseClick(Sender: TObject);
begin
  pUnErase.Visible := sbUnErase.Down;
  sbEdit.Enabled   := Not sbUnErase.Down;
  sbBasePrint.Enabled  := sbEdit.Enabled;
  bbOk.Enabled     := sbEdit.Enabled;
  bbSearchClick(Nil);
end;
//==============================================================================
procedure TPrihRefForm.bbUnEraseClick(Sender: TObject);
begin
  If q.Active Then
  If q.RecordCount>0 Then
  begin
    if qDate_.AsDateTime <= StrToDate(Close_Date) then
      Begin
        MessageDlg(TranslateText('Этот приход из закрытого периода и не может быть восстановлен!'),
          mtError, [mbOk], 0);
        Exit;
      end;
    If Not LinkedPrih Then
    If MessageDlg(TranslateText('Вы уверены что хотите ВОСТАНОВИТЬ ПРИХОД НЕФТЕПРОДУКТОВ ?'),
      mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    Begin
      Try
        With SP Do
        Begin
          SetState('OIL_PRIHOD',qId.AsInteger,qInst.AsInteger,'Y');
          bbSearchClick(Nil);
        End;
      Except On E:Exception Do
        Begin
          RollbackSQL;
          MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
        End;
      End;
    End;
  end;
end;
//==============================================================================
procedure TPrihRefForm.FormCreate(Sender: TObject);
begin
  IsBaseGrid := false;
  inherited;
  sbUnErase.Visible:=IsHaveRight(3);
  //махинации с колонками
  LoadGrigColumns( gr, Name );
  miPerev.Visible:=PVL_EXISTS;
  bbClearClick(Nil);  
end;
//==============================================================================
procedure TPrihRefForm.sbClearIDClick(Sender: TObject);
begin
  edAct.Clear;
end;
//==============================================================================
procedure TPrihRefForm.sbClearDogClick(Sender: TObject);
begin
  edDog.Clear;
end;
//==============================================================================
procedure TPrihRefForm.sbClearFromClick(Sender: TObject);
begin
  edFrom.Clear;
end;
//==============================================================================
procedure TPrihRefForm.sbClearToClick(Sender: TObject);
begin
  edTo.Clear;
end;
//==============================================================================
procedure TPrihRefForm.edToButtonClick(Sender: TObject);
var vId,vInst:integer;
    vName:string;
begin
    if ChooseOrg.CaptureOrg(1,Main_id,Inst,'yyy',vId,vInst,vName) then
    begin
         edTo.Text:=vName;
         edTo.Tag:=vId;
         lTo.tag:=vInst;
    end;
end;
//==============================================================================
procedure TPrihRefForm.edFromButtonClick(Sender: TObject);
var
  vId, vInst: integer;
  vName: string;
begin
  if ChooseOrg.CaptureOrg(1,0,0,'yyy',vId,vInst,vName) then
  begin
    edFrom.Text := vName;
    edFrom.Tag := vId;
    lFrom.tag := vInst;
  end;
end;
//==============================================================================
procedure TPrihRefForm.miAddPrihClick(Sender: TObject);
Var
  PrihForm: TPrihForm;
begin
  Application.CreateForm(TPrihForm, PrihForm);
  if PrihForm.Edit(0,MAIN_ORG.INST) then
  begin
    bbClearClick(Nil);
    edAct.Text := PrihForm.edAct.Text;
    bbSearchClick(Nil);
  end;
  PrihForm.Free;
end;
//==============================================================================
procedure TPrihRefForm.miAzsRetClick(Sender: TObject);
Var
  AZSRetForm : TAZSRetForm;
begin
  Application.CreateForm(TAZSRetForm, AZSRetForm);
  AZSRetForm.edID.Text := '';
  AZSRetForm.ShowModal;
  If AZSRetForm.ModalResult = mrOk Then
  Begin
    bbClearClick(Nil);
    edAct.Text := AZSRetForm.edID.Text;
    bbSearchClick(Nil);
  End;
  AZSRetForm.Free;
end;
//==============================================================================
procedure TPrihRefForm.sbClearDateOtprClick(Sender: TObject);
begin
  edDateOtpr.Clear;
end;
//==============================================================================
procedure TPrihRefForm.grDblClick(Sender: TObject);
begin
  If (bbOk.Visible)And(bbOk.Enabled) Then bbOkClick(Nil)
    Else If (PEdit.Visible)And(sbEdit.Enabled) Then sbEditClick(Nil);
end;
//==============================================================================
procedure TPrihRefForm.grKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then grDblClick(Nil);
end;
//==============================================================================
procedure TPrihRefForm.bClearKP_DogClick(Sender: TObject);
begin
  edKP_Dog.Clear;
end;
//==============================================================================
procedure TPrihRefForm.edKP_DogButtonClick(Sender: TObject);
Var
  DogRefForm : TDogRefForm;
begin
  Application.CreateForm(TDogRefForm, DogRefForm);
  DogRefForm.ShowModal;
  If DogRefForm.ModalResult = mrOk Then
  Begin
    edKP_Dog.Text   := DogRefForm.qDog.AsString;
    edKP_Dog.Tag    := DogRefForm.qId.AsInteger;
    lKP_Dog.Tag     := DogRefForm.qInst.AsInteger;
  End;
  DogRefForm.Free;
end;
//==============================================================================
procedure TPrihRefForm.SpeedButton2Click(Sender: TObject);
var
  LSF:TListSelectForm;
begin
  inherited;
  if SpeedButton2.Down then
  begin
    SpeedButton2.Hint:=TranslateText('Выбран список операций');
    Application.CreateForm(TListSelectForm,LSF);
    Lsf.TableName:='oil_oper_type';
    Lsf.HasInst:=false;
    if LSF.ShowModal = mrOk then
      OperList:=LSF.List
    else
    begin
      SpeedButton2.Down:=false;
      SpeedButton2.Hint:=TranslateText('Выбрать операции списком');
      OperList:='';
    end;
    LSF.Free;
  end
  else
  begin
    SpeedButton2.Hint:=TranslateText('Выбрать операции списком');
    OperList:='';
  end;
end;
//==============================================================================
procedure TPrihRefForm.SpeedButton3Click(Sender: TObject);
var
  LSF:TListSelectForm;
begin
  inherited;
  if SpeedButton3.Down then
  begin
    SpeedButton3.Hint:=TranslateText('Выбран список типов нефтепродуктов');
    Application.CreateForm(TListSelectForm,LSF);
    Lsf.TableName:='oil_np_type';
    Lsf.HasInst:=false;
    if LSF.ShowModal = mrOk then
      TypeList:=LSF.List
    else
    begin
      SpeedButton3.Down:=false;
      SpeedButton3.Hint:=TranslateText('Выбрать типы нефтепродуктов списком');
      TypeList:='';
    end;
    LSF.Free;
  end
  else
  begin
    SpeedButton3.Hint:=TranslateText('Выбрать типы нефтепродуктов списком');
    TypeList:='';
  end;
end;
//==============================================================================
//**********************************************
// Печать актов на списание НП
//**********************************************
procedure TPrihRefForm.AktSpisNP;
var
  FileName: string;
  TempNakl, TempTank: string;
  TempNedPost, TempNedNormUb, TempNedNormEr, TempPrice: real;
begin
  with q2 do
    begin
      if Active then Close;
      ParamByName('a').Value := q.FieldByName('Id').Value;
      ParamByName('b').Value := q.FieldByName('Inst').Value;
      Open;
    end;
    TempNakl := q2Nakl.AsString;
    TempTank := q2Tank.AsString;
    // недостачи - излишки
    TempNedPost:= StrToFloat(q2Ned_Post.AsString) - StrToFloat(q2Izl_Post.AsString) ;
    TempNedNormUb:= StrToFloat(q2Ned_Norm_Ub.AsString);
    // недостачи - излишки
    TempNedNormEr:= StrToFloat(q2Ned_Norm_Er.AsString)- StrToFloat(q2Izl_Norm.AsString);
    q2.next;
    while not q2.Eof do
    begin
      TempNakl:= TempNakl + ', '+ q2Nakl.AsString;
      TempTank:= TempTank + ', '+ q2Tank.AsString;
      TempNedPost:= TempNedPost + StrToFloat(q2Ned_Post.AsString)-StrToFloat(q2Izl_Post.AsString);
      TempNedNormUb:= TempNedNormUb + StrToFloat(q2Ned_Norm_Ub.AsString);
      TempNedNormEr:= TempNedNormEr + StrToFloat(q2Ned_Norm_Er.AsString)- StrToFloat(q2Izl_Norm.AsString);
      q2.Next;
    end;
  // Если недостачи естеств убыли - печать акта на списание
  if ((TempNedNormUb >= 0.0001)or(TempNedPost > 0.0)) then
  begin
    if OleConnect('Word.Application', MsWord) then
    begin
      FileName:= TranslateText('АктСписанияЕстУбыль');
      Application.CreateForm(TProgrForm, ProgrForm);
      ProgrForm.Show;
      ProgrForm.AddProgress(10);
      MsWordDocAdd(FileName);
      ProgrForm.AddProgress(10);
      Range := MsWord.Documents.Item(1).Range;
      SetCurField(True, qDog.AsString);
      ProgrForm.AddProgress(10);
      SetCurField(True, '№ '+ qId.AsString + LangText('Ot') +
      FormatDateTime2('dd.mm.yyyy', qDate_.AsDateTime));
      //////
      qOrg.Close;
      qOrg.ParamByName('a').AsInteger := INST;
      qOrg.Open;
      SetCurField(True, qOrgName.AsString);
      SetCurField(True, qOrgBoss.AsString);
      ///////////
      SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDate_.AsDateTime));
      SetCurField(True, qNp_Name.AsString);
      SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDate_.AsDateTime));
      SetCurField(True, qNp_Name.AsString);
      ProgrForm.AddProgress(10);
      // хранение в -
      SetCurField(True, qTo_Name.AsString);
      SetCurField(True, qFrom_Name.AsString);
      SetCurField(True, qDog.AsString);
      SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime));
      SetCurField(True, qDog.AsString);
      ProgrForm.AddProgress(10);
      // вагоноцистерны   №№
      SetCurField(True, TempTank);
      // накладные
      SetCurField(True, TempNakl);
      SetCurField(True, qNp_Name.AsString);
      // вся недостача
      SetCurField(True, FloatToStrF((TempNedPost + TempNedNormUb + TempNedNormEr),ffFixed,15,3));
      ProgrForm.AddProgress(10);
      // естествен убыль
      SetCurField(True, FloatToStrF(TempNedNormUb,ffFixed,15,3));
      SetCurField(True, FloatToStrF(TempNedNormUb,ffFixed,15,3));
      with qPartPrice do
      begin
        if Active then Close;
        ParamByName('part_id').asInteger := qPART_ID.AsInteger;
        ParamByName('part_inst').asInteger := qPART_INST.AsInteger;
        Open;
      end;
      ProgrForm.AddProgress(10);
      TempPrice:=  qPartPrice.FieldByName('SS').asFloat;
      // сумма
      SetCurField(True, FloatToStrF((TempPrice*TempNedNormUb),ffFixed,15,2) );
      SetCurField(True, NumStrGrn((TempPrice*TempNedNormUb), TranslateText('грн.'), TranslateText('коп.')));
      // Если недостачи поставщика > 1 литра - печатаем абзац
      if (TempNedPost > 0.0009) then
      SetCurField(True, ' '+LangText('Svndpnsneyvk')+' '
        + FloatToStrF(TempNedPost,ffFixed,15,3) + ' '+LangText('tonn_na_symmy')+' '
        + NumStrGrn(TempNedPost*qPartPrice.FieldByName('SS').Value , TranslateText('грн.'), TranslateText('коп.'))
        + '., '+LangText('predyavlena_pretenzia_postavschiky')+'.')
      else SetCurField(True, '');
      ProgrForm.AddProgress(10);
      MsWord.Visible:=True;
      MsWord:=UnAssigned;
      ProgrForm.Free;
    end; // if OleConnect
  end   // akt
  else ShowMessage(TranslateText(' Недостач для списания нет '));

  // Если погрешность на измерение есть - печать акта на погрешность
  if (TempNedNormEr > 0.0) then
  begin
    if OleConnect('Word.Application', MsWord) then
    begin
      FileName:= TranslateText('АктСписанияПогрИзмер');
      Application.CreateForm(TProgrForm, ProgrForm);
      ProgrForm.Show;
      ProgrForm.AddProgress(10);
      //MsWord.Documents.Add(GetMainDir + 'pattern\' + FileName + '.doc');
      MsWordDocAdd(FileName);
      Range := MsWord.Documents.Item(1).Range;
      SetCurField(True, qDog.AsString);
        ProgrForm.AddProgress(10);
        SetCurField(True, '№ '+ qId.AsString + LangText('Ot') +
        FormatDateTime2('dd.mm.yyyy', qDate_.AsDateTime));
        qOrg.Close;
        qOrg.ParamByName('a').AsInteger := INST;
        qOrg.Open;
        SetCurField(True, qOrgName.AsString);
        SetCurField(True, qOrgBoss.AsString);
        SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDate_.AsDateTime));
        SetCurField(True, qNp_Name.AsString);
        ProgrForm.AddProgress(10);
        SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDate_.AsDateTime));
        SetCurField(True, qNp_Name.AsString);
        // хранение в -
        SetCurField(True, qTo_Name.AsString);
        SetCurField(True, qFrom_Name.AsString);
        ProgrForm.AddProgress(10);
        SetCurField(True, qDog.AsString);
        SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime));
        SetCurField(True, qDog.AsString);
        ProgrForm.AddProgress(10);
        // вагоноцистерны   №№
        SetCurField(True, TempTank);
        // накладнык
        SetCurField(True, TempNakl);
        SetCurField(True, qNp_Name.AsString);
        ProgrForm.AddProgress(10);
        // в количестве
        SetCurField(True, FloatToStrF((TempNedPost+ TempNedNormUb + TempNedNormEr),ffFixed,15,3));
        // в пределах норм погрешности
        SetCurField(True, FloatToStrF(TempNedNormEr,ffFixed,15,3));
        ProgrForm.AddProgress(10);
        // в количестве по норме
        SetCurField(True, FloatToStrF(TempNedNormEr,ffFixed,15,3));
        ProgrForm.AddProgress(10);
        // сумма
        SetCurField(True, FloatToStrF((TempPrice*TempNedNormEr),ffFixed,15,2));
        SetCurField(True, NumStrGrn((TempPrice*TempNedNormEr), TranslateText('грн.'), TranslateText('коп.')));
        ProgrForm.AddProgress(10);
        MsWord.Visible:=True;
        MsWord:=UnAssigned;
        ProgrForm.Free;
    end;
  end;
end;
//==============================================================================
//***********************************************
// Печать Акта на списание сжиженного газа
//***********************************************
procedure TPrihRefForm.AktSpisGaz;
var FileName : string;
    TempNakl, TempTank: string;
    TempNedPost, TempPrice, TempNormIzl, TempTechLoss: real;
begin
   with q2 do
    begin
    if Active then Close;
    ParamByName('a').Value := q.FieldByName('Id').Value;
    ParamByName('b').Value := q.FieldByName('Inst').Value;
    Open;
  end;
    TempNakl := q2Nakl.AsString;
    TempTank := q2Tank.AsString;
    // недостачи - излишки поставшика
    TempNedPost:= StrToFloat(q2Ned_Post.AsString) - StrToFloat(q2Izl_Post.AsString) ;
    // if q2Tech_Loss.AsString = '' then TempTechLoss:=0  else
    TempTechLoss:= StrToFloat(q2Tech_Loss.AsString);
    TempNormIzl:= StrToFloat(q2Izl_Norm.AsString);
    q2.next;
    while not q2.Eof do
    begin
      TempNakl:= TempNakl + ', '+ q2Nakl.AsString;
      TempTank:= TempTank + ', '+ q2Tank.AsString;
      // недостачи и излишки
      TempNedPost:= TempNedPost + StrToFloat(q2Ned_Post.AsString)- StrToFloat(q2Izl_Post.AsString);
      TempTechLoss:= TempTechLoss + StrToFloat(q2Tech_Loss.AsString);
      TempNormIzl:= TempNormIzl + StrToFloat(q2Izl_Norm.AsString);
      q2.Next;
    end;
   // Если есть недостачи поставщика - печать акта на списание
  if (TempNedPost > 0.0001) then
  begin
    if OleConnect('Word.Application', MsWord) then
    begin
      FileName:= TranslateText('АктСписанияГазСж');
      Application.CreateForm(TProgrForm, ProgrForm);
      ProgrForm.Show;
      ProgrForm.AddProgress(10);
      //MsWord.Documents.Add(GetMainDir + 'pattern\' + FileName + '.doc');
      MsWordDocAdd(FileName);
      Range := MsWord.Documents.Item(1).Range;
      SetCurField(True, qDog.AsString);
      SetCurField(True, '№ '+ qId.AsString + ' '+LangText('Ot')+' ' +
      FormatDateTime2('dd.mm.yyyy', qDate_.AsDateTime));
      qOrg.Close;
      qOrg.ParamByName('a').AsInteger := INST;
      qOrg.Open;
      SetCurField(True, qOrgName.AsString);
      SetCurField(True, qOrgBoss.AsString);
      SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDate_.AsDateTime));
      SetCurField(True, qNp_Name.AsString);
      SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDate_.AsDateTime));
      SetCurField(True, qNp_Name.AsString);
      ProgrForm.AddProgress(10);
      // хранение в -
      SetCurField(True, qTo_Name.AsString);
      SetCurField(True, qFrom_Name.AsString);
      ProgrForm.AddProgress(10);
      SetCurField(True, qDog.AsString);
      SetCurField(True, FormatDateTime2('dd.mm.yyyy', qDog_Date.AsDateTime));
      SetCurField(True, qDog.AsString);
      ProgrForm.AddProgress(10);
      // вагоноцистерны   №№
      SetCurField(True, TempTank);
      // накладные
      SetCurField(True, TempNakl);
      SetCurField(True, qNp_Name.AsString);
      // вся недостача в количестве
      SetCurField(True, FloatToStrF((TempNedPost-TempTechLoss-TempNormIzl),ffFixed,15,3));
      ProgrForm.AddProgress(10);
      // технологические потери
      SetCurField(True, FloatToStrF(TempTechLoss,ffFixed,15,3));
      ProgrForm.AddProgress(10);

      with qPartPrice do
      begin
        if Active then Close;
        ParamByName('part_id').asInteger := qPART_ID.AsInteger;
        ParamByName('part_inst').asInteger := qPART_INST.AsInteger;
        Open;
      end;
      ProgrForm.AddProgress(10);
      TempPrice:= qPartPrice.FieldByName('SS').asFloat;
      // на сумму
      SetCurField(True, FloatToStrF((TempPrice*TempTechLoss),ffFixed,15,2));
      SetCurField(True, NumStrGrn((TempPrice*TempTechLoss), TranslateText('грн.'), TranslateText('коп.')));
      ProgrForm.AddProgress(10);
      // Если недостачи поставщика - допустимые недостачи > 1 литра - печатаем абзац
      if (TempNedPost > 0.0009) then
      SetCurField(True, ' '+LangText('Svndpnsntpvk')+' ' +
      FloatToStrF(TempNedPost,ffFixed,15,3) + ' '+LangText('tonn_na_symmy')+' '+
      NumStrGrn((TempNedPost*qPartPrice.FieldByName('SS').Value) , TranslateText('грн.'), TranslateText('коп.'))+
      '., '+LangText('predyavlena_pretenzia_postavschiky')+'.')
      else SetCurField(True, '');
      ProgrForm.AddProgress(10);
      MsWord.Visible:=True;
      MsWord:=UnAssigned;
      ProgrForm.Free;
    end; // if OleConnect
  end   // акт
  else ShowMessage(TranslateText(' Недостач для списания нет '));
end;
//==============================================================================
procedure TPrihRefForm.miAktSpis1Click(Sender: TObject);
begin
  if qNp_Type.AsString ='' then
  begin
    ShowMessage(TranslateText('Печать выбранного документа для данного прихода не доступна'));
    exit;
  end;
  if (qNp_Type.AsInteger<>177) then // 'Газ сжиженный СПБТ'
    AktSpisNP
  else
    AktSpisGaz;
end;
//==============================================================================
procedure TPrihRefForm.cbColClickCheck(Sender: TObject);
var
  i:integer;
begin
  Gr.Columns[0].Visible:=TRUE;
  cbCol.Checked[0]:=TRUE;
  for i:=1 to cbCol.Items.count-1 do
    Gr.Columns[i].Visible:=cbCol.Checked[i];
end;
//==============================================================================
procedure TPrihRefForm.pRefreshClick(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to cbCol.Items.count-1 do
  Begin
    Gr.Columns[i].Visible:=TRUE;
    cbCol.Checked[i]:=TRUE;
  end;
end;
//==============================================================================
procedure TPrihRefForm.sbColClick(Sender: TObject);
var
  i:integer;
begin
  if not sbCol.Down then
    PanelCol.Width := 0
  else
  Begin
    PanelCol.Width := 150;
    cbCol.Items.Clear;
    For i:=0 to Gr.Columns.Count-1 do
    Begin
      cbCol.Items.Add(Gr.Columns[i].Title.Caption);
      if Gr.Columns[i].Visible then cbCol.Checked[i]:=TRUE
      else cbCol.Checked[i]:=FALSE;
    end;
  End;
end;
//==============================================================================
procedure TPrihRefForm.miSopClick(Sender: TObject);
begin
  inherited;
  if AddPrihSop=mrOk then
    bbSearchClick(Nil);
end;
//==============================================================================
procedure TPrihRefForm.miPerevClick(Sender: TObject);
begin
  if TPrihTransForm.Edit(0,MAIN_ORG.INST) then
    bbSearch.Click;
end;
//==============================================================================
procedure TPrihRefForm.grDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if DataCol = 0 then
    if q.Active then
      if q.RecordCount > 0 then
        il.Draw(gr.Canvas, Rect.Left, Rect.Top, getCurImageIndex);
end;
//==============================================================================
function TPrihRefForm.getCurImageIndex:integer;
begin
  result:=0;
  if q.Active then if q.RecordCount > 0 then
  begin
    if qPrihod_Transfer_Id.AsInteger<>0 then
      result:=7  //перевалка
    else if qGroup_Num.AsInteger<>0 then
      result:=6  //сопутствующие
    else if qOper_Id.AsInteger = OPG_AZSRET then
      result:=2  //возврат с АЗС
    else
      result:=1; //простой приход
  end;
end;
//==============================================================================

procedure TPrihRefForm.edPartChange(Sender: TObject);
var
  i: byte;
begin
  inherited;
  lPart.Tag := 0;
  if edPart.Text <> '' then
    try
      edPart.Tag := StrToInt(edPart.Text);
    except
      //ShowMessage(TranslateText('Недопустимое значение!'));
      for i:=0 to length(edPart.Text) do
        if not(edPart.Text[i] in ['0'..'9']) then
          edPart.Text := Concat(Copy(edPart.Text, 0, i-1), Copy(edPart.Text, i+1, length(edPart.Text)));
    end;
end;

procedure TPrihRefForm.miPrihImportClick(Sender: TObject);
begin
  inherited;
  PrihImportForm := TPrihImportForm.Create(Application);
  try
    PrihImportForm.ShowModal;
  finally
    PrihImportForm.Free;
  end;
end;

procedure TPrihRefForm.sbTotalClick(Sender: TObject);
begin
  inherited;
  bbSearchClick(Sender);
end;

procedure TPrihRefForm.cbShowDetailClick(Sender: TObject);
begin
  dsDataChange(Nil,Nil);
end;

end.
