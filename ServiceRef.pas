{******************************************************************************}
{  Предназначение : просмотр произведенных услуг клиентов и печать             }
{                   налоговых накладных по услугам                             }
{                                                                              }
{  Модифицирован : 29 марта 2004 года                                          }
{******************************************************************************}

unit ServiceRef;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls,
  ToolEdit, Mask, RXCtrls, LogSaleDeadbeat,
  ComObj, ActiveX,
{$IFDEF VER120}
  OleCtrls,
{$ENDIF}
  Excel8TLB, RxLookup, DBGridEh, MemDS, DBAccess, Ora, ActnList,uOilQuery,uOilStoredProc
  {$IFDEF VER150},Variants{$ENDIF};

type
  TServiceRefForm = class(TBaseForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    DateEdit1: TDateEdit;
    ComboEdit1: TComboEdit;
    Label3: TLabel;
    Label12: TLabel;
    ComboEdit5: TComboEdit;
    Label5: TLabel;
    ComboEdit2: TComboEdit;
    ComboEdit4: TComboEdit;
    Label11: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    sp1: TOilStoredProc;
    qID: TFloatField;
    qINST: TFloatField;
    qS_NUM: TFloatField;
    qS_DATE: TDateTimeField;
    qORG_ID: TFloatField;
    qORG_INST: TFloatField;
    qORG_NAME: TStringField;
    qRASC_CHET: TStringField;
    qDOG_ID: TFloatField;
    qDOG_INST: TFloatField;
    qDOG: TStringField;
    qNP_ID: TFloatField;
    qNP_NAME: TStringField;
    qPART_ID: TFloatField;
    qPART_INST: TFloatField;
    qPART_NAME: TStringField;
    qDEP_ID: TFloatField;
    qDEP_INST: TFloatField;
    qDEP_NAME: TStringField;
    qOPER_ID: TFloatField;
    qOPER_NAME: TStringField;
    qBASE: TFloatField;
    qNDS: TFloatField;
    qTOTAL: TFloatField;
    qTEXT: TStringField;
    miPerinNN: TMenuItem;
    qNN_ID: TFloatField;
    qNN_INST: TFloatField;
    qNN_NUM: TStringField;
    q2: TOilQuery;
    qSERVICE_T: TFloatField;
    DateEdit2: TDateEdit;
    Label4: TLabel;
    N2: TMenuItem;
    SpeedButton6: TSpeedButton;
    ComboEdit3: TComboEdit;
    lTotal: TLabel;
    Label6: TLabel;
    Talon_Menu: TMenuItem;
    qParent: TOilQuery;
    qServiceDetail: TOilQuery;
    qFRASCH: TStringField;
    qNN_SUM: TFloatField;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    miDopConsent: TMenuItem;
    N6: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject); Override;
    procedure bbSearchClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboEdit2ButtonClick(Sender: TObject);
    procedure ComboEdit4ButtonClick(Sender: TObject);
    procedure ComboEdit1ButtonClick(Sender: TObject);
    procedure ComboEdit5ButtonClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure CreateNN(NN_ID,NN_INST:integer;num:string);
    procedure miPerinNNClick(Sender: TObject);  
    procedure N2Click(Sender: TObject);
    procedure ComboEdit3ButtonClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure sbSumClick(Sender: TObject);
    procedure Talon_MenuClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    FIXLSApp: Excel8TLB._Application;
    procedure CreateExcel (NewInstance: boolean);
    procedure ShowExcel;
    procedure HideExcel;
    procedure ReleaseExcel;
  public
    property IXLSApp: Excel8TLB._Application read FIXLSApp;
  end;

var
  SOrgID,SOrgInst,SDogID,SDogINST,SPartID,SPartINST,SDepID,SDepINST:integer;

implementation

uses Service,OilStd,PartRef,OperTypeRef,Main,DogRef,ViewDoc,Udbplan,ChooseOrg,
  UDbFunc, Progr, ExFunc, InvoicePrint, TaxBillPrint;

 {$R *.DFM}

//======================= START EXCEL OPERATIONS ===============================

procedure TServiceRefForm.CreateExcel(NewInstance: boolean);
var
  IU: IUnknown;
  isCreate: boolean;
begin
  if not Assigned(IXLSApp) then
    begin // а зачем его создавать, если уже есть?
      isCreate := NewInstance or (not SUCCEEDED(GetActiveObject(Excel8TLB.CLASS_Application_, nil, IU)));
      if isCreate then
        FIXLSApp := CreateComObject(Excel8TLB.CLASS_Application_) as Excel8TLB._Application
      else
        FIXLSApp := IU as Excel8TLB._Application;
    end;
end;

procedure TServiceRefForm.ShowExcel;
begin
  if Assigned(IXLSApp) then
    begin
      IXLSApp.Visible[0] := true;
      if IXLSApp.WindowState[0] = TOLEEnum(Excel8TLB.xlMinimized) then
        IXLSApp.WindowState[0] := TOLEEnum(Excel8TLB.xlNormal);
      IXLSApp.ScreenUpdating[0] := true;
    end;
end;

procedure TServiceRefForm.HideExcel;
begin
  if Assigned(IXLSApp) then
    begin
      IXLSApp.Visible[0] := false;
    end;
end;

procedure TServiceRefForm.ReleaseExcel;
begin
  if Assigned(IXLSApp) then
    begin
      // если есть книга и мы невидимы
      if (IXLSApp.Workbooks.Count > 0) and (not IXLSApp.Visible[0]) then
        begin
          IXLSApp.WindowState[0] := TOLEEnum(xlMinimized);
          IXLSApp.Visible[0] := true;
          if not(csDestroying in ComponentState) then
            Self.SetFocus; // а это объяснять необходимо?
          Application.BringToFront;
        end;
    end;
  FIXLSApp := nil;
end;

//======================== END EXCEL OPERATIONS ================================

procedure TServiceRefForm.FormCreate(Sender: TObject);
begin
 inherited;
 // Сбрасываем флажки
 SOrgID:=-1;
 SOrgInst:=-1;
 SDogID:=-1;
 SDogINST:=-1;
 SPartID:=-1;
 SPartINST:=-1;
 SDepID:=-1;
 SDepINST:=-1;

 SDepId := MAIN_ORG.ID; SDepInst:=MAIN_ORG.INST;
 ComboEdit5.Text := MAIN_ORG.NAME;

 // Ставим период в 7 дней
 DateEdit1.Date:= Date - 7;
 DateEdit2.Date:= Date;

 // Накладываем фильтры
 DBGrid1.Columns[0].Title.SortMarker := smDownEh;
 Self.bbSearchClick(Self);
end;

procedure TServiceRefForm.SpeedButton4Click(Sender: TObject);
begin
  comboedit2.text := '';
  SDogID := -1;
  SDogInst := -1;
end;

procedure TServiceRefForm.SpeedButton3Click(Sender: TObject);
begin
 comboedit4.text:='';
 SPartID:=-1;SPartInst:=-1;
end;

procedure TServiceRefForm.SpeedButton1Click(Sender: TObject);
begin
  ComboEdit1.text := '';
  SOrgID := -1;
  SOrgINST := -1;
end;

procedure TServiceRefForm.SpeedButton2Click(Sender: TObject);
begin
  ComboEdit5.text := '';
  SDepID := -1;
  SDepINST := -1;
end;

procedure TServiceRefForm.bbClearClick(Sender: TObject);
begin
  edit1.text := '';
  dateedit1.text := '';
  comboedit2.text := '';
  SDogID := -1;
  SDogInst := -1;
  comboedit4.text := '';
  SPartID := -1;
  SPartInst := -1;
  ComboEdit1.text := '';
  SOrgID := -1;
  SOrgINST := -1;
  ComboEdit5.text := '';
  SDepID := -1;
  SDepINST := -1;
end;

procedure TServiceRefForm.sbAddClick(Sender: TObject);
Var
  srv: TServiceForm;
begin
  Application.CreateForm(TServiceForm,SRV);
  SRV.Mode := 1;
  ClearSaleToDeadbeat(SRV.SaleToDeadbeat);
  SRV.ShowModal;
  // изменения внесены Лесенко А. 12.09.2000
  // фильтр по подразделению оказавшему внесенную улугу
  if (SRV.ModalResult = mrOK) then
    begin
      SDepID := SRV.OutDepID;
      SDepINST := SRV.OutDepInst;
      Comboedit5.Text := SRV.Comboedit5.Text;
    end; // if (SRV.ModalResult=mrOK) then
  SRV.free;
  bbSearchClick(Self);
end;

procedure TServiceRefForm.sbDelClick(Sender: TObject);
var
  res: string;
  TaxBill: TdmTaxBill;
begin
  if q.EOF then Exit;
  if (qS_Date.AsDateTime<=StrToDate(Close_Date)) then
    Raise Exception.Create(TranslateText('Период закрыт !'));
  if (qDEP_INST.AsInteger<>INST) then
    Raise Exception.Create(TranslateText('Нельзя удалить запись чужой организации !'));

  if MessageDlg(TranslateText('Вы уверены что хотите удалить запись об услуге ?'), mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
  try
    StartSQL;
    with sp1 do
      begin
        DeleteSaleFromLog(q.fieldbyname('id').asinteger, q.fieldbyname('inst').asinteger,
          REAL_INST, 'OIL_SERVICE');
        // Удаляем налоговую
        TaxBill := TdmTaxBill.Create;
        try
          TaxBill.DeleteSBRecords10(q.FieldByName('NN_Id').AsInteger,
            q.FieldByName('NN_Inst').AsInteger);
        finally
          TaxBill.Free;
        end;
        StoredProcName := 'OIL.INSORUPDOIL_SERVICE';
        Prepare;
        ParamByName('ID#').AsInteger  := q.fieldbyname('id').asinteger;
        ParamByName('INST#').AsInteger  := q.fieldbyname('inst').asinteger;
        ParamByName('STATE#').AsString  := 'N';
        ExecProc;
        Res := ParamByName('Result').AsString;
        if (Length(Res)>0) and (Res[1]<>'0') then
          Raise Exception.Create(SubStr(Res,2));
      end;
    CommitSQL;
  except on E:Exception do
    begin
      MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
      RollbackSQL;
    end;
  end;
  bbSearchClick(Self);
end;

procedure TServiceRefForm.sbEditClick(Sender: TObject);
const
  cfrm_Operation = 'SELECT frasch FROM oil_sale_book'+#13+
                   'WHERE state=''Y'' AND id=%d AND inst=%d';
  Dog_Data = 'SELECT exp_date FROM oil_dog'#13#10'WHERE id = %d AND inst = %d';
Var
  srv:TServiceForm;
begin
  if q.active and (q.recordcount>0) then
    begin
      Application.CreateForm(TServiceForm,SRV);
      SRV.S_ID := q.fieldbyname('ID').asinteger;
      SRV.S_INST := q.fieldbyname('INST').asinteger;
      // Обрабатываем данные по налоговой наклодной
      SRV.NN_ID := q.fieldbyname('NN_ID').asinteger;
      SRV.NN_INST := q.fieldbyname('NN_INST').asinteger;
      SRV.NN_NUM := q.fieldbyname('NN_NUM').asstring;

      // Обрабатываем данные по договору
      SRV.ceDog.text := q.fieldbyname('Dog').asstring;
      SRV.OutDogId := q.fieldbyname('Dog_Id').asinteger;
      SRV.OutDogInst := q.fieldbyname('Dog_Inst').asinteger;
      SRV.OpenDog := false;
      // Получаем дату выписки договора, если он есть
      if not q.fieldbyname('Dog_Id').IsNull then
        begin
          if (q2.Active) then q2.Close;
          try
            q2.SQL.Text := Format(Dog_Data, [q.fieldbyname('Dog_Id').asinteger, q.fieldbyname('Dog_Inst').asinteger]);
            q2.Open;
            SRV.DateEdit2.Date := q2.FieldByName('exp_date').AsDateTime;
          finally
            q2.Close;
            q2.SQL.Clear;
          end;
        end;

      with SRV do
        begin
          if (q2.Active) then q2.Close;
          q2.SQL.Text := Format(cfrm_Operation,[nn_id,nn_inst]);
          q2.Open;
          SRV.ceOperation.Text := q2.FieldByName('frasch').AsString;
        end;

      SRV.eServiceNum.text := q.fieldbyname('S_NUM').asstring;
      SRV.deDate.date := q.fieldbyname('S_Date').asdatetime;
      SRV.comboedit1.text := q.fieldbyname('Org_Name').asstring;
      SRV.OutOrgId := q.fieldbyname('Org_Id').asinteger;
      SRV.OutOrgInst := q.fieldbyname('Org_Inst').asinteger;

      ClearSaleToDeadbeat(SRV.SaleToDeadbeat);
      InitOldOrg(q.fieldbyname('Org_Id').asinteger, q.fieldbyname('Org_Inst').asinteger,
        q.fieldbyname('Org_Name').asstring, q.fieldbyname('Id').asinteger,
        q.fieldbyname('Inst').asinteger, 'OIL_SERVICE', SRV.SaleToDeadbeat);

      SRV.ComboEdit1Change(ComboEdit1);
      while (not SRV.qRekvizit.EOF) do
        if (q.FieldByName('rasc_chet').AsString = SRV.qRekvizit.FieldByName('rach_chet').AsString) then
          break
        else
          SRV.qRekvizit.Next;

      SRV.comboedit3.text := q.fieldbyname('Np_name').asstring;
      SRV.outnpgrp := q.fieldbyname('np_Id').asinteger;
      SRV.comboedit4.text := q.fieldbyname('Part_Name').asstring;
      SRV.OutPartId := q.fieldbyname('Part_Id').asinteger;
      SRV.OutPartInst := q.fieldbyname('Part_Inst').asinteger;
      SRV.comboedit5.text := q.fieldbyname('Dep_Name').asstring;
      SRV.OutDepId := q.fieldbyname('Dep_Id').asinteger;
      SRV.OutDepInst := q.fieldbyname('Dep_Inst').asinteger;
      SRV.ceOperation.text := q.fieldbyname('Oper_Name').asstring;
      SRV.OutOperId := q.fieldbyname('Oper_Id').asinteger;
      SRV.CEBase.value := q.fieldbyname('Base').asfloat;
      SRV.ceNDS.value := q.fieldbyname('NDS').asfloat;
      SRV.ceSumsNDS.value := q.fieldbyname('TOTAL').asfloat;
      SRV.Edit3.text := q.fieldbyname('TEXT').asstring;
      SRV.RadioGroup1.ItemIndex := q.fieldbyname('SERVICE_T').asinteger;
      SRV.Mode := 2;
      SRV.ShowModal;

      // изменения внесены Лесенко А. 12.09.2000
      // фильтр по подразделению оказавшему редактированную улугу
      SDepID := SRV.OutDepID;
      SDepINST := SRV.OutDepInst;
      Comboedit5.Text := SRV.Comboedit5.Text;
      SRV.free;
      bbSearchClick(Nil);
    end;
end;

procedure TServiceRefForm.bbSearchClick(Sender: TObject);
var
  s: string;
  curr_id, curr_inst: integer;
begin
  // Получаем текущую строку
  curr_id := qID.AsInteger;
  curr_inst := qINST.AsInteger;

  with q do
    begin
      if Active then Close;
      s :=' WHERE ';
      sql.text:= 'SELECT * FROM v_oil_service ';

      if edit1.text <> '' then
        begin
          sql.add(s + ' s_num=' + edit1.text);
          s:= ' and ';
        end;

      if dateedit1.date <> 0 then
        begin
          sql.add(s + ' s_date >= ' + 'TO_DATE(''' + FormatDateTime('dd"."mm"."yyyy', dateedit1.Date) +
            ''',''DD.MM.YYYY'')');
          s:= ' and ';
        end;

      if dateedit2.date <> 0 then
        begin
          sql.add(s+' s_date <= ' + 'TO_DATE(''' + FormatDateTime('dd"."mm"."yyyy', dateedit2.Date) +
            ''',''DD.MM.YYYY'')');
          s:= ' and ';
        end;

      if comboedit2.text <> '' then
        begin
          sql.add(s + ' dog_id=' + inttostr(SDogId) + ' and dog_inst=' + inttostr(SDogInst));
          s:= ' and ';
        end;

      if comboedit4.text <> '' then
        begin
          sql.add(s + ' part_id=' + inttostr(SPartId));
          s:= ' and ';
        end;

      if comboedit1.text <> '' then
        begin
          sql.add(s + ' org_id=' + inttostr(SOrgId) + ' and org_inst=' + inttostr(SOrgInst));
          s:= ' and ';
        end;

      if comboedit5.text <> '' then
        begin
          sql.add(s + ' dep_id=' + inttostr(SDepId) + ' and dep_inst=' + inttostr(SDepId));
          s:=' and ';
        end;

      if ComboEdit3.Text <> '' then
        begin
          sql.add(s + ' oper_id=' + IntToStr(ComboEdit3.Tag));
          s:= ' and ';
        end;
      q.open;     
      // Позиционируем курсор
      Locate('id;inst', VarArrayOf([curr_id, curr_inst]), []);
    end;
  if (sbTotal.Down) then sbTotalClick(sbTotal);
end;

procedure TServiceRefForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then key := #0;
end;

procedure TServiceRefForm.ComboEdit2ButtonClick(Sender: TObject);
Var
  Dog: TDogRefForm;
begin
  Application.CreateForm(TDogRefForm,Dog);
  Dog.rbService.Checked := true;
  Dog.gbDogType.Enabled := false;
  Dog.ShowModal;
  if Dog.ModalResult = mrOk then
    begin
      SdogId := dog.q.fieldbyname('id').value;
      SdogInst := dog.q.fieldbyname('inst').value;
      Comboedit2.Text := dog.q.fieldbyname('dog').value;
    end;
  dog.Free;
end;

procedure TServiceRefForm.ComboEdit4ButtonClick(Sender: TObject);
Var Part:TPartRefForm;
begin
 Application.CreateForm(TPartRefForm,Part);
 Part.ShowModal;
 if part.ModalResult=mrOk then begin
                           SPartId:=part.q.fieldbyname('id').value;
                           SPartInst:=part.q.fieldbyname('inst').value;
                           Comboedit4.Text:=part.q.fieldbyname('dog').value;
                              end;
 Part.Free;
end;

procedure TServiceRefForm.ComboEdit1ButtonClick(Sender: TObject);
var vName:string;
begin
     if ChooseOrg.CaptureOrg(4,0,0,'yyy',SOrgId,SOrgInst,vName) then
          Comboedit1.Text:=vName;
end;



procedure TServiceRefForm.ComboEdit5ButtonClick(Sender: TObject);
var vName:string;
begin
 if ChooseOrg.CaptureOrg(4,Main.Main_Id,Main.Inst,'yyy',SDepId,SDepInst,vName) then
  Comboedit5.Text:=vName;
end;


procedure TServiceRefForm.PopupMenu1Popup(Sender: TObject);
begin
  miPerinNN.Enabled := (not qNN_Num.IsNull) and (not qDog.IsNull);

end;

procedure TServiceRefForm.CreateNN(NN_ID,NN_INST:integer;num:string);
var res:string;
Begin
 try
   StartSQL;
   with sp1 do
   begin
    StoredProcName := 'OIL.INSORUPDOIL_SALE_BOOK';
    Prepare;
     ParamByName('ID#').AsInteger          := NN_Id;
     ParamByName('STATE#').AsString        := 'Y';
     ParamByName('INST#').AsInteger        := NN_Inst;
     ParamByName('NUM#').AsString          := NUM;
     ParamByName('S_DATE#').AsDate         := qs_date.asdatetime;
     ParamByName('ORGAN#').AsInteger       := qorg_id.asinteger;
     ParamByName('ORGAN_INST#').AsInteger  := qorg_inst.asinteger;
     ParamByName('FROM_#').AsInteger       := qdep_id.asinteger;
     ParamByName('FROM_INST#').AsInteger   := qdep_inst.asinteger;

     If qdog.asstring <> ''
     Then ParamByName('F_DOC#').AsString := TranslateText('Согласно договора ')+qdog.asstring
      Else ParamByName('F_DOC#').AsString := ' ';

     ParamByName('FRASCH#').AsString       := TranslateText('Оплата с Р/С');
     //qoper_name.asstring;

     ParamByName('R_DATE#').AsDate         := qs_date.asdatetime;

     ParamByName('Sale_TXT#').AsString     := qoper_name.asstring;
     ParamByName('NDS_T#').AsFloat         := qtotal.asfloat;
     ParamByName('NDS_P_BASE#').AsFloat    := qbase.asfloat;
     ParamByName('NDS_P_20#').AsFloat      := qnds.asfloat;
     ParamByName('NDS_NP_BASE#').AsFloat   := 0;
     ParamByName('NDS_NP_20#').AsFloat     := 0;
     ParamByName('VNDS_T#').AsFloat        := 0;
     ParamByName('VNDS_P_S#').AsFloat      := 0;
     ParamByName('VNDS_P_O#').AsFloat      := 0;
     ParamByName('VNDS_P_NB#').AsFloat     := 0;
     ParamByName('VNDS_NP_S#').AsFloat     := 0;
     ParamByName('VNDS_NP_O#').AsFloat     := 0;
     ParamByName('VNDS_NP_NB#').AsFloat    := 0;
     ParamByName('VNDS_NP_EXP#').AsFloat   := 0;
     ParamByName('K_VNDS_S#').AsFloat      := 0;
     ParamByName('K_VNDS_O#').AsFloat      := 0;
     ParamByName('K_NDS_B#').AsFloat       := 0;
     ParamByName('K_NDS_20#').AsFloat      := 0;

     ParamByName('TOV_ID#').clear;

     ParamByName('DIV_ID#').Clear;
     ParamByName('KOL#').AsFloat := 1;

     ParamByName('NAL_T#').AsInteger := 1;

     ExecProc;
    Res:=ParamByName('Result').AsString;
    If Length(Res)>0 Then
     If Res[1]<>'0' Then
      Raise Exception.Create(SubStr(Res,2));
   end;
   CommitSQL;
   MessageDlg(TranslateText('Сформирована налоговая накладная №')+num,mtInformation,[mbOk],0);
   except On E:Exception Do
   begin
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
    RollbackSQL;
   end;
  end;
End;

procedure TServiceRefForm.miPerinNNClick(Sender: TObject);
Var
  TaxBill: TdmTaxBill;

  function IsHaveDetal(id,inst:integer):boolean;
  var i:integer;
  begin
    i:=  GetSQLValue('Select count(*) from oil_sale_book_det where '+
           ' state= ''Y'' and nn_id='+IntToStr(id)+' and nn_inst='+IntToStr(Inst));
    result := 0 < i;
  end;
begin
  if IsHaveDetal(q.FieldByName('nn_id').AsInteger, q.FieldByName('nn_inst').AsInteger) = false then
    begin
      TaxBillPrint.GetTaxBillByDog(
        qNN_Num.AsString,
        qS_Date.AsString,
        qDog_Id.asInteger,
        qDog_Inst.asInteger,
        qFrasch.AsString
      );
    end
  else
    begin
      TaxBill := TdmTaxBill.Create;
      try
        TaxBill.Options.Scheme := TScheme(3);
        TaxBill.Options.TovarType := ttOper;
        TaxBill.Options.IsCustomPrintSettings := true;
        TaxBill.GetTaxBillByNN(
          q.FieldByName('nn_id').AsInteger,
          q.FieldByName('nn_inst').AsInteger
        );
      Finally
        TaxBill.Free;
      End;
    end;
end;

procedure TServiceRefForm.N2Click(Sender: TObject);
const
  RowOffSet = 8; // Строка, с которой начинаются собственно данные
var
  IWorkbook, ISheet: Variant;
  Counter: integer;
begin
  try
    CreateExcel(false);
    // Создаем форму для отображения процесса создания отчета
    ProgrForm:= TProgrForm.Create(Self);
    with ProgrForm do
    begin
      Progress:= 0;
      MaxValue:= q.RecordCount + 10;
      Show;
      Self.Repaint;
      Repaint;
    end;
    try
      if Assigned(IXLSApp) then
      begin
        ActivateXLApp('ReestrService', 'ReestrService', 1, IWorkbook, ISheet);
        try
          ISheet:= IWorkbook;
          // Организация, где вводим
          ISheet.Cells.Item[1,1]:= GetOrgName(Main.Main_Id,Main.Inst)+'; '+DateToStr(Date)+'; '+TimeToStr(Time);
          // Организация, предоставляющая услуги
          if ComboEdit5.Text = '' then
            ISheet.Cells.Item[4, 4]:= MAIN_ORG.NAME
          else
            ISheet.Cells.Item[4, 4]:= ComboEdit5.Text;
          // Период
          ISheet.Cells.Item[5, 4]:= LangText('Period_S') + DateEdit1.Text + TranslateText(' по ') +  DateEdit2.Text;;
          ProgrForm.AddProgress(10);
          // "Замораживаем" грид
          q.DisableControls;
          try
            q.First;
            Counter:= RowOffSet;
            // Вываливаем отчет
            while not q.EOF do
            begin
              ISheet.Cells.Item[Counter, 1]:= Counter - RowOffSet + 1;
              ISheet.Cells.Item[Counter, 2]:= qS_NUM.Value;
              ISheet.Cells.Item[Counter, 3]:= FormatDateTime('dd"."mm"."yyyy', qS_DATE.AsDateTime);
              ISheet.Cells.Item[Counter, 4]:= qORG_NAME.Value;
              ISheet.Cells.Item[Counter, 5]:= qTOTAL.Value;
              ISheet.Cells.Item[Counter, 6]:= qOPER_NAME.Value;
              inc(Counter);
              q.Next;
              ProgrForm.AddProgress(1);
            end;
            // Формируем подвал
            if Counter = RowOffSet then
              inc(Counter);
            ISheet.Cells.Item[Counter, 4].Font.Bold:= true;
            ISheet.Cells.Item[Counter, 4]:= LangText('Itogo');
            // Что бы работало выражение SubTotal для шаблона надо поставить галочку в
            // "Сервис->Параметры->Переход->Преобразование формул в формат Excel при вводе"
            ISheet.Cells.Item[Counter, 5] :=  '=SUBTOTAL(9;'+ 'E'+IntToStr(RowOffSet)+':'+'E'+IntToStr(Counter-1)+')';
            ISheet.Range['A' + IntToStr(RowOffSet), 'F' + IntToStr(Counter)].Borders.LineStyle := 1;
            ISheet.Cells.Item[Counter + 3, 2]:= TranslateText('Начальник ')+LangText('OU');
          finally
            q.EnableControls;
            q.First;
          end;
          ProgrForm.Close;
          Self.Repaint;
          ShowExcel;
        finally
          ReleaseExcel;
        end;
      end;
    finally
      ProgrForm.Free;
    end;
  except on E:Exception do
    begin
      HideExcel;
      MessageDlg(TranslateText('Ошибка: ') + E.message, mtError, [mbOk], 0);
      ReleaseExcel;
    end;
  end;
end;

procedure TServiceRefForm.ComboEdit3ButtonClick(Sender: TObject);
var OperTypeRefForm : TOperTypeRefForm;
begin
 Application.CreateForm(TOperTypeRefForm, OperTypeRefForm);

 try
  with OperTypeRefForm do
   begin
    SGrpId:= 12;

    ShowModal;
    if ModalResult = mrOk then
     begin
      ComboEdit3.Text:= qName.AsString;
      ComboEdit3.Tag:= qId.AsInteger;
     end;
   end;
 finally
  OperTypeRefForm.Free;
 end;
end;

procedure TServiceRefForm.SpeedButton6Click(Sender: TObject);
begin
 with ComboEdit3 do
  begin
   Text:= '';
   Tag:= -1;
  end;
end;

procedure TServiceRefForm.sbSumClick(Sender: TObject);
begin

end;
//===========================Талон замовника====================================
procedure TServiceRefForm.Talon_MenuClick(Sender: TObject);
var
  List, IWorkbook: Variant;
begin
  if not q.eof then
  begin
    try
      // Создание экземпляра Excel
      MainForm.CreateExcel(false);
      if Assigned(MainForm.IXLSApp) then
      begin
        try
          ActivateXLApp('Talon_Zamovnuka', 'Talon_Zamovnuka', 1, IWorkbook, List);
          // номер договора-заказа
          List.Cells[3, 'H'] := q.FieldByName('dog').AsString;
          List.Cells[7, 'E'] := q.FieldByName('S_date').AsString;
          // Вставка реквизитов
          List.Cells[9,'C'] :=  q.fieldbyname('Dep_name').asString;
          List.Cells[15,'C'] := q.fieldbyname('org_name').AsString;
          MainForm.ShowExcel;
        finally
          List := unassigned;
          MainForm.ReleaseExcel;
        end;
      end;
    except on E:Exception do
      begin
        MainForm.HideExcel;
        MessageDlg('ОШИБКА : '+E.message,mtError,[mbOk],0);
        MainForm.ReleaseExcel;
      end;
    end;
  end;
end;
//==============================================================================
procedure TServiceRefForm.N1Click(Sender: TObject);
var
  DogRef: TDogRefForm;
begin
  if q.IsEmpty then Abort;
  DogRef := TDogRefForm.Create(Application);
  case (Sender as TMenuItem).Tag of
    1: DogRef.DogRep('DogService', dtS, q.FieldByName('DOG_Id').Value, q.FieldByName('DOG_Inst').Value);
    2: DogRef.DogRep('AktService', dtS, q.FieldByName('DOG_Id').Value, q.FieldByName('DOG_Inst').Value);
    3: DogRef.DogRep('DogServiceAdd', dtS, q.FieldByName('DOG_Id').Value, q.FieldByName('DOG_Inst').Value, true);
  end;
  DogRef.Free;
end;
//==============================================================================

end.
