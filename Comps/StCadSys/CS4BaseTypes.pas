{: This help file explain all the base types defined in
   the CADSys 4.0 library for both the 2D and 3D use.

   These types are defined in the CS4BaseTypes unit file
   that you must include in the <B=uses> clause in all of your units
   that use CADSys.
}
{$REALCOMPATIBILITY ON}

unit CS4BaseTypes;

interface

uses Classes, Windows, Graphics;

type

{: To let the library to use any floating point precision value
   in defining the coordinates of points and so on, all
   floating point number used by the library is of this type.

   At the moment the precision is set to Single but you don't
   rely on this assumption when you create new kind of shapes
   classes or use the library.

   <B=Note>: I don't think that this type will change due to storage
   and speed efficency.
}
  TRealType = Single;

TCADActionMode =
   (tamNone,tamPan,tamZoom,tamZoomArea,tamRealZoom,
    tamSearch,tamDistance,tamReference,tamMove,tamAreaMove,
    tamEdit, tamAtemel, tamDelObject, tamAdd,tamIns,
    tamDel, tamDraw, tamLine2d, tamPolyline2d,tamClosedPolyLine2d,
    tamFrame2d,tamCircle2d,tamEllipse2d, tamArc2d,tamSpline2d,
    tamJustifiedVectText2D,tamText2d,tamRectangle2D,tamPolygon2d,tamFilledEllipse2d,
    tamBitmap2d);

TGridLineType  = (grlSolid, grlDash, grlDot, grlPoint, grlDashDot, grlClear);

TObjName = string[15];

  // Középpont koordináták objektuma
  T2DPoint = Class(TPersistent)
  private
    fx,fy : TRealType;
    FOnChange: TNotifyEvent;
    procedure Setx(Value:TRealType);
    procedure Sety(Value:TRealType);
    procedure Changed; dynamic;
  public
    constructor Create;
  published
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property x:TRealType read fx write Setx;
    property y:TRealType read fy write Sety;
  end;

  { ID - ket azonosító objektum kigyüjtésekhez }
  TIndexObj = Class(TObject)
  private
    fID: LongInt;
   public
    constructor Create(ID: LongInt);
    property ID: LongInt read fID write fID;
  end;

TPontrecord = record           {Térkép pontok *.trk adatbázisa}
  reteg  : byte;
  No     : Longint;
  x,y,z  : real;
  pkod   : integer;            {-1 = Infópont, -2 = Jelkulcs}
  info   : longint;            {Infokód v. Jelkulcskód}
  obj    : word;               {Objektum kód}
  jelzo  : byte;
end;

TVonalrecord = packed record    {Térkép vonalak *.lin adatbázisa}
  reteg  : byte;
  x1,y1,z1 : real48;
  x2,y2,z2 : real48;
  vastag : byte;               {Ha vastagság és vonaltipus = 0, akkor}
  tipus  : word;               {a réteg alapértelmezése él}
  obj1   : word;               {Objektum kód a vonal két oldalán}
  obj2   : word;
  jelzo  : byte;
end;

TSzovegrecord = packed record          {Térkép feliratok *.szv adatbázisa}
  reteg  : byte;
  x,y    : real;
  kozsegkod : word;            {Jelenleg az irányítószám}
  szoveg : string[20];
  font   : byte;               {Windows font megjelölés}
  szeles : byte;
  stilus : byte;               {normál,vastag,dõlt, ...}
  szog   : word;
  obj    : word;               {Objektum kód}
  jelzo  : byte;
end;

TJelkulcsRecord = record        {Térkép jelkulcsok *.jlk adatbázisa}
  kod    : word;
  reteg  : byte;
  x,y    : real;
  meret  : word;               {a méret szorzó 100-szorosa}
  szog   : word;
  obj    : word;               {Objektum kód}
  jelzo  : byte;
end;

TRetegRecord = packed record           {Térkép rétegek *.rtg adatbázisa}
  retegszam   : byte;
  retegnev    : string[20];
  pontszin    : TColor;
  vonalszin   : TColor;
  vonalvastag : word;
  vonalstylus : byte;
  szovegszin  : TColor;
  fontnev     : string[20];
  fontmeret   : byte;
  fontstylus  : byte;
  vedett      : boolean;
end;

TJelkulcsHeader = record
  jkkod  : longint;
  jkcim  : longint;
  jkdb   : byte;        {Jelkulcs rajzelemek száma}
  jknev  : string[20];
end;

TJkRecord = record
  kod    : word;
  x1,y1  : integer;
  x2,y2  : integer;
  szin   : TColor;
  vastag : byte;
end;

{------------ ITR adatrekordok ------------------}

{ *.PT file-ban}
ITRPontHeader = packed record
  dummy  : array[1..18] of char;
end;

ITRPontRecord = packed record          {Hossza : 39}
  azonosito : byte;
  x,y,z     : Longint;
  No        : Longint;
  valami    : Longint;
  pkod      : Word;
  vonalszam : byte;
  reteg     : byte;
  reteg1    : byte;
  a         : Longint;
  b         : Longint;
  dummy     : array[1..5] of char;
end;

{ *.el file-ban}

ITRVonalHeader = packed record
  dummy  : array[1..18] of char;
end;

ITRVonalRecord = packed record         {Hossz = 44}
    azonosito: word;            {1=élõ, 0=törölt vonal}
    vonal1   : word;            {elõlrõl csatlakozó vonal sorszáma}
    valami1  : Longint;         { FF 00 }
    vonal2   : word;            {hátulról csatlakozó vonal sorszáma}
    valami2  : Longint;         { FF FF }
    y1       : Longint;
    x1       : Longint;
    y2       : Longint;
    x2       : Longint;
    reteg    : byte;
    reteg1   : byte;
    stylus   : Array[1..8] of byte;    { FF FF FF FF FF FF FF FF }
    sorveg   : Longint;                { 00 00 00 C0 }
end;

{ *.TX file-ban}
ITRTextHeader = packed record
  dummy  : array[1..18] of char;
end;

ITRTextRecord = packed record     {rekord hossz = 53}
    azonosito : byte;
    y1        : Longint;
    x1        : Longint;
    reteg     : byte;
    szovtip   : byte;
    toll      : byte;
    dummi1    : Array[1..3] of char;
    szog      : word;
    dummi2    : Array[1..4] of char;
    text      : Array[1..11] of char;
    a         : Longint;
    b         : Longint;
    c1        : Longint;
    c2        : Longint;
    d         : byte;
    e         : Longint;
end;

{ *.si jelkulcsadatok }
ITRJelkulcsHeader = packed record
  dummy  : array[1..18] of char;
end;

ITRJelkulcsRecord = packed record     {rekord hossz = 21}
  azonosito : byte;
  valami    : word;
  y,x       : Longint;
  toll      : byte;
  a1        : byte;
  reteg     : byte;
  jkkod     : byte;
  jkszog    : word;
  dummy     : array[1..4] of char;
end;

{ *.lay Rétegparaméterek }
ITRRetegHeader = packed record
  dummy  : array[1..18] of char;
end;

ITRRetegRecord = packed record    {rekord hossz = 31}
  reteg       : byte;
  retegnev    : Array[1..12] of char;
  dummy       : array[1..18] of char;
end;



{: This type is the result information of a clipping method. The
   clipping functions are used internally by the library and you
   don't need to use them directly.

   The tags have the following meanings:

   <LI=<I=ccFirst> the clipping function has modified the first point of the segment>
   <LI=<I=ccSecond> the clipping function has modified the second point of the segment>
   <LI=<I=ccNotVisible> the segment to be clipped is not visible>
   <LI=<I=ccVisible> the segment to be clipped is fully visible>
}
  TClipCode = (ccFirst, ccSecond, ccNotVisible, ccVisible);
{: This type is a set of <See Type=TClipCode> tags. A clipping function may
   return such a set.
}
  TClipResult = set of TClipCode;
{: This type define the point position against view frustum.
}
  TOutPos = (left, bottom, right, top, neareye, fareye);
{: This type define the point position against view frustum.
}
  TOutCode = set of TOutPos;

{: This type defines a 2D point in homogeneous coordinates.

   All point informations in the library are in homogeneous
   coordinates that is they have a third coordinate W. This
   coordinate may be treated as divisor coefficient for the X and Y
   coordinates.

   A 2D point in the euclidean space (the normally used point) can
   be obtained by dividing each X and Y coordinates by W:

   <Code=
     Xe := X / W;<BR>
     Ye := Y / W;<BR>.
   >

   A point to be valid must have at least one of its coordinates
   not zero. If a point has W = 0 it is called a point at infinitum
   and it is not allowed in the library. Normally this kind of
   points is used to rapresent a direction but in the library
   the <See Type=TVector2D> type is used instead.
}
  TPoint2D = record
   X, Y, W: TRealType;
  end;

{: This type defines a 2D vector or direction.

   Use this type when you need to defines directions in the
   2D space. In the case of 2D application this type may be
   used in defining parametric segments or to specify
   ortogonal segments.
}
  TVector2D = record
   X, Y: TRealType;
  end;

{: This type defines a 2D axis aligned rectangle.

   The rectangle is specified by two of its corners, the
   lower-left ones and the upper-right ones. Consider that
   the origin of the coordinates of the library is different
   from the Windows' one. Use <See Function=Rect2DToRect> and
   <See Function=RectToRect2D> functions to convert from the
   two coordinate systems.

   This type is useful to defines bounding boxes of shapes.
}
  TRect2D = record
   case Byte of
    0: (Left, Bottom, W1, Right, Top, W2: TRealType);
    1: (FirstEdge, SecondEdge: TPoint2D);
  end;

{: This type defines a 2D transformation for homogeneous points
   and vectors.

   The convention used by the library is that a matrix premultiply
   a point, that is:

   <Code=TP = M * T>

   where <I=TP> and <I=T> are points and <I=M> is a matrix.

   The matrix is specified by columns, that is <I=M[2, 1]> is
   the element at row 2 and column 1 and <I=M[1, 2]> is the
   element at row 1 anc column 2.
}
  TTransf2D = array[1..3, 1..3] of TRealType;

  {: Vector of 2D points. }
  TVectPoints2D = array [0..0] of TPoint2D;
  {: Pointer to vector of 2D points. }
  PVectPoints2D = ^TVectPoints2D;

{: This class defines a decorative pen, that is a special Window pen that
   can have any pattern. The pattern is defined by a string of bits like
   '1110001100', in which a one rapresent a colored pixel and a zero
   rapresent a transparent pixel. By using this pen the redrawing of the
   image will be slower, so use it only where necessary. Because a decorative
   pen is associated to a layer you can manage it better.

   <B=Note>: The decorative pen use LineDDA functions to draw the lines and
   can only be used for lines and polylines (so no ellipses are drawed using
   the pattern).
}
  TDecorativePen = class(TObject)
  private
    fPStyle: TBits;
    fCnv: TCanvas;
    fCurBit: Word;
    fStartPt, fEndPt, fLastPt: TPoint;

    procedure SetBit(const Idx: Word; const B: Boolean);
    function GetBit(const Idx: Word): Boolean;
    function GetMaxBit: Word;
    procedure CallLineDDA;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TObject);
    procedure MoveTo(Cnv: TCanvas; X, Y: Integer);
    procedure MoveToNotReset(Cnv: TCanvas; X, Y: Integer);
    procedure LineTo(Cnv: TCanvas; X, Y: Integer);
    procedure TextOut(Cnv: TCanvas; X, Y: Integer; s: string);
    procedure Polyline(Cnv: TCanvas; Pts: Pointer; NPts: Integer);
    {: Specify the pattern for lines.
       The pattern is defined by a string of bits like
       '1110001100', in which a one rapresent a colored pixel and a zero
       rapresent a transparent pixel. By using this pen the redrawing of the
       image will be slower, so use it only where necessary. Because a decorative
       pen is associated to a layer you can manage it better.
    }
    procedure SetPenStyle(const SString: String);
    {: Contains the patter for lines.
       The pattern is defined by a string of bits like
       '1110001100', in which a one rapresent a colored pixel and a zero
       rapresent a transparent pixel. By using this pen the redrawing of the
       image will be slower, so use it only where necessary. Because a decorative
       pen is associated to a layer you can manage it better.
    }
    property PenStyle[const Idx: Word]: Boolean read GetBit write SetBit;
    property PatternLenght: Word read GetMaxBit;
  end;

{: Defines an object that contains a DecorativePen and a Canvas.
   By using the decorative pen methods you can draw patterned lines,
   and by using the Canvas property you can draw using the
   canvas.

   See also <See Class=TDecorativePen> for details.
}
  TDecorativeCanvas = class(TObject)
  private
    fDecorativePen: TDecorativePen;
    fCanvas: TCanvas;
  public
    constructor Create(ACanvas: TCanvas);
    destructor Destroy; override;
    procedure MoveTo(X, Y: Integer);
    procedure LineTo(X, Y: Integer);
    procedure Polyline(Points: Pointer; NPts: Integer);
    procedure TextOut(X, Y: Integer; s: string);
    property DecorativePen: TDecorativePen read fDecorativePen;
    property Canvas: TCanvas read fCanvas write fCanvas;
  end;

const
  TWOPI = 2 * Pi;
  SQRT2 = 1.414213562373;

  {: Constant used with the picking functions.

     See also <See Method=TCADViewport2D@PickObject> and
     <See Method=TCADViewport3D@PickObject>.
  }
  PICK_NOOBJECT = -200;
  {: Constant used with the picking functions.

     See also <See Method=TCADViewport2D@PickObject> and
     <See Method=TCADViewport3D@PickObject>.
  }
  PICK_INBBOX = -100;
  {: Constant used with the picking functions.

     See also <See Method=TCADViewport2D@PickObject> and
     <See Method=TCADViewport3D@PickObject>.
  }
  PICK_ONOBJECT = -1;
  {: Constant used with the picking functions.

     See also <See Method=TCADViewport2D@PickObject> and
     <See Method=TCADViewport3D@PickObject>.
  }
  PICK_INOBJECT = -2;
  {: This is the identity matrix for 2D transformation.
  }
  IdentityTransf2D: TTransf2D = ((1.0, 0.0, 0.0), (0.0, 1.0, 0.0), (0.0, 0.0, 1.0));
  {: This is the null matrix for 2D transformation.
  }
  NullTransf2D: TTransf2D = ((0.0, 0.0, 0.0), (0.0, 0.0, 0.0), (0.0, 0.0, 1.0));
  {: This is the minimum value for coordinates.
  }
  MinCoord = -1.0E8;
  {: This is the maximun value for coordinates.
  }
  MaxCoord = 1.0E8;

const
  crKez1     = 19000;
  crKez2     = 19001;
  crRealZoom = 19002;
  crNyilUp   = 19003;
  crNyilDown = 19004;
  crNyilLeft = 19005;
  crNyilRight= 19006;
  crZoomIn   = 19007;
  crZoomOut  = 19008;
  crKereszt  = 19009;
  crHelp     = 19100;

implementation

{$R StView32_Cursors.res}

constructor TIndexObj.Create(ID: LongInt);
begin
  inherited Create;
  fID := ID;
end;

{ TDecorativeCanvas }

constructor TDecorativeCanvas.Create(ACanvas: TCanvas);
begin
  inherited Create;
  fCanvas := ACanvas;
  fDecorativePen := TDecorativePen.Create;
end;

destructor TDecorativeCanvas.Destroy;
begin
  fDecorativePen.Free;
  inherited Destroy;
end;

procedure TDecorativeCanvas.MoveTo(X, Y: Integer);
begin
  fDecorativePen.MoveTo(fCanvas, X, Y);
end;

procedure TDecorativeCanvas.LineTo(X, Y: Integer);
begin
  fDecorativePen.LineTo(fCanvas, X, Y);
end;

procedure TDecorativeCanvas.Polyline(Points: Pointer; NPts: Integer);
begin
  fDecorativePen.Polyline(fCanvas, Points, NPts);
end;

procedure TDecorativeCanvas.TextOut(X, Y: Integer; s: string);
begin
  fDecorativePen.TextOut(fCanvas, x, y, s);
end;

{ TDecorativePen }

procedure LineDDAMethod1(X, Y: Integer; lpData: Pointer); stdcall;
var
  NextBit: Integer;
begin
  with TDecorativePen(lpData) do
   begin
     NextBit := (fCurBit + Abs(X - fLastPt.X)) mod GetMaxBit;
     fLastPt := Point(X, Y);
     if (fCurBit < GetMaxBit) and
        (fPStyle[fCurBit] and
        not fPStyle[NextBit]) then
      fCnv.Polyline([Point(fStartPt.X, fStartPt.Y), Point(X, Y)])
     else if not fPStyle[fCurBit] then
      fStartPt := Point(X, Y);
     if (X = fEndPt.X - 1) or (X = fEndPt.X + 1) then
      fCnv.Polyline([Point(fStartPt.X, fStartPt.Y), Point(X, Y)]);
     fCurBit := NextBit;
   end;
end;

procedure LineDDAMethod2(X, Y: Integer; lpData: Pointer); stdcall;
var
  NextBit: Integer;
begin
  with TDecorativePen(lpData) do
   begin
     NextBit := (fCurBit + Abs(Y - fLastPt.Y)) mod GetMaxBit;
     fLastPt := Point(X, Y);
     if (fCurBit < GetMaxBit) and
        (fPStyle[fCurBit] and not fPStyle[NextBit]) then
      fCnv.Polyline([Point(fStartPt.X, fStartPt.Y), Point(X, Y)])
     else if not fPStyle[fCurBit] then
      fStartPt := Point(X, Y);
     if (Y = fEndPt.Y - 1) or (Y = fEndPt.Y + 1) then
      fCnv.Polyline([Point(fStartPt.X, fStartPt.Y), Point(X, Y)]);
     fCurBit := NextBit;
   end
end;

procedure TDecorativePen.SetBit(const Idx: Word; const B: Boolean);
begin
  fPStyle[Idx] := B;
end;

function TDecorativePen.GetBit(const Idx: Word): Boolean;
begin
  Result := fPStyle[Idx];
end;

function TDecorativePen.GetMaxBit: Word;
begin
  Result := fPStyle.Size;
end;

procedure TDecorativePen.CallLineDDA;
begin
  if (Abs(fEndPt.X - fStartPt.X) > Abs(fEndPt.Y - fStartPt.Y)) then
   LineDDA(fStartPt.X, fStartPt.Y, fEndPt.X, fEndPt.Y, @LineDDAMethod1, Integer(Self))
  else
   LineDDA(fStartPt.X, fStartPt.Y, fEndPt.X, fEndPt.Y, @LineDDAMethod2, Integer(Self));
end;

constructor TDecorativePen.Create;
begin
  inherited;

  fPStyle := TBits.Create;
end;

destructor TDecorativePen.Destroy;
begin
  fPStyle.Free;
  inherited;
end;

procedure TDecorativePen.Assign(Source: TObject);
var
  Cont: Integer;
begin
  if (Source = Self) then
   Exit;
  if Source is TDecorativePen then
   begin
     fPStyle.Size := 0;
     for Cont := 0 to TDecorativePen(Source).fPStyle.Size - 1 do
      fPStyle[Cont] := TDecorativePen(Source).fPStyle[Cont];
   end;
end;

procedure TDecorativePen.MoveTo(Cnv: TCanvas; X, Y: Integer);
begin
  if( fPStyle.Size > 0 ) then
   begin
     fStartPt := Point(X, Y);
     fEndPt := Point(X, Y);
     fLastPt := fStartPt;
     fCurBit := 0;
   end
  else
   Cnv.MoveTo(X, Y);
end;

procedure TDecorativePen.MoveToNotReset(Cnv: TCanvas; X, Y: Integer);
begin
  if( fPStyle.Size > 0 ) then
   begin
     fStartPt := Point(X, Y);
     fEndPt := Point(X, Y);
     fLastPt := fStartPt;
   end
  else
   Cnv.MoveTo(X, Y);
end;

procedure TDecorativePen.LineTo(Cnv: TCanvas; X, Y: Integer);
begin
  if( fPStyle.Size > 0 ) then
   begin
     fEndPt := Point(X, Y);
     fCnv := Cnv;
     CallLineDDA;
     fStartPt := Point(X, Y);
     fLastPt := fStartPt;
   end
  else
   Cnv.LineTo(X, Y);
end;

procedure TDecorativePen.TextOut(Cnv: TCanvas; X, Y: Integer; s: string);
begin
   Cnv.Font.Name := 'MS Sans Serif';      //agl
   Cnv.Font.Charset := DEFAULT_CHARSET;   //agl

   Cnv.TextOut(X, Y, s);
end;

procedure TDecorativePen.Polyline(Cnv: TCanvas; Pts: Pointer; NPts: Integer);
type
  TPoints = array[0..0] of TPoint;
var
  Cont: Integer;
  TmpPts: ^TPoints;
begin
  if NPts <= 1 then
   Exit;
  TmpPts := Pts;
  if( fPStyle.Size > 0 ) then
   begin
     fCnv := Cnv;
     fCurBit := 0;
     fLastPt := TmpPts^[0];
     for Cont := 0 to NPts - 2 do
      begin
        if Cont > 0 then
         fStartPt := fLastPt
        else
         fStartPt := TmpPts^[Cont];
        fEndPt := TmpPts^[Cont + 1];
        CallLineDDA;
      end;
   end
  else
   Windows.Polyline(Cnv.Handle, TmpPts^, NPts);
end;

procedure TDecorativePen.SetPenStyle(const SString: String);
var
  Cont: Integer;
begin
  fPStyle.Size := Length(SString);
  for Cont := 1 to fPStyle.Size do
   if SString[Cont] = '1' then
    SetBit(Cont - 1, True)
   else
    SetBit(Cont - 1, False);
end;

{ -----------  T2DPoint --------- }
constructor T2DPoint.Create;
begin
  inherited Create;
  fx := 0;
  fy := 0;
end;

procedure T2DPoint.Changed;
begin if Assigned(FOnChange) then FOnChange(Self); end;

procedure T2DPoint.Setx(Value:TRealType);
begin
  If fx<>Value then begin
     Fx:=Value;
     Changed;
  end;
end;

procedure T2DPoint.Sety(Value:TRealType);
begin
  If fy<>Value then begin
     Fy:=Value;
     Changed;
  end;
end;

end.



