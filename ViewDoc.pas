unit ViewDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OleCtnrs, ExtCtrls, ComCtrls, OleCtrls, isp3,  Menus, ImgList,
  Db, DBTables, SQL, Buttons, ClipBrd, ToolWin, Grids, DBGrids, Placemnt,
  uCommonForm,uOilQuery,Ora, uOilStoredProc, MemDS, DBAccess;

type
  TDecodebuf  = array[0..255] of byte;
  TMonthnames = array[1..12]  of string;
  TThreeords  = array[1..24]  of string;
  THuns       = array[1..9]   of string;
  TTeens      = array[1..10]  of string;
  TTens       = array[1..8]   of string;
  TUnits      = array[1..9]   of string;
  TViewDocForm = class(TCommonForm)
    Box: TOleContainer;
    MainMenu1: TMainMenu;
    miReCode: TMenuItem;
    miDosWin: TMenuItem;
    miWinDos: TMenuItem;
    miFile: TMenuItem;
    miExit: TMenuItem;
    SP: TOilStoredProc;
    SBar: TStatusBar;
    Panel1: TPanel;
    N3: TMenuItem;
    miPrint: TMenuItem;
    miPrinterSetup: TMenuItem;
    Dialog1: TPrinterSetupDialog;
    PrintDialog1: TPrintDialog;
    miSaveAs: TMenuItem;
    SaveDialog1: TSaveDialog;
    qRes: TOilQuery;
    qResTEXT_: TStringField;
    FontDialog1: TFontDialog;
    N2: TMenuItem;
    miFont: TMenuItem;
    ToolbarImages: TImageList;
    OpenDialog: TOpenDialog;
    pBox2: TScrollBox;
    Panel4: TPanel;
    Ruler: TPanel;
    FirstInd: TLabel;
    LeftInd: TLabel;
    RightInd: TLabel;
    Box2: TRichEdit;
    sbSave: TSpeedButton;
    sbFont: TSpeedButton;
    sbPrint: TSpeedButton;
    sbExit: TSpeedButton;
    sbPrintSetup: TSpeedButton;
    N7: TMenuItem;
    miDelReadOnly: TMenuItem;
    FindDialog1: TFindDialog;
    sbFindText: TSpeedButton;
    pScrollBar: TPanel;
    ScrollBar1: TScrollBar;
    miFindText: TMenuItem;
    PB: TProgressBar;
    FormStorage1: TFormStorage;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miDosWinClick(Sender: TObject);
    procedure miWinDosClick(Sender: TObject);
    procedure miPrinterSetupClick(Sender: TObject);
    procedure miPrintClick(Sender: TObject);
    procedure miFontClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SelectionChange(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure RulerItemMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RulerItemMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FirstIndMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RightIndMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure pBox2Resize(Sender: TObject);
    procedure miDelReadOnlyClick(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure sbFindTextClick(Sender: TObject);
    procedure ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure Box2KeyPress(Sender: TObject; var Key: Char);
    Function  W2Gost (s : String) : String;
    Function  Gost2W (s : String) : String;
    procedure miSaveAsClick(Sender: TObject);

  private
    { Private declarations }
    FUpdating: Boolean;
    FDragOfs: Integer;
    FDragging: Boolean;
    FClipboardOwner: HWnd;
    procedure SetupRuler;
    procedure SetEditRect;
  public
    { Public declarations }
    ObjectFileName: TFileName;
    Txt, Is_File  : Boolean;
    DateFile, DateFile2, Data,URL,FName,ObjTypeName,RegId,RegDate : String;
    F    : Text;
    SizeFile, RSide, LSide, ID_OBJ,ObjTypeId   : Integer;
    CharPos : TPoint;

  end;

const
  RulerAdj  = 4/3;
  GutterWid = 6;
  LatCharSet    : set of Char =
    ['a'..'z','A'..'Z'];
  RusCharSet    : set of Char =
    ['й','ц','у','к','е','н','г','ш','щ','з','х','ъ','ф','ы','в','а','п','р',
     'о','л','д','ж','э','я','ч','с','м','и','т','ь','б','ю',
     'Й','Ц','У','К','Е','Н','Г','Ш','Щ','З','Х','Ъ','Ф','Ы','В','А','П','Р',
     'О','Л','Д','Ж','Э','Я','Ч','С','М','И','Т','Ь','Б','Ю'];
  UkrCharSet    : set of Char = ['_','_','ї','Ї','є','Є'];
  DigitCharSet  : set of Char = ['0'..'9'];
  SimbolCharSet : set Of Char = [' ','.','-','"', '=', '+'];
  idoperatormax=301;
  g2wbuf:tdecodebuf=
  (
     0,  1,  2,  3,  4,  5,  6,  7,  8,  9,
    10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
    20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
    30, 31, 32, 33, 34, 35, 36, 37, 38, 39,
    40, 41, 42, 43, 44, 45, 46, 47, 48, 49,
    50, 51, 52, 53, 54, 55, 56, 57, 58, 59,
    60, 61, 62, 63, 64, 65, 66, 67, 68, 69,
    70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
    80, 81, 82, 83, 84, 85, 86, 87, 88, 89,
    90, 91, 92, 93, 94, 95, 96, 97, 98, 99,
   100,101,102,103,104,105,106,107,108,109,
   110,111,112,113,114,115,116,117,118,119,
   120,121,122,123,124,125,126,127,192,193,
   194,195,196,197,198,199,200,201,202,203,
   204,205,206,207,208,209,210,211,212,213,
   214,215,216,217,218,219,220,221,222,223,
   224,225,226,227,228,229,230,231,232,233,
   234,235,236,237,238,239, 45, 45, 45, 45,
    45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
    45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
    45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
    45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
    45, 45, 45, 45,240,241,242,243,244,245,
   246,247,248,249,250,251,252,253,254,255,
   168,184,165,180,170,186,178,179,175,191,
   183,185,185,164, 45, 45
  );
  w2gbuf:tdecodebuf=
  (
     0,  1,  2,  3,  4,  5,  6,  7,  8,  9,
    10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
    20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
    30, 31, 32, 33, 34, 35, 36, 37, 38, 39,
    40, 41, 42, 43, 44, 45, 46, 47, 48, 49,
    50, 51, 52, 53, 54, 55, 56, 57, 58, 59,
    60, 61, 62, 63, 64, 65, 66, 67, 68, 69,
    70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
    80, 81, 82, 83, 84, 85, 86, 87, 88, 89,
    90, 91, 92, 93, 94, 95, 96, 97, 98, 99,
   100,101,102,103,104,105,106,107,108,109,
   110,111,112,113,114,115,116,117,118,119,
   120,121,122,123,124,125,126,127, 45, 45,
    45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
    45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
    45, 45, 45, 45, 45, 45, 45, 45, 45, 45,
    45, 45, 45, 45,253,242, 45, 45,240, 45,
   244, 45, 45, 45, 45,248, 45, 45,246,247,
   243, 45, 45,250,241,252,245, 45, 45, 45,
    45,249,128,129,130,131,132,133,134,135,
   136,137,138,139,140,141,142,143,144,145,
   146,147,148,149,150,151,152,153,154,155,
   156,157,158,159,160,161,162,163,164,165,
   166,167,168,169,170,171,172,173,174,175,
   224,225,226,227,228,229,230,231,232,233,
   234,235,236,237,238,239
  );



implementation


Uses Main, OilStd;

{$R *.DFM}

Function TViewDocForm.W2Gost(S:String):String;
Var I : Byte;
begin
 For I  := 1 To Length(S) Do S[I] := Chr( W2Gbuf[ Ord(S[I])] );
 Result := S;
end;

Function TViewDocForm.Gost2W(S:String):String;
Var I : Byte;
begin
 For I  := 1 To Length(S) Do S[I] := Chr ( G2Wbuf [ Ord(S[I])] );
 Result := S;
end;

procedure TViewDocForm.FormDestroy(Sender: TObject);
begin
  ChangeClipboardChain(Handle, FClipboardOwner);
  If Is_File Then
  Begin
    Try
//      CloseFile(F);
    Except
    End;
    Try
      If Not DeleteFile(ObjectFileName) Then
        Raise Exception.Create(TranslateText('Не могу удалить файл: "')+ObjectFileName+'"');
    Except
//      ShowMessage(TranslateText('Не могу удалить файл: "')+ObjectFileName+'"');
    End;
  End;
end;

procedure TViewDocForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TViewDocForm.FormShow(Sender: TObject);
Var
  Res  : String;
Begin
  If RightInd.Left < 300 Then RightInd.Left := 1711;  
  Try
    Is_File := True;
    If Not Txt Then
    Begin
      Res := ANSIUpperCase(ExtractFileExt(ObjectFileName));
      miFile.Visible:=False;
      Box.CreateObjectFromFile(ObjectFileName, False);
      Box.Visible:=True;
      If (Res='.DOC')Or(Res='.RTF')Or(Res='.XLS') Then Box.DoVerb(ovShow);
    End
    Else
    With Box2 Do
    Begin
      sbFindText.Enabled := True;
      pBox2.Visible:=True;
      Visible:=True;
      Lines.BeginUpdate;
      Visible:=False;
      Lines.LoadFromFile(ObjectFileName+'');
      Lines.Add('');
      miDosWinClick(Nil);
      Lines.EndUpdate;
      SelectAll;
      Paragraph.FirstIndent := Trunc((LSide-GutterWid) / RulerAdj);
      Paragraph.RightIndent := Trunc((Ruler.ClientWidth-RightInd.Left+FDragOfs-2) / RulerAdj)-2*GutterWid;
      Box2.SelLength:=0;
      SelectionChange(Nil);
      Visible:=True;
      pScrollBar.Visible := True;
      With ScrollBar1 Do
      Begin
        Min := 0;
        Max := Box2.Lines.Count;
        LargeChange := 10;
        SmallChange := 1;
        Position:=0;
      End;
      miReCode.Visible := True;
    End;
  Except On E: Exception Do
    ShowMessage(TranslateText('Ошибка при просмотре: ')+E.Message);
  End;
End;

procedure TViewDocForm.miExitClick(Sender: TObject);
begin
  Close;
  ModalResult:=mrCancel;
end;

procedure TViewDocForm.miDosWinClick(Sender: TObject);
Var
  J : Integer;
begin
  With Box2 Do
  Begin
    Lines.BeginUpdate;
    Caption:=TranslateText('Перекодировка - ')+ExtractFileName(ObjectFileName);
    For J:=0 To Lines.Count-1 Do
      Lines[J]:=Gost2W(Lines[J]);
    Lines.EndUpdate;
    Caption:=TranslateText('Просмотр - ')+ExtractFileName(ObjectFileName);
  End;
end;

procedure TViewDocForm.miWinDosClick(Sender: TObject);
Var
  J : Integer;
begin
  With Box2 Do
  Begin
    Lines.BeginUpdate;
    Caption:=TranslateText('Перекодировка - ')+ExtractFileName(ObjectFileName);
    For J:=0 To Lines.Count-1 Do
      Lines[J]:=W2Gost(Lines[J]);
    Lines.EndUpdate;
    Caption:=TranslateText('Просмотр - ')+ExtractFileName(ObjectFileName);
  End;
end;

procedure TViewDocForm.FormCreate(Sender: TObject);
begin
inherited;
  Txt := True;
  SetupRuler;
  SelectionChange(Self);
end;

procedure TViewDocForm.miPrinterSetupClick(Sender: TObject);
begin
  Dialog1.Execute;
end;

procedure TViewDocForm.miPrintClick(Sender: TObject);
Var
  St : TStringList;
begin
  Try
    St := TStringList.Create;
    With Box2 Do
    Begin
//      Print(ObjectFileName);
      If Box2.ReadOnly Then CopyFile(Pchar(ObjectFileName), Pchar('PRN'), False)
      Else
      Begin
        If MessageDlg(TranslateText('Сохранить и распечатать измененный файл?'),mtConfirmation,[mbYes, mbNo],0) = mrYes Then
        Begin
          St.Assign(Box2.Lines);
          Win2DosStrs(St);
          St.SaveToFile(ObjectFileName);
          CopyFile(Pchar(ObjectFileName), Pchar('PRN'), False);
        End;
      End;
      SelLength := 0;
    End;
  Except On E:Exception Do
    MessageDlg(TranslateText('Ошибка при регистрации печати файла : ')+E.message,mtError,[mbOk],0);
  End;
  St.Free;
end;

procedure TViewDocForm.miFontClick(Sender: TObject);
begin
  FontDialog1.Font := Box2.Font;
  If FontDialog1.Execute Then Box2.Font:=FontDialog1.Font;
end;

procedure TViewDocForm.FormResize(Sender: TObject);
begin
  If Height>150 Then ScrollBar1.Height:=Height-130;
  SelectionChange(Sender);
end;

procedure TViewDocForm.SelectionChange(Sender: TObject);
begin
  with Box2.Paragraph do
  try
    FUpdating := True;
    FirstInd.Left := Trunc(FirstIndent*RulerAdj)-4+GutterWid;
    LeftInd.Left  := Trunc((LeftIndent+FirstIndent)*RulerAdj)-4+GutterWid;
    RightInd.Left := Ruler.ClientWidth-6-Trunc((RightIndent+GutterWid)*RulerAdj);
  finally
    FUpdating := False;
  end;
end;

procedure TViewDocForm.SetupRuler;
var
  I: Integer;
  S: String;
begin
  SetLength(S, 201);
  I := 1;
  while I < 200 do
  begin
    S[I] := #9;
    S[I+1] := '|';
    Inc(I, 2);
  end;
  Ruler.Caption := S;
end;

procedure TViewDocForm.SetEditRect;
var
  R: TRect;
begin
  with Box2 do
  begin
    R := Rect(GutterWid, 0, ClientWidth-GutterWid, ClientHeight);
    SendMessage(Handle, EM_SETRECT, 0, Longint(@R));
  end;
end;

procedure TViewDocForm.FormPaint(Sender: TObject);
begin
  SetEditRect;
end;

procedure TViewDocForm.RulerItemMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Box2.SelectAll;
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs;
  FDragging := True;
end;

procedure TViewDocForm.RulerItemMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if FDragging then
    TLabel(Sender).Left :=  TLabel(Sender).Left+X-FDragOfs
end;

procedure TViewDocForm.FirstIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  Box2.SelectAll;
  Box2.Paragraph.FirstIndent := Trunc((FirstInd.Left+FDragOfs-GutterWid) / RulerAdj);
  Box2.SelLength:=0;
end;

procedure TViewDocForm.LeftIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  Box2.SelectAll;
  Box2.Paragraph.LeftIndent := Trunc((LeftInd.Left+FDragOfs-GutterWid) / RulerAdj)-Box2.Paragraph.FirstIndent;
  Box2.SelLength:=0;
end;

procedure TViewDocForm.RightIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  Box2.SelectAll;
  Box2.Paragraph.RightIndent := Trunc((Ruler.ClientWidth-RightInd.Left+FDragOfs-2) / RulerAdj)-2*GutterWid;
  Box2.SelectAll;
  Box2.SelLength:=0;
end;

procedure TViewDocForm.pBox2Resize(Sender: TObject);
begin
  Panel4.Height:=pBox2.Height-26;
end;

procedure TViewDocForm.miDelReadOnlyClick(Sender: TObject);
begin
  Box2.ReadOnly:=False;
end;

procedure TViewDocForm.FindDialog1Find(Sender: TObject);
var
  FoundAt: LongInt;
  StartPos, ToEnd: Integer;
begin
  With Box2 do
  Begin
    If SelLength <> 0 Then StartPos := SelStart + SelLength
                      Else StartPos := 0;
    ToEnd := Length(Text) - StartPos;
    FoundAt := FindText(FindDialog1.FindText, StartPos, ToEnd, [stMatchCase]);
    If FoundAt <> -1 Then
    Begin
      SetFocus;
      SelStart := FoundAt;
      SelLength := Length(FindDialog1.FindText);
    End;
  End;
End;

procedure TViewDocForm.sbFindTextClick(Sender: TObject);
begin
  FindDialog1.Position := Point((Top+Height div 3),(Left+Width) div 3);
  FindDialog1.Execute;
end;

procedure TViewDocForm.ScrollBar1Scroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
Var
  Act : Integer;
begin
  Case ScrollCode Of
    scLineUp    : Act := SB_LINEUP;
    scLineDown  : Act := SB_LINEDOWN;
    scPageUp    : Act := SB_PAGEUP;
    scPageDown  : Act := SB_PAGEDOWN;
    scBottom    : Act := SB_BOTTOM;
    scEndScroll	: Act := SB_ENDSCROLL;
    scPosition  : Act := SB_THUMBPOSITION;
    scTrack	: Act := SB_THUMBTRACK;
    scTop       : Act := SB_TOP;
  Else
    Begin
      ShowMessage(TranslateText('Ошибка! Не опознан параметр для скролинга!'));
      Exit;
    End;
  End;
  SendMessage(Box2.Handle, WM_VSCROLL, LOWORD(Act)+HIWORD(ScrollPos), 0);
end;

procedure TViewDocForm.Box2KeyPress(Sender: TObject; var Key: Char);
begin
  If Ord (Key) = 27 Then miExitClick(Nil);
end;

procedure TViewDocForm.miSaveAsClick(Sender: TObject);
Var
  St : TStringList;
begin
  St := TStringList.Create;
  If SaveDialog1.Execute Then
  Try
    St.Assign(Box2.Lines);
    Win2DosStrs(St);
    St.SaveToFile(SaveDialog1.FileName);
  Except
    ShowMessage(TranslateText('Ошибка!'));
  End;
  St.Free;
end;

end.
