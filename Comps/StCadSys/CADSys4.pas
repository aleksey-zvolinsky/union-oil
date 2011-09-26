{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
Unit CADSys4;

Interface

uses SysUtils, Classes, Messages, Windows, Graphics, Controls,
     ClipBrd, ComCtrls, CS4BaseTypes;

type
  TCADVersion = array[1..6] of Char;
  TSourceBlockName = array[0..12] of Char;
  TCanvasCopyMode =(cmNone, cmAspect);
  TCanvasCopyView =(cvActual, cvExtension, cvScale);
  TGroupMode = (gmAllInside, gmCrossFrame);
  TLayerName = String[31];
  TRulerOrientationType = (otOrizontal, otVertical);
  TOrtoViewType = (vtFront, vtSide, vtTop);
  TOrtoDirectionType = (dtAhead, dtBehind);
  TStreamType = (stDrawing, stLibrary);
  ECADSysException = class(Exception);
  ECADOutOfBound = class(ECADSysException);
  ECADObjClassNotFound = class(ECADSysException);
  ECADSourceBlockIsReferenced = class(ECADSysException);
  ECADFileNotValid = class(ECADSysException);
  ECADListObjNotFound = class(ECADSysException);
  ECADListBlocked = class(ECADSysException);

  TCADCmp = class;
  TCADCmp2D = class;
  TCADViewport = class;
  TCADViewport2D = class;
  TObject2D = class;
  TGraphicObjList = class;
  TGraphicObject = class;

  TOnChangePointsSet = procedure(Sender: TObject) of Object;
  TAddObjectEvent = procedure(Sender: TObject; Obj: TGraphicObject) of object;
  TBadVersionEvent = procedure(Sender: TObject; const StreamType: TStreamType; const Stream: TStream; var Resume: Boolean) of object;
  TOnLoadProgress = procedure(Sender: TObject; ReadPercent: Byte) of object;
  TOnSaveProgress = procedure(Sender: TObject; SavedPercent: Byte) of object;
  TMouseEvent2D = procedure(Sender: TObject; Button: TMouseButton; Shift: TShiftState; WX, WY: TRealType; X, Y: Integer) of Object;
  TMouseMoveEvent2D = procedure(Sender: TObject; Shift: TShiftState; WX, WY: TRealType; X, Y: Integer) of Object;

  TPointsSet2D = class(TObject)
  private
    fPoints: Pointer;
    fCapacity, fCount: Word;
    fGrownEnabled, fDisableEvents: Boolean;
    fOnChange: TOnChangePointsSet;
    fTag: Integer;

    procedure SetDisableEvents(B: Boolean);
    procedure CallOnChange;
    function  GetExtension: TRect2D;
    procedure PutProp(Index: Word; const Item: TPoint2D);
    procedure Expand(const NewCapacity: Integer);
  protected
    function  Get(Index: Word): TPoint2D; virtual;
    procedure Put(PutIndex, ItemIndex: Word; const Item: TPoint2D); virtual;
  public
    constructor Create(const _Capacity: Word); virtual;
    destructor Destroy; override;
    procedure Clear;
    procedure Copy(const S: TPointsSet2D; const StIdx, EndIdx: Integer);
    procedure Add(const Item: TPoint2D);
    procedure AddPoints(const Items: array of TPoint2D);
    procedure TransformPoints(const T: TTransf2D);
    procedure Delete(const Index: Word);
    procedure Insert(const Index: Word; const Item: TPoint2D);
    procedure DrawAsPolygon(const Cnv: TDecorativeCanvas; const Clip, Extent: TRect2D; const S: TTransf2D);
    procedure DrawAsPolyline(const Cnv: TDecorativeCanvas; const Clip, Extent: TRect2D; const S: TTransf2D);
    procedure DrawAsClosedPolyline(const Cnv: TDecorativeCanvas; const Clip, Extent: TRect2D; const S: TTransf2D);
    procedure DrawSubsetAsPolygon(const Cnv: TDecorativeCanvas; const Clip, Extent: TRect2D; const S: TTransf2D; const StartIdx, EndIdx: Integer);
    procedure DrawSubsetAsPolyline(const Cnv: TDecorativeCanvas; const Clip, Extent: TRect2D; const S: TTransf2D; const StartIdx, EndIdx: Integer; const ToBeClosed: Boolean);
    property Extension: TRect2D read GetExtension;
    property Points[Index: Word]: TPoint2D read Get write PutProp; default;
    property Count: Word read fCount;
    property Capacity: Word read fCapacity;
    property DisableEvents: Boolean read fDisableEvents write SetDisableEvents;
    property GrowingEnabled: Boolean read fGrownEnabled write fGrownEnabled;
    property PointsReference: Pointer read fPoints;
    property Tag: Integer read fTag write fTag;
    property OnChange: TOnChangePointsSet read fOnChange write fOnChange;
  end;
  TClearCanvas = procedure(Sender: TObject; Cnv: TCanvas; const ARect: TRect2D; const BackCol: TColor) of Object;

  TGraphicObject = class(TInterfacedObject)
  private
    fID, fTag: LongInt;
    fLayer: Byte;
    fVisible, fEnabled, fToBeSaved: Boolean;
    fOnChange: TNotifyEvent;
    fOwnerCAD: TCADCmp;
  protected
    procedure _UpdateExtension; virtual; abstract;
  public
    constructor Create(ID: LongInt);
    constructor CreateFromStream(const Stream: TStream; const Version: TCADVersion); virtual;
    procedure SaveToStream(const Stream: TStream); virtual;
    procedure Assign(const Obj: TGraphicObject); virtual;
    procedure UpdateExtension(Sender: TObject);
    property ID: LongInt read fID write fID;
    property Layer: Byte read fLayer write fLayer;
    property Visible: Boolean read fVisible write fVisible;
    property Enabled: Boolean read fEnabled write fEnabled;
    property ToBeSaved: Boolean read fToBeSaved write fToBeSaved;
    property OwnerCAD: TCADCmp read fOwnerCAD;
    property Tag: LongInt read fTag write fTag;
    property OnChange: TNotifyEvent read fOnChange write fOnChange;
  end;

  TGraphicObjectClass = class of TGraphicObject;

  TCADSysSynchroObject = class(TObject)
  public
    procedure Acquire; virtual;
    procedure Release; virtual;
  end;

{: For Internal use of CADSys library.
}
  TCADSysCriticalSection = class(TCADSysSynchroObject)
  private
    FSection: TRTLCriticalSection;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Acquire; override;
    procedure Release; override;
    procedure Enter;
    procedure Leave;
  end;

  TGraphicObjIterator = class(TObject)
  private
    fCurrent: Pointer;
    fSourceList: TGraphicObjList;

    function GetCurrentObject: TGraphicObject;
    function SearchBlock(ID: LongInt): Pointer;
    function GetCount: Integer;
    constructor Create(const Lst: TGraphicObjList); virtual;
  public
    destructor Destroy; override;
    function Search(const ID: LongInt): TGraphicObject;
    function Next: TGraphicObject;
    function Prev: TGraphicObject;
    function First: TGraphicObject;
    function Last: TGraphicObject;
    property Count: LongInt read GetCount;
    property Current: TGraphicObject read GetCurrentObject;
    property SourceList: TGraphicObjList read fSourceList;
    property Items[const ID: LongInt]: TGraphicObject read Search; default;
  end;

  TExclusiveGraphicObjIterator = class(TGraphicObjIterator)
  private
    constructor Create(const Lst: TGraphicObjList); override;
  public
    destructor Destroy; override;
    procedure DeleteCurrent;
    procedure RemoveCurrent;
  end;

  TGraphicObjList = class(TObject)
  private
    fHead, fTail: Pointer;
    fHasExclusive, fFreeOnClear: Boolean;
    fIterators: Integer; { Usato come semaforo. }
    fCount: LongInt;
    fListGuard: TCADSysCriticalSection;

    procedure DeleteBlock(ObjToDel: Pointer);
    procedure RemoveBlock(ObjToDel: Pointer);
    function  GetHasIter: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const Obj: TGraphicObject);
    procedure AddFromList(const Lst: TGraphicObjList);
    procedure Insert(const IDInsertPoint: LongInt; const Obj: TGraphicObject);
    procedure Move(const IDToMove, IDInsertPoint: LongInt);
    function  Delete(const ID: LongInt): Boolean;
    function  Remove(const ID: LongInt): Boolean;
    function  Find(const ID: LongInt): TGraphicObject;
    procedure Clear;
    function  GetIterator: TGraphicObjIterator;
    function  GetExclusiveIterator: TExclusiveGraphicObjIterator;
    function  GetPrivilegedIterator: TExclusiveGraphicObjIterator;
    procedure RemoveAllIterators;
    property Count: LongInt read fCount;
    property HasIterators: Boolean read GetHasIter;
    property HasExclusiveIterators: Boolean read fHasExclusive;
    property FreeOnClear: Boolean read fFreeOnClear write fFreeOnClear;
  end;

{: It is a indexed list of objects, that can be accessed in an array-like
   mode.
}
  TIndexedObjectList = class(TObject)
  private
    fListMemory: Pointer;
    fNumOfObject: Integer;
    fFreeOnClear: Boolean;

    procedure SetListSize(N: Integer);
    procedure SetObject(Idx: Integer; Obj: TObject);
    function GetObject(Idx: Integer): TObject;
  public
    constructor Create(const Size: Integer);
    destructor Destroy; override;
    procedure Clear;
    property Objects[Idx: Integer]: TObject read GetObject write SetObject; default;
    property NumberOfObjects: Integer read fNumOfObject write SetListSize;
    property FreeOnClear: Boolean read fFreeOnClear write fFreeOnClear;
  end;

  TLayer = class(TObject)
  private
    fPen: TPen;
    fBrush: TBrush;
    fDecorativePen: TDecorativePen;
    fName: TLayerName;
    fActive: Boolean;
    fVisible: Boolean;
    fOpaque: Boolean;
    fHomogen: Boolean;
    fModified: Boolean;
    fStreamable: Boolean;
    fIdx: Byte;
    fTag: LongInt;

    procedure SetName(Nm: TLayerName);
    procedure SetPen(Pn: TPen);
    procedure SetBrush(Br: TBrush);
    procedure Changed(Sender: TObject);
  public
    constructor Create(Idx: Byte);
    destructor Destroy; override;
    procedure SaveToStream(const Stream: TStream); virtual;
    procedure LoadFromStream(const Stream: TStream; const Version: TCADVersion); virtual;
    function  SetCanvas(const Cnv: TDecorativeCanvas): Boolean;
    property Name: TLayerName read fName write SetName;
    property DecorativePen: TDecorativePen read fDecorativePen;
    property Pen: TPen read fPen write SetPen;
    property Brush: TBrush read fBrush write SetBrush;
    property Active: Boolean read fActive write FActive;
    property Visible: Boolean read fVisible write fVisible;
    property Opaque: Boolean read fOpaque write FOpaque;
    property Modified: Boolean read fModified;
    property Homogen: Boolean read fHomogen write fHomogen;
    property Streamable: Boolean read fStreamable write fStreamable;
    property LayerIndex: Byte read fIdx;
    property Tag: LongInt read fTag write fTag;
  end;

  TLayers = class(TObject)
  private
    fLayers: TList;

    function GetLayer(Index: Byte): TLayer;
    function GetLayerByName(const Nm: TLayerName): TLayer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure SaveToStream(const Stream: TStream);
    procedure LoadFromStream(const Stream: TStream; const Version: TCADVersion);
    function  SetCanvas(const Cnv: TDecorativeCanvas; const Index: Byte): Boolean;
    property Layers[Index: Byte]: TLayer read GetLayer; default;
    property LayerByName[const Nm: TLayerName]: TLayer read GetLayerByName;
  end;

  TCADCmp = class(TComponent)
  private
    fVersion: TCADVersion; { The version info is used in file I/O. }
    fListOfObjects, fListOfBlocks: TGraphicObjList; { There are two list. The one of the objects and the one of the blocks. }
    fNextID, fNextBlockID: LongInt; { Contain the next ID to assign. }
    fListOfViewport: TList; { Contains all the Viewports linked. }
    fLayers: TLayers; { Layers of the component. }
    fCurrentLayer: Word;
    fDrawOnAdd: Boolean; { If true the object will be drawn on all viewports and the viewports will be refreshed if an object is added. }
    fRepaintAfterTransform: Boolean; { Repaint all the viewports if an object will be transformed. }
    fHomogen: Boolean;   {Homogén rajz DefaultLayerColor-ral}
    { event handlers. }
    fOnAddObject: TAddObjectEvent;
    fOnVerError: TBadVersionEvent;
    fOnLoadProgress: TOnLoadProgress;
    fOnSaveProgress: TOnSaveProgress;

    function  GetListOfObjects: TGraphicObjIterator;
    function  GetListOfBlocks: TGraphicObjIterator;
    procedure SetListOfObjects(NL: TGraphicObjList);
    procedure SetListOfBlocks(NL: TGraphicObjList);

    function  GetExclusiveListOfObjects: TExclusiveGraphicObjIterator;
    function  GetExclusiveListOfBlocks: TExclusiveGraphicObjIterator;
    function  GetObjectsCount: Integer;
    function  GetSourceBlocksCount: Integer;
    function  GetIsBlocked: Boolean;
    function  GetHasIterators: Boolean;
    procedure SetDefaultLayersColor(const C: TColor);
    function  GetDefaultLayersColor: TColor;
    procedure SetHomogen(Value: Boolean);
    procedure AddViewports(const VP: TCADViewport);
    procedure DelViewports(const VP: TCADViewport);
    function  GetViewport(Idx: Integer): TCADViewport;
    function  GetViewportsCount: Integer;
  protected
    procedure LoadBlocksFromStream(const Stream: TStream; const Version: TCADVersion); virtual; abstract;
    procedure SaveBlocksToStream(const Stream: TStream; const AsLibrary: Boolean); virtual; abstract;
    procedure LoadObjectsFromStream(const Stream: TStream; const Version: TCADVersion); virtual; abstract;
    procedure SaveObjectsToStream(const Stream: TStream); virtual; abstract;
    function AddSourceBlock(ID: LongInt; const Obj: TGraphicObject): TGraphicObject;
    function  FindSourceBlock(const SrcName: TSourceBlockName): TGraphicObject;
    function  GetSourceBlock(ID: LongInt): TGraphicObject;
    function AddObject(ID: LongInt; const Obj: TGraphicObject): TGraphicObject;
    function InsertObject(ID, IDInsertPoint: LongInt; const Obj: TGraphicObject): TGraphicObject;
    function  GetObject(ID: LongInt): TGraphicObject;
    procedure RedrawObject(const Obj: TGraphicObject);
    property ObjectList: TGraphicObjList read fListOfObjects write SetListOfObjects;
    property BlockList: TGraphicObjList read fListOfBlocks write SetListOfBlocks;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure MergeFromStream(const Stream: TStream);
    procedure LoadFromStream(const Stream: TStream);
    procedure SaveToStream(const Stream: TStream);
    procedure LoadLibrary(const Stream: TStream);
    procedure SaveLibrary(const Stream: TStream);
    procedure MergeFromFile(const FileName: String);
    procedure LoadFromFile(const FileName: String);
    procedure SaveToFile(const FileName: String);
    procedure DeleteSourceBlockByID(const ID: LongInt);
    procedure DeleteAllSourceBlocks;
    procedure DeleteSavedSourceBlocks; virtual; abstract;
    procedure DeleteLibrarySourceBlocks; virtual; abstract;
    procedure ChangeObjectLayer(const ID: LongInt; const NewLayer: Byte);
    procedure MoveObject(const IDOrigin, IDDestination: LongInt);
    procedure DeleteObject(const ID: LongInt);
    procedure RemoveObject(const ID: LongInt);
    procedure DeleteAllObjects;
    procedure RepaintViewports; virtual;
    procedure RefreshViewports; virtual;
    procedure SetDefaultBrush(const Brush: TBrush);
    procedure SetDefaultPen(const Pen: TPen);
    property ObjectsIterator: TGraphicObjIterator read GetListOfObjects;
    property SourceBlocksIterator: TGraphicObjIterator read GetListOfBlocks;
    property ObjectsExclusiveIterator: TExclusiveGraphicObjIterator read GetExclusiveListOfObjects;
    property SourceBlocksExclusiveIterator: TExclusiveGraphicObjIterator read GetExclusiveListOfBlocks;
    property Layers: TLayers read fLayers;
    property CurrentLayer: Word read fCurrentLayer write fCurrentLayer;
    property Version: TCADVersion read fVersion write fVersion;
    property ObjectsCount: Integer read GetObjectsCount;
    property SourceBlocksCount: Integer read GetSourceBlocksCount;
    property IsBlocked: Boolean read GetIsBlocked;
    property HasIterators: Boolean read GetHasIterators;
    property Viewports[Idx: Integer]: TCADViewport read GetViewport;
    property ViewportsCount: Integer read GetViewportsCount;
  published
    property DrawOnAdd: Boolean read fDrawOnAdd write fDrawOnAdd default False;
    property RepaintAfterTransform: Boolean read fRepaintAfterTransform write fRepaintAfterTransform default True;
    property DefaultLayersColor: TColor read GetDefaultLayersColor write SetDefaultLayersColor default clBlack;
    property Homogen: Boolean read fHomogen write SetHomogen default False;
    property OnLoadProgress: TOnLoadProgress read fOnLoadProgress write fOnLoadProgress;
    property OnSaveProgress: TOnSaveProgress read fOnSaveProgress write fOnSaveProgress;
    property OnAddObject: TAddObjectEvent read fOnAddObject write fOnAddObject;
    property OnInvalidFileVersion: TBadVersionEvent read fOnVerError write fOnVerError;
  end;

  TCADViewport = class(TCustomControl)
  private
    fViewGuard: TCADSysCriticalSection;
    fCADCmp: TCADCmp;
    fCentrum : T2DPoint;
    fDrawMode: Cardinal;
    fVisualWindow: TRect2D; { The current viewport on the view plane. }
    fViewportToScreen, fScreenToViewport: TTransf2D; { To speed the inversion of the matrix I keep either. }
    fAspectRatio: TRealType;
    fRubberPenColor, fBackGroundColor, fGridColor, fControlPointsColor, fCentralCrossColor: TColor;
    fRubberPen: TPen;
    fOffScreenBitmap: TBitmap;
    fOffScreenCanvas: TDecorativeCanvas;
    fOnScreenCanvas: TDecorativeCanvas;
    fCopingFrequency: Integer; { Indica ogni quanto copiare il buffbitmap sul canvas quando si usa il threading. }
    fShowControlPoints, fShowGrid, fShowCentralCross, fInUpdate: Boolean;
    fControlPointsWidth: Byte;
    fGridDeltaX,
    fGridDeltaY,
    fGridSubX,
    fGridSubY: TRealType;
    fGridOnTop: Boolean;
    fTransparent: Boolean;
    fViewportObjects: TGraphicObjList;
    fOnClear: TClearCanvas;
    fDisablePaintEvent, fDisableMouseEvents: Boolean;
    fOnPaint, fOnResize, fOnBeginRedraw, fOnEndRedraw: TNotifyEvent;
    fOnViewMappingChanged: TNotifyEvent;
    fOnMouseEnter, fOnMouseLeave: TNotifyEvent;

    { Multithread support. }
    fPaintingThread: TObject;
    fUseThread: Boolean;

    { Set method for the property. }
    procedure SetRubberColor(const Cl: TColor);
    procedure SetBackColor(const Cl: TColor);
    procedure SetTransparent(const B: Boolean);
    procedure SetGridColor(const Cl: TColor);
    procedure SetShowGrid(const B: Boolean);
    procedure SetShowCentralCross(const B: Boolean);
    procedure SetCentralCrossColor(const Cl: TColor);
    procedure SetOnClearCanvas(const H: TClearCanvas);
    procedure ClearCanvas(Sender: TObject; Cnv: TCanvas; const ARect: TRect2D; const BackCol: TColor);
    procedure DoCopyCanvas(const GenEvent: Boolean);
    procedure DoCopyCanvasThreadSafe;
    procedure CalibrateCnv(const Cnv: TCanvas; XScale, YScale: TRealType);
    procedure ChangeViewportTransform(ViewWin: TRect2D);
    procedure StopPaintingThread;
    procedure UpdateViewport(const ARect: TRect2D); { repaint all the objects contained in ARect. }
    function  GetInRepaint: Boolean;
    procedure DoResize;
    procedure CopyBitmapOnCanvas(const DestCnv: TCanvas; const Bmp: TBitmap; IRect: TRect; IsTransparent: Boolean; TransparentColor: TColor);
    procedure SetDeltaX(const V: TRealType);
    procedure SetDeltaY(const V: TRealType);
    procedure SetSubX(const V: TRealType);
    procedure SetSubY(const V: TRealType);
    procedure SetShowControlPoints(V: Boolean);
    function  GetCentrum:T2DPoint;
    procedure SetCentrum(Value:T2DPoint);
    procedure CentrumChange(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    function CreateOffScreenCanvas(const Cnv: TCanvas): TDecorativeCanvas; dynamic;
    procedure OnThreadEnded(Sender: TObject); dynamic;
    procedure CopyBackBufferRectOnCanvas(const Rect: TRect; const GenEvent: Boolean); dynamic;
    procedure SetCADCmp(Cad: TCADCmp); virtual;
    procedure Paint; override; { Repaint all the objects. }
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    function  BuildViewportTransform(var ViewWin: TRect2D; const ScreenWin: TRect; const AspectRatio: TRealType): TTransf2D; virtual;
    procedure DrawGrid(const ARect: TRect2D; const Cnv: TCanvas); virtual;
    procedure DrawCentralCross(const ARect: TRect2D; const Cnv: TCanvas); virtual;
    procedure DrawObject(const Obj: TGraphicObject; const Cnv: TDecorativeCanvas; const ClipRect2D: TRect2D); virtual; abstract;
    procedure DrawObjectWithRubber(const Obj: TGraphicObject; const Cnv: TDecorativeCanvas; const ClipRect2D: TRect2D); virtual; abstract;
    procedure CopyRectToCanvas(CADRect: TRect2D; const CanvasRect: TRect; const Cnv: TCanvas; const Mode: TCanvasCopyMode); virtual; abstract;
    function  GetCopyRectViewportToScreen(CADRect: TRect2D; const CanvasRect: TRect; const Mode: TCanvasCopyMode): TTransf2D; virtual;
    function  GetViewportToScreen: TTransf2D; virtual;
    function  GetScreenToViewport: TTransf2D; virtual;
    {: This method returns the width of a pixel in world coordinates.
       This method is used }
    function  GetPixelAperture: TPoint2D; virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    {: The back-buffer bitmap. }
    property OffScreenBitmap: TBitmap read fOffScreenBitmap;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    {: This method forces to rebuild the mapping tranform.

       When the visual rect change this method will be called and the
       viewport repainted. If you want to force the mapping tranform
       to be updated call this method (this is useful when you derive a
       new viewport that has its own projection transform).
    }
    procedure UpdateViewportTransform;
    {: This method scale the visual rect to correspond to a speficied
       dimension in millimeters.

       <I=XScale> is the horizontal scale so that 1 drawing unit
       will be 1/XScale millimeters, <I=YScale> is the vertical scale
       so that 1 drawing unit will be 1/YScale millimeters. For example
       if XScale=2 then a rectangle wide 50 drawing units will be
       25 mm wide.

       <B=Note>: The method relies on the Windows setting for
       HORZRES and VERTRES of a device. Some times (this is true
       most of the time for a screen) these values are not
       correctly set and so the resulting drawing might have
       an incorrect dimension.
    }
    procedure Calibrate(const XScale, YScale: TRealType);
    {: This method set the visual rect to a specified rectangle.
    }
    procedure ZoomWindow(const NewWindow: TRect2D);
    {: This method moves the current visual rect to a specified
       position.
    }
    procedure MoveWindow(const NewStartX, NewStartY: TRealType);

    procedure ZoomIn;
    procedure ZoomInExt(percent:extended);
    procedure ZoomOut;
    procedure ZoomOutExt(percent:extended);
    {: This method zooms the drawing so that all of it is visible.
    }
    procedure ZoomToExtension; virtual; abstract;
    procedure PanWindow(const DeltaX, DeltaY: TRealType);
    {: This method copy the current viewport contents in another canvas.

       <I=Cnv> is the destination canvas; <I=Mode> is the mode of the
       copy (see <See Type=TCanvasCopyMode>); <I=View> is the view to
       be copied (see <See Type=TCanvasCopyView>); <I=XScale> and
       <I=YScale> are used only if <I=View> is <I=cvScale> and have
       the same meaning of <I=XScale> and <I=YScale> of the
       <See Method=TCADViewport@Calibrate> method.

       The diplay list is traversed and the objects are drawed onto
       the destination canvas. This method is useful to copy the
       current view (or the extension of the drawing) to the clipboard
       as a bitmap or metafile (depending on the type of canvas) picture.
       It is also useful in printing the drawing on the printer, when
       the destination canvas is the canvas of the printer.

       See also <See Method=TCADViewport@CopyToClipboard>.
    }
    procedure CopyToCanvas(const Cnv: TCanvas; const Mode: TCanvasCopyMode;
        const View: TCanvasCopyView; const XScale, YScale: TRealType); virtual;
    {: This method copy the current viewport contents to the clipboard.}
    procedure CopyToClipboard(const Clp: TClipboard);
    {: This method start a group of updates so that only one repainting
       of the viewport take place at the end of the group.

       Normally the viewport is repainted as soon as the visual rect is
       changed. If you want to perform a group of such changes to obtain
       a special visual rect, the viewport is repainted a lot of times,
       reducing the performance of your application (specially if the
       drawing is complex). To resolve this problem you may want to call
       this method just before starting to changes to the visual rect, and
       then calling <See Method=TCADViewport@EndUpdate> to end the group.
       When you call <See Method=TCADViewport@EndUpdate> the visual rect is
       changed and the viewport is repainted. Only one
       <See Property=TCADViewport@OnPaint> event is fired.
    }
    procedure BeginUpdate;
    {: This method end a group of updates so that only one repainting
       of the viewport take place at the end of the group. }
    procedure EndUpdate;
    procedure Repaint; override;
    procedure Invalidate; override;
    procedure Refresh;
    procedure RepaintRect(const ARect: TRect2D);
    {: This method refreshes a portion of the viewport contents.

       The refresh consist of a copy of the off screen buffer on the
       canvas of the control. This refresh is very useful to remove
       spurious drawings of objects drawed directly on the canvas of
       the control. Only the portion specified by <I=ARect> is
       copied.

       This process is faster than repainting the viewport but
       don't reflect changing in the objects already drawed by a repaint.
    }
    procedure RefreshRect(const ARect: TRect);
    {: This method interrupts a repaint process.

       Only if you are using the painting threads this method is
       able to interrupt a repaint process. Otherwise it does nothing.
    }
    procedure StopRepaint;
    {: Wait for the painting thread to be finished.

       When you use the painting thread to repaint the viewport, you
       may want to wait for it to be finished. This method returns
       only when the active painting thread (if any) is finished.

       If you don't use the painting threads to repaint the viewport
       this method does nothing.
    }
    procedure WaitForRepaintEnd;
    {: This method returns the 2D point in view plane coordinates that
       correspond to the specified point in Windows screen coordinates.

       <I=SPt> is the 2D point in Windows screen coordinates to be
       transformed. It is of type <See Type=TPoint2D> but in fact it
       corresponds to a TPoint. Use <See function=PointToPoint2D>
       function to obtain this value.

       This method is useful to mimics the viewport mapping to the screen.
    }
    function  ScreenToViewport(const SPt: TPoint2D): TPoint2D; virtual;
    {: This method returns the point in Windows screen coordinates
       that correspond to a specified point in view plane coordinates.

       <I=WPt> is the 2D point in view plane coordinates to be
       transformed. The resulting point is of type <See Type=TPoint2D>
       but in fact it corresponds to a TPoint. Use <See function=Point2DToPoint>
       function to obtain the TPoint value from the result.
    }
    function  ViewportToScreen(const WPt: TPoint2D): TPoint2D; virtual;
    {: This method returns the width of a square in pixel in view plane coordinates.
       This method is used
       by the <See Method=TCADViewport2D@PickObject> (<See Method=TCADViewport3D@PickObject>)
       method.

       <I=L> is the width of the square in pixel that must be trasformed in
       view plane coordinates.
    }
    function  GetAperture(const L: Word): TRealType;
    {: This method sets the viewport with the settings of the specified
       layer.

       The method returns <B=True> if the layer is visible.
    }
    function SetLayer(const L: TLayer): Boolean;
    {: This property contains the <See Class=TCADCmp> control that
       acts as the source for the drawing to be painted in the
       viewport.

       The CADCmp contains the display list of the drawing that will
       be rendered in the canvas of the viewport control.

       You must assign it before using the viewport.
    }
    property CADCmp: TCADCmp read fCADCmp write SetCADCmp;
    {: This property contains the off screen canvas used to
       store the drawing before copying it to the canvas of the
       control.

       By using an off screen buffer the flickering is greatly
       reduced.

       See also <See Class=TDecorativeCanvas@TDecorativeCanvas>.
    }
    property OffScreenCanvas: TDecorativeCanvas read fOffScreenCanvas;
    {: This property contains the on-screen canvas used to
       draw directly on screen.

       See also <See Class=TDecorativeCanvas@TDecorativeCanvas>.
    }
    property OnScreenCanvas: TDecorativeCanvas read fOnScreenCanvas;
    {: This property contains the mapping transform from the
       view plane coordinate system to the Windows screen coordinate
       system.

       This transform matrix is computed in the
       <See Method=TCADViewport@BuildViewportTransform> method.
    }
    property ViewportToScreenTransform: TTransf2D read GetViewportToScreen;
    {: This property contains the mapping transform from the
       Windows screen coordinate system to the view plane coordinate system.

       This transform matrix is computed as the inverse of the
       transform returned by the
       <See Method=TCADViewport@BuildViewportTransform> method.
    }
    property ScreenToViewportTransform: TTransf2D read GetScreenToViewport;
    {: This property may contains a <See Class=TGraphicObjList> instance
       to be used instead of the display list of the associated TCADCmp
       control.

       If this property references an instance then it will be used
       in the <See Method=TCADViewport@Repaint> method. Otherwise the
       object's list of the associated TCADCmp is used.
    }
    property ViewportObjects: TGraphicObjList read fViewportObjects write fViewportObjects;
    {: This property is <B=True> when the viewport is inside an
       update block.

       See also <See Method=TCADViewport@BeginUpdate> and
       <See Method=TCADViewport@EndUpdate>.
    }
    property InUpdating: Boolean read fInUpdate;
    {: This property is <B=True> when the viewport is traversing the
       diplay list.

       When you call the <See Method=TCADViewport@Repaint> method this
       property becames <B=True>.
    }
    property InRepainting: Boolean read GetInRepaint;
    {: This property is used to inhibit the mouse events fired by the
       viewport.

       If it is <B=False> (the default) the mouse event are fired by
       the control, otherwise they are not.
    }
    property DisableMouseEvents: Boolean read fDisableMouseEvents write fDisableMouseEvents;
    {: This property is used to inhibit the repaint event fired by the
       viewport when it has repainted.

       If it is <B=False> (the default) the <See Property=TCADViewport@OnPaint>
       event is fired when the repaint process is finished, otherwise it is not.
    }
    property DisableRepaintEvents: Boolean read fDisablePaintEvent write fDisablePaintEvent;
    {: This property may contains an integer value that is passed
       to the drawing methods of the graphics object being rendered on
       the viewport.

       This is used to change the way in which the objects are drawed
       (for instance backface culled, only bounding boxes and so on).

       Normally this value contains a bit field that is checked by
       the object.
    }
    property DrawMode: Cardinal read fDrawMode write fDrawMode;
    {: This property contains the pen istance used in the rubber
       pen method.

       When the <See Method=TCADViewport@DrawObjectWithRubber> method
       is called the canvas on which draw the object is set with
       this pen. By default this method contains a pen with the
       style property equal to <B=psXOr> and color <B=clRed>.

       See also <See Property=TCADViewport@RubberPenColor> to change the
       color of the pen.
    }
    property RubberPen: TPen read fRubberPen;
  published
    property Align;
    property Enabled;
    property Visible;
    property PopupMenu;
    property Height default 50;
    property Width default 50;
    {: This property contains the aspect ratio of the viewport.

       The aspect ratio is the ratio Width/Heigth of the visual rect
       that must be preserved.

       If it is 0.0 (the default) no aspect ration is preserved and
       the visual rect may take any shape. Otherwise the visual rect
       is forced to have the given aspect ratio.

       <B=Note>: This aspect is not the one of the screen that is taken
       into account automatically.
    }
    property AspectRatio: TRealType read FAspectRatio write FAspectRatio;
    {: This property contains the color of the <See Property=TCADViewport@RubberPen>
       pen.

       This color take into account the fact that the rubber pen is in
       XOr style.

       By default it is <B=clRed>.
    }
    property RubberPenColor: TColor read fRubberPenColor write SetRubberColor default clRed;
    {: This property contains the filling color of the control
       points.

       By default it is <B=clRed>.
    }
    property ControlPointsColor: TColor read fControlPointsColor write fControlPointsColor default clRed;
    {: This property contains the color of the background of the viewport.

       By default it is <B=clSilver>.
    }
    property BackGroundColor: TColor read FBackGroundColor write SetBackColor default clSilver;
    {: This property contains the color of reference grid of the viewport.

       By default it is <B=clGray>.
    }
    property GridColor: TColor read FGridColor write SetGridColor default clGray;
    property Centrum : T2DPoint read fCentrum write SetCentrum;
    property CentralCrossColor: TColor read FCentralCrossColor write SetCentralCrossColor default clBlack;

    {: This property specify the Z-order of the grid respect to
       the drawing. If it is false (the default) the grid will be
       drawed before any other shape and so will be covered by
       the drawing, otherwise it will be on top.
    }
    property GridOnTop: Boolean read fGridOnTop write fGridOnTop default False;
    {: This property contains the main step of the reference grid along
       the X axis.

       The grid property is now subdivided in four different parts:
       - GridDeltaX, GridDeltaY are equivalent to the old GridStep property
       - GridSubX, GridSubY are the number of subdivision of GridDelta?

       For example the following configuration:
       - GridDeltaX=10, GridDeltaY=10, GridSubX=5, GridSubY=5
       means a grid with a step of 10units along X and Y, and every 2
       units a dotted line.
    }
    property GridDeltaX: TRealType read fGridDeltaX write SetDeltaX;
    {: This property contains the main step of the reference grid along
       the Y axis.

       The grid property is now subdivided in four different parts:
       - GridDeltaX, GridDeltaY are equivalent to the old GridStep property
       - GridSubX, GridSubY are the number of subdivision of GridDelta?

       For example the following configuration:
       - GridDeltaX=10, GridDeltaY=10, GridSubX=5, GridSubY=5
       means a grid with a step of 10units along X and Y, and every 2
       units a dotted line.
    }
    property GridDeltaY: TRealType read fGridDeltaY write SetDeltaY;
    {: This property contains the sub step of the reference grid along
       the X axis.

       The grid property is now subdivided in four different parts:
       - GridDeltaX, GridDeltaY are equivalent to the old GridStep property
       - GridSubX, GridSubY are the number of subdivision of GridDelta?

       For example the following configuration:
       - GridDeltaX=10, GridDeltaY=10, GridSubX=5, GridSubY=5
       means a grid with a step of 10units along X and Y, and every 2
       units a dotted line.
    }
    property GridSubX: TRealType read fGridSubX write SetSubX;
    {: This property contains the sub step of the reference grid along
       the Y axis.

       The grid property is now subdivided in four different parts:
       - GridDeltaX, GridDeltaY are equivalent to the old GridStep property
       - GridSubX, GridSubY are the number of subdivision of GridDelta?

       For example the following configuration:
       - GridDeltaX=10, GridDeltaY=10, GridSubX=5, GridSubY=5
       means a grid with a step of 10units along X and Y, and every 2
       units a dotted line.
    }
    property GridSubY: TRealType read fGridSubY write SetSubY;
    {: An object can have control points. This property sets the
       dimension in pixels of these control points when they are
       drawed.
    }
    property ControlPointsWidth: Byte read FControlPointsWidth write FControlPointsWidth default 6;
    {: An object can have control points. If this property is <B=True> the
       control points are drawed with the object (if it has them).
    }
    property ShowControlPoints: Boolean read FShowControlPoints write SetShowControlPoints default False;
    {: If this property is <B=True> the reference grid of the viewport
       will be drawed.
    }
    property ShowGrid: Boolean read FShowGrid write SetShowGrid default False;
    property ShowCentralCross: Boolean read FShowCentralCross write SetShowCentralCross default False;
    {: If this property is <B=True> a painting thread is used for
       the repaint process.

       The library can use a thread for the traversing of display list.
       Such a painting thread is a specilized process that runs parallel to
       the main thread of the application. A viewport can have only one
       running thread that can be interrupted at any moment by calling the
       <See Method=TCADViewport@StopRepaint>.

       Different viewports can have their own threads running
       concurrently, fasting the repainting process. They are also useful
       to allow the user to change the view parameters dinamically in
       real time.

       However when a painting thread is used, the repaint process take
       more time than if the thread use is disabled. For this the use
       of a painting thread is advisable only when there are more than
       an hundred of object to be drawed.

       By default it is <B=False>.
    }
    property UsePaintingThread: Boolean read fUseThread write fUseThread default False;
    {: This property contains the portion of the view plane that is
       rendered in the canvas of the control.

       Only the objects contained in this portion of the plane are
       drawed on the screen (by using clipping).
    }
    property VisualRect: TRect2D read fVisualWindow write ZoomWindow;
    {: If this property is <B=True> the the viewport will be transparent.

       By default it is <B=False>.

      <B=Note>: the transparency is avaiable only at run-time.
    }
    property IsTransparent: Boolean read fTransparent write SetTransparent default False;
    {: This property contains the number of objects that are drawed
       before the off screen buffer is copied onto the canvas of the
       control.

       By default its value is 100.

       Lower values make the repainting process slower.
    }
    property CopingFrequency: Integer read fCopingFrequency write fCopingFrequency default 0;
    {: This property may contain an event handler that is called
       just before a repaint operation is being started.
    }
    property OnBeginRedraw: TNotifyEvent read FOnBeginRedraw write FOnBeginRedraw;
    {: This property may contain an event handler that is called
       called after a repaint is finished (after the coping of the back buffer
       onto the on screen canvas).

       This event is fired before the <See Property=TCADViewport@OnPaint> event.
    }
    property OnEndRedraw: TNotifyEvent read FOnEndRedraw write FOnEndRedraw;
    {: This property may contain an event handler that is called
       after the back buffer is copied onto the on screen canvas.

       This event is fired after the <See Property=TCADViewport@OnEndRedraw>
       event.
    }
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
    {: This property may contais an event handler that is called
       when the dimensions of the control are changed (and the
       off screen buffer is changed accordingly).

       The event is fired after the dimensions and the mapping
       trasforms are updated but before the repaint process take
       in place (and so before the
       <See Property=TCADViewport@OnPaint> event).
    }
    property OnResize: TNotifyEvent read FOnResize write FOnResize;
    {: This property may contains an event handler that is called when
       the view mapping transform is changed.

       This event is fired before the <See Property=TCADViewport@OnPaint> event.

       See also <See Method=TCADViewport@BuildViewportTransform>.
    }
    property OnViewMappingChanged: TNotifyEvent read fOnViewMappingChanged write fOnViewMappingChanged;
    property OnEnter;
    property OnExit;
    property OnMouseEnter: TNotifyEvent read fOnMouseEnter write fOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read fOnMouseLeave write fOnMouseLeave;
    property OnDblClick;
    property OnKeyDown;
    property OnKeyUp;
    property OnKeyPress;
    {: This property may contains an event handler that is called when
       the off screen buffer must be cleared before the drawing process.

       By default the off screen buffer is cleared with an uniform
       filling with the <See Property=TCADViewport@BackgroundColor> color.

       See also <See Type=TClearCanvas>.
    }
    property OnClearCanvas: TClearCanvas read fOnClear write SetOnClearCanvas;
  end;

  {: This class defines a ruler that can be linked to a Viewport to
     show the extension of its <See Property=TCADViewport@VisualRect>.

     The components isn't updated automatically, instead it defines
     methods that must be called from the application to keep it
     syncronized with the viewport.

     Normally the following events are used for updating the ruler:

     <LI=<I=OnEndRepaint> is used to redraw the ruler and to update
     its dimensions.>
     <LI=<I=OnMouseMove> is used to update the mark position on the
     ruler <See Method=TRuler@SetMark>.>
  }
  TRuler = class(TCustomControl)
  private
    fOwnerView: TCADViewport;
    fStepSize: TRealType;
    fFontSize, fSize, fStepDivisions: Integer;
    fOrientation: TRulerOrientationType;
    fTicksColor: TColor;
    fPrecision: integer;

    procedure SetTicksColor(C: TColor);
    procedure SetOwnerView(V: TCADViewport);
    procedure SetOrientation(O: TRulerOrientationType);
    procedure SetSize(S: Integer);
    procedure SetFontSize(S: Integer);
    procedure SetStepSize(S: TRealType);
    procedure SetStepDivisions(D: Integer);
  protected
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
  public
    {: This is the constructor of the control.

       It creates a vertical white ruler with size of 20 and
       a step division of 5.
    }
    constructor Create(AOwner: TComponent); override;
    procedure Paint; override;
    {: This method is used to move the position marker of the ruler.

       A ruler may have a position marker that is used to show the
       current viewport position on the ruler.

       <I=Value> is the position on the ruler of the mouse in view
       plane reference coordinate. The value to be passed depends
       on the orientation of the ruler. For example a vertical ruler
       may want to show the Y coordinates of the current mouse
       position on the view plane.
    }
    procedure SetMark(Value: TRealType);
  published
    property Align;
    property LinkedViewport: TCADViewport read fOwnerView write SetOwnerView;
    property Color default clWhite;
    property TicksColor: TColor read fTicksColor write SetTicksColor default clBlack;
    property Orientation: TRulerOrientationType read fOrientation write SetOrientation default otVertical;
    property StepSize: TRealType read fStepSize write SetStepSize;
    property StepDivisions: Integer read fStepDivisions write SetStepDivisions default 5;
    property Precision: integer read fPrecision write fPrecision;
    property Size: Integer read fSize write SetSize default 20;
    property FontSize: Integer read fFontSize write SetFontSize default 6;
  end;

  {: This class defines an object that can be used to extend the handling function
     of a 2D shape object. The methods <I=DrawControlPoints> and <I=OnMe> of the class
     are called to respectively to shows the control points (handling points) and
     to returns picking information.
     For instance it is possible to defines handlers to move, rotate objects and
     so on, having them active in different moments allowing different manipulation
     modes on the same shape.

     At the moment only the old way to edit shapes is defined, but it is now more
     easy to add other way to handle shapes.

     An handler can be reused among different shapes or have it associated
     on a particular shape (in this case the HandledObject property will
     be the same as the associated shape.
  }
  TObject2DHandler = class(TObject)
  private
    fHandledObject: TObject2D;
    fRefCount: Integer;
  public
    {: This constructor create a new handler and link it to AObject.
       After the creation of the handler it is possible to show the control points
       defined by the handler and to operate on it.

       <I=AObject> will assume ownership of the handler and so you don't have to
       free it by yourself (it is deleted when the linked object is deleted or
       the handler is unlinked from the shape).

       <B=NOTE>: You will use the <See Class=TObject2D@SetHandler> method to create and
       link the handler to a 2D shape object.
    }
    constructor Create(AObject: TObject2D);
    procedure FreeInstance; override;
    destructor  Destroy; override;
    {: This method is called by the library when it is necessary to show the control
       points.

       An 2D object may have a set of points that are called
       <I=control points> and that control the shape of the
       object. For example a circle may have two control points;
       the center of the circle and a point on the circle that
       specify the radious of it. At the same time it is possible to have
       control points (or better handling points) to operate on an object, like
       a baricentric handler used to move the object.

       <I=VT> is the the mapping transform that can be obtained
       with the <See Property=TCADViewport@ViewportToScreenTransform> property.
       <I=Cnv> is the canvas on which draw the control points, and
       <I=Width> is the width in pixel of the control points (that are
       drawed as a square).
    }
    procedure DrawControlPoints(const Sender: TObject2D; const VT: TTransf2D; const Cnv: TDecorativeCanvas; const Width: Integer); dynamic; abstract;
    {: This returns the part of the object that is picked by a point.

       <I=Pt> is the picking point, <I=Aperture> is the picking aperture
       and <I=Distance> will contains the distance from <I=Pt> to
       the object.

       The method must returns one of these values (ordered from the highest
       priority to the lowest priority):

       <LI=<I=PICK_NOOBJECT> if <I=Pt> is not on the object. Distance
       will became <See const=MaxCoord>.>
       <LI=<I=PICK_INBBOX> if <I=Pt> is inside the bounding box of the
       object. Distance will be equal to Aperture.>
       <LI=<I=PICK_ONOBJECT> if <I=Pt> is on the outline of the object
       with a distance less than Aperture. Distance will be that
       distance.>
       <LI=<I=PICK_INOBJECT> if <I=Pt> is inside the outline of the
       object. Distance will be set to Aperture.>
       <LI=A value greater than or equal to zero if <I=Pt> is on any of
       the control points, in this case the resulting value is that
       control point. Distance will be the distance form the control
       point.
       <LI=A value between -100 and -3. Use this range to define your specific
       pick values to use in your operation tasks.>

       You must use this convention in your implementations of
       the method. (You can use the inherited method if some of these
       condition is the same as in the base class).
    }
    function OnMe(const Sender: TObject2D; Pt: TPoint2D; Aperture: TRealType; var Distance: TRealType): Integer; dynamic; abstract;
    {: This property contains the handled object of the handler.

       If this property is nil the handler is shared among different
       shapes.
    }
    property HandledObject: TObject2D read fHandledObject;
  end;

  TObject2DHandlerClass = class of TObject2DHandler;

  {: A <I=2D graphic object> is a graphic object that is defined on
     a 2D plane.

     The 2D object is defined in a special coordinate system referred
     here as the <I=model coordinate system or model system>. When an object is used by the
     library, the world coordinate system (or world system) are
     needed instead. So the object in model system is transformed by an
     matrix transform to obtain the object in the world system.
     This transform is called the <See Property=TObject2D@ModelTransform>.
     So when an object is drawed, for example, its points are first
     transformed from model system to world system by using this matrix,
     then the view transform (that the concatenation of the
     projection matrix with the mapping matrix) tranform these points
     to obtain the points in the screen system that are easily displayed.

     The 2D object has a 2D bounding box, that is the smallest
     axis aligned rectangle that fully contains the object.
     This rectangle is always in the world coordinate system and
     so it doesn't depend on the model transform. The bounding box
     must be computed in the
     <See Property=TGraphicObject@_UpdateExtension> method that have
     to be redefined.

     The model matrix is split in two parts. The first one, called
     the <I=current model matrix>, can be removed at any time or
     can be post multiplied with a new one.

     The second one, called the <I=saved model matrix>, is stored
     permanently inside the object and can only be removed
     by using the <See Method=TObject2D@RemoveTransform> method
     or substituted with the actual model matrix with the
     <See Method=TObject2D@ApplyTransform> method.
     The actual model matrix is the concatenation of the
     <I=saved model matrix> with the <I=current model matrix> in
     this order (remember that the order of concatenation of transform matrix
     is important).

     The presence of the <I=current model matrix> is helpfull to
     create operations that transform an object interactilvely and
     that can be cancelled if they are not what the user want to do.

     <B=Note>: To save space the <I=current model matrix> and the
     <I=saved model matrix> are stored in the object only if they
     are not equal to the <See const=IdentityTransf2D> constant.
  }
  TObject2D = class(TGraphicObject)
  private
    fSavedTransform, fModelTransform: ^TTransf2D;
    fDrawBoundingBox: Boolean;
    fBox: TRect2D;
    fHandler: TObject2DHandler;
    fName: TObjName;
    procedure SaveTransform(const T: TTransf2D);
  protected
    function  GetModelTransform: TTransf2D; virtual;
    procedure SetModelTransform(Transf: TTransf2D); virtual;
    property  WritableBox: TRect2D read fBox write fBox;
  public
    constructor Create(ID: LongInt);
    destructor Destroy; override;
    constructor CreateFromStream(const Stream: TStream; const Version: TCADVersion); override;
    procedure SaveToStream(const Stream: TStream); override;
    procedure Assign(const Obj: TGraphicObject); override;
    procedure Transform(const T: TTransf2D); dynamic;
    procedure RemoveTransform;
    procedure ApplyTransform; dynamic;
    procedure MoveTo(ToPt, DragPt: TPoint2D);
    function  WorldToObject(const Pt: TPoint2D): TPoint2D;
    function  HasTransform: Boolean; virtual;
    procedure Draw(const VT: TTransf2D; const Cnv: TDecorativeCanvas; const ClipRect2D: TRect2D; const DrawMode: Integer); virtual; abstract;
    function  IsVisible(const Clip: TRect2D; const DrawMode: Integer): Boolean; virtual;
    procedure DrawControlPoints(const VT: TTransf2D; const Cnv: TDecorativeCanvas; const ClipRect2D: TRect2D; const Width: Integer); dynamic;
    function  OnMe(Pt: TPoint2D; Aperture: TRealType; var Distance: TRealType): Integer; dynamic;
    procedure SetSharedHandler(const Hndl: TObject2DHandler);
    procedure SetHandler(const Hndl: TObject2DHandlerClass);
    property Name: TObjName read fName write fName;
    property ModelTransform: TTransf2D read GetModelTransform write SetModelTransform;
    property Box: TRect2D read fBox;
    property DrawBoundingBox: Boolean read fDrawBoundingBox write fDrawBoundingBox;
    property Handler: TObject2DHandler read fHandler;
  end;

  TObject2DClass = class of TObject2D;

  {: This class defines a group of 2D objects, that is a close set
     of objects that share the same model transform.

     A container has a special behaviour for the picking operation.
     Since a container embrace a group of objects, the picking take
     effect at group level returning the ID of the selected object
     instead of its control point.

     A container can be used to group objects that must be moved or
     transformed as a whole. On the other hand, if you want to reuse
     a set of objects in different place on the drawing use the
     <See Class=TSourceBlock2D> class.
  }
  TContainer2D = class(TObject2D)
  private
    { List of objects in the container. }
    fObjects: TGraphicObjList;
  protected
    procedure _UpdateExtension; override;
  public
    {: This is the constructor for the class.

       It creates an instance of the container. This constructor needs:

       <LI=the ID of the container. This identifier univocally identifies
       the object in the CAD. See also <See Method=TCADCmp@AddObject>.>
       <LI=the array of objects that must be added to the set. After
       you have created the container it is possible to add and
       remove objects throught the <See Property=TContainer2D@Objects> property.>

       If you want to create a void container you have to supply an
       array with only one item set to <B=nil> (ie <B=[nil]>).

       The objects in the container are owner by the container
       itself and will be freed when the container is deleted. So it
       isn't possible to share objects between containers.
    }
    constructor Create(ID: LongInt; const Objs: array of TObject2D);
    destructor Destroy; override;
    constructor CreateFromStream(const Stream: TStream; const Version: TCADVersion); override;
    procedure SaveToStream(const Stream: TStream); override;
    procedure Assign(const Obj: TGraphicObject); override;
    {: This method updates the references of the source blocks
       that are used in the container.

       This method is called automatically at the end of the loading
       process from a stream. Indeed when you save a container it
       may contains <See Class=TBlock2D> instances that references
       to <See Class=TSourceBlock2D> instances. When the application
       is closed these references are no longer valid, so the blocks
       must be relinked to the corrent source blocks.

       The method needs the iterator of source blocks list in order
       to relink the blocks. This iterator can be obtained from
       <See Property=TCADCmp@SourceBlocksIterator>.

       The method call the <See Method=TGraphicObject@UpdateExtension>.
    }
    procedure UpdateSourceReferences(const BlockList: TGraphicObjIterator);
    procedure Draw(const VT: TTransf2D; const Cnv: TDecorativeCanvas; const ClipRect2D: TRect2D; const DrawMode: Integer); override;
    procedure DrawControlPoints(const VT: TTransf2D; const Cnv: TDecorativeCanvas; const ClipRect2D: TRect2D; const Width: Integer); override;
    function  OnMe(Pt: TPoint2D; Aperture: TRealType; var Distance: TRealType): Integer; override;
    {: This property contains the list that contians the object in the container.
       The objects in the container are owned by the container itself. Use
       this property to manage these objects. }
    property Objects: TGraphicObjList read fObjects;
  end;

  {: This class defines a group of 2D objects that can be placed
     in different points of the drawing. This is the efficent
     way to compose a drawing from repeated part of it.

     This class defines a template that can be instantiated,
     and any instance has its own model transformation but share
     the same objects of the template. The instances of this
     template are obtained with <See Class=TBlock2D> class.

     This kind of object must be added to the CAD using the
     <See Method=TCADCmp2D@AddSourceBlock> and
     <See Class=TCADCmp2D@BlockObjects> methods.
  }
  TSourceBlock2D = class(TContainer2D)
  private
    fNReference: Word; { Number of reference }
    fName: TSourceBlockName;
    fLibraryBlock: Boolean;
  public
    {: This is the constructor of the class.

       A source block is referenced either by use of its ID or by use
       of its name.
       This constructor needs:

       <LI=the ID of the source block. This identifier univocally
       identify the source block in the CAD.>
       <LI=the name of the source block. The name is of type
       <See Type=TSourceBlockName>.>
       <LI=the array of objects that must be added to the source
       block. After you have created the source blocks it is possible
       to add and remove objects afterward throught the
       <See Property=TContainer2D@Objects> property.>

       The objects in the source block are owner by the source block
       itself and they will be freed when the source block is deleted.
       So it isn't possible to share objects between source block, but
       it is possible to share these objects using the <See Class=TBlock2D>
       class.
    }
    constructor Create(ID: LongInt; const Name: TSourceBlockName; const Objs: array of TObject2D);
    constructor CreateFromStream(const Stream: TStream; const Version: TCADVersion); override;
    destructor Destroy; override;
    procedure SaveToStream(const Stream: TStream); override;
    procedure Assign(const Obj: TGraphicObject); override;
    {: This property contains the name of the source block.

       See also <See Type=TSourceBlockName>.
    }
    property Name: TSourceBlockName read fName write fName;
    {: This property contains the number of instances of the
       source block, that is the number of <See Class=TBlock2D>
       objects that are linked to it.

       When a new block is created to reference a source block,
       this property is incremented by one. When the block is
       deleted this numeber is decremented by one.

       Only if this value is zero the source block can be deleted.
    }
    property NumOfReferences: Word read fNReference;
    {: This property tells if the source block is a library source
       block.

       A library source block is a source block that is shared among
       differert drawings, made up a library of symbols.

       When this property is <B=True>, the source block will not be
       saved in a drawing file, but can be stored in a library file
       by using the methods <See Method=TCADCmp@SaveLibrary>
       and <See Method=TCADCmp@LoadLibrary>.

       If this property is <B=False>, the source block will be
       saved in the drawing file.

       If <See Property=TGraphicObject@ToBeSaved> is <B=False> the
       source block will not be saved anyway.
    }
    property IsLibraryBlock: Boolean read fLibraryBlock write fLibraryBlock;
  end;

  {: This class defines an instance of a <See Class=TSourceBlock2D>.

     A block is an istance of a source block, namely a copy of the
     source block that has its own model transform but share the
     same objects that define the source block.

     A block is an indipendent entity when it is concerned with
     the model transform, but it depends on the source block for
     its shape.
  }
  TBlock2D = class(TObject2D)
  private
    { Reference to the source block. }
    fSourceBlock: TSourceBlock2D;
    fSourceName: TSourceBlockName;
    { Origin of the block. }
    fOriginPoint: TPoint2D;

    procedure SetSourceBlock(const Source: TSourceBlock2D);
    procedure SetOriginPoint(Pt: TPoint2D);
  protected
    procedure _UpdateExtension; override;
  public
    {: This is the constructor of the class.

       <I=Source> is the source block that is used to define
       the instance.
    }
    constructor Create(ID: LongInt; const Source: TSourceBlock2D);
    destructor Destroy; override;
    constructor CreateFromStream(const Stream: TStream; const Version: TCADVersion); override;
    procedure SaveToStream(const Stream: TStream); override;
    procedure Assign(const Obj: TGraphicObject); override;
    {: This method updates the references of the block.

       This method is called automatically at the end of the loading
       process of the block from a stream. Indeed when you save a
       block the reference to the source block is no longer valid,
       so the block must be relinked to the correct source blocks
       instance.

       The method needs the iterator of the source blocks of a CAD in
       order to relink the block's source block. This iterator can be
       obtained by <See Property=TCADCmp@SourceBlocksIterator>
    }
    procedure UpdateReference(const BlockList: TGraphicObjIterator);
    procedure DrawControlPoints(const VT: TTransf2D; const Cnv: TDecorativeCanvas; const ClipRect2D: TRect2D; const Width: Integer); override;
    procedure Draw(const VT: TTransf2D; const Cnv: TDecorativeCanvas; const ClipRect2D: TRect2D; const DrawMode: Integer); override;
    function OnMe(Pt: TPoint2D; Aperture: TRealType; var Distance: TRealType): Integer; override;
    {: This property contains the base position of the block.

       The origin point is the position of the (0, 0) inside of
       the source block that is referenced by the block.

       The origin point is only a visual reference and doesn't
       alter the model transform (but it is altered from it).
    }
    property OriginPoint: TPoint2D read fOriginPoint write SetOriginPoint;
    {: This property contains the reference to the source block used by the block.

       See also <See Class=TSourceBlock2D>.
    }
    property SourceBlock: TSourceBlock2D read fSourceBlock write SetSourceBlock;
    {: This property contains the name of the source block
       referenced by the block.

       It is used to save the source block reference into a stream,
       and it is used to relink the source block reference when the
       block is loaded back.
    }
    property SourceName: TSourceBlockName read fSourceName;
  end;

  {: This class defines a specialization of a <See Class=TCADCmp>
     control (see it for details).

     This CADCmp handles 2D objects and source blocks.
     This component must be used when you need to store 2D drawing.
  }
  TCADCmp2D = class(TCADCmp)
  private
    function GetExtension: TRect2D;
  protected
    procedure LoadObjectsFromStream(const Stream: TStream; const Version: TCADVersion); override;
    procedure SaveObjectsToStream(const Stream: TStream); override;
  public
    {: This method loads the blocks definitions (see <See Class=TSourceBlock2D>) from a drawing.
       This is an abstract method that must be implemented in a concrete control.

       <I=Stream> is the stream that contains the blocks (and it must be
       positioned on the first block present). The stream must be
       created with the current version of the library.
       The blocks are created by reading the shape class registration index
       and creating the correct shape instance with the state present in the
       stream. Then this instance is saved in the list of objects of the
       source block.

       When a source block is loaded the objects that are contained in the
       source block are checked for recursive nesting of blocks. It is
       allowed to have a source block that use in its definition another
       source block, BUT this source block must be loaded before the
       source block that use it (this is automatically checked when you
       define a block). When the source block is loaded its
       <See Method=TContainer2D@UpdateSourceReferences> is called to
       update the references.

       If there is a block that references to a not defined source block
       a message will be showed and the source block will not be loaded.

       See also <See=oObject's Persistance@PERSISTANCE>.
    }
    procedure LoadBlocksFromStream(const Stream: TStream; const Version: TCADVersion); override;
    {: This method saves the blocks definitions (see <See Class=TSourceBlock2D>) to a drawing.
       This is an abstract method that must be implemented in a concrete control.

       <I=Stream> is the stream into which save the source blocks,
       <I=AsLibrary> tells if list of source blocks must be saved as
       a library. A Library will contains only the source blocks that
       have the <See Property=TGraphicObject@ToBeSaved> property set to
       <B=True> and the <See Property=TSourceBlock2D@IsLibraryBlock>
       property set to <B=True>. This is useful to create library of
       blocks definition to be shared beetwen drawing.

       See also <See=Object's Persistance@PERSISTANCE>.
    }
    procedure SaveBlocksToStream(const Stream: TStream; const AsLibrary: Boolean); override;
    {: This method adds a new source block.

       <I=ID> is the identifier number of the source block and Obj is the
       source block object. The library doesn't check for uniqueness of
       source block's ID. The given ID substitute the ID of Obj. A source
       block can also be referenced by its name and again the library
       doesn't check for its uniqueness.

       A source block is a collection of objects that are drawed at a whole
       on the viewport. A source block must be istantiated before the
       drawing occourse by define a block that references it. The instance
       has a position so you can share the same collection of objects and
       draw it in different places on the same drawing. This allows the
       efficent use of memory. If a source block is modified, all the
       instances are modified accordingly.

       The method returns the added block.

       See also <See Class=TSourceBlock2D> and
       <See Class=TBlock2D>.
    }
    function AddSourceBlock(const Obj: TSourceBlock2D): TSourceBlock2D;
    {: This method deletes the source block with the specified Name.

      <I=ID> is the identification number of the source block. If no such
      block is found a <See Class=ECADListObjNotFound> exception will be raised.

      If the source block to be delete is in use (that is it is referenced
      by some <See Class=TBlock2D> object) a
      <See Class=ECADSourceBlockIsReferenced> exception will be raised and the
      operation aborted. In this case you must delete the objects that
      reference the source block before retry.
    }
    procedure DeleteSourceBlock(const SrcName: TSourceBlockName);
    function  GetSourceBlock(const ID: LongInt): TSourceBlock2D;
    function  FindSourceBlock(const SrcName: TSourceBlockName): TSourceBlock2D;
    {: This method creates a source block (and add it to the CAD) by
       grouping a list of objects.

       <I=ScrName> will be the name of the source block; <I=Objs> is
       an iterator on the list that contains the objects to be added.
       That list must have the <See Property=TGraphicObjList@FreeOnClear>
       property set to <B=False>.
    }
    function  BlockObjects(const SrcName: TSourceBlockName; const Objs: TGraphicObjIterator): TSourceBlock2D;
    procedure DeleteLibrarySourceBlocks; override;
    procedure DeleteSavedSourceBlocks; override;
    function AddObject(const ID: LongInt; const Obj: TObject2D): TObject2D;
    function InsertObject(const ID, IDInsertPoint: LongInt; const Obj: TObject2D): TObject2D;
    {: This method adds a new block (instance of a source block) into
       the CAD.

       <I=ID> will be the identifier of the new block,
       and <I=SrcName> is the name of the source block used to
       define the block.

       If the source block isn't in the CAD an exception will be
       raised. The method returns the reference of the added block.
    }
    function  AddBlock(const ID: LongInt; const SrcName: TSourceBlockName): TObject2D;
    function  GetObject(const ID: LongInt): TObject2D;
    {: This method transforms a set of object or all the objects
       present in the CAD.

       The method applies the <I=T> transform matrix to the objects
       with the <I=ID> that are present in <I=ListOfObj>. This
       parameter is an array that may contains:

       <LI=only one element equal to -1. In this case <I=T> will be
       applied to all the objects present in the CAD.
       <LI=a list of integers greater or equal to zero. In this case
       <I=T> will be applied to the objects with the specified
       <I=IDs>. The array must not have duplicated IDs.

       If some ID in the array doesn't refer to an object in the CAD
       an <See Class=ECADListObjNotFound> exception will be raised
       and the operation stopped.
    }
    procedure TransformObjects(const ListOfObj: array of LongInt; const T: TTransf2D);
    procedure RedrawObject(const Obj: TObject2D);
    {: This property contains the extension of the drawing.

       The drawing extension is the smallest axis aligned
       rectangle that bounds all the objects in the CAD.
       When you refer to the property the extension rectangle is
       computed and this may require a bit of time for a complex draw.

       If you want to use this value more than once in a series of
       computations, it is better to store it in a local variable
       instead of use this property in all the computations.
    }
    property DrawingExtension: TRect2D read GetExtension;
  end;

  {: This component derives from <See Class=TCADViewport> and
     specialize it to handle 2D objects.

     In this case the world is the view plane of TCADViewport
     and so the projection transform is simply an indentity tranform matrix.

     See <See Class=TCADViewport> for details.
  }
  TCADViewport2D = class(TCADViewport)
  private
    fPickFilter: TObject2DClass; { consider only the objects with this type during the picking. }
    fCADCmp2D: TCADCmp2D;
    { Event handlers }
    fOnMouseDown2D, fOnMouseUp2D: TMouseEvent2D;
    fOnMouseMove2D: TMouseMoveEvent2D;

    procedure SetCADCmp2D(CAD2D: TCADCmp2D);
  protected
    procedure SetCADCmp(Cad: TCADCmp); override;
    procedure DrawObject(const Obj: TGraphicObject; const Cnv: TDecorativeCanvas; const ClipRect2D: TRect2D); override;
    procedure DrawObjectWithRubber(const Obj: TGraphicObject; const Cnv: TDecorativeCanvas; const ClipRect2D: TRect2D); override;
    function  BuildViewportTransform(var ViewWin: TRect2D; const ScreenWin: TRect; const AspectRatio: TRealType): TTransf2D; override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  public
    constructor Create(AOwner: TComponent); override;
    {: This method draws a 2D object on the viewport.

       <I=Obj> is that object to be drawed. If <I=CtrlPts> is <B=True>
       the control points of the object will also be drawed.

       The object is drawed by calling its <See Method=TObject2D@Draw>
       method if it is visible (that is it is contained in the
       <See Property=TCADViewport@VisualRect>)).
    }
    procedure DrawObject2D(const Obj: TObject2D; const CtrlPts: Boolean);
    {: This method draws a 2D object on the viewport.

       <I=Obj> is that object to be drawed. If <I=CtrlPts> is <B=True>
       the control points of the object will also be drawed.

       The object is drawed by calling its <See Method=TObject2D@Draw>
       method if it is visible (that is it is contained in the
       <See Property=TCADViewport@VisualRect>)).

       This method draws the object only on the canvas of the control
       and not in the off-screen buffer. So if you call the
       <See Method=TCADViewport@Refresh> method the effect of this
       method are removed without the need to a complete Repaint.
    }
    procedure DrawObject2DWithRubber(const Obj: TObject2D; const CtrlPts: Boolean);
    procedure CopyRectToCanvas(CADRect: TRect2D; const CanvasRect: TRect; const Cnv: TCanvas; const Mode: TCanvasCopyMode); override;
    function  GetCopyRectViewportToScreen(CADRect: TRect2D; const CanvasRect: TRect; const Mode: TCanvasCopyMode): TTransf2D; override;
    procedure ZoomToExtension; override;
    {: This method fill in a list with the objects that are contained
       in a rectangular region of the view plane.

       <I=ResultLst> is the list that will contain the objects found;
       <I=Frm> is a rectangle in view plane coordinates.
       <I=Mode> may be one of the following values:

       <LI=if it is <I=gmAllInside> then only the objects that
         are fully contained in the rectangle are inserted into the list.>
       <LI=if it is <I=gmCrossFrame> then the objects that are
         fully or partially contained in the rectangle are inserted
         into the list.>

       If <I=RemoveFromCAD> is <B=True> then the objects added to
       the list are also removed from the CAD.

       This method is useful for create a pick-in-region function,
       or to create a source block with the objects in a region
       by removing the objects found from the CAD.
    }
    procedure GroupObjects(const ResultLst: TGraphicObjList; Frm: TRect2D; const Mode: TGroupMode; const RemoveFromCAD: Boolean);
    {: This method returns an object that has the point <I=Pt> on it.

       The method traverses the list of objects to find an object
       that is at a distance from <I=Pt> less than <I=Aperture>. If
       that object is found then it will be returned by the method,
       otherwise the method will returns <B=nil>.

       <I=Pt> is the point of the picking; <I=Aperture> is the width
       of the picking region in <B=pixel>.

       <I=NPoint> will contains (if an object will be picked) one of
       the following values:

       <LI=<I=PICK_NOOBJECT> if no object is found at <I=Pt>.>
       <LI=<I=PICK_INBBOX> if an object is found that has <I=Pt> in its bounding box.>
       <LI=<I=PICK_ONOBJECT> if an object is found that has <I=Pt> on its outline.>
       <LI=<I=PICK_INOBJECT> if an object is found that has <I=Pt> in its interior.>
       <LI=a value equal or greater than zero if an object is found
         that has <I=Pt> on one of its control points.>

       The above value are ordered from the lowest priority to the
       greater priority. If more than one of the above condition is
       matched the value with the greater priority is returned.

       If there are more than one object at the point <I=Pt> the
       following rules are applied:

       <LI=The object with the greater priority value is returned>
       <LI=The last object added to the CAD is returned.>

       The display list is traversed until the last object is
       encountered and this may require a bit of time in the
       case of a complex object. If you are satisfied to found
       the first encountered object that is picked by the point
       <I=Pt> you may want to set <I=FirstFound> to <B=True>.

       <B=Note>: The method use the <See Method=TObject2D@OnMe> method
       to check for the picking. If you need a special picking function
       you may want to call that method.
    }
    function  PickObject(Pt: TPoint2D; Aperture: Word; FirstFound: Boolean; var NPoint: Integer): TObject2D;
    {: This method fills a list with the object that are at a distance
       from <I=Pt> less than <I=Aperture>.

       The method perform the same operation of <See Method=TCADViewport2D@PickObject>
       method but the objects that are picked by the point <I=Pt> are all
       added to the list <I=PickedObjects> in the same order as they
       are encountered.
    }
    function  PickListOfObjects(const PickedObjects: TList; Pt: TPoint2D; Aperture: Word): Integer;
    {: This method returns the point <I=WPt> in world coordinate system
       transformed by the inverse of the object model trasform of <I=Obj>.

       This method simply obtain the point <I=WPt> referenced in
       the object coordinate system of <I=Obj>.
    }
    function  WorldToObject(const Obj: TObject2D; WPt: TPoint2D): TPoint2D;
    {: This method returns the point <I=OPt> in object coordinate system
       transformed by the object model trasform of <I=Obj>.

       This method simply obtain the point <I=OPt> referenced in
       the world coordinate system.
    }
    function  ObjectToWorld(const Obj: TObject2D; OPt: TPoint2D): TPoint2D;
    {: This property may contains a class variable that is used to limit
       the picking to only the objects of that class.

       This property is used in <See Method=TCADViewport2D@PickObject>,
       <See Method=TCADViewport2D@PickListOfObjects> and
       <See Method=TCADViewport2D@GroupObjects>.
    }
    property  PickFilter: TObject2DClass read fPickFilter write fPickFilter;
  published
    {: This property contains the <See Class=TCADCmp2D> control that
       acts as the source for the drawing to be painted in the
       viewport.

       The CADCmp2D contains the display list of the drawing that will
       be rendered in the canvas of the viewport control.

       You must assign it before using the viewport.
    }
    property CADCmp2D: TCADCmp2D read fCADCmp2D write SetCADCmp2D;
    property Centrum;
    {: EVENTS}
    {: This property may contain an event-handler that will be
       called when the mouse in moved on the control.

       See <See Type=TMouseMoveEvent2D> for details on the event
       handler.
    }
    property OnMouseMove2D: TMouseMoveEvent2D read FOnMouseMove2D write FOnMouseMove2D;
    {: This property may contain an event-handler that will be
       called when the user presses a mouse button with the mouse pointer
       over the viewport.

       See <See Type=TMouseEvent2D> for details on the event
       handler.
    }
    property OnMouseDown2D: TMouseEvent2D read FOnMouseDown2D write FOnMouseDown2D;
    {: This property may contain an event-handler that will be
       called when the user releases a mouse button with the mouse pointer
       over the viewport.

       See <See Type=TMouseEvent2D> for details on the event
       handler.
    }
    property OnMouseUp2D: TMouseEvent2D read FOnMouseUp2D write FOnMouseUp2D;
  end;

{ -----===== Starting Cs4CADPrgClass.pas =====----- }
  {: This type defines the events that a <See Class=TCADPrg> manages.

     These events are to be considered in the implementation of the
     <See Method=TCADState@OnEvent> method. See it for details.

     These are the events and their parameters:

     <LI=<I=ceMouseMove>, <I=ceMouseDown>, <I=ceMouseUp> and <I=ceMouseDblClick>
       are mouse events. The various points properties (<I=Current*Point>)
       are the coordinates of the mouse position.>
     <LI=<I=ceKeyDown> and <I=ceKeyUp> are the keyboard events.>
     <LI=<I=cePaint> is the event fired when the viewport is repainted.>
     <LI=<I=ceUserDefined> is a user defined event. Its kind is in the
       <I=Key> parameters of the <See Method=TCADState@OnEvent> method.>
  }
  TCADPrgEvent = (ceMouseMove,
                  ceMouseDown,
                  ceMouseUp,
                  ceMouseDblClick,
                  ceKeyDown,
                  ceKeyUp,
                  cePaint,
                  ceUserDefined);

  TCADPrg = class;

  {: This type define the class type used to specify a <See Class=TCADState> class.
  }
  TCADStateClass = class of TCADState;

  {: This class defines the common interface for the parameter
     used in a task.

     A state of a task can receive an instance of this type
     as parameter for its operation.
     The <B=task> can then accomplish its operation by using the
     information in the parameter. A task may dont need a parameter.

     All parameter types have a field that can store a state
     class reference: <I=AfterState>. This state will be activated
     when the task is ended, passing it the current parameter.
     If you define a new state you have to implement this behaviour.

     For example a common code to end an operation in the
     OnEvent method is the follow:

     <CODE=if Assigned(Param.AfterState) then<BR>
           <TAB> NextState := Param.AfterState<BR>
           else <BR>
           <TAB> NextState := CADPrg.DefaultSatate; <BR>
           Result := True;
     >
  }
  TCADPrgParam = class(TObject)
  private
    fAfterState: TCADStateClass;
    fUserObject: TObject;
  public
    {: This is the constructor of the parameter.

       <I=AfterS> is the class reference of the state to be
       started at the end of the current one.

       All parameter types have a field that can store a state
       class reference: <I=AfterState>. This state will be activated
       when the <B=task> is ended, passing it the current parameter.
       If you define a new state you have to implement this behaviour.
    }
    constructor Create(AfterS: TCADStateClass);
    {: This property contains a class reference of the state to be
       started at the end of the current one.

       All parameter types have a field that can store a state
       class reference: <I=AfterState>. This state will be activated
       when the <B=task> is ended, passing it the current parameter.
       If you define a new state you have to implement this behaviour.
    }
    property AfterState: TCADStateClass read fAfterState write fAfterState;
    {: This property may contain a user object reference interpreted
       by the current task.
    }
    property UserObject: TObject read fUserObject write fUserObject;
  end;

  TCS4MouseButton = (cmbNone, cmbLeft, cmbRight, cmbMiddle);
  {: This class defines a state of a interaction task.

     <See Class=TCADPrg> is based on a <I=FSM model> (finite state
     machine) in which an interaction task is is a set of states,
     each of them execute some part of the whole task.
     The interaction task (from now on simply a task) evolves through
     the states in respons to <I=events>. An <I=event> is some action
     on the CADPrg or the linked Viewport performed by the user or
     by the control itself.
     A task is an <I=active state>, that is the state with receives
     the events (through the implementation of the
     <See Method=TCADState@OnEvent>).
     The active state decides what operation performs in response to
     the event. See <See Method=TCADState@OnEvent> for details.

     The events are (see also TCADPrgEvent) <I=mouse events, keyboard
     events, expose events and user events>.

     The user must derives its states from this class to implement
     an interaction task. A state may be reused in more that one
     interaction task.

     An interaction task is started by using the
     <See Method=TCADPrg@StartOperation>,
     <See Method=TCADPrg@SuspendOperation> and passing it the first
     state of it.

     To define a state you may want to implement the following
     methods:

     <LI=<See Method=TCADState@Create> in which you place the
       initialization code for the state>
     <LI=<See Method=TCADState@OnEvent> in which you place the
       code to handle the events>
     <LI=<See Method=TCADState@OnStop> in which you plane the
       finalization code for the interaction task (this method
       is called when an interaction task is stopped, no when
       the state instace is destroyed.>

     <B=Note>: The instance of a state is created by the <See Class=TCADPrg>
      control.
  }
  TCADState = class(TObject)
  private
    fCAD: TCADPrg; { Used to store the CAD that is using the state. }
    fParam: TCADPrgParam; { A state as a parameter when it is created. }
    fCanBeSuspended: Boolean; { default True. If false the state cannot be suspended. }
    fDescription: String; { Contains a description of the state. }

    procedure SetDescription(D: String);
  protected
    property CADPrg: TCADPrg read fCAD;
  public
    {: This is the contructor of the state in which you may place
       the code for the initialization of the state.

       <I=CADPrg> is the <See Class=TCADPrg> control that has called
       the constructor; <I=StateParam> is an optional parameter
       passed to the state (it may be <B=nil>), see <See Class=TCADPrgParam>.

       <I=NextState> may contains a class reference to a state class
       that will be the next state when the constructor terminate.
       Set this parameter if you want a state that only change the
       parameter and leave the actual task implementation to other
       states.
    }
    constructor Create(const CADPrg: TCADPrg; const StateParam: TCADPrgParam; var NextState: TCADStateClass); virtual;
    {: This method is called by the CADPrg when an event is pending for
       the state. See <See Class=TCADState> for details.

       <I=Event> is the event to be handled; <I=MouseButton> is the
       mouse button that caused the event (if applicable);
       <I=Shift> is the special keys configurations when the event
       was created (if applicable); <I=Key> is the key that is currently
       pressed by the user.

       <I=NextState> may contain a class reference value to a state class
       that will became the active state at the moment the method returns.
       If you put a value into this parameter you also need to return
       <B=True> from the method. Otherwise you must return <B=False>.

       Use this method to handle the events and perform operations
       or change the active state.
    }
    function OnEvent(Event: TCADPrgEvent; MouseButton: TCS4MouseButton;
                     Shift: TShiftState; Key: Word;
                     var NextState: TCADStateClass): Boolean; dynamic;
    {: This method is called when the current interactive task is
       stopped by calling the <See Method=TCADPrg@StopOperation> method.

       Use it to free any resource in the interactive task and
       in the parameter of the state.
    }
    procedure OnStop; dynamic;
    {: This method is called when the current interactive task is
       suspended by calling the <See Method=TCADPrg@SuspendOperation>
       method.

       <I=State> is the suspended state and <I=SusParam> is the
       parameter of the suspended state.
    }
    procedure OnResume(const State: TClass; const SusParam: TCADPrgParam); dynamic;
    {: This property contains an optional description of the
       interaction task.

       It is useful to inform the user to which operations are
       needed to complete the interaction task. When this
       property is changed an <See Property=TCADPrg@OnDescriptionChanged>
       event is fired.
    }
    property Description: String read fDescription write SetDescription;
    {: If this property is <B=True> then the iteraction task to which
       the state belonging can be interrupted with the
       <See Method=TCADPrg@StopOperation>.
    }
    property CanBeSuspended: Boolean read fCanBeSuspended write fCanBeSuspended;
    {: This property contains the parameter of the state. It is
       set by the TCADPrg when the state is activated but you
       may (and sometimes is very useful) be changed through this
       property.
    }
    property Param: TCADPrgParam read fParam write fParam;
  end;

  {: This class implements a state that does nothing.

     It is useful for a default state.
  }
  TCADIdleState = class(TCADState)
  public
    constructor Create(const CADPrg: TCADPrg; const StateParam: TCADPrgParam; var NextState: TCADStateClass); override;
  end;

  {: This type defines an event-handler for the event fired when
     the active state is changed.

     <I=Sender> is the TCADPrg that create the instance of the state;
     <I=Sender> is the changed state (if the event is a
     <See Property=TCADPrg@OnEnterState> this is the entering state,
     if the event is a <See Property=TCADPrg@OnExitState> this is
     the leaving state).
  }
  TCADPrgOnChangeState = procedure(Sender: TObject; const State: TCADState) of object;
  {: This type defines an event-handler for the event fired when
     the current interaction task of a TCADPrg is aborted, ended
     or started.

     <I=Sender> is the TCADPrg instance that has started the
     interaction task. <I=Operation> is the initial state
     of the interaction task and <I=Param> is the parameter of
     the interaction task.
  }
  TCADPrgOnOperation = procedure(Sender: TObject; const Operation: TCADStateClass; const Param: TCADPrgParam) of object;

  {: This class defines the control used by the library to handle
     interaction tasks. An interaction task is an interactive
     visual sequence of operation on a Viewport.

     The control implement a FSM (Finite state machine) model
     that receives events from the user and the Viewport.

     See also <See Class=TCADState> class for details.
  }
  TCADPrg = class(TComponent)
  private
    fLinkedViewport: TCADViewport;
    fIsBusy, fIsSuspended: Boolean;
    fUseSnap, fUseOrto: Boolean;
    fSnapX, fSnapY: TRealType;
    fRepaintRect: TRect2D;
    fCursorColor: TColor;
    fCentralColor: TColor;
    fMustRepaint, fRefreshAfterOp: Boolean;
    fIgnoreEvents: Boolean;
    fCurrentKey: Word;
    fDefaultState: TCADStateClass;
    fCurrentState, fSuspendedState: TCADState;
    fCurrentOperation, fSuspendedOperation: TCADStateClass;
    fOnEntState, fOnExState: TCADPrgOnChangeState;
    fOnEndOperation, fOnStart, fOnStop: TCADPrgOnOperation;
    fOldOnPaint, fOnIdle: TNotifyEvent;
    fOnDescriptionChanged: TNotifyEvent;
    fShowCursorCross: Boolean;
    fShowCentralCross: Boolean;
    fNewWndProc, fOldWndProc: Pointer;
    FViewAction  : TCADActionMode;
    procedure SetViewAction(Value:TCADActionMode);

    procedure SetShowCursorCross(B: Boolean);
    procedure SetCursorColor(C: TColor);
    procedure SetCentralColor(C: TColor);
    procedure SetShowCentralCross(B: Boolean);
    procedure SetDefaultState(DefState: TCADStateClass);
    procedure SetLinkedViewport(V: TCADViewport);
    procedure GoToDefaultState(const LastState: TClass; const LastParam: TCADPrgParam);
  protected
    procedure SubclassedWinProc(var Msg: TMessage); virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    {: This property must returns the current viewport point at which
       the mouse is positioned.

       The control doesn't send the mouse coordinates with the events,
       but the user must use the <I=Current*Point> properties defined
       for <See Class=TCADPrg2D> and <See Class=TCADPrg3D>.
    }
    function GetVPPoint: TPoint2D; virtual; abstract;
    {: This property is called whenever the mouse is moved and the
       current viewport point stored in the control must be updated.

       <I=Pt> is the 2D mouse position in the view plane coordinate system.

       The control doesn't send the mouse coordinates with the events,
       but the user must use the <I=Current*Point> properties defined
       for <See Class=TCADPrg2D> and <See Class=TCADPrg3D>.
    }
    procedure SetVPPoint(const Pt: TPoint2D); virtual; abstract;
    {: Use this method to draw the cursor at the mouse position.

       You have to implement this property also if you don't want
       a cursor (in this case simple do nothing).
    }
    procedure DrawCursorCross; virtual; abstract;
    procedure HideCursorCross; virtual; abstract;
    procedure DrawCentralCross; virtual; abstract;
    procedure HideCentralCross; virtual; abstract;
    procedure ViewOnPaint(Sender: TObject); dynamic;
    {: This method is called whenever a key event is received.

       You don't need to use it.
    }
    function ViewOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState): Boolean; dynamic;
    {: This method is called whenever a key event is received.

       You don't need to use it.
    }
    function ViewOnKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState): Boolean; dynamic;
    {: This method is called whenever a mouse event is received.

       You don't need to use it.
    }
    function ViewOnDblClick(Sender: TObject): Boolean; dynamic;
    {: This method is called whenever a mouse event is received.

       You don't need to use it.
    }
    function ViewOnMouseMove(Sender: TObject; Shift: TShiftState; var X, Y: SmallInt): Boolean; dynamic;
    {: This method is called whenever a mouse event is received.

       You don't need to use it.
    }
    function ViewOnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; var X, Y: SmallInt): Boolean; dynamic;
    {: This method is called whenever a mouse event is received.

       You don't need to use it.
    }
    function ViewOnMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; var X, Y: SmallInt): Boolean; dynamic;
    {: This method is used to send an event to the current state.

       You don't need to call it directly.
    }
    procedure SendEvent(Event: TCADPrgEvent; MouseButton: TCS4MouseButton; Shift: TShiftState; Key: Word); virtual;
    {: This property contains the current key pressed by the user and
       sent as the <I=Key> parameter of the <See Method=TCADState@OnEvent>.
    }
    property CurrentKey: Word read fCurrentKey write fCurrentKey;
    {: This property contains the linked viewport that is used to
       interact with the user.
    }
    property LinkedViewport: TCADViewport read fLinkedViewport write SetLinkedViewport;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    {: This method starts a new interaction task.

       <I=StartState> is the class reference of the starting
       state class for the interaction task; <I=Param> is an instance
       of <See Class=TCADPrgParam> that will be the parameter
       of the interaction task (and it will be passed to all
       the state of it).

       If an interaction task is already active it will be stopped
       and the new one started. If it has a suspended interaction task
       the method returns <I=False> and the interaction start will not
       be started.

       The method returns <I=True> if the new interaction task is
       started.
    }
    function StartOperation(const StartState: TCADStateClass; Param: TCADPrgParam): Boolean;
    {: This method suspends the current interaction task and
       starts a new one.

       <I=StartState> is the class reference of the starting
       state class for the interaction task; <I=Param> is an instance
       of <See Class=TCADPrgParam> that will be the parameter
       of the interaction task (and it will be passed to all
       the state of it).

       If there is no active interaction task the new task will be
       simply started. If an interaction task was already suspended
       the method returns <I=False> and the new interaction start will
       not be started.

       The method returns <I=True> if the new interaction task is
       started.
    }
    function SuspendOperation(const StartState: TCADStateClass; Param: TCADPrgParam): Boolean;
    {: This method stops the current interaction task.

       If no interaction task is active the method does nothing.
    }
    procedure StopOperation;
    {: This method resets the FSM.

       Everithing is resetted as the control is created. Use this
       method only in case of unrecoverable errors.
    }
    procedure Reset;
    {: This method sends CAD event to the current state.

       It may be used to simulate mouse movements and operation
       (for instance to set a point with a value, you can set the
       <See Property=TCADPrg@CurrentViewportPoint> property to the
       point and send the <I=ceMouseDown> event).

       See <See Class=TCADState> for details.
    }
    procedure SendCADEvent(Event: TCADPrgEvent; MouseButton: TMouseButton; Shift: TShiftState; Key: Word);
    {: This method sends a user defined event to the current state.

      <I=Code> is the code for the user defined event. This code will
      be passed as the <I=Key> parameter to the
      <See Method=TCADState@OnEvent> method. The event can be identified
      in the code as a <I=ceUserDefined>.
    }
    procedure SendUserEvent(const Code: Word);
    {: If this method is called, the linked viewport will be
      repainted when the current interaction task will finish.

      <I=ARect> is the portion of the view plane to be repainted.

      By default when the current interaction task finishes only
      a refresh of the linked viewport is performed.

      See also <See Method=TCADPrg@RepaintAfterOperation>.
    }
    procedure RepaintRectAfterOperation(const ARect: TRect2D);
    {: If this method is called, the linked viewport will be
      repainted when the current interaction task will finish.

      By default when the current interaction task finishes only
      a refresh of the linked viewport is performed.

      See also <See Method=TCADPrg@RepaintRectAfterOperation>.
    }
    procedure RepaintAfterOperation;
    {: This property contains the current mouse position.
       The position is a 2D point that lies on the view plane of
       the linked viewport.

       Use this property inside the states to obtain the mouse
       position or set it to simulate mouse event by code.

       Other mouse position are defined depending on the type of
       the <I=CADPrg> (see also <See Class=TCADPrg2D> and
       <See Class=TCADPrg3D>).
    }
    property CurrentViewportPoint: TPoint2D read GetVPPoint write SetVPPoint;
    {: This property is <B=True> when there is an active interaction
       task in the control (that is its current state is not equal
       to the default state).
    }
    property IsBusy: Boolean read fIsBusy;
    {: This property is <B=True> when there is a suspended interaction
       task in the control.
    }
    property IsSuspended: Boolean read fIsSuspended;
    {: If this property is set to <B=True> then no event is sent to
       the active state of the control.

       This is very useful when you want to repaint a viewport inside
       a state but don't want to receive the <I=OnPaint> event.

       By default it is <B=False>.
    }
    property IgnoreEvents: Boolean read fIgnoreEvents write fIgnoreEvents;
    {: This propery contains the active state instance of the current
       interaction task.
    }
    property CurrentState: TCADState read fCurrentState;
    {: This propery contains the class reference type of the
       first state (that is the state passed to the
       <See Method=TCADPrg@StartOperation> or
       <See Method=TCADPrg@SuspendOperation> methods) for the
       current interaction task.
    }
    property CurrentOperation: TCADStateClass read fCurrentOperation write fCurrentOperation;
    {: This property contains a class reference value of the
       default state for the FSM.

       This is the state that will be instantiated whenever no
       interaction task is running. This state may be itself an
       interaction task that must be used to start other interaction
       tasks.

       By default the default state is <See Class=TCADIdleState>.
    }
    property DefaultState: TCADStateClass read fDefaultState write SetDefaultState;
    {: This is the linked viewport of the control.

       The linked viewport is the one that is able to send mouse
       and keyboard event to the <I=TCadPrg>. This control is used
       also as the output of the interaction task feedback and for
       the cursor visualization.
    }
    property Viewport: TCADViewport read fLinkedViewport;
  published
    property ViewAction  : TCADActionMode read FViewAction write SetViewAction;
    {: If this property is <B=True> then the snapping constraint is
       enabled.

       The snapping used by the <I=TCADPrg> control is a 2D snapping
       on a plane. The plane on which it works depends on the kind
       of the control (see <See Class=TCADPrg2D> and <See Class=TCADPrg3D>).
    }
    property UseSnap: Boolean read fUseSnap write fUseSnap default False;
    {: If this property is <B=True> that the ortogonal constraint is
       enabled.

       The ortogonal constrain forces the drawing to be
       parallel to the X and Y axis of a plane. Not all
       interaction tasks uses this contraint that is any interaction
       tasks must implement its ortogonal contraint.
       The plane on which it works depends on the kind
       of the control (see <See Class=TCADPrg2D> and <See Class=TCADPrg3D>).
    }
    property UseOrto: Boolean read fUseOrto write fUseOrto default False;
    {: This property specifies the snapping step on the X axis of the
       interaction plane.

       See also <See Property=TCADPrg@UseSnap>.
    }
    property XSnap: TRealType read fSnapX write fSnapX;
    {: This property specifies the snapping step on the Y axis of the
       interaction plane.

       See also <See Property=TCADPrg@UseSnap>.
    }
    property YSnap: TRealType read fSnapY write fSnapY;
    {: This property contains the color of the cursor.

       The cursor is a visual feedback of the mouse position and
       must be implemented in specific <I=TCADPrg> controls
       (see <See Class=TCADPrg2D> and <See Class=TCADPrg3D>).
    }
    property CursorColor: TColor read fCursorColor write SetCursorColor default clGray;
    property CentralColor: TColor read fCentralColor write SetCentralColor default clBlack;
    {: If this property is <B=True> then the cursor will be
       showed.

       The cursor is a visual feedback of the mouse position and
       must be implemented in specific <I=TCADPrg> controls
       (see <See Class=TCADPrg2D> and <See Class=TCADPrg3D>).
    }
    property ShowCursorCross: Boolean read fShowCursorCross write SetShowCursorCross default False;
    property ShowCentralCross: Boolean read fShowCentralCross write SetShowCentralCross default False;
    {: If this operation is <B=True> then the linked viewport of
       the control will be refreshed when the current operation
       finish. By default it is <B=True>.
    }
    property RefreshAfterOperation: Boolean read fRefreshAfterOp write fRefreshAfterOp default True;
    {: EVENTS}
    {: This property may contain an event-handler that is called
       when the current state is changed.

       It is called before the new state is entered.

       See also <See Type=TCADPrgOnChangeState>.
    }
    property OnEnterState: TCADPrgOnChangeState read fOnEntState write fOnEntState;
    {: This property may contain an event-handler that is called
       when the current state is changed.

       It is called after the state has exited.

       See also <See Type=TCADPrgOnChangeState>.
    }
    property OnExitState: TCADPrgOnChangeState read fOnExState write fOnExState;
    {: This property may contains an event-handler that is called
       when the current interaction task is ended.

       See also <See Type=TCADPrgOnOperation>.
    }
    property OnEndOperation: TCADPrgOnOperation read fOnEndOperation write fOnEndOperation;
    {: This property may contains an event-handler that is called
       when the current interaction task is stopped.

       See also <See Type=TCADPrgOnOperation>.
    }
    property OnStopOperation: TCADPrgOnOperation read fOnStop write fOnStop;
    {: This property may contains an event-handler that is called
       when a new interaction task is started.

       See also <See Type=TCADPrgOnOperation>.
    }
    property OnStartOperation: TCADPrgOnOperation read fOnStart write fOnStart;
    {: This property may contains an event-handler that is called
       when the control enter in the default state.
    }
    property OnIdle: TNotifyEvent read fOnIdle write fOnIdle;
    {: This property may contains an event-handler that is called
       when the description of the current state is changed.

       Use it to update the user information on the screen.
    }
    property OnDescriptionChanged: TNotifyEvent read fOnDescriptionChanged write fOnDescriptionChanged;
  end;

  TCADPrg2D = class;
  {: This type defines the type of a <I=2D mouse button filter>.

     A filter is a procedure that is called by a <I=TCADPrg> control
     to update the current mouse position of the control.

     <I=Sender> is the TCADPrg instance that has called the
     filter; <I=CurrentState> is the current state of the control;
     <I=Button> is the mouse button's state at the moment of the
     event; <I=WPt> must be set to new world point of the mouse
     position; <I=X, Y> are the mouse position in screen coordinates.

     A filter is useful to change the position of a mouse event
     before the event is handled by the current state. For example
     it may be used to implement an object gravity function by
     calling in the filter the PickObject method of the linked
     viewport and if the WPt point is on an object change it to
     the nearest control point of the object.

     <B=Note>: <I=WPt> contains the current world point of the
      mouse position at the moment of the activation of the filter.
      So if you don't need to change it simply left it unchanged.
  }
  TMouse2DButtonFilter = procedure(Sender: TCADPrg2D; CurrentState: TCADState; Button: TMouseButton; var WPt: TPoint2D; X, Y: Integer) of Object;
  {: This type defines the type of a <I=2D mouse move filter>.

     A filter is a procedure that is called by a <I=TCADPrg> control
     to update the current mouse position of the control.

     <I=Sender> is the TCADPrg instance that has called the
     filter; <I=CurrentState> is the current state of the control;
     <I=Button> is the mouse button's state at the moment of the
     event; <I=WPt> must be set to new world point of the mouse
     position; <I=X, Y> are the mouse position in screen coordinates.

     A filter is useful to change the position of a mouse event
     before the event is handled by the current state. For example
     it may be used to implement an object gravity function by
     calling in the filter the PickObject method of the linked
     viewport and if the WPt point is on an object change it to
     the nearest control point of the object.

     <B=Note>: <I=WPt> contains the current world point of the
      mouse position at the moment of the activation of the filter.
      So if you don't need to change it simply left it unchanged.
  }
  TMouse2DMoveFilter = procedure(Sender: TCADPrg2D; CurrentState: TCADState; var WPt: TPoint2D; X, Y: Integer) of Object;
  {: This type defines the type of a <I=2D snap filter>.

     A filter is a procedure that is called by a <I=TCADPrg> control
     to update the current mouse position of the control.

     <I=Sender> is the TCADPrg instance that has called the
     filter; <I=CurrentState> is the current state of the control;
     <I=LastPt> contains the snap origin for the snapping;
     <I=CurrSnappedPt> must be set to the new snapped point.

     A snap filter is useful to implement complex snapping
     constraint. For instance you may create an angular snapping
     by using the <I=LastPt> and <I=CurrSnappedPt> to find the
     current angle and then forces it to the nearest allowed angle.

     When the filter is activated <I=LastPt> contains the snap origin,
     that is the value assigned to the <See Property=TCADPrg2D@SnapOriginPoint>
     property. If there is no valid snap origin then
     it will be (<I=MaxCoord>, <I=MaxCoord>). You must check for this
     value when implement a snap filter.

     By default the <I=CurrSnappedPt> will be the standar snapped
     point that is the point with the X and Y coordinates at integer
     multiplies of <I=XSnap> and <I=YSnap>.
  }
  TCADPrg2DSnapFilter = procedure(Sender: TCADPrg2D; CurrentState: TCADState; const LastPt: TPoint2D; var CurrSnappedPt: TPoint2D) of Object;

  {: This type define the class type used to specify a <See Class=TCADState2D> class.
  }
  TCADStateClass2D = class of TCADState2D;

  {: This class defines a state of a interaction task.

     <See Class=TCADPrg> is based on a <I=FSM model> (finite state
     machine) in which an interaction task is is a set of states,
     each of them execute some part of the whole task.
     The interaction task (from now on simply a task) evolves through
     the states in respons to <I=events>. An <I=event> is some action
     on the CADPrg or the linked Viewport performed by the user or
     by the control itself.
     A task is an <I=active state>, that is the state with receives
     the events (through the implementation of the
     <See Method=TCADState@OnEvent>).
     The active state decides what operation performs in response to
     the event. See <See Method=TCADState@OnEvent> for details.

     The events are (see also TCADPrgEvent) <I=mouse events, keyboard
     events, expose events and user events>.

     The user must derives its states from this class to implement
     an interaction task. A state may be reused in more that one
     interaction task.

     An interaction task is started by using the
     <See Method=TCADPrg@StartOperation>,
     <See Method=TCADPrg@SuspendOperation> and passing it the first
     state of it.

     To define a state you may want to implement the following
     methods:

     <LI=<See Method=TCADState@Create> in which you place the
       initialization code for the state>
     <LI=<See Method=TCADState@OnEvent> in which you place the
       code to handle the events>
     <LI=<See Method=TCADState@OnStop> in which you plane the
       finalization code for the interaction task (this method
       is called when an interaction task is stopped, no when
       the state instace is destroyed.>

     <B=Note>: The instance of a state is created by the <See Class=TCADPrg>
      control.
  }
  TCADState2D = class(TCADState);

  {: This class defines the control used by the library to handle 2D
     interaction tasks. An interaction task is an interactive
     visual sequence of operation on a Viewport.

     The control implement a FSM (Finite state machine) model
     that receives events from the user and the Viewport.

     The <I=TCADPrg2D> control use points on the view plane of
     the linked viewport.

     See also <See Class=TCADState2D> class for details.
  }
  TCADPrg2D = class(TCADPrg)
  private
    fCurrentViewportPoint: TPoint2D;
    fLastCursorPos, fSnapOriginPoint: TPoint2D;
    fMouseButtonFilter: TMouse2DButtonFilter;
    fMouseMoveFilter: TMouse2DMoveFilter;
    fSnapFilter: TCADPrg2DSnapFilter;

    procedure SetViewport2D(View2D: TCADViewport2D);
    function GetViewport2D: TCADViewport2D;
  protected
    function ViewOnMouseMove(Sender: TObject; Shift: TShiftState; var X, Y: SmallInt): Boolean; override;
    function ViewOnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; var X, Y: SmallInt): Boolean; override;
    function ViewOnMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; var X, Y: SmallInt): Boolean; override;
    procedure DrawCursorCross; override;
    procedure HideCursorCross; override;
    procedure DrawCentralCross; override;
    procedure HideCentralCross; override;
    function GetVPPoint: TPoint2D; override;
    procedure SetVPPoint(const Pt: TPoint2D); override;
    function GetVPSnappedPoint: TPoint2D;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    {: This property contains the current snapped position of the
       mouse.

       Use this property to know the mouse position on the view
       plane of the last mouse event.

       <B=Note>: It is better to use this property in your interaction
       tasks instead of the <See Property=TCADPrg@CurrentViewportPoint>
       property because by using this property you automatically apply
       the snapping if enabled.
    }
    property CurrentViewportSnappedPoint: TPoint2D read GetVPSnappedPoint;
    {: This property contains the snap origin passed to the snap filter.

       By default its value is (<I=MaxCoord>, <I=MaxCoord>).

       See <See Type=TCADPrg2DSnapFilter> for details.
    }
    property SnapOriginPoint: TPoint2D read fSnapOriginPoint write fSnapOriginPoint;
  published
    {: This property contains the linked viewport.

       See also <See Property=TCADPrg@Viewport>.
    }
    property Viewport2D: TCADViewport2D read GetViewport2D write SetViewport2D;
    {: This property may contains a filter that will be called
       when a mouse button event is fired.

       See also <See Type=TMouse2DButtonFilter>.
    }
    property MouseButtonFilter: TMouse2DButtonFilter read fMouseButtonFilter write fMouseButtonFilter;
    {: This property may contains a filter that will be called
       when a mouse movement event is fired.

       See also <See Type=TMouse2DMoveFilter>.
    }
    property MouseMoveFilter: TMouse2DMoveFilter read fMouseMoveFilter write fMouseMoveFilter;
    {: This property may contains a filter that will be called
       when a the snapped point of the current mouse position
       is being computed.

       See also <See Type=TCADPrg2DSnapFilter>.
    }
    property SnapFilter: TCADPrg2DSnapFilter read fSnapFilter write fSnapFilter;
  end;

  {: This function returns the angle in radiants that
     corresponds to <I=A> in degrees.
  }
  function DegToRad(const A: TRealType): TRealType;
  {: This function returns the angle in degree that
     corresponds to <I=A> in angles.

     The resulting angle is in the range <I=0-360°>.
  }
  function RadToDeg(const A: TRealType): TRealType;
  function HSVToRGB(Hue, Sat, V: TRealType): TColor;

  { 2D functions. }

  {: Use this function to initialize a 2D point variable.

     This function returns always a cartesing point (W=1).

     Parameters:

     <LI=<I=X> is the X coordinate of the point.>
     <LI=<I=Y> is the Y coordinate of the point.>
  }
  function Point2D(const X, Y: TRealType): TPoint2D;
  {: Use this function to initialize a 2D rectangle variable.

     This function returns always a cartesian rectangle (with W=1).

     Parameters:

     <LI=<I=Left> is the left X coordinate of the rectangle.>
     <LI=<I=Bottom> is the bottom Y coordinate of the rectangle.>
     <LI=<I=Right> is the right X coordinate of the rectangle.>
     <LI=<I=Top> is the top Y coordinate of the rectangle.>
  }
  function Rect2D(const Left, Bottom, Right, Top: TRealType): TRect2D;
  {: Use this function to create a versor.

     A versor is vector whose length is 1. This function compute
     this kind of vector by dividing the vector by its length.
     If the lenght is zero an exception will be raised.

     Parameters:

     <LI=<I=X> is the X coordinate of the versor.>
     <LI=<I=Y> is the Y coordinate of the versor.>
  }
  function Versor2D(const X, Y: TRealType): TVector2D;
  {: This function normalizes a vector.

     Normalizing a Vector means that the vector coordinates
     are divided by the length of the vector. If the lenght is
     zero an exception will be raised.

     Parameters:

     <LI=<I=V> is the vector being normalized.>
  }
  function NormalizeVector2D(const V: TVector2D): TVector2D;
  {: This function returns a versor that rapresent the direction from
     the point <I=PFrom> to the point <I=PTo>.

     The function computes the vector beetwen the two points
     and then normalizes it.

     Parameters:

     <LI=<I=PFrom> is the starting point of the direction.>
     <LI=<I=PTo> is the ending point of the direction.>
  }
  function Direction2D(const PFrom, PTo: TPoint2D): TVector2D;
  {: This function returns the vector from the point
     <I=PFrom> to the point <I=PTo>.

     A vector rapresents the difference of the coordinates
     from the two points.

     The points are made cartesian before the creation of the vector.
  }
  function Vector2D(PFrom, PTo: TPoint2D): TVector2D;
  {: This function returns the modulus of the vector, that
     is its length.

     This value is also called the <I=Euclidian Norm> of the vector.

     Parameters:

     <LI=<I=V> is the versor on which the function is applied.>
  }
  function VectorLength2D(const V: TVector2D): TRealType;
  {: This function returns <B=True> if two points are equal
     and <B=False> otherwise.

     All the coordinates (also W) are tested.

     Parameters:

     <LI=<I=P1> is the first point.>
     <LI=<I=P2> is the second point.>
  }
  function IsSamePoint2D(P1, P2: TPoint2D): Boolean;
  {: This function returns <B=True> if two vectors are equal
     and <I=False> otherwise.

     All the coordinates (also W) are tested.

     Parameters:

     <LI=<I=V1> is the first vector.>
     <LI=<I=V2> is the second vector.>
  }
  function IsSameVector2D(const V1, V2: TVector2D): Boolean;
  {: This function returns <B=True> if two transform matrices
     are equal and <B=False> otherwise.

     The function use optimizations if the two matrices are
     cartesian matrices.

     Parameters:

     <LI=<I=T1> is the first matrix.>
     <LI=<I=T2> is the second matrix.>
  }
  function IsSameTransform2D(const T1, T2: TTransf2D): Boolean;
  {: This function returns <B=True> if a transform matrix is
     a cartesian matrix, that is a matrix with the third column
     equal to [0, 0, 1].

     Parameters:

     <LI=<I=T> is the matrix being tested.>
  }
  function IsCartesianTransform2D(const T: TTransf2D): Boolean;
  {: This function returns the cartesian point equivalent
     to <I=P>.

     A cartesian point has the W coordinate equals to 1.
     To convert the point all the coordinates are divided by W.

     When a point is made cartesian, there is no way to obtain
     the original point back.

     Parameters:

     <LI=<I=P> is the point being transformed.>
  }
  function CartesianPoint2D(const P: TPoint2D): TPoint2D;
  {: This function returns the cartesian rectangle equivalent
     to <I=R>.

     A cartesian rectangle has the W coordinate of its corners
     equals to 1. To convert the rectangle all the coordinates
     of the two corners are divided by their W.

     When a rectangle is made cartesian, there is no way to
     obtain the original rectangle back.

     Parameters:

     <LI=<I=R> is the rectangle being transformed.>
  }
  function CartesianRect2D(const R: TRect2D): TRect2D;
  {: This function returns an ordered rectangle in which the
     first point is the left-botton one and the second point
     is the right-top one.

     The returned rectangle is always cartesian.

     Parameters:

     <LI=<I=R> is the rectangle being ordered.>
  }
  function ReorderRect2D(const R: TRect2D): TRect2D;
  {: This function transforms a point into a point in
     which the coordinates are integers. To do the
     transformation the function <I=Round> is used.

     The resulting point is specified in Windows screen coordinate
     system.

     Parameters:

     <LI=<I=P2D> is the point being transformed.>
  }
  function Point2DToPoint(const P2D: TPoint2D): TPoint;
  {: This function transforms a point with integer
     coordinates into a point with real coordinates.

     <I=P> is considered as specified in Windows screen
     coordinate system.

     Parameters:

     <LI=<I=P> is the point being transformed.>
  }
  function PointToPoint2D(const P: TPoint): TPoint2D;
  {: This function transforms a rectangle with integer
     coordinates into a rectangle with real coordinates.

     <I=R> is considered as specified in Windows screen
     coordinate system.

     Parameters:

     <LI=<I=R> is the rectangle being transformed.>
  }
  function RectToRect2D(const R: TRect): TRect2D;
  {: This function transforms a rectangle with real coordinates
     into a rectangle with integer coordinates.
     To do the transformation the function <I=Round> is used.

     The resulting rectangle is specified in Windows screen coordinate
     system.

     Parameters:

     <LI=<I=R> is the rectangle being transformed.>
  }
  function Rect2DToRect(R: TRect2D): TRect;
  {: This function enlarges a rectangle by the specified
     percentual.

     The resulting rectangle is always cartesian.

     Parameters:

     <LI=<I=R> is the box being enlarged.>
     <LI=<I=Perc> is the percentual by which enlarge the box.
     A value of 0.5 means the the rectangle is doubled (50%).>
  }
  function EnlargeBoxPerc2D(R: TRect2D; const Perc: TRealType): TRect2D;
  {: This function enlarges a rectangle by the specified
     delta in all directions.

     The resulting rectangle is always cartesian.

     Parameters:

     <LI=<I=R> is the box being enlarged.>
     <LI=<I=Delta> is the amount by which enlarge the box.
     A value of 0.1 means the the rectangle is enlarged by
     0.1 along the X-Y directions.
  }
  function EnlargeBoxDelta2D(R: TRect2D; const Delta: TRealType): TRect2D;
  {: This function multiplies two affine matrix. It
     returns the resulting matrix.

     The order of multiplication is important for matrixes.

     This function may be useful to concatenate transformation
     matrixes.

     Parameters:

     <LI=<I=M1> is the first matrix.>
     <LI=<I=M2> is the second matrix.>
  }
  function MultiplyTransform2D(const M1, M2: TTransf2D): TTransf2D;
  {: This function returns the invers of a matrix.

     The matrix must be non singular (that is its determinant
     is non zero).

     This function may be useful to obtain the inverse of
     a transformation.

     Parameters:
     <LI=<I=M> is the matrix to be inverted.>
  }
  function InvertTransform2D(const M1: TTransf2D): TTransf2D;
  {: This function transforms a points by using a
     transformation matrix.

     Use <See function=Translate2D>, <See function=Rotate2D>
     and <See function=Scale2D> to obtain a transformation
     matrix for the most common transforms.

     Parameters:

     <LI=<I=P> is the point to be transformed.>
     <LI=<I=T> is the transformation matrix.>
  }
  function TransformPoint2D(const P: TPoint2D; const T: TTransf2D): TPoint2D;
  {: This function transforms a vector by using a transformation
     matrix.

     Use <See function=Translate2D>, <See function=Rotate2D> and
     <See function=Scale2D> to obtain a transformation matrix
     for the most common transforms.

     Parameters:

     <LI=<I=V> is the vector to be transformed.>
     <LI=<I=T> is the transformation matrix.>
  }
  function TransformVector2D(const V: TVector2D; const T: TTransf2D): TVector2D;
  {: This function transforms a rectangle by using a
     transformation matrix. The first corner and the second corner
     of the rectangle are transformed.

     Use <See function=Translate2D>, <See function=Rotate2D> and
     <See function=Scale2D> to obtain a transformation matrix
     for the most common transforms.

     Parameters:

     <LI=<I=R> is the rectangle to be transformed.>
     <LI=<I=T> is the transformation matrix.>
  }
  function TransformRect2D(const R: TRect2D; const T: TTransf2D): TRect2D;
  {: This function transforms a bounding box by using a
     transformation matrix. The resulting rectangle is a the
     bounding box that fully contains the passed rectangle.

     Use <See function=Translate2D>, <See function=Rotate2D> and
     <See function=Scale2D> to obtain a transformation matrix
     for the most common transforms.

     Parameters:

     <LI=<I=R> is the rectangle to be transformed.>
     <LI=<I=T> is the transformation matrix.>
  }
  function TransformBoundingBox2D(const Box: TRect2D; const Transf: TTransf2D): TRect2D;
  {: This function returns a transformation matrix that
     correspond to a 2D translation.

     Parameters:

     <LI=<I=Tx> is the translation among the X axis.>
     <LI=<I=Ty> is the translation among the Y axis.>
  }
  function Translate2D(const Tx, Ty: TRealType): TTransf2D;
  {: This function returns a transformation matrix that
     correspond to a 2D rotation.

     The center of rotation is in (0, 0). To rotate along a
     point (px, py), concatenate the following matrixes:

     <Code=
       Translate(-px, -py) -> Rotate2D(A) -> Translate(px, py)
     >

     Parameters:

     <LI=<I=R> is the angle of rotation in radiants.>
  }
  function Rotate2D(const R: TRealType): TTransf2D;
  {: This function returns a transformation matrix that
     correspond to a 2D scaling.

     Parameters:

     <LI=<I=Sx> is the scaling among the X axis.>
     <LI=<I=Sy> is the scaling among the Y axis.>
  }
  function Scale2D(const Sx, Sy: TRealType): TTransf2D;
  {: This function creates a matrix transform that maps
     the points in the W window, in points in the V window.

     The function mantains the aspect ratio desired (if non zero).

     Parameters:

     <LI=<I=W> is the source rectangle>
     <LI=<I=V> is the destionation rectangle>
     <LI=<I=Aspect> is the aspect ratio, that is <I=XW/YW>.>
  }
  function GetVisualTransform2D(var W: TRect2D; const V: TRect; Aspect: TRealType): TTransf2D;
  {: This procedure may be used to apply an ortogonal
     constraint to a point.

     The parameter <I=CurrPt> is modified so that the
     ray beetwen <I=LastPt> and <I=CurrPt> is parallel
     to the axis <I=X> or <I=Y>. The new <I=CurrPt> will
     be on that ray, and the ray will be parallel to the
     axis that lead to the greter lenght on the ray.

     Parameters:

     <LI=<I=LastPt> is the reference point>
     <LI=<I=CurrPt> is the point to be constrained.>
  }
  procedure MakeOrto2D(LastPt: TPoint2D; var CurrPt: TPoint2D);
  {: This function returns the dot product of two vectors.
     The resulting value is given by <I=S=a.X*b.X+a.Y*b.Y>.

     If the vectors are versors, then the result value is
     the coseno of the angle beetwen the versors.

     Parameters:

     <LI=<I=A> is the first vector>
     <LI=<I=B> is the second vector>
  }
  function DotProduct2D(const A, B: TVector2D): TRealType;
  {: This function returns the vector that is
     perpendicular to the given one.

     Parameters:

     <LI=<I=V> is the reference vector>
  }
  function Perpendicular2D(const V: TVector2D): TVector2D;
  {: This function returns the vector that rapresent
     the opposite of the given one.

     The result will be <I=(-V.X, -V.Y)>.

     Parameters:

     <LI=<I=V> is the reference vector>
  }
  function Reflect2D(const V: TVector2D): TVector2D;
  {: This function clips a segment against a rectangular
     clipping region.

     The function returns the clipping result code
     and change <I=Pt1> and <I=Pt2> on the base of the clipping.

     The resulting value can be one of the following:

     <LI=<I=[ccNotVisible]> if the segment is not visible
      in the clipping region.>
     <LI=<I=[ccVisible]> if the segment is fully contained
      in the clipping region.>
     <LI=<I=[ccFirstEdge]> if the first point of segment
      was clipped.>
     <LI=<I=[ccSecondEdge]> if the second point of segment
      was clipped.>
     <LI=<I=[ccFirstEdge, ccSecondEdge]> if the bothe point
      of segment were clipped.>

     Parameters:

     <LI=<I=Clip> is the clipping region.>
     <LI=<I=Pt1> is the first point of the segment.>
     <LI=<I=Pt2> is the second point of the segment.>
  }
  function ClipLine2D(Clip: TRect2D; var Pt1, Pt2: TPoint2D): TClipResult;
  {: This function clips a segment against the left and right
     edges of a rectangular clipping region.

     The function returns the clipping result code and change
     <I=Pt1> and <I=Pt2> on the base of the clipping.

     The resulting value can be one of the following:

     <LI=<I=[ccNotVisible]> if the segment is not visible
      in the clipping region.>
     <LI=<I=[ccVisible]> if the segment is fully contained in
      the clipping region.>
     <LI=<I=[ccFirstEdge]> if the first point of segment
      was clipped.>
     <LI=<I=[ccSecondEdge]> if the second point of segment was
      clipped.>
     <LI=<I=[ccFirstEdge, ccSecondEdge]> if both the point
      of segment were clipped.>

     Parameters:

     <LI=<I=Clip> is the clipping region.>
     <LI=<I=Pt1> is the first point of the segment.>
     <LI=<I=Pt2> is the second point of the segment.>
  }
  function ClipLineLeftRight2D(Clip: TRect2D; var Pt1, Pt2: TPoint2D): TClipResult;
  {: This function clips a segment against the upper and
     bottom edges of a rectangular clipping region.

     The function returns the clipping result code and
     change <I=Pt1> and <I=Pt2> on the base of the clipping.

     The resulting value can be one of the following:

     <LI=<I=[ccNotVisible]> if the segment is not visible in
      the clipping region.>
     <LI=<I=[ccVisible]> if the segment is fully contained in
      the clipping region.>
     <LI=<I=[ccFirstEdge]> if the first point of segment was
      clipped.>
     <LI=<I=[ccSecondEdge]> if the second point of segment
      was clipped.>
     <LI=<I=[ccFirstEdge, ccSecondEdge]> if both the point
      of segment were clipped.>

     Parameters:

     <LI=<I=Clip> is the clipping region.>
     <LI=<I=Pt1> is the first point of the segment.>
     <LI=<I=Pt2> is the second point of the segment.>
  }
  function ClipLineUpBottom2D(Clip: TRect2D; var Pt1, Pt2: TPoint2D): TClipResult;
  {: This function returns <B=True> if the point <I=P> lies
     on the segment from <I=P1> to <I=P2>.

     Parameters:

     <LI=<I=P> is the testing point>
     <LI=<I=P1> is the first point of the segment.>
     <LI=<I=P2> is the second point of the segment.>
  }
  function IsPointOnSegment2D(P, P1, P2: TPoint2D): Boolean;
  {: This function returns the distance of <I=P> from the
     segment from <I=P1> to <I=P2>.

     Parameters:

     <LI=<I=P> is the testing point>
     <LI=<I=P1> is the first point of the segment.>
     <LI=<I=P2> is the second point of the segment.>
  }
  function PointLineDistance2D(P, P1, P2: TPoint2D): TRealType;
  {: This function returns the distance beetwen two points.

     The resulting value is always positive.

     Parameters:

     <LI=<I=P1> is the first point>
     <LI=<I=P2> is the second point>
  }
  function PointDistance2D(const P1, P2: TPoint2D): TRealType;
  {: This function returns <B=True> if the point P is in the axis aligned
     box with the side equal to 2*Aperture and centered at the point <I=RP>.
     So a point may be considered near also if its distance from RP is
     greater than Aperture.

     Parameters:

     <LI=<I=RP> is the reference point>
     <LI=<I=P> is the testing point>
     <LI=<I=Aperture> is the half side of reference box>
     <LI=<I=Dist> will contains the distance of <I=P>
      from <I=RP>. If the function returns <B=False>,
      <I=Dist> will be set to <See const=MaxCoord>.
  }
  function NearPoint2D(RP, P: TPoint2D; const Aperture: TRealType; var Dist: TRealType): Boolean;
  {: This function returns a position code that rapresent the
     position of a point respect to the given polyline.

     The result value is one of the following:

     <LI=<I=PICK_NOOBJECT> if the point <I=P> isn't near to
      the polyline>
     <LI=<I=PICK_ONOBJECT> if the point <I=P> is near to
      the passed polyline by a distance less than <I=Aperture>.>

     Parameters:

     <LI=<I=Vect> is the reference polyline. It is a PVectPoints2D
         and is returned by <See Property=TPointsSet2D@PointsReference> >
     <LI=<I=Count> is the number of points of the polyline >
     <LI=<I=P> is the testing point>
     <LI=<I=Dist> will contains the real distance of <I=P>
      from the polyline. If the function returns
      <I=PICK_NOOBJECT>, <I=Dist> will be set to
      <See const=MaxCoord>.>
     <LI=<I=Aperture> is the reference distance>
     <LI=<I=T> is an optional transformation matrix.
      The polyline is transformed by this matrix before
      the testing.>
     <LI=<I=MustClose>. If it is <B=True> the polyline will
      be closed (if it is not already closed).>
  }
  function IsPointOnPolyLine2D(const Vect: Pointer; Count: Integer;
                               P: TPoint2D; var Dist: TRealType;
                               const Aperture: TRealType; const T: TTransf2D;
                               const MustClose: Boolean): Integer;
  {: This function returns a position code that rapresent the
     position of a point respect to the given closed polygon.

     The result value is one of the following:

     <LI=<I=PICK_NOOBJECT> if the point <I=P> isn't near to the
      polygon>
     <LI=<I=PICK_ONOBJECT> if the point <I=P> is near to the
      passed polygon by a distance less than <I=Aperture>.>
     <LI=<I=PICK_INOBJECT> if the point is inside the polygon.

     Parameters:

     <LI=<I=Vect> is the reference polyline. It is a PVectPoints2D
         and is returned by <See Property=TPointsSet2D@PointsReference> >
     <LI=<I=Count> is the number of points of the polyline >
     <LI=<I=P> is the testing point>
     <LI=<I=Dist> will contains the real distance of <I=P>
      from the polyline. If the function returns
      <I=PICK_NOOBJECT>, <I=Dist> will be set to
      <See const=MaxCoord>.>
     <LI=<I=Aperture> is the reference distance>
     <LI=<I=T> is an optional transformation matrix. The
      polyline is transformed by this matrix before the testing.>
  }
  function IsPointInPolygon2D(const Vect: Pointer; Count: Integer;
                              P: TPoint2D; var Dist: TRealType;
                              const Aperture: TRealType; const T: TTransf2D): Integer;
  {: This function returns a position code that rapresent
     the position of a point respect to the given line.

     The result value is one of the following:

     <LI=<I=PICK_NOOBJECT> if the point <I=P> isn't near to
      the segment>
     <LI=<I=PICK_ONOBJECT> if the point <I=P> is near to
      the passed segment by a distance less than <I=Aperture>.>

     Parameters:

     <LI=<I=A> is the first point of the segment>
     <LI=<I=B> is the second point of the segment>
     <LI=<I=P> is the testing point>
     <LI=<I=Dist> will contains the real distance of
      <I=P> from the segment. If the function returns
      <I=PICK_NOOBJECT>, <I=Dist> will be set to <See const=MaxCoord>.>
     <LI=<I=Aperture> is the reference distance>
     <LI=<I=T> is an optional transformation matrix.
      The line is transformed by this matrix before the testing.>
  }
  function IsPointOnLine2D(A, B, P: TPoint2D; var Dist: TRealType;
                           const Aperture: TRealType; const T: TTransf2D): Integer;
  {: This function returns a position code that rapresent the
    position of a point respect to the given rectangle.

    The result value is one of the following:

    <LI=<I=PICK_NOOBJECT> if the point <I=P> isn't near to
     the rectangle>
    <LI=<I=PICK_ONOBJECT> if the point <I=P> is near to the
     passed rectangle by a distance less than <I=Aperture>.>
    <LI=<I=PICK_INOBJECT> if the point is inside the rectangle.>

    Parameters:

    <LI=<I=Box> is the axis alligned rectangle>
    <LI=<I=P> is the testing point>
    <LI=<I=Dist> will contains the real distance of <I=P> from
     the box. If the function returns
     <I=PICK_NOOBJECT>, <I=Dist> will be set to <See const=MaxCoord>.>
    <LI=<I=Aperture> is the reference distance>
    <LI=<I=T> is an optional transformation matrix. The
     box is transformed by this matrix before the testing.>
  }
  function IsPointOnRect2D(const Box: TRect2D; P: TPoint2D; var Dist: TRealType;
                           const Aperture: TRealType; const T: TTransf2D): Integer;
  {: This function returns <B=True> if the testing point is
     inside the reference rectangle.

     The function works on the assumption that the parameters
     are cartesian points (W = 1.0).

     Parameters:

     <LI=<I=Box> is the axis alligned rectangle>
     <LI=<I=P> is the testing point>
  }
  function IsPointInCartesianBox2D(const Pt: TPoint2D; const Box: TRect2D): Boolean;
  {: This function returns <B=True> if the testing point is
     inside the reference rectangle.

     The function works on both ordinary and non ordinary
     points, for the function makes the points ordinary (W=1.0)
     before do the test.

     Parameters:

     <LI=<I=Pt> is the testing point>
     <LI=<I=Box> is the axis alligned rectangle>
  }
  function IsPointInBox2D(Pt: TPoint2D; Box: TRect2D): Boolean;
  {: This function returns the smallest axis alligned rectangle
     that contains the given points and the given rectangle.

     The function works on both ordinary and non ordinary
     points, for the function makes the points ordinary (W=1.0)
     before do its job.

     Parameters:

     <LI=<I=Pt> is the point>
     <LI=<I=Box> is the axis alligned rectangle>
  }
  function PointOutBox2D(Pt: TPoint2D; Box: TRect2D): TRect2D;
  {: This function returns <B=True> if Box1 is completely or
     partially contained in Box2.

    The function works on both ordinary and non ordinary
    points, for the function makes the points ordinary
    (W=1.0) before do its job.

    Parameters:

    <LI=<I=Box1> is the first axis alligned rectangle>
    <LI=<I=Box2> is the second axis alligned rectangle>
  }
  function IsBoxInBox2D(Box1, Box2: TRect2D): Boolean;
  {: This function returns <B=True> if <I=Box2> is fully
     contained into <I=Box2>.

     The function works on both ordinary and non ordinary
     points, for the function makes the points ordinary
     (W=1.0) before do its job.

     Parameters:

     <LI=<I=Box1> is the first axis alligned rectangle>
     <LI=<I=Box2> is the second axis alligned rectangle>
  }
  function IsBoxAllInBox2D(Box1, Box2: TRect2D): Boolean;
  {: This function returns <B=True> if <I=Box2> is fully
     contained into <I=Box2>.

     The function works on the assumption that the parameters
     are ordinary points (W = 1.0).

     Parameters:

     <LI=<I=Box1> is the first axis alligned rectangle>
     <LI=<I=Box2> is the second axis alligned rectangle>
  }
  function IsBoxAllInCartesianBox2D(const Box1, Box2: TRect2D): Boolean;
  {: This function returns the smallest axis alligned rectangle
     that contains the given rectangles.

     The function works on both ordinary and non ordinary
     points, for the function makes the points ordinary (W=1.0)
     before do its job.

     Parameters:

     <LI=<I=Box1> is the first axis alligned rectangle>
     <LI=<I=Box2> is the second axis alligned rectangle>
  }
  function BoxOutBox2D(Box1, Box2: TRect2D): TRect2D;
  function BoxFillingCartesian2D(const Box1, Box2: TRect2D): Word;

  { Drawing functions
    Vect deve essere di tipo PVectPoints2D, Count è il numero di punti. }
  procedure Draw2DSubSetAsPolygon(const Vect: Pointer; Count: Integer;
                                  const Cnv: TDecorativeCanvas;
                                  const Clip, Extent: TRect2D;
                                  const S: TTransf2D;
                                  const StartIdx, EndIdx: Integer);
  {: This is an utility procedure useful when you want to mark a control point of
     a graphic object.

     It draws a small square of size <I=Wdt> centered at <I=X,Y> on the
     canvas <I=Cnv>. All the parameters are refered to window's screen
     coordinates. <I=Wdt> is half of the side of the square.
  }
  procedure DrawPlaceHolder(const Cnv: TDecorativeCanvas; const X, Y, Wdt: Integer);
  procedure DrawRoundPlaceHolder(const Cnv: TDecorativeCanvas; const X, Y, Wdt: Integer);
  {: This function can be used to draw a rectangle onto a
     canvas.

     The rectangle being drawed is first transformed by <I=MT>,
     then it is clipped within the specified region and
     then mapped on the screen with the matrix <I=S>.

     Parameters:

     <LI=<I=Cnv> is the canvas on which the rectangle is drawed.>
     <LI=<I=Box> is the rectangle to be drawed.>
     <LI=<I=Clip> is the clipping rectangle.>
     <LI=<I=MT> is the transform matrix to be applied to Box.>
     <LI=<I=S> is the mapping matrix used to map the clipped Box to the screen.>
  }
  procedure DrawRect2DAsPolyline(const Cnv: TDecorativeCanvas; const Box, Clip: TRect2D; const MT, S: TTransf2D);
  {: This function can be used to draw a box onto a canvas.

     The box being drawed is first transformed by
     <I=MT>, then it is clipped within the specified region and
     then mapped on the screen with the matrix <I=S>.

     The rectangle is filled with the canvas brush.

     Parameters:

     <LI=<I=Cnv> is the canvas on which the rectangle is drawed.>
     <LI=<I=Box> is the rectangle to be drawed.>
     <LI=<I=Clip> is the clipping rectangle.>
     <LI=<I=MT> is the transform matrix to be applied to Box>
     <LI=<I=S> is the mapping matrix used to map the clipped Boxto the screen.>
  }
  procedure DrawRect2DAsPolygon(const Cnv: TDecorativeCanvas; const Box, Clip: TRect2D; const MT, S: TTransf2D);
  {: This function can be used to draw a line onto a canvas.

     The line being drawed is clipped within the specified
     region and then mapped on the screen with the matrix <I=S>.

     Parameters:

     <LI=<I=Cnv> is the canvas on which the line is drawed.>
     <LI=<I=P1> is the first point of the line.>
     <LI=<I=P2> is the second point of the line.>
     <LI=<I=Clip>. This is the clipping rectangle.>
     <LI=<I=S> is the mapping matrix used to map the clipped line to the screen.>
  }
  function DrawLine2D(const Cnv: TDecorativeCanvas; P1, P2: TPoint2D; const Clip: TRect2D; const S: TTransf2D): Boolean;
  {: This function can be used to draw a bounding box onto
     a canvas.

     The box being drawed is first transformed by <I=MT>.
     This transformation keep the bounding box nature of
     the rectangle, so the transformed box has the edges
     parallel to the axis of the world.

     After that it is mapped onto the screen and clipped
     against the clipping region.

     Parameters:

     <LI=<I=Cnv> is the canvas on which the rectangle is drawed.>
     <LI=<I=Box> is the rectangle to be drawed.>
     <LI=<I=Clip> is the clipping rectangle.>
     <LI=<I=MT> is the transform matrix to be applied to <I=Box>.>
     <LI=<I=S> is the mapping matrix used to map the clipped
      <I=Box> to the screen.>
  }
  procedure DrawBoundingBox2D(const Cnv: TDecorativeCanvas; Box, Clip: TRect2D; const S: TTransf2D);

  { The below class utilities are for graphics object registration. }
  {: This procedure resets the list of graphic object registrations.

     See also <See=Object's Persistance@PERSISTANCE>.
  }
  procedure CADSysInitClassRegister;
  {: This function search for the index of the registered
     graphic object. If no match is found it returns -1.

     See also <See=Object's Persistance@PERSISTANCE>.
  }
  function  CADSysFindClassIndex(const Name: String): Word;
  {: This function search for the index of the registered
     graphic object by using its class name. If no match is
     found it returns -1.

     See also <See=Object's Persistance@PERSISTANCE>.
  }
  function  CADSysFindClassByName(const Name: String): TGraphicObjectClass;
  {: This function returns the class reference of the graphic
     object which the specified registration index.

     See also <See=Object's Persistance@PERSISTANCE>.
  }
  function  CADSysFindClassByIndex(Index: Word): TGraphicObjectClass;
  {: This procedure registers a new graphic object class in the
     library PERSISTANCE system.

     This method must be used to register your owns graphical
     object classes so that they can be streamed to a drawing
     file automatically by the library.

     <I=Index> is the registration index you choose.
     If a class is already registered in that slot an exception
     will be raised. It is better to register your classe from
     the index 150 on.

     There are <I=MAX_REGISTERED_CLASSES> slots in the
     registration list.

     See also <See=Object's Persistance@PERSISTANCE>.
  }
  procedure CADSysRegisterClass(Index: Word; const GraphClass: TGraphicObjectClass);
  {: This procedure unregisters a graphic object class in the
     library PERSISTANCE system.

     <I=Index> is the registration index to clear.

     See also <See=Object's Persistance@PERSISTANCE>.
  }
  procedure CADSysUnregisterClass(Index: Word);
  {: This function converts a pascal string to a <I=source block>
     name type.

     See also <See Type=TSourceBlockName>
  }
  function StringToBlockName(const Str: String): TSourceBlockName;

  procedure Register;

const
  {: This constant contains the version number of the library
     used as drawing file's header.
  }
  CADSysVersion: TCADVersion = 'CAD422';
  {: This constant is used as <I=drawing mode> value for
     the <See Property=TCADViewport@DrawMode>.
  }
  DRAWMODE_NORMAL = 0;
  {: This constant is used as <I=drawing mode> value for
     the <See Property=TCADViewport@DrawMode>.

     The <I=draw mode> values used as toogle flags. If this
     value is present in the DrawMode property no drawing
     will produced.
  }
  DRAWMODE_NODRAW = 1;
  {: This constant is used as <I=drawing mode> value for
     the <See Property=TCADViewport@DrawMode>.

     The <I=draw mode> values used as toogle flags. If this
     value is present in the DrawMode property the object
     are drawed with their control points.

     <B=Note>: Your drawing shape classess must understands these
     flags and behaves accordingly.
  }
  DRAWMODE_SHOWCTRLPOINTS = 2;
  {: This constant is used as <I=drawing mode> value for
     the <See Property=TCADViewport@DrawMode>.

     The <I=draw mode> values used as toogle flags. If this
     value is present in the DrawMode property only front
     facing planar object will be drawed (only for 3D viewports).

     The font facing check is <B=True> if the ray from the
     camera position to the view point is opposite to the face
     normal (ie you are looking the font face).

     <B=Note>: Your drawing shape classess must understands these
     flags and behaves accordingly.
  }
  {: This constant is used as <I=drawing mode> value for
     the <See Property=TCADViewport@DrawMode>.

     The <I=draw mode> values used as toogle flags. If this
     value is present in the DrawMode property the vectorial
     text objects will be drawed with only their bounding
     boxes.

     <B=Note>: Your drawing shape classess must understands these
     flags and behaves accordingly.
  }
  DRAWMODE_VECTTEXTONLYBOX = 32;

  {:
  }
  MAX_REGISTERED_CLASSES = 512;

  {: This commands stops the current task with success.

     See also <See Method=TCADPrg@SendUserEvent>.
  }
  CADPRG_ACCEPT = 1;
  {: This commands aborts the current task.

     See also <See Method=TCADPrg@SendUserEvent>.
  }
  CADPRG_CANCEL = 2;

Implementation

uses Math, Dialogs, Forms, CS4Tasks, CS4Shapes;

type
  TPaintingThread = class(TThread)
  private
    { Private declarations }
    fOwner: TCADViewport;
    fRect: TRect2D;
  public
    // Assign also the OnTerminate event.
    constructor Create(const Owner: TCADViewport; const ARect: TRect2D);
    destructor Destroy; override;

    procedure Execute; override;
  end;

  TGraphicClassRegistered = array[0..512] of TGraphicObjectClass;

  PObjBlock = ^TObjBlock;

  TObjBlock = record
    Obj: TGraphicObject; { Graphic object. }
    Next, Prev: PObjBlock; { Linked list pointer. }
  end;

var
  GraphicObjectsRegistered: TGraphicClassRegistered;

// 2D Clipping functions.

{ This function returns the position code of P against Clip.
  P and Clip must be cartesian point, Clip must be ordered.
}
function _PositionCode2D(const Clip: TRect2D; const P: TPoint2D): TOutCode;
begin
  Result := [];
  if P.X < Clip.Left then
   Result := [left]
  else if P.X > Clip.Right then
   Result := [right];
  if P.Y < Clip.Bottom then
   Result := Result + [bottom]
  else if P.Y > Clip.Top then
   Result := Result + [top];
end;

{ This function is used to implement the Liang-Barsky clipping method. }
function _ClipPt(const Denom, Num: Extended; var tE, tL: Extended): Boolean;
var
  T: Extended;
begin
  Result := False;
  if Denom > 0 then
   begin
     T := Num / Denom;
     if T > tL then
      Exit
     else if T > tE then
      tE := T;
   end
  else if Denom < 0 then
   begin
     T := Num / Denom;
     if T < tE then
      Exit
     else if T < tL then
      tL := T;
   end
  else if Num > 0 then
   Exit;
  Result := True;
end;

{ Implement the Liang-Barsky algoritm. }
function _ClipLine2D(const Clip: TRect2D; var Pt1, Pt2: TPoint2D): TClipResult;
var
  DX, DY, tE, tL: Extended;
begin
  Pt1 := CartesianPoint2D(Pt1);
  Pt2 := CartesianPoint2D(Pt2);
  DX := Pt2.X - Pt1.X;
  DY := Pt2.Y - Pt1.Y;
  Result := [ccNotVisible];
  if (DX = 0) and (DY = 0) and IsPointInCartesianBox2D(Pt1, Clip) then
   begin
     Result := [ccVisible];
     Exit;
   end;
  tE := 0.0;
  tL := 1.0;
  // 0.9 in 1.
  if _ClipPt(DX, Clip.Left - Pt1.X, tE, tL) then
   if _ClipPt(-DX, Pt1.X - Clip.Right, tE, tL) then
    if _ClipPt(DY, Clip.Bottom - Pt1.Y, tE, tL) then
     if _ClipPt(-DY, Pt1.Y - Clip.Top, tE, tL) then
      begin
        Result := [];
        if tL < 1 then
         begin
           Pt2.X := Pt1.X + tL * DX;
           Pt2.Y := Pt1.Y + tL * DY;
           Result := [ccSecond];
         end;
        if tE > 0 then
         begin
           Pt1.X := Pt1.X + tE * DX;
           Pt1.Y := Pt1.Y + tE * DY;
           Result := Result + [ccFirst];
         end;
        if Result = [] then
         Result := [ccVisible];
      end;
end;

{ Implement the Liang-Barsky algoritm. }
function _ClipLineLeftRight2D(const Clip: TRect2D; var Pt1, Pt2: TPoint2D): TClipResult;
var
  DX, DY, tE, tL: Extended;
begin
  Pt1 := CartesianPoint2D(Pt1);
  Pt2 := CartesianPoint2D(Pt2);
  DX := Pt2.X - Pt1.X;
  DY := Pt2.Y - Pt1.Y;
  Result := [ccNotVisible];
  if (DX = 0) and (DY = 0) and IsPointInCartesianBox2D(Pt1, Clip) then
   begin
     Result := [ccVisible];
     Exit;
   end;
  tE := 0.0;
  tL := 1.0;
  { 0.9 in 1. }
  if _ClipPt(DX, Clip.Left - Pt1.X, tE, tL) then
   if _ClipPt(-DX, Pt1.X - Clip.Right, tE, tL) then
    begin
      Result := [];
      if tL < 1 then
       begin
         Pt2.X := Pt1.X + tL * DX;
         Pt2.Y := Pt1.Y + tL * DY;
         Result := [ccSecond];
       end;
      if tE > 0 then
       begin
         Pt1.X := Pt1.X + tE * DX;
         Pt1.Y := Pt1.Y + tE * DY;
         Result := Result + [ccFirst];
       end;
      if Result = [] then
       Result := [ccVisible];
    end;
end;

{ Implement the Liang-Barsky algoritm. }
function _ClipLineUpBottom2D(const Clip: TRect2D; var Pt1, Pt2: TPoint2D): TClipResult;
var
  DX, DY, tE, tL: Extended;
begin
  Pt1 := CartesianPoint2D(Pt1);
  Pt2 := CartesianPoint2D(Pt2);
  DX := Pt2.X - Pt1.X;
  DY := Pt2.Y - Pt1.Y;
  Result := [ccNotVisible];
  if (DX = 0) and (DY = 0) and IsPointInCartesianBox2D(Pt1, Clip) then
   begin
     Result := [ccVisible];
     Exit;
   end;
  tE := 0.0;
  tL := 1.0;
  { 0.9 in 1. }
  if _ClipPt(DY, Clip.Bottom - Pt1.Y, tE, tL) then
   if _ClipPt(-DY, Pt1.Y - Clip.Top, tE, tL) then
    begin
      Result := [];
      if tL < 1 then
       begin
         Pt2.X := Pt1.X + tL * DX;
         Pt2.Y := Pt1.Y + tL * DY;
         Result := [ccSecond];
       end;
      if tE > 0 then
       begin
         Pt1.X := Pt1.X + tE * DX;
         Pt1.Y := Pt1.Y + tE * DY;
         Result := Result + [ccFirst];
       end;
      if Result = [] then
       Result := [ccVisible];
    end;
end;

{ General functions }

function DegToRad(const A: TRealType): TRealType;
begin
  Result := A * Pi / 180.0;
end;

function RadToDeg(const A: TRealType): TRealType;
begin
  Result := A * 180.0 / Pi;
end;

// Hue: 0-360
function HSVToRGB(Hue, Sat, V: TRealType): TColor;
var
  i: Integer;
  R, G, B: Integer;
  f, p, q, t: TRealType;
begin
  Hue := (Hue / 60.0);
  i := Trunc(Hue);
  f := Hue - i;
  p := V * (1.0 - Sat);
  q := V * (1.0 - (Sat * f));
  t := V * (1.0 - (Sat * (1.0 - f)));
  R := 0; G := 0; B := 0;
  case i of
   0: begin
     R := Trunc(V * 255);
     G := Trunc(t * 255);
     B := Trunc(p * 255);
   end;
   1: begin
     R := Trunc(q * 255);
     G := Trunc(V * 255);
     B := Trunc(p * 255);
   end;
   2: begin
     R := Trunc(p * 255);
     G := Trunc(V * 255);
     B := Trunc(t * 255);
   end;
   3: begin
     R := Trunc(p * 255);
     G := Trunc(q * 255);
     B := Trunc(V * 255);
   end;
   4: begin
     R := Trunc(t * 255);
     G := Trunc(p * 255);
     B := Trunc(V * 255);
   end;
   5: begin
     R := Trunc(V * 255);
     G := Trunc(p * 255);
     B := Trunc(q * 255);
   end;
  end;
  Result := RGB(R, G, B);
end;

{ 2D functions }

function IsSamePoint2D(P1, P2: TPoint2D): Boolean;
begin
  if( P1.W <> P2.W ) then
   begin
     P1 := CartesianPoint2D(P1);
     P2 := CartesianPoint2D(P2);
   end;
  Result := (P1.X = P2.X) and (P1.Y = P2.Y);
end;

function IsSameVector2D(const V1, V2: TVector2D): Boolean;
begin
  Result := (V1.X = V2.X) and (V1.Y = V2.Y);
end;

function IsSameTransform2D(const T1, T2: TTransf2D): Boolean;
begin
  Result := (T1[1, 1] = T2[1, 1])
            and (T1[1, 2] = T2[1, 2])
            and (T1[1, 3] = T2[1, 3])
            and (T1[2, 1] = T2[2, 1])
            and (T1[2, 2] = T2[2, 2])
            and (T1[2, 3] = T2[2, 3])
            and (T1[3, 1] = T2[3, 1])
            and (T1[3, 2] = T2[3, 2])
            and (T1[3, 3] = T2[3, 3]);
end;

function IsCartesianTransform2D(const T: TTransf2D): Boolean;
begin
  Result := (T[1, 3] = 0.0) and (T[2, 3] = 0.0) and (T[3, 3] = 1.0);
end;

function Point2D(const X, Y: TRealType): TPoint2D;
begin
  Result.X := X;
  Result.Y := Y;
  Result.W := 1.0;
end;

function VectorLength2D(const V: TVector2D): TRealType;
begin
  Result := Sqrt(V.X * V.X + V.Y * V.Y);
end;

function Versor2D(const X, Y: TRealType): TVector2D;
begin
  Result.X := X;
  Result.Y := Y;
  Result := NormalizeVector2D(Result);
end;

function NormalizeVector2D(const V: TVector2D): TVector2D;
var
  Modul: TRealType;
begin
  Modul := VectorLength2D(V);
  Result := V;
  if (Modul <> 1.0) and (Modul <> 0.0) then
   begin
     Modul := 1.0 / Modul;
     Result.X := V.X * Modul;
     Result.Y := V.Y * Modul;
   end;
end;

function Vector2D(PFrom, PTo: TPoint2D): TVector2D;
begin
  if PFrom.W <> PTo.W then
   begin
     PFrom := CartesianPoint2D(PFrom);
     PTo := CartesianPoint2D(PTo);
   end;
  Result.X := PTo.X - PFrom.X;
  Result.Y := PTo.Y - PFrom.Y;
end;

function Direction2D(const PFrom, PTo: TPoint2D): TVector2D;
begin
  Result := NormalizeVector2D(Vector2D(PFrom, PTo));
end;

function ReOrderRect2D(const R: TRect2D): TRect2D;
begin
  Result := CartesianRect2D(R);
  if R.Left > R.Right then
   begin
     Result.Left := R.Right;
     Result.Right := R.Left;
   end;
  if R.Bottom > R.Top then
   begin
     Result.Bottom := R.Top;
     Result.Top := R.Bottom;
   end;
end;

function Rect2D(const Left, Bottom, Right, Top: TRealType): TRect2D;
begin
  Result.Left := Left;
  Result.Right := Right;
  Result.W1 := 1.0;
  Result.Bottom := Bottom;
  Result.Top := Top;
  Result.W2 := 1.0;
end;

function CartesianPoint2D(const P: TPoint2D): TPoint2D;
begin
  if (P.W <> 1.0) and (P.W <> 0.0) then
   begin
     Result.X := P.X / P.W;
     Result.Y := P.Y / P.W;
     Result.W := 1.0;
   end
  else
   Result := P;
end;

function CartesianRect2D(const R: TRect2D): TRect2D;
begin
  Result.FirstEdge := CartesianPoint2D(R.FirstEdge);
  Result.SecondEdge := CartesianPoint2D(R.SecondEdge);
end;

function Point2DToPoint(const P2D: TPoint2D): TPoint;
begin
  if (P2D.W <> 1.0) and (P2D.W <> 0.0) then
   begin
     Result.X := Round(P2D.X / P2D.W);
     Result.Y := Round(P2D.Y / P2D.W);
   end
  else
   begin
     Result.X := Round(P2D.X);
     Result.Y := Round(P2D.Y);
   end
end;

function PointToPoint2D(const P: TPoint): TPoint2D;
begin
  Result.X := P.X;
  Result.Y := P.Y;
  Result.W := 1.0;
end;

function RectToRect2D(const R: TRect): TRect2D;
begin
  Result := Rect2D(R.Left, R.Top, R.Right, R.Bottom);
end;

function Rect2DToRect(R: TRect2D): TRect;
begin
  R := ReorderRect2D(R);
  Result.Left := Round(R.Left);
  Result.Right := Round(R.Right);
  Result.Top := Round(R.Bottom);
  Result.Bottom := Round(R.Top);
end;

function EnlargeBoxDelta2D(R: TRect2D; const Delta: TRealType): TRect2D;
begin
  R := CartesianRect2D(R);
  Result.Left := R.Left - Delta;
  Result.Right := R.Right + Delta;
  Result.W1 := 1.0;
  Result.Bottom := R.Bottom - Delta;
  Result.Top := R.Top + Delta;
  Result.W2 := 1.0;
end;

function EnlargeBoxPerc2D(R: TRect2D; const Perc: TRealType): TRect2D;
var
  Marg: TRealType;
begin
  R := CartesianRect2D(R);
  Marg := Abs(R.Right - R.Left) * Perc;
  Result.Left := R.Left - Marg;
  Result.Right := R.Right + Marg;
  Marg := Abs(R.Top - R.Bottom) * Perc;
  Result.Bottom := R.Bottom - Marg;
  Result.Top := R.Top + Marg;
  Result.W1 := 1.0;
  Result.W2 := 1.0;
end;

function GetVisualTransform2D(var W: TRect2D; const V: TRect;
                              Aspect: TRealType): TTransf2D;
var
  TmpAsp: TRealType;
begin
  {
    | Sx                     0                          0 |
    | 0                      Sy                         0 |
    | V.Left-(Sx*W.Left)+0.5 V.Bottom-(Sy*W.Bottom)+0.5 1 |

    Sx=(V.Right-V.Left-1.0)/(W.Right-W.Left)
    Sy=(V.Top-V.Bottom-1.0)/(W.Top-W.Bottom)
    Se pero' AspectRatio=Sx/Sy > 0 allora Sy=Sx/AspectRatio.
  }
  try
    if Aspect > 0.0 then
     begin
       TmpAsp := (V.Right - V.Left) / (V.Bottom - V.Top) * Aspect;
       if (W.Top - W.Bottom) > (W.Right - W.Left) / TmpAsp then
        W.Right := W.Left + (W.Top - W.Bottom) * TmpAsp
       else
        W.Top := W.Bottom + (W.Right - W.Left) / TmpAsp;
     end;
    Result[1, 1] := (V.Right - V.Left) / (W.Right - W.Left);
    Result[1, 2] := 0.0;
    Result[1, 3] := 0.0;
    Result[2, 1] := 0.0;
    Result[2, 2] := (V.Top - V.Bottom) / (W.Top - W.Bottom);
    Result[2, 3] := 0.0;
    Result[3, 1] := V.Left - Result[1, 1] * W.Left - 0.5;
    Result[3, 2] := V.Bottom - Result[2, 2] * W.Bottom - 0.5;
    Result[3, 3] := 1.0;
  except
   on EZeroDivide do Result := IdentityTransf2D;
  end;
end;

function MultiplyTransform2D(const M1, M2: TTransf2D): TTransf2D;
var
  B1, B2: Boolean;
begin
  B1 := (M1[1, 3] = 0.0) and (M1[2, 3] = 0.0) and (M1[3, 3] = 1.0);
  B2 := (M2[1, 3] = 0.0) and (M2[2, 3] = 0.0) and (M2[3, 3] = 1.0);
  if B1 and B2 then
   begin
     Result[1, 1] := M1[1, 1] * M2[1, 1] + M1[1, 2] * M2[2, 1];
     Result[1, 2] := M1[1, 1] * M2[1, 2] + M1[1, 2] * M2[2, 2];
     Result[1, 3] := 0.0;

     Result[2, 1] := M1[2, 1] * M2[1, 1] + M1[2, 2] * M2[2, 1];
     Result[2, 2] := M1[2, 1] * M2[1, 2] + M1[2, 2] * M2[2, 2];
     Result[2, 3] := 0.0;

     Result[3, 1] := M1[3, 1] * M2[1, 1] + M1[3, 2] * M2[2, 1] + M2[3, 1];
     Result[3, 2] := M1[3, 1] * M2[1, 2] + M1[3, 2] * M2[2, 2] + M2[3, 2];
     Result[3, 3] := 1.0;
   end
  else if B1 and (not B2) then
   begin
     Result[1, 1] := M1[1, 1] * M2[1, 1] + M1[1, 2] * M2[2, 1];
     Result[1, 2] := M1[1, 1] * M2[1, 2] + M1[1, 2] * M2[2, 2];
     Result[1, 3] := M1[1, 1] * M2[1, 3] + M1[1, 2] * M2[2, 3];

     Result[2, 1] := M1[2, 1] * M2[1, 1] + M1[2, 2] * M2[2, 1];
     Result[2, 2] := M1[2, 1] * M2[1, 2] + M1[2, 2] * M2[2, 2];
     Result[2, 3] := M1[2, 1] * M2[1, 3] + M1[2, 2] * M2[2, 3];

     Result[3, 1] := M1[3, 1] * M2[1, 1] + M1[3, 2] * M2[2, 1] + M2[3, 1];
     Result[3, 2] := M1[3, 1] * M2[1, 2] + M1[3, 2] * M2[2, 2] + M2[3, 2];
     Result[3, 3] := M1[3, 1] * M2[1, 3] + M1[3, 2] * M2[2, 3] + M2[3, 3];
   end
  else if (not B1) and B2 then
   begin
     Result[1, 1] := M1[1, 1] * M2[1, 1] + M1[1, 2] * M2[2, 1] + M1[1, 3] * M2[3, 1];
     Result[1, 2] := M1[1, 1] * M2[1, 2] + M1[1, 2] * M2[2, 2] + M1[1, 3] * M2[3, 2];
     Result[1, 3] := M1[1, 3];

     Result[2, 1] := M1[2, 1] * M2[1, 1] + M1[2, 2] * M2[2, 1] + M1[2, 3] * M2[3, 1];
     Result[2, 2] := M1[2, 1] * M2[1, 2] + M1[2, 2] * M2[2, 2] + M1[2, 3] * M2[3, 2];
     Result[2, 3] := M1[2, 3];

     Result[3, 1] := M1[3, 1] * M2[1, 1] + M1[3, 2] * M2[2, 1] + M1[3, 3] * M2[3, 1];
     Result[3, 2] := M1[3, 1] * M2[1, 2] + M1[3, 2] * M2[2, 2] + M1[3, 3] * M2[3, 2];
     Result[3, 3] := M1[3, 3];
   end
  else
   begin
     Result[1, 1] := M1[1, 1] * M2[1, 1] + M1[1, 2] * M2[2, 1] + M1[1, 3] * M2[3, 1];
     Result[1, 2] := M1[1, 1] * M2[1, 2] + M1[1, 2] * M2[2, 2] + M1[1, 3] * M2[3, 2];
     Result[1, 3] := M1[1, 1] * M2[1, 3] + M1[1, 2] * M2[2, 3] + M1[1, 3] * M2[3, 3];

     Result[2, 1] := M1[2, 1] * M2[1, 1] + M1[2, 2] * M2[2, 1] + M1[2, 3] * M2[3, 1];
     Result[2, 2] := M1[2, 1] * M2[1, 2] + M1[2, 2] * M2[2, 2] + M1[2, 3] * M2[3, 2];
     Result[2, 3] := M1[2, 1] * M2[1, 3] + M1[2, 2] * M2[2, 3] + M1[2, 3] * M2[3, 3];

     Result[3, 1] := M1[3, 1] * M2[1, 1] + M1[3, 2] * M2[2, 1] + M1[3, 3] * M2[3, 1];
     Result[3, 2] := M1[3, 1] * M2[1, 2] + M1[3, 2] * M2[2, 2] + M1[3, 3] * M2[3, 2];
     Result[3, 3] := M1[3, 1] * M2[1, 3] + M1[3, 2] * M2[2, 3] + M1[3, 3] * M2[3, 3];
   end;
end;

{
  a11 a12
  a21 a22
}
function _Det2(a11, a21, a12, a22: TRealType): TRealType;
begin
  Result := a11*a22-a12*a21;
end;

function _Det3_2D(const M: TTransf2D): TRealType;
begin
  Result := M[1, 1] * M[2, 2] * M[3, 3] +
            M[1, 3] * M[2, 1] * M[3, 2] +
            M[1, 2] * M[2, 3] * M[3, 1] -
            M[1, 3] * M[2, 2] * M[3, 1] -
            M[1, 1] * M[3, 2] * M[2, 3] -
            M[1, 2] * M[2, 1] * M[3, 3];
end;

function _Adjoint3(const M: TTransf2D): TTransf2D;
var
  a1,a2,a3,b1,b2,b3,c1,c2,c3: TRealType;
begin
  a1 := M[1,1];
  a2 := M[2,1];
  a3 := M[3,1];
  b1 := M[1,2];
  b2 := M[2,2];
  b3 := M[3,2];
  c1 := M[1,3];
  c2 := M[2,3];
  c3 := M[3,3];

  Result[1, 1] := _Det2(b2,b3,c2,c3);
  Result[2, 1] := -_Det2(a2,a3,c2,c3);
  Result[3, 1] := _Det2(a2,a3,b2,b3);

  Result[1, 2] := -_Det2(b1,b3,c1,c3);
  Result[2, 2] := _Det2(a1,a3,c1,c3);
  Result[3, 2] := -_Det2(a1,a3,b1,b3);

  Result[1, 3] := _Det2(b1,b2,c1,c2);
  Result[2, 3] := -_Det2(a1,a2,c1,c2);
  Result[3, 3] := _Det2(a1,a2,b1,b2);
end;

function InvertTransform2D(const M1: TTransf2D): TTransf2D;
var
  Divisor: TRealType;
begin
  if (M1[1, 3] = 0.0) and (M1[2, 3] = 0.0) and (M1[3, 3] = 1.0) then
   begin // Cartesian
     if (M1[1, 1] * M1[2, 2] - M1[2, 1] * M1[1, 2]) = 0.0 then
      begin
        Result := NullTransf2D;
        Exit;
      end;
     Divisor := 1.0 / (M1[1, 1] * M1[2, 2] - M1[2, 1] * M1[1, 2]);
     Result[1, 1] := M1[2, 2] * Divisor;
     Result[1, 2] := - M1[1, 2] * Divisor;
     Result[1, 3] := 0.0;
     Result[2, 1] := - M1[2, 1] * Divisor;
     Result[2, 2] := M1[1, 1] * Divisor;
     Result[2, 3] := 0.0;
     Result[3, 1] := (M1[2, 1] * M1[3, 2] - M1[2, 2] * M1[3, 1]) * Divisor;
     Result[3, 2] := (M1[1, 2] * M1[3, 1] - M1[1, 1] * M1[3, 2]) * Divisor;
     Result[3, 3] := 1.0;
   end
  else
   begin
     Divisor := _Det3_2D(M1);
     if Divisor = 0 then
      begin
        Result := NullTransf2D;
        Exit;
      end;
     Result := _Adjoint3(M1);

     Result[1, 1] := Result[1, 1] / Divisor;
     Result[1, 2] := Result[1, 2] / Divisor;
     Result[1, 3] := Result[1, 3] / Divisor;
     Result[2, 1] := Result[2, 1] / Divisor;
     Result[2, 2] := Result[2, 2] / Divisor;
     Result[2, 3] := Result[2, 3] / Divisor;
     Result[3, 1] := Result[3, 1] / Divisor;
     Result[3, 2] := Result[3, 2] / Divisor;
     Result[3, 3] := Result[3, 3] / Divisor;
   end;
end;

function TransformPoint2D(const P: TPoint2D; const T: TTransf2D): TPoint2D;
begin
  Result.X := P.X * T[1, 1] + P.Y * T[2, 1] + P.W * T[3, 1];
  Result.Y := P.X * T[1, 2] + P.Y * T[2, 2] + P.W * T[3, 2];
  Result.W := P.X * T[1, 3] + P.Y * T[2, 3] + P.W * T[3, 3];
end;

function TransformVector2D(const V: TVector2D; const T: TTransf2D): TVector2D;
begin
  Result.X := V.X * T[1, 1] + V.Y * T[2, 1];
  Result.Y := V.X * T[1, 2] + V.Y * T[2, 2];
end;

function TransformRect2D(const R: TRect2D; const T: TTransf2D): TRect2D;
begin
  Result.FirstEdge := TransformPoint2D(R.FirstEdge, T);
  Result.SecondEdge := TransformPoint2D(R.SecondEdge, T);
end;

function TransformBoundingBox2D(const Box: TRect2D; const Transf: TTransf2D): TRect2D;
var
  Box1, Box2: TRect2D;
begin
  Box1 := TransformRect2D(Box, Transf);
  Box2 := TransformRect2D(Rect2D(Box.Left, Box.Top, Box.Right, Box.Bottom), Transf);
  Result := BoxOutBox2D(Box1, Box2);
end;

function Translate2D(const Tx, Ty: TRealType): TTransf2D;
begin
  {
    | 1  0  0 |
    | 0  1  0 |
    | Tx Ty 1 |
  }
  Result := IdentityTransf2D;
  Result[3, 1] := Tx;
  Result[3, 2] := Ty;
end;

function Rotate2D(const R: TRealType): TTransf2D;
begin
  {
    | cos(R)  sin(R)   0 |
    | -sin(R) cos(R)   0 |
    | 0       0        1 |
  }
  Result := IdentityTransf2D;
  Result[1, 1] := cos(R);
  Result[1, 2] := sin(R);
  Result[2, 1] := -Result[1, 2];
  Result[2, 2] := Result[1, 1];
end;

function Scale2D(const Sx, Sy: TRealType): TTransf2D;
begin
  {
    | Sx  0  0 |
    | 0   Sy 0 |
    | 0   0  1 |
  }
  Result := IdentityTransf2D;
  Result[1, 1] := Sx;
  Result[2, 2] := Sy;
end;

function IsBoxInBox2D(Box1, Box2: TRect2D): Boolean;
var
  FCode, SCode: TOutCode;
begin
  Box1 := ReorderRect2D(Box1);
  Box2 := ReorderRect2D(Box2);
  FCode := _PositionCode2D(Box2, Box1.FirstEdge);
  SCode := _PositionCode2D(Box2, Box1.SecondEdge);
  Result := (FCode * SCode) = [];
end;

function IsPointInCartesianBox2D(const Pt: TPoint2D; const Box: TRect2D): Boolean;
begin
  Result := _PositionCode2D(Box, Pt) = [];
end;

function IsPointInBox2D(Pt: TPoint2D; Box: TRect2D): Boolean;
begin
  Pt := CartesianPoint2D(Pt);
  Box := CartesianRect2D(Box);
  Result := _PositionCode2D(Box, Pt) = [];
end;

function BoxFillingCartesian2D(const Box1, Box2: TRect2D): Word;
var
  Tmp1, Tmp2: Byte;
begin
  try
    Tmp1 := Round((Box1.Right - Box1.Left) / (Box2.Right - Box2.Left)) * 1000;
    Tmp2 := Round((Box1.Top - Box1.Bottom) / (Box2.Top - Box2.Bottom)) * 1000;
    if Tmp1 > Tmp2 then
     Result := Tmp1
    else
     Result := Tmp2;
  except
    on EZeroDivide do Result := 1000;
  end;
end;

function IsBoxAllInBox2D(Box1, Box2: TRect2D): Boolean;
var
  FCode, SCode: TOutCode;
begin
  Box1 := CartesianRect2D(Box1);
  Box2 := CartesianRect2D(Box2);
  FCode := _PositionCode2D(Box2, Box1.FirstEdge);
  SCode := _PositionCode2D(Box2, Box1.SecondEdge);
  Result := (FCode = []) and (SCode = []);
end;

function IsBoxAllInCartesianBox2D(const Box1, Box2: TRect2D): Boolean;
var
  FCode, SCode: TOutCode;
begin
  FCode := _PositionCode2D(Box2, Box1.FirstEdge);
  SCode := _PositionCode2D(Box2, Box1.SecondEdge);
  Result := (FCode = []) and (SCode = []);
end;

function BoxOutBox2D(Box1, Box2: TRect2D): TRect2D;
begin
  Box1 := ReorderRect2D(Box1);
  Box2 := ReorderRect2D(Box2);
  Result := Box1;
  if Box2.Left < Box1.Left then
   Result.Left := Box2.Left;
  if Box2.Right > Box1.Right then
   Result.Right := Box2.Right;
  if Box2.Bottom < Box1.Bottom then
   Result.Bottom := Box2.Bottom;
  if Box2.Top > Box1.Top then
   Result.Top := Box2.Top;
end;

procedure MakeOrto2D(LastPt: TPoint2D; var CurrPt: TPoint2D);
var
  DeltaPt: TVector2D;
begin
  LastPt := CartesianPoint2D(LastPt);
  CurrPt := CartesianPoint2D(CurrPt);
  DeltaPt := Vector2D(LastPt, CurrPt);
  if Abs(DeltaPt.X) > Abs(DeltaPt.Y) then
   CurrPt.Y := LastPt.Y
  else
   CurrPt.X := LastPt.X;
end;

function DotProduct2D(const A, B: TVector2D): TRealType;
begin
  Result := A.X * B.X + A.Y * B.Y;
end;

function Perpendicular2D(const V: TVector2D): TVector2D;
begin
  Result.X := -V.Y;
  Result.Y := V.X;
end;

function Reflect2D(const V: TVector2D): TVector2D;
begin
  Result.X := -V.X;
  Result.Y := -V.Y;
end;

function IsPointOnSegment2D(P, P1, P2: TPoint2D): Boolean;
var
  r, L, LQ, DX, DY: Double;
begin
  P := CartesianPoint2D(P);
  P1 := CartesianPoint2D(P1);
  P2 := CartesianPoint2D(P2);
  Result := False;
  DX := P2.X - P1.X;
  DY := P2.Y - P1.Y;
  L := Sqrt(DX * DX + DY * DY);
  if L = 0 then Exit;
  LQ := L * L;
  r := ((P1.Y - P.Y) * (-DY) - (P1.X - P.X) * DX) / LQ;
  Result := (r >= 0) and (r <= 1);
end;

function PointDistance2D(const P1, P2: TPoint2D): TRealType;
begin
  Result := VectorLength2D(Vector2D(P1, P2));
end;

function PointLineDistance2D(P, P1, P2: TPoint2D): TRealType;
var
  L, DX, DY: Double;
begin
  P := CartesianPoint2D(P);
  P1 := CartesianPoint2D(P1);
  P2 := CartesianPoint2D(P2);
  Result := -1.0;
  DX := P2.X - P1.X;
  DY := P2.Y - P1.Y;
  L := Sqrt(DX * DX + DY * DY);
  if L = 0 then Exit;
  Result := Abs(((P1.Y - P.Y) * DX - (P1.X - P.X) * DY) / L);
end;

{ Dist is valid only if the P projection lies on the line.
  Parametri già omogeneizzati. }
function _PointSegmentDistance2D(const P, P1, P2: TPoint2D; var Dist: TRealType): Boolean;
var
  r, L, LQ, DX, DY: Double;
begin
  Result := False;
  Dist := MaxCoord;
  DX := P2.X - P1.X;
  DY := P2.Y - P1.Y;
  L := Sqrt(DX * DX + DY * DY);
  if L = 0 then Exit;
  LQ := L * L;
  r := ((P1.Y - P.Y) * (-DY) - (P1.X - P.X) * DX) / LQ;
  Result := (r >= 0) and (r <= 1);
  if not Result then Exit;
  Dist := Abs(((P1.Y - P.Y) * DX - (P1.X - P.X) * DY) / L);
end;

function IsPointOnRect2D(const Box: TRect2D; P: TPoint2D; var Dist: TRealType;
                       const Aperture: TRealType; const T: TTransf2D): Integer;
var
  TmpDist: TRealType;
  TmpPt1, TmpPt2: TPoint2D;
begin
  Dist := MaxCoord;
  Result := PICK_NOOBJECT;
  P := CartesianPoint2D(P);
  TmpPt1 := CartesianPoint2D(TransformPoint2D(Box.FirstEdge, T));
  TmpPt2 := CartesianPoint2D(TransformPoint2D(Point2D(Box.Left, Box.Top), T));
  if _PointSegmentDistance2D(P, TmpPt1, TmpPt2, TmpDist) and (TmpDist <= Aperture) then
   begin
     Result := PICK_ONOBJECT;
     Dist := TmpDist;
     Exit;
   end;
  TmpPt1 := TmpPt2;
  TmpPt2 := CartesianPoint2D(TransformPoint2D(Box.SecondEdge, T));
  if _PointSegmentDistance2D(P, TmpPt1, TmpPt2, TmpDist) and (TmpDist <= Aperture) then
   begin
     Result := PICK_ONOBJECT;
     Dist := TmpDist;
     Exit;
   end;
  TmpPt1 := TmpPt2;
  TmpPt2 := CartesianPoint2D(TransformPoint2D(Point2D(Box.Right, Box.Bottom), T));
  if _PointSegmentDistance2D(P, TmpPt1, TmpPt2, TmpDist) and (TmpDist <= Aperture) then
   begin
     Result := PICK_ONOBJECT;
     Dist := TmpDist;
     Exit;
   end;
  TmpPt1 := TmpPt2;
  TmpPt2 := CartesianPoint2D(TransformPoint2D(Box.FirstEdge, T));
  if _PointSegmentDistance2D(P, TmpPt1, TmpPt2, TmpDist) and (TmpDist <= Aperture) then
   begin
     Result := PICK_ONOBJECT;
     Dist := TmpDist;
     Exit;
   end;
end;

function PointOutBox2D(Pt: TPoint2D; Box: TRect2D): TRect2D;
begin
  Pt := CartesianPoint2D(Pt);
  Result := Box;
  if Pt.X > Result.Right then
   Result.Right := Pt.X
  else if Pt.X < Result.Left then
   Result.Left := Pt.X;
  if Pt.Y > Result.Top then
   Result.Top := Pt.Y
  else if Pt.Y < Result.Bottom then
   Result.Bottom := Pt.Y;
end;

function NearPoint2D(RP, P: TPoint2D; const Aperture: TRealType; var Dist: TRealType): Boolean;
var
  TmpBox: TRect2D;
begin
  RP := CartesianPoint2D(RP);
  P := CartesianPoint2D(P);
  TmpBox.FirstEdge := Point2D(RP.X - Aperture, RP.Y - Aperture);
  TmpBox.SecondEdge := Point2D(RP.X + Aperture, RP.Y + Aperture);
  Result := _PositionCode2D(TmpBox, P) = [];
  if Result then
   Dist := Sqrt(Power(P.X - RP.X, 2) + Power(P.Y - RP.Y, 2))
  else
   Dist := MaxCoord;
end;

function IsPointOnPolyLine2D(const Vect: Pointer; Count: Integer;
                             P: TPoint2D; var Dist: TRealType;
                             const Aperture: TRealType; const T: TTransf2D; const MustClose: Boolean): Integer;
var
  MinDist, TmpDist: TRealType;
  TmpPt1, TmpPt2: TPoint2D;
  Cont, Max: Integer;
begin
  Result := PICK_NOOBJECT;
  Dist := MaxCoord;
  if Count = 0 then
   Exit;
  MinDist := Aperture;
  P := CartesianPoint2D(P);
  if MustClose then
   Max := Count
  else
   Max := Count - 1;
  TmpPt1 := CartesianPoint2D(TransformPoint2D(PVectPoints2D(Vect)^[0], T));
  for Cont := 1 to Max do
   begin
     if Cont = Count then
      TmpPt2 := CartesianPoint2D(TransformPoint2D(PVectPoints2D(Vect)^[0], T))
     else
      TmpPt2 := CartesianPoint2D(TransformPoint2D(PVectPoints2D(Vect)^[Cont], T));
     if _PointSegmentDistance2D(P, TmpPt1, TmpPt2, TmpDist) and (TmpDist <= MinDist) then
      begin
        Result := PICK_ONOBJECT;
        Dist := TmpDist;
        MinDist := Dist;
      end;
     TmpPt1 := TmpPt2;
   end;
end;

function IsPointOnLine2D(A, B, P: TPoint2D; var Dist: TRealType;
                       const Aperture: TRealType; const T: TTransf2D): Integer;
var
  TmpDist: TRealType;
begin
  Result := PICK_NOOBJECT;
  Dist := MaxCoord;
  P := CartesianPoint2D(P);
  A := CartesianPoint2D(TransformPoint2D(A, T));
  B := CartesianPoint2D(TransformPoint2D(B, T));
  if _PointSegmentDistance2D(P, A, B, TmpDist) and (TmpDist <= Aperture) then
   begin
     Result := PICK_ONOBJECT;
     Dist := TmpDist;
   end;
end;

function _RightIntersection2D(const P, P1, P2: TPoint2D): Boolean;
var
  R: Double;
begin
  Result := ((P.Y >= P1.Y) and (P.Y < P2.Y)) or ((P.Y < P1.Y) and (P.Y >= P2.Y));
  if not Result then Exit;
  R := (P.Y - P1.Y) * (P2.X - P1.X) / (P2.Y - P1.Y) + P1.X;
  Result := P.X <= R;
end;

function IsPointInPolygon2D(const Vect: Pointer; Count: Integer;
                            P: TPoint2D; var Dist: TRealType;
                            const Aperture: TRealType; const T: TTransf2D): Integer;
var
  Cont, NInters: Integer;
  TmpPt1, TmpPt2: TPoint2D;
  TmpDist: TRealType;
begin
  Result := PICK_NOOBJECT;
  Dist := Aperture;
  if Count = 0 then
   Exit;
  NInters := 0;
  P := CartesianPoint2D(P);
  TmpPt1 := CartesianPoint2D(TransformPoint2D(PVectPoints2D(Vect)^[0], T));
  for Cont := 1 to Count do
   begin
     if Cont = Count then
      TmpPt2 := CartesianPoint2D(TransformPoint2D(PVectPoints2D(Vect)^[0], T))
     else
      TmpPt2 := CartesianPoint2D(TransformPoint2D(PVectPoints2D(Vect)^[Cont], T));
     if _PointSegmentDistance2D(P, TmpPt1, TmpPt2, TmpDist) and (TmpDist <= Dist) then
      begin
        if TmpDist < Aperture then
         Result := PICK_ONOBJECT;
        Dist := TmpDist;
      end
     else if _RightIntersection2D(P, TmpPt1, TmpPt2) then
      Inc(NInters);
     TmpPt1 := TmpPt2;
   end;
  if Odd(NInters) and (Result = PICK_NOOBJECT) then
   begin
     Result := PICK_INOBJECT;
     Dist := Aperture;
   end
  else if (Result = PICK_NOOBJECT) then
   Dist := MaxCoord;
end;

{ 2D clipping functions. }

{ Use the Liang-Barsky algoritm. }
function ClipLine2D(Clip: TRect2D; var Pt1, Pt2: TPoint2D): TClipResult;
var
  DX, DY, tE, tL: Extended;
begin
  Result := [ccNotVisible];
  Clip := ReorderRect2D(Clip);
  Pt1 := CartesianPoint2D(Pt1);
  Pt2 := CartesianPoint2D(Pt2);
  DX := Pt2.X - Pt1.X;
  DY := Pt2.Y - Pt1.Y;
  if (DX = 0) and (DY = 0) and IsPointInCartesianBox2D(Pt1, Clip) then
   begin
     Result := [ccVisible];
     Exit;
   end;
  tE := 0.0;
  tL := 1.0;
  { 0.9 in 1. }
  if _ClipPt(DX, Clip.Left - Pt1.X, tE, tL) then
   if _ClipPt(-DX, Pt1.X - Clip.Right, tE, tL) then
    if _ClipPt(DY, Clip.Bottom - Pt1.Y, tE, tL) then
     if _ClipPt(-DY, Pt1.Y - Clip.Top, tE, tL) then
      begin
        Result := [];
        if tL < 1 then
         begin
           Pt2.X := Pt1.X + tL * DX;
           Pt2.Y := Pt1.Y + tL * DY;
           Result := [ccSecond];
         end;
        if tE > 0 then
         begin
           Pt1.X := Pt1.X + tE * DX;
           Pt1.Y := Pt1.Y + tE * DY;
           Result := Result + [ccFirst];
         end;
        if Result = [] then
         Result := [ccVisible];
      end;
end;

{ Use the Liang-Barsky algoritm. }
function ClipLineLeftRight2D(Clip: TRect2D; var Pt1, Pt2: TPoint2D): TClipResult;
var
  DX, DY, tE, tL: Extended;
begin
  Clip := ReorderRect2D(Clip);
  Pt1 := CartesianPoint2D(Pt1);
  Pt2 := CartesianPoint2D(Pt2);
  DX := Pt2.X - Pt1.X;
  DY := Pt2.Y - Pt1.Y;
  Result := [ccNotVisible];
  if (DX = 0) and (DY = 0) and IsPointInCartesianBox2D(Pt1, Clip) then
   begin
     Result := [ccVisible];
     Exit;
   end;
  tE := 0.0;
  tL := 1.0;
  { 0.9 in 1. }
  if _ClipPt(DX, Clip.Left - Pt1.X, tE, tL) then
   if _ClipPt(-DX, Pt1.X - Clip.Right, tE, tL) then
    begin
      Result := [];
      if tL < 1 then
       begin
         Pt2.X := Pt1.X + tL * DX;
         Pt2.Y := Pt1.Y + tL * DY;
         Result := [ccSecond];
       end;
      if tE > 0 then
       begin
         Pt1.X := Pt1.X + tE * DX;
         Pt1.Y := Pt1.Y + tE * DY;
         Result := Result + [ccFirst];
       end;
      if Result = [] then
       Result := [ccVisible];
    end;
end;

function ClipLineUpBottom2D(Clip: TRect2D; var Pt1, Pt2: TPoint2D): TClipResult;
var
  DX, DY, tE, tL: Extended;
begin
  Clip := ReorderRect2D(Clip);
  Pt1 := CartesianPoint2D(Pt1);
  Pt2 := CartesianPoint2D(Pt2);
  DX := Pt2.X - Pt1.X;
  DY := Pt2.Y - Pt1.Y;
  Result := [ccNotVisible];
  if (DX = 0) and (DY = 0) and IsPointInCartesianBox2D(Pt1, Clip) then
   begin
     Result := [ccVisible];
     Exit;
   end;
  tE := 0.0;
  tL := 1.0;
  { 0.9 in 1. }
  if _ClipPt(DY, Clip.Bottom - Pt1.Y, tE, tL) then
   if _ClipPt(-DY, Pt1.Y - Clip.Top, tE, tL) then
    begin
      Result := [];
      if tL < 1 then
       begin
         Pt2.X := Pt1.X + tL * DX;
         Pt2.Y := Pt1.Y + tL * DY;
         Result := [ccSecond];
       end;
      if tE > 0 then
       begin
         Pt1.X := Pt1.X + tE * DX;
         Pt1.Y := Pt1.Y + tE * DY;
         Result := Result + [ccFirst];
       end;
      if Result = [] then
       Result := [ccVisible];
    end;
end;

procedure Draw2DSubSetAsPolyline(const Vect: Pointer; Count: Integer;
                                 const Cnv: TDecorativeCanvas;
                                 const Clip, Extent: TRect2D;
                                 const S: TTransf2D;
                                 const StartIdx, EndIdx: Integer;
                                 const ToBeClosed: Boolean);
type
  TPoints = array[0..0] of TPoint;
var
  VisPoints, Cont, AllocatedMem: Integer;
  TmpPt1, TmpPt2: TPoint2D;
  TmpPts: ^TPoints;
  ClipRes: TClipResult;
  TmpClip: TRect2D;
begin
  if (Count = 0) or (EndIdx > Count) or (StartIdx > EndIdx) then
   Exit;
  if ToBeClosed then
   AllocatedMem := (Count + 1) * SizeOf(TPoint)
  else
   AllocatedMem := Count * SizeOf(TPoint);
  GetMem(TmpPts, AllocatedMem);
  try
    VisPoints := 0;
    if IsBoxAllInBox2D(TransformRect2D(Extent, S), Clip) then
     begin
       for Cont := StartIdx to EndIdx do
        begin
          TmpPt1 := TransformPoint2D(PVectPoints2D(Vect)^[Cont], S);
          TmpPts^[VisPoints] := Point2DToPoint(TmpPt1);
          Inc(VisPoints);
        end;
       if ToBeClosed then
        begin
          TmpPt1 := TransformPoint2D(PVectPoints2D(Vect)^[StartIdx], S);
          TmpPts^[VisPoints] := Point2DToPoint(TmpPt1);
          Inc(VisPoints);
        end;
       ClipRes := [ccVisible];
     end
    else if ToBeClosed then
     begin
       TmpClip := ReorderRect2D(Clip);
       for Cont := StartIdx + 1 to EndIdx + 1 do
        begin
          TmpPt1 := TransformPoint2D(PVectPoints2D(Vect)^[Cont - 1], S);
          if Cont > EndIdx then
           TmpPt2 := TransformPoint2D(PVectPoints2D(Vect)^[StartIdx], S)
          else
           TmpPt2 := TransformPoint2D(PVectPoints2D(Vect)^[Cont], S);
          ClipRes := _ClipLine2D(TmpClip, TmpPt1, TmpPt2);
          if not (ccNotVisible in ClipRes) then
           begin
             TmpPts^[VisPoints] := Point2DToPoint(TmpPt1);
             Inc(VisPoints);
           end;
          if ccSecond in ClipRes then
           begin
             TmpPts^[VisPoints] := Point2DToPoint(TmpPt2);
             Inc(VisPoints);
             Cnv.Polyline(TmpPts, VisPoints);
             VisPoints := 0;
           end;
        end;
       if not (ccNotVisible in ClipRes) then
        begin
          TmpPts^[VisPoints] := Point2DToPoint(TmpPt2);
          Inc(VisPoints);
        end;
      end
    else
     begin
       TmpClip := ReorderRect2D(Clip);
       for Cont := StartIdx + 1 to EndIdx do
        begin
          TmpPt1 := TransformPoint2D(PVectPoints2D(Vect)^[Cont - 1], S);
          TmpPt2 := TransformPoint2D(PVectPoints2D(Vect)^[Cont], S);
          ClipRes := _ClipLine2D(TmpClip, TmpPt1, TmpPt2);
          if not (ccNotVisible in ClipRes) then
           begin
             TmpPts^[VisPoints] := Point2DToPoint(TmpPt1);
             Inc(VisPoints);
           end;
          if ccSecond in ClipRes then
           begin
             TmpPts^[VisPoints] := Point2DToPoint(TmpPt2);
             Inc(VisPoints);
             Cnv.Polyline(TmpPts, VisPoints);
             VisPoints := 0;
           end;
        end;
       if not (ccNotVisible in ClipRes) then
        begin
          TmpPts^[VisPoints] := Point2DToPoint(TmpPt2);
          Inc(VisPoints);
        end;
      end;
     if (VisPoints > 0) then
      Cnv.Polyline(TmpPts, VisPoints);
  finally
    FreeMem(TmpPts, AllocatedMem);
  end;
end;

procedure Draw2DSubSetAsPolygon(const Vect: Pointer; Count: Integer;
                                const Cnv: TDecorativeCanvas;
                                const Clip, Extent: TRect2D;
                                const S: TTransf2D;
                                const StartIdx, EndIdx: Integer);
type
  TPoints = array[0..0] of TPoint;
var
  VisPoints, VisPoints1, Cont: Integer;
  TmpPt1, TmpPt2: TPoint2D;
  TmpPts, FirstClipPts: ^TPoints;
  ClipRes: TClipResult;
  TmpClip: TRect2D;
begin
  if (Count = 0) or (EndIdx > Count) or (StartIdx > EndIdx) then
   Exit;
  GetMem(TmpPts, Count * 3 * SizeOf(TPoint));
  GetMem(FirstClipPts, Count * 3 * SizeOf(TPoint));
  try
    VisPoints := 0;
    VisPoints1 := 0;
    if IsBoxAllInBox2D(TransformRect2D(Extent, S), Clip) then
     for Cont := StartIdx to EndIdx do
      begin
        TmpPt1 := TransformPoint2D(PVectPoints2D(Vect)^[Cont], S);
        TmpPts^[VisPoints] := Point2DToPoint(TmpPt1);
        Inc(VisPoints);
      end
    else
     begin
       TmpClip := ReorderRect2D(Clip);
       for Cont := StartIdx to EndIdx do
        begin
          TmpPt1 := TransformPoint2D(PVectPoints2D(Vect)^[Cont], S);
          if Cont < EndIdx then
           TmpPt2 := TransformPoint2D(PVectPoints2D(Vect)^[Cont + 1], S)
          else
           TmpPt2 := TransformPoint2D(PVectPoints2D(Vect)^[StartIdx], S);
          ClipRes := _ClipLineLeftRight2D(TmpClip, TmpPt1, TmpPt2);
          if not (ccNotVisible in ClipRes) then
           begin
             FirstClipPts^[VisPoints1] := Point2DToPoint(TmpPt1);
             Inc(VisPoints1);
           end;
          if ccSecond in ClipRes then
           begin
             FirstClipPts^[VisPoints1] := Point2DToPoint(TmpPt2);
             Inc(VisPoints1);
           end;
        end;
       FirstClipPts^[VisPoints1] := FirstClipPts^[0];
       Inc(VisPoints1);
       VisPoints := 0;
       for Cont := 0 to VisPoints1 - 2 do
        begin
          TmpPt1 := PointToPoint2D(FirstClipPts^[Cont]);
          TmpPt2 := PointToPoint2D(FirstClipPts^[Cont + 1]);
          ClipRes := _ClipLineUpBottom2D(TmpClip, TmpPt1, TmpPt2);
          if not (ccNotVisible in ClipRes) then
           begin
             TmpPts^[VisPoints] := Point2DToPoint(TmpPt1);
             Inc(VisPoints);
           end;
          if ccSecond in ClipRes then
           begin
             TmpPts^[VisPoints] := Point2DToPoint(TmpPt2);
             Inc(VisPoints);
           end;
        end;
     end;
     if (VisPoints > 0) then
      Polygon(Cnv.Canvas.Handle, TmpPts^, VisPoints);
  finally
    FreeMem(TmpPts, Count * 3 * SizeOf(TPoint));
    FreeMem(FirstClipPts, Count * 3 * SizeOf(TPoint));
  end;
end;

procedure DrawPlaceHolder(const Cnv: TDecorativeCanvas; const X, Y, Wdt: Integer);
var
  TmpWdt: Integer;
begin
  with Cnv.Canvas do
   begin
     Brush.Style := bsSolid;
     Brush.Color := clSilver;
     Pen.Style := psSolid;
     TmpWdt := Wdt div 2;
     Windows.Rectangle(Handle, X - TmpWdt, Y - TmpWdt, X + TmpWdt, Y + TmpWdt);
   end;
end;

procedure DrawRoundPlaceHolder(const Cnv: TDecorativeCanvas; const X, Y, Wdt: Integer);
var
  TmpWdt: Integer;
begin
  with Cnv.Canvas do
   begin
     Brush.Style := bsSolid;
     Brush.Color := clSilver;
     Pen.Style := psSolid;
     TmpWdt := Wdt div 2;
     Windows.Ellipse(Handle, X - TmpWdt, Y - TmpWdt, X + TmpWdt, Y + TmpWdt);
   end;
end;

procedure DrawRect2DAsPolyline(const Cnv: TDecorativeCanvas; const Box, Clip: TRect2D; const MT, S: TTransf2D);
type
  TPoints = array[0..0] of TPoint;
var
  VisPoints, Cont: Integer;
  TmpPt1, TmpPt2: TPoint2D;
  TmpPts: ^TPoints;
  BoxPts: ^TVectPoints2D;
  ClipRes: TClipResult;
  TmpClip: TRect2D;
begin
  GetMem(TmpPts, 5 * SizeOf(TPoint));
  GetMem(BoxPts, 5 * SizeOf(TPoint2D));
  try
    VisPoints := 0;
    Cont := 0;
    BoxPts^[Cont] := TransformPoint2D(Box.FirstEdge, MT);
    BoxPts^[Cont + 1] := TransformPoint2D(Point2D(Box.Left, Box.Top), MT);
    BoxPts^[Cont + 2] := TransformPoint2D(Box.SecondEdge, MT);
    BoxPts^[Cont + 3] := TransformPoint2D(Point2D(Box.Right, Box.Bottom), MT);
    BoxPts^[Cont + 4] := TransformPoint2D(Box.FirstEdge, MT);
    if IsBoxAllInBox2D(TransformRect2D(Box, S), Clip) then
     for Cont := 0 to 4 do
      begin
        TmpPt1 := TransformPoint2D(PVectPoints2D(BoxPts)^[Cont], S);
        TmpPts^[VisPoints] := Point2DToPoint(TmpPt1);
        Inc(VisPoints);
        ClipRes := [ccVisible];
      end
    else
     begin
       TmpClip := ReorderRect2D(Clip);
       for Cont := 1 to 4 do
        begin
          TmpPt1 := TransformPoint2D(PVectPoints2D(BoxPts)^[Cont - 1], S);
          TmpPt2 := TransformPoint2D(PVectPoints2D(BoxPts)^[Cont], S);;
          ClipRes := _ClipLine2D(TmpClip, TmpPt1, TmpPt2);
          if not (ccNotVisible in ClipRes) then
           begin
             TmpPts^[VisPoints] := Point2DToPoint(TmpPt1);
             Inc(VisPoints);
           end;
          if ccSecond in ClipRes then
           begin
             TmpPts^[VisPoints] := Point2DToPoint(TmpPt2);
             Inc(VisPoints);
             Cnv.Polyline(TmpPts, VisPoints);
             VisPoints := 0;
           end;
        end;
       if not (ccNotVisible in ClipRes) then
        begin
          TmpPts^[VisPoints] := Point2DToPoint(TmpPt2);
          Inc(VisPoints);
        end;
      end;
     if (VisPoints > 0) then
      Cnv.Polyline(TmpPts, VisPoints)
  finally
    FreeMem(BoxPts, 5 * SizeOf(TPoint2D));
    FreeMem(TmpPts, 5 * SizeOf(TPoint));
  end;
end;

procedure DrawRect2DAsPolygon(const Cnv: TDecorativeCanvas; const Box, Clip: TRect2D; const MT, S: TTransf2D);
type
  TPoints = array[0..0] of TPoint;
var
  VisPoints, VisPoints1, Cont: Integer;
  TmpPt1, TmpPt2: TPoint2D;
  TmpPts, FirstClipPts: ^TPoints;
  BoxPts: ^TVectPoints2D;
  ClipRes: TClipResult;
  TmpClip: TRect2D;
begin
  GetMem(TmpPts, 15 * SizeOf(TPoint));
  GetMem(FirstClipPts, 15 * SizeOf(TPoint));
  GetMem(BoxPts, 5 * SizeOf(TPoint2D));
  try
    Cont := 0;
    BoxPts^[Cont] := TransformPoint2D(Box.FirstEdge, MT);
    BoxPts^[Cont + 1] := TransformPoint2D(Point2D(Box.Left, Box.Top), MT);
    BoxPts^[Cont + 2] := TransformPoint2D(Box.SecondEdge, MT);
    BoxPts^[Cont + 3] := TransformPoint2D(Point2D(Box.Right, Box.Bottom), MT);
    BoxPts^[Cont + 4] := TransformPoint2D(Box.FirstEdge, MT);
    VisPoints := 0;
    VisPoints1 := 0;
    if IsBoxAllInBox2D(TransformRect2D(Box, S), Clip) then
     for Cont := 0 to 4 do
      begin
        TmpPt1 := TransformPoint2D(PVectPoints2D(BoxPts)^[Cont], S);
        TmpPts^[VisPoints] := Point2DToPoint(TmpPt1);
        Inc(VisPoints);
      end
    else
     begin
       TmpClip := ReorderRect2D(Clip);
       for Cont := 0 to 4 do
        begin
          TmpPt1 := TransformPoint2D(PVectPoints2D(BoxPts)^[Cont], S);
          if Cont < 4 then
           TmpPt2 := TransformPoint2D(PVectPoints2D(BoxPts)^[Cont + 1], S)
          else
           TmpPt2 := TransformPoint2D(PVectPoints2D(BoxPts)^[0], S);
          ClipRes := _ClipLineLeftRight2D(TmpClip, TmpPt1, TmpPt2);
          if not (ccNotVisible in ClipRes) then
           begin
             FirstClipPts^[VisPoints1] := Point2DToPoint(TmpPt1);
             Inc(VisPoints1);
           end;
          if ccSecond in ClipRes then
           begin
             FirstClipPts^[VisPoints1] := Point2DToPoint(TmpPt2);
             Inc(VisPoints1);
           end;
        end;
       FirstClipPts^[VisPoints1].X := FirstClipPts^[0].X;
       FirstClipPts^[VisPoints1].Y := FirstClipPts^[0].Y;
       Inc(VisPoints1);
       VisPoints := 0;
       for Cont := 0 to VisPoints1 - 2 do
        begin
          TmpPt1 := PointToPoint2D(FirstClipPts^[Cont]);
          TmpPt2 := PointToPoint2D(FirstClipPts^[Cont + 1]);
          ClipRes := _ClipLineUpBottom2D(TmpClip, TmpPt1, TmpPt2);
          if not (ccNotVisible in ClipRes) then
           begin
             TmpPts^[VisPoints] := Point2DToPoint(TmpPt1);
             Inc(VisPoints);
           end;
          if ccSecond in ClipRes then
           begin
             TmpPts^[VisPoints] := Point2DToPoint(TmpPt2);
             Inc(VisPoints);
           end;
        end;
     end;
     if (VisPoints > 0) then
      Polygon(Cnv.Canvas.Handle, TmpPts^, VisPoints);
  finally
    FreeMem(BoxPts, 5 * SizeOf(TPoint2D));
    FreeMem(TmpPts, 15 * SizeOf(TPoint));
    FreeMem(FirstClipPts, 15 * SizeOf(TPoint));
  end;
end;

function DrawLine2D(const Cnv: TDecorativeCanvas; P1, P2: TPoint2D; const Clip: TRect2D; const S: TTransf2D): Boolean;
var
  TmpPt1, TmpPt2: TPoint;
  TmpPt12D, TmpPt22D: TPoint2D;
  ClipRes: TClipResult;
  TmpBox: TRect2D;
  TmpClip: TRect2D;
begin
  TmpBox.FirstEdge := P1;
  TmpBox.SecondEdge := P2;
  TmpBox := ReorderRect2D(TmpBox);
  if IsBoxAllInBox2D(TransformRect2D(TmpBox, S), Clip) then
   begin
     Result := True;
     TmpPt1 := Point2DToPoint(TransformPoint2D(P1, S));
     TmpPt2 := Point2DToPoint(TransformPoint2D(P2, S));
     Cnv.MoveTo(TmpPt1.X, TmpPt1.Y);
     Cnv.LineTo(TmpPt2.X, TmpPt2.Y);
   end
  else
   begin
     TmpClip := ReorderRect2D(Clip);
     TmpPt12D := TransformPoint2D(P1, S);
     TmpPt22D := TransformPoint2D(P2, S);;
     ClipRes := _ClipLine2D(TmpClip, TmpPt12D, TmpPt22D);
     Result := not (ccNotVisible in ClipRes);
     if Result then
      begin
        TmpPt1 := Point2DToPoint(TmpPt12D);
        TmpPt2 := Point2DToPoint(TmpPt22D);
        Cnv.MoveTo(TmpPt1.X, TmpPt1.Y);
        Cnv.LineTo(TmpPt2.X, TmpPt2.Y);
      end;
   end;
end;

procedure DrawBoundingBox2D(const Cnv: TDecorativeCanvas; Box, Clip: TRect2D; const S: TTransf2D);
begin
  DrawRect2DAsPolyline(Cnv, Box, Clip, IdentityTransf2D, S)
end;

procedure Register;
begin
  RegisterComponents('CADSys 4.2', [TRuler, TCADCmp2D, TCADViewport2D, TCADPrg2D]);
end;

// =====================================================================
// TPointsSet2D
// =====================================================================

procedure TPointsSet2D.Expand(const NewCapacity: Integer);
var
  Cont: Integer;
begin
  if NewCapacity <= fCapacity then
   Exit;
  ReAllocMem(fPoints, NewCapacity * SizeOf(TPoint2D));
  for Cont := fCapacity to NewCapacity - 1 do
   with PVectPoints2D(FPoints)^[Cont] do
    begin
      X := 0.0;
      Y := 0.0;
      W := 1.0;
    end;
  fCapacity := NewCapacity;
end;

procedure TPointsSet2D.SetDisableEvents(B: Boolean);
begin
  fDisableEvents := B;
end;

procedure TPointsSet2D.CallOnChange;
begin
  // Call onChange only if the events are enabled.
  if (not fDisableEvents) and Assigned(fOnChange) then
   begin
     fDisableEvents := True;
     try
      fOnChange(Self);
     finally
      fDisableEvents := False;
     end;
   end;
end;

constructor TPointsSet2D.Create(const _Capacity: Word);
begin
  inherited Create;

  fCount := 0;
  fCapacity := _Capacity;
  GetMem(fPoints, fCapacity * SizeOf(TPoint2D));
  fDisableEvents := False;
  fGrownEnabled := True;
  fTag := 0;
end;

destructor TPointsSet2D.Destroy;
begin
  FreeMem(fPoints, fCapacity * SizeOf(TPoint2D));
  inherited Destroy;
end;

function TPointsSet2D.Get(Index: Word): TPoint2D;
begin
  if Index < fCount then
   Result := PVectPoints2D(FPoints)^[Index]
  else
   Raise ECADOutOfBound.Create('TPointsSet2D.Get: Index out of bound');
end;

function TPointsSet2D.GetExtension: TRect2D;
var
  Cont: Integer;
  TmpPt: TPoint2D;
begin
  Result := Rect2D(0, 0, 0, 0);
  if fCount = 0 then
   Exit;
  TmpPt := CartesianPoint2D(PVectPoints2D(fPoints)^[0]);
  Result.FirstEdge := TmpPt;
  Result.SecondEdge := TmpPt;
  for Cont := 1 to fCount - 1 do
   begin
     TmpPt := CartesianPoint2D(PVectPoints2D(fPoints)^[Cont]);
     if TmpPt.X > Result.Right then
      Result.Right := TmpPt.X
     else if TmpPt.X < Result.Left then
      Result.Left := TmpPt.X;
     if TmpPt.Y > Result.Top then
      Result.Top := TmpPt.Y
     else if TmpPt.Y < Result.Bottom then
      Result.Bottom := TmpPt.Y;
   end;
end;

procedure TPointsSet2D.PutProp(Index: Word; const Item: TPoint2D);
begin
  Put(Index, Index, Item);
  CallOnChange;
end;

procedure TPointsSet2D.Put(PutIndex, ItemIndex: Word; const Item: TPoint2D);
begin
  if PutIndex < fCapacity then
   begin
     PVectPoints2D(fPoints)^[PutIndex] := Item;
     if PutIndex >= fCount then
      fCount := PutIndex + 1;
   end
  else if fGrownEnabled then
   begin
     Expand(MaxIntValue([PutIndex + 1, fCapacity * 2 + 1]));
     PVectPoints2D(fPoints)^[PutIndex] := Item;
     Inc(fCount);
   end
  else
   Raise ECADOutOfBound.Create('TPointsSet2D.Put: Vector out of bound');
end;

procedure TPointsSet2D.Add(const Item: TPoint2D);
begin
  PutProp(fCount, Item);
end;

procedure TPointsSet2D.AddPoints(const Items: array of TPoint2D);
var
  Cont: Integer;
begin
  if (not fGrownEnabled) and (High(Items) - Low(Items) > fCapacity) then
   Raise ECADOutOfBound.Create('TPointsSet2D.AddPoints: Vector out of bound');
  Expand(fCapacity + High(Items) - Low(Items) + 1);
  for Cont := Low(Items) to High(Items) do
   Put(fCount, fCount, Items[Cont]);
  CallOnChange;
end;

procedure TPointsSet2D.Clear;
begin
  fCount := 0;
end;

procedure TPointsSet2D.Delete(const Index: Word);
var
  Cont: Integer;
begin
  if Index < fCount then
   begin
     for Cont := Index to fCount - 2 do
      Put(Cont, Cont + 1, PVectPoints2D(fPoints)^[Cont + 1]);
     Dec(fCount);
     CallOnChange;
   end
  else
   Raise ECADOutOfBound.Create('TPointsSet2D.Delete: Vector out of bound');
end;

procedure TPointsSet2D.Insert(const Index: Word; const Item: TPoint2D);
var
  Cont: Integer;
begin
  if Index >= fCount then
   Raise ECADOutOfBound.Create('TPointsSet2D.Insert: Vector out of bound');
  Put(fCount, fCount, Item);
  for Cont := fCount - 1 downto Index + 1 do
   Put(Cont, Cont - 1, PVectPoints2D(fPoints)^[Cont - 1]);
  Put(Index, Index, Item);
  CallOnChange;
end;

procedure TPointsSet2D.TransformPoints(const T: TTransf2D);
var
  Cont: Integer;
  TmpPt: TPoint2D;
begin
  for Cont := 0 to fCount - 1 do
   begin
     TmpPt := TransformPoint2D(PVectPoints2D(fPoints)^[Cont], T);
     PVectPoints2D(fPoints)^[Cont] := TmpPt;
   end;
  CallOnChange;
end;

procedure TPointsSet2D.Copy(const S: TPointsSet2D; const StIdx, EndIdx: Integer);
var
  Cont: Integer;
begin
  try
    Expand(EndIdx + 1);
    for Cont := StIdx to EndIdx do
     Put(Cont, Cont, S[Cont]);
  except
  end;
  CallOnChange;
end;

procedure TPointsSet2D.DrawAsPolygon(const Cnv: TDecorativeCanvas;
                                      const Clip, Extent: TRect2D;
                                      const S: TTransf2D);
begin
  Draw2DSubSetAsPolygon(fPoints, fCount, Cnv, Clip, Extent, S, 0, fCount -1);
end;

procedure TPointsSet2D.DrawAsPolyline(const Cnv: TDecorativeCanvas;
                                       const Clip, Extent: TRect2D;
                                       const S: TTransf2D);
begin
  Draw2DSubSetAsPolyline(fPoints, fCount, Cnv, Clip, Extent, S, 0, fCount - 1, False);
end;

procedure TPointsSet2D.DrawAsClosedPolyline(const Cnv: TDecorativeCanvas;
                                       const Clip, Extent: TRect2D;
                                       const S: TTransf2D);
begin
  Draw2DSubSetAsPolyline(fPoints, fCount, Cnv, Clip, Extent, S, 0, fCount - 1, True);
end;

procedure TPointsSet2D.DrawSubSetAsPolygon(const Cnv: TDecorativeCanvas;
                                            const Clip, Extent: TRect2D;
                                            const S: TTransf2D;
                                            const StartIdx, EndIdx: Integer);
begin
  Draw2DSubSetAsPolygon(fPoints, fCount, Cnv, Clip, Extent, S, StartIdx, EndIdx);
end;

procedure TPointsSet2D.DrawSubSetAsPolyline(const Cnv: TDecorativeCanvas;
                                             const Clip, Extent: TRect2D;
                                             const S: TTransf2D;
                                             const StartIdx, EndIdx: Integer;
                                             const ToBeClosed: Boolean);
begin
  Draw2DSubSetAsPolyline(fPoints, fCount, Cnv, Clip, Extent, S, StartIdx, EndIdx, ToBeClosed);
end;

// =====================================================================
// TGraphicObject 
// =====================================================================

constructor TGraphicObject.Create(ID: LongInt);
begin
  inherited Create;

  fID := ID;
  fLayer := 0;
  fVisible := True;
  fEnabled := True;
  fToBeSaved := True;
  fTag := 0;
  fOnChange := nil;
end;

constructor TGraphicObject.CreateFromStream(const Stream: TStream; const Version: TCADVersion);
var
  BitMask: Byte;
begin
  inherited Create;
  with Stream do
   begin
     Read(fID, SizeOf(fID));
     Read(fLayer, SizeOf(fLayer));
     Read(BitMask, SizeOf(BitMask))
   end;
  fVisible := (BitMask and 1) = 1;
  fEnabled := (BitMask and 2) = 2;
  fToBeSaved := not ((BitMask and 4) = 4);
  fTag := 0;
  fOnChange := nil;
end;

procedure TGraphicObject.SaveToStream(const Stream: TStream);
var
  BitMask: Byte;
begin
  BitMask := 0;
  if fVisible then BitMask := BitMask or 1;
  if fEnabled then BitMask := BitMask or 2;
  if not fToBeSaved then
   BitMask := BitMask or 4; // Uso il not per compatibilità con le versioni precedenti.
  with Stream do
   begin
     Write(fID, SizeOf(fID));
     Write(fLayer, SizeOf(fLayer));
     Write(BitMask, SizeOf(BitMask));
   end;
end;

procedure TGraphicObject.Assign(const Obj: TGraphicObject);
begin
  if (Obj = Self) then
   Exit;
  fVisible := Obj.Visible;
  fEnabled := Obj.Enabled;
  fToBeSaved := Obj.ToBeSaved;
end;

procedure TGraphicObject.UpdateExtension(Sender: TObject);
begin
  _UpdateExtension;
  if Assigned(fOnChange) then
   fOnChange(Self);
end;

// =====================================================================
// Registration functions
// =====================================================================

function CADSysFindClassIndex(const Name: String): Word;
var
  Cont: Integer;
begin
  for Cont := 0 to MAX_REGISTERED_CLASSES - 1 do
   if Assigned(GraphicObjectsRegistered[Cont]) and
      (GraphicObjectsRegistered[Cont].ClassName = Name) then
    begin
      Result := Cont;
      Exit;
    end;
  Raise ECADObjClassNotFound.Create('CADSysFindClassIndex: ' + Name + ' graphic class not found');
end;

function CADSysFindClassByName(const Name: String): TGraphicObjectClass;
begin
  Result := GraphicObjectsRegistered[CADSysFindClassIndex(Name)];
end;

function CADSysFindClassByIndex(Index: Word): TGraphicObjectClass;
begin
  if Index >= MAX_REGISTERED_CLASSES then
   Raise ECADOutOfBound.Create('CADSysRegisterClass: Out of bound registration index');
  if not Assigned(GraphicObjectsRegistered[Index]) then
   Raise ECADObjClassNotFound.Create('CADSysFindClassByIndex: Index not registered');
  Result := GraphicObjectsRegistered[Index];
end;

procedure CADSysRegisterClass(Index: Word; const GraphClass: TGraphicObjectClass);
begin
  if Index >= MAX_REGISTERED_CLASSES then
   Raise ECADOutOfBound.Create('CADSysRegisterClass: Out of bound registration index');
  if Assigned(GraphicObjectsRegistered[Index]) then
   Raise ECADObjClassNotFound.Create(Format('CADSysRegisterClass: Index %d already allocated by %s', [Index, GraphicObjectsRegistered[Index].ClassName]));
  GraphicObjectsRegistered[Index] := GraphClass;
end;

procedure CADSysUnregisterClass(Index: Word);
begin
  if Index >= MAX_REGISTERED_CLASSES then
   Raise ECADOutOfBound.Create('CADSysRegisterClass: Out of bound registration index');
  if Assigned(GraphicObjectsRegistered[Index]) then
   GraphicObjectsRegistered[Index] := nil;
end;

procedure CADSysInitClassRegister;
var
  Cont: Word;
begin
  for Cont := 0 to MAX_REGISTERED_CLASSES do
   GraphicObjectsRegistered[Cont] := nil;
end;

// =====================================================================
// TGraphicObjList
// =====================================================================

constructor TGraphicObjList.Create;
begin
  inherited Create;

  fListGuard := TCADSysCriticalSection.Create;
  fHead := nil;
  fTail := nil;
  fIterators := 0;
  fHasExclusive := False;
  fCount := 0;
  fFreeOnClear := True;
end;

destructor TGraphicObjList.Destroy;
var
  TmpBlock: PObjBlock;
begin
  while fHead <> nil do
   begin
     try
       if fFreeOnClear and Assigned(TObjBlock(fHead^).Obj) then
        TObjBlock(FHead^).Obj.Free;
     except
     end;
     TmpBlock := fHead;
     fHead := TObjBlock(fHead^).Next;
     FreeMem(TmpBlock, SizeOf(TObjBlock));
   end;
  fListGuard.Free;
  inherited;
end;

function TGraphicObjList.GetHasIter: Boolean;
begin
  Result := fIterators > 0;
end;

function TGraphicObjList.GetIterator: TGraphicObjIterator;
begin
  if fHasExclusive then
   Raise ECADListBlocked.Create('TGraphicObjList.GetIterator: The list has exclusive iterator.');
  Result := TGraphicObjIterator.Create(Self);
end;

function TGraphicObjList.GetExclusiveIterator: TExclusiveGraphicObjIterator;
begin
  if fIterators > 0 then
   Raise ECADListBlocked.Create('TGraphicObjList.GetExclusiveIterator: The list has active iterators.');
  Result := TExclusiveGraphicObjIterator.Create(Self);
end;

function TGraphicObjList.GetPrivilegedIterator: TExclusiveGraphicObjIterator;
begin
  Result := TExclusiveGraphicObjIterator.Create(Self);
end;

procedure TGraphicObjList.RemoveAllIterators;
begin
  fListGuard.Enter;
  try
    fIterators := 0;
    fHasExclusive := False;
  finally
    fListGuard.Leave;
  end;
end;

procedure TGraphicObjList.Add(const Obj: TGraphicObject);
var
  NewBlock: PObjBlock;
begin
  if fIterators > 0 then
   Raise ECADListBlocked.Create('TGraphicObjList.Add: The list has active iterators.');
  fListGuard.Enter;
  try
    { Allocate new blocks. }
    GetMem(NewBlock, SizeOf(TObjBlock));
    { Initialize the block. }
    NewBlock^.Prev := fTail;
    NewBlock^.Next := nil;
    NewBlock^.Obj := Obj;
    if fHead = nil then
     fHead := NewBlock;
    if fTail <> nil then
     TObjBlock(fTail^).Next := NewBlock;
    fTail := NewBlock;
    Inc(fCount);
  finally
    fListGuard.Leave;
  end;
end;

procedure TGraphicObjList.AddFromList(const Lst: TGraphicObjList);
var
  TmpIter: TGraphicObjIterator;
begin
  if Lst.Count = 0 then
   Exit;
  if fIterators > 0 then
   Raise ECADListBlocked.Create('TGraphicObjList.AddFromList: The list has active iterators.');
  // Alloca un iterator locale
  fListGuard.Enter;
  try
    TmpIter := Lst.GetIterator;
    try
      repeat
       Add(TmpIter.Current);
      until TmpIter.Next = nil;
    finally
      TmpIter.Free;
    end;
  finally
    fListGuard.Leave;
  end;
end;

procedure TGraphicObjList.Insert(const IDInsertPoint: LongInt; const Obj: TGraphicObject);
var
  NewBlock: PObjBlock;
  InsertPoint: PObjBlock;
  TmpIter: TExclusiveGraphicObjIterator;
begin
  { Safe guard. }
  if fHead = nil then
   Raise ECADSysException.Create('TGraphicObjList.Insert: No objects in the list');
  if fIterators > 0 then
   Raise ECADListBlocked.Create('TGraphicObjList.Insert: The list has active iterators.');
  // Alloca un iterator locale
  TmpIter := GetExclusiveIterator;
  try
    InsertPoint := TmpIter.SearchBlock(IDInsertPoint);
    if (InsertPoint = nil) then
     Raise ECADListObjNotFound.Create('TGraphicObjList.Insert: Object not found');
    { Allocate new blocks. }
    GetMem(NewBlock, SizeOf(TObjBlock));
    { Initialize the block. }
    NewBlock^.Prev := InsertPoint^.Prev;
    NewBlock^.Next := InsertPoint;
    NewBlock^.Obj := Obj;
    if InsertPoint^.Prev <> nil then
     InsertPoint^.Prev^.Next := NewBlock
    else
     fHead := NewBlock;
    InsertPoint^.Prev := NewBlock;
    Inc(fCount);
  finally
    TmpIter.Free;
  end;
end;

procedure TGraphicObjList.Move(const IDToMove, IDInsertPoint: LongInt);
var
  InsertPoint, ToMove: PObjBlock;
  TmpIter: TExclusiveGraphicObjIterator;
begin
  { Safe guard. }
  if fHead = nil then
   Raise ECADSysException.Create('TGraphicObjList.Move: No objects in the list');
  if fIterators > 0 then
   Raise ECADListBlocked.Create('TGraphicObjList.Move: The list has active iterators.');
  // Alloca un iterator locale
  TmpIter := GetExclusiveIterator;
  try
    { Check if the current and insert point are the same. }
    if IDInsertPoint = IDToMove then
     Raise ECADSysException.Create('TGraphicObjList.Move: Bad object to move');
    InsertPoint := TmpIter.SearchBlock(IDInsertPoint);
    ToMove := TmpIter.SearchBlock(IDToMove);
    if (InsertPoint = nil) then
     Raise ECADListObjNotFound.Create('TGraphicObjList.Move: Insertion point not found');
    if (ToMove = nil) then
     Raise ECADListObjNotFound.Create('TGraphicObjList.Move: Object to move not found');
    { Now I have the block to move and the insertion point. }
    if ToMove^.Prev <> nil then
     ToMove^.Prev^.Next := ToMove^.Next
    else
     fHead := ToMove^.Next;
    if ToMove^.Next <> nil then
     ToMove^.Next^.Prev := ToMove^.Prev
    else
     fTail := ToMove^.Prev;
    { Set new link. }
    if InsertPoint^.Prev <> nil then
     InsertPoint^.Prev^.Next := ToMove
    else
     fHead := ToMove;
    ToMove^.Next := InsertPoint;
    ToMove^.Prev := InsertPoint^.Prev;
    InsertPoint^.Prev := ToMove;
  finally
    TmpIter.Free;
  end;
end;

procedure TGraphicObjList.DeleteBlock(ObjToDel: Pointer);
begin
  fListGuard.Enter;
  try
    // Free the first object. So if it cannot be deleted it will be later.
    if Assigned(TObjBlock(ObjToDel^).Obj) and FFreeOnClear then
     TObjBlock(ObjToDel^).Obj.Free;
    // First extract the block from all list.
    if TObjBlock(ObjToDel^).Next <> nil then
     TObjBlock(ObjToDel^).Next^.Prev := TObjBlock(ObjToDel^).Prev
    else
     { I reached the Last block. }
     fTail := TObjBlock(ObjToDel^).Prev;
    if TObjBlock(ObjToDel^).Prev <> nil then
     TObjBlock(ObjToDel^).Prev^.Next := TObjBlock(ObjToDel^).Next
    else
     { I reached the head. }
     fHead := TObjBlock(ObjToDel^).Next;
    FreeMem(ObjToDel, SizeOf(TObjBlock));
    Dec(fCount);
  finally
    fListGuard.Leave;
  end;
end;

function TGraphicObjList.Delete(const ID: LongInt): Boolean;
var
  ObjToDel: PObjBlock;
  TmpIter: TExclusiveGraphicObjIterator;
begin
  Result := False;
  if fIterators > 0 then
   Raise ECADListBlocked.Create('TGraphicObjList.Delete: The list has active iterators.');
  // Alloca un iterator locale
  TmpIter := GetExclusiveIterator;
  try
    ObjToDel := TmpIter.SearchBlock(ID);
    if ObjToDel = nil then
     Raise ECADListObjNotFound.Create('TGraphicObjList.Delete: Object not found');
    DeleteBlock(ObjToDel);
    Result := True;
  finally
    TmpIter.Free;
  end;
end;

function  TGraphicObjList.Find(const ID: LongInt): TGraphicObject;
var
  FoundObj: PObjBlock;
  TmpIter: TGraphicObjIterator;
begin
  Result := nil;
  // Alloca un iterator locale
  TmpIter := GetIterator;
  try
    FoundObj := TmpIter.SearchBlock(ID);
    if FoundObj = nil then
     Exit;
    Result := TObjBlock(FoundObj^).Obj;
  finally
    TmpIter.Free;
  end;
end;

procedure TGraphicObjList.RemoveBlock(ObjToDel: Pointer);
begin
  fListGuard.Enter;
  try
    // First extract the block from all list.
    if TObjBlock(ObjToDel^).Next <> nil then
     TObjBlock(ObjToDel^).Next^.Prev := TObjBlock(ObjToDel^).Prev
    else
     { I reached the Last block. }
     fTail := TObjBlock(ObjToDel^).Prev;
    if TObjBlock(ObjToDel^).Prev <> nil then
     TObjBlock(ObjToDel^).Prev^.Next := TObjBlock(ObjToDel^).Next
    else
     { I reached the head. }
     fHead := TObjBlock(ObjToDel^).Next;
    FreeMem(ObjToDel, SizeOf(TObjBlock));
    Dec(fCount);
  finally
   fListGuard.Leave;
  end;
end;

function TGraphicObjList.Remove(const ID: LongInt): Boolean;
var
  ObjToDel: PObjBlock;
  TmpIter: TExclusiveGraphicObjIterator;
begin
  Result := False;
  if fIterators > 0 then
   Raise ECADListBlocked.Create('TGraphicObjList.Remove: The list has active iterators.');
  // Alloca un iterator locale
  TmpIter := GetExclusiveIterator;
  try
    ObjToDel := TmpIter.SearchBlock(ID);
    if ObjToDel = nil then
     Raise ECADListObjNotFound.Create('TGraphicObjList.Remove: No object found');
    RemoveBlock(ObjToDel);
    Result := False;
  finally
    TmpIter.Free;
  end;
end;

procedure TGraphicObjList.Clear;
var
  TmpBlock: PObjBlock;
begin
  if fIterators > 0 then
   Raise ECADListBlocked.Create('TGraphicObjList.Clear: The list has active iterators.');
  fListGuard.Enter;
  try
    while fHead <> nil do
     begin
       try
         if fFreeOnClear and Assigned(TObjBlock(fHead^).Obj) then
          TObjBlock(FHead^).Obj.Free;
       except
       end;
       TmpBlock := fHead;
       fHead := TObjBlock(fHead^).Next;
       FreeMem(TmpBlock, SizeOf(TObjBlock));
     end;
    fHead := nil;
    fTail := nil;
    fCount := 0;
  finally
    fListGuard.Leave;
  end;
end;

// =====================================================================
// TGraphicObjIterator
// =====================================================================

{ Search the block corresponding to ID. }
function TGraphicObjIterator.SearchBlock(ID: LongInt): Pointer;
begin
  Result := fSourceList.fHead;
  while (Result <> nil) and (TObjBlock(Result^).Obj.ID <> ID) do
   begin
     if TObjBlock(Result^).Prev = fSourceList.fTail then
      begin
        Result := nil;
        Break;
      end;
     Result := TObjBlock(Result^).Next;
   end;
end;

function TGraphicObjIterator.GetCurrentObject: TGraphicObject;
begin
  if fCurrent <> nil then
   Result := TObjBlock(fCurrent^).Obj
  else
   Result := nil;
end;

constructor TGraphicObjIterator.Create(const Lst: TGraphicObjList);
begin
  inherited Create;

  Lst.fListGuard.Enter;
  try
    fCurrent := nil;
    fSourceList := Lst;
    if fSourceList <> nil then
     begin
       Inc(fSourceList.fIterators);
       fCurrent := fSourceList.fHead;
     end;
  finally
    Lst.fListGuard.Leave;
  end;
end;

destructor TGraphicObjIterator.Destroy;
begin
  fSourceList.fListGuard.Enter;
  try
    if fSourceList <> nil then
     begin
       Dec(fSourceList.fIterators);
       if fSourceList.fIterators < 0 then
        fSourceList.fIterators := 0;
     end;
  finally
    fSourceList.fListGuard.Leave;
  end;
  inherited;
end;

function TGraphicObjIterator.GetCount: Integer;
begin
  if (fSourceList = nil) then
   Result := 0
  else
   Result := fSourceList.Count;
end;

function TGraphicObjIterator.Search(const ID: LongInt): TGraphicObject;
var
  TmpBlock: PObjBlock;
begin
  Result := nil;
  if (fSourceList = nil) then
   Exit;
  TmpBlock := SearchBlock(ID);
  if TmpBlock = nil then
   Exit;
  Result := TmpBlock^.Obj;
  fCurrent := TmpBlock;
end;

function TGraphicObjIterator.Next: TGraphicObject;
begin
  Result := nil;
  if (fSourceList = nil) and (fCurrent = nil) then
   Exit;
  { Check if the End of the list is reached. }
  if fCurrent = Pointer(fSourceList.fTail) then
   begin
     fCurrent := nil;
     Exit;
   end;
  fCurrent := TObjBlock(fCurrent^).Next;
  Result := TObjBlock(fCurrent^).Obj;
end;

function TGraphicObjIterator.Prev: TGraphicObject;
begin
  Result := nil;
  if (fSourceList = nil) and (fCurrent = nil) then
   Exit;
  { Check if the start of the list is reached. }
  if fCurrent = Pointer(fSourceList.fHead) then
   begin
     fCurrent := nil;
     Exit;
   end;
  fCurrent := TObjBlock(fCurrent^).Prev;
  Result := TObjBlock(fCurrent^).Obj;
end;

function TGraphicObjIterator.First: TGraphicObject;
begin
  Result := nil;
  if fSourceList = nil then
   Exit;
  fCurrent := fSourceList.fHead;
  if fCurrent = nil then
   Exit;
  Result := TObjBlock(fCurrent^).Obj;
end;

function TGraphicObjIterator.Last: TGraphicObject;
begin
  Result := nil;
  if fSourceList = nil then
   Exit;
  fCurrent := fSourceList.fTail;
  if fCurrent = nil then
   Exit;
  Result := TObjBlock(FCurrent^).Obj;
end;

// =====================================================================
// TExclusiveGraphicObjIterator
// =====================================================================

constructor TExclusiveGraphicObjIterator.Create(const Lst: TGraphicObjList);
begin
  inherited Create(Lst);
  Lst.fListGuard.Enter;
  try
    if fSourceList <> nil then
     fSourceList.fHasExclusive := True;
  finally
    Lst.fListGuard.Leave;
  end;
end;

destructor TExclusiveGraphicObjIterator.Destroy;
begin
  fSourceList.fListGuard.Enter;
  try
    if fSourceList <> nil then
     fSourceList.fHasExclusive := False;
  finally
    fSourceList.fListGuard.Leave;
  end;
  inherited;
end;

procedure TExclusiveGraphicObjIterator.DeleteCurrent;
var
  TmpObj: Pointer;
begin
  if (fSourceList <> nil) and (fCurrent <> nil) then
   begin
     if TObjBlock(fCurrent^).Next <> nil then
      TmpObj := TObjBlock(fCurrent^).Next
     else
      TmpObj := TObjBlock(fCurrent^).Prev;
     fSourceList.DeleteBlock(fCurrent);
     fCurrent := TmpObj;
   end;
end;

procedure TExclusiveGraphicObjIterator.RemoveCurrent;
var
  TmpObj: Pointer;
begin
  if (fSourceList <> nil) and (fCurrent <> nil) then
   begin
     if TObjBlock(fCurrent^).Next <> nil then
      TmpObj := TObjBlock(fCurrent^).Next
     else
      TmpObj := TObjBlock(fCurrent^).Prev;
     fSourceList.RemoveBlock(fCurrent);
     fCurrent := TmpObj;
   end;
end;

// =====================================================================
// TIndexedObjectList
// =====================================================================

type
  TIdxObjListArray = array[0..0] of TObject;
  PIdxObjListArray = ^TIdxObjListArray;

procedure TIndexedObjectList.SetListSize(N: Integer);
var
  Cont: Integer;
begin
  if N <> fNumOfObject then
   begin
     if fFreeOnClear then
      for Cont := N to fNumOfObject - 1 do
       GetObject(Cont).Free;
     ReallocMem(fListMemory, N * SizeOf(TObject));
     for Cont := fNumOfObject to N - 1 do
      TIdxObjListArray(fListMemory^)[Cont] := nil;
     if N = 0 then
      fListMemory := nil;
     fNumOfObject := N;
   end;
end;

procedure TIndexedObjectList.SetObject(Idx: Integer; Obj: TObject);
begin
  if not Assigned(fListMemory) then
   Exit;
  if Idx < fNumOfObject then
   TIdxObjListArray(fListMemory^)[Idx] := Obj
  else
   Raise ECADOutOfBound.Create('TIndexedObjectList.SetObject: Index out of bounds.');
end;

function TIndexedObjectList.GetObject(Idx: Integer): TObject;
begin
  Result := nil;
  if not Assigned(fListMemory) then
   Exit;
  if Idx < fNumOfObject then
   Result := TIdxObjListArray(fListMemory^)[Idx]
  else
   Raise ECADOutOfBound.Create('TIndexedObjectList.GetObject: Index out of bounds.');
end;

constructor TIndexedObjectList.Create(const Size: Integer);
begin
  inherited Create;

  fFreeOnClear := True;
  SetListSize(Size);
end;

destructor TIndexedObjectList.Destroy;
begin
  Clear;
  FreeMem(fListMemory, fNumOfObject * SizeOf(TObject));
  inherited;
end;

procedure TIndexedObjectList.Clear;
var
  Cont: Integer;
begin
  if fFreeOnClear then
   for Cont := 0 to fNumOfObject - 1 do
    begin
      GetObject(Cont).Free;
      SetObject(Cont, nil);
    end;
end;

// =====================================================================
// TPaintingThread
// =====================================================================

constructor TPaintingThread.Create(const Owner: TCADViewport; const ARect: TRect2D);
begin
  inherited Create(True); // Sempre disattivo alla partenza.
//  priority := tpTimeCritical;
  FreeOnTerminate := True;
  fOwner := Owner;
  fRect := ARect;
end;

destructor TPaintingThread.Destroy;
begin
  DoTerminate;
  inherited;
end;

procedure TPaintingThread.Execute;
var
  Tmp: TGraphicObject;
  TmpIter: TGraphicObjIterator;
  Cont: Integer;
  TmpCanvas: TCanvas;
  TmpClipRect: TRect2D;
begin
  if not Assigned(fOwner) then
   Exit;
  with fOwner do
   try
     TmpCanvas := OffScreenCanvas.Canvas;
     TmpClipRect := RectToRect2D(ClientRect);
     TmpCanvas.Lock;
     try
       if fShowGrid and not fGridOnTop then
        DrawGrid(fRect, TmpCanvas);
       if fShowCentralCross and not fGridOnTop then begin
            Canvas.Pen.Color:=fCentralCrossColor;
            DrawCentralCross(fRect, TmpCanvas);
       end;
       if (fViewportObjects <> nil) then
        TmpIter := fViewportObjects.GetIterator
       else if not Assigned(fCADCmp) or fCADCmp.IsBlocked then
        Exit
       else
        TmpIter := FCADCmp.GetListOfObjects;
       try
         Tmp := TmpIter.First;
         if fDrawMode = DRAWMODE_NODRAW then
          Exit;
         Cont := 0;
         if fCopingFrequency > 0 then
          while Tmp <> nil do
           begin
             DrawObject(Tmp, OffScreenCanvas, TmpClipRect);
             Inc(Cont);
             if Cont >= fCopingFrequency then
              begin
                Synchronize(DoCopyCanvasThreadSafe);
                Cont := 0;
              end;
             Tmp := TmpIter.Next;
             if Terminated then
              Break;
           end
         else
          while Tmp <> nil do
           begin
             DrawObject(Tmp, OffScreenCanvas, TmpClipRect);
             Tmp := TmpIter.Next;
             if Terminated then
              Break;
           end;
       finally
         TmpIter.Free;
       end;
       if fShowGrid and fGridOnTop then
        DrawGrid(fRect, TmpCanvas);
       if fShowCentralCross and fGridOnTop then begin
            Canvas.Pen.Color:=fCentralCrossColor;
            DrawCentralCross(fRect, TmpCanvas);
       end;
     finally
       TmpCanvas.UnLock;
     end;
   except
   end;
  Synchronize(fOwner.DoCopyCanvasThreadSafe);
end;

// =====================================================================
// TLayer
// =====================================================================

procedure TLayer.Changed(Sender: TObject);
begin
  FModified := True;
end;

procedure TLayer.SetName(Nm: TLayerName);
begin
  if fName <> Nm then
   begin
     FName := Nm;
     FModified := True;
   end;
end;

procedure TLayer.SetPen(Pn: TPen);
begin
  if Assigned(Pn) then
   begin
     FPen.Assign(Pn);
     FModified := True;
   end;
end;

procedure TLayer.SetBrush(Br: TBrush);
begin
  if Assigned(Br) then
   begin
     FBrush.Assign(Br);
     FModified := True;
   end;
end;

constructor TLayer.Create(Idx: Byte);
begin
  inherited Create;
  fIdx := Idx;
  fName := '';
//  Format('Layer %d', [Idx]);
  FPen := TPen.Create;
  FPen.Color := clBlack;
  FPen.Style := psSolid;
  FBrush := TBrush.Create;
  FBrush.Color := clWhite;
  FBrush.Style := bsSolid;
  fDecorativePen := TDecorativePen.Create;
  FActive := True;
  fVisible := True;
  FOpaque := False;
  fHomogen := False;
  fStreamable := True;
  FModified := False;
  FPen.OnChange := Changed;
  FBrush.OnChange := Changed;
  fTag := 0;
end;

destructor TLayer.Destroy;
begin
  FPen.Free;
  FBrush.Free;
  fDecorativePen.Free;
  inherited Destroy;
end;

procedure TLayer.SaveToStream(const Stream: TStream);
var
  TmpColor: TColor;
  TmpPenStyle: TPenStyle;
  TmpPenMode: TPenMode;
  TmpWidth: Integer;
  TmpBrushStyle: TBrushStyle;
  TmpBool: Boolean;
begin
  TmpColor := fPen.Color;
  Stream.Write(TmpColor, SizeOf(TmpColor));
  TmpPenStyle := fPen.Style;
  Stream.Write(TmpPenStyle, SizeOf(TmpPenStyle));
  TmpPenMode := fPen.Mode;
  Stream.Write(TmpPenMode, SizeOf(TmpPenMode));
  TmpWidth := fPen.Width;
  Stream.Write(TmpWidth, SizeOf(TmpWidth));

  TmpColor := fBrush.Color;
  Stream.Write(TmpColor, SizeOf(TmpColor));
  TmpBrushStyle := fBrush.Style;
  Stream.Write(TmpBrushStyle, SizeOf(TmpBrushStyle));

  TmpWidth := fDecorativePen.PatternLenght;
  Stream.Write(TmpWidth, SizeOf(TmpWidth));
  for TmpWidth := 0 to fDecorativePen.PatternLenght - 1 do
   begin
     TmpBool := fDecorativePen.PenStyle[TmpWidth];
     Stream.Write(TmpBool, SizeOf(TmpBool));
   end;

  Stream.Write(fActive, SizeOf(Boolean));
  Stream.Write(fVisible, SizeOf(Boolean));
  Stream.Write(fOpaque, SizeOf(Boolean));
  Stream.Write(fStreamable, SizeOf(Boolean));
  Stream.Write(fName, SizeOf(TLayerName));
end;

procedure TLayer.LoadFromStream(const Stream: TStream;
                                const Version: TCADVersion);
var
  TmpColor: TColor;
  TmpPenStyle: TPenStyle;
  TmpPenMode: TPenMode;
  TmpCont, TmpWidth: Integer;
  TmpBrushStyle: TBrushStyle;
  TmpBool: Boolean;
begin
  Stream.Read(TmpColor, SizeOf(TmpColor));
  fPen.Color := TmpColor;
  Stream.Read(TmpPenStyle, SizeOf(TmpPenStyle));
  fPen.Style := TmpPenStyle;
  Stream.Read(TmpPenMode, SizeOf(TmpPenMode));
  fPen.Mode := TmpPenMode;
  Stream.Read(TmpWidth, SizeOf(TmpWidth));
  fPen.Width := TmpWidth;

  Stream.Read(TmpColor, SizeOf(TmpColor));
  fBrush.Color := TmpColor;
  Stream.Read(TmpBrushStyle, SizeOf(TmpBrushStyle));
  fBrush.Style := TmpBrushStyle;
  if( Version < 'CAD422' ) then
   Stream.Read(TmpColor, SizeOf(TmpColor));

  if (Version >= 'CAD41') then
   begin
     Stream.Read(TmpWidth, SizeOf(TmpWidth));
     for TmpCont := 0 to TmpWidth - 1 do
      begin
        Stream.Read(TmpBool, SizeOf(TmpBool));
        fDecorativePen.PenStyle[TmpCont] := TmpBool;
      end;
   end;

  Stream.Read(fActive, SizeOf(Boolean));
  if (Version >= 'CAD4') then
   Stream.Read(fVisible, SizeOf(Boolean))
  else
   fVisible := True;
  Stream.Read(fOpaque, SizeOf(Boolean));
  if (Version = 'CAD3  ') then
   begin
     Stream.Read(fStreamable, SizeOf(Boolean));
     fName := '';
//     Format('Layer %d', [fIdx]);
   end
  else if Version >= 'CAD33' then
   begin
     Stream.Read(fStreamable, SizeOf(Boolean));
     Stream.Read(fName, SizeOf(TLayerName));
   end
  else
   begin
     fStreamable := True;
     fName := '';
//     Format('Layer %d', [fIdx]);
   end;
  fModified := True;
end;

function TLayer.SetCanvas(const Cnv: TDecorativeCanvas): Boolean;
begin
  Result := fVisible;
  if not fVisible then
   Exit;
  with Cnv do
   begin
     Canvas.Pen.Assign(Pen);
     Canvas.Brush.Assign(Brush);
     Canvas.Font.Color := Pen.Color;
     if not fOpaque then
      Windows.SetBkMode(Canvas.Handle, Windows.TRANSPARENT)
     else
      Windows.SetBkMode(Canvas.Handle, Windows.OPAQUE);
   end;
  Cnv.DecorativePen.Assign(fDecorativePen);
end;

function TLayers.GetLayerByName(const Nm: TLayerName): TLayer;
var
  Cont: Integer;
begin
  Result := nil;
  for Cont := 0 to 255 do
   if Nm = TLayer(Flayers.Items[Cont]).fName then
    Result := TLayer(Flayers.Items[Cont]);
end;

function TLayers.GetLayer(Index: Byte): TLayer;
begin
  Result := TLayer(Flayers.Items[Index]);
end;

constructor TLayers.Create;
var
  Cont: Byte;
  TmpLay: TLayer;
begin
  inherited Create;
  FLayers := TList.Create;
  for Cont := 0 to 255 do
   begin
     TmpLay := TLayer.Create(Cont);
     TmpLay.fName := '';
//     Format('Layer %d', [Cont]);
     FLayers.Add(TmpLay);
   end;
end;

destructor TLayers.Destroy;
begin
  while FLayers.Count > 0 do
   begin
     TLayer(FLayers.Items[0]).Free;
     FLayers.Delete(0);
   end;
  FLayers.Free;
  inherited Destroy;
end;

procedure TLayers.SaveToStream(const Stream: TStream);
var
  Cont: Word;
begin
  Cont := 1;
  Stream.Write(Cont, SizeOf(Cont));
  for Cont := 0 to 255 do
   with Stream do
    if TLayer(FLayers[Cont]).fModified then
     begin
       Write(Cont, SizeOf(Cont));
       TLayer(FLayers[Cont]).SaveToStream(Stream);
     end;
  Cont := 256;
  Stream.Write(Cont, SizeOf(Cont));
end;

procedure TLayers.LoadFromStream(const Stream: TStream;
                                 const Version: TCADVersion);
var
  Cont: Word;
begin
  Stream.Read(Cont, SizeOf(Cont));
  if Cont <> 1 then Raise
   ECADFileNotValid.Create('TLayers.LoadFromStream: No layers found');
  while Stream.Position < Stream.Size do
   with Stream do
    begin
      Read(Cont, SizeOf(Cont));
      if Cont = 256 then Break;
      TLayer(FLayers[Cont]).LoadFromStream(Stream, Version);
    end;
end;

function TLayers.SetCanvas(const Cnv: TDecorativeCanvas;
                           const Index: Byte): Boolean;
begin
  Result := TLayer(Flayers.Items[Index]).SetCanvas(Cnv);
end;

// =====================================================================
// TCADCmp
// =====================================================================

procedure TCADCmp.SetHomogen(Value:boolean);
var cont: integer;
begin
  If fHomogen<>Value then begin
     fHomogen:=Value;
    for Cont := 0 to fListOfViewport.Count - 1 do
        TCADViewport(FListOfViewport[Cont]).Repaint;
  end;
end;

function TCADCmp.GetObjectsCount: Integer;
begin
  Result := fListOfObjects.Count;
end;

function TCADCmp.GetSourceBlocksCount: Integer;
begin
  Result := fListOfBlocks.Count;
end;

function TCADCmp.GetListOfObjects: TGraphicObjIterator;
begin
  Result := fListOfObjects.GetIterator;
end;

function TCADCmp.GetListOfBlocks: TGraphicObjIterator;
begin
  Result := fListOfBlocks.GetIterator;
end;

procedure TCADCmp.SetListOfObjects(NL: TGraphicObjList);
begin
  if HasIterators then
   Raise ECADSysException.Create('TCADCmp.SetListOfObjects: Cannot change ObjectList when the current one has active iterators.');
  if Assigned(NL) then
   begin
     DeleteAllObjects;
     fListOfObjects.Free;
     fListOfObjects := NL;
   end;
end;

procedure TCADCmp.SetListOfBlocks(NL: TGraphicObjList);
begin
  if HasIterators then
   Raise ECADSysException.Create('TCADCmp.SetListOfBlocks: Cannot change BlocksList when the current one has active iterators.');
  if Assigned(NL) then
   begin
     DeleteAllSourceBlocks;
     fListOfBlocks.Free;
     fListOfBlocks := NL;
   end;
end;

function TCADCmp.GetExclusiveListOfObjects: TExclusiveGraphicObjIterator;
begin
  Result := fListOfObjects.GetExclusiveIterator;
end;

function TCADCmp.GetExclusiveListOfBlocks: TExclusiveGraphicObjIterator;
begin
  Result := fListOfBlocks.GetExclusiveIterator;
end;

function TCADCmp.GetIsBlocked: Boolean;
begin
  Result := fListOfObjects.HasExclusiveIterators or fListOfBlocks.HasExclusiveIterators;
end;

function TCADCmp.GetHasIterators: Boolean;
begin
  Result := fListOfObjects.HasIterators or fListOfBlocks.HasIterators;
end;

function TCADCmp.GetViewport(Idx: Integer): TCADViewport;
begin
  Result := TCADViewport(fListOfViewport[Idx]);
end;

function TCADCmp.GetViewportsCount: Integer;
begin
  Result := fListOfViewport.Count;
end;

constructor TCADCmp.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  fListOfObjects := TGraphicObjList.Create;
  fListOfObjects.FreeOnClear := True;
  fListOfBlocks := TGraphicObjList.Create;
  fListOfBlocks.FreeOnClear := True;

  fListOfViewport := TList.Create;
  fLayers := TLayers.Create;
  fCurrentLayer := 0;
  fRepaintAfterTransform := True;
  fDrawOnAdd := False;
  fNextID := 0;
  fNextBlockID := 0;
  fVersion := CADSysVersion;
end;

// Used because BlockList can contain circular references.
procedure TCADCmp.DeleteAllSourceBlocks;
var
  TmpObj: TGraphicObject;
  Deleted: Integer;
  TmpIter: TExclusiveGraphicObjIterator;
begin
  TmpIter := fListOfBlocks.GetExclusiveIterator;
  try
   repeat
     Deleted := 0;
     TmpObj := TmpIter.First;
     while Assigned(TmpObj) do
      begin
       try
         TmpIter.DeleteCurrent;
         Inc(Deleted);
         TmpObj := TmpIter.Current;
       except
         TmpObj := TmpIter.Next;
       end;
     end;
     if (Deleted = 0) and (fListOfBlocks.Count > 0) then
      begin
        Raise ECADSourceBlockIsReferenced.Create('TCADCmp.FreeSourceBlocks: CADSys 4.0 Severe error'#10#13'The drawing contains circular reference of source blocks. They will be not deleted !');
        Exit;
      end;
   until TmpIter.Count = 0;
  finally
    TmpIter.Free;
  end;
end;

procedure TCADCmp.DeleteAllObjects;
begin
  try
   fListOfObjects.Clear;
  except
  end;
  fNextID := 0;
end;

destructor TCADCmp.Destroy;
var
  Cont: Integer;
begin
  DeleteAllObjects;
  FListOfObjects.Free;
  DeleteAllSourceBlocks;
  FListOfBlocks.Free;
  for Cont := 0 to fListOfViewport.Count - 1 do
   TCADViewport(FListOfViewport[Cont]).fCADCmp := nil;
  FListOfViewport.Free;
  FLayers.Free;
  inherited Destroy;
end;

procedure TCADCmp.SaveToStream(const Stream: TStream);
var
  TmpByte: Byte;
begin
  with Stream do
   begin
     { Write the signature for the version. }
     Write(FVersion, SizeOf(FVersion));
     { Save the layer informations. }
     FLayers.SaveToStream(Stream);
     { Save the source blocks. }
     TmpByte := 2;
     Write(TmpByte, SizeOf(TmpByte));
     SaveBlocksToStream(Stream, False);
     { Save the objects. }
     TmpByte := 3;
     Write(TmpByte, SizeOf(TmpByte));
     SaveObjectsToStream(Stream);
   end;
end;

procedure TCADCmp.MergeFromStream(const Stream: TStream);
var
  TmpVersion: TCADVersion;
  TmpByte: Byte;
  TmpBool: Boolean;
begin
  with Stream do
   begin
     Read(TmpVersion, SizeOf(TmpVersion));
     TmpBool := TmpVersion = CADSysVersion;
     if (not TmpBool) and Assigned(fOnVerError) then
      fOnVerError(Self, stDrawing, Stream, TmpBool);
     if TmpBool then
      begin
        { Load the layer informations. }
        FLayers.LoadFromStream(Stream, TmpVersion);
        { Load the source blocks. }
        Read(TmpByte, SizeOf(TmpByte));
        if TmpByte <> 2 then
         Raise ECADFileNotValid.Create('TCADCmp.MergeFromStream: no blocks found');
        LoadBlocksFromStream(Stream, TmpVersion);
        { Load the objects. }
        Read(TmpByte, SizeOf(TmpByte));
        if TmpByte <> 3 then
         Raise ECADFileNotValid.Create('TCADCmp.MergeFromStream: no objects found');
        LoadObjectsFromStream(Stream, TmpVersion);
      end
     else
      Raise ECADFileNotValid.Create('TCADCmp.MergeFromStream: Invalid stream version.');
   end;
end;

procedure TCADCmp.LoadFromStream(const Stream: TStream);
begin
  { Delete all objects. }
  DeleteAllObjects;
  DeleteSavedSourceBlocks;
  MergeFromStream(Stream);
end;

procedure TCADCmp.LoadLibrary(const Stream: TStream);
var
  TmpVersion: TCADVersion;
  TmpByte: Byte;
  TmpBool: Boolean;
begin
  with Stream do
   begin
     Read(TmpVersion, SizeOf(TmpVersion));
     TmpBool := TmpVersion = CADSysVersion;
     if (not TmpBool) and Assigned(fOnVerError) then
      fOnVerError(Self, stLibrary, Stream, TmpBool);
     if TmpBool then
      begin
        { Load the source blocks. }
        Read(TmpByte, SizeOf(TmpByte));
        if TmpByte <> 2 then
         Raise ECADFileNotValid.Create('TCADCmp.LoadLibrary: no blocks found');
        LoadBlocksFromStream(Stream, TmpVersion);
      end
     else
      Raise ECADFileNotValid.Create('TCADCmp.LoadLibrary: Invalid stream version.');
   end;
end;

procedure TCADCmp.SaveLibrary(const Stream: TStream);
var
  TmpByte: Byte;
begin
  with Stream do
   begin
     { Write the signature for the version. }
     Write(FVersion, SizeOf(FVersion));
     { Save the source blocks. }
     TmpByte := 2;
     Write(TmpByte, SizeOf(TmpByte));
     SaveBlocksToStream(Stream, True);
   end;
end;

procedure TCADCmp.MergeFromFile(const FileName: String);
var
  TmpStr: TFileStream;
begin
  TmpStr := TFileStream.Create(FileName, fmOpenRead);
  try
    MergeFromStream(TmpStr);
    RepaintViewports;
  finally
    TmpStr.Free;
  end;
end;

procedure TCADCmp.LoadFromFile(const FileName: String);
var
  TmpStr: TFileStream;
begin
  TmpStr := TFileStream.Create(FileName, fmOpenRead);
  try
    LoadFromStream(TmpStr);
    RepaintViewports;
  finally
    TmpStr.Free;
  end;
end;

procedure TCADCmp.SaveToFile(const FileName: String);
var
  TmpStr: TFileStream;
begin
  TmpStr := TFileStream.Create(FileName, fmOpenWrite or fmCreate);
  try
    SaveToStream(TmpStr);
  finally
    TmpStr.Free;
  end;
end;

function TCADCmp.AddSourceBlock(ID: LongInt; const Obj: TGraphicObject): TGraphicObject;
begin
  Result := Obj;
  if ID < 0 then
   begin
     ID := FNextBlockID;
     Inc(FNextBlockID);
   end
  else
   if ID >= FNextBlockID then FNextBlockID := ID + 1;
  Obj.fOwnerCAD := Self;
  Obj.Layer := FCurrentLayer;
  Obj.ID := ID;
  Obj.UpdateExtension(Self);
  fListOfBlocks.Add(Obj);
end;

function TCADCmp.GetSourceBlock(ID: LongInt): TGraphicObject;
var
  TmpIter: TGraphicObjIterator;
begin
  TmpIter := GetListOfBlocks;
  try
   Result := TmpIter.Search(ID);
  finally
   TmpIter.Free;
  end;
end;

function TCADCmp.FindSourceBlock(const SrcName: TSourceBlockName): TGraphicObject;
begin
  Result := nil;
end;

procedure TCADCmp.DeleteSourceBlockByID(const ID: LongInt);
var
  TmpObj: TGraphicObject;
begin
  TmpObj := GetSourceBlock(ID);
  if TmpObj = nil then
   Raise ECADListObjNotFound.Create('TCADCmp.DeleteSourceBlock: No source block found');
  try
   fListOfBlocks.Delete(ID);
  except
  end;
end;

function TCADCmp.AddObject(ID: LongInt; const Obj: TGraphicObject): TGraphicObject;
begin
  Result := Obj;
  if ID < 0 then
   begin
     ID := FNextID;
     Inc(FNextID);
   end
  else
   if ID >= FNextID then FNextID := ID + 1;
  Obj.fOwnerCAD := Self;
  Obj.Layer := FCurrentLayer;
  Obj.ID := ID;
  Obj.UpdateExtension(Self);
  FListOfObjects.Add(Obj);
  if FDrawOnAdd then
   RedrawObject(Obj);
  if Assigned(FOnAddObject) then
   FOnAddObject(Self, Obj);
end;

function TCADCmp.InsertObject(ID, IDInsertPoint: LongInt; const Obj: TGraphicObject): TGraphicObject;
begin
  Result := Obj;
  FListOfObjects.Insert(IDInsertPoint, Obj);
  if ID < 0 then
   begin
     ID := FNextID;
     Inc(FNextID);
   end
  else
   if ID > FNextID then FNextID := ID;
  Obj.fOwnerCAD := Self;
  Obj.Layer := FCurrentLayer;
  Obj.ID := ID;
  Obj.UpdateExtension(Self);
  if FDrawOnAdd then
   RedrawObject(Obj);
  if Assigned(FOnAddObject) then
   FOnAddObject(Self, Obj);
end;

procedure TCADCmp.MoveObject(const IDOrigin, IDDestination: LongInt);
begin
  FListOfObjects.Move(IDOrigin, IDDestination);
end;

procedure TCADCmp.RemoveObject(const ID: LongInt);
var
  TmpObj: TGraphicObject;
begin
  TmpObj := GetObject(ID);
  if TmpObj = nil then
   Raise ECADListObjNotFound.Create('TCADCmp.RemoveObject: No object found');
  TmpObj.fOwnerCAD := nil;
  fListOfObjects.Remove(ID);
end;

procedure TCADCmp.DeleteObject(const ID: LongInt);
var
  TmpObj: TGraphicObject;
begin
  TmpObj := GetObject(ID);
  if TmpObj = nil then
   Raise ECADListObjNotFound.Create('TCADCmp.DeleteObject: No object found');
  fListOfObjects.Delete(ID);
end;

procedure TCADCmp.ChangeObjectLayer(const ID: LongInt; const NewLayer: Byte);
var
  TmpObj: TGraphicObject;
begin
  TmpObj := GetObject(ID);
  if TmpObj = nil then
   Raise ECADListObjNotFound.Create('TCADCmp.ChangeObjectLayer: No object found');
  TmpObj.Layer := NewLayer;
end;

function  TCADCmp.GetObject(ID: LongInt): TGraphicObject;
var
  TmpIter: TGraphicObjIterator;
begin
  TmpIter := GetListOfObjects;
  try
   Result := TmpIter.Search(ID);
  finally
   TmpIter.Free;
  end;
end;

procedure TCADCmp.AddViewports(const VP: TCADViewport);
begin
  if not Assigned(VP) then Exit;
  FListOfViewport.Add(VP);
end;

procedure TCADCmp.DelViewports(const VP: TCADViewport);
var
  Cont: Integer;
begin
  if not Assigned(VP) then Exit;
  Cont := FListOfViewport.IndexOf(VP);
  if Cont >= 0 then FListOfViewport.Delete(Cont);
end;

procedure TCADCmp.RepaintViewports;
var
  Cont: Integer;
begin
  for Cont := 0 to FListOfViewport.Count - 1 do
   TCADViewport(FListOfViewport.Items[Cont]).RePaint;
end;

procedure TCADCmp.RefreshViewports;
var
  Cont: Integer;
begin
  for Cont := 0 to FListOfViewport.Count - 1 do
   TCADViewport(FListOfViewport.Items[Cont]).Refresh;
end;

procedure TCADCmp.RedrawObject(const Obj: TGraphicObject);
var
  Cont: Integer;
begin
  for Cont := 0 to FListOfViewport.Count - 1 do
   with TCADViewport(FListOfViewport.Items[Cont]) do
    begin
      DrawObject(Obj, OffScreenCanvas, RectToRect2D(ClientRect));
      Refresh;
    end;
end;

procedure TCADCmp.SetDefaultBrush(const Brush: TBrush);
var
  Cont: Byte;
begin
  for Cont := 0 to 255 do
   if not fLayers[Cont].Modified then
    begin
      fLayers[Cont].Brush.Assign(Brush);
      fLayers[Cont].fModified := False;
    end;
end;

procedure TCADCmp.SetDefaultPen(const Pen: TPen);
var
  Cont: Byte;
begin
  for Cont := 0 to 255 do
   if not fLayers[Cont].Modified then
    begin
      fLayers[Cont].Pen.Assign(Pen);
      fLayers[Cont].fModified := False;
    end;
end;

procedure TCADCmp.SetDefaultLayersColor(const C: TColor);
var
  Cont: Byte;
begin
  for Cont := 0 to 255 do
   if not fLayers[Cont].Modified then
    begin
      fLayers[Cont].Pen.Color := C;
      fLayers[Cont].fModified := False;
    end;
end;

function TCADCmp.GetDefaultLayersColor: TColor;
begin
  Result := fLayers[0].Pen.Color;
end;


// =====================================================================
// TCADViewport
// =====================================================================

procedure TCADViewport.CopyBitmapOnCanvas(const DestCnv: TCanvas; const Bmp: TBitmap; IRect: TRect; IsTransparent: Boolean; TransparentColor: TColor);
begin
  if( IsTransparent and
      not (csDesigning in ComponentState) ) then
   begin
     DestCnv.Brush.Style := bsClear;
     DestCnv.BrushCopy(IRect, Bmp, IRect, TransparentColor);
   end
  else
   DestCnv.CopyRect(IRect, Bmp.Canvas, IRect);
end;

procedure TCADViewport.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params.WindowClass do
   begin
     Style := Style and not (CS_HREDRAW or CS_VREDRAW);
     if fTransparent and not(csDesigning in ComponentState) then
      begin
        Style := Style and not WS_CLIPCHILDREN;
        Style := Style and not WS_CLIPSIBLINGS;
        Params.ExStyle := Params.ExStyle or WS_EX_TRANSPARENT;
      end;
   end;
end;

function TCADViewport.CreateOffScreenCanvas(const Cnv: TCanvas): TDecorativeCanvas;
begin
  Result := TDecorativeCanvas.Create(Cnv);
end;

procedure TCADViewport.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  if (not Assigned(fOnClear)) and
     (not fTransparent) or
     (csDesigning in ComponentState) then
   inherited
  else
   Message.Result := 1;
end;

procedure TCADViewport.WMSize(var Message: TWMSize);
begin
  inherited;
  DoResize;
end;

procedure TCADViewport.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if Assigned(fOnMouseEnter) then
   fOnMouseEnter(Self);
end;

procedure TCADViewport.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if Assigned(fOnMouseLeave) then
   fOnMouseLeave(Self);
end;

procedure TCADViewport.SetDeltaX(const V: TRealType);
begin
  if fGridDeltaX <> V then
   begin
     StopRepaint;
     fGridDeltaX := V;
     Repaint;
   end;
end;

procedure TCADViewport.SetDeltaY(const V: TRealType);
begin
  if fGridDeltaY <> V then
   begin
     StopRepaint;
     fGridDeltaY := V;
     Repaint;
   end;
end;

procedure TCADViewport.SetSubX(const V: TRealType);
begin
  if fGridSubX <> V then
   begin
     StopRepaint;
     fGridSubX := V;
     Repaint;
   end;
end;

procedure TCADViewport.SetSubY(const V: TRealType);
begin
  if fGridSubY <> V then
   begin
     StopRepaint;
     fGridSubY := V;
     Repaint;
   end;
end;

procedure TCADViewport.SetShowControlPoints(V: Boolean);
begin
  if fShowControlPoints <> V then
   begin
     StopRepaint;
     fShowControlPoints := V;
     Repaint;
   end;
end;

procedure TCADViewport.SetBackColor(const Cl: TColor);
begin
  if FBackGroundColor <> Cl then
   begin
     StopRepaint;
     FBackGroundColor := Cl;
     fRubberPen.Color := fRubberPenColor xor Cl;
     Repaint;
   end;
end;

procedure TCADViewport.SetTransparent(const B: Boolean);
begin
  if( fTransparent <> B ) then
   begin
     StopRepaint;
     fTransparent := B;
     Repaint;
   end;
end;

procedure TCADViewport.SetOnClearCanvas(const H: TClearCanvas);
begin
  StopRepaint;
  fOnClear := H;
  Repaint;
end;

procedure TCADViewport.SetShowGrid(const B: Boolean);
begin
  if fShowGrid <> B then
   begin
     StopRepaint;
     fShowGrid := B;
     Repaint;
   end;
end;

procedure TCADViewport.SetShowCentralCross(const B: Boolean);
begin
  if fShowCentralCross <> B then
   begin
     StopRepaint;
     fShowCentralCross := B;
     Repaint;
   end;
end;

procedure TCADViewport.SetGridColor(const Cl: TColor);
begin
  if FGridColor <> Cl then
   begin
     StopRepaint;
     FGridColor := Cl;
     Repaint;
   end;
end;

procedure TCADViewport.SetCentralCrossColor(const Cl: TColor);
begin
     StopRepaint;
     FCentralCrossColor := Cl;
     Repaint;
end;

procedure TCADViewport.SetCADCmp(Cad: TCADCmp);
begin
  if Cad <> fCADCmp then
   begin
     StopRepaint;
     if Assigned(Cad) and not (csDesigning in ComponentState) then
      begin
        if Assigned(FCADCmp) then
         FCADCmp.DelViewports(Self);
        Cad.AddViewports(Self);
      end;
     fCADCmp := Cad;
   end;
end;

procedure TCADViewport.ClearCanvas(Sender: TObject; Cnv: TCanvas; const ARect: TRect2D; const BackCol: TColor);
begin
  with Cnv do
   begin
     Brush.Color := BackCol;
     Brush.Style := bsSolid;
     with TransformRect2D(ARect, fViewportToScreen) do
      FillRect(Rect(Round(Left), Round(Top), Round(Right) + 1, Round(Bottom) + 1));
   end;
end;

procedure TCADViewport.DoCopyCanvas(const GenEvent: Boolean);
begin
  CopyBackBufferRectOnCanvas(Rect(0, 0, Width, Height), GenEvent);
end;

procedure TCADViewport.DoCopyCanvasThreadSafe;
begin
  CopyBackBufferRectOnCanvas(Rect(0, 0, Width, Height), False);
end;

procedure TCADViewport.CopyBackBufferRectOnCanvas(const Rect: TRect; const GenEvent: Boolean);
begin
  if HandleAllocated then
   begin
     fOffScreenCanvas.Canvas.Lock;
     try
       CopyBitmapOnCanvas(Canvas, fOffScreenBitmap, Rect, fTransparent, fBackGroundColor);
     finally
       fOffScreenCanvas.Canvas.UnLock;
     end;
   end;
  if Assigned(fOnPaint) and GenEvent and (not fDisablePaintEvent) then
   try
     fDisablePaintEvent := True;
     fOnPaint(Self);
   finally
    fDisablePaintEvent := False;
   end;
end;

constructor TCADViewport.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  fViewGuard := TCADSysCriticalSection.Create;
  ControlStyle := ControlStyle - [csOpaque];
  ControlStyle := ControlStyle + [csClickEvents, csSetCaption, csDoubleClicks];
  fPaintingThread := nil;
  CopingFrequency := 0;
  fDrawMode := DRAWMODE_NORMAL;
  Height := 50;
  Width := 50;
  FOnClear := nil;
  FBackGroundColor := clSilver;
  FGridColor := clGray;
  fShowGrid := False;
  fTransparent := False;
  fInUpdate := False;
  fGridDeltaX := 0.0;
  fGridDeltaY := 0.0;
  fGridSubX := 0.0;
  fGridSubY := 0.0;
  fViewportObjects := nil;
  fDisableMouseEvents := False;
  FCADCmp := nil;
  FShowControlPoints := False;
  FControlPointsWidth := 6;
  FVisualWindow := Rect2D(0.0, 0.0, 100.0, 100.0);
  FScreenToViewport := IdentityTransf2D;
  FViewportToScreen := IdentityTransf2D;
  fRubberPen := TPen.Create;
  fUseThread := False;
  with fRubberPen do
   begin
     Mode := pmXOr;
     Style := psSolid;
     Width := 2;
   end;
  SetRubberColor(clRed);
  FAspectRatio := 0.0;
  fGridOnTop := False;
  fOffScreenBitmap := TBitmap.Create;
  fOffScreenBitmap.Height := Height;
  fOffScreenBitmap.Width := Width;
  fOffScreenBitmap.PixelFormat := pf24bit;
  fOffScreenCanvas := CreateOffScreenCanvas(fOffScreenBitmap.Canvas);
  fOnScreenCanvas := TDecorativeCanvas.Create(Canvas);
  fCentrum := T2DPoint.Create;
  fCentrum.x := 0;
  fCentrum.y := 0;
  fcentrum.OnChange := CentrumChange;
end;

destructor TCADViewport.Destroy;
begin
  StopPaintingThread;
  fRubberPen.Free;
  if Assigned(fCADCmp) then
   fCADCmp.DelViewports(Self);
  fViewGuard.Free;
  fOffScreenCanvas.Free;
  fOnScreenCanvas.Free;
  fOffScreenCanvas := nil;
  fOnScreenCanvas := nil;
  fOffScreenBitmap.Free;
  fOffScreenBitmap := nil;
  fCentrum.Free;
  inherited Destroy;
end;

procedure TCADViewport.BeginUpdate;
begin
  StopRepaint;
  fInUpdate := True;
end;

procedure TCADViewport.EndUpdate;
begin
  fInUpdate := False;
  RePaint;
end;

procedure TCADViewport.SetRubberColor(const Cl: TColor);
begin
  if Cl <> fRubberPenColor then
   begin
     StopRepaint;
     fRubberPenColor := Cl;
     fRubberPen.Color := Cl xor fBackgroundColor;
   end;
end;

procedure TCADViewport.Paint;
begin
  if fPaintingThread = nil then
   DoCopyCanvas(True);
end;

procedure TCADViewport.RefreshRect(const ARect: TRect);
var
  TmpRect: TRect;
begin
  if fPaintingThread <> nil then
   Exit;
  TmpRect := Rect(ARect.Left - 1, ARect.Top - 1, ARect.Right + 1, ARect.Bottom + 1);
  CopyBackBufferRectOnCanvas(TmpRect, True);
end;

procedure TCADViewport.DoResize;
begin
  StopRepaint;
  fOffScreenBitmap.Height := Height;
  fOffScreenBitmap.Width := Width;
  ChangeViewportTransform(fVisualWindow);
  if Assigned(fOnResize) then
   FOnResize(Self);
end;

procedure TCADViewport.StopPaintingThread;
begin
  if Assigned(fPaintingThread) then
   try
     TPaintingThread(fPaintingThread).Terminate;
     if Assigned(fPaintingThread) then
      TPaintingThread(fPaintingThread).WaitFor;
     fPaintingThread := nil;
     if Assigned(fOnPaint) and (not fDisablePaintEvent) then
      try
        fDisablePaintEvent := True;
        fOnPaint(Self);
      finally
       fDisablePaintEvent := False;
      end;
   finally
     fPaintingThread := nil;
   end;
end;

procedure TCADViewport.OnThreadEnded(Sender: TObject);
begin
  fPaintingThread := nil;
  if Assigned(fOnPaint) and (not fDisablePaintEvent) then
   try
     fDisablePaintEvent := True;
     fOnPaint(Self);
   finally
    fDisablePaintEvent := False;
   end;
  if Assigned(fOnEndRedraw) then
   fOnEndRedraw(Self);
end;

procedure TCADViewport.UpdateViewport(const ARect: TRect2D);
var
  Tmp: TGraphicObject;
  TmpIter: TGraphicObjIterator;
  TmpCanvas: TCanvas;
  TmpClipRect: TRect2D;
  Cont: Integer;
begin
  if fInUpdate then
   Exit;
  StopRepaint;
  if Assigned(fOnClear) then
   fOnClear(Self, fOffScreenCanvas.Canvas, ARect, fBackGroundColor)
  else
   ClearCanvas(Self, fOffScreenCanvas.Canvas, ARect, fBackGroundColor);
  if Assigned(FOnBeginRedraw) then
   fOnBeginRedraw(Self);
  if fUseThread then
   begin
     fPaintingThread := TPaintingThread.Create(Self, ARect);
     TPaintingThread(fPaintingThread).OnTerminate := OnThreadEnded;
     TPaintingThread(fPaintingThread).Resume;
   end
  else
   try
    try
      TmpCanvas := fOffScreenCanvas.Canvas;
      TmpClipRect := RectToRect2D(ClientRect);
      TmpCanvas.Lock;
      try
        if fShowGrid and not fGridOnTop then
         DrawGrid(ARect, TmpCanvas);
        if fShowCentralCross and not fGridOnTop then
         DrawCentralCross(ARect, TmpCanvas);
        if fDrawMode = DRAWMODE_NODRAW then
         Exit;
        if (fViewportObjects <> nil) then
         TmpIter := fViewportObjects.GetIterator
        else if not Assigned(fCADCmp) or fCADCmp.IsBlocked then
         Exit
        else
         TmpIter := FCADCmp.GetListOfObjects;
        Tmp := TmpIter.First;
        try
          Cont := 0;
          if fCopingFrequency > 0 then
           while Tmp <> nil do
            begin
              DrawObject(Tmp, fOffScreenCanvas, TmpClipRect);
              Inc(Cont);
              if Cont = fCopingFrequency then
               begin
                 DoCopyCanvas(False);
                 Cont := 0;
               end;
              Tmp := TmpIter.Next;
            end
          else
           while Tmp <> nil do
            begin
              DrawObject(Tmp, fOffScreenCanvas, TmpClipRect);
              Tmp := TmpIter.Next;
            end;
        finally
          TmpIter.Free;
        end;
        if fShowGrid and fGridOnTop then
         DrawGrid(ARect, TmpCanvas);
        if fShowCentralCross and fGridOnTop then
         DrawCentralCross(ARect, TmpCanvas);
      finally
        TmpCanvas.UnLock;
      end;
    except
    end;
   finally
     DoCopyCanvas(True);
     if Assigned(fOnEndRedraw) then
      fOnEndRedraw(Self);
   end;
end;

procedure TCADViewport.RepaintRect(const ARect: TRect2D);
begin
  UpdateViewport(ARect);
end;

procedure TCADViewport.DrawGrid(const ARect: TRect2D; const Cnv: TCanvas);
var
  CurrX, CurrY: TRealType;
  Pnt1, Pnt2: TPoint2D;
procedure DrawGridLines(const DecCnv: TDecorativeCanvas; const DX, DY: TRealType);
begin
  CurrX := Round(ARect.Left / DX) * DX;
  CurrY := Round(ARect.Bottom / DY) * DY;
  Pnt1 := ViewportToScreen(Point2D(CurrX, CurrY));
  Pnt2 := ViewportToScreen(Point2D(CurrX + DX, CurrY + DY));
  if (Pnt2.X - Pnt1.X > 10.0) and (Pnt1.Y - Pnt2.Y > 10.0) then
   begin
     while (CurrY <= ARect.Top) do
      begin
        Pnt1 := ViewportToScreen(Point2D(ARect.Left, CurrY));
        Pnt2 := ViewportToScreen(Point2D(ARect.Right, CurrY));
        DecCnv.MoveTo(Round(Pnt1.X), Round(Pnt1.Y));
        DecCnv.LineTo(Round(Pnt2.X), Round(Pnt2.Y));
        CurrY := CurrY + DY;
      end;
     while (CurrX <= ARect.Right) do
      begin
        Pnt1 := ViewportToScreen(Point2D(CurrX, ARect.Top));
        Pnt2 := ViewportToScreen(Point2D(CurrX, ARect.Bottom));
        DecCnv.MoveTo(Round(Pnt1.X), Round(Pnt1.Y));
        DecCnv.LineTo(Round(Pnt2.X), Round(Pnt2.Y));
        CurrX := CurrX + DX;
      end;
   end;
end;
var
  TmpCnv: TDecorativeCanvas;
begin
  if (fGridDeltaX <= 0.0) or (fGridDeltaY <= 0.0) then
   Exit;
  TmpCnv := TDecorativeCanvas.Create(Cnv);
  with Cnv do
   try
     SetBkMode(Handle, TRANSPARENT);
     Pen.Color := fGridColor;
     Pen.Width := 1;
     Pen.Mode := pmCopy;
     Pen.Style := psSolid;
     Brush.Color := fBackGroundColor;
     Brush.Style := bsSolid;
     // Draw the grid subdivisions if any.
     if( (fGridSubX > 0) and (fGridSubY > 0) ) then
      begin
        TmpCnv.DecorativePen.SetPenStyle('10');
        DrawGridLines(TmpCnv, fGridDeltaX / fGridSubX, fGridDeltaY / fGridSubY);
        TmpCnv.DecorativePen.SetPenStyle('');
      end;
     // Draw the grid main divisions.
     Pen.Style := psSolid;
     DrawGridLines(TmpCnv, fGridDeltaX, fGridDeltaY);
     // Draw the main axes.
     Pen.Width := 2;
     Pnt1 := ViewportToScreen(Point2D(ARect.Left, 0.0));
     Pnt2 := ViewportToScreen(Point2D(ARect.Right, 0.0));
     MoveTo(Round(Pnt1.X), Round(Pnt1.Y));
     LineTo(Round(Pnt2.X), Round(Pnt2.Y));
     Pnt1 := ViewportToScreen(Point2D(0.0, ARect.Bottom));
     Pnt2 := ViewportToScreen(Point2D(0.0, ARect.Top));
     MoveTo(Round(Pnt1.X), Round(Pnt1.Y));
     LineTo(Round(Pnt2.X), Round(Pnt2.Y));
   finally
     TmpCnv.Free;
   end;
end;

function  TCADViewport.GetCentrum:T2DPoint;
begin
  fCentrum.x := (fVisualWindow.Right - fVisualWindow.Left)/2;
  fCentrum.y := (fVisualWindow.Top - fVisualWindow.Bottom)/2;
  Result := fCentrum;
end;

procedure TCADViewport.SetCentrum(Value:T2DPoint);
var R : TRect2d;
begin
    FCentrum := Value;
    R := VisualRect;
    MoveWindow(Value.x-(R.right-R.Left)/2,Value.y-(R.Top-R.Bottom)/2);
    R := VisualRect;
end;

procedure TCADViewport.CentrumChange(Sender: TObject);
begin
  Centrum := Centrum;
  Refresh;
end;

procedure TCADViewport.DrawCentralCross(const ARect: TRect2D; const Cnv: TCanvas);
Var t: TRect;
begin
   with Cnv do begin
     t := Cliprect;
     SetBkMode(Handle, TRANSPARENT);
     if fShowCentralCross then
        Pen.Color := fCentralCrossColor
     else
        Pen.Color := fBackGroundColor;
     Pen.Width := 1;
     Pen.Mode := pmCopy;
     Pen.Style := psSolid;
     Brush.Color := fBackGroundColor;
     Brush.Style := bsSolid;
     MoveTo(0,t.Bottom div 2); LineTo(t.Right,t.Bottom div 2);
     MoveTo(t.Right div 2,0); LineTo(t.Right div 2,t.Bottom);
   end;
end;

function TCADViewport.GetInRepaint: Boolean;
begin
  Result := Assigned(fPaintingThread);
end;

procedure TCADViewport.Repaint;
begin
  if (csReadingState in ControlState) then
   Exit;
  if fTransparent then
   Parent.Repaint;
  RepaintRect(FVisualWindow);
end;

procedure TCADViewport.WaitForRepaintEnd;
begin
  if Assigned(fPaintingThread) then
   try
     // Devo aspettare.
     TPaintingThread(fPaintingThread).WaitFor;
   finally
     fPaintingThread := nil;
   end;
end;

procedure TCADViewport.StopRepaint;
begin
  StopPaintingThread;
end;

procedure TCADViewport.ReFresh;
begin
  Invalidate;
end;

procedure TCADViewport.Invalidate;
begin
  if (csReadingState in ControlState) or
     (csLoading in ComponentState) then
   begin
     inherited;
     Exit;
   end;
  if( csDesigning in ComponentState ) then
   inherited;
  if HandleAllocated then
   Paint;
end;

procedure TCADViewport.Notification(AComponent: TComponent; Operation: TOperation);
begin
  if (AComponent = CADCmp) and (Operation = opRemove) then
   begin
     StopPaintingThread;
     CADCmp := nil;
   end;
  inherited Notification(AComponent, Operation);
end;

procedure TCADViewport.ChangeViewportTransform(ViewWin: TRect2D);
var
  OldView: TRect2D;
begin
  StopRepaint;
  ViewWin := ReOrderRect2D(ViewWin);
  OldView := fVisualWindow;
  if (ViewWin.Bottom = ViewWin.Top) or (ViewWin.Right = ViewWin.Left) then
   Exit;
  try
    fViewGuard.Enter;
    try
      fVisualWindow := ViewWin;
      UpdateViewportTransform;
(*      fCentrum.x:=(ViewWin.Right-ViewWin.Left)/2;
      fCentrum.y:=(ViewWin.Top-ViewWin.Bottom)/2;*)
    finally
     fViewGuard.Leave;
    end;
  except
   on Exception do begin
     fVisualWindow := OldView;
     try
      UpdateViewportTransform;
     except
     end;
   end;
  end;
end;

procedure TCADViewport.UpdateViewportTransform;
var
  NewTransf: TTransf2D;
begin
  StopRepaint;
  try
    NewTransf := BuildViewportTransform(fVisualWindow, ClientRect, fAspectRatio);
    fScreenToViewport := InvertTransform2D(NewTransf);
    fViewportToScreen := NewTransf;
    if Assigned(fOnViewMappingChanged) then
     fOnViewMappingChanged(Self);
  except
  end;
  Repaint;
end;

function TCADViewport.BuildViewportTransform(var ViewWin: TRect2D;
                                             const ScreenWin: TRect;
                                             const AspectRatio: TRealType): TTransf2D;
begin
  Result := IdentityTransf2D;
end;

procedure TCADViewport.ZoomWindow(const NewWindow: TRect2D);
begin
  ChangeViewportTransform(NewWindow);
end;

function TCADViewport.GetAperture(const L: Word): TRealType;
begin
  Result := GetPixelAperture.X * L;
end;

function TCADViewport.SetLayer(const L: TLayer): Boolean;
begin
  if( L <> nil ) then
   Result := L.SetCanvas(fOffScreenCanvas)
  else
   Result := False;
end;

procedure TCADViewport.CalibrateCnv(const Cnv: TCanvas; XScale, YScale: TRealType);
var
  TmpWin: TRect2D;
  TmpAspect, LogWidth, LogHeight: TRealType;
begin
  StopRepaint;
  if (XScale = 0) or (YScale = 0) then Exit;
  TmpWin := fVisualWindow;
  // Questa è la dimensione di un pixel in mm.
  LogHeight := GetDeviceCaps(Cnv.Handle, VERTSIZE) / GetDeviceCaps(Cnv.Handle, VERTRES);
  LogWidth := GetDeviceCaps(Cnv.Handle, HORZSIZE) / GetDeviceCaps(Cnv.Handle, HORZRES);
  try
    TmpAspect := LogHeight / LogWidth;
    TmpWin.Right := fVisualWindow.Left + LogWidth * Width * XScale;
    TmpWin.Top := fVisualWindow.Bottom + LogHeight * TmpAspect * Height * YScale;
    ChangeViewportTransform(TmpWin);
  except
  end;
end;

procedure TCADViewport.Calibrate(const XScale, YScale: TRealType);
begin
  CalibrateCnv(Canvas, XScale, YScale);
end;

procedure TCADViewport.MoveWindow(const NewStartX, NewStartY: TRealType);
var
  TmpWin: TRect2D;
  Temp: TRealType;
begin
  StopRepaint;
  Temp := (FVisualWindow.Right - FVisualWindow.Left);
  TmpWin.Left := NewStartX;
  TmpWin.Right := NewStartX + Temp;
  TmpWin.W1 := 1.0;
  Temp := FVisualWindow.Top - FVisualWindow.Bottom;
  TmpWin.Bottom := NewStartY;
  TmpWin.Top := NewStartY + Temp;
  TmpWin.W2 := 1.0;
  ChangeViewportTransform(TmpWin);
end;

procedure TCADViewport.ZoomIn;
begin
  ZoomInExt(4);
end;

procedure TCADViewport.ZoomInExt(percent:extended);
var
  TmpWin: TRect2D;
  Temp: TRealType;
begin
  StopRepaint;
  Temp := (FVisualWindow.Right - FVisualWindow.Left) / percent;
  TmpWin.Left := FVisualWindow.Left + Temp;
  TmpWin.Right := FVisualWindow.Right - Temp;
  TmpWin.W1 := 1.0;
  Temp := (FVisualWindow.Top - FVisualWindow.Bottom) / percent;
  TmpWin.Bottom := FVisualWindow.Bottom + Temp;
  TmpWin.Top := FVisualWindow.Top - Temp;
  TmpWin.W2 := 1.0;
  ChangeViewportTransform(TmpWin);
end;

procedure TCADViewport.ZoomOut;
begin
  ZoomOutExt(4);
end;

procedure TCADViewport.ZoomOutExt(percent:extended);
var
  TmpWin: TRect2D;
  Temp: TRealType;
begin
  StopRepaint;
  Temp := (FVisualWindow.Right - FVisualWindow.Left) / percent;
  TmpWin.Left := FVisualWindow.Left - Temp;
  TmpWin.Right := FVisualWindow.Right + Temp;
  TmpWin.W1 := 1.0;
  Temp := (FVisualWindow.Top - FVisualWindow.Bottom) / percent;
  TmpWin.Bottom := FVisualWindow.Bottom - Temp;
  TmpWin.Top := FVisualWindow.Top + Temp;
  TmpWin.W2 := 1.0;
  ChangeViewportTransform(TmpWin);
end;

procedure TCADViewport.PanWindow(const DeltaX, DeltaY: TRealType);
var
  TmpWin: TRect2D;
begin
  StopRepaint;
  TmpWin.Left := FVisualWindow.Left + DeltaX;
  TmpWin.Right := FVisualWindow.Right + DeltaX;
  TmpWin.W1 := 1.0;
  TmpWin.Bottom := FVisualWindow.Bottom + DeltaY;
  TmpWin.Top := FVisualWindow.Top + DeltaY;
  TmpWin.W2 := 1.0;
  if Round(TmpWin.Right - TmpWin.Left) > 300 then
   TmpWin.W2 := 1.0;
  ChangeViewportTransform(TmpWin);
end;

procedure TCADViewport.CopyToClipboard(const Clp: TClipboard);
begin
  StopRepaint;
  Clp.Assign(fOffScreenBitmap);
end;

procedure TCADViewport.CopyToCanvas(const Cnv: TCanvas;
                                    const Mode: TCanvasCopyMode;
                                    const View: TCanvasCopyView;
                                    const XScale, YScale: TRealType);
var
  OldView: TRect2D;
  fOldAspect: TRealType;
begin
  if not Assigned(fCADCmp) then
   Exit;
  StopRepaint;
  OldView := VisualRect;
  BeginUpdate;
  fOldAspect := fAspectRatio;
  try
    fAspectRatio := 0;
    case View of
     cvExtension: ZoomToExtension;
     cvScale: CalibrateCnv(Cnv, XScale, YScale);
    end;
    fAspectRatio := fOldAspect;
    CopyRectToCanvas(VisualRect, ClientRect, Cnv, Mode);
  finally
    fAspectRatio := fOldAspect;
    ZoomWindow(OldView);
    EndUpdate;
  end;
end;

function TCADViewport.GetCopyRectViewportToScreen(CADRect: TRect2D;
                                                  const CanvasRect: TRect;
                                                  const Mode: TCanvasCopyMode): TTransf2D;
begin
  Result := GetViewportToScreen;
end;

function TCADViewport.ScreenToViewport(const SPt: TPoint2D): TPoint2D;
begin
  Result := TransformPoint2D(SPt, fScreenToViewport);
end;

function TCADViewport.ViewportToScreen(const WPt: TPoint2D): TPoint2D;
begin
  Result := CartesianPoint2D(TransformPoint2D(WPt, fViewportToScreen));
end;

function TCADViewport.GetViewportToScreen: TTransf2D;
begin
  Result := fViewportToScreen;
end;

function TCADViewport.GetScreenToViewport: TTransf2D;
begin
  Result := fScreenToViewport;
end;

function TCADViewport.GetPixelAperture: TPoint2D;
begin
  Result.X := Abs(fScreenToViewport[1, 1]);
  Result.Y := Abs(fScreenToViewport[2, 2]);
  Result.W := 1.0;
end;

// =====================================================================
// TRuler
// =====================================================================

procedure TRuler.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  Message.Result := 1;
end;

procedure TRuler.SetOwnerView(V: TCADViewport);
begin
  if V <> fOwnerView then
   begin
     fOwnerView := V;
     Invalidate;
   end;
end;

procedure TRuler.SetOrientation(O: TRulerOrientationType);
begin
  if fOrientation <> O then
   begin
     fOrientation := O;
     Invalidate;
   end;
end;

procedure TRuler.SetSize(S: Integer);
begin
  if S <> fSize then
   begin
     fSize := S;
     Invalidate;
   end;
end;

procedure TRuler.SetFontSize(S: Integer);
begin
  if S <> fFontSize then
   begin
     fFontSize := S;
     Invalidate;
   end;
end;

procedure TRuler.SetStepSize(S: TRealType);
begin
  if S <> fStepSize then
   begin
     fStepSize := S;
     Invalidate;
   end;
end;

procedure TRuler.SetStepDivisions(D: Integer);
begin
  if D <> fStepDivisions then
   begin
     fStepDivisions := D;
     Invalidate;
   end;
end;

procedure TRuler.SetTicksColor(C: TColor);
begin
  if C <> fTicksColor then
   begin
     fTicksColor := C;
     Invalidate;
   end;
end;

constructor TRuler.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  fOwnerView := nil;
  fSize := 20;
  fFontSize := 6;
  fStepSize := 10.0;
  fStepDivisions := 5;
  fOrientation := otVertical;
  fTicksColor := clBlack;
  Color := clWhite;
  Canvas.Font.Name := 'Verdana';
  Width := fSize;
  Height := fSize * 4;
  Precision := 0;
end;

procedure TRuler.Paint;
var
  TmpStep, TmpVal: TRealType;
  TmpPt: TPoint;
  LastPt, MinSize: Integer;
begin
  if fOwnerView = nil then
   Exit;
  with Canvas do
   begin
     Font.Size := fFontSize;
     Font.Color := fTicksColor;
     Brush.Color := Color;
     Pen.Color := fTicksColor;
     Pen.Width := 1;
     FillRect(ClientRect);
     SetBkMode(Handle, TRANSPARENT);
     case fOrientation of
      otOrizontal: begin
        TmpVal := Trunc(fOwnerView.VisualRect.Left / fStepSize) * fStepSize;
        TmpStep := fStepSize;
        MinSize := TextWidth(Format('%12.'+Inttostr(Precision)+'f', [TmpVal]));
        // Trova lo step ottimo.
        TmpPt := Point2DToPoint(fOwnerView.ViewportToScreen(Point2D(TmpVal - fStepSize, 0)));
        LastPt := TmpPt.X;
        while TmpVal <= fOwnerView.VisualRect.Right do
         begin
           TmpPt := Point2DToPoint(fOwnerView.ViewportToScreen(Point2D(TmpVal, 0)));
           if Abs(TmpPt.X - LastPt) > MinSize then
            Break;
           TmpVal := TmpVal + TmpStep;
           TmpStep := TmpStep * 2.0;
         end;
        // Disegna il righello.
        TmpVal := Trunc(fOwnerView.VisualRect.Left / TmpStep) * TmpStep;
        if TmpStep / fOwnerView.VisualRect.Right < 0.01 then
         Exit;
        while TmpVal <= fOwnerView.VisualRect.Right do
         begin
           TmpPt := Point2DToPoint(fOwnerView.ViewportToScreen(Point2D(TmpVal, 0)));
           MoveTo(TmpPt.X, ClientRect.Top);
           LineTo(TmpPt.X, ClientRect.Bottom);
           TextOut(TmpPt.X, ClientRect.Bottom + Font.Height - 4, Format('%3.'+Inttostr(Precision)+'f', [TmpVal]));
           TmpVal := TmpVal + TmpStep;
         end;
        // Subdivisions.
        if fStepDivisions > 0 then
         begin
           TmpStep := TmpStep / fStepDivisions;
           TmpVal := Trunc(fOwnerView.VisualRect.Left / TmpStep) * TmpStep;
           while TmpVal <= fOwnerView.VisualRect.Right do
            begin
              TmpPt := Point2DToPoint(fOwnerView.ViewportToScreen(Point2D(TmpVal, 0)));
              MoveTo(TmpPt.X, ClientRect.Top);
              LineTo(TmpPt.X, ClientRect.Top + fSize div 2);
              TmpVal := TmpVal + TmpStep;
            end;
         end;
      end;
      otVertical: begin
        TmpVal := Trunc(fOwnerView.VisualRect.Bottom / fStepSize) * fStepSize;
        TmpStep := fStepSize;
        MinSize := 2 * Font.Size;
        // Trova lo step ottimo.
        TmpPt := Point2DToPoint(fOwnerView.ViewportToScreen(Point2D(0, TmpVal - fStepSize)));
        LastPt := TmpPt.Y;
        while TmpVal <= fOwnerView.VisualRect.Top do
         begin
           TmpPt := Point2DToPoint(fOwnerView.ViewportToScreen(Point2D(0, TmpVal)));
           if Abs(TmpPt.Y - LastPt) > MinSize then
            Break;
           TmpVal := TmpVal + TmpStep;
           TmpStep := TmpStep * 2.0;
         end;
        // Disegna il righello.
        TmpVal := Trunc(fOwnerView.VisualRect.Bottom / TmpStep) * TmpStep;
        if TmpStep / fOwnerView.VisualRect.Right < 0.01 then
         Exit;
        while TmpVal <= fOwnerView.VisualRect.Top do
         begin
           TmpPt := Point2DToPoint(fOwnerView.ViewportToScreen(Point2D(0, TmpVal)));
           MoveTo(ClientRect.Left, TmpPt.Y);
           LineTo(ClientRect.Right, TmpPt.Y);
           TextOut(ClientRect.Left + 1, TmpPt.Y, Format('%-6.'+Inttostr(Precision)+'f', [TmpVal]));
//           fSize div 2
           TmpVal := TmpVal + TmpStep;
         end;
        // Subdivisions.
        if fStepDivisions > 0 then
         begin
           TmpStep := TmpStep / fStepDivisions;
           TmpVal := Trunc(fOwnerView.VisualRect.Bottom / TmpStep) * TmpStep;
           while TmpVal <= fOwnerView.VisualRect.Top do
            begin
              TmpPt := Point2DToPoint(fOwnerView.ViewportToScreen(Point2D(0, TmpVal)));
              MoveTo(ClientRect.Right, TmpPt.Y);
              LineTo(ClientRect.Right - fSize div 2, TmpPt.Y);
              TmpVal := TmpVal + TmpStep;
            end;
         end;
      end;
     end;
   end;
end;

procedure TRuler.SetMark(Value: TRealType);
var
  TmpPt: TPoint;
begin
  Paint;
  if fOwnerView = nil then
   Exit;
  with Canvas do
   begin
     Pen.Color := fTicksColor;
     Pen.Width := 3;
     case fOrientation of
      otOrizontal: begin
        TmpPt := Point2DToPoint(fOwnerView.ViewportToScreen(Point2D(Value, 0)));
        MoveTo(TmpPt.X, ClientRect.Top);
        LineTo(TmpPt.X, ClientRect.Bottom);
      end;
      otVertical: begin
        TmpPt := Point2DToPoint(fOwnerView.ViewportToScreen(Point2D(0, Value)));
        MoveTo(ClientRect.Left, TmpPt.Y);
        LineTo(ClientRect.Right, TmpPt.Y);
      end;
     end;
   end;
end;

// =====================================================================
// TObject2DHandler
// =====================================================================

constructor TObject2DHandler.Create(AObject: TObject2D);
begin
  inherited Create;

  fHandledObject := AObject;
  fRefCount := 1;
end;

destructor TObject2DHandler.Destroy;
begin
  if Assigned(fHandledObject) then
   fHandledObject.fHandler := nil;
  inherited;
end;

procedure TObject2DHandler.FreeInstance;
begin
  Dec(fRefCount);
  if fRefCount > 0 then
   Exit;
  inherited;
end;

// =====================================================================
// TObject2D
// =====================================================================

constructor TObject2D.Create(ID: LongInt);
begin
  inherited Create(ID);
  fBox := Rect2D(0, 0, 0, 0);
  fModelTransform := nil;
  fSavedTransform := nil;
  fDrawBoundingBox := False;
  fHandler := nil;
end;

destructor TObject2D.Destroy;
begin
  if Assigned(fHandler) then
   fHandler.Free;
  if fModelTransform <> nil then
   FreeMem(fModelTransform, SizeOf(TTransf2D));
  if fSavedTransform <> nil then
   FreeMem(fSavedTransform, SizeOf(TTransf2D));
  inherited Destroy;
end;

constructor TObject2D.CreateFromStream(const Stream: TStream; const Version: TCADVersion);
var
  TmpTransf: TTransf2D;
begin
  inherited;
  with Stream do
   begin
     Read(TmpTransf, sizeof(TTransf2D));
     SaveTransform(TmpTransf);
   end;
  fHandler := nil;
end;

procedure TObject2D.SaveToStream(const Stream: TStream);
var
  TmpTransf: TTransf2D;
begin
  inherited SaveToStream(Stream);
  with Stream do
   begin
     SaveTransform(ModelTransform);
     TmpTransf := ModelTransform;
     Write(TmpTransf, SizeOf(TTransf2D));
   end;
end;

procedure TObject2D.Assign(const Obj: TGraphicObject);
begin
  if (Obj = Self) then
   Exit;
  inherited Assign(Obj);
  if Obj is TObject2D then
   begin
     SaveTransform(TObject2D(Obj).ModelTransform);
     fBox := TObject2D(Obj).fBox;
     if fHandler <> TObject2D(Obj).fHandler then
      SetSharedHandler(TObject2D(Obj).fHandler);
   end;
end;

function TObject2D.WorldToObject(const Pt: TPoint2D): TPoint2D;
begin
  Result := TransformPoint2D(Pt, InvertTransform2D(ModelTransform));
end;

procedure TObject2D.MoveTo(ToPt, DragPt: TPoint2D);
var
  TmpTransf: TTransf2D;
begin
  ToPt := CartesianPoint2D(ToPt);
  DragPt := CartesianPoint2D(DragPt);
  TmpTransf := Translate2D(ToPt.X - DragPt.X, ToPt.Y - DragPt.Y);
  Transform(TmpTransf);
end;

function TObject2D.OnMe(Pt: TPoint2D; Aperture: TRealType; var Distance: TRealType): Integer;
var
 TmpBox: TRect2D;
begin
  TmpBox := EnlargeBoxDelta2D(Box, Aperture);
  Distance := MaxCoord;
  Result := PICK_NOOBJECT;
  if not FEnabled then
   Exit;
  if IsPointInCartesianBox2D(Pt, TmpBox) then
   begin
     Distance := Aperture;
     Result := PICK_INBBOX;
   end;
  if Assigned(fHandler) then
   Result := MaxIntValue([Result, fHandler.OnMe(Self, Pt, Aperture, Distance)]);
end;

procedure TObject2D.DrawControlPoints(const VT: TTransf2D; const Cnv: TDecorativeCanvas;
                                      const ClipRect2D: TRect2D; const Width: Integer);
begin
  // Draw the bounding box.
  if fDrawBoundingBox and (Cnv.Canvas.Pen.Mode <> pmXOr) then
   DrawBoundingBox2D(Cnv, Box, ClipRect2D, VT);
  if Assigned(fHandler) then
   fHandler.DrawControlPoints(Self, VT, Cnv, Width);
end;

procedure TObject2D.SetModelTransform(Transf: TTransf2D);
begin
  if IsSameTransform2D(Transf, IdentityTransf2D) then
   begin
     if (fModelTransform <> nil) then
      FreeMem(fModelTransform, SizeOf(TTransf2D));
     fModelTransform := nil;
   end
  else if fModelTransform = nil then
   begin
     GetMem(fModelTransform, SizeOf(TTransf2D));
     fModelTransform^ := Transf;
   end
  else
   fModelTransform^ := Transf;
  UpdateExtension(Self);
end;

procedure TObject2D.SaveTransform(const T: TTransf2D);
begin
  if IsSameTransform2D(T, IdentityTransf2D) then
   begin
     if (fSavedTransform <> nil) then
      FreeMem(fSavedTransform, SizeOf(TTransf2D));
     fSavedTransform := nil;
   end
  else if fSavedTransform = nil then
   begin
     GetMem(fSavedTransform, SizeOf(TTransf2D));
     fSavedTransform^ := T;
   end
  else
   fSavedTransform^ := T;
  if (fModelTransform <> nil) then
   FreeMem(fModelTransform, SizeOf(TTransf2D));
  fModelTransform := nil;
end;

procedure TObject2D.RemoveTransform;
begin
  if (fSavedTransform <> nil) then
   FreeMem(fSavedTransform, SizeOf(TTransf2D));
  fSavedTransform := nil;
  SetModelTransform(IdentityTransf2D);
end;

function TObject2D.GetModelTransform: TTransf2D;
begin
  if fModelTransform <> nil then
   Result := fModelTransform^
  else
   Result := IdentityTransf2D;
  if Assigned(fSavedTransform) then
   Result := MultiplyTransform2D(fSavedTransform^, Result);
end;

function TObject2D.HasTransform: Boolean;
begin
  Result := (fModelTransform <> nil) or (fSavedTransform <> nil);
end;

procedure TObject2D.Transform(const T: TTransf2D);
begin
  if fModelTransform <> nil then
   SetModelTransform(MultiplyTransform2D(fModelTransform^, T))
  else
   SetModelTransform(T);
end;

procedure TObject2D.ApplyTransform;
begin
  SaveTransform(ModelTransform);
end;

function TObject2D.IsVisible(const Clip: TRect2D; const DrawMode: Integer): Boolean;
begin
  Result := False;
  if not Visible then
   Exit;
  if fBox.Left > Clip.Right then
   Exit
  else if fBox.Right < Clip.Left then
   Exit;
  if fBox.Bottom > Clip.Top then
   Exit
  else if fBox.Top < Clip.Bottom then
   Exit;
  Result := True;
end;

procedure TObject2D.SetSharedHandler(const Hndl: TObject2DHandler);
begin
  if Assigned(fHandler) then
   fHandler.Free;
  fHandler := Hndl;
  if( Hndl <> nil ) then
   Inc(fHandler.fRefCount);
end;

procedure TObject2D.SetHandler(const Hndl: TObject2DHandlerClass);
begin
  if Assigned(fHandler) then
   fHandler.Free;
  if( Hndl <> nil ) then
   fHandler := Hndl.Create(Self)
  else
   fHandler := nil;
end;

// =====================================================================
// TContainer2D
// =====================================================================

function StringToBlockName(const Str: String): TSourceBlockName;
var
  Cont: Integer;
begin
  for Cont := 0 to 12 do
   begin
     if Cont < Length(Str) then
      Result[Cont] := Str[Cont + 1]
     else
      Result[Cont] := #0;
   end;
end;

constructor TContainer2D.Create(ID: LongInt; const Objs: array of TObject2D);
var
  Cont: Word;
begin
  inherited Create(ID);

  fObjects := TGraphicObjList.Create;
  fObjects.FreeOnClear := True;
  for Cont := Low(Objs) to High(Objs) do
   if Objs[Cont] <> nil then fObjects.Add(Objs[Cont]);
  UpdateExtension(Self);
end;

procedure TContainer2D._UpdateExtension;
var
  TmpIter: TGraphicObjIterator;
begin
  // Crea un iterator temporaneo.
  TmpIter := fObjects.GetIterator;
  try
    if TmpIter.Count = 0 then
     begin
       fBox := Rect2D(0, 0, 0, 0);
       Exit;
     end;
    fBox := TObject2D(TmpIter.First).Box;
    while TmpIter.Next <> nil do
     fBox := BoxOutBox2D(fBox, TObject2D(TmpIter.Current).Box);
    if HasTransform then
     fBox := TransformBoundingBox2D(fBox, ModelTransform);
  finally // Libera l'iterator
    TmpIter.Free;
  end;
end;

destructor TContainer2D.Destroy;
begin
  fObjects.Free;
  inherited Destroy;
end;

procedure TContainer2D.SaveToStream(const Stream: TStream);
var
  TmpObj: TObject2D;
  TmpLong: LongInt;
  TmpWord: Word;
  TmpIter: TGraphicObjIterator;
begin
  inherited SaveToStream(Stream);
  // Crea un iterator temporaneo.
  TmpIter := fObjects.GetIterator;
  with Stream do
   try
     { Write the number of objects in the container. }
     TmpLong := FObjects.Count;
     Write(TmpLong, SizeOf(TmpLong));
     { Now write the objects in the container. }
     TmpObj := TObject2D(TmpIter.First);
     while TmpObj <> nil do
      begin
        TmpWord := CADSysFindClassIndex(TmpObj.ClassName);
        { Save the class index. }
        Write(TmpWord, SizeOf(TmpWord));
        { Save the object. }
        TmpObj.SaveToStream(Stream);
        TmpObj := TObject2D(TmpIter.Next);
     end;
   finally // Libera l'iterator
     TmpIter.Free;
   end;
end;

constructor TContainer2D.CreateFromStream(const Stream: TStream; const Version: TCADVersion);
var
  TmpClass: TGraphicObjectClass;
  TmpObj: TGraphicObject;
  TmpLong: LongInt;
  TmpWord: Word;
begin
  inherited;
  with Stream do
   begin
     { Read the number of objects in the container. }
     Read(TmpLong, SizeOf(TmpLong));
     fObjects := TGraphicObjList.Create;
     fObjects.FreeOnClear := True;
     { Now read the objects for the container. }
     while TmpLong > 0 do
      begin
        { Read the type of object. }
        Read(TmpWord, SizeOf(TmpWord));
        { Retrive the class type from the registered classes. }
        TmpClass := CADSysFindClassByIndex(TmpWord);
        TmpObj := TmpClass.CreateFromStream(Stream, Version);
        TmpObj.UpdateExtension(Self);
        fObjects.Add(TmpObj);
        Dec(TmpLong);
     end;
   end;
  UpdateExtension(Self);
end;

procedure TContainer2D.Assign(const Obj: TGraphicObject);
var
  TmpIter: TGraphicObjIterator;
  TmpClass: TGraphicObjectClass;
  TmpObj: TGraphicObject;
begin
  if (Obj = Self) then
   Exit;
  inherited;
  if Obj is TContainer2D then
   begin
     if fObjects = nil then
      begin
        fObjects := TGraphicObjList.Create;
        fObjects.FreeOnClear := True;
      end
     else
      fObjects.Clear;
     // Copia creando gli oggetti contenuti.
     if TContainer2D(Obj).fObjects.HasExclusiveIterators then
      Raise ECADListBlocked.Create('TContainer2D.Assign: The list has an exclusive iterator.');
     // Alloca un iterator locale
     TmpIter := TContainer2D(Obj).fObjects.GetIterator;
     try
      repeat
        TmpClass := TGraphicObjectClass(TmpIter.Current.ClassType);
        TmpObj := TmpClass.Create(TmpIter.Current.ID);
        TmpObj.Assign(TmpIter.Current);
        fObjects.Add(TmpObj);
      until TmpIter.Next = nil;
     finally
      TmpIter.Free;
     end;
   end;
end;

procedure TContainer2D.UpdateSourceReferences(const BlockList: TGraphicObjIterator);
var
  TmpObj: TObject2D;
  TmpIter: TGraphicObjIterator;
begin
  // Crea un iterator temporaneo.
  TmpIter := fObjects.GetIterator;
  try
    TmpObj := TObject2D(TmpIter.First);
    while TmpObj <> nil do
     begin
       if(TmpObj is TSourceBlock2D) then
        TSourceBlock2D(TmpObj).UpdateSourceReferences(BlockList)
       else if(TmpObj is TBlock2D) then
        TBlock2D(TmpObj).UpdateReference(BlockList);
       TmpObj := TObject2D(TmpIter.Next);
     end;
  finally // Libera l'iterator
    TmpIter.Free;
  end;
  UpdateExtension(Self);
end;

procedure TContainer2D.Draw(const VT: TTransf2D; const Cnv: TDecorativeCanvas;
                            const ClipRect2D: TRect2D; const DrawMode: Integer);
var
  TmpObj: TObject2D;
  TmpTransf: TTransf2D;
  TmpIter: TGraphicObjIterator;
  TmpPen: TPen;
  TmpBrush: TBrush;
begin
  // Crea un iterator temporaneo.
  TmpIter := fObjects.GetIterator;
  TmpPen := TPen.Create;
  TmpBrush := TBrush.Create;
  try
    { Transform the container. }
    TmpTransf := MultiplyTransform2D(ModelTransform, VT);
    TmpObj := TObject2D(TmpIter.First);
    TmpPen.Assign(Cnv.Canvas.Pen);
    TmpBrush.Assign(Cnv.Canvas.Brush);
    while TmpObj <> nil do
     begin
       Cnv.Canvas.Pen.Assign(TmpPen);
       Cnv.Canvas.Brush.Assign(TmpBrush);
       { Transform the object in the container. }
       TmpObj.Draw(TmpTransf, Cnv, ClipRect2D, DrawMode);
       TmpObj := TObject2D(TmpIter.Next);
     end;
  finally
    TmpPen.Free;
    TmpBrush.Free;
    TmpIter.Free;
  end;
end;

function TContainer2D.OnMe(Pt: TPoint2D; Aperture: TRealType;
                           var Distance: TRealType): Integer;
var
  TmpObj: TObject2D;
  MinDist: TRealType;
  TmpIter: TGraphicObjIterator;
begin
  Result := inherited OnMe(Pt, Aperture, Distance);
  if Result = PICK_INBBOX then
   begin
     // Crea un iterator temporaneo.
     TmpIter := fObjects.GetIterator;
     try
       { Make Pt in container coordinate. }
       if HasTransform then
        Pt := TransformPoint2D(Pt, InvertTransform2D(ModelTransform));
       { Check all the objects in the container. }
       TmpObj := TObject2D(TmpIter.First);
       MinDist := 2.0 * Aperture;
       while TmpObj <> nil do
        begin
          if (TmpObj.OnMe(Pt, Aperture, Distance) >= PICK_INOBJECT) and
             (Distance < MinDist) then
           begin
             MinDist := Distance;
             Result := TmpObj.ID;
           end;
          TmpObj := TObject2D(TmpIter.Next);
        end;
       Distance := MinDist;
     finally
       TmpIter.Free;
     end;
   end;
end;

procedure TContainer2D.DrawControlPoints(const VT: TTransf2D; const Cnv: TDecorativeCanvas;
                                         const ClipRect2D: TRect2D; const Width: Integer);
begin
  if fObjects.Count > 0 then
   inherited;
end;

// =====================================================================
// TSourceBlock2D
// =====================================================================

constructor TSourceBlock2D.Create(ID: LongInt; const Name: TSourceBlockName; const Objs: array of TObject2D);
begin
  inherited Create(ID, Objs);

  fName := Name;
  fLibraryBlock := False;
  fNReference := 0;
end;

destructor TSourceBlock2D.Destroy;
begin
  if fNReference > 0 then
//   Raise ECADSourceBlockIsReferenced.Create('TSourceBlock2D.Destroy: This source block is referenced and cannot be deleted');
  inherited Destroy;
end;

constructor TSourceBlock2D.CreateFromStream(const Stream: TStream; const Version: TCADVersion);
begin
  inherited;
  Stream.Read(fToBeSaved, SizeOf(fToBeSaved));
  Stream.Read(fLibraryBlock, SizeOf(fLibraryBlock));
  Stream.Read(fName, SizeOf(fName));
  fNReference := 0;
end;

procedure TSourceBlock2D.SaveToStream(const Stream: TStream);
begin
  inherited SaveToStream(Stream);
  Stream.Write(fToBeSaved, SizeOf(fToBeSaved));
  Stream.Write(fLibraryBlock, SizeOf(fLibraryBlock));
  Stream.Write(FName, SizeOf(FName));
end;

procedure TSourceBlock2D.Assign(const Obj: TGraphicObject);
begin
  if (Obj = Self) then
   Exit;
  inherited;
  if Obj is TSourceBlock2D then
   fToBeSaved := TSourceBlock2D(Obj).fToBeSaved;
end;

// =====================================================================
// TBlock2D
// =====================================================================

procedure TBlock2D.SetSourceBlock(const Source: TSourceBlock2D);
begin
  if not Assigned(Source) then
   Raise Exception.Create('TBlock2D.SetSourceBlock: Invalid parameter');
  if (fSourceBlock <> Source) then
   begin
     if Assigned(fSourceBlock) and (fSourceBlock.FNReference > 0) then
      Dec(fSourceBlock.FNReference);
     fSourceBlock := Source;
     fSourceName := Source.Name;
     Inc(fSourceBlock.FNReference);
     UpdateExtension(Self);
   end;
end;

procedure TBlock2D.SetOriginPoint(Pt: TPoint2D);
begin
  fOriginPoint := Pt;
  UpdateExtension(Self);
end;

constructor TBlock2D.Create(ID: LongInt; const Source: TSourceBlock2D);
begin
  inherited Create(ID);

  if not Assigned(Source) then
   Raise Exception.Create('TBlock2D.Create: Invalid parameter');
  fOriginPoint := Point2D(0, 0);
  fSourceName := '';
  fSourceBlock := Source;
  fSourceName := Source.Name;
  fBox := Source.Box;
  Inc(fSourceBlock.fNReference);
  UpdateExtension(Self);
end;

destructor TBlock2D.Destroy;
begin
  if Assigned(fSourceBlock) and (fSourceBlock.fNReference > 0) then
   Dec(fSourceBlock.fNReference);
  inherited Destroy;
end;

constructor TBlock2D.CreateFromStream(const Stream: TStream; const Version: TCADVersion);
begin
  { Load the standard properties }
  inherited;
  with Stream do
   begin
     { TCADCmp will use the value of FSourceName to find out the reference of the source block. }
     Read(fSourceName, SizeOf(fSourceName));
     Read(fOriginPoint, SizeOf(fOriginPoint));
   end;
  fSourceBlock := nil;
end;

procedure TBlock2D.SaveToStream(const Stream: TStream);
begin
  { Save the standard properties }
  inherited SaveToStream(Stream);
  with Stream do
   begin
     { Save the ID of the source block. }
     Write(fSourceName, SizeOf(fSourceName));
     Write(fOriginPoint, SizeOf(fOriginPoint));
   end;
end;

procedure TBlock2D.Assign(const Obj: TGraphicObject);
begin
  if (Obj = Self) then
   Exit;
  inherited;
  if Obj is TBlock2D then
   begin
     if Assigned(fSourceBlock) and (fSourceBlock.FNReference > 0) then
      Dec(fSourceBlock.FNReference);
     fSourceBlock := TBlock2D(Obj).fSourceBlock;
     fSourceName := fSourceBlock.Name;
     fOriginPoint := TBlock2D(Obj).OriginPoint;
     Inc(fSourceBlock.FNReference);
     UpdateExtension(Self);
   end;
end;

procedure TBlock2D.UpdateReference(const BlockList: TGraphicObjIterator);
var
  TmpSource: TSourceBlock2D;
begin
  TmpSource := BlockList.First as TSourceBlock2D;
  while TmpSource <> nil do
   begin
     if TmpSource.Name = fSourceName then
      begin
        fSourceBlock := TmpSource;
        UpdateExtension(Self);
        Exit;
      end;
     TmpSource := BlockList.Next as TSourceBlock2D;
   end;
  Raise ECADListObjNotFound.Create('TBlock2D.UpdateReference: Source block not found');
end;

procedure TBlock2D._UpdateExtension;
begin
  if not Assigned(fSourceBlock) then Exit;
  fSourceBlock.UpdateExtension(Self);
  if HasTransform then
   fBox := TransformBoundingBox2D(fSourceBlock.Box, ModelTransform)
  else
   fBox := fSourceBlock.Box;
end;

procedure TBlock2D.DrawControlPoints(const VT: TTransf2D; const Cnv: TDecorativeCanvas;
                                     const ClipRect2D: TRect2D; const Width: Integer);
var
  TmpPt1: TPoint2D;
begin
  inherited;
  if HasTransform then
   TmpPt1 := TransformPoint2D(TransformPoint2D(FOriginPoint, ModelTransform), VT)
  else
   TmpPt1 := TransformPoint2D(FOriginPoint, VT);
  with Point2DToPoint(TmpPt1) do
   DrawPlaceHolder(Cnv, X, Y, Width);
end;

procedure TBlock2D.Draw(const VT: TTransf2D; const Cnv: TDecorativeCanvas;
                        const ClipRect2D: TRect2D; const DrawMode: Integer);
begin
  if not Assigned(FSourceBlock) then Exit;
  if HasTransform then
   FSourceBlock.Draw(MultiplyTransform2D(ModelTransform, VT), Cnv, ClipRect2D, DrawMode)
  else
   FSourceBlock.Draw(VT, Cnv, ClipRect2D, DrawMode);
end;

function TBlock2D.OnMe(Pt: TPoint2D; Aperture: TRealType; var Distance: TRealType): Integer;
var
  TmpPt: TPoint2D;
begin
  Result := PICK_NOOBJECT;
  if not Assigned(FSourceBlock) then
   Exit;
  Result := inherited OnMe(Pt, Aperture, Distance);
  if (Result = PICK_INBBOX) and NearPoint2D(Pt, TransformPoint2D(FOriginPoint, ModelTransform), Aperture, Distance) then
   { the origin of the block was picked. }
   Result := PICK_ONOBJECT
  else
   begin
     { Make Pt in Object coordinates }
     if HasTransform then
      TmpPt := TransformPoint2D(Pt, InvertTransform2D(ModelTransform))
     else
      TmpPt := Pt;
     Result := FSourceBlock.OnMe(TmpPt, Aperture, Distance);
   end;
end;

// =====================================================================
// TCADCmp2D
// =====================================================================

procedure TCADCmp2D.SaveObjectsToStream(const Stream: TStream);
var
  TmpObj: TObject2D;
  TmpWord: Word;
  TmpLong, TmpObjPerc: LongInt;
  TmpIter: TGraphicObjIterator;
begin
  TmpIter := ObjectList.GetPrivilegedIterator;
  with Stream do
   try
     { Save the objects. }
     TmpLong := TmpIter.Count;
     if TmpLong > 0 then
      TmpObjPerc := 100 div TmpLong
     else
      TmpObjPerc := 0;
     Write(TmpLong, SizeOf(TmpLong));
     TmpObj := TmpIter.First as TObject2D;
     while TmpObj <> nil do
      begin
        if Layers[TmpObj.Layer].Streamable and TmpObj.fToBeSaved then
         begin
           TmpWord := CADSysFindClassIndex(TmpObj.ClassName);
           { Save the class index. }
           Write(TmpWord, SizeOf(TmpWord));
           TmpObj.SaveToStream(Stream);
           if Assigned(OnSaveProgress) then
            OnSaveProgress(Self, 100 - TmpObjPerc * TmpLong);
           Dec(TmpLong);
         end;
        TmpObj := TmpIter.Next as TObject2D;
      end;
     { End the list of objects if not all objects were saved. }
     if TmpLong > 0 then
      begin
        TmpWord := 65535;
        Write(TmpWord, SizeOf(TmpWord));
      end;
   finally
     TmpIter.Free;
   end;
end;

{$WARNINGS OFF}
procedure TCADCmp2D.LoadObjectsFromStream(const Stream: TStream; const Version: TCADVersion);
var
  TmpClass: TGraphicObjectClass;
  TmpObj: TGraphicObject;
  TmpLong, TmpObjPerc: LongInt;
  TmpWord: Word;
  TmpBlocksIter: TExclusiveGraphicObjIterator;
begin
  TmpBlocksIter := SourceBlocksExclusiveIterator;
  with Stream do
   try
     Read(TmpLong, SizeOf(TmpLong));
     if TmpLong > 0 then
      TmpObjPerc := 100 div TmpLong
     else
      TmpObjPerc := 0;
     while TmpLong > 0 do
      begin
        { Read the type of object and the length of the record. }
        Read(TmpWord, SizeOf(TmpWord));
        if TmpWord = 65535 then
         { End prematurely. }
         Break;
        Dec(TmpLong);
        { Retrive the class type from the registered classes. }
        try
         TmpClass := CADSysFindClassByIndex(TmpWord);
        except
         on ECADObjClassNotFound do
          begin
            ShowMessage('Object class not found. Object not load');
            Break;
          end;
        end;
        TmpObj := TmpClass.CreateFromStream(Stream, Version);
        if Assigned(OnLoadProgress) then
         OnLoadProgress(Self, TmpObjPerc);
        if not (TmpObj is TObject2D) then
         begin
           ShowMessage('Not 2D Object. Object discarded.');
           TmpObj.Free;
           Continue;
         end;
        if TmpObj is TContainer2D then
         try
           TContainer2D(TmpObj).UpdateSourceReferences(TmpBlocksIter);
         except
          on ECADListObjNotFound do
           begin
             ShowMessage('Source block not found. The block will not be loaded');
             TmpObj.Free;
             Continue;
           end;
         end
        else if TmpObj is TBlock2D then
         try
           TBlock2D(TmpObj).UpdateReference(TmpBlocksIter);
         except
          on ECADListObjNotFound do
           begin
             ShowMessage('Source block not found. The block will not be loaded');
             TmpObj.Free;
             Continue;
           end;
         end;
        CurrentLayer := TmpObj.Layer;
        inherited AddObject(-1, TGraphicObject(TmpObj));
      end;
   finally
     TmpBlocksIter.Free;
   end;
end;
{$WARNINGS ON}

procedure TCADCmp2D.SaveBlocksToStream(const Stream: TStream; const AsLibrary: Boolean);
var
  TmpObj: TSourceBlock2D;
  TmpWord: Word;
  TmpPos, TmpLong: LongInt;
  TmpIter: TGraphicObjIterator;
begin
  TmpIter := BlockList.GetPrivilegedIterator;
  with Stream do
   try
     TmpLong := SourceBlocksCount;
     TmpPos := Stream.Position;
     Write(TmpLong, SizeOf(TmpLong));
     TmpObj := TmpIter.First as TSourceBlock2D;
     TmpLong := 0;
     while TmpObj <> nil do
      begin
        if TmpObj.ToBeSaved and
           not(TmpObj.IsLibraryBlock xor AsLibrary) then
         begin
           TmpWord := CADSysFindClassIndex(TmpObj.ClassName);
           { Save the class index. }
           Write(TmpWord, SizeOf(TmpWord));
           TmpObj.SaveToStream(Stream);
           Inc(TmpLong);
         end;
        TmpObj := TmpIter.Next as TSourceBlock2D;
      end;
     Seek(TmpPos, soFromBeginning);
     Write(TmpLong, SizeOf(TmpLong));
     Seek(0, soFromEnd);
   finally
     TmpIter.Free;
   end;
end;

{$WARNINGS OFF}
procedure TCADCmp2D.LoadBlocksFromStream(const Stream: TStream; const Version: TCADVersion);
var
  TmpClass: TGraphicObjectClass;
  TmpObj: TGraphicObject;
  TmpLong: LongInt;
  TmpWord: Word;
  TmpBlocksIter: TGraphicObjIterator;
begin
  with Stream do
   begin
     { Load the source blocks. }
     Read(TmpLong, SizeOf(TmpLong));
     while TmpLong > 0 do
      begin
        { Read the type of object and the length of the record. }
        Read(TmpWord, SizeOf(TmpWord));
        Dec(TmpLong);
        { Retrive the class type from the registered classes. }
        try
         TmpClass := CADSysFindClassByIndex(TmpWord);
        except
         on ECADObjClassNotFound do
          begin
            ShowMessage('Object class not found. Object not load');
            Continue;
          end;
        end;
        TmpObj := TmpClass.CreateFromStream(Stream, Version);
        TmpBlocksIter := SourceBlocksIterator;
        try
         TSourceBlock2D(TmpObj).UpdateSourceReferences(TmpBlocksIter);
        except
         on ECADListObjNotFound do
          begin
            ShowMessage('Source block not found. The block will not be loaded');
            TmpObj.Free;
            TmpBlocksIter.Free;
            Continue;
          end;
        end;
        TmpBlocksIter.Free;
        AddSourceBlock(TSourceBlock2D(TmpObj));
      end;
   end;
end;
{$WARNINGS ON}

function TCADCmp2D.AddSourceBlock(const Obj: TSourceBlock2D): TSourceBlock2D;
begin
  Result := Obj;
  inherited AddSourceBlock(-1, Obj);
end;

procedure TCADCmp2D.DeleteSourceBlock(const SrcName: TSourceBlockName);
var
  TmpSource: TSourceBlock2D;
begin
  TmpSource := TSourceBlock2D(FindSourceBlock(SrcName));
  if TmpSource.NumOfReferences > 0 then
   Raise ECADSysException.Create('TCADCmp2D.DeleteSourceBlock: Remove the references before the source');
  DeleteSourceBlockByID(TmpSource.ID);
end;

function TCADCmp2D.GetSourceBlock(const ID: LongInt): TSourceBlock2D;
begin
  Result := inherited GetSourceBlock(ID) as TSourceBlock2D;
end;

function TCADCmp2D.FindSourceBlock(const SrcName: TSourceBlockName): TSourceBlock2D;
var
  TmpIter: TGraphicObjIterator;
begin
  TmpIter := SourceBlocksIterator;
  try
    Result := TmpIter.First as TSourceBlock2D;
    while Result <> nil do
     begin
       if SrcName = Result.Name then
        Exit;
       Result := TmpIter.Next as TSourceBlock2D;
     end;
  finally
    TmpIter.Free;
  end;
  //Raise ECADListObjNotFound.Create(Format('TCADCmp2D.FindSourceBlock: Source block %s not found', [SrcName]));
end;

function TCADCmp2D.BlockObjects(const SrcName: TSourceBlockName; const Objs: TGraphicObjIterator): TSourceBlock2D;
var
  TmpObj: TObject2D;
begin
  Result := TSourceBlock2D.Create(0, SrcName, [nil]);
  try
    TmpObj := Objs.First as TObject2D;
    while TmpObj <> nil do
     begin
       Result.Objects.Add(TmpObj);
       TmpObj := Objs.Next as TObject2D;
     end;
    AddSourceBlock(Result);
  except
    Result.Free;
    Result := nil;
  end;
end;

procedure TCADCmp2D.DeleteSavedSourceBlocks;
var
  TmpObj: TGraphicObject;
  TmpIter: TExclusiveGraphicObjIterator;
begin
  TmpIter := SourceBlocksExclusiveIterator;
  try
    TmpObj := TmpIter.First;
    while Assigned(TmpObj) do
     if TSourceBlock2D(TmpObj).ToBeSaved and not TSourceBlock2D(TmpObj).IsLibraryBlock then
      try
        TmpIter.DeleteCurrent;
        TmpObj := TmpIter.Current;
      except
        TmpObj := TmpIter.Next;
      end
     else
      TmpObj := TmpIter.Next;
  finally
    TmpIter.Free;
  end;
end;

procedure TCADCmp2D.DeleteLibrarySourceBlocks;
var
  TmpObj: TGraphicObject;
  TmpIter: TExclusiveGraphicObjIterator;
begin
  TmpIter := SourceBlocksExclusiveIterator;
  try
    TmpObj := TmpIter.First;
    while Assigned(TmpObj) do
     if TSourceBlock2D(TmpObj).IsLibraryBlock then
      try
        TmpIter.DeleteCurrent;
        TmpObj := TmpIter.Current;
      except
        TmpObj := TmpIter.Next;
      end
     else
      TmpObj := TmpIter.Next;
  finally
    TmpIter.Free;
  end;
end;

function TCADCmp2D.AddObject(const ID: LongInt; const Obj: TObject2D): TObject2D;
begin
  Result := Obj;
  inherited AddObject(ID, TGraphicObject(Obj));
end;

function TCADCmp2D.InsertObject(const ID, IDInsertPoint: LongInt; const Obj: TObject2D): TObject2D;
begin
  Result := Obj;
  inherited InsertObject(ID, IDInsertPoint, TGraphicObject(Obj));
end;

function TCADCmp2D.AddBlock(const ID: LongInt; const SrcName: TSourceBlockName): TObject2D;
var
  Tmp: TBlock2D;
  TmpSource: TSourceBlock2D;
begin
  TmpSource := FindSourceBlock(SrcName);
  Tmp := TBlock2D.Create(ID, TmpSource);
  try
    AddObject(ID, Tmp);
    Result := Tmp;
  except
    Tmp.Free;
    Result := nil;
  end;
end;

function TCADCmp2D.GetObject(const ID: LongInt): TObject2D;
begin
  Result := inherited GetObject(ID) as TObject2D;
end;

procedure TCADCmp2D.TransformObjects(const ListOfObj: array of LongInt; const T: TTransf2D);
var
  Cont: LongInt;
  Tmp: TObject2D;
  TmpIter: TExclusiveGraphicObjIterator;
begin
  TmpIter := ObjectsExclusiveIterator;
  try
    if ListOfObj[Low(ListOfObj)] < 0 then
     begin
       { Apply trasform to all objects. }
       Tmp := TmpIter.First as TObject2D;
       while Tmp <> nil do
        begin
          Tmp.Transform(T);
          Tmp.ApplyTransform;
          Tmp := TmpIter.Next as TObject2D;
        end;
     end
    else
     for Cont := Low(ListOfObj) to High(ListOfObj) do
      begin
        try
         Tmp := TObject2D(TmpIter.Search(ListOfObj[Cont]));
        except
         on Exception do Raise ECADListObjNotFound.Create('TCADCmp2D.TransformObjects: Object not found');
        end;
        if Tmp <> nil then
         begin
           Tmp.Transform(T);
           Tmp.ApplyTransform;
         end;
      end;
  finally
    TmpIter.Free;
  end;
  if RepaintAfterTransform then RepaintViewports;
end;

procedure TCADCmp2D.RedrawObject(const Obj: TObject2D);
begin
  inherited RedrawObject(Obj);
end;

function TCADCmp2D.GetExtension: TRect2D;
var
  Tmp: TObject2D;
  TmpIter: TGraphicObjIterator;
begin
  if ObjectsCount = 0 then
   Exit;
  TmpIter := ObjectsIterator;
  try
    Result := Rect2D(MaxCoord, MaxCoord, MinCoord, MinCoord);
    Tmp := TmpIter.First as TObject2D;
    while Tmp <> nil do
     begin
       if fLayers[Tmp.Layer].fVisible then
        begin
          try
           Tmp.UpdateExtension(Self);
          finally
          end;
          { Set the new extension if necessary. }
          if Tmp.Box.Left < Result.Left then
           Result.Left := Tmp.Box.Left;
          if Tmp.Box.Right > Result.Right then
           Result.Right := Tmp.Box.Right;
          if Tmp.Box.Bottom < Result.Bottom then
           Result.Bottom := Tmp.Box.Bottom;
          if Tmp.Box.Top > Result.Top then
           Result.Top := Tmp.Box.Top;
        end;
       Tmp := TmpIter.Next as TObject2D;
     end;
  finally
    TmpIter.Free;
  end;
end;

// =====================================================================
// TCADViewport2D
// =====================================================================

procedure TCADViewport2D.SetCADCmp(CAD: TCADCmp);
begin
  if( CAD <> fCADCmp2D ) then
   begin
     inherited SetCADCmp(CAD);
     fCADCmp2D := CAD as TCADCmp2D;
   end;
end;

procedure TCADViewport2D.SetCADCmp2D(CAD2D: TCADCmp2D);
begin
  SetCADCmp(CAD2D);
end;

constructor TCADViewport2D.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  fPickFilter := TObject2D;
end;

procedure TCADViewport2D.DrawObject(const Obj: TGraphicObject; const Cnv: TDecorativeCanvas; const ClipRect2D: TRect2D);
begin
  if not TObject2D(Obj).IsVisible(VisualRect, DrawMode) then
   Exit;
  with Obj as TObject2D do
   try
     if (CADCmp.Layers.SetCanvas(Cnv, Layer)) then
     begin
        If CADCmp.Homogen or CADCmp.Layers[Obj.Layer].Homogen then Cnv.Canvas.Pen.Color := clSilver;
        Draw(ViewportToScreenTransform, Cnv, ClipRect2D, DrawMode);
        if ShowControlPoints then
         begin
           Cnv.Canvas.Pen.Color := RubberPenColor;
           Cnv.Canvas.Pen.Width := 1;
           Cnv.Canvas.Brush.Color := ControlPointsColor;
           DrawControlPoints(ViewportToScreenTransform, Cnv, ClipRect2D, ControlPointsWidth);
         end;
     end;
   finally
   end;
end;

procedure TCADViewport2D.DrawObjectWithRubber(const Obj: TGraphicObject; const Cnv: TDecorativeCanvas; const ClipRect2D: TRect2D);
begin
  if not TObject2D(Obj).IsVisible(VisualRect, DrawMode) then
   Exit;
  with Obj as TObject2D do
   try
     Cnv.Canvas.Pen.Assign(RubberPen);
     Cnv.Canvas.Brush.Color := RubberPen.Color;
     Cnv.Canvas.Brush.Style := bsSolid;
     Draw(ViewportToScreenTransform, Cnv, ClipRect2D, DrawMode);
     if ShowControlPoints then
      begin
        Cnv.Canvas.Pen.Assign(RubberPen);
        Cnv.Canvas.Pen.Width := 1;
        Cnv.Canvas.Brush.Color := ControlPointsColor;
        DrawControlPoints(ViewportToScreenTransform, Cnv, ClipRect2D, ControlPointsWidth);
      end;
   finally
   end;
end;

procedure TCADViewport2D.DrawObject2D(const Obj: TObject2D; const CtrlPts: Boolean);
var
  TmpFlag: Boolean;
begin
  if not Assigned(fCADCmp2D) then Exit;
  TmpFlag := ShowControlPoints;
  ShowControlPoints := ShowControlPoints or CtrlPts;
  try
    DrawObject(Obj, OffScreenCanvas, RectToRect2D(ClientRect));
    DrawObject(Obj, OnScreenCanvas, RectToRect2D(ClientRect));
  finally
    ShowControlPoints := TmpFlag;
  end;
end;

procedure TCADViewport2D.DrawObject2DWithRubber(const Obj: TObject2D; const CtrlPts: Boolean);
var
  TmpFlag: Boolean;
begin
  if not Assigned(fCADCmp2D) then Exit;
  TmpFlag := ShowControlPoints;
  ShowControlPoints := ShowControlPoints or CtrlPts;
  try
    DrawObjectWithRubber(Obj, OnScreenCanvas, RectToRect2D(ClientRect));
  finally
    ShowControlPoints := TmpFlag;
  end;
end;

procedure TCADViewport2D.CopyRectToCanvas(CADRect: TRect2D;
                                          const CanvasRect: TRect;
                                          const Cnv: TCanvas;
                                          const Mode: TCanvasCopyMode);
var
  Tmp: TObject2D;
  TmpTransform: TTransf2D;
  TmpFlag: Boolean;
  TmpIter: TGraphicObjIterator;
  TmpCanvas: TDecorativeCanvas;
  TmpClipRect: TRect2D;
begin
  StopRepaint;
  if not Assigned(fCADCmp2D) then
   Exit;
  TmpCanvas := TDecorativeCanvas.Create(Cnv);
  if (ViewportObjects <> nil) then
   TmpIter := ViewportObjects.GetIterator
  else
   TmpIter := fCADCmp2D.ObjectsIterator;
  try
    case Mode of
     cmNone: TmpTransform := GetVisualTransform2D(CADRect, CanvasRect, 0);
     cmAspect: TmpTransform := GetVisualTransform2D(CADRect, CanvasRect, AspectRatio);
    else
     TmpTransform := ViewportToScreenTransform;
    end;
    Tmp := TObject2D(TmpIter.First);
    TmpFlag := ShowControlPoints;
    ShowControlPoints := False;
    TmpClipRect := RectToRect2D(ClientRect);
    while Tmp <> nil do
     begin
       if Tmp.IsVisible(CADRect, DrawMode) then
        begin
          fCADCmp2D.Layers.SetCanvas(TmpCanvas, Tmp.Layer);
          Tmp.Draw(TmpTransform, TmpCanvas, TmpClipRect, DrawMode);
        end;
       Tmp := TObject2D(TmpIter.Next);
     end;
    ShowControlPoints := TmpFlag;
  finally
    TmpIter.Free;
    TmpCanvas.Free;
  end;
end;

function TCADViewport2D.GetCopyRectViewportToScreen(CADRect: TRect2D;
                                                    const CanvasRect: TRect;
                                                    const Mode: TCanvasCopyMode): TTransf2D;
begin
  case Mode of
   cmNone: Result := GetVisualTransform2D(CADRect, CanvasRect, 0);
   cmAspect: Result := GetVisualTransform2D(CADRect, CanvasRect, AspectRatio);
  else
   Result := ViewportToScreenTransform;
  end;
end;

procedure TCADViewport2D.ZoomToExtension;
var
  NewWindow2D: TRect2D;
  Marg: TRealType;
begin
  if not Assigned(fCADCmp2D) then
   Exit;
  StopRepaint;
  if CADCmp2D.ObjectsCount = 0 then
   begin
     Repaint;
     Exit;
   end;
  NewWindow2D := fCADCmp2D.DrawingExtension;
  Marg := Abs(NewWindow2D.Right - NewWindow2D.Left) / 20;
  Marg := MaxValue([Marg, Abs(NewWindow2D.Top - NewWindow2D.Bottom) / 20]);
  NewWindow2D.Left := NewWindow2D.Left - Marg;
  NewWindow2D.Right := NewWindow2D.Right + Marg;
  NewWindow2D.Bottom := NewWindow2D.Bottom - Marg;
  NewWindow2D.Top := NewWindow2D.Top + Marg;
  ZoomWindow(NewWindow2D);
end;

procedure TCADViewport2D.GroupObjects(const ResultLst: TGraphicObjList;
                                      Frm: TRect2D;
                                      const Mode: TGroupMode;
                                      const RemoveFromCAD: Boolean);
var
  Tmp: TObject2D;
  TmpObjectsIter: TExclusiveGraphicObjIterator;
begin
  if not Assigned(fCADCmp2D) or CADCmp.HasIterators then
   Exit;
  StopRepaint;
  Frm := ReOrderRect2D(Frm);
  ResultLst.FreeOnClear := RemoveFromCAD;
  TmpObjectsIter := fCADCmp2D.ObjectsExclusiveIterator;
  try
    Tmp := TmpObjectsIter.First as TObject2D;
    while Tmp <> nil do
     with (CADCmp.Layers[Tmp.Layer]) do
      begin
        if Active and Visible and (Tmp.Enabled) and (Tmp is FPickFilter) and Tmp.IsVisible(VisualRect, DrawMode) then
         begin
           if (Mode = gmAllInside) and IsBoxAllInBox2D(Tmp.Box, Frm) then
            { The object is in the frame. }
            begin
              ResultLst.Add(Tmp);
              if RemoveFromCAD then
               begin
                 TmpObjectsIter.RemoveCurrent;
                 Tmp := TObject2D(TmpObjectsIter.Current);
                 Continue;
               end;
            end
           else if (Mode = gmCrossFrame) and IsBoxInBox2D(Tmp.Box, Frm) then
            begin
              ResultLst.Add(Tmp);
              if RemoveFromCAD then
               begin
                 TmpObjectsIter.RemoveCurrent;
                 Tmp := TObject2D(TmpObjectsIter.Current);
                 Continue;
               end;
            end;
         end;
        Tmp := TmpObjectsIter.Next as TObject2D;
      end;
  finally
    TmpObjectsIter.Free;
  end;
end;

function TCADViewport2D.PickObject(Pt: TPoint2D; Aperture: Word; FirstFound: Boolean; var NPoint: Integer): TObject2D;
var
  TmpNPoint: Integer;
  Tmp: TObject2D;
  WAperture, MinDist, Distance: TRealType;
  TmpIter: TExclusiveGraphicObjIterator;
begin
  Result := nil;
  if (not Assigned(fCADCmp2D)) and (not Assigned(ViewportObjects)) then
   Exit;
  if CADCmp.HasIterators then
   Exit;
  if (ViewportObjects <> nil) then
   TmpIter := ViewportObjects.GetExclusiveIterator
  else
   TmpIter := fCADCmp2D.ObjectsExclusiveIterator;
  StopRepaint;
  try
    // Trasforma l'apertura in coordinate mondo.
    WAperture := GetPixelAperture.X * Aperture;
    MinDist := WAperture;
    NPoint := PICK_NOOBJECT;
    Tmp := TmpIter.Current as TObject2D;
    while Tmp <> nil do
     with (CADCmp.Layers[Tmp.Layer]) do
      begin
        if Active and Visible and (Tmp is FPickFilter) and Tmp.IsVisible(VisualRect, DrawMode) then
         begin
           TmpNPoint := Tmp.OnMe(Pt, WAperture, Distance);
           if (TmpNPoint >= NPoint) and (Distance <= MinDist) then
            begin
              Result := Tmp;
              NPoint := TmpNPoint;
              MinDist := Distance;
              if FirstFound then
               Break;
            end;
         end;
        Tmp := TmpIter.Next as TObject2D;
      end;
  finally
    TmpIter.Free;
  end;
end;

function TCADViewport2D.PickListOfObjects(const PickedObjects: TList; Pt: TPoint2D; Aperture: Word): Integer;
var
  Tmp: TObject2D;
  WAperture, Distance: TRealType;
  TmpIter: TExclusiveGraphicObjIterator;
begin
  Result := 0;
  if (not Assigned(fCADCmp2D)) and (not Assigned(ViewportObjects)) then
   Exit;
  if CADCmp.HasIterators then
   Exit;
  if (ViewportObjects <> nil) then
   TmpIter := ViewportObjects.GetExclusiveIterator
  else
   TmpIter := fCADCmp2D.ObjectsExclusiveIterator;
  StopRepaint;
  try
    // Trasforma l'apertura in coordinate mondo.
    WAperture := GetPixelAperture.X * Aperture;
    Tmp := TmpIter.Current as TObject2D;
    while Tmp <> nil do
     with (CADCmp.Layers[Tmp.Layer]) do
      begin
        if Active and Visible and (Tmp is FPickFilter) and Tmp.IsVisible(VisualRect, DrawMode) then
         begin
           if Tmp.OnMe(Pt, WAperture, Distance) > PICK_NOOBJECT then
            begin
              PickedObjects.Add(Tmp);
              Inc(Result);
            end;
         end;
        Tmp := TmpIter.Next as TObject2D;
      end;
  finally
    TmpIter.Free;
  end;
end;

function TCADViewport2D.WorldToObject(const Obj: TObject2D; WPt: TPoint2D): TPoint2D;
begin
  WPt := CartesianPoint2D(WPt);
  if Obj.HasTransform then
   Result := TransformPoint2D(WPt, InvertTransform2D(Obj.ModelTransform))
  else
   Result := WPt;
end;

function TCADViewport2D.ObjectToWorld(const Obj: TObject2D; OPt: TPoint2D): TPoint2D;
begin
  OPt := CartesianPoint2D(OPt);
  if Obj.HasTransform then
   Result := TransformPoint2D(OPt, Obj.ModelTransform)
  else
   Result := OPt;
end;

procedure TCADViewport2D.MouseMove(Shift: TShiftState; X, Y: Integer);
var
 Pos2D: TPoint2D;
begin
  Pos2D := ScreenToViewport(Point2D(X, Y));
  if (not DisableMouseEvents) and Assigned(FOnMouseMove2D) then
   FOnMouseMove2D(Self, Shift, Pos2D.X, Pos2D.Y, X, Y);
  inherited MouseMove(Shift, X, Y);
end;

procedure TCADViewport2D.MouseDown(Button: TMouseButton; Shift: TShiftState;
                             X, Y: Integer);
var
 Pos2D: TPoint2D;
begin
  if (not DisableMouseEvents) and Assigned(FOnMouseDown2D) then
   begin
     Pos2D := ScreenToViewport(Point2D(X, Y));
     FOnMouseDown2D(Self, Button, Shift, Pos2D.X, Pos2D.Y, X, Y);
   end;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TCADViewport2D.MouseUp(Button: TMouseButton; Shift: TShiftState;
                            X, Y: Integer);
var
 Pos2D: TPoint2D;
begin
  if (not DisableMouseEvents) and Assigned(FOnMouseUp2D) then
   begin
     Pos2D := ScreenToViewport(Point2D(X, Y));
     FOnMouseUp2D(Self, Button, Shift, Pos2D.X, Pos2D.Y, X, Y);
   end;
  inherited MouseUp(Button, Shift, X, Y);
end;

function TCADViewport2D.BuildViewportTransform(var ViewWin: TRect2D;
                                               const ScreenWin: TRect;
                                               const AspectRatio: TRealType): TTransf2D;
begin
  Result := GetVisualTransform2D(ViewWin, ScreenWin, AspectRatio);
end;

// =====================================================================
// TCADPrgParam
// =====================================================================

constructor TCADPrgParam.Create(AfterS: TCADStateClass);
begin
  inherited Create;

  fAfterState := AfterS;
end;

// =====================================================================
// TCADState
// =====================================================================

constructor TCADState.Create(const CADPrg: TCADPrg; const StateParam: TCADPrgParam; var NextState: TCADStateClass);
begin
  inherited Create;
  fCAD := CADPrg;
  fParam := StateParam;
  fCanBeSuspended := True;
  Description := '';
  NextState := nil;
end;

procedure TCADState.SetDescription(D: String);
begin
  fDescription := D;
  if Assigned(fCAD) and Assigned(fCAD.fOnDescriptionChanged) then
   fCAD.fOnDescriptionChanged(Self);
end;

function TCADState.OnEvent(Event: TCADPrgEvent;
                           MouseButton: TCS4MouseButton;
                           Shift: TShiftState;
                           Key: Word;
                           var NextState: TCADStateClass): Boolean;
begin
  Result := False;
end;

procedure TCADState.OnStop;
begin
  Param.Free;
  Param := nil;
end;

procedure TCADState.OnResume;
begin
end;

// =====================================================================
// TCADIdleState.
// =====================================================================

constructor TCADIdleState.Create(const CADPrg: TCADPrg; const StateParam: TCADPrgParam; var NextState: TCADStateClass);
begin
  inherited Create(CADPrg, StateParam, NextState);
  if Param <> nil then
   Raise Exception.Create('TCADIdleState.Create: Non all objects were destroied');
  NextState := nil;
end;

// =====================================================================
// TCADPrg
// =====================================================================

procedure TCADPrg.SetLinkedViewport(V: TCADViewport);
begin
  if V = fLinkedViewport then
   Exit;
  { Subclassing component. Charles F. I. Savage gave my this idea from its
    TCADViewport subclassing. Thanks Charles. }
  if Assigned(fNewWndProc) then
   begin
     if not (csDestroying in fLinkedViewport.ComponentState) then
      SetWindowLong(fLinkedViewport.Handle, gwl_wndProc, LongInt(fOldWndProc));
     FreeObjectInstance(fNewWndProc);
     fNewWndProc := nil;
   end;
  // Reassign the old on paint.
  if Assigned(fLinkedViewport) then
   begin
     fLinkedViewport.OnPaint := fOldOnPaint;
   end;
  fLinkedViewport := V;
  if Assigned(V) then
   begin
     V.FreeNotification(Self);
     fNewWndProc := MakeObjectInstance(SubclassedWinProc);
     fOldWndProc := Pointer(SetWindowLong(V.Handle, gwl_wndProc, LongInt(fNewWndProc)));
     // Assign the new OnPaint because it is called not only by window msgs.
     fOldOnPaint := V.OnPaint;
     V.OnPaint := ViewOnPaint;
     if fShowCursorCross then
      HideCursorCross;
   end;
end;

procedure TCADPrg.SetDefaultState(DefState: TCADStateClass);
var
  TmpState: TCADStateClass;
begin
  if CurrentState is fDefaultState then
   begin
     CurrentState.OnStop;
     CurrentState.Free;
     fCurrentState := nil;
     fDefaultState := DefState;
     fCurrentState := fDefaultState.Create(Self, nil, TmpState);
   end
  else
   fDefaultState := DefState;
end;

procedure TCADPrg.SendEvent(Event: TCADPrgEvent; MouseButton: TCS4MouseButton;
                            Shift: TShiftState; Key: Word);
var
  NextState: TCADStateClass;
  Res, TmpBool: Boolean;
  LastParam: TCADPrgParam;
  LastState: TClass;
begin
  if fIgnoreEvents then
   Exit;
  NextState := nil;
  Res := fCurrentState.OnEvent(Event, MouseButton, Shift, Key, NextState);
  if Res then
   begin
     if Assigned(fOnExState) then
      fOnExState(Self, fCurrentState);
     repeat
       LastParam := fCurrentState.fParam;
       LastState := fCurrentState.ClassType;
       if (NextState = fDefaultState) or (NextState = nil) then
        begin
          if Assigned(fOnEndOperation) then
           fOnEndOperation(Self, fCurrentOperation, fCurrentState.fParam);
          GoToDefaultState(LastState, LastParam);
          Break;
        end;
       TmpBool := fCurrentState.CanBeSuspended;
       fCurrentState.Free;
       fCurrentState := nil;
       try
         fCurrentState := NextState.Create(Self, LastParam, NextState);
         fCurrentState.CanBeSuspended := TmpBool;
       except
        Reset;
        Break;
       end;
       if Assigned(fOnEntState) then
        fOnEntState(Self, fCurrentState);
     until not Assigned(NextState);
   end;
end;

procedure TCADPrg.GoToDefaultState(const LastState: TClass; const LastParam: TCADPrgParam);
var
  TmpState: TCADStateClass;
begin
  if not Assigned(fLinkedViewport) then Exit;
  if not Assigned(fCurrentState) then
   begin
     fCurrentState := fDefaultState.Create(Self, nil, TmpState);
     Exit;
   end;
  if fIsSuspended then
   begin
     fCurrentState.Free;
     fCurrentState := nil;
     fCurrentState := fSuspendedState;
     fSuspendedState := nil;
     fCurrentOperation := fSuspendedOperation;
     fSuspendedOperation := nil;
     // Force the OnDescriptionChanged event.
     fCurrentState.Description := fCurrentState.Description;
     fIsSuspended := False;
     if fShowCursorCross then
      HideCursorCross;
     if fMustRepaint and not IsBoxInBox2D(Rect2D(0.0, 0.0, 0.0, 0.0), fRepaintRect) then
      fLinkedViewport.RepaintRect(fRepaintRect)
     else if fMustRepaint then
      fLinkedViewport.Repaint
     else if fRefreshAfterOp then
      fLinkedViewport.Refresh;
     if fShowCursorCross then
      DrawCursorCross;
     fMustRepaint := False;
     fCurrentState.OnResume(LastState, LastParam);
     if Assigned(LastParam) and (LastParam <> fCurrentState.fParam) then
      LastParam.Free;
     Exit;
   end;
  fIsBusy := False;
  if Assigned(fCurrentState.fParam) then
   fCurrentState.fParam.Free;
  fCurrentState.Free;
  fCurrentState := nil;
  fCurrentOperation := nil;
  if fShowCursorCross then
   HideCursorCross;
  if fMustRepaint and not IsBoxInBox2D(Rect2D(0.0, 0.0, 0.0, 0.0), fRepaintRect) then
   fLinkedViewport.RepaintRect(fRepaintRect)
  else if fMustRepaint then
   fLinkedViewport.Repaint
  else if fRefreshAfterOp then
   fLinkedViewport.Refresh;
  if fShowCursorCross then
   DrawCursorCross;
  fMustRepaint := False;
  fIgnoreEvents := False;
  StartOperation(fDefaultState, nil);
  if (fDefaultState = TCADIdleState) and Assigned(fOnIdle) then
   fOnIdle(Self);
end;

procedure TCADPrg.ViewOnPaint(Sender: TObject);
begin
  if fShowCursorCross then
   HideCursorCross;
  if Assigned(CurrentState) then
   SendEvent(cePaint, cmbNone, [], 0);
  if Assigned(fOldOnPaint) then
   fOldOnPaint(Sender);
  if fShowCursorCross then
   DrawCursorCross;
end;

function TCADPrg.ViewOnDblClick(Sender: TObject): Boolean;
begin
  if Assigned(CurrentState) then
   SendEvent(ceMouseDblClick, cmbNone, [], 0);
  Result := True;
end;

function TCADPrg.ViewOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState): Boolean;
var
  MouseButton: TCS4MouseButton;
begin
  CurrentKey := Key;
  if ssLeft in Shift then
   MouseButton := cmbLeft
  else if ssRight in Shift then
   MouseButton := cmbRight
  else if ssMiddle in Shift then
   MouseButton := cmbMiddle
  else
   MouseButton := cmbNone;
  if Assigned(CurrentState) then
   SendEvent(ceKeyDown, MouseButton, Shift, CurrentKey);
  Result := True;
end;

function TCADPrg.ViewOnKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState): Boolean;
var
  MouseButton: TCS4MouseButton;
begin
  if ssLeft in Shift then
   MouseButton := cmbLeft
  else if ssRight in Shift then
   MouseButton := cmbRight
  else if ssMiddle in Shift then
   MouseButton := cmbMiddle
  else
   MouseButton := cmbNone;
  if Assigned(CurrentState) then
   SendEvent(ceKeyUp, MouseButton, Shift, Key);
  CurrentKey := 0;
  Result := True;
end;

function TCADPrg.ViewOnMouseMove(Sender: TObject; Shift: TShiftState; var X, Y: SmallInt): Boolean;
var
  MouseButton: TCS4MouseButton;
begin
  if ssLeft in Shift then
   MouseButton := cmbLeft
  else if ssRight in Shift then
   MouseButton := cmbRight
  else if ssMiddle in Shift then
   MouseButton := cmbMiddle
  else
   MouseButton := cmbNone;
  if fShowCursorCross then
   DrawCursorCross;
  if Assigned(CurrentState) then
   SendEvent(ceMouseMove, MouseButton, Shift, CurrentKey);
  Result := True;
end;

function TCADPrg.ViewOnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; var X, Y: SmallInt): Boolean;
var
  MouseButton: TCS4MouseButton;
begin
  if Button = mbLeft then
   MouseButton := cmbLeft
  else if Button = mbRight then
   MouseButton := cmbRight
  else if Button = mbMiddle then
   MouseButton := cmbMiddle
  else
   MouseButton := cmbNone;
  if Assigned(CurrentState) then
   SendEvent(ceMouseDown, MouseButton, Shift, CurrentKey);
  Result := True;
end;

function TCADPrg.ViewOnMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; var X, Y: SmallInt): Boolean;
var
  MouseButton: TCS4MouseButton;
begin
  if Button = mbLeft then
   MouseButton := cmbLeft
  else if Button = mbRight then
   MouseButton := cmbRight
  else if Button = mbMiddle then
   MouseButton := cmbMiddle
  else
   MouseButton := cmbNone;
  if Assigned(CurrentState) then
   SendEvent(ceMouseUp, MouseButton, Shift, CurrentKey);
  Result := True;
end;

constructor TCADPrg.Create(AOwner: TComponent);
var
  TmpState: TCADStateClass;
begin
  inherited Create(AOwner);
  Screen.Cursors[crKez1]     :=  LoadCursor(HInstance, 'KEZ_1');
  Screen.Cursors[crKez2]     :=  LoadCursor(HInstance, 'KEZ_2');
  Screen.Cursors[crRealZoom] :=  LoadCursor(HInstance, 'REAL_ZOOM');
  Screen.Cursors[crNyilUp]   :=  LoadCursor(HInstance, 'NYIL_UP');
  Screen.Cursors[crNyilDown] :=  LoadCursor(HInstance, 'NYIL_DOWN');
  Screen.Cursors[crNyilLeft] :=  LoadCursor(HInstance, 'NYIL_LEFT');
  Screen.Cursors[crNyilRight]:=  LoadCursor(HInstance, 'NYIL_RIGHT');
  Screen.Cursors[crZoomIn]   :=  LoadCursor(HInstance, 'ZOOM_IN');
  Screen.Cursors[crZoomOut]  :=  LoadCursor(HInstance, 'ZOOM_OUT');
  Screen.Cursors[crKereszt]  :=  LoadCursor(HInstance, 'KERESZT');
  Screen.Cursors[crHelp]     :=  LoadCursor(HInstance, 'HELP_CUR');
  fCursorColor := clGray;
  fCentralColor := clBlack;
  fShowCursorCross := False;
  fShowCentralCross := False;
  fLinkedViewport := nil;
  fNewWndProc := nil;
  fOldWndProc := nil;
  fDefaultState := TCADIdleState;
  fCurrentState := fDefaultState.Create(Self, nil, TmpState);
  fIgnoreEvents := False;
  fRefreshAfterOp := True;
  fViewAction   := tamNone;
end;

procedure TCADPrg.SetViewAction(Value:TCADActionMode);
var
  TmpSpline: TBSpline2D;
begin
if not (csLoading in ComponentState) then begin
  FViewAction := Value;
  If IsBusy then StopOperation;
  If ViewPort<>nil then
     With ViewPort do begin

        If Value in [tamLine2d,tamPolyline2d,tamPolygon2d,tamFrame2d,
            tamCircle2d,tamEllipse2d,tamArc2d,tamSpline2d,tamEdit] then
            begin
                Cursor := crCross;
                SendUserEvent(CADPRG_ACCEPT);
            end
        else
            Cursor := crDefault;

        Case Value of
        tamNone     :
          begin
            Cursor := crDefault;
            SendUserEvent(CADPRG_CANCEL);
          end;
        tamPan      :
          begin
            Cursor := crKez1;
            SendUserEvent(CADPRG_ACCEPT);
            SuspendOperation(TCADPrgRealTimePan, nil);
          end;
        tamZoom     :
          begin
            Cursor := crZoomIn;
            SendUserEvent(CADPRG_ACCEPT);
            StartOperation(TCADPrgZoomInOut, nil);
          end;
        tamZoomArea :
          begin
            Cursor := crKereszt;
            SendUserEvent(CADPRG_ACCEPT);
            CurrentOperation := TCADPrgZoomArea;
            SuspendOperation(TCADPrgZoomArea, nil);
          end;
        tamRealZoom :
          begin
            Cursor := crRealZoom;
            CurrentOperation := TCADPrgRealZoom;
            SuspendOperation(TCADPrgRealZoom, nil);
          end;
        tamDistance :
          begin
            Cursor := crCross;
            CurrentOperation := TCADPrgDistance;
            SuspendOperation(TCADPrgDistance, nil);
          end;
        tamAreaMove :
          begin
          end;
        tamMove :
          begin
          end;
        tamEdit :
          begin
            StartOperation(TCAD2DSelectObject, TCAD2DSelectObjectsParam.Create(5, TCAD2DEditSelectedPrimitive));
          end;
        tamLine2d :
          begin
            StartOperation(TCAD2DDrawSizedPrimitive, TCAD2DDrawSizedPrimitiveParam.Create(nil,
                TLine2D.Create(-1, Point2D(0, 0), Point2D(0, 0)), 0, True));
          end;
        tamPolyLine2d :
          begin
            StartOperation(TCAD2DDrawUnsizedPrimitive, TCAD2DDrawUnsizedPrimitiveParam.Create(nil,
                TPolyline2D.Create(-1, [Point2D(0, 0)]), 0, True));
          end;
        tamClosedPolyLine2d :
          begin
            StartOperation(TCAD2DDrawUnsizedPrimitive, TCAD2DDrawUnsizedPrimitiveParam.Create(nil,
                TClosedPolyline2D.Create(-1, [Point2D(0, 0)]), 0, True));
          end;
        tamPolygon2d :
          begin
            StartOperation(TCAD2DDrawUnsizedPrimitive, TCAD2DDrawUnsizedPrimitiveParam.Create(nil,
                TPolygon2D.Create(-1, [Point2D(0, 0)]), 0, True));
          end;
        tamFrame2d :
          begin
            StartOperation(TCAD2DDrawSizedPrimitive, TCAD2DDrawSizedPrimitiveParam.Create(nil,
                TFrame2D.Create(-1, Point2D(0, 0), Point2D(0, 0)), 0, True));
          end;
        tamCircle2d :
          begin
            StartOperation(TCAD2DDrawUnsizedPrimitive, TCAD2DDrawUnsizedPrimitiveParam.Create(nil,
                TCircle2D.Create(-1, Point2D(0, 0), 0), 0, True));
          end;
        tamEllipse2d :
          begin
            StartOperation(TCAD2DDrawSizedPrimitive, TCAD2DDrawSizedPrimitiveParam.Create(nil,
                TEllipse2D.Create(-1, Point2D(0, 0), Point2D(0, 0)), 0, True));
          end;
        tamArc2d :
          begin
            StartOperation(TCAD2DDrawArcPrimitive, TCAD2DDrawArcPrimitiveParam.Create(nil,
                TArc2D.Create(-1, Point2D(0, 0), Point2D(0, 0), 0, 0)));
          end;
        tamSpline2d :
          begin
            TmpSpline := TBSpline2D.Create(-1, [Point2D(0, 0)]);
            TmpSpline.SavingType := stSpace;
            StartOperation(TCAD2DDrawUnsizedPrimitive, TCAD2DDrawUnsizedPrimitiveParam.Create(nil,
                TmpSpline, 0, True));
          end;
        tamJustifiedVectText2D :
          begin
          end;
        tamRectangle2D :
          begin
            StartOperation(TCAD2DDrawSizedPrimitive, TCAD2DDrawSizedPrimitiveParam.Create(nil,
                TRectangle2D.Create(-1, Point2D(0, 0), Point2D(0, 0)), 0, True));
          end;
        tamFilledEllipse2d :
          begin
            StartOperation(TCAD2DDrawSizedPrimitive, TCAD2DDrawSizedPrimitiveParam.Create(nil,
                TFilledEllipse2D.Create(-1, Point2D(0, 0), Point2D(0, 0)), 0, True));
          end;
        else
          Cursor := crDefault;
        end;
     end;
end;
end;

destructor TCADPrg.Destroy;
begin
  if Assigned(fCurrentState) then
   begin
     fCurrentState.OnStop;
     fCurrentState.Free;
   end;
  if fIsSuspended then
   begin
     fSuspendedState.OnStop;
     fSuspendedState.Free;
   end;
  fCurrentState := nil;
  LinkedViewport := nil;
  inherited Destroy;
end;

procedure TCADPrg.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (AComponent = LinkedViewport) and (Operation = opRemove) then
   LinkedViewport := nil;
end;

procedure TCADPrg.SubclassedWinProc(var Msg: TMessage);
var
  LastSet, Propagate: Boolean;
begin
  Propagate := True;
  if not (csDesigning in ComponentState) then
   case Msg.Msg of
   WM_MOUSEMOVE:
    with TWMMouseMove(Msg) do
     Propagate := ViewOnMouseMove(LinkedViewport, KeysToShiftState(Keys), XPos, YPos);
   CM_INVALIDATE:
    begin
      Msg.Result := CallWindowProc(fOldWndProc, fLinkedViewport.Handle, Msg.Msg, Msg.WParam, Msg.LParam);
      ViewOnPaint(Self);
      Propagate := False;
    end;
   WM_LBUTTONDOWN:
    with TWMMouse(Msg) do
     Propagate := ViewOnMouseDown(LinkedViewport, mbLeft, KeysToShiftState(Keys), XPos, YPos);
   WM_RBUTTONDOWN:
    with TWMMouse(Msg) do
     Propagate := ViewOnMouseDown(LinkedViewport, mbRight, KeysToShiftState(Keys), XPos, YPos);
   WM_LBUTTONUP:
    with TWMMouse(Msg) do
     Propagate := ViewOnMouseUp(LinkedViewport, mbLeft, KeysToShiftState(Keys), XPos, YPos);
   WM_RBUTTONUP:
    with TWMMouse(Msg) do
     Propagate := ViewOnMouseUp(LinkedViewport, mbRight, KeysToShiftState(Keys), XPos, YPos);
   WM_RBUTTONDBLCLK:
    begin
      ViewOnDblClick(LinkedViewport);
      with TWMMouse(Msg) do
       Propagate := ViewOnMouseDown(LinkedViewport, mbRight, KeysToShiftState(Keys), XPos, YPos);
    end;
   WM_LBUTTONDBLCLK:
    begin
      ViewOnDblClick(LinkedViewport);
      with TWMMouse(Msg) do
       Propagate := ViewOnMouseDown(LinkedViewport, mbLeft, KeysToShiftState(Keys), XPos, YPos);
    end;
   WM_KEYDOWN:
    with TWMKeyDown(Msg) do
     Propagate := ViewOnKeyDown(LinkedViewport, CharCode, KeyDataToShiftState(KeyData));
   WM_KEYUP:
    with TWMKeyUp(Msg) do
     Propagate := ViewOnKeyUp(LinkedViewport, CharCode, KeyDataToShiftState(KeyData));
   end;
  LastSet := fLinkedViewport.DisableMouseEvents;
  try
    fLinkedViewport.DisableMouseEvents := not Propagate;
    Msg.Result := CallWindowProc(fOldWndProc, fLinkedViewport.Handle, Msg.Msg, Msg.WParam, Msg.LParam);
  finally
    fLinkedViewport.DisableMouseEvents := LastSet;
  end;
end;

function TCADPrg.StartOperation(const StartState: TCADStateClass; Param: TCADPrgParam): Boolean;
var
  NewNext: TCADStateClass;
  TmpBool: Boolean;
begin
  Result := False;
  if not Assigned(fLinkedViewport) then
   Exit;
  if fLinkedViewport.InRepainting then
   fLinkedViewport.WaitForRepaintEnd;
  if fIsSuspended then
   Exit;
  if fIsBusy then
   StopOperation;
  fIsBusy := (StartState <> fDefaultState);
  NewNext := StartState;
  fCurrentOperation := StartState;
  if Assigned(fOnStart) then
   fOnStart(Self, fCurrentOperation, Param);
  TmpBool := True;
  repeat
    if (StartState <> fDefaultState) and (NewNext = fDefaultState) then
     begin
       if Assigned(fOnEndOperation) then
        fOnEndOperation(Self, fCurrentOperation, fCurrentState.fParam);
       GoToDefaultState(nil, nil);
       Break;
     end;
    fCurrentState.Free;
    fCurrentState := nil;
    try
      fCurrentState := NewNext.Create(Self, Param, NewNext);
      if fCurrentState.ClassType = StartState then
       TmpBool := fCurrentState.CanBeSuspended; // e' il primo stato a det. la sospendibilità
      fCurrentState.CanBeSuspended := TmpBool;
    except
      Reset;
      Break;
    end;
    Param := fCurrentState.fParam;
    if Assigned(fOnEntState) then
     fOnEntState(Self, fCurrentState);
  until not Assigned(NewNext);
  Result := True;
end;

procedure TCADPrg.StopOperation;
begin
  if not fIsBusy or (fCurrentState = nil) then
   Exit;
  fCurrentState.OnStop;
  GoToDefaultState(fCurrentState.ClassType, fCurrentState.Param);
  if Assigned(fOnStop) then
   fOnStop(Self, fCurrentOperation, nil);
end;

procedure TCADPrg.Reset;
begin
  if Assigned(fCurrentState) then
   begin
     fIgnoreEvents := False;
     fCurrentState.OnStop;
     GoToDefaultState(fCurrentState.ClassType, fCurrentState.Param)
   end
  else
   GoToDefaultState(nil, nil)
end;

function TCADPrg.SuspendOperation(const StartState: TCADStateClass; Param: TCADPrgParam): Boolean;
var
  NewNext: TCADStateClass;
  TmpBool: Boolean;
begin
  Result := False;
  if fIsSuspended then
   Exit;
  if not CurrentState.CanBeSuspended then
   Exit;
  if not fIsBusy then
   begin
     StartOperation(StartState, Param);
     Exit;
   end;
  if fLinkedViewport.InRepainting then
   fLinkedViewport.WaitForRepaintEnd;
  fSuspendedState := CurrentState;
  fSuspendedOperation := fCurrentOperation;
  fIsSuspended := True;
  if not Assigned(Param) then
   Param := fSuspendedState.fParam;
  NewNext := StartState;
  TmpBool := True;
  repeat
    if (StartState <> fDefaultState) and (NewNext = fDefaultState) then
     begin
       GoToDefaultState(StartState, Param);
       Break;
     end;
    if fCurrentState <> fSuspendedState then
     fCurrentState.Free;
    fCurrentState := nil;
    try
      fCurrentState := NewNext.Create(Self, Param, NewNext);
      if fCurrentState.ClassType = StartState then
       TmpBool := fCurrentState.CanBeSuspended; // e' il primo stato a det. la sospendibilità
      fCurrentState.CanBeSuspended := TmpBool;
    except
      Reset;
      Break;
    end;
    Param := fCurrentState.fParam;
    if Assigned(fOnEntState) then
     fOnEntState(Self, fCurrentState);
  until not Assigned(NewNext);
  Result := True;
end;

procedure TCADPrg.SendUserEvent(const Code: Word);
begin
  if not Assigned(fLinkedViewport) then Exit;
  try
   SendEvent(ceUserDefined, cmbNone, [], Code);
  except
   Reset;
  end;
end;

procedure TCADPrg.SendCADEvent(Event: TCADPrgEvent; MouseButton: TMouseButton; Shift: TShiftState; Key: Word);
var
  Button: TCS4MouseButton;
begin
  if MouseButton = mbLeft then
   Button := cmbLeft
  else if MouseButton = mbRight then
   Button := cmbRight
  else if MouseButton = mbMiddle then
   Button := cmbMiddle
  else
   Button := cmbNone;
  if not Assigned(fLinkedViewport) then Exit;
  try
   SendEvent(Event, Button, Shift, Key);
  except
   Reset;
  end;
end;

procedure TCADPrg.RepaintAfterOperation;
begin
  fMustRepaint := True;
  fRepaintRect := Rect2D(0.0, 0.0, 0.0, 0.0);
end;

procedure TCADPrg.RepaintRectAfterOperation(const ARect: TRect2D);
begin
  fMustRepaint := True;
  fRepaintRect := ARect;
end;

procedure TCADPrg.SetShowCursorCross(B: Boolean);
begin
  if fShowCursorCross <> B then
   begin
     fShowCursorCross := B;
     if not B then
      HideCursorCross;
   end;
end;

procedure TCADPrg.SetCursorColor(C: TColor);
begin
  if C = fCursorColor then
   Exit;
  if fShowCursorCross then
   DrawCursorCross;
  fCursorColor := C;
  if fShowCursorCross then
   DrawCursorCross;
end;

procedure TCADPrg.SetCentralColor(C: TColor);
begin
  if C = fCentralColor then
   Exit;
  if fShowCentralCross then
   DrawCentralCross;
  fCursorColor := C;
  if fShowCentralCross then
   DrawCentralCross;
end;

procedure TCADPrg.SetShowCentralCross(B: Boolean);
begin
  if fShowCentralCross <> B then
   begin
     fShowCentralCross := B;
     if not B then
      HideCentralCross;
   end;
end;

// =====================================================================
// TCADPrg2D
// =====================================================================

function TCADPrg2D.GetVPPoint: TPoint2D;
begin
  Result := fCurrentViewportPoint;
end;

procedure TCADPrg2D.SetVPPoint(const Pt: TPoint2D);
begin
  fCurrentViewportPoint := CartesianPoint2D(Pt);
end;

function TCADPrg2D.GetVPSnappedPoint: TPoint2D;
begin
  Result := GetVPPoint;
  if not UseSnap then
   Exit;
  with Result do
   begin
     if XSnap <> 0 then
      Result.X := Round(X / XSnap) * XSnap;
     if YSnap <> 0 then
      Result.Y := Round(Y / YSnap) * YSnap;
     Result.W := 1.0;
   end;
  if Assigned(fSnapFilter) then
   fSnapFilter(Self, CurrentState, fSnapOriginPoint, Result);
end;

function TCADPrg2D.ViewOnMouseMove(Sender: TObject; Shift: TShiftState; var X, Y: SmallInt): Boolean;
begin
  fCurrentViewportPoint := Viewport2D.ScreenToViewport(Point2D(X, Y));
  if Assigned(fMouseMoveFilter) then
   begin
     fMouseMoveFilter(Self, CurrentState, fCurrentViewportPoint, X, Y);
     if Assigned(Viewport2D.OnMouseMove2D) then
      // if there will be a friend directive like in C++, it will be better
      // to call the MouseMove handler directly :)
      Viewport2D.OnMouseMove2D(Sender, Shift, fCurrentViewportPoint.X, fCurrentViewportPoint.Y, X, Y);
     inherited ViewOnMouseMove(Sender, Shift, X, Y);
     Result := False;
   end
  else
   Result := inherited ViewOnMouseMove(Sender, Shift, X, Y);
end;

function TCADPrg2D.ViewOnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; var X, Y: SmallInt): Boolean;
begin
  fCurrentViewportPoint := Viewport2D.ScreenToViewport(Point2D(X, Y));
  if Assigned(fMouseButtonFilter) then
   begin
     fMouseButtonFilter(Self, CurrentState, Button, fCurrentViewportPoint, X, Y);
     if Assigned(Viewport2D.OnMouseDown2D) then
      // if there will be a friend directive like in C++, it will be better
      // to call the MouseMove handler directly :)
      Viewport2D.OnMouseDown2D(Sender, Button, Shift, fCurrentViewportPoint.X, fCurrentViewportPoint.Y, X, Y);
     inherited ViewOnMouseDown(Sender, Button, Shift, X, Y);
     Result := False;
   end
  else
   Result := inherited ViewOnMouseDown(Sender, Button, Shift, X, Y);
end;

function TCADPrg2D.ViewOnMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; var X, Y: SmallInt): Boolean;
begin
  fCurrentViewportPoint := Viewport2D.ScreenToViewport(Point2D(X, Y));
  if Assigned(fMouseButtonFilter) then
   begin
     fMouseButtonFilter(Self, CurrentState, Button, fCurrentViewportPoint, X, Y);
     if Assigned(Viewport2D.OnMouseUp2D) then
      // if there will be a friend directive like in C++, it will be better
      // to call the MouseMove handler directly :)
      Viewport2D.OnMouseUp2D(Sender, Button, Shift, fCurrentViewportPoint.X, fCurrentViewportPoint.Y, X, Y);
     inherited ViewOnMouseUp(Sender, Button, Shift, X, Y);
     Result := False;
   end
  else
   Result := inherited ViewOnMouseUp(Sender, Button, Shift, X, Y);
end;

function TCADPrg2D.GetViewport2D: TCADViewport2D;
begin
  Result := LinkedViewport as TCADViewport2D;
end;

procedure TCADPrg2D.SetViewport2D(View2D: TCADViewport2D);
begin
  LinkedViewport := View2D;
end;

constructor TCADPrg2D.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  XSnap := 10.0;
  YSnap := 10.0;
  fLastCursorPos := Point2D(0.0, 0.0);
  fSnapOriginPoint := Point2D(MaxCoord, MaxCoord);
end;

destructor TCADPrg2D.Destroy;
begin
  SetViewport2D(nil);
  inherited Destroy;
end;

procedure _DrawCursorCross2D(const Viewp: TCADViewport2D; const Pt: TPoint2D);
var
  ScrPt: TPoint;
begin
  with Viewp do
   begin
     ScrPt := Point2DToPoint(ViewportToScreen(Pt));
     Canvas.MoveTo(ScrPt.X, ClientRect.Top);
     Canvas.LineTo(ScrPt.X, ClientRect.Bottom);
     Canvas.MoveTo(ClientRect.Left, ScrPt.Y);
     Canvas.LineTo(ClientRect.Right, ScrPt.Y);
   end;
end;

procedure TCADPrg2D.DrawCursorCross;
begin
  if (not Assigned(Viewport))  or (Viewport.HandleAllocated = False) or (Viewport.InRepainting) then
   Exit;
  with Viewport2D do
   try
     Canvas.Pen.Mode := pmXOr;
     Canvas.Pen.Color := CursorColor xor BackGroundColor;
     Canvas.Pen.Style := psSolid;
     Canvas.Pen.Width := 1;
     _DrawCursorCross2D(Viewport2D, fLastCursorPos);
     fLastCursorPos := CurrentViewportSnappedPoint;
     _DrawCursorCross2D(Viewport2D, fLastCursorPos);
   except
   end;
end;

procedure TCADPrg2D.HideCursorCross;
begin
  if (not Assigned(Viewport))  or (Viewport.HandleAllocated = False)  or (Viewport.InRepainting) then
   Exit;
  with Viewport2D do
   try
     Canvas.Pen.Mode := pmXOr;
     Canvas.Pen.Color := CursorColor xor BackGroundColor;
     Canvas.Pen.Style := psSolid;
     Canvas.Pen.Width := 1;
     _DrawCursorCross2D(Viewport2D, fLastCursorPos);
   except
   end;
end;

procedure _DrawCentralCross2D(const Viewp: TCADViewport2D);
var
  ScrPt: TPoint;
begin
  with Viewp do
   begin
     OffScreenCanvas.MoveTo(0,(ClientRect.Bottom - ClientRect.Top) div 2);
     OffScreenCanvas.LineTo(ClientRect.Right,(ClientRect.Bottom - ClientRect.Top) div 2);
     OffScreenCanvas.MoveTo((ClientRect.Right - ClientRect.Left) div 2,0);
     OffScreenCanvas.MoveTo((ClientRect.right - ClientRect.Left) div 2,ClientRect.Bottom);
   end;
end;

procedure TCADPrg2D.DrawCentralCross;
begin
  if (not Assigned(Viewport))  or (Viewport.HandleAllocated = False) or (Viewport.InRepainting) then
   Exit;
  with Viewport2D.OffScreenCanvas do
   try
     Viewport2D.ShowCentralCross := True;
     Canvas.Pen.Mode := pmXOr;
     Canvas.Pen.Color := CentralColor xor Viewport2D.BackGroundColor;
     Canvas.Pen.Style := psSolid;
     Canvas.Pen.Width := 1;
     _DrawCentralCross2D(Viewport2D);
     fLastCursorPos := CurrentViewportSnappedPoint;
     _DrawCentralCross2D(Viewport2D);
   except
   end;
end;

procedure TCADPrg2D.HideCentralCross;
begin
  if (not Assigned(Viewport))  or (Viewport.HandleAllocated = False)  or (Viewport.InRepainting) then
   Exit;
  with Viewport2D.OffScreenCanvas do
   try
     Viewport2D.ShowCentralCross := False;
     Canvas.Pen.Mode := pmXOr;
     Canvas.Pen.Color := CursorColor xor Viewport2D.BackGroundColor;
     Canvas.Pen.Style := psSolid;
     Canvas.Pen.Width := 1;
     _DrawCentralCross2D(Viewport2D);
   except
   end;
end;

// =====================================================================
// TCADSysSynchroObject
// =====================================================================

procedure TCADSysSynchroObject.Acquire;
begin
end;

procedure TCADSysSynchroObject.Release;
begin
end;

// =====================================================================
// TCADSysCriticalSection
// =====================================================================

constructor TCADSysCriticalSection.Create;
begin
  inherited Create;
  InitializeCriticalSection(FSection);
end;

destructor TCADSysCriticalSection.Destroy;
begin
  DeleteCriticalSection(FSection);
  inherited Destroy;
end;

procedure TCADSysCriticalSection.Acquire;
begin
  EnterCriticalSection(FSection);
end;

procedure TCADSysCriticalSection.Release;
begin
  LeaveCriticalSection(FSection);
end;

procedure TCADSysCriticalSection.Enter;
begin
  Acquire;
end;

procedure TCADSysCriticalSection.Leave;
begin
  Release;
end;

initialization
//  CADSysInitClassRegister;

  CADSysRegisterClass(0, TContainer2D);
  CADSysRegisterClass(1, TSourceBlock2D);
  CADSysRegisterClass(2, TBlock2D);
finalization
end.

