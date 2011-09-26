{******************************************************************************}
{   Предназначение : просмотр/распечатка созданных в программе НН, также       }
{                    запуск форм автоформирования НН с АЗС, создания ручных НН }
{                    и загрузка НН созданных на АЗС со сменных отчетов.        }
{******************************************************************************}
unit SlBookRef;

interface

uses uCommonForm,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls,
  ToolEdit, Mask, RXCtrls,ComObj,Excel_TLB, ActnList, Ora, MemDS, DBAccess,
  DBGridEh, VirtualTable, OraSmart,uOilQuery,uOilStoredProc{$IFDEF VER150},Variants{$ENDIF},
  TaxBillPrint, TaxBillPrintForm, DBGridEhGrouping, GridsEh;

type
  TSlBookRefForm = class(TBaseForm)
    eFiltrNN: TEdit;
    ceClient: TComboEdit;
    LblNum: TLabel;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    qID: TFloatField;
    qINST: TFloatField;
    qORGAN: TFloatField;
    qORGAN_INST: TFloatField;
    qORGAN_NAME: TStringField;
    qFRASCH: TStringField;
    qR_DATE: TDateTimeField;
    qSALE_TXT: TStringField;
    qNDS_T: TFloatField;
    qNDS_P_BASE: TFloatField;
    qNDS_P_20: TFloatField;
    qNDS_NP_BASE: TFloatField;
    qNDS_NP_20: TFloatField;
    qNUM: TStringField;
    Label4: TLabel;
    qTOV_ID: TFloatField;
    qTOV_NAME: TStringField;
    qDIM_ID: TFloatField;
    qDIM_NAME: TStringField;
    qKOL: TFloatField;
    qFROM_: TFloatField;
    qFROM_INST: TFloatField;
    qORGAN_NALN: TStringField;
    qAZS_ID: TFloatField;
    qAZS_INST: TFloatField;
    deFiltrR_Date: TDateEdit;
    lFromOrg: TLabel;
    sbClearFromOrg: TSpeedButton;
    ceFromOrg: TComboEdit;
    qNAL_T: TFloatField;
    qLOCK_: TFloatField;
    Label2: TLabel;
    Label7: TLabel;
    deFiltrToDate: TDateEdit;
    deFiltrFromDate: TDateEdit;
    pmAdd: TPopupMenu;
    miAddNew: TMenuItem;
    qF_DOC: TStringField;
    qCheck: TOilQuery;
    qNN_TYPE_ID: TFloatField;
    qNN_CAUSE_ID: TFloatField;
    qNN_TYPE_NAME: TStringField;
    qNN_CAUSE_NAME: TStringField;
    qFROM_DATE: TDateTimeField;
    qTO_DATE: TDateTimeField;
    rsbAdd: TRxSpeedButton;
    sbCause: TSpeedButton;
    LblCause: TLabel;
    miLoad: TMenuItem;
    OpenDialog: TOpenDialog;
    qFindOrg: TOilQuery;
    qFROM_NAME: TStringField;
    qAZS_NAME: TStringField;
    LblAZS: TLabel;
    ceAzs: TComboEdit;
    sbClearAZS: TSpeedButton;
    sbType: TSpeedButton;
    Label5: TLabel;
    edKP_Dog: TComboEdit;
    lKP_Dog: TLabel;
    miCorr: TMenuItem;
    qORGAN_OKPO: TStringField;
    qNN_ID: TFloatField;
    qNN_INST: TFloatField;
    qSUM_BASE: TFloatField;
    qSUM_20: TFloatField;
    qGRID_NUM: TStringField;
    qS_DATE: TDateTimeField;
    N3: TMenuItem;
    miVedomost: TMenuItem;
    miOther: TMenuItem;
    miNal: TMenuItem;
    miBank: TMenuItem;
    miOtherHelp: TMenuItem;
    miPrintNN: TMenuItem;
    miSeparator: TMenuItem;
    miPrintSaleBook: TMenuItem;
    miPrintAll: TMenuItem;
    miAccountPayable: TMenuItem;
    Label1: TLabel;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure ceClientButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);Override;
    procedure sbDelClick(Sender: TObject);
    procedure miPrintNNClick(Sender: TObject);
    procedure miPrintSaleBookClick(Sender: TObject);
    procedure ceFromOrgButtonClick(Sender: TObject);
    procedure sbClearFromOrgClick(Sender: TObject);
    procedure miAddNewClick(Sender: TObject);
    procedure miCreateNNByQuery(Sender: TObject);  //создаваемые через запросы
    procedure miCreateNNByTaxBill(Sender: TObject); //создаваемые через TaxBill
    procedure sbCauseClick(Sender: TObject);
    procedure miLoadClick(Sender: TObject);
    procedure ceAzsButtonClick(Sender: TObject);
    procedure sbClearAZSClick(Sender: TObject);
    procedure sbTypeClick(Sender: TObject);
    procedure edKP_DogButtonClick(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure miPrintAllClick(Sender: TObject);
  private
    TypeList, CauseList :string;
    IsPrintAll: boolean;
    TaxBillPrintForm: TfrmTaxBillPrintForm;
    function GetListSetHint(const p_table:string;var p_sb:TSpeedButton):string;
    Procedure LoadNN;
    Function IsNumExist(p_num:string;p_clause_sql:string=''):boolean;
    function GetCreateAzsBookForm(Sender: TObject):boolean;
  public
    sorg_id,sorg_inst:integer;
  end;

implementation

{$R *.DFM}
Uses
  Main,oilstd,progr, talonOut, ChooseOrg, UDbFunc,
  MoneyRef,Slbook, CreateAZSBook,ListSelect,uMessageDlgExt,PacketClass, DogRef, Exfunc;
var
  FSearchCause,FSearchType:integer;
  FSelectIds:string;

function TSlBookRefForm.GetListSetHint(const p_table:string;var p_sb:TSpeedButton):string;
var
  LSF:TListSelectForm;
  qq:TOilQuery;
  koma:char;
  SetAll:boolean;
  p_list:string;
begin
  SetAll:=True;
  Application.CreateForm(TListSelectForm,LSF);
  qq := TOilQuery.Create(q);
  If p_sb.Down then
  begin
    SetAll := False;
    p_sb.Hint:=TranslateText('Выбраны');

    LSF.TableName:='(select id,name_ as name,''Y'' as state '+
                   '   from '+p_table +
                   '  where id <> 111)';
    LSF.HasInst:=false;
    if LSF.ShowModal = mrOk then
    begin
      if LSF.List <>'()' then
      begin
        p_list:=LSF.List;
        qq.sql.text := 'select * from '+p_table+' where id in '+p_list;
        qq.open;
        koma := ' ';
        while not(qq.eof) do
        begin
          p_sb.Hint := p_sb.Hint + koma + '"'+qq['name_']+'"';
          koma := ',';
          qq.Next;
        end
      end
      Else
       SetAll:=True;
    end
    Else
      SetAll:=True;
  end;
  if SetAll then
  begin
    p_sb.Hint:=TranslateText('Выбраны все');
    p_sb.Down:=false;
    p_list:='';
  end;
  qq.free;
  result := p_list;
end;

Function TSlBookRefForm.IsNumExist(p_num:string;p_clause_sql:string=''):boolean;
var
  v_sql:string;
begin
  v_sql := 'select count(*)cnt from OIL_SALE_BOOK b '+
    ' where b.state =''Y'' '+
    '   and b.num = '''+p_num+'''';
  if p_clause_sql <> '' then
    v_sql := v_sql + ' and ' + p_clause_sql;
  if 0 < GetSqlValue(v_sql)
  then
    Result := True
  else
    Result := False;
end;

procedure TSlBookRefForm.LoadNN;
// Загрузка НН из файла сменного отчета
type
  TRecNN = ^PRecNN;
  PRecNN =
    record
      ID,CLIENTS_ID:integer;
      ORDERDATE:TDateTime;
      NNNUM,UMOVA,FORMA:String;
      SUMNOTNDS,ALLNDS,ALLSUM:real;
    end;
  TRecNNDet = ^PRecNNDet;
  PRecNNDet =
    record
      ID_NN,ID_MEAS,NP_ID:integer;
      NP_NAME,CHEKNUM:string; //бензин
      PRICE,NDS,PRICENOTNDS,ORDERAMOUNT,ORDERCOST,ORDERCOSTNOTNDS:real;
      ORDERDATE:TDateTime;
    end;
  TRecOrg = ^PRecOrg;
  PRecOrg =
    record
      ID,ID_OIL:integer;
      NAME,ADRESS,TEL,REESTRNUM,OKPO,NALOGNUM:string;
      OIL_ID,OIL_INST:integer;
    end;
  TCount =
    record
      Read,Exist,New,Error:integer;
    end;
const
  MsgRekv ='Найденно больше одной организации с данными реквизитами :'+#13#10+
           '%s код ОКПО:%s нал.номер:%s номер свидет-ва:%s' +#13#10+
           'Выбирите наиболее подходящую организацию :'+#13#10;
  MsgOrgRec  ='%d.%s,код ОКПО:%s нал.номер:%s номер свидет-ва:%s;'+#13#10;
  ErrOrgNotFound = 'Не найденно подходящей организации в справочнике ' +#13#10+ MsgOrgRec;
var
  RecNN:TRecNN;
  RecOrg:TRecOrg;
  RecNNDet:TRecNNDet;
  ListNoOrg,ListExistNN,ListExistNNDet,ListErrorNNDet,SList,NN_IdList: TStringList;
  Packet : TPacket;
  ListRecNN,ListRecNNDet,ListRecOrg:TList;
  AZS_ID,CurIndex,i,j,k,cntNewOrg,cntFiles:integer;
  cntOrg,cntNN,cntNNDet : TCount;
  TaxBill:TdmTaxBill;
  TransactionRun,HaveDet:boolean;
  //----------------------------------------------------------------------------
  Function TrimNol(p_Str:String):String;
  begin
    Result := p_Str;
    while Pos('0',Result) = 1 do
      Result := Copy(Result,2,Length(Result));
    if Length(Result)>0 then
      Result := p_Str;
  end;
  //----------------------------------------------------------------------------
  Function GetOrg(var ResID,ResInst:integer):boolean;
  // Функция производит поиск организации по коду ОКПО, налоговому номеру
  // и номеру свидетельства
  var
    MsgTxt:string;
    i,j,MsgResult:integer;
    btn:array of string;
    AddAutoFind:boolean;
  begin
    Result:= false;
    try
      if qFindOrg.Active then qFindOrg.Close;
      qFindOrg.ParamByName('OKPO').Value := Null;
      qFindOrg.ParamByName('Nal_num').AsString := RecOrg.NALOGNUM;
      qFindOrg.ParamByName('Svid_num').AsString := RecOrg.REESTRNUM;
      qFindOrg.ParamByName('inst').AsInteger := INST;
      _OpenQueryOra(qFindOrg);
      if qFindOrg.RecordCount = 1 then
      begin
        ResID := qFindOrg['ID'];
        ResInst := qFindOrg['INST'];
        Result:= True;
      end
      else if qFindOrg.RecordCount = 0 then
      begin
        Result := False;
      end
      else if qFindOrg.RecordCount > 1 then
      begin
       { //Смотрим по каждому реквизиту в отдельности
        qFindOrg.Close;
        qFindOrg.ParamByName('OKPO').AsString := RecOrg.OKPO;
        qFindOrg.ParamByName('Nal_num').Value := Null;
        qFindOrg.ParamByName('Svid_num').Value := Null;
        _OpenQueryOra(qFindOrg);
        if qFindOrg.RecordCount = 1 then
        begin
          ResID := qFindOrg['ID'];
          ResInst := qFindOrg['INST'];
          Result:= True;
          Exit;
        end;       }
        qFindOrg.Close;
        qFindOrg.ParamByName('OKPO').Value := Null;
        qFindOrg.ParamByName('Nal_num').AsString := RecOrg.NALOGNUM;
        qFindOrg.ParamByName('Svid_num').Value := Null;
        _OpenQueryOra(qFindOrg);
        if qFindOrg.RecordCount = 1 then
        begin
          ResID := qFindOrg['ID'];
          ResInst := qFindOrg['INST'];
          Result:= True;
          Exit;
        end;
        qFindOrg.Close;
        qFindOrg.ParamByName('OKPO').Value := Null;
        qFindOrg.ParamByName('Nal_num').Value := Null;
        qFindOrg.ParamByName('Svid_num').AsString := RecOrg.REESTRNUM;
        _OpenQueryOra(qFindOrg);
        if qFindOrg.RecordCount = 1 then
        begin
          ResID := qFindOrg['ID'];
          ResInst := qFindOrg['INST'];
          Result:= True;
          Exit;
        end;
        //исчем есть ли с нашим названием организация
        //      если есть то добавляем кнопку "Найти автоматоматом"
        //      если есть несколько то выдаем все которые есть
        //      если нет то тоже выдаем все которые есть
        qFindOrg.Close;
        qFindOrg.ParamByName('OKPO').Value := Null;
        qFindOrg.ParamByName('Nal_num').AsString := RecOrg.NALOGNUM;
        qFindOrg.ParamByName('Svid_num').AsString := RecOrg.REESTRNUM;
        qFindOrg.ParamByName('inst').AsInteger := INST;
        _OpenQueryOra(qFindOrg);
        qFindOrg.First;
        AddAutoFind:=false;
        while not(qFindOrg.eof) do
        begin
          if qFindOrg['name'] = RecOrg.Name then
            AddAutoFind:=True;
          qFindOrg.Next;
        end;
        MsgTxt := Format(MsgRekv,[RecOrg.NAME,
                                  RecOrg.OKPO,
                                  RecOrg.NALOGNUM,
                                  RecOrg.REESTRNUM]);
        i:=1;
        qFindOrg.First;
        while not(qFindOrg.eof) do
        begin
          MsgTxt := MsgTxt + Format(MsgOrgRec,[i,
                                               qFindOrg['name'],
                                               qFindOrg['okpo'],
                                               qFindOrg['nal_num'],
                                               qFindOrg['Svid_num']]);
          inc(i);
          qFindOrg.next;
        end;
        if AddAutoFind then
          SetLength(btn, i+1)
        else
          SetLength(btn, i);
        for j := 1 to i-1 do
          btn[j-1]:= IntToStr(j) ;
        btn[i-1] := TranslateText('Добавить новую') ;
        if AddAutoFind then
          btn[i] := TranslateText('Найти автоматом') ;
        MsgResult:= MessageDlgExt(MsgTxt,mtInformation,btn,0);
        if MsgResult in [i-1,0] then   //TranslateText('Добавить новую') 'X' ;
          Result := False
        Else if(MsgResult = i+1) then   // TranslateText('Найти автоматом') ;
        begin
          qFindOrg.First;
          while not(qFindOrg.eof) do
          begin
            if qFindOrg['name'] = RecOrg.Name then
            begin
              ResID := qFindOrg['id'] ;
              ResInst := qFindOrg['inst'];
              Result := True;
              break;
            end;
            qFindOrg.Next;
          end;
        End
        Else if(MsgResult >= 1)and(MsgResult < i-1) then  // '1','2','3','4','5'....
        begin
          qFindOrg.RecNo := MsgResult;
          ResID := qFindOrg['id'] ;
          ResInst := qFindOrg['inst'];
          Result := True;
        end;
      end;
      qFindOrg.Close;
    except on e:exception do
      MessageDlg('GetOrg : '+e.Message,mtError,[mbOk],0);
    end;
  end;
  //----------------------------------------------------------------------------
  Procedure RecoverCount(var cnt : TCount);
  // обнуляем счетчики
  begin
    cnt.Read:=0; cnt.Exist:=0; cnt.New:=0; cnt.Error:=0;
  end;
  procedure WRITE_LOG(s:string);
  begin
    exfunc.log('SALEBOOK_LoadNN.log',FormatDateTime('dd.mm.yyyy hh:nn:ss',now())+' '+s);
  end;
BEGIN
  TransactionRun := false;
  ListRecNN:=TList.Create;      ListRecNNDet:=TList.Create;
  ListRecOrg:=TList.Create;     ListNoOrg:=TStringList.Create;
  ListExistNN:=TStringList.Create;
  ListExistNNDet:=TStringList.Create; ListErrorNNDet:=TStringList.Create;
  SList := TStringList.Create;  NN_IdList := TStringList.Create;
  RecoverCount(cntOrg);  RecoverCount(cntNN);  RecoverCount(cntNNDet);
  Try
    if OpenDialog.InitialDir = '' then OpenDialog.InitialDir := ExtractFilePath(Application.ExeName);
    if OpenDialog.Execute then
    begin
      for cntFiles := 0 to OpenDialog.Files.Count - 1 do
      begin
        ListRecNN.Clear; ListRecOrg.Clear; ListExistNN.Clear;
        SList.Clear; ListRecNNDet.Clear; ListNoOrg.Clear; ListExistNNDet.Clear;
        ListErrorNNDet.Clear;
        Azs_id:=0;
        //ShowMessage(OpenDialog.Files.Text);
        //Читаем номер АЗС
        SList.LoadFromFile(OpenDialog.Files[cntFiles]);
        WRITE_LOG(OpenDialog.Files[cntFiles]);
        CurIndex:=0;
        while AZS_ID=0 do
          if (Pos('AZS:', SList[CurIndex]) = 1)and(Length(SList[CurIndex]) > 4) then
            AZS_ID:=1000000 + StrToInt(Copy(SList[CurIndex], Pos('AZS:',SList[CurIndex])+4, Length(SList[CurIndex])))
          else
            inc(CurIndex);
        WRITE_LOG(TranslateText(' АЗС - ')+IntToStr(AZS_ID));
        Packet := TPacket.Create(SList);
        OpenDialog.InitialDir := ExtractFilePath(OpenDialog.Files[cntFiles]);
        try
          begin
            try
              if Packet.OpenSection('CLIENTS_NN')>0 then
              while not(Packet.EndOfSection)do
              begin
                WRITE_LOG(TranslateText('Чтение организации (строка ')+IntToStr(Packet.CurrPacketLine)+')');
                New(RecOrg);
                RecOrg.ID := Packet.FieldByName('ID').AsInteger;
                RecOrg.NAME := Packet.FieldByName('NAME').AsString;
                RecOrg.ADRESS := Packet.FieldByName('ADRESS').AsString;
                RecOrg.TEL := Packet.FieldByName('TEL').AsString;
                RecOrg.OKPO := TrimNol(Packet.FieldByName('OKPO').AsString);
                RecOrg.REESTRNUM := TrimNol(Packet.FieldByName('REESTRNUM').AsString);
                RecOrg.NALOGNUM := TrimNol(Packet.FieldByName('NALOGNUM').AsString);
                if not(GetOrg(RecOrg.OIL_ID,RecOrg.OIL_INST)) then
                begin
                  RecOrg.OIL_ID := 0;
                  RecOrg.OIL_INST := 0;
                end
                else
                  inc(cntOrg.Exist);
                ListRecOrg.Add(RecOrg);
                inc(cntOrg.Read);
                Packet.NextRow;
              end;
            except on e:exception do
              raise Exception.Create(TranslateText('Чтение организации (строка ')+IntToStr(Packet.CurrPacketLine)+'): '+e.Message);
            end;
            try
            //Надо проверить на наличие таких номеров в
              if Packet.OpenSection('NN')>0 then
              while not(Packet.EndOfSection)do
              begin
                WRITE_LOG(TranslateText('Чтение НН (строка ')+IntToStr(Packet.CurrPacketLine)+')');
                New(RecNN);
                RecNN.ID := Packet.FieldByName('ID').AsInteger;
                RecNN.CLIENTS_ID := Packet.FieldByName('CLIENTS_ID').AsInteger;
                RecNN.ORDERDATE := StrToDateTime(Packet.FieldByName('ORDERDATE').AsString);
                RecNN.NNNUM := Packet.FieldByName('NNNUM').AsString;
                RecNN.NNNUM := Trim(Copy(RecNN.NNNUM,1,pos('/', RecNN.NNNUM)-1));
                RecNN.UMOVA := TranslateText('Фiскальний чек');
                RecNN.FORMA := Packet.FieldByName('FORMA').AsString;
                RecNN.SUMNOTNDS := TryVarToFloat(Packet.FieldByName('SUMNOTNDS').AsString);
                RecNN.ALLNDS := TryVarToFloat(Packet.FieldByName('ALLNDS').AsString);
                RecNN.ALLSUM := TryVarToFloat(Packet.FieldByName('ALLSUM').AsString);
                if(ListNoOrg.IndexOf(IntToStr(RecNN.CLIENTS_ID))=-1)then
                  if not(IsNumExist(RecNN.NNNUM,'nn_cause_id = 14'))  then
                  begin
                    ListRecNN.Add(RecNN);
                  end
                  else
                  begin
                    WRITE_LOG(TranslateText(' Номер НН уже существует (')+RecNN.NNNUM+')');
                    inc(cntNN.Exist);
                    ListExistNN.Add(IntToStr(RecNN.ID));
                  end
                else
                begin
                  WRITE_LOG(TranslateText(' Нет организации для НН'));
                  ListExistNN.Add(IntToStr(RecNN.ID));
                  inc(cntNN.Error);
                end;
                inc(cntNN.Read);
                Packet.NextRow;
              end;
            except on e:exception do
              raise Exception.Create(TranslateText('Чтение НН (строка ')+IntToStr(Packet.CurrPacketLine)+'): '+e.Message);
            end;
            try
              if Packet.OpenSection('NN_DETALS')>0 then
              while not(Packet.EndOfSection)do
              begin
                WRITE_LOG(TranslateText('Чтение детализации НН (строка ')+IntToStr(Packet.CurrPacketLine)+')');
                New(RecNNDet);
                RecNNDet.ID_NN := Packet.FieldByName('ID_NN').AsInteger;
                RecNNDet.ID_MEAS := Packet.FieldByName('ID_MEAS').AsInteger;
                RecNNDet.CHEKNUM := Packet.FieldByName('CHEKNUM').AsString;
                RecNNDet.NP_ID := Packet.FieldByName('FUEL_ID').AsInteger;
                RecNNDet.PRICE := TryVarToFloat(Packet.FieldByName('PRICE').AsString);
                RecNNDet.NDS := TryVarToFloat(Packet.FieldByName('NDS').AsString);
                RecNNDet.PRICENOTNDS := TryVarToFloat(Packet.FieldByName('PRICENOTNDS').AsString);
                RecNNDet.ORDERAMOUNT := TryVarToFloat(Packet.FieldByName('ORDERAMOUNT').AsString);
                RecNNDet.ORDERCOST := TryVarToFloat(Packet.FieldByName('ORDERCOST').AsString);
                RecNNDet.ORDERCOSTNOTNDS := TryVarToFloat(Packet.FieldByName('ORDERCOSTNOTNDS').AsString);
                RecNNDet.ORDERDATE := StrToDateTime(Packet.FieldByName('ORDERDATE').AsString);
                //1.проверка на наличие НН в "испорченых"
                //2.проверка на корректность НН т.е. цена*кол = сумма
                if(ListExistNN.IndexOf(IntToStr(RecNNDet.ID_NN))=-1) then
                  if ((RecNNDet.PRICE * RecNNDet.ORDERAMOUNT >= RecNNDet.ORDERCOST-1)
                        and
                      (RecNNDet.PRICE * RecNNDet.ORDERAMOUNT <= RecNNDet.ORDERCOST+1))
                  then
                    ListRecNNDet.Add(RecNNDet)
                  else
                  begin
                    WRITE_LOG(TranslateText(' Ошибочная детализация цена*количество<>сумме'));
                    ListErrorNNDet.Add(IntToStr(RecNNDet.ID_NN));
                    inc(cntNNDet.Error);
                  end
                else
                begin
                  WRITE_LOG(TranslateText(' Нет шапки для детализации'));
                  ListExistNNDet.Add(IntToStr(RecNNDet.ID_NN));
                  inc(cntNNDet.exist);
                end;
                inc(cntNNDet.Read);
                Packet.NextRow;
              end;
            except on e:exception do
              raise Exception.Create(TranslateText('Чтение детализации НН (строка ')+IntToStr(Packet.CurrPacketLine)+'): '+e.Message);
            end;
          end;
          StartSql;
          TransactionRun :=True;
          cntNewOrg := 0;
          WRITE_LOG(TranslateText('Пакет прочитан, начинаем создание'));
          for i:= 0 to ListRecOrg.Count - 1 do
          // Создание организаций
          begin
            try
              WRITE_LOG(TranslateText('Создаем организацию №')+IntToStr(i+1));
              RecOrg:=ListRecOrg.Items[i];
              if(RecOrg.OIL_ID=0)and(RecOrg.OIL_INST=0)then
              begin
                RecOrg.OIL_ID :=GetSeqNextVal('S_OIL_ORG');
                RecOrg.OIL_INST :=INST;
                StartSqlOra;
                InsOrUpdRecord('OIL_ORG',
                  ['ID',        RecOrg.OIL_ID,
                   'STATE',     'Y',
                   'INST',      RecOrg.OIL_INST,
                   'NAME',      Trim(RecOrg.NAME),
                   'FACE',      0,
                   'ID_NUM',    RecOrg.OKPO,
                   'NAL_NUM',   RecOrg.NALOGNUM,
                   'SVID_NUM',  RecOrg.REESTRNUM,
                   'ORG_TYPE',  1
                   ]);
                CommitSqlOra;
                inc(cntOrg.New);
              end;
            except on e:exception do
              raise Exception.create(TranslateText('Создание организации : ')+e.Message);
            end;
            try
              for j:= 0 to ListRecNN.Count - 1 do
              // Создание НН
              begin
                RecNN:=ListRecNN.Items[j];
                WRITE_LOG(TranslateText('Создаем НН №')+IntToStr(j+1));
                if RecNN.CLIENTS_ID = RecOrg.ID then
                begin
                  TaxBill := TdmTaxBill.Create(RecOrg.OIL_ID,RecOrg.OIL_INST);
                  TaxBill.Options.FromAzsId:=AZS_ID;
                  TaxBill.Options.FromAzsInst:=AZS_ID;
                  TaxBill.Options.FromId:=AZS_ID;
                  TaxBill.Options.FromInst:=AZS_ID;
                  TaxBill.Options.OperName := RecNN.FORMA;
                  TaxBill.Options.Num :=  RecNN.NNNUM;
                  TaxBill.Options.ByDogName := RecNN.UMOVA;
                  TaxBill.Options.TovarType := ttNpGroup;
                  TaxBill.Options.IsCustomPrintSettings := true;
                  TaxBill.Options.Date := DateToStr(RecNN.ORDERDATE);
                  TaxBill.Options.OIL_NN_Type := 2;
                  TaxBill.Options.OIL_NN_Cause := 14;
                  HaveDet:= False ;
                  for k := 0 to ListRecNNDet.Count - 1 do
                  begin
                    RecNNDet := ListRecNNDet.Items[k];
                    if RecNN.ID = RecNNDet.ID_NN then
                    begin
                      WRITE_LOG(TranslateText('Добавляем детализацию НН №')+IntToStr(k+1));
                      TaxBill.AddPosition(
                        RecNNDet.NP_ID,
                        DIM_LITR,
                        DateToStr(RecNNDet.ORDERDATE),
                        RecNNDet.ORDERAMOUNT,
                        RecNNDet.PRICE,
                        RecNNDet.CHEKNUM
                        );
                      inc(cntNNDet.New);
                      HaveDet:=true;
                    end;
                  end;
                  // 1. нет детализация вообще
                  // 2. детализация есть и не находиться в "испорченых"
                  if HaveDet and (ListErrorNNDet.IndexOf(IntToStr(RecNN.ID))=-1) then
                  begin
                    TaxBill.Make(False);
                    NN_IdList.Add(IntToStr(TaxBill.Options.TaxBillId)+',');
                    inc(cntNN.New);
                    WRITE_LOG(TranslateText(' НН создана'));
                  end
                  else
                  begin
                    WRITE_LOG(TranslateText(' НН не имеет корректной детализации, НН не создана'));
                    inc(cntNN.Error);
                  end;
                  TaxBill.Free;
                end;
              end;
            except on e:exception do
               raise Exception.Create(TranslateText('Создание НН : ')+e.Message);
            end;
          end;
          CommitSql;
          Packet.Free;
        except on e:exception do
          begin
            if TransactionRun then
            begin
              RollBackSqlOra;
              RollBackSql;
              Packet.Free;
            end;
            raise Exception.Create(TranslateText('ОШИБКА LoadNN : ')+e.Message);
            WRITE_LOG(TranslateText('ОШИБКА LoadNN : ')+e.Message);
          end;
        end;
        {cntOrg.Read := cntOrg.Read + ListRecOrg.Count;
        cntOrg.Exist := cntOrg.Exist + ListRecOrg.Count-cntNewOrg;
        cntOrg.New := cntOrg.New + cntNewOrg;         }
      end;
      case MessageDlgExt(TranslateText('<Статистика импорта НН>')+#13+#13+
        TranslateText('Организации в пакете') +#13+
        TranslateText('  всего :                     ')+IntToStr(cntOrg.Read)+#13+
        TranslateText('  импортировано :    ') + IntToStr(cntOrg.New)+#13+
        TranslateText('  уже существует :    ')+IntToStr(cntOrg.Exist)+#13+
        TranslateText('Налоговые в пакете') +#13+
        TranslateText('  всего :                     ')+IntToStr(cntNN.Read)+#13+
        TranslateText('  импортировано :    ')+IntToStr(cntNN.New)+#13+
        TranslateText('  уже существует :    ')+IntToStr(cntNN.Exist)+#13+
        TranslateText('  ошибочные :            ') +IntToStr(cntNN.Error)+#13+
        TranslateText('Детализация налоговых в пакете')+#13+
        TranslateText('  всего :                     ')+IntToStr(cntNNDet.Read)+#13+
        TranslateText('  импортировано :    ')+IntToStr(cntNNDet.New)+#13+
//        TranslateText('  уже существует :    ')+IntToStr(cntNNDet.Exist)+#13+
        TranslateText('  ошибочные :            ') +IntToStr(cntNNDet.Error),
        mtInformation,['Ok',TranslateText('Показать импорт')],0)
      of
        0,1:;
        2:
        begin
          CauseList := '(14)';
          if NN_IdList.Text <> '' then
            FSelectIds := Copy(NN_IdList.Text,1,Length(NN_IdList.Text)-3);
          deFiltrFromDate.Date:= 0;
          deFiltrToDate.Date := 0;
          bbSearchClick(nil);
        end;
      end;//case msg
    end;//open dialog Execute
  finally
    ListRecNN.free;
    ListRecNNDet.free;
    ListRecOrg.free;
    ListNoOrg.free;
    ListExistNN.free;
    ListErrorNNDet.free;
    ListExistNNDet.free;
    SList.Free;
    NN_IdList.Free;
  end;
END;

procedure TSlBookRefForm.FormCreate(Sender: TObject);
// Инициализация начальными значениями, вызов формирования списка.
var
  Day,Month,Year:word;
begin inherited;
  IsPrintAll := false;
  sorg_id:=-1;
  sorg_inst:=-1;
  ceClient.text:='';
  deFiltrToDate.Date:=Date;
  DecodeDate(Date,Year,Month,Day);
  deFiltrFromDate.Date:=EncodeDate(Year,Month,1);
  ceFromOrg.Text:=MAIN_ORG.NAME;
  ceFromOrg.Tag:=MAIN_ORG.INST;
  lFromOrg.Tag:=MAIN_ORG.INST;
  bbSearch.OnClick(nil);
end;

procedure TSlBookRefForm.bbSearchClick(Sender: TObject);
begin
  edKP_Dog.Enabled := not sbSpeedUp.Down;
  if not edKP_Dog.Enabled then
    edKP_Dog.Text:='';
    
  DefineRepDates(deFiltrFromDate.date, deFiltrToDate.date);
  if(edKP_Dog.Enabled)then
    q.sql.Text := 'select distinct * from v_oil_sale_book_dog where -1=-1 '
  else
    q.sql.Text := 'select distinct * from v_oil_sale_book where -1=-1 ';
  q.close;
  // Номер НН
  if eFiltrNN.text<>'' then
    q.sql.Add('AND num like ''%'+eFiltrNN.text+'%''');
  // Дата выписки От
  if deFiltrFromDate.date<>0 then
    q.sql.Add('AND s_date>=to_date('''+FormatDateTime2('dd.mm.yyyy',deFiltrFromDate.date)+''',''DD.MM.YYYY'')');
  // Дата выписки По
  if deFiltrToDate.date<>0 then
    q.sql.Add('AND s_date<=to_date('''+FormatDateTime2('dd.mm.yyyy',deFiltrToDate.date)+''',''DD.MM.YYYY'')');
  // Дата расчета
  if deFiltrR_Date.date<>0 then
    q.sql.Add('AND r_date=to_date('''+FormatDateTime2('dd.mm.yyyy',deFiltrR_Date.date)+''',''DD.MM.YYYY'')');
  // Клиент
  if ceClient.text<>'' then
    q.sql.Add('AND organ='+IntToStr(sorg_id)+' and organ_inst='+IntToStr(sorg_inst));
  // Поставщик
  if ceFromOrg.text<>'' then
    q.sql.Add('AND From_='+IntToStr(ceFromOrg.Tag)+' and From_inst='+IntToStr(lFromOrg.Tag));
  // Поставщик АЗС
  if ceAZS.text<>'' then
    q.sql.Add('AND AZS_ID='+IntToStr(ceAZS.Tag)+' and AZS_INST='+IntToStr(LblAZS.Tag));
  //Источник НН
  If FSearchCause <> 0 then
    q.sql.Add('AND NN_CAUSE_ID = '+IntToStr(FSearchCause))
  Else if CauseList ='()' then
    q.sql.Add('/*cause_id*/')
  Else if CauseList <> '' then
    q.sql.Add('AND (NN_CAUSE_ID in '+CauseList+')');
  //Тип НН
  If FSearchType <> 0 then
    q.sql.Add('AND NN_TYPE_ID = '+IntToStr(FSearchType))
  Else if TypeList ='()' then
  begin
    q.sql.Add('/*TYPE_id*/');
    FSearchType := 0;
  end
  Else if TypeList <> '' then
  begin
    q.sql.Add('AND (NN_TYPE_ID in '+TypeList+')');
    FSearchType := 0;
  end
  Else
  begin
    q.sql.Add('/*Type_id*/');
    FSearchType := 0;
  end;
  //Выборка по идам
  If FSelectIds <> '' then
  begin
    q.sql.Add(' AND id in ('+FSelectIds+') ');
    FSelectIds := '';
  end;
  if(edKP_Dog.Enabled)and(edKP_Dog.Text<>'')then
    q.sql.Add('AND (DOG_ID ='+IntToStr(edKP_Dog.Tag)+' AND DOG_INST = '+IntToStr(lKP_Dog.Tag)+')');
  q.sql.Add(' ORDER BY s_date desc,grid_num');
  q.DisableControls;
  _OpenQuery(q);
  q.EnableControls;
  FSearchCause := 0;
  FSearchType := 0;
  DefineRepDates(0,0);
end;

procedure TSlBookRefForm.ceClientButtonClick(Sender: TObject);
// Выбор клиента для поиска
var vId,vInst:integer;
    vName:string;
begin
  if ChooseOrg.CaptureOrg(3,Main_id,Inst,'yyy',vId,vInst,vName) then
  begin
    ceClient.Text:=vName;
    SOrg_Id:=vId;
    Sorg_Inst:=vInst;
  end;
end;

procedure TSlBookRefForm.SpeedButton1Click(Sender: TObject);
// Очистка клиента для поиска
begin
 sorg_id:=-1;
 sorg_inst:=-1;
 ceClient.text:='';
end;

procedure TSlBookRefForm.bbClearClick(Sender: TObject);
// Очистка всех полей поиска
begin
 eFiltrNN.text:='';
 deFiltrFromDate.Date:=Now-31;
 deFiltrR_Date.text:='';
 sorg_id:=-1;
 sorg_inst:=-1;
 ceClient.text:='';
 TypeList := '';
 CauseList := '';
 sbCause.Down := false;
end;

procedure TSlBookRefForm.sbEditClick(Sender: TObject);
// Открывание существующей НН на редактирование
Var NNNew:TSlBookForm;
    curr_id, curr_inst: integer;
begin
  If (q.active) and (q.RecordCount > 0) Then
  Begin
    if q.FieldByName('inst').AsInteger=INST_FIL then
      raise exception.create(TranslateText('Нельзя редактирвоать накладную созданную на Филиале!'));
    curr_id:= qID.AsInteger;
    curr_inst:= qINST.AsInteger;
    if (q.FieldByName('nal_t').AsInteger = 1111) then
    begin
    end
    else// if q.fieldByName('nal_t').AsString <> 14
    begin
      NNNew:=TSlBookForm.Create(Application);
      try
        NNNew.nn_Id:=qId.AsInteger;
        NNNew.nn_INST:=qInst.AsInteger;
        if qInst.asInteger = INST then
          NNNew.bbOk.Tag := 0
        else
          NNNew.bbOk.Tag := 1; // "ОK" отключаеться
        if q.FieldByName('nn_type_id').AsInteger = 3 then
        begin
          if q.FieldByName('s_date').AsDateTime < GetSQLValue(format(' select nvl(max(s_date),to_date(''01.01.1990'',''DD.MM.YYYY'')) date_ from oil_sale_book where state =''Y'' and ((nn_id=%d and nn_inst=%d)or(id=%0:d and inst=%1:d)) and not(id=%d and inst=%d)',
            [q.FieldByName('nn_id').AsInteger,
             q.FieldByName('nn_inst').AsInteger,
             q.FieldByName('id').AsInteger,
             q.FieldByName('inst').AsInteger
             ]))
          then
            NNNew.bbOk.Tag := 1; // "ОK" отключаеться
        end;
        NNNew.deTaxDate.Enabled := (qInst.asInteger = INST);
        NNNew.deTaxDate.Enabled := qS_DATE.AsDateTime > StrToDate(CLOSE_DATE);
        if NNNew.ShowModal = MrOk then
        begin
          q.close;
          q.open;
          q.Locate('id;inst', VarArrayOf([curr_id, curr_inst]), []);
        end;
      finally
        NNNew.Free;
      end;
    end;
  end;
end;

procedure TSlBookRefForm.sbDelClick(Sender: TObject);
// Удаление налоговой накладной
const
  cSQLlast_date ='select decode(max(todate),null,to_date(''01.01.1990'',''DD.MM.YYYY''),max(todate))max_date  '
    +'  from v_oil_sale_book'
    +' where nn_cause_id = %d                                                     '
    +'   and todate between trunc(to_date(''%s'',''DD.MM.YYYY''),''MM'')         '
    +'   and trunc(add_months(to_date(''%1:s'',''DD.MM.YYYY''),1),''MM'')-1       '
    +'   and organ = %d                                                           '
    +'   and organ_inst = %d                                                      '
    +'   and not(id = %d and inst = %d)                                           ';
var
  TaxBill : TdmTaxBill;
  max_date :TDateTime;
  v_date :string;
begin
 If (q.Active) and not(q.IsEmpty) Then
 Begin
  if qInst.AsInteger <> Inst then
    Begin
      MessageDlg(TranslateText('Нельзя удалить запись, созданную другой организацией!'),
        mtError, [mbOk], 0);
      Exit;
    end;
  if qS_Date.AsDateTime <= StrToDate(Close_Date) then
      Begin
        MessageDlg(TranslateText('Эта накладная из закрытого периода и не может быть удалена !'),
          mtError, [mbOk], 0);
        Exit;
      end;
  //Проверка хронологии корректировок
  if qNN_TYPE_ID.AsInteger = 3 then
  begin
    max_date := GetSQLValue(Format('select nvl(max(s_date),to_date(''01.01.1990'',''DD.MM.YYYY'')) from oil_sale_book where nn_cause_id=3 and nn_id=%d and nn_inst=%d and state=''Y'' ',
      [qNN_Id.AsInteger,
       qNN_Inst.AsInteger]));
    if max_date > q.FieldByName('s_date').AsDateTime then
    begin
      MessageDlg(TranslateText('После этой корректировки создана другая корректировка - удалите все корректировки созданные позже !'),
        mtError, [mbOk], 0);
      Exit;
    end;
  end
  else
  begin
    if 0<GetSQLValue(format('select count(*) from oil_sale_book where state = ''Y'' and nn_type_id =3 and nn_id =%d and nn_inst = %d',
      [q.FieldByName('id').AsInteger,
       q.FieldByName('inst').AsInteger])) then
    begin
      MessageDlg(TranslateText('На эту НН создана корректировка - удалите корректировки !'),
        mtError, [mbOk], 0);
      Exit;
    end;
  end;

  if messagedlg(TranslateText('Вы действительно хотите удалить эту запись?'),
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
  try
   StartSQL;
   // Удаляем налоговую
   if(q.FieldByName('NN_CAUSE_ID').AsInteger = 14)then
   //налоговые, номера которых не должны резерв
     SetState('OIL_SALE_BOOK',
       q.FieldByName('id').AsInteger,
       q.FieldByName('inst').AsInteger,
       'N')
   else
   begin
     if (qNN_CAUSE_ID.AsInteger in [11,12]) and (qTO_DATE.AsDateTime <> 0)then
     // проверка на наличие автосформированных НН позже в этом же месяце
     begin
       DateTimeToString(v_date,'dd.mm.yyyy', qTO_DATE.AsDateTime);
       max_date := GetSQLValue(
         format(
           cSQLlast_date,
             [qNN_CAUSE_ID.AsInteger,
              v_date,
              qORGAN.AsInteger,
              qORGAN_INST.AsInteger,
              qID.AsInteger,
              qINST.AsInteger
             ]
           )
         );
       if qTO_DATE.AsDateTime < max_date then
       begin
         ShowMessage(TranslateText('Нельзя удалить НН сформированою автоматически, если есть НН созданная в этом же месяце позже !'));
         exit;
       end;
     end;
     TaxBill:= TdmTaxBill.Create;
     try
       if qNN_TYPE_ID.AsInteger = 3 then
         TaxBill.DeleteSBRecordsCorr(q.FieldByName('Id').AsInteger,
                                   q.FieldByName('Inst').AsInteger)
       else
         TaxBill.DeleteSBRecords10(q.FieldByName('Id').AsInteger,
                                   q.FieldByName('Inst').AsInteger);
     finally
       TaxBill.Free;
     end;
     if GetSQLValue('select count(*) from oil_rashod where nn_id='+
          q.fieldbyname('id').asstring+' and nn_inst = '+
          q.fieldbyname('inst').asstring ) > 0 then
     begin
       _ExecSql('update oil_rashod set nn_id=null, nn_inst=null where nn_id='+
         q.fieldbyname('id').asstring+' and nn_inst='+q.fieldbyname('inst').asstring);
     end;
   end;
   CommitSQL;
   q.close;
   q.open;
  except on e:exception do
   begin
    RollBackSQL;
    MessageDlg(TranslateText('Ошибка : Удаление записи не прошло ! ') +e.message, mtError,[mbOk],0);
   end;
  end;
  end;
 end;
end;

procedure TSlBookRefForm.miPrintNNClick(Sender: TObject);
// Печать налоговой накладной
Type
  TScheme = (tLS, tEK, tTalon, tService, tNB, tCheck,tNull);
var
  TalonOutRefForm : TTalonOutRefForm;
  TaxBill : TdmTaxBill;
  f_doc, koma : string;
  //----------------------------------------------------------------------------
  function GetFDoc_Check:string;
  begin
   //формируем строку "Умова продажу"
    if qCheck.Active then qCheck.Close;
    qCheck.ParamByName('nn_id').AsInteger := q.FieldByName('id').AsInteger;
    qCheck.ParamByName('nn_inst').AsInteger := q.FieldByName('inst').AsInteger;
    qCheck.Open;
    koma := ' №';
    f_doc := TranslateText('Фiскальний чек');
    while not(qCheck.Eof) do
    Begin
      f_doc := f_doc + koma + qCheck.FieldByName('det_text').AsString+
        '('+qCheck.FieldByName('det_date').AsString+')';
      koma := ', ';
      qCheck.Next;
    End;
    qCheck.Close;
    Result := f_doc;
  end;
  //----------------------------------------------------------------------------
  Procedure GetNNByCause();
  begin
    Try
      TaxBill := TdmTaxBill.Create(1,1);
      TaxBill.Options.ByDogName := GetFDoc_Check();
      if IsPrintAll then
      begin
        TaxBill.Options.IsCustomPrintSettings := true;
        TaxBill.Options.LoadPrintForm(TaxBillPrintForm);
      end;
      TaxBill.GetTaxBillByNN(
        q.FieldByName('id').AsInteger,
        q.FieldByName('inst').AsInteger
        );
    Finally
      TaxBill.Free;
    End;
  end;
  //----------------------------------------------------------------------------
begin
   If not q.Active Then Exit;
   if q.IsEmpty then Exit;
   if q.FieldByName('NN_CAUSE_ID').AsInteger <> 0 then
     if not(TaxBillPrint.IsTBHaveDetal(qId.AsInteger, qInst.AsInteger))then
       case q.FieldByName('NAL_T').AsInteger of
         1,3,4,5:
         begin
           if TaxBillPrint.IsTBHaveDetal(qId.AsInteger, qInst.AsInteger)then
             GetNNByCause()
           else
             MainForm.PrintNN(qId.AsInteger, qInst.AsInteger)
         end;
         2:
         begin
           Application.CreateForm(TTalonOutRefForm, TalonOutRefForm);
           TalonOutRefForm.bbClearClick(nil);
           TalonOutRefForm.bbSearchClick(nil);
           TalonOutRefForm.Visible := False;
           TalonOutRefForm.q.First;
           // Locate тут не работает потом перебераем кверю вручную
           while not((TalonOutRefForm.q.Eof)or
             ((qId.AsInteger = TalonOutRefForm.q.FieldByName('NN_Id').AsInteger)and
             (qInst.AsInteger = TalonOutRefForm.q.FieldByName('NN_Inst').AsInteger)))
           do TalonOutRefForm.q.Next;
           TalonOutRefForm.NNNClick(Sender);
           TalonOutRefForm.Close;
         end;
         Else if IsTBHaveDetal(qId.AsInteger, qInst.AsInteger)then
           GetNNByCause()
         Else
           MainForm.PrintNN(qId.AsInteger, qInst.AsInteger);
       end//Case Nal_t
     Else if IsTBHaveDetal(qId.AsInteger, qInst.AsInteger)then
       GetNNByCause();
end;

procedure TSlBookRefForm.miPrintSaleBookClick(Sender: TObject);
begin
  // Печать книги учета продаж
  MainForm.N34Click(Sender);
end;

procedure TSlBookRefForm.ceFromOrgButtonClick(Sender: TObject);
// Выбор клиента для поиска
var
  vId,vInst:integer;
  vName:string;
begin
  if ChooseOrg.CaptureOrg(1,Main_id,Inst,'yyy',vId,vInst,vName) then
  begin
    ceFromOrg.Text:=vName;
    ceFromOrg.Tag:=vId;
    lFromOrg.Tag:=vInst;
  end;
end;

procedure TSlBookRefForm.sbClearFromOrgClick(Sender: TObject);
begin
  ceFromOrg.Text := '';
  ceFromOrg.Tag := 0;
  lFromOrg.Tag := 0;
end;

procedure TSlBookRefForm.miAddNewClick(Sender: TObject);
Var
  NN:TSlBookForm;
begin
  NN:=TSlBookForm.Create(Application);
  try
    nn.nn_id := -1;
    nn.nn_inst := -1;
    nn.NN_ID_FOR_CORR := -1;
    nn.NN_INST_FOR_CORR := -1;
    // Корректировка
    if TMenuItem(Sender).name = 'miCorr' then
    begin
      if not(q.Active)or(q.IsEmpty)then
      begin
        MessageDlg(TranslateText('Не выбрана НН для корректировки !'),mtInformation,[mbOk],0);
        exit;
      end;
      if 0=GetSQLValue(format(
        'select count(*) cnt from oil_sale_book_det where state =''Y'' and nn_id = %d and nn_inst = %d',
        [q.FieldByName('id').AsInteger,
         q.FieldByName('inst').AsInteger]))
      then
      begin
        MessageDlg(TranslateText('Нельзя создать корректировку для выбраной НН !'),mtInformation,[mbOk],0);
        exit;
      end;
      // если выбрана корректировка, то делаем для привязку к НН той корректировки
      if q.FieldByName('nn_type_id').AsInteger = 3 then
      begin
        nn.NN_ID_FOR_CORR := q.FieldByName('nn_id').AsInteger;
        nn.NN_INST_FOR_CORR := q.FieldByName('nn_inst').AsInteger;
        nn.NN_NUM_FOR_CORR := copy(
          q.FieldByName('num').AsString,
          pos('/',q.FieldByName('num').AsString)+1,
          Length(q.FieldByName('num').AsString));
      end
      else
      begin
        nn.NN_ID_FOR_CORR := q.FieldByName('id').AsInteger;
        nn.NN_INST_FOR_CORR := q.FieldByName('inst').AsInteger;
        nn.NN_NUM_FOR_CORR := q.FieldByName('num').AsString;
      end;
    end;
    NN.ShowModal;
    if nn.modalresult=MrOk then
    begin
      q.close;
      q.open;
    end;
  finally
    NN.Free;
  end;
end;

function TSlBookRefForm.GetCreateAzsBookForm(Sender: TObject):boolean;
begin
  Result:=True;
  try
    Application.CreateForm(TCreateAZSBookForm, CreateAZSBookForm);
    CreateAZSBOOKForm.FCause_id := TMenuItem(Sender).Tag;
    case CreateAZSBOOKForm.FCause_id of
      12://Прочий
        CreateAZSBOOKForm.Caption := TranslateText('Выписка НН с АЗС за "прочий отпуск"');
      11://Ведомость
        CreateAZSBOOKForm.Caption := TranslateText('Выписка НН с АЗС по ведомости');
      10://нал.
        CreateAZSBOOKForm.Caption := TranslateText('Выписка НН с АЗС за наличные');
      22://банк.карты
        CreateAZSBOOKForm.Caption := TranslateText('Выписка НН с АЗС по банковским картам');
      23:
        CreateAZSBOOKForm.Caption := TranslateText('Выписка НН с АЗС за "прочий отпуск" (Спонсорская помощь)');
      25:
        CreateAZSBOOKForm.Caption := TranslateText('Выписка НН на кредиторскую задолженость');
      else
        CreateAZSBOOKForm.Caption := TranslateText('Выписка НН с АЗС ???');
    end;//case
  except
    Result:=False;
  end;
end;

procedure TSlBookRefForm.miCreateNNByQuery(Sender: TObject);
begin
  if Self.GetCreateAzsBookForm(Sender) then;
  try
    CreateAZSBOOKForm.deVipiska.ReadOnly := false;
    CreateAZSBOOKForm.ShowModal;

    bbClearClick(Sender);

    if CreateAZSBOOKForm.ModalResult = mrOk then
    begin
      deFiltrFromDate.Date := CreateAZSBOOKForm.deVipiska.Date;
      deFiltrToDate.Date := CreateAZSBOOKForm.deVipiska.Date;

      ceFromOrg.Tag := CreateAZSBOOKForm.ceFromOrg.Tag;
      lFromOrg.Tag := CreateAZSBOOKForm.LFrom.Tag;
      ceFromOrg.Text := CreateAZSBOOKForm.ceFromOrg.Text;

      if CreateAZSBOOKForm.ChBKlient.Checked = false then
      begin
        SOrg_Id := CreateAZSBOOKForm.ceKlient.Tag;
        Sorg_Inst := CreateAZSBOOKForm.LKlient.Tag;
        ceClient.Text := CreateAZSBOOKForm.ceKlient.Text;
      end;
      FSearchCause := CreateAZSBOOKForm.FCause_id;
      bbSearchClick(Sender);
    end;
  finally
    CreateAZSBookForm.free;
  end;
end;
//==============================================================================
procedure TSlBookRefForm.miCreateNNByTaxBill(Sender: TObject);
begin
  if Self.GetCreateAzsBookForm(Sender) then;
  try
    CreateAZSBOOKForm.deVipiska.Date := 0;
    CreateAZSBOOKForm.deVipiska.Enabled := False;
    CreateAZSBOOKForm.seDateMotion.Visible := True;
    CreateAZSBOOKForm.cbGetDateFromDR.Visible := True;
    CreateAZSBOOKForm.cbGetDateFromDR.Checked := False;
    CreateAZSBOOKForm.cbGetDateFromDR.OnClick(nil);
    CreateAZSBOOKForm.LblDateMotion1.Visible := true;
    CreateAZSBOOKForm.LblDateMotion2.Visible := true;
    CreateAZSBOOKForm.ChBAZS.Checked := True;
    CreateAZSBOOKForm.ChBAZS.OnClick(nil);
    CreateAZSBOOKForm.ChBKlient.Checked := True;
    CreateAZSBOOKForm.ChBKlient.OnClick(nil);
    CreateAZSBOOKForm.ChBKlient.Enabled := False;
    CreateAZSBOOKForm.ShowModal;
    bbClearClick(Sender);
    if CreateAZSBOOKForm.ModalResult = mrOk then
    begin
      //Выставляем дату на фильтрах
      if CreateAZSBOOKForm.cbGetDateFromDR.Checked then
      begin
        deFiltrFromDate.Date := CreateAZSBOOKForm.deFromDate.Date;
        deFiltrToDate.Date := CreateAZSBOOKForm.deToDate.Date;
      end
      else
      begin
        deFiltrFromDate.Date := CreateAZSBOOKForm.deVipiska.Date;
        deFiltrToDate.Date := CreateAZSBOOKForm.deVipiska.Date;
      end;
      //выставляем организацию "от кого"
      ceFromOrg.Tag := CreateAZSBOOKForm.ceFromOrg.Tag;
      lFromOrg.Tag := CreateAZSBOOKForm.LFrom.Tag;
      ceFromOrg.Text := CreateAZSBOOKForm.ceFromOrg.Text;
      ceClient.Text := '';
      FSearchCause := CreateAZSBOOKForm.FCause_id;
      bbSearchClick(Sender);
    end;
  finally
    CreateAZSBookForm.free;
  end;
end;

procedure TSlBookRefForm.miLoadClick(Sender: TObject);
begin
  try
    LoadNN;
  except on e:exception do
    MessageDlg(E.Message,mtError,[mbOk],0);
  end;
end;

procedure TSlBookRefForm.ceAzsButtonClick(Sender: TObject);
// Выбор АЗС для поиска
var
  vId,vInst:integer;
  vName:string;
begin
  if ChooseOrg.CaptureOrg(2,Main_id,Inst,'yyy',vId,vInst,vName) then
  begin
    ceAzs.Text:=vName;
    ceAzs.Tag:=vId;
    LblAzs.Tag:=vInst;
  end;
end;

procedure TSlBookRefForm.sbClearAZSClick(Sender: TObject);
begin
  ceAZS.Text := '';
  ceAZS.Tag := 0;
  LblAZS.Tag := 0;
end;


procedure TSlBookRefForm.sbCauseClick(Sender: TObject);
// Выбор истоков НН
begin
  inherited;
  CauseList := GetListSetHint('OIL_NN_CAUSE',sbCause);
  FSearchCause := 0;
end;

procedure TSlBookRefForm.sbTypeClick(Sender: TObject);
// Выбор типов НН
begin
  inherited;
  TypeList := GetListSetHint('OIL_NN_TYPE',sbType);
  FSearchType := 0;
end;

procedure TSlBookRefForm.edKP_DogButtonClick(Sender: TObject);
// Выбор номера договора
Var
  DogRefForm : TDogRefForm;
begin
  Application.CreateForm(TDogRefForm, DogRefForm);
  DogRefForm.ShowModal;
  If DogRefForm.ModalResult = mrOk Then
  Begin
    edKP_Dog.Text   := DogRefForm.qDog.AsString;
    edKP_Dog.Tag    := DogRefForm.qId.AsInteger;
    lKP_Dog.Tag     := DogRefForm.qInst.AsInteger;
  End;
  DogRefForm.Free;
end;

procedure TSlBookRefForm.dsDataChange(Sender: TObject; Field: TField);
var s: string;
begin
  inherited;
  s:=qDetail.BaseSql;
  if q.Active and (q.RecordCount>0) and (q['inst']=INST_FIL) then begin
    ReplaceAllSubstr(s,'OIL_SALE_BOOK','ANDRIY.OIL_SALE_BOOK');
    ReplaceAllSubstr(s,'OIL_SALE_BOOK_DET','ANDRIY.OIL_SALE_BOOK_DET');
  end;
  qDetail.SQL.Text:=s;
  qDetail.Open;
end;

procedure TSlBookRefForm.miPrintAllClick(Sender: TObject);
begin
  if q.Active then
  begin
    TaxBillPrintForm := TfrmTaxBillPrintForm.Create(saLoad);
    TaxBillPrintForm.pnlTop.Visible := false;
    TaxBillPrintForm.EnableComponents(True);
    TaxBillPrintForm.ShowModal;    
    try
      IsPrintAll := true;
      q.DisableControls;
      q.First;
      while not(q.eof) do
      begin
        miPrintNNClick(nil);
        q.Next;
      end;
    finally
      TaxBillPrintForm.Free;
      IsPrintAll := False;
      q.EnableControls;
    end;
  end;
end;

end.
