unit LogSaleDeadbeat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, uDBFunc, uMessageDlgExt,
  uCommonForm,uOilQuery,Ora, uOilStoredProc{$IFDEF VER150},Variants{$ENDIF};

type
  TSaleToDeadbeat = record
                        OldOrgId, OldOrgInst : integer;
                        OldOrgIsDebetor : boolean;
                        NewOrgId, NewOrgInst : integer;
                        NewOrgName : string;
                        NewOrgIsDebetor : boolean;
                        Sale_id, Sale_inst : integer;
                        Table_name : string;
                    end;

  TLogSaleDeadbeatForm = class(TCommonForm)
    Label4: TLabel;
    edtSaleType: TEdit;
    Label1: TLabel;
    xdeSaleDate: TDateEdit;
    Label2: TLabel;
    Label5: TLabel;
    edtOrg: TEdit;
    edtRespondent: TEdit;
    Label3: TLabel;
    edtInstructor: TEdit;
    lblWarning: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Label6: TLabel;
    procedure bbOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    SaleToDeadbeat : TSaleToDeadbeat;
  end;

  procedure ClearSaleToDeadbeat(var V : TSaleToDeadbeat);
  procedure SwitchDeadbeatToN;
  procedure MarkDeadbeat(org_id, org_inst : integer; summa : real);
  Function ConfirmSaleToDeadbeat(SaleToDeadbeat : TSaleToDeadbeat):boolean;
  procedure DeleteSaleFromLog(Sale_id,Sale_inst,inst : integer; table_name : string);
  procedure InitOldOrg(pOrg_id, pOrg_inst : integer; pOrgName : string;
                       pSale_id, pSale_inst : integer; pTable_name : string;
                       var SaleToDeadbeat : TSaleToDeadbeat);
  function InitNewOrg(pOrg_id, pOrg_inst : integer; pOrgName : string;
                     pSale_id, pSale_inst : integer; pTable_name : string;
                     var SaleToDeadbeat : TSaleToDeadbeat; pShowMessage : boolean = True) : boolean;

var
  LogSaleDeadbeatForm: TLogSaleDeadbeatForm;

implementation

uses Main;

{$R *.DFM}

procedure ClearSaleToDeadbeat(var V : TSaleToDeadbeat);
Begin
  V.OldOrgId := 0;
  V.OldOrgInst := 0;
  V.OldOrgIsDebetor := False;
  V.NewOrgId := 0;
  V.NewOrgInst := 0;
  V.NewOrgName := '';
  V.NewOrgIsDebetor := False;
  V.Sale_id := 0;
  V.Sale_inst := 0;
  V.Table_name := '';
End;

Function ConfirmSaleToDeadbeat(SaleToDeadbeat : TSaleToDeadbeat):boolean;
  var LogForm : TLogSaleDeadbeatForm;
      DelLog, Confirm : boolean;
Begin
  Result := True;

  if (SaleToDeadbeat.NewOrgId=0) and (SaleToDeadbeat.NewOrgInst=0) and
     ((SaleToDeadbeat.OldOrgId<>0) or (SaleToDeadbeat.OldOrgInst<>0))
  then InitNewOrg(SaleToDeadbeat.OldOrgId, SaleToDeadbeat.OldOrgInst,
                  SaleToDeadbeat.NewOrgName,
                  SaleToDeadbeat.Sale_id, SaleToDeadbeat.Sale_inst,
                  SaleToDeadbeat.Table_name, SaleToDeadbeat, False);


  DelLog := not SaleToDeadbeat.OldOrgIsDebetor and SaleToDeadbeat.NewOrgIsDebetor
     or
     SaleToDeadbeat.OldOrgIsDebetor and SaleToDeadbeat.NewOrgIsDebetor and
     ((SaleToDeadbeat.OldOrgId<>SaleToDeadbeat.NewOrgId) or
     (SaleToDeadbeat.OldOrgInst<>SaleToDeadbeat.NewOrgInst))
     or
     SaleToDeadbeat.OldOrgIsDebetor and not SaleToDeadbeat.NewOrgIsDebetor;

  Confirm := not SaleToDeadbeat.OldOrgIsDebetor and SaleToDeadbeat.NewOrgIsDebetor
     or
     SaleToDeadbeat.OldOrgIsDebetor and SaleToDeadbeat.NewOrgIsDebetor and
     ((SaleToDeadbeat.OldOrgId<>SaleToDeadbeat.NewOrgId) or
     (SaleToDeadbeat.OldOrgInst<>SaleToDeadbeat.NewOrgInst));

  if DelLog
  then DeleteSaleFromLog(SaleToDeadbeat.Sale_id, SaleToDeadbeat.Sale_inst,
                         REAL_INST,SaleToDeadbeat.Table_name);

  if Confirm
  then Begin
      LogForm := TLogSaleDeadbeatForm.Create(nil);
      LogForm.SaleToDeadbeat := SaleToDeadbeat;
      LogForm.xdeSaleDate.Date := GetSystemDate;
      LogForm.ShowModal;
      Result := LogForm.ModalResult = mrOK;
  End;
End;

procedure InitOldOrg(pOrg_id, pOrg_inst : integer; pOrgName : string;
                       pSale_id, pSale_inst : integer; pTable_name : string;
                       var SaleToDeadbeat : TSaleToDeadbeat);
Begin
  SaleToDeadbeat.OldOrgId := pOrg_id;
  SaleToDeadbeat.OldOrgInst := pOrg_inst;
  SaleToDeadbeat.Sale_id := pSale_id;
  SaleToDeadbeat.Sale_inst := pSale_inst;
  SaleToDeadbeat.Table_name := pTable_name;
  if SaleToDeadbeat.NewOrgName = '' then SaleToDeadbeat.NewOrgName := pOrgName;
  SaleToDeadbeat.OldOrgIsDebetor := 0<
   GetSQLValue('select count(*) from OIL_SALE_DEADBEAT_LOG where state=''Y'' and sale_id='+IntToStr(pSale_id)+
             ' and sale_inst='+IntToStr(pSale_inst)+' and table_name='''+pTable_name+
             ''' and inst='+IntToStr(REAL_INST)+' and org_id='+IntToStr(pOrg_id)+' and org_inst='+IntToStr(pOrg_inst));
End;

Function InitNewOrg(pOrg_id, pOrg_inst : integer; pOrgName : string;
                     pSale_id, pSale_inst : integer; pTable_name : string;
                     var SaleToDeadbeat : TSaleToDeadbeat; pShowMessage : boolean = True) : boolean;
  var vNewOrgIsDebetor, StoreParams : boolean;
      SaleStr : string;
// Функция проверяет, является ли организация дебетором
// если да - предупреждает юзера и в случае его согласия с выбором - сохраняет параметры отпуска 
Begin
  StoreParams := True;

  vNewOrgIsDebetor := 0<
        GetSQLValue('select count(*) from OIL_DEADBEAT where state=''Y'' and org_id='+IntToStr(pOrg_id)+
                    ' and org_inst='+IntToStr(pOrg_inst)+' and inst='+IntToStr(REAL_INST));

  Result := not vNewOrgIsDebetor;
  SaleStr := TranslateText('Отпуски таким организациям запрещены!');

  if pTable_name = 'OIL_SERVICE'
     then SaleStr := TranslateText('Предоставление услуг таким организациям запрещено!');

  if vNewOrgIsDebetor and pShowMessage
     then if MessageDlgExt(TranslateText('Внимание!')+#13#10+TranslateText('Организация ')+#13#10+pOrgName+#13#10+
                           TranslateText(' имеет просроченную задолженность.')+#13#10+
                           SaleStr,
                           mtWarning,[TranslateText('Продолжить'),TranslateText('Отменить')],2)<>1
          then StoreParams := False;

    if StoreParams
    then Begin
      Result := True;
      SaleToDeadbeat.Sale_id := pSale_id;
      SaleToDeadbeat.Sale_inst := pSale_inst;
      SaleToDeadbeat.Table_name := pTable_name;
      SaleToDeadbeat.NewOrgId := pOrg_id;
      SaleToDeadbeat.NewOrgInst := pOrg_inst;
      SaleToDeadbeat.NewOrgName := pOrgName;
      SaleToDeadbeat.NewOrgIsDebetor := vNewOrgIsDebetor;
    End;
End;

procedure SwitchDeadbeatToN;
Begin
  _ExecSQL('update OIL_DEADBEAT set state = ''N'' where state = ''Y''');
End;

procedure MarkDeadbeat(org_id, org_inst : integer; summa : real);
Begin
  DBSaver.SaveRecord('OIL_DEADBEAT',
    ['ORG_ID',    Org_Id,
     'ORG_INST',  Org_inst,
     'STATE',     'Y',
     'INST',      REAL_INST,
     'DATE_',    null,
     'SUMMOVER', summa
    ]);
End;

Procedure DeleteSaleFromLog(Sale_id,Sale_inst,inst : integer; table_name : string);
Begin
  _ExecSQL('update OIL_SALE_DEADBEAT_LOG set state=''N'' where sale_id='+IntToStr(Sale_id)+
             ' and sale_inst='+IntToStr(sale_inst)+' and table_name='''+table_name+''' and inst='+IntToStr(inst));
End;

procedure TLogSaleDeadbeatForm.bbOkClick(Sender: TObject);
  var S : string;
begin
  try

      if edtRespondent.Text = ''
         then Raise Exception.Create(TranslateText('Введите свою фамилию !'));

      if edtInstructor.Text = ''
         then Raise Exception.Create(TranslateText('Введите, по чьему указанию производится отпуск !'));

      S := edtRespondent.Text;
      if (Length(S) <3) or
         (ANSIUpperCase(Copy(S,1,1))<> Copy(S,1,1)) or
         (Pos('1',S)+Pos('2',S)+Pos('3',S)+Pos('4',S)+Pos('5',S)+Pos('6',S)+
          Pos('7',S)+Pos('8',S)+Pos('9',S)+Pos('0',S)<>0)
      then Raise Exception.Create(TranslateText('Неправильно введена фамилия !'));

      S := edtInstructor.Text;
      if (Length(S) <3) or
         (ANSIUpperCase(Copy(S,1,1))<> Copy(S,1,1)) or
         (Pos('1',S)+Pos('2',S)+Pos('3',S)+Pos('4',S)+Pos('5',S)+Pos('6',S)+
          Pos('7',S)+Pos('8',S)+Pos('9',S)+Pos('0',S)<>0)
      then Raise Exception.Create(TranslateText('Неправильно введена фамилия распорядителя!'));

     DBSaver.SaveRecord('OIL_SALE_DEADBEAT_LOG',
       ['INST',       REAL_INST,
        'STATE',      'Y',
        'SALE_ID',    SaleToDeadbeat.Sale_id,
        'SALE_INST',  SaleToDeadbeat.Sale_inst,
        'TABLE_NAME', SaleToDeadbeat.Table_name,
        'ORG_ID',     SaleToDeadbeat.NewOrgId,
        'ORG_INST',   SaleToDeadbeat.NewOrgInst,
        'DATE_',      xdeSaleDate.Date,
        'USER_',      edtRespondent.Text,
        'INSTRUCTOR', edtInstructor.Text
       ]);

      Self.ModalResult := mrOK;

  except on E:Exception do Begin
      ShowMessage(E.Message)
    End;
  End;


end;

procedure TLogSaleDeadbeatForm.FormShow(Sender: TObject);
begin
 Self.ModalResult := mrNone;

 if SaleToDeadbeat.Table_name ='OIL_RASHOD'
    then edtSaleType.Text := TranslateText('Отпуск нефтепродуктов (id=')+IntToStr(SaleToDeadbeat.Sale_id)+')';
 if SaleToDeadbeat.Table_name ='OIL_TALON_OUT'
    then edtSaleType.Text := TranslateText('Отпуск талонов (id=')+IntToStr(SaleToDeadbeat.Sale_id)+')';
 if SaleToDeadbeat.Table_name ='OIL_SERVICE'
    then edtSaleType.Text := TranslateText('Услуга (id=')+IntToStr(SaleToDeadbeat.Sale_id)+')';

 edtOrg.Text := SaleToDeadbeat.NewOrgName;
end;

end.
