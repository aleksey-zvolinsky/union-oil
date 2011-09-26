unit TubeAct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EditBase, DB, MemDS, DBAccess, Ora, uOilQuery, StdCtrls,
  Buttons, ExtCtrls, GridsEh, DBGridEh, ToolEdit, Mask, DBCtrls,
  DBGridEhGrouping, Menus, Excel8TLB, uCommonForm;
type
  TTubeActForm = class(TEditBaseForm)
    Panel1: TPanel;
    sbDel: TSpeedButton;
    pData: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    pShare: TPanel;
    sbShare: TSpeedButton;
    grTube: TDBGridEh;
    dslisttube: TOraDataSource;
    qTube: TOraQuery;
    qTubeID: TFloatField;
    qTubeINST: TFloatField;
    qTubeLAYER_NAME: TStringField;
    qTubeLAYER_NAME_CAD: TStringField;
    qTubeCOLOR: TStringField;
    qTubeNP_ID: TFloatField;
    qTubeTANK_REST: TFloatField;
    qTubeMAX_VOLUME: TFloatField;
    qTubeNOTES: TStringField;
    qTubeCOMMENT_: TStringField;
    qTubeDATE_CHANGE: TDateTimeField;
    qTubeNAME_NP: TStringField;
    qTubeNP_GRP_NAME: TStringField;
    eActNum: TEdit;
    qTubeACT_NUM: TFloatField;
    eDate: TEdit;
    Panel2: TPanel;
    sbAdd: TSpeedButton;
    qTubePIPELINE_VALVE: TStringField;
    PUM: TPopupMenu;
    qTubeSumTankRest: TFloatField;
    qTubeSUMTANKVAL: TFloatField;
    procedure qTubeLAYER_NAMEChange(Sender: TField); 
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grTubeExit(Sender: TObject);
    procedure qTubeBeforePost(DataSet: TDataSet);
    procedure grTubeEditButtonClick(Sender: TObject);
    procedure MI2Click(Sender: TObject);
    procedure dslisttubeDataChange(Sender: TObject; Field: TField);
    procedure sbDelClick(Sender: TObject);
    procedure qTubeAfterPost(DataSet: TDataSet);
    procedure bbOkClick(Sender: TObject);
    procedure grTubeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure grTubeSortMarkingChanged(Sender: TObject);
    procedure eDateChange(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure qTubeNP_GRP_NAMEChange(Sender: TField);
  private
    qTubeTemp: TOraQuery;
    function FormatWeigth(AValue: Currency):string;
  public
    bNewAct : boolean;
   // bFromLastAct : boolean;
    procedure Init; override;
    procedure Test; override;
    procedure Save; override;
  end;

var
  TubeActForm: TTubeActForm;

implementation

{$R *.dfm}

uses uDbFunc, NPTypeRef, OilStd, Main, RulezReport, Tubes,RefPrint,Progr, ExFunc;


procedure TTubeActForm.qTubeLAYER_NAMEChange(Sender: TField);
begin
  inherited;
  if qTube.State = dsInsert then
  begin
    qTubeTemp.Filtered := false;
    qTubeTemp.Filter   := 'ACT_NUM = MAXN and LAYER_NAME = '''+ qTubeLAYER_NAME.AsString + '''';
    qTubeTemp.Filtered := true;
// Берем остаток в  трубе из последнего акта

    qTubeNP_ID.AsInteger          := qTubeTemp.FieldByName('NP_ID').AsInteger;
    qTubeNAME_NP.AsString         := qTubeTemp.FieldByName('NAME_NP').AsString;
    qTubeNP_GRP_NAME.AsString     := qTubeTemp.FieldByName('NP_GRP_NAME').AsString;
    qTubeMAX_VOLUME.AsFloat       := qTubeTemp.FieldByName('MAX_VOLUME').AsFloat;
    qTubeCOMMENT_.AsString        := qTubeTemp.FieldByName('COMMENT_').AsString;
    qTubeNOTES.AsString           := qTubeTemp.FieldByName('NOTES').AsString;
    qTubeLAYER_NAME_CAD.AsString  := qTubeTemp.FieldByName('LAYER_NAME_CAD').AsString;
    qTube.Post;
  end;
  if qTube.State = dsEdit then
  begin
    qTubeTemp.Filtered := false;
    qTubeTemp.Filter   := 'ACT_NUM = MAXN and LAYER_NAME = '''+ qTubeLAYER_NAME.AsString + '''';
    qTubeTemp.Filtered := true;
    qTubeTANK_REST.AsFloat        := qTubeTemp.FieldByName('TANK_REST').AsFloat;
    qTubeMAX_VOLUME.AsFloat       := qTubeTemp.FieldByName('MAX_VOLUME').AsFloat;
    qTubeCOMMENT_.AsString        := qTubeTemp.FieldByName('COMMENT_').AsString;
    qTubeNOTES.AsString           := qTubeTemp.FieldByName('NOTES').AsString;
    qTubeLAYER_NAME_CAD.AsString  := qTubeTemp.FieldByName('LAYER_NAME_CAD').AsString;
    qTubePIPELINE_VALVE.AsString  := qTubeTemp.FieldByName('PIPELINE_VALVE').AsString;
    qTube.Post;
  end;
end;
//==============================================================================
procedure TTubeActForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qTubeTemp.Free;
end;
//==============================================================================
procedure TTubeActForm.grTubeExit(Sender: TObject);
begin
  inherited;
  if qTube.State in [dsEdit, dsInsert] then
  qTube.Post;  
end;
//==============================================================================
procedure TTubeActForm.qTubeBeforePost(DataSet: TDataSet);
var
  bNew: boolean;
  str : String;
begin
  inherited;
  if qTube.State <> dsInsert then exit;
   bNew:=false;
   if eActNum.Text = '' then
  begin
    qTubeACT_NUM.AsInteger := GetSqlValue('select max(act_num) from tube_act where state=''Y''')+1;
    bNew:=true;
  end
  else
    qTubeACT_NUM.AsInteger := StrToInt(eActNum.Text);
    eActNum.Refresh;
    qTubeINST.AsFloat            := qTubeTemp.FieldByName('INST').AsFloat; 
    qTubeID.AsFloat              := GetSeqNextVal('S_TUBE_ACT');
    if qTubeNP_ID.AsInteger = 0 then
    begin
      qTubeNP_ID.AsInteger         := qTubeTemp.FieldByName('NP_ID').AsInteger;
      qTubeNAME_NP.AsString        := qTubeTemp.FieldByName('NAME_NP').AsString;
      qTubeNP_GRP_NAME.AsString    := qTubeTemp.FieldByName('NP_GRP_NAME').AsString;
    end;
    qTubeMAX_VOLUME.AsFloat      := qTubeTemp.FieldByName('MAX_VOLUME').AsFloat;
    qTubeCOMMENT_.AsString       := qTubeTemp.FieldByName('COMMENT_').AsString;
    qTubeNOTES.AsString          := qTubeTemp.FieldByName('NOTES').AsString;
    if qTubeLAYER_NAME.AsString = '' then
      qTubeLAYER_NAME.AsString     := qTubeTemp.FieldByName('LAYER_NAME').AsString;
    qTubeLAYER_NAME_CAD.AsString := qTubeTemp.FieldByName('LAYER_NAME_CAD').AsString;
    if qTubeNP_ID.asInteger <>0 then
      str:= GetSqlValue('select t.np_grp_name_rus from v_oil_np_type t where t.id= ' + IntToStr(qTubeNP_ID.asInteger))
    else
      str:='';
// Установить соотвествующий цвет для групп НП
    if str = 'ДТ' then qTubeCOLOR.AsString:= 'clBlue';
    if str = 'А-80' then qTubeCOLOR.AsString:= 'clYellow';
    if str = 'А-92' then qTubeCOLOR.AsString:= 'clGreen';
    if str = 'А-95' then qTubeCOLOR.AsString:= 'clRed';
    if (str <> 'ДТ') and (str <> 'А-80') and (str <> 'А-92') and (str <> 'А-95') then qTubeCOLOR.AsString:= '$003E9EFF';
    if str = '' then qTubeCOLOR.AsString:= '';
    qTubeTANK_REST.AsFloat       := qTubeTemp.FieldByName('TANK_REST').AsFloat;
    qTubeDATE_CHANGE.AsDateTime  := qTubeTemp.FieldByName('DATE_CHANGE').AsDateTime;
    qTubePIPELINE_VALVE.AsString := qTubeTemp.FieldByName('PIPELINE_VALVE').AsString;
  if GetSqlValue('select distinct t.date_change from tube_act t where t.state=''Y'' '+
     ' and t.act_num = '+ eActNum.Text) = trunc(Now)
  then
    qTubeDATE_CHANGE.AsDateTime  := trunc(Now)
  else
    begin
      if bNew then  qTubeDATE_CHANGE.AsDateTime  := trunc(Now)
      else
        qTubeDATE_CHANGE.AsDateTime  := GetSqlValue('select distinct t.date_change from tube_act t where t.state=''Y'' '+
      ' and t.act_num = '+ eActNum.Text);
    end;
end;
//==============================================================================
procedure TTubeActForm.grTubeEditButtonClick(Sender: TObject);
var
  str : String;
begin
  inherited;
  if (grTube.SelectedField.FieldName = 'NP_GRP_NAME') and not (qTube.FieldByName('layer_name').isNull) then
  begin
    Application.CreateForm(TNPTypeRefForm, NPTypeRefForm);
    NPTypeRefForm.ShowModal;
    If NPTypeRefForm.ModalResult = mrOk Then
    Begin
      qTube.Edit;
      qTube.FieldByName('NP_ID').AsInteger := NPTypeRefForm.qID.AsInteger;
      if qTubeNP_ID.asInteger <>0 then
        str:= GetSqlValue('select t.np_grp_name_rus from v_oil_np_type t where t.id= ' + IntToStr(qTubeNP_ID.asInteger))
      else
        str:='';
      qTubeNP_GRP_NAME.AsString := NPTypeRefForm.qNAME.AsString;
    // Установить соотвествующий цвет для групп НП
      if str = 'ДТ' then qTubeCOLOR.AsString:= 'clBlue';
      if str = 'А-80' then qTubeCOLOR.AsString:= 'clYellow';
      if str = 'А-92' then qTubeCOLOR.AsString:= 'clGreen';
      if str = 'А-95' then qTubeCOLOR.AsString:= 'clRed';
      if str = '' then qTubeCOLOR.AsString:= '';
      if (str <> 'ДТ') and (str <> 'А-80') and (str <> 'А-92') and (str <> 'А-95') then qTubeCOLOR.AsString:= '$003E9EFF';
      qTube.Post;
    End;  
    NPTypeRefForm.Free;
  end;  
end;
//==============================================================================
procedure TTubeActForm.Init;
var
  qL: TOraQuery;
begin
 // inherited;
  qL := TOraQuery.Create(nil);
  qL.Sql.Text := 'select distinct layer_name as layerList from tube_act where state  = ''Y''  '+
  ' order by to_number(layer_name) ';
  qL.Open;
  grTube.FieldColumns['layer_name'].PickList.Clear;
  qL.First;
  while not qL.Eof do
  begin
    grTube.FieldColumns['layer_name'].PickList.Add(IntToStr(qL.FieldByName('layerList').AsInteger));
    qL.Next;
  end;
  qL.Free;
  if eDate.Text = ''  then
    eDate.Text := DateToStr(trunc(Now))
  else
    eDate.Text := GetSqlValue('select distinct t.date_change from tube_act t where t.state=''Y'' '+
    ' and t.act_num = '+ eActNum.Text) ;
  qTubeTemp := TOraQuery.Create(nil);
  qTubeTemp.SQL.Text := qTube.BaseSQL;
  qTubeTemp.Open;
  qTube.ParamByName('act_num').AsInteger := ID;
  qTube.Open;
  StartSqlOra;
end;
//==============================================================================
procedure TTubeActForm.Save;
begin
  inherited;   
end;
//==============================================================================
procedure TTubeActForm.Test;
var
  qL: TOraQuery;
  sMessage: String;
begin
  if eActNum.Text = '' then
  raise Exception.Create('Не введен номер акта!');
  qL := TOraQuery.Create(nil);
  qL.Sql.Text :=  ' select tt.layer_name ,tt.rnum from   '+
  '(select t.layer_name, row_number() over(partition by t.layer_name order by t.layer_name desc) as rnum  '+
  ' from  tube_act t where t.act_num = '+ eActNum.Text+ ' and  t.state=''Y'' ) tt where   tt.rnum >1  ';
  qL.Open;
  qL.First;
  if  not qL.FieldByName('layer_name').IsNull then
  begin
    while not qL.Eof do
    begin
      sMessage:= sMessage + '   '+ qL.FieldByName('layer_name').AsString;
      qL.Next;
    end;
    raise Exception.Create('Номера: ' + sMessage+ ' позиции повторяются!');
  end;
  qL.Free;
end;
//==============================================================================
procedure TTubeActForm.dslisttubeDataChange(Sender: TObject; Field: TField);
begin
  grTube.FieldColumns['tank_rest'].PickList.Clear;
  grTube.FieldColumns['tank_rest'].PickList.Add('0');
  grTube.FieldColumns['tank_rest'].PickList.Add(IntToStr(grTube.DataSource.DataSet.FieldByName('max_volume').AsInteger));
  qTubeAfterPost(nil);
  if  (qTube.State = dsBrowse) then
  begin
    grTube.Columns[4].Footers[0].Value:= FormatWeigth(qTube.FieldByName('SumTankRest').AsFloat);
    grTube.Columns[3].Footers[0].Value:= FormatWeigth(qTube.FieldByName('SumTankVal').AsFloat);
    grTube.Columns[2].Footers[0].Value:= qTube.FieldByName('NP_GRP_NAME').AsString;
  end;
end;
//==============================================================================
procedure TTubeActForm.sbDelClick(Sender: TObject);
begin
  try
    if not qTube.IsEmpty then
      qTube.Delete;
  except on E: Exception do
    begin
      ShowMessage(E.Message);
      RollbackSQL;
    end;
  end;
end;
//==============================================================================
procedure TTubeActForm.qTubeAfterPost(DataSet: TDataSet);
begin
  if (qTubeACT_NUM.AsString <> '') and (eActNum.Text = '') then
    begin
      eActNum.Text := qTubeACT_NUM.AsString;
      eDate.Text := DateToStr(qTube.FieldByName('DATE_CHANGE').AsDateTime);
    end;
    id:=qTubeID.AsInteger;
end;
//==============================================================================
procedure TTubeActForm.bbOkClick(Sender: TObject);
begin
  if bFromLastAct then
    begin
     qTube.First;
     StartSQLOra;
     while not qTube.Eof do
     begin
       try
         DBSaver.SaveRecord('TUBE_ACT',
         ['ID',            	  GetSeqNextVal('S_TUBE_ACT'),
         'INST',          	  	  qTube.FieldByName('INST').AsString,
         'STATE',         	     'Y',
       	'LAYER_NAME',    	     qTube.FieldByName('LAYER_NAME').AsString,
      	'COLOR',          	  qTube.FieldByName('COLOR').AsString,
       	'NP_ID',          	  qTube.FieldByName('NP_ID').AsString,
      	'CONDITION',      	  1,
      	'MAX_VOLUME',     	  qTube.FieldByName('MAX_VOLUME').AsFloat,
       	'TANK_REST',      	  qTube.FieldByName('TANK_REST').AsFloat,
         'PIPELINE_VALVE',      qTube.FieldByName('PIPELINE_VALVE').AsString,
      	'DATE_CHANGE',         DateToStr(trunc(Now)),
       	'DATE_MOD',       	  '01.01.1999',
      	'NOTES',          	  qTube.FieldByName('NOTES').AsString,
      	'COMMENT_',       	  qTube.FieldByName('COMMENT_').AsString,
      	'LAYER_NAME_CAD',      qTube.FieldByName('LAYER_NAME_CAD').AsString,
         'ACT_NUM',             StrToInt(eActNum.Text)+1,
     		'LAYER_NAME_CAD_EXIST','Y'
     	   ]);
       except on E: Exception do
         begin
           RollBackSQLOra;
           if pos(#10, E.Message) > 0 then
             MessageDlg(copy(E.Message, 0, pos(#10, E.Message)), mtWarning, [mbOk], 0)
           else
             MessageDlg(E.Message, mtWarning, [mbOk], 0);
         end;
       end;
       qTube.Next;
     end;
     CommitSQLOra;
     ModalResult:=mrOk;
     bFromLastAct:=false;
   end
   else
     inherited;
end;
//==============================================================================
procedure TTubeActForm.grTubeMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited;
    if qTube.IsEmpty then
    sbDel.Enabled := false
  else
    sbDel.Enabled := true;  
end;
//==============================================================================
procedure TTubeActForm.grTubeSortMarkingChanged(Sender: TObject);
var
  i: Integer;
  OrderField: String;
begin
  qTube.Close;
  with grTube do
    for i := 0 to SortMarkedColumns.Count-1 do
    begin
      if SortMarkedColumns[i].FieldName = 'LAYER_NAME' then
        OrderField := 'to_number(LAYER_NAME)'
      else
        OrderField := SortMarkedColumns[i].FieldName;
      if SortMarkedColumns[i].FieldName = 'NP_GRP_NAME' then
        OrderField := 'NP_GRP_NAME,to_number(LAYER_NAME)' ;
      if SortMarkedColumns[i].Title.SortMarker = smDownEh then
      begin
        qTube.SetOrderBy(OrderField);
        break;
      end
      else
        if SortMarkedColumns[i].Title.SortMarker = smUpEh then
        begin
           if SortMarkedColumns[i].FieldName = 'NP_GRP_NAME' then
             qTube.SetOrderBy('NP_GRP_NAME DESC,to_number(LAYER_NAME)')
           else
             qTube.SetOrderBy(OrderField +' DESC');
          break;
        end;
    end;
  _OpenQueryOra(TOilQuery(qTube));
end;
//==============================================================================
procedure TTubeActForm.eDateChange(Sender: TObject);
begin
  inherited;
 if eDate.Text ='30.12.1899' then
   eDate.Text:='';
end;
//==============================================================================
procedure TTubeActForm.sbAddClick(Sender: TObject);
begin
  inherited;
  qTube.Insert;
end;
//==============================================================================
procedure TTubeActForm.qTubeNP_GRP_NAMEChange(Sender: TField);
var
  str : String;
begin
  if (qTubeLAYER_NAME.AsString <> '') and (qTube.State = dsEdit) then
  begin
    qTubeNP_ID.asInteger := GetSqlValue('select t.id from v_oil_np_type t where t.name_rus =''' + qTubeNP_GRP_NAME.AsString + '''');
    if qTubeNP_ID.asInteger <>0 then
      str:= GetSqlValue('select t.np_grp_name_rus from v_oil_np_type t where t.id= ' + IntToStr(qTubeNP_ID.asInteger))
    else
      str:='';
    // Установить соотвествующий цвет для групп НП
    if str = 'ДТ' then qTubeCOLOR.AsString:= 'clBlue';
    if str = 'А-80' then qTubeCOLOR.AsString:= 'clYellow';
    if str = 'А-92' then qTubeCOLOR.AsString:= 'clGreen';
    if str = 'А-95' then qTubeCOLOR.AsString:= 'clRed';
    if str = '' then qTubeCOLOR.AsString:= '';
    if (str <> 'ДТ') and (str <> 'А-80') and (str <> 'А-92') and (str <> 'А-95') then qTubeCOLOR.AsString:= '$003E9EFF';
    qTube.Post;
  end;   
end;
//==============================================================================
procedure TTubeActForm.MI2Click(Sender: TObject);
Var PF:TRefPrintForm;
    i:integer;
    posI,posII,curP,posT:integer;
    PROGR:TProgrForm;
    bm:TBookMark;

    IWorkbook: Excel8TLB._Workbook;
    ISheet: Excel8TLB._Worksheet;
    List:Variant;
    NewValueArray: OLEVariant;
    IRange: Excel8TLB.Range;
begin
  if not qTube.active then
    exit;
  qTube.Last; qTube.First;
  PF := TRefPrintForm.Create(Application);
  Application.CreateForm(TProgrForm,progr);
  try
    PF.Caption := PF.Caption+' '+copy(Caption,pos(':',Caption)+1,length(Caption));
    PF.CN.MaxValue := qTube.RecordCount;
    PF.CN.Hint := TranslateText('Максимальное количество записей : ')+inttostr(qTube.recordcount);
    //---------------------------------------
    for i:=0 to grTube.Columns.Count-1 do
    begin
      if grTube.Columns[i].Visible and (grTube.Columns[i].FieldName <> '') then
      begin
        PF.RxCheckListBox1.Items.Add(grTube.Columns[i].Title.Caption);
        PF.FName.Add(grTube.Columns[i].FieldName);
        PF.RxCheckListBox1.Checked[PF.RxCheckListBox1.Items.count-1] := true;
      end;
    end;
    //---------------------------------------
    PF.ShowModal;
    if PF.ModalResult=MrOk then
    begin
      try
        Progr.Progress:=0;
        Progr.Show;
        Progr.Repaint;
        MainForm.CreateExcel(false);
        //---------------- Load Pattern ----------------------
        if Assigned(MainForm.IXLSApp) then
        begin
          IWorkbook := MainForm.AddWorkbook(GetMainDir+'pattern\Ref.xls');
          try
            ISheet := IWorkbook.Worksheets.Item['Лист1'] as Excel8TLB._Worksheet; // *NO_TRANSLATE*
            List := ISheet;
            List.Cells[2,1] := Caption;
            List.Cells[2,1].Font.Bold := True;

            List.Cells[1,1].Font.Size := 8;
            List.Cells[1,1].HorizontalAlignment := xlLeft;
            List.Cells[1,1] := GetOrgName(Main.Main_Id,Main.Inst)+'; '+DateToStr(Date)+'; '+TimeToStr(Time);

            if pf.cn.value=0 then progr.MaxValue := qTube.RecordCount+10
                             else progr.MaxValue := trunc(PF.CN.Value)+10;
            posI:=4;posII:=1;
            //========== Print Header =========
            for i := 0 to PF.FName.Count-1 do
              if PF.RxCheckListBox1.Checked[i] then
                inc(posII);
            NewValueArray := VarArrayCreate( [1,POSII], varVariant);
            IRange := ISheet.Range['A'+inttostr(posI),ExcelSTR(posII)+inttostr(posI)];
            curp := 1;
            for i := 0 to PF.FName.Count-1 do
            begin
              if PF.RxCheckListBox1.Checked[i]=true then
              begin
                NewValueArray[curp] := PF.RxCheckListBox1.Items[I];
                inc(curp);
              end;
            end;
            IRange.Font.Size:=8;
            IRange.Font.Bold:=true;
            IRange.HorizontalAlignment:=xlcenter;
            IRange.Value := NewValueArray;
            inc(posI);
            progr.progress:=10;
            //=========================================
            qTube.DisableControls;
            try
              BM:=qTube.GetBookMark;
              qTube.first;posT:=1;
              while not qTube.eof do
              begin
                IRange := ISheet.Range['A'+inttostr(posI),ExcelSTR(posII)+inttostr(posI)];
                curp:=1;
                for i:=0 to PF.FName.Count-1 do
                begin
                  if PF.RxCheckListBox1.Checked[i]=true then
                  begin
                    NewValueArray[curp] := qTube.fieldbyname(PF.FName.strings[I]).asstring;
                    inc(curp);;
                  end;
                end;
                IRange.Font.Size:=8;
                IRange.HorizontalAlignment:=xlright;
                IRange.Value := NewValueArray;
                progr.progress:=progr.progress+1;
                INC(posI);
                qTube.next;
                if (PF.CN.value<>0) and (PF.CN.Value=posT) then
                  break;
                inc(posT);
              end;
              qTube.GotoBookMark(BM);
              qTube.FreeBookMark(BM);
            finally
              qTube.EnableControls;
            end;
            //=========================================
            curp := 1;
            for i:=0 to PF.FName.Count-1 do
              if PF.RxCheckListBox1.Checked[i] then
              begin
                List.Columns[ExcelSTR(curp)+':'+ExcelSTR(curp)].EntireColumn.AutoFit;
                inc(curp);
              end;
            IRange := ISheet.Range['A3',ExcelSTR(posII-1)+inttostr(posI-1)];
            IRange.Borders.LineStyle:=xlContinuous;
            inc(posI);
            List.Cells[posI,'A'].value := PF.Edit1.text;
            //========================================

            MainForm.ShowExcel;
          finally
            IRange := nil;
            ISheet := nil;
            IWorkbook := nil;
            List := unassigned;
          end;
        end;
      except On E:Exception Do
        begin
          MainForm.HideExcel;
          MessageDlg(TranslateText('Ошибка построения отчета :')+E.message,mtError,[mbOk],0);
          MainForm.ReleaseExcel;
        end;
      end;
    end;
  finally     
    progr.free;  
    PF.Free;
  end;
end;
//==============================================================================
function TTubeActForm.FormatWeigth(AValue: Currency): string;
var
  fs: TFormatSettings;
begin
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, fs);
  fs.ThousandSeparator := ' ';
  fs.CurrencyString := '';
  fs.CurrencyDecimals := 0;
  Result := Format('%m',[AValue],fs);
end;

end.










