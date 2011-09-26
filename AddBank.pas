unit AddBank;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables,MAIN, ExtCtrls, uCommonForm,uOilQuery,Ora, uOilStoredProc;

type
  TAddBankForm = class(TCommonForm)
    sp: TOilStoredProc;
    q1: TOilQuery;
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure   FormShow(Sender: TObject);
    procedure  bbOkClick(Sender: TObject);
    procedure  FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Inst_Bank:integer;
  end;

var
  AddBankForm: TAddBankForm;
  AddBankMode:integer;
  BankId:LongInt;

implementation

{$R *.DFM}
uses oilstd,bankref;

procedure TAddBankForm.FormShow(Sender: TObject);
begin
 if AddBankMode=1 then begin
                        edit1.text:='';
                        edit2.text:='';
                       end;
 edit1.setfocus;
end;

procedure TAddBankForm.bbOkClick(Sender: TObject);
Var Res: string;
begin
   Try
      StartSQL;
      if Bankid =-1 then Begin
         q1.close;
         q1.open;
         BankId := q1.fields[0].value;
      End;
      With SP Do
      Begin
         StoredProcName := 'OIL.INSORUPDOIL_BANK';
         Prepare;
         ParamByName('ID#').AsInteger  := BankId;
         ParamByName('STATE#').AsString  := 'Y';
         ParamByName('INST#').AsInteger := INST_BANK;
         ParamByName('NAME#').AsString  := edit2.text;
         ParamByName('MFO#').AsString  := edit1.text;
         ExecProc;
         Res:=ParamByName('Result').AsString;
         If Length(Res)>0 Then
           If Res[1]<>'0' Then
             Raise Exception.Create(SubStr(Res,2));
         CommitSQL;
      End;
  Except On E:Exception Do
    Begin
      RollbackSQL;
      MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
    End;
  End;
end;

procedure TAddBankForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action:=caFree;
end;

end.
