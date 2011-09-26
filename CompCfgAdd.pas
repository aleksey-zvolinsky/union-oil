unit CompCfgAdd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls, DBTables, Db, RXSpin,
  uCommonForm,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess;

type
  TFCompCfgAdd = class(TCommonForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    CBFloppy: TCheckBox;
    CBSpeaker: TCheckBox;
    EMother: TEdit;
    ERam: TEdit;
    ELocal: TEdit;
    EModelVideo: TEdit;
    ERamVideo: TEdit;
    EMonitor: TEdit;
    EZip: TEdit;
    EMagnit: TEdit;
    ESound: TEdit;
    EModem: TEdit;
    EOther: TEdit;
    pButtons: TPanel;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    Query1: TOilQuery;
    Query2: TOilQuery;
    sp1: TOilStoredProc;
    rgRom: TRadioGroup;
    rgState: TRadioGroup;
    gbProc: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    EModelProc: TEdit;
    ERamProc: TEdit;
    seProc: TRxSpinEdit;
    Label14: TLabel;
    gbHard: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label19: TLabel;
    EModelHard: TEdit;
    ECapacity: TEdit;
    CEIFace: TComboEdit;
    seHard: TRxSpinEdit;
    Label16: TLabel;
    procedure bbOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CEIFaceButtonClick(Sender: TObject);
    procedure ERamKeyPress(Sender: TObject; var Key: Char);
    procedure ERamProcKeyPress(Sender: TObject; var Key: Char);
    procedure ECapacityKeyPress(Sender: TObject; var Key: Char);
    procedure ERamVideoKeyPress(Sender: TObject; var Key: Char);
  private
    function GetSQ: Integer;
    { Private declarations }
  public
        MnID, MnINST: Integer;
        mode: Integer;
    { Public declarations }
  end;

var
   FCompCfgAdd: TFCompCfgAdd;
   mId, mInst:integer;         // ID,INST - CFG
   mes: string;
   IFace_ID, IFace_INST : integer;    // ID,INST интерфейсов
implementation
   uses  main, OilStd, CompIFace, ChooseOrg, CompCfg, uDBFunc;
{$R *.DFM}

function TFCompCfgAdd.GetSQ: Integer;    //берется следущее значение ID
begin
   if (Query2.Active) then Query2.Close;
      Query2.SQL.Text:='select s_oil_comp_cfg.nextval as sq from sys.dual';
      Query2.Open;
      Result:=Query2.FieldByName('sq').AsInteger;
end;

procedure TFCompCfgAdd.bbOKClick(Sender: TObject);
var res: String;
begin
   //Проверка заполнения
   if EMother.Text=''then begin
                               ShowMessage(TranslateText('Необходимо указать модель материнской плати'));
                               exit;
                          end;
   if ERam.Text=''then    begin
                               ShowMessage(TranslateText('Необходимо указать количество ОЗУ'));
                               exit;
                          end;
   if ELocal.Text='' then begin
                               ShowMessage(TranslateText('Необходимо указать модель сетевой карты'));
                               exit;
                          end;
  if EModelProc.Text='' then begin
                                  ShowMessage(TranslateText('Необходимо указать модель процесора'));
                                  exit;
                             end;
  if ERamProc.Text='' then   begin
                                  ShowMessage(TranslateText('Необходимо указать частоту процесора'));
                                  exit;
                             end;
  if EModelHard.Text=''then  begin
                                  ShowMessage(TranslateText('Необходимо указать модель винчестера'));
                                  exit;
                             end;
  if ECapacity.Text=''then   begin
                                  ShowMessage(TranslateText('Необходимо указать емкость винчестера'));
                                  exit;
                             end;
  if ceIFace.Text=''  then   begin
                                  ShowMessage(TranslateText('Необходимо указать интерфейс винчестера'));
                                  exit;
                             end;

  if EModelVideo.Text=''then begin
                                  ShowMessage(TranslateText('Необходимо указать модель видео карты'));
                                  exit;
                             end;
  if ERamVideo.Text=''then   begin
                                  ShowMessage(TranslateText('Необходимо указать емкость видео карты'));
                                  exit;
                             end;
  if EMonitor.Text=''then    begin
                                  ShowMessage(TranslateText('Необходимо указать модель монитора'));
                                  exit;
                             end;
  if   cbFloppy.State=cbGrayed then
                             begin
                                  ShowMessage(TranslateText('Необходимо указать наличие флопи дисковода'));
                                  exit;
                             end;
  if   cbSpeaker.State=cbGrayed then  begin
                                           ShowMessage(TranslateText('Необходимо указать наличие колонок'));
                                           exit;
                                      END;
  //--------
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
           NewCfg:=True;

      end; // 1:
    2: // редактировать
      begin
           mId:=query1.FieldByName('id').AsInteger;
           mInst:=query1.FieldByName('inst').AsInteger;
           NewCfg:=False;
      end;//  2:
  end; // case mode of

 StoredProcName := 'OIL.INSORUPDOIL_COMP_CFG';

 Prepare;
   ParamByName('ID#').AsInteger  :=mId;
   ParamByName('INST#').AsInteger:=mInst;
   ParamByName('STATE#').AsString:='Y';
   ParamByName('MOTHER_CARD#').AsString:=EMother.text;
   ParamByName('MODEL_PROC#').AsString:=EModelProc.text;
   ParamByName('NUM_PROC#').AsString:=ERamProc.text;
   ParamByName('MODEL_HARD_DRIVE#').AsString:=EModelHard.text;
   ParamByName('CAPACITY#').AsString:=ECapacity.text;
   ParamByName('IFACE_ID#').AsInteger:=IFace_ID;
   ParamByName('IFACE_INST#').AsInteger:=IFace_INST;
   ParamByName('RAM#').AsString:=ERam.text;
   ParamByName('SOUND_BLASTER#').AsString:=ESound.text;
   ParamByName('MODEL_VIDEO#').AsString:=EModelVideo.text;
   ParamByName('RAM_VIDEO#').AsString:=ERamVideo.text;
   ParamByName('LOCAL#').AsString:=ELocal.text;
   ParamByName('MONITOR#').AsString:=EMonitor.text;
   ParamByName('ZIP#').AsString:=EZip.text;
   ParamByName('MAGNIT_OPTIC#').AsString:=EMagnit.text;
   ParamByName('MODEM#').AsString:=EModem.text;
   ParamByName('OTHER#').AsString:=EOther.text;
   ParamByName('CNT_PROC#').AsString:=seProc.text;
   ParamByName('CNT_HARD_DRIVE#').AsInteger:=StrToInt(seHard.text);

   if CBFloppy.State=cbChecked  then ParamByName('FLOPPY#').AsString:='Y'
                                else ParamByName('FLOPPY#').AsString:='N';

   if CBSpeaker.State=cbChecked then ParamByName('SPEAKER#').AsString:='Y'
                                else ParamByName('SPEAKER#').AsString:='N';

   if rgRom.ItemIndex = 0       then ParamByName('CDROM#').AsString:='CDROM';
   if rgRom.ItemIndex = 1       then ParamByName('CDROM#').AsString:='CD-RW';
   if rgRom.ItemIndex = 2       then ParamByName('CDROM#').AsString:='DVD-ROM';
   if rgRom.ItemIndex = 3       then ParamByName('CDROM#').AsString:='N';

   if rgState.ItemIndex = 0     then ParamByName('COMP_STATE#').AsString:='WORK';
   if rgState.ItemIndex = 1     then ParamByName('COMP_STATE#').AsString:='UNWORK';
   if rgState.ItemIndex = 2     then ParamByName('COMP_STATE#').AsString:='FREE';

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

procedure TFCompCfgAdd.FormShow(Sender: TObject);
begin
case mode of
  1: // режим новая
   ;
  2: // режим редактировать
   begin

      query1.Close;
      query1.SQL.Text:=' SELECT oil_comp_iface.iface, oil_comp_cfg.*'+
                       ' FROM oil_comp_cfg, oil_comp_iface'+
                       ' WHERE (oil_comp_cfg.iface_inst = oil_comp_iface.inst AND'+
                       ' oil_comp_iface.id = oil_comp_cfg.iface_id AND'+
                       ' oil_comp_cfg.id='+IntToStr(MnId)+' AND'+
                       ' oil_comp_cfg.inst='+IntToStr(MnINST)+')';

     query1.Open;

        //ввод данных по редакт.
        EMother.text:=query1.FieldByName('MOTHER_CARD').AsString;
        ERam.text:=query1.FieldByName('Ram').AsString;
        ELocal.text:=query1.FieldByName('Local').AsString;
        EModelProc.text:=query1.FieldByName('MODEL_PROC').AsString;
        ERamProc.text:=query1.FieldByName('NUM_PROC').AsString;
        EModelHard.text:=query1.FieldByName('Model_Hard_DRIVE').AsString;
        ECapacity.text:=query1.FieldByName('Capacity').AsString;
        EModelVideo.text:=query1.FieldByName('Model_Video').AsString;
        ERamVideo.text:=query1.FieldByName('Ram_Video').AsString;
        EMonitor.text:=query1.FieldByName('Monitor').AsString;
        EZip.text:=query1.FieldByName('Zip').AsString;
        EMagnit.text:=query1.FieldByName('MAGNIT_OPTIC').AsString;
        ESound.text:=query1.FieldByName('Sound_BLASTER').AsString;
        EModem.text:=query1.FieldByName('Modem').AsString;
        EOther.text:=query1.FieldByName('Other').AsString;
        seProc.Value:=query1.FieldByName('CNT_PROC').AsInteger;
        seHard.Value:=query1.FieldByName('CNT_HARD_DRIVE').AsInteger;

        CEIFace.text:=query1.FieldByName('IFACE').AsString;
        IFace_ID:=query1.FieldByName('IFace_ID').AsInteger;
        IFace_INST:=query1.FieldByName('IFace_INST').AsInteger;

        if query1.FieldByName('FLOPPY').AsString='Y'
               then CBFloppy.State:=cbChecked
               else CBFloppy.State:=cbUnChecked;

        if query1.FieldByName('SPEAKER').AsString='Y'
               then CBSpeaker.State:=cbChecked
               else CBSpeaker.State:=cbUnChecked;

        if query1.FieldByName('CDROM').AsString='CDROM'
               then rgROM.ItemIndex:=0;
        if query1.FieldByName('CDROM').AsString='CD-RW'
               then rgROM.ItemIndex:=1;
        if query1.FieldByName('CDROM').AsString='DVD-ROM'
               then rgROM.ItemIndex:=2;
        if query1.FieldByName('CDROM').AsString='N'
               then rgROM.ItemIndex:=3;

        if query1.FieldByName('COMP_STATE').AsString='WORK'
               then rgState.ItemIndex:=0;
        if query1.FieldByName('COMP_STATE').AsString='UNWORK'
               then rgState.ItemIndex:=1;
        if query1.FieldByName('COMP_STATE').AsString='FREE'
               then rgState.ItemIndex:=2;

   end;
 end; //case
end;

procedure TFCompCfgAdd.CEIFaceButtonClick(Sender: TObject);
var IFace : TFCompIFace;
begin
  IFace:=TFCompIFace.Create(FCompIFace);
  IFace.bbOk.Visible:=True;
  mes:= '';

 try
   if (IFace.ShowModal=mrOK) then
     begin
       IFace_ID:=IFace.q.FieldByName('id').AsInteger;
       IFace_INST:=IFace.q.FieldByName('INST').AsInteger;
       ceIFace.Text:=IFace.q.FieldByName('Iface').AsString;
     end;
 finally
   IFace.Free;
 end;

 if (Length(mes)>0) then ShowMessage(mes);

end;

procedure TFCompCfgAdd.ERamKeyPress(Sender: TObject; var Key: Char);
begin
     if not (key in ['0'..'9',#8]) then key:=#0;
end;

procedure TFCompCfgAdd.ERamProcKeyPress(Sender: TObject; var Key: Char);
begin
     if not (key in ['0'..'9',#8]) then key:=#0;
end;

procedure TFCompCfgAdd.ECapacityKeyPress(Sender: TObject; var Key: Char);
begin
     if not (key in ['0'..'9',#8]) then key:=#0;
end;

procedure TFCompCfgAdd.ERamVideoKeyPress(Sender: TObject; var Key: Char);
begin
     if not (key in ['0'..'9',#8]) then key:=#0;
end;

end.
