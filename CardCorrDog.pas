unit CardCorrDog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Ora, StdCtrls, Buttons, MemDS, DBAccess, ExtCtrls, Grids, DBGridEh,
  VirtualTable, Mask, ToolEdit, uCommonForm,uOilQuery,uOilStoredProc;

type
  TCardCorrDogForm = class(TCommonForm)
    dbg: TDBGridEh;
    Panel1: TPanel;
    ds: TOraDataSource;
    Panel2: TPanel;
    bbClose: TBitBtn;
    bbOk: TBitBtn;
    Panel3: TPanel;
    edDogName: TEdit;
    edNpType: TEdit;
    edCountLitr: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    vt: TVirtualTable;
    vtNpType: TFloatField;
    vtNpName: TStringField;
    vtPrice: TFloatField;
    vtSum: TFloatField;
    vtOper: TFloatField;
    Bevel1: TBevel;
    Label4: TLabel;
    deCorr: TDateEdit;
    Panel4: TPanel;
    sbAdd: TSpeedButton;
    sbDel: TSpeedButton;
    qWork: TOilQuery;
    procedure dbgColumns0EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
  private
      procedure Checkinput();
      function GetNextCorr(DogName:String) : String;
      function GetNpTypeByGrpId(NpType:Integer) : Integer;
  public
    OrgId,OrgInst : Integer;
  end;

var
  CardCorrDogForm: TCardCorrDogForm;

implementation

uses NPGroupRef, MoneyFunc, UDbFunc, OilStd, Main, DogRef;

{$R *.DFM}

procedure TCardCorrDogForm.dbgColumns0EditButtonClick(Sender: TObject;
  var Handled: Boolean);
begin
  Application.CreateForm(TNPGroupRefForm, NPGroupRefForm);
  NPGroupRefForm.ShowModal;
  if NPGroupRefForm.ModalResult = mrOk Then
  begin
    vt.Edit;
    vt.FieldByName('NpName').AsString := NPGroupRefForm.q.FieldByName('Name').AsString;
    vt.FieldByName('NpType').AsInteger  := NPGroupRefForm.q.FieldByName('Petrol_Id').AsInteger;
    vt.Post;
  end;
  NPGroupRefForm.Free;
end;

procedure TCardCorrDogForm.FormShow(Sender: TObject);
begin
  deCorr.Date := now;
  if not vt.Active then vt.Active := true;
end;
procedure TCardCorrDogForm.Checkinput();
var CountSub : Integer;
    Sum, Sign : Double;
begin
  vt.First;
  Sum:=0;
  CountSub := 0;
  while not vt.Eof do
  begin
    if (vtOper.asInteger = 0) or (vtNpType.asInteger = 0) then raise Exception.Create(TranslateText('Не заполнены все поля строки'));
    if vtOper.asInteger = 1 then
    begin
     if edNpType.Text = vtNpName.asString then inc(CountSub)
       else raise Exception.Create(TranslateText('Перебрасывать можно только с выбранного НП'));
     Sign := -1;
    end
    else Sign := 1;
    Sum := Sum + Fround(Sign*vtSum.AsFloat,2);
    if vtNpType.asString = ReadOilVar('NN_OPLAT_ONLY')
     then raise Exception.Create(TranslateText('Не допустима переброска с/на "')+vtNpName.asString+'"');
    vt.Next;
  end;
  if CountSub > 1 then raise Exception.Create(TranslateText('Перебрасывать можно только с одного вида НП'));
  if CountSub < 1 then raise Exception.Create(TranslateText('Для переброски необходимо снять хотябы с одного вида НП'));
  if Sum <> 0 then raise Exception.Create(TranslateText('Не верно распределена сумма'));
  ModalResult := mrOk;
end;

function TCardCorrDogForm.GetNextCorr(DogName:String) : String;
begin
  qWork.Close;
  qWork.SQL.Text :=
  '  select lpad(max(k)+1,2,0) as k  '+
  '  from ( '+
  '  select decode(instr(dog,''*к''),0,0,substr(Dog,instr(dog,''*к'')+2,2)) as k '+
  '  from oil_dog '+
  '  where state=''Y'' '+
  '  and sub_type = 101 '+
  '  and forepay = 1 '+
  '  and dog like '''+DogName+'%'''+
  '  and dog is not null  '+
  '  ) ';
  qWork.Open;
  result := qWork.FieldByName('k').asString;
end;

function TCardCorrDogForm.GetNpTypeByGrpId(NpType:Integer) : Integer;
begin
   qWork.Close;
   qWork.SQL.Text :=
     ' select                 '+
     '   petrol_id,           '+
     '   np_grp_fullname,     '+
     '   Min(id)  as NpId     '+
     ' from v_oil_np_type     '+
     ' where petrol_id = '+IntToStr(NpType)+
     '   and petrol_id is not null '+
     ' group by                '+
     '   np_grp_fullname,      '+
     '   petrol_id             ';
   qWork.Open;
   result := qWork.FieldByName('NpId').asInteger;
end;

procedure TCardCorrDogForm.bbOkClick(Sender: TObject);
var
  DogId, NpType : Integer;
  Amount : Double; 
begin
  CheckInput();
  StartSQL;
  try
    DogId := GetSeqNextVal('s_oil_dog');
    _ExecProc('OIL.INSORUPDOIL_DOG',
           [
            'ID#'           , DogId,
            'STATE#'        , 'Y',
            'INST#'         , MAIN_ORG.INST,
            'DOG#'          , edDogName.Text+'*к'+GetNextCorr(edDogName.Text), // *NO_TRANSLATE*
            'DOG_DATE#'     , deCorr.Date,
            'EXP_DATE#'     , deCorr.Date,
            'FROM_#'        , MAIN_ORG.INST,
            'FROM_INST#'    , MAIN_ORG.INST,
            'TO_#'          , OrgId,
            'TO_INST#'      , OrgInst,
            'DOG_TYPE#'     , 'K',
            'FOREPAY#'      , 1,
            'SUB_TYPE#'     , 101
           ],TRUE);
    vt.First;
    while not vt.Eof do
    begin
      NpType := GetNpTypeByGrpId(vtNpType.asInteger );
      if vtOper.AsInteger = 1 then Amount := -Fround(vtSum.asFloat/vtPrice.asFloat,2)
        else Amount := Fround(vtSum.asFloat/vtPrice.asFloat,2);
      _ExecProc('OIL.INSORUPDOIL_DOG_DETAIL',
           ['ID#'       , GetSeqNextVal('s_oil_dog_detail') ,
            'DOG_ID#'   , DogId,
            'STATE#'    , 'Y',
            'DOG_INST#' , MAIN_ORG.INST,
            'NP_TYPE#'  , NpType,
            'DIM_ID#'   , 28,
            'PRICE#'    , Fround(vtPrice.asFloat*5/6,6),
            'PRICE2#'   , vtPrice.asFloat,
            'COUNT_#'   , Amount
           ],TRUE);
           vt.Next;
    end;

    // створюємо/редагуємо рахунок
    if DogId <> 0 then
      CreateBillWithDog(DogId, MAIN_ORG.INST);

    CommitSQL;
  except on E:Exception do
    begin
      RollbackSQL;
      MessageDlg(TranslateText('Ошибка создания корректирующего договора')+#13#10+E.Message,mtError,[mbOk],0);
    end;
  end; //except
end;

procedure TCardCorrDogForm.sbDelClick(Sender: TObject);
begin
  if not vt.IsEmpty then vt.Delete;
end;

procedure TCardCorrDogForm.sbAddClick(Sender: TObject);
begin
  vt.Insert;
end;

end.
