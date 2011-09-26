unit InvRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ToolEdit, Mask, CurrEdit, Db, DBTables,
  Progr, ActiveX, ComObj,
  OleCtrls,
  Excel8TLB,ViewDoc, RefPrint,OilStd, uCommonForm,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess;


type
  TInvRepForm = class(TCommonForm)
    Panel2: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    edFrom: TComboEdit;
    Label3: TLabel;
    DateEdit1: TDateEdit;
    Label4: TLabel;
    DateEdit2: TDateEdit;
    RxCalcEdit1: TRxCalcEdit;
    q: TOilQuery;
    OrgQ: TOilQuery;
    OrgQID: TFloatField;
    OrgQNAME: TStringField;
    OrgQINST: TFloatField;
    OrgQID_NUM: TStringField;
    OrgQNAL_NUM: TStringField;
    OrgQSVID_NUM: TStringField;
    OrgQADDR: TStringField;
    OrgQSTART_DATE: TDateTimeField;
    OrgQPHONE: TStringField;
    OrgQE_MAIL: TStringField;
    OrgQBOSS: TStringField;
    OrgQBOSS_TEL_H: TStringField;
    OrgQBOSS_TEL_W: TStringField;
    OrgQDOV: TStringField;
    OrgQDOV_DATE: TDateTimeField;
    OrgQGBUH: TStringField;
    OrgQGBUH_TEL_H: TStringField;
    OrgQGBUH_TEL_W: TStringField;
    OrgQPAR: TFloatField;
    OrgQPAR_INST: TFloatField;
    OrgQFACE: TFloatField;
    OrgQNUM: TStringField;
    OrgQVED_NAME: TStringField;
    OrgQVED_ID: TFloatField;
    OrgQORG_TYPE: TStringField;
    OrgQORG_ID: TFloatField;
    OrgQPAR_NAME: TStringField;
    OrgQREK_ID: TFloatField;
    OrgQREK_INST: TFloatField;
    OrgQRACH_CHET: TStringField;
    OrgQMFO: TStringField;
    OrgQBANK_NAME: TStringField;
    OrgQDEF: TFloatField;
    CB1: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure edFromButtonClick(Sender: TObject);

  private
    { Private declarations }
    procedure rep7npClick (Sender: TObject);
    procedure repInventClick (Sender: TObject);
    procedure repPipeClick (Sender: TObject);
    procedure repUbilClick (Sender: TObject);
    procedure repSlichClick (Sender: TObject);
    procedure GetOrg;
    function ValidateInfo:boolean;
  public
    { Public declarations }
    org_id, org_inst, RepKind: integer;
    ProgressIncrement, NumberOfFields : Integer;
    ProgrForm : TProgrForm;
    IWorkBook:variant;
    ISheet: variant;
    List:Variant;
    CurrLine                        :integer;
  end;

const
  rep7np = 1;
  repInvent = 2;
  repPipe = 3;
  repUbil = 4;
  repSlich = 5;

var
  InvRepForm: TInvRepForm;

implementation

{$R *.DFM}

uses Main, ChooseOrg, ExFunc;

procedure TInvRepForm.FormShow(Sender: TObject);
begin
  org_id := main_id;
  org_inst := inst;
  edFrom.Text := current_name;
  case RepKind of
  rep7np:
  begin
    Caption:= TranslateText('Форма - 7НП');
    Label1.Visible:=false;
    RxCalcEdit1.Visible:=false;
    RxCalcEdit1.Value:=1;
    bbOk.OnClick := Self.Rep7npClick;
  end;
  repInvent:
  begin
    Caption:= TranslateText('Инвентаризационная ведомость');
    Label4.Visible:= false;
    DateEdit2.Visible:= false;
    Label3.Caption:= TranslateText('Дата');
    Cb1.Visible:=true;
    bbOk.OnClick := Self.RepInventClick;
  end;
  repPipe:
  begin
    Caption:= TranslateText('Ведомость наличия НП в трубопроводах');
    Label4.Visible:= false;
    DateEdit2.Visible:= false;
    Label3.Caption:= TranslateText('Дата');
    bbOk.OnClick := Self.RepPipeClick;
  end;
  repUbil:
  begin
    Caption:= TranslateText('Расчет естественной убыли');
    Label4.Visible:= false;
    DateEdit2.Visible:= false;
    Label3.Caption:= TranslateText('Месяц');
    bbOk.OnClick := Self.RepUbilClick;

  end;
  repSlich:
  begin
    Caption:= TranslateText('Сличительная ведомость');
    Label4.Visible:= false;
    DateEdit2.Visible:= false;
    Label3.Caption:= TranslateText('Дата');
    bbOk.OnClick := Self.RepSlichClick;

  end;
  end; // of case
end;

procedure TInvRepForm.rep7npClick (Sender: TObject);
var
  TheDate :TDateTime;
begin
  if not ValidateInfo then Exit;
  // Блок начальных проверок
  Try
    Application.CreateForm(TProgrForm, ProgrForm);
    ProgrForm.Show;
    ProgrForm.Refresh;
    GetOrg;
    ProgrForm.AddProgress(3);

    CurrLine:=6;
    theDate:= DateEdit1.Date;
    // Инициализация Экселя
    if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown))
      then XLApp := GetActiveOleObject('Excel.Application')
      else XLApp := CreateOleObject('Excel.Application');
    ProgrForm.AddProgress(5);
    ProgrForm.AddProgress(5);
    IWorkbook := XLApp.Workbooks.Add(GetMainDir+'pattern\7nprep.xls');
    ProgrForm.AddProgress(5);
    ISheet := IWorkbook.Worksheets.Item['Лист1']; // as Excel8TLB._Worksheet; *NO_TRANSLATE*
    List:=ISheet;
    ProgrForm.AddProgress(5);

    // Заголовок отчета
    List.Cells[1,'A']:=orgQName.AsString;
    List.Cells[2,'B']:=orgQID_NUM.AsString;
    List.Cells[1,'P']:=DateTimeToStr(GetSystemDate)+' '+Current_Name;

    //Собственно тело отчета
    repeat
      q.close;
      q.SQL.Clear;

      q.SQL.Add('select distinct * from (                                                                       ');
      q.SQL.Add('select                                                                                         ');
      q.SQL.Add('  ont.name                                                                 ntype,              ');
      q.SQL.Add('  ''№''||orr.num||'' ''||orr.name                                              "rez_name",     ');
      q.SQL.Add('  orp.all_height                                                           "all_height",       ');
      q.SQL.Add('  orp.water_height                                                         "water_height",     ');
      q.SQL.Add('  rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                       "all_vol",          ');
      q.SQL.Add('  rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)                     "wat_vol",          ');
      q.SQL.Add('  rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                                           ');
      q.SQL.Add('      - rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)               "prod_vol",         ');
      q.SQL.Add('  nvl(pipeq.pipe_vol,0)                                                    "pipe_vol",         ');
      q.SQL.Add('  orp.ud_veight                                                            "uv",               ');
      q.SQL.Add('  orp.temperature                                                          "temp",             ');
      q.SQL.Add('  nvl((rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                                      ');
      q.SQL.Add('      - rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)                                   ');
      q.SQL.Add('      + nvl(pipeq.pipe_vol,0)) * orp.ud_veight,0)                          "mass",             ');
      q.SQL.Add('  nvl(bookQ.book_mass,0)                                                   "b_mass",           ');
      q.SQL.Add('  nvl(prq.prih,0)                                                          "b_prih",           ');
      q.SQL.Add('  nvl(-raq.rash,0)                                                          "b_rash",          ');
      q.SQL.Add('  nvl((rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                                      ');
      q.SQL.Add('      - rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)                                   ');
      q.SQL.Add('      + nvl(pipeq.pipe_vol,0)) * orp.ud_veight,0) - nvl(bookQ.book_mass,0)                     ');
      q.SQL.Add('      -nvl(prq.prih,0) - nvl(raq.rash,0)                                   "dif"               ');
      q.SQL.Add('from                                                                                           ');
      q.SQL.Add('  oil_np_type ont,                                                                             ');
      q.SQL.Add('  oil_rezervuar orr,                                                                           ');
      q.SQL.Add('  oil_rests_phys orp,                                                                          ');
      q.SQL.Add('  (                                                                                            ');
      q.SQL.Add('  select                                                                                       ');
      q.SQL.Add('     orpp.np_type                                            pipe_type,                        ');
      q.SQL.Add('     orpp.temperature                                        pipe_temp,                        ');
      q.SQL.Add('     orpp.ud_veight                                          pipe_udv,                         ');
      q.SQL.Add('     sum(op.diameter*op.diameter*length_*3.14159265/4000000) pipe_vol                          ');
      q.SQL.Add('  from                                                                                         ');
      q.SQL.Add('    oil_rests_pipe orpp,                                                                       ');
      q.SQL.Add('    oil_pipe  op                                                                               ');
      q.SQL.Add('  where                                                                                        ');
      q.SQL.Add('    orpp.state = ''Y'' and                                                                     ');
      q.SQL.Add('    op.state = ''Y'' and                                                                       ');
      q.SQL.Add('    orpp.pipe_id = op.id and                                                                   ');
      q.SQL.Add('    orpp.pipe_inst  = op.inst and                                                              ');
      q.SQL.Add('    orpp.date_ = '''+DateToStr(TheDate)+'''     ------------                                   ');
      q.SQL.Add('  group by                                                                                     ');
      q.SQL.Add('    orpp.np_type,                                                                              ');
      q.SQL.Add('    orpp.temperature,                                                                          ');
      q.SQL.Add('    orpp.ud_veight                                                                             ');
      q.SQL.Add('  ) pipeQ,                                                                                     ');
      q.SQL.Add('  (                                                                                            ');
      q.SQL.Add('    select                                                                                     ');
      q.SQL.Add('      sum(book.s)                                                book_mass,                    ');
      q.SQL.Add('      book.rez_id                                                book_rez_id,                  ');
      q.SQL.Add('      book.rez_inst                                              book_rez_inst,                ');
      q.SQL.Add('      book.np_type                                               np_type                       ');
      q.SQL.Add('    from                                                                                       ');
      q.SQL.Add('      v_oil_left  book,                                                                        ');
      q.SQL.Add('      oil_part  opp                                                                            ');
      q.SQL.Add('    where                                                                                      ');
      q.SQL.Add('      book.date_ < to_date('''+DateToStr(TheDate)+''')-1 and     ------------                  ');
      q.SQL.Add('      opp.state = ''Y'' and                                                                    ');
      q.SQL.Add('      opp.id = book.part_id and                                                                ');
      q.SQL.Add('      opp.inst = book.part_inst and                                                            ');
      q.SQL.Add('      opp.dim_id = 2 and                                                                       ');
      q.SQL.Add('      opp.base_ = 0                                                                            ');
      q.SQL.Add('    group by                                                                                   ');
      q.SQL.Add('      book.rez_id,book.rez_inst,book.np_type                                                   ');
      q.SQL.Add('    having sum(book.s) > 0                                                                     ');
      q.SQL.Add('  )  bookQ                                                                                     ');
      q.SQL.Add('  ,                                                                                            ');
      q.SQL.Add('  (                                                                                            ');
      q.SQL.Add('   select                                                                                      ');
      q.SQL.Add('      sum(book.s)                                                prih,                         ');
      q.SQL.Add('      book.rez_id                                                rez_id,                       ');
      q.SQL.Add('      book.rez_inst                                              rez_inst,                     ');
      q.SQL.Add('      book.np_type                                               np_type                       ');
      q.SQL.Add('    from                                                                                       ');
      q.SQL.Add('      v_oil_left  book,                                                                        ');
      q.SQL.Add('      oil_part  opp                                                                            ');
      q.SQL.Add('    where                                                                                      ');
      q.SQL.Add('      book.date_ = to_date('''+DateToStr(TheDate)+''')-1 and     ------------                  ');
      q.SQL.Add('      book.s > 0 and                                                                           ');
      q.SQL.Add('      opp.state = ''Y'' and                                                                    ');
      q.SQL.Add('      opp.id = book.part_id and                                                                ');
      q.SQL.Add('      opp.inst = book.part_inst and                                                            ');
      q.SQL.Add('      opp.dim_id = 2 and                                                                       ');
      q.SQL.Add('      opp.base_ = 0                                                                            ');
      q.SQL.Add('    group by                                                                                   ');
      q.SQL.Add('      book.rez_id,book.rez_inst,book.np_type                                                   ');
      q.SQL.Add('  )  prq,                                                                                      ');
      q.SQL.Add('  (                                                                                            ');
      q.SQL.Add('   select                                                                                      ');
      q.SQL.Add('      sum(book.s)                                                rash,                         ');
      q.SQL.Add('      book.rez_id                                                rez_id,                       ');
      q.SQL.Add('      book.rez_inst                                              rez_inst,                     ');
      q.SQL.Add('      book.np_type                                               np_type                       ');
      q.SQL.Add('    from                                                                                       ');
      q.SQL.Add('      v_oil_left  book,                                                                        ');
      q.SQL.Add('      oil_part  opp                                                                            ');
      q.SQL.Add('    where                                                                                      ');
      q.SQL.Add('      book.date_ = to_date('''+DateToStr(TheDate)+''')-1 and     ------------                  ');
      q.SQL.Add('      book.s < 0 and                                                                           ');
      q.SQL.Add('      opp.state = ''Y'' and                                                                    ');
      q.SQL.Add('      opp.id = book.part_id and                                                                ');
      q.SQL.Add('      opp.inst = book.part_inst and                                                            ');
      q.SQL.Add('      opp.dim_id = 2 and                                                                       ');
      q.SQL.Add('      opp.base_ = 0                                                                            ');
      q.SQL.Add('    group by                                                                                   ');
      q.SQL.Add('      book.rez_id,book.rez_inst,book.np_type                                                   ');
      q.SQL.Add('  )  raq                                                                                       ');
      q.SQL.Add('where                                                                                          ');
      q.SQL.Add('  ont.state = ''Y'' and                                                                        ');
      q.SQL.Add('  orr.state = ''Y'' and                                                                        ');
      q.SQL.Add('  orp.state (+)= ''Y'' and                                                                     ');
      q.SQL.Add('  bookQ.np_type = ont.id and                                                                   ');
      q.SQL.Add('  bookQ.book_rez_id = orr.id and                                                               ');
      q.SQL.Add('  bookQ.book_rez_inst = orr.inst and                                                           ');
      q.SQL.Add('  orp.date_ (+)= '''+DateToStr(TheDate)+''' and               ------------                     ');
      q.SQL.Add('  orr.id_org = '+intToStr(org_id)+' and                   ------------                         ');
      q.SQL.Add('  orr.inst_org = '+intToStr(org_inst)+' and               ------------                         ');
      q.SQL.Add('  bookQ.book_rez_id = orp.rez_id(+) and                                                        ');
      q.SQL.Add('  bookQ.book_rez_inst = orp.rez_inst(+) and                                                    ');
      q.SQL.Add('  bookQ.np_type = orp.np_type(+) and                                                           ');
      q.SQL.Add('  pipe_type (+)= orp.np_type and                                                               ');
      q.SQL.Add('  pipe_temp (+)= orp.temperature and                                                           ');
      q.SQL.Add('  pipe_udv  (+)= orp.ud_veight                                                                 ');
      q.SQL.Add('  and                                                                                          ');
      q.SQL.Add('  bookQ.book_rez_id = prq.rez_id(+) and                                                        ');
      q.SQL.Add('  bookQ.book_rez_inst = prq.rez_inst(+) and                                                    ');
      q.SQL.Add('  bookQ.np_type = prq.np_type(+) and                                                           ');
      q.SQL.Add('  bookQ.book_rez_id = raq.rez_id(+) and                                                        ');
      q.SQL.Add('  bookQ.book_rez_inst = raq.rez_inst(+) and                                                    ');
      q.SQL.Add('  bookQ.np_type = raq.np_type(+)                                                               ');
      q.SQL.Add('union  select                                                                                  ');
      q.SQL.Add('  ont.name                                                                  ntype,             ');
      q.SQL.Add('  ''№''||orr.num||'' ''||orr.name                                           "rez_name",        ');
      q.SQL.Add('  orp.all_height                                                            "all_height",      ');
      q.SQL.Add('  orp.water_height                                                          "water_height",    ');
      q.SQL.Add('  rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                        "all_vol",         ');
      q.SQL.Add('  rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)                      "wat_vol",         ');
      q.SQL.Add('  rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                                           ');
      q.SQL.Add('      - rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)                "prod_vol",        ');
      q.SQL.Add('  nvl(pipeq.pipe_vol,0)                                                     "pipe_vol",        ');
      q.SQL.Add('  orp.ud_veight                                                             "uv",              ');
      q.SQL.Add('  orp.temperature                                                           "temp",            ');
      q.SQL.Add('  nvl((rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                                      ');
      q.SQL.Add('      - rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)                                   ');
      q.SQL.Add('      + nvl(pipeq.pipe_vol,0)) * orp.ud_veight,0)                           "mass",            ');
      q.SQL.Add('  nvl(bookQ.book_mass,0)                                                    "b_mass",          ');
      q.SQL.Add('  nvl(prq.prih,0)                                                           "b_prih",          ');
      q.SQL.Add('  nvl(-raq.rash,0)                                                           "b_rash",         ');
      q.SQL.Add('  nvl((rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                                      ');
      q.SQL.Add('      - rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)                                   ');
      q.SQL.Add('      + nvl(pipeq.pipe_vol,0)) * orp.ud_veight,0) - nvl(bookQ.book_mass,0)                     ');
      q.SQL.Add('      -nvl(prq.prih,0) - nvl(raq.rash,0)                                    "dif"              ');
      q.SQL.Add('from                                                                                           ');
      q.SQL.Add('  oil_np_type ont,                                                                             ');
      q.SQL.Add('  oil_rezervuar orr,                                                                           ');
      q.SQL.Add('  oil_rests_phys orp,                                                                          ');
      q.SQL.Add('  (                                                                                            ');
      q.SQL.Add('  select                                                                                       ');
      q.SQL.Add('     orpp.np_type                                            pipe_type,                        ');
      q.SQL.Add('     orpp.temperature                                        pipe_temp,                        ');
      q.SQL.Add('     orpp.ud_veight                                          pipe_udv,                         ');
      q.SQL.Add('     sum(op.diameter*op.diameter*length_*3.14159265/4000000) pipe_vol                          ');
      q.SQL.Add('  from                                                                                         ');
      q.SQL.Add('    oil_rests_pipe orpp,                                                                       ');
      q.SQL.Add('    oil_pipe  op                                                                               ');
      q.SQL.Add('  where                                                                                        ');
      q.SQL.Add('    orpp.state = ''Y'' and                                                                     ');
      q.SQL.Add('    op.state = ''Y'' and                                                                       ');
      q.SQL.Add('    orpp.pipe_id = op.id and                                                                   ');
      q.SQL.Add('    orpp.pipe_inst  = op.inst and                                                              ');
      q.SQL.Add('    orpp.date_ = '''+DateToStr(TheDate)+'''     ------------                                   ');
      q.SQL.Add('  group by                                                                                     ');
      q.SQL.Add('    orpp.np_type,                                                                              ');
      q.SQL.Add('    orpp.temperature,                                                                          ');
      q.SQL.Add('    orpp.ud_veight                                                                             ');
      q.SQL.Add('  ) pipeQ,                                                                                     ');
      q.SQL.Add('  (                                                                                            ');
      q.SQL.Add('    select                                                                                     ');
      q.SQL.Add('      sum(book.s)                                                book_mass,                    ');
      q.SQL.Add('      book.rez_id                                                book_rez_id,                  ');
      q.SQL.Add('      book.rez_inst                                              book_rez_inst,                ');
      q.SQL.Add('      book.np_type                                               np_type                       ');
      q.SQL.Add('    from                                                                                       ');
      q.SQL.Add('      v_oil_left  book,                                                                        ');
      q.SQL.Add('      oil_part  opp                                                                            ');
      q.SQL.Add('    where                                                                                      ');
      q.SQL.Add('      book.date_ < to_date('''+DateToStr(TheDate)+''')-1 and     ------------                  ');
      q.SQL.Add('      opp.state = ''Y'' and                                                                    ');
      q.SQL.Add('      opp.id = book.part_id and                                                                ');
      q.SQL.Add('      opp.inst = book.part_inst and                                                            ');
      q.SQL.Add('      opp.dim_id = 2 and                                                                       ');
      q.SQL.Add('      opp.base_ = 0                                                                            ');
      q.SQL.Add('   group by                                                                                    ');
      q.SQL.Add('      book.rez_id,book.rez_inst,book.np_type                                                   ');
      q.SQL.Add('    having sum(book.s) > 0                                                                     ');
      q.SQL.Add('  )  bookQ                                                                                     ');
      q.SQL.Add('  ,                                                                                            ');
      q.SQL.Add('  (                                                                                            ');
      q.SQL.Add('   select                                                                                      ');
      q.SQL.Add('      sum(book.s)                                                prih,                         ');
      q.SQL.Add('      book.rez_id                                                rez_id,                       ');
      q.SQL.Add('      book.rez_inst                                              rez_inst,                     ');
      q.SQL.Add('      book.np_type                                               np_type                       ');
      q.SQL.Add('    from                                                                                       ');
      q.SQL.Add('      v_oil_left  book,                                                                        ');
      q.SQL.Add('      oil_part  opp                                                                            ');
      q.SQL.Add('    where                                                                                      ');
      q.SQL.Add('      book.date_ = to_date('''+DateToStr(TheDate)+''')-1 and     ------------                  ');
      q.SQL.Add('      book.s > 0 and                                                                           ');
      q.SQL.Add('      opp.state = ''Y'' and                                                                    ');
      q.SQL.Add('      opp.id = book.part_id and                                                                ');
      q.SQL.Add('      opp.inst = book.part_inst and                                                            ');
      q.SQL.Add('      opp.dim_id = 2 and                                                                       ');
      q.SQL.Add('      opp.base_ = 0                                                                            ');
      q.SQL.Add('    group by                                                                                   ');
      q.SQL.Add('      book.rez_id,book.rez_inst,book.np_type                                                   ');
      q.SQL.Add('  )  prq,                                                                                      ');
      q.SQL.Add('  (                                                                                            ');
      q.SQL.Add('   select                                                                                      ');
      q.SQL.Add('      sum(book.s)                                                rash,                         ');
      q.SQL.Add('      book.rez_id                                                rez_id,                       ');
      q.SQL.Add('      book.rez_inst                                              rez_inst,                     ');
      q.SQL.Add('      book.np_type                                               np_type                       ');
      q.SQL.Add('    from                                                                                       ');
      q.SQL.Add('      v_oil_left  book,                                                                        ');
      q.SQL.Add('      oil_part  opp                                                                            ');
      q.SQL.Add('    where                                                                                      ');
      q.SQL.Add('      book.date_ = to_date('''+DateToStr(TheDate)+''')-1 and     ------------                  ');
      q.SQL.Add('      book.s < 0 and                                                                           ');
      q.SQL.Add('      opp.state = ''Y'' and                                                                    ');
      q.SQL.Add('      opp.id = book.part_id and                                                                ');
      q.SQL.Add('      opp.inst = book.part_inst and                                                            ');
      q.SQL.Add('      opp.dim_id = 2 and                                                                       ');
      q.SQL.Add('      opp.base_ = 0                                                                            ');
      q.SQL.Add('    group by                                                                                   ');
      q.SQL.Add('      book.rez_id,book.rez_inst,book.np_type                                                   ');
      q.SQL.Add('  )  raq                                                                                       ');
      q.SQL.Add('where                                                                                          ');
      q.SQL.Add('  ont.state = ''Y'' and                                                                        ');
      q.SQL.Add('  orr.state = ''Y'' and                                                                        ');
      q.SQL.Add('  orp.state = ''Y'' and                                                                        ');
      q.SQL.Add('  orp.np_type = ont.id and                                                                     ');
      q.SQL.Add('  orp.rez_id = orr.id and                                                                      ');
      q.SQL.Add('  orp.rez_inst = orr.inst and                                                                  ');
      q.SQL.Add('  orp.date_ = '''+DateToStr(TheDate)+''' and                  ------------                     ');
      q.SQL.Add('  orr.id_org = '+intToStr(org_id)+' and                   ------------                         ');
      q.SQL.Add('  orr.inst_org = '+intToStr(org_inst)+' and               ------------                         ');
      q.SQL.Add('  bookQ.book_rez_id (+)= orp.rez_id and                                                        ');
      q.SQL.Add('  bookQ.book_rez_inst (+)= orp.rez_inst and                                                    ');
      q.SQL.Add('  bookQ.np_type (+)= orp.np_type and                                                           ');
      q.SQL.Add('  pipe_type (+)= orp.np_type and                                                               ');
      q.SQL.Add('   pipe_temp (+)= orp.temperature and                                                          ');
      q.SQL.Add('   pipe_udv  (+)= orp.ud_veight                                                                ');
      q.SQL.Add('  and                                                                                          ');
      q.SQL.Add('  orp.rez_id = prq.rez_id(+) and                                                               ');
      q.SQL.Add('  orp.rez_inst = prq.rez_inst(+) and                                                           ');
      q.SQL.Add('  orp.np_type = prq.np_type(+) and                                                             ');
      q.SQL.Add('  orp.rez_id = raq.rez_id(+) and                                                               ');
      q.SQL.Add('  orp.rez_inst = raq.rez_inst(+) and                                                           ');
      q.SQL.Add('  orp.np_type = raq.np_type(+)                                                                 ');
      q.SQL.Add(')order by ntype                                                                                ');
      //q.SQL.Add('}                                                                                              ');

      q.Open;

      // Мерный товар
      while not q.EOF do
      begin
        Currline:=CurrLine+1;
        List.Cells[CurrLine,'A']:=DateToStr(TheDate) ;
        List.Cells[CurrLine,'B']:=q.FieldByName('ntype').asString ;
        List.Cells[CurrLine,'C']:=q.FieldByName('rez_name').asString ;
        if not q.FieldByName('all_height').isNull then
        begin
          List.Cells[CurrLine,'D']:=q.FieldByName('all_height').asFloat ;
          List.Cells[CurrLine,'F']:=q.FieldByName('water_height').asFloat ;
          List.Cells[CurrLine,'E']:=q.FieldByName('all_vol').asFloat ;
          List.Cells[CurrLine,'G']:=q.FieldByName('wat_vol').asFloat ;
          List.Cells[CurrLine,'H']:=q.FieldByName('prod_vol').asFloat ;
          List.Cells[CurrLine,'I']:=q.FieldByName('pipe_vol').asFloat ;
          List.Cells[CurrLine,'J']:=q.FieldByName('uv').asFloat ;
          List.Cells[CurrLine,'K']:=q.FieldByName('temp').asFloat ;
          List.Cells[CurrLine,'L']:=q.FieldByName('mass').asFloat ;
        end;
        List.Cells[CurrLine,'M']:=q.FieldByName('b_prih').asFloat ;
        List.Cells[CurrLine,'N']:=q.FieldByName('b_rash').asFloat ;
        List.Cells[CurrLine,'O']:=q.FieldByName('b_mass').asFloat ;
        List.Cells[CurrLine,'P']:=q.FieldByName('dif').asFloat ;


        List.Range['A'+IntToStr(CurrLine)+':P'+IntToStr(Currline)].Borders.LineStyle:=1;
        List.Range['A'+IntToStr(CurrLIne)+':P'+IntToStr(CurrLine)].Borders.Weight:=xlThin;
        q.next;
        if ProgrForm.PercentDone < 90 then
          ProgrForm.AddProgress(1);
      end;

      List.Range['A'+IntToStr(CurrLine)+':P'+IntToStr(Currline)].Borders[xlEdgeBottom].LineStyle:=1;
      List.Range['A'+IntToStr(CurrLIne)+':P'+IntToStr(CurrLine)].Borders[xlEdgeBottom].Weight:=xlMedium;
      //List.Range['B'+IntToStr(CurrLine)+':R'+IntToStr(Currline)].Borders[xlEdgeTop].LineStyle:=1;
      //List.Range['B'+IntToStr(CurrLIne)+':R'+IntToStr(CurrLine)].Borders[xlEdgeTop].Weight:=xlMedium;
      TheDate:=TheDate+1
    until TheDate > DateEdit2.Date;
    ProgrForm.AddProgress(100);
    // Показать эксель
    XLApp.Visible:=True;
    XLApp.ScreenUpdating := True;
    ProgrForm.Free;
  except
    ProgrForm.Free;
  end;
end;

procedure TInvRepForm.repInventClick (Sender: TObject);
var
  npp     :integer;
  posit   :integer;
  all     :real  ;
begin
  if not ValidateInfo then Exit;
  // Блок начальных проверок
  Try
    Application.CreateForm(TProgrForm, ProgrForm);
    ProgrForm.Show;
    ProgrForm.Refresh;
    GetOrg;
    ProgrForm.AddProgress(3);

    CurrLine:=20;
    npp:=0;

    posit:=0;
    all:=0;

    q.close;
    q.SQL.Clear;

    q.sql.add('select distinct * from (                                                             ');
    q.sql.add('select                                                                               ');
    q.sql.add('  ont.name                                                            ntype,         ');
    q.sql.add('  ''№''||orr.num||'' ''||orr.name                                     "rez_name",    ');
    q.sql.add('  orp.all_height                                                      "all_height",  ');
    q.sql.add('  orp.water_height                                                    "water_height",');
    q.sql.add('  rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                  "all_vol",     ');
    q.sql.add('  rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)                "wat_vol",     ');
    q.sql.add('  rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                                 ');
    q.sql.add('      - rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)          "prod_vol",    ');
    q.sql.add('  nvl(pipeq.pipe_vol,0)                                               "pipe_vol",    ');
    q.sql.add('  orp.ud_veight                                                       "uv",          ');
    q.sql.add('  orp.temperature                                                     "temp",        ');
    q.sql.add('  (rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                                ');
    q.sql.add('      - rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)                         ');
    q.sql.add('      + nvl(pipeq.pipe_vol,0)) * orp.ud_veight                        "mass",        ');
    q.sql.add('  nvl(bookQ.book_mass,0)                                              "b_mass",      ');
    q.sql.add('  nvl((rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                            ');
    q.sql.add('      - rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)                         ');
    q.sql.add('      + nvl(pipeq.pipe_vol,0)) * orp.ud_veight,0) - nvl(bookQ.book_mass,0) "dif"     ');
    q.sql.add('from                                                                                 ');
    q.sql.add('  oil_np_type ont,                                                                   ');
    q.sql.add('  oil_rezervuar orr,                                                                 ');
    q.sql.add('  oil_rests_phys orp,                                                                ');
    q.sql.add('  (                                                                                  ');
    q.sql.add('  select                                                                             ');
    q.sql.add('     orpp.np_type                                                   pipe_type,       ');
    q.sql.add('     orpp.temperature                                               pipe_temp,       ');
    q.sql.add('     orpp.ud_veight                                                 pipe_udv,        ');
    q.sql.add('     sum(op.diameter*op.diameter*length_*3.14159265/4000000)        pipe_vol         ');
    q.sql.add('  from                                                                               ');
    q.sql.add('    oil_rests_pipe orpp,                                                             ');
    q.sql.add('    oil_pipe  op                                                                     ');
    q.sql.add('  where                                                                              ');
    q.sql.add('    orpp.state = ''Y'' and                                                           ');
    q.sql.add('    op.state = ''Y'' and                                                             ');
    q.sql.add('    orpp.pipe_id = op.id and                                                         ');
    q.sql.add('    orpp.pipe_inst  = op.inst and                                                    ');
    q.sql.add('    orpp.date_ = '''+DateEdit1.Text+'''     ------------ ');
    q.sql.add('  group by                                                                           ');
    q.sql.add('    orpp.np_type,                                                                    ');
    q.sql.add('    orpp.temperature,                                                                ');
    q.sql.add('    orpp.ud_veight                                                                   ');
    q.sql.add('  ) pipeQ,                                                                           ');
    q.sql.add('  (                                                                                  ');
    q.sql.add('    select                                                                           ');
    q.sql.add('      sum(book.s)                                                book_mass,          ');
    q.sql.add('      book.rez_id                                                book_rez_id,        ');
    q.sql.add('      book.rez_inst                                              book_rez_inst,      ');
    q.sql.add('      book.np_type                                               np_type             ');
    q.sql.add('    from                                                                             ');
    q.sql.add('      v_oil_left  book,                                                              ');
    q.sql.add('      oil_part  opp                                                                  ');
    q.sql.add('    where                                                                            ');
    q.sql.add('      book.date_ < '''+DateEdit1.Text+''' and     ------------ ');
    q.sql.add('      opp.state = ''Y'' and                                                          ');
    q.sql.add('      opp.id = book.part_id and                                                      ');
    q.sql.add('      opp.inst = book.part_inst and                                                  ');
    q.sql.add('      opp.dim_id = 2 and                                                             ');
    q.sql.add('      opp.base_ = 0                                                                  ');
    q.sql.add('    group by                                                                         ');
    q.sql.add('      book.rez_id,book.rez_inst,book.np_type                                         ');
    q.sql.add('    having sum(book.s) > 0                                                           ');
    q.sql.add('  )  bookQ                                                                           ');
    q.sql.add('where                                                                                ');
    q.sql.add('  ont.state = ''Y'' and                                                              ');
    q.sql.add('  orr.state = ''Y'' and                                                              ');
    q.sql.add('  orp.state (+)= ''Y'' and                                                           ');
    q.sql.add('  bookQ.np_type = ont.id and                                                         ');
    q.sql.add('  bookQ.book_rez_id = orr.id and                                                     ');
    q.sql.add('  bookQ.book_rez_inst = orr.inst and                                                 ');
    q.sql.add('  orp.date_ (+)= '''+ DateEdit1.Text +''' and               ------------ ');
    q.sql.add('  orr.id_org = '+ IntToStr(org_id) +' and                   ------------ ');
    q.sql.add('  orr.inst_org = '+ IntToStr(org_inst) +' and               ------------ ');
    q.sql.add('  bookQ.book_rez_id = orp.rez_id(+) and                                              ');
    q.sql.add('  bookQ.book_rez_inst = orp.rez_inst(+) and                                          ');
    q.sql.add('  bookQ.np_type = orp.np_type(+) and                                                 ');
    q.sql.add('  pipe_type (+)= orp.np_type and                                                     ');
    q.sql.add('   pipe_temp (+)= orp.temperature and                                                ');
    q.sql.add('   pipe_udv  (+)= orp.ud_veight                                                      ');
    q.sql.add('union  select                                                                        ');
    q.sql.add('  ont.name                                                            ntype,         ');
    q.sql.add('  ''№''||orr.num||'' ''||orr.name                                     "rez_name",    ');
    q.sql.add('  orp.all_height                                                      "all_height",  ');
    q.sql.add('  orp.water_height                                                    "water_height",');
    q.sql.add('  rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                  "all_vol",     ');
    q.sql.add('  rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)                "wat_vol",     ');
    q.sql.add('  rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                                 ');
    q.sql.add('      - rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)          "prod_vol",    ');
    q.sql.add('  nvl(pipeq.pipe_vol,0)                                               "pipe_vol",    ');
    q.sql.add('  orp.ud_veight                                                       "uv",          ');
    q.sql.add('  orp.temperature                                                     "temp",        ');
    q.sql.add('  (rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                                ');
    q.sql.add('      - rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)                         ');
    q.sql.add('      + nvl(pipeq.pipe_vol,0)) * orp.ud_veight                        "mass",        ');
    q.sql.add('  nvl(bookQ.book_mass,0)                                             "b_mass",       ');
    q.sql.add('  nvl((rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                            ');
    q.sql.add('      - rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)                         ');
    q.sql.add('      + nvl(pipeq.pipe_vol,0)) * orp.ud_veight,0) - nvl(bookQ.book_mass,0) "dif"     ');
    q.sql.add('from                                                                                 ');
    q.sql.add('  oil_np_type ont,                                                                   ');
    q.sql.add('  oil_rezervuar orr,                                                                 ');
    q.sql.add('  oil_rests_phys orp,                                                                ');
    q.sql.add('  (                                                                                  ');
    q.sql.add('  select                                                                             ');
    q.sql.add('     orpp.np_type                                            pipe_type,              ');
    q.sql.add('     orpp.temperature                                        pipe_temp,              ');
    q.sql.add('     orpp.ud_veight                                          pipe_udv,               ');
    q.sql.add('     sum(op.diameter*op.diameter*length_*3.14159265/4000000) pipe_vol                ');
    q.sql.add('  from                                                                               ');
    q.sql.add('    oil_rests_pipe orpp,                                                             ');
    q.sql.add('    oil_pipe  op                                                                     ');
    q.sql.add('  where                                                                              ');
    q.sql.add('    orpp.state = ''Y'' and                                                           ');
    q.sql.add('    op.state = ''Y'' and                                                             ');
    q.sql.add('    orpp.pipe_id = op.id and                                                         ');
    q.sql.add('    orpp.pipe_inst  = op.inst and                                                    ');
    q.sql.add('    orpp.date_ = '''+DateEdit1.Text+'''     ------------ ');
    q.sql.add('  group by                                                                           ');
    q.sql.add('    orpp.np_type,                                                                    ');
    q.sql.add('    orpp.temperature,                                                                ');
    q.sql.add('    orpp.ud_veight                                                                   ');
    q.sql.add('  ) pipeQ,                                                                           ');
    q.sql.add('  (                                                                                  ');
    q.sql.add('    select                                                                           ');
    q.sql.add('      sum(book.s)                                                book_mass,          ');
    q.sql.add('      book.rez_id                                                book_rez_id,        ');
    q.sql.add('      book.rez_inst                                              book_rez_inst,      ');
    q.sql.add('      book.np_type                                               np_type             ');
    q.sql.add('    from                                                                             ');
    q.sql.add('      v_oil_left  book,                                                              ');
    q.sql.add('      oil_part  opp                                                                  ');
    q.sql.add('    where                                                                            ');
    q.sql.add('      book.date_ < '''+DateEdit1.Text+''' and     ------------ ');
    q.sql.add('      opp.state = ''Y'' and                                                          ');
    q.sql.add('      opp.id = book.part_id and                                                      ');
    q.sql.add('      opp.inst = book.part_inst and                                                  ');
    q.sql.add('      opp.dim_id = 2 and                                                             ');
    q.sql.add('      opp.base_ = 0                                                                  ');
    q.sql.add('    group by                                                                         ');
    q.sql.add('      book.rez_id,book.rez_inst,book.np_type                                         ');
    q.sql.add('    having sum(book.s) > 0                                                           ');
    q.sql.add('  )  bookQ                                                                           ');
    q.sql.add('where                                                                                ');
    q.sql.add('  ont.state = ''Y'' and                                                              ');
    q.sql.add('  orr.state = ''Y'' and                                                              ');
    q.sql.add('  orp.state = ''Y'' and                                                              ');
    q.sql.add('  orp.np_type = ont.id and                                                           ');
    q.sql.add('  orp.rez_id = orr.id and                                                            ');
    q.sql.add('  orp.rez_inst = orr.inst and                                                        ');
    q.sql.add('  orp.date_ = '''+ DateEdit1.Text +''' and                  ------------ ');
    q.sql.add('  orr.id_org = '+ IntToStr(org_id) +' and                   ------------ ');
    q.sql.add('  orr.inst_org = '+ IntToStr(org_inst) +' and               ------------ ');
    q.sql.add('  bookQ.book_rez_id (+)= orp.rez_id and                                              ');
    q.sql.add('  bookQ.book_rez_inst (+)= orp.rez_inst and                                          ');
    q.sql.add('  bookQ.np_type (+)= orp.np_type and                                                 ');
    q.sql.add('  pipe_type (+)= orp.np_type and                                                     ');
    q.sql.add('   pipe_temp (+)= orp.temperature and                                                ');
    q.sql.add('   pipe_udv  (+)= orp.ud_veight                                                      ');

    q.sql.add('  )order by ntype                                                                 ');

    q.Open;

    If q.Active Then
    If q.RecordCount > 0 Then
    Begin
      // Инициализация Экселя
        if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown))
        then XLApp := GetActiveOleObject('Excel.Application')
        else XLApp := CreateOleObject('Excel.Application');
      ProgrForm.AddProgress(5);
      ProgrForm.AddProgress(5);
      IWorkbook := XLApp.Workbooks.Add(GetMainDir+'pattern\InventRep.xls');
      ProgrForm.AddProgress(5);
      ISheet := IWorkbook.Worksheets.Item['Лист1']; // as Excel8TLB._Worksheet;  *NO_TRANSLATE*
      List:=ISheet;
      ProgrForm.AddProgress(5);
      // Заголовок отчета
      List.Cells[2,'A']:=orgQName.AsString;
      List.Cells[5,'C']:=orgQID_NUM.AsString;
      List.Cells[6,'F']:='№ '+RxCalcEdit1.Text+TranslateText(' от ')+DateEdit1.Text;
      List.Cells[1,'P']:=DateTimeToStr(GetSystemDate)+' '+Current_Name;
      List.Cells[15,'K']:=DateEdit1.Text;
      //Собственно тело отчета

      // Мерный товар
      while not q.EOF do
      begin

        npp:=npp+1;
        List.Cells[CurrLine,'B']:=npp ;
        List.Cells[CurrLine,'C']:=q.FieldByName('ntype').asString ;
        List.Cells[CurrLine,'D']:=q.FieldByName('rez_name').asString ;
        if not q.FieldByName('all_height').isNull then
        begin
          List.Cells[CurrLine,'E']:=q.FieldByName('all_height').asFloat ;
          List.Cells[CurrLine,'F']:=q.FieldByName('water_height').asFloat ;
          List.Cells[CurrLine,'G']:=q.FieldByName('all_vol').asFloat ;
          List.Cells[CurrLine,'H']:=q.FieldByName('wat_vol').asFloat ;
          List.Cells[CurrLine,'I']:=q.FieldByName('prod_vol').asFloat ;
          List.Cells[CurrLine,'J']:=q.FieldByName('pipe_vol').asFloat ;
          List.Cells[CurrLine,'K']:=q.FieldByName('uv').asFloat ;
          List.Cells[CurrLine,'L']:=q.FieldByName('temp').asFloat ;
          List.Cells[CurrLine,'M']:=q.FieldByName('mass').asFloat ;

        end;
        List.Cells[CurrLine,'O']:=q.FieldByName('b_mass').asFloat ;
        List.Cells[CurrLine,'Q']:=q.FieldByName('dif').asFloat ;

        all:=all+ q.FieldByName('b_mass').asFloat;
        posit:=posit+1;

        List.Range['B'+IntToStr(CurrLine)+':R'+IntToStr(Currline)].Borders.LineStyle:=1;
        List.Range['B'+IntToStr(CurrLIne)+':R'+IntToStr(CurrLine)].Borders.Weight:=xlThin;
        q.next;
        Currline:=CurrLine+1;
        if ProgrForm.PercentDone < 90 then
          ProgrForm.AddProgress(1);
      end;

      List.Cells[CurrLine,'B']:=TranslateText('Всего мерного товара ')+FloatToStr(All)+TranslateText(' т. ')+IntToStr(Posit)+TranslateText(' поз. описи') ;
      List.Range['B'+IntToStr(CurrLine)+':R'+IntToStr(Currline)].Borders[xlEdgeBottom].LineStyle:=1;
      List.Range['B'+IntToStr(CurrLIne)+':R'+IntToStr(CurrLine)].Borders[xlEdgeBottom].Weight:=xlMedium;
      List.Range['B'+IntToStr(CurrLine)+':R'+IntToStr(Currline)].Borders[xlEdgeTop].LineStyle:=1;
      List.Range['B'+IntToStr(CurrLIne)+':R'+IntToStr(CurrLine)].Borders[xlEdgeTop].Weight:=xlMedium;
      CurrLine:=CurrLine+1;

      if not CB1.Checked then
      begin

        // Фасованый товар

        posit:=0;
        all:=0;

        Q.Close;
        Q.SQL.Clear;

        q.sql.add('select                                                      ');
        q.sql.add('  ont.name                                   "ntype",       ');
        q.sql.add('  bookQ.book_mass                            "b_mass",      ');
        q.sql.add('  bookQ.b_base                               "pack",        ');
        q.sql.add('  bookQ.b_dim                                "dim"          ');
        q.sql.add('from                                                        ');
        q.sql.add('  oil_np_type ont,                                          ');
        q.sql.add('  (                                                         ');
        q.sql.add('    select                                                  ');
        q.sql.add('      sum(book.s)                            book_mass,     ');
        q.sql.add('      opp.base_                              b_base,        ');
        q.sql.add('      book.np_type                           np_type,       ');
        q.sql.add('      od.name                                b_dim          ');
        q.sql.add('    from                                                    ');
        q.sql.add('      v_oil_left  book,                                     ');
        q.sql.add('      oil_part  opp,                                        ');
        q.sql.add('      oil_dimension od                                      ');
        q.sql.add('    where                                                   ');
        q.sql.add('      book.date_ < '''+ DateEdit1.Text +''' and     ------- ');
        q.sql.add('      opp.state = ''Y'' and                                 ');
        q.sql.add('      opp.id = book.part_id and                             ');
        q.sql.add('      opp.inst = book.part_inst and                         ');
        q.sql.add('      od.state = ''Y'' and                                  ');
        q.sql.add('      od.id = opp.dim_id   and                              ');
        q.sql.add('      opp.base_ <> 0                                        ');
        q.sql.add('    group by                                                ');
        q.sql.add('      opp.base_,book.np_type, od.name                       ');
        q.sql.add('  )  bookQ                                                  ');
        q.sql.add('where                                                       ');
        q.sql.add('  ont.state = ''Y'' and                                     ');
        q.sql.add('  bookQ.np_type = ont.id  and                               ');
        q.sql.add('  bookQ.book_mass > 0                                       ');
        q.sql.add('order by ont.name                                           ');
        q.Open;
        while not q.EOF do
        begin
          npp:=npp+1;
          List.Cells[CurrLine,'B']:=npp ;
          List.Cells[CurrLine,'C']:=q.FieldByName('ntype').asString ;
          List.Cells[CurrLine,'D']:=TranslateText('пак. ')+q.FieldByName('dim').asString;
          List.Cells[CurrLine,'O']:=q.FieldByName('b_mass').asFloat ;

          all:=all+ q.FieldByName('b_mass').asFloat;
          posit:=posit+1;

          List.Range['B'+IntToStr(CurrLine)+':R'+IntToStr(Currline)].Borders.LineStyle:=1;
          List.Range['B'+IntToStr(CurrLIne)+':R'+IntToStr(CurrLine)].Borders.Weight:=xlThin;
          q.next;
          Currline:=CurrLine+1;
          if ProgrForm.PercentDone < 90 then
            ProgrForm.AddProgress(1);
        end;

        List.Cells[CurrLine,'B']:=TranslateText('Всего фасованого товара ')+FloatToStr(All)+TranslateText(' скл. мест. ')+IntToStr(Posit)+TranslateText(' поз. описи') ;
        List.Range['B'+IntToStr(CurrLine)+':R'+IntToStr(Currline)].Borders[xlEdgeBottom].LineStyle:=1;
        List.Range['B'+IntToStr(CurrLIne)+':R'+IntToStr(CurrLine)].Borders[xlEdgeBottom].Weight:=xlMedium;
        List.Range['B'+IntToStr(CurrLine)+':R'+IntToStr(Currline)].Borders[xlEdgeTop].LineStyle:=1;
        List.Range['B'+IntToStr(CurrLIne)+':R'+IntToStr(CurrLine)].Borders[xlEdgeTop].Weight:=xlMedium;
        CurrLine:=CurrLine+1;

        // Штучный товар

        posit:=0;
        all:=0;

        Q.Close;
        Q.SQL.Clear;

        q.sql.add('select                                                      ');
        q.sql.add('  ont.name                                   "ntype",       ');
        q.sql.add('  bookQ.book_mass                            "b_mass",      ');
        q.sql.add('  bookQ.b_base                               "pack",        ');
        q.sql.add('  bookQ.b_dim                                "dim"          ');
        q.sql.add('from                                                        ');
        q.sql.add('  oil_np_type ont,                                          ');
        q.sql.add('  (                                                         ');
        q.sql.add('    select                                                  ');
        q.sql.add('      sum(book.s)                            book_mass,     ');
        q.sql.add('      opp.base_                              b_base,        ');
        q.sql.add('      book.np_type                           np_type,       ');
        q.sql.add('      od.name                                b_dim          ');
        q.sql.add('    from                                                    ');
        q.sql.add('      v_oil_left  book,                                     ');
        q.sql.add('      oil_part  opp,                                        ');
        q.sql.add('      oil_dimension od                                      ');
        q.sql.add('    where                                                   ');
        q.sql.add('      book.date_ < '''+ DateEdit1.Text +''' and     ------- ');
        q.sql.add('      opp.state = ''Y'' and                                 ');
        q.sql.add('      opp.id = book.part_id and                             ');
        q.sql.add('      opp.inst = book.part_inst and                         ');
        q.sql.add('      od.state = ''Y'' and                                  ');
        q.sql.add('      od.id = opp.dim_id   and                              ');
        q.sql.add('      od.id = 19                                            ');
        q.sql.add('    group by                                                ');
        q.sql.add('      opp.base_,book.np_type, od.name                       ');
        q.sql.add('  )  bookQ                                                  ');
        q.sql.add('where                                                       ');
        q.sql.add('  ont.state = ''Y'' and                                     ');
        q.sql.add('  bookQ.np_type = ont.id  and                               ');
        q.sql.add('  bookQ.book_mass > 0                                       ');
        q.sql.add('order by ont.name                                           ');
        q.Open;
        while not q.EOF do
        begin
          npp:=npp+1;
          List.Cells[CurrLine,'B']:=npp ;
          List.Cells[CurrLine,'C']:=q.FieldByName('ntype').asString ;
          List.Cells[CurrLine,'D']:=q.FieldByName('dim').asString;
          List.Cells[CurrLine,'O']:=q.FieldByName('b_mass').asFloat ;

          all:=all+ q.FieldByName('b_mass').asFloat;
          posit:=posit+1;

          List.Range['B'+IntToStr(CurrLine)+':R'+IntToStr(Currline)].Borders.LineStyle:=1;
          List.Range['B'+IntToStr(CurrLIne)+':R'+IntToStr(CurrLine)].Borders.Weight:=xlThin;
          q.next;
          Currline:=CurrLine+1;
          if ProgrForm.PercentDone < 90 then
            ProgrForm.AddProgress(1);
        end;

        List.Cells[CurrLine,'B']:=TranslateText('Всего штучного товара ')+FloatToStr(All)+TranslateText(' шт. ')+IntToStr(Posit)+TranslateText(' поз. описи') ;
        List.Range['B'+IntToStr(CurrLine)+':R'+IntToStr(Currline)].Borders[xlEdgeBottom].LineStyle:=1;
        List.Range['B'+IntToStr(CurrLIne)+':R'+IntToStr(CurrLine)].Borders[xlEdgeBottom].Weight:=xlMedium;
        List.Range['B'+IntToStr(CurrLine)+':R'+IntToStr(Currline)].Borders[xlEdgeTop].LineStyle:=1;
        List.Range['B'+IntToStr(CurrLIne)+':R'+IntToStr(CurrLine)].Borders[xlEdgeTop].Weight:=xlMedium;

      end;

      CurrLIne:=CurrLine+4;

      List.Cells[CurrLine,'B']:=TranslateText('Председатель комисии_______________________________ Члены комисии ')+
                                                  '1._______________________________ '+
                                                  '2._______________________________ '+
                                                  '3._______________________________ '+
                                                  '4._______________________________ ';

      ProgrForm.AddProgress(100);
      // Показать эксель
      XLApp.Visible:=True;
      XLApp.ScreenUpdating := True;
      ProgrForm.Free;
    End
    else
    begin
      ProgrForm.Free;
      ShowMessage(TranslateText('Нет ни одной записи.'));
    end;
  except
    ProgrForm.Free;
  end;
end;

procedure TInvRepForm.repPipeClick (Sender: TObject);
var
  i                               :integer;
Begin
  if not ValidateInfo then Exit;
  try
    Application.CreateForm(TProgrForm, ProgrForm);
    ProgrForm.Show;
    ProgrForm.Refresh;
    GetOrg;
    ProgrForm.AddProgress(3);
    q.close;
    q.SQL.Clear;

    q.SQL.Add('select                                                                     ');
    q.SQL.Add('   orp.*,                                                                  ');
    q.SQL.Add('   op.*,                                                                   ');
    q.SQL.Add('   ont.name as ntype,                                                      ');
    q.SQL.Add('   op.diameter*op.diameter*length_*3.14159265/4000000 as vol,              ');
    q.SQL.Add('   (op.diameter*op.diameter*length_*3.14159265/4000000)*ud_veight as mass, ');
    q.SQL.Add('   oo.name as oname                                                        ');
    q.SQL.Add('from                                                                       ');
    q.SQL.Add('  oil_rests_pipe orp,                                                      ');
    q.SQL.Add('  oil_pipe  op,                                                            ');
    q.SQL.Add('  oil_np_type ont,                                                         ');
    q.SQL.Add('  v_org oo                                                               ');
    q.SQL.Add('where                                                                      ');
    q.SQL.Add('  orp.state = ''Y'' and                                                    ');
    q.SQL.Add('  op.state = ''Y'' and                                                     ');
    q.SQL.Add('  ont.state = ''Y'' and                                                    ');
    q.SQL.Add('  oo.state = ''Y'' and                                                     ');
    q.SQL.Add('  orp.pipe_id = op.id and                                                  ');
    q.SQL.Add('  orp.pipe_inst  = op.inst and                                             ');
    q.SQL.Add('  orp.np_type = ont.id and                                                 ');
    q.SQL.Add('  oo.id = op.org_id and                                                    ');
    q.SQL.Add('  oo.inst = op.org_inst                                                 ');
    q.SQL.Add('  and oo.id = '+IntToStr(org_id));
    q.SQL.Add('  and oo.inst = '+IntToStr(org_inst));
    q.SQL.Add('  and date_ = '''+DateEdit1.Text+'''');
    q.SQL.Add('order by ntype');
    q.Open;
    q.First;
    ProgrForm.AddProgress(5);
    CurrLine:=10;
    // Блок начальных проверок

    If q.Active Then
    If q.RecordCount > 0 Then
    Begin
      // Инициализация Экселя
        if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown))
        then XLApp := GetActiveOleObject('Excel.Application')
        else XLApp := CreateOleObject('Excel.Application');
      ProgrForm.AddProgress(5);
      ProgrForm.AddProgress(5);
      IWorkbook := XLApp.Workbooks.Add(GetMainDir+'pattern\PipeVedRep.xls');
      ProgrForm.AddProgress(5);
      ISheet := IWorkbook.Worksheets.Item['Лист1']; // as Excel8TLB._Worksheet; *NO_TRANSLATE*
      List:=ISheet;
      ProgrForm.AddProgress(5);
      // Заголовок отчета
      List.Cells[2,'B']:=orgQName.AsString;
      List.Cells[3,'B']:=orgQID_NUM.AsString;
      List.Cells[4,'A']:=TranslateText('Ведомость №')+RxCalcEdit1.Text;
      List.Cells[6,'A']:=TranslateText('по состоянию на ')+DateToStr(DateEdit1.Date);
      List.Cells[1,'E']:=DateTimeToStr(GetSystemDate)+' '+Current_Name;
      while not q.EOF do
      begin
        //Собственно тело отчета
        List.Cells[CurrLine,'A']:=q.FieldByName('ntype').asString ;
        List.Cells[CurrLine,'B']:=q.FieldByName('bounds').asString ;
        List.Cells[CurrLine,'C']:=q.FieldByName('DIAMETER').asFloat ;
        List.Cells[CurrLine,'D']:=q.FieldByName('Length_').asFloat ;
        List.Cells[CurrLine,'E']:=q.FieldByName('Vol').asFloat ;
        List.Cells[CurrLine,'F']:=q.FieldByName('ud_Veight').asFloat ;
        List.Cells[CurrLine,'G']:=q.FieldByName('Temperature').asFloat ;
        List.Cells[CurrLine,'H']:=q.FieldByName('Mass').asFloat ;
        List.Range['A'+IntToStr(CurrLine)+':H'+IntToStr(Currline)].Borders.LineStyle:=1;
        List.Range['A'+IntToStr(CurrLIne)+':H'+IntToStr(CurrLine)].Borders.Weight:=xlThin;
        q.next;
        Currline:=CurrLine+1;
        if ProgrForm.PercentDone < 90 then
          ProgrForm.AddProgress(1);
      end;
      // Завершающие строки
      Currline:=CurrLine+1;
      List.Cells[Currline,'A']:= TranslateText('Члены инвентаризационной комиссии');
      for i:=1 to 5 do
      begin
        List.Range['C'+IntToStr(CurrLine)+':F'+IntToStr(Currline)].Borders[xlEdgeBottom].LineStyle:=1;
        List.Range['C'+IntToStr(CurrLIne)+':F'+IntToStr(CurrLine)].Borders[xlEdgeBottom].Weight:=xlThin;
        CurrLine:=Currline+2;
      end;
      List.Cells[Currline,'A']:= TranslateText('Материально ответственное лицо');
      List.Range['C'+IntToStr(CurrLine)+':F'+IntToStr(Currline)].Borders[xlEdgeBottom].LineStyle:=1;
      List.Range['C'+IntToStr(CurrLIne)+':F'+IntToStr(CurrLine)].Borders[xlEdgeBottom].Weight:=xlThin;
      ProgrForm.AddProgress(1);
      // Показать эксель
      XLApp.Visible:=True;
      XLApp.ScreenUpdating := True;
      ProgrForm.AddProgress(100);
      ProgrForm.Free;
    End
    else
    begin
      ProgrForm.Free;
      ShowMessage(TranslateText('Нет ни одной записи.'));
    end;
  except
    ProgrForm.Free;
  end;
end;

procedure TInvRepForm.repUbilClick (Sender: TObject);
var
  day,month,year                   :word;
begin
  if not ValidateInfo then Exit;

  // Блок начальных проверок
  Try
    Application.CreateForm(TProgrForm, ProgrForm);
    ProgrForm.Show;
    ProgrForm.Refresh;
    GetOrg;
    ProgrForm.AddProgress(3);
    DecodeDate(DateEdit1.Date,Year,Month,Day);
    q.SQL.Clear;

    q.SQL.add('select                                                                   ');
    q.SQL.add('  ont.name                                               ntype,          ');
    q.SQL.add('  oro.num                                                rez_num,        ');
    q.SQL.add('  oro.name                                               rez_name,       ');
    q.SQL.add('  ort.name                                               rez_type,       ');
    q.SQL.add('  est.prih_base                                          prih_base,                        ');
    q.SQL.add('  nvl(getubil(1,est.np_type, rez_id,rez_inst, '+IntToStr(month)+' ),0) +                   ');
    q.SQL.add('     nvl(getubil(2,est.np_type, rez_id,rez_inst, '+IntToStr(month)+' ),0)  prih_norm,      ');
    q.SQL.add('  est.prih_ub                                            prih_ub,                          ');
    q.SQL.add('  est.hran_base                                          hran_base,                        ');
    q.SQL.add('  decode(prih_base,0,                                                                      ');
    q.SQL.add('     nvl(getubil(3,est.np_type, rez_id,rez_inst, '+IntToStr(month)+'),0),                  ');
    q.SQL.add('     nvl(getubil(2,est.np_type, rez_id,rez_inst, '+IntToStr(month)+'),0))  hran_norm,      ');
    q.SQL.add('  est.hran_ub                                            hran_ub,                          ');
    q.SQL.add('  est.rash_base                                          rash_base,                        ');
    q.SQL.add('  nvl(getubil(5,est.np_type, rez_id,rez_inst, '+IntToStr(month)+'),0)      rash_norm,      ');
    q.SQL.add('  est.rash_ub                                            rash_ub,        ');
    q.SQL.add('  est.prih_ub+est.hran_ub+est.rash_ub                    total_ub        ');
    q.SQL.add('from                                                                     ');
    q.SQL.add('  oil_np_type                                            ont,            ');
    q.SQL.add('  oil_rezervuar                                          oro,            ');
    q.SQL.add('  oil_rez_types                                          ort,            ');
    q.SQL.add('  (                                                                      ');
    q.SQL.add('  select                                                                 ');
    q.SQL.add('    month_,                                                              ');
    q.SQL.add('    rez_id,                                                              ');
    q.SQL.add('    rez_inst,                                                            ');
    q.SQL.add('    np_type,                                                             ');
    q.SQL.add('    sum(bprih)                                           prih_base,      ');
    q.SQL.add('    sum(uprih)                                           prih_ub,        ');
    q.SQL.add('    sum(bhran)                                           hran_base,      ');
    q.SQL.add('    sum(uhran)                                           hran_ub,        ');
    q.SQL.add('    sum(brash)  rash_base,                                               ');
    q.SQL.add('    sum(urash)  rash_ub                                                  ');
    q.SQL.add('  from                                                                   ');
    q.SQL.add('    (                                                                    ');
    q.SQL.add('    select                                                               ');
    q.SQL.add('      month_,                                                            ');
    q.SQL.add('      rez_id,                                                            ');
    q.SQL.add('      rez_inst,                                                          ');
    q.SQL.add('      np_type,                                                           ');
    q.SQL.add('      ub_basic    bprih,                                                 ');
    q.SQL.add('      ub_mass     uprih,                                                 ');
    q.SQL.add('      0           bhran,                                                 ');
    q.SQL.add('      0           uhran,                                                 ');
    q.SQL.add('      0           brash,                                                 ');
    q.SQL.add('      0           urash                                                  ');
    q.SQL.add('    from                                                                 ');
    q.SQL.add('      oil_ub_month                                                       ');
    q.SQL.add('    where                                                                ');
    q.SQL.add('      state = ''Y'' and                                                    ');
    q.SQL.add('      ub_reason = 1                                                      ');
    q.SQL.add('    union                                                                ');
    q.SQL.add('    select                                                               ');
    q.SQL.add('      month_,                                                            ');
    q.SQL.add('      rez_id,                                                            ');
    q.SQL.add('      rez_inst,                                                          ');
    q.SQL.add('      np_type,                                                           ');
    q.SQL.add('      0           bprih,                                                 ');
    q.SQL.add('      0           uprih,                                                 ');
    q.SQL.add('      ub_basic    bhran,                                                 ');
    q.SQL.add('      ub_mass     uhran,                                                 ');
    q.SQL.add('      0           brash,                                                 ');
    q.SQL.add('      0           urash                                                  ');
    q.SQL.add('    from                                                                 ');
    q.SQL.add('      oil_ub_month                                                       ');
    q.SQL.add('    where                                                                ');
    q.SQL.add('      state = ''Y'' and                                                    ');
    q.SQL.add('      ub_reason = 3                                                      ');
    q.SQL.add('    union                                                                ');
    q.SQL.add('    select                                                               ');
    q.SQL.add('      month_,                                                            ');
    q.SQL.add('      rez_id,                                                            ');
    q.SQL.add('      rez_inst,                                                          ');
    q.SQL.add('      np_type,                                                           ');
    q.SQL.add('      0          bprih,                                                  ');
    q.SQL.add('      0          uprih,                                                  ');
    q.SQL.add('      0          bhran,                                                  ');
    q.SQL.add('      0          uhran,                                                  ');
    q.SQL.add('      ub_basic   brash,                                                  ');
    q.SQL.add('      ub_mass    urash                                                   ');
    q.SQL.add('    from                                                                 ');
    q.SQL.add('      oil_ub_month                                                       ');
    q.SQL.add('    where                                                                ');
    q.SQL.add('      state = ''Y'' and                                                  ');
    q.SQL.add('      ub_reason = 5                                                      ');
    q.SQL.add('    )                                                                    ');
    q.SQL.add('  group by                                                               ');
    q.SQL.add('    month_,                                                              ');
    q.SQL.add('    rez_id,                                                              ');
    q.SQL.add('    rez_inst,                                                            ');
    q.SQL.add('    np_type                                                              ');
    q.SQL.add('  )est                                                                   ');
    q.SQL.add('where                                                                    ');
    q.SQL.add('  ont.state = ''Y'' and                                                  ');
    q.SQL.add('  ont.id = est.np_type and                                               ');
    q.SQL.add('  oro.state = ''Y'' and                                                  ');
    q.SQL.add('  oro.id = est.rez_id and                                                ');
    q.SQL.add('  oro.inst = est.rez_inst and                                            ');
    q.sql.add('  oro.inst_org = '+IntToStr(org_inst)+' and                              ');
    q.SQL.add('  ort.id = oro.UB_KAT and                                                ');
    q.SQL.add('  ort.state = ''Y'' and                                                  ');
    q.SQL.add('  est.month_ = '''+DateToStr(encodeDate(Year,Month,1))+'''               ');
    q.sql.add('order by ont.id, oro.id  ');
    q.open;
    ProgrForm.AddProgress(10);
    If q.Active Then
    If q.RecordCount > 0 Then
    Begin
      // Инициализация Экселя
        if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown))
        then XLApp := GetActiveOleObject('Excel.Application')
        else XLApp := CreateOleObject('Excel.Application');
      ProgrForm.AddProgress(5);
      ProgrForm.AddProgress(5);
      IWorkbook := XLApp.Workbooks.Add(GetMainDir+'pattern\EstUbRep.xls');
      ProgrForm.AddProgress(5);
      ISheet := IWorkbook.Worksheets.Item['Лист1']; // as Excel8TLB._Worksheet; *NO_TRANSLATE*
      List:=ISheet;
      ProgrForm.AddProgress(5);
      Currline:= 12;
      // Заголовочные строки
      List.Cells[2,'A']:=orgQName.AsString;
      List.Cells[3,'B']:=orgQID_NUM.AsString;
      List.Cells[4,'I']:=TranslateText('Расчет №')+RxCalcEdit1.Text;
      List.Cells[7,'A']:=TranslateText('За период с ')+DateToStr(encodeDate(Year,Month,1))+TranslateText(' по ')+
      DateToStr(IncMonth(encodeDate(Year,Month,1),1)-1);
      List.Cells[1,'M']:=DateTimeToStr(GetSystemDate)+' '+Current_Name;
      // Собственно тело отчета
      while not q.eof do
      begin
        List.Cells[CurrLine,'A']:=CurrLine-11;
        List.Cells[CurrLine,'B']:=q.FieldByName('ntype').asString ;
        List.Cells[CurrLine,'C']:='№'+q.FieldByName('rez_num').asString+' '+
          q.FieldByName('rez_name').asString;
        List.Cells[CurrLine,'D']:=q.FieldByName('rez_type').asString ;
        List.Cells[CurrLine,'F']:=q.FieldByName('prih_base').asFloat ;
        if q.FieldByName('prih_base').asFloat <> 0 then
        begin
          List.Cells[CurrLine,'G']:=q.FieldByName('prih_norm').asFloat ;
          List.Cells[CurrLine,'H']:=q.FieldByName('prih_ub').asFloat ;
          List.Cells[CurrLine,'E']:=TranslateText('ЖД');
        end;
        List.Cells[CurrLine,'I']:=q.FieldByName('hran_base').asFloat ;
        if q.FieldByName('hran_base').asFloat <> 0 then
        begin
          List.Cells[CurrLine,'J']:=q.FieldByName('hran_norm').asFloat ;
          List.Cells[CurrLine,'K']:=q.FieldByName('hran_ub').asFloat ;
        end;
        List.Cells[CurrLine,'L']:=q.FieldByName('rash_base').asFloat ;
        if q.FieldByName('rash_base').asFloat <> 0 then
        begin
          List.Cells[CurrLine,'M']:=q.FieldByName('rash_norm').asFloat ;
          List.Cells[CurrLine,'N']:=q.FieldByName('rash_ub').asFloat ;
        end;
        List.Cells[CurrLine,'o']:=q.FieldByName('total_ub').asFloat ;
        List.Range['A'+IntToStr(CurrLine)+':Q'+IntToStr(Currline)].Borders.LineStyle:=1;
        List.Range['A'+IntToStr(CurrLIne)+':Q'+IntToStr(CurrLine)].Borders.Weight:=xlThin;
        q.next;
        Currline:=CurrLine+1;
        if ProgrForm.PercentDone < 90 then
          ProgrForm.AddProgress(1);
      end;
      // Конечные строки отчета

      CurrLine:=Currline+3;
      List.Cells[CurrLine,'B']:= TranslateText('Бухгалтер');
      List.Range['J'+IntToStr(CurrLine)+':K'+IntToStr(Currline)].Merge;
      List.Cells[CurrLine,'J']:= TranslateText('С расчетом ознакомлен (МОЛ)');
      List.Range['D'+IntToStr(CurrLine)+':D'+IntToStr(Currline)].Borders[xlEdgeBottom].LineStyle:=1;
      List.Range['D'+IntToStr(CurrLIne)+':D'+IntToStr(CurrLine)].Borders[xlEdgeBottom].Weight:=xlThin;
      List.Range['F'+IntToStr(CurrLine)+':H'+IntToStr(Currline)].Borders[xlEdgeBottom].LineStyle:=1;
      List.Range['F'+IntToStr(CurrLIne)+':H'+IntToStr(CurrLine)].Borders[xlEdgeBottom].Weight:=xlThin;
      List.Range['L'+IntToStr(CurrLine)+':Q'+IntToStr(Currline)].Borders[xlEdgeBottom].LineStyle:=1;
      List.Range['L'+IntToStr(CurrLIne)+':Q'+IntToStr(CurrLine)].Borders[xlEdgeBottom].Weight:=xlThin;
      // Показать эксель
      XLApp.Visible:=True;
      XLApp.ScreenUpdating := True;
      ProgrForm.Free;
    End
    else
    begin
      ProgrForm.Free;
      ShowMessage(TranslateText('Нет ни одной записи.'));
    end;
  except
    ProgrForm.Free;
  end;
end;

procedure TInvRepForm.repSlichClick (Sender: TObject);
var
  Year,Month,Day :word;
  InvDate,ubDate :TDateTime;
begin
  if not ValidateInfo then Exit;
  DecodeDate(DateEdit1.Date,Year,Month,Day);
  if not((day =1) or
     (MessageDlg(TranslateText('Сличительную ведомость можно создать только на ')+
     TranslateText('первое число выбранного месяца')
     +TranslateText('. Сделать так?'),
        mtWarning, [mbYes, mbNo], 0) = mrYes))
  then
    Exit;
  invDate:=EncodeDate(Year,month,1);
  ubDate:=IncMonth(invDate,-1);
  // Блок начальных проверок
  Try
    Application.CreateForm(TProgrForm, ProgrForm);
    ProgrForm.Show;
    ProgrForm.Refresh;
    GetOrg;
    ProgrForm.AddProgress(3);

    q.SQL.Clear;


    q.SQL.add('select                                                                                  ');
    q.SQL.add('  invent.nt_name                                 nt_name,                               ');
    q.SQL.add('  invent.rez_name                                rez_name,                              ');
    q.SQL.add('  invent.dif                                     invent_dif,                            ');
    q.SQL.add('  estub.esub                                     est_ub,                                ');
    q.SQL.add('  invent.misstake                                meas_misstake,                         ');
    q.SQL.add('  decode(                                                                               ');
    q.SQL.add('    sign(invent.dif +esub+invent.misstake),                                             ');
    q.SQL.add('    -1,                                                                                 ');
    q.SQL.add('    -invent.dif-esub-invent.misstake,                                                   ');
    q.SQL.add('    null)                                        alarm_nedost,                          ');
    q.SQL.add('  decode(                                                                               ');
    q.SQL.add('    sign(invent.dif -invent.misstake),                                                  ');
    q.SQL.add('    1,                                                                                  ');
    q.SQL.add('    invent.dif-invent.misstake,                                                         ');
    q.SQL.add('    null)                                        alarm_izbitok                          ');
    q.SQL.add('from                                                                                    ');
    q.SQL.add('(                                                                                       ');
    q.SQL.add('  select distinct * from (                                                              ');
    q.SQL.add('  select                                                                                ');
    q.SQL.add('    ont.name                                                                 nt_name,   ');
    q.SQL.add('    ont.id                                                                   nt_id,     ');
    q.SQL.add('    ''№''||orr.num||'' ''||orr.name                                          rez_name,  ');
    q.SQL.add('    orr.id                                                                   rez_id,    ');
    q.SQL.add('    orr.inst                                                                 rez_inst,  ');
    q.SQL.add('    decode(                                                                             ');
    q.SQL.add('      sign(nvl((rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                      ');
    q.SQL.add('             - rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)                     ');
    q.SQL.add('             + nvl(pipeq.pipe_vol,0)) * orp.ud_veight,0) - 100),                        ');
    q.SQL.add('      -1,                                                                               ');
    q.SQL.add('      nvl((rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                           ');
    q.SQL.add('        - rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)                          ');
    q.SQL.add('        + nvl(pipeq.pipe_vol,0)) * orp.ud_veight,0)*0.008,                              ');
    q.SQL.add('      nvl((rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                           ');
    q.SQL.add('        - rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)                          ');
    q.SQL.add('        + nvl(pipeq.pipe_vol,0)) * orp.ud_veight,0)*0.005)                   misstake,  ');
    q.SQL.add('    nvl((rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                             ');
    q.SQL.add('        - rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)                          ');
    q.SQL.add('        + nvl(pipeq.pipe_vol,0)) * orp.ud_veight,0) - nvl(bookQ.book_mass,0) dif        ');
    q.SQL.add('  from                                                                                  ');
    q.SQL.add('    oil_np_type ont,                                                                    ');
    q.SQL.add('    oil_rezervuar orr,                                                                  ');
    q.SQL.add('    oil_rests_phys orp,                                                                 ');
    q.SQL.add('    (                                                                                   ');
    q.SQL.add('      select                                                                            ');
    q.SQL.add('        orpp.np_type                                            pipe_type,              ');
    q.SQL.add('        orpp.temperature                                        pipe_temp,              ');
    q.SQL.add('        orpp.ud_veight                                          pipe_udv,               ');
    q.SQL.add('        sum(op.diameter*op.diameter*length_*3.14159265/4000000) pipe_vol                ');
    q.SQL.add('      from                                                                              ');
    q.SQL.add('        oil_rests_pipe orpp,                                                            ');
    q.SQL.add('        oil_pipe  op                                                                    ');
    q.SQL.add('      where                                                                             ');
    q.SQL.add('        orpp.state = ''Y'' and                                                          ');
    q.SQL.add('        op.state = ''Y'' and                                                            ');
    q.SQL.add('        orpp.pipe_id = op.id and                                                        ');
    q.SQL.add('        orpp.pipe_inst  = op.inst and                                                   ');
    q.SQL.add('        orpp.date_ = '''+DateToStr(invDate)+'''     ------------                        ');
    q.SQL.add('      group by                                                                          ');
    q.SQL.add('        orpp.np_type,                                                                   ');
    q.SQL.add('        orpp.temperature,                                                               ');
    q.SQL.add('        orpp.ud_veight                                                                  ');
    q.SQL.add('    ) pipeQ,                                                                            ');
    q.SQL.add('    (                                                                                   ');
    q.SQL.add('      select                                                                            ');
    q.SQL.add('        sum(book.s)                                                book_mass,           ');
    q.SQL.add('        book.rez_id                                                book_rez_id,         ');
    q.SQL.add('        book.rez_inst                                              book_rez_inst,       ');
    q.SQL.add('        book.np_type                                               np_type              ');
    q.SQL.add('      from                                                                              ');
    q.SQL.add('        v_oil_left  book,                                                               ');
    q.SQL.add('        oil_part  opp                                                                   ');
    q.SQL.add('      where                                                                             ');
    q.SQL.add('        book.date_ < '''+DateToStr(invDate)+''' and     ------------                    ');
    q.SQL.add('        opp.state = ''Y'' and                                                           ');
    q.SQL.add('        opp.id = book.part_id and                                                       ');
    q.SQL.add('        opp.inst = book.part_inst and                                                   ');
    q.SQL.add('        opp.dim_id = 2 and                                                              ');
    q.SQL.add('        opp.base_ = 0                                                                   ');
    q.SQL.add('      group by                                                                          ');
    q.SQL.add('        book.rez_id,book.rez_inst,book.np_type                                          ');
    q.SQL.add('      having sum(book.s) > 0                                                            ');
    q.SQL.add('      )bookQ                                                                            ');
    q.SQL.add('  where                                                                                 ');
    q.SQL.add('    ont.state = ''Y'' and                                                               ');
    q.SQL.add('    orr.state = ''Y'' and                                                               ');
    q.SQL.add('    orp.state (+)= ''Y'' and                                                            ');
    q.SQL.add('    bookQ.np_type = ont.id and                                                          ');
    q.SQL.add('    bookQ.book_rez_id = orr.id and                                                      ');
    q.SQL.add('    bookQ.book_rez_inst = orr.inst and                                                  ');
    q.SQL.add('    orp.date_ (+)= '''+DateToStr(invDate)+''' and           ------------                ');
    q.SQL.add('    orr.id_org = '+intToStr(org_id)+' and                   ------------                ');
    q.SQL.add('    orr.inst_org = '+intToStr(org_inst)+' and               ------------                ');
    q.SQL.add('    bookQ.book_rez_id = orp.rez_id(+) and                                               ');
    q.SQL.add('    bookQ.book_rez_inst = orp.rez_inst(+) and                                           ');
    q.SQL.add('    bookQ.np_type = orp.np_type(+) and                                                  ');
    q.SQL.add('    pipe_type (+)= orp.np_type and                                                      ');
    q.SQL.add('    pipe_temp (+)= orp.temperature and                                                  ');
    q.SQL.add('    pipe_udv  (+)= orp.ud_veight                                                        ');
    q.SQL.add('  union select                                                                          ');
    q.SQL.add('    ont.name                                                                 nt_name,   ');
    q.SQL.add('    ont.id                                                                   nt_id,     ');
    q.SQL.add('    ''№''||orr.num||'' ''||orr.name                                          rez_name,  ');
    q.SQL.add('    orr.id                                                                   rez_id,    ');
    q.SQL.add('    orr.inst                                                                 rez_inst,  ');
    q.SQL.add('    decode(                                                                             ');
    q.SQL.add('      sign(nvl((rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                      ');
    q.SQL.add('             - rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)                     ');
    q.SQL.add('             + nvl(pipeq.pipe_vol,0)) * orp.ud_veight,0) - 100),                        ');
    q.SQL.add('      -1,                                                                               ');
    q.SQL.add('      nvl((rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                           ');
    q.SQL.add('        - rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)                          ');
    q.SQL.add('        + nvl(pipeq.pipe_vol,0)) * orp.ud_veight,0)*0.008,                              ');
    q.SQL.add('      nvl((rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                           ');
    q.SQL.add('        - rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)                          ');
    q.SQL.add('        + nvl(pipeq.pipe_vol,0)) * orp.ud_veight,0)*0.005)                   misstake,  ');
    q.SQL.add('    nvl((rez_vzliv (orp.rez_id,orp.rez_inst,orp.all_height)                             ');
    q.SQL.add('      - rez_vzliv (orp.rez_id,orp.rez_inst,orp.water_height)                            ');
    q.SQL.add('      + nvl(pipeq.pipe_vol,0)) * orp.ud_veight,0) - nvl(bookQ.book_mass,0)   dif        ');
    q.SQL.add('  from                                                                                  ');
    q.SQL.add('    oil_np_type ont,                                                                    ');
    q.SQL.add('    oil_rezervuar orr,                                                                  ');
    q.SQL.add('    oil_rests_phys orp,                                                                 ');
    q.SQL.add('    (                                                                                   ');
    q.SQL.add('      select                                                                            ');
    q.SQL.add('        orpp.np_type                                            pipe_type,              ');
    q.SQL.add('        orpp.temperature                                        pipe_temp,              ');
    q.SQL.add('        orpp.ud_veight                                          pipe_udv,               ');
    q.SQL.add('        sum(op.diameter*op.diameter*length_*3.14159265/4000000) pipe_vol                ');
    q.SQL.add('      from                                                                              ');
    q.SQL.add('        oil_rests_pipe orpp,                                                            ');
    q.SQL.add('        oil_pipe  op                                                                    ');
    q.SQL.add('      where                                                                             ');
    q.SQL.add('        orpp.state = ''Y'' and                                                          ');
    q.SQL.add('        op.state = ''Y'' and                                                            ');
    q.SQL.add('        orpp.pipe_id = op.id and                                                        ');
    q.SQL.add('        orpp.pipe_inst  = op.inst and                                                   ');
    q.SQL.add('        orpp.date_ = '''+DateToStr(invDate)+'''     ------------                        ');
    q.SQL.add('      group by                                                                          ');
    q.SQL.add('        orpp.np_type,                                                                   ');
    q.SQL.add('        orpp.temperature,                                                               ');
    q.SQL.add('        orpp.ud_veight                                                                  ');
    q.SQL.add('    ) pipeQ,                                                                            ');
    q.SQL.add('    (                                                                                   ');
    q.SQL.add('      select                                                                            ');
    q.SQL.add('        sum(book.s)                                                book_mass,           ');
    q.SQL.add('        book.rez_id                                                book_rez_id,         ');
    q.SQL.add('        book.rez_inst                                              book_rez_inst,       ');
    q.SQL.add('        book.np_type                                               np_type              ');
    q.SQL.add('      from                                                                              ');
    q.SQL.add('        v_oil_left  book,                                                               ');
    q.SQL.add('        oil_part  opp                                                                   ');
    q.SQL.add('      where                                                                             ');
    q.SQL.add('        book.date_ < to_date('''+DateToStr(invDate)+''') and     ------------           ');
    q.SQL.add('        opp.state = ''Y'' and                                                           ');
    q.SQL.add('        opp.id = book.part_id and                                                       ');
    q.SQL.add('        opp.inst = book.part_inst and                                                   ');
    q.SQL.add('        opp.dim_id = 2 and                                                              ');
    q.SQL.add('        opp.base_ = 0                                                                   ');
    q.SQL.add('      group by                                                                          ');
    q.SQL.add('        book.rez_id,book.rez_inst,book.np_type                                          ');
    q.SQL.add('      having sum(book.s) > 0                                                            ');
    q.SQL.add('    )  bookQ                                                                            ');
    q.SQL.add('  where                                                                                 ');
    q.SQL.add('    ont.state = ''Y'' and                                                               ');
    q.SQL.add('    orr.state = ''Y'' and                                                               ');
    q.SQL.add('    orp.state = ''Y'' and                                                               ');
    q.SQL.add('    orp.np_type = ont.id and                                                            ');
    q.SQL.add('    orp.rez_id = orr.id and                                                             ');
    q.SQL.add('    orp.rez_inst = orr.inst and                                                         ');
    q.SQL.add('    orp.date_ = '''+DateToStr(invDate)+''' and                  ------------            ');
    q.SQL.add('    orr.id_org = '+intToStr(org_id)+' and    ------------                               ');
    q.SQL.add('    orr.inst_org = '+intToStr(org_inst)+'and ------------                               ');
    q.SQL.add('    bookQ.book_rez_id (+)= orp.rez_id and                                               ');
    q.SQL.add('    bookQ.book_rez_inst (+)= orp.rez_inst and                                           ');
    q.SQL.add('    bookQ.np_type (+)= orp.np_type and                                                  ');
    q.SQL.add('    pipe_type (+)= orp.np_type and                                                      ');
    q.SQL.add('    pipe_temp (+)= orp.temperature and                                                  ');
    q.SQL.add('    pipe_udv  (+)= orp.ud_veight                                                        ');
    q.SQL.add('  )                                                                                     ');
    q.SQL.add(')invent,                                                                                ');
    q.SQL.add('(                                                                                       ');
    q.SQL.add('  select                                                                                ');
    q.SQL.add('    ont.id            ontid,                                                            ');
    q.SQL.add('    oro.id            oroid,                                                            ');
    q.SQL.add('    oro.inst          oroinst,                                                          ');
    q.SQL.add('    est.base          esbase,                                                           ');
    q.SQL.add('    est.ub            esub                                                              ');
    q.SQL.add('  from                                                                                  ');
    q.SQL.add('    oil_np_type    ont,                                                                 ');
    q.SQL.add('    oil_rezervuar  oro,                                                                 ');
    q.SQL.add('    oil_rez_types  ort,                                                                 ');
    q.SQL.add('    (                                                                                   ');
    q.SQL.add('    select                                                                              ');
    q.SQL.add('      month_         month_,                                                            ');
    q.SQL.add('      rez_id         rez_id,                                                            ');
    q.SQL.add('      rez_inst       rez_inst,                                                          ');
    q.SQL.add('      np_type        np_type,                                                           ');
    q.SQL.add('      sum(ub_basic)  base,                                                              ');
    q.SQL.add('      sum(ub_mass)   ub                                                                 ');
    q.SQL.add('    from                                                                                ');
    q.SQL.add('      oil_ub_month                                                                      ');
    q.SQL.add('    where                                                                               ');
    q.SQL.add('      state = ''Y''                                                                     ');
    q.SQL.add('    group by                                                                            ');
    q.SQL.add('      month_,                                                                           ');
    q.SQL.add('      rez_id,                                                                           ');
    q.SQL.add('      rez_inst,                                                                         ');
    q.SQL.add('      np_type                                                                           ');
    q.SQL.add('    )est                                                                                ');
    q.SQL.add('  where                                                                                 ');
    q.SQL.add('    ont.state = ''Y'' and                                                               ');
    q.SQL.add('    ont.id = est.np_type and                                                            ');
    q.SQL.add('    oro.state = ''Y'' and                                                               ');
    q.SQL.add('    oro.id = est.rez_id and                                                             ');
    q.SQL.add('    oro.inst = est.rez_inst and                                                         ');
    q.SQL.add('    ort.id = oro.UB_KAT and                                                             ');
    q.SQL.add('    ort.state = ''Y'' and                                                               ');
    q.SQL.add('    est.month_ = '''+DateToStr(ubDate)+'''       ------------                           ');
    q.SQL.add('  )estub                                                                                ');
    q.SQL.add('where                                                                                   ');
    q.SQL.add('  invent.nt_id    = estub.ontid        and                                              ');
    q.SQL.add('  invent.rez_id   = estub.oroid        and                                              ');
    q.SQL.add('  invent.rez_inst = estub.oroinst      and                                              ');
    q.SQL.add('  invent.dif <> 0                                                                       ');

    q.open;
    ProgrForm.AddProgress(10);

    If q.Active Then
    If q.RecordCount > 0 Then
    Begin

      // Инициализация Экселя
        if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown))
        then XLApp := GetActiveOleObject('Excel.Application')
        else XLApp := CreateOleObject('Excel.Application');
      ProgrForm.AddProgress(5);
      ProgrForm.AddProgress(5);
      IWorkbook := XLApp.Workbooks.Add(GetMainDir+'pattern\SlichVedRep.xls');
      ProgrForm.AddProgress(5);
      ISheet := IWorkbook.Worksheets.Item['Лист1']; // as Excel8TLB._Worksheet; *NO_TRANSLATE*
      List:=ISheet;
      ProgrForm.AddProgress(5);
      Currline:= 13;
      // Заголовочные строки
      List.Cells[2,'A']:=orgQName.AsString;
      List.Cells[3,'B']:=orgQID_NUM.AsString;
      List.Cells[3,'F']:=TranslateText('СЛИЧИТЕЛЬНАЯ ВЕДОМОСТЬ №')+RxCalcEdit1.Text;
      List.Cells[4,'D']:=TranslateText('результатов инвентаризации нефтепродуктов на ')+DateToStr(invdate);
      List.Cells[1,'K']:=DateTimeToStr(GetSystemDate)+' '+Current_Name;
      // Собственно тело отчета
      while not q.eof do
      begin
        List.Cells[CurrLine,'A']:=CurrLine-11;
        List.Cells[CurrLine,'B']:=q.FieldByName('nt_name').asString ;
        List.Cells[CurrLine,'C']:='№'+q.FieldByName('rez_name').asString;
        List.Cells[CurrLine,'F']:=q.FieldByName('invent_dif').asFloat ;
        List.Cells[CurrLine,'H']:=q.FieldByName('est_ub').asFloat ;
        List.Cells[CurrLine,'J']:=q.FieldByName('meas_misstake').asFloat ;
        List.Cells[CurrLine,'L']:=q.FieldByName('alarm_nedost').asFloat ;
        List.Cells[CurrLine,'N']:=q.FieldByName('alarm_izbitok').asFloat ;

        List.Range['A'+IntToStr(CurrLine)+':O'+IntToStr(Currline)].Borders.LineStyle:=1;
        List.Range['A'+IntToStr(CurrLIne)+':O'+IntToStr(CurrLine)].Borders.Weight:=xlThin;
        q.next;
        Currline:=CurrLine+1;
        if ProgrForm.PercentDone < 90 then
          ProgrForm.AddProgress(1);
      end;
      // Конечные строки отчета

      CurrLine:=Currline+3;
      List.Cells[CurrLine,'B']:= TranslateText('Бухгалтер');
      List.Range['C'+IntToStr(CurrLine)+':E'+IntToStr(Currline)].Borders[xlEdgeBottom].LineStyle:=1;
      List.Range['C'+IntToStr(CurrLIne)+':E'+IntToStr(CurrLine)].Borders[xlEdgeBottom].Weight:=xlThin;


      List.Range['G'+IntToStr(CurrLine)+':I'+IntToStr(Currline)].Merge;
      List.Cells[CurrLine,'G']:= TranslateText('С Результатами сличения ознакомлен (МОЛ)');

      List.Range['J'+IntToStr(CurrLine)+':O'+IntToStr(Currline)].Borders[xlEdgeBottom].LineStyle:=1;
      List.Range['J'+IntToStr(CurrLIne)+':O'+IntToStr(CurrLine)].Borders[xlEdgeBottom].Weight:=xlThin;
      List.Range['G'+IntToStr(CurrLine+3)+':O'+IntToStr(Currline+3)].Borders[xlEdgeBottom].LineStyle:=1;
      List.Range['G'+IntToStr(CurrLIne+3)+':O'+IntToStr(CurrLine+3)].Borders[xlEdgeBottom].Weight:=xlThin;
      // Показать эксель
      XLApp.Visible:=True;
      XLApp.ScreenUpdating := True;
      ProgrForm.Free;
    End
    else
    begin
      ProgrForm.Free;
      ShowMessage(TranslateText('Нет ни одной записи.'));
    end;
  except
    ProgrForm.Free;
  end;
end;


procedure TInvRepForm.edFromButtonClick(Sender: TObject);
var vId,vInst:integer;
    vName:string;
begin
  if ChooseOrg.CaptureOrg(1,Main_id,Inst,'yyy',vId,vInst,vName) then
  begin
    edFrom.Text:=vName;
    org_id:=vId;
    org_inst:=vInst;
    //GetRezList;
  end;
end;

procedure TInvRepForm.GetOrg;
begin
  OrgQ.Close;
  OrgQ.ParamByName('id').asInteger:=org_id;
  OrgQ.ParamByName('inst').asInteger:=org_inst;
  OrgQ.Open;
end;

function TInvRepForm.ValidateInfo:boolean;
var
  ret:boolean;
begin
  ret:=true;
  if not RxCalcEdit1.Visible then
    RxCalcEdit1.Value:=1;
  if not DateEdit2.Visible then
    DateEdit2.Date:=EncodeDate(2050,1,1);
  if RxCalcEdit1.Value <= 0 then
  begin
    ShowMessage(TranslateText('Поле "Номер отчета" обзательно должно быть заполнено.'));
    ValidateInfo:=false;
    Exit;
  end;
  if DateEdit1.Date = 0 then
  begin
    ShowMessage(TranslateText('Поле "')+Label3.Caption+TranslateText('" обзательно должно быть заполнено.'));
    ValidateInfo:=false;
    Exit;
  end;
  if DateEdit2.Date = 0 then
  begin
    ShowMessage(TranslateText('Поле "Дата конечная" обзательно должно быть заполнено.'));
    ValidateInfo:=false;
    Exit;
  end;
  if (DateEdit1.Date > DateEdit2.Date) and DateEdit2.Visible then
   begin
    ShowMessage(TranslateText('Начальная дата не может быть больше конечной.'));
    ValidateInfo:=false;
    Exit;
  end;
  ValidateInfo := ret;
end;

end.
