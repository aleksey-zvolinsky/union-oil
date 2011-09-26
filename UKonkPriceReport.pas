unit UKonkPriceReport;

interface

uses uCommonForm,  Ora,SysUtils,Excel8TLB,uOilQuery,uOilStoredProc;

procedure MakeOneKonkPriceReport(List: Variant; p_Session: TOraSession;
    p_OblId: integer; p_Date: TDateTime);

implementation

uses UDbFunc,ExFunc,ExcelFunc,Main;

var Widths: array [1..1] of integer = (20);
    HEAD_ROW: integer = 8;
    FIRST_NP_COL: integer = 2;

procedure MakeOneKonkPriceReport(List: Variant; p_Session: TOraSession;
    p_OblId: integer; p_Date: TDateTime);

var qNp,q: TOilQuery;
    InstList: string;
    ColNumbers: array of integer;
    FirstMoCol: integer;

    //************************************************
    procedure ActivateQ;
    begin
        qNp:=TOilQuery.Create(nil);
        qNp.Session:=p_Session;
        qNp.Sql.Text:=
           ' select distinct decode(oo.org_type,8,0,35,0,1) as AzsMo,'+
           '        npdg.id as npg_id, npdg.name as npg_name,npdg.ord '+
           ' from oil_konk_price kp,v_org oo,oil_np_dop_group npdg '+
           ' where kp.state=''Y'' and kp.date_='''+DateToStr(p_Date)+''''+
           '       and kp.inst in ('+InstList+')'+
           '       and kp.org_id=oo.id and kp.org_inst=oo.inst '+
           '       and kp.np_dop_group_id=npdg.id '+
           ' order by AzsMo,npdg.ord ';
        _OpenQueryOra(qNp);
    end;
    //************************************************
    procedure MakeHead;
    var i: integer;
        s: string;
    begin
        for i:=Low(Widths) to High(Widths) do
            List.Columns[i].ColumnWidth:=Widths[i];
        i:=FIRST_NP_COL; FirstMoCol:=0;
        SetLength(ColNumbers,qNp.RecordCount);
        while not qNp.Eof do begin
            List.Cells[HEAD_ROW+1,i]:=qNp.FieldByName('npg_name').AsString;
            ColNumbers[i-FIRST_NP_COL+1]:=qNp.FieldByName('npg_id').AsInteger;
            if (FirstMoCol=0) and (qNp.FieldByName('AzsMo').AsInteger=1) then
                FirstMoCol:=i-FIRST_NP_COL+1;
            qNp.Next; inc(i);
        end;
        s:=GetExcelRange(HEAD_ROW,FIRST_NP_COL,HEAD_ROW,FIRST_NP_COL+FirstMoCol-2);
        List.Range[s].Merge;
        List.Range[s]:=TranslateText('Розница АЗС (литр)');
        s:=GetExcelRange(HEAD_ROW,FIRST_NP_COL+FirstMoCol-1,HEAD_ROW,FIRST_NP_COL+Length(ColNumbers)-1);
        List.Range[s].Merge;
        List.Range[s]:=TranslateText('Мелкий опт бензовозы (литр)');
        s:=GetExcelRange(HEAD_ROW,1,HEAD_ROW+1,1);
        List.Range[s].Merge;
        List.Range[s]:=TranslateText('Наименование');
        s:=GetExcelRange(HEAD_ROW,1,HEAD_ROW+1,FIRST_NP_COL+Length(ColNumbers)-1);
        List.Range[s].HorizontalAlignment:=xlCenter;
        List.Range[s].VerticalAlignment:=xlCenter;
        List.Range[s].Font.Bold:=TRUE;
        List.Range[s].Interior.ColorIndex:=34;
        DrawNetInExcel(List,1,FIRST_NP_COL+Length(ColNumbers)-1,HEAD_ROW,HEAD_ROW+1);
        DrawNetInExcel(List,1,FIRST_NP_COL+Length(ColNumbers)-1,HEAD_ROW,HEAD_ROW+1,xlMedium,FALSE);
        DrawNetInExcel(List,2,FIRST_NP_COL+FirstMoCol-2,HEAD_ROW,HEAD_ROW+1,xlMedium,FALSE);
    end;
    //************************************************

begin
    InstList:=GetOblInstList(p_OblId);

    //ActivateQ;
    //MakeHead;
end;

end.
