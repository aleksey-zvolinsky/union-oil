unit Pump;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, Db, DBTables, ComCtrls,
  uCommonForm,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess;

type
  TPumpForm = class(TCommonForm)
    Panel1: TPanel;
    bBegin: TBitBtn;
    bClose: TBitBtn;
    tOrg: TTable;
    tBank: TTable;
    tAuto: TTable;
    tBankB_AD: TStringField;
    tBankB_KB: TFloatField;
    tBankB_NB: TStringField;
    tBankCRT: TStringField;
    tBankMDF: TStringField;
    tAutoAU_ATP: TStringField;
    tAutoAU_LIT: TFloatField;
    tAutoAU_NUM: TStringField;
    tAutoAU_WOD: TStringField;
    SP: TOilStoredProc;
    chOrg: TCheckBox;
    chAuto: TCheckBox;
    PBOrg: TProgressBar;
    Bevel1: TBevel;
    PBAuto: TProgressBar;
    q2: TOilQuery;
    chBank: TCheckBox;
    PBBank: TProgressBar;
    q1: TOilQuery;
    tOrgCRT: TStringField;
    tOrgMDF: TStringField;
    tOrgOR_A: TStringField;
    tOrgOR_DPK: TDateField;
    tOrgOR_DTD: TStringField;
    tOrgOR_DTKD: TStringField;
    tOrgOR_DVP: TDateField;
    tOrgOR_FD: TStringField;
    tOrgOR_FKD: TStringField;
    tOrgOR_G: TStringField;
    tOrgOR_K: TFloatField;
    tOrgOR_KB: TFloatField;
    tOrgOR_KRS: TStringField;
    tOrgOR_N: TFloatField;
    tOrgOR_NA: TStringField;
    tOrgOR_NBKRS: TStringField;
    tOrgOR_NOM: TFloatField;
    tOrgOR_NSR: TStringField;
    tOrgOR_OB: TStringField;
    tOrgOR_PI: TFloatField;
    tOrgOR_PR: TFloatField;
    tOrgOR_RAST: TFloatField;
    tOrgOR_RES: TStringField;
    tOrgOR_RN: TStringField;
    tOrgOR_RS: TFloatField;
    tOrgOR_RSL: TFloatField;
    tOrgOR_RTD: TStringField;
    tOrgOR_RTKD: TStringField;
    tOrgOR_S: TStringField;
    tOrgOR_T: TStringField;
    tOrgOR_V: TStringField;
    tOrgOR_VD: TFloatField;
    tOrgOR_ZKPO: TFloatField;
    DB: TDatabase;
    Label1: TLabel;
    Label2: TLabel;
    Bevel2: TBevel;
    procedure bCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bBeginClick(Sender: TObject);
    procedure chOrgClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PumpForm: TPumpForm;

implementation

Uses Main, OilStd, UDbFunc;

{$R *.DFM}

procedure TPumpForm.bCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TPumpForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q1.Close;
  q2.Close;
  Action := caFree;
end;

procedure TPumpForm.bBeginClick(Sender: TObject);
Var
  Res, ID_Kod, S : String;
  St  : TStringList;
  Org_ID, ID_BANK, I, OLD_ID, OLD_INST,vId  :Integer;
  Flag : Boolean;
begin
  DB.Connected := False;
  tOrg.Active  := False;
  tBank.Active := False;
  tAuto.Active := False;

  Try
    DB.Connected := True;
    tOrg.Active  := True;
    tBank.Active := True;
    tAuto.Active := True;
  Except on E:Exception Do
    Begin
      DB.Connected := False;
      tOrg.Active  := False;
      tBank.Active := False;
      tAuto.Active := False;
      ShowMessage(TranslateText('Ошибка при подключении: ')+E.Message);
      Exit;
    End;
  End;

  If chAuto.Checked Or chOrg.Checked Then
  Begin
    StartSQL;
    St := TStringList.Create;

    If chOrg.Checked Then
    Begin
      tBank.First;
      PBBank.Max := tBank.RecordCount;
      While Not tBank.EOF Do
      Try
        With SP Do
        Begin
          q1.Close;
          q1.Open;

          StoredProcName := 'OIL.INSORUPDOIL_BANK';
          Prepare;
          ParamByName('INST#').AsInteger := INST;
          ParamByName('NAME#').AsString  := tBankB_NB.AsString;
          ParamByName('MFO#').AsString   := tBankB_KB.AsString;
          ParamByName('STATE#').AsString := 'Y';
          ParamByName('ID#').AsInteger   := q1.Fields[0].AsInteger;
          ExecProc;
          Res:=ParamByName('Result').AsString;
          If Length(Res)>0 Then
            If Res[1]<>'0' Then
              Raise Exception.Create(SubStr(Res,2));

          St.Add(q1.Fields[0].AsString+'#'+tBankB_KB.AsString); // ID#MFO
          PBBank.StepIt;
          Application.ProcessMessages;
        End;
        tBank.Next;
      Except On E:Exception Do
        Begin
          RollBackSQL;
          MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
          Exit;
        End;
      End;
    End;

    If chOrg.Checked Then
    Begin
      tOrg.First;
      tBank.First;
      PBOrg.Max := tOrg.RecordCount;
      While Not tOrg.EOF Do
      Try
        With SP Do
        Begin
          Id_Kod := tOrgOR_ZKPO.AsString;
          Old_ID := 0;
          Old_Inst := 0;
          If ID_Kod<>'0' Then
          Begin
            q2.close;
            q2.sql.text:='select ID, INST from v_oil_org where id_num='''+ID_KOD+'''';
            q2.open;
            If q2.RecordCount>0 Then
            Begin
              {MessageDlg('Организация с идентификационным кодом '+ID_KOD+' уже существует!'
                +#10#13 + 'У организации "'+tOrgOR_NA.AsString+'" ИД.КОД будет пропущен.',mtError,[mbOk],0);}
              Old_Id   := q2.FieldByName('ID').AsInteger;
              Old_INST := q2.FieldByName('INST').AsInteger;
              ID_Kod   := '';
            End;
          End
          Else
          Begin
            q2.close;
            q2.sql.text:='select ID, INST from v_oil_org where Name='''+tOrgOR_NA.AsString+'''';
            q2.open;
            If q2.RecordCount>0 Then
            Begin
              {MessageDlg('Организация с идентификационным кодом '+ID_KOD+' уже существует!'
                +#10#13 + 'У организации "'+tOrgOR_NA.AsString+'" ИД.КОД будет пропущен.',mtError,[mbOk],0);}
              Old_Id   := q2.FieldByName('ID').AsInteger;
              Old_INST := q2.FieldByName('INST').AsInteger;
              ID_Kod   := '';
            End;
          End;
          If Id_Kod <> '' Then
          Begin
            q2.close;
            Q2.SQl.Clear;
            q2.sql.add('select s_oil_org.nextval from sys.dual');
            q2.open;
            if q2.fields[0].value=inst then begin
                                            q2.close;
                                            q2.open;
                                           end;
            StoredProcName := 'OIL.INSORUPDOIL_ORG';
            Prepare;
            org_id:=q2.fields[0].value;
            ParamByName('ID#').AsInteger  := org_id;
            ParamByName('STATE#').AsString  := 'Y';
            ParamByName('INST#').AsInteger := INST;
            ParamByName('NAME#').AsString  := tOrgOR_NA.AsString;
            ParamByName('PAR#').Clear;
            ParamByName('PAR_INST#').Clear;
            ParamByName('ID_NUM#').AsString  := ID_Kod;
            ParamByName('NAL_NUM#').AsString  := tOrgOR_NOM.AsString;
            ParamByName('SVID_NUM#').AsString  := tOrgOR_NSR.AsString;
            ParamByName('VED#').Clear;
            ParamByName('Org_type#').AsInteger  := 1;
            S := '';
            If (tOrgOR_PI.AsString <> '')And(tOrgOR_PI.AsString <> '0') Then S := TranslateText('Индекс: ')+ tOrgOR_PI.AsString;
            If tOrgOR_OB.AsString  <> '' Then S := TranslateText(' Область: ') + tOrgOR_OB.AsString;
            If tOrgOR_RN.AsString  <> '' Then S := TranslateText(' Район: ') + tOrgOR_RN.AsString;
            If tOrgOR_G.AsString   <> '' Then S := TranslateText(' Город: ') + tOrgOR_G.AsString;
            If tOrgOR_A.AsString   <> '' Then S := TranslateText(' Адрес: ') + tOrgOR_A.AsString;
            ParamByName('ADDR#').AsString  := S;
            ParamByName('DATE_BEGIN#').AsDate  := tOrgOR_DPK.AsDateTime;
            ParamByName('Phone#').AsString  := tOrgOR_T.AsString;
            ParamByName('E_Mail#').AsString  := '';
            ParamByName('Boss#').AsString  := tOrgOR_FD.AsString;
            ParamByName('Boss_tel_H#').AsString  := tOrgOR_DTD.AsString;
            ParamByName('Boss_tel_W#').AsString  := tOrgOR_RTD.AsString;
            ParamByName('GBuh#').AsString  := tOrgOR_FKD.AsString;
            ParamByName('GBuh_tel_H#').AsString  := tOrgOR_DTKD.AsString;
            ParamByName('GBuh_tel_W#').AsString  := tOrgOR_RTD.AsString;
            ParamByName('AZS_ID#').Clear;
            Case tOrgOR_PR.AsInteger Of
            1..4 : ParamByName('FACE#').AsInteger  := 1;  // 0-Fiz, 1 -Ur, 2-Unknown
            5,6  : ParamByName('FACE#').AsInteger  := 0;
            Else
              ParamByName('FACE#').AsInteger  := 2;
            End;
            ExecProc;
            Res:=ParamByName('Result').AsString;
            If Length(Res)>0 Then
              If Res[1]<>'0' Then
                Raise Exception.Create(SubStr(Res,2));

            Old_Id   := Org_id;
            Old_Inst := INST;
          End;

          q2.Close;
          q2.SQl.Clear;
          q2.SQL.add('select s_oil_org_rekvizit.nextval from sys.dual');
          q2.Open;

          StoredProcName := 'OIL.INSORUPDOIL_ORG_REKVIZIT';
          Prepare;
          ParamByName('ID#'       ).AsInteger := q2.Fields[0].Value;
          ParamByName('ID_ORG#'   ).AsInteger := old_id;
          ParamByName('STATE#'    ).AsString  := 'Y';
          ParamByName('INST#'     ).AsInteger := old_inst;
          ParamByName('RACH_CHET#').AsString  := tOrgOR_RS.AsString;
          ParamByName('FACE_CHET#').AsString  := tOrgOR_KRS.AsString;
          ParamByName('CHECK_BOK#').AsString  := tOrgOR_RSL.AsString;
          Flag := True;
          I := 0;
          ID_BANK := -1;
          While (Flag)And(I <= St.Count - 1) Do
          Begin
            If SubStr(St[I],2) = tOrgOR_KB.AsString Then
            Begin
              Flag := False;
              ID_BANK := StrToInt(SubStr(St[I],1));
            End;
            Inc(I);
          End;

          If Not Flag Then
          Begin
            ParamByName('ID_BANK#'  ).AsInteger := ID_BANK;
            ParamByName('BANK_INST#').AsInteger := INST;
          End
          Else
          Begin
            ParamByName('ID_BANK#'  ).Clear;
            ParamByName('BANK_INST#').Clear;
          End;

          ExecProc;
          Res:=ParamByName('Result').AsString;
          If Length(Res)>0 Then
            If Res[1]<>'0' Then
              Raise Exception.Create(SubStr(Res,2));

          PBOrg.StepIt;
          Application.ProcessMessages;
          tOrg.Next;
        End;
      Except On E:Exception Do
        Begin
          RollBackSQL;
          MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
          Exit;
        End;
      End;
    End;

    If chAuto.Checked Then
    Begin
      tAuto.First;
      PBAuto.Max := tAuto.RecordCount;
      While Not tAuto.EOF Do
      Try
        With SP Do
        Begin
          vId:=GetSeqNextVal('S_OIL_AUTO');

          StoredProcName := 'OIL.INSORUPDOIL_AUTO';
          Prepare;
          ParamByName('ID#').AsInteger    := vId;
          ParamByName('STATE#').AsString  := 'Y';
          ParamByName('INST#').AsInteger  := INST;
          ParamByName('NUMB#').AsString   := tAutoAU_Num.AsString;
          ParamByName('DRIVER#').AsString := tAutoAU_WOD.AsString;
          ParamByName('ATP#').AsString    := tAutoAU_ATP.AsString;
          ParamByName('AUTO_TYPE#').AsString := TranslateText('Авто');
          ParamByName('CAPACITY#').AsFloat:= tAutoAU_LIT.AsFloat;
          ExecProc;
          Res:=ParamByName('Result').AsString;
          If Length(Res)>0 Then
            If Res[1]<>'0' Then
              Raise Exception.Create(SubStr(Res,2));

          PBAuto.StepIt;
          Application.ProcessMessages;
        End;
        tAuto.Next;
      Except On E:Exception Do
        Begin
          RollBackSQL;
          MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
          Exit;
        End;
      End;
    End;

    CommitSQL;
    ShowMessage(TranslateText('Данные успешно внесены.'));
    St.Free;
  End;
  Close;
  ModalResult := mrOk;
end;

procedure TPumpForm.chOrgClick(Sender: TObject);
begin
  chBank.Checked := chOrg.Checked;
end;

end.
