unit CompIFaceAdd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBTables, Db, uCommonForm,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess;

type
  TFCompIFaceAdd = class(TCommonForm)
    pButtons: TPanel;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    EIFace: TEdit;
    LIFace: TLabel;
    Query1: TOilQuery;
    Query2: TOilQuery;
    sp1: TOilStoredProc;
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
  FCompIFaceAdd: TFCompIFaceAdd;
  mId, mInst:integer;
implementation
 uses  main, OilStd;
{$R *.DFM}

function TFCompIFaceAdd.GetSQ: Integer;
begin
if (Query2.Active) then Query2.Close;
Query2.SQL.Text:='select s_oil_comp_iface.nextval as sq from sys.dual';
Query2.Open;
Result:=Query2.FieldByName('sq').AsInteger;
end;

procedure TFCompIFaceAdd.bbOKClick(Sender: TObject);
var res : String;
begin
  if EIFace.Text=' 'then
   begin
       ShowMessage(TranslateText('Необходимо указать название интерфейса'));
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
     end; // 1:
   2: // редактировать
     begin
        mId:=query1.FieldByName('id').AsInteger;
        mInst:=query1.FieldByName('inst').AsInteger;
     end;//  2:
  end; // case mode of
 StoredProcName := 'OIL.INSORUPDOIL_COMP_IFACE';
 Prepare;
 ParamByName('ID#').AsInteger  :=mId;
 ParamByName('INST#').AsInteger:=mInst;
 ParamByName('STATE#').AsString:='Y';
 ParamByName('IFACE#').AsString:=EIFace.text;

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

procedure TFCompIFaceAdd.FormShow(Sender: TObject);
begin
 case mode of
  1: // режим новая
   ;
  2: // режим редактировать
   begin
     query1.Close;
     query1.SQL.Text:='select * from oil_comp_iface where id='+IntToStr(MnId)+
                                             ' and inst='+IntToStr(MnINST);
     query1.Open;

     eiface.text:=query1.FieldByName('IFACE').AsString;
   end;
 end; //case
end;

end.
