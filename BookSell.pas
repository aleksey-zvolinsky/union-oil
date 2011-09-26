unit BookSell;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ToolEdit, Db, DBTables, ComObj, Excel8TLB,
  Grids, DBGrids, RxLookup, ExtCtrls, uCommonForm,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess,uDBFunc;

type
  TBookSellForm = class(TCommonForm)
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    lOrg: TLabel;
    Panel1: TPanel;
    edOrg: TComboEdit;
    Q: TOilQuery;
    qOrg: TOilQuery;
    cbNumberFilial: TCheckBox;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    cbPrintOKPO: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure MakeBookSellReport(id,inst:double;ddate1,ddate2:TDateTime);
    procedure ActivateQ(id,inst:double;ddate1,ddate2:TDateTime);
    procedure FormCreate(Sender: TObject);
    procedure edOrgButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BookSellForm: TBookSellForm;
  XLApp,List:Variant;

implementation

uses Main, chooseorg, ExFunc;

{$R *.DFM}

procedure TBookSellForm.ActivateQ(id,inst:double;ddate1,ddate2:TDateTime);
var Txt:string;
begin
     Txt:='select distinct VOSB.num,VOSB.s_date,vosb.f_doc,VOSB.organ_name as name,VOSB.organ_naln as nal_num,VOSB.organ_okpo as okpo,VOSB.nds_t,VOSB.nds_p_base,VOSB.nds_p_20,VOSB.nds_np_base,VOSB.nds_np_20,VOSB.frasch,VOSB.r_date, sale_txt '+
          'from v_oil_sale_book VOSB '+
          'where VOSB.from_='+FloatToStr(id)+' and VOSB.from_inst='+FloatToStr(inst)+' and s_date>='''+DateToStr(ddate1)+''' and s_date<='''+DateToStr(ddate2)+''''+
          'order by s_date,num,name';
     if Q.Active then Q.Close;
     Q.Sql.Text:=Txt;
     Q.Open;
end;

procedure TBookSellForm.MakeBookSellReport(id,inst:double;ddate1,ddate2:TDateTime);
var
    COORD_PO,COORD_NAL_NUM,COORD_SVID_NUM,COORD_BEGINED,COORD_FINISHED,COORD_YEAR,COORD_NUMBER:string;
    COL_NUMBER,COL_NAKLNUMBER,COL_VYPDATE,COL_ORGNAME,COL_NALNUM,COL_OKPO,COL_FULLSELL1,COL_FULLSELL2,
    COL_PLATBASE,COL_PLATNDS,COL_NONPLATBASE,COL_NONPLATNDS,COL_RASFORM,COL_RASDATE,
    FIRSTLINE:integer;

    CurrentLine,FirstDateLine:integer;
    CurrentDate:TDateTime;

    SumFullSell,SumPlatBase,SumPlatNds,SumNonPlatBase,SumNonPlatNds:double;
    procedure ActivateXLApp;
    var FileName,PatternName:string;
        ISheet: Excel8TLB._Worksheet;
        IWorkBook: Excel8TLB._WorkBook;
    begin
      MainForm.CreateExcel(FALSE);
      if not Assigned(MainForm.IXLSApp) then
      begin
          ShowMessage(TranslateText('При попытке открыть Excel произошла ошибка'));
          Exit;
      end;
      FileName:=GetMainDir+'Doc\Книга учета продаж с '+DateToStr(ddate1)+TranslateText(' по ')+DateToStr(ddate2); // *NO_TRANSLATE*
      PatternName:=GetMainDir+'Pattern\BookSell.xls';
      CopyFile(PChar(PatternName),PChar(FileName+'.xls'),FALSE);
      IWorkbook := MainForm.AddWorkbook(FileName+'.xls');
      ISheet := IWorkbook.Worksheets.Item['Лист1'] as Excel8TLB._Worksheet; // *NO_TRANSLATE*
      List := ISheet;
    end;

    procedure InitConst;
    begin
         COORD_PO:='J2';
         COORD_NAL_NUM:='A4';
         COORD_SVID_NUM:='A5';
         COORD_BEGINED:='A6';
         COORD_FINISHED:='D6';
         COORD_YEAR:='W4';
         COORD_NUMBER:='W5';
         COL_NUMBER:=1;
         COL_NAKLNUMBER:=2;
         COL_VYPDATE:=3;
         COL_ORGNAME:=4;
         COL_NALNUM:=5;
         COL_OKPO:=6;
         COL_FULLSELL1:=7;
         COL_FULLSELL2:=16;
         COL_PLATBASE:=17;
         COL_PLATNDS:=18;
         COL_NONPLATBASE:=19;
         COL_NONPLATNDS:=20;
         COL_RASFORM:=25;
         COL_RASDATE:=26;
         FIRSTLINE:=15;
    end;

    procedure ObnulSum;
    begin
         SumFullSell:=0;
         SumPlatBase:=0;
         SumPlatNds:=0;
         SumNonPlatBase:=0;
         SumNonPlatNds:=0;
    end;

    function itoa(x:integer):string;
    begin
         result:=''+chr(ord('A')+x-1);
    end;

    procedure PutToCell(Coord,s:string);
    var x,y:integer;
    begin
         y:=ord(Coord[1])-ord('A')+1;
         x:=StrToInt(copy(Coord,2,255));
         List.Cells[x,y]:=s;
    end;

    procedure PutNotNul(x,y:integer;r:double);
    begin
         if r<>0 then List.Cells[x,y]:=r;
    end;

    procedure MakeHead;
    begin
         PutToCell(COORD_PO,TranslateText('по ')+qOrg.FieldByName('Name').AsString+', '+QOrg.FieldByName('Addr').AsString);
         PutToCell(COORD_NAL_NUM,TranslateText('Индивидуальный налоговый номер ___')+QOrg.FieldByName('Nal_num').AsString);
         PutToCell(COORD_SVID_NUM,TranslateText('Свидетельство о регистрации плательщика налога на добавочную стоимость ___')+QOrg.FieldByName('Svid_num').AsString);
         PutToCell(COORD_BEGINED,TranslateText('Начато ____')+DateToStr(ddate1));
         PutToCell(COORD_FINISHED,TranslateText('Закончено ____')+DateToStr(ddate2));
    end;

    procedure MakeFrame(x1,y1,x2,y2:integer);
    var rng:string;
    begin
         rng:=chr(ord('A')+y1-1)+IntToStr(x1)+':'+chr(ord('A')+y2-1)+IntToStr(x2);
         List.Range[rng].Borders[xlEdgeLeft].LineStyle:=1;
         List.Range[rng].Borders[xlEdgeRight].LineStyle:=1;
         List.Range[rng].Borders[xlEdgeTop].LineStyle:=1;
         List.Range[rng].Borders[xlEdgeBottom].LineStyle:=1;
    end;

    procedure WriteLine;
    var
      ss      :string;
    begin
         List.Cells[CurrentLine,COL_NUMBER]:=CurrentLine-FIRSTLINE+1;
         if(cbNumberFilial.Checked)and(FILIAL_NUMBER<>'0')then
           List.Cells[CurrentLine,COL_NAKLNUMBER]:=Q.FieldByName('num').asString +' / '+ FILIAL_NUMBER
         else
           List.Cells[CurrentLine,COL_NAKLNUMBER]:=Q.FieldByName('num').asString;
         List.Cells[CurrentLine,COL_VYPDATE]:=Q.FieldByName('s_date').asString;
         ss:= copy(Q.FieldByName('SALE_TXT').AsString,1,20);
         if ss = TranslateText('Общ. прод. непл. НДС') then
           List.Cells[CurrentLine,COL_ORGNAME]:=Q.FieldByName('sale_txt').AsString
         else
         begin
           ss:= copy(Q.FieldByName('F_DOC').AsString,1,20);
           if ss = TranslateText('Общ. прод. непл. НДС') then
             List.Cells[CurrentLine,COL_ORGNAME]:=Q.FieldByName('f_doc').AsString
           else
             List.Cells[CurrentLine,COL_ORGNAME]:=Q.FieldByName('name').AsString;
         end;
         List.Cells[CurrentLine,COL_NALNUM]:=Q.FieldByName('nal_num').AsString;
         List.Cells[CurrentLine,COL_OKPO]:=Q.FieldByName('okpo').AsString;
         List.Cells[CurrentLine,COL_FULLSELL1]:=Q.FieldByName('nds_t').AsFloat;
         List.Cells[CurrentLine,COL_FULLSELL2]:=Q.FieldByName('nds_t').AsFloat;

         PutNotNul(CurrentLine,COL_PLATBASE,Q.FieldByName('nds_p_base').AsFloat);
         PutNotNul(CurrentLine,COL_PLATNDS,Q.FieldByName('nds_p_20').AsFloat);
         PutNotNul(CurrentLine,COL_NONPLATBASE,Q.FieldByName('nds_np_base').AsFloat);
         PutNotNul(CurrentLine,COL_NONPLATNDS,Q.FieldByName('nds_np_20').AsFloat);

         List.Cells[CurrentLine,COL_RASFORM]:=Q.FieldByName('frasch').AsString;
         List.Cells[CurrentLine,COL_RASDATE]:=Q.FieldByName('r_date').Value;
         inc(CurrentLine);
    end;

    procedure IncSum;
    begin
         SumFullSell:=SumFullSell+Q.FieldByName('nds_t').AsFloat;
         SumPlatBase:=SumPlatBase+Q.FieldByName('nds_p_base').AsFloat;
         SumPlatNDS:=SumPlatNDS+Q.FieldByName('nds_p_20').AsFloat;
         SumNonPlatBase:=SumNonPlatBase+Q.FieldByName('nds_np_base').AsFloat;
         SumNonPlatNDS:=SumNonPlatNds+Q.FieldByName('nds_np_20').AsFloat;
    end;

    procedure WriteSum(X,Y,XBegin:integer);
    begin
         List.Cells[X,Y]:='=SUM('+itoa(Y)+IntToStr(XBegin)+':'+itoa(Y)+IntToStr(X-1)+')';
    end;

    procedure WriteDateItogo;
    begin
         List.Cells[CurrentLine,1]:=TranslateText('Всего за ')+DateToStr(CurrentDate);
         WriteSum(CurrentLine,COL_FULLSELL1,FirstDateLine);
         WriteSum(CurrentLine,COL_FULLSELL2,FirstDateLine);
         WriteSum(CurrentLine,COL_PLATBASE,FirstDateLine);
         WriteSum(CurrentLine,COL_PLATNDS,FirstDateLine);
         WriteSum(CurrentLine,COL_NONPLATBASE,FirstDateLine);
         WriteSum(CurrentLine,COL_NONPLATNDS,FirstDateLine);
         MakeFrame(CurrentLine,1,CurrentLine,COL_RASDATE);
         inc(CurrentLine);
    end;

    procedure WriteItogo;
    begin
         List.Cells[CurrentLine,1]:=TranslateText('Всего c ')+DateToStr(ddate1)+TranslateText(' по ')+DateToStr(ddate2);
         List.Cells[CurrentLine,COL_FULLSELL1]:=SumFullSell;
         List.Cells[CurrentLine,COL_FULLSELL2]:=SumFullSell;
         List.Cells[CurrentLine,COL_PLATBASE]:=SumPlatBase;
         List.Cells[CurrentLine,COL_PLATNDS]:=SumPlatNds;
         List.Cells[CurrentLine,COL_NONPLATBASE]:=SumNonPlatBase;
         List.Cells[CurrentLine,COL_NONPLATNDS]:=SumNonPlatNds;
         inc(CurrentLine);
    end;
    
    procedure DeleteOKPO;
    begin
      List.Cells[14,7]:= 6;
      List.Range['F:F'].Delete(xlToLeft);
    end;
begin
    ActivateQ(id,inst,ddate1,ddate2);
    if Q.RecordCount=0 then
    begin
         ShowMessage(TranslateText('Ничего нет'));
         Exit;
    end;
    ActivateXLApp;
    InitConst;
    ObnulSum;
    MakeHead;
    CurrentLine:=FIRSTLINE;
    CurrentDate:=Q.FieldByName('s_date').Value;
    FirstDateLine:=FIRSTLINE;
    while not Q.Eof do
    begin
         if Q.FieldByName('s_date').Value<>CurrentDate then
         begin
              WriteDateItogo;
              CurrentDate:=Q.FieldByName('s_date').Value;
              FirstDateLine:=CurrentLine;
         end;
         WriteLine;
         IncSum;
         Q.Next;
    end;
    WriteDateItogo;
    WriteItogo;
    if not(cbPrintOKPO.Checked) then DeleteOKPO;
    List.Cells[CurrentLine+2,1]:=TranslateText('Подпись лица, ответственного за заполнение книги ____________');
    MainForm.ShowExcel;
end;

procedure TBookSellForm.BitBtn1Click(Sender: TObject);
begin
     qOrg.Close;
     qOrg.SQL.Text := 'select * from v_org where id='+IntToStr(edOrg.Tag)+' and inst='+IntToStr(lOrg.Tag);
     qOrg.Open;
     DefineRepDates(DateEdit1.Date,DateEdit2.Date);
     MakeBookSellReport(edOrg.Tag,lOrg.Tag,DateEdit1.Date,DateEdit2.Date);
     DefineRepDates(0,0);
end;

procedure TBookSellForm.FormCreate(Sender: TObject);
begin
inherited;
     DateEdit1.Date:=Date-1;
     DateEdit2.Date:=Date;
     edOrg.Tag := MAIN_ORG.id;
     lOrg.Tag := MAIN_ORG.Inst;
     edOrg.Text  := MAIN_ORG.Name;
end;

procedure TBookSellForm.edOrgButtonClick(Sender: TObject);
  var vId, vInst :integer;
      vName :string;
begin
 if ChooseOrg.CaptureOrg(1,Main_id,Inst,'yyy',vId,vInst,vName) then
 begin
   edOrg.Text := vName;
   edOrg.Tag := vId;
   lOrg.Tag := vInst;
 End;
end;

end.
