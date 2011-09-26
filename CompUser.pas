unit CompUser;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGridEh, Buttons, StdCtrls,
  ExtCtrls, CompUserAdd, ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess{$IFDEF VER150},Variants{$ENDIF};

type
  TFCompUser = class(TBaseForm)
    sp1: TOilStoredProc;
    qExam: TOilQuery;
    EName: TEdit;
    Label1: TLabel;
    SpeedButton4: TSpeedButton;
    procedure sbAddClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCompUser: TFCompUser;
  curr_id, curr_inst: integer;
  NewUser : boolean;
implementation
Uses Main, OilStd;
{$R *.DFM}

procedure TFCompUser.sbAddClick(Sender: TObject);
var CF:TFCompUserAdd;
begin
 CF:=TFCompUserAdd.Create(Application);
 CF.mode:=1;
 CF.ShowModal;
 CF.free;
 bbSearchClick(nil)
end;

procedure TFCompUser.sbEditClick(Sender: TObject);
var CF:TFCompUserAdd;
begin
 if not q.eof then
 begin
  CF:=TFCompUserAdd.Create(Application);
  CF.mode:=2;
  CF.MnID:=q.fieldbyname('id').value;
  CF.MnINST:=q.fieldbyname('inst').value;
  if CF.MnINST<>INST then CF.bbOK.Enabled := false;
  CF.ShowModal;
  CF.free;
  bbSearchClick(nil)
 end;

end;

procedure TFCompUser.bbSearchClick(Sender: TObject);
begin
   if not NewUser then
   begin
     // Получаем текущую строку
     curr_id:= q.fieldbyname('id').AsInteger;
     curr_inst:= q.fieldbyname('inst').AsInteger;
     newUser:=False;
     //-----
   end;
  q.close;
    q.SQL.Clear;
    q.SQL.Add(' SELECT OIL_COMP_USER.EMPLOY_INST,  OIL_COMP_USER.EMPLOY_ID,  '+
    ' OIL_COMP_USER.ROOM,  OIL_COMP_USER.DEPARTMENT,  OIL_COMP_USER.LOCAL_NAME,  '+
    ' OIL_COMP_USER.LOCAL_GROUP,  OIL_COMP_USER.STATE,  OIL_COMP_USER.INST, '+
    ' OIL_COMP_USER.ID,  OIL_EMPLOY.I_NAME,  OIL_EMPLOY.F_NAME,  OIL_EMPLOY.O_NAME, '+
    ' OIL_EMPLOY.POST_ '+
    ' FROM OIL_EMPLOY, OIL_COMP_USER '+
    ' WHERE  (OIL_COMP_USER.STATE = ''Y'') '+
    ' AND  (OIL_EMPLOY.STATE = ''Y'') '+
    ' AND  (OIL_EMPLOY.ID = OIL_COMP_USER.EMPLOY_ID) '+
    ' AND  (OIL_EMPLOY.INST = OIL_COMP_USER.EMPLOY_INST) ');
    if (EName.Text<>'')then q.Sql.Add(' AND Upper(F_name) like ''%'+ANSIUpperCase(eName.Text)+'%''');
  q.open;
  // Позиционируем курсор
  q.Locate('id;inst', VarArrayOf([curr_id, curr_inst]), []);
end;

procedure TFCompUser.FormCreate(Sender: TObject);
begin
  inherited;
  pAdd.Visible:=true;
  pEdit.Visible:=true;
  pDel.Visible:=true;
  q.close;
  q.open;
end;

procedure TFCompUser.sbDelClick(Sender: TObject);
var
 res: string;
begin
 if q.eof then Exit;
 if (q.fieldbyname('inst').asinteger<>INST) then
   begin
     res:=TranslateText('Нельзя удалить запись чужой организации !');
     ShowMessage(res);
     Exit;
   end;
 // проверка на наличие ссылки в другой таблице
 qExam.Close;
 qExam.sql.Clear;
 qExam.SQL.add(' SELECT USER_ID, USER_INST '+
               ' FROM OIL_COMP_INFO Oil_comp_info '+
               ' where (state=''Y'') '+
               ' AND (USER_ID='+''+IntToStr(q.fieldbyname('id').asinteger)+''+') '+
               ' AND (USER_INST='+''+IntToStr(q.fieldbyname('inst').asinteger)+''+')');
 qExam.Open;
 if (qExam.fieldbyname('USER_ID').asinteger=q.fieldbyname('id').asinteger) and (qExam.fieldbyname('USER_INST').asinteger=q.fieldbyname('inst').asinteger) then
   begin
     res:=TranslateText('Нельзя удалить запись на которую есть ссылка !');
     ShowMessage(res);
     Exit;
   end;

 res:=TranslateText('Вы уверены что хотите удалить пользователя ?');
 if MessageDlg(res,mtCustom,[mbYes,mbNo],0)=mrNo then Exit;
 try
 StartSQL;
 with sp1 do
  begin
  StoredProcName := 'OIL.INSORUPDOIL_COMP_USER';
  Prepare;
  ParamByName('ID#').AsInteger   :=q.fieldbyname('id').asinteger;
  ParamByName('INST#').AsInteger :=q.fieldbyname('inst').asinteger;
  ParamByName('STATE#').AsString :='N';
  ExecProc;
  Res:=ParamByName('Result').AsString;
  if (Length(Res)>0) and (Res[1]<>'0') then
   Raise Exception.Create(SubStr(Res,2));
  end; // with sp1 do
 CommitSQL;
 except On E:Exception Do
  begin
  MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
  RollbackSQL;
  end; // try  StartSQL; ...
 end; // try  except On ...
 q.close;
 q.open;
end;

procedure TFCompUser.SpeedButton4Click(Sender: TObject);
begin
     EName.Text:='';
end;

procedure TFCompUser.bbClearClick(Sender: TObject);
begin
     EName.Text:='';
end;

end.
