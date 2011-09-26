// печать счет-фактуры
unit InvoicePrint;

interface

uses uCommonForm,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MemDS, VirtualTable, TaxBillPrint, DBAccess, Ora, DBTables, Excel8tlb,
  MemTable, uOilQuery, uOilStoredProc{$IFDEF VER150},Variants{$ENDIF};

type
  TDogLink = (dlFirstDog, dlCurrentDog);
  TInvoiceCause = (icDog, icBill);  

type
  TdmInvoicePrint = class(TDataModule)
    qRekv: TOilQuery;
    qDog: TOilQuery;
    vt: TMemoryTable;
    vtNpName: TStringField;
    vtDimName: TStringField;
    vtPriceNDS: TFloatField;
    vtCount: TFloatField;
    vtSumNoNds: TFloatField;
    vtPriceNoNds: TFloatField;
    vtSumNds: TFloatField;
    qParent: TOilQuery;
    procedure DataModuleDestroy(Sender: TObject);
  private
    ProgressBar: TProgressBar;
    iFromId, iFromInst, iToId, iToInst : Integer; // От кого, кому
    iFromRekId, iFromRekInst, iToRekId, iToRekInst : Variant; // Их реквизиты, если реквизита нет, то NULL
    strInvoiceNumber, strInvDate, strPeriod, strAddText: string;
    DogName, DogDate: string;
    IsCorrLastPos: boolean;
    FInvoiceCause:TInvoiceCause;
    FValidTime:integer;//Время действия счета
  public
    DogId, DogInst: integer;
    DogLink: TDogLink;
    MSExcel: TMSExcel;
    procedure FillHeader();
    constructor Create(p_InvNumber, p_InvDate, p_Period, p_AddText: string;
      p_FromId, p_FromInst, p_ToId, p_ToInst: Integer;
      p_ValidTime: integer=1;
      p_InvoiceCause: TInvoiceCause=icDog); reintroduce; overload;
    constructor Create(p_InvNumber, p_InvDate, p_Period, p_AddText: string;
      p_FromId, p_FromInst:integer;//от кого
      p_FromRekId, p_FromRekInst:Variant;// от кого реквизит
      p_ToId, p_ToInst: Integer;// кому
      p_ToRekId, p_ToRekInst: Variant; //кому реквизит
      p_ValidTime:integer=1;// время действия
      p_InvoiceCause:TInvoiceCause=icDog); reintroduce; overload;
    procedure PutToExcel(OutputType: Integer; FileName: string = ''; NeedSave: Boolean = false; p_NumOfCopy: Integer = 1);
    procedure AddPosition(p_NpName, p_DimName: string; p_PriceNds, p_Count: Double); overload; // c ндс
    procedure AddPosition(p_NpName, p_DimName: string; p_PriceNoNds, p_Count, p_SumNoNds: double); overload;
    procedure AddPosition(p_NpName, p_DimName: string;
      p_PriceNds, p_PriceXNds, p_SummNds, p_SummXNds, p_Count: Double); overload; // повна вставка
  end;

var
  dmInvoicePrint: TdmInvoicePrint;

implementation

uses Main, MoneyFunc, UDbFunc, OilStd, uStart, ViewDoc, ExFunc, uExeSql;

{$R *.DFM}

//==============================================================================
constructor TdmInvoicePrint.Create(p_InvNumber, p_InvDate, p_Period, p_AddText: string;
  p_FromId, p_FromInst, p_ToId, p_ToInst: Integer;
  p_ValidTime: integer=1;
  p_InvoiceCause: TInvoiceCause=icDog);
begin
  inherited Create(Application);
  LoadSQLByForm(TForm(Self));
  iFromId := p_FromId;
  iFromInst := p_FromInst;
  iToId := p_ToId;
  iToInst := p_ToInst;
  strInvoiceNumber := p_InvNumber;
  strInvDate := p_InvDate;
  strPeriod := p_Period;
  if p_AddText <> '' then
    strAddText := LangText('ShareText') +' "'+ p_AddText +'"';
  DogId := 0;
  DogInst := 0;
  DogLink := dlFirstDog;
  FInvoiceCause:=p_InvoiceCause;
  FValidTime:=p_ValidTime;
  vt.Open;
end;
//==============================================================================
constructor TdmInvoicePrint.Create(p_InvNumber, p_InvDate, p_Period, p_AddText: string;
      p_FromId, p_FromInst:integer; p_FromRekId, p_FromRekInst:Variant;
      p_ToId, p_ToInst: Integer; p_ToRekId, p_ToRekInst: Variant;
      p_ValidTime: integer=1;
      p_InvoiceCause: TInvoiceCause=icDog);
begin
  Self.Create(p_InvNumber, p_InvDate, p_Period, p_AddText,
    p_FromId, p_FromInst,
    p_ToId, p_ToInst,
    p_ValidTime, p_InvoiceCause);
  iFromRekId := p_FromRekId;
  iFromRekInst := p_FromRekInst;
  iToRekId := p_ToRekId;
  iToRekInst := p_ToRekInst;
end;
//==============================================================================
procedure TdmInvoicePrint.AddPosition(p_NpName, p_DimName: string; p_PriceNds,
  p_Count: Double); // для расчета от суммы с НДС
begin
  try
    vt.Insert;
    vtNpName.asString := p_NpName;
    vtDimName.asString := p_DimName;
    vtPriceNds.asFloat := p_PriceNds;
    vtCount.asFloat := p_Count;
    vtSumNds.asFloat := FRound(p_Count * p_PriceNds, 2);
    vtPriceNoNds.AsFloat := GetNoNDS_WithNDS(p_PriceNds, StrToDate(strInvDate));
    vtSumNoNds.AsFloat := GetNoNDS_WithNDS(vtSumNds.asFloat, StrToDate(strInvDate), 2);
    vt.Post;
    IsCorrLastPos := true;
  except on E: Exception do
    begin
      vt.Cancel;
      raise Exception.Create(TranslateText('Ошибка добавления позиции счета') + #13#10 + E.Message);
    end;
  end;
end;
//==============================================================================
procedure TdmInvoicePrint.AddPosition(p_NpName, p_DimName: string; p_PriceNoNds,
  p_Count, p_SumNoNds: double); // для расчета от суммы без НДС
begin
  try
    vt.Insert;
    vtNpName.asString := p_NpName;
    vtDimName.asString := p_DimName;
    vtCount.asFloat := p_Count;
    vtPriceNoNds.AsFloat := p_PriceNoNds;
    vtSumNoNds.AsFloat := p_SumNoNds;
    vtPriceNds.asFloat := GetWithNDS_NoNDS(p_PriceNoNds, StrToDate(strInvDate));
    vtSumNds.asFloat := GetWithNDS_NoNDS(vtSumNoNds.AsFloat, StrToDate(strInvDate));
    vt.Post;
    IsCorrLastPos := false;
  except on E: Exception do
    begin
      vt.Cancel;
      raise Exception.Create(TranslateText('Ошибка добавления позиции счета') + #13#10 + E.Message);
    end;
  end;
end;
//==============================================================================
procedure TdmInvoicePrint.AddPosition(
  p_NpName, p_DimName: string;
  p_PriceNds, p_PriceXNds, p_SummNds, p_SummXNds, p_Count: Double); // повна вставка
begin
  try
    vt.Insert;
    vtNpName.asString := p_NpName;
    vtDimName.asString := p_DimName;

    vtCount.asFloat := p_Count;

    vtPriceNds.asFloat := p_PriceNds;
    vtPriceNoNds.AsFloat := p_PriceXNds;

    vtSumNds.asFloat := p_SummNds;
    vtSumNoNds.AsFloat := p_SummXNds;
    vt.Post;
    IsCorrLastPos := true;
  except on E: Exception do
    begin
      vt.Cancel;
      raise Exception.Create(TranslateText('Ошибка добавления позиции счета') + #13#10 + E.Message);
    end;
  end;
end;
//==============================================================================
procedure TdmInvoicePrint.DataModuleDestroy(Sender: TObject);
begin
  if vt.Active then vt.Close;
end;
//==============================================================================
procedure TdmInvoicePrint.FillHeader;
var
  strOrgName, strDepName: string;
begin
  qDog.Close;
  _OpenQueryPar(qDog,
    ['Org_Id',     Self.iToId,
     'Org_Inst',   Self.iToInst,
     'Dog_Id',     Self.DogId,
     'Dog_Inst',   Self.DogInst,
     'IsFirstDog', decode([DogLink, dlFirstDog, 1, 0])]);
  DogName := qDog.FieldByName('DOG').asString;
  DogDate := qDog.FieldByName('DOG_DATE').asString;

  {iFromId := qDog.FieldByName('FROM_').asInteger;
  iFromInst := qDog.FieldByName('FROM_INST').asInteger;
  iFromRekId := qDog.FieldByName('R_FROM_').asInteger;
  iFromRekInst := qDog.FieldByName('R_FROM_INST').asInteger;

  iToRekId := qDog.FieldByName('R_TO_').asInteger;
  iToRekInst := qDog.FieldByName('R_TO_INST').asInteger;}

  strOrgName := GetOrgName(Self.iToId, Self.iToInst);
  strDepName := GetOrgName(Self.iFromId, Self.iFromInst);
  if qDog.IsEmpty and (FInvoiceCause=icDog) then
    raise Exception.Create(TranslateText('Договор между ') + strDepName +
      TranslateText(' и ') + strOrgName + TranslateText(' не существует'));
  with MSExcel do
  begin
    ///////////////// Вставка реквизитов продавца /////////////////
    if Main.DOG_WITH_REKVIZIT_CONTROL = 'Y' then
    begin
      qParent.Close;
      qParent.ParamByName('Id').Value := Self.iFromId;
      qParent.ParamByName('Inst').Value := Self.iFromInst;
      qParent.Open;
      List.Cells[1, 'C'] := qParent.FieldByName('Name').AsString;
      List.Cells[2, 'G'] := qParent.FieldByName('Svid_Num').AsString;
      List.Cells[3, 'F'] := qParent.FieldByName('nal_num').AsString;
      List.Cells[4, 'C'] := qParent.FieldByName('addr').AsString;
      List.Cells[4, 'H'] := qParent.FieldByName('Phone').AsString;
      List.Cells[5, 'C'] := qParent.FieldByName('id_num').AsString;
      List.Cells[6, 'C'] := qParent.FieldByName('Bank_Name').AsString;
      List.Cells[6, 'G'] := qParent.FieldByName('MFO').AsString;
      List.Cells[7, 'C'] := qParent.FieldByName('Rach_Chet').AsString;
      List.Cells[8, 'C'] := qParent.FieldByName('Rach_Chet_Nds').AsString;
    end
    else
    begin
      qRekv.Close;
      _OpenQueryPar(qRekv,
        ['id',Self.iFromId,
         'inst',Self.iFromInst,
         'rek_id',Self.iFromRekId,
         'rek_inst',Self.iFromRekInst]);
      List.Cells[1, 'C'] := qRekv.FieldByName('Name').AsString;
      List.Cells[2, 'G'] := qRekv.FieldByName('Svid_Num').AsString;
      List.Cells[3, 'F'] := qRekv.FieldByName('nal_num').AsString;
      List.Cells[4, 'C'] := qRekv.FieldByName('addr').AsString;
      List.Cells[4, 'H'] := qRekv.FieldByName('Phone').AsString;
      List.Cells[5, 'C'] := qRekv.FieldByName('OKPO').AsString;
      List.Cells[6, 'C'] := qRekv.FieldByName('Bank_Name').AsString;
      List.Cells[6, 'G'] := qRekv.FieldByName('MFO').AsString;
      List.Cells[7, 'C'] := qRekv.FieldByName('Rach_Chet').AsString;
      List.Cells[8, 'C'] := qRekv.FieldByName('Rach_Chet_NDS').AsString;
    end;
    ////////////////////Вставка реквизитов покупателя/////////////////
    qRekv.Close;
    _OpenQueryPar(qRekv,
      ['id',Self.iToId,
       'inst',Self.iToInst,
       'rek_id',Self.iToRekId,
       'rek_inst',Self.iToRekInst
       ]);
    if qRekv.IsEmpty then
    begin
      MessageDlg(TranslateText('Организация с сохраненными реквизитаними не найдена!')+#13#10
        +TranslateText('Документ будет распечатан с текущими реквизитами клиента.'),mtCustom,[mbOk],0);
      qRekv.Close;
      _OpenQueryPar(qRekv,
        ['id',Self.iToId,
         'inst',Self.iToInst,
         'rek_id',null,
         'rek_inst',null
       ]);
    end;
    List.Cells[11, 'C'] := qRekv.FieldByName('Name').AsString;
    List.Cells[12, 'G'] := qRekv.FieldByName('Svid_Num').AsString;
    List.Cells[13, 'F'] := qRekv.FieldByName('Nal_Num').AsString;
    if qRekv.FieldByName('Face').Value = 1 then
    begin
      List.Cells[11, 'A'] := LangText('FIO_Poluch');
      List.Cells[12, 'A'] := LangText('NalNum');
      List.Cells[12, 'G'] := qRekv.FieldByName('id_num').AsString;
      List.Cells[13, 'A'] := LangText('Adr') + qRekv.FieldByName('addr').AsString; ;
      List.Cells[14, 'A'] := LangText('Pasport');
      List.Cells[15, 'A'] := LangText('Vudan');
      List.Cells[14, 'C'] := qRekv.FieldByName('passport_Ser').AsString + ' № ' + qRekv.FieldByName('passport_Num').AsString;
      List.Cells[15, 'C'] := qRekv.FieldByName('passport_When').AsString + '  ' + qRekv.FieldByName('passport_Whom').AsString;
      List.Cells[16, 'A'] := '';
    end
    else
    begin
      List.Cells[14, 'C'] := qRekv.FieldByName('addr').AsString;
      List.Cells[15, 'C'] := qRekv.FieldByName('rach_chet').AsString;
      List.Cells[16, 'C'] := qRekv.FieldByName('rach_chet_nds').AsString;
    end;
    // номер договора-заказа
    if (DogName <> '') and (DogDate <> '') then
      List.Cells[20, 'A'] := DogName + TranslateText(' от ') + DogDate;
    List.Cells[20, 'E'] := strPeriod;
    List.Cells[21, 'C'] := strAddText;
    List.Cells[22, 'E'] := strInvoiceNumber + LangText('Ot') + strInvDate;
  end;
end;
//==============================================================================
procedure TdmInvoicePrint.PutToExcel(OutputType: Integer; FileName: string = '';
  NeedSave: Boolean = false; p_NumOfCopy: Integer = 1);
var
  i: Integer;
  SumNds, SumXNds: real;
  strDirName: string;
begin
  try
    ProgressBar := TProgressBar.Create(Application);
    MSExcel := TMSExcel.Create('Schet');
    // заполнить шапку счет-фактуры
    self.FillHeader();
    // Вставка информации о товаре с ценой с НДС
    SumNds := 0;
    SumXNds := 0;
    i := 0;
    vt.First;
    ProgressBar.SetMaxValue(vt.RecordCount);
    with MsExcel do
    begin
      while not vt.Eof do
      begin
        List.Cells[24 + i, 'A'] := i + 1;
        List.Range['B' + IntToStr(24 + i) + ':D' + IntToStr(24 + i)].Merge;
        List.Cells[24 + i, 'B'] := vtNpName.asString;
        List.Cells[24 + i, 'E'] := vtDimName.asString;
        if not IsCorrLastPos then
        begin
          List.Cells[24 + i, 'F'].NumberFormat := '0,000';
          List.Cells[24 + i, 'F'] := Fround(vtCount.asFloat, 3); // count
          List.Cells[24 + i, 'G'].NumberFormat := '0,00';
          List.Cells[24 + i, 'G'] := FRound(vtPriceNoNds.asFloat, 2)
        end
        else
        begin
          List.Cells[24 + i, 'F'].NumberFormat := '0,00';
          List.Cells[24 + i, 'F'] := Fround(vtCount.asFloat, 2);
          List.Cells[24 + i, 'G'].NumberFormat := '0,0000';
          List.Cells[24 + i, 'G'] := GetNoNDS_WithNDS(vtPriceNds.asFloat, StrToDate(strInvDate)); // price_nonds
        end;
        List.Cells[24 + i, 'H'] := vtSumNoNds.AsFloat; // sum_nonds
        List.Range['A' + IntToStr(24 + i) + ':H' + IntToStr(24 + i)].Borders.LineStyle := xlContinuous;
        SumNds := SumNds + vtSumNds.asFloat;
        SumXNds := SumXNds + vtSumNoNds.asFloat;
        vt.Next;
        ProgressBar.Step();
        // Выровнять общую сумму по позициям на последней записи
        if (vt.Eof) and IsCorrLastPos then
          List.Cells[24 + i, 'H'] := vtSumNoNds.asFloat + SumNds - GetNds_WithNds(SumNds, StrToDate(strInvDate)) - SumXNds;
        inc(i);
      end;
      // сумма без НДС
      List.Cells[24 + i, 'B'] := LangText('Itogo');
      if not IsCorrLastPos then List.Cells[24 + i, 'H'] := SumXNds
      else List.Cells[24 + i, 'H'] := GetNoNds_WithNds(SumNds, StrToDate(strInvDate), 2);
      List.Range['A' + IntToStr(24 + i) + ':H' + IntToStr(24 + i)].Borders.LineStyle := xlContinuous;
      List.Range['B' + IntToStr(24 + i) + ':G' + IntToStr(24 + i)].Merge;
      inc(i);
      List.Cells[24 + i, 'B'] := FloatToStr(TAX_RATE(StrToDate(strInvDate)) * 100) + '% ' + LangText('NDS');
      // НДС
      if not IsCorrLastPos then List.Cells[24 + i, 'H'] := GetNds_NoNds(SumXNds, StrToDate(strInvDate))
      else List.Cells[24 + i, 'H'] := GetNds_WithNds(SumNds, StrToDate(strInvDate));
      List.Range['A' + IntToStr(24 + i) + ':H' + IntToStr(24 + i)].Borders.LineStyle := xlContinuous;
      List.Range['B' + IntToStr(24 + i) + ':G' + IntToStr(24 + i)].Merge;
      inc(i);
      List.Cells[24 + i, 'B'] := LangText('Vsego_sum');
      // сумма с НДС
      if not IsCorrLastPos then List.Cells[24 + i, 'H'] := GetWithNds_NoNds(SumXNds, StrToDate(strInvDate))
      else List.Cells[24 + i, 'H'] := Fround(SumNds, 2);
      List.Range['A' + IntToStr(24 + i) + ':H' + IntToStr(24 + i)].Borders.LineStyle := xlContinuous;
      List.Range['B' + IntToStr(24 + i) + ':G' + IntToStr(24 + i)].Merge;
      List.Cells[24 + i + 2, 'A'] := LangText('All_Sum_NDS') + NumStrGrn(SumNds, TranslateText('грн'), TranslateText('коп'));
      List.Cells[24 + i + 6, 'A'] := MANAGER_SHIP + ' _____________';
      List.Cells[24 + i + 6, 'F'] := LangText('Chief_Buh') + ' _____________';

      if FValidTime=1 then
        List.Cells[24 + i + 10, 'A'] := LangText('Work_Account_Invoice')
      else
        List.Cells[24 + i + 10, 'A'] := format(LangText('Work_Account_Invoice_More'),
          [FValidTime,
           Number2Words( FValidTime,'M','',umLower )
           ]);
      // обработка типов вывода экселя
      if OutputType = 0 then MSExcel.Show;
      if OutputType = 1 then
        for i := 1 to p_NumOfCopy do
          List.PrintOut();
      if NeedSave then
      begin
        strDirName := GetDirName(FileName, LangText('Doc_po_grn_tr'), strPeriod, self.iToId, iToInst);
        MsExcel.SaveAs(strDirName + 'Schet_' + strInvoiceNumber);
      end;
    end; // with
    MSExcel.Free;
    ProgressBar.Free();
  except on E: Exception do
    begin
      MSExcel.Free;
      ProgressBar.Free();
      raise Exception.Create(TranslateText('Ошибка формирования документа') + #13#10 + E.Message);
    end;
  end;
end;
//==============================================================================

end.
