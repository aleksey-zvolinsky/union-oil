unit E_Import;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBTables, Db, Buttons, ComCtrls, uCommonForm,uOilQuery,Ora,
  uOilStoredProc, MemDS, DBAccess{$IFDEF VER150},Variants{$ENDIF};

type
  TE_ImportForm = class(TCommonForm)
    Panel1: TPanel;
    Panel2: TPanel;
    RE1: TRichEdit;
    bbSearch: TBitBtn;
    edFileName: TEdit;
    OD: TOpenDialog;
    qFieldsList: TOilQuery;
    TempTable: TTable;
    bbImp: TBitBtn;
    q: TOilQuery;
    PB1: TProgressBar;
    BitBtn3: TBitBtn;
    Panel3: TPanel;
    rgTypeImport: TRadioGroup;
    procedure bbSearchClick(Sender: TObject);
    procedure Import;
    procedure bbImpClick(Sender: TObject);
    procedure Log(s: string);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgTypeImportClick(Sender: TObject);
  private
    ClientBank: TStringList;
  public
  end;

var
  E_ImportForm: TE_ImportForm;

implementation

{$R *.DFM}

uses UDbFunc, ExFunc, GetFromGrid, E_Var, Main, OilStd, MoneyFunc, E_Options;

var
  WriteLogToFile: Boolean;
  LogFile: TEXT;

//==============================================================================
procedure TE_ImportForm.bbSearchClick(Sender: TObject);
begin
  if rgTypeImport.ItemIndex = 0 then OD.Filter := 'Таблицы dbase|*.dbf|Все файлы|*.*'
  else OD.Filter := 'Файлы клиент банка|*.K*|Все файлы|*.*';

  if OD.Execute then
  begin
    if rgTypeImport.ItemIndex = 0 then
    begin
      if TempTable.Active then TempTable.Close;
      TempTable.Tablename := pchar(OD.Filename);
      TempTable.Open;
      if not TempTable.FieldList.Equals(qFieldsList.SQL) then
      begin
        MessageDlg(TranslateText('Неверный формат таблицы!'), mtError, [mbOk], 0);
        TempTable.Close;
        edFileName.Clear;
        exit;
      end;
      edFileName.Text := OD.Filename + ': '+IntToStr(TempTable.RecordCount) + TranslateText(' записей');
    end
    else
    begin
      ClientBank.LoadFromFile(pchar(OD.Filename));
      edFileName.Text := OD.Filename + ': '+IntToStr(ClientBank.Count-1) + TranslateText(' записей');
    end;
  end;
end;
//==============================================================================
procedure TE_ImportForm.Log(s: string);
begin
  RE1.Lines.Add(s);
  RE1.ScrollBy(0, 100);
  RE1.Refresh;
  if WriteLogToFile then Writeln(LogFile, s);
end;
//==============================================================================
function InitLogFile: Boolean;
begin
  result := TRUE;
  WriteLogToFile := FALSE;
  if E_I1C_LOGFILENAME = '' then WriteLogToFile := FALSE
  else
  begin
    try
      Assign(LogFile, GetMainDir + E_I1C_LOGFILENAME);
      Rewrite(LogFile);
      WriteLogToFile := TRUE;
    except
      if MessageDlg(TranslateText('При попытке записи лога в файл ') + GetMainDir + E_I1C_LOGFILENAME + #13#10 +
        TranslateText('произошла ошибка. Продолжать импорт без ведения лога?'), mtWarning, [mbYes, mbNo], 0) = mrNo then
        result := FALSE;
    end;
  end;
end;
//==============================================================================
procedure TE_ImportForm.Import;
var
  SkipAllExistantRecords: Boolean;
  OrgId, OrgInst, RekvizitId, RekvizitInst: Variant;
  debkr, i, ImportedCount, SkippedCount: integer;
  date_mov: TDateTime;
  bank_name, mfo, rach_chet, n_doc, firma_name, firma_okpo, comments: string;
  summ, nds: real;
  RekvizitCache, OrgErrorCache, OrgDiffNameCache, MFOCache: TStringList;

  //****************************************************************************
  function GetRecordDescription: string;
  begin
    result := DateTimeToStr(date_mov) + '; ' + TranslateText('Банк ') + bank_name + TranslateText(' МФО ') + mfo + ' ';
    result := result + TranslateText('р/с ') + rach_chet + #13#10 + TranslateText('№ документа: ') + n_doc + #13#10;
    if firma_name = '' then result := result + TranslateText('Фирма неизвестна.') + #13#10
    else result := result + TranslateText('Фирма ') + firma_name + TranslateText(' код ОКПО ') + firma_okpo + #13#10;
    if debkr = 0 then result := result + TranslateText('Оплата ')
    else result := result + TranslateText('Поступление ');
    result := result + TranslateText(' на сумму ') + FloatToStr(summ) + '; ' + TranslateText('Примечание: ') + comments;
    result := result + #13#10;
  end;
  //****************************************************************************
  procedure TestRecordExists;
  var
    res: TModalResult;
  begin
    if not E_I1C_TESTRECORDEXISTS then exit;
    if q.Active then q.Close;
    q.Sql.Text :=
      'select count(*) as numb from ve_bill where ' +
      'date_=''' + DateTimeToStr(date_mov) + ''' and decode(debkr,-1,0,1) = ' + IntToStr(debkr) +
      ' and (rach_chet = ''' + rach_chet + ''' and mfo = ''' + mfo + ''' ' +
      ' or rach_chet is null and ''' + rach_chet + ''' is null) and summ = ' + ReplaceSubstr(FloatToStr(summ),',','.');
    _OpenQuery(q);
    if q.FieldByName('numb').AsInteger > 0 then
    begin
      log(TranslateText('Такая запись уже существует.'));
      if SkipAllExistantRecords then
      begin
        log(TranslateText('Пропущена.'));
        Raise Exception.Create('1');
      end
      else
      begin
        res := MessageDlg(TranslateText('Данная запись уже была импортирована или введена вручную. Пропустить?'),
          mtWarning, [mbYes, mbNo, mbAll], 0);
        case res of
          mrYes: log(TranslateText('Пропущена.'));
          mrNo:  log(TranslateText('Будет импортирована по требованию пользователя.'));
          mrAll:
            begin
              log(TranslateText('Пропущена вместе со всеми подобными впоследствии.'));
              SkipAllExistantRecords := TRUE;
            end;
        end;
        if res <> mrNo then Raise Exception.Create('');
      end;
    end;
  end;
  //****************************************************************************
  procedure DefineRekvizit;
  begin
    // В RekvizitCache хранятся реквизиты, которые встречались в текущем импорте,
    // и были не найдены в базе. Если пользователь сказал продолжать импорт, то
    // в дальнейшем записи с такими реквизитами буду просто пропускаться без лишних вопросов
    if rach_chet = '' then
    begin
      RekvizitId := null;
      RekvizitInst := null;
      exit;
    end;

    if RekvizitCache.IndexOf(rach_chet + ';' + mfo) <> -1 then
    begin
      log(TranslateText('Импорт записи отменен из-за неизвестных реквизитов.'));
      Raise Exception.Create('1');
    end;

    if q.Active then q.Close;
    q.Sql.Text :=
      'select * from ve_rekvizit where rach_chet=''' + rach_chet + ''' and mfo=''' + mfo + ''' and ' +
      ' obl_inst=' + IntToStr(E_ORGINST) + ' and obl_id=' + IntToStr(E_ORGINST);
    _OpenQuery(q);

    if q.RecordCount = 0 then
    begin
      log(TranslateText('Расчетный счет в базе OIL не найден.'));
      MessageDlg(TranslateText('Расчетный счет ') + rach_chet + TranslateText(' не найден в базе OIL.'),
      mtError,[mbOk], 0);
      RekvizitCache.Add(rach_chet + ';' + mfo);
      Raise Exception.Create('');
    end
    else
      if q.RecordCount = 1 then
      begin
        if (MFOCache.IndexOf(q.FieldByName('mfo').AsString) = -1) and (q.FieldByName('bank_name').AsString <> bank_name) then
        begin
          log(TranslateText('Название банка не совпадает. '));
          if MessageDlg(TranslateText('Название банка не совпадает.') + #13#10 +
            TranslateText('В 1С : ') + bank_name + #13#10 +
            TranslateText('В OIL: ') + q.FieldByName('bank_name').AsString + #13#10 +
            TranslateText('Импортировать запись?'), mtWarning, [mbYes, mbNo], 0) = mrNo then
          begin
            log(TranslateText('Импорт записи отменен пользователем.'));
            Raise Exception.Create('');
          end
          else MFOCache.Add(q.FieldByName('mfo').AsString);
        end;
        RekvizitId := q.FieldByName('id').AsInteger;
        RekvizitInst := q.FieldByName('inst').AsInteger;
      end
      else
      begin
        log(TranslateText('Найдено несколько одинаковых расчетных счетов в базе OIL.'));
        log(TranslateText('Импорт записи отменен.'));
        MessageDlg(TranslateText('Найдено несколько одинаковых расчетных счетов в базе OIL.')+#13#10+
          TranslateText('Импорт записи отменен.'), mtError, [mbOk], 0);
        RekvizitCache.Add(rach_chet + ';' + mfo);
        Raise Exception.Create('');
      end;
  end;
  //****************************************************************************
  procedure DefineOrg;
  var
    s_log, res, options: string;
    intOrgId, intOrgInst: integer;
  begin
    // в OrgErrorCache содержатся ОКПО организаций, анализ которых приводил к ошибкам
    // если пользователь предложил продолжать импорт, то в дальнейшем записи с
    // такими организациями будут автоматически пропускаться
    if OrgErrorCache.IndexOf(firma_okpo) <> -1 then
    begin
      log(TranslateText('Анализ организации с ОКПО ')+firma_okpo+TranslateText(' уже приводил к ошибке. Запись пропущена.'));
      Raise Exception.Create('1');
    end;
    OrgId := null;
    OrgInst := null;
    if firma_okpo = '' then
      log(TranslateText('ОКПО организации нулевое - организация неизвестна.'))
    else
    begin
      options := 'yyyy';
      if not E_I1C_REPLACEORGNAME then options[1] := 'n';
      if not E_I1C_ANALIZEORGNAME then options[3] := 'n';
      if not E_I1C_ADDFIRMAAUTO then options[4] := 'n';
      // если организация с этим ОКПО вызывала вопрос о несовпадающих именах, то он в дальнейшем не задается
      if OrgDiffNameCache.IndexOf(firma_okpo) <> -1 then
        options[1] := 'n';
      if rgTypeImport.ItemIndex = 1 then
        if (trim(Copy(ClientBank.Strings[i], 57, 10)) = trim(Copy(ClientBank.Strings[i], 24, 10))) then
        begin
          if q.Active then q.Close;
          q.Sql.Text := 'select count(*) from v_org where id = '+ IntToStr(E_ORGINST) +
            ' and inst = '+ IntToStr(E_ORGINST) +' and id_num = '''+ trim(Copy(ClientBank.Strings[i], 24, 10)) +'''';
          _OpenQuery(q);
          if (q.RecordCount = 1) then
          begin
            OrgId := E_ORGINST;
            OrgInst := E_ORGINST;
          end;
        end;

      if (OrgId = null) and (OrgInst = null) then
      begin
        res := DetectOrgByOkpo(firma_okpo, firma_name, intOrgId, intOrgInst, s_log, options);
        OrgId := intOrgId;
        OrgInst := intOrgInst;
        log(s_log);
        // если был вопрос о несовпадающих именах, то ОКПО заносится в кэш
        if res[4] = 'B' then OrgDiffNameCache.Add(firma_okpo);
        // если анализ организации вызвал ошибку, то ОКПО заносится в кэш
        if res[1] = 'E' then
        begin
          OrgErrorCache.Add(firma_okpo);
          Raise Exception.Create('');
        end;
      end;
    end;
  end;
  //****************************************************************************
  procedure ImportRecord;
  var
    AddSumm, AddNds, AddSummBez: real;
    BillId, i, AddDebKr: integer;
    AddBudgetId, AddOrgid: variant;
  begin
    try
      BillId := GetSeqNextVal('s_e_bill');
      if debkr = 0 then AddDebKr := -1
      else AddDebKr := 1;
      // знаходимо в коментарі номер статті бюджету
      AddBudgetId := null;
      i := 0;
      if E_I1C_SEARCHST = true then
      try
        repeat
          if AnsiUpperCase(Comments[i]) = AnsiUpperCase('с') then
          begin
            i := i + 1;
            if AnsiUpperCase(Comments[i]) = AnsiUpperCase('т') then
            begin
              i := i + 1;
              repeat
                if Comments[i] in ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'] then
                begin
                  if (AnsiUpperCase(Comments[i-1]) = AnsiUpperCase('т')) or (Comments[i-1] = '.') then
                    AddBudgetId := StrToInt(Comments[i])
                  else
                    AddBudgetId := StrToInt(IntToStr(AddBudgetId)+Comments[i]);
                end;
                i := i + 1;
              until not (Comments[i] in ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']);
            end;
          end
          else
            i := i + 1;
        until i = length(Comments);
      except
      end;

      // знаходимо в коментарі номер нафтобази
      AddOrgid := null;
      i := 0;
      if E_I1C_SEARCHNB = true then
      try
        repeat
          if AnsiUpperCase(Comments[i]) = AnsiUpperCase('н') then
          begin
            i := i + 1;
            if AnsiUpperCase(Comments[i]) = AnsiUpperCase('б') then
            begin
              i := i + 1;
              repeat
                if Comments[i] in ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'] then
                begin
                  if (AnsiUpperCase(Comments[i-1]) = AnsiUpperCase('б')) or (Comments[i-1] = '.') then
                    AddOrgid := StrToInt(Comments[i])
                  else
                    AddOrgid := StrToInt(IntToStr(AddOrgid)+Comments[i]);
                end;
                i := i + 1;
              until not (Comments[i] in ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']);
            end;
          end
          else
            i := i + 1;
        until i = length(Comments);
        if AddOrgid <> null then
          if IsMyOrg(E_ORGINST, AddOrgid) = false then AddOrgid := null;
      except
      end;

      InsOrUpdRecord('E_BILL',
        ['ID',             BillId,
         'STATE',          'Y',
         'INST',           E_ORGINST,
         'BILLPAY',        'P',
         'ORG_ID',         OrgId,
         'ORG_INST',       OrgInst,
         'NUMB',           n_doc,
         'DATE_',          date_mov,
         'COMMENTS',       ReplaceAllSubstr(comments, chr(166), '|'),
         'REKVIZIT_ID',    RekvizitId,
         'REKVIZIT_INST',  RekvizitInst,
         'SOURCE',         'I',
         'DEBKR',          AddDebKr,
         'VOZVRAT',        'N',
         'SPRINGID',       2,
         'E_BUDGET_ID',    AddBudgetId
        ]);

      AddSumm := summ;
      if E_I1C_WITHNDS then
      begin
        AddNds := nds;
        AddSummBez := AddSumm - AddNds;
      end
      else
      begin
        AddNds := 0;
        AddSummBez := AddSumm;
      end;

      InsOrUpdRecord('E_BILL_FILIALS',
        ['E_BILL_ID',     BillId,
         'INST',          E_ORGINST,
         'ORG_ID',        nvl(AddOrgid, E_ORGINST),
         'ORG_INST',      nvl(AddOrgid, E_ORGINST),
         'STATE',         'Y',
         'SUMM',          AddSumm,
         'NDS',           AddNds,
         'SUMMBEZ',       AddSummBez
        ]);

      log(TranslateText('Запись импортирована успешно.'));
    except on E: Exception do
      begin
        log(E.Message);
        MessageDlg(TranslateText('В процессе занесения записи в базу возникла ошибка:') + #13#10 + E.Message + #13#10 +
          TranslateText('Импорт записи отменен'), mtError, [mbOk], 0);
        Raise Exception.Create('');
      end;
    end;
  end;
  //****************************************************************************
  procedure ClearRecord;
  begin
    debkr := 0;
    date_mov := 0;
    bank_name := '';
    mfo := '';
    rach_chet := '';
    n_doc := '';
    firma_name := '';
    firma_okpo := '';
    summ := 0;
    nds := 0;
    comments := '';
  end;
  //****************************************************************************
  procedure TestAndImportRecord;
  begin
    log(GetRecordDescription);
    try
      TestRecordExists;
      DefineRekvizit;
      DefineOrg;
      ImportRecord;
      ClearRecord;
      inc(ImportedCount);
    except on E: Exception do
      begin
        if (E.Message <> '1') and (E.Message <> '') then
          MessageDlg(TranslateText('В процессе импорта возникла ошибка:') + #13#10 + E.Message, mtError, [mbOk], 0);
        if (E.Message <> '1') then
          if MessageDlg(TranslateText('Продолжить импорт?'), mtWarning, [mbYes, mbNo], 0) = mrNo then
            Raise Exception.Create(TranslateText('Импорт отменен'));
        inc(SkippedCount);
      end;
    end;
  end;
  //****************************************************************************
begin
  if not InitLogFile then exit;
  // если файл открыть не удалось, и пользователь сказал, что импорта в таком случае не надо
  log(TranslateText('Импорт из '+ rgTypeImport.Items.Strings[rgTypeImport.ItemIndex] +
    ' (начат ')+DateToStr(date)+'; '+TimeToStr(time)+')');
  log(TranslateText('Версия OIL: ')+Version.fileversion);
  log('---------------------------');
  RekvizitCache := TStringList.Create;
  OrgErrorCache := TStringList.Create;
  OrgDiffNameCache := TStringList.Create;
  MFOCache := TStringList.Create;
  SkipAllExistantRecords := FALSE;
  ImportedCount := 0;
  SkippedCount := 0;
  PB1.Position := 0;
  try
    StartSQL;
    ClearRecord;
    if rgTypeImport.ItemIndex = 0 then
    begin
      PB1.Max := TempTable.RecordCount;
      TempTable.First;
      while not TempTable.Eof do
      begin
        debkr := TempTable.FieldByName('debkr').AsInteger;
        date_mov := TempTable.FieldByName('date_mov').AsDateTime;
        bank_name := TempTable.FieldByName('bank_name').AsString;
        mfo := TempTable.FieldByName('mfo').AsString;
        rach_chet := TempTable.FieldByName('rach_chet').AsString;
        n_doc := TempTable.FieldByName('n_doc').AsString;
        firma_name := TempTable.FieldByName('firma_name').AsString;
        firma_okpo := TempTable.FieldByName('firma_okpo').AsString;
        summ := TempTable.FieldByName('summ').AsFloat;
        nds := TempTable.FieldByName('nds').AsFloat;
        comments := TempTable.FieldByName('comments').AsString;

        TestAndImportRecord;
        TempTable.Next;
        PB1.StepIt;
        log('---------------------------');
      end;
    end
    else
    begin
      PB1.Max := ClientBank.Count-1;
      i := 0;
      repeat
        rach_chet := trim(Copy(ClientBank.Strings[i], 11, 13));
        firma_okpo := trim(Copy(ClientBank.Strings[i], 24, 10));
        // взнаємо чи це оплата чи надходження
        if (GetSqlValue('select count(*) from ve_rekvizit where rach_chet = '''+ rach_chet +
          ''' and inst = '+ IntToStr(E_ORGINST) +'') > 0) and (GetSqlValue('select count(*) from v_org where id = ' +
          IntToStr(E_ORGINST) +' and inst = '+ IntToStr(E_ORGINST) +' and id_num = '''+ firma_okpo +'''') > 0) then
        begin
          // оплата
          debkr := 0;
          mfo := trim(Copy(ClientBank.Strings[i], 4, 6));
          rach_chet := trim(Copy(ClientBank.Strings[i], 11, 13));
          // витягаємо і декодуємо назву фірми
          SetLength(firma_name, length(trim(Copy(ClientBank.Strings[i], 136, 38))));
          OemToChar(pchar(trim(Copy(ClientBank.Strings[i], 136, 38))), pchar(firma_name));
          // витягаємо податковий код
          firma_okpo := trim(Copy(ClientBank.Strings[i], 57, 10));
        end
        else
        begin
          // надходження
          debkr := 1;
          mfo := trim(Copy(ClientBank.Strings[i], 37, 6));
          rach_chet := trim(Copy(ClientBank.Strings[i], 44, 13));
          // витягаємо і декодуємо назву фірми
          SetLength(firma_name, length(trim(Copy(ClientBank.Strings[i], 98, 38))));
          OemToChar(pchar(trim(Copy(ClientBank.Strings[i], 98, 38))), pchar(firma_name));
          // витягаємо податковий код
          firma_okpo := trim(Copy(ClientBank.Strings[i], 24, 10));
        end;
        date_mov := StrToDate(Copy(ClientBank.Strings[i], 334, 2) +'.'+ Copy(ClientBank.Strings[i], 336, 2) +'.'+ Copy(ClientBank.Strings[i], 338, 2));
        // витягаємо і декодуємо назву банку
        bank_name := nvl(GetSQLValue('select bank_name from ve_rekvizit where rach_chet = '''+ rach_chet +''''), '');  
        SetLength(n_doc, length(trim(Copy(ClientBank.Strings[i], 67, 10))));
        OemToChar(pchar(trim(Copy(ClientBank.Strings[i], 67, 10))), pchar(n_doc));
        summ := StrToFloat(trim(Copy(ClientBank.Strings[i], 77, 19)))/100;
        nds := GetNDS_WithNDS(summ, StrToDateTime(FormatDateTime2('dd.mm.yyyy', GetSystemDate)), 2);
        // витягаємо і декодуємо коментарій
        SetLength(comments, length(trim(Copy(ClientBank.Strings[i], 174, 160))));
        OemToChar(pchar(trim(Copy(ClientBank.Strings[i], 174, 160))), pchar(comments));

        TestAndImportRecord;
        i := i + 1;
        PB1.StepIt;
        log('---------------------------');         
      until ClientBank.Count-1 = i;
    end;
    CommitSqlOra;
    log('---------------------------');
    log(IntToStr(ImportedCount)+TranslateText(' записей импортировано.'));
    log(IntToStr(SkippedCount)+TranslateText(' записей пропущено.'));
    log(TranslateText('Импорт закончен ')+DateToStr(date)+'; '+TimeToStr(time));
  except on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOk], 0);
      log('---------------------------');
      log(TranslateText('Импорт отменен ')+DateToStr(date)+'; '+TimeToStr(time));
      RollbackSql;
    end;
  end;
  if WriteLogToFile then CloseFile(LogFile);
  RekvizitCache.Free;
  OrgErrorCache.Free;
  OrgDiffNameCache.Free;
  MFOCache.Free;
  PB1.Position := 0;
end;
//==============================================================================
procedure TE_ImportForm.bbImpClick(Sender: TObject);
begin
  if trim(edFileName.Text) = '' then MessageDlg(TranslateText('Сначала надо выбрать файл.'), mtInformation, [mbOk], 0)
  else Import;
end;
//==============================================================================
procedure TE_ImportForm.BitBtn3Click(Sender: TObject);
begin
  ShowOptions(1);
end;
//==============================================================================
procedure TE_ImportForm.FormShow(Sender: TObject);
begin
  ClientBank := TStringList.Create;
  rgTypeImportClick(nil);
end;
//==============================================================================
procedure TE_ImportForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ClientBank.Free;
end;
//==============================================================================
procedure TE_ImportForm.rgTypeImportClick(Sender: TObject);
begin
  edFileName.Text := '';
  OD.Filename := '';
  case rgTypeImport.ItemIndex of
    0: Caption := 'Импорт из 1С';
    1: Caption := 'Импорт из Клиент банка';
  end;
end;
//==============================================================================

end.
