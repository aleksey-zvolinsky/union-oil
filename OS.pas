unit OS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ImgList, ExtCtrls, ComCtrls, StdCtrls, DBCtrls, Buttons, Mask,
  DBCtrlsEh, Db, DBTables, uCommonForm,uOilQuery,Ora, uOilStoredProc,
  MemDS, DBAccess;

type
  PCodOilOS = ^Integer;

type
  TfrmOS = class(TCommonForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    dlcFilial: TDBLookupComboBox;
    chbAll: TCheckBox;
    cmbDateEnd: TComboBox;
    trvOS: TTreeView;
    Splitter1: TSplitter;
    imlOS: TImageList;
    fidSearch: TFindDialog;
    aclMain: TActionList;
    actSearch: TAction;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    bbtQuit: TBitBtn;
    bbtSearch: TBitBtn;
    dedName: TDBEditEh;
    dsrOS: TOraDataSource;
    qryOS: TOilQuery;
    dsrFilial: TOraDataSource;
    qryFilial: TOilQuery;
    qryGroup1: TOilQuery;
    qryGroup2: TOilQuery;
    qryGroup3: TOilQuery;
    qryGroup4: TOilQuery;
    qryGroup5: TOilQuery;
    qryGroup6: TOilQuery;
    qryGroup1CODOILOS: TFloatField;
    qryGroup1GROUP1: TStringField;
    qryGroup1FloatField0: TFloatField;
    qryGroup1DATE_END: TDateTimeField;
    qryGroup2CODOILOS: TFloatField;
    qryGroup2GROUP2: TStringField;
    qryGroup2FloatField0: TFloatField;
    qryGroup2DATE_END: TDateTimeField;
    qryGroup3CODOILOS: TFloatField;
    qryGroup3GROUP3: TStringField;
    qryGroup3FloatField0: TFloatField;
    qryGroup3DATE_END: TDateTimeField;
    qryGroup4CODOILOS: TFloatField;
    qryGroup4GROUP4: TStringField;
    qryGroup4FloatField0: TFloatField;
    qryGroup4DATE_END: TDateTimeField;
    qryGroup5CODOILOS: TFloatField;
    qryGroup5GROUP5: TStringField;
    qryGroup5FloatField0: TFloatField;
    qryGroup5DATE_END: TDateTimeField;
    qryOSNAME: TStringField;
    qryOSINV_NUMBER: TStringField;
    qryOSQUANTITY: TFloatField;
    qryOSBEGIN_COST: TFloatField;
    qryOSEND_COST: TFloatField;
    qryOSDATE_: TDateTimeField;
    qryOSSTORAGE_: TStringField;
    qryOSDATE_END: TDateTimeField;
    qryOSLIQ_REASON: TStringField;
    qryOSSUM_SALE: TFloatField;
    qryOSNAMEFIRMA: TStringField;
    qryOSCUSTOMER: TStringField;
    qryFilialFROM_OIL: TFloatField;
    qryFilialNAMEFIRMA: TStringField;
    qryGroup6CODOILOS: TFloatField;
    qryGroup6NAME: TStringField;
    qryGroup6DATE_END: TDateTimeField;
    procedure FormDestroy(Sender: TObject);
    procedure bbtQuitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryFilialAfterOpen(DataSet: TDataSet);
    procedure qryFilialAfterScroll(DataSet: TDataSet);
    procedure trvOSChange(Sender: TObject; Node: TTreeNode);
    procedure trvOSExpanded(Sender: TObject; Node: TTreeNode);
    procedure trvOSCollapsed(Sender: TObject; Node: TTreeNode);
    procedure chbAllClick(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure fidSearchFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ptrReadData: PCodOilOS;
    blnFind: Boolean;
  public
    { Public declarations }
  end;

var
  frmOS: TfrmOS;

implementation

{$R *.DFM}


procedure TfrmOS.FormCreate(Sender: TObject);
begin
  inherited;
  cmbDateEnd.ItemIndex := 0;
end;

procedure TfrmOS.FormShow(Sender: TObject);
begin
  New(ptrReadData); {Выделяем память}

  qryFilial.Open;
//  Self.WindowState := wsMaximized;
end;

procedure TfrmOS.FormDestroy(Sender: TObject);
begin
  qryOS.Close;
  qryFilial.Close;

  Dispose(ptrReadData); {Освобождаем память}
end;

procedure TfrmOS.bbtQuitClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmOS.qryFilialAfterOpen(DataSet: TDataSet);
begin
  dlcFilial.KeyValue := qryFilialFrom_Oil.AsInteger;
end;

procedure TfrmOS.qryFilialAfterScroll(DataSet: TDataSet);
var
  trnNew: TTreeNode;
  ptrNewData: PCodOilOS;
begin
  {1-я группа}
  if qryGroup1.ParamByName('FO').AsInteger <> qryFilialFrom_Oil.AsInteger then
  begin
    trvOS.Items.Clear;

    qryOS.Close;

    qryGroup1.Close;
    qryGroup1.ParamByName('FO').AsInteger := qryFilialFrom_Oil.AsInteger;
    if cmbDateEnd.ItemIndex = 0 then
      qryGroup1.ParamByName('DateEnd').AsInteger := 1
    else
      qryGroup1.ParamByName('DateEnd').AsInteger := 0;
    qryGroup1.Open;

    while not qryGroup1.EOF do
    begin
      New(ptrNewData); {Выделяем память}
      ptrNewData^ := qryGroup1CodOilOS.AsInteger;

      trnNew := trvOS.Items.Add(nil, qryGroup1Group1.AsString);
      trnNew.Data := ptrNewData;
      if qryGroup1CodOilOS.AsInteger = 0 then
      begin
        trnNew.ImageIndex := 0;
        trnNew.SelectedIndex := 0;
      end
      else
        if qryGroup1Date_End.IsNull then
        begin
          trnNew.ImageIndex := 2;
          trnNew.SelectedIndex := 2;
        end
        else begin
          trnNew.ImageIndex := 3;
          trnNew.SelectedIndex := 3;
        end;

      qryGroup1.Next;
    end; {while}
    qryGroup1.Close;
  end; {if}
end;

procedure TfrmOS.trvOSChange(Sender: TObject; Node: TTreeNode);
var
  trnNew: TTreeNode;
  ptrNewData: PCodOilOS;
begin
  case Node.Level of
    0: begin
       ptrReadData := Node.Data;

       if ptrReadData^ = 0 then
       {Кликнули на папке}
         begin
         qryOS.Close;
         if Node.HasChildren then Exit;

         qryGroup2.Close;
         if chbAll.Checked then
           qryGroup2.ParamByName('FO').Clear
         else
           qryGroup2.ParamByName('FO').AsInteger := qryFilialFrom_Oil.AsInteger;
         if cmbDateEnd.ItemIndex = 0 then
           qryGroup2.ParamByName('DateEnd').AsInteger := 1
         else
           qryGroup2.ParamByName('DateEnd').AsInteger := 0;
         qryGroup2.ParamByName('G1').AsString := Node.Text;
         qryGroup2.Open;

         while not qryGroup2.EOF do
           begin
           New(ptrNewData); {Выделяем память}
           ptrNewData^ := qryGroup2CodOilOS.AsInteger;

           trnNew := trvOS.Items.AddChild(Node, qryGroup2Group2.AsString);
           trnNew.Data := ptrNewData;
           if qryGroup2CodOilOS.AsInteger = 0 then
             begin
             trnNew.ImageIndex := 0;
             trnNew.SelectedIndex := 0;
             end
           else
             if qryGroup2Date_End.IsNull then
               begin
               trnNew.ImageIndex := 2;
               trnNew.SelectedIndex := 2;
               end
             else
               begin
               trnNew.ImageIndex := 3;
               trnNew.SelectedIndex := 3;
               end;

           qryGroup2.Next;
           end;
         qryGroup2.Close;
         end
       else
       {Кликнули на ОС-е}
         begin
         qryOS.Close;
         qryOS.ParamByName('COO').AsInteger := ptrReadData^;
         qryOS.Open;
         end;
       end; {0}

    1: begin
       ptrReadData := Node.Data;

       if ptrReadData^ = 0 then
       {Кликнули на папке}
         begin
         qryOS.Close;
         if Node.HasChildren then Exit;

         qryGroup3.Close;
         if chbAll.Checked then
           qryGroup3.ParamByName('FO').Clear
         else
           qryGroup3.ParamByName('FO').AsInteger := qryFilialFrom_Oil.AsInteger;
         if cmbDateEnd.ItemIndex = 0 then
           qryGroup3.ParamByName('DateEnd').AsInteger := 1
         else
           qryGroup3.ParamByName('DateEnd').AsInteger := 0;
         qryGroup3.ParamByName('G1').AsString := Node.Parent.Text;
         qryGroup3.ParamByName('G2').AsString := Node.Text;
         qryGroup3.Open;

         while not qryGroup3.EOF do
           begin
           New(ptrNewData); {Выделяем память}
           ptrNewData^ := qryGroup3CodOilOS.AsInteger;

           trnNew := trvOS.Items.AddChild(Node, qryGroup3Group3.AsString);
           trnNew.Data := ptrNewData;
           if qryGroup3CodOilOS.AsInteger = 0 then
             begin
             trnNew.ImageIndex := 0;
             trnNew.SelectedIndex := 0;
             end
           else
             if qryGroup3Date_End.IsNull then
               begin
               trnNew.ImageIndex := 2;
               trnNew.SelectedIndex := 2;
               end
             else
               begin
               trnNew.ImageIndex := 3;
               trnNew.SelectedIndex := 3;
               end;

           qryGroup3.Next;
           end;
         qryGroup3.Close;
         end
       else
       {Кликнули на ОС-е}
         begin
         qryOS.Close;
         qryOS.ParamByName('COO').AsInteger := ptrReadData^;
         qryOS.Open;
         end;
       end; {1}

    2: begin
       ptrReadData := Node.Data;

       if ptrReadData^ = 0 then
       {Кликнули на папке}
         begin
         qryOS.Close;
         if Node.HasChildren then Exit;

         qryGroup4.Close;
         if chbAll.Checked then
           qryGroup4.ParamByName('FO').Clear
         else
           qryGroup4.ParamByName('FO').AsInteger := qryFilialFrom_Oil.AsInteger;
         if cmbDateEnd.ItemIndex = 0 then
           qryGroup4.ParamByName('DateEnd').AsInteger := 1
         else
           qryGroup4.ParamByName('DateEnd').AsInteger := 0;
         qryGroup4.ParamByName('G1').AsString := Node.Parent.Parent.Text;
         qryGroup4.ParamByName('G2').AsString := Node.Parent.Text;
         qryGroup4.ParamByName('G3').AsString := Node.Text;
         qryGroup4.Open;

         while not qryGroup4.EOF do
           begin
           New(ptrNewData); {Выделяем память}
           ptrNewData^ := qryGroup4CodOilOS.AsInteger;

           trnNew := trvOS.Items.AddChild(Node, qryGroup4Group4.AsString);
           trnNew.Data := ptrNewData;
           if qryGroup4CodOilOS.AsInteger = 0 then
             begin
             trnNew.ImageIndex := 0;
             trnNew.SelectedIndex := 0;
             end
           else
             if qryGroup4Date_End.IsNull then
               begin
               trnNew.ImageIndex := 2;
               trnNew.SelectedIndex := 2;
               end
             else
               begin
               trnNew.ImageIndex := 3;
               trnNew.SelectedIndex := 3;
               end;

           qryGroup4.Next;
           end;
         qryGroup4.Close;
         end
       else
       {Кликнули на ОС-е}
         begin
         qryOS.Close;
         qryOS.ParamByName('COO').AsInteger := ptrReadData^;
         qryOS.Open;
         end;
       end; {2}

    3: begin
       ptrReadData := Node.Data;

       if ptrReadData^ = 0 then
       {Кликнули на папке}
         begin
         qryOS.Close;
         if Node.HasChildren then Exit;

         qryGroup5.Close;
         if chbAll.Checked then
           qryGroup5.ParamByName('FO').Clear
         else
           qryGroup5.ParamByName('FO').AsInteger := qryFilialFrom_Oil.AsInteger;
         if cmbDateEnd.ItemIndex = 0 then
           qryGroup5.ParamByName('DateEnd').AsInteger := 1
         else
           qryGroup5.ParamByName('DateEnd').AsInteger := 0;
         qryGroup5.ParamByName('G1').AsString := Node.Parent.Parent.Parent.Text;
         qryGroup5.ParamByName('G2').AsString := Node.Parent.Parent.Text;
         qryGroup5.ParamByName('G3').AsString := Node.Parent.Text;
         qryGroup5.ParamByName('G4').AsString := Node.Text;
         qryGroup5.Open;

         while not qryGroup5.EOF do
           begin
           New(ptrNewData); {Выделяем память}
           ptrNewData^ := qryGroup5CodOilOS.AsInteger;

           trnNew := trvOS.Items.AddChild(Node, qryGroup5Group5.AsString);
           trnNew.Data := ptrNewData;
           if qryGroup5CodOilOS.AsInteger = 0 then
             begin
             trnNew.ImageIndex := 0;
             trnNew.SelectedIndex := 0;
             end
           else
             if qryGroup5Date_End.IsNull then
               begin
               trnNew.ImageIndex := 2;
               trnNew.SelectedIndex := 2;
               end
             else
               begin
               trnNew.ImageIndex := 3;
               trnNew.SelectedIndex := 3;
               end;

           qryGroup5.Next;
           end;
         qryGroup5.Close;
         end
       else
       {Кликнули на ОС-е}
         begin
         qryOS.Close;
         qryOS.ParamByName('COO').AsInteger := ptrReadData^;
         qryOS.Open;
         end;
       end; {3}

    4: begin
       ptrReadData := Node.Data;

       if ptrReadData^ = 0 then
       {Кликнули на папке}
         begin
         qryOS.Close;
         if Node.HasChildren then Exit;

         qryGroup6.Close;
         if chbAll.Checked then
           qryGroup6.ParamByName('FO').Clear
         else
           qryGroup6.ParamByName('FO').AsInteger := qryFilialFrom_Oil.AsInteger;
         if cmbDateEnd.ItemIndex = 0 then
           qryGroup6.ParamByName('DateEnd').AsInteger := 1
         else
           qryGroup6.ParamByName('DateEnd').AsInteger := 0;
         qryGroup6.ParamByName('G1').AsString := Node.Parent.Parent.Parent.Parent.Text;
         qryGroup6.ParamByName('G2').AsString := Node.Parent.Parent.Parent.Text;
         qryGroup6.ParamByName('G3').AsString := Node.Parent.Parent.Text;
         qryGroup6.ParamByName('G4').AsString := Node.Parent.Text;
         qryGroup6.ParamByName('G5').AsString := Node.Text;
         qryGroup6.Open;

         while not qryGroup6.EOF do
           begin
           New(ptrNewData); {Выделяем память}
           ptrNewData^ := qryGroup6CodOilOS.AsInteger;

           trnNew := trvOS.Items.AddChild(Node, qryGroup6Name.AsString);
           trnNew.Data := ptrNewData;
           if qryGroup6CodOilOS.AsInteger = 0 then
             begin
             trnNew.ImageIndex := 0;
             trnNew.SelectedIndex := 0;
             end
           else
             if qryGroup6Date_End.IsNull then
               begin
               trnNew.ImageIndex := 2;
               trnNew.SelectedIndex := 2;
               end
             else
               begin
               trnNew.ImageIndex := 3;
               trnNew.SelectedIndex := 3;
               end;

           qryGroup6.Next;
           end;
         qryGroup6.Close;
         end
       else
       {Кликнули на ОС-е}
         begin
         qryOS.Close;
         qryOS.ParamByName('COO').AsInteger := ptrReadData^;
         qryOS.Open;
         end;
       end; {4}

    5: begin
       ptrReadData := Node.Data;

       qryOS.Close;
       qryOS.ParamByName('COO').AsInteger := ptrReadData^;
       qryOS.Open;
       end; {5}

  end; {case}
end;

procedure TfrmOS.trvOSExpanded(Sender: TObject; Node: TTreeNode);
begin
  Node.ImageIndex := 1;
  Node.SelectedIndex := 1;
end;

procedure TfrmOS.trvOSCollapsed(Sender: TObject; Node: TTreeNode);
begin
  Node.ImageIndex := 0;
  Node.SelectedIndex := 0;
end;

procedure TfrmOS.chbAllClick(Sender: TObject);
var
  trnNew: TTreeNode;
  ptrNewData: PCodOilOS;
begin
  dlcFilial.Enabled := not chbAll.Checked;

  trvOS.Items.Clear;
  qryOS.Close;

  qryGroup1.Close;
  if chbAll.Checked then
    qryGroup1.ParamByName('FO').Clear
  else
    qryGroup1.ParamByName('FO').AsInteger := qryFilialFrom_Oil.AsInteger;
  if cmbDateEnd.ItemIndex = 0 then
    qryGroup1.ParamByName('DateEnd').AsInteger := 1
  else
    qryGroup1.ParamByName('DateEnd').AsInteger := 0;
  qryGroup1.Open;

  while not qryGroup1.EOF do
  begin
    New(ptrNewData); {Выделяем память}
    ptrNewData^ := qryGroup1CodOilOS.AsInteger;

    trnNew := trvOS.Items.Add(nil, qryGroup1Group1.AsString);
    trnNew.Data := ptrNewData;
    if qryGroup1CodOilOS.AsInteger = 0 then
    begin
      trnNew.ImageIndex := 0;
      trnNew.SelectedIndex := 0;
    end
    else begin
      trnNew.ImageIndex := 2;
      trnNew.SelectedIndex := 2;
    end;

    qryGroup1.Next;
  end; {while}
  qryGroup1.Close;
end;

procedure TfrmOS.actSearchExecute(Sender: TObject);
var
  hStatic: HWND;
  pchCaption: PChar;
begin
  blnFind := False;
  fidSearch.Execute;

  {Меняем caption static-а в диалоге}
  hStatic := FindWindowEx(fidSearch.Handle, 0, 'STATIC', Nil);
  pchCaption := StrNew(PChar(TranslateText('Название:')));
  SendMessage(hStatic, WM_SETTEXT, 0, lParam(pchCaption));
  StrDispose(pchCaption);
end;

procedure TfrmOS.fidSearchFind(Sender: TObject);
var
  trnCur: TTreeNode;
  strSearch: String;
begin
  qryOS.DisableControls;
  strSearch := fidSearch.FindText;

  if blnFind then
  {Если продолжение поиска}
  begin
    trnCur := trvOS.Selected;
    trnCur := trnCur.GetNext;
  end
  else
    trnCur := trvOS.Items.GetFirstNode;

  {Перебираем все ноды}
  trvOS.Items.BeginUpdate;
  while trnCur <> nil do
  begin
    trnCur.Selected := True;
    if Pos(AnsiUpperCase(strSearch), AnsiUpperCase(trnCur.Text)) > 0 then
    begin
      trvOS.Items.EndUpdate;
      trnCur.MakeVisible;
      qryOS.EnableControls;
      blnFind := True;
      Exit;
    end;

    Application.ProcessMessages;
    trnCur := trnCur.GetNext;
  end;
  trvOS.Items.EndUpdate;

  if blnFind then
    ShowMessage(TranslateText('Поиск завершен.'))
  else
    ShowMessage(TranslateText('Ничего не найдено.'));

  qryOS.EnableControls;
end;

procedure TfrmOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
