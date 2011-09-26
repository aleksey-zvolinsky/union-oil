unit Udbplan;

interface

uses uCommonForm, Windows, Classes, Controls, Db, DBTables, Dialogs, Excel_TLB,
  Forms, Graphics, Messages, SysUtils, MemDS, DBAccess, Ora, MemTable, uOilQuery,
  uOilStoredProc;

const
  VEDOMOST_TIP = 'АЗС(ведомость)';

type
  TDbplan = class(TDataModule)
    qGrpDensity: TOilQuery;
    qGrpDensityNAME: TStringField;
    qGrpDensityDATE_: TDateTimeField;
    qGrpDensityDENSITY: TFloatField;
    qDopGroups: TOilQuery;
    qOperList: TOilQuery;
    qKP_Alien: TOilQuery;
    qKP_Own: TOilQuery;
    qRegionRest: TOilQuery;
    mtDebitors: TMemoryTable;
    mtDebitorsDEP_NAME: TStringField;
    mtDebitorsNAME: TStringField;
    mtDebitorsID_NUM: TStringField;
    mtDebitorsSUM: TFloatField;
    mtDebitorsSUM_BEFORE_ALFA: TFloatField;
    mtDebitorsSUM_PRE: TFloatField;
    mtDebitorsSUM_LAST: TFloatField;
    mtDebitorsSUM0: TFloatField;
    mtDebitorsSUM30: TFloatField;
    mtDebitorsSUM60: TFloatField;
    mtDebitorsSUM90: TFloatField;
    mtDebitorsDEB_INSIDE: TStringField;
    mtDebitorsEXP_DATE: TStringField;
    mtDebitorsDEB_DATE: TStringField;
    tblExtDebitorka: TTable;
    qRegionRestGazNew: TOilQuery;
    qRashVedom: TOilQuery;
    qRashVedomREP_DATE: TDateTimeField;
    qRashVedomNP_NAME: TStringField;
    qRashVedomDIM_NAME: TStringField;
    qRashVedomLITR: TFloatField;
    qRashVedomPRICE: TFloatField;
    qRashVedomDOG: TStringField;
    qRashVedomAMOUNT: TFloatField;
    qTest: TOilQuery;
    qTestNAME_NP: TStringField;
    qTestPRICETONN: TFloatField;
    qTestTONN: TFloatField;
    qTestLITR: TFloatField;
    qTestSUM_: TFloatField;
    qRegionRestGazNB: TOilQuery;
    qRegionRestRezervs: TOilQuery;
    mtDep: TMemoryTable;
    mtDepNum: TIntegerField;
    mtDepDEP_NAME: TStringField;
    mtDepDEP_ID: TIntegerField;
    tblExtDebitorkaDEP: TStringField;
    tblExtDebitorkaORG: TStringField;
    tblExtDebitorkaORG_ID: TIntegerField;
    tblExtDebitorkaORG_INST: TIntegerField;
    tblExtDebitorkaOWN_GOODS: TStringField;
    tblExtDebitorkaTIP: TStringField;
    tblExtDebitorkaDEB_DATE: TDateField;
    tblExtDebitorkaEXP_DATE: TDateField;
    tblExtDebitorkaTOTAL: TFloatField;
    tblExtDebitorkaOKPO: TStringField;
    tblExtDebitorkaOPER_TYPE: TIntegerField;
    tblExtDebitorkaDEB_INSIDE: TStringField;
    tblExtDebitorkaDOG_ID: TIntegerField;
    tblExtDebitorkaDOG_INST: TIntegerField;
    tblExtDebitorkaDOG_NAME: TStringField;
    qExtDebitors: TOilQuery;
    qExtDebitReport: TQuery;
    qExtDebitReportDEP: TStringField;
    qExtDebitReportORG: TStringField;
    qExtDebitReportORG_ID: TIntegerField;
    qExtDebitReportORG_INST: TIntegerField;
    qExtDebitReportOWN_GOODS: TStringField;
    qExtDebitReportTIP: TStringField;
    qExtDebitReportDEB_DATE: TDateField;
    qExtDebitReportEXP_DATE: TDateField;
    qExtDebitReportTOTAL: TFloatField;
    qExtDebitReportOKPO: TStringField;
    qExtDebitReportDEBIT_OWN_TYPE: TStringField;
    qExtDebitReportSTR_EXP_DATE: TStringField;
    qExtDebitReportSTR_DEB_DATE: TStringField;
    qExtDebitReportOPER_TYPE: TIntegerField;
    qExtDebitReportDEB_INSIDE: TStringField;
    qExtDebitReportDOG_ID: TIntegerField;
    qExtDebitReportDOG_INST: TIntegerField;
    qExtDebitReportDOG_NAME: TStringField;
    qExtDebitReportSUM_BEFORE_ALFA: TFloatField;
    qExtDebitReportSUMPREV: TFloatField;
    qExtDebitReportSUM2000: TFloatField;
    qExtDebitReportSUM90: TFloatField;
    qExtDebitReportSUM60: TFloatField;
    qExtDebitReportSUM30: TFloatField;
    qExtDebitReportSUM0: TFloatField;
    tblExtDebitorkaSUM_BEFORE_ALFA: TFloatField;
    tblExtDebitorkaSUMPREV: TFloatField;
    tblExtDebitorkaSUM2000: TFloatField;
    tblExtDebitorkaSUM90: TFloatField;
    tblExtDebitorkaSUM60: TFloatField;
    tblExtDebitorkaSUM30: TFloatField;
    tblExtDebitorkaSUM0: TFloatField;
    qRegionRestGaz: TOilQuery;
    qExtDebitorsLS: TOilQuery;
    qSvodFilAZS: TOilQuery;
    qAZS: TOilQuery;
    qGKSU_opt: TOilQuery;
    qSvodFilAZSCard: TOilQuery;
    qSvodFilAZSTalon: TOilQuery;
    qSvodFilAZSPrice: TOilQuery;
    qSvodFilAZS_RestOnBegin: TOilQuery;
    qSvodFilAZS_Realiz: TOilQuery;
    qSvodFilAZS_Prihod: TOilQuery;
    qSvodFilAZSTalon666: TOilQuery;
    qSvodFilAZSCustom_Realiz: TOilQuery;
    function mround(arg: double; ndigits: integer): double;
    procedure SetCurrentOrgDateTime(x, y: Integer; ExList: Variant);
    procedure qExtDebitReportCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
  public
  end;

var
  Dbplan: TDbplan;

procedure CopyQuery(qDest, qSour: TDataSet);

implementation

uses Main, uStart, uDbFunc, ExFunc, MoneyFunc;

{$R *.DFM}

//==============================================================================
function TDbplan.mround(arg: double; ndigits: integer): double; // Самодельная функция для округления
var
  i, r: integer;
begin
  r := 1;
  for i := 1 to ndigits do
    r := r * 10;
  result := int(arg * r + 0.500001) / r;
end;
//==============================================================================
// Проц. для выдачи в Ексель текущей орг., даты и времени (построения отчета) в ячейку  (X,Y)   на лист   ExList
procedure TDbplan.SetCurrentOrgDateTime(x, y: Integer; ExList: Variant);
begin
  ExList.Cells[y, x] := MAIN_ORG.NAME +' '+ FormatDateTime('dd.mm.yyyy', Date) +' ' +
    FormatDateTime('hh:nn', Time) +';v.'+ Version.FileVersion;
  ExList.Cells[y, x].Font.Size := 6;
  ExList.Cells[y, x].HorizontalAlignment := xlRight;
end;
//==============================================================================
procedure CopyQuery(qDest, qSour: TDataSet);
var
  mStream: TMemoryStream;
begin
  try
    mStream := TMemoryStream.Create;
    mStream.SetSize(SizeOf(qSour));
    mStream.WriteComponent(qSour);
    mStream.Seek(0, soFromBeginning);
    mStream.ReadComponent(qDest);
  finally
    mStream.Free;
  end;
end;
//==============================================================================
procedure TDbplan.qExtDebitReportCalcFields(DataSet: TDataSet);
begin
  if DataSet.FieldByName('own_goods').AsString = 'K' then
    DataSet.FieldByName('debit_own_type').AsString := TranslateText('Комиссионная')
  else
    if DataSet.FieldByName('own_goods').AsString = 'O' then
      DataSet.FieldByName('debit_own_type').AsString := TranslateText('Собственная')
    else DataSet.FieldByName('debit_own_type').AsString := TranslateText('Прочая');

  if DataSet.FieldByName('exp_date').AsDateTime = 0 then
    if DataSet.FieldByName('deb_date').AsDateTime = 0 then DataSet.FieldByName('str_exp_date').AsString := ''
    else DataSet.FieldByName('str_exp_date').AsString := TranslateText('не введена')
  else DataSet.FieldByName('str_exp_date').AsString := DataSet.FieldByName('exp_date').AsString;

  if DataSet.FieldByName('deb_date').AsDateTime = 0 then DataSet.FieldByName('str_deb_date').AsString := ''
  else DataSet.FieldByName('str_deb_date').AsString := DataSet.FieldByName('deb_date').AsString;
end;
//==============================================================================
procedure TDbplan.DataModuleCreate(Sender: TObject);
begin
  tblExtDebitorka.DatabaseName := DB_DIR;
  qExtDebitReport.DatabaseName := DB_DIR;
end;
//==============================================================================

end.
