unit CompOutDeviceAdd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ExtCtrls, Mask, ToolEdit, Buttons, RXSpin,
  uCommonForm,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess;

type
  TFCompOutDeviceAdd = class(TCommonForm)
    Query1: TOilQuery;
    Query2: TOilQuery;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ceType: TComboEdit;
    eName: TEdit;
    eDep: TEdit;
    ceOrg: TComboEdit;
    rgState: TRadioGroup;
    pButtons: TPanel;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    sp1: TOilStoredProc;
    eNote: TEdit;
    procedure ceOrgButtonClick(Sender: TObject);
    procedure bbOKClick(Sender: TObject);
    procedure ceTypeButtonClick(Sender: TObject);
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
  FCompOutDeviceAdd: TFCompOutDeviceAdd;
  mId, mInst:integer;
  mes: string;
  Type_ID, Type_INST : integer;
implementation
 uses  main, OilStd, ChooseOrg, CompTypeDevice, CompOutDevice;
 var SearchDepID, SearchDepInst : integer;
{$R *.DFM}

function TFCompOutDeviceAdd.GetSQ: Integer;    //беретс€ следущее значение ID
begin
  if (Query2.Active) then Query2.Close;
  Query2.SQL.Text:='select S_OIL_COMP_DEVICE.nextval as sq from sys.dual';
  Query2.Open;
  Result:=Query2.FieldByName('sq').AsInteger;
end;

procedure TFCompOutDeviceAdd.ceOrgButtonClick(Sender: TObject);
var vName: string;
begin
if ChooseOrg.CaptureOrg(1,Main.Main_Id,Main.Inst,'yyy',SearchDepId,SearchDepInst,vName) then
 ceOrg.Text:=vName;
end;

procedure TFCompOutDeviceAdd.bbOKClick(Sender: TObject);
var res : String;
begin

//ѕроверка заполнени€
 if (EName.Text='') or (ceType.Text='') or (EDep.Text='') or (ceOrg.Text='') then
   begin
       ShowMessage(TranslateText('Ќе все пол€ заполнены !'));
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
        NewDev:=True;
     end; // 1:
   2: // редактировать
     begin
        mId:=query1.FieldByName('id').AsInteger;
        mInst:=query1.FieldByName('inst').AsInteger;
        NewDev:=False;
     end;//  2:
  end; // case mode of

 StoredProcName := 'OIL.INSORUPDOIL_COMP_DEVICE';

 Prepare;
 ParamByName('ID#').AsInteger  :=mId;
 ParamByName('INST#').AsInteger:=mInst;
 ParamByName('STATE#').AsString:='Y';
 ParamByName('DEVICE#').AsString:=Ename.text;
 ParamByName('DEP#').AsString:=EDep.text;
 ParamByName('NOTE#').AsString:=eNote.text;
 if rgState.ItemIndex=0 then ParamByName('STATE_DEVICE#').AsString:='WORK';    //рабочий
 if rgState.ItemIndex=1 then ParamByName('STATE_DEVICE#').AsString:='UNWORK';  //не рабочий
 if rgState.ItemIndex=2 then ParamByName('STATE_DEVICE#').AsString:='FREE';    //списаный
 ParamByName('ORG_ID#').AsString:=IntToStr(SearchDepId);
 ParamByName('ORG_INST#').AsString:=IntToStr(SearchDepInst);
 ParamByName('TYPE_ID#').AsString:=IntToStr(Type_id);
 ParamByName('TYPE_INST#').AsString:=IntToStr(Type_inst);

 ExecProc;

 Res:=ParamByName('Result').AsString;
  if (Length(Res)>0) and (Res[1]<>'0') then
   Raise Exception.Create(SubStr(Res,2));

 CommitSQL;
 ModalResult:=mrOk

end; //with
  except On E:Exception Do
   begin
   MessageDlg(TranslateText('ќшибка : ')+E.message,mtError,[mbOk],0);
   RollbackSQL;
   end; // except
  end; // try  exceptend;
end;

procedure TFCompOutDeviceAdd.ceTypeButtonClick(Sender: TObject);
var TypeDev : TFCompTypeDevice;
begin
  TypeDev:=TFCompTypeDevice.Create(FCompTypeDevice);
  TypeDev.bbOk.Visible:=True;
  mes:= '';

 try
  if (TypeDev.ShowModal=mrOK) then
   begin
    Type_ID:=TypeDev.q.FieldByName('id').AsInteger;
    Type_INST:=TypeDev.q.FieldByName('INST').AsInteger;
    ceType.Text:=TypeDev.q.FieldByName('Type').AsString;
   end;
 finally
  TypeDev.Free;
 end;
                                                          
  if (Length(mes)>0) then ShowMessage(mes);


end;

procedure TFCompOutDeviceAdd.FormShow(Sender: TObject);
begin
 case mode of
  1: // режим нова€
   ;
  2: // режим редактировать
   begin
     query1.Close;
     query1.SQL.Clear;
     query1.SQL.Add('Select OIL_COMP_DEVICE.*, OIL_ORG.NAME ORGNAME, OIL_ORG.ID, OIL_ORG.INST, Oil_comp_Type_device.*  '+
                ' FROM OIL_COMP_DEVICE, v_org OIL_ORG, Oil_comp_Type_device  '+
                ' Where (OIL_COMP_DEVICE.state=''Y'')  '+
                ' AND (Oil_org.state=''Y'')   '+
                ' AND (Oil_comp_Type_device.state=''Y'') '+
                ' AND (ORG_ID = OIL_ORG.ID)  '+
                ' AND (ORG_INST = OIL_ORG.INST)  '+
                ' AND (TYPE_ID = OIL_COMP_TYPE_DEVICE.ID) '+
                ' AND (TYPE_INST = OIL_COMP_TYPE_DEVICE.INST)     '+
                ' AND (OIL_COMP_DEVICE.ID = '+ IntToStr(MnID) + ')  '+
                ' AND (OIL_COMP_DEVICE.INST = ' + IntToStr(MnINST) + ')  '+
                ' order by STATE_DEVICE ');
     query1.Open;

     ceType.Text:=query1.FieldByName('Type').AsString;
     Type_Id:=StrToInt(query1.FieldByName('Type_ID').AsString);
     Type_Inst:=StrToInt(query1.FieldByName('Type_INST').AsString);

     eName.text:=query1.FieldByName('Device').AsString;
     eDep.Text:=query1.FieldByName('Dep').AsString;

     ceOrg.text:=query1.FieldByName('OrgName').AsString;
     SearchDepId:=StrToInt(query1.FieldByName('Org_ID').AsString);
     SearchDepInst:=StrToInt(query1.FieldByName('Org_INST').AsString);

     if query1.FieldByName('STATE_DEVICE').AsString='WORK' then rgState.ItemIndex:=0;
     if query1.FieldByName('STATE_DEVICE').AsString='UNWORK' then rgState.ItemIndex:=1;
     if query1.FieldByName('STATE_DEVICE').AsString='FREE' then rgState.ItemIndex:=2;
     eNote.text:=query1.FieldByName('NOTE').AsString;
   end;
 end; //case

end;

end.
