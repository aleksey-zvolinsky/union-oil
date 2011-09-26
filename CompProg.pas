unit CompProg;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGridEh, Buttons, StdCtrls,
  ExtCtrls, CompProgAdd, ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess{$IFDEF VER150},Variants{$ENDIF};

type
  TFCompProg = class(TBaseForm)
    sp1: TOilStoredProc;
    EProg: TEdit;
    Label1: TLabel;
    SpeedButton5: TSpeedButton;
    qExam: TOilQuery;
    procedure sbAddClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject); 
    procedure sbDelClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCompProg: TFCompProg;
  NewProg : Boolean;
  curr_id, curr_inst: integer;
implementation
Uses Main, OilStd;

{$R *.DFM}

procedure TFCompProg.sbAddClick(Sender: TObject);
var CF:TFCompProgAdd;
begin
 CF:=TFCompProgAdd.Create(Application);
 CF.mode:=1;
 CF.ShowModal;
 CF.free;
 bbSearchClick(nil)
end;

procedure TFCompProg.bbSearchClick(Sender: TObject);
begin
   if not NewProg then
   Begin
         // Получаем текущую строку
          curr_id:= q.fieldbyname('id').AsInteger;
          curr_inst:= q.fieldbyname('inst').AsInteger;
         //-----
          NewProg:=False;
   end;
 q.close;
 q.sql.clear;
 q.sql.add(' SELECT * '+
           ' FROM  OIL_COMP_PROG '+
           ' where (state=''Y'') ');
  if (EProg.text<>IntToStr(0)) and (EProg.text<>'') then
  begin
  q.sql.add(' And ('+' Upper(Prog) like ''%'+ ANSIUpperCase(EProg.text)+'%'') ');
  end;
  q.sql.text:=q.sql.text;
  q.open;
  // Позиционируем курсор
  q.Locate('id;inst', VarArrayOf([curr_id, curr_inst]), []);
end;

procedure TFCompProg.sbEditClick(Sender: TObject);
var CF:TFCompProgAdd;
begin
 if not q.eof then
 begin
  CF:=TFCompProgAdd.Create(Application);
  CF.mode:=2;
  CF.MnID:=q.fieldbyname('id').value;
  CF.MnINST:=q.fieldbyname('inst').value;
  if CF.MnINST<>INST then CF.bbOK.Enabled := false;
  CF.ShowModal;
  CF.free;
  bbSearchClick(nil);
 end;
end;

procedure TFCompProg.sbDelClick(Sender: TObject);
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
 qExam.SQL.add(' SELECT PROG_ID, PROG_INST '+
               ' FROM OIL_COMP_LPROG '+
               ' where (state=''Y'') '+
               ' AND (PROG_ID='+''+IntToStr(q.fieldbyname('id').asinteger)+''+') '+
               ' AND (PROG_INST='+''+IntToStr(q.fieldbyname('inst').asinteger)+''+')');
 qExam.Open;
 if (qExam.fieldbyname('PROG_ID').asinteger=q.fieldbyname('id').asinteger) and (qExam.fieldbyname('PROG_INST').asinteger=q.fieldbyname('inst').asinteger) then
   begin
     res:=TranslateText('Нельзя удалить запись на которую есть ссылка !');
     ShowMessage(res);
     Exit;
   end;

 res:=TranslateText('Вы уверены что хотите удалить программу ?');
 if MessageDlg(res,mtCustom,[mbYes,mbNo],0)=mrNo then Exit;
 try
 StartSQL;
 with sp1 do
  begin
  StoredProcName := 'OIL.INSORUPDOIL_COMP_PROG';
  Prepare;
  ParamByName('ID#').AsInteger   :=q.fieldbyname('id').asinteger;
  ParamByName('INST#').AsInteger :=q.fieldbyname('inst').asinteger;
  ParamByName('STATE#').AsString :='N';
  ParamByName('PROG#').AsString :=q.fieldbyname('Prog').AsString;
  ParamByName('license#').AsString :=q.fieldbyname('license').AsString;
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

procedure TFCompProg.SpeedButton5Click(Sender: TObject);
begin
    EProg.Text:='';
end;

procedure TFCompProg.bbClearClick(Sender: TObject);
begin
    EProg.Text:='';
end;

procedure TFCompProg.FormCreate(Sender: TObject);
var i:integer;
begin
  inherited;
  pAdd.Visible:=true;
  pEdit.Visible:=true;
  pDel.Visible:=true;
  InsideTransaction:=FALSE;
  if DBGrid1.Columns.Count>0 then
  begin
     DBGrid1.Columns[0].Title.SortMarker:=smDownEh;
     for i:=0 to DBGrid1.Columns.Count-1 do
         DBGrid1.Columns[i].Title.TitleButton:=TRUE;
  end;
  q.close;
  q.open;
end;

end.
