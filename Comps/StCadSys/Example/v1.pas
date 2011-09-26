(*
    DXF/CadSys Viewer
    
    by Agócs László; StellaSOFT Hungary 2002.
    Free Software!
*)

unit v1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CADSys4,CS4BaseTypes, CS4Tasks, CS4Shapes,CS4DXFModule, ColorGrd,
  ComCtrls, ImgList, ToolWin, FileCtrl, StdCtrls, ExtCtrls;

type
  TVForm = class(TForm)
    LocalCAD: TCADCmp2D;
    LocalPrg: TCADPrg2D;
    LocalView: TCADViewport2D;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ColorGrid1: TColorGrid;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox1: TFileListBox;
    FilterComboBox1: TFilterComboBox;
    ToolButton1: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ColorGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FileListBox1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    procedure MapLoad(Filename:string);
  end;

var
  VForm: TVForm;
  focim : string;
  Appended : boolean;

implementation

{$R *.DFM}

procedure TVForm.FormCreate(Sender: TObject);
begin
    focim := Caption;
    Appended := False;
    If (ParamCount>0) then
     If FileExists(ParamStr(1)) then
     Try
        MapLoad(ParamStr(1));
     except
        Application.MessageBox('Nyitási hiba!','Error',1);
     end;
end;

procedure TVForm.MapLoad(Filename:string);
var ext: string;
    dxfR : TDXF2DImport;
    i: integer;
begin
Try
Try
     Screen.Cursor:=crHourGlass;
     update;
     If not Appended then LocalCAD.DeleteAllObjects;
     ext:=UpperCase(ExtractFileExt(Filename));
        If ext = '.CS2' then
                LocalCAD.LoadFromFile(FileName);
        If ext = '.DXF' then begin
                dxfR := TDXF2DImport.Create(FileName, LocalCAD);
                with dxfR do
                try
        //      DXFRead.PositionBar:=ProgressBar1;
                SetTextFont(CADSysFindFontByIndex(0));
                ReadDXF;
                finally
                        Free;
                end;
        end;
        If ext = '.TRK' then begin
           If not StMapLoad(FileName,'',LocalCAD) then
                ShowMessage('StellaMAP térképfile betöltése sikertelen!');
        end;
        If ext = '.RTG' then begin
           If not MapLayerLoad(FileName, LocalCAD) then
                ShowMessage('Rétegfile betöltése sikertelen!');
           LocalView.Repaint;
        end;
        If ext = '.PT' then begin
           If not StITRLoad(FileName, LocalCAD) then
                ShowMessage('StellaMAP térképfile betöltése sikertelen!');
        end;
        For i:=0 to LocalCAD.ViewPortsCount-1 do
            LocalCAD.ViewPorts[i].Repaint;
     If Pos(Ext,'.DXF.TRK.CS2.PT')>0 then begin
        LocalView.ZoomToExtension;
     end;
finally
    Screen.Cursor:=crDefault;
    Caption := focim + ' - ['+Filename+']';
end;
except
  Application.MessageBox('Nyitási hiba!','Error',1);
  raise;
end;
end;

procedure TVForm.ToolButton12Click(Sender: TObject);
begin
  LocalPrg.ViewAction:=TCADActionMode((Sender as TComponent).Tag);
end;

procedure TVForm.ColorGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
        LocalView.GridColor := ColorGrid1.ForeGroundColor;
        LocalView.BackGroundColor := ColorGrid1.BackGroundColor;
end;

procedure TVForm.FileListBox1Click(Sender: TObject);
begin
  MapLoad(FileListBox1.Filename);
end;

procedure TVForm.ToolButton1Click(Sender: TObject);
begin
  Panel1.Visible := not Panel1.Visible;
  ToolButton1.Down:=Panel1.Visible;
end;

procedure TVForm.ToolButton2Click(Sender: TObject);
begin
  Appended := not Appended;
  ToolButton2.Down:=Appended;
end;

procedure TVForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
  VK_ADD      : LocalView.ZoomIn;
  VK_SUBTRACT : LocalView.ZoomOut;
  VK_ESCAPE   :
   with LocalPrg do
   begin
     SendUserEvent(CADPRG_CANCEL);
     StopOperation;
     LocalPrg.ViewAction:=tamNone;
   end;
  VK_RETURN   :
   with LocalPrg do
   begin
     SendUserEvent(CADPRG_ACCEPT);
     LocalPrg.ViewAction:=tamNone;
   end;
  end;
end;

initialization
  CADSysRegisterFontFromFile(0, ExtractFilePath(Application.exename)+'\RomanC.fnt');
end.
