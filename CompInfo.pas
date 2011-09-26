unit CompInfo;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGridEh, Buttons, StdCtrls,
  ExtCtrls, Mask, ToolEdit, ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess{$IFDEF VER150},Variants{$ENDIF};

type
  TFCompInfo = class(TBaseForm)
    sp1: TOilStoredProc;
    ceOrg: TComboEdit;
    Label1: TLabel;
    SpeedButton5: TSpeedButton;
    procedure sbAddClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ceOrgButtonClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
   FCompInfo: TFCompInfo;
   OnlyID, OnlyInst : integer;
   NewInfo : boolean;
   curr_id, curr_inst: integer;
implementation
Uses Main, OilStd, ChooseOrg, CompInfoAdd;
{$R *.DFM}
var SearchDepID, SearchDepInst : integer;
    filtr : boolean;   //индикатор фильтров

procedure TFCompInfo.sbAddClick(Sender: TObject);
var
   CF:TFCompInfoAdd;
begin
    CF:=TFCompInfoAdd.Create(Application);
    CF.mode:=1;
    CF.ShowModal;
    CF.free;
    bbSearchClick(nil)
end;

procedure TFCompInfo.sbEditClick(Sender: TObject);
var
   CF:TFCompInfoAdd;
begin
     if not q.eof then
       begin
            CF:=TFCompInfoAdd.Create(Application);
            CF.mode:=2;
            CF.MnID:=q.fieldbyname('id').asinteger;
            CF.MnINST:=q.fieldbyname('inst').asinteger;
            if CF.MnINST<>INST then CF.bbOK.Enabled := false;
            CF.ShowModal;
            CF.free;
            bbSearchClick(nil)
       end;
end;

procedure TFCompInfo.sbDelClick(Sender: TObject);
var
   res: string;
begin
    //удаление записи----------
     if q.eof then Exit;
     if (q.fieldbyname('inst').asinteger<>INST) then
       begin
            res:=TranslateText('Нельзя удалить запись чужой организации !');
            ShowMessage(res);
            Exit;
       end;
     res:=TranslateText('Вы уверены что хотите удалить пользовательскую инфомацию компьютера?');
     if MessageDlg(res,mtCustom,[mbYes,mbNo],0)=mrNo then Exit;
     try
        StartSQL;
         with sp1 do
         begin
             StoredProcName := 'OIL.INSORUPDOIL_COMP_INFO';

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

procedure TFCompInfo.bbSearchClick(Sender: TObject);
begin
     if not NewInfo then
     Begin
          // Получаем текущую строку
          curr_id:= q.fieldbyname('id').AsInteger;
          curr_inst:= q.fieldbyname('inst').AsInteger;
         //-----
          NewInfo:=False;
     end;
     q.close;
     q.SQL.Clear;
     q.SQL.Add('  SELECT OIL_EMPLOY.F_NAME, OIL_EMPLOY.POST_, OIL_ORG.NAME ORGNAME, Oil_comp_cfg.MODEL_PROC, Oil_comp_cfg.NUM_PROC, Oil_comp_cfg.CAPACITY, Oil_comp_os.OS,  ' +
               '  Oil_comp_info.COMPCFG_ID, Oil_comp_info.COMPCFG_INST, Oil_comp_info.ID, Oil_comp_info.INST,  ' +
               '  Oil_comp_info.STATE, Oil_comp_info.ASSIGMENT IASSIGMENT, Oil_comp_info.USER_ID, Oil_comp_info.USER_INST,  ' +
               '  Oil_comp_info.OS_ID, Oil_comp_info.OS_INST, Oil_comp_info.DATE_MOD, Oil_comp_cfg.MOTHER_CARD, Oil_comp_cfg.RAM, Oil_comp_cfg.RAM_VIDEO  ' +
               '  FROM OIL_EMPLOY, v_org OIL_ORG, OIL_COMP_CFG Oil_comp_cfg, OIL_COMP_INFO Oil_comp_info, OIL_COMP_OS Oil_comp_os, OIL_COMP_USER Oil_comp_user  ' +
               '  WHERE  (Oil_comp_cfg.ID = Oil_comp_info.COMPCFG_ID ) '+
               '  AND  (Oil_comp_cfg.INST = Oil_comp_info.COMPCFG_INST ) '+
               '  AND  (Oil_comp_info.OS_ID = Oil_comp_os.ID ) '+
               '  AND  (Oil_comp_info.OS_INST = Oil_comp_os.INST ) '+
               '  AND  (Oil_comp_info.ORG_ID = OIL_ORG.ID)         '+
               '  AND  (Oil_comp_info.ORG_INST = OIL_ORG.INST)     '+
               '  AND  (Oil_comp_info.USER_ID = Oil_comp_user.ID )  '+
               '  AND  (Oil_comp_info.USER_INST = Oil_comp_user.INST ) '+
               '  AND  (Oil_comp_user.EMPLOY_ID = OIL_EMPLOY.ID)     '+
               '  AND  (Oil_comp_user.EMPLOY_INST = OIL_EMPLOY.INST)   '+
               '  AND  (Oil_comp_cfg.STATE=''Y'')  '+
               '  AND  (Oil_comp_os.STATE=''Y'')    '+
               '  AND  (Oil_comp_info.STATE=''Y'')  '+
               '  AND  (Oil_comp_user.STATE=''Y'')  ');
     if filtr=true then
       if (ceOrg.text<>IntToStr(0)) and (ceOrg.text<>'') then
         begin
              q.sql.add('  AND  (Oil_comp_info.ORG_ID = ' + IntToStr(SearchDepId) + ')         '+
                        '  AND  (Oil_comp_info.ORG_INST = ' + IntToStr(SearchDepInst) + ')     ');
         end;
     q.open;
     // Позиционируем курсор
     q.Locate('id;inst', VarArrayOf([curr_id, curr_inst]), [])

end;

procedure TFCompInfo.FormShow(Sender: TObject);
begin
     q.Close;
     q.Open;
end;

procedure TFCompInfo.ceOrgButtonClick(Sender: TObject);
var
   vName: string;
begin
if ChooseOrg.CaptureOrg(4,Main.Main_Id,Main.Inst,'yyy',SearchDepId,SearchDepInst,vName) then
   ceOrg.Text:=vName;
   filtr:=True;
end;

procedure TFCompInfo.bbClearClick(Sender: TObject);
begin
     //очистка фильтра
     ceOrg.Text:='';
     filtr:=false;
end;

procedure TFCompInfo.SpeedButton5Click(Sender: TObject);
begin
     inherited;
     ceOrg.Text:='';
     filtr:=False;
end;

procedure TFCompInfo.FormCreate(Sender: TObject);
var
   i:integer;
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
