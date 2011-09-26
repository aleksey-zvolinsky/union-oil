unit ImportCashtan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCommonForm, StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls, DB,
  DBTables, ComCtrls, MemDS, DBAccess, Ora, Math, uImportFunc;

type
  TImportType = (itRest, itComing, itMotion, itSelling, itPrice, itReturn);

  TDateNp=record
    Date: TDateTime;
    NpId: integer;
  end;
  
  TImportCashtanForm = class(TCommonForm)
    gbChooseFile: TGroupBox;
    FilenameEdit: TFilenameEdit;
    pBottom: TPanel;
    pBtn: TPanel;
    bbCancel: TBitBtn;
    bbOk: TBitBtn;
    qDBF: TQuery;
    ProgressBar: TProgressBar;
    gbChoose: TGroupBox;
    rbRest: TRadioButton;
    rbComing: TRadioButton;
    rbMotion: TRadioButton;
    rbSelling: TRadioButton;
    sbLog: TSpeedButton;
    rbPrice: TRadioButton;
    qPrices: TOraQuery;
    qGoods: TOraQuery;
    rbReturn: TRadioButton;
    qTestReload: TOraQuery;
    qRest: TOraQuery;
    edTo: TComboEdit;
    sbClearTo: TSpeedButton;
    lTo: TLabel;
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbLogClick(Sender: TObject);
    procedure sbClearToClick(Sender: TObject);
    procedure edToButtonClick(Sender: TObject);
  private
    FLog, FAZSList, FAZSStartDateList: TStringList;
    FInst, FAzsId: integer;
                               
    procedure Log(AText: string);
    procedure Import(AFilePath: string; AImportType: TImportType);
    // Вспомогательные функции для Импорта
    function GetImportType: TImportType;
    procedure SetImportType(AValue: TImportType);
    procedure SetAzsId(AValue: integer);
    function GetRezKey: TPrimaryKey;
    function GetPartKey(ANpId: integer): TPrimaryKey;
    function GetNpId(ANp1C: integer; ANpNNB: integer): integer;
    function GetAZSId(AAzsName: string):integer;
    function GetTypeName(AImportType: TImportType): string;
    function GetStartDate(AAzsId: integer): TDateTime;
    procedure SavePrih(AFromId, AFromInst, AToId, AToInst, APartId, APartInst,
      ARezId, ARezInst, ANpId, AGroupNum, AOperId: integer; ADate: TDateTime; ADocNumber: string;
      ACount: Currency);
    function SaveRash(AFromId, AFromInst, AToId, AToInst, APartId, APartInst,
      ARezId, ARezInst, ANpId, AGroupNum, AOperId: integer; ADate: TDateTime; ADocNumber: string;
      ACount, APrice: Currency): TPrimaryKey;
  public
    property ImportType: TImportType read GetImportType write SetImportType;
    property AzsId: integer read FAzsId write SetAzsId;
  end;

var
  ImportCashtanForm: TImportCashtanForm;

implementation

uses UDbFunc, ExFunc, Main, OilStd, Memo, SRepAutoLoad, ChooseOrg;

procedure TImportCashtanForm.Log(AText: string);
var
  str: string;
begin
  str := FormatDateTime('dd.mm.yyyy hh:nn:ss: ',Now()) + AText;
  FLog.Add(str);
  ExFunc.log(GetMainDir+'ImportCashtan_'+FormatDateTime('yyyy-mm-dd', Now())+'.log', str);
end;

procedure TImportCashtanForm.Import(AFilePath: string; AImportType: TImportType);
var
  vPrice, vCount: Currency;
  vNpId, vAzsId,
  vGroupNumPrih, vGroupNumRash,
  vDailyRepPrihId, vDailyRepRashId: integer;
  vAllCount, vProcessedCount: integer;
  vRez, vPart, vRestPart, vRash: TPrimaryKey;
  vDocNum: string;
  vDate, vStartDate, vLastRepDate: TDateTime;
  slNpPrice: TStringList;
  NeedSave: boolean;
begin
  try
    vAllCount := 0;
    vProcessedCount := 0;
    FAZSList.Clear;
    log('');
    log(format('Начата загрузка файла %s, с типом %s.',[AFilePath, GetTypeName(AImportType)]));
    slNpPrice := TStringList.Create;
    try
      try
        vRez := GetRezKey;
        FInst := MAIN_ORG.Inst;
        qDBF.Close;
        case AImportType of
          itRest:
            qDBF.SQL.Text := Format('select * from "%s" where oper_type = 0 order by rep_date, DOK_N', [AFilePath]);
          itMotion:
            qDBF.SQL.Text := Format('select * from "%s" where oper_type = 2 order by rep_date, DOK_N', [AFilePath]);
          itReturn:
            qDBF.SQL.Text := Format('select * from "%s" where oper_type = 5 order by rep_date, DOK_N', [AFilePath]);
          itPrice:
          begin
            qDBF.SQL.Text := Format('select * from "%s" where oper_type in (0,2) order by rep_date desc, DOK_N', [AFilePath]);
            qPrices.Open;
          end;
          else
            raise Exception.CreateFmt('Import: Невозможный тип загрузки - %s!',[GetTypeName(AImportType)]);
        end;
        qDBF.Open;
        log(format('Открыт файл с %d записей', [qDBF.RecordCount]));
        if qDBF.RecordCount = 0 then
          ShowMessage('По даному условию не найдено ни одной записи!');
        ProgressBar.Max := qDBF.RecordCount;
        ProgressBar.Step := 1;
        StartSQL;
        vDate := 0; vDocNum := '0';
        vGroupNumPrih := 0; vGroupNumRash := 0;
        vDailyRepRashId := 0; vDailyRepPrihId := 0;
        while not qDBF.Eof do
        begin
          inc(vAllCount);
          ProgressBar.StepIt;
          Self.Repaint;
          vNpId := GetNpId(qDBF.FieldByName('NP_1C').AsInteger, qDBF.FieldByName('NP_NNB').AsInteger);
          case AImportType of
            itPrice:
            begin
              // Проверки на соотвкетствие цен в БД и в ДБФ
              qPrices.Filtered := False;
              qPrices.Filter := Format('np_id = %d',[vNpId]);
              qPrices.Filtered := True;
              if qPrices.IsEmpty then
              {Цены нету совсем}
                NeedSave := True
              else if (qPrices.FieldByName('price').AsCurrency <> qDBF.FieldByName('P_PRICE').AsCurrency)
                  and (qPrices.FieldByName('date_on').AsDateTime <> qDBF.FieldByName('REP_DATE').AsDateTime)
              then
              {Цена на данных момент не соответствует цене в файле,
               но выставлять новую цену не будем, если предыдущая смена цены была в этот же день.}
                NeedSave := True
              else
                NeedSave := False;

              // Проверка на повторную обработку
              if slNpPrice.IndexOf(IntToStr(vNpId)) = -1 then
                slNpPrice.Add(IntToStr(vNpId))
              else
              {Если цена на этот товар уже была, то эту обрабатывать не нужно}
                NeedSave := False;              
              if NeedSave then
              begin
                DBSaver.SaveRecord('OIL_NP_PRICE',
                 ['ID', null,
                  'INST', FInst,
                  'ORG_ID', FInst,
                  'ORG_INST', FInst,
                  'NP_ID', vNpId,
                  'DATE_ON', qDBF.FieldByName('REP_DATE').AsDateTime,
                  'PRICE', qDBF.FieldByName('P_PRICE').AsCurrency]);
                log(format('Сформированна цена на %s (1c=%d; nnb=%d; oil=%d) = %f',
                 [qDBF.FieldByName('np_name').AsString,
                  qDBF.FieldByName('NP_1C').AsInteger, qDBF.FieldByName('NP_NNB').AsInteger, vNpId,
                  qDBF.FieldByName('P_PRICE').AsCurrency]));
              end
              else
              begin
                qDBF.Next;
                continue;
              end;
            end;
            itRest, itMotion, itReturn:
            begin
              vPrice := qDBF.FieldByName('P_PRICE').AsCurrency;
              if AImportType = itReturn then
                vAzsId := GetAzsId(qDBF.FieldByName('AZS_FROM').AsString)              
              else
                vAzsId := GetAzsId(qDBF.FieldByName('AZS_TO').AsString);
              if AImportType = itRest then
                Self.AzsId := vAzsId;
              // Если выбрана определенная АЗС, то грузим только ее
              if Self.AzsId <> -1 then
              begin
                if vAzsId <> Self.AzsId then
                begin
                  qDBF.Next;
                  continue;
                end;
              end;
              vStartDate := GetStartDate(vAzsId);
              if (vStartDate >= qDBF.FieldByName('REP_DATE').AsDateTime) then
              begin
                log(format('Документ №%s от %s создан раньше первоначальных остатков - загружен не будет!',[vDocNum, FormatDateTime('dd.mm.yyyy', vDate)]));
                qDBF.Next;
                continue;
              end;

              if not (AImportType = itRest) then
              begin
                if qTestReload.Active then qTestReload.Close;
                // Проверка на повтор при загрузке
                _OpenQueryPar(qTestReload,
                 ['vDocNum', qDBF.FieldByName('DOK_N').AsString,
                  'vDate', qDBF.FieldByName('REP_DATE').AsDateTime,
                  'vAzsId', vAzsId,
                  'vAzsInst', vAzsId,
                  'vNpId', vNpId,
                  'vMotion', IfThen(AImportType = itReturn, 0, 1),
                  'vReturn', IfThen(AImportType = itReturn, 1, 0)]);
                // TODO: Сделать модификацию уже существующих документов если, они не совпадают по каким-то позициям
                if not qTestReload.IsEmpty then
                begin
                  log(format('Документ №%s от %s уже существует для АЗС с кодом %d',[vDocNum, FormatDateTime('dd.mm.yyyy', vDate), vAzsId]));
                  qDBF.Next;
                  qTestReload.Close;
                  continue;
                end;
              end;
              // Проставляються переменные для следующего прихода/расхода
              if (vDate <> qDBF.FieldByName('REP_DATE').AsDateTime) or
                 (vDocNum <> qDBF.FieldByName('DOK_N').AsString)
              then
              begin
                vGroupNumPrih := GetSeqNextVal('SEQ_PRIHOD_GROUP_NUM');
                vGroupNumRash := GetSeqNextVal('SEQ_RASHOD_GROUP_NUM');
                vDate := qDBF.FieldByName('REP_DATE').AsDateTime;
                vDocNum := qDBF.FieldByName('DOK_N').AsString;
              end;
              vCount := qDBF.FieldByName('LITR').AsCurrency;
              vPart := GetPartKey(vNpId);

              // Штатные ситуации перемещений, возвратов и загрузки первоначальных остатков
              if (AImportType in [itReturn, itMotion]) or ((AImportType = itRest) and (vStartDate = 0)) then
              begin
                SavePrih(
                  IfThen(AImportType = itReturn, vAzsId, FInst), IfThen(AImportType = itReturn, vAzsId, FInst),
                  FInst, FInst,
                  vPart.Id, vPart.Inst,
                  vRez.Id, vRez.Inst,
                  vNpId,
                  vGroupNumPrih,
                  IfThen(AImportType = itReturn, 54, 1),
                  vDate, vDocNum,
                  vCount);

                SaveRash(
                  FInst, FInst,
                  IfThen(AImportType = itReturn, FInst, vAzsId), IfThen(AImportType = itReturn, FInst, vAzsId),
                  vPart.id, vPart.inst,
                  vRez.Id, vRez.Inst,
                  vNpId,
                  vGroupNumRash,
                  IfThen(AImportType = itReturn, 259, 10),
                  vDate, vDocNum,
                  vCount, vPrice);
              end;

              // Загрузка корректирующих остатков
              if (vStartDate <> 0) and (AImportType = itRest) then
              begin

                if (vDailyRepRashId = 0) and (vDailyRepPrihId = 0) then
                begin
                  vLastRepDate := GetSqlValueParSimple('select max(rep_date) from oil_daily_rep where state =''Y'' and azs_id = :AAzsId and azs_inst = :AAzsInst ',
                   ['AAzsId',   vAzsId,
                    'AAzsInst', vAzsId]);
                  
                  vDailyRepRashId := DBSaver.SaveRecord('OIL_DAILY_REP',
                   ['ID',        null,
                    'STATE',     'Y',
                    'INST',      MAIN_ORG.Inst,
                    'REP_DATE',  (vLastRepDate + 1/24/60),
                    'AZS_ID',    vAzsId,
                    'AZS_INST',  vAzsId,
                    'REP_NUM',   FormatDateTime('dd', qDBF.FieldByName('rep_date').AsDateTime),
                    'SMENA_NUM', 1,
                    'AUTO_LOAD', 'Y',
                    'USER_ID',   SUPER_REAL_EMP_ID
                   ]);
                  vDailyRepPrihId := DBSaver.SaveRecord('OIL_DAILY_REP',
                   ['ID',        null,
                    'STATE',     'Y',
                    'INST',      MAIN_ORG.Inst,
                    'REP_DATE',  (vLastRepDate + 2/24/60),
                    'AZS_ID',    vAzsId,
                    'AZS_INST',  vAzsId,
                    'REP_NUM',   FormatDateTime('dd', qDBF.FieldByName('rep_date').AsDateTime),
                    'SMENA_NUM', 1,
                    'AUTO_LOAD', 'Y',
                    'USER_ID',   SUPER_REAL_EMP_ID
                   ]);

                  _OpenQueryPar(qRest,
                   ['AAzsId',   vAzsId,
                    'AAzsInst', vAzsId,
                    'ABeginDate', vLastRepDate+1]);
                  ProgressBar.Max := ProgressBar.Max + qRest.RecordCount;
                  while not qRest.Eof do
                  begin
                    ProgressBar.StepIt;
                    // Возврат с АЗС на НБ старых остатков
                    TSRepAutoLoadF.DailyRepAddRash(
                      vAzsId, vDailyRepRashId, 0, qRest.FieldByName('np_typeid').AsInteger, 55,
                      qRest.FieldByName('shtuki').AsInteger, 0, qRest.FieldByName('shtuki').AsInteger, 1, 0);
                    vRestPart := GetPartKey(qRest.FieldByName('np_typeid').AsInteger);
                    // Приход на НБ с АЗС старых остатков
                    SavePrih(
                      vAzsId, vAzsId,
                      FInst, FInst,
                      vRestPart.Id, vRestPart.Inst,
                      vRez.Id, vRez.Inst,
                      qRest.FieldByName('np_typeid').AsInteger,
                      vGroupNumPrih,
                      54,
                      trunc(vLastRepDate), '0',
                      qRest.FieldByName('shtuki').AsInteger);

                    // Списание с НБ старых остатков
                    SaveRash(
                      FInst, FInst,
                      FInst, FInst,
                      vRestPart.id, vRestPart.inst,
                      vRez.Id, vRez.Inst,
                      qRest.FieldByName('np_typeid').AsInteger,
                      vGroupNumRash,
                      259,
                      trunc(vLastRepDate), '0',
                      qRest.FieldByName('shtuki').AsInteger, 0);
                    qRest.Next;
                  end;
                  vGroupNumPrih := GetSeqNextVal('SEQ_PRIHOD_GROUP_NUM');
                  vGroupNumRash := GetSeqNextVal('SEQ_RASHOD_GROUP_NUM');
                end;
                // Приход на НБ новых остатков
                SavePrih(
                  FInst, FInst,
                  FInst, FInst,
                  vPart.Id, vPart.Inst,
                  vRez.Id, vRez.Inst,
                  vNpId,
                  vGroupNumPrih,
                  1,
                  vDate, vDocNum,
                  vCount);
                // Отпуск с НБ на АЗС новых остатков
                vRash := SaveRash(
                  FInst, FInst,
                  vAzsId, vAzsId,
                  vPart.id, vPart.inst,
                  vRez.Id, vRez.Inst,
                  vNpId,
                  vGroupNumRash,
                  10,
                  vDate, vDocNum,
                  vCount, vPrice);
                // Приход на АЗС новых остатков
                DBSaver.SaveRecord('OIL_DR_DATA',
                 ['ID',         null,
                  'STATE',      'Y',
                  'INST',       FInst,
                  'REP_ID',     vDailyRepPrihId,
                  'REP_INST',   FInst,
                  'OPER_TYPE',  0,
                  'TTN_ID',     vRash.Id,
                  'TTN_INST',   vRash.Inst,
                  'PR_LITR',    vCount,
                  'PR_UD_WEIG', 0,
                  'PR_COUNT',   vCount,
                  'SUB_PART',   vNpId,
                  'S_PRICE',    vPrice
                 ]);
              end;

            end;
          end; // case AImportType of
          qDBF.Next;
          if qDBF.RecNo mod 100 = 0 then
            log(format('Обработано %d записей.', [qDBF.RecNo]));
          inc(vProcessedCount);
        end;// While not qDBF.Eof;
        CommitSQL;
        ProgressBar.Position := 0;
        log(Format('Файл успeшно загружен. Всего записей %d, загружено - %d, пропущенно - %d.',
          [vAllCount, vProcessedCount, vAllCount-vProcessedCount]));
        ShowMessage(Format('Файл успeшно загружен. Всего записей %d, загружено - %d, пропущенно - %d.',
          [vAllCount, vProcessedCount, vAllCount-vProcessedCount]));
      except on E:Exception do
        begin
          RollbackSQL;
          ProgressBar.Position := 0;
          Log(format('Ошибка! Файл загружен неудачно, строка №%d:',[qDBF.RecNo]));
          if qDBF.Active then qDBF.Close;
          Raise;
        end;
      end;
    finally
      slNpPrice.Free;
      if qDBF.Active then qDBF.Close;
      if qPrices.Active then qPrices.Close;
    end;
  except on E:Exception do
    begin
      Log(' '+e.Message);
      Raise Exception.Create('Import: '+e.Message);
    end;
  end;
end;

function TImportCashtanForm.GetImportType: TImportType;
begin
  if rbRest.Checked then
    Result := itRest
  else if rbComing.Checked then
    Result := itComing
  else if rbMotion.Checked then
    Result := itMotion
  else if rbSelling.Checked then
    Result := itSelling
  else if rbPrice.Checked then
    Result := itPrice
  else if rbReturn.Checked then
    Result := itReturn
  else
    raise Exception.Create('GetImportType: Выбран недопустимый переключатель!');
end;

procedure TImportCashtanForm.SetImportType(AValue: TImportType);
begin
  case AValue of
    itRest:
      rbRest.Checked := True;
    itComing:
      rbComing.Checked := True;
    itMotion:
      rbMotion.Checked := True;
    itSelling:
      rbSelling.Checked := True;
    itPrice:
      rbPrice.Checked := True;
    itReturn:
      rbReturn.Checked := True;
    else
      raise Exception.Create('SetImportType: Выбран недопустимый тип переключателя!');
  end;
end;

procedure TImportCashtanForm.SetAzsId(AValue: integer);
begin
  FAzsId := AValue;
  if FAzsId = -1 then
    edTo.Clear
  else
    edTo.Text := GetOrgName(FAzsId, FAzsId);
end;

function TImportCashtanForm.GetRezKey: TPrimaryKey;
var
  vRezDefault: string;
begin
  try
    vRezDefault := ReadOilVar('REZ_SOP');
    // считали резервуар по умолчанию из OIL_VAR
    // он хранится там в формате "ID,INST"
    if vRezDefault<>'' then
    begin
      Result.Id := StrToInt(trim(system.copy(vRezDefault,1,pos(',',vRezDefault)-1)));
      Result.Inst := StrToInt(trim(system.copy(vRezDefault,pos(',',vRezDefault)+1,length(vRezDefault))));
    end
    else
      Raise Exception.Create('Резервуар для соп.товаров не определен!');
  except on E:Exception do
    Raise Exception.Create('GetRezKey: '+ e.Message);
  end;
end;

function TImportCashtanForm.GetPartKey(ANpId: integer): TPrimaryKey;
var
  res: boolean;
begin
  try
    res := False;
    if 0 < GetSqlValueParSimple('select count(*) from oil_part where state = ''Y'' and np_type = :ANpId and inst = :AInst',
      ['ANpId', ANpId,
       'AInst', FInst])
    then
    begin
      Result.Id := GetSqlValueParSimple('select min(id) from oil_part where state = ''Y'' and np_type = :ANpId and inst = :AInst',
       ['ANpId', ANpId,
        'AInst', FInst]);
      Result.Inst := FInst;
      res := True;
    end;
    if res=false then
    begin
       Result.Inst := FInst;
       Result.Id := DBSaver.SaveRecord('OIL_PART',
        ['ID'             , null,
         'INST'           , FInst,
         'STATE'          , 'Y',
         'DOG'            , GetUniquePartName(IntToStr(ANpId)),
         'DOG_DATE'       , Date(),
         'FROM_'          , FInst,
         'FROM_INST'      , FInst,
         'COMM'           , TranslateText('Автоматически созданная партия сопутствующего товара'),
         'SERT'           , '',
         'NP_TYPE'        , ANpId,
         'BASE_'          , 1,
         'DIM_ID'         , 19,
         'SS'             , 1,
         'PRICE'          , 1,
         'PRICE_KP'       , 0,
         'DOR_SBOR'       , 0,
         'OWN_GOODS'      , 'O',
         'TO_'            , FInst,
         'TO_INST'        , FInst,
         'PLAN_ID'        , null,
         'IS_BARTER'      , 0,
         'GOAL_PART_TYPE' , 9,
         'AMOUNT'         , 0,
         'AMOUNT_FACT'    , 0,
         'FILSEND'        , 'N',
         'BASE_LITR'      , null,
         'UD_WEIGHT'      , null,
         'SOPUTST'        , 'Y']);
    end;
  except on E:Exception do
    Raise Exception.Create('GetPartKey: '+ e.Message);
  end;
end;

function TImportCashtanForm.GetNpId(ANp1C: integer; ANpNNB: integer): integer;
begin
  try
    Result := -1;
    if not qGoods.Active then
      qGoods.Open;
    qGoods.Filtered := False;
    qGoods.Filter := format(' c1_id = %d ',[ANp1C]);
    qGoods.Filtered := True;
    if not qGoods.IsEmpty then
      Result := qGoods.FieldByName('oil_id').AsInteger
    else
    begin
      qGoods.Filtered := False;
      qGoods.Filter := format(' nnb_id = %d ',[ANpNNB]);
      qGoods.Filtered := True;
      if not qGoods.IsEmpty then
        Result := qGoods.FieldByName('oil_id').AsInteger;
    end;
    { // Для медленного соединения 
    Result := nvl(GetSqlValueParSimple('select min(np.id) from oil_np_type np, exe_link el where (np.id = el.oil_id and el.OIL_TABLE_NAME = ''OIL_NP_TYPE'' and el.out_code = :ANp1C and el.out_program = 2) ',
     ['ANp1C', ANp1C]), -1);
    if Result = -1 then
    begin
      Result := nvl(GetSqlValueParSimple('select min(np.id) from oil_np_type np where (np.codavias = :ANpNNB)',
       ['ANpNNB',ANpNNB]), -1);
    end;
    }
    if Result = -1 then
      raise Exception.CreateFmt('Не удалось найти соответствие кода Oil с кодом ННБ %d и кодом артикула %d. '+#10#13
        +'Обратитесь в Центр (Киев) с данным файлом, для ввода нового товара в общую базу данных.',[ANpNNB, ANp1C]);
  except on e:Exception do
    Raise Exception.Create('GetNpId: '+ e.Message);
  end;
end;

function TImportCashtanForm.GetAZSId(AAzsName: string):integer;
var
  vNum: string;
  i: integer;
begin
  try
    if FAZSList.Values[AAzsName] <> '' then
      Result := StrToInt(FAZSList.Values[AAzsName])
    else
    begin
      vNum := '';
      for i:=Length(AAzsName) downto 0 do
      begin
        if AAzsName[i] in ['0'..'9'] then
          vNum := AAzsName[i] + vNum
        else if vNum <> '' then
          // если номер уже определен, и пошли другие символы, то выходим из цикла
          break;
      end;
      if vNum = '' then
        Raise Exception.CreateFmt('Не удалось определить АЗС для "%s"!',[AAzsName]);

      Result := nvl(GetSqlValueParSimple('select id from v_oil_azs where azs_num = :azs_num and par = :par and par_inst = :par_inst',
       ['azs_num', StrToInt(vNum),
        'par', FInst,
        'par_inst', FInst]),-1);
      if Result = -1 then
        Raise Exception.CreateFmt('Не удалось определить АЗС для "%s" c номером %s!',[AAzsName, vNum])
      else
        FAZSList.Values[AAzsName] := IntToStr(Result);
    end;
  except on e:Exception do
    Raise Exception.Create('GetAZSId: '+ e.Message);
  end;
end;

function TImportCashtanForm.GetTypeName(AImportType: TImportType): string;
begin
  case AImportType of
    itRest:    Result := 'Остатки';
    itComing:  Result := 'Приходы на склад';
    itMotion:  Result := 'Перемещения';
    itSelling: Result := 'Реализация';
    itPrice:   Result := 'Цены';
    else
      raise Exception.Create('GetTypeName: Не определено имя типа загрузки');
  end;
end;

function TImportCashtanForm.GetStartDate(AAzsId: integer): TDateTime;
begin
  if FAZSStartDateList.Values[IntToStr(AAzsId)] <> '' then
    Result := StrToDate(FAZSStartDateList.Values[IntToStr(AAzsId)])
  else
  begin
    Result := nvl(GetSqlValueParSimple('select max(r.date_) from oil_rashod r where r.to_id = :vAzsId and r.to_inst = :vAzsInst and r.state = ''Y'' and r.ttn_num = ''0'' ',
     ['vAzsId', AAzsId,
      'vAzsInst', AAzsId]),
      0);
    FAZSStartDateList.Values[IntToStr(AAzsId)] := DateToStr(Result);
  end;
end;

procedure TImportCashtanForm.SavePrih(AFromId, AFromInst, AToId, AToInst, APartId, APartInst,
  ARezId, ARezInst, ANpId, AGroupNum, AOperId: integer; ADate: TDateTime; ADocNumber: string;
  ACount: Currency);
var
  PRIH_ID: integer;
begin
  if trim(ADocNumber) = '' then
    raise Exception.Create(TranslateText('Не указан номер документа!'));
  PRIH_ID := DBSaver.SaveRecord('OIL_PRIHOD',
   ['ID'         , null,
    'STATE'      , 'Y',
    'INST'       , FInst,
    'EMP_ID'     , 0,
    'EMP_INST'   , FInst,
    'DATE_'      , ADate,
    'OPER_ID'    , AOperId,
    'PART_ID'    , APartId,
    'PART_INST'  , APartInst,
    'DATE_OTPR'  , ADate,
    'DOST'       , 1,
    'NP_TYPE'    , ANpId,
    'FROM_'      , AFromId,
    'FROM_INST'  , AFromInst,
    'TO_'        , AToId,
    'TO_INST'    , AToInst,
    'GROUP_NUM'  , AGroupNum,
    'NUMBER_DOC' , ADocNumber]);

  DBSaver.SaveRecord('OIL_PRIH_DET',
   ['ID'                , null,
    'STATE'             , 'Y',
    'INST'              , FInst,
    'PRIHOD_ID'         , PRIH_ID,
    'DOC_COUNT'         , ACount,
    'FACT_COUNT'        , ACount,
    'NED_NORM_UB'       , 0,
    'NED_NORM_ER'       , 0,
    'NED_POST'          , 0,
    'NED_RAIL'          , 0,
    'IZL_NORM'          , 0,
    'IZL_POST'          , 0,
    'REZ'               , ARezId,
    'REZ_INST'          , ARezInst,
    'IS_DIGITAL_WEIGHT' , 0,
    'TECH_LOSS'         , 0]);
end;

function TImportCashtanForm.SaveRash(AFromId, AFromInst, AToId, AToInst, APartId, APartInst,
  ARezId, ARezInst, ANpId, AGroupNum, AOperId: integer; ADate: TDateTime; ADocNumber: string;
  ACount, APrice: Currency): TPrimaryKey;
begin
  if trim(ADocNumber) = '' then
    raise Exception.Create(TranslateText('Не указан номер документа!'));
  Result.Inst := FInst;
  Result.Id :=
  DBSaver.SaveRecord('OIL_RASHOD',
   ['ID',                      null,
    'STATE',                   'Y',
    'INST',                    FInst,
    'EMP_ID',                  EMP_ID,
    'DATE_',                   ADate,
    'FROM_ID',                 FInst,
    'FROM_INST',               FInst,
    'TO_ID',                   AToId,
    'TO_INST',                 AToInst,
    'OPER_ID',                 AOperId,
    'TTN_NUM',                 ADocNumber,
    'TTN_DATE',                ADate,
    'PART_ID',                 APartId,
    'PART_INST',               APartInst,
    'PACK',                    TranslateText('ШТ.'),
    'TEMPER',                  0,
    'UD_WEIG',                 1,
    'LITR',                    ACount,
    'COUNT_',                  ACount,
    'PRICE',                   APrice,
    'INCL_DEBET',              'N',
    'RASCH_TYPE',              0,
    'SBOR_POST',               'N',
    'SBOR_NAC',                'N',
    'SBOR_NDS',                'N',
    'UCH_PRICE',               'N',
    'OWN_GOOD',                'Y',
    'REZ',                     ARezId,
    'REZ_INST',                ARezInst,
    'GROUP_NUM',               AGroupNum,
    'USER_ID',                 SUPER_REAL_EMP_ID
   ]);

end;

{$R *.dfm}

procedure TImportCashtanForm.bbOkClick(Sender: TObject);
begin
  inherited;
  if FilenameEdit.FileName = '' then
    Raise Exception.Create('Необходимо выбрать файл!');
  if not FileExists(FilenameEdit.FileName) then
    Raise Exception.Create('Выбраный файл не найден!');
  if MessageDlg('Вы уверены что хотите загрузить '+GetTypeName(Self.ImportType), mtConfirmation, mbYesNoCancel, 0) = mrYes then
  begin
    Import(FilenameEdit.FileName, Self.ImportType);
    if Self.ImportType in [itMotion,itRest] then
    begin
      Self.ImportType := itPrice;
      Import(FilenameEdit.FileName, itPrice);
    end;
  end;

end;

procedure TImportCashtanForm.FormCreate(Sender: TObject);
begin
  inherited;
  FLog := TStringList.Create;
  FAZSList := TStringList.Create;
  FAZSStartDateList := TStringList.Create;
end;

procedure TImportCashtanForm.FormDestroy(Sender: TObject);
begin
  inherited;
  FLog.Free;
  FAZSList.Free;
  FAZSStartDateList.Free;
end;

procedure TImportCashtanForm.sbLogClick(Sender: TObject);
begin
  inherited;
  ShowText(FLog.Text);
end;

procedure TImportCashtanForm.sbClearToClick(Sender: TObject);
begin
  inherited;
  Self.AzsId := -1;
end;

procedure TImportCashtanForm.edToButtonClick(Sender: TObject);
var
  vId, vInst: Integer;
  vName: String;
begin
  if ChooseOrg.CaptureOrg(2, MAIN_ID, INST, 'yyy', vId, vInst, vName) then
    Self.AzsId := vId;
end;

end.
