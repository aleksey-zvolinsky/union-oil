unit uCardRequest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  EditBase, Db, MemDS, DBAccess, Ora, uOilQuery, StdCtrls, Buttons,
  ExtCtrls, Grids, DBGridEh, ToolEdit, Mask, DBTables, MemTable,
  uCardBlank, ActnList, CurrEdit{$IFDEF VER150},Variants, DBGridEhGrouping,
  GridsEh{$ENDIF};
type
  TCardRequestType=(crNull,crRequest,crRefuel,crDog);

  TCardRequestPrint = class
  private
    FNumber:string;
    FDate:TDateTime;
    FOrgId,FOrgInst,FDogID,FDogINST:integer;
    FType:TCardRequestType;
    qReport,qRequest:TOilQuery;
  public
    property Number:string read FNumber write FNumber;
    property Date:TDateTime read FDate write FDate;
    property OrgId:integer read FOrgId write FOrgId;
    property OrgInst:integer read FOrgInst write FOrgInst;
    property DogID:integer read FDogID write FDogID;
    property DogInst:integer read FDogINST write FDogINST;
    property RequestType:TCardRequestType read FType write FType;
    //--
    procedure Print;overload;
    class procedure Print(AqReport,AqRequest:TOilQuery;
      ANumber:string;
      ADate:TDateTime;
      AOrgId,AOrgInst:integer;
      AType:TCardRequestType);overload;
    class procedure Print(AqReport, AqRequest: TOilQuery;
      ADogID, ADogINST: integer;
      AType: TCardRequestType;
      ANumber: string;
      ADate: TDateTime;
      AOrgId, AOrgInst: integer); overload;
    //--
    constructor Create(AqReport,AqRequest:TOilQuery);overload;
  end;
    
  TCardRequestForm = class(TEditBaseForm)
    DbGrid: TDBGridEh;
    pTop: TPanel;
    Label10: TLabel;
    sbAuto: TSpeedButton;
    LblDate_: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    eDocNumber: TEdit;
    deDate_: TDateEdit;
    ceFrom: TComboEdit;
    ceTo: TComboEdit;
    ceBlank: TComboEdit;
    ceDog: TComboEdit;
    deDogDate: TDateEdit;
    dsDetail: TDataSource;
    mtDetail: TMemoryTable;
    mtCopy: TMemoryTable;
    Label6: TLabel;
    deBlankDate: TDateEdit;
    mtDetailID: TFloatField;
    mtDetailINST: TFloatField;
    mtDetailCARD_NUMBER: TFloatField;
    mtDetailPRICE: TFloatField;
    mtDetailLITR: TFloatField;
    mtDetailNP_GROUP_ID: TFloatField;
    mtDetailNP_GROUP_NAME: TStringField;
    mtDetailLOCAL_ID: TIntegerField;
    mtDetailSUM: TFloatField;
    mtCopyID: TFloatField;
    mtCopyINST: TFloatField;
    mtCopyCARD_NUMBER: TFloatField;
    mtCopyPRICE: TFloatField;
    mtCopyLITR: TFloatField;
    mtCopyNP_GROUP_ID: TFloatField;
    mtCopyNP_GROUP_NAME: TStringField;
    mtCopyLOCAL_ID: TIntegerField;
    ActionList: TActionList;
    actDeleteRecord: TAction;
    sbDel: TSpeedButton;
    mtDetailCREATE_BLANK_OUT: TIntegerField;
    mtCopyCREATE_BLANK_OUT: TIntegerField;
    ceBlankPrice: TCurrencyEdit;
    sbAutoDog: TSpeedButton;
    sbAutoBlank: TSpeedButton;
    qDogAuto: TOilQuery;
    qTestDog: TOilQuery;
    qRequest: TOilQuery;
    qReport: TOilQuery;
    procedure mtDetailBeforeDelete(DataSet: TDataSet);
    procedure mtDetailAfterDelete(DataSet: TDataSet);
    procedure mtDetailAfterPost(DataSet: TDataSet);
    procedure ceDogButtonClick(Sender: TObject);
    procedure sbAutoClick(Sender: TObject);
    procedure ceFromButtonClick(Sender: TObject);
    procedure ceToButtonClick(Sender: TObject);
    procedure DbGridColumns3EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure mtDetailCalcFields(DataSet: TDataSet);
    procedure mtDetailBeforePost(DataSet: TDataSet);
    (** Присваивает вид действия *)
    procedure AfterAction(DataSet: TDataSet);
    procedure ceBlankButtonClick(Sender: TObject);
    procedure actDeleteRecordExecute(Sender: TObject);
    procedure ceBlankChange(Sender: TObject);
    procedure sbAutoBlankClick(Sender: TObject);
    procedure sbAutoDogClick(Sender: TObject);
    procedure ceDogChange(Sender: TObject);
    procedure dsDetailDataChange(Sender: TObject; Field: TField);
    procedure ceDogKeyPress(Sender: TObject; var Key: Char);
  private
    FFromId,FFromInst,//от кого
    FToId,FToInst:integer;//кому
    FDogId,FDogInst:Variant;//договор
    FBlankId,FBlankInst:Variant;//бланки
    mtDetailState:TDataSetState;
    Sequence:TSequence;
    procedure TestRecord();
    procedure SetAutoNumber(AAutoButton:TSpeedButton;ANumberEdit:TControl);
    procedure ClearBlank();
    function GetBlankPrice:Currency;
  public
    procedure Save();override;
    procedure Test();override;
    procedure Init();override;
    procedure PrintReport(AReportNumber:integer); override;
  end;

var
  CardRequestForm: TCardRequestForm;

implementation
uses
  ChooseOrg, uDbFunc, ExFunc, uCommonForm, Dog, DogRef, UXMLForm, MoneyFunc,
  Progr, OilStd, Excel_TLB, Main, PrihCardRef;

{$R *.DFM}
//------------------------------------------------------------------------------
//-------------------------TCardRequestPrint------------------------------------
//------------------------------------------------------------------------------
class procedure TCardRequestPrint.Print(AqReport,AqRequest:TOilQuery;
  ANumber:string;
  ADate:TDateTime;
  AOrgId,AOrgInst:integer;
  AType:TCardRequestType);
var
  rp:TCardRequestPrint;
begin
  rp:=TCardRequestPrint.Create(AqReport,AqRequest);
  try
    rp.FNumber:=ANumber;
    rp.FDate:=ADate;
    rp.FOrgId:=AOrgId;
    rp.FOrgInst:=AOrgInst;
    rp.FType:=AType;
    rp.Print;
  finally
    rp.Free;
  end;
end;
//------------------------------------------------------------------------------
class procedure TCardRequestPrint.Print(AqReport, AqRequest: TOilQuery;
  ADogID, ADogINST: integer;
  AType: TCardRequestType;
  ANumber: string;
  ADate: TDateTime;
  AOrgId, AOrgInst: integer);
var
  rp: TCardRequestPrint;
begin
  rp := TCardRequestPrint.Create(AqReport, AqRequest);
  try
    rp.FDogID   := ADogID;
    rp.FDogINST := ADogINST;
    rp.FType    := AType;
    rp.FNumber  := ANumber;
    rp.FDate    := ADate;
    rp.FOrgId   := AOrgId;
    rp.FOrgInst := AOrgInst;
    rp.Print;
  finally
    rp.Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TCardRequestPrint.Print;
var
  ProgressBar:TProgrForm;
  i, Sum:integer;
  s, CurCard, ShareName: String;
  cn, CardCount, CurPos, RangePos: Integer;
  SumNDS, DeltaNDS, DeltaSumNDS, DeltaSumXNDS: Double;
  qWork:TOilQuery;
begin
  ProgressBar:=TProgrForm.CreateBar(nil);
  ProgressBar.Progress := 0;
  ProgressBar.Show;
  ProgressBar.Repaint;
  
  try
    ActivateXLApp('CardRec', 'CardRec', 1, MSExcel, List);
    qReport.Close;
    _OpenQueryPar(qReport,
      ['OrgId',OrgId,
       'OrgInst',OrgInst]);

       List.Cells[1, 'A'].Value := LangText('Prilozhenie')+' № ' + Number
      + ' '+LangText('Ot')+' ' + FormatDateTime('dd.mm.yyyy', Date)
      + ' '+LangText('god')+'. '+LangText('k')+TranslateText(' Договору № ')
      + qReport.FieldByName('Dog').AsString + ' '+LangText('Ot')+' '
      + FormatDateTime('dd.mm.yyyy', qReport.FieldByName('Dog_Date').AsDateTime)
      + ' '+LangText('k')+'.';

    if qReport.FieldByName('To_Face').AsInteger = 1 then
    begin
      List.Cells[4, 'A'].Value := LangText('FIO');
      List.Cells[4, 'G'].Value := qReport.FieldByName('To_Name').AsString;
      List.Cells[5, 'A'].Value := LangText('Adr');
      List.Cells[5, 'G'].Value := qReport.FieldByName('To_Addr').AsString;
      List.Cells[6, 'A'].Value := LangText('NalNum');
      List.Cells[6, 'G'].Value := qReport.FieldByName('To_OKPO').AsString;
      List.Cells[7, 'A'].Value := TranslateText('Паспорт');
      List.Cells[7, 'G'].Value := LangText('seria')+' ' + qReport.FieldByName('Passp_Ser').AsString + ' № ' + qReport.FieldByName('Passp_Num').AsString;
      List.Cells[8, 'A'].Value := LangText('Vudan');
      List.Cells[8, 'G'].Value := qReport.FieldByName('Passp_When').AsString + ' ' + qReport.FieldByName('Passp_Whom').AsString;
    end
    else
    begin
      List.Cells[4, 'A'].Value := LangText('Nazvanie_firmi');
      List.Cells[4, 'G'].Value := qReport.FieldByName('To_Name').AsString;
      List.Cells[5, 'A'].Value := LangText('Adr');
      List.Cells[5, 'G'].Value := qReport.FieldByName('To_Addr').asString;
      List.Cells[6, 'A'].Value := TranslateText('Код ')+LangText('EDRPOU');
      List.Cells[6, 'G'].Value := qReport.FieldByName('To_OKPO').AsString;
      List.Cells[7, 'A'].Value := LangText('Raschetnij_schet');
      List.Cells[7, 'G'].Value := qReport.FieldByName('To_Rach_Chet').AsString;
      List.Cells[8, 'A'].Value := LangText('Nazva')+TranslateText(' банка / МФО банка');
      List.Cells[8, 'G'].Value := qReport.FieldByName('To_Bank_Name').AsString + ' / ' + qReport.FieldByName('To_MFO').AsString;
      List.Cells[9, 'A'].Value := LangText('INN')+' '+LangText('platelschika')+LangText('NDS');
      List.Cells[9, 'G'].Value := qReport.FieldByName('To_Nal_Num').AsString;
      List.Cells[10, 'A'].Value := TranslateText('Номер ')+LangText('svidetelstva')+TranslateText(' по ')+LangText('NDS');
      List.Cells[10, 'G'].Value := qReport.FieldByName('To_Svid_Num').AsString;
    end;
    case RequestType of
      crRefuel:
        Sum:=nvl(GetSqlValueParSimple('  select sum(dd.count_) '
          +'  from oil_dog d, oil_dog_detail dd, oil_rash_nak rn '
          +' where d.id = rn.source_id (+) and d.inst=rn.source_inst(+) and rn.state=''Y'' '
          +'   and d.id = dd.dog_id (+) and d.inst = dd.dog_inst   (+) '
          +'   and d.state = ''Y'' and dd.state (+) = ''Y'' and  dd.np_type(+) = 455 '
          +'   and rn.var_date = :var_date '
          +'   and d.to_ = :to_id and  d.to_inst = :to_inst '
          +' group by rn.var_date ',
          ['var_date',Date,
           'to_id',OrgId,
           'to_inst',OrgInst]),0);
      crRequest,crDog:
        Sum:=nvl(GetSqlValueParSimple(
          'select nvl(sum(count_),0) as count_' +
          '  from (select 1 as count_' +
          '          from oil_rash_nak rn, card_blank b, card_blank_det bd' +
          '         where rn.state=''Y'' and b.state=''Y'' and bd.state=''Y'''+
          '           and rash_nak_type = 4' +
          '           and rn.source_id = b.id' +
          '           and rn.source_inst = b.inst' +
          '           and b.id = bd.head_id' +
          '           and b.inst = bd.head_inst' +
          '           and b.dog_id = :dog_id' +
          '           and b.dog_inst = :dog_inst' +
          '        union all' +
          '        select dd.count_ as count_' +
          '          from oil_rash_nak rn, oil_dog d, oil_dog_detail dd' +
          '         where rn.state=''Y'' and d.state=''Y'' and dd.state=''Y'''+
          '           and rash_nak_type = 1' +
          '           and rn.source_id = d.id' +
          '           and rn.source_inst = d.inst' +
          '           and d.id = dd.dog_id' + 
          '           and d.inst = dd.dog_inst' +
          '           and dd.np_type = 455' +
          '           and d.id = :dog_id' +
          '           and d.inst = :dog_inst)',
          ['dog_id', DogId,
           'dog_inst', DogInst]),0);
      crNull:
        raise Exception.Create(TranslateText('Не определен тип заявки'));
    end;
    if Sum=0 then
      s := '0'
    else
      s := NumStrGrn(Sum, '', '');
    s:=Copy(s,1,Pos(TranslateText('грн'), s)-1);
    List.Cells[12, 'C'].Value := Sum;
    List.Cells[12, 'L'].Value := s + TranslateText(' шт.');

    qRequest.Close;
    // очищаємо параметри
    for i := 0 to qRequest.Params.Count - 1 do
      qRequest.Params[i].Value := Null;
    // вставляємо параметри
    if FType = crDog then
    begin
      qRequest.ParamByName('DocNum').AsString := '';
      qRequest.ParamByName('DocDate').AsDate := 0;
      qRequest.ParamByName('OrgId').AsInteger := 0;
      qRequest.ParamByName('OrgInst').AsInteger := 0;

      qRequest.ParamByName('dog_Id').AsInteger := DogId;
      qRequest.ParamByName('dog_Inst').AsInteger := DogInst;
    end
    else
    begin
      qRequest.ParamByName('DocNum').AsString := Number;
      qRequest.ParamByName('DocDate').AsDate := Date;
      qRequest.ParamByName('OrgId').AsInteger := OrgId;
      qRequest.ParamByName('OrgInst').AsInteger := OrgInst;
    end;
    _OpenQuery(qRequest);

    if qRequest.IsEmpty then
      raise Exception.Create(TranslateText('За этот день не обнаружено ни одного пополнения!'));

    Range := VarArrayCreate([1, qRequest.RecordCount + 3, 1, 14], varVariant);

    RangePos := 0;
    CurPos := 15;
    SumNDS := 0;
    while not qRequest.Eof do
    begin
      SumNDS := SumNDS + qRequest.FieldByName('SumNDS').AsFloat;
      Inc(RangePos);
      Range[RangePos, 1] := qRequest.FieldByName('NP_Name').AsString;
      Range[RangePos, 4] := MRound(qRequest.FieldByName('Litr').AsFloat, 3);
      Range[RangePos, 10] := MRound(GetNoNDS_WithNds(qRequest.FieldByName('Price').AsFloat,Date), 4);//Без ндс
      Range[RangePos, 14] := MRound(GetNoNDS_WithNds(qRequest.FieldByName('SumNDS').AsFloat, Date), 2);
      qRequest.Next;
    end;

    Inc(RangePos);
    Range[RangePos, 1] := LangText('Itogo')+LangText('Baz_NDS');
    Range[RangePos, 14] := MRound(GetNoNds_WithNds(SumNDS,Date), 2);

    Inc(RangePos);
    Range[RangePos, 1] := LangText('NDS');
    Range[RangePos, 14] := MRound(GetNds_WithNds(SumNDS,Date), 2);

    Inc(RangePos);
    Range[RangePos, 1] := LangText('Vsego')+LangText('S_NDS');
    Range[RangePos, 14] := MRound(SumNDS, 2);

    List.Range['A' + IntToStr(CurPos - 1) + ':N' + IntToStr(CurPos - 1)].AutoFill(List.Range['A' + IntToStr(CurPos - 1) + ':N' + IntToStr(CurPos + RangePos - 1)], xlFillDefault);

    List.Range['A' + IntToStr(CurPos) + ':N' + IntToStr(CurPos + RangePos - 1)].HorizontalAlignment := xlGeneral;
    List.Range['B'  + IntToStr(CurPos + RangePos - 3)+ ':M' + IntToStr(CurPos + RangePos - 1)].HorizontalAlignment := xlHAlignCenter;

    List.Rows[IntToStr(CurPos)+ ':' + IntToStr(CurPos + RangePos - 1)].Font.Bold := False;

    List.Range['B' + IntToStr(CurPos) + ':B' + IntToStr(CurPos + RangePos - 1)].NumberFormat := '0,000';
    List.Range['J' + IntToStr(CurPos) + ':J' + IntToStr(CurPos + RangePos - 1)].NumberFormat := '0,0000';
    List.Range['N' + IntToStr(CurPos) + ':N' + IntToStr(CurPos + RangePos - 1)].NumberFormat := '0,00';

    List.Range['A' + IntToStr(CurPos) + ':N' + IntToStr(CurPos + RangePos - 1)].Value := Range;
    List.Range['B'  + IntToStr(CurPos + RangePos - 3)+ ':M' + IntToStr(CurPos + RangePos - 1)].Value := 'Х';

    Inc(CurPos, RangePos + 1);
    List.Rows[CurPos - 1].RowHeight := 6;
    List.Cells[CurPos, 'A'].Value := LangText('V_tom_chisle');
    List.Rows[CurPos].Font.Bold := True;
    List.Rows[CurPos + 1].RowHeight := 6;
    Inc(CurPos, 2);

    DeltaNDS := MRound(GetNds_WithNds(SumNDS,Date), 2);
    DeltaSumNDS := MRound(SumNDS, 2);
    DeltaSumXNDS := MRound(GetNoNds_WithNds(SumNDS,Date), 2);

    ProgressBar.AddProgress(5);

    s := '';

    CardCount := 0;

    qRequest.Close;
    // очищаємо параметри
    for i := 0 to qRequest.Params.Count - 1 do
      qRequest.Params[i].Value := Null;
    // вставляємо параметри
    qRequest.ParamByName('PrintCard').AsString := 'Y';
    if FType = crDog then
    begin
      qRequest.ParamByName('DocNum').AsString := '';
      qRequest.ParamByName('DocDate').AsDate := 0;
      qRequest.ParamByName('OrgId').AsInteger := 0;
      qRequest.ParamByName('OrgInst').AsInteger := 0;

      qRequest.ParamByName('dog_Id').AsInteger := DogId;
      qRequest.ParamByName('dog_Inst').AsInteger := DogInst;
    end
    else
    begin
      qRequest.ParamByName('DocNum').AsString := Number;
      qRequest.ParamByName('DocDate').AsDate := Date;
      qRequest.ParamByName('OrgId').AsInteger := OrgId;
      qRequest.ParamByName('OrgInst').AsInteger := OrgInst;
    end;
    _OpenQuery(qRequest);

    CurCard := qRequest.FieldByName('Card_Number').AsString;

    while not qRequest.Eof do
    begin
      RangePos := 0;

      Range[1, 1] := Langtext('Nomer_karti');
      Range[1, 2] := 0;
      for cn := 1 to 3 do Range[1, cn + 2] := qRequest.FieldByName('Card_Number').AsString[cn];
      Range[1, 6] := null;
      for cn := 4 to 10 do Range[1, cn + 3] := qRequest.FieldByName('Card_Number').AsString[cn];

      List.Rows[CurPos].Font.Bold := True;
      List.Range['A'  + IntToStr(CurPos)+ ':L' + IntToStr(CurPos)].Borders.LineStyle := xlContinuous;
      List.Range['A'  + IntToStr(CurPos)+ ':L' + IntToStr(CurPos)].HorizontalAlignment := xlHAlignCenter;
      List.Range['A'  + IntToStr(CurPos)+ ':L' + IntToStr(CurPos)].Value := Range;
      List.Cells[CurPos, 'F'].Interior.ColorIndex := 15;
      List.Rows[CurPos + 1].RowHeight := 4;
      Inc(CurPos, 2);

      List.Range['A' + IntToStr(CurPos) + ':C' + IntToStr(CurPos)].Merge;
      List.Range['D' + IntToStr(CurPos) + ':I' + IntToStr(CurPos)].Merge;
      List.Range['J' + IntToStr(CurPos) + ':M' + IntToStr(CurPos)].Merge;
      List.Range['A'  + IntToStr(CurPos)+ ':O' + IntToStr(CurPos)].Borders.LineStyle := xlContinuous;

      Inc(CurPos);

      SumNDS := 0;
      s := '';

      while (not qRequest.Eof)and(CurCard = qRequest.FieldByName('Card_Number').AsString) do
      begin
        SumNDS := SumNDS + qRequest.FieldByName('SumNDS').AsFloat;
        Inc(RangePos);
        Range[RangePos, 1] := qRequest.FieldByName('NP_Name').AsString;
        Range[RangePos, 4] := MRound(qRequest.FieldByName('Litr').AsFloat, 3);
        Range[RangePos, 10] := MRound(GetNoNds_WithNds(qRequest.FieldByName('Price').AsFloat,Date), 4);
        Range[RangePos, 14] := MRound(GetNoNds_WithNds(qRequest.FieldByName('SumNDS').AsFloat,Date), 2);
        qRequest.Next;
      end;

      DeltaNDS := DeltaNDS - MRound(GetNds_WithNds(SumNDS,Date), 2);
      DeltaSumNDS := DeltaSumNDS - MRound(SumNDS, 2);
      DeltaSumXNDS := DeltaSumXNDS - MRound(GetNoNds_WithNds(SumNDS,Date), 2);

      Inc(RangePos);
      Range[RangePos, 1] := LangText('Itogo')+LangText('Baz_NDS');
      if qRequest.Eof
       then Range[RangePos, 14] := MRound(GetNoNds_WithNds(SumNDS,Date) + DeltaSumXNDS, 2)
       else Range[RangePos, 14] := MRound(GetNoNds_WithNds(SumNDS,Date), 2);

      Inc(RangePos);
      Range[RangePos, 1] := LangText('NDS');
      if qRequest.Eof
       then Range[RangePos, 14] := MRound(GetNds_WithNds(SumNDS,Date) + DeltaNDS, 2)
       else Range[RangePos, 14] := MRound(GetNds_WithNds(SumNDS,Date), 2);

      Inc(RangePos);
      Range[RangePos, 1] := LangText('Vsego')+LangText('S_NDS');
      if qRequest.Eof
       then Range[RangePos, 14] := MRound(SumNDS + DeltaSumNDS, 2)
       else Range[RangePos, 14] := MRound(SumNDS, 2);

      List.Range['A' + IntToStr(CurPos - 1) + ':O' + IntToStr(CurPos - 1)].AutoFill(List.Range['A' + IntToStr(CurPos - 1) + ':O' + IntToStr(CurPos + RangePos - 1)], xlFillDefault);

      List.Cells[CurPos - 1, 'A'].Value := LangText('Vid_nefteprodyktov');
      List.Cells[CurPos - 1, 'D'].Value := LangText('Kolichestvo')+TranslateText(' (л)');
      List.Cells[CurPos - 1, 'J'].Value := LangText('Tsena')+LangText('Baz_NDS')+TranslateText('(грн.)');
      List.Cells[CurPos - 1, 'N'].Value := LangText('Sum')+LangText('Baz_NDS')+TranslateText('(грн.)');
      List.Cells[CurPos - 1, 'O'].Value := LangText('Dnevnoj_limit')+TranslateText(' (л)');

      List.Range['A'  + IntToStr(CurPos - 1)+ ':O' + IntToStr(CurPos - 1)].HorizontalAlignment := xlHAlignCenter;
      List.Range['B'  + IntToStr(CurPos + RangePos - 3)+ ':M' + IntToStr(CurPos + RangePos - 1)].HorizontalAlignment := xlHAlignCenter;
      List.Range['O' + IntToStr(CurPos - 1) + ':O' + IntToStr(CurPos + RangePos - 1)].HorizontalAlignment := xlHAlignCenter;

      List.Rows[IntToStr(CurPos - 1)].Font.Bold := True;

      List.Range['B' + IntToStr(CurPos) + ':B' + IntToStr(CurPos + RangePos - 1)].NumberFormat := '0,000';
      List.Range['J' + IntToStr(CurPos) + ':J' + IntToStr(CurPos + RangePos - 1)].NumberFormat := '0,0000';
      List.Range['N' + IntToStr(CurPos) + ':N' + IntToStr(CurPos + RangePos - 1)].NumberFormat := '0,00';

      List.Range['A' + IntToStr(CurPos) + ':O' + IntToStr(CurPos + RangePos - 1)].Value := Range;
      List.Range['B'  + IntToStr(CurPos + RangePos - 3)+ ':M' + IntToStr(CurPos + RangePos - 1)].Value := 'Х';
      List.Range['O' + IntToStr(CurPos) + ':O' + IntToStr(CurPos + RangePos - 1)].Value := 'Х';

      Inc(CurPos, RangePos + 1);
      Inc(CardCount);

      CurCard := qRequest.FieldByName('Card_Number').AsString;

      if (qRequest.Eof)or(CardCount = 4)or((CardCount > 4)and((CardCount - 4) mod 7 = 0)) then
      begin
        List.Cells[CurPos - 1, 'A'].Value := LangText('Prod_and_Pokup_vlad_inform1');
        List.Cells[CurPos - 1, 'A'].Font.Size := 9;
        Inc(CurPos);
        List.Cells[CurPos - 1, 'A'].Value := LangText('Prod_and_Pokup_vlad_inform2');
        List.Cells[CurPos - 1, 'A'].Font.Size := 9;
        Inc(CurPos);
        List.Cells[CurPos - 1, 'A'].Value := LangText('Prod_and_Pokup_soglasnie');
        List.Cells[CurPos - 1, 'A'].Font.Size := 9;
        Inc(CurPos);

        List.Cells[CurPos, 'C'].Value := LangText('Prodavets');
        List.Cells[CurPos, 'N'].Value := LangText('Pokypatel');
        List.Rows[CurPos].Font.Bold := True;
        Inc(CurPos, 2);

        if (PRINT_RN_FILIAL_CT = 'Y') and (GENERATION = 1) then
        begin
          qWork:=TOilQuery.Create(nil);
          try
            GetOrgData(qWork,MAIN_PAR,MAIN_PAR_INST);
            List.Cells[CurPos, 'A'].Value := qWork.fieldbyname('Name').AsString;

            List.Cells[CurPos + 1, 'A'].RowHeight := 24;
            List.Range['A' + IntToStr(CurPos + 1) + ':J' + IntToStr(CurPos + 1)].Merge;
            List.Range['A' + IntToStr(CurPos + 1) + ':J' + IntToStr(CurPos + 1)].VerticalAlignment := xlCenter;
            List.Cells[CurPos + 1, 'A'].WrapTExt:= True;
            List.Cells[CurPos + 1, 'A'].Value := LangText('Adr')+' ' + qWork.FieldByName('Addr').AsString;

            List.Cells[CurPos + 2, 'A'].Value := LangText('R/s')+' ' + qWork.FieldByName('Rach_Chet').AsString;
            List.Cells[CurPos + 3, 'A'].Value := TranslateText('в ') + qWork.FieldByName('Bank_Name').AsString;
            List.Cells[CurPos + 4, 'A'].Value := TranslateText('МФО ') + qWork.FieldByName('MFO').AsString;
            List.Cells[CurPos + 5, 'A'].Value := TranslateText('Код ')+LangText('EDRPOU') + qWork.FieldByName('Id_Num').AsString;
            List.Cells[CurPos + 6, 'A'].Value := LangText('INN')+' ' + qWork.FieldByName('Nal_Num').AsString;
            List.Cells[CurPos + 7, 'A'].Value := LangText('SvidPlatNDC');
            List.Cells[CurPos + 8, 'A'].Value := ' № ' + qWork.FieldByName('Svid_Num').AsString;
          finally
            qWork.Free;
          end;
        end
        else
        begin
          List.Cells[CurPos, 'A'].Value := qReport.FieldByName('From_Name').AsString;

          List.Cells[CurPos + 1, 'A'].RowHeight := 24;
          List.Range['A' + IntToStr(CurPos + 1) + ':J' + IntToStr(CurPos + 1)].Merge;
          List.Range['A' + IntToStr(CurPos + 1) + ':J' + IntToStr(CurPos + 1)].VerticalAlignment := xlCenter;
          List.Cells[CurPos + 1, 'A'].WrapTExt:= True;
          List.Cells[CurPos + 1, 'A'].Value := LangText('Adr')+' ' + qReport.FieldByName('From_Addr').AsString;

          List.Cells[CurPos + 2, 'A'].Value := LangText('R/s')+' ' + qReport.FieldByName('From_Rach_Chet').AsString;
          List.Cells[CurPos + 3, 'A'].Value := TranslateText('в ') + qReport.FieldByName('From_Bank_Name').AsString;
          List.Cells[CurPos + 4, 'A'].Value := TranslateText('МФО ') + qReport.FieldByName('From_MFO').AsString;
          List.Cells[CurPos + 5, 'A'].Value := TranslateText('Код ')+LangText('EDRPOU') + qReport.FieldByName('From_OKPO').AsString;
          List.Cells[CurPos + 6, 'A'].Value := LangText('INN')+' ' + qReport.FieldByName('From_Nal_Num').AsString;
          List.Cells[CurPos + 7, 'A'].Value := LangText('SvidPlatNDC');
          List.Cells[CurPos + 8, 'A'].Value :=' № ' + qReport.FieldByName('From_Svid_Num').AsString;
        end;

        if qReport.FieldByName('To_Face').AsInteger = 1 then
        begin
          List.Cells[CurPos, 'M'].Value := LangText('FIO')+' ' + qReport.FieldByName('To_Name').AsString;

          List.Cells[CurPos + 1, 'M'].RowHeight := 24;
          List.Range['M' + IntToStr(CurPos + 1) + ':O' + IntToStr(CurPos + 1)].Merge;
          List.Range['M' + IntToStr(CurPos + 1) + ':O' + IntToStr(CurPos + 1)].VerticalAlignment := xlCenter;
          List.Cells[CurPos + 1, 'M'].WrapText:= True;
          List.Cells[CurPos + 1, 'M'].Value := LangText('Adr')+' ' + qReport.FieldByName('To_Addr').AsString;

          List.Cells[CurPos + 2, 'M'].Value := LangText('NalNum')+' ' + qReport.FieldByName('To_Okpo').AsString;
          List.Cells[CurPos + 3, 'M'].Value := TranslateText('Паспорт ')+LangText('seriі')+' ' + qReport.FieldByName('Passp_Ser').AsString + ' № ' + qReport.FieldByName('Passp_Num').AsString;
          List.Cells[CurPos + 4, 'M'].Value := LangText('Vudan')+' ' + qReport.FieldByName('Passp_When').AsString + ' ' + qReport.FieldByName('Passp_whom').AsString;
        end
        else
        begin
          List.Cells[CurPos, 'M'].Value := qReport.FieldByName('To_Name').AsString;

          List.Cells[CurPos + 1, 'M'].RowHeight := 24;
          List.Range['M' + IntToStr(CurPos + 1) + ':O' + IntToStr(CurPos + 1)].Merge;
          List.Range['M' + IntToStr(CurPos + 1) + ':O' + IntToStr(CurPos + 1)].VerticalAlignment := xlCenter;
          List.Cells[CurPos + 1, 'M'].WrapText:= True;
          List.Cells[CurPos + 1, 'M'].Value := LangText('Adr')+' ' + qReport.FieldByName('To_Addr').AsString;

          List.Cells[CurPos + 2, 'M'].Value := LangText('R/s')+' ' + qReport.FieldByName('To_Rach_Chet').AsString;
          List.Cells[CurPos + 3, 'M'].Value := TranslateText('в ') + qReport.FieldByName('To_Bank_Name').AsString;
          List.Cells[CurPos + 4, 'M'].Value := TranslateText('МФО ') + qReport.FieldByName('To_MFO').AsString;
          List.Cells[CurPos + 5, 'M'].Value := TranslateText('Код ')+LangText('EDRPOU') + qReport.FieldByName('To_OKPO').AsString;
          List.Cells[CurPos + 6, 'M'].Value := LangText('INN')+' ' + qReport.FieldByName('To_Nal_Num').AsString;
          List.Cells[CurPos + 7, 'M'].Value := LangText('SvidPlatNDC');
          List.Cells[CurPos + 8, 'M'].Value := ' № ' + qReport.FieldByName('To_Svid_Num').AsString;
        end;
        Inc(CurPos, 10);
        List.Cells[CurPos, 'A'].Value := TranslateText('       М.П.       ___________________/');
        List.Cells[CurPos, 'M'].Value := TranslateText('       М.П.       ___________________/');
        Inc(CurPos);
        if not qRequest.Eof then
        begin
          List.HPageBreaks.Add(List.Cells[CurPos, 'A']);
          List.Cells[CurPos, 'M'].Value := LangText('Prodolzhenie');
          List.Rows[CurPos].Font.Bold := True;
        end;
        Inc(CurPos, 2);
      end;
    end;
    ShareName := nvl(GetSqlValueParSimple('select s.name from oil_share s, oil_dog d ' +
      'where s.state = ''Y'' and d.state = ''Y'' and s.id = d.share_id and d.id = :dog_id and d.inst = :dog_inst',
      ['dog_id', DogID, 'dog_inst', DogINST]), '');
    if ShareName <> '' then
    begin
      List.Rows[3].Insert(xlDown);
      List.Cells[3, 'A'].Borders[xlEdgeBottom].LineStyle := 1;
      List.Cells[3, 'A'] := LangText('ShareText') +' "'+ ShareName +'"';
    end;
  finally
    ProgressBar.Progress:=100;
    ProgressBar.Free;
    if not VarIsEmpty(MsExcel) then
    begin
      MSExcel.Visible := True;
      MSExcel.ScreenUpdating := True;
    end;
  end;
end;
//------------------------------------------------------------------------------
constructor TCardRequestPrint.Create(AqReport,AqRequest:TOilQuery);
begin
  inherited Create;
  qReport:=AqReport;
  qRequest:=AqRequest;
end;
//------------------------------------------------------------------------------
//==============================================================================
//-----------------------------TCardRequestForm---------------------------------
//---------------------------Наследуемые процедуры------------------------------
//------------------------------------------------------------------------------
//==============================================================================
procedure TCardRequestForm.Save();
var
  DogCreate:TDogCreate;
  BlankCount:integer;
begin
  BlankCount:=0;
  if eDocNumber.Text='' then
    eDocNumber.Text:=IntToStr(GetSeqNextVal('S_CARD_REQUEST_NUM',true));
  try
    SetState('CARD_REQUEST',ID,INST,'N',true);
    ID:=DBSaver.SaveRecord('CARD_REQUEST',
      ['id',ID,
       'inst',INST,
       'state','Y',
       'numb',eDocNumber.Text,
       'from_id',FFromId,
       'from_inst',FFromInst,
       'to_id',FToId,
       'to_inst',FToInst,
       'date_',deDate_.date,
       'dog_id',FDogId,
       'dog_inst',FDogInst,
       'blank_id',FBlankId,
       'blank_inst',FBlankInst
       ]);
    mtDetail.First;
    while not mtDetail.Eof do
    begin
      DbSaver.SaveRecord('CARD_REQUEST_DET',
        ['id',GetFreeId('CARD_REQUEST_DET'),
         'inst',INST,
         'state','Y',
         'head_id',ID,
         'head_inst',INST,
         'card_number',mtDetailCARD_NUMBER.AsInteger,
         'price',BoolTo_(mtDetailPRICE.Value=0,null,mtDetailPRICE.Value),
         'litr',BoolTo_(mtDetailLITR.Value=0,null,mtDetailLITR.Value),
         'np_group_id',BoolTo_(mtDetailNP_GROUP_ID.Value=0,null,mtDetailNP_GROUP_ID.Value)]);
      mtDetail.Next;
    end;
    //Создание отпуска бланков
    if (FBlankId=null) and (FBlankId=null) then
    begin
      mtDetail.First;
      while not mtDetail.Eof do
      begin
        if mtDetail['CREATE_BLANK_OUT']=1 then
        begin
          if BlankCount=0 then
          begin
            if (trim(ceBlank.Text)='')and (sbAutoBlank.Down) then
              ceBlank.Text:= IntToStr(GetSeqNextVal('S_CARD_BLANK_OUT',true));
            FBlankInst:=INST;
            FBlankId:=DBSaver.SaveRecord('CARD_BLANK',
              ['id',0,
               'inst',FBlankInst,
               'state','Y',
               'in_out',-1,
               'numb',ceBlank.Text,
               'date_',deBlankDate.Date,
               'from_id',FFromId,
               'from_inst',FFromInst,
               'to_id',FToId,
               'to_inst',FToInst,
               'dog_id',FDogId,
               'dog_inst',FDogInst,
               'oper_id',255
               ]);
            DbSaver.ExecSql('update card_request set blank_id=:blank_id, blank_inst=:blank_inst where id=:id and inst=:inst',
              ['blank_id',FBlankId,
               'blank_inst',FBlankInst,
               'id',ID,
               'inst',INST]);
          end;
          DbSaver.SaveRecord('CARD_BLANK_DET',
            ['id',0,
             'inst',FBlankInst,
             'state','Y',
             'head_id',FBlankId,
             'head_inst',FBlankInst,
             'card_number',mtDetail['card_number'],
             'price',ceBlankPrice.Value]);
          inc(BlankCount);
        end;
        mtDetail.Next;
      end;
    end;

    //Cоздание договора
    if (FDogId=Null) and (FDogInst=null) then
    begin
      DogCreate:=TDogCreate.Create;
      try
        if ((trim(ceDog.Text)<>'')and not(sbAutoDog.Down)) then
          DogCreate.Dog:=ceDog.Text;
        DogCreate.DogType:=dtK;
        DogCreate.ForePay:=true;
        DogCreate.FromId:=FFromId;
        DogCreate.FromInst:=FFromInst;
        DogCreate.ToId:=FToId;
        DogCreate.ToInst:=FToInst;
        DogCreate.DogDate:=deDogDate.Date;
        DogCreate.ExpDate:=deDogDate.Date;
        DogCreate.SubType := 100; // ЕК
        qDogAuto.Close;
        _OpenQueryPar(qDogAuto,
          ['id',ID,
           'inst',INST]);
        while not qDogAuto.Eof do
        begin
          DogCreate.Add(
            qDogAuto['count'],
            0,
            qDogAuto['price2'],
            0,
            0,
            qDogAuto['np_id'],
            qDogAuto['dim_id']);
          qDogAuto.Next;
        end;
        qDogAuto.Close;
        // Позиция в договор на бланк
        if BlankCount<>0 then
        begin
          DogCreate.Add(
            BlankCount,
            0,
            ceBlankPrice.Value,
            0,
            0,
            455,
            19);
        end;
        DogCreate.Save;
        DbSaver.ExecSql('update card_request set dog_id=:dog_id, dog_inst=:dog_inst where id=:id and inst=:inst',
          ['dog_id',DogCreate.Id,
           'dog_inst',DogCreate.Inst,
           'id',ID,
           'inst',INST]);
        if BlankCount>0 then
          DbSaver.ExecSql('update card_blank set dog_id=:dog_id, dog_inst=:dog_inst where id=:id and inst=:inst',
            ['dog_id',DogCreate.Id,
             'dog_inst',DogCreate.Inst,
             'id',FBlankId,
             'inst',FBlankInst]);
      finally
        FreeAndNil(DogCreate);
      end;
    end;
  except
    on e:exception do
    begin
      if BlankCount<>0 then
      begin
        FBlankId:=null;
        FBlankInst:=null;
      end;
      raise Exception.Create(e.Message);
    end;
    on e:EDogCreate do
      raise Exception.Create(TranslateText('Ошибка при создании договора!')+#13#10
        +e.message);
  end;
  CardRecalc.AddToRecalc(ID,INST,trcRequest);
end;
//------------------------------------------------------------------------------
procedure TCardRequestForm.Test();
var
  SumNpGrp:Currency;
  NpGrp:TStringList;
  i:integer;
begin
  if deDate_.Date <= StrToDate(CLOSE_DATE) then
    raise Exception.Create(TranslateText('Данный период закрыт !'));
  if (eDocNumber.Text='') and (not sbAuto.Down) then
    raise Exception.Create(TranslateText('Не определен номер документа!')+#10#13
      +TranslateText('Введите номер, либо нажмите кнопку "АВТО" для автоматического подбора номера!'));
  if ceFrom.Text='' then
    raise Exception.Create(TranslateText('Не определена организация "От кого"!'));
  if ceTo.Text='' then
    raise Exception.Create(TranslateText('Не определена организация "Кому"!'));
  if (ceDog.Text='') and (not sbAutoDog.Down) then
    raise Exception.Create(TranslateText('Не определен договор!'));
  if (sbAutoDog.Down)then
  begin
    if deDogDate.Date=0 then
      raise Exception.Create(TranslateText('Укажите дату договора!'));
    if((deDogDate.Date>deDate_.Date)or((deDogDate.Date>deBlankDate.Date) and(deBlankDate.Date<>0))) then
      raise Exception.Create(TranslateText('Договор - первичный документ, он не может быть выписан после отпуска!'));
  end
  else
  begin
    NpGrp:=TStringList.Create();
    try
      mtDetail.First;
      while not mtDetail.Eof do
      begin
        if NpGrp.IndexOf(mtDetail.FieldByName('NP_GROUP_ID').AsString)=-1 then
          NpGrp.Add(mtDetail.FieldByName('NP_GROUP_ID').AsString);
        mtDetail.Next;
      end;
      for i:=0 to NpGrp.Count-1 do
      begin
        qTestDog.Close;
        _OpenQueryPar(qTestDog,
          ['dog_id',FDogId,
           'dog_inst',FDogInst,
           'id',ID,
           'inst',INST,
           'np_group_id', NpGrp[i]]);
        mtDetail.First;  SumNpGrp:=0;
        while not mtDetail.Eof do
        begin
          if mtDetail.FieldByName('NP_GROUP_ID').AsString=NpGrp[i] then
            SumNpGrp := SumNpGrp + mtDetail.FieldByName('SUM').AsCurrency;
          mtDetail.Next;
        end;
        if qTestDog.FieldByName('request_sum').AsCurrency+SumNpGrp>qTestDog.FieldByName('dog_sum').AsCurrency then
          raise Exception.Create(TranslateText('Сумма по договору превышает количество по договору!'));
      end;
    finally
      NpGrp.Free;
    end;
  end;

  if mtDetail.IsEmpty then
    raise Exception.Create(TranslateText('Не определена табличная часть!'));
  mtDetail.DisableControls;
  try
    mtDetail.First;
    while not mtDetail.Eof do
    begin
      TestRecord();
      mtDetail.Next;
    end;
  finally
    mtDetail.EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TCardRequestForm.Init();
begin
  inherited Init;
  Sequence:=TSequence.Create;
  Sequence.Reset;
  mtCopy.Active:=False;
  mtCopy.EmptyTable;
  mtCopy.Active:=True;
  if ID=0 then
  begin
    deDate_.Date:=Date();
    FFromId:=INST;
    FFromInst:=INST;
    FDogId:=null;
    FDogInst:=null;
    ceFrom.Text:=GetOrgName(INST,INST);
    mtDetail.Active:=False;
    mtDetail.EmptyTable;
    mtDetail.Active:=True;
    sbAuto.Down:=True;
    ClearBlank();
  end
  else
  begin
    q.Close;
    _OpenQueryPar(q,
      ['id',ID,
       'inst',INST]);
    FillIntegers(q,
      [@FFromId,@FFromInst,
       @FToId,@FToInst],
      ['from_id','from_inst',
       'to_id','to_inst']
      );
    FillVariants(q,
     [@FDogId,@FDogInst,
      @FBlankId,@FBlankInst],
     ['dog_id','dog_inst',
      'blank_id','blank_inst']);
    FillControls(q,
      [deDate_, eDocNumber,
       ceFrom, ceTo,
       ceDog, deDogDate,
       ceBlank, deBlankDate],
      ['date_','numb',
       'from_name', 'to_name',
       'dog', 'dog_date',
       'blank_num', 'blank_date']
      );

    sbAuto.Down:=q.FieldByName('numb').AsString='';
    sbAutoBlank.Down:=q.FieldByName('blank_num').AsString='';
    sbAutoDog.Down:=q.FieldByName('dog').AsString='';
    CopyToMemoryTable(q,mtDetail,'CREATE_BLANK_OUT,ID,INST,CARD_NUMBER,PRICE,LITR,NP_GROUP_ID,NP_GROUP_NAME');
    DbGrid.FieldColumns['CREATE_BLANK_OUT'].ReadOnly:=not (FBlankId=Null);
    bbOk.Enabled:= bbOk.Enabled and (INST = MAIN_ORG.INST);
    bbOk.Enabled := bbOk.Enabled and  (deDate_.Date > StrToDate(CLOSE_DATE));
  end;
  sbAutoClick(sbAuto);
  sbAutoBlankClick(sbAutoBlank);
  sbAutoDogClick(sbAutoDog);
end;
//------------------------------------------------------------------------------
procedure TCardRequestForm.PrintReport(AReportNumber:integer);
begin
  case AReportNumber of
    0:
    begin
      q.Close;
      _OpenQueryPar(q,
        ['id',ID,
         'inst',INST]);
      TCardRequestPrint.Print(qReport, qRequest,
        q.FieldByName('dog_id').AsInteger,q.FieldByName('dog_inst').AsInteger,
        crRequest,
        q.FieldByName('numb').AsString,q.FieldByName('date_').AsDateTime,
        q.FieldByName('to_id').AsInteger,q.FieldByName('to_inst').AsInteger);
    end;
    else
      raise Exception.CreateFmt(TranslateText('Печатный отчет №%d не определен программой!'),[AReportNumber]);
  end;
end;
//==============================================================================
//------------------------------------------------------------------------------
//-------------------------Рукописные  процедуры--------------------------------
//------------------------------------------------------------------------------
//==============================================================================
procedure TCardRequestForm.AfterAction(DataSet: TDataSet);
begin
  mtDetailState:=mtDetail.State;
end;
//------------------------------------------------------------------------------
procedure TCardRequestForm.TestRecord();
const
  MSG_BLANK_PRICE='Необходимо ввести корректную цену бланка смарт-карты в соответствии с договором!';
begin
  // проверка на введено ли все
  if(mtDetailCARD_NUMBER.IsNull) or (mtDetailCARD_NUMBER.Value=0) then
    raise Exception.Create(TranslateText('Не определен номер карты!'));
  TestCardNumber( mtDetailCARD_NUMBER.AsInteger, deDate_.Date);
  if (mtDetailNP_GROUP_ID.IsNull) or (mtDetailNP_GROUP_ID.Value=0) or (mtDetailNP_GROUP_NAME.Text='') then
    raise Exception.Create(TranslateText('Не определен товар!'));
  if 0=nvl(GetSqlValueParSimple('select count(*) from oil_np_group where petrol_id is not null and id=:id',
    ['id',mtDetailNP_GROUP_ID.AsInteger]),0)
  then
    raise Exception.Create(TranslateText('Данный вид топлива по смарт-картам не отпускаеться!'));
  if (mtDetailPRICE.IsNull) or (mtDetailPRICE.Value=0) then
    raise Exception.Create(TranslateText('Не определена цена!'));
  if (mtDetailLITR.IsNull) or (mtDetailLITR.Value=0) then
    raise Exception.Create(TranslateText('Не определено количество!'));


  // проверка на правильность номера карты
  TestCardNumber(mtDetailCARD_NUMBER.AsInteger, deDate_.Date);
  // проверка движения карты
  if (mtDetailCREATE_BLANK_OUT.AsInteger=1) and (FBlankId=null) and (FBlankInst=null) then
  begin
    if ceBlankPrice.Value=0 then
      raise Exception.Create(TranslateText('Необходимо ввести цену бланка смарт-карты!'));
    if FDogId<>Null and FDogInst<>Null then
      if 0=GetSqlValueParSimple('select count(*) from v_oil_dog_full where dog_id=:dog_id and dog_inst=:dog_inst and np_type=455',
        ['dog_id',FDogId,
         'dog_inst',FDogInst])
      then
        raise Exception.Create(TranslateText('В договоре нет позиции с бланком смарт-карты, отредактируйте договор!'));
    if ceBlankPrice.Value<>GetBlankPrice then
      if MessageDlg(TranslateText(MSG_BLANK_PRICE)
        +#10#13+TranslateText('Заменить?'),mtConfirmation,[mbYes, mbNo],0)=mrYes
      then
        ceBlankPrice.Value:=GetBlankPrice
      else
        raise Exception.Create(TranslateText(MSG_BLANK_PRICE));
    if deBlankDate.Date=0 then
      raise Exception.Create(TranslateText('Необходимо ввести дату на отпуск бланков смарт-карт!'));
    TestCardMotion(nvl(FBlankId,0),nvl(FBlankInst,0),mtDetailCARD_NUMBER.AsInteger,ceBlankPrice.Value,255,emOut,deBlankDate.Date);
    if not TCardBlankForm.TestInsertOne(mtDetailCARD_NUMBER.AsInteger,-1,255,deBlankDate.Date) then
      raise Exception.CreateFmt(TranslateText('Создание отпуска бланка %d нарушит его историю!'),[mtDetailCARD_NUMBER.AsInteger]);
  end;

  mtCopy.First;
  while not mtCopy.Eof do
  begin
    if (mtCopyLOCAL_ID.AsInteger<>mtDetailLOCAL_ID.AsInteger)then
    begin
      // проверка на соблюдения уникальности карта-топливо
      if (mtCopyCARD_NUMBER.AsInteger=mtDetailCARD_NUMBER.AsInteger)and
         (mtCopyNP_GROUP_ID.AsInteger=mtDetailNP_GROUP_ID.AsInteger)
      then
        raise Exception.Create(TranslateText('Пополнение данной карты с данным видом топлива уже есть!'));
      // проверка на соблюдения однозначности цен на топливо
      if (mtCopyPRICE.AsCurrency<>mtDetailPRICE.AsCurrency)and
         (mtCopyNP_GROUP_ID.AsInteger=mtDetailNP_GROUP_ID.AsInteger)
      then
        raise Exception.Create(TranslateText('Пополнение одного типа топлива должно быть по одной цене!'));
    end;
    mtCopy.Next;
  end;
  // проверка на соответствие с договором
  
  // проверка на соответствие с отпуком по бланкам
  // !!! такой проверки ну нужно, из-за не целесообразности
end;
//------------------------------------------------------------------------------
procedure TCardRequestForm.SetAutoNumber(AAutoButton:TSpeedButton;ANumberEdit:TControl);
begin
  if AAutoButton.Down then
  begin
    if ANumberEdit is TEdit then
    begin
      TEdit(ANumberEdit).Clear;
      TEdit(ANumberEdit).ReadOnly:=true;
      TEdit(ANumberEdit).Color:=clBtnFace;
      TEdit(ANumberEdit).Hint:=TranslateText('Будет выбран следующий номер по порядку');
      TEdit(ANumberEdit).ShowHint:=true;
    end
    else if ANumberEdit is TComboEdit then
    begin
      TComboEdit(ANumberEdit).Clear;
      TComboEdit(ANumberEdit).ReadOnly:=true;
      TComboEdit(ANumberEdit).Color:=clBtnFace;
      TComboEdit(ANumberEdit).Hint:=TranslateText('Будет выбран следующий номер по порядку');
      TComboEdit(ANumberEdit).ShowHint:=true;
    end;
  end
  else
  begin
    if ANumberEdit is TEdit then
    begin
      TEdit(ANumberEdit).ReadOnly:=false;
      TEdit(ANumberEdit).Color:=clWindow;
      TEdit(ANumberEdit).Hint:='';
      TEdit(ANumberEdit).ShowHint:=false;
    end
    else if ANumberEdit is TComboEdit then
    begin
      TComboEdit(ANumberEdit).ReadOnly:=false;
      TComboEdit(ANumberEdit).Color:=clWindow;
      TComboEdit(ANumberEdit).Hint:='';
      TComboEdit(ANumberEdit).ShowHint:=false;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TCardRequestForm.ClearBlank();
begin
  FBlankId:=null;
  FBlankInst:=null;
  deBlankDate.Date:=0;
  ceBlank.Text:='';
  ceBlankPrice.Value:=GetBlankPrice;
end;
//------------------------------------------------------------------------------
function TCardRequestForm.GetBlankPrice:Currency;
begin
  if (FBlankId<>null)and (FBlankInst<>null)then
    result:=nvl(GetSqlValueParSimple('select min(price) from v_card_blank_full where head_id=:id and head_inst=:inst',
      ['id',FBlankId,
       'inst',FBlankInst]),0)
  else if (FDogId<>null)and (FDogInst<>null)then
    result:=nvl(GetSqlValueParSimple('select min(price_nds) from v_oil_dog_full where np_type=455 and dog_id=:id and dog_inst=:inst',
      ['id',FDogId,
       'inst',FDogInst]),0)
  else
    Result:=ceBlankPrice.Value;
end;
//------------------------------------------------------------------------------
//==============================================================================
//------------------------------------------------------------------------------
//-------------------------Процедуры обработки формы----------------------------
//------------------------------------------------------------------------------
//==============================================================================
procedure TCardRequestForm.mtDetailBeforeDelete(DataSet: TDataSet);
begin
  mtCopy.First;
  while mtDetail['local_id']<>mtCopy['local_id'] do
    mtCopy.Next;
end;

procedure TCardRequestForm.mtDetailAfterDelete(DataSet: TDataSet);
begin
  mtCopy.Delete;
end;

procedure TCardRequestForm.mtDetailAfterPost(DataSet: TDataSet);
var
  i:integer;
begin
  if mtCopy.State=dsInactive then
    mtCopy.Open;
  if mtDetailState=dsInsert then
  // Если строка добавлялась, присваиваем значение сиквенса,
  // а в копии таблицы добавляем строку
    mtCopy.Append
  else if mtDetailState=dsEdit then
  begin
    // ищем строку с нужным сиквенсом
    mtCopy.First;
    while mtCopy.FieldByName('LOCAL_ID').AsInteger<>mtDetail.FieldByName('LOCAL_ID').AsInteger do
      mtCopy.Next;
    mtCopy.Edit;
  end;

  if mtDetailState in [dsInsert,dsEdit] then
  begin
    for i:=1 to mtDetail.FieldCount-1 do
      mtCopy[mtDetail.Fields.FieldByNumber(i).FullName]:=mtDetail[mtDetail.Fields.FieldByNumber(i).FullName];
    mtCopy.Post;
  end;
end;

procedure TCardRequestForm.ceDogButtonClick(Sender: TObject);
var
  id,inst,ToId,ToInst,FromId,FromInst:integer;
  Dog:string; DogDate:TDateTime;
begin
  try
    if ChooseDog(dtK,Dog,DogDate,id,inst,ToId,ToInst,FromId,FromInst)then
    begin
      if not((ToId=FToId)and(ToInst=FToInst)) then
        if(MessageDlg(TranslateText('Покупатель в договоре не соответствует выбраному, изменить покупателя?'),mtConfirmation,[mbYes,mbNo],0)<>mrYes) then
          raise Exception.Create('');
      if not((FBlankId=null)and(FBlankInst=null)) then
        if (MessageDlg(TranslateText('Отпуск бланков будет убран. Продолжить?'),mtConfirmation,[mbYes,mbNo],0)<>mrYes) then
          raise Exception.Create('');        
      FDogId:=id;
      FDogInst:=inst;
      FToId:=ToId;
      FToInst:=ToInst;
      FFromId:=FromId;
      FFromInst:=FromInst;
      ceTo.Text:=GetOrgName(FToId,FToInst);
      ceFrom.Text:=GetOrgName(FFromId,FFromInst);
      ClearBlank();
      ceDog.Text:=Dog;
      deDogDate.Date:=DogDate;

      sbAuto.Down := false;
      sbAuto.Enabled := false;

      eDocNumber.Text := Dog;

      deDate_.Date := DogDate;
      deDate_.ReadOnly := true;
    end;
  except on e:Exception do
  begin
    if e.Message='' then
      MessageDlg(TranslateText('Договор не выбран!'),mtInformation,[mbOk],0)
    else
      raise;
  end
  end;    
end;

procedure TCardRequestForm.sbAutoClick(Sender: TObject);
begin
  inherited;
  SetAutoNumber(sbAuto,eDocNumber);
end;

procedure TCardRequestForm.ceFromButtonClick(Sender: TObject);
var
  strName:string;
begin
  if CaptureOrg(1, MAIN_ID, INST, 'yyx', FFromId, FFromInst, strName) then
    ceFrom.Text := strName;
end;

procedure TCardRequestForm.ceToButtonClick(Sender: TObject);
var
  strName:string;
begin
  if CaptureOrg(3, MAIN_ID, INST, 'yyyr', FToId, FToInst, strName) then
    ceTo.Text := strName;
end;

procedure TCardRequestForm.DbGridColumns3EditButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  vId:integer;
  vName:string;
begin
  inherited;
  if XMLChoose('npgroupref',vId,vName) then
  begin
    mtDetail.Edit;
    mtDetailNP_GROUP_NAME.AsString := vName;
    mtDetailNP_GROUP_ID.AsInteger:= vId;
  end;
end;

procedure TCardRequestForm.mtDetailCalcFields(DataSet: TDataSet);
begin
  inherited;
  mtDetailSUM.AsCurrency:=FRound(mtDetailLITR.AsCurrency*mtDetailPRICE.AsCurrency);
end;

procedure TCardRequestForm.mtDetailBeforePost(DataSet: TDataSet);
begin
  TestRecord();
  if DataSet.FieldByName('local_id').AsInteger=0 then
    DataSet.FieldByName('local_id').AsInteger:=Sequence.NextVal  
end;

procedure TCardRequestForm.ceBlankButtonClick(Sender: TObject);
var
  q:TOilQuery;
  id,inst:integer;
  name:string;
begin
  inherited;
  if XMLChoose('CardBlankRefOut',id,inst,name) then
  begin
    q:=TOilQuery.Create(nil);
    try
      q.sql.text:='select * from v_card_blank_full where head_id=:id and head_inst=:inst';
      _OpenQueryPar(q,
        ['id',id,
         'inst',inst]);
      if ((FDogId<>Null) and (FDogInst<>Null))and
         not((FDogId=q['dog_id']) and (FDogInst=q['dog_inst']))
      then
        raise Exception.Create(TranslateText('Договор в отпуске бланков отличаеться от договора указаного здесь!'));
      if ((FToId<>0) and (FToInst<>0)) and
         not((FToId=q['to_id']) and (FToInst=q['to_inst']))
      then
        raise Exception.Create(TranslateText('Клиент в отпуске бланков отличаеться от клиента указаного здесь!'));
      if q['in_out']=-1 then
      begin
        if (FToId=0) and (FToInst=0) then
        begin
          FToId:=q['to_id'];
          FToInst:=q['to_inst'];
          ceTo.Text:=q['to_name'];
        end;
        FBlankId:=id;
        FBlankInst:=inst;
        ceBlank.Text:=name;
        deBlankDate.Date:=q['date_'];
        FDogId:=q['dog_id'];
        FDogInst:=q['dog_inst'];
        ceDog.Text:=q['dog'];
        ceDog.Enabled:=q['dog_id']=null;
        deDogDate.Date:=q['dog_date'];
        deDogDate.Enabled:=q['dog_id']=null;
        if mtDetail.RecordCount>0 then
        begin
          mtDetail.First;
          while not(mtDetail.Eof) do
          begin
            q.Filtered:=False;
            q.Filter:='card_number='+mtDetailCARD_NUMBER.AsString;
            q.Filtered:=True;
            mtDetail.Edit;
            if q.RecordCount>0 then
              mtDetailCREATE_BLANK_OUT.AsInteger:=1
            else
              mtDetailCREATE_BLANK_OUT.AsInteger:=0;
            mtDetail.Post;
            mtDetail.Next;
          end;
        end;
        DbGrid.FieldColumns['CREATE_BLANK_OUT'].ReadOnly:=True;
      end;
      q.Close;
    finally
      q.Free;
    end;
  end;
end;

procedure TCardRequestForm.actDeleteRecordExecute(Sender: TObject);
begin
  if not mtDetail.IsEmpty then
    mtDetail.Delete;
end;

procedure TCardRequestForm.ceBlankChange(Sender: TObject);
begin
  ceBlankPrice.Value:=GetBlankPrice;
  deBlankDate.Enabled:=FBlankId=null;
  ceBlankPrice.Enabled:=FBlankId=null;
  sbAutoBlank.Down:=FBlankId=null;
  sbAutoBlank.Enabled:=FBlankId=null;
end;

procedure TCardRequestForm.sbAutoBlankClick(Sender: TObject);
begin
  inherited;
  SetAutoNumber(sbAutoBlank,ceBlank);
end;

procedure TCardRequestForm.sbAutoDogClick(Sender: TObject);
begin
  inherited;
  SetAutoNumber(sbAutoDog,ceDog);
end;

procedure TCardRequestForm.ceDogChange(Sender: TObject);
begin
  inherited;
  deDogDate.Enabled:=FDogId=null;
  sbAutoDog.Down:=FDogId=null;
  sbAutoDog.Enabled:=FDogId=null;
end;

procedure TCardRequestForm.dsDetailDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if Field<>nil then
  begin
    if(Field.FullName='CARD_NUMBER')then
    begin
      if DbGrid.FieldColumns['CREATE_BLANK_OUT'].ReadOnly and(mtDetailCREATE_BLANK_OUT.AsInteger=1)then
      begin
        mtDetail.Cancel;
        raise Exception.Create(TranslateText('Нельзя менять номер карты, на нее уже выписан отпуск бланка!')
          +TranslateText('Удалите отпуск бланка, потом поменяйте номер.'));
      end;
    end;
    //if(Field.FullName='')
  end;
end;

procedure TCardRequestForm.ceDogKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

end.
