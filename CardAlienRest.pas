unit CardAlienRest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Mask, ToolEdit, CurrEdit, Db, DBTables, Grids,
  DBGridEh, ExtCtrls, MemTable, uCommonForm,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess{$IFDEF VER150},Variants{$ENDIF};

type
  TCardAlienRestForm = class(TCommonForm)
    pnlLeft: TPanel;
    Panel9: TPanel;
    gridObl: TDBGridEh;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel6: TPanel;
    Panel4: TPanel;
    qGrid: TOilQuery;
    qGridNAME: TStringField;
    qGridLAST_DATE: TDateTimeField;
    qGridSB_COUNT: TFloatField;
    qGridID: TFloatField;
    dsGrid: TOraDataSource;
    Label1: TLabel;
    gridDT: TDBGridEh;
    qDeb: TOilQuery;
    qDebTABLE_NAME: TStringField;
    qDebOPLAT_ONLY: TStringField;
    qDebPRICE: TFloatField;
    qDebSUMMA: TFloatField;
    mtDT: TMemoryTable;
    dsDT: TOraDataSource;
    mtDTCOUNT: TFloatField;
    mtDTPRICE: TFloatField;
    mtDTSUMMA: TFloatField;
    qRest: TOilQuery;
    qRestREST: TFloatField;
    qDebDATE_: TDateTimeField;
    qDebCOUNT: TFloatField;
    Panel3: TPanel;
    Label2: TLabel;
    clcPr: TRxCalcEdit;
    Label6: TLabel;
    Label7: TLabel;
    lblDebSum: TLabel;
    Panel5: TPanel;
    sbClearDebet: TSpeedButton;
    qCred: TOilQuery;
    gridMoney: TDBGridEh;
    mtMoney: TMemoryTable;
    mtMoneyCount: TFloatField;
    mtMoneyPrice: TFloatField;
    mtMoneySumma: TFloatField;
    dsMoney: TOraDataSource;
    mtMoneyDATE_: TDateField;
    mtMoneyNN_NUM: TStringField;
    mtMoneyNP_GROUP_ID: TFloatField;
    mtMoneyNP_GROUP: TStringField;
    qCredTABLE_NAME: TStringField;
    qCredDATE_: TDateTimeField;
    qCredID: TFloatField;
    qCredSUMMA: TFloatField;
    Panel7: TPanel;
    sbClearCredit: TSpeedButton;
    Panel8: TPanel;
    sbDel: TSpeedButton;
    cbAuto: TCheckBox;
    Panel10: TPanel;
    Label3: TLabel;
    clcDebCount: TRxCalcEdit;
    Label4: TLabel;
    clcDebSumma: TRxCalcEdit;
    Label5: TLabel;
    sbMove: TSpeedButton;
    Panel12: TPanel;
    SpeedButton1: TSpeedButton;
    cbMoneyAuto: TCheckBox;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    qMoneyCount: TOilQuery;
    qMoneyCountCO: TFloatField;
    mtDTNP_GROUP: TStringField;
    mtDTNP_GROUP_ID: TFloatField;
    qDebNP_GROUP_ID: TFloatField;
    qGridCT_REST_COUNT: TFloatField;
    qCtRest: TOilQuery;
    qCtRestOBL_ID: TFloatField;
    qCtRestOBL_INST: TFloatField;
    qCtRestSTART_DATE: TDateTimeField;
    qCtRestNP_GROUP_ID: TFloatField;
    qCtRestCOUNT_: TFloatField;
    qCtRestPRICE: TFloatField;
    qCtRestSUMMA: TFloatField;
    qCtRestNN_NUM: TFloatField;
    qCtRestNN_DATE: TDateTimeField;
    qGridSTART_DATE: TDateTimeField;
    Label8: TLabel;
    deNa: TDateEdit;
    qUpdDoc: TOilQuery;
    procedure FormCreate(Sender: TObject);
    procedure FillDebet;
    procedure FillCredit;
    procedure dsGridDataChange(Sender: TObject; Field: TField);
    procedure mtDTCOUNTChange(Sender: TField);
    procedure mtDTPRICEChange(Sender: TField);
    procedure sbClearDebetClick(Sender: TObject);
    procedure sbClearCreditClick(Sender: TObject);
    procedure clcPrChange(Sender: TObject);
    procedure mtDTAfterPost(DataSet: TDataSet);
    procedure dsDTDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DeleteDebet;
    procedure DeleteCredit;
    procedure gridMoneyColumns1EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure sbMoveClick(Sender: TObject);
    procedure clcDebCountChange(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure mtMoneyCountChange(Sender: TField);
    procedure SaveTest;
    procedure SpeedButton1Click(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure gridDTColumns0EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure gridOblGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FillFromCT;
    procedure mtMoneyPriceChange(Sender: TField);
    procedure bbCancelClick(Sender: TObject);
    procedure deNaChange(Sender: TObject);
  private
    { Private declarations }
    AutoCalc: Boolean;
  public
    { Public declarations }
  end;

var
  CardAlienRestForm: TCardAlienRestForm;

implementation

{$R *.DFM}

uses Main,UDbFunc,ExFunc,MoneyFunc,uXMLForm,OilStd;

procedure TCardAlienRestForm.FillDebet;
var sum: real;

    procedure PutToDT(p_Npg_Id:integer;p_Count,p_Price,p_Summa: real);
    begin
        mtDT.First;
        while not mtDT.Eof do begin
            if (FRound(mtDTPrice.AsFloat)=FRound(p_Price))
               and (mtDTNp_Group_id.AsInteger=p_Npg_Id) then break;
            mtDT.Next;
        end;
        if (FRound(mtDTPrice.AsFloat)=FRound(p_Price))
               and (mtDTNp_Group_id.AsInteger=p_Npg_Id) then mtDT.Edit
        else mtDT.Insert;
        mtDTNp_Group_Id.AsInteger:=p_Npg_Id;
        mtDTNp_Group.AsString:=GetSqlValue(
           'select name from oil_np_group where id='+IntToStr(p_Npg_Id));
        mtDTCount.AsFloat:=mtDTCount.AsFloat+p_Count;
        mtDTPrice.AsFloat:=p_Price;
        mtDTSumma.AsFloat:=mtDTSumma.AsFloat+p_Summa;
        mtDT.Post;
    end;

begin
    _OpenQueryPar(qDeb,
       ['oblid',     qGridId.Value,
        'date_',     deNa.Date]);
    sum:=0; GridDT.DataSource:=nil;
    while not qDeb.Eof do begin
        if sum>0 then
           if qDebOplat_Only.AsString='Y' then
              PutToDT(qDebNP_Group_Id.AsInteger,qDebCount.AsFloat,qDebPrice.AsFloat,qDebSumma.AsFloat)
           else clcPr.Value:=FRound(clcPr.Value+qDebSumma.AsFloat,2)
        else begin
            sum:=FRound(sum+qDebSumma.AsFloat,2);
            if sum>0 then
               if qDebOplat_Only.AsString='Y' then
                  PutToDT(qDebNP_Group_Id.AsInteger,FRound(sum/qDebPrice.AsFloat,3),qDebPrice.AsFloat,sum)
               else clcPr.Value:=FRound(clcPr.Value+sum,2)
        end;
        qDeb.Next;
    end;
    GridDT.DataSource:=dsDT;
    clcPrChange(nil);
end;
//==============================================================================
procedure TCardAlienRestForm.FillCredit;
var sum: real;
begin
    _OpenQueryPar(qCred,
       ['oblid',     qGridId.Value,
        'date_',     deNa.Date]);
    mtMoney.Open;
    mtMoney.EmptyTable;
    sum:=0;
    while not qCred.Eof do begin
        if sum<0 then sum:=qCredSumma.AsFloat
        else sum:=FRound(sum+qCredSumma.AsFloat,2);

        if sum<0 then begin
           mtMoney.Insert;
           mtMoneyDate_.Value:=qCredDate_.Value;
           mtMoneyNP_Group.AsString:=GetSqlValue(
               'select name from oil_np_group where id='+IntToStr(OBL_CARD_NP_GROUP));
           mtMoneyNP_Group_Id.AsInteger:=OBL_CARD_NP_GROUP;
           //mtMoneyNN_Num.Value:=null;
           mtMoneyCount.AsFloat:=-Fround(sum/OBL_CARD_PRICE,3);
           mtMoneyPrice.AsFloat:=OBL_CARD_PRICE;
           mtMoneySumma.AsFloat:=-sum;
           mtMoney.Post;
        end;
        qCred.Next;
    end;
end;
//==============================================================================
procedure TCardAlienRestForm.FillFromCT;
begin
    _OpenQueryPar(qCTRest,['oblid', qGridId.Value]);
    deNa.Date:=qCTRestStart_Date.Value;
    while not qCtRest.Eof do begin
        if qCtRestNN_Num.IsNull then // отпуски
           if not qCtRestNp_Group_id.IsNull then begin// невыписанные налооговые, ƒ“
              mtDT.Insert;
              mtDTNp_Group_Id.AsInteger:=qCTRestNp_Group_Id.AsInteger;
              mtDTCount.Value:=qCtRestCount_.Value;
              mtDTPrice.Value:=qCTRestPrice.Value;
              mtDTSumma.Value:=qCTRestSumma.Value;
              mtDT.Post;
           end else clcPr.Value:=qCTRestSumma.AsFloat // выписанные налоговые
        else begin // оплаты
            mtMoney.Insert;
            mtMoneyDate_.Value:=qCTRestNN_Date.Value;
            mtMoneyNN_Num.AsString:=qCTRestNN_Num.AsString;
            mtMoneyNp_Group_Id.AsInteger:=qCTRestNp_Group_Id.AsInteger;
            mtMoneyNp_Group.AsString:=GetSqlValue(
               'select name from oil_np_group where id='+qCTRestNp_Group_id.AsString);
            mtMoneyCount.Value:=-qCtRestCount_.Value;
            mtMoneyPrice.Value:=qCTRestPrice.Value;
            mtMoneySumma.Value:=-qCTRestSumma.Value;
            mtMoney.Post;
        end;
        qCtRest.Next;
    end;
end;
//==============================================================================
procedure TCardAlienRestForm.FormCreate(Sender: TObject);
begin
  inherited;
    mtDT.Open;
    mtMoney.Open;
    _OpenQuery(qGrid);
    AutoCalc:=TRUE;
end;
//==============================================================================
procedure TCardAlienRestForm.dsGridDataChange(Sender: TObject;
  Field: TField);
var OldAutoCalc: Boolean;
begin
    OldAutoCalc:=AutoCalc; AutoCalc:=FALSE;
    DeleteDebet;
    DeleteCredit;
    if qGridCt_Rest_Count.AsInteger>0 then FillFromCt
    else begin
        if (Sender as TComponent).Name<>'deNa' then
           deNa.Date:=VarToDateTime(OBL_CARD_START_DATE);
        _OpenQueryPar(qRest,
          ['oblid',    qGridId.Value,
           'date_',    deNa.Date]);
        if qRestRest.AsFloat>=0 then FillDebet
        else FillCredit;
    end;
    AutoCalc:=OldAutoCalc;
    clcPrChange(nil);
    gridObl.Hint:=qGridName.AsString;
end;
//==============================================================================
procedure TCardAlienRestForm.mtDTCOUNTChange(Sender: TField);
begin
    if cbAuto.Checked and AutoCalc then mtDTSumma.AsFloat:=FRound(mtDTCount.AsFloat*mtDTPrice.AsFloat,2);
end;
//==============================================================================
procedure TCardAlienRestForm.mtDTPRICEChange(Sender: TField);
begin
    if cbAuto.Checked and AutoCalc then mtDTSumma.AsFloat:=FRound(mtDTCount.AsFloat*mtDTPrice.AsFloat,2);
end;
//==============================================================================
procedure TCardAlienRestForm.DeleteDebet;
var OldAutoCalc:Boolean;
begin
    OldAutoCalc:=AutoCalc; AutoCalc:=FALSE;
    mtDT.Close;
    mtDT.EmptyTable;
    mtDT.Open;
    AutoCalc:=OldAutoCalc;
    clcPr.Value:=0;
end;
//==============================================================================
procedure TCardAlienRestForm.sbClearDebetClick(Sender: TObject);
begin
    if MessageDlg(TranslateText('¬ы уверены, что хотите удалить весь дебет?'),mtConfirmation,[mbYes,mbNo],0)=mrYes then
       DeleteDebet;
end;
//==============================================================================
procedure TCardAlienRestForm.DeleteCredit;
var OldAutoCalc:Boolean;
begin
    OldAutoCalc:=AutoCalc; AutoCalc:=FALSE;
    mtMoney.Close;
    mtMoney.EmptyTable;
    mtMoney.Open;
    AutoCalc:=OldAutoCalc;
end;
//==============================================================================
procedure TCardAlienRestForm.sbClearCreditClick(Sender: TObject);
begin
    if MessageDlg(TranslateText('¬ы уверены, что хотите удалить весь кредит?'),mtConfirmation,[mbYes,mbNo],0)=mrYes then
       DeleteCredit;
end;
//==============================================================================
procedure TCardAlienRestForm.clcPrChange(Sender: TObject);
var DTSum:real;
begin
    DTSum:=StrToFloat(gridDT.GetFooterValue(0,gridDT.Columns[3]));
    lblDebSum.Caption:=FloatToStr(FRound(DTSum+clcPr.Value,2))+TranslateText(' грн.');
end;
//==============================================================================
procedure TCardAlienRestForm.mtDTAfterPost(DataSet: TDataSet);
begin
    clcPrChange(nil);
end;
//==============================================================================
procedure TCardAlienRestForm.dsDTDataChange(Sender: TObject;
  Field: TField);
begin
    if cbAuto.Checked and AutoCalc then begin
       clcDebCount.Value:=mtDTCount.Value;
       clcDebSumma.Value:=mtDTSumma.Value;
    end;
end;
//==============================================================================
procedure TCardAlienRestForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if mtDT.Active then mtDT.Close;
    if mtMoney.Active then mtMoney.Close;
    Action:=caFree;
end;
//==============================================================================
procedure TCardAlienRestForm.gridMoneyColumns1EditButtonClick(
  Sender: TObject; var Handled: Boolean);
var
  vId: integer;
  vName: string;
begin
  if XMLChoose('npgroupref',vId,vName) then begin
    mtMoney.Edit;
    mtMoneyNp_Group_Id.AsInteger:=vId;
    mtMoneyNp_Group.AsString:=vName;
    mtMoney.Post;
  end;
end;
//==============================================================================
procedure TCardAlienRestForm.sbMoveClick(Sender: TObject);
var summa,clc_summa,clc_count: real;
begin
    // делаем так, чтобы списывалось не больше литров и гривен, чем есть
    if FRound(clcDebCount.Value)>FRound(mtDTCount.Value) then
       clcDebCount.Value:=mtDTCount.Value;
    if FRound(clcDebSumma.Value)>FRound(mtDTSumma.Value) then
       clcDebSumma.Value:=mtDTSumma.Value;
    // теперь если списываютс€ все литры, то должны списатьс€ и все гривны
    // и наоборот: если списываютс€ все гривны, то должны списатьс€ и все литры
    if (FRound(clcDebCount.Value)=FRound(mtDTCount.Value)) or
       (FRound(clcDebSumma.Value)=FRound(mtDTSumma.Value)) then begin
       clcDebCount.Value:=mtDTCount.Value;
       clcDebSumma.Value:=mtDTSumma.Value;
    end;
    clcPr.Value:=clcPr.Value+clcDebSumma.Value;
    if FRound(clcDebCount.Value)=FRound(mtDTCount.Value) then mtDT.Delete
    else begin
       clc_summa:=clcDebSumma.Value; clc_count:=clcDebCount.Value;
       mtDT.Edit;
       summa:=mtDTSumma.Value;
       mtDTCount.Value:=FRound(mtDTCount.Value-clc_count,3);
       mtDTSumma.Value:=FRound(summa-clc_summa,2);
       mtDT.Post;
    end;
    clcPrChange(nil);
end;
//==============================================================================
procedure TCardAlienRestForm.clcDebCountChange(Sender: TObject);
begin
    clcDebSumma.Value:=FRound(clcDebCount.Value*mtDTPrice.AsFloat,2);
end;
//==============================================================================
procedure TCardAlienRestForm.sbDelClick(Sender: TObject);
begin
    if MessageDlg(TranslateText('¬ы уверены, что хотите удалить запись?'),mtConfirmation,[mbYes,mbNo],0)=mrYes then mtDT.Delete;
end;
//==============================================================================
procedure TCardAlienRestForm.mtMoneyCountChange(Sender: TField);
begin
    if cbMoneyAuto.Checked and AutoCalc then
       mtMoneySumma.AsFloat:=FRound(mtMoneyCount.AsFloat*mtMoneyPrice.AsFloat);
end;
//==============================================================================
procedure TCardAlienRestForm.SpeedButton1Click(Sender: TObject);
begin
    if MessageDlg(TranslateText('¬ы уверены, что хотите удалить запись?'),mtConfirmation,[mbYes,mbNo],0)=mrYes then mtMoney.Delete;
end;
//==============================================================================
procedure TCardAlienRestForm.SaveTest;
var
  n:integer;
  vDate: string;
begin
    if GetSqlValue(Format(
      ' select count(*) from v_org'+
      ' where state=''Y'' and id=inst and org_type=4 and par=4587 and par=par_inst'+
      '   and id=%s and id=inst',[qGrid['id']]))>0
    then begin
      vDate:=nvl(GetSqlValue(Format(
        ' select min(date_) from card_id_history'+
        '  where state=''Y'' and obl_id=%s ',[qGrid['id']])),'');
      if (vDate<>'') and (DateToStr(deNa.Date)<>vDate) then
        raise exception.create(TranslateText('ќстатки по этой организации должны быть внесены на ')+vDate);
    end;

    if (StrToFloat(gridMoney.GetFooterValue(0,gridMoney.Columns[6]))>0) and
       (StrToFloat(gridDT.GetFooterValue(0,gridDT.Columns[3]))+clcPr.Value>0)
    then
        Raise Exception.Create(TranslateText('ƒебeтова€ и кредитова€ часть не должны быть введены одновременно!!!'));

    if qGridCT_Rest_Count.AsInteger>0 then
       if GetSqlValue(
          ' select count(*) from oil_sale_book '+
          ' where organ=organ_inst and organ='+qGridId.AsString+
          '       and nal_t in (7,8,9) '+
          '       and state=''Y'' '+
          '       and s_date>='''+qGridStart_Date.AsString+'''')>0
       then
          Raise Exception.Create(TranslateText('ѕо данному облу уже были выписаны налоговые накладные за период с ')+qGridStart_Date.AsString);

    _OpenQueryPar(qMoneyCount,
       ['oblid',    qGridId.Value,
        'date_',    deNa.Date]);
    if qMoneyCountCo.AsInteger=0 then
       if MessageDlg(TranslateText('ѕо этому облу не введено ни одной оплаты по карточному договору.')+#13#10+
                     TranslateText('¬ы уверены, что хотите сохранить эти остатки?'),mtWarning,[mbYes,mbNo],0)=mrNo then
          Raise Exception.Create(TranslateText('—охранение отменено'));

    mtMoney.First;
    while not mtMoney.Eof do begin
        if trim(mtMoneyNN_Num.AsString)='' then
           Raise Exception.Create(TranslateText('Ќе во всех позици€х по кредиту проставлены номера налоговых!!!'));
        mtMoney.Next;
    end;
end;
//==============================================================================
procedure TCardAlienRestForm.bbOkClick(Sender: TObject);

    procedure AddRow(p_Np_Group_Id,p_Count,p_Price,p_Summa,p_NN_Num,p_NN_Date: Variant);
    var id: integer;
    begin
        id:=GetSeqNextVal('S_OIL_CT_REST');
        _ExecProc('OIL.INSORUPDOIL_CT_REST',
           ['ID#',           id,
            'STATE#',        'Y',
            'INST#',         REAL_INST,
            'OBL_ID#',       qGridId.AsInteger,
            'OBL_INST#',     qGridId.AsInteger,
            'START_DATE#',   deNa.Date,
            'NP_GROUP_ID#',  p_Np_Group_Id,
            'COUNT_#',       p_Count,
            'PRICE#',        p_Price,
            'SUMMA#',        p_Summa,
            'NN_NUM#',       p_NN_Num,
            'NN_DATE#',      p_NN_Date],TRUE);
    end;

begin
    AutoCalc:=FALSE;
    if mtDT.State in [dsEdit,dsInsert] then mtDT.Post;
    if mtMoney.State in [dsEdit,dsInsert] then mtMoney.Post;
    SaveTest;
    StartSQL;
  try
    _ExecSql(' update oil_ct_rest set state=''N'' '+
             ' where obl_id='+qGridId.AsString+' and obl_inst=obl_id '+
             '       and inst='+IntToStr(REAL_INST));
    with qUpdDoc do begin
      if Active then Close;
      ParamByName('date_').Value:=deNa.Date;
      ParamByName('obl_id').Value:=qGridId.AsInteger;
      __ExecSql(qUpdDoc);
    end;
    mtDT.First;
    while not mtDT.Eof do begin
        AddRow(mtDTNp_Group_Id.Value,mtDTCount.Value,mtDTPrice.Value,mtDTSumma.Value,null,null);
        mtDT.Next;
    end;
    AddRow(null,null,null,clcPr.Value,null,null);
    mtMoney.First;
    while not mtMoney.Eof do begin
        AddRow(mtMoneyNp_Group_Id.Value,-mtMoneyCount.Value,
               mtMoneyPrice.Value,-mtMoneySumma.Value,
               mtMoneyNN_Num.Value,mtMoneyDate_.Value);
        mtMoney.Next;
    end;
    CommitSQL;
    SaveCardAlienDoc(qGridId.AsInteger,deNa.Date-1);
    CommitSqlOra;
    if qGrid.Active then qGrid.Close;
    _OpenQuery(qGrid);
    AutoCalc:=TRUE;
  except
    on E: Exception do begin
       RollbackSql; AutoCalc:=TRUE;
       MessageDlg(TranslateText('¬ процессе сохранени€ произошла ошибка: ')+#13#10+E.Message,mtError,[mbOk],0);
    end;
  end;
end;
//==============================================================================
procedure TCardAlienRestForm.gridDTColumns0EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  vId: integer;
  vName: string;
begin
  if XMLChoose('npgroupref',vId,vName) then begin
    mtDT.Edit;
    mtDTNp_Group_Id.AsInteger:=vId;
    mtDTNp_Group.AsString:=vName;
    mtDT.Post;
  end;
end;
//==============================================================================
procedure TCardAlienRestForm.gridOblGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
    if qGridCt_Rest_Count.AsInteger>0 then begin
       AFont.Color:=clBlue;
       AFont.Style:=AFont.Style+[fsBold];
    end;
end;
//==============================================================================
procedure TCardAlienRestForm.mtMoneyPriceChange(Sender: TField);
begin
    if cbMoneyAuto.Checked and AutoCalc then
       mtMoneySumma.AsFloat:=FRound(mtMoneyCount.AsFloat*mtMoneyPrice.AsFloat);
end;

procedure TCardAlienRestForm.bbCancelClick(Sender: TObject);
begin
    Close; 
end;

procedure TCardAlienRestForm.deNaChange(Sender: TObject);
begin
   if qGridCt_Rest_Count.AsInteger=0 then dsGridDataChange(Sender,nil);
end;

end.
