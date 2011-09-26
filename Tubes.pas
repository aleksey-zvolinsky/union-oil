unit Tubes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CADSys4, CS4BaseTypes, CS4Tasks, CS4Shapes, CS4DXFModule, ComCtrls, ToolWin,
  ImgList, ActnList, ExtCtrls, ColorGrd, StdCtrls, SpeedBar, PicClip, Menus,
  Printers, Spin, Buttons, Grids, Tabnotbk, DB, DBAccess, Ora, RxCombos,
  Mask, DBCtrlsEh, uHelpButton, DBLookupEh, DBCtrls, ToolEdit, CurrEdit,
  CheckLst, RxLookup, DBGridEh, GridsEh, MemDS, RXCtrls, PrnDbgeh,TubeAct,
  DBGridEhGrouping,uCommonForm;

type
  TTubesForm = class(TForm)
    LocalView: TCADViewport2D;
    LocalCAD: TCADCmp2D;
    LocalPrg: TCADPrg2D;
    ImageList1: TImageList;
    pcTubes: TPageControl;
    tsTubes: TTabSheet;
    tsDet: TTabSheet;
    qTubes: TOraQuery;
    qTubesID: TFloatField;
    qTubesLAYER_NAME: TStringField;
    dslisttubes: TOraDataSource;
    qTubesTANK_REST: TFloatField;
    qTubesCOLOR: TStringField;
    qTubesNAME_NP: TStringField;
    qTubesNOTES: TStringField;
    qTubesCOMMENT_: TStringField;
    qTubesMAX_VOLUME: TFloatField;
    pnlChoose: TPanel;
    qTubesLAYER_NAME_CAD: TStringField;
    Panel6: TPanel;
    grTubes: TDBGridEh;
    SplitterDetail: TSplitter;
    grTubesRef: TDBGridEh;
    Panel7: TPanel;
    PAdd: TPanel;
    PEdit: TPanel;
    sbEdit: TSpeedButton;
    pDel: TPanel;
    sbDel: TSpeedButton;
    pSearch: TPanel;
    bbClear: TBitBtn;
    bbSearch: TBitBtn;
    pPrint: TPanel;
    spbPrint: TRxSpeedButton;
    Panel2: TPanel;
    Label2: TLabel;
    Label7: TLabel;
    deBeginDate: TDateEdit;
    deEndDate: TDateEdit;
    pnlHideFilter: TPanel;
    pnlTuneGridBtn: TPanel;
    qTubesRef: TOraQuery;
    dsTebesRef: TOraDataSource;  
    gbChoosePos: TGroupBox;
    grLayers: TDBGridEh;
    qTubesRefDATE_CHANGE: TDateTimeField;
    qTubesDATE_CHANGE: TDateTimeField;
    qTubesNAME_RUS: TStringField;
    pmAdd: TPopupMenu;
    miLastAct: TMenuItem;
    miNewAct: TMenuItem;
    RxSpeedButton1: TRxSpeedButton;
    il: TImageList;
    qTubesRefACT_NUM: TFloatField;
    qTubesACT_NUM: TFloatField;
    qTubesLAYER_NAME_CAD_EXIST: TStringField;
    rgNpType: TRadioGroup;
    GroupBox1: TGroupBox;
    lblStatFill: TLabel;
    lbRest: TLabel;
    lblStatFree: TLabel;
    lbEmpty: TLabel;
    qTubesAct: TOraQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    FloatField3: TFloatField;
    StringField6: TStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    DateTimeField1: TDateTimeField;
    StringField7: TStringField;
    FloatField6: TFloatField;
    StringField8: TStringField;
    dslisttubesAct: TOraDataSource;
    qTubesActPIPELINE_VALVE: TStringField;
    qTubesSumTankRest: TFloatField;
    qTubesSumTankVal: TFloatField;
    qTubesSumActTankRest: TFloatField;
    qTubesSumActTankVal: TFloatField;
    procedure TotalCheckClick(Sender: TObject);
    procedure FormCreate(Sender: TObject); 
    procedure rgNpTypeClick(Sender: TObject);
    procedure grLayersCellClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure spbPrintClick(Sender: TObject);
    procedure spbRealZoomClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LocalViewMouseEnter(Sender: TObject);
    procedure grLayersGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure bbSearchClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure miLastActClick(Sender: TObject);
    procedure miNewActClick(Sender: TObject);
    procedure dsTebesRefDataChange(Sender: TObject; Field: TField);
    procedure LocalViewMouseMove2D(Sender: TObject; Shift: TShiftState; WX,
      WY: Single; X, Y: Integer);
    procedure LocalViewMouseDown2D(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; WX, WY: Single; X, Y: Integer);
    procedure LocalViewMouseUp2D(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; WX, WY: Single; X, Y: Integer);
    procedure sbDelClick(Sender: TObject);
    procedure pcTubesChange(Sender: TObject);
  private
    bMouseMove: boolean;
    iZoom: integer;
    TubeActForm: TTubeActForm;
    iXTemp, iYTemp: single;
    procedure WMMouseWheel(var Msg: TWMMouseWheel); message WM_MOUSEWHEEL;
    function FormatWeigth(AValue: Currency):string;
    function GetFuelId: integer;
    procedure SetFuelId(const Value: integer);
  public
    procedure ShowCurrLayer(L: Integer);
    procedure SetColorLayerFromTable(L: Integer);
    procedure SaveCurrLayerBD(L: Integer; Color: string);
    procedure ShowNpLayers(L: Integer);
    property FuelId: integer read GetFuelId write SetFuelId;
  end;

  TFlashThread = class(TThread)
  private
  public
    NLayer: integer;
    TubesForm: TTubesForm;
    procedure Execute; override;
    procedure ExecFirst;
    procedure ExecSecond;
    procedure ExecEnd;
  end;

var
  TubesForm: TTubesForm;
  bFromLastAct : boolean;

implementation

{$R *.dfm}

uses Main, OilStd, ExcelFunc, ExFunc, uDbFunc;



{ TFlashThread }

//==============================================================================
procedure TFlashThread.ExecEnd;
begin
  TubesForm.LocalCAD.Layers[NLayer].Pen.Width := 1;
  TubesForm.LocalView.Repaint;
end;
//==============================================================================
procedure TFlashThread.ExecFirst;
begin
  TubesForm.LocalCAD.Layers[NLayer].Pen.Color := clRed;
  TubesForm.LocalCAD.Layers[NLayer].Pen.Width := 4;
  TubesForm.LocalView.Repaint;
end;
//==============================================================================
procedure TFlashThread.ExecSecond;
begin
  TubesForm.SetColorLayerFromTable(NLayer);
  TubesForm.LocalView.Repaint;
end;
//==============================================================================
procedure TFlashThread.Execute();
var
  i: integer;
begin
  for i := 1 to 2 do
  begin
    Synchronize(ExecFirst);
    sleep(80);
    Synchronize(ExecSecond);
  end;
  Synchronize(ExecEnd);
  //TubesForm.ShowCurrLayer(NLayer);
end;

{ TTubesForm }

//==============================================================================
procedure TTubesForm.TotalCheckClick(Sender: TObject);
begin
  LocalView.ZoomToExtension;
end;
//==============================================================================
procedure TTubesForm.FormCreate(Sender: TObject);
var
  dxfR: TDXF2DImport;
  sFileName: string;
begin
  iZoom := 0;
  iXTemp:=0;
  sFileName := GetMainDir + 'Pattern\DNP_2004_TRUBA3.dxf';
  if not ((FileExists('Pattern\RomanC.fnt') and FileExists(sFileName))) then
  begin
    MessageDlg('В папку OIL\Pattern\ необходимо поместить файлы: RomanC.fnt, DNP_2004_TRUBA3.dxf!',
      mtWarning, [mbOK], 0);
    Self.Free;
    exit;
  end;

  CADSysInitFontList; // очищення списку фонтів
  CADSysRegisterFontFromFile(0, 'Pattern\RomanC.fnt');

  dxfR := TDXF2DImport.Create(sFileName, LocalCAD);
  with dxfR do
  try
    SetTextFont(CADSysFindFontByIndex(0));
    ReadDXF;
  finally
    Free;
  end;

  Screen.Cursor := crDefault;
  TotalCheckClick(Sender);
   // Цвет фона рисунка
  LocalView.BackGroundColor := clBlack;
  // заполнить цвета слоёв c 1 по 16 ( рамки надписи итп)
  // Слой трубы ( резервуары)
  LocalCAD.Layers[15].Pen.Color := clWhite;
  // Все слои трубы ( резервуары)
  LocalCAD.Layers[16].Pen.Color :=clWhite;
  // Слой 16 TRUBI
  LocalCAD.Layers[8].Pen.Color := clAqua;
  // 9- надписи
  LocalCAD.Layers[9].Pen.Color := clAqua;
  // рамка
  LocalCAD.Layers[10].Pen.Color := clWhite;
  // заглушки
  LocalCAD.Layers[1].Pen.Color := clWhite;
  deEndDate.Text := DateToStr(trunc(Now))
end;
//==============================================================================
// заполнить  цвета  слоёв из таблицы по выбранному акту
procedure TTubesForm.SetColorLayerFromTable(L: Integer);
var
  q: TOraQuery;
  sColor: string;
begin
  q := TOraQuery.Create(nil);
  if qTubesRefACT_NUM.AsInteger <> 0 then
    q.SQL.Text :=  'select t.color from tube_act t where state=''Y'' and act_num = '+
    qTubesRefACT_NUM.AsString + ' and layer_name_cad = '+IntToStr(L)
  else
  q.SQL.Text := 'select color from tube_act where state =''Y'' and layer_name_cad = ' + IntToStr(L);
    try
      q.Open;
      sColor := q.FieldByName('color').AsString;
      if sColor <> '' then
        LocalCAD.Layers[L].Pen.Color := StringToColor(sColor);
    finally
      q.Free;
    end;    
end;
//==============================================================================
procedure TTubesForm.ShowCurrLayer(L: Integer);
var
  i: integer;
begin
  for i := 1 to 2 do
  begin
    LocalCAD.Layers[L].Pen.Color := clred;
    LocalCAD.Layers[L].Pen.Width := 7;
    LocalView.Repaint;
    sleep(80);
    LocalView.Repaint;
    SetColorLayerFromTable(L);
    LocalView.Repaint;
  end;
  LocalCAD.Layers[L].Pen.Width := 1;
  LocalView.Repaint;
end;
//==============================================================================
procedure TTubesForm.SaveCurrLayerBD(L: Integer; Color: string);
var
  q: TOraQuery;
  iNP: Integer;
begin
  iNP := -1;
  q := TOraQuery.Create(nil);
  try
    q.Sql.Text := ' select count(*) as count from tube_act  ' +
      ' where layer_name = ' + IntToStr(L);
    q.Open;
    if q.FieldByName('count').AsInteger > 0 then
    begin
      q.Close;
      q.AutoCommit := TRUE;
      q.Sql.Text := ' update tube_act set color = ''' + Color +
        ''' where layer_name = ''' + IntToStr(L) + '''';
      q.Prepare;
      q.ExecSQL;

      if Color = 'clRed' then
        iNP := 5
      else if Color = 'clGreen' then
        iNP := 4
      else if Color = 'clYellow' then
        iNP := 48
      else if Color = 'clBlue' then
        iNP := 46
      else if Color = 'clWhite' then
        iNP := 0
      else if Color = '$003E9EFF' then
        iNP := 178;

      q.Close;
      q.AutoCommit := TRUE;
      q.Sql.Text := ' update tube_act set np_id = ' + IntToStr(iNP) +
        ' where layer_name=''' + IntToStr(L) + '''';
      q.Prepare;
      q.ExecSQL;
    end;
  finally
    q.Free;
  end;
end;
//==============================================================================
procedure TTubesForm.rgNpTypeClick(Sender: TObject);
var
  i, iR, iV: integer;
begin
  qTubes.Close;
  for i := 0 to qTubesAct.Params.Count - 1 do   qTubesAct.Params[i].Clear;
  case rgNpType.ItemIndex of
    0:
      begin   
        qTubes.ParamByName('COLOR').AsString := '';
        qTubes.ParamByName('ACT_NUM').AsInteger := qTubesRefACT_NUM.AsInteger;
      end;
    1:
      begin
        qTubes.ParamByName('COLOR').AsString := 'clYellow';
        qTubes.ParamByName('ACT_NUM').AsInteger := qTubesRefACT_NUM.AsInteger;
      end;
    2:
      begin
        qTubes.ParamByName('COLOR').AsString := 'clGreen';
        qTubes.ParamByName('ACT_NUM').AsInteger := qTubesRefACT_NUM.AsInteger;
      end;
    3:
      begin
        qTubes.ParamByName('COLOR').AsString := 'clRed';
        qTubes.ParamByName('ACT_NUM').AsInteger := qTubesRefACT_NUM.AsInteger;
      end;
    4:
      begin
        qTubes.ParamByName('COLOR').AsString := 'clBlue';
        qTubes.ParamByName('ACT_NUM').AsInteger := qTubesRefACT_NUM.AsInteger;
      end;
    5:
      begin
        qTubes.ParamByName('COLOR').AsString := '$003E9EFF';
        qTubes.ParamByName('ACT_NUM').AsInteger := qTubesRefACT_NUM.AsInteger;
      end;
    6:
      begin
        qTubes.ParamByName('COLOR').AsString := 'clWhite';
        qTubes.ParamByName('ACT_NUM').AsInteger := qTubesRefACT_NUM.AsInteger;
      end;
  end;
  qTubes.Open;
  ShowNpLayers(rgNpType.ItemIndex);
  qTubes.Refresh;
  iR := qTubes.FieldByName('SumActTankRest').AsInteger; //grTubes.DataSource.DataSet.FieldByName('tank_rest_np').AsInteger;
  iV := qTubes.FieldByName('SumActTankVal').AsInteger;//grTubes.DataSource.DataSet.FieldByName('max_volume_np').AsInteger;
  if iV=0 then
  begin
    lbRest.Caption := FormatWeigth(iR)+ ' ('+ FloatToStr(MRound(100 * iR /1,0))+ '%)';
    lbEmpty.Caption := FormatWeigth(iV-iR) + ' ('+ FloatToStr(MRound(100-100 * iR /1,0))+ '%)';
  end
  else
  begin
    lbRest.Caption := FormatWeigth(iR)+ ' ('+ FloatToStr(MRound(100 * iR /iV,0))+ '%)';
    lbEmpty.Caption := FormatWeigth(iV-iR) + ' ('+ FloatToStr(MRound(100-100 * iR /iV,0))+ '%)';
  end;
end;
//==============================================================================
procedure TTubesForm.grLayersCellClick(Column: TColumnEh);
var
  F: TFlashThread;
begin
  F := TFlashThread.Create(True);
  F.FreeOnTerminate := True;
  F.NLayer:= grLayers.DataSource.DataSet.FieldByName('layer_name_cad').AsInteger;
  F.TubesForm := Self;
  F.Resume;
end;
//==============================================================================
procedure TTubesForm.FormShow(Sender: TObject);
begin
  pcTubes.ActivePage := tsTubes;
  LocalView.ZoomInExt(3);
  LocalView.MoveWindow(0, 0);
  qTubesRefACT_NUM.AsInteger;
  qTubesRef.Open;
  qTubesRef.Last;
  rgNpTypeClick(nil); 
end;
//==============================================================================
procedure TTubesForm.spbPrintClick(Sender: TObject);
var
  XLApp, List: Variant;
  SumLitr, i, k, n: Integer;
  P: array[0..5] of string;
begin
  SumLitr:=0;
  n:=13;
  k:=n;
  P[0]:='clRed';
  P[1]:='clGreen';
  P[2]:='clYelow';
  P[3]:='clBlue';
  P[4]:='$003E9EFF';
  //Открываем эксель
  ActivateXLApp('TubesRep','TubesRep',1,XLApp,List);
  List:=XLApp.ActiveWorkbook.WorkSheets[1];
  qTubes.DisableControls;
  StateExcel(XLApp,false);
  for i:=0 to 4 do
   begin
    // фильтр по типу НП 95
     qTubes.ParamByName('color').AsString:=P[i];
     qTubes.Refresh;
     n:=PuTOilQueryToExcelEnh(XLApp,List,qTubes,n,nil,0,
     'layer_name;tank_rest;max_volume;notes;comment_','',PROMITOGI_NO);
     qTubes.First;
    while not(qTubes.eof)do
      begin
        SumLitr := SumLitr + qTubes.FieldByName('tank_rest').AsInteger;
        qTubes.Next;
      end;
    // Сумма и тип НП
      List.Cells[k-2,'A'].Font.Bold:=TRUE;
      List.Cells[k-2,'A'] := qTubes.FieldByName('name_np').AsString;
      List.Cells[n-2,'C'] := SumLitr;
      n:= n+2;
      k:=n;
  end;
        StateExcel(XLApp,true);
    //   XLApp.Run('',10,1);
   //  DrawNetInExcel(List,1,7,10,6);  
     qTubes.EnableControls;
end;
//==============================================================================
procedure TTubesForm.ShowNpLayers(L: Integer);
var
  iCount: Integer;
begin
  // заполнить   слои c таблицы цвет clBlack
  for iCount := 17 to 255 do
    LocalCAD.Layers[iCount].Pen.Color := clBlack;  
  if L = 0 then
  begin
    qTubes.First;
    while not qTubes.Eof do
    begin
      SetColorLayerFromTable(qTubes.FieldByName('layer_name_cad').AsInteger);
      qTubes.Next;
    end;
  end;
  if L = 1 then
  begin 
    qTubes.First;
    while not qTubes.Eof do
    begin
      SetColorLayerFromTable(qTubes.FieldByName('layer_name_cad').AsInteger);
      qTubes.Next;
    end;
  end;
  if L = 2 then
  begin
    qTubes.First;
    while not qTubes.Eof do
    begin
      SetColorLayerFromTable(qTubes.FieldByName('layer_name_cad').AsInteger);
      qTubes.Next;
    end;
  end;
  if L = 3 then
  begin
    qTubes.First;
    while not qTubes.Eof do
    begin
      SetColorLayerFromTable(qTubes.FieldByName('layer_name_cad').AsInteger);
      qTubes.Next;
    end;
  end;
  if L = 4 then
  begin
    qTubes.First;
    while not qTubes.Eof do
    begin
      SetColorLayerFromTable(qTubes.FieldByName('layer_name_cad').AsInteger);
      qTubes.Next;
    end;
  end;
  if L = 5 then
  begin
    qTubes.First;
    while not qTubes.Eof do
    begin
      SetColorLayerFromTable(qTubes.FieldByName('layer_name_cad').AsInteger);
      qTubes.Next;
    end;
  end;
  if L = 6 then
  begin
    qTubes.First;
    while not qTubes.Eof do
    begin
      SetColorLayerFromTable(qTubes.FieldByName('layer_name_cad').AsInteger);
      qTubes.Next;
    end;
  end;
  qTubes.First;
  qTubes.EnableControls;
  LocalView.Repaint;
end;
//==============================================================================
procedure TTubesForm.spbRealZoomClick(Sender: TObject);
begin
  LocalPrg.ViewAction := TCADActionMode(tamRealZoom);
end;
//==============================================================================
procedure TTubesForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then
    Action := caFree;
end;
//==============================================================================
procedure TTubesForm.WMMouseWheel(var Msg: TWMMouseWheel);
begin
  if Msg.WheelDelta > 0 then
  begin
    LocalView.ZoomInExt(15);
    iZoom := iZoom + 15;
  end
  else
  begin
    LocalView.ZoomOutExt(15);
    iZoom := iZoom - 15;
  end;
end;
//==============================================================================
procedure TTubesForm.LocalViewMouseEnter(Sender: TObject);
begin
  LocalPrg.ViewAction := TCADActionMode(tamPan);
  LocalView.SetFocus;
end;
//==============================================================================
function TTubesForm.FormatWeigth(AValue: Currency): string;
var
  fs: TFormatSettings;
begin
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, fs);
  fs.ThousandSeparator := ' ';
  fs.CurrencyString := 'кг.';
  fs.CurrencyDecimals := 0;
  Result := Format('%m',[AValue],fs);
end;
//==============================================================================
procedure TTubesForm.grLayersGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if grLayers.DataSource.DataSet.FieldByName('LAYER_NAME_CAD_EXIST').AsString = 'N' then
    Background := clGray
  else
    Background := clWindow;
end;
//==============================================================================
procedure TTubesForm.bbSearchClick(Sender: TObject);
begin
  qTubesRef.Close;
  qTubesRef.ParamByName('date_begin').AsDateTime := deBeginDate.Date;
  qTubesRef.ParamByName('date_end').AsDateTime := deEndDate.Date;
  qTubesRef.Open;
end;
//==============================================================================
procedure TTubesForm.sbEditClick(Sender: TObject);
var
  bm: TBookMark;
begin
  try
    BM := grTubesRef.DataSource.DataSet.GetBookmark;
    TubeActForm := TTubeActForm.Create(self);
    TubeActForm.bNewAct := False;
    TubeActForm.qTube.ParamByName('date_end').AsDateTime := grTubesRef.DataSource.DataSet.FieldByName('date_change').AsDateTime;
    TubeActForm.qTube.ParamByName('date_begin').AsDateTime := grTubesRef.DataSource.DataSet.FieldByName('date_change').AsDateTime;
    if qTubesRef.IsEmpty then
      exit;
    if TTubeActForm.Edit(qTubesRef['act_num'],qTubesRef['act_num']) then bbSearch.Click;
      grTubesRef.DataSource.DataSet.GotoBookMark(BM);
      grTubesRef.DataSource.DataSet.FreeBookMark(BM);
  except on E: Exception do
    begin
      ShowMessage(E.Message);
      bbSearchClick(nil);
    end;
  end;
end;
//==============================================================================
procedure TTubesForm.miNewActClick(Sender: TObject);
var
  bm:TBookMark;
begin
  try
    BM:=grTubesRef.DataSource.DataSet.GetBookmark;
    bFromLastAct:=false;
    if qTubesRef.IsEmpty then exit;
    if TTubeActForm.Edit(0,0) then
      bbSearch.Click;
    grTubesRef.DataSource.DataSet.GotoBookMark(BM);
    grTubesRef.DataSource.DataSet.FreeBookMark(BM);
  except on E: Exception do
    begin
      ShowMessage(E.Message);
      bbSearchClick(nil);
    end;
  end;
end;
//==============================================================================
procedure TTubesForm.miLastActClick(Sender: TObject);
var
  bm:TBookMark;
  actNum: Integer;
begin
  try
    BM:=grTubesRef.DataSource.DataSet.GetBookmark;
    bFromLastAct:=true;
    if qTubesRef.IsEmpty then exit;
    actNum:= GetSqlValue('select max(t.act_num) from tube_act t where t.state=''Y'' ');
     if TTubeActForm.Edit(actNum,0) then
      bbSearch.Click;
    grTubesRef.DataSource.DataSet.GotoBookMark(BM);
    grTubesRef.DataSource.DataSet.FreeBookMark(BM);
  except on E: Exception do
    begin
      ShowMessage(E.Message);
      bbSearchClick(nil);
    end;
  end;
end;
//==============================================================================
procedure TTubesForm.dsTebesRefDataChange(Sender: TObject; Field: TField);
var
  i: integer;
begin
  qTubesAct.Close;
  for i := 0 to qTubesAct.Params.Count - 1 do
    qTubesAct.Params[i].Clear;
  qTubesAct.ParamByName('act_num').AsInteger := qTubesRef.FieldByName('act_num').AsInteger;
  qTubesAct.Open;
end;
//==============================================================================
function TTubesForm.GetFuelId: integer;
begin
  case rgNpType.ItemIndex of
    0:
      Result := 0;
    1:
      Result := 5;
    2:
      Result := 6;
    3:
      Result := 7;
    4:
      Result := 3;
    5:
      Result := 9;
    else
      Result := 0;
  end;
end;
//==============================================================================
procedure TTubesForm.SetFuelId(const Value: integer);
begin
  case Value of
    0:
      rgNpType.ItemIndex := 0;
    4,5:
      rgNpType.ItemIndex := 1;
    6:
      rgNpType.ItemIndex := 2;
    7:
      rgNpType.ItemIndex := 3;
    3:
      rgNpType.ItemIndex := 4;
    9,-22,-23:
      rgNpType.ItemIndex := 5;
    else
      rgNpType.ItemIndex := 0;
  end;
  rgNpTypeClick(nil);
{
Все
A-80
А-92
А-95
ДТ
Прочее
Пусто }

end;
//==============================================================================
procedure TTubesForm.LocalViewMouseMove2D(Sender: TObject;
  Shift: TShiftState; WX, WY: Single; X, Y: Integer);
var
  R: TRect2d;
  iCentrum: integer;
begin
 {
  if bMouseMove then
  begin
    if iXTemp = 0 then
      iXTemp := X
    else
      if iXTemp <> X then
      begin
        iXTemp := iXTemp - X;
        LocalView.MoveWindow(iXTemp, 0);
        iXTemp := 0;
      end
      else
       iXTemp := 0;
  end;
 }
if bMouseMove then
  begin
   // iXTemp:= (LocalView.VisualRect.Right - LocalView.VisualRect.Left)/ 2 + LocalView.VisualRect.Left;
   // iXTemp:= LocalView.VisualRect.Left +1080;
   // LocalView.MoveWindow(-X + iXTemp, 0);
  end; 
end;
//==============================================================================
procedure TTubesForm.LocalViewMouseDown2D(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; WX, WY: Single; X, Y: Integer);
begin
  bMouseMove := true;
end;
//==============================================================================
procedure TTubesForm.LocalViewMouseUp2D(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; WX, WY: Single; X, Y: Integer);
begin
  bMouseMove := false;
end;
//==============================================================================
procedure TTubesForm.sbDelClick(Sender: TObject);
var
  q: TOraQuery;
begin
  if qTubesAct.IsEmpty then exit;
  If MessageDlg(TranslateText('Вы уверены что хотите удалить Акт №')+
     qTubesAct.ParamByName('act_num').AsString + ' ?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    Try
      q := TOraQuery.Create(nil);
      q.AutoCommit := TRUE;
      q.SQL.Text := ' update tube_act t set t.state = ''N'' where t.act_num = :act ';
      q.Prepare;
      q.ParamByName('act').AsInteger := qTubesAct.ParamByName('act_num').AsInteger ;
      q.ExecSql;
      CommitSQLOra;
      q.Free;
    Except On E:Exception Do
      begin
        RollbackSQL;
        MessageDlg(TranslateText('Ошибка : ')+E.message,mtError,[mbOk],0);
      end;
    end;
    qTubesAct.Refresh;
    bbSearchClick(nil);
end;
//==============================================================================
procedure TTubesForm.pcTubesChange(Sender: TObject);
begin
  rgNpTypeClick(nil);
end;

end.
