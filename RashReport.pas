unit RashReport;
{### 1.00}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ToolEdit, Buttons, Mask, RxLookup, ExtCtrls,
  Grids, DBGrids, Excel8TLB, Menus,ComObj,ActiveX, uCommonForm,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess, DBGridEh;

const OPERFILTERMAXSIZE=30;

type OperFilter=record
         Size:integer; // размер массива А
         A:array [1..OPERFILTERMAXSIZE] of integer; // массив ID из таблицы oil_oper_type (разрешенные в отчете операции)
     end;

     TConfiguration=record
         NbAzs,KOS,Optional:string;
         GroupType:integer;
         OpF:OperFilter;
     end;

type
  TRashReportForm = class(TCommonForm)
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    CBPartAll: TCheckBox;
    LENp: TRxLookupEdit;
    CBNpAll: TCheckBox;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CEFrom: TComboEdit;
    CMBPart: TComboEdit;
    QNp: TOilQuery;
    QNpID: TFloatField;
    QNpNAME: TStringField;
    DSNp: TOraDataSource;
    DBOper: TDBGridEh;
    STOper: TStringGrid;
    QOper: TOilQuery;
    DSOper: TOraDataSource;
    QOperNAME: TStringField;
    QOperID: TFloatField;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    CBOper: TCheckBox;
    Label9: TLabel;
    CBTtn: TCheckBox;
    LabelDebug: TLabel;
    CETo: TComboEdit;
    CbAzsVed: TCheckBox;
    CBNb: TCheckBox;
    CBAzsTalon: TCheckBox;
    CBAzsOther: TCheckBox;
    Panel3: TPanel;
    Panel4: TPanel;
    CBKom: TCheckBox;
    CBOwn: TCheckBox;
    CBStore: TCheckBox;
    GroupBox2: TGroupBox;
    CBRez: TCheckBox;
    CBTo: TCheckBox;
    CBFrom: TCheckBox;
    CBDate: TCheckBox;
    CBOperation: TCheckBox;
    CMBSort: TComboBox;
    Label6: TLabel;
    CBPart: TCheckBox;
    CBAzsNal: TCheckBox;
    CBAzsSn: TCheckBox;
    CBSubpart: TCheckBox;
    Panel5: TPanel;
    CBUchPrice: TCheckBox;
    SpeedButton2: TSpeedButton;
    procedure CEFromButtonClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CBPartAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBNpAllClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure PlusFilter(id:integer;name:string);
    procedure MinusFilter(row:integer);
    procedure DBOperDblClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure STOperDblClick(Sender: TObject);
    procedure TurnOperFilter(b:Boolean);
    procedure CBOperClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure LENpButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CEToButtonClick(Sender: TObject);
    procedure CMBPartButtonClick(Sender: TObject);
    procedure CMBSortChange(Sender: TObject);
    procedure CBSubpartClick(Sender: TObject);
    procedure CBPartClick(Sender: TObject);
    procedure CBUchPriceClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SetConfiguration(Conf:TConfiguration);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RashReportForm: TRashReportForm;

implementation

uses Main,PartRef,Progr,ExFunc,ExcelFunc,ChooseOrg,UDbFunc,TalonPotrReport;

// фильтр операций

type TFlags=string; // строка типа 'yynn'. Допустимые символы - y и n

var OrgId,OrgInst,PartId,PartInst,ToId,ToInst,ReportLevel:integer;
    OldPart:String;
    OpF: OperFilter;
    Debugging:Boolean;
    CurrentCMBSortItemIndex:integer;
    //EConf:TConfiguration;

{$R *.DFM}

procedure DefineConfiguration(var Conf:TConfiguration;NbAzs,KOS,Optional:string;GroupType:integer;OpF:OperFilter);
var i:integer;
begin
     Conf.NbAzs:=NbAzs;
     Conf.KOS:=KOS;
     Conf.Optional:=Optional;
     Conf.GroupType:=GroupType;
     Conf.OpF.Size:=OpF.Size;
     for i:=1 to OpF.Size do
         Conf.OpF.A[i]:=OpF.A[i];
end;

procedure DefineOperFilter(var OpF:OperFilter;A:array of integer);
var i:integer;
begin
     OpF.Size:=Length(A);
     for i:=1 to Length(A) do
         OpF.A[i]:=A[i-1];
end;

procedure TRashReportForm.SetConfiguration(Conf:TConfiguration);
var i:integer;

     procedure DefCB(var CB:TCheckBox;yn:char);
     begin
         if yn='y' then CB.Checked:=TRUE
                   else CB.Checked:=FALSE;
     end;

begin
     CMBSort.ItemIndex:=Conf.GroupType;
     CMBSortChange(nil);

     DefCB(CBNb,       Conf.NBAzs[1]);
     DefCB(CBAzsVed,   Conf.NBAzs[2]);
     DefCB(CBAzsNal,   Conf.NBAzs[3]);
     DefCB(CBAzsTalon, Conf.NBAzs[4]);
     DefCB(CBAzsOther, Conf.NBAzs[5]);
     DefCB(CBAzsSn,    Conf.NBAzs[6]);

     DefCB(CBKom,   Conf.KOS[1]);
     DefCB(CBOwn,   Conf.KOS[2]);
     DefCB(CBStore, Conf.KOS[3]);

     DefCB(CBFrom,      Conf.Optional[1]);
     DefCB(CBPart,      Conf.Optional[2]);
     DefCB(CBTo,        Conf.Optional[3]);
     DefCB(CBRez,       Conf.Optional[4]);
     DefCB(CBTtn,       Conf.Optional[5]);
     DefCB(CBDate,      Conf.Optional[6]);
     DefCB(CBOperation, Conf.Optional[7]);
     DefCB(CBSubpart,   Conf.Optional[8]);
     DefCB(CBUchPrice,  Conf.Optional[9]);

     if Conf.OpF.Size=0 then
     begin
          TurnOperFilter(FALSE);
          if QOper.Active then QOper.Close;
          CBOper.Checked:=FALSE;
     end
     else
     begin
          TurnOperFilter(TRUE);
          CBOper.Checked:=TRUE;
          if QOper.Active then QOper.Close;
          QOper.Open;
          for i:=1 to Conf.OpF.Size do
          begin
               QOper.First;
               while not QOper.Eof do
               begin
                    if QOperId.AsInteger=Conf.OpF.A[i] then
                    begin
                         PlusFilter(QOperId.AsInteger,QOperName.AsString);
                         break;
                    end;
                    QOper.Next;
               end;
          end;
          QOper.First;
     end;
end;

function IsInOperFilter(n:integer):Boolean;
var i:integer;
begin
     for i:=1 to OpF.Size do
         if OpF.A[i]=n then
         begin
              result:=TRUE;
              exit;
         end;
     result:=FALSE;
end;

procedure MakeReport(
      Date1,Date2:TDateTime; // дата - от Date1 по Date2 включительно
      from_id,from_inst,     // организация - продавец, верхний узел дерева. В отчет включаются эта организация
                             // и все ее подчиненные до самого низа, от обла до АЗС
      to_id,to_inst,         // организация - покупатель, если 0, то берутся все
      part_id,part_inst,     // партия, если 0, то берутся все
      np_grp,                // группа нефтепродуктов. Если 0, то берутся все
      ReportLevel,           // уровень отчета. 4 - ОБЛ, 3 - ППОН, 8 - АЗС
      sorttype:integer;      // равен CMBSort.ItemIndex
      // для переменных типа TFlags в комментарии перечислено то, чему отвечают y и n на соответствующем месте
      kos,                   // комиссия, собственный, хранение
      types:array of Boolean;// ППОН, АЗС(ведомость), АЗС(талоны), АЗС(прочее)
      opt_fields:TFlags;     // От кого  , партия, кому   , резервуар, номер ТТН, Дата , Операция, Подпартия
                             // from_name, dog   , to_name, rez_num  , ttn_num  , date_, opertype, sub_part
      OpF:OperFilter);       // фильтр операций

const FIRSTLINE    = 11; // первая строка отчета в Excel
      FIRSTINFLINE = 4; // первая строка для информации в заголовке
      HEADLINE     = 2;  // строка заголовка
      N_FROM_NAME  = 1;
      N_DOG        = 2;
      N_TO_NAME    = 3;
      N_REZ_NUM    = 4;
      N_TTN_NUM    = 5;
      N_DATE_      = 6;
      N_OPERTYPE   = 7;
      N_SUBPART    = 8;
      N_UCHPRICE   = 9;

var
    XLApp,List:Variant;
    Fields, // аргумент для PuTOilQueryToExcel
    FieldOrder, // порядок колонок в отчете
    From_Name, To_Name:string;  // имя организации От кого и Кому
    Col1,Col4, // первая и четвертая отображаемые колонки в Excel. Определяются в функции RemoveIdleColumns
    ColNp:char;
    Q:TOilQuery;
    ProgBar:TProgrForm;
    Unknown: iUnknown;

    procedure MakeHead;
    var s:string;
    begin
        PutTitle(List,Col1+'1');
        List.Cells[HEADLINE,Col4]:=TranslateText('ОТЧЕТ ПО ОТПУСКУ');

        List.Cells[FIRSTINFLINE,Col1]:=TranslateText('Период: с ')+DateToStr(Date1)+TranslateText(' по ')+DateToStr(Date2);

        s:=TranslateText('От кого: ');
        case ReportLevel of
             8: s:=s+TranslateText('от ')+From_Name;
             3: s:=s+TranslateText('от ')+From_Name+TranslateText('и его АЗС');
             4: s:=s+TranslateText('от нефтебаз и АЗС ')+From_Name;
        end;
        List.Cells[FIRSTINFLINE+1,Col1]:=s;

        s:=TranslateText('Кому: ');
        if To_Name='' then s:=s+TranslateText('Всем')
                      else s:=s+To_Name;
        List.Cells[FIRSTINFLINE+2,Col1]:=s;

        if Part_Id=0 then
           List.Cells[FIRSTINFLINE+3,Col1]:=
              TranslateText('Тип товара: ')+GetConstructedString([TranslateText('комиссия'),TranslateText('собственный'),TranslateText('хранение')],[kos[0],kos[1],kos[2]]);
    end;


    function ActivateQ:integer;
    var i:integer;
    begin
        Q:=TOilQuery.Create(nil);
        //Q.FetchAll:=true;
        Q.Sql.Text:='SELECT np_type as np_type_name,np_group np_grp_name,SellType,'; // присутствует в отчете всегда
        if opt_fields[N_FROM_NAME]='y' then Q.Sql.Add('decode(azsid,null,OrgName,fullazsname) as from_name,');
        if opt_fields[N_DOG]='y'       then Q.Sql.Add('dog,');
        if opt_fields[N_TO_NAME]='y'   then Q.Sql.Add('ClientName as to_name,ClientOkpo as OKPO,');
        if opt_fields[N_REZ_NUM]='y'   then Q.Sql.Add('rez_num,');
        if opt_fields[N_TTN_NUM]='y'   then Q.Sql.Add('ttn_num,');
        if opt_fields[N_DATE_]='y'     then Q.Sql.Add('date_,');
        if opt_fields[N_OPERTYPE]='y'  then Q.Sql.Add('OperName as opertype,');
        if opt_fields[N_SUBPART]='y'   then Q.Sql.Add('sub_part,');
        if opt_fields[N_UCHPRICE]='y'  then Q.Sql.Add('ss,');
        Q.Sql.Add('       decode(IsShtuki,''Y'',''за штуку'',decode(NbAzs,0,''за тонну'',1,decode(operid,14,''за тонну'',52,''эа тонну'',153,''эа тонну'',''за литр''))) as Dim,');
        Q.Sql.Add('       sum(litr) as litr,sum(tonn) as tonn,sum(shtuki) as shtuki,');
        Q.Sql.Add('       sum(summa) as summa,decode(operid,14,ss,52,ss,153,ss,price) as price,');
        Q.Sql.Add('       sum(nds) as nds,sum(summa_ss) as ss_sum,sum(delta) as delta ');
        Q.Sql.Add('  FROM v_oil_npmove ');
        Q.Sql.Add(' WHERE date_ between :ABeginDate and :AEndDate ');
        Q.Sql.Add('   and RashPrih=0 and IsSummary<>''Y'' and IsTalonDet<>''N'' ');
        Q.Sql.Add('   and :AFromId in (AzsId,PponId,OblId) ');

        if Part_Id<>0 then
        begin
          Q.Sql.Add('   and partid=:APartId and partinst=:APartInst');
          Q.ParamByName('APartId').Value := part_id;
          Q.ParamByName('APartInst').Value := part_inst;
        end
        else
          Q.Sql.Add(GetKOSCondition('own_goods',kos[0],kos[1],kos[2]));
        if (Part_Id=0) and (Np_Grp<>0) then
        begin
          Q.Sql.Add('   and (np_groupid=:ANpGrpId) ');
          Q.ParamByName('ANpGrpId').Value := Np_Grp;
        end;
        if(to_id<>0) and (to_inst<>0)then
        begin
          Q.Sql.Add('   and (ClientId=:AToId and ClientInst=:AToInst) ');
          Q.ParamByName('AToId').Value := to_id;
          Q.ParamByName('AToInst').Value := to_inst;
        end;


        if (OpF.Size>0) then
        begin
          if OpF.Size=1 then
          begin
            Q.Sql.Add('and operid=:AOperId');
            Q.ParamByName('AOperId').Value := OPF.A[1];
          end
          else
          begin
            Q.Sql.Add('and (');
            for i:=1 to OpF.Size do
              Q.Sql.Add('operid='+IntToStr(OPF.A[i])+' or ');
            Q.Sql.Add('operid='+IntToStr(OPF.A[OpF.Size])+') ');
          end;
        end;

        Q.Sql.Add('   and SellTypeId in ('
          +GetConstructedString(['1','2','5','4','3,11','6'],types)+')');

        Q.Sql.Add(' GROUP BY np_type,np_group, ');
        Q.Sql.Add('       decode(IsShtuki,''Y'',''за штуку'',decode(NbAzs,0,''за тонну'',1,decode(operid,14,''за тонну'',52,''эа тонну'',153,''эа тонну'',''за литр''))), ');
        Q.Sql.Add('       decode(operid,14,ss,52,ss,153,ss,price),SellType ');
        if opt_fields[N_FROM_NAME]='y' then Q.Sql.Add(',decode(azsid,null,OrgName,fullazsname)');
        if opt_fields[N_DOG]='y'       then Q.Sql.Add(',dog');
        if opt_fields[N_TO_NAME]='y'   then Q.Sql.Add(',ClientName,ClientOkpo');
        if opt_fields[N_REZ_NUM]='y'   then Q.Sql.Add(',rez_num');
        if opt_fields[N_TTN_NUM]='y'   then Q.Sql.Add(',ttn_num');
        if opt_fields[N_DATE_]='y'     then Q.Sql.Add(',date_');
        if opt_fields[N_OPERTYPE]='y'  then Q.Sql.Add(',OperName');
        if opt_fields[N_SUBPART]='y'   then Q.Sql.Add(',sub_part');
        if opt_fields[N_UCHPRICE]='y'  then Q.Sql.Add(',ss');

        Q.Sql.Add(' order by ');
        case SortType of
          0: Q.Sql.Add('from_name,np_type_name,np_grp_name,dog,sub_part ');
          1: Q.Sql.Add('from_name,np_type_name,np_grp_name,dog ');
          2: Q.Sql.Add('from_name,np_type_name,np_grp_name,rez_num ');
          3: Q.Sql.Add('from_name,to_name,np_type_name,np_grp_name ');
          4: Q.Sql.Add('np_type_name,np_grp_name,dog ');
          5: Q.Sql.Add('np_type_name,np_grp_name,dog,from_name ');
          6: Q.Sql.Add('np_type_name,np_grp_name,dog,sub_part ');
          7: Q.Sql.Add('np_type_name,np_grp_name,dog,sub_part,from_name ');
          8: Q.Sql.Add('np_type_name,np_grp_name ');
        end;

        if Debugging then
        begin
          ShowTextInMemo(FullSqlText(q));
        end;
        DefineRepDates(Date1,Date2);
        q.Prepare;
        _OpenQueryPar(q,
          ['ABeginDate',Date1,
           'AEndDate',Date2,
           'AFromId',from_id
           ]);
        result:=Q.RecordCount;
    end;

    procedure RemoveIdleColumns;
    // скрывает ненужные колонки отчета, а так же определяет, в какие колонки попадает заголовок отчета
    var A,B:string;
        i:integer;
    begin
         A:='ABCDEFGHIJKSTU'; B:=A;
         for i:=1 to Length(FieldOrder) do
             B[ord(FieldOrder[i])-ord('0')]:=A[i];
         // в В теперь новый порядок колонок
         // засовываем в А список колонок, которые надо скрыть
         A:='';
         if opt_fields[N_FROM_NAME]='n' then A:=A+B[1];
         if opt_fields[N_DOG]='n' then A:=A+B[3];
         if opt_fields[N_SUBPART]='n' then A:=A+B[4];
         if opt_fields[N_REZ_NUM]='n' then A:=A+B[5];
         if opt_fields[N_TO_NAME]='n' then A:=A+B[6]+B[7];
         if opt_fields[N_DATE_]='n' then A:=A+B[8];
         if opt_fields[N_OPERTYPE]='n' then A:=A+B[10];
         if opt_fields[N_TTN_NUM]='n' then A:=A+B[11];
         if opt_fields[N_UCHPRICE]='n' then A:=A+copy(B,12,3);
         ColNp:=B[2];
         // теперь скрываем колонки, список которых содержится в А
         for i:=1 to Length(A) do
             List.Columns[A[i]].EntireColumn.Hidden:=TRUE;
         // теперь найдем колонки, в которые попадает заголовок.
         // Нам нужна первая колонка для информации и четвертая для заголовка "Отчет по отпуску"
         // засунем в В список отображаемых колонок. Для этого вычеркнем из полного списка скрытые
         B:='ABCDEFGHIJKLMNO';
         for i:=1 to Length(A) do
             Delete(B,Pos(copy(A,i,1),B),1);
         Col1:=B[1];
         Col4:=B[4];
    end;

begin
     ActivateProgressBar(ProgBar,not Debugging);
     From_Name:=GetOrgName(from_id,from_inst);
     To_Name:=GetOrgName(to_id,to_inst);
  try
     if ActivateQ=0 then begin
         ProgBar.Free;
         if INTERACTIVE_LAUNCH_MODE then
            ShowMessage(TranslateText('Отчет с такими параметрами не содержит данных'));
         Exit;
     end;
     SetProgressBar(30,ProgBar);
     //List:=ActivateXLApp('RashReport.xls','RashReport.xls','Лист1');
     if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown))
     then XLApp := GetActiveOleObject('Excel.Application')
     else XLApp := CreateOleObject('Excel.Application');
     XLApp.Workbooks.Add(GetMainDir+'pattern\RashReport.xls');
     List := XLApp.ActiveWorkbook.ActiveSheet;
     SetProgressBar(40,ProgBar);
     // в зависимости от типа группировки переставляем в шаблоне местами колонки

     case sorttype of
        0,1:FieldOrder:='1234567';
          2:FieldOrder:='1253467';
          3:FieldOrder:='1672345';
    4,5,6,7:FieldOrder:='2341675';
          8:FieldOrder:='2134567';
     end;
     ChangeColumns(List,FIRSTLINE-1,'ABCDEFG',FieldOrder);
     RemoveIdleColumns;
     MakeHead;

     case sorttype of
          0:begin
                 //От кого - Тип НП - Партия - Подпартия
                 Fields:='from_name%4;np_type_name:np_grp_name%3;dog%2&WW;sub_part%1&WW;';
                 if opt_fields[N_REZ_NUM]='y' then Fields:=Fields+'rez_num#E;';
                 if opt_fields[N_TO_NAME]='y' then Fields:=Fields+'to_name #F;okpo;';
            end;
          1:begin
                 //От кого - Тип НП - Партия
                 Fields:='from_name%3;np_type_name:np_grp_name%2;dog%1&WW;';
                 if opt_fields[N_SUBPART]='y' then Fields:=Fields+'sub_part#D;';
                 if opt_fields[N_REZ_NUM]='y' then Fields:=Fields+'rez_num#E;';
                 if opt_fields[N_TO_NAME]='y' then Fields:=Fields+'to_name #F;okpo;';
            end;
          2:begin
                 //От кого - Тип НП - Резервуар
                 Fields:='from_name%3;np_type_name:np_grp_name%2;rez_num%1&WW;';
                 if opt_fields[N_DOG]='y' then Fields:=Fields+'dog#D;';
                 if opt_fields[N_SUBPART]='y' then Fields:=Fields+'sub_part#E;';
                 if opt_fields[N_TO_NAME]='y' then Fields:=Fields+'to_name#F;okpo;';
            end;
          3:begin
                 //От кого - Кому - Тип НП
                 Fields:='from_name%3;to_name%2;okpo;np_type_name:np_grp_name%1;';
                 if opt_fields[N_DOG]='y' then Fields:=Fields+'dog#E;';
                 if opt_fields[N_SUBPART]='y' then Fields:=Fields+'sub_part#F;';
                 if opt_fields[N_REZ_NUM]='y' then Fields:=Fields+'rez_num#G;';
            end;
          4:begin
                 //Тип НП - Партия
                 Fields:='np_type_name:np_grp_name%2;dog%1&WW;';
                 if opt_fields[N_SUBPART]='y' then Fields:=Fields+'sub_part#C;';
                 if opt_fields[N_FROM_NAME]='y' then Fields:=Fields+'from_name#D;';
                 if opt_fields[N_TO_NAME]='y' then Fields:=Fields+'to_name#E;okpo;';
                 if opt_fields[N_REZ_NUM]='y' then Fields:=Fields+'rez_num#G;';
            end;
          5:begin
                 //Тип НП - Партия - От кого
                 Fields:='np_type_name:np_grp_name%3;dog%2&WW;sub_part;from_name%1;';
                 if opt_fields[N_TO_NAME]='y' then Fields:=Fields+'to_name#E;okpo;';
                 if opt_fields[N_REZ_NUM]='y' then Fields:=Fields+'rez_num#G;';
            end;
          6:begin
                 //Тип НП - Партия - Подпартия
                 Fields:='np_type_name:np_grp_name%3;dog%2&WW;sub_part%1&WW;';
                 if opt_fields[N_FROM_NAME]='y' then Fields:=Fields+'from_name#D;';
                 if opt_fields[N_TO_NAME]='y' then Fields:=Fields+'to_name#E;okpo;';
                 if opt_fields[N_REZ_NUM]='y' then Fields:=Fields+'rez_num#G;';
            end;
          7:begin
                 //Тип НП - Партия - Подпартия - От кого
                 Fields:='np_type_name:np_grp_name%4;dog%3&WW;sub_part%2&WW;from_name%1;';
                 if opt_fields[N_TO_NAME]='y' then Fields:=Fields+'to_name#E;okpo;';
                 if opt_fields[N_REZ_NUM]='y' then Fields:=Fields+'rez_num#G;';
            end;
          8:begin
                 //только Тип НП
                 Fields:='np_type_name:np_grp_name%1;';
                 if opt_fields[N_FROM_NAME]='y' then Fields:=Fields+'from_name#B;';
                 if opt_fields[N_DOG]='y' then Fields:=Fields+'dog#C;';
                 if opt_fields[N_SUBPART]='y' then Fields:=Fields+'sub_part#D;';
                 if opt_fields[N_REZ_NUM]='y' then Fields:=Fields+'rez_num#E;';
                 if opt_fields[N_TO_NAME]='y' then Fields:=Fields+'to_name#F;okpo;';
            end;
     end;

     if opt_fields[N_DATE_]='y' then Fields:=Fields+'date_#H;';
     Fields:=Fields+'SellType#I;';
     if opt_fields[N_OPERTYPE]='y' then Fields:=Fields+'opertype#J;';
     if opt_fields[N_TTN_NUM]='y' then Fields:=Fields+'ttn_num#K;';

     //List.Columns[COL_TTN].EntireColumn.Hidden:=TRUE;
     Fields:=Fields+'shtuki#L+=;tonn+=;litr+=;price=;dim;summa+=;nds+=';
     if opt_fields[N_UCHPRICE]='y' then Fields:=Fields+';ss=;ss_sum+=;delta+=';
     SetProgressBar(50,ProgBar);
     ExFunc.PuTOilQueryToExcel(XLApp,List,Q,0,FIRSTLINE,ProgBar,50,100,Fields,'np_grp_name#'+ColNp+'{По типам нефтепродуктов}',TRUE);//*NO_TRANSLATE*
     SetProgressBar(100,ProgBar);
     ProgBar.Free;
     MainForm.ShowExcel;
     SaveReport(XLApp,'ОтпускНБАЗС');//*NO_TRANSLATE*
   except on e:exception do
     begin
       ProgBar.Free;
       showmessage(TranslateText('В процессе выполнения произошла ошибка')+e.message);
     end;
   end;
end;

procedure TRashReportForm.CEFromButtonClick(Sender: TObject);
var
    vId,vInst,vType:integer;
    vName:string;
begin
     if ChooseOrg.CaptureOrg(1,MAIN.MAIN_ID,MAIN.INST,'yyyyyynn',vId,vInst,vName) then
     begin
          vType:=GetOrgType(vId,vInst);
          OrgId:=vId;
          OrgInst:=vInst;
          ReportLevel:=vType;
          CEFrom.Text:=vName;
          if ReportLevel=8 then
          begin
               CBNb.Checked:=FALSE;CBNb.Enabled:=FALSE;
          end
          else
               CBNb.Enabled:=TRUE;
          case ReportLevel of
               3: Label3.Caption:=TranslateText('ППОН');
               4: Label3.Caption:=TranslateText('ОБЛ');
               8: Label3.Caption:=TranslateText('АЗС');
          end;
          Label3.Refresh;
     end;
end;

procedure TRashReportForm.BitBtn2Click(Sender: TObject);
begin
     ModalResult:=MrOk;
end;

procedure TRashReportForm.BitBtn1Click(Sender: TObject);
var kos,types,opt_fields:string;
    NpId:integer;
begin
     if CEFrom.Text='' then
     begin
          showmessage(TranslateText('Не выбрана организация!!!'));
          exit;
     end;
     if (not CBPartAll.Checked) and (CMBPart.Text='') then
     begin
          showmessage(TranslateText('Не выбрана партия!!!'));
          exit;
     end;

     kos:='nnn';
     if CBKom.Checked then kos[1]:='y';
     if CBOwn.Checked then kos[2]:='y';
     if CBStore.Checked then kos[3]:='y';

     if kos='nnn' then
     begin
          showmessage(TranslateText('Надо выбрать хоть что-то из комиссии, собственного или хранения'));
          exit;
     end;

     if CBNpAll.Checked then NPId:=0
                        else NPId:=QNpId.AsInteger;

     types:='nnnnnn';
     if CBNb.Checked       then types[1]:='y';
     if CBAzsVed.Checked   then types[2]:='y';
     if CBAzsTalon.Checked then types[3]:='y';
     if CBAzsOther.Checked then types[4]:='y';
     if CbAzsNal.Checked   then types[5]:='y';
     if CbAzsSn.Checked    then types[6]:='y';
     if types='nnnnnn' then
     begin
          showmessage(TranslateText('Надо выбрать хоть что-то из нефтебазы или АЗС'));
          exit;
     end;

     opt_fields:='nnnnnnnnn';
     if CBFrom.Checked      then opt_fields[1]:='y';
     if CBPart.Checked      then opt_fields[2]:='y';
     if CBTo.Checked        then opt_fields[3]:='y';
     if CBRez.Checked       then opt_fields[4]:='y';
     if CBTtn.Checked       then opt_fields[5]:='y';
     if CBDate.Checked      then opt_fields[6]:='y';
     if CBOperation.Checked then opt_fields[7]:='y';
     if CBSubPart.Checked   then opt_fields[8]:='y';
     if CBUchPrice.Checked  then opt_fields[9]:='y';

     DefineRepDates(DateEdit1.date,DateEdit2.date);
     MakeReport(DateEdit1.date,DateEdit2.date,OrgId,OrgInst,ToId,ToInst,PartId,PartInst,
                    NPId,ReportLevel,CMBSort.ItemIndex,
                    [CBKom.Checked,CBOwn.Checked,CBStore.Checked],
                    [CBNb.Checked,CBAzsVed.Checked,CBAzsNal.Checked,CBAzsTalon.Checked,CBAzsOther.Checked,CBAzsSn.Checked],
                    opt_fields,OpF);
end;

procedure TRashReportForm.CBPartAllClick(Sender: TObject);
begin
     if CBPartAll.Checked then
     begin
          CBKom.Enabled:=TRUE;
          CBOwn.Enabled:=TRUE;
          CBStore.Enabled:=TRUE;
          CMBPart.Enabled:=False;
          OldPart:=CMBPart.Text;
          CMBPart.Text:='';
          CBNpAll.Enabled:=True;
          if not CBNpAll.Checked then
          begin
               LeNP.Enabled:=True;
               LENp.Text:=QNpName.AsString;
          end;
     end
     else
     begin
          CBKom.Enabled:=FALSE;
          CBOwn.Enabled:=FALSE;
          CBStore.Enabled:=FALSE;
          CBKom.Checked:=TRUE;
          CBOwn.Checked:=TRUE;
          CBStore.Checked:=TRUE;
          CMBPart.Enabled:=True;
          CMBPart.Text:=OldPart;
          CBNpAll.Enabled:=False;
          LeNP.Enabled:=False;
          LENp.Text:='';
     end;
end;

procedure TRashReportForm.FormCreate(Sender: TObject);
begin inherited;
     OrgId:=MAIN_ID;OrgInst:=INST;

     CEFrom.Text:=GetOrgName(OrgId,OrgInst);
     ReportLevel:=GetOrgType(OrgId,OrgInst);

     SetCurrentMonth(DateEdit1,DateEdit2);
     OldPart:='';
     CMBSort.ItemIndex:=0;
     CurrentCMBSortItemIndex:=0;
     Debugging:=FALSE;
end;

procedure TRashReportForm.CBNpAllClick(Sender: TObject);
begin
     if CBNpAll.Checked then
     begin
        LENp.Enabled:=False;
        LENp.Text:='';
     end
     else
     begin
        LENp.Enabled:=True;
        LENp.Text:=QNpName.AsString;
     end;
end;

function PosInOperFilter(id:integer):integer;
// 0 если нет, число если нашлось
var i:integer;
begin
     for i:=1 to OPF.Size do
         if OPF.A[i]=id then
         begin
              result:=i;
              exit;
         end;
     result:=0;
end;

function AddToOperFilter(id:integer):Boolean;
// истина если удалось добавить и ложь если не удалось
begin
     if (PosInOperFilter(id)>0) then
     begin
          result:=FALSE;
          exit;
     end;
     if (OPF.Size=OPERFILTERMAXSIZE) then
     begin
          showmessage(TranslateText('Больше нельзя ничего добавить!!!'));
          result:=FALSE;
          exit;
     end;
     inc(OPF.Size);
     OPF.A[OPF.Size]:=id;
     result:=TRUE;
end;

procedure DelFromOperFilter(pos:integer);
var i:integer;
begin
     if pos=0 then
        exit;
     dec(OPF.Size);
     if OPF.Size>0 then
        for i:=pos to OPF.Size do
             OPF.A[i]:=OPF.A[i+1];
end;

procedure TRashReportForm.PlusFilter(id:integer;name:string);
begin
    if AddToOperFilter(id) then
    begin
         if STOper.RowCount<OPF.Size then
            STOper.RowCount:=STOper.RowCount+1;
         STOper.Cells[0,OPF.Size-1]:=name;
    end;
end;

procedure TRashReportForm.MinusFilter(row:integer);
var i:integer;
begin
     DelFromOperFilter(row+1);
     if STOper.RowCount=0 then exit;
     STOper.RowCount:=STOper.RowCount-1;
     for i:=row to STOper.RowCOunt do
         STOper.Cells[0,i]:=STOper.Cells[0,i+1];
end;

procedure TRashReportForm.TurnOperFilter(b:Boolean);
begin
     Label7.Enabled:=b;
     Label8.Enabled:=b;
     DBOper.Enabled:=b;
     STOper.Enabled:=b;
     BitBtn3.Enabled:=b;
     BitBtn4.Enabled:=b;
end;

procedure TRashReportForm.BitBtn3Click(Sender: TObject);
begin
     PlusFilter(QOperId.AsInteger,QOperName.AsString);
end;

procedure TRashReportForm.DBOperDblClick(Sender: TObject);
begin
     PlusFilter(QOperId.AsInteger,QOperName.AsString);
end;

procedure TRashReportForm.BitBtn4Click(Sender: TObject);
begin
     MinusFilter(STOper.Row);
end;

procedure TRashReportForm.STOperDblClick(Sender: TObject);
begin
    MinusFilter(STOper.Row);
end;

procedure TRashReportForm.CBOperClick(Sender: TObject);
begin
     TurnOperFilter(CBOper.Checked);
     if not QOper.Active then QOper.Open
     else
     begin
          OPF.Size:=0;
          STOper.RowCount:=1;
          STOper.Cells[0,0]:='';
          QOper.Close;
     end;
end;

procedure TRashReportForm.SpeedButton1Click(Sender: TObject);
begin
     CETo.Text:='';
     ToId:=0;
     ToInst:=0;
end;

procedure TRashReportForm.LENpButtonClick(Sender: TObject);
begin
     if not QNp.Active then
        QNp.Open;
end;

procedure TRashReportForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (ssAlt in Shift) and (ssCtrl in Shift) and (lowercase(chr(Key))='d') then
     begin
        Debugging:=not Debugging;
        LabelDebug.Visible:=Debugging;
     end;
end;

procedure TRashReportForm.CEToButtonClick(Sender: TObject);
var vName:string;
begin
    if CaptureOrg(4,OrgId,OrgInst,'yyy',ToId,ToInst,vName) then
       CETo.Text:=vName;
end;

procedure TRashReportForm.CMBPartButtonClick(Sender: TObject);
var Part:TPartRefForm;
begin
     Application.CreateForm(TPartRefForm,Part);
     Part.ShowModal;
     if Part.ModalResult=mrOk then begin
        if not (Part.q.IsEmpty) then
        begin
             PartId:=Part.q.fieldbyname('id').AsInteger;
             PartInst:=Part.q.FieldByName('inst').AsInteger;
             CMBPart.Text:=Part.q.fieldbyname('dog').asstring;
        end;
     end;
     part.free;
end;

procedure TRashReportForm.CMBSortChange(Sender: TObject);
var i:integer;

    procedure EnableAll;
    begin
         CBFrom.Enabled:=TRUE;
         CBPart.Enabled:=TRUE;
         CBTo.Enabled:=TRUE;
         CBRez.Enabled:=TRUE;
         CBTtn.Enabled:=TRUE;
         CBOperation.Enabled:=TRUE;
         CBSubpart.Enabled:=TRUE;
    end;
{       От кого - Тип НП - Партия - Подпартия
От кого - Тип НП - Партия
От кого - Тип НП - Резервуар
От кого - Кому - Тип НП
Тип НП - Партия
Тип НП - Партия - От кого
Тип НП - Партия - Подпартия
Тип НП - Партия - Подпартия - От кого
только Тип НП}

    procedure DisableCB(var CB:TCheckBox);
    begin
         CB.Checked:=TRUE;
         CB.Enabled:=False;
    end;

begin
     if (CMBSort.ItemIndex=CurrentCMBSortItemIndex) or (CMBSort.ItemIndex<0) then
     begin
          CMBSort.Text:=CMBSort.Items[CurrentCMBSortItemIndex];
          Exit;
     end;
     EnableAll;
     i:=CMBSort.ItemIndex;
     if (i>=0) and (i<=3) or (i=5) or (i=7) then DisableCB(CBFrom);
     if (i=0) or (i=1) or (i>=4) and (i<=7) then DisableCB(CBPart);
     if (i=0) or (i=6) or (i=7) then DisableCB(CBSubPart);
     if (i=2) then DisableCB(CBRez);
     if (i=3) then DisableCB(CBTo);
     CurrentCMBSortItemIndex:=CMBSort.ItemIndex;
end;

procedure TRashReportForm.CBSubpartClick(Sender: TObject);
begin
     if CBSubpart.Checked then CBPart.Checked:=TRUE;
end;

procedure TRashReportForm.CBPartClick(Sender: TObject);
begin
     if not CBPart.Checked then
     begin
          CBSubPart.Checked:=FALSE;
          CBUchPrice.Checked:=FALSE;
     end;
end;

procedure TRashReportForm.CBUchPriceClick(Sender: TObject);
begin
     if CBUchPrice.Checked then CBPart.Checked:=TRUE;
end;

procedure TRashReportForm.SpeedButton2Click(Sender: TObject);
var EConf:TConfiguration;
    Filter:OperFilter;
    q:TOilQuery;
    a:array of integer;
    i:integer;
begin
     q:=TOilQuery.Create(nil);
     q.Sql.Text:='select id from v_oil_oper_type where delta=''Y'' order by id ';
     _OpenQuery(q);
     SetLength(a,q.RecordCount); i:=0;
     while not q.Eof do begin
         a[i]:=q.FieldByName('id').AsInteger;
         inc(i); q.Next;
     end;
     DefineOperFilter(Filter,a);
     DefineConfiguration(EConf,'yyyyyy','nyn','yynnnnyny',4,Filter);
     SetConfiguration(EConf);
     q.Destroy;
end;

procedure TRashReportForm.SpeedButton3Click(Sender: TObject);
var EConf:TConfiguration;
    Filter:OperFilter;
begin
     Filter.Size:=0;
     DefineConfiguration(EConf,'ynnnnn','yyy','yynnnnyny',4,Filter);
     SetConfiguration(EConf);
     DateEdit1.Date:=StrToDate('01.01.2001');
     DateEdit2.Date:=StrToDate('31.01.2001');
end;

end.
