unit CardRNAlienPrint;
{### 1.01}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolEdit, StdCtrls, Mask, ExtCtrls, Db, DBTables, MemTable, Buttons,
  Grids, DBGridEh, ComCtrls, ActiveX, ComObj, Excel8TLB, Ora,
  Menus, uCommonForm,uOilQuery,uOilStoredProc, MemDS, DBAccess
  {$IFDEF VER150},Variants, OleServer, ExcelXP, GridsEh{$ENDIF};

const DOC_DIR = 'Чужие списания';

type
  TCardRNAlienPrintForm = class(TCommonForm)
    Panel3: TPanel;
    q: TOilQuery;
    mtDT: TMemoryTable;
    mtDTCOUNT: TFloatField;
    mtDTPRICE: TFloatField;
    mtDTSUMMA: TFloatField;
    mtOpl: TMemoryTable;
    mtOplNUMBER: TStringField;
    mtOplDATE_: TDateField;
    mtOplCOUNT: TFloatField;
    mtOplSUMMA: TFloatField;
    mtDTNP_GROUP_ID: TFloatField;
    qReport: TOilQuery;
    qReportID: TFloatField;
    qReportSTATE: TStringField;
    qReportINST: TFloatField;
    qReportDOG: TStringField;
    qReportDOG_DATE: TDateTimeField;
    qReportEXP_DATE: TDateTimeField;
    qReportFROM_: TFloatField;
    qReportFROM_INST: TFloatField;
    qReportTO_: TFloatField;
    qReportTO_INST: TFloatField;
    qReportCOMM: TStringField;
    qReportNP_TYPE: TFloatField;
    qReportDIM_ID: TFloatField;
    qReportPRICE: TFloatField;
    qReportCOUNT_: TFloatField;
    qReportDOG_TYPE: TStringField;
    qReportR_FROM_: TFloatField;
    qReportR_FROM_INST: TFloatField;
    qReportR_TO_: TFloatField;
    qReportR_TO_INST: TFloatField;
    qReportBARTERNP: TFloatField;
    qReportDATE_MOD: TDateTimeField;
    qReportFOREPAY: TFloatField;
    qReportPAY_TYPE: TFloatField;
    qReportPAY_CORR: TFloatField;
    qReportFROM_ADDR: TStringField;
    qReportFROM_SVID_NUM: TStringField;
    qReportFROM_NAL_NUM: TStringField;
    qReportFROM_BOSS: TStringField;
    qReportFROM_OKPO: TStringField;
    qReportFROM_PHONE: TStringField;
    qReportFROM_RACH_CHET: TStringField;
    qReportFROM_BANK_NAME: TStringField;
    qReportFROM_MFO: TStringField;
    qReportTO_ADDR: TStringField;
    qReportTO_SVID_NUM: TStringField;
    qReportTO_NAL_NUM: TStringField;
    qReportTO_BOSS: TStringField;
    qReportTO_OKPO: TStringField;
    qReportTO_PHONE: TStringField;
    qReportTO_RACH_CHET: TStringField;
    qReportTO_BANK_NAME: TStringField;
    qReportTO_MFO: TStringField;
    qReportTO_FACE: TFloatField;
    qReportPASSP_SER: TStringField;
    qReportPASSP_NUM: TStringField;
    qReportPASSP_WHOM: TStringField;
    qReportPASSP_WHEN: TDateTimeField;
    qReportUP_FROM_NAME: TStringField;
    qReportUP_FROM_ADDR: TStringField;
    qReportUP_FROM_PHONE: TStringField;
    qReportUP_FROM_SVID_NUM: TStringField;
    qReportUP_FROM_NAL_NUM: TStringField;
    qReportNP_GROUP_ID: TFloatField;
    mtOplNN_ID: TFloatField;
    qPrilNum: TOilQuery;
    qDates: TOilQuery;
    qPrilNumNEXT_NUMBER: TFloatField;
    qDatesDATE_: TDateTimeField;
    qRN: TOilQuery;
    qRNNP_NAME: TStringField;
    qRNFILIAL_NAME: TStringField;
    qRNAZS_NAME: TStringField;
    qRNCARD_NUMBER: TFloatField;
    qRNOPER_DATE: TDateTimeField;
    qRNCHECK_NUMBER: TStringField;
    qRNAZS_ID: TFloatField;
    qRNDOC_NUMBER: TStringField;
    qRNDOC_DATE: TDateTimeField;
    qRNLITR: TFloatField;
    qRNPRICEXNDS: TFloatField;
    qRNSUMXNDS: TFloatField;
    qRNNDS: TFloatField;
    qRNPRICENDS: TFloatField;
    qRNSUMNDS: TFloatField;
    qRNDIM_NAME: TStringField;
    qRNFULL_AZS_NAME: TStringField;
    qNN: TOilQuery;
    qNNNUM: TStringField;
    qNNF_DOC: TStringField;
    qNNFRASCH: TStringField;
    qNNR_DATE: TDateTimeField;
    qNNKOL: TFloatField;
    qNNTOV_ID: TFloatField;
    qNNNP_NAME: TStringField;
    qNNDIM_NAME: TStringField;
    qNNDIV_ID: TFloatField;
    qNNNDS_T: TFloatField;
    qNNNDS_P_BASE: TFloatField;
    qNNNDS_P_20: TFloatField;
    qNNPRICEXNDS: TFloatField;
    Panel2: TPanel;
    pbDet: TProgressBar;
    pbMain: TProgressBar;
    reLog: TRichEdit;
    pnlRight: TPanel;
    Panel4: TPanel;
    gridMain: TDBGridEh;
    qGridBase: TOilQuery;
    dsGrid: TOraDataSource;
    pnlPrint: TPanel;
    Label1: TLabel;
    deBegin: TDateEdit;
    Label2: TLabel;
    deEnd: TDateEdit;
    bbPrint: TBitBtn;
    Label3: TLabel;
    cbPrint: TCheckBox;
    pnlForm: TPanel;
    bbCreateDoc: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    deForm: TDateEdit;
    mtOplNN_NUMBER: TStringField;
    qKorrNum: TOilQuery;
    qKorr: TOilQuery;
    qKorrOne: TOilQuery;
    dsKorr: TOraDataSource;
    qDoc: TOilQuery;
    qDocTABLE_NAME: TStringField;
    qDocDATE_: TDateTimeField;
    qDocNN_ID: TFloatField;
    qDocNN_INST: TFloatField;
    qRest: TOilQuery;
    qRestREST: TFloatField;
    qRestDet: TOilQuery;
    qRestDetNUM: TFloatField;
    qRestDetDATE_: TDateTimeField;
    qRestDetSUMMA: TFloatField;
    qGridBaseID: TFloatField;
    qGridBaseNAME: TStringField;
    qGridBaseSTART_DATE: TDateTimeField;
    qCtRest: TOilQuery;
    qCtRestOBL_ID: TFloatField;
    qCtRestOBL_INST: TFloatField;
    qCtRestSTART_DATE: TDateTimeField;
    qCtRestNP_GROUP_ID: TFloatField;
    qCtRestCOUNT_: TFloatField;
    qCtRestPRICE: TFloatField;
    qCtRestSUMMA: TFloatField;
    qCtRestNN_DATE: TDateTimeField;
    qCtRestNN_NUM: TFloatField;
    mtOplNP_GROUP_ID: TFloatField;
    mtOplPRICE: TFloatField;
    qORD_NUM: TFloatField;
    qTABLE_NAME: TStringField;
    qID_NAME: TStringField;
    qINST_NAME: TStringField;
    qID: TFloatField;
    qINST: TFloatField;
    qNN_ID: TFloatField;
    qNN_INST: TFloatField;
    qNN_NUM: TStringField;
    qNUM: TFloatField;
    qDATE_: TDateTimeField;
    qOBLID: TFloatField;
    qNP_GROUP_ID: TFloatField;
    qDIM_ID: TFloatField;
    qCOUNT: TFloatField;
    qPRICE: TFloatField;
    qSUMMA: TFloatField;
    qDOC_NUMBER: TStringField;
    qOPLAT_ONLY: TStringField;
    qKorrNumNEXT_NUMBER: TFloatField;
    qKorrS_DATE: TDateTimeField;
    qKorrORGAN: TFloatField;
    qKorrORGAN_INST: TFloatField;
    qKorrNUM2: TStringField;
    qKorrF_DOC: TStringField;
    qKorrFRASCH: TStringField;
    qKorrR_DATE: TDateTimeField;
    qKorrSALE_TXT: TStringField;
    qKorrTOV_ID: TFloatField;
    qKorrDIV_ID: TFloatField;
    qKorrKOL: TFloatField;
    qKorrFROM_: TFloatField;
    qKorrFROM_INST: TFloatField;
    qKorrNAL_T: TFloatField;
    qKorrAZS_ID: TFloatField;
    qKorrAZS_INST: TFloatField;
    qKorrDATE_MOD: TDateTimeField;
    qKorrLOCK_: TFloatField;
    qKorrID: TFloatField;
    qKorrINST: TFloatField;
    Panel5: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    sbDel: TBitBtn;
    deDel: TDateEdit;
    qGridBaseNEXT_DATE: TDateTimeField;
    cbOrig: TCheckBox;
    cbCopy: TCheckBox;
    Panel1: TPanel;
    bbCancel: TBitBtn;
    qReportSUB_TYPE: TFloatField;
    qGrid: TMemoryTable;
    qGridID: TFloatField;
    qGridNAME: TStringField;
    qGridSTART_DATE: TDateField;
    qGridNEXT_DATE: TDateField;
    qGridBaseNEXT_NUM: TFloatField;
    qGridNEXT_NUM: TFloatField;
    qGridBaseISBETWEENFIL: TStringField;
    qGridISBETWEENFIL: TStringField;
    qGridBaseRN_THROUGH: TStringField;
    qGridRN_THROUGH: TStringField;
    pm: TPopupMenu;
    N1: TMenuItem;
    qGridBaseDOCSEXISTS: TStringField;
    qGridDOCSEXISTS: TStringField;
    qFilRn: TOilQuery;
    qAviso: TOilQuery;
    qAvisoNUM: TFloatField;
    qAvisoDATE_: TDateTimeField;
    qAvisoFROM_ID: TFloatField;
    qAvisoFROM_INST: TFloatField;
    qAvisoTO_ID: TFloatField;
    qAvisoTO_INST: TFloatField;
    qAvisoSUMM: TFloatField;
    qAvisoFROM_NAME: TStringField;
    qAvisoTO_NAME: TStringField;
    qNNPRICENDS: TFloatField;
    qAvisoRN_TYPE: TFloatField;
    qAvisoAVIZO_NUM: TFloatField;
    qReportFROM_NAME: TStringField;
    qReportTO_NAME: TStringField;
    cbUnion: TCheckBox;
    qAvisoBEGIN_DATE: TDateTimeField;
    qAvisoEND_DATE: TDateTimeField;
    qReestr: TOilQuery;
    qRnPrintUnion: TOilQuery;
    qRnDetPrintUnion: TOilQuery;
    qRnPrint: TOilQuery;
    qRnDetPrint: TOilQuery;
    cbSplitDT: TCheckBox;
    qAvisoCOUNT_: TFloatField;
    (** Процудера формирует документы по чужим списаниям для облов *)
    procedure CreateOblNN(p_OblId: integer; p_BeginDate,p_EndDate: TDateTime);
    procedure FormCreate(Sender: TObject);
    procedure bbCreateDocClick(Sender: TObject);
    (** Процедура печатает документы для обла за конкретную дату
       @MakeRashNakl(внутреняя) - расходную накладную
       @MakePril(внутреняя) - приложение к договору
       @MakeNN - налоговая накладная
       @MakeKorr(внутреняя) - корректировку   *)
    procedure CreateOblDoc(p_OblId: integer; p_Date: TDateTime; XLApp,List: Variant);
   (** Процедура печати документов в периоде
      в зависимости от параметра
      @p_IsBetweenFil = true -  формирует филиальный пакет документов по средствам процедур :
        @PrintDocsFil(внутреняя)
          @PrintRashNakAlienFil - РН ежедневная
          @PrintRashNakAlienFilUnion - РН за период
          @PrintAvisoAlienFil - АВИЗО
      @p_IsBetweenFil = false - формирует пакет документов для облов по средством процедур
        @PrintDocsUsual(внутреняя)
          @CreateOblDoc - если полный пакет документов
            @MakeRashNakl(внутреняя) - расходную накладную
            @MakePril(внутреняя) - приложение к договору
            @MakeNN - налоговая накладная
            @MakeKorr(внутреняя) - корректировку
          @MakeNN - если только нологовая   *)
    procedure CreateOblDocs(
      p_OblId:integer;
      p_BeginDate,p_EndDate: TDateTime;
      p_IsBetweenFil: Boolean);
    procedure bbPrintClick(Sender: TObject);
    (** Выводит на печать налоговуй накладную  *)
    procedure MakeNN(XLApp,List:Variant;ANDSRes:real=0);
    procedure gridMainGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure dsGridDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Log(p_Str: string);
    procedure sbDelClick(Sender: TObject);
    procedure cbPrintClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    (** В процедуре создаються расходные по межфилиальным
     перемещениям - CR_CARD_ALFIL_RN *)
    procedure CreateFilRN(
      p_OblId: integer;
      p_OblName: string;
      p_BeginDate,p_EndDate: TDateTime;
      p_Through: string;
      p_StartNum: integer;
      p_Union: boolean;
      p_SplitDT: boolean);
    procedure qGridBeforePost(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure qGridAfterPost(DataSet: TDataSet);
    procedure dsGridStateChange(Sender: TObject);
    procedure gridMainMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cbUnionClick(Sender: TObject);
  private
    { Private declarations }
    CTPCreated: Boolean;

    procedure PrintRashNakAlienFil(p_Id,p_Inst: integer; XLApp,List: Variant);
    procedure PrintAvisoAlienFil(p_Id, p_Inst: integer; XLApp, List: Variant);
    procedure PrintReestrAlienFil(p_Id, p_Inst: integer; XLApp, List: Variant);
  public
    { Public declarations }
  end;

var
  CardRNAlienPrintForm: TCardRNAlienPrintForm;



implementation

{$R *.DFM}

uses UDbFunc,ExFunc,ExcelFunc,MoneyFunc,OilStd,Main,UMessageDlgExt,Passw,
  uStart, uCrypt, uExeSql,TaxBillPrint,Progr, uTestLaunch;

var KorrBounds: array [1..16] of string =
       ('A','C','G','N','Q','T','W','Z','AC','AF','AI','AL','AP','AT','AX','BB');

//==============================================================================
procedure TCardRNAlienPrintForm.Log(p_Str: string);
begin
    reLog.Lines.Add(p_Str);
    reLog.Repaint;
end;
//==============================================================================
procedure TCardRNAlienPrintForm.CreateFilRN(
  p_OblId: integer;
  p_OblName: string;
  p_BeginDate,p_EndDate: TDateTime;
  p_Through: string;
  p_StartNum: integer;
  p_Union: boolean;
  p_SplitDT: boolean);
begin
  if p_Through='' then begin
    reLog.Lines.Add(TranslateText('... поле "через кого" не заполнено'));
    showmessage(p_OblName+':'+#13#10+TranslateText('поле "через кого" не заполнено'));
  end else begin
    log(GetOrgName(p_OblId,p_OblId));
    _ExecProcOra('CARD.CREATE_ALIEN_FIL_RN',
      ['P_OBLID',     p_OblId,
       'P_DATEBEGIN', p_BeginDate,
       'P_DATEEND',   p_EndDate,
       'P_STARTNUM',  p_StartNum,
       'P_THROUGH',   p_Through,
       'P_UNION',     BoolTo_(p_Union,1,0),
       'p_SplitDT',   BoolTo_(p_SplitDT,1,0)]);
    _ExecProc('CARD.SAVE_ALIEN_DOC',
      ['p_OblId',     p_OblId,
       'p_Date',      p_EndDate]);
    CommitSqlOra;
  end;
end;
//==============================================================================
procedure TCardRNAlienPrintForm.CreateOblNN(p_OblId: integer; p_BeginDate,p_EndDate: TDateTime);
var Spr,SumDT,SumOpl,summa,count: real;
    CurDate: TDateTime;
    newcount: real;
    korrcount,korrsumma,korrnds: real;
    CurNNId,PrilNum,KorrNum:integer;
    NNCreated:Boolean;
    CurNNNum,CurNalNum:string;
    LogFileName: string;
    //**************************************************************************
    procedure clog(s: string; n: integer = 0);
    var i: integer;
    begin
      if not SysParamExists('CARDALIENLOG') then exit;
      for i:=1 to n do
        s:='  '+s;
      exfunc.log(LogFileName,s);
    end;
    //**************************************************************************
    procedure Test;
    begin
    end;
    //**************************************************************************
    procedure _StartSql;
    begin
        if frmStart.ORASESSION1.InTransaction then
           frmStart.ORASESSION1.Commit;
        StartSql;
    end;
    //**************************************************************************
    procedure SetDocNumbers;
    begin
        if frmStart.ORASESSION1.InTransaction then
           Raise Exception.Create(TranslateText('SetDocNumbers: неверный вызов внутри тразакции'));
        _StartSql;
        if qPrilNum.Active then qPrilNum.Close;
        _OpenQueryPar(qPrilNum,
          ['obl_id',       p_OblId]);
        PrilNum:=qPrilNumNext_Number.AsInteger;
        clog(TranslateText('проставляю номера расходных начиная с ')+IntToStr(PrilNum));

        if qDates.Active then qDates.Close;
        DefineQParams(qDates,
           ['begindate', p_BeginDate,
            'enddate',   p_EndDate,
            'obl_id',    p_OblId]);
        _OpenQuery(qDates);
        while not qDates.Eof do begin
            clog(Format('%s: №%d',[qDatesDate_.AsString,PrilNum]),1);
            _ExecSql(' update card_transit set doc_number='''+IntToStr(PrilNum)+''' '+
                     ' where to_date(oper_date)='''+qDatesDate_.AsString+''' '+
                     '       and card.GetObl(card_number,oper_date)='''+IntToStr(p_OblId)+''' ');
            inc(PrilNum);
            qDates.Next;
        end;
        qDates.Close;
        CommitSql;
        clog(TranslateText('номера расходных проставлены'));
    end;
    //**************************************************************************
    procedure CreateNN(p_NAL_T:integer);
    var f_doc:string;
        num,sname: string;
    begin
        if qDate_.Value<p_BeginDate then exit;
        if p_NAL_T=8 then begin
           _OpenQueryPar(qKorrNum,['nal_num',mtOplNN_Number.Value]);
           num:=qKorrNumNext_Number.AsString+'/'+mtOplNN_Number.AsString;
           sname:=TranslateText('корректировка');
        end else begin
           num:=IntToStr(GetSeqNextVal('nal_nakl_num'));
           CurNNNum:=num;
           sname:=TranslateText('налоговая');
        end;
        CurNNId:=GetSeqNextVal('s_oil_sale_book');
        f_doc:=TranslateText('Согласно договора № ')+qReportDog.AsString+TranslateText(' от ')+FormatDateTime2('dd.mm.yyyy', qReportDog_Date.AsDateTime);
        if not qDoc_Number.IsNull then begin
           f_doc:=f_doc+TranslateText(' приложение ')+qDoc_Number.AsString+TranslateText(' от ')+FormatDateTime2('dd.mm.yyyy', qDate_.AsDateTime);
        end;
        CurNalNum:=num;
        _StartSQL;
        _ExecProc('OIL.INSORUPDOIL_SALE_BOOK',
           ['ID#',         CurNNId,
            'STATE#',      'Y',
            'INST#',       MAIN_ORG.INST,
            'S_DATE#',     qDate_.Value,
            'ORGAN#',      p_OblId,
            'ORGAN_INST#', p_OblId,
            'NUM#',        num,
            'F_DOC#',      f_doc,
            'FRASCH#',     TranslateText('Оплата с р/с, п.п.№ ')+qNum.AsString,
            'R_DATE#',     qDate_.Value,
            'SALE_TXT#',   TranslateText('Оплата с р/с'),
            'FROM_#',      MAIN_ORG.INST,
            'FROM_INST#',  MAIN_ORG.INST,
            'NAL_T#',      p_NAL_T,
            'NN_CAUSE_ID#',4,
            'NN_TYPE_ID#', decode([p_NAL_T,8,3,2]),
            'NN_ID#',      decode([p_NAL_T,8,mtOplNN_ID.AsInteger,null]),
            'NN_INST#',    decode([p_NAL_T,8,MAIN_ORG.INST,null])
            ],TRUE);
        NNCreated:=TRUE;
        clog(format(TranslateText('новая %s №%s, id=%d'),[sname,num,CurNNId]),2);
    end;
    //**************************************************************************
    procedure CreateNNDet(p_NPG_Id:integer; p_Count,p_Price,p_Summa,p_Nds: real; p_Type: char);
    // p_Type='N' - налоговая, 'K' - корректировка
    var nds_t,nds_p_base,nds_p_20,k_nds_b,k_nds_20: Variant;
    begin
        if qDate_.Value<p_BeginDate then exit;
        case p_Type of
             'N': begin
                 nds_t:=p_Summa;
                 nds_p_base:=GetNoNds_WithNDS(p_Summa,CurDate);
                 nds_p_20:=GetNDS_WithNDS(p_Summa,CurDate);
                 k_nds_b:=null; k_nds_20:=null;
                 clog(format(TranslateText('деталь налоговой на сумму %.2f'),[p_Summa]),2);
             end;
             'K': begin
                 k_nds_b:=FRound(p_Summa-p_Nds);
                 k_nds_20:=p_Nds;
                 nds_t:=null; nds_p_base:=null; nds_p_20:=null;
                 clog(format(TranslateText('деталь корректировки на сумму %.2f'),[p_Summa]),2);
             end;
        end;
        _ExecProc('OIL.INSORUPDOIL_SALE_BOOK_DET',
           ['ID#',         GetSeqNextVal('s_oil_sale_book_det'),
            'STATE#',      'Y',
            'INST#',       MAIN_ORG.INST,
            'NN_ID#',      CurNNId,
            'NN_INST#',    MAIN_ORG.INST,
            'NDS_T#',      nds_t,
            'NDS_P_BASE#', nds_p_base,
            'NDS_P_20#',   nds_p_20,
            'K_NDS_B#',    k_nds_b,
            'K_NDS_20#',   k_nds_20,
            'TOV_ID#',     p_NPG_id,
            'DIV_ID#',     28,
            'KOL#',        p_count],TRUE);
    end;
    //**************************************************************************
    procedure CloseNN;
    begin
        if qDate_.Value<p_BeginDate then begin
           KorrCount:=0; KorrSumma:=0; KorrNds:=0;
           exit;
        end;

        if KorrCount<>0 then begin
           CreateNNDet(mtOplNp_Group_Id.AsInteger,-KorrCount,mtOplPrice.Value,-KorrSumma,-KorrNds,'K');
           KorrCount:=0; KorrSumma:=0; KorrNds:=0;
           log(TranslateText('Корректировка №')+CurNalNum);
           clog(TranslateText('корректировка закрыта'),2);
        end else begin
           log(TranslateText('Налоговая накладная №')+CurNalNum);
           clog(TranslateText('налоговая закрыта'),2);
        end;
        NNCreated:=FALSE;
        CommitSql;
    end;
    //**************************************************************************
    procedure ActivateQueries;
    begin
        _OpenQueryPar(qReport,
           ['orgid',   p_OblId,
            'orginst', p_OblId]);
        if qReport.RecordCount=0 then
           Raise Exception.Create(TranslateText('С облом ')+GetOrgName(p_OblId,p_OblId)+TranslateText(' не заключен долгосрочный договор'));
        clog(Format(TranslateText('запрос по договорам открыт, %d записей'),[qReport.RecordCount]));

        _OpenQueryPar(q,
           ['oblid',     p_OblId,
            'begindate', qGridStart_Date.Value,
            'enddate',   p_EndDate]);
        clog(Format(TranslateText('основной запрос открыт, %d записей'),[q.RecordCount]));
    end;
    //**************************************************************************
    procedure UpdateNN_ID;
    begin
        if qDate_.Value<p_BeginDate then exit;
        if not NNCreated then Raise Exception.Create(TranslateText('UpdateNN_ID: неверный вызов при NN_Created=FALSE'));
        _ExecSql(' update '+qTable_Name.AsString+
                 ' set nn_id='+IntToStr(CurNNId)+','+
                 '     nn_inst='+IntToStr(MAIN_ORG.INST)+
                 ' where '+qId_Name.AsString+'='+qId.AsString+
                 '       and '+qInst_Name.AsString+'='+qInst.AsString);
    end;
    //**************************************************************************
    procedure ClearValues;
    begin
        if mtDT.Active then mtDT.Close;
        mtDT.EmptyTable;
        mtDT.Open;
        if mtOpl.Active then mtOpl.Close;
        mtOpl.EmptyTable;
        mtOpl.Open;
        Spr:=0; SumDT:=0; SumOpl:=0;
    end;
    //**************************************************************************
    procedure GetStartValues;
    begin
        ClearValues;
        _OpenQueryPar(qCTRest,['oblid', qGridId.Value]);
        clog(Format(TranslateText('запрос с остатками открыт, %d записей'),[qGrid.RecordCount]));
        while not qCtRest.Eof do begin
            if qCtRestNN_Num.IsNull then // отпуски
               if not qCtRestNp_Group_id.IsNull then begin// невыписанные налооговые, ДТ
                  mtDT.Insert;
                  mtDTNp_Group_Id.AsInteger:=qCTRestNp_Group_Id.AsInteger;
                  mtDTCount.Value:=qCtRestCount_.Value;
                  mtDTPrice.Value:=qCTRestPrice.Value;
                  mtDTSumma.Value:=qCTRestSumma.Value;
                  mtDT.Post;
                  SumDT:=SumDT+qCTRestSumma.AsFloat;
                  clog(Format(TranslateText('отпуск кассовый метод, сумма=%.2f'),[qCTRestSumma.AsFloat]),1);
               end else begin
                  Spr:=qCTRestSumma.AsFloat; // выписанные налоговые
                  clog(Format(TranslateText('отпуск, сумма=%.2f'),[Spr]),1);
               end
            else begin // оплаты
               mtOpl.Insert;
               mtOplDate_.Value:=qCTRestNN_Date.Value;
               mtOplNN_Number.AsString:=qCTRestNN_Num.AsString;
               if qCTRestNp_Group_Id.AsInteger=0 then
                 mtOplNp_Group_Id.AsInteger:=OBL_CARD_NP_GROUP
               else
                 mtOplNp_Group_Id.AsInteger:=qCTRestNp_Group_Id.AsInteger;
               mtOplCount.Value:=-qCtRestCount_.Value;
               mtOplPrice.Value:=qCTRestPrice.Value;
               mtOplSumma.Value:=-qCTRestSumma.Value;
               mtOpl.Post;
               SumOpl:=SumOpl+qCTRestSumma.AsFloat;
               clog(Format(TranslateText('оплата, сумма=%.2f'),[qCTRestSumma.AsFloat]),1);
            end;
            qCtRest.Next;
        end;
        clog(TranslateText('остатки считаны'));
    end;
    //**************************************************************************
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
        mtDTCount.AsFloat:=mtDTCount.AsFloat+p_Count;
        mtDTPrice.AsFloat:=p_Price;
        mtDTSumma.AsFloat:=mtDTSumma.AsFloat+p_Summa;
        mtDT.Post;
    end;

begin
    LogFileName:=GetMainDir+'cardalien.log';
    clog('=================================================');
    clog(DateToStr(Date)+' '+TimeToStr(Time));
    clog(TranslateText('Начало формирования по id=')+IntToStr(p_OblId));
    clog('C '+DateToStr(p_BeginDate)+TranslateText(' по ')+DateToStr(p_EndDate));
    clog('-------------------------------------------------');
    if not Debugging then Test;
    SetDocNumbers;// установка номеров
    ActivateQueries; //открытие необходимых запросов
    KorrNum:=qKorrNumNext_Number.AsInteger;
    clog(TranslateText('очередной номер корректировки ')+IntToStr(KorrNum));
    GetStartValues;  //Считывание остатков
    clog(TranslateText('основной расчет...'));
    CurDate:=0; KorrCount:=0; KorrSumma:=0; KorrNds:=0;
    pbDet.Max:=q.RecordCount; pbDet.Position:=0;
    while not q.Eof do begin
        clog(format(TranslateText('%s сумма=%.2f'),[qDate_.AsString,qSumma.AsFloat]),1);
        summa:=qSumma.AsFloat;
        count:=qCount.AsFloat;
        if NNCreated and (qDate_.Value<>CurDate) then CloseNN;
        CurDate:=qDate_.Value;
        //------------------------------------------------------------
        if summa<0 then begin // оплата
              if ((mtDT.RecordCount>0) or (-summa>Spr)) then begin
                  if qNN_ID.IsNull then begin
                     CreateNN(9); //создание шапки НН
                     UpdateNN_Id; // подставляем новые NN_ID, NN_INST
                  end else begin
                      CurNNId:=qNN_ID.AsInteger;
                      CurNNNum:=qNN_NUM.AsString;
                      _StartSql;
                      _ExecSql(' update oil_sale_book set nal_t=9 '+
                               ' where id='+IntToStr(CurNNId)+' and inst='+IntToStr(MAIN_ORG.INST));
                      NNCreated:=TRUE;
                  end;
              end;{ else begin
                  Spr:=FRound(Spr+summa); q.Next; continue;
              end;}
              mtDT.First; // сначала списываем с накопившихся ДТ и заносим их в налоговую
              while not mtDT.Eof and (summa<0) do begin
                  if FRound(mtDTSumma.AsFloat)<=FRound(-summa) then begin
                     CreateNNDet(mtDTNP_Group_ID.AsInteger,mtDTCount.Value,mtDTPrice.Value,mtDTSumma.Value,0,'N');  //создание детализации НН
                     summa:=summa+mtDTSumma.AsFloat; // уменьшаем сумму (она отрицательная!!!)
                     if qPrice.AsFloat>0 then
                        count:=count+FRound(mtDTSumma.AsFloat/qPrice.AsFloat,3);
                     SumDT:=SumDT+mtDTSumma.AsFloat;
                     mtDT.Delete;
                  end else begin
                     newcount:=FRound((-summa/mtDTPrice.AsFloat),3);
                     CreateNNDet(mtDTNP_Group_ID.AsInteger,newcount,mtDTPrice.Value,-summa,0,'N');//создание детализации НН
                     mtDT.Edit;
                     mtDTCount.AsFloat:=FRound(mtDTCount.Value-newcount,3);
                     mtDTSumma.AsFloat:=FRound(mtDTSumma.AsFloat+summa);
                     mtDT.Post;
                     SumDT:=SumDT-summa;
                     summa:=0; count:=0;
                  end;
                  //mtDT.Next;
              end; // закончили списывать с ДТ
              if -summa>Spr then begin // теперь вычли из отпусков, по которым были выписаны налоговые
                  summa:=FRound(summa+Spr); Spr:=0;
              end else begin
                  Spr:=FRound(Spr+summa); summa:=0;
              end;
              if Fround(summa)<0 then begin // если есть остаток, то по нему надо выписать налоговую по пункту договора
                  newcount:=FRound(-summa/OBL_CARD_PRICE,3);
                  CreateNNDet(OBL_CARD_NP_GROUP,newcount,qReportPrice.Value,-summa,0,'N'); //создание детализации НН
                  mtOpl.Insert;
                  mtOplNN_Number.Value:=CurNNNum;
                  mtOplNumber.Value:=qNum.AsString;
                  mtOplDate_.Value:=qDate_.Value;
                  mtOplCount.Value:=newcount;
                  mtOplSumma.Value:=-summa;
                  mtOplPrice.Value:=OBL_CARD_PRICE;
                  mtOplNp_Group_Id.Value:=OBL_CARD_NP_GROUP;
                  mtOpl.Post;
                  SumOpl:=SumOpl-summa;
              end;
              if NNCreated then CloseNN;
        //------------------------------------------------------------
        end else begin
              mtOpl.First;
              while not mtOpl.Eof and (summa>0) do
              begin
                  if not NNCreated then CreateNN(8); //создание шапки корректировки
                  if FRound(mtOplSumma.AsFloat)>FRound(summa) then begin
                     CreateNNDet(qNp_Group_Id.AsInteger,count,qPrice.Value,summa,GetNds_WithNds(summa,CurDate),'K');//создание детализации НН
                     newcount:=FRound(summa/mtOplPrice.Value,3);
                     mtOpl.Edit;
                     mtOplCount.Value:=FRound(mtOplCount.Value-newcount,3);
                     mtOplSumma.Value:=FRound(mtOplSumma.Value-summa);
                     mtOpl.Post;
                     SumOpl:=SumOpl-summa;
                     KorrCount:=FRound(KorrCount+newcount,3);
                     KorrSumma:=FRound(KorrSumma+summa);
                     KorrNds:=FRound(KorrNds+GetNds_WithNds(summa,CurDate));
                     summa:=0; UpdateNN_Id;
                  end else begin
                     newcount:=FRound(mtOplSumma.AsFloat/qPrice.AsFloat,3);
                     CreateNNDet(qNp_Group_Id.AsInteger,newcount,qPrice.Value,mtOplSumma.Value,GetNds_WithNds(mtOplSumma.Value,CurDate),'K');//создание детализации НН
                     summa:=FRound(summa-mtOplSumma.Value);
                     count:=FRound(count-newcount,3);
                     KorrSumma:=FRound(KorrSumma+mtOplSumma.Value);
                     KorrNDS:=FRound(KorrNDS+GetNDS_WithNDS(mtOplSumma.Value,CurDate));
                     KorrCount:=FRound(KorrCount+mtOplCount.Value,3);
                     UpdateNN_Id;
                     SumOpl:=SumOpl-mtOplSumma.AsFloat;
                     mtOpl.Delete;
                     mtOpl.First;
                     CloseNN;
                  end;
              end;
              if summa>0 then begin
                  if qOplat_Only.AsString='Y' then begin
                     PutToDt(qNP_Group_Id.AsInteger,count,qPrice.Value,summa);
                     SumDT:=SumDT+summa;
                  end else begin
                     if not NNCreated then CreateNN(7);//создание шапки НН
                     CreateNNDet(qNP_Group_Id.AsInteger,count,qPrice.AsFloat,summa,0,'N');
                     UpdateNN_Id;
                     sPR:=FRound(sPR+summa);
                  end;
              end;
        end;
        clog(format('%.2f; %.2f; %.2f',[SumOpl,Spr,SumDT]),2);
        q.Next; pbDet.StepIt;
    end;
    if NNCreated then CloseNN;
    if frmStart.ORASESSION1.InTransaction then
       frmStart.ORASESSION1.Commit;
    pbDet.Position:=0;
    clog(TranslateText('формирование документов завершено'));
    clog('==================================================');
    clog('');
end;
//==============================================================================
procedure TCardRNAlienPrintForm.FormCreate(Sender: TObject);
begin
  inherited;
  LoadSQLByForm(TForm(Self));
  deForm.Date:=Date;
  SetCurrentMonth(deBegin,deEnd);
  _OpenQuery(qGridBase);
  CopyToMemoryTable(qGridBase,qGrid);
  CTPCreated:=false;
  cbUnionClick(cbUnion);
end;
//==============================================================================
procedure TCardRNAlienPrintForm.bbCreateDocClick(Sender: TObject);
var i: integer;
    s: string;
    F: TProgrForm;

    procedure Test;
    var i,n:integer;
        mindate:TDateTime;
        F: TextFile;
        filename: string;
    begin
        filename:=GetMainDir+'cardalientest.log';
        AssignFile(F,filename);
        Rewrite(F);
      try
        writeln(F,TranslateText('Вход в функцию Test ')+DateToStr(Date)+' '+TimeToStr(Time));
        mindate:=qGridStart_Date.Value;
        for i:=0 to gridMain.SelectedRows.Count-1 do begin
            qGrid.GotoBookmark(pointer(gridMain.SelectedRows[i]));
            if qGridStart_Date.Value<mindate then
               mindate:=qGridStart_Date.Value;
        end;
        if CH_STARTUP_DATE<>'' then
           if mindate<StrToDate(CH_STARTUP_DATE) then
              mindate:=StrToDate(CH_STARTUP_DATE);
        if CUT_DATE<>'' then
           if mindate<StrToDate(CUT_DATE) then
              mindate:=StrToDate(CUT_DATE);
        writeln(F,'====================================');
        writeln(F,'CH_STARTUP_DATE='+CH_STARTUP_DATE);
        writeln(F,'mindate='+DateToStr(mindate));
        s:=' select count(*) from v_check_card_sr '+#13#10+
           ' where rep_date between '''+DateToStr(mindate)+''' and '''+DateToStr(deForm.Date)+''' and '+#13#10+
           ' not(AZS_ID=1000191 and AZS_INST=1000191 and REP_DATE=''06.04.2003'')';
        n:=GetSqlValue(s);
        writeln(F,'------------------------------------');
        writeln(F,'SQL');
        writeln(F,'------------------------------------');
        writeln(F,s);
        writeln(F,'------------------------------------');
        writeln(F,'n='+IntToStr(n));

        if n>0 then begin
           if (MessageDlgExt(
              TranslateText('Чтобы сформировать эти документы настоятельно рекомендуется, чтобы проверки ')+#13#10+
              TranslateText('по карточкам "Отоваривание Petrol и см.отч.OIL не содержали записи за период')+#13#10+
              TranslateText('с ')+DateToStr(mindate)+TranslateText(' по ')+DateToStr(deForm.Date)+'.'+#13#10+
              TranslateText('Однако такие ошибки есть. Для продолжения будет необходимо ввести пароль.')+#13#10+
              TranslateText('Будете ли вы его вводить?'),mtWarning,[TranslateText('Да'),TranslateText('Нет')],1)<>1) or not TestPassword(pwtOrg)
           then
              Raise Exception.Create(TranslateText('Формирование отменено'));
        end;
      finally
        CloseFile(F);
      end;
    end;

begin
    if not Debugging then Test;
    log('**********************************************************');
    log(TranslateText('Начало формирования документов по ')+DateToStr(deForm.Date));
    log('**********************************************************');
    pbMain.Max:=gridMain.SelectedRows.Count;
    for i:=0 to gridMain.SelectedRows.Count-1 do
    begin
        qGrid.GotoBookmark(pointer(gridMain.SelectedRows[i]));
        log('==========================================================');
        log(qGridName.AsString);
        log('----------------------------------------------------------');
        if qGridNext_Date.Value<=deForm.Date then
        begin
          if qGrid['IsBetweenFil']='Y' then
          begin
            // документы для филиала альфа-нафты
            if not CTPCreated then
            begin
              log(TranslateText('Происходит пересчет данных по филиалам...'));
              F:=TProgrForm.Create(Application);
              F.Caption:=TranslateText('Происходит пересчет данных по филиалам...');
              F.Show;
              F.Refresh;
              RunFillCardTransitPart(deForm.Date);
              F.Free;
              CTPCreated:=true;
              log(TranslateText('Пересчет закончен'));
            end;
            CreateFilRN(qGridId.AsInteger,qGridName.AsString,qGridNext_Date.AsDateTime,deForm.Date,
            qGridRN_Through.AsString,qGridNext_Num.AsInteger, cbUnion.Checked, cbSplitDT.Checked)
          end
          else if GetCardId(qGridId.AsInteger,deForm.Date)=0 then
            log(TranslateText('Обл перестал быть эмитентом на указанную дату формирования'))
          else
            // документы для обла
            CreateOblNN(qGridId.AsInteger,qGridNext_Date.Value,deForm.Date);
          _ExecProcOra('CARD.SAVE_ALIEN_DOC',
            ['p_OblId',     qGridId.AsInteger,
             'p_Date',      deForm.Date]);
          CommitSqlOra;
        end
        else
        begin
          log(TranslateText('Документы по этому облу должны формироваться '));
          log(TranslateText('начиная с ')+qGridNext_Date.AsString);
        end;
        pbMain.StepIt;
    end;
    log('**********************************************************');
    qGridBase.Close; _OpenQuery(qGridBase);
    CopyToMemoryTable(qGridBase,qGrid);
    pbMain.Position:=0;
    ShowMessage('Документы сформированы');
end;
//==============================================================================
procedure TCardRNAlienPrintForm.MakeNN(XLApp,List:Variant;ANDSRes:real=0);
var
  TaxBill: TdmTaxBill;
begin
  TaxBill := TdmTaxBill.Create();
  try
    TaxBill.Options.Num := qNNNum.AsString;
    TaxBill.Options.Date := qNNR_Date.AsString;
    TaxBill.Options.ToId  := qReportTo_.AsInteger;
    TaxBill.Options.ToInst  := qReportTo_Inst.AsInteger;
    TaxBill.Options.FromId := qReportFrom_.AsInteger;
    TaxBill.Options.FromInst := qReportFrom_Inst.AsInteger;
    TaxBill.Options.ByDogName := qNNF_Doc.AsString;
    TaxBill.Options.OIL_NN_Cause := 4;
    TaxBill.Excel := TMSExcel.Create(XLApp,List,qNNR_Date.AsDateTime,tpNN);
    while not qNN.Eof do
    begin
      TaxBill.AddPosition(
        qNNNP_Name.AsString,
        qNNDim_Name.AsString,
        qNNR_Date.AsString,
        qNNKol.Value,
        qNNPRICENDS.Value,
        qNNnds_t.Value
        );
      qNN.Next;
    end;
    if ANDSRes<>0 then
    begin
      TaxBill.Options.NDSResult := ANDSRes;
      TaxBill.Options.NDSCalcOrientation := coNDSResult;
    end
    else
      TaxBill.Options.NDSCalcOrientation := coSumByRow2;
    TaxBill.PutToExcel;
    if cbPrint.Checked and cbOrig.Checked then
    begin
      List.Cells[2,'L']:='';
      List.Cells[3,'L']:='X';
      List.PrintOut;
    end;
    if cbPrint.Checked and cbCopy.Checked then
    begin
      List.Cells[2,'L']:='X';
      List.Cells[3,'L']:='';
      List.PrintOut;
    end;
  finally
    TaxBill.Free;
  end;
end;
//==============================================================================
procedure TCardRNAlienPrintForm.CreateOblDoc(p_OblId: integer; p_Date: TDateTime; XLApp,List: Variant);
var
  NDSCorrection: real;
  //****************************************************************************
  procedure OpenQueries;
  begin
    _OpenQueryPar(qReport,
        ['orgid',    p_OblId,
         'orginst',  p_OblId]);
    if qReport.RecordCount=0 then
      Raise Exception.Create(TranslateText('С облом ')+  GetOrgName(p_OblId,p_OblId)+TranslateText(' не заключен долгосрочный договор'));
    _OpenQueryPar(qRN,
        ['begindate',     p_Date,
         'enddate',       p_Date,
         'obl_id',        p_OblId]);
    _OpenQueryPar(qNN,
        ['date_',         p_Date,
         'oblid',         p_OblId,
         'fromid',        MAIN_ORG.INST,
         'nal_t',         7]);
  end;
  //****************************************************************************
  function MakeRashNakl: real;
  var
    CurPos: integer;
  begin
    List.Cells[2,'D']:=qReportFrom_Name.AsString;
    List.Cells[4,'D']:=LangText('SvidPlatNDC')+'№'+qReportFrom_Svid_Num.AsString;
    List.Cells[5,'D']:=LangText('NalNum_UrLic')+qReportFrom_Nal_num.AsString;
    List.Cells[7,'D']:=LangText('Rashodna_nakladna2')+'№ '+qRNDoc_Number.AsString+'/'+qReportDog.AsString+' '+LangText('Ot')+DateToStr(p_Date)+' '+LangText('Za_period')+DateToStr(p_Date)+TranslateText(' до ')+DateToStr(p_Date);
    List.Cells[8,'E']:=TranslateText('по Договору № ')+qReportDog.AsString+' '+LangText('Ot')+qReportDog_Date.AsString+', '+LangText('Prilojenie')+qRNDoc_Number.AsString+' '+LangText('Ot')+DateToStr(p_Date);
    List.Cells[9,'D']:=TranslateText('Кому: ')+qReportTo_Name.AsString;
    List.Cells[11,'D']:=LangText('SvidPlatNDC')+'№'+qReportTo_Svid_Num.AsString;
    List.Cells[12,'D']:=LangText('NalNum_UrLic')+qReportTo_Nal_num.AsString;
    List.Cells[14,'K']:=LangText('NDS')+FloatToStr(TAX_RATE(qReportDog_Date.AsDateTime)*100)+TranslateText('%, грн');
    CurPos := PuTOilQueryToExcelEnh(XLApp,List,qRN,15,nil,0,
                 'filial_name\i;azs_name\i;np_name;card_number;check_number;oper_date;dim_name;litr\s;pricexnds;sumxnds\s;nds\s;sumnds\s',
                  '',PROMITOGI_DELPHI,[PQO_SeparateItogi ],PQS_DocStyle,'A');
    List.Cells[CurPos    , 'B'].Value := LangText('All_Sum_NDS2')+': ' + NumStrGrn(List.Cells[CurPos-2, 'L'].Value, TranslateText('грн'), TranslateText('коп'));
    List.PageSetup.LeftFooter := '&11' + MANAGER_SHIP + ' ____________________' + #10#10#10 + LangText('Otpustil') + '____________________'+ #10;
    List.PageSetup.RightFooter := '&11' + BUH_SHIP + ' ____________________' + #10#10#10 + LangText('Polychil') + '____________________' + #10;
    if cbPrint.Checked and cbOrig.Checked then List.PrintOut;
    if cbPrint.Checked and cbCopy.Checked then List.PrintOut;
    result:=List.Cells[CurPos-2, 'K'].Value;
  end;
  //****************************************************************************
  procedure MakePril;
  var
    CurPos: integer;
  begin
    List := XLApp.ActiveWorkBook.Worksheets[3];
    XLApp.ActiveWorkBook.Worksheets[3].Select;
    XLApp.WorkSheets[3].Select;
    qRN.First;
    List.Cells[1,'B']:=LangText('Prilojenie_Num')+qRNDoc_Number.AsString+' '+LangText('Ot')+DateToStr(p_Date);
    List.Cells[2,'B']:=LangText('K_dogovoru')+qReportDog.AsString+' '+LangText('Ot')+qReportDog_Date.AsString;
    List.Cells[5,'D']:=DateToStr(p_Date)+TranslateText(' по ')+DateToStr(p_Date);
    List.Cells[7,'A']:=qReportFrom_Name.AsString;
    List.Cells[10,'A']:=qReportTo_Name.AsString;
    List.Cells[14,'K']:=LangText('NDS')+FloatToStr(TAX_RATE(qReportDog_Date.AsDateTime)*100)+TranslateText('%, грн');
    CurPos := PuTOilQueryToExcelEnh(XLApp,List,qRN,17,nil,0,
                    'num\n;np_name;azs_name\i;filial_name\i\l;card_number;check_number;oper_date;dim_name;litr\s;pricexnds;sumxnds\s;nds\s;sumnds\s',
                    '',PROMITOGI_DELPHI,[PQO_SeparateItogi ],PQS_DocStyle,'B');
    List.Cells[CurPos,'B'].Value := LangText('All_Sum_NDS2')+': ' + NumStrGrn(List.Cells[CurPos-2, 'L'].Value, TranslateText('грн'), TranslateText('коп'));
    Inc(CurPos, 2);
    List.Cells[CurPos, 2] := LangText('Prodavec');
    List.Cells[CurPos, 5] := LangText('Pokypatel');
    Inc(CurPos, 2);
    List.Cells[CurPos + 0, 2] := LangText('Adr') + qReportFrom_addr.AsString;
    List.Cells[CurPos + 1, 2] := LangText('R/S') + qReportFrom_rach_chet.AsString;
    List.Cells[CurPos + 2, 2] := TranslateText('в ') + qReportFrom_Bank_Name.AsString;
    List.Cells[CurPos + 3, 2] := TranslateText('МФО ') + qReportFrom_MFO.AsString;
    List.Cells[CurPos + 4, 2] := TranslateText('код ')+LangText('EDRPOU') + qReportFrom_OKPO.AsString;
    List.Cells[CurPos + 5, 2] := LangText('INN') + qReportFrom_Nal_num.AsString;
    List.Cells[CurPos + 6, 2] := LangText('Sv_plat_NDS_NUM') + qReportFrom_svid_num.AsString;

    List.Cells[CurPos + 0, 5] := LangText('Adr') + qReportTo_addr.AsString;
    List.Cells[CurPos + 1, 5] := LangText('R/S') + qReportTo_Rach_Chet.AsString;
    List.Cells[CurPos + 2, 5] := TranslateText('в ') + qReportTo_Bank_Name.AsString;
    List.Cells[CurPos + 3, 5] := TranslateText('МФО ') + qReportTo_MFO.AsString;
    List.Cells[CurPos + 4, 5] := TranslateText('код ')+LangText('EDRPOU') + qReportTo_Okpo.AsString;
    List.Cells[CurPos + 5, 5] := LangText('INN') + qReportTo_Nal_Num.AsString;
    List.Cells[CurPos + 6, 5] := LangText('Sv_plat_NDS_NUM') + qReportTo_Svid_Num.AsString;

    Inc(CurPos, 8);
    List.Cells[CurPos, 5] := TranslateText('М.П.  _______________');
    List.Cells[CurPos, 2] := TranslateText('М.П.  _______________');
    if cbPrint.Checked and cbOrig.Checked then List.PrintOut;
    if cbPrint.Checked and cbCopy.Checked then List.PrintOut;
  end;
  //****************************************************************************
  procedure MakeOneKorr;
  var
    i, j, Height, n: integer;
    nn_date, nn_num, s: string;
    temp: Variant;
    addr, phone: string;
    //**************************************************************************
    procedure DoNewPattern();
    begin
      List.Cells[18,'A']:= 'Умова поставки';// *NO_TRANSLATE*
      List.Cells[3,'BB']:= 'Затверджено наказом ДПА України';// *NO_TRANSLATE*
      List.Cells[4,'BB']:= 'від 30 травня 1997 р. N 165';// *NO_TRANSLATE*
      List.Cells[5,'BB']:= '(у редакцїї наказу ДПА України від 08.10.98 р. N 469,';// *NO_TRANSLATE*
      List.Cells[6,'BB']:= 'з урахуванням змін, внесених наказом ДПА України';// *NO_TRANSLATE*
      List.Cells[7,'BB']:= 'від 30.06.2005 р.№ 244)';// *NO_TRANSLATE*
      List.Cells[25,'G']:= '(послуг),';// *NO_TRANSLATE*
      List.Cells[29,'T']:= '(послуг)';// *NO_TRANSLATE*
      List.Cells[29,'Z']:= '(послуг)';// *NO_TRANSLATE*
      List.Cells[30,'T']:= '';// *NO_TRANSLATE*
      List.Cells[30,'Z']:= '';// *NO_TRANSLATE*
      List.Cells[32+qKorrOne.RecordCount,'A']:= 'Суми ПДВ, які скориговані у зв''язку із зміною кількісних чи вартісних показників,'// *NO_TRANSLATE*
        +' що зазначені  у цьому розрахунку, визначені правильно,  включені відповідно до податкового зобов''язання з одночасним відображенням у реєстрі отриманих та виданих податкових накладних.';// *NO_TRANSLATE*
      List.Cells[38+qKorrOne.RecordCount,'A']:=
             'Розрахунок коригування вiд '+DateToStr(p_Date)+' №'+qKorr.FieldByName('num').AsString+// *NO_TRANSLATE*
             ' до податкової накладної від '+nn_date+' №'+nn_num+' отримав і зобов''язуюся включити суми кориговані'+// *NO_TRANSLATE*
             ' до реєстру отриманих та виданих податкових накладних та суми податкового кредиту i податкового зобов''язання';// *NO_TRANSLATE*
    end;
    //**************************************************************************
  begin
    s := qKorr.FieldByName('num').AsString;
    n:=pos('/',s);
    if n=0 then
    begin
      nn_date:='';
      nn_num:='';
    end
    else
    begin
      nn_num:=copy(s,n+1,length(s));
      temp := GetSqlValue(
        ' select distinct nn_date from oil_ct_rest '+
        ' where state=''Y'' and obl_id=obl_inst '+
        '       and obl_id='+IntToStr(p_OblId)+
        '       and nn_num='''+nn_num+'''');
      if not VarIsNull(temp) then
        nn_date := temp
      else
      begin
        temp := GetSqlValue(
          ' select s_date from oil_sale_book '+
          ' where state=''Y'' and organ=organ_inst and nal_t=9 '+
          '       and organ='+IntToStr(p_OblId)+
          '       and num='''+nn_num+'''');
        if VarIsNull(temp) then
          nn_date := ''
        else
          nn_date := temp;
      end;
    end;
    List.Cells[4,'N']:=TranslateText('Р О З Р А Х У Н О К  № ')+qKorr.FieldByName('num').AsString;
    List.Cells[6,'N']:=TranslateText(' вiд ')+nn_date+' №'+nn_num+TranslateText(' за договором вiд ')+qReportDog_Date.AsString+' №'+qReportDog.AsString+', '+TranslateText('додаток ')+qRNDoc_Number.AsString+TranslateText(' від ')+DateToStr(p_Date);
    List.Cells[9,'M']:=qReportFrom_Name.Asstring;
    List.Cells[9,'AP']:=qReportTo_Name.AsString;
    for i := 1 to 12 do
      List.Cells[11,12+i]:=qReportFrom_Nal_Num.AsString[i];
    for i := 1 to 12 do
      List.Cells[11,41+i]:=qReportTo_Nal_Num.AsString[i];

    GetNNAddrPhone(qReportFrom_.AsInteger,qReportFrom_Inst.AsInteger,addr,phone);
    List.Cells[13,'G']:=addr;
    List.Cells[15,'G'] :=phone;
    GetNNAddrPhone(qReportTo_.AsInteger,qReportTo_Inst.AsInteger,addr,phone);
    List.Cells[13,'AJ']:=addr;
    List.Cells[15,'AJ']:=phone;

    List.Cells[17,'P']:=qReportFrom_Svid_Num.AsString;
    List.Cells[17,'AS']:=qReportTo_Svid_Num.AsString;
    List.Cells[20,'F']:=nn_date;
    List.Cells[26,'AC']:=FloatToStr(TAX_RATE(qReportDog_Date.AsDateTime)*100)+'%';
    List.Cells[30,'AL']:='гр.9(-)х'+FloatToStr(TAX_RATE(qReportDog_Date.AsDateTime)*100)+'%';// *NO_TRANSLATE*
    List.Cells[30,'AP']:='гр.9(-)х'+FloatToStr(TAX_RATE(qReportDog_Date.AsDateTime)*100)+'%';// *NO_TRANSLATE*
    List.Cells[30,'AT']:='гр.9(+)х'+FloatToStr(TAX_RATE(qReportDog_Date.AsDateTime)*100)+'%';// *NO_TRANSLATE*
    List.Cells[30,'AX']:='гр.9(+)х'+FloatToStr(TAX_RATE(qReportDog_Date.AsDateTime)*100)+'%';// *NO_TRANSLATE*
    Height:=List.Rows[32].EntireRow.RowHeight;
    for i := 1 to qKorrOne.RecordCount-1 do
      List.Rows[32].EntireRow.Insert;
    for i := 32 to 32+qKorrOne.RecordCount-2 do
    begin
      for j := 1 to High(KorrBounds)-1 do
        List.Range[KorrBounds[j]+IntToStr(i)+':'+ExcelNumberToColumn(ExcelColumnToNumber(KorrBounds[j+1])-1)+IntToStr(i)].Merge;
      for j := 9 to High(KorrBounds)-1 do
        List.Cells[i,KorrBounds[j]].NumberFormat:='0,00';
      List.Cells[i,KorrBounds[5]].NumberFormat:='0,000';
      List.Cells[i,KorrBounds[6]].NumberFormat:='0,0000';
      List.Cells[i,'A']:=DateToStr(p_Date);
    end;
    qKorrOne.First; i:=32;
    while not qKorrOne.Eof do
    begin
      List.Rows[i].EntireRow.RowHeight:=Height;
      List.Rows[i].EntireRow.VerticalAlignment:=xlCenter;
      List.Cells[i,'C']:=TranslateText('Зміна ціни й кількості');
      List.Cells[i,'C'].WrapText:=TRUE;
      List.Cells[i,'C'].Font.Bold:=TRUE;
      List.Cells[i,'G']:=qKorrOne.FieldByName('np_group').AsString;
      List.Cells[i,'N']:=TranslateText('літр');
      List.Cells[i,'Q']:=qKorrOne.FieldByName('kol').Value;
      List.Cells[i,'T']:=qKorrOne.FieldByName('price').Value;
      List.Cells[i,'AC']:=qKorrOne.FieldByName('k_nds_b').Value;
      if qKorrOne.FieldByName('k_nds_20').Value<0 then
      begin
        List.Cells[i,'AL']:=qKorrOne.FieldByName('k_nds_20').Value;
        List.Cells[i,'AP']:=qKorrOne.FieldByName('k_nds_20').Value;
      end
      else
      begin
        List.Cells[i,'AT']:=qKorrOne.FieldByName('k_nds_20').Value;
        List.Cells[i,'AX']:=qKorrOne.FieldByName('k_nds_20').Value;
      end;
      qKorrOne.Next; inc(i);
    end;
    List.Cells[34+qKorrOne.RecordCount,'M']:=DateToStr(p_Date);
    List.Cells[38+qKorrOne.RecordCount,'A']:=
      TranslateText('Розрахунок коригування вiд ')+DateToStr(p_Date)+' №'+qKorr.FieldByName('num').AsString+
      TranslateText(' до податкової накладної від ')+nn_date+' №'+nn_num+TranslateText(' отримав і зобов''язуюся включити суми кориговані')+
      TranslateText(' до книги обліку придбання та суми податкового кредиту i податкового зобов''язання');
    if p_Date >= 38562 then//'< 29.07.2005'
      DoNewPattern();
    if cbPrint.Checked and cbOrig.Checked then
    begin
      List.Cells[1,'J']:='';
      List.Cells[2,'J']:='X';
      List.PrintOut;
    end;
    if cbPrint.Checked and cbCopy.Checked then
    begin
      List.Cells[1,'J']:='X';
      List.Cells[2,'J']:='';
      List.PrintOut;
      end;
  end;
  //****************************************************************************
  procedure MakeKorr;
  var
    i: integer;
  begin
    if qKorr.Active then qKorr.Close;
    qKorr.ParamByName('date_').Value:=p_Date;
    qKorr.ParamByName('oblid').AsInteger:=p_OblId;
    _OpenQuery(qKorr);
    if qKorr.RecordCount=0 then
      XLApp.ActiveWorkBook.Worksheets[4].Visible:=FALSE
    else
      begin
        for i:=1 to qKorr.RecordCount-1 do
          XLApp.Run('CopyList', 4);
        _OpenQuery(qKorrOne);
        for i:=1 to qKorr.RecordCount do
        begin
          XLApp.ActiveWorkbook.WorkSheets[3+i].Select;
          List := XLApp.ActiveWorkbook.WorkSheets[3+i];
          MakeOneKorr;
          qKorr.Next;
        end;
      end;
  end;
  //****************************************************************************
begin
  OpenQueries;
  NDSCorrection := MakeRashNakl;
  MakePril;
  if qNN.RecordCount=0 then
    XLApp.WorkSheets[2].Visible:=FALSE
  else
  begin
    XLApp.ActiveWorkbook.WorkSheets[2].Select;
    List := XLApp.ActiveWorkbook.WorkSheets[2];
    MakeNN(XLApp, List, NDSCorrection);
  end;
  MakeKorr;
end;
//==============================================================================
procedure TCardRNAlienPrintForm.CreateOblDocs(p_OblId: integer; p_BeginDate, p_EndDate: TDateTime;
  p_IsBetweenFil: Boolean);
var
  dirname, filename: string;

  //****************************************************************************
  procedure GetDirName;
  begin
    dirname := GetMainDir+'Doc\'+DOC_DIR;
    if not DirectoryExists(dirname) then
      CreateDir(dirname);
    dirname := dirname+'\'+RemoveSymbols(GetOrgName(p_OblId,p_OblId),'".?*''><:;');
    if not DirectoryExists(dirname) then
      CreateDir(dirname);
    dirname:=dirname+'\';
  end;
  //****************************************************************************
  procedure OpenExcel(p_Filename: string = '');
  var
    Unknown: iUnknown;
  begin
    if p_FileName <> '' then
      ActivateXLApp(p_Filename, p_Filename, 1, XLApp, List)
    else
    begin
      if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
        XLApp := GetActiveOleObject('Excel.Application')
      else
        XLApp := CreateOleObject('Excel.Application');
      XLApp.Workbooks.Add;
      XLApp.DisplayAlerts:=FALSE;
      List := XLApp.ActiveWorkbook.Worksheets[1];
    end;
  end;
  //****************************************************************************
  procedure PrintDocsUsual;
  begin
    _OpenQueryPar(qReport,
       ['orgid',   p_OblId,
        'orginst', p_OblId]);
    if qReport.RecordCount=0 then
       Raise Exception.Create(TranslateText('С облом ')+GetOrgName(p_OblId,p_OblId)+TranslateText(' не заключен долгосрочный договор'));
    _OpenQueryPar(qDoc,
       ['oblid',       p_OblId,
        'begindate',   p_BeginDate,
        'enddate',     p_EndDate]);
    pbDet.Max := qDoc.RecordCount;
    while not qDoc.Eof do
    begin
      IF qDocTable_Name.Value='CARD_TRANSIT' then
      begin
        OpenExcel('cardalien');
        CreateOblDoc(p_OblId, qDocDate_.Value, XLApp, List);
        filename:=dirname+TranslateText('Отпуск ')+qDocDate_.AsString+'.xls';
        log(filename);
        if FileExists(filename) then DeleteFile(filename);
        XLApp.ActiveWorkbook.SaveAs(filename);
        XLApp.ActiveWorkbook.Close;
      end
      ELSE
      begin
        OpenExcel('TaxBill');
        _OpenQueryPar(qNN,
          ['date_',         qDocDate_.Value,
           'oblid',         p_OblId,
           'fromid',        MAIN_ORG.INST,
           'nal_t',         9]);
        MakeNN(XLApp,List);
        filename := dirname+TranslateText('Оплата ')+qDocDate_.AsString+'.xls';
        log(filename);
        if FileExists(filename) then DeleteFile(filename);
        XLApp.ActiveWorkbook.SaveAs(filename);
        XLApp.ActiveWorkbook.Close;
      end;
      qDoc.Next; pbDet.StepIt;
    end;
    pbDet.Position:=0;
  end;
  //****************************************************************************
  procedure PrintDocsFil;
  const
    xlExcel8 = 56; // 97-2003 format in Excel 2007, xls
    xlExcel12 = 50; // Excel Binary Workbook in 2007 with or without macro’s, xlsb
    xlOpenXMLWorkbook = 51; // without macro's in 2007, xlsx
    xlOpenXMLWorkbookMacroEnabled = 52;// xlOpenXMLWorkbookMacroEnabled (with or without macro's in 2007, xlsm)
  var
    appendix: ShortInt; // переменная дает захватить дату до перехода, если при формировании выбрана и дата перехода как начальный параметр
    i: integer;
  begin
    if p_BeginDate = VarToDateTime(GetSqlValue('select ov.GetVal(''INST_MOVE_DATE'') from dual' ))then
      appendix := -1
    else
      appendix := 0;
    _OpenQueryPar(qFilRn,
      ['BeginDate',     p_BeginDate + appendix,
       'EndDate',       p_EndDate,
       'From_Id',       MAIN_ORG.INST,
       'To_Id',         p_OblId]);
    while not qFilRn.Eof do
    begin
      filename:=dirname+TranslateText('РасхНакл ')+qFilRn.FieldByName('num').AsString+'.xls';
      log(filename);
      OpenExcel('empty');
      if (qFilRn.FieldByName('begin_date').IsNull) then
      begin
        XLApp.ActiveWorkbook.Worksheets.Add;
        // РАСХОДНАЯ
        PrintRashNakAlienFil(qFilRn.FieldByName('id').AsInteger,qFilRn.FieldByName('inst').AsInteger,XLApp,XLApp.ActiveWorkbook.Worksheets[1]);
        // АВИЗО
        PrintAvisoAlienFil(qFilRn.FieldByName('id').AsInteger,qFilRn.FieldByName('inst').AsInteger,XLApp,XLApp.ActiveWorkbook.Worksheets[2]);
        if cbPrint.Checked then
        begin
          for i := 1 to 2 do
            XLApp.ActiveWorkbook.Worksheets[1].PrintOut;
          XLApp.ActiveWorkbook.Worksheets[2].PrintOut;
        end;
      end
      else
      begin
        // Добавляем два листа
        XLApp.ActiveWorkbook.Worksheets.Add;
        XLApp.ActiveWorkbook.Worksheets.Add;
        // РАСХОДНАЯ
        PrintRashNakAlienFil(qFilRn.FieldByName('id').AsInteger,qFilRn.FieldByName('inst').AsInteger,XLApp,XLApp.ActiveWorkbook.Worksheets[1]);
        // АВИЗО
        PrintAvisoAlienFil(qFilRn.FieldByName('id').AsInteger,qFilRn.FieldByName('inst').AsInteger,XLApp,XLApp.ActiveWorkbook.Worksheets[2]);
        // РЕЕСТР
        PrintReestrAlienFil(qFilRn.FieldByName('id').AsInteger,qFilRn.FieldByName('inst').AsInteger,XLApp,XLApp.ActiveWorkbook.Worksheets[3]);
        if cbPrint.Checked then
        begin
          for i := 1 to 2 do
            XLApp.ActiveWorkbook.Worksheets[1].PrintOut;
          XLApp.ActiveWorkbook.Worksheets[2].PrintOut;
          XLApp.ActiveWorkbook.Worksheets[3].PrintOut;
        end;
      end;
      if FileExists(filename) then
        DeleteFile(filename);
      {Сохранение на диск}
      if CompareVersion(XLApp.Version,'12.0') in [1,0] then
        {В Excel 2007 и выше сохраняем в формате предыдущих версий (97-2003)}
        XLApp.ActiveWorkbook.SaveAs(filename,xlExcel8)
      else
        XLApp.ActiveWorkbook.SaveAs(filename);
      XLApp.ActiveWorkbook.Close;
      qFilRn.Next;
    end;
    qFilRn.First;
  end;
  //****************************************************************************
begin
  GetDirName;
  if p_IsBetweenFil then
    PrintDocsFil
  else
    PrintDocsUsual;
end;
//==============================================================================
procedure TCardRNAlienPrintForm.bbPrintClick(Sender: TObject);
var
  i: integer;
  vBeginDate,vEndDate: TDateTime;
begin
  if deBegin.Date>deEnd.Date then
    raise exception.create(TranslateText('Дата "C" не должна быть больше даты "По"'));
  log('**********************************************************');
  log(TranslateText('Начало печати документов с ')+DateToStr(deBegin.Date)+TranslateText(' по ')+DateToStr(deEnd.Date));
  log('**********************************************************');
  pbMain.Max:=gridMain.SelectedRows.Count;
  for i:=0 to gridMain.SelectedRows.Count-1 do
  begin
    qGrid.GotoBookmark(pointer(gridMain.SelectedRows[i]));
    log('==========================================================');
    log(qGridName.AsString);
    log('----------------------------------------------------------');
    if deBegin.Date<qGridStart_Date.AsDateTime then
    begin
      log(TranslateText('Документы по этому подразделению могут печататься только с ')+qGridStart_Date.AsString);
      log(TranslateText('Дата начала изменена'));
    end;
    if deBegin.Date<qGridStart_Date.AsDateTime then
      vBeginDate:=qGridStart_Date.AsDateTime
    else
      vBeginDate:=deBegin.Date;
    if deEnd.Date>=qGridNext_Date.AsDateTime then
    begin
      log(TranslateText('Документы по этому подразделению могут печататься только по ')+DateToStr(qGridNext_Date.AsDateTime-1));
      log(TranslateText('Дата конца изменена'));
    end;
    if deEnd.Date>=qGridNext_Date.AsDateTime then
      vEndDate:=qGridNext_Date.AsDateTime-1
    else
      vEndDate:=deEnd.Date;
    CreateOblDocs(qGridId.AsInteger,vBeginDate,vEndDate,qGridIsBetweenFil.AsString='Y');
    pbMain.StepIt;
  end;
  log('**********************************************************');
  pbMain.Position:=0;
end;
//==============================================================================
procedure TCardRNAlienPrintForm.gridMainGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if qGridStart_Date.IsNull then begin
    AFont.Style:=AFont.Style+[fsItalic];
  end;

  if ((Column.FieldName='NEXT_NUM') or (Column.FieldName='NEXT_DATE') and (qGridDocsExists.AsString='N'))
    and (qGrid['IsBetweenFil']='Y')
  then
    Background:=clWhite
  else
    Background:=$00EEEFEF;

  if (Column.FieldName='NAME') and (qGridRN_THROUGH.AsString='') and (qGrid['IsBetweenFil']='Y') then
    AFont.Color:=clRed;

  if (Column.FieldName='NEXT_NUM') and (qGrid['IsBetweenFil']='N') then
    AFont.Color:=Background;
end;
//==============================================================================
procedure TCardRNAlienPrintForm.dsGridDataChange(Sender: TObject;
  Field: TField);
begin
  qGrid.FieldByName('next_num').ReadOnly:=(qGrid['IsBetweenFil']='N');
  qGrid.FieldByName('next_date').ReadOnly:=(qGrid['IsBetweenFil']='N');

  if qGrid['IsBetweenFil']='Y' then
    gridMain.PopupMenu:=pm
  else
    gridMain.PopupMenu:=nil;
end;
//==============================================================================
procedure TCardRNAlienPrintForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MessageDlg(TranslateText('Сформированные здесь данные можно просмотреть в отчётах:') + #10#13 +
    TranslateText('  - Отчеты\Отчеты по эл. карточкам\Чужие списания\Наши на чужих АЗС') + #10#13 +
    TranslateText('  - Отчеты\Отчеты по эл. карточкам\Чужие списания\Наши на чужих АЗС - РН'), mtInformation, [mbOk], 0);
  if mtDT.Active then mtDT.Close;
  if mtOpl.Active then mtOpl.Close;
  Action := caFree;
end;
//==============================================================================
procedure TCardRNAlienPrintForm.sbDelClick(Sender: TObject);
begin
    if deDel.Date=0 then Raise Exception.Create(TranslateText('Не указана дата'));
    if deDel.Date<=StrToDate(CLOSE_DATE) then
      raise exception.create(TranslateText('Нельзя удалять документы из закрытого периода!'));
    if gridMain.SelectedRows.Count>1 then
       Raise Exception.Create(TranslateText('Для этой операции должен быть выделен только один обл'));
    if MessageDlg(TranslateText('Вы уверены, что хотите удалить документы?'),mtConfirmation,[mbYes,mbNo],0)=mrNo then exit;
    StartSql;
  try
    if qGridIsBetweenFil.AsString='N' then begin
      _ExecSql(' update card_transit'+
               ' set doc_number=null,'+
               '     nn_id=null,nn_inst=null '+
               ' where Card.GetObl(card_number,oper_date)='+qGridId.AsString+
               '       and oper_date>='''+DateToStr(deDel.Date)+'''');

      _ExecSql(' update oil_sale_book_det '+
               ' set state=''N'' '+
               ' where (nn_id,nn_inst) in '+
               '       (select id,inst from oil_sale_book '+
               '        where organ=organ_inst and organ='+qGridId.AsString+
               '              and s_date>='''+DateToStr(deDel.Date)+''''+
               '              and nal_t in (7,8,9))');

      _ExecSql(' update oil_sale_book '+
               ' set nal_t=decode(nal_t,9,6,nal_t),'+
               '     state=decode(nal_t,9,''Y'',''N'')'+
               ' where organ=organ_inst and organ='+qGridId.AsString+
               '       and s_date>='''+DateToStr(deDel.Date)+''''+
               '       and nal_t in (7,8,9)');
    end else begin
      _ExecSql(Format(
        ' update card_alien_rn set state=''N'' where state=''Y'' and from_id=%d'+
        ' and to_id=%d and date_>=''%s''',[MAIN_ORG.INST,qGridId.AsInteger,DateToStr(deDel.Date)]));
      _ExecSql(
        ' update card_alien_rn_det set state=''N'' where state=''Y'' and '+
        ' (rn_id,rn_inst) in (select id,inst from card_alien_rn where state=''N'')');
    end;
    SaveCardAlienDoc(qGridId.AsInteger,deDel.Date-1);
    showmessage('документы удалены');
    CommitSql;
  except
    RollbackSql;
  end;
    qGridBase.Close; _OpenQuery(qGridBase);
    CopyToMemoryTable(qGridBase,qGrid);
    deDel.Date:=0;
end;
//==============================================================================
procedure TCardRNAlienPrintForm.cbPrintClick(Sender: TObject);
begin
    cbOrig.Enabled:=cbPrint.Checked;
    cbCopy.Enabled:=cbPrint.Checked;
end;
//==============================================================================
procedure TCardRNAlienPrintForm.bbCancelClick(Sender: TObject);
begin
  Close;
end;
//==============================================================================
procedure TCardRNAlienPrintForm.PrintRashNakAlienFil(p_Id,p_Inst: integer; XLApp,List: Variant);
var
  q: TOilQuery;
  firstrow,crow,n: integer;
  sum: real;
  range,curAzs,sFormat: string;
  IsUnion: boolean;
  function IsWithMoney: Boolean;
  begin
    Result := true;
    if IsUnion then
    begin
      _OpenQueryPar(qRnDetPrintUnion,
        ['rn_id', p_Id,
         'rn_inst', p_Inst]);
      qRnDetPrintUnion.Filtered := False;
      qRnDetPrintUnion.Filter := ' summ > 0 ';
      qRnDetPrintUnion.Filtered := True;
      if qRnDetPrintUnion.IsEmpty then
        Result := false;
      qRnDetPrintUnion.Filtered := False;
      qRnDetPrintUnion.Close;
    end;
  end;
begin
  List.Name := 'РН';
  // Определяем тип РН
  IsUnion:= 1 = GetSqlValueParSimple('select decode(begin_date,null,0,1) is_union from card_alien_rn where id=:id and inst=:inst',
    ['id', p_Id,
     'inst', p_Inst]);
  if IsUnion then {В зависимости от типа РН берем нужный запрос}
    q := qRnPrintUnion
  else
    q := qRnPrint;
  _OpenQueryPar(q,
    ['rn_id', p_Id,
     'rn_inst', p_Inst]);

  List.PageSetup.Zoom:=false;
  List.PageSetup.FitToPagesWide:=1;
  List.PageSetup.FitToPagesTall:=100;

  crow := 2;

  case q.FieldByName('rn_type').AsInteger of
    1: sFormat:='0,000000';
    2: sFormat:='0,000';
  end;
  {Шапка РН}
  List.Cells[crow,'B']:=q.FieldByName('from_name').AsString;
  List.Cells[crow,'B'].Font.Bold:=true;
  List.Cells[crow,'B'].Font.Size:=12;
  List.Cells[crow+2,'B']:=Format('1.'+LangText('SvidPlatNDC2')+' №%s',
    [q['from_svid']]);
  List.Cells[crow+3,'B']:=Format('2.'+LangText('NalNum_UrLic')+' %s',
    [q['from_id_num']]);
  crow:=8;
  List.Cells[crow,'B']:=Format(LangText('Rashodna_nakladna2')+' №%s '+LangText('Ot')+' %s',
    [q['num'],q.FieldByName('date_').AsString]);
  List.Cells[crow,'B'].Font.Bold:=true;
  List.Cells[crow,'B'].Font.Size:=14;
  if IsWithMoney then
    List.Cells[crow+1,'B']:=LangText('Na_vn_perem_tovara_')
  else
    List.Cells[crow+1,'B']:=LangText('Na_vn_perem_comis_tovara_');  

  if IsUnion then
  begin
    if IsWithMoney then
      List.Cells[crow+2,'B']:= LangText('Soglasno_reestra')+ ' '
        + LangText('S') + q.FieldByName('begin_date').AsString + ' по '+ q.FieldByName('end_date').AsString
    else
      List.Cells[crow+2,'B']:= LangText('Soglasno_reestra_na_vnytr_peremeschenie_comis_tovar')+ ' '
        + LangText('S') + q.FieldByName('begin_date').AsString + ' по '+ q.FieldByName('end_date').AsString;
    inc(crow);
  end;
  crow:=crow+3;
  List.Cells[crow,'B']:=TranslateText('Кому:');
  List.Cells[crow+1,'B']:=TranslateText('Через кого:');
  List.Cells[crow+2,'B']:=LangText('Osnovanie')+':';
  List.Range[Format('B%d:B%d',[crow,crow+2])].Font.Bold:=true;
  List.Cells[crow,'D']:=q.FieldByName('to_name').AsString;
  List.Cells[crow,'D'].Font.Size:=12;
  List.Cells[crow+1,'D']:=q.FieldByName('through').AsString;
  List.Cells[crow+2,'D']:=q.FieldByName('reason').AsString;

  crow:=crow+5;
  {Шапка табличной части}
  ExPutValues(List,crow,1,
    [TranslateText('№ п/п'), LangText('Part'), LangText('Sert'), LangText('Name_prod'), LangText('Ed_Izm'), LangText('Count'),
     LangText('Price')+TranslateText(' без ')+LangText('NDS')+TranslateText(', грн'), LangText('All_Sum_bez_NDS2')+TranslateText(', грн')]);
  List.Rows[crow].EntireRow.RowHeight:=30;
  range:=Format('A%d:H%d',[crow,crow]);
  List.Range[range].Font.Bold:=true;
  List.Range[range].WrapText:=true;
  List.Range[range].HorizontalAlignment:=xlCenter;
  List.Range[range].Interior.ColorIndex:=34;
  List.Range[range].VerticalAlignment:=xlCenter;
  if IsUnion then
  begin
    if IsWithMoney then
      ExSetColumnWidth(List,1,[3,15,0{скрыть},25,9,8,10,15])
    else
      ExSetColumnWidth(List,1,[3,15,0{скрыть},25,9,8,0{скрыть},0{скрыть}]);
  end
  else
    ExSetColumnWidth(List,1,[3,10,12,25,8,8,10,15]);
  q.Close;
  {Содержание табличной части}
  if IsUnion then {В зависимости от типа РН берем нужный запрос}
    q := qRnDetPrintUnion
  else
    q := qRnDetPrint;
  _OpenQueryPar(q,
    ['rn_id', p_Id,
     'rn_inst', p_Inst]);
  curAzs:='';
  firstrow:=crow+1;
  n:=1; sum:=0;
  while not q.Eof do
  begin
    inc(crow);
    if IsUnion then
      ExPutValues(List,crow,1,[n,q['dog'],'',q['np_name'],q['dim_name'],q['count_'],q['price'],q['summ']])
    else
    begin
      {Выводим АЗС, потом все что к ней относится}
      if q.FieldByName('fullazsname').AsString<>curAzs then
      begin
        List.Range[Format('A%d:H%d',[crow,crow])].MergeCells:=true;
        curAzs:=q.FieldByName('fullazsname').AsString;
        List.Cells[crow,'A']:=curAzs;
        List.Cells[crow,'A'].HorizontalAlignment:=xlCenter;
        inc(crow);
      end;
      ExPutValues(List,crow,1,[n,q['dog'],q['cert'],q['np_name'],q['dim_name'],q['count_'],q['price'],q['summ']]);
    end;
    sum:=sum+q.FieldByName('summ').AsFloat;
    inc(n);
    q.Next;
  end;
  q.Close;
  inc(crow);
  if IsWithMoney then
  begin
    List.Cells[crow,'B']:=LangText('All_Sum');
    List.Cells[crow,'B'].Font.Bold:=true;
    List.Cells[crow,'H'].Formula:=Format('=SUM(H%d:H%d)',[firstrow,crow-1]);
    List.Cells[crow,'H'].Font.Bold:=true;
    List.Cells[crow+2,'B']:=LangText('All_Sum')+LangText('Propisu2')+': '+Money2Words(sum);
  end
  else
  begin
    List.Cells[crow,'B']:=LangText('Itogo');
    List.Cells[crow,'B'].Font.Bold:=true;
    List.Cells[crow,'F'].Formula:=Format('=SUM(F%d:F%d)',[firstrow,crow-1]);
    List.Cells[crow,'F'].Font.Bold:=true;
  end;
  List.Range[Format('F%d:F%d',[firstrow,crow])].NumberFormat:=sFormat;
  List.Range[Format('G%d:H%d',[firstrow,crow])].NumberFormat:='0,00';
  DrawNetInExcel(List,1,8,firstrow-1,crow);
  DrawNetInExcel(List,1,8,firstrow-1,crow,3,false);
  DrawNetInExcel(List,1,8,firstrow-1,firstrow-1,3,false);

  List.Cells[crow+6,'B']  := MANAGER_SHIP         +'______________';
  List.Cells[crow+6,'F']  := BUH_SHIP             +'______________';
  List.Cells[crow+10,'B'] := LangText('Otpustil') +'______________';
  List.Cells[crow+10,'F'] := LangText('Poluchil') +'______________';

  XLApp.Visible := true;
end;
//==============================================================================
procedure TCardRNAlienPrintForm.PrintAvisoAlienFil(p_Id,p_Inst: integer; XLApp,List: Variant);
var
  varname,varvalue: string;
  slAcc: TStringList;
begin
  _OpenQueryPar(
    qAviso,
    ['rn_id' ,  p_Id,
     'rn_inst', p_Inst]);
  List.Name := 'Авизо';
  varname:='CARD_ALIEN_AVIZO'+qAviso.FieldByName('rn_type').AsString;
  varvalue:=ReadOilVar(varname);
  if varvalue='' then
    varvalue:='28.3;68.3;68.3;28.2.2';

  slAcc:=TStringList.Create;
  Str2StringList(varvalue,slAcc,';');

  List.PageSetup.Zoom := False;
  List.PageSetup.PrintArea := '$A$1:$H$64';
  //Форматирование и заполнение статическими данными
  ExSetColumnWidth(List,1,[12,10,13,10,33,9,9,10]);
  List.Range['A10:B11'].MergeCells:=true;
  List.Range['C10:E12'].MergeCells:=true;
  List.Range['G10:H11'].MergeCells:=true;
  List.Range['F10:F12'].MergeCells:=true;
  List.Range['C13:E13'].MergeCells:=true;
  List.Range['A10:H13'].HorizontalAlignment := xlCenter;
  List.Range['A10:H13'].VerticalAlignment := xlCenter;
  List.Cells[2,'A']:= TranslateText('Акцептовано');
  List.Cells[2,'C']:= '=A3';
  List.Cells[4,'C']:= TranslateText('кому');
  List.Cells[4,'F']:= TranslateText('ДЕБЕТ');
  List.Cells[4,'G']:= TranslateText('КРЕДИТ');
  if qAviso.FieldByName('rn_type').AsInteger = 3 then
    List.Cells[4,'H']:= TranslateText('Количество')
  else
    List.Cells[4,'H']:= TranslateText('Сума');

  List.Cells[5,'C']:= TranslateText('копія');
  List.Cells[5,'F'].NumberFormat := '@';
  List.Cells[5,'F']:= slAcc[0];
  List.Cells[5,'G'].NumberFormat := '@';
  List.Cells[5,'G']:= slAcc[1];
  List.Cells[6,'H']:= '=H5';
  List.Cells[8,'A']:= TranslateText('За Вашим у нас рахунком 683');
  List.Cells[8,'D']:= FormatDateTime2('dd.mm.yyyy',qAvisoDATE_.AsDateTime);
  List.Cells[8,'E']:= TranslateText('Проведені наступні записи.');
  List.Cells[10,'A']:= TranslateText('Докум.');
  List.Cells[10,'C']:= TranslateText('ЗМІСТ ЗАПИСІВ');
  List.Cells[10,'F']:= '=H4';
  List.Cells[12,'A']:= TranslateText('Наймен.');
  List.Cells[12,'B']:= '№';
  List.Cells[12,'G']:= '=F4';
  List.Cells[12,'H']:= '=G4';
  List.Cells[13,'A']:= TranslateText('Видаткова накладна');
  List.Cells[13,'A'].WrapText := True;
  if qAviso.FieldByName('rn_type').AsInteger = 3 then
    List.Cells[13,'C']:= TranslateText('передається по внутрішньому переміщенню комісійний товар, відпущений клієнтам по смарт-картам')
  else
    List.Cells[13,'C']:= TranslateText('передається по внутрішньому переміщенню товар, відпущений клієнтам по смарт-картам');
  List.Cells[13,'C'].WrapText := True;
  List.Cells[13,'F']:= '=H5';
  List.Cells[13,'G'].NumberFormat := '@';
  List.Cells[13,'G']:= slAcc[2];
  List.Cells[13,'H'].NumberFormat := '@';  
  List.Cells[13,'H']:= slAcc[3];
  slAcc.Free;
  if qAviso.FieldByName('rn_type').AsInteger = 3 then
    List.Cells[14,'C']:= TranslateText('Передача комісійного товару, що зазначено вище:')
  else
    List.Cells[14,'C']:= TranslateText('Передача валових витрат по товару, що зазначено вище:');

  List.Cells[14,'C'].HorizontalAlignment := xlCenter;
  List.Cells[14,'F']:= '=-H5';
  List.Cells[16,'A']:= TranslateText('В разі, якщо рекламація не получена від Вас протягом:');
  List.Cells[17,'C']:= TranslateText('2 днів,проведення будемо вважати прийнятим');
  List.Cells[17,'C'].HorizontalAlignment := xlCenter;
  List.Cells[17,'F']:= TranslateText('Гол.бухгалтер');
  List.Cells[17,'F'].HorizontalAlignment := xlCenter;
  List.Cells[13,'F'].RowHeight := 32;
  DrawNetInExcel(List,6,8,4,6);
  DrawNetInExcel(List,1,8,10,13);
  DrawNetInExcel(List,6,8,14,14);
  DrawLineInExcelByRange(List,'A6:E6',xlEdgeBottom,1,xlSingle);
  DrawLineInExcelByRange(List,'C2:C6',xlEdgeLeft,1,xlSingle);
  // Запосление динамическими данными
  if qAvisoBEGIN_DATE.IsNull then
    List.Cells[3,'A']:= FormatDateTime2('dd.mm.yyyy',qAvisoDATE_.AsDateTime)
  else
    List.Cells[3,'A']:= Format(TranslateText('с %s по %s'),
      [FormatDateTime2('dd.mm.yyyy',qAvisoBEGIN_DATE.AsDateTime),
       FormatDateTime2('dd.mm.yyyy',qAvisoEND_DATE.AsDateTime)]);
  List.Cells[13,'B']:= qAvisoNUM.AsString;
  List.Cells[3,'D']:= TranslateText('АВІЗО №')+qAviso.FieldByName('avizo_num').AsString+' '+AVIZO_SYFFIX;
  List.Cells[4,'D']:= qAvisoTO_NAME.AsString;
  List.Cells[5,'D']:= qAvisoFROM_NAME.AsString;
  if qAviso.FieldByName('rn_type').AsInteger = 3 then
    List.Cells[5,'H']:= qAvisoCOUNT_.AsFloat  
  else
    List.Cells[5,'H']:= qAvisoSUMM.AsString;

  List.Rows['2:17'].EntireRow.Copy;
  List.Rows['47:62'].EntireRow.PasteSpecial;
  List.Cells[1,1].Copy;

  qAviso.Close;
end;
//==============================================================================
procedure TCardRNAlienPrintForm.PrintReestrAlienFil(p_Id,p_Inst: integer; XLApp,List: Variant);
const
  firstrow = 7;
var
  i: integer;
begin
  _OpenQueryPar(
    qReestr,
    ['rn_id' ,  p_Id,
     'rn_inst', p_Inst]);
  List.Name := 'Реестр';
  List.PageSetup.Zoom := False;
  List.PageSetup.PrintArea := '$A$1:$H$64';

  // Форматирование и заполнение статическими данными
  if qReestr.FieldByName('rn_type').AsInteger = 3 then
    ExSetColumnWidth(List,1,[15,25,15,15,0{скрыть},0{скрыть},25])
  else
    ExSetColumnWidth(List,1,[15,25,15,15,10,15,25]);

  // Шапка документа
  List.Cells[1,'B']:= Format(TranslateText('Реестр к Расходной накладной № %s от %sг.'),
    [qReestr.FieldByName('num').AsString,
     qReestr.FieldByName('date_').AsString]);
  if qReestr.FieldByName('rn_type').AsInteger = 3 then
    List.Cells[2,'B']:= TranslateText('на внутреннее перемещение комиссионного товара, отпущенного по смарт-картам контрагентам')  
  else
    List.Cells[2,'B']:= TranslateText('на внутреннее перемещение товара, отпущенного по смарт-картам контрагентам');


  List.Cells[3,'B']:= qReestr.FieldByName('from_name').AsString;
  List.Cells[4,'B']:= Format(TranslateText('за период с %s по %s'),
    [qReestr.FieldByName('begin_date').AsString,
     qReestr.FieldByName('end_date').AsString]);
  for i:= 1 to 4 do
    List.Cells[i,'B'].Font.Bold:=TRUE;
  // Шапка табличной части
  ExPutValues(List,6,1,
    [TranslateText('Дата отгрузки'),TranslateText('Нефтепродуктродукт'),TranslateText('Партия'),
     TranslateText('Отпущено, т'),TranslateText('Цена за 1 т без НДС'),TranslateText('Сумма без НДС'),
     TranslateText('Место передачи')]);
  List.Range['A6:G6'].WrapText := True;
  List.Range['A6:G6'].Interior.ColorIndex:=34;
  List.Range['A6:G6'].HorizontalAlignment := xlCenter;
  List.Range['A6:G6'].VerticalAlignment := xlCenter;
  List.Range['A6:G6'].Font.Bold := True;
  // Табличная часть
  i := PuTOilQueryToExcelEnh(XLApp,List,qReestr,firstrow,nil,0,'date_det;np_name;dog\i;count_\s;price;summ\s;fullazsname');
  DrawNetInExcel(List,1,7,firstrow-1,i-2);
  DrawNetInExcel(List,1,7,firstrow-1,i-2,3,false);
  DrawNetInExcel(List,1,7,firstrow-1,firstrow-1,3,false);
  List.PageSetup.Orientation := xlPortrait;
  {List.PageSetup.DifferentFirstPageHeaderFooter := True;
  List.PageSetup.RightHeader := '&P из &N';}
  List.PageSetup.PrintTitleRows := '$6:$6';
  List.PageSetup.PrintArea := '$A$1:$G$'+IntToStr(i-2);
  List.PageSetup.FitToPagesWide := 1;
  List.PageSetup.FitToPagesTall := 100;
  qReestr.Close;
end;
//==============================================================================
procedure TCardRNAlienPrintForm.qGridBeforePost(DataSet: TDataSet);
begin
  {if (qGridIsBetweenFil.AsString='N') and (qGridNext_Num.AsInteger=0) then
    qGridNext_Num.Value:=null;}
end;
//==============================================================================
procedure TCardRNAlienPrintForm.N1Click(Sender: TObject);
begin
  gridMain.Options:=gridMain.Options-[dgRowSelect]+[dgEditing];
  gridMain.SelectedField:=qGrid.FieldByName('next_num');
  qGrid.Edit;
end;
//==============================================================================
procedure TCardRNAlienPrintForm.qGridAfterPost(DataSet: TDataSet);
begin

end;
//==============================================================================
procedure TCardRNAlienPrintForm.dsGridStateChange(Sender: TObject);
begin
  if qGrid.State=dsBrowse then
    gridMain.Options:=gridMain.Options+[dgRowSelect]-[dgEditing];
end;
//==============================================================================
procedure TCardRNAlienPrintForm.gridMainMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  gridMain.Hint := gridMain.DataSource.DataSet.FieldByName('Name').AsString;
  gridMain.ShowHint := true;
end;
//==============================================================================

procedure TCardRNAlienPrintForm.cbUnionClick(Sender: TObject);
begin
  inherited;
  cbSplitDT.Enabled := cbUnion.Checked;
  if not cbUnion.Checked then
    cbSplitDT.Checked := False;
end;

end.
