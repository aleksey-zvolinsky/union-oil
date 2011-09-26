unit CompCfg;

interface

uses uCommonForm, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Base, Menus, Db, DBTables, Grids, DBGridEh, Buttons, StdCtrls,
  ExtCtrls, CompCfgAdd, Mask, ActnList, RXCtrls,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess{$IFDEF VER150},Variants{$ENDIF};

type
  TFCompCfg = class(TBaseForm)
  
    EModelProc: TEdit;
    ENumProc: TEdit;
    ERamVideo: TEdit;
    ERam: TEdit;
    ECapacity: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    sp1: TOilStoredProc;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    qExam: TOilQuery;
    qExamCOMPCFG_ID: TFloatField;
    qExamCOMPCFG_INST: TFloatField;
    procedure sbAddClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure EModelProcKeyPress(Sender: TObject; var Key: Char);
    procedure ERamVideoKeyPress(Sender: TObject; var Key: Char);
    procedure ENumProcKeyPress(Sender: TObject; var Key: Char);
    procedure ERamKeyPress(Sender: TObject; var Key: Char);
    procedure ECapacityKeyPress(Sender: TObject; var Key: Char);
    procedure bbClearClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCompCfg: TFCompCfg;
  OnlyID, OnlyInst : integer;
  NewCfg : boolean;
  curr_id, curr_inst: integer;
implementation
Uses Main, OilStd;
{$R *.DFM}

procedure TFCompCfg.sbAddClick(Sender: TObject);
var CF:TFCompCfgAdd;
begin
     CF:=TFCompCfgAdd.Create(Application);
     CF.mode:=1;
     CF.ShowModal;
     CF.free;
     bbSearchClick(nil)
end;

procedure TFCompCfg.bbSearchClick(Sender: TObject);
begin
   if not NewCfg then
     Begin
          // Получаем текущую строку
          curr_id:= q.fieldbyname('id').AsInteger;
          curr_inst:= q.fieldbyname('inst').AsInteger;
          //-----
          NewCfg:=False;
     end;
   q.close;
   q.sql.clear;
   q.sql.add(' SELECT oil_comp_iface.iface, oil_comp_cfg.* ' +
             ' FROM oil_comp_cfg, oil_comp_iface '+
             ' WHERE (    oil_comp_iface.inst = oil_comp_cfg.iface_inst ' +
             ' AND oil_comp_iface.id = oil_comp_cfg.iface_id  '+
             ' AND oil_comp_iface.state=''Y'' '+
             ' AND oil_comp_cfg.state=''Y'' ');
             //обработка фильтров
            if (EModelProc.text<>IntToStr(0)) and (EModelProc.text<>'') then
                begin
                     q.sql.add(' And '+' Upper(MODEL_PROC) like ''%'+ ANSIUpperCase(EModelProc.text)+'%'' ');
                end;
            if (ENumProc.text<>IntToStr(0)) and (ENumProc.text<>'') then
                begin
                     q.sql.add(' And '+' NUM_PROC='''+ENumProc.text+''' ');
                end;
            if (ERamVideo.text<>IntToStr(0)) and (ERamVideo.text<>'') then
                begin
                     q.sql.add(' And '+' RAM_VIDEO='''+ERamVideo.text+''' ');
                end;
            if (ERam.text<>IntToStr(0)) and (ERam.text<>'') then
                begin
                     q.sql.add(' And '+' RAM='''+ERam.text+''' ');
                end;
            if (ECapacity.text<>IntToStr(0)) and (ECapacity.text<>'') then
                begin
                     q.sql.add(' And '+' CAPACITY='''+ECapacity.text+''' '  );
                end;
           //------
   q.sql.add( ')');
   q.open;
   // Позиционируем курсор
   q.Locate('id;inst', VarArrayOf([curr_id, curr_inst]), []);
end;

procedure TFCompCfg.FormCreate(Sender: TObject);
begin
     inherited;
     pAdd.Visible:=true;
     pEdit.Visible:=true;
     pDel.Visible:=true;
     q.close;
     q.open;
end;

procedure TFCompCfg.sbEditClick(Sender: TObject);
var CF:TFCompCfgAdd;
begin
     if not q.eof then
       begin
            CF:=TFCompCfgAdd.Create(Application);
            CF.mode:=2;
            CF.MnID:=q.fieldbyname('id').value;
            CF.MnINST:=q.fieldbyname('inst').value;
            if CF.MnINST<>INST then CF.bbOK.Enabled := false;
            CF.ShowModal;
            CF.free;
       end;
     bbSearchClick(nil)
end;

procedure TFCompCfg.sbDelClick(Sender: TObject);
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
     qExam.SQL.add(' SELECT COMPCFG_ID, COMPCFG_INST '+
                   ' FROM OIL_COMP_INFO Oil_comp_info '+
                   ' where (state=''Y'') '+
                   ' AND (COMPCFG_ID='+''+IntToStr(q.fieldbyname('id').asinteger)+''+') '+
                   ' AND (COMPCFG_INST='+''+IntToStr(q.fieldbyname('inst').asinteger)+''+')');
     qExam.Open;
     if (qExam.fieldbyname('COMPCFG_ID').asinteger=q.fieldbyname('id').asinteger) and (qExam.fieldbyname('COMPCFG_INST').asinteger=q.fieldbyname('inst').asinteger) then
       begin
            res:=TranslateText('Нельзя удалить запись на которую есть ссылка !');
            ShowMessage(res);
            Exit;
       end;


     res:=TranslateText('Вы уверены что хотите удалить конфигурацию компьютера?');
     if MessageDlg(res,mtCustom,[mbYes,mbNo],0)=mrNo then Exit;
     try
        StartSQL;
        with sp1 do
        begin
             StoredProcName := 'OIL.INSORUPDOIL_COMP_CFG';
             Prepare;
                ParamByName('ID#').AsInteger   :=q.fieldbyname('id').asinteger;
                ParamByName('INST#').AsInteger :=q.fieldbyname('inst').asinteger;
                ParamByName('STATE#').AsString :='N';
                ParamByName('COMP_STATE#').AsString :=q.fieldbyname('COMP_STATE').asString;
                ParamByName('IFACE_ID#').AsInteger :=q.fieldbyname('IFACE_ID').asinteger;
                ParamByName('IFACE_INST#').AsInteger :=q.fieldbyname('IFACE_INST').asinteger;
                ParamByName('SPEAKER#').AsString :=q.fieldbyname('SPEAKER').AsString;
                ParamByName('FLOPPY#').AsString :=q.fieldbyname('FLOPPY').AsString;
                ParamByName('CDROM#').AsString :=q.fieldbyname('CDROM').AsString;
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

procedure TFCompCfg.EModelProcKeyPress(Sender: TObject; var Key: Char);
begin
     if not (key in ['0'..'9',#8]) then key:=#0;
end;

procedure TFCompCfg.ERamVideoKeyPress(Sender: TObject; var Key: Char);
begin
     if not (key in ['0'..'9',#8]) then key:=#0;
end;

procedure TFCompCfg.ENumProcKeyPress(Sender: TObject; var Key: Char);
begin
     if not (key in ['0'..'9',#8]) then key:=#0;
end;

procedure TFCompCfg.ERamKeyPress(Sender: TObject; var Key: Char);
begin
     if not (key in ['0'..'9',#8]) then key:=#0;
end;

procedure TFCompCfg.ECapacityKeyPress(Sender: TObject; var Key: Char);
begin
     if not (key in ['0'..'9',#8]) then key:=#0;
end;

procedure TFCompCfg.bbClearClick(Sender: TObject);
begin
     //очистка фильтров
     EModelProc.Text:='';
     ENumProc.Text:='';
     ERamVideo.Text:='';
     Eram.Text:='';
     ECapacity.Text:='';
end;

procedure TFCompCfg.SpeedButton5Click(Sender: TObject);
begin
     EModelProc.Text:='';
end;

procedure TFCompCfg.SpeedButton4Click(Sender: TObject);
begin
     ENumProc.Text:='';
end;

procedure TFCompCfg.SpeedButton3Click(Sender: TObject);
begin
     ERamVideo.Text:='';
end;

procedure TFCompCfg.SpeedButton2Click(Sender: TObject);
begin
     Eram.Text:='';
end;

procedure TFCompCfg.SpeedButton1Click(Sender: TObject);
begin
     ECapacity.Text:='';
end;

end.
