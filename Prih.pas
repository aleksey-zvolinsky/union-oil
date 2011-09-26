unit Prih;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ComCtrls, StdCtrls, Mask, ToolEdit, Db, DBTables, ExtCtrls,
  Grids, DBGrids, Placemnt, Math, MemTable, uCommonForm, MemDS, DBAccess,
  Ora,uOilQuery,uOilStoredProc, DBGridEh, uHelpButton, CurrEdit, EditBase,
  RXSpin{$IFDEF VER150},Variants, GridsEh, DBGridEhGrouping{$ENDIF};

type
  TPrihForm = class(TEditBaseForm)
    DBGrid1: TDBGridEh;
    Panel1: TPanel;
    t: TMemoryTable;
    ds: TOraDataSource;
    tNak: TStringField;
    tTank: TStringField;
    tCountDoc: TFloatField;
    tND_Norm: TFloatField;
    tND_Error: TFloatField;
    tND_Post: TFloatField;
    tND_Rail: TFloatField;
    tIZ_Norm: TFloatField;
    tIZ_Post: TFloatField;
    tCount_: TFloatField;
    qRez: TOilQuery;
    qRezID: TFloatField;
    qRezNAME: TStringField;
    tTank_type: TStringField;
    tRez: TFloatField;
    tRez_Name: TStringField;
    qRezID_ORG: TFloatField;
    qRezCAPACITY: TStringField;
    qRezDEAD: TFloatField;
    qRezNUM: TStringField;
    qRezINST: TFloatField;
    qFrom: TOilQuery;
    qFromNAME: TStringField;
    tIS_DIGITAL_WEIGHT: TFloatField;
    tTECH_LOSS: TFloatField;
    tIsDigitalText: TStringField;
    pDog: TPanel;
    lKP_Dog: TLabel;
    edKP_Dog: TComboEdit;
    bClearDog: TSpeedButton;
    Label32: TLabel;
    edKP_Date: TDateEdit;
    Label33: TLabel;
    edKP_Count: TEdit;
    Label29: TLabel;
    edKP_Price: TEdit;
    Panel5: TPanel;
    Label6: TLabel;
    edDateOtpr: TDateEdit;
    lRail: TLabel;
    edRail: TComboEdit;
    Label4: TLabel;
    edPostRN: TEdit;
    Label5: TLabel;
    edPostNN: TEdit;
    Panel6: TPanel;
    Label1: TLabel;
    edAct: TEdit;
    LblDischargeDate1: TLabel;
    edDischargeDate: TDateEdit;
    lFrom: TLabel;
    edFrom: TComboEdit;
    lPart: TLabel;
    edPart: TComboEdit;
    Label7: TLabel;
    edDost: TComboEdit;
    sbClearPart: TSpeedButton;
    Label3: TLabel;
    edOper: TComboEdit;
    lTo: TLabel;
    edTo: TComboEdit;
    Label8: TLabel;
    edDog: TEdit;
    Label9: TLabel;
    edDogDate: TDateEdit;
    lNP_Type: TLabel;
    edNP_Type: TComboEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    qOstatok: TOilQuery;
    qRecordMinIDPrih: TOilQuery;
    qUpdate: TOilQuery;
    qRecordPrih: TOilQuery;
    OilHelpButton: TOilHelpButton;
    sbDel: TSpeedButton;
    cbClearDischargeDate: TSpeedButton;
    qDet: TOilQuery;
    cbCalcWithTemp1: TCheckBox;
    edActHandly: TEdit;
    edTempAvg: TEdit;
    gbDateMove: TGroupBox;
    edDocDate: TDateEdit;
    LblDateDoc: TLabel;
    LblDateDocRail: TLabel;
    edDocDateRail: TDateEdit;
    qRezNUM_NAME: TStringField;
    edDaysOnWay: TRxSpinEdit;
    Label2: TLabel;
    qWagons: TOilQuery;
    tWagon_id: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure edOperButtonClick(Sender: TObject);
    procedure edPartButtonClick(Sender: TObject);
    procedure edDostButtonClick(Sender: TObject);
    procedure edRailButtonClick(Sender: TObject);
    procedure tBeforePost(DataSet: TDataSet);
    procedure edNP_TypeButtonClick(Sender: TObject);
    procedure sbClearPartClick(Sender: TObject);
    procedure edNP_TypeChange(Sender: TObject);
    procedure tRez_NameSetText(Sender: TField; const Text: String);
    procedure qRezFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure tCountDocSetText(Sender: TField; const Text: String);
    procedure tCount_SetText(Sender: TField; const Text: String);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure edFromButtonClick(Sender: TObject);
    procedure edToButtonClick(Sender: TObject);
    procedure bClearDogClick(Sender: TObject);
    procedure edKP_DogButtonClick(Sender: TObject);
    procedure edDischargeDateChange(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure tIsDigitalTextChange(Sender: TField);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure cbClearDischargeDateClick(Sender: TObject);
    procedure edDaysOnWayChange(Sender: TObject);
    procedure qWagonsBeforeOpen(DataSet: TDataSet);
    procedure qWagonsAfterOpen(DataSet: TDataSet);
    procedure DBGrid1Columns1UpdateData(Sender: TObject; var Text: String;
      var Value: Variant; var UseText, Handled: Boolean);
  private
    procedure GetDogData(); // узнаємо ціну і кількість по договору по дануму НП
    function CheckOperation: boolean;  // Тру, если два ППОН-а и не сам себе или Обл и свой ППОН
    Procedure GetAllIzl;
    procedure SetPrecision;
    procedure SetDaysOnWayIfGas;  //овиставляє ліміти на зміну днів у edDaysOnWay
    (** Propertyes *)
    function GetPartId: integer;
    function GetPartInst: integer;
    procedure SetPartId(AValue: integer);
    procedure SetPartInst(AValue: integer);
    procedure SetPartName;
    function GetDates: TDateTime;
    procedure SetDates(AValue: TDateTime);
    //From
    function GetFromId:integer;
    procedure SetFromId(AValue: integer);
    function GetFromInst:integer;
    procedure SetFromInst(AValue: integer);
    //To
    function GetToId:integer;
    procedure SetToId(AValue: integer);
    function GetToInst:integer;
    procedure SetToInst(AValue: integer);
  public

    OldDate: TDate;
    Fas: boolean;
    p_FormShow: boolean; // true - якщо форма вже загружена
    FInst:integer;
    procedure Test; override;
    procedure Save; override;
    procedure Init; override;
    procedure PrintReport(AReportNumber:integer); override;
    procedure CheckMethodForGas(pIsDaysOnMethod: boolean);  //перевіряє, чи буде розрахунок недостач по методиці
    procedure DaysOnWayRecalc;  //перерахунок кількості днів у дорозі (елемент edDaysOnWay)
    function GetIsGas: boolean; //перевріка, чи є даний тип НП газом (записуємо в змінну IsGas)
    function PartDate(part_id, part_inst: integer): boolean;
    function TestPartinEditingAndDeleting(
      Part_id, Part_inst, Part_id_New, Part_inst_New: integer;
      Date_Prih: TDateTime;
      Fact_Count: Double;
      Prih_id: integer;
      Del: boolean=false): boolean;
    property PartId: integer read GetPartId write SetPartId;
    property PartInst: integer read GetPartInst write SetPartInst;
    property DischargeDate: TDateTime read GetDates write SetDates;
    property OtprDate: TDateTime read GetDates write SetDates;
    property DocDate: TDateTime read GetDates write SetDates;
    property RailDocDate: TDateTime read GetDates write SetDates;
    property FromId: integer read GetFromId write SetFromId;
    property FromInst: integer read GetFromInst write SetFromInst;
    property ToId: integer read GetToId write SetToId;
    property ToInst: integer read GetToInst write SetToInst;
  end;


(**
Класс расчета недостач и излишков
*)
Type
  TSurplusAndDeficit=class
  private
    FDelta:Double;
    FNpTypeName:string;
    FAvgTemp:integer;
    FIsDigitalWeight,
    FIsCalcWithTemp:boolean;
    FDatePeriod:integer;
    FNpType:integer;
    FDate:TDateTime;
    FFactCount, FDocCount, FTechLoss: Double;
    FOutND_Norm, FOutND_Error, FOutND_Post, FOutND_Rail,//недостачи
    FOutIZ_Norm, FOutIZ_Post, FOutTECH_LOSS: Double;//излишки
    function GetKUbRUS(ANpName: string; ADate: TDateTime): Double;
    function Koef(ATemp:integer=1000000): Double;
    function getTrLoss: Double;
    procedure CalculateGasWithTemp;
    procedure CalculateBenzine;
    procedure CalculateGas;
    function GetNpTypeName:string;
    procedure SetNpTypeName(Value:string);
    procedure SetAvgTemp(Value:integer);
    property NpTypeName:string read GetNpTypeName write SetNpTypeName;
    property TrLoss: Double read getTrLoss;
    procedure Calculate();
    constructor Create();
  public
    property AvgTemp:integer read FAvgTemp write SetAvgTemp;  
    class procedure Get(
      Is_Digital_Weight,ATemp,APeriod: integer;
      Np_Type: integer;
      Date: TDateTime;
      Fact_Count, Doc_Count, TechLoss: Double;
      IsGasWithTemp:boolean;
      var p_ND_Norm, p_ND_Error, p_ND_Post, p_ND_Rail, p_IZ_Norm, p_IZ_Post, p_TECH_LOSS: Double);
  end;


var
  PrihForm: TPrihForm;
  Rez_Name: String;
  Part_Id_Old, Part_Inst_Old: integer;
  p_Tank: boolean;
  IsGas: boolean;  //чи є даний НП газом. Береться з функції GetIsGas
(** Проверка коефициента температуры *)
procedure TestKoef(AAvgTemp:integer);

implementation

Uses OperTypeRef, OilStd, Main, PartRef, Part, NPTypeRef, DogRef,
  ChooseOrg, UDbFunc, MoneyFunc, UXMLForm,ExFunc;

{$R *.DFM}

//==============================================================================
//////////////////// алгоритм вычисления излишков и недостач ///////////////////
//==============================================================================
///////////////////////////// TSurplusAndDeficit ///////////////////////////////
//==============================================================================
function TSurplusAndDeficit.GetKUbRUS(ANpName: string; ADate: TDateTime): Double;
begin
  Result := 0;
  // Газовый конденсат
  if copy(UpperCase(ANpName),1,4) = 'ГАЗО' then
    Result := 0.00042;
  // Нефть
  if copy(UpperCase(ANpName),1,1) = 'Н' then
    Result := 0.00042;
  // Бензин
  if copy(UpperCase(ANpName),1,1) = 'Б' then
    Result := 0.00021;
  // ДТ, Масло, Печ...
  if (copy(UpperCase(ANpName),1,1) = 'Д') or (copy(UpperCase(ANpName),1,1) = 'М') or (copy(UpperCase(ANpName),1,1) = 'П') then
    Result := 0.00007;
  // для зимнего диз с февраля другой коэф
  if (copy(UpperCase(ANpName),1,1) = 'Д') and ((Pos('З-',ANpName)>0) and (ADate >= StrToDate('01.02.2003'))) then
    Result := 0.00014;
  //Дизельное топливо EN-590 сорт F
  //Дизельне паливо (аналог EN-590) марки Е
  if (copy(UpperCase(ANpName),1,1) = 'Д') and ((Pos('сорт F',ANpName)>0) or (Pos('марки Е',ANpName)>0))then
    Result := 0.00014;
  // Славол
  if pos(UpperCase('лавол'),UpperCase(ANpName) ) > 0 then
    Result := 0.00007;
end;
//==============================================================================
function TSurplusAndDeficit.Koef(ATemp:integer=1000000): Double;
var
  iTemp:integer;
begin
  if ATemp=1000000 then
    iTemp:=AvgTemp
  else
    iTemp:=ATemp;
  try
    result:=GetSqlValueParSimple('select koef from oil_prih_gaz_koef where temperature=:temp',
      ['temp',iTemp]);
  except on e:exception do
    Raise Exception.CreateFmt(TranslateText('Невозможно взять коефициент для температуры %d, температура должна быть в пределах от -30 до 30 и кратно 2-м.%s'),[iTemp,e.Message]);
  end;
end;
//==============================================================================
function TSurplusAndDeficit.getTrLoss: Double;
begin
  try
    Result:=FRound(0.001*(Koef*0.01)*FDocCount*FDatePeriod,3);
  except on e:exception do
    Raise Exception.CreateFmt(TranslateText('Невозможно вычислить естественную убыль газа.%s'),[e.Message]);
  end;
end;
//==============================================================================
procedure TSurplusAndDeficit.CalculateGasWithTemp();
begin
  // розрахунки
  if FDelta > 0 then
  begin
    // залишки
    {$IFDEF DIM_ERROR}
    if not FIsDigitalWeight then
      FOutIZ_Norm := 0
    else  // в пределах норм погрешности измерения
      FOutIZ_Norm:=Fround(FFactCount*Koef, 3);
    {$ELSE}
    FOutIZ_Norm := 0;
    {$ENDIF}
    // недостача за счет поставщика
    FOutIZ_Post := Fround(FDelta - FOutIZ_Norm, 3);
  end
  else
  begin
    // недостача
    FDelta := Fround(FDelta * -1, 3);
    // в пределах норм погрешности измерения
    FOutND_Error := 0;
    // технические потери принимаются
    FOutTECH_LOSS := 0;//Fround(TechLoss, 3);
    // недостача за счет поставщика
    FOutND_Post := 0;//Fround(Delta - p_TECH_LOSS, 3);
    // в пределах норм естеств. убыли
    FOutND_Norm:=Fround(min(FDelta,TrLoss),3);
    FDelta:=FDelta-FOutND_Norm;

    if FDelta>0 then
    begin
      FOutTECH_LOSS:=min(FDelta,FTechLoss);
      FDelta:=FDelta-FOutTECH_LOSS;
      if FDelta>0 then
        {$IFDEF DIM_ERROR}
        if not FIsDigitalWeight then
          FOutND_Error:=0
        else
        begin
          FOutND_Error:=min(FDelta,fround(FFactCount*Koef,3));
          FDelta:=FDelta-FOutND_Error;
        end;
        {$ENDIF}
    end;
    FOutND_Post:=FDelta;
  end;
end;
//==============================================================================
procedure TSurplusAndDeficit.CalculateBenzine();
begin
  if FDelta > 0 then
  begin
    // залишки
    if not FIsDigitalWeight then
      FOutIZ_Norm := 0
    else if (FFactCount < 100) then // в пределах норм погрешности измерения
      FOutIZ_Norm := FRound(min(FFactCount * 0.008, FDelta), 3)
    else
      FOutIZ_Norm := FRound(min(FFactCount * 0.005, FDelta), 3);
    // недостача за счет поставщика
    FOutIZ_Post := Fround(FDelta - FOutIZ_Norm, 3);
  end
  else
  begin
    // недостача
    FDelta := Fround(FDelta * -1, 3);
    // в пределах норм естественной убыли
    FOutND_Norm := FRound(min(FDelta, GetKUbRUS(NpTypeName, StrToDateTime(FormatDateTime2('dd.mm.yyyy', FDate))) * FDocCount), 3);
    // технические потери
    FOutTech_Loss := 0;
    FDelta := FRound(FDelta - FOutND_Norm, 3);
    if FDelta > 0 then
    begin
      // цифровое взвешивание
      if not FIsDigitalWeight then
        FOutND_Error := 0
      else if FFactCount < 100 then // в пределах норм погрешности измерения
        FOutND_Error := FRound(min(FDelta, FFactCount * 0.008), 3)
      else
        FOutND_Error := FRound(min(FDelta, FFactCount * 0.005), 3);
      FOutND_Post := FRound(FDelta - FOutND_Error, 3);
    end
    else
      FOutND_Post := 0;
  end;
end;
//==============================================================================
constructor TSurplusAndDeficit.Create();
begin
  FNpTypeName:='';
end;
//==============================================================================
procedure TSurplusAndDeficit.Calculate();
begin
  FDelta := FRound(FFactCount - FDocCount, 3);
  // очистка
  FOutND_Norm   := 0;
  FOutND_Error  := 0;
  FOutND_Post   := 0;
  FOutND_Rail   := 0;
  FOutIZ_Norm   := 0;
  FOutIZ_Post   := 0;
  FOutTECH_LOSS := 0;
  //расчет
  if not IsGas then
    CalculateBenzine
  else if FIsCalcWithTemp then
    CalculateGasWithTemp
  else
    CalculateGas;
end;
//==============================================================================
function TSurplusAndDeficit.GetNpTypeName:string;
begin
  if FNpTypeName='' then
    FNpTypeName:=nvl(GetSqlValueParSimple('select name from oil_np_type where id=:id',['id',FNpType]),'');
  result:=FNpTypeName;
end;
//==============================================================================
procedure TSurplusAndDeficit.SetNpTypeName(Value:string);
begin
  FNpTypeName:=Value;
end;
//==============================================================================
procedure TSurplusAndDeficit.SetAvgTemp(Value:integer);
begin
  Koef(Value);
  FAvgTemp:=Value;
end;
//==============================================================================
procedure TSurplusAndDeficit.CalculateGas;
begin
  // розрахунки
  if FDelta > 0 then
  begin
    // залишки
    case FIsDigitalWeight of
      False: FOutIZ_Norm := 0;
      True:
        begin
          // в пределах норм погрешности измерения
          if (FDocCount < 100) then FOutIZ_Norm := FRound(min(FFactCount * 0.008, FDelta), 3)
          else FOutIZ_Norm := FRound(min(FFactCount * 0.005, FDelta), 3);
        end;
    end;
    // недостача за счет поставщика
    FOutIZ_Post := Fround(FDelta - FOutIZ_Norm, 3);
  end
  else
  begin
    // недостача
    FDelta := Fround(FDelta * -1, 3);
    // в пределах норм естеств. убыли
    FOutND_Norm := 0;
    // в пределах норм погрешности измерения
    FOutND_Error := 0;
    // технические потери принимаются
    FOutTECH_LOSS := Fround(FTechLoss, 3);
    // недостача за счет поставщика
    FOutND_Post := Fround(FDelta - FOutTECH_LOSS, 3);
  end;
end;

class procedure TSurplusAndDeficit.Get(
  Is_Digital_Weight,ATemp,APeriod: integer;
  Np_Type: integer;
  Date: TDateTime;
  Fact_Count, Doc_Count, TechLoss: Double;
  IsGasWithTemp:boolean;
  var p_ND_Norm, p_ND_Error, p_ND_Post, p_ND_Rail, p_IZ_Norm, p_IZ_Post, p_TECH_LOSS: Double);
Var
  sad:TSurplusAndDeficit;
Begin
  try
    sad:=TSurplusAndDeficit.Create;
    try
      sad.FIsDigitalWeight:=(Is_Digital_Weight = 1);
      sad.AvgTemp:=ATemp;
      sad.FIsCalcWithTemp:=IsGasWithTemp;
      sad.FDatePeriod:=APeriod;
      sad.FNpType:=Np_Type;
//      sad.NpTypeName:=Np_Type;
      sad.FDate:=Date;
      sad.FFactCount:=Fact_Count;
      sad.FDocCount:=Doc_Count;
      sad.FTechLoss:=TechLoss;
      sad.Calculate;
      p_ND_Norm:=sad.FOutND_Norm;
      p_ND_Error:=sad.FOutND_Error;
      p_ND_Post:=sad.FOutND_Post;
      p_ND_Rail:=sad.FOutND_Rail;
      p_IZ_Norm:=sad.FOutIZ_Norm;
      p_IZ_Post:=sad.FOutIZ_Post;
      p_TECH_LOSS:=sad.FOutTECH_LOSS;
    finally
      sad.free;
    end;
  Except On E: Exception Do
    MessageDlg(TranslateText('Ошибка: ') + E.message, mtError, [mbOk], 0);
  End;
End;
procedure TestKoef(AAvgTemp:integer);
var
  sad:TSurplusAndDeficit;
begin
  sad:=TSurplusAndDeficit.Create;
  try
    sad.AvgTemp:=AAvgTemp;
  finally
    sad.free;
  end;
end;
//==============================================================================
////////////////////////////////////////////////////////////////////////////////
//==============================================================================
function TPrihForm.CheckOperation: boolean;
var
  ParFrom, ParTo: integer;
begin
  ParFrom := GetOblId(edFrom.Tag,lFrom.Tag);
  ParTo   := GetOblId(edTo.Tag,  lTo.Tag);
  Result :=
    ( ((ParFrom = ParTo) and (ParFrom <> 0) and (edFrom.Tag <> edTo.Tag) and
       (edFrom.Tag = lFrom.Tag) and (edTo.Tag = lTo.Tag)) or // Если два ППОН-а и не сам себе
      ((ParFrom = edTo.Tag) and (edFrom.Tag = lFrom.Tag)) or // или Обл и свой ППОН
      ((ParTo = edFrom.Tag) and (edTo.Tag = lTo.Tag))        // или Обл и свой ППОН
    ) and (edFrom.Tag < 1000000);
end;
//==============================================================================
Procedure TPrihForm.GetAllIzl;
Begin
  If t.Active Then
  Begin
    If (t.State=dsEdit)Or(t.State=dsInsert) Then t.Post;
    t.First;
    while not t.Eof do
    begin
      t.Edit;
      t.Post;
      t.Next;
    end;
  End;
End;
//==============================================================================
procedure TPrihForm.FormShow(Sender: TObject);
begin
  FInst:=INST;
  If edAct.Text = '' Then
  Begin  //створюємо нову запис
    Try
      qFrom.Close;
      qFrom.ParamByName('a').AsInteger := FInst;
      qFrom.Open;
      If qFrom.RecordCount = 0 Then Raise Exception.Create(TranslateText('Нет такой организации!'));
      edTo.Text := qFromName.AsString;
      edTo.Tag  := FInst;
      lTo.Tag   := FInst;
    Except On E:Exception Do
      MessageDlg(TranslateText('Ошибка: ')+E.message,mtError,[mbOk],0);
    End;
    edFrom.Text := '';
    //тоже повторяеться чуть ниже, почему? не стал разбираться,
    //потому добавляя еще одну дату вписал ее в двух местах...
    edDischargeDate.Date:=Date;
    edDateOtpr.Date:=Date;
    edDocDate.Date:=Date;
    edDocDateRail.Date:=Date;
    t.Active := False;
    t.EmptyTable;
    t.Active := True;
    edDischargeDate.Date := Date;
    edDateOtpr.Date := Date;
    edDocDate.Date:=Date;
    edDocDateRail.Date:=Date;     
    edOper.Clear;
    edPart.Clear;
    edDost.Clear;
    edDost.Text := TranslateText('Ж/д транспорт');
    edDost.Tag  := 1;
    edRail.Clear;
    edDog.Clear;
    edDogDate.Clear;
    edNP_Type.Clear;
    edPostRn.Clear;
    edPostNN.Clear;
    if edPart.Text = '' then Fas := false;
    SetPrecision;
    bClearDogClick(Nil);
    edDaysOnWay.Value := 1;
    edDaysOnWay.ReadOnly := True;
  End
  else
  begin  //редагуємо створений запис
    Part_Id_Old := edPart.Tag;
    Part_Inst_Old := lPart.Tag;
    IsGas := GetIsGas;
    SetDaysOnWayIfGas;
    edDaysOnWay.Value:=q.FieldByName('Days_on_way').AsInteger;
  end;
  FillRezList(DBGrid1.FieldColumns['Rez_name'].PickList,edTo.Tag);
  qRez.Close;
  qRez.ParamByName('a').AsInteger := edTo.Tag;
  qRez.Open;
  
  pDog.Enabled := edNP_Type.Tag <> 0;
  GetDogData(); // узнаємо ціну і кількість по договору по дануму НП
end;
//==============================================================================
procedure TPrihForm.bbCancelClick(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;
//==============================================================================
procedure TPrihForm.edOperButtonClick(Sender: TObject);
Var
  OperTypeRefForm : TOperTypeRefForm;
begin
  Application.CreateForm(TOperTypeRefForm, OperTypeRefForm);
  OperTypeRefForm.SGrpId := OPG_PRIHOD;
  OperTypeRefForm.bbClear.Enabled:=false;
  if CheckOperation then   // Если два ППОН-а и не сам себе или Обл и свой ППОН
    begin
      OperTypeRefForm.edName.Text := TranslateText('Перемещение (между филиалами)');
      OperTypeRefForm.edName.Enabled := False;
    end;
  //OperTypeRefForm.bbSearch.Enabled:=false;
  OperTypeRefForm.ShowModal;
  If OperTypeRefForm.ModalResult = mrOk Then
  Begin
    If OperTypeRefForm.qId.AsInteger = OPG_AZSRET Then
    begin
      OperTypeRefForm.Free;
      ShowMessage(TranslateText('Для этой операции используется форма "Возврат с АЗС".'));
      Exit;
    end;
    case sbClearPart.Tag of // Если до операции уже выбрана партия
      1: // Комиссия
         if OperTypeRefForm.qId.AsInteger in [1,2] then
         Begin
            OperTypeRefForm.Free;
            ShowMessage(TranslateText('Приход на комиссионную партию по этой операции запрещен !'));
            Exit;
         End;
      2: // Собственный
         if OperTypeRefForm.qId.AsInteger in [2,53] then
         Begin
            OperTypeRefForm.Free;
            ShowMessage(TranslateText('Приход на собственную партию по этой операции запрещен !'));
            Exit;
         End;
      3: // Хранение
         if OperTypeRefForm.qId.AsInteger in [1,53] then
         Begin
            OperTypeRefForm.Free;
            ShowMessage(TranslateText('Приход на партию хранения по этой операции запрещен !'));
            Exit;
         End;
    End;
    edOper.Text := OperTypeRefForm.qName.AsString;
    edOper.Tag  := OperTypeRefForm.qId.AsInteger;
    OperTypeRefForm.Free;
  End;
end;
//==============================================================================
procedure TPrihForm.SetPrecision;
Begin
  if Fas then
  Begin
    tCount_.DisplayFormat := '#####0';
    tCountDoc.DisplayFormat := '#####0';
  End
  else
  Begin
    tCount_.DisplayFormat := '#####0.0#####';
    tCountDoc.DisplayFormat := '#####0.0#####';
  End;
End;
//==============================================================================
function TPrihForm.GetIsGas: boolean;
var
  sNp_Name: string;
begin
  sNp_Name := AnsiUpperCase(nvl(GetSqlValueParSimple('select name from oil_np_type where id=:id',['id',edNP_Type.Tag]),''));
  result := ( Pos('ГАЗ', sNp_Name) <> 0 ) and ( Pos('ГАЗО', sNp_Name) = 0 );  // *NO_TRANSLATE*
end;
//==============================================================================
procedure TPrihForm.SetDaysOnWayIfGas;
var
  iDaysForGas: integer;
begin
  iDaysForGas := Trunc(edDocDateRail.Date - edDateOtpr.Date) + 1;  //+1 на день зливу газу
  if IsGas then
    begin
      edDaysOnWay.ReadOnly := false;
      edDaysOnWay.MaxValue := iDaysForGas + 2;  //Виставляємо ліміти на зміну днів у шляху := різниця ±2 дні.
      edDaysOnWay.MinValue := iDaysForGas - 2;
      CheckMethodForGas(edDaysOnWay.Value = iDaysForGas);
    end
  else
    begin
      edDaysOnWay.ReadOnly := true;
      edDaysOnWay.Color := clBtnFace;
    end;
end;
//==============================================================================
procedure TPrihForm.CheckMethodForGas(pIsDaysOnMethod: boolean);
begin
  if pIsDaysOnMethod then
    begin
      edDaysOnWay.Color := clBtnFace;
      edDaysOnWay.Tag := 0;  //газ: розрахунки по методиці
    end
  else
    begin
      edDaysOnWay.Color := clWindow;
      edDaysOnWay.Tag := 170;  //газ: розрахунки з порушенням методики
    end;
end;
//==============================================================================
procedure TPrihForm.DaysOnWayRecalc;
begin
  edDaysOnWay.MinValue := 0;  //дозволяємо зміни
  edDaysOnWay.MaxValue := 0;
  edDaysOnWay.Value := edDocDateRail.Date - edDateOtpr.Date;  //перераховуємо, якщо дата змінилася
  if IsGas then
    edDaysOnWay.Value := edDaysOnWay.Value + 1;  //+1 на день зливу газа
  if (edAct.Text = '') and (edDaysOnWay.Value <= 0) then
    edDaysOnWay.Value := 1;
end;
//==============================================================================
procedure TPrihForm.edPartButtonClick(Sender: TObject);
Var
  PartRefForm: TPartRefForm;
begin
  Application.CreateForm(TPartRefForm, PartRefForm);
  try
    if edOper.Tag in [1,2,53] then
       with PartRefForm do
       Begin
          chOwn.Tag := 1;
          chOwn.Checked := True;
          bbClear.Enabled := False;
          case edOper.Tag of
            1: rbOwn.Checked := True;
            2: rbStore.Checked := True;
           53: rbKom.Checked := True;
          End;
          chOwn.Enabled := False;
          rbOwn.Enabled := False;
          rbStore.Enabled := False;
          rbKom.Enabled := False;
          chCount.Checked:=False;
       End;
    PartRefForm.cbNoPrih.Checked:=True;
    PartRefForm.ShowModal;
    If PartRefForm.ModalResult = mrOk Then
    Begin
      // Тип товара
      if PartRefForm.qOWN_GOODS.AsString='K' then sbClearPart.Tag:=1;
      if PartRefForm.qOWN_GOODS.AsString='O' then sbClearPart.Tag:=2;
      if PartRefForm.qOWN_GOODS.AsString='S' then sbClearPart.Tag:=3;
      edPart.Tag     := PartRefForm.qId.AsInteger;
      lPart.Tag      := PartRefForm.qInst.AsInteger;
      edNP_Type.Tag  := PartRefForm.qNP_Type.AsInteger;
      lNP_Type.Tag   := PartRefForm.qNP_Grp.AsInteger;
      edDog.Text     := PartRefForm.qDog.AsString;
      edPart.Text    := PartRefForm.qId.AsString;
      edNP_Type.Text := PartRefForm.qNP_Type_Name.AsString;
      edDogDate.Text := DateToStr(PartRefForm.qDog_Date.AsDateTime);
      Fas := PartRefForm.qIsShtuki.AsString = 'Y';
      SetPrecision;
      if qWagons.Active then qWagons.Close;
      _OpenQuery(qWagons);
    End;
  finally
    PartRefForm.Free;
  end;
  // при газе
  edTempAvg.Enabled:=0<pos('ГАЗ',AnsiUpperCase(edNP_Type.Text));
  cbCalcWithTemp1.Enabled:= edTempAvg.Enabled;
  DBGrid1.Columns[8].ReadOnly:=not edTempAvg.Enabled;
end;
//==============================================================================
procedure TPrihForm.edDostButtonClick(Sender: TObject);
begin
  XMLChoose('DostavkaRef', edDost);
end;
//==============================================================================
procedure TPrihForm.edRailButtonClick(Sender: TObject);
var
  id, inst: integer;
begin
  if XMLChoose('railstatref',id,inst,edRail) then
  begin
    edRail.Tag := id;
    lRail.Tag := inst;
  end;
end;
//==============================================================================
procedure TPrihForm.tBeforePost(DataSet: TDataSet);
{var
  AND_Norm, AND_Error, AND_Post, AND_Rail, AIZ_Norm, AIZ_Post, ATECH_LOSS: Double;}
begin
  if not p_FormShow then exit;
  if edDischargeDate.Date<>0 then
  begin
    if tRez.AsInteger = 0 then
      raise Exception.Create(TranslateText('Не выбран резервуар!'));
    if tCount_.AsFloat=0 then
      raise Exception.Create(TranslateText('Не введено кол-во по факту!'));
  end;
  if tCountDoc.AsFloat=0 then
      raise Exception.Create(TranslateText('Не введено кол-во по документам!'));
  {GetNedostachaAndIzlishki(
    tIS_DIGITAL_WEIGHT.AsInteger, edNp_Type.Text, edActDate.Date,
    tCount_.AsFloat, tCountDoc.AsFloat, tTECH_LOSS.AsFloat,
    AND_Norm, AND_Error, AND_Post, AND_Rail, AIZ_Norm, AIZ_Post, ATECH_LOSS);
  tND_Norm.AsFloat := AND_Norm;
  tND_Error.AsFloat := AND_Error;
  tND_Post.AsFloat := AND_Post;
  tND_Rail.AsFloat := AND_Rail;
  tIZ_Norm.AsFloat := AIZ_Norm;
  tIZ_Post.AsFloat := AIZ_Post;
  tTECH_LOSS.AsFloat := ATECH_LOSS;}
end;
//==============================================================================
procedure TPrihForm.edNP_TypeButtonClick(Sender: TObject);
Var
  NPTypeRefForm : TNPTypeRefForm;
begin
  Application.CreateForm(TNPTypeRefForm, NPTypeRefForm);
  NPTypeRefForm.ShowModal;
  If NPTypeRefForm.ModalResult = mrOk Then
  Begin
    lNP_Type.Tag   := NPTypeRefForm.qNP_Grp.AsInteger;
    edNP_Type.Tag  := NPTypeRefForm.qId.AsInteger;
    edNP_Type.Text := NPTypeRefForm.qName.AsString;
  End;
  NPTypeRefForm.Free;
end;
//==============================================================================
procedure TPrihForm.sbClearPartClick(Sender: TObject);
begin
  edPart.Clear;
  edDog.Clear;
  edDogDate.Clear;
end;
//==============================================================================
procedure TPrihForm.edNP_TypeChange(Sender: TObject);
begin
  DBGrid1.Enabled := (edNP_Type.Text<>'')or(edDischargeDate.Date=0) ;
  edTempAvg.Enabled:=0<pos('ГАЗ',AnsiUpperCase(edNP_Type.Text));
  cbCalcWithTemp1.Enabled:= edTempAvg.Enabled;
  DBGrid1.Columns[8].ReadOnly:=not edTempAvg.Enabled;    
  GetAllIzl;
  IsGas := GetIsGas;
  DaysOnWayRecalc;
  SetDaysOnWayIfGas;

  pDog.Enabled := edNP_Type.Tag <> 0;
  bClearDogClick(nil);
end;
//==============================================================================
procedure TPrihForm.tRez_NameSetText(Sender: TField; const Text: String);
begin
  if Text = '' then begin
    tRez_Name.AsString := '';
    tRez.AsInteger := 0;
  end
  else
  begin
    Rez_Name := Text;
    qRez.FindFirst;
    tRez_Name.AsString := qRezNum_Name.AsString;
    tRez.AsInteger     := qRezId.AsInteger;
  end;
end;
//==============================================================================
procedure TPrihForm.qRezFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := (qRezNum_Name.AsString=Rez_Name);
end;
//==============================================================================
procedure TPrihForm.tCountDocSetText(Sender: TField; const Text: String);
  var Txt: string;
begin
  if Fas then Txt := IntToStr(Trunc(StrToFloat(Text))) else Txt:=Text;
  If (tCount_.AsString='')And(Txt<>'') Then tCount_.AsString := Txt;
  tCountDoc.AsString := Txt;
end;
//==============================================================================
procedure TPrihForm.tCount_SetText(Sender: TField; const Text: String);
  var Txt: string;
begin
  if Fas then Txt := IntToStr(Trunc(StrToFloat(Text))) else Txt:=Text;
  If (tCountDoc.AsString='')And(Txt<>'') Then tCountDoc.AsString := Txt;
  tCount_.AsString := Txt;
end;
//==============================================================================
procedure TPrihForm.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  If (Key = '.')Or(Key = ',') Then Key := DecimalSeparator;
end;
//==============================================================================
procedure TPrihForm.edFromButtonClick(Sender: TObject);
var
  vId, vInst: integer;
  vName: string;
begin
  if edOper.Tag = 57 then
    if ChooseOrg.CaptureOrg(1,MAIN_ORG.INST,MAIN_ORG.INST,'nyn',vId,vInst,vName) then
    begin
      edFrom.Text := vName;
      edFrom.Tag := vId;
      lFrom.tag := vInst;
    end
    else Begin end
  else
    if ChooseOrg.CaptureOrg(1,0,0,'yyy',vId,vInst,vName) then
    begin
      edFrom.Text := vName;
      edFrom.Tag := vId;
      lFrom.tag := vInst;
      if CheckOperation then  // Если два ППОН-а и не сам себе или Обл и свой ППОН
        begin
          edOper.Text := TranslateText('Перемещение (между филиалами)');
          edOper.Tag  := 57;
        end;
    end;
end;
//==============================================================================
procedure TPrihForm.edToButtonClick(Sender: TObject);
var
  vId, vInst: integer;
  vName: string;
begin
  if ChooseOrg.CaptureOrg(1,Main_id,Inst,'yyx',vId,vInst,vName) then
  begin
    qRez.Close;
    qRez.ParamByName('a').AsInteger := vId;
    qRez.Open;
    FillRezList(DBGrid1.Columns[3].PickList,vId);
    edTo.Text:=vName;
    edTo.Tag:=vId;
    lTo.tag:=vInst;
    if CheckOperation then   // Если два ППОН-а и не сам себе или Обл и свой ППОН
      begin
        edOper.Text := TranslateText('Перемещение (между филиалами)');
        edOper.Tag  := 57;
      end;
  end;
end;
//==============================================================================
procedure TPrihForm.bClearDogClick(Sender: TObject);
begin
  edKP_Dog.Clear;
  edKP_Dog.Tag := 0;
  edKP_Date.Clear;
  edKP_Price.Clear;
  edKP_Count.Clear;
end;
//==============================================================================
procedure TPrihForm.edKP_DogButtonClick(Sender: TObject);
Var
  DogRefForm: TDogRefForm;
begin
  Application.CreateForm(TDogRefForm, DogRefForm);
  DogRefForm.eNPType.Text := edNP_Type.Text;
  DogRefForm.eNPType.Tag := edNP_Type.Tag;
  DogRefForm.eNPType.Enabled := false;
  DogRefForm.ShowModal;
  If DogRefForm.ModalResult = mrOk Then
  Begin
    edKP_Dog.Text  := DogRefForm.qDog.AsString;
    edKP_Dog.Tag   := DogRefForm.qId.AsInteger;
    lKP_Dog.Tag    := DogRefForm.qInst.AsInteger;
    edKP_Date.Date := DogRefForm.qDog_Date.AsDateTime;
    GetDogData(); // узнаємо ціну і кількість по договору по дануму НП
  End;
  DogRefForm.Free;
end;
//==============================================================================
procedure TPrihForm.GetDogData(); // узнаємо ціну і кількість по договору по дануму НП
begin
  if (edKP_Dog.Tag = 0) or (lKP_Dog.Tag = 0) or (edNP_Type.Tag = 0) then
    exit;

  edKP_Price.Text :=
    nvl(GetSqlValueParSimple(
      'select price_nds from v_oil_dog_full where dog_id = :dog_id and dog_inst = :dog_inst and np_type = :np_type',
      ['dog_id', edKP_Dog.Tag, 'dog_inst', lKP_Dog.Tag, 'np_type', edNP_Type.Tag]), '');

  edKP_Count.Text :=
    nvl(GetSqlValueParSimple(
      'select litr from v_oil_dog_full where dog_id = :dog_id and dog_inst = :dog_inst and np_type = :np_type',
      ['dog_id', edKP_Dog.Tag, 'dog_inst', lKP_Dog.Tag, 'np_type', edNP_Type.Tag]), '');
end;
//==============================================================================
procedure TPrihForm.edDischargeDateChange(Sender: TObject);
begin
  if (Sender as TDateEdit).date<>0 then
  begin
    if not Self.Visible and ((Sender as TDateEdit).Date <= StrToDate(Close_Date))then
      (Sender as TDateEdit).Enabled:=false;
    if p_FormShow then
      begin
        DaysOnWayRecalc;
        SetDaysOnWayIfGas;
      end;
    bbOk.Enabled := ((Sender as TDateEdit).Date > StrToDate(CLOSE_DATE));
  end;
  if qWagons.Active then
  begin
    qWagons.Close;
    qWagons.Open;
  end;
  //DBGrid1.Enabled := edDischargeDate.Date=0;
end;
//==============================================================================
procedure TPrihForm.DBGrid1EditButtonClick(Sender: TObject);
begin
  //showMessage('dd');
end;
//==============================================================================
procedure TPrihForm.tIsDigitalTextChange(Sender: TField);
begin
  If tIsDigitalText.AsString = 'Да' then tIs_Digital_weight.asInteger := 1  // *NO_TRANSLATE*
  else tIs_Digital_weight.asInteger := 0;
end;
//==============================================================================
procedure TPrihForm.SpeedButton1Click(Sender: TObject);
begin
  edPostRn.Clear;
end;
//==============================================================================
procedure TPrihForm.SpeedButton2Click(Sender: TObject);
begin
  edPostNN.Clear;
end;
//==============================================================================
function TPrihForm.PartDate(part_id, part_inst: integer): boolean;
var
  qPart, qVar: TOilQuery;
begin
  result := false;
  qVar := TOilQuery.Create(Application);
  qVar.SQL.Text := 'select name, to_date(decoder2(value), ''DD.MM.YYYY'') as date_ from oil_var where upper(name) = upper(''Date_For_Test_Part'')';
  qVar.Open;
  if qVar.isEmpty then
  begin
    MessageDlg(TranslateText('Значение "Date_For_Test_Part" не найдено!'), mtError, [mbOk], 0);
    exit;
  end;
  qPart := TOilQuery.Create(Application);
  qPart.SQL.Text := 'select to_date(dog_date, ''DD.MM.YYYY'') as part_date from oil_part where id = '+IntToStr(part_id)+
    ' and state = ''Y'' and inst = '+IntToStr(part_inst);
  qPart.Open;
  if qPart.isEmpty then
  begin
    MessageDlg(TranslateText('Партия не найдена!'), mtError, [mbOk], 0);
    exit;
  end;
  if qPart.RecordCount > 1 then
  begin
    MessageDlg(TranslateText('Найдено более одной партии по данному "part_id" и "part_inst"!'), mtError, [mbOk], 0);
    exit;
  end;
  if (qPart.FieldByName('part_date').AsDateTime > qVar.FieldByName('date_').AsDateTime) then
    result := true;
end;
//==============================================================================
function TPrihForm.TestPartinEditingAndDeleting(
  Part_id, Part_inst, Part_id_New, Part_inst_New: integer;
  Date_Prih: TDateTime;
  Fact_Count: Double;
  Prih_id: integer;
  Del: boolean=false): boolean;
var
  s1, s2: string;
begin
  result := true;
  s1 := '';
  s2 := '';
  if PartDate(Part_id, Part_inst) = true then
  begin
    qOstatok.Close;
    qOstatok.ParamByName('part_id').AsInteger := Part_id;
    qOstatok.ParamByName('part_inst').AsInteger := Part_inst;
    qOstatok.ParamByName('part_id_new').AsInteger := Part_id_New;
    qOstatok.ParamByName('part_inst_new').AsInteger := Part_inst_New;
    qOstatok.ParamByName('prih_id').AsInteger := Prih_id;
    qOstatok.ParamByName('date_').AsDateTime := Date_Prih;
    qOstatok.ParamByName('fact_count').AsFloat := Fact_Count;
    qOstatok.Open;
    qOstatok.First;
    if qOstatok.RecordCount > 0 then
    begin
      if Del = false then
      begin
        s1 := TranslateText('редактировании');
        s2 := TranslateText('Отредактируйте данный приход так, чтобы остаток по данной партии на дату ') +
        qOstatok.FieldByName('data_oper').AsString + ', ' + TranslateText('был больше или равен нулю.') + #13#10
      end
      else
        s1 := TranslateText('удалении');
      MessageDlg(TranslateText('При ') + s1 + TranslateText(' данного прихода, остаток по данной партии на дату ') +
        qOstatok.FieldByName('data_oper').AsString + TranslateText(', будет отрицательным.') + #13#10 + s2 +
        TranslateText('Первый отпуск, который приводит к отрицательным остаткам по партии имеет номер ') +
        qOstatok.FieldByName('id').AsString + TranslateText(' и дату ') + qOstatok.FieldByName('data_oper').AsString + '. ' + #13#10 +
        TranslateText('Для просмотра всего движения по партии выберите отчет "Отчеты\Отчеты по Нефтебазе\Движение по партии". '), mtError, [mbOk], 0);
      result := false;
    end;
  end;
end;
//==============================================================================
procedure TPrihForm.sbDelClick(Sender: TObject);
begin
  try
    t.Delete;
  except
  end;
end;
//==============================================================================

procedure TPrihForm.cbClearDischargeDateClick(Sender: TObject);
begin
  edDischargeDate.Date:=0;
end;

procedure TPrihForm.Test;
var
  Res: String;
  Fact_Count: real;
  p_IS_DIGITAL_WEIGHT: integer; // значення поля IS_DIGITAL_WEIGHT, яке має бути у всіх рядках цього приходу
  NP_GROUP_ID_REZ, NP_GROUP_ID_PART: integer;
begin
  (** Проверки *)
  if (edPart.Tag<>0) and (lPart.Tag<>0) and (GetQValueByIdInst('state', 'oil_part', edPart.Tag,lPart.Tag)='N') then
  begin
    ShowMessage(TranslateText('Во время редактирования этого прихода была удалена(или синхронизирована) партия.')+#13#10+
                TranslateText('Нажмите ОТМЕНА и отредактируйте партию.'));
    Exit;
  end;
  if (edDocDate.Date=0) then
    raise exception.create('Введите дату передачи от поставщика!');
  if (edDocDateRail.Date=0) then
    raise exception.create('Введите дату передачи от ЖД!');
  If Not t.Active Then
    raise Exception.Create(TranslateText('Введите пожалуйста хотя-бы одну накладную!'));
  If (t.State=dsEdit)Or(t.State=dsInsert) Then t.Post;
  If( t.RecordCount=0 ){and( edDischargeDate.Date<>0 )}Then
    raise Exception.Create(TranslateText('Введите пожалуйста хотя-бы одну накладную!'));
  if EdOper.Tag < 1 then
    raise Exception.Create(TranslateText('Введите пожалуйста тип операции!'));
  if Edfrom.Text = ''  then
    raise Exception.Create(TranslateText('Организация-источник обязательна!'));
  if( EdPart.Text='' )and( edDischargeDate.Date<>0 )then
    raise Exception.Create(TranslateText('Партия обязательна!'));
 { if ( edTempAvg.Enabled )and( edDischargeDate.Date<>0 )and( edTempAvg.Value=0 )then   //ноль, тоже температура!
    raise Exception.Create(TranslateText('При приходе газа необходимо вводить среднюю температуру!'));}
  if( edTempAvg.Enabled )and( cbCalcWithTemp1.Checked ) then
    TestKoef(StrToInt(edTempAvg.Text));
  if (edDischargeDate.Date<>0) and (edDocDate.Date<>0) and (edDischargeDate.Date<edDocDate.Date) then
    raise exception.create(TranslateText('Дата слива не может быть меньше даты передачи от поставщика!'));
  if (edDischargeDate.Date<>0) and (edDocDateRail.Date<>0) and (edDischargeDate.Date<edDocDateRail.Date) then
    raise exception.create(TranslateText('Дата слива не может быть меньше даты передачи от ЖД!'));
  if (edDischargeDate.Date<>0) and (edDocDateRail.Date<>0) and ((edDocDateRail.Date<edDateOtpr.Date)
                                                                 or (edDocDate.Date<edDateOtpr.Date)) then
    raise exception.create(TranslateText('Дата прихода не может быть меньше даты отправки!'));

  t.First;
  while not t.Eof do
  begin
    if (tRez.AsInteger = 0) and (edDischargeDate.Date<>0) then
      raise Exception.Create(TranslateText('Не выбран резервуар!'));
    // перевірка на схожість груп нафтопродуктів резервуарів і партії
    NP_GROUP_ID_REZ := GetSQLValue('select nvl(np.grp_id, 0) from oil_rezervuar r, oil_np_type np ' +
      ' where r.state = ''Y'' and r.id = '+ tRez.AsString +' and r.inst = '+ qRezINST.AsString +' and r.np_type_id = np.id(+) and np.state(+) = ''Y''');
    NP_GROUP_ID_PART := GetSQLValue('select grp_id from oil_np_type where id = '+ IntToStr(edNP_Type.Tag));
    if not ((NP_GROUP_ID_REZ = NP_GROUP_ID_PART) or
      ((NP_GROUP_ID_REZ in [4, 5]) and (NP_GROUP_ID_PART in [4, 5])) or
      ((NP_GROUP_ID_REZ in [7, 76]) and (NP_GROUP_ID_PART in [7, 76]))) then
      raise Exception.Create(TranslateText('Резервуар с номером ')+ tRez_Name.AsString +
        TranslateText(' или не имеет типа нефтепродукта или этот тип отличается от типа нефтепродукта партии!'));

    if (tRez.AsInteger <> 0) and (edDischargeDate.Date=0) then
      raise Exception.Create(TranslateText('Резервуар можно выбирать только определив дату слива!'));
    if (tCount_.AsFloat=0) and (edDischargeDate.Date<>0) then
      raise Exception.Create(TranslateText('Не введено кол-во по факту!'));
    t.Next;
  end;

  // шукаємо хоч одну цистерну
  p_Tank := false;
  t.First;
  while not t.eof do
  Begin
    if p_Tank = false then
      p_Tank := tTank.AsString <> '';
    t.Next;
  end;

  t.First;
  p_IS_DIGITAL_WEIGHT := -1;
  while not t.eof do
  Begin
    if p_Tank then
      if tTank.AsString = '' then
        raise Exception.Create(TranslateText('Не введена цистерна!'));
    if edDischargeDate.Date<>0 then
      if (tIS_DIGITAL_WEIGHT.AsInteger <> p_IS_DIGITAL_WEIGHT) and (p_IS_DIGITAL_WEIGHT <> -1) then
        raise Exception.Create(TranslateText('Метод определения массы должен быть один!'))
      else
        p_IS_DIGITAL_WEIGHT := tIS_DIGITAL_WEIGHT.AsInteger;
    t.Next;
  end;

  DBGrid1.DataSource.DataSet.First;
  Fact_Count := 0;
  while not DBGrid1.DataSource.DataSet.Eof do begin
    Fact_Count := Fact_Count + DBGrid1.DataSource.DataSet.FieldByName('Count_').AsFloat;
    DBGrid1.DataSource.DataSet.Next;
  end;
  if ReadOilVar('PARTTEST') = 'Y' then
    if edAct.Text <> '' then
      if TestPartinEditingAndDeleting(
        Part_Id_Old, Part_Inst_Old, edPart.Tag, lPart.Tag, edDischargeDate.Date, Fact_Count,
        StrToInt(edAct.Text)) = false
      then
        exit;

{  if( edDischargeDate.Date<>0 )then
  begin}
    if( not t.Active )then
      raise Exception.Create(TranslateText('Введите пожалуйста хотя-бы одну накладную!'));
    if (t.State=dsEdit) or (t.State=dsInsert) then t.Post;
    if t.RecordCount=0 then
      raise Exception.Create(TranslateText('Введите пожалуйста хотя-бы одну накладную!'));
{  end
  else if(not t.IsEmpty )then
    raise Exception.Create(TranslateText('Введена детализация прихода, введите дату слива'));}

  If (edDaysOnWay.Tag <> 0) and
     (MessageDlg(TranslateText('Внимание! Расчеты будут произведены с нарушением методики расчета недостач в НК А-Н.')+#13#10+
                 TranslateText('Продолжить?'),
                 mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
      raise Exception.Create(TranslateText('Отменено пользователем'));

  If edAct.Tag = 0 Then Res := TranslateText('ДОБАВИТЬ')
  Else Res := TranslateText('ИЗМЕНИТЬ');

  If MessageDlg(TranslateText('Вы уверены что хотите ')+Res+TranslateText(' ПРИХОД НЕФТЕПРОДУКТОВ ?'),
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then
    raise Exception.Create(TranslateText('Отменено пользователем'));
end;

procedure TPrihForm.Save;
var
  sID: String;
  AND_Norm, AND_Error, AND_Post, AND_Rail, AIZ_Norm, AIZ_Post, ATECH_LOSS: Double;
begin
  (** Сохранение *)
  if edAct.Text = '' then
    edAct.Text := IntToStr(GetSeqNextVal('S_OIL_PRIH'));
  //StartSQL;
  _ExecSql(
    ' update oil_prih_det set state=''N'''+
    ' where prihod_id='+edAct.Text+' and inst='+IntToStr(MAIN_ORG.INST));
  DBSaver.SaveRecord('OIL_PRIHOD',
    ['ID',          StrToInt(edAct.Text),
     'STATE',       'Y',
     'INST',        FInst,
     'EMP_ID',      EMP_ID,
     'EMP_INST',    EMP_ID,
     'DATE_',       BoolTo_(edDischargeDate.Text[1]=' ',Null,edDischargeDate.Date),
     'DATE_DOC',    edDocDate.Date,
     'DATE_DOC_RAIL',edDocDateRail.Date,     
     'OPER_ID',     BoolTo_(edOper.Tag=0,Null,edOper.Tag),
     'PART_ID',     BoolTo_(edPart.Tag=0,Null,edPart.Tag),
     'PART_INST',   BoolTo_(edPart.Tag=0,Null,lPart.Tag),
     'DATE_OTPR',   edDateOtpr.Date,
     'DOST',        BoolTo_(edDost.Tag=0,Null,edDost.Tag),
     'RAIL_ST',     BoolTo_(edRail.Tag=0,Null,edRail.Tag),
     'RAIL_INST',   BoolTo_(edRail.Tag=0,Null,lRail.Tag),
     'NP_TYPE',     edNp_Type.Tag,
     'FROM_',       edFrom.Tag,
     'FROM_INST',   lFrom.Tag,
     'TO_',         edTo.Tag,
     'TO_INST',     lTo.Tag,
     'DOG',         BoolTo_(edKP_Dog.Text='',Null,edKP_Dog.Tag),
     'DOG_INST',    BoolTo_(edKP_Dog.Text='',Null,lKP_Dog.Tag),
     'POST_RN_NUM', edPostRN.Text,
     'POST_NN_NUM', edPostNN.Text,
     'TEMP_AVG',    BoolTo_(not cbCalcWithTemp1.Checked,null,BoolTo_(edTempAvg.Text='',0,edTempAvg.Text)),
     'NUMBER_DOC',  BoolTo_(edActHandly.Text='',null,edActHandly.Text),
     'DAYS_ON_WAY', edDaysOnWay.Value
     ]);
  (** сохраненние детализации *)
 { if( edDischargeDate.Date<>0 )then
  begin}
  t.First;
  while not t.eof do
  Begin
    DBSaver.SaveRecord('OIL_PRIH_DET',
      ['STATE',                 'Y',
       'INST',                  INST,
       'PRIHOD_ID',             StrToInt(edAct.Text),
       'NAKL',                  tNak.AsString,
       'TANK',                  BoolTo_(tWagon_id.Value = 0,tTank.AsString,null),
       'TANK_TYPE',             tTank_Type.AsString,
       'DOC_COUNT',             BoolTo_(Fas,tCountDoc.AsInteger,tCountDoc.AsFloat),
       'FACT_COUNT',            BoolTo_(Fas,tCount_.AsInteger,tCount_.AsFloat),
       'NED_NORM_UB',           tND_Norm.AsFloat,
       'NED_NORM_ER',           tND_Error.AsFloat,
       'NED_POST',              tND_Post.AsFloat,
       'NED_RAIL',              tND_Rail.AsFloat,
       'IZL_NORM',              tIZ_Norm.AsFloat,
       'IZL_POST',              tIZ_Post.AsFloat,
       'IS_DIGITAL_WEIGHT',     tIS_DIGITAL_WEIGHT.AsInteger,
       'TECH_LOSS',             tTECH_LOSS.AsFloat,
       'REZ',                   BoolTo_(tRez_Name.AsString='',Null,tRez.AsInteger),
       'REZ_INST',              BoolTo_(tRez_Name.AsString='',Null,INST),
       'WAGON_ID',              BoolTo_(tWagon_id.Value = 0, null, tWagon_id.AsInteger)
      ]);
    t.Next;
  End;
  if( edDischargeDate.Date<>0 )then
  begin
    (** Перещет недостач *)
    // знаходимо записі, які треба обновити
    if qRecordMinIDPrih.Active then
      qRecordMinIDPrih.Close;
    qRecordMinIDPrih.ParamByName('prihod_id').AsInteger := StrToInt(edAct.Text);
    qRecordMinIDPrih.ParamByName('INST').AsInteger := FInst;
    qRecordMinIDPrih.Open;
    sID := '';
    repeat
      //расчет недостачь и излишков
      TSurplusAndDeficit.Get(
        tIS_DIGITAL_WEIGHT.AsInteger,StrToInt(BoolTo_(edTempAvg.Text='',0,edTempAvg.Text)),
        BoolTo_(edDaysOnWay.Value <= 0, 1, edDaysOnWay.Value),
        {edNp_Type.Text}edNP_Type.Tag , edDocDateRail.Date,
        qRecordMinIDPrih.FieldByName('Fact_Count').AsFloat,
        qRecordMinIDPrih.FieldByName('Doc_Count').AsFloat,
        qRecordMinIDPrih.FieldByName('Tech_Loss').AsFloat,
        cbCalcWithTemp1.Checked,
        AND_Norm, AND_Error, AND_Post, AND_Rail, AIZ_Norm, AIZ_Post, ATECH_LOSS);
      // обновляємо саму першу запись по данній цистерні
      if qUpdate.Active then
        qUpdate.Close;
      sID := sID +','+ qRecordMinIDPrih.FieldByName('ID').AsString;
      qUpdate.ParamByName('prihod_id').AsInteger := StrToInt(edAct.Text);
      qUpdate.ParamByName('INST').AsInteger      := FInst;
      qUpdate.ParamByName('ID').AsInteger        :=  qRecordMinIDPrih.FieldByName('ID').AsInteger;
      qUpdate.ParamByName('NED_NORM_UB').AsFloat := AND_Norm;
      qUpdate.ParamByName('NED_NORM_ER').AsFloat := AND_Error;
      qUpdate.ParamByName('NED_POST').AsFloat    := AND_Post;
      qUpdate.ParamByName('NED_RAIL').AsFloat    := AND_Rail;
      qUpdate.ParamByName('IZL_NORM').AsFloat    := AIZ_Norm;
      qUpdate.ParamByName('IZL_POST').AsFloat    := AIZ_Post;
      qUpdate.ParamByName('TECH_LOSS').AsFloat   := ATECH_LOSS;
      qUpdate.ExecSQL;
      qRecordMinIDPrih.Next;
    until qRecordMinIDPrih.Eof;

    if qRecordPrih.Active then
      qRecordPrih.Close;
    qRecordPrih.SQL.Text :=
      ' select id from oil_prih_det ' +
      ' where id not in ('+copy(sID, 2, length(sID))+') ' +
      '   and inst = :inst ' +
      '   and prihod_id = :prihod_id ' +
      '   and state = ''Y''';
    qRecordPrih.ParamByName('prihod_id').AsInteger := StrToInt(edAct.Text);
    qRecordPrih.ParamByName('INST').AsInteger      := FInst;
    qRecordPrih.Open;
    // зануляємо усі інші записі по данній цистерні
    repeat
      if qUpdate.Active then
        qUpdate.Close;
      qUpdate.ParamByName('prihod_id').AsInteger := StrToInt(edAct.Text);
      qUpdate.ParamByName('INST').AsInteger      := FInst;
      qUpdate.ParamByName('ID').AsInteger        := qRecordPrih.FieldByName('ID').AsInteger;
      qUpdate.ParamByName('NED_NORM_UB').AsFloat := 0;
      qUpdate.ParamByName('NED_NORM_ER').AsFloat := 0;
      qUpdate.ParamByName('NED_POST').AsFloat    := 0;
      qUpdate.ParamByName('NED_RAIL').AsFloat    := 0;
      qUpdate.ParamByName('IZL_NORM').AsFloat    := 0;
      qUpdate.ParamByName('IZL_POST').AsFloat    := 0;
      qUpdate.ParamByName('TECH_LOSS').AsFloat   := 0;
      qUpdate.ExecSQL;
      qRecordPrih.Next;
    until qRecordPrih.Eof;
  end;
end;

procedure TPrihForm.Init;
var
  qPart:TOilQuery;
  strIsDigital:string;
begin
  inherited;
  if ID=0 then
  begin
    edAct.Text := '';
    edActHandly.Text:='';
    p_FormShow := true;
  end
  else
  begin
    q.Close;
    _OpenQueryPar(q,
      ['id',ID,
       'inst',INST]);
    p_FormShow := false;
    edAct.Tag:=ID;
    edAct.Text:=IntToStr(ID);
    if q.FieldByName('number_doc').IsNull then
      edActHandly.Text:=edAct.Text
    else
      edActHandly.Text:=q.FieldByName('number_doc').AsString;
    edDischargeDate.Date:=q.FieldByName('Date_').AsDateTime;
    OldDate:=edDischargeDate.Date;
    edDocDate.Date:=q.FieldByName('Date_Doc').AsDateTime;
    edDocDateRail.Date:=q.FieldByName('Date_Doc_Rail').AsDateTime;    
    FInst:=INST;
    if q.FieldByName('Part_Id').AsInteger <> 0 Then
    begin
      FillTags(q,
        [lPart, edPart],
        ['part_inst', 'part_id']);
      edPart.text:=q.FieldByName('dog').asString;
      if qWagons.Active then qWagons.Close;
      _OpenQuery(qWagons);
    end
    else
    begin
      edPart.Tag:=0;
      lPart.Tag:=0;
      edPart.Text:='';
    end;
    FillControls(q,
      [edFrom,edTo,edDog,edDogDate,edNP_Type,edOper,edDost,edDateOtpr,edRail,
       edKP_Dog,edKP_Date,edKP_Price,edPostRN,edPostNN,edTempAvg,edDaysOnWay],
      ['from_name','to_name','dog','dog_date','np_name','oper_name','dost_name',
       'date_otpr','rail_name','kp_dog','kp_date','kp_price','post_rn_num','post_nn_num',
       'temp_avg','days_on_way']
      );
    if q['temp_avg']=null then
      edTempAvg.Text:='';
    cbCalcWithTemp1.Checked:=edTempAvg.Text<>'';
    FillTags(q,
      [edFrom,lFrom,edTo,lTo,edNP_Type,lNP_Type,edOper,edDost,edRail,lRail,edKP_Dog,
       lKP_Dog],
      ['from_','from_inst','to_','to_inst','np_type','np_grp','oper_id','dost',
       'rail_st','rail_inst','kp_id','kp_inst']
      );
    t.Active := False;
    t.EmptyTable;
    t.Active := True;
    qDet.Close;
    _OpenQueryPar(qDet,
      ['prihod_id',ID,
       'inst',INST]);
    qDet.First;
    while not qDet.Eof do
    begin
      if qDet.FieldByName('Is_Digital_weight').asInteger = 1 then
        strIsDigital := 'Да' // *NO_TRANSLATE*
      else
        strIsDigital := 'Нет'; // *NO_TRANSLATE*
      t.AppendRecord ([
        qDet.FieldByName('Nakl').AsString       ,
        qDet.FieldByName('Tank').AsString       ,
        qDet.FieldByName('Tank_Type').AsString  ,
        qDet.FieldByName('Doc_Count').AsFloat   ,
        qDet.FieldByName('Fact_Count').AsFloat  ,
        qDet.FieldByName('Ned_Norm_Ub').AsFloat ,
        qDet.FieldByName('Ned_Norm_Er').AsFloat ,
        qDet.FieldByName('Ned_Post').AsFloat    ,
        qDet.FieldByName('Ned_Rail').AsFloat    ,
        qDet.FieldByName('Izl_Norm').AsFloat    ,
        qDet.FieldByName('Izl_Post').AsFloat    ,
        qDet.FieldByName('Rez').AsInteger       ,
        qDet.FieldByName('Rez_Num').AsString    ,
        qDet.FieldByName('Is_Digital_weight').AsInteger,
        qDet.FieldByName('Tech_loss').AsFloat,
        strIsDigital,
        qDet.FieldByName('wagon_id').AsInteger
      ]);
      qDet.Next;
    end;
    bbOk.Enabled:= bbOk.Enabled and (INST = MAIN_ORG.INST);
    edDischargeDate.Enabled:=( INST=MAIN_ORG.INST )
      or( ( q.FieldByName('Date_').AsDateTime<>0 )
           and( q.FieldByName('Date_').AsDateTime > StrToDate(CLOSE_DATE) ) );
    qPart:=TOilQuery.Create(nil);
    qPart.SQL.Text := 'select * from oil_part where id=:id and inst=:inst ';
    _OpenQueryPar(qPart,
      ['id',q.FieldByName('Part_Id').AsInteger,
       'inst',q.FieldByName('Part_Inst').AsInteger]);
    Fas := (mround(qPart.FieldByName('Base_').AsFloat,3) <> 0);
    qPart.Free;
    p_FormShow := true;
  end;
end;

procedure TPrihForm.edDaysOnWayChange(Sender: TObject);
begin
  inherited;
  edDaysOnWay.Font.Color := clWindowText;
  edDaysOnWay.Font.Style := [];

  if IsGas then
    CheckMethodForGas(edDaysOnWay.Value = edDocDateRail.Date - edDateOtpr.Date + 1);

  if p_FormShow and (edDaysOnWay.Value <= 0) then
    begin  //взагалі такого не буває..
      edDaysOnWay.Font.Color := clRed;
      edDaysOnWay.Font.Style := [fsBold];
    end;
end;
//------------------------------------------------------------------------------
(** Property PartId, PartInst *)
function TPrihForm.GetPartId: integer;
begin
  Result := edPart.Tag;
end;
function TPrihForm.GetPartInst: integer;
begin
  Result := lPart.Tag;
end;
procedure TPrihForm.SetPartId(AValue: integer);
begin
  edPart.Tag := AValue;
  SetPartName;
end;
procedure TPrihForm.SetPartInst(AValue: integer);
begin
  lPart.Tag := AValue;
  SetPartName;
end;
procedure TPrihForm.SetPartName;
begin
  try
    edPart.Text := nvl(GetSqlValueParSimple('select dog from oil_part where id=:id and inst=:inst and state = ''Y'' ',
      ['id',PartId,
       'inst',PartInst]),'');
  except on E:Exception do
  end;
end;
(** Property PartId, PartInst *)
function TPrihForm.GetDates: TDateTime;
begin
  Result := edDischargeDate.Date;
end;
procedure TPrihForm.SetDates(AValue: TDateTime);
begin
  edDischargeDate.Date := AValue;
  edDocDate.Date := AValue;
  edDocDateRail.Date := AValue;
  edDateOtpr.Date := AValue;
end;
(** Property FromId, FromInst *)
//      edFrom.Tag := vId;
//      lFrom.tag := vInst;
function TPrihForm.GetFromId:integer;
begin
  Result := edFrom.Tag;
end;
procedure TPrihForm.SetFromId(AValue: integer);
begin
  edFrom.Tag := AValue;
end;
function TPrihForm.GetFromInst:integer;
begin
  Result := lFrom.tag;
end;
procedure TPrihForm.SetFromInst(AValue: integer);
begin
  lFrom.tag := AValue;
end;
(** Property ToId, ToInst *)
function TPrihForm.GetToId:integer;
begin
  Result := edTo.Tag;
end;
procedure TPrihForm.SetToId(AValue: integer);
begin
  edTo.Tag := AValue;
end;
function TPrihForm.GetToInst:integer;
begin
  Result := lTo.tag;
end;
procedure TPrihForm.SetToInst(AValue: integer);
begin
  lTo.tag := AValue;
end;
//------------------------------------------------------------------------------
procedure TPrihForm.qWagonsBeforeOpen(DataSet: TDataSet);
begin
  qWagons.ParamByName('part_id').AsInteger := PartId;
  qWagons.ParamByName('part_inst').AsInteger := PartInst;
  if edDateOtpr.Date = 0 then
    qWagons.ParamByName('date_').Value := null
  else
    qWagons.ParamByName('date_').AsDate := edDateOtpr.Date;
end;

procedure TPrihForm.qWagonsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DBGrid1.FieldColumns['Tank'].PickList.Clear;
  while not qWagons.Eof do
  begin
    DBGrid1.FieldColumns['Tank'].PickList.Add(qWagons.FieldByName('name').AsString);
    qWagons.Next;
  end;
end;

procedure TPrihForm.DBGrid1Columns1UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;
  if tCountDoc.AsCurrency = 0 then
  // Тянем информацию из накладной
  begin
    qWagons.Filtered := False;
    qWagons.Filter := format('name = ''%s'' ',[Value]);
    qWagons.Filtered := True;
    if qWagons.RecordCount <> 0 then
    begin
      tWagon_id.AsInteger := qWagons.FieldByName('id').AsInteger;
      tCountDoc.AsFloat := qWagons.FieldByName('weight').AsCurrency;
      tCount_.AsFloat := qWagons.FieldByName('weightexact').AsCurrency;
      tNak.AsString := qWagons.FieldByName('ukrnakl').AsString;
      tTECH_LOSS.AsFloat := qWagons.FieldByName('techloss').AsCurrency;
    end
    else
      tWagon_id.Value := 0;
  end
  else
  begin
    qWagons.Filtered := False;
    qWagons.Filter := format('name = ''%s'' ',[Value]);
    qWagons.Filtered := True;
    if qWagons.RecordCount <> 0 then
      tWagon_id.AsInteger := qWagons.FieldByName('id').AsInteger
    else
      tWagon_id.Value := 0;
  end;
end;

procedure TPrihForm.PrintReport(AReportNumber: integer);
begin
  inherited;

end;

end.
