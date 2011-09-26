unit CompOutDevice;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGridEh, Buttons, StdCtrls,
  ExtCtrls, CompOutDeviceAdd, Mask, ToolEdit, ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess{$IFDEF VER150},Variants{$ENDIF};

type
  TFCompOutDevice = class(TBaseForm)
    sp1: TOilStoredProc;
    Label1: TLabel;
    Label2: TLabel;
    ceOrg: TComboEdit;
    ceType: TComboEdit;
    SpeedButton5: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure sbAddClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure ceOrgButtonClick(Sender: TObject);
    procedure ceTypeButtonClick(Sender: TObject);
    procedure bbClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FCompOutDevice: TFCompOutDevice;
  NewDev : Boolean;
  curr_id, curr_inst: integer;  
implementation
Uses Main, OilStd, ChooseOrg, CompTypeDevice;
 var SearchDepID, SearchDepInst : integer;
{$R *.DFM}

procedure TFCompOutDevice.sbAddClick(Sender: TObject);
var CF:TFCompOutDeviceAdd;
begin
 CF:=TFCompOutDeviceAdd.Create(Application);
 CF.mode:=1;
 CF.ShowModal;
 CF.free;
 bbSearchClick(nil)
end;

procedure TFCompOutDevice.sbEditClick(Sender: TObject);
var CF:TFCompOutDeviceAdd;
begin
 if not q.eof then
 begin
  CF:=TFCompOutDeviceAdd.Create(Application);
  CF.mode:=2;
  CF.MnID:=q.fieldbyname('id').value;
  CF.MnINST:=q.fieldbyname('inst').value;
  if CF.MnINST<>INST then CF.bbOK.Enabled := false;
  CF.ShowModal;
  CF.free;
  bbSearchClick(nil)  
 end;
end;

procedure TFCompOutDevice.sbDelClick(Sender: TObject);
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

 res:=TranslateText('Вы уверены что хотите удалить внешнее устройство ?');
 if MessageDlg(res,mtCustom,[mbYes,mbNo],0)=mrNo then Exit;
 try
 StartSQL;
 with sp1 do
  begin
  StoredProcName := 'OIL.INSORUPDOIL_COMP_DEVICE';
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

procedure TFCompOutDevice.bbSearchClick(Sender: TObject);
begin
q.open;
   if not NewDev then
   Begin
         // Получаем текущую строку
          curr_id:= q.fieldbyname('id').AsInteger;
          curr_inst:= q.fieldbyname('inst').AsInteger;
         //-----
          NewDev:=False;
   end;
 q.close;
 q.sql.clear;
 q.sql.add('Select OIL_COMP_DEVICE.*, OIL_ORG.NAME ORGNAME, OIL_ORG.ID, OIL_ORG.INST, Oil_comp_Type_device.*  '+
                ' FROM OIL_COMP_DEVICE, v_org OIL_ORG, Oil_comp_Type_device  '+
                ' Where (OIL_COMP_DEVICE.state=''Y'')  '+
                ' AND (Oil_org.state=''Y'')   '+
                ' AND (Oil_comp_Type_device.state=''Y'') '+
                ' AND (ORG_ID = OIL_ORG.ID)  '+
                ' AND (ORG_INST = OIL_ORG.INST)  '+
                ' AND (TYPE_ID = OIL_COMP_TYPE_DEVICE.ID) '+
                ' AND (TYPE_INST = OIL_COMP_TYPE_DEVICE.INST)     ');
 //обработка фильтров
 if (ceOrg.text<>IntToStr(0)) and (ceOrg.text<>'') then
  begin
  q.sql.add('  AND  (Oil_comp_device.ORG_ID = ' + IntToStr(SearchDepId) + ')         '+
            '  AND  (Oil_comp_device.ORG_INST = ' + IntToStr(SearchDepInst) + ')     ');
  end;
 if (ceType.text<>IntToStr(0)) and (ceType.text<>'') then
  begin
  q.sql.add('  AND  (Oil_comp_device.TYPE_ID = ' + IntToStr(Type_Id) + ')         '+
            '  AND  (Oil_comp_device.TYPE_INST = ' + IntToStr(Type_Inst) + ')   ');
  end;
  q.open;
  // Позиционируем курсор
  q.Locate('id;inst', VarArrayOf([curr_id, curr_inst]), []);

end;

procedure TFCompOutDevice.ceOrgButtonClick(Sender: TObject);
var vName: string;
begin
if ChooseOrg.CaptureOrg(4,Main.Main_Id,Main.Inst,'yyy',SearchDepId,SearchDepInst,vName) then
 ceOrg.Text:=vName;
end;

procedure TFCompOutDevice.ceTypeButtonClick(Sender: TObject);
var FType : TFCompTypeDevice;
begin
  FType:=TFCompTypeDevice.Create(FCompTypeDevice);
  FType.bbOk.Visible:=True;
  mes:= '';

 try
  if (FType.ShowModal=mrOK) then
   begin
    Type_ID:=FType.q.FieldByName('id').AsInteger;
    Type_INST:=FType.q.FieldByName('INST').AsInteger;
    ceType.Text:=FType.q.FieldByName('Type').AsString;
   end;
 finally
  FType.Free;
end;
end;
procedure TFCompOutDevice.bbClearClick(Sender: TObject);
begin
        ceType.Text:='';
        ceOrg.Text:='';
end;

procedure TFCompOutDevice.FormCreate(Sender: TObject);
begin
  inherited;
  pAdd.Visible:=true;
  pEdit.Visible:=true;
  pDel.Visible:=true;
  q.close;
  q.open;
end;

procedure TFCompOutDevice.SpeedButton1Click(Sender: TObject);
begin
     ceOrg.Text:='';
end;

procedure TFCompOutDevice.SpeedButton5Click(Sender: TObject);
begin
     ceType.Text:='';
end;

end.
