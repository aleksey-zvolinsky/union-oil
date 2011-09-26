unit uMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CADSys4, CS4BaseTypes, CS4Tasks, CS4Shapes, CS4DXFModule, ComCtrls, ToolWin,
  ImgList, ActnList, ExtCtrls, ColorGrd, StdCtrls, SpeedBar, PicClip, Menus,
  Printers, Spin, Buttons, Grids, Tabnotbk, DB, DBAccess, Ora;

type

  TActionMode = (tamNone,tamPan,tamZoom,tamSearch,tamPointMove,tmaAtemel,
                 tamDel,tamIns,tamAdd);

  TViewForm = class(TForm)
    ActionList1: TActionList;
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    OpenDlg: TOpenDialog;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    PicClip1: TPicClip;
    ImageList1: TImageList;
    SpeedItem1: TSpeedItem;
    SpeedItem2: TSpeedItem;
    SpeedItem3: TSpeedItem;
    SpeedItem4: TSpeedItem;
    SpeedbarSection2: TSpeedbarSection;
    TotalItem: TSpeedItem;
    NagyitItem: TSpeedItem;
    VonszolItem: TSpeedItem;
    ColorGrid1: TColorGrid;
    SpeedbarSection3: TSpeedbarSection;
    HalozatItem: TSpeedItem;
    KeresztItem: TSpeedItem;
    TotalCheck: TCheckBox;
    LocalPopUp: TPopupMenu;
    Accept1: TMenuItem;
    Cancel1: TMenuItem;
    N1: TMenuItem;
    Zoomarea1: TMenuItem;
    Zoomin1: TMenuItem;
    Zoomout1: TMenuItem;
    Zoomall1: TMenuItem;
    Panning1: TMenuItem;
    Setpoint1: TMenuItem;
    N2: TMenuItem;
    Showgrid1: TMenuItem;
    Keepaspect1: TMenuItem;
    Usesnap1: TMenuItem;
    Useorto1: TMenuItem;
    Useareatoselectobjects1: TMenuItem;
    Test1: TMenuItem;
    PrintDialog1: TPrintDialog;
    SpeedItem5: TSpeedItem;
    RetegPanel: TPanel;
    XYPanel: TPanel;
    ActionCombo: TComboBox;
    TabbedNotebook1: TTabbedNotebook;
    LayersList: TListBox;
    Label3: TLabel;
    NameEdt: TEdit;
    Label4: TLabel;
    PenColorGrid: TColorGrid;
    Label7: TLabel;
    BrushColorGrid: TColorGrid;
    Label6: TLabel;
    ActiveLayerCBox: TComboBox;
    OKBtn: TBitBtn;
    VisibleChk: TCheckBox;
    ActiveChk: TCheckBox;
    TransparentChk: TCheckBox;
    PenSizeEdt: TSpinEdit;
    Label5: TLabel;
    StringGrid1: TStringGrid;
    SpeedItem6: TSpeedItem;
    SpeedbarSection4: TSpeedbarSection;
    TampontMoveBtn: TSpeedItem;
    ToolBtn: TSpeedItem;
    LineBtn: TSpeedItem;
    RectBtn: TSpeedItem;
    SpeedItem11: TSpeedItem;
    TextPopup: TPopupMenu;
    Left1: TMenuItem;
    Right1: TMenuItem;
    Center1: TMenuItem;
    FillRectBtn: TSpeedItem;
    FillPoliBtn: TSpeedItem;
    FillEllipseBtn: TSpeedItem;
    MozgatBtn: TSpeedItem;
    ForgatBtn: TSpeedItem;
    BSplineBtn: TSpeedItem;
    DelBtn: TSpeedItem;
    InsBtn: TSpeedItem;
    AddBtn: TSpeedItem;
    SpeedItem7: TSpeedItem;
    SpinEdit1: TSpinEdit;
    SpeedItem9: TSpeedItem;
    LocalCAD: TCADCmp2D;
    LocalPrg: TCADPrg2D;
    LocalView: TCADViewport2D;
    SpeedItem12: TSpeedItem;
    btnLoadColors: TButton;
    Button2: TButton;
    OraSessionMudryk: TOraSession;
    procedure LocalCADLoadProgress(Sender: TObject; ReadPercent: Byte);
    procedure ToolButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ColorGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure VonszolItemClick(Sender: TObject);
    procedure NagyitItemClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Accept1Click(Sender: TObject);
    procedure Cancel1Click(Sender: TObject);
    procedure Zoomarea1Click(Sender: TObject);
    procedure Zoomin1Click(Sender: TObject);
    procedure Zoomout1Click(Sender: TObject);
    procedure Zoomall1Click(Sender: TObject);
    procedure Panning1Click(Sender: TObject);
    procedure Showgrid1Click(Sender: TObject);
    procedure Keepaspect1Click(Sender: TObject);
    procedure SpeedItem1Click(Sender: TObject);
    procedure KeresztItemClick(Sender: TObject);
    procedure SpeedItem3Click(Sender: TObject);
    procedure SpeedItem4Click(Sender: TObject);
    procedure SpeedItem5Click(Sender: TObject);
    procedure RetegPanelEnter(Sender: TObject);
    procedure LayersListClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure LocalViewMouseDown2D(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; WX, WY: Single; X, Y: Integer);
    procedure TotalItemClick(Sender: TObject);
    procedure LocalViewMouseMove2D(Sender: TObject; Shift: TShiftState; WX,
      WY: Single; X, Y: Integer);
    procedure LocalViewDblClick(Sender: TObject);
    procedure ActionComboClick(Sender: TObject);
    procedure SpeedItem6Click(Sender: TObject);
    procedure TampontMoveBtnClick(Sender: TObject);
    procedure ToolBtnClick(Sender: TObject);
    procedure LineBtnClick(Sender: TObject);
    procedure RectBtnClick(Sender: TObject);  
    procedure SpeedItem11Click(Sender: TObject);
    procedure FillRectBtnClick(Sender: TObject);
    procedure FillPoliBtnClick(Sender: TObject);
    procedure FillEllipseBtnClick(Sender: TObject);
    procedure MozgatBtnClick(Sender: TObject);
    procedure ForgatBtnClick(Sender: TObject);
    procedure BSplineBtnClick(Sender: TObject);
    procedure TabbedNotebook1Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure SpeedItem7Click(Sender: TObject);
    procedure TotalCheckClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure InsBtnClick(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpeedItem9Click(Sender: TObject);
    procedure btnLoadColorsClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    focim    : string;
    oldIndex : integer;
    TmpPar   : TCADPrgParam;
    FAction  : TActionMode;
    procedure SetAction(Value:TActionMode);
  public
    procedure SaveCurrLayer(L: Integer);
    procedure SetCurrLayer(L: Integer);
    procedure OnSelectedObj(Sender: TCAD2DSelectObjectsParam; Obj: TObject2D; CtrlPt: Integer; Added: Boolean);
    function OnEvent(Event:  TCADPrgEvent; MouseButton: TCS4MouseButton; Shift: TShiftState; Key: Word;
                                        var NextState: TCADStateClass): Boolean;
    property Action  : TActionMode read FAction write SetAction;
  end;

var
  ViewForm: TViewForm;
  OffC: TDecorativeCanvas;

procedure InitInfoGrid(gr:TStringGrid);
procedure SpellInfoGrid(gr:TStringGrid;TmpObj: TObject2D);

implementation

{$R *.DFM}

uses  uTank;

procedure TViewForm.SetAction(Value:TActionMode);
begin
  FAction := Value;
  If LocalPrg.IsBusy then LocalPrg.StopOperation;
  ActionCombo.ItemIndex := Ord(Value);
  ActionCombo.Text := ActionCombo.Items[Ord(Value)];
  If (Value=tamSearch) and not (TabbedNotebook1.Visible) then
     With TabbedNotebook1 do begin
          PageIndex:=2;
          Visible:=True;
     end;
end;

procedure TViewForm.LocalCADLoadProgress(Sender: TObject; ReadPercent: Byte);
begin
(*  With ProgressBar1 do begin
    If (ReadPercent mod 2)=0 then Position := ReadPercent;
    ProgressBar1.Update;
  end;*)
end;

procedure TViewForm.ToolButton2Click(Sender: TObject);
var ext: string;
    dxfR : TDXF2DImport;
begin
  With OpenDlg do begin
       Filterindex:=1;
       Filename:='*.dxf;*.trk;*.cs2';
  if Execute then
  Try
     Screen.Cursor:=crHourGlass;
     Refresh;
     ext:=UpperCase(ExtractFileExt(Filename));
     ProgressBar1.Visible:=True;
     SpeedBar1.Enabled:=False;
  If ext = '.CS2' then
     LocalCAD.LoadFromFile(FileName);
  If ext = '.DXF' then begin
     dxfR := TDXF2DImport.Create(FileName, LocalCAD);
     with dxfR do
     try
//       dxfR.LayerList
//      DXFRead.PositionBar:=ProgressBar1;
      SetTextFont(CADSysFindFontByIndex(0));
      ReadDXF;
      TotalCheckClick(Sender);
      Caption := focim + ' ['+Filename+']';
     finally
      Free;
     end;
  end;
  If ext = '.TRK' then begin
      If not StMapLoad(FileName,'', LocalCAD) then
         ShowMessage('StellaMAP térképfile betöltése sikertelen!');
  end;
  If ext = '.RTG' then begin
      If not MapLayerLoad(FileName, LocalCAD) then
         ShowMessage('Rétegfile betöltése sikertelen!');
  end;
  If ext = '.PT' then begin
      If not StITRLoad(FileName, LocalCAD) then
         ShowMessage('StellaMAP térképfile betöltése sikertelen!');
  end;
  Finally
     ProgressBar1.Visible:=False;
     SpeedBar1.Enabled:=True;
     TotalCheckClick(Sender);
     Screen.Cursor:=crDefault;
  end;
  end;
end;

procedure TViewForm.FormCreate(Sender: TObject);
begin
  focim:=Caption;
//  OffC := TDecorativeCanvas.Create(canv);
//  LocalView.OffScreenCanvas:=TDecorativeCanvas.Create(canv);
end;

procedure TViewForm.ColorGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  LocalView.GridColor := ColorGrid1.ForeGroundColor;
  LocalView.BackGroundColor := ColorGrid1.BackGroundColor;
end;

procedure TViewForm.VonszolItemClick(Sender: TObject);
begin
  with LocalPrg do begin
   Action := tamPan;
   SendUserEvent(CADPRG_ACCEPT);
   SuspendOperation(TCADPrgRealTimePan, nil);
  end;
end;

procedure TViewForm.NagyitItemClick(Sender: TObject);
begin
  with LocalPrg do begin
   Action := tamZoom;
   SendUserEvent(CADPRG_ACCEPT);
   CurrentOperation := TCADPrgZoomArea;
   SuspendOperation(TCADPrgZoomArea, nil);
  end;
end;

procedure TViewForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
  VK_ADD      : Zoomin1Click(SENDER);
  VK_SUBTRACT : ZoomOut1Click(SENDER);
  VK_ESCAPE   : Cancel1Click(SENDER);
  VK_RETURN   : Accept1Click(SENDER);
  end;
end;

procedure TViewForm.Accept1Click(Sender: TObject);
begin
  with LocalPrg do
   begin
     SendUserEvent(CADPRG_ACCEPT);
   end;
end;

procedure TViewForm.Cancel1Click(Sender: TObject);
begin
  with LocalPrg do
   begin
     SendUserEvent(CADPRG_CANCEL);
     StopOperation;
   end;
end;

procedure TViewForm.Zoomarea1Click(Sender: TObject);
begin
  with LocalPrg do
   SuspendOperation(TCADPrgZoomArea, nil);
end;

procedure TViewForm.Zoomin1Click(Sender: TObject);
begin
  LocalPrg.SendUserEvent(CADPRG_ACCEPT);
  LocalView.ZoomIn;
end;

procedure TViewForm.Zoomout1Click(Sender: TObject);
begin
  LocalPrg.SendUserEvent(CADPRG_ACCEPT);
  LocalView.ZoomOut;
end;

procedure TViewForm.Zoomall1Click(Sender: TObject);
begin
  LocalView.ZoomToExtension;
end;

procedure TViewForm.Panning1Click(Sender: TObject);
begin
  with LocalPrg do
   SuspendOperation(TCADPrgRealTimePan, nil);
end;

procedure TViewForm.Showgrid1Click(Sender: TObject);
begin
  Showgrid1.Checked  := not Showgrid1.Checked;
  HalozatItem.Down   := Showgrid1.Checked;
  LocalView.ShowGrid := Showgrid1.Checked;
end;

procedure TViewForm.Keepaspect1Click(Sender: TObject);
begin
  Keepaspect1.Checked := not Keepaspect1.Checked;
  if Keepaspect1.Checked then
   LocalView.AspectRatio := 1.0
  else
   LocalView.AspectRatio := 0.0;
  LocalView.ZoomWindow(LocalView.VisualRect);
end;

procedure TViewForm.SpeedItem1Click(Sender: TObject);
begin
  LocalCAD.DeleteAllObjects;
  LocalCAD.DeleteSavedSourceBlocks;
  LocalCAD.RepaintViewports;
end;

procedure TViewForm.KeresztItemClick(Sender: TObject);
begin
  LocalPrg.ShowCursorCross := not LocalPrg.ShowCursorCross;
  KeresztItem.Down := LocalPrg.ShowCursorCross;
end;

procedure TViewForm.SpeedItem3Click(Sender: TObject);
var ext: string;
begin
  if OpenDlg.Execute then begin
     ext:=UpperCase(ExtractFileExt(OpenDlg.Filename));
     If ext='.CS2' then LocalCAD.SaveToFile(OpenDlg.FileName);
     If ext='.TRK' then StMapSave(OpenDlg.Filename,LocalCAD);
  end;
end;

procedure TViewForm.SpeedItem4Click(Sender: TObject);
begin
  if PrintDialog1.Execute then
   begin
     Printer.BeginDoc;
     try
      LocalView.CopyToCanvas(Printer.Canvas, cmAspect, cvActual, 1, 1);
     finally
      Printer.EndDoc;
     end;
   end;
end;

procedure TViewForm.SpeedItem5Click(Sender: TObject);
begin
  RetegPanel.Visible := not RetegPanel.Visible;
  SpeedItem5.Down := RetegPanel.Visible;
  If RetegPanel.Visible then RetegPanelEnter(Sender);
end;

procedure TViewForm.RetegPanelEnter(Sender: TObject);
var
  Cont: Integer;
  TmpStr: String;
begin
  LayersList.Items.Clear;
  ActiveLayerCBox.Items.Clear;
  with LocalCAD do
   begin
  //  Layers[Cont].Name
     for Cont := 0 to 255 do
      begin
        TmpStr := Format('%3d - %s', [Cont, Layers[Cont].Name]);
        LayersList.Items.Add(TmpStr);
        ActiveLayerCBox.Items.Add(TmpStr);
      end;
     ActiveLayerCBox.ItemIndex := CurrentLayer;
     oldIndex := CurrentLayer;
     LayersList.ItemIndex := LocalCAD.CurrentLayer;
     SetCurrLayer(LocalCAD.CurrentLayer);
   end;
end;

procedure TViewForm.SaveCurrLayer(L: Integer);
begin
 // LocalCAD.Layers[L].Pen.Color := clred;
 // exit;
  with LocalCAD do
   begin
     Layers[L].Name := NameEdt.Text;
     Layers[L].Pen.Width := PenSizeEdt.Value;
     Layers[L].Pen.Color := PenColorGrid.ForegroundColor;
     Layers[L].Opaque := not TransparentChk.Checked;
     Layers[L].Visible := VisibleChk.Checked;
     Layers[L].Active := ActiveChk.Checked;
     Layers[L].Brush.Color := BrushColorGrid.ForegroundColor;
   end;
end;

procedure TViewForm.SetCurrLayer(L: Integer);
begin
  with LocalCAD do
   begin
     NameEdt.Text := Layers[L].Name;
     PenSizeEdt.Value := Layers[L].Pen.Width;
     PenColorGrid.ForeGroundIndex := PenColorGrid.ColorToIndex(Layers[L].Pen.Color);
     BrushColorGrid.ForeGroundIndex := BrushColorGrid.ColorToIndex(Layers[L].Brush.Color);
     TransparentChk.Checked := not Layers[L].Opaque;
     ActiveChk.Checked := Layers[L].Active;
     VisibleChk.Checked := Layers[L].Visible;
   end;
end;

procedure TViewForm.LayersListClick(Sender: TObject);
begin
  SaveCurrLayer(oldIndex);
  SetCurrLayer(LayersList.ItemIndex);
  oldIndex := LayersList.ItemIndex;
end;

procedure TViewForm.OKBtnClick(Sender: TObject);
begin
  SaveCurrLayer(LayersList.Itemindex);
  if ActiveLayerCBox.ItemIndex >= 0 then
   LocalCAD.CurrentLayer := ActiveLayerCBox.ItemIndex;
   LocalView.Repaint;
end;

procedure TViewForm.LocalViewMouseDown2D(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; WX, WY: Single; X, Y: Integer);
var
  TmpPt: TPoint2D;
  TmpObj: TObject2D;
  TmpN: Integer;
  TmpStr: String;
  tf2   : TTransf2D;
  NextState: TCADStateClass;
begin
  TmpPt := LocalPrg.CurrentViewportSnappedPoint;
  TmpObj := LocalView.PickObject(TmpPt, 5, False, TmpN);
  Case Action of
    tamSearch,tmaAtemel :
      begin
         InitInfoGrid(StringGrid1);
         TmpPar := TCAD2DSelectObjectsParam.Create(5, TCAD2DSelectObject);
         TCAD2DSelectObjectsParam(TmpPar).OnObjectSelected := OnSelectedObj;
         with LocalPrg do
              StartOperation(TCAD2DSelectObjects, TmpPar);
         SpellInfoGrid(StringGrid1,TmpObj);
      end;
    tamPointMove :
      If not LocalPrg.IsBusy then begin
(*         TmpPar := TCAD2DEditPrimitiveParam.Create(TmpObj, 5);
         TmpPar.UserObject := TmpObj;*)
         TmpPar := TCAD2DSelectObjectsParam.Create(5, TCAD2DEditSelectedPrimitive);
         TmpPar.UserObject := TmpObj;
         TCAD2DSelectObjectsParam(TmpPar).OnObjectSelected := OnSelectedObj;
         with LocalPrg do
              SuspendOperation(TCAD2DEditPrimitive, tmpPar);
      end;
    tamDel :
        If TmpN>=0 then
        begin
          (TmpObj as TPrimitive2D).Points.Delete(TmpN);
          LocalView.Repaint;
        end;
    tamIns :
        If TmpN>=0 then
        begin
          (TmpObj as TPrimitive2D).Points.Insert(TmpN+1,PointToPoint2d(Point(Trunc(WX+10),Trunc(WY+10))));
          LocalView.Repaint;
        end;
  end;
end;

procedure TViewForm.OnSelectedObj(Sender: TCAD2DSelectObjectsParam; Obj: TObject2D; CtrlPt: Integer; Added: Boolean);
begin
  if Assigned(Obj) then
   LocalView.DrawObject2DWithRubber(Obj, True);
  if Action = tmaAtemel then begin
     LocalCAD.ChangeObjectLayer(Obj.ID,LocalCAD.CurrentLayer);
     LocalView.Repaint;
  end;
end;

procedure TViewForm.TotalItemClick(Sender: TObject);
begin
  LocalView.ZoomToExtension
end;

procedure TViewForm.LocalViewMouseMove2D(Sender: TObject;
  Shift: TShiftState; WX, WY: Single; X, Y: Integer);
var
  TmpPt: TPoint2D;
  TmpObj: TObject2D;
  TmpN,i,j: Integer;
begin
  TmpPt := LocalPrg.CurrentViewportSnappedPoint;
  TmpObj := LocalView.PickObject(TmpPt, 5, False, TmpN);
  If TmpN>=0 then begin
    Screen.Cursor:=crHandPoint;
    Panel1.Caption := 'ID = '+Inttostr(TmpObj.ID)+' Pick = '+Inttostr(TmpN);
  end else Screen.Cursor:=crDefault;
  If TmpN=PICK_INOBJECT then Screen.Cursor:=crSizeAll;
  If TmpN=PICK_ONOBJECT then Screen.Cursor:=crDrag;
  XYPanel.Caption := Format('X: %6.1f Y: %6.1f', [WX, WY]);
//  LocalView.SetFocus;
end;

procedure TViewForm.LocalViewDblClick(Sender: TObject);
var
  TmpPt: TPoint2D;
  TmpObj: TObject2D;
  TmpN: Integer;
  TmpStr: String;
begin
  TmpPt := LocalPrg.CurrentViewportSnappedPoint;
  TmpObj := LocalView.PickObject(TmpPt, 5, False, TmpN);
  if TmpObj is TJustifiedVectText2D then
   with TJustifiedVectText2D(TmpObj) do
    begin
      TmpStr := Text;
      if not InputQuery('Edit Text', 'String', TmpStr) then
       Exit;
      Text := TmpStr;
      LocalView.Repaint;
    end;
  if TmpObj is TLine2D then
   with TLine2D(TmpObj) do
    begin
      TmpStr := IntToStr(ID);
      ShowMessage('ID = '+TmpStr+' Layer = '+IntToStr(Layer));
    end;
end;

procedure TViewForm.ActionComboClick(Sender: TObject);
begin
  Action := TActionMode(ActionCombo.Itemindex);
end;

procedure TViewForm.SpeedItem6Click(Sender: TObject);
begin
  with LocalPrg do begin
   Action := tamZoom;
   SendUserEvent(CADPRG_ACCEPT);
   StartOperation(TCADPrgZoomInOut, nil);
  end;
end;

procedure TViewForm.TampontMoveBtnClick(Sender: TObject);
Var TmpPar: TCADPrgParam;
    pmtv  : TPrimitive2D;
begin
  with LocalPrg do begin
   Action := tamPointMove;
   SendUserEvent(CADPRG_ACCEPT);
  end;
end;

function TViewForm.OnEvent(Event: TCADPrgEvent; MouseButton: TCS4MouseButton; Shift: TShiftState; Key: Word;
                                        var NextState: TCADStateClass): Boolean;
begin
//  Panel1.caption:=LocalPrg.Description;
  result := true;
end;

procedure TViewForm.ToolBtnClick(Sender: TObject);
begin
  If SpeedBar1.Height < 52 then SpeedBar1.Height := 52
  else SpeedBar1.Height := 26;
end;

procedure TViewForm.LineBtnClick(Sender: TObject);
begin
  with LocalPrg do
   begin
     if IsBusy then
      StopOperation;
     Action := tamNone;
     StartOperation(TCAD2DDrawSizedPrimitive, TCAD2DDrawSizedPrimitiveParam.Create(nil,
        TLine2D.Create(-1, Point2D(0, 0), Point2D(0, 0)), 0, True));
   end;
end;

procedure TViewForm.RectBtnClick(Sender: TObject);
begin
  with LocalPrg do
   begin
     if IsBusy then
      StopOperation;
     Action := tamNone;
     StartOperation(TCAD2DDrawSizedPrimitive, TCAD2DDrawSizedPrimitiveParam.Create(nil,
        TFrame2D.Create(-1, Point2D(0, 0), Point2D(0, 0)), 0, True));
   end;
end;






procedure TViewForm.SpeedItem11Click(Sender: TObject);
var
  TmpText: TJustifiedVectText2D;
  TmpStr: String;
  TmpH: TRealType;
begin
  Action := tamNone;
  if not InputQuery('Add Text', 'Height', TmpStr) then
   Exit;
  TmpH := StrToFloat(TmpStr);
  if not InputQuery('Add Text', 'String', TmpStr) then
   Exit;
  TmpText := TJustifiedVectText2D.Create(-1, CADSysFindFontByIndex(0), Rect2D(0, 0, 0, 0), TmpH, TmpStr);
  if Left1.Checked then
   TmpText.HorizontalJust := jhLeft
  else if Right1.Checked then
   TmpText.HorizontalJust := jhRight
  else if Center1.Checked then
   TmpText.HorizontalJust := jhCenter;
  LocalPrg.StartOperation(TCAD2DPositionObject, TCAD2DPositionObjectParam.Create(nil, TmpText));
end;

procedure TViewForm.FillRectBtnClick(Sender: TObject);
begin
  with LocalPrg do
   begin
     if IsBusy then
      StopOperation;
     Action := tamNone;
     StartOperation(TCAD2DDrawSizedPrimitive, TCAD2DDrawSizedPrimitiveParam.Create(nil,
        TRectangle2D.Create(-1, Point2D(0, 0), Point2D(0, 0)), 0, True));
   end;
end;

procedure TViewForm.FillPoliBtnClick(Sender: TObject);
begin
  with LocalPrg do
   begin
     if IsBusy then
      StopOperation;
     Action := tamNone;
     StartOperation(TCAD2DDrawUnsizedPrimitive, TCAD2DDrawUnsizedPrimitiveParam.Create(nil,
        TPolygon2D.Create(-1, [Point2D(0, 0)]), 0, True));
   end;
end;

procedure TViewForm.FillEllipseBtnClick(Sender: TObject);
begin
  with LocalPrg do
   begin
     if IsBusy then
      StopOperation;
     Action := tamNone;
     StartOperation(TCAD2DDrawSizedPrimitive, TCAD2DDrawSizedPrimitiveParam.Create(nil,
        TFilledEllipse2D.Create(-1, Point2D(0, 0), Point2D(0, 0)), 0, True));
   end;
end;

procedure TViewForm.MozgatBtnClick(Sender: TObject);
var
  TmpPar: TCADPrgParam;
begin
  Action := tamNone;
  if Useareatoselectobjects1.Checked then
   begin
     TmpPar := TCAD2DSelectObjectsInAreaParam.Create(gmAllInside, TCAD2DMoveSelectedObjects);
     with LocalPrg do
      StartOperation(TCAD2DSelectObjectsInArea, TmpPar);
   end
  else
   begin
     TmpPar := TCAD2DSelectObjectsParam.Create(5, TCAD2DMoveSelectedObjects);
     TCAD2DSelectObjectsParam(TmpPar).OnObjectSelected := OnSelectedObj;
     with LocalPrg do
      StartOperation(TCAD2DSelectObjects, TmpPar);
   end;
end;

procedure TViewForm.ForgatBtnClick(Sender: TObject);
var
  TmpPar: TCADPrgParam;
begin
  Action := tamNone;
  if Useareatoselectobjects1.Checked then
   begin
     TmpPar := TCAD2DSelectObjectsInAreaParam.Create(gmAllInside, TCAD2DRotateSelectedObjects);
     with LocalPrg do
      StartOperation(TCAD2DSelectObjectsInArea, TmpPar);
   end
  else
   begin
     TmpPar := TCAD2DSelectObjectsParam.Create(5, TCAD2DRotateSelectedObjects);
     TCAD2DSelectObjectsParam(TmpPar).OnObjectSelected := OnSelectedObj;
     with LocalPrg do
      StartOperation(TCAD2DSelectObjects, TmpPar);
   end;
end;

procedure TViewForm.BSplineBtnClick(Sender: TObject);
var
  TmpSpline: TBSpline2D;
begin
  with LocalPrg do
   begin
     if IsBusy then
      StopOperation;
     Action := tamNone;
     TmpSpline := TBSpline2D.Create(-1, [Point2D(0, 0)]);
     TmpSpline.SavingType := stSpace;
     StartOperation(TCAD2DDrawUnsizedPrimitive, TCAD2DDrawUnsizedPrimitiveParam.Create(nil,
        TmpSpline, 0, True));
   end;
end;

procedure TViewForm.TabbedNotebook1Change(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  Case NewTab of
  2: Action := tamSearch;
  end;
end;

procedure SpellInfoGrid(gr:TStringGrid;TmpObj: TObject2D);
var i:integer;
  function BoolStr(b:boolean):string;
  begin
    If b then Result:='True' else Result:='False';
  end;
  function Point2dStr(p:Tpoint2d):string;
  begin
    Result:=Format('(%6.2f:%6.2f)',[p.x,p.y]);
  end;
  function GetObjNameStr(TmpObj: TObject2D):string;
  begin
    If TmpObj is TLine2d then     Result:='TLine2d';
    If TmpObj is TPolyline2D then Result:='TPolyline2D';
    If TmpObj is TPolygon2D then  Result:='TPolygon2D';
    If TmpObj is TCurve2D then    Result:='TCurve2D';
    If TmpObj is TFrame2D then    Result:='TFrame2D';
    If TmpObj is TLine2d then     Result:='TLine2d';
    If TmpObj is TRectangle2D then Result:='TRectangle2D';
    If TmpObj is TArc2D then       Result:='TArc2D';
    If TmpObj is TEllipse2D then   Result:='TEllipse2D';
    If TmpObj is TFilledEllipse2D then Result:='TFilledEllipse2D';
    If TmpObj is TBSpline2D then  Result:='TBSpline2D';
    If TmpObj is TBitmap2D then   Result:='TBitmap2D';
    If TmpObj is TJustifiedVectText2D then Result:='TJustifiedVectText2D';
  end;
begin
  InitInfoGrid(gr);
  If TmpObj <> nil then begin
  gr.Cells[1,0] := GetObjNameStr(TmpObj);
  gr.Cells[1,1] := Inttostr(TmpObj.ID);
  gr.Cells[1,2] := Inttostr(TmpObj.Layer);
  gr.Cells[1,3] := BoolStr(TmpObj.Visible);
  gr.Cells[1,4] := BoolStr(TmpObj.Enabled);
  gr.Cells[1,5] := BoolStr(TmpObj.ToBeSaved);
  gr.Cells[1,6] := Inttostr(TmpObj.Tag);

  if TmpObj is TLine2D then
     with TLine2D(TmpObj) do
     begin
       gr.RowCount := 9+Points.Count;
       gr.Cells[0,8] := 'Pontszám'; gr.Cells[1,8] := Inttostr(Points.Count);
       gr.Cells[0,9] := 'P1'; gr.Cells[1,9] := Point2dStr(Points[0]);
       gr.Cells[0,10]:= 'P2'; gr.Cells[1,10] := Point2dStr(Points[1]);
     end;

  if (TmpObj is TPolygon2D) or (TmpObj is TPolyLine2d) or (TmpObj is TRectangle2D)
     or (TmpObj is TFrame2D) or (TmpObj is TBSpline2D)
  then
     with TLine2D(TmpObj) do
     begin
       gr.RowCount := 9+Points.Count;
       gr.Cells[0,8] := 'Pontszám'; gr.Cells[1,8] := Inttostr(Points.Count);
       For i:=0 to Points.Count-1 do begin
           gr.Cells[0,9+i] := 'P'+IntToStr(i);
           gr.Cells[1,9+i] := Point2dStr(Points[i]);
       end;
     end;

  if TmpObj is TJustifiedVectText2D then
     with TJustifiedVectText2D(TmpObj) do
     begin
       gr.RowCount := 9+Points.Count;
       gr.Cells[0,8] := 'Felirat'; gr.Cells[1,8] := Text;
       gr.Cells[0,9] := 'Méret'; gr.Cells[1,9] := FloatToStr(Height);
       gr.Cells[0,10] := 'Kar.Space'; gr.Cells[1,10] := FloatToStr(CharSpace);
     end;

  end;
end;

procedure InitInfoGrid(gr:TStringGrid);
begin
  gr.RowCount := 7;
  gr.Cells[0,0] := 'Objektum ->';
  gr.Cells[1,0] := '';
  gr.Cells[0,1] := 'ID';
  gr.Cells[0,2] := 'Réteg';
  gr.Cells[0,3] := 'Látható';
  gr.Cells[0,4] := 'Módosítható';
  gr.Cells[0,5] := 'Mentett';
  gr.Cells[0,6] := 'Tag';
  gr.Cells[1,1] := '';
  gr.Cells[1,2] := '';
  gr.Cells[1,3] := '';
  gr.Cells[1,4] := '';
  gr.Cells[1,5] := '';
  gr.Cells[1,6] := '';
end;

procedure TViewForm.SpeedItem7Click(Sender: TObject);
begin
  with LocalPrg do
   begin
     if IsBusy then
      StopOperation;
     Action := tamNone;
     StartOperation(TCAD2DDrawArcPrimitive, TCAD2DDrawArcPrimitiveParam.Create(nil,
        TArc2D.Create(-1, Point2D(0, 0), Point2D(0, 0), 0, 0)));
   end;
end;

procedure TViewForm.TotalCheckClick(Sender: TObject);
begin
  LocalView.ZoomToExtension;
end;

procedure TViewForm.DelBtnClick(Sender: TObject);
begin
   Action := tamDel;
end;

procedure TViewForm.InsBtnClick(Sender: TObject);
begin
   Action := tamIns;
end;

procedure TViewForm.SpinEdit1Change(Sender: TObject);
begin
  LocalView.ControlPointsWidth:=SpinEdit1.Value;
  LocalView.Repaint;
end;

procedure TViewForm.SpeedItem9Click(Sender: TObject);
var
  TmpText: TText2D;
  TmpStr: String;
  TmpH: TRealType;
begin
  Action := tamNone;
  if not InputQuery('Add Text', 'Height', TmpStr) then
   Exit;
  TmpH := StrToFloat(TmpStr);
  if not InputQuery('Add Text', 'String', TmpStr) then
   Exit;
  TmpText := TText2D.Create(-1, Rect2D(0, 0, 0, 0), TmpH, TmpStr);
  With TmpText do begin
    Logfont.Escapement := 3400;
    AutoSize := True;
  end;
  LocalPrg.StartOperation(TCAD2DPositionObject, TCAD2DPositionObjectParam.Create(nil, TmpText));
end;

procedure TViewForm.btnLoadColorsClick(Sender: TObject);
begin

    LocalView.BackGroundColor := 32768;  //clOlive;  //ColorGrid1.BackGroundColor;


    // SaveCurrLayer(oldIndex);
    // clBlue clGray  clFuchsia   clLime   clOlive  clsilver

     LocalCAD.Layers[2].Pen.Color := clBlack;
  //   LocalCAD.Layers[2].Brush.Color := clBlack;
     LocalView.Repaint;

end;

procedure TViewForm.Button2Click(Sender: TObject);

   var
  F: TFTank;
begin
  Application.CreateForm(TFTank, F);
  if (F.ShowModal = mrOk) then
  begin
 //   email := F.q.FieldByName('email_usual').AsString;
 //   result := TRUE;
  end
 // else result := FALSE;



end;

initialization
  CADSysRegisterFontFromFile(0, 'RomanC.fnt');
end.
