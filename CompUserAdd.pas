unit CompUserAdd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBTables, Db, Mask, ToolEdit, uCommonForm,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess;

type
  TFCompUserAdd = class(TCommonForm)
    eAssigment: TEdit;
    EDepartment: TEdit;
    ERoom: TEdit;
    ELocalGroup: TEdit;
    ELocalName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    pButtons: TPanel;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    Query1: TOilQuery;
    Query2: TOilQuery;
    sp1: TOilStoredProc;
    ceName: TComboEdit;
    procedure bbOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ceNameButtonClick(Sender: TObject);
    procedure ERoomKeyPress(Sender: TObject; var Key: Char);
  private
        function GetSQ: Integer;
    { Private declarations }
  public
        MnID, MnINST: Integer;
        mode: Integer;  
    { Public declarations }
  end;

var
  FCompUserAdd: TFCompUserAdd;
  mId, mInst:integer;
  mes: string;
  Emp_ID, Emp_INST : integer;
implementation
 uses  main, OilStd, EmpRef, CompUser;
{$R *.DFM}

function TFCompUserAdd.GetSQ: Integer;    //берется следущее значение ID
begin
  if (Query2.Active) then Query2.Close;
  Query2.SQL.Text:='select s_oil_comp_prog.nextval as sq from sys.dual';
  Query2.Open;
  Result:=Query2.FieldByName('sq').AsInteger;
end;

procedure TFCompUserAdd.bbOKClick(Sender: TObject);
var res : String;
begin

  //Проверка заполнения
 if EAssigment.Text='' then
   begin
       ShowMessage(TranslateText('Необходимо указать должность пользователя'));
       exit;
   end;
 if ceName.Text=''then
   begin
       ShowMessage(TranslateText('Необходимо указать имя пользователя'));
       exit;
   end;
 if EDepartment.Text=''then
   begin
       ShowMessage(TranslateText('Необходимо указать отдел пользователя'));
       exit;
   end;
 if ERoom.Text=''then
   begin
       ShowMessage(TranslateText('Необходимо указать комнату пользователя'));
       exit;
   end;

 try
 StartSQL;
 with sp1 do
 begin
  case mode of
   1: // добавить новую
     begin
        mId:=GetSQ;
        mInst:=INST;

        //спозиционировать курсор
        curr_id:=mId;
        curr_inst:=mInst;
        NewUser:=True;

     end; // 1:
   2: // редактировать
     begin
        mId:=query1.FieldByName('id').AsInteger;
        mInst:=query1.FieldByName('inst').AsInteger;
        newUser:=False;
     end;//  2:
  end; // case mode of

 StoredProcName := 'OIL.INSORUPDOIL_COMP_USER';

 Prepare;
 ParamByName('ID#').AsInteger  :=mId;
 ParamByName('INST#').AsInteger:=mInst;
 ParamByName('STATE#').AsString:='Y';
 ParamByName('EMPLOY_ID#').AsString:=IntToStr(Emp_ID);
 ParamByName('EMPLOY_INST#').AsString:=IntToStr(Emp_INST);
 ParamByName('ROOM#').AsString:=eRoom.text;
 ParamByName('DEPARTMENT#').AsString:=eDepartment.text;
 ParamByName('LOCAL_NAME#').AsString:=eLocalName.text;
 ParamByName('LOCAL_GROUP#').AsString:=eLocalGroup.text;


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

procedure TFCompUserAdd.FormShow(Sender: TObject);
begin
 case mode of
  1: // режим новая
   ;
  2: // режим редактировать
   begin
     query1.Close;
     query1.SQL.Text:=' SELECT OIL_COMP_USER.EMPLOY_INST,  OIL_COMP_USER.EMPLOY_ID,  '+
    ' OIL_COMP_USER.ROOM,  OIL_COMP_USER.DEPARTMENT,  OIL_COMP_USER.LOCAL_NAME,  '+
    ' OIL_COMP_USER.LOCAL_GROUP,  OIL_COMP_USER.STATE,  OIL_COMP_USER.INST, '+
    ' OIL_COMP_USER.ID,  OIL_EMPLOY.I_NAME,  OIL_EMPLOY.F_NAME,  OIL_EMPLOY.O_NAME, '+
    ' OIL_EMPLOY.POST_ '+
    ' FROM OIL_EMPLOY, OIL_COMP_USER '+
    ' WHERE  (OIL_COMP_USER.STATE = ''Y'') '+
    ' AND  (OIL_EMPLOY.STATE = ''Y'') '+
    ' AND  (OIL_EMPLOY.ID = OIL_COMP_USER.EMPLOY_ID) '+
    ' AND  (OIL_EMPLOY.INST = OIL_COMP_USER.EMPLOY_INST) '+
    ' AND  (OIL_COMP_USER.id='+IntToStr(MnId)+' ) '+
    ' AND  (OIL_COMP_USER.inst='+IntToStr(MnINST)+' ) ';
     query1.Open;
     ceName.Text:=query1.FieldByName('F_NAME').AsString +' '+
      query1.FieldByName('I_NAME').AsString +' '+ query1.FieldByName('O_NAME').AsString;
     eAssigment.Text:=query1.FieldByName('POST_').AsString;
     EDepartment.text:=query1.FieldByName('Department').AsString;
     ERoom.text:=query1.FieldByName('Room').AsString;
     ELocalGroup.text:=query1.FieldByName('Local_Group').AsString;
     ELocalName.text:=query1.FieldByName('Local_Name').AsString;
     
     emp_id:=query1.FieldByName('EMPLOY_ID').AsInteger;
     emp_inst:=query1.FieldByName('EMPLOY_INST').AsInteger;
   end;
 end; //case
end;

procedure TFCompUserAdd.ceNameButtonClick(Sender: TObject);
var Emp : TEmpRefForm;
begin
  Emp:=TEmpRefForm.Create(EmpRefForm);
  Emp.bbOk.Visible:=True;
  mes:= '';

 try
  if (Emp.ShowModal=mrOK) then
   begin
    Emp_ID:=Emp.q.FieldByName('id').AsInteger;
    Emp_INST:=Emp.q.FieldByName('INST').AsInteger;
    ceName.Text:=Emp.q.FieldByName('F_NAME').AsString +' '+ Emp.q.FieldByName('I_NAME').AsString +' '+ Emp.q.FieldByName('O_NAME').AsString;
    eAssigment.Text:=Emp.q.FieldByName('POST_').AsString
   end;
 finally
  Emp.Free;
 end;
                                                          
  if (Length(mes)>0) then ShowMessage(mes);


end;

procedure TFCompUserAdd.ERoomKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8]) then key:=#0;
end;

end.
