 unit Base;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Db, DBTables, Grids, DBGrids, ExtCtrls, Placemnt,
  Menus, ActiveX,
 {$IFDEF VER120}
  OleCtrls,
{$ENDIF}
  Excel8TLB, RXDBCtrl, ActnList, RXCtrls, Ora, uCommonForm,uOilQuery,uOilStoredProc,
  MemDS, DBAccess, DBGridEh{$IFDEF VER150},Variants, GridsEh,
  DBGridEhGrouping{$ENDIF};

type
  TBaseForm = class(TCommonForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ds: TOraDataSource;
    q: TOilQuery;
    Panel3: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    ADMQ: TOilQuery;
    PAdd: TPanel;
    sbAdd: TSpeedButton;
    PEdit: TPanel;
    sbEdit: TSpeedButton;
    pDel: TPanel;
    sbDel: TSpeedButton;
    Panel4: TPanel;
    bbClear: TBitBtn;
    bbSearch: TBitBtn;
    PUM: TPopupMenu;
    pBase: TPanel;
    MI1: TMenuItem;
    DBGrid1: TDBGridEh;
    pnlHideFilter: TPanel;
    sbFilterPosition: TSpeedButton;
    ActionList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    PanelCol: TPanel;
    cbCol: TRxCheckListBox;
    pRefresh: TPanel;
    spbCloseTunePanel: TSpeedButton;
    spbSelectAll: TSpeedButton;
    sbCol: TSpeedButton;
    pPrint: TPanel;
    sbBasePrint: TRxSpeedButton;
    spbClearColConfig: TSpeedButton;
    pTotal: TPanel;
    sbTotal: TSpeedButton;
    pSpeedUp: TPanel;
    sbSpeedUp: TSpeedButton;
    pShowDetail: TPanel;
    cbShowDetail: TCheckBox;
    pDetail: TPanel;
    DBGridDetail: TDBGridEh;
    SplitterDetail: TSplitter;
    qDetail: TOilQuery;
    dsDetail: TOraDataSource;
    procedure bbOkClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbEditClick(Sender: TObject); virtual; 
    procedure MI1Click(Sender: TObject);
    procedure Panel1DblClick(Sender: TObject);
    procedure sbFilterPositionClick(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure sbColClick(Sender: TObject);
    procedure cbColClickCheck(Sender: TObject);
    procedure spbSelectAllClick(Sender: TObject);
    procedure spbCloseTunePanelClick(Sender: TObject);
    (** При сортировке *)
    procedure DBGrid1SortMarkingChanged(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure qBeforeOpen(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1ColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure spbClearColConfigClick(Sender: TObject);
    procedure sbTotalClick(Sender: TObject);
    procedure sbSpeedUpClick(Sender: TObject);
    procedure cbShowDetailClick(Sender: TObject);
  protected
    RedColorFieldName: string;
    RedColorFilter: TCustomEdit;
    FIsBaseGrid:boolean;
    IsColConfCleared: boolean;
    function GetIsBaseGrid():boolean;
    procedure SetIsBaseGrid(value:boolean);
    procedure AddOrderBy(AQuery:TOilQuery);
  public
    OriginalHeight : integer;
    InsideTransaction:boolean;
    OrderField,OrderDirection:string;//поле и направление сортировки
    slOrder:TStringList;//Направление сортировки указаное пользователем
    slOrderDefault:TStringList;//Здесь сохраняяем сортировку назначеную по умолчанию
    slIbgEdited:TStringList;//Проверка
    (** Используеться базовый грид *)
    property IsBaseGrid:boolean read GetIsBaseGrid write SetIsBaseGrid;
    function IsHaveRight(ARightId:integer):boolean;
    function NormalizeFormName: string;
  end;

implementation

Uses OilStd, Main,RefPrint,Progr, ExFunc, UDbFunc, uExeSql, uBill;
var
  ibgEdited:boolean=false;
{$R *.DFM}

procedure TBaseForm.bbOkClick(Sender: TObject);
begin
  if not sbSpeedUp.Down then
  begin
    If q.Active Then
    If not q.IsEmpty Then
    Begin
      Close;
      ModalResult := mrOk;
    End;
  end;
end;

procedure TBaseForm.bbCancelClick(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;

procedure TBaseForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then
    Action := caFree;
  //Сохранение колонок
  if IsBaseGrid and not IsColConfCleared then
    SaveGridColumns( DBGrid1,ClassName );
  // Закрытие Ворда, если он был открыт
  If CheckOleConnected(MsWord) Then
  Begin
    MsWord.Visible := True;
    MsWord.Application.Quit;
    MsWord := UnAssigned;
  End;
  // Закрытие Экселя, если он был открыт.
  If CheckOleConnected(MsExcel) Then
  Begin
    MsExcel.Visible := True;
    MsExcel.Application.Quit;
    MsExcel := UnAssigned;
  End;
end;

procedure TBaseForm.DBGrid1DblClick(Sender: TObject);
begin
  If (bbOk.Visible)And(bbOk.Enabled) Then bbOkClick(Nil)
    Else If (PEdit.Visible)And(sbEdit.Enabled) Then sbEdit.Click;//Click(Nil)
end;

procedure TBaseForm.FormCreate(Sender: TObject);
begin
  inherited;
  LoadKeyBoardLayout('00000419',KLF_ACTIVATE);
  LoadSQLByForm(TForm(Self));
  if 0<>GetSqlValueParSimple('select count(*) from adm_object where upper(name)=upper(:name) and type=''F'' ',
    ['name',NormalizeFormName])
  then
  begin
    ADMQ.close;
    _OpenQueryPar(ADMQ,
      ['emp_id',EMp_id,
       'object_name',NormalizeFormName
      ]);
    pAdd.Visible:=IsHaveRight(1);
    pEdit.Visible:=IsHaveRight(2);
    pDel.Visible:=IsHaveRight(3);
  end;
  OriginalHeight:=Panel2.Height;
  PanelCol.Width:=0;
  //махинации с колонками
  if slIbgEdited=nil then
    slIbgEdited := TStringList.Create;
  slOrderDefault := TStringList.Create;
  slOrder := TStringList.Create;
  if IsBaseGrid then
    LoadGrigColumns( DBGrid1,ClassName );
  cbShowDetailClick(nil);
end;

procedure TBaseForm.sbEditClick(Sender: TObject);
begin
 //
end;

procedure TBaseForm.MI1Click(Sender: TObject);
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
  if not q.active then
    exit;
  q.Last; q.First;
  PF := TRefPrintForm.Create(Application);
  Application.CreateForm(TProgrForm,progr);
  try
    PF.Caption := PF.Caption+' '+copy(Caption,pos(':',Caption)+1,length(Caption));
    PF.CN.MaxValue := q.RecordCount;
    PF.CN.Hint := TranslateText('Максимальное количество записей : ')+inttostr(q.recordcount);
    //---------------------------------------
    for i:=0 to DBGrid1.Columns.Count-1 do
    begin
      if DBGrid1.Columns[i].Visible and (DBGrid1.Columns[i].FieldName <> '') then
      begin
        PF.RxCheckListBox1.Items.Add(DBGrid1.Columns[i].Title.Caption);
        PF.FName.Add(DBGrid1.Columns[i].FieldName);
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

            if pf.cn.value=0 then progr.MaxValue := q.RecordCount+10
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
            q.DisableControls;
            try
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
                if (PF.CN.value<>0) and (PF.CN.Value=posT) then
                  break;
                inc(posT);
              end;
              Q.GotoBookMark(BM);
              Q.FreeBookMark(BM);
            finally
              q.EnableControls;
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

procedure TBaseForm.Panel1DblClick(Sender: TObject);
begin
    if Debugging then
        ShowTextInMemo(FullSqlText(q));
end;

procedure TBaseForm.sbFilterPositionClick(Sender: TObject);
begin
  if sbFilterPosition.Down then
  begin
    Panel2.AutoSize:=False;
    Panel2.Height := 0;
  end
  else
    Panel2.AutoSize:=True;
end;

procedure TBaseForm.actDelExecute(Sender: TObject);
begin
  if (sbDel.Visible) and (sbDel.Enabled) and
     (pDel.Visible) and (pDel.Enabled)
  then
    sbDel.Click;
end;

procedure TBaseForm.actEditExecute(Sender: TObject);
begin
  if (sbEdit.Visible) and (sbEdit.Enabled) and
     (pEdit.Visible) and (pEdit.Enabled)
  then
    sbEdit.Click;
end;

procedure TBaseForm.actAddExecute(Sender: TObject);
begin
  if (sbAdd.Visible) and (sbAdd.Enabled) and
     (pAdd.Visible) and (pAdd.Enabled)
  then
    sbAdd.Click;
end;

procedure TBaseForm.sbColClick(Sender: TObject);
var
  i:integer;
begin
  if not sbCol.Down then
    PanelCol.Width := 0
  else
  Begin
    PanelCol.Width := 150;
    cbCol.Items.Clear;
    For i:=0 to DBGrid1.Columns.Count-1 do
    Begin
      cbCol.Items.Add(DBGrid1.Columns[i].Title.Caption);
      if DBGrid1.Columns[i].Visible then
        cbCol.Checked[i]:=TRUE
      else
        cbCol.Checked[i]:=FALSE;
    end;
  End;
end;

procedure TBaseForm.cbColClickCheck(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to cbCol.Items.count-1 do
    DBGrid1.Columns[i].Visible:=cbCol.Checked[i];
end;

procedure TBaseForm.DBGrid1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  sbColClick(nil);
end;

procedure TBaseForm.spbCloseTunePanelClick(Sender: TObject);
begin
  sbCol.Down := false;
  sbColClick(nil);
end;

procedure TBaseForm.spbSelectAllClick(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to cbCol.Items.count-1 do
  Begin
    DBGrid1.Columns[i].Visible:=TRUE;
    cbCol.Checked[i]:=TRUE;
  end;
end;

function TBaseForm.GetIsBaseGrid():boolean;
begin
  if slIbgEdited <> nil then
  begin
    if slIbgEdited.IndexOfName( ClassName )=-1 then
      result := True
    else
      result := FIsBaseGrid;
  end
  else
  begin
    Result := True;
  end;
end;

procedure TBaseForm.SetIsBaseGrid(Value:boolean);
begin
  if slIbgEdited=nil then
    slIbgEdited:=TStringList.Create;
  slIbgEdited.Values[ ClassName ]:='Y';
  FIsBaseGrid:=Value;
end;

procedure TBaseForm.DBGrid1SortMarkingChanged(Sender: TObject);
var i :Integer;
begin
  with TDBGridEh(Sender) do
    for i := 0 to SortMarkedColumns.Count-1 do
      case SortMarkedColumns[i].Title.SortMarker of
        smDownEh:
          // TODO: Сделать так чтобы сортировала по только что выбраному товару, далее по предыдущему
          slOrder.Values[Self.ClassName+'-'+DataSource.DataSet.Name] := SortMarkedColumns[i].FieldName+' ASC NULLS LAST';
        smUpEh:
          slOrder.Values[Self.ClassName+'-'+DataSource.DataSet.Name] := SortMarkedColumns[i].FieldName+' DESC NULLS LAST';
      end;
  bbSearch.Click;
end;

procedure TBaseForm.AddOrderBy(AQuery:TOilQuery);
  //Обход глюка процедуры AQuery.SetOrderBy
  function NormalizeOrder(AFields:string):string;
  begin
    if trim(AFields)='' then
      Result:=''
    else
      Result:=' '+AFields+' ';
  end;
begin
  if slOrderDefault = nil then
    Exit;
  //Сохраняем сортировку по умолчанию
  if( slOrderDefault.IndexOfName( ClassName+'-'+AQuery.Name )=-1 )then
    slOrderDefault.Values[ ClassName+'-'+AQuery.Name ] := AQuery.GetOrderBy ;
  //если есть как сортировать, то ставим сортировку, иначе сортируем по умолчанию
  if( slOrder.IndexOfName( ClassName+'-'+AQuery.Name ) = -1 )then
    AQuery.SetOrderBy( NormalizeOrder(slOrderDefault.Values[ ClassName+'-'+AQuery.Name ]) )
  else
    AQuery.SetOrderBy( NormalizeOrder(slOrder.Values[ ClassName+'-'+AQuery.Name ]) );
end;

procedure TBaseForm.qBeforeOpen(DataSet: TDataSet);
begin inherited;
  AddOrderBy(DataSet as TOilQuery);
end;

procedure TBaseForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  i,j: integer;
  s1,s2,s3,value: string;
  R: TRect;
  Clr: TColor;
begin
  if (RedColorFilter.Text<>'') and (Column.FieldName=RedColorFieldName)
    and (Column.Alignment = taLeftJustify) then begin
    value:=q.FieldByName(Column.FieldName).AsString;
    i:=pos(ANSIUpperCase(RedColorFilter.Text),ANSIUpperCase(value));
    if i>0 then
      with DbGrid1.Canvas do begin
        j  := Length(RedColorFilter.Text);
        s1 := Copy(value,0,i-1);
        s2 := Copy(value,i,j);
        s3 := Copy(value,i+j,Length(value));
        R  := Rect;
        R.Left := R.Left+2;
        R.Top  := R.Top +2;
        Clr := Font.Color;
        TextOut(R.Left,R.Top,s1);
        i := TextWidth(s1);
        Font.Color := clRed;
        TextOut(R.Left+i,R.Top,s2);
        i := i+TextWidth(s2);
        Font.Color := Clr;
        TextOut(R.Left+i,R.Top,s3);
    end;
  end;
end;

procedure TBaseForm.FormDestroy(Sender: TObject);
begin
  inherited;
  slOrderDefault.Free;
  slOrder.Free;
  slIbgEdited.Free;
end;

function TBaseForm.IsHaveRight(ARightId:integer):boolean;
begin
  ADMQ.Filtered:=false;
  ADMQ.Filter:=' right_id= '+IntToStr(ARightId);
  ADMQ.Filtered:=true;
  Result:=ADMQ.RecordCount>0;
end;

function TBaseForm.NormalizeFormName: string;
begin
  //Отрезаем E_ если оно есть (формы бюджетной части)
  if copy(name,1,2)='E_' then
    Result:=copy(name,3,length(name))
  else
    Result:=name;
  //Берем название формы, до "_"
  if pos('_',Result)>0 then
    Result:=copy(Result,1,pos('_',Result)-1);
  if copy(name,1,2)='E_' then
    Result:='E_'+Result;
end;

procedure TBaseForm.FormShow(Sender: TObject);
var
  i: integer;
begin
  inherited;
  bbOk.Visible:=fsModal in (Sender as TForm).FormState;
  sbTotalClick(nil);  
  // Проставляем параметр нужный для сортировки
  for i := 0 to dbGrid1.Columns.Count -1 do
    dbGrid1.Columns[i].Title.TitleButton := True;

  DBGrid1.ClearFilter;
  DBGrid1.ApplyFilter;
  // выпадающий список для фильтра
  for i := 0 to DBGrid1.Columns.Count - 1 do
  begin
    DBGrid1.Columns[i].STFilter.ListSource := DBGrid1.DataSource;
    DBGrid1.Columns[i].STFilter.DataField := DBGrid1.Columns[i].FieldName;
  end;
end;

procedure TBaseForm.spbClearColConfigClick(Sender: TObject);
begin
  inherited;
  ClearGridColumns(ClassName);
  if not IsColConfCleared then
    ShowMessage(TranslateText('Перезапустите справочник, чтобы изменения вступили в силу.'));
  IsColConfCleared := True;
end;

procedure TBaseForm.sbTotalClick(Sender: TObject);
begin
  inherited;
  if sbTotal.Down then
    dbGrid1.FooterRowCount := 1
  else
    dbGrid1.FooterRowCount := 0;
end;

procedure TBaseForm.sbSpeedUpClick(Sender: TObject);
begin
  inherited;
  if sbSpeedUp.Down then
    sbSpeedUp.Hint:=TranslateText('Сокращенный формат таблицы (быстро)')
  else
    sbSpeedUp.Hint:=TranslateText('Полный формат таблицы (медленно)');
  bbSearch.Click();
end;

procedure TBaseForm.cbShowDetailClick(Sender: TObject);
begin
  inherited;
  if qDetail.Active then qDetail.Close;
  if cbShowDetail.Checked then
  begin
    qDetail.Open;
    if pDetail.Height = 0 then
    begin
      SplitterDetail.Height := 6;
      pDetail.Height := DBGrid1.Height div 3;
    end;
  end
  else if pDetail.Height <> 0 then
  begin
    SplitterDetail.Height := 0;
    pDetail.Height := 0;
  end
end;

end.
