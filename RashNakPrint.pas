(**
  Класс предназначеный для печати расходных накладных
*)
unit RashNakPrint;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MemDS, VirtualTable, TaxBillPrint, DBAccess, Ora,Excel8TLB, DBTables,
  MemTable, OleCtrls,uOilQuery,uOilStoredProc{$IFDEF VER150},Variants{$ENDIF};

type
  TRashNakType = (rnCardEK, rnCardLS, rnCardAdd, rnCardBlank, rnNB, rnTalon);

type
  TRashNakDest = (rndClient, rndObl);

type
  TrnpOptions = class
  private
    FWithRequest:boolean;
    procedure Init;
  public
    // property rnType
    constructor Create;
    property WithRequest: boolean read FWithRequest write FWithRequest;
  end;

  TdmRashNakPrint = class(TDataModule)
    qRekv: TOilQuery;
    qDog: TOilQuery;
    vt: TMemoryTable;
    vtDepartment: TStringField;
    vtAZS: TStringField;
    vtNPName: TStringField;
    vtCardNumber: TStringField;
    vtDraft: TStringField;
    vtDraftDate: TStringField;
    vtDimName: TStringField;
    vtCount: TFloatField;
    vtPriceNds: TFloatField;
    vtPriceNdsDis: TFloatField;
    vtPriceNoNds: TFloatField;
    vtPriceNoNdsDis: TFloatField;
    vtNds: TFloatField;
    vtSumNoNds: TFloatField;
    vtSumNds: TFloatField;
    vtDovNum: TStringField;
    vtDovSer: TStringField;
    vtDovWho: TStringField;
    qReport: TOilQuery;
    qWork: TOilQuery;
    vtDovDate: TDateField;
    qReportDOG: TStringField;
    qReportDOG_DATE: TDateTimeField;
    qReportFROM_NAME: TStringField;
    qReportFROM_ADDR: TStringField;
    qReportFROM_SVID_NUM: TStringField;
    qReportFROM_NAL_NUM: TStringField;
    qReportFROM_BOSS: TStringField;
    qReportFROM_OKPO: TStringField;
    qReportFROM_PHONE: TStringField;
    qReportFROM_RACH_CHET: TStringField;
    qReportFROM_BANK_NAME: TStringField;
    qReportFROM_MFO: TStringField;
    qReportTO_NAME: TStringField;
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
    vtPosNum: TFloatField;
    qDogLink: TOilQuery;
    qRekvLink: TOilQuery;
    vtPartName: TStringField;
    vtCountWanted: TFloatField;
    vtStation: TStringField;
    vtCertName: TStringField;
    vtTalon5L: TFloatField;
    vtTalon10L: TFloatField;
    vtTalon20L: TFloatField;
    vtTalon50L: TFloatField;
    qReportLS: TOilQuery;
    vtShareActive: TBooleanField;
    vtRequest: TStringField;
    vtRequestDate: TDateField;
    procedure DataModuleDestroy(Sender: TObject);
  private
    OutputType, NumOfCopy : integer;
    FileName  : String;
    NeedSave : Boolean;
    WithSignPagely: Boolean;  // Підписи на кожній сторінці ВН.
    strDirName : string;
    strByDoc : String;
    ProgressBar : TProgressBar;
    strNumber, strPeriod, DogName : String;
    DocDate, DogDate : TDateTime;
    iFromId,iFromInst,iToId,iToInst : Integer;
    rnType : TRashNakType;
    ZDNList:String;  //ж/д накладные
    TankWagonList:String;  //цистерни
    procedure PutToExcelCardRn();
    procedure PutToExcelCardBlank();
    procedure PutToExcelCardRnAdd();
    procedure PutToExcelNbRn();
    procedure PutToExcelTalonRn;
    function fAllowSave():Boolean;
  public
    Options: TrnpOptions;
    MsExcel:TMsExcel;
    UseLinkToOldBase :boolean;
    RnDest : TRashNakDest;
    constructor Create(
      p_Number : String;
      p_Date : TDateTime;
      p_Period : String;
      p_ByDoc: String;
      p_FromId,
      p_FromInst,
      p_ToId,
      p_ToInst : Integer;
      p_rnType:TRashNakType=rnCardEK
    );  reintroduce;overload;
    constructor Create(
      p_Number,
      p_DogName : String;
      p_DogDate,
      p_Date : TDateTime;
      p_ZDNList,
      p_TankWagonList:String;
      p_FromId,
      p_FromInst,
      p_ToId,
      p_ToInst : Integer;
      p_rnType:TRashNakType=rnNb
    ); reintroduce;overload;
    procedure SaveTo();
    procedure AddPosition(
      p_Department,
      p_AZS,
      p_NPName,
      p_CardNumber,
      p_Draft,
      p_DraftDate,
      p_DimName : String;
      p_PriceNds,
      p_PriceNdsDis,
      p_Count : double;
      p_Part:string ='';
      p_Share: boolean=false;
      p_Request:string='';
      p_RequestDate: TDateTime=0
    ); overload;
    procedure AddPosition(
      p_DovSer,
      p_DovNum : String;
      p_DovDate : TDateTime;
      p_DovWho,
      p_Name : String;
      p_Count : Integer;
      p_Price : Double;
      p_SummNDS: Double = 0
    );  overload;
    procedure AddPosition(
      p_CertName,
      p_NpName,
      p_PartName,
      p_Station,
      p_DimName: String;
      p_Count,
      p_CountWanted,
      p_Price: Double
    ); overload;
    procedure AddPosition(
      p_NpName:string;
      p_Talon5L,
      p_Talon10L,
      p_Talon20L,
      p_Talon50L: Integer
    ); overload;
    procedure SetAddFields(p_DovWho, p_DovNum : String;
       p_DovDate : TDateTime; p_DovSer: String='');
    procedure PutToExcel (
      p_OutputType:Integer;
      p_FileName:String='';
      p_NeedSave:Boolean=false;
      p_NumOfCopy:Integer=1;
      p_WithSignPagely: Boolean = false
    );
    procedure SaveBD(
      p_SourceId,p_SourceInst, // Код документа источника
      p_CurrId, // OIL_RASH_NAK.ID, если <=0, то береться значение по сиквенсу
      p_TableId:Integer // Код таблици источника
      );
    class procedure DeleteBD(p_SourceId,p_SourceInst, p_CurrId, p_CurrInst, p_TableId:Integer);
    procedure EmptyMt;

end;

var
  dmRashNakPrint: TdmRashNakPrint;

implementation

uses MoneyFunc, OilStd, UDbFunc, uStart, Main, ExcelFunc, ExFunc;

{$R *.DFM}


//==============================================================================
//===============================TrnpOptions====================================
//==============================================================================
constructor TrnpOptions.Create();
begin
  Init;
end;
procedure TrnpOptions.Init;
begin
  FWithRequest := False;
end;
//==============================================================================
//============================TdmRashNakPrint===================================
//==============================================================================
constructor TdmRashNakPrint.Create(
              p_Number : String;
              p_Date : TDateTime;
              p_Period : String;
              p_ByDoc: String;
              p_FromId,
              p_FromInst,
              p_ToId,
              p_ToInst : Integer;
              p_rnType:TRashNakType=rnCardEK
            );
begin
  inherited Create(Application);
  Options := TrnpOptions.Create();
  UseLinkToOldBase := false;
  RnDest := rndObl;
  strNumber := p_Number;
  DocDate := p_Date;
  strByDoc := p_ByDoc;
  if p_Period <> '' then
    strPeriod := ' за период '+p_Period
  else
    strPeriod := '';
  iFromId := p_FromId;
  iFromInst := p_FromInst;
  iToId := p_ToId;
  iToInst := p_ToInst;
  rnType := p_rnType;
  vt.Open;
end;
//==============================================================================
constructor TdmRashNakPrint.Create(
              p_Number,
              p_DogName : String;
              p_DogDate,
              p_Date : TDateTime;
              p_ZDNList,
              p_TankWagonList:String;
              p_FromId,
              p_FromInst,
              p_ToId,
              p_ToInst : Integer;
              p_rnType:TRashNakType=rnNb
            );
begin
  inherited Create(Application);
  Options := TrnpOptions.Create();
  UseLinkToOldBase := false;
  RnDest := rndObl;
  strNumber := p_Number;
  DocDate := p_Date;
  TankWagonList:= p_TankWagonList;
  ZDNList:= p_ZDNList;
  iFromId := p_FromId;
  iFromInst := p_FromInst;
  iToId := p_ToId;
  iToInst := p_ToInst;
  rnType := p_rnType;
  DogName:=p_DogName;
  DogDate:=p_DogDate;
  vt.Open;
end;
//==============================================================================
function TdmRashNakPrint.fAllowSave():boolean;
begin
  fAllowSave := not ( (vt.RecordCount <=0) or (vt.Active=false))
end;
//==============================================================================
procedure TdmRashNakPrint.AddPosition(
            p_Department,
            p_AZS,
            p_NPName,
            p_CardNumber,
            p_Draft,
            p_DraftDate,
            p_DimName : String;
            p_PriceNds,
            p_PriceNdsDis,
            p_Count : double;
            p_Part:string='';
            p_Share: boolean=false;
            p_Request:string='';
            p_RequestDate: TDateTime=0
          );
begin
  try
    vt.Insert;
    vtDepartment.AsString := p_Department;
    vtAZS.AsString := p_AZS;
    vtNPName.AsString := p_NPName;
    vtCardNumber.AsString := p_CardNumber;
    vtDraft.AsString := p_Draft;
    vtDraftDate.AsString := p_DraftDate;
    vtDimName.AsString := p_DimName;
    vtCount.asFloat := p_Count;
    vtPriceNoNds.asFloat := GetNoNds_WithNds(p_PriceNds,StrToDate(p_DraftDate));
    vtPriceNoNdsDis.asFloat := GetNoNds_WithNds(p_PriceNdsDis,StrToDate(p_DraftDate));
    if p_PriceNds = p_PriceNdsDis then
      vtSumNds.asFloat := Fround(p_PriceNds*p_Count,2)
    else vtSumNds.asFloat := Fround(p_PriceNdsDis*p_Count,2);
    vtNds.AsFloat := GetNds_WithNds(vtSumNds.asFloat,StrToDate(p_DraftDate));
    vtSumNoNds.AsFloat := GetNoNds_WithNds(vtSumNds.asFloat,StrToDate(p_DraftDate),2);
    vtPartName.AsString:=p_Part;
    vtShareActive.AsBoolean := p_Share;
    vtRequest.AsString := p_Request;
    vtRequestDate.AsDateTime := p_RequestDate;
    vt.Post;
  except on E:Exception do
    begin
      vt.Cancel;
      raise Exception.Create(TranslateText('Ошибка добавления позиции расходной накладной')+#13#10+E.Message);
    end;
  end;
end;
//==============================================================================
procedure TdmRashNakPrint.AddPosition(
            p_DovSer,
            p_DovNum: String;
            p_DovDate: TDateTime;
            p_DovWho,
            p_Name: String;
            p_Count: Integer;
            p_Price: Double;
            p_SummNDS: Double = 0
          );
begin
  try
    vt.Insert;
    vtDovSer.AsString := p_DovSer;
    vtDovNum.AsString := p_DovNum;
    vtDovDate.AsDateTime := p_DovDate;
    vtDovWho.AsString := p_DovWho;
    vtNpName.AsString := p_Name;
    vtCount.asFloat := p_Count;
    vtPriceNds.AsFloat :=  p_Price;
    vtPriceNoNds.asFloat := GetNoNds_WithNds(p_Price,p_DovDate);
    vtSumNds.asFloat := BoolTo_(p_Price>0,FRound(vtPriceNds.AsFloat*vtCount.AsFloat,2),FRound(p_SummNDS));
    vtNds.AsFloat :=  GetNds_WithNds(vtSumNds.asFloat,p_DovDate);
    vtSumNoNds.AsFloat := GetNoNds_WithNds(vtSumNds.asFloat,p_DovDate,2);
    vt.Post;
  except on E:Exception do
    begin
      vt.Cancel;
      raise Exception.Create(TranslateText('Ошибка добавления позиции расходной накладной')+#13#10+E.Message);
    end;
  end;
end;
//==============================================================================
procedure TdmRashNakPrint.AddPosition(
            p_CertName,
            p_NpName,
            p_PartName,
            p_Station,
            p_DimName: String;
            p_Count,
            p_CountWanted: Double;
            p_Price: Double
            );
begin
  try
    vt.Insert;
    vtCertName.AsString:=p_CertName;
    vtNpName.AsString := p_NpName;
    vtPartName.AsString := p_PartName;
    vtStation.AsString:= p_Station;
    vtDimName.AsString := p_DimName;
    vtCount.asFloat := p_Count;
    vtCountWanted.asFloat := p_CountWanted;
    vtPriceNds.AsFloat :=  p_Price;
    vtPriceNoNds.asFloat := GetNoNds_WithNds(p_Price,DocDate);
    vtSumNds.asFloat :=  FRound(vtPriceNds.AsFloat*vtCount.AsFloat,2);
    vtNds.AsFloat :=  GetNds_WithNds(vtSumNds.asFloat,DocDate);
    vtSumNoNds.AsFloat := GetNoNds_WithNds(vtSumNds.asFloat,DocDate,2);
    vt.Post;
  except on E:Exception do
    begin
      vt.Cancel;
      raise Exception.Create(TranslateText('Ошибка добавления позиции расходной накладной')+#13#10+E.Message);
    end;
  end;
end;
//==============================================================================
procedure TdmRashNakPrint.AddPosition(
  p_NpName:string;
  p_Talon5L,
  p_Talon10L,
  p_Talon20L,
  p_Talon50L: Integer
  );
begin
  try
    vt.Insert;
    vtNpName.AsString := p_NpName;
    vtTalon5L.AsInteger := p_Talon5L;
    vtTalon10L.AsInteger := p_Talon10L;
    vtTalon20L.AsInteger := p_Talon20L;
    vtTalon50L.AsInteger := p_Talon50L;
    vt.Post;
  except on E:Exception do
    begin
      vt.Cancel;
      raise Exception.Create(TranslateText('Ошибка добавления позиции расходной накладной')+#13#10+E.Message);
    end;
  end;
end;
//==============================================================================
procedure TdmRashNakPrint.DataModuleDestroy(Sender: TObject);
begin
  if vt.Active then vt.Close;
end;
//==============================================================================
procedure TdmRashNakPrint.SaveTo();
begin
  //
end;
//==============================================================================
procedure TdmRashNakPrint.PutToExcelCardRn();
var
  SumXNDS, Nds, SumNds: real;
  CurPos, BeginFilial, BeginAZS, BeginDate, BeginNpName, BeginPrintPage, i, iRowNumb: Integer;
  Filial_Name, AZS_Name, Draft_Date, Np_Name: String;
  strOrgName, strDepName: String;
  isWithPart:boolean;
begin
  try
    ProgressBar := TProgressBar.Create(Application);
    if UseLinkToOldBase then
    begin
      qDog.SQL.Text := qDogLink.SQL.Text;
      qRekv.SQL.Text := qRekvLink.SQL.Text;
    end;
    qDog.Close;
    qDog.ParamByName('ToId').asInteger := Self.iToId;
    qDog.ParamByName('ToInst').asInteger := Self.iToInst;
    qDog.ParamByName('FromId').asInteger := Self.iFromId;
    qDog.ParamByName('FromInst').asInteger := Self.iFromInst;
    
    if rnType = rnCardLS
      then qDog.ParamByName('LS').AsInteger := 1
      else qDog.ParamByName('LS').AsInteger := 0;

    _OpenQueryOra(qDog);
    if qDog.IsEmpty then
    begin
      strOrgName := GetOrgName(Self.iToId,  Self.iToInst);
      strDepName := GetOrgName(Self.iFromId, Self.iFromInst);
      raise Exception.Create(TranslateText('Договор между ')+strDepName+TranslateText(' и ')+strOrgName+TranslateText(' не существует'));
    end;
    with MSExcel do
    begin
      // выбрать первый лист
      List:=Main.MsExcel.ActiveWorkBook.Worksheets[1];
      Main.MsExcel.ActiveWorkBook.Worksheets[1].Select;
      Main.MsExcel.WorkSheets[1].Select;
      // реквизиты поставщика
      qRekv.Close;
      qRekv.ParamByName('Id').Value := Self.iFromId;
      qRekv.ParamByName('Inst').Value := Self.iFromInst;
      _OpenQueryOra(qRekv);
      if RnDest = rndClient then
        strPeriod :='';
      //исправляем надпись "НДС 20%, грн." на "НДС, грн."
      List.Cells[14, 'N'].Value :=LangText('NDS')+TranslateText(', грн.');
      
      List.Cells[2, 'D'].Value := qRekv.FieldByName('Name').asString;
      ExFormat(List,4, 'D',
        [qRekv.FieldByName('Svid_Num').asString]);
      ExFormat(List,5, 'D',
        [qRekv.FieldByName('Nal_Num').asString]);
      ExFormat(List,7, 'D',
        [Self.strNumber,FormatDateTime2('dd.mm.yyyy',Self.DocDate) + strPeriod]);
      ExFormat(List,8, 'F',
        [qDog.FieldByName('Dog').AsString,
         FormatDateTime2('dd.mm.yyyy',qDog.FieldByName('Dog_date').AsDateTime)+strByDoc]);
      // реквизиты получателя
      qRekv.Close;
      qRekv.ParamByName('Id').Value := Self.iToId;
      qRekv.ParamByName('Inst').Value := Self.iToInst;
      qRekv.Open;

      List.Cells[9, 'D'].Value := TranslateText('Кому: ') + qRekv.FieldByName('Name').asString;
      ExFormat(List,11, 'D',
        [qRekv.FieldByName('svid_num').AsString]);
      ExFormat(List,12, 'D',
        [qRekv.FieldByName('Nal_Num').AsString]);
      CurPos := 15;
      BeginFilial := 15;
      BeginAZS := 15;
      BeginDate := 15;
      BeginNpName := 15;
      BeginPrintPage := 15;
      SumXNDS := 0;
      NDS := 0;
      SumNDS := 0;
      isWithPart:=False;
      vt.First;
      ProgressBar.SetMaxValue(vt.RecordCount);
      while not vt.Eof do
      begin
        SumXNDS := SumXNDS + Fround(vtSumNoNds.AsFloat,2);
        NDS := NDS + Fround(vtNds.AsFloat,2);
        SumNDS := SumNDS + Fround(vtSumNds.asFloat,2);
        inc(iRowNumb);

        List.Cells[CurPos, 1] := iRowNumb;
        List.Cells[CurPos, 2] := vtDepartment.AsString;
        List.Cells[CurPos, 3] := vtAZS.AsString;
        List.Cells[CurPos, 4] := vtNpName.AsString;
        List.Cells[CurPos, 5] := vtPartName.AsString;
        if trim(vtPartName.AsString)<>'' then
          isWithPart:=true;
        List.Cells[CurPos, 6] := vtCardNumber.AsString;

        List.Cells[CurPos, 7] := vtRequest.AsString;
        List.Cells[CurPos, 8] := FormatDateTime2('dd.mm.yyyy',vtRequestDate.AsDateTime);

        List.Cells[CurPos, 9] := vtDraft.AsString;
        List.Cells[CurPos, 10] := vtDraftDate.asString;
        List.Cells[CurPos, 11] := vtDimName.AsString;
        List.Cells[CurPos, 12] := vtCount.asFloat;
        List.Cells[CurPos, 13] := vtPriceNoNds.asFloat;
        List.Cells[CurPos, 14] := vtPriceNoNdsDis.asFloat;
        List.Cells[CurPos, 15] := vtSumNoNds.AsFloat;
        List.Cells[CurPos, 16] := vtNds.AsFloat;
        List.Cells[CurPos, 17] := vtSumNds.AsFloat;
        Filial_Name := vtDepartment.AsString;
        Azs_name := vtAZS.AsString;
        Draft_Date := vtDraftDate.asString;
        Np_Name := vtNpName.AsString;
        vt.Next;
        //Корректировка под итоговые суммы
        if (vtDepartment.AsString <> Filial_Name) or (vtAzs.AsString <> Azs_Name) or (vt.Eof) then
        begin
          List.Cells[CurPos, 13+2] := List.Cells[CurPos, 13+2].value + GetNoNDS_WithNDS(SumNDS,vtDraftDate.AsDateTime,2) - SumXNDS;
          List.Cells[CurPos, 14+2] := List.Cells[CurPos, 14+2].value + GetNDS_WithNDS(SumNDS,vtDraftDate.AsDateTime,2) - NDS;
          SumXNds := SumNDS - GetNDS_WithNDS(SumNDS,vtDraftDate.AsDateTime,2);
          NDS := GetNDS_WithNDS(SumNDS,vtDraftDate.AsDateTime,2);
        end;
        ProgressBar.Step;
        Inc(CurPos);


        if not Options.WithRequest then
        begin
          If (vtAzs.AsString <> Azs_Name) or (vt.Eof) then
          begin
            List.Rows[CurPos].Font.Bold := True;
            List.Cells[CurPos, ExcelNumberToColumn(2)].Value := LangText('Itogo') + TranslateText(' по ') + Azs_Name;
            List.Cells[CurPos, ExcelNumberToColumn(10+2)].Value := format('=SubTotal(9,%s%d:%s%d)',[ExcelNumberToColumn(10+2),BeginAZS,ExcelNumberToColumn(10+2),CurPos - 1]);
            List.Cells[CurPos, ExcelNumberToColumn(13+2)].Value := format('=SubTotal(9,%s%d:%s%d)',[ExcelNumberToColumn(13+2),BeginAZS,ExcelNumberToColumn(13+2),CurPos - 1]);
            List.Cells[CurPos, ExcelNumberToColumn(14+2)].Value := format('=SubTotal(9,%s%d:%s%d)',[ExcelNumberToColumn(14+2),BeginAZS,ExcelNumberToColumn(14+2),CurPos - 1]);
            List.Cells[CurPos, ExcelNumberToColumn(15+2)].Value := format('=SubTotal(9,%s%d:%s%d)',[ExcelNumberToColumn(15+2),BeginAZS,ExcelNumberToColumn(15+2),CurPos - 1]);
            Inc(CurPos);
            BeginAZS := CurPos;
          end;
          If (vtDepartment.AsString <> Filial_Name) or (vt.Eof) then
          begin
            List.Rows[CurPos].Font.Bold := True;
            List.Cells[CurPos, ExcelNumberToColumn(2)].Value := LangText('Itogo') + TranslateText(' по ') + Filial_Name;
            List.Cells[CurPos, ExcelNumberToColumn(10+2)].Value := format('=SubTotal(9,%s%d:%s%d)',[ExcelNumberToColumn(10+2),BeginFilial,ExcelNumberToColumn(10+2),CurPos - 1]);
            List.Cells[CurPos, ExcelNumberToColumn(13+2)].Value := format('=SubTotal(9,%s%d:%s%d)',[ExcelNumberToColumn(13+2),BeginFilial,ExcelNumberToColumn(13+2),CurPos - 1]);
            List.Cells[CurPos, ExcelNumberToColumn(14+2)].Value := format('=SubTotal(9,%s%d:%s%d)',[ExcelNumberToColumn(14+2),BeginFilial,ExcelNumberToColumn(14+2),CurPos - 1]);
            List.Cells[CurPos, ExcelNumberToColumn(15+2)].Value := format('=SubTotal(9,%s%d:%s%d)',[ExcelNumberToColumn(15+2),BeginFilial,ExcelNumberToColumn(15+2),CurPos - 1]);
            Inc(CurPos);
            BeginAZS := CurPos;
            BeginFilial := CurPos;
          end;
        end;
        if Options.WithRequest then
        begin
          If (vtNpName.AsString <> Np_Name) or (vt.Eof) or (vtDraftDate.AsString <> Draft_Date) then
          begin
            List.Rows[CurPos].Font.Bold := True;
            List.Cells[CurPos, ExcelNumberToColumn(4)].HorizontalAlignment := xlright;
            List.Cells[CurPos, ExcelNumberToColumn(4)].Value := LangText('Itogo') + TranslateText(' по ') + Np_Name;
            List.Cells[CurPos, ExcelNumberToColumn(10+2)].Value := format('=SubTotal(9,%s%d:%s%d)',[ExcelNumberToColumn(10+2),BeginNpName,ExcelNumberToColumn(10+2),CurPos - 1]);
            List.Cells[CurPos, ExcelNumberToColumn(13+2)].Value := format('=SubTotal(9,%s%d:%s%d)',[ExcelNumberToColumn(13+2),BeginNpName,ExcelNumberToColumn(13+2),CurPos - 1]);
            List.Cells[CurPos, ExcelNumberToColumn(14+2)].Value := format('=SubTotal(9,%s%d:%s%d)',[ExcelNumberToColumn(14+2),BeginNpName,ExcelNumberToColumn(14+2),CurPos - 1]);
            List.Cells[CurPos, ExcelNumberToColumn(15+2)].Value := format('=SubTotal(9,%s%d:%s%d)',[ExcelNumberToColumn(15+2),BeginNpName,ExcelNumberToColumn(15+2),CurPos - 1]);
            Inc(CurPos);
            BeginNpName := CurPos;
          end;
          If (vtDraftDate.AsString <> Draft_Date) or (vt.Eof) then
          begin
            List.Rows[CurPos].Font.Bold := True;
            List.Cells[CurPos, ExcelNumberToColumn(10)].HorizontalAlignment := xlright;
            List.Cells[CurPos, ExcelNumberToColumn(10)].Value := LangText('Itogo') + TranslateText(' по ') + Draft_Date;
            List.Cells[CurPos, ExcelNumberToColumn(10+2)].Value := format('=SubTotal(9,%s%d:%s%d)',[ExcelNumberToColumn(10+2),BeginDate,ExcelNumberToColumn(10+2),CurPos - 1]);
            List.Cells[CurPos, ExcelNumberToColumn(13+2)].Value := format('=SubTotal(9,%s%d:%s%d)',[ExcelNumberToColumn(13+2),BeginDate,ExcelNumberToColumn(13+2),CurPos - 1]);
            List.Cells[CurPos, ExcelNumberToColumn(14+2)].Value := format('=SubTotal(9,%s%d:%s%d)',[ExcelNumberToColumn(14+2),BeginDate,ExcelNumberToColumn(14+2),CurPos - 1]);
            List.Cells[CurPos, ExcelNumberToColumn(15+2)].Value := format('=SubTotal(9,%s%d:%s%d)',[ExcelNumberToColumn(15+2),BeginDate,ExcelNumberToColumn(15+2),CurPos - 1]);
            Inc(CurPos);
            BeginNpName := CurPos;
            BeginDate := CurPos;
          end;
        end;
      end; // while
      
      // акція
      if vtShareActive.AsBoolean then
      begin
        List.Columns[ExcelNumberToColumn(11+2)].Hidden := true;
        List.Columns[ExcelNumberToColumn(12+2)].Hidden := true;
        List.Columns[ExcelNumberToColumn(13+2)].Hidden := true;
        List.Columns[ExcelNumberToColumn(14+2)].Hidden := true;
        List.Columns[ExcelNumberToColumn(15+2)].Hidden := true;
      end;

      List.Rows[CurPos].Font.Bold := True;
      List.Cells[CurPos, ExcelNumberToColumn(2)].Value := TranslateText('Всего по документу') ;
      List.Cells[CurPos, ExcelNumberToColumn(2)].HorizontalAlignment := xlleft;
      List.Cells[CurPos, ExcelNumberToColumn(10+2)].Value := format('=SubTotal(9,%s15:%0:s%d)',[ExcelNumberToColumn(10+2),CurPos - 1]);
      List.Cells[CurPos, ExcelNumberToColumn(13+2)].Value := format('=SubTotal(9,%s15:%0:s%d)',[ExcelNumberToColumn(13+2),CurPos - 1]);
      List.Cells[CurPos, ExcelNumberToColumn(14+2)].Value := format('=SubTotal(9,%s15:%0:s%d)',[ExcelNumberToColumn(14+2),CurPos - 1]);
      List.Cells[CurPos, ExcelNumberToColumn(15+2)].Value := format('=SubTotal(9,%s15:%0:s%d)',[ExcelNumberToColumn(15+2),CurPos - 1]);
      List.Range['A' + IntToStr(BeginPrintPage) + ':'+ExcelNumberToColumn(15+2) + IntToStr(CurPos)].Borders.LineStyle := xlContinuous;
      List.Cells[CurPos + 2, 'B'].Value := LangText('Obschaya')+LangText('Sum')+ LangText('S_NDS')+': ' + NumStrGrn(FRound(List.Cells[CurPos, ExcelNumberToColumn(15+2)].Value, 2), TranslateText('грн'), TranslateText('коп'));
      List.PageSetup.LeftFooter := '&11' + MANAGER_SHIP + ' ____________________' + #10#10#10 + LangText('Otpustil') + '____________________' + #10;
      List.PageSetup.RightFooter := '&11' + BUH_SHIP + ' ____________________' + #10#10#10 + LangText('Polychil') + '____________________' + #10;

      // якщо є скидка, то виводимо необхідне нам поле
      if (rnType = rnCardLS) and (vtPriceNoNds.asFloat <> vtPriceNoNdsDis.asFloat) then
        List.Columns[12+2].EntireColumn.Hidden := false
      else List.Columns[12+2].EntireColumn.Hidden := true;
      List.Columns[5].EntireColumn.Hidden:=( not isWithPart );
      List.Columns[7].EntireColumn.Hidden:=( not Options.WithRequest);
      List.Columns[8].EntireColumn.Hidden:=( not Options.WithRequest);            
      // обработка типов вывода экселя
      if OutputType=1 then for i:=1 to NumOfCopy do
          List.PrintOut();
      // нах
      ProgressBar.Free();
    end; // with
  except on E:Exception do
    begin
      ProgressBar.Free();
      raise Exception.Create(TranslateText('Ошибка формирования документа')+#13#10+E.Message);
    end;
  end;
end;
//==============================================================================
procedure TdmRashNakPrint.PutToExcelCardBlank();
var
  ProgressBar: TProgressBar;
begin
  ProgressBar := TProgressBar.Create(Application);
  try
    ProgressBar.SetMaxValue(5);
    try
      if OleConnect('Word.Application',MsWord) Then
      begin
        qReport.Close;
        qReport.ParamByName('OrgId').asInteger := iToId;
        qReport.ParamByName('OrgInst').asInteger := iToInst;
        qReport.Open;
        ProgressBar.Step();
        MsWordDocAdd('RnCardPrice');
        Range := MsWord.Documents.Item(1).Range;
        SetCurField(True, qReport.FieldByName('From_Name').asString);
        if PRINT_RN_FILIAL_CT = 'N' then
        begin
          SetCurField(True, qReport.FieldByName('From_Svid_Num').asString);
          SetCurField(True, qReport.FieldByName('From_Nal_Num').asString);
        end
        else
        begin
          qWork.Close;
          qWork.SQL.Text:=' select name, svid_num, nal_num from v_oil_org where id=:id_ and inst=:inst_';
          qWork.ParamByName('id_').AsInteger := MAIN_PAR;
          qWork.ParamByName('inst_').AsInteger := MAIN_PAR_INST;
          qWork.Open;
          SetCurField(True, qWork.FieldByName('Svid_Num').AsString);
          SetCurField(True, qWork.FieldByName('Nal_Num').AsString);
          qWork.Close;
        end;
        ProgressBar.Step();
        SetCurField(True, strNumber);
        SetCurField(True, DateToStr(DocDate));
        SetCurField(True, qReport.FieldByName('To_Name').asString);
        if qReport.FieldByName('to_face').asInteger = 0 then
        begin
          SetCurField(True, LangText('SvidPlatNDC2') + '№ ' + qReport.FieldByName('To_Svid_Num').asString);
          SetCurField(True, LangText('NalNum_UrLic') + qReport.FieldByName('To_Nal_Num').asString);
        end
        else
        begin
          SetCurField(True, LangText('NalNum') + qReport.FieldByName('To_OKPO').AsString);
          SetCurField(True, LangText('Pasport') + qReport.FieldByName('Passp_ser').AsString + ' № ' + qReport.FieldByName('Passp_num').asString);
        end;
         SetCurField(True, nvl(qReport.FieldByName('Dog').AsVariant, ''));
        SetCurField(True, nvl(qReport.FieldByName('Dog_Date').AsVariant, ''));
        ProgressBar.Step();
        SetCurField(True, vtDovSer.AsString);
        SetCurField(True, vtDovNum.AsString);
        SetCurField(True, vtDovDate.AsString);
        SetCurField(True, vtDovWho.AsString);
        SetCurField(False, '');
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.NextCell;
        SetCurField(True, vtNpName.asString);
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.Insert(vtCount.asString);
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.Insert(BoolTo_(vtPriceNoNds.asFloat=0,'',FloatToStrF(vtPriceNoNds.asFloat,ffFixed,15,3)));  //ціна
        ProgressBar.Step();
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.Insert(FloatToStrF(vtSumNoNds.asFloat,ffFixed,15,2));    //сума без пдв
        MsWord.WordBasic.NextCell;
        SetCurField(True, FloatToStr(TAX_RATE(DocDate)*100) + '%');               //пдв [%]
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.Insert( FloatToStrF(vtNds.AsFloat,ffFixed,15,2));        //пдв [грн]
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.NextCell;
        MsWord.WordBasic.Insert( FloatToStrF(vtSumNds.asFloat,ffFixed,15,2));     //сума з пдв
        SetCurField(True, NumStrGrn(vtSumNds.asFloat, TranslateText('грн.'),TranslateText('коп.')));
        ProgressBar.Step();
        MsWord.Visible := True;
        MsWord := UnAssigned;
      end;
    except on E: Exception do
      begin
        ShowMessage(TranslateText('ОШИБКА: ')+E.Message);
        MsWord := UnAssigned;
      end;
    end;
  finally
    ProgressBar.Free;
  end;
end;
//==============================================================================
procedure TdmRashNakPrint.PutToExcelNbRn();
const
  StartPos = 19;
var
  SumXNDS, Nds, SumNds: real;
  CurPos, i,RecPos: Integer;
  koma,CertNameListTxt: String;
  CertNameList: TStringList;
  vFrom, vTo: TOilQuery;
  PAR_ID, PAR_INST: integer;
begin
  CertNameList := TStringList.Create;
  vFrom := TOilQuery.Create(nil);
  vTo := TOilQuery.Create(nil);
  try
    ProgressBar := TProgressBar.Create(Application);
    with MSExcel do
    begin
      // выбрать первый лист
      List := Main.MsExcel.ActiveWorkBook.Worksheets[1];
      Main.MsExcel.ActiveWorkBook.Worksheets[1].Select;
      Main.MsExcel.WorkSheets[1].Select;
      begin // заполнение шапки
        vt.First;
        While not(vt.Eof)do
        begin
          if(CertNameList.IndexOf(vtCertName.AsString)=-1)then
            CertNameList.Add(vtCertName.AsString);
          vt.Next;
        end;
        koma := '';
        for i := 0 to CertNameList.count - 1 do
          if Trim(CertNameList[i]) <> '' then
          begin
            CertNameListTxt := CertNameListTxt+koma+CertNameList[i];
            koma:=',';
          end;
        // реквизиты поставщика
        GetOrgData(vFrom, Self.iFromId, Self.iFromInst);
        if (vFrom.FieldByName('org_id').AsInteger = 3) and (PRINT_RN_FILIAL = 'Y') then
        begin
          PAR_ID := vFrom.FieldByName('par').AsInteger;
          PAR_INST := vFrom.FieldByName('par_inst').AsInteger;
          GetOrgData(vFrom, PAR_ID, PAR_INST);
        end;
        List.Cells[1, 'A'].Value  := vFrom.FieldByName('Name').asString; // название Орг от кого
        List.Cells[9, 'B'].Value  := vFrom.FieldByName('rn_through').AsString; // через кого
        List.Cells[18, 'B'].Value := vtStation.AsString; // станция

        ExFormat(List, 'A4',  [Self.strNumber, DateToStr(Self.DocDate)]); // реквизиты расходной
        ExFormat(List, 'B10', [DogName, FormatDateTime2('dd.mm.yyyy', DogDate)]); // основание
        ExFormat(List, 'B11', [ZdnList]); // жд накладные
        ExFormat(List, 'B12', [TankWagonList]); // цыстерны

        if trim(CertNameListTxt) = '' then ExFormat(List, 'A14', ['...'])
        else ExFormat(List, 'A14', [CertNameListTxt]); // цыстерны

        // реквизиты получателя
        GetOrgData(vTo, Self.iToId, Self.iToInst);
        List.Cells[8, 'B'].Value := vTo.FieldByName('Name').asString; // название орг кому
      end;
      // Заполнение табличной части
      CurPos := StartPos;
      SumXNDS := 0;
      NDS := 0;
      SumNDS := 0;
      RecPos:=1;
      vt.First;
      ProgressBar.SetMaxValue(vt.RecordCount);
      while not vt.Eof do
      begin
        SumXNDS := SumXNDS + Fround(vtSumNoNds.AsFloat,2);
        NDS := NDS + Fround(vtNds.AsFloat,2);
        SumNDS := SumNDS + Fround(vtSumNds.asFloat,2);
        List.Cells[CurPos, 1] := RecPos;
        List.Cells[CurPos, 2] := vtNpName.AsString;
        List.Cells[CurPos+1, 2] := '('+vtPartName.AsString+')';
        List.Cells[CurPos, 3] := vtDimName.AsString;
        if CurPos = StartPos then
        begin
          List.Cells[CurPos, 4]:=  vtCountWanted.AsFloat;
          List.Cells[CurPos, 4].NumberFormat := '0,000';
        end;
        List.Cells[CurPos, 5] := vtCount.asFloat;
        List.Cells[CurPos, 5].NumberFormat := '0,000';
        List.Cells[CurPos, 6] := vtPriceNds.asFloat;
        List.Cells[CurPos, 6].NumberFormat := '0,0000';
        List.Cells[CurPos, 7] := vtSumNds.AsFloat;
        List.Cells[CurPos, 7].NumberFormat := '0,00';
        inc(RecPos);
        vt.Next;
        ProgressBar.Step;
        Inc(CurPos,2);
      end;
      List.Rows[CurPos].Font.Bold := True;
      DrawNetInExcel(List,1,7,19,CurPos);
      List.Cells[CurPos,   'B'].Value := LangText('Obschaya')+' ' +LangText('Sum');
      List.Cells[CurPos,   'G'].Value := '=SubTotal(9,G19:G' + IntToStr(CurPos - 2) + ')';
      List.Cells[CurPos,   'G'].NumberFormat := '0,00';
      List.Cells[CurPos+2, 'A'].Value  := LangText('Obschaya')+' '+LangText('Sum')+' '+LangText('Propisu')+' : '+NumStrGrn(List.Cells[CurPos, 'G'].Value, TranslateText('грн'), TranslateText('коп'));
      List.Cells[CurPos+4, 'A'].Value  := MANAGER_SHIP+' _______________________';
      List.Cells[CurPos+4, 'E'].Value  := BUH_SHIP + ' ___________________';
      List.Cells[CurPos+6, 'A'].Value  := LangText('Otpustil')+' _______________________';
      List.Cells[CurPos+6, 'E'].Value  := LangText('Polychil')+' ____________________________';
      // обработка типов вывода экселя
      if OutputType=1 then for i:=1 to NumOfCopy do List.PrintOut();
      ProgressBar.Free();
      CertNameList.Free;
    end; // with
  except on E:Exception do
    begin
      ProgressBar.Free();
      CertNameList.Free;
      raise Exception.Create(TranslateText('Ошибка формирования документа')+#13#10+E.Message);
    end;
  end;
  vFrom.Free;
  vTo.Free;
end;
//==============================================================================
procedure TdmRashNakPrint.PutToExcelTalonRn();
const
  StartPos = 22;
var
  SumXNDS, Nds, SumNds: real;
  CurPos, i, cnt: Integer;
  qParent:TOilQuery;
begin
  try
    ProgressBar := TProgressBar.Create(Application);
    with MSExcel do
    begin
      // выбрать первый лист
      List:=Main.MsExcel.ActiveWorkBook.Worksheets[1];
      Main.MsExcel.ActiveWorkBook.Worksheets[1].Select;
      Main.MsExcel.WorkSheets[1].Select;
      begin // заполнение шапки
        // реквизиты поставщика
        qRekv.Close;
        if(PRINT_RN_FILIAL_CT = 'Y' )then
        begin
          qParent := TOilQuery.Create(nil);
          try
            GetOrgData(qParent, Self.iFromId, Self.iFromInst);
            if qParent['org_id']=3 then
              _OpenQueryPar(qRekv,
                ['id',qParent['par'],
                 'inst',qParent['par_inst']]);
          finally
            qParent.Free;
          end;
        end;
        if qRekv.Active=false then
          _OpenQueryPar(qRekv,
            ['id',Self.iFromId,
             'inst',Self.iFromInst]);

        List.Activate;
        List.Cells[1, 'C'] := qRekv.FieldByName('Name').AsString;
        ExFormat(List,2,2,[
          qRekv.FieldByName('Addr').AsString]);
        ExFormat(List,3,3,[
          qRekv.FieldByName('Rach_Chet').AsString,
          qRekv.FieldByName('MFO').AsString]);
        ExFormat(List,4,2,[
          qRekv.FieldByName('Svid_Num').AsString]);
        ExFormat(List,5,2,[
          qRekv.FieldByName('Nal_Num').AsString]);
        ExFormat(List,7,2,[
          strNumber,
          FormatDateTime('dd.mm.yyyy', DocDate)]);
        // реквизиты получателя
        qRekv.Close;
        qRekv.ParamByName('Id').Value := Self.iToId;
        qRekv.ParamByName('Inst').Value := Self.iToInst;
        qRekv.Open;
        List.Cells[10, 3] := qRekv.FieldByName('Name').AsString;
        ExFormat(List,13,'B',[
          qRekv.FieldByName('Svid_Num').AsString]);
        ExFormat(List,14,'B',[
          qRekv.FieldByName('Nal_Num').AsString]);
        List.Cells[15, 'B'] := strByDoc;
        // Выискиваем довереность
        vt.First;
        while not(vt.eof) do
        begin
          if vtDovWho.AsString<>'' then
          begin
            List.Cells[17, 'B'] :=Format(
              LangText('Doverenost')+' %s №%s '+LangText('Ot')+TranslateText(' %s через %s'),
              [vtDovSer.AsString,
               vtDovNum.AsString,
               FormatDateTime('dd.mm.yyyy',vtDovDate.AsDateTime),
               vtDovWho.AsString
               ]);
            vt.Last;
          end;
          vt.Next;
        end;
      end;
      // Заполнение табличной части
      CurPos := StartPos;
      SumXNDS := 0;
      NDS := 0;
      SumNDS := 0;
      vt.First;
      ProgressBar.SetMaxValue(vt.RecordCount);
      while not (vtCount.AsFloat=0) do
      begin
        List.Rows[CurPos].HorizontalAlignment := xlRight;
        List.Cells[CurPos, 'B'] := vtNPName.AsString;
        List.Cells[CurPos, 'C'] := LangText('Litr');
        List.Cells[CurPos, 'D'] := vtCount.AsFloat;
        List.Cells[CurPos, 'E'] := vtPriceNoNds.AsFloat;
        List.Cells[CurPos, 'F'] := vtSumNoNds.AsFloat;
        SumXNDS := SumXNDS + Fround(vtSumNoNds.AsFloat,2);
        NDS := NDS + Fround(vtNds.AsFloat,2);
        SumNDS := SumNDS + Fround(vtSumNds.asFloat,2);
        vt.Next;
        Inc(CurPos);
        ProgressBar.Step;
      end;
      //итого по табличной части
      //!!! Ведеться расчет от суммы с НДС
      Dec(CurPos);
      vt.Prior;
        //Последняя строка
      List.Cells[CurPos, 'F']:=vtSumNoNds.AsFloat
        +SumNDS-GetNds_WithNds(SumNds,DocDate)-SumXNDS;
      Inc(CurPos,2);
      vt.Next;
        //Без НДС
      List.Cells[CurPos, 2] := LangText('Itogo');
      List.Cells[CurPos, 'F'] := GetNoNds_WithNds(SumNds,DocDate,2);
      Inc(CurPos);
        //НДС
      List.Cells[CurPos, 'B'] := LangText('NDS');
      List.Cells[CurPos, 'F'] := GetNds_WithNds(SumNds,DocDate);
      Inc(CurPos);
        //Всего
      List.Cells[CurPos, 'B'] := LangText('Vsego');
      List.Cells[CurPos, 'F'] := SumNDS;
      List.Range['B19:F' + IntToStr(CurPos)].Borders.LineStyle := xlContinuous;
      Inc(CurPos, 2);
      List.Cells[CurPos, 'B'] := LangText('Propisu')+': ' + OilStd.NumStrGrn(SumNDS, TranslateText('грн.'), TranslateText('коп.'));
      Inc(CurPos, 3);
      List.Cells[CurPos, 'B'].Value := LangText('Kolichestvo_talonov_po_otchety');
      List.Rows[CurPos].HorizontalAlignment := xlCenter ;
      List.Range['B' + IntToStr(CurPos) + ':G' + IntToStr(CurPos)].Merge;
      Inc(CurPos);
      // Таблица талонов сгрупированых по типам НП и номиналам
      List.Cells[CurPos, 'B'].Value := LangText('Vid_GSM');
      List.Cells[CurPos, 'C'].Value := TranslateText('Ном 5');
      List.Cells[CurPos, 'D'].Value := TranslateText('Ном 10');
      List.Cells[CurPos, 'E'].Value := TranslateText('Ном 20');
      List.Cells[CurPos, 'F'].Value := TranslateText('Ном 50');
      List.Cells[CurPos, 'G'].Value := LangText('Vsego');
      Inc(CurPos);
      cnt:=0;
      while not vt.Eof do
      begin
        List.Cells[CurPos, 'B'].Value := vtNPName.AsString;
        List.Range['B' + IntToStr(CurPos) + ':G' + IntToStr(CurPos)].NumberFormat := '0';
        List.Cells[CurPos, 'C'].Value := vtTalon5L.AsInteger;
        List.Cells[CurPos, 'D'].Value := vtTalon10L.AsInteger;
        List.Cells[CurPos, 'E'].Value := vtTalon20L.AsInteger;
        List.Cells[CurPos, 'F'].Value := vtTalon50L.AsInteger;
        List.Cells[CurPos, 'G'].FormulaR1C1 := '=RC[-1] + RC[-2] + RC[-3] + RC[-4]';
        Inc(CurPos);Inc(cnt);
        vt.Next;
      end;
      //итого по таблице талонов сгрупированых по типам НП и номиналам
      List.Cells[CurPos, 'B'].Value := LangText('Itogo');
      List.Range['B' + IntToStr(CurPos) + ':G' + IntToStr(CurPos)].NumberFormat := '0';
      List.Cells[CurPos, 'C'].FormulaR1C1 := '=SubTotal(9, R[-' + IntToStr(cnt) + ']C:R[-1]C)';
      List.Cells[CurPos, 'D'].FormulaR1C1 := '=SubTotal(9, R[-' + IntToStr(cnt) + ']C:R[-1]C)';
      List.Cells[CurPos, 'E'].FormulaR1C1 := '=SubTotal(9, R[-' + IntToStr(cnt) + ']C:R[-1]C)';
      List.Cells[CurPos, 'F'].FormulaR1C1 := '=SubTotal(9, R[-' + IntToStr(cnt) + ']C:R[-1]C)';
      List.Cells[CurPos, 'G'].FormulaR1C1 := '=RC[-1] + RC[-2] + RC[-3] + RC[-4]';
      List.Range['B' + IntToStr(CurPos - cnt - 2) + ':G' + IntToStr(CurPos)].Borders.LineStyle := xlContinuous;

      //Низа
      Inc(CurPos, 2);
      List.Cells[CurPos, 'B'].Value := LangText('Rasshifrovka_kartochek_po_nominaly_prilagaetsia_na_n_listah');
      Inc(CurPos, 4);
      List.Cells[CurPos, 'B'].Value := MANAGER_SHIP+' __________________                 ' + BUH_SHIP + ' _______________';
      Inc(CurPos, 4);
      List.Cells[CurPos, 'B'].Value := LangText('Otpustil')+' __________________                  '+LangText('Polychil')+' ________________________';
      // обработка типов вывода экселя
      if OutputType=1 then
        for i:=1 to NumOfCopy do
          List.PrintOut()
      else if OutputType=0 then
        MSExcel.Show;
      // нах
      ProgressBar.Free();
    end; // with
  except on E:Exception do
    begin
      ProgressBar.Free();
      raise Exception.Create(TranslateText('Ошибка формирования документа')+#13#10+E.Message);
    end;
  end;
end;
//==============================================================================
procedure TdmRashNakPrint.PutToExcel(
            p_OutputType: Integer;
            p_FileName: String = '';
            p_NeedSave: Boolean = false;
            p_NumOfCopy: Integer = 1;
            p_WithSignPagely: Boolean = false
          );
begin
  OutputType := p_OutputType;
  FileName := p_FileName;
  NeedSave := p_NeedSave;
  NumOfCopy := p_NumOfCopy;
  WithSignPagely := p_WithSignPagely;  // Підписи на кожній сторінці ВН.
  case rnType of
    rnCardAdd,rnCardEK,rnCardLS:
      begin
        MSExcel := TMSExcel.Create('CardRN');
        try
          PutToExcelCardRn();
          if rnType = rnCardAdd  then
            PutToExcelCardRnAdd();
          if OutputType = 0 then
            MSExcel.Show;
          if NeedSave then
          begin
            strDirName := MSExcel.GetDirName(FileName,'',self.strPeriod,self.iToId, iToInst);
            MsExcel.SaveAs(strDirName + 'RashNak_' + StrToValid(strNumber+'_'+DateToStr(DocDate)) +'.xls');
          end;
        finally
          MSExcel.Free;
        end;
      end;
    rnCardBlank:
      PutToExcelCardBlank();
    rnNB:
      PutToExcelNbRn();
    rnTalon:
      begin
        MSExcel := TMSExcel.Create('TalonRasNakl');
        try
          PutToExcelTalonRn();
        finally
          MSExcel.Free;
        end;
      end;
  end;
end;
//==============================================================================
procedure TdmRashNakPrint.SaveBD(p_SourceId,p_SourceInst, p_CurrId, p_TableId : Integer);
var
  iId: integer;
  DovDate: Variant;
begin
  try
    if (p_SourceId<=0) or (p_SourceInst<=0) then
      raise Exception.Create(TranslateText('Не указаны параметры источника РН '));
    if fAllowSave() then
    begin
      if (p_CurrId <= 0) then
        iId := GetSeqNextVal('s_oil_rash_nak')
      else
        iId := p_CurrId;

      if vtDovDate.AsDateTime = 0 then
        DovDate := null
      else
        DovDate := vtDovDate.AsDateTime;

      _ExecProc('OIL.INSORUPDOIL_RASH_NAK',
           ['ID#',           iId,
            'INST#',         MAIN_ORG.INST,
            'STATE#',        'Y',
            'SOURCE_ID#',     p_SourceId,
            'SOURCE_INST#',   p_SourceInst,
            'DOV_SER#',       vtDovSer.asString,
            'DOV_NUM#',       vtDovNum.asString,
            'DOV_DATE#',      DovDate,
            'DOV_WHO#',       vtDovWho.asString,
            'VAR_NUMBER#',    vtPriceNds.asInteger,
            'VAR_TEXT#',      strNumber,
            'VAR_DATE#',      DocDate ,
            'RASH_NAK_TYPE#', p_TableId
           ],TRUE);
    end
    else
      raise Exception.Create(TranslateText('Операция не возможна, т.к. не определены позиции РН'));
  except on E:Exception do
    raise Exception.Create(TranslateText('Ошибка записи в БД')+#13#10+E.Message);
  end
end;
//==============================================================================
procedure TdmRashNakPrint.EmptyMt;
begin
  if vt.Active then vt.Close;
  vt.EmptyTable;
  vt.Open;
end;
//==============================================================================
procedure TdmRashNakPrint.PutToExcelCardRnAdd;
var
  CurPos,i, BeginFilial, BeginAZS: integer;
  SumXNDS, NDS, SumNdS: Double;
  filial_Name, azs_name: string;
begin
  try
    with MSExcel do
    begin
      // выбрать второй лист
      List:=Main.MsExcel.ActiveWorkBook.Worksheets[2];
      Main.MsExcel.ActiveWorkBook.Worksheets[2].Select;
      Main.MsExcel.WorkSheets[2].Select;
      vt.First;
      // Заполнение таблицы
      CurPos := 15;
      BeginFilial := 15;
      BeginAZS := 15;
      SumXNDS := 0;
      NDS := 0;
      SumNDS := 0;
      vt.First;
      // ProgressBar.SetMaxValue(vt.RecordCount);
      while not vt.Eof do
      begin
        SumXNDS := SumXNDS + Fround(vtSumNoNds.AsFloat,2);
        NDS := NDS + Fround(vtNds.AsFloat,2);
        SumNDS := SumNDS + Fround(vtSumNds.asFloat,2);
        List.Cells[CurPos, 1] := vt.RecNo;
        List.Cells[CurPos, 2] := vtNpName.AsString;
        List.Cells[CurPos, 3] := vtDepartment.AsString+' '+vtAZS.AsString;
        List.Cells[CurPos, 4] := vtCardNumber.AsString;
        List.Cells[CurPos, 5] := vtDraft.AsString;
        List.Cells[CurPos, 6] := vtDraftDate.asString;
        List.Cells[CurPos, 7] := vtDimName.AsString;
        List.Cells[CurPos, 8] := vtCount.asFloat;
        List.Cells[CurPos, 9] := vtPriceNoNds.asFloat;
        List.Cells[CurPos, 10] := vtSumNoNds.AsFloat;
        List.Cells[CurPos, 11] := vtNds.AsFloat;
        List.Cells[CurPos, 12] := vtSumNds.AsFloat;
        Filial_Name := vtDepartment.AsString;
        Azs_name := vtAZS.AsString;
        vt.Next;

        if (vtDepartment.AsString <> Filial_Name) or (vtAzs.AsString <> Azs_Name) or (vt.Eof) then
        begin
          List.Cells[CurPos, 10] := List.Cells[CurPos, 10].value + (SumNDS - Mround(SumNDS*TAX_RATE(StrToDate(qDog.FieldByName('Dog_Date').asString))/(1+TAX_RATE(StrToDate(qDog.FieldByName('Dog_Date').asString))),2)) - SumXNDS;
          List.Cells[CurPos, 11] := List.Cells[CurPos, 11].value +  Mround(SumNDS*TAX_RATE(StrToDate(qDog.FieldByName('Dog_Date').asString))/(1+TAX_RATE(StrToDate(qDog.FieldByName('Dog_Date').asString))),2) - NDS;
          SumXNds := SumNDS - Mround(SumNDS*TAX_RATE(StrToDate(qDog.FieldByName('Dog_Date').asString))/(1+TAX_RATE(StrToDate(qDog.FieldByName('Dog_Date').asString))),2);
          NDS := Mround(SumNDS*TAX_RATE(StrToDate(qDog.FieldByName('Dog_Date').asString))/(1+TAX_RATE(StrToDate(qDog.FieldByName('Dog_Date').asString))),2);
        end;
        // ProgressBar.Step;
        Inc(CurPos);
        If  (vtAzs.AsString <> Azs_Name) or (vt.Eof) then
        begin
          List.Rows[CurPos].Font.Bold := True;
          List.Cells[CurPos, 'A'].Value := LangText('Itogo')+TranslateText(' по ') + Azs_Name;
          List.Cells[CurPos, 'H'].Value := '=SubTotal(9,H' + IntToStr(BeginAZS)+ ':H' + IntToStr(CurPos - 1) + ')';
          List.Cells[CurPos, 'J'].Value := '=SubTotal(9,J' + IntToStr(BeginAZS)+ ':J' + IntToStr(CurPos - 1) + ')';
          List.Cells[CurPos, 'K'].Value := '=SubTotal(9,K' + IntToStr(BeginAZS)+ ':K' + IntToStr(CurPos - 1) + ')';
          List.Cells[CurPos, 'L'].Value := '=SubTotal(9,L' + IntToStr(BeginAZS)+ ':L' + IntToStr(CurPos - 1) + ')';
          Inc(CurPos);
          BeginAZS := CurPos;
        end;
        If (vtDepartment.AsString <> Filial_Name) or (vt.Eof) then
        begin
          List.Rows[CurPos].Font.Bold := True;
          List.Cells[CurPos, 'A'].Value := LangText('Itogo')+TranslateText(' по ') + Filial_Name;
          List.Cells[CurPos, 'H'].Value := '=SubTotal(9,H' + IntToStr(BeginFilial)+ ':H' + IntToStr(CurPos - 1) + ')';
          List.Cells[CurPos, 'J'].Value := '=SubTotal(9,J' + IntToStr(BeginFilial)+ ':J' + IntToStr(CurPos - 1) + ')';
          List.Cells[CurPos, 'K'].Value := '=SubTotal(9,K' + IntToStr(BeginFilial)+ ':K' + IntToStr(CurPos - 1) + ')';
          List.Cells[CurPos, 'L'].Value := '=SubTotal(9,L' + IntToStr(BeginFilial)+ ':L' + IntToStr(CurPos - 1) + ')';
          Inc(CurPos);
          BeginAZS := CurPos;
          BeginFilial := CurPos;
        end;
      end; // while
      List.Rows[CurPos].Font.Bold := True;
      List.Cells[CurPos, 'A'].Value := LangText('Vsego')+TranslateText(' по документу') ;
      List.Cells[CurPos, 'A'].HorizontalAlignment := xlleft;
      List.Cells[CurPos, 'H'].Value := '=SubTotal(9,H15:H' + IntToStr(CurPos - 1) + ')';
      List.Cells[CurPos, 'J'].Value := '=SubTotal(9,J15:J' + IntToStr(CurPos - 1) + ')';
      List.Cells[CurPos, 'K'].Value := '=SubTotal(9,K15:K' + IntToStr(CurPos - 1) + ')';
      List.Cells[CurPos, 'L'].Value := '=SubTotal(9,L15:L' + IntToStr(CurPos - 1) + ')';
      List.Range['A15:L' + IntToStr(CurPos)].Borders.LineStyle := xlContinuous;

      Inc(CurPos, 2);
      List.Cells[CurPos,'B'].Value := LangText('Obschaya')+LangText('sum')+LangText('S_NDS')+': ' + NumStrGrn(List.Cells[CurPos-2, 'L'].Value, TranslateText('грн'), TranslateText('коп'));
      Inc(CurPos, 2);

      qDog.Close;
      qDog.ParamByName('ToId').asInteger := Self.iToId;
      qDog.ParamByName('ToInst').asInteger := Self.iToInst;
      qDog.ParamByName('FromId').asInteger := Self.iFromId;
      qDog.ParamByName('FromInst').asInteger := Self.iFromInst;
      qDog.Open;
      ExFormat(List,
        1,'B',
        [strNumber,
         FormatDateTime2('dd.mm.yyyy',DocDate)]
        );
      ExFormat(List,
        2,'B',
        [qDog.FieldByName('Dog').AsString,
         FormatDateTime2('dd.mm.yyyy',qDog.FieldByName('Dog_Date').AsDateTime)]
        );
      List.Cells[5,'D']:=DateToStr(DocDate)+TranslateText(' по ')+DateToStr(DocDate);
      List.Cells[CurPos, 2] := LangText('Prodavets');
      List.Cells[CurPos, 5] := LangText('Pokypatel');
      Inc(CurPos, 2);
      // реквизиты поставщика
      qRekv.Close;
      qRekv.ParamByName('Id').Value := Self.iFromId;
      qRekv.ParamByName('Inst').Value := Self.iFromInst;
      qRekv.Open;

      List.Cells[7,'A']:=qRekv.FieldByName('Name').asString;
      List.Cells[CurPos + 0, 2] := TranslateText('Адрес: ') + qRekv.FieldByName('addr').AsString;
      List.Cells[CurPos + 1, 2] := LangText('R/S') + qRekv.FieldByName('rach_chet').AsString;
      List.Cells[CurPos + 2, 2] := TranslateText('в ') + qRekv.FieldByName('Bank_Name').AsString;
      List.Cells[CurPos + 3, 2] := TranslateText('МФО ') + qRekv.FieldByName('MFO').AsString;
      List.Cells[CurPos + 4, 2] := TranslateText('код ЕДРПОУ ') + qRekv.FieldByname('OKPO').AsString;
      List.Cells[CurPos + 5, 2] := TranslateText('ИНН ') + qRekv.FieldByName('Nal_num').AsString;
      List.Cells[CurPos + 6, 2] := LangText('Sv_plat_NDS_NUM') +qRekv.FieldByName('svid_num').AsString;
      // реквизиты получателя
      qRekv.Close;
      qRekv.ParamByName('Id').Value := Self.iToId;
      qRekv.ParamByName('Inst').Value := Self.iToInst;
      qRekv.Open;

      List.Cells[10,'A']:=qRekv.Fieldbyname('Name').AsString;
      List.Cells[CurPos + 0, 5] := TranslateText('Адрес: ') + qRekv.FieldByName('addr').AsString;
      List.Cells[CurPos + 1, 5] := LangText('R/S') + qRekv.FieldByName('rach_chet').AsString;
      List.Cells[CurPos + 2, 5] := TranslateText('в ') + qRekv.FieldByName('Bank_Name').AsString;
      List.Cells[CurPos + 3, 5] := TranslateText('МФО ') +  qRekv.FieldByName('MFO').AsString;
      List.Cells[CurPos + 4, 5] := TranslateText('код ЕДРПОУ ') + qRekv.FieldByName('OKPO').AsString;
      List.Cells[CurPos + 5, 5] := TranslateText('ИНН ') + qRekv.FieldByName('Nal_num').AsString;
      List.Cells[CurPos + 6, 5] := LangText('Sv_plat_NDS_NUM') + qRekv.FieldByName('svid_num').AsString;
      Inc(CurPos, 8);
      List.Cells[CurPos, 5] := TranslateText('М.П.  _______________');
      List.Cells[CurPos, 2] := TranslateText('М.П.  _______________');
      if OutputType=1 then for i:=1 to NumOfCopy do List.PrintOut();
    end // with
  finally
  end;
end;
//==============================================================================
procedure TdmRashNakPrint.SetAddFields(p_DovWho, p_DovNum: String; p_DovDate: TDateTime; p_DovSer: String='');
begin
  try
    vt.edit;
    vtDovWho.AsString := p_DovWho;
    vtDovNum.AsString := p_DovNum;
    vtDovDate.AsDateTime := p_DovDate;
    if p_DovSer<>'' then
      vtDovSer.AsString:= p_DovSer;
    vt.Post;
  except on E:Exception do
    begin
      vt.Cancel;
      raise Exception.Create(TranslateText('Ошибка при добавлении дополнительной информации') +#13#10+E.Message);
    end;
  end;
end;
//==============================================================================
class procedure TdmRashNakPrint.DeleteBD(p_SourceId,p_SourceInst, p_CurrId, p_CurrInst, p_TableId:Integer);
var
  sql:string;
begin
  sql:='update oil_rash_nak set state=''N'' '
    +' where SOURCE_ID = :source_id '
    +'   and SOURCE_INST = :source_inst '
    +'   and RASH_NAK_TYPE = :rash_nak_type';
  if p_CurrId>0 then
    sql:=sql+'   and ID=:id'
  else
    sql:=sql+'   and :id=:id';
  if p_CurrInst>0 then
    sql:=sql+'   and INST=:inst'
  else
    sql:=sql+'   and :inst=:inst';
  _ExecSql(sql,
    ['source_id', p_SourceId,
     'source_inst', p_SourceInst,
     'rash_nak_type', p_TableId,
     'id', p_CurrId,
     'inst', p_CurrInst]);
end;

end.
