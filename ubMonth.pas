unit ubMonth;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Db, DBTables, Grids, DBGrids, ExtCtrls, Placemnt,
  Menus,ActiveX,
 {$IFDEF VER120}
  OleCtrls,
{$ENDIF}
  Excel8TLB, RXDBCtrl, Mask, uCommonForm,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess, DBGridEh
  {$IFDEF VER150},Variants{$ENDIF};


type
  TubMonthForm = class(TCommonForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ds: TOraDataSource;
    q: TOilQuery;
    Panel3: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    ADMQ: TOilQuery;
    PUM: TPopupMenu;
    pBase: TPanel;
    MI1: TMenuItem;
    DBGrid1: TDBGridEh;
    Label1: TLabel;
    Label2: TLabel;
    cbMonth: TComboBox;
    meYear: TMaskEdit;
    qREZ_ID: TFloatField;
    qREZ_INST: TFloatField;
    qREZ_NUM: TStringField;
    qREZ_NAME: TStringField;
    qNP_TYPE: TFloatField;
    qNP_NAME: TStringField;
    qST_REST: TFloatField;
    qNORM_HRAN: TFloatField;
    qUB_HRAN: TFloatField;
    qMO_PRIH: TFloatField;
    qNORM_PRIH: TFloatField;
    qUB_PRIH: TFloatField;
    qMO_RASH: TFloatField;
    qNORM_RASH: TFloatField;
    qUB_RASH: TFloatField;
    qUB_ALL: TFloatField;
    ExistQ: TOilQuery;
    sp: TOilStoredProc;
    GetSeqQuery: TOilQuery;
    GetSeqQueryNV: TFloatField;
    DelQ: TOilQuery;
    bbCalc: TBitBtn;
    procedure bbOkClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure MI1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbMonthChange(Sender: TObject);
    procedure meYearChange(Sender: TObject);
    procedure bbCalcClick(Sender: TObject);
  private
  public
    procedure RefreshQuery;
  end;

implementation

Uses OilStd, Main,RefPrint,Progr, ExFunc;

{$R *.DFM}

procedure TubMonthForm.bbOkClick(Sender: TObject);
var
  i, the_id              :integer;
  Res                    :string;
begin
  If (q.Active) and (q.RecordCount>0) Then
  Begin
    ExistQ.Close;
    ExistQ.ParamByName('date_').asdate:=EncodeDate(StrToint(meYear.Text),
        cbMonth.ItemIndex+1,1);
    ExistQ.ParamByName('Inst').asInteger := INST;
    ExistQ.Open;
    if (ExistQ.FieldByName('co').asInteger = 0) or
        (MessageDlg(TranslateText('Ранее начисленная убыль будет удалена. Продолжать?'),
        mtWarning, [mbYes, mbNo], 0) = mrYes)
    then
    begin
      try
        StartSQL;
        // Удаление ненужных записей
        DelQ.ParamByName('Date_').asDate:=EncodeDate(StrToint(meYear.Text),
                      cbMonth.ItemIndex+1,1);
        DelQ.ParamByName('Inst').asInteger := INST;
        DelQ.ExecSQL;
        q.First;
        while not q.Eof do
        begin
          for i:= 1 to 3 do
          begin



            GetSeqQuery.Open;
            the_id:=GetSeqQueryNV.asInteger;
            GetSeqQuery.Close;
            with sp do
            begin
              StoredProcName := 'OIL.INSORUPDOIL_UB_MONTH';
              Prepare;
              ParamByName('ID#').asInteger := the_id;
              ParamByName('INST#').asInteger := INST;
              ParamByName('STATE#').asString := 'Y';
              ParamByName('REZ_ID#').asInteger := qrez_id.AsInteger;
              ParamByName('REZ_INST#').asInteger := Qrez_inst.AsInteger;
              ParamByName('NP_TYPE#').asInteger := Qnp_type.AsInteger;
              ParamByName('MONTH_#').asDate := EncodeDate(StrToint(meYear.Text),
                      cbMonth.ItemIndex+1,1);
              case i of
              1:
              begin
                ParamByName('UB_REASON#').asInteger := 1;
                ParamByName('UB_BASIC#').asFloat :=    qMO_PRIH.asFloat;
                ParamByName('UB_MASS#').asFloat :=     qUB_PRIH.asFloat;
              end;
              2:
              begin
                ParamByName('UB_REASON#').asInteger := 3;
                ParamByName('UB_BASIC#').asFloat :=    qST_REST.asFloat;
                ParamByName('UB_MASS#').asFloat :=     qUB_HRAN.asFloat;
              end;
              3:
              begin
                ParamByName('UB_REASON#').asInteger := 5;
                ParamByName('UB_BASIC#').asFloat :=    qMO_RASH.asFloat;
                ParamByName('UB_MASS#').asFloat :=     qUB_RASH.asFloat;
              end;
              end; // of case
              ExecProc;
                Res:=ParamByName('Result').AsString;
                If Length(Res)>0 Then
                  If Res[1]<>'0' Then
                    Raise Exception.Create(SubStr(Res,2));
            end;



          end;
          q.next;
        end;
        CommitSQL;
        Close;
        ModalResult := mrOk;
      except
        On E:Exception Do
        begin
          RollbackSQL;
          MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
        end;
      end;
    end;
  End
  else
    ShowMessage(TranslateText('Прежде чем начислять естественную убыль следует ее рассчитать.'));
end;

procedure TubMonthForm.bbCancelClick(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;

procedure TubMonthForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TubMonthForm.FormCreate(Sender: TObject);
var
  dd,mm,yy                                :word;
begin
  inherited;
  LoadKeyBoardLayout('00000419',KLF_ACTIVATE);
  //SetFormPos(MainForm,Self);
  //--------------------------------------
  {admq.close;
  if pos('_',name)=0 then admq.sql.text:='select * from v_user_rights where user_id='+inttostr(EMp_id)+' and Upper(object_name)='''+UpperCase(name)+''''
                     else admq.sql.text:='select * from v_user_rights where user_id='+inttostr(EMp_id)+' and Upper(object_name)='''+UpperCase(copy(name,1,pos('_',name)-1))+'''';
  admq.open;
  admq.first;
  while not admq.eof do
  begin
   case admq.fieldbyname('right_id').value of
    1:pAdd.Visible:=true;
    2:pEdit.Visible:=true;
    3:pDel.Visible:=true;
   end;
   admq.next;
  end;  }
  DecodeDate(now,yy,mm,dd);
  meYear.Text:= IntToStr(yy);
  if mm <> 1 then
    cbMonth.ItemIndex:=mm-2
  else
  begin
    cbMonth.ItemIndex:=11;
    meYear.Text:= IntToStr(yy-1);
  end;
end;

procedure TubMonthForm.MI1Click(Sender: TObject);
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
 q.Last; q.First;
 PF:=TRefPrintForm.Create(Application);
 PF.Caption:=PF.Caption+' '+copy(Caption,pos(':',Caption)+1,length(Caption));
 PF.CN.MaxValue:=q.recordcount;
 PF.CN.Hint:=TranslateText('Максимальное количество записей : ')+inttostr(q.recordcount);
 //---------------------------------------
  for i:=0 to DBGrid1.Columns.Count-1 do
  begin
   if DBGrid1.Columns[i].Visible=true then
   begin
    PF.RxCheckListBox1.Items.Add(DBGrid1.Columns[i].Title.Caption);
    PF.FName.Add(DBGrid1.Columns[i].FieldName);
    PF.RxCheckListBox1.Checked[PF.RxCheckListBox1.Items.count-1]:=true;
   end;
  end;
 //---------------------------------------
 PF.ShowModal;
 if PF.ModalResult=MrOk then
 begin
  try
   Application.CreateForm(TProgrForm,progr);
   Progr.Progress:=0;
   Progr.Show;
   Progr.Repaint;
   MainForm.CreateExcel(false);
   //---------------- Load Pattern ----------------------
   if Assigned(MainForm.IXLSApp) then
   begin
     IWorkbook := MainForm.AddWorkbook(GetMainDir+'pattern\Ref.xls');
     try
      ISheet := IWorkbook.Worksheets.Item['Лист1'] as Excel8TLB._Worksheet;// *NO_TRANSLATE*
      List:=ISheet;
       List.Cells[1,1]:=Caption;
       List.Cells[1,1].Font.Bold:=True;
       if pf.cn.value=0 then progr.MaxValue:=q.RecordCount+10
                        else progr.MaxValue:=trunc(PF.CN.Value)+10;
       posI:=3;posII:=1;
      //========== Print Header =========
       for i:=0 to PF.FName.Count-1 do if PF.RxCheckListBox1.Checked[i]=true then inc(posII);
       NewValueArray := VarArrayCreate( [1,POSII], varVariant);
       IRange := ISheet.Range['A'+inttostr(posI),ExcelSTR(posII)+inttostr(posI)];
       curp:=1;
       for i:=0 to PF.FName.Count-1 do
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
       q.disableControls;
       BM:=Q.GetBookMark;
        q.first;posT:=1;
        while not q.eof do
        begin
         IRange := ISheet.Range['A'+inttostr(posI),ExcelSTR(posII)+inttostr(posI)];
         curp:=1;
         for i:=0 to PF.FName.Count-1 do
         begin
          if PF.RxCheckListBox1.Checked[i]=true then
          begin
           NewValueArray[curp] := q.fieldbyname(PF.FName.strings[I]).asstring;
           inc(curp);;
          end;
         end;
         IRange.Font.Size:=8;
         IRange.HorizontalAlignment:=xlright;
         IRange.Value := NewValueArray;
         progr.progress:=progr.progress+1;
         INC(posI);
         q.next;
         if (PF.CN.value<>0) and (PF.CN.Value=posT) then break;
         inc(posT);
        end;
       Q.GotoBookMark(BM);
       Q.FreeBookMark(BM);
       q.EnableControls;
      //=========================================
       curp:=1;
       for i:=0 to PF.FName.Count-1 do if PF.RxCheckListBox1.Checked[i]=true then
       begin
        List.Columns[ExcelSTR(curp)+':'+ExcelSTR(curp)].EntireColumn.AutoFit;
        inc(curp);
       end;
       IRange := ISheet.Range['A3',ExcelSTR(posII-1)+inttostr(posI-1)];
       IRange.Borders.LineStyle:=xlContinuous;
       inc(posI);
       List.Cells[posI,'A'].value:=PF.Edit1.text;
      //========================================
      progr.free;
      MainForm.ShowExcel;
     finally
      IRange := nil;
      ISheet := nil;
      IWorkbook := nil;
      List:=unassigned;
     end;
   end;
  except On E:Exception Do
   begin
    progr.free;
    MainForm.HideExcel;
     MessageDlg(TranslateText('Ошибка построения отчета :')+E.message,mtError,[mbOk],0);
    MainForm.ReleaseExcel;
   end;
  end;
 end;
end;

procedure TubMonthForm.FormShow(Sender: TObject);
begin
  //RefreshQuery;
end;

procedure TUbMonthForm.RefreshQuery;

begin
  q.Close;
  q.ParamByName('inst').asInteger := INST;
  q.ParamByName('start_date').asDateTime:=
      EncodeDate(StrToInt(meYear.Text),cbMonth.ItemIndex+1,1);
  if CbMonth.ItemIndex <> 11 then
    q.ParamByName('end_date').asDateTime:=
        EncodeDate(StrToInt(meYear.Text),cbMonth.ItemIndex+2,1)-1
  else
    q.ParamByName('end_date').asDateTime:=
        EncodeDate(StrToInt(meYear.Text),12,31); // Декабрь
  q.ParamByName('month').asInteger :=  cbMonth.ItemIndex+1;
  q.Open;
end;

procedure TubMonthForm.cbMonthChange(Sender: TObject);
begin
  //RefreshQuery;
  q.Close;
end;

procedure TubMonthForm.meYearChange(Sender: TObject);
begin
  //RefreshQuery;
  q.Close;
end;

procedure TubMonthForm.bbCalcClick(Sender: TObject);
begin
  RefreshQuery;
end;

end.
