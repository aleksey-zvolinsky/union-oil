unit OS1C;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, Buttons, Db, DBTables, uCommonForm,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess{$IFDEF VER150},Variants{$ENDIF};

type
  TOS1CForm = class(TCommonForm)
    PB1: TProgressBar;
    OS1CForm: TPanel;
    OpenDialog1: TOpenDialog;
    OSTable: TTable;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    q: TOilQuery;
    BitBtn3: TBitBtn;
    SP1: TOilStoredProc;
    RE1: TRichEdit;
    txtInstruction: TOilQuery;
    qGroupList: TOilQuery;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure OpenDBF;
    procedure FormCreate(Sender: TObject);
    procedure Import;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OS1CForm: TOS1CForm;

implementation

uses Main,OilStd,ExFunc,UDbFunc;

{$R *.DFM}

const FIELD_LIST='NAME,BEGIN_COST,END_COST,QUANTITY,DATE_,DATE_END,INV_NUMBER,POR_NUMBER,STORAGE,ZASTAVA,LIQ_REASON,SUM_SALE,CLI_ID,CLI_NAME,GROUP1,GROUP2,GROUP3,GROUP4,GROUP5';

var TempTableName,TempTableShortName:string;

function DoubleApostr(s:string):string;
var i:integer;
begin
     result:='';
     for i:=1 to length(s) do
         if s[i]='''' then result:=result+''''''
                      else result:=result+s[i];
end;

function Convert(s:string):string;
var i:integer;
begin
     result:='';
     for i:=1 to length(s) do
         result:=result+IntToStr(ord(s[i]))+' ';
end;

procedure TOS1CForm.Import;
var Date_,Date_End:Variant;
    CustomerId,CustomerInst: Variant;
    OrgId,OrgInst: integer;
    res: string;
    OsTest: Boolean;

    function DateIsNull(p_Date: string): Boolean;
    var digits: string;
        i: integer;
    begin
        digits:='0123456789';
        for i:=1 to length(digits) do
            if pos(digits[i],p_Date)>0 then begin
               result:=FALSE;
               exit;
            end;
        result:=TRUE;
    end;

    procedure TestGroups;
    var i,n: integer;
    begin
        if not OsTest then exit;  
        i:=5;
        while (i>0) and OSTable.FieldByName('group'+IntToStr(i)).IsNull do dec(i);
        if i=0 then Raise Exception.Create(TranslateText('Отсутствует группа'));
        while i>0 do begin
            n:=GetSqlValue(' select count(*) from oil_pattern where state=''Y'' and type_id=1 '+
                           ' and name='''+OSTable.FieldByName('group'+IntToStr(i)).AsString+''' ');
            if n=0 then Raise Exception.Create(TranslateText('Неверная группа: ')+OSTable.FieldByName('group'+IntToStr(i)).AsString);
            dec(i);
        end;
    end;

begin
     if not OsTable.Active then begin
        showmessage(TranslateText('Сначала следует выбрать файл dbf, откуда будет происходить импорт'));
        exit;
     end;
     OSTable.First;
     RE1.Lines.Clear;
     OsTest:=(ReadOilVar('OS_TEST')<>'N');
     StartSQL;
    try
     q.SQL.Clear;
     q.SQL.Add('update oil_os set state=''N'' where state=''Y''');
     q.ExecSQL;
     PB1.Max:=OSTable.RecordCount;
     while not OSTable.Eof do begin
           RE1.Lines.Add(OSTable.FieldByName('name').AsString+' ........'+OSTable.FieldByName('quantity').AsString+TranslateText(' шт.'));
           RE1.ScrollBy(0,1000);
           RE1.Refresh;
           if OSTable.FieldByName('cli_id').IsNull then begin
              CustomerId:=null; CustomerInst:=null;
           end else begin
              DetectOrgByOkpo(OSTable.FieldByName('cli_id').AsString,
                              OSTable.FieldByName('cli_name').AsString,
                              OrgId,OrgInst,res,'nyyy');
              CustomerId:=OrgId; CustomerInst:=OrgInst;
           end;
           if DateIsNull(OSTable.FieldByName('date_').AsString) then date_:=null
           else date_:=OSTable.FieldByName('date_').Value;
           if DateIsNull(OSTable.FieldByName('date_end').AsString) then date_end:=null
           else date_end:=OSTable.FieldByName('date_end').Value;
           TestGroups;
           _ExecProc('OIL.INSORUPDOIL_OS',
              ['ID#',            0,
               'STATE#',         'Y',
               'INST#',          REAL_INST,
               'GROUP1#',        OSTable.FieldByName('group1').Value,
               'GROUP2#',        OSTable.FieldByName('group2').Value,
               'GROUP3#',        OSTable.FieldByName('group3').Value,
               'GROUP4#',        OSTable.FieldByName('group4').Value,
               'GROUP5#',        OSTable.FieldByName('group5').Value,
               'NAME#',          OSTable.FieldByName('name').Value,
               'BEGIN_COST#',    OSTable.FieldByName('begin_cost').Value,
               'END_COST#',      OSTable.FieldByName('end_cost').Value,
               'DATE_#',         date_,
               'QUANTITY#',      OSTable.FieldByName('quantity').Value,
               'INV_NUMBER#',    OSTable.FieldByName('inv_number').Value,
               'POR_NUMBER#',    OSTable.FieldByName('por_number').Value,
               'STORAGE_#',      OSTable.FieldByName('storage').Value,
               'DATE_END#',      date_end,
               'CUSTOMER_ID#',   CustomerId,
               'CUSTOMER_INST#', CustomerInst,
               'SUM_SALE#',      OSTable.FieldByName('sum_sale').Value,
               'LIQ_REASON#',    OSTable.FieldByName('liq_reason').Value],TRUE);

           OSTable.Next;
           PB1.StepIt;
     end;
     if MessageDlg(TranslateText('Видите ли вы названия в русской кодировке?'),
                   mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         CommitSQL;
         showmessage(TranslateText('Данные успешно внесены'));
     end else
         Raise Exception.Create(TranslateText('Внесение данных отменено пользователем'));
    except on E:Exception do begin
              MessageDlg(E.message,mtError,[mbOk],0);
              RollbackSQL;
              RE1.Lines.Clear;
              if copy(E.Message,1,15)=TranslateText('Неверная группа') then begin
                 RE1.Text:=TranslateText('Список допустимых групп');
                 RE1.Lines.Add('');
                 if not qGroupList.Active then qGroupList.Open
                                          else qGroupList.First;
                 while not qGroupList.Eof do begin
                     RE1.Lines.Add(qGroupList.FieldByName('name').AsString);  
                     qGroupList.Next;
                 end;
              end else RE1.Text:=txtInstruction.SQL.Text;
              SelectRichEditLine(RE1,1);
              RE1.SelAttributes.Size := 14;
              RE1.SelAttributes.Style := RE1.SelAttributes.Style + [fsBold];
              RE1.Paragraph.Alignment := taCenter;
           end;
    end;
    PB1.Position:=0;
end;

procedure TOS1CForm.OpenDBF;
var SL: TStringList;
    i:integer;
begin
     if OpenDialog1.Execute then begin
        CopyFile(pchar(OpenDialog1.Filename),pchar(TempTableName),FALSE);
        OSTable.Tablename:=TempTableShortName;
        OSTable.Open;
        SL:=TStringList.Create;
        try
           Str2StringList(FIELD_LIST,SL);
           for i:=0 to SL.Count-1 do
               if OSTable.FieldList.IndexOf(SL[i])=-1 then
                  Raise Exception.Create(TranslateText('Не найдено поле ')+SL[i]);
        finally SL.Destroy;
        end;
        Edit1.Text:=OpenDialog1.Filename+': '+IntToStr(OSTable.RecordCount)+TranslateText(' записей');
     end;
end;


procedure TOS1CForm.BitBtn1Click(Sender: TObject);
begin
     OpenDbf;
end;

procedure TOS1CForm.FormCreate(Sender: TObject);
begin
  inherited;
  OSTable.DatabaseName := DB_DIR;
     TempTableShortName:='OSTemp.dbf';
     TempTableName:=GetMainDir+'db\'+TempTableShortName;
end;

procedure TOS1CForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
     Key:=#0;
end;

procedure TOS1CForm.BitBtn2Click(Sender: TObject);
begin
     Import;
end;

end.
