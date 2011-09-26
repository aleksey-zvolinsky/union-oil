unit CompInfoAdd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RxRichEd, Mask, ToolEdit, ExtCtrls, Buttons, RXCtrls, Db,
  DBTables, Grids, DBGrids, RXDBCtrl, RxMemDS, uCommonForm,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess;

type
  TFCompInfoAdd = class(TCommonForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CECfg: TComboEdit;
    CEUser: TComboEdit;
    CEOS: TComboEdit;
    EAssigment: TEdit;
    Label5: TLabel;
    pButtons: TPanel;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    sp1: TOilStoredProc;
    sp2: TOilStoredProc;
    Query1: TOilQuery;
    Query2: TOilQuery;
    sg1: TStringGrid;
    sbAdd: TSpeedButton;
    sbDel: TSpeedButton;
    q3: TOilQuery;
    Label4: TLabel;
    Label20: TLabel;
    ceOrg: TComboEdit;
    qAfterEdit: TOilQuery;
    procedure CECfgButtonClick(Sender: TObject);
    procedure CEUserButtonClick(Sender: TObject);
    procedure CEOSButtonClick(Sender: TObject);
    procedure CECfgDblClick(Sender: TObject);
    procedure CEUserDblClick(Sender: TObject);
    procedure CEOSDblClick(Sender: TObject);
    procedure bbAddClick(Sender: TObject);
    procedure bbOKClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ceOrgButtonClick(Sender: TObject);
    procedure sg1DblClick(Sender: TObject);

  private
    { Private declarations }
        function GetSQ: Integer;
        function GetSQL: Integer;
  public
        MnID, MnINST, MnIDos, MnINSTos, MnIDuser, MnINSTuser, MnIDcfg, MnINSTcfg : Integer;
        mode: Integer;

    { Public declarations }
  end;

var
   FCompInfoAdd: TFCompInfoAdd;
   mes, NAMEPROG : string;
   Cfg_ID, Cfg_INST, User_ID, User_INST, OS_ID, OS_INST, PROG_ID, PROG_INST : Integer;
   mId, mInst, mIdL, mInstL: Integer;
   counter : integer;
implementation
  uses  main, OilStd, CompCfg, CompUser, CompOS, CompProg, CompIFace,
        CompInfo, ChooseOrg;
var
   SearchDepID, SearchDepInst : integer;
{$R *.DFM}

function TFCompInfoAdd.GetSQ: Integer; //берется следущее значение ID
begin
     if (Query2.Active) then Query2.Close;
     Query2.SQL.Text:='select s_oil_comp_info.nextval as sq from sys.dual';
     Query2.Open;
     Result:=Query2.FieldByName('sq').AsInteger;
end;

function TFCompInfoAdd.GetSQL: Integer;  //берется следущее значение ID
begin
     if (Query2.Active) then Query2.Close;
     Query2.SQL.Text:='select s_oil_comp_lprog.nextval as sq from sys.dual';
     Query2.Open;
     Result:=Query2.FieldByName('sq').AsInteger;
end;

procedure TFCompInfoAdd.CECfgButtonClick(Sender: TObject);
var
   Cfg : TFCompCfg;
begin
     Cfg:=TFCompCfg.Create(FCompCfg);
     Cfg.bbOk.Visible:=True;
     mes:='';
     try
        if (Cfg.ShowModal=mrOK) then
          begin
               CFG_ID:=Cfg.q.FieldByName('id').AsInteger;
               CFG_INST:=Cfg.q.FieldByName('INST').AsInteger;
               ceCfg.Text:=Cfg.q.FieldByName('MODEL_PROC').AsString + ' ' +
               Cfg.q.FieldByName('NUM_PROC').AsString + 'Mhz' + '/' +
               Cfg.q.FieldByName('MOTHER_CARD').AsString + '/' +
               Cfg.q.FieldByName('RAM').AsString + 'Mb' + '/' +
               Cfg.q.FieldByName('CAPACITY').AsString + 'Gb' + '/' +
               Cfg.q.FieldByName('RAM_VIDEO').AsString + 'Mb';
          end;
     finally
     Cfg.Free;
     end;
     if (Length(mes)>0) then ShowMessage(mes);

end;

procedure TFCompInfoAdd.CEUserButtonClick(Sender: TObject);
var User : TFCompUser;
begin
  User:=TFCompUser.Create(FCompUser);
  User.bbOk.Visible:=True;
  mes:='';

 try
  if (User.ShowModal=mrOK) then
   begin
      User_ID:=User.q.FieldByName('id').AsInteger;
      User_INST:=User.q.FieldByName('INST').AsInteger;
      ceUser.Text:= User.q.FieldByName('DEPARTMENT').AsString + '/' +
       User.q.FieldByName('POST_').AsString + '/' + User.q.FieldByName('F_NAME').AsString;
   end;
 finally
  User.Free;
 end;

 if (Length(mes)>0) then ShowMessage(mes);

end;

procedure TFCompInfoAdd.CEOSButtonClick(Sender: TObject);
var OS : TFCompOS;
begin
  OS:=TFCompOS.Create(FCompOS);
  OS.bbOk.Visible:=True;
  mes:='';

 try
  if (OS.ShowModal=mrOK) then
   begin
    OS_ID:=OS.q.FieldByName('id').AsInteger;
    OS_INST:=OS.q.FieldByName('INST').AsInteger;
    ceOS.Text:= OS.q.FieldByName('os').AsString;
   end;
 finally
  OS.Free;
 end;

  if (Length(mes)>0) then ShowMessage(mes);


end;

procedure TFCompInfoAdd.CECfgDblClick(Sender: TObject);
begin
     CECfgButtonClick(Sender) ;
end;

procedure TFCompInfoAdd.CEUserDblClick(Sender: TObject);
begin
     CEUserButtonClick(Sender);
end;

procedure TFCompInfoAdd.CEOSDblClick(Sender: TObject);
begin
     CEOSButtonClick(Sender);
end;

procedure TFCompInfoAdd.bbAddClick(Sender: TObject);
var
    t, r: integer;
    PROG : TFCompPROG;
begin
  PROG:=TFCompPROG.Create(FCompPROG);
  PROG.bbOk.Visible:=True;
  mes:='';

 try
  if (PROG.ShowModal=mrOK) then
   begin
    PROG_ID:=PROG.q.FieldByName('id').AsInteger;
    PROG_INST:=PROG.q.FieldByName('INST').AsInteger;
    NAME:= PROG.q.FieldByName('PROG').AsString;
   end;
 finally
  PROG.Free;
 end;

  if (Length(mes)>0) then ShowMessage(mes);
  with sg1 do
  begin
    for r:=0 to Sg1.RowCount-1 do
      if (sg1.Cells[5,r]=IntToStr(Prog_id)) and (sg1.Cells[6,r]=IntToStr(Prog_inst))
     then
        begin
          ShowMessage(TranslateText('Данная программа уже выбрана!'));
          exit;
        end;
    if Cells[0,0]<>'' then RowCount:=RowCount+1;
    t:=RowCount-1;
    Cells[0,t]:='';
    Cells[5,t]:=IntToStr(PROG_ID);
    Cells[6,t]:=IntToStr(PROG_INST);

  end;//with sg1



end;

procedure TFCompInfoAdd.bbOKClick(Sender: TObject);
var res : String;
    t : integer;
begin
//Проверка заполнения
 if CECfg.Text='' then
   begin
       ShowMessage(TranslateText('Необходимо указать конфигурацию компьютера'));
       exit;
   end;
 if CEUser.Text='' then
   begin
       ShowMessage(TranslateText('Необходимо указать пользователя компьютера'));
       exit;
   end;
 if CEOS.Text='' then
   begin
       ShowMessage(TranslateText('Необходимо указать операционную систему компьютера'));
       exit;
   end;
 if EAssigment.Text='' then
   begin
       ShowMessage(TranslateText('Необходимо указать назначение компьютера'));
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
         NewInfo:=True;
      end; // 1:
    2: // редактировать
      begin
         mId:=query1.FieldByName('INFO_ID').AsInteger;
         mInst:=query1.FieldByName('INFO_INST').AsInteger;
         newInfo:=False;
      end;//  2:
   end; // case mode of

  StoredProcName := 'OIL.INSORUPDOIL_COMP_INFO';

  Prepare;
  ParamByName('ID#').AsInteger  :=mId;
  ParamByName('INST#').AsInteger:=mInst;
  ParamByName('STATE#').AsString:='Y';
  ParamByName('COMPCFG_ID#').AsInteger:=CFG_ID;
  ParamByName('COMPCFG_INST#').AsInteger:=CFG_INST;
  ParamByName('USER_ID#').AsInteger:=USER_ID;
  ParamByName('USER_INST#').AsInteger:=USER_INST;
  ParamByName('OS_ID#').AsInteger:=OS_ID;
  ParamByName('OS_INST#').AsInteger:=OS_INST;
  ParamByName('ASSIGMENT#').AsString:=EAssigment.Text;
  ParamByName('ORG_ID#').AsInteger:=SearchDepId;
  ParamByName('ORG_INST#').AsInteger:=SearchDepInst;
  ExecProc;
 end; //with sp1
  with sp2 do
  begin
   for t:=0 to SG1.RowCount-1 do
   begin

   // ' ' оставить старую запись не тронутой
     if SG1.Cells[3,t]<>' ' then
     begin

   // '-' удаления записи
      if (SG1.Cells[3,t]='-') and (sg1.Cells[1,t]<>'') and (sg1.Cells[2,t]<>'') then
        begin
         mIdL:=StrToInt(SG1.Cells[1,t]);
         mInstL:=StrToInt(SG1.Cells[2,t]);
         StoredProcName := 'OIL.INSORUPDOIL_COMP_LPROG';

         Prepare;
         ParamByName('ID#').AsInteger  :=mIdL;
         ParamByName('INST#').AsInteger:=mInstL;
         ParamByName('STATE#').AsString:='N';
         ParamByName('PROG_ID#').AsInteger:=StrToInt(SG1.Cells[4,t]);
         ParamByName('PROG_INST#').AsInteger:=StrToInt(SG1.Cells[5,t]);
         ParamByName('INFO_ID#').AsInteger:=mId;
         ParamByName('INFO_INST#').AsInteger:=mInst;
         ExecProc;
         Res:=ParamByName('Result').AsString;
         if (Length(Res)>0) and (Res[1]<>'0') then
                Raise Exception.Create(SubStr(Res,2));
        end; // '-'

      // '+' добавление новой записи
      if SG1.Cells[3,t]='+' then
        begin
         mIdL:=GetSQL;
         mInstL:=INST;
         StoredProcName := 'OIL.INSORUPDOIL_COMP_LPROG';

         Prepare;
         ParamByName('ID#').AsInteger  :=mIdL;
         ParamByName('INST#').AsInteger:=mInstL;
         ParamByName('STATE#').AsString:='Y';
         ParamByName('PROG_ID#').AsInteger:=StrToInt(SG1.Cells[4,t]);
         ParamByName('PROG_INST#').AsInteger:=StrToInt(SG1.Cells[5,t]);
         ParamByName('INFO_ID#').AsInteger:=mId;
         ParamByName('INFO_INST#').AsInteger:=mInst;
         ExecProc;
         Res:=ParamByName('Result').AsString;
         if (Length(Res)>0) and (Res[1]<>'0') then
                Raise Exception.Create(SubStr(Res,2));
        end; // '+'

     end; // ' '
   end; // for
  end;//with sp2
 CommitSQL;
 ModalResult:=mrOk

  except On E:Exception Do
   begin
    MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
    RollbackSQL;
   end;
  end; // except
  OnlyID:=mId;
  OnlyInst:=mInst;
end;



procedure TFCompInfoAdd.sbAddClick(Sender: TObject);     //добавление программ
var
    t, r: integer;
    PROG : TFCompPROG;
begin
  PROG:=TFCompPROG.Create(Application);
  PROG.bbOk.Visible:=True;
  mes:='';

 try
  PROG.ShowModal;
  if (prog.modalResult=mrOk) then
   begin
    PROG_ID:=PROG.q.FieldByName('id').AsInteger;
    PROG_INST:=PROG.q.FieldByName('INST').AsInteger;
    NAMEPROG:= PROG.q.FieldByName('PROG').AsString;
   end
  else exit
 finally
  PROG.Free;
 end;

  if (Length(mes)>0) then ShowMessage(mes);


  with sg1 do
  begin
    for r:=0 to Sg1.RowCount-1 do
      if (sg1.Cells[4,r]=IntToStr(Prog_id)) and (sg1.Cells[5,r]=IntToStr(Prog_inst))
        then
        begin
          if sg1.Cells[3,r]='-' then
            begin
             if (sg1.Cells[1,r]='') and (sg1.Cells[2,r]='') then sg1.Cells[3,r]:='+'
             else sg1.Cells[3,r]:=' ';
            end
          else
          ShowMessage(TranslateText('Данная программа уже выбрана!'));
          exit;
        end;
    if Cells[0,0]<>'' then RowCount:=RowCount+1;
    t:=RowCount-1;
    Cells[0,t]:=NAMEPROG;
    Cells[4,t]:=IntToStr(PROG_ID);
    Cells[5,t]:=IntToStr(PROG_INST);
    Cells[3,t]:='+';// 1 - новая запись о программе
  end;//with sg1

end;

procedure TFCompInfoAdd.sbDelClick(Sender: TObject);
begin
     sg1.Cells[3,sg1.row]:='-'; // 2 - удаленная запись программы
end;

procedure TFCompInfoAdd.FormShow(Sender: TObject);
var i : integer;
begin
        //ввод данных по редакт. - программы
     q3.Close;
     q3.SQL.Clear;
     q3.SQL.Add( ' SELECT Oil_comp_prog.PROG, Oil_comp_lprog.INST, Oil_comp_lprog.ID, ' +
                 ' Oil_comp_lprog.PROG_INST , Oil_comp_lprog.PROG_ID  ' +
                 ' FROM OIL_COMP_PROG , OIL_COMP_LPROG , OIL_COMP_INFO ' +
                 ' WHERE  (Oil_comp_info.INST = Oil_comp_lprog.INFO_INST) ' +
                 ' AND  (Oil_comp_info.ID = Oil_comp_lprog.INFO_ID) ' +
                 ' AND  (Oil_comp_lprog.PROG_ID = Oil_comp_prog.ID) ' +
                 ' AND  (Oil_comp_lprog.PROG_INST = Oil_comp_prog.INST) ' +
                 ' AND  (Oil_comp_info.ID = ' + IntToStr(MnID) +') ' +
                 ' AND  (Oil_comp_info.INST = ' + IntToStr(MnINST) +') ' +
                 ' AND  (Oil_comp_info.STATE = ''Y'' )' +
                 ' AND  (Oil_comp_lprog.STATE = ''Y'' )' +
                 ' AND  (Oil_comp_prog.STATE = ''Y'' )'
               );
     q3.open;

     for i:=0 to q3.RecordCount-1 do
       begin
         sg1.Cells[0,i]:=q3.fieldByName('PROG').AsString;
         sg1.Cells[1,i]:=IntToStr(q3.fieldByName('ID').AsInteger);
         sg1.Cells[2,i]:=IntToStr(q3.fieldByName('INST').AsInteger);
         sg1.Cells[3,i]:=' ';
         sg1.cells[4,i]:=IntToStr(q3.fieldByName('PROG_ID').AsInteger);
         sg1.Cells[5,i]:=IntToStr(q3.fieldByName('PROG_INST').AsInteger);
         if i<>q3.RecordCount-1 then begin
                                        q3.NExt;
                                        sg1.rowcount:=sg1.rowcount+1;
                                     end;
       end;
 case mode of
  1: // режим новая
   ;
  2: // режим редактировать
   begin
           //ввод данных по редакт. - остальное
    query1.Close;
    query1.SQL.Clear;
    query1.SQL.Add('SELECT Oil_comp_info.ORG_ID, Oil_comp_info.ORG_INST, OIL_EMPLOY.F_NAME, OIL_EMPLOY.POST_, OIL_ORG.ID, OIL_ORG.INST, OIL_ORG.NAME ORGNAME, Oil_comp_cfg.MODEL_PROC, Oil_comp_cfg.NUM_PROC, Oil_comp_cfg.CAPACITY, Oil_comp_os.OS,  '+
' Oil_comp_info.COMPCFG_ID, Oil_comp_info.COMPCFG_INST, Oil_comp_info.ID INFO_ID, Oil_comp_info.INST INFO_INST, Oil_comp_info.STATE,  '+
' Oil_comp_info.ASSIGMENT IASSIGMENT, Oil_comp_info.USER_ID, Oil_comp_info.USER_INST, Oil_comp_info.OS_ID, Oil_comp_info.OS_INST,  '+
' Oil_comp_info.DATE_MOD, Oil_comp_user.DEPARTMENT, Oil_comp_cfg.MOTHER_CARD, Oil_comp_cfg.RAM, Oil_comp_cfg.RAM_VIDEO  '+
' FROM OIL_EMPLOY, v_org OIL_ORG, OIL_COMP_CFG Oil_comp_cfg, OIL_COMP_INFO Oil_comp_info, OIL_COMP_OS Oil_comp_os, OIL_COMP_USER Oil_comp_user   '+
' WHERE  (Oil_comp_cfg.ID = Oil_comp_info.COMPCFG_ID)        '+
'   AND  (Oil_comp_cfg.INST = Oil_comp_info.COMPCFG_INST)  '+
'   AND  (Oil_comp_info.OS_ID = Oil_comp_os.ID)           '+
'   AND  (Oil_comp_info.OS_INST = Oil_comp_os.INST)      '+
'   AND  (Oil_comp_info.ORG_ID = OIL_ORG.ID)           '+
'   AND  (Oil_comp_info.ORG_INST = OIL_ORG.INST)      '+
'   AND  (Oil_comp_info.USER_ID = Oil_comp_user.ID)     '+
'   AND  (Oil_comp_info.USER_INST = Oil_comp_user.INST)   '+
'   AND  (Oil_comp_user.EMPLOY_ID = OIL_EMPLOY.ID)     '+
'   AND  (Oil_comp_user.EMPLOY_INST = OIL_EMPLOY.INST)   '+
'   AND  (Oil_comp_cfg.STATE=''Y'')   '+
'   AND  (Oil_comp_os.STATE=''Y'')   '+
'   AND  (Oil_comp_info.STATE=''Y'')  '+
'   AND  (Oil_comp_user.STATE=''Y'')  '+
'   AND  (Oil_comp_info.ID = '+IntToStr(MnId)+')          '+
'   AND  (Oil_comp_info.INST = '+IntToStr(MnINST)+')       ');

    query1.open;
    ceCfg.Text:= query1.FieldByName('MODEL_PROC').AsString + ' ' +
     query1.FieldByName('NUM_PROC').AsString + 'Mhz' + '/' +
     query1.FieldByName('MOTHER_CARD').AsString + '/' +
     query1.FieldByName('RAM').AsString + 'Mb' + '/' +
     query1.FieldByName('CAPACITY').AsString + 'Gb' + '/' +
     query1.FieldByName('RAM_VIDEO').AsString + 'Mb';
    CFG_ID:= StrToInt(query1.FieldByName('COMPCFG_ID').AsString);
    CFG_INST:= StrToInt(query1.FieldByName('COMPCFG_INST').AsString);

    ceUser.Text:= query1.FieldByName('DEPARTMENT').AsString + '/' +
     query1.FieldByName('POST_').AsString + '/' + query1.FieldByName('F_NAME').AsString;
    USER_ID:= StrToInt(query1.FieldByName('USER_ID').AsString);
    USER_INST:= StrToInt(query1.FieldByName('USER_INST').AsString);

    ceOS.Text:= query1.FieldByName('os').AsString;
    OS_ID:= StrToInt(query1.FieldByName('OS_ID').AsString);
    OS_INST := StrToInt(query1.FieldByName('OS_INST').AsString);

    EAssigment.Text:= query1.FieldByName('IAssigment').AsString;

    ceOrg.Text:= query1.FieldByName('ORGNAME').AsString;
    SearchDepID:= StrToInt(query1.FieldByName('ORG_ID').AsString);
    SearchDepINST:= StrToInt(query1.FieldByName('ORG_INST').AsString);

   end; //case
end;
end;

procedure TFCompInfoAdd.ceOrgButtonClick(Sender: TObject);
var vName: string;
begin
if ChooseOrg.CaptureOrg(4,Main.Main_Id,Main.Inst,'yyy',SearchDepId,SearchDepInst,vName) then
 ceOrg.Text:=vName;
end;

procedure TFCompInfoAdd.sg1DblClick(Sender: TObject);

begin

if (sg1.Cells[3,sg1.row]='+') or (sg1.Cells[3,sg1.row]=' ') then
                       begin
                        sg1.Cells[3,sg1.row]:='-';
                        exit;
                       end;
if (sg1.Cells[3,sg1.row]='-') and (sg1.row <= q3.RecordCount-1)
                then sg1.Cells[3,sg1.row]:=' '
                else sg1.Cells[3,sg1.row]:='+';
end;

end.



