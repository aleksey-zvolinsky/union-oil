{******************************************************************************}
{  �������������� : ������ � �������� �� �� ����� �� �������� ������.          }
{                                                                              }
{******************************************************************************}

unit TalonOutData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, CurrEdit, Grids, DBGrids, RXDBCtrl, StdCtrls, ToolEdit,
  Buttons, ExtCtrls, Menus, DBCtrls, Mask, RxDBComb, RxLookup, LogSaleDeadbeat,
  MemTable, uHelpButton, MemDS, DBAccess, Ora, uCommonForm,uOilQuery,uOilStoredProc,
  DBGridEh{$IFDEF VER150},Variants, DBGridEhGrouping, GridsEh{$ENDIF};

type

  ITalonForm = interface(IInterface)
    ['{A302B2A5-1E9F-40E6-A271-9AE0FC0E293E}']
    function TestTalon():integer;
    procedure RunProcessBarCode(AInstr:string);
  end;

  PCurrencyEdit=^TCurrencyEdit;
  TEditPrice=record
    pEdit:PCurrencyEdit;// ������ �� ������� TCurrencyEdit
    iNPGrpId:integer;
  end;
  TEditProperty=(epColor,epEnabled);
  (** �������� ���� ��� ���� ����� ��������� ���� �� ����� �� �����
      1.�� �������� ����� �������� � ����� �����, ��� ����� �������:

            AddEdit(@<������ ��������������>,<����� ����>)�

      2.����� ��� ������������� ������ ���� ��������

            SetPriceValue(<�����>,<���� ������������ ������>,<���� ������������ ����>)
  *)
  TTalonPrice=class
    public
      constructor Create();
      destructor Destroy();override;
      (** ���������� � TCurrencyEdit-� �� TOilQuery ��������������� ���� *)
      procedure SetPriceValue(APriceQuery:TOilQuery;ANPGroupField,APriceField:string);overload;
      procedure SetPriceValue(ATalonPrice:TTalonPrice);overload;      
      (** �������� �� ��������� ������ TCurrencyEdit � ��� �� *)
      procedure AddEdit(AEdit:PCurrencyEdit;ANpGrpId:integer);
      (** ����� ���� �� ����� ������ �� *)
      function GetPrice(ANpGrpId:integer):Extended;
      (** ���������� �����-�� �������� *)
      procedure SetProperty(AProperty:TEditProperty;AValue:variant);
    private
      LEditList:TList;
      LEdit:^TEditPrice;
      function FindEdit(ANpGrpId:integer):PCurrencyEdit;      
  end;

type

  ETalonError=class(Exception);
  (** ����� ������� ����� ������������, � ���������� ��� �������� ����������
      ������������� ������ ������
  *)
  TTalon=class
    private
      LSer:string;
      LNum:integer;
      LTalonPrice:TTalonPrice;
      function getNpGroup():integer;
      function getNominal():integer;
      function getIsVsUkr():boolean;
      function getPrice():currency;
    public
      constructor Create(ASer:string;ANum:integer);overload;//������ �����
      constructor Create(ASer:string;ANum:integer;ATalonPrice:TTalonPrice);overload;//����� � ������
      property NpGroup:integer read getNPGroup;
      property Nominal:integer read getNominal;
      property IsVsUkr:boolean read getIsVsUkr;  // �������������
      property Price:currency read getPrice;
      property Ser:string read LSer;
      property Num:integer read LNum;
  end;


type
  TTalonOutForm = class(TCommonForm)
    Panel1: TPanel;
    SP: TOilStoredProc;
    sbDel: TSpeedButton;
    dsTalon: TOraDataSource;
    uTalon: TOraUpdateSQL;
    sbAdd: TSpeedButton;
    qCheckUp: TOilQuery;
    qCheckDown: TOilQuery;
    dsTalonDetail: TOraDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    qTalon: TOilQuery;
    qSum: TOilQuery;
    dsSum: TOraDataSource;
    qWork: TOilQuery;
    qTalonDetail: TOilQuery;
    qCheckDouble: TOilQuery;
    BitBtn1: TBitBtn;
    bbCancel: TBitBtn;
    bbOk: TBitBtn;
    qCheckerNN: TOilQuery;
    qCheckerDog: TOilQuery;
    qCheckDateNN: TOilQuery;
    OilHelpButton1: TOilHelpButton;
    Panel2: TPanel;
    Label13: TLabel;
    Edit6: TEdit;
    DBText1: TDBText;
    Label14: TLabel;
    DBText2: TDBText;
    Label7: TLabel;
    DBText3: TDBText;
    PanelUp: TPanel;
    dbdeOutDate: TDBDateEdit;
    Label5: TLabel;
    Label1: TLabel;
    dbOutNum: TDBEdit;
    Label4: TLabel;
    dbceEdOper: TRxDBComboEdit;
    dbceOrgName: TRxDBComboEdit;
    Label16: TLabel;
    sbClearOper: TSpeedButton;
    sbClearOrg: TSpeedButton;
    PanelGrid: TPanel;
    dbgTalon: TDBGridEh;
    PanelRight: TPanel;
    dbgTalonDetail: TDBGridEh;
    gbNN: TGroupBox;
    lNN_Num: TLabel;
    dbtNN_Num: TDBText;
    Label2: TLabel;
    dbtNN_Sum: TDBText;
    LabelValuta: TLabel;
    cbNN_Num: TCheckBox;
    gbDog: TGroupBox;
    lDogNum: TLabel;
    lDogDate: TLabel;
    dbceDog: TRxDBComboEdit;
    dbdeDogDate: TDBDateEdit;
    gbSum: TGroupBox;
    LabelSumDog: TLabel;
    LabelSumNN: TLabel;
    LSumDog: TLabel;
    LSumNN: TLabel;
    lDog: TLabel;
    gbDoverenost: TGroupBox;
    dbeDovName: TDBEdit;
    dbeDovSer: TDBEdit;
    dbeDovNum: TDBEdit;
    dbdeDovDate: TDBDateEdit;
    lDovSerNum: TLabel;
    lDov: TLabel;
    gbFormRasch: TGroupBox;
    cbFormRash: TComboBox;
    lFormRash: TLabel;
    qPrice: TOilQuery;
    import: TBitBtn;
    Export: TBitBtn;
    SD: TSaveDialog;
    MTCode: TMemoryTable;
    MTCodeTALON: TStringField;
    DSCode: TOraDataSource;
    sbAuto: TSpeedButton;
    LblCapGbSum: TLabel;
    LblCapGbNN: TLabel;
    LblCapGbDov: TLabel;
    gbPrice: TGroupBox;
    sbPrice: TSpeedButton;
    ce76: TCurrencyEdit;
    ce80: TCurrencyEdit;
    ce92: TCurrencyEdit;
    ce95: TCurrencyEdit;
    ce98: TCurrencyEdit;
    ceDT: TCurrencyEdit;
    ceGaz: TCurrencyEdit;
    DBText6: TDBText;
    DBText5: TDBText;
    Label15: TLabel;
    lPrice: TLabel;
    qDog: TOilQuery;
    qTalonSum: TOilQuery;
    qCheckWay: TOilQuery;
    LblFrom: TLabel;
    dbceDepName: TRxDBComboEdit;
    procedure bbOkClick(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure sbDelClick(Sender: TObject);
    procedure qTalonAfterPost(DataSet: TDataSet);
    procedure qTalonBeforePost(DataSet: TDataSet);
    procedure qTalonBeforeDelete(DataSet: TDataSet);
    procedure sbAddClick(Sender: TObject);
    procedure dbgTalonExit(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbceOrgNameDblClick(Sender: TObject);
    procedure dbceDogDblClick(Sender: TObject);
    procedure dbdeOutDateChange(Sender: TObject);
    procedure dbeDovNumKeyPress(Sender: TObject; var Key: Char);
    procedure sbPriceClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgTalonEditButtonClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cbNN_NumClick(Sender: TObject);
    procedure dbceEdOperButtonClick(Sender: TObject);
    procedure sbClearOperClick(Sender: TObject);
    procedure sbClearOrgClick(Sender: TObject);
    procedure dbceDogChange(Sender: TObject);
    procedure importClick(Sender: TObject);
    procedure ExportClick(Sender: TObject);
    procedure sbAutoClick(Sender: TObject);
    procedure dsTalonDetailDataChange(Sender: TObject; Field: TField);
    procedure FormDestroy(Sender: TObject);
    constructor Create(AOwner:TComponent);reintroduce;
    procedure dbceDepNameButtonClick(Sender: TObject);
  private
    procedure ChangeOrgType;
  public
    FTalonPrice:TTalonPrice;
    error: boolean;
    DogEdit: Boolean;
    SaleToDeadbeat: TSaleToDeadbeat;
    NumOld: string;
    Inserting: Boolean;
    FDocDate:TDateTime; // �������������� ��� ��������. ��������� ����� ����� ������� ������ � ��� ��������������
    (** ��������� ������ �������� ������ ������ *)
    function TestTalon( ASer:string;ANum:integer;ATestOnly:boolean=false ): integer;
    function TalonToCode(MT: TMemoryTable; Q: TOilQuery): boolean;
    procedure log(AText:string);
    procedure RunProcessBarCode(AInstr:string);
  end;

type
  TTypeOper = (toPrihod,toOtpysk,toMotionPrihod,toMotionOtpysk,toSrPrihod);
  TTypeErrorOutput = (teoExcept,teoReturn);
const
  FArrNotEditOper:array[0..1] of integer =(200,199);
(** �������� �� ��, ����� �� ������������� ��������(������ ������������� ������������� ��������) *)
function IsCanEditTalonDoc(AOperType:integer):boolean;
(** ����� ������������� ��� ������ ������� ����������� *)
function GetVsUkrTalonCode(p_Num: integer): integer;
(** ������ ��������� ������ � ������� ��� � ����� *)
function ProcessBarCode(p_Code: string; pp_Q: TOilQuery; TypeOper: TTypeOper;
  InTheWay: integer=2): Boolean;
(** ���������� ������� ������ �� ����� *)
function GetTalonNominalBySer(p_ser:string):integer;
(** ���������� ����� ������ ������ �� ����� *)
function GetTalonGroupBySer(p_ser:string;IsVsUkr:boolean=false):integer;

(** � ����� ��������� ������� ���(����� ���) ������ �� ����� �������*)
function TalonExceptionHandler(
  AExceptNumber:integer;//����� ������
  ASer:string;ANum:integer;//����� ����� ������
  ATypeOper:TTypeOper;//������ ����������
  AErrOut:TTypeErrorOutput//��� ������ ���������� �� ������
  ):string;
(** �������� ���� ������� � ����� *)
function TestAllTalon(ATypeOper:TTypeOper;AQuery:TOilQuery):boolean;

procedure KeyPressCode(AForm:TObject;ASender:TObject;AQuery:TOilQuery;Key:Char);

implementation

uses ChooseOrg, Main, OilStd, DogRef, Diapozon, AutoRef, EmpRef, TalonOut,
  OperTypeRef, UDbFunc, TaxBillPrint, MoneyFunc, TalonOpenCode, ExFunc,
  uStart,TalonPrihData,SRTalon,uMessageDlgExt;
{$R *.DFM}

var
   CodeTalon, InStr, ChStr: string;
   AutoId, AutoInst, EmployId, EmployInst: Integer;
   dog_sum, NN_sum: double;
   NNDateLast: TDateTime;

procedure TTalonOutForm.bbOkClick(Sender: TObject);
const
  eOutDate = '�� ���������� ���� ���������� ��������� !';
  eOper = '�� ���������� �������� !';
  eNoClient = '�� ��������� ������ !';
  eNoTalon = '�� ������� ����������� ������ !';
  eDogOutDate = '������� �������� ��������� ����������,' + #13 +
                '���� ������� �� ������ ���� ������ ���� �� �������� !';
  eFormRasch = '�� ���������� ����� �������� !';
  eNotLastNN = '������ ������������� ��, ���� ���� ��, ��������� ����� ��.'+ #13 + //???
               '������� ������� �� �� ����� ��������, ��������� �����.';
  eAlreadyAllNN = '��������� �� ����� ������� �.�. �� ������� ������' +
                  ' ���������� ��������� ���������!';
  confNNDel = '����� ������� ��������� ��������� �%s �� ����� %s.';
  infNNCreate = '������� �� ����� %s �� ����� %s ���.';
  eNotTalonDog = '��������� ������� �� �������� �������� !';
  eNoDog = '�� ��������� ������� !';
  eDogDel = '����� ������ ������� ����� �������. �� ������� ?';
  eTypeOrg = '����������� �������� ��� �����������, �� ������� ������������ ������ !';
var
  RekOrgId, RekOrgInst, RekDepId, RekDepInst, Nal_t, NN_SUM: Variant;
  TaxBill: TdmTaxBill;
  Breaked: boolean;
  NextUser: string;
begin
  try
    bbOk.Enabled := false;
    Breaked := False;
    NN_SUM := 0;
    if qTalon.State <> dsBrowse then
      qTalon.Post;
    qWork.Close;
    qWork.SQL.Text := 'savepoint ApplyUpdates';
    qWork.ExecSQL;
    try
      //��������
      if dbdeOutDate.Date = 0 then
        raise Exception.Create(eOutDate);
      if(dbdeDogDate.Date > dbdeOutDate.Date)then
        raise Exception.Create(eDogOutDate);
      if dbceEdOper.Text = '' then
        raise Exception.Create(eOper);
      if dbceOrgName.Text = '' then
        raise Exception.Create(eNoClient);
      if qTalon.IsEmpty then
        raise Exception.Create(eNoTalon);
      if (dbceEdOper.DataSource.DataSet.FieldByName('Oper_Id').AsInteger=200) and (dbOutNum.Text='') then
        raise exception.create(TranslateText('��� �������� ���������� ����������� ������ ���� ������ ����� �������!'));
      // ��� �������� 200 �� ������ ���� ���� �������� � ���� ���� � ����������� ��������
      if GetSqlValue(Format(
        ' select count(*) from oil_talon_out where oper_id=200 and state=''Y'' and out_date=''%s'' and out_num=''%s'''+
        '   and not (id=%d and inst=%d)',
        [DateToStr(dbdeOutDate.Date),dbOutNum.Text,
         dbceEdOper.DataSource.DataSet.FieldByName('id').AsInteger,
         dbceEdOper.DataSource.DataSet.FieldByName('inst').AsInteger]))>0
      then
        raise exception.create(TranslateText('���������� ����������� �� ���� ���� � ���� ������� ��� ����������!!!'));
      {if IsBeforeFil then
        if (dbdeOutDate.Date>=StrToDate(INST_MOVE_DATE))
          and (dbceEdOper.DataSource.DataSet.FieldByName('Oper_Id').AsInteger=190)
          and Inserting
        then
          raise Exception.Create(TranslateText('�������� ������ ������� � ��-���������� ��������� � �����-���������� ������'));
      }
      {
      //����� ����� ����� �������
      if dbOutNum.Text = '' then
      begin
        qWork.Close;
        qWork.SQL.Text := ' select max(Out_Num) from Oil_Talon_Out ' +
          '  where State = ''Y'' ' +
          '    and Trunc(Out_Date, ''YYYY'') = Trunc(To_Date(''' +
          DateToStr(dbdeOutDate.Date) + '''), ''YYYY'')';
        qWork.Open;
        if dbOutNum.DataSource.DataSet.State = dsBrowse then
          dbOutNum.DataSource.DataSet.Edit;
        dbOutNum.DataSource.DataSet.FieldByName('Out_Num').AsInteger := qWork.Fields[0].AsInteger + 1;
      end;
      }

      //������ ������ ����� ���� ������������ ��������� �������(�� ���, �� ����)
      if not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]) then
      begin
        qWork.Close;
        qWork.SQL.Text := ' select Ser, Num from Oil_Talon_Data ' +
          '  where State = ''Y'' ' +
          '    and Head_Id = ' + qTalon.DataSource.DataSet.FieldByName('Id').AsString +
          '    and Head_Inst = ' + qTalon.DataSource.DataSet.FieldByName('Inst').AsString +
          '    and Price is null';
        qWork.Open;
        if not qWork.IsEmpty then
          raise Exception.Create(TranslateText('���� ������ ') + qWork.FieldByName('Ser').AsString +
            '/' + qWork.FieldByName('Num').AsString + TranslateText(' �� ���������� !'));

        //--�������� � �������� ��--
        // ����� �� ��������� ������� ��������� �� ��� �������
        // � ������ ������ �� �������� ��
        if not (cbNN_Num.Checked) then//�������� ��
        begin
          if (NNDateLast > dbdeOutDate.Date) then
            raise Exception.Create(eNotLastNN);
          if cbFormRash.Text = '' then
            raise Exception.Create(eFormRasch);
          qCheckerNN.Close;
          qCheckerNN.ParamByName('Dog_id').AsInteger := dbceDog.DataSource.DataSet.FieldByName('Dog_Id').AsInteger;
          qCheckerNN.ParamByName('Dog_inst').AsInteger := dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').AsInteger;
          qCheckerNN.ParamByName('head_Id').AsInteger := dbOutNum.DataSource.DataSet.FieldByName('Id').AsInteger;
          qCheckerNN.ParamByName('head_Inst').AsInteger := dbOutNum.DataSource.DataSet.FieldByName('Inst').AsInteger;
          qCheckerNN.Open;
          if qCheckerNN.IsEmpty then
          begin
            MessageDlg(eAlreadyAllNN, mtInformation, [mbOk], 0);
            cbNN_Num.Checked := true;
            Exit;
          end;
        end;
        if (cbNN_Num.Checked) then //�������� ��
        begin
          if not (qTalon.DataSource.DataSet.FieldByName('NN_Id').IsNull) then
            if MessageDlg(Format(confNNDel,[
              dbtNN_Num.DataSource.DataSet.FieldByName('NN_Num').AsString,
              dbtNN_Num.DataSource.DataSet.FieldByName('NN_Sum').AsString]),
              mtConfirmation, [mbYes, mbNo], 0) <> mrNo then
            begin
                // ������� ���������
              TaxBill := TdmTaxBill.Create;
              try
                TaxBill.DeleteSBRecords10(dbceDog.DataSource.DataSet.FieldByName('NN_Id').AsInteger,
                  dbceDog.DataSource.DataSet.FieldByName('NN_Inst').AsInteger);
                if qTalon.DataSource.DataSet.State = dsBrowse then qTalon.DataSource.DataSet.Edit;
                qTalon.DataSource.DataSet.FieldByName('NN_Id').Clear;
                qTalon.DataSource.DataSet.FieldByName('NN_Inst').Clear;
              finally
                TaxBill.Free;
              end;
            end
            else
            begin //�� ������� ��!
              cbNN_Num.Checked := not (cbNN_Num.Checked);
              raise Exception.Create('del');
            end;
        end;
        //-End-�������� � �������� ��--

        //--�������� ��������--
        if ((dbceDog.Text = '') or (dbdeDogDate.Date = 0)) and (cbFormRash.Text <> TranslateText('��������')) then
          raise Exception.Create(eNoDog);
        // ����� �������� ����� ���������
        if(dbceDog.Text = TranslateText('����'))and(sbAuto.down = True) then
        begin
          dbceDog.Text := IntToStr(GetSeqNextVal('S_OIL_DOG_AUTONUM'));
          sbAuto.Down := False;
        end;
        if (dbceDog.Text <> '') and (dbceDog.DataSource.DataSet.FieldByName('Dog_Id').IsNull) then
        begin
          qWork.Close;
          qWork.SQL.Text := 'select Oil_Dog.Id, Oil_Dog.Inst, Oil_Dog.Dog_Type, TalonOut.Out_Date, TalonOut.Out_Num ' +
            '   from Oil_Dog, (select Dog_Id, Dog_Inst, Out_Date, Out_Num from Oil_Talon_Out where State = ''Y'' and not(Id = ' + dbceDog.DataSource.DataSet.FieldByName('Id').AsString + ' and Inst = ' + dbceDog.DataSource.DataSet.FieldByName('Inst').AsString + ')) TalonOut ' +
            '  where Oil_Dog.State = ''Y'' ' +
            '    and TalonOut.Dog_Id (+) = Oil_Dog.Id ' +
            '    and TalonOut.Dog_Inst (+) = Oil_Dog.Inst ' +
            '    and Dog = ''' + dbceDog.Text + ''' ' +
            '    and Dog_Date = ''' + DateToStr(dbdeDogDate.Date) + ''' ';
          qWork.Open;
          if qWork.FieldByName('Dog_Type').AsString = 'N' then
            raise Exception.Create(eNotTalonDog);
          if not qWork.FieldByName('Out_Date').IsNull then
            raise Exception.Create(TranslateText('��������� ������� ������������� ������� ������� ������� �') +
              qWork.FieldByName('Out_Num').AsString + TranslateText(' �� ') + qWork.FieldByName('Out_Date').AsString + ' !');
          if qWork.IsEmpty then
          begin
            qWork.Close;
            qWork.SQL.Text := 'select s_Oil_Dog.NextVal from Sys.Dual';
            qWork.Open;
            dbceDog.DataSource.DataSet.Edit;
            dbceDog.DataSource.DataSet.FieldByName('Dog_Id').Value := qWork.Fields[0].Value;
            dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').Value := Inst;
            qWork.Close;
            qWork.SQL.Text := 'select * from v_oil_org ' +
              ' where id = ' + dbceDog.DataSource.DataSet.FieldByName('Dep_Id').AsString +
              '   and inst = ' + dbceDog.DataSource.DataSet.FieldByName('Dep_Inst').AsString +
              ' order by def desc';
            qWork.Open;
            RekDepId := qWork.FieldByName('Rek_Id').Value;
            RekDepInst := qWork.FieldByName('Rek_Inst').Value;

            qWork.Close;
            qWork.SQL.Text := 'select * from v_oil_org ' +
              ' where id = ' + dbceDog.DataSource.DataSet.FieldByName('Org_Id').AsString +
              '   and inst = ' + dbceDog.DataSource.DataSet.FieldByName('Org_Inst').AsString +
              ' order by def desc';
            qWork.Open;
            RekOrgId := qWork.FieldByName('Rek_Id').Value;
            RekOrgInst := qWork.FieldByName('Rek_Inst').Value;

            qWork.Close;
            qWork.SQL.Text := 'insert into Oil_Dog(Id, Inst, State, Dog, Dog_Date, Exp_Date, Dog_Type, From_, From_Inst, To_, To_Inst, R_From_, R_From_Inst, R_To_, R_To_Inst, ForePay) ' +
              '  values(' + dbceDog.DataSource.DataSet.FieldByName('Dog_Id').AsString + ', ' +
              dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').AsString + ', ''Y'', ''' +
              dbceDog.Text + ''', ''' +
              DateToStr(dbdeDogDate.Date) + ''', ''' +
              DateToStr(dbdeDogDate.Date) + ''', ''Y'', ' +
              ':DepId, :DepInst, ' +
              dbceDog.DataSource.DataSet.FieldByName('Org_Id').AsString + ', ' +
              dbceDog.DataSource.DataSet.FieldByName('Org_Inst').AsString + ', ' +
              ':RekDepId , :RekDepInst, :RekOrgId, :RekOrgInst, 1)';

            if GENERATION >= 2 then
            begin
              qWork.ParamByName('DepId').DataType := ftInteger;
              qWork.ParamByName('DepId').Value := AVIAS_ID;
              qWork.ParamByName('DepInst').DataType := ftInteger;
              qWork.ParamByName('DepInst').Value := AVIAS_INST;
            end
            else
            begin
              qWork.ParamByName('DepId').DataType := ftInteger;
              qWork.ParamByName('DepId').Value := dbceDog.DataSource.DataSet.FieldByName('Dep_Id').AsInteger;
              qWork.ParamByName('DepInst').DataType := ftInteger;
              qWork.ParamByName('DepInst').Value := dbceDog.DataSource.DataSet.FieldByName('Dep_Inst').AsInteger;
            end;

            qWork.ParamByName('RekDepId').DataType := ftInteger;
            qWork.ParamByName('RekDepId').Value := RekDepId;
            qWork.ParamByName('RekDepInst').DataType := ftInteger;
            qWork.ParamByName('RekDepInst').Value := RekDepInst;
            qWork.ParamByName('RekOrgId').DataType := ftInteger;
            qWork.ParamByName('RekOrgId').Value := RekOrgId;
            qWork.ParamByName('RekOrgInst').DataType := ftInteger;
            qWork.ParamByName('RekOrgInst').Value := RekOrgInst;
            qWork.ExecSQL;
            qWork.SQL.Text := 'insert into Oil_Dog_Detail(Id, State, Dog_Id, Dog_Inst, Count_, NP_Type, Price, Price2, Dim_Id) ' +
              ' select S_oil_Dog_Detail.NextVal as id, t.* from (select ' +
              '  ''Y'', ' + dbceDog.DataSource.DataSet.FieldByName('Dog_Id').AsString + ', ' + dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').AsString + ', sum(Oil_Talon_Data.Nominal), NP_Type.Id, Round(Price * 5 / 6, 6), Price, 28 ' +
              '   from Oil_Talon_Data, (select min(Id) as Id, Grp_Id from Oil_NP_Type group by Grp_Id) NP_Type ' +
              '  where State = ''Y'' ' +
              '    and Oil_Talon_Data.NPGrp_Id = NP_Type.Grp_Id ' +
              '    and Oil_Talon_Data.Head_Id = ' + dbceDog.DataSource.DataSet.FieldByName('Id').AsString +
              '    and Oil_Talon_Data.Head_Inst = ' + dbceDog.DataSource.DataSet.FieldByName('Inst').AsString +
              '  group by Oil_Talon_Data.Inst, NP_Type.Id, Oil_Talon_Data.Price ) t';
            qWork.ExecSQL;

            // ���������/�������� �������
            if not dbceDog.DataSource.DataSet.FieldByName('Dog_Id').IsNull then
              CreateBillWithDog(dbceDog.DataSource.DataSet.FieldByName('Dog_Id').Value,
                dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').Value);
          end
          else
          begin
            dbceDog.DataSource.DataSet.Edit;
            dbceDog.DataSource.DataSet.FieldByName('Dog_Id').Value := qWork.FieldByName('Id').Value;
            dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').Value := qWork.FieldByName('Inst').Value;
          end;
        end; //-End-�������� ��������--

        dbtNN_Num.DataSource.DataSet.Edit;
        dbtNN_Num.DataSource.DataSet.FieldByName('FRasch').AsString := cbFormRash.Text;
      end
      else
      begin //������� �������
        if not (qTalon.DataSource.DataSet.FieldByName('Dog_Id').IsNull) then
          if MessageDlg(eDogDel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            SetState('OIL_DOG', dbceDog.DataSource.DataSet.FieldByName('Dog_Id').AsInteger,
              dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').AsInteger, 'N');
            DelBill(0, 0, dbceDog.DataSource.DataSet.FieldByName('Dog_Id').AsInteger,
              dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').AsInteger); // ��������� �������

            if dbceDog.DataSource.DataSet.State = dsBrowse then dbceDog.DataSource.DataSet.Edit;
            dbceDog.DataSource.DataSet.FieldByName('Dog_Id').Clear;
            dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').Clear;
            dbceDog.DataSource.DataSet.FieldByName('Dog').Clear;
            dbceDog.DataSource.DataSet.FieldByName('Dog_Date').Clear;
          end
          else
            raise Exception.Create(eTypeOrg);
        if dbceDog.DataSource.DataSet.State = dsBrowse then dbceDog.DataSource.DataSet.Edit;
        dbceDog.DataSource.DataSet.FieldByName('Dov_Name').Clear;
        dbceDog.DataSource.DataSet.FieldByName('Dov_Ser').Clear;
        dbceDog.DataSource.DataSet.FieldByName('Dov_Num').Clear;
        dbceDog.DataSource.DataSet.FieldByName('Dov_Date').Clear;
      end;
      if not ConfirmSaleToDeadbeat(SaleToDeadbeat)
        then raise Exception.Create(TranslateText('�������� ��������!'));

      dbceDog.DataSource.DataSet.Post;
      if {IsBeforeFil and }(dbceEdOper.DataSource.DataSet.FieldByName('Oper_Id').AsInteger=200) then
      begin
        if GetSqlValue('select user from dual') = 'ANDRIY' then
          NextUser := 'VICTORY'
        else
          NextUser := 'ANDRIY';
        if (NumOld<>'') and (NumOld<>dbOutNum.Text) then
          _ExecSql(Format(
            ' update '+NextUser+'.oil_talon_prih set prih_num=%s '+
            ' where state=''Y'' and prih_num=%s and prih_date=''%s''',
            [dbOutNum.Text,NumOld,DateToStr(dbdeOutDate.Date)]));
        _ExecProc('CR_TP_MIRROR',
          ['P_ID',    qTalon.DataSource.DataSet.FieldByName('Id').AsInteger,
           'P_INST',  qTalon.DataSource.DataSet.FieldByName('Inst').AsInteger
          ],false);
      end;
      CommitSQL;
    except
      on E: Exception do
      begin
        qWork.Close;
        qWork.SQL.Text := 'rollback to ApplyUpdates';
        qWork.ExecSQL;
        if E.Message <> 'del' then
          ShowMessage(E.Message);
        Breaked := true;
      end;
    end;
    if Breaked then Exit;

    //--�������� ��--
    if not (cbNN_Num.Checked) then
    begin
      try

        TaxBill := TdmTaxBill.Create(
          dbceOrgName.DataSource.DataSet.FieldByName('Org_Id').AsInteger,
          dbceOrgName.DataSource.DataSet.FieldByName('Org_Inst').AsInteger
          );
        try
          // ������ ��������� ��
          TaxBill.Options.Date := DateToStr(dbdeOutDate.Date);
          TaxBill.Options.DogId := dbceDog.DataSource.DataSet.FieldByName('Dog_Id').Value;
          TaxBill.Options.DogInst := dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').Value;
          // ����� �� ��������
          qWork.Close;
          qWork.SQL.Text := 'select from_ as from_id, from_inst from oil_dog where id = :id and inst = :inst';
          _OpenQueryPar(qWork,
            ['id',  dbceDog.DataSource.DataSet.FieldByName('Dog_Id').Value,
             'inst',dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').Value]);
          TaxBill.Options.FromId := qWork.FieldByName('from_id').AsInteger;
          TaxBill.Options.FromInst := qWork.FieldByName('from_inst').AsInteger;
          TaxBill.Options.Scheme := Talon;
          TaxBill.Options.TaxBillType := 12;
          TaxBill.Options.TaxBillInst := dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').Value;
          TaxBill.Options.OIL_NN_Type := 2;
          TaxBill.Options.OIL_NN_Cause := 20;
          TaxBill.Options.ByDogName := TranslateText('������ �������� ������������� ������������� � ') + dbOutNum.Text;
          TaxBill.Options.OperName := cbFormRash.Text;
          if not (
            qTalon.DataSource.DataSet.FieldByName('NN_Id').IsNull
            or dbtNN_Num.DataSource.DataSet.FieldByName('NN_Num').IsNull
            or dbtNN_Num.DataSource.DataSet.FieldByName('NN_Inst').IsNull)
            then
          begin
            TaxBill.Options.Num := dbtNN_Num.DataSource.DataSet.FieldByName('NN_Num').AsString;
            TaxBill.Options.TaxBillId := qTalon.DataSource.DataSet.FieldByName('NN_Id').Value;
            TaxBill.Options.TaxBillInst := qTalon.DataSource.DataSet.FieldByName('NN_Inst').Value;
          end;
          repeat
            TaxBill.AddPosition(
              qCheckerNN.FieldByName('np_grp_id').AsInteger,
              28,
              DateToStr(dbdeOutDate.Date),
              qCheckerNN.FieldByName('Count_').AsFloat,
              qCheckerNN.FieldByName('price').AsFloat
              );
            NN_SUM := NN_SUM + (qCheckerNN.FieldByName('Count_').AsFloat *
              qCheckerNN.FieldByName('price').AsFloat);
            qCheckerNN.Next;
          until qCheckerNN.Eof;
          NN_SUM := FRound(NN_SUM, 2);
        finally
         //������� ����������� �� �.�. �� ����� ��� �� �����������, ������������
          if (not qTalon.DataSource.DataSet.FieldByName('NN_Id').IsNull) then
            TaxBill.DeleteSBRecordsDet(
              TaxBill.Options.TaxBillId,
              TaxBill.Options.TaxBillInst,
              TaxBill.Options.TaxBillType
              );
          TaxBill.Make(False);
          if qTalon.DataSource.DataSet.State = dsBrowse then qTalon.DataSource.DataSet.Edit;
          if qTalon.DataSource.DataSet.FieldByName('NN_Num').IsNull then
            ShowMessage( Format(infNNCreate,[TaxBill.Options.Num,NN_SUM]) );
          qTalon.DataSource.DataSet.FieldByName('NN_Id').Value := TaxBill.Options.TaxBillId;
          qTalon.DataSource.DataSet.FieldByName('NN_Inst').Value := Inst;
          qTalon.DataSource.DataSet.FieldByName('NN_Num').Value := TaxBill.Options.Num;
          Nal_t := TaxBill.Options.TaxBillType;
          TaxBill.free;
        end;
        dbtNN_Num.DataSource.DataSet.Edit;
        qWork.Close;
        qWork.SQL.Text := 'update Oil_Talon_Out set nn_id = ' +
          qTalon.DataSource.DataSet.FieldByName('NN_Id').AsString + ',nn_inst = ' +
          qTalon.DataSource.DataSet.FieldByName('NN_Inst').AsString +
          '  where Id = ' + IntToStr(dbOutNum.DataSource.DataSet.FieldByName('Id').AsInteger) +
          '    and Inst = ' + IntToStr(dbOutNum.DataSource.DataSet.FieldByName('Inst').AsInteger);
        qWork.ExecSQL;
      except
        on E: Exception do
        begin
          qWork.Close;
          qWork.SQL.Text := 'rollback to ApplyUpdates';
          qWork.ExecSQL;
          ShowMessage(E.Message);
        end;
      end;
    end;
    //-End-�������� ��--

    ModalResult := MrOk;
  finally
    bbOk.Enabled := true;
  end;
end;
//==============================================================================
function GetVsUkrTalonCode(p_Num: integer): integer;
var
  limit, CodOblTalon: integer;
begin
  limit := 10000000;
  try
    Result := nvl(GetSQLValue(
      'select nvl(max(talon_code), -1) from oil_talon_codes' +
      ' where id = (select obl_id from v_main_org)' +
      '    or id = (select obl_id from v_dual_org)'), -1);

    if Result = -1 then
      raise Exception.Create(TranslateText('��� ������� ����������� �� ��������� ��� ������������� �������'));

    CodOblTalon := p_Num div limit;
    if (CodOblTalon <> 75) or ((CodOblTalon = 75) and (MAIN_ORG.OblId = 474)) then
      Result := CodOblTalon
    else
      raise Exception.Create(
        TranslateText('������� ����������� �� ����� ����� ��������� ������������� ����� � �����: ')+ IntToStr(CodOblTalon));
  except on E: Exception do
    raise Exception.Create(
      TranslateText('������ ��� ������ ��������� ��������� ���� ����������� ')+ #13#10 + E.Message);
  end;
end;
//==============================================================================
function ProcessBarCode(p_Code: string; pp_Q: TOilQuery; TypeOper: TTypeOper;
  InTheWay: integer=2): Boolean;
var
  VsUkr: Boolean;
  ser: string;
  num, vTalonCode: integer;
  tof:TTalonOutForm;
  //****************************************************************************
  function IsVsUkrMotion:boolean;
  begin
    result:= 'Y'=GetSQLValue('select nvl(ov.getval(''TALON_VSUKR''),''N'') from dual');
  end;
  //****************************************************************************
begin
  try
    pp_Q.DisableControls;
    tof:=TTalonOutForm.Create(nil);
    tof.log(' ');
    tof.log('���� � ProcessBarCode');
    result:=false;
    try
      tof.log(p_Code);
      VsUkr:=length(p_Code)=16;
      tof.log('VsUkr='+BoolToDaNet(VsUkr));
      ser:=copy(p_Code,5,3);
      tof.log(ser);

      if ser[1] = '�' then ser[1] := 'A';
      if ser[1] = '�' then ser[1] := 'B';
      if ser[1] = '�' then ser[1] := 'C';
      if ser[1] = '�' then ser[1] := 'D';
      if ser[1] = '�' then ser[1] := 'E';
      if ser[1] = '�' then ser[1] := 'F';

      try
        if VsUkr then
        begin
          num:=StrToInt(Copy(p_Code, 8, 9));
          tof.log(Copy(p_Code, 8, 9));
        end
        else
        begin
          num:= StrToInt(Copy(p_Code, 8, 7));
          tof.log(Copy(p_Code, 8, 7));
        end;
      except on e:Exception do
        raise Exception.Create(TranslateText('������ ���������, �������� ������������ !')+#10#13+e.Message);
      end;

      vTalonCode := StrToInt(Copy(p_Code, 1, 2));
      if(not(IsVsUkrMotion)and(VsUkr))or not(VsUkr)then
      begin
        if vTalonCode=8 then vTalonCode:=7;
        if(vTalonCode<>MAIN_ORG.Talon_Code)and(vTalonCode<>GetVsUkrTalonCode(num))
        then
        begin
          if (MainForm.qOrg.FieldByName('Talon_Code').AsInteger <> 7) then
            raise Exception.Create(TranslateText('����� �� ����������� ������ �����������!'));
        end;
      end;
      //���� ������������� ����� �� � ����������� ��
        case TypeOper of
          toOtpysk://��������� ����� ������ ���� ������
            begin
              if VsUkr then
                if(vTalonCode<>GetVsUkrTalonCode(num))then
                  raise Exception.Create(TranslateText('����� �� ����������� ������ �����������, ������ ���������� ������ �������!'));
            end;
          toPrihod:;//����������� ����� ����� �����
          toMotionOtpysk://������������� ������
            begin
              if not(IsVsUkrMotion)then
                raise Exception.Create(TranslateText('���������� ������ ������ � ����� ���������!'));
              if not(VsUkr)then
                raise Exception.Create(TranslateText('����� ��� �������� �������� ����������� ������ �� �������������� ��������!'));
            end;
          toMotionPrihod://������������� ������
            begin
              if not(IsVsUkrMotion)then
                raise Exception.Create(TranslateText('���������� ������ ������ � ����� ���������!'));
              if(vTalonCode<>GetVsUkrTalonCode(num))and(VsUkr)then
                raise Exception.Create(TranslateText('����� �� ����������� ������ �����������, ������ ���������� ������!'));
              if not(VsUkr)then
                raise Exception.Create(TranslateText('����� ��� ���� ���� �������� ����������� ������ �� �������������� ��������!'));
            end;
        end;//case

      begin
        tof.log('��������� ������');
        pp_Q.Append;
        pp_Q.FieldByName('npgrp_id').AsInteger:=GetTalonGroupBySer(ser,VsUkr);
        pp_Q.FieldByName('nominal').AsInteger:=GetTalonNominalBySer(ser);
        pp_Q.FieldByName('ser').AsString:=ser;
        pp_Q.FieldByName('num').AsInteger:=num;
        if TypeOper = toSrPrihod then
          pp_Q.FieldByName('InTheWay').AsInteger := InTheWay;
        tof.log('������ ������');
        pp_Q.Post;
        tof.log('��������� ������');
      end;

      result:=true;
    except on e:Exception do
      begin
        if DR_AUTOLOAD then raise Exception.Create(e.Message)
        else MessageDlg(e.Message, mtError, [], 0);
      end;
    end;
    tof.log('����� �� ProcessBarCode');
    tof.free;
  finally
    pp_Q.EnableControls;
  end;
end;
//==============================================================================
function GetTalonNominalBySer(p_ser:string):integer;
begin
  result:=-1;
  try
    case StrToInt(Copy(p_ser,2,2)) of
      0:{ 5} result:=5;
      1:{10} result:=10;
      2:{20} result:=20;
      3:{50} result:=50;
    end;
  except on e:exception do
    Raise Exception.Create(TranslateText('������ ��� ���������� ��������!  ') + e.message);
  end;
end;
//==============================================================================
function GetTalonGroupBySer(p_ser:string;IsVsUkr:boolean=false):integer;
begin
  try
    case p_ser[1] of
      'A':{76-80}
        begin
          if IsVsUkr then
            result:=5
          else
            result:=4;
        end;
      'B':{92} result:=6;
      'C':{95} result:=7;
      'E':{98} result:=10;
      'D':{DT} result:=3;
      'F':{Gaz} result:=62;
      else
        raise Exception.Create(TranslateText('��������� �����!'));
    end;
  except on e:exception do
    Raise Exception.Create(TranslateText('������ ��� ���������� ����� ��! ����� ')+p_ser+'.'+ e.message);
  end;
end;
//==============================================================================
procedure TTalonOutForm.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  KeyPressCode(Self,Sender,qTalon,Key);
end;
//==============================================================================
procedure TTalonOutForm.sbDelClick(Sender: TObject);
begin
  try
    TSpeedButton(Sender).Enabled:=False;
    if not qTalon.IsEmpty then
     qTalon.Delete;
  finally
    TSpeedButton(Sender).Enabled:=True;
  end;
end;
//==============================================================================
procedure TTalonOutForm.qTalonAfterPost(DataSet: TDataSet);
var Ser: string;
  Num: Integer;
begin
  try    
    qTalon.ApplyUpdates;
    qTalon.CommitUpdates;
    Ser := qTalon.FieldByName('Ser').AsString;
    Num := qTalon.FieldByName('Num').AsInteger;
    qTalon.Close;
    qTalon.Open;
    qTalon.DisableControls;
    while not ((qTalon.Eof) or ((Ser = qTalon.FieldByName('Ser').AsString)
      and (Num = qTalon.FieldByName('NUM').AsInteger))) do qTalon.Next;
    qTalon.EnableControls;

    AutoId := qTalon.FieldByName('Auto_Id').AsInteger;
    AutoInst := qTalon.FieldByName('Auto_Inst').AsInteger;
    EmployId := qTalon.FieldByName('Employ_Id').AsInteger;
    EmployInst := qTalon.FieldByName('Employ_Inst').AsInteger;

    qSum.Close;
    qSum.ParamByName('Id').Value := dbOutNum.DataSource.DataSet.FieldByName('Id').Value;
    qSum.ParamByName('Inst').Value := dbOutNum.DataSource.DataSet.FieldByName('Inst').Value;
    qSum.Open;

    //������� ���� ������� ����� ����� ������� ������
    if(qTalon.RecordCount=1)then
      FDocDate:=dbdeOutDate.Date;
  except on E: Exception do
    begin
      ShowMessage(E.Message);
      qTalon.EnableControls;
    end;
  end;
end;
//==============================================================================
function TTalonOutForm.TestTalon( ASer:string;ANum:integer;ATestOnly:boolean=false ): integer;
var
  Talon:TTalon;
begin
  log('���� � ProvOutTalon');
  log('�������� - ����� ������ �������� ��������� ������� !');
  try
    Talon:=TTalon.Create(ASer,ANum,FTalonPrice);
  except
    Result := 1; // ����� ������ �������� ��������� ������� !;
    //Talon.Free;
    Exit;
  end;
  try
    log('�������� - ����� ��� ������ !,����� �� ������ � �������� !');
    qCheckDown.Close;
    qCheckDown.Prepare;
    qCheckDown.ParamByName('Ser').AsString   := Talon.Ser;
    qCheckDown.ParamByName('Num').AsInteger  := Talon.Num;
    qCheckDown.ParamByName('Inst').AsInteger := Inst;
    qCheckDown.ParamByName('Date_').AsDate   := dbdeOutDate.Date;
    qCheckDown.Open;

    if qCheckDown.Fields[1].AsInteger = 2 then
    begin
      Result := 2; // ����� ��� ������ !
      exit;
    end;

    if qCheckDown.Fields[1].AsInteger = 1 then
    begin
      qCheckWay.Close;
      qCheckWay.Prepare;
      qCheckWay.ParamByName('Ser').AsString       := Talon.Ser;
      qCheckWay.ParamByName('Num').AsInteger      := Talon.Num;
      qCheckWay.ParamByName('Rep_id').AsInteger   := qCheckDown.FieldByName('Srep_id').AsInteger;
      qCheckWay.ParamByName('Rep_inst').AsInteger := qCheckDown.FieldByName('Srep_inst').AsInteger;
      qCheckWay.Open;
      if not qCheckWay.IsEmpty then
      begin
        Result := 8; // ����� ��������� � ���� !
        exit;
      end;
    end;

    if qCheckDown.IsEmpty then
    begin
      Result := 3; // ����� �� ������ � �������� !
      exit;
    end;
    log('�������� - ����� ������ ����� !');
    qCheckUp.Close;
    qCheckUp.Prepare;
    qCheckUp.ParamByName('MainId').Value := qTalon.DataSource.DataSet.FieldByName('Id').Value;
    qCheckUp.ParamByName('MainInst').Value := qTalon.DataSource.DataSet.FieldByName('Inst').Value;
    qCheckUp.ParamByName('Ser').AsString := Talon.Ser;
    qCheckUp.ParamByName('Num').AsInteger := Talon.Num;
    qCheckUp.ParamByName('Inst').AsInteger := Inst;
    qCheckUp.ParamByName('Date_').AsDate := dbdeOutDate.Date;
    qCheckUp.Open;

    if qCheckUp.Fields[1].AsInteger = 2 then
      begin
        Result := 4; // ����� ������ ����� !
        exit;
      end;

    if( not ATestOnly )then
    begin
      log('�������� ������������');
      qTalon.Edit;
      log('����������� ������');
      qTalon['npgrp_id'] :=Talon.NpGroup;
      log('����������� �������');
      qTalon.FieldByName('Nominal').Value:=Talon.Nominal;

      if qTalon.State = dsInsert then
      begin
        log('����� �������');
        qTalon.FieldByName('Id').AsInteger := GetSeqNextVal('s_oil_talon_data');
        qTalon.FieldByName('Inst').AsInteger := Inst;
        log('����������� Id,Inst,Head_Id,Head_Inst');
        qTalon.FieldByName('Head_Id').AsInteger := qTalon.DataSource.DataSet.FieldByName('Id').AsInteger;
        qTalon.FieldByName('Head_Inst').AsInteger := qTalon.DataSource.DataSet.FieldByName('Inst').AsInteger;
        if AutoId > 0 then
        begin
          log('����������� Auto_Id,Auto_Inst');
          qTalon.FieldByName('Auto_Id').AsInteger := AutoId;
          qTalon.FieldByName('Auto_Inst').AsInteger := AutoInst;
        end;
        if EmployId > 0 then
        begin
          log('����������� Employ_Id,Employ_Inst');
          qTalon.FieldByName('Employ_Id').AsInteger := EmployId;
          qTalon.FieldByName('Employ_Inst').AsInteger := EmployInst;
        end;

        log('�������� - ����� � ����� ������ ����������� !');
        qCheckDouble.Close;
        qCheckDouble.Prepare;
        qCheckDouble.ParamByName('Head_Id').Value := qTalon.DataSource.DataSet.FieldByName('Id').Value;
        qCheckDouble.ParamByName('Head_Inst').Value := qTalon.DataSource.DataSet.FieldByName('Inst').Value;
        qCheckDouble.ParamByName('Ser').AsString := Talon.Ser;
        qCheckDouble.ParamByName('Num').AsInteger := Talon.Num;
        qCheckDouble.ParamByName('Id').Value := qTalon.FieldByName('Id').Value;
        qCheckDouble.ParamByName('Inst').Value := qTalon.FieldByName('Inst').Value;
        qCheckDouble.Open;

        if not qCheckDouble.IsEmpty then
        begin
          Result := 5; // ����� � ����� ������ ����������� !
          exit;
        end;
      end;

      log('����������� Price');
      if (qTalon.FieldByName('Price').AsFloat = 0) or qTalon.FieldByName('Price').IsNull then
        qTalon.FieldByName('Price').AsFloat:=Talon.Price;

      if dbceDog.DataSource.DataSet.FieldByName('Dog_Id').Value <> Null then
      begin
        log('�������� ��������');
        log('��������� qTalonSum');
        //CommitSql;//!!!
        qTalonSum.Close;
        qTalonSum.Prepare;
        _OpenQueryPar(qTalonSum,
          ['ser',Talon.Ser,
           'num',Talon.Num,
           'head_id',dbceDog.DataSource.DataSet.FieldByName('Id').AsInteger,
           'head_inst',dbceDog.DataSource.DataSet.FieldByName('Inst').AsInteger,
           'np_grp_id',Talon.NpGroup]
          );
        //�� ������������� �����
        if( not qDog.Active )or( qDog.IsEmpty )
          or(qDog.ParamByName('dog_id').AsInteger<>dbceDog.DataSource.DataSet.FieldByName('Dog_Id').AsInteger)
          or(qDog.ParamByName('dog_inst').AsInteger<>dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').AsInteger)
        then
        begin
          log('��������� qDog');
          qDog.Close;
          qDog.Prepare;
          _OpenQueryPar(qDog,
            ['dog_id',dbceDog.DataSource.DataSet.FieldByName('Dog_Id').AsInteger,
             'dog_inst',dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').AsInteger ]
            );
        end;

        log('��������� ��������');
        qTalonSum.First;
        qDog.First;
        qDog.Filtered:=False;
        qDog.Filter:=format(' np_grp_id=%d ',[Talon.NpGroup]);
        qDog.Filtered:=True;
        if qDog.IsEmpty then
        begin
          Result := 7; // ������ �������� ����� �.�. � �������� ��� ������ ���� ������������� - ��������������� ������� ��� ����� ������.
          exit;
        end
        else //if (qTalon.FieldByName('NPGrp_Id').AsInteger = qDog.FieldByName('np_grp_id').AsInteger) then
        begin
          if( qDog.FieldByName('symma').AsFloat+0.01<qTalonSum.FieldByName('symma').AsFloat
            +FRound(Talon.Nominal*qTalon.FieldByName('Price').AsFloat,2) )
            or ( qDog.FieldByName('count_').AsFloat+0.01<qTalonSum.FieldByName('count_').AsFloat
            +Talon.Nominal)
          then
          begin
            log('qDog.FieldByName(''symma'').AsFloat'+FloatToStr(qDog.FieldByName('symma').AsFloat) );
            log('qTalonSum.FieldByName(''symma'').AsFloat'+FloatToStr(qTalonSum.FieldByName('symma').AsFloat) );
            log('FRound(qTalon.FieldByName(''Nominal'').AsFloat*qTalon.FieldByName(''Price'').AsFloat,2)'+FloatToStr(FRound(qTalon.FieldByName('Nominal').AsFloat*qTalon.FieldByName('Price').AsFloat,2)) );
            log('qDog.FieldByName(''count_'').AsFloat'+FloatToStr(qDog.FieldByName('count_').AsFloat) );
            log('qTalonSum.FieldByName(''count_'').AsFloat'+FloatToStr(qTalonSum.FieldByName('count_').AsFloat) );
            log('qTalon.FieldByName(''Nominal'').AsFloat'+FloatToStr(qTalon.FieldByName('Nominal').AsFloat) );
            log('qTalon.FieldByName(''Price'').AsFloat'+FloatToStr(qTalon.FieldByName('Price').AsFloat) );
            log('qTalonSum.FieldByName(''Price'').AsFloat'+FloatToStr(qTalonSum.FieldByName('Price').AsFloat) );
            log('qTalonSum.FieldByName(''cnt'').AsFloat'+FloatToStr(qTalonSum.FieldByName('cnt').AsFloat) );
            Result := 6; // ������ �������� ����� �.�. ����� ��� ���������� ����� ��������� ������ �������� - ��������������� ������� ��� ����� ������.
            exit;
          end
        end;
      end; //if dbceDog.DataSource.DataSet.FieldByName('Dog_Id').Value <> Null
    end;  //if( not ATestOnly )then
  finally
    Talon.free;
  end;
  Result := 0;
  log('����� �� ProvOutTalon');
end;
//==============================================================================
procedure TTalonOutForm.qTalonBeforePost(DataSet: TDataSet);
var
   Ser: string;
   Num,CodeObl: integer;
begin
  try
    Ser := qTalon.FieldByName('Ser').AsString;
    Num := qTalon.FieldByName('Num').AsInteger;

    if(dbceDog.Text = '')and
      not((dbceEdOper.DataSource.DataSet.FieldByName('Oper_Id').AsInteger in [191,192,193,200,217,244]) or
          (dbceEdOper.DataSource.DataSet.FieldByName('Oper_Id').AsInteger = 269)) then
      raise Exception.Create(TranslateText('����� ������ ������� ���������� ������/������� �������.'));

    if dbdeOutDate.Date = 0 then raise Exception.Create(TranslateText('�� ���������� ���� ������� !'));

    if (qTalon.FieldByName('Ser').AsString = '') or (qTalon.FieldByName('NUM').AsInteger = 0) then
      raise Exception.Create(TranslateText('�����/����� ������ �� ���������� !'));

    if CheckDestrTalon(ser,num)=true then
     raise Exception.Create(TranslateText('����� '+ser+inttostr(num)+' ������!'));

    TalonExceptionHandler( TestTalon(Ser, Num),Ser,Num,toOtpysk,teoExcept );
{    case ProvOutTalon(Ser, Num) of
      1: raise Exception.Create(TranslateText('����� ������ �������� ��������� ������� !'));
      2: raise Exception.Create(TranslateText('����� ') + qTalon.FieldByName('Ser').AsString + '/' + qTalon.FieldByName('NUM').AsString + ' ��� ������ !');
      3: raise Exception.Create(TranslateText('����� ') + qTalon.FieldByName('Ser').AsString + '/' + qTalon.FieldByName('NUM').AsString + ' �� ������ � �������� !');
      4: raise Exception.Create(TranslateText('����� ') + qTalon.FieldByName('Ser').AsString + '/' + qTalon.FieldByName('NUM').AsString + ' ������ ����� !');
      5: raise Exception.Create('����� "' + qTalon.FieldByName('Ser').AsString + '" � ����� ' + qTalon.FieldByName('NUM').AsString + ' ������ ����������� !');
      6: raise Exception.Create(TranslateText('������ �������� ����� �.�. �� ����� ��� ���������� ����� ���������') + #13 +
           '������ �������� - ��������������� ������� ��� ����� ������.');
      7: raise Exception.Create(TranslateText('������ �������� ����� �.�. � �������� ��� ������ ') + #13 +
           '���� ������������� - ��������������� ������� ��� ����� ������.');
    end;}
    log('����� � ����������� ��� ����');
    CodeObl:=GetOblByTalonNum(num);
    if CodeObl=0 then
      raise exception.create(TranslateText('�� ������ ��� ���� ��� ������ ')+ser+' �'+IntToStr(num));
    qTalon.FieldByName('code_obl').AsInteger:=CodeObl;
    log('����� � ��������� ��� ����');
  except on E:Exception do
    begin
      qTalon.Cancel;
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TTalonOutForm.qTalonBeforeDelete(DataSet: TDataSet);
begin
  qCheckUp.Close;
  qCheckUp.ParamByName('MainId').AsInteger := qTalon.DataSource.DataSet.FieldByName('Id').AsInteger;
  qCheckUp.ParamByName('MainInst').AsInteger := qTalon.DataSource.DataSet.FieldByName('Inst').AsInteger;
  qCheckUp.ParamByName('Ser').AsString := qTalon.FieldByName('Ser').AsString;
  qCheckUp.ParamByName('Num').AsInteger := qTalon.FieldByName('Num').AsInteger;
  qCheckUp.ParamByName('Inst').AsInteger := Inst;
  qCheckUp.ParamByName('Date_').AsDate := dbdeOutDate.Date;
  qCheckUp.Open;
  if qCheckUp.Fields[1].AsInteger = 1
    then raise Exception.Create(TranslateText('����� ') + qTalon.FieldByName('Ser').AsString + '/' + qTalon.FieldByName('NUM').AsString + TranslateText(' ������ �������, �� �������� ') + qCheckUp.Fields[0].AsString + ' !');
end;

procedure TTalonOutForm.sbAddClick(Sender: TObject);
var
  Ser: string;
  Num: Integer;
begin
  Ser := qTalon.FieldByName('Ser').AsString;
  Num := qTalon.FieldByName('NUM').AsInteger;
  qTalon.Append;
  qTalon.FieldByName('Ser').AsString := Ser;
  qTalon.FieldByName('NUM').AsInteger := Num + 1;
  qTalon.Post;
end;

procedure TTalonOutForm.dbgTalonExit(Sender: TObject);
begin
  if qTalon.State <> dsBrowse then qTalon.Post;
end;

procedure TTalonOutForm.N1Click(Sender: TObject);
var
  DF: TDiapForm;
  SN, EN, i: Integer;
begin
  DF := TDiapForm.Create(Application);
  DF.ShowModal;
  if DF.ModalResult = MrOk then
  begin
    SN := StrToInt(DF.Edit1.Text);
    EN := StrToInt(DF.Edit2.Text);
    for i := SN to EN do
    begin
      qTalon.Append;
      qTalon.FieldByName('Ser').AsString := DF.Edit3.Text;
      qTalon.FieldByName('NUM').AsInteger := i;
      qTalon.FieldByName('PRICE').AsCurrency := DF.CE.Value;
      qTalon.Post;
    end;
  end;
  DF.Free;
end;

procedure TTalonOutForm.FormShow(Sender: TObject);
begin
  DogEdit := False;
  // ��������� �� ����� ���� ��������
  if LAUNCH_MODE <> 'GREAT_OIL' then
    qTalonDetail.SQL.Strings[10] := '';
  qTalon.Open;
  qTalonDetail.Open;
  qSum.ParamByName('Id').Value := dbOutNum.DataSource.DataSet.FieldByName('Id').Value;
  qSum.ParamByName('Inst').Value := dbOutNum.DataSource.DataSet.FieldByName('Inst').Value;
  qSum.Open;
  if dbceOrgName.DataSource.DataSet.FieldByName('NN_PRICE').Value = null then
    LabelValuta.Visible := False;
  LabelValuta.Left := dbtNN_Sum.Left + dbtNN_Sum.Width + 2;
  if not (qTalon.IsEmpty) and (not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4])) then
    sbPriceClick(nil);//���� �������
  InStr := '';
  ChStr := '';
  AutoId := 0;
  AutoInst := 0;
  EmployId := 0;
  EmployInst := 0;
  ChangeOrgType;
  cbNN_NumClick(nil);
  dbdeDogDate.Enabled := dbceDog.DataSource.DataSet.FieldByName('Dog_Id').IsNull;
end;

procedure TTalonOutForm.dbceOrgNameDblClick(Sender: TObject);
var
  vId, vInst, Idx: Integer;
  vName: string;
  qTemp: TOilQuery;
  Flags: string;
begin
  Flags := 'nyynnnyn'; Idx := 3;
  case dbceEdOper.DataSource.DataSet.FieldByName('Oper_Id').AsInteger of
    191:
      begin
        Flags := 'nyyyynnn';
        Idx := 1;
      end;
    192, 193:
      begin
        Flags := 'nnyyynnn';
        Idx := 1;
      end;
    269:
      begin
        Flags := 'yyyyynnn';
        Idx := 1;
      end;
  end;

  if ChooseOrg.CaptureOrgExt(Idx, MAIN_ID, INST, Flags, vId, vInst, vName, qTemp) then
  begin
    if not (qTemp.FieldByName('Org_Id').AsInteger in [1, 3, 4, 5, 11])
      then raise Exception.Create(TranslateText('������ ������������ ��� ����������� !'));

    if not InitNewOrg(vId, vInst, vName, dbceDog.DataSource.DataSet.FieldByName('Id').AsInteger,
      dbceDog.DataSource.DataSet.FieldByName('Inst').AsInteger,
      'OIL_TALON_OUT', SaleToDeadbeat)
      then Abort;

    if not (dbceOrgName.DataSource.DataSet.FieldByName('Dog_Id').IsNull) then
    begin
      qWork.Close;
      qWork.SQL.Text := 'select To_, To_Inst from Oil_Dog '
        +' where Id = :id'
        +'   and Inst = :inst';
      _OpenQueryPar(qWork,
        ['id',dbceOrgName.DataSource.DataSet.FieldByName('Dog_Id').AsInteger,
         'inst',dbceOrgName.DataSource.DataSet.FieldByName('Dog_Inst').AsInteger]);
      if (qWork.FieldByName('To_').AsInteger <> vId) or (qWork.FieldByName('To_Inst').AsInteger <> vInst) then
      begin
        if MessageDlg(TranslateText('��������� ����������� �� ��������� � ������������ � ��������. ������ ������� ?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          if dbceDog.DataSource.DataSet.State = dsBrowse then dbceDog.DataSource.DataSet.Edit;
          dbceDog.DataSource.DataSet.FieldByName('Dog_Id').Clear;
          dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').Clear;
          dbceDog.DataSource.DataSet.FieldByName('Dog').Clear;
          dbceDog.DataSource.DataSet.FieldByName('Dog_Date').Clear;
        end
        else Abort;
      end;

      sbAutoClick(nil);
      dbceDog.DirectInput := dbceDog.DataSource.DataSet.FieldByName('Dog_Id').IsNull;
      dbdeDogDate.Enabled := dbceDog.DataSource.DataSet.FieldByName('Dog_Id').IsNull;
    end;

    if dbceOrgName.DataSource.DataSet.State = dsBrowse then dbceOrgName.DataSource.DataSet.Edit;
    dbceOrgName.DataSource.DataSet.FieldByName('Org_Id').AsInteger := vId;
    dbceOrgName.DataSource.DataSet.FieldByName('Org_Inst').AsInteger := vInst;
    dbceOrgName.DataSource.DataSet.FieldByName('Org_Name').AsString := vName;
    dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsVariant := qTemp.FieldByName('Org_Id').AsVariant;
    dbceOrgName.DataSource.DataSet.FieldByName('Org_Nal_Num').AsVariant := qTemp.FieldByName('Nal_Num').AsVariant;
    dbceOrgName.DataSource.DataSet.FieldByName('Org_Svid_Num').AsVariant := qTemp.FieldByName('Svid_Num').AsVariant;
    dbceOrgName.DataSource.DataSet.FieldByName('Org_Addr').AsVariant := qTemp.FieldByName('Addr').AsVariant;
    dbceOrgName.DataSource.DataSet.FieldByName('Org_Boss').AsVariant := qTemp.FieldByName('Boss').AsVariant;
    dbceOrgName.DataSource.DataSet.FieldByName('Org_OKPO').AsVariant := qTemp.FieldByName('Id_Num').AsVariant;
    dbceOrgName.DataSource.DataSet.FieldByName('Org_Phone').AsVariant := qTemp.FieldByName('Phone').AsVariant;
    ChangeOrgType;
    cbNN_NumClick(nil);

    if {IsBeforeFil and}
      (dbceOrgName.DataSource.DataSet.FieldByName('Org_Id').AsInteger   = INST_FIL) and
      (dbceOrgName.DataSource.DataSet.FieldByName('Org_Inst').AsInteger = INST_FIL) then
    begin
      dbceEdOper.DataSource.DataSet.Edit;
      dbceEdOper.DataSource.DataSet.FieldByName('Oper_Id').AsInteger  := 200;
      dbceEdOper.DataSource.DataSet.FieldByName('Oper_Name').AsString := TranslateText(GetOperationName(200));
      dbceEdOper.DataSource.DataSet.Post;
    end;
  end;
end;

procedure TTalonOutForm.dbceDogDblClick(Sender: TObject);
var
  Dog: TDogRefForm;
  ExistNPinDog: Boolean;
begin
  if sbAuto.Down then
    exit; 
  Application.CreateForm(TDogRefForm, Dog);
  Dog.rbYes.Checked := True;
  Dog.rbYes.Enabled := False;
  Dog.rbNo.Enabled := False;
  Dog.rbKart.Enabled := False;
  Dog.rbVed.Enabled := False;
  Dog.rbService.Enabled := False;

  Dog.ToCommit := False;

  if not (dbceDog.DataSource.DataSet.FieldByName('Org_Id').IsNull) then
  begin
    Dog.eTo.Tag := dbceDog.DataSource.DataSet.FieldByName('Org_Id').AsInteger;
    Dog.lTo.Tag := dbceDog.DataSource.DataSet.FieldByName('Org_Inst').AsInteger;
    Dog.eTo.Text := dbceDog.DataSource.DataSet.FieldByName('Org_Name').AsString;
    Dog.eTo.Enabled := False;
    Dog.sbToClear.Enabled := False;
  end;
  Dog.ShowModal;

  if Dog.ModalResult = mrOk then // ������� ������, ��������� ���...
  begin
    DogEdit := True;
    qWork.Close;
    qWork.SQL.Text := 'select Oil_Dog.Dog_Type, TalonOut.Out_Date, TalonOut.Out_Num ' +
      '   from Oil_Dog, (select Dog_Id, Dog_Inst, Out_Date, Out_Num from Oil_Talon_Out where State = ''Y'' and not(Id = ' + dbceDog.DataSource.DataSet.FieldByName('Id').AsString + ' and Inst = ' + dbceDog.DataSource.DataSet.FieldByName('Inst').AsString + ')) TalonOut ' +
      '  where Oil_Dog.State = ''Y'' ' +
      '    and TalonOut.Dog_Id (+) = Oil_Dog.Id ' +
      '    and TalonOut.Dog_Inst (+) = Oil_Dog.Inst ' +
      '    and Dog = :dog'+
      '    and Dog_Date = :dog_date';
    _OpenQueryPar(qWork,
      ['dog',dog.q.fieldbyname('dog').AsString,
       'dog_date',dog.q.fieldbyname('Dog_Date').AsDateTime]);
    qWork.Open;
    if qWork.FieldByName('Dog_Type').AsString <> 'Y' then
      raise Exception.Create(TranslateText('��������� ������� �� �������� �������� !'));
    if not qWork.FieldByName('Out_Date').IsNull
       and (dbceEdOper.DataSource.DataSet.FieldByName('Oper_Id').AsInteger <> 244) then
      raise Exception.Create(TranslateText('��������� ������� ������������� ������� ������� �') +
        qWork.FieldByName('Out_Num').AsString + TranslateText(' �� ') + qWork.FieldByName('Out_Date').AsString + ' !');
    //-BEGIN-�������� �������<->������
    //��������� ��������� ��� ������� �� �������� ��������� ������������ ������� � ���������
    qCheckerDog.Close;
    qCheckerDog.ParamByName('dog_id').AsInteger := dog.q.fieldbyname('id').AsInteger;
    qCheckerDog.ParamByName('dog_inst').AsInteger := dog.q.fieldbyname('inst').AsInteger;
    qCheckerDog.ParamByName('head_id').AsInteger := dbceDog.DataSource.DataSet.FieldByName('Id').AsInteger;
    qCheckerDog.ParamByName('head_inst').AsInteger := dbceDog.DataSource.DataSet.FieldByName('Inst').AsInteger;
    qCheckerDog.ParamByName('ser').AsString := '';
    qCheckerDog.ParamByName('num').AsInteger := -1;
    //��� ���������� �������� ��������� �� ������������ � ��� ��� �������� �������
    if not (qTalon.IsEmpty) then
    begin
      _OpenQuery(qCheckerDog); //�������� �� ������ ��� ��
      ExistNPinDog := True;
      while not (qTalon.Eof) and not (ExistNPinDog = False) do
      begin
        qCheckerDog.First;
        ExistNPinDog := False;
        while not (qCheckerDog.Eof) do
        begin
          if qCheckerDog.FieldByName('NP_GRP_ID').AsInteger = qTalon.FieldByName('NPGRP_ID').AsInteger then
          begin
            ExistNPinDog := True;
            Break;
          end;
          qCheckerDog.Next;
        end;
        qTalon.Next;
      end;
      qCheckerDog.First;
      while not (qCheckerDog.Eof) do
      begin
        if (qCheckerDog.FieldByName('razn_sum').AsFloat < 0)
          or (qCheckerDog.FieldByName('razn_count').AsFloat < 0)
          or (ExistNPinDog = False) then
        begin
          qCheckerDog.Close;
          raise Exception.Create(TranslateText('������ �� ������������� ��������! �������� ���� ������������� ��� ����, ��� ����������')
                                  + #13 + TranslateText('������ ������� ���� �������!'));  //???
        end;
        qCheckerDog.Next;
      end;
      qCheckerDog.Close;
    end;
    //-END-�������� �������<->������
    if dbceDog.DataSource.DataSet.State = dsBrowse then dbceDog.DataSource.DataSet.Edit;
    dbceDog.DataSource.DataSet.FieldByName('Dog_Id').AsInteger := dog.q.fieldbyname('id').AsInteger;
    dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').AsInteger := dog.q.fieldbyname('inst').AsInteger;
    dbceDog.DataSource.DataSet.FieldByName('Dog').AsString := dog.q.fieldbyname('dog').AsString;
    dbceDog.DataSource.DataSet.FieldByName('Dog_Date').AsDateTime := dog.q.fieldbyname('Dog_Date').AsDateTime;
    if dbceDog.DataSource.DataSet.FieldByName('Org_Id').IsNull then
    begin
      dbceDog.DataSource.DataSet.FieldByName('Org_Id').AsInteger := dog.q.fieldbyname('To_').AsInteger;
      dbceDog.DataSource.DataSet.FieldByName('Org_Inst').AsInteger := dog.q.fieldbyname('To_Inst').AsInteger;
      dbceDog.DataSource.DataSet.FieldByName('Org_Name').AsString := dog.q.fieldbyname('To_Name').AsString;

      dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsVariant :=
        GetOrgType(dog.q.fieldbyname('To_').AsInteger, dog.q.fieldbyname('To_Inst').AsInteger);
      dbceOrgName.DataSource.DataSet.FieldByName('Org_Nal_Num').AsVariant := dog.q.FieldByName('To_Nal_Num').AsVariant;
      dbceOrgName.DataSource.DataSet.FieldByName('Org_Svid_Num').AsVariant := dog.q.FieldByName('To_Svid_Num').AsVariant;
      dbceOrgName.DataSource.DataSet.FieldByName('Org_Addr').AsVariant := dog.q.FieldByName('To_Addr').AsVariant;
      dbceOrgName.DataSource.DataSet.FieldByName('Org_Boss').AsVariant := dog.q.FieldByName('To_Boss').AsVariant;
      dbceOrgName.DataSource.DataSet.FieldByName('Org_OKPO').AsVariant := dog.q.FieldByName('To_OKPO').AsVariant;
      dbceOrgName.DataSource.DataSet.FieldByName('Org_Phone').AsVariant := dog.q.FieldByName('To_Phone').AsVariant;
    end;
    FTalonPrice.SetPriceValue(Dog.qDogDetail,'NPGrp_Id','Price2');
  end;
  dbceDog.DirectInput := dbceDog.DataSource.DataSet.FieldByName('Dog_Id').IsNull;
  dbdeDogDate.Enabled := dbceDog.DataSource.DataSet.FieldByName('Dog_Id').IsNull;
  Dog.Free;
  if(dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3,4])
    and(dbceEdOper.DataSource.DataSet.FieldByName('Oper_Id').AsInteger = 190)
  then
  begin
    MessageDlg(TranslateText('������� ������� �� ��� ��� ���� ����������� !'), mtWarning, [mbOK], 0);
    sbClearOper.OnClick(sbClearOper);
  end;
end;

procedure TTalonOutForm.dbdeOutDateChange(Sender: TObject);
begin
  if Showing then
    qTalon.DataSource.DataSet.Post;
  if not Self.Visible and ((Sender as TDBDateEdit).Date <= StrToDate(Close_Date)) then
    (Sender as TDBDateEdit).Enabled := false;

  if(dbceEdOper.DataSource=nil) then
    bbOk.Enabled := (dbdeOutDate.Date > StrToDate(CLOSE_DATE))
  else
    bbOk.Enabled := IsCanEditTalonDoc(dbceEdOper.DataSource.DataSet.FieldByName('Oper_Id').AsInteger)
      and( dbdeOutDate.Date > StrToDate(CLOSE_DATE) );
  import.Enabled := bbOk.Enabled;

  if( (FDocDate<>0) and bbOk.Enabled )then
    if( not(TestAllTalon(toOtpysk,qTalon)) )then//��������� ��� ������
    begin
      if( qTalon.DataSource.DataSet.State=dsBrowse )then
        qTalon.DataSource.DataSet.Edit;
      (Sender as TDBDateEdit).Date:=FDocDate;
      if( (Showing)and(qTalon.DataSource.DataSet.State<>dsBrowse) )then
        qTalon.DataSource.DataSet.Post;
    end
    else
      FDocDate:=(Sender as TDBDateEdit).Date;
end;

procedure TTalonOutForm.dbeDovNumKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', #8, '/']) then
    key := #0;
end;

procedure TTalonOutForm.sbPriceClick(Sender: TObject);
var
  Dog: TDogRefForm;
  qDogDetail:TOilQuery;
begin
  (** ���������� ����
      ���� ���� �������, �� �� ��������,
      ���� ��� �� �� ���������� ��������
  *)
  if (dbceDog.Text<>'') and (dbceDog.DataSource.DataSet.FieldByName('Dog_Id').AsInteger>0)
    and(dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').AsInteger>0)
  then
  begin
    Application.CreateForm(TDogRefForm, Dog);
    qDogDetail:=TOilQuery.Create(self);
    try
      qDogDetail.SQL.Text:=dog.qDogDetail.SQL.Text;
      _OpenQueryPar(qDogDetail,
        ['id',dbceDog.DataSource.DataSet.FieldByName('Dog_Id').AsInteger,
         'inst',dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').AsInteger]
        );
      FTalonPrice.SetPriceValue(qDogDetail,'NPGrp_Id','Price2');
    finally
      Dog.Free;
      qDogDetail.Free;
    end;
  end
  else if not dbdeOutDate.DataSource.DataSet.FieldByName('Out_Date').IsNull then
  begin
    qPrice.Close;
    qPrice.ParamByName('date_').AsDate := dbdeOutDate.date;
    qPrice.Open;
    FTalonPrice.SetPriceValue(qPrice,'NPGrp_Id','Price');
  end;
end;

procedure TTalonOutForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (DogEdit) and (ModalResult <> mrOk) then
    if MessageDlg(TranslateText('��� �������� ��������� ��� �������������� ����� ������� �� ����� ��������� !'),
      mtConfirmation, [mbYes, mbNo], 0) = mrYes
    then
    begin
      qTalonDetail.Close;
      qTalon.Close;
    end;
end;

procedure TTalonOutForm.dbgTalonEditButtonClick(Sender: TObject);
begin
  if AnsiUpperCase(dbgTalon.SelectedField.FieldName) = 'NUMB' then
  begin
    Application.CreateForm(TAutoRefForm, AutoRefForm);
    AutoRefForm.ShowModal;
    if AutoRefForm.ModalResult = mrOk then
    begin
      qTalon.Edit;
      qTalon.FieldByName('Auto_id').Value := AutoRefForm.qID.Value;
      qTalon.FieldByName('Auto_inst').Value := AutoRefForm.qINST.Value;
      if not AutoRefForm.qEMPLOY_ID.IsNull then
      begin
        qTalon.FieldByName('Employ_id').Value := AutoRefForm.qEMPLOY_ID.Value;
        qTalon.FieldByName('Employ_inst').Value := AutoRefForm.qEMPLOY_INST.Value;
      end;
      qTalon.Post;
    end;
    AutoRefForm.Destroy;
  end;

  if AnsiUpperCase(dbgTalon.SelectedField.FieldName) = 'DRIVER' then
  begin
    Application.CreateForm(TEmpRefForm, EmpRefForm);
    EmpRefForm.ShowModal;
    if EmpRefForm.ModalResult = mrOk then
    begin
      qTalon.Edit;
      qTalon.FieldByName('Employ_id').Value := EmpRefForm.qID.Value;
      qTalon.FieldByName('Employ_inst').Value := EmpRefForm.qINST.Value;
      qTalon.Post;
    end;
    EmpRefForm.Destroy;
  end;
end;

procedure TTalonOutForm.BitBtn1Click(Sender: TObject);
begin
  if qTalon.State = dsBrowse then
    qTalon.Edit;
  qTalon.FieldByName('Auto_Id').Clear;
  qTalon.FieldByName('Auto_Inst').Clear;
  qTalon.FieldByName('Employ_Id').Clear;
  qTalon.FieldByName('Employ_Inst').Clear;
  qTalon.Post;
end;

procedure TTalonOutForm.ChangeOrgType;
  procedure SetChildEnable(Sender: TObject);
  var
    i :integer;
  begin
    if (Sender is TGroupBox) then
      for i := 0 to TGroupBox(Sender).ControlCount-1 do
        TGroupBox(Sender).Controls[i].Enabled := TGroupBox(Sender).Enabled;
  end;
begin
  if dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4] then
  Begin
    cbNN_Num.Checked := True;
    if dbceEdOper.DataSource.DataSet.State = dsBrowse then
      dbceEdOper.DataSource.DataSet.Edit;
    dbceDog.DataSource.DataSet.FieldByName('Dog_Id').Clear;
    dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').Clear;
    dbceDog.DataSource.DataSet.FieldByName('Dog').Clear;
    dbceDog.DataSource.DataSet.FieldByName('Dog_Date').Clear;
  end;
  gbSum.Enabled := not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
  SetChildEnable(gbSum);
  gbDog.Enabled := not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
  SetChildEnable(gbDog);
  gbNN.Enabled := not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
  SetChildEnable(gbNN);
  gbFormRasch.Enabled := not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
  SetChildEnable(gbFormRasch);
  gbDoverenost.Enabled := not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
  SetChildEnable(gbDoverenost);
  dbdeDogDate.ReadOnly := (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
{ cbNN_Num.Enabled := not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
  lNN_Num.Enabled := not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
  lDog.Enabled := not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
  lDogNum.Enabled := not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
  lDogDate.Enabled := not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
  dbceDog.Enabled := not sbAuto.Down or not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
  dbdeDogDate.Enabled := not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
  sbAuto.Enabled := not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
  lFormRash.Enabled := not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
  cbFormRash.Enabled := not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
  lDov.Enabled := not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
  lDovSerNum.Enabled := not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
  dbeDovName.Enabled := not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
  dbeDovSer.Enabled := not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
  dbeDovNum.Enabled := not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
  dbdeDovDate.Enabled := not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
}
  lPrice.Enabled := not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
  sbPrice.Enabled := not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]);
  FTalonPrice.SetProperty(epEnabled,
    not (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4]) );
  if dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger in [3, 4] then
  begin
    dbceDog.Color := clBtnFace;
    dbdeDogDate.Color := clBtnFace;
    cbFormRash.Color := clBtnFace;
    dbeDovName.Color := clBtnFace;
    dbeDovSer.Color := clBtnFace;
    dbeDovNum.Color := clBtnFace;
    dbdeDovDate.Color := clBtnFace;
    FTalonPrice.SetProperty( epColor,clBtnFace );
  end
  else
  begin
    dbceDog.Color := clWindow;
    dbdeDogDate.Color := clWindow;
    cbFormRash.Color := clWindow;
    dbeDovName.Color := clWindow;
    dbeDovSer.Color := clWindow;
    dbeDovNum.Color := clWindow;
    dbdeDovDate.Color := clWindow;
    FTalonPrice.SetProperty( epColor,clWindow );
  end;
end;

procedure TTalonOutForm.cbNN_NumClick(Sender: TObject);
begin
  cbFormRash.Enabled := not (cbNN_Num.Checked);
end;

procedure TTalonOutForm.dbceEdOperButtonClick(Sender: TObject);
  function GetTO_Orgtype: integer;
  begin
// -1 - ��� ��� �� ����������
// 0 - ���� ��� ���
// 2 - ������
    Result := 2;
    if(dbceOrgName.DataSource.DataSet.FieldByName('Org_Id').AsInteger =
      dbceOrgName.DataSource.DataSet.FieldByName('Org_Inst').AsInteger)then
      if dbceOrgName.DataSource.DataSet.FieldByName('Org_Id').AsInteger = 0 then
        Result := -1
      else
        Result := 0;
  end;
var
  OperTypeRefForm: TOperTypeRefForm;
  qTemp: TOilQuery;
begin
  Application.CreateForm(TOperTypeRefForm, OperTypeRefForm);
  OperTypeRefForm.SGrpId := 15;
  OperTypeRefForm.bbClear.Enabled := false;
  if GetTO_OrgType = 2 then
  begin
    OperTypeRefForm.edName.Text := TranslateText('������� �������');
    OperTypeRefForm.edName.Enabled := False;
  end;
  OperTypeRefForm.ShowModal;
  if OperTypeRefForm.ModalResult = mrOk then
  begin
    case GetTO_OrgType of
      0:
        if (OperTypeRefForm.qId.AsInteger = 190) then
        begin // ������ ��� ��� ���� � �������� ������� ������ �������
          OperTypeRefForm.Free;
          MessageDlg(TranslateText('������� ������� �� ��� ��� ���� ����������� !'), mtWarning, [mbOK], 0);
          Exit;
        end;
      2:
        if (OperTypeRefForm.qId.AsInteger in [191, 192, 193]) then
        begin // ������� ��� �� ������ � �������� ������� ���-���� ����� �������
          OperTypeRefForm.Free;
          MessageDlg(TranslateText('��� ��������� ����������� ����� �������� ����������� !'), mtWarning, [mbOK], 0);
          Exit;
        end;
    end; //case
    //������ ������ �� ���� --> ������� "����" ������ (����:=0)
    dbgTalon.Columns[4].Visible := OperTypeRefForm.qId.AsInteger <> 244;

    if dbceEdOper.DataSource.DataSet.State = dsBrowse then
      dbceEdOper.DataSource.DataSet.Edit;
    dbceEdOper.DataSource.DataSet.FieldByName('Oper_Id').AsInteger := OperTypeRefForm.qId.AsInteger;
    dbceEdOper.DataSource.DataSet.FieldByName('Oper_Name').AsString := OperTypeRefForm.qName.AsString;
    if dbceEdOper.DataSource.DataSet.FieldByName('Oper_Id').AsInteger=200  then
    begin
      dbceDog.DataSource.DataSet.FieldByName('Dog_Id').Clear;
      dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').Clear;
      dbceDog.DataSource.DataSet.FieldByName('Dog').Clear;
      dbceDog.DataSource.DataSet.FieldByName('Dog_Date').Clear;

      qTemp:=TOilQuery.Create(nil);
      qTemp.Session:=frmStart.OraSession1;
      qTemp.Sql.Text:='select * from v_org where id=inst and id='+IntToStr(INST_FIL);
      _OpenQueryOra(qTemp);

      dbceOrgName.DataSource.DataSet['Org_Id'] := INST_FIL;
      dbceOrgName.DataSource.DataSet['Org_Inst'] := INST_FIL;
      dbceOrgName.DataSource.DataSet['Org_Name'] := qTemp['name'];
      dbceOrgName.DataSource.DataSet['Org_Type'] := qTemp['org_type'];
      dbceOrgName.DataSource.DataSet['Org_Nal_Num'] := qTemp['nal_num'];
      dbceOrgName.DataSource.DataSet['Org_Svid_Num'] := qTemp['svid_num'];
      dbceOrgName.DataSource.DataSet['Org_Addr'] := qTemp['addr'];
      dbceOrgName.DataSource.DataSet['Org_Boss'] := qTemp['boss'];
      dbceOrgName.DataSource.DataSet['Org_OKPO'] := qTemp['id_num'];
      dbceOrgName.DataSource.DataSet['Org_Phone'] := qTemp['phone'];
      ChangeOrgType;

      qTemp.Free;
      cbNN_NumClick(nil);
    end else if dbceEdOper.DataSource.DataSet.FieldByName('Oper_Id').AsInteger in [192, 193] then
    begin
      dbceDog.DataSource.DataSet.FieldByName('Dog_Id').Clear;
      dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').Clear;
      dbceDog.DataSource.DataSet.FieldByName('Dog').Clear;
      dbceDog.DataSource.DataSet.FieldByName('Dog_Date').Clear;

      dbceOrgName.DataSource.DataSet.FieldByName('Org_Id').AsInteger := MAIN_ORG.Id;
      dbceOrgName.DataSource.DataSet.FieldByName('Org_Inst').AsInteger := MAIN_ORG.Inst;
      dbceOrgName.DataSource.DataSet.FieldByName('Org_Name').AsString := MAIN_ORG.Name;
      dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsVariant := MAIN_ORG.Org_type;
      dbceOrgName.DataSource.DataSet.FieldByName('Org_Nal_Num').AsVariant := MAIN_ORG.Nal_num;
      dbceOrgName.DataSource.DataSet.FieldByName('Org_Svid_Num').AsVariant := MAIN_ORG.Svid_num;
      dbceOrgName.DataSource.DataSet.FieldByName('Org_Addr').AsVariant := MAIN_ORG.Addr;
      dbceOrgName.DataSource.DataSet.FieldByName('Org_Boss').AsVariant := MAIN_ORG.Boss;
      dbceOrgName.DataSource.DataSet.FieldByName('Org_OKPO').AsVariant := MAIN_ORG.Num;
      dbceOrgName.DataSource.DataSet.FieldByName('Org_Phone').AsVariant := MAIN_ORG.Phone;
      ChangeOrgType;
      cbNN_NumClick(nil);
    end;
  end; // If OperTypeRefForm.ModalResult = mrOk Then
  OperTypeRefForm.Free;
end;

procedure TTalonOutForm.sbClearOperClick(Sender: TObject);
begin
  if dbceEdOper.DataSource.DataSet.State = dsBrowse then
    dbceEdOper.DataSource.DataSet.Edit;
  dbceEdOper.DataSource.DataSet.FieldByName('Oper_Id').Clear;
  dbceEdOper.DataSource.DataSet.FieldByName('Oper_Name').Clear;
end;

procedure TTalonOutForm.sbClearOrgClick(Sender: TObject);
begin
  if dbceDog.DataSource.DataSet.State = dsBrowse then
    dbceDog.DataSource.DataSet.Edit;
  dbceDog.DataSource.DataSet.FieldByName('Dog_Id').Clear;
  dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').Clear;
  dbceDog.DataSource.DataSet.FieldByName('Dog').Clear;
  dbceDog.DataSource.DataSet.FieldByName('Dog_Date').Clear;
  dbceOrgName.DataSource.DataSet.FieldByName('Org_Id').Clear;
  dbceOrgName.DataSource.DataSet.FieldByName('Org_Inst').Clear;
  dbceOrgName.DataSource.DataSet.FieldByName('Org_Name').Clear;
  dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').Clear;
  dbceOrgName.DataSource.DataSet.FieldByName('Org_Nal_Num').Clear;
  dbceOrgName.DataSource.DataSet.FieldByName('Org_Svid_Num').Clear;
  dbceOrgName.DataSource.DataSet.FieldByName('Org_Addr').Clear;
  dbceOrgName.DataSource.DataSet.FieldByName('Org_Boss').Clear;
  dbceOrgName.DataSource.DataSet.FieldByName('Org_OKPO').Clear;
  dbceOrgName.DataSource.DataSet.FieldByName('Org_Phone').Clear;
  ChangeOrgType;
  cbNN_NumClick(nil);
  sbAutoClick(nil);

end;

procedure TTalonOutForm.dbceDogChange(Sender: TObject);
const
  sum_dog = 'SELECT ' +
    'SUM(ROUND(decode(dog.dog_type,''Y'',detail.price2,' +
    '''K'',detail.price2,detail.price) * NVL(detail.count_, 1),2)+' +
    '    ROUND(decode(dog.dog_type,''Y'',0,''K'',0,' +
    'detail.price*NVL(detail.count_,1)/5),2)) sum_dog ' +
    'FROM oil_dog_detail detail,oil_dog dog ' +
    'WHERE ' +
    'detail.dog_id = %d ' +
    'AND detail.dog_inst = %d' +
    'AND dog.id = detail.dog_id ' +
    'AND dog.inst = detail.dog_inst ' +
    'AND detail.state=''Y'' ';
  sum_nn =
    'select                               ' +
    '      sum(g.sum_nn) sum_nn,          ' +
    '      max(g.s_date) s_date           ' +
    'from                                 ' +
    ' (                                   ' +
    ' select                              ' +
    '          nvl(sum(bd.nds_t), 0) sum_nn,' +
    '          bd.tov_id,                         ' +
    '          bd.kol count_,                     ' +
    '          bd.nds_t,                          ' +
    '          max(sb.s_date) s_date              ' +
    '      from                                   ' +
    '          Oil_Sale_Book sb,                  ' +
    '          Oil_sale_book_det bd,              ' +
    '          oil_dog d,                         ' +
    '          oil_talon_out t                    ' +
    '     where                                   ' +
    '          sb.id = bd.nn_id(+)                ' +
    '          and sb.inst = bd.nn_inst(+)        ' +
    '          and sb.state = ''Y''               ' +
    '          and bd.state = ''Y''               ' +
    '            and sb.id = t.nn_id              ' +
    '            and sb.inst = t.nn_inst          ' +
    '            and d.id(+) = t.dog_id           ' +
    '            and d.inst(+) = t.dog_inst       ' +
    '          and d.id = :id                     ' +
    '          and d.inst = :inst                 ' +
    '     group by bd.id, bd.tov_id, bd.kol, bd.nds_t    ' +
    '  Union ALL       ' +
    '  select          ' +
    '          nvl(sum(bd.nds_t), 0) sum_nn,' +
    '          bd.tov_id,                   ' +
    '          bd.kol count_,               ' +
    '          bd.nds_t,                    ' +
    '          max(sb.s_date) s_date        ' +
    '      from                             ' +
    '          Oil_Sale_Book sb,            ' +
    '          Oil_sale_book_det bd,        ' +
    '          oil_dog d,                   ' +
    '          oil_money m                  ' +
    '     where                             ' +
    '          sb.id = bd.nn_id(+)          ' +
    '          and sb.inst = bd.nn_inst(+)  ' +
    '          and sb.state = ''Y''         ' +
    '          and bd.state = ''Y''         ' +
    '          and d.id = :id               ' +
    '          and d.inst = :inst           ' +
    '          and sb.id = m.nn_id          ' +
    '          and sb.inst = m.nn_inst      ' +
    '          and d.id = m.dog_id          ' +
    '          and d.inst = m.dog_inst      ' +
    '    group by bd.id, bd.tov_id, bd.kol, bd.nds_t )g';
begin
  //������� ����� �� �������� � ��-��
  if qWork.Active then qWork.Close;
  qWork.SQL.Text := Format(sum_dog, [
    dbceDog.DataSource.DataSet.FieldByName('Dog_Id').AsInteger,
      dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').AsInteger]);
  qWork.Open;
  LSumDog.Caption := FloatToStr(qWork.FieldByName('sum_dog').AsFloat) + TranslateText(' ���.');
  dog_sum := qWork.FieldByName('sum_dog').AsFloat;
  qWork.Close;
  qWork.SQL.Text := sum_nn;
  _OpenQueryPar(qWork,
    ['id',dbceDog.DataSource.DataSet.FieldByName('Dog_Id').AsInteger,
     'inst',dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').AsInteger]);
  LSumNN.Caption := FloatToStr(qWork.FieldByName('sum_nn').AsFloat) + TranslateText(' ���.');
  NN_sum := qWork.FieldByName('sum_nn').AsFloat;
  NNDateLast := qWork.FieldByName('s_date').AsDateTime;
  //��������� ��������� ��� ������� �� �������� ��������� ������������ ������� � ���������
  qCheckerDog.Close;
  qCheckerDog.ParamByName('dog_id').AsInteger := dbceDog.DataSource.DataSet.FieldByName('Dog_Id').AsInteger;
  qCheckerDog.ParamByName('dog_inst').AsInteger := dbceDog.DataSource.DataSet.FieldByName('Dog_Inst').AsInteger;
  qCheckerDog.ParamByName('head_id').AsInteger := dbceDog.DataSource.DataSet.FieldByName('Id').AsInteger;
  qCheckerDog.ParamByName('head_inst').AsInteger := dbceDog.DataSource.DataSet.FieldByName('Inst').AsInteger;
  qCheckerDog.ParamByName('ser').AsInteger := -1;
  qCheckerDog.ParamByName('num').AsInteger := -1;
  ChangeOrgType;
end;

procedure TTalonOutForm.importClick(Sender: TObject);
var
  TalonOpenCode: TTalonOpenCodeForm;
  n: integer;
begin
  if (dbceDog.Text = TranslateText('����')) and (sbAuto.Down) then
  begin
    MessageDlg(TranslateText('���������� ���������� ������ ��� ��������������� ��������!'), mtError, [mbOk], 0);
    exit;
  end;

  if not((dbceEdOper.DataSource.DataSet.FieldByName('Oper_Id').AsInteger in [191,192,193,200,217,244]) or
         (dbceEdOper.DataSource.DataSet.FieldByName('Oper_Id').AsInteger = 269))
  then
  begin
    if(dbceDog.Text = '') then
    begin
      ShowMessage(TranslateText('����� ������ ������� ���������� ������/������� �������.'));
      exit;
    end;
    if (ce76.Enabled = false) or (ce80.Enabled = false) or (ce92.Enabled = false)
      or (ce95.Enabled = false) or (ce98.Enabled = false) or (ceDT.Enabled = false) or (ceGaz.Enabled = false) then
    begin
      MessageDlg(TranslateText('���������� ���������� ������!'), mtError, [mbOk], 0);
      exit;
    end;
  end;

  if not qTalon.IsEmpty then
    if MessageDlg(TranslateText('�� ������ ������� ��� ���������� ������ � �������� �����?'),
      mtConfirmation, [mbNo, mbYes], 0) = mrYes then
    begin
      qTalon.Last;
      for n := qTalon.RecordCount downto 1 do
        qTalon.Delete;
    end
    else exit;
  // ��������� �������� ������� ������
  TalonOpenCode := TTalonOpenCodeForm.Create(tptOut);
  try
    // ��������� ���� �� ���� ����� �������� � TalonOpenCode
    qTalon.DisableControls;
    TalonOpenCode.TalonPrice.SetPriceValue(FTalonPrice);
    TalonOpenCode.ShowModal;
    // ��������� ���� �� TalonOpenCode �������� �������
    FTalonPrice.SetPriceValue(TalonOpenCode.TalonPrice);
  finally
    TalonOpenCode.Free;
    qTalon.EnableControls;
  end;
  qTalon.Close;
  qTalon.Open;
end;

procedure TTalonOutForm.ExportClick(Sender: TObject);
Var
   Save, FileName, track: string; // ���� � ����� � ��� ���, ��� �����, ���� � ����
begin
  if qTalon.IsEmpty then exit;

  if dbOutNum.EditText = '' then
  begin
    Showmessage(TranslateText('������� ����� �������.'));
    exit;
  end;

  if dbdeOutDate.EditText = 'dbdeOutDate' then
  begin
    Showmessage(TranslateText('������� ���� �������.'));
    exit;
  end;

  SD.FileName := dbOutNum.EditText +'_Talon_'+ ReplaceAllSubstr(dbdeOutDate.EditText, '.', '_');

  if SD.Execute then
  begin
    try
      qTalon.DisableControls;
      if not MTCode.Active then MTCode.Open;
      if TalonToCode(MTCode, qTalon) then
      begin
        // ��������� ����� � ���� �� SD.FileName
        Save := SD.FileName;
        Track := ExtractFileDir(SD.FileName);
        FileName := ExtractFileName(SD.FileName);
        // ��������� ������� � ���� � ��������� ���
        try
          if not error then
          begin
            DataSetToDbf(MTCode, Track, FileName, nil, 'FOXPRO');
            ShowMessage(TranslateText('��������� ��������� �����-���� ������� � ')+SD.FileName+'. ');
          end;
        except on E:Exception do
          ShowMessage(TranslateText('��������� �� ����� ��������� �����-���� �������!')+#10#13+E.Message);
        end;
      end;
    finally
      qTalon.EnableControls;
    end;
  end;
end;

//   ��� ������������� ���� ������� ����� ��� �� � Q ���� ����� ����:
//   Ser, Num, Nominal, NPGRP_id, � � �� ����: Talon.
function TTalonOutForm.TalonToCode(MT: TMemoryTable; Q: TOilQuery): boolean;
Var
   org: integer; // ��� �����������
   Ser, Num, NumNull: string; // �����, �����, ���� ������
   i: integer; // ������������ ��� ������ ������
   VsUkr:boolean;
Begin
  error := false;
  TalonToCode := true;
    try
      Q.First;
      MT.Close;
      MT.Open;
      MT.First;
      repeat
        CodeTalon := '';
        Num := IntToStr(Q.FieldByName('Num').AsInteger);
        VsUkr:=length(Num)=9;
        NumNull := '';
        Ser := '';

        if VsUkr then
          org := GetVsUkrTalonCode(Q.FieldByName('Num').AsInteger)
        else
          org := MainForm.qOrg.FieldByName('Talon_Code').AsInteger;
        if (org <> 0) and (org <> Null) then
          if org in [1,2,3,4,5,6,7,8,9] then
            CodeTalon := CodeTalon + '0' + IntToStr(org)
          else
            CodeTalon := CodeTalon + IntToStr(org)
        else
          begin
            ShowMessage(TranslateText('�� �������� ��� ���-�. ���������� � ������������ ��� ������� ���� ��������.'));
            error := true;
            exit;
          end;
          
        CodeTalon := CodeTalon + '1';
        case Q.FieldByName('NPGRP_id').AsInteger of
          4,5: Ser := 'A'; {76 � 80}
          6:  Ser := 'B';
          7:  Ser := 'C';
          3:  Ser := 'D';
          10: Ser := 'E';
          62: Ser := 'F';
        end;

        case Q.FieldByName('Nominal').AsInteger of
           5: CodeTalon := CodeTalon + '0' + Ser + '00';
          10: CodeTalon := CodeTalon + '1' + Ser + '01';
          20: CodeTalon := CodeTalon + '2' + Ser + '02';
          50: CodeTalon := CodeTalon + '3' + Ser + '03';
        end;

        for i := 0 to (6 - Length(Num)) do
          NumNull := NumNull + '0';

        Num := NumNull + Num;
        CodeTalon := CodeTalon + Num;

        MT.Append;
        MT.Edit;
        MT.FieldByName('TALON').AsString := CodeTalon;
        MT.Post;
        MT.next;

        Q.next;
      until Q.Eof;

    except on E:Exception do
      TalonToCode := false;
    end;
end;

procedure TTalonOutForm.sbAutoClick(Sender: TObject);
begin
  IF sbAuto.Down then
  begin
    dbceDog.Color:=clBtnFace;
    dbceDog.Hint:=TranslateText('����� ������ ��������� ����� �� �������');
    dbceDog.ShowHint:=True;
    dbceDog.DataSource.DataSet.Edit;
    dbceDog.DataSource.DataSet.FieldByName('DOG_ID').Clear;
    dbceDog.DataSource.DataSet.FieldByName('DOG_INST').Clear;
    dbceDog.DataSource.DataSet.FieldByName('DOG').Clear;
    dbceDog.Text := TranslateText('����');
    dbceDog.Enabled := False;
  end
  ELSE
  begin
    dbceDog.Clear;
    dbceDog.Enabled := True;
    dbceDog.Color:=clWindow;
    dbceDog.Hint:='';
    dbceDog.ShowHint:=False;
  end;
  cbNN_NumClick(nil);
end;

(** � ����� ��������� ������� ���(����� ���) ������ �� ����� �������*)
function TalonExceptionHandler(
  AExceptNumber:integer;//����� ������
  ASer:string;ANum:integer;//����� ����� ������
  ATypeOper:TTypeOper;//������ ����������
  AErrOut:TTypeErrorOutput//��� ������ ���������� �� ������
  ):string;
const
  eTalonNotError='TalonExceptionHandler: ������������� ������������ ���� ������ %d !';
  eTalonBadSymbols='����� ������ �������� ��������� ������� !';
  eTalonDoubleInDb='����� %s/%d ��� ���������� � ���� ������ !';
  eTalonDoubleInDoc='����� "%s" � ����� "%d" ������ ����������� !';
  eTalonAlreadyPosted='����� %s/%d ��� ����������� !';
  eTalonPostedLater='����� %s/%d ����������� ����� !';
  eTalonIsDiscard='����� %s/%d ��� ������ !';
  eTalonNotSaleToOrg='����� %s/%d ������ ����������� �� ���������� !';
  eTalonEmission='����� %s/%d ����������� � ������� !';
  eTalonNotGiveToOrg='����� %s/%d ����������� ����� �������, ���������� ����� ������������� !';
  eTalonAlreadySell='����� %s/%d ��� ������ !';
  eTalonNotInPrih='����� %s/%d �� ������ � �������� !';
  eTalonSellLater='����� %s/%d ������ ����� !';
  eTalonNPNotInDog='������ �������� ����� �.�. � �������� ��� ������ ' + #13 +'���� ������������� - ��������������� ������� ��� ����� ������ !';
  eTalonNPNotInDogShort='� �������� ��� ������ ���� ������������� !';
  eTalonNPNotInPart='��� ������������� ������ � ������ �� ���������!';
  eTalonExceedSumCount='������ �������� ����� �.�. �� ����� ��� ���������� ����� ���������' + #13 +'������ �������� - ��������������� ������� ��� ����� ������ !';
  eTalonExceedSumCountShort='����� ��� ���������� ��������� !';
  eTalonSave='������ ������ ������!';
  eTalonOverdraft='����� %s/%d �������������� !';
  eTalonNotReach='����� %s/%d �������������� !';
  eTalonNotInTheWay='����� %s/%d �� ��������� � ���� !';
  eTalonInTheWay='����� %s/%d ��������� � ���� !';
  eTalonFromAlfa= '����� %s/%d ������ ������ ������������ !'+#13+'� ������ ������ ����� ������� ������ ������ ��������� ��� "�� �����-�����".'
    +#13+' �������� ������ ����� � �������� ��� ���� ������ ������.';
  eTalonFromAvias = '����� %s/%d ������ ������ ������������ !'+#13+'� ������ ������ ����� ������� ������ ������ ��������� ��� ��� "�����".'
    +#13+' �������� ������ ����� � �������� ��� ���� ������ ������.';

var
  strMsg:string;
  //----------------------------------------------------------------------------
  procedure GetError(AErrStr:String);
  begin

  end;
  //----------------------------------------------------------------------------
begin
  // �������� ��������
  strMsg:='';  Result:='';
  // � ����������� �� ���� ������ ���������
  case ATypeOper of
   toPrihod,toMotionPrihod://�������
     case AExceptNumber of
       0:; //��� ������
       1: strMsg:=eTalonBadSymbols;
       2: strMsg:=eTalonDoubleInDb;
       3: strMsg:=eTalonDoubleInDoc;
       4: strMsg:=eTalonAlreadyPosted;
       5: strMsg:=eTalonPostedLater;
       6: strMsg:=eTalonIsDiscard;
       7: strMsg:=eTalonNotSaleToOrg;
       8: strMsg:=eTalonEmission;
       9: strMsg:=eTalonNotGiveToOrg;
      10: strMsg:=eTalonFromAlfa;
      11: strMsg:=eTalonFromAvias;
       else
         strMsg:=eTalonNotError;
     end;
   toOtpysk, toMotionOtpysk: // �������
     case AExceptNumber of
       0: ; // ��� ������
       1: strMsg := eTalonBadSymbols;
       2: strMsg := eTalonAlreadySell;
       3: strMsg := eTalonNotInPrih;
       4: strMsg := eTalonSellLater;
       5: strMsg := eTalonDoubleInDoc;
       6: strMsg := eTalonExceedSumCount;
       7: strMsg := eTalonNPNotInDog;
       8: strMsg := eTalonInTheWay;
       else
         strMsg:=eTalonNotError;
     end;
   toSrPrihod: // ������� � ������� �����
     case AExceptNumber of
       0: ; // ��� ������
       1: strMsg := eTalonBadSymbols;
       2: strMsg := eTalonEmission;
       3: strMsg := eTalonDoubleInDoc;
       4: strMsg := eTalonPostedLater;
       5: strMsg := eTalonAlreadyPosted;
       6: strMsg := eTalonOverdraft;
       7: strMsg := eTalonNotReach;
       8: strMsg := eTalonNPNotInPart;
       9: strMsg := eTalonSave;
       10: strMsg := eTalonNotInTheWay;  
       else
         strMsg:=eTalonNotError;
     end;
  end;//case
  if strMsg<>'' then
  begin
    strMsg:=TranslateText(strMsg);
    if( pos('%d',ANSILowerCase(strMsg))>0 )and( pos('%s',ANSILowerCase(strMsg))>0 )then
      strMsg:=Format(strMsg,[ASer,ANum])
    else if pos('%d',ANSILowerCase(strMsg))>0 then
      strMsg:=Format(strMsg,[AExceptNumber]);
    strMsg:=TranslateText(strMsg);
    if AErrOut=teoExcept then
      raise Exception.Create(strMsg);
  end;
  Result:=strMsg;
end;

function TestAllTalon( ATypeOper:TTypeOper;AQuery:TOilQuery ):boolean;
const
  ReadOnly=true;
var
  TalonOut:TTalonOutForm;
  TalonPrih:TTalonPrihForm;
  TalonSRep:TSRTalonForm;
  s,ser:string;
  num,msg_id:integer;
BEGIN
  Result:=false;
  try
    AQuery.First;
    case ATypeOper of
      toPrihod,toMotionPrihod://������
        TalonPrih:= TTalonPrihForm.Create(Application);
      toOtpysk,toMotionOtpysk://������
        TalonOut:=TTalonOutForm.Create(Application);
      toSrPrihod: //������� �����
        TalonSRep:=TSRTalonForm.Create(Application);
      else
        raise Exception.Create(TranslateText('TestAllTalon: ATypeOper �� ����� ���������'));
    end;
    try
      While not(AQuery.Eof) do
      begin
        ser:=AQuery['ser'];
        num:=AQuery['num'];
        case ATypeOper of
          toPrihod,toMotionPrihod://������
            msg_id:=TalonPrih.TestTalon( ser,num,ReadOnly );
          toOtpysk,toMotionOtpysk://������
            msg_id:=TalonOut.TestTalon( ser,num,ReadOnly );
          toSrPrihod://������� �����
            msg_id:=TalonSRep.TestTalon( ser,num );
          else
            msg_id:=0;
        end;
        s:=s+#13+TalonExceptionHandler( msg_id,ser,num,ATypeOper,teoReturn );
        AQuery.Next;
      end;
    finally
      case ATypeOper of
        toPrihod,toMotionPrihod://������
          TalonPrih.Free;
        toOtpysk,toMotionOtpysk://������
          TalonOut.Free;
        toSrPrihod: //������� �����
          TalonSRep.Free;
      end;
    end;

    s:=trim(s);
    Result:=Length( s )<5;
    if( ( Result=False ) and ( 2=MessageDlgExt(
      TranslateText('������ �������� ������ ��������� �.�. ��� ������� ������� ������� !'),
      mtWarning,[TranslateText('��'),TranslateText('���������')],0 ) ) )
    then
      ShowTextInMemo( s );
  except
    on e:Exception do
    begin
     MessageDlg( e.Message,mtError,[],0 );
     ShowTextInMemo( s );
    end;
  end;
END;

function IsCanEditTalonDoc(AOperType:integer):boolean;
var
  i:integer;
begin
  Result:=true;
  for i:=low(FArrNotEditOper)to high(FArrNotEditOper)do
    if(AOperType=FArrNotEditOper[i])then
      Result:=false;
end;

procedure TTalonOutForm.log(AText:string);
var
  iHour,iMin,iSec,iMSec:Word;
begin
  if SysParamExists('SCANTALON') then
  begin
    DecodeTime(Now,iHour,iMin,iSec,iMSec);
    exfunc.log('ScanTalon.log',format('%d:%d:%d:%d - %s',[iHour,iMin,iSec,iMSec,AText]));
  end;
end;

procedure KeyPressCode(AForm: TObject;ASender:TObject;AQuery:TOilQuery;Key:Char);
var
 e:TEdit;
begin
  e:=TEdit(ASender);
  try
    e.Enabled:=false;
    if (Key = #13) and (AQuery.Active) then
    begin
      InStr := AnsiUpperCase(InStr);
      if (ChStr = '') and (DOUBLE_SCAN) then
      begin
        ChStr := InStr;
        InStr := '';
      end
      else
      begin
        if (ChStr <> InStr) and (DOUBLE_SCAN) then
        begin
          MessageDlg(TranslateText('������ ���������, �������� ������������!'), mtError, [], 0);
          ChStr := '';
          InStr := '';
          Abort;
        end;
        //ShowMessage(AForm.ClassName);
        if AForm.ClassName='TTalonOutForm' then
          TTalonOutForm(AForm).RunProcessBarCode(InStr)
        else if AForm.ClassName='TSRTalonForm' then
          TSRTalonForm(AForm).RunProcessBarCode(InStr)
        else if AForm.ClassName='TTalonPrihForm' then
          TTalonPrihForm(AForm).RunProcessBarCode(InStr);
        ChStr := '';
        InStr := '';
      end
    end
    else
      InStr := InStr + Key;
  finally
    e.Enabled:=true;
    e.SetFocus;
  end;
end;

procedure TTalonOutForm.RunProcessBarCode(AInstr:string);
begin
  if(dbceEdOper.DataSource.DataSet.FieldByName('Oper_Id').AsInteger=217)then
    ProcessBarCode(AInstr,qTalon,toMotionOtpysk)
  else
    ProcessBarCode(AInstr,qTalon,toOtpysk);
end;

procedure TTalonOutForm.dsTalonDetailDataChange(Sender: TObject;
  Field: TField);
begin
  dbgTalon.Columns[0].ReadOnly := (dbdeOutDate.Date < qTalonDetail.Fields[1].AsDateTime);
  dbgTalon.Columns[1].ReadOnly := (dbdeOutDate.Date < qTalonDetail.Fields[1].AsDateTime);
end;

procedure TTalonOutForm.FormDestroy(Sender: TObject);
begin
  inherited;
  FTalonPrice.Free;
end;

constructor TTalonOutForm.Create(AOwner:TComponent);
begin
  FTalonPrice:=TTalonPrice.Create();
  FTalonPrice.AddEdit( @ceDT,3 );
  FTalonPrice.AddEdit( @ce76,4);
  FTalonPrice.AddEdit( @ce80,5);
  FTalonPrice.AddEdit( @ce92,6);
  FTalonPrice.AddEdit( @ce95,7);
  FTalonPrice.AddEdit( @ce98,10);
  FTalonPrice.AddEdit( @ceGaz,62);
  inherited Create(AOwner);
end;

//==============================================================================
//==============================TTalonPrice=====================================
//==============================================================================
constructor TTalonPrice.Create();
begin
  LEditList:=TList.Create;
end;
//==============================================================================
destructor TTalonPrice.Destroy();
begin
  inherited Destroy;
  while LEditList.count>0 do
  begin
    LEdit:=LEditList.items[LEditList.count-1];
    LEditList.Delete(LEditList.count-1);
    dispose(LEdit);
  end;
  LEditList.Free;
end;
//==============================================================================
procedure TTalonPrice.SetPriceValue(APriceQuery:TOilQuery;ANPGroupField,APriceField:string);
begin
  APriceQuery.First;
  while not APriceQuery.Eof do
  begin
    if FindEdit( APriceQuery.FieldByName(ANPGroupField).AsInteger )^<>nil then
      FindEdit( APriceQuery.FieldByName(ANPGroupField).AsInteger )^.Value:=APriceQuery.FieldByName(APriceField).AsFloat;
    APriceQuery.Next;
  end; //while
end;
//==============================================================================
procedure TTalonPrice.SetPriceValue(ATalonPrice:TTalonPrice);
var
  i:integer;
begin
  for i:=0 to LEditList.Count-1 do
  begin
    LEdit:=LEditList.Items[i];
    LEdit^.pEdit.Value:=ATalonPrice.FindEdit( LEdit^.iNPGrpId )^.Value;
  end;
end;
//==============================================================================
procedure TTalonPrice.AddEdit(AEdit:PCurrencyEdit;ANpGrpId:integer);
begin
  new(LEdit);
  LEdit^.pEdit:=AEdit;
  LEdit^.iNpGrpId:=ANpGrpId;
  LEditList.Add(LEdit);
end;
//==============================================================================
function TTalonPrice.FindEdit(ANpGrpId:integer):PCurrencyEdit;
var
  i:integer;
begin
  result:=nil;
  for i:=0 to LEditList.count-1 do
  begin
    LEdit:=LEditList.Items[i];
    if LEdit.iNpGrpId=ANpGrpId then
      result:=LEdit^.pEdit;
  end;
end;
//==============================================================================
function TTalonPrice.GetPrice(ANpGrpId:integer):Extended;
begin
  result:=0;
  if FindEdit( ANpGrpId )^<>nil then
    result:=FindEdit( ANpGrpId )^.Value;
end;
//==============================================================================
procedure TTalonPrice.SetProperty(AProperty:TEditProperty;AValue:variant);
var
  i:integer;
begin
  for i:=0 to LEditList.Count-1 do
  begin
    LEdit:=LEditList.Items[i];
    case AProperty of
      epColor:
        LEdit^.pEdit.Color:=AValue;
      epEnabled:
        LEdit^.pEdit.Enabled:=AValue;
    end;
  end;
end;
//==============================================================================
//==============================TTalonPrice=====================================
//==============================================================================


//==============================================================================
//==================================TTalon======================================
//==============================================================================
constructor TTalon.Create(ASer:string;ANum:integer);
begin
  if ((not (ASer[1] in ['A', 'B', 'C', 'D', 'E', 'F'])) or
     (not (ASer[2] in ['0'])) or
     (not (ASer[3] in ['0', '1', '2', '3'])))
  then
    raise ETalonError.Create(TranslateText('��������� ����� ������ !'));
  LSer:=ASer;
  LNum:=ANum;
end;
//==============================================================================
constructor TTalon.Create(ASer:string;ANum:integer;ATalonPrice:TTalonPrice);
begin
  self.Create(ASer,ANum);
  LTalonPrice:=ATalonPrice;
end;
//==============================================================================
function TTalon.getNpGroup():integer;
begin
  result:=GetTalonGroupBySer(LSer,IsVsUkr);
end;
//==============================================================================
function TTalon.getNominal():integer;
begin
  result:=GetTalonNominalBySer(LSer);
end;
//==============================================================================
function TTalon.getIsVsUkr():boolean;
begin
  result:=(length(IntToStr(LNum))=9);
end;
//==============================================================================
function TTalon.getPrice():currency;
begin
  if LTalonPrice<>nil then
    result:=LTalonPrice.GetPrice(self.NpGroup)
  else
    raise ETalonError.Create('���������� �������� ���� !');
end;
//==============================================================================
//==================================TTalon======================================
//==============================================================================
procedure TTalonOutForm.dbceDepNameButtonClick(Sender: TObject);
var
  vId, vInst: integer;
  vName: string;
begin
  if ChooseOrg.CaptureOrg(1,Main_id,Inst,'yyx',vId,vInst,vName) then
  begin
    if dbceOrgName.DataSource.DataSet.State = dsBrowse then dbceOrgName.DataSource.DataSet.Edit;
    dbceDepName.DataSource.DataSet.FieldByName('Dep_Id').AsInteger := vId;
    dbceDepName.DataSource.DataSet.FieldByName('Dep_Inst').AsInteger := vInst;
    dbceDepName.DataSource.DataSet.FieldByName('Dep_Name').AsString := vName;
  end;
end;

end.
