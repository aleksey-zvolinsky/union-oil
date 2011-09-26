unit TalonPrihData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, RXDBCtrl, StdCtrls, ToolEdit, Mask, Buttons,
  Db, DBCtrls, DBTables, MemDS, DBAccess, Ora, CurrEdit, uCommonForm,uOilQuery,uOilStoredProc,
  DBGridEh, TalonOutData{$IFDEF VER150},Variants, Menus, VirtualTable{$ENDIF};

type
  TTalonPrihForm = class(TCommonForm)
    Panel1: TPanel;
    Panel3: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    SP: TOilStoredProc;
    sbDel: TSpeedButton;
    qTalon: TOilQuery;
    dsTalon: TOraDataSource;
    uTalon: TOraUpdateSQL;
    sbAdd: TSpeedButton;
    qNPGroup: TOilQuery;
    qSum: TOilQuery;
    dsSum: TOraDataSource;
    dsTalonDetail: TOraDataSource;
    qWork: TOilQuery;
    qCheckUp: TOilQuery;
    qCheckDown: TOilQuery;
    qTalonDetail: TOilQuery;
    qCheckDouble: TOilQuery;
    qExistsReturn: TOilQuery;
    qCheckEmission: TOilQuery;
    qTalonID: TFloatField;
    qTalonINST: TFloatField;
    qTalonSTATE: TStringField;
    qTalonHEAD_ID: TFloatField;
    qTalonHEAD_INST: TFloatField;
    qTalonNPGRP_ID: TFloatField;
    qTalonSER: TStringField;
    qTalonNUM: TFloatField;
    qTalonNOMINAL: TFloatField;
    qTalonPRICE: TFloatField;
    qTalonAUTO_ID: TFloatField;
    qTalonAUTO_INST: TFloatField;
    qTalonEMPLOY_ID: TFloatField;
    qTalonEMPLOY_INST: TFloatField;
    qTalonDATE_MOD: TDateTimeField;
    qTalonNPGRP_NAME: TStringField;
    qPrice: TOilQuery;
    qCheckSpis: TOilQuery;
    import: TBitBtn;
    Export: TBitBtn;
    SD: TSaveDialog;
    qTalonCODE_OBL: TFloatField;
    pTop: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dbePrihNum: TDBEdit;
    dbdePrihDate: TDBDateEdit;
    Label16: TLabel;
    Label12: TLabel;
    Label4: TLabel;
    dbceEdOper: TRxDBComboEdit;
    dbceOrgName: TRxDBComboEdit;
    dbceDepName: TRxDBComboEdit;
    pScanInput: TPanel;
    Edit3: TEdit;
    pCenter: TPanel;
    dbgTalon: TDBGridEh;
    pInfo: TPanel;
    pTalon: TPanel;
    Label3: TLabel;
    DBText6: TDBText;
    DBText5: TDBText;
    DBGrid1: TDBGridEh;
    pItog: TPanel;
    DBText2: TDBText;
    DBText1: TDBText;
    Label13: TLabel;
    Label14: TLabel;
    qLastPrice: TOilQuery;
    gbPrice: TGroupBox;
    sbPrice: TSpeedButton;
    lPrice: TLabel;
    ce76: TCurrencyEdit;
    ce80: TCurrencyEdit;
    ce92: TCurrencyEdit;
    ce95: TCurrencyEdit;
    ce98: TCurrencyEdit;
    ceDT: TCurrencyEdit;
    ceGaz: TCurrencyEdit;
    dbeSrepNum: TDBEdit;
    lSmenaNum: TLabel;
    qTalonOnHands: TOilQuery;
    qTalonOnHandsSerNum: TOilQuery;
    pm: TPopupMenu;
    miRefreshPrice: TMenuItem;
    vtAddition: TVirtualTable;
    qTalonDEP_NAME: TStringField;
    vtAdditionSER: TStringField;
    vtAdditionNUM: TIntegerField;
    vtAdditionDEP_NAME: TStringField;
    cbLog: TCheckBox;
    procedure ShowHidePrice;
    procedure OpenPrices;
    procedure bbOkClick(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure sbDelClick(Sender: TObject);
    procedure qTalonAfterPost(DataSet: TDataSet);
    procedure qTalonBeforePost(DataSet: TDataSet);
    procedure sbAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbceDepNameDblClick(Sender: TObject);
    procedure dbceOrgNameDblClick(Sender: TObject);
    procedure dbdePrihDateChange(Sender: TObject);
    procedure dbgTalonExit(Sender: TObject);
    procedure qTalonBeforeDelete(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbceEdOperButtonClick(Sender: TObject);
    procedure dbgTalonKeyPress(Sender: TObject; var Key: Char);
    procedure importClick(Sender: TObject);
    procedure ExportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbPriceClick(Sender: TObject);
    procedure RunProcessBarCode(AInstr:string);
    procedure dsTalonDetailDataChange(Sender: TObject; Field: TField);
    procedure FormDestroy(Sender: TObject);
    procedure dbeSrepNumKeyPress(Sender: TObject; var Key: Char);
    procedure GetVisibleSrepNum; // видимість зміни
    procedure GetEnabledOk();
    procedure miRefreshPriceClick(Sender: TObject);
  private
    OPER_ID: integer;
    procedure FillPrice;
    procedure log(AText: string);
    function GetDataSet:TDataSet;
    procedure AddAdditionInfo(ASer: string; ANum:integer;ADepName:string);
  public
    InstRecord: integer;
    FTalonPrice: TTalonPrice;
    FFirstTalonType: (fttNull,fttAvias,fttAlfa);
    CurDate: TDate;
    IsAzsEmission: Boolean;
    IsEditClick: Boolean;
    FDocDate: TDateTime; // испольлзуеться для проверки. Вводиться после ввода первого талоно и при редактировании
    function TestTalon( ASer:string;ANum:integer;AReadOnly:boolean=false ):integer;
    property DataSet: TDataSet read GetDataSet;
  end;

implementation

Uses ChooseOrg, Main, OilSTD, TalonPrih, OperTypeRef, uDBFunc, ExFunc, TalonOpenCode;

const
  IsBySerNum = true;

{$R *.DFM}
Var
   InStr, ChStr: String;
   
//==============================================================================
procedure TTalonPrihForm.OpenPrices;
begin
  if qPrice.Active then qPrice.Close;
  _OpenQueryPar(qPrice,
    ['date_',     dbdePrihDate.DataSource.DataSet['prih_date'],
     'azs_id',    dbceOrgName.DataSource.DataSet['org_id']]);
  //ShowTextInMemo(FullSqlText(qPrice));
end;
//==============================================================================
procedure TTalonPrihForm.ShowHidePrice;
begin
  IsAzsEmission := (OPER_ID = 183) and (dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger = 8);

  dbgTalon.FieldColumns['PRICE'].Visible := IsAzsEmission;
  if IsAzsEmission then
  begin
    gbPrice.Height := 49;
    FillPrice;
  end
  else gbPrice.Height := 0;
  Label3.Left:=DBGrid1.Left;
  DbText5.Left:=Label3.Left+Label3.Width+5;
  DBText6.Left:=DBText5.Left+30;
end;
//==============================================================================
procedure TTalonPrihForm.bbOkClick(Sender: TObject);
var org_id,org_inst,org_type,dep_id,dep_inst: integer;
begin
  try
    bbOk.Enabled := false;
    if qTalon.State <> dsBrowse then qTalon.Post;

    dep_id:=dbceDepName.DataSource.DataSet.FieldByName('Dep_Id').AsInteger;
    dep_inst:=dbceDepName.DataSource.DataSet.FieldByName('Dep_Inst').AsInteger;
    org_id:=dbceOrgName.DataSource.DataSet.FieldByName('Org_Id').AsInteger;
    org_inst:=dbceOrgName.DataSource.DataSet.FieldByName('Org_Inst').AsInteger;
    org_type:=dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger;

    if OPER_ID <> 183 then
    begin
      if not ((dep_id = MAIN_ORG.ID) and (dep_inst = MAIN_ORG.INST)) then
        raise exception.create(TranslateText('Организация может заводить приходы только на себя!'));
    end
    else
    begin
      if MAIN_ORG.ID = 118 then
      begin
        if not ((org_id = MAIN_ORG.ID) and (org_inst = MAIN_ORG.INST) or (org_type = 8)) then
          raise exception.create(TranslateText('В Броварах можно заводить эмиссию или от себя или от АЗС!'))
      end
      else
      begin
        if not ((org_id = MAIN_ORG.ID) and (org_inst = MAIN_ORG.INST)) then
          raise exception.create(TranslateText('Организация может заводить эмиссию только от себя!'));
      end;
    end;

    if dbeSrepNum.Visible then
    begin
      if dbeSrepNum.Text = '' then
        raise Exception.Create(TranslateText('Не определен номер смены!'));

      if not (StrToInt(dbeSrepNum.Text) in [1..9]) then
        raise Exception.Create(TranslateText('Номер смены может быть от 1 до 9!'));

      qWork.Close;
      qWork.SQL.Text :=
        'select * from oil_talon_prih' +
        ' where trunc(prih_date) = :prih_date and smena_num = :smena_num' +
        '   and org_id = :org_id and org_inst = :org_inst' +
        '   and not (id = :id and inst = :inst) and state = ''Y''';
      _OpenQueryPar(qWork,
        ['prih_date', dbdePrihDate.Date,
         'smena_num', dbeSrepNum.Text,
         'id',        dbceDepName.DataSource.DataSet.FieldByName('id').AsInteger,
         'inst',      dbceDepName.DataSource.DataSet.FieldByName('inst').AsInteger,
         'org_id',    dbceDepName.DataSource.DataSet.FieldByName('org_id').AsInteger,
         'org_inst',  dbceDepName.DataSource.DataSet.FieldByName('org_inst').AsInteger]);
      if not qWork.IsEmpty then
        raise Exception.Create(TranslateText('Смена номер ')+ dbeSrepNum.Text +TranslateText(' в этот день уже была!'));
    end;

    if dbePrihNum.Text = '' then
      raise Exception.Create(TranslateText('Не определен номер приходного документа !'));
    if dbdePrihDate.Date = 0 then
      raise Exception.Create(TranslateText('Не определена дата приходного документа !'));
    if dbceOrgName.Text = '' then
      raise Exception.Create(TranslateText('Не определен клиент !'));
    if dbceEdOper.Text = '' then
      raise Exception.Create(TranslateText('Не определена операция !'));
    if qTalon.IsEmpty then
      raise Exception.Create(TranslateText('Не внесены реализуемые талоны !'));

    if (OPER_ID = 180) and IsEditClick then
      MessageDlg(TranslateText('Возможно, данный приход талонов уже подвязан к сменному отчету.')
        +#10#13+ TranslateText('Сообщите управлению про изменения в данном приходе талонов.'), mtInformation, [mbOk], 0);
    ModalResult := mrOk;
  finally
    bbOk.Enabled := true;
  end;
end;
//==============================================================================
procedure TTalonPrihForm.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  KeyPressCode(Self,Sender,qTalon,Key);
end;
//==============================================================================
procedure TTalonPrihForm.sbDelClick(Sender: TObject);
begin
  if not qTalon.IsEmpty then qTalon.Delete;
end;
//==============================================================================
procedure TTalonPrihForm.qTalonAfterPost(DataSet: TDataSet);
var
  Ser: String;
  Num: Integer;
begin
  try
    qTalon.DisableControls;
    qTalon.ApplyUpdates;
    qTalon.CommitUpdates;
    Ser := qTalon.FieldByName('Ser').AsString;
    Num := qTalon.FieldByName('Num').AsInteger;
    qTalon.Close;
    qTalon.Open;
    while not((qTalon.Eof) or ((Ser = qTalon.FieldByName('Ser').AsString)
      and(Num = qTalon.FieldByName('NUM').AsInteger)))
    do
      qTalon.Next;
    //Сораням дату прихода после ввода первого талона
    if(qTalon.RecordCount=1)then
      FDocDate:=dbdePrihDate.Date;
  finally
    qTalon.EnableControls;
  end;
end;
//==============================================================================
function TTalonPrihForm.TestTalon( ASer:string;ANum:integer;AReadOnly:boolean=false ): integer;
var
  Talon:TTalon;
begin
  log('Вход в ProvPrihTalon');
  log('Проверка - Серия талона содержит ошибочные символы !');
  try
    Talon:=TTalon.Create(ASer,ANum,FTalonPrice);
  except
    Result := 1; // Серия талона содержит ошибочные символы !;
    //Talon.Free;
    exit;
  end;
  try
    if(qTalon.State = dsInsert)and(not AReadOnly)then
    begin
      log('Присваиваем Id,Inst,Head_Id,Head_Inst');
      qTalon.FieldByName('Id').AsInteger := GetSeqNextVal('S_OIL_TALON_DATA');
      qTalon.FieldByName('Inst').AsInteger := Inst;
      qTalon.FieldByName('Head_Id').AsInteger := qTalon.DataSource.DataSet.FieldByName('Id').AsInteger;
      qTalon.FieldByName('Head_Inst').AsInteger := qTalon.DataSource.DataSet.FieldByName('Inst').AsInteger;
    end;


    if(not AReadOnly)then
    begin
      log('Присваиваем NPGrp_Id');
      qTalon.FieldByName('NPGrp_Id').AsInteger:= Talon.NpGroup;
      log('Присваиваем Nominal');
      qTalon.FieldByName('Nominal').AsInteger := Talon.Nominal;

      log('Проверка - Присутствие в эмисии');
      _OpenQueryPar(qCheckEmission,
        ['Ser',   Talon.Ser,
         'Num',   Talon.Num,
         'Id',    qTalon['id'],
         'Inst',  qTalon['inst']]);

      if OPER_ID = 183 then
      begin
        log('Проверка - Талон уже содержится в базе данных!');
        if not qCheckEmission.IsEmpty then
        begin
          Result := 2; // Талон уже содержится в базе данных!;
          exit;
        end;
        log('Проверка - Талон выписан данному подразделению');
        // если талон всеукраинский, он должен быть в таблице OIL_TALON_EM
        if Talon.IsVsUkr then
          if GetSqlValueParSimple(' select count(*) from oil_talon_em'
            +' where state=''Y'' and ser=:ser'
            +'   and :num between num_from and num_to'
            +'   and dep_id=dep_inst and dep_id=:inst',
            ['ser',Talon.Ser,
             'num',Talon.Num,
             'inst',MAIN_ORG.INST]
            )=0
          then
          begin
            Result:=9;
            exit;
          end;
      end
      else if qCheckEmission.IsEmpty then
      begin
        Result:=8; // Талон отсутствует в эмиссии
        exit;
      end;
      log('Проверка - Серия и Номер талона повторяется!');
      _OpenQueryPar(qCheckDouble,
        ['Head_Id',    qTalon.DataSource.DataSet['id'],
         'Head_Inst',  qTalon.DataSource.DataSet['inst'],
         'Ser',        Talon.Ser,
         'Num',        Talon.Num,
         'Id',         qTalon['id'],
         'Inst',       qTalon['inst']]);

      if(qTalon.State = dsInsert)then
      begin
        if not qCheckDouble.IsEmpty then
        begin
          Result := 3; // Серия и Номер талона повторяется!;
          exit;
        end;
      end;
    end;
    log('Проверка - Талон уже оприходован!');
    _OpenQueryPar(qCheckDown,
      ['MainId',         qTalon.DataSource.DataSet['id'],
      'MainInst',        qTalon.DataSource.DataSet['inst'],
      'Ser',             Talon.Ser,
      'Num',             Talon.Num,
      'Inst',            Inst,
      'Date_',           dbdePrihDate.Date]);

    if qCheckDown.Fields[1].AsInteger = 1 then
    begin
      Result := 4; // Талон уже оприходован!;
      exit;
    end;
    log('Проверка - Талон оприходован позже!');
    _OpenQueryPar(qCheckUp,
      ['Ser',            Talon.Ser,
      'Num',             Talon.Num,
      'Inst',            Inst,
      'Date_',           dbdePrihDate.Date]);

    if qCheckUp.Fields[1].AsInteger = 1 then
    begin
      Result := 5; // Талон оприходован позже!;
      exit;
    end;
    log('Проверка - Талон был списан!');
    _OpenQueryPar(qCheckSpis,
      ['Ser',             Talon.Ser,
       'Num',             Talon.Num,
       'Inst',            Inst,
       'Date_',           dbdePrihDate.Date]);

    if qCheckSpis['co']>0 then
    begin
      Result := 6; // Талон был списан!;
      exit;
    end;
    log('Присваиваем price');
    if(not AReadOnly)and( IsAzsEmission and qPrice.Active and (qTalon.FieldByName('price').AsInteger=0) )then
    begin
      if qPrice.Locate('np_grp',Talon.NpGroup,[]) then
        qTalon['price'] := qPrice['price'];
    end;

    case OPER_ID of
    181:
    begin
      if dbceOrgName.DataSource.DataSet.FieldByName('Org_Id').AsInteger = 0 then
        raise Exception.Create(TranslateText('Введите организацию, которая возвращает талоны !'));

      log('Проверка - Талон данной организации не отпускался!');
      _OpenQueryPar(qExistsReturn,
        ['Inst',               INST,
         'Org_Id',             dbceOrgName.DataSource.DataSet['org_id'],
         'Org_Inst',           dbceOrgName.DataSource.DataSet['org_inst'],
         'Ser',                Talon.Ser,
         'Num',                Talon.Num]);

      if qExistsReturn.IsEmpty then
      begin
        Result := 7; // Талон данной организации не отпускался!;
        exit;
      end
      else if(not AReadOnly)then
        qTalon.FieldByName('Price').AsFloat := qExistsReturn.FieldByName('Price').AsFloat;
    end;
    243:
    begin
      if AdmSettings.Get('TALON_CHECK_RETURN') = 'Y' then
      begin
        if dbceOrgName.DataSource.DataSet.FieldByName('Org_Id').AsInteger = 0 then
          raise Exception.Create(TranslateText('Введите организацию, которая возвращает талоны !'));
        log('Проверка - Талон данной организации не отпускался (возврат по обмену)!');
        if IsBySerNum then
        begin
          qTalonOnHands.Close;
          _OpenQueryPar(qTalonOnHands,
            ['BeginDate', dbdePrihDate.Date,
             'ClientId', dbceOrgName.DataSource.DataSet['org_id'],
             'Ser',      Talon.Ser,
             'Num',      Talon.Num]);
        end
        else
        begin
          qTalonOnHands.Filtered := False;
          qTalonOnHands.Filter := 'SER = '''+Talon.Ser+''' and NUM = '+IntToStr(Talon.Num);
          qTalonOnHands.Filtered := True;
        end;
        
        if qTalonOnHands.IsEmpty then
        begin
          Result := 7; // Талон данной организации не отпускался!;
          exit;
        end
        else
        begin
          if qTalon.State in [dsInactive] then
            qTalon.Open;
          if qTalon.State in [dsBrowse] then
            qTalon.Edit;
          AddAdditionInfo(Talon.Ser, Talon.Num, qTalonOnHands.FieldByName('FROM_NAME').AsString);
          qTalon.FieldByName('PRICE').AsFloat := qTalonOnHands.FieldByName('PRICE').AsFloat;
          if (Self.FFirstTalonType = fttNull) or (qTalon.RecordCount = 1) then
          begin
            case qTalonOnHands.FieldByName('GENERATION').AsInteger of
              1: Self.FFirstTalonType := fttAlfa;
              2: Self.FFirstTalonType := fttAvias;
              else
                raise Exception.Create('Не определенно поколение организации отпустившей талон!');
            end;
          end;
          if AdmSettings.Get('TALON_DEVIDE_ALFA_AVIAS') = 'Y' then
          begin
            if (qTalonOnHands.FieldByName('GENERATION').AsInteger = 1)and (Self.FFirstTalonType <> fttAlfa) then
            begin
              Result := 10;
              exit;
            end
            else if (qTalonOnHands.FieldByName('GENERATION').AsInteger = 2)and (Self.FFirstTalonType <> fttAvias) then
            begin
              Result := 11;
              exit;
            end;
          end;
        end;
      end;
    end;
    end; //case OPER_ID of
  finally
    Talon.Free;
  end;

  Result := 0;
  log('Выход из ProvPrihTalon');
end;
//==============================================================================
procedure TTalonPrihForm.qTalonBeforePost(DataSet: TDataSet);
const
  sCl =
    'select name || '' ('' || id || '')''' +
    '  from (select cl.id, cl.name, row_number() over(order by t.date_ desc) as rnum' +
    '          from V_Oil_Talon_Op_Un t,' +
    '               (select id, inst, max(name) as name' +
    '                  from (select id, inst, name from andriy.oil_org' +
    '                        union' +
    '                        select id, inst, name from victory.oil_org)' +
    '                 group by id, inst) cl' +
    '         where t.Tip = ''O''' +
    '           and t.Ser = :Ser and t.Num = :Num' +
    '           and t.oper_id in (190, 245, 244)' +
    '           and cl.id = t.to_id and cl.inst = t.to_inst)' +
    ' where rnum = 1';
Var
   Ser, sMesError: string;
   Num,CodeObl: Integer;
begin
  try
    Ser := qTalon.FieldByName('Ser').AsString;
    Num := qTalon.FieldByName('Num').AsInteger;

    if OPER_ID = 0 then
      raise Exception.Create(TranslateText('Перед вводом талонов укажите операцию!'));

    if dbdePrihDate.Date = 0 then
      raise Exception.Create(TranslateText('Не определена дата прихода !'));

    if (qTalon.FieldByName('Ser').AsString = '') or (qTalon.FieldByName('Num').AsInteger = 0) then
      raise Exception.Create(TranslateText('Серия/Номер талона не определена !'));

    if CheckDestrTalon(ser,num)=true then
      raise Exception.Create(TranslateText('Талон '+ser+inttostr(num)+' списан!'));

    TalonExceptionHandler( TestTalon(Ser, Num),Ser,Num,toPrihod,teoExcept );

   { case ProvPrihTalon(Ser, Num) of
      1: raise Exception.Create('Серия талона содержит ошибочные символы !');
      2: raise Exception.Create(TranslateText('Талон серии "') + qTalon.FieldByName('Ser').AsString + TranslateText('" и номером ') + qTalon.FieldByName('NUM').AsString + TranslateText(' уже содержится в базе данных !'));
      3: raise Exception.Create('Серия "' + qTalon.FieldByName('Ser').AsString + '" и Номер ' + qTalon.FieldByName('NUM').AsString + ' талона повторяется !');
      4: raise Exception.Create(TranslateText('Талон ') + qTalon.FieldByName('Ser').AsString + '/' + qTalon.FieldByName('NUM').AsString + ' уже оприходован !');
      5: raise Exception.Create(TranslateText('Талон ') + qTalon.FieldByName('Ser').AsString + '/' + qTalon.FieldByName('NUM').AsString + ' оприходован позже !');
      6: raise Exception.create(TranslateText('Талон ') + qTalon.FieldByName('Ser').AsString + '/' + qTalon.FieldByName('NUM').AsString + ' был списан !');
      7: raise Exception.Create('Талон Серия "' + qTalon.FieldByName('Ser').AsString + '" и Номер ' + qTalon.FieldByName('NUM').AsString + #13#10+ ' данной организации не отпускался!');
      8: raise Exception.Create(Format('Талон Серия "%s" и номер "%s" отсутствует в эмиссии',[qTalon['ser'],qTalon['num']]));
      9: raise Exception.create(Format('Талон Серия "%s" и номер "%s" отсутствует среди талонов, отписанных этому подразделению',[qTalon['ser'],qTalon['num']]));
    end;}

    CodeObl:=GetOblByTalonNum(num);
    if CodeObl=0 then
      raise exception.create(TranslateText('Не найден код обла для талона ')+ser+' №'+IntToStr(num));
    qTalon.FieldByName('code_obl').AsInteger:=CodeObl;
    if qTalon.FieldByName('Price').AsFloat = 0 then
      qTalon.FieldByName('Price').AsFloat := FTalonPrice.GetPrice( qTalon.FieldByName('NPGrp_Id').AsInteger );
  except on E: Exception do
    Begin
      qTalon.Cancel;
      qTalon.CancelUpdates;
      if cbLog.Checked then // записуємо у лог помилки
      begin
        sMesError := TranslateText('Ошибка: ')+ E.Message +#13#10+ TranslateText(' Клиент: ')+
          nvl(GetSqlValueParSimple(sCl, ['Ser', Ser, 'Num', Num]), 'Не найден!!!');
        cbLog.Hint :=
          GetMainDir +'TalonPrih_'+ FormatDateTime('yyyy-mm-dd', dbdePrihDate.Date) +'_'+ dbePrihNum.EditText +'.log';
        ExFunc.log(cbLog.Hint, FormatDateTime('dd.mm.yyyy hh:nn:ss', now()) +' '+ sMesError);
      end;
      raise Exception.Create(E.Message);
    end;
  end;
end;
//==============================================================================
procedure TTalonPrihForm.sbAddClick(Sender: TObject);
var
  Ser: String;
  Num: Integer;
begin
  Ser := qTalon.FieldByName('SER').AsString;
  Num := qTalon.FieldByName('NUM').AsInteger;
  qTalon.Append;
  qTalon.FieldByName('SER').AsString := Ser;
  qTalon.FieldByName('NUM').AsInteger := Num + 1;
  qTalon.Post;
end;
//==============================================================================
procedure TTalonPrihForm.FormShow(Sender: TObject);
begin
  // Проверяем на какой базе работаем
  if LAUNCH_MODE <> 'GREAT_OIL' then
    qTalonDetail.SQL.Strings[11] := '';
  qTalon.Open;
  qTalonDetail.Open;
  qSum.Open;
  InStr := '';
  ChStr := '';
  ShowHidePrice;
  GetVisibleSrepNum; // видимість зміни
  GetEnabledOk(); // активність bbOk
  qTalon.DisableControls;
  try
    while not qTalon.Eof do
    begin
      qTalonOnHands.Close;
      _OpenQueryPar(qTalonOnHands,
        ['BeginDate', dbdePrihDate.Date,
         'ClientId', dbceOrgName.DataSource.DataSet['org_id'],
         'Ser',      qTalon['Ser'],
         'Num',      qTalon['Num']]);
      AddAdditionInfo(qTalon['Ser'], qTalon['Num'], qTalonOnHands.FieldByName('FROM_NAME').AsString);
      qTalon.Next;
    end;
    qTalon.Close;
    qTalon.Open;
  finally
    qTalon.EnableControls;
  end;
end;
//==============================================================================
procedure TTalonPrihForm.GetEnabledOk(); // активність bbOk
begin
  if dbceEdOper.DataSource = nil then
    bbOk.Enabled := (dbdePrihDate.Date >= StrToDate(CLOSE_DATE)) and (InstRecord = INST)
  else
    bbOk.Enabled := IsCanEditTalonDoc(OPER_ID) and (dbdePrihDate.Date >= StrToDate(CLOSE_DATE))
      and (InstRecord = INST);

  if OPER_ID = 199 then
    bbOk.Enabled := false;

  import.Enabled := bbOk.Enabled;
  Export.Enabled := bbOk.Enabled;
end;
//==============================================================================
procedure TTalonPrihForm.dbceDepNameDblClick(Sender: TObject);
var
  vId, vInst, vType: Integer;
  vName: String;
begin
  if OPER_ID = 0 then
  begin
    MessageDlg(TranslateText('Необходимо выбрать операцию!'), mtError, [mbOK], 0);
    exit;
  end;

  if dbceDepName.DataSource.DataSet.State = dsBrowse then
    dbceDepName.DataSource.DataSet.Edit;
  if ChooseOrg.CaptureOrgT(1, MAIN_ID, INST, 'yyy', vId, vInst, vName, vType) then
  begin
    if not (vType in [3, 4]) then
      raise Exception.Create(TranslateText('Выбран недопустимый тип организации!'));

    if not ((OPER_ID = 180) and (InstIsPossible(vInst) or (vType in [3, 4]))) then
      raise Exception.Create(TranslateText('Организация "Кому" не имеет права приходовать себе талоны!'));

    dbceDepName.DataSource.DataSet.FieldByName('Dep_Id').AsInteger := vId;
    dbceDepName.DataSource.DataSet.FieldByName('Dep_Inst').AsInteger := vInst;
    dbceDepName.DataSource.DataSet.FieldByName('Dep_Type').AsInteger := vType;
    dbceDepName.DataSource.DataSet.FieldByName('Dep_Name').AsString := vName;
  end;
  ShowHidePrice;
end;
//==============================================================================
procedure TTalonPrihForm.dbceOrgNameDblClick(Sender: TObject);
var
  vId, vInst, vType, Idx: Integer;
  vName, Flags: String;
begin
  if OPER_ID = 0 then
  begin
    MessageDlg(TranslateText('Необходимо выбрать операцию!'), mtError, [mbOK], 0);
    exit;
  end;
  
  Flags := 'nyyyyyyy'; Idx := 0;
  case OPER_ID of
    180: Begin Flags := 'nynnnynn'; Idx := 2; End;
    181, 243: Begin Flags := 'yyynnnyn'; Idx := 3; End;
    182: Begin Flags := 'nyyyynnn'; Idx := 1; End;
    183: Begin Flags := 'nyyyyynn'; Idx := 0; End;
    268: Begin Flags := 'yyyyynnn'; Idx := 1; End;
  end;
  if dbceOrgName.DataSource.DataSet.State = dsBrowse then
    dbceOrgName.DataSource.DataSet.Edit;
  if ChooseOrg.CaptureOrgT(Idx, MAIN_ID, INST, Flags, vId, vInst, vName, vType) then
  begin
    if not (vType in [1, 3, 4, 5, 8, 11]) then
      raise Exception.Create(TranslateText('Выбран недопустимый тип организации!'));

    dbceOrgName.DataSource.DataSet.FieldByName('Org_Id').AsInteger := vId;
    dbceOrgName.DataSource.DataSet.FieldByName('Org_Inst').AsInteger := vInst;
    dbceOrgName.DataSource.DataSet.FieldByName('Org_Type').AsInteger := vType;
    dbceOrgName.DataSource.DataSet.FieldByName('Org_Name').AsString := vName;
    dbgTalon.FieldColumns['DEP_NAME'].Visible := False;
    case OPER_ID of
      243:
      begin
        if not IsBySerNum then
        begin
          if qTalonOnHands.Active then qTalonOnHands.Close;
          _OpenQueryPar(qTalonOnHands,
            ['BeginDate', dbdePrihDate.Date,
             'ClientId', dbceOrgName.DataSource.DataSet.FieldByName('Org_Id').AsInteger]);
        end;
        dbgTalon.FieldColumns['DEP_NAME'].Visible := True;
      end;
    end;
    ShowHidePrice;
  end;
end;
//==============================================================================
procedure TTalonPrihForm.dbdePrihDateChange(Sender: TObject);
begin
  if Showing then qTalon.DataSource.DataSet.Post;
  if IsAzsEmission then OpenPrices;
  if not Self.Visible and ( (Sender as TDBDateEdit).Date <= StrToDate(Close_Date) )then
    (Sender as TDBDateEdit).Enabled := false;

  GetEnabledOk(); // активність bbOk
  if bbOk.Enabled then
    case OPER_ID of
      243:
      if not IsBySerNum then
      begin
        if qTalonOnHands.Active then qTalonOnHands.Close;
        _OpenQueryPar(qTalonOnHands,
          ['BeginDate', dbdePrihDate.Date,
           'ClientId', dbceOrgName.DataSource.DataSet.FieldByName('Org_Id').AsInteger]);
      end;
    end;

  if( (FDocDate<>0) and bbOk.Enabled )then
  if( not(TestAllTalon(toPrihod,qTalon)) )then//Проверяем все талоны
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
//==============================================================================
procedure TTalonPrihForm.dbgTalonExit(Sender: TObject);
begin
  if qTalon.State <> dsBrowse then qTalon.Post;
end;
//==============================================================================
procedure TTalonPrihForm.qTalonBeforeDelete(DataSet: TDataSet);
begin
  qCheckUp.Close;
  qCheckUp.ParamByName('Ser').AsString := DataSet.FieldByName('Ser').AsString;
  qCheckUp.ParamByName('Num').AsInteger := DataSet.FieldByName('Num').AsInteger;
  qCheckUp.ParamByName('Inst').AsInteger := Inst;
  qCheckUp.ParamByName('Date_').AsDate := dbdePrihDate.Date;
  qCheckUp.Open;
  if qCheckUp.Fields[1].AsInteger = 2
    then Raise Exception.Create(TranslateText('Талон ') + DataSet.FieldByName('Ser').AsString + '/' + DataSet.FieldByName('NUM').AsString + TranslateText(' нельзя удалить, он продан ') + qCheckUp.Fields[0].AsString + ' !');
end;
//==============================================================================
procedure TTalonPrihForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qTalon.Close;
  qTalonDetail.Close;
  qSum.Close;
end;
//==============================================================================
procedure TTalonPrihForm.dbceEdOperButtonClick(Sender: TObject);
var
  OperTypeRefForm : TOperTypeRefForm;
  FromOrgType : integer;

  Oper_Name: string;

  CurID: integer;
  CurInst: integer;
begin
  FromOrgType := GetOrgType(dbceOrgName.DataSource.DataSet.FieldByName('Org_Id').AsInteger,
                            dbceOrgName.DataSource.DataSet.FieldByName('Org_Inst').AsInteger);
  Application.CreateForm(TOperTypeRefForm, OperTypeRefForm);
  try
    OperTypeRefForm.SGrpId := 14;
    OperTypeRefForm.bbClear.Enabled:=false;
    case FromOrgType of
      3:begin
          OperTypeRefForm.edName.Text := TranslateText('Приход талонов по перемещению');
          OperTypeRefForm.edName.Enabled := False;
        end;
      1,11:
        begin
          OperTypeRefForm.edName.Text := TranslateText('Возврат талонов');
          OperTypeRefForm.edName.Enabled := False;
        end;
    end;
    OperTypeRefForm.ShowModal;

    if OperTypeRefForm.ModalResult = mrOk then
    begin
      // Сохраняем полученные данные
      OPER_ID := OperTypeRefForm.qId.AsInteger;
      Oper_Name:= OperTypeRefForm.qName.AsString;

      if (FromOrgType=4) and not (OPER_ID in [182,183]) then begin // Выбран ОБЛ и пытаются выбрать что-то кроме эмиссии или перем
        MessageDlg(TranslateText('От ОБЛ-а допустима только эмиссия или перемещение!'),mtWarning,[mbOK],0);
        Exit;
      end;

      if (FromOrgType = 8) and (OPER_ID <> 180) then
      begin
        MessageDlg(TranslateText('От АЗС допустима только операция "Отоваривание талонов"!'), mtWarning, [mbOK], 0);
        Exit;
      end;

      miRefreshPrice.Visible := (OPER_ID = 243);
      case OPER_ID of
        199:
          begin
            MessageDlg(TranslateText('Приходы по данной операции создаются автоматически при создании зеркального отпуска'),mtWarning,[mbOK],0);
            Exit;
          end;//199
        183:
          begin
            if MAIN_ORG.Org_type <> 4 then
            begin // Попытка завести эмиссию не на ОБЛ-е
               MessageDlg(TranslateText('Эмиссия талонов должна заводиться только в управлении!'),mtWarning,[mbOK],0);
               Exit;
            end;
            if qTalon.RecordCount <> 0 then
            if MessageDlg(TranslateText(' Необходимо проверить введенные талоны на наличие их в базе данных.')+#10#13 +
                          TranslateText(' Данная операция займет некоторое временя.')+#10#13#10#13 +
                          TranslateText(' Вы хотите продолжить?'), mtConfirmation, [mbYes,mbNo],0) = mrYes
            then
            begin
              // Получаем текущий указатель
              CurID:= qTalon.FieldByName('ID').AsInteger;
              CurInst:= qTalon.FieldByName('INST').AsInteger;
              with qTalon do
              begin
                DisableControls;
                try
                  First;
                  while not Eof do
                  begin
                    qCheckEmission.Close;
                    qCheckEmission.ParamByName('Ser').AsString:= qTalon.FieldByName('Ser').AsString;
                    qCheckEmission.ParamByName('Num').AsString:= qTalon.FieldByName('Num').AsString;
                    qCheckEmission.ParamByName('Id').Value := qTalon.FieldByName('Id').Value;
                    qCheckEmission.ParamByName('Inst').Value := qTalon.FieldByName('Inst').Value;
                    qCheckEmission.Open;
                    if not qCheckEmission.IsEmpty then
                    begin
                      MessageDlg(TranslateText('Талон серии "') + qTalon.FieldByName('Ser').AsString + TranslateText('" и номером ') +
                                 qTalon.FieldByName('NUM').AsString +
                                 TranslateText(' уже содержится в базе данных !'),mtWarning,[mbOK],0);
                      Exit;
                    end;
                    Next;
                  end;
                finally
                  qTalon.Locate('ID;INST', VarArrayOf([CurID, CurInst]), []);
                  EnableControls;
                end;
              end;
            end
            else
            begin //if qTalon.RecordCount <> 0 then
              Exit;
            end;
          end; //183
      end;  // case OPER_ID of

      if OPER_ID <> 183 then
      begin
        dbceOrgName.Enabled := True;
        dbceOrgName.Color := clWindow;
      end;
      if dbceEdOper.DataSource.DataSet.State = dsBrowse then
        dbceEdOper.DataSource.DataSet.Edit;
      dbceEdOper.DataSource.DataSet.FieldByName('Oper_Id').AsInteger := OPER_ID;
      dbceEdOper.DataSource.DataSet.FieldByName('Oper_Name').AsString := Oper_Name;
      ShowHidePrice;
    end;
  finally
    OperTypeRefForm.Free;
    OPER_ID := dbceEdOper.DataSource.DataSet.FieldByName('Oper_Id').AsInteger;
    GetVisibleSrepNum; // видимість зміни
  end;
end;
//==============================================================================
procedure TTalonPrihForm.GetVisibleSrepNum; // видимість зміни
begin
  // номер зміни чітко приєднаний до операції 180
  dbeSrepNum.Visible := OPER_ID = 180;
  lSmenaNum.Visible  := dbeSrepNum.Visible;
end;
//==============================================================================
procedure TTalonPrihForm.dbgTalonKeyPress(Sender: TObject; var Key: Char);
begin
  if (dbgTalon.SelectedField.FieldName='PRICE') and (Key in ['.',',']) then
    Key:=DECIMALSEPARATOR;
end;
//==============================================================================
procedure TTalonPrihForm.importClick(Sender: TObject);
var
  TalonOpenCode: TTalonOpenCodeForm;
  n: integer;
begin
  if OPER_ID = 0 then
  begin
    ShowMessage(TranslateText('Перед вводом талонов укажите операцию.'));
    exit;
  end;

  if not qTalon.IsEmpty then
    if MessageDlg(TranslateText('Вы хотите удалить уже записанные талоны и записать новые?'),
      mtConfirmation, [mbNo, mbYes], 0) = mrYes then
    begin
      qTalon.Last;
      for n := qTalon.RecordCount downto 1 do
        qTalon.Delete;
    end
    else exit;
  // загружаємо формочку імпорта талонів
  TalonOpenCode := TTalonOpenCodeForm.Create(tptPrih);
  try
    qTalon.DisableControls;
    TalonOpenCode.ShowModal;
  finally
    TalonOpenCode.Free;
    qTalon.EnableControls;
  end;
  qTalon.Close;
  qTalon.Open;
end;
//==============================================================================
procedure TTalonPrihForm.ExportClick(Sender: TObject);
Var
   Save, FileName, track: string; // путь к файлу и его имя, имя файла, путь к нему
   TalonOut: TTalonOutForm;
begin
  if qTalon.IsEmpty then exit;

  if dbePrihNum.EditText = '' then
  begin
    Showmessage(TranslateText('Введите номер отпуска.'));
    exit;
  end;

  if dbdePrihDate.EditText = 'dbdePrihDate' then
  begin
    Showmessage(TranslateText('Введите дату отпуска.'));
    exit;
  end;

  SD.FileName := dbePrihNum.EditText +'_Talon_'+ ReplaceAllSubstr(dbdePrihDate.EditText, '.', '_');

  if SD.Execute then
  begin
    TalonOut := TTalonOutForm.Create(Application);
    try
      qTalon.DisableControls;
      if not TalonOut.MTCode.Active then TalonOut.MTCode.Open;
      if TalonOut.TalonToCode(TalonOut.MTCode, qTalon) then
      begin
        // выделение имени и пути из SD.FileName
        Save := SD.FileName;
        Track := ExtractFileDir(SD.FileName);
        FileName := ExtractFileName(SD.FileName);
        // выгружаем таблицу у файл и сохраняем его
        try
          if not TalonOut.error then
          begin
            DataSetToDbf(TalonOut.MTCode, track, FileName, nil, 'FOXPRO');
            ShowMessage(TranslateText('Программа выгрузила штрих-коды талонов в ')+SD.FileName+'. ');
          end;
        except on E:Exception do
          ShowMessage(TranslateText('Программа не может выгрузить штрих-коды талонов! ')+e.message);
        end;
      end;
    finally
      qTalon.EnableControls;
      TalonOut.Free;
    end;
  end;
end;
//==============================================================================
procedure TTalonPrihForm.FormCreate(Sender: TObject);
begin
  inherited;
  OPER_ID := dbceEdOper.DataSource.DataSet.FieldByName('Oper_Id').AsInteger;
  FTalonPrice:=TTalonPrice.Create;
  FTalonPrice.AddEdit( @ceDT,3 );
  FTalonPrice.AddEdit( @ce76,4);
  FTalonPrice.AddEdit( @ce80,5);
  FTalonPrice.AddEdit( @ce92,6);
  FTalonPrice.AddEdit( @ce95,7);
  FTalonPrice.AddEdit( @ce98,10);
  FTalonPrice.AddEdit( @ceGaz,62);
  IsEditClick := false;
  if not AdmSettings.Exist('TALON_CHECK_RETURN') then
    AdmSettings.Save('TALON_CHECK_RETURN','Y');
  if not AdmSettings.Exist('TALON_DEVIDE_ALFA_AVIAS') then
    AdmSettings.Save('TALON_DEVIDE_ALFA_AVIAS','Y');
  if IsBySerNum then
    qTalonOnHands := qTalonOnHandsSerNum;
end;
//==============================================================================
Procedure TTalonPrihForm.FillPrice;
begin
  if not dbdePrihDate.DataSource.DataSet.FieldByName('Prih_Date').IsNull then
  begin
    qLastPrice.Close;
    qLastPrice.ParamByName('date_').AsDate := dbdePrihDate.date;
    qLastPrice.Open;
    FTalonPrice.SetPriceValue(qLastPrice,'npgrp_id','price');
  end;
end;
//==============================================================================
procedure TTalonPrihForm.sbPriceClick(Sender: TObject);
begin
  FillPrice;
end;
//==============================================================================
procedure TTalonPrihForm.log(AText:string);
var
  iHour,iMin,iSec,iMSec:Word;
begin
  if SysParamExists('SCANTALON') then
  begin
    DecodeTime(Now,iHour,iMin,iSec,iMSec);
    exfunc.log('ScanTalon.log',format('%d:%d:%d:%d - %s',[iHour,iMin,iSec,iMSec,AText]));
  end;
end;
//==============================================================================
procedure TTalonPrihForm.RunProcessBarCode(AInstr:string);
begin
  if OPER_ID = 216 then
    ProcessBarCode(AInstr,qTalon,toMotionPrihod)
  else ProcessBarCode(AInstr,qTalon,toPrihod);
end;
//==============================================================================
procedure TTalonPrihForm.dsTalonDetailDataChange(Sender: TObject;
  Field: TField);
begin
  dbgTalon.Columns[0].ReadOnly := (dbdePrihDate.Date < qTalonDetail.Fields[1].AsDateTime);
  dbgTalon.Columns[1].ReadOnly := (dbdePrihDate.Date < qTalonDetail.Fields[1].AsDateTime);
  qSum.Close;
  qSum.Open;
end;
//==============================================================================
procedure TTalonPrihForm.FormDestroy(Sender: TObject);
begin
  inherited;
  FTalonPrice.Free;
end;
//==============================================================================
procedure TTalonPrihForm.dbeSrepNumKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['1'..'9',#8]) then key := #0;
end;
//==============================================================================

procedure TTalonPrihForm.miRefreshPriceClick(Sender: TObject);
begin
  inherited;
  TestAllTalon(toPrihod,qTalon);
end;

function TTalonPrihForm.GetDataSet:TDataSet;
begin
  Result := dbceOrgName.DataSource.DataSet;
end;

procedure TTalonPrihForm.AddAdditionInfo(ASer: string; ANum:integer;ADepName:string);
begin
  if not vtAddition.Active then
    vtAddition.Open;
  vtAddition.Filtered := False;
  vtAddition.Filter := 'SER = '''+ASer+''' and NUM = '+IntToStr(ANum);
  vtAddition.Filtered := True;
  if vtAddition.IsEmpty then
    vtAddition.Append
  else
    vtAddition.Edit;
  vtAddition.FieldByName('SER').AsString := ASer;
  vtAddition.FieldByName('NUM').AsInteger := ANum;
  vtAddition.FieldByName('DEP_NAME').AsString := ADepName;
  vtAddition.Post;
  vtAddition.Filtered := False;
end;

end.
