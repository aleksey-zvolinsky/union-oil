{*****************************************************************************}
{  Предназначение : используеться для загрузки балансов из 1C, все поля       }
{                шифруються и в зашифрованом виде передаються в Большой Ойл.  }
{                                                                             }
{  Модифицирован : 20 августа 2004 года                                       }
{*****************************************************************************}

unit OneSImport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Grids, DBGrids, Buttons, MemDS, DBAccess, Ora,
  Mask, ToolEdit, ExtCtrls, ComCtrls, uCommonForm,uOilQuery,uOilStoredProc
  {$IFDEF VER150},Variants{$ENDIF};

type
  TOneSImportForm = class(TCommonForm)
    Table1: TTable;
    Table2: TTable;
    sp1: TOilStoredProc;
    q1: TOilQuery;
    q2: TOilQuery;
    qGetSQ: TOilQuery;
    sp3: TOilStoredProc;
    sp2: TOilStoredProc;
    qUp: TOilQuery;
    UpdSQL: TOraUpdateSQL;
    qDec: TOilQuery;
    DataSource1: TOraDataSource;
    Panel1: TPanel;
    ImportButton: TBitBtn;
    CloseButton: TBitBtn;
    pb1: TProgressBar;
    GroupBox1: TGroupBox;
    fCres: TFilenameEdit;
    Label4: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label1: TLabel;
    DateLabel1: TLabel;
    DateLabel2: TLabel;
    fCbal: TFilenameEdit;
    procedure CloseButtonClick(Sender: TObject);
    procedure ImportButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fCbalChange(Sender: TObject);
    procedure fCresChange(Sender: TObject);
  private
    FBeginDate, FEndDate, FCreateDate: TDateTime;
    FmId_Bal, FmId_Det, FmId_Det2, FMode: integer;
    FMassVal1, FMassVal2: string;
    FIsFirstChanged : boolean;
    function GetSQ: Integer;
    procedure ValCode(Table: Integer);

  public
    { Public declarations }
  end;

var
  OneSImportForm: TOneSImportForm;

implementation
uses Main, OilStd, uCrypt;
{$R *.DFM}

function TOneSImportForm.GetSQ: Integer; //берется следущее значение ID
begin
  if (qGetSQ.Active) then qGetSQ.Close;
  case FMode of
    1: qGetSQ.SQL.Text := 'select S_OIL_1C_BAL.nextval as sq from sys.dual';
    2: qGetSQ.SQL.Text := 'select S_OIL_1C_BAL_DET.nextval as sq from sys.dual';
    3: qGetSQ.SQL.Text := 'select S_OIL_1C_BAL_DET2.nextval as sq from sys.dual';
  end; //case
  qGetSQ.Open;
  Result := qGetSQ.FieldByName('sq').AsInteger;
end;

procedure TOneSImportForm.ValCode(Table: Integer); // ошифровка данных в поле VAL
const
  nol = '@';
  point ='';
var
  p : integer;
  CodeTexts : array[1..30] of string;
  ShuffleText,AAA : string;
begin
  //ошифровка
  case Table of
    1: //Таблица  OIL_1C_BAL_DET
      begin
        for p := 1 to 12 do
        begin
          case p of
            1:
              CodeTexts[p] := Encrypt(crtSmart,[FmId_Det,'']);
            2:
              CodeTexts[p] := Encrypt(crtSmart,['Y','']);
            3:
              CodeTexts[p] := Encrypt(crtSmart,[IntToStr(inst)]);
            4:
              CodeTexts[p] := Encrypt(crtSmart,[IntToStr(FmId_Bal)]);
            5:
              begin
                if table1.FieldByName('ACCOUNT').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[table1.FieldByName('ACCOUNT').Value])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            6:
              begin
                if table1.FieldByName('ACC_NAME').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[table1.FieldByName('ACC_NAME').Value])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            7:
              begin
                if table1.FieldByName('NSLDDT').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[table1.FieldByName('NSLDDT').Value])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            8:
              begin
                if table1.FieldByName('NSLDCT').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[table1.FieldByName('NSLDCT').Value])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            9:
              begin
                if table1.FieldByName('DEB_TURN').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[table1.FieldByName('DEB_TURN').Value])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            10:
              begin
                if table1.FieldByName('CR_TURN').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[table1.FieldByName('CR_TURN').Value])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            11:
              begin
                if table1.FieldByName('SLDDT').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[table1.FieldByName('SLDDT').Value])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            12:
              begin
                if table1.FieldByName('SLDCT').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[table1.FieldByName('SLDCT').Value])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
          end; //case p of ...
        end; //  for p:=1 to 12 do ...
        for p := 1 to 12 do
          ShuffleText := ShuffleText + CodeTexts[p];
        ShuffleText:=Encrypt(crtSmart,[ShuffleText]);
        sp2.ParamByName('VAL#').Value := ShuffleText;
        sp2.ParamByName('DECODE#').Value := 'N';
      end;
               {                                                                                               }
               {                   Порядок кодирования данных для таблицы OIL_1C_BAL_DET2                      }
               {  ID,STATE,INST,FILIAL_ID,FILIAL_1C_CODE,FILIAL_NAME,ASSET_ID,ASSET_NAME,CONSORT_ID,DT_AMOUNT  }
               {  CR_AMOUNT,DT_SUMMA,CR_SUMMA,DIM,ACC_NUM,OIL_1C_BAL_DET_ID,DT_AMOUNT_BEGIN,CR_AMOUNT_BEGIN,   }
               {  DT_SUMMA_BEGIN,CR_SUMMA_BEGIN,DT_AMOUNT_CIRC,CR_AMOUNT_CIRC,DT_SUMMA_CIRC,CR_SUMMA_CIRC      }
               {                                                                                               }
    2: //Таблица  OIL_1C_BAL_DET2
      begin
        for p := 1 to 24 do
        begin
          case p of
            1:
              CodeTexts[p] := Encrypt(crtSmart,[IntToStr(FmId_Det2)]);
            2:
              CodeTexts[p] := Encrypt(crtSmart,['Y']);
            3:
              CodeTexts[p] := Encrypt(crtSmart,[IntToStr(INST)]);
            4:
              begin
                if sp3.ParamByName('FILIAL_ID#').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[IntToStr(sp3.ParamByName('FILIAL_ID#').AsInteger)])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            5:
              begin
                if sp3.ParamByName('FILIAL_1C_CODE#').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[IntToStr(sp3.ParamByName('FILIAL_1C_CODE#').AsInteger)])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            6:
              begin
                if sp3.ParamByName('FILIAL_NAME#').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[sp3.ParamByName('FILIAL_NAME#').Value])
                else
                begin
                  CodeTexts[p] :=nol;
                  continue;
                end;
              end;
            7:
              begin
                if sp3.ParamByName('ASSET_ID#').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[IntToStr(sp3.ParamByName('ASSET_ID#').AsInteger)])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            8:
              begin
                if sp3.ParamByName('ASSET_NAME#').Value <> NULL then
                begin
                  CodeTexts[p] := Encrypt(crtSmart,[sp3.ParamByName('ASSET_NAME#').Value]);
                  {                      Проверка шифрации                          } 
                  { AAA:= Decrypt(crtSmart,[CodeTexts[p]]);                         }
                  { ShowMessage(' было : '+sp3.ParamByName('ASSET_NAME#').AsString+ }
                  { ' зашифр : '+CodeTexts[p]+                                      }
                  { ' дешифр : '+AAA);                                              }
                end
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            9:
              begin
                if sp3.ParamByName('CONSORT_ID#').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[sp3.ParamByName('CONSORT_ID#').Value])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            10:
              begin
                if sp3.ParamByName('DT_AMOUNT#').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[sp3.ParamByName('DT_AMOUNT#').Value])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            11:
              begin
                if sp3.ParamByName('CR_AMOUNT#').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[sp3.ParamByName('CR_AMOUNT#').Value])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            12:
              begin
                if sp3.ParamByName('DT_SUMMA#').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[sp3.ParamByName('DT_SUMMA#').Value])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            13:
              begin
                if sp3.ParamByName('CR_SUMMA#').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[sp3.ParamByName('CR_SUMMA#').Value])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            14:
              begin
                if sp3.ParamByName('DIM#').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[sp3.ParamByName('DIM#').Value])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            15:
              begin
                if FMassVal1 <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[FMassVal1]) // ACCOUNT ACC_NUM
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            16:
              begin
                if FMassVal2 <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[FMassVal2]) //  OIL_1C_BAL_DET_ID
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            17:
              begin
                if sp3.ParamByName('DT_AMOUNT_BEGIN#').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[sp3.ParamByName('DT_AMOUNT_BEGIN#').Value])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            18:
              begin
                if sp3.ParamByName('CR_AMOUNT_BEGIN#').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[sp3.ParamByName('CR_AMOUNT_BEGIN#').Value])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            19:
              begin
                if sp3.ParamByName('DT_SUMMA_BEGIN#').Value <> NULL then
                begin
                  CodeTexts[p] := Encrypt(crtSmart,[sp3.ParamByName('DT_SUMMA_BEGIN#').Value]);
                  {                     типа проверка шифрации                          }
                  { AAA:= Decrypt(crtSmart,[CodeTexts[p]]);                             }
                  { ShowMessage(' было : '+sp3.ParamByName('DT_SUMMA_BEGIN#').AsString+ }
                  { ' зашифр : '+CodeTexts[p]+                                          }
                  { ' дешифр : '+AAA);                                                  }
                end
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            20:
              begin
                if sp3.ParamByName('CR_SUMMA_BEGIN#').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[sp3.ParamByName('CR_SUMMA_BEGIN#').Value])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            21:
              begin
                if sp3.ParamByName('DT_AMOUNT_CIRC#').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[sp3.ParamByName('DT_AMOUNT_CIRC#').Value])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            22:
              begin
                if sp3.ParamByName('CR_AMOUNT_CIRC#').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[sp3.ParamByName('CR_AMOUNT_CIRC#').Value])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            23:
              begin
                if sp3.ParamByName('DT_SUMMA_CIRC#').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[sp3.ParamByName('DT_SUMMA_CIRC#').Value])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
            24:
              begin
                if sp3.ParamByName('CR_SUMMA_CIRC#').Value <> NULL then
                  CodeTexts[p] := Encrypt(crtSmart,[sp3.ParamByName('CR_SUMMA_CIRC#').Value])
                else
                begin
                  CodeTexts[p] := nol;
                  continue;
                end;
              end;
          end; //case p of
        end; //for p:=1 to ....
        ShuffleText := '';
        for p := 1 to 24 do
          ShuffleText := ShuffleText + CodeTexts[p];
        ShuffleText:=Encrypt(crtSmart,[ShuffleText]);
        sp3.ParamByName('VAL#').Value := ShuffleText;
        sp3.ParamByName('DECODE#').Value := 'N';
      end;
  end; //case Table of
end;

//--------------------------------------------


procedure TOneSImportForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TOneSImportForm.ImportButtonClick(Sender: TObject);
var
  FirstRow, NeedId, ReBoot: Boolean;
  MassForLoad: array[1..2, 1..10000] of string;
  qDelText, RusCod: string;
  k, i: integer;
  MassForReload: array[1..1000] of Integer;
  Rez1, Rez2 :real;
begin
  ReBoot := False;
  qDelText := UpdSQL.ModifySQL.Text;
  i := 0;
   //сверка периода внесённых таблиц и вносимых
  qUp.close;
  qUp.ParamByName('Inst').Value := INST;
  qUp.Open;
  if qUp.RecordCount <> 0 then
    repeat
           {                                               }
           {                            1-2-3-4-5-6-7-8-9- }
           { если периоды савподают     -----|#-#-#|------ }
           {                            -----|#-#-#|------ }
           {                            ------------------ }
           {                                               }
      if (StrToDate(qUp.FieldByName('DATE_BEGIN').AsString) = FBeginDate) and
        (StrToDate(qUp.FieldByName('DATE_END').AsString) = FEndDate)
        then if MessageDlg(TranslateText('Баланс за этот период уже внесён. Вы хотите заменить ранее импортированые данные?'),
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin //стираем старые записи
          UpdSQL.ModifySQL.Add(' Where INST=''' + IntToStr(inst) + '''');
          UpdSQL.ModifySQL.Add(' and  ID = ''' + qUp.FieldByName('id').AsString + '''');
          ReBoot := True;
          break;
        end
        else
          exit;
                  //новый период перекрывает существующие периоды
      if (StrToDate(qUp.FieldByName('DATE_BEGIN').AsString) = FBeginDate) and
        (FEndDate > StrToDate(qUp.FieldByName('DATE_END').AsString)) then
      begin
        repeat
          qUp.Next;
          MassForReload[i] := qUp.FieldByName('id').AsInteger; //записуем Id подминаемого периода
          i := i + 1;
                             {                                                }
                             { если период перекрывает     1-2-3-4-5-6-7-8-9- }
                             { существующие периоды  и     -----|#-#-#|------ }
                             { схрещивается с другим       -----|#|#|#-#|---- }
                             { периодом                    ------------------ }
                             {                                                }
          if (FEndDate > StrToDate(qUp.FieldByName('DATE_BEGIN').AsString)) and
            (FEndDate < StrToDate(qUp.FieldByName('DATE_END').AsString)) then
          begin
            ShowMessage(TranslateText('Невозможно записать баланс за этот период, ') +
              TranslateText('так как конец периода находиться в середине периода: ') +
              qUp.FieldByName('DATE_BEGIN').AsString + '-' +
              qUp.FieldByName('DATE_END').AsString + '.' +
              TranslateText(' Надо сделать выгрузку баланса по ') +
              qUp.FieldByName('DATE_END').AsString + '!');
            Exit;
          end
          else if MessageDlg(TranslateText('Баланс за этот период перерывает уже записаный период! ') +
            TranslateText('Перезаписать?'), mtConfirmation, [mbYes, mbNo], 0) = mrNo then
            exit;
                               {                                               }
                               {                            1-2-3-4-5-6-7-8-9- }
                               { если период перекрывает    -----|#-#-#|------ }
                               { существующие периоды       -----|#|#|#|------ }
                               {                            ------------------ }
                               {                                               }
          if (StrToDate(qUp.FieldByName('DATE_END').AsString) = FEndDate) then
          begin //delete
            UpdSQL.ModifySQL.Add(' Where inst=''' + IntToStr(inst) + '''And');
            for k := 0 to i - 1 do
            begin
              if k > 0 then
                UpdSQL.ModifySQL.Add(' or ');
              UpdSQL.ModifySQL.Add(' ID = ''' + IntToStr(MassForReload[k]) + '''');
              ReBoot := True;
            end;
            break;
          end;                 {                                               }
                               {                            1-2-3-4-5-6-7-8-9- }
                               { если период перекрывает    -----|#-#-#|------ }
                               { существующие периоды       -----|#|#|-------- }
                               { и новые                    ------------------ }
                               {                                               }
          if qUp.Eof then
          begin //delete
            UpdSQL.ModifySQL.Add(' Where inst=''' + IntToStr(inst) + '''');
            for k := 0 to i - 1 do
            begin
              if k > 0 then
                UpdSQL.ModifySQL.Add(' OR ');
              if i = 1 then
                UpdSQL.ModifySQL.Add(' AND ');
              if (k = 0) and (i <> 1) then
                UpdSQL.ModifySQL.Add(' AND ');
              UpdSQL.ModifySQL.Add(' ID = ''' + IntToStr(MassForReload[k]) + '''');
              ReBoot := True;
            end;
            break;
          end;
        until qUp.Eof;
      end;
           {                                              }
           {                            1-2-3-4-5-6-7-8-9-}
           { если периоды схрещиваются  -------|#-#-#|----}
           {                            -----|#-#-#|------}
           {                            ------------------}
           {                                              }
      if (FBeginDate > StrToDate(qUp.FieldByName('DATE_BEGIN').AsString)) and
        (FBeginDate < StrToDate(qUp.FieldByName('DATE_END').AsString)) then
      begin
        ShowMessage(TranslateText('Невозможно записать баланс за этот период, ') +
          TranslateText('так как начало периода находиться в середине периода: ') +
          qUp.FieldByName('DATE_BEGIN').AsString + '-' +
          qUp.FieldByName('DATE_END').AsString + '. ' +
          TranslateText('Надо выгрузить баланс с') +
          qUp.FieldByName('DATE_BEGIN').AsString + '!');
        Exit;
      end;
      if (FEndDate > StrToDate(qUp.FieldByName('DATE_BEGIN').AsString)) and
        (FEndDate < StrToDate(qUp.FieldByName('DATE_END').AsString)) then
      begin
        ShowMessage(TranslateText('Невозможно записать баланс за этот период, ') +
          TranslateText('так как конец периода находиться в середине периода: ') +
          qUp.FieldByName('DATE_BEGIN').AsString + '-' +
          qUp.FieldByName('DATE_END').AsString + '. ' +
          TranslateText('Надо сделать выгрузку баланса по ') +
          qUp.FieldByName('DATE_END').AsString + '!');
        Exit;
      end;
      qUp.Next;
    until qUp.Eof;

//внесение данных в таблицы
  FirstRow := True;
  i := 1;
  pb1.Max:=Table1.RecordCount+Table2.RecordCount;
  try
    StartSQL;
    Table1.First;
    Table2.First;
    while not Table1.Eof do
    begin
      if FirstRow = True then
      begin
        try
          sp1.Prepare;
          FMode := 1; // внесение данных в таблицу OIL_1C_BAL
          FmId_Bal := GetSQ;
          sp1.ParamByName('ID#').Value := FmId_Bal;
          sp1.ParamByName('INST#').Value := INST;
          sp1.ParamByName('STATE#').Value := 'Y';
          sp1.ParamByName('DATE_BEGIN#').Value := FBeginDate;
          sp1.ParamByName('DATE_END#').Value := FEndDate;
          sp1.ParamByName('DATE_CR#').Value := FCreateDate;
          sp1.ParamByName('DATE_LOAD#').Value := GetSystemDate;
          sp1.ExecProc;
          FirstRow := False;
          if SP1.ParamByName('result').AsString <> '0#' then
            raise Exception.Create(SP1.ParamByName('result').AsString);
          Table1.Next;
          Table2.Next;
          pb1.StepIt;
          pb1.StepIt;
          Continue;
        except on E: Exception do
          begin
            raise Exception.Create(TranslateText('Ошибка записи нулевого модуля, строка №')+IntToStr(pb1.position)+'. ');
          end; // except
        end; // try  exceptend;
      end;
      try
        FMode := 2; // внесение данных в таблицу OIL_1C_BAL_DET
        FmId_Det := GetSQ;
        sp2.Prepare;
        sp2.ParamByName('ID#').Value := FmId_Det;
        sp2.ParamByName('INST#').Value := INST;
        sp2.ParamByName('STATE#').Value := 'Y';
        sp2.ParamByName('OIL_1C_BAL_ID#').Value := FmId_Bal;
        sp2.ParamByName('ACC_NUM#').Value := Table1.FieldByName('ACCOUNT').Value;
        sp2.ParamByName('ACC_NAME#').Value := Table1.FieldByName('ACC_NAME').Value;
        sp2.ParamByName('DT_BEGIN#').Value := Table1.FieldByName('NSLDDT').Value;
        sp2.ParamByName('CR_BEGIN#').Value := Table1.FieldByName('NSLDCT').Value;
        sp2.ParamByName('DT_TURN#').Value := Table1.FieldByName('DEB_TURN').Value;
        sp2.ParamByName('CR_TURN#').Value := Table1.FieldByName('CR_TURN').Value;
        sp2.ParamByName('DT_END#').Value := Table1.FieldByName('SLDDT').Value;
        sp2.ParamByName('CR_END#').Value := Table1.FieldByName('SLDCT').Value;
        MassForLoad[1, i] := Table1.FieldByName('ACCOUNT').Value;
        MassForLoad[2, i] := inttostr(FmId_Det);
        i := i + 1;
        ValCode(1);
        sp2.ExecProc;
        if SP2.ParamByName('result').AsString <> '0#' then
          raise Exception.Create(SP2.ParamByName('result').AsString);
        Table1.Next;
        pb1.StepIt;
      except on E: Exception do
        begin
          raise Exception.Create(TranslateText('Ошибка записи первого модуля, строка № ')+IntToStr(pb1.position)+'. ');
        end; // except
      end; // try  exceptend;
      end; // while not Table1.Eof do
    while not Table2.Eof do
    begin
      try
        i := 1;
        FMode := 3; // внесение данных в таблицу OIL_1C_BAL_DET2
        FmId_Det2 := GetSQ;
        NeedId := False;
        sp3.Prepare;
        sp3.ParamByName('ID#').Value := FmId_Det2;
        sp3.ParamByName('INST#').Value := INST;
        sp3.ParamByName('STATE#').Value := 'Y';
        if Table2.FieldByName('ID_FIL_OIL').value = Null then
          sp3.ParamByName('FILIAL_ID#').Value := Null
        else
          sp3.ParamByName('FILIAL_ID#').Value := Table2.FieldByName('ID_FIL_OIL').AsInteger;
        if Table2.FieldByName('ID_FIL_1C').Value = Null then
          sp3.ParamByName('FILIAL_1C_CODE#').Value := Null
        else
          sp3.ParamByName('FILIAL_1C_CODE#').Value := Table2.FieldByName('ID_FIL_1C').AsInteger;
        sp3.ParamByName('FILIAL_NAME#').Value := Table2.FieldByName('FIL_NAME').Value;
        if Table2.FieldByName('ASSET_TYPE').Value = Null then
          sp3.ParamByName('ASSET_ID#').Value := Null
        else
          sp3.ParamByName('ASSET_ID#').Value := Table2.FieldByName('ASSET_TYPE').AsInteger;
        sp3.ParamByName('ASSET_NAME#').Value := Table2.FieldByName('ASSET_NAME').Value;
        try
          if Table2.FieldByName('ID_CONSORT').Value = Null then
            sp3.ParamByName('CONSORT_ID#').Value := Null
          else
            sp3.ParamByName('CONSORT_ID#').Value := Table2.FieldByName('ID_CONSORT').AsInteger;
        except
          sp3.ParamByName('CONSORT_ID#').Value := Null;
        end;
        sp3.ParamByName('DIM#').Value := Table2.FieldByName('UNIT').Value;
        try   //Вычисление конечного сальдо
          Rez1 := (Table2.FieldByName('SUM_SND').Value + Table2.FieldByName('SUM_DO').Value) - (Table2.FieldByName('SUM_CO').Value +
          Table2.FieldByName('SUM_SNC').Value);
          if Rez1>0 then
          begin
            sp3.ParamByName('DT_SUMMA#').Value := Rez1;
            sp3.ParamByName('CR_SUMMA#').Value := 0;
          End
          else //Rez1<0
          begin
            sp3.ParamByName('DT_SUMMA#').Value := 0;
            sp3.ParamByName('CR_SUMMA#').Value := -Rez1;
          End;

          //Вычисление конечного количества
          Rez2 := (Table2.FieldByName('AMOUNT_SND').Value + Table2.FieldByName('AMOUNT_DO').Value) - (Table2.FieldByName('AMOUNT_CO').Value +
          Table2.FieldByName('AMOUNT_SNC').Value);
          if Rez2>0 then
          begin
            sp3.ParamByName('DT_AMOUNT#').Value := Rez2;
            sp3.ParamByName('CR_AMOUNT#').Value := 0;
          End
          else //Rez2<0
          begin
            sp3.ParamByName('DT_AMOUNT#').Value := 0;
            sp3.ParamByName('CR_AMOUNT#').Value := -Rez2;
          End;
        except on E: Exception do
          begin
            raise Exception.Create(TranslateText('Ошибка в вычислениях. '));
          end; // except
        end; // try  exceptend;
        sp3.ParamByName('DT_AMOUNT_BEGIN#').Value := Table2.FieldByName('AMOUNT_SND').Value;
        sp3.ParamByName('CR_AMOUNT_BEGIN#').Value := Table2.FieldByName('AMOUNT_SNC').Value;
        sp3.ParamByName('DT_SUMMA_BEGIN#').Value := Table2.FieldByName('SUM_SND').Value;
        sp3.ParamByName('CR_SUMMA_BEGIN#').Value := Table2.FieldByName('SUM_SNC').Value;
        sp3.ParamByName('DT_AMOUNT_CIRC#').Value := Table2.FieldByName('AMOUNT_DO').Value;
        sp3.ParamByName('CR_AMOUNT_CIRC#').Value := Table2.FieldByName('AMOUNT_CO').Value;
        sp3.ParamByName('DT_SUMMA_CIRC#').Value := Table2.FieldByName('SUM_DO').Value;
        sp3.ParamByName('CR_SUMMA_CIRC#').Value := Table2.FieldByName('SUM_CO').Value;
        try
          repeat  //вибор из масива нужного ID из таблици OIL_1C_BAL_DET
            FMassVal1 := MassForLoad[1, i]; // ACCOUNT   ACC_NUM
            FMassVal2 := MassForLoad[2, i]; //  OIL_1C_BAL_DET_ID
            if FMassVal1 = Table2.FieldByName('ACCOUNT').Value then
            begin
              sp3.ParamByName('ACC_NUM#').Value := FMassVal1;
              sp3.ParamByName('OIL_1C_BAL_DET_ID#').AsInteger := StrToInt(FMassVal2);
              NeedId := True;
            end
            else
              i := i + 1;
          until NeedId = True;
        except on E: Exception do
          begin
            //raise Exception.Create('Ошибка соответствия, счет '+Table2.FieldByName('ACCOUNT').Value);
          end; // except
        end; // try  exceptend;
        ValCode(2);
        sp3.ExecProc;
        if SP3.ParamByName('result').AsString <> '0#' then
          raise Exception.Create(SP3.ParamByName('result').AsString);
        Table2.Next;
        pb1.StepIt;
      except on E: Exception do
        begin
          raise Exception.Create(TranslateText('Ошибка записи второго модуля, строка № ')+IntToStr(pb1.position)+'. '+E.message);
        end; // except
      end; // try  exceptend;
    end; //while
    Table2.First;
    repeat
      if Table2.FieldByName('FIL_NAME').AsString = '' then
        Table2.Next
      else
        RusCod := Table2.FieldByName('FIL_NAME').AsString;
    until RusCod <> '';
    if MessageDlg(TranslateText('Видите ли вы слово <') + RusCod + TranslateText('> в русской кодировке?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              {YES}
    begin
      if ReBoot = True then
        UpdSQL.ExecSQL(ukModify); //удаление  при перезаписи
      CommitSQL;
      ShowMessage(TranslateText('Данные внесены успешно!!!'));
    end
             {NO}
    else
      raise Exception.Create(TranslateText('Внесение данных отменено пользователем'));
  except on E: Exception do
    begin
      MessageDlg(TranslateText('Ошибка : ') + E.message, mtError, [mbOk], 0);
      RollbackSQL;
    end; // except
  end; // try  exceptend;
  UpdSQL.ModifySQL.Text := qDelText;
  PB1.Position:=0;
end;

procedure TOneSImportForm.FormCreate(Sender: TObject);
begin
  inherited;
  ImportButton.Enabled := false;
  FIsFirstChanged :=True;
  DateLabel1.Caption:='';
  DateLabel2.Caption:='';
end;

procedure TOneSImportForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Table1.close;
  Table2.Close;
  q1.Close;
  q2.Close;
  qGetSQ.Close;
  qUp.Close;
  qDec.Close;
end;

procedure TOneSImportForm.fCbalChange(Sender: TObject);
var
  Dates, way, prField1, prField2: string;
  i, n, k: integer;
  BeginYear, BeginMonth, BeginDay, EndYear, EndMonth, EndDay: Word;
  BadDate: boolean;
  Date1, Date2, Date3: string;
begin
  if (FIsFirstChanged =false) or (fCbal.FileName='') then
    Begin
      FIsFirstChanged :=True;
      exit;
    End;
  BadDate := False;
  Dates := '';
  K := 0;
  way := fCbal.Filename;
       //Путь к файлу cres****.dbf
  for i := Length(Way) downto 1 do
  begin
    k := k + 1;
    if K = 9 then
    begin
      way[i] := 's';
      way[i - 1] := 'e';
      way[i - 2] := 'r';
                     //дата файла
      DateLabel1.Caption := TranslateText('месяц ') + way[i + 1] + way[i + 2] + TranslateText(' год 20') + way[i + 3] + way[i + 4];
      DateLabel2.Caption := DateLabel1.Caption;
      break;
    end;
  end;
  Table1.Close;
  Table2.Close;
  Table1.TableName := fCbal.Filename;
  Table2.TableName := Way;
  FIsFirstChanged :=False;
  fCres.Filename := Way;
  if FileExists(Table1.TableName) = false or FileExists(Table2.TableName) = false then
  begin
    ShowMessage(TranslateText('Невозможно открыть файлы для импорта!') +
      TranslateText('Поместите оба файла в одну папку и ещё раз откройте!'));
    exit;
  end;
  try
    Table1.Open;
    Table2.Open;
    q1.Close;
    q2.Close;
    q1.SQL.Strings[1] := ' from ''' + fCbal.Filename + ''' cbal ';
    q2.SQL.Strings[1] := ' from ''' + fCRes.Filename + ''' cbal ';
    q1.open;
    q2.Open;
      Dates := q1.FieldByName('ACC_NAME').AsString;
        // деление дат на даты: начала периода; конец периода; дата создания
    for n := 1 to Length(Dates) do
    begin
                  // проверка на правильность ячейкии с датами даты
      if (Length(Dates) <> 26) and (Dates[9] = ';') and (Dates[18] = ';') then
      begin
        raise Exception.Create(TranslateText(' Невозможно окрыть файлы для импорта! ') +
          TranslateText(' Файл испорчен!!! Сделайте выгрузку еще раз!'));
                       //exit;
      end;
      if n <= 8 then
        Date1 := Date1 + Dates[n];
      if (n >= 10) and (n <= 17) then
        Date2 := Date2 + Dates[n];
      if (n >= 19) and (n <= 26) then
        Date3 := Date3 + Dates[n];
    end;
    FBeginDate := StrToDate(Date1);
    FEndDate := StrToDate(Date2);
    FCreateDate := StrToDate(Date3);
  except on E: Exception do
    Begin
      FIsFirstChanged :=false;
      fCbal.FileName := '';
      fCres.FileName := '';
      DateLabel1.Caption := '';
      DateLabel2.Caption := '';
      ShowMessage(TranslateText(' Невозможно окрыть файлы для импорта ! ') +
        TranslateText(' Файл испорчен !!! Сделайте выгрузку еще раз!'));
      Exit;
    End;
  end; // Try .. except
   //Проверка взят ли баланс в нужных пределах(датах)
   //начало периода должно быть первым числом, а конец последним числом месяца
                                                                            // 28-29=2
  DecodeDate(FBeginDate, BeginYear, BeginMonth, BeginDay); // 30=4,6,9,11
  DecodeDate(FEndDate, EndYear, EndMonth, EndDay); // 31=1,3,5,7,8,10,12
  if BeginDay <> 1 then
    BadDate := True; //проверка начальной даты
  if (EndMonth = 1) or (EndMonth = 3) or (EndMonth = 5) or (EndMonth = 7) or //проверка конечной даты
     (EndMonth = 8) or (EndMonth = 10) or (EndMonth = 12) then if EndDay <> 31 then
      BadDate := True;
  if (EndMonth = 4) or (EndMonth = 6) or (EndMonth = 9) or (EndMonth = 11) then if EndDay <> 30 then
    BadDate := True;
  if (EndYear mod 4 = 0) and (EndMonth = 2) then if EndDay <> 29 then
    BadDate := True;
  if (EndYear mod 4 <> 0) and (EndMonth = 2) then if EndDay <> 28 then
    BadDate := True;
  if BadDate = True then
  begin
    ShowMessage(TranslateText('Выгрузку баланса надо делать с первого числа по последнее число месяца!'));
    Table1.Close;
    Table2.Close;
    FIsFirstChanged :=false;
    fCbal.FileName := '';
    fCres.FileName := '';
    exit;
  end;

    //проверка пренадлежности файлов к одной выгрузке
  prField1 := q1.FieldByName('SLDDT').AsString;
  prField2 := q2.FieldByName('SUM_SND').AsString;
  if prField1 <> prField2 then
    begin
      ShowMessage(TranslateText('Эти Файлы не пренадлежат одной выгрузке!'));
      ImportButton.Enabled := False;
      Table1.Close;
      Table2.Close;
      fCbal.FileName := '';
      fCres.FileName := '';
      exit;
    end
    else
      ImportButton.Enabled := True;
end;

procedure TOneSImportForm.fCresChange(Sender: TObject);
var
  Dates, way, prField1, prField2: string;
  i, n, k: integer;
  BeginYear, BeginMonth, BeginDay, EndYear, EndMonth, EndDay: Word;
  BadDate: boolean;
  Date1, Date2, Date3: string;
begin
  if (FIsFirstChanged =false) or (fCres.FileName='') then
    Begin
      FIsFirstChanged :=True;
      exit;
    End;
  BadDate := False;
  Dates := '';
  K := 0;
  way := fCres.Filename;
         //Путь к файлу cres****.dbf
  for i := Length(Way) downto 1 do
  begin
    k := k + 1;
    if K = 9 then
    begin
      way[i] := 'l';
      way[i - 1] := 'a';
      way[i - 2] := 'b';
                     //дата файла
      DateLabel1.Caption := TranslateText('месяц ') + way[i + 1] + way[i + 2] + TranslateText(' год 20') + way[i + 3] + way[i + 4];
      DateLabel2.Caption := DateLabel1.Caption;
      break;
    end;
  end;
  Table1.Close;
  Table2.Close;
  Table1.TableName := Way;
  Table2.TableName := fCres.Filename;
  FIsFirstChanged :=False;
  fCbal.Filename := Way;
  if FileExists(Table1.TableName) = false or FileExists(Table2.TableName) = false then
  begin
    ShowMessage(TranslateText('Невозможно открыть файлы для импорта!') +
      TranslateText('Поместите оба файла в одну папку и ещё раз откройте!'));
    exit;
  end;
  try
    Table1.Open;
    Table2.Open;
    q1.Close;
    q2.Close;
    q1.SQL.Strings[1] := ' from ''' + fCbal.Filename + ''' cbal ';
    q2.SQL.Strings[1] := ' from ''' + fCres.Filename + ''' cbal ';
    q1.open;
    q2.Open;
    Dates := q1.FieldByName('ACC_NAME').AsString;

        // деление дат на даты: начала периода; конец периода; дата создания
    for n := 1 to Length(Dates) do
    begin
                  // проверка на правильность ячейкии с датами даты
      if (Length(Dates) <> 26) and (Dates[9] = ';') and (Dates[18] = ';') then
      begin
        raise Exception.Create(TranslateText(' Невозможно окрыть файлы для импорта! ') +
          TranslateText(' Файл испорчен!!! Сделайте выгрузку еще раз!'));
                       //exit;
      end;
      if n <= 8 then
        Date1 := Date1 + Dates[n];
      if (n >= 10) and (n <= 17) then
        Date2 := Date2 + Dates[n];
      if (n >= 19) and (n <= 26) then
        Date3 := Date3 + Dates[n];
    end;
    FBeginDate := StrToDate(Date1);
    FEndDate := StrToDate(Date2);
    FCreateDate := StrToDate(Date3);
  except on E: Exception do
    Begin
      FIsFirstChanged :=false;
      fCbal.FileName := '';
      fCres.FileName := '';
      DateLabel1.Caption := '';
      DateLabel2.Caption := '';
      ShowMessage(TranslateText(' Невозможно окрыть файлы для импорта ! ') +
        TranslateText(' Файл испорчен !!! Сделайте выгрузку еще раз!'));
      Exit;
    End;
  end; // Try .. except
   //Проверка взят ли баланс в нужных пределах(датах)
   //начало периода должно быть первым числом, а конец последним числом месяца
                                                                            // 28-29=2
  DecodeDate(FBeginDate, BeginYear, BeginMonth, BeginDay); // 30=4,6,9,11
  DecodeDate(FEndDate, EndYear, EndMonth, EndDay); // 31=1,3,5,7,8,10,12
  if BeginDay <> 1 then
    BadDate := True; //проверка начальной даты
  if EndMonth in [1,3,5,7,8,10,12] then if EndDay <> 31 then
      BadDate := True;
  if EndMonth in [4,6,9,11] then if EndDay <> 30 then
    BadDate := True;
  if (EndYear mod 4 = 0) and (EndMonth = 2) then if EndDay <> 29 then
    BadDate := True;
  if (EndYear mod 4 <> 0) and (EndMonth = 2) then if EndDay <> 28 then
    BadDate := True;
  if BadDate = True then
  begin
    ShowMessage(TranslateText('Выгрузку баланса надо делать с первого числа по последнее число месяца!'));
    Table1.Close;
    Table2.Close;
    fCbal.FileName := '';
    fCres.FileName := '';
    exit;
  end;

    //проверка пренадлежности файлов к одной выгрузке
  prField1 := q1.FieldByName('SLDDT').AsString;
  prField2 := q2.FieldByName('SUM_SND').AsString;

  if prField1 <> prField2 then
  begin
    ShowMessage(TranslateText('Эти Файлы не пренадлежат одной выгрузке!'));
    ImportButton.Enabled := False;
    Table1.Close;
    Table2.Close;
    fCbal.FileName := '';
    fCres.FileName := '';
    exit;
  end
  else
    ImportButton.Enabled := True;
end;

end.
