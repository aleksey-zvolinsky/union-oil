{******************************************************************************}
{  �������������� : ��������������/��������/�������� �������� �������          }
{                   ������ ��, � ����� �������������.                          }
{******************************************************************************}
unit SlBook;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, ExtCtrls, StdCtrls, ToolEdit, Mask, Db, DBTables,
  MemTable, Buttons, Ora, MemDS, DBAccess, DBCtrls, DBCtrlsEh, DBLookupEh,
  DBGrids, RxLookup, uHelpButton, Menus, uCommonForm,uOilQuery,uOilStoredProc
  {$IFDEF VER150},Variants{$ENDIF}, EditBase, GridsEh;

type
  (** ������ ����������� ��� ������ *)
  ETestError = class(Exception);
    ETestNNError = class(ETestError);
    ETestCorrError = class(ETestError);  

  TSlBookForm = class(TEditBaseForm)
    pTop: TPanel;
    pGrid: TPanel;
    pStoroni: TPanel;
    lTo: TLabel;
    lFrom: TLabel;
    ceTo: TComboEdit;
    ceFrom: TComboEdit;
    pTax: TPanel;
    lTypeTax: TLabel;
    deTaxDate: TDateEdit;
    lRasch: TLabel;
    lDate: TLabel;
    cbFormRasch: TComboBox;
    lcTaxNum: TLabel;
    lblCause: TLabel;
    lFirstDoc: TLabel;
    eDoc: TEdit;
    ds: TOraDataSource;
    qDetSale: TOilQuery;
    qType: TOilQuery;
    qCause: TOilQuery;
    dsCause: TOraDataSource;
    dsType: TOraDataSource;
    ceAZS: TComboEdit;
    lFromAZS: TLabel;
    sbClearFrom: TSpeedButton;
    sbClearTo: TSpeedButton;
    sbClearFromAzs: TSpeedButton;
    qReserv: TOilQuery;
    dsReserv: TOraDataSource;
    dblcTaxNum: TRxDBLookupCombo;
    eTaxNum: TEdit;
    qCheck: TOilQuery;
    lcCause: TDBLookupComboboxEh;
    lcType: TDBLookupComboboxEh;
    nbNum: TNotebook;
    sbAutoNumTax: TSpeedButton;
    sbChangeNum: TSpeedButton;
    sbApplyNum: TSpeedButton;
    qNNNumDate: TOilQuery;
    dsNNNumDate: TOraDataSource;
    LblNNNumDate: TLabel;
    lcNNNumDate: TDBLookupComboboxEh;
    nbGrids: TNotebook;
    dbgSaleDet: TDBGridEh;
    dbgSaleDetCorr: TDBGridEh;
    qDetSaleCorr: TOilQuery;
    dsCorr: TOraDataSource;
    qDetSaleCorrSUMM: TFloatField;
    qDetSaleCorrNDS_BASE: TFloatField;
    qDetSaleCorrNDS_20: TFloatField;
    qDetSaleCorrCOUNT_: TFloatField;
    qDetSaleCorrPRICE: TFloatField;
    qDetSaleCorrPRICE_NO_NDS: TFloatField;
    qDetSaleCorrNP_NAME_JOIN: TStringField;
    qDetSaleCorrSUM_CORR: TFloatField;
    qDetSaleCorrNDS_BASE_CORR: TFloatField;
    qDetSaleCorrNDS_20_CORR: TFloatField;
    qDetSaleCorrCOUNT_CORR: TFloatField;
    qDetSaleCorrPRICE_CORR: TFloatField;
    qDetSaleCorrPRICE_NO_NDS_CORR: TFloatField;
    qDetSaleCorrNP_NAME_CORR: TStringField;
    qDetSaleCorrNP_TYPE_CORR: TFloatField;
    qDetSaleCorrDIM_ID_CORR: TFloatField;
    qDetSaleCorrDIM_NAME: TStringField;
    qDetSaleCorrNP_NAME: TStringField;
    qDetSaleCorrSUM_CORR_GRID: TFloatField;
    qDetSaleCorrNDS_BASE_CORR_GRID: TFloatField;
    qDetSaleCorrNDS_20_CORR_GRID: TFloatField;
    qDetSaleCorrCOUNT_CORR_GRID: TFloatField;
    qDetSaleCorrPRICE_CORR_GRID: TFloatField;
    qDetSaleCorrPRICE_NO_NDS_CORR_GRID: TFloatField;
    qID: TFloatField;
    qINST: TFloatField;
    qS_DATE: TDateTimeField;
    qORGAN: TFloatField;
    qORGAN_INST: TFloatField;
    qORGAN_NAME: TStringField;
    qORGAN_NALN: TStringField;
    qORGAN_OKPO: TStringField;
    qF_DOC: TStringField;
    qFRASCH: TStringField;
    qR_DATE: TDateTimeField;
    qSALE_TXT: TStringField;
    qNDS_T: TFloatField;
    qNDS_P_BASE: TFloatField;
    qNDS_P_20: TFloatField;
    qNDS_NP_BASE: TFloatField;
    qNDS_NP_20: TFloatField;
    qK_NDS_B: TFloatField;
    qK_NDS_20: TFloatField;
    qNUM: TStringField;
    qTOV_ID: TFloatField;
    qTOV_NAME: TStringField;
    qDIM_ID: TFloatField;
    qDIM_NAME: TStringField;
    qKOL: TFloatField;
    qFROM_: TFloatField;
    qFROM_INST: TFloatField;
    qAZS_ID: TFloatField;
    qAZS_INST: TFloatField;
    qNAL_T: TFloatField;
    qLOCK_: TFloatField;
    qFROM_DATE: TDateTimeField;
    qNN_TYPE_ID: TFloatField;
    qNN_TYPE_NAME: TStringField;
    qNN_CAUSE_ID: TFloatField;
    qNN_CAUSE_NAME: TStringField;
    qFROM_NAME: TStringField;
    qAZS_NAME: TStringField;
    qFROM_AZS_NAME: TStringField;
    qNN_CAUSE_ID2: TFloatField;
    qNN_ID: TFloatField;
    pmSale: TPopupMenu;
    miClearPos: TMenuItem;
    qWork: TOilQuery;
    qDetSaleID: TFloatField;
    qDetSaleINST: TFloatField;
    qDetSaleNN_ID: TFloatField;
    qDetSaleNN_INST: TFloatField;
    qDetSaleSUM: TFloatField;
    qDetSaleNDS_BASE: TFloatField;
    qDetSaleNDS_20: TFloatField;
    qDetSaleNP_TYPE: TStringField;
    qDetSaleDIM_ID: TStringField;
    qDetSaleCOUNT: TFloatField;
    qDetSalePRICE: TFloatField;
    qDetSalePRICE_NO_NDS: TFloatField;
    qDetSaleDET_TEXT: TStringField;
    qDetSaleDET_DATE: TDateTimeField;
    qDetSaleDIM_NAME: TStringField;
    qDetSaleNP_NAME: TStringField;
    qNal: TOilQuery;
    pDown: TPanel;
    lAutoTax: TLabel;
    pDel: TPanel;
    sbDel: TSpeedButton;
    Panel1: TPanel;
    OilHelpButton: TOilHelpButton;
    procedure FormShow(Sender: TObject);
    procedure dbgSaleDetEditButtonClick(Sender: TObject);
    procedure ceToButtonClick(Sender: TObject);
    procedure ceFromButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qDetSalePRICEChange(Sender: TField);
    procedure qDetSaleBeforeInsert(DataSet: TDataSet);
    procedure qDetSaleAfterInsert(DataSet: TDataSet);
    procedure qDetSaleDET_DATEChange(Sender: TField);
    procedure sbDelClick(Sender: TObject);
    procedure dbgSaleDetColumns8UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure ceAZSButtonClick(Sender: TObject);
    procedure deTaxDateChange(Sender: TObject);
    procedure sbClearFromClick(Sender: TObject);
    procedure sbClearToClick(Sender: TObject);
    procedure sbClearFromAzsClick(Sender: TObject);
    procedure qDetSaleSUMChange(Sender: TField);
    procedure DBComboBox1Click(Sender: TObject);
    procedure dblcTaxNumChange(Sender: TObject);
    procedure sbAutoNumTaxClick(Sender: TObject);
    procedure qDetSaleBeforePost(DataSet: TDataSet);
    procedure qDetSaleAfterPost(DataSet: TDataSet);
    procedure qDetSalePRICE_NO_NDSChange(Sender: TField);
    procedure eTaxNumExit(Sender: TObject);
    procedure dbgSaleDetColumns9UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure qDetSaleCOUNTChange(Sender: TField);
    procedure lcCauseChange(Sender: TObject);
    procedure sbChangeNumClick(Sender: TObject);
    procedure sbApplyNumClick(Sender: TObject);
    procedure qReservAfterOpen(DataSet: TDataSet);
    procedure lcTypeChange(Sender: TObject);
    procedure lcNNNumDateChange(Sender: TObject);
    procedure qDetSaleCorrPRICE_NO_NDS_CORRChange(Sender: TField);
    procedure qDetSaleCorrPRICE_CORRChange(Sender: TField);
    procedure qDetSaleCorrCOUNT_CORRChange(Sender: TField);
    procedure miClearPosClick(Sender: TObject);
    procedure Save(); override;
    procedure Test(); override;
    procedure Init(); override;
  private
    Nal_t: integer;
    Procedure SetEditDataSet(p_Grid:TObject);
    Function CheckDate(Text:String): string;
    Procedure SetSum;
    Procedure SetSumCorr;
    procedure SetCauseEnable;
    procedure work_log(s: string; n: integer=0);
    // Test
    procedure TestNN();
    procedure TestCorr();
    // Save
    procedure SaveNN();
    procedure SaveCorr();
    function IsCheckCause: boolean;
  public
    NN_ID_FOR_CORR, NN_INST_FOR_CORR: integer;
    NN_NUM_FOR_CORR, num, eTaxNum_Tag: string;
    property nn_id: integer read ID write ID;
    property nn_inst: integer read INST write INST;
  end;
const
  eNotEnoughFreeMoney ='�� ��� ���� ��� ��������� ���������� �� ���� ������ ���� �� ��� � ������� ������.'+#13+' ����� ������ ��� �� ��� ���� ����������: '
    +#13#10+ '  1.������� �� �� �������� ������, � ����� �������� ����������� ��, ��������������� �� �� �������'
    +#13#10+ '  2.������� ������������� �� �� �������� �� ����������� ����.';
  infCreateTax = '������� ��������� ����� %s.';
  infCreateTaxCorr = '������� ������������� ����� %s.';
  infEditTax = '��������������� ��������� ����� %s.';
  infEditTaxCorr = '��������������� ������������� ����� %s.';
Type
  TDifferNN = (TYPE_,CAUSE_);
Function GetNameDifferNN(ID: Integer;Difference: TDifferNN): string;

implementation
{$R *.DFM}

Uses
  NPTypeRef,Main,ChooseOrg,uDBFunc,OilStd,TaxBillPrint,
  MoneyFunc,exFunc,CreateAZSBook, OperTypeRef,uExeSql, uXMLForm;
  
var
  To_,To_inst,from_,from_inst,From_AZS,From_AZS_inst : integer;
  LockedTax, FirstInsert,
  IsChangePrice, IsNeedChange : boolean;
  from_nal_num,NewNum : string;
  DateActive: boolean;
  
Function GetNameDifferNN(ID:Integer;Difference:TDifferNN):string;
Begin
  try
    Case Difference of
      Type_ :
        result := VarToStr(GetSQLValue('Select NAME_ from OIL_NN_TYPE WHERE ID = '+IntToStr(ID)));
      Cause_:
        result := VarToStr(GetSQLValue('Select NAME_ from OIL_NN_CAUSE WHERE ID = '+IntToStr(ID)));
    end;//case
  Except
    on E:Exception do
    begin
      MessageDlg(TranslateText('������ GetNameDifferNN : ') + E.message,mtError,[mbOk],0);
      Result := '';
    end;
  end;
End;

procedure TSlBookForm.FormShow(Sender: TObject);
begin
  Init;
end;

Procedure TSlBookForm.SetEditDataSet(p_Grid:TObject);
Begin
  if TDBGridEh(p_Grid).DataSource.DataSet.State = dsBrowse then
    TDBGridEh(p_Grid).DataSource.DataSet.Edit;
End;

Procedure TSlBookForm.SetSum;
// ��������� �����
Begin
  if qDetSale.FieldByName('PRICE').AsString = '' then
    qDetSale.FieldByName('PRICE').AsFloat := 0;
  if qDetSale.FieldByName('PRICE_NO_NDS').AsString = '' then
    qDetSale.FieldByName('PRICE_NO_NDS').AsFloat := 0;
  if qDetSale.FieldByName('COUNT').AsString = '' then
    qDetSale.FieldByName('COUNT').AsFloat := 0;
  qDetSale.FieldByName('SUM').AsFloat :=
    Fround(qDetSale.FieldByName('PRICE').AsFloat *
           qDetSale.FieldByName('COUNT').AsFloat,2);
  if not qDetSale.FieldByName('det_date').IsNull then
    qDetSaleDET_DATEChange(nil);
End;

Function TSlBookForm.CheckDate(Text:String):string;
// �������� ������������ ����
Begin
  try
    Result := DateToStr(StrToDate(Text));
  except
    MessageDlg(TranslateText('������ : �� ���������� ���a.'),mtError,[mbOk],0);
    result := '';
  end;
End;

procedure TSlBookForm.dbgSaleDetEditButtonClick(Sender: TObject);
//����� ��������������� ������� �� ������� �������� � ���� �����
var
//  NPTypeRefForm: TNPTypeRefForm;
  OperType:TOperTypeRefForm;
  vId: integer;
  vName: string;
  //----------------------------------------------------------------------------
  procedure GetTovar(AGrid:TDBGridEh;AFieldNpName,AFieldNpId:string;Sender: TObject);
  var
    vNpId: integer;
    vNpName: string;
  begin
    vNpName:='';
    vNpId:=0;
    case qCause['tovar_type'] of
      3://��������
        begin
          OperType := TOperTypeRefForm.Create(Application);
          try
            OperType.ShowModal;
            If OperType.ModalResult = mrOk Then
            begin
              SetEditDataSet(Sender);
              vNpName:=OperType.qNAME.AsString;
              vNpId:=OperType.qID.AsInteger;
            end;
          finally
            OperType.Free;
          end;
        end;
      1://����� ��
        begin
          if XMLChoose('npgroupref',vId,vName) then
          begin
            SetEditDataSet(Sender);
            vNpName := vName;
            vNpId:= vId;
          end;
        end;
      4://NN_TOV_NAL_CAPTION
        begin
          SetEditDataSet(Sender);
          vNpName:= GetSqlValue('select nvl(ov.getval(''NN_TOV_NAL_CAPTION''),''�������� �� �������� ������'') from dual');
          vNpId:=0;
        end;
      else
      Application.CreateForm(TNPTypeRefForm, NPTypeRefForm);
      try
        NPTypeRefForm.ShowModal;
        If NPTypeRefForm.ModalResult = mrOk Then
        begin
          SetEditDataSet(Sender);
          vNpName:=NPTypeRefForm.qNAME.AsString;
          vNpId:=NPTypeRefForm.qID.AsInteger;
        end;
      finally
        NPTypeRefForm.Free;
      end;
    end;//case of
    SetEditDataSet(Sender);
    AGrid.DataSource.DataSet.FieldByName(AFieldNpName).AsString:=vNpName;
   { if vNpId = 0 then
      AGrid.DataSource.DataSet.FieldByName(AFieldNpId).Value:=Null
    else       }
      AGrid.DataSource.DataSet.FieldByName(AFieldNpId).AsInteger:=vNpId;
  end;
  //----------------------------------------------------------------------------
begin
  try
    if qType['id'] <> 3 then
    begin
      if not(LockedTax) then
      begin
        if dbgSaleDet.SelectedField.FieldName = 'NP_NAME' then
        begin
          GetTovar(dbgSaleDet,'NP_NAME','NP_TYPE',Sender);
          if qCause['id']=18 then
          begin
            SetEditDataSet(Sender);
            dbgSaleDet.DataSource.DataSet.FieldByName('Dim_Name').AsString :=
              GetSqlValue('select nvl(ov.getval(''NN_CURRENCY_CAPTION''),''���.'') from dual');
            dbgSaleDet.DataSource.DataSet.FieldByName('Dim_Id').Value := 0;//Null;
          end;
        end;
        if dbgSaleDet.SelectedField.FieldName = 'DIM_NAME' then
          if XMLChoose('dimref',vId,vName) then begin
            SetEditDataSet(Sender);
            dbgSaleDet.DataSource.DataSet.FieldByName('Dim_Id').AsInteger := vId;
            dbgSaleDet.DataSource.DataSet.FieldByName('Dim_Name').AsString := vName;
          end;
      end;
    end
    else
    begin
      if not(LockedTax) then
      begin
        IF not(qDetSaleCorr.FieldByName('NP_NAME_JOIN').IsNULL) then
        begin
          MessageDlg(TranslateText('����� �������� ��� ������ ������������ : ')
            +#13#10+TranslateText(' 1.�������� ���������� � ������� ������� � ���������� ������ ����. ')
            +#13#10+TranslateText(' 2.�������� ����� ������� � ����� ����� ������.'),mtInformation,[mbOk],0);
          exit;
        end
        ELSE if dbgSaleDetCorr.SelectedField.FieldName = 'NP_NAME' then
        begin
          GetTovar(dbgSaleDetCorr,'NP_NAME','NP_TYPE_CORR',Sender);
        end;
      end;
    end;
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TSlBookForm.ceToButtonClick(Sender: TObject);
//����� �������
var
  vId,vInst:integer;
  vName    :string;
  q        :TOilQuery;
begin
  if ChooseOrg.CaptureOrgExt(3,Main_id,Inst,'yyy',vId,vInst,vName,q) then
  begin
    ceTo.Text := vName;
    To_ := vId;
    To_INST := vInst;
    From_nal_num := Q.Fieldbyname('nal_num').AsString;
    q.Free;
  end;
end;

procedure TSlBookForm.ceFromButtonClick(Sender: TObject);
//����� ����������
var
  vId,vInst:integer;
  vName:string;
begin
  if ChooseOrg.CaptureOrg(1,Main_id,Inst,'yyy',vId,vInst,vName) then
  begin
    ceFrom.Text := vName;
    from_ := vId;
    from_inst := vInst;
  end;
end;

procedure TSlBookForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qDetSale.Close;
end;

procedure TSlBookForm.qDetSalePRICEChange(Sender: TField);
//����������� ���� ��� ����
var
  price : real;
begin
  qDetSALE.Post;
  qDetSALE.Edit;
  If not(IsChangePrice)then
  begin
    price := 0;
    If not(qDetSALE.FieldByName('Det_date').IsNull) then
    begin
      price :=
        GetNoNDS_WithNDS(
          qDetSALE.FieldByName('PRICE').AsFloat,
          deTaxDate.Date,
          4);
    end
    Else If deTaxDate.date <> 0 then
    begin
      price :=
        GetNoNDS_WithNDS(
          qDetSALE.FieldByName('PRICE').AsFloat,
          deTaxDate.Date,
          4);
    end;
    IsChangePrice := True;
    if qDetSALE.FieldByName('PRICE_NO_NDS').AsFloat <> price then
      qDetSALE.FieldByName('PRICE_NO_NDS').AsFloat := price;
  end
  else
    IsChangePrice := False;
  SetSum;
end;

procedure TSlBookForm.qDetSaleBeforeInsert(DataSet: TDataSet);
begin
  if qDetSale.RecordCount > 0 then
    With qDetSale do
    Begin
      if FieldByName('NP_NAME').IsNull then
        raise Exception.Create(TranslateText('�� ������ ��� ������ !'));
      if FieldByName('DIM_NAME').IsNull then
        raise Exception.Create(TranslateText('�� ������� ������� ��������� !'));
      if(FieldByName('SUM').IsNull)then
        raise Exception.Create(TranslateText('�� ���������� ���� ��� ���������� ������ !'))
      else if(FieldByName('SUM').Value = 0)then
        raise Exception.Create(TranslateText('�� ���������� ���� ��� ���������� ������ !'));
      if IsCheckCause and(fieldByName('det_date').IsNull)then
        raise Exception.Create(TranslateText('�� ���������� ���� ������� ������ !'));
    End;//With qDetSale do
end;

procedure TSlBookForm.qDetSaleAfterInsert(DataSet: TDataSet);
// ������� ID,INST ��� �����������
begin
  if qDetSale.FieldByName('ID').IsNull
    and qDetSale.FieldByName('INST').IsNull then
  begin
    qDetSale.FieldByName('ID').AsInteger := GetSeqNextVal('s_oil_sale_book_det');
    qDetSale.FieldByName('INST').AsInteger := Main.Inst;
  end;
end;

procedure TSlBookForm.qDetSaleDET_DATEChange(Sender: TField);
//����������� �����
begin
   { // ��������� ������� �� �� ����� �� �������� ����� ������� ������� � ���� ����
    if qWork.Active then qWork.Close;
    qWork.SQL.Text := 'select Num, id, inst from oil_sale_book t where t.state = ''Y''' +
      ' and t.frasch = ''��������'' and t.s_date = '''+DateToStr(dbgSaleDet.DataSource.DataSet.FieldByName('DET_DATE').AsDateTime)+'''' +
      ' and ((id <> '+inttostr(NN_ID_FOR_CORR)+') or (-1 = '+inttostr(NN_ID_FOR_CORR)+'))' +
      ' and ((inst <> '+inttostr(NN_INST_FOR_CORR)+') or (-1 = '+inttostr(NN_INST_FOR_CORR)+'))';
    qWork.Open;
    // ���� ������ �����, �� ����� ������
    if not qWork.IsEmpty then
    begin
      if MessageDlg('���������� ������� �� �� ����� �� �������� ����� �������,'#13 +
        ' ��� ��� � ���� ���� ��� ���� ������� ���� �� �� ����� �� ���� ����� �������.'#13 +
        '�� ������� ������� �� �� ����� �� �������� ����� �������, ������� ������� ������ � ���� �� ����'#13 +
        ' � ������� ����� �� ������� ������?'
        ,mtConfirmation,[mbYes, mbNo],0) = mrYes then
      begin
        // ������� HH
        TaxBill := TdmTaxBill.Create;
        try
          TaxBill.DeleteSBRecords10(qWork.FieldByName('id').AsInteger, qWork.FieldByName('inst').AsInteger);
        finally
          TaxBill.Free;
        end;
      end
      else
        exit;
    end;
  end;}

  if not(qDetSALE.FieldByName('Det_date').IsNull) then
  begin
    qDetSALE.FieldByName('NDS_BASE').AsFloat :=
      GetNoNDS_WithNDS(
        qDetSALE.FieldByName('SUM').AsFloat,
        qDetSALE.FieldByName('Det_date').AsDateTime,
        4);
    qDetSALE.FieldByName('NDS_20').AsFloat :=
      qDetSALE.FieldByName('SUM').AsFloat - qDetSALE.FieldByName('NDS_BASE').AsFloat;
  end
  Else If deTaxDate.date <> 0 then
  begin
    qDetSALE.FieldByName('NDS_BASE').AsFloat :=
      GetNoNDS_WithNDS(
        qDetSALE.FieldByName('SUM').AsFloat,
        deTaxDate.Date,
        4);
    qDetSALE.FieldByName('NDS_20').AsFloat :=
      qDetSALE.FieldByName('SUM').AsFloat - qDetSALE.FieldByName('NDS_BASE').AsFloat;
  end;
end;

procedure TSlBookForm.sbDelClick(Sender: TObject);
begin
  if not(qDetSALE.IsEmpty)then
    qDetSALE.Delete;
end;

procedure TSlBookForm.dbgSaleDetColumns8UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
  Text := Trim(Text);
end;

procedure TSlBookForm.ceAZSButtonClick(Sender: TObject);
// ����� ���-���������� �� ������
var
  vId,vInst:integer;
  vName:string;
begin
  if ChooseOrg.CaptureOrg(2,Main_id,Main_id,'yyy',vId,vInst,vName) then
  begin
    ceAZS.Text := vName;
    From_AZS := vId;
    From_AZS_INST := vInst;
  end;
end;

procedure TSlBookForm.deTaxDateChange(Sender: TObject);
// ��������� ��������� (�������������) �� � �������� ��������� �������
begin
  if deTaxDate.Date <> 0 then
  begin
    if DateActive = true then
    begin
    //  ��� �������������, ��������� ����� �� �� ������� � ���� �����
     { if (lcType.Text <> '') then
      begin    }
        if (qType['id'] = 3) then
        begin
          if (NN_ID_FOR_CORR = -1) and (NN_INST_FOR_CORR = -1) then
          begin
            MessageDlg(TranslateText('�������� �� ������� ������ ��������������.'),mtInformation,[mbOk],0);
            deTaxDate.Date := 0;
            exit;
          end;
          if qWork.Active then qWork.Close;
          qWork.SQL.Text := format(' select max(s_date) date_ from oil_sale_book where state =''Y'' and ((nn_id=%d and nn_inst=%d)or(id=%0:d and inst=%1:d)) and not(id=%d and inst=%d)',[NN_ID_FOR_CORR,NN_INST_FOR_CORR,nn_id,nn_inst]);
          _OpenQueryOra(qWork);
          if deTaxDate.date < qWork.FieldByName('date_').AsDateTime then
          begin
            deTaxDate.Date := qWork.FieldByName('date_').AsDateTime;
            MessageDlg(format(TranslateText('���������� ������� ������������� ������ ��/��������� ������������� ��������� %s!'),
              [FormatDateTime2('dd.mm.yyyy',qWork.FieldByName('date_').AsDateTime)]),
              mtWarning,[mbOk],0);
            exit;
          end;
          if deTaxDate.Date <> 0 then
          begin
            qDetSaleCorr.Close;
            _OpenQueryParOra(qDetSaleCorr,
              ['nn_id',      qNNNumDate.FieldByName('nn_id').AsInteger,
               'nn_inst',    qNNNumDate.FieldByName('nn_inst').AsInteger,
               'corr_id',    nn_id,
               'corr_inst',  nn_inst,
               'nn_cause_id',qNNNumDate.FieldByName('nn_cause_id').AsInteger,
               'date_',      deTaxDate.Date]);
          end;
        end;
     { end
      else
      begin
        deTaxDate.Date := 0;
        MessageDlg('�������� ��� ��.',mtInformation,[mbOk],0);
        exit;
      end; }
    end;
    
    if(not Self.Visible)
      and( (Sender as TDateEdit).Date <= StrToDate(Close_Date) )  then
      (Sender as TDateEdit).Enabled := false;
    if ((Sender as TDateEdit).Date <= StrToDate(Close_Date)) or (bbOk.Tag=1) then
      bbOk.Enabled := False
    else
      bbOk.Enabled := True;
    qReserv.Close;
    qReserv.ParamByName('date_').AsDateTime := (Sender as TDateEdit).Date;
    qReserv.Open;
  end;

  if (deTaxDate.Date <> 0) then
  begin
    if (qType['id'] = 3) then
    begin
      if (dbgSaleDetCorr.DataSource.DataSet.FieldByName('PRICE_NO_NDS_CORR').AsString <> '') then
      begin
        qDetSaleCorr.First;
        qDetSaleCorr.Edit;
        repeat
          qDetSaleCorrPRICE_NO_NDS_CORR.OnChange(Nil);
          qDetSaleCorr.Next;
        until qDetSaleCorr.Eof;
      end;
    end
    else
      if (dbgSaleDet.DataSource.DataSet.FieldByName('PRICE_NO_NDS').AsString <> '') then
      begin
        qDetSale.First;
        qDetSale.Edit;
        repeat
          qDetSalePRICE_NO_NDS.OnChange(Nil);
          qDetSale.Next;
        until qDetSale.Eof;
      end;
  end;
end;

procedure TSlBookForm.sbClearFromClick(Sender: TObject);
begin
  if(ceFrom.Enabled)and(ceFrom.Visible)then
  begin
    ceFrom.Text := '';
    from_ := -1;
    from_inst := -1;
  end;
end;

procedure TSlBookForm.sbClearToClick(Sender: TObject);
begin
  if(ceTo.Enabled)and(ceTo.Visible)then
  begin
    ceTo.Text := '';
    To_ := -1;
    To_INST := -1;
  end;
end;

procedure TSlBookForm.sbClearFromAzsClick(Sender: TObject);
begin
  if(ceAZS.Enabled)and(ceAZS.Visible) then
  begin
    ceAZS.Text := '';
    From_AZS := -1;
    From_AZS_INST := -1;
  end;
end;

procedure TSlBookForm.qDetSaleSUMChange(Sender: TField);
begin
  qDetSaleDET_DATEChange(nil);
end;

procedure TSlBookForm.DBComboBox1Click(Sender: TObject);
begin
  if not(qReserv.Active) then
    qReserv.Open;
end;

procedure TSlBookForm.dblcTaxNumChange(Sender: TObject);
begin
  NewNum := qReserv['num'];
  if sbAutoNumTax.Down = false then
    eTaxNum.Text := NewNum;
end;

procedure TSlBookForm.sbAutoNumTaxClick(Sender: TObject);
begin
  if sbAutoNumTax.Down = false then
  begin
    eTaxNum.Text := NewNum;
    eTaxNum.Color := clWindow;
  end
  else
  begin
    if eTaxNum.Text <> ''then
      NewNum := eTaxNum.Text;
    eTaxNum.Text := '';
    eTaxNum.Color := clBtnFace;
  end;
  eTaxNum.Enabled := not(sbAutoNumTax.Down);
  dblcTaxNum.Enabled := not(sbAutoNumTax.Down);
end;

procedure TSlBookForm.qDetSaleBeforePost(DataSet: TDataSet);
// ��������� �����������(1) ��� ���� ����� �� ���� ������ ������
// � ��������� � ��� ������ ��� ������ ���������
var
  i : integer;
  IsNull : boolean;
begin
  IsNull := True;
  for i := 0 to qDetSale.Fields.Count - 3 do
    if not(qDetSale.Fields.Fields[i].IsNull)then
    Begin
      IsNull := False;
    End;
  If IsNull = true then
  Begin
    qDetSale.Fields.Fields[10].Clear;
    qDetSale.Fields.Fields[11].Clear;
    qDetSale.Fields.Fields[12].Clear;
    qDetSale.Fields.Fields[13].Clear;
  End;
end;

procedure TSlBookForm.qDetSaleAfterPost(DataSet: TDataSet);
// ��������� �����������(2) ��� ���� ����� �� ���� ������ ������
// � ��������� � ��� ������ ��� ������ ���������
var
  i : integer;
  IsNull : boolean;
begin
  IsNull := True;
  for i := 0 to qDetSale.Fields.Count - 3 do
    if not(qDetSale.Fields.Fields[i].IsNull)then
    Begin
      IsNull := False;
    End;
  If IsNull = true then
  Begin
    qDetSale.delete;
  End;
end;

procedure TSlBookForm.qDetSalePRICE_NO_NDSChange(Sender: TField);
//����������� ���� � ���
var
  price:real;
begin
  qDetSALE.Post;
  qDetSALE.Edit;
  If not(IsChangePrice)then
  begin
    price := 0;
    If not(qDetSALE.FieldByName('Det_date').IsNull) then
    begin
      price :=
        GetWithNDS_NoNDS(
        qDetSALE.FieldByName('PRICE_NO_NDS').AsFloat,
        deTaxDate.Date,
        2);
    end
    Else If deTaxDate.date <> 0 then
    begin
      price := fround(
        GetWithNDS_NoNDS(
          qDetSALE.FieldByName('PRICE_NO_NDS').AsFloat,
          deTaxDate.Date,
          2),2);
    end;
    IsChangePrice := True;
    if qDetSALE.FieldByName('PRICE').AsFloat <> price then
      qDetSALE.FieldByName('PRICE').AsFloat := price;
  end
  Else
    IsChangePrice := False;
  SetSum;
end;

procedure TSlBookForm.eTaxNumExit(Sender: TObject);
begin
  if eTaxNum.Text <> '' then
    NewNum := eTaxNum.Text;
  if sbAutoNumTax.Down = True then
    eTaxNum.Text := '';
end;

procedure TSlBookForm.dbgSaleDetColumns9UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
  if not(Text = '  .  .    ')then
    Text := CheckDate(Text)
  else
    Text := '';
end;

procedure TSlBookForm.qDetSaleCOUNTChange(Sender: TField);
begin
  SetSum;
end;

procedure TSlBookForm.lcCauseChange(Sender: TObject);
begin
  if qCause.Active then
  begin
    if IsCheckCause then
    begin
      eDoc.Text := TranslateText('�i�������� ���');
      eDoc.Enabled := False;
      nal_t := 14;
      dbgSaleDet.Columns.Items[8].Visible := True;
      dbgSaleDet.Columns.Items[9].Visible := True;
    end
    Else
    begin
      eDoc.Text := '';
      nal_t := 13;
      eDoc.Enabled := not(LockedTax);
      dbgSaleDet.Columns.Items[8].Visible := False;
      dbgSaleDet.Columns.Items[9].Visible := False;
    end;
  end;
end;

procedure TSlBookForm.sbChangeNumClick(Sender: TObject);
begin
  if(qCause['ID'] = 14)or(nn_inst<>INST)then
  begin
    ShowMessage(TranslateText('������ ������� ����� ��������� �� !'));
    exit;
  end;
  eTaxNum.Enabled := True;
  eTaxNum.Color := clWindow;
  eTaxNum_Tag := eTaxNum.Text;
  qReserv.Close;
  _OpenQueryParOra(qReserv,
    ['date_',deTaxDate.Date,
     'type_id',qType['id']]);
  nbNum.PageIndex := 2;//Apply
end;

procedure TSlBookForm.sbApplyNumClick(Sender: TObject);
var
  Num,AddWhere: String;
begin
  Try
    If eTaxNum_Tag <> eTaxNum.Text then
    begin
      if Trim(eTaxNum.Text) = '' then
        raise Exception.Create(TranslateText('�� ������ ����� ��'));
      qCheck.close;
      qCheck.ParamByName('INST').AsInteger := from_inst;
      qCheck.ParamByName('NUM').AsString := eTaxNum.text;
      qCheck.ParamByName('DATE_').AsDateTime := deTaxDate.Date;
      qCheck.ParamByName('NN_ID').AsInteger := NN_ID;
      if qType['id'] = 3 then
      begin
        qCheck.ParamByName('type_id').AsInteger := qType['id'];
        AddWhere := ' and nn_type_id = 3 ';
      end
      Else
        AddWhere := ' ';
      qCheck.open;

      if (qCheck.FieldByName('n').value<>0)then
        raise Exception.Create(TranslateText('��������� ��������� � ����� ����� ��� ���������� !'));
      //��������� � ������ ������ �����
      _ExecSql(' insert into oil_nnum_reserve (id, inst, state, date_, num) ' +
               '  select s_oil_nnum_reserve.nextval, inst, ''Y'', r_date, num ' +
               '  from oil_sale_book ' +
               '  where ID = '+IntToStr(NN_ID)+
               '    and INST = '+IntToStr(NN_INST)+
               '    and State = ''Y'' ');
      //������� �� ������� ����� �����
      _ExecSql('  update oil_nnum_reserve  ' +
               '  set state = ''N'' ' +
               '  where num = '''+eTaxNum_Tag+'''' +
               AddWhere);
      //����������� �� ����� �����
      _ExecSql(' update oil_sale_book ' +
               ' set num = ''' + eTaxNum.Text + '''' +
               ' where id = ' + IntToStr(nn_id) +
               ' and inst = ' + IntToStr(nn_inst));
      ShowMessage(TranslateText('����� ��������� ������� � ') + eTaxNum_Tag+ TranslateText(' �� ')+eTaxNum.Text);
    end;
    eTaxNum.Color := clBtnFace;
    Num := eTaxNum.Text;
    eTaxNum.Enabled := False;
    eTaxNum.Text:= Num;
    qReserv.Close;
    nbNum.PageIndex := 1;//Reset
    bbOk.Enabled := False;
  Except
    on E:Exception do
      MessageDlg(E.message,mtError,[mbOk],0);
  end;
end;

procedure TSlBookForm.qReservAfterOpen(DataSet: TDataSet);
begin
  dblcTaxNum.DropDownCount := qReserv.ComponentCount;
end;

procedure TSlBookForm.lcTypeChange(Sender: TObject);
begin
  case qType['id'] of
    3:
      begin
        lcNNNumDate.Visible := True;
        LblNNNumDate.Visible := True;
        _OpenQueryParOra(qNNNumDate,
          ['nn_id',  NN_ID_FOR_CORR,
           'nn_inst',NN_INST_FOR_CORR]);
        qDetSaleCorr.Close;
        nbGrids.PageIndex := nbGrids.Pages.IndexOf('Corr');
        deTaxDate.Date := 0;
      end
    else
      begin
        SetCauseEnable;
        lcNNNumDate.Visible := False;
        LblNNNumDate.Visible := False;
        qNNNumDate.Close;
        nbGrids.PageIndex := nbGrids.Pages.IndexOf('NN');
      end;
  end;//case
end;

procedure TSlBookForm.lcNNNumDateChange(Sender: TObject);
begin
  sbDel.Enabled := False;
  qDetSaleCorr.Close;
  _OpenQueryParOra(qDetSaleCorr,
    ['nn_id',      qNNNumDate.FieldByName('nn_id').AsInteger,
     'nn_inst',    qNNNumDate.FieldByName('nn_inst').AsInteger,
     'corr_id',    nn_id,
     'corr_inst',  nn_inst,
     'nn_cause_id',qNNNumDate.FieldByName('nn_cause_id').AsInteger,
     'date_',      date]);
  work_log(format(TranslateText('������� qDetSaleCorr - nn_id=%d nn_inst=%d corr_id=%d corr_id=%d nn_cause_id=%d '),[
    qNNNumDate.FieldByName('nn_id').AsInteger,
    qNNNumDate.FieldByName('nn_inst').AsInteger,
    nn_id,
    nn_inst,
    qNNNumDate.FieldByName('nn_cause_id').AsInteger]));
  if qNNNumDate.Active = true then
  begin
    if qWork.Active then qWork.Close;
    qWork.SQL.Text := Format('select num,f_doc ,nn_cause_id, frasch from oil_sale_book t where t.state = ''Y'' and t.id = %d and t.inst = %d',
     [qDetSaleCorr.ParamByName('nn_id').AsInteger,
      qDetSaleCorr.ParamByName('nn_inst').AsInteger]);
    qWork.Open;

    NN_ID_FOR_CORR := qDetSaleCorr.ParamByName('nn_id').AsInteger;
    NN_INST_FOR_CORR := qDetSaleCorr.ParamByName('nn_inst').AsInteger;
    NN_NUM_FOR_CORR := qWork.FieldByName('num').AsString;
    if cbFormRasch.Items.IndexOf(qWork.FieldByName('FRasch').AsString) <> -1 then
      cbFormRasch.ItemIndex := cbFormRasch.Items.IndexOf(qWork.FieldByName('FRasch').AsString)
    else
    begin
      cbFormRasch.Items.Add(qWork.FieldByName('FRasch').AsString);
      cbFormRasch.ItemIndex := cbFormRasch.Items.Count-1;
    end;
    // ����������� �������� �� ��������� �������������
    // ����������
    if qWork.FieldByName('nn_cause_id').AsInteger = 10 then//���������� �� ���.
    begin
      ceTo.Text := VarToStr(GetSQLValue('select nvl(ov.getval(''NN_ORG_NAL_CAPTION''),''���������� �� ���.'') from dual'));
      qCause.Close;
      qCause.ParamByName('cause_id').AsInteger := 10;
      qCause.Open;
      lcCause.SelectNextValue(false);
      lcCause.Enabled := False;
    end
    else
    begin
      qCause.Close;
//      qCause.ParamByName('cause_id').AsInteger := 15;
      qCause.Open;
      lcCause.SelectNextValue(false);
//      lcCause.Enabled := False;
      ceTo.Text := GetFullName(
        qNNNumDate.FieldByName('organ').AsInteger,
        qNNNumDate.FieldByName('organ_inst').AsInteger,
        GetOrgName(
          qNNNumDate.FieldByName('organ').AsInteger,
          qNNNumDate.FieldByName('organ_inst').AsInteger
          )
        );
    end;
    eDoc.Text := qWork.FieldByName('F_doc').AsString;
    eDoc.Enabled := False;    
    ceTo.Enabled := False;
    if qNNNumDate.FieldByName('organ').AsInteger <> 0 then
    begin
      To_ := qNNNumDate.FieldByName('organ').AsInteger;
      To_inst := qNNNumDate.FieldByName('organ_inst').AsInteger;
    end
    else
    begin
      To_ := -1;
      To_inst := -1;
    end;
    lTo.Tag := To_;
    ceTo.Tag := To_inst;
    //���������
    ceFrom.Text := GetOrgName(
      qNNNumDate.FieldByName('From_').AsInteger,
      qNNNumDate.FieldByName('From_inst').AsInteger
      );
    ceFrom.Enabled := False;
    from_ := qNNNumDate.FieldByName('From_').AsInteger;
    from_inst := qNNNumDate.FieldByName('From_inst').AsInteger;
    //���
    ceAZS.Text := GetOrgName(
      qNNNumDate.FieldByName('AZS_ID').AsInteger,
      qNNNumDate.FieldByName('AZS_INST').AsInteger
      );
    ceAZS.Enabled := false;
    From_AZS := qNNNumDate.FieldByName('AZS_ID').AsInteger;
    From_AZS_inst := qNNNumDate.FieldByName('AZS_INST').AsInteger;
  end;
end;

procedure TSlBookForm.qDetSaleCorrPRICE_NO_NDS_CORRChange(Sender: TField);
// ����������� ���� � ���
var
  price: real;
begin
  if qDetSaleCorr.State = dsEdit then qDetSALECorr.Post;
  qDetSALECorr.Edit;

  If IsNeedChange then
  begin
    IsNeedChange := False;
    If deTaxDate.date <> 0 then
    begin
      price :=
        GetWithNDS_NoNDS(
        qDetSALECorr.FieldByName('PRICE_NO_NDS_CORR_GRID').AsFloat,
        deTaxDate.Date,
        2);
    end
    Else
    begin
      price := fround(
        GetWithNDS_NoNDS(
          qDetSALECorr.FieldByName('PRICE_NO_NDS_CORR_GRID').AsFloat,
          date,
          2),2);
    end;
    qDetSALECorr.FieldByName('PRICE_CORR_GRID').AsFloat := price;
    if qDetSALECorr.FieldByName('COUNT_').AsFloat <> 0 then
      qDetSALECorr.FieldByName('COUNT_CORR_GRID').AsFloat := qDetSALECorr.FieldByName('COUNT_').AsFloat;
    IsNeedChange := True;
  end;
  SetSumCorr;
end;

procedure TSlBookForm.qDetSaleCorrPRICE_CORRChange(Sender: TField);
// ����������� ���� ��� ����
var
  price: real;
begin
  if qDetSaleCorr.State = dsEdit then qDetSALECorr.Post;
  qDetSALECorr.Edit;

  If IsNeedChange then
  begin
    IsNeedChange := False;
    If deTaxDate.Date <> 0 then
    begin
      price :=
        GetNoNDS_WithNDS(
          qDetSALECorr.FieldByName('PRICE_CORR_GRID').AsFloat,
          deTaxDate.Date,
          4);
    end
    Else
    begin
      price :=
        GetNoNDS_WithNDS(
          qDetSALECorr.FieldByName('PRICE_CORR_GRID').AsFloat,
          date,
          4);
    end;
    qDetSALECorr.FieldByName('PRICE_NO_NDS_CORR_GRID').AsFloat := price;
    if qDetSALECorr.FieldByName('COUNT_').AsFloat <> 0 then
      qDetSALECorr.FieldByName('COUNT_CORR_GRID').AsFloat := qDetSALECorr.FieldByName('COUNT_').AsFloat;
    IsNeedChange := True;
  end;
  SetSumCorr;
end;

procedure TSlBookForm.qDetSaleCorrCOUNT_CORRChange(Sender: TField);
begin
  if IsNeedChange then
  begin
    IsNeedChange := False;
    if not(qDetSALECorr.FieldByName('PRICE').IsNULL) then
    begin
      qDetSALECorr.FieldByName('PRICE_CORR_GRID').AsFloat := qDetSALECorr.FieldByName('PRICE').AsFloat;
      qDetSALECorr.FieldByName('PRICE_NO_NDS_CORR_GRID').AsFloat := qDetSALECorr.FieldByName('PRICE_NO_NDS').AsFloat;
    end;
    IsNeedChange := True;
  end;
  SetSumCorr;
end;

Procedure TSlBookForm.SetSumCorr;
// ��������� �����
Begin
  if qDetSaleCorr.FieldByName('PRICE_CORR_GRID').AsString = '' then
    qDetSaleCorr.FieldByName('PRICE_CORR_GRID').AsFloat := 0;
  if qDetSaleCorr.FieldByName('PRICE_NO_NDS_CORR_GRID').AsString = '' then
    qDetSaleCorr.FieldByName('PRICE_NO_NDS_CORR_GRID').AsFloat := 0;
  if qDetSaleCorr.FieldByName('COUNT_CORR_GRID').AsString = '' then
    qDetSaleCorr.FieldByName('COUNT_CORR_GRID').AsFloat := 0;
  qDetSaleCorr.FieldByName('SUM_CORR_GRID').AsFloat :=
    Fround(qDetSaleCorr.FieldByName('PRICE_CORR_GRID').AsFloat *
           qDetSaleCorr.FieldByName('COUNT_CORR_GRID').AsFloat,2);
End;

procedure TSlBookForm.miClearPosClick(Sender: TObject);
begin
  if qDetSaleCorr.State = dsEdit then qDetSALECorr.Post;
  qDetSALECorr.Edit;
  IsNeedChange := False;
  qDetSALECorr.FieldByName('PRICE_CORR_GRID').AsFloat := 0;
  qDetSALECorr.FieldByName('PRICE_NO_NDS_CORR_GRID').AsFloat := 0;
  qDetSALECorr.FieldByName('COUNT_CORR_GRID').AsFloat := 0;
  IsNeedChange := True;
end;

procedure TSlBookForm.SetCauseEnable;
begin
  if(qCause.Active)and not(qCause.IsEmpty)then
    if qCause.FieldByName('hide').AsString ='N' then
      lcCause.Enabled := True
    else
      lcCause.Enabled := False;
end;

procedure TSlBookForm.work_log(s: string; n: integer = 0);
begin
  if SysParamExists('SALEBOOKLOG') then
    exfunc.log('SALEBOOKLOG.log',FormatDateTime('dd.mm.yyyy hh:nn:ss',now())+' '+s);
end;

procedure TSlBookForm.Test();
begin
  if deTaxDate.date=0 then raise ETestError.Create(TranslateText('�� ���������� ���� ��������� !'));
  if cbFormRasch.Text='' then raise ETestError.Create(TranslateText('�� ���������� ����� ������� !'));
  if lcType.text=''  then Raise ETestError.Create(TranslateText('�� ��������� ��� ��������� !'));
  if lcCause.text='' then Raise ETestError.Create(TranslateText('�� ��������� �������� ��������� !'));
  if eDoc.text='' then Raise ETestError.Create(TranslateText('�� ���������� ������� ������� !'));
  if ceTo.text='' then Raise ETestError.Create(TranslateText('�� ��������� ���������� !'));
  if ceFrom.text='' then Raise ETestError.Create(TranslateText('�� ���������� �����������-��������� !'));
  if(qType['id'] <> 3)then
    TestNN()
  else
    TestCorr();
end;

procedure TSlBookForm.Init;
Var
  NN_NUM: String;
begin
  inherited;
  DateActive := false;
  FirstInsert := True;
  IsChangePrice := False;
  IsNeedChange := False;
  NewNum := '';
  sbAutoNumTaxClick(nil);
  LockedTax :=False;
  //�������������� ��
  if (nn_id <> -1) and (nn_inst <> -1) then
  Begin
    work_log(format(' id=%d and inst=%d ',[nn_id,nn_inst]));
    nbNum.PageIndex := 1;   //reset
    LockedTax := (q.fieldbyname('lock_').AsInteger = 0);
    if LockedTax then
    Begin
      lAutoTax.Visible := True;
      pStoroni.Enabled := False;
      ceFrom.Enabled := False;
      ceTo.Enabled := False;
      ceAzs.Enabled := False;
      cbFormRasch.Enabled := False;
      eDoc.Enabled := False;
      eDoc.ReadOnly := True;
      deTaxDate.Enabled := False;
      eTaxNum.Enabled := False;
      bbOk.Visible := False;
      dbgSaleDet.ReadOnly := true;
      pDel.Enabled := False;
      bbCancel.Caption := TranslateText('�������');
    End;
    lcType.Enabled := False;
    lcCause.Enabled := False;
    lcNNNumDate.Enabled := False;//��� �������������
    eTaxNum.Enabled := False;
    dblcTaxNum.Enabled := False;
    sbAutoNumTax.Enabled := False;
    //����� ���� � ��������� ��
    qType.Close;
    if q['NN_TYPE_ID'] = Null then
      qType.ParamByName('Type_id').AsInteger := -2
    else
    begin
      qType.ParamByName('Type_id').AsInteger := q['NN_TYPE_ID'];
      if q['NN_TYPE_ID'] = 3 then//�������������
        nbGrids.PageIndex := nbGrids.Pages.IndexOf('Corr')
      else
        nbGrids.PageIndex := nbGrids.Pages.IndexOf('NN');;
      work_log(format('NN_TYPE_ID=%d',[qType.ParamByName('Type_id').AsInteger]));
    end;
    qType.Open;
    qCause.Close;
    If q['NN_CAUSE_ID'] = Null then
      qCause.ParamByName('CAUSE_ID').AsInteger := -2
    Else
      qCause.ParamByName('CAUSE_ID').AsInteger := q['NN_CAUSE_ID'];
    work_log(format('NN_TYPE_ID=%d',[qCause.ParamByName('CAUSE_ID').AsInteger]));
    qCause.Open;
    //���������� ���������� �� ������ �������
    lcType.SelectNextValue(false);
    lcCause.SelectNextValue(false);
    qNNNumDate.Close;
    if q['NN_TYPE_ID']=3 then
    begin
      _OpenQueryParOra(qNNNumDate,
        ['nn_id',   BoolTo_(q.FieldByName('nn_id').AsInteger=0,-1,q.FieldByName('nn_id').AsInteger),
         'nn_inst', BoolTo_(q.FieldByName('nn_inst').AsInteger=0,-1,q.FieldByName('nn_inst').AsInteger)
         ]);
      lcNNNumDate.SelectNextValue(false);
    end;
    //�������� ��������� ��
    qDetSale.ParamByName('nn_id').AsInteger := nn_id;
    qDetSale.ParamByName('nn_inst').AsInteger := nn_inst;
    ceTo.Text := q.FieldByName('organ_name').AsString;
    if q.FieldByName('organ').AsInteger <> 0 then
    begin
      To_ := q.FieldByName('organ').AsInteger;
      To_inst := q.FieldByName('organ_inst').AsInteger;
    end
    else
    begin
      To_ := -1;
      To_inst := -1;
    end;
    lTo.Tag := To_;
    ceTo.Tag := To_inst;

    ceFrom.Text := q.FieldByNAme('From_name').AsString;
    from_ := q.FieldByName('From_').AsInteger;
    from_inst := q.FieldByName('From_inst').AsInteger;
    ceAZS.Text := q.FieldByName('From_AZS_name').AsString;
    From_AZS := q.FieldByName('AZS_ID').AsInteger;
    From_AZS_inst := q.FieldByName('AZS_INST').AsInteger;
    eTaxNum.text := q.FieldByName('Num').AsString;
    num := q.FieldByName('Num').AsString;
    deTaxDate.Text := q.FieldByName('S_DATE').AsSTRING;
    eDoc.Text := q.FieldByName('f_doc').AsSTRING;
    if cbFormRasch.Items.IndexOf(trim(q.FieldByName('FRasch').AsString)) <> -1 then
      cbFormRasch.ItemIndex := cbFormRasch.Items.IndexOf(trim(q.FieldByName('FRasch').AsString))
    else
    begin
      cbFormRasch.Items.Add(q.FieldByName('FRasch').AsString);
      cbFormRasch.ItemIndex := cbFormRasch.Items.Count-1;
    end;
    if not(q.FieldByName('nal_t').AsInteger = 14) then
    Begin
      dbgSaleDet.Columns.Items[8].Visible := False;
      dbgSaleDet.Columns.Items[9].Visible := False;
    End;
    if q.FieldByName('nn_cause_id').AsInteger in [11,12] then
    begin
      dbgSaleDet.Columns.Items[9].Visible := True;
      dbgSaleDet.Columns.Items[9].Title.Caption := TranslateText('���� �������');
    end;
    if IsCheckCause then
    begin
      dbgSaleDet.Columns.Items[8].Visible := True;
      dbgSaleDet.Columns.Items[9].Visible := True;
    end;
  end
  Else //����� ��
  begin
    nbNum.PageIndex := 0;
    qType.Close;
    qType.ParamByName('TYPE_ID').AsInteger := -1;
    qType.Open;
    qCause.Close;
    qCause.ParamByName('CAUSE_ID').AsInteger := -1;
    qCause.Open;
    ceTo.Text := '';
    To_ := -1;
    To_inst := -1;
    ceFrom.Text := MAIN_ORG.NAME;
    from_ := MAIN_ORG.INST;
    from_inst := MAIN_ORG.ID;
    ceAZS.Text := '';
    From_AZS := -1;
    From_AZS_inst := -1;
    num := '';
    deTaxDate.Text := '';
    eDoc.Text := '';
    qReserv.ParamByName('Date_').AsDateTime := Date;
    qReserv.Open;
    // ���� �� "�����" ���������� ������������� �������� �� � � ��� ��������� �����
    if(NN_ID_FOR_CORR <> -1)and(NN_INST_FOR_CORR <> -1)then
    begin
      q.Close;
      qNNNumDate.Close;
      qType.Close;
      _OpenQueryParOra(
        q,
        ['id',NN_ID_FOR_CORR,
         'inst',NN_INST_FOR_CORR]);
      q.first;
      _OpenQueryParOra(
        qType,
        ['type_id', 3]);
      lcType.SelectNextValue(false);
      lcType.Enabled := False;
      _OpenQueryParOra(
        qCause,
        ['cause_id', q.FieldByName('nn_cause_id').AsInteger]);
      lcCause.SelectNextValue(false);
      lcCause.Enabled := False;
      eDoc.Text := q.FieldByName('F_DOC').AsString;
      eDoc.Enabled:=false;
      _OpenQueryParOra(
        qNNNumDate,
        ['nn_id',   q.FieldByName('id').AsInteger,
         'nn_inst', q.FieldByName('inst').AsInteger]);
      lcNNNumDate.SelectNextValue(false);
      lcNNNumDate.Enabled := False;
    end;
  end;
  IsNeedChange := True;
  if(q.FieldByName('NN_TYPE_ID').AsInteger<>3)then
    qDetSale.Open;

  if (qType['id'] = 3) and (deTaxDate.Date <> 0) and
     (((NN_ID_FOR_CORR <> -1) or (NN_ID_FOR_CORR <> 0)) and ((NN_INST_FOR_CORR <> -1) or (NN_INST_FOR_CORR <> 0))) then
  begin
    if qWork.Active then qWork.Close;
    qWork.SQL.Text := 'select ' +
      '   t.Num as NN_NUM ' +
      ' from ' +
      '   oil_sale_book t ' +
      ' where ' +
      '   t.id = '+IntToStr(NN_ID_FOR_CORR)+' and ' +
      '   t.inst = '+IntToStr(NN_INST_FOR_CORR);
    qWork.Open;
    NN_NUM := qWork.FieldByName('NN_NUM').AsString;
    if qWork.Active then qWork.Close;
    qWork.SQL.Text := 'select ' +
      '   max(t.s_date) as MaxData, ' +
      '   min(t.s_date) as MinData ' +
      ' from ' +
      '   oil_sale_book t ' +
      ' where ' +
      '   t.state = ''Y'' and ' +
      '   INSTR(t.num,'+NN_NUM+') <> 0 ';
    qWork.Open;
    if deTaxDate.date < qWork.FieldByName('MaxData').AsDateTime then
      deTaxDate.Enabled := false;
  end;
  DateActive := true;
end;

procedure TSlBookForm.TestNN();
var
  IsNN_NalExist,IsNN_EachAzs :boolean;
  FreeMoney,NNMoney,SmMoney:real;
  DrCount: integer;
begin
  // �������� ��
  if qDetSale.IsEmpty then
    Raise Exception.Create(TranslateText('�� ������� ������� �� !'));
  qDetSaleAfterInsert(nil);
  qDetSale.First;
  While not(qDetSale.eof) do
  begin
    If qDetSale.FieldByName('NP_NAME').IsNull then
      raise ETestNNError.Create(TranslateText('�� ������ ��� ������ !'));
    If qDetSale.FieldByName('DIM_NAME').IsNull then
      raise ETestNNError.Create(TranslateText('�� ������� ������� ��������� !'));
    If(qDetSale.FieldByName('SUM').IsNull)or(qDetSale.FieldByName('SUM').Value = 0)then
      raise ETestNNError.Create(TranslateText('�� ���������� ���� ��� ���������� ������ !'));
    if IsCheckCause and (qDetSale.FieldByName('DET_DATE').IsNull)then
      raise ETestNNError.Create(TranslateText('�� ���������� ���� ������� ������ !'));
    IF IsCheckCause THEN
    begin
      DrCount := GetSqlValueParSimple('select count(*) '
        +'  from oil_daily_rep '
        +' where state = ''Y'' '
        +'   and ((azs_id = :azs_id and azs_inst = :azs_inst) or (:azs_id = -1)) '
        +'   and trunc(rep_date) = to_date(:date_,''DD.MM.YYYY'') ',
        ['azs_id',from_azs,
         'azs_inst',from_azs_inst,
         'date_',FormatDateTime('DD.MM.YYYY',qDetSale.FieldByName('DET_DATE').AsDateTime)]);

      if (qCause['id'] = 9) and (DrCount = 0) then
        // �������� �� ������������ ������� ������� �������
        raise ETestNNError.Create(TranslateText('�� ������� ������� ������ � ������� �����������!')+#10#13
          +TranslateText('���� ��������� ����� �������� ������, ���� �������������� ������ ���������� ��'))
      else if (qCause['id'] = 26) and (DrCount <> 0) then
        // �������� �� ������������ ��������� �������� ������
        raise ETestNNError.Create(TranslateText('������� ������� ������ � ������� ����������� !')+#10#13
          +TranslateText('�������������� ������ ���������� ��'));
    end;
    qDetSale.Next;
  end;//while
  //���� �� �� �����
  IF IsCheckCause and (qCause['id'] = 9) then
  begin
    work_log(TranslateText('�� �� �����'));
    //���� ���������� ��� �������� �� �� ���� �� ��� ��� ���� �� �����. � �����������
    qWork.Close;
    qWork.SQL.Text := Format('select distinct nn_id,nn_inst, azs_id, azs_inst from v_oil_sale_book_det where nn_cause_id = 10 and det_date = to_date(''%s'',''DD.MM.YYYY'')',
      [FormatDateTime2('dd.mm.yyyy',qDetSALE.FieldByName('Det_date').AsDateTime)]);
    _OpenQueryOra(qWork);
    if(nvl(qWork['azs_id'],0) = 0)and(nvl(qWork['azs_inst'],0) = 0)then
    begin
      IsNN_EachAzs := False;
      work_log(TranslateText('�� �� ���� ������� ��� ���� ��� '));
    end
    else
    begin
      IsNN_EachAzs := True;
      work_log(TranslateText('�� �� ���� ������� ��� ����� ��� '));
      if ceAZS.Text = '' then
        raise ETestNNError.Create(TranslateText('���������� ������ ����� ��� �� ������� ������� ������� ����� ������� ������ !'));
      work_log(Format('AZS_ID = %d AZS_INST = %d',
        [from_azs,
         from_azs_inst]
         ));
    end;
      qDetSale.First;
      while not(qDetSale.eof) do
      begin
        //��-��� + ����-���
        NNMoney := 0;
        qWork.Close;
        if(IsNN_EachAzs)then
          qWork.SQL.Text := Format('select distinct nn_id,nn_inst, azs_id, azs_inst from v_oil_sale_book_det where nn_cause_id = 10 and det_date = to_date(''%s'',''DD.MM.YYYY'') and azs_id=%d and azs_inst=%d',
            [FormatDateTime2('dd.mm.yyyy',qDetSALE.FieldByName('Det_date').AsDateTime),
             From_AZS,
             From_AZS_inst])
        else
          qWork.SQL.Text := Format('select distinct nn_id,nn_inst, azs_id, azs_inst from v_oil_sale_book_det where nn_cause_id = 10 and det_date = to_date(''%s'',''DD.MM.YYYY'')',
            [FormatDateTime2('dd.mm.yyyy',qDetSALE.FieldByName('Det_date').AsDateTime)]);
        _OpenQueryOra(qWork);
        IsNN_NalExist := not(qWork.IsEmpty);
        if (IsNN_NalExist) then
        begin
          work_log(TranslateText('��������� ��� �� � ������� ��������� ����� �� ')+FormatDateTime2('dd.mm.yyyy',qDetSALE.FieldByName('Det_date').AsDateTime));
          work_log(TranslateText('��� �� ')+qDetSale.FieldByName('NP_TYPE').AsString);
          qDetSaleCorr.DisableControls;
          While not(qWork.Eof) do //��������� ��� �� �� ������� � ��������� ������ ������ �������
          begin
            qDetSaleCorr.Close;
            _OpenQueryParOra(qDetSaleCorr,
              ['nn_id',      qWork.FieldByName('nn_id').AsInteger,
               'nn_inst',    qWork.FieldByName('nn_inst').AsInteger,
               'corr_id',    -1,
               'corr_inst',  -1,
               'nn_cause_id',q['NN_CAUSE_ID'],
               'date_',        null]);
            qDetSaleCorr.First;
            While not(qDetSaleCorr.Eof) do
            begin
              if(qDetSaleCorr.FieldByName('np_type_corr').AsFloat = qDetSale.FieldByName('NP_TYPE').AsFloat)then
              begin
                NNMoney := NNMoney + FRound(qDetSaleCorr.FieldByName('SUMM').AsFloat);
                work_log(TranslateText('����� �� �� �� �������� ')+FloatToStr(NNMoney));
              end;
              qDetSaleCorr.Next;
            end;
            qWork.Next;
          end;
          qDetSaleCorr.EnableControls;
        end;
        //��.������
        qNal.Close;
        _OpenQueryParOra(qNal,
          ['date_',   qDetSALE.FieldByName('Det_date').AsDateTime,
           'azs_id',  BoolTo_(IsNN_EachAzs,From_AZS, null),
           'np_id',   qDetSale.FieldByName('NP_TYPE').AsInteger,
           'with_nn', 1]);
        qNal.First; SmMoney:=0;
        While not(qNal.Eof)do
        begin
          SmMoney:=SmMoney+Fround(qNal.FieldByName('money').AsFloat);
          qNal.Next;
        end;
        //��-����
        qWork.Close;
        qWork.SQL.Text := format('select sum(det.nds_t) summ, '
          +'       det.tov_id np_id, '
          +'       det.det_date '
          +'  from oil_sale_book sb, '
          +'       oil_sale_book_det det '
          +' where sb.id = det.nn_id and sb.inst = det.nn_inst '
          +'   and sb.state = ''Y'' and det.state = ''Y'' and sb.nn_cause_id = 9 '
          +'   and det.det_date is not null '
          +'   and det.det_date = to_date(''%s'',''DD.MM.YYYY'') '
          +'   and det.tov_id = %d '
          +' group by det.tov_id, '
          +'       det.det_date ',
          [FormatDateTime2('dd.mm.yyyy',qDetSALE.FieldByName('Det_date').AsDateTime),
           qDetSale.FieldByName('NP_TYPE').AsInteger]);
        if IsNN_EachAzs then//��������� ������� �� ���
          qWork.AddWhere(Format(' sb.azs_id = %d and sb.azs_inst = %d ',
            [from_azs,
             from_azs_inst]));
        if(nn_id<>-1)and(nn_inst<>-1)then
          qWork.AddWhere(Format(' sb.id <> %d and sb.inst <> %d ',
            [nn_id,
             nn_inst]));
        _OpenQueryOra(qWork);
        // ����������
        work_log( TranslateText('� ��.������ ')+FloatToStr(Fround(SmMoney)) );
        work_log( TranslateText('� �� �� ����� ')+FloatToStr(Fround(qWork.FieldByName('summ').AsFloat)) );
        FreeMoney := Fround(SmMoney) - (NNMoney + Fround(qWork.FieldByName('summ').AsFloat));
        work_log( TranslateText('��������� ����� ')+FloatToStr(FreeMoney));
        work_log( TranslateText('����������� ����� ')+FloatToStr(qDetSale.FieldByName('SUM').AsFloat));
        if FRound(qDetSale.FieldByName('SUM').AsFloat) > Fround(FreeMoney) then
          raise ETestNNError.Create(eNotEnoughFreeMoney);
        qDetSale.Next;
      end;
  end;
end;

procedure TSlBookForm.TestCorr();
var
  IsEmptyCorr :boolean;
begin
  if(lcNNNumDate.Text='')then
    raise ETestCorrError.Create(TranslateText('�� ���������� �� ��� ������������� !'));
  IsEmptyCorr:=true;
  qDetSaleCorr.First;
  while not(qDetSaleCorr.Eof) do
  begin
    //���� ������� ���� ��������, �� ������ ����� ����������
    if not(( qDetSaleCorr.FieldByName('SUM_CORR_GRID').IsNull)or//��� ����� ������� ��� ����� ������ �� ���������
      ((Fround(qDetSaleCorr.FieldByName('SUM_CORR_GRID').AsFloat) = Fround(qDetSaleCorr.FieldByName('SUMM').AsFloat)) and
       (Fround(qDetSaleCorr.FieldByName('COUNT_CORR_GRID').AsFloat) = Fround(qDetSaleCorr.FieldByName('COUNT_').AsFloat)) and
       (Fround(qDetSaleCorr.FieldByName('PRICE_CORR_GRID').AsFloat) = Fround(qDetSaleCorr.FieldByName('PRICE').AsFloat)) and
       (Fround(qDetSaleCorr.FieldByName('PRICE_NO_NDS_CORR_GRID').AsFloat) = Fround(qDetSaleCorr.FieldByName('PRICE_NO_NDS').AsFloat))
        )or
     ( (Fround(qDetSaleCorr.FieldByName('PRICE_CORR_GRID').AsFloat) = 0)and
       (Fround(qDetSaleCorr.FieldByName('COUNT_CORR_GRID').AsFloat) = 0)))
    then
      IsEmptyCorr:=false;
    qDetSaleCorr.Next;
  end;
  if IsEmptyCorr then
    raise ETestCorrError.Create(TranslateText('������������� �������� �� ����� �.�. ��� ������ ��� ��� !'))
end;

procedure TSlBookForm.Save();
begin
  if (qType['id'] <> 3) then
    SaveNN()
  else  //�������������
    SaveCorr();
end;

procedure TSlBookForm.SaveNN();
var
  AddPosDate,AddPosCheck, tmpNum: String;
  TaxBill: TdmTaxBill;
begin
  //���������� �����������/�� �����������
  if(lTo.Tag = 0)or(ceTo.Tag = 0)then
  begin
    lTo.Tag := 1;
    ceTo.Tag := 1;
  end;
  TaxBill := TdmTaxBill.Create(lTo.Tag,ceTo.Tag);
  Try
    TaxBill.Options.FromId := from_;
    TaxBill.Options.FromInst := from_inst;
    If(From_AZS <> -1)and(From_AZS_inst <> -1)then
    begin
      TaxBill.Options.FromAzsId := From_AZS;
      TaxBill.Options.FromAzsInst := From_AZS_inst;
    end;
    If(nn_id = -1)and(nn_inst = -1)then
    Begin
      TaxBill.Options.TaxBillId := 0;
      TaxBill.Options.TaxBillInst := 0;
      //� ������ ��������� ����� ��
      If sbAutoNumTax.Down = false then  // ������� �� ������� ������� �������� �����
      begin
        if NewNum = '' then
          raise Exception.Create(TranslateText('�� ��������� ����� ��������� !'));
        qCheck.close;
        qCheck.ParamByName('INST').AsInteger := from_inst;
        qCheck.ParamByName('NUM').AsString := NewNum;
        qCheck.ParamByName('DATE_').AsDateTime := deTaxDate.Date;
        qCheck.open;
        if (qCheck.FieldByName('n').value<>0)then
          raise Exception.Create(TranslateText('��������� ��������� � ����� ����� ��� ���������� !'));
        num := NewNum;
        StartSQL;
        _ExecSql(' update oil_nnum_reserve '
          +' set state = ''N'''
          +' where num = :num '
          +'   and inst = :inst ', 
          ['num',NewNum,
           'inst',MAIN_ORG.INST]
          );
        CommitSQL;
      end;
    End
    else
    Begin
      TaxBill.Options.TaxBillId := nn_id;
      TaxBill.Options.TaxBillInst := nn_inst;
      TaxBill.DeleteSBRecordsDet(NN_ID,NN_INST,13);
      TaxBill.DeleteSBRecordsDet(NN_ID,NN_INST,14);
    End;
    TaxBill.Options.ToId := to_;
    TaxBill.Options.ToInst := to_inst;
    TaxBill.Options.Num := num;
    TaxBill.Options.Date := deTaxDate.text;
    TaxBill.Options.ByDogName := trim(eDoc.text);
    TaxBill.Options.OperName := trim(cbFormRasch.Text);
    TaxBill.Options.TaxBillType := Nal_T;
    TaxBill.Options.OIL_NN_Type := qType['id'];
    TaxBill.Options.OIL_NN_Cause := qCause['id'];
    TaxBill.Options.Locked := UnLock;
    qDetSale.First;
    while not(qDetSale.Eof)do
    Begin
      if IsCheckCause then
        if not(qDetSale.FieldByName('Det_date').IsNull)then
          AddPosDate := DateToStr(StrToDate(qDetSale.FieldByName('Det_date').AsString))
        else
          AddPosDate := deTaxDate.Text
      else
        AddPosDate := deTaxDate.Text;
      try
        if not(qDetSale.FieldByName('Det_Text').IsNull)then
          AddPosCheck := trim(qDetSale.FieldByName('Det_Text').AsString)
        else
          AddPosCheck := '';
      except
        AddPosCheck := '';
      end;
      TaxBill.AddPosition(
        qDetSale.FieldByName('np_type').AsInteger,
        qDetSale.FieldByName('dim_id').AsInteger,
        AddPosDate,
        FRound(qDetSale.FieldByName('count').AsFloat,6),
        qDetSale.FieldByName('Price').AsFloat,
        AddPosCheck);
      qDetSale.Next;
    End;
    if TaxBill.Options.Num = '' then
      TaxBill.Options.Num:=TaxBill.GetNextNumber(StrToDate(TaxBill.Options.Date));
    work_log(TranslateText('�������� ����� ��'));          
    tmpNum:=TaxBill.Options.Num;
    TaxBill.Make;
    work_log(TranslateText('�� �������/��������������� (CommitSql)'));
    if(nn_id = -1)and(nn_inst = -1)then
      ShowMessage(Format(infCreateTax,[tmpNum]))
    else
      ShowMessage(Format(infEditTax,[tmpNum]));
    work_log(TranslateText('������ ��������� � ���������� ��������'));
  Finally
    work_log(TranslateText('Finally ������'));
    TaxBill.Free;
    work_log(TranslateText('TaxBill.Free ������'));
  end;
end;

procedure TSlBookForm.SaveCorr();
var
  CorrChangeType: String;
  IsEmptyCorr :boolean;
  price,count_:real;
  TaxBill: TdmTaxBill;
begin
  TaxBill := TdmTaxBill.Create;
  Try
    IsEmptyCorr := True;
    if(to_ <>-1)and(to_inst<>-1)then
    begin
      TaxBill.Options.ToId := to_;
      TaxBill.Options.ToInst := to_inst;
    end;
    // �������� �������������
    TaxBill.Options.FromId := from_;
    TaxBill.Options.FromInst := from_inst;
    If(From_AZS <> -1)and(From_AZS_inst <> -1)then
    begin
      TaxBill.Options.FromAzsId := From_AZS;
      TaxBill.Options.FromAzsInst := From_AZS_inst;
    end;
    if eTaxNum.Text <> '' then
      TaxBill.Options.CorrNum := eTaxNum.Text;
    if(nn_id<>-1)and(nn_id<>-1)then
    begin
      TaxBill.Options.TaxBillId := nn_id;
      TaxBill.Options.TaxBillInst := nn_inst;
    end;
    TaxBill.Options.Num := NN_NUM_FOR_CORR;
    TaxBill.Options.TaxBillId_Link := NN_ID_FOR_CORR;
    TaxBill.Options.TaxBillInst_Link := NN_INST_FOR_CORR;
    TaxBill.Options.Date := FormatDateTime2('dd.mm.yyyy',deTaxDate.date);
    TaxBill.Options.ByDogName := trim(eDoc.text);
    TaxBill.Options.OperName := trim(cbFormRasch.Text);
    TaxBill.Options.TaxBillType := 8; // �������������
    TaxBill.Options.OIL_NN_Type := qType['id'];
    TaxBill.Options.OIL_NN_Cause := qCause['id'];
    TaxBill.Options.Locked := UnLock;
    qDetSaleCorr.First;
    while not(qDetSaleCorr.Eof) do
    begin
      //���� ������� ���� ��������, �� ������ ����� ����������
      if( qDetSaleCorr.FieldByName('SUM_CORR_GRID').IsNull)or//��� ����� ������� ��� ����� ������ �� ���������
        ((Fround(qDetSaleCorr.FieldByName('SUM_CORR_GRID').AsFloat) = Fround(qDetSaleCorr.FieldByName('SUMM').AsFloat)) and
         (Fround(qDetSaleCorr.FieldByName('COUNT_CORR_GRID').AsFloat) = Fround(qDetSaleCorr.FieldByName('COUNT_').AsFloat)) and
         (Fround(qDetSaleCorr.FieldByName('PRICE_CORR_GRID').AsFloat) = Fround(qDetSaleCorr.FieldByName('PRICE').AsFloat)) and
         (Fround(qDetSaleCorr.FieldByName('PRICE_NO_NDS_CORR_GRID').AsFloat) = Fround(qDetSaleCorr.FieldByName('PRICE_NO_NDS').AsFloat))
        )or
        ( (Fround(qDetSaleCorr.FieldByName('PRICE_CORR_GRID').AsFloat) = 0)and
          (Fround(qDetSaleCorr.FieldByName('COUNT_CORR_GRID').AsFloat) = 0))
      then
      else
      begin
        if(FRound(qDetSaleCorr.FieldByName('count_corr_grid').AsFloat,6) = FRound(qDetSaleCorr.FieldByName('count_').AsFloat,6))then
        begin
          CorrChangeType := 'P';//���� ���������� ����
          count_ := FRound(qDetSaleCorr.FieldByName('count_').AsFloat,6)
        end
        else
        begin
          CorrChangeType := 'C';//���� ���������� ����������
          count_ := FRound(qDetSaleCorr.FieldByName('count_corr_grid').AsFloat,6) - FRound(qDetSaleCorr.FieldByName('count_').AsFloat,6);
        end;
        if(FRound(qDetSaleCorr.FieldByName('Price_corr_grid').AsFloat) = FRound(qDetSaleCorr.FieldByName('Price').AsFloat))then
          price := FRound(qDetSaleCorr.FieldByName('Price').AsFloat)
        else
          price := FRound(qDetSaleCorr.FieldByName('Price_corr_grid').AsFloat) - FRound(qDetSaleCorr.FieldByName('Price').AsFloat);
        IsEmptyCorr := false;
        TaxBill.AddPosition(
          qDetSaleCorr.FieldByName('np_type_corr').AsInteger,
          qDetSaleCorr.FieldByName('dim_id_corr').AsInteger,
          FormatDateTime2('dd.mm.yyyy',deTaxDate.date),
          count_,
          price,
          CorrChangeType
          );
      end;
      qDetSaleCorr.Next;
    end;
    if not IsEmptyCorr then
    begin
      if(nn_id<>-1)and(nn_inst<>-1)then
        TaxBill.DeleteSBRecordsDet(NN_ID,NN_INST,8);
      TaxBill.Make(false);
      if (NN_ID = -1) and (NN_INST = -1) then
        MessageDlg(Format(infCreateTaxCorr,[TaxBill.Options.CorrNum]),mtInformation,[mbOk],0)
      else
        MessageDlg(Format(infEditTaxCorr,[TaxBill.Options.CorrNum]),mtInformation,[mbOk],0);
    end;
  finally
    TaxBill.Free;
  end;
end;

function TSlBookForm.IsCheckCause: boolean;
begin
  if qCause.Active then
    Result := (qCause['id'] = 9)or (qCause['id'] = 26)
  else
    Result := False;
end;

end.
