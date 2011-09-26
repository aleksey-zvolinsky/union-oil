unit CompProgAdd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, uCommonForm,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess;

type
  TFCompProgAdd = class(TCommonForm)
    LName: TLabel;
    LProduction: TLabel;
    LVersion: TLabel;
    Lnote: TLabel;
    EName: TEdit;
    EProduction: TEdit;
    EVersion: TEdit;
    CBLicense: TCheckBox;
    pButtons: TPanel;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    Query2: TOilQuery;
    sp1: TOilStoredProc;
    Query1: TOilQuery;
    eNote: TEdit;
    procedure bbOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
        function GetSQ: Integer;
  public
    { Public declarations }
        MnID, MnINST: Integer;
        mode: Integer;
  end;

var
  FCompProgAdd: TFCompProgAdd;
  mId, mInst:integer;
implementation
 uses  main, OilStd, CompProg;
{$R *.DFM}

function TFCompProgAdd.GetSQ: Integer;     //берется следущее значение ID
begin
   if (Query2.Active) then Query2.Close;
   Query2.SQL.Text:='select s_oil_comp_prog.nextval as sq from sys.dual';
   Query2.Open;
   Result:=Query2.FieldByName('sq').AsInteger;
end;

procedure TFCompProgAdd.bbOKClick(Sender: TObject);
var res : String;
begin

//Проверка заполнения
 if CBLicense.State=cbGrayed then
   begin
       ShowMessage(TranslateText('Необходимо указать наличие лицензии'));
       exit;
   end;
 if EName.Text=' 'then
   begin
       ShowMessage(TranslateText('Необходимо указать название программы'));
       exit;
   end;
 try
 StartSQL;
 with sp1 do
 begin
  case mode of
   1: // добавить новую if mode=1 then
     begin
        mId:=GetSQ;
        mInst:=INST;
                //спозиционировать курсор
        curr_id:=mId;
        curr_inst:=mInst;
        NewProg:=True;
     end; // 1:
   2: // редактировать
     begin
        mId:=query1.FieldByName('id').AsInteger;
        mInst:=query1.FieldByName('inst').AsInteger;
        NewProg:=False;
     end;//  2:
  end; // case mode of

 StoredProcName := 'OIL.INSORUPDOIL_COMP_PROG';

 Prepare;
 ParamByName('ID#').AsInteger  :=mId;
 ParamByName('INST#').AsInteger:=mInst;
 ParamByName('STATE#').AsString:='Y';
 ParamByName('PROG#').AsString:=Ename.text;
 ParamByName('VER#').AsString:=EVersion.text;
 ParamByName('PRODUCTION#').AsString:=EProduction.text;
 if CBLicense.State=cbChecked then ParamByName('LICENSE#').AsString:='Y'
                              else ParamByName('LICENSE#').AsString:='N';
 ParamByName('NOTE#').AsString:=eNote.text;

 ExecProc;

 Res:=ParamByName('Result').AsString;
  if (Length(Res)>0) and (Res[1]<>'0') then
   Raise Exception.Create(SubStr(Res,2));

 CommitSQL;
 ModalResult:=mrOk

end; //with
  except On E:Exception Do
   begin
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
    RollbackSQL;
   end; // except
  end; // try  exceptend;
 end;
 
procedure TFCompProgAdd.FormShow(Sender: TObject);
begin
 case mode of
  1: // режим новая
   ;
  2: // режим редактировать
   begin
     query1.Close;
     query1.SQL.Text:='select * from oil_comp_prog where id='+IntToStr(MnId)+
                                             ' and inst='+IntToStr(MnINST)+
                                             '';
     query1.Open;

     eName.text:=query1.FieldByName('prog').AsString;
     eVersion.text:=query1.FieldByName('VER').AsString;
     eProduction.text:=query1.FieldByName('Production').AsString;
     eName.text:=query1.FieldByName('prog').AsString;
     if query1.FieldByName('License').AsString='Y'
               then CBLicense.State:=cbChecked
               else CBLicense.State:=cbUnChecked;
     eNote.text:=query1.FieldByName('Note').AsString;
   end;
 end; //case
end;

end.
