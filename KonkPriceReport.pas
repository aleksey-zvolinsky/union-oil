unit KonkPriceReport;
{### 3.05 }

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MemDS, DBAccess, Ora, Excel8TLB, ComObj, ActiveX, FileCtrl,uOilQuery,uOilStoredProc;

type
  TKonkPriceReportDM = class(TDataModule)
    qNp: TOilQuery;
    q: TOilQuery;
    qObls: TOilQuery;
    qInstList: TOilQuery;
    qInstListID: TFloatField;
    qInstListNAME: TStringField;
    qORG_NAME: TStringField;
    qORG_ID: TFloatField;
    qORG_INST: TFloatField;
    qNP_DOP_GROUP: TFloatField;
    qNP_DOP_GROUP_NAME: TStringField;
    qPODR_ID: TFloatField;
    qPODR_NAME: TStringField;
    qINST: TFloatField;
    qORD: TFloatField;
    qDENSITY: TFloatField;
    qPRICE: TFloatField;
    qAZSMO: TFloatField;
    qKONK_DEP_NAME: TStringField;
    qPRICE_TONN: TFloatField;
    qOblsOBLID: TFloatField;
    qOblsOBLNAME: TStringField;
    qDop: TOilQuery;
    qDopFROM_ID: TFloatField;
    qDopFROM_INST: TFloatField;
    qDopLINK_TYPE_ID: TFloatField;
    qDopDISTANCE: TFloatField;
    qDopORG_ID: TFloatField;
    qDopORG_NAME: TStringField;
    qDopPAR_ID: TFloatField;
    qDopPAR_NAME: TStringField;
    qKONK_DEP_ID: TFloatField;
    qPODR_INST: TFloatField;
    procedure MakeOneKonkPriceReport(XLApp,List: Variant; p_Session: TOraSession;
                   p_OblId: integer; p_Date: TDateTime);
  private
    { Private declarations }
    ColNumbers: array [1..100] of integer;
    LogMaking: Boolean;
  public
    { Public declarations }
  end;

var
  KonkPriceReportDM: TKonkPriceReportDM;

procedure MakeKonkPriceReport(p_Session: TOraSession;
    p_OblIdList: string; p_Date: TDateTime);

implementation

{$R *.DFM}

//uses ExcelFunc;

var HEAD_ROW: integer = 5;
    FIRST_NP_COL: integer = 2;
    LOG_FILE_NAME: string = 'c:\konkprice.log';

//==============================================================================
procedure _log(p_Str: string; p_Depth: integer=0);
var F: Text;
    i: integer;
begin
    exit;
    AssignFile(F,LOG_FILE_NAME);
    Append(F);
    for i:=1 to p_Depth do p_Str:='    '+p_Str;
    Writeln(F,p_Str);
    CloseFile(F);
end;
//==============================================================================
procedure ClearLog;
var F: Text;
begin
    AssignFile(F,LOG_FILE_NAME);
    Rewrite(F);
    CloseFile(F);
end;
//==============================================================================
function GetShortOblName(p_Id: integer):string;
begin
    case p_ID of
           7 : result:=TranslateText('Сумы');
          12 : result:=TranslateText('Житомир');
          19 : result:=TranslateText('Кировоград');
          27 : result:=TranslateText('Черкассы');
          37 : result:=TranslateText('Хмельницкий');
          53 : result:=TranslateText('Ровно');
          55 : result:=TranslateText('Тернополь');
          99 : result:=TranslateText('Днепр');
         109 : result:=TranslateText('Умань');
         138 : result:=TranslateText('Чернигов');
         147 : result:=TranslateText('Кривбасс');
         149 : result:=TranslateText('Черновцы');
         181 : result:=TranslateText('Харьков');
         200 : result:=TranslateText('Львов');
         201 : result:=TranslateText('Николаев');
         313 : result:=TranslateText('Бровары');
         357 : result:=TranslateText('Луцк');
         382 : result:=TranslateText('Интер-трейдинг');
         394 : result:=TranslateText('Крым');
         400 : result:=TranslateText('Винница');
        4331 : result:=TranslateText('Тирос');
    else result:=TranslateText('Незивестна');
    end;
end;
//==============================================================================
function ExcelNumberToColumn(n:integer):string;
begin
     if (n<1) or (n>8*26+22) then
        Raise Exception.Create('ExcelNumberToColumn('+IntToStr(n)+TranslateText('): аргумент из неверного диапазона'));
     if n<=26 then result:=chr(ord('A')+n-1)
     else result:=chr((n-1) div 26+ord('A')-1)+chr(ord('A')+(n-1) mod 26);
end;
//==============================================================================
function GetExcelRange(top,left,bottom,right:integer):string;
begin
    result:=ExcelNumberToColumn(left)+IntToStr(top)+':'+ExcelNumberToColumn(right)+IntToStr(bottom);
end;
//==============================================================================
procedure DrawLineInExcelByRange(p_List:Variant;p_Range:string;
          p_Position:integer;p_LineStyle:integer=1;p_Weight:integer=xlSingle);
begin
    p_List.Range[p_Range].Borders[p_Position].LineStyle:=p_LineStyle;
    p_List.Range[p_Range].Borders[p_Position].Weight:=p_Weight;
end;
//==============================================================================
procedure DrawLineInExcel(p_List:Variant;p_Left,p_Right,p_Top,p_Bottom:integer;
          p_Position:integer;p_LineStyle:integer=1;p_Weight:integer=xlSingle);
var range:string;
begin
    range:=ExcelNumberToColumn(p_Left)+IntToStr(p_Top)+':'+
           ExcelNumberToColumn(p_Right)+IntToStr(p_Bottom);
    DrawLineInExcelByRange(p_List,range,p_Position,p_LineStyle,p_Weight);
end;
//==============================================================================
procedure DrawNetInExcel(p_List:Variant;p_Left,p_Right,p_Top,p_Bottom:integer; p_Weight:integer=xlSingle;p_Inside:Boolean=TRUE);
var range:string;
begin
    _log(TranslateText('Вход в DrawNetInExcel'),5);
    range:=ExcelNumberToColumn(p_Left)+IntToStr(p_Top)+':'+
           ExcelNumberToColumn(p_Right)+IntToStr(p_Bottom);
    DrawLineInExcelByRange(p_List,range,xlEdgeTop,1,p_Weight);
    DrawLineInExcelByRange(p_List,range,xlEdgeBottom,1,p_Weight);
    DrawLineInExcelByRange(p_List,range,xlEdgeLeft,1,p_Weight);
    DrawLineInExcelByRange(p_List,range,xlEdgeRight,1,p_Weight);
    if p_Inside and (p_Right-p_Left>0) then DrawLineInExcelByRange(p_List,range,xlInsideVertical,1,p_Weight);
    if p_Inside and (p_Bottom-p_Top>0) then DrawLineInExcelByRange(p_List,range,xlInsideHorizontal,1,p_Weight);
    _log(TranslateText('Выход из DrawNetInExcel'),5);
end;
//==============================================================================
procedure ActivateXLApp(PName,FName:string;ListNumber:integer;var XLApp,List:Variant;ListName:string='');
var s,MainDir,PatternName,FileName,DocDir,PatternDir:String;
    Unknown:iUnknown;
    i: integer;
begin
     if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
        XLApp := GetActiveOleObject('Excel.Application')
     else XLApp := CreateOleObject('Excel.Application');

     s:=Application.ExeName;
     for i:=length(s) downto 1 do
         if s[i]='\' then break;
     MainDir:=copy(s,1,i);

     if DirectoryExists(MainDir+'Pattern') then begin
        DocDir:='Doc'; PatternDir:='Pattern';
     end else begin
        DOcDir:=TranslateText('документы'); PatternDir:=TranslateText('шаблоны');
     end;
     PatternName:=MainDir+PatternDir+'\'+PName+'.xls';
     FileName:=MainDir+DocDir+'\'+FName+'.xls';
     CopyFile(PChar(PatternName),PChar(Filename),FALSE);
     XLApp.Workbooks.Add(Filename);
     if ListName='' then List:=XLApp.ActiveWorkBook.Worksheets[ListNumber]
                    else List:=XLApp.ActiveWorkBook.Worksheets[ListName];
end;
//==============================================================================
procedure TKonkPriceReportDM.MakeOneKonkPriceReport(XLApp,List: Variant; p_Session: TOraSession;
    p_OblId: integer; p_Date: TDateTime);
var InstList,FilterInstList: string;
    FirstMoCol,ColNumbersSize,LastNpCol,LastCol: integer;
    //**************************************************************************
    procedure ActivateQ;
    begin
        if qNp.Session<>p_Session then begin
           qNp.Session:=p_Session;
           q.Session:=p_Session;
           qDop.Session:=p_Session;
           qObls.Session:=p_Session;
           qInstList.Session:=p_Session;
        end;
        if qNp.Active then qNp.Close;
        qNp.ParamByName('date_').AsDateTime:=Trunc(p_Date);
        qNp.Macros.MacroByName('InstList').Value:=InstList;
        qNp.Open;

        if not q.Active or (q.ParamByName('date_').AsDateTime<>p_Date) then begin
           if q.Active then q.Close;
           q.ParamByName('date_').Value:=p_Date;
           q.Open;
        end;
        if q.Tag<>p_OblId then begin
           q.Filter:=FilterInstList;
           q.Filtered:=TRUE;
           q.Tag:=p_OblId;
        end;
        qDop.Open;
    end;
    //**************************************************************************
    procedure MakeHead;
    var i,n: integer;
        s: string;
    begin
        List.Cells[2,1]:=TranslateText('Цены конкурентов, ')+GetShortOblName(p_OblId)+TranslateText(' на ')+DateToStr(p_Date);
        List.Cells[2,1].Font.Bold:=TRUE;
        List.Cells[2,1].Font.Size:=14;

        i:=FIRST_NP_COL; FirstMoCol:=0;
        ColNumbersSize:=qNp.RecordCount;
        while not qNp.Eof do begin
            List.Cells[HEAD_ROW+1,i]:=qNp.FieldByName('npg_name').AsString;
            ColNumbers[i-FIRST_NP_COL+1]:=qNp.FieldByName('npg_id').AsInteger;
            if (FirstMoCol=0) and (qNp.FieldByName('AzsMo').AsInteger=1) then
                FirstMoCol:=i-FIRST_NP_COL+1;
            qNp.Next; inc(i);
        end;
        if (FirstMoCol>1) or (ColNumbersSize>0) then begin
           if FirstMoCol>1 then n:=FIRST_NP_COL+FirstMoCol-2
           else n:=FIRST_NP_COL+ColNumbersSize-1;
           s:=GetExcelRange(HEAD_ROW,FIRST_NP_COL,HEAD_ROW,n);
           List.Range[s].Merge;
           List.Range[s]:=TranslateText('Розница АЗС (литр)');
        end;
        LastNpCol:=FIRST_NP_COL+ColNumbersSize-1;
        LastCol:=LastNpCol+3;
        if FirstMoCol>0 then begin
           s:=GetExcelRange(HEAD_ROW,FIRST_NP_COL+FirstMoCol-1,HEAD_ROW,LastNpCol);
           List.Range[s].Merge;
           List.Range[s]:=TranslateText('Мелкий опт бензовозы (литр)');
        end;
        List.Columns[1].VerticalAlignment:=xlCenter;
        List.Columns[1].HorizontalAlignment:=xlLeft;
        s:=GetExcelRange(HEAD_ROW,1,HEAD_ROW+1,1);
        List.Range[s].Merge;
        List.Range[s]:=TranslateText('Наименование');
        for i:=1 to 3 do begin
            s:=GetExcelRange(HEAD_ROW,LastNpCol+i,HEAD_ROW+1,LastNpCol+i);
            List.Range[s].Merge;
        end;
        List.Cells[HEAD_ROW,LastNpCol+1]:=TranslateText('Конкурирующие АЗС');
        List.Cells[HEAD_ROW,LastNpCol+2]:=TranslateText('Поставщики');
        List.Cells[HEAD_ROW,LastNpCol+3]:=TranslateText('Нефтебазы');

        s:=GetExcelRange(HEAD_ROW,1,HEAD_ROW+1,LastCol);
        List.Range[s].HorizontalAlignment:=xlCenter;
        List.Range[s].VerticalAlignment:=xlCenter;
        List.Range[s].Font.Bold:=TRUE;
        List.Range[s].Interior.ColorIndex:=34;
        {DrawNetInExcel(List,1,LastCol,HEAD_ROW,HEAD_ROW+1);
        DrawNetInExcel(List,1,LastNpCol,HEAD_ROW,HEAD_ROW+1,xlMedium,FALSE);
        DrawNetInExcel(List,1,LastCol,HEAD_ROW,HEAD_ROW+1,xlMedium,FALSE);
        if FirstMoCol>0 then
           DrawNetInExcel(List,2,FIRST_NP_COL+FirstMoCol-2,HEAD_ROW,HEAD_ROW+1,xlMedium,FALSE);}
    end;
    //**************************************************************************
    procedure DefineInstList;
    begin
        if qInstList.Active then qInstList.Close;
        if qInstList.Session<>p_Session then qInstList.Session:=p_Session;
        qInstList.ParamByName('id').AsInteger:=p_OblId;
        qInstList.Open;
        InstList:=''; FilterInstList:='';
        while not qInstList.Eof do begin
            InstList:=InstList+qInstListId.AsString+',';
            FilterInstList:=FilterInstList+' inst='+qInstListId.AsString+' or';
            qInstList.Next;
        end;
        SetLength(InstList,length(InstList)-1);
        SetLength(FilterInstList,length(FilterInstList)-3);
    end;
    //**************************************************************************
    procedure FillData;
    var CurLine,CurOrgId,CurOrgInst,CurPodrId,CurPodrInst,CurInst,nrow,nnp: integer;
        NameWritten,PodrWritten: Boolean;
        s,spaces: string;
        //----------------------------------------------------------------------
        procedure ShapeOldOrg;
        begin
            {DrawNetInExcel(List,1,LastCol,CurLine,CurLIne+nrow-1);
            DrawNetInExcel(List,1,LastNpCol,CurLine,CurLIne+nrow-1,xlMedium,FALSE);
            DrawNetInExcel(List,1,LastCol,CurLine,CurLIne+nrow-1,xlMedium,FALSE);}
        end;
        //----------------------------------------------------------------------
        function GetPponNum(p_Id: integer; p_Name: string):string;
        var n: integer;
            s: string;
        begin
            n:=pos('№',p_Name);
            if n=0 then
               case p_Id of
                    27 : result:=TranslateText('Черкассы');
                    53 : result:=TranslateText('Ровно');
                    55 : result:=TranslateText('Тернополь');
                    99 : result:=TranslateText('Днепр');
                   109 : result:=TranslateText('Умань');
                   147 : result:=TranslateText('Кривбасс');
                   178 : result:=TranslateText('Структурное');
                   181 : result:=TranslateText('Харьков');
                   200 : result:=TranslateText('Львов');
                   223 : result:=TranslateText('Николаев');
                   224 : result:=TranslateText('Новый Буг');
                   225 : result:=TranslateText('Снигиревка');
                   226 : result:=TranslateText('Явкино');
                   227 : result:=TranslateText('Казанка');
                   228 : result:=TranslateText('Новая Одесса');
                   229 : result:=TranslateText('Вознесенск');
                   313 : result:=TranslateText('Бровары');
                   357 : result:=TranslateText('Луцк');
                   394 : result:=TranslateText('Крым');
                   400 : result:=TranslateText('Винница');
                   412 : result:=TranslateText('Людмиловка');
                  4331 : result:=TranslateText('Тирос');
               else result:='';
               end
            else begin
               s:=copy(p_Name,n+1,length(p_Name));
               if s[1]=' ' then result:=''
               else begin
                  n:=pos(' ',s);
                  result:=TranslateText('Ф.')+copy(s,1,n-1);
               end;
            end;
            if result<>'' then result:=result+': ';
        end;
        //----------------------------------------------------------------------
        procedure PutDopInfo(p_Id,p_Inst,p_DepInst:integer);
        var sAzs1,sAzs2,sNb,sPost,s: string;
        begin
            qDop.Filter:='from_id='+IntToStr(p_Id)+' and from_inst='+IntToStr(p_Inst);
            qDop.Filtered:=TRUE;
            qDop.First;
            sAzs1:=''; sAzs2:=''; sNb:=''; sPost:='';
            while not qDop.Eof do begin
               case qDopLink_Type_Id.AsInteger of
                   3: begin
                         if qDopPar_ID.AsInteger<>p_DepInst then
                            s:=GetPponNum(qDopPar_Id.AsInteger,qDopPar_Name.AsString)
                         else s:='';
                         s:=s+qDopOrg_Name.AsString;
                         if qDopDistance.AsFloat>0 then
                            s:=s+' '+qDopDistance.AsString+TranslateText('км');
                         if qDopPar_ID.AsInteger=p_DepInst then sAzs1:=sAzs1+s+';'
                         else sAzs2:=sAzs2+s+';';
                   end;
                   4: sPost:=sPost+qDopOrg_Name.AsString+';';
                   5: sNb:=sNb+qDopOrg_Name.AsString+';';
               end;
               qDop.Next;
            end;
            List.Cells[CurLine,LastNpCol+1]:=sAzs1+sAzs2;
            List.Cells[CurLine,LastNpCol+2]:=sPost;
            List.Cells[CurLine,LastNpCol+3]:=sNb;
        end;
        //----------------------------------------------------------------------
        procedure InitNewOrg;
        begin
            CurOrgId:=qOrg_ID.AsInteger;
            CurOrgInst:=qOrg_Inst.AsInteger;
            CurInst:=qInst.AsInteger;
            if qOrg_Id.AsInteger=qOrg_Inst.AsInteger then nrow:=3
                                                     else nrow:=1;
            if qAzsMo.AsInteger=0 then begin
               spaces:='       '; nnp:=1;
            end else begin
               spaces:=''; nnp:=FirstMoCol;
            end;
        end;
        //----------------------------------------------------------------------
        procedure WriteName(p_Id,p_Inst,p_AzsMo: integer; p_Name: string);
        begin
            _log(p_Name,2);
            if p_Id=p_Inst then begin
               s:=GetExcelRange(CurLine,1,CurLine+2,1);
               List.Range[s].Merge;
               List.Range[GetExcelRange(CurLine+1,FIRST_NP_COL,CurLine+1,FIRST_NP_COL+ColNumbersSize-1)].NumberFormat:='0,000';
            end;
            List.Cells[CurLine,1]:=p_Name;
            if p_AzsMo=1 then List.Cells[CurLine,1].Font.Bold:=TRUE;
            if (p_Id=p_Inst) and (p_AzsMo=1) then
                List.Range[GetExcelRange(CurLine,1,CurLine+2,LastCol)].Interior.ColorIndex:=15;
        end;
        //----------------------------------------------------------------------
    begin
        if q.RecordCount=0 then exit;
        NameWritten:=FALSE;

        PodrWritten:=(qAzsMo.AsInteger=1);
        CurLine:=HEAD_ROW+2;
        InitNewOrg;
        if qAzsMo.AsInteger=1 then begin
           CurPodrId:=qOrg_Id.AsInteger;
           CurPodrInst:=qOrg_Inst.AsInteger;
        end;
        List.Columns[ExcelNumberToColumn(FIRST_NP_COL)+':'+ExcelNumberToColumn(FIRST_NP_COL+ColNumbersSize-1)].EntireColumn.NumberFormat:='0,00';
        while not q.Eof do begin
            if (CurOrgId<>qOrg_Id.AsInteger) or (CurOrgInst<>qOrg_Inst.AsInteger)
                or (CurInst<>qInst.AsInteger)
            then begin
                NameWritten:=FALSE;
                if ((CurPodrId<>qPodr_Id.AsInteger) or (CurPodrInst<>qPodr_Inst.AsInteger))
                   and (qAzsMo.AsInteger=0)
                then
                   PodrWritten:=FALSE;
                if qAzsMo.AsInteger=1 then begin
                   _log(TranslateText('Точка 1'),3);
                   CurPodrId:=qOrg_Id.AsInteger;
                   CurPodrInst:=qOrg_Inst.AsInteger;
                   PodrWritten:=TRUE;
                end;
                ShapeOldOrg;
                _log(TranslateText('Точка 1.1'),3);
                inc(CurLine,nrow);
                if (CurOrgId=CurOrgInst) and (qOrg_Id.AsInteger<>qOrg_Inst.AsInteger) then begin
                   List.Range[GetExcelRange(CurLine,1,CurLine,FIRST_NP_COL+ColNumbersSize-1)].Merge;
                   //DrawNetInExcel(List,1,FIRST_NP_COL+ColNumbersSize-1,CurLine,CurLine,xlMedium,FALSE);
                   List.Rows[CurLine].EntireRow.RowHeight:=2;
                   List.Cells[CurLine,1].Interior.ColorIndex:=1;
                   inc(CurLine);
                   _log(TranslateText('Точка 2'),3);
                end;
                InitNewOrg;
                _log(TranslateText('Точка 2.1'),3);
            end;
            _log(TranslateText('Точка 2.2'),3);

            if not NameWritten then begin
                _log(TranslateText('Точка 2.3'),3);
                if not PodrWritten then begin
                   _log(TranslateText('Точка 2.4'),3);
                   WriteName(qPodr_Id.AsInteger,qPodr_Inst.AsInteger,1,qPodr_Name.AsString);
                   ShapeOldOrg;
                   inc(CurLine);
                   if qPodr_Id.AsInteger=qPodr_Inst.AsInteger then inc(CurLine,2);
                   PodrWritten:=TRUE;
                   CurPodrId:=qPodr_Id.AsInteger;
                   CurPodrInst:=qPodr_Inst.AsInteger;
                   _log(TranslateText('Точка 3'),3);
                end;
                WriteName(qOrg_ID.AsInteger,qOrg_Inst.AsInteger,qAzsMo.AsInteger,spaces+qOrg_Name.AsString);
                PutDopInfo(qOrg_Id.AsInteger,qOrg_Inst.AsInteger,qKonk_Dep_Id.AsInteger);
                NameWritten:=TRUE;
            end;
            while ColNumbers[nnp]<>qNp_Dop_Group.AsInteger do inc(nnp);
            _log(TranslateText('Точка 3.1'),3);
            List.Cells[CurLine,nnp+FIRST_NP_COL-1]:=qPrice.AsFloat;
            if qOrg_Id.AsInteger=qOrg_Inst.AsInteger then begin
               _log(TranslateText('Точка 4'),3);
               List.Cells[CurLine+1,nnp+FIRST_NP_COL-1]:=qDensity.AsFloat;
               List.Cells[CurLine+2,nnp+FIRST_NP_COL-1]:=qPrice_Tonn.AsFloat;
            end;
            q.Next;
            _log(TranslateText('Точка 5'),3);
        end;
        ShapeOldOrg;
        List.Columns['A:'+ExcelNumberToColumn(LastCol-3)].EntireColumn.AutoFit;
        List.Columns[ExcelNumberToColumn(LastCol-2)+':'+ExcelNumberToColumn(LastCol)].EntireColumn.ColumnWidth:=30;
        List.Columns[ExcelNumberToColumn(LastCol-2)+':'+ExcelNumberToColumn(LastCol)].EntireColumn.WrapText:=TRUE;
        DrawNetInExcel(List,1,LastCol,HEAD_ROW,CurLine+2);
        XLApp.Run('FormatPage',1,2000,'HOR');
        _log(TranslateText('Точка 6'),3);
    end;
    //**************************************************************************
begin
    DefineInstList;
    _Log('InstList defined',1);
    ActivateQ;
    _Log('Query activated',1);
    MakeHead;
    _Log('Excel Head created',1);
    _Log('Filling data...',1);
    FillData;
end;
//==============================================================================
procedure MakeKonkPriceReport(p_Session: TOraSession;
    p_OblIdList: string; p_Date: TDateTime);
var XLApp,List: Variant;
    DM: TKonkPriceReportDM;
    i,n: integer;
begin
    ActivateXLApp('empty','empty',1,XLApp,List);
    DM:=TKonkPriceReportDM.Create(Application);
    if DM.qObls.Active then DM.qObls.Close;
    if DM.qObls.Session<>p_Session then DM.qObls.Session:=p_Session;
    DM.qObls.ParamByName('date_').Value:=p_Date;
    if p_OblIdList<>'' then
       DM.qObls.Macros.MacroByName('InstCondition').Value:=' where oblid in ('+p_OblIdList+')'
    else DM.qObls.Macros.MacroByName('InstCondition').Value:='';
    DM.qObls.Open;
    if DM.qObls.IsEmpty then
       Raise Exception.Create(TranslateText('Отчет с указанными параметрами не содержит данных'));
    for i:=1 to DM.qObls.RecordCount-1 do
        XLApp.WorkSheets.Add;
    n:=1;
    ClearLog;
    while not DM.qObls.Eof do begin
       List:=XLApp.WorkSheets[n];
       List.Select;
       List.PageSetup.Orientation:=xlLandscape;
       List.PageSetup.LeftMargin:=30;
       List.PageSetup.RightMargin:=30;
       List.PageSetup.TopMargin:=30;
       List.PageSetup.BottomMargin:=30;
       List.Name:=GetShortOblName(DM.qOblsOblId.AsInteger);
       _Log(DM.qOblsOblName.AsString);
       DM.MakeOneKonkPriceReport(XLApp,List,p_Session,DM.qOblsOblId.AsInteger,p_Date);
       DM.qObls.Next; inc(n);
    end;
    DM.Free;
    XLApp.Visible:=TRUE;
end;
//==============================================================================
end.
