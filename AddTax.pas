unit AddTax;

interface

uses uCommonForm, 
  Windows,
  Classes, Db, DBTables, Forms, SysUtils,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess;

type
  TdmAddTax = class(TDataModule)
    q1: TOilQuery;
    sp1: TOilStoredProc;
  private
    { Private declarations }
  public
    function GetNextTaxId: Integer;
    procedure DeleteNN(nn_id, nn_inst: Integer);
    procedure WriteNN(dep_id, dep_inst, org_id, org_inst, nn_id, nn_inst: Integer;
                      money1, money2, money3: Double;
                      num, doc, m_oper, comment: string;
                      nn_date: TDateTime; NAL_T : integer;
                      NN_CAUSE_ID:integer=0;NN_TYPE_ID:integer=0);
  end;

const
 cDog = 'Согласно договора ';
 cSer = 'Согласно счета ';

 cfrm_Msg_DeleteTax = 'Налоговая накладная №%s удалена';
 cfrm_Msg_EditTax   = 'Отредактирована налоговая накладная №%s';
 cfrm_Msg_AddTax    = 'Добавлена налоговая накладная №%s';

var dmAT: TdmAddTax;

implementation

{$R *.DFM}

uses Main,TaxBillPrint;

const
cNextTaxId =
  'select s_oil_sale_book.nextVal as sq from sys.dual';

cfrmDelTax =
  'update oil_sale_book set state=''N'' where id=%d and inst=%d';
cfrmIdNum =
  'select nal_num, id_num from v_org where id=%d and inst=%d';

function TdmAddTax.GetNextTaxId: Integer;
begin
if (q1.Active) then q1.Close;
q1.SQL.Clear;
q1.SQL.Text:=cNextTaxId;
q1.Open;
Result:=q1.FieldByName('sq').AsInteger;
end;

procedure TdmAddTax.DeleteNN(nn_id, nn_inst: Integer);
begin
if (q1.Active) then q1.Close;
q1.SQL.Clear;
q1.SQL.Text:=Format(cfrmDelTax,[nn_id,nn_inst]);
q1.ExecSQL;
end;

procedure TdmAddTax.WriteNN(dep_id, dep_inst, org_id, org_inst, nn_id, nn_inst: Integer;
                            money1, money2, money3: Double;
                            num, doc, m_oper, comment: string;
                            nn_date: TDateTime; NAL_T : integer;
                            NN_CAUSE_ID:integer=0;NN_TYPE_ID:integer=0);
var
  TaxBill : TdmTaxBill;
begin
if (q1.Active) then q1.Close;
q1.SQL.Clear;
q1.SQL.Text:=Format(cfrmIdNum,[org_id,org_inst]);
q1.Open;
 if num = '' then
 begin
   // Получаем номер налоговой
   TaxBill:= TdmTaxBill.Create;
   try
     num := TaxBill.GetNextNumber(nn_date);
   finally
     TaxBill.Free;
   end;
 end;

 with sp1 do
  begin
  StoredProcName := 'OIL.INSORUPDOIL_SALE_BOOK';
  Prepare;

  ParamByName('ID#').AsInteger          := nn_id;
  ParamByName('STATE#').AsString        := 'Y';
  ParamByName('INST#').AsInteger        := nn_inst;
  ParamByName('NUM#').AsString          := num;
  ParamByName('S_DATE#').AsDate         := nn_date;
  ParamByName('ORGAN#').AsInteger       := org_id;
  ParamByName('ORGAN_INST#').AsInteger  := org_inst;
  ParamByName('FROM_#').AsInteger       := dep_id;
  ParamByName('FROM_INST#').AsInteger   := dep_inst;
  if (Length(doc)>0) then
   ParamByName('F_DOC#').AsString := doc
  else ParamByName('F_DOC#').AsString := ' ';
  ParamByName('FRASCH#').AsString       := m_oper;//'Оплата с Р/С';
  ParamByName('R_DATE#').AsDate         := nn_date;
  ParamByName('Sale_TXT#').AsString     := comment;
  ParamByName('NDS_T#').AsFloat          := money3;
  if (q1.FieldByName('nal_num').IsNull) then
   // не плательщик
   begin
   ParamByName('NDS_P_BASE#').AsFloat    := 0;
   ParamByName('NDS_P_20#').AsFloat      := 0;
   ParamByName('NDS_NP_BASE#').AsFloat   := money1;
   ParamByName('NDS_NP_20#').AsFloat     := money2;
   end
   else // if (q1.FieldByName('id_num')=0) then
    // Плательщик
    begin
    ParamByName('NDS_P_BASE#').AsFloat    := money1;
    ParamByName('NDS_P_20#').AsFloat      := money2;
    ParamByName('NDS_NP_BASE#').AsFloat   := 0;
    ParamByName('NDS_NP_20#').AsFloat     := 0;
    end; // else  if (q1.FieldByName('id_num')=0) then
  ParamByName('VNDS_T#').AsFloat        := 0;
  ParamByName('VNDS_P_S#').AsFloat      := 0;
  ParamByName('VNDS_P_O#').AsFloat      := 0;
  ParamByName('VNDS_P_NB#').AsFloat     := 0;
  ParamByName('VNDS_NP_S#').AsFloat     := 0;
  ParamByName('VNDS_NP_O#').AsFloat     := 0;
  ParamByName('VNDS_NP_NB#').AsFloat    := 0;
  ParamByName('VNDS_NP_EXP#').AsFloat   := 0;
  ParamByName('K_VNDS_S#').AsFloat      := 0;
  ParamByName('K_VNDS_O#').AsFloat      := 0;
  ParamByName('K_NDS_B#').AsFloat       := 0;
  ParamByName('K_NDS_20#').AsFloat      := 0;
  ParamByName('TOV_ID#').Clear;
  ParamByName('DIV_ID#').Clear;
  ParamByName('KOL#').AsFloat := 1;
  ParamByName('NAL_T#').AsInteger := NAL_T;
  if NN_CAUSE_ID = 0 then
    ParamByName('NN_CAUSE_ID#').Clear
  else
    ParamByName('NN_CAUSE_ID#').AsInteger := NN_CAUSE_ID;
  if NN_TYPE_ID = 0 then
    ParamByName('NN_TYPE_ID#').Clear
  else
    ParamByName('NN_TYPE_ID#').AsInteger := NN_TYPE_ID;
  ExecProc;
  end;
end;

end.
