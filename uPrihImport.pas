unit uPrihImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCommonForm, ExcelXP, OleServer, DB, ExtCtrls, MemDS,
  VirtualTable, Grids, DBGridEh, Ora, StdCtrls, Buttons, DBTables, MemTable,
  RXCtrls, Menus, DBAccess, uOilQuery, DBGridEhGrouping, GridsEh;

type
  TPrihImportForm = class(TCommonForm)
    dsExcel: TOraDataSource;
    GroupBox1: TGroupBox;
    pBottom: TPanel;
    pBtn: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    gOil: TDBGridEh;
    GroupBox3: TGroupBox;
    gExcel: TDBGridEh;
    dsOil: TOraDataSource;
    OpenDialog: TOpenDialog;
    mtExcel: TMemoryTable;
    mtExceldate_: TStringField;
    mtExcelttn_num: TStringField;
    mtExcelnp_name: TStringField;
    mtExcellitr: TStringField;
    mtExcelweigth: TStringField;
    mtExceldensity: TStringField;
    mtExceltemperature: TStringField;
    mtExcelazs_name: TStringField;
    mtExcelcustomer: TStringField;
    mtExcelauto: TStringField;
    mtExceldriver: TStringField;
    mtExcelwarrant: TStringField;
    mtExcelwarrant_date: TStringField;
    mtOil: TMemoryTable;
    mtOilttn_num: TStringField;
    mtOilnp_name: TStringField;
    mtOilazs_name: TStringField;
    mtOilauto: TStringField;
    mtOildate_: TDateField;
    mtOilnp_id: TIntegerField;
    mtOilazs_id: TIntegerField;
    mtOilazs_inst: TIntegerField;
    mtOilweigth: TFloatField;
    Splitter1: TSplitter;
    mtOillitr: TFloatField;
    mtOildensity: TFloatField;
    mtOildriver: TStringField;
    mtOilwarant: TStringField;
    mtOilpart_id: TIntegerField;
    mtOilpart_inst: TIntegerField;
    mtOilpart_name: TStringField;
    mtOilrez_id: TIntegerField;
    mtOilrez_inst: TIntegerField;
    mtOilrez_name: TStringField;
    mtOilnb_id: TIntegerField;
    mtOilnb_inst: TIntegerField;
    mtOilnb_name: TStringField;
    mtOildriver_id: TIntegerField;
    mtOildriver_inst: TIntegerField;
    mtOilauto_id: TIntegerField;
    mtOilauto_inst: TIntegerField;
    mtOilwagon_id: TIntegerField;
    pnlExcel: TPanel;
    sbDel: TSpeedButton;
    pmDeleteChoose: TPopupMenu;
    sbDropChoose: TRxSpeedButton;
    bbAdapt: TBitBtn;
    mtOilss: TFloatField;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    qTestReload: TOilQuery;
    mtExcelid: TIntegerField;
    mtOilid: TIntegerField;
    mtOiltemperature: TStringField;
    mtOilsupplier_id: TIntegerField;
    mtOilsupplier_inst: TIntegerField;
    mtOilsupplier_name: TStringField;
    mtOilwarrant_date: TDateField;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure gOilKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gOilCellClick(Column: TColumnEh);
    procedure gExcelCellClick(Column: TColumnEh);
    procedure gExcelKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FLists:     array[1..6] of TStringList;
    FListFiles: array[1..6] of String;
    FNbId, FNbInst, FSupplierId, FSupplierInst: integer;
    FNbName, FSupplierName: string;
    procedure SynchroMove(AMaster, ASlave: TMemoryTable);
    function  GetWagon   (AValue: string; ADate: TDateTime; APartId, APartInst: integer; AWeight: Real): Variant;
    procedure GetNB;
    procedure GetSupplier;
    procedure GetAZS     (AValue: string; var AId, AInst: integer; var AName: string);
    procedure GetNp      (AValue: string; var AId: integer;        var AName: string);
    procedure GetPart    (AValue: string; var AId, AInst: integer; var AName: string);
    procedure GetRez     (AValue: string; var AId, AInst: integer; var AName: string);
    procedure GetAuto    (AValue: string; var AId, AInst: integer; var AName: string);
    procedure GetDriver  (AValue: string; var AId, AInst: integer; var AName: string);
  public
    {Перенос из Excel в MemoryTable}
    procedure MoveExcelToMt(APathFile: string);
    {Проставка соответствий для полей согласно кодам Oil}
    procedure MoveMtToOil;
    {Сохранение конфигурационных данных}
    procedure SaveChoose;
    {Загрузка конфигурационных данных}
    procedure LoadChoose;
    {Удаление конфигурационных данных}
    procedure DeleteChoose(AValue: word);
    {Инизиацлизация формы}
    procedure Init;
    {Сохранение в БД}
    procedure Save;
  end;
  
var
  PrihImportForm: TPrihImportForm;

implementation

{$R *.dfm}
uses
  ActiveX, ComObj, Main, ExFunc, uDbFunc, ChooseOrg, NPTypeRef, RezervRef,
  PartRef, AutoRef, EmpRef, OilStd;
const
  Np = 1;
  AZS = 2;
  Rez = 3;
  Part = 4;
  Auto = 5;
  Driver = 6;

procedure TPrihImportForm.Init;
var
  i: word;
begin
  bbOk.Enabled := False;
  FNbId := -1;
  FSupplierId := -1;
  for i:=low(FLists) to high(FLists) do
    FLists[i] := TStringList.Create;
  FListFiles[Np]:= 'ImportListNpId.cfg';
  FListFiles[AZS]:= 'ImportListAZSId.cfg';
  FListFiles[Rez]:= 'ImportListRezIdInst.cfg';
  FListFiles[Part]:= 'ImportListPartIdInst.cfg';
  FListFiles[Auto]:= 'ImportListAutoIdInst.cfg';
  FListFiles[Driver]:= 'ImportListDriverIdInst.cfg';
  for i:=low(FListFiles) to high(FListFiles) do
    pmDeleteChoose.Items.Items[i-1].Visible := FileExists(GetMainDir+FListFiles[i]);
  LoadChoose;
end;

procedure TPrihImportForm.Save;
var
  prihod_id: integer;
  new_count,retry_count: integer;
begin
  StartSql;
  try
    SaveChoose();

    new_count:=0;
    retry_count:=0;
    mtOil.First;
    while not mtOil.Eof do
    begin
      if (mtOil.FieldByName('part_id').AsInteger <> 0) and (mtOil.FieldByName('part_inst').AsInteger <> 0)
        and (mtOil.FieldByName('rez_id').AsInteger <> 0) and (mtOil.FieldByName('rez_inst').AsInteger <> 0) then
      begin
        (** Проверка на уже созданые приходы *)
        qTestReload.Close;
        _OpenQueryPar(qTestReload,
          ['to_id', mtOil.FieldByName('nb_id').AsInteger,
           'to_inst', mtOil.FieldByName('nb_inst').AsInteger,
           'date_', mtOil.FieldByName('date_').AsDateTime,
           'np_id', mtOil.FieldByName('np_id').AsInteger,
           'part_id', mtOil.FieldByName('part_id').AsInteger,
           'part_inst', mtOil.FieldByName('part_inst').AsInteger,
           'azs_id', mtOil.FieldByName('azs_id').AsInteger,
           'azs_inst', mtOil.FieldByName('azs_inst').AsInteger,
           'count_', mtOil.FieldByName('weigth').AsFloat/1000]);
        if qTestReload.FieldByName('cnt').AsInteger > 0 then
        begin
          retry_count:=retry_count+1;
          mtOil.Next;
          Continue;
        end;
        new_count := new_count + 1;

        (** Сохранение приходов*)
        prihod_id := DBSaver.SaveRecord('OIL_PRIHOD',
          ['ID',          GetSeqNextVal('S_OIL_PRIH'),
           'STATE',       'Y',
           'INST',        MAIN_ORG.INST,
           'EMP_ID',      EMP_ID,
           'EMP_INST',    EMP_ID,
           'DATE_',       mtOil.FieldByName('date_').AsDateTime,
           'DATE_DOC',    mtOil.FieldByName('date_').AsDateTime,
           'DATE_DOC_RAIL',mtOil.FieldByName('date_').AsDateTime,
           'OPER_ID',     1, {Приход собственого товара}
           'PART_ID',     mtOil.FieldByName('part_id').AsInteger,
           'PART_INST',   mtOil.FieldByName('part_inst').AsInteger,
           'DATE_OTPR',   mtOil.FieldByName('date_').AsDateTime,
           'DOST',        3, {Автоцистерна}
           'RAIL_ST',     null,
           'RAIL_INST',   null,
           'NP_TYPE',     mtOil.FieldByName('np_id').AsInteger,
           'FROM_',       mtOil.FieldByName('supplier_id').AsInteger,
           'FROM_INST',   mtOil.FieldByName('supplier_inst').AsInteger,
           'TO_',         mtOil.FieldByName('nb_id').AsInteger,
           'TO_INST',     mtOil.FieldByName('nb_inst').AsInteger,
           'DOG',         null,
           'DOG_INST',    null,
           'POST_RN_NUM', null,
           'POST_NN_NUM', null,
           'TEMP_AVG',    null,
           'NUMBER_DOC',  null,
           'DAYS_ON_WAY', 1
           ]);

        (** сохраненние детализации *)
        DBSaver.SaveRecord('OIL_PRIH_DET',
          ['STATE',                 'Y',
           'INST',                  MAIN_ORG.INST,
           'PRIHOD_ID',             prihod_id,
           'NAKL',                  mtOil.FieldByName('ttn_num').AsString,
           'TANK',                  BoolTo_(mtOil.FieldByName('wagon_id').Value = 0, mtOil.FieldByName('auto_name').AsString,null),
           'TANK_TYPE',             null,
           'DOC_COUNT',             mtOil.FieldByName('weigth').AsFloat/1000,
           'FACT_COUNT',            mtOil.FieldByName('weigth').AsFloat/1000,
           'NED_NORM_UB',           0,
           'NED_NORM_ER',           0,
           'NED_POST',              0,
           'NED_RAIL',              0,
           'IZL_NORM',              0,
           'IZL_POST',              0,
           'IS_DIGITAL_WEIGHT',     1,
           'TECH_LOSS',             0,
           'REZ',                   mtOil.FieldByName('rez_id').AsInteger,
           'REZ_INST',              mtOil.FieldByName('rez_inst').AsInteger,
           'WAGON_ID',              BoolTo_(mtOil.FieldByName('wagon_id').Value = 0, null, mtOil.FieldByName('wagon_id').AsInteger)
          ]);

        (** Сохранение расходов *)
        DBSaver.SaveRecord('OIL_RASHOD',
          ['ID', GetSeqNextVal('S_OIL_RASH'),
           'INST', MAIN_ORG.INST,
           'STATE', 'Y',
           'EMP_ID', EMP_ID,
           'DATE_', mtOil.FieldByName('date_').AsDateTime,
           'FROM_ID',   mtOil.FieldByName('nb_id').AsInteger,
           'FROM_INST', mtOil.FieldByName('nb_inst').AsInteger,
           'TO_ID', mtOil.FieldByName('azs_id').AsInteger,
           'TO_INST', mtOil.FieldByName('azs_inst').AsInteger,
           'OPER_ID', 10,
           'TTN_NUM', mtOil.FieldByName('ttn_num').AsString,
           'TTN_DATE', mtOil.FieldByName('date_').AsDateTime,
           'DOV_SERIAL', null,
           'DOV_NUM', mtOil.FieldByName('warrant').Value,
           'DOV_DATE', BoolTo_(mtOil.FieldByName('warrant_date').Value = 0, null, mtOil.FieldByName('warrant_date').AsDateTime),
           'DOV_GIVE', BoolTo_(mtOil.FieldByName('warrant').Value = '', null, mtOil.FieldByName('driver_name').AsString),
           'AUTO_ID',   mtOil.FieldByName('auto_id').AsInteger,
           'AUTO_INST', mtOil.FieldByName('auto_inst').AsInteger,
           'EMPLOY_ID',   mtOil.FieldByName('driver_id').AsInteger,
           'EMPLOY_INST', mtOil.FieldByName('driver_inst').AsInteger,
           'PART_ID',   mtOil.FieldByName('part_id').AsInteger,
           'PART_INST', mtOil.FieldByName('part_inst').AsInteger,
           'TEMPER', mtOil.FieldByName('temperature').AsString,
           'UD_WEIG', mtOil.FieldByName('density').AsFloat,
           'LITR', mtOil.FieldByName('litr').AsInteger,
           'COUNT_', mtOil.FieldByName('weigth').AsInteger/1000,
           'PRICE', mtOil.FieldByName('ss').AsFloat,
           'SUMMA', (MRound(mtOil.FieldByName('weigth').AsInteger/1000*mtOil.FieldByName('ss').AsFloat,2)),
           'CERT_ID', null,
           'PACK', TranslateText('Бензовоз'),
           'INCL_DEBET', 'Y',
           'RASCH_TYPE', null,
           'SBOR_POST', 'N',
           'SBOR_NAC', 'N',
           'SBOR_NDS', 'N',
           'UCH_PRICE', 'Y',
           'OWN_GOOD', 'N',
           'NN_ID', null,
           'NN_INST', null,
           'REZ', mtOil.FieldByName('rez_id').AsInteger,
           'REZ_INST', mtOil.FieldByName('rez_inst').AsInteger,
           'COMM', null,
           'PRIH', null,
           'PRIH_INST', null,
           'DOG', null,
           'DOG_INST', null,
           'R_FROM_', null,
           'R_FROM_INST', null,
           'R_TO_', null,
           'R_TO_INST', null,
           'USER_ID', SUPER_REAL_EMP_ID]);
      end;
      mtOil.Next;
    end; // while not mtOil.Eof do
    CommitSql;
    MessageDlg(TranslateText('Повторы: ')+IntToStr(retry_count)+#10#13+
    TranslateText('Новые записи: ')+IntToStr(new_count), mtInformation, [mbOk], 0);
  except on E:Exception do
    begin
      RollbackSQL;
      raise Exception.Create('Save: '+ E.Message);
    end;
  end;
end;

procedure TPrihImportForm.SaveChoose;
var
  i: integer;
begin
  for i:=low(FLists) to high(FLists) do
    FLists[i].SaveToFile(GetMainDir+FListFiles[i]);
end;

procedure TPrihImportForm.LoadChoose;
var
  i: integer;
begin
  for i:=low(FLists) to high(FLists) do
    if FileExists(GetMainDir+FListFiles[i]) then
      FLists[i].LoadFromFile(GetMainDir+FListFiles[i]);
end;

procedure TPrihImportForm.DeleteChoose(AValue: word);
var
  i: integer;
begin
  if AValue < 1 then
  begin
    for i:=low(FLists) to high(FLists) do
      DeleteChoose(i);
  end
  else if FileExists(GetMainDir+FListFiles[AValue]) then
  begin
    DeleteFile(GetMainDir+FListFiles[AValue]);
    FLists[AValue].Clear;
  end;
end;

procedure TPrihImportForm.MoveExcelToMt(APathFile: string);
const
  ColumnsCaption: array[1..13] of string = ('Дата', '№ ТТН', 'Наименование',
    'Объем, л', 'Масса, кг', 'Плотность по док', 'Темпер. по док', 'Получатель АЗС',
    'Заказчик', 'Автомобиль', 'Водитель', '№ доверенности', 'Дата доверенности');
  ColumnsName: array[1..13] of string = ('date_', 'ttn_num', 'np_name',
    'litr', 'weigth', 'density', 'temperature', 'azs_name',
    'customer', 'auto', 'driver', 'warrant', 'warrant_date');
var
  Unknown: iUnknown;
  Eof: boolean;
  Row, Column: integer;
begin
  try
    if Succeeded(GetActiveObject(ProgIDToClassID('Excel.Application'), nil, Unknown)) then
      MsExcel := GetActiveOleObject('Excel.Application')
    else
      MsExcel := CreateOleObject('Excel.Application');

    MsExcel.Workbooks.Add(APathFile);
    List:=MsExcel.ActiveWorkBook.ActiveSheet;
    Eof := false;
    Row := 2;
    mtExcel.Open;
    while not Eof do
    begin
      if VarAsType(List.Cells[Row,1].Value, varString) = '' then
      begin
        Eof := true;
        continue;
      end;
      mtExcel.Append;
      for Column := low(ColumnsName) to high(ColumnsName) do
        mtExcel.FieldByName(ColumnsName[Column]).AsString := List.Cells[Row,Column];
      mtExcel['id'] := Row;
      mtExcel.Post;
      inc(Row);
    end;
    MsExcel := UnAssigned;
    Application.ProcessMessages;
  except on E:Exception do
    begin
      raise Exception.Create('MoveExcelToMt: '+E.Message);
      ModalResult := mrCancel;
    end;
  end;
end;

procedure TPrihImportForm.MoveMtToOil;
var
  id, inst: integer;
  name: string;
  qPart, qRez: TOilQuery;
begin
  if not mtExcel.IsEmpty then
  begin
    mtOil.Open;
    mtOil.EmptyTable;
    mtExcel.First;
    GetNB;
    GetSupplier;
    qPart := TOilQuery.Create(nil);
    qRez  := TOilQuery.Create(nil);
    mtOil.DisableControls;
    try
      while not mtExcel.Eof do
      begin
        mtOil.Append;
        mtOil.FieldByName('supplier_id').AsInteger   := FSupplierId;
        mtOil.FieldByName('supplier_inst').AsInteger := FSupplierInst;
        mtOil.FieldByName('supplier_name').AsString  := FSupplierName;

        mtOil.FieldByName('nb_id').AsInteger   := FNbId;
        mtOil.FieldByName('nb_inst').AsInteger := FNbInst;
        mtOil.FieldByName('nb_name').AsString  := FNbName;

        mtOil.FieldByName('date_').AsDateTime := StrToDate(mtExcel.FieldByName('date_').AsString);
        mtOil.FieldByName('weigth').AsInteger := StrToInt(mtExcel.FieldByName('weigth').AsString);
        // Товар
        GetNp(mtExcel['np_name'], id, name);
        mtOil.FieldByName('np_id').AsInteger := id;
        mtOil.FieldByName('np_name').AsString := name;

        // знаходимо партію
        //----------------------------------------------------------------------
        qPart.SQL.Text :=
          'select id, inst, dog as name, ss from oil_part' +
          ' where state = ''Y'' and np_type = :np_id' +
          ' order by id desc';
        _OpenQueryParOra(qPart, ['np_id', id]);
        if not qPart.IsEmpty then
        begin
          mtOil.FieldByName('part_id').AsInteger   := qPart.FieldByName('id').AsInteger;
          mtOil.FieldByName('part_inst').AsInteger := qPart.FieldByName('inst').AsInteger;
          mtOil.FieldByName('part_name').AsString  := qPart.FieldByName('name').AsString;
          mtOil.FieldByName('ss').AsFloat          := qPart.FieldByName('ss').AsFloat;
        end
        else
        begin // знаходимо партію із найменшим ід по даній групі
          qPart.SQL.Text :=
          'select min(p.np_type) as np_id, min(p.id) as id, p.inst,' +
          '       p.dog as name, p.ss, np.grp_id' +
          '  from oil_part p, oil_np_type np' +
          ' where p.state = ''Y''' +
          '   and p.np_type = np.id' +
          '   and np.grp_id in (select grp_id from oil_np_type where id = :np_id)' +
          ' group by p.inst, np.grp_id, p.dog, p.ss' +
          ' order by id';
          _OpenQueryParOra(qPart, ['np_id', id]);
          mtOil.FieldByName('part_id').AsInteger   := qPart.FieldByName('id').AsInteger;
          mtOil.FieldByName('part_inst').AsInteger := qPart.FieldByName('inst').AsInteger;
          mtOil.FieldByName('part_name').AsString  := qPart.FieldByName('name').AsString;
          mtOil.FieldByName('ss').AsFloat          := qPart.FieldByName('ss').AsFloat;
        end;
        //----------------------------------------------------------------------

        // знаходимо резервуар
        //----------------------------------------------------------------------
        qRez.SQL.Text :=
          'select rez, rez_inst from oil_rashod' +
          ' where state = ''Y''' +
          '   and part_id = :part_id and part_inst = :part_inst' +
          ' order by id desc';
        _OpenQueryParOra(qRez,
          ['part_id',   mtOil.FieldByName('part_id').AsInteger,
           'part_inst', mtOil.FieldByName('part_inst').AsInteger]);
        if not qRez.IsEmpty then
        begin
          mtOil.FieldByName('rez_id').AsInteger   := qRez.FieldByName('rez').AsInteger;
          mtOil.FieldByName('rez_inst').AsInteger := qRez.FieldByName('rez_inst').AsInteger;
          mtOil.FieldByName('rez_name').AsString  :=
            nvl(GetQValueByIdInst('num', 'oil_rezervuar',
              qRez.FieldByName('rez').AsInteger, qRez.FieldByName('rez_inst').AsInteger), '');;
        end
        else
        begin // знаходимо партію із найменшим ід по даній групі
          qRez.SQL.Text :=
            'select min(r.id) as id, r.name, r.inst, np.grp_id'+
            '  from oil_rezervuar r, oil_np_type np'+
            ' where r.state = ''Y''' +
            '   and r.np_type_id = np.id' +
            '   and r.inst = ov.GetVal(''INST'')' +
            '   and np.grp_id in (select grp_id from oil_np_type where id = :np_id)' +
            ' group by r.inst, np.grp_id, r.name' +
            ' order by inst';
          _OpenQueryParOra(qRez, ['np_id', id]);
          mtOil.FieldByName('rez_id').AsInteger   := qRez.FieldByName('id').AsInteger;
          mtOil.FieldByName('rez_inst').AsInteger := qRez.FieldByName('inst').AsInteger;
          mtOil.FieldByName('rez_name').AsString  := qRez.FieldByName('name').AsString;
        end;
        //----------------------------------------------------------------------

        {
        // Партия
        GetPart(mtExcel['np_name'], id, inst, name);
        mtOil.FieldByName('part_id').AsInteger := id;
        mtOil.FieldByName('part_inst').AsInteger := inst;
        mtOil.FieldByName('part_name').AsString := name;
        mtOil.FieldByName('ss').AsFloat := GetSqlValueParSimple('select ss from oil_part where id=:id and inst=:inst',
          ['id',  id,
           'inst',inst]);

        // Резервуар
        GetRez(mtExcel['np_name'], id, inst, name);
        mtOil.FieldByName('rez_id').AsInteger := id;
        mtOil.FieldByName('rez_inst').AsInteger := inst;
        mtOil.FieldByName('rez_name').AsString := name;
        }

        // АЗС
        GetAzs(mtExcel['azs_name'], id, inst, name);
        mtOil.FieldByName('azs_id').AsInteger := id;
        mtOil.FieldByName('azs_inst').AsInteger := inst;
        mtOil.FieldByName('azs_name').AsString := name;

        // Автомобиль/Вагон
        GetAuto(mtExcel.FieldByName('auto').AsString, id, inst, name);
        mtOil.FieldByName('auto_name').AsString := mtExcel.FieldByName('auto').AsString;
        mtOil.FieldByName('auto_id').AsInteger := id;
        mtOil.FieldByName('auto_inst').AsInteger := inst;
        mtOil.FieldByName('wagon_id').Value := GetWagon(mtExcel.FieldByName('auto').AsString,
          mtOil.FieldByName('date_').AsDateTime,
          mtOil.FieldByName('part_id').AsInteger, mtOil.FieldByName('part_inst').AsInteger,
          mtOil.FieldByName('weigth').AsInteger/1000);

        // Водитель
        GetDriver(mtExcel.FieldByName('driver').AsString, id, inst, name);
        mtOil.FieldByName('driver_id').AsInteger := id;
        mtOil.FieldByName('driver_inst').AsInteger := inst;
        mtOil.FieldByName('driver_name').AsString := name;

        // Все остальное
        mtOil.FieldByName('ttn_num').AsString := mtExcel.FieldByName('ttn_num').AsString;
        mtOil.FieldByName('litr').AsFloat := StrToFloat(mtExcel.FieldByName('litr').AsString);
        mtOil.FieldByName('density').AsFloat := StrToFloat(mtExcel.FieldByName('density').AsString);
        mtOil.FieldByName('warrant').AsString := mtExcel.FieldByName('warrant').AsString;
        if mtExcel.FieldByName('warrant_date').AsString = '' then
          mtOil.FieldByName('warrant_date').Value := 0
        else
          mtOil.FieldByName('warrant_date').AsDateTime := StrToDate(mtExcel.FieldByName('warrant_date').AsString);
        mtOil.FieldByName('temperature').AsString := mtExcel.FieldByName('temperature').AsString;

        mtOil.FieldByName('id').AsInteger := mtExcel.FieldByName('id').AsInteger;
        mtOil.Post;
        mtExcel.Next;
      end;
    finally
      mtOil.EnableControls;
    end;
  end;
  qPart.Free;
  qRez.Free;
end;

procedure TPrihImportForm.GetNB;
begin
  try
    if FNbId = -1 then
    begin
      ShowMessage('Выберите НБ заказчика');
      if not ChooseOrg.CaptureOrg(1,Main_id,Inst,'yyx',FNbId,FNbInst,FNbName) then
        GetNB;
    end;
  except on E: Exception do
    raise Exception.Create('GetNB :'+E.Message);
  end
end;

procedure TPrihImportForm.GetSupplier;
begin
  try
    if FSupplierId = -1 then
    begin
      ShowMessage('Выберите поставщика');
      if not ChooseOrg.CaptureOrg(1,Main_id,Inst,'yyy',FSupplierId,FSupplierInst,FSupplierName) then
        GetSupplier;
    end;
  except on E: Exception do
    raise Exception.Create('GetSupplier :'+E.Message);
  end
end;

procedure TPrihImportForm.GetAZS(AValue: string; var AId, AInst:integer; var AName: string);
var
  num: integer;
begin
  try
    AId := -1;
    if (FLists[AZS].Values[AValue] <> '') then {Выбор из сохраненных}
    begin
      AId := StrToInt(FLists[AZS].Values[AValue]);
      AInst := AId;
      AName := GetOrgName(AId,AInst);
    end;
    if AId = -1 then
      if TryStrToInt(AValue, Num) then {Исчем по номеру}
      begin
        AId := nvl(GetSqlValueParSimple('select id from v_oil_azs where azs_num = :azs_num and par = :par and par_inst = :par_inst',
          ['azs_num',  Num,
           'par',      Main_id,
           'par_inst', Main_id]), -1);
        AInst := AId;
        AName := GetOrgName(AId,AInst);
      end;
    if AId = -1 then {Даем выбор АЗС}
    begin
      ShowMessage('Сделайте выбор АЗС для значения '+AValue);
      ChooseOrg.CaptureOrg(2, MAIN_ID, INST, 'yyy', AId, AInst, AName);
      {Сохраняем выбор}
      FLists[AZS].Values[AValue] := IntToStr(AId);
    end;
    if AId = -1 then
      raise Exception.Create('Не выбрана АЗС для значения '+AValue);
  except on E:Exception do
    raise Exception.Create('GetAZS :'+E.Message);
  end
end;

procedure TPrihImportForm.GetNp(AValue: string; var AId: integer; var AName: string);
begin
  try
    AId := -1;
    if FLists[Np].Values[AValue] <> '' then {Выбор из сохраненных}
      AId := StrToInt(FLists[Np].Values[AValue]);
    if AId = -1 then {Даем выбор}
    begin
      ShowMessage('Сделайте выбор товара для значения '+AValue);
      if TNPTypeRefForm.Choose(AId, AName) then {Сохраняем выбор}
        FLists[Np].Values[AValue] := IntToStr(AId);
    end;
    if AId = -1 then
      raise Exception.Create('Не выбран НП для значения '+AValue)
    else
      AName := GetSqlValueParSimple('select name from v_oil_np_type where id = :id',
        ['id',AId]);
  except on E:Exception do
    raise Exception.Create('GetNp :'+E.Message);
  end
end;

procedure TPrihImportForm.GetPart(AValue: string; var AId, AInst: integer; var AName: string);
var
  PartRefForm: TPartRefForm;
  Value, vname: string;
  vid: integer;
begin
  try
    AId := -1;
    if FLists[Part].Values[AValue] <> '' then {Выбор из сохраненных}
    begin
      Value := FLists[Part].Values[AValue];
      AId := StrToInt(Copy(Value, 0, pos(';',Value)-1));
      AInst := StrToInt(Copy(Value, pos(';',Value)+1, length(Value)));
      AName := GetSqlValueParSimple('select dog from oil_part where id = :id and inst = :inst',
        ['id', AId,
         'inst', AInst]);
    end;  
    if AId = -1 then {Даем выбор}
    begin
      Application.CreateForm(TPartRefForm, PartRefForm);
      try
        GetNp(AValue, vId, vName);
        PartRefForm.edNP_Type.Tag := vId;
        PartRefForm.edNP_Type.Text := vName;
        PartRefForm.edNP_Type.Enabled := False;
        PartRefForm.Tag:=10;
               { это магическое присвоение нужно, чтобы при открытии ен появилась
                 птичка "остаток от 0.000001"
                 так сделано в справочнике партий, на фига - не знаю :-((
                 Copyright PrihSop.pas(775)
               }
        If PartRefForm.ShowModal = mrOk Then
        Begin
          AId := PartRefForm.qId.AsInteger;
          AInst := PartRefForm.qInst.AsInteger;
          AName := PartRefForm.qDOG.AsString;
          {Сохраняем выбор}
          FLists[Part].Values[AValue] := IntToStr(AId)+';'+IntToStr(AInst);
        End;
      finally
        PartRefForm.Free;
      end;
    end;
    if AId = -1 then
      raise Exception.Create('Не выбрана партия для значения '+AValue);
  except on E:Exception do
    raise Exception.Create('GetPart :'+E.Message);
  end
end;

procedure TPrihImportForm.GetRez(AValue: string; var AId, AInst: integer; var AName: string);
var
  F: TRezervRefForm;
  Value, vName: string;
  vId: integer;
begin
  try
    AId := -1;
    if FLists[Rez].Values[AValue] <> '' then
    begin
      Value := FLists[Rez].Values[AValue];
      AId := StrToInt(Copy(Value, 0, pos(';',Value)-1));
      AInst := StrToInt(Copy(Value, pos(';',Value)+1, length(Value)));
      AName := GetSqlValueParSimple('select name from oil_rezervuar where id = :id and inst = :inst',
        ['id', AId,
         'inst', AInst]);
    end;
    if AId = -1 then
    begin
      Application.CreateForm(TRezervRefForm, F);
      try
        F.cbReal.Checked := False;
        F.cbElev.Checked := False;
        F.cbVirt.Checked := True;
        GetNp(AValue, vId, vName);
        F.ceNpType.Tag := vId;
        F.ceNpType.Text := vName;
        F.ceNpType.Enabled := False;
        F.OrgId := FNbId; F.OrgInst := FNbInst;
        F.cbOrg.Text := GetOrgName(FNbId, FNbInst);
        F.gbClass.Enabled := False;
        F.bbOk.Visible := True;
        F.ActivateQ(nil);
        if F.ShowModal = mrOk then
        begin
          AName := F.q.FieldByName('name').AsString;
          AId := F.q.FieldByName('id').AsInteger;
          AInst := F.q.FieldByName('inst').AsInteger;
          FLists[Rez].Values[AValue] := IntToStr(AId)+';'+IntToStr(AInst);
        end;
      finally
        F.Free;
      end;
    end;
    if AId = -1 then
      raise Exception.Create('Не выбран резервуар для значения '+ AValue);
  except on E:Exception do
    raise Exception.Create('GetRez :'+E.Message);
  end
end;

procedure TPrihImportForm.GetAuto(AValue: string; var AId, AInst: integer; var AName: string);
var
  AutoRefForm: TAutoRefForm;
  Value: string;
begin
  try
    AId := -1;
    if FLists[Auto].Values[AValue] <> '' then {Выбор из сохраненных}
    begin
      Value := FLists[Auto].Values[AValue];
      AId := StrToInt(Copy(Value, 0, pos(';',Value)-1));
      AInst := StrToInt(Copy(Value, pos(';',Value)+1, length(Value)));
      AName := nvl(GetSqlValueParSimple('select auto_model||'' ''||numb from oil_auto where id = :id and inst = :inst',
        ['id', AId,
         'inst', AInst]), '');
    end;  
    if AId = -1 then {Даем выбор}
    begin
      ShowMessage('Сделайте выбор авто для значения '+AValue);
      Application.CreateForm(TAutoRefForm, AutoRefForm);
      try
        AutoRefForm.edNumb.Text := AValue;
        AutoRefForm.ShowModal;
        if AutoRefForm.ModalResult = mrOk Then
        begin
          AName := AutoRefForm.qAUTO_MODEL.AsString +' '+ AutoRefForm.qNumb.AsString;
          AId := AutoRefForm.qId.AsInteger;
          AInst := AutoRefForm.qInst.AsInteger;
          {Сохраняем выбор}
          FLists[Auto].Values[AValue] := IntToStr(AId)+';'+IntToStr(AInst);        
        end;
      finally
        AutoRefForm.Free;
      end;
    end;
    if AId = -1 then
      raise Exception.Create('Не выбрано авто для значения '+AValue);
  except on E:Exception do
    raise Exception.Create('GetAuto :'+E.Message);
  end
end;

function TPrihImportForm.GetWagon(AValue: string; ADate: TDateTime; APartId, APartInst: integer; AWeight: Real):Variant;
begin
  try
    Result := nvl(GetSqlValueParSimple('select min(id) from oil_wagons w '
      +' where w.state = ''Y'' '
      +'   and w.part_id = :part_id and w.part_inst = :part_inst '
      +'   and w.date_rast = :date_ '
      +'   and w.weight = :weight '
      +'   and upper(replace(translate(w.name,'';/*-+/.,- '',''         ''),'' '')) = '
      +'       upper(replace(translate(:name,'';/*-+/.,- '',''         ''),'' ''))  ',
      ['part_id', APartId,
       'part_inst', APartInst,
       'date_', ADate,
       'name', AValue,
       'weight', AWeight]),null);
  except on E:Exception do
    raise Exception.Create('GetWagon :'+E.Message);
  end
end;

procedure TPrihImportForm.GetDriver(AValue: string; var AId, AInst: integer; var AName: string);
var
  EmpRefForm: TEmpRefForm;
  Value: string;
begin
  try
    AId := -1;
    if FLists[Driver].Values[AValue] <> '' then {Выбор из сохраненных}
    begin
      Value := FLists[Driver].Values[AValue];
      AId := StrToInt(Copy(Value, 0, pos(';',Value)-1));
      AInst := StrToInt(Copy(Value, pos(';',Value)+1, length(Value)));
      AName := GetSqlValueParSimple('select emp.F_NAME||'' ''||DECODE(SUBSTR(emp.I_NAME, 1, 1), '' '', '''', ''_'', '''', SUBSTR(emp.I_NAME, 1, 1)||''.'')||DECODE(SUBSTR(emp.O_NAME, 1, 1), '' '', '''', ''_'', '''', SUBSTR(emp.O_NAME, 1, 1)||''.'') '
      +' from oil_employ emp where id = :id and inst = :inst',
        ['id', AId,
         'inst', AInst]);
    end;  
    if AId = -1 then {Даем выбор}
    begin
      ShowMessage('Сделайте выбор водителя для значения '+AValue);
      Application.CreateForm(TEmpRefForm, EmpRefForm);
      try
        if pos(' ',AValue)>0 then
          EmpRefForm.eSurName.Text := copy(AValue, 1, pos(' ',AValue)-1)
        else
          EmpRefForm.eSurName.Text := AValue;
        EmpRefForm.ShowModal;
        if EmpRefForm.ModalResult = mrOk then
        begin
          AId := EmpRefForm.qID.AsInteger;
          AInst  := EmpRefForm.qInst.AsInteger;
          AName := EmpRefForm.qF_NAME.AsString;
          if not(EmpRefForm.qI_NAME.AsString[1] in [' ', '_'])
            then AName := AName + ' ' + EmpRefForm.qI_NAME.AsString[1] + '.';
          if not(EmpRefForm.qO_NAME.AsString[1] in [' ', '_'])
            then AName := AName + ' ' + EmpRefForm.qO_NAME.AsString[1] + '.';
          {Сохраняем выбор}
          FLists[Driver].Values[AValue] := IntToStr(AId)+';'+IntToStr(AInst);
        end;
      finally
        EmpRefForm.Free;
      end;
    end;
    if AId = -1 then
      raise Exception.Create('Не выбран водитель для значения '+AValue);
  except on E:Exception do
    raise Exception.Create('GetWagon :'+E.Message);
  end
end;

procedure TPrihImportForm.SynchroMove(AMaster, ASlave:TMemoryTable);
begin
  if (AMaster.Active) and (ASlave.Active) then
    if (AMaster.RecordCount = ASlave.RecordCount) then
      ASlave.Locate('id', AMaster['id'], []);
end;

procedure TPrihImportForm.FormShow(Sender: TObject);
begin
  inherited;
  OpenDialog.InitialDir := GetMainDir;
  If OpenDialog.Execute then
    MoveExcelToMt(OpenDialog.FileName)
  else
    ModalResult := mrCancel;
end;

procedure TPrihImportForm.Button1Click(Sender: TObject);
begin
  inherited;
  MoveMtToOil();
  bbOk.Enabled := True;
end;

procedure TPrihImportForm.FormCreate(Sender: TObject);
begin
  inherited;
  Init;
end;

procedure TPrihImportForm.FormDestroy(Sender: TObject);
var
  i: integer;
begin
  inherited;
  for i:= low(FLists) to high(FLists) do
    FLists[i].Free;
end;

procedure TPrihImportForm.bbOkClick(Sender: TObject);
begin
  inherited;
  Save();
  ModalResult := mrOk;
end;

procedure TPrihImportForm.sbDelClick(Sender: TObject);
begin
  inherited;
  if not mtExcel.IsEmpty then
    mtExcel.Delete;
end;

procedure TPrihImportForm.N1Click(Sender: TObject);
var
  i: Word;
begin
  inherited;
  if MessageDlg(TranslateText('Вы уверены, что хотите удалить результат сделанного ранее вами выбора?'),
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DeleteChoose(TMenuItem(Sender).MenuIndex+1);
    for i:=low(FListFiles) to high(FListFiles) do
      pmDeleteChoose.Items.Items[i-1].Visible := FileExists(GetMainDir+FListFiles[i]);
  end;
end;

procedure TPrihImportForm.gOilKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  SynchroMove(mtOil, mtExcel);
end;

procedure TPrihImportForm.gOilCellClick(Column: TColumnEh);
begin
  inherited;
  SynchroMove(mtOil, mtExcel);
end;

procedure TPrihImportForm.gExcelCellClick(Column: TColumnEh);
begin
  inherited;
  SynchroMove(mtExcel, mtOil);
end;

procedure TPrihImportForm.gExcelKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  SynchroMove(mtExcel, mtOil);
end;

end.
